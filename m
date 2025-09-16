Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCF0B5A39C
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 23:08:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D036810E807;
	Tue, 16 Sep 2025 21:08:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eftptwXd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3040910E7A9
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 21:08:38 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-77796ad4c13so2003075b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 14:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758056918; x=1758661718; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HDRqddRbWnSp212adkMMsF7xlrSYegdf6W4aAStaDzw=;
 b=eftptwXdJgTsJbBXjiSKcf8jA7OHfNyBrsJbyM95XnKWTRhLLaFDDvT6+WodMpE7Vt
 DxhW07WtFOvGqhbg/Vdz+4HlwcQ/a0aIRxrnRn+lbp+pKcWkB4y8zYAA83Bjnqc/qbN3
 5XqfZxb9T9z57/wGC6PwjiZIAzPMPdmZUl0v0txTstov3buHlxNs+RF8lkeOJPxbAh7c
 V2XpyH8x3uQUCF73dwddEUdgfcCWoBeAViPxek1lNVwg+0K0vuxcJU2+nDFKBM7oeMjy
 MwQYu/8IwFaExyr62WsaZNNzQjWJAVuqxxsOQ2PjO06zazIgkl0DC8057Ak+lwF9q6Ok
 VdLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758056918; x=1758661718;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HDRqddRbWnSp212adkMMsF7xlrSYegdf6W4aAStaDzw=;
 b=Kdvarm1I+ocyvSM6N2RR6WUX1ehduivpauARy+orX7nAZia4muzvDq+Op+hcCyEkaj
 UEqvU/lx4Ry2JUiZSHbt833gy+vPEw1rSCB9y4hRFfbYLcIpowQrvKLi7r6F742je0nh
 Z1B//LHGJjh6RUoxsrijm3qe2oqtENMT+L/3gefjbSKBJu5UwpW1ThS/Phge6niyF/RZ
 VF5Q5XpbpyPy5wGtEUDsuICvCF0jLJoZz4SlEZrM3/kMyM6yDga0NRFWdfDVTFrUtAsS
 n4IugfL9P+L9FK9tRwbdUeha2p0HriWN2x1qrsgBhTGgmt3mY/HnrZZloh09MaOYLVrm
 G9vQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWY1EQc3RXJYU8iXX4bguApAMQWq0uDiSe159xTJIFnKFVIFSXxVeCW92t6w5bMrPBebBnlPjdPNBw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywZCeD2/yxJ/gHsZtl/sp8I3kHx/tmp0PAxXEeL+Mg4AnyXvhB
 8o01UXyOj8zcFj4ik46C/vvLbQ9nHRCKHHMOFdXPelJM1Me5CHjIgd9G
X-Gm-Gg: ASbGncuv+G/aMwqCzuxtE10Y+rt7xeDeECrQEKnzpYUHWQp1IBWydYQ3ejiOwNwLgl5
 42eE+1Yu/wjoVJiTLJ41jbdxdeVBkhDVz3XRLkjAtzaSoSNj2oDC8QdxL81A4LMT3kRgg9mFZFi
 HYEUUBgBMZ/oK3Mu820Uv+0yZn2EoR1T75H4Q7c6tuc7bQVwNO6Sz7ofG5pnFUUBWFKPFHewXJV
 Z3wEERM+UJyL8L5a3SRfATOGbX70N/yNvURGnckKANyK5wT32kkJouZ2/MmyzespDIaofEo1W9j
 XzkUS1HKvurVMWCUpG3gUnCTVBZfFtD3NOr/XDk6t8SeqSzdkwgS3wUYluWfY+6wa6fI/1TMLQP
 uVbpkDHpM3wQFmOTXQRm0xn2lqONart2+eNS7VmRbaQFF3KvyuDeKVZ/IQzOipyn1r9xtgv5mgu
 Zh6X+d/Y3qkA==
X-Google-Smtp-Source: AGHT+IFqIksmyW/Ei+gsNzE/y26dEL610pe2Xvan+bTy3nUCeeTaK31LsY9L5E5gLin/D821NBOB7w==
X-Received: by 2002:a05:6a00:806:b0:771:edda:1b9c with SMTP id
 d2e1a72fcca58-77612093489mr21540222b3a.14.1758056917576; 
 Tue, 16 Sep 2025 14:08:37 -0700 (PDT)
Received: from localhost (185.3.125.34.bc.googleusercontent.com.
 [34.125.3.185]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-77607b18400sm16984805b3a.59.2025.09.16.14.08.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 14:08:37 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Grant Likely <grant.likely@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 06/10] drm/panthor: remove write_cmd
Date: Tue, 16 Sep 2025 14:08:19 -0700
Message-ID: <20250916210823.4033529-7-olvaffe@gmail.com>
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

Call mmu_hw_wait_ready explicitly instead.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 46 +++++++++++++++------------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 7d1645a24129d..373871aeea9f4 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -533,18 +533,6 @@ static int mmu_hw_wait_ready(struct panthor_device *ptdev, u32 as_nr)
 	return ret;
 }
 
-static int write_cmd(struct panthor_device *ptdev, u32 as_nr, u32 cmd)
-{
-	int status;
-
-	/* write AS_COMMAND when MMU is ready to accept another command */
-	status = mmu_hw_wait_ready(ptdev, as_nr);
-	if (!status)
-		gpu_write(ptdev, AS_COMMAND(as_nr), cmd);
-
-	return status;
-}
-
 /**
  * mmu_hw_cmd_update() - Issue an UPDATE command
  * @ptdev: Device.
@@ -556,14 +544,14 @@ static int write_cmd(struct panthor_device *ptdev, u32 as_nr, u32 cmd)
  * Issue an UPDATE command to invalidate MMU caches and update the translation
  * table.
  */
-static int mmu_hw_cmd_update(struct panthor_device *ptdev, u32 as_nr, u64 transtab, u64 transcfg,
-			     u64 memattr)
+static void mmu_hw_cmd_update(struct panthor_device *ptdev, u32 as_nr, u64 transtab, u64 transcfg,
+			      u64 memattr)
 {
 	gpu_write64(ptdev, AS_TRANSTAB(as_nr), transtab);
 	gpu_write64(ptdev, AS_MEMATTR(as_nr), memattr);
 	gpu_write64(ptdev, AS_TRANSCFG(as_nr), transcfg);
 
-	return write_cmd(ptdev, as_nr, AS_COMMAND_UPDATE);
+	gpu_write(ptdev, AS_COMMAND(as_nr), AS_COMMAND_UPDATE);
 }
 
 /**
@@ -606,7 +594,7 @@ static void mmu_hw_cmd_lock(struct panthor_device *ptdev, u32 as_nr, u64 region_
 
 	/* Lock the region that needs to be updated */
 	gpu_write64(ptdev, AS_LOCKADDR(as_nr), region);
-	write_cmd(ptdev, as_nr, AS_COMMAND_LOCK);
+	gpu_write(ptdev, AS_COMMAND(as_nr), AS_COMMAND_LOCK);
 }
 
 /**
@@ -619,7 +607,7 @@ static void mmu_hw_cmd_lock(struct panthor_device *ptdev, u32 as_nr, u64 region_
  */
 static void mmu_hw_cmd_unlock(struct panthor_device *ptdev, u32 as_nr)
 {
-	write_cmd(ptdev, as_nr, AS_COMMAND_UNLOCK);
+	gpu_write(ptdev, AS_COMMAND(as_nr), AS_COMMAND_UNLOCK);
 }
 
 /**
@@ -664,7 +652,9 @@ static int mmu_hw_flush_caches(struct panthor_device *ptdev, int as_nr, u64 iova
 	 * power it up
 	 */
 
-	mmu_hw_cmd_lock(ptdev, as_nr, iova, size);
+	ret = mmu_hw_wait_ready(ptdev, as_nr);
+	if (!ret)
+		mmu_hw_cmd_lock(ptdev, as_nr, iova, size);
 
 	ret = mmu_hw_wait_ready(ptdev, as_nr);
 	if (ret)
@@ -679,7 +669,9 @@ static int mmu_hw_flush_caches(struct panthor_device *ptdev, int as_nr, u64 iova
 	 * at the end of the GPU_CONTROL cache flush command, unlike
 	 * AS_COMMAND_FLUSH_MEM or AS_COMMAND_FLUSH_PT.
 	 */
-	mmu_hw_cmd_unlock(ptdev, as_nr);
+	ret = mmu_hw_wait_ready(ptdev, as_nr);
+	if (!ret)
+		mmu_hw_cmd_unlock(ptdev, as_nr);
 
 	/* Wait for the unlock command to complete */
 	return mmu_hw_wait_ready(ptdev, as_nr);
@@ -707,7 +699,13 @@ static int panthor_mmu_as_enable(struct panthor_device *ptdev, u32 as_nr,
 	if (ret)
 		return ret;
 
-	return mmu_hw_cmd_update(ptdev, as_nr, transtab, transcfg, memattr);
+	ret = mmu_hw_wait_ready(ptdev, as_nr);
+	if (ret)
+		return ret;
+
+	mmu_hw_cmd_update(ptdev, as_nr, transtab, transcfg, memattr);
+
+	return 0;
 }
 
 static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr)
@@ -718,7 +716,13 @@ static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr)
 	if (ret)
 		return ret;
 
-	return mmu_hw_cmd_update(ptdev, as_nr, 0, AS_TRANSCFG_ADRMODE_UNMAPPED, 0);
+	ret = mmu_hw_wait_ready(ptdev, as_nr);
+	if (ret)
+		return ret;
+
+	mmu_hw_cmd_update(ptdev, as_nr, 0, AS_TRANSCFG_ADRMODE_UNMAPPED, 0);
+
+	return 0;
 }
 
 static u32 panthor_mmu_fault_mask(struct panthor_device *ptdev, u32 value)
-- 
2.51.0.384.g4c02a37b29-goog

