Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C06798AD71
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 21:53:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C2310E589;
	Mon, 30 Sep 2024 19:53:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a8YeRpgi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB0410E57D
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 19:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727726026; x=1759262026;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ox2AeQMafJDQ/CZHgNfAnZ6ThWUCm0smA6m5832K804=;
 b=a8YeRpgifI7Dg5EPxOWRPMEBJyZ1ASHrt5yub1eToXfuqpFStPxzZ3jQ
 Sntv66YvbW3GH9ZAFt4Uy1V77X0SEpANT/J6SesEEM2qQMPVwoBzcHYTD
 vG70/GEMjwwJhv7lQcF3NC94XUfWGtqAETCfG7DkhK4DUyfq7RGDZN/2c
 lnVHGiFp+OAFG81SaKO1j/6tQqUAwkueA4fNZlTD/iSYX4lFVqCZde2/B
 NnxQTO7qNrk4EQW3XWYJtkKggtv7N5AxAWh0yJZl7NiA3/6Tc3SQfOrFZ
 QVaXhGPZ8nSAnccv1dRras/3k2y/7foHBUTKICXgSYOVndjW9FfdYPLyZ g==;
X-CSE-ConnectionGUID: 2iMHyc1bSZSfNmNOHMsObg==
X-CSE-MsgGUID: ZeDEiM3ARii0scxTOLaJ6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26962326"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="26962326"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:53:46 -0700
X-CSE-ConnectionGUID: VMmRUwkaQiyUrc9rek96yQ==
X-CSE-MsgGUID: 5jiy7PNVQSyDrBKnbyF7+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="73370055"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:53:44 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Karol Wachowski <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH v2 13/31] accel/ivpu: Remove 1-tile power up Simics workaround
Date: Mon, 30 Sep 2024 21:53:04 +0200
Message-ID: <20240930195322.461209-14-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240930195322.461209-1-jacek.lawrynowicz@linux.intel.com>
References: <20240930195322.461209-1-jacek.lawrynowicz@linux.intel.com>
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
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
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

