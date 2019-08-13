Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D72498B7AA
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 13:56:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F556E109;
	Tue, 13 Aug 2019 11:56:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBD366E0F6
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 11:56:26 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id v15so1245489wml.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 04:56:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=D0fIGhGLp0xihNCsIbbPap9YOn2voGlklnNOTUFqYtw=;
 b=PLLuw8G5P9bid3XOn1qKY/HgrKcjfSGxo6PRc36opMjekAEIB/DCfyTwNmBLeuRVHt
 QCDaHSGRSjRriEd3Xs9O3r1v0runc5zAgG2dgI2A+Lf3aIPW0r93gk0sos9AL2wrK1IX
 HavYIIRdjr4WffC06N8BoU+jD8//+XKwg7No5q6cd/ci3Ek6aBvyR0XZcbEWpMlHXhFe
 e5YsCiE2alKCd8MrYfU8TuKbiKva2QDX7NPeMl4s1T10bPT01kRQmug/NSL0EkTtSZ4Y
 rXEEvaZ2uWKXAXvNQ6m2BnX+mpSCKtedthbOEz2ma6P0CgfQl/IWeJ8Fi1ZEwvi770Rt
 UVUw==
X-Gm-Message-State: APjAAAVTDb1eTkMTZ8tEWkB0bwQwNjLsOMDZ4tgqixAdGWZN8COE6OVW
 OEfJHm86w7VRSrKFfyhkuSEx6A==
X-Google-Smtp-Source: APXvYqz8WMcBFAqdKArlOCGzWhq5IJhPXZEu4YE0kUEIVfKEW9aZNeO1hcGL+vxVVoNdNDQVd980MQ==
X-Received: by 2002:a1c:be05:: with SMTP id o5mr2815270wmf.52.1565697385206;
 Tue, 13 Aug 2019 04:56:25 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id n14sm213373304wra.75.2019.08.13.04.56.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 13 Aug 2019 04:56:24 -0700 (PDT)
Subject: Re: [PATCH] drm/bridge: dw-hdmi: move cec PA invalidation to
 dw_hdmi_setup_rx_sense()
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
References: <6099ff8a-e708-e466-5877-07c9102513f8@xs4all.nl>
 <c05b6989-a2a2-e728-7fef-3342b14fa655@xs4all.nl>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <9c254c99-efda-f603-7ee2-8859af635a8e@baylibre.com>
Date: Tue, 13 Aug 2019 13:56:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c05b6989-a2a2-e728-7fef-3342b14fa655@xs4all.nl>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=D0fIGhGLp0xihNCsIbbPap9YOn2voGlklnNOTUFqYtw=;
 b=LebCRVSjUZB/PIYePN/CZKKgNdJVMoe9Al41mBq5/r1f8sbhjZHaXaKS2+N2AVhUjn
 xPJ0BTZ8ebK7h+Qk54yRcaH7V7pxZa1CoPTpSvM8vMBwp94mGGTlh0bZePZzBwspMeZP
 RE0+2L/fptYHTKFmqH9HSD6SLXkaISGrkMzVEfnD/9KrJSOnMZ6HaRtu71msO/JI4Eqa
 y7hfCu5ZYQSLxAnvQJYbX51FG5gtCCJbdyjmPofpYrz58iRf2i1aD8y7Q7LUgP62F2nY
 bZEnMjBN3vX9tF9xVTGjenlq7Ukb6uiFGgAw9KNz0bxdzNMCoBi+F/HOxvqMhiyj9cfA
 eQMA==
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
Cc: Jonas Karlman <jonas@kwiboo.se>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSGFucywKCk9uIDEzLzA4LzIwMTkgMTM6NDMsIEhhbnMgVmVya3VpbCB3cm90ZToKPiBPbiA4
LzEzLzE5IDExOjMyIEFNLCBIYW5zIFZlcmt1aWwgd3JvdGU6Cj4+IFdoZW4gdGVzdGluZyBDRUMg
b24gdGhlIEFNTC1TOTA1WC1DQyBib2FyZCBJIG5vdGljZWQgdGhhdCB0aGUgQ0VDIHBoeXNpY2Fs
Cj4+IGFkZHJlc3Mgd2FzIG5vdCBpbnZhbGlkYXRlZCB3aGVuIHRoZSBIRE1JIGNhYmxlIHdhcyB1
bnBsdWdnZWQuIFNvbWUgbW9yZQo+PiBkaWdnaW5nIHNob3dlZCB0aGF0IG1lc29uIHVzZXMgbWVz
b25fZHdfaGRtaS5jIHRvIGhhbmRsZSB0aGUgSFBELgo+Pgo+PiBCb3RoIGR3X2hkbWlfaXJxKCkg
YW5kIGR3X2hkbWlfdG9wX3RocmVhZF9pcnEoKSAoaW4gbWVzb25fZHdfaGRtaS5jKSBjYWxsCj4+
IHRoZSBkd19oZG1pX3NldHVwX3J4X3NlbnNlKCkgZnVuY3Rpb24uIFNvIG1vdmUgdGhlIGNvZGUg
dG8gaW52YWxpZGF0ZSB0aGUKPj4gQ0VDIHBoeXNpY2FsIGFkZHJlc3MgdG8gdGhhdCBmdW5jdGlv
biwgc28gdGhhdCBpdCBpcyBpbmRlcGVuZGVudCBvZiB3aGVyZQo+PiB0aGUgSFBEIGludGVycnVw
dCBoYXBwZW5zLgo+Pgo+PiBUZXN0ZWQgd2l0aCBib3RoIGEgQU1MLVM5MDVYLUNDIGFuZCBhIEto
YWRhcyBWSU0yIGJvYXJkLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBIYW5zIFZlcmt1aWwgPGh2ZXJr
dWlsLWNpc2NvQHhzNGFsbC5ubD4KPiAKPiBQbGVhc2UgZGlzcmVnYXJkIHRoaXMgcGF0Y2gsIEpv
bmFzIEthcmxtYW4gd2lsbCBwb3N0IGEgZGlmZmVyZW50IHNlcmllcwo+IHdoaWNoIHdpbGwgZml4
IHRoaXMgaW4gYSBkaWZmZXJlbnQgd2F5LgoKTm90ZWQsIHRoYW5rcy4KCk5laWwKCj4gCj4gUmVn
YXJkcywKPiAKPiAJSGFucwo+IAo+PiAtLS0KPj4gTm90ZTogYW4gYWx0ZXJuYXRpdmUgd291bGQg
YmUgdG8gbWFrZSBhIG5ldyBkdy1oZG1pIGZ1bmN0aW9uIHN1Y2ggYXMKPj4gZHdfaGRtaV9jZWNf
cGh5c19hZGRyX2ludmFsaWRhdGUoKSB0aGF0IGlzIGNhbGxlZCBmcm9tIG1lc29uX2R3X2hkbWku
Yy4KPj4gSSBkZWNpZGVkIG5vdCB0byBkbyB0aGF0IHNpbmNlIHRoaXMgcGF0Y2ggaXMgbWluaW1h
bGx5IGludmFzaXZlLCBidXQKPj4gdGhhdCBjYW4gb2J2aW91c2x5IGJlIGNoYW5nZWQgaWYgdGhh
dCBhcHByb2FjaCBpcyBwcmVmZXJyZWQuCj4+IC0tLQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3N5bm9wc3lzL2R3LWhkbWkuYwo+PiBpbmRleCBjNWE4NTRhZjU0ZjguLmU4OTliMzFlMTQzMiAx
MDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMK
Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKPj4gQEAg
LTIzMjksNiArMjMyOSwxMyBAQCB2b2lkIGR3X2hkbWlfc2V0dXBfcnhfc2Vuc2Uoc3RydWN0IGR3
X2hkbWkgKmhkbWksIGJvb2wgaHBkLCBib29sIHJ4X3NlbnNlKQo+PiAgCQlkd19oZG1pX3VwZGF0
ZV9wb3dlcihoZG1pKTsKPj4gIAkJZHdfaGRtaV91cGRhdGVfcGh5X21hc2soaGRtaSk7Cj4+ICAJ
fQo+PiArCWlmICghaHBkICYmICFyeF9zZW5zZSkgewo+PiArCQlzdHJ1Y3QgY2VjX25vdGlmaWVy
ICpub3RpZmllciA9IFJFQURfT05DRShoZG1pLT5jZWNfbm90aWZpZXIpOwo+PiArCj4+ICsJCWlm
IChub3RpZmllcikKPj4gKwkJCWNlY19ub3RpZmllcl9waHlzX2FkZHJfaW52YWxpZGF0ZShub3Rp
Zmllcik7Cj4+ICsJfQo+PiArCj4+ICAJbXV0ZXhfdW5sb2NrKCZoZG1pLT5tdXRleCk7Cj4+ICB9
Cj4+ICBFWFBPUlRfU1lNQk9MX0dQTChkd19oZG1pX3NldHVwX3J4X3NlbnNlKTsKPj4gQEAgLTIz
NjksMTQgKzIzNzYsNiBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgZHdfaGRtaV9pcnEoaW50IGlycSwg
dm9pZCAqZGV2X2lkKQo+PiAgCQlkd19oZG1pX3NldHVwX3J4X3NlbnNlKGhkbWksCj4+ICAJCQkJ
ICAgICAgIHBoeV9zdGF0ICYgSERNSV9QSFlfSFBELAo+PiAgCQkJCSAgICAgICBwaHlfc3RhdCAm
IEhETUlfUEhZX1JYX1NFTlNFKTsKPj4gLQo+PiAtCQlpZiAoKHBoeV9zdGF0ICYgKEhETUlfUEhZ
X1JYX1NFTlNFIHwgSERNSV9QSFlfSFBEKSkgPT0gMCkgewo+PiAtCQkJc3RydWN0IGNlY19ub3Rp
ZmllciAqbm90aWZpZXI7Cj4+IC0KPj4gLQkJCW5vdGlmaWVyID0gUkVBRF9PTkNFKGhkbWktPmNl
Y19ub3RpZmllcik7Cj4+IC0JCQlpZiAobm90aWZpZXIpCj4+IC0JCQkJY2VjX25vdGlmaWVyX3Bo
eXNfYWRkcl9pbnZhbGlkYXRlKG5vdGlmaWVyKTsKPj4gLQkJfQo+PiAgCX0KPj4KPj4gIAlpZiAo
aW50cl9zdGF0ICYgSERNSV9JSF9QSFlfU1RBVDBfSFBEKSB7Cj4+Cj4gCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
