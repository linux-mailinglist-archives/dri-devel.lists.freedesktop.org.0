Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D38A886E92
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 15:30:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7EB91124F9;
	Fri, 22 Mar 2024 14:30:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YGxccnE2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6FD71124F6
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 14:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711117817; x=1742653817;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3GqT6SMaEuf0YJvA7Ay8H3rHqzm3N5W/1jC/lM0CHOo=;
 b=YGxccnE2rASXJTooUclTepKWvE+mnmhMNQ21BSJ+hcQPWFFTHfalO53f
 44P0xki1FcxB6iGhsi4Y5EPhr9YOgJNJqnXLcO963/WZ4oNlC3gAYHFMs
 FftAOItNDEaU1yFB1FvhZnO+jzr9bDY8ofIxZbMwIGbMER/tirQFDWBC1
 8Iu2653bQrr9f+Lze0OWg2xGiqk6LGGfiXbCcsdK9aIpSZnoJIfOEf84Z
 QHzUWkveGw0q0Xi6hKtNdMA7oul5d/Vwu94MiQoTJi08tVWXvUB+WSi40
 8erzzRlS0tTw+rqEnqAGxCoVPGXjusdwm7FrhxiI61QskH+JfB4qjbh6l A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6022829"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="6022829"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 07:30:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="19398561"
Received: from unknown (HELO kdrobnik-desk.toya.net.pl) ([10.245.245.72])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 07:30:15 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Amaranath Somalapuram <Amaranath.Somalapuram@amd.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>
Subject: [PATCH v10 9/9] drm/ttm/tests: Fix a warning in ttm_bo_unreserve_bulk
Date: Fri, 22 Mar 2024 15:29:58 +0100
Message-Id: <0d4f2d263d3feaa39bf1b428d2d42eb13f29ebd0.1711117249.git.karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1711117249.git.karolina.stolarek@intel.com>
References: <cover.1711117249.git.karolina.stolarek@intel.com>
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

BOs in a bulk move have to share the same reservation object. That is
not the case in the ttm_bo_unreserve_bulk subtest. Share bo2's resv
object with bo1 to fix the issue.

Fixes: 995279d280d1 ("drm/ttm/tests: Add tests for ttm_bo functions")
Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
index 1f8a4f8adc92..632306adc4a1 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
@@ -339,6 +339,9 @@ static void ttm_bo_unreserve_bulk(struct kunit *test)
 	bo1 = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
 	bo2 = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
 
+	/* Share the reservation object in the same bulk move */
+	bo1->base.resv = bo2->base.resv;
+
 	dma_resv_lock(bo1->base.resv, NULL);
 	ttm_bo_set_bulk_move(bo1, &lru_bulk_move);
 	dma_resv_unlock(bo1->base.resv);
-- 
2.34.1

