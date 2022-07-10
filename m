Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7406956D122
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 21:45:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 041B118B069;
	Sun, 10 Jul 2022 19:44:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47ED618B063
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 19:44:53 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 9FF2F8461E;
 Sun, 10 Jul 2022 21:44:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1657482291;
 bh=cBSK1zh1azX+SEYJM5neteLsAtlrytHE29/neTAWXUs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M/E2rSNl0DiwvUuMOpqz0p9qEfGQuRUW7KN0bmMgu74FBR7UpYKd6tstV9ea/hi7f
 BT0BnUwY3ESiK5OhFh5lWPEH0/xYsH1syrn849QzgXfQZklVqq2T3QJ8jJhC5xrEYj
 nbJDIK8KGxqgfX1ypfJI88dMItGPVaWZFDbki7WDV0uGjeI54lgiCLnfevrAt83x3r
 sujirkW9BEbTQ1XHPXR7PNKCzjW4SkxJffY4bJhCc8bSapG7UhWeDygu5Y1D2tJIkf
 m9FJPVQAYsQinyTPKhFpIx3LmXUhHK6YRfoJIY8QqA93iDHzmxq3PlZIjCSJDapPEO
 aJTC1+LIcGGOw==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 8/9] drm/panel/panel-sitronix-st7701: Parametrize voltage and
 timing
Date: Sun, 10 Jul 2022 21:44:36 +0200
Message-Id: <20220710194437.289042-8-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220710194437.289042-1-marex@denx.de>
References: <20220710194437.289042-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, robert.foss@linaro.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of hard-coding TFT matrix voltage and timing settings, which can
even lead to permanent TFT matrix damage, parametrize them in TFT matrix
descriptor.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Guido Günther <agx@sigxcpu.org>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
---
 drivers/gpu/drm/panel/panel-sitronix-st7701.c | 155 ++++++++++++++----
 1 file changed, 127 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
index 177180f1c2c8..bf7237c1abcc 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
@@ -79,30 +79,34 @@
 #define DSI_CMD2_BK0_INVSEL_RTNI_MASK	GENMASK(4, 0)
 
 /* Command2, BK1 bytes */
-#define DSI_CMD2_BK1_VRHA_SET		0x45
-#define DSI_CMD2_BK1_VCOM_SET		0x13
-#define DSI_CMD2_BK1_VGHSS_SET		GENMASK(2, 0)
+#define DSI_CMD2_BK1_VRHA_MASK		GENMASK(7, 0)
+#define DSI_CMD2_BK1_VCOM_MASK		GENMASK(7, 0)
+#define DSI_CMD2_BK1_VGHSS_MASK		GENMASK(3, 0)
 #define DSI_CMD2_BK1_TESTCMD_VAL	BIT(7)
-#define DSI_VGLS_DEFAULT		BIT(6)
-#define DSI_VGLS_SEL			GENMASK(2, 0)
-#define DSI_CMD2_BK1_VGLS_SET		(DSI_VGLS_DEFAULT | DSI_VGLS_SEL)
-#define DSI_PWCTLR1_AP			BIT(7) /* Gamma OP bias, max */
-#define DSI_PWCTLR1_APIS		BIT(2) /* Source OP input bias, min */
-#define DSI_PWCTLR1_APOS		BIT(0) /* Source OP output bias, min */
-#define DSI_CMD2_BK1_PWCTLR1_SET	(DSI_PWCTLR1_AP | DSI_PWCTLR1_APIS | \
-					DSI_PWCTLR1_APOS)
-#define DSI_PWCTLR2_AVDD		BIT(5) /* AVDD 6.6v */
-#define DSI_PWCTLR2_AVCL		0x0    /* AVCL -4.4v */
-#define DSI_CMD2_BK1_PWCTLR2_SET	(DSI_PWCTLR2_AVDD | DSI_PWCTLR2_AVCL)
-#define DSI_SPD1_T2D			BIT(3)
-#define DSI_CMD2_BK1_SPD1_SET		(GENMASK(6, 4) | DSI_SPD1_T2D)
-#define DSI_CMD2_BK1_SPD2_SET		DSI_CMD2_BK1_SPD1_SET
-#define DSI_MIPISET1_EOT_EN		BIT(3)
-#define DSI_CMD2_BK1_MIPISET1_SET	(BIT(7) | DSI_MIPISET1_EOT_EN)
+#define DSI_CMD2_BK1_VGLS_ONES		BIT(6)
+#define DSI_CMD2_BK1_VGLS_MASK		GENMASK(3, 0)
+#define DSI_CMD2_BK1_PWRCTRL1_AP_MASK	GENMASK(7, 6)
+#define DSI_CMD2_BK1_PWRCTRL1_APIS_MASK	GENMASK(3, 2)
+#define DSI_CMD2_BK1_PWRCTRL1_APOS_MASK	GENMASK(1, 0)
+#define DSI_CMD2_BK1_PWRCTRL2_AVDD_MASK	GENMASK(5, 4)
+#define DSI_CMD2_BK1_PWRCTRL2_AVCL_MASK	GENMASK(1, 0)
+#define DSI_CMD2_BK1_SPD1_ONES_MASK	GENMASK(6, 4)
+#define DSI_CMD2_BK1_SPD1_T2D_MASK	GENMASK(3, 0)
+#define DSI_CMD2_BK1_SPD2_ONES_MASK	GENMASK(6, 4)
+#define DSI_CMD2_BK1_SPD2_T3D_MASK	GENMASK(3, 0)
+#define DSI_CMD2_BK1_MIPISET1_ONES	BIT(7)
+#define DSI_CMD2_BK1_MIPISET1_EOT_EN	BIT(3)
 
 #define CFIELD_PREP(_mask, _val)					\
 	(((typeof(_mask))(_val) << (__builtin_ffsll(_mask) - 1)) & (_mask))
 
+enum op_bias {
+	OP_BIAS_OFF = 0,
+	OP_BIAS_MIN,
+	OP_BIAS_MIDDLE,
+	OP_BIAS_MAX
+};
+
 struct st7701_panel_desc {
 	const struct drm_display_mode *mode;
 	unsigned int lanes;
@@ -113,6 +117,18 @@ struct st7701_panel_desc {
 	const u8	pv_gamma[16];	/* Positive voltage gamma control */
 	const u8	nv_gamma[16];	/* Negative voltage gamma control */
 	const u8	nlinv;		/* Inversion selection */
+	const u32	vop_uv;		/* Vop in uV */
+	const u32	vcom_uv;	/* Vcom in uV */
+	const u16	vgh_mv;		/* Vgh in mV */
+	const s16	vgl_mv;		/* Vgl in mV */
+	const u16	avdd_mv;	/* Avdd in mV */
+	const s16	avcl_mv;	/* Avcl in mV */
+	const enum op_bias	gamma_op_bias;
+	const enum op_bias	input_op_bias;
+	const enum op_bias	output_op_bias;
+	const u16	t2d_ns;		/* T2D in ns */
+	const u16	t3d_ns;		/* T3D in ns */
+	const bool	eot_en;
 };
 
 struct st7701 {
@@ -142,6 +158,31 @@ static inline int st7701_dsi_write(struct st7701 *st7701, const void *seq,
 		st7701_dsi_write(st7701, d, ARRAY_SIZE(d));	\
 	}
 
+static u8 st7701_vgls_map(struct st7701 *st7701)
+{
+	const struct st7701_panel_desc *desc = st7701->desc;
+	struct {
+		s32	vgl;
+		u8	val;
+	} map[16] = {
+		{ -7060, 0x0 }, { -7470, 0x1 },
+		{ -7910, 0x2 }, { -8140, 0x3 },
+		{ -8650, 0x4 }, { -8920, 0x5 },
+		{ -9210, 0x6 }, { -9510, 0x7 },
+		{ -9830, 0x8 }, { -10170, 0x9 },
+		{ -10530, 0xa }, { -10910, 0xb },
+		{ -11310, 0xc }, { -11730, 0xd },
+		{ -12200, 0xe }, { -12690, 0xf }
+	};
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(map); i++)
+		if (desc->vgl_mv == map[i].vgl)
+			return map[i].val;
+
+	return 0;
+}
+
 static void st7701_init_sequence(struct st7701 *st7701)
 {
 	const struct st7701_panel_desc *desc = st7701->desc;
@@ -200,16 +241,62 @@ static void st7701_init_sequence(struct st7701 *st7701)
 	/* Command2, BK1 */
 	ST7701_DSI(st7701, DSI_CMD2BKX_SEL,
 			0x77, 0x01, 0x00, 0x00, DSI_CMD2BK1_SEL);
-	ST7701_DSI(st7701, DSI_CMD2_BK1_VRHS, DSI_CMD2_BK1_VRHA_SET);
-	ST7701_DSI(st7701, DSI_CMD2_BK1_VCOM, DSI_CMD2_BK1_VCOM_SET);
-	ST7701_DSI(st7701, DSI_CMD2_BK1_VGHSS, DSI_CMD2_BK1_VGHSS_SET);
+
+	/* Vop = 3.5375V + (VRHA[7:0] * 0.0125V) */
+	ST7701_DSI(st7701, DSI_CMD2_BK1_VRHS,
+		   FIELD_PREP(DSI_CMD2_BK1_VRHA_MASK,
+			      DIV_ROUND_CLOSEST(desc->vop_uv - 3537500, 12500)));
+
+	/* Vcom = 0.1V + (VCOM[7:0] * 0.0125V) */
+	ST7701_DSI(st7701, DSI_CMD2_BK1_VCOM,
+		   FIELD_PREP(DSI_CMD2_BK1_VCOM_MASK,
+			      DIV_ROUND_CLOSEST(desc->vcom_uv - 100000, 12500)));
+
+	/* Vgh = 11.5V + (VGHSS[7:0] * 0.5V) */
+	ST7701_DSI(st7701, DSI_CMD2_BK1_VGHSS,
+		   FIELD_PREP(DSI_CMD2_BK1_VGHSS_MASK,
+			      DIV_ROUND_CLOSEST(clamp(desc->vgh_mv,
+						      (u16)11500,
+						      (u16)17000) - 11500,
+						500)));
+
 	ST7701_DSI(st7701, DSI_CMD2_BK1_TESTCMD, DSI_CMD2_BK1_TESTCMD_VAL);
-	ST7701_DSI(st7701, DSI_CMD2_BK1_VGLS, DSI_CMD2_BK1_VGLS_SET);
-	ST7701_DSI(st7701, DSI_CMD2_BK1_PWCTLR1, DSI_CMD2_BK1_PWCTLR1_SET);
-	ST7701_DSI(st7701, DSI_CMD2_BK1_PWCTLR2, DSI_CMD2_BK1_PWCTLR2_SET);
-	ST7701_DSI(st7701, DSI_CMD2_BK1_SPD1, DSI_CMD2_BK1_SPD1_SET);
-	ST7701_DSI(st7701, DSI_CMD2_BK1_SPD2, DSI_CMD2_BK1_SPD2_SET);
-	ST7701_DSI(st7701, DSI_CMD2_BK1_MIPISET1, DSI_CMD2_BK1_MIPISET1_SET);
+
+	/* Vgl is non-linear */
+	ST7701_DSI(st7701, DSI_CMD2_BK1_VGLS,
+		   DSI_CMD2_BK1_VGLS_ONES |
+		   FIELD_PREP(DSI_CMD2_BK1_VGLS_MASK, st7701_vgls_map(st7701)));
+
+	ST7701_DSI(st7701, DSI_CMD2_BK1_PWCTLR1,
+		   FIELD_PREP(DSI_CMD2_BK1_PWRCTRL1_AP_MASK,
+			      desc->gamma_op_bias) |
+		   FIELD_PREP(DSI_CMD2_BK1_PWRCTRL1_APIS_MASK,
+			      desc->input_op_bias) |
+		   FIELD_PREP(DSI_CMD2_BK1_PWRCTRL1_APOS_MASK,
+			      desc->output_op_bias));
+
+	/* Avdd = 6.2V + (AVDD[1:0] * 0.2V) , Avcl = -4.4V - (AVCL[1:0] * 0.2V) */
+	ST7701_DSI(st7701, DSI_CMD2_BK1_PWCTLR2,
+		   FIELD_PREP(DSI_CMD2_BK1_PWRCTRL2_AVDD_MASK,
+			      DIV_ROUND_CLOSEST(desc->avdd_mv - 6200, 200)) |
+		   FIELD_PREP(DSI_CMD2_BK1_PWRCTRL2_AVCL_MASK,
+			      DIV_ROUND_CLOSEST(-4400 + desc->avcl_mv, 200)));
+
+	/* T2D = 0.2us * T2D[3:0] */
+	ST7701_DSI(st7701, DSI_CMD2_BK1_SPD1,
+		   DSI_CMD2_BK1_SPD1_ONES_MASK |
+		   FIELD_PREP(DSI_CMD2_BK1_SPD1_T2D_MASK,
+			      DIV_ROUND_CLOSEST(desc->t2d_ns, 200)));
+
+	/* T3D = 4us + (0.8us * T3D[3:0]) */
+	ST7701_DSI(st7701, DSI_CMD2_BK1_SPD2,
+		   DSI_CMD2_BK1_SPD2_ONES_MASK |
+		   FIELD_PREP(DSI_CMD2_BK1_SPD2_T3D_MASK,
+			      DIV_ROUND_CLOSEST(desc->t3d_ns - 4000, 800)));
+
+	ST7701_DSI(st7701, DSI_CMD2_BK1_MIPISET1,
+		   DSI_CMD2_BK1_MIPISET1_ONES |
+		   (desc->eot_en ? DSI_CMD2_BK1_MIPISET1_EOT_EN : 0));
 
 	/**
 	 * ST7701_SPEC_V1.2 is unable to provide enough information above this
@@ -419,6 +506,18 @@ static const struct st7701_panel_desc ts8550b_desc = {
 		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC255_MASK, 0x1f)
 	},
 	.nlinv = 7,
+	.vop_uv = 4400000,
+	.vcom_uv = 337500,
+	.vgh_mv = 15000,
+	.vgl_mv = -9510,
+	.avdd_mv = 6600,
+	.avcl_mv = -4400,
+	.gamma_op_bias = OP_BIAS_MAX,
+	.input_op_bias = OP_BIAS_MIN,
+	.output_op_bias = OP_BIAS_MIN,
+	.t2d_ns = 1600,
+	.t3d_ns = 10400,
+	.eot_en = true,
 };
 
 static int st7701_dsi_probe(struct mipi_dsi_device *dsi)
-- 
2.35.1

