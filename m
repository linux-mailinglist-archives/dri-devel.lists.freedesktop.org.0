Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CE29670C7
	for <lists+dri-devel@lfdr.de>; Sat, 31 Aug 2024 12:21:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E204210E0D8;
	Sat, 31 Aug 2024 10:21:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64FC210E0D8
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Aug 2024 10:21:21 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.44])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4WwrX83Yt6z20nBR;
 Sat, 31 Aug 2024 18:16:24 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
 by mail.maildlp.com (Postfix) with ESMTPS id 247B81400D7;
 Sat, 31 Aug 2024 18:21:17 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 31 Aug
 2024 18:21:16 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <frank.binns@imgtec.com>, <matt.coster@imgtec.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next] drm/imagination: Use memdup_user() helper to simplify
 code
Date: Sat, 31 Aug 2024 18:29:30 +0800
Message-ID: <20240831102930.97502-1-ruanjinjie@huawei.com>
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
 drivers/gpu/drm/imagination/pvr_job.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_job.c b/drivers/gpu/drm/imagination/pvr_job.c
index 78c2f3c6dce0..618503a212a7 100644
--- a/drivers/gpu/drm/imagination/pvr_job.c
+++ b/drivers/gpu/drm/imagination/pvr_job.c
@@ -90,20 +90,13 @@ static int pvr_fw_cmd_init(struct pvr_device *pvr_dev, struct pvr_job *job,
 	void *stream;
 	int err;
 
-	stream = kzalloc(stream_len, GFP_KERNEL);
-	if (!stream)
-		return -ENOMEM;
-
-	if (copy_from_user(stream, u64_to_user_ptr(stream_userptr), stream_len)) {
-		err = -EFAULT;
-		goto err_free_stream;
-	}
+	stream = memdup_user(u64_to_user_ptr(stream_userptr), stream_len);
+	if (IS_ERR(stream))
+		return PTR_ERR(stream);
 
 	err = pvr_job_process_stream(pvr_dev, stream_def, stream, stream_len, job);
 
-err_free_stream:
 	kfree(stream);
-
 	return err;
 }
 
-- 
2.34.1

