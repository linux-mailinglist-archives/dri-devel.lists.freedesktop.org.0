Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE7260A654
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 14:34:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01DA710E490;
	Mon, 24 Oct 2022 12:34:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4CCD10E443;
 Mon, 24 Oct 2022 12:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666614845; x=1698150845;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fBzePSudItjjbOwIjzBK3a/c9M5JFhtRr9O6E/OG6I8=;
 b=kH3uYFpMKlw2N242f35rzUSstjJq7Etm8/OV7Hb9BPqKjsQLhVthv9It
 j2RwdcYCAIhEy48iI0VGThPSYihG4P2kfk4EXwmvQSb7Pg5Q2XKGOiXEb
 yt95U0roUC3yp6f3zft1/L1V4htjjWRA/l3rv2ypXnxpzec9kYe7CU5k3
 CnT//5uZMrO0p6GDgDxUd6guDWfN2ozz7ziQodye3fk+1VxXifbJpgKWM
 xBeDjymeLigi6V/llw6zEyqVbumeBB0eJvg1Lg8Z4P/+kbhYunnJXaoMo
 isIcPdE342y+hoRIP3usPxMWzbRgyWj8gnIRvr5S3YtHPR6M1PXUHiDCS Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10509"; a="333989462"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="333989462"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 05:34:04 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10509"; a="876418659"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="876418659"
Received: from emontau-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.52.221])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 05:34:02 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 03/16] drm/amd/display: stop using connector->override_edid
Date: Mon, 24 Oct 2022 15:33:31 +0300
Message-Id: <c901869ff8a4e3aebc4abec99c7dd7b4c224f6e6.1666614699.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1666614699.git.jani.nikula@intel.com>
References: <cover.1666614699.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 Xinhui Pan <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The connector->override_edid flag is strictly for EDID override debugfs
management, and drivers have no business using it.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Xinhui Pan <Xinhui.Pan@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Acked-by: Alex Deucher <alexdeucher@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 0db2a88cd4d7..3c072754738d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6108,7 +6108,6 @@ static void create_eml_sink(struct amdgpu_dm_connector *aconnector)
 				aconnector->base.name);
 
 		aconnector->base.force = DRM_FORCE_OFF;
-		aconnector->base.override_edid = false;
 		return;
 	}
 
@@ -6143,8 +6142,6 @@ static void handle_edid_mgmt(struct amdgpu_dm_connector *aconnector)
 		link->verified_link_cap.link_rate = LINK_RATE_HIGH2;
 	}
 
-
-	aconnector->base.override_edid = true;
 	create_eml_sink(aconnector);
 }
 
-- 
2.34.1

