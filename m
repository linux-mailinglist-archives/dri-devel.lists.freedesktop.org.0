Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9988CD957
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 19:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7D1A10E964;
	Thu, 23 May 2024 17:45:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FZ3XWPTH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C236710E964
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 17:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716486355; x=1748022355;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DMyG4G/YGZ1anEZROlnMBCxLZ7PlGGR88G/y6nekRQI=;
 b=FZ3XWPTHd2lY/tTHsFrS815WwjbDPyqCUD/4uh2cdxPD3DuSK2dmHTcB
 KePLcsQnG341JhKJ69K/ugc4g/PQBMe8pyIxwejipb4AE97+rpanHLrwQ
 WxxuKVCwMjOzNgPUUy4fUmJDOBk7gGtgZhTSLtdRS203RDOmOq7Q0j8ki
 CapG3TFRI2M4FSSpqK2J7//kf63rp1i+RdmAeyFR2OoM8ZQhkF8SC8mVQ
 WkirgPz0degFVqNq75QzLa/h+N12HkxdkU6oHNFli+bcN/IbQQHPBy3Qi
 2qVoC2Rb4Uwv2aUrZ2Mtu/MrardLq8XuEupwcrewEtc8kfWLq3SYiZeXE w==;
X-CSE-ConnectionGUID: kvPC2lobT/edpn+a/VOjtQ==
X-CSE-MsgGUID: sU1Sl0u/T1SpWiNAfyDjWA==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="35340899"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="35340899"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 10:44:44 -0700
X-CSE-ConnectionGUID: sOfsu/+WQOOxkX0gT71vGw==
X-CSE-MsgGUID: gv5WBgNsRluBRSpLDSldnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="33849586"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.19.248])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 10:44:42 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH] drm/print: Add missing [drm] prefix to drm based WARN
Date: Thu, 23 May 2024 19:44:29 +0200
Message-Id: <20240523174429.800-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All drm_device based logging macros, except those related to WARN,
include the [drm] prefix. Fix that.

  [ ] 0000:00:00.0: this is a warning
  [ ] 0000:00:00.0: drm_WARN_ON(true)
vs
  [ ] 0000:00:00.0: [drm] this is a warning
  [ ] 0000:00:00.0: [drm] drm_WARN_ON(true)

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/drm_print.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 089950ad8681..112f8830b372 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -632,12 +632,12 @@ void __drm_err(const char *format, ...);
 
 /* Helper for struct drm_device based WARNs */
 #define drm_WARN(drm, condition, format, arg...)			\
-	WARN(condition, "%s %s: " format,				\
+	WARN(condition, "%s %s: [drm] " format,				\
 			dev_driver_string((drm)->dev),			\
 			dev_name((drm)->dev), ## arg)
 
 #define drm_WARN_ONCE(drm, condition, format, arg...)			\
-	WARN_ONCE(condition, "%s %s: " format,				\
+	WARN_ONCE(condition, "%s %s: [drm] " format,			\
 			dev_driver_string((drm)->dev),			\
 			dev_name((drm)->dev), ## arg)
 
-- 
2.43.0

