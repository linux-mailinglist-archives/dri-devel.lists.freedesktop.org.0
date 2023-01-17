Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D0B66DCE1
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 12:54:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60BA810E4A4;
	Tue, 17 Jan 2023 11:54:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9967C10E4A4;
 Tue, 17 Jan 2023 11:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673956439; x=1705492439;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zY6x6erYncaDzv05B6FWcty+zwpT4FccOl8jUshpKkY=;
 b=MD9CJbUYBvcmTk1jM06Kutw135Zj6feFOcAJdr1HGLXcdO2OHexB2UN2
 /nqN1kJj5/u/Ug3LCJxLnz4Aj3urjXAzkM8jNxbGoatFi7wCq/UR0AoOL
 kNoh7lB4p6jYVQ2L1QjVYCef0u+a559/hdi2Eqh1ZZrl2Gw5GeX0UIhlt
 cYK0GQA9EILJ/qzPV/qsBSWXvSGNAdB8q+u3tv5rie+HPAop2jwhGU9mz
 JrMiowoK/OTiw8w7N8rb5yS8nIALm58Ns1detsgQVsdN+BrOgo+IUY6M8
 1TVpWYs1cuxRJWpiWQDy3/GcdufeSwqPHzp9iVODuNIckItvNgAzoir8+ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="326744746"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; d="scan'208";a="326744746"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 03:53:59 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="767251895"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; d="scan'208";a="767251895"
Received: from nirmoyda-desk.igk.intel.com ([10.102.42.231])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 03:53:56 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/print: Add drm_dbg_ratelimited
Date: Tue, 17 Jan 2023 12:53:49 +0100
Message-Id: <20230117115350.1071-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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
Cc: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a function for ratelimitted debug print.

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 include/drm/drm_print.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index a44fb7ef257f..1d839f507319 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -602,6 +602,9 @@ void __drm_err(const char *format, ...);
 		drm_dev_printk(drm_ ? drm_->dev : NULL, KERN_DEBUG, fmt, ## __VA_ARGS__);	\
 })
 
+#define drm_dbg_ratelimited(drm, fmt, ...) \
+	__DRM_DEFINE_DBG_RATELIMITED(DRIVER, drm, fmt, ## __VA_ARGS__)
+
 #define drm_dbg_kms_ratelimited(drm, fmt, ...) \
 	__DRM_DEFINE_DBG_RATELIMITED(KMS, drm, fmt, ## __VA_ARGS__)
 
-- 
2.39.0

