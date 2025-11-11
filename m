Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3881C4E09B
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 14:10:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EED0810E58A;
	Tue, 11 Nov 2025 13:10:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S6cRf6EK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5CEC10E567;
 Tue, 11 Nov 2025 13:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762866653; x=1794402653;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zfwFE4WMoPSq5u1PYl3jCWYtF1F+uhn873gxUfsghiE=;
 b=S6cRf6EKzdE/X6nstKXc1K5hUz0j7WTH1gSGqx6+OEE1G66lrZdn1AAR
 kfrljjqLwsK0duchYr7ZFLBuRU3tElINZAbwBgWwfRUs+F6L0o7VorsiJ
 HwPHmtpSwYtp5PuDNQQy5BsWlRN68xjAumt7+usZ/4TwXWDYlfrkr4Q72
 8+fHlE5X0QgsK8JhOVMnFkuqiVToHkaTDFCTZrKEvahYK2C0VQaMQ8GFc
 7g6HDbFE8UGZAzYC4TYqGMspH4UoXr4YLnWcfzW4rptJJkl7S5xisySfk
 vtOEZ1j4/+6fIgiQeKAdkTNkbOe0JVI3dlXdOEEIReyRsUEandFp7WDb9 g==;
X-CSE-ConnectionGUID: ZQyEwipUQG6/rtbblQZAXA==
X-CSE-MsgGUID: fnSzVPkDQl+wM7LUfg1fzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64967467"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="64967467"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 05:10:53 -0800
X-CSE-ConnectionGUID: WRDiqxJHT4a9SqgTPOOjog==
X-CSE-MsgGUID: lWNC6nlZQBOsrq9M1qISMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="189129228"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa008.jf.intel.com with ESMTP; 11 Nov 2025 05:10:51 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH v3 03/10] drm/i915/alpm: Enable debugfs for DP2.1
Date: Tue, 11 Nov 2025 18:13:09 +0530
Message-Id: <20251111124316.1421013-4-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20251111124316.1421013-1-animesh.manna@intel.com>
References: <20251111124316.1421013-1-animesh.manna@intel.com>
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

v2: cosmetic change. [Suraj]
v3: Use common api instead of DISPLAY_VER check in multiple places. [Jani]

Cc: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index 14acd6717e59..3e271de5504b 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -551,11 +551,9 @@ DEFINE_SIMPLE_ATTRIBUTE(i915_edp_lobf_debug_fops,
 
 void intel_alpm_lobf_debugfs_add(struct intel_connector *connector)
 {
-	struct intel_display *display = to_intel_display(connector);
 	struct dentry *root = connector->base.debugfs_entry;
 
-	if (DISPLAY_VER(display) < 20 ||
-	    connector->base.connector_type != DRM_MODE_CONNECTOR_eDP)
+	if (!intel_alpm_source_supported(connector))
 		return;
 
 	debugfs_create_file("i915_edp_lobf_debug", 0644, root,
-- 
2.29.0

