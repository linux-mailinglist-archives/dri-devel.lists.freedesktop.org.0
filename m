Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFFC51AFB0
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 22:48:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8857410E6C0;
	Wed,  4 May 2022 20:48:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22A0110E6A7;
 Wed,  4 May 2022 20:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651697309; x=1683233309;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XVg2AznuAxW2bJu7oavovOYirsVCyDgPm1+rn8018CE=;
 b=jGuNGSpuHe1SDervADfmp8Hy2hX/NGc0pbpXAQKrcFymwxslFKVpapG/
 WrJoJ3C8a0HXDuFbeeGmAnLUHl795q0uv//tTB/wmOdBb6mKgZ7Ir9Zcn
 21SCFhX9JhOQ3xK1PKVmtpVgpzikcryD4sHgR90P1P9w4sBrUAmNabgmm
 UDnVrSk4Y8+ztzpOLVdS/YrvIlQCW8sBCBvT7NFuSdS/x3/Ig0+YeeoJ0
 479nCfSXN9YYfPnCKvcUpGoFLK8JwvpLgNyaDzlFJwWn4Gufe1XcCGIlp
 jSb4VRKJ3c30RGEgrBgc/ty46lSUbyCvVpV60SbyjgkPcvfbMlnS7YlAf A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10337"; a="267489087"
X-IronPort-AV: E=Sophos;i="5.91,199,1647327600"; d="scan'208";a="267489087"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 13:48:28 -0700
X-IronPort-AV: E=Sophos;i="5.91,199,1647327600"; d="scan'208";a="811292740"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 13:48:28 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 1/4] drm/i915/huc: drop intel_huc_is_authenticated
Date: Wed,  4 May 2022 13:48:13 -0700
Message-Id: <20220504204816.2082588-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504204816.2082588-1-daniele.ceraolospurio@intel.com>
References: <20220504204816.2082588-1-daniele.ceraolospurio@intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The fuction name is confusing, because it doesn't check the actual auth
status in HW but the SW status. Given that there is only one user (the
huc_auth function itself), just get rid of it and use the FW status
checker directly.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_huc.c | 2 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc.h | 5 -----
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
index 556829de9c172..7b759b99cf3c8 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
@@ -96,7 +96,7 @@ int intel_huc_auth(struct intel_huc *huc)
 	struct intel_guc *guc = &gt->uc.guc;
 	int ret;
 
-	GEM_BUG_ON(intel_huc_is_authenticated(huc));
+	GEM_BUG_ON(intel_uc_fw_is_running(&huc->fw));
 
 	if (!intel_uc_fw_is_loaded(&huc->fw))
 		return -ENOEXEC;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.h b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
index 73ec670800f2b..77d813840d76c 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
@@ -50,11 +50,6 @@ static inline bool intel_huc_is_used(struct intel_huc *huc)
 	return intel_uc_fw_is_available(&huc->fw);
 }
 
-static inline bool intel_huc_is_authenticated(struct intel_huc *huc)
-{
-	return intel_uc_fw_is_running(&huc->fw);
-}
-
 void intel_huc_load_status(struct intel_huc *huc, struct drm_printer *p);
 
 #endif
-- 
2.25.1

