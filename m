Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D72078710C
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 16:07:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1AA410E558;
	Thu, 24 Aug 2023 14:07:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B7F10E555;
 Thu, 24 Aug 2023 14:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692886042; x=1724422042;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WYkKliAIpnhRBVXSb8JWcRGsrs+g6bzM7M2ZTfuxNpA=;
 b=GT0V/RpzkYHGA4dl1Mt4M+eehoFQWf7Fb5sOfLy9AVitSjvNzT/C8OPH
 wvd9nwpw0MYChplDNcTQX8ta8TuYLamEd45aTsd7FuOiPbfm18lE+ery9
 6vN+rKd4BsCp0LySPjopnNJsWU5JN+dL+t/5uflhhtuP64ZTm3vEDpsuB
 6GPUn12XYG5Yjc0g/hVlzN6gQhkC9QolgruDLqoTUii5X/czonAJ2aiGr
 +DakYRC94nD5jTIMP9brT/Oed1AMPMgquxOndqo382opfA5N833HHLHZT
 csr7TG3cWvPLDSS8lkqFOTIsbzV3rEW6I6jeQ5LbmTAdzrmPL1HGpZRNo w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="364633802"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="364633802"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 06:46:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="766545232"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="766545232"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.162])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 06:46:27 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/6] drm/edid: parse source physical address
Date: Thu, 24 Aug 2023 16:46:04 +0300
Message-Id: <8c6b6403932536b6849e0b44e1ee6e7ebdbe4a69.1692884619.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1692884619.git.jani.nikula@intel.com>
References: <cover.1692884619.git.jani.nikula@intel.com>
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
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CEC needs the source physical address. Parsing it is trivial with the
existing EDID CEA DB infrastructure.

Default to CEC_PHYS_ADDR_INVALID (0xffff) instead of 0 to cater for
easier CEC usage.

Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c  | 5 +++++
 include/drm/drm_connector.h | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 1dbb15439468..39dd3f694544 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -29,6 +29,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/cec.h>
 #include <linux/hdmi.h>
 #include <linux/i2c.h>
 #include <linux/kernel.h>
@@ -6192,6 +6193,8 @@ drm_parse_hdmi_vsdb_video(struct drm_connector *connector, const u8 *db)
 
 	info->is_hdmi = true;
 
+	info->source_physical_address = (db[4] << 8) | db[5];
+
 	if (len >= 6)
 		info->dvi_dual = db[6] & 1;
 	if (len >= 7)
@@ -6470,6 +6473,8 @@ static void drm_reset_display_info(struct drm_connector *connector)
 	info->vics_len = 0;
 
 	info->quirks = 0;
+
+	info->source_physical_address = CEC_PHYS_ADDR_INVALID;
 }
 
 static void update_displayid_info(struct drm_connector *connector,
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index d300fde6c1a4..40a5e7acf2fa 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -816,6 +816,14 @@ struct drm_display_info {
 	 * @quirks: EDID based quirks. Internal to EDID parsing.
 	 */
 	u32 quirks;
+
+	/**
+	 * @source_physical_address: Source Physical Address from HDMI
+	 * Vendor-Specific Data Block, for CEC usage.
+	 *
+	 * Defaults to CEC_PHYS_ADDR_INVALID (0xffff).
+	 */
+	u16 source_physical_address;
 };
 
 int drm_display_info_set_bus_formats(struct drm_display_info *info,
-- 
2.39.2

