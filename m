Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAE25B48D0
	for <lists+dri-devel@lfdr.de>; Sat, 10 Sep 2022 22:31:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 917C210E2C8;
	Sat, 10 Sep 2022 20:30:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0BF010E2C4
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Sep 2022 20:30:20 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id x1so4913080plv.5
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Sep 2022 13:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schmorgal.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=jogtAdMnpPezRIsNvQGsY0Gdfslq+qo4Nk0e5omZs+w=;
 b=cWxRNG8CWV22nxW3sr72itppsSG406fK2qQwlPV/HyXCAZr0tcbG7CUFN+FaEtq4G+
 6zsIidrlsFu6ptW3RqpjgU895tPzHp2AvpEGv/ePXBKlb9VnRdQXHWv+2b13LogQIrI2
 YD9j7rPVd4P5C2X1D3cMxIOCp3X6uG9e1nO2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=jogtAdMnpPezRIsNvQGsY0Gdfslq+qo4Nk0e5omZs+w=;
 b=Sz/EFh9VY/hyWPgO+bJx/GRPc68VVh8btFp5Xm3DCC6UWaAGj4x0ADjr4wN5doRl/v
 PBRaXz3SPo+ONFAam9h5ViOhLWKSm620N1DL+bGYaVBfIHpGvK04oJzbTtZ+FkJCxwWN
 5DtMJbOC0WxPG54OfPe4GNBEo5nLD+1j+GmUvG2zNoK2PeORjwvAh2qxwzpk5CJjIMM7
 oApIkDNGz6U8W1rmz4kf9FPVES6+vxbLnIQH8Rn5h2BSOBu6AFSpIS0dM2W4mow3vV0P
 M0ZO0rntsEF5bp9yzqr+wjVLAAsQu23xBsLI+sAhp7kRWPM+3Za8V4P2Pr/DaK2JAibB
 mW/Q==
X-Gm-Message-State: ACgBeo0Hj6kbqvyV/A6xSlXyekT4/LpUy64yE3qXA/XIku33CUz28zTd
 cwGiRYcGD/byy1w57d/N2D5wnw==
X-Google-Smtp-Source: AA6agR6d4BCxT+juPmQ3SDQGOjCZ7dJda7C94XUvWUsuJLGW0EFJEVZz5QK1IRRWlDQ5RnZvjInKog==
X-Received: by 2002:a17:90b:4f81:b0:1fe:591a:3c04 with SMTP id
 qe1-20020a17090b4f8100b001fe591a3c04mr16657173pjb.66.1662841820483; 
 Sat, 10 Sep 2022 13:30:20 -0700 (PDT)
Received: from localhost.localdomain ([50.45.132.124])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a655382000000b00412a708f38asm2641313pgq.35.2022.09.10.13.30.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Sep 2022 13:30:20 -0700 (PDT)
From: Doug Brown <doug@schmorgal.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 2/2] drm/etnaviv: fix power register offset on GC300
Date: Sat, 10 Sep 2022 13:29:39 -0700
Message-Id: <20220910202939.31010-3-doug@schmorgal.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220910202939.31010-1-doug@schmorgal.com>
References: <20220910202939.31010-1-doug@schmorgal.com>
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
Cc: Doug Brown <doug@schmorgal.com>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Older GC300 revisions have their power registers at an offset of 0x200
rather than 0x100. Add new gpu_read_power and gpu_write_power functions
to encapsulate accesses to the power addresses and fix the addresses.

Signed-off-by: Doug Brown <doug@schmorgal.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_dump.c |  7 ++++++-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c  | 20 ++++++++++----------
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h  | 21 +++++++++++++++++++++
 3 files changed, 37 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_dump.c b/drivers/gpu/drm/etnaviv/etnaviv_dump.c
index f418e0b75772..44b5f3c35aab 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_dump.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_dump.c
@@ -83,10 +83,15 @@ static void etnaviv_core_dump_registers(struct core_dump_iterator *iter,
 {
 	struct etnaviv_dump_registers *reg = iter->data;
 	unsigned int i;
+	u32 read_addr;
 
 	for (i = 0; i < ARRAY_SIZE(etnaviv_dump_registers); i++, reg++) {
+		read_addr = etnaviv_dump_registers[i];
+		if (read_addr >= VIVS_PM_POWER_CONTROLS &&
+		    read_addr <= VIVS_PM_PULSE_EATER)
+			read_addr = gpu_fix_power_address(gpu, read_addr);
 		reg->reg = cpu_to_le32(etnaviv_dump_registers[i]);
-		reg->value = cpu_to_le32(gpu_read(gpu, etnaviv_dump_registers[i]));
+		reg->value = cpu_to_le32(gpu_read(gpu, read_addr));
 	}
 
 	etnaviv_core_dump_header(iter, ETDUMP_BUF_REG, reg);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index f667e7906d1f..f6d08f556cf4 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -590,7 +590,7 @@ static void etnaviv_gpu_enable_mlcg(struct etnaviv_gpu *gpu)
 	u32 pmc, ppc;
 
 	/* enable clock gating */
-	ppc = gpu_read(gpu, VIVS_PM_POWER_CONTROLS);
+	ppc = gpu_read_power(gpu, VIVS_PM_POWER_CONTROLS);
 	ppc |= VIVS_PM_POWER_CONTROLS_ENABLE_MODULE_CLOCK_GATING;
 
 	/* Disable stall module clock gating for 4.3.0.1 and 4.3.0.2 revs */
@@ -598,9 +598,9 @@ static void etnaviv_gpu_enable_mlcg(struct etnaviv_gpu *gpu)
 	    gpu->identity.revision == 0x4302)
 		ppc |= VIVS_PM_POWER_CONTROLS_DISABLE_STALL_MODULE_CLOCK_GATING;
 
-	gpu_write(gpu, VIVS_PM_POWER_CONTROLS, ppc);
+	gpu_write_power(gpu, VIVS_PM_POWER_CONTROLS, ppc);
 
-	pmc = gpu_read(gpu, VIVS_PM_MODULE_CONTROLS);
+	pmc = gpu_read_power(gpu, VIVS_PM_MODULE_CONTROLS);
 
 	/* Disable PA clock gating for GC400+ without bugfix except for GC420 */
 	if (gpu->identity.model >= chipModel_GC400 &&
@@ -635,7 +635,7 @@ static void etnaviv_gpu_enable_mlcg(struct etnaviv_gpu *gpu)
 	pmc |= VIVS_PM_MODULE_CONTROLS_DISABLE_MODULE_CLOCK_GATING_RA_HZ;
 	pmc |= VIVS_PM_MODULE_CONTROLS_DISABLE_MODULE_CLOCK_GATING_RA_EZ;
 
-	gpu_write(gpu, VIVS_PM_MODULE_CONTROLS, pmc);
+	gpu_write_power(gpu, VIVS_PM_MODULE_CONTROLS, pmc);
 }
 
 void etnaviv_gpu_start_fe(struct etnaviv_gpu *gpu, u32 address, u16 prefetch)
@@ -695,11 +695,11 @@ static void etnaviv_gpu_setup_pulse_eater(struct etnaviv_gpu *gpu)
 	    (gpu->identity.features & chipFeatures_PIPE_3D))
 	{
 		/* Performance fix: disable internal DFS */
-		pulse_eater = gpu_read(gpu, VIVS_PM_PULSE_EATER);
+		pulse_eater = gpu_read_power(gpu, VIVS_PM_PULSE_EATER);
 		pulse_eater |= BIT(18);
 	}
 
-	gpu_write(gpu, VIVS_PM_PULSE_EATER, pulse_eater);
+	gpu_write_power(gpu, VIVS_PM_PULSE_EATER, pulse_eater);
 }
 
 static void etnaviv_gpu_hw_init(struct etnaviv_gpu *gpu)
@@ -1301,9 +1301,9 @@ static void sync_point_perfmon_sample_pre(struct etnaviv_gpu *gpu,
 	u32 val;
 
 	/* disable clock gating */
-	val = gpu_read(gpu, VIVS_PM_POWER_CONTROLS);
+	val = gpu_read_power(gpu, VIVS_PM_POWER_CONTROLS);
 	val &= ~VIVS_PM_POWER_CONTROLS_ENABLE_MODULE_CLOCK_GATING;
-	gpu_write(gpu, VIVS_PM_POWER_CONTROLS, val);
+	gpu_write_power(gpu, VIVS_PM_POWER_CONTROLS, val);
 
 	/* enable debug register */
 	val = gpu_read(gpu, VIVS_HI_CLOCK_CONTROL);
@@ -1334,9 +1334,9 @@ static void sync_point_perfmon_sample_post(struct etnaviv_gpu *gpu,
 	gpu_write(gpu, VIVS_HI_CLOCK_CONTROL, val);
 
 	/* enable clock gating */
-	val = gpu_read(gpu, VIVS_PM_POWER_CONTROLS);
+	val = gpu_read_power(gpu, VIVS_PM_POWER_CONTROLS);
 	val |= VIVS_PM_POWER_CONTROLS_ENABLE_MODULE_CLOCK_GATING;
-	gpu_write(gpu, VIVS_PM_POWER_CONTROLS, val);
+	gpu_write_power(gpu, VIVS_PM_POWER_CONTROLS, val);
 }
 
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
index 85eddd492774..39f1e83d3cc7 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
@@ -10,6 +10,7 @@
 #include "etnaviv_gem.h"
 #include "etnaviv_mmu.h"
 #include "etnaviv_drv.h"
+#include "common.xml.h"
 
 struct etnaviv_gem_submit;
 struct etnaviv_vram_mapping;
@@ -159,6 +160,26 @@ static inline u32 gpu_read(struct etnaviv_gpu *gpu, u32 reg)
 	return readl(gpu->mmio + reg);
 }
 
+static inline u32 gpu_fix_power_address(struct etnaviv_gpu *gpu, u32 reg)
+{
+	/* Power registers in GC300 < 2.0 are offset by 0x100 */
+	if (gpu->identity.model == chipModel_GC300 &&
+	    gpu->identity.revision < 0x2000)
+		reg += 0x100;
+
+	return reg;
+}
+
+static inline void gpu_write_power(struct etnaviv_gpu *gpu, u32 reg, u32 data)
+{
+	writel(data, gpu->mmio + gpu_fix_power_address(gpu, reg));
+}
+
+static inline u32 gpu_read_power(struct etnaviv_gpu *gpu, u32 reg)
+{
+	return readl(gpu->mmio + gpu_fix_power_address(gpu, reg));
+}
+
 int etnaviv_gpu_get_param(struct etnaviv_gpu *gpu, u32 param, u64 *value);
 
 int etnaviv_gpu_init(struct etnaviv_gpu *gpu);
-- 
2.25.1

