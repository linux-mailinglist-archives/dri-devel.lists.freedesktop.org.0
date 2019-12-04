Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CC81129C8
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 12:01:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AA826E8A2;
	Wed,  4 Dec 2019 11:01:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76FAF6E8A2
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 11:00:59 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id p9so6550249wmg.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2019 03:00:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=QnIhpOYmCEAIrer4XWZAO5sGTMpq02ggZvg3MH08SeI=;
 b=Eu0u3ldf1J3e87cqD9heAQk5KC7CRPsx0hjvUQd9DcCWv/nwWxLs2dyMO/NYwOwhaF
 ONJHOGdhxwn+Vq7qrG9DCyP05X2O1lq6sNaT4FmGJvvPJS9hpr3ysXKOMaFoLFm/7+AQ
 rTl3NEHuSuC7EExgL5+YrZe7GwwQxu2DaSyrqallfP89HcTZqRsXgj/xPeAkSJAAh5tk
 LSofZlCnG3pxogM1BIFCQnrdFs87liK9QYRJWjMl6CmtXArxg108HN++kQ3kypkw0ZJs
 BlFMLuS20UbKHRzgHMsf9goeMjtDH4+8zxaBecZLe4qwuuQX3OswQToXoOdrE/WwT+jy
 t82w==
X-Gm-Message-State: APjAAAWLHvPVEOJ590SJ3b5AR7FID31Wz1P3llL49Kk1nMsLxhuUp/j5
 7Xoi5lmm6lNUMfEVTc1WLnVU6A==
X-Google-Smtp-Source: APXvYqwGc+aMR4JRWHbsU46n7zC/rjKGVaVDyyMxEZTRLETZxazquJk54AXv+Okw9TuCsrvoJiXLuA==
X-Received: by 2002:a1c:e909:: with SMTP id q9mr1971733wmc.30.1575457257862;
 Wed, 04 Dec 2019 03:00:57 -0800 (PST)
Received: from [10.1.2.12] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id k20sm5930187wmj.10.2019.12.04.03.00.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 04 Dec 2019 03:00:57 -0800 (PST)
Subject: Re: [PATCH] drm: meson: venc: cvbs: fix CVBS mode matching
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
References: <20191130222555.2005375-1-martin.blumenstingl@googlemail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <9c8b4ea4-3d79-9a88-3b13-2d88829e51aa@baylibre.com>
Date: Wed, 4 Dec 2019 12:00:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191130222555.2005375-1-martin.blumenstingl@googlemail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=QnIhpOYmCEAIrer4XWZAO5sGTMpq02ggZvg3MH08SeI=;
 b=kkzbAsRTCeOGxz9gSsaDgsmcHbyNHjRScmhGTDSxvUuuoJr9SAXEkiq7rjKRLEpQbx
 MPaNTSAhbhvclTVQ24qTygoRXmUYMXZKrOGCAj6E5ukZtLDWdzJ11d1TRcHodXGpINC9
 x5oxbDQ8ozrGUzheQc7TYCSvEMNx1SeFt7kwoaeso/xzOKOHvD6kLnPXobDEB9NTp6Bs
 DO1KKAVl3VK5EM+PRS3XEnNuwNt7bnkUm4lRQNo5ckfD5EwbEwBk/15+CuRhWjQ55hBb
 7ux/yJ3PMTxqXGQ7M7U6hAkBLmgCZ3U8I/xgDiU+MU48BeH/vaaf9Fqk8R2lvx3/sZDE
 ddKA==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: airlied@linux.ie, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWFydGluLAoKT24gMzAvMTEvMjAxOSAyMzoyNSwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90
ZToKPiBEcm9wIHRoZSBwaWN0dXJlX2FzcGVjdF9yYXRpbyBmcm9tIHRoZSBkcm1fZGlzcGxheV9t
b2RlcyB3aGljaCBhcmUgdmFsaWQKPiBmb3IgdGhlIEFtbG9naWMgTWVzb24gQ1ZCUyBlbmNvZGVy
LiBtZXNvbl92ZW5jX2N2YnNfZW5jb2Rlcl9hdG9taWNfY2hlY2sKPiBhbmQgbWVzb25fdmVuY19j
dmJzX2VuY29kZXJfbW9kZV9zZXQgb25seSBzdXBwb3J0IHR3byB2ZXJ5IHNwZWNpZmljCj4gZHJt
X2Rpc3BsYXlfbW9kZXMuCj4gCj4gV2l0aCBjb21taXQgMjIyZWMxNjE4YzNhY2UgKCJkcm06IEFk
ZCBhc3BlY3QgcmF0aW8gcGFyc2luZyBpbiBEUk0KPiBsYXllciIpIHRoZSBkcm0gY29yZSBzdGFy
dGVkIGhvbm9yaW5nIHRoZSBwaWN0dXJlX2FzcGVjdF9yYXRpbyBmaWVsZAo+IHdoZW4gY29tcGFy
aW5nIHR3byBkcm1fZGlzcGxheV9tb2Rlcy4gUHJpb3IgdG8gdGhhdCBpdCB3YXMgaWdub3JlZC4K
PiBXaGVuIHRoZSBDVkJTIGVuY29kZXIgZHJpdmVyIHdhcyBpbml0aWFsbHkgc3VibWl0dGVkIHRo
ZXJlIHdhcyBubyBhc3BlY3QKPiByYXRpbyBjaGVjay4KPiAKPiBUaGlzIHBhdGNoIGZpeGVzICJr
bXNjdWJlIiBhbmQgWC5vcmcgb3V0cHV0IHVzaW5nIHRoZSBDVkJTIGNvbm5lY3Rvcgo+IHdpdGgg
dGhlIEFtbG9naWMgTWVzb24gVlBVIGRyaXZlci4gUHJpb3IgdG8gdGhpcyBwYXRjaCBrbXNjdWJl
IHJlcG9ydGVkOgo+ICAgZmFpbGVkIHRvIHNldCBtb2RlOiBJbnZhbGlkIGFyZ3VtZW50Cj4gQWRk
aXRpb25hbGx5IGl0IG1ha2VzIHRoZSBDVkJTIG1vZGUgY2hlY2tpbmcgYmVoYXZlIGlkZW50aWNh
bCB0byB0aGUKPiBzdW40aSAoZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX3R2LmMgc3VuNGlf
dHZfbW9kZV90b19kcm1fbW9kZSkgYW5kCj4gWlRFIChkcml2ZXJzL2dwdS9kcm0venRlL3p4X3R2
ZW5jLmMgdHZlbmNfbW9kZV97cGFsLG50c2N9KSB3aGljaCBhcmUKPiBib3RoIG5vdCBzZXR0aW5n
ICJwaWN0dXJlX2FzcGVjdF9yYXRpbyIgZWl0aGVyLgo+IAo+IEZpeGVzOiAyMjJlYzE2MThjM2Fj
ZSAoImRybTogQWRkIGFzcGVjdCByYXRpbyBwYXJzaW5nIGluIERSTSBsYXllciIpCj4gRml4ZXM6
IGJiYmU3NzVlYzViNWRhICgiZHJtOiBBZGQgc3VwcG9ydCBmb3IgQW1sb2dpYyBNZXNvbiBHcmFw
aGljIENvbnRyb2xsZXIiKQo+IFNpZ25lZC1vZmYtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1h
cnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9tZXNvbi9tZXNvbl92ZW5jX2N2YnMuYyB8IDIgLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92
ZW5jX2N2YnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92ZW5jX2N2YnMuYwo+IGlu
ZGV4IDlhYjI3YWVjZmNmMy4uMmRkY2RhOGZhNWIwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9tZXNvbi9tZXNvbl92ZW5jX2N2YnMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNv
bi9tZXNvbl92ZW5jX2N2YnMuYwo+IEBAIC00OSw3ICs0OSw2IEBAIHN0cnVjdCBtZXNvbl9jdmJz
X21vZGUgbWVzb25fY3Zic19tb2Rlc1tNRVNPTl9DVkJTX01PREVTX0NPVU5UXSA9IHsKPiAgCQkJ
CSA3MjAsIDczMiwgNzk1LCA4NjQsIDAsIDU3NiwgNTgwLCA1ODYsIDYyNSwgMCwKPiAgCQkJCSBE
Uk1fTU9ERV9GTEFHX0lOVEVSTEFDRSksCj4gIAkJCS52cmVmcmVzaCA9IDUwLAo+IC0JCQkucGlj
dHVyZV9hc3BlY3RfcmF0aW8gPSBIRE1JX1BJQ1RVUkVfQVNQRUNUXzRfMywKPiAgCQl9LAo+ICAJ
fSwKPiAgCXsgLyogTlRTQyAqLwo+IEBAIC01OSw3ICs1OCw2IEBAIHN0cnVjdCBtZXNvbl9jdmJz
X21vZGUgbWVzb25fY3Zic19tb2Rlc1tNRVNPTl9DVkJTX01PREVTX0NPVU5UXSA9IHsKPiAgCQkJ
CTcyMCwgNzM5LCA4MDEsIDg1OCwgMCwgNDgwLCA0ODgsIDQ5NCwgNTI1LCAwLAo+ICAJCQkJRFJN
X01PREVfRkxBR19JTlRFUkxBQ0UpLAo+ICAJCQkudnJlZnJlc2ggPSA2MCwKPiAtCQkJLnBpY3R1
cmVfYXNwZWN0X3JhdGlvID0gSERNSV9QSUNUVVJFX0FTUEVDVF80XzMsCj4gIAkJfSwKPiAgCX0s
Cj4gIH07Cj4gCgpUaGFua3MgZm9yIGZpbmRpbmcgdGhpcyBpc3N1ZSAhIQoKSSB3b3VsZCByYXRo
ZXIgcHJlZmVyIGNoYW5naW5nIHRoZSBkcm1fbW9kZV9lcXVhbCB0byBkcm1fbW9kZV9tYXRjaCB3
aXRob3V0IERSTV9NT0RFX01BVENIX0FTUEVDVF9SQVRJTy4KCk5laWwKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
