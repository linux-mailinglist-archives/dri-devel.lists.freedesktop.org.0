Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D5A3D84B0
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 02:32:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B20E36EACE;
	Wed, 28 Jul 2021 00:32:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 536B56EACE
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 00:32:05 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10058"; a="209441973"
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="209441973"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 17:32:05 -0700
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="634583351"
Received: from mamarti1-mobl.amr.corp.intel.com (HELO
 achrisan-desk3.intel.com) ([10.212.71.161])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 17:32:04 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 edmund.j.dea@intel.com
Subject: [PATCH 03/14] drm/kmb: Work around for higher system clock
Date: Tue, 27 Jul 2021 17:31:15 -0700
Message-Id: <20210728003126.1425028-3-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728003126.1425028-1-anitha.chrisanthus@intel.com>
References: <20210728003126.1425028-1-anitha.chrisanthus@intel.com>
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

Use a different value for system clock offset in the
ppl/llp ratio calculations for clocks higher than 500 Mhz.

Fixes: 98521f4d4b4c ("drm/kmb: Mipi DSI part of the display driver")
Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
---
 drivers/gpu/drm/kmb/kmb_dsi.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
index 231041b269f5..7e2371ffcb18 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -482,6 +482,10 @@ static u32 mipi_tx_fg_section_cfg(struct kmb_dsi *kmb_dsi,
 	return 0;
 }
 
+#define CLK_DIFF_LOW 50
+#define CLK_DIFF_HI 60
+#define SYSCLK_500  500
+
 static void mipi_tx_fg_cfg_regs(struct kmb_dsi *kmb_dsi, u8 frame_gen,
 				struct mipi_tx_frame_timing_cfg *fg_cfg)
 {
@@ -492,7 +496,12 @@ static void mipi_tx_fg_cfg_regs(struct kmb_dsi *kmb_dsi, u8 frame_gen,
 	/* 500 Mhz system clock minus 50 to account for the difference in
 	 * MIPI clock speed in RTL tests
 	 */
-	sysclk = kmb_dsi->sys_clk_mhz - 50;
+	if (kmb_dsi->sys_clk_mhz == SYSCLK_500) {
+		sysclk = kmb_dsi->sys_clk_mhz - CLK_DIFF_LOW;
+	} else {
+		/* 700 Mhz clk*/
+		sysclk = kmb_dsi->sys_clk_mhz - CLK_DIFF_HI;
+	}
 
 	/* PPL-Pixel Packing Layer, LLP-Low Level Protocol
 	 * Frame genartor timing parameters are clocked on the system clock,
-- 
2.25.1

