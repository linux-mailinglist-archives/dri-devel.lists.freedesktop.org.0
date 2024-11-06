Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DA79BDB4D
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 02:41:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE22D10E185;
	Wed,  6 Nov 2024 01:40:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F4410E185;
 Wed,  6 Nov 2024 01:40:57 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.252])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Xjnsl0cV2z10PcB;
 Wed,  6 Nov 2024 09:38:35 +0800 (CST)
Received: from dggpeml500024.china.huawei.com (unknown [7.185.36.10])
 by mail.maildlp.com (Postfix) with ESMTPS id D4AE3180AEB;
 Wed,  6 Nov 2024 09:40:54 +0800 (CST)
Received: from huawei.com (10.175.112.208) by dggpeml500024.china.huawei.com
 (7.185.36.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 6 Nov
 2024 09:40:54 +0800
From: Yuan Can <yuancan@huawei.com>
To: <Felix.Kuehling@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <mukul.joshi@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
CC: <yuancan@huawei.com>
Subject: [PATCH] drm/amdkfd: Fix wrong usage of INIT_WORK()
Date: Wed, 6 Nov 2024 09:35:41 +0800
Message-ID: <20241106013541.77666-1-yuancan@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500024.china.huawei.com (7.185.36.10)
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

In kfd_procfs_show(), the sdma_activity_work_handler is a local variable
and the sdma_activity_work_handler.sdma_activity_work should initialize
with INIT_WORK_ONSTACK() instead of INIT_WORK().

Fixes: 32cb59f31362 ("drm/amdkfd: Track SDMA utilization per process")
Signed-off-by: Yuan Can <yuancan@huawei.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index d4aa843aacfd..2792015f1054 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -338,8 +338,8 @@ static ssize_t kfd_procfs_show(struct kobject *kobj, struct attribute *attr,
 							      attr_sdma);
 		struct kfd_sdma_activity_handler_workarea sdma_activity_work_handler;
 
-		INIT_WORK(&sdma_activity_work_handler.sdma_activity_work,
-					kfd_sdma_activity_worker);
+		INIT_WORK_ONSTACK(&sdma_activity_work_handler.sdma_activity_work,
+				  kfd_sdma_activity_worker);
 
 		sdma_activity_work_handler.pdd = pdd;
 		sdma_activity_work_handler.sdma_activity_counter = 0;
@@ -347,6 +347,7 @@ static ssize_t kfd_procfs_show(struct kobject *kobj, struct attribute *attr,
 		schedule_work(&sdma_activity_work_handler.sdma_activity_work);
 
 		flush_work(&sdma_activity_work_handler.sdma_activity_work);
+		destroy_work_on_stack(&sdma_activity_work_handler.sdma_activity_work);
 
 		return snprintf(buffer, PAGE_SIZE, "%llu\n",
 				(sdma_activity_work_handler.sdma_activity_counter)/
-- 
2.17.1

