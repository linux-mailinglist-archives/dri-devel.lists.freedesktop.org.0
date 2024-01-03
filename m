Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC36822B17
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 11:12:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A96810E30A;
	Wed,  3 Jan 2024 10:12:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D8BC10E30A
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 10:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704276764; x=1735812764;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p6YOBtN/CsKbEctmImmPBLlP8kIETrsw5YzFqxkO0q8=;
 b=gBKxUVNrU1XXE6TF1BdhedPc9RqFJq961S09mtjbICxVV+g5n7d532ZS
 dpCa9b0JL9cWcXsfULLX/TMKkGkzlnk2z8mx0+dpZNGnZybzh+CUts/GD
 7FMnTLUO2gagd4eHHzsTlKjzRKESHEdKEvltEaGzpNDdxyO6HfN1Og81b
 bpLhxqnflC0Q9laJsWgpyVBbnDxryRgDxAJa4Ehcv9OrCk5elaR73z6Cb
 1Erjgnt8v3XwBPxIXbUiNDPWiQCIQAal3efSDIb4jixNc1Wka6bYo4HWa
 3oYn6ujgWme/gEH2lq0V8/BrDTyWd6z4Fi7JGR/OxLnqNPw63JHYhnJ+S w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="428159783"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="428159783"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:12:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="783464134"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="783464134"
Received: from lwenners-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.35.39])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:12:41 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 35/39] drm: bridge: dw_hdmi: clear the EDID property and
 CEC address on failures
Date: Wed,  3 Jan 2024 12:08:49 +0200
Message-Id: <0e93195d8486f3c3d79aa6cf6b68ce34c9138291.1704276309.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1704276309.git.jani.nikula@intel.com>
References: <cover.1704276309.git.jani.nikula@intel.com>
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
index 8ce85e973b38..654f35ea516d 100644
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

