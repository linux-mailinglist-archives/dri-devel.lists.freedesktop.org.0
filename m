Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B018763DA
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 12:57:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 601291138AC;
	Fri,  8 Mar 2024 11:57:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZrkZLjPX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5884511389F;
 Fri,  8 Mar 2024 11:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709899070; x=1741435070;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gV5JhL2Ws+DNnnOufGaa75CdQlGS2UAeU2QL5WdrS30=;
 b=ZrkZLjPXj2cMn/GgoYxU0reLFL9iX8KXuuJ4Yo9p8JXis86kitDMz3f5
 mL649+BlwKXib4JijImPdqWeZLkCjgj7kQPBIOQzKe1MqLhFJRr2qbJXM
 zsXams0HsPBOd5h+RUZ28ZAzv0OUn5CX0MGXoHZh6/8Yt8s+VzmvBrfrF
 BIo7NmKsm3jbkMd9nuLwjAmFeWi2R8FdZ2FB8FslgMlSIO6PAMYLDgAcP
 Kclf7yw6Pf69LfJtgHCv0Ybgr6riwhRnHWugJK3OhsCd5e4v8uY9pO1+V
 aURRnRDGsoj+SuzyMSmkvr+uHV+YND8l/LL0lrFZLQ5X1BdYnynWsRKiH A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15262446"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="15262446"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 03:57:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="10487914"
Received: from unknown (HELO localhost) ([10.252.34.187])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 03:57:47 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Masahiro Yamada <masahiroy@kernel.org>, lucas.demarchi@intel.com
Subject: [PATCH v2 15/16] drm: avoid includes in drm_crtc_helper_internal.h
Date: Fri,  8 Mar 2024 13:55:53 +0200
Message-Id: <fb7fb2986e19f949bf3a9b16230a59e0f7aaebdf.1709898638.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1709898638.git.jani.nikula@intel.com>
References: <cover.1709898638.git.jani.nikula@intel.com>
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

Prefer forward declarations over includes where possible.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_crtc_helper_internal.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc_helper_internal.h b/drivers/gpu/drm/drm_crtc_helper_internal.h
index ed4deed07abd..8059f65c5d6c 100644
--- a/drivers/gpu/drm/drm_crtc_helper_internal.h
+++ b/drivers/gpu/drm/drm_crtc_helper_internal.h
@@ -29,10 +29,12 @@
 #ifndef __DRM_CRTC_HELPER_INTERNAL_H__
 #define __DRM_CRTC_HELPER_INTERNAL_H__
 
-#include <drm/drm_connector.h>
-#include <drm/drm_crtc.h>
-#include <drm/drm_encoder.h>
-#include <drm/drm_modes.h>
+enum drm_mode_status;
+struct drm_connector;
+struct drm_crtc;
+struct drm_display_mode;
+struct drm_encoder;
+struct drm_modeset_acquire_ctx;
 
 /* drm_probe_helper.c */
 enum drm_mode_status drm_crtc_mode_valid(struct drm_crtc *crtc,
-- 
2.39.2

