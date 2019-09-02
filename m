Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B29A531E
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 11:42:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34D168982C;
	Mon,  2 Sep 2019 09:42:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D20278982C
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 09:42:40 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id n2so12468464wmk.4
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 02:42:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=zF4AO/85szZSoAS5TjK4OSgeMooVOP2OGN/ZLZMPGT0=;
 b=QmkCPY68HHrEYvx+gIGrrf1P11vXl2tWhlitl8bQqEbx/otHwHHX4i8UCAoxpo1Grc
 914B+Xdwn6+TNgIVvRO2+CKUwXfJ01k4jaXjFyaRrZARB5ko2h0rwMSEN3JbH32h+0RQ
 kCn3hTv2fTqLwI44nVIUtmrKyvgMhuItOBSylrWTQS3knx8i6ifeek6/tfkuvIccHZC0
 PBg4/vtKR1F8IbaOtlPqVBE6RR0vhrctE39cNlU5+hbgVStITL6GoNSGvK5qcHZrYzmd
 j0NeuIx5+9jwio+bkBw/3NQQO4kxPVF2wtDH6L6mgdA2zmjAiTLd70w5+1lmNVjgHWmX
 FR1A==
X-Gm-Message-State: APjAAAVthTB96+SPAqMDaStsSC5uV6HqgbBbI3V+hpSd0+TCefpHs1G5
 hZrsdxvdvKqPuyl/xL2ide4c3g==
X-Google-Smtp-Source: APXvYqwJIsPbaROmt1d3bnUfs9QkxuhxmuyWN7kAJPOe5L4lfPhETft0BsyWy1zD9RpGeiRNvjmIdA==
X-Received: by 2002:a05:600c:305:: with SMTP id
 q5mr20158489wmd.141.1567417359306; 
 Mon, 02 Sep 2019 02:42:39 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id w13sm33209651wre.44.2019.09.02.02.42.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 02 Sep 2019 02:42:38 -0700 (PDT)
Subject: Re: [PATCH v2] drm: dw-hdmi-i2s: enable audio clock in audio_startup
To: Cheng-Yi Chiang <cychiang@chromium.org>, linux-kernel@vger.kernel.org
References: <20190902035435.44463-1-cychiang@chromium.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <241fd791-3792-34c8-ac35-a81a0a41070c@baylibre.com>
Date: Mon, 2 Sep 2019 11:42:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190902035435.44463-1-cychiang@chromium.org>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=zF4AO/85szZSoAS5TjK4OSgeMooVOP2OGN/ZLZMPGT0=;
 b=XA1e5GIOUu2NUFJwmZhtAyhgQbW4RnV4Cak9Wb1tvGNRavvX2OVfo4Wj6PjsKwYc9y
 SMqgbDiL0ZMvYUk9mqm8mm4ul2rnEtRihnth4hGJsf01+WUlgnjiVwTkNkWPrKqPnbqm
 +NZX3waL3ubKr8DPw/WI8fEk600Pcr60vdeo6oM2NHu6/CemjeVkww8coHvgYxHgkE1o
 PEQ6qdfnTHmq7l+MCFZfH46C/CI508AGKfvwzd8wBIRZXmKRyl8sqsxvjzWyj58/zUeb
 KJX5ECGWZbyc9RMbMcvOK2km1EzDx4IlXpExnFceVKJOv3en0+0XIA3+Q2zt5DtKCZeU
 Ti9Q==
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
Cc: alsa-devel@alsa-project.org, tzungbi@chromium.org, zhengxing@rock-chips.com,
 kuninori.morimoto.gx@renesas.com, linux-rockchip@lists.infradead.org,
 airlied@linux.ie, jeffy.chen@rock-chips.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, cain.cai@rock-chips.com,
 Jonas Karlman <jonas@kwiboo.se>, eddie.cai@rock-chips.com,
 Laurent.pinchart@ideasonboard.com, enric.balletbo@collabora.com,
 dgreid@chromium.org, sam@ravnborg.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAwMi8wOS8yMDE5IDA1OjU0LCBDaGVuZy1ZaSBDaGlhbmcgd3JvdGU6Cj4gSW4gdGhl
IGRlc2lnbndhcmUgZGF0YWJvb2ssIHRoZSBzZXF1ZW5jZSBvZiBlbmFibGluZyBhdWRpbyBjbG9j
ayBhbmQKPiBzZXR0aW5nIGZvcm1hdCBpcyBub3QgY2xlYXJseSBzcGVjaWZpZWQuCj4gQ3VycmVu
dGx5LCBhdWRpbyBjbG9jayBpcyBlbmFibGVkIGluIHRoZSBlbmQgb2YgaHdfcGFyYW0gb3BzIGFm
dGVyCj4gc2V0dGluZyBmb3JtYXQuCj4gCj4gT24gc29tZSBtb25pdG9ycywgdGhlcmUgaXMgYSBw
b3NzaWJpbGl0eSB0aGF0IGF1ZGlvIGRvZXMgbm90IGNvbWUgb3V0Lgo+IEZpeCB0aGlzIGJ5IGVu
YWJsaW5nIGF1ZGlvIGNsb2NrIGluIGF1ZGlvX3N0YXJ0dXAgb3BzCj4gYmVmb3JlIGh3X3BhcmFt
IG9wcyBzZXR0aW5nIGZvcm1hdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaGVuZy1ZaSBDaGlhbmcg
PGN5Y2hpYW5nQGNocm9taXVtLm9yZz4KPiBSZXZpZXdlZC1ieTogRG91Z2xhcyBBbmRlcnNvbiA8
ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgo+IFJldmlld2VkLWJ5OiBKb25hcyBLYXJsbWFuIDxqb25h
c0Brd2lib28uc2U+Cj4gVGVzdGVkLWJ5OiBEb3VnbGFzIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJv
bWl1bS5vcmc+Cj4gLS0tCj4gIENoYW5nZXMgZnJvbSB2MToKPiAgMS4gTW92ZSBhdWRpb19zdGFy
dHVwIHRvIHRoZSBmcm9udCBvZiBhdWRpb19zaHV0ZG93bi4KPiAgMi4gRml4IHRoZSBpbmRlbnRh
dGlvbiBvZiBhdWRpb19zdGFydHVwIGVxdWFsIHNpZ24gdXNpbmcgdGFiLgo+ICAzLiBSZWJhc2Ug
dGhlIHBhdGNoIG9uIGxpbnV4LW5leHQvbWFzdGVyLgo+ICA0LiBBZGQgUmV2aWV3ZWQtYnkgYW5k
IFRlc3RlZC1ieSBmaWVsZHMgZnJvbSBkaWFuZGVyc0BjaHJvbWl1bS5vcmcuCj4gIDUuIEFkZCBS
ZXZpZXdlZC1ieSBmaWVsZCBmcm9tIGpvbmFzQGt3aWJvby5zZS4KPiAKPiAgZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLWkycy1hdWRpby5jIHwgOSArKysrKysrKysKPiAg
MSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWktaTJzLWF1ZGlvLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWktaTJzLWF1ZGlvLmMKPiBpbmRleCAxZDE1Y2Y5
YjY4MjEuLjM0ZDhlODM3NTU1ZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3N5bm9wc3lzL2R3LWhkbWktaTJzLWF1ZGlvLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3N5bm9wc3lzL2R3LWhkbWktaTJzLWF1ZGlvLmMKPiBAQCAtMTA5LDYgKzEwOSwxNCBAQCBz
dGF0aWMgaW50IGR3X2hkbWlfaTJzX2h3X3BhcmFtcyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQg
KmRhdGEsCj4gIAloZG1pX3dyaXRlKGF1ZGlvLCBjb25mMCwgSERNSV9BVURfQ09ORjApOwo+ICAJ
aGRtaV93cml0ZShhdWRpbywgY29uZjEsIEhETUlfQVVEX0NPTkYxKTsKPiAgCj4gKwlyZXR1cm4g
MDsKPiArfQo+ICsKPiArc3RhdGljIGludCBkd19oZG1pX2kyc19hdWRpb19zdGFydHVwKHN0cnVj
dCBkZXZpY2UgKmRldiwgdm9pZCAqZGF0YSkKPiArewo+ICsJc3RydWN0IGR3X2hkbWlfaTJzX2F1
ZGlvX2RhdGEgKmF1ZGlvID0gZGF0YTsKPiArCXN0cnVjdCBkd19oZG1pICpoZG1pID0gYXVkaW8t
PmhkbWk7Cj4gKwo+ICAJZHdfaGRtaV9hdWRpb19lbmFibGUoaGRtaSk7Cj4gIAo+ICAJcmV0dXJu
IDA7Cj4gQEAgLTE1Myw2ICsxNjEsNyBAQCBzdGF0aWMgaW50IGR3X2hkbWlfaTJzX2dldF9kYWlf
aWQoc3RydWN0IHNuZF9zb2NfY29tcG9uZW50ICpjb21wb25lbnQsCj4gIAo+ICBzdGF0aWMgc3Ry
dWN0IGhkbWlfY29kZWNfb3BzIGR3X2hkbWlfaTJzX29wcyA9IHsKPiAgCS5od19wYXJhbXMJPSBk
d19oZG1pX2kyc19od19wYXJhbXMsCj4gKwkuYXVkaW9fc3RhcnR1cCAgPSBkd19oZG1pX2kyc19h
dWRpb19zdGFydHVwLAo+ICAJLmF1ZGlvX3NodXRkb3duCT0gZHdfaGRtaV9pMnNfYXVkaW9fc2h1
dGRvd24sCj4gIAkuZ2V0X2VsZAk9IGR3X2hkbWlfaTJzX2dldF9lbGQsCj4gIAkuZ2V0X2RhaV9p
ZAk9IGR3X2hkbWlfaTJzX2dldF9kYWlfaWQsCj4gCkxvb2tzIHNhbmUsIEpvbmFzIHNob3VsZCBJ
IGFwcGx5IGl0IG5vdyBpdCdzIHJlYmFzZWQgPwoKTmVpbApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
