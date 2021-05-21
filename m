Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC9038BD6E
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 06:27:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C2A96F5B3;
	Fri, 21 May 2021 04:27:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C3406F5B3;
 Fri, 21 May 2021 04:27:30 +0000 (UTC)
IronPort-SDR: nRrpRDt1O57pRC51y9NAk0bkmmuhFydiZQ3RtlvTPM2hN3ntECLh2nYY9fovZ9924HSNULOd3S
 pnx9BZzr46KQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9990"; a="188799335"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="188799335"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2021 21:27:28 -0700
IronPort-SDR: AQoLjDWJpgm/xvCt7WvT5Do/3WsrfQkJe+WBGsdLV9SpctwUIbQtCCQMS79asqDwnspgvCSBpO
 i7vX9U/r+vJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="395173514"
Received: from vsrini4-xps-8920.iind.intel.com (HELO localhost.localdomain)
 ([10.223.163.28])
 by orsmga003.jf.intel.com with ESMTP; 20 May 2021 21:27:26 -0700
From: Vidya Srinivas <vidya.srinivas@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/drm_read: drm_read fails for subtest
 invalid-buffer on chrome
Date: Fri, 21 May 2021 09:48:44 +0530
Message-Id: <1621570724-24132-1-git-send-email-vidya.srinivas@intel.com>
X-Mailer: git-send-email 2.7.4
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
Cc: markyacoub@chromium.org, Charlton.Lin@intel.com,
 Vidya Srinivas <vidya.srinivas@intel.com>, khaled.almahallawy@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Chrome platforms is unable to handle reading from -1.
It terminates the test after reporting buffer overflow.
Hence, changed the address for invalid buffer to NULL instead of -1.
With this change, errno becomes EINTR when reading from NULL
location. To accomodate, also changing the check of errno to EINTR
instead of EFAULT

Change-Id: I5f844af087c9826fcbcfbe301f0df5f727cb013b
Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
---
 tests/drm_read.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/drm_read.c b/tests/drm_read.c
index ccf9d822fd8d..a8816bc1e587 100644
--- a/tests/drm_read.c
+++ b/tests/drm_read.c
@@ -106,8 +106,8 @@ static void test_invalid_buffer(int in)
 
 	alarm(1);
 
-	igt_assert_eq(read(fd, (void *)-1, 4096), -1);
-	igt_assert_eq(errno, EFAULT);
+	igt_assert_eq(read(fd, (void *)NULL, 4096), -1);
+	igt_assert_eq(errno, EINTR);
 
 	teardown(fd);
 }
-- 
2.7.4

