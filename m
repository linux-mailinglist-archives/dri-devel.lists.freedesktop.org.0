Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2E8B5A39F
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 23:08:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF5F10E812;
	Tue, 16 Sep 2025 21:08:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="O2cKjPc8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2511510E7A9
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 21:08:36 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-76e2ea933b7so258539b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 14:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758056916; x=1758661716; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3qBTryJ9bSqwjcArHStS8Ii28Lxu8QftxwwZnxNDyHM=;
 b=O2cKjPc81nj3/0oLpNHzdCQv4XmEw4WyyRslazhugxHaMq/Pk3RfE5/5HaPEPG/HGi
 /t/W7prpJAmS2PrNn2DfCvq4kWMrO6TBuwLpgV8s3zkEt0hCCzvAmKQPD5uIZB82p29I
 16u0OqLYzAnZ//1DBLZr3blvCavJ42FW34Yv5qn+tGe+3PaLy4EvUOkGPGor236cAeqh
 gUiT+vO9DEbRXSnJ6ELJG15Jc7SuEuiAIhQAC1ke2YCnmZDy+avMnkSO5IQtklK7+HlN
 02jMF6/984a8XoiKiF8RQlpuAHDP+fnm3bMfcqTdlWXtvPJPgV2AqD9HnVioHctAuQSF
 gYtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758056916; x=1758661716;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3qBTryJ9bSqwjcArHStS8Ii28Lxu8QftxwwZnxNDyHM=;
 b=azwBt5bhmBderz728WrsNXBLStM+IRyI36B2uYDGQpqVrTulBo4e9LRjIPcB2a9Jnt
 ZbEoVP5pjcYh0prXCxmsry1d9FL1nQzL0b72yPvP3kDiiHRXHQVjtglL3VdidmZthdi8
 q+JFyLR+utk2Ee0A0Mg+mBqWptiEZEOBEfizExMLzLgvo7tSiZEumifsqAdKBnTThtJa
 0FvQYUjAHydUEmIPrMb4ubpTRQbK8/4mefs83EWOs5xGT20SUfDkR3pzQ4xt76wf/7ap
 H1Ys/u/BKtPlQ9piabKEBtyazzdzD6X4k8q3mc6V8ShVMxPENmSykt9fOrXAq8bFOw6W
 x9BA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKZyqPSUd8bEuxYsvyzV6/VJ7XHOR+c5YyeJ4GqbGKhVPAoesrZ0n6Bz46dHnzxFlSLbfAxQ3k8tQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yygz5HCWVDDMQ9C/DnhN+oQu1WxoPzi+GtrVDVue8b7j199FIOQ
 Ln0z0PwQDSRfBJASj4devemmgk4N/u/FVjm1gBwCBdWhEyIJruUD6WnE
X-Gm-Gg: ASbGncshvRMgdLwwqhaiEy+74Y/nDp8ZZhNkf8pZb0z/iEf52si/38m8vyq7o4cJx8G
 Z2L1nMvFsENZlQNwV9jgjwPgpJLBqBLkRCHomF1mQP7AVHyhjS3vvqKRWC8SfL8IRfivdH0/p7c
 RvYoiD5grTCwYGgSC8PFrLvjYCb7rtqUYRtKqSM9EJ4y7/sTtoGigy1l9mfMuU30pp6726GLywm
 EBUwgCTXuYutfp1v0VyeOCRfqzVubhlujDo7d4/KU5j96dG5CXFZmkB3IQmCiUCJyoX8adWqCFm
 NJPSRa9X2yMEPHfwhS1IDdFMEYrB6f2GxShqFxrnuoeILYnPUcb0TB+RV/cBUc2oFuyZsqzDsNV
 ncbdxwi1Os+1RaAARebV+lIqLmtRK+JeNB6EB/gEyYqaElzr/pEENS0N6PjXSvMN/wRlBzf2ktw
 +HImUHYK+dT0Y++IiJGy2r
X-Google-Smtp-Source: AGHT+IHWXv3+qPwh3jeyVqrxQ3AsWNAJSiHWtN1VPL8/0k/qsLEXEMTQqUrw+IdDG19B6HX27/F2QA==
X-Received: by 2002:a05:6a00:f06:b0:770:4753:b984 with SMTP id
 d2e1a72fcca58-77a85f9fb2cmr4577695b3a.16.1758056915586; 
 Tue, 16 Sep 2025 14:08:35 -0700 (PDT)
Received: from localhost (185.3.125.34.bc.googleusercontent.com.
 [34.125.3.185]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-77607b18371sm17263851b3a.49.2025.09.16.14.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 14:08:35 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Grant Likely <grant.likely@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 04/10] drm/panthor: add mmu_hw_cmd_update
Date: Tue, 16 Sep 2025 14:08:17 -0700
Message-ID: <20250916210823.4033529-5-olvaffe@gmail.com>
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

Add a simple helper for the UPDATE command.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 33 +++++++++++++++++++--------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 953348f9afdb8..727339d80d37e 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -545,6 +545,27 @@ static int write_cmd(struct panthor_device *ptdev, u32 as_nr, u32 cmd)
 	return status;
 }
 
+/**
+ * mmu_hw_cmd_update() - Issue an UPDATE command
+ * @ptdev: Device.
+ * @as_nr: AS to issue command to.
+ * @transtab: Addr of the translation table.
+ * @transcfg: Bitmask of AS_TRANSCFG_*.
+ * @memattr: Bitmask of AS_MEMATTR_*.
+ *
+ * Issue an UPDATE command to invalidate MMU caches and update the translation
+ * table.
+ */
+static int mmu_hw_cmd_update(struct panthor_device *ptdev, u32 as_nr, u64 transtab, u64 transcfg,
+			     u64 memattr)
+{
+	gpu_write64(ptdev, AS_TRANSTAB(as_nr), transtab);
+	gpu_write64(ptdev, AS_MEMATTR(as_nr), memattr);
+	gpu_write64(ptdev, AS_TRANSCFG(as_nr), transcfg);
+
+	return write_cmd(ptdev, as_nr, AS_COMMAND_UPDATE);
+}
+
 /**
  * mmu_hw_cmd_lock() - Issue a LOCK command
  * @ptdev: Device.
@@ -674,11 +695,7 @@ static int panthor_mmu_as_enable(struct panthor_device *ptdev, u32 as_nr,
 	if (ret)
 		return ret;
 
-	gpu_write64(ptdev, AS_TRANSTAB(as_nr), transtab);
-	gpu_write64(ptdev, AS_MEMATTR(as_nr), memattr);
-	gpu_write64(ptdev, AS_TRANSCFG(as_nr), transcfg);
-
-	return write_cmd(ptdev, as_nr, AS_COMMAND_UPDATE);
+	return mmu_hw_cmd_update(ptdev, as_nr, transtab, transcfg, memattr);
 }
 
 static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr)
@@ -689,11 +706,7 @@ static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr)
 	if (ret)
 		return ret;
 
-	gpu_write64(ptdev, AS_TRANSTAB(as_nr), 0);
-	gpu_write64(ptdev, AS_MEMATTR(as_nr), 0);
-	gpu_write64(ptdev, AS_TRANSCFG(as_nr), AS_TRANSCFG_ADRMODE_UNMAPPED);
-
-	return write_cmd(ptdev, as_nr, AS_COMMAND_UPDATE);
+	return mmu_hw_cmd_update(ptdev, as_nr, 0, AS_TRANSCFG_ADRMODE_UNMAPPED, 0);
 }
 
 static u32 panthor_mmu_fault_mask(struct panthor_device *ptdev, u32 value)
-- 
2.51.0.384.g4c02a37b29-goog

