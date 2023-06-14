Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B0E72F267
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 04:04:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FB1D10E098;
	Wed, 14 Jun 2023 02:04:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-124.freemail.mail.aliyun.com
 (out30-124.freemail.mail.aliyun.com [115.124.30.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59D0B10E098;
 Wed, 14 Jun 2023 02:04:45 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R151e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045170;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=11; SR=0;
 TI=SMTPD_---0Vl4KJRo_1686708273; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0Vl4KJRo_1686708273) by smtp.aliyun-inc.com;
 Wed, 14 Jun 2023 10:04:40 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: Felix.Kuehling@amd.com
Subject: [PATCH] drm/amdkfd: Switch over to memdup_user()
Date: Wed, 14 Jun 2023 10:04:32 +0800
Message-Id: <20230614020432.44044-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Xinhui.Pan@amd.com,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use memdup_user() rather than duplicating its implementation. This is a
little bit restricted to reduce false positives.

./drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c:2813:13-20: WARNING opportunity for memdup_user.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=5523
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index d6b15493fffd..637962d4083c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -2810,12 +2810,9 @@ static uint32_t *get_queue_ids(uint32_t num_queues, uint32_t *usr_queue_id_array
 	if (!usr_queue_id_array)
 		return NULL;
 
-	queue_ids = kzalloc(array_size, GFP_KERNEL);
-	if (!queue_ids)
-		return ERR_PTR(-ENOMEM);
-
-	if (copy_from_user(queue_ids, usr_queue_id_array, array_size))
-		return ERR_PTR(-EFAULT);
+	queue_ids = memdup_user(usr_queue_id_array, array_size);
+	if (IS_ERR(queue_ids))
+		return PTR_ERR(queue_ids);
 
 	return queue_ids;
 }
-- 
2.20.1.7.g153144c

