Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 341687BB90D
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 15:26:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDE1E10E1E9;
	Fri,  6 Oct 2023 13:26:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC6B810E1E9;
 Fri,  6 Oct 2023 13:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696598792; x=1728134792;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UAgRlcuOey+hW3kwVaYUGKWmltIcll8TSbj5HIb6aJA=;
 b=cKbwprZwJJ3enGQ4+DEQ40S23bsTzjvJbjIaeg2gc7qiX8736Ildp/86
 Z6GUojqxKa6RL0DV2O9bU0c6hGXAH4NSqvnGu84zvSXCsZGCOQY7QXPpg
 AvJBS0vbGZZ8MUv3O9FPHL2LrQ1T6zB7zqm99x6pyO9jKtGM9+R9LldFx
 CHVuDfaW8KzVOYvlOEHJYIYjV2ebBCAAYT154exwIs6PeFKiJdgd5eyfS
 oHaWDXJLXFz5HNil4MB0lgJQvuQBpN9pTl9mROXNpz/e6h5W1cjaJMIql
 4kWke+Ifxl4xnkzGTlcriJc6YN62s0jXcN92ZSPNaOUloCWXy461VNCAY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="374096368"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="374096368"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 06:26:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="728839621"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="728839621"
Received: from suthengc-mobl1.gar.corp.intel.com (HELO intel.com)
 ([10.215.154.2])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 06:26:23 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/print: Add drm_dbg_ratelimited
Date: Fri,  6 Oct 2023 15:26:06 +0200
Message-Id: <20231006132606.810110-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.40.1
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nirmoy Das <nirmoy.das@intel.com>

Add a function for ratelimitted debug print.

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 include/drm/drm_print.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index a93a387f8a1a..ad77ac4b6808 100644
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
2.40.1

