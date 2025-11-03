Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6563BC2E482
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 23:37:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7F7710E4DB;
	Mon,  3 Nov 2025 22:37:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hjM2zTr4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51BFD10E4D6;
 Mon,  3 Nov 2025 22:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762209450; x=1793745450;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8ki1Y3hmhcXZ5PQatBQVTWUjosMD88L6gzJwMWKOqfI=;
 b=hjM2zTr422DLIU1EaqLa5nGiDR+aox3CUt09oAIAVqxb/q2CT4+8Fy46
 ixSYc+p92Mb46DArAb5oJUhaiD0w/TG9fIxN/qEvM/yXJJRMHGeUNPRgu
 11U/EG76y8po9Bb72B8ZzOFuIurPHWfRSdlBeVUM8sSAigfpwdKLQa4n0
 HlnhshLhDgpSBpW9UYNyBKJmQYaBDhVG48aaOiQ2u6CX5fv7bNAuyj3pU
 5ezsk66UKxdoGdpmAbI0Lh/DbGRlzvpdM+yv5Tt5NqSdaw0sdMFmEbKQU
 cbo16pHFans0aqijM847hCz00okZ32fBPEs+N9WyFJKdnZrxyZKzFiS1S w==;
X-CSE-ConnectionGUID: lxEi2Rb9SSmwVEjJgP9lHQ==
X-CSE-MsgGUID: sWIgx2/nQoy/uqnnOrfYSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="74899613"
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; d="scan'208";a="74899613"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 14:37:30 -0800
X-CSE-ConnectionGUID: TQmSymdPTS+8+Q0H+IO2+w==
X-CSE-MsgGUID: 51SDntLZSEy1nUAV3JXxLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; d="scan'208";a="187707513"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by fmviesa010.fm.intel.com with ESMTP; 03 Nov 2025 14:37:28 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH v2 03/10] drm/i915/alpm: Enable debugfs for DP2.1
Date: Tue,  4 Nov 2025 03:39:50 +0530
Message-Id: <20251103220957.1229608-4-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20251103220957.1229608-1-animesh.manna@intel.com>
References: <20251103220957.1229608-1-animesh.manna@intel.com>
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
index 639941e332f3..779718d0c8dd 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -541,9 +541,15 @@ void intel_alpm_lobf_debugfs_add(struct intel_connector *connector)
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

