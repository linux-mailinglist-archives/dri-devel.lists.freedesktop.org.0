Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5173359631
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 09:17:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F9DA6E47E;
	Fri,  9 Apr 2021 07:17:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 567346EB9A
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 07:17:28 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id g5so350972ejx.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Apr 2021 00:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MAgKFkUbajfTwkiBbjHCwLbY8LqpQ8PBmh7VA/cwU0E=;
 b=igEspD4oLTpM4o2jCwSGcYwjzgvaFDiBYrZde/yigoCOzASZ6Q36kFdOLTPk9+sEKA
 At9Rg6okYKLJenOHCVlutmLzuLAhyDZfgGBYJ66Oj8C6MPsS8wita034AoWkMFIgC25Z
 7hsoj7iGl8V5wzeL/wT3tqHTfrZTHkZwk5UBViKyHTywBmZFq0frm8mI3J2xlddZBmoE
 s8q8GSI2WepiZ10MAzwDGwDMtYCoPpkyTnDhEtIa1GyGDEw6k37Rs+HJ9yff6WL6sw1O
 4WqcJX+pPtmQilHkwSI8hffyk+1BcLWllcyd2nRmfoTOw/Abay7/0UE6y0hP+L+s4Qlb
 YxuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MAgKFkUbajfTwkiBbjHCwLbY8LqpQ8PBmh7VA/cwU0E=;
 b=J7t2EBvV2DZBcGF+rTYT8KKI6oxdh0s7mh5tMogm6Hnon3CZTfgeAekhpfd/KjScmL
 94BVEzeMCpqccgdFW435RchdQTAibW0vEGLipYc8+OVhwxtkdkjAKSiOrn9631LWEnya
 gtkmw+y9XaoMAd3gn2slCfdzyYvm0VCeK7IsOcT8puQ6ETt5rd671hC7Wckt7fBG6LUr
 4GZv3cieXCnKDgZ/V+3O5hFqfREl+NU1IgU8qLvmnC7g3NzYLj5J8w9WXyUdurgL67nB
 1982Nx9jUlLwR6QrkJtFpaaa1e8aGZCG1giYzzTkOZVU5ixTp0uTRnBThYHWLTLS5Lx4
 LTJQ==
X-Gm-Message-State: AOAM531sWPi1nOWF+33Lv9a08mZeS4jghHIwsFjZauWJZF3RIDNyHRG6
 c6oXF0Wva9ue8s4naGtuKMMm7rFTkMI=
X-Google-Smtp-Source: ABdhPJzQ2tCFOmAsi20Gal6ccZzgbiWTy3xs28H9Fe7zY+J/NCEjtr1WZzzVEoA6J7yNPFrn15rtkw==
X-Received: by 2002:a17:906:5618:: with SMTP id
 f24mr15226911ejq.414.1617952646960; 
 Fri, 09 Apr 2021 00:17:26 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:216f:9340:7a2b:4f98])
 by smtp.gmail.com with ESMTPSA id w1sm905369edt.89.2021.04.09.00.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 00:17:26 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Subject: [PATCH 1/2] mm/vmscan: add sync_shrinkers function
Date: Fri,  9 Apr 2021 09:17:24 +0200
Message-Id: <20210409071725.1532-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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
Cc: akpm@linux-foundation.org, ray.huang@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VG8gYmUgYWJsZSB0byBzd2l0Y2ggdG8gYSBzcGlubG9jayBhbmQgcmVkdWNlIGxvY2sgY29udGVu
dGlvbiBpbiB0aGUgVFRNCnNocmlua2VyIHdlIGRvbid0IHdhbnQgdG8gaG9sZCBhIG11dGV4IHdo
aWxlIHVubWFwcGluZyBhbmQgZnJlZWluZyBwYWdlcwpmcm9tIHRoZSBwb29sLgoKQnV0IHRoZW4g
d2Ugc29tZWhvdyBuZWVkIHRvIHByZXZlbnQgYSByYWNlIGJldHdlZW4gKGZvciBleGFtcGxlKSB0
aGUgc2hyaW5rZXIKdHJ5aW5nIHRvIGZyZWUgcGFnZXMgYW5kIGhvdHBsdWcgdHJ5aW5nIHRvIHJl
bW92ZSB0aGUgZGV2aWNlIHdoaWNoIHRob3NlIHBhZ2VzCmJlbG9uZyB0by4KClRha2luZyBhbmQg
cmVsZWFzaW5nIHRoZSBzaHJpbmtlciBzZW1hcGhvcmUgb24gdGhlIHdyaXRlIHNpZGUgYWZ0ZXIK
dW5tYXBwaW5nIGFuZCBmcmVlaW5nIGFsbCBwYWdlcyBzaG91bGQgbWFrZSBzdXJlIHRoYXQgbm8g
c2hyaW5rZXIgaXMgcnVubmluZyBpbgpwYXJhbGVsbCBhbnkgbW9yZS4KClNpZ25lZC1vZmYtYnk6
IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBpbmNsdWRl
L2xpbnV4L3Nocmlua2VyLmggfCAgMSArCiBtbS92bXNjYW4uYyAgICAgICAgICAgICAgfCAxMCAr
KysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9pbmNsdWRlL2xpbnV4L3Nocmlua2VyLmggYi9pbmNsdWRlL2xpbnV4L3Nocmlua2VyLmgKaW5k
ZXggMGY4MDEyMzY1MGUyLi42Yjc1ZGMzNzJmY2UgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgv
c2hyaW5rZXIuaAorKysgYi9pbmNsdWRlL2xpbnV4L3Nocmlua2VyLmgKQEAgLTkyLDQgKzkyLDUg
QEAgZXh0ZXJuIHZvaWQgcmVnaXN0ZXJfc2hyaW5rZXJfcHJlcGFyZWQoc3RydWN0IHNocmlua2Vy
ICpzaHJpbmtlcik7CiBleHRlcm4gaW50IHJlZ2lzdGVyX3Nocmlua2VyKHN0cnVjdCBzaHJpbmtl
ciAqc2hyaW5rZXIpOwogZXh0ZXJuIHZvaWQgdW5yZWdpc3Rlcl9zaHJpbmtlcihzdHJ1Y3Qgc2hy
aW5rZXIgKnNocmlua2VyKTsKIGV4dGVybiB2b2lkIGZyZWVfcHJlYWxsb2NlZF9zaHJpbmtlcihz
dHJ1Y3Qgc2hyaW5rZXIgKnNocmlua2VyKTsKK2V4dGVybiB2b2lkIHN5bmNfc2hyaW5rZXJzKHZv
aWQpOwogI2VuZGlmCmRpZmYgLS1naXQgYS9tbS92bXNjYW4uYyBiL21tL3Ztc2Nhbi5jCmluZGV4
IDU2MmU4N2NiZDdhMS4uNDZjZDljMjE1ZDczIDEwMDY0NAotLS0gYS9tbS92bXNjYW4uYworKysg
Yi9tbS92bXNjYW4uYwpAQCAtNDA4LDYgKzQwOCwxNiBAQCB2b2lkIHVucmVnaXN0ZXJfc2hyaW5r
ZXIoc3RydWN0IHNocmlua2VyICpzaHJpbmtlcikKIH0KIEVYUE9SVF9TWU1CT0wodW5yZWdpc3Rl
cl9zaHJpbmtlcik7CiAKKy8qKgorICogc3luY19zaHJpbmtlciAtIFdhaXQgZm9yIGFsbCBydW5u
aW5nIHNocmlua2VycyB0byBjb21wbGV0ZS4KKyAqLwordm9pZCBzeW5jX3Nocmlua2Vycyh2b2lk
KQoreworCWRvd25fd3JpdGUoJnNocmlua2VyX3J3c2VtKTsKKwl1cF93cml0ZSgmc2hyaW5rZXJf
cndzZW0pOworfQorRVhQT1JUX1NZTUJPTChzeW5jX3Nocmlua2Vycyk7CisKICNkZWZpbmUgU0hS
SU5LX0JBVENIIDEyOAogCiBzdGF0aWMgdW5zaWduZWQgbG9uZyBkb19zaHJpbmtfc2xhYihzdHJ1
Y3Qgc2hyaW5rX2NvbnRyb2wgKnNocmlua2N0bCwKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
