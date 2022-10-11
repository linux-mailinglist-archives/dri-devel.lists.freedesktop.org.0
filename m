Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E2A5FB3CA
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 15:51:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAAE810E812;
	Tue, 11 Oct 2022 13:50:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E51A10E809;
 Tue, 11 Oct 2022 13:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665496242; x=1697032242;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TwOLcq1XDn2YBqn6/FK6pFP8tNmyXVsmyGyLDbytSnw=;
 b=npcmCnKp+2gdjftbBGMM7LLviue8Cn6tSRvA/qKXEA66RAXCQ+Q+ZW1J
 NZVHizPxmwpvZU1lCyD6l6KaK7WPoLUUy+VD/wBV4F1hnbHDs76UrVdJm
 ept2L2NlNKi/ncYFFezbTOUHVgoGjiKUzAv4j/BFdCMtqqsij9zYlXEEH
 DO8YpLqwUg3IJVp5UG8oFEZnwIXeTtOesGwKC1DzFEXmgWZVRA4QcHOm6
 DDwYZw9rCGOQAHogNMMpdR4ACG1lvJkgGZWhCt6ijHp85+NCHGvEugCa8
 j0RlL53hjnMHCfKNT2HyO5ZcUpG3yBozCQtQaX5SnUWkN9fiQtRaX558p g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="304494530"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="304494530"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 06:50:23 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="659539861"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="659539861"
Received: from milawils-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.40.183])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 06:50:22 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 06/15] drm/edid: rename drm_add_override_edid_modes() to
 drm_edid_override_connector_update()
Date: Tue, 11 Oct 2022 16:49:40 +0300
Message-Id: <768e11394c1689f19da20eb55ac2c883d5613428.1665496046.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1665496046.git.jani.nikula@intel.com>
References: <cover.1665496046.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Follow the naming of both EDID override functions as well as
drm_edid_connector_update(). This also matches better what the function
does; a combination of EDID property update and add modes. Indeed it
should later be converted to call drm_edid_connector_update().

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c         | 6 +++---
 drivers/gpu/drm/drm_probe_helper.c | 2 +-
 include/drm/drm_edid.h             | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 1ada36e0d826..8baa46dc2537 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2227,7 +2227,7 @@ int drm_edid_override_reset(struct drm_connector *connector)
 }
 
 /**
- * drm_add_override_edid_modes - add modes from override/firmware EDID
+ * drm_edid_override_connector_update - add modes from override/firmware EDID
  * @connector: connector we're probing
  *
  * Add modes from the override/firmware EDID, if available. Only to be used from
@@ -2237,7 +2237,7 @@ int drm_edid_override_reset(struct drm_connector *connector)
  *
  * Return: The number of modes added or 0 if we couldn't find any.
  */
-int drm_add_override_edid_modes(struct drm_connector *connector)
+int drm_edid_override_connector_update(struct drm_connector *connector)
 {
 	struct edid *override;
 	int num_modes = 0;
@@ -2254,7 +2254,7 @@ int drm_add_override_edid_modes(struct drm_connector *connector)
 
 	return num_modes;
 }
-EXPORT_SYMBOL(drm_add_override_edid_modes);
+EXPORT_SYMBOL(drm_edid_override_connector_update);
 
 typedef int read_block_fn(void *context, u8 *buf, unsigned int block, size_t len);
 
diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 69b0b2b9cc1c..2fc21df709bc 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -367,7 +367,7 @@ static int drm_helper_probe_get_modes(struct drm_connector *connector)
 	 * override/firmware EDID.
 	 */
 	if (count == 0 && connector->status == connector_status_connected)
-		count = drm_add_override_edid_modes(connector);
+		count = drm_edid_override_connector_update(connector);
 
 	return count;
 }
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 429735b91f63..05380681a4fb 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -577,7 +577,7 @@ struct edid *drm_get_edid_switcheroo(struct drm_connector *connector,
 				     struct i2c_adapter *adapter);
 struct edid *drm_edid_duplicate(const struct edid *edid);
 int drm_add_edid_modes(struct drm_connector *connector, struct edid *edid);
-int drm_add_override_edid_modes(struct drm_connector *connector);
+int drm_edid_override_connector_update(struct drm_connector *connector);
 
 u8 drm_match_cea_mode(const struct drm_display_mode *to_match);
 bool drm_detect_hdmi_monitor(const struct edid *edid);
-- 
2.34.1

