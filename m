Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74680591239
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 16:31:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 080B8ADBF9;
	Fri, 12 Aug 2022 14:31:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2059.outbound.protection.outlook.com [40.107.20.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38464B54B3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 14:31:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lfXDc3nG1napJViYMyCPTIJQjQby5WmfQVdeF6JV9UQ//vK5dMH1i2M3IfOATJ4AddifkkOZ8JZ1pJh8FmChmuKGnI7wEA6pW6RdFnferN8EW51xkIglju+vQX/SiUW+aXXuiaPr9yK3msHYCC3JzRZ0nucDJF46m7P4U3OgyPCNKBIui+8g3eN3TPE1+u/yP1kVFKUYfH7I0g+iUXFZPqxGTlm3aTbD1v3m68CpzC4sRN8KMsnJTqZdS7fD+QsBkbCMG3yp5F4/5et+zD12Gaq7aLm2YYZT3Y6lzutak4x2Npur8V1QHZ+KTokKWnHn37kGyq7j1MLrpA+7PMUNvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vlfez9doNTAfQVItxty6BGovJ51cS9bsI/wZyDkHb/g=;
 b=mbR/Qgesyp6pHwECeb+TNwYzo5b+YONGdM6TeMlm1JcZl1hjGdcwBD5qSLuvm5EinO7dluPiJA0PEkABL6BpTm/g8Tz2M+FF3W9kGtAH6Emj4OiQWKOP3qBBE+LifpS+h2TPsCGhnu+ijBf/5WZCfW9LMegfRRzbUl0RSzkQRI6lPiP8t+QTuUSLjpkOV01VxZ1JNUJRXiJk+5tnPuCalwiiMpOXZRj9jLyyRnK1djKemcaNvBcR+TSbuhwzTeokhnla8EzPwelWUc0j4r80ANRyP09Cu6kB6OHEWvvKrnMBCg/Vk4Pz24fzkRVaxtZ8T6NvNBn1YpbWMj30csgQkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vlfez9doNTAfQVItxty6BGovJ51cS9bsI/wZyDkHb/g=;
 b=GNTFhJ7g+rlAy7cQ6qBNaM54gS90teOztcqxBkEKgVhdUGkuK2A88PySCOnr9HCYKDIXHkIm2k3PlLGmUsNfOM8EpTVWi9FYhUFSyPKgLEl1xcADViVMpj3lXCXoUm+oTty8qR26e1xmxRe+GzduyMIKZfCTQYEV+AVQum8POvs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6743.eurprd04.prod.outlook.com (2603:10a6:20b:f1::11)
 by AS8PR04MB9208.eurprd04.prod.outlook.com (2603:10a6:20b:44f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Fri, 12 Aug
 2022 14:31:02 +0000
Received: from AM6PR04MB6743.eurprd04.prod.outlook.com
 ([fe80::c27:3940:d92e:acd6]) by AM6PR04MB6743.eurprd04.prod.outlook.com
 ([fe80::c27:3940:d92e:acd6%4]) with mapi id 15.20.5525.011; Fri, 12 Aug 2022
 14:31:02 +0000
From: Olivier Masse <olivier.masse@nxp.com>
To: etienne.carriere@linaro.org, jens.wiklander@linaro.org,
 sumit.garg@linaro.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 op-tee@lists.trustedfirmware.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 1/1] tee: new ioctl to a register tee_shm from a dmabuf file
 descriptor
Date: Fri, 12 Aug 2022 16:30:55 +0200
Message-Id: <20220812143055.12938-2-olivier.masse@nxp.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20220812143055.12938-1-olivier.masse@nxp.com>
References: <20220812143055.12938-1-olivier.masse@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM4PR0202CA0007.eurprd02.prod.outlook.com
 (2603:10a6:200:89::17) To AM6PR04MB6743.eurprd04.prod.outlook.com
 (2603:10a6:20b:f1::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cf0ab99-88f4-494f-e58e-08da7c6f4828
X-MS-TrafficTypeDiagnostic: AS8PR04MB9208:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bnpCLplF+jWWEtvWRmTj9CQaU2E87rENp41A6saRNyjg8P8wTC+52jgh93HMxHxNk6dK3Nj9poQaUuHHdXtwI9MwwWfQxqu6W9CSdyzejzPy744pwAx8W60BETSXKWbqkXYXWeZGF+gzJvYbIQwgsu371F4+6VOWTKFepRc6Zi8ymEUiAkLDPxFr7cBkCPS2QYAGI37N2P2g2jZqDRb1gwkuhaaMDDJDG/Y04bdybWKS4rI8j71OMT0C/QCGQFc9iEJ4RlktvcTh1zI5YQeE7xjW84GL87K7HR9GxLMfsFQcIrARdsO4u3qO7A7DJGWBQH4W/mT1Zhj6mNWn2ITYuvibzvVhdIun9b/yaVFvisWJKgAAI7/19UCCrJWCwK5KxP5eyCmST1zqZatWsSECMPXMwq3nOMGylANqXQRTkFJ9VV3JDn19OOyLYvEvG23yB+rvFXv7Jd2Tv0cscdheqt37sscgOpr0CeLjRC7mO1tITClZB5iqyu4YDJes8amrcr0gmMZAFP/YJQ83P9kjroaBPPtblPuE01Q1PLJSETf1p+U9nZcwyRjcGcSf8IcpBTRqTW/QZABZxy57TdnBY5SfV2Q3zY3IAkhstmavYROdKSvLs9MsmF3r7ip46Py33wdB2XSLqAPap1hyCHOvrD5HY/kYNqLkGqaaWCHHox1EeGKkTAsI+7VzJZmHFgnQdcwlbk31jyUaFZHIlho8Oso74hl1D7vzOlsT8KqXV8ycA5WKfzyZRASfcN/Cgg6HP9gzi43Qk/XOiVEjfSHPtA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB6743.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(376002)(346002)(39860400002)(396003)(136003)(478600001)(83380400001)(5660300002)(1076003)(186003)(36756003)(6486002)(2616005)(86362001)(8936002)(966005)(41300700001)(921005)(7416002)(316002)(66476007)(44832011)(38100700002)(55236004)(6512007)(52116002)(66556008)(66946007)(8676002)(2906002)(26005)(4326008)(6506007)(6666004)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+0tBQ3JuOpR3KZIH691bRRXfjvotBX892sSKMuYXCbVsDIMuXeD0QugfSY8Z?=
 =?us-ascii?Q?ys28/6EbaFgjPzYvkcsM/gIC4o8HMJh/yHlTKMTNRJYGXN16F6QVeyi34V5y?=
 =?us-ascii?Q?su1PK0KIFkJcbfmWOcU4uBK8rZ7TCXXBv9ub/4Uc0F3fHqwaHxzpkNHGGflp?=
 =?us-ascii?Q?wqCIEqxxFwZMZpNdB1L9mIg5z9Ih4OGVznjip8GeRQqdZURXY6MIZSKfgmEM?=
 =?us-ascii?Q?Zt+LRB/b59CyhCx/YS37pp8UqP/UTBMmPWaVmpJqVFIWi01ZlG2gt3nBXCnS?=
 =?us-ascii?Q?5PdDKYmOqehWk3oAlXeZZHm7K1XtH7WfLDRKkB7w7GzIHCE7jRNMFZEUaSNa?=
 =?us-ascii?Q?FCjeu9XEjekBJHulej7LCqirL/XJ6GYOoyV9DBMJcKjVmKb62E+b7sTYN7Hj?=
 =?us-ascii?Q?CmLDy0ubgyjJOItdRE6erVVOKogX26UVoYzULw0LoGnQwnwhZLdVHIuLUFXj?=
 =?us-ascii?Q?tTVQurzRsWzcgrtJH9o2YntCoCurWCXfHU8cI7mwgIrrsd2rPtsvvufYgTrM?=
 =?us-ascii?Q?8oLFZSBm4QI5/Xtex6GdtL05w1GQ7E+cUrXMXJzCkAUPrQolDfmYzyuiCCyT?=
 =?us-ascii?Q?l6aZyun4wBNchLxWlJLsv2daq8RVCRKjYDQHefQnbv/A0EleGEjgGg/xTKFp?=
 =?us-ascii?Q?E0FkMJ+cMibkFy182nlbtxBcCmU5K4zbzRwKmzr1swbbwJysQKUCdKTT2NzL?=
 =?us-ascii?Q?j+ZIMgXvl9Jnlz8YxDUYw1on5D5MPM8w9pHr7a5ww7mcKrAI4htTGRAPJAKa?=
 =?us-ascii?Q?NAm2QYFdJdq91ImucfYbFpSIv2u7zu0Ridx1J2S5z2aTluSA0gLcag01AjIY?=
 =?us-ascii?Q?SDW3hn2V+ZTnxvdhGKvg7jkIPmvaiFjC8uOGV280dH5GWlXejXPfXrMeOFBS?=
 =?us-ascii?Q?IGvt+FwiK+5f4FpPqHZc2f0zFk10JBmX+2pLMQCrQGrPDERbqkN0xE8+EF8Z?=
 =?us-ascii?Q?0dnIFismIzoH7OC4w0IcYhxAaW2N6A4vehT7K5XZ3OravWWXTr9vTB5/LmxN?=
 =?us-ascii?Q?XpWf01oFdDbAvLvz1uZZi7iL8p/sbSwBsGwnk7RUriM7EAqHjIFHE9eoekxJ?=
 =?us-ascii?Q?i1S3QNKfaY+Voz+uhlKSOImXuhAc2RjPUkgvzGCX/B5PhTHXfFMc9lxB1T/p?=
 =?us-ascii?Q?ZqsDQwL6c1wnFXpcjC5ShT52//UcMgxPQDbeLc22D7ZpWU6Av7Z124TjKFXz?=
 =?us-ascii?Q?sG+BWT6jS/CbpRWnh72c4UjCe+C7l93rUfS5Y2McvVJ/oZGZ65PN++WD2cXV?=
 =?us-ascii?Q?Tlm8e0Gq4kO18GCh5IB5RHm604IrjDB6OqaxiHo1wO2tivnBgSVxaKa9RuMz?=
 =?us-ascii?Q?WSZlwmH2gDTTQyBSoWr+kwds3E12xB1Dwlpbvz4L1jYsBfEsmLf68GofPgSW?=
 =?us-ascii?Q?c+p+x2R0t2isQuHMauGxb72GcYgMRtjQ9vU5ojhorbarDihN2LLk7sZrL+45?=
 =?us-ascii?Q?bQFUBqP6Ziq8XP+rV2NNTLIG8hlAYTssB3P0QyOWOIojCuLiqdenELUPMkgZ?=
 =?us-ascii?Q?p5qn9hnhxfQicbiEFZ/uyfrooMzH+1Q1L7mynLSn0dqXwje6KPjrodMO+caY?=
 =?us-ascii?Q?55QYapEva6geehNj1Agv+tfF0qMw7tsZ3tU/E+lb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cf0ab99-88f4-494f-e58e-08da7c6f4828
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 14:31:02.1450 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y5YV2hNB5MaFL1G6n8qxJcZIjxGetq2WuWBI6Rqj342Tjx5XVT3VmBxWuDeq23D9YuBmbiWH7Hy0KVKbYIuD4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9208
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
Cc: clement.faure@nxp.com, olivier.masse@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Etienne Carriere <etienne.carriere@linaro.org>

This change allows userland to create a tee_shm object that refers
to a dmabuf reference.

Userland provides a dmabuf file descriptor as buffer reference.
The created tee_shm object exported as a brand new dmabuf reference
used to provide a clean fd to userland. Userland shall closed this new
fd to release the tee_shm object resources. The initial dmabuf resources
are tracked independently through original dmabuf file descriptor.

Once the buffer is registered and until it is released, TEE driver
keeps a refcount on the registered dmabuf structure.

This change only support dmabuf references that relates to physically
contiguous memory buffers.

New tee_shm flag to identify tee_shm objects built from a registered
dmabuf: TEE_SHM_EXT_DMA_BUF. Such tee_shm structures are flagged with
TEE_SHM_EXT_DMA_BUF.

Co-Developed-by: Etienne Carriere <etienne.carriere@linaro.org>
Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
Reported-by: kernel test robot <lkp@intel.com>
From: https://github.com/linaro-swg/linux.git
(cherry picked from commit 41e21e5c405530590dc2dd10b2a8dbe64589840f)
---
 drivers/tee/tee_core.c   | 38 +++++++++++++++
 drivers/tee/tee_shm.c    | 99 +++++++++++++++++++++++++++++++++++++++-
 include/linux/tee_drv.h  | 11 +++++
 include/uapi/linux/tee.h | 29 ++++++++++++
 4 files changed, 175 insertions(+), 2 deletions(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index 8aa1a4836b92..7c45cbf85eb9 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -355,6 +355,42 @@ tee_ioctl_shm_register(struct tee_context *ctx,
 	return ret;
 }
 
+static int tee_ioctl_shm_register_fd(struct tee_context *ctx,
+				     struct tee_ioctl_shm_register_fd_data __user *udata)
+{
+	struct tee_ioctl_shm_register_fd_data data;
+	struct tee_shm *shm;
+	long ret;
+
+	if (copy_from_user(&data, udata, sizeof(data)))
+		return -EFAULT;
+
+	/* Currently no input flags are supported */
+	if (data.flags)
+		return -EINVAL;
+
+	shm = tee_shm_register_fd(ctx, data.fd);
+	if (IS_ERR(shm))
+		return -EINVAL;
+
+	data.id = shm->id;
+	data.flags = shm->flags;
+	data.size = shm->size;
+
+	if (copy_to_user(udata, &data, sizeof(data)))
+		ret = -EFAULT;
+	else
+		ret = tee_shm_get_fd(shm);
+
+	/*
+	 * When user space closes the file descriptor the shared memory
+	 * should be freed or if tee_shm_get_fd() failed then it will
+	 * be freed immediately.
+	 */
+	tee_shm_put(shm);
+	return ret;
+}
+
 static int params_from_user(struct tee_context *ctx, struct tee_param *params,
 			    size_t num_params,
 			    struct tee_ioctl_param __user *uparams)
@@ -829,6 +865,8 @@ static long tee_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		return tee_ioctl_shm_alloc(ctx, uarg);
 	case TEE_IOC_SHM_REGISTER:
 		return tee_ioctl_shm_register(ctx, uarg);
+	case TEE_IOC_SHM_REGISTER_FD:
+		return tee_ioctl_shm_register_fd(ctx, uarg);
 	case TEE_IOC_OPEN_SESSION:
 		return tee_ioctl_open_session(ctx, uarg);
 	case TEE_IOC_INVOKE:
diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
index 836872467dc6..55a3fbbb022e 100644
--- a/drivers/tee/tee_shm.c
+++ b/drivers/tee/tee_shm.c
@@ -4,6 +4,7 @@
  */
 #include <linux/anon_inodes.h>
 #include <linux/device.h>
+#include <linux/dma-buf.h>
 #include <linux/idr.h>
 #include <linux/mm.h>
 #include <linux/sched.h>
@@ -12,6 +13,14 @@
 #include <linux/uio.h>
 #include "tee_private.h"
 
+/* extra references appended to shm object for registered shared memory */
+struct tee_shm_dmabuf_ref {
+     struct tee_shm shm;
+     struct dma_buf *dmabuf;
+     struct dma_buf_attachment *attach;
+     struct sg_table *sgt;
+};
+
 static void shm_put_kernel_pages(struct page **pages, size_t page_count)
 {
 	size_t n;
@@ -71,7 +80,16 @@ static void release_registered_pages(struct tee_shm *shm)
 
 static void tee_shm_release(struct tee_device *teedev, struct tee_shm *shm)
 {
-	if (shm->flags & TEE_SHM_POOL) {
+	if (shm->flags & TEE_SHM_EXT_DMA_BUF) {
+		struct tee_shm_dmabuf_ref *ref;
+
+		ref = container_of(shm, struct tee_shm_dmabuf_ref, shm);
+		dma_buf_unmap_attachment(ref->attach, ref->sgt,
+					 DMA_BIDIRECTIONAL);
+
+		dma_buf_detach(ref->dmabuf, ref->attach);
+		dma_buf_put(ref->dmabuf);
+	} else if (shm->flags & TEE_SHM_POOL) {
 		teedev->pool->ops->free(teedev->pool, shm);
 	} else if (shm->flags & TEE_SHM_DYNAMIC) {
 		int rc = teedev->desc->ops->shm_unregister(shm->ctx, shm);
@@ -195,7 +213,7 @@ struct tee_shm *tee_shm_alloc_user_buf(struct tee_context *ctx, size_t size)
  * tee_client_invoke_func(). The memory allocated is later freed with a
  * call to tee_shm_free().
  *
- * @returns a pointer to 'struct tee_shm'
+ * @returns a pointer to 'struct tee_shm' on success, and ERR_PTR on failure
  */
 struct tee_shm *tee_shm_alloc_kernel_buf(struct tee_context *ctx, size_t size)
 {
@@ -229,6 +247,83 @@ struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, size_t size)
 }
 EXPORT_SYMBOL_GPL(tee_shm_alloc_priv_buf);
 
+struct tee_shm *tee_shm_register_fd(struct tee_context *ctx, int fd)
+{
+	struct tee_shm_dmabuf_ref *ref;
+	int rc;
+
+	if (!tee_device_get(ctx->teedev))
+		return ERR_PTR(-EINVAL);
+
+	teedev_ctx_get(ctx);
+
+	ref = kzalloc(sizeof(*ref), GFP_KERNEL);
+	if (!ref) {
+		rc = -ENOMEM;
+		goto err_put_tee;
+	}
+
+	refcount_set(&ref->shm.refcount, 1);
+	ref->shm.ctx = ctx;
+	ref->shm.id = -1;
+
+	ref->dmabuf = dma_buf_get(fd);
+	if (IS_ERR(ref->dmabuf)) {
+		rc = PTR_ERR(ref->dmabuf);
+		goto err_put_dmabuf;
+	}
+
+	ref->attach = dma_buf_attach(ref->dmabuf, &ref->shm.ctx->teedev->dev);
+	if (IS_ERR(ref->attach)) {
+		rc = PTR_ERR(ref->attach);
+		goto err_detach;
+	}
+
+	ref->sgt = dma_buf_map_attachment(ref->attach, DMA_BIDIRECTIONAL);
+	if (IS_ERR(ref->sgt)) {
+		rc = PTR_ERR(ref->sgt);
+		goto err_unmap_attachement;
+	}
+
+	if (sg_nents(ref->sgt->sgl) != 1) {
+		rc = PTR_ERR(ref->sgt->sgl);
+		goto err_unmap_attachement;
+	}
+
+	ref->shm.paddr = sg_dma_address(ref->sgt->sgl);
+	ref->shm.size = sg_dma_len(ref->sgt->sgl);
+	ref->shm.flags = TEE_SHM_EXT_DMA_BUF;
+
+	mutex_lock(&ref->shm.ctx->teedev->mutex);
+	ref->shm.id = idr_alloc(&ref->shm.ctx->teedev->idr, &ref->shm,
+				1, 0, GFP_KERNEL);
+	mutex_unlock(&ref->shm.ctx->teedev->mutex);
+	if (ref->shm.id < 0) {
+		rc = ref->shm.id;
+		goto err_idr_remove;
+	}
+
+	return &ref->shm;
+
+err_idr_remove:
+	mutex_lock(&ctx->teedev->mutex);
+	idr_remove(&ctx->teedev->idr, ref->shm.id);
+	mutex_unlock(&ctx->teedev->mutex);
+err_unmap_attachement:
+	dma_buf_unmap_attachment(ref->attach, ref->sgt, DMA_BIDIRECTIONAL);
+err_detach:
+	dma_buf_detach(ref->dmabuf, ref->attach);
+err_put_dmabuf:
+	dma_buf_put(ref->dmabuf);
+	kfree(ref);
+err_put_tee:
+	teedev_ctx_put(ctx);
+	tee_device_put(ctx->teedev);
+
+	return ERR_PTR(rc);
+}
+EXPORT_SYMBOL_GPL(tee_shm_register_fd);
+
 static struct tee_shm *
 register_shm_helper(struct tee_context *ctx, unsigned long addr,
 		    size_t length, u32 flags, int id)
diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
index 911cad324acc..40ddd5376c2d 100644
--- a/include/linux/tee_drv.h
+++ b/include/linux/tee_drv.h
@@ -25,6 +25,7 @@
 #define TEE_SHM_USER_MAPPED	BIT(1)  /* Memory mapped in user space */
 #define TEE_SHM_POOL		BIT(2)  /* Memory allocated from pool */
 #define TEE_SHM_PRIV		BIT(3)  /* Memory private to TEE driver */
+#define TEE_SHM_EXT_DMA_BUF     BIT(4)  /* Memory with dma-buf handle */
 
 struct device;
 struct tee_device;
@@ -276,6 +277,16 @@ struct tee_shm *tee_shm_alloc_kernel_buf(struct tee_context *ctx, size_t size);
 struct tee_shm *tee_shm_register_kernel_buf(struct tee_context *ctx,
 					    void *addr, size_t length);
 
+/**
+ * tee_shm_register_fd() - Register shared memory from file descriptor
+ *
+ * @ctx:	Context that allocates the shared memory
+ * @fd:		Shared memory file descriptor reference
+ *
+ * @returns a pointer to 'struct tee_shm' on success, and ERR_PTR on failure
+ */
+struct tee_shm *tee_shm_register_fd(struct tee_context *ctx, int fd);
+
 /**
  * tee_shm_is_dynamic() - Check if shared memory object is of the dynamic kind
  * @shm:	Shared memory handle
diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
index 25a6c534beb1..baf3cd7cfdac 100644
--- a/include/uapi/linux/tee.h
+++ b/include/uapi/linux/tee.h
@@ -121,6 +121,35 @@ struct tee_ioctl_shm_alloc_data {
 #define TEE_IOC_SHM_ALLOC	_IOWR(TEE_IOC_MAGIC, TEE_IOC_BASE + 1, \
 				     struct tee_ioctl_shm_alloc_data)
 
+/**
+ * struct tee_ioctl_shm_register_fd_data - Shared memory registering argument
+ * @fd:		[in] File descriptor identifying the shared memory
+ * @size:	[out] Size of shared memory to allocate
+ * @flags:	[in] Flags to/from allocation.
+ * @id:		[out] Identifier of the shared memory
+ *
+ * The flags field should currently be zero as input. Updated by the call
+ * with actual flags as defined by TEE_IOCTL_SHM_* above.
+ * This structure is used as argument for TEE_IOC_SHM_REGISTER_FD below.
+ */
+struct tee_ioctl_shm_register_fd_data {
+	__s64 fd;
+	__u64 size;
+	__u32 flags;
+	__s32 id;
+} __attribute__ ((aligned (8)));
+
+/**
+ * TEE_IOC_SHM_REGISTER_FD - register a shared memory from a file descriptor
+ *
+ * Returns a file descriptor on success or < 0 on failure
+ *
+ * The returned file descriptor refers to the shared memory object in kernel
+ * land. The shared memory is freed when the descriptor is closed.
+ */
+#define TEE_IOC_SHM_REGISTER_FD	_IOWR(TEE_IOC_MAGIC, TEE_IOC_BASE + 8, \
+				     struct tee_ioctl_shm_register_fd_data)
+
 /**
  * struct tee_ioctl_buf_data - Variable sized buffer
  * @buf_ptr:	[in] A __user pointer to a buffer
-- 
2.25.0

