Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB71036B872
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 19:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19B5489E98;
	Mon, 26 Apr 2021 17:58:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A8289E98
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 17:58:27 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id u17so85842475ejk.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 10:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ywul3QoLQPIrhQlLZSU4d5QNhbrOkU7VHmvSXIsElvY=;
 b=UVw/TD/K9+dqww1ZGpuiFnw2PH6ALpi1u7UPh0amWt0RdAw7a/OVDK/ksYmd8haJDv
 pUeUHRAnnrFoaHJSFyZsavrEc4ITgC8YWv+4Feq4S2Y0ZOQ+qVi0pX3o6JUY4V7t6INJ
 I/vsyFC3ezVOiz2mHQHZIipUTYqjn5+nIxvwuFr9yiL+6SvpbaFKpL/e47F7RBpwW5/l
 ds4JBpH817VFkzAVPuz9OrgPrmEwg0EgYRNK12Fy1QomZJwMIrqJlwGfLpIpIVdZBPhW
 Ka5I/ooDYRuawXz6hXMH6sDSn4lLSRhAALPcYZrbTfXwvoALVrW//3Bk7mIfw0T/S9p2
 qOCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ywul3QoLQPIrhQlLZSU4d5QNhbrOkU7VHmvSXIsElvY=;
 b=T0nPT9TX3wTEFGCxEWK20GArIrZ8vITgF6cxs0WbOM/p8q2FdSUTgS4GrRdumM6969
 juNadRs+GuCw0zbsLAKZSy8Dpax1NKNtWfxUnk+/XpuYdMIsIWC9EgbsGi5MTZTmfylE
 KqmZ8xK2jBliz3K3yIpwEfY4gnoe4tWRaUNp9ZfCKTfksvgow/ZgFjPTm2R/97wbv+wG
 GrAlwwX2oz8LKWpEyOmba/ZRyIufPpdifaaucddqNgru4Ad7TX5XlO2tDyUzSMOi/zdW
 UWX/Bf5fAQEXJtHuXP6+XrktdvALbagP5j3VRgRZwrn2ptJYgXalBg5A6INuU9PkzfdI
 EgPA==
X-Gm-Message-State: AOAM531MA6x8Eg18WZZzwYqmHf4T6X00wQXAYLFglLn0RxzNP8BY2K9L
 LWDiCB4OPi1xsl1qRBJfne9IIvOqDyI=
X-Google-Smtp-Source: ABdhPJxOe4DelTFwUCwmcbSCZp8aFwgmXcRdzFSDRkelHm7RCN0Gzqfd0j+UWmJKa4y3rANGGa+Umw==
X-Received: by 2002:a17:907:7b9f:: with SMTP id
 ne31mr4292994ejc.139.1619459906035; 
 Mon, 26 Apr 2021 10:58:26 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:2d9a:6314:c432:32a0])
 by smtp.gmail.com with ESMTPSA id b8sm11841982ejc.29.2021.04.26.10.58.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 10:58:25 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: cleanup ttm_agp_backend
Date: Mon, 26 Apr 2021 19:58:24 +0200
Message-Id: <20210426175824.122557-1-christian.koenig@amd.com>
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
Cc: bskeggs@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXVkaXQgdGhlIGluY2x1ZGVzIGFuZCBzdG9wIGFjY2Vzc2luZyB0aGUgaW50ZXJuYWwgZHJtX21t
X25vZGUuCgpUaGUgdHRtX3Jlc291cmNlOjpzdGFydCBzaG91bGQgYmUgdGhlIHNhbWUgdmFsdWUg
YXMgdGhlCmRybV9tbV9ub2RlOjpzdGFydC4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7Zu
aWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0
bV9hZ3BfYmFja2VuZC5jIHwgOCArKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0
bV9hZ3BfYmFja2VuZC5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYWdwX2JhY2tlbmQuYwpp
bmRleCAwMjI2YWU2OWQzYWIuLjZkZGMxNmYwZmUyYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3R0bS90dG1fYWdwX2JhY2tlbmQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9h
Z3BfYmFja2VuZC5jCkBAIC0zMiw4ICszMiw5IEBACiAKICNkZWZpbmUgcHJfZm10KGZtdCkgIltU
VE1dICIgZm10CiAKLSNpbmNsdWRlIDxkcm0vdHRtL3R0bV9ib19kcml2ZXIuaD4KLSNpbmNsdWRl
IDxkcm0vdHRtL3R0bV9wbGFjZW1lbnQuaD4KKyNpbmNsdWRlIDxkcm0vdHRtL3R0bV9kZXZpY2Uu
aD4KKyNpbmNsdWRlIDxkcm0vdHRtL3R0bV90dC5oPgorI2luY2x1ZGUgPGRybS90dG0vdHRtX3Jl
c291cmNlLmg+CiAjaW5jbHVkZSA8bGludXgvYWdwX2JhY2tlbmQuaD4KICNpbmNsdWRlIDxsaW51
eC9tb2R1bGUuaD4KICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CkBAIC01MCw3ICs1MSw2IEBAIGlu
dCB0dG1fYWdwX2JpbmQoc3RydWN0IHR0bV90dCAqdHRtLCBzdHJ1Y3QgdHRtX3Jlc291cmNlICpi
b19tZW0pCiB7CiAJc3RydWN0IHR0bV9hZ3BfYmFja2VuZCAqYWdwX2JlID0gY29udGFpbmVyX29m
KHR0bSwgc3RydWN0IHR0bV9hZ3BfYmFja2VuZCwgdHRtKTsKIAlzdHJ1Y3QgcGFnZSAqZHVtbXlf
cmVhZF9wYWdlID0gdHRtX2dsb2IuZHVtbXlfcmVhZF9wYWdlOwotCXN0cnVjdCBkcm1fbW1fbm9k
ZSAqbm9kZSA9IGJvX21lbS0+bW1fbm9kZTsKIAlzdHJ1Y3QgYWdwX21lbW9yeSAqbWVtOwogCWlu
dCByZXQsIGNhY2hlZCA9IHR0bS0+Y2FjaGluZyA9PSB0dG1fY2FjaGVkOwogCXVuc2lnbmVkIGk7
CkBAIC03Niw3ICs3Niw3IEBAIGludCB0dG1fYWdwX2JpbmQoc3RydWN0IHR0bV90dCAqdHRtLCBz
dHJ1Y3QgdHRtX3Jlc291cmNlICpib19tZW0pCiAJbWVtLT5pc19mbHVzaGVkID0gMTsKIAltZW0t
PnR5cGUgPSAoY2FjaGVkKSA/IEFHUF9VU0VSX0NBQ0hFRF9NRU1PUlkgOiBBR1BfVVNFUl9NRU1P
Ulk7CiAKLQlyZXQgPSBhZ3BfYmluZF9tZW1vcnkobWVtLCBub2RlLT5zdGFydCk7CisJcmV0ID0g
YWdwX2JpbmRfbWVtb3J5KG1lbSwgYm9fbWVtLT5zdGFydCk7CiAJaWYgKHJldCkKIAkJcHJfZXJy
KCJBR1AgQmluZCBtZW1vcnkgZmFpbGVkXG4iKTsKIAotLSAKMi4yNS4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
