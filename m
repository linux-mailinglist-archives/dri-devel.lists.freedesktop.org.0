Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FEC9DEB0
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 09:27:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B1E4892FA;
	Tue, 27 Aug 2019 07:27:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2F34892FA
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 07:27:00 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id p77so1720166wme.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 00:27:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=nnOBOaMl8g+9LGcbLY1D26ZLcne79ZMS7cHhvnDQH6M=;
 b=TNoOQSZrIcr0zVhOwRLrLlQ0HkYVNKuGukRq9YLhSNzFMNKNEXKZ82GGNebeAFjOdp
 8lpnqylZU2ihszGP8l/r1k6Us/+oPxX0NHDIuqxTBq54rhiTvUKJygEPfuMvxD1j4eB3
 Aax44l3XlT0mAQdoH4E2Q+/AGf1MCx9Jq7J/bl7XO9tJOrqqbEPh277N5Dswdm+/PeTu
 v5FnbNAJM4KYO/IfietDNfLVsaCyIcuBRC5O+SGT4lPdCmgrmTXZV8i6k+a5FTLsre0N
 5DlAFXyOEQ+L/fdM1vFbLmRF36kl2f+S8O47jl/xbCEnkHD2x5L5SYKUg8Wr4J+kCtFJ
 k7hw==
X-Gm-Message-State: APjAAAUxdTQ7rWnwS48Jp0NuO5cdfI1w3hh4jiUMrfbeRS5UiHMYGBWG
 +EVRbAK42Vsrz/lyppQCjjdxTg==
X-Google-Smtp-Source: APXvYqzLO6fV+9a/V5gmmdD0E/ViQAV86Ky/UFRBjwB+aacqJIIP0f2FrGJ15PE3mGxS/+/emdDoHw==
X-Received: by 2002:a7b:c857:: with SMTP id c23mr28116634wml.51.1566890819035; 
 Tue, 27 Aug 2019 00:26:59 -0700 (PDT)
Received: from [10.1.3.173] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id b3sm23797314wrm.72.2019.08.27.00.26.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Aug 2019 00:26:58 -0700 (PDT)
Subject: Re: [PATCH v2 11/21] drm/bridge: Add the
 drm_for_each_bridge_in_chain() helper
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20190826152649.13820-1-boris.brezillon@collabora.com>
 <20190826152649.13820-12-boris.brezillon@collabora.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <4be8ecbf-b31f-bc6f-d999-50b2bfae6d3c@baylibre.com>
Date: Tue, 27 Aug 2019 09:26:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190826152649.13820-12-boris.brezillon@collabora.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=nnOBOaMl8g+9LGcbLY1D26ZLcne79ZMS7cHhvnDQH6M=;
 b=EnAPW3wmYs+MXq+tbfSpIkmZ3I5mgCVYNZ74CrZPss7msmbf/Px8frGsx8bKxsIZC1
 PvUUN74D4aLlzKgQusjijak17T4PWaq0RUHB3gE9rQfyVGks78edA1NRu3kBUqivwg1p
 3LHUkCV6Vg8dSVyelj/umumy/Thz/yAEUB3TMwYQAN4KPpfUgRcopxLoUDnkTzPN9Lna
 y1aKNYO0xofd6t09ItGS9pcP6UXvRlxa6id8tTawN73R2SjpbiOJnangVUL0FpAVTpCe
 h9BaXnS3ZY0duhtwmBaw8TTq4jS9kFFnrtksMINMT2XNK71g1dEt9M3eE4HsH8ZTJYye
 q8Fg==
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
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Chris Healy <Chris.Healy@zii.aero>,
 kernel@collabora.com, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjYvMDgvMjAxOSAxNzoyNiwgQm9yaXMgQnJlemlsbG9uIHdyb3RlOgo+IFRvIGl0ZXJhdGUg
b3ZlciBhbGwgYnJpZGdlcyBhdHRhY2hlZCB0byBhIHNwZWNpZmljIGVuY29kZXIuCj4gCj4gU3Vn
Z2VzdGVkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2Fy
ZC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25A
Y29sbGFib3JhLmNvbT4KClJldmlld2VkLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0Bi
YXlsaWJyZS5jb20+Cgo+IC0tLQo+IENoYW5nZXMgaW4gdjI6Cj4gKiBOZXcgcGF0Y2gKPiAtLS0K
PiAgaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oIHwgMTEgKysrKysrKysrKysKPiAgMSBmaWxlIGNo
YW5nZWQsIDExIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJt
X2JyaWRnZS5oIGIvaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oCj4gaW5kZXggOGFmOTJmMGE5NTQx
Li5jZjA1YjMwZjI5NjcgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oCj4g
KysrIGIvaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oCj4gQEAgLTQwOSw2ICs0MDksMTcgQEAgc3Ry
dWN0IGRybV9icmlkZ2UgKm9mX2RybV9maW5kX2JyaWRnZShzdHJ1Y3QgZGV2aWNlX25vZGUgKm5w
KTsKPiAgaW50IGRybV9icmlkZ2VfYXR0YWNoKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2Rlciwg
c3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwKPiAgCQkgICAgICBzdHJ1Y3QgZHJtX2JyaWRnZSAq
cHJldmlvdXMpOwo+ICAKPiArLyoqCj4gKyAqIGZvcl9lYWNoX2JyaWRnZV9pbl9jaGFpbigpIC0g
SXRlcmF0ZSBvdmVyIGFsbCBicmlkZ2VzIHByZXNlbnQgaW4gYSBjaGFpbgo+ICsgKiBAZW5jb2Rl
cjogdGhlIGVuY29kZXIgdG8gaXRlcmF0ZSBicmlkZ2VzIG9uCj4gKyAqIEBicmlkZ2U6IGEgYnJp
ZGdlIHBvaW50ZXIgdXBkYXRlZCB0byBwb2ludCB0byB0aGUgY3VycmVudCBicmlkZ2UgYXQgZWFj
aAo+ICsgKgkgICAgaXRlcmF0aW9uCj4gKyAqCj4gKyAqIEl0ZXJhdGUgb3ZlciBhbGwgYnJpZGdl
cyBwcmVzZW50IGluIHRoZSBicmlkZ2UgY2hhaW4gYXR0YWNoZWQgdG8gQGVuY29kZXIuCj4gKyAq
Lwo+ICsjZGVmaW5lIGRybV9mb3JfZWFjaF9icmlkZ2VfaW5fY2hhaW4oZW5jb2RlciwgYnJpZGdl
KQkJCVwKPiArCWxpc3RfZm9yX2VhY2hfZW50cnkoYnJpZGdlLCAmKGVuY29kZXIpLT5icmlkZ2Vf
Y2hhaW4sIGNoYWluX25vZGUpCj4gKwo+ICBzdHJ1Y3QgZHJtX2JyaWRnZSAqCj4gIGRybV9icmlk
Z2VfY2hhaW5fZ2V0X25leHRfYnJpZGdlKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpOwo+ICBi
b29sIGRybV9icmlkZ2VfY2hhaW5fbW9kZV9maXh1cChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdl
LAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
