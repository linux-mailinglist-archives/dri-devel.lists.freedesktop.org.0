Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2587CA7CF
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 14:15:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49CFB10E1C0;
	Mon, 16 Oct 2023 12:15:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE1510E1BE
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 12:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697458535; x=1728994535;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7jUIajyaTVuSjMNVLzuWM7VhcDkz0a+zgbRPYBVGi+Y=;
 b=iOeDTVoEQswjsVMwY3KvYfmdus1fDeq4t24E7OW5cYFvwfaCGx8ODc0d
 PpddfSVO4FmGCZOV2CRzpL3wEFjQ9Kwlge1M+cLU8mFAPuJ5xG23h5z4p
 QClnd9DsDwn+53HT0gXhDG3+uDgrU1M5HejRmqwzdQtYSC8zcRhHUWr9Z
 q0F2XgEsd0j6Oe/76W4tSL1FgDFaHjOWNCm8yNglupmtxKRgQq7bJOSnN
 /DYxPvZUDJaKPrGShWgaRZ31hGToBtl7tQ/jmBizVr2EIerHrAKOxSlJP
 /kf6wIfn3+/UfXrHIkNP9PdbuUrDcCSJL6JGP74qjlnp6heiX2BqLjlxX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="382732971"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="382732971"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 05:15:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="821545588"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="821545588"
Received: from gsawicki-mobl1.ger.corp.intel.com (HELO
 kdrobnik-desk.intel.com) ([10.213.0.246])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 05:15:34 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: Reorder sys manager cleanup step
Date: Mon, 16 Oct 2023 14:15:25 +0200
Message-Id: <20231016121525.2237838-1-karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Karolina Stolarek <karolina.stolarek@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With the current cleanup flow, we could trigger a NULL pointer
dereference if there is a delayed destruction of a BO with a
system resource that gets executed on drain_workqueue() call,
as we attempt to free a resource using an already released
resource manager.

Remove the device from the device list and drain its workqueue
before releasing the system domain manager in ttm_device_fini().

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
This is actually a reiteration of a patch sent in [1], but the
solution and commit message changed significantly, so I decided
not to send it as v2.
[1] - 20231013143423.1503088-1-karolina.stolarek@intel.com

 drivers/gpu/drm/ttm/ttm_device.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index 7726a72befc5..d48b39132b32 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -232,10 +232,6 @@ void ttm_device_fini(struct ttm_device *bdev)
 	struct ttm_resource_manager *man;
 	unsigned i;
 
-	man = ttm_manager_type(bdev, TTM_PL_SYSTEM);
-	ttm_resource_manager_set_used(man, false);
-	ttm_set_driver_manager(bdev, TTM_PL_SYSTEM, NULL);
-
 	mutex_lock(&ttm_global_mutex);
 	list_del(&bdev->device_list);
 	mutex_unlock(&ttm_global_mutex);
@@ -243,6 +239,10 @@ void ttm_device_fini(struct ttm_device *bdev)
 	drain_workqueue(bdev->wq);
 	destroy_workqueue(bdev->wq);
 
+	man = ttm_manager_type(bdev, TTM_PL_SYSTEM);
+	ttm_resource_manager_set_used(man, false);
+	ttm_set_driver_manager(bdev, TTM_PL_SYSTEM, NULL);
+
 	spin_lock(&bdev->lru_lock);
 	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
 		if (list_empty(&man->lru[0]))
-- 
2.25.1

