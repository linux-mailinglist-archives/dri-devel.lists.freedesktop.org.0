Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18062714749
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 11:45:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8F4B10E269;
	Mon, 29 May 2023 09:45:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D8B010E265;
 Mon, 29 May 2023 09:45:02 +0000 (UTC)
Received: from [192.168.122.1] (217-149-172-244.nat.highway.telekom.at
 [217.149.172.244])
 by mail.z3ntu.xyz (Postfix) with ESMTPSA id BFAECCFC28;
 Mon, 29 May 2023 09:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=z3ntu;
 t=1685353501; bh=Pvj7kBCbsncRN/r2Hw0hNp6SoznPdByBlaY/zEcd12o=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=VXAtWFzmQx4kMmbXVxJ0/jmTihf4UrGIeQkLpL+R6GblDaVyskNs80P6za/28yJ/K
 Clt1xm12l7JsJylg1YLvWtSXrDpFxy8Us53pSPaIWWSO+ZWSgLNt8/JQK4wDMQLmhI
 muG4CFJ6lfLHoeEsTL3sEimH4xzOAyvBJLVc75Sg=
From: Luca Weiss <luca@z3ntu.xyz>
Date: Mon, 29 May 2023 11:44:01 +0200
Subject: [PATCH 4/7] drm/msm/mdp5: Add MDP5 configuration for MSM8226
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230308-msm8226-mdp-v1-4-679f335d3d5b@z3ntu.xyz>
References: <20230308-msm8226-mdp-v1-0-679f335d3d5b@z3ntu.xyz>
In-Reply-To: <20230308-msm8226-mdp-v1-0-679f335d3d5b@z3ntu.xyz>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2673; i=luca@z3ntu.xyz;
 h=from:subject:message-id; bh=Pvj7kBCbsncRN/r2Hw0hNp6SoznPdByBlaY/zEcd12o=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBkdHQWyEjmV/3z2MU1XlxJRVfIBRMSNKm7z5lbm
 12NOYLf2emJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZHR0FgAKCRBy2EO4nU3X
 VoKvD/0WXNNBwPvWw6sReo8s/QeM2zmgoi9Y5n3wNabBguRjFnoTmZ7sxp4cXMmMvc5XIAesKJb
 +QitMyQy9JcfnXzc5Kp0XPSSmKfNYQMzvqmBsnCZswlk84PnRKz0NUz8+zaUfUyG7aN/3G98JDy
 k5F3S9Zd6Ho5A3322YWKeoLuPxqjLPE3WVMatZWmYnvY6jfYzmL8M2AbVsMnY1ClnaEU/ClWtk8
 dI7PzSJ2vpZYSfzZO+Xvya+30SU6AmHUzqsRC/UepLLAxd1q4SPuPVxNezhy969xoxr5vCQbNWm
 oSVTPKdbL997vj1hwFTPLqEzNA7SgVdbyToPb03M7/KZZ3MPVBVMhS6Yka/LFSgzXfocuX6EgQZ
 mroGU7i0frgwEtYMi/Jq52M7H0MDKaFXzFSeuKed6yzfG0zpUW6i6liG1oGRICCZp/tWVwdiKAN
 ruzeOhP1bWMuNfOy4Pfpulijt3iOxuKtrMVwlaVQ6NCj7U61J640D6FrnX2z7b5xxDvR+0+1OUw
 hCD8UtVTP5S3URKTmVYHu71Mz9l7952HYiChQaQqgHGiZvBiQopvOjaC+1ow7rrsRnq3jEqWfib
 /kMPOLGIuOsADktLQx73Z8j0EvyjGH+3NvHZwioJvBjA82QLIcmVcn05b0OTHYVIj5ZZA4RjJt6
 u9s8OyTA39pA6qA==
X-Developer-Key: i=luca@z3ntu.xyz; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Luca Weiss <luca@z3ntu.xyz>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the required config for the v1.1 MDP5 found on MSM8226.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 82 ++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
index 2eec2d78f32a..694d54341337 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
@@ -103,6 +103,87 @@ static const struct mdp5_cfg_hw msm8x74v1_config = {
 	.max_clk = 200000000,
 };
 
+static const struct mdp5_cfg_hw msm8x26_config = {
+	.name = "msm8x26",
+	.mdp = {
+		.count = 1,
+		.caps = MDP_CAP_SMP |
+			0,
+	},
+	.smp = {
+		.mmb_count = 7,
+		.mmb_size = 4096,
+		.clients = {
+			[SSPP_VIG0] =  1,
+			[SSPP_DMA0] = 4,
+			[SSPP_RGB0] = 7,
+		},
+	},
+	.ctl = {
+		.count = 2,
+		.base = { 0x00500, 0x00600 },
+		.flush_hw_mask = 0x0003ffff,
+	},
+	.pipe_vig = {
+		.count = 1,
+		.base = { 0x01100 },
+		.caps = MDP_PIPE_CAP_HFLIP |
+			MDP_PIPE_CAP_VFLIP |
+			MDP_PIPE_CAP_SCALE |
+			MDP_PIPE_CAP_CSC   |
+			0,
+	},
+	.pipe_rgb = {
+		.count = 1,
+		.base = { 0x01d00 },
+		.caps = MDP_PIPE_CAP_HFLIP |
+			MDP_PIPE_CAP_VFLIP |
+			MDP_PIPE_CAP_SCALE |
+			0,
+	},
+	.pipe_dma = {
+		.count = 1,
+		.base = { 0x02900 },
+		.caps = MDP_PIPE_CAP_HFLIP |
+			MDP_PIPE_CAP_VFLIP |
+			0,
+	},
+	.lm = {
+		.count = 2,
+		.base = { 0x03100, 0x03d00 },
+		.instances = {
+				{ .id = 0, .pp = 0, .dspp = 0,
+				  .caps = MDP_LM_CAP_DISPLAY, },
+				{ .id = 1, .pp = -1, .dspp = -1,
+				  .caps = MDP_LM_CAP_WB },
+			     },
+		.nb_stages = 2,
+		.max_width = 2048,
+		.max_height = 0xFFFF,
+	},
+	.dspp = {
+		.count = 1,
+		.base = { 0x04500 },
+	},
+	.pp = {
+		.count = 1,
+		.base = { 0x21a00 },
+	},
+	.intf = {
+		.base = { 0x00000, 0x21200 },
+		.connect = {
+			[0] = INTF_DISABLED,
+			[1] = INTF_DSI,
+		},
+	},
+	.perf = {
+		.ab_inefficiency = 100,
+		.ib_inefficiency = 200,
+		.clk_inefficiency = 125
+	},
+	.max_clk = 200000000,
+};
+
 static const struct mdp5_cfg_hw msm8x74v2_config = {
 	.name = "msm8x74",
 	.mdp = {
@@ -1236,6 +1317,7 @@ static const struct mdp5_cfg_hw sdm660_config = {
 
 static const struct mdp5_cfg_handler cfg_handlers_v1[] = {
 	{ .revision = 0, .config = { .hw = &msm8x74v1_config } },
+	{ .revision = 1, .config = { .hw = &msm8x26_config } },
 	{ .revision = 2, .config = { .hw = &msm8x74v2_config } },
 	{ .revision = 3, .config = { .hw = &apq8084_config } },
 	{ .revision = 6, .config = { .hw = &msm8x16_config } },

-- 
2.40.1

