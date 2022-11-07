Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9F861FE98
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 20:26:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1899410E3AA;
	Mon,  7 Nov 2022 19:26:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25F5B10E3A7
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 19:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667849168; x=1699385168;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+EDgBBg2PacxtMZJ4X8VqN8vT504rb7kT8scSEPdW+U=;
 b=LMkCkl9JdUh4SaZbwbzpLo7OYiIrZCrdfd7SOnwi25KsgilCZsGjJG/T
 UzulGGoC1Carjl8K956FqiXD9N73+B7SAh3RsgV7Ra3UYvcBq1VkNbgMH
 EUEBHJShw8K3W5yg06QV9Pf4W7nMiPkpslc2lfU8nm5i1QkAIv36DE3wf
 25cSDsIXViX2DgzCAADv+COjs/s6leadA3MObilsADOX4VByWgQmDEIh0
 oWpvMfO2sFA+jcb8abNN3zcuFgsrBtHBqwf+mH+brP2Go9kNkg5Ai2uFB
 coSmts6LfrvB/QxsRdZHiKEmquO0d0y6vEIww+dNvzZKefRAhuqsk/V/8 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="308125625"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="308125625"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 11:26:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="705009815"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="705009815"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga004.fm.intel.com with SMTP; 07 Nov 2022 11:26:05 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 07 Nov 2022 21:26:04 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 5/7] drm/mtk: Use drm_mode_init() for on-stack modes
Date: Mon,  7 Nov 2022 21:25:43 +0200
Message-Id: <20221107192545.9896-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221107192545.9896-1-ville.syrjala@linux.intel.com>
References: <20221107192545.9896-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Initialize on-stack modes with drm_mode_init() to guarantee
no stack garbage in the list head.

Based on the following cocci script, with manual fixups:
@decl@
identifier M;
expression E;
@@
- struct drm_display_mode M = E;
+ struct drm_display_mode M;

@@
identifier decl.M;
expression decl.E;
statement S, S1;
@@
struct drm_display_mode M;
... when != S
+ drm_mode_init(&M, &E);
+
S1

@@
expression decl.E;
@@
- &*E
+ E

Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 4c80b6896dc3..12fa78f286ff 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1217,7 +1217,7 @@ static int mtk_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
 	if (next_bridge) {
 		struct drm_display_mode adjusted_mode;
 
-		drm_mode_copy(&adjusted_mode, mode);
+		drm_mode_init(&adjusted_mode, mode);
 		if (!drm_bridge_chain_mode_fixup(next_bridge, mode,
 						 &adjusted_mode))
 			return MODE_BAD;
-- 
2.37.4

