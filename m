Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CA33D43B3
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jul 2021 02:12:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 160906FD2A;
	Sat, 24 Jul 2021 00:11:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE6F6FD28;
 Sat, 24 Jul 2021 00:11:33 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10054"; a="191563460"
X-IronPort-AV: E=Sophos;i="5.84,265,1620716400"; d="scan'208";a="191563460"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 17:11:33 -0700
X-IronPort-AV: E=Sophos;i="5.84,265,1620716400"; d="scan'208";a="434270023"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 17:11:32 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 18/30] drm/i915: remove explicit CNL handling from i915_irq.c
Date: Fri, 23 Jul 2021 17:11:02 -0700
Message-Id: <20210724001114.249295-19-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210724001114.249295-1-lucas.demarchi@intel.com>
References: <20210724001114.249295-1-lucas.demarchi@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Jose Souza <jose.souza@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove special handling of PORT_F in i915_irq.c and only do it for
DISPLAY_VER == 11.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/i915_irq.c | 7 +++----
 drivers/gpu/drm/i915/i915_reg.h | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index e2171bd2820e..17d336218b67 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -2297,11 +2297,10 @@ static u32 gen8_de_port_aux_mask(struct drm_i915_private *dev_priv)
 			GEN9_AUX_CHANNEL_C |
 			GEN9_AUX_CHANNEL_D;
 
-	if (IS_CNL_WITH_PORT_F(dev_priv) || DISPLAY_VER(dev_priv) == 11)
-		mask |= CNL_AUX_CHANNEL_F;
-
-	if (DISPLAY_VER(dev_priv) == 11)
+	if (DISPLAY_VER(dev_priv) == 11) {
+		mask |= ICL_AUX_CHANNEL_F;
 		mask |= ICL_AUX_CHANNEL_E;
+	}
 
 	return mask;
 }
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index d198b1a2d4b5..fdc8fd424d36 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -7945,7 +7945,7 @@ enum {
 #define  DSI1_NON_TE			(1 << 31)
 #define  DSI0_NON_TE			(1 << 30)
 #define  ICL_AUX_CHANNEL_E		(1 << 29)
-#define  CNL_AUX_CHANNEL_F		(1 << 28)
+#define  ICL_AUX_CHANNEL_F		(1 << 28)
 #define  GEN9_AUX_CHANNEL_D		(1 << 27)
 #define  GEN9_AUX_CHANNEL_C		(1 << 26)
 #define  GEN9_AUX_CHANNEL_B		(1 << 25)
-- 
2.31.1

