Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F00DC001E0
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 11:09:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C16510E369;
	Thu, 23 Oct 2025 09:09:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m2x1H3JP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AFBF10E378;
 Thu, 23 Oct 2025 09:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761210542; x=1792746542;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F6LaOoqDacB+5NSYA9APefXLqBqCvkP1tuOI841eqCM=;
 b=m2x1H3JPu20XNsc2qx7UW6ebpb8k3c9FzmCiYftFndjELevJGQ4rYbVn
 aAv7q8kaypSf/6qqkeI+x2zHVLPPDJP1h7frly11TBPWYT+Y71VEfVEPf
 3bOjdIcbtJ8hgbOMBMO8M6k0KJtdrfPbnpCQ0HalBFpYTEfSJgXsngfn5
 52XtQ5vvXduAKOyDflIIIV9X+9+1LiE580r5Lza5PhwbHn7XALhH8Tpt7
 3+V+j4BRE6Vxrx8I7quvQIZAO9vOAo+OezLnYhh/4fh3nrh68RbYICjoJ
 /j9Bbx0D/5Zf6dY2H9aoy/vaspWwBcN7/sB82xi8/f7O1oQy1Zpy8FqqR g==;
X-CSE-ConnectionGUID: Rsb/TF6JToaL7QDv/Ftm7w==
X-CSE-MsgGUID: ynDjAEsPTbOsIgnp1nuqXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67020628"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="67020628"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 02:09:02 -0700
X-CSE-ConnectionGUID: xwFyVfC8RbqdlrMNQSWLWw==
X-CSE-MsgGUID: UBPa3Yz/TvC9cfnD9QO3rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="183329420"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa010.jf.intel.com with ESMTP; 23 Oct 2025 02:09:00 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH 4/8] drm/i915/alpm: Enable debugfs for DP2.1
Date: Thu, 23 Oct 2025 14:11:43 +0530
Message-Id: <20251023084147.572535-5-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20251023084147.572535-1-animesh.manna@intel.com>
References: <20251023084147.572535-1-animesh.manna@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable AlPM debug info through lobf debug info.

Cc: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index 973791f8956c..0f6b15bca3be 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -552,9 +552,15 @@ void intel_alpm_lobf_debugfs_add(struct intel_connector *connector)
 	struct intel_display *display = to_intel_display(connector);
 	struct dentry *root = connector->base.debugfs_entry;
 
-	if (DISPLAY_VER(display) < 20 ||
-	    connector->base.connector_type != DRM_MODE_CONNECTOR_eDP)
+	if (connector->base.connector_type == DRM_MODE_CONNECTOR_DisplayPort) {
+		if (DISPLAY_VER(display) < 35)
+			return;
+	} else if (connector->base.connector_type == DRM_MODE_CONNECTOR_eDP) {
+		if (DISPLAY_VER(display) < 20)
+			return;
+	} else {
 		return;
+	}
 
 	debugfs_create_file("i915_edp_lobf_debug", 0644, root,
 			    connector, &i915_edp_lobf_debug_fops);
-- 
2.29.0

