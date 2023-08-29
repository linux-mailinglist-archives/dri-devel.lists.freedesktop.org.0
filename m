Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 294BE78C915
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 18:00:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E271710E3F5;
	Tue, 29 Aug 2023 15:59:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6654810E3E5;
 Tue, 29 Aug 2023 15:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693324744; x=1724860744;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R61xpepqKpYQimlj4K6h7jVYR2oEcisvx/uzlHcstBE=;
 b=c9zEm7VHESDSd5+Euxqb/0KPzcWUz7Q/TKOtm6khnZOinmVvGENaxVYK
 vXZhNv05iufnrKPhsXgtxeL2PtZZAiEBRG7z0YjVjKneXyU08KgUZI/HC
 IQ2vw85COwg6dNFY+Z7ARNc47wxgSjl3n1pAmfKAjSVyDI0bBL0l3q+9S
 MU9OccbQsh5c/ay/CJR83dlD+jyKlQedQEYGpNVCtCrJJX5azNT5TYahH
 MPDCr4LaP76LpUGyOZYx+0XKYF0KWB9lLJ18EitNLW7AFg40k8zvBdv9p
 ol8s8tolX/F+LXMk/Wt7b0zf9zuk8o2LX4mEce4sDhdifogUnTPKCnSdl Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="441769281"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="441769281"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 08:59:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="688555005"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="688555005"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orsmga003.jf.intel.com with ESMTP; 29 Aug 2023 08:59:02 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 10/33] drm: Manage color blob states
Date: Tue, 29 Aug 2023 21:33:59 +0530
Message-ID: <20230829160422.1251087-11-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230829160422.1251087-1-uma.shankar@intel.com>
References: <20230829160422.1251087-1-uma.shankar@intel.com>
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
Cc: Uma Shankar <uma.shankar@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

This patch manages the references for color blobs.

Co-developed-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 784e63d70a42..a554e04c2ce3 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -338,6 +338,19 @@ void __drm_atomic_helper_plane_duplicate_state(struct drm_plane *plane,
 	state->fence = NULL;
 	state->commit = NULL;
 	state->fb_damage_clips = NULL;
+
+	if (state->set_color_pipeline_data)
+		drm_property_blob_get(state->set_color_pipeline_data);
+	if (state->color.pre_csc_lut)
+		drm_property_blob_get(state->color.pre_csc_lut);
+	if (state->color.ctm)
+		drm_property_blob_get(state->color.ctm);
+	if (state->color.post_csc_lut)
+		drm_property_blob_get(state->color.post_csc_lut);
+	if (state->color.private_color_op_data)
+		drm_property_blob_get(state->color.private_color_op_data);
+
+	state->color_mgmt_changed = false;
 }
 EXPORT_SYMBOL(__drm_atomic_helper_plane_duplicate_state);
 
@@ -384,6 +397,11 @@ void __drm_atomic_helper_plane_destroy_state(struct drm_plane_state *state)
 		drm_crtc_commit_put(state->commit);
 
 	drm_property_blob_put(state->fb_damage_clips);
+	drm_property_blob_put(state->set_color_pipeline_data);
+	drm_property_blob_put(state->color.pre_csc_lut);
+	drm_property_blob_put(state->color.ctm);
+	drm_property_blob_put(state->color.post_csc_lut);
+	drm_property_blob_put(state->color.private_color_op_data);
 }
 EXPORT_SYMBOL(__drm_atomic_helper_plane_destroy_state);
 
-- 
2.38.1

