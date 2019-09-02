Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D206AA50D0
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 10:05:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24EE089B49;
	Mon,  2 Sep 2019 08:05:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BF6F89B49
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 08:05:14 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id c3so12962640wrd.7
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 01:05:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=fO/Fs9yhycLN56Ypumx1dDOmveWnwXs336ehWOSJQl8=;
 b=nvlQeE333ZKQhsezyO/LL9Vw1DSi4n5zJbRONfu2MlzXCgJQX/2XPDYkRJYDBCvIH1
 rRqrxgPWRblJaqcapHudKs/MjVGKm3R/KjDRwlBMPhZhNYfnlKcG950nzGhvvsQ+2ajh
 Br8v0u2XTlpK2BwU5SxoZKDevwIVbcqoa9mf2IYQo/yup7eNAUXcCWUid+zwvqlfHQqr
 /7rDO20K+j9J0i/q9M1sw0cq1bOJ55G52lHa0wU6i290CLJzGTKbPFwlj171e2CZb3fE
 w23saEzewuU0UhlMpxllTOxiTJaGTjL2aiUmcPSuKIFcuHmCLO/AnNJt+t5W9GklIXDD
 R+Jw==
X-Gm-Message-State: APjAAAXBt+QaipRXVKG14K8CxMDbBWZfSfW2v/+VttE9Bykrq1rKuzr1
 hiY0uqLhQymBlPpW5Zm7dK1DYg==
X-Google-Smtp-Source: APXvYqyk2RjxajEGOAwGyishWjOtiBsMjUX7blAN9b4Wfv3Cy2fbPxsmWwVbhFmA0cLkkHqsLH5zJw==
X-Received: by 2002:adf:cc84:: with SMTP id p4mr16899211wrj.201.1567411512816; 
 Mon, 02 Sep 2019 01:05:12 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id q15sm3982870wmb.28.2019.09.02.01.05.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 02 Sep 2019 01:05:12 -0700 (PDT)
Subject: Re: [PATCH 1/5] drm: dw-hdmi: extract dw_hdmi_connector_update_edid()
To: Jonas Karlman <jonas@kwiboo.se>, Andrzej Hajda <a.hajda@samsung.com>
References: <AM0PR06MB40049562E295DD62302C8DB7ACBF0@AM0PR06MB4004.eurprd06.prod.outlook.com>
 <AM0PR06MB4004C3231CA859341E6CF8B9ACBF0@AM0PR06MB4004.eurprd06.prod.outlook.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <179241b1-3f54-683d-036f-ae10f53935d7@baylibre.com>
Date: Mon, 2 Sep 2019 10:05:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <AM0PR06MB4004C3231CA859341E6CF8B9ACBF0@AM0PR06MB4004.eurprd06.prod.outlook.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=fO/Fs9yhycLN56Ypumx1dDOmveWnwXs336ehWOSJQl8=;
 b=GS/UWabSrOopY6o0gIwaQ2w0Kz6bve0lYOWB2MoNuu14CycgzC6GFfHrArf3Vev8DL
 HHptHf4rOcJjdQOqLJMU5gGG8jZWnBMG2aXbqkeqZiJIH2sm3dl/glFEn07kgp+6KrHL
 Ghx1l/tdVvl/HsD8p2HGeegS0/7Za6f1e911k2iZJ7m81lc5ekmHK3cwWHzdlz+671RG
 QHKJYFkI4GlDacTSjS43sQ4RqPBipkwSRiSsXvXu44ZhQ32tLEGRZqmnRVEHChDoz8Ac
 kjLooKrtbFW6I5KhH2YZxDXWFTFxHp29e71Ymq+HPJSFU0H4JakGfdkWSfTqzf10MVsC
 MbFQ==
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSm9uYXMsCgpPbiAwMS8wOS8yMDE5IDE4OjE0LCBKb25hcyBLYXJsbWFuIHdyb3RlOgo+IEV4
dHJhY3QgY29kZSB0aGF0IHVwZGF0ZXMgRURJRCBpbnRvIGEgZHdfaGRtaV9jb25uZWN0b3JfdXBk
YXRlX2VkaWQoKQo+IGhlbHBlciwgaXQgd2lsbCBiZSBjYWxsZWQgZnJvbSBkd19oZG1pX2Nvbm5l
Y3Rvcl9kZXRlY3QoKS4KClNtYWxsIG5pdCwgeW91IHNob3VsZCBwcmVjaXNlIHlvdSBhZGQgYSBi
b29sIHRvIG9wdGlvbmFsbHkgYWRkIHRoZSBtb2Rlcy4KCkFueXdheToKUmV2aWV3ZWQtYnk6IE5l
aWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4KCj4gCj4gU2lnbmVkLW9mZi1i
eTogSm9uYXMgS2FybG1hbiA8am9uYXNAa3dpYm9vLnNlPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyB8IDExICsrKysrKysrKy0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIGIvZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKPiBpbmRleCA1MjFkNjg5NDEzYzguLjhhYjIx
NGRjNWFlNyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3
LWhkbWkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5j
Cj4gQEAgLTIxNzEsNyArMjE3MSw4IEBAIGR3X2hkbWlfY29ubmVjdG9yX2RldGVjdChzdHJ1Y3Qg
ZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLCBib29sIGZvcmNlKQo+ICAJcmV0dXJuIGhkbWktPnBo
eS5vcHMtPnJlYWRfaHBkKGhkbWksIGhkbWktPnBoeS5kYXRhKTsKPiAgfQo+ICAKPiAtc3RhdGlj
IGludCBkd19oZG1pX2Nvbm5lY3Rvcl9nZXRfbW9kZXMoc3RydWN0IGRybV9jb25uZWN0b3IgKmNv
bm5lY3RvcikKPiArc3RhdGljIGludCBkd19oZG1pX2Nvbm5lY3Rvcl91cGRhdGVfZWRpZChzdHJ1
Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLAo+ICsJCQkJCSAgYm9vbCBhZGRfbW9kZXMpCj4g
IHsKPiAgCXN0cnVjdCBkd19oZG1pICpoZG1pID0gY29udGFpbmVyX29mKGNvbm5lY3Rvciwgc3Ry
dWN0IGR3X2hkbWksCj4gIAkJCQkJICAgICBjb25uZWN0b3IpOwo+IEBAIC0yMTkwLDcgKzIxOTEs
OCBAQCBzdGF0aWMgaW50IGR3X2hkbWlfY29ubmVjdG9yX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nv
bm5lY3RvciAqY29ubmVjdG9yKQo+ICAJCWhkbWktPnNpbmtfaGFzX2F1ZGlvID0gZHJtX2RldGVj
dF9tb25pdG9yX2F1ZGlvKGVkaWQpOwo+ICAJCWRybV9jb25uZWN0b3JfdXBkYXRlX2VkaWRfcHJv
cGVydHkoY29ubmVjdG9yLCBlZGlkKTsKPiAgCQljZWNfbm90aWZpZXJfc2V0X3BoeXNfYWRkcl9m
cm9tX2VkaWQoaGRtaS0+Y2VjX25vdGlmaWVyLCBlZGlkKTsKPiAtCQlyZXQgPSBkcm1fYWRkX2Vk
aWRfbW9kZXMoY29ubmVjdG9yLCBlZGlkKTsKPiArCQlpZiAoYWRkX21vZGVzKQo+ICsJCQlyZXQg
PSBkcm1fYWRkX2VkaWRfbW9kZXMoY29ubmVjdG9yLCBlZGlkKTsKPiAgCQlrZnJlZShlZGlkKTsK
PiAgCX0gZWxzZSB7Cj4gIAkJZGV2X2RiZyhoZG1pLT5kZXYsICJmYWlsZWQgdG8gZ2V0IGVkaWRc
biIpOwo+IEBAIC0yMTk5LDYgKzIyMDEsMTEgQEAgc3RhdGljIGludCBkd19oZG1pX2Nvbm5lY3Rv
cl9nZXRfbW9kZXMoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKPiAgCXJldHVybiBy
ZXQ7Cj4gIH0KPiAgCj4gK3N0YXRpYyBpbnQgZHdfaGRtaV9jb25uZWN0b3JfZ2V0X21vZGVzKHN0
cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCj4gK3sKPiArCXJldHVybiBkd19oZG1pX2Nv
bm5lY3Rvcl91cGRhdGVfZWRpZChjb25uZWN0b3IsIHRydWUpOwo+ICt9Cj4gKwo+ICBzdGF0aWMg
dm9pZCBkd19oZG1pX2Nvbm5lY3Rvcl9mb3JjZShzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVj
dG9yKQo+ICB7Cj4gIAlzdHJ1Y3QgZHdfaGRtaSAqaGRtaSA9IGNvbnRhaW5lcl9vZihjb25uZWN0
b3IsIHN0cnVjdCBkd19oZG1pLAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
