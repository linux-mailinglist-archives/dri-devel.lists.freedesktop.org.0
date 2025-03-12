Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F3AA5D70B
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 08:13:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7615F10E706;
	Wed, 12 Mar 2025 07:13:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gnuH2Ie0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 776F410E703;
 Wed, 12 Mar 2025 07:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741763607; x=1773299607;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bcfEdNHxrmGz+WEpkSVkyNgjCjaaXvyyv7Kcz1aWKec=;
 b=gnuH2Ie0MUlPdLTeSQm7vGCVChIj9bcX5PGzG3f2vbyoT+SoZ9qATRUY
 9bH2K9/ekpZ7HWixUeRu5MVfcZmwb6c6zHPl7P2eG7zKgUiA+MhXIaced
 SjVyl84qnTABj8hoMqzDebK0m9qJ3Kbn7ox4lDL9Fk/6U1L53cVr+c9K0
 JvQU38oY3HpWX+UnpkdZ0KzeNup4SZiBLDdIhBApxqR80D/CWKKPpJYTB
 hIHJXPyH1LHgPee7KwZpnxzIODblLVllyvi4c7KZT8JQYiGYyFJemnC3W
 bZp07IdRD2FD/dKQWWLK5O8Ozn9Dn5mYtKrDfZ1rSFjIC27G7eHMcIeXY w==;
X-CSE-ConnectionGUID: ahSH/dZVSISaXfQoQQ2pUA==
X-CSE-MsgGUID: KRtxU3trTcCm99tooTllRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="65288851"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="65288851"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 00:13:14 -0700
X-CSE-ConnectionGUID: nSUxPMmnQ4KCM39PBZpAuA==
X-CSE-MsgGUID: YeGRkKG3Ro6d8QnSxRlnYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="120367289"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa006.fm.intel.com with ESMTP; 12 Mar 2025 00:13:10 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v4 15/23] drm/i915/color: Add new color callbacks for Xelpd
Date: Wed, 12 Mar 2025 12:54:17 +0530
Message-ID: <20250312072425.3099205-16-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250312072425.3099205-1-uma.shankar@intel.com>
References: <20250312072425.3099205-1-uma.shankar@intel.com>
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

From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

Since we intend to add plane color callbacks from Xelpd(D13 and beyond),
create a different structure for it.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index ac4bf97741a3..45f46d7db15b 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -3874,6 +3874,17 @@ static const struct intel_color_funcs tgl_color_funcs = {
 	.get_config = skl_get_config,
 };
 
+static const struct intel_color_funcs xelpd_color_funcs = {
+	.color_check = icl_color_check,
+	.color_commit_noarm = icl_color_commit_noarm,
+	.color_commit_arm = icl_color_commit_arm,
+	.load_luts = icl_load_luts,
+	.read_luts = icl_read_luts,
+	.lut_equal = icl_lut_equal,
+	.read_csc = icl_read_csc,
+	.get_config = skl_get_config,
+};
+
 static const struct intel_color_funcs icl_color_funcs = {
 	.color_check = icl_color_check,
 	.color_commit_noarm = icl_color_commit_noarm,
@@ -4305,7 +4316,9 @@ void intel_color_init_hooks(struct intel_display *display)
 		else
 			display->funcs.color = &i9xx_color_funcs;
 	} else {
-		if (DISPLAY_VER(display) >= 12)
+		if (DISPLAY_VER(display) >= 13)
+			display->funcs.color = &xelpd_color_funcs;
+		else if (DISPLAY_VER(display) == 12)
 			display->funcs.color = &tgl_color_funcs;
 		else if (DISPLAY_VER(display) == 11)
 			display->funcs.color = &icl_color_funcs;
-- 
2.42.0

