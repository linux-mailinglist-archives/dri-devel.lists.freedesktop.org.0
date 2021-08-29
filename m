Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2646D3FAE68
	for <lists+dri-devel@lfdr.de>; Sun, 29 Aug 2021 22:30:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22186891DB;
	Sun, 29 Aug 2021 20:30:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B7E89C99
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Aug 2021 20:30:45 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id C8D331F969;
 Sun, 29 Aug 2021 22:30:39 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
To: phone-devel@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Pavel Dubrova <pashadubrova@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] drm/msm/dsi: Use "ref" fw clock instead of global name
 for VCO parent
Date: Sun, 29 Aug 2021 22:30:26 +0200
Message-Id: <20210829203027.276143-3-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210829203027.276143-1-marijn.suijten@somainline.org>
References: <20210829203027.276143-1-marijn.suijten@somainline.org>
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

All DSI PHY/PLL drivers were referencing their VCO parent clock by a
global name, most of which don't exist or have been renamed.  These
clock drivers seem to function fine without that except the 14nm driver
for the sdm6xx [1].

At the same time all DTs provide a "ref" clock as per the requirements
of dsi-phy-common.yaml, but the clock is never used.  This patchset puts
that clock to use without relying on a global clock name, so that all
dependencies are explicitly defined in DT (the firmware) in the end.

[1]: https://lore.kernel.org/linux-arm-msm/386db1a6-a1cd-3c7d-a88e-dc83f8a1be96@somainline.org/

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c      | 4 +++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c      | 4 +++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c      | 4 +++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c | 4 +++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c       | 4 +++-
 5 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index e46b10fc793a..3cbb1f1475e8 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -562,7 +562,9 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm, struct clk_hw **prov
 	char clk_name[32], parent[32], vco_name[32];
 	char parent2[32], parent3[32], parent4[32];
 	struct clk_init_data vco_init = {
-		.parent_names = (const char *[]){ "xo" },
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "ref",
+		},
 		.num_parents = 1,
 		.name = vco_name,
 		.flags = CLK_IGNORE_UNUSED,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index bb31230721bd..406470265408 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -804,7 +804,9 @@ static int pll_14nm_register(struct dsi_pll_14nm *pll_14nm, struct clk_hw **prov
 {
 	char clk_name[32], parent[32], vco_name[32];
 	struct clk_init_data vco_init = {
-		.parent_names = (const char *[]){ "xo" },
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "ref",
+		},
 		.num_parents = 1,
 		.name = vco_name,
 		.flags = CLK_IGNORE_UNUSED,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index 2da673a2add6..8ee9c9c0548d 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -521,7 +521,9 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
 {
 	char clk_name[32], parent1[32], parent2[32], vco_name[32];
 	struct clk_init_data vco_init = {
-		.parent_names = (const char *[]){ "xo" },
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "ref",
+		},
 		.num_parents = 1,
 		.name = vco_name,
 		.flags = CLK_IGNORE_UNUSED,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index aaa37456f4ee..9662cb236468 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
@@ -385,7 +385,9 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
 {
 	char *clk_name, *parent_name, *vco_name;
 	struct clk_init_data vco_init = {
-		.parent_names = (const char *[]){ "pxo" },
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "ref",
+		},
 		.num_parents = 1,
 		.flags = CLK_IGNORE_UNUSED,
 		.ops = &clk_ops_dsi_pll_28nm_vco,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 7c23d4c47338..c77c30628cca 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -590,7 +590,9 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
 	char clk_name[32], parent[32], vco_name[32];
 	char parent2[32], parent3[32], parent4[32];
 	struct clk_init_data vco_init = {
-		.parent_names = (const char *[]){ "bi_tcxo" },
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "ref",
+		},
 		.num_parents = 1,
 		.name = vco_name,
 		.flags = CLK_IGNORE_UNUSED,
-- 
2.33.0

