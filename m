Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F9C8084D0
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 10:38:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1122310E839;
	Thu,  7 Dec 2023 09:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5862F10E839;
 Thu,  7 Dec 2023 09:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701941909; x=1733477909;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NRCb2skgWUY6/0k+GgOYc1syRPquz6NY6LhlUq60Bi8=;
 b=eXpu9NzauIaYy4ZUCJiZ9MrIyUkmtqpVi7lLyfInU4MJugW0AZPIs+H5
 E87HgJEQoLoHlDyDl4L+LRpvHJEF3I3UHEU5DEGPx50FDFgcxP+Kd6L5X
 UCC3ZI6DCR5DQM0SXM6tEHHbR1QlwkTwFFxKrrKfIGdidVEoo6VUpAs5U
 8ZaRGqwIUIMhn/0UvENrGiiPaS3ss1GJbA12u0ax0iIDbgv+Oyp1rvipG
 69wY+26XcPIzj9uteW3Lne9U1zdcMBp+dp+/PH+ecSwkK5kiNyvmPMmT4
 jKrsvWY/kZS9YMzZUCQBU0zrnFwmBKKaDRGSQehKP2cxNNzg19gqZBnt+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="391378212"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="391378212"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 01:38:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="771668691"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="771668691"
Received: from mrehana-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.62.169])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 01:38:25 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/edid: also call add modes in EDID connector update
 fallback
Date: Thu,  7 Dec 2023 11:38:21 +0200
Message-Id: <20231207093821.2654267-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
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
Cc: jani.nikula@intel.com, bbaa <bbaa@bbaa.fun>,
 intel-gfx@lists.freedesktop.org, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the separate add modes call was added back in commit c533b5167c7e
("drm/edid: add separate drm_edid_connector_add_modes()"), it failed to
address drm_edid_override_connector_update(). Also call add modes there.

Reported-by: bbaa <bbaa@bbaa.fun>
Closes: https://lore.kernel.org/r/930E9B4C7D91FDFF+29b34d89-8658-4910-966a-c772f320ea03@bbaa.fun
Fixes: c533b5167c7e ("drm/edid: add separate drm_edid_connector_add_modes()")
Cc: <stable@vger.kernel.org> # v6.3+
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index cb4031d5dcbb..69c68804023f 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2311,7 +2311,8 @@ int drm_edid_override_connector_update(struct drm_connector *connector)
 
 	override = drm_edid_override_get(connector);
 	if (override) {
-		num_modes = drm_edid_connector_update(connector, override);
+		if (drm_edid_connector_update(connector, override) == 0)
+			num_modes = drm_edid_connector_add_modes(connector);
 
 		drm_edid_free(override);
 
-- 
2.39.2

