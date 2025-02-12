Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82040A3306C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 21:06:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 833FD10E98A;
	Wed, 12 Feb 2025 20:06:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m2FDq+Ke";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE57610E97F
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 20:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739390769; x=1770926769;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eRnfdU2vmfJPGvUWDmysQE9CdXMXytxNB8DSsopwuTM=;
 b=m2FDq+Ke3dgBF6HkH7z+iCYmFW06ZleWCP05uyPOmfcu3dqBW/XJnX5M
 CC9rj80BFjyJRG/8syt6pOhfjwOqh43HrOYcAaGSvQyySs6NQfej3RimU
 oJzhNoNGc4AC+zoVhn8RZBtSMwowelE2hnmj2QPw35066PZoaerrdy9bk
 ZxlxJAXGN9qcqjt6zWoogXID/uefNh8jJDucCCwe80SKFU/gOR9dTUrCx
 k4t+X8OzAohW2jnAGamcUT4U/IueWDbeqQd//3IArhNkhSarbzleaBFUW
 FLNN+6EGmJ5252rFerjLOhbKELJHfm/apPT3m27iyWO1LzZKwpvj58dFB A==;
X-CSE-ConnectionGUID: t6uYCyB3QNmNW0y8oTAYOA==
X-CSE-MsgGUID: Rvo+zPQsRquVxhY9rypAyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="50718507"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="50718507"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 12:06:08 -0800
X-CSE-ConnectionGUID: QyREsbHrRkazVNBE+qYUaA==
X-CSE-MsgGUID: s2C2m5g4TBiX9UjAq70xYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="118010767"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 12:06:08 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: linux-kernel@vger.kernel.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 5/6] drm/xe: Switch from xe to devm actions
Date: Wed, 12 Feb 2025 12:05:41 -0800
Message-ID: <20250212200542.515493-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250212200542.515493-1-lucas.demarchi@intel.com>
References: <20250212200542.515493-1-lucas.demarchi@intel.com>
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

Now that component drivers are compatible with devm, switch to using it
instead of our own.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 4 ++--
 drivers/gpu/drm/xe/xe_gsc_proxy.c       | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index bdcc56e51433f..302f533af037d 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -161,7 +161,7 @@ int xe_display_init_early(struct xe_device *xe)
 	return err;
 }
 
-static void xe_display_fini(struct xe_device *__xe, void *arg)
+static void xe_display_fini(void *arg)
 {
 	struct xe_device *xe = arg;
 	struct intel_display *display = &xe->display;
@@ -183,7 +183,7 @@ int xe_display_init(struct xe_device *xe)
 	if (err)
 		return err;
 
-	return xe_device_add_action_or_reset(xe, xe_display_fini, xe);
+	return devm_add_action_or_reset(xe->drm.dev, xe_display_fini, xe);
 }
 
 void xe_display_register(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
index 6aa76a7843cfa..8cf70b228ff3b 100644
--- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
+++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
@@ -423,7 +423,7 @@ static int proxy_channel_alloc(struct xe_gsc *gsc)
 	return 0;
 }
 
-static void xe_gsc_proxy_remove(struct xe_device *__xe, void *arg)
+static void xe_gsc_proxy_remove(void *arg)
 {
 	struct xe_gsc *gsc = arg;
 	struct xe_gt *gt = gsc_to_gt(gsc);
@@ -490,7 +490,7 @@ int xe_gsc_proxy_init(struct xe_gsc *gsc)
 
 	gsc->proxy.component_added = true;
 
-	return xe_device_add_action_or_reset(xe, xe_gsc_proxy_remove, gsc);
+	return devm_add_action_or_reset(xe->drm.dev, xe_gsc_proxy_remove, gsc);
 }
 
 /**
-- 
2.48.1

