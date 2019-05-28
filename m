Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C41A2CBCB
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 18:26:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C9A889F99;
	Tue, 28 May 2019 16:26:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D976897BC;
 Tue, 28 May 2019 16:26:01 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id w13so12566347wru.11;
 Tue, 28 May 2019 09:26:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C4uia/ycUgIKO6QhXoiinmt+GNVjEhvarrWo6ZkLu3E=;
 b=qHUfA/K1XKkdRyzdwld+d9Zrcg2hpFp6G80SA8SDfppeW1/ACHHYZRCtgfQZ/TTvci
 whY6G/ZQbLsaK4kFRZk1UPhAeafZ5m19sR8kXBYd2T4poX4w4c1R/t3A35psPNMl+7uX
 Gj4MWApJocjXGZmpyROUKcBAM31PNqBn3CAyLOnpRhenwQhkrVvq4s2BQ2iVmSZ5VoQT
 7auwIDKWbPHGoLUYkaSgw50suC0wBLTLYloKhC/BDO1uj+Lut42+173nB1Si0R8SH9D+
 cu50NP33Xsf32sKsHIYGMrhsixukESGy3mHwUFQ92qkRubMpNKG6QCADRNA2ZhC8xBO/
 h/2w==
X-Gm-Message-State: APjAAAVbA9TvL7Ew38s35x3p1q/mvxDx28OkNdI/KEYlaC20i+ZMcGG0
 WJ7/YasrHoiLs7ytft7rIgg=
X-Google-Smtp-Source: APXvYqwbeA82tJUB/S+J9DcAGTKe7HK4C/LkqgdG8BttysHqgHysILVx0iNvsO00qRuiZK27wXkNrQ==
X-Received: by 2002:adf:ce03:: with SMTP id p3mr12139565wrn.94.1559060760234; 
 Tue, 28 May 2019 09:26:00 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:3163:ab92:73d9:6693])
 by smtp.gmail.com with ESMTPSA id f10sm28835470wrg.24.2019.05.28.09.25.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 May 2019 09:25:59 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: David1.Zhou@amd.com, Marek.Olsak@amd.com, Prike.Liang@amd.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 02/10] drm/ttm: return immediately in case of a signal
Date: Tue, 28 May 2019 18:25:49 +0200
Message-Id: <20190528162557.1280-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190528162557.1280-1-christian.koenig@amd.com>
References: <20190528162557.1280-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=C4uia/ycUgIKO6QhXoiinmt+GNVjEhvarrWo6ZkLu3E=;
 b=V7n8ThlvTC7njohYgfaPpDBhGsJxENixHUwh9ub4HDBXM04mAxtK+Mgn8sdBA4iTnP
 /NV8yoZ5QpU2faGMhmuCts0Z58X04/Qv0lPv6S7R0rEL24k6ijyz44tZ3wY7mNElXMKS
 I8qkjgnam+OJKMtOMmts5/jDafrBroB/T32o0AC8DZ9DWAk29XP8AvzSa0T2ByIXx140
 haDYYv/hgC7/IaOfNtr6Uyr+O0CLrz9b1wj0LPRDxzM9tXsmNLBvpHatlGpW2fwvfwu4
 0Nv5XoVYXfTXsBR8tpqQo51wHvWJzjSaREiWQn5HLYHyjvCW30CVMpbd46cTiTDCA5Yu
 cfsA==
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
