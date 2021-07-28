Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7243D84B3
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 02:32:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD316EB0F;
	Wed, 28 Jul 2021 00:32:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7255F6EB0F
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 00:32:16 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10058"; a="209442001"
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="209442001"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 17:32:16 -0700
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="634583405"
Received: from mamarti1-mobl.amr.corp.intel.com (HELO
 achrisan-desk3.intel.com) ([10.212.71.161])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 17:32:15 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 edmund.j.dea@intel.com
Subject: [PATCH 06/14] drm/kmb: Remove clearing DPHY regs
Date: Tue, 27 Jul 2021 17:31:18 -0700
Message-Id: <20210728003126.1425028-6-anitha.chrisanthus@intel.com>
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

From: Edmund Dea <edmund.j.dea@intel.com>

Don't clear the shared DPHY registers common to MIPI Rx and MIPI Tx during
DSI initialization since this was causing MIPI Rx reset. Rest of the
writes are bitwise, so do not affect Mipi Rx side.

Fixes: 98521f4d4b4c ("drm/kmb: Mipi DSI part of the display driver")
Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Signed-off-by: Edmund Dea <edmund.j.dea@intel.com>
---
 drivers/gpu/drm/kmb/kmb_dsi.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
index 7e2371ffcb18..5bc6c84073a3 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -1393,11 +1393,6 @@ int kmb_dsi_mode_set(struct kmb_dsi *kmb_dsi, struct drm_display_mode *mode,
 		mipi_tx_init_cfg.lane_rate_mbps = data_rate;
 	}
 
-	kmb_write_mipi(kmb_dsi, DPHY_ENABLE, 0);
-	kmb_write_mipi(kmb_dsi, DPHY_INIT_CTRL0, 0);
-	kmb_write_mipi(kmb_dsi, DPHY_INIT_CTRL1, 0);
-	kmb_write_mipi(kmb_dsi, DPHY_INIT_CTRL2, 0);
-
 	/* Initialize mipi controller */
 	mipi_tx_init_cntrl(kmb_dsi, &mipi_tx_init_cfg);
 
-- 
2.25.1

