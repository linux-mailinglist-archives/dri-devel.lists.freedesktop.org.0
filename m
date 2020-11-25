Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DA52C40B9
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 13:59:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48A8288F04;
	Wed, 25 Nov 2020 12:59:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B976E997
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 12:59:24 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id d18so2435568edt.7
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 04:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qwWoaRbKfflhDARL0uKDwG9/PiE709nvXW7gvtTi0K0=;
 b=mpIbsO1BSmnLK0BiG3IuxHHkdwR77Xxn9lYP6Yzej38aeRD7SJXBuBLO0YCq2L+52G
 LAcp+iuGxGDRgIALVsfrU3XemwTmp8toNpt8iNevmdONubm2t8t0HH4zxlNL4yLZ3big
 H0Q8370T30r9zVqrZ1ABrRHU0doz25VoS8cnE0jk7Yu1UXf/gXSEeFgBmtayEhAto0E5
 ODRCpJX3Xky2NpVtDLs67V1L+l/3/Am4/UnzEd1h15EBUHDY/wRo5mPZoZvJ8vz6b4R9
 j5RHW6d01r72AkF/A3cnAF9gI/zoor6IBirBH43b8NT14Za6r47QzDzc/V05v3cHTSWc
 SrDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qwWoaRbKfflhDARL0uKDwG9/PiE709nvXW7gvtTi0K0=;
 b=WjhGV4qOB9TLVIm4+TGdtoERBFhWgg8vOY798ybddMAyw64wN9h2JSb3kMCPhTL/5z
 1FNjnq4GOskj7sLRfEhUC4LirCB2Jn6jCfgAuyZo3QFpjWBG/TkfKuGvLVi40eXGEyvt
 74hfYkwzYjF5g1mxAG2XQgDzn1+wa16VryHMWRMnQlBsEwXXrvH/yY/N6ZfXAfkPqIht
 vKt8vST5E4rVS9YrBXzZE8ljxm+QEkGuOd+OFIkqwMbly8ppk3f2I2j04blvwL4xB1Wq
 bZSZl7args4lLVsYJ/gym39FsVUcQfwtsXpYrX8xcf24sXFMsPLx1dtNs5DPB3+xOGTE
 JRTw==
X-Gm-Message-State: AOAM532m5GO2dfNW04oOmn6AFv7Dl69mvcJQXOzYds3+PRsKcaSt/cmI
 SkhPmgeEsM1fThxs221MShGXpBJl3XI=
X-Google-Smtp-Source: ABdhPJy0DutWL9ZKuiYDIFU1UnZfl9pYvCjeyNuZPLtXa2EmV1luwmouXL/uyw1v0tmIZGtZT4sOwQ==
X-Received: by 2002:a05:6402:553:: with SMTP id
 i19mr3384469edx.194.1606309162652; 
 Wed, 25 Nov 2020 04:59:22 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:87d9:eeff:99f6:84c2])
 by smtp.gmail.com with ESMTPSA id z19sm1203188ejj.101.2020.11.25.04.59.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 04:59:22 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/7] drm/nouveau: stop using pages with
 drm_prime_sg_to_page_addr_arrays v2
Date: Wed, 25 Nov 2020 13:59:15 +0100
Message-Id: <20201125125919.1372-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201125125919.1372-1-christian.koenig@amd.com>
References: <20201125125919.1372-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

VGhpcyBpcyBkZXByZWNhdGVkLCBhbHNvIGRyb3AgdGhlIGNvbW1lbnQgYWJvdXQgZmF1bHRzLgoK
djI6IGFsc28gdXNlIHR0bV9zZ190dF9pbml0IHRvIGF2b2lkIGFsbG9jYXRpbmcgdGhlIHBhZ2Ug
YXJyYXkuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jICAgIHwg
NiArKystLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfc2dkbWEuYyB8IDIgKy0K
IDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYyBiL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYwppbmRleCA3YWE0Mjg2Nzg0YWUuLmMzMGYwODhjZWZj
YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYwpAQCAtMTIzNSw5ICsxMjM1LDkg
QEAgbm91dmVhdV90dG1fdHRfcG9wdWxhdGUoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsCiAJ
CXJldHVybiAwOwogCiAJaWYgKHNsYXZlICYmIHR0bS0+c2cpIHsKLQkJLyogbWFrZSB1c2Vyc3Bh
Y2UgZmF1bHRpbmcgd29yayAqLwotCQlkcm1fcHJpbWVfc2dfdG9fcGFnZV9hZGRyX2FycmF5cyh0
dG0tPnNnLCB0dG0tPnBhZ2VzLAotCQkJCQkJIHR0bV9kbWEtPmRtYV9hZGRyZXNzLCB0dG0tPm51
bV9wYWdlcyk7CisJCWRybV9wcmltZV9zZ190b19wYWdlX2FkZHJfYXJyYXlzKHR0bS0+c2csIE5V
TEwsCisJCQkJCQkgdHRtX2RtYS0+ZG1hX2FkZHJlc3MsCisJCQkJCQkgdHRtLT5udW1fcGFnZXMp
OwogCQlyZXR1cm4gMDsKIAl9CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L25vdXZlYXVfc2dkbWEuYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfc2dkbWEu
YwppbmRleCBhMmUyM2ZkNDkwNmMuLjFjZjUyNjM1ZWE3NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvbm91dmVhdV9zZ2RtYS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L25vdXZlYXVfc2dkbWEuYwpAQCAtODQsNyArODQsNyBAQCBub3V2ZWF1X3NnZG1hX2NyZWF0
ZV90dG0oc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywgdWludDMyX3QgcGFnZV9mbGFncykK
IAlpZiAoIW52YmUpCiAJCXJldHVybiBOVUxMOwogCi0JaWYgKHR0bV9kbWFfdHRfaW5pdCgmbnZi
ZS0+dHRtLCBibywgcGFnZV9mbGFncywgY2FjaGluZykpIHsKKwlpZiAodHRtX3NnX3R0X2luaXQo
Jm52YmUtPnR0bSwgYm8sIHBhZ2VfZmxhZ3MsIGNhY2hpbmcpKSB7CiAJCWtmcmVlKG52YmUpOwog
CQlyZXR1cm4gTlVMTDsKIAl9Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
