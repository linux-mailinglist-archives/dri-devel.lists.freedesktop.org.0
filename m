Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 668F33669FC
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 13:37:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9F1F6E98E;
	Wed, 21 Apr 2021 11:37:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8321D6E98F
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 11:37:41 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id l4so62977411ejc.10
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 04:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5XOmtO3aKusCf5Lce/csfkJaMwNoZRDDAdYgLWPv+zg=;
 b=eWSGEpvKLBek7/lVsE9LjYvp7By04Sr4KhlTSie0P7xukx+mwKDhI0v8poXW2RDY2m
 +BvrL5WD781MJQnlHczy/gLqAQELgitzF7hGxS4jSbAr1Ab9Ra2tFq76qxeCMcjV+CXt
 ONND88WYtVk/N63mIqq/4hU7mObQrq1czFA4Bjm8ZdeY2fURcDQoKKzqAvlXag4WPRc+
 qV4Cr6QR/uuaqn4Ge8aq0nDtHftrIByMex9pznuABAzeZgX/9YZE9XKIKwKNv5Kym70D
 XG78BVjq6gi14vAPzZs+gQKd1f0s1XInNfCUMo7ep7D69GAHBR/G1GJtfkAUgD+WfP28
 EMXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5XOmtO3aKusCf5Lce/csfkJaMwNoZRDDAdYgLWPv+zg=;
 b=nxa0/khI9AOFxmxmc4pOfjTk61kfnehQP6TxHaYNvtTh1mWKXBa03FiCyQjZs6hM1V
 iUv9qXwZsWBYpCuTlp7mO9hdIGuOeQskcfAM10Rs9eqwpZqEMlBL6tADfs3IRmMcPrZg
 ggjnCBEMkDmt9DZ4CP+1W1SSSmRuVcldPfIafyXDKz9GXOHlvjmKyw2RQBWb9+73z5XC
 G7ltcbI9cTwt9NKO1EpXkhwPdXSCGAVkjtSjSAWbNqhFShcmiqJdjVhYak08tFMcEkWZ
 krT7neFw+SM98LNiqS2NV/r69C98C/Gp62zjRt/71cpn5QCq9xt+WLJywzyrm9FLRspr
 KsRg==
X-Gm-Message-State: AOAM533bxm/WlhpN4TeAOFdqxPx90Q2dKIsgFs8Pl+BxKRZvjgBI19OP
 ciIXGzAyrVBDZtlHy6SkmCA=
X-Google-Smtp-Source: ABdhPJyDDzMyJn3PmYXNait8RDnxZIYt5QFp1Z3M7saMjXb5QYIGEp5tD0hRSpI5WxIWERbjAIQpmg==
X-Received: by 2002:a17:906:2b03:: with SMTP id
 a3mr33358442ejg.481.1619005060187; 
 Wed, 21 Apr 2021 04:37:40 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it.
 [79.52.107.152])
 by smtp.gmail.com with ESMTPSA id i1sm2735928edt.33.2021.04.21.04.37.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 04:37:39 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: outreachy-kernel@googlegroups.com, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>
Subject: [PATCH v3 1/2] drm/amd/amdgpu/amdgpu_drv.c: Replace
 drm_modeset_lock_all() with drm_modeset_lock_all_ctx()
Date: Wed, 21 Apr 2021 13:37:15 +0200
Message-Id: <20210421113716.15472-2-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210421113716.15472-1-fmdefrancesco@gmail.com>
References: <20210421113716.15472-1-fmdefrancesco@gmail.com>
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
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVwbGFjZSB0aGUgZGVwcmVjYXRlZCBBUEkgd2l0aCBuZXcgaGVscGVycywgYWNjb3JkaW5nIHRv
IHRoZQpUT0RPIGxpc3Qgb2YgdGhlIERSTSBzdWJzeXN0ZW0uCgpJbiB0aGlzIGZpcnN0IHBhdGNo
IGRybV9tb2Rlc2V0X2xvY2tfYWxsKCkgaXMgcmVwbGFjZWQgd2l0aApkcm1fbW9kZXNldF9sb2Nr
X2FsbF9jdHgoKS4gVW5saWtlIGRybV9tb2Rlc2V0X2xvY2tfYWxsKCksCnRoZSBsYXR0ZXIgZG9l
c27igJl0IHRha2UgdGhlIGdsb2JhbCBkcm1fbW9kZV9jb25maWcubXV0ZXgKc2luY2UgdGhhdCBs
b2NrIGlzbuKAmXQgcmVxdWlyZWQgZm9yIG1vZGVzZXQgc3RhdGUgY2hhbmdlcy4KClNpZ25lZC1v
ZmYtYnk6IEZhYmlvIE0uIERlIEZyYW5jZXNjbyA8Zm1kZWZyYW5jZXNjb0BnbWFpbC5jb20+Ci0t
LQoKQ2hhbmdlcyBmcm9tIHYyOiBUaGUgd29yayBpcyBzcGxpdCBpbiB0d28gY29uc2VjdXRpdmUg
bG9naWNhbCBzdGVwcy4KQ2hhbmdlcyBmcm9tIHYxOiBBZGRlZCBmdXJ0aGVyIGluZm9ybWF0aW9u
IHRvIHRoZSBjb21taXQgbWVzc2FnZS4KCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZHJ2LmMgfCAxMyArKysrKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2
LmMKaW5kZXggNjcxZWMxMDAyMjMwLi44NTY5MDNkYjM0YzUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZHJ2LmMKQEAgLTE0MzgsOCArMTQzOCwxNSBAQCBzdGF0aWMgaW50IGFt
ZGdwdV9wbW9wc19ydW50aW1lX2lkbGUoc3RydWN0IGRldmljZSAqZGV2KQogCiAJaWYgKGFtZGdw
dV9kZXZpY2VfaGFzX2RjX3N1cHBvcnQoYWRldikpIHsKIAkJc3RydWN0IGRybV9jcnRjICpjcnRj
OwotCi0JCWRybV9tb2Rlc2V0X2xvY2tfYWxsKGRybV9kZXYpOworCQlzdHJ1Y3QgZHJtX21vZGVz
ZXRfYWNxdWlyZV9jdHggY3R4OworCQlpbnQgcmV0X2xvY2sgPSAwOworCityZXRyeToKKwkJZHJt
X21vZGVzZXRfbG9ja19hbGxfY3R4KGRybV9kZXYsICZjdHgpOworCQlpZihyZXRfbG9jayA9PSAt
RURFQURMSykgeworCQkJZHJtX21vZGVzZXRfYmFja29mZigmY3R4KTsKKwkJCWdvdG8gcmV0cnk7
CisJCX0KIAogCQlkcm1fZm9yX2VhY2hfY3J0YyhjcnRjLCBkcm1fZGV2KSB7CiAJCQlpZiAoY3J0
Yy0+c3RhdGUtPmFjdGl2ZSkgewpAQCAtMTQ0OCw3ICsxNDU1LDcgQEAgc3RhdGljIGludCBhbWRn
cHVfcG1vcHNfcnVudGltZV9pZGxlKHN0cnVjdCBkZXZpY2UgKmRldikKIAkJCX0KIAkJfQogCi0J
CWRybV9tb2Rlc2V0X3VubG9ja19hbGwoZHJtX2Rldik7CisJCWRybV9tb2Rlc2V0X2Ryb3BfbG9j
a3MoJmN0eCk7CiAKIAl9IGVsc2UgewogCQlzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqbGlzdF9jb25u
ZWN0b3I7Ci0tIAoyLjMxLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
