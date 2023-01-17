Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F7766E590
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 19:04:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F8B110E30F;
	Tue, 17 Jan 2023 18:04:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82C3810E30F;
 Tue, 17 Jan 2023 18:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673978689; x=1705514689;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OD7j79DRiTFV8ZWi8Id42iAqpnY4oi7w03hVQl4OcHs=;
 b=KRJA8sFFtiXfOMZfUmYZBM0f0lo1/5cORJO5Vf7qhiDdI+GPr2ljzbT6
 wJuV+Sm76jJp0CI6DJ0dgLoDPMy78VD8Q6Kzog1gqXcq6TP1Ic0V0Hh8O
 UUvZuIM0dIq3bJkRJlsGB1OS1hGcbP2gbIlNyUTlFCwbIGazAY52Jukbb
 jdObbGjRnotjFYdYG4lCf46lI2chEGRc/XSlbqi9XcU4kcEBmTLLvW1Z6
 5+vSblJF9lE4Jqsti6dXLtKZTnaQTosAMUTX7TKA8qBa4VsWQDkmRRDkE
 4liDjlubx+YnPMo9ZINT7zKmXi5RRTWTe+EGOEE4EIdSrHjxwCmJD/lre Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="387116359"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="387116359"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 10:04:48 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="659467378"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="659467378"
Received: from nirmoyda-desk.igk.intel.com ([10.102.42.231])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 10:04:47 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/radeon: Do not use deprecated drm log API
Date: Tue, 17 Jan 2023 19:04:16 +0100
Message-Id: <20230117180417.21066-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace deprecated DRM_DEBUG_KMS_RATELIMITED() and DRM_ERROR()
with proper APIs.

v2: replace pr_err with dev_err(Alex).

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/radeon/radeon_dp_auxch.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_dp_auxch.c b/drivers/gpu/drm/radeon/radeon_dp_auxch.c
index 69379b95146e..1e5b6baf76a1 100644
--- a/drivers/gpu/drm/radeon/radeon_dp_auxch.c
+++ b/drivers/gpu/drm/radeon/radeon_dp_auxch.c
@@ -158,7 +158,7 @@ radeon_dp_aux_transfer_native(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg
 	} while (retry_count++ < 1000);
 
 	if (retry_count >= 1000) {
-		DRM_ERROR("auxch hw never signalled completion, error %08x\n", tmp);
+		dev_err(rdev->dev, "auxch hw never signalled completion, error %08x\n", tmp);
 		ret = -EIO;
 		goto done;
 	}
@@ -168,8 +168,7 @@ radeon_dp_aux_transfer_native(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg
 		goto done;
 	}
 	if (tmp & AUX_RX_ERROR_FLAGS) {
-		DRM_DEBUG_KMS_RATELIMITED("dp_aux_ch flags not zero: %08x\n",
-					  tmp);
+		drm_dbg_kms_ratelimited(dev, "dp_aux_ch flags not zero: %08x\n", tmp);
 		ret = -EIO;
 		goto done;
 	}
-- 
2.39.0

