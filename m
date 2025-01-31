Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB480A2430A
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 19:59:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B828F10E1F9;
	Fri, 31 Jan 2025 18:59:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qAq+Dgrq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2081.outbound.protection.outlook.com [40.107.94.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D73A10E1F9;
 Fri, 31 Jan 2025 18:59:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V2jHBNU5UyqQSYuyi+YK3Q1j+ocrcq3Vgnliu2YXZalkrQ/tLDim7TpFxCscR67OKDkuIfHlGX5BUJp8Xux2MACgyHfM4Vt9K0jWn395wH1577rB6LENbUUbuQJk64Glv1br4qabSFRGEnS2Sv2twQpWYAPcYRI94PHhqw8yZqwzrU+hYEp2DGGOzIN6MHXqBInXUaiUugWf9jDcVGSHMNMzANIPXdMtzmSq8S0qxMyt6IJW8VkieYaRFkdLnxL5xSiWYwgY/g8JyPe1lC0lg/HJ2eSR7LxF5hawWa504Vdrp+ZZ5aiZuwWOViT5fcHNT+bGf5QrAnxWktOnT73TnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t33WqjJ2kaM3Mq0lGgIcAGJhjPW7lUEal6Ng2n58dfM=;
 b=su369TzBGJw1TJFXkEgbhgovHuPYruS4vIY3EEhH3AmvBo/EXkr2Wlwexd5LJVJeFDVTE2y3njRvsMy/76fMo7qFr3lw7GMPt214CZ7/IAQMOErfZ/ov2IH7Zn21RG6gmAGYsJYEMynjadPQVdq0imhwCQzz4wSj/j8re1jQJZ7vHDyIe5qY3QkqS5YWKAc2i+4C9MLdO0CmzypbQNiev3ZEhdf6/enpOG+npM+lpU2q9wveeLnxJzGl+h6DAUkGzYgPLCIVG3VFJ7CrZdkviRrESadHc2cA7ng4V7STi7VYL1yNFVzkRjiwEKylXLXXJ1lwTDhqCMQQ/ElY6dHgqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t33WqjJ2kaM3Mq0lGgIcAGJhjPW7lUEal6Ng2n58dfM=;
 b=qAq+DgrqH6ZiYoEQOigl3MhFpG86jFzRUEgolG0DEHKRd2DDnH85DQxBhiVdOy1WVnQ/JEO0vZC0YOukkMAJ6K6E2sqAPo7xwnnYKPy5fDRnOWT7TG4mMvWYooxX9DDiQB63+0wuvRlbX+V5zlQhPIFZ0tkUptLKo4CZHTEaZqA=
Received: from BN0PR07CA0022.namprd07.prod.outlook.com (2603:10b6:408:141::14)
 by SN7PR12MB7935.namprd12.prod.outlook.com (2603:10b6:806:349::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Fri, 31 Jan
 2025 18:58:54 +0000
Received: from BN3PEPF0000B076.namprd04.prod.outlook.com
 (2603:10b6:408:141:cafe::e8) by BN0PR07CA0022.outlook.office365.com
 (2603:10b6:408:141::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.21 via Frontend Transport; Fri,
 31 Jan 2025 18:58:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B076.mail.protection.outlook.com (10.167.243.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 31 Jan 2025 18:58:54 +0000
Received: from fdavid-dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 31 Jan
 2025 12:58:52 -0600
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <amd-gfx@lists.freedesktop.org>, <tvrtko.ursulin@igalia.com>,
 <Christian.Koenig@amd.com>, <Felix.Kuehling@amd.com>, <Weijun.Jiang@amd.com>, 
 <dcostantino@meta.com>, <sruffell@meta.com>, David Francis
 <David.Francis@amd.com>
Subject: [PATCH] Support dmabuf IPC with amdgpu CRIU
Date: Fri, 31 Jan 2025 13:58:29 -0500
Message-ID: <20250131185829.827297-2-David.Francis@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250131185829.827297-1-David.Francis@amd.com>
References: <20250131185829.827297-1-David.Francis@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B076:EE_|SN7PR12MB7935:EE_
X-MS-Office365-Filtering-Correlation-Id: c4dac059-ecc4-412f-ed1a-08dd42294ef6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+hvyAzJ7PzLchDS90x0KdbTA70lkn9F4mc6xx7PGWpCDUmaVVVUdvcSNF7kZ?=
 =?us-ascii?Q?i0Ys/FM2GlWQMxLqj8PLDNzWvinmXhM3dgiOzSBouFXQ06aDnyF82fV/xQk2?=
 =?us-ascii?Q?kdUc5B26RTVljpxTHTyxyA7YaecYYTeOeQdJcLh6zRmmZ8rl9fVFnLjk3pxP?=
 =?us-ascii?Q?ICjahATwoPtrnVUNR/tSV1xvlpXiVBtsf0xwmhBctqQ80uhdQAWXJlH0R55d?=
 =?us-ascii?Q?PJCFFOPHUR2z/G8niAGlApY9iLYhcDIBYmNX58qdJ4lp3sESfNh660gjsjHr?=
 =?us-ascii?Q?aSAQ978mu7D+jz84aplnqzfGA+Ck1u5NG1jaDDpGD37u9a5dGGjaoiAyw0QP?=
 =?us-ascii?Q?AYFvEu5VfAAkabdBAh56E971QkHXHhJFMgRUcUFlNqMzfcDZf9vHlB7Fqgqg?=
 =?us-ascii?Q?8NYsp8w2NMuUNNRCCxrjziVVBh3ecnHk0AjEB7U/3J3AsApG18F9eW79+jFO?=
 =?us-ascii?Q?UdsxLgu2PbizgN+I72guUCO/p7RIuFFwr2E0C+kFB6VKJm2x9J1D1mJKQsUy?=
 =?us-ascii?Q?ev3MajjGHzseB4E70DL+5cMxGW4v56FzVyWSbSN3jTMF5Ff/L0sL4xYrz6h8?=
 =?us-ascii?Q?LRyGa7l1VqZkokfMHNVlFp+D2aWyeqI3yCbT16Ryibt8gC0XNdIIw4E8U8Y2?=
 =?us-ascii?Q?o61w52P8B11V6bJjCij6huOi6oCBkWo6mM/xJBAoIamttNf/0kpDYCgrqnok?=
 =?us-ascii?Q?BkI7zDBI9czsv8ZL27X5lJlQl6GbND7aPArC3fDy3Gxed2LGyCQDUZLiR2Qe?=
 =?us-ascii?Q?Y+k0vhjvnX0chz37QMamjzMjY47KjTvCpaRH31MtUUPFAh6yiVU8wYZUMJEs?=
 =?us-ascii?Q?MWJfaslUUku9amndIRNr1HSJOBiUId6ESD21Yw07Z8XmPmDhdHE+8AxkTLEx?=
 =?us-ascii?Q?bt1KL6iDRnvz1YAQPL6wRT7pshgy3Kf0H5i/PyNvYJYux9iJTQmUGhmvcaig?=
 =?us-ascii?Q?50/OJfTSkoBOj6u5kZxXKQ8MWVtPbZgi1ddZVvpMqL0Zd/P/tpzOuTcLBQLw?=
 =?us-ascii?Q?OhnvDPD5WV4n4Fl7eJGGZNXl5TOZVRxqxJFn241ElhVHZH3ddLiQ3s/gQRky?=
 =?us-ascii?Q?LMWdYpOB3EJWhq5uywuIrVcfTStZf0BEt0OsPpVh/vDkxykRYTzQmlIH4igF?=
 =?us-ascii?Q?c/RlYsNAoPCKLYmOKPW+dXx5JUiM9HVWvkWZqLId+qeqqHkvoGVmbs/3qCZp?=
 =?us-ascii?Q?qJRT8mKFMBNpISgocZOZBAE7W877FAzRONnU4SW9tQMEx4gcrY3Xy/ShWhOd?=
 =?us-ascii?Q?mB/DFb0L4NUuPHj8Qm3lLBLXGmZLCDp6IxlSKCtIDDFv1ps/FcayaXZdWAfz?=
 =?us-ascii?Q?I3TTkrcUFyU0uqFCrxtSXURBbWDEWF/0YupcXkwF5zm1UOAKm8qN/vxzvSoG?=
 =?us-ascii?Q?LasXyzlAYz30ImCUivTIUwqkBDzxtPQi1uWbHwzYiFF9uIRcgCmm0CmqWJGv?=
 =?us-ascii?Q?853zNjzDIBbyUlNQfMLjpqDPETsOXK8mExiVhsAqMTXucuezPAxGKw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 18:58:54.1595 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4dac059-ecc4-412f-ed1a-08dd42294ef6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B076.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7935
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

This patch (in combination with the accompanying CRIU patch)
allows the amdgpu CRIU plugin to support dmabuf IPC.

It includes
- A new amdgpu ioctl (amdgpu_criu_op_ioctl), which has similar
	options to kfd_ioctl_criu, and accompanying structs.
- New "is_retry" field in amdkfd CRIU ioctls, to indicate when.
	a restore op is a retry and certain parts of the
	restore should not be re-done.
- New "skip" field in amdkfd CRIU bo buckets, to indicate when
	a bo cannot currently be restored and should be ignored.
- Two new drm functions, drm_prime_assign_handle and
	drm_gem_handle_create_assigned. These are similar to
	drm_gem_prime_fd_to_handle and drm_gem_handle_create
	but allow the caller to specify a gem handle.

Still TODO:
- Backwards compatibility between new kernel and old CRIU

Signed-off-by: David Francis <David.Francis@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/Makefile      |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c | 401 +++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h |  24 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c  |   2 +
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |  37 ++-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |   2 +-
 drivers/gpu/drm/drm_prime.c              | 146 +++++++++
 include/drm/drm_prime.h                  |   7 +
 include/uapi/drm/amdgpu_drm.h            |  46 +++
 include/uapi/linux/kfd_ioctl.h           |   4 +-
 10 files changed, 653 insertions(+), 18 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h

diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
index 6cb3a2b2725a..eac5a455e6de 100644
--- a/drivers/gpu/drm/amd/amdgpu/Makefile
+++ b/drivers/gpu/drm/amd/amdgpu/Makefile
@@ -63,7 +63,7 @@ amdgpu-y += amdgpu_device.o amdgpu_doorbell_mgr.o amdgpu_kms.o \
 	amdgpu_xgmi.o amdgpu_csa.o amdgpu_ras.o amdgpu_vm_cpu.o \
 	amdgpu_vm_sdma.o amdgpu_discovery.o amdgpu_ras_eeprom.o amdgpu_nbio.o \
 	amdgpu_umc.o smu_v11_0_i2c.o amdgpu_fru_eeprom.o amdgpu_rap.o \
-	amdgpu_fw_attestation.o amdgpu_securedisplay.o \
+	amdgpu_fw_attestation.o amdgpu_securedisplay.o amdgpu_criu.o \
 	amdgpu_eeprom.o amdgpu_mca.o amdgpu_psp_ta.o amdgpu_lsdma.o \
 	amdgpu_ring_mux.o amdgpu_xcp.o amdgpu_seq64.o amdgpu_aca.o amdgpu_dev_coredump.o \
 	amdgpu_userq_fence.o amdgpu_eviction_fence.o
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c
new file mode 100644
index 000000000000..4f3e5cb61323
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c
@@ -0,0 +1,401 @@
+
+
+#include <linux/dma-buf.h>
+#include <linux/hashtable.h>
+#include <linux/mutex.h>
+#include <linux/random.h>
+
+#include <drm/amdgpu_drm.h>
+#include <drm/drm_device.h>
+#include <drm/drm_file.h>
+
+#include "amdgpu_criu.h"
+
+#include <drm/amdgpu_drm.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_exec.h>
+#include <drm/drm_gem_ttm_helper.h>
+#include <drm/ttm/ttm_tt.h>
+
+#include "amdgpu.h"
+#include "amdgpu_display.h"
+#include "amdgpu_dma_buf.h"
+#include "amdgpu_hmm.h"
+#include "amdgpu_xgmi.h"
+
+static bool is_import(struct amdgpu_bo *bo) {
+	if (bo->tbo.base.import_attach)
+		return &bo->tbo.base != (struct drm_gem_object *)bo->tbo.base.import_attach->dmabuf->priv;
+	return false;
+}
+
+static int reserve_bo_and_vm(struct amdgpu_bo *bo,
+			      struct amdgpu_vm *vm,
+			      struct drm_exec *exec)
+{
+	int ret;
+
+	WARN_ON(!vm);
+
+	drm_exec_init(exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
+	drm_exec_until_all_locked(exec) {
+		ret = amdgpu_vm_lock_pd(vm, exec, 2);
+		drm_exec_retry_on_contention(exec);
+		if (unlikely(ret))
+			goto error;
+
+		ret = drm_exec_prepare_obj(exec, &bo->tbo.base, 1);
+		drm_exec_retry_on_contention(exec);
+		if (unlikely(ret))
+			goto error;
+	}
+	return 0;
+
+error:
+	pr_err("Failed to reserve buffers in ttm.\n");
+	drm_exec_fini(exec);
+	return ret;
+}
+
+static void unreserve_bo_and_vm(struct drm_exec *exec)
+{
+	drm_exec_fini(exec);
+}
+
+static int amdgpu_criu_process_info(struct drm_device *dev, struct drm_file *data,
+			    struct drm_amdgpu_criu_args *args) {
+	struct drm_gem_object *gobj;
+	int id;
+	int num_bos = 0;
+	int num_vm_mappings = 0;
+	struct amdgpu_vm *avm = &((struct amdgpu_fpriv *)data->driver_priv)->vm;
+
+	spin_lock(&data->table_lock);
+	idr_for_each_entry(&data->object_idr, gobj, id) {
+		struct amdgpu_bo *bo = gem_to_amdgpu_bo(gobj);
+		struct amdgpu_vm_bo_base *vm_bo_base;
+
+		num_bos += 1;
+
+		vm_bo_base = bo->vm_bo;
+
+		while(vm_bo_base) {
+			struct amdgpu_bo_va *bo_va = container_of(vm_bo_base, struct amdgpu_bo_va, base);
+			struct amdgpu_bo_va_mapping *mapping;
+
+			if (vm_bo_base->vm == avm) {
+
+				list_for_each_entry(mapping, &bo_va->invalids, list) {
+					num_vm_mappings += 1;
+				}
+				list_for_each_entry(mapping, &bo_va->valids, list) {
+					num_vm_mappings += 1;
+				}
+			}
+
+			vm_bo_base = vm_bo_base->next;
+		}
+	}
+	spin_unlock(&data->table_lock);
+
+	args->num_bos = num_bos;
+	args->priv_data_size = sizeof(struct drm_amdgpu_criu_bo_priv_data) * num_bos + sizeof(struct drm_amdgpu_criu_vm_mapping_priv_data) * num_vm_mappings;
+	args->num_objs = num_vm_mappings;
+	args->pid = avm->task_info->pid;
+
+	return 0;
+}
+
+static int amdgpu_criu_checkpoint(struct drm_device *dev, struct drm_file *data,
+			    struct drm_amdgpu_criu_args *args) {
+	struct drm_gem_object *gobj;
+	struct amdgpu_vm *avm = &((struct amdgpu_fpriv *)data->driver_priv)->vm;
+	int id;
+	int num_bos = 0;
+	int ret;
+	struct drm_amdgpu_criu_bo_bucket *bo_buckets;
+	struct drm_amdgpu_criu_bo_priv_data *bo_privs;
+	struct drm_amdgpu_criu_vm_mapping_priv_data *vm_privs;
+	int vm_priv_index = 0;
+	int bo_index = 0;
+	int fd;
+
+	spin_lock(&data->table_lock);
+	idr_for_each_entry(&data->object_idr, gobj, id) {
+		num_bos += 1;
+	}
+	spin_unlock(&data->table_lock);
+
+	if (args->num_bos != num_bos) {
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	bo_buckets = kvzalloc(num_bos * sizeof(*bo_buckets), GFP_KERNEL);
+	if (!bo_buckets)
+		return -ENOMEM;
+
+	bo_privs = kvzalloc(num_bos * sizeof(*bo_privs), GFP_KERNEL);
+	if (!bo_privs)
+		return -ENOMEM;
+
+	vm_privs = kvzalloc(args->num_objs * sizeof(*vm_privs), GFP_KERNEL);
+	if (!vm_privs)
+		return -ENOMEM;
+
+	idr_for_each_entry(&data->object_idr, gobj, id) {
+		struct amdgpu_bo *bo = gem_to_amdgpu_bo(gobj);
+		struct drm_amdgpu_criu_bo_bucket *bo_bucket;
+		struct drm_amdgpu_criu_bo_priv_data *bo_priv;
+		struct amdgpu_vm_bo_base *vm_bo_base;
+		struct amdgpu_bo *main_bo;
+
+		bo_bucket = &bo_buckets[bo_index];
+		bo_priv = &bo_privs[bo_index];
+
+		bo_bucket->size = amdgpu_bo_size(bo);
+		bo_bucket->offset = amdgpu_bo_mmap_offset(bo);
+		bo_bucket->alloc_flags = bo->flags;
+		bo_bucket->preferred_domains = bo->preferred_domains;
+
+		bo_priv->idr_handle = id;
+		bo_bucket->is_import = is_import(bo);
+
+		main_bo = bo;
+		if (is_import(main_bo)) {
+			main_bo = gem_to_amdgpu_bo(bo->tbo.base.import_attach->dmabuf->priv);
+		}
+
+		drm_gem_prime_handle_to_fd(dev, data, id, 0, &fd);
+		if (fd) {
+			bo_bucket->dmabuf_fd = fd;
+		}
+
+		vm_bo_base = bo->vm_bo;
+
+		while(vm_bo_base) {
+			struct amdgpu_bo_va *bo_va = container_of(vm_bo_base, struct amdgpu_bo_va, base);
+			struct amdgpu_bo_va_mapping *mapping;
+
+			if (vm_bo_base->vm == avm) {
+				list_for_each_entry(mapping, &bo_va->invalids, list) {
+					vm_privs[vm_priv_index].start = mapping->start;
+					vm_privs[vm_priv_index].last = mapping->last;
+					vm_privs[vm_priv_index].offset = mapping->offset;
+					vm_privs[vm_priv_index].flags = mapping->flags;
+					vm_privs[vm_priv_index].idr_handle = id;
+					vm_priv_index += 1;
+
+					bo_bucket->addr = mapping->start * 0x1000;
+				}
+				list_for_each_entry(mapping, &bo_va->valids, list) {
+					vm_privs[vm_priv_index].start = mapping->start;
+					vm_privs[vm_priv_index].last = mapping->last;
+					vm_privs[vm_priv_index].offset = mapping->offset;
+					vm_privs[vm_priv_index].flags = mapping->flags;
+					vm_privs[vm_priv_index].idr_handle = id;
+					vm_priv_index += 1;
+
+					bo_bucket->addr = mapping->start * 0x1000;
+				}
+			}
+
+			vm_bo_base = vm_bo_base->next;
+		}
+
+		bo_index += 1;
+	}
+
+	ret = copy_to_user((void *)args->bos, bo_buckets, num_bos * sizeof(*bo_buckets));
+	if (ret) {
+		pr_err("Failed to copy BO information to user\n");
+		ret = -EFAULT;
+		goto exit;
+	}
+
+	ret = copy_to_user((void *)args->priv_data, bo_privs, num_bos * sizeof(*bo_privs));
+	if (ret) {
+		pr_err("Failed to copy BO PRIV information to user\n");
+		ret = -EFAULT;
+		goto exit;
+	}
+	ret = copy_to_user((void *)(args->priv_data + sizeof(struct drm_amdgpu_criu_bo_priv_data) * num_bos), vm_privs, args->num_objs * sizeof(*vm_privs));
+	if (ret) {
+		pr_err("Failed to copy VM PRIV information to user\n");
+		ret = -EFAULT;
+		goto exit;
+	}
+
+	exit:
+	kvfree(bo_buckets);
+	kvfree(bo_privs);
+	return ret;
+}
+
+static int amdgpu_criu_unpause(struct drm_device *dev, struct drm_file *data,
+			    struct drm_amdgpu_criu_args *args) {
+	return 0;
+}
+
+static int amdgpu_criu_restore(struct drm_device *dev, struct drm_file *data,
+			    struct drm_amdgpu_criu_args *args) {
+	int i;
+	struct drm_amdgpu_criu_bo_bucket *bo_buckets;
+	struct drm_amdgpu_criu_bo_priv_data *bo_privs;
+	struct drm_amdgpu_criu_vm_mapping_priv_data *vm_privs;
+	struct amdgpu_vm *avm = &((struct amdgpu_fpriv *)data->driver_priv)->vm;
+	struct amdgpu_fpriv *fpriv = (struct amdgpu_fpriv *)data->driver_priv;
+	struct amdgpu_device *adev = drm_to_adev(dev);
+	struct amdgpu_bo *restored_bo;
+	int ret;
+
+	bo_buckets = kvzalloc(args->num_bos * sizeof(*bo_buckets), GFP_KERNEL);
+	if (!bo_buckets)
+		return -ENOMEM;
+	ret = copy_from_user(bo_buckets, (void *)args->bos, args->num_bos * sizeof(*bo_buckets));
+	if (ret)
+		return -EINVAL;
+
+	bo_privs = kvzalloc(args->num_bos * sizeof(*bo_privs), GFP_KERNEL);
+	if (!bo_privs)
+		return -ENOMEM;
+	ret = copy_from_user(bo_privs, (void *)args->priv_data, args->num_bos * sizeof(*bo_privs));
+	if (ret)
+		return -EINVAL;
+
+	vm_privs = kvzalloc(args->num_objs * sizeof(*vm_privs), GFP_KERNEL);
+	if (!vm_privs)
+		return -ENOMEM;
+	ret = copy_from_user(vm_privs, (void *)(args->priv_data + sizeof(struct drm_amdgpu_criu_bo_priv_data) * args->num_bos), args->num_objs * sizeof(*vm_privs));
+	if (ret)
+		return -EINVAL;
+
+	for (i = 0; i < args->num_bos; i++) {
+		struct drm_amdgpu_criu_bo_bucket *bo_bucket = &bo_buckets[i];
+		struct drm_amdgpu_criu_bo_priv_data *bo_priv = &bo_privs[i];
+		struct amdgpu_bo *bo;
+
+		if (bo_bucket->skip)
+			continue;
+
+		if (!bo_bucket->is_import) {
+			struct drm_gem_object *obj;
+			enum ttm_bo_type type = ttm_bo_type_device;
+			int xcp_id = -1;
+			int prime_fd;
+
+			if (bo_bucket->preferred_domains == AMDGPU_GEM_DOMAIN_VRAM) {
+				xcp_id = fpriv->xcp_id == AMDGPU_XCP_NO_PARTITION ?
+							0 : fpriv->xcp_id;
+			}
+			amdgpu_gem_object_create(adev, bo_bucket->size, 1, bo_bucket->preferred_domains,
+				bo_bucket->alloc_flags, type, NULL, &obj, xcp_id + 1);
+
+			bo = gem_to_amdgpu_bo(obj);
+
+			ret = drm_gem_handle_create_assigned(data, obj, bo_priv->idr_handle);
+
+			restored_bo = bo;
+
+			bo_bucket->restored_offset = amdgpu_bo_mmap_offset(restored_bo);
+
+			ret = drm_gem_prime_handle_to_fd(dev,
+			       data, bo_priv->idr_handle,
+			       DRM_RDWR,
+			       &prime_fd);
+
+			bo_bucket->dmabuf_fd = prime_fd;
+		}
+		else {
+			struct drm_gem_object *obj;
+			int ret;
+
+			if (bo->kfd_bo) {
+				ret = drm_prime_assign_handle(dev, data, bo_bucket->dmabuf_fd, bo_priv->idr_handle, &obj);
+				if (ret)
+					goto exit;
+
+				if (obj != &bo->tbo.base)
+					restored_bo = gem_to_amdgpu_bo(obj);
+				else
+					restored_bo = bo;
+
+				bo_bucket->restored_offset = amdgpu_bo_mmap_offset(restored_bo);
+			}
+		}
+
+
+		for (i = 0; i < args->num_objs; i++) {
+			struct drm_amdgpu_criu_vm_mapping_priv_data *vm_priv = &vm_privs[i];
+			struct amdgpu_bo_va *bo_va;
+			struct drm_exec exec;
+
+			if (vm_priv->idr_handle != bo_priv->idr_handle)
+				continue;
+
+			reserve_bo_and_vm(restored_bo, avm, &exec);
+
+			bo_va = amdgpu_vm_bo_find(avm, restored_bo);
+			if (!bo_va)
+				bo_va = amdgpu_vm_bo_add(adev, avm, restored_bo);
+
+			amdgpu_vm_bo_map(adev,
+			     bo_va,
+			     vm_priv->start * AMDGPU_GPU_PAGE_SIZE, vm_priv->offset,
+			     (vm_priv->last - vm_priv->start + 1) * AMDGPU_GPU_PAGE_SIZE, vm_priv->flags);
+
+			ret = amdgpu_vm_bo_update(adev, bo_va, false);
+
+			ret = amdgpu_vm_update_pdes(adev, avm, false);
+
+			unreserve_bo_and_vm(&exec);
+
+		}
+	}
+
+	ret = copy_to_user((void *)args->bos, bo_buckets, args->num_bos * sizeof(*bo_buckets));
+	if (ret) {
+		pr_err("Failed to copy BO information to user\n");
+		ret = -EFAULT;
+		goto exit;
+	}
+
+
+	exit:
+	return ret;
+}
+
+static int amdgpu_criu_resume(struct drm_device *dev, struct drm_file *data,
+			    struct drm_amdgpu_criu_args *args) {
+	return 0;
+}
+
+int amdgpu_criu_op_ioctl(struct drm_device *dev, void *data,
+			    struct drm_file *filp)
+{
+	struct drm_amdgpu_criu_args *args = data;
+	int ret;
+
+	switch (args->op) {
+	case AMDGPU_CRIU_OP_PROCESS_INFO:
+		ret = amdgpu_criu_process_info(dev, filp, args);
+		break;
+	case AMDGPU_CRIU_OP_CHECKPOINT:
+		ret = amdgpu_criu_checkpoint(dev, filp, args);
+		break;
+	case AMDGPU_CRIU_OP_UNPAUSE:
+		ret = amdgpu_criu_unpause(dev, filp, args);
+		break;
+	case AMDGPU_CRIU_OP_RESTORE:
+		ret = amdgpu_criu_restore(dev, filp, args);
+		break;
+	case AMDGPU_CRIU_OP_RESUME:
+		ret = amdgpu_criu_resume(dev, filp, args);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
\ No newline at end of file
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h
new file mode 100644
index 000000000000..35fbb1ffdd71
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h
@@ -0,0 +1,24 @@
+#ifndef __AMDGPU_CRIU_H__
+#define __AMDGPU_CRIU_H__
+
+#include <drm/amdgpu_drm.h>
+
+int amdgpu_criu_op_ioctl(struct drm_device *dev, void *data,
+			    struct drm_file *filp);
+
+struct amdgpu_bo *bo_from_criu_global_handle(uint8_t *handle);
+int insert_bo_at_criu_global_handle(struct amdgpu_bo *bo, uint8_t *handle);
+
+struct drm_amdgpu_criu_bo_priv_data {
+	uint32_t idr_handle; // IDR for drm gem idr
+};
+
+struct drm_amdgpu_criu_vm_mapping_priv_data {
+	uint64_t start;
+    uint64_t last;
+    uint64_t offset;
+    uint64_t flags;
+    uint32_t idr_handle;
+};
+
+#endif
\ No newline at end of file
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index acb9dc3705ac..12d844598efc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -53,6 +53,7 @@
 #include "amdgpu_xgmi.h"
 #include "amdgpu_userqueue.h"
 #include "amdgpu_userq_fence.h"
+#include "amdgpu_criu.h"
 #include "../amdxcp/amdgpu_xcp_drv.h"
 
 /*
@@ -2909,6 +2910,7 @@ const struct drm_ioctl_desc amdgpu_ioctls_kms[] = {
 	DRM_IOCTL_DEF_DRV(AMDGPU_USERQ, amdgpu_userq_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(AMDGPU_USERQ_SIGNAL, amdgpu_userq_signal_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(AMDGPU_USERQ_WAIT, amdgpu_userq_wait_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(AMDGPU_CRIU_OP, amdgpu_criu_op_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
 };
 
 static const struct drm_driver amdgpu_kms_driver = {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 065d87841459..2a535a1870fa 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -45,6 +45,8 @@
 #include "amdgpu_dma_buf.h"
 #include "kfd_debug.h"
 
+#include "amdgpu_criu.h"
+
 static long kfd_ioctl(struct file *, unsigned int, unsigned long);
 static int kfd_open(struct inode *, struct file *);
 static int kfd_release(struct inode *, struct file *);
@@ -2469,7 +2471,8 @@ static int criu_restore_bos(struct kfd_process *p,
 
 	/* Create and map new BOs */
 	for (; i < args->num_bos; i++) {
-		ret = criu_restore_bo(p, &bo_buckets[i], &bo_privs[i], &files[i]);
+		if (!bo_buckets[i].skip)
+			ret = criu_restore_bo(p, &bo_buckets[i], &bo_privs[i], &files[i]);
 		if (ret) {
 			pr_debug("Failed to restore BO[%d] ret%d\n", i, ret);
 			goto exit;
@@ -2558,7 +2561,7 @@ static int criu_restore(struct file *filep,
 		 args->num_devices, args->num_bos, args->num_objects, args->priv_data_size);
 
 	if (!args->bos || !args->devices || !args->priv_data || !args->priv_data_size ||
-	    !args->num_devices || !args->num_bos)
+	    !args->num_devices)
 		return -EINVAL;
 
 	mutex_lock(&p->mutex);
@@ -2567,26 +2570,30 @@ static int criu_restore(struct file *filep,
 	 * Set the process to evicted state to avoid running any new queues before all the memory
 	 * mappings are ready.
 	 */
-	ret = kfd_process_evict_queues(p, KFD_QUEUE_EVICTION_CRIU_RESTORE);
-	if (ret)
-		goto exit_unlock;
+	if (!args->is_retry) {
+		ret = kfd_process_evict_queues(p, KFD_QUEUE_EVICTION_CRIU_RESTORE);
+		if (ret)
+			goto exit_unlock;
 
-	/* Each function will adjust priv_offset based on how many bytes they consumed */
-	ret = criu_restore_process(p, args, &priv_offset, args->priv_data_size);
-	if (ret)
-		goto exit_unlock;
+		/* Each function will adjust priv_offset based on how many bytes they consumed */
+		ret = criu_restore_process(p, args, &priv_offset, args->priv_data_size);
+		if (ret)
+			goto exit_unlock;
 
-	ret = criu_restore_devices(p, args, &priv_offset, args->priv_data_size);
-	if (ret)
-		goto exit_unlock;
+		ret = criu_restore_devices(p, args, &priv_offset, args->priv_data_size);
+		if (ret)
+			goto exit_unlock;
+	}
 
 	ret = criu_restore_bos(p, args, &priv_offset, args->priv_data_size);
 	if (ret)
 		goto exit_unlock;
 
-	ret = criu_restore_objects(filep, p, args, &priv_offset, args->priv_data_size);
-	if (ret)
-		goto exit_unlock;
+	if (!args->is_retry) {
+		ret = criu_restore_objects(filep, p, args, &priv_offset, args->priv_data_size);
+		if (ret)
+			goto exit_unlock;
+	}
 
 	if (priv_offset != args->priv_data_size) {
 		pr_err("Invalid private data size\n");
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index c32b255c0eb2..fd81275b8724 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -1207,7 +1207,7 @@ int kfd_process_init_cwsr_apu(struct kfd_process *process, struct file *filep);
  * kfd_criu_svm_range_priv_data
  */
 
-#define KFD_CRIU_PRIV_VERSION 1
+#define KFD_CRIU_PRIV_VERSION 2
 
 struct kfd_criu_process_priv_data {
 	uint32_t version;
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 0e3f8adf162f..8f6e7c064aaf 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -1084,3 +1084,149 @@ void drm_prime_gem_destroy(struct drm_gem_object *obj, struct sg_table *sg)
 	dma_buf_put(dma_buf);
 }
 EXPORT_SYMBOL(drm_prime_gem_destroy);
+
+int drm_prime_assign_handle(struct drm_device *dev,
+			       struct drm_file *file_priv, int prime_fd,
+			       uint32_t handle, struct drm_gem_object **gem_obj)
+{
+	struct drm_gem_object *obj;
+	int ret;
+	int existing_handle;
+	struct dma_buf *dma_buf;
+
+	dma_buf = dma_buf_get(prime_fd);
+	if (IS_ERR(dma_buf))
+		return PTR_ERR(dma_buf);
+
+	mutex_lock(&file_priv->prime.lock);
+
+	ret = drm_prime_lookup_buf_handle(&file_priv->prime,
+			dma_buf, &existing_handle);
+	if (ret == 0)
+		goto out_put;
+
+	/* never seen this one, need to import */
+	mutex_lock(&dev->object_name_lock);
+	if (dev->driver->gem_prime_import)
+		obj = dev->driver->gem_prime_import(dev, dma_buf);
+	else
+		obj = drm_gem_prime_import(dev, dma_buf);
+	if (IS_ERR(obj)) {
+		ret = PTR_ERR(obj);
+		goto out_unlock;
+	}
+
+	*gem_obj = obj;
+
+	if (obj->dma_buf) {
+		WARN_ON(obj->dma_buf != dma_buf);
+	} else {
+		obj->dma_buf = dma_buf;
+		get_dma_buf(dma_buf);
+	}
+
+	obj->handle_count++;
+
+	drm_gem_object_get(obj);
+
+	/* _handle_create_tail unconditionally unlocks dev->object_name_lock. */
+	idr_preload(GFP_KERNEL);
+	spin_lock(&file_priv->table_lock);
+
+	ret = idr_alloc(&file_priv->object_idr, obj, handle, handle + 1, GFP_NOWAIT);
+
+	spin_unlock(&file_priv->table_lock);
+	idr_preload_end();
+	mutex_unlock(&dev->object_name_lock);
+	if (ret < 0)
+		return ret;
+
+	ret = drm_vma_node_allow(&obj->vma_node, file_priv);
+	if (ret)
+		return ret;
+
+	if (obj->funcs->open) {
+		ret = obj->funcs->open(obj, file_priv);
+		if (ret)
+			return ret;
+	}
+
+	drm_gem_object_put(obj);
+
+	ret = drm_prime_add_buf_handle(&file_priv->prime,
+			dma_buf, handle);
+	mutex_unlock(&file_priv->prime.lock);
+	if (ret)
+		goto fail;
+
+	dma_buf_put(dma_buf);
+
+	return 0;
+
+fail:
+	/* hmm, if driver attached, we are relying on the free-object path
+	 * to detach.. which seems ok..
+	 */
+	drm_gem_handle_delete(file_priv, handle);
+	dma_buf_put(dma_buf);
+	return ret;
+
+out_unlock:
+	mutex_unlock(&dev->object_name_lock);
+out_put:
+	mutex_unlock(&file_priv->prime.lock);
+	dma_buf_put(dma_buf);
+	return ret;
+}
+EXPORT_SYMBOL(drm_prime_assign_handle);
+
+int drm_gem_handle_create_assigned(struct drm_file *file_priv,
+			   struct drm_gem_object *obj,
+			   uint32_t handle)
+{
+	struct drm_device *dev = obj->dev;
+	int ret;
+
+	mutex_lock(&dev->object_name_lock);
+
+	WARN_ON(!mutex_is_locked(&dev->object_name_lock));
+	if (obj->handle_count++ == 0)
+		drm_gem_object_get(obj);
+
+	/*
+	 * Get the user-visible handle using idr.  Preload and perform
+	 * allocation under our spinlock.
+	 */
+	idr_preload(GFP_KERNEL);
+	spin_lock(&file_priv->table_lock);
+
+	ret = idr_alloc(&file_priv->object_idr, obj, handle, handle + 1, GFP_NOWAIT);
+
+	spin_unlock(&file_priv->table_lock);
+	idr_preload_end();
+
+	mutex_unlock(&dev->object_name_lock);
+	if (ret < 0)
+		goto err_unref;
+
+	ret = drm_vma_node_allow(&obj->vma_node, file_priv);
+	if (ret)
+		goto err_remove;
+
+	if (obj->funcs->open) {
+		ret = obj->funcs->open(obj, file_priv);
+		if (ret)
+			goto err_revoke;
+	}
+	return 0;
+
+err_revoke:
+	drm_vma_node_revoke(&obj->vma_node, file_priv);
+err_remove:
+	spin_lock(&file_priv->table_lock);
+	idr_remove(&file_priv->object_idr, handle);
+	spin_unlock(&file_priv->table_lock);
+err_unref:
+	return ret;
+}
+EXPORT_SYMBOL(drm_gem_handle_create_assigned);
\ No newline at end of file
diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
index fa085c44d4ca..591ed81acb84 100644
--- a/include/drm/drm_prime.h
+++ b/include/drm/drm_prime.h
@@ -112,5 +112,12 @@ int drm_prime_sg_to_page_array(struct sg_table *sgt, struct page **pages,
 			       int max_pages);
 int drm_prime_sg_to_dma_addr_array(struct sg_table *sgt, dma_addr_t *addrs,
 				   int max_pages);
+int drm_prime_assign_handle(struct drm_device *dev,
+			       struct drm_file *file_priv, int prime_fd,
+			       uint32_t handle, struct drm_gem_object **gem_obj);
+
+int drm_gem_handle_create_assigned(struct drm_file *file_priv,
+			   struct drm_gem_object *obj,
+			   uint32_t handle);
 
 #endif /* __DRM_PRIME_H__ */
diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
index 8191d0bd0c00..c6766fe5c1bc 100644
--- a/include/uapi/drm/amdgpu_drm.h
+++ b/include/uapi/drm/amdgpu_drm.h
@@ -57,6 +57,7 @@ extern "C" {
 #define DRM_AMDGPU_USERQ		0x16
 #define DRM_AMDGPU_USERQ_SIGNAL		0x17
 #define DRM_AMDGPU_USERQ_WAIT		0x18
+#define DRM_AMDGPU_CRIU_OP		0x19
 
 #define DRM_IOCTL_AMDGPU_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_CREATE, union drm_amdgpu_gem_create)
 #define DRM_IOCTL_AMDGPU_GEM_MMAP	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_MMAP, union drm_amdgpu_gem_mmap)
@@ -77,6 +78,7 @@ extern "C" {
 #define DRM_IOCTL_AMDGPU_USERQ		DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ, union drm_amdgpu_userq)
 #define DRM_IOCTL_AMDGPU_USERQ_SIGNAL	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ_SIGNAL, struct drm_amdgpu_userq_signal)
 #define DRM_IOCTL_AMDGPU_USERQ_WAIT	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ_WAIT, struct drm_amdgpu_userq_wait)
+#define DRM_IOCTL_AMDGPU_CRIU_OP	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_CRIU_OP, struct drm_amdgpu_criu_args)
 
 /**
  * DOC: memory domains
@@ -1585,6 +1587,50 @@ struct drm_color_ctm_3x4 {
 	__u64 matrix[12];
 };
 
+/* CRIU ioctl
+ *
+ * When checkpointing a process, the CRIU amdgpu plugin will perform:
+ * 1. INFO op to get information about state that needs to be saved. This
+ *    pauses execution until the checkpoint is done.
+ * 2. CHECKPOINT op to save state (BOs for now, TODO: CS contexts)
+ * 3. UNPAUSE op to resume execution when the checkpoint is done.
+ *
+ * When restoring a process, the CRIU amdgpu plugin will perform:
+ *
+ * 1. RESTORE op to restore state
+ * 2. RESUME op to restore userptr mappings (TODO)
+ */
+enum drm_amdgpu_criu_op {
+    AMDGPU_CRIU_OP_PROCESS_INFO,
+    AMDGPU_CRIU_OP_CHECKPOINT,
+    AMDGPU_CRIU_OP_UNPAUSE,
+    AMDGPU_CRIU_OP_RESTORE,
+    AMDGPU_CRIU_OP_RESUME,
+};
+
+struct drm_amdgpu_criu_args {
+    __u64 bos; /* user pointer to bos array */
+    __u64 priv_data; /* user pointer to private data */
+    __u64 priv_data_size;
+    __u32 num_bos;
+    __u32 num_objs;
+    __u32 pid;
+    __u32 op;
+    __u8 is_retry: 1;
+};
+
+struct drm_amdgpu_criu_bo_bucket {
+    __u64 addr;
+    __u64 size;
+    __u64 offset;
+    __u64 restored_offset;    /* During restore, updated offset for BO */
+    __u64 alloc_flags;
+    __u32 preferred_domains;
+    __u32 dmabuf_fd;
+	__u8 is_import: 1;
+	__u8 skip: 1;
+};
+
 #if defined(__cplusplus)
 }
 #endif
diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioctl.h
index fa9f9846b88e..8c3f3a51857f 100644
--- a/include/uapi/linux/kfd_ioctl.h
+++ b/include/uapi/linux/kfd_ioctl.h
@@ -698,6 +698,7 @@ struct kfd_ioctl_criu_args {
 	__u32 num_objects;	/* Used during ops: PROCESS_INFO, RESTORE */
 	__u32 pid;		/* Used during ops: PROCESS_INFO, RESUME */
 	__u32 op;
+	__u8 is_retry: 1;
 };
 
 struct kfd_criu_device_bucket {
@@ -715,7 +716,8 @@ struct kfd_criu_bo_bucket {
 	__u32 gpu_id;             /* This is the user_gpu_id */
 	__u32 alloc_flags;
 	__u32 dmabuf_fd;
-	__u32 pad;
+	__u8 is_import: 1;
+	__u8 skip: 1;
 };
 
 /* CRIU IOCTLs - END */
-- 
2.34.1

