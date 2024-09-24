Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C24984037
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 10:18:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA39410E66D;
	Tue, 24 Sep 2024 08:18:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fTA8e1oH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B814310E65E
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 08:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727165911; x=1758701911;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S+3SYu8ttPbWQhoheMPV5iIpMNFZilPlIfkrLc1G5O4=;
 b=fTA8e1oHH+d3CMz/wvcbg5ZMrOsMnzHP/Y8Qd+fl5jMk85vzeO2mk53T
 8b0CNClxG8fLo/4x7G3N5mxlCTGDv1gWG6djcfbbgBM6ehMARPdNppswe
 husV2IyrMX7pP0DbQ4ooWKgetCP2qy5KgG3KIpP9zrco9DYrH09mo/cVE
 oDG85mBE6Qi/xFnhwJBcEsYRtY39CwqGnLI4Tj5iq8qCFlrxvzaTuQa8z
 oACI1FFL+otuAM2k/YYg0XeeBvazLmocuSWNEF1Vrg8aIH2gCw3L170Ld
 zSymQygj3HE7zDTo3Zbm8kRrwEtH3G/bvKyPxXj3VeMwBonxqAhzXx08k w==;
X-CSE-ConnectionGUID: kPgrFFTgQCaUo88x5hTFvw==
X-CSE-MsgGUID: LDYKapT8Q6GKDOFhM2PYlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="37506932"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="37506932"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:18:30 -0700
X-CSE-ConnectionGUID: 6XWNnl4pQCuXznww0eIPFA==
X-CSE-MsgGUID: QsodjQAfSFOONFthVwbsBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="102170690"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:18:29 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Karol Wachowski <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 11/29] accel/ivpu: Remove 1-tile power up Simics workaround
Date: Tue, 24 Sep 2024 10:17:36 +0200
Message-ID: <20240924081754.209728-12-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
References: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
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

From: Karol Wachowski <karol.wachowski@intel.com>

Previously Simics was not providing workpoint for configurations
with 0 tiles enabled, that had to be worked around in the KMD.
This got fixed in Simics and workaround is no longer needed.

Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_hw_btrs.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_hw_btrs.c b/drivers/accel/ivpu/ivpu_hw_btrs.c
index 745e5248803da..cad2ce7f2e244 100644
--- a/drivers/accel/ivpu/ivpu_hw_btrs.c
+++ b/drivers/accel/ivpu/ivpu_hw_btrs.c
@@ -315,10 +315,6 @@ static void prepare_wp_request(struct ivpu_device *vdev, struct wp_request *wp,
 		wp->cdyn = enable ? PLL_CDYN_DEFAULT : 0;
 		wp->epp = enable ? PLL_EPP_DEFAULT : 0;
 	}
-
-	/* Simics cannot start without at least one tile */
-	if (enable && ivpu_is_simics(vdev))
-		wp->cfg = 1;
 }
 
 static int wait_for_pll_lock(struct ivpu_device *vdev, bool enable)
-- 
2.45.1

