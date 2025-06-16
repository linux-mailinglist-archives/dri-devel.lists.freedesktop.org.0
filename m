Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F4EADB125
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 15:07:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1967B10E395;
	Mon, 16 Jun 2025 13:07:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BIIJZL09";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8326B10E392;
 Mon, 16 Jun 2025 13:07:33 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-adf34d5e698so540855266b.1; 
 Mon, 16 Jun 2025 06:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750079252; x=1750684052; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BhjJlPUAmPZfAEzNSgM6aJQtR1SzEIXN+iASDEWwa5I=;
 b=BIIJZL09kQ7O9YDgVT0uX8/4sikAVoocbMJj0B6ZC+MuzdZW9yVlLkZdU1yCWeVHKz
 FxQG17MvH8d87h2Iu1RQLGertM0QNMWHnNoF64xKh05MZlfqu0tXzsZ9vXhuFUtn6LvN
 eqkDL1kVSi7W1eA3yiGl1vJ73eQjEN0xKopXWHRXmos2P3DIzzcfh31OTaIRgEvCqQmq
 84QufBuwwXaRqc7sfmUUo7c/kqGOKDugrMht5TApXuSWhBEeZefYnJwAuJIKfUHI23uu
 iIV6rEsPUvFv8Nvi5QoxMNcXTHfGSuUBkXOlQGQLvfFaucahV5CWxM/Mfl82secFEyjj
 L9bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750079252; x=1750684052;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BhjJlPUAmPZfAEzNSgM6aJQtR1SzEIXN+iASDEWwa5I=;
 b=xHXZD4fFYD01B0lajzNyRBl6JOLtJwIvWhuwZOgPR3E4IJe3j1R5ShANSPp8l5SUKg
 tXrDkcg209bhzDJIbiysZBO+WI6xZQlPCoxNYN4Q1fmZKjwev9Telbjr8wrfWgoW2awU
 JgjBtPVMQwPAma9sxdE596dqLQaV7lzLV3noRVoh57VrDoF5q29vHfKmHT5fUyL+9rXZ
 wiKjUDuBSaq0Z7dFZ76ekY5mZB45NOxFvIR1YsG2OmXkwgv6dkePSy95lvN4tX1of2E6
 DZHz1F/N/xKmg6iHOX8d63gD7/YU/S6Wo1axxEsxVr4chvxplctCwly3ICvEjfo78GUP
 saJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+cZQPtK1GaFlqYu/9I9Yhg+W5K8UpD5DTpWwcVtX0xUQcf4u0eZC7JAeNBhNABQ2sXoKZAZcohcc=@lists.freedesktop.org,
 AJvYcCWPhE1Epixzt5SJfflHzJ9M11ip7rF3i/VHKQG9pgjiy6n0ApBi7yT6Gxwte14gmqAii29AfB3N/Zg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZ/0sjY/JUnyC0y2x1+QXPP+r6swu8gDKvZBr3koZGGdmP/3CQ
 Wv/aPOKgYdbwVlX+haZf8OPswyzhhLPXzNIrgiD8+adrGK5vV5ST/qk6Oaav4g==
X-Gm-Gg: ASbGnctKX0mcCK51v2AQYCyxk3+6YT6yvPHSuXkPSHOEsP4EByatx+F8dpU3IdpurHo
 5Paony8tZU7QzHf2cKK2k7ESmE27cJY47prjDsFJqBjdoB84krWD9S7NcA/qJTrVLPR1Wy+X6Ys
 PXukxYtsjBa2FUsRfj/QUgqEpwqVyn5D7a8qJ5Q2OuFwV6ciI3uhI+mb+yd4EezIl96WoEel/Tn
 F/4Bo9FB3yGQUg02ukD/QahBj1fh7l3TSd0SwgsiVLxQTv8jufNtUhy5ommaAm6sC+tEOYxhDCn
 iGcCyuVPvDH3NOK1jZRPIAmLqbFO0UT+se70bf+RVRIaqaekczBLHV8eEX57tnysLvXxfDlzF8L
 y
X-Google-Smtp-Source: AGHT+IF9LgzHmVsUplnpLj70wyHTT1D2I4iKS3sLFsquKcG/QFnxGwLN6Dg//j1VGYbR2aDxzw/Ddg==
X-Received: by 2002:a17:907:2d87:b0:ade:4121:8d2d with SMTP id
 a640c23a62f3a-adf9eab31c0mr900176066b.20.1750079251812; 
 Mon, 16 Jun 2025 06:07:31 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1535:2600:63e1:a803:ebae:a9dd])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adf93630a33sm520717766b.29.2025.06.16.06.07.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jun 2025 06:07:31 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, matthew.brost@intel.com,
 matthew.auld@intel.com
Subject: [PATCH 5/6] drm/ttm: disable ttm_bo_validate_deleted_evict for now
Date: Mon, 16 Jun 2025 15:07:25 +0200
Message-Id: <20250616130726.22863-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250616130726.22863-1-christian.koenig@amd.com>
References: <20250616130726.22863-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

That test case uses internal TTM behavior which is about to change. We
need a mock fence or similar to get it working instead.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
index 4553c4e0e0f1..6766e1753343 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
@@ -977,6 +977,7 @@ static void ttm_bo_validate_allowed_only_evict(struct kunit *test)
 	ttm_mock_manager_fini(priv->ttm_dev, mem_multihop);
 }
 
+#if 0
 static void ttm_bo_validate_deleted_evict(struct kunit *test)
 {
 	struct ttm_operation_ctx ctx_init = { }, ctx_val  = { };
@@ -1026,6 +1027,7 @@ static void ttm_bo_validate_deleted_evict(struct kunit *test)
 	ttm_bo_fini(bo_big);
 	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
 }
+#endif
 
 static void ttm_bo_validate_busy_domain_evict(struct kunit *test)
 {
@@ -1205,7 +1207,7 @@ static struct kunit_case ttm_bo_validate_test_cases[] = {
 	KUNIT_CASE(ttm_bo_validate_happy_evict),
 	KUNIT_CASE(ttm_bo_validate_all_pinned_evict),
 	KUNIT_CASE(ttm_bo_validate_allowed_only_evict),
-	KUNIT_CASE(ttm_bo_validate_deleted_evict),
+	/*KUNIT_CASE(ttm_bo_validate_deleted_evict),*/
 	KUNIT_CASE(ttm_bo_validate_busy_domain_evict),
 	KUNIT_CASE(ttm_bo_validate_evict_gutting),
 	KUNIT_CASE(ttm_bo_validate_recrusive_evict),
-- 
2.34.1

