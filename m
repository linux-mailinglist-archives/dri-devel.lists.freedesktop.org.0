Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0065B144
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 20:27:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1F6089DB5;
	Sun, 30 Jun 2019 18:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60C3A89262
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jun 2019 11:09:18 +0000 (UTC)
Date: Sun, 30 Jun 2019 13:09:09 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/3] DRM: ingenic: Use devm_platform_ioremap_resource
To: Sam Ravnborg <sam@ravnborg.org>
Message-Id: <1561892949.1773.0@crapouillou.net>
In-Reply-To: <20190630081833.GC5081@ravnborg.org>
References: <20190627182114.27299-1-paul@crapouillou.net>
 <20190630081833.GC5081@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 30 Jun 2019 18:26:11 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; 
 s=mail; t=1561892954; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1VKx1wk+WzUoklxrAuKWgU2OQk4oJuRQqz3GgyjEXAY=;
 b=CrXPn/sYqzf1H1ODHym18aKQJeF/xMPQZ28pa7eIooieBYCSB2sBik0mJSykhwEDFTzdhj
 PxBiKXVGVIigKUq9U1EYzNU1bChseQe9AinV+wvnsgxd2sxIUTZnyjHKDBCJyPRhOR0P2T
 8Ixi7Ch5feBvSoUR/QTLgF8PJ210aq8=
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 od@zcrc.me, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpMZSBkaW0uIDMwIGp1aW4gMjAxOSDDoCAxMDoxOCwgU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJv
cmcub3JnPiBhIMOpY3JpdCAKOgo+IEhpIFBhdWwuCj4gCj4gT24gVGh1LCBKdW4gMjcsIDIwMTkg
YXQgMDg6MjE6MTJQTSArMDIwMCwgUGF1bCBDZXJjdWVpbCB3cm90ZToKPj4gIFNpbXBsaWZ5IGEg
Yml0IHRoZSBwcm9iZSBmdW5jdGlvbiBieSB1c2luZyB0aGUgbmV3bHkgaW50cm9kdWNlZAo+PiAg
ZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKCksIGluc3RlYWQgb2YgaGF2aW5nIHRvIGNh
bGwKPj4gIHBsYXRmb3JtX2dldF9yZXNvdXJjZSgpIGZvbGxvd2VkIGJ5IGRldm1faW9yZW1hcF9y
ZXNvdXJjZSgpLgo+PiAKPj4gIFNpZ25lZC1vZmYtYnk6IFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3Jh
cG91aWxsb3UubmV0Pgo+PiAgLS0tCj4+ICAgZHJpdmVycy9ncHUvZHJtL2luZ2VuaWMvaW5nZW5p
Yy1kcm0uYyB8IDQgKy0tLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBk
ZWxldGlvbnMoLSkKPj4gCj4+ICBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2luZ2VuaWMv
aW5nZW5pYy1kcm0uYyAKPj4gYi9kcml2ZXJzL2dwdS9kcm0vaW5nZW5pYy9pbmdlbmljLWRybS5j
Cj4+ICBpbmRleCBhMDY5NTc5Y2E3NDkuLjAyYzQ3ODhlZjFjNyAxMDA2NDQKPj4gIC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9pbmdlbmljL2luZ2VuaWMtZHJtLmMKPj4gICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9pbmdlbmljL2luZ2VuaWMtZHJtLmMKPj4gIEBAIC01ODAsNyArNTgwLDYgQEAgc3RhdGlj
IGludCBpbmdlbmljX2RybV9wcm9iZShzdHJ1Y3QgCj4+IHBsYXRmb3JtX2RldmljZSAqcGRldikK
Pj4gICAJc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZTsKPj4gICAJc3RydWN0IGRybV9wYW5lbCAq
cGFuZWw7Cj4+ICAgCXN0cnVjdCBkcm1fZGV2aWNlICpkcm07Cj4+ICAtCXN0cnVjdCByZXNvdXJj
ZSAqbWVtOwo+PiAgIAl2b2lkIF9faW9tZW0gKmJhc2U7Cj4+ICAgCWxvbmcgcGFyZW50X3JhdGU7
Cj4+ICAgCWludCByZXQsIGlycTsKPj4gIEBAIC02MTQsOCArNjEzLDcgQEAgc3RhdGljIGludCBp
bmdlbmljX2RybV9wcm9iZShzdHJ1Y3QgCj4+IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4gICAJ
ZHJtLT5tb2RlX2NvbmZpZy5tYXhfaGVpZ2h0ID0gNjAwOwo+PiAgIAlkcm0tPm1vZGVfY29uZmln
LmZ1bmNzID0gJmluZ2VuaWNfZHJtX21vZGVfY29uZmlnX2Z1bmNzOwo+PiAKPj4gIC0JbWVtID0g
cGxhdGZvcm1fZ2V0X3Jlc291cmNlKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAwKTsKPj4gIC0JYmFz
ZSA9IGRldm1faW9yZW1hcF9yZXNvdXJjZShkZXYsIG1lbSk7Cj4+ICArCWJhc2UgPSBkZXZtX3Bs
YXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UocGRldiwgMCk7Cj4+ICAgCWlmIChJU19FUlIoYmFzZSkp
IHsKPj4gICAJCWRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGdldCBtZW1vcnkgcmVzb3VyY2UiKTsK
PiBDb25zaWRlciB0byBpbmNsdWRlIHRoZSBlcnJvciBjb2RlIGluIHRoZSBlcnJvciBtZXNzYWdl
IGhlcmUuCgpJIGRvbid0IHRoaW5rIGl0J3MgbmVlZGVkOyBhIG5vbi16ZXJvIGVycm9yIGNvZGUg
aW4gdGhlIHByb2JlIGZ1bmN0aW9uIAp3aWxsCmhhdmUgdGhlIGRyaXZlcnMgY29yZSBhdXRvbWF0
aWNhbGx5IHByaW50IGEgbWVzc2FnZSB3aXRoIHRoZSBuYW1lIG9mIHRoZQpmYWlsaW5nIGRyaXZl
ciBhbmQgdGhlIHJldHVybiBjb2RlLgoKCj4+ICAgCQlyZXR1cm4gUFRSX0VSUihiYXNlKTsKPiAK
PiBXaXRoIHRoZSBhYm92ZSBmaXhlZC9jb25zaWRlcmVkOgo+IFJldmlld2VkLWJ5OiBTYW0gUmF2
bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
