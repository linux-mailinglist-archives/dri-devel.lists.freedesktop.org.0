Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 863C07DAF78
	for <lists+dri-devel@lfdr.de>; Sun, 29 Oct 2023 23:59:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AE3E10E1BC;
	Sun, 29 Oct 2023 22:59:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37C7710E1BC
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Oct 2023 22:59:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id F044DB8070D;
 Sun, 29 Oct 2023 22:59:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6318DC43215;
 Sun, 29 Oct 2023 22:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698620384;
 bh=9VVO23XBv1/53p3hEOS7qJI9D9yrBz97BEXcymii9WU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HQ36MqXAscITR62WS5mpXCAVdjJVjscpKK+HoeZAT7TDXNNlO/r4dqMXzI3sLi9JC
 aYEGaTKwZwdyogz/AXn3kKLvrWO3G/P63p8aO9azzJtcpUDGt2/Z/7Wv4mIdjzWI6h
 t0iWLGhZ4AYus0tR6KBwknXRbVc8e6akbYUK26RkMXhvFLtohxk8MppYwRw2aDkIn8
 pt7n64SBbZURXOsSwI4UBCvEel0u+piBO6sPosOa2UpFv+ItotfhirQeQPahWDZk1A
 sIPbEjB+98lrjFyaOZbJsNkwATEHgVh3+6C3jWQikIKg96MsgjnX1cPtHQQ+nyfR17
 odhCdIEQ/DoEQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 19/28] drm/ttm: Reorder sys manager cleanup step
Date: Sun, 29 Oct 2023 18:58:54 -0400
Message-ID: <20231029225916.791798-19-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231029225916.791798-1-sashal@kernel.org>
References: <20231029225916.791798-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.137
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
Cc: Sasha Levin <sashal@kernel.org>,
 Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org, ray.huang@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Karolina Stolarek <karolina.stolarek@intel.com>

[ Upstream commit 3b401e30c249849d803de6c332dad2a595a58658 ]

With the current cleanup flow, we could trigger a NULL pointer
dereference if there is a delayed destruction of a BO with a
system resource that gets executed on drain_workqueue() call,
as we attempt to free a resource using an already released
resource manager.

Remove the device from the device list and drain its workqueue
before releasing the system domain manager in ttm_device_fini().

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231016121525.2237838-1-karolina.stolarek@intel.com
Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/ttm/ttm_device.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index 2df59b3c2ea16..291cdd893fc50 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -234,10 +234,6 @@ void ttm_device_fini(struct ttm_device *bdev)
 	struct ttm_resource_manager *man;
 	unsigned i;
 
-	man = ttm_manager_type(bdev, TTM_PL_SYSTEM);
-	ttm_resource_manager_set_used(man, false);
-	ttm_set_driver_manager(bdev, TTM_PL_SYSTEM, NULL);
-
 	mutex_lock(&ttm_global_mutex);
 	list_del(&bdev->device_list);
 	mutex_unlock(&ttm_global_mutex);
@@ -247,6 +243,10 @@ void ttm_device_fini(struct ttm_device *bdev)
 	if (ttm_bo_delayed_delete(bdev, true))
 		pr_debug("Delayed destroy list was clean\n");
 
+	man = ttm_manager_type(bdev, TTM_PL_SYSTEM);
+	ttm_resource_manager_set_used(man, false);
+	ttm_set_driver_manager(bdev, TTM_PL_SYSTEM, NULL);
+
 	spin_lock(&bdev->lru_lock);
 	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
 		if (list_empty(&man->lru[0]))
-- 
2.42.0

