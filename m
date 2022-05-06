Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9A251D54E
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 12:11:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1F9D10FA42;
	Fri,  6 May 2022 10:11:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C39E10FAC1;
 Fri,  6 May 2022 10:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651831893; x=1683367893;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TSWzZiegN/Hy9iAno+8IJwftyvcoOBgNt0WPNQ+ZZv4=;
 b=b2h2ttrM/tAy78yE8IXrwkPcV0ieT2aCqjymK7YSvXR+erLpQQbtejCC
 Fm3dwD22m6CxR5a9cFRVuXJKytRFo9LWEd3Xzi5RedivYAj6v/ms5uDwT
 W9674j5gkFxG2zILBYEaByHjOrOhdGb5ivR3CNg/3OBW4P/CGHlt4XttI
 Is+eRqxF789pJK/2BoRLN4kW6w2XWp6Z7gvQkKX4uiX7lYxGR9Hz7wExX
 FcFW0QeqD0c5nxZItn9jSRr717PqcNr9+dIGNfr+2yw3wIhNPPG0Q5FTp
 Rr46yINrBWtJP7i+5h3yODgD5HzCC33kfRVEmme1+bV2RXwciYl00+fA+ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="268570693"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="268570693"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 03:11:33 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="600491581"
Received: from psikora-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.157.88])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 03:11:30 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 10/25] drm/edid: convert drm_dmt_modes_for_range() to drm_edid
Date: Fri,  6 May 2022 13:10:17 +0300
Message-Id: <9cfe58d19f01c2e0b6564abd77fd7541a689c854.1651830938.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1651830938.git.jani.nikula@intel.com>
References: <cover.1651830938.git.jani.nikula@intel.com>
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

We'll need to propagate drm_edid everywhere.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index b5d7347f32d9..88bb6c7ac97c 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3103,16 +3103,16 @@ static bool valid_inferred_mode(const struct drm_connector *connector,
 	return ok;
 }
 
-static int
-drm_dmt_modes_for_range(struct drm_connector *connector, const struct edid *edid,
-			const struct detailed_timing *timing)
+static int drm_dmt_modes_for_range(struct drm_connector *connector,
+				   const struct drm_edid *drm_edid,
+				   const struct detailed_timing *timing)
 {
 	int i, modes = 0;
 	struct drm_display_mode *newmode;
 	struct drm_device *dev = connector->dev;
 
 	for (i = 0; i < ARRAY_SIZE(drm_dmt_modes); i++) {
-		if (mode_in_range(drm_dmt_modes + i, edid, timing) &&
+		if (mode_in_range(drm_dmt_modes + i, drm_edid->edid, timing) &&
 		    valid_inferred_mode(connector, drm_dmt_modes + i)) {
 			newmode = drm_mode_duplicate(dev, &drm_dmt_modes[i]);
 			if (newmode) {
@@ -3208,7 +3208,7 @@ do_inferred_modes(const struct detailed_timing *timing, void *c)
 		return;
 
 	closure->modes += drm_dmt_modes_for_range(closure->connector,
-						  closure->drm_edid->edid,
+						  closure->drm_edid,
 						  timing);
 
 	if (!version_greater(closure->drm_edid->edid, 1, 1))
-- 
2.30.2

