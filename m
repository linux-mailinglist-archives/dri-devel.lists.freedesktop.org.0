Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2059B58FDE4
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 15:57:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B0A9B1827;
	Thu, 11 Aug 2022 13:57:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2074.outbound.protection.outlook.com [40.107.105.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C17E11A513
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 13:56:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cjE1pYPl6HlY6DWs9PH708aEmmFRkgFTxH18ivg6qWklKmShXOSw5CGUUbWRb2sr8SaGm0DlzMK/yiMZDGj4xLexi91MMMM4DhZTqgMeTm5DaBS4CCcWpgTHHwmCgzFn3Ney3ThKKgffJY9PCV9fr5xg8EASpIfXX1B9LyS8atmboqX1VLuPZG88LEP/NufneWQA3eF9W7WZi2x5h/mu/3PkZy622bei3epi6JVsRsaHnHwN6aR6g5pgl6R8gF5sy3ZM0/4H3zi4jUIF9GUM+i6x4cRaEM0pW8CTd7hYjcaeb+/vGY8HS77KpGkr5J8CLHF9K2elUlHH9eC+bIen+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yOnm6DhWXnYWYGrOEmIaQLzD26Tvv8JEdIelGL5ml+s=;
 b=CAVUyyWk7rulq4zhK25tWP54gKCYDkm2FGli5+Hp+dFX/WgPyTeRFzdJvg/X9xaTQx1aFMV034xaGvjTLk27SjE02yKzcQoCqJbtzon7ZcLQAAqFYudhZvK4bAWDS+F5GJDZK6N4F2SP51quMV4lu/3tpVNqgU9ik/n9g81knN8NEebWakEvXTrS6ehhsyOOWE71d5974biYpY536r2LIcDJ3QZuVCclg525iVOoUS0se47742PLzgYVqiX4QTRZXopKzsND+9o22yxOgCmVQA25CpD3kkeMux8CtEmhrwcLwnCMCc7BKKOo0vwwj0L9IKepvVmIhJmEhdjVWKJltw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOnm6DhWXnYWYGrOEmIaQLzD26Tvv8JEdIelGL5ml+s=;
 b=b6EtBIGP/bafDK8MEUVJj6dfL8hwmB5GnbAsVeeacovJoiyoUQ+My79iNe1z2kQpvCFSYttBg+MXq1fn+cEBCUa4DxrIs044wViBWCirDjzIRaS8q6a66PP6kDIO2lqI0829k7E5zqJOWJ/lfkMQMWDgDx9iLQmv915YxHlR59o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6743.eurprd04.prod.outlook.com (2603:10a6:20b:f1::11)
 by HE1PR0402MB3436.eurprd04.prod.outlook.com (2603:10a6:7:82::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.20; Thu, 11 Aug
 2022 13:56:44 +0000
Received: from AM6PR04MB6743.eurprd04.prod.outlook.com
 ([fe80::c27:3940:d92e:acd6]) by AM6PR04MB6743.eurprd04.prod.outlook.com
 ([fe80::c27:3940:d92e:acd6%4]) with mapi id 15.20.5525.011; Thu, 11 Aug 2022
 13:56:44 +0000
From: Olivier Masse <olivier.masse@nxp.com>
To: jens.wiklander@linaro.org, sumit.garg@linaro.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, op-tee@lists.trustedfirmware.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/1] tee: new ioctl to a register tee_shm from a dmabuf file
 descriptor
Date: Thu, 11 Aug 2022 15:56:37 +0200
Message-Id: <20220811135637.6332-2-olivier.masse@nxp.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20220811135637.6332-1-olivier.masse@nxp.com>
References: <20220811135637.6332-1-olivier.masse@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4PR09CA0010.eurprd09.prod.outlook.com
 (2603:10a6:20b:5e0::14) To AM6PR04MB6743.eurprd04.prod.outlook.com
 (2603:10a6:20b:f1::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a73c72e-5338-4d97-7043-08da7ba1530d
X-MS-TrafficTypeDiagnostic: HE1PR0402MB3436:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FMSptWu6fFVQMr0t2HiCRan7H8tHjwRASiUIw1OpFkJG0M64zF0doNrIhS9Pn/VHr0yjg1va76tVfv7QK7N5xu9mkNvyfVmKBlvscOqYeq7e3RTEM91CcJPVNxNdTulgjz9mRopriYWwYYkMMiDZEM7FIOiYgX2m51COlmX6aToqNwkl1FPUeJQ2YY8zD9suvPtxUEokLlAn3zx3AFCTcyAdNUtaNLQoS4jWQGIIx7mhik7iFs1bLr1vPYTZt+FKk00kuMdXk3rZ7BPYSrJOALr4TTsuWSqijfeaBeCsveoUGOMdo8771Tjix78CS8ADt70Wuf4PQMaaxzxERUqQXP4Nt+KCwnj6ds1doEARG+MVkiLmk7r4Cqf1A/h8cYjf3u1Qc3WLgrnSe4o3dF1jETWEiUzkqjVBXjAuHklPFFPj8wRyH40RyEpTHu5Ydb9NKsu2Lu3dTRUKqikSSmrakFA+fy7ObUmC9ds3fUL31dy0Yflf+U7GvOk/drgmbcFJjpE+C1/bBRj4Nd/AFh20+Y6ZFTQ3ZxSq6ah6C+Z/mPi0cLPXr6Sfa9YwDiI3OpV5rpzLttycbFaERj5fR8LpJaPgcCBYtWM8K/6Jbfr95EJpzQGkMyKp1Y21a9EzUoMTeuWTGHz5fcPJRiEUpLZ5kpcmvmGgY2UA7bUCK1CBOtXWDRiT7zSn6fyXHYSSXqwSMdpIhrxW3jlgBO0xNZihkVeQkrYSlrMwDWaLrVMnXuQBCYh2/IBgmUGCLc9jMzgLXAwaaGY6c6Y0Ie0UyeV3vaa9qcxHqf7xg9n18BROhHC4a3GlZliyrr1E/qoWAMU169VpIC95iFr4ozNnDhQo8w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB6743.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(136003)(39860400002)(396003)(366004)(376002)(26005)(2906002)(316002)(52116002)(6506007)(41300700001)(1076003)(83380400001)(36756003)(86362001)(966005)(2616005)(6666004)(186003)(6486002)(6512007)(66946007)(44832011)(66476007)(8936002)(66556008)(5660300002)(478600001)(8676002)(4326008)(38100700002)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1sKR4Z2tLRtC5t2u5093tTLnjhaQ9L8Bi475LzyOUBR1c1CFaiLxsZ8O/D45?=
 =?us-ascii?Q?48Tg1wcRfRPjRzgwATASMUAPyBrevs7y/2LoAvZ6lB3AoZTJ5m23eLZ5yw4G?=
 =?us-ascii?Q?QKHWceqzQmcbHsWEj6XcP9J+88PY0AqJuYz6yAqVogW3csxwEx2a22jpXcOD?=
 =?us-ascii?Q?UNXRxZWGV1+11rc3avWFjB9HL9cZFGoTS5p6XO+qKpU81z2ZVW2a5309/1Rj?=
 =?us-ascii?Q?YoDK3DSDaawLIaZyK8gc5+pwyeKEhAGdm9Qbfp2OhxEFydkIoQXLYE3hTNul?=
 =?us-ascii?Q?hef4vRF8fM4R4RX5IDY09UYoablRZQts4dnfXo104B+2ALSiLo5qNZm4+LH9?=
 =?us-ascii?Q?yIsznV/hiaV5pN1b1ntg8JvSt06QJQ5G0jYsb060OxuKIlb8SaSTKXwIMUXX?=
 =?us-ascii?Q?txtn5HpbrVAX1pBpzymgKVORCgnPvjcNMiR5ZDiL3a/ZZq7L9J/shknF1f8s?=
 =?us-ascii?Q?rZ0YGhZ0VDU+GYk8xVpcHg4bSptPYg9+ELRLecj2zrelueedm+6SIdmzDMOP?=
 =?us-ascii?Q?eSUZuTM0lP+5Vujm3DUNHjSwB3apr+EPuN/VR3rjvFaFw/TkS6bpl7uAhxCw?=
 =?us-ascii?Q?EWkwrCHiJRgocVY5sE55NFE7N47yDbbMG/fQmu5wByg0JjjKCMNkn91X2dsb?=
 =?us-ascii?Q?CkHFTc5l000wvbeZB9XKyFmj84g7O7Z2nUcrfivOFEczZUcjuO2OlQlS4x2m?=
 =?us-ascii?Q?o2sdjLjgGRI+noVsP3Edpa9+yHYmOcYOOUmN0rOYSZd5F9IrDeT8FQdZQa7P?=
 =?us-ascii?Q?hsfdSnC21hYj9aBIHo6i/4LCbFYYo4T8hGhmDzUwyPpLRFT5xw1FfhdeFtGp?=
 =?us-ascii?Q?mFeUwG5iSN/378vguzHWQFenuZjqsnEVHAYUd4TMDO+uygPKewePMHd5CdGM?=
 =?us-ascii?Q?hnHIaNXtetYZVLCHB2zITU4N5+JFQq0BG4X+nQI66QdZSDrSRmW9eAOHN8ng?=
 =?us-ascii?Q?mAspzysLylGRRWIEmdgodo9XtqQ2TxqlLcaJjsJ2m/enBVODln+peS3q5sBQ?=
 =?us-ascii?Q?4bw/ClU9p54k35ZH7CcJsw0e7/o2DzilI36d2E2z7epH68hVDXQElXocqh9e?=
 =?us-ascii?Q?rd0YQixKYqQuavZV7d6o078oJZO16S4sp96wtVVJtG8XIdhfLPY/J5PibOYA?=
 =?us-ascii?Q?WJRRoRse4UaaxI7rvy0OtEBQgTPHE4jA6oSbV77zJasQsVNkPfrJJM+DV2w/?=
 =?us-ascii?Q?670qHfGLDvlU3DfDVYW/Ny8iDC19da5PC4CibZT/ZaHwKYcRNylPxdPJKm1T?=
 =?us-ascii?Q?DvFAhjoSl+gQCXLDbVRTdqn7PFw4SHFsOMrj2I/aCA9yPB/O8geYMq5bWM3d?=
 =?us-ascii?Q?f3IODCDkDZCIAHaHgYhLXTNXaeM6Avs50wAvT2P6EDwx9EUN8LKjX/lJaCQS?=
 =?us-ascii?Q?IOiIhf6MIGAo45Al49Ho05dOoc5wB+3Z4nVqQw1wGgYqaCRuJGDRrDHBpZPz?=
 =?us-ascii?Q?66rNh4ObzW7C5mK3qhr9bPx5fAPrdKeL73FgvVO4/KK3yk34y1xa/ThO3Xr8?=
 =?us-ascii?Q?psLJ6+h48N5wjJ5+qlFrBBuHX38jLLVsaLYnoxhtsj31DBqcC4fginupbLJR?=
 =?us-ascii?Q?xj2cM5wWDn5j8/zITrr0C2q5UysyPS37sl0PlgCC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a73c72e-5338-4d97-7043-08da7ba1530d
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 13:56:44.4374 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0PzA8ejlAbkwYTd/1mRSRunw1R2rVcQ584StLnZr4wyEuOgXtQ3BtcnLLJt6Eq5OhW0azXEgSYqxFXXl+r89Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB3436
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
index 25a6c534beb1..6f84060ad005 100644
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
+} __aligned(8);
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

