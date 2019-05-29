Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 032912DCDE
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 14:27:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 887FF6E2F3;
	Wed, 29 May 2019 12:27:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2168F6E0FD;
 Wed, 29 May 2019 12:27:06 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id y3so1550597wmm.2;
 Wed, 29 May 2019 05:27:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C4uia/ycUgIKO6QhXoiinmt+GNVjEhvarrWo6ZkLu3E=;
 b=SSaOrd1v0gBJtat68ltsfxsBVu/RVS1AMjL+xEKaVrltXWfZPfPekW55MLNLC8a7rY
 X5TNrq431yCf2A/dUWz9XCWIk3VMbH3euW8zsU9Yo4CA7BG2HgSkQ7molfHA9SuyVyQ3
 NBMX/fkfnqmG63MAA+QK+4bI/gRSBpRtSdNm3OLlAbflMc/A/9R56F9URlFV7jmiibIO
 h3q6cVnTFmp7Amq/+WCXOyVEDaFGsF7oTy1pOQKXm/52J1aPQWXokDNMdVppZjnTezPR
 gvSmKiqg/F3Cr0eyddy5WqJY893fuLHqJBR/hCX4way0/huFWTadSgbxsQYHyaoDoXUd
 ZYMA==
X-Gm-Message-State: APjAAAVqq7oDJfr7LMO+kJEr9JXg+FzqaGjh6huC2n22hWTICbjJMxgw
 TnDwUQ5NLoa/HC9XOM96xBymXHDr
X-Google-Smtp-Source: APXvYqwaDEyW+yojE2Km4QiC9r5z10LQ0AO6jNBzT58jQHj10w39DAodosIvxOJuJjxD1Ay27w1SIg==
X-Received: by 2002:a1c:7d4e:: with SMTP id y75mr5743187wmc.169.1559132824590; 
 Wed, 29 May 2019 05:27:04 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:1ea:e785:ab1c:e514])
 by smtp.gmail.com with ESMTPSA id z25sm6211343wmi.5.2019.05.29.05.27.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 May 2019 05:27:04 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 02/10] drm/ttm: return immediately in case of a signal
Date: Wed, 29 May 2019 14:26:54 +0200
Message-Id: <20190529122702.13035-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190529122702.13035-1-christian.koenig@amd.com>
References: <20190529122702.13035-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=C4uia/ycUgIKO6QhXoiinmt+GNVjEhvarrWo6ZkLu3E=;
 b=kGkQEWJ85SffmKAtgXbk+O3pkCMsD2iIpF92K23saprErosR/D5tdAJrpKwy+eQIz2
 cotOWO8E/qjvi4yR1nrKuIZJCFfXED220R2ypOs3h2mY2xJURNpi85Cc2c+izJfiZPWv
 Cm716FMh3BjgjGfvEdPJ8gEKTdJpP0z+++7hFcbAP1jB1dnjJj6nQDC4eMmaFKtre8rQ
 ATcK3r9mTqpS9H6Jt5xqziJXw041/K9xszm++CJEMf0BXYIe26PSYhuKt/sinK3Y1nf3
 DlECLmxK/axnH2o1p2RlZb8Em2XRV0KhsDF1SNY5tAXbQcfDflZgThh2vsELRkzCraby
 IbEA==
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
cm0vdHRtL3R0bV9iby5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwppbmRleCAwNmJi
Y2QyNjc5YjIuLjdiNTllNWVjZGU3ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90
dG1fYm8uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCkBAIC05NzksNyArOTc5
LDYgQEAgaW50IHR0bV9ib19tZW1fc3BhY2Uoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywK
IAl1aW50MzJfdCBjdXJfZmxhZ3MgPSAwOwogCWJvb2wgdHlwZV9mb3VuZCA9IGZhbHNlOwogCWJv
b2wgdHlwZV9vayA9IGZhbHNlOwotCWJvb2wgaGFzX2VyZXN0YXJ0c3lzID0gZmFsc2U7CiAJaW50
IGksIHJldDsKIAogCXJldCA9IHJlc2VydmF0aW9uX29iamVjdF9yZXNlcnZlX3NoYXJlZChiby0+
cmVzdiwgMSk7CkBAIC0xMDcwLDggKzEwNjksOCBAQCBpbnQgdHRtX2JvX21lbV9zcGFjZShzdHJ1
Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogCQkJbWVtLT5wbGFjZW1lbnQgPSBjdXJfZmxhZ3M7
CiAJCQlyZXR1cm4gMDsKIAkJfQotCQlpZiAocmV0ID09IC1FUkVTVEFSVFNZUykKLQkJCWhhc19l
cmVzdGFydHN5cyA9IHRydWU7CisJCWlmIChyZXQgJiYgcmV0ICE9IC1FQlVTWSkKKwkJCXJldHVy
biByZXQ7CiAJfQogCiAJaWYgKCF0eXBlX2ZvdW5kKSB7CkBAIC0xMDc5LDcgKzEwNzgsNyBAQCBp
bnQgdHRtX2JvX21lbV9zcGFjZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogCQlyZXR1
cm4gLUVJTlZBTDsKIAl9CiAKLQlyZXR1cm4gKGhhc19lcmVzdGFydHN5cykgPyAtRVJFU1RBUlRT
WVMgOiAtRU5PTUVNOworCXJldHVybiAtRU5PTUVNOwogfQogRVhQT1JUX1NZTUJPTCh0dG1fYm9f
bWVtX3NwYWNlKTsKIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
