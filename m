Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F67A98EF97
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 14:45:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D58E10E843;
	Thu,  3 Oct 2024 12:45:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="d/XGZVxt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2086.outbound.protection.outlook.com [40.107.96.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA1BC10E839;
 Thu,  3 Oct 2024 12:45:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PBei4riAKT7mhKPbkVejyMkLVyEdAjsJK2J5b1LsId2fSNMhQmxvYj4ycxrpSSiSVtQqkxYYy3ZsdcWI4HxDYhNriodZUZtOYXcS4PWvOS4n63o9Xr/5dcXyVd4MP19BxOJuR8slMQ98oGGCBT+/sU0TV5b0H62AhHpCtRYzIEPAovyEWxS6lcwndHMAM2KbvDMx3gQtVSEZLcXBG7T0fKqq665uYOR6msw4t90XvcL5UP1r+r+hrkKrGBV+7HJqxuNeydqcYGvTzfH92cgn6UZWd7/GDWsZWgXoqx/MWDati6STNjNaIHGrbUxUTD9ktoilqZklQ/Ip1V5Ris1A1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yowdtSHK/j4j19l0+TOb8v//t93Bdyd+0ZarGUsnhxc=;
 b=mFEKtHpjaPu+jjtLSx8fS9zaLma5GtlEcCPkowpnwF9TaC3I83zARyQGJQOWWbaTdWIOpIHU8QB7+bhTIbkazNon5EpDpcicDtxFRsZUZwIPdi4jodTV8bexs85X8cdk7rgvyRqDzz9h0rA/NaBD3lW578uHdlO1EtkhWYEtO1emSv6Hfok5mj9uU7nXxScjBhKGJ3tn4pwGlnJO4i5pzdhcXUtxFF2hgA3wWOtbFE4qmv/389Enr6QLiDniJVkFzROG7QyJcTqyqVNWjw+8Ot1THRv5Ap9Za9LTG+xo3/JIeiZ4VagFEJ219updsXknjA9iCM11mX2ykZrZNy31Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yowdtSHK/j4j19l0+TOb8v//t93Bdyd+0ZarGUsnhxc=;
 b=d/XGZVxtYSOVvfhLvYH2quVKdRPPg8QLQnumUsYUx9WMjDWyGdaFHJbB2XT4kmhDNTKq2AF68OID4ZTY/ANJYCNYTOtZH8wQQ0QOMKHARiE9W2c+p4O51MOXwhV0/+DbetOuez0DeWNGrm0uJ7e3pGInwNW2F8mt1qgKj0bbrxc=
Received: from SN4PR0501CA0012.namprd05.prod.outlook.com
 (2603:10b6:803:40::25) by DS0PR12MB6536.namprd12.prod.outlook.com
 (2603:10b6:8:d3::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 12:45:49 +0000
Received: from SA2PEPF00003F68.namprd04.prod.outlook.com
 (2603:10b6:803:40:cafe::fa) by SN4PR0501CA0012.outlook.office365.com
 (2603:10b6:803:40::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.15 via Frontend
 Transport; Thu, 3 Oct 2024 12:45:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003F68.mail.protection.outlook.com (10.167.248.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 12:45:49 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 07:45:46 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <dmitry.osipenko@collabora.com>, <jani.nikula@linux.intel.com>,
 <christian.koenig@amd.com>, <tursulin@igalia.com>, <simona.vetter@ffwll.ch>,
 <robdclark@gmail.com>, <alexander.deucher@amd.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH v5 6/6] drm/amdgpu: use drm_file::name in
 task_info::process_desc
Date: Thu, 3 Oct 2024 14:43:14 +0200
Message-ID: <20241003124506.470931-7-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241003124506.470931-1-pierre-eric.pelloux-prayer@amd.com>
References: <20241003124506.470931-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F68:EE_|DS0PR12MB6536:EE_
X-MS-Office365-Filtering-Correlation-Id: 74777d48-c15d-47ac-1682-08dce3a94f18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iXbMnb5pesZTYAz9JDvNmvA1iBZvOZ0xd5korZFb7wng+9yrvYuMgMrPKA7W?=
 =?us-ascii?Q?kKJ6tUNzRvnBskD0YhX9k+sZ6TdA/MEBUlwjX4bY1xy4n6L0N1n6Vceau29H?=
 =?us-ascii?Q?PZCe1H24qJiar/ixse6GKVTUG8IARuoQN65VI+GHLGS3MyJnk2nrX1gv9BU1?=
 =?us-ascii?Q?xKJAzB8KHB3WUAq9n5mH/fl3NeBmPYR+2EVPGU+zHJaFaX0qrIPeRUgypE4U?=
 =?us-ascii?Q?j8iaT7bsmQJ+nqymW+IDR48iBV3U6IFWrFq4MursQF6P3O1fWK8JdmOe0QYM?=
 =?us-ascii?Q?LOgmN624cLCHhdtfy00HXa4jeJg2/UdiPcOvpUGrU0YycQ9mBclJoG+myDSC?=
 =?us-ascii?Q?a81kfSOdGnKh7mRUD7429Dlf2jAJoZAYendzGIFHbWxsR5JsAR2yOd0u7UEK?=
 =?us-ascii?Q?xbfMg96vPHefO8w2nE8yUfOBfRAHPqJn0aAQSkU5GBQdj1unXqlQ91aSFXG9?=
 =?us-ascii?Q?COxD1PpRWhBrRmwlPuchG24zryQ1Pi5F3MWznDR4UtI1gHg4K4D/SK4u4+Bv?=
 =?us-ascii?Q?7dbeeQlwVdAVQcOaPPD2+grWDnbgs5C8R6UoTsSmj+hZCscAPTJM61rLKLAQ?=
 =?us-ascii?Q?eQiOwxtBSXwdFjx4rey+sHwHwzWEN2gG8SQTLlL0Z3JdBkeGYqWbp9loUAii?=
 =?us-ascii?Q?eiVvkeZh0ZsGmoARW5JzyN1GolGMuhN1v2Dxm3GO4V5f16L4XiiBAaL93JSH?=
 =?us-ascii?Q?yuI130iZQnVWvW2VUK/OkJoJFIe+VaRzWMEffD04+p/R2ufm9lwbfea1YnwS?=
 =?us-ascii?Q?kQW0Zn8xi6ZRxvPOcHTIE+T0KlhjbFNf1LAWWok1OXyrKQEhsH4Ae0zAXqZL?=
 =?us-ascii?Q?p78hNbqRfZYilFdk6HGahWIsjt6YbDdLg+wjElym4LPdKquZWa121+1NbKmL?=
 =?us-ascii?Q?DgAWtWoJr62vTh++ZL7XpTtyJMCxlAGC/qzg0YH9IVg5IVrBE/p4PnoSl3uG?=
 =?us-ascii?Q?kZXCnOdbbmJe6U8GyFtwFFr1EaSB3Z38QLaX3lQO/j3n+fSARj6MEZ69lg1Y?=
 =?us-ascii?Q?ru8AAJFUt/DWin638tSizeAI/y1bzV+C9rTRnVPWzwqD8qDrwmFIJj8pcBOA?=
 =?us-ascii?Q?peJTKj23HqLnZYXMC6JPqppYYfjvRO12GzM0yGKS65DmMfZJRFPSJr2EE1eQ?=
 =?us-ascii?Q?i/Hd2ov2AnSlNLoN8gkNIicspNzPemSkGLQ/4dG9oXhLEvaG+aSlBYx8RQHn?=
 =?us-ascii?Q?T6YLaK/Wd9qiVUV7cumcwbiztONVAkv9zA35QH2NMV2X+zARoOXAu7qo63hm?=
 =?us-ascii?Q?FTgGfHQ1t4MEVkx/ZKPbpHMiukL2HwLpv9nRkV/6jekZhrT7QcQaooiYZegX?=
 =?us-ascii?Q?9UQnXESp4oMdjGix/4IDjCWqjMwCl8ycom+sTVrNEroU53EmLbWrIARaiMDQ?=
 =?us-ascii?Q?Pe7Ux7RCaDHTkxWOzATT7RUaOQFJ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 12:45:49.4787 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74777d48-c15d-47ac-1682-08dce3a94f18
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F68.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6536
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

If a drm_file name is set append it to the process name.

This information is useful with the virtio/native-context driver: this
allows the guest applications identifier to visible in amdgpu's output.

The output in amdgpu_vm_info/amdgpu_gem_info looks like this:
   pid:12255	Process:glxgears/test-set-fd-name ----------

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  1 +
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        | 34 ++++++++++++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  3 ++
 6 files changed, 34 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index f9d119448442..ad909173e419 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -299,6 +299,7 @@ int amdgpu_amdkfd_gpuvm_set_vm_pasid(struct amdgpu_device *adev,
 				     struct amdgpu_vm *avm, u32 pasid);
 int amdgpu_amdkfd_gpuvm_acquire_process_vm(struct amdgpu_device *adev,
 					struct amdgpu_vm *avm,
+					struct drm_file *filp,
 					void **process_info,
 					struct dma_fence **ef);
 void amdgpu_amdkfd_gpuvm_release_process_vm(struct amdgpu_device *adev,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 6d5fd371d5ce..172882af6705 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -1558,6 +1558,7 @@ int amdgpu_amdkfd_gpuvm_set_vm_pasid(struct amdgpu_device *adev,
 
 int amdgpu_amdkfd_gpuvm_acquire_process_vm(struct amdgpu_device *adev,
 					   struct amdgpu_vm *avm,
+					   struct drm_file *filp,
 					   void **process_info,
 					   struct dma_fence **ef)
 {
@@ -1577,7 +1578,7 @@ int amdgpu_amdkfd_gpuvm_acquire_process_vm(struct amdgpu_device *adev,
 	if (ret)
 		return ret;
 
-	amdgpu_vm_set_task_info(avm);
+	amdgpu_vm_set_task_info(avm, filp);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 891128ecee6d..5d43e24906d2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1178,7 +1178,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
 	}
 
 	/* Use this opportunity to fill in task info for the vm */
-	amdgpu_vm_set_task_info(vm);
+	amdgpu_vm_set_task_info(vm, p->filp);
 
 	if (adev->debug_vm) {
 		/* Invalidate all BOs to test for userspace bugs */
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 561ff832930e..920660c23e0f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2355,24 +2355,41 @@ amdgpu_vm_get_task_info_pasid(struct amdgpu_device *adev, u32 pasid)
 			amdgpu_vm_get_vm_from_pasid(adev, pasid));
 }
 
-static int amdgpu_vm_create_task_info(struct amdgpu_vm *vm)
+static int amdgpu_vm_create_task_info(struct amdgpu_vm *vm, struct drm_file *filp)
 {
 	char process_name[TASK_COMM_LEN];
-	size_t pname_len;
+	size_t pname_len, pdesc_len;
 
 	get_task_comm(process_name, current->group_leader);
-	pname_len = strlen(process_name);
+	pdesc_len = pname_len = strlen(process_name);
+
+	mutex_lock(&filp->client_name_lock);
+	if (filp->client_name)
+		pdesc_len += strlen(filp->client_name) + 1;
+
+	/* Add 1 for the NUL char. */
+	pdesc_len += 1;
 
 	vm->task_info = kzalloc(
-		struct_size(vm->task_info, process_desc, pname_len + 1),
+		struct_size(vm->task_info, process_desc, pdesc_len),
 		GFP_KERNEL);
 
-	if (!vm->task_info)
+	if (!vm->task_info) {
+		mutex_unlock(&filp->client_name_lock);
 		return -ENOMEM;
+	}
 
 	/* Set process attributes now. */
 	vm->task_info->tgid = current->group_leader->pid;
-	strscpy(vm->task_info->process_desc, process_name, pname_len + 1);
+	strscpy(vm->task_info->process_desc, process_name, pdesc_len);
+
+	if (filp->client_name) {
+		/* Append the drm-client-name. */
+		vm->task_info->process_desc[pname_len] = '/';
+		strscpy(&vm->task_info->process_desc[pname_len + 1],
+			filp->client_name, pdesc_len - (pname_len + 1));
+	}
+	mutex_unlock(&filp->client_name_lock);
 
 	kref_init(&vm->task_info->refcount);
 	return 0;
@@ -2382,11 +2399,12 @@ static int amdgpu_vm_create_task_info(struct amdgpu_vm *vm)
  * amdgpu_vm_set_task_info - Sets VMs task info.
  *
  * @vm: vm for which to set the info
+ * @filp: drm_file instance
  */
-void amdgpu_vm_set_task_info(struct amdgpu_vm *vm)
+void amdgpu_vm_set_task_info(struct amdgpu_vm *vm, struct drm_file *filp)
 {
 	if (!vm->task_info) {
-		if (amdgpu_vm_create_task_info(vm))
+		if (amdgpu_vm_create_task_info(vm, filp))
 			return;
 	} else if (vm->task_info->pid == current->pid) {
 		return;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index 44da250217be..8df3dece54c2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -561,7 +561,7 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
 			    u32 vmid, u32 node_id, uint64_t addr, uint64_t ts,
 			    bool write_fault);
 
-void amdgpu_vm_set_task_info(struct amdgpu_vm *vm);
+void amdgpu_vm_set_task_info(struct amdgpu_vm *vm, struct drm_file *filp);
 
 void amdgpu_vm_move_to_lru_tail(struct amdgpu_device *adev,
 				struct amdgpu_vm *vm);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index a902950cc060..e473fe433d3f 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1654,6 +1654,7 @@ int kfd_process_device_init_vm(struct kfd_process_device *pdd,
 			       struct file *drm_file)
 {
 	struct amdgpu_fpriv *drv_priv;
+	struct drm_file *filp;
 	struct amdgpu_vm *avm;
 	struct kfd_process *p;
 	struct dma_fence *ef;
@@ -1673,8 +1674,10 @@ int kfd_process_device_init_vm(struct kfd_process_device *pdd,
 
 	p = pdd->process;
 	dev = pdd->dev;
+	filp = drm_file->private_data;
 
 	ret = amdgpu_amdkfd_gpuvm_acquire_process_vm(dev->adev, avm,
+						     filp,
 						     &p->kgd_process_info,
 						     &ef);
 	if (ret) {
-- 
2.40.1

