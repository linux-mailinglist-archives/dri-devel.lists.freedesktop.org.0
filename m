Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C10D852920
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 07:41:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CBDB10E872;
	Tue, 13 Feb 2024 06:41:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xynm9d2e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D6110E848;
 Tue, 13 Feb 2024 06:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707806459; x=1739342459;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A1x85XxbWpZjiBnrJfJXNdayR4qoMoWd/RsSstzMpaw=;
 b=Xynm9d2e9DkzqVOQV0Iqd82vVfJwJfySHzXexWg6rxv4X2r5axGNjC8Q
 BXxRYKVwSE6kyyma36JAnLTeAImkW0Vp80oIhq3mn+9USLGHm3GNY0fTC
 xl/1shAgwWYsHUuZELhPU7C+Lh/9VL6FDKlP+yj+8CR0qlYBRktCESQ1u
 c/4Pcn0lBoGAMRkTdv+PigBEzKOOU6Dx48nuyDmBTtDnq/6JYmpgeMx66
 o+bc5833TFFGMvS0vuUUSZneLGKHEHjG9Hp0165nH2TkPVKYTrd5U1Cvb
 dIWsMnbX8WHFQ1U4gxkvov2jRVuWtc5N7NIoyvuBDvFw6n+/98Q4gdLZW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="436947699"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; d="scan'208";a="436947699"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 22:40:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="7450195"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa003.jf.intel.com with ESMTP; 12 Feb 2024 22:40:52 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 contact@emersion.fr, harry.wentland@amd.com, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, arthurgrillo@riseup.net, marcan@marcan.st,
 Liviu.Dudau@arm.com, sashamcintosh@google.com, sean@poorly.run,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Subject: [PATCH 04/28] drm: Fix error logging in set Color Pipeline
Date: Tue, 13 Feb 2024 12:18:11 +0530
Message-ID: <20240213064835.139464-5-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240213064835.139464-1-uma.shankar@intel.com>
References: <20240213064835.139464-1-uma.shankar@intel.com>
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

Fix error logging in set Color Pipeline

Note: This patch can be squashed with the following patch

("drm/colorop: Introduce DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE") [1]

[1] https://patchwork.freedesktop.org/patch/566623/?series=123446&rev=3

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 64657d961755..e7bf1fb054af 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -570,14 +570,14 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 	} else if (property == plane->color_encoding_property) {
 		if (file_priv->plane_color_pipeline) {
 			drm_dbg_atomic(dev,
-				       "Setting COLOR_PIPELINE plane property not permitted when DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE is set\n");
+				       "Setting COLOR_ENCODING plane property not permitted when DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE is set\n");
 			return -EINVAL;
 		}
 		state->color_encoding = val;
 	} else if (property == plane->color_range_property) {
 		if (file_priv->plane_color_pipeline) {
 			drm_dbg_atomic(dev,
-				       "Setting COLOR_PIPELINE plane property not permitted when DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE is set\n");
+				       "Setting COLOR_RANGE plane property not permitted when DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE is set\n");
 			return -EINVAL;
 		}
 		state->color_range = val;
-- 
2.42.0

