Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 533D936F7D5
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 11:25:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 084086F510;
	Fri, 30 Apr 2021 09:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2AF66F504
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 09:25:12 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id q6so22552759edr.3
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 02:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Epa6EPUKIq0AtRc9qpb2KEw9vCfYgfZ//7VzPzMIqhI=;
 b=p+YDyeitUjwdU3+NXp78iH9pTMURWKcvTxbcjV0uiCRB40QtCrmRk6wvuaPIWQXy2m
 7xgkZs65vk1A5bTyRpYeispB/JZdDe0kuhcZx4MvKidlKlFYFHLFWX51LPmahnSgw/BE
 CpH/VYQA38OtGkgkBlqUAeZhfmDH9gxUqRhFUmQYfhwQnUbW2Ws98tao1i+490iDUWi/
 RqkWwI4ZExEgs8N1vWkbLFtw9P58/58dD4nYkasBc3+e4W/RaB2+e1DOS7IPSOU79M7j
 +cZ8g/7ZwUa/H+tHxozSDbqW8el9mXRYXHQ7ppXg1fAGRNCxDsIpmpaCSlWrWsiYj/by
 A02g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Epa6EPUKIq0AtRc9qpb2KEw9vCfYgfZ//7VzPzMIqhI=;
 b=EfvRFg1DUfaB1n6JRUgw8hBEK5wx4PDZpZGGieLzvA2C1bVapMEHNX/SR8gY1lZNXy
 savCT9jZF6vWvfh3Htd5NpLVLtjnEcZG3EYHriSLPzIsxD428f5NrNxl4ONjy7eNcUDs
 SMAvLKk5HJtvIZ1IsM5KT5KFhRd2U9TAaAAYrCQbRWuD4p8Ss4jm8/r5V6XZ8TeSjlkp
 MVKznstvt1uzHRxUwjH3ljsv+ycX/0rZOmqaFetW8xhWzU63kgeClBDmZf4fFcvjLU+d
 D4Bd3H7NeEuyQKlogb0y0cxVaft9VE4s8dkwPevTJgAY9WQszTrpSFnN66165GpzgwWy
 hI/Q==
X-Gm-Message-State: AOAM532PNlVY4VZLbvdLPlrKnvBecCVwS0p5CX03z5i35Io2NMfEAiYU
 avQn0Oa5aj0pP0jQAXayjtptJysci1U=
X-Google-Smtp-Source: ABdhPJxNTCJcjsBKOb8T1GGb8vM5joAbqjfUQPGP8yWcQDS0h/lzAm9+XP4U+oIREuWA1KHO2Xo4WQ==
X-Received: by 2002:aa7:ce8f:: with SMTP id y15mr4669922edv.148.1619774711525; 
 Fri, 30 Apr 2021 02:25:11 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:d08c:9633:b7a2:37e2])
 by smtp.gmail.com with ESMTPSA id h23sm1550959ejx.90.2021.04.30.02.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 02:25:11 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 03/13] drm/ttm: properly allocate sys resource during swapout
Date: Fri, 30 Apr 2021 11:24:58 +0200
Message-Id: <20210430092508.60710-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430092508.60710-1-christian.koenig@amd.com>
References: <20210430092508.60710-1-christian.koenig@amd.com>
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
Cc: daniel.vetter@ffwll.ch, matthew.william.auld@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RHJvcCB0aGUgc3BlY2lhbCBoYW5kbGluZyBoZXJlLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFu
IEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS90
dG0vdHRtX2JvLmMgfCAxMiArKysrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlv
bnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90
dG1fYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKaW5kZXggNTVmMWRkY2YyMmI2
Li5jYTFiMDk4YjZhNTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwpAQCAtMTE2NiwxNCArMTE2NiwxNiBA
QCBpbnQgdHRtX2JvX3N3YXBvdXQoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywgc3RydWN0
IHR0bV9vcGVyYXRpb25fY3R4ICpjdHgsCiAJaWYgKGJvLT5tZW0ubWVtX3R5cGUgIT0gVFRNX1BM
X1NZU1RFTSkgewogCQlzdHJ1Y3QgdHRtX29wZXJhdGlvbl9jdHggY3R4ID0geyBmYWxzZSwgZmFs
c2UgfTsKIAkJc3RydWN0IHR0bV9yZXNvdXJjZSBldmljdF9tZW07Ci0JCXN0cnVjdCB0dG1fcGxh
Y2UgaG9wOworCQlzdHJ1Y3QgdHRtX3BsYWNlIHBsYWNlLCBob3A7CiAKKwkJbWVtc2V0KCZwbGFj
ZSwgMCwgc2l6ZW9mKHBsYWNlKSk7CiAJCW1lbXNldCgmaG9wLCAwLCBzaXplb2YoaG9wKSk7CiAK
LQkJZXZpY3RfbWVtID0gYm8tPm1lbTsKLQkJZXZpY3RfbWVtLm1tX25vZGUgPSBOVUxMOwotCQll
dmljdF9tZW0ucGxhY2VtZW50ID0gMDsKLQkJZXZpY3RfbWVtLm1lbV90eXBlID0gVFRNX1BMX1NZ
U1RFTTsKKwkJcGxhY2UubWVtX3R5cGUgPSBUVE1fUExfU1lTVEVNOworCisJCXJldCA9IHR0bV9y
ZXNvdXJjZV9hbGxvYyhibywgJnBsYWNlLCAmZXZpY3RfbWVtKTsKKwkJaWYgKHVubGlrZWx5KHJl
dCkpCisJCQlnb3RvIG91dDsKIAogCQlyZXQgPSB0dG1fYm9faGFuZGxlX21vdmVfbWVtKGJvLCAm
ZXZpY3RfbWVtLCB0cnVlLCAmY3R4LCAmaG9wKTsKIAkJaWYgKHVubGlrZWx5KHJldCAhPSAwKSkg
ewotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
