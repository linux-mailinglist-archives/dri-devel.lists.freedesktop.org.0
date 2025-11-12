Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E431C518CF
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 11:06:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17B4C10E1C6;
	Wed, 12 Nov 2025 10:06:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XlqmbVbw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5A9E10E6C7
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 08:02:32 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-b7321b03aecso92677966b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 00:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762934551; x=1763539351; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=X1vSzWoIsU/LU/7nkUUUbQ83OoHkgHR/WVO8I+WEFiQ=;
 b=XlqmbVbw8r0B6RVaGQy0su53abTnskI8ziNvK/S11Why5aqZdNQXD2sO5iEfm636U3
 J4UzkCSAbBpa8G2KV8WNLw7xgt8B6A9Ze5ovwwO8CfQ6tSgqKGvmyfwiqCDbHd5jwtqD
 v54cV8Gb/OxIBDyeMsn1DXmKJxl/dOAiBIEc3u/K5CdlwggzOCp7HTfqpR+JaZhE6vYA
 fztlVnP+JNRZgH/cjkRmFXyEEzV3lrFJV64GEeJfQ7liz+5T5ZAbQL8VoKV18s07hK9t
 nYIh6kyHatVqGCZisxI0yuxWsWMIX+0n8RosPb6FNkAArhYzlI7n4au1u84I36YipmoV
 nZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762934551; x=1763539351;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X1vSzWoIsU/LU/7nkUUUbQ83OoHkgHR/WVO8I+WEFiQ=;
 b=SPcMDA/PSKK/zMFNXRqtO33GS24LCPy7qO/gxGBY8Ttbal8a+n3RoXXhCRVwKIV+er
 AJc9zUcx4xyfyO3BuAJTkzjL+KqfOMG0cYJWmlipL8XDH4XcDKH7oPgDpEh0jZcuAcQL
 txAT2+vovFY9n2KMptvG5XZehby0sIhYdYCrAV64R+8l+vZqOX/XKKZvoNWdRIPemzLB
 PhIm3E5yRvTtJiQW02bXXlQJWiR7HKXskCMYYt0D40FOy5da4gH+1aVmgyrrIrV0aTi0
 JlUyfqI7hBJuzUYwGTVZX4Tp0CH0yH1lBF23rIFcqRvKRGmIU6uMUqxtVjB3jsPqhOJt
 Xedg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaSQoEg63fK/qXB/b/0P+/39v8/Q7liVg7vKkBSNybKo7cavudF7Z11r3tJd7I2FeHf+EKsV40tyQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YysyuZhpGkC7oAuYsQKeuD0sRvzSgjxPaXftMFwWizL+cfsQ5SA
 P1dJmXd8WB55eUeLl6KFB3bcwsN5WcfgBHwdlv61TrhvjtjeB2q8sRQa
X-Gm-Gg: ASbGncv6TpA/aRkdpCt7I9+tlQS9EixqycXbYSnO3r7RLA+U+XK/PKn0AdvAOp4Wn+L
 joM7P0DzOgiD1y3/49f3yJRo8r+gXkY2lbRWSMa1kgU17vT7e0orcqK1TJnFDLlj1Mx6V3aiYY6
 sRXn0zi6E5nyJlidL62kC2Ezo9EKlLUe63ixQ5YkzIqfGPNx/p8TXN99u4D6A9HskSoupvD9XZr
 jx6lEvo8fxvKy6nHwv54v+5j5vU2IRh/EsFfoVmOVHiIKu1T3klJe2+UCCJSx/RYW5Tsg1Yy4O2
 Ivz8z4EkrAs5AwpZWSVkxCG1r/3ZjXYEMNY0Ujs5EuxmY5bNGkeFyGMpRv/w2DePmg2lOiq8PRA
 Mi6JDREQ7E97Z47F0/ON0E5N7b10Fsp88khnX3SYnpM5jbNZmJ/MR5Hp9PTqC5GA3cSZDpaU=
X-Google-Smtp-Source: AGHT+IH4ZMrWaoefx3L7WnsU9NJXJjf/H4U0hsMcEo73wphLyQhueMcVj/mEqHE3McBEcd+WIQvBUg==
X-Received: by 2002:a17:907:7285:b0:b46:31be:e8fe with SMTP id
 a640c23a62f3a-b7331973fb1mr219408666b.11.1762934550973; 
 Wed, 12 Nov 2025 00:02:30 -0800 (PST)
Received: from pc.. ([41.209.14.102]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bf9bc83asm1515992366b.51.2025.11.12.00.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Nov 2025 00:02:30 -0800 (PST)
From: Erick Karanja <karanja99erick@gmail.com>
To: mripard@kernel.org,
	dave.stevenson@raspberrypi.com
Cc: mcanal@igalia.com, kernel-list@raspberrypi.com,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Erick Karanja <karanja99erick@gmail.com>
Subject: [PATCH] drm/vc4: Replace lock/unlock pattern to use guard
Date: Wed, 12 Nov 2025 11:02:20 +0300
Message-ID: <20251112080220.223318-1-karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 12 Nov 2025 10:06:49 +0000
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
---
 drivers/gpu/drm/vc4/vc4_v3d.c | 45 ++++++++++++++---------------------
 1 file changed, 18 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
index bb09df5000bd..8271a6610d6e 100644
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
+		/* Couldn't find an open slot.  Wait for render to complete
 	 * and try again.
 	 */
-	exec = vc4_last_render_job(vc4);
-	if (exec)
-		seqno = exec->seqno;
-	spin_unlock_irqrestore(&vc4->job_lock, irqflags);
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

