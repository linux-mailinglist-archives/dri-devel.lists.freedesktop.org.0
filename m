Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EBE89EF8A
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 12:06:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FFB411318A;
	Wed, 10 Apr 2024 10:06:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RH/XoaNk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F142E11318A;
 Wed, 10 Apr 2024 10:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712743587; x=1744279587;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YAt7jmyAAjcZBpDC4lz2Sr6eMFL1ACEpDiDwNsHt4YE=;
 b=RH/XoaNkHVPFfgyq+OIBDQ0161inPHagYjn+smPDD3WbGLrwXCiqmIs5
 /kw9efnqoKAXqvoqVTz7g6hd9YXUG3JlG59ivgaS3nCa1LBG3ksddkZsX
 Iv8ApXEL8nktBlP5bUT7DCrJ1y/bSSPNlMkoSFGzj1xlfk46zr5XH1Xiw
 oQVeKP2IQCtckGKtS9HUvRkw7mVKdYIhfD69aIGNyC5oiYbPt6PoRwfy3
 ipsupotVPhkdDO6jE0eWc0aTqgiZJE+e9fXjRQnoV434b8Ugu+rZbntB7
 aQz7zFjAseCpNxKIUD5AxJSrToy9yPPxCT4TdpIv/rjYQc7s1wqS/FzMK w==;
X-CSE-ConnectionGUID: Hl1dy5RMQCmApQrvSjNDqQ==
X-CSE-MsgGUID: rstEl2vHSumufPEBCab5GA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18808982"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="18808982"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 03:06:26 -0700
X-CSE-ConnectionGUID: tS44JXqMTF6rDNzsufVgkA==
X-CSE-MsgGUID: SEM/RZtFR6O0P8LtFFwRvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="51735774"
Received: from oakasatk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.60.54])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 03:06:23 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tomas Winkler <tomas.winkler@intel.com>
Subject: [PATCH 10/10] drm: move i915_hdcp_interface.h under include/drm/intel
Date: Wed, 10 Apr 2024 13:05:17 +0300
Message-Id: <17b644710dc9746efea88ce7c7fd61eea912321d.1712743191.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1712743191.git.jani.nikula@intel.com>
References: <cover.1712743191.git.jani.nikula@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Clean up the top level include/drm directory by grouping all the Intel
specific files under a common subdirectory.

Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Dave Airlie <airlied@gmail.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Tomas Winkler <tomas.winkler@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_types.h    | 2 +-
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.c         | 2 +-
 drivers/gpu/drm/i915/display/intel_hdcp_gsc_message.c | 2 +-
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c              | 2 +-
 drivers/misc/mei/hdcp/mei_hdcp.c                      | 2 +-
 include/drm/{ => intel}/i915_hdcp_interface.h         | 0
 6 files changed, 5 insertions(+), 5 deletions(-)
 rename include/drm/{ => intel}/i915_hdcp_interface.h (100%)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 0f4bd5710796..98d3b6a57b82 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -44,7 +44,7 @@
 #include <drm/drm_rect.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_vblank_work.h>
-#include <drm/i915_hdcp_interface.h>
+#include <drm/intel/i915_hdcp_interface.h>
 #include <media/cec-notifier.h>
 
 #include "i915_vma.h"
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp_gsc.c b/drivers/gpu/drm/i915/display/intel_hdcp_gsc.c
index 35823e1f65d6..16afeb8a3a8d 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp_gsc.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp_gsc.c
@@ -3,7 +3,7 @@
  * Copyright 2023, Intel Corporation.
  */
 
-#include <drm/i915_hdcp_interface.h>
+#include <drm/intel/i915_hdcp_interface.h>
 
 #include "gem/i915_gem_region.h"
 #include "gt/intel_gt.h"
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp_gsc_message.c b/drivers/gpu/drm/i915/display/intel_hdcp_gsc_message.c
index 240b00849f3d..6548e71b4c49 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp_gsc_message.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp_gsc_message.c
@@ -4,7 +4,7 @@
  */
 
 #include <linux/err.h>
-#include <drm/i915_hdcp_interface.h>
+#include <drm/intel/i915_hdcp_interface.h>
 
 #include "i915_drv.h"
 #include "intel_hdcp_gsc_message.h"
diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
index ac4b870f73fa..378ee3f426dc 100644
--- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
+++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
@@ -4,7 +4,7 @@
  */
 
 #include <drm/drm_print.h>
-#include <drm/i915_hdcp_interface.h>
+#include <drm/intel/i915_hdcp_interface.h>
 #include <linux/delay.h>
 
 #include "abi/gsc_command_header_abi.h"
diff --git a/drivers/misc/mei/hdcp/mei_hdcp.c b/drivers/misc/mei/hdcp/mei_hdcp.c
index e43ea536c947..323f10620d90 100644
--- a/drivers/misc/mei/hdcp/mei_hdcp.c
+++ b/drivers/misc/mei/hdcp/mei_hdcp.c
@@ -24,7 +24,7 @@
 #include <linux/component.h>
 #include <drm/drm_connector.h>
 #include <drm/intel/i915_component.h>
-#include <drm/i915_hdcp_interface.h>
+#include <drm/intel/i915_hdcp_interface.h>
 
 #include "mei_hdcp.h"
 
diff --git a/include/drm/i915_hdcp_interface.h b/include/drm/intel/i915_hdcp_interface.h
similarity index 100%
rename from include/drm/i915_hdcp_interface.h
rename to include/drm/intel/i915_hdcp_interface.h
-- 
2.39.2

