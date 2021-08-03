Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 329BE3DF73D
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 00:05:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D17E6E0ED;
	Tue,  3 Aug 2021 22:05:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F32056E117
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Aug 2021 22:05:54 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10065"; a="277558129"
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; d="scan'208";a="277558129"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 15:05:54 -0700
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; d="scan'208";a="585154067"
Received: from tdpeach-mobl.amr.corp.intel.com (HELO achrisan-desk3.intel.com)
 ([10.212.91.220])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 15:05:54 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 edmund.j.dea@intel.com
Subject: [PATCH v2 7/8] drm/kmb: Enable ADV bridge after modeset
Date: Tue,  3 Aug 2021 15:04:51 -0700
Message-Id: <20210803220452.52379-7-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803220452.52379-1-anitha.chrisanthus@intel.com>
References: <20210803220452.52379-1-anitha.chrisanthus@intel.com>
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

On KMB, ADV bridge must be programmed and powered on prior to
MIPI DSI HW initialization.

Fixes: 98521f4d4b4c ("drm/kmb: Mipi DSI part of the display driver")
Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
---
 drivers/gpu/drm/kmb/kmb_dsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
index 5bc6c84073a3..1cca0fe6f35f 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -1341,6 +1341,7 @@ static void connect_lcd_to_mipi(struct kmb_dsi *kmb_dsi)
 		return;
 	}
 
+	drm_bridge_chain_enable(adv_bridge);
 	/* DISABLE MIPI->CIF CONNECTION */
 	regmap_write(msscam, MSS_MIPI_CIF_CFG, 0);
 
-- 
2.25.1

