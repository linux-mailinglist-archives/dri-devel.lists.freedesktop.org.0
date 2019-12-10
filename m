Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E96C0118281
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 09:40:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3206E83B;
	Tue, 10 Dec 2019 08:40:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D29AA6E82A
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 08:37:12 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id x7so8532840pgl.11
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 00:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=3BIOtXf96D82rH/XdBcR66ztcw77fqjbNRXCkAXyd+8=;
 b=UPMuobp0VBusqPZPijEpzkZlRBWHmZm57TlrJJVDeda0t4P/NpWeeCTrtJGmrcvh8K
 zfhwoa0b2oxkL5JD81t1zyTiv/CaKJumhOT+P9byQL4ZfGsiucAIT2eoIcBUAob48kPh
 4wamPuA1q+e/plNhMDl3aIEAhuv+8uMK7baXwfrqjgXSli0Yd1nXMu1c1cw8EF2vdCus
 2RPmgxv6kIi1b2DaxRvCW+OP45WLoyptXcC1wyjMFge8Agv7/Mb2YnkO3HVVKqQ3iG/t
 7b44j6E5aPIDTlXiGPDubQ9vFi0DqseqSJKgbPkiOVnD+H6doiscEZ/yyBN65WGYlb7W
 ARFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=3BIOtXf96D82rH/XdBcR66ztcw77fqjbNRXCkAXyd+8=;
 b=nOpaseCjeHlDtby1H9bWquhHvN9rx0puwWHoSplr1BtudXenoIuzBl22iSoM4aVSr4
 B4dLdGhXn5ZZTgBgfsSidTl4EQ7B8WWY41GdATZ5Ym0ker0RsG7mcM0MWk973DIVu37n
 fACJbpmHVzxTny+0VLDss6AGkuJWrEVcGcQLRNtpgig2RrwDKwVz5E3v5cGC9gpuLloS
 KAlDdPxqMx33jX4Gk+BcktUl7Vva7kZbsC6JOQS0/zJVTwYj+eU1npTYoa83/hVHmolP
 EUiNoGdYUi2KlIf98T2Q77c/jMlSNVIlxV82+VOFi/60kcV3jHMWOKHfwafNji1KPe0H
 n4yg==
X-Gm-Message-State: APjAAAUZpcz6WlTTG+fPPW7PMkiXBRlLW6C0Zl8uEumNJFvQZu9uYZ3b
 BLnKC4tVV7KOuGEhElbK6ss=
X-Google-Smtp-Source: APXvYqyUcEc8Ts+FTAzvYbzjYJfLgPqxRtO8GETx/cc+/G4uNlM5Ce+xXpBjmWvHTIm/xUynhPnRLQ==
X-Received: by 2002:a63:f455:: with SMTP id p21mr23085619pgk.436.1575967031075; 
 Tue, 10 Dec 2019 00:37:11 -0800 (PST)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id y128sm2246632pfg.17.2019.12.10.00.37.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 10 Dec 2019 00:37:10 -0800 (PST)
From: Kevin Tang <kevin3.tang@gmail.com>
To: airlied@linux.ie,
	daniel@ffwll.ch,
	kevin3.tang@gmail.com
Subject: [PATCH RFC 6/8] drm/sprd: add Unisoc's drm mipi dsi&dphy driver
Date: Tue, 10 Dec 2019 16:36:33 +0800
Message-Id: <1575966995-13757-7-git-send-email-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575966995-13757-1-git-send-email-kevin3.tang@gmail.com>
References: <1575966995-13757-1-git-send-email-kevin3.tang@gmail.com>
X-Mailman-Approved-At: Tue, 10 Dec 2019 08:40:04 +0000
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
Cc: orsonzhai@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, zhang.lyra@gmail.com, baolin.wang@linaro.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kevin Tang <kevin.tang@unisoc.com>

Adds dsi host controller support for the Unisoc's display subsystem.
Adds dsi phy support for the Unisoc's display subsystem.
Only MIPI DSI Displays supported, DP/TV/HMDI will be support
in the feature.

Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Baolin Wang <baolin.wang@linaro.org>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
---
 drivers/gpu/drm/sprd/Makefile                     |    8 +-
 drivers/gpu/drm/sprd/dphy/Makefile                |    7 +
 drivers/gpu/drm/sprd/dphy/pll/Makefile            |    3 +
 drivers/gpu/drm/sprd/dphy/pll/megacores_sharkle.c |  640 ++++++++++
 drivers/gpu/drm/sprd/dphy/sprd_dphy_api.c         |  254 ++++
 drivers/gpu/drm/sprd/dphy/sprd_dphy_hal.h         |  329 +++++
 drivers/gpu/drm/sprd/dsi/Makefile                 |    7 +
 drivers/gpu/drm/sprd/dsi/core/Makefile            |    3 +
 drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c     | 1186 +++++++++++++++++
 drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.h     | 1417 +++++++++++++++++++++
 drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c |  392 ++++++
 drivers/gpu/drm/sprd/dsi/sprd_dsi_api.c           |  544 ++++++++
 drivers/gpu/drm/sprd/dsi/sprd_dsi_api.h           |   28 +
 drivers/gpu/drm/sprd/dsi/sprd_dsi_hal.h           | 1102 ++++++++++++++++
 drivers/gpu/drm/sprd/sprd_dphy.c                  |  235 ++++
 drivers/gpu/drm/sprd/sprd_dphy.h                  |  121 ++
 drivers/gpu/drm/sprd/sprd_dsi.c                   |  722 +++++++++++
 drivers/gpu/drm/sprd/sprd_dsi.h                   |  210 +++
 18 files changed, 7206 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/sprd/dphy/Makefile
 create mode 100644 drivers/gpu/drm/sprd/dphy/pll/Makefile
 create mode 100644 drivers/gpu/drm/sprd/dphy/pll/megacores_sharkle.c
 create mode 100644 drivers/gpu/drm/sprd/dphy/sprd_dphy_api.c
 create mode 100644 drivers/gpu/drm/sprd/dphy/sprd_dphy_hal.h
 create mode 100644 drivers/gpu/drm/sprd/dsi/Makefile
 create mode 100644 drivers/gpu/drm/sprd/dsi/core/Makefile
 create mode 100644 drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c
 create mode 100644 drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.h
 create mode 100644 drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c
 create mode 100644 drivers/gpu/drm/sprd/dsi/sprd_dsi_api.c
 create mode 100644 drivers/gpu/drm/sprd/dsi/sprd_dsi_api.h
 create mode 100644 drivers/gpu/drm/sprd/dsi/sprd_dsi_hal.h
 create mode 100644 drivers/gpu/drm/sprd/sprd_dphy.c
 create mode 100644 drivers/gpu/drm/sprd/sprd_dphy.h
 create mode 100644 drivers/gpu/drm/sprd/sprd_dsi.c
 create mode 100644 drivers/gpu/drm/sprd/sprd_dsi.h

diff --git a/drivers/gpu/drm/sprd/Makefile b/drivers/gpu/drm/sprd/Makefile
index 3f188ab..78d3ddb 100644
--- a/drivers/gpu/drm/sprd/Makefile
+++ b/drivers/gpu/drm/sprd/Makefile
@@ -6,7 +6,11 @@ subdir-ccflags-y += -I$(src)
 
 obj-y := sprd_drm.o \
 	sprd_gem.o \
-	sprd_dpu.o
+	sprd_dpu.o \
+	sprd_dsi.o \
+	sprd_dphy.o
 
 obj-y += disp_lib.o
-obj-y += dpu/
\ No newline at end of file
+obj-y += dpu/
+obj-y += dsi/
+obj-y += dphy/
diff --git a/drivers/gpu/drm/sprd/dphy/Makefile b/drivers/gpu/drm/sprd/dphy/Makefile
new file mode 100644
index 0000000..8a1012d6
--- /dev/null
+++ b/drivers/gpu/drm/sprd/dphy/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0
+
+subdir-ccflags-y += -I$(src)
+
+obj-y := sprd_dphy_api.o
+
+obj-y += pll/
diff --git a/drivers/gpu/drm/sprd/dphy/pll/Makefile b/drivers/gpu/drm/sprd/dphy/pll/Makefile
new file mode 100644
index 0000000..1fe9638
--- /dev/null
+++ b/drivers/gpu/drm/sprd/dphy/pll/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-y += megacores_sharkle.o
\ No newline at end of file
diff --git a/drivers/gpu/drm/sprd/dphy/pll/megacores_sharkle.c b/drivers/gpu/drm/sprd/dphy/pll/megacores_sharkle.c
new file mode 100644
index 0000000..d365dec
--- /dev/null
+++ b/drivers/gpu/drm/sprd/dphy/pll/megacores_sharkle.c
@@ -0,0 +1,640 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 Unisoc Inc.
+ */
+
+#include <asm/div64.h>
+#include <linux/delay.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/regmap.h>
+#include <linux/string.h>
+
+#include "sprd_dphy.h"
+
+#define L						0
+#define H						1
+#define CLK						0
+#define DATA					1
+#define INFINITY				0xffffffff
+#define MIN_OUTPUT_FREQ			(100)
+
+#define AVERAGE(a, b) (min(a, b) + abs((b) - (a)) / 2)
+
+enum TIMING {
+	NONE,
+	REQUEST_TIME,
+	PREPARE_TIME,
+	SETTLE_TIME,
+	ZERO_TIME,
+	TRAIL_TIME,
+	EXIT_TIME,
+	CLKPOST_TIME,
+	TA_GET,
+	TA_GO,
+	TA_SURE,
+	TA_WAIT,
+};
+
+struct pll_regs {
+	union __reg_03__ {
+		struct __03 {
+			u8 prbs_bist: 1;
+			u8 en_lp_treot: 1;
+			u8 lpf_sel: 4;
+			u8 txfifo_bypass: 1;
+			u8 freq_hopping: 1;
+		} bits;
+		u8 val;
+	} _03;
+	union __reg_04__ {
+		struct __04 {
+			u8 div: 3;
+			u8 masterof8lane: 1;
+			u8 hop_trig: 1;
+			u8 cp_s: 2;
+			u8 fdk_s: 1;
+		} bits;
+		u8 val;
+	} _04;
+	union __reg_06__ {
+		struct __06 {
+			u8 nint: 7;
+			u8 mod_en: 1;
+		} bits;
+		u8 val;
+	} _06;
+	union __reg_07__ {
+		struct __07 {
+			u8 kdelta_h: 8;
+		} bits;
+		u8 val;
+	} _07;
+	union __reg_08__ {
+		struct __08 {
+			u8 vco_band: 1;
+			u8 sdm_en: 1;
+			u8 refin: 2;
+			u8 kdelta_l: 4;
+		} bits;
+		u8 val;
+	} _08;
+	union __reg_09__ {
+		struct __09 {
+			u8 kint_h: 8;
+		} bits;
+		u8 val;
+	} _09;
+	union __reg_0a__ {
+		struct __0a {
+			u8 kint_m: 8;
+		} bits;
+		u8 val;
+	} _0a;
+	union __reg_0b__ {
+		struct __0b {
+			u8 out_sel: 4;
+			u8 kint_l: 4;
+		} bits;
+		u8 val;
+	} _0b;
+	union __reg_0c__ {
+		struct __0c {
+			u8 kstep_h: 8;
+		} bits;
+		u8 val;
+	} _0c;
+	union __reg_0d__ {
+		struct __0d {
+			u8 kstep_m: 8;
+		} bits;
+		u8 val;
+	} _0d;
+	union __reg_0e__ {
+		struct __0e {
+			u8 pll_pu_byp: 1;
+			u8 pll_pu: 1;
+			u8 hsbist_len: 2;
+			u8 stopstate_sel: 1;
+			u8 kstep_l: 3;
+		} bits;
+		u8 val;
+	} _0e;
+
+	union __reg_0f__ {
+		struct __0f {
+			u8 det_delay:2;
+		/*12 - 15 -> bit2 - bit5*/
+			u8 kdelta: 4;
+			u8 ldo0p4:2;
+		} bits;
+		u8 val;
+	} _0f;
+
+};
+
+struct dphy_pll {
+	u8 refin; /* Pre-divider control signal */
+	u8 cp_s; /* 00: SDM_EN=1, 10: SDM_EN=0 */
+	u8 fdk_s; /* PLL mode control: integer or fraction */
+	u8 hop_en;
+	u8 mod_en; /* ssc enable */
+	u8 sdm_en;
+	u8 div;
+	u8 int_n; /* integer N PLL */
+	u32 ref_clk; /* dphy reference clock, unit: MHz */
+	u32 freq; /* panel config, unit: KHz */
+	int hop_delta;
+	u32 hop_period;
+	u32 fvco; /* MHz */
+	u32 potential_fvco; /* MHz */
+	u32 nint; /* sigma delta modulator NINT control */
+	u32 kint; /* sigma delta modulator KINT control */
+	u32 sign;
+	u32 kdelta;
+	u32 kstep;
+	u8 lpf_sel; /* low pass filter control */
+	u8 out_sel; /* post divider control */
+	u8 vco_band; /* vco range */
+	u8 det_delay;
+};
+
+static struct pll_regs regs;
+static struct dphy_pll pll;
+
+/* sharkle */
+#define VCO_BAND_LOW	750
+#define VCO_BAND_MID	1100
+#define VCO_BAND_HIGH	1500
+#define PHY_REF_CLK	26000
+
+static int dphy_calc_pll_param(struct dphy_pll *pll)
+{
+	int i;
+	const u32 khz = 1000;
+	const u32 mhz = 1000000;
+	const unsigned long long factor = 100;
+	unsigned long long tmp;
+	u8 delta;
+
+	if (!pll || !pll->freq)
+		goto FAIL;
+
+	pll->potential_fvco = pll->freq / khz; /* MHz */
+	pll->ref_clk = PHY_REF_CLK / khz; /* MHz */
+
+	for (i = 0; i < 4; ++i) {
+		if (pll->potential_fvco >= VCO_BAND_LOW &&
+			pll->potential_fvco <= VCO_BAND_HIGH) {
+			pll->fvco = pll->potential_fvco;
+			pll->out_sel = BIT(i);
+			break;
+		}
+		pll->potential_fvco <<= 1;
+	}
+	if (pll->fvco == 0)
+		goto FAIL;
+
+	if (pll->fvco >= VCO_BAND_LOW && pll->fvco <= VCO_BAND_MID) {
+		/* vco band control */
+		pll->vco_band = 0x0;
+		/* low pass filter control */
+		pll->lpf_sel = 1;
+	} else if (pll->fvco > VCO_BAND_MID && pll->fvco <= VCO_BAND_HIGH) {
+		pll->vco_band = 0x1;
+		pll->lpf_sel = 0;
+	} else
+		goto FAIL;
+
+	pll->nint = pll->fvco / pll->ref_clk;
+	tmp = pll->fvco * factor * mhz;
+	do_div(tmp, pll->ref_clk);
+	tmp = tmp - pll->nint * factor * mhz;
+	tmp *= BIT(20);
+	do_div(tmp, 100000000);
+	pll->kint = (u32)tmp;
+	pll->refin = 3; /* pre-divider bypass */
+	pll->sdm_en = true; /* use fraction N PLL */
+	pll->fdk_s = 0x1; /* fraction */
+	pll->cp_s = 0x0;
+	pll->det_delay = 0x1;
+
+	if (pll->hop_en) {
+		if ((pll->hop_delta == 0) || (pll->hop_period == 0))
+			return 0;
+
+		if (pll->hop_delta < 0) {
+			delta = -pll->hop_delta;
+			pll->sign = true;
+		} else {
+			delta = pll->hop_delta;
+			pll->sign = false;
+		}
+		delta = delta * (i + 1);
+		pll->kstep = pll->ref_clk * pll->hop_period;
+		pll->kdelta = (1 << 20) * delta / pll->ref_clk /
+				pll->kstep + pll->sign * (1 << 11);
+	}
+
+	if (pll->mod_en) {
+		delta = pll->freq / khz * 2 * (i + 1) * 15 / 1000;
+		pll->kstep = pll->ref_clk * pll->hop_period;
+		pll->kdelta = (((1 << 20) * delta / pll->ref_clk /
+				pll->kstep));
+	}
+
+	return 0;
+
+FAIL:
+	if (pll)
+		pll->fvco = 0;
+
+	pr_err("failed to calculate dphy pll parameters\n");
+
+	return -1;
+}
+
+static int dphy_set_pll_reg(struct regmap *regmap, struct dphy_pll *pll)
+{
+	int i;
+	u8 *val;
+
+	u8 regs_addr[] = {
+		0x03, 0x04, 0x06, 0x07, 0x08, 0x09,
+		0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f
+	};
+
+	if (!pll || !pll->fvco)
+		goto FAIL;
+
+	regs._03.bits.prbs_bist = 1;
+	regs._03.bits.en_lp_treot = true;
+	regs._03.bits.lpf_sel = pll->lpf_sel;
+	regs._03.bits.txfifo_bypass = 0;
+	regs._03.bits.freq_hopping = pll->hop_en;
+	regs._04.bits.div = pll->div;
+	regs._04.bits.masterof8lane = 1;
+	regs._04.bits.cp_s = pll->cp_s;
+	regs._04.bits.fdk_s = pll->fdk_s;
+	regs._06.bits.nint = pll->nint;
+	regs._06.bits.mod_en = pll->mod_en;
+	regs._07.bits.kdelta_h = pll->kdelta >> 4;
+	regs._07.bits.kdelta_h |= pll->sign << 7;
+	regs._08.bits.vco_band = pll->vco_band;
+	regs._08.bits.sdm_en = pll->sdm_en;
+	regs._08.bits.refin = pll->refin;
+	regs._08.bits.kdelta_l = pll->kdelta & 0xf;
+	regs._09.bits.kint_h = pll->kint >> 12;
+	regs._0a.bits.kint_m = (pll->kint >> 4) & 0xff;
+	regs._0b.bits.out_sel = pll->out_sel;
+	regs._0b.bits.kint_l = pll->kint & 0xf;
+	regs._0c.bits.kstep_h = pll->kstep >> 11;
+	regs._0d.bits.kstep_m = (pll->kstep >> 3) & 0xff;
+	regs._0e.bits.pll_pu_byp = 0;
+	regs._0e.bits.pll_pu = 0;
+	regs._0e.bits.stopstate_sel = 1;
+	regs._0e.bits.kstep_l = pll->kstep & 0x7;
+	regs._0f.bits.det_delay = pll->det_delay;
+	regs._0f.bits.kdelta =  pll->kdelta >> 12;
+
+	val = (u8 *)&regs;
+
+	for (i = 0; i < sizeof(regs_addr); ++i) {
+		regmap_write(regmap, regs_addr[i], val[i]);
+		pr_debug("%02x: %02x\n", regs_addr[i], val[i]);
+	}
+
+	return 0;
+
+FAIL:
+	pr_err("failed to set dphy pll registers\n");
+
+	return -1;
+}
+
+static int dphy_pll_config(struct dphy_context *ctx)
+{
+	int ret;
+	struct regmap *regmap = ctx->regmap;
+
+	pll.freq = ctx->freq;
+
+	/* FREQ = 26M * (NINT + KINT / 2^20) / out_sel */
+	ret = dphy_calc_pll_param(&pll);
+	if (ret)
+		goto FAIL;
+	ret = dphy_set_pll_reg(regmap, &pll);
+	if (ret)
+		goto FAIL;
+
+	return 0;
+
+FAIL:
+	pr_err("failed to config dphy pll\n");
+
+	return -1;
+}
+
+static int dphy_set_timing_regs(struct regmap *regmap, int type, u8 val[])
+{
+	switch (type) {
+	case REQUEST_TIME:
+		regmap_write(regmap, 0x31, val[CLK]);
+		regmap_write(regmap, 0x41, val[DATA]);
+		regmap_write(regmap, 0x51, val[DATA]);
+		regmap_write(regmap, 0x61, val[DATA]);
+		regmap_write(regmap, 0x71, val[DATA]);
+
+		regmap_write(regmap, 0x90, val[CLK]);
+		regmap_write(regmap, 0xa0, val[DATA]);
+		regmap_write(regmap, 0xb0, val[DATA]);
+		regmap_write(regmap, 0xc0, val[DATA]);
+		regmap_write(regmap, 0xd0, val[DATA]);
+		break;
+	case PREPARE_TIME:
+		regmap_write(regmap, 0x32, val[CLK]);
+		regmap_write(regmap, 0x42, val[DATA]);
+		regmap_write(regmap, 0x52, val[DATA]);
+		regmap_write(regmap, 0x62, val[DATA]);
+		regmap_write(regmap, 0x72, val[DATA]);
+
+		regmap_write(regmap, 0x91, val[CLK]);
+		regmap_write(regmap, 0xa1, val[DATA]);
+		regmap_write(regmap, 0xb1, val[DATA]);
+		regmap_write(regmap, 0xc1, val[DATA]);
+		regmap_write(regmap, 0xd1, val[DATA]);
+		break;
+	case ZERO_TIME:
+		regmap_write(regmap, 0x33, val[CLK]);
+		regmap_write(regmap, 0x43, val[DATA]);
+		regmap_write(regmap, 0x53, val[DATA]);
+		regmap_write(regmap, 0x63, val[DATA]);
+		regmap_write(regmap, 0x73, val[DATA]);
+
+		regmap_write(regmap, 0x92, val[CLK]);
+		regmap_write(regmap, 0xa2, val[DATA]);
+		regmap_write(regmap, 0xb2, val[DATA]);
+		regmap_write(regmap, 0xc2, val[DATA]);
+		regmap_write(regmap, 0xd2, val[DATA]);
+		break;
+	case TRAIL_TIME:
+		regmap_write(regmap, 0x34, val[CLK]);
+		regmap_write(regmap, 0x44, val[DATA]);
+		regmap_write(regmap, 0x54, val[DATA]);
+		regmap_write(regmap, 0x64, val[DATA]);
+		regmap_write(regmap, 0x74, val[DATA]);
+
+		regmap_write(regmap, 0x93, val[CLK]);
+		regmap_write(regmap, 0xa3, val[DATA]);
+		regmap_write(regmap, 0xb3, val[DATA]);
+		regmap_write(regmap, 0xc3, val[DATA]);
+		regmap_write(regmap, 0xd3, val[DATA]);
+		break;
+	case EXIT_TIME:
+		regmap_write(regmap, 0x36, val[CLK]);
+		regmap_write(regmap, 0x46, val[DATA]);
+		regmap_write(regmap, 0x56, val[DATA]);
+		regmap_write(regmap, 0x66, val[DATA]);
+		regmap_write(regmap, 0x76, val[DATA]);
+
+		regmap_write(regmap, 0x95, val[CLK]);
+		regmap_write(regmap, 0xA5, val[DATA]);
+		regmap_write(regmap, 0xB5, val[DATA]);
+		regmap_write(regmap, 0xc5, val[DATA]);
+		regmap_write(regmap, 0xd5, val[DATA]);
+		break;
+	case CLKPOST_TIME:
+		regmap_write(regmap, 0x35, val[CLK]);
+		regmap_write(regmap, 0x94, val[CLK]);
+		break;
+
+	/* the following just use default value */
+	case SETTLE_TIME:
+	case TA_GET:
+	case TA_GO:
+	case TA_SURE:
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static int dphy_timing_config(struct dphy_context *ctx)
+{
+	u8 val[2];
+	u32 tmp = 0;
+	u32 range[2], constant;
+	u32 t_ui, t_byteck, t_half_byteck;
+	const u32 factor = 2;
+	const u32 scale = 100;
+	struct regmap *regmap = ctx->regmap;
+
+	/* t_ui: 1 ui, byteck: 8 ui, half byteck: 4 ui */
+	t_ui = 1000 * scale / (ctx->freq / 1000);
+	t_byteck = t_ui << 3;
+	t_half_byteck = t_ui << 2;
+	constant = t_ui << 1;
+
+	/* REQUEST_TIME: HS T-LPX: LP-01
+	 * For T-LPX, mipi spec defined min value is 50ns,
+	 * but maybe it shouldn't be too small, because BTA,
+	 * LP-10, LP-00, LP-01, all of this is related to T-LPX.
+	 */
+	range[L] = 50 * scale;
+	range[H] = INFINITY;
+	val[CLK] = DIV_ROUND_UP(range[L] * (factor << 1), t_byteck) - 2;
+	val[DATA] = val[CLK];
+	dphy_set_timing_regs(regmap, REQUEST_TIME, val);
+
+	/* PREPARE_TIME: HS sequence: LP-00 */
+	range[L] = 38 * scale;
+	range[H] = 95 * scale;
+	tmp = AVERAGE(range[L], range[H]);
+	val[CLK] = DIV_ROUND_UP(AVERAGE(range[L], range[H]),
+			t_half_byteck) - 1;
+	range[L] = 40 * scale + 4 * t_ui;
+	range[H] = 85 * scale + 6 * t_ui;
+	tmp |= AVERAGE(range[L], range[H]) << 16;
+	val[DATA] = DIV_ROUND_UP(AVERAGE(range[L], range[H]),
+			t_half_byteck) - 1;
+	dphy_set_timing_regs(regmap, PREPARE_TIME, val);
+
+	/* ZERO_TIME: HS-ZERO */
+	range[L] = 300 * scale;
+	range[H] = INFINITY;
+	val[CLK] = DIV_ROUND_UP(range[L] * factor + (tmp & 0xffff)
+			- 525 * t_byteck / 100, t_byteck) - 2;
+	range[L] = 145 * scale + 10 * t_ui;
+	val[DATA] = DIV_ROUND_UP(range[L] * factor
+			+ ((tmp >> 16) & 0xffff) - 525 * t_byteck / 100,
+			t_byteck) - 2;
+	dphy_set_timing_regs(regmap, ZERO_TIME, val);
+
+	/* TRAIL_TIME: HS-TRAIL */
+	range[L] = 60 * scale;
+	range[H] = INFINITY;
+	val[CLK] = DIV_ROUND_UP(range[L] * factor - constant, t_half_byteck);
+	range[L] = max(8 * t_ui, 60 * scale + 4 * t_ui);
+	val[DATA] = DIV_ROUND_UP(range[L] * 3 / 2 - constant, t_half_byteck) - 2;
+	dphy_set_timing_regs(regmap, TRAIL_TIME, val);
+
+	/* EXIT_TIME: */
+	range[L] = 100 * scale;
+	range[H] = INFINITY;
+	val[CLK] = DIV_ROUND_UP(range[L] * factor, t_byteck) - 2;
+	val[DATA] = val[CLK];
+	dphy_set_timing_regs(regmap, EXIT_TIME, val);
+
+	/* CLKPOST_TIME: */
+	range[L] = 60 * scale + 52 * t_ui;
+	range[H] = INFINITY;
+	val[CLK] = DIV_ROUND_UP(range[L] * factor, t_byteck) - 2;
+	val[DATA] = val[CLK];
+	dphy_set_timing_regs(regmap, CLKPOST_TIME, val);
+
+	/* SETTLE_TIME:
+	 * This time is used for receiver. So for transmitter,
+	 * it can be ignored.
+	 */
+
+	/* TA_GO:
+	 * transmitter drives bridge state(LP-00) before releasing control,
+	 * reg 0x1f default value: 0x04, which is good.
+	 */
+
+	/* TA_SURE:
+	 * After LP-10 state and before bridge state(LP-00),
+	 * reg 0x20 default value: 0x01, which is good.
+	 */
+
+	/* TA_GET:
+	 * receiver drives Bridge state(LP-00) before releasing control
+	 * reg 0x21 default value: 0x03, which is good.
+	 */
+
+	return 0;
+}
+
+static int dphy_hop_start(struct dphy_context *ctx)
+{
+	struct regmap *regmap = ctx->regmap;
+
+	/* start hopping */
+	regs._04.bits.hop_trig = !regs._04.bits.hop_trig;
+	regmap_write(regmap, 0x04, regs._04.val);
+
+	mdelay(1);
+
+	pr_info("start hopping\n");
+	return 0;
+}
+
+static int dphy_hop_stop(struct dphy_context *ctx)
+{
+	struct regmap *regmap = ctx->regmap;
+
+	regs._03.bits.freq_hopping = 0;
+	regmap_write(regmap, 0x03, regs._03.val);
+
+	pr_info("stop hopping\n");
+	return 0;
+}
+
+static int dphy_hop_config(struct dphy_context *ctx, int delta, int period)
+{
+	dphy_hop_stop(ctx);
+
+	if (delta == 0) {
+		pll.hop_en = false;
+		return 0;
+	}
+
+	pll.hop_en = true;
+	pll.mod_en = false;
+	pll.hop_delta = delta / 1000;	/* Mhz */
+	pll.hop_period = period;	/* us */
+
+	dphy_pll_config(ctx);
+	dphy_hop_start(ctx);
+
+	return 0;
+}
+
+static int dphy_ssc_start(struct dphy_context *ctx)
+{
+	pll.mod_en = true;
+	pll.hop_en = false;
+	pll.hop_period = 15;/* us */
+
+	dphy_pll_config(ctx);
+
+	mdelay(1);
+
+	return 0;
+}
+
+static int dphy_ssc_stop(struct dphy_context *ctx)
+{
+	struct regmap *regmap = ctx->regmap;
+
+	pll.mod_en = false;
+	regs._06.bits.mod_en = false;
+	regmap_write(regmap, 0x06, regs._06.val);
+
+	return 0;
+}
+
+static int dphy_ssc_en(struct dphy_context *ctx, bool en)
+{
+	if (en) {
+		pr_info("ssc enable\n");
+		dphy_ssc_start(ctx);
+	} else {
+		dphy_ssc_stop(ctx);
+		pr_info("ssc disable\n");
+	}
+
+	return 0;
+}
+
+/**
+ * Force D-PHY PLL to stay on while in ULPS
+ * @param phy: pointer to structure
+ *  which holds information about the d-phy module
+ * @param force (1) disable (0)
+ * @note To follow the programming model, use wakeup_pll function
+ */
+static void dphy_force_pll(struct dphy_context *ctx, int force)
+{
+	u8 data;
+	struct regmap *regmap = ctx->regmap;
+
+	if (force)
+		data = 0x03;
+	else
+		data = 0x0;
+
+	/* for megocores, to force pll, dphy register should be set */
+	regmap_write(regmap, 0x0e, data);
+}
+
+static struct dphy_pll_ops megacores_sharkle_ops = {
+	.pll_config = dphy_pll_config,
+	.timing_config = dphy_timing_config,
+	.hop_config = dphy_hop_config,
+	.ssc_en = dphy_ssc_en,
+	.force_pll = dphy_force_pll,
+};
+
+static struct ops_entry entry = {
+	.ver = "sprd,megacores-sharkle",
+	.ops = &megacores_sharkle_ops,
+};
+
+static int __init sprd_dphy_pll_register(void)
+{
+	return dphy_pll_ops_register(&entry);
+}
+
+subsys_initcall(sprd_dphy_pll_register);
diff --git a/drivers/gpu/drm/sprd/dphy/sprd_dphy_api.c b/drivers/gpu/drm/sprd/dphy/sprd_dphy_api.c
new file mode 100644
index 0000000..96c02d5
--- /dev/null
+++ b/drivers/gpu/drm/sprd/dphy/sprd_dphy_api.c
@@ -0,0 +1,254 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 Unisoc Inc.
+ */
+
+#include <linux/kernel.h>
+#include <linux/delay.h>
+
+#include "sprd_dphy_hal.h"
+
+static int dphy_wait_pll_locked(struct sprd_dphy *dphy)
+{
+	u32 i = 0;
+
+	for (i = 0; i < 50000; i++) {
+		if (dphy_hal_is_pll_locked(dphy))
+			return 0;
+		udelay(3);
+	}
+
+	pr_err("error: dphy pll can not be locked\n");
+	return -1;
+}
+
+static int dphy_wait_datalane_stop_state(struct sprd_dphy *dphy, u8 mask)
+{
+	u32 i = 0;
+
+	for (i = 0; i < 5000; i++) {
+		if (dphy_hal_is_stop_state_datalane(dphy) == mask)
+			return 0;
+		udelay(10);
+	}
+
+	pr_err("wait datalane stop-state time out\n");
+	return -1;
+}
+
+static int dphy_wait_datalane_ulps_active(struct sprd_dphy *dphy, u8 mask)
+{
+	u32 i = 0;
+
+	for (i = 0; i < 5000; i++) {
+		if (dphy_hal_is_ulps_active_datalane(dphy) == mask)
+			return 0;
+		udelay(10);
+	}
+
+	pr_err("wait datalane ulps-active time out\n");
+	return -1;
+}
+
+static int dphy_wait_clklane_stop_state(struct sprd_dphy *dphy)
+{
+	u32 i = 0;
+
+	for (i = 0; i < 5000; i++) {
+		if (dphy_hal_is_stop_state_clklane(dphy))
+			return 0;
+		udelay(10);
+	}
+
+	pr_err("wait clklane stop-state time out\n");
+	return -1;
+}
+
+static int dphy_wait_clklane_ulps_active(struct sprd_dphy *dphy)
+{
+	u32 i = 0;
+
+	for (i = 0; i < 5000; i++) {
+		if (dphy_hal_is_ulps_active_clklane(dphy))
+			return 0;
+		udelay(10);
+	}
+
+	pr_err("wait clklane ulps-active time out\n");
+	return -1;
+}
+
+int sprd_dphy_configure(struct sprd_dphy *dphy)
+{
+	struct dphy_pll_ops *pll = dphy->pll;
+	struct dphy_context *ctx = &dphy->ctx;
+
+	pr_info("lanes : %d\n", ctx->lanes);
+	pr_info("freq : %d\n", ctx->freq);
+
+	dphy_hal_rstz(dphy, 0);
+	dphy_hal_shutdownz(dphy, 0);
+	dphy_hal_clklane_en(dphy, 0);
+
+	dphy_hal_test_clr(dphy, 0);
+	dphy_hal_test_clr(dphy, 1);
+	dphy_hal_test_clr(dphy, 0);
+
+	pll->pll_config(ctx);
+	pll->timing_config(ctx);
+
+	dphy_hal_shutdownz(dphy, 1);
+	dphy_hal_rstz(dphy, 1);
+	dphy_hal_stop_wait_time(dphy, 0x1C);
+	dphy_hal_clklane_en(dphy, 1);
+	dphy_hal_datalane_en(dphy);
+
+	if (dphy_wait_pll_locked(dphy))
+		return -1;
+
+	return 0;
+}
+
+void sprd_dphy_reset(struct sprd_dphy *dphy)
+{
+	dphy_hal_rstz(dphy, 0);
+	udelay(10);
+	dphy_hal_rstz(dphy, 1);
+}
+
+void sprd_dphy_shutdown(struct sprd_dphy *dphy)
+{
+	dphy_hal_shutdownz(dphy, 0);
+	udelay(10);
+	dphy_hal_shutdownz(dphy, 1);
+}
+
+int sprd_dphy_hop_config(struct sprd_dphy *dphy, int delta, int period)
+{
+	struct dphy_pll_ops *pll = dphy->pll;
+	struct dphy_context *ctx = &dphy->ctx;
+
+	if (pll->hop_config)
+		return pll->hop_config(ctx, delta, period);
+
+	return 0;
+}
+
+int sprd_dphy_ssc_en(struct sprd_dphy *dphy, bool en)
+{
+	struct dphy_pll_ops *pll = dphy->pll;
+	struct dphy_context *ctx = &dphy->ctx;
+
+	if (pll->ssc_en)
+		return pll->ssc_en(ctx, en);
+
+	return 0;
+}
+
+int sprd_dphy_close(struct sprd_dphy *dphy)
+{
+	if (!dphy)
+		return -1;
+
+	dphy_hal_rstz(dphy, 0);
+	dphy_hal_shutdownz(dphy, 0);
+	dphy_hal_rstz(dphy, 1);
+
+	return 0;
+}
+
+int sprd_dphy_data_ulps_enter(struct sprd_dphy *dphy)
+{
+	u8 lane_mask = (1 << dphy->ctx.lanes) - 1;
+
+	dphy_hal_datalane_ulps_rqst(dphy, 1);
+
+	dphy_wait_datalane_ulps_active(dphy, lane_mask);
+
+	dphy_hal_datalane_ulps_rqst(dphy, 0);
+
+	return 0;
+}
+
+int sprd_dphy_data_ulps_exit(struct sprd_dphy *dphy)
+{
+	u8 lane_mask = (1 << dphy->ctx.lanes) - 1;
+
+	dphy_hal_datalane_ulps_exit(dphy, 1);
+
+	dphy_wait_datalane_stop_state(dphy, lane_mask);
+
+	dphy_hal_datalane_ulps_exit(dphy, 0);
+
+	return 0;
+}
+
+int sprd_dphy_clk_ulps_enter(struct sprd_dphy *dphy)
+{
+	dphy_hal_clklane_ulps_rqst(dphy, 1);
+
+	dphy_wait_clklane_ulps_active(dphy);
+
+	dphy_hal_clklane_ulps_rqst(dphy, 0);
+
+	return 0;
+}
+
+int sprd_dphy_clk_ulps_exit(struct sprd_dphy *dphy)
+{
+	dphy_hal_clklane_ulps_exit(dphy, 1);
+
+	dphy_wait_clklane_stop_state(dphy);
+
+	dphy_hal_clklane_ulps_exit(dphy, 0);
+
+	return 0;
+}
+
+void sprd_dphy_force_pll(struct sprd_dphy *dphy, bool enable)
+{
+	dphy_hal_force_pll(dphy, enable);
+}
+
+void sprd_dphy_hs_clk_en(struct sprd_dphy *dphy, bool enable)
+{
+	dphy_hal_clk_hs_rqst(dphy, enable);
+
+	dphy_wait_pll_locked(dphy);
+}
+
+void sprd_dphy_test_write(struct sprd_dphy *dphy, u8 address, u8 data)
+{
+	dphy_hal_test_en(dphy, 1);
+
+	dphy_hal_test_din(dphy, address);
+
+	dphy_hal_test_clk(dphy, 1);
+	dphy_hal_test_clk(dphy, 0);
+
+	dphy_hal_test_en(dphy, 0);
+
+	dphy_hal_test_din(dphy, data);
+
+	dphy_hal_test_clk(dphy, 1);
+	dphy_hal_test_clk(dphy, 0);
+}
+
+u8 sprd_dphy_test_read(struct sprd_dphy *dphy, u8 address)
+{
+	dphy_hal_test_en(dphy, 1);
+
+	dphy_hal_test_din(dphy, address);
+
+	dphy_hal_test_clk(dphy, 1);
+	dphy_hal_test_clk(dphy, 0);
+
+	dphy_hal_test_en(dphy, 0);
+
+	udelay(1);
+
+	return dphy_hal_test_dout(dphy);
+}
+
+
+
diff --git a/drivers/gpu/drm/sprd/dphy/sprd_dphy_hal.h b/drivers/gpu/drm/sprd/dphy/sprd_dphy_hal.h
new file mode 100644
index 0000000..b1d32be
--- /dev/null
+++ b/drivers/gpu/drm/sprd/dphy/sprd_dphy_hal.h
@@ -0,0 +1,329 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2019 Unisoc Inc.
+ */
+
+#include "sprd_dphy.h"
+
+
+/*
+ * Reset D-PHY module
+ * @param dphy: pointer to structure
+ *  which holds information about the d-dphy module
+ * @param reset
+ */
+static inline void dphy_hal_rstz(struct sprd_dphy *dphy, int level)
+{
+	struct dphy_ppi_ops *ppi = dphy->ppi;
+	struct dphy_context *ctx = &dphy->ctx;
+
+	if (ppi->rstz)
+		ppi->rstz(ctx, level);
+}
+
+/*
+ * Power up/down D-PHY module
+ * @param dphy: pointer to structure
+ *  which holds information about the d-dphy module
+ * @param enable (1: shutdown)
+ */
+static inline void dphy_hal_shutdownz(struct sprd_dphy *dphy, int level)
+{
+	struct dphy_ppi_ops *ppi = dphy->ppi;
+	struct dphy_context *ctx = &dphy->ctx;
+
+	if (ppi->shutdownz)
+		ppi->shutdownz(ctx, level);
+}
+
+/*
+ * Force D-PHY PLL to stay on while in ULPS
+ * @param dphy: pointer to structure
+ *  which holds information about the d-dphy module
+ * @param force (1) disable (0)
+ * @note To follow the programming model, use wakeup_pll function
+ */
+static inline void dphy_hal_force_pll(struct sprd_dphy *dphy, int en)
+{
+	struct dphy_ppi_ops *ppi = dphy->ppi;
+	struct dphy_context *ctx = &dphy->ctx;
+
+	if (ppi->force_pll)
+		ppi->force_pll(ctx, en);
+}
+
+static inline void dphy_hal_clklane_ulps_rqst(struct sprd_dphy *dphy, int en)
+{
+	struct dphy_ppi_ops *ppi = dphy->ppi;
+	struct dphy_context *ctx = &dphy->ctx;
+
+	if (ppi->clklane_ulps_rqst)
+		ppi->clklane_ulps_rqst(ctx, en);
+}
+
+static inline void dphy_hal_clklane_ulps_exit(struct sprd_dphy *dphy, int en)
+{
+	struct dphy_ppi_ops *ppi = dphy->ppi;
+	struct dphy_context *ctx = &dphy->ctx;
+
+	if (ppi->clklane_ulps_exit)
+		ppi->clklane_ulps_exit(ctx, en);
+}
+
+static inline void dphy_hal_datalane_ulps_rqst(struct sprd_dphy *dphy, int en)
+{
+	struct dphy_ppi_ops *ppi = dphy->ppi;
+	struct dphy_context *ctx = &dphy->ctx;
+
+	if (ppi->datalane_ulps_rqst)
+		ppi->datalane_ulps_rqst(ctx, en);
+}
+
+static inline void dphy_hal_datalane_ulps_exit(struct sprd_dphy *dphy, int en)
+{
+	struct dphy_ppi_ops *ppi = dphy->ppi;
+	struct dphy_context *ctx = &dphy->ctx;
+
+	if (ppi->datalane_ulps_exit)
+		ppi->datalane_ulps_exit(ctx, en);
+}
+
+/*
+ * Configure minimum wait period for HS transmission request after a stop state
+ * @param dphy pointer to structure which holds information about the d-dphy
+ * module
+ * @param no_of_byte_cycles [in byte (lane) clock cycles]
+ */
+static inline void dphy_hal_stop_wait_time(struct sprd_dphy *dphy, u8 cycles)
+{
+	struct dphy_ppi_ops *ppi = dphy->ppi;
+	struct dphy_context *ctx = &dphy->ctx;
+
+	if (ppi->stop_wait_time)
+		ppi->stop_wait_time(ctx, cycles);
+}
+
+/*
+ * Set number of active lanes
+ * @param dphy: pointer to structure
+ *  which holds information about the d-dphy module
+ * @param no_of_lanes
+ */
+static inline void dphy_hal_datalane_en(struct sprd_dphy *dphy)
+{
+	struct dphy_ppi_ops *ppi = dphy->ppi;
+	struct dphy_context *ctx = &dphy->ctx;
+
+	if (ppi->datalane_en)
+		ppi->datalane_en(ctx);
+}
+
+/*
+ * Enable clock lane module
+ * @param dphy pointer to structure
+ *  which holds information about the d-dphy module
+ * @param en
+ */
+static inline void dphy_hal_clklane_en(struct sprd_dphy *dphy, int en)
+{
+	struct dphy_ppi_ops *ppi = dphy->ppi;
+	struct dphy_context *ctx = &dphy->ctx;
+
+	if (ppi->clklane_en)
+		ppi->clklane_en(ctx, en);
+}
+
+/*
+ * Request the PHY module to start transmission of high speed clock.
+ * This causes the clock lane to start transmitting DDR clock on the
+ * lane interconnect.
+ * @param dphy pointer to structure which holds information about the d-dphy
+ * module
+ * @param enable
+ * @note this function should be called explicitly by user always except for
+ * transmitting
+ */
+static inline void dphy_hal_clk_hs_rqst(struct sprd_dphy *dphy, int en)
+{
+	struct dphy_ppi_ops *ppi = dphy->ppi;
+	struct dphy_context *ctx = &dphy->ctx;
+
+	if (ppi->clk_hs_rqst)
+		ppi->clk_hs_rqst(ctx, en);
+}
+
+/*
+ * Get D-PHY PPI status
+ * @param dphy pointer to structure which holds information about the d-dphy
+ * module
+ * @param mask
+ * @return status
+ */
+static inline u8 dphy_hal_is_pll_locked(struct sprd_dphy *dphy)
+{
+	struct dphy_ppi_ops *ppi = dphy->ppi;
+	struct dphy_context *ctx = &dphy->ctx;
+
+	if (!ppi->is_pll_locked)
+		return 1;
+
+	return ppi->is_pll_locked(ctx);
+}
+
+static inline u8 dphy_hal_is_rx_direction(struct sprd_dphy *dphy)
+{
+	struct dphy_ppi_ops *ppi = dphy->ppi;
+	struct dphy_context *ctx = &dphy->ctx;
+
+	if (!ppi->is_rx_direction)
+		return 0;
+
+	return ppi->is_rx_direction(ctx);
+}
+
+static inline u8 dphy_hal_is_rx_ulps_esc_lane0(struct sprd_dphy *dphy)
+{
+	struct dphy_ppi_ops *ppi = dphy->ppi;
+	struct dphy_context *ctx = &dphy->ctx;
+
+	if (!ppi->is_rx_ulps_esc_lane0)
+		return 0;
+
+	return ppi->is_rx_ulps_esc_lane0(ctx);
+}
+
+static inline u8 dphy_hal_is_stop_state_clklane(struct sprd_dphy *dphy)
+{
+	struct dphy_ppi_ops *ppi = dphy->ppi;
+	struct dphy_context *ctx = &dphy->ctx;
+
+	if (!ppi->is_stop_state_clklane)
+		return 1;
+
+	return ppi->is_stop_state_clklane(ctx);
+}
+
+static inline u8 dphy_hal_is_stop_state_datalane(struct sprd_dphy *dphy)
+{
+	struct dphy_ppi_ops *ppi = dphy->ppi;
+	struct dphy_context *ctx = &dphy->ctx;
+
+	if (!ppi->is_stop_state_datalane)
+		return 1;
+
+	return ppi->is_stop_state_datalane(ctx);
+}
+
+static inline u8 dphy_hal_is_ulps_active_clklane(struct sprd_dphy *dphy)
+{
+	struct dphy_ppi_ops *ppi = dphy->ppi;
+	struct dphy_context *ctx = &dphy->ctx;
+
+	if (!ppi->is_ulps_active_clklane)
+		return 1;
+
+	return ppi->is_ulps_active_clklane(ctx);
+}
+
+static inline u8 dphy_hal_is_ulps_active_datalane(struct sprd_dphy *dphy)
+{
+	struct dphy_ppi_ops *ppi = dphy->ppi;
+	struct dphy_context *ctx = &dphy->ctx;
+
+	if (!ppi->is_ulps_active_datalane)
+		return 1;
+
+	return ppi->is_ulps_active_datalane(ctx);
+}
+
+/*
+ * @param dphy pointer to structure which holds information about the d-dphy
+ * module
+ * @param value
+ */
+static inline void dphy_hal_test_clk(struct sprd_dphy *dphy, u8 level)
+{
+	struct dphy_ppi_ops *ppi = dphy->ppi;
+	struct dphy_context *ctx = &dphy->ctx;
+
+	if (ppi->tst_clk)
+		ppi->tst_clk(ctx, level);
+}
+
+/*
+ * @param dphy pointer to structure which holds information about the d-dphy
+ * module
+ * @param value
+ */
+static inline void dphy_hal_test_clr(struct sprd_dphy *dphy, u8 level)
+{
+	struct dphy_ppi_ops *ppi = dphy->ppi;
+	struct dphy_context *ctx = &dphy->ctx;
+
+	if (ppi->tst_clr)
+		ppi->tst_clr(ctx, level);
+}
+
+/*
+ * @param dphy pointer to structure which holds information about the d-dphy
+ * module
+ * @param on_falling_edge
+ */
+static inline void dphy_hal_test_en(struct sprd_dphy *dphy, u8 level)
+{
+	struct dphy_ppi_ops *ppi = dphy->ppi;
+	struct dphy_context *ctx = &dphy->ctx;
+
+	if (ppi->tst_en)
+		ppi->tst_en(ctx, level);
+}
+
+/*
+ * @param dphy pointer to structure which holds information about the d-dphy
+ * module
+ */
+static inline u8 dphy_hal_test_dout(struct sprd_dphy *dphy)
+{
+	struct dphy_ppi_ops *ppi = dphy->ppi;
+	struct dphy_context *ctx = &dphy->ctx;
+
+	if (ppi->tst_dout)
+		return ppi->tst_dout(ctx);
+
+	return 0;
+}
+
+/*
+ * @param dphy pointer to structure which holds information about the d-dphy
+ * module
+ * @param test_data
+ */
+static inline void dphy_hal_test_din(struct sprd_dphy *dphy, u8 data)
+{
+	struct dphy_ppi_ops *ppi = dphy->ppi;
+	struct dphy_context *ctx = &dphy->ctx;
+
+	if (ppi->tst_din)
+		ppi->tst_din(ctx, data);
+}
+
+static inline void dphy_hal_bist_en(struct sprd_dphy *dphy, int en)
+{
+	struct dphy_ppi_ops *ppi = dphy->ppi;
+	struct dphy_context *ctx = &dphy->ctx;
+
+	if (ppi->bist_en)
+		ppi->bist_en(ctx, en);
+}
+
+static inline u8 dphy_hal_is_bist_ok(struct sprd_dphy *dphy)
+{
+	struct dphy_ppi_ops *ppi = dphy->ppi;
+	struct dphy_context *ctx = &dphy->ctx;
+
+	if (!ppi->is_bist_ok)
+		return 1;
+
+	return ppi->is_bist_ok(ctx);
+}
+
diff --git a/drivers/gpu/drm/sprd/dsi/Makefile b/drivers/gpu/drm/sprd/dsi/Makefile
new file mode 100644
index 0000000..b7999b5
--- /dev/null
+++ b/drivers/gpu/drm/sprd/dsi/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0
+
+subdir-ccflags-y += -I$(src)
+
+obj-y += sprd_dsi_api.o
+
+obj-y += core/
diff --git a/drivers/gpu/drm/sprd/dsi/core/Makefile b/drivers/gpu/drm/sprd/dsi/core/Makefile
new file mode 100644
index 0000000..8a2957f
--- /dev/null
+++ b/drivers/gpu/drm/sprd/dsi/core/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-y += dsi_ctrl_r1p0.o dsi_ctrl_r1p0_ppi.o
\ No newline at end of file
diff --git a/drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c b/drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c
new file mode 100644
index 0000000..9653b0c
--- /dev/null
+++ b/drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c
@@ -0,0 +1,1186 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 Unisoc Inc.
+ */
+
+#include <linux/io.h>
+#include <linux/init.h>
+#include <linux/delay.h>
+#include <linux/module.h>
+
+#include "sprd_dsi.h"
+#include "dsi_ctrl_r1p0.h"
+
+/*
+ * Get DSI Host core version
+ * @param instance pointer to structure holding the DSI Host core information
+ * @return ascii number of the version
+ */
+static bool dsi_check_version(struct dsi_context *ctx)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	u32 version = readl(&reg->DSI_VERSION);
+
+	if (version == 0x100)
+		return true;
+	else if (version == 0x200)
+		return true;
+	else if (version == 0x300)
+		return true;
+	else
+		return false;
+}
+/*
+ * Modify power status of DSI Host core
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param on (1) or off (0)
+ */
+static void dsi_power_enable(struct dsi_context *ctx, int enable)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+
+	writel(enable, &reg->SOFT_RESET);
+}
+/*
+ * Enable/disable DPI video mode
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param enable (1) - disable (0)
+ */
+static void dsi_video_mode(struct dsi_context *ctx)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+
+	writel(0, &reg->DSI_MODE_CFG);
+}
+/*
+ * Enable command mode (Generic interface)
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param enable
+ */
+static void dsi_cmd_mode(struct dsi_context *ctx)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+
+	writel(1, &reg->DSI_MODE_CFG);
+}
+
+static bool dsi_is_cmd_mode(struct dsi_context *ctx)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+
+	return readl(&reg->DSI_MODE_CFG);
+}
+/*
+ * Configure the read back virtual channel for the generic interface
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param vc to listen to on the line
+ */
+static void dsi_rx_vcid(struct dsi_context *ctx, u8 vc)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x1C virtual_channel_id;
+
+	virtual_channel_id.val = readl(&reg->VIRTUAL_CHANNEL_ID);
+	virtual_channel_id.bits.gen_rx_vcid = vc;
+
+	writel(virtual_channel_id.val, &reg->VIRTUAL_CHANNEL_ID);
+}
+/*
+ * Write the DPI video virtual channel destination
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param vc virtual channel
+ */
+static void dsi_video_vcid(struct dsi_context *ctx, u8 vc)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x1C virtual_channel_id;
+
+	virtual_channel_id.val = readl(&reg->VIRTUAL_CHANNEL_ID);
+	virtual_channel_id.bits.video_pkt_vcid = vc;
+
+	writel(virtual_channel_id.val, &reg->VIRTUAL_CHANNEL_ID);
+}
+/*
+ * Set DPI video mode type (burst/non-burst - with sync pulses or events)
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param type
+ * @return error code
+ */
+static void dsi_dpi_video_burst_mode(struct dsi_context *ctx, int mode)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x38 vid_mode_cfg;
+
+	vid_mode_cfg.val = readl(&reg->VID_MODE_CFG);
+	vid_mode_cfg.bits.vid_mode_type = mode;
+
+	writel(vid_mode_cfg.val, &reg->VID_MODE_CFG);
+}
+/*
+ * Set DPI video color coding
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param color_coding enum (configuration and color depth)
+ * @return error code
+ */
+static void dsi_dpi_color_coding(struct dsi_context *ctx, int coding)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x20 dpi_video_format;
+
+	dpi_video_format.val = readl(&reg->DPI_VIDEO_FORMAT);
+	dpi_video_format.bits.dpi_video_mode_format = coding;
+
+	writel(dpi_video_format.val, &reg->DPI_VIDEO_FORMAT);
+}
+/*
+ * Set DPI loosely packetisation video (used only when color depth = 18
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param enable
+ */
+static void dsi_dpi_18_loosely_packet_en(struct dsi_context *ctx, int enable)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x20 dpi_video_format;
+
+	dpi_video_format.val = readl(&reg->DPI_VIDEO_FORMAT);
+	dpi_video_format.bits.loosely18_en = enable;
+
+	writel(dpi_video_format.val, &reg->DPI_VIDEO_FORMAT);
+}
+/*
+ * Configure the Horizontal Line time
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param byte_cycle taken to transmit the total of the horizontal line
+ */
+static void dsi_dpi_hline_time(struct dsi_context *ctx, u16 byte_cycle)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x2C video_line_time;
+
+	video_line_time.val = readl(&reg->VIDEO_LINE_TIME);
+	video_line_time.bits.video_line_time = byte_cycle;
+
+	writel(video_line_time.val, &reg->VIDEO_LINE_TIME);
+}
+/*
+ * Configure the Horizontal back porch time
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param byte_cycle taken to transmit the horizontal back porch
+ */
+static void dsi_dpi_hbp_time(struct dsi_context *ctx, u16 byte_cycle)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x28 video_line_hblk_time;
+
+	video_line_hblk_time.val = readl(&reg->VIDEO_LINE_HBLK_TIME);
+	video_line_hblk_time.bits.video_line_hbp_time = byte_cycle;
+
+	writel(video_line_hblk_time.val, &reg->VIDEO_LINE_HBLK_TIME);
+}
+/*
+ * Configure the Horizontal sync time
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param byte_cycle taken to transmit the horizontal sync
+ */
+static void dsi_dpi_hsync_time(struct dsi_context *ctx, u16 byte_cycle)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x28 video_line_hblk_time;
+
+	video_line_hblk_time.val = readl(&reg->VIDEO_LINE_HBLK_TIME);
+	video_line_hblk_time.bits.video_line_hsa_time = byte_cycle;
+
+	writel(video_line_hblk_time.val, &reg->VIDEO_LINE_HBLK_TIME);
+}
+/*
+ * Configure the vertical active lines of the video stream
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param lines
+ */
+static void dsi_dpi_vact(struct dsi_context *ctx, u16 lines)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x34 video_active_lines;
+
+	video_active_lines.val = readl(&reg->VIDEO_VACTIVE_LINES);
+	video_active_lines.bits.vactive_lines = lines;
+
+	writel(video_active_lines.val, &reg->VIDEO_VACTIVE_LINES);
+}
+/*
+ * Configure the vertical front porch lines of the video stream
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param lines
+ */
+static void dsi_dpi_vfp(struct dsi_context *ctx, u16 lines)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x30 video_vblk_lines;
+
+	video_vblk_lines.val = readl(&reg->VIDEO_VBLK_LINES);
+	video_vblk_lines.bits.vfp_lines = lines;
+
+	writel(video_vblk_lines.val, &reg->VIDEO_VBLK_LINES);
+}
+/*
+ * Configure the vertical back porch lines of the video stream
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param lines
+ */
+static void dsi_dpi_vbp(struct dsi_context *ctx, u16 lines)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x30 video_vblk_lines;
+
+	video_vblk_lines.val = readl(&reg->VIDEO_VBLK_LINES);
+	video_vblk_lines.bits.vbp_lines = lines;
+
+	writel(video_vblk_lines.val, &reg->VIDEO_VBLK_LINES);
+}
+/*
+ * Configure the vertical sync lines of the video stream
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param lines
+ */
+static void dsi_dpi_vsync(struct dsi_context *ctx, u16 lines)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x30 video_vblk_lines;
+
+	video_vblk_lines.val = readl(&reg->VIDEO_VBLK_LINES);
+	video_vblk_lines.bits.vsa_lines = lines;
+
+	writel(video_vblk_lines.val, &reg->VIDEO_VBLK_LINES);
+}
+/*
+ * Enable return to low power mode inside horizontal front porch periods when
+ *  timing allows
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param enable (1) - disable (0)
+ */
+static void dsi_dpi_hporch_lp_en(struct dsi_context *ctx, int enable)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x38 vid_mode_cfg;
+
+	vid_mode_cfg.val = readl(&reg->VID_MODE_CFG);
+
+	vid_mode_cfg.bits.lp_hfp_en = enable;
+	vid_mode_cfg.bits.lp_hbp_en = enable;
+
+	writel(vid_mode_cfg.val, &reg->VID_MODE_CFG);
+}
+/*
+ * Enable return to low power mode inside vertical active lines periods when
+ *  timing allows
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param enable (1) - disable (0)
+ */
+static void dsi_dpi_vporch_lp_en(struct dsi_context *ctx, int enable)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x38 vid_mode_cfg;
+
+	vid_mode_cfg.val = readl(&reg->VID_MODE_CFG);
+
+	vid_mode_cfg.bits.lp_vact_en = enable;
+	vid_mode_cfg.bits.lp_vfp_en = enable;
+	vid_mode_cfg.bits.lp_vbp_en = enable;
+	vid_mode_cfg.bits.lp_vsa_en = enable;
+
+	writel(vid_mode_cfg.val, &reg->VID_MODE_CFG);
+}
+/*
+ * Enable FRAME BTA ACK
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param enable (1) - disable (0)
+ */
+static void dsi_dpi_frame_ack_en(struct dsi_context *ctx, int enable)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x38 vid_mode_cfg;
+
+	vid_mode_cfg.val = readl(&reg->VID_MODE_CFG);
+	vid_mode_cfg.bits.frame_bta_ack_en = enable;
+
+	writel(vid_mode_cfg.val, &reg->VID_MODE_CFG);
+}
+/*
+ * Write no of chunks to core - taken into consideration only when multi packet
+ * is enabled
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param no of chunks
+ */
+static void dsi_dpi_chunk_num(struct dsi_context *ctx, u16 num)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x24 video_pkt_config;
+
+	video_pkt_config.val = readl(&reg->VIDEO_PKT_CONFIG);
+	video_pkt_config.bits.video_line_chunk_num = num;
+
+	writel(video_pkt_config.val, &reg->VIDEO_PKT_CONFIG);
+}
+/*
+ * Write the null packet size - will only be taken into account when null
+ * packets are enabled.
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param size of null packet
+ * @return error code
+ */
+static void dsi_dpi_null_packet_size(struct dsi_context *ctx, u16 size)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0xC0 video_nullpkt_size;
+
+	video_nullpkt_size.val = readl(&reg->VIDEO_NULLPKT_SIZE);
+	video_nullpkt_size.bits.video_nullpkt_size = size;
+
+	writel(video_nullpkt_size.val, &reg->VIDEO_NULLPKT_SIZE);
+}
+/*
+ * Write video packet size. obligatory for sending video
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param size of video packet - containing information
+ * @return error code
+ */
+static void dsi_dpi_video_packet_size(struct dsi_context *ctx, u16 size)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x24 video_pkt_config;
+
+	video_pkt_config.val = readl(&reg->VIDEO_PKT_CONFIG);
+	video_pkt_config.bits.video_pkt_size = size;
+
+	writel(video_pkt_config.val, &reg->VIDEO_PKT_CONFIG);
+}
+/*
+ * Specifiy the size of the packet memory write start/continue
+ * @param instance pointer to structure holding the DSI Host core information
+ * @ size of the packet
+ * @note when different than zero (0) eDPI is enabled
+ */
+static void dsi_edpi_max_pkt_size(struct dsi_context *ctx, u16 size)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0xC4 dcs_wm_pkt_size;
+
+	dcs_wm_pkt_size.val = readl(&reg->DCS_WM_PKT_SIZE);
+	dcs_wm_pkt_size.bits.dcs_wm_pkt_size = size;
+
+	writel(dcs_wm_pkt_size.val, &reg->DCS_WM_PKT_SIZE);
+}
+/*
+ * Enable tear effect acknowledge
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param enable (1) - disable (0)
+ */
+static void dsi_tear_effect_ack_en(struct dsi_context *ctx, int enable)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x68 cmd_mode_cfg;
+
+	cmd_mode_cfg.val = readl(&reg->CMD_MODE_CFG);
+	cmd_mode_cfg.bits.tear_fx_en = enable;
+
+	writel(cmd_mode_cfg.val, &reg->CMD_MODE_CFG);
+}
+/*
+ * Enable packets acknowledge request after each packet transmission
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param enable (1) - disable (0)
+ */
+static void dsi_cmd_ack_request_en(struct dsi_context *ctx, int enable)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x68 cmd_mode_cfg;
+
+	cmd_mode_cfg.val = readl(&reg->CMD_MODE_CFG);
+	cmd_mode_cfg.bits.ack_rqst_en = enable;
+
+	writel(cmd_mode_cfg.val, &reg->CMD_MODE_CFG);
+}
+/*
+ * Set DCS command packet transmission to transmission type
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param no_of_param of command
+ * @param lp transmit in low power
+ * @return error code
+ */
+static void dsi_cmd_mode_lp_cmd_en(struct dsi_context *ctx, int enable)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x68 cmd_mode_cfg;
+
+	cmd_mode_cfg.val = readl(&reg->CMD_MODE_CFG);
+
+	cmd_mode_cfg.bits.gen_sw_0p_tx = enable;
+	cmd_mode_cfg.bits.gen_sw_1p_tx = enable;
+	cmd_mode_cfg.bits.gen_sw_2p_tx = enable;
+	cmd_mode_cfg.bits.gen_lw_tx = enable;
+	cmd_mode_cfg.bits.dcs_sw_0p_tx = enable;
+	cmd_mode_cfg.bits.dcs_sw_1p_tx = enable;
+	cmd_mode_cfg.bits.dcs_lw_tx = enable;
+	cmd_mode_cfg.bits.max_rd_pkt_size = enable;
+
+	cmd_mode_cfg.bits.gen_sr_0p_tx = enable;
+	cmd_mode_cfg.bits.gen_sr_1p_tx = enable;
+	cmd_mode_cfg.bits.gen_sr_2p_tx = enable;
+	cmd_mode_cfg.bits.dcs_sr_0p_tx = enable;
+
+	writel(cmd_mode_cfg.val, &reg->CMD_MODE_CFG);
+}
+/*
+ * Set DCS read command packet transmission to transmission type
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param no_of_param of command
+ * @param lp transmit in low power
+ * @return error code
+ */
+static void dsi_video_mode_lp_cmd_en(struct dsi_context *ctx, int enable)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x38 vid_mode_cfg;
+
+	vid_mode_cfg.val = readl(&reg->VID_MODE_CFG);
+	vid_mode_cfg.bits.lp_cmd_en = enable;
+
+	writel(vid_mode_cfg.val, &reg->VID_MODE_CFG);
+}
+
+/*
+ * Write command header in the generic interface
+ * (which also sends DCS commands) as a subset
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param vc of destination
+ * @param packet_type (or type of DCS command)
+ * @param ls_byte (if DCS, it is the DCS command)
+ * @param ms_byte (only parameter of short DCS packet)
+ * @return error code
+ */
+static void dsi_set_packet_header(struct dsi_context *ctx,
+				   u8 vc,
+				   u8 type,
+				   u8 wc_lsb,
+				   u8 wc_msb)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x6C gen_hdr;
+
+	gen_hdr.bits.gen_dt = type;
+	gen_hdr.bits.gen_vc = vc;
+	gen_hdr.bits.gen_wc_lsbyte = wc_lsb;
+	gen_hdr.bits.gen_wc_msbyte = wc_msb;
+
+	writel(gen_hdr.val, &reg->GEN_HDR);
+}
+/*
+ * Write the payload of the long packet commands
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param payload array of bytes of payload
+ * @return error code
+ */
+static void dsi_set_packet_payload(struct dsi_context *ctx, u32 payload)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+
+	writel(payload, &reg->GEN_PLD_DATA);
+}
+/*
+ * Write the payload of the long packet commands
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param payload pointer to 32-bit array to hold read information
+ * @return error code
+ */
+static u32 dsi_get_rx_payload(struct dsi_context *ctx)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+
+	return readl(&reg->GEN_PLD_DATA);
+}
+
+/*
+ * Enable Bus Turn-around request
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param enable
+ */
+static void dsi_bta_en(struct dsi_context *ctx, int enable)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+
+	writel(enable, &reg->TA_EN);
+}
+/*
+ * Enable EOTp reception
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param enable
+ */
+static void dsi_eotp_rx_en(struct dsi_context *ctx, int enable)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0xBC eotp_en;
+
+	eotp_en.val = readl(&reg->EOTP_EN);
+	eotp_en.bits.rx_eotp_en = enable;
+
+	writel(eotp_en.val, &reg->EOTP_EN);
+}
+/*
+ * Enable EOTp transmission
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param enable
+ */
+static void dsi_eotp_tx_en(struct dsi_context *ctx, int enable)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0xBC eotp_en;
+
+	eotp_en.val = readl(&reg->EOTP_EN);
+	eotp_en.bits.tx_eotp_en = enable;
+
+	writel(eotp_en.val, &reg->EOTP_EN);
+}
+/*
+ * Enable ECC reception, error correction and reporting
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param enable
+ */
+static void dsi_ecc_rx_en(struct dsi_context *ctx, int enable)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0xB4 rx_pkt_check_config;
+
+	rx_pkt_check_config.val = readl(&reg->RX_PKT_CHECK_CONFIG);
+	rx_pkt_check_config.bits.rx_pkt_ecc_en = enable;
+
+	writel(rx_pkt_check_config.val, &reg->RX_PKT_CHECK_CONFIG);
+}
+/*
+ * Enable CRC reception, error reporting
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param enable
+ */
+static void dsi_crc_rx_en(struct dsi_context *ctx, int enable)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0xB4 rx_pkt_check_config;
+
+	rx_pkt_check_config.val = readl(&reg->RX_PKT_CHECK_CONFIG);
+	rx_pkt_check_config.bits.rx_pkt_crc_en = enable;
+
+	writel(rx_pkt_check_config.val, &reg->RX_PKT_CHECK_CONFIG);
+}
+/*
+ * NOTE: dsi-ctrl-r1p0 only
+ *
+ * Get status of read command
+ * @param instance pointer to structure holding the DSI Host core information
+ * @return 1 if busy
+ */
+static bool dsi_is_rdcmd_done(struct dsi_context *ctx)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x98 cmd_mode_status;
+
+	cmd_mode_status.val = readl(&reg->CMD_MODE_STATUS);
+
+	return cmd_mode_status.bits.gen_cmd_rdcmd_done;
+}
+/*
+ * Get the FULL status of generic read payload fifo
+ * @param instance pointer to structure holding the DSI Host core information
+ * @return 1 if fifo full
+ */
+static bool dsi_is_rx_payload_fifo_full(struct dsi_context *ctx)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x98 cmd_mode_status;
+
+	cmd_mode_status.val = readl(&reg->CMD_MODE_STATUS);
+
+	return cmd_mode_status.bits.gen_cmd_rdata_fifo_full;
+}
+/*
+ * Get the EMPTY status of generic read payload fifo
+ * @param instance pointer to structure holding the DSI Host core information
+ * @return 1 if fifo empty
+ */
+static bool dsi_is_rx_payload_fifo_empty(struct dsi_context *ctx)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x98 cmd_mode_status;
+
+	cmd_mode_status.val = readl(&reg->CMD_MODE_STATUS);
+
+	return cmd_mode_status.bits.gen_cmd_rdata_fifo_empty;
+}
+/*
+ * Get the FULL status of generic write payload fifo
+ * @param instance pointer to structure holding the DSI Host core information
+ * @return 1 if fifo full
+ */
+static bool dsi_is_tx_payload_fifo_full(struct dsi_context *ctx)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x98 cmd_mode_status;
+
+	cmd_mode_status.val = readl(&reg->CMD_MODE_STATUS);
+
+	return cmd_mode_status.bits.gen_cmd_wdata_fifo_full;
+}
+/*
+ * Get the EMPTY status of generic write payload fifo
+ * @param instance pointer to structure holding the DSI Host core information
+ * @return 1 if fifo empty
+ */
+static bool dsi_is_tx_payload_fifo_empty(struct dsi_context *ctx)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x98 cmd_mode_status;
+
+	cmd_mode_status.val = readl(&reg->CMD_MODE_STATUS);
+
+	return cmd_mode_status.bits.gen_cmd_wdata_fifo_empty;
+}
+/*
+ * Get the FULL status of generic command fifo
+ * @param instance pointer to structure holding the DSI Host core information
+ * @return 1 if fifo full
+ */
+static bool dsi_is_tx_cmd_fifo_full(struct dsi_context *ctx)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x98 cmd_mode_status;
+
+	cmd_mode_status.val = readl(&reg->CMD_MODE_STATUS);
+
+	return cmd_mode_status.bits.gen_cmd_cmd_fifo_full;
+}
+/*
+ * Get the EMPTY status of generic command fifo
+ * @param instance pointer to structure holding the DSI Host core information
+ * @return 1 if fifo empty
+ */
+static bool dsi_is_tx_cmd_fifo_empty(struct dsi_context *ctx)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x98 cmd_mode_status;
+
+	cmd_mode_status.val = readl(&reg->CMD_MODE_STATUS);
+
+	return cmd_mode_status.bits.gen_cmd_cmd_fifo_empty;
+}
+
+/* only if DPI */
+/*
+ * DPI interface signal delay config
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param byte_cycle period for waiting after controller receiving HSYNC from
+ *       DPI interface to start read pixel data from memory.
+ */
+static void dsi_dpi_sig_delay(struct dsi_context *ctx, u16 byte_cycle)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0xD0 video_sig_delay_config;
+
+	video_sig_delay_config.val = readl(&reg->VIDEO_SIG_DELAY_CONFIG);
+	video_sig_delay_config.bits.video_sig_delay = byte_cycle;
+
+	writel(video_sig_delay_config.val, &reg->VIDEO_SIG_DELAY_CONFIG);
+}
+/*
+ * Configure how many cycles of byte clock would the PHY module take
+ * to switch data lane from high speed to low power
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param byte_cycle
+ * @return error code
+ */
+static void dsi_datalane_hs2lp_config(struct dsi_context *ctx, u16 byte_cycle)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0xAC phy_datalane_time_config;
+
+	phy_datalane_time_config.val = readl(&reg->PHY_DATALANE_TIME_CONFIG);
+	phy_datalane_time_config.bits.phy_datalane_hs_to_lp_time = byte_cycle;
+
+	writel(phy_datalane_time_config.val, &reg->PHY_DATALANE_TIME_CONFIG);
+}
+/*
+ * Configure how many cycles of byte clock would the PHY module take
+ * to switch the data lane from to low power high speed
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param byte_cycle
+ * @return error code
+ */
+static void dsi_datalane_lp2hs_config(struct dsi_context *ctx, u16 byte_cycle)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0xAC phy_datalane_time_config;
+
+	phy_datalane_time_config.val = readl(&reg->PHY_DATALANE_TIME_CONFIG);
+	phy_datalane_time_config.bits.phy_datalane_lp_to_hs_time = byte_cycle;
+
+	writel(phy_datalane_time_config.val, &reg->PHY_DATALANE_TIME_CONFIG);
+}
+/*
+ * Configure how many cycles of byte clock would the PHY module take
+ * to switch clock lane from high speed to low power
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param byte_cycle
+ * @return error code
+ */
+static void dsi_clklane_hs2lp_config(struct dsi_context *ctx, u16 byte_cycle)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0xA8 phy_clklane_time_config;
+
+	phy_clklane_time_config.val = readl(&reg->PHY_CLKLANE_TIME_CONFIG);
+	phy_clklane_time_config.bits.phy_clklane_hs_to_lp_time = byte_cycle;
+
+	writel(phy_clklane_time_config.val, &reg->PHY_CLKLANE_TIME_CONFIG);
+}
+/*
+ * Configure how many cycles of byte clock would the PHY module take
+ * to switch clock lane from to low power high speed
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param byte_cycle
+ * @return error code
+ */
+static void dsi_clklane_lp2hs_config(struct dsi_context *ctx, u16 byte_cycle)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0xA8 phy_clklane_time_config;
+
+	phy_clklane_time_config.val = readl(&reg->PHY_CLKLANE_TIME_CONFIG);
+	phy_clklane_time_config.bits.phy_clklane_lp_to_hs_time = byte_cycle;
+
+	writel(phy_clklane_time_config.val, &reg->PHY_CLKLANE_TIME_CONFIG);
+}
+/*
+ * Configure how many cycles of byte clock would the PHY module take
+ * to turn the bus around to start receiving
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param byte_cycle
+ * @return error code
+ */
+static void dsi_max_read_time(struct dsi_context *ctx, u16 byte_cycle)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+
+	writel(byte_cycle, &reg->MAX_READ_TIME);
+}
+/*
+ * Enable the automatic mechanism to stop providing clock in the clock
+ * lane when time allows
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param enable
+ * @return error code
+ */
+static void dsi_nc_clk_en(struct dsi_context *ctx, int enable)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x74 phy_clk_lane_lp_ctrl;
+
+	phy_clk_lane_lp_ctrl.val = readl(&reg->PHY_CLK_LANE_LP_CTRL);
+	phy_clk_lane_lp_ctrl.bits.auto_clklane_ctrl_en = enable;
+
+	writel(phy_clk_lane_lp_ctrl.val, &reg->PHY_CLK_LANE_LP_CTRL);
+}
+/*
+ * Write transmission escape timeout
+ * a safe guard so that the state machine would reset if transmission
+ * takes too long
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param div
+ */
+static void dsi_tx_escape_division(struct dsi_context *ctx, u8 div)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+
+	writel(div, &reg->TX_ESC_CLK_CONFIG);
+}
+/* PRESP Time outs */
+/*
+ * configure timeout divisions (so they would have more clock ticks)
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param div no of hs cycles before transiting back to LP in
+ *  (lane_clk / div)
+ */
+static void dsi_timeout_clock_division(struct dsi_context *ctx, u8 div)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+
+	writel(div, &reg->TIMEOUT_CNT_CLK_CONFIG);
+}
+/*
+ * Configure the Low power receive time out
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param byte_cycle (of byte cycles)
+ */
+static void dsi_lp_rx_timeout(struct dsi_context *ctx, u16 byte_cycle)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+
+	writel(byte_cycle, &reg->LRX_H_TO_CONFIG);
+}
+/*
+ * Configure a high speed transmission time out
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param byte_cycle (byte cycles)
+ */
+static void dsi_hs_tx_timeout(struct dsi_context *ctx, u16 byte_cycle)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+
+	writel(byte_cycle, &reg->HTX_TO_CONFIG);
+}
+/*
+ * Timeout for peripheral (for controller to stay still) after bus turn around
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param no_of_byte_cycles period for which the DWC_mipi_dsi_host keeps the
+ * link still, after sending a BTA operation. This period is
+ * measured in cycles of lanebyteclk
+ */
+static void dsi_bta_presp_timeout(struct dsi_context *ctx, u16 byte_cycle)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+
+	writel(byte_cycle, &reg->BTA_PRESP_TO_CONFIG);
+}
+/*
+ * Timeout for peripheral (for controller to stay still) after LP data
+ * transmission write requests
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param no_of_byte_cycles period for which the DWC_mipi_dsi_host keeps the
+ * link still, after sending a low power write operation. This period is
+ * measured in cycles of lanebyteclk
+ */
+static void dsi_lp_write_presp_timeout(struct dsi_context *ctx, u16 byte_cycle)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+
+	writel(byte_cycle, &reg->LPWR_PRESP_TO_CONFIG);
+}
+/*
+ * Timeout for peripheral (for controller to stay still) after LP data
+ * transmission read requests
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param no_of_byte_cycles period for which the DWC_mipi_dsi_host keeps the
+ * link still, after sending a low power read operation. This period is
+ * measured in cycles of lanebyteclk
+ */
+static void dsi_lp_read_presp_timeout(struct dsi_context *ctx, u16 byte_cycle)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x4C rd_presp_to_config;
+
+	rd_presp_to_config.val = readl(&reg->RD_PRESP_TO_CONFIG);
+	rd_presp_to_config.bits.lprd_presp_to_cnt_limit = byte_cycle;
+
+	writel(rd_presp_to_config.val, &reg->RD_PRESP_TO_CONFIG);
+}
+/*
+ * Timeout for peripheral (for controller to stay still) after HS data
+ * transmission write requests
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param no_of_byte_cycles period for which the DWC_mipi_dsi_host keeps the
+ * link still, after sending a high-speed write operation. This period is
+ * measured in cycles of lanebyteclk
+ */
+static void dsi_hs_write_presp_timeout(struct dsi_context *ctx, u16 byte_cycle)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x50 hswr_presp_to_config;
+
+	hswr_presp_to_config.val = readl(&reg->HSWR_PRESP_TO_CONFIG);
+	hswr_presp_to_config.bits.hswr_presp_to_cnt_limit = byte_cycle;
+
+	writel(hswr_presp_to_config.val, &reg->HSWR_PRESP_TO_CONFIG);
+}
+/*
+ * Timeout for peripheral between HS data transmission read requests
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param no_of_byte_cycles period for which the DWC_mipi_dsi_host keeps the
+ * link still, after sending a high-speed read operation. This period is
+ * measured in cycles of lanebyteclk
+ */
+static void dsi_hs_read_presp_timeout(struct dsi_context *ctx, u16 byte_cycle)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x4C rd_presp_to_config;
+
+	rd_presp_to_config.val = readl(&reg->RD_PRESP_TO_CONFIG);
+	rd_presp_to_config.bits.hsrd_presp_to_cnt_limit = byte_cycle;
+
+	writel(rd_presp_to_config.val, &reg->RD_PRESP_TO_CONFIG);
+}
+/*
+ * Get the error 0 interrupt register status
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param mask the mask to be read from the register
+ * @return error status 0 value
+ */
+static u32 dsi_int0_status(struct dsi_context *ctx)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x08 protocol_int_sts;
+
+	protocol_int_sts.val = readl(&reg->PROTOCOL_INT_STS);
+	writel(protocol_int_sts.val, &reg->PROTOCOL_INT_CLR);
+
+	if (protocol_int_sts.bits.dphy_errors_0)
+		pr_err("dphy_err: escape entry error\n");
+
+	if (protocol_int_sts.bits.dphy_errors_1)
+		pr_err("dphy_err: lp data transmission sync error\n");
+
+	if (protocol_int_sts.bits.dphy_errors_2)
+		pr_err("dphy_err: control error\n");
+
+	if (protocol_int_sts.bits.dphy_errors_3)
+		pr_err("dphy_err: LP0 contention error\n");
+
+	if (protocol_int_sts.bits.dphy_errors_4)
+		pr_err("dphy_err: LP1 contention error\n");
+
+	if (protocol_int_sts.bits.ack_with_err_0)
+		pr_err("ack_err: SoT error\n");
+
+	if (protocol_int_sts.bits.ack_with_err_1)
+		pr_err("ack_err: SoT Sync error\n");
+
+	if (protocol_int_sts.bits.ack_with_err_2)
+		pr_err("ack_err: EoT Sync error\n");
+
+	if (protocol_int_sts.bits.ack_with_err_3)
+		pr_err("ack_err: Escape Mode Entry Command error\n");
+
+	if (protocol_int_sts.bits.ack_with_err_4)
+		pr_err("ack_err: LP Transmit Sync error\n");
+
+	if (protocol_int_sts.bits.ack_with_err_5)
+		pr_err("ack_err: Peripheral Timeout error\n");
+
+	if (protocol_int_sts.bits.ack_with_err_6)
+		pr_err("ack_err: False Control error\n");
+
+	if (protocol_int_sts.bits.ack_with_err_7)
+		pr_err("ack_err: reserved (specific to device)\n");
+
+	if (protocol_int_sts.bits.ack_with_err_8)
+		pr_err("ack_err: ECC error, single-bit (corrected)\n");
+
+	if (protocol_int_sts.bits.ack_with_err_9)
+		pr_err("ack_err: ECC error, multi-bit (not corrected)\n");
+
+	if (protocol_int_sts.bits.ack_with_err_10)
+		pr_err("ack_err: checksum error (long packet only)\n");
+
+	if (protocol_int_sts.bits.ack_with_err_11)
+		pr_err("ack_err: not recognized DSI data type\n");
+
+	if (protocol_int_sts.bits.ack_with_err_12)
+		pr_err("ack_err: DSI VC ID Invalid\n");
+
+	if (protocol_int_sts.bits.ack_with_err_13)
+		pr_err("ack_err: invalid transmission length\n");
+
+	if (protocol_int_sts.bits.ack_with_err_14)
+		pr_err("ack_err: reserved (specific to device)\n");
+
+	if (protocol_int_sts.bits.ack_with_err_15)
+		pr_err("ack_err: DSI protocol violation\n");
+
+	return 0;
+}
+/*
+ * Get the error 1 interrupt register status
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param mask the mask to be read from the register
+ * @return error status 1 value
+ */
+static u32 dsi_int1_status(struct dsi_context *ctx)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+	union _0x10 internal_int_sts;
+	u32 status = 0;
+
+	internal_int_sts.val = readl(&reg->INTERNAL_INT_STS);
+	writel(internal_int_sts.val, &reg->INTERNAL_INT_CLR);
+
+	if (internal_int_sts.bits.receive_pkt_size_err)
+		pr_err("receive packet size error\n");
+
+	if (internal_int_sts.bits.eotp_not_receive_err)
+		pr_err("EoTp packet is not received\n");
+
+	if (internal_int_sts.bits.gen_cmd_cmd_fifo_wr_err)
+		pr_err("cmd header-fifo is full\n");
+
+	if (internal_int_sts.bits.gen_cmd_rdata_fifo_rd_err)
+		pr_err("cmd read-payload-fifo is empty\n");
+
+	if (internal_int_sts.bits.gen_cmd_rdata_fifo_wr_err)
+		pr_err("cmd read-payload-fifo is full\n");
+
+	if (internal_int_sts.bits.gen_cmd_wdata_fifo_wr_err)
+		pr_err("cmd write-payload-fifo is full\n");
+
+	if (internal_int_sts.bits.gen_cmd_wdata_fifo_rd_err)
+		pr_err("cmd write-payload-fifo is empty\n");
+
+	if (internal_int_sts.bits.dpi_pix_fifo_wr_err) {
+		pr_err("DPI pixel-fifo is full\n");
+		status |= DSI_INT_STS_NEED_SOFT_RESET;
+	}
+
+	if (internal_int_sts.bits.ecc_single_err)
+		pr_err("ECC single error in a received packet\n");
+
+	if (internal_int_sts.bits.ecc_multi_err)
+		pr_err("ECC multiple error in a received packet\n");
+
+	if (internal_int_sts.bits.crc_err)
+		pr_err("CRC error in the received packet payload\n");
+
+	if (internal_int_sts.bits.hs_tx_timeout)
+		pr_err("high-speed transmission timeout\n");
+
+	if (internal_int_sts.bits.lp_rx_timeout)
+		pr_err("low-power reception timeout\n");
+
+	return status;
+}
+/*
+ * Get the error 1 interrupt register status
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param mask the mask to be read from the register
+ * @return error status 1 value
+ */
+static u32 dsi_int2_status(struct dsi_context *ctx)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+
+	if (readl(&reg->INT_PLL_STS))
+		pr_err("pll interrupt\n");
+
+	return 0;
+}
+/*
+ * Configure MASK (hiding) of interrupts coming from error 0 source
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param mask to be written to the register
+ */
+static void dsi_int0_mask(struct dsi_context *ctx, u32 mask)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+
+	writel(mask, &reg->MASK_PROTOCOL_INT);
+}
+/*
+ * Configure MASK (hiding) of interrupts coming from error 1 source
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param mask the mask to be written to the register
+ */
+static void dsi_int1_mask(struct dsi_context *ctx, u32 mask)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+
+	writel(mask, &reg->MASK_INTERNAL_INT);
+}
+/*
+ * Configure MASK (hiding) of interrupts coming from error 2 source
+ * @param instance pointer to structure holding the DSI Host core information
+ * @param mask the mask to be written to the register
+ */
+static void dsi_int2_mask(struct dsi_context *ctx, u32 mask)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->base;
+
+	writel(mask, &reg->INT_PLL_MSK);
+}
+
+static struct dsi_core_ops dsi_ctrl_ops = {
+	.check_version                  = dsi_check_version,
+	.power_en                       = dsi_power_enable,
+	.video_mode                     = dsi_video_mode,
+	.cmd_mode                       = dsi_cmd_mode,
+	.is_cmd_mode                    = dsi_is_cmd_mode,
+	.rx_vcid                        = dsi_rx_vcid,
+	.video_vcid                     = dsi_video_vcid,
+	.dpi_video_burst_mode           = dsi_dpi_video_burst_mode,
+	.dpi_color_coding               = dsi_dpi_color_coding,
+	.dpi_18_loosely_packet_en       = dsi_dpi_18_loosely_packet_en,
+	.dpi_sig_delay                  = dsi_dpi_sig_delay,
+	.dpi_hline_time                 = dsi_dpi_hline_time,
+	.dpi_hsync_time                 = dsi_dpi_hsync_time,
+	.dpi_hbp_time                   = dsi_dpi_hbp_time,
+	.dpi_vact                       = dsi_dpi_vact,
+	.dpi_vfp                        = dsi_dpi_vfp,
+	.dpi_vbp                        = dsi_dpi_vbp,
+	.dpi_vsync                      = dsi_dpi_vsync,
+	.dpi_hporch_lp_en               = dsi_dpi_hporch_lp_en,
+	.dpi_vporch_lp_en               = dsi_dpi_vporch_lp_en,
+	.dpi_frame_ack_en               = dsi_dpi_frame_ack_en,
+	.dpi_chunk_num                  = dsi_dpi_chunk_num,
+	.dpi_null_packet_size           = dsi_dpi_null_packet_size,
+	.dpi_video_packet_size          = dsi_dpi_video_packet_size,
+	.edpi_max_pkt_size              = dsi_edpi_max_pkt_size,
+	.tear_effect_ack_en             = dsi_tear_effect_ack_en,
+	.cmd_ack_request_en             = dsi_cmd_ack_request_en,
+	.cmd_mode_lp_cmd_en             = dsi_cmd_mode_lp_cmd_en,
+	.video_mode_lp_cmd_en           = dsi_video_mode_lp_cmd_en,
+	.set_packet_header              = dsi_set_packet_header,
+	.set_packet_payload             = dsi_set_packet_payload,
+	.get_rx_payload                 = dsi_get_rx_payload,
+	.bta_en                         = dsi_bta_en,
+	.eotp_rx_en                     = dsi_eotp_rx_en,
+	.eotp_tx_en                     = dsi_eotp_tx_en,
+	.ecc_rx_en                      = dsi_ecc_rx_en,
+	.crc_rx_en                      = dsi_crc_rx_en,
+	.is_bta_returned                = dsi_is_rdcmd_done,
+	.is_rx_payload_fifo_full        = dsi_is_rx_payload_fifo_full,
+	.is_rx_payload_fifo_empty       = dsi_is_rx_payload_fifo_empty,
+	.is_tx_payload_fifo_full        = dsi_is_tx_payload_fifo_full,
+	.is_tx_payload_fifo_empty       = dsi_is_tx_payload_fifo_empty,
+	.is_tx_cmd_fifo_full            = dsi_is_tx_cmd_fifo_full,
+	.is_tx_cmd_fifo_empty           = dsi_is_tx_cmd_fifo_empty,
+	.datalane_hs2lp_config          = dsi_datalane_hs2lp_config,
+	.datalane_lp2hs_config          = dsi_datalane_lp2hs_config,
+	.clklane_hs2lp_config           = dsi_clklane_hs2lp_config,
+	.clklane_lp2hs_config           = dsi_clklane_lp2hs_config,
+	.max_read_time                  = dsi_max_read_time,
+	.nc_clk_en                      = dsi_nc_clk_en,
+	.tx_escape_division             = dsi_tx_escape_division,
+	.timeout_clock_division         = dsi_timeout_clock_division,
+	.lp_rx_timeout                  = dsi_lp_rx_timeout,
+	.hs_tx_timeout                  = dsi_hs_tx_timeout,
+	.bta_presp_timeout              = dsi_bta_presp_timeout,
+	.lp_write_presp_timeout         = dsi_lp_write_presp_timeout,
+	.lp_read_presp_timeout          = dsi_lp_read_presp_timeout,
+	.hs_write_presp_timeout         = dsi_hs_write_presp_timeout,
+	.hs_read_presp_timeout          = dsi_hs_read_presp_timeout,
+	.int0_status                    = dsi_int0_status,
+	.int1_status                    = dsi_int1_status,
+	.int2_status                    = dsi_int2_status,
+	.int0_mask                      = dsi_int0_mask,
+	.int1_mask                      = dsi_int1_mask,
+	.int2_mask                      = dsi_int2_mask,
+};
+
+static struct ops_entry entry = {
+	.ver = "sprd,dsi-ctrl",
+	.ops = &dsi_ctrl_ops,
+};
+
+static int __init dsi_core_register(void)
+{
+	return dsi_core_ops_register(&entry);
+}
+
+subsys_initcall(dsi_core_register);
+
+MODULE_AUTHOR("Leon He <leon.he@unisoc.com>");
+MODULE_AUTHOR("Kevin Tang <kevin.tang@unisoc.com>");
+MODULE_DESCRIPTION("DSI Low-level registers operation for Unisoc DSI_CTRL RXP0");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.h b/drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.h
new file mode 100644
index 0000000..ede010b
--- /dev/null
+++ b/drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.h
@@ -0,0 +1,1417 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2019 Unisoc Inc.
+ */
+
+#ifndef _MIPI_DSI_R1P0_H_
+#define _MIPI_DSI_R1P0_H_
+
+#include <asm/types.h>
+
+struct dsi_reg {
+	union _0x00 {
+		u32 val;
+		struct _DSI_VERSION {
+		u32 dsi_version: 16;
+		u32 reserved: 16;
+		} bits;
+	} DSI_VERSION;
+
+	union _0x04 {
+		u32 val;
+		struct _SOFT_RESET {
+		/*
+		 * This bit configures the core either to work normal or to
+		 * reset. It's default value is 0. After the core configur-
+		 * ation, to enable the mipi_dsi_host, set this register to 1.
+		 * 1: power up     0: reset core
+		 */
+		u32 dsi_soft_reset: 1;
+
+		u32 reserved: 31;
+		} bits;
+	} SOFT_RESET;
+
+	union _0x08 {
+		u32 val;
+		struct _PROTOCOL_INT_STS {
+		/* ErrEsc escape entry error from Lane 0 */
+		u32 dphy_errors_0: 1;
+
+		/* ErrSyncEsc low-power data transmission synchronization
+		 * error from Lane 0
+		 */
+		u32 dphy_errors_1: 1;
+
+		/* ErrControl error from Lane 0 */
+		u32 dphy_errors_2: 1;
+
+		/* ErrContentionLP0 LP0 contention error from Lane 0 */
+		u32 dphy_errors_3: 1;
+
+		/* ErrContentionLP1 LP1 contention error from Lane 0 */
+		u32 dphy_errors_4: 1;
+
+		/* debug mode protocol errors */
+		u32 protocol_debug_err: 11;
+
+		/* SoT error from the Acknowledge error report */
+		u32 ack_with_err_0: 1;
+
+		/* SoT Sync error from the Acknowledge error report */
+		u32 ack_with_err_1: 1;
+
+		/* EoT Sync error from the Acknowledge error report */
+		u32 ack_with_err_2: 1;
+
+		/* Escape Mode Entry Command error from the Acknowledge
+		 * error report
+		 */
+		u32 ack_with_err_3: 1;
+
+		/* LP Transmit Sync error from the Acknowledge error report */
+		u32 ack_with_err_4: 1;
+
+		/* Peripheral Timeout error from the Acknowledge error report */
+		u32 ack_with_err_5: 1;
+
+		/* False Control error from the Acknowledge error report */
+		u32 ack_with_err_6: 1;
+
+		/* reserved (specific to device) from the Acknowledge error
+		 * report
+		 */
+		u32 ack_with_err_7: 1;
+
+		/* ECC error, single-bit (detected and corrected) from the
+		 * Acknowledge error report
+		 */
+		u32 ack_with_err_8: 1;
+
+		/* ECC error, multi-bit (detected, not corrected) from the
+		 * Acknowledge error report
+		 */
+		u32 ack_with_err_9: 1;
+
+		/* checksum error (long packet only) from the Acknowledge
+		 * error report
+		 */
+		u32 ack_with_err_10: 1;
+
+		/* not recognized DSI data type from the Acknowledge error
+		 * report
+		 */
+		u32 ack_with_err_11: 1;
+
+		/* DSI VC ID Invalid from the Acknowledge error report */
+		u32 ack_with_err_12: 1;
+
+		/* invalid transmission length from the Acknowledge error
+		 * report
+		 */
+		u32 ack_with_err_13: 1;
+
+		/* reserved (specific to device) from the Acknowledge error
+		 * report
+		 */
+		u32 ack_with_err_14: 1;
+
+		/* DSI protocol violation from the Acknowledge error report */
+		u32 ack_with_err_15: 1;
+
+		} bits;
+	} PROTOCOL_INT_STS;
+
+	union _0x0C {
+		u32 val;
+		struct _MASK_PROTOCOL_INT {
+		u32 mask_dphy_errors_0: 1;
+		u32 mask_dphy_errors_1: 1;
+		u32 mask_dphy_errors_2: 1;
+		u32 mask_dphy_errors_3: 1;
+		u32 mask_dphy_errors_4: 1;
+		u32 mask_protocol_debug_err: 11;
+		u32 mask_ack_with_err_0: 1;
+		u32 mask_ack_with_err_1: 1;
+		u32 mask_ack_with_err_2: 1;
+		u32 mask_ack_with_err_3: 1;
+		u32 mask_ack_with_err_4: 1;
+		u32 mask_ack_with_err_5: 1;
+		u32 mask_ack_with_err_6: 1;
+		u32 mask_ack_with_err_7: 1;
+		u32 mask_ack_with_err_8: 1;
+		u32 mask_ack_with_err_9: 1;
+		u32 mask_ack_with_err_10: 1;
+		u32 mask_ack_with_err_11: 1;
+		u32 mask_ack_with_err_12: 1;
+		u32 mask_ack_with_err_13: 1;
+		u32 mask_ack_with_err_14: 1;
+		u32 mask_ack_with_err_15: 1;
+		} bits;
+	} MASK_PROTOCOL_INT;
+
+	union _0x10 {
+		u32 val;
+		struct _INTERNAL_INT_STS {
+		/* This bit indicates that the packet size error is detected
+		 * during the packet reception.
+		 */
+		u32 receive_pkt_size_err: 1;
+
+		/* This bit indicates that the EoTp packet is not received at
+		 * the end of the incoming peripheral transmission
+		 */
+		u32 eotp_not_receive_err: 1;
+
+		/* This bit indicates that the system tried to write a command
+		 * through the Generic interface and the FIFO is full. There-
+		 * fore, the command is not written.
+		 */
+		u32 gen_cmd_cmd_fifo_wr_err: 1;
+
+		/* This bit indicates that during a DCS read data, the payload
+		 * FIFO becomes	empty and the data sent to the interface is
+		 * corrupted.
+		 */
+		u32 gen_cmd_rdata_fifo_rd_err: 1;
+
+		/* This bit indicates that during a generic interface packet
+		 * read back, the payload FIFO becomes full and the received
+		 * data is corrupted.
+		 */
+		u32 gen_cmd_rdata_fifo_wr_err: 1;
+
+		/* This bit indicates that the system tried to write a payload
+		 * data through the Generic interface and the FIFO is full.
+		 * Therefore, the payload is not written.
+		 */
+		u32 gen_cmd_wdata_fifo_wr_err: 1;
+
+		/* This bit indicates that during a Generic interface packet
+		 * build, the payload FIFO becomes empty and corrupt data is
+		 * sent.
+		 */
+		u32 gen_cmd_wdata_fifo_rd_err: 1;
+
+		/* This bit indicates that during a DPI pixel line storage,
+		 * the payload FIFO becomes full and the data stored is
+		 * corrupted.
+		 */
+		u32 dpi_pix_fifo_wr_err: 1;
+
+		/* internal debug error	*/
+		u32 internal_debug_err: 19;
+
+		/* This bit indicates that the ECC single error is detected
+		 * and corrected in a received packet.
+		 */
+		u32 ecc_single_err: 1;
+
+		/* This bit indicates that the ECC multiple error is detected
+		 * in a received packet.
+		 */
+		u32 ecc_multi_err: 1;
+
+		/* This bit indicates that the CRC error is detected in the
+		 * received packet payload.
+		 */
+		u32 crc_err: 1;
+
+		/* This bit indicates that the high-speed transmission timeout
+		 * counter reached the end and contention is detected.
+		 */
+		u32 hs_tx_timeout: 1;
+
+		/* This bit indicates that the low-power reception timeout
+		 * counter reached the end and contention is detected.
+		 */
+		u32 lp_rx_timeout: 1;
+
+		} bits;
+	} INTERNAL_INT_STS;
+
+	union _0x14 {
+		u32 val;
+		struct _MASK_INTERNAL_INT {
+		u32 mask_receive_pkt_size_err: 1;
+		u32 mask_eopt_not_receive_err: 1;
+		u32 mask_gen_cmd_cmd_fifo_wr_err: 1;
+		u32 mask_gen_cmd_rdata_fifo_rd_err: 1;
+		u32 mask_gen_cmd_rdata_fifo_wr_err: 1;
+		u32 mask_gen_cmd_wdata_fifo_wr_err: 1;
+		u32 mask_gen_cmd_wdata_fifo_rd_err: 1;
+		u32 mask_dpi_pix_fifo_wr_err: 1;
+		u32 mask_internal_debug_err: 19;
+		u32 mask_ecc_single_err: 1;
+		u32 mask_ecc_multi_err: 1;
+		u32 mask_crc_err: 1;
+		u32 mask_hs_tx_timeout: 1;
+		u32 mask_lp_rx_timeout: 1;
+		} bits;
+	} MASK_INTERNAL_INT;
+
+	union _0x18 {
+		u32 val;
+		struct _DSI_MODE_CFG {
+		/* This bit configures the operation mode
+		 * 0: Video mode ;   1: Command mode
+		 */
+		u32 cmd_video_mode: 1;
+
+		u32 reserved: 31;
+
+		} bits;
+	} DSI_MODE_CFG;
+
+	union _0x1C {
+		u32 val;
+		struct _VIRTUAL_CHANNEL_ID {
+		/* This field indicates the Generic interface read-back
+		 * virtual channel identification
+		 */
+		u32 gen_rx_vcid: 2;
+
+		/* This field configures the DPI virtual channel id that
+		 * is indexed to the VIDEO mode packets
+		 */
+		u32 video_pkt_vcid: 2;
+
+		u32 reserved: 28;
+
+		} bits;
+	} VIRTUAL_CHANNEL_ID;
+
+	union _0x20 {
+		u32 val;
+		struct _DPI_VIDEO_FORMAT {
+		/*
+		 * This field configures the DPI color coding as follows:
+		 * 0000: 16-bit configuration 1
+		 * 0001: 16-bit configuration 2
+		 * 0010: 16-bit configuration 3
+		 * 0011: 18-bit configuration 1
+		 * 0100: 18-bit configuration 2
+		 * 0101: 24-bit
+		 * 0110: 20-bit YCbCr 4:2:2 loosely packed
+		 * 0111: 24-bit YCbCr 4:2:2
+		 * 1000: 16-bit YCbCr 4:2:2
+		 * 1001: 30-bit
+		 * 1010: 36-bit
+		 * 1011: 12-bit YCbCr 4:2:0
+		 * 1100: Compression Display Stream
+		 * 1101-1111: 12-bit YCbCr 4:2:0
+		 */
+		u32 dpi_video_mode_format: 6;
+
+		/* When set to 1, this bit activates loosely packed
+		 * variant to 18-bit configurations
+		 */
+		u32 loosely18_en: 1;
+
+		u32 reserved: 25;
+
+		} bits;
+	} DPI_VIDEO_FORMAT;
+
+	union _0x24 {
+		u32 val;
+		struct _VIDEO_PKT_CONFIG {
+		/*
+		 * This field configures the number of pixels in a single
+		 * video packet. For 18-bit not loosely packed data types,
+		 * this number must be a multiple of 4. For YCbCr data
+		 * types, it must be a multiple of 2, as described in the
+		 * DSI specification.
+		 */
+		u32 video_pkt_size: 16;
+
+		/*
+		 * This register configures the number of chunks to be
+		 * transmitted during a Line period (a chunk consists of
+		 * a video packet and a null packet). If set to 0 or 1,
+		 * the video line is transmitted in a single packet. If
+		 * set to 1, the packet is part of a chunk, so a null packet
+		 * follows it if vid_null_size > 0. Otherwise, multiple chunks
+		 * are used to transmit each video line.
+		 */
+		u32 video_line_chunk_num: 16;
+
+		} bits;
+	} VIDEO_PKT_CONFIG;
+
+	union _0x28 {
+		u32 val;
+		struct _VIDEO_LINE_HBLK_TIME {
+		/* This field configures the Horizontal Back Porch period
+		 * in lane byte clock cycles
+		 */
+		u32 video_line_hbp_time: 16;
+
+		/* This field configures the Horizontal Synchronism Active
+		 * period in lane byte clock cycles
+		 */
+		u32 video_line_hsa_time: 16;
+
+		} bits;
+	} VIDEO_LINE_HBLK_TIME;
+
+	union _0x2C {
+		u32 val;
+		struct _VIDEO_LINE_TIME {
+		/* This field configures the size of the total line time
+		 * (HSA+HBP+HACT+HFP) counted in lane byte clock cycles
+		 */
+		u32 video_line_time: 16;
+
+		u32 reserved: 16;
+
+		} bits;
+	} VIDEO_LINE_TIME;
+
+	union _0x30 {
+		u32 val;
+		struct _VIDEO_VBLK_LINES {
+		/* This field configures the Vertical Front Porch period
+		 * measured in number of horizontal lines
+		 */
+		u32 vfp_lines: 10;
+
+		/* This field configures the Vertical Back Porch period
+		 * measured in number of horizontal lines
+		 */
+		u32 vbp_lines: 10;
+
+		/* This field configures the Vertical Synchronism Active
+		 * period measured in number of horizontal lines
+		 */
+		u32 vsa_lines: 10;
+
+		u32 reserved: 2;
+
+		} bits;
+	} VIDEO_VBLK_LINES;
+
+	union _0x34 {
+		u32 val;
+		struct _VIDEO_VACTIVE_LINES {
+		/* This field configures the Vertical Active period measured
+		 * in number of horizontal lines
+		 */
+		u32 vactive_lines: 14;
+
+		u32 reserved: 18;
+
+		} bits;
+	} VIDEO_VACTIVE_LINES;
+
+	union _0x38 {
+		u32 val;
+		struct _VID_MODE_CFG {
+		/*
+		 * This field indicates the video mode transmission type as
+		 * follows:
+		 * 00: Non-burst with sync pulses
+		 * 01: Non-burst with sync events
+		 * 10 and 11: Burst mode
+		 */
+		u32 vid_mode_type: 2;
+
+		u32 reserved_0: 6;
+
+		/* When set to 1, this bit enables the return to low-power
+		 * inside the VSA period when timing allows.
+		 */
+		u32 lp_vsa_en: 1;
+
+		/* When set to 1, this bit enables the return to low-power
+		 * inside the VBP period when timing allows.
+		 */
+		u32 lp_vbp_en: 1;
+
+		/* When set to 1, this bit enables the return to low-power
+		 * inside the VFP period when timing allows.
+		 */
+		u32 lp_vfp_en: 1;
+
+		/* When set to 1, this bit enables the return to low-power
+		 * inside the VACT period when timing allows.
+		 */
+		u32 lp_vact_en: 1;
+
+		/* When set to 1, this bit enables the return to low-power
+		 * inside the HBP period when timing allows.
+		 */
+		u32 lp_hbp_en: 1;
+
+		/* When set to 1, this bit enables the return to low-power
+		 * inside the HFP period when timing allows.
+		 */
+		u32 lp_hfp_en: 1;
+
+		/* When set to 1, this bit enables the request for an ack-
+		 * nowledge response at the end of a frame.
+		 */
+		u32 frame_bta_ack_en: 1;
+
+		/* When set to 1, this bit enables the command transmission
+		 * only in low-power mode.
+		 */
+		u32 lp_cmd_en: 1;
+
+		u32 reserved_1: 16;
+
+		} bits;
+	} VID_MODE_CFG;
+
+	union _0x3C {
+		u32 val;
+		struct _SDF_MODE_CONFIG {
+		/*
+		 * This field defines the 3D mode on/off & display orientation:
+		 * 00: 3D mode off (2D mode on)
+		 * 01: 3D mode on, portrait orientation
+		 * 10: 3D mode on, landscape orientation
+		 * 11: Reserved
+		 */
+		u32 rf_3d_mode: 2;
+
+		/*
+		 * This field defines the 3D image format:
+		 * 00: Line (alternating lines of left and right data)
+		 * 01: Frame (alternating frames of left and right data)
+		 * 10: Pixel (alternating pixels of left and right data)
+		 * 11: Reserved
+		 */
+		u32 rf_3d_format: 2;
+
+		/*
+		 * This field defines whether there is a second VSYNC pulse
+		 * between Left and Right Images, when 3D Image Format is
+		 * Frame-based:
+		 * 0: No sync pulses between left and right data
+		 * 1: Sync pulse (HSYNC, VSYNC, blanking) between left and
+		 *    right data
+		 */
+		u32 second_vsync_en: 1;
+
+		/*
+		 * This bit defines the left or right order:
+		 * 0: Left eye data is sent first, and then the right eye data
+		 *    is sent.
+		 * 1: Right eye data is sent first, and then the left eye data
+		 *    is sent.
+		 */
+		u32 left_right_order: 1;
+
+		u32 reserved_0: 2;
+
+		/*
+		 * When set, causes the next VSS packet to include 3D control
+		 * payload in every VSS packet.
+		 */
+		u32 rf_3d_payload_en: 1;
+
+		u32 reserved_1: 23;
+
+		} bits;
+	} SDF_MODE_CONFIG;
+
+	union _0x40 {
+		u32 val;
+		struct _TIMEOUT_CNT_CLK_CONFIG {
+		/*
+		 * This field indicates the division factor for the Time Out
+		 * clock used as the timing unit in the configuration of HS to
+		 * LP and LP to HS transition error.
+		 */
+		u32 timeout_cnt_clk_config: 16;
+
+		u32 reserved: 16;
+
+		} bits;
+	} TIMEOUT_CNT_CLK_CONFIG;
+
+	union _0x44 {
+		u32 val;
+		struct _HTX_TO_CONFIG {
+		/*
+		 * This field configures the timeout counter that triggers
+		 * a high speed transmission timeout contention detection
+		 * (measured in TO_CLK_DIVISION cycles).
+		 *
+		 * If using the non-burst mode and there is no sufficient
+		 * time to switch from HS to LP and back in the period which
+		 * is from one line data finishing to the next line sync
+		 * start, the DSI link returns the LP state once per frame,
+		 * then you should configure the TO_CLK_DIVISION and
+		 * hstx_to_cnt to be in accordance with:
+		 * hstx_to_cnt * lanebyteclkperiod * TO_CLK_DIVISION >= the
+		 * time of one FRAME data transmission * (1 + 10%)
+		 *
+		 * In burst mode, RGB pixel packets are time-compressed,
+		 * leaving more time during a scan line. Therefore, if in
+		 * burst mode and there is sufficient time to switch from HS
+		 * to LP and back in the period of time from one line data
+		 * finishing to the next line sync start, the DSI link can
+		 * return LP mode and back in this time interval to save power.
+		 * For this, configure the TO_CLK_DIVISION and hstx_to_cnt
+		 * to be in accordance with:
+		 * hstx_to_cnt * lanebyteclkperiod * TO_CLK_DIVISION >= the
+		 * time of one LINE data transmission * (1 + 10%)
+		 */
+		u32 htx_to_cnt_limit: 32;
+		} bits;
+	} HTX_TO_CONFIG;
+
+	union _0x48 {
+		u32 val;
+		struct _LRX_H_TO_CONFIG {
+		/*
+		 * This field configures the timeout counter that triggers
+		 * a low-power reception timeout contention detection (measured
+		 * in TO_CLK_DIVISION cycles).
+		 */
+		u32 lrx_h_to_cnt_limit: 32;
+		} bits;
+	} LRX_H_TO_CONFIG;
+
+	union _0x4C {
+		u32 val;
+		struct _RD_PRESP_TO_CONFIG {
+		/*
+		 * This field sets a period for which the DWC_mipi_dsi_host
+		 * keeps the link still, after sending a low-power read oper-
+		 * ation. This period is measured in cycles of lanebyteclk.
+		 * The counting starts when the D-PHY enters the Stop state
+		 * and causes no interrupts.
+		 */
+		u32 lprd_presp_to_cnt_limit: 16;
+
+		/*
+		 * This field sets a period for which the DWC_mipi_dsi_host
+		 * keeps the link still, after sending a high-speed read oper-
+		 * ation. This period is measured in cycles of lanebyteclk.
+		 * The counting starts when the D-PHY enters the Stop state
+		 * and causes no interrupts.
+		 */
+		u32 hsrd_presp_to_cnt_limit: 16;
+
+		} bits;
+	} RD_PRESP_TO_CONFIG;
+
+	union _0x50 {
+		u32 val;
+		struct _HSWR_PRESP_TO_CONFIG {
+		/*
+		 * This field sets a period for which the DWC_mipi_dsi_host
+		 * keeps the link inactive after sending a high-speed write
+		 * operation. This period is measured in cycles of lanebyteclk.
+		 * The counting starts when the D-PHY enters the Stop state
+		 * and causes no interrupts.
+		 */
+		u32 hswr_presp_to_cnt_limit: 16;
+
+		u32 reserved_0: 8;
+
+		/*
+		 * When set to 1, this bit ensures that the peripheral response
+		 * timeout caused by hs_wr_to_cnt is used only once per eDPI
+		 * frame, when both the following conditions are met:
+		 * dpivsync_edpiwms has risen and fallen.
+		 * Packets originated from eDPI have been transmitted and its
+		 * FIFO is empty again In this scenario no non-eDPI requests
+		 * are sent to the D-PHY, even if there is traffic from generic
+		 * or DBI ready to be sent, making it return to stop state.
+		 * When it does so, PRESP_TO counter is activated and only when
+		 * it finishes does the controller send any other traffic that
+		 * is ready.
+		 */
+		u32 hswr_presp_to_mode: 1;
+
+		u32 reserved_1: 7;
+
+		} bits;
+	} HSWR_PRESP_TO_CONFIG;
+
+	union _0x54 {
+		u32 val;
+		struct _LPWR_PRESP_TO_CONFIG {
+		/*
+		 * This field sets a period for which the DWC_mipi_dsi_host
+		 * keeps the link still, after sending a low-power write oper-
+		 * ation. This period is measured in cycles of lanebyteclk.
+		 * The counting starts when the D-PHY enters the Stop state
+		 * and causes no interrupts.
+		 */
+		u32 lpwr_presp_to_cnt_limit: 16;
+
+		u32 reserved: 16;
+
+		} bits;
+	} LPWR_PRESP_TO_CONFIG;
+
+	union _0x58 {
+		u32 val;
+		struct _BTA_PRESP_TO_CONFIG {
+		/*
+		 * This field sets a period for which the DWC_mipi_dsi_host
+		 * keeps the link still, after completing a Bus Turn-Around.
+		 * This period is measured in cycles of lanebyteclk. The
+		 * counting starts when the D-PHY enters the Stop state and
+		 * causes no interrupts.
+		 */
+		u32 bta_presp_to_cnt_limit: 16;
+
+		u32 reserved: 16;
+
+		} bits;
+	} BTA_PRESP_TO_CONFIG;
+
+	union _0x5C {
+		u32 val;
+		struct _TX_ESC_CLK_CONFIG {
+		/*
+		 * This field indicates the division factor for the TX Escape
+		 * clock source (lanebyteclk). The values 0 and 1 stop the
+		 * TX_ESC clock generation.
+		 */
+		u32 tx_esc_clk_config: 16;
+
+		u32 reserved: 16;
+
+		} bits;
+	} TX_ESC_CLK_CONFIG;
+
+	union _0x60 {
+		u32 val;
+		struct _VACT_CMD_TRANS_LIMIT {
+		/*
+		 * This field is used for the transmission of commands in
+		 * low-power mode. It defines the size, in bytes, of the
+		 * largest packet that can fit in a line during the VACT
+		 * region.
+		 */
+		u32 vact_cmd_trans_limit: 8;
+
+		u32 reserved: 24;
+
+		} bits;
+	} VACT_CMD_TRANS_LIMIT;
+
+	union _0x64 {
+		u32 val;
+		struct _VBLK_CMD_TRANS_LIMIT {
+		/*
+		 * This field is used for the transmission of commands in
+		 * low-power mode. It defines the size, in bytes, of the
+		 * largest packet that can fit in a line during the VSA, VBP,
+		 * and VFP regions.
+		 */
+		u32 vblk_cmd_trans_limit: 8;
+
+		u32 reserved: 24;
+
+		} bits;
+	} VBLK_CMD_TRANS_LIMIT;
+
+	union _0x68 {
+		u32 val;
+		struct _CMD_MODE_CFG {
+		/*
+		 * When set to 1, this bit enables the tearing effect
+		 * acknowledge request.
+		 */
+		u32 tear_fx_en: 1;
+
+		/*
+		 * When set to 1, this bit enables the acknowledge request
+		 * after each packet transmission.
+		 */
+		u32 ack_rqst_en: 1;
+
+		u32 reserved_0: 3;
+
+		u32 pps_tx: 1;
+		u32 exq_tx: 1;
+		u32 cmc_tx: 1;
+
+		/*
+		 * This bit configures the Generic short write packet with
+		 * zero parameter command transmission type:
+		 * 0: High-speed 1: Low-power
+		 */
+		u32 gen_sw_0p_tx: 1;
+
+		/*
+		 * This bit configures the Generic short write packet with
+		 * one parameter command transmission type:
+		 * 0: High-speed 1: Low-power
+		 */
+		u32 gen_sw_1p_tx: 1;
+
+		/*
+		 * This bit configures the Generic short write packet with
+		 * two parameters command transmission type:
+		 * 0: High-speed 1: Low-power
+		 */
+		u32 gen_sw_2p_tx: 1;
+
+		/*
+		 * This bit configures the Generic short read packet with
+		 * zero parameter command transmission type:
+		 * 0: High-speed 1: Low-power
+		 */
+		u32 gen_sr_0p_tx: 1;
+
+		/*
+		 * This bit configures the Generic short read packet with
+		 * one parameter command transmission type:
+		 * 0: High-speed 1: Low-power
+		 */
+		u32 gen_sr_1p_tx: 1;
+
+		/*
+		 * This bit configures the Generic short read packet with
+		 * two parameters command transmission type:
+		 * 0: High-speed 1: Low-power
+		 */
+		u32 gen_sr_2p_tx: 1;
+
+		/*
+		 * This bit configures the Generic long write packet command
+		 * transmission type:
+		 * 0: High-speed 1: Low-power
+		 */
+		u32 gen_lw_tx: 1;
+
+		u32 reserved_1: 1;
+
+		/*
+		 * This bit configures the DCS short write packet with zero
+		 * parameter command transmission type:
+		 * 0: High-speed 1: Low-power
+		 */
+		u32 dcs_sw_0p_tx: 1;
+
+		/*
+		 * This bit configures the DCS short write packet with one
+		 * parameter command transmission type:
+		 * 0: High-speed 1: Low-power
+		 */
+		u32 dcs_sw_1p_tx: 1;
+
+		/*
+		 * This bit configures the DCS short read packet with zero
+		 * parameter command transmission type:
+		 * 0: High-speed 1: Low-power
+		 */
+		u32 dcs_sr_0p_tx: 1;
+
+		/*
+		 * This bit configures the DCS long write packet command
+		 * transmission type:
+		 * 0: High-speed 1: Low-power
+		 */
+		u32 dcs_lw_tx: 1;
+
+		u32 reserved_2: 4;
+
+		/*
+		 * This bit configures the maximum read packet size command
+		 * transmission type:
+		 * 0: High-speed 1: Low-power
+		 */
+		u32 max_rd_pkt_size: 1;
+
+		u32 reserved_3: 7;
+
+		} bits;
+	} CMD_MODE_CFG;
+
+	union _0x6C {
+		u32 val;
+		struct _GEN_HDR {
+		/*
+		 * This field configures the packet data type of the header
+		 * packet.
+		 */
+		u32 gen_dt: 6;
+
+		/*
+		 * This field configures the virtual channel id of the header
+		 * packet.
+		 */
+		u32 gen_vc: 2;
+
+		/*
+		 * This field configures the least significant byte of the
+		 * header packet's Word count for long packets or data 0 for
+		 * short packets.
+		 */
+		u32 gen_wc_lsbyte: 8;
+
+		/*
+		 * This field configures the most significant byte of the
+		 * header packet's word count for long packets or data 1 for
+		 * short packets.
+		 */
+		u32 gen_wc_msbyte: 8;
+
+		u32 reserved: 8;
+
+		} bits;
+	} GEN_HDR;
+
+	union _0x70 {
+		u32 val;
+		struct _GEN_PLD_DATA {
+		/* This field indicates byte 1 of the packet payload. */
+		u32 gen_pld_b1: 8;
+
+		/* This field indicates byte 2 of the packet payload. */
+		u32 gen_pld_b2: 8;
+
+		/* This field indicates byte 3 of the packet payload. */
+		u32 gen_pld_b3: 8;
+
+		/* This field indicates byte 4 of the packet payload. */
+		u32 gen_pld_b4: 8;
+
+		} bits;
+	} GEN_PLD_DATA;
+
+	union _0x74 {
+		u32 val;
+		struct _PHY_CLK_LANE_LP_CTRL {
+		/* This bit controls the D-PHY PPI txrequestclkhs signal */
+		u32 phy_clklane_tx_req_hs: 1;
+
+		/* This bit enables the automatic mechanism to stop providing
+		 * clock in the clock lane when time allows.
+		 */
+		u32 auto_clklane_ctrl_en: 1;
+
+		u32 reserved: 30;
+		} bits;
+	} PHY_CLK_LANE_LP_CTRL;
+
+	union _0x78 {
+		u32 val;
+		struct _PHY_INTERFACE_CTRL {
+		/* When set to 0, this bit places the D-PHY macro in power-
+		 * down state.
+		 */
+		u32 rf_phy_shutdown: 1;
+
+		/* When set to 0, this bit places the digital section of the
+		 * D-PHY in the reset state.
+		 */
+		u32 rf_phy_reset_n: 1;
+
+		/* When set to 1, this bit enables the D-PHY Clock Lane
+		 * module.
+		 */
+		u32 rf_phy_clk_en: 1;
+
+		/* When the D-PHY is in ULPS, this bit enables the D-PHY PLL. */
+		u32 rf_phy_force_pll: 1;
+
+		/* ULPS mode Request on clock lane */
+		u32 rf_phy_clk_txrequlps: 1;
+
+		/* ULPS mode Exit on clock lane */
+		u32 rf_phy_clk_txexitulps: 1;
+
+		/* ULPS mode Request on all active data lanes */
+		u32 rf_phy_data_txrequlps: 1;
+
+		/* ULPS mode Exit on all active data lanes */
+		u32 rf_phy_data_txexitulps: 1;
+
+		u32 reserved: 24;
+		} bits;
+	} PHY_INTERFACE_CTRL;
+
+	union _0x7C {
+		u32 val;
+		struct _PHY_TX_TRIGGERS {
+		/* This field controls the trigger transmissions. */
+		u32 phy_tx_triggers: 4;
+
+		u32 reserved: 28;
+		} bits;
+	} PHY_TX_TRIGGERS;
+
+	union _0x80 {
+		u32 val;
+		struct _DESKEW_START {
+		u32 deskew_start: 1;
+		u32 reserved: 31;
+		} bits;
+	} DESKEW_START;
+
+	union _0x84 {
+		u32 val;
+		struct _DESKEW_MODE {
+		u32 deskew_mode: 2;
+		u32 reserved: 30;
+		} bits;
+	} DESKEW_MODE;
+
+	union _0x88 {
+		u32 val;
+		struct _DESKEW_TIME {
+		u32 deskew_time: 32;
+		} bits;
+	} DESKEW_TIME;
+
+	union _0x8C {
+		u32 val;
+		struct _DESKEW_PERIOD {
+		u32 deskew_period: 32;
+		} bits;
+	} DESKEW_PERIOD;
+
+	union _0x90 {
+		u32 val;
+		struct _DESKEW_BUSY {
+		u32 deskew_busy: 1;
+		u32 reserved: 31;
+		} bits;
+	} DESKEW_BUSY;
+
+	union _0x94 {
+		u32 val;
+		struct _DESKEW_LANE_MASK {
+		u32 deskew_lane0_mask: 1;
+		u32 deskew_lane1_mask: 1;
+		u32 deskew_lane2_mask: 1;
+		u32 deskew_lane3_mask: 1;
+		u32 reserved: 28;
+		} bits;
+	} DESKEW_LANE_MASK;
+
+	union _0x98 {
+		u32 val;
+		struct _CMD_MODE_STATUS {
+		/*
+		 * This bit is set when a read command is issued and cleared
+		 * when the entire response is stored in the FIFO.
+		 * Value after reset: 0x0
+		 *
+		 * NOTE:
+		 * For mipi-dsi-r1p0 IP, this bit is set immediately when
+		 *     the read cmd is set to the GEN_HDR register.
+		 *
+		 * For dsi-ctrl-r1p0 IP, this bit is set only after the read
+		 *     cmd was actually sent out from the controller.
+		 */
+		u32 gen_cmd_rdcmd_ongoing: 1;
+
+		/*
+		 * This bit indicates the empty status of the generic read
+		 * payload FIFO.
+		 * Value after reset: 0x1
+		 */
+		u32 gen_cmd_rdata_fifo_empty: 1;
+
+		/*
+		 * This bit indicates the full status of the generic read
+		 * payload FIFO.
+		 * Value after reset: 0x0
+		 */
+		u32 gen_cmd_rdata_fifo_full: 1;
+
+		/*
+		 * This bit indicates the empty status of the generic write
+		 * payload FIFO.
+		 * Value after reset: 0x1
+		 */
+		u32 gen_cmd_wdata_fifo_empty: 1;
+
+		/*
+		 * This bit indicates the full status of the generic write
+		 * payload FIFO.
+		 * Value after reset: 0x0
+		 */
+		u32 gen_cmd_wdata_fifo_full: 1;
+
+		/*
+		 * This bit indicates the empty status of the generic
+		 * command FIFO.
+		 * Value after reset: 0x1
+		 */
+		u32 gen_cmd_cmd_fifo_empty: 1;
+
+		/*
+		 * This bit indicates the full status of the generic
+		 * command FIFO.
+		 * Value after reset: 0x0
+		 */
+		u32 gen_cmd_cmd_fifo_full: 1;
+
+		/*
+		 * This bit is set when the entire response of read is
+		 * stored in the rx payload FIFO. And it will be cleared
+		 * automaticlly after read this bit each time.
+		 * Value after reset: 0x0
+		 *
+		 * NOTE: this bit is just supported for dsi-ctrl-r1p0 IP
+		 */
+		u32 gen_cmd_rdcmd_done: 1;
+
+		u32 reserved : 24;
+
+		} bits;
+	} CMD_MODE_STATUS;
+
+	union _0x9C {
+		u32 val;
+		struct _PHY_STATUS {
+		/* the status of phydirection D-PHY signal */
+		u32 phy_direction: 1;
+
+		/* the status of phylock D-PHY signal */
+		u32 phy_lock: 1;
+
+		/* the status of rxulpsesc0lane D-PHY signal */
+		u32 phy_rxulpsesc0lane: 1;
+
+		/* the status of phystopstateclklane D-PHY signal */
+		u32 phy_stopstateclklane: 1;
+
+		/* the status of phystopstate0lane D-PHY signal */
+		u32 phy_stopstate0lane: 1;
+
+		/* the status of phystopstate1lane D-PHY signal */
+		u32 phy_stopstate1lane: 1;
+
+		/* the status of phystopstate2lane D-PHY signal */
+		u32 phy_stopstate2lane: 1;
+
+		/* the status of phystopstate3lane D-PHY signal */
+		u32 phy_stopstate3lane: 1;
+
+		/* the status of phyulpsactivenotclk D-PHY signal */
+		u32 phy_ulpsactivenotclk: 1;
+
+		/* the status of ulpsactivenot0lane D-PHY signal */
+		u32 phy_ulpsactivenot0lane: 1;
+
+		/* the status of ulpsactivenot1lane D-PHY signal */
+		u32 phy_ulpsactivenot1lane: 1;
+
+		/* the status of ulpsactivenot2lane D-PHY signal */
+		u32 phy_ulpsactivenot2lane: 1;
+
+		/* the status of ulpsactivenot3lane D-PHY signal */
+		u32 phy_ulpsactivenot3lane: 1;
+
+		u32 reserved: 19;
+
+		} bits;
+	} PHY_STATUS;
+
+	union _0xA0 {
+		u32 val;
+		struct _PHY_MIN_STOP_TIME {
+		/* This field configures the minimum wait period to request
+		 * a high-speed transmission after the Stop state.
+		 */
+		u32 phy_min_stop_time: 8;
+
+		u32 reserved: 24;
+		} bits;
+	} PHY_MIN_STOP_TIME;
+
+	union _0xA4 {
+		u32 val;
+		struct _PHY_LANE_NUM_CONFIG {
+		/*
+		 * This field configures the number of active data lanes:
+		 * 00: One data lane (lane 0)
+		 * 01: Two data lanes (lanes 0 and 1)
+		 * 10: Three data lanes (lanes 0, 1, and 2)
+		 * 11: Four data lanes (lanes 0, 1, 2, and 3)
+		 */
+		u32 phy_lane_num: 2;
+
+		u32 reserved: 30;
+
+		} bits;
+	} PHY_LANE_NUM_CONFIG;
+
+	union _0xA8 {
+		u32 val;
+		struct _PHY_CLKLANE_TIME_CONFIG {
+		/*
+		 * This field configures the maximum time that the D-PHY
+		 * clock lane takes to go from low-power to high-speed
+		 * transmission measured in lane byte clock cycles.
+		 */
+		u32 phy_clklane_lp_to_hs_time: 16;
+
+		/*
+		 * This field configures the maximum time that the D-PHY
+		 * clock lane takes to go from high-speed to low-power
+		 * transmission measured in lane byte clock cycles.
+		 */
+		u32 phy_clklane_hs_to_lp_time: 16;
+
+		} bits;
+	} PHY_CLKLANE_TIME_CONFIG;
+
+	union _0xAC {
+		u32 val;
+		struct _PHY_DATALANE_TIME_CONFIG {
+		/*
+		 * This field configures the maximum time that the D-PHY data
+		 * lanes take to go from low-power to high-speed transmission
+		 * measured in lane byte clock cycles.
+		 */
+		u32 phy_datalane_lp_to_hs_time: 16;
+
+		/*
+		 * This field configures the maximum time that the D-PHY data
+		 * lanes take to go from high-speed to low-power transmission
+		 * measured in lane byte clock cycles.
+		 */
+		u32 phy_datalane_hs_to_lp_time: 16;
+
+		} bits;
+	} PHY_DATALANE_TIME_CONFIG;
+
+	union _0xB0 {
+		u32 val;
+		struct _MAX_READ_TIME {
+		/*
+		 * This field configures the maximum time required to perform
+		 * a read command in lane byte clock cycles. This register can
+		 * only be modified when no read command is in progress.
+		 */
+		u32 max_rd_time: 16;
+
+		u32 reserved: 16;
+
+		} bits;
+	} MAX_READ_TIME;
+
+	union _0xB4 {
+		u32 val;
+		struct _RX_PKT_CHECK_CONFIG {
+		/* When set to 1, this bit enables the ECC reception, error
+		 * correction, and reporting.
+		 */
+		u32 rx_pkt_ecc_en: 1;
+
+		/* When set to 1, this bit enables the CRC reception and error
+		 * reporting.
+		 */
+		u32 rx_pkt_crc_en: 1;
+
+		u32 reserved: 30;
+
+		} bits;
+	} RX_PKT_CHECK_CONFIG;
+
+	union _0xB8 {
+		u32 val;
+		struct _TA_EN {
+		/* When set to 1, this bit enables the Bus Turn-Around (BTA)
+		 * request.
+		 */
+		u32 ta_en: 1;
+
+		u32 reserved: 31;
+
+		} bits;
+	} TA_EN;
+
+	union _0xBC {
+		u32 val;
+		struct _EOTP_EN {
+		/* When set to 1, this bit enables the EoTp transmission */
+		u32 tx_eotp_en: 1;
+
+		/* When set to 1, this bit enables the EoTp reception. */
+		u32 rx_eotp_en: 1;
+
+		u32 reserved: 30;
+
+		} bits;
+	} EOTP_EN;
+
+	union _0xC0 {
+		u32 val;
+		struct _VIDEO_NULLPKT_SIZE {
+		/*
+		 * This register configures the number of bytes inside a null
+		 * packet. Setting it to 0 disables the null packets.
+		 */
+		u32 video_nullpkt_size: 13;
+
+		u32 reserved: 19;
+
+		} bits;
+	} VIDEO_NULLPKT_SIZE;
+
+	union _0xC4 {
+		u32 val;
+		struct _DCS_WM_PKT_SIZE {
+		/*
+		 * This field configures the maximum allowed size for an eDPI
+		 * write memory command, measured in pixels. Automatic parti-
+		 * tioning of data obtained from eDPI is permanently enabled.
+		 */
+		u32 dcs_wm_pkt_size: 16;
+
+		u32 reserved: 16;
+		} bits;
+	} DCS_WM_PKT_SIZE;
+
+	union _0xC8 {
+		u32 val;
+		struct _PROTOCOL_INT_CLR {
+		u32 clr_dphy_errors_0: 1;
+		u32 clr_dphy_errors_1: 1;
+		u32 clr_dphy_errors_2: 1;
+		u32 clr_dphy_errors_3: 1;
+		u32 clr_dphy_errors_4: 1;
+		u32 clr_protocol_debug_err: 11;
+		u32 clr_ack_with_err_0: 1;
+		u32 clr_ack_with_err_1: 1;
+		u32 clr_ack_with_err_2: 1;
+		u32 clr_ack_with_err_3: 1;
+		u32 clr_ack_with_err_4: 1;
+		u32 clr_ack_with_err_5: 1;
+		u32 clr_ack_with_err_6: 1;
+		u32 clr_ack_with_err_7: 1;
+		u32 clr_ack_with_err_8: 1;
+		u32 clr_ack_with_err_9: 1;
+		u32 clr_ack_with_err_10: 1;
+		u32 clr_ack_with_err_11: 1;
+		u32 clr_ack_with_err_12: 1;
+		u32 clr_ack_with_err_13: 1;
+		u32 clr_ack_with_err_14: 1;
+		u32 clr_ack_with_err_15: 1;
+		} bits;
+	} PROTOCOL_INT_CLR;
+
+	union _0xCC {
+		u32 val;
+		struct _INTERNAL_INT_CLR {
+		u32 clr_receive_pkt_size_err: 1;
+		u32 clr_eopt_not_receive_err: 1;
+		u32 clr_gen_cmd_cmd_fifo_wr_err: 1;
+		u32 clr_gen_cmd_rdata_fifo_rd_err: 1;
+		u32 clr_gen_cmd_rdata_fifo_wr_err: 1;
+		u32 clr_gen_cmd_wdata_fifo_wr_err: 1;
+		u32 clr_gen_cmd_wdata_fifo_rd_err: 1;
+		u32 clr_dpi_pix_fifo_wr_err: 1;
+		u32 clr_internal_debug_err: 19;
+		u32 clr_ecc_single_err: 1;
+		u32 clr_ecc_multi_err: 1;
+		u32 clr_crc_err: 1;
+		u32 clr_hs_tx_timeout: 1;
+		u32 clr_lp_rx_timeout: 1;
+		} bits;
+	} INTERNAL_INT_CLR;
+
+	union _0xD0 {
+		u32 val;
+		struct _VIDEO_SIG_DELAY_CONFIG {
+
+		/*
+		 * DPI interface signal delay to be used in clk lanebyte
+		 * domain for control logic to read video data from pixel
+		 * memory in mannal mode, measured in clk_lanebyte cycles
+		 */
+		u32 video_sig_delay: 24;
+
+		/*
+		 * 1'b1: mannal mode
+		 *       dsi controller will use video_sig_delay value as
+		 *       the delay for the packet handle logic to read video
+		 *       data from pixel memory.
+		 *
+		 * 1'b0: auto mode
+		 *       dsi controller will auto calculate the delay for
+		 *       the packet handle logic to read video data from
+		 *       pixel memory.
+		 */
+		u32 video_sig_delay_mode: 1;
+
+		u32 reserved: 7;
+		} bits;
+	} VIDEO_SIG_DELAY_CONFIG;
+
+	u32 reservedD4_EC[7];
+
+	union _0xF0 {
+		u32 val;
+		struct _PHY_TST_CTRL0 {
+		/* PHY test interface clear (active high) */
+		u32 phy_testclr: 1;
+
+		/* This bit is used to clock the TESTDIN bus into the D-PHY */
+		u32 phy_testclk: 1;
+
+		u32 reserved: 30;
+		} bits;
+	} PHY_TST_CTRL0;
+
+	union _0xF4 {
+		u32 val;
+		struct _PHY_TST_CTRL1 {
+		/* PHY test interface input 8-bit data bus for internal
+		 * register programming and test functionalities access.
+		 */
+		u32 phy_testdin: 8;
+
+		/* PHY output 8-bit data bus for read-back and internal
+		 * probing functionalities.
+		 */
+		u32 phy_testdout: 8;
+
+		/*
+		 * PHY test interface operation selector:
+		 * 1: The address write operation is set on the falling edge
+		 *    of the testclk signal.
+		 * 0: The data write operation is set on the rising edge of
+		 *    the testclk signal.
+		 */
+		u32 phy_testen: 1;
+
+		u32 reserved: 15;
+		} bits;
+	} PHY_TST_CTRL1;
+
+	u32 reservedF8_1FC[66];
+
+	union _0x200 {
+		u32 val;
+		struct _INT_PLL_STS {
+		u32 int_pll_sts: 1;
+		u32 reserved: 31;
+		} bits;
+	} INT_PLL_STS;
+
+	union _0x204 {
+		u32 val;
+		struct _INT_PLL_MSK {
+		u32 int_pll_msk: 1;
+		u32 reserved: 31;
+		} bits;
+	} INT_PLL_MSK;
+
+	union _0x208 {
+		u32 val;
+		struct _INT_PLL_CLR {
+		u32 int_pll_clr: 1;
+		u32 reserved: 31;
+		} bits;
+	} INT_PLL_CLR;
+
+};
+
+#endif
diff --git a/drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c b/drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c
new file mode 100644
index 0000000..29d818b
--- /dev/null
+++ b/drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c
@@ -0,0 +1,392 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 Unisoc Inc.
+ */
+
+#include <linux/io.h>
+#include <linux/init.h>
+#include <linux/module.h>
+
+#include "dsi_ctrl_r1p0.h"
+#include "sprd_dphy.h"
+
+/*
+ * Reset D-PHY module
+ * @param phy: pointer to structure
+ *  which holds information about the d-phy module
+ * @param reset
+ */
+static void dsi_phy_rstz(struct dphy_context *ctx, int level)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->ctrlbase;
+	union _0x78 phy_interface_ctrl;
+
+	phy_interface_ctrl.val = readl(&reg->PHY_INTERFACE_CTRL);
+	phy_interface_ctrl.bits.rf_phy_reset_n = level;
+
+	writel(phy_interface_ctrl.val, &reg->PHY_INTERFACE_CTRL);
+}
+
+/*
+ * Power up/down D-PHY module
+ * @param phy: pointer to structure
+ *  which holds information about the d-phy module
+ * @param enable (1: shutdown)
+ */
+static void dsi_phy_shutdownz(struct dphy_context *ctx, int level)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->ctrlbase;
+	union _0x78 phy_interface_ctrl;
+
+	phy_interface_ctrl.val = readl(&reg->PHY_INTERFACE_CTRL);
+	phy_interface_ctrl.bits.rf_phy_shutdown = level;
+
+	writel(phy_interface_ctrl.val, &reg->PHY_INTERFACE_CTRL);
+}
+
+/*
+ * Force D-PHY PLL to stay on while in ULPS
+ * @param phy: pointer to structure
+ *  which holds information about the d-phy module
+ * @param force (1) disable (0)
+ * @note To follow the programming model, use wakeup_pll function
+ */
+static void dsi_phy_force_pll(struct dphy_context *ctx, int force)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->ctrlbase;
+	union _0x78 phy_interface_ctrl;
+
+	phy_interface_ctrl.val = readl(&reg->PHY_INTERFACE_CTRL);
+	phy_interface_ctrl.bits.rf_phy_force_pll = force;
+
+	writel(phy_interface_ctrl.val, &reg->PHY_INTERFACE_CTRL);
+}
+
+static void dsi_phy_clklane_ulps_rqst(struct dphy_context *ctx, int en)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->ctrlbase;
+	union _0x78 phy_interface_ctrl;
+
+	phy_interface_ctrl.val = readl(&reg->PHY_INTERFACE_CTRL);
+	phy_interface_ctrl.bits.rf_phy_clk_txrequlps = en;
+
+	writel(phy_interface_ctrl.val, &reg->PHY_INTERFACE_CTRL);
+}
+
+static void dsi_phy_clklane_ulps_exit(struct dphy_context *ctx, int en)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->ctrlbase;
+	union _0x78 phy_interface_ctrl;
+
+	phy_interface_ctrl.val = readl(&reg->PHY_INTERFACE_CTRL);
+	phy_interface_ctrl.bits.rf_phy_clk_txexitulps = en;
+
+	writel(phy_interface_ctrl.val, &reg->PHY_INTERFACE_CTRL);
+}
+
+static void dsi_phy_datalane_ulps_rqst(struct dphy_context *ctx, int en)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->ctrlbase;
+	union _0x78 phy_interface_ctrl;
+
+	phy_interface_ctrl.val = readl(&reg->PHY_INTERFACE_CTRL);
+	phy_interface_ctrl.bits.rf_phy_data_txrequlps = en;
+
+	writel(phy_interface_ctrl.val, &reg->PHY_INTERFACE_CTRL);
+}
+
+static void dsi_phy_datalane_ulps_exit(struct dphy_context *ctx, int en)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->ctrlbase;
+	union _0x78 phy_interface_ctrl;
+
+	phy_interface_ctrl.val = readl(&reg->PHY_INTERFACE_CTRL);
+	phy_interface_ctrl.bits.rf_phy_data_txexitulps = en;
+
+	writel(phy_interface_ctrl.val, &reg->PHY_INTERFACE_CTRL);
+}
+
+/*
+ * Configure minimum wait period for HS transmission request after a stop state
+ * @param phy pointer to structure which holds information about the d-phy
+ * module
+ * @param no_of_byte_cycles [in byte (lane) clock cycles]
+ */
+static void dsi_phy_stop_wait_time(struct dphy_context *ctx, u8 byte_cycle)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->ctrlbase;
+
+	writel(byte_cycle, &reg->PHY_MIN_STOP_TIME);
+}
+
+/*
+ * Set number of active lanes
+ * @param phy: pointer to structure
+ *  which holds information about the d-phy module
+ * @param no_of_lanes
+ */
+static void dsi_phy_datalane_en(struct dphy_context *ctx)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->ctrlbase;
+
+	writel(ctx->lanes - 1, &reg->PHY_LANE_NUM_CONFIG);
+}
+
+/*
+ * Enable clock lane module
+ * @param phy pointer to structure
+ *  which holds information about the d-phy module
+ * @param en
+ */
+static void dsi_phy_clklane_en(struct dphy_context *ctx, int en)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->ctrlbase;
+	union _0x78 phy_interface_ctrl;
+
+	phy_interface_ctrl.val = readl(&reg->PHY_INTERFACE_CTRL);
+	phy_interface_ctrl.bits.rf_phy_clk_en = en;
+
+	writel(phy_interface_ctrl.val, &reg->PHY_INTERFACE_CTRL);
+}
+
+/*
+ * Request the PHY module to start transmission of high speed clock.
+ * This causes the clock lane to start transmitting DDR clock on the
+ * lane interconnect.
+ * @param phy pointer to structure which holds information about the d-phy
+ * module
+ * @param enable
+ * @note this function should be called explicitly by user always except for
+ * transmitting
+ */
+static void dsi_phy_clk_hs_rqst(struct dphy_context *ctx, int enable)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->ctrlbase;
+	union _0x74 phy_clk_lane_lp_ctrl;
+
+	phy_clk_lane_lp_ctrl.val = readl(&reg->PHY_CLK_LANE_LP_CTRL);
+	phy_clk_lane_lp_ctrl.bits.auto_clklane_ctrl_en = 0;
+	phy_clk_lane_lp_ctrl.bits.phy_clklane_tx_req_hs = enable;
+
+	writel(phy_clk_lane_lp_ctrl.val, &reg->PHY_CLK_LANE_LP_CTRL);
+}
+
+/*
+ * Get D-PHY PPI status
+ * @param phy pointer to structure which holds information about the d-phy
+ * module
+ * @param mask
+ * @return status
+ */
+static u8 dsi_phy_is_pll_locked(struct dphy_context *ctx)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->ctrlbase;
+	union _0x9C phy_status;
+
+	phy_status.val = readl(&reg->PHY_STATUS);
+
+	return phy_status.bits.phy_lock;
+}
+
+static u8 dsi_phy_is_rx_direction(struct dphy_context *ctx)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->ctrlbase;
+	union _0x9C phy_status;
+
+	phy_status.val = readl(&reg->PHY_STATUS);
+
+	return phy_status.bits.phy_direction;
+}
+
+static u8 dsi_phy_is_rx_ulps_esc_lane0(struct dphy_context *ctx)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->ctrlbase;
+	union _0x9C phy_status;
+
+	phy_status.val = readl(&reg->PHY_STATUS);
+
+	return phy_status.bits.phy_rxulpsesc0lane;
+}
+
+static u8 dsi_phy_is_stop_state_datalane(struct dphy_context *ctx)
+{
+	u8 state = 0;
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->ctrlbase;
+	union _0x9C phy_status;
+
+	phy_status.val = readl(&reg->PHY_STATUS);
+
+	if (phy_status.bits.phy_stopstate0lane)
+		state |= BIT(0);
+	if (phy_status.bits.phy_stopstate1lane)
+		state |= BIT(1);
+	if (phy_status.bits.phy_stopstate2lane)
+		state |= BIT(2);
+	if (phy_status.bits.phy_stopstate3lane)
+		state |= BIT(3);
+
+	return state;
+}
+
+static u8 dsi_phy_is_stop_state_clklane(struct dphy_context *ctx)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->ctrlbase;
+	union _0x9C phy_status;
+
+	phy_status.val = readl(&reg->PHY_STATUS);
+
+	return phy_status.bits.phy_stopstateclklane;
+}
+
+static u8 dsi_phy_is_ulps_active_datalane(struct dphy_context *ctx)
+{
+	u8 state = 0;
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->ctrlbase;
+	union _0x9C phy_status;
+
+	phy_status.val = readl(&reg->PHY_STATUS);
+
+	if (!phy_status.bits.phy_ulpsactivenot0lane)
+		state |= BIT(0);
+	if (!phy_status.bits.phy_ulpsactivenot1lane)
+		state |= BIT(1);
+	if (!phy_status.bits.phy_ulpsactivenot2lane)
+		state |= BIT(2);
+	if (!phy_status.bits.phy_ulpsactivenot3lane)
+		state |= BIT(3);
+
+	return state;
+}
+
+static u8 dsi_phy_is_ulps_active_clklane(struct dphy_context *ctx)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->ctrlbase;
+	union _0x9C phy_status;
+
+	phy_status.val = readl(&reg->PHY_STATUS);
+
+	return !phy_status.bits.phy_ulpsactivenotclk;
+}
+
+/*
+ * @param phy pointer to structure which holds information about the d-phy
+ * module
+ * @param value
+ */
+static void dsi_phy_test_clk(struct dphy_context *ctx, u8 value)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->ctrlbase;
+	union _0xF0 phy_tst_ctrl0;
+
+	phy_tst_ctrl0.val = readl(&reg->PHY_TST_CTRL0);
+	phy_tst_ctrl0.bits.phy_testclk = value;
+
+	writel(phy_tst_ctrl0.val, &reg->PHY_TST_CTRL0);
+}
+
+/*
+ * @param phy pointer to structure which holds information about the d-phy
+ * module
+ * @param value
+ */
+static void dsi_phy_test_clr(struct dphy_context *ctx, u8 value)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->ctrlbase;
+	union _0xF0 phy_tst_ctrl0;
+
+	phy_tst_ctrl0.val = readl(&reg->PHY_TST_CTRL0);
+	phy_tst_ctrl0.bits.phy_testclr = value;
+
+	writel(phy_tst_ctrl0.val, &reg->PHY_TST_CTRL0);
+}
+
+/*
+ * @param phy pointer to structure which holds information about the d-phy
+ * module
+ * @param on_falling_edge
+ */
+static void dsi_phy_test_en(struct dphy_context *ctx, u8 value)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->ctrlbase;
+	union _0xF4 phy_tst_ctrl1;
+
+	phy_tst_ctrl1.val = readl(&reg->PHY_TST_CTRL1);
+	phy_tst_ctrl1.bits.phy_testen = value;
+
+	writel(phy_tst_ctrl1.val, &reg->PHY_TST_CTRL1);
+}
+
+/*
+ * @param phy pointer to structure which holds information about the d-phy
+ * module
+ */
+static u8 dsi_phy_test_dout(struct dphy_context *ctx)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->ctrlbase;
+	union _0xF4 phy_tst_ctrl1;
+
+	phy_tst_ctrl1.val = readl(&reg->PHY_TST_CTRL1);
+
+	return phy_tst_ctrl1.bits.phy_testdout;
+}
+
+/*
+ * @param phy pointer to structure which holds information about the d-phy
+ * module
+ * @param test_data
+ */
+static void dsi_phy_test_din(struct dphy_context *ctx, u8 data)
+{
+	struct dsi_reg *reg = (struct dsi_reg *)ctx->ctrlbase;
+	union _0xF4 phy_tst_ctrl1;
+
+	phy_tst_ctrl1.val = readl(&reg->PHY_TST_CTRL1);
+	phy_tst_ctrl1.bits.phy_testdin = data;
+
+	writel(phy_tst_ctrl1.val, &reg->PHY_TST_CTRL1);
+}
+
+static struct dphy_ppi_ops dsi_ctrl_ppi_ops = {
+	.rstz                     = dsi_phy_rstz,
+	.shutdownz                = dsi_phy_shutdownz,
+	.force_pll                = dsi_phy_force_pll,
+	.clklane_ulps_rqst        = dsi_phy_clklane_ulps_rqst,
+	.clklane_ulps_exit        = dsi_phy_clklane_ulps_exit,
+	.datalane_ulps_rqst       = dsi_phy_datalane_ulps_rqst,
+	.datalane_ulps_exit       = dsi_phy_datalane_ulps_exit,
+	.stop_wait_time           = dsi_phy_stop_wait_time,
+	.datalane_en              = dsi_phy_datalane_en,
+	.clklane_en               = dsi_phy_clklane_en,
+	.clk_hs_rqst              = dsi_phy_clk_hs_rqst,
+	.is_pll_locked            = dsi_phy_is_pll_locked,
+	.is_rx_direction          = dsi_phy_is_rx_direction,
+	.is_rx_ulps_esc_lane0     = dsi_phy_is_rx_ulps_esc_lane0,
+	.is_stop_state_datalane   = dsi_phy_is_stop_state_datalane,
+	.is_stop_state_clklane    = dsi_phy_is_stop_state_clklane,
+	.is_ulps_active_datalane  = dsi_phy_is_ulps_active_datalane,
+	.is_ulps_active_clklane   = dsi_phy_is_ulps_active_clklane,
+	.tst_clk                  = dsi_phy_test_clk,
+	.tst_clr                  = dsi_phy_test_clr,
+	.tst_en                   = dsi_phy_test_en,
+	.tst_dout                 = dsi_phy_test_dout,
+	.tst_din                  = dsi_phy_test_din,
+	.bist_en                  = NULL,
+	.is_bist_ok               = NULL,
+};
+
+static struct ops_entry entry = {
+	.ver = "sprd,dsi-ctrl",
+	.ops = &dsi_ctrl_ppi_ops,
+};
+
+static int __init dphy_ppi_register(void)
+{
+	return dphy_ppi_ops_register(&entry);
+}
+
+subsys_initcall(dphy_ppi_register);
+
+MODULE_AUTHOR("Leon He <leon.he@unisoc.com>");
+MODULE_AUTHOR("Kevin Tang <kevin.tang@unisoc.com>");
+MODULE_DESCRIPTION("DPHY Protocal Interface for Unisoc DSI_CTRL RXP0");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/sprd/dsi/sprd_dsi_api.c b/drivers/gpu/drm/sprd/dsi/sprd_dsi_api.c
new file mode 100644
index 0000000..b17324b
--- /dev/null
+++ b/drivers/gpu/drm/sprd/dsi/sprd_dsi_api.c
@@ -0,0 +1,544 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 Unisoc Inc.
+ */
+
+#include <linux/delay.h>
+
+#include "sprd_dsi_hal.h"
+
+static u16 calc_bytes_per_pixel_x100(int coding)
+{
+	u16 Bpp_x100;
+
+	switch (coding) {
+	case COLOR_CODE_16BIT_CONFIG1:
+	case COLOR_CODE_16BIT_CONFIG2:
+	case COLOR_CODE_16BIT_CONFIG3:
+		Bpp_x100 = 200;
+		break;
+	case COLOR_CODE_18BIT_CONFIG1:
+	case COLOR_CODE_18BIT_CONFIG2:
+		Bpp_x100 = 225;
+		break;
+	case COLOR_CODE_24BIT:
+		Bpp_x100 = 300;
+		break;
+	case COLOR_CODE_COMPRESSTION:
+		Bpp_x100 = 100;
+		break;
+	case COLOR_CODE_20BIT_YCC422_LOOSELY:
+		Bpp_x100 = 250;
+		break;
+	case COLOR_CODE_24BIT_YCC422:
+		Bpp_x100 = 300;
+		break;
+	case COLOR_CODE_16BIT_YCC422:
+		Bpp_x100 = 200;
+		break;
+	case COLOR_CODE_30BIT:
+		Bpp_x100 = 375;
+		break;
+	case COLOR_CODE_36BIT:
+		Bpp_x100 = 450;
+		break;
+	case COLOR_CODE_12BIT_YCC420:
+		Bpp_x100 = 150;
+		break;
+	default:
+		pr_err("invalid color coding");
+		Bpp_x100 = 0;
+		break;
+	}
+
+	return Bpp_x100;
+}
+
+static u8 calc_video_size_step(int coding)
+{
+	u8 video_size_step;
+
+	switch (coding) {
+	case COLOR_CODE_16BIT_CONFIG1:
+	case COLOR_CODE_16BIT_CONFIG2:
+	case COLOR_CODE_16BIT_CONFIG3:
+	case COLOR_CODE_18BIT_CONFIG1:
+	case COLOR_CODE_18BIT_CONFIG2:
+	case COLOR_CODE_24BIT:
+	case COLOR_CODE_COMPRESSTION:
+		return video_size_step = 1;
+	case COLOR_CODE_20BIT_YCC422_LOOSELY:
+	case COLOR_CODE_24BIT_YCC422:
+	case COLOR_CODE_16BIT_YCC422:
+	case COLOR_CODE_30BIT:
+	case COLOR_CODE_36BIT:
+	case COLOR_CODE_12BIT_YCC420:
+		return video_size_step = 2;
+	default:
+		pr_err("invalid color coding");
+		return 0;
+	}
+}
+
+static u16 round_video_size(int coding, u16 video_size)
+{
+	switch (coding) {
+	case COLOR_CODE_16BIT_YCC422:
+	case COLOR_CODE_24BIT_YCC422:
+	case COLOR_CODE_20BIT_YCC422_LOOSELY:
+	case COLOR_CODE_12BIT_YCC420:
+		/* round up active H pixels to a multiple of 2 */
+		if ((video_size % 2) != 0)
+			video_size += 1;
+		break;
+	default:
+		break;
+	}
+
+	return video_size;
+}
+
+#define SPRD_MIPI_DSI_FMT_DSC 0xff
+static u32 fmt_to_coding(u32 fmt)
+{
+	switch (fmt) {
+	case MIPI_DSI_FMT_RGB565:
+		return COLOR_CODE_16BIT_CONFIG1;
+	case MIPI_DSI_FMT_RGB666_PACKED:
+		return COLOR_CODE_18BIT_CONFIG1;
+	case MIPI_DSI_FMT_RGB666:
+	case MIPI_DSI_FMT_RGB888:
+		return COLOR_CODE_24BIT;
+	case SPRD_MIPI_DSI_FMT_DSC:
+		return COLOR_CODE_COMPRESSTION;
+	default:
+		DRM_ERROR("Unsupported format (%d)\n", fmt);
+		return COLOR_CODE_24BIT;
+	}
+}
+
+#define ns_to_cycle(ns, byte_clk) \
+	DIV_ROUND_UP((ns) * (byte_clk), 1000000)
+
+int sprd_dsi_init(struct sprd_dsi *dsi)
+{
+	int div;
+	struct dsi_context *ctx = &dsi->ctx;
+	u16 max_rd_time;
+	u16 data_hs2lp, data_lp2hs, clk_hs2lp, clk_lp2hs;
+
+	dsi_hal_power_en(dsi, 0);
+	dsi_hal_int0_mask(dsi, 0xffffffff);
+	dsi_hal_int1_mask(dsi, 0xffffffff);
+	dsi_hal_cmd_mode(dsi);
+	dsi_hal_eotp_rx_en(dsi, 0);
+	dsi_hal_eotp_tx_en(dsi, 0);
+	dsi_hal_ecc_rx_en(dsi, 1);
+	dsi_hal_crc_rx_en(dsi, 1);
+	dsi_hal_bta_en(dsi, 1);
+	dsi_hal_video_vcid(dsi, 0);
+	dsi_hal_rx_vcid(dsi, 0);
+
+	div = DIV_ROUND_UP(ctx->byte_clk, ctx->esc_clk);
+	dsi_hal_tx_escape_division(dsi, div);
+	pr_info("escape clock divider = %d\n", div);
+
+	max_rd_time = ns_to_cycle(ctx->max_rd_time, ctx->byte_clk);
+	dsi_hal_max_read_time(dsi, max_rd_time);
+
+	data_hs2lp = ns_to_cycle(ctx->data_hs2lp, ctx->byte_clk);
+	data_lp2hs = ns_to_cycle(ctx->data_lp2hs, ctx->byte_clk);
+	clk_hs2lp = ns_to_cycle(ctx->clk_hs2lp, ctx->byte_clk);
+	clk_lp2hs = ns_to_cycle(ctx->clk_lp2hs, ctx->byte_clk);
+	dsi_hal_datalane_hs2lp_config(dsi, data_hs2lp);
+	dsi_hal_datalane_lp2hs_config(dsi, data_lp2hs);
+	dsi_hal_clklane_hs2lp_config(dsi, clk_hs2lp);
+	dsi_hal_clklane_lp2hs_config(dsi, clk_lp2hs);
+
+	dsi_hal_power_en(dsi, 1);
+
+	return 0;
+}
+
+/*
+ * Close DSI Host driver
+ * - Free up resources and shutdown host controller and PHY
+ * @param dsi pointer to structure holding the DSI Host core information
+ * @return int
+ */
+int sprd_dsi_uninit(struct sprd_dsi *dsi)
+{
+	dsi_hal_int0_mask(dsi, 0xffffffff);
+	dsi_hal_int1_mask(dsi, 0xffffffff);
+	dsi_hal_power_en(dsi, 0);
+
+	return 0;
+}
+
+/*
+ * Configure DPI video interface
+ * - If not in burst mode, it will compute the video and null packet sizes
+ * according to necessity
+ * - Configure timers for data lanes and/or clock lane to return to LP when
+ * bandwidth is not filled by data
+ * @param dsi pointer to structure holding the DSI Host core information
+ * @param param pointer to video stream-to-send information
+ * @return error code
+ */
+int sprd_dsi_dpi_video(struct sprd_dsi *dsi)
+{
+	u16 Bpp_x100;
+	u16 video_size;
+	u32 ratio_x1000;
+	u16 null_pkt_size = 0;
+	u8 video_size_step;
+	u32 hs_to;
+	u32 total_bytes;
+	u32 bytes_per_chunk;
+	u32 chunks = 0;
+	u32 bytes_left = 0;
+	u32 chunk_overhead;
+	const u8 pkt_header = 6;
+	u8 coding;
+	int div;
+	u16 hline;
+	struct dsi_context *ctx = &dsi->ctx;
+	struct videomode *vm = &dsi->ctx.vm;
+
+	coding = fmt_to_coding(ctx->format);
+	video_size = round_video_size(coding, vm->hactive);
+	Bpp_x100 = calc_bytes_per_pixel_x100(coding);
+	video_size_step = calc_video_size_step(coding);
+	ratio_x1000 = ctx->byte_clk * 1000 / (vm->pixelclock / 1000);
+	hline = vm->hactive + vm->hsync_len + vm->hfront_porch +
+		vm->hback_porch;
+
+	dsi_hal_power_en(dsi, 0);
+	dsi_hal_dpi_frame_ack_en(dsi, ctx->frame_ack_en);
+	dsi_hal_dpi_color_coding(dsi, coding);
+	dsi_hal_dpi_video_burst_mode(dsi, ctx->burst_mode);
+	dsi_hal_dpi_sig_delay(dsi, 95 * hline * ratio_x1000 / 100000);
+	dsi_hal_dpi_hline_time(dsi, hline * ratio_x1000 / 1000);
+	dsi_hal_dpi_hsync_time(dsi, vm->hsync_len * ratio_x1000 / 1000);
+	dsi_hal_dpi_hbp_time(dsi, vm->hback_porch * ratio_x1000 / 1000);
+	dsi_hal_dpi_vact(dsi, vm->vactive);
+	dsi_hal_dpi_vfp(dsi, vm->vfront_porch);
+	dsi_hal_dpi_vbp(dsi, vm->vback_porch);
+	dsi_hal_dpi_vsync(dsi, vm->vsync_len);
+	dsi_hal_dpi_hporch_lp_en(dsi, 1);
+	dsi_hal_dpi_vporch_lp_en(dsi, 1);
+	dsi_hal_dpi_hsync_pol(dsi, 0);
+	dsi_hal_dpi_vsync_pol(dsi, 0);
+	dsi_hal_dpi_data_en_pol(dsi, 0);
+	dsi_hal_dpi_color_mode_pol(dsi, 0);
+	dsi_hal_dpi_shut_down_pol(dsi, 0);
+
+	hs_to = (hline * vm->vactive) + (2 * Bpp_x100) / 100;
+	for (div = 0x80; (div < hs_to) && (div > 2); div--) {
+		if ((hs_to % div) == 0) {
+			dsi_hal_timeout_clock_division(dsi, div);
+			dsi_hal_lp_rx_timeout(dsi, hs_to / div);
+			dsi_hal_hs_tx_timeout(dsi, hs_to / div);
+			break;
+		}
+	}
+
+	if (ctx->burst_mode == VIDEO_BURST_WITH_SYNC_PULSES) {
+		dsi_hal_dpi_video_packet_size(dsi, video_size);
+		dsi_hal_dpi_null_packet_size(dsi, 0);
+		dsi_hal_dpi_chunk_num(dsi, 0);
+	} else {
+		/* non burst transmission */
+		null_pkt_size = 0;
+
+		/* bytes to be sent - first as one chunk */
+		bytes_per_chunk = vm->hactive * Bpp_x100 / 100 + pkt_header;
+
+		/* hline total bytes from the DPI interface */
+		total_bytes = (vm->hactive + vm->hfront_porch) *
+				ratio_x1000 / ctx->lanes / 1000;
+
+		/* check if the pixels actually fit on the DSI link */
+		if (total_bytes < bytes_per_chunk) {
+			pr_err("current resolution can not be set\n");
+			return -1;
+		}
+
+		chunk_overhead = total_bytes - bytes_per_chunk;
+
+		/* overhead higher than 1 -> enable multi packets */
+		if (chunk_overhead > 1) {
+
+			/* multi packets */
+			for (video_size = video_size_step;
+			     video_size < vm->hactive;
+			     video_size += video_size_step) {
+
+				if (vm->hactive * 1000 / video_size % 1000)
+					continue;
+
+				chunks = vm->hactive / video_size;
+				bytes_per_chunk = Bpp_x100 * video_size / 100
+						  + pkt_header;
+				if (total_bytes >= (bytes_per_chunk * chunks)) {
+					bytes_left = total_bytes -
+						     bytes_per_chunk * chunks;
+					break;
+				}
+			}
+
+			/* prevent overflow (unsigned - unsigned) */
+			if (bytes_left > (pkt_header * chunks)) {
+				null_pkt_size = (bytes_left -
+						pkt_header * chunks) / chunks;
+				/* avoid register overflow */
+				if (null_pkt_size > 1023)
+					null_pkt_size = 1023;
+			}
+
+		} else {
+
+			/* single packet */
+			chunks = 1;
+
+			/* must be a multiple of 4 except 18 loosely */
+			for (video_size = vm->hactive;
+			    (video_size % video_size_step) != 0;
+			     video_size++)
+				;
+		}
+
+		dsi_hal_dpi_video_packet_size(dsi, video_size);
+		dsi_hal_dpi_null_packet_size(dsi, null_pkt_size);
+		dsi_hal_dpi_chunk_num(dsi, chunks);
+	}
+
+	dsi_hal_int0_mask(dsi, ctx->int0_mask);
+	dsi_hal_int1_mask(dsi, ctx->int1_mask);
+	dsi_hal_power_en(dsi, 1);
+
+	return 0;
+}
+
+int sprd_dsi_edpi_video(struct sprd_dsi *dsi)
+{
+	const u32 fifo_depth = 1096;
+	const u32 word_length = 4;
+	struct dsi_context *ctx = &dsi->ctx;
+	u32 hactive = ctx->vm.hactive;
+	u32 Bpp_x100;
+	u32 max_fifo_len;
+	u8 coding;
+
+	coding = fmt_to_coding(ctx->format);
+	Bpp_x100 = calc_bytes_per_pixel_x100(coding);
+	max_fifo_len = word_length * fifo_depth * 100 / Bpp_x100;
+
+	dsi_hal_power_en(dsi, 0);
+	dsi_hal_dpi_color_coding(dsi, coding);
+	dsi_hal_tear_effect_ack_en(dsi, ctx->te_ack_en);
+
+	if (max_fifo_len > hactive)
+		dsi_hal_edpi_max_pkt_size(dsi, hactive);
+	else
+		dsi_hal_edpi_max_pkt_size(dsi, max_fifo_len);
+
+	dsi_hal_int0_mask(dsi, ctx->int0_mask);
+	dsi_hal_int1_mask(dsi, ctx->int1_mask);
+	dsi_hal_power_en(dsi, 1);
+
+	return 0;
+}
+
+/*
+ * Send a packet on the generic interface
+ * @param dsi pointer to structure holding the DSI Host core information
+ * @param vc destination virtual channel
+ * @param data_type type of command, inserted in first byte of header
+ * @param params byte array of command parameters
+ * @param param_length length of the above array
+ * @return error code
+ * @note this function has an active delay to wait for the buffer to clear.
+ * The delay is limited to:
+ * (param_length / 4) x DSIH_FIFO_ACTIVE_WAIT x register access time
+ * @note the controller restricts the sending of .
+ * This function will not be able to send Null and Blanking packets due to
+ *  controller restriction
+ */
+int sprd_dsi_wr_pkt(struct sprd_dsi *dsi, u8 vc, u8 type,
+			const u8 *param, u16 len)
+{
+	int i = 0;
+	int j = 0;
+	u32 payload;
+	u8 wc_lsbyte, wc_msbyte;
+
+	if (vc > 3)
+		return -EINVAL;
+
+	/* 1st: for long packet, must config payload first */
+	if (!dsi_hal_wait_tx_payload_fifo_empty(dsi))
+		return -1;
+
+	if (len > 2) {
+		for (i = 0; i < len; i += j) {
+			payload = 0;
+			for (j = 0; (j < 4) && ((j + i) < (len)); j++)
+				payload |= param[i + j] << (j * 8);
+
+			dsi_hal_set_packet_payload(dsi, payload);
+		}
+		wc_lsbyte = len & 0xff;
+		wc_msbyte = len >> 8;
+	} else {
+		wc_lsbyte = (len > 0) ? param[0] : 0;
+		wc_msbyte = (len > 1) ? param[1] : 0;
+	}
+
+	/* 2nd: then set packet header */
+	if (!dsi_hal_wait_tx_cmd_fifo_empty(dsi))
+		return -EINVAL;
+
+	dsi_hal_set_packet_header(dsi, vc, type, wc_lsbyte, wc_msbyte);
+
+	return 0;
+}
+
+
+/*
+ * Send READ packet to peripheral using the generic interface
+ * This will force command mode and stop video mode (because of BTA)
+ * @param dsi pointer to structure holding the DSI Host core information
+ * @param vc destination virtual channel
+ * @param data_type generic command type
+ * @param lsb_byte first command parameter
+ * @param msb_byte second command parameter
+ * @param bytes_to_read no of bytes to read (expected to arrive at buffer)
+ * @param read_buffer pointer to 8-bit array to hold the read buffer words
+ * return read_buffer_length
+ * @note this function has an active delay to wait for the buffer to clear.
+ * The delay is limited to 2 x DSIH_FIFO_ACTIVE_WAIT
+ * (waiting for command buffer, and waiting for receiving)
+ * @note this function will enable BTA
+ */
+int sprd_dsi_rd_pkt(struct sprd_dsi *dsi, u8 vc, u8 type,
+			u8 msb_byte, u8 lsb_byte,
+			u8 *buffer, u8 bytes_to_read)
+{
+	int i;
+	int count = 0;
+	u32 temp;
+
+	if (vc > 3)
+		return -EINVAL;
+
+	/* 1st: send read command to peripheral */
+	if (!dsi_hal_wait_tx_cmd_fifo_empty(dsi))
+		return -EINVAL;
+
+	dsi_hal_set_packet_header(dsi, vc, type, lsb_byte, msb_byte);
+
+	/* 2nd: wait peripheral response completed */
+	dsi_hal_wait_rd_resp_completed(dsi);
+
+	/* 3rd: get data from rx payload fifo */
+	if (dsi_hal_is_rx_payload_fifo_empty(dsi)) {
+		pr_err("rx payload fifo empty\n");
+		return -EINVAL;
+	}
+
+	for (i = 0; i < 100; i++) {
+		temp = dsi_hal_get_rx_payload(dsi);
+
+		if (count < bytes_to_read)
+			buffer[count++] = temp & 0xff;
+		if (count < bytes_to_read)
+			buffer[count++] = (temp >> 8) & 0xff;
+		if (count < bytes_to_read)
+			buffer[count++] = (temp >> 16) & 0xff;
+		if (count < bytes_to_read)
+			buffer[count++] = (temp >> 24) & 0xff;
+
+		if (dsi_hal_is_rx_payload_fifo_empty(dsi))
+			return count;
+	}
+
+	pr_err("read too many buffers\n");
+	return -EINVAL;
+}
+
+void sprd_dsi_set_work_mode(struct sprd_dsi *dsi, u8 mode)
+{
+	if (mode == DSI_MODE_CMD)
+		dsi_hal_cmd_mode(dsi);
+	else
+		dsi_hal_video_mode(dsi);
+}
+
+int sprd_dsi_get_work_mode(struct sprd_dsi *dsi)
+{
+	if (dsi_hal_is_cmd_mode(dsi))
+		return DSI_MODE_CMD;
+	else
+		return DSI_MODE_VIDEO;
+}
+
+void sprd_dsi_lp_cmd_enable(struct sprd_dsi *dsi, bool enable)
+{
+	if (dsi_hal_is_cmd_mode(dsi))
+		dsi_hal_cmd_mode_lp_cmd_en(dsi, enable);
+	else
+		dsi_hal_video_mode_lp_cmd_en(dsi, enable);
+}
+
+void sprd_dsi_nc_clk_en(struct sprd_dsi *dsi, bool enable)
+{
+	dsi_hal_nc_clk_en(dsi, enable);
+}
+
+void sprd_dsi_state_reset(struct sprd_dsi *dsi)
+{
+	dsi_hal_power_en(dsi, 0);
+	udelay(100);
+	dsi_hal_power_en(dsi, 1);
+}
+
+u32 sprd_dsi_int_status(struct sprd_dsi *dsi, int index)
+{
+	u32 status = 0;
+
+	switch (index) {
+	case 0:
+		status = dsi_hal_int0_status(dsi);
+		break;
+
+	case 1:
+		status = dsi_hal_int1_status(dsi);
+		break;
+
+	case 2:
+		status = dsi_hal_int2_status(dsi);
+		break;
+
+	default:
+		break;
+	}
+
+	return status;
+}
+
+void sprd_dsi_int_mask(struct sprd_dsi *dsi, int index)
+{
+	switch (index) {
+	case 0:
+		dsi_hal_int0_mask(dsi, dsi->ctx.int0_mask);
+		break;
+
+	case 1:
+		dsi_hal_int1_mask(dsi, dsi->ctx.int1_mask);
+		break;
+
+	default:
+		break;
+	}
+}
diff --git a/drivers/gpu/drm/sprd/dsi/sprd_dsi_api.h b/drivers/gpu/drm/sprd/dsi/sprd_dsi_api.h
new file mode 100644
index 0000000..45a706a
--- /dev/null
+++ b/drivers/gpu/drm/sprd/dsi/sprd_dsi_api.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2019 Unisoc Inc.
+ */
+
+#ifndef _MIPI_DSI_API_H_
+#define _MIPI_DSI_API_H_
+
+#include "sprd_dsi.h"
+
+int sprd_dsi_init(struct sprd_dsi *dsi);
+int sprd_dsi_uninit(struct sprd_dsi *dsi);
+int sprd_dsi_dpi_video(struct sprd_dsi *dsi);
+int sprd_dsi_edpi_video(struct sprd_dsi *dsi);
+int sprd_dsi_wr_pkt(struct sprd_dsi *dsi, u8 vc, u8 type,
+			const u8 *param, u16 len);
+int sprd_dsi_rd_pkt(struct sprd_dsi *dsi, u8 vc, u8 type,
+			u8 msb_byte, u8 lsb_byte,
+			u8 *buffer, u8 bytes_to_read);
+void sprd_dsi_set_work_mode(struct sprd_dsi *dsi, u8 mode);
+int sprd_dsi_get_work_mode(struct sprd_dsi *dsi);
+void sprd_dsi_lp_cmd_enable(struct sprd_dsi *dsi, bool enable);
+void sprd_dsi_nc_clk_en(struct sprd_dsi *dsi, bool enable);
+void sprd_dsi_state_reset(struct sprd_dsi *dsi);
+u32 sprd_dsi_int_status(struct sprd_dsi *dsi, int index);
+void sprd_dsi_int_mask(struct sprd_dsi *dsi, int index);
+
+#endif /* _MIPI_DSI_API_H_ */
diff --git a/drivers/gpu/drm/sprd/dsi/sprd_dsi_hal.h b/drivers/gpu/drm/sprd/dsi/sprd_dsi_hal.h
new file mode 100644
index 0000000..666500d
--- /dev/null
+++ b/drivers/gpu/drm/sprd/dsi/sprd_dsi_hal.h
@@ -0,0 +1,1102 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2019 Unisoc Inc.
+ */
+
+#ifndef MIPI_DSI_HAL_H_
+#define MIPI_DSI_HAL_H_
+
+#include <linux/delay.h>
+#include <linux/types.h>
+
+#include "sprd_dsi.h"
+
+/*
+ * Get DSI Host core version
+ * @dsi pointer to structure holding the DSI Host core information
+ * @return true or false
+ */
+static inline bool dsi_hal_check_version(struct sprd_dsi *dsi)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (!ops->check_version)
+		return false;
+
+	return ops->check_version(ctx);
+}
+/*
+ * Modify power status of DSI Host core
+ * @dsi pointer to structure holding the DSI Host core information
+ * @enable power on(1) or off (0)
+ */
+static inline void dsi_hal_power_en(struct sprd_dsi *dsi, int enable)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->power_en)
+		ops->power_en(ctx, enable);
+}
+/*
+ * Enable DPI video mode
+ * @dsi pointer to structure holding the DSI Host core information
+ */
+static inline void dsi_hal_video_mode(struct sprd_dsi *dsi)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->video_mode)
+		ops->video_mode(ctx);
+}
+/*
+ * Enable command mode (Generic interface)
+ * @dsi pointer to structure holding the DSI Host core information
+ */
+static inline void dsi_hal_cmd_mode(struct sprd_dsi *dsi)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->cmd_mode)
+		ops->cmd_mode(ctx);
+}
+static inline bool dsi_hal_is_cmd_mode(struct sprd_dsi *dsi)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->is_cmd_mode)
+		return ops->is_cmd_mode(ctx);
+
+	return true;
+}
+/*
+ * Configure the read back virtual channel for the generic interface
+ * @dsi pointer to structure holding the DSI Host core information
+ * @vc to listen to on the line
+ */
+static inline void dsi_hal_rx_vcid(struct sprd_dsi *dsi, u8 vc)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->rx_vcid)
+		ops->rx_vcid(ctx, vc);
+}
+/*
+ * Write the DPI video virtual channel destination
+ * @dsi pointer to structure holding the DSI Host core information
+ * @vc virtual channel
+ */
+static inline void dsi_hal_video_vcid(struct sprd_dsi *dsi, u8 vc)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->video_vcid)
+		ops->video_vcid(ctx, vc);
+}
+/*
+ * Set DPI video mode type (burst/non-burst - with sync pulses or events)
+ * @dsi pointer to structure holding the DSI Host core information
+ * @type burst mode type: with sync pulse or events
+ */
+static inline
+void dsi_hal_dpi_video_burst_mode(struct sprd_dsi *dsi, int type)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->dpi_video_burst_mode)
+		ops->dpi_video_burst_mode(ctx, type);
+}
+/*
+ * Set DPI video color coding
+ * @dsi pointer to structure holding the DSI Host core information
+ * @coding enum (configuration and color depth)
+ */
+static inline void dsi_hal_dpi_color_coding(struct sprd_dsi *dsi, int coding)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->dpi_color_coding)
+		ops->dpi_color_coding(ctx, coding);
+}
+/*
+ * Set DPI loosely packetisation video (used only when color depth = 18
+ * @dsi pointer to structure holding the DSI Host core information
+ * @enable 1 enable, 0 disable
+ */
+static inline
+void dsi_hal_dpi_18_loosely_packet_en(struct sprd_dsi *dsi, int enable)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->dpi_18_loosely_packet_en)
+		ops->dpi_18_loosely_packet_en(ctx, enable);
+}
+/*
+ * Set DPI color mode pin polarity
+ * @dsi pointer to structure holding the DSI Host core information
+ * @active_low (1) or active high (0)
+ */
+static inline
+void dsi_hal_dpi_color_mode_pol(struct sprd_dsi *dsi, int active_low)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->dpi_color_mode_pol)
+		ops->dpi_color_mode_pol(ctx, active_low);
+}
+/*
+ * Set DPI shut down pin polarity
+ * @dsi pointer to structure holding the DSI Host core information
+ * @active_low (1) or active high (0)
+ */
+static inline
+void dsi_hal_dpi_shut_down_pol(struct sprd_dsi *dsi, int active_low)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->dpi_shut_down_pol)
+		ops->dpi_shut_down_pol(ctx, active_low);
+}
+/*
+ * Set DPI horizontal sync pin polarity
+ * @dsi pointer to structure holding the DSI Host core information
+ * @active_low (1) or active high (0)
+ */
+static inline
+void dsi_hal_dpi_hsync_pol(struct sprd_dsi *dsi, int active_low)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->dpi_hsync_pol)
+		ops->dpi_hsync_pol(ctx, active_low);
+}
+/*
+ * Set DPI vertical sync pin polarity
+ * @dsi pointer to structure holding the DSI Host core information
+ * @active_low (1) or active high (0)
+ */
+static inline
+void dsi_hal_dpi_vsync_pol(struct sprd_dsi *dsi, int active_low)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->dpi_vsync_pol)
+		ops->dpi_vsync_pol(ctx, active_low);
+}
+/*
+ * Set DPI data enable pin polarity
+ * @dsi pointer to structure holding the DSI Host core information
+ * @active_low (1) or active high (0)
+ */
+static inline
+void dsi_hal_dpi_data_en_pol(struct sprd_dsi *dsi, int active_low)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->dpi_data_en_pol)
+		ops->dpi_data_en_pol(ctx, active_low);
+}
+/*
+ * Configure the Horizontal Line time
+ * @dsi pointer to structure holding the DSI Host core information
+ * @byte_cycle taken to transmit the total of the horizontal line
+ */
+static inline
+void dsi_hal_dpi_hline_time(struct sprd_dsi *dsi, u16 byte_cycle)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->dpi_hline_time)
+		ops->dpi_hline_time(ctx, byte_cycle);
+}
+/*
+ * Configure the Horizontal back porch time
+ * @dsi pointer to structure holding the DSI Host core information
+ * @byte_cycle taken to transmit the horizontal back porch
+ */
+static inline
+void dsi_hal_dpi_hbp_time(struct sprd_dsi *dsi, u16 byte_cycle)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->dpi_hbp_time)
+		ops->dpi_hbp_time(ctx, byte_cycle);
+}
+/*
+ * Configure the Horizontal sync time
+ * @dsi pointer to structure holding the DSI Host core information
+ * @byte_cycle taken to transmit the horizontal sync
+ */
+static inline
+void dsi_hal_dpi_hsync_time(struct sprd_dsi *dsi, u16 byte_cycle)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->dpi_hsync_time)
+		ops->dpi_hsync_time(ctx, byte_cycle);
+}
+/*
+ * Configure the DPI Interface signal delay time
+ * @dsi pointer to structure holding the DSI Host core information
+ * @byte_cycle delay time after receiving HSYNC from DPI interface
+ *	  to retrieve data from pixel memory
+ */
+static inline
+void dsi_hal_dpi_sig_delay(struct sprd_dsi *dsi, u16 byte_cycle)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->dpi_sig_delay)
+		ops->dpi_sig_delay(ctx, byte_cycle);
+}
+/*
+ * Configure the vertical active lines of the video stream
+ * @dsi pointer to structure holding the DSI Host core information
+ * @lines
+ */
+static inline void dsi_hal_dpi_vact(struct sprd_dsi *dsi, u16 lines)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->dpi_vact)
+		ops->dpi_vact(ctx, lines);
+}
+/*
+ * Configure the vertical front porch lines of the video stream
+ * @dsi pointer to structure holding the DSI Host core information
+ * @lines
+ */
+static inline void dsi_hal_dpi_vfp(struct sprd_dsi *dsi, u16 lines)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->dpi_vfp)
+		ops->dpi_vfp(ctx, lines);
+}
+/*
+ * Configure the vertical back porch lines of the video stream
+ * @dsi pointer to structure holding the DSI Host core information
+ * @lines
+ */
+static inline void dsi_hal_dpi_vbp(struct sprd_dsi *dsi, u16 lines)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->dpi_vbp)
+		ops->dpi_vbp(ctx, lines);
+}
+/*
+ * Configure the vertical sync lines of the video stream
+ * @dsi pointer to structure holding the DSI Host core information
+ * @lines
+ */
+static inline void dsi_hal_dpi_vsync(struct sprd_dsi *dsi, u16 lines)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->dpi_vsync)
+		ops->dpi_vsync(ctx, lines);
+}
+/*
+ * Enable return to low power mode inside horizontal front porch periods when
+ *  timing allows
+ * @dsi pointer to structure holding the DSI Host core information
+ * @enable (1) - disable (0)
+ */
+static inline
+void dsi_hal_dpi_hporch_lp_en(struct sprd_dsi *dsi, int enable)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->dpi_hporch_lp_en)
+		ops->dpi_hporch_lp_en(ctx, enable);
+}
+/*
+ * Enable return to low power mode inside vertical active lines periods when
+ *  timing allows
+ * @dsi pointer to structure holding the DSI Host core information
+ * @enable (1) - disable (0)
+ */
+static inline
+void dsi_hal_dpi_vporch_lp_en(struct sprd_dsi *dsi, int enable)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->dpi_vporch_lp_en)
+		ops->dpi_vporch_lp_en(ctx, enable);
+}
+/*
+ * Enable FRAME BTA ACK
+ * @dsi pointer to structure holding the DSI Host core information
+ * @enable (1) - disable (0)
+ */
+static inline
+void dsi_hal_dpi_frame_ack_en(struct sprd_dsi *dsi, int enable)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->dpi_frame_ack_en)
+		ops->dpi_frame_ack_en(ctx, enable);
+}
+/*
+ * Enable null packets (value in null packet size will be taken in calculations)
+ * @dsi pointer to structure holding the DSI Host core information
+ * @enable (1) - disable (0)
+ * note: function retained for backward compatibility (not used from 1.20a on)
+ */
+static inline
+void dsi_hal_dpi_null_packet_en(struct sprd_dsi *dsi, int enable)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->dpi_null_packet_en)
+		ops->dpi_null_packet_en(ctx, enable);
+}
+/*
+ * Enable multi packets (value in no of chunks will be taken in calculations)
+ * @dsi pointer to structure holding the DSI Host core information
+ * @enable (1) - disable (0)
+ */
+static inline
+void dsi_hal_dpi_multi_packet_en(struct sprd_dsi *dsi, int enable)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->dpi_multi_packet_en)
+		ops->dpi_multi_packet_en(ctx, enable);
+}
+/*
+ * Write no of chunks to core - taken into consideration only when multi packet
+ * is enabled
+ * @dsi pointer to structure holding the DSI Host core information
+ * @num number of chunks
+ */
+static inline void dsi_hal_dpi_chunk_num(struct sprd_dsi *dsi, u16 num)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->dpi_chunk_num)
+		ops->dpi_chunk_num(ctx, num);
+}
+/*
+ * Write the null packet size - will only be taken into account when null
+ * packets are enabled.
+ * @dsi pointer to structure holding the DSI Host core information
+ * @size of null packet
+ */
+static inline
+void dsi_hal_dpi_null_packet_size(struct sprd_dsi *dsi, u16 size)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->dpi_null_packet_size)
+		ops->dpi_null_packet_size(ctx, size);
+}
+/*
+ * Write video packet size. obligatory for sending video
+ * @dsi pointer to structure holding the DSI Host core information
+ * @size of video packet - containing information
+ */
+static inline
+void dsi_hal_dpi_video_packet_size(struct sprd_dsi *dsi, u16 size)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->dpi_video_packet_size)
+		ops->dpi_video_packet_size(ctx, size);
+}
+/*
+ * Specifiy the size of the packet memory write start/continue
+ * @dsi pointer to structure holding the DSI Host core information
+ * @size size of the packet
+ * note when different than zero (0) eDPI is enabled
+ */
+static inline void dsi_hal_edpi_max_pkt_size(struct sprd_dsi *dsi, u16 size)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->edpi_max_pkt_size)
+		ops->edpi_max_pkt_size(ctx, size);
+}
+
+static inline
+void dsi_hal_edpi_video_hs_en(struct sprd_dsi *dsi, int enable)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->edpi_video_hs_en)
+		ops->edpi_video_hs_en(ctx, enable);
+}
+
+/*
+ * Enable tear effect acknowledge
+ * @dsi pointer to structure holding the DSI Host core information
+ * @enable (1) - disable (0)
+ */
+static inline
+void dsi_hal_tear_effect_ack_en(struct sprd_dsi *dsi, int enable)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->tear_effect_ack_en)
+		ops->tear_effect_ack_en(ctx, enable);
+}
+/*
+ * Enable packets acknowledge request after each packet transmission
+ * @dsi pointer to structure holding the DSI Host core information
+ * @enable (1) - disable (0)
+ */
+static inline
+void dsi_hal_cmd_ack_request_en(struct sprd_dsi *dsi, int enable)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->cmd_ack_request_en)
+		ops->cmd_ack_request_en(ctx, enable);
+}
+/*
+ * Set DCS command packet transmission to transmission type
+ * @dsi pointer to structure holding the DSI Host core information
+ * @enable lp transmit in low power
+ */
+static inline
+void dsi_hal_cmd_mode_lp_cmd_en(struct sprd_dsi *dsi, int enable)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->cmd_mode_lp_cmd_en)
+		ops->cmd_mode_lp_cmd_en(ctx, enable);
+}
+/*
+ * Set DCS read command packet transmission to transmission type
+ * @dsi pointer to structure holding the DSI Host core information
+ * @enable lp transmit in low power
+ */
+static inline
+void dsi_hal_video_mode_lp_cmd_en(struct sprd_dsi *dsi, int enable)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->video_mode_lp_cmd_en)
+		ops->video_mode_lp_cmd_en(ctx, enable);
+}
+
+/*
+ * Write command header in the generic interface
+ * (which also sends DCS commands) as a subset
+ * @dsi pointer to structure holding the DSI Host core information
+ * @vc of destination
+ * @type type of DCS command
+ * @wc_lsb (if DCS, it is the DCS command)
+ * @wc_msb (only parameter of short DCS packet)
+ */
+static inline void dsi_hal_set_packet_header(struct sprd_dsi *dsi,
+				   u8 vc,
+				   u8 type,
+				   u8 wc_lsb,
+				   u8 wc_msb)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->set_packet_header)
+		ops->set_packet_header(ctx, vc, type, wc_lsb, wc_msb);
+}
+/*
+ * Write the payload of the long packet commands
+ * @dsi pointer to structure holding the DSI Host core information
+ * @payload array of bytes of payload
+ */
+static inline
+void dsi_hal_set_packet_payload(struct sprd_dsi *dsi, u32 payload)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->set_packet_payload)
+		ops->set_packet_payload(ctx, payload);
+}
+/*
+ * Write the payload of the long packet commands
+ * @dsi pointer to structure holding the DSI Host core information
+ * @return 32-bit data to hold read information
+ */
+static inline u32 dsi_hal_get_rx_payload(struct sprd_dsi *dsi)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->get_rx_payload)
+		return ops->get_rx_payload(ctx);
+
+	return 0;
+}
+
+/*
+ * Enable Bus Turn-around request
+ * @dsi pointer to structure holding the DSI Host core information
+ * @enable
+ */
+static inline void dsi_hal_bta_en(struct sprd_dsi *dsi, int enable)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->bta_en)
+		ops->bta_en(ctx, enable);
+}
+/*
+ * Enable EOTp reception
+ * @dsi pointer to structure holding the DSI Host core information
+ * @enable
+ */
+static inline void dsi_hal_eotp_rx_en(struct sprd_dsi *dsi, int enable)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->eotp_rx_en)
+		ops->eotp_rx_en(ctx, enable);
+}
+/*
+ * Enable EOTp transmission
+ * @dsi pointer to structure holding the DSI Host core information
+ * @enable
+ */
+static inline void dsi_hal_eotp_tx_en(struct sprd_dsi *dsi, int enable)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->eotp_tx_en)
+		ops->eotp_tx_en(ctx, enable);
+}
+/*
+ * Enable ECC reception, error correction and reporting
+ * @dsi pointer to structure holding the DSI Host core information
+ * @enable
+ */
+static inline void dsi_hal_ecc_rx_en(struct sprd_dsi *dsi, int enable)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->ecc_rx_en)
+		ops->ecc_rx_en(ctx, enable);
+}
+/*
+ * Enable CRC reception, error reporting
+ * @dsi pointer to structure holding the DSI Host core information
+ * @enable
+ */
+static inline void dsi_hal_crc_rx_en(struct sprd_dsi *dsi, int enable)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->crc_rx_en)
+		ops->crc_rx_en(ctx, enable);
+}
+/*
+ * Get status of read command
+ * @dsi pointer to structure holding the DSI Host core information
+ * @return 1 if bta was returned
+ */
+static inline bool dsi_hal_is_bta_returned(struct sprd_dsi *dsi)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->is_bta_returned)
+		return ops->is_bta_returned(ctx);
+
+	return true;
+}
+/*
+ * Get the FULL status of generic read payload fifo
+ * @dsi pointer to structure holding the DSI Host core information
+ * @return 1 if fifo full
+ */
+static inline bool dsi_hal_is_rx_payload_fifo_full(struct sprd_dsi *dsi)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->is_rx_payload_fifo_full)
+		return ops->is_rx_payload_fifo_full(ctx);
+
+	return false;
+}
+/*
+ * Get the EMPTY status of generic read payload fifo
+ * @dsi pointer to structure holding the DSI Host core information
+ * @return 1 if fifo empty
+ */
+static inline bool dsi_hal_is_rx_payload_fifo_empty(struct sprd_dsi *dsi)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->is_rx_payload_fifo_empty)
+		return ops->is_rx_payload_fifo_empty(ctx);
+
+	return true;
+}
+/*
+ * Get the FULL status of generic write payload fifo
+ * @dsi pointer to structure holding the DSI Host core information
+ * @return 1 if fifo full
+ */
+static inline bool dsi_hal_is_tx_payload_fifo_full(struct sprd_dsi *dsi)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->is_tx_payload_fifo_full)
+		return ops->is_tx_payload_fifo_full(ctx);
+
+	return false;
+}
+/*
+ * Get the EMPTY status of generic write payload fifo
+ * @dsi pointer to structure holding the DSI Host core information
+ * @return 1 if fifo empty
+ */
+static inline bool dsi_hal_is_tx_payload_fifo_empty(struct sprd_dsi *dsi)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->is_tx_payload_fifo_empty)
+		return ops->is_tx_payload_fifo_empty(ctx);
+
+	return true;
+}
+/*
+ * Get the FULL status of generic command fifo
+ * @dsi pointer to structure holding the DSI Host core information
+ * @return 1 if fifo full
+ */
+static inline bool dsi_hal_is_tx_cmd_fifo_full(struct sprd_dsi *dsi)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->is_tx_cmd_fifo_full)
+		return ops->is_tx_cmd_fifo_full(ctx);
+
+	return false;
+}
+/*
+ * Get the EMPTY status of generic command fifo
+ * @dsi pointer to structure holding the DSI Host core information
+ * @return 1 if fifo empty
+ */
+static inline bool dsi_hal_is_tx_cmd_fifo_empty(struct sprd_dsi *dsi)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->is_tx_cmd_fifo_empty)
+		return ops->is_tx_cmd_fifo_empty(ctx);
+
+	return true;
+}
+
+static inline
+bool dsi_hal_wait_tx_payload_fifo_empty(struct sprd_dsi *dsi)
+{
+	int timeout;
+
+	for (timeout = 0; timeout < 5000; timeout++) {
+		if (dsi_hal_is_tx_payload_fifo_empty(dsi))
+			return true;
+		udelay(1);
+	}
+
+	pr_err("tx payload fifo is not empty\n");
+	return false;
+}
+
+static inline bool dsi_hal_wait_tx_cmd_fifo_empty(struct sprd_dsi *dsi)
+{
+	int timeout;
+
+	for (timeout = 0; timeout < 5000; timeout++) {
+		if (dsi_hal_is_tx_cmd_fifo_empty(dsi))
+			return true;
+		udelay(1);
+	}
+
+	pr_err("tx cmd fifo is not empty\n");
+	return false;
+}
+
+static inline bool dsi_hal_wait_rd_resp_completed(struct sprd_dsi *dsi)
+{
+	int timeout;
+
+	for (timeout = 0; timeout < 10000; timeout++) {
+		udelay(10);
+		if (dsi_hal_is_bta_returned(dsi))
+			return true;
+	}
+
+	pr_err("wait read response time out\n");
+	return false;
+}
+
+/* only if DPI */
+/*
+ * Configure how many cycles of byte clock would the PHY module take
+ * to switch data lane from high speed to low power
+ * @dsi pointer to structure holding the DSI Host core information
+ * @byte_cycle
+ */
+static inline
+void dsi_hal_datalane_hs2lp_config(struct sprd_dsi *dsi, u16 byte_cycle)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->datalane_hs2lp_config)
+		ops->datalane_hs2lp_config(ctx, byte_cycle);
+}
+/*
+ * Configure how many cycles of byte clock would the PHY module take
+ * to switch the data lane from to low power high speed
+ * @dsi pointer to structure holding the DSI Host core information
+ * @byte_cycle
+ */
+static inline
+void dsi_hal_datalane_lp2hs_config(struct sprd_dsi *dsi, u16 byte_cycle)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->datalane_lp2hs_config)
+		ops->datalane_lp2hs_config(ctx, byte_cycle);
+}
+/*
+ * Configure how many cycles of byte clock would the PHY module take
+ * to switch clock lane from high speed to low power
+ * @dsi pointer to structure holding the DSI Host core information
+ * @byte_cycle
+ */
+static inline
+void dsi_hal_clklane_hs2lp_config(struct sprd_dsi *dsi, u16 byte_cycle)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->clklane_hs2lp_config)
+		ops->clklane_hs2lp_config(ctx, byte_cycle);
+}
+/*
+ * Configure how many cycles of byte clock would the PHY module take
+ * to switch clock lane from to low power high speed
+ * @dsi pointer to structure holding the DSI Host core information
+ * @byte_cycle
+ */
+static inline
+void dsi_hal_clklane_lp2hs_config(struct sprd_dsi *dsi, u16 byte_cycle)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->clklane_lp2hs_config)
+		ops->clklane_lp2hs_config(ctx, byte_cycle);
+}
+/*
+ * Configure how many cycles of byte clock would the PHY module take
+ * to turn the bus around to start receiving
+ * @dsi pointer to structure holding the DSI Host core information
+ * @byte_cycle
+ */
+static inline
+void dsi_hal_max_read_time(struct sprd_dsi *dsi, u16 byte_cycle)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->max_read_time)
+		ops->max_read_time(ctx, byte_cycle);
+}
+/*
+ * Enable the automatic mechanism to stop providing clock in the clock
+ * lane when time allows
+ * @dsi pointer to structure holding the DSI Host core information
+ * @enable
+ */
+static inline void dsi_hal_nc_clk_en(struct sprd_dsi *dsi, int enable)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->nc_clk_en)
+		ops->nc_clk_en(ctx, enable);
+}
+/*
+ * Write transmission escape timeout
+ * a safe guard so that the state machine would reset if transmission
+ * takes too long
+ * @dsi pointer to structure holding the DSI Host core information
+ * @div escape clk division
+ */
+static inline void dsi_hal_tx_escape_division(struct sprd_dsi *dsi, u8 div)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->tx_escape_division)
+		ops->tx_escape_division(ctx, div);
+}
+/* PRESP Time outs */
+/*
+ * configure timeout divisions (so they would have more clock ticks)
+ * @dsi pointer to structure holding the DSI Host core information
+ * @div no of hs cycles before transiting back to LP in
+ * (lane_clk / byte_clk_division_factor)
+ */
+static inline
+void dsi_hal_timeout_clock_division(struct sprd_dsi *dsi, u8 div)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->timeout_clock_division)
+		ops->timeout_clock_division(ctx, div);
+}
+/*
+ * Configure the Low power receive time out
+ * @dsi pointer to structure holding the DSI Host core information
+ * @byte_cycle count of byte cycles
+ */
+static inline
+void dsi_hal_lp_rx_timeout(struct sprd_dsi *dsi, u16 byte_cycle)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->lp_rx_timeout)
+		ops->lp_rx_timeout(ctx, byte_cycle);
+}
+/*
+ * Configure a high speed transmission time out
+ * @dsi pointer to structure holding the DSI Host core information
+ * @byte_cycle
+ */
+static inline
+void dsi_hal_hs_tx_timeout(struct sprd_dsi *dsi, u16 byte_cycle)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->hs_tx_timeout)
+		ops->hs_tx_timeout(ctx, byte_cycle);
+}
+/*
+ * Timeout for peripheral (for controller to stay still) after bus turn around
+ * @dsi pointer to structure holding the DSI Host core information
+ * @byte_cycle period for which the DWC_mipi_dsi_hal_host keeps
+ * the link still, after sending a BTA operation. This period is
+ * measured in cycles of lanebyteclk
+ */
+static inline
+void dsi_hal_bta_presp_timeout(struct sprd_dsi *dsi, u16 byte_cycle)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->bta_presp_timeout)
+		ops->bta_presp_timeout(ctx, byte_cycle);
+}
+/*
+ * Timeout for peripheral (for controller to stay still) after LP data
+ * transmission write requests
+ * @dsi pointer to structure holding the DSI Host core information
+ * @byte_cycle period for which the DWC_mipi_dsi_hal_host keeps
+ * the link still, after sending a low power write operation. This period is
+ * measured in cycles of lanebyteclk
+ */
+static inline
+void dsi_hal_lp_write_presp_timeout(struct sprd_dsi *dsi, u16 byte_cycle)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->lp_write_presp_timeout)
+		ops->lp_write_presp_timeout(ctx, byte_cycle);
+}
+/*
+ * Timeout for peripheral (for controller to stay still) after LP data
+ * transmission read requests
+ * @dsi pointer to structure holding the DSI Host core information
+ * @byte_cycle period for which the DWC_mipi_dsi_hal_host keeps
+ * the link still, after sending a low power read operation. This period is
+ * measured in cycles of lanebyteclk
+ */
+static inline
+void dsi_hal_lp_read_presp_timeout(struct sprd_dsi *dsi, u16 byte_cycle)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->lp_read_presp_timeout)
+		ops->lp_read_presp_timeout(ctx, byte_cycle);
+}
+/*
+ * Timeout for peripheral (for controller to stay still) after HS data
+ * transmission write requests
+ * @dsi pointer to structure holding the DSI Host core information
+ * @byte_cycle period for which the DWC_mipi_dsi_hal_host keeps
+ * the link still, after sending a high-speed write operation. This period is
+ * measured in cycles of lanebyteclk
+ */
+static inline
+void dsi_hal_hs_write_presp_timeout(struct sprd_dsi *dsi, u16 byte_cycle)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->hs_write_presp_timeout)
+		ops->hs_write_presp_timeout(ctx, byte_cycle);
+}
+/*
+ * Timeout for peripheral between HS data transmission read requests
+ * @dsi pointer to structure holding the DSI Host core information
+ * @byte_cycle period for which the DWC_mipi_dsi_hal_host keeps
+ * the link still, after sending a high-speed read operation. This period is
+ * measured in cycles of lanebyteclk
+ */
+static inline
+void dsi_hal_hs_read_presp_timeout(struct sprd_dsi *dsi, u16 byte_cycle)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->hs_read_presp_timeout)
+		ops->hs_read_presp_timeout(ctx, byte_cycle);
+}
+/*
+ * Get the error 0 interrupt register status
+ * @dsi pointer to structure holding the DSI Host core information
+ * @return error status 0 value
+ */
+static inline u32 dsi_hal_int0_status(struct sprd_dsi *dsi)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->int0_status)
+		return ops->int0_status(ctx);
+
+	return 0;
+}
+/*
+ * Get the error 1 interrupt register status
+ * @dsi pointer to structure holding the DSI Host core information
+ * @return error status 1 value
+ */
+static inline u32 dsi_hal_int1_status(struct sprd_dsi *dsi)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->int1_status)
+		return ops->int1_status(ctx);
+
+	return 0;
+}
+/*
+ * Get the error 2 interrupt register status
+ * @dsi pointer to structure holding the DSI Host core information
+ * @return error status 2 value
+ */
+static inline u32 dsi_hal_int2_status(struct sprd_dsi *dsi)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->int2_status)
+		return ops->int2_status(ctx);
+
+	return 0;
+}
+/*
+ * Configure MASK (hiding) of interrupts coming from error 0 source
+ * @dsi pointer to structure holding the DSI Host core information
+ * @mask to be written to the register
+ */
+static inline void dsi_hal_int0_mask(struct sprd_dsi *dsi, u32 mask)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->int0_mask)
+		ops->int0_mask(ctx, mask);
+}
+/*
+ * Configure MASK (hiding) of interrupts coming from error 0 source
+ * @dsi pointer to structure holding the DSI Host core information
+ * @mask the mask to be written to the register
+ */
+static inline void dsi_hal_int1_mask(struct sprd_dsi *dsi, u32 mask)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->int1_mask)
+		ops->int1_mask(ctx, mask);
+}
+/*
+ * Configure MASK (hiding) of interrupts coming from error 0 source
+ * @dsi pointer to structure holding the DSI Host core information
+ * @mask the mask to be written to the register
+ */
+static inline void dsi_hal_int2_mask(struct sprd_dsi *dsi, u32 mask)
+{
+	struct dsi_core_ops *ops = dsi->core;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	if (ops->int2_mask)
+		ops->int2_mask(ctx, mask);
+}
+
+#endif /* MIPI_DSI_HAL_H_ */
diff --git a/drivers/gpu/drm/sprd/sprd_dphy.c b/drivers/gpu/drm/sprd/sprd_dphy.c
new file mode 100644
index 0000000..f30db90
--- /dev/null
+++ b/drivers/gpu/drm/sprd/sprd_dphy.c
@@ -0,0 +1,235 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 Unisoc Inc.
+ */
+
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+#include <linux/pm_runtime.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#include "sprd_dphy.h"
+
+LIST_HEAD(dphy_pll_head);
+LIST_HEAD(dphy_ppi_head);
+LIST_HEAD(dphy_glb_head);
+
+static int regmap_tst_io_write(void *context, u32 reg, u32 val)
+{
+	struct sprd_dphy *dphy = context;
+
+	if (val > 0xff || reg > 0xff)
+		return -EINVAL;
+
+	pr_debug("reg = 0x%02x, val = 0x%02x\n", reg, val);
+
+	sprd_dphy_test_write(dphy, reg, val);
+
+	return 0;
+}
+
+static int regmap_tst_io_read(void *context, u32 reg, u32 *val)
+{
+	struct sprd_dphy *dphy = context;
+	int ret;
+
+	if (reg > 0xff)
+		return -EINVAL;
+
+	ret = sprd_dphy_test_read(dphy, reg);
+	if (ret < 0)
+		return ret;
+
+	*val = ret;
+
+	pr_debug("reg = 0x%02x, val = 0x%02x\n", reg, *val);
+	return 0;
+}
+
+static struct regmap_bus regmap_tst_io = {
+	.reg_write = regmap_tst_io_write,
+	.reg_read = regmap_tst_io_read,
+};
+
+static const struct regmap_config byte_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
+static const struct regmap_config word_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+};
+
+static int sprd_dphy_regmap_init(struct sprd_dphy *dphy)
+{
+	struct dphy_context *ctx = &dphy->ctx;
+	struct regmap *regmap;
+
+	if (ctx->apbbase)
+		regmap = devm_regmap_init_mmio(&dphy->dev,
+			(void __iomem *)ctx->apbbase, &word_config);
+	else
+		regmap = devm_regmap_init(&dphy->dev, &regmap_tst_io,
+					  dphy, &byte_config);
+
+	if (IS_ERR(regmap)) {
+		DRM_ERROR("dphy regmap init failed\n");
+		return PTR_ERR(regmap);
+	}
+
+	ctx->regmap = regmap;
+
+	return 0;
+}
+
+void sprd_dphy_ulps_enter(struct sprd_dphy *dphy)
+{
+	DRM_INFO("dphy ulps enter\n");
+	sprd_dphy_hs_clk_en(dphy, false);
+	sprd_dphy_data_ulps_enter(dphy);
+	sprd_dphy_clk_ulps_enter(dphy);
+}
+
+void sprd_dphy_ulps_exit(struct sprd_dphy *dphy)
+{
+	DRM_INFO("dphy ulps exit\n");
+	sprd_dphy_force_pll(dphy, true);
+	sprd_dphy_clk_ulps_exit(dphy);
+	sprd_dphy_data_ulps_exit(dphy);
+	sprd_dphy_force_pll(dphy, false);
+}
+
+int sprd_dphy_resume(struct sprd_dphy *dphy)
+{
+	int ret;
+
+	if (dphy->glb && dphy->glb->power)
+		dphy->glb->power(&dphy->ctx, true);
+	if (dphy->glb && dphy->glb->enable)
+		dphy->glb->enable(&dphy->ctx);
+
+	ret = sprd_dphy_configure(dphy);
+	if (ret) {
+		DRM_ERROR("sprd dphy init failed\n");
+		return -EINVAL;
+	}
+
+	DRM_INFO("dphy resume OK\n");
+	return ret;
+}
+
+int sprd_dphy_suspend(struct sprd_dphy *dphy)
+{
+	int ret;
+
+	ret = sprd_dphy_close(dphy);
+	if (ret)
+		DRM_ERROR("sprd dphy close failed\n");
+
+	if (dphy->glb && dphy->glb->disable)
+		dphy->glb->disable(&dphy->ctx);
+	if (dphy->glb && dphy->glb->power)
+		dphy->glb->power(&dphy->ctx, false);
+
+	DRM_INFO("dphy suspend OK\n");
+	return ret;
+}
+
+static int sprd_dphy_context_init(struct sprd_dphy *dphy,
+				  struct device_node *np)
+{
+	struct resource r;
+	u32 tmp;
+
+	dphy->ctx.chip_id = 0xffffffff;
+
+	if (dphy->glb && dphy->glb->parse_dt)
+		dphy->glb->parse_dt(&dphy->ctx, np);
+
+	if (!of_address_to_resource(np, 0, &r)) {
+		dphy->ctx.ctrlbase = (unsigned long)
+		    ioremap_nocache(r.start, resource_size(&r));
+		if (dphy->ctx.ctrlbase == 0) {
+			DRM_ERROR("dphy ctrlbase ioremap failed\n");
+			return -EFAULT;
+		}
+	} else {
+		DRM_ERROR("parse dphy ctrl reg base failed\n");
+		return -EINVAL;
+	}
+
+	if (!of_address_to_resource(np, 1, &r)) {
+		DRM_INFO("this dphy has apb reg base\n");
+		dphy->ctx.apbbase = (unsigned long)
+		    ioremap_nocache(r.start, resource_size(&r));
+		if (dphy->ctx.apbbase == 0) {
+			DRM_ERROR("dphy apbbase ioremap failed\n");
+			return -EFAULT;
+		}
+	}
+
+	if (!of_property_read_u32(np, "dev-id", &tmp))
+		dphy->ctx.id = tmp;
+
+	if (!of_property_read_u32(np, "sprd,mipi-drive-capability", &tmp))
+		dphy->ctx.capability = tmp;
+
+	mutex_init(&dphy->ctx.hop_lock);
+
+	return 0;
+}
+
+static int sprd_dphy_probe(struct platform_device *pdev)
+{
+	struct sprd_dphy *dphy;
+	struct device *dsi_dev;
+	int ret;
+
+	dphy = devm_kzalloc(&pdev->dev, sizeof(*dphy), GFP_KERNEL);
+	if (!dphy)
+		return -ENOMEM;
+
+	dsi_dev = sprd_disp_pipe_get_input(&pdev->dev);
+	if (!dsi_dev)
+		return -ENODEV;
+
+	ret = sprd_dphy_context_init(dphy, pdev->dev.of_node);
+	if (ret)
+		return ret;
+
+	sprd_dphy_regmap_init(dphy);
+	platform_set_drvdata(pdev, dphy);
+
+	DRM_INFO("dphy driver probe success\n");
+
+	return 0;
+}
+
+static const struct of_device_id dt_ids[] = {
+	{ .compatible = "sprd,dsi-phy", },
+	{},
+};
+
+static struct platform_driver sprd_dphy_driver = {
+	.probe	= sprd_dphy_probe,
+	.driver = {
+		.name  = "sprd-dphy-drv",
+		.of_match_table	= of_match_ptr(dt_ids),
+	}
+};
+
+module_platform_driver(sprd_dphy_driver);
+
+MODULE_AUTHOR("Leon He <leon.he@unisoc.com>");
+MODULE_AUTHOR("Kevin Tang <kevin.tang@unisoc.com>");
+MODULE_DESCRIPTION("Unisoc SoC MIPI DSI PHY driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/gpu/drm/sprd/sprd_dphy.h b/drivers/gpu/drm/sprd/sprd_dphy.h
new file mode 100644
index 0000000..c35ffa4
--- /dev/null
+++ b/drivers/gpu/drm/sprd/sprd_dphy.h
@@ -0,0 +1,121 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2019 Unisoc Inc.
+ */
+
+#ifndef _SPRD_DPHY_H_
+#define _SPRD_DPHY_H_
+
+#include <asm/types.h>
+#include <linux/device.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+
+#include <drm/drm_print.h>
+
+#include "disp_lib.h"
+
+struct dphy_context {
+	struct regmap *regmap;
+	unsigned long ctrlbase;
+	unsigned long apbbase;
+	struct mutex hop_lock;
+	u32 freq;
+	u8 lanes;
+	u8 id;
+	u8 capability;
+	u32 chip_id;
+};
+
+struct dphy_pll_ops {
+	int (*pll_config)(struct dphy_context *ctx);
+	int (*timing_config)(struct dphy_context *ctx);
+	int (*hop_config)(struct dphy_context *ctx, int delta, int period);
+	int (*ssc_en)(struct dphy_context *ctx, bool en);
+	void (*force_pll)(struct dphy_context *ctx, int force);
+};
+
+struct dphy_ppi_ops {
+	void (*rstz)(struct dphy_context *ctx, int level);
+	void (*shutdownz)(struct dphy_context *ctx, int level);
+	void (*force_pll)(struct dphy_context *ctx, int force);
+	void (*clklane_ulps_rqst)(struct dphy_context *ctx, int en);
+	void (*clklane_ulps_exit)(struct dphy_context *ctx, int en);
+	void (*datalane_ulps_rqst)(struct dphy_context *ctx, int en);
+	void (*datalane_ulps_exit)(struct dphy_context *ctx, int en);
+	void (*stop_wait_time)(struct dphy_context *ctx, u8 byte_clk);
+	void (*datalane_en)(struct dphy_context *ctx);
+	void (*clklane_en)(struct dphy_context *ctx, int en);
+	void (*clk_hs_rqst)(struct dphy_context *ctx, int en);
+	u8 (*is_rx_direction)(struct dphy_context *ctx);
+	u8 (*is_pll_locked)(struct dphy_context *ctx);
+	u8 (*is_rx_ulps_esc_lane0)(struct dphy_context *ctx);
+	u8 (*is_stop_state_clklane)(struct dphy_context *ctx);
+	u8 (*is_stop_state_datalane)(struct dphy_context *ctx);
+	u8 (*is_ulps_active_datalane)(struct dphy_context *ctx);
+	u8 (*is_ulps_active_clklane)(struct dphy_context *ctx);
+	void (*tst_clk)(struct dphy_context *ctx, u8 level);
+	void (*tst_clr)(struct dphy_context *ctx, u8 level);
+	void (*tst_en)(struct dphy_context *ctx, u8 level);
+	u8 (*tst_dout)(struct dphy_context *ctx);
+	void (*tst_din)(struct dphy_context *ctx, u8 data);
+	void (*bist_en)(struct dphy_context *ctx, int en);
+	u8 (*is_bist_ok)(struct dphy_context *ctx);
+};
+
+struct dphy_glb_ops {
+	int (*parse_dt)(struct dphy_context *ctx,
+			struct device_node *np);
+	void (*enable)(struct dphy_context *ctx);
+	void (*disable)(struct dphy_context *ctx);
+	void (*power)(struct dphy_context *ctx, int enable);
+};
+
+struct sprd_dphy {
+	struct device dev;
+	struct dphy_context ctx;
+	struct dphy_ppi_ops *ppi;
+	struct dphy_pll_ops *pll;
+	struct dphy_glb_ops *glb;
+};
+
+extern struct list_head dphy_pll_head;
+extern struct list_head dphy_ppi_head;
+extern struct list_head dphy_glb_head;
+
+#define dphy_pll_ops_register(entry) \
+	disp_ops_register(entry, &dphy_pll_head)
+#define dphy_ppi_ops_register(entry) \
+	disp_ops_register(entry, &dphy_ppi_head)
+#define dphy_glb_ops_register(entry) \
+	disp_ops_register(entry, &dphy_glb_head)
+
+#define dphy_pll_ops_attach(str) \
+	disp_ops_attach(str, &dphy_pll_head)
+#define dphy_ppi_ops_attach(str) \
+	disp_ops_attach(str, &dphy_ppi_head)
+#define dphy_glb_ops_attach(str) \
+	disp_ops_attach(str, &dphy_glb_head)
+
+void sprd_dphy_ulps_enter(struct sprd_dphy *dphy);
+void sprd_dphy_ulps_exit(struct sprd_dphy *dphy);
+int sprd_dphy_resume(struct sprd_dphy *dphy);
+int sprd_dphy_suspend(struct sprd_dphy *dphy);
+
+int sprd_dphy_configure(struct sprd_dphy *dphy);
+void sprd_dphy_reset(struct sprd_dphy *dphy);
+void sprd_dphy_shutdown(struct sprd_dphy *dphy);
+int sprd_dphy_hop_config(struct sprd_dphy *dphy, int delta, int period);
+int sprd_dphy_ssc_en(struct sprd_dphy *dphy, bool en);
+int sprd_dphy_close(struct sprd_dphy *dphy);
+int sprd_dphy_data_ulps_enter(struct sprd_dphy *dphy);
+int sprd_dphy_data_ulps_exit(struct sprd_dphy *dphy);
+int sprd_dphy_clk_ulps_enter(struct sprd_dphy *dphy);
+int sprd_dphy_clk_ulps_exit(struct sprd_dphy *dphy);
+void sprd_dphy_force_pll(struct sprd_dphy *dphy, bool enable);
+void sprd_dphy_hs_clk_en(struct sprd_dphy *dphy, bool enable);
+void sprd_dphy_test_write(struct sprd_dphy *dphy, u8 address, u8 data);
+u8 sprd_dphy_test_read(struct sprd_dphy *dphy, u8 address);
+
+#endif /* _SPRD_DPHY_H_ */
diff --git a/drivers/gpu/drm/sprd/sprd_dsi.c b/drivers/gpu/drm/sprd/sprd_dsi.c
new file mode 100644
index 0000000..9dc711f
--- /dev/null
+++ b/drivers/gpu/drm/sprd/sprd_dsi.c
@@ -0,0 +1,722 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 Unisoc Inc.
+ */
+
+#include <linux/component.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/of_graph.h>
+#include <linux/pm_runtime.h>
+#include <video/mipi_display.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_of.h>
+#include <drm/drm_probe_helper.h>
+
+#include "disp_lib.h"
+#include "sprd_dpu.h"
+#include "sprd_dsi.h"
+#include "dsi/sprd_dsi_api.h"
+
+#define encoder_to_dsi(encoder) \
+	container_of(encoder, struct sprd_dsi, encoder)
+#define host_to_dsi(host) \
+	container_of(host, struct sprd_dsi, host)
+#define connector_to_dsi(connector) \
+	container_of(connector, struct sprd_dsi, connector)
+
+LIST_HEAD(dsi_core_head);
+LIST_HEAD(dsi_glb_head);
+static DEFINE_MUTEX(dsi_lock);
+
+static int sprd_dsi_resume(struct sprd_dsi *dsi)
+{
+	if (dsi->glb && dsi->glb->power)
+		dsi->glb->power(&dsi->ctx, true);
+	if (dsi->glb && dsi->glb->enable)
+		dsi->glb->enable(&dsi->ctx);
+	if (dsi->glb && dsi->glb->reset)
+		dsi->glb->reset(&dsi->ctx);
+
+	sprd_dsi_init(dsi);
+
+	if (dsi->ctx.work_mode == DSI_MODE_VIDEO)
+		sprd_dsi_dpi_video(dsi);
+	else
+		sprd_dsi_edpi_video(dsi);
+
+	DRM_INFO("dsi resume OK\n");
+	return 0;
+}
+
+static int sprd_dsi_suspend(struct sprd_dsi *dsi)
+{
+	sprd_dsi_uninit(dsi);
+
+	if (dsi->glb && dsi->glb->disable)
+		dsi->glb->disable(&dsi->ctx);
+	if (dsi->glb && dsi->glb->power)
+		dsi->glb->power(&dsi->ctx, false);
+
+	DRM_INFO("dsi suspend OK\n");
+	return 0;
+}
+
+/* FIXME: This should be removed in the feature. */
+static void sprd_sharkl3_workaround(struct sprd_dsi *dsi)
+{
+	/* the sharkl3 AA Chip needs to reset D-PHY before HS transmition */
+	if (dsi->phy->ctx.chip_id == 0) {
+		sprd_dphy_reset(dsi->phy);
+		mdelay(1);
+	}
+}
+
+static void sprd_dsi_encoder_enable(struct drm_encoder *encoder)
+{
+	struct sprd_dsi *dsi = encoder_to_dsi(encoder);
+	struct sprd_dpu *dpu = crtc_to_dpu(encoder->crtc);
+	static bool is_enabled = true;
+
+	DRM_INFO("%s()\n", __func__);
+
+	/* add if condition to avoid resume dsi for SR feature */
+	if (encoder->crtc->state->mode_changed &&
+	    !encoder->crtc->state->active_changed)
+		return;
+
+	mutex_lock(&dsi_lock);
+
+	if (dsi->ctx.is_inited) {
+		mutex_unlock(&dsi_lock);
+		DRM_ERROR("dsi is inited\n");
+		return;
+	}
+
+	if (is_enabled) {
+		is_enabled = false;
+		dsi->ctx.is_inited = true;
+		mutex_unlock(&dsi_lock);
+		return;
+	}
+
+	pm_runtime_get_sync(dsi->dev.parent);
+
+	sprd_dsi_resume(dsi);
+	sprd_dphy_resume(dsi->phy);
+
+	sprd_dsi_lp_cmd_enable(dsi, true);
+
+	if (dsi->panel) {
+		drm_panel_prepare(dsi->panel);
+		drm_panel_enable(dsi->panel);
+	}
+
+	sprd_dsi_set_work_mode(dsi, dsi->ctx.work_mode);
+	sprd_dsi_state_reset(dsi);
+
+	sprd_sharkl3_workaround(dsi);
+
+	if (dsi->ctx.nc_clk_en)
+		sprd_dsi_nc_clk_en(dsi, true);
+	else
+		sprd_dphy_hs_clk_en(dsi->phy, true);
+
+	sprd_dpu_run(dpu);
+
+	dsi->ctx.is_inited = true;
+	mutex_unlock(&dsi_lock);
+}
+
+static void sprd_dsi_encoder_disable(struct drm_encoder *encoder)
+{
+	struct sprd_dsi *dsi = encoder_to_dsi(encoder);
+	struct sprd_dpu *dpu = crtc_to_dpu(encoder->crtc);
+
+	DRM_INFO("%s()\n", __func__);
+
+	/* add if condition to avoid suspend dsi for SR feature */
+	if (encoder->crtc->state->mode_changed &&
+	    !encoder->crtc->state->active_changed)
+		return;
+
+	mutex_lock(&dsi_lock);
+
+	if (!dsi->ctx.is_inited) {
+		mutex_unlock(&dsi_lock);
+		DRM_ERROR("dsi isn't inited\n");
+		return;
+	}
+
+	sprd_dpu_stop(dpu);
+	sprd_dsi_set_work_mode(dsi, DSI_MODE_CMD);
+	sprd_dsi_lp_cmd_enable(dsi, true);
+
+	if (dsi->panel) {
+		drm_panel_disable(dsi->panel);
+		sprd_dphy_ulps_enter(dsi->phy);
+		drm_panel_unprepare(dsi->panel);
+	}
+
+	sprd_dphy_suspend(dsi->phy);
+	sprd_dsi_suspend(dsi);
+
+	pm_runtime_put(dsi->dev.parent);
+
+	dsi->ctx.is_inited = false;
+	mutex_unlock(&dsi_lock);
+}
+
+static void sprd_dsi_encoder_mode_set(struct drm_encoder *encoder,
+				 struct drm_display_mode *mode,
+				 struct drm_display_mode *adj_mode)
+{
+	struct sprd_dsi *dsi = encoder_to_dsi(encoder);
+
+	DRM_INFO("%s() set mode: %s\n", __func__, dsi->mode->name);
+}
+
+static int sprd_dsi_encoder_atomic_check(struct drm_encoder *encoder,
+				    struct drm_crtc_state *crtc_state,
+				    struct drm_connector_state *conn_state)
+{
+	DRM_INFO("%s()\n", __func__);
+
+	return 0;
+}
+
+static const struct drm_encoder_helper_funcs sprd_encoder_helper_funcs = {
+	.atomic_check	= sprd_dsi_encoder_atomic_check,
+	.mode_set	= sprd_dsi_encoder_mode_set,
+	.enable		= sprd_dsi_encoder_enable,
+	.disable	= sprd_dsi_encoder_disable
+};
+
+static const struct drm_encoder_funcs sprd_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
+static int sprd_dsi_encoder_init(struct drm_device *drm,
+			       struct sprd_dsi *dsi)
+{
+	struct drm_encoder *encoder = &dsi->encoder;
+	struct device *dev = dsi->host.dev;
+	u32 crtc_mask;
+	int ret;
+
+	crtc_mask = drm_of_find_possible_crtcs(drm, dev->of_node);
+	if (!crtc_mask) {
+		DRM_ERROR("failed to find crtc mask\n");
+		return -EINVAL;
+	}
+	DRM_INFO("find possible crtcs: 0x%08x\n", crtc_mask);
+
+	encoder->possible_crtcs = crtc_mask;
+	ret = drm_encoder_init(drm, encoder, &sprd_encoder_funcs,
+			       DRM_MODE_ENCODER_DSI, NULL);
+	if (ret) {
+		DRM_ERROR("failed to init dsi encoder\n");
+		return ret;
+	}
+
+	drm_encoder_helper_add(encoder, &sprd_encoder_helper_funcs);
+
+	return 0;
+}
+
+static int sprd_dsi_find_panel(struct sprd_dsi *dsi)
+{
+	struct device *dev = dsi->host.dev;
+	struct device_node *child, *lcds_node;
+	struct drm_panel *panel;
+
+	/* search /lcds child node first */
+	lcds_node = of_find_node_by_path("/lcds");
+	for_each_child_of_node(lcds_node, child) {
+		panel = of_drm_find_panel(child);
+		if (panel) {
+			dsi->panel = panel;
+			return 0;
+		}
+	}
+
+	/*
+	 * If /lcds child node search failed, we search
+	 * the child of dsi host node.
+	 */
+	for_each_child_of_node(dev->of_node, child) {
+		panel = of_drm_find_panel(child);
+		if (panel) {
+			dsi->panel = panel;
+			return 0;
+		}
+	}
+
+	DRM_ERROR("of_drm_find_panel() failed\n");
+	return -ENODEV;
+}
+
+static int sprd_dsi_phy_attach(struct sprd_dsi *dsi)
+{
+	struct device *dev;
+
+	dev = sprd_disp_pipe_get_output(&dsi->dev);
+	if (!dev)
+		return -ENODEV;
+
+	dsi->phy = dev_get_drvdata(dev);
+	if (!dsi->phy) {
+		DRM_ERROR("dsi attach phy failed\n");
+		return -EINVAL;
+	}
+
+	dsi->phy->ctx.lanes = dsi->ctx.lanes;
+
+	return 0;
+}
+
+static int sprd_dsi_host_attach(struct mipi_dsi_host *host,
+			   struct mipi_dsi_device *slave)
+{
+	struct sprd_dsi *dsi = host_to_dsi(host);
+	struct dsi_context *ctx = &dsi->ctx;
+	struct device_node *lcd_node;
+	u32 val;
+	int ret;
+
+	DRM_INFO("%s()\n", __func__);
+
+	dsi->slave = slave;
+	ctx->lanes = slave->lanes;
+	ctx->format = slave->format;
+
+	if (slave->mode_flags & MIPI_DSI_MODE_VIDEO)
+		ctx->work_mode = DSI_MODE_VIDEO;
+	else
+		ctx->work_mode = DSI_MODE_CMD;
+
+	if (slave->mode_flags & MIPI_DSI_MODE_VIDEO_BURST)
+		ctx->burst_mode = VIDEO_BURST_WITH_SYNC_PULSES;
+	else if (slave->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
+		ctx->burst_mode = VIDEO_NON_BURST_WITH_SYNC_PULSES;
+	else
+		ctx->burst_mode = VIDEO_NON_BURST_WITH_SYNC_EVENTS;
+
+	if (slave->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS)
+		ctx->nc_clk_en = true;
+
+	ret = sprd_dsi_phy_attach(dsi);
+	if (ret)
+		return ret;
+
+	ret = sprd_dsi_find_panel(dsi);
+	if (ret)
+		return ret;
+
+	lcd_node = dsi->panel->dev->of_node;
+
+	ret = of_property_read_u32(lcd_node, "sprd,phy-bit-clock", &val);
+	if (!ret) {
+		dsi->phy->ctx.freq = val;
+		ctx->byte_clk = val / 8;
+	} else {
+		dsi->phy->ctx.freq = 500000;
+		ctx->byte_clk = 500000 / 8;
+	}
+
+	ret = of_property_read_u32(lcd_node, "sprd,phy-escape-clock", &val);
+	if (!ret)
+		ctx->esc_clk = val > 20000 ? 20000 : val;
+	else
+		ctx->esc_clk = 20000;
+
+	return 0;
+}
+
+static int sprd_dsi_host_detach(struct mipi_dsi_host *host,
+			   struct mipi_dsi_device *slave)
+{
+	DRM_INFO("%s()\n", __func__);
+	/* do nothing */
+	return 0;
+}
+
+static ssize_t sprd_dsi_host_transfer(struct mipi_dsi_host *host,
+				const struct mipi_dsi_msg *msg)
+{
+	struct sprd_dsi *dsi = host_to_dsi(host);
+	const u8 *tx_buf = msg->tx_buf;
+
+	if (msg->rx_buf && msg->rx_len) {
+		u8 lsb = (msg->tx_len > 0) ? tx_buf[0] : 0;
+		u8 msb = (msg->tx_len > 1) ? tx_buf[1] : 0;
+
+		return sprd_dsi_rd_pkt(dsi, msg->channel, msg->type,
+				msb, lsb, msg->rx_buf, msg->rx_len);
+	}
+
+	if (msg->tx_buf && msg->tx_len)
+		return sprd_dsi_wr_pkt(dsi, msg->channel, msg->type,
+					tx_buf, msg->tx_len);
+
+	return 0;
+}
+
+static const struct mipi_dsi_host_ops sprd_dsi_host_ops = {
+	.attach = sprd_dsi_host_attach,
+	.detach = sprd_dsi_host_detach,
+	.transfer = sprd_dsi_host_transfer,
+};
+
+static int sprd_dsi_host_init(struct device *dev, struct sprd_dsi *dsi)
+{
+	int ret;
+
+	dsi->host.dev = dev;
+	dsi->host.ops = &sprd_dsi_host_ops;
+
+	ret = mipi_dsi_host_register(&dsi->host);
+	if (ret)
+		DRM_ERROR("failed to register dsi host\n");
+
+	return ret;
+}
+
+static int sprd_dsi_connector_get_modes(struct drm_connector *connector)
+{
+	struct sprd_dsi *dsi = connector_to_dsi(connector);
+
+	DRM_INFO("%s()\n", __func__);
+
+	return drm_panel_get_modes(dsi->panel);
+}
+
+static enum drm_mode_status
+sprd_dsi_connector_mode_valid(struct drm_connector *connector,
+			 struct drm_display_mode *mode)
+{
+	struct sprd_dsi *dsi = connector_to_dsi(connector);
+	struct drm_display_mode *pmode;
+
+	DRM_INFO("%s() mode: "DRM_MODE_FMT"\n", __func__, DRM_MODE_ARG(mode));
+
+	if (mode->type & DRM_MODE_TYPE_PREFERRED) {
+		dsi->mode = mode;
+		drm_display_mode_to_videomode(dsi->mode, &dsi->ctx.vm);
+	}
+
+	if (mode->type & DRM_MODE_TYPE_BUILTIN) {
+		list_for_each_entry(pmode, &connector->modes, head) {
+			if (pmode->type & DRM_MODE_TYPE_PREFERRED) {
+				list_del(&pmode->head);
+				drm_mode_destroy(connector->dev, pmode);
+				dsi->mode = mode;
+				break;
+			}
+		}
+	}
+
+	return MODE_OK;
+}
+
+static struct drm_encoder *
+sprd_dsi_connector_best_encoder(struct drm_connector *connector)
+{
+	struct sprd_dsi *dsi = connector_to_dsi(connector);
+
+	DRM_INFO("%s()\n", __func__);
+	return &dsi->encoder;
+}
+
+static struct drm_connector_helper_funcs sprd_dsi_connector_helper_funcs = {
+	.get_modes = sprd_dsi_connector_get_modes,
+	.mode_valid = sprd_dsi_connector_mode_valid,
+	.best_encoder = sprd_dsi_connector_best_encoder,
+};
+
+static enum drm_connector_status
+sprd_dsi_connector_detect(struct drm_connector *connector, bool force)
+{
+	struct sprd_dsi *dsi = connector_to_dsi(connector);
+
+	DRM_INFO("%s()\n", __func__);
+
+	if (dsi->panel) {
+		drm_panel_attach(dsi->panel, connector);
+		return connector_status_connected;
+	}
+
+	return connector_status_disconnected;
+}
+
+static void sprd_dsi_connector_destroy(struct drm_connector *connector)
+{
+	DRM_INFO("%s()\n", __func__);
+
+	drm_connector_unregister(connector);
+	drm_connector_cleanup(connector);
+}
+
+static const struct drm_connector_funcs sprd_dsi_atomic_connector_funcs = {
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.detect = sprd_dsi_connector_detect,
+	.destroy = sprd_dsi_connector_destroy,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static int sprd_dsi_connector_init(struct drm_device *drm, struct sprd_dsi *dsi)
+{
+	struct drm_encoder *encoder = &dsi->encoder;
+	struct drm_connector *connector = &dsi->connector;
+	int ret;
+
+	connector->polled = DRM_CONNECTOR_POLL_HPD;
+
+	ret = drm_connector_init(drm, connector,
+				 &sprd_dsi_atomic_connector_funcs,
+				 DRM_MODE_CONNECTOR_DSI);
+	if (ret) {
+		DRM_ERROR("drm_connector_init() failed\n");
+		return ret;
+	}
+
+	drm_connector_helper_add(connector,
+				 &sprd_dsi_connector_helper_funcs);
+
+	drm_connector_attach_encoder(connector, encoder);
+
+	return 0;
+}
+
+static int sprd_dsi_bridge_attach(struct sprd_dsi *dsi)
+{
+	struct drm_encoder *encoder = &dsi->encoder;
+	struct drm_bridge *bridge = dsi->bridge;
+	struct device *dev = dsi->host.dev;
+	struct device_node *bridge_node;
+	int ret;
+
+	bridge_node = of_graph_get_remote_node(dev->of_node, 2, 0);
+	if (!bridge_node)
+		return 0;
+
+	bridge = of_drm_find_bridge(bridge_node);
+	if (!bridge) {
+		DRM_ERROR("of_drm_find_bridge() failed\n");
+		return -ENODEV;
+	}
+	dsi->bridge = bridge;
+
+	ret = drm_bridge_attach(encoder, bridge, NULL);
+	if (ret) {
+		DRM_ERROR("failed to attach external bridge\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int sprd_dsi_glb_init(struct sprd_dsi *dsi)
+{
+	if (dsi->glb && dsi->glb->power)
+		dsi->glb->power(&dsi->ctx, true);
+	if (dsi->glb && dsi->glb->enable)
+		dsi->glb->enable(&dsi->ctx);
+
+	return 0;
+}
+
+static irqreturn_t sprd_dsi_isr(int irq, void *data)
+{
+	u32 status = 0;
+	struct sprd_dsi *dsi = data;
+
+	if (!dsi) {
+		DRM_ERROR("dsi pointer is NULL\n");
+		return IRQ_HANDLED;
+	}
+
+	if (dsi->ctx.irq0 == irq)
+		status = sprd_dsi_int_status(dsi, 0);
+	else if (dsi->ctx.irq1 == irq)
+		status = sprd_dsi_int_status(dsi, 1);
+
+	if (status & DSI_INT_STS_NEED_SOFT_RESET)
+		sprd_dsi_state_reset(dsi);
+
+	return IRQ_HANDLED;
+}
+
+static int sprd_dsi_irq_request(struct sprd_dsi *dsi)
+{
+	int ret;
+	int irq0, irq1;
+	struct dsi_context *ctx = &dsi->ctx;
+
+	irq0 = irq_of_parse_and_map(dsi->host.dev->of_node, 0);
+	if (irq0) {
+		DRM_INFO("dsi irq0 num = %d\n", irq0);
+		ret = request_irq(irq0, sprd_dsi_isr, 0, "DSI_INT0", dsi);
+		if (ret) {
+			DRM_ERROR("dsi failed to request irq int0!\n");
+			return -EINVAL;
+		}
+	}
+	ctx->irq0 = irq0;
+
+	irq1 = irq_of_parse_and_map(dsi->host.dev->of_node, 1);
+	if (irq1) {
+		DRM_INFO("dsi irq1 num = %d\n", irq1);
+		ret = request_irq(irq1, sprd_dsi_isr, 0, "DSI_INT1", dsi);
+		if (ret) {
+			DRM_ERROR("dsi failed to request irq int1!\n");
+			return -EINVAL;
+		}
+	}
+	ctx->irq1 = irq1;
+
+	return 0;
+}
+
+static int sprd_dsi_bind(struct device *dev, struct device *master, void *data)
+{
+	struct drm_device *drm = data;
+	struct sprd_dsi *dsi = dev_get_drvdata(dev);
+	int ret;
+
+	ret = sprd_dsi_encoder_init(drm, dsi);
+	if (ret)
+		goto cleanup_host;
+
+	ret = sprd_dsi_connector_init(drm, dsi);
+	if (ret)
+		goto cleanup_encoder;
+
+	ret = sprd_dsi_bridge_attach(dsi);
+	if (ret)
+		goto cleanup_connector;
+
+	ret = sprd_dsi_glb_init(dsi);
+	if (ret)
+		goto cleanup_connector;
+
+	ret = sprd_dsi_irq_request(dsi);
+	if (ret)
+		goto cleanup_connector;
+
+	return 0;
+
+cleanup_connector:
+	drm_connector_cleanup(&dsi->connector);
+cleanup_encoder:
+	drm_encoder_cleanup(&dsi->encoder);
+cleanup_host:
+	mipi_dsi_host_unregister(&dsi->host);
+	return ret;
+}
+
+static void sprd_dsi_unbind(struct device *dev,
+			struct device *master, void *data)
+{
+	/* do nothing */
+	DRM_INFO("%s()\n", __func__);
+
+}
+
+static const struct component_ops dsi_component_ops = {
+	.bind	= sprd_dsi_bind,
+	.unbind	= sprd_dsi_unbind,
+};
+
+static int sprd_dsi_context_init(struct sprd_dsi *dsi, struct device_node *np)
+{
+	struct dsi_context *ctx = &dsi->ctx;
+	struct resource r;
+
+	if (dsi->glb && dsi->glb->parse_dt)
+		dsi->glb->parse_dt(&dsi->ctx, np);
+
+	if (of_address_to_resource(np, 0, &r)) {
+		DRM_ERROR("parse dsi ctrl reg base failed\n");
+		return -ENODEV;
+	}
+	ctx->base = (unsigned long)
+	    ioremap_nocache(r.start, resource_size(&r));
+	if (ctx->base == 0) {
+		DRM_ERROR("dsi ctrl reg base ioremap failed\n");
+		return -ENODEV;
+	}
+
+	ctx->data_hs2lp = 120;
+	ctx->data_lp2hs = 500;
+	ctx->clk_hs2lp = 4;
+	ctx->clk_lp2hs = 15;
+	ctx->max_rd_time = 6000;
+	ctx->int0_mask = 0xffffffff;
+	ctx->int1_mask = 0xffffffff;
+
+	return 0;
+}
+
+static int sprd_dsi_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct sprd_dsi *dsi;
+	int ret;
+
+	dsi = devm_kzalloc(&pdev->dev, sizeof(*dsi), GFP_KERNEL);
+	if (!dsi) {
+		DRM_ERROR("failed to allocate dsi data.\n");
+		return -ENOMEM;
+	}
+
+	ret = sprd_dsi_context_init(dsi, np);
+	if (ret)
+		return -EINVAL;
+
+	platform_set_drvdata(pdev, dsi);
+
+	ret = sprd_dsi_host_init(&pdev->dev, dsi);
+	if (ret)
+		return ret;
+
+	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_get_noresume(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+
+	return component_add(&pdev->dev, &dsi_component_ops);
+}
+
+static int sprd_dsi_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &dsi_component_ops);
+
+	return 0;
+}
+
+static const struct of_device_id sprd_dsi_of_match[] = {
+	{.compatible = "sprd,dsi-host"},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, sprd_dsi_of_match);
+
+static struct platform_driver sprd_dsi_driver = {
+	.probe = sprd_dsi_probe,
+	.remove = sprd_dsi_remove,
+	.driver = {
+		.name = "sprd-dsi-drv",
+		.of_match_table = sprd_dsi_of_match,
+	},
+};
+
+module_platform_driver(sprd_dsi_driver);
+
+MODULE_AUTHOR("Leon He <leon.he@unisoc.com>");
+MODULE_AUTHOR("Kevin Tang <kevin.tang@unisoc.com>");
+MODULE_DESCRIPTION("Unisoc MIPI DSI HOST Controller Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/gpu/drm/sprd/sprd_dsi.h b/drivers/gpu/drm/sprd/sprd_dsi.h
new file mode 100644
index 0000000..0f8f40c
--- /dev/null
+++ b/drivers/gpu/drm/sprd/sprd_dsi.h
@@ -0,0 +1,210 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2019 Unisoc Inc.
+ */
+
+#ifndef __SPRD_DSI_H__
+#define __SPRD_DSI_H__
+
+#include <linux/of.h>
+#include <linux/device.h>
+#include <video/videomode.h>
+
+#include <drm/drm_bridge.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_encoder.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_print.h>
+#include <drm/drm_panel.h>
+
+#include "disp_lib.h"
+#include "sprd_dphy.h"
+
+#define DSI_INT_STS_NEED_SOFT_RESET	BIT(0)
+#define DSI_INT_STS_NEED_HARD_RESET	BIT(1)
+
+enum dsi_work_mode {
+	DSI_MODE_CMD = 0,
+	DSI_MODE_VIDEO
+};
+
+enum video_burst_mode {
+	VIDEO_NON_BURST_WITH_SYNC_PULSES = 0,
+	VIDEO_NON_BURST_WITH_SYNC_EVENTS,
+	VIDEO_BURST_WITH_SYNC_PULSES
+};
+
+enum dsi_color_coding {
+	COLOR_CODE_16BIT_CONFIG1	=  0,
+	COLOR_CODE_16BIT_CONFIG2	=  1,
+	COLOR_CODE_16BIT_CONFIG3	=  2,
+	COLOR_CODE_18BIT_CONFIG1	=  3,
+	COLOR_CODE_18BIT_CONFIG2	=  4,
+	COLOR_CODE_24BIT		=  5,
+	COLOR_CODE_20BIT_YCC422_LOOSELY	=  6,
+	COLOR_CODE_24BIT_YCC422		=  7,
+	COLOR_CODE_16BIT_YCC422		=  8,
+	COLOR_CODE_30BIT		=  9,
+	COLOR_CODE_36BIT		= 10,
+	COLOR_CODE_12BIT_YCC420		= 11,
+	COLOR_CODE_COMPRESSTION		= 12,
+	COLOR_CODE_MAX
+};
+
+struct dsi_context {
+	unsigned long base;
+	u8 id;
+	u8 channel;
+	u8 lanes;
+	u32 format;
+	u8 work_mode;
+	u8 burst_mode;
+	struct videomode vm;
+
+	int irq0;
+	int irq1;
+	u32 int0_mask;
+	u32 int1_mask;
+	bool is_inited;
+
+	/* byte clock [KHz] */
+	u32 byte_clk;
+	/* escape clock [KHz] */
+	u32 esc_clk;
+
+	/* maximum time (ns) for data lanes from HS to LP */
+	u16 data_hs2lp;
+	/* maximum time (ns) for data lanes from LP to HS */
+	u16 data_lp2hs;
+	/* maximum time (ns) for clk lanes from HS to LP */
+	u16 clk_hs2lp;
+	/* maximum time (ns) for clk lanes from LP to HS */
+	u16 clk_lp2hs;
+	/* maximum time (ns) for BTA operation - REQUIRED */
+	u16 max_rd_time;
+
+	/* is 18-bit loosely packets (valid only when BPP == 18) */
+	bool is_18_loosely;
+	/* enable receiving frame ack packets - for video mode */
+	bool frame_ack_en;
+	/* enable receiving tear effect ack packets - for cmd mode */
+	bool te_ack_en;
+	/* enable non coninuous clock for energy saving */
+	bool nc_clk_en;
+};
+
+struct dsi_core_ops {
+	bool (*check_version)(struct dsi_context *ctx);
+	void (*power_en)(struct dsi_context *ctx, int enable);
+	void (*video_mode)(struct dsi_context *ctx);
+	void (*cmd_mode)(struct dsi_context *ctx);
+	bool (*is_cmd_mode)(struct dsi_context *ctx);
+	void (*rx_vcid)(struct dsi_context *ctx, u8 vc);
+	void (*video_vcid)(struct dsi_context *ctx, u8 vc);
+	void (*dpi_video_burst_mode)(struct dsi_context *ctx, int mode);
+	void (*dpi_color_coding)(struct dsi_context *ctx, int coding);
+	void (*dpi_18_loosely_packet_en)(struct dsi_context *ctx, int enable);
+	void (*dpi_color_mode_pol)(struct dsi_context *ctx, int active_low);
+	void (*dpi_shut_down_pol)(struct dsi_context *ctx, int active_low);
+	void (*dpi_hsync_pol)(struct dsi_context *ctx, int active_low);
+	void (*dpi_vsync_pol)(struct dsi_context *ctx, int active_low);
+	void (*dpi_data_en_pol)(struct dsi_context *ctx, int active_low);
+	void (*dpi_sig_delay)(struct dsi_context *ctx, u16 byte_cycle);
+	void (*dpi_hline_time)(struct dsi_context *ctx, u16 byte_cycle);
+	void (*dpi_hsync_time)(struct dsi_context *ctx, u16 byte_cycle);
+	void (*dpi_hbp_time)(struct dsi_context *ctx, u16 byte_cycle);
+	void (*dpi_vact)(struct dsi_context *ctx, u16 lines);
+	void (*dpi_vfp)(struct dsi_context *ctx, u16 lines);
+	void (*dpi_vbp)(struct dsi_context *ctx, u16 lines);
+	void (*dpi_vsync)(struct dsi_context *ctx, u16 lines);
+	void (*dpi_hporch_lp_en)(struct dsi_context *ctx, int enable);
+	void (*dpi_vporch_lp_en)(struct dsi_context *ctx, int enable);
+	void (*dpi_frame_ack_en)(struct dsi_context *ctx, int enable);
+	void (*dpi_null_packet_en)(struct dsi_context *ctx, int enable);
+	void (*dpi_multi_packet_en)(struct dsi_context *ctx, int enable);
+	void (*dpi_chunk_num)(struct dsi_context *ctx, u16 no);
+	void (*dpi_null_packet_size)(struct dsi_context *ctx, u16 size);
+	void (*dpi_video_packet_size)(struct dsi_context *ctx, u16 size);
+	void (*edpi_max_pkt_size)(struct dsi_context *ctx, u16 size);
+	void (*edpi_video_hs_en)(struct dsi_context *ctx, int enable);
+	void (*tear_effect_ack_en)(struct dsi_context *ctx, int enable);
+	void (*cmd_ack_request_en)(struct dsi_context *ctx, int enable);
+	void (*cmd_mode_lp_cmd_en)(struct dsi_context *ctx, int enable);
+	void (*video_mode_lp_cmd_en)(struct dsi_context *ctx, int enable);
+	void (*set_packet_header)(struct dsi_context *ctx, u8 vc, u8 type,
+							u8 wc_lsb, u8 wc_msb);
+	void (*set_packet_payload)(struct dsi_context *ctx, u32 payload);
+	u32 (*get_rx_payload)(struct dsi_context *ctx);
+	void (*bta_en)(struct dsi_context *ctx, int enable);
+	void (*eotp_rx_en)(struct dsi_context *ctx, int enable);
+	void (*eotp_tx_en)(struct dsi_context *ctx, int enable);
+	void (*ecc_rx_en)(struct dsi_context *ctx, int enable);
+	void (*crc_rx_en)(struct dsi_context *ctx, int enable);
+	bool (*is_bta_returned)(struct dsi_context *ctx);
+	bool (*is_rx_payload_fifo_full)(struct dsi_context *ctx);
+	bool (*is_rx_payload_fifo_empty)(struct dsi_context *ctx);
+	bool (*is_tx_payload_fifo_full)(struct dsi_context *ctx);
+	bool (*is_tx_payload_fifo_empty)(struct dsi_context *ctx);
+	bool (*is_tx_cmd_fifo_full)(struct dsi_context *ctx);
+	bool (*is_tx_cmd_fifo_empty)(struct dsi_context *ctx);
+	void (*datalane_hs2lp_config)(struct dsi_context *ctx, u16 byte_cycle);
+	void (*datalane_lp2hs_config)(struct dsi_context *ctx, u16 byte_cycle);
+	void (*clklane_hs2lp_config)(struct dsi_context *ctx, u16 byte_cycle);
+	void (*clklane_lp2hs_config)(struct dsi_context *ctx, u16 byte_cycle);
+	void (*max_read_time)(struct dsi_context *ctx, u16 byte_cycle);
+	void (*nc_clk_en)(struct dsi_context *ctx, int enable);
+	void (*tx_escape_division)(struct dsi_context *ctx, u8 div);
+	void (*timeout_clock_division)(struct dsi_context *ctx,	u8 div);
+	void (*lp_rx_timeout)(struct dsi_context *ctx, u16 count);
+	void (*hs_tx_timeout)(struct dsi_context *ctx, u16 count);
+	void (*bta_presp_timeout)(struct dsi_context *ctx, u16 byteclk);
+	void (*lp_write_presp_timeout)(struct dsi_context *ctx, u16 byteclk);
+	void (*lp_read_presp_timeout)(struct dsi_context *ctx, u16 byteclk);
+	void (*hs_write_presp_timeout)(struct dsi_context *ctx, u16 byteclk);
+	void (*hs_read_presp_timeout)(struct dsi_context *ctx, u16 byteclk);
+	u32 (*int0_status)(struct dsi_context *ctx);
+	u32 (*int1_status)(struct dsi_context *ctx);
+	u32 (*int2_status)(struct dsi_context *ctx);
+	void (*int0_mask)(struct dsi_context *ctx, u32 mask);
+	void (*int1_mask)(struct dsi_context *ctx, u32 mask);
+	void (*int2_mask)(struct dsi_context *ctx, u32 mask);
+};
+
+struct dsi_glb_ops {
+	int (*parse_dt)(struct dsi_context *ctx,
+			struct device_node *np);
+	void (*enable)(struct dsi_context *ctx);
+	void (*disable)(struct dsi_context *ctx);
+	void (*reset)(struct dsi_context *ctx);
+	void (*power)(struct dsi_context *ctx, int enable);
+};
+
+struct sprd_dsi {
+	struct device dev;
+	struct mipi_dsi_host host;
+	struct mipi_dsi_device *slave;
+	struct drm_encoder encoder;
+	struct drm_connector connector;
+	struct drm_bridge *bridge;
+	struct drm_panel *panel;
+	struct drm_display_mode *mode;
+	struct sprd_dphy *phy;
+	struct dsi_core_ops *core;
+	struct dsi_glb_ops *glb;
+	struct dsi_context ctx;
+};
+
+extern struct list_head dsi_core_head;
+extern struct list_head dsi_glb_head;
+
+#define dsi_core_ops_register(entry) \
+	disp_ops_register(entry, &dsi_core_head)
+#define dsi_glb_ops_register(entry) \
+	disp_ops_register(entry, &dsi_glb_head)
+
+#define dsi_core_ops_attach(str) \
+	disp_ops_attach(str, &dsi_core_head)
+#define dsi_glb_ops_attach(str) \
+	disp_ops_attach(str, &dsi_glb_head)
+
+#endif /* __SPRD_DSI_H__ */
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
