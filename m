Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3161AB18F1
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 09:30:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E37636EEA9;
	Fri, 13 Sep 2019 07:30:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8BC86EEA9
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 07:30:12 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id a11so21225164wrx.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 00:30:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=emgUfSGoalB8aItLvyoLpH7oBb38gQMmE2HazsmKrf4=;
 b=cLi3qTmTV8CClB9aGx5MrcSwH3ah2MBRo8Oq59oujOpV7dTCQUvKqBZzquAgDKTh3B
 b3DI/bU52/r/GfBDEkoejK+AM7bwh/LIYCZP+mgnfJyOPiyy1x1rP+DK+ypOmGLuC0/+
 n0K1KTWAV9Jk6w3R0iyd57RdH9eA14pVfYzGv0wltKH7pFmZABfGVHjgldo45ztuOMYm
 JDc9pVXaqhtKntwRxKtNmnomNAec5tBWuLDlv1VFKsyEn6xqVrf9JCVDf/yRb6uqmUap
 03qzK7fCG9yRsgqrp6LotzMluMWeKxVQHi0a3DxEnJKAHDhAFRM09aVTgC612p70wcPh
 bHZw==
X-Gm-Message-State: APjAAAUdHylcDQ6XhlXUVNxeZBCqgSOzL9XL3+EgcnhMQ5FpSor3rKKO
 kalm2zarE2EUkyybu7iIN5nzb9QO
X-Google-Smtp-Source: APXvYqyhS9EEDm8Hyu9mt82PEAqcFi8a+7UKrD+4zcBGBmV3OdsdcI4L7H0u3yufapFlj+WH8fkQKQ==
X-Received: by 2002:a5d:48c2:: with SMTP id p2mr17214529wrs.348.1568359811463; 
 Fri, 13 Sep 2019 00:30:11 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:fd97:b16a:b9f0:9362])
 by smtp.gmail.com with ESMTPSA id b62sm1936645wmc.13.2019.09.13.00.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2019 00:30:10 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Tom.StDenis@amd.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: fix memory leak in ttm_bo_mem_space
Date: Fri, 13 Sep 2019 09:30:10 +0200
Message-Id: <20190913073010.18891-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=emgUfSGoalB8aItLvyoLpH7oBb38gQMmE2HazsmKrf4=;
 b=X2egpxUqOK5b8EeJORQyJjNHx5XbPLfud38gZnkABnUwMTWP+xyiufng3verA5HQJ+
 a3RSNaZdtkSXrV+PohUwLLSJCr10ErRidXsEl7Fu7x84F4MeEr7lHrgoXpvz4f7Ueb6R
 GKQhrmGaRLXqte93bP5hiqiDz1AMF4b6HU/R8BEg1FIe5xEo7BUvr8c2kPmKKfOneFUh
 IzBiLIXrDx2fsMwWUrP7Yokd86KjGt0qrZpuZVpSKh2jf3k98xVKALR9MhQkP3EQ6vcC
 uBGZVbEE4fSVgEBWWbOOw+7uG0rLv0X355isWzjqSoQuFgLXeJcYvEwC2xJppND8z8BH
 wqsg==
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

Rml4IGFjY2lkZW50aWFsIHJlbW92ZWQgbGluZSBpbiBjb21taXQgNzI2YjdkNDE3MGU1ICJkcm0v
dHRtOiByZXR1cm4gLUVCVVNZIG9uIHBpcGVsaW5pbmcgd2l0aCBub19ncHVfd2FpdCIuCgpTaWdu
ZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyBi
L2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKaW5kZXggMjg5OTcwMjEzOWZiLi4wZmFhZWQ0
YWI3ZjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwpAQCAtMTEzMSw2ICsxMTMxLDcgQEAgaW50IHR0bV9i
b19tZW1fc3BhY2Uoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKIAogCQkJZ290byBlcnJv
cjsKIAkJfQorCQlyZXR1cm4gMDsKIAl9CiAKIAlmb3IgKGkgPSAwOyBpIDwgcGxhY2VtZW50LT5u
dW1fYnVzeV9wbGFjZW1lbnQ7ICsraSkgewotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
