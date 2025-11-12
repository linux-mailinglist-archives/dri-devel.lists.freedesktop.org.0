Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97173C54E4F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 01:28:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09FBB10E0C9;
	Thu, 13 Nov 2025 00:28:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MwIDtYb/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3259A10E78C
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 18:10:05 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-429c7e438a8so988406f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 10:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762971004; x=1763575804; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+wmjDICqkhyxIMt0aSqRBiqskV13ZNchnqRu1NgOCBA=;
 b=MwIDtYb/yQxFlGkGNabDzpmEtt8tKZFKh4SW9MggSQYIelBrgrqmYF0KpeZYfzvmSG
 lVjIfqAIUFIACoxaPDywVNqdoQH1sVQQqwgAsvZLEfjjhg50++O82j9UGK4fWzdSTHp6
 H/3EzAtVCQTFHPpuVqTExCptU1lUsH5mnRBTHXvVQ1kbJXZnp1lFoKYMA+F0C1X0JSec
 w/ET+TKiep2kmoegNrGw//e8sz9uGZdK5Vn1c9NfPbGImdAopHmv9IJ+c0pAOtV26bMo
 RIrU3j+UJN9f193+Sf0zuvzSQzsgIRRTAvAQ2xTEs253c+qTd3OYhpVPcP8jvIJICi/J
 3HHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762971004; x=1763575804;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+wmjDICqkhyxIMt0aSqRBiqskV13ZNchnqRu1NgOCBA=;
 b=LKe+4Tw8fqEHsh8bxClPs5Ymn97IpaEhVZYVJo6lh+MfzjEwnyxnuh4zPfFfj+FCiE
 VPCqUmafCsisRV89YZNq8y1FsTMb+R7MPeVn5qPgWFQN4QezEYuuRF98tM7ej0/pFZwg
 +DMLoUO3l04ITZ2U2a9dObwkgKhwafKhZo5T9mmC59TrcoXFuL0JuDPdrws1iWKPJljq
 FM1zGrOk+EDqxSf3URTATrdKsnWTdMilmKN/spBVqSrMXJwxeiNh0onGWMQBQFqWRALM
 IK43HriqlX6oJzRyu6BVRHyV7Fe61vHnwfiuJs/uUELyQnbWbCJTL19xH3hjVcSrMtdl
 xMlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVw3qn30mu2I0JTdssaVt8TRKvxJ9Gl42tyqEV4H4UT7BAqYl0RmWzFsrjnX45u++W+CAMvefvGPVU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzk1qwbSECjAebUCGTcD56OeCJsqztn7yYypJdeJ5BhbTIrIFHV
 LR2lenLoLiOCmJgKSLlN7Lh/z4cUZ5PKuznj5wHNvKDH6SSnczrSHGeirOuykgiJ
X-Gm-Gg: ASbGncsJrlrubk6LeIfUA4YB+G7D21FX4vPnHoab+4/PgiXb7vBBNLe8vknSKH4KkxL
 zLL0FHq/yTbcoXfkUNzC0xICl3jpXop2kVbjp9/9HOk4FrxX1DlSSIuDkAOmovqBRgExvgq3eOJ
 7fUn4pBzWs6lV3nLEw7FKdNPab861wc25qlN0VSRXvwup+jNhLv2Bvvzk4Qq5hLKg6Sbx1amZtZ
 2Uhgj1chhrjdvzg0sTNxgYgIP0m6qUVekvIVcBwYCpMcyeAqzDY3abcdNk9C3VDyAS1wReOVZ56
 F1FecQi6AoKDkByOUGxmN+3cEIw9jy+/s7LjXSzsTw6S+tQ+cv3/b7SOJLVjWnF0qu72OGCUUJ6
 9RT5CHGykdzcM2G0UZt93LzFKM/7ists1STCnHbxHnl8Q1lP4mt8v0xPO4JgpdDRNBzWoNX8rMy
 MZfwoGpeky
X-Google-Smtp-Source: AGHT+IHmLYMewd+jrcBOIghWYuI807eXIKJk+kmG2/2leMrzxIPaH8dVJ+dwD4fAdrXHIOtYKYxcMA==
X-Received: by 2002:a05:6000:430e:b0:427:813:6a52 with SMTP id
 ffacd0b85a97d-42b4bdaeeeemr3474839f8f.41.1762971003404; 
 Wed, 12 Nov 2025 10:10:03 -0800 (PST)
Received: from pc.. ([105.163.156.102]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42ac67921c3sm36139163f8f.40.2025.11.12.10.10.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Nov 2025 10:10:02 -0800 (PST)
From: Erick Karanja <karanja99erick@gmail.com>
To: mripard@kernel.org,
	dave.stevenson@raspberrypi.com
Cc: mcanal@igalia.com, kernel-list@raspberrypi.com,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Erick Karanja <karanja99erick@gmail.com>
Subject: [PATCH v2] drm/vc4: Replace lock/unlock pattern to use guard
Date: Wed, 12 Nov 2025 21:09:55 +0300
Message-ID: <20251112180955.145567-1-karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 13 Nov 2025 00:28:26 +0000
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

Replace manual lock/unlock patterns with guard.
This simplifies the code.

Generated-by: Coccinelle SmPL
Signed-off-by: Erick Karanja <karanja99erick@gmail.com>

changes in v2:
	- Indent comments correctly
---
 drivers/gpu/drm/vc4/vc4_v3d.c | 49 ++++++++++++++---------------------
 1 file changed, 20 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
index bb09df5000bd..39815b2f6e2d 100644
--- a/drivers/gpu/drm/vc4/vc4_v3d.c
+++ b/drivers/gpu/drm/vc4/vc4_v3d.c
@@ -130,17 +130,15 @@ vc4_v3d_pm_get(struct vc4_dev *vc4)
 	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return -ENODEV;
 
-	mutex_lock(&vc4->power_lock);
+	guard(mutex)(&vc4->power_lock);
 	if (vc4->power_refcount++ == 0) {
 		int ret = pm_runtime_get_sync(&vc4->v3d->pdev->dev);
 
 		if (ret < 0) {
 			vc4->power_refcount--;
-			mutex_unlock(&vc4->power_lock);
 			return ret;
 		}
 	}
-	mutex_unlock(&vc4->power_lock);
 
 	return 0;
 }
@@ -151,12 +149,11 @@ vc4_v3d_pm_put(struct vc4_dev *vc4)
 	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return;
 
-	mutex_lock(&vc4->power_lock);
+	guard(mutex)(&vc4->power_lock);
 	if (--vc4->power_refcount == 0) {
 		pm_runtime_mark_last_busy(&vc4->v3d->pdev->dev);
 		pm_runtime_put_autosuspend(&vc4->v3d->pdev->dev);
 	}
-	mutex_unlock(&vc4->power_lock);
 }
 
 static void vc4_v3d_init_hw(struct drm_device *dev)
@@ -173,7 +170,6 @@ static void vc4_v3d_init_hw(struct drm_device *dev)
 int vc4_v3d_get_bin_slot(struct vc4_dev *vc4)
 {
 	struct drm_device *dev = &vc4->base;
-	unsigned long irqflags;
 	int slot;
 	uint64_t seqno = 0;
 	struct vc4_exec_info *exec;
@@ -182,23 +178,22 @@ int vc4_v3d_get_bin_slot(struct vc4_dev *vc4)
 		return -ENODEV;
 
 try_again:
-	spin_lock_irqsave(&vc4->job_lock, irqflags);
-	slot = ffs(~vc4->bin_alloc_used);
-	if (slot != 0) {
-		/* Switch from ffs() bit index to a 0-based index. */
-		slot--;
-		vc4->bin_alloc_used |= BIT(slot);
-		spin_unlock_irqrestore(&vc4->job_lock, irqflags);
-		return slot;
-	}
+	scoped_guard (spinlock_irqsave, &vc4->job_lock) {
+		slot = ffs(~vc4->bin_alloc_used);
+		if (slot != 0) {
+			/* Switch from ffs() bit index to a 0-based index. */
+			slot--;
+			vc4->bin_alloc_used |= BIT(slot);
+			return slot;
+		}
 
-	/* Couldn't find an open slot.  Wait for render to complete
-	 * and try again.
-	 */
-	exec = vc4_last_render_job(vc4);
-	if (exec)
-		seqno = exec->seqno;
-	spin_unlock_irqrestore(&vc4->job_lock, irqflags);
+		/* Couldn't find an open slot.  Wait for render to complete
+		 * and try again.
+		 */
+		exec = vc4_last_render_job(vc4);
+		if (exec)
+			seqno = exec->seqno;
+	}
 
 	if (seqno) {
 		int ret = vc4_wait_for_seqno(dev, seqno, ~0ull, true);
@@ -328,10 +323,10 @@ int vc4_v3d_bin_bo_get(struct vc4_dev *vc4, bool *used)
 	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return -ENODEV;
 
-	mutex_lock(&vc4->bin_bo_lock);
+	guard(mutex)(&vc4->bin_bo_lock);
 
 	if (used && *used)
-		goto complete;
+		return ret;
 
 	if (vc4->bin_bo)
 		kref_get(&vc4->bin_bo_kref);
@@ -341,9 +336,6 @@ int vc4_v3d_bin_bo_get(struct vc4_dev *vc4, bool *used)
 	if (ret == 0 && used)
 		*used = true;
 
-complete:
-	mutex_unlock(&vc4->bin_bo_lock);
-
 	return ret;
 }
 
@@ -363,9 +355,8 @@ void vc4_v3d_bin_bo_put(struct vc4_dev *vc4)
 	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return;
 
-	mutex_lock(&vc4->bin_bo_lock);
+	guard(mutex)(&vc4->bin_bo_lock);
 	kref_put(&vc4->bin_bo_kref, bin_bo_release);
-	mutex_unlock(&vc4->bin_bo_lock);
 }
 
 #ifdef CONFIG_PM
-- 
2.43.0

