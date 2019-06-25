Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 948C05593C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 22:42:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA946E23B;
	Tue, 25 Jun 2019 20:42:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C15D6E22C
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 20:42:20 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id d4so29050894edr.13
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 13:42:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OA0IQv9baBUNHJdaP8PpqlCkftyGM7foSidBQ59YkzA=;
 b=mzRYfoIaBNN2G5uOcWuKwG0p+nDcPi2z522SgumeB+2RmDPUobu0KpSpUrc3Y7JLMe
 9fheztbWB3qBDIElBIMfFozbHMlPEhzBDEdSWahiv75oWey3ycn6AiIX/SiiPmzxxkSW
 fCpiq5/RXU5YEZMbUQrwraM+n5zWhSiI0EUhcNwa6Br3yuGeNDmOYtwZ7oVZhOOezhaJ
 ZpIxH0pfN0EqrGZPYJkXZ1we5fLRIO7DmYpMAVSMoSb/WLrzYXJ3U8hDguMt2i5Lmie6
 6rtFMkkH4wuQiyh9ZkvFoXgSm/3948VOKDYEZphSCR3mLNq4qg+PMbx7r2Jk2Uu1iq8u
 kLMw==
X-Gm-Message-State: APjAAAXeABOO5HuPXk+ameN18t1a11YRAJ2fJcGYy9V2lgmgBhWhqTun
 Gp7Yv5b9DtViRa48mWqGsKW/qsAl9qU=
X-Google-Smtp-Source: APXvYqwZp+eqZfgYs1IGOmJqibRJXihrLUQgJXa/cIY9CYZ7roUnZsdgygXMNu6cDjGQToSx3F42dg==
X-Received: by 2002:a17:906:e2c2:: with SMTP id
 gr2mr474261ejb.284.1561495338556; 
 Tue, 25 Jun 2019 13:42:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id u9sm5187262edm.71.2019.06.25.13.42.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 25 Jun 2019 13:42:17 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 4/7] drm/radeon: Fill out gem_object->resv
Date: Tue, 25 Jun 2019 22:42:05 +0200
Message-Id: <20190625204208.5614-5-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190625204208.5614-1-daniel.vetter@ffwll.ch>
References: <20190625204208.5614-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OA0IQv9baBUNHJdaP8PpqlCkftyGM7foSidBQ59YkzA=;
 b=XroD1KSVlxmM6d1QXsYPknxJIzwCnr6iYF2MhkxhggNfu4JoDr9lEYsNLeoW/CGHqv
 hCZ+FEcBfrypUelAMZeUTuVodN0SXxwU1J528R+0ztYUN+hjm4IZSiQqbO8cn0fuVrGh
 0FeUtSN0FvRb58Uvd1pueRacSocr73uqJUtog=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhdCB3YXkgd2UgY2FuIGRpdGNoIG91ciBnZW1fcHJpbWVfcmVzX29iaiBpbXBsZW1lbnRhdGlv
bi4gU2luY2UgdHRtCmFic29sdXRlbHkgbmVlZHMgdGhlIHJpZ2h0IHJlc2VydmF0aW9uIG9iamVj
dCBhbGwgdGhlIGJvaWxlcnBsYXRlIGlzCmFscmVhZHkgdGhlcmUgYW5kIHdlIGp1c3QgaGF2ZSB0
byB3aXJlIGl0IHVwIGNvcnJlY3RseS4KCk5vdGUgdGhhdCBnZW0vcHJpbWUgZG9lc24ndCBjYXJl
IHdoZW4gd2UgZG8gdGhpcywgYXMgbG9uZyBhcyB3ZSBkbyBpdApiZWZvcmUgdGhlIGJvIGlzIHJl
Z2lzdGVyZWQgYW5kIHNvbWVvbmUgY2FuIGNhbGwgdGhlIGhhbmRsZTJmZCBpb2N0bApvbiBpdC4K
CkFzaWRlOiB0dG1fYnVmZmVyX29iamVjdC50dG1fcmVzdiBjb3VsZCBwcm9iYWJseSBiZSBkaXRj
aGVkIGluIGZhdm91cgpvZiBhbHdheXMgcGFzc2luZyBhIG5vbi1OVUxMIHJlc3YgdG8gdHRtX2Jv
X2luaXQoKS4gQXQgbGVhc3QgZm9yIGdlbQpkcml2ZXJzIHRoYXQgd291bGQgYXZvaWQgaGF2aW5n
IHR3byBvZiB0aGVzZSwgb24gaW4gdHRtX2J1ZmZlcl9vYmplY3QKYW5kIHRoZSBvdGhlciBpbiBk
cm1fZ2VtX29iamVjdCwgb25lIGp1c3QgdGhlcmUgZm9yIGNvbmZ1c2lvbi4KClJldmlld2VkLWJ5
OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgpTaWduZWQtb2ZmLWJ5
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KQ2M6IEFsZXggRGV1Y2hl
ciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogIkRhdmlkIChDaHVuTWluZykgWmhvdSIgPERhdmlk
MS5aaG91QGFtZC5jb20+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwotLS0KIGRy
aXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5jICAgIHwgMiAtLQogZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9yYWRlb25fb2JqZWN0LmMgfCAxICsKIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24v
cmFkZW9uX3ByaW1lLmMgIHwgNyAtLS0tLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24v
cmFkZW9uX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmMKaW5kZXgg
NDQwM2U3NmUxYWUwLi5hNGE3OGRmZGVmMzcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9y
YWRlb24vcmFkZW9uX2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Ry
di5jCkBAIC0xNTIsNyArMTUyLDYgQEAgc3RydWN0IGRybV9nZW1fb2JqZWN0ICpyYWRlb25fZ2Vt
X3ByaW1lX2ltcG9ydF9zZ190YWJsZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCQkJCQkJCXN0
cnVjdCBzZ190YWJsZSAqc2cpOwogaW50IHJhZGVvbl9nZW1fcHJpbWVfcGluKHN0cnVjdCBkcm1f
Z2VtX29iamVjdCAqb2JqKTsKIHZvaWQgcmFkZW9uX2dlbV9wcmltZV91bnBpbihzdHJ1Y3QgZHJt
X2dlbV9vYmplY3QgKm9iaik7Ci1zdHJ1Y3QgcmVzZXJ2YXRpb25fb2JqZWN0ICpyYWRlb25fZ2Vt
X3ByaW1lX3Jlc19vYmooc3RydWN0IGRybV9nZW1fb2JqZWN0ICopOwogdm9pZCAqcmFkZW9uX2dl
bV9wcmltZV92bWFwKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKTsKIHZvaWQgcmFkZW9uX2dl
bV9wcmltZV92dW5tYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosIHZvaWQgKnZhZGRyKTsK
IApAQCAtNTY2LDcgKzU2NSw2IEBAIHN0YXRpYyBzdHJ1Y3QgZHJtX2RyaXZlciBrbXNfZHJpdmVy
ID0gewogCS5nZW1fcHJpbWVfZXhwb3J0ID0gcmFkZW9uX2dlbV9wcmltZV9leHBvcnQsCiAJLmdl
bV9wcmltZV9waW4gPSByYWRlb25fZ2VtX3ByaW1lX3BpbiwKIAkuZ2VtX3ByaW1lX3VucGluID0g
cmFkZW9uX2dlbV9wcmltZV91bnBpbiwKLQkuZ2VtX3ByaW1lX3Jlc19vYmogPSByYWRlb25fZ2Vt
X3ByaW1lX3Jlc19vYmosCiAJLmdlbV9wcmltZV9nZXRfc2dfdGFibGUgPSByYWRlb25fZ2VtX3By
aW1lX2dldF9zZ190YWJsZSwKIAkuZ2VtX3ByaW1lX2ltcG9ydF9zZ190YWJsZSA9IHJhZGVvbl9n
ZW1fcHJpbWVfaW1wb3J0X3NnX3RhYmxlLAogCS5nZW1fcHJpbWVfdm1hcCA9IHJhZGVvbl9nZW1f
cHJpbWVfdm1hcCwKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX29i
amVjdC5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fb2JqZWN0LmMKaW5kZXggMjFm
NzNmYzg2ZjM4Li43YTJiYWQ4NDNmOGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRl
b24vcmFkZW9uX29iamVjdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX29i
amVjdC5jCkBAIC0yNjIsNiArMjYyLDcgQEAgaW50IHJhZGVvbl9ib19jcmVhdGUoc3RydWN0IHJh
ZGVvbl9kZXZpY2UgKnJkZXYsCiAJciA9IHR0bV9ib19pbml0KCZyZGV2LT5tbWFuLmJkZXYsICZi
by0+dGJvLCBzaXplLCB0eXBlLAogCQkJJmJvLT5wbGFjZW1lbnQsIHBhZ2VfYWxpZ24sICFrZXJu
ZWwsIGFjY19zaXplLAogCQkJc2csIHJlc3YsICZyYWRlb25fdHRtX2JvX2Rlc3Ryb3kpOworCWJv
LT5nZW1fYmFzZS5yZXN2ID0gYm8tPnRiby5yZXN2OwogCXVwX3JlYWQoJnJkZXYtPnBtLm1jbGtf
bG9jayk7CiAJaWYgKHVubGlrZWx5KHIgIT0gMCkpIHsKIAkJcmV0dXJuIHI7CmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9wcmltZS5jIGIvZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9yYWRlb25fcHJpbWUuYwppbmRleCBkZWFmZmNlNTBhMmUuLjhjZTNlODA0NWQ0MiAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fcHJpbWUuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9wcmltZS5jCkBAIC0xMTcsMTMgKzExNyw2IEBA
IHZvaWQgcmFkZW9uX2dlbV9wcmltZV91bnBpbihzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaikK
IH0KIAogCi1zdHJ1Y3QgcmVzZXJ2YXRpb25fb2JqZWN0ICpyYWRlb25fZ2VtX3ByaW1lX3Jlc19v
Ymooc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopCi17Ci0Jc3RydWN0IHJhZGVvbl9ibyAqYm8g
PSBnZW1fdG9fcmFkZW9uX2JvKG9iaik7Ci0KLQlyZXR1cm4gYm8tPnRiby5yZXN2OwotfQotCiBz
dHJ1Y3QgZG1hX2J1ZiAqcmFkZW9uX2dlbV9wcmltZV9leHBvcnQoc3RydWN0IGRybV9nZW1fb2Jq
ZWN0ICpnb2JqLAogCQkJCQlpbnQgZmxhZ3MpCiB7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
