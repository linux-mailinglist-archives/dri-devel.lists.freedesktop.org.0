Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEF4A50D2
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 10:05:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F27A589B51;
	Mon,  2 Sep 2019 08:05:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D706489B51
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 08:05:29 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id j16so12955848wrr.8
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 01:05:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=/pHVxf6N6S+S04cnwPxjOpZs7BM1gCEC9ZFkDTl0jF4=;
 b=omuyAt7GfTVtthR+lbZ1rRRkUk+vtnkADacmtzrSsPwh08G0EsvBQ4kipvjWblz8jS
 Ogt6T1+hxSTYFPUT9qQD7EaR9HdmWYdCxVBe8aGpjiBDJfrWEOImZoQK84qVX+UyJPCz
 1RIbywSCTY6hDEg+bYyR7kW+H0Df591amaLjh3I8W2ExbwOI8DAw8GkeOWwDELF8waqM
 z/X+es3THglhnosIfb0mS9jLEddFGM+yckvRwYU9FdtFP27Ols9dFjkirdc7nO8apv/6
 1s/q2IIjHHtSS7iKTxZPNMXPYgHJjLCAmTVlpkzX7AoQrU6eGU4lw3nvUiasZWrMxYaj
 CNGA==
X-Gm-Message-State: APjAAAU13t9hm8+Re8t0gRMsUf8YAgCYRU5H1Xbk90+f6AOVW4occ9TD
 ViMoeg8c+DTFKlvBLZA96UxjkA==
X-Google-Smtp-Source: APXvYqzbEBakAHIj7NXCsZoF0XmYVixKPzIsRXJ1EELGxPZ0QjqpJ6WcT4Ey1s11OsWxNG8N+jMQ7Q==
X-Received: by 2002:adf:9050:: with SMTP id h74mr34146710wrh.191.1567411528226; 
 Mon, 02 Sep 2019 01:05:28 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o22sm5746140wra.96.2019.09.02.01.05.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 02 Sep 2019 01:05:27 -0700 (PDT)
Subject: Re: [PATCH 2/5] drm: dw-hdmi: move dw_hdmi_connector_detect()
To: Jonas Karlman <jonas@kwiboo.se>, Andrzej Hajda <a.hajda@samsung.com>
References: <AM0PR06MB40049562E295DD62302C8DB7ACBF0@AM0PR06MB4004.eurprd06.prod.outlook.com>
 <20190901161426.1606-1-jonas@kwiboo.se>
 <AM0PR06MB400415A45BFD6956950D9251ACBF0@AM0PR06MB4004.eurprd06.prod.outlook.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <3fcff58c-de58-31e9-26cb-6699eca610e7@baylibre.com>
Date: Mon, 2 Sep 2019 10:05:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <AM0PR06MB400415A45BFD6956950D9251ACBF0@AM0PR06MB4004.eurprd06.prod.outlook.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=/pHVxf6N6S+S04cnwPxjOpZs7BM1gCEC9ZFkDTl0jF4=;
 b=u9jT5UnLQyRqYSLrxnWhzLF0nhlJYyWXtoWuLljFjdxiaK97CwZYpMt3cGQCQejA/D
 9cvNAxpg8X1NVCWqk2pN1jBcP5+4/N4B6sKhfpt4HdwEUJviwMozkbcXuCgPLy+l5sxp
 ah8XWrwofB+Zy3z7QRDEZvTVdXmPWgtq/6bYCk3KVL9sse+sxAAuQCBv4jbYcBlfVhBT
 SYjPoYEHCxmS/lIOFPqXSZVC74vsiJwvfPdT6zE4xwvinoo5Uv/vK1oG35xfaphk2Ulb
 sG0C175Zt8BgFOEszFzDEEdNNDGWWTFcnUF7p3lMIIRngTG9UzW3bPnZbFmg99J6i4Pa
 nu4g==
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

T24gMDEvMDkvMjAxOSAxODoxNCwgSm9uYXMgS2FybG1hbiB3cm90ZToKPiBNb3ZlIGR3X2hkbWlf
Y29ubmVjdG9yX2RldGVjdCgpIGl0IHdpbGwgY2FsbCBkd19oZG1pX2Nvbm5lY3Rvcl91cGRhdGVf
ZWRpZCgpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEpvbmFzIEthcmxtYW4gPGpvbmFzQGt3aWJvby5z
ZT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMgfCAz
MCArKysrKysrKysrKy0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9u
cygrKSwgMTUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5
cy9kdy1oZG1pLmMKPiBpbmRleCA4YWIyMTRkYzVhZTcuLjkxZDg2ZGRkNjYyNCAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCj4gQEAgLTIxNTYsMjEgKzIx
NTYsNiBAQCBzdGF0aWMgdm9pZCBkd19oZG1pX3VwZGF0ZV9waHlfbWFzayhzdHJ1Y3QgZHdfaGRt
aSAqaGRtaSkKPiAgCQkJCQkgIGhkbWktPnJ4c2Vuc2UpOwo+ICB9Cj4gIAo+IC1zdGF0aWMgZW51
bSBkcm1fY29ubmVjdG9yX3N0YXR1cwo+IC1kd19oZG1pX2Nvbm5lY3Rvcl9kZXRlY3Qoc3RydWN0
IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwgYm9vbCBmb3JjZSkKPiAtewo+IC0Jc3RydWN0IGR3
X2hkbWkgKmhkbWkgPSBjb250YWluZXJfb2YoY29ubmVjdG9yLCBzdHJ1Y3QgZHdfaGRtaSwKPiAt
CQkJCQkgICAgIGNvbm5lY3Rvcik7Cj4gLQo+IC0JbXV0ZXhfbG9jaygmaGRtaS0+bXV0ZXgpOwo+
IC0JaGRtaS0+Zm9yY2UgPSBEUk1fRk9SQ0VfVU5TUEVDSUZJRUQ7Cj4gLQlkd19oZG1pX3VwZGF0
ZV9wb3dlcihoZG1pKTsKPiAtCWR3X2hkbWlfdXBkYXRlX3BoeV9tYXNrKGhkbWkpOwo+IC0JbXV0
ZXhfdW5sb2NrKCZoZG1pLT5tdXRleCk7Cj4gLQo+IC0JcmV0dXJuIGhkbWktPnBoeS5vcHMtPnJl
YWRfaHBkKGhkbWksIGhkbWktPnBoeS5kYXRhKTsKPiAtfQo+IC0KPiAgc3RhdGljIGludCBkd19o
ZG1pX2Nvbm5lY3Rvcl91cGRhdGVfZWRpZChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9y
LAo+ICAJCQkJCSAgYm9vbCBhZGRfbW9kZXMpCj4gIHsKPiBAQCAtMjIwMSw2ICsyMTg2LDIxIEBA
IHN0YXRpYyBpbnQgZHdfaGRtaV9jb25uZWN0b3JfdXBkYXRlX2VkaWQoc3RydWN0IGRybV9jb25u
ZWN0b3IgKmNvbm5lY3RvciwKPiAgCXJldHVybiByZXQ7Cj4gIH0KPiAgCj4gK3N0YXRpYyBlbnVt
IGRybV9jb25uZWN0b3Jfc3RhdHVzCj4gK2R3X2hkbWlfY29ubmVjdG9yX2RldGVjdChzdHJ1Y3Qg
ZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLCBib29sIGZvcmNlKQo+ICt7Cj4gKwlzdHJ1Y3QgZHdf
aGRtaSAqaGRtaSA9IGNvbnRhaW5lcl9vZihjb25uZWN0b3IsIHN0cnVjdCBkd19oZG1pLAo+ICsJ
CQkJCSAgICAgY29ubmVjdG9yKTsKPiArCj4gKwltdXRleF9sb2NrKCZoZG1pLT5tdXRleCk7Cj4g
KwloZG1pLT5mb3JjZSA9IERSTV9GT1JDRV9VTlNQRUNJRklFRDsKPiArCWR3X2hkbWlfdXBkYXRl
X3Bvd2VyKGhkbWkpOwo+ICsJZHdfaGRtaV91cGRhdGVfcGh5X21hc2soaGRtaSk7Cj4gKwltdXRl
eF91bmxvY2soJmhkbWktPm11dGV4KTsKPiArCj4gKwlyZXR1cm4gaGRtaS0+cGh5Lm9wcy0+cmVh
ZF9ocGQoaGRtaSwgaGRtaS0+cGh5LmRhdGEpOwo+ICt9Cj4gKwo+ICBzdGF0aWMgaW50IGR3X2hk
bWlfY29ubmVjdG9yX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQo+
ICB7Cj4gIAlyZXR1cm4gZHdfaGRtaV9jb25uZWN0b3JfdXBkYXRlX2VkaWQoY29ubmVjdG9yLCB0
cnVlKTsKPiAKClJldmlld2VkLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJy
ZS5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
