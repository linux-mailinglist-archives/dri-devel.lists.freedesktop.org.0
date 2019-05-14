Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 755301C8BF
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 14:31:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2340892FA;
	Tue, 14 May 2019 12:31:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ECE7892E6;
 Tue, 14 May 2019 12:31:34 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id h11so2595747wmb.5;
 Tue, 14 May 2019 05:31:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NUrnb30ow4au7x3kFOJ5qsnjmB2Ur0aosnqG85r+mfY=;
 b=Q/h6lMO6bHqbxZEJuqGRuoAitX/ORGRgkrOLwGfYuyjFuHKQ607RtMCmgIWHfz/aoM
 c20AB5G4MwXB1upwTMcY1UI+JWeqbJZ8Ax+BGw6Wi0dhPqzFw5qtiDrEulBcrNF74PBc
 7/N8bmayhbmIhFv0dYOJFhcRiqkAaHWDzJjseExnDlf3Yb4Kc3TcpX0CAKB0buwnlCc6
 kLOieAFRraPB8p3EoSu3uZoX/JnQbZEzdKtyGkgZxTL96GVdiRRcdeep8EGS1v5Ng6l+
 gTbs7DuSKNgIy3zg9EcwmZKA6nYdw2+g1iZIjFIu3M1k95b0e4AnmtWEu+Pm5KMuQGl1
 tojA==
X-Gm-Message-State: APjAAAV5ea0vPnxKHdTlIWKRXvs86Dx2OP8AJZn9QKIkH655+RiXuUbq
 PY1NHY9ENm7bX3AFvosYAWU=
X-Google-Smtp-Source: APXvYqz31naCOU2Ep6yuMZN9ND+jdkMdyC2H/Gy5aSh7iE+xFvfJ7tzKWTf82lzFbfiMvqLAQXgbww==
X-Received: by 2002:a1c:4045:: with SMTP id n66mr2342669wma.142.1557837092970; 
 Tue, 14 May 2019 05:31:32 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:7d94:f6f9:368b:5a3b])
 by smtp.gmail.com with ESMTPSA id n4sm6128704wmb.22.2019.05.14.05.31.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 May 2019 05:31:32 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Marek.Olsak@amd.com, David1.Zhou@amd.com, Prike.Liang@amd.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 04/11] drm/ttm: return immediately in case of a signal
Date: Tue, 14 May 2019 14:31:20 +0200
Message-Id: <20190514123127.1650-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190514123127.1650-1-christian.koenig@amd.com>
References: <20190514123127.1650-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=NUrnb30ow4au7x3kFOJ5qsnjmB2Ur0aosnqG85r+mfY=;
 b=lAmezbBM3CcXMrMQ2khTrqD04Z8cbx99xYkxkXQIg5vaZUipIZegpCaHp3J/QYNEPK
 Dt7gHtee+4JSBFExla6tICdZTv0t1FNDuU/JHohtYNH2x7TGcHcbJWlyCFphka1mT59y
 IViGXz3i42WJRFsSMXEA7pZs1uL0YDrNtUyd1CIke4eSfOW3U5PN7LVxQSnv0IpkMUUh
 m8C4CJ0zBfstD52CbGGfkh6gbkSs+fw17Kvcms/IYKZnLAazHgL/v4Vejne5NbeF85eH
 tu/e7SHENPCafNi67v0Hvu9cew+El25zO1xU4Pm/649XJ5ravLAlzO5rpoGlS7JVUwGn
 WQ9Q==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiBhIHNpZ25hbCBhcnJpdmVzIHdlIHNob3VsZCByZXR1cm4gaW1tZWRpYXRlbHkgZm9yCmhh
bmRsaW5nIGl0IGFuZCBub3QgdHJ5IG90aGVyIHBsYWNlbWVudHMgZmlyc3QuCgpTaWduZWQtb2Zm
LWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyB8IDcgKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vdHRtL3R0bV9iby5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwppbmRleCA2ZTlm
Zjk0YTA4NWQuLjZmNjkyZjkyZDBmNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90
dG1fYm8uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCkBAIC0xMDU1LDcgKzEw
NTUsNiBAQCBpbnQgdHRtX2JvX21lbV9zcGFjZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJv
LAogCXVpbnQzMl90IGN1cl9mbGFncyA9IDA7CiAJYm9vbCB0eXBlX2ZvdW5kID0gZmFsc2U7CiAJ
Ym9vbCB0eXBlX29rID0gZmFsc2U7Ci0JYm9vbCBoYXNfZXJlc3RhcnRzeXMgPSBmYWxzZTsKIAlp
bnQgaSwgcmV0OwogCiAJcmV0ID0gcmVzZXJ2YXRpb25fb2JqZWN0X3Jlc2VydmVfc2hhcmVkKGJv
LT5yZXN2LCAxKTsKQEAgLTExNDYsOCArMTE0NSw4IEBAIGludCB0dG1fYm9fbWVtX3NwYWNlKHN0
cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCiAJCQltZW0tPnBsYWNlbWVudCA9IGN1cl9mbGFn
czsKIAkJCXJldHVybiAwOwogCQl9Ci0JCWlmIChyZXQgPT0gLUVSRVNUQVJUU1lTKQotCQkJaGFz
X2VyZXN0YXJ0c3lzID0gdHJ1ZTsKKwkJaWYgKHJldCAmJiByZXQgIT0gLUVCVVNZKQorCQkJcmV0
dXJuIHJldDsKIAl9CiAKIAlpZiAoIXR5cGVfZm91bmQpIHsKQEAgLTExNTUsNyArMTE1NCw3IEBA
IGludCB0dG1fYm9fbWVtX3NwYWNlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCiAJCXJl
dHVybiAtRUlOVkFMOwogCX0KIAotCXJldHVybiAoaGFzX2VyZXN0YXJ0c3lzKSA/IC1FUkVTVEFS
VFNZUyA6IC1FTk9NRU07CisJcmV0dXJuIC1FTk9NRU07CiB9CiBFWFBPUlRfU1lNQk9MKHR0bV9i
b19tZW1fc3BhY2UpOwogCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
