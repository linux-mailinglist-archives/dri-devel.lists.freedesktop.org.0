Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD6B5BD2D9
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 19:00:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D53510E06B;
	Mon, 19 Sep 2022 16:59:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB29510E076
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 16:59:48 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id m3so80331eda.12
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 09:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date;
 bh=pe51xvlTzoxvP1PkLEmQi5YJGHaBQkqHjYX/h+KRrX4=;
 b=B+X1p1fH4JpGs34rfSwYzzSHzwu5qnL83GcremhYxa34LPTfzyuT54Qx4NkUrP80pu
 pQuuF2QUVoy7vzZV3h6TrERow//gfDL5XfrnuPPuhc+B4RHI2qc+3ex/jWKQ63RA0DfF
 hBB0zWcx0Lk6XvWHsF7Jch4RHJgIiSY2LK6gxuWKN/rgLWdkiQ6mLPjpWh4cz4AHHPtT
 pC4zGQhthMR+WPSyxbXBMc3qQw3YfboFI7Q7Yy9Bgo6ddHWkCSfutvSn4/NE2FUgXx1e
 NM29wYa2a+PX3vs2XgVJk1y+K5rnO2tGCxRjBGuogh3F3cFoZXeNpiG1Tcq1hcgaNJxd
 w1+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=pe51xvlTzoxvP1PkLEmQi5YJGHaBQkqHjYX/h+KRrX4=;
 b=k2P+mVIqnPfxh0/35O/dbHdgcn1i/DBq+jpOF5Nf7o6eJkFnvLBz7PzhpY8wDMP1k7
 cFMsgLs+E36Z6itJR5kpSmfWcfQIqm+hiMwy4w/T7mQRxLHWdF5ix7+j/4AWYnRcHrQE
 cI/yZgA0pUB+QqLtwYl/50nqKpNE0lGNiyJsieVcDXw/Ap5GcdWUsuGE79YwrbPZcFx3
 PuUpIVIVpFEVjAvZcR7nqpKxirOlsBUI7cxvq7qsMx/mx7ckuAWIMYXBr7COGF1p7Fts
 HdVh3UKX31Y5EptS+kQwKBmtTpQNnM2PPGo4OJE3F2QmfQF6wDL0WQCkRVk3LRUvW2Ey
 9OQw==
X-Gm-Message-State: ACrzQf2AJUFhVp+3SAjPpgRPJFltb4tsJjdnGkNfANEnNboriV38i4dK
 9bX168XshSbhM2vuac1l86g8Lqy/AIrBrw==
X-Google-Smtp-Source: AMsMyM4Kcqj7iaeTFSgnPboPDJcmYDvSGBzBAfopbwGlsGHAlwhMCX86GfBtADSsZGEx5aSm5j7eEQ==
X-Received: by 2002:a05:6402:2b8b:b0:43a:5475:f1ae with SMTP id
 fj11-20020a0564022b8b00b0043a5475f1aemr16246555edb.363.1663606787204; 
 Mon, 19 Sep 2022 09:59:47 -0700 (PDT)
Received: from [127.0.0.1]
 (2a02-8440-6340-f287-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6340:f287:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 cf16-20020a0564020b9000b0044fc3c0930csm20424246edb.16.2022.09.19.09.59.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 09:59:46 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Mon, 19 Sep 2022 18:56:00 +0200
Subject: [PATCH v1 02/17] clk: mediatek: add VDOSYS1 clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220919-v1-2-4844816c9808@baylibre.com>
References: <20220919-v1-0-4844816c9808@baylibre.com>
In-Reply-To: <20220919-v1-0-4844816c9808@baylibre.com>
To: Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@linux.ie>, 
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
X-Mailer: b4 0.10.0-dev
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
Cc: devicetree@vger.kernel.org, Guillaume Ranquet <granquet@baylibre.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 Pablo Sun <pablo.sun@mediatek.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Pablo Sun <pablo.sun@mediatek.com>

Add the clock gate definition for the DPI1 hardware
in VDOSYS1.

The parent clock "hdmi_txpll" is already defined in
`mt8195.dtsi`.

Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

diff --git a/drivers/clk/mediatek/clk-mt8195-vdo1.c b/drivers/clk/mediatek/clk-mt8195-vdo1.c
index d54d7726d186..835335b9d87b 100644
--- a/drivers/clk/mediatek/clk-mt8195-vdo1.c
+++ b/drivers/clk/mediatek/clk-mt8195-vdo1.c
@@ -34,6 +34,12 @@ static const struct mtk_gate_regs vdo1_3_cg_regs = {
 	.sta_ofs = 0x140,
 };
 
+static const struct mtk_gate_regs vdo1_4_cg_regs = {
+	.set_ofs = 0x400,
+	.clr_ofs = 0x400,
+	.sta_ofs = 0x400,
+};
+
 #define GATE_VDO1_0(_id, _name, _parent, _shift)			\
 	GATE_MTK(_id, _name, _parent, &vdo1_0_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
 
@@ -50,6 +56,9 @@ static const struct mtk_gate_regs vdo1_3_cg_regs = {
 #define GATE_VDO1_3(_id, _name, _parent, _shift)			\
 	GATE_MTK(_id, _name, _parent, &vdo1_3_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
 
+#define GATE_VDO1_4(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &vdo1_4_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
+
 static const struct mtk_gate vdo1_clks[] = {
 	/* VDO1_0 */
 	GATE_VDO1_0(CLK_VDO1_SMI_LARB2, "vdo1_smi_larb2", "top_vpp", 0),
@@ -107,6 +116,8 @@ static const struct mtk_gate vdo1_clks[] = {
 	GATE_VDO1_2(CLK_VDO1_DISP_MONITOR_DPINTF, "vdo1_disp_monitor_dpintf", "top_vpp", 17),
 	/* VDO1_3 */
 	GATE_VDO1_3(CLK_VDO1_26M_SLOW, "vdo1_26m_slow", "clk26m", 8),
+	/* VDO1_4 */
+	GATE_VDO1_4(CLK_VDO1_DPI1_HDMI, "vdo1_dpi1_hdmi", "hdmi_txpll", 0),
 };
 
 static int clk_mt8195_vdo1_probe(struct platform_device *pdev)

-- 
b4 0.10.0-dev
