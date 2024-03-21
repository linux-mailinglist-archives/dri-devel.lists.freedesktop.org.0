Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD2C8856B4
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 10:45:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17EB210E4D8;
	Thu, 21 Mar 2024 09:45:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c+aT40+3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8111C10E4CB;
 Thu, 21 Mar 2024 09:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711014341; x=1742550341;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IKGqrQphR5b79ERXXYPDjXSyxAGvreM0eJOLhXwviRs=;
 b=c+aT40+3a2iH7NW1aA4aGW7gXM6pI7lKoGs+HC9j1JzWq+ZsPy9heA7i
 4SpFyUQ78T0UNPEE6TfzZoZVNqLCyVlTDDqv24Dl0s171gq7gYkhXW04T
 Jx0ZWK2DtCUw0INlQo5+YKZT/1/dT75qNo576MNQWO4LcsFAdclaYcZeC
 Yaly1nGMp9hi8s0rSfXoRgQh3UnJO9DwEDJWtA15db+VFpX+vVuDpY6G1
 AWshCk1XDMUrJx50+4Wl6xv5JlfUQTsGtZ6mCMvMxZt9KbSKecFOKtkMC
 OdU+Ggs6j1imooPefdB/MDR7KmCsfHOr2JJCJl8sv151eL4h8I6Zrepbd Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="28462354"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="28462354"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 02:45:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="14456950"
Received: from amaslenx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.54.141])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 02:45:40 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	jani.nikula@intel.com
Subject: [PATCH 1/3] drm/displayid: move drm_displayid.h to
 drm_displayd_internal.h
Date: Thu, 21 Mar 2024 11:45:29 +0200
Message-Id: <16e4af568d8e54c90077b520eab5176e94753023.1711014272.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1711014272.git.jani.nikula@intel.com>
References: <cover.1711014272.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are no exported symbols for displayid, and it's all internal
interfaces. Move the header to drivers/gpu/drm/drm_displayd_internal.h.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_displayid.c                              | 3 ++-
 .../gpu/drm/drm_displayid_internal.h                         | 5 +++--
 drivers/gpu/drm/drm_edid.c                                   | 2 +-
 3 files changed, 6 insertions(+), 4 deletions(-)
 rename include/drm/drm_displayid.h => drivers/gpu/drm/drm_displayid_internal.h (98%)

diff --git a/drivers/gpu/drm/drm_displayid.c b/drivers/gpu/drm/drm_displayid.c
index 9edc111be7ee..f72a893c7deb 100644
--- a/drivers/gpu/drm/drm_displayid.c
+++ b/drivers/gpu/drm/drm_displayid.c
@@ -3,10 +3,11 @@
  * Copyright © 2021 Intel Corporation
  */
 
-#include <drm/drm_displayid.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_print.h>
 
+#include "drm_displayid_internal.h"
+
 static const struct displayid_header *
 displayid_get_header(const u8 *displayid, int length, int index)
 {
diff --git a/include/drm/drm_displayid.h b/drivers/gpu/drm/drm_displayid_internal.h
similarity index 98%
rename from include/drm/drm_displayid.h
rename to drivers/gpu/drm/drm_displayid_internal.h
index 566497eeb3b8..5ca3db6d788f 100644
--- a/include/drm/drm_displayid.h
+++ b/drivers/gpu/drm/drm_displayid_internal.h
@@ -19,8 +19,9 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  * OTHER DEALINGS IN THE SOFTWARE.
  */
-#ifndef DRM_DISPLAYID_H
-#define DRM_DISPLAYID_H
+
+#ifndef DRM_DISPLAYID_INTERNAL_H
+#define DRM_DISPLAYID_INTERNAL_H
 
 #include <linux/types.h>
 #include <linux/bits.h>
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index ea77577a3786..07752cd37b57 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -38,7 +38,6 @@
 #include <linux/slab.h>
 #include <linux/vga_switcheroo.h>
 
-#include <drm/drm_displayid.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_eld.h>
@@ -46,6 +45,7 @@
 #include <drm/drm_print.h>
 
 #include "drm_crtc_internal.h"
+#include "drm_displayid_internal.h"
 #include "drm_internal.h"
 
 static int oui(u8 first, u8 second, u8 third)
-- 
2.39.2

