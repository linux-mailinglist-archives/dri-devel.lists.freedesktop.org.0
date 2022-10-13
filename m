Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8F25FD656
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 10:40:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF4810E512;
	Thu, 13 Oct 2022 08:40:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F3B10E508;
 Thu, 13 Oct 2022 08:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665650423; x=1697186423;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xKHdxIv4CwA4m4kX+kREgjAR3kuPjYj7CbjXhpkWhVU=;
 b=KLu+5EHFlSLM8OVb14WbenqX1X6eBo+J1jhp2//FiABk+mxlnITf/Hbu
 h2moPKUrlpNlBoiyMtiSsHnLKHishACBlMLwjXyWUZ5zQYksyJ2cQSkou
 T9LX8ICB0NxJ/UNXCVv19qA1y5rI4ZlBF4CoNhin5e1571/r65hdJI0TY
 u7hMTKf9C/e89rpq22zlZFQte308wGIUzfzmD4/a2rWEFErrfjbTUAQDG
 aiA46flIpTrTRMwHc/N+gMGuxBSYhufWA0pLNpaYhjdhSM8yLRTOXE+nN
 la91l8l+3Z/FL8zyxOFa6S++3dJRYK8LPUrYfTmUcqU2b1zMWVmNeiLh+ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="306655585"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; d="scan'208";a="306655585"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2022 01:40:22 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="658098659"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; d="scan'208";a="658098659"
Received: from nirmoyda-desk.igk.intel.com ([10.102.13.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2022 01:40:20 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/print: Add drm_dbg_ratelimited
Date: Thu, 13 Oct 2022 10:40:06 +0200
Message-Id: <20221013084007.19843-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.37.3
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
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a function for ratelimitted debug print.

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 include/drm/drm_print.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 22fabdeed297..1e2e26378570 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -562,6 +562,9 @@ void __drm_err(const char *format, ...);
 		drm_dev_printk(drm_ ? drm_->dev : NULL, KERN_DEBUG, fmt, ## __VA_ARGS__);	\
 })
 
+#define drm_dbg_ratelimited(drm, fmt, ...) \
+	__DRM_DEFINE_DBG_RATELIMITED(DRIVER, drm, fmt, ## __VA_ARGS__)
+
 #define drm_dbg_kms_ratelimited(drm, fmt, ...) \
 	__DRM_DEFINE_DBG_RATELIMITED(KMS, drm, fmt, ## __VA_ARGS__)
 
-- 
2.37.3

