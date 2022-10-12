Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1591C5FC598
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 14:48:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF68910E076;
	Wed, 12 Oct 2022 12:48:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DBEF10E076
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Oct 2022 12:48:32 +0000 (UTC)
Received: from kwepemi500024.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MnXRx4vn3zpVbB;
 Wed, 12 Oct 2022 20:45:17 +0800 (CST)
Received: from huawei.com (10.175.103.91) by kwepemi500024.china.huawei.com
 (7.221.188.100) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 12 Oct
 2022 20:48:28 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <christian.koenig@amd.com>, <ray.huang@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>
Subject: [PATCH] drm/ttm: Remove unnecessary drm_mm_clean
Date: Wed, 12 Oct 2022 20:47:35 +0800
Message-ID: <20221012124735.1702700-1-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500024.china.huawei.com (7.221.188.100)
X-CFilter-Loop: Reflected
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
Cc: zengheng4@huawei.com, liwei391@huawei.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove unnecessary `drm_mm_clean` calling in
`ttm_range_man_fini_nocheck`, due to effective
check is already included in the following
`drm_mm_takedown`.

Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 drivers/gpu/drm/ttm/ttm_range_manager.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
index 4cfef2b3514d..f7c16c46cfbc 100644
--- a/drivers/gpu/drm/ttm/ttm_range_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
@@ -229,7 +229,6 @@ int ttm_range_man_fini_nocheck(struct ttm_device *bdev,
 		return ret;
 
 	spin_lock(&rman->lock);
-	drm_mm_clean(mm);
 	drm_mm_takedown(mm);
 	spin_unlock(&rman->lock);
 
-- 
2.25.1

