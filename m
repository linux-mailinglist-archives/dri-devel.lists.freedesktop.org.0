Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB7A5FB3C6
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 15:50:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C535410E806;
	Tue, 11 Oct 2022 13:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 519EF10E5C2;
 Tue, 11 Oct 2022 13:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665496220; x=1697032220;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sk4Ro592J8JB79hfrw0B4b6IJkogkXUF/Z2L3LTOxp4=;
 b=cjwSRScvrGwmzJDXsLZCCPHLc1ieLAgup0znWV2RUprhUYEvDWZZYHmW
 RnDA3dVXduZwbw3QOheQVQaO23+UD6ldVAzpEhKPKrdBx1HuOTZ3wraJE
 iwOOvAGCnAKSkio3V7tUGZPKjTPtsrLTMEZIBwBOKRgCkd+/9TPqSzpLs
 ikgTEyjhcPcisE4Qb4CmaKK/1/5NhlY7SBTpyCcjTo93c1KbQ1BTYOlDE
 cOOronRI5DaCRCOPYsHEZXSsM1I2eMsXHLaCxJj0hrieRb7Z81jmUyTIA
 gFSSQsaoyoZDLgRNJeGqkJdJpKNe65i+Xa4v85ZNjYSE5murQzUinXcDC g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="303244760"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="303244760"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 06:50:19 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="871510048"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="871510048"
Received: from milawils-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.40.183])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 06:50:06 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 03/15] drm/amd/display: stop using connector->override_edid
Date: Tue, 11 Oct 2022 16:49:37 +0300
Message-Id: <8620697ae6a13bb9202db9edbc26ff30d9f4e2e8.1665496046.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1665496046.git.jani.nikula@intel.com>
References: <cover.1665496046.git.jani.nikula@intel.com>
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

---

I really have no idea what the functional impact here is. I can only
guess that the intention is to abuse ->override_edid to block EDID
property updates. In any case, this use needs to go.

It also seems really curious we get here via connector .get_modes hook!
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 4c73727e0b7d..d96877196a7f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6109,7 +6109,6 @@ static void create_eml_sink(struct amdgpu_dm_connector *aconnector)
 				aconnector->base.name);
 
 		aconnector->base.force = DRM_FORCE_OFF;
-		aconnector->base.override_edid = false;
 		return;
 	}
 
@@ -6144,8 +6143,6 @@ static void handle_edid_mgmt(struct amdgpu_dm_connector *aconnector)
 		link->verified_link_cap.link_rate = LINK_RATE_HIGH2;
 	}
 
-
-	aconnector->base.override_edid = true;
 	create_eml_sink(aconnector);
 }
 
-- 
2.34.1

