Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF0A839FD1
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 04:02:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BF4810F5D1;
	Wed, 24 Jan 2024 03:01:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01D9910F5C0;
 Wed, 24 Jan 2024 03:01:18 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-559f92bf7b6so9075720a12.0; 
 Tue, 23 Jan 2024 19:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706065216; x=1706670016; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7t4g0dsSRdpeLCYs8MxmtMoFxRmps4SUlUHmKsZELwE=;
 b=DWR8UrCUWPWECGwfoGpvczkVVvxfgVKZbcnTvmb+459C7ZPANkOal1JJanSQ8Gdi4I
 hvtlsPm5r29jr1jC/coz8S3+muMo+1ePI2ZM39LqVAxCf+h1MdgerRTbe4mee/rIkTHH
 AAlOYqSUZrJfnG/mz1i92oEb+PxLLqTZGf5qZX/lruaia5RBTndnVdFl0huBcLBvzkXY
 0pANi2IrQw2HBGtpt0j2zMSJ190H5dvZHV9Ct7crdEQP1EuYuaAlSSiLAYhXO0/d6xr9
 GDxUtYgQ0UOkx0BHG39qOGDAnVTB/7c1sXrCq1XfA9WsgFiNRev98pi0x2eyTqh5FjR7
 o3FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706065216; x=1706670016;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7t4g0dsSRdpeLCYs8MxmtMoFxRmps4SUlUHmKsZELwE=;
 b=t2HuT7tJQyPBRcWTkW3xYERS/tYSonPk3uUsEjUIwugqLN7eXGriMZ3Mg10BwerrUD
 de0CCyhRoGUKsr2ZnAflEgI1CaqKuaw22hoCyFOzL2j7fzJi6ASz/jhl0tNZsybdGzjM
 nz/EcvGM5WzvhFd4Bk5P2uMwj1AFT8IrC5xiCxXICaslBKBhO+VOZuT/zHmd1ItxrkyW
 EqZMQDnjER6zv6bVnMcxMKEtJ9+L/YNkbMILDHLFYTXJiAH3XvjjkqVUD67uerpY8OSX
 Ql8LfOfbacE0J9+Iebtj2YsGS2Gn0juV5mP6+s9uFoDaFsGhecUvOi/Fyd1bw+RcRCP8
 rtHQ==
X-Gm-Message-State: AOJu0Yxf9rkEKuqhxYmaf2Cfho1BXpsIl+Z6kA58creIwfAncAqANBPq
 TACcWIwmmJ7SnU6lCEohAidpZDE8ZkhEB3BEByeLC3OIsuwL5ND9
X-Google-Smtp-Source: AGHT+IEqm4FeloylkgEyETEhp1HlT+xVHaBlzFpBrcRgGswpJ3yK7Jf9LdlNlQ1dmrLktikKiUiZ/w==
X-Received: by 2002:a50:fc04:0:b0:55c:7d37:7d9d with SMTP id
 i4-20020a50fc04000000b0055c7d377d9dmr481849edr.2.1706065216428; 
 Tue, 23 Jan 2024 19:00:16 -0800 (PST)
Received: from mosaic.enunes.eu (ip-78-45-66-209.bb.vodafone.cz.
 [78.45.66.209]) by smtp.gmail.com with ESMTPSA id
 dj17-20020a05640231b100b00559bb146ecbsm9637914edb.6.2024.01.23.19.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 19:00:15 -0800 (PST)
From: Erico Nunes <nunes.erico@gmail.com>
To: Qiang Yu <yuq825@gmail.com>, anarsoul@gmail.com, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org
Subject: [PATCH v2 8/8] drm/lima: standardize debug messages by ip name
Date: Wed, 24 Jan 2024 03:59:47 +0100
Message-ID: <20240124025947.2110659-9-nunes.erico@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240124025947.2110659-1-nunes.erico@gmail.com>
References: <20240124025947.2110659-1-nunes.erico@gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some debug messages carried the ip name, or included "lima", or
included both the ip name and then the numbered ip name again.
Make the messages more consistent by always looking up and showing
the ip name first.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
 drivers/gpu/drm/lima/lima_gp.c       | 20 +++++++++++---------
 drivers/gpu/drm/lima/lima_l2_cache.c |  6 ++++--
 drivers/gpu/drm/lima/lima_mmu.c      | 18 +++++++++---------
 drivers/gpu/drm/lima/lima_pmu.c      |  3 ++-
 drivers/gpu/drm/lima/lima_pp.c       | 19 ++++++++++---------
 5 files changed, 36 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_gp.c b/drivers/gpu/drm/lima/lima_gp.c
index 4355fa7b17f4..6b354e2fb61d 100644
--- a/drivers/gpu/drm/lima/lima_gp.c
+++ b/drivers/gpu/drm/lima/lima_gp.c
@@ -34,11 +34,11 @@ static irqreturn_t lima_gp_irq_handler(int irq, void *data)
 	if (state & LIMA_GP_IRQ_MASK_ERROR) {
 		if ((state & LIMA_GP_IRQ_MASK_ERROR) ==
 		    LIMA_GP_IRQ_PLBU_OUT_OF_MEM) {
-			dev_dbg(dev->dev, "gp out of heap irq status=%x\n",
-				status);
+			dev_dbg(dev->dev, "%s out of heap irq status=%x\n",
+				lima_ip_name(ip), status);
 		} else {
-			dev_err(dev->dev, "gp error irq state=%x status=%x\n",
-				state, status);
+			dev_err(dev->dev, "%s error irq state=%x status=%x\n",
+				lima_ip_name(ip), state, status);
 			if (task)
 				task->recoverable = false;
 		}
@@ -89,7 +89,8 @@ static int lima_gp_soft_reset_async_wait(struct lima_ip *ip)
 				 v & LIMA_GP_IRQ_RESET_COMPLETED,
 				 0, 100);
 	if (err) {
-		dev_err(dev->dev, "gp soft reset time out\n");
+		dev_err(dev->dev, "%s soft reset time out\n",
+			lima_ip_name(ip));
 		return err;
 	}
 
@@ -194,7 +195,7 @@ static int lima_gp_hard_reset(struct lima_ip *ip)
 	gp_write(LIMA_GP_CMD, LIMA_GP_CMD_RESET);
 	ret = lima_poll_timeout(ip, lima_gp_hard_reset_poll, 10, 100);
 	if (ret) {
-		dev_err(dev->dev, "gp hard reset timeout\n");
+		dev_err(dev->dev, "%s hard reset timeout\n", lima_ip_name(ip));
 		return ret;
 	}
 
@@ -220,8 +221,9 @@ static void lima_gp_task_error(struct lima_sched_pipe *pipe)
 {
 	struct lima_ip *ip = pipe->processor[0];
 
-	dev_err(ip->dev->dev, "gp task error int_state=%x status=%x\n",
-		gp_read(LIMA_GP_INT_STAT), gp_read(LIMA_GP_STATUS));
+	dev_err(ip->dev->dev, "%s task error int_state=%x status=%x\n",
+		lima_ip_name(ip), gp_read(LIMA_GP_INT_STAT),
+		gp_read(LIMA_GP_STATUS));
 
 	lima_gp_hard_reset(ip);
 }
@@ -324,7 +326,7 @@ int lima_gp_init(struct lima_ip *ip)
 	err = devm_request_irq(dev->dev, ip->irq, lima_gp_irq_handler,
 			       IRQF_SHARED, lima_ip_name(ip), ip);
 	if (err) {
-		dev_err(dev->dev, "gp %s fail to request irq\n",
+		dev_err(dev->dev, "%s fail to request irq\n",
 			lima_ip_name(ip));
 		return err;
 	}
diff --git a/drivers/gpu/drm/lima/lima_l2_cache.c b/drivers/gpu/drm/lima/lima_l2_cache.c
index c4080a02957b..184106ce55f8 100644
--- a/drivers/gpu/drm/lima/lima_l2_cache.c
+++ b/drivers/gpu/drm/lima/lima_l2_cache.c
@@ -21,7 +21,8 @@ static int lima_l2_cache_wait_idle(struct lima_ip *ip)
 				 !(v & LIMA_L2_CACHE_STATUS_COMMAND_BUSY),
 				 0, 1000);
 	if (err) {
-		dev_err(dev->dev, "l2 cache wait command timeout\n");
+		dev_err(dev->dev, "%s wait command timeout\n",
+			lima_ip_name(ip));
 		return err;
 	}
 	return 0;
@@ -83,7 +84,8 @@ int lima_l2_cache_init(struct lima_ip *ip)
 	spin_lock_init(&ip->data.lock);
 
 	size = l2_cache_read(LIMA_L2_CACHE_SIZE);
-	dev_info(dev->dev, "l2 cache %uK, %u-way, %ubyte cache line, %ubit external bus\n",
+	dev_info(dev->dev, "%s %uK, %u-way, %ubyte cache line, %ubit external bus\n",
+		 lima_ip_name(ip),
 		 1 << (((size >> 16) & 0xff) - 10),
 		 1 << ((size >> 8) & 0xff),
 		 1 << (size & 0xff),
diff --git a/drivers/gpu/drm/lima/lima_mmu.c b/drivers/gpu/drm/lima/lima_mmu.c
index a1ae6c252dc2..e18317c5ca8c 100644
--- a/drivers/gpu/drm/lima/lima_mmu.c
+++ b/drivers/gpu/drm/lima/lima_mmu.c
@@ -22,7 +22,8 @@
 				  cond, 0, 100);	     \
 	if (__ret)					     \
 		dev_err(dev->dev,			     \
-			"mmu command %x timeout\n", cmd);    \
+			"%s command %x timeout\n",           \
+			lima_ip_name(ip), cmd);              \
 	__ret;						     \
 })
 
@@ -40,14 +41,13 @@ static irqreturn_t lima_mmu_irq_handler(int irq, void *data)
 	if (status & LIMA_MMU_INT_PAGE_FAULT) {
 		u32 fault = mmu_read(LIMA_MMU_PAGE_FAULT_ADDR);
 
-		dev_err(dev->dev, "mmu page fault at 0x%x from bus id %d of type %s on %s\n",
-			fault, LIMA_MMU_STATUS_BUS_ID(status),
-			status & LIMA_MMU_STATUS_PAGE_FAULT_IS_WRITE ? "write" : "read",
-			lima_ip_name(ip));
+		dev_err(dev->dev, "%s page fault at 0x%x from bus id %d of type %s\n",
+			lima_ip_name(ip), fault, LIMA_MMU_STATUS_BUS_ID(status),
+			status & LIMA_MMU_STATUS_PAGE_FAULT_IS_WRITE ? "write" : "read");
 	}
 
 	if (status & LIMA_MMU_INT_READ_BUS_ERROR)
-		dev_err(dev->dev, "mmu %s irq bus error\n", lima_ip_name(ip));
+		dev_err(dev->dev, "%s irq bus error\n", lima_ip_name(ip));
 
 	/* mask all interrupts before resume */
 	mmu_write(LIMA_MMU_INT_MASK, 0);
@@ -102,14 +102,14 @@ int lima_mmu_init(struct lima_ip *ip)
 
 	mmu_write(LIMA_MMU_DTE_ADDR, 0xCAFEBABE);
 	if (mmu_read(LIMA_MMU_DTE_ADDR) != 0xCAFEB000) {
-		dev_err(dev->dev, "mmu %s dte write test fail\n", lima_ip_name(ip));
+		dev_err(dev->dev, "%s dte write test fail\n", lima_ip_name(ip));
 		return -EIO;
 	}
 
 	err = devm_request_irq(dev->dev, ip->irq, lima_mmu_irq_handler,
 			       IRQF_SHARED, lima_ip_name(ip), ip);
 	if (err) {
-		dev_err(dev->dev, "mmu %s fail to request irq\n", lima_ip_name(ip));
+		dev_err(dev->dev, "%s fail to request irq\n", lima_ip_name(ip));
 		return err;
 	}
 
@@ -152,7 +152,7 @@ void lima_mmu_page_fault_resume(struct lima_ip *ip)
 	u32 v;
 
 	if (status & LIMA_MMU_STATUS_PAGE_FAULT_ACTIVE) {
-		dev_info(dev->dev, "mmu resume\n");
+		dev_info(dev->dev, "%s resume\n", lima_ip_name(ip));
 
 		mmu_write(LIMA_MMU_INT_MASK, 0);
 		mmu_write(LIMA_MMU_DTE_ADDR, 0xCAFEBABE);
diff --git a/drivers/gpu/drm/lima/lima_pmu.c b/drivers/gpu/drm/lima/lima_pmu.c
index e397e1146e96..113cb9b215cd 100644
--- a/drivers/gpu/drm/lima/lima_pmu.c
+++ b/drivers/gpu/drm/lima/lima_pmu.c
@@ -21,7 +21,8 @@ static int lima_pmu_wait_cmd(struct lima_ip *ip)
 				 v, v & LIMA_PMU_INT_CMD_MASK,
 				 100, 100000);
 	if (err) {
-		dev_err(dev->dev, "timeout wait pmu cmd\n");
+		dev_err(dev->dev, "%s timeout wait pmu cmd\n",
+			lima_ip_name(ip));
 		return err;
 	}
 
diff --git a/drivers/gpu/drm/lima/lima_pp.c b/drivers/gpu/drm/lima/lima_pp.c
index ac097dd75072..d0d2db0ef1ce 100644
--- a/drivers/gpu/drm/lima/lima_pp.c
+++ b/drivers/gpu/drm/lima/lima_pp.c
@@ -26,8 +26,8 @@ static void lima_pp_handle_irq(struct lima_ip *ip, u32 state)
 	if (state & LIMA_PP_IRQ_MASK_ERROR) {
 		u32 status = pp_read(LIMA_PP_STATUS);
 
-		dev_err(dev->dev, "pp error irq state=%x status=%x\n",
-			state, status);
+		dev_err(dev->dev, "%s error irq state=%x status=%x\n",
+			lima_ip_name(ip), state, status);
 
 		pipe->error = true;
 
@@ -125,7 +125,7 @@ static int lima_pp_soft_reset_async_wait_one(struct lima_ip *ip)
 
 	ret = lima_poll_timeout(ip, lima_pp_soft_reset_poll, 0, 100);
 	if (ret) {
-		dev_err(dev->dev, "pp %s reset time out\n", lima_ip_name(ip));
+		dev_err(dev->dev, "%s reset time out\n", lima_ip_name(ip));
 		return ret;
 	}
 
@@ -190,14 +190,14 @@ static int lima_pp_hard_reset(struct lima_ip *ip)
 	pp_write(LIMA_PP_CTRL, LIMA_PP_CTRL_STOP_BUS);
 	ret = lima_poll_timeout(ip, lima_pp_bus_stop_poll, 10, 100);
 	if (ret) {
-		dev_err(dev->dev, "pp %s bus stop timeout\n", lima_ip_name(ip));
+		dev_err(dev->dev, "%s bus stop timeout\n", lima_ip_name(ip));
 		return ret;
 	}
 
 	pp_write(LIMA_PP_CTRL, LIMA_PP_CTRL_FORCE_RESET);
 	ret = lima_poll_timeout(ip, lima_pp_hard_reset_poll, 10, 100);
 	if (ret) {
-		dev_err(dev->dev, "pp hard reset timeout\n");
+		dev_err(dev->dev, "%s hard reset timeout\n", lima_ip_name(ip));
 		return ret;
 	}
 
@@ -274,7 +274,7 @@ int lima_pp_init(struct lima_ip *ip)
 	err = devm_request_irq(dev->dev, ip->irq, lima_pp_irq_handler,
 			       IRQF_SHARED, lima_ip_name(ip), ip);
 	if (err) {
-		dev_err(dev->dev, "pp %s fail to request irq\n",
+		dev_err(dev->dev, "%s fail to request irq\n",
 			lima_ip_name(ip));
 		return err;
 	}
@@ -309,7 +309,7 @@ int lima_pp_bcast_init(struct lima_ip *ip)
 	err = devm_request_irq(dev->dev, ip->irq, lima_pp_bcast_irq_handler,
 			       IRQF_SHARED, lima_ip_name(ip), ip);
 	if (err) {
-		dev_err(dev->dev, "pp %s fail to request irq\n",
+		dev_err(dev->dev, "%s fail to request irq\n",
 			lima_ip_name(ip));
 		return err;
 	}
@@ -423,8 +423,9 @@ static void lima_pp_task_error(struct lima_sched_pipe *pipe)
 	for (i = 0; i < pipe->num_processor; i++) {
 		struct lima_ip *ip = pipe->processor[i];
 
-		dev_err(ip->dev->dev, "pp task error %d int_state=%x status=%x\n",
-			i, pp_read(LIMA_PP_INT_STATUS), pp_read(LIMA_PP_STATUS));
+		dev_err(ip->dev->dev, "%s task error %d int_state=%x status=%x\n",
+			lima_ip_name(ip), i, pp_read(LIMA_PP_INT_STATUS),
+			pp_read(LIMA_PP_STATUS));
 
 		lima_pp_hard_reset(ip);
 	}
-- 
2.43.0

