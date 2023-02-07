Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B6768DECC
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 18:21:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CCF810E46D;
	Tue,  7 Feb 2023 17:21:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9619710E1E9;
 Tue,  7 Feb 2023 17:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675790492; x=1707326492;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HAM9bQDFxlH/EhH1WIAz6lDlb1Nt74UfKDXlh3LRyxA=;
 b=HPmobpM59esY+p+TnsicI534QBFUCmb2aa/tPGkoWLO7ZiC2fLE6x8O+
 KdCosrhq7i7/1dtmvNnkA6tgoyO5yK0yU9nxYxozwgk6ELwNDEmECJGUE
 fNY4rIjBm9xNAWD8wx7DMV1uKQw2w4XJVGlzc/nyqCU35lBLFMl8UWPZS
 s3t8FSqCcj12hsrYMssADkuRSu4Wh/zw4qlphu4xStp5RSiEQdLMbmdEa
 JTQmDPz0QCG7ip8VpO85K8nFQUsZMLpC6c1e7r/9E8WEEA34M2Wkf031k
 S5E6WRjJfbfcoNkc2+2/JW/7nTpUH2OsOZev8/JSicprA5fsWZh+VRPGQ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="317534431"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; d="scan'208";a="317534431"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2023 06:33:46 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="755641535"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; d="scan'208";a="755641535"
Received: from tronach-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.36.11])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2023 06:33:42 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: Disable dynamic debug as broken
Date: Tue,  7 Feb 2023 16:33:37 +0200
Message-Id: <20230207143337.2126678-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: jani.nikula@intel.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 stable@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

CONFIG_DRM_USE_DYNAMIC_DEBUG breaks debug prints for (at least modular)
drm drivers. The debug prints can be reinstated by manually frobbing
/sys/module/drm/parameters/debug after the fact, but at that point the
damage is done and all debugs from driver probe are lost. This makes
drivers totally undebuggable.

There's a more complete fix in progress [1], with further details, but
we need this fixed in stable kernels. Mark the feature as broken and
disable it by default, with hopes distros follow suit and disable it as
well.

[1] https://lore.kernel.org/r/20230125203743.564009-1-jim.cromie@gmail.com

Fixes: 84ec67288c10 ("drm_print: wrap drm_*_dbg in dyndbg descriptor factory macro")
Cc: Jim Cromie <jim.cromie@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.1+
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index f42d4c6a19f2..dc0f94f02a82 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -52,7 +52,8 @@ config DRM_DEBUG_MM
 
 config DRM_USE_DYNAMIC_DEBUG
 	bool "use dynamic debug to implement drm.debug"
-	default y
+	default n
+	depends on BROKEN
 	depends on DRM
 	depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
 	depends on JUMP_LABEL
-- 
2.34.1

