Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3489ADF7EC
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 00:21:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61DDD6E29A;
	Mon, 21 Oct 2019 22:21:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FA6E6E1BD;
 Mon, 21 Oct 2019 18:09:54 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id a1so17062603ioc.6;
 Mon, 21 Oct 2019 11:09:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=PwDqUExav+cvbganG+erWbWCIApPv5iXkwoEhIS0cuM=;
 b=OM2bosI7Y4NXyIlz5+LOlkxLsWcAKuyNIMeX0YK8Hd9iQJvJx1rBnqbf2c7VH4+y6F
 kts96XNJJmaE95AuLDjgkMKH7fb7ulb41ZC49xzDb/eHboY+E4jskG6/gx5HTzTgGsYM
 WAwiXGGe9Cug7ec27rOlAiBvKTmmf/ouPnUaEJe+RU71SdajvNTHNxICBNYxAKkXJ8GG
 VqKUrTnn8OUySXNDN9oyPdffcpa0FtS6ZibqdsKUZtTB4MPwrhM9isqsMoIAiqJBH+4f
 5gnuRyno8zIuVEobCC8ZhCeO57KtKWArCVBg4aKdtyyvCri9Uc0aCGI+GPH9RLH1HZGO
 czDg==
X-Gm-Message-State: APjAAAUvm2yKiNQ4qEzU3LgyJxcns8qAJkSJhMB4TjEkw+9h6JwZU9pe
 VUXHSPucYElC2N1uVZ+aK/E=
X-Google-Smtp-Source: APXvYqznSmzhy0wTWi5lvuUY2S8YwDjtVPi2bLQB0Nx5j3prHKAAifbyhvoswa2OOS7Mz3aEo4AjgQ==
X-Received: by 2002:a6b:7942:: with SMTP id j2mr23507522iop.161.1571681393819; 
 Mon, 21 Oct 2019 11:09:53 -0700 (PDT)
Received: from cs-dulles.cs.umn.edu (cs-dulles.cs.umn.edu. [128.101.35.54])
 by smtp.googlemail.com with ESMTPSA id g13sm3715386ion.23.2019.10.21.11.09.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 11:09:53 -0700 (PDT)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: 
Subject: [PATCH] drm/amdgpu: Fix memory leak in amdgpu_fence_emit
Date: Mon, 21 Oct 2019 13:09:40 -0500
Message-Id: <20191021180944.22183-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 21 Oct 2019 22:21:17 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=PwDqUExav+cvbganG+erWbWCIApPv5iXkwoEhIS0cuM=;
 b=Go1yH8C47c3vJg+g89NxR1MiSoBSlsfDJXv7TaDG1nV08X69HQyCZGO5W6faTh+D+1
 +eaXtDaKwqfoCPn93hax7poha82vC5pB8+YNc0Ghqngkh4zj+p5YFy1dBw2blL5gQHgz
 5HtFWOLUiEzmexkVWuywVSuLOD57Y6muqgH1esvAeBf+UnYuBC2Xk8MN8+tVbSflfHjI
 UmFuz54+gdjwVohH8FfSFDItW/BM5qlHmMZj8ozrwK+Cco0eJZK/UPL7K9ImlGWao4Yb
 OJaOvIksdMP2SAFj0KV1nfmZxQdDL8PnueY9UhCNF8jaU9/AJgMTXHzV3lQlwP5YpXOq
 Ou3A==
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
Cc: Jack Xiao <Jack.Xiao@amd.com>, David Airlie <airlied@linux.ie>,
 kjlu@umn.edu, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Hawking Zhang <Hawking.Zhang@amd.com>, emamd001@umn.edu,
 dri-devel@lists.freedesktop.org, smccaman@umn.edu,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Navid Emamdoost <navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gdGhlIGltcGVsZW1lbnRhdGlvbiBvZiBhbWRncHVfZmVuY2VfZW1pdCgpIGlmIGRtYV9mZW5j
ZV93YWl0KCkgZmFpbHMKYW5kIHJldHVybnMgYW4gZXJybm8sIGJlZm9yZSByZXR1cm5pbmcgdGhl
IGFsbG9jYXRlZCBtZW1vcnkgZm9yIGZlbmNlCnNob3VsZCBiZSByZWxlYXNlZC4KCkZpeGVzOiAz
ZDJhY2E4Yzg2MjAgKCJkcm0vYW1kZ3B1OiBmaXggb2xkIGZlbmNlIGNoZWNrIGluIGFtZGdwdV9m
ZW5jZV9lbWl0IikKU2lnbmVkLW9mZi1ieTogTmF2aWQgRW1hbWRvb3N0IDxuYXZpZC5lbWFtZG9v
c3RAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9mZW5j
ZS5jIHwgNCArKystCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ZlbmNl
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZmVuY2UuYwppbmRleCAyMzA4
NWIzNTJjZjIuLjJmNTljOTI3MGE3ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2ZlbmNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2ZlbmNlLmMKQEAgLTE2Niw4ICsxNjYsMTAgQEAgaW50IGFtZGdwdV9mZW5jZV9lbWl0KHN0
cnVjdCBhbWRncHVfcmluZyAqcmluZywgc3RydWN0IGRtYV9mZW5jZSAqKmYsCiAJCWlmIChvbGQp
IHsKIAkJCXIgPSBkbWFfZmVuY2Vfd2FpdChvbGQsIGZhbHNlKTsKIAkJCWRtYV9mZW5jZV9wdXQo
b2xkKTsKLQkJCWlmIChyKQorCQkJaWYgKHIpIHsKKwkJCQlkbWFfZmVuY2VfcHV0KGZlbmNlKTsK
IAkJCQlyZXR1cm4gcjsKKwkJCX0KIAkJfQogCX0KIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
