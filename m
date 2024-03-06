Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17665873F43
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 19:32:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FDCC11343D;
	Wed,  6 Mar 2024 18:32:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A40JG8l3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F0F811343B;
 Wed,  6 Mar 2024 18:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709749953; x=1741285953;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bj7teZyRgA1G5oWqnX0AjhjU77ncI6IAFbNC/2BSJto=;
 b=A40JG8l3Gw220PyQhRtDXRY8LyJzIAeqxC4OyQFkMEmh+8Q7DJPUao0h
 5nvr8elta+5RU1a9cLOBQK8eEJtqjJXc8+gxEBGelGu3sAG1LhiUsMmdi
 puWK0X9MHnp2kbTKSRx5L3lja5R1O8WaiEXPBEmqYp3ONiCaLtk0Jutkw
 hc5HuppBj/T3iniyhXtxRNEIdZi/akEEfkjvqkoFEtj9xWnxFBqV+OCCS
 wGKI9MDUrUZPVfPJbZTuetxc8Khy0TYHI8Z4eeFY1R1UOWwhIhcbB9iKZ
 q6AcfkkQBsxu6ryj6gKYGO5NJLCbrAAu5RQnvhjTOXdmh413fkG3waVgl g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="15102722"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="15102722"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 10:32:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="14415806"
Received: from rjongalo-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.33.211])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 10:32:30 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com
Subject: [PATCH 12/22] drm/of: make drm_of.h self-contained
Date: Wed,  6 Mar 2024 20:31:17 +0200
Message-Id: <e9b3ea30984b913f6e32ed35e0575438dff8278c.1709749576.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1709749576.git.jani.nikula@intel.com>
References: <cover.1709749576.git.jani.nikula@intel.com>
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

Include <linux/err.h> for ERR_PTR.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/drm_of.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm/drm_of.h b/include/drm/drm_of.h
index 082a6e980d01..02d1cdd7f798 100644
--- a/include/drm/drm_of.h
+++ b/include/drm/drm_of.h
@@ -2,6 +2,7 @@
 #ifndef __DRM_OF_H__
 #define __DRM_OF_H__
 
+#include <linux/err.h>
 #include <linux/of_graph.h>
 #if IS_ENABLED(CONFIG_OF) && IS_ENABLED(CONFIG_DRM_PANEL_BRIDGE)
 #include <drm/drm_bridge.h>
-- 
2.39.2

