Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D40BB5A39E
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 23:08:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0296C10E811;
	Tue, 16 Sep 2025 21:08:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="A68eCD3Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4180910E807
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 21:08:42 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-772301f8ae2so5573699b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 14:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758056922; x=1758661722; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5mKuDRdJJO0qDbnGjgA4rHMGy6EHP4eBLakbjsfvnkc=;
 b=A68eCD3Ylg4xL5sOEEk005N92qhwzm2RUwXyAchAfJ3naFTZEkdVffHNsH+RzjDdTx
 Da6C+Egn4S6YT6c5Vso1QcpHAzbTF6MW2en6FTXqvTCgDA8T7gqmK2WS9t93nYJNuyVs
 q0sK0GwNOm6HIw55LYO2NicZNfhsjEYs9UH5jr4fbrRUCZKjhaIh4wiCIptbKcQbuTmF
 1GIVC1Jtjq7d/mcMxbeTfz4AvHevWt6OBsNOcTZx2MvXx8yAFZhr83D10YJBIUhtaRsx
 tvEmmLHNudHp81uP8PeEf4IML2iz18ZtlMkdXMmEdGfw8M1kBUiMOixSPlwQLoXMzhu7
 CZvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758056922; x=1758661722;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5mKuDRdJJO0qDbnGjgA4rHMGy6EHP4eBLakbjsfvnkc=;
 b=P20t4iIMqzC66XHqH2EueYH6HIlThtq/g7DrQkI+gGo1jzfcVn64QuoFtZ4vEI8RXA
 IDZ7fNl9Z3qe33U897iJlYglBUlV8NfafLCu5Y1Ep4e+V7TKGtCn5T21zSdJ7Ub23mlG
 aJaKWwyDiE2cMsqlnS/h1meH+F0+wDD6hpPK0WaOkquzZbmDT4maW3z5RODMhr8LmyrF
 0vW7snEcAGiDBWDAvg6+hW8Za7skCFII9mSHrXwsWZX/iTNk7W2aPzt3AcHkIf1uDVPz
 gUyOc6upVG0+iYs1PJo561W4sX96l/QkLfgQd3hnbSF9OUadR061woyASo/+XRguX1S7
 qXiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1YijmUd3q0B+/zJHakwWRvDjAvm96WXSZWIcjGYnLb4D++gRScNjj57hq5yc9xleeIOsR0GOar8w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzh1rZymrVeUxYn/Ze0WdtD+1777+wCb8zVfOok/YuLoY6EOyGi
 2YNAnCsCskOGzFzunn7vipA6OFc7X0149nr3u5eIlmLH1dmCwenzfZzz
X-Gm-Gg: ASbGncu4W6MwolHVx1+MPkdF5dOoriejonbAYPVJ96ByGKuWlGO5KjEhKHlvbjGMIlD
 z19Ik94MAaHhSU99b1vSn74QrgR6agV8UsAXr5wS2aiKy0kQ+1rSnHqis9yrqYxQEGHOYbRRrHZ
 m3EUaLzIKpXZ/ClBK1DLgL06IJklED8cb5bHsnvuFsjyyJxYJQ7+LvaVSufeICMBYbQVBrUL46+
 0i1Msm/b2tTn3bZmragavJanb1dEUxyWjONHocdHidA37wY0J2eIvKvlDUiqBLWB7SF29M7fPvT
 UGU+KV0UDsDv4kGL22PzYMMatkjNEh7N2qkQvVfgX9/E6duzZCWBe9LCjtaQPuAwSlVNngaYtXX
 Jr72pcH5H4r4xaLYb+xTHL23vuwJPzbc1CVz0wlm7YBtRmORA5zueLFdfKyp5Y5qVuMo+p/gsC1
 VWgCUAhCkA1gTbBizudonm
X-Google-Smtp-Source: AGHT+IEDixYIXoVhgvzO78eXbNMXUTFn5Eh7QdDPXuCG2AzTfJIo/tAuDVPaJEutqDntn6kKaRGWXA==
X-Received: by 2002:a05:6a20:728e:b0:243:f5ba:aa9c with SMTP id
 adf61e73a8af0-2602b084850mr22828169637.25.1758056921753; 
 Tue, 16 Sep 2025 14:08:41 -0700 (PDT)
Received: from localhost (185.3.125.34.bc.googleusercontent.com.
 [34.125.3.185]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-77607a48c19sm17032735b3a.36.2025.09.16.14.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 14:08:41 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Grant Likely <grant.likely@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 10/10] drm/panthor: simplify mmu_hw_flush_caches
Date: Tue, 16 Sep 2025 14:08:23 -0700
Message-ID: <20250916210823.4033529-11-olvaffe@gmail.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
In-Reply-To: <20250916210823.4033529-1-olvaffe@gmail.com>
References: <20250916210823.4033529-1-olvaffe@gmail.com>
MIME-Version: 1.0
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

Simplify flush op to a bool to control whether LSC is
flushed/invalidated. Remove mmu_hw_do_operation helper.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 42 ++++++---------------------
 1 file changed, 9 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 743e9342eece7..5418f079444ce 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -613,33 +613,20 @@ static void mmu_hw_cmd_unlock(struct panthor_device *ptdev, u32 as_nr)
  * @as_nr: AS to issue command to.
  * @iova: Start of the region.
  * @size: Size of the region.
- * @op: AS_COMMAND_FLUSH_*
+ * @flush_lsc: True if LSC should be flushed/invalidated.
  *
  * Issue LOCK/GPU_FLUSH_CACHES/UNLOCK commands in order to flush and
  * invalidate L2/MMU/LSC caches for a region.
  *
  * Return: 0 on success, a negative error code otherwise.
  */
-static int mmu_hw_flush_caches(struct panthor_device *ptdev, int as_nr, u64 iova, u64 size, u32 op)
+static int mmu_hw_flush_caches(struct panthor_device *ptdev, int as_nr, u64 iova, u64 size,
+			       bool flush_lsc)
 {
 	const u32 l2_flush_op = CACHE_CLEAN | CACHE_INV;
-	u32 lsc_flush_op;
+	const u32 lsc_flush_op = flush_lsc ? l2_flush_op : 0;
 	int ret;
 
-	lockdep_assert_held(&ptdev->mmu->as.slots_lock);
-
-	switch (op) {
-	case AS_COMMAND_FLUSH_MEM:
-		lsc_flush_op = CACHE_CLEAN | CACHE_INV;
-		break;
-	case AS_COMMAND_FLUSH_PT:
-		lsc_flush_op = 0;
-		break;
-	default:
-		drm_WARN(&ptdev->base, 1, "Unexpected AS_COMMAND: %d", op);
-		return -EINVAL;
-	}
-
 	if (as_nr < 0 || !size)
 		return 0;
 
@@ -671,25 +658,12 @@ static int mmu_hw_flush_caches(struct panthor_device *ptdev, int as_nr, u64 iova
 	return ret;
 }
 
-static int mmu_hw_do_operation(struct panthor_vm *vm,
-			       u64 iova, u64 size, u32 op)
-{
-	struct panthor_device *ptdev = vm->ptdev;
-	int ret;
-
-	mutex_lock(&ptdev->mmu->as.slots_lock);
-	ret = mmu_hw_flush_caches(ptdev, vm->as.id, iova, size, op);
-	mutex_unlock(&ptdev->mmu->as.slots_lock);
-
-	return ret;
-}
-
 static int panthor_mmu_as_enable(struct panthor_device *ptdev, u32 as_nr,
 				 u64 transtab, u64 transcfg, u64 memattr)
 {
 	int ret;
 
-	ret = mmu_hw_flush_caches(ptdev, as_nr, 0, ~0ULL, AS_COMMAND_FLUSH_MEM);
+	ret = mmu_hw_flush_caches(ptdev, as_nr, 0, ~0ULL, true);
 	if (ret)
 		return ret;
 
@@ -706,7 +680,7 @@ static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr)
 {
 	int ret;
 
-	ret = mmu_hw_flush_caches(ptdev, as_nr, 0, ~0ULL, AS_COMMAND_FLUSH_MEM);
+	ret = mmu_hw_flush_caches(ptdev, as_nr, 0, ~0ULL, true);
 	if (ret)
 		return ret;
 
@@ -962,7 +936,9 @@ static int panthor_vm_flush_range(struct panthor_vm *vm, u64 iova, u64 size)
 	if (!drm_dev_enter(&ptdev->base, &cookie))
 		return 0;
 
-	ret = mmu_hw_do_operation(vm, iova, size, AS_COMMAND_FLUSH_PT);
+	mutex_lock(&ptdev->mmu->as.slots_lock);
+	ret = mmu_hw_flush_caches(ptdev, vm->as.id, iova, size, false);
+	mutex_unlock(&ptdev->mmu->as.slots_lock);
 
 	drm_dev_exit(cookie);
 	return ret;
-- 
2.51.0.384.g4c02a37b29-goog

