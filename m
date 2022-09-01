Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FB75A9739
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 14:48:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C12510E700;
	Thu,  1 Sep 2022 12:48:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53DBD10E6FB;
 Thu,  1 Sep 2022 12:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662036475; x=1693572475;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZNbVjn0emFWA6qjDO1tFmsrKCgCOOTKbwxx+l4Ra70A=;
 b=dRDCboC9nRsOhqeemLQ34p0qIwcp7WfQZkJoBlOhqNJ6PGuCu328KE8F
 Fm2U2K7pb9KHJ+A7+yyNehtiplnH4wSaq/CxkWp0lJH72mj3CS6tbw07t
 Ti6ZeuO2NA0sFLGDmw/ApgPo1gE4jmOqhHTGXIMJHVRwzG9s76K3sWT2U
 s2KgJveN4WGdqwOui4rEn8ZzhgsKOOD1vWKClJ/nfEjgwDRmUHPT/FDff
 56Ji4Mv6VTcIwx5RfpUfC5jtwveUWeZtn/d+3vWlOVCdu1TaF2aAPJ7Lb
 1/w2mSBvIIoWtHZWsW0TdNuXCRwb9ufZ78szCUpKSwFRNJASh5wDxPeGm Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="275451549"
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; d="scan'208";a="275451549"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 05:47:54 -0700
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; d="scan'208";a="940836961"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.142])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 05:47:52 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/9] drm/tegra: convert to using is_hdmi from display info
Date: Thu,  1 Sep 2022 15:47:06 +0300
Message-Id: <1bdb744bc1079affdd108b34206efd2f21adf7c7.1662036058.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1662036058.git.jani.nikula@intel.com>
References: <cover.1662036058.git.jani.nikula@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, linux-tegra@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prefer the parsed results for is_hdmi in display info over calling
drm_detect_hdmi_monitor().

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/tegra/hdmi.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index bf240767dad9..40ec3e6cf204 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -867,14 +867,7 @@ static int tegra_hdmi_reconfigure_audio(struct tegra_hdmi *hdmi)
 
 static bool tegra_output_is_hdmi(struct tegra_output *output)
 {
-	struct edid *edid;
-
-	if (!output->connector.edid_blob_ptr)
-		return false;
-
-	edid = (struct edid *)output->connector.edid_blob_ptr->data;
-
-	return drm_detect_hdmi_monitor(edid);
+	return output->connector.display_info.is_hdmi;
 }
 
 static enum drm_connector_status
-- 
2.34.1

