Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 625E2354483
	for <lists+dri-devel@lfdr.de>; Mon,  5 Apr 2021 18:05:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9794F89F8E;
	Mon,  5 Apr 2021 16:05:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C13289F8E
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Apr 2021 16:05:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 47512613D8;
 Mon,  5 Apr 2021 16:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617638740;
 bh=Nw8MRyPv6hItzUsKE/Wox9Bq6mnbMARlYufUwDjARLk=;
 h=From:To:Cc:Subject:Date:From;
 b=bs0O0CAk53M/qSeZGiM7AwMDewkCdl0vBh0LS8bqAedJ6MfX9IJ1AhOe6A2GIYWq0
 0+ykWcgnPGQMm27T8u7fGbbTsaN4iwlqt9YmniWLppEG83m1Uhy/2l2vK5JtYmT0sd
 XdmimLgtTjzTdK3n8dRzYp3xZnjv6nlFk9oHHvQjpQdhddKifFHrg+5CW2+x2OfSI9
 BglkEDX0tGfI8/hzhOFyD0NBON7F3VVJ0ASIauu2pG8G4gZhroG58EfR/okI96VqiU
 EZxl7Yq2yJ/6tJbLm9ThOaZG8qJ/Wqb81BhhsvshdV0HGSR8X+hu49s0ZNiciDZfH2
 0W1bjUUV7Jv6A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4] drm/imx: imx-ldb: fix out of bounds array access
 warning
Date: Mon,  5 Apr 2021 12:05:37 -0400
Message-Id: <20210405160538.269310-1-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

[ Upstream commit 33ce7f2f95cabb5834cf0906308a5cb6103976da ]

When CONFIG_OF is disabled, building with 'make W=1' produces warnings
about out of bounds array access:

drivers/gpu/drm/imx/imx-ldb.c: In function 'imx_ldb_set_clock.constprop':
drivers/gpu/drm/imx/imx-ldb.c:186:8: error: array subscript -22 is below array bounds of 'struct clk *[4]' [-Werror=array-bounds]

Add an error check before the index is used, which helps with the
warning, as well as any possible other error condition that may be
triggered at runtime.

The warning could be fixed by adding a Kconfig depedency on CONFIG_OF,
but Liu Ying points out that the driver may hit the out-of-bounds
problem at runtime anyway.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Liu Ying <victor.liu@nxp.com>
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/imx/imx-ldb.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/imx/imx-ldb.c b/drivers/gpu/drm/imx/imx-ldb.c
index b9dc2ef64ed8..74585ba16501 100644
--- a/drivers/gpu/drm/imx/imx-ldb.c
+++ b/drivers/gpu/drm/imx/imx-ldb.c
@@ -217,6 +217,11 @@ static void imx_ldb_encoder_commit(struct drm_encoder *encoder)
 	int dual = ldb->ldb_ctrl & LDB_SPLIT_MODE_EN;
 	int mux = imx_drm_encoder_get_mux_id(imx_ldb_ch->child, encoder);
 
+	if (mux < 0 || mux >= ARRAY_SIZE(ldb->clk_sel)) {
+		dev_warn(ldb->dev, "%s: invalid mux %d\n", __func__, mux);
+		return;
+	}
+
 	drm_panel_prepare(imx_ldb_ch->panel);
 
 	if (dual) {
@@ -267,6 +272,11 @@ static void imx_ldb_encoder_mode_set(struct drm_encoder *encoder,
 	unsigned long di_clk = mode->clock * 1000;
 	int mux = imx_drm_encoder_get_mux_id(imx_ldb_ch->child, encoder);
 
+	if (mux < 0 || mux >= ARRAY_SIZE(ldb->clk_sel)) {
+		dev_warn(ldb->dev, "%s: invalid mux %d\n", __func__, mux);
+		return;
+	}
+
 	if (mode->clock > 170000) {
 		dev_warn(ldb->dev,
 			 "%s: mode exceeds 170 MHz pixel clock\n", __func__);
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
