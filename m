Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5F9C57679
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 13:29:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7602510E803;
	Thu, 13 Nov 2025 12:29:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gwuhrZkd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E9A410E800;
 Thu, 13 Nov 2025 12:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763036938; x=1794572938;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y/2Mp22D9iVqZSFtYvbjh6Fm+hUedevOD3Gs1DbjXwY=;
 b=gwuhrZkdrh029EB6Zsze4+JnYSd5UQaojKEKbpiiI0xCFGqziR+HWyVw
 uoWiM5E3p0pAFIm5JqoOPZkBTIOMEgZl3gBrerlKHQ83F7eyCU19d4k/K
 KWK37zeHsNpwzZTwQvpq+iCBsh15nai27jAZrx5bT/qocx4hAAode9/za
 JEyK0ONc5XbuKfAMA5VzVi/MLXicNI/i3SEydrm+h+KMfPPjTbJeaO4X4
 EsA8UlFJX5aOu527i7fQUrs3YCzsZVtd35q5ZX94UZeL0B62TMZHDUG3X
 eUvyrEgqK9mRT4jBpTpyiHvZH+Bd0Fl3Nx35k17bKymP0KcVxOJk99Mqu w==;
X-CSE-ConnectionGUID: w6fqexjhQUWvvFniSoeTXw==
X-CSE-MsgGUID: 7XIuPIpES0+crLdHP5JTwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="52677897"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="52677897"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 04:28:58 -0800
X-CSE-ConnectionGUID: cpWx+49cTXSM1SR8U/NHHQ==
X-CSE-MsgGUID: xIoJMKb5RNeNwNi1To+4BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="188757733"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa006.jf.intel.com with ESMTP; 13 Nov 2025 04:28:56 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH v4 03/10] drm/i915/alpm: Enable debugfs for DP2.1
Date: Thu, 13 Nov 2025 17:31:12 +0530
Message-Id: <20251113120119.1437955-4-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20251113120119.1437955-1-animesh.manna@intel.com>
References: <20251113120119.1437955-1-animesh.manna@intel.com>
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

Enable ALPM debug info through lobf debug info.

v2: cosmetic change. [Suraj]
v3: Use common api instead of DISPLAY_VER check in multiple places. [Jani]

Cc: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
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

