Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7B4AFBBCB
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 21:38:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A4B110E547;
	Mon,  7 Jul 2025 19:38:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pHZ9ZmO+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2085.outbound.protection.outlook.com [40.107.92.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 521C610E547
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 19:38:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LT0Ezq610IZnKtANYqkx5yfRGDJ0Bt3OzsQICt6mEF/C8HcECdE+N/kjTSq59ma72rnBLGDboDTxzHgzZcFgKjJHaUrQEOtjsoTAouSSSEOV3lvHcotAAV/OlUyG15TaOd/t3EvrJ5XIXpa8RU1pak4sKJrsaP2Zau2h9bxaCgJEq3s3GS++KLB7Da4cKLcUSFa1lqszudJ5QF4hZlTYOl5vyp7eAjmcUg+LGtPhMLXwowSDkhBcPWY4+ayLd9dviPfesVvDKEF2MWwxF4elP0OEWxNT9aK7CwrHtwWKytE5k1+R55lIYDF/fpIaVuh/YiwI2FmdR0bN9m39Y/WKWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HOgn2gmp9VpweRGgHYwx/MTyUQtwV2eWlDJcx7kgWDc=;
 b=a4CQxL4VCbbhDHeUxBQmKM8q5CFIpGLxmFYOOs6JX2ZU8DmiNZ6WMoBYiSGgzTYLqI+edSvp12raMHiWrWolFDJJJBjQW2pykadRv+xc4lPdqpHKdHtByTgUDckJcKIR9d95AWJJj38941chUlyISQFQ9Uu3VPGsecBsHDOKAifN/GU1CdusL0rNZ3ux5CNBOsJPTnVUrE+DPuhFoVcFnc1kxmqXVCD1JJwGUONOkcMUR33hLKuqfcXVdPM0MpGvfuU1QFBsxzxBEt6w4c90CKO5sN9LlfNr5hITz3PUmdoFZq4UBu2kbHtkOwt+W7i5aTIQShjbtPe5S50lB4WFGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HOgn2gmp9VpweRGgHYwx/MTyUQtwV2eWlDJcx7kgWDc=;
 b=pHZ9ZmO+ChCccf/MAJdcjihVTPwlv3HZmGAEkA23LjmVBiGkGrmRTDfYOqB8OBY8iaRAzDGyTuTPrG2wy6f3KxVuHGBx13m8upwN/m4COUT5+7t/V+Nm812yZ/dYKlGILoDlEXn7jbadqbil+hCd85nm2bLDtq7IZs3b809ctNc=
Received: from BYAPR02CA0066.namprd02.prod.outlook.com (2603:10b6:a03:54::43)
 by LV8PR12MB9665.namprd12.prod.outlook.com (2603:10b6:408:297::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Mon, 7 Jul
 2025 19:38:20 +0000
Received: from SJ5PEPF000001F4.namprd05.prod.outlook.com
 (2603:10b6:a03:54:cafe::a9) by BYAPR02CA0066.outlook.office365.com
 (2603:10b6:a03:54::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.27 via Frontend Transport; Mon,
 7 Jul 2025 19:38:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F4.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Mon, 7 Jul 2025 19:38:20 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Jul
 2025 14:38:18 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Jul
 2025 14:38:17 -0500
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 7 Jul 2025 14:38:17 -0500
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <jacek.lawrynowicz@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V1] accel/amdxdna: Support user space allocated buffer
Date: Mon, 7 Jul 2025 12:38:13 -0700
Message-ID: <20250707193813.880281-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F4:EE_|LV8PR12MB9665:EE_
X-MS-Office365-Filtering-Correlation-Id: 1422b75e-972a-46dd-a767-08ddbd8dd418
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ktO0h5tmpdaXx+spBiOsnGzfSxzihlQleZgecWWffBbFUl+l7Co7O4us7461?=
 =?us-ascii?Q?CkB6chtXoIZ3qeMgdpgLY2U0mkOp4qQwHsP9rz7bcTvlWuP4xOZB4hPnPYfm?=
 =?us-ascii?Q?jlNxNY1p7AFeoLWBbevf0k+SHthOZitXxlDR+E+a7/q4ZYC+cGRb9pdd9gE8?=
 =?us-ascii?Q?FO7CfxT77BCaHj7sXQxqPiXfaixrjcpJ13i+fAe0SuRDMgmiijrU/AYkTJbd?=
 =?us-ascii?Q?/88Q5luM+CqwhgfXfFqQlVzJNc1yRtV1L90h9w1+dkzIAXB9STPRdSvIP2p6?=
 =?us-ascii?Q?690wrsvh1BorsZq0V4tbmYv+oE5BoTr1bRMt6zdik7kIll5LZzn/JKe7U8KQ?=
 =?us-ascii?Q?VmCA4lJzPUuGCG+6c/bYnwMTXHsNuQlisGkaB7pFe7tq3Vsb0NGCMiZIeDAd?=
 =?us-ascii?Q?qzY1Zvwzx7IiZVSxKW9FH242LreFBUPDa70v9+ydErwKtkA3Sp9sPlKloeDF?=
 =?us-ascii?Q?Zeq44BX3VEmbV/x0ycZ+ozKRFCotOPwv8GvxpReCqiKJuC2WaVNji1HS7R1a?=
 =?us-ascii?Q?A7CnxHyPHWp85lzPxdjM3w6EFR91TL9qXij0RfMs6NwwXSIs4dQ0ETNfxS/u?=
 =?us-ascii?Q?tlnRum5PTtok5ijOnoa+6q9HWL2M70iFouqnZOF8/LWdp94UEPEl49+HaMkF?=
 =?us-ascii?Q?1ZcX+BA8M4TtIMItO1H8bz12dTwnpmrUAgM1CPQtYHueJiR5KL0t5t8+myk+?=
 =?us-ascii?Q?JOcVgyZgA6hJxEDJSoUgfEGKTLNDH3/ebQM3Sm9KNjrHklW1vHdffDPaSv0s?=
 =?us-ascii?Q?uLVI+1v9AMpvWu7JJZpy3dbvInChG6Jty6Bgypwj4X1WMrH3mOCrgH47Bqx3?=
 =?us-ascii?Q?xYokZtX5vt1p+8R1x3yfWQCqDwEI4su3dJRIDw94QcVyDFwU46pBszStyh0w?=
 =?us-ascii?Q?iPQCn5Faom0488Y3/pL3GQo07uhDNuVyMWxJQAnm/D6gFucpAbMtFOkten0O?=
 =?us-ascii?Q?FjYHSkj9wwVV7FuG+AcwdSHG1Kd0WUavCtZ4dhzjq2DFv4DXrXAqCKPvSX+D?=
 =?us-ascii?Q?9AMLdtBhVT8XsqafZNK5KK/z85PaG8FaJYqq01m1cud5vi6/25/vPUFcjqjZ?=
 =?us-ascii?Q?srYlFEyLMENPUZNN3eSXzHllMnykmWX3YM8I8Thjn/sYzowE+xSTJ86u1MJf?=
 =?us-ascii?Q?2CpH10rEQe14ZIAxRlPtuKAhgddIOwstx23UApsA+sfDuvTovRz+Y1Jcm0wK?=
 =?us-ascii?Q?8dzyowMZgpW0IvskovCebI6pMjWngGhLIketqwstEMJ1tRgMOnFPJ+1ld0ON?=
 =?us-ascii?Q?TyqyHGUdV3RquRT9jjjD8XuGUNoL+PWXRwTJsDaiMegkU8d7HL0HN/LIMPm3?=
 =?us-ascii?Q?BbG0RgxQAFFDZivcD9pMZ88/0geUaMAD/odmBo7Qxu2WeIbuTsFFu64DM8P/?=
 =?us-ascii?Q?f4o3dsHpdwprN0IGztnDoaThQDBMDejxD7em35cdLP82SopZTgcbd2em8Bas?=
 =?us-ascii?Q?Hrm3ObE+w9UfS+MdYwfIA+Wq60gLwjZ/GxlRcCj3AfzFLiegMiCtlj4I+k0i?=
 =?us-ascii?Q?U8ZqoL2dHhRfG8PqaDSoADdaG0Y42xJk5xFf?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 19:38:20.1460 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1422b75e-972a-46dd-a767-08ddbd8dd418
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9665
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

Enhance DRM_IOCTL_AMDXDNA_CREATE_BO to accept user space allocated
buffer pointer. The buffer pages will be pinned in memory. Unless
the CAP_IPC_LOCK is enabled for the application process, the total
pinned memory can not beyond rlimit_memlock.

Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/Makefile       |   1 +
 drivers/accel/amdxdna/amdxdna_gem.c  | 139 +++++++++++++---
 drivers/accel/amdxdna/amdxdna_ubuf.c | 232 +++++++++++++++++++++++++++
 drivers/accel/amdxdna/amdxdna_ubuf.h |  19 +++
 include/uapi/drm/amdxdna_accel.h     |  25 +++
 5 files changed, 391 insertions(+), 25 deletions(-)
 create mode 100644 drivers/accel/amdxdna/amdxdna_ubuf.c
 create mode 100644 drivers/accel/amdxdna/amdxdna_ubuf.h

diff --git a/drivers/accel/amdxdna/Makefile b/drivers/accel/amdxdna/Makefile
index 0e9adf6890a0..6797dac65efa 100644
--- a/drivers/accel/amdxdna/Makefile
+++ b/drivers/accel/amdxdna/Makefile
@@ -15,6 +15,7 @@ amdxdna-y := \
 	amdxdna_mailbox_helper.o \
 	amdxdna_pci_drv.o \
 	amdxdna_sysfs.o \
+	amdxdna_ubuf.o \
 	npu1_regs.o \
 	npu2_regs.o \
 	npu4_regs.o \
diff --git a/drivers/accel/amdxdna/amdxdna_gem.c b/drivers/accel/amdxdna/amdxdna_gem.c
index 0f85a0105178..d407a36eb412 100644
--- a/drivers/accel/amdxdna/amdxdna_gem.c
+++ b/drivers/accel/amdxdna/amdxdna_gem.c
@@ -18,6 +18,7 @@
 #include "amdxdna_ctx.h"
 #include "amdxdna_gem.h"
 #include "amdxdna_pci_drv.h"
+#include "amdxdna_ubuf.h"
 
 #define XDNA_MAX_CMD_BO_SIZE	SZ_32K
 
@@ -296,7 +297,7 @@ static int amdxdna_insert_pages(struct amdxdna_gem_obj *abo,
 
 	vma->vm_private_data = NULL;
 	vma->vm_ops = NULL;
-	ret = dma_buf_mmap(to_gobj(abo)->dma_buf, vma, 0);
+	ret = dma_buf_mmap(abo->dma_buf, vma, 0);
 	if (ret) {
 		XDNA_ERR(xdna, "Failed to mmap dma buf %d", ret);
 		return ret;
@@ -391,10 +392,47 @@ static const struct dma_buf_ops amdxdna_dmabuf_ops = {
 	.vunmap = drm_gem_dmabuf_vunmap,
 };
 
+static int amdxdna_gem_obj_vmap(struct drm_gem_object *obj, struct iosys_map *map)
+{
+	struct amdxdna_gem_obj *abo = to_xdna_obj(obj);
+
+	iosys_map_clear(map);
+
+	dma_resv_assert_held(obj->resv);
+
+	if (is_import_bo(abo))
+		dma_buf_vmap(abo->dma_buf, map);
+	else
+		drm_gem_shmem_object_vmap(obj, map);
+
+	if (!map->vaddr)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static void amdxdna_gem_obj_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
+{
+	struct amdxdna_gem_obj *abo = to_xdna_obj(obj);
+
+	dma_resv_assert_held(obj->resv);
+
+	if (is_import_bo(abo))
+		dma_buf_vunmap(abo->dma_buf, map);
+	else
+		drm_gem_shmem_object_vunmap(obj, map);
+}
+
 static struct dma_buf *amdxdna_gem_prime_export(struct drm_gem_object *gobj, int flags)
 {
+	struct amdxdna_gem_obj *abo = to_xdna_obj(gobj);
 	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
 
+	if (abo->dma_buf) {
+		get_dma_buf(abo->dma_buf);
+		return abo->dma_buf;
+	}
+
 	exp_info.ops = &amdxdna_dmabuf_ops;
 	exp_info.size = gobj->size;
 	exp_info.flags = flags;
@@ -451,8 +489,8 @@ static const struct drm_gem_object_funcs amdxdna_gem_shmem_funcs = {
 	.pin = drm_gem_shmem_object_pin,
 	.unpin = drm_gem_shmem_object_unpin,
 	.get_sg_table = drm_gem_shmem_object_get_sg_table,
-	.vmap = drm_gem_shmem_object_vmap,
-	.vunmap = drm_gem_shmem_object_vunmap,
+	.vmap = amdxdna_gem_obj_vmap,
+	.vunmap = amdxdna_gem_obj_vunmap,
 	.mmap = amdxdna_gem_obj_mmap,
 	.vm_ops = &drm_gem_shmem_vm_ops,
 	.export = amdxdna_gem_prime_export,
@@ -494,6 +532,68 @@ amdxdna_gem_create_object_cb(struct drm_device *dev, size_t size)
 	return to_gobj(abo);
 }
 
+static struct amdxdna_gem_obj *
+amdxdna_gem_create_shmem_object(struct drm_device *dev, size_t size)
+{
+	struct drm_gem_shmem_object *shmem = drm_gem_shmem_create(dev, size);
+
+	if (IS_ERR(shmem))
+		return ERR_CAST(shmem);
+
+	shmem->map_wc = false;
+	return to_xdna_obj(&shmem->base);
+}
+
+static struct amdxdna_gem_obj *
+amdxdna_gem_create_ubuf_object(struct drm_device *dev, struct amdxdna_drm_create_bo *args)
+{
+	struct amdxdna_dev *xdna = to_xdna_dev(dev);
+	enum amdxdna_ubuf_flag flags = 0;
+	struct amdxdna_drm_va_tbl va_tbl;
+	struct drm_gem_object *gobj;
+	struct dma_buf *dma_buf;
+
+	if (copy_from_user(&va_tbl, u64_to_user_ptr(args->vaddr), sizeof(va_tbl))) {
+		XDNA_DBG(xdna, "Access va table failed");
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (va_tbl.num_entries) {
+		if (args->type == AMDXDNA_BO_CMD)
+			flags |= AMDXDNA_UBUF_FLAG_MAP_DMA;
+
+		dma_buf = amdxdna_get_ubuf(dev, flags, va_tbl.num_entries,
+					   u64_to_user_ptr(args->vaddr + sizeof(va_tbl)));
+	} else {
+		dma_buf = dma_buf_get(va_tbl.dmabuf_fd);
+	}
+
+	if (IS_ERR(dma_buf))
+		return ERR_CAST(dma_buf);
+
+	gobj = amdxdna_gem_prime_import(dev, dma_buf);
+	if (IS_ERR(gobj)) {
+		dma_buf_put(dma_buf);
+		return ERR_CAST(gobj);
+	}
+
+	dma_buf_put(dma_buf);
+
+	return to_xdna_obj(gobj);
+}
+
+static struct amdxdna_gem_obj *
+amdxdna_gem_create_object(struct drm_device *dev,
+			  struct amdxdna_drm_create_bo *args)
+{
+	size_t aligned_sz = PAGE_ALIGN(args->size);
+
+	if (args->vaddr)
+		return amdxdna_gem_create_ubuf_object(dev, args);
+
+	return amdxdna_gem_create_shmem_object(dev, aligned_sz);
+}
+
 struct drm_gem_object *
 amdxdna_gem_prime_import(struct drm_device *dev, struct dma_buf *dma_buf)
 {
@@ -545,16 +645,12 @@ amdxdna_drm_alloc_shmem(struct drm_device *dev,
 			struct drm_file *filp)
 {
 	struct amdxdna_client *client = filp->driver_priv;
-	struct drm_gem_shmem_object *shmem;
 	struct amdxdna_gem_obj *abo;
 
-	shmem = drm_gem_shmem_create(dev, args->size);
-	if (IS_ERR(shmem))
-		return ERR_CAST(shmem);
-
-	shmem->map_wc = false;
+	abo = amdxdna_gem_create_object(dev, args);
+	if (IS_ERR(abo))
+		return ERR_CAST(abo);
 
-	abo = to_xdna_obj(&shmem->base);
 	abo->client = client;
 	abo->type = AMDXDNA_BO_SHMEM;
 
@@ -569,7 +665,6 @@ amdxdna_drm_create_dev_heap(struct drm_device *dev,
 	struct amdxdna_client *client = filp->driver_priv;
 	struct iosys_map map = IOSYS_MAP_INIT_VADDR(NULL);
 	struct amdxdna_dev *xdna = to_xdna_dev(dev);
-	struct drm_gem_shmem_object *shmem;
 	struct amdxdna_gem_obj *abo;
 	int ret;
 
@@ -586,14 +681,12 @@ amdxdna_drm_create_dev_heap(struct drm_device *dev,
 		goto mm_unlock;
 	}
 
-	shmem = drm_gem_shmem_create(dev, args->size);
-	if (IS_ERR(shmem)) {
-		ret = PTR_ERR(shmem);
+	abo = amdxdna_gem_create_object(dev, args);
+	if (IS_ERR(abo)) {
+		ret = PTR_ERR(abo);
 		goto mm_unlock;
 	}
 
-	shmem->map_wc = false;
-	abo = to_xdna_obj(&shmem->base);
 	abo->type = AMDXDNA_BO_DEV_HEAP;
 	abo->client = client;
 	abo->mem.dev_addr = client->xdna->dev_info->dev_mem_base;
@@ -657,7 +750,6 @@ amdxdna_drm_create_cmd_bo(struct drm_device *dev,
 {
 	struct iosys_map map = IOSYS_MAP_INIT_VADDR(NULL);
 	struct amdxdna_dev *xdna = to_xdna_dev(dev);
-	struct drm_gem_shmem_object *shmem;
 	struct amdxdna_gem_obj *abo;
 	int ret;
 
@@ -671,12 +763,9 @@ amdxdna_drm_create_cmd_bo(struct drm_device *dev,
 		return ERR_PTR(-EINVAL);
 	}
 
-	shmem = drm_gem_shmem_create(dev, args->size);
-	if (IS_ERR(shmem))
-		return ERR_CAST(shmem);
-
-	shmem->map_wc = false;
-	abo = to_xdna_obj(&shmem->base);
+	abo = amdxdna_gem_create_object(dev, args);
+	if (IS_ERR(abo))
+		return ERR_CAST(abo);
 
 	abo->type = AMDXDNA_BO_CMD;
 	abo->client = filp->driver_priv;
@@ -691,7 +780,7 @@ amdxdna_drm_create_cmd_bo(struct drm_device *dev,
 	return abo;
 
 release_obj:
-	drm_gem_shmem_free(shmem);
+	drm_gem_object_put(to_gobj(abo));
 	return ERR_PTR(ret);
 }
 
@@ -702,7 +791,7 @@ int amdxdna_drm_create_bo_ioctl(struct drm_device *dev, void *data, struct drm_f
 	struct amdxdna_gem_obj *abo;
 	int ret;
 
-	if (args->flags || args->vaddr || !args->size)
+	if (args->flags)
 		return -EINVAL;
 
 	XDNA_DBG(xdna, "BO arg type %d vaddr 0x%llx size 0x%llx flags 0x%llx",
diff --git a/drivers/accel/amdxdna/amdxdna_ubuf.c b/drivers/accel/amdxdna/amdxdna_ubuf.c
new file mode 100644
index 000000000000..c19167ecd963
--- /dev/null
+++ b/drivers/accel/amdxdna/amdxdna_ubuf.c
@@ -0,0 +1,232 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025, Advanced Micro Devices, Inc.
+ */
+
+#include <drm/amdxdna_accel.h>
+#include <drm/drm_device.h>
+#include <drm/drm_print.h>
+#include <linux/dma-buf.h>
+#include <linux/pagemap.h>
+#include <linux/vmalloc.h>
+
+#include "amdxdna_pci_drv.h"
+#include "amdxdna_ubuf.h"
+
+struct amdxdna_ubuf_priv {
+	struct page **pages;
+	u64 nr_pages;
+	enum amdxdna_ubuf_flag flags;
+	struct mm_struct *mm;
+};
+
+static struct sg_table *amdxdna_ubuf_map(struct dma_buf_attachment *attach,
+					 enum dma_data_direction direction)
+{
+	struct amdxdna_ubuf_priv *ubuf = attach->dmabuf->priv;
+	struct sg_table *sg;
+	int ret;
+
+	sg = kzalloc(sizeof(*sg), GFP_KERNEL);
+	if (!sg)
+		return ERR_PTR(-ENOMEM);
+
+	ret = sg_alloc_table_from_pages(sg, ubuf->pages, ubuf->nr_pages, 0,
+					ubuf->nr_pages << PAGE_SHIFT, GFP_KERNEL);
+	if (ret)
+		return ERR_PTR(ret);
+
+	if (ubuf->flags & AMDXDNA_UBUF_FLAG_MAP_DMA) {
+		ret = dma_map_sgtable(attach->dev, sg, direction, 0);
+		if (ret)
+			return ERR_PTR(ret);
+	}
+
+	return sg;
+}
+
+static void amdxdna_ubuf_unmap(struct dma_buf_attachment *attach,
+			       struct sg_table *sg,
+			       enum dma_data_direction direction)
+{
+	struct amdxdna_ubuf_priv *ubuf = attach->dmabuf->priv;
+
+	if (ubuf->flags & AMDXDNA_UBUF_FLAG_MAP_DMA)
+		dma_unmap_sgtable(attach->dev, sg, direction, 0);
+
+	sg_free_table(sg);
+	kfree(sg);
+}
+
+static void amdxdna_ubuf_release(struct dma_buf *dbuf)
+{
+	struct amdxdna_ubuf_priv *ubuf = dbuf->priv;
+
+	unpin_user_pages(ubuf->pages, ubuf->nr_pages);
+	kvfree(ubuf->pages);
+	atomic64_sub(ubuf->nr_pages, &ubuf->mm->pinned_vm);
+	mmdrop(ubuf->mm);
+	kfree(ubuf);
+}
+
+static vm_fault_t amdxdna_ubuf_vm_fault(struct vm_fault *vmf)
+{
+	struct vm_area_struct *vma = vmf->vma;
+	struct amdxdna_ubuf_priv *ubuf;
+	unsigned long pfn;
+	pgoff_t pgoff;
+
+	ubuf = vma->vm_private_data;
+	pgoff = (vmf->address - vma->vm_start) >> PAGE_SHIFT;
+
+	pfn = page_to_pfn(ubuf->pages[pgoff]);
+	return vmf_insert_pfn(vma, vmf->address, pfn);
+}
+
+static const struct vm_operations_struct amdxdna_ubuf_vm_ops = {
+	.fault = amdxdna_ubuf_vm_fault,
+};
+
+static int amdxdna_ubuf_mmap(struct dma_buf *dbuf, struct vm_area_struct *vma)
+{
+	struct amdxdna_ubuf_priv *ubuf = dbuf->priv;
+
+	vma->vm_ops = &amdxdna_ubuf_vm_ops;
+	vma->vm_private_data = ubuf;
+	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
+
+	return 0;
+}
+
+static int amdxdna_ubuf_vmap(struct dma_buf *dbuf, struct iosys_map *map)
+{
+	struct amdxdna_ubuf_priv *ubuf = dbuf->priv;
+	void *kva;
+
+	kva = vmap(ubuf->pages, ubuf->nr_pages, VM_MAP, PAGE_KERNEL);
+	if (!kva)
+		return -EINVAL;
+
+	iosys_map_set_vaddr(map, kva);
+	return 0;
+}
+
+static void amdxdna_ubuf_vunmap(struct dma_buf *dbuf, struct iosys_map *map)
+{
+	vunmap(map->vaddr);
+}
+
+static const struct dma_buf_ops amdxdna_ubuf_dmabuf_ops = {
+	.map_dma_buf = amdxdna_ubuf_map,
+	.unmap_dma_buf = amdxdna_ubuf_unmap,
+	.release = amdxdna_ubuf_release,
+	.mmap = amdxdna_ubuf_mmap,
+	.vmap = amdxdna_ubuf_vmap,
+	.vunmap = amdxdna_ubuf_vunmap,
+};
+
+struct dma_buf *amdxdna_get_ubuf(struct drm_device *dev,
+				 enum amdxdna_ubuf_flag flags,
+				 u32 num_entries, void __user *va_entries)
+{
+	struct amdxdna_dev *xdna = to_xdna_dev(dev);
+	unsigned long lock_limit, new_pinned;
+	struct amdxdna_drm_va_entry *va_ent;
+	struct amdxdna_ubuf_priv *ubuf;
+	u32 npages, start = 0;
+	struct dma_buf *dbuf;
+	int i, ret;
+	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
+
+	if (!can_do_mlock())
+		return ERR_PTR(-EPERM);
+
+	ubuf = kzalloc(sizeof(*ubuf), GFP_KERNEL);
+	if (!ubuf)
+		return ERR_PTR(-ENOMEM);
+
+	ubuf->flags = flags;
+	ubuf->mm = current->mm;
+	mmgrab(ubuf->mm);
+
+	va_ent = kvcalloc(num_entries, sizeof(*va_ent), GFP_KERNEL);
+	if (!va_ent) {
+		ret = -ENOMEM;
+		goto free_ubuf;
+	}
+
+	if (copy_from_user(va_ent, va_entries, sizeof(*va_ent) * num_entries)) {
+		XDNA_DBG(xdna, "Access va entries failed");
+		ret = -EINVAL;
+		goto free_ent;
+	}
+
+	for (i = 0, exp_info.size = 0; i < num_entries; i++) {
+		if ((va_ent[i].vaddr & (PAGE_SIZE - 1)) ||
+		    (va_ent[i].len & (PAGE_SIZE - 1))) {
+			XDNA_ERR(xdna, "Invalid address or len %llx, %llx",
+				 va_ent[i].vaddr, va_ent[i].len);
+			ret = -EINVAL;
+			goto free_ent;
+		}
+
+		exp_info.size += va_ent[i].len;
+	}
+
+	ubuf->nr_pages = exp_info.size >> PAGE_SHIFT;
+	lock_limit = rlimit(RLIMIT_MEMLOCK) >> PAGE_SHIFT;
+	new_pinned = atomic64_add_return(ubuf->nr_pages, &ubuf->mm->pinned_vm);
+	if (new_pinned > lock_limit && !capable(CAP_IPC_LOCK)) {
+		XDNA_DBG(xdna, "New pin %ld, limit %ld, cap %d",
+			 new_pinned, lock_limit, capable(CAP_IPC_LOCK));
+		ret = -ENOMEM;
+		goto sub_pin_cnt;
+	}
+
+	ubuf->pages = kvmalloc_array(ubuf->nr_pages, sizeof(*ubuf->pages), GFP_KERNEL);
+	if (!ubuf->pages) {
+		ret = -ENOMEM;
+		goto sub_pin_cnt;
+	}
+
+	for (i = 0; i < num_entries; i++) {
+		npages = va_ent[i].len >> PAGE_SHIFT;
+
+		ret = pin_user_pages_fast(va_ent[i].vaddr, npages,
+					  FOLL_WRITE | FOLL_LONGTERM,
+					  &ubuf->pages[start]);
+		if (ret < 0 || ret != npages) {
+			ret = -ENOMEM;
+			XDNA_ERR(xdna, "Failed to pin pages ret %d", ret);
+			goto destroy_pages;
+		}
+
+		start += ret;
+	}
+
+	exp_info.ops = &amdxdna_ubuf_dmabuf_ops;
+	exp_info.priv = ubuf;
+	exp_info.flags = O_RDWR;
+
+	dbuf = dma_buf_export(&exp_info);
+	if (IS_ERR(dbuf)) {
+		ret = PTR_ERR(dbuf);
+		goto destroy_pages;
+	}
+	kvfree(va_ent);
+
+	return dbuf;
+
+destroy_pages:
+	if (start)
+		unpin_user_pages(ubuf->pages, start);
+	kvfree(ubuf->pages);
+sub_pin_cnt:
+	atomic64_sub(ubuf->nr_pages, &ubuf->mm->pinned_vm);
+free_ent:
+	kvfree(va_ent);
+free_ubuf:
+	mmdrop(ubuf->mm);
+	kfree(ubuf);
+	return ERR_PTR(ret);
+}
diff --git a/drivers/accel/amdxdna/amdxdna_ubuf.h b/drivers/accel/amdxdna/amdxdna_ubuf.h
new file mode 100644
index 000000000000..e5cb3bdb3ec9
--- /dev/null
+++ b/drivers/accel/amdxdna/amdxdna_ubuf.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2025, Advanced Micro Devices, Inc.
+ */
+#ifndef _AMDXDNA_UBUF_H_
+#define _AMDXDNA_UBUF_H_
+
+#include <drm/drm_device.h>
+#include <linux/dma-buf.h>
+
+enum amdxdna_ubuf_flag {
+	AMDXDNA_UBUF_FLAG_MAP_DMA = 1,
+};
+
+struct dma_buf *amdxdna_get_ubuf(struct drm_device *dev,
+				 enum amdxdna_ubuf_flag flags,
+				 u32 num_entries, void __user *va_entries);
+
+#endif /* _AMDXDNA_UBUF_H_ */
diff --git a/include/uapi/drm/amdxdna_accel.h b/include/uapi/drm/amdxdna_accel.h
index a706ead39082..ce523e9ccc52 100644
--- a/include/uapi/drm/amdxdna_accel.h
+++ b/include/uapi/drm/amdxdna_accel.h
@@ -153,6 +153,31 @@ enum amdxdna_bo_type {
 	AMDXDNA_BO_CMD,
 };
 
+/**
+ * struct amdxdna_drm_va_entry
+ * @vaddr: Virtual address.
+ * @len: Size of entry.
+ */
+struct amdxdna_drm_va_entry {
+	__u64 vaddr;
+	__u64 len;
+};
+
+/**
+ * struct amdxdna_drm_va_tbl
+ * @dmabuf_fd: The fd of dmabuf.
+ * @num_entries: Number of va entries.
+ * @va_entries: Array of va entries.
+ *
+ * The input can be either a dmabuf fd or a virtual address entry table.
+ * When dmabuf_fd is used, num_entries must be zero.
+ */
+struct amdxdna_drm_va_tbl {
+	__s32 dmabuf_fd;
+	__u32 num_entries;
+	struct amdxdna_drm_va_entry va_entries[];
+};
+
 /**
  * struct amdxdna_drm_create_bo - Create a buffer object.
  * @flags: Buffer flags. MBZ.
-- 
2.34.1

