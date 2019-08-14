Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 224E58DFEA
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 23:31:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AE426E85A;
	Wed, 14 Aug 2019 21:31:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E976E856
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 21:31:42 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id z23so523870wmf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 14:31:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JS9FDqsk2E6RQCD4HkMjbuys2g4pNRCG7WFODU185bI=;
 b=N2YrEp3nKZTIiLhVbuHe4Q+ctfV7Un8rVAeSESR2W9QPaCDtBBpVqZtSYnERal0Svl
 +DG176DVEQcCDGE0z7sWT8gECr5SO5oKToNoIU8jbDuvOfMNVdHlPvqv/xGac4sjA6ZS
 sIjQ8dfcIK4ybeiEH5+j4B2h/Fc0V5zl6IUyRk6Fmz+Hpiilg8+Jgmkcxacnv/Dej34w
 s+j5fCdr3aBv4GQdW6I5BBaw6YG3d+dWulh/Nvm97K4Hu91nriox5sqiDiOKu6mFZ6mO
 Sx5+UUl4fvzs5XG8hq2qgaRr4Ma0nf2udJPdEc0FCAVvkozUxjvVbxS5+Ba8cNCLMAzo
 Si3Q==
X-Gm-Message-State: APjAAAViLa8acjnlrPvtwclCF4gWctTn2Aebj/2JT7jw/HQ5+9Gu9zkJ
 OVa2w+ZZ/sLM5otjsxTtfNXCLQ==
X-Google-Smtp-Source: APXvYqzHDWQhfPJ6We27I1c01VEHmcH6AedqLJLeDfuYhTAnIpxtfMqyBLvyHd9LxsMu3eLuFy5VVA==
X-Received: by 2002:a7b:cf21:: with SMTP id m1mr949715wmg.150.1565818300170;
 Wed, 14 Aug 2019 14:31:40 -0700 (PDT)
Received: from kherbst.pingu.com ([2a02:8108:453f:d1a0:28d1:9d88:57f6:f95b])
 by smtp.gmail.com with ESMTPSA id r17sm2095134wrg.93.2019.08.14.14.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 14:31:39 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: [PATCH 7/7] drm/nouveau: abort runtime suspend if we hit an error
Date: Wed, 14 Aug 2019 23:31:18 +0200
Message-Id: <20190814213118.28473-8-kherbst@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190814213118.28473-1-kherbst@redhat.com>
References: <20190814213118.28473-1-kherbst@redhat.com>
MIME-Version: 1.0
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
Cc: Karol Herbst <kherbst@redhat.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Alex Hung <alex.hung@canonical.com>, Ben Skeggs <bskeggs@redhat.com>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogS2Fyb2wgSGVyYnN0IDxraGVyYnN0QHJlZGhhdC5jb20+CkNDOiBBbGV4
IEh1bmcgPGFsZXguaHVuZ0BjYW5vbmljYWwuY29tPgpDQzogUmFmYWVsIEouIFd5c29ja2kgPHJh
ZmFlbC5qLnd5c29ja2lAaW50ZWwuY29tPgpDQzogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0
LmNvbT4KQ0M6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CkNDOiBCZW4gU2tlZ2dzIDxi
c2tlZ2dzQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9k
cm0uYyB8IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RybS5jIGIvZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvbm91dmVhdV9kcm0uYwppbmRleCAxNjQ0MWM1YmYyOWMuLmIxNjE1N2E5Yzcz
NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcm0uYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RybS5jCkBAIC05MTAsNiArOTEwLDcg
QEAgbm91dmVhdV9wbW9wc19ydW50aW1lX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQogewog
CXN0cnVjdCBwY2lfZGV2ICpwZGV2ID0gdG9fcGNpX2RldihkZXYpOwogCXN0cnVjdCBkcm1fZGV2
aWNlICpkcm1fZGV2ID0gcGNpX2dldF9kcnZkYXRhKHBkZXYpOworCXN0cnVjdCBub3V2ZWF1X2Ry
bSAqZHJtID0gbm91dmVhdV9kcm0oZHJtX2Rldik7CiAJaW50IHJldDsKIAogCWlmICghbm91dmVh
dV9wbW9wc19ydW50aW1lKCkpIHsKQEAgLTkxOSw2ICs5MjAsMTAgQEAgbm91dmVhdV9wbW9wc19y
dW50aW1lX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQogCiAJbm91dmVhdV9zd2l0Y2hlcm9v
X29wdGltdXNfZHNtKCk7CiAJcmV0ID0gbm91dmVhdV9kb19zdXNwZW5kKGRybV9kZXYsIHRydWUp
OworCWlmIChyZXQpIHsKKwkJTlZfRVJST1IoZHJtLCAic3VzcGVuZCBmYWlsZWQgd2l0aDogJWRc
biIsIHJldCk7CisJCXJldHVybiByZXQ7CisJfQogCXBjaV9zYXZlX3N0YXRlKHBkZXYpOwogCXBj
aV9kaXNhYmxlX2RldmljZShwZGV2KTsKIAlwY2lfaWdub3JlX2hvdHBsdWcocGRldik7Ci0tIAoy
LjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
