Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3263B79A81E
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 15:03:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F60A10E2E9;
	Mon, 11 Sep 2023 13:03:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14A5810E2E6;
 Mon, 11 Sep 2023 13:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694437428; x=1725973428;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Cyr9Q5z4LCsDejmv3CjtoMx8Wt7sLQSBTEfCkI3hPS0=;
 b=n08kAYAqryyyG5VF8WAJfL6jn8WHzaHfF/bQ0SjlTV+otH0Y5q5mBwLf
 ElRTq0l2Lp/xa2p8GfU/kbVp1TYyxw6YgkF/KheP6OuCX9Tw1dyZt96MP
 AhsVsXkDM3RPMluoIpofbikV15IPBIAjLAyvHCivroX/sGgELmc35Nuax
 v+3+FjWQo8C1FvVze2vWroC0P1jwNbV0kMQAB+ezPuoK8/Q7gmIRQyNaG
 appFoY8jehw+SMucT0KgCJ0LKjrPzFlin/OCykhvg1LEAl+Hmly6SWzRR
 1Qo3lAto+JRz5Fg9lPpBqJCwtakEcieOUyHz3b1ANcY7iB6jq78v2zPKm A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="464448218"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="464448218"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 06:03:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="778382303"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="778382303"
Received: from ppawlows-mobl.ger.corp.intel.com (HELO jkrzyszt-mobl2.intranet)
 ([10.213.28.208])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 06:03:43 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/tests: Fix incorrect argument in drm_test_mm_insert_range
Date: Mon, 11 Sep 2023 15:03:24 +0200
Message-ID: <20230911130323.7037-2-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.41.0
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
Cc: Daniel Latypov <dlatypov@google.com>,
 Javier Martinez Canillas <javierm@redhat.com>, intel-xe@lists.freedesktop.org,
 igt-dev@lists.freedesktop.org,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 intel-gfx@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While drm_mm test was converted form igt selftest to kunit, unexpected
value of "end" argument equal "start" was introduced to one of calls to a
function that executes the drm_test_mm_insert_range for specific start/end
pair of arguments.  As a consequence, DRM_MM_BUG_ON(end <= start) is
triggered.  Fix it by restoring the original value.

Fixes: fc8d29e298cf ("drm: selftest: convert drm_mm selftest to KUnit")
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: "Maíra Canal" <mairacanal@riseup.net>
Cc: Arthur Grillo <arthurgrillo@riseup.net>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Daniel Latypov <dlatypov@google.com>
Cc: stable@vger.kernel.org # v6.1+
---
 drivers/gpu/drm/tests/drm_mm_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tests/drm_mm_test.c b/drivers/gpu/drm/tests/drm_mm_test.c
index 186b28dc70380..05d5e7af6d250 100644
--- a/drivers/gpu/drm/tests/drm_mm_test.c
+++ b/drivers/gpu/drm/tests/drm_mm_test.c
@@ -939,7 +939,7 @@ static void drm_test_mm_insert_range(struct kunit *test)
 		KUNIT_ASSERT_FALSE(test, __drm_test_mm_insert_range(test, count, size, 0, max - 1));
 		KUNIT_ASSERT_FALSE(test, __drm_test_mm_insert_range(test, count, size, 0, max / 2));
 		KUNIT_ASSERT_FALSE(test, __drm_test_mm_insert_range(test, count, size,
-								    max / 2, max / 2));
+								    max / 2, max));
 		KUNIT_ASSERT_FALSE(test, __drm_test_mm_insert_range(test, count, size,
 								    max / 4 + 1, 3 * max / 4 - 1));
 
-- 
2.41.0

