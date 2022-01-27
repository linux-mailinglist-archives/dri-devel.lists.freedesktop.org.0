Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA0049EB3B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 20:43:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B445E10E197;
	Thu, 27 Jan 2022 19:43:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF0710E197
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 19:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643312579; x=1674848579;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yvo2QpcAyyeA7bBC1SGZWdL2myt/RLsRThyjdGRRkgc=;
 b=MzA9aRsZzU2agQ2KUaup9WVtZin7zVbuTvAWgelfrPzoD9lJqklB4Dx+
 +K7ljcUA4FjKxSOjfhVOXCNtGbSJ6x+kEY1Lq/19kDL1JcmmVwm+sjeSz
 IVQvGQbSkDRdNEg3G1xleX6sNFFm3G5p/XKAw2dpbTGr1IUpV31FVymBX
 kMkbkkrcrTzQpIlKEWNR/3otxBoxDxceYN3mkDec3/wUI4+ARCUn0bYLV
 S2bTO8Fnphufu2pRqEC9JgpNpIZMCdyVUTm9wVfUQ1vt4CqQtdE1axcJ7
 EDmY62Hv83EFTTgcZkh/Rd2XygyeSPDmCZKh2XOwky5nReWJgmA+eE2VZ A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="244552013"
X-IronPort-AV: E=Sophos;i="5.88,321,1635231600"; d="scan'208";a="244552013"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2022 11:42:59 -0800
X-IronPort-AV: E=Sophos;i="5.88,321,1635231600"; d="scan'208";a="521365896"
Received: from cmckay-mobl.amr.corp.intel.com (HELO achrisan-desk3.intel.com)
 ([10.213.160.33])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2022 11:42:58 -0800
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org,
	anitha.chrisanthus@intel.com
Subject: [PATCH] drm/kmb: Fix for build errors with Warray-bounds
Date: Thu, 27 Jan 2022 11:42:27 -0800
Message-Id: <20220127194227.2213608-1-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: edmund.j.dea@intel.com, sam@ravnborg.org, keescook@chromium.org,
 sfr@canb.auug.org.au
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This fixes the following build error

drivers/gpu/drm/kmb/kmb_plane.c: In function 'kmb_plane_atomic_disable':
drivers/gpu/drm/kmb/kmb_plane.c:165:34: error: array subscript 3 is
above array bounds of 'struct layer_status[2]' [-Werror=array-bounds]
  165 |                 kmb->plane_status[plane_id].ctrl =
  LCD_CTRL_GL2_ENABLE;
  |                 ~~~~~~~~~~~~~~~~~^~~~~~~~~~
  In file included from drivers/gpu/drm/kmb/kmb_plane.c:17:
  drivers/gpu/drm/kmb/kmb_drv.h:61:41: note: while referencing
  'plane_status'
  61 |         struct layer_status
  plane_status[KMB_MAX_PLANES];
  |                                         ^~~~~~~~~~~~
  drivers/gpu/drm/kmb/kmb_plane.c:162:34: error: array
  subscript 2 is above array bounds of 'struct
  layer_status[2]' [-Werror=array-bounds]
  162 |
  kmb->plane_status[plane_id].ctrl =
  LCD_CTRL_GL1_ENABLE;
  |                 ~~~~~~~~~~~~~~~~~^~~~~~~~~~
  In file included from
  drivers/gpu/drm/kmb/kmb_plane.c:17:
  drivers/gpu/drm/kmb/kmb_drv.h:61:41: note:
  while referencing 'plane_status'
  61 |         struct layer_status
  plane_status[KMB_MAX_PLANES];
  |
  ^~~~~~~~~~~~

Fixes: 7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
---
 drivers/gpu/drm/kmb/kmb_plane.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
index 00404ba4126d..2735b8eb3537 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -158,12 +158,6 @@ static void kmb_plane_atomic_disable(struct drm_plane *plane,
 	case LAYER_1:
 		kmb->plane_status[plane_id].ctrl = LCD_CTRL_VL2_ENABLE;
 		break;
-	case LAYER_2:
-		kmb->plane_status[plane_id].ctrl = LCD_CTRL_GL1_ENABLE;
-		break;
-	case LAYER_3:
-		kmb->plane_status[plane_id].ctrl = LCD_CTRL_GL2_ENABLE;
-		break;
 	}
 
 	kmb->plane_status[plane_id].disable = true;
-- 
2.25.1

