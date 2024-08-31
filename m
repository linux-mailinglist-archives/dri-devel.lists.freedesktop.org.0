Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CF49670CA
	for <lists+dri-devel@lfdr.de>; Sat, 31 Aug 2024 12:22:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EC9410E0F3;
	Sat, 31 Aug 2024 10:22:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 997B010E0D9
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Aug 2024 10:22:38 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.174])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WwrfD2SlPzyQxW;
 Sat, 31 Aug 2024 18:21:40 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
 by mail.maildlp.com (Postfix) with ESMTPS id B52B61400FD;
 Sat, 31 Aug 2024 18:22:32 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 31 Aug
 2024 18:22:32 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <frank.binns@imgtec.com>, <matt.coster@imgtec.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next] drm/imagination: Use memdup_user() helper
Date: Sat, 31 Aug 2024 18:30:47 +0800
Message-ID: <20240831103047.99499-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemh500013.china.huawei.com (7.202.181.146)
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

Switching to memdup_user(), which combines kmalloc() and copy_from_user(),
and it can simplfy code.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/gpu/drm/imagination/pvr_context.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_context.c b/drivers/gpu/drm/imagination/pvr_context.c
index eded5e955cc0..e75fd50a4d9f 100644
--- a/drivers/gpu/drm/imagination/pvr_context.c
+++ b/drivers/gpu/drm/imagination/pvr_context.c
@@ -69,27 +69,19 @@ process_static_context_state(struct pvr_device *pvr_dev, const struct pvr_stream
 	void *stream;
 	int err;
 
-	stream = kzalloc(stream_size, GFP_KERNEL);
-	if (!stream)
-		return -ENOMEM;
-
-	if (copy_from_user(stream, u64_to_user_ptr(stream_user_ptr), stream_size)) {
-		err = -EFAULT;
-		goto err_free;
-	}
+	stream = memdup_user(u64_to_user_ptr(stream_user_ptr), stream_size);
+	if (IS_ERR(stream))
+		return PTR_ERR(stream);
 
 	err = pvr_stream_process(pvr_dev, cmd_defs, stream, stream_size, dest);
-	if (err)
-		goto err_free;
+	if (err) {
+		kfree(stream);
+		return err;
+	}
 
 	kfree(stream);
 
 	return 0;
-
-err_free:
-	kfree(stream);
-
-	return err;
 }
 
 static int init_render_fw_objs(struct pvr_context *ctx,
-- 
2.34.1

