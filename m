Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E9E4DBB4D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 00:46:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF23310EAB0;
	Wed, 16 Mar 2022 23:46:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE3410EAAC;
 Wed, 16 Mar 2022 23:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647474371; x=1679010371;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=D0KKmINQsD4q8WF2iXe93gXGlMYAqn0GEc9x0RjOSRA=;
 b=bL2QlNyUp5+Vr2iSZj2zKrBpXyYeZ8ntQjJAs9GOZw1Gpbu2g2RGdhcl
 IAAf3OHGECMg2i56TQ93A9qZEIyG3YXgCw+uGfjpwkEHHgseNhXrLSZB8
 ouAVoebyyGhLJ5Nx5UsPfa9Xr/qkmd2m4man6iBozmD9speuvPMq5MYxX
 fe18pZrsxYo9GpY+NC8pI8MlSU2HqTDVyCX7QdV9pQCDk4SdXJEFVE7I7
 v4luPBsewyaXWGWI+ina62S83+4qQbYw/8ub9UWdypfg1bglsNW2mFVvG
 gIAbKC9cA4xaQVpzm7aq8vvuCtqxqv7zUgxbjhQKJgegGVWElRgDNNcWV A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="256468486"
X-IronPort-AV: E=Sophos;i="5.90,187,1643702400"; d="scan'208";a="256468486"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 16:46:10 -0700
X-IronPort-AV: E=Sophos;i="5.90,187,1643702400"; d="scan'208";a="821038530"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 16:46:09 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915: Fix renamed struct field
Date: Wed, 16 Mar 2022 16:45:37 -0700
Message-Id: <20220316234538.434357-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Earlier versions of commit a5b7ef27da60 ("drm/i915: Add struct to hold
IP version") named "ver" as "arch" and then when it was renamed it
missed the rename on MEDIA_VER_FULL() since it it's currently not used.

Fixes: a5b7ef27da60 ("drm/i915: Add struct to hold IP version")
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 26df561a4e94..7458b107a1d6 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -922,7 +922,7 @@ static inline struct intel_gt *to_gt(struct drm_i915_private *i915)
 	(GRAPHICS_VER(i915) >= (from) && GRAPHICS_VER(i915) <= (until))
 
 #define MEDIA_VER(i915)			(INTEL_INFO(i915)->media.ver)
-#define MEDIA_VER_FULL(i915)		IP_VER(INTEL_INFO(i915)->media.arch, \
+#define MEDIA_VER_FULL(i915)		IP_VER(INTEL_INFO(i915)->media.ver, \
 					       INTEL_INFO(i915)->media.rel)
 #define IS_MEDIA_VER(i915, from, until) \
 	(MEDIA_VER(i915) >= (from) && MEDIA_VER(i915) <= (until))
-- 
2.35.1

