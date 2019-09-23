Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A67BB5CC
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 15:53:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D92D96E91A;
	Mon, 23 Sep 2019 13:53:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80E5D6E91A
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 13:53:22 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id a11so14113340wrx.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 06:53:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=CUltmpQ2AlBO4eycXmiTLJT5nKA9BvVkulNXtb0WayY=;
 b=S3p/nhalcTlLxDPBU5EvrUkpLaI/mw0yzpDYo7dXIpZlDMnbQ4FcwrTQ30qSvftY3l
 VlszZaKyCzJLpB1f5Zqexvd58eY1ONqJIcGxL+ezGfRXs/smS1JWISG84TgMSoVhDA3G
 GGcEA90ptCABp/rc1lxxDLIv2v3ZYBA/cMESLsNp7zMuqNo478LkIPO5sNyMFiexn27+
 0fRhjPDPavnrAqZjxnH4wdIuR+wHYDO+23ndW7BxOiiyCc96FQMBbMUd1wZ1uB/hqtPN
 GEo2D7q1Tu2Uyp4si+/DyVP5xwb6jib3zkrBzfBKITc/4+E5GKF6+ze5+Dvn0uM50Mg/
 KW4A==
X-Gm-Message-State: APjAAAV4adugZNAZ5xWwsKZRLWpSCEDRFYQBMEoObG+CKOYr3D0mwugh
 e9qtKeIM3mJNEhJGhLp4VgxVCw==
X-Google-Smtp-Source: APXvYqzZx/ovJxMoA6feQzS2sGuSyT/hsoukqIzidanssroKWlBydFpyilC/dlz7CJPlMtXIcE1bBw==
X-Received: by 2002:adf:f081:: with SMTP id n1mr22383279wro.273.1569246800846; 
 Mon, 23 Sep 2019 06:53:20 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id t123sm14627323wma.40.2019.09.23.06.53.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 23 Sep 2019 06:53:20 -0700 (PDT)
Subject: Re: [PATCH] drm/rockchip: Add AFBC support
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20190923122014.18229-1-andrzej.p@collabora.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <da7f0c5e-9ca9-020d-5366-2b21a42acdff@baylibre.com>
Date: Mon, 23 Sep 2019 15:53:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190923122014.18229-1-andrzej.p@collabora.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=CUltmpQ2AlBO4eycXmiTLJT5nKA9BvVkulNXtb0WayY=;
 b=hdBdcqWbo+YdpT++zSZaEJialEDIstyafYV7j1YnJzpDs6Gj0EXlF7fW98kUlywpKV
 MiFP1HlOHMn91oNXbci+8ViuGco8KKXEEC6GYBnxW+XwEqeVXEF2k5Vst9DcAv2jCNnj
 25TkRNP+yvhFZk4uiSTE929IIzqSAJP/cWNzzWxo9xQVexYFwHM21MH+thDJwO0QYjlf
 ZWCf/jWeS/SDRYNtYcNSy8LsDpcQ+P5yPH5iwvxUncOfYRoSQyEo2Ht/ji0T0mchIki9
 //SAK3HjU5+Q5yGHeHtmhqXXjfgPaRH28GvJxVwriOILlFhIag2gbKz+uGyTKNxo7UXo
 KT4g==
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 Ezequiel Garcia <ezequiel@collabora.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, linux-rockchip@lists.infradead.org,
 kernel@collabora.com, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjMvMDkvMjAxOSAxNDoyMCwgQW5kcnplaiBQaWV0cmFzaWV3aWN6IHdyb3RlOgo+IEZyb206
IEV6ZXF1aWVsIEdhcmNpYSA8ZXplcXVpZWxAY29sbGFib3JhLmNvbT4KPiAKPiBBRkJDIGlzIGEg
cHJvcHJpZXRhcnkgbG9zc2xlc3MgaW1hZ2UgY29tcHJlc3Npb24gcHJvdG9jb2wgYW5kIGZvcm1h
dC4KPiBJdCBoZWxwcyByZWR1Y2UgbWVtb3J5IGJhbmR3aWR0aCBvZiB0aGUgZ3JhcGhpY3MgcGlw
ZWxpbmUgb3BlcmF0aW9ucy4KPiBUaGlzLCBpbiB0dXJuLCBpbXByb3ZlcyBwb3dlciBlZmZpY2ll
bmN5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEV6ZXF1aWVsIEdhcmNpYSA8ZXplcXVpZWxAY29sbGFi
b3JhLmNvbT4KPiBbbG9ja2luZyBpbXByb3ZlbWVudHNdCj4gU2lnbmVkLW9mZi1ieTogVG9tZXUg
Vml6b3NvIDx0b21ldS52aXpvc29AY29sbGFib3JhLmNvbT4KPiBbc3F1YXNoaW5nIHRoZSBhYm92
ZSwgY29tbWl0IG1lc3NhZ2UgYW5kIFJvY2tjaGlwIEFGQkMgbW9kaWZpZXJdCj4gU2lnbmVkLW9m
Zi1ieTogQW5kcnplaiBQaWV0cmFzaWV3aWN6IDxhbmRyemVqLnBAY29sbGFib3JhLmNvbT4KPiAt
LS0KPiAgZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV9mYi5jICB8IDI3ICsr
KysrKwo+ICBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5jIHwgOTQg
KysrKysrKysrKysrKysrKysrKystCj4gIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hp
cF9kcm1fdm9wLmggfCAxMiArKysKPiAgZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlw
X3ZvcF9yZWcuYyB8IDE4ICsrKysKPiAgaW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNjLmggICAg
ICAgICAgICAgICB8ICAzICsKPiAgNSBmaWxlcyBjaGFuZ2VkLCAxNTEgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKPiAKClsuLi5dCgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJt
L2RybV9mb3VyY2MuaCBiL2luY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oCj4gaW5kZXggM2Zl
ZWFhM2Y5ODdhLi5iYTZjYWYwNmM4MjQgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS91YXBpL2RybS9k
cm1fZm91cmNjLmgKPiArKysgYi9pbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaAo+IEBAIC03
NDIsNiArNzQyLDkgQEAgZXh0ZXJuICJDIiB7Cj4gICAqLwo+ICAjZGVmaW5lIEFGQkNfRk9STUFU
X01PRF9CQ0ggICAgICgxVUxMIDw8IDExKQo+ICAKPiArI2RlZmluZSBBRkJDX0ZPUk1BVF9NT0Rf
Uk9DS0NISVAgXAo+ICsJKEFGQkNfRk9STUFUX01PRF9CTE9DS19TSVpFXzE2eDE2IHwgQUZCQ19G
T1JNQVRfTU9EX1NQQVJTRSkKClRoaXMgZGVmaW5lIGxvb2tzIHVzZWxlc3MsIHdoYXQncyBSb2Nr
Y2hpcCBzcGVjaWZpYyBoZXJlID8KCk5laWwKCj4gKwo+ICAvKgo+ICAgKiBBbGx3aW5uZXIgdGls
ZWQgbW9kaWZpZXIKPiAgICoKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
