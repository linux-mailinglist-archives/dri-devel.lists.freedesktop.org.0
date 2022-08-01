Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2572586C82
	for <lists+dri-devel@lfdr.de>; Mon,  1 Aug 2022 16:02:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9DEC14A45B;
	Mon,  1 Aug 2022 13:58:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61015C3B32;
 Mon,  1 Aug 2022 13:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659361987; x=1690897987;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CPvBQH1FedYAX9FU/4Wrfdczss9r4R9ly/4TTGjKkDE=;
 b=Es2eiMDnOMmLSYMZudEtppAaI1WTKRq+ei7O0M8YPMHEZx+lGeN7bJxp
 24ILjzIgRaCeoYtxgsa3tE+3tccYlNK2YovFSrn2JzLCTFSdLxFx2bfGf
 V7RocZA3RfCc7h4cu9YYWv3smS8P21d1M/xNZ8iIw69HFgeI5kZniCbWu
 EftIwtI6IH5cEIpP69ZjH29WULLG3d2TM/w2ENNPptCeqJCVSLp19xTyZ
 wPbiMmXZhGOlzl8dZcyjW8pn3hnFhqngQsUkK6IGy2wsebg88PeyvPkmj
 IO3wXV0GTJrMCSCJprylieI/d5HETZwxIRD07ltEk4IR0fbcjLH8L+Aj6 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10426"; a="289921050"
X-IronPort-AV: E=Sophos;i="5.93,208,1654585200"; d="scan'208";a="289921050"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2022 06:53:07 -0700
X-IronPort-AV: E=Sophos;i="5.93,208,1654585200"; d="scan'208";a="661157798"
Received: from ideak-desk.fi.intel.com ([10.237.72.175])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2022 06:53:05 -0700
From: Imre Deak <imre.deak@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/amd/display: Fix static declaration follows
 non-static declaration compiler warn
Date: Mon,  1 Aug 2022 16:52:59 +0300
Message-Id: <20220801135259.3039679-3-imre.deak@intel.com>
X-Mailer: git-send-email 2.31.1.189.g2e36527f23
In-Reply-To: <20220801135259.3039679-1-imre.deak@intel.com>
References: <20220801135259.3039679-1-imre.deak@intel.com>
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
Cc: Alan Liu <HaoPing.Liu@amd.com>, intel-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the

drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:951:13: error: static declaration of ‘get_min_max_dc_plane_scaling’ follows non-static declaration
  951 | static void get_min_max_dc_plane_scaling(struct drm_device *dev,
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:36:
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.h:39:6: note: previous declaration of ‘get_min_max_dc_plane_scaling’ with type ‘void(struct drm_device *, struct drm_framebuffer *, int *, int *)’
   39 | void get_min_max_dc_plane_scaling(struct drm_device *dev,

complier warning.

Fixes: 5d945cbcd4b1 ("drm/amd/display: Create a file dedicated to planes")
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Harry Wentland <Harry.Wentland@amd.com>
Cc: Alan Liu <HaoPing.Liu@amd.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h
index 95168c2cfa6fa..eeeec391f4b53 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h
@@ -36,10 +36,6 @@ int fill_dc_scaling_info(struct amdgpu_device *adev,
 			 const struct drm_plane_state *state,
 			 struct dc_scaling_info *scaling_info);
 
-void get_min_max_dc_plane_scaling(struct drm_device *dev,
-				  struct drm_framebuffer *fb,
-				  int *min_downscale, int *max_upscale);
-
 int dm_plane_helper_check_state(struct drm_plane_state *state,
 				struct drm_crtc_state *new_crtc_state);
 
-- 
2.37.1

