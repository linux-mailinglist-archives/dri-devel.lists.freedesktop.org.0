Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60375B00576
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 16:41:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB77C10E8E9;
	Thu, 10 Jul 2025 14:41:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Vy6BQXVE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C2AE10E8E8;
 Thu, 10 Jul 2025 14:41:32 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-450cf0120cdso9290425e9.2; 
 Thu, 10 Jul 2025 07:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752158491; x=1752763291; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=fBtKYanBgJ6oZ8A8D30KEy1xLb3oCs8TKAlWQ5CfxoA=;
 b=Vy6BQXVEtkV1nsCMoUItMQgNjjCId8fk+fAi/wr5y/Ug/yGqxV589FXzK/m8sXcn2U
 RibWIL889gm9+qvf9/iAgA9r2GU7BdNt7e5RPSwpwA3OOiiU1cYmIrWC+8fDwjgEmKxG
 4ByE7pLPVI9v6k2qzjtgzeeb0DLEGEOncUHgzd34ciFMzHRYjxssCjS8kqOlPLE+mfm4
 YNkvX8Isei1btxd7ygxnURI+yTI93ysPQWlyA9DogdTI5+muEA3hTT0nbwLGRoaI3erN
 0XmTt2N/8Tf9iZOJNp5wmTJ5SLgwub/g+/1l1EJN7DJ+l4LtiuS12NXEIZ4gkZPdKIpY
 EcJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752158491; x=1752763291;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fBtKYanBgJ6oZ8A8D30KEy1xLb3oCs8TKAlWQ5CfxoA=;
 b=O0wW3ifxacXmYn+jOAdlqJx4rQhnm3qHvByinT+5aAZdnrEZW4/CACx8jEPoPrs4L0
 42mI05ldoM/lQ+k0kmfVGNl6/97hqLgzVBV6FLsmflR3QX1xiHL/9plJoc2rj107dwbH
 J7/al2lFnB2v4I+l1g7S+5pVb/baJ3m7yQEl2aRImcZnmRAaV0p/THvvGfwNyXjQFKHH
 qySsCA0928G4+wuUw9NHAxM86E7mdadrPk65M4W3TgbMbbj6CgotTQXpF6dP/8sYp9dG
 bBtKzE3G4boeCBiDlqga3XqU7x/5m/W1crsqoRRBPPh5L9j74mb4Hv5lgGEB9I7NBz1E
 fB0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAHZqpOcTSLltHIXFsKW1zCdseeX9orWSow/0GITlyXOd4Rp+Tcax60JR3JDWPidqn+8tiOtk0mi0=@lists.freedesktop.org,
 AJvYcCXv106+DBv20kvDMqdej0eGhYpAEto0ltoE54+HqTgUbZRxCCVSP3rn4nqdKnxw5h+trTawPUBX1LQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKIPTc45I1Wx6mwlHz7xOL1SxcfHHCPItBPInfltEhNzGJIv/l
 Jn4W44Zi+gbsApSmDMrGDrZiE6f0wbgINoImt9GzdkyvDJI5F6jGkeub
X-Gm-Gg: ASbGncvoWUl1DrM7osAJLiYFuxcxyD4yBecBTFBGPZP7voSy1f6ByjitH2OIV+xOwbP
 k1bb0bdaVHhU3GLohJX/T8pgM2KbhEL9o64VhOwZMi9EQbBrid9JwZgvsliDGzBGaeCa1jQdfpm
 dwQO72xyrUeZIU2hIx8hRg/DPvJcfUHvBuZZ5NMIcf2GPyPMRxybaoN6x+qrNvSHgeN0HBSfMYI
 S5Nmi2cSE0UJJm1N7zwlezk1FOX0uuv6eVbSmQmUTBWPEZuRt9EpDdKUfp+FqkwxqkGTxW/KPQJ
 oTrYoMA6aXlWhIK/gyL8y5oPlupk4bexpnkDHQCo4kGUfw31Ax5e2daOnc0+u6SvlwFFdGH8tH/
 R
X-Google-Smtp-Source: AGHT+IE56GPNvJM2MJEOF1+NCDTXbwd1qR7DXEqUgn7pulbwinIHoPXsgUzSqdQtHxSKBrMufnHtag==
X-Received: by 2002:a05:600c:a407:b0:453:dda:a52e with SMTP id
 5b1f17b1804b1-454dec87090mr19020075e9.33.1752158490397; 
 Thu, 10 Jul 2025 07:41:30 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:152f:d800:cb54:c4ae:36fb:9b5a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454dd540a95sm21670525e9.29.2025.07.10.07.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 07:41:29 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: [PATCH 1/2] drm/ttm: fix locking in test
 ttm_bo_validate_no_placement_signaled
Date: Thu, 10 Jul 2025 16:41:28 +0200
Message-Id: <20250710144129.1803-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
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

The test works even without it, but lockdep starts screaming when it is
activated.

Trivially fix it by acquiring the lock before we try to allocate
something.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
index 3148f5d3dbd6..38f476787302 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
@@ -542,14 +542,15 @@ static void ttm_bo_validate_no_placement_signaled(struct kunit *test)
 		bo->ttm = old_tt;
 	}
 
-	err = ttm_resource_alloc(bo, place, &bo->resource, NULL);
-	KUNIT_EXPECT_EQ(test, err, 0);
-	KUNIT_ASSERT_EQ(test, man->usage, size);
-
 	placement = kunit_kzalloc(test, sizeof(*placement), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, placement);
 
 	ttm_bo_reserve(bo, false, false, NULL);
+
+	err = ttm_resource_alloc(bo, place, &bo->resource, NULL);
+	KUNIT_EXPECT_EQ(test, err, 0);
+	KUNIT_ASSERT_EQ(test, man->usage, size);
+
 	err = ttm_bo_validate(bo, placement, &ctx);
 	ttm_bo_unreserve(bo);
 
-- 
2.34.1

