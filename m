Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C61CD42CF40
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 01:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BC976E892;
	Wed, 13 Oct 2021 23:37:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C04E36E88F
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 23:37:38 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="214719593"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="214719593"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 16:37:27 -0700
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="659743992"
Received: from thollida-mobl.amr.corp.intel.com (HELO
 achrisan-desk3.intel.com) ([10.212.111.141])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 16:37:26 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org,
	anitha.chrisanthus@intel.com
Cc: sam@ravnborg.org,
	edmund.j.dea@intel.com
Subject: [PATCH v3 6/7] drm/kmb: Enable ADV bridge after modeset
Date: Wed, 13 Oct 2021 16:36:31 -0700
Message-Id: <20211013233632.471892-6-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013233632.471892-1-anitha.chrisanthus@intel.com>
References: <20211013233632.471892-1-anitha.chrisanthus@intel.com>
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
index a0669b842ff5..7ab6b7b44cbc 100644
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

