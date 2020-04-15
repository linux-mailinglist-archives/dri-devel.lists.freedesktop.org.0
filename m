Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 701B81AA913
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 15:53:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD9C6E9E3;
	Wed, 15 Apr 2020 13:53:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1AEE6E9E3;
 Wed, 15 Apr 2020 13:53:50 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id a32so6792818pje.5;
 Wed, 15 Apr 2020 06:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=1TYZv9JP92N2J8178uaV6manbwZcTV06YpVK5S4w03I=;
 b=o+WjCXvhOlwuC56C99X7KpmBzCTUYU9ur807NWiZZa44gzNiIGdyansYFg6dxP8dqs
 wSA9KAgsrMQhNpqwmqExvnsoXpPRJPieOSOjuu4Q28CQ+YxZ9xNk8M37x9VJmyaVsVNe
 YLAe6oiq/zOwZVmNFc7ebBEkoKDa7ZCWhKvv9RjQkxFZbsXtnD/FnjAFOZCmYhMAOuj8
 KEhTH73c+vcqsZWx7tG+0Em3EOQ/ewztl1+d0l3b4vRIK+UIfpU2R+f5DyXlzKVsR9D/
 g7+mxMRQA98t++IoRUBOAgJjWjewoXp1/39xCzfFDXKpLS4JLkxEuRbtAM8IjMAAjNw5
 gVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=1TYZv9JP92N2J8178uaV6manbwZcTV06YpVK5S4w03I=;
 b=Ri6gE+kCgntOIUxIJ+6ZauJXSv6VclY/IZUuYSJBpdtaNr7Fe8Sx8SWMmPa6PkHEc6
 vVIJzLqaocWzV8cQtsB6NfzsjwssIzjKrToJvrwZmvBJdiH5F0P9M3SLhwBv32xmnZbr
 LJqmXc5FsukctLWhzsrlKsaDqsYWgYYj1jw+P0iTme8TyXYLEgaN17XAOX4JBpdpqKkY
 V36YYI2xg4Z5ve8mOEtky5iJG8aMovmOjVt+aE6t3IGEXpVTzjBikZNH+e3a2OLMWHu7
 6OJWwG5XuDyy1WbYyoarvtMPQR1fC/9msbCzPfXDRepftrOFcMstZ55S0doFT/2tWOXh
 oD4g==
X-Gm-Message-State: AGi0PuYYsOnlEQMVaVCmicpyDdp6NPUKzDmLEjd15iMpNkbZS39XbLba
 3bO9ADlQPN23MIWeatsSiLHNfFKHhCLukA==
X-Google-Smtp-Source: APiQypJMmSaxC3gUHz4p/DqRXW6rpY2v8Ti/p/a8gG5UatE2K+H331ZCtW+Tmkz767QcqF+L2O0yPA==
X-Received: by 2002:a17:902:a40f:: with SMTP id
 p15mr5241736plq.154.1586958829719; 
 Wed, 15 Apr 2020 06:53:49 -0700 (PDT)
Received: from yuq-Aspire-4738G.lan (li2017-195.members.linode.com.
 [172.105.124.195])
 by smtp.gmail.com with ESMTPSA id z1sm3331069pjt.42.2020.04.15.06.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 06:53:49 -0700 (PDT)
From: Qiang Yu <yuq825@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] drm/lima: add resume/suspend callback for each ip
Date: Wed, 15 Apr 2020 21:52:07 +0800
Message-Id: <20200415135208.8960-4-yuq825@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200415135208.8960-1-yuq825@gmail.com>
References: <20200415135208.8960-1-yuq825@gmail.com>
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Bhushan Shah <bshah@kde.org>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Andreas Baierl <ichgeh@imkreisrum.de>, Qiang Yu <yuq825@gmail.com>,
 Erico Nunes <nunes.erico@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For called when PM do resume/suspend.

Tested-by: Bhushan Shah <bshah@kde.org>
Signed-off-by: Qiang Yu <yuq825@gmail.com>
---
 drivers/gpu/drm/lima/lima_bcast.c    | 25 ++++++++++++----
 drivers/gpu/drm/lima/lima_bcast.h    |  2 ++
 drivers/gpu/drm/lima/lima_device.c   |  4 +++
 drivers/gpu/drm/lima/lima_device.h   |  2 +-
 drivers/gpu/drm/lima/lima_dlbu.c     | 17 ++++++++++-
 drivers/gpu/drm/lima/lima_dlbu.h     |  2 ++
 drivers/gpu/drm/lima/lima_gp.c       | 21 +++++++++++--
 drivers/gpu/drm/lima/lima_gp.h       |  2 ++
 drivers/gpu/drm/lima/lima_l2_cache.c | 37 ++++++++++++++++-------
 drivers/gpu/drm/lima/lima_l2_cache.h |  2 ++
 drivers/gpu/drm/lima/lima_mmu.c      | 45 ++++++++++++++++++++--------
 drivers/gpu/drm/lima/lima_mmu.h      |  2 ++
 drivers/gpu/drm/lima/lima_pmu.c      | 25 ++++++++++++++--
 drivers/gpu/drm/lima/lima_pmu.h      |  2 ++
 drivers/gpu/drm/lima/lima_pp.c       | 31 +++++++++++++++++--
 drivers/gpu/drm/lima/lima_pp.h       |  4 +++
 16 files changed, 186 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_bcast.c b/drivers/gpu/drm/lima/lima_bcast.c
index 288398027bfa..fbc43f243c54 100644
--- a/drivers/gpu/drm/lima/lima_bcast.c
+++ b/drivers/gpu/drm/lima/lima_bcast.c
@@ -26,18 +26,33 @@ void lima_bcast_enable(struct lima_device *dev, int num_pp)
 	bcast_write(LIMA_BCAST_BROADCAST_MASK, mask);
 }
 
+static int lima_bcast_hw_init(struct lima_ip *ip)
+{
+	bcast_write(LIMA_BCAST_BROADCAST_MASK, ip->data.mask << 16);
+	bcast_write(LIMA_BCAST_INTERRUPT_MASK, ip->data.mask);
+	return 0;
+}
+
+int lima_bcast_resume(struct lima_ip *ip)
+{
+	return lima_bcast_hw_init(ip);
+}
+
+void lima_bcast_suspend(struct lima_ip *ip)
+{
+
+}
+
 int lima_bcast_init(struct lima_ip *ip)
 {
-	int i, mask = 0;
+	int i;
 
 	for (i = lima_ip_pp0; i <= lima_ip_pp7; i++) {
 		if (ip->dev->ip[i].present)
-			mask |= 1 << (i - lima_ip_pp0);
+			ip->data.mask |= 1 << (i - lima_ip_pp0);
 	}
 
-	bcast_write(LIMA_BCAST_BROADCAST_MASK, mask << 16);
-	bcast_write(LIMA_BCAST_INTERRUPT_MASK, mask);
-	return 0;
+	return lima_bcast_hw_init(ip);
 }
 
 void lima_bcast_fini(struct lima_ip *ip)
diff --git a/drivers/gpu/drm/lima/lima_bcast.h b/drivers/gpu/drm/lima/lima_bcast.h
index c47e58563d0a..465ee587bceb 100644
--- a/drivers/gpu/drm/lima/lima_bcast.h
+++ b/drivers/gpu/drm/lima/lima_bcast.h
@@ -6,6 +6,8 @@
 
 struct lima_ip;
 
+int lima_bcast_resume(struct lima_ip *ip);
+void lima_bcast_suspend(struct lima_ip *ip);
 int lima_bcast_init(struct lima_ip *ip);
 void lima_bcast_fini(struct lima_ip *ip);
 
diff --git a/drivers/gpu/drm/lima/lima_device.c b/drivers/gpu/drm/lima/lima_device.c
index 247f51fd40a2..e5f1f84ba85a 100644
--- a/drivers/gpu/drm/lima/lima_device.c
+++ b/drivers/gpu/drm/lima/lima_device.c
@@ -25,6 +25,8 @@ struct lima_ip_desc {
 
 	int (*init)(struct lima_ip *ip);
 	void (*fini)(struct lima_ip *ip);
+	int (*resume)(struct lima_ip *ip);
+	void (*suspend)(struct lima_ip *ip);
 };
 
 #define LIMA_IP_DESC(ipname, mst0, mst1, off0, off1, func, irq) \
@@ -41,6 +43,8 @@ struct lima_ip_desc {
 		}, \
 		.init = lima_##func##_init, \
 		.fini = lima_##func##_fini, \
+		.resume = lima_##func##_resume, \
+		.suspend = lima_##func##_suspend, \
 	}
 
 static struct lima_ip_desc lima_ip_desc[lima_ip_num] = {
diff --git a/drivers/gpu/drm/lima/lima_device.h b/drivers/gpu/drm/lima/lima_device.h
index 1a5032b08883..095a0b5f1703 100644
--- a/drivers/gpu/drm/lima/lima_device.h
+++ b/drivers/gpu/drm/lima/lima_device.h
@@ -64,7 +64,7 @@ struct lima_ip {
 		bool async_reset;
 		/* l2 cache */
 		spinlock_t lock;
-		/* pmu */
+		/* pmu/bcast */
 		u32 mask;
 	} data;
 };
diff --git a/drivers/gpu/drm/lima/lima_dlbu.c b/drivers/gpu/drm/lima/lima_dlbu.c
index 8399ceffb94b..c1d5ea35daa7 100644
--- a/drivers/gpu/drm/lima/lima_dlbu.c
+++ b/drivers/gpu/drm/lima/lima_dlbu.c
@@ -42,7 +42,7 @@ void lima_dlbu_set_reg(struct lima_ip *ip, u32 *reg)
 	dlbu_write(LIMA_DLBU_START_TILE_POS, reg[3]);
 }
 
-int lima_dlbu_init(struct lima_ip *ip)
+static int lima_dlbu_hw_init(struct lima_ip *ip)
 {
 	struct lima_device *dev = ip->dev;
 
@@ -52,6 +52,21 @@ int lima_dlbu_init(struct lima_ip *ip)
 	return 0;
 }
 
+int lima_dlbu_resume(struct lima_ip *ip)
+{
+	return lima_dlbu_hw_init(ip);
+}
+
+void lima_dlbu_suspend(struct lima_ip *ip)
+{
+
+}
+
+int lima_dlbu_init(struct lima_ip *ip)
+{
+	return lima_dlbu_hw_init(ip);
+}
+
 void lima_dlbu_fini(struct lima_ip *ip)
 {
 
diff --git a/drivers/gpu/drm/lima/lima_dlbu.h b/drivers/gpu/drm/lima/lima_dlbu.h
index 16f877984466..be71daaaee89 100644
--- a/drivers/gpu/drm/lima/lima_dlbu.h
+++ b/drivers/gpu/drm/lima/lima_dlbu.h
@@ -12,6 +12,8 @@ void lima_dlbu_disable(struct lima_device *dev);
 
 void lima_dlbu_set_reg(struct lima_ip *ip, u32 *reg);
 
+int lima_dlbu_resume(struct lima_ip *ip);
+void lima_dlbu_suspend(struct lima_ip *ip);
 int lima_dlbu_init(struct lima_ip *ip);
 void lima_dlbu_fini(struct lima_ip *ip);
 
diff --git a/drivers/gpu/drm/lima/lima_gp.c b/drivers/gpu/drm/lima/lima_gp.c
index d8841c870d90..8dd501b7a3d0 100644
--- a/drivers/gpu/drm/lima/lima_gp.c
+++ b/drivers/gpu/drm/lima/lima_gp.c
@@ -274,6 +274,23 @@ static void lima_gp_print_version(struct lima_ip *ip)
 static struct kmem_cache *lima_gp_task_slab;
 static int lima_gp_task_slab_refcnt;
 
+static int lima_gp_hw_init(struct lima_ip *ip)
+{
+	ip->data.async_reset = false;
+	lima_gp_soft_reset_async(ip);
+	return lima_gp_soft_reset_async_wait(ip);
+}
+
+int lima_gp_resume(struct lima_ip *ip)
+{
+	return lima_gp_hw_init(ip);
+}
+
+void lima_gp_suspend(struct lima_ip *ip)
+{
+
+}
+
 int lima_gp_init(struct lima_ip *ip)
 {
 	struct lima_device *dev = ip->dev;
@@ -281,9 +298,7 @@ int lima_gp_init(struct lima_ip *ip)
 
 	lima_gp_print_version(ip);
 
-	ip->data.async_reset = false;
-	lima_gp_soft_reset_async(ip);
-	err = lima_gp_soft_reset_async_wait(ip);
+	err = lima_gp_hw_init(ip);
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/lima/lima_gp.h b/drivers/gpu/drm/lima/lima_gp.h
index 516e5c1babbb..02ec9af78a51 100644
--- a/drivers/gpu/drm/lima/lima_gp.h
+++ b/drivers/gpu/drm/lima/lima_gp.h
@@ -7,6 +7,8 @@
 struct lima_ip;
 struct lima_device;
 
+int lima_gp_resume(struct lima_ip *ip);
+void lima_gp_suspend(struct lima_ip *ip);
 int lima_gp_init(struct lima_ip *ip);
 void lima_gp_fini(struct lima_ip *ip);
 
diff --git a/drivers/gpu/drm/lima/lima_l2_cache.c b/drivers/gpu/drm/lima/lima_l2_cache.c
index 6873a7af5a5c..c67fa34fba18 100644
--- a/drivers/gpu/drm/lima/lima_l2_cache.c
+++ b/drivers/gpu/drm/lima/lima_l2_cache.c
@@ -38,9 +38,34 @@ int lima_l2_cache_flush(struct lima_ip *ip)
 	return ret;
 }
 
+static int lima_l2_cache_hw_init(struct lima_ip *ip)
+{
+	int err;
+
+	err = lima_l2_cache_flush(ip);
+	if (err)
+		return err;
+
+	l2_cache_write(LIMA_L2_CACHE_ENABLE,
+		       LIMA_L2_CACHE_ENABLE_ACCESS|LIMA_L2_CACHE_ENABLE_READ_ALLOCATE);
+	l2_cache_write(LIMA_L2_CACHE_MAX_READS, 0x1c);
+
+	return 0;
+}
+
+int lima_l2_cache_resume(struct lima_ip *ip)
+{
+	return lima_l2_cache_hw_init(ip);
+}
+
+void lima_l2_cache_suspend(struct lima_ip *ip)
+{
+
+}
+
 int lima_l2_cache_init(struct lima_ip *ip)
 {
-	int i, err;
+	int i;
 	u32 size;
 	struct lima_device *dev = ip->dev;
 
@@ -63,15 +88,7 @@ int lima_l2_cache_init(struct lima_ip *ip)
 		 1 << (size & 0xff),
 		 1 << ((size >> 24) & 0xff));
 
-	err = lima_l2_cache_flush(ip);
-	if (err)
-		return err;
-
-	l2_cache_write(LIMA_L2_CACHE_ENABLE,
-		       LIMA_L2_CACHE_ENABLE_ACCESS|LIMA_L2_CACHE_ENABLE_READ_ALLOCATE);
-	l2_cache_write(LIMA_L2_CACHE_MAX_READS, 0x1c);
-
-	return 0;
+	return lima_l2_cache_hw_init(ip);
 }
 
 void lima_l2_cache_fini(struct lima_ip *ip)
diff --git a/drivers/gpu/drm/lima/lima_l2_cache.h b/drivers/gpu/drm/lima/lima_l2_cache.h
index c63fb676ff14..1aeeefd53fb9 100644
--- a/drivers/gpu/drm/lima/lima_l2_cache.h
+++ b/drivers/gpu/drm/lima/lima_l2_cache.h
@@ -6,6 +6,8 @@
 
 struct lima_ip;
 
+int lima_l2_cache_resume(struct lima_ip *ip);
+void lima_l2_cache_suspend(struct lima_ip *ip);
 int lima_l2_cache_init(struct lima_ip *ip);
 void lima_l2_cache_fini(struct lima_ip *ip);
 
diff --git a/drivers/gpu/drm/lima/lima_mmu.c b/drivers/gpu/drm/lima/lima_mmu.c
index f79d2af427e7..c12521ee94ce 100644
--- a/drivers/gpu/drm/lima/lima_mmu.c
+++ b/drivers/gpu/drm/lima/lima_mmu.c
@@ -59,12 +59,43 @@ static irqreturn_t lima_mmu_irq_handler(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-int lima_mmu_init(struct lima_ip *ip)
+static int lima_mmu_hw_init(struct lima_ip *ip)
 {
 	struct lima_device *dev = ip->dev;
 	int err;
 	u32 v;
 
+	mmu_write(LIMA_MMU_COMMAND, LIMA_MMU_COMMAND_HARD_RESET);
+	err = lima_mmu_send_command(LIMA_MMU_COMMAND_HARD_RESET,
+				    LIMA_MMU_DTE_ADDR, v, v == 0);
+	if (err)
+		return err;
+
+	mmu_write(LIMA_MMU_INT_MASK, LIMA_MMU_INT_PAGE_FAULT | LIMA_MMU_INT_READ_BUS_ERROR);
+	mmu_write(LIMA_MMU_DTE_ADDR, dev->empty_vm->pd.dma);
+	return lima_mmu_send_command(LIMA_MMU_COMMAND_ENABLE_PAGING,
+				     LIMA_MMU_STATUS, v,
+				     v & LIMA_MMU_STATUS_PAGING_ENABLED);
+}
+
+int lima_mmu_resume(struct lima_ip *ip)
+{
+	if (ip->id == lima_ip_ppmmu_bcast)
+		return 0;
+
+	return lima_mmu_hw_init(ip);
+}
+
+void lima_mmu_suspend(struct lima_ip *ip)
+{
+
+}
+
+int lima_mmu_init(struct lima_ip *ip)
+{
+	struct lima_device *dev = ip->dev;
+	int err;
+
 	if (ip->id == lima_ip_ppmmu_bcast)
 		return 0;
 
@@ -74,12 +105,6 @@ int lima_mmu_init(struct lima_ip *ip)
 		return -EIO;
 	}
 
-	mmu_write(LIMA_MMU_COMMAND, LIMA_MMU_COMMAND_HARD_RESET);
-	err = lima_mmu_send_command(LIMA_MMU_COMMAND_HARD_RESET,
-				    LIMA_MMU_DTE_ADDR, v, v == 0);
-	if (err)
-		return err;
-
 	err = devm_request_irq(dev->dev, ip->irq, lima_mmu_irq_handler,
 			       IRQF_SHARED, lima_ip_name(ip), ip);
 	if (err) {
@@ -87,11 +112,7 @@ int lima_mmu_init(struct lima_ip *ip)
 		return err;
 	}
 
-	mmu_write(LIMA_MMU_INT_MASK, LIMA_MMU_INT_PAGE_FAULT | LIMA_MMU_INT_READ_BUS_ERROR);
-	mmu_write(LIMA_MMU_DTE_ADDR, dev->empty_vm->pd.dma);
-	return lima_mmu_send_command(LIMA_MMU_COMMAND_ENABLE_PAGING,
-				     LIMA_MMU_STATUS, v,
-				     v & LIMA_MMU_STATUS_PAGING_ENABLED);
+	return lima_mmu_hw_init(ip);
 }
 
 void lima_mmu_fini(struct lima_ip *ip)
diff --git a/drivers/gpu/drm/lima/lima_mmu.h b/drivers/gpu/drm/lima/lima_mmu.h
index 4f8ccbebcba1..f0c97ac75ea0 100644
--- a/drivers/gpu/drm/lima/lima_mmu.h
+++ b/drivers/gpu/drm/lima/lima_mmu.h
@@ -7,6 +7,8 @@
 struct lima_ip;
 struct lima_vm;
 
+int lima_mmu_resume(struct lima_ip *ip);
+void lima_mmu_suspend(struct lima_ip *ip);
 int lima_mmu_init(struct lima_ip *ip);
 void lima_mmu_fini(struct lima_ip *ip);
 
diff --git a/drivers/gpu/drm/lima/lima_pmu.c b/drivers/gpu/drm/lima/lima_pmu.c
index 7f26bf384e15..014b07c55b46 100644
--- a/drivers/gpu/drm/lima/lima_pmu.c
+++ b/drivers/gpu/drm/lima/lima_pmu.c
@@ -63,7 +63,7 @@ static u32 lima_pmu_get_ip_mask(struct lima_ip *ip)
 	return ret;
 }
 
-int lima_pmu_init(struct lima_ip *ip)
+static int lima_pmu_hw_init(struct lima_ip *ip)
 {
 	int err;
 	u32 stat;
@@ -88,7 +88,7 @@ int lima_pmu_init(struct lima_ip *ip)
 	return 0;
 }
 
-void lima_pmu_fini(struct lima_ip *ip)
+static void lima_pmu_hw_fini(struct lima_ip *ip)
 {
 	u32 stat;
 
@@ -101,3 +101,24 @@ void lima_pmu_fini(struct lima_ip *ip)
 		lima_pmu_wait_cmd(ip);
 	}
 }
+
+int lima_pmu_resume(struct lima_ip *ip)
+{
+	return lima_pmu_hw_init(ip);
+}
+
+void lima_pmu_suspend(struct lima_ip *ip)
+{
+	lima_pmu_hw_fini(ip);
+}
+
+
+int lima_pmu_init(struct lima_ip *ip)
+{
+	return lima_pmu_hw_init(ip);
+}
+
+void lima_pmu_fini(struct lima_ip *ip)
+{
+	lima_pmu_hw_fini(ip);
+}
diff --git a/drivers/gpu/drm/lima/lima_pmu.h b/drivers/gpu/drm/lima/lima_pmu.h
index a2a18775eb07..652dc7af3047 100644
--- a/drivers/gpu/drm/lima/lima_pmu.h
+++ b/drivers/gpu/drm/lima/lima_pmu.h
@@ -6,6 +6,8 @@
 
 struct lima_ip;
 
+int lima_pmu_resume(struct lima_ip *ip);
+void lima_pmu_suspend(struct lima_ip *ip);
 int lima_pmu_init(struct lima_ip *ip);
 void lima_pmu_fini(struct lima_ip *ip);
 
diff --git a/drivers/gpu/drm/lima/lima_pp.c b/drivers/gpu/drm/lima/lima_pp.c
index 8fef224b93c8..33f01383409c 100644
--- a/drivers/gpu/drm/lima/lima_pp.c
+++ b/drivers/gpu/drm/lima/lima_pp.c
@@ -223,6 +223,23 @@ static void lima_pp_print_version(struct lima_ip *ip)
 		 lima_ip_name(ip), name, major, minor);
 }
 
+static int lima_pp_hw_init(struct lima_ip *ip)
+{
+	ip->data.async_reset = false;
+	lima_pp_soft_reset_async(ip);
+	return lima_pp_soft_reset_async_wait(ip);
+}
+
+int lima_pp_resume(struct lima_ip *ip)
+{
+	return lima_pp_hw_init(ip);
+}
+
+void lima_pp_suspend(struct lima_ip *ip)
+{
+
+}
+
 int lima_pp_init(struct lima_ip *ip)
 {
 	struct lima_device *dev = ip->dev;
@@ -230,9 +247,7 @@ int lima_pp_init(struct lima_ip *ip)
 
 	lima_pp_print_version(ip);
 
-	ip->data.async_reset = false;
-	lima_pp_soft_reset_async(ip);
-	err = lima_pp_soft_reset_async_wait(ip);
+	err = lima_pp_hw_init(ip);
 	if (err)
 		return err;
 
@@ -254,6 +269,16 @@ void lima_pp_fini(struct lima_ip *ip)
 
 }
 
+int lima_pp_bcast_resume(struct lima_ip *ip)
+{
+	return 0;
+}
+
+void lima_pp_bcast_suspend(struct lima_ip *ip)
+{
+
+}
+
 int lima_pp_bcast_init(struct lima_ip *ip)
 {
 	struct lima_device *dev = ip->dev;
diff --git a/drivers/gpu/drm/lima/lima_pp.h b/drivers/gpu/drm/lima/lima_pp.h
index bf60c77b2633..16ec96de15a9 100644
--- a/drivers/gpu/drm/lima/lima_pp.h
+++ b/drivers/gpu/drm/lima/lima_pp.h
@@ -7,9 +7,13 @@
 struct lima_ip;
 struct lima_device;
 
+int lima_pp_resume(struct lima_ip *ip);
+void lima_pp_suspend(struct lima_ip *ip);
 int lima_pp_init(struct lima_ip *ip);
 void lima_pp_fini(struct lima_ip *ip);
 
+int lima_pp_bcast_resume(struct lima_ip *ip);
+void lima_pp_bcast_suspend(struct lima_ip *ip);
 int lima_pp_bcast_init(struct lima_ip *ip);
 void lima_pp_bcast_fini(struct lima_ip *ip);
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
