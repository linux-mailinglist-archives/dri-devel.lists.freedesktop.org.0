Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED61A3262
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 10:29:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA186E2A2;
	Fri, 30 Aug 2019 08:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 318A26E134
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 16:51:02 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id g7so4180821wrx.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 09:51:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=00lufN6/yFhKzY8yCZ1Zaqb6ynWRRTw3i9KZWm+zVP8=;
 b=ENPlRa4ZHl1O28q66HqvJFxaTqG7+lieCMl+WCvtpGuCz886DCOuSI5qiCnESI1gmC
 FK5WJnb/dw+lVcNuuk5XhvzTl8R/1GGG+3YfOzD894oSdU0LDCtyKm5exY5ZKeWlJd8S
 RSfzEsEelbgSDg8n9ooAOhGq4euyy3KtGd9/TA6rI1FE62ir9GHfVvbimihROnGVUDF8
 B9ErZcVqASHIIXqRPSTDiSL5B+V4r5+WisoOSQkF22Xrk6ZEqTrMYDSQtMQybU2I/oSD
 NTxdVLyVb1EFtvZ5ZOoZZ6Z/FxG2XeAeqgb5reJtgQ8J3OxOVFvSCRowWG6HMj1J8zJG
 UBlw==
X-Gm-Message-State: APjAAAWDJFU1sUuZEes5ayLrNXbp0TgjKnuUq5Leg/kSvky/H8PMpnVX
 D88XEUjOTxPtSMuNV6kA2tY=
X-Google-Smtp-Source: APXvYqyPKtvs3/y+/g1peheuDwssaBYOP5BrKJo6vn3H4ALHasc8rVAIQIAnrElN3DD1/7ZpOTFEnQ==
X-Received: by 2002:a5d:6a45:: with SMTP id t5mr10701889wrw.228.1567097460777; 
 Thu, 29 Aug 2019 09:51:00 -0700 (PDT)
Received: from green.intra.ispras.ru (bran.ispras.ru. [83.149.199.196])
 by smtp.googlemail.com with ESMTPSA id o14sm8340770wrg.64.2019.08.29.09.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 09:51:00 -0700 (PDT)
From: Denis Efremov <efremov@linux.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 02/11] drm/msm: remove unlikely() from WARN_ON() conditions
Date: Thu, 29 Aug 2019 19:50:16 +0300
Message-Id: <20190829165025.15750-2-efremov@linux.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829165025.15750-1-efremov@linux.com>
References: <20190829165025.15750-1-efremov@linux.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 30 Aug 2019 08:29:17 +0000
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
Cc: linux-arm-msm@vger.kernel.org, Denis Efremov <efremov@linux.com>,
 dri-devel@lists.freedesktop.org, Joe Perches <joe@perches.com>,
 Andrew Morton <akpm@linux-foundation.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

InVubGlrZWx5KFdBUk5fT04oeCkpIiBpcyBleGNlc3NpdmUuIFdBUk5fT04oKSBhbHJlYWR5IHVz
ZXMgdW5saWtlbHkoKQppbnRlcm5hbGx5LgoKU2lnbmVkLW9mZi1ieTogRGVuaXMgRWZyZW1vdiA8
ZWZyZW1vdkBsaW51eC5jb20+CkNjOiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFpbC5jb20+CkNj
OiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KQ2M6IEpvZSBQZXJjaGVzIDxqb2VAcGVyY2hl
cy5jb20+CkNjOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPgpDYzog
bGludXgtYXJtLW1zbUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2N0bC5jIHwg
NCArKy0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwX2Zvcm1hdC5jICAgIHwgMiArLQog
MiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9jdGwuYyBiL2RyaXZlcnMv
Z3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVfY3RsLmMKaW5kZXggNDgwNGNmNDBkZTE0Li4wMzAy
NzlkN2I2NGIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVf
Y3RsLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9jdGwuYwpAQCAt
MjUzLDcgKzI1Myw3IEBAIGludCBtZHA1X2N0bF9zZXRfY3Vyc29yKHN0cnVjdCBtZHA1X2N0bCAq
Y3RsLCBzdHJ1Y3QgbWRwNV9waXBlbGluZSAqcGlwZWxpbmUsCiAJdTMyIGJsZW5kX2NmZzsKIAlz
dHJ1Y3QgbWRwNV9od19taXhlciAqbWl4ZXIgPSBwaXBlbGluZS0+bWl4ZXI7CiAKLQlpZiAodW5s
aWtlbHkoV0FSTl9PTighbWl4ZXIpKSkgeworCWlmIChXQVJOX09OKCFtaXhlcikpIHsKIAkJRFJN
X0RFVl9FUlJPUihjdGxfbWdyLT5kZXYtPmRldiwgIkNUTCAlZCBjYW5ub3QgZmluZCBMTSIsCiAJ
CQljdGwtPmlkKTsKIAkJcmV0dXJuIC1FSU5WQUw7CkBAIC02OTUsNyArNjk1LDcgQEAgc3RydWN0
IG1kcDVfY3RsX21hbmFnZXIgKm1kcDVfY3RsbV9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYs
CiAJCWdvdG8gZmFpbDsKIAl9CiAKLQlpZiAodW5saWtlbHkoV0FSTl9PTihjdGxfY2ZnLT5jb3Vu
dCA+IE1BWF9DVEwpKSkgeworCWlmIChXQVJOX09OKGN0bF9jZmctPmNvdW50ID4gTUFYX0NUTCkp
IHsKIAkJRFJNX0RFVl9FUlJPUihkZXYtPmRldiwgIkluY3JlYXNlIHN0YXRpYyBwb29sIHNpemUg
dG8gYXQgbGVhc3QgJWRcbiIsCiAJCQkJY3RsX2NmZy0+Y291bnQpOwogCQlyZXQgPSAtRU5PU1BD
OwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcF9mb3JtYXQuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHBfZm9ybWF0LmMKaW5kZXggOGFmYjBmOWMwNGJiLi41
NDk1ZDhiM2Y1YjkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHBfZm9y
bWF0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcF9mb3JtYXQuYwpAQCAtMTc0
LDcgKzE3NCw3IEBAIGNvbnN0IHN0cnVjdCBtc21fZm9ybWF0ICptZHBfZ2V0X2Zvcm1hdChzdHJ1
Y3QgbXNtX2ttcyAqa21zLCB1aW50MzJfdCBmb3JtYXQsCiAKIHN0cnVjdCBjc2NfY2ZnICptZHBf
Z2V0X2RlZmF1bHRfY3NjX2NmZyhlbnVtIGNzY190eXBlIHR5cGUpCiB7Ci0JaWYgKHVubGlrZWx5
KFdBUk5fT04odHlwZSA+PSBDU0NfTUFYKSkpCisJaWYgKFdBUk5fT04odHlwZSA+PSBDU0NfTUFY
KSkKIAkJcmV0dXJuIE5VTEw7CiAKIAlyZXR1cm4gJmNzY19jb252ZXJ0W3R5cGVdOwotLSAKMi4y
MS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
