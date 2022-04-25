Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 664AA50D9C4
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 08:48:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 153D01122B0;
	Mon, 25 Apr 2022 06:48:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 987F510FF6B;
 Mon, 25 Apr 2022 06:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650869320; x=1682405320;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JyYi2/M8SAEwYhIYIJnEazvXfR+ni1R3cjWWjdBz8xE=;
 b=PGGTVhnBbmK4V6+uZ9vyx/JXEv/7OmkQNNFpwDGXDFGOPCkD6KJy9EuB
 Zx5PJg4lqDbzPOB0SQKVOJ70/uaDHGSIYc0iEAclRZ/3mUcygGjtTNUiP
 7N07qEEBXzlgS8t+VSyMdWAKO1MCiWJ6fg65UIsbMPq6hgWLkFJ6cMv6P
 jMcwSnhnEeeFuBSGmf/QLE4AHSmQQPFAYKoRfiZh/abCYHn9SdgrtBBAf
 bquDkR/zo8AD59vHbSnavD1XRzly+/UKh+kSWRTO9Aht+8O/wxca7tHya
 qz/W0J/SMzQBx051aHKPZ4h9FZ90naKLWegHkn8LvuCTxKAPdv/9lwd2h g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10327"; a="265325807"
X-IronPort-AV: E=Sophos;i="5.90,287,1643702400"; d="scan'208";a="265325807"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2022 23:48:40 -0700
X-IronPort-AV: E=Sophos;i="5.90,287,1643702400"; d="scan'208";a="616385910"
Received: from bhanu-nuclab.iind.intel.com ([10.145.162.173])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2022 23:48:38 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ville.syrjala@linux.intel.com, manasi.d.navare@intel.com
Subject: [RFC v2 2/2] drm/i915/vrr: Attach and set drm crtc vrr_enabled
 property
Date: Mon, 25 Apr 2022 12:16:12 +0530
Message-Id: <20220425064612.2993587-3-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220425064612.2993587-1-bhanuprakash.modem@intel.com>
References: <20220425064612.2993587-1-bhanuprakash.modem@intel.com>
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
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This function attaches & sets the vrr_enabled property for crtc
based on the platform support and the request from userspace.

V2: Check for platform support before updating the prop.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Manasi Navare <manasi.d.navare@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 drivers/gpu/drm/i915/display/intel_crtc.c | 3 +++
 drivers/gpu/drm/i915/display/intel_vrr.c  | 8 ++++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index 4442aa355f86..36deaca9af66 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -366,6 +366,9 @@ int intel_crtc_init(struct drm_i915_private *dev_priv, enum pipe pipe)
 						BIT(DRM_SCALING_FILTER_DEFAULT) |
 						BIT(DRM_SCALING_FILTER_NEAREST_NEIGHBOR));
 
+	if (HAS_VRR(dev_priv))
+		drm_mode_crtc_attach_vrr_enabled_property(&crtc->base);
+
 	intel_color_init(crtc);
 
 	intel_crtc_drrs_init(crtc);
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 396f2f994fa0..7263b35550de 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -160,6 +160,10 @@ void intel_vrr_enable(struct intel_encoder *encoder,
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	u32 trans_vrr_ctl;
 
+	if (HAS_VRR(dev_priv))
+		drm_mode_crtc_set_vrr_enabled_property(crtc_state->uapi.crtc,
+						       crtc_state->vrr.enable);
+
 	if (!crtc_state->vrr.enable)
 		return;
 
@@ -211,6 +215,10 @@ void intel_vrr_disable(const struct intel_crtc_state *old_crtc_state)
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
 	enum transcoder cpu_transcoder = old_crtc_state->cpu_transcoder;
 
+	if (HAS_VRR(dev_priv))
+		drm_mode_crtc_set_vrr_enabled_property(old_crtc_state->uapi.crtc,
+						       false);
+
 	if (!old_crtc_state->vrr.enable)
 		return;
 
-- 
2.35.1

