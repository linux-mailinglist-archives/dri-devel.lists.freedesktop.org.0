Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA917958CB
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 09:48:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D8D36E630;
	Tue, 20 Aug 2019 07:48:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52AA66E630
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 07:48:17 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id j16so11288329wrr.8
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 00:48:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=H7DciBChVJm2OOS4yNWaNHUpMbDM4u25ZRTGyBd/5n4=;
 b=j5E4zDmHaL5SDou1GoFzm0obp5dGlJCAIsCNmrSbAfPZWC+iJlo2zx42FFKl74XjGi
 PJS/+CtYCJ2YtPuhpskD9uyCMNK51EAWsd/GpVVlYZTeizTeRKPzt3uvF4PJrV/hMVwc
 +dr8jouz+O0IRKx3YccipASLxNw4mpcKyx5iobbLJx8yE3dcj/VAdnZ5hzcOrIw4EEAh
 XamgaG23IwuvDoAszMA9Wg4swVS0ncMofcfOiyn3x99z2SF2dM6AXRIEIJisxkCAsUcJ
 FH9dpcP9YTc/5yld0ILV+gX+gluvjSbHukM9EVx64BvHXUzycUd4v3qsngLI4mCAzYBa
 Quxg==
X-Gm-Message-State: APjAAAXVOUc3mgoNhlQ28eUTBoN7mJ+qkUWHvanGiXLdgvDmmM9y087i
 1os7tDVUFrDQNrQJDCy+KU0RFg==
X-Google-Smtp-Source: APXvYqxfeJ6uEnMZE+em1RqPa4VCm/6eGig9eaXelkWOYRunGbFsk/LoJxEVu3VGMmic7QxgLr1qww==
X-Received: by 2002:a5d:4703:: with SMTP id y3mr34248617wrq.63.1566287295573; 
 Tue, 20 Aug 2019 00:48:15 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id v7sm1151750wrn.41.2019.08.20.00.48.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 20 Aug 2019 00:48:15 -0700 (PDT)
Subject: Re: [PATCH v7 3/9] dw-hdmi-cec: use cec_notifier_cec_adap_(un)register
From: Neil Armstrong <narmstrong@baylibre.com>
To: Dariusz Marcinkiewicz <darekm@google.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 hverkuil-cisco@xs4all.nl
References: <20190814104520.6001-1-darekm@google.com>
 <20190814104520.6001-4-darekm@google.com>
 <2ffa9973-014e-af7c-13ab-d255adf5a8c2@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <c5250388-0b49-ccf3-96d7-0b091de5a15b@baylibre.com>
Date: Tue, 20 Aug 2019 09:48:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2ffa9973-014e-af7c-13ab-d255adf5a8c2@baylibre.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:cc:references:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=H7DciBChVJm2OOS4yNWaNHUpMbDM4u25ZRTGyBd/5n4=;
 b=l+cQU7o0sFJKy+QvH/Cv+82e1X/ejSM86P6tjW+eEKJFXZHM2WpwT1zulo9TMFs+5z
 prHLTCISqTH/28St804CtH6VR/a/LDwFGhWxiguzmOEx33ArSjYAWnflsLJm07twHMLe
 Pgc174QZ4gNjVF2SKY8orfPWmQxF+Ds8P7VY6qvZ96bEtc+ZKxnkTLy+hsECM5Javx3K
 IjObQ9RdH+ZLIG4HxiNlkJ2XEkDUOFoxuZ0ZM0ZiwyAnExwGcK14kAzVKMsI4M2U5RUc
 fF/jcJ2bP7qO20nADzxHdGkx1qUWuXD8qO42h1oKEgEoe7Ih0nMlCl6QYwRlqnS4/eTA
 LbhA==
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTkvMDgvMjAxOSAxNjozNSwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gT24gMTQvMDgvMjAx
OSAxMjo0NSwgRGFyaXVzeiBNYXJjaW5raWV3aWN6IHdyb3RlOgo+PiBVc2UgdGhlIG5ldyBjZWNf
bm90aWZpZXJfY2VjX2FkYXBfKHVuKXJlZ2lzdGVyKCkgZnVuY3Rpb25zIHRvCj4+ICh1bilyZWdp
c3RlciB0aGUgbm90aWZpZXIgZm9yIHRoZSBDRUMgYWRhcHRlci4KPj4KPj4gQWxzbyBhZGRzIENF
Q19DQVBfQ09OTkVDVE9SX0lORk8gY2FwYWJpbGl0eSB0byB0aGUgYWRhcHRlci4KPj4KPj4gQ2hh
bmdlcyBzaW5jZSB2MzoKPj4gCS0gYWRkIENFQ19DQVBfQ09OTkVDVE9SX0lORk8gdG8gY2VjX2Fs
bG9jYXRlX2FkYXB0ZXIsCj4+IAktIHJlcGxhY2UgQ0VDX0NBUF9MT0dfQUREUlMgfCBDRUNfQ0FQ
X1RSQU5TTUlUIHwKPj4gCUNFQ19DQVBfUkMgfCBDRUNfQ0FQX1BBU1NUSFJPVUdIIHdpdGggQ0VD
X0NBUF9ERUZBVUxUUy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogRGFyaXVzeiBNYXJjaW5raWV3aWN6
IDxkYXJla21AZ29vZ2xlLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogSGFucyBWZXJrdWlsIDxodmVy
a3VpbC1jaXNjb0B4czRhbGwubmw+Cj4+IFRlc3RlZC1ieTogSGFucyBWZXJrdWlsIDxodmVya3Vp
bC1jaXNjb0B4czRhbGwubmw+Cj4+IC0tLQo+PiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5v
cHN5cy9kdy1oZG1pLWNlYy5jIHwgMTMgKysrKysrLS0tLS0tLQo+PiAgMSBmaWxlIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS1jZWMuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS1jZWMuYwo+PiBpbmRleCAwZjk0OTk3OGQzZmNkLi5h
YzFlMDAxZDA4ODI5IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9w
c3lzL2R3LWhkbWktY2VjLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5
cy9kdy1oZG1pLWNlYy5jCj4+IEBAIC0yNTYsOCArMjU2LDggQEAgc3RhdGljIGludCBkd19oZG1p
X2NlY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+PiAgCWR3X2hkbWlfd3Jp
dGUoY2VjLCAwLCBIRE1JX0NFQ19QT0xBUklUWSk7Cj4+ICAKPj4gIAljZWMtPmFkYXAgPSBjZWNf
YWxsb2NhdGVfYWRhcHRlcigmZHdfaGRtaV9jZWNfb3BzLCBjZWMsICJkd19oZG1pIiwKPj4gLQkJ
CQkJIENFQ19DQVBfTE9HX0FERFJTIHwgQ0VDX0NBUF9UUkFOU01JVCB8Cj4+IC0JCQkJCSBDRUNf
Q0FQX1JDIHwgQ0VDX0NBUF9QQVNTVEhST1VHSCwKPj4gKwkJCQkJIENFQ19DQVBfREVGQVVMVFMg
fAo+PiArCQkJCQkgQ0VDX0NBUF9DT05ORUNUT1JfSU5GTywKPj4gIAkJCQkJIENFQ19NQVhfTE9H
X0FERFJTKTsKPj4gIAlpZiAoSVNfRVJSKGNlYy0+YWRhcCkpCj4+ICAJCXJldHVybiBQVFJfRVJS
KGNlYy0+YWRhcCk7Cj4+IEBAIC0yNzgsMTMgKzI3OCwxNCBAQCBzdGF0aWMgaW50IGR3X2hkbWlf
Y2VjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+ICAJaWYgKHJldCA8IDAp
Cj4+ICAJCXJldHVybiByZXQ7Cj4+ICAKPj4gLQljZWMtPm5vdGlmeSA9IGNlY19ub3RpZmllcl9n
ZXQocGRldi0+ZGV2LnBhcmVudCk7Cj4+ICsJY2VjLT5ub3RpZnkgPSBjZWNfbm90aWZpZXJfY2Vj
X2FkYXBfcmVnaXN0ZXIocGRldi0+ZGV2LnBhcmVudCwKPj4gKwkJCQkJCSAgICAgTlVMTCwgY2Vj
LT5hZGFwKTsKPj4gIAlpZiAoIWNlYy0+bm90aWZ5KQo+PiAgCQlyZXR1cm4gLUVOT01FTTsKPj4g
IAo+PiAgCXJldCA9IGNlY19yZWdpc3Rlcl9hZGFwdGVyKGNlYy0+YWRhcCwgcGRldi0+ZGV2LnBh
cmVudCk7Cj4+ICAJaWYgKHJldCA8IDApIHsKPj4gLQkJY2VjX25vdGlmaWVyX3B1dChjZWMtPm5v
dGlmeSk7Cj4+ICsJCWNlY19ub3RpZmllcl9jZWNfYWRhcF91bnJlZ2lzdGVyKGNlYy0+bm90aWZ5
KTsKPj4gIAkJcmV0dXJuIHJldDsKPj4gIAl9Cj4+ICAKPj4gQEAgLTI5NCw4ICsyOTUsNiBAQCBz
dGF0aWMgaW50IGR3X2hkbWlfY2VjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
Cj4+ICAJICovCj4+ICAJZGV2bV9yZW1vdmVfYWN0aW9uKCZwZGV2LT5kZXYsIGR3X2hkbWlfY2Vj
X2RlbCwgY2VjKTsKPj4gIAo+PiAtCWNlY19yZWdpc3Rlcl9jZWNfbm90aWZpZXIoY2VjLT5hZGFw
LCBjZWMtPm5vdGlmeSk7Cj4+IC0KPj4gIAlyZXR1cm4gMDsKPj4gIH0KPj4gIAo+PiBAQCAtMzAz
LDggKzMwMiw4IEBAIHN0YXRpYyBpbnQgZHdfaGRtaV9jZWNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpCj4+ICB7Cj4+ICAJc3RydWN0IGR3X2hkbWlfY2VjICpjZWMgPSBwbGF0
Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsKPj4gIAo+PiArCWNlY19ub3RpZmllcl9jZWNfYWRhcF91
bnJlZ2lzdGVyKGNlYy0+bm90aWZ5KTsKPj4gIAljZWNfdW5yZWdpc3Rlcl9hZGFwdGVyKGNlYy0+
YWRhcCk7Cj4+IC0JY2VjX25vdGlmaWVyX3B1dChjZWMtPm5vdGlmeSk7Cj4+ICAKPj4gIAlyZXR1
cm4gMDsKPj4gIH0KPj4KPiAKPiBSZXZpZXdlZC1ieTogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJv
bmdAYmF5bGlicmUuY29tPgo+IAoKQXBwbHlpbmcgdG8gZHJtLW1pc2MtbmV4dApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
