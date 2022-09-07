Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8ECD5AFA32
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 04:49:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BF2E10E091;
	Wed,  7 Sep 2022 02:48:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D309A10E086
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 02:48:40 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id j12so803579pfi.11
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 19:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schmorgal.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=g/sgGJfevyyAQoqGwhzkZ/cC8g6d3FX7tOcGjYi4nUM=;
 b=kR8D/IHArYbi9BlwwF4KguJClJ7IqNUDmPCZGgtQKner5Wo4YKpwWuL8uBTRkTERu/
 VxBFqwUtj+fZj85DP9i8PIoIthd/CIKQiH4WFfq8H/5waw3/H0mKNZa22t5EN55Qhefh
 J+CrxdlMqcE5pcgsQug0jx4U7w81gHD4hNR60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=g/sgGJfevyyAQoqGwhzkZ/cC8g6d3FX7tOcGjYi4nUM=;
 b=cCEJtuQatwL4Z5z5/ZBtAcDWKcmq3qm2cOaRgtiFJ2tnTEVTdeUyMxcwfgLtSgbKxK
 ezxzVT+0u4MtBkp9v70QWUC9JHviDJKdAsPIBFW8bv62VwnxxnnErXi8kqKocMUlgYdR
 iGTlJjGjVKyT0PBMFNTyQ6P0egqlKB+/Jl6i2gQe3W74NoFbxlCuj+Hfb7uaXIJ4aIb7
 2yq8BCveH1ufyLFUSArgpaJ78FbOzq08Un8D7XsK6bVXUD2TJoEkBSqTU/vErdIbHPHP
 V/xH4LNZwp8DE9iJf0eBLIJRh5+B3Qplr96iUzICisvxzt9CBbF2i7hJVway8U22yvuT
 D84Q==
X-Gm-Message-State: ACgBeo3+7d1+T2n0lkpoPTnN3HwUluQU0wXDmBnzULYT/P7jgzXuyUxN
 uuajp8iPWAYdayiYq8hKKGYaEQ==
X-Google-Smtp-Source: AA6agR6zPz3gmKVyr/CY+VQejujRlvUZT0XIAPGG1Qg5Ic9IOPkhO6h1yA+TIV8+dQlhvg1G6PiFqw==
X-Received: by 2002:a63:1456:0:b0:42b:d31b:3e2f with SMTP id
 22-20020a631456000000b0042bd31b3e2fmr1481869pgu.353.1662518919869; 
 Tue, 06 Sep 2022 19:48:39 -0700 (PDT)
Received: from localhost.localdomain ([50.45.132.243])
 by smtp.gmail.com with ESMTPSA id
 h16-20020a170902f55000b001754064ac31sm10733963plf.280.2022.09.06.19.48.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 19:48:39 -0700 (PDT)
From: Doug Brown <doug@schmorgal.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 2/2] drm/etnaviv: fix power register offset on GC300
Date: Tue,  6 Sep 2022 19:47:19 -0700
Message-Id: <20220907024719.36478-3-doug@schmorgal.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220907024719.36478-1-doug@schmorgal.com>
References: <20220907024719.36478-1-doug@schmorgal.com>
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
 drivers/gpu/drm/etnaviv/etnaviv_dump.c |  9 +++++++--
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c  | 20 ++++++++++----------
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h  | 21 +++++++++++++++++++++
 3 files changed, 38 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_dump.c b/drivers/gpu/drm/etnaviv/etnaviv_dump.c
index f418e0b75772..df07a3c8f16a 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_dump.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_dump.c
@@ -83,10 +83,15 @@ static void etnaviv_core_dump_registers(struct core_dump_iterator *iter,
 {
 	struct etnaviv_dump_registers *reg = iter->data;
 	unsigned int i;
+	u32 addr;
 
 	for (i = 0; i < ARRAY_SIZE(etnaviv_dump_registers); i++, reg++) {
-		reg->reg = cpu_to_le32(etnaviv_dump_registers[i]);
-		reg->value = cpu_to_le32(gpu_read(gpu, etnaviv_dump_registers[i]));
+		addr = etnaviv_dump_registers[i];
+		if (addr >= VIVS_PM_POWER_CONTROLS &&
+		    addr <= VIVS_PM_PULSE_EATER)
+			addr = gpu_fix_power_address(gpu, addr);
+		reg->reg = cpu_to_le32(addr);
+		reg->value = cpu_to_le32(gpu_read(gpu, addr));
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
index 85eddd492774..d4d139e88942 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
@@ -10,6 +10,8 @@
 #include "etnaviv_gem.h"
 #include "etnaviv_mmu.h"
 #include "etnaviv_drv.h"
+#include "common.xml.h"
+#include "state_hi.xml.h"
 
 struct etnaviv_gem_submit;
 struct etnaviv_vram_mapping;
@@ -159,6 +161,25 @@ static inline u32 gpu_read(struct etnaviv_gpu *gpu, u32 reg)
 	return readl(gpu->mmio + reg);
 }
 
+static inline u32 gpu_fix_power_address(struct etnaviv_gpu *gpu, u32 reg)
+{
+	/* Power registers in GC300 < 2.0 are offset by 0x100 */
+	if (gpu->identity.model == chipModel_GC300 &&
+	    gpu->identity.revision < 0x2000)
+		reg += 0x100;
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

