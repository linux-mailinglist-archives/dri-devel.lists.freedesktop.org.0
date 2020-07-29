Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F38FD232C4C
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 09:16:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99E9B6E865;
	Thu, 30 Jul 2020 07:16:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 511D86E560
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 15:49:26 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 947B91F0596D060985ED;
 Wed, 29 Jul 2020 23:49:20 +0800 (CST)
Received: from kernelci-master.huawei.com (10.175.101.6) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Wed, 29 Jul 2020 23:49:13 +0800
From: Wei Yongjun <weiyongjun1@huawei.com>
To: Hulk Robot <hulkci@huawei.com>, Oded Gabbay <oded.gabbay@gmail.com>,
 "Arnd Bergmann" <arnd@arndb.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Omer
 Shpigelman <oshpigelman@habana.ai>, "Tomer Tayar" <ttayar@habana.ai>, Ofir
 Bitton <obitton@habana.ai>
Subject: [PATCH -next] habanalabs: remove unused but set variable 'ctx_asid'
Date: Wed, 29 Jul 2020 23:59:02 +0800
Message-ID: <20200729155902.33976-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 30 Jul 2020 07:16:49 +0000
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
Cc: linaro-mm-sig@lists.linaro.org, Wei Yongjun <weiyongjun1@huawei.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Gcc report warning as follows:

drivers/misc/habanalabs/common/command_submission.c:373:6: warning:
 variable 'ctx_asid' set but not used [-Wunused-but-set-variable]
  373 |  int ctx_asid, rc;
      |      ^~~~~~~~

This variable is not used in function cs_timedout(), this commit
remove it to fix the warning.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 .../misc/habanalabs/common/command_submission.c    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/misc/habanalabs/common/command_submission.c b/drivers/misc/habanalabs/common/command_submission.c
index e096532c0e48..b9840e368eb5 100644
--- a/drivers/misc/habanalabs/common/command_submission.c
+++ b/drivers/misc/habanalabs/common/command_submission.c
@@ -370,7 +370,7 @@ static void cs_do_release(struct kref *ref)
 static void cs_timedout(struct work_struct *work)
 {
 	struct hl_device *hdev;
-	int ctx_asid, rc;
+	int rc;
 	struct hl_cs *cs = container_of(work, struct hl_cs,
 						 work_tdr.work);
 	rc = cs_get_unless_zero(cs);
@@ -386,7 +386,6 @@ static void cs_timedout(struct work_struct *work)
 	cs->timedout = true;
 
 	hdev = cs->ctx->hdev;
-	ctx_asid = cs->ctx->asid;
 
 	dev_err(hdev->dev,
 		"Command submission %llu has not finished in time!\n",

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
