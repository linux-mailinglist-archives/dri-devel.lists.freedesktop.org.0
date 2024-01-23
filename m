Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E018399CB
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 20:42:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14AB210E896;
	Tue, 23 Jan 2024 19:41:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AAA310E8A9
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 19:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706038892; x=1737574892;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HOSNs3YHj3Yx0HUDslxQz75b1u+YVMPuc1oin8kpkMY=;
 b=lf8M0xExLdMrOMVdgLMaJg02IfXy8l/TgC60q8QYPk1sRJE+oEia/Gv0
 pZllskL2p2dv2yFyTtdehSVRV7sOeFKUokGaNrp84Vypo50RHYnR1cBEu
 aDlAn9LR0K0wptvS4K7xha7VKpC+qxUSTPSojN7bdQ0v/z4sZXMkSlfox
 ihizTB/9vKj+cBLxcfFdH8B3X/Nt+I6Qsl6Z/Vu69yLpWRYbBJMkescoP
 OUHeeM1kyIo04Yg1R8KsAnkAXWaqlDyhEHRmU8y6AVX4awK3NjtTsixyO
 MlinIUrhaI5H6mquNo8OPBfLtkbRZE/TrAMe3TDwAGoT/ony8KX54Bswm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="14981026"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="14981026"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:41:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="856434064"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="856434064"
Received: from pzsolt-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.40.183])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:41:21 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v3 35/39] drm: bridge: dw_hdmi: clear the EDID property and
 CEC address on failures
Date: Tue, 23 Jan 2024 21:37:41 +0200
Message-Id: <a417ae48da6cc0dc8a9e3d929ce0c91f1e4905f1.1706038510.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1706038510.git.jani.nikula@intel.com>
References: <cover.1706038510.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: Jani Nikula <jani.nikula@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If EDID read fails, clear the EDID property and CEC address.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 4a2e3f9c1dfd..0e59b30d5227 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2505,8 +2505,6 @@ static int dw_hdmi_connector_get_modes(struct drm_connector *connector)
 	int ret;
 
 	drm_edid = dw_hdmi_edid_read(hdmi, connector);
-	if (!drm_edid)
-		return 0;
 
 	drm_edid_connector_update(connector, drm_edid);
 	cec_notifier_set_phys_addr(hdmi->cec_notifier,
-- 
2.39.2

