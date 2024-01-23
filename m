Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DCC8385F0
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 04:12:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6407510E11C;
	Tue, 23 Jan 2024 03:12:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C59B10E0DE;
 Tue, 23 Jan 2024 03:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705979556; x=1737515556;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rcmKudlwgYEtUeaWD1JT7tYyHOWeA+zwYXmNsT1MkmU=;
 b=i4Ue8PuhzJLjOysTFOhW7b96JBO/SbLXqATGFkhrNMQRYCcVXJtUR2Is
 qKel0KHb0YUNX1fqXWcSStKKKHF/NPYgxyjy1McWpMfiHkgz+hnLRdJfk
 74+JNu9LiQPMTSc9AtEbBEXR/w+46Q7HAiRi+E01r+BPoUH74gdIHjzp5
 odEjNJjx3oO2mF90ysBeDaZjGPXN1yCCAj21+ka4s2JmKG9c/Q9ymUTaG
 UxT5lX+AKNJ9cq9O1dvhehqL8OMjiqK4ImVTxcPdSqz30qoDmfQAMtryj
 tqoUMX2KEqsFSTZU9hQ/2hOOf5BnrfRv+qxWrvI99PvuWubjfMrGqvZS0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="1255915"
X-IronPort-AV: E=Sophos;i="6.05,213,1701158400"; 
   d="scan'208";a="1255915"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 19:12:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="819940808"
X-IronPort-AV: E=Sophos;i="6.05,213,1701158400"; d="scan'208";a="819940808"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 19:12:35 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Remove PVC from xe_wa kunit tests
Date: Mon, 22 Jan 2024 19:12:42 -0800
Message-ID: <20240123031242.3548724-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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
Cc: thomas.hellstrom@linux.intel.com, ogabbay@kernel.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since the PCI IDs for PVC were added to the xe driver, the xe_wa tests
should not try to create a fake PVC device since they can't find
the right PCI ID. Fix bugs when running kunit:

	# xe_wa_gt: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_wa_test.c:111
	Expected ret == 0, but
	    ret == -19 (0xffffffffffffffed)
	[FAILED] PVC (B0)
	# xe_wa_gt: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_wa_test.c:111
	Expected ret == 0, but
	    ret == -19 (0xffffffffffffffed)
	[FAILED] PVC (B1)
	# xe_wa_gt: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_wa_test.c:111
	Expected ret == 0, but
	    ret == -19 (0xffffffffffffffed)
	[FAILED] PVC (C0)

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_wa_test.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
index 439477593faf..44570d888355 100644
--- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
@@ -69,9 +69,6 @@ static const struct platform_test_case cases[] = {
 	SUBPLATFORM_CASE(DG2, G10, C0),
 	SUBPLATFORM_CASE(DG2, G11, B1),
 	SUBPLATFORM_CASE(DG2, G12, A1),
-	PLATFORM_CASE(PVC, B0),
-	PLATFORM_CASE(PVC, B1),
-	PLATFORM_CASE(PVC, C0),
 	GMDID_CASE(METEORLAKE, 1270, A0, 1300, A0),
 	GMDID_CASE(METEORLAKE, 1271, A0, 1300, A0),
 	GMDID_CASE(LUNARLAKE, 2004, A0, 2000, A0),
-- 
2.43.0

