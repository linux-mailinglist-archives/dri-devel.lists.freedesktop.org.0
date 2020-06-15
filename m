Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B49401F9AFD
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 16:54:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB74E6E32F;
	Mon, 15 Jun 2020 14:54:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD9D89D5F;
 Mon, 15 Jun 2020 14:54:19 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id r9so14960184wmh.2;
 Mon, 15 Jun 2020 07:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=AI5FhLk9FP9TGZGo8fRTGDecjA5Rowrr5/b2Hx2l40Y=;
 b=AUYeuwlkzeTEMmKgkzuG7NQaiCFAqtRRURHNkXegKZ4aAEqchXQ2HtmG2tFMQoyVZp
 HJiOi/501eEEOMkupz/zBxekgirdUq9qCDFtGoaEqnoQzFZVvAGTurku1HQ1vj74UoOv
 s1Jorx7T+s/hi1ms4vfFK7qKvES1X0dn9tDPjhhAjL0NB1ztdkBvDJOOxBJQDjo3lrzi
 fJDRkXZkkr3xJiLbmv5Tj6wvqmSsGnZP+J30etVnaHawvtYIW2Ajo0VoQr/yRdASxyS7
 sUMtn2Dh96f0qp0lc/lsMzzOZkQFXTS5CvO3q7dCJfGFINiXdCdtOjcu8CQdzXm5O0z6
 7SLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AI5FhLk9FP9TGZGo8fRTGDecjA5Rowrr5/b2Hx2l40Y=;
 b=L/xn5k3SBqPgy4kFdIVGungduOpOpsVIOg+pOSEfbmNzKJeHByIL/lJTjRhqECpihd
 NkqLT7dxGt8Kk4fDbzlySKK/UOthAFHghXAXPkO5lox/S93PHkNRjTTYRTm4oBAPjwSm
 ww4MmwCEHyoxB8KBihWreVH2jJB39JRmUbfLX6mphsXCGEHfEWn7M+z5Sb8jqckAl+1b
 YazZ2v4l0Et5h45pyHQy1elzxn0wOYeEm1CnXIdBma/vOewRw6zWHDJZQX5HAp4W8+Zf
 V/KhDyw7cXi/SwWzSKu2sf+g5/7waITXlNVKHouv514vJO1iwamptMQZdRs6fIUtCbB2
 tLCA==
X-Gm-Message-State: AOAM530cSiXOkQy/kOB6aUoWZZxrm49JgxGPjpPpijBP9M5CUKRKPSeE
 9neyTQA1c1SumWFLMMxBVygg1rQr
X-Google-Smtp-Source: ABdhPJzs34cUZA9c8hhih4GsKBtPO5mVLb8jD3HNJbjUYETf2wBiCMUtuHDdJ5AJYFvtQcxQVLyq3Q==
X-Received: by 2002:a1c:9ec5:: with SMTP id h188mr13399954wme.9.1592232858550; 
 Mon, 15 Jun 2020 07:54:18 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:a5ab:7330:3773:519a])
 by smtp.gmail.com with ESMTPSA id j4sm24277442wma.7.2020.06.15.07.54.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2020 07:54:17 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: chris@chris-wilson.co.uk, intel-gfx@lists.freedesktop.org,
 nirmoy.das@amd.com, dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/mm: optimize find_hole() as well
Date: Mon, 15 Jun 2020 16:54:14 +0200
Message-Id: <20200615145415.1775-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200615145415.1775-1-christian.koenig@amd.com>
References: <20200615145415.1775-1-christian.koenig@amd.com>
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

QWJvcnQgZWFybHkgaWYgdGhlcmUgaXNuJ3QgZW5vdWdoIHNwYWNlIHRvIGFsbG9jYXRlIGZyb20g
YSBzdWJ0cmVlLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtv
ZW5pZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fbW0uYyAgICAgICAgICAgICAg
ICB8IDExICsrKysrKystLS0tCiBkcml2ZXJzL2dwdS9kcm0vc2VsZnRlc3RzL3Rlc3QtZHJtX21t
LmMgfCAxMSAtLS0tLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDE1
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW0uYyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fbW0uYwppbmRleCA0MjVmY2QzNTkwZTguLjE3N2E1ZGYwZmU5NSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9tbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fbW0uYwpAQCAtMzI1LDcgKzMyNSw3IEBAIHN0YXRpYyBzdHJ1Y3QgZHJtX21tX25vZGUg
KmJlc3RfaG9sZShzdHJ1Y3QgZHJtX21tICptbSwgdTY0IHNpemUpCiAJcmV0dXJuIGJlc3Q7CiB9
CiAKLXN0YXRpYyBzdHJ1Y3QgZHJtX21tX25vZGUgKmZpbmRfaG9sZShzdHJ1Y3QgZHJtX21tICpt
bSwgdTY0IGFkZHIpCitzdGF0aWMgc3RydWN0IGRybV9tbV9ub2RlICpmaW5kX2hvbGVfYWRkcihz
dHJ1Y3QgZHJtX21tICptbSwgdTY0IGFkZHIsIHU2NCBzaXplKQogewogCXN0cnVjdCByYl9ub2Rl
ICpyYiA9IG1tLT5ob2xlc19hZGRyLnJiX25vZGU7CiAJc3RydWN0IGRybV9tbV9ub2RlICpub2Rl
ID0gTlVMTDsKQEAgLTMzMyw2ICszMzMsOSBAQCBzdGF0aWMgc3RydWN0IGRybV9tbV9ub2RlICpm
aW5kX2hvbGUoc3RydWN0IGRybV9tbSAqbW0sIHU2NCBhZGRyKQogCXdoaWxlIChyYikgewogCQl1
NjQgaG9sZV9zdGFydDsKIAorCQlpZiAocmJfaG9sZV9hZGRyX3RvX25vZGUocmIpLT5zdWJ0cmVl
X21heF9ob2xlIDwgc2l6ZSkKKwkJCWJyZWFrOworCiAJCW5vZGUgPSByYl9ob2xlX2FkZHJfdG9f
bm9kZShyYik7CiAJCWhvbGVfc3RhcnQgPSBfX2RybV9tbV9ob2xlX25vZGVfc3RhcnQobm9kZSk7
CiAKQEAgLTM1OCwxMCArMzYxLDEwIEBAIGZpcnN0X2hvbGUoc3RydWN0IGRybV9tbSAqbW0sCiAJ
CXJldHVybiBiZXN0X2hvbGUobW0sIHNpemUpOwogCiAJY2FzZSBEUk1fTU1fSU5TRVJUX0xPVzoK
LQkJcmV0dXJuIGZpbmRfaG9sZShtbSwgc3RhcnQpOworCQlyZXR1cm4gZmluZF9ob2xlX2FkZHIo
bW0sIHN0YXJ0LCBzaXplKTsKIAogCWNhc2UgRFJNX01NX0lOU0VSVF9ISUdIOgotCQlyZXR1cm4g
ZmluZF9ob2xlKG1tLCBlbmQpOworCQlyZXR1cm4gZmluZF9ob2xlX2FkZHIobW0sIGVuZCwgc2l6
ZSk7CiAKIAljYXNlIERSTV9NTV9JTlNFUlRfRVZJQ1Q6CiAJCXJldHVybiBsaXN0X2ZpcnN0X2Vu
dHJ5X29yX251bGwoJm1tLT5ob2xlX3N0YWNrLApAQCAtNDk3LDcgKzUwMCw3IEBAIGludCBkcm1f
bW1fcmVzZXJ2ZV9ub2RlKHN0cnVjdCBkcm1fbW0gKm1tLCBzdHJ1Y3QgZHJtX21tX25vZGUgKm5v
ZGUpCiAJCXJldHVybiAtRU5PU1BDOwogCiAJLyogRmluZCB0aGUgcmVsZXZhbnQgaG9sZSB0byBh
ZGQgb3VyIG5vZGUgdG8gKi8KLQlob2xlID0gZmluZF9ob2xlKG1tLCBub2RlLT5zdGFydCk7CisJ
aG9sZSA9IGZpbmRfaG9sZV9hZGRyKG1tLCBub2RlLT5zdGFydCwgMCk7CiAJaWYgKCFob2xlKQog
CQlyZXR1cm4gLUVOT1NQQzsKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0
cy90ZXN0LWRybV9tbS5jIGIvZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9tbS5j
CmluZGV4IGNhNWYzNWRlZjkwNS4uYjg3OWFlZGZjMDBkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vc2VsZnRlc3RzL3Rlc3QtZHJtX21tLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3NlbGZ0
ZXN0cy90ZXN0LWRybV9tbS5jCkBAIC0xOTgxLDE2ICsxOTgxLDYgQEAgc3RhdGljIGludCBfX2ln
dF9vbmNlKHVuc2lnbmVkIGludCBtb2RlKQogCX0KIAogCW1lbXNldCgmbm9kZSwgMCwgc2l6ZW9m
KG5vZGUpKTsKLQllcnIgPSBkcm1fbW1faW5zZXJ0X25vZGVfZ2VuZXJpYygmbW0sICZub2RlLAot
CQkJCQkgMiwgMCwgMCwKLQkJCQkJIG1vZGUgfCBEUk1fTU1fSU5TRVJUX09OQ0UpOwotCWlmICgh
ZXJyKSB7Ci0JCXByX2VycigiVW5leHBlY3RlZGx5IGluc2VydGVkIHRoZSBub2RlIGludG8gdGhl
IHdyb25nIGhvbGU6IG5vZGUuc3RhcnQ9JWxseFxuIiwKLQkJICAgICAgIG5vZGUuc3RhcnQpOwot
CQllcnIgPSAtRUlOVkFMOwotCQlnb3RvIGVycl9ub2RlOwotCX0KLQogCWVyciA9IGRybV9tbV9p
bnNlcnRfbm9kZV9nZW5lcmljKCZtbSwgJm5vZGUsIDIsIDAsIDAsIG1vZGUpOwogCWlmIChlcnIp
IHsKIAkJcHJfZXJyKCJDb3VsZCBub3QgaW5zZXJ0IHRoZSBub2RlIGludG8gdGhlIGF2YWlsYWJs
ZSBob2xlIVxuIik7CkBAIC0xOTk4LDcgKzE5ODgsNiBAQCBzdGF0aWMgaW50IF9faWd0X29uY2Uo
dW5zaWduZWQgaW50IG1vZGUpCiAJCWdvdG8gZXJyX2hpOwogCX0KIAotZXJyX25vZGU6CiAJZHJt
X21tX3JlbW92ZV9ub2RlKCZub2RlKTsKIGVycl9oaToKIAlkcm1fbW1fcmVtb3ZlX25vZGUoJnJz
dmRfaGkpOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
