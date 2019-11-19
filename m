Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D12103031
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 00:28:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D57BE6EA0B;
	Tue, 19 Nov 2019 23:28:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 408B16E311
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 14:27:59 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 5/6] gpu/drm: ingenic: Check for display size in CRTC atomic
 check
Date: Tue, 19 Nov 2019 15:17:35 +0100
Message-Id: <20191119141736.74607-5-paul@crapouillou.net>
In-Reply-To: <20191119141736.74607-1-paul@crapouillou.net>
References: <20191119141736.74607-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 19 Nov 2019 23:28:08 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; 
 s=mail; t=1574173070; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oUh3tHC1IpVvucQONBZZgG9pR9KpdR7LhhZ6E5E59VU=;
 b=QDYc2tG2FUbS2UI0X3I9gh40vxZGwCFT5gD0/GcfAHlJpp/tIjUgh+2hXiw+6vyfcKthFj
 jGkw5XPreMPkhnqOSV2jy/lNnrL4cD4qtsJM+FHDf8fAwuAMjQPrNOIXtYIZJfrj/5do/W
 ddmoFAniGztZajJK27fa5TRzvPToM5s=
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
Cc: Paul Cercueil <paul@crapouillou.net>, devicetree@vger.kernel.org,
 od@zcrc.me, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q2hlY2sgdGhhdCB0aGUgcmVxdWVzdGVkIGRpc3BsYXkgc2l6ZSBpc24ndCBhYm92ZSB0aGUgbGlt
aXRzIHN1cHBvcnRlZApieSB0aGUgQ1JUQy4KCi0gSlo0NzUwIGFuZCBvbGRlciBzdXBwb3J0IHVw
IHRvIDgwMHg2MDA7Ci0gSlo0NzU1IHN1cHBvcnRzIHVwIHRvIDEwMjR4NTc2OwotIEpaNDc2MCBh
bmQgSlo0NzcwIHN1cHBvcnQgdXAgdG8gNzIwcDsKLSBKWjQ3ODAgc3VwcG9ydHMgdXAgdG8gMmsu
CgpTaWduZWQtb2ZmLWJ5OiBQYXVsIENlcmN1ZWlsIDxwYXVsQGNyYXBvdWlsbG91Lm5ldD4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vaW5nZW5pYy9pbmdlbmljLWRybS5jIHwgMTMgKysrKysrKysrKysr
LQogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaW5nZW5pYy9pbmdlbmljLWRybS5jIGIvZHJpdmVycy9n
cHUvZHJtL2luZ2VuaWMvaW5nZW5pYy1kcm0uYwppbmRleCA0NTM4YjA4MWIwYzUuLmQ1NzhjNGNi
NjAwOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2luZ2VuaWMvaW5nZW5pYy1kcm0uYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vaW5nZW5pYy9pbmdlbmljLWRybS5jCkBAIC0xNTIsNiArMTUy
LDcgQEAgc3RydWN0IGluZ2VuaWNfZG1hX2h3ZGVzYyB7CiAKIHN0cnVjdCBqel9zb2NfaW5mbyB7
CiAJYm9vbCBuZWVkc19kZXZfY2xrOworCXVuc2lnbmVkIGludCBtYXhfd2lkdGgsIG1heF9oZWln
aHQ7CiB9OwogCiBzdHJ1Y3QgaW5nZW5pY19kcm0gewpAQCAtMTYzLDYgKzE2NCw3IEBAIHN0cnVj
dCBpbmdlbmljX2RybSB7CiAJc3RydWN0IGRldmljZSAqZGV2OwogCXN0cnVjdCByZWdtYXAgKm1h
cDsKIAlzdHJ1Y3QgY2xrICpsY2RfY2xrLCAqcGl4X2NsazsKKwljb25zdCBzdHJ1Y3Qganpfc29j
X2luZm8gKnNvY19pbmZvOwogCiAJc3RydWN0IGluZ2VuaWNfZG1hX2h3ZGVzYyAqZG1hX2h3ZGVz
YzsKIAlkbWFfYWRkcl90IGRtYV9od2Rlc2NfcGh5czsKQEAgLTMyNSw2ICszMjcsMTAgQEAgc3Rh
dGljIGludCBpbmdlbmljX2RybV9jcnRjX2F0b21pY19jaGVjayhzdHJ1Y3QgZHJtX2NydGMgKmNy
dGMsCiAJaWYgKCFkcm1fYXRvbWljX2NydGNfbmVlZHNfbW9kZXNldChzdGF0ZSkpCiAJCXJldHVy
biAwOwogCisJaWYgKHN0YXRlLT5tb2RlLmhkaXNwbGF5ID4gcHJpdi0+c29jX2luZm8tPm1heF9o
ZWlnaHQgfHwKKwkgICAgc3RhdGUtPm1vZGUudmRpc3BsYXkgPiBwcml2LT5zb2NfaW5mby0+bWF4
X3dpZHRoKQorCQlyZXR1cm4gLUVJTlZBTDsKKwogCXJhdGUgPSBjbGtfcm91bmRfcmF0ZShwcml2
LT5waXhfY2xrLAogCQkJICAgICAgc3RhdGUtPmFkanVzdGVkX21vZGUuY2xvY2sgKiAxMDAwKTsK
IAlpZiAocmF0ZSA8IDApCkBAIC02MTksNiArNjI1LDcgQEAgc3RhdGljIGludCBpbmdlbmljX2Ry
bV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCWlmICghcHJpdikKIAkJcmV0
dXJuIC1FTk9NRU07CiAKKwlwcml2LT5zb2NfaW5mbyA9IHNvY19pbmZvOwogCXByaXYtPmRldiA9
IGRldjsKIAlkcm0gPSAmcHJpdi0+ZHJtOwogCWRybS0+ZGV2X3ByaXZhdGUgPSBwcml2OwpAQCAt
NjM0LDcgKzY0MSw3IEBAIHN0YXRpYyBpbnQgaW5nZW5pY19kcm1fcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKIAlkcm1fbW9kZV9jb25maWdfaW5pdChkcm0pOwogCWRybS0+bW9k
ZV9jb25maWcubWluX3dpZHRoID0gMDsKIAlkcm0tPm1vZGVfY29uZmlnLm1pbl9oZWlnaHQgPSAw
OwotCWRybS0+bW9kZV9jb25maWcubWF4X3dpZHRoID0gODAwOworCWRybS0+bW9kZV9jb25maWcu
bWF4X3dpZHRoID0gc29jX2luZm8tPm1heF93aWR0aDsKIAlkcm0tPm1vZGVfY29uZmlnLm1heF9o
ZWlnaHQgPSA0MDk1OwogCWRybS0+bW9kZV9jb25maWcuZnVuY3MgPSAmaW5nZW5pY19kcm1fbW9k
ZV9jb25maWdfZnVuY3M7CiAKQEAgLTgxMiwxMCArODE5LDE0IEBAIHN0YXRpYyBpbnQgaW5nZW5p
Y19kcm1fcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAKIHN0YXRpYyBjb25z
dCBzdHJ1Y3Qganpfc29jX2luZm8gano0NzQwX3NvY19pbmZvID0gewogCS5uZWVkc19kZXZfY2xr
ID0gdHJ1ZSwKKwkubWF4X3dpZHRoID0gODAwLAorCS5tYXhfaGVpZ2h0ID0gNjAwLAogfTsKIAog
c3RhdGljIGNvbnN0IHN0cnVjdCBqel9zb2NfaW5mbyBqejQ3MjViX3NvY19pbmZvID0gewogCS5u
ZWVkc19kZXZfY2xrID0gZmFsc2UsCisJLm1heF93aWR0aCA9IDgwMCwKKwkubWF4X2hlaWdodCA9
IDYwMCwKIH07CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGluZ2VuaWNfZHJt
X29mX21hdGNoW10gPSB7Ci0tIAoyLjI0LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
