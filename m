Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A03FE4A8122
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 10:10:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD86310EA49;
	Thu,  3 Feb 2022 09:09:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2066.outbound.protection.outlook.com [40.107.100.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01D4610EA18;
 Thu,  3 Feb 2022 09:09:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VuK2yWZSmsycrzQfa+djRouWoyLeBIvgLfJcILawP3Tz+IutHEmiNEYPkHGJ3YVbCdeA7XpSWCmlaR0pUGfICGYbDDheeLH3FycG1geJfy7Ey6cnw9tifXRo0GPDRiIRUc4iY2bBBcjLpqsnuSLdpFJnwrsM2m2Y1GRFFLLcvnB2e+PxzN00aaQqDPLsIjy4NgO+OtjWudyz5EGUHaWxOj8fE1RWmqaOFAdNtQ0OzCKo50pkc2j1IaamC6bGeVVv8Z9KWbG+Aoy0R+oYUeBy1Acy3FOsn7BSWbrUL2KeTRzII8iZbAQb+sZuUisBpd8wRkLhUYdD6PDwcoRzJoKeLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DTLyOgJlQzMnqyJPVAHm7Z5coLGqC8NPNqztNBubM68=;
 b=jUn5ecX0TRAeA9BRf46NvFPHpXBKNUWAfLFnRe4nEICw/2Cp4aTtjgebFGC1bRAyhEYH4NvYaMfMKhMGvDWdwEd1yV1+iDTNuphXpUByf1hioe0sAD1zQBC2S20qJz5Ta+1FX6zJpUPT8udI+q+kRLshxgBCFAW5pA9a6Ccjf/wMi/6KspMgtYhGTHPp/1854ZaptO6GFP1ictukTMCjGDviOFcKNmsq6/V1A81Sb5YhqT8BOss1LDTuYam8+RyEAD/2gEGn8h7YR7aWncVbGYse6MLgHeHNrdvHDBaBuHP8WarLh+RGp6B9HBZDBWy1WKTGBHQJgUejAx3iClgRdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DTLyOgJlQzMnqyJPVAHm7Z5coLGqC8NPNqztNBubM68=;
 b=NhH6T/sT8GXZD51TIxxka/HZYu2M+KDEerB00iudzkSsH50tFEhcZGh68UAkca7UkpNz/tEo+X4jXIj8BxKXsNfpO6IZsd5ENzG1JAyDh3IfwBy0wfl0smyvJC1wdjm0yuotksVevO8tZ/EH+vPm86lD9TwXp6YSppNIw+u/vFg=
Received: from BN9PR03CA0363.namprd03.prod.outlook.com (2603:10b6:408:f7::8)
 by BYAPR12MB3094.namprd12.prod.outlook.com (2603:10b6:a03:db::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Thu, 3 Feb
 2022 09:09:43 +0000
Received: from BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::16) by BN9PR03CA0363.outlook.office365.com
 (2603:10b6:408:f7::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Thu, 3 Feb 2022 09:09:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT037.mail.protection.outlook.com (10.13.177.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Thu, 3 Feb 2022 09:09:42 +0000
Received: from rajneesh-desk.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Feb
 2022 03:09:40 -0600
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [Patch v5 15/24] drm/amdkfd: CRIU implement gpu_id remapping
Date: Thu, 3 Feb 2022 04:09:09 -0500
Message-ID: <20220203090918.11520-16-rajneesh.bhardwaj@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220203090918.11520-1-rajneesh.bhardwaj@amd.com>
References: <20220203090918.11520-1-rajneesh.bhardwaj@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ddea2712-a540-43ee-3f2f-08d9e6f4ea84
X-MS-TrafficTypeDiagnostic: BYAPR12MB3094:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB3094D37236857D39EEFAD336FE289@BYAPR12MB3094.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dD5RL2Ef49D020g/2B5ASCjm1GkrLn0w9giOWDHfnwz/wTU2miMVmLNDn3YQFp/3dlvieo10ZH/YqeK4AiRxMdZpoKkxmxQOwinAxZCgjYz1McbUFTqF0gMuXoNyQ8uGfJM0eqCb4TVqtyAp51n3ueed9HIcpjBm+KGNoKRU4hsIYXt6eN+YBkr13irOzuzlrLZTzYmiCBDSFwcVsQ12xDr5dzv/vAMuEvP1y7UUz2JlW3gBe/48bG1bMbaKYXS5MOL3o0gEya3nNFlVc1j8niqTVYL0lF/rvMF/PZs63eUDhuB4SFbhMFbOyjAX3WZ+PxB3hRQ+KYywJAE6F6OuPBrD7AXtm5dob5eVYQue4mh8Hl4l1+fn9VfGZszUEigbtJxqQ2HwbpSPa7rW1HLrdhxDhq/CPEdAmPF2J698TofTIvjikdMIKxQhsacpnHVCI6py77EHgMTKjXifFc468qByDZuIFGixIM7tqJWTxXG3WD7bOkfcU0aXq0Y67bLX4dQKMQ5f2obrR+CnkHYnXh5ts7bGJah8wayE/HrP4z+VxKAqaEclcwXEpFmE1G0rxCX3+v+SyG5LKc1swGCsyqG/jF2CuR66GZsHTsaWOu9uqpaNkUo3u6lB0y3ClwenzwpTFEqmm88SVxH39ikTDbnZqtshRY1cxt1jlFpHf5MJrWiCpfo/PVon/Qe+FXC0TWt2QPOSv6Wv6eWonxNgYw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(83380400001)(1076003)(36756003)(26005)(7696005)(6666004)(36860700001)(47076005)(508600001)(16526019)(336012)(186003)(2616005)(426003)(40460700003)(8676002)(5660300002)(44832011)(82310400004)(70206006)(30864003)(450100002)(356005)(2906002)(81166007)(8936002)(4326008)(70586007)(6916009)(86362001)(316002)(54906003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 09:09:42.9798 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ddea2712-a540-43ee-3f2f-08d9e6f4ea84
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3094
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
Cc: alexander.deucher@amd.com, felix.kuehling@amd.com, david.yatsin@amd.com,
 Rajneesh
 Bhardwaj <rajneesh.bhardwaj@amd.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Yat Sin <david.yatsin@amd.com>

When doing a restore on a different node, the gpu_id's on the restore
node may be different. But the user space application will still refer
use the original gpu_id's in the ioctl calls. Adding code to create a
gpu id mapping so that kfd can determine actual gpu_id during the user
ioctl's.

Signed-off-by: David Yat Sin <david.yatsin@amd.com>
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      | 468 ++++++++++++------
 drivers/gpu/drm/amd/amdkfd/kfd_events.c       |  45 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |  11 +
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  32 ++
 .../amd/amdkfd/kfd_process_queue_manager.c    |  18 +-
 5 files changed, 414 insertions(+), 160 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index a4be758647f9..69edeaf3893e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -293,14 +293,17 @@ static int kfd_ioctl_create_queue(struct file *filep, struct kfd_process *p,
 		return err;
 
 	pr_debug("Looking for gpu id 0x%x\n", args->gpu_id);
-	dev = kfd_device_by_id(args->gpu_id);
-	if (!dev) {
-		pr_debug("Could not find gpu id 0x%x\n", args->gpu_id);
-		return -EINVAL;
-	}
 
 	mutex_lock(&p->mutex);
 
+	pdd = kfd_process_device_data_by_id(p, args->gpu_id);
+	if (!pdd) {
+		pr_debug("Could not find gpu id 0x%x\n", args->gpu_id);
+		err = -EINVAL;
+		goto err_pdd;
+	}
+	dev = pdd->dev;
+
 	pdd = kfd_bind_process_to_device(dev, p);
 	if (IS_ERR(pdd)) {
 		err = -ESRCH;
@@ -345,6 +348,7 @@ static int kfd_ioctl_create_queue(struct file *filep, struct kfd_process *p,
 
 err_create_queue:
 err_bind_process:
+err_pdd:
 	mutex_unlock(&p->mutex);
 	return err;
 }
@@ -491,7 +495,6 @@ static int kfd_ioctl_set_memory_policy(struct file *filep,
 					struct kfd_process *p, void *data)
 {
 	struct kfd_ioctl_set_memory_policy_args *args = data;
-	struct kfd_dev *dev;
 	int err = 0;
 	struct kfd_process_device *pdd;
 	enum cache_policy default_policy, alternate_policy;
@@ -506,13 +509,15 @@ static int kfd_ioctl_set_memory_policy(struct file *filep,
 		return -EINVAL;
 	}
 
-	dev = kfd_device_by_id(args->gpu_id);
-	if (!dev)
-		return -EINVAL;
-
 	mutex_lock(&p->mutex);
+	pdd = kfd_process_device_data_by_id(p, args->gpu_id);
+	if (!pdd) {
+		pr_debug("Could not find gpu id 0x%x\n", args->gpu_id);
+		err = -EINVAL;
+		goto err_pdd;
+	}
 
-	pdd = kfd_bind_process_to_device(dev, p);
+	pdd = kfd_bind_process_to_device(pdd->dev, p);
 	if (IS_ERR(pdd)) {
 		err = -ESRCH;
 		goto out;
@@ -525,7 +530,7 @@ static int kfd_ioctl_set_memory_policy(struct file *filep,
 		(args->alternate_policy == KFD_IOC_CACHE_POLICY_COHERENT)
 		   ? cache_policy_coherent : cache_policy_noncoherent;
 
-	if (!dev->dqm->ops.set_cache_memory_policy(dev->dqm,
+	if (!pdd->dev->dqm->ops.set_cache_memory_policy(pdd->dev->dqm,
 				&pdd->qpd,
 				default_policy,
 				alternate_policy,
@@ -534,6 +539,7 @@ static int kfd_ioctl_set_memory_policy(struct file *filep,
 		err = -EINVAL;
 
 out:
+err_pdd:
 	mutex_unlock(&p->mutex);
 
 	return err;
@@ -543,17 +549,18 @@ static int kfd_ioctl_set_trap_handler(struct file *filep,
 					struct kfd_process *p, void *data)
 {
 	struct kfd_ioctl_set_trap_handler_args *args = data;
-	struct kfd_dev *dev;
 	int err = 0;
 	struct kfd_process_device *pdd;
 
-	dev = kfd_device_by_id(args->gpu_id);
-	if (!dev)
-		return -EINVAL;
-
 	mutex_lock(&p->mutex);
 
-	pdd = kfd_bind_process_to_device(dev, p);
+	pdd = kfd_process_device_data_by_id(p, args->gpu_id);
+	if (!pdd) {
+		err = -EINVAL;
+		goto err_pdd;
+	}
+
+	pdd = kfd_bind_process_to_device(pdd->dev, p);
 	if (IS_ERR(pdd)) {
 		err = -ESRCH;
 		goto out;
@@ -562,6 +569,7 @@ static int kfd_ioctl_set_trap_handler(struct file *filep,
 	kfd_process_set_trap_handler(&pdd->qpd, args->tba_addr, args->tma_addr);
 
 out:
+err_pdd:
 	mutex_unlock(&p->mutex);
 
 	return err;
@@ -577,16 +585,20 @@ static int kfd_ioctl_dbg_register(struct file *filep,
 	bool create_ok;
 	long status = 0;
 
-	dev = kfd_device_by_id(args->gpu_id);
-	if (!dev)
-		return -EINVAL;
+	mutex_lock(&p->mutex);
+	pdd = kfd_process_device_data_by_id(p, args->gpu_id);
+	if (!pdd) {
+		status = -EINVAL;
+		goto err_pdd;
+	}
+	dev = pdd->dev;
 
 	if (dev->adev->asic_type == CHIP_CARRIZO) {
 		pr_debug("kfd_ioctl_dbg_register not supported on CZ\n");
-		return -EINVAL;
+		status = -EINVAL;
+		goto err_chip_unsupp;
 	}
 
-	mutex_lock(&p->mutex);
 	mutex_lock(kfd_get_dbgmgr_mutex());
 
 	/*
@@ -616,6 +628,8 @@ static int kfd_ioctl_dbg_register(struct file *filep,
 
 out:
 	mutex_unlock(kfd_get_dbgmgr_mutex());
+err_pdd:
+err_chip_unsupp:
 	mutex_unlock(&p->mutex);
 
 	return status;
@@ -625,13 +639,18 @@ static int kfd_ioctl_dbg_unregister(struct file *filep,
 				struct kfd_process *p, void *data)
 {
 	struct kfd_ioctl_dbg_unregister_args *args = data;
+	struct kfd_process_device *pdd;
 	struct kfd_dev *dev;
 	long status;
 
-	dev = kfd_device_by_id(args->gpu_id);
-	if (!dev || !dev->dbgmgr)
+	mutex_lock(&p->mutex);
+	pdd = kfd_process_device_data_by_id(p, args->gpu_id);
+	mutex_unlock(&p->mutex);
+	if (!pdd || !pdd->dev->dbgmgr)
 		return -EINVAL;
 
+	dev = pdd->dev;
+
 	if (dev->adev->asic_type == CHIP_CARRIZO) {
 		pr_debug("kfd_ioctl_dbg_unregister not supported on CZ\n");
 		return -EINVAL;
@@ -664,6 +683,7 @@ static int kfd_ioctl_dbg_address_watch(struct file *filep,
 {
 	struct kfd_ioctl_dbg_address_watch_args *args = data;
 	struct kfd_dev *dev;
+	struct kfd_process_device *pdd;
 	struct dbg_address_watch_info aw_info;
 	unsigned char *args_buff;
 	long status;
@@ -673,15 +693,19 @@ static int kfd_ioctl_dbg_address_watch(struct file *filep,
 
 	memset((void *) &aw_info, 0, sizeof(struct dbg_address_watch_info));
 
-	dev = kfd_device_by_id(args->gpu_id);
-	if (!dev)
+	mutex_lock(&p->mutex);
+	pdd = kfd_process_device_data_by_id(p, args->gpu_id);
+	mutex_unlock(&p->mutex);
+	if (!pdd) {
+		pr_debug("Could not find gpu id 0x%x\n", args->gpu_id);
 		return -EINVAL;
+	}
+	dev = pdd->dev;
 
 	if (dev->adev->asic_type == CHIP_CARRIZO) {
 		pr_debug("kfd_ioctl_dbg_wave_control not supported on CZ\n");
 		return -EINVAL;
 	}
-
 	cmd_from_user = (void __user *) args->content_ptr;
 
 	/* Validate arguments */
@@ -764,6 +788,7 @@ static int kfd_ioctl_dbg_wave_control(struct file *filep,
 {
 	struct kfd_ioctl_dbg_wave_control_args *args = data;
 	struct kfd_dev *dev;
+	struct kfd_process_device *pdd;
 	struct dbg_wave_control_info wac_info;
 	unsigned char *args_buff;
 	uint32_t computed_buff_size;
@@ -781,9 +806,14 @@ static int kfd_ioctl_dbg_wave_control(struct file *filep,
 				sizeof(wac_info.dbgWave_msg.MemoryVA) +
 				sizeof(wac_info.trapId);
 
-	dev = kfd_device_by_id(args->gpu_id);
-	if (!dev)
+	mutex_lock(&p->mutex);
+	pdd = kfd_process_device_data_by_id(p, args->gpu_id);
+	mutex_unlock(&p->mutex);
+	if (!pdd) {
+		pr_debug("Could not find gpu id 0x%x\n", args->gpu_id);
 		return -EINVAL;
+	}
+	dev = pdd->dev;
 
 	if (dev->adev->asic_type == CHIP_CARRIZO) {
 		pr_debug("kfd_ioctl_dbg_wave_control not supported on CZ\n");
@@ -847,12 +877,14 @@ static int kfd_ioctl_get_clock_counters(struct file *filep,
 				struct kfd_process *p, void *data)
 {
 	struct kfd_ioctl_get_clock_counters_args *args = data;
-	struct kfd_dev *dev;
+	struct kfd_process_device *pdd;
 
-	dev = kfd_device_by_id(args->gpu_id);
-	if (dev)
+	mutex_lock(&p->mutex);
+	pdd = kfd_process_device_data_by_id(p, args->gpu_id);
+	mutex_unlock(&p->mutex);
+	if (pdd)
 		/* Reading GPU clock counter from KGD */
-		args->gpu_clock_counter = amdgpu_amdkfd_get_gpu_clock_counter(dev->adev);
+		args->gpu_clock_counter = amdgpu_amdkfd_get_gpu_clock_counter(pdd->dev->adev);
 	else
 		/* Node without GPU resource */
 		args->gpu_clock_counter = 0;
@@ -1070,11 +1102,13 @@ static int kfd_ioctl_set_scratch_backing_va(struct file *filep,
 	struct kfd_dev *dev;
 	long err;
 
-	dev = kfd_device_by_id(args->gpu_id);
-	if (!dev)
-		return -EINVAL;
-
 	mutex_lock(&p->mutex);
+	pdd = kfd_process_device_data_by_id(p, args->gpu_id);
+	if (!pdd) {
+		err = -EINVAL;
+		goto err_pdd;
+	}
+	dev = pdd->dev;
 
 	pdd = kfd_bind_process_to_device(dev, p);
 	if (IS_ERR(pdd)) {
@@ -1094,6 +1128,7 @@ static int kfd_ioctl_set_scratch_backing_va(struct file *filep,
 	return 0;
 
 bind_process_to_device_fail:
+err_pdd:
 	mutex_unlock(&p->mutex);
 	return err;
 }
@@ -1102,15 +1137,17 @@ static int kfd_ioctl_get_tile_config(struct file *filep,
 		struct kfd_process *p, void *data)
 {
 	struct kfd_ioctl_get_tile_config_args *args = data;
-	struct kfd_dev *dev;
+	struct kfd_process_device *pdd;
 	struct tile_config config;
 	int err = 0;
 
-	dev = kfd_device_by_id(args->gpu_id);
-	if (!dev)
+	mutex_lock(&p->mutex);
+	pdd = kfd_process_device_data_by_id(p, args->gpu_id);
+	mutex_unlock(&p->mutex);
+	if (!pdd)
 		return -EINVAL;
 
-	amdgpu_amdkfd_get_tile_config(dev->adev, &config);
+	amdgpu_amdkfd_get_tile_config(pdd->dev->adev, &config);
 
 	args->gb_addr_config = config.gb_addr_config;
 	args->num_banks = config.num_banks;
@@ -1145,40 +1182,37 @@ static int kfd_ioctl_acquire_vm(struct file *filep, struct kfd_process *p,
 {
 	struct kfd_ioctl_acquire_vm_args *args = data;
 	struct kfd_process_device *pdd;
-	struct kfd_dev *dev;
 	struct file *drm_file;
 	int ret;
 
-	dev = kfd_device_by_id(args->gpu_id);
-	if (!dev)
-		return -EINVAL;
-
 	drm_file = fget(args->drm_fd);
 	if (!drm_file)
 		return -EINVAL;
 
 	mutex_lock(&p->mutex);
-
-	pdd = kfd_get_process_device_data(dev, p);
+	pdd = kfd_process_device_data_by_id(p, args->gpu_id);
 	if (!pdd) {
 		ret = -EINVAL;
-		goto err_unlock;
+		goto err_pdd;
 	}
 
 	if (pdd->drm_file) {
 		ret = pdd->drm_file == drm_file ? 0 : -EBUSY;
-		goto err_unlock;
+		goto err_drm_file;
 	}
 
 	ret = kfd_process_device_init_vm(pdd, drm_file);
 	if (ret)
 		goto err_unlock;
+
 	/* On success, the PDD keeps the drm_file reference */
 	mutex_unlock(&p->mutex);
 
 	return 0;
 
 err_unlock:
+err_pdd:
+err_drm_file:
 	mutex_unlock(&p->mutex);
 	fput(drm_file);
 	return ret;
@@ -1235,19 +1269,23 @@ static int kfd_ioctl_alloc_memory_of_gpu(struct file *filep,
 	}
 	mutex_unlock(&p->svms.lock);
 #endif
-	dev = kfd_device_by_id(args->gpu_id);
-	if (!dev)
-		return -EINVAL;
+	mutex_lock(&p->mutex);
+	pdd = kfd_process_device_data_by_id(p, args->gpu_id);
+	if (!pdd) {
+		err = -EINVAL;
+		goto err_pdd;
+	}
+
+	dev = pdd->dev;
 
 	if ((flags & KFD_IOC_ALLOC_MEM_FLAGS_PUBLIC) &&
 		(flags & KFD_IOC_ALLOC_MEM_FLAGS_VRAM) &&
 		!kfd_dev_is_large_bar(dev)) {
 		pr_err("Alloc host visible vram on small bar is not allowed\n");
-		return -EINVAL;
+		err = -EINVAL;
+		goto err_large_bar;
 	}
 
-	mutex_lock(&p->mutex);
-
 	pdd = kfd_bind_process_to_device(dev, p);
 	if (IS_ERR(pdd)) {
 		err = PTR_ERR(pdd);
@@ -1308,6 +1346,8 @@ static int kfd_ioctl_alloc_memory_of_gpu(struct file *filep,
 	amdgpu_amdkfd_gpuvm_free_memory_of_gpu(dev->adev, (struct kgd_mem *)mem,
 					       pdd->drm_priv, NULL);
 err_unlock:
+err_pdd:
+err_large_bar:
 	mutex_unlock(&p->mutex);
 	return err;
 }
@@ -1318,14 +1358,9 @@ static int kfd_ioctl_free_memory_of_gpu(struct file *filep,
 	struct kfd_ioctl_free_memory_of_gpu_args *args = data;
 	struct kfd_process_device *pdd;
 	void *mem;
-	struct kfd_dev *dev;
 	int ret;
 	uint64_t size = 0;
 
-	dev = kfd_device_by_id(GET_GPU_ID(args->handle));
-	if (!dev)
-		return -EINVAL;
-
 	mutex_lock(&p->mutex);
 	/*
 	 * Safeguard to prevent user space from freeing signal BO.
@@ -1337,11 +1372,11 @@ static int kfd_ioctl_free_memory_of_gpu(struct file *filep,
 		goto err_unlock;
 	}
 
-	pdd = kfd_get_process_device_data(dev, p);
+	pdd = kfd_process_device_data_by_id(p, GET_GPU_ID(args->handle));
 	if (!pdd) {
 		pr_err("Process device data doesn't exist\n");
 		ret = -EINVAL;
-		goto err_unlock;
+		goto err_pdd;
 	}
 
 	mem = kfd_process_device_translate_handle(
@@ -1351,7 +1386,7 @@ static int kfd_ioctl_free_memory_of_gpu(struct file *filep,
 		goto err_unlock;
 	}
 
-	ret = amdgpu_amdkfd_gpuvm_free_memory_of_gpu(dev->adev,
+	ret = amdgpu_amdkfd_gpuvm_free_memory_of_gpu(pdd->dev->adev,
 				(struct kgd_mem *)mem, pdd->drm_priv, &size);
 
 	/* If freeing the buffer failed, leave the handle in place for
@@ -1364,6 +1399,7 @@ static int kfd_ioctl_free_memory_of_gpu(struct file *filep,
 	WRITE_ONCE(pdd->vram_usage, pdd->vram_usage - size);
 
 err_unlock:
+err_pdd:
 	mutex_unlock(&p->mutex);
 	return ret;
 }
@@ -1381,16 +1417,12 @@ static int kfd_ioctl_map_memory_to_gpu(struct file *filep,
 	struct kfd_ioctl_map_memory_to_gpu_args *args = data;
 	struct kfd_process_device *pdd, *peer_pdd;
 	void *mem;
-	struct kfd_dev *dev, *peer;
+	struct kfd_dev *dev;
 	long err = 0;
 	int i;
 	uint32_t *devices_arr = NULL;
 	bool table_freed = false;
 
-	dev = kfd_device_by_id(GET_GPU_ID(args->handle));
-	if (!dev)
-		return -EINVAL;
-
 	if (!args->n_devices) {
 		pr_debug("Device IDs array empty\n");
 		return -EINVAL;
@@ -1414,6 +1446,12 @@ static int kfd_ioctl_map_memory_to_gpu(struct file *filep,
 	}
 
 	mutex_lock(&p->mutex);
+	pdd = kfd_process_device_data_by_id(p, GET_GPU_ID(args->handle));
+	if (!pdd) {
+		err = -EINVAL;
+		goto get_process_device_data_failed;
+	}
+	dev = pdd->dev;
 
 	pdd = kfd_bind_process_to_device(dev, p);
 	if (IS_ERR(pdd)) {
@@ -1429,21 +1467,22 @@ static int kfd_ioctl_map_memory_to_gpu(struct file *filep,
 	}
 
 	for (i = args->n_success; i < args->n_devices; i++) {
-		peer = kfd_device_by_id(devices_arr[i]);
-		if (!peer) {
+		peer_pdd = kfd_process_device_data_by_id(p, devices_arr[i]);
+		if (!peer_pdd) {
 			pr_debug("Getting device by id failed for 0x%x\n",
 				 devices_arr[i]);
 			err = -EINVAL;
 			goto get_mem_obj_from_handle_failed;
 		}
 
-		peer_pdd = kfd_bind_process_to_device(peer, p);
+		peer_pdd = kfd_bind_process_to_device(peer_pdd->dev, p);
 		if (IS_ERR(peer_pdd)) {
 			err = PTR_ERR(peer_pdd);
 			goto get_mem_obj_from_handle_failed;
 		}
+
 		err = amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
-			peer->adev, (struct kgd_mem *)mem,
+			peer_pdd->dev->adev, (struct kgd_mem *)mem,
 			peer_pdd->drm_priv, &table_freed);
 		if (err) {
 			pr_err("Failed to map to gpu %d/%d\n",
@@ -1464,10 +1503,7 @@ static int kfd_ioctl_map_memory_to_gpu(struct file *filep,
 	/* Flush TLBs after waiting for the page table updates to complete */
 	if (table_freed || !kfd_flush_tlb_after_unmap(dev)) {
 		for (i = 0; i < args->n_devices; i++) {
-			peer = kfd_device_by_id(devices_arr[i]);
-			if (WARN_ON_ONCE(!peer))
-				continue;
-			peer_pdd = kfd_get_process_device_data(peer, p);
+			peer_pdd = kfd_process_device_data_by_id(p, devices_arr[i]);
 			if (WARN_ON_ONCE(!peer_pdd))
 				continue;
 			kfd_flush_tlb(peer_pdd, TLB_FLUSH_LEGACY);
@@ -1477,6 +1513,7 @@ static int kfd_ioctl_map_memory_to_gpu(struct file *filep,
 
 	return err;
 
+get_process_device_data_failed:
 bind_process_to_device_failed:
 get_mem_obj_from_handle_failed:
 map_memory_to_gpu_failed:
@@ -1494,14 +1531,9 @@ static int kfd_ioctl_unmap_memory_from_gpu(struct file *filep,
 	struct kfd_ioctl_unmap_memory_from_gpu_args *args = data;
 	struct kfd_process_device *pdd, *peer_pdd;
 	void *mem;
-	struct kfd_dev *dev, *peer;
 	long err = 0;
 	uint32_t *devices_arr = NULL, i;
 
-	dev = kfd_device_by_id(GET_GPU_ID(args->handle));
-	if (!dev)
-		return -EINVAL;
-
 	if (!args->n_devices) {
 		pr_debug("Device IDs array empty\n");
 		return -EINVAL;
@@ -1525,8 +1557,7 @@ static int kfd_ioctl_unmap_memory_from_gpu(struct file *filep,
 	}
 
 	mutex_lock(&p->mutex);
-
-	pdd = kfd_get_process_device_data(dev, p);
+	pdd = kfd_process_device_data_by_id(p, GET_GPU_ID(args->handle));
 	if (!pdd) {
 		err = -EINVAL;
 		goto bind_process_to_device_failed;
@@ -1540,19 +1571,13 @@ static int kfd_ioctl_unmap_memory_from_gpu(struct file *filep,
 	}
 
 	for (i = args->n_success; i < args->n_devices; i++) {
-		peer = kfd_device_by_id(devices_arr[i]);
-		if (!peer) {
-			err = -EINVAL;
-			goto get_mem_obj_from_handle_failed;
-		}
-
-		peer_pdd = kfd_get_process_device_data(peer, p);
+		peer_pdd = kfd_process_device_data_by_id(p, devices_arr[i]);
 		if (!peer_pdd) {
-			err = -ENODEV;
+			err = -EINVAL;
 			goto get_mem_obj_from_handle_failed;
 		}
 		err = amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(
-			peer->adev, (struct kgd_mem *)mem, peer_pdd->drm_priv);
+			peer_pdd->dev->adev, (struct kgd_mem *)mem, peer_pdd->drm_priv);
 		if (err) {
 			pr_err("Failed to unmap from gpu %d/%d\n",
 			       i, args->n_devices);
@@ -1562,8 +1587,8 @@ static int kfd_ioctl_unmap_memory_from_gpu(struct file *filep,
 	}
 	mutex_unlock(&p->mutex);
 
-	if (kfd_flush_tlb_after_unmap(dev)) {
-		err = amdgpu_amdkfd_gpuvm_sync_memory(dev->adev,
+	if (kfd_flush_tlb_after_unmap(pdd->dev)) {
+		err = amdgpu_amdkfd_gpuvm_sync_memory(pdd->dev->adev,
 				(struct kgd_mem *) mem, true);
 		if (err) {
 			pr_debug("Sync memory failed, wait interrupted by user signal\n");
@@ -1572,10 +1597,7 @@ static int kfd_ioctl_unmap_memory_from_gpu(struct file *filep,
 
 		/* Flush TLBs after waiting for the page table updates to complete */
 		for (i = 0; i < args->n_devices; i++) {
-			peer = kfd_device_by_id(devices_arr[i]);
-			if (WARN_ON_ONCE(!peer))
-				continue;
-			peer_pdd = kfd_get_process_device_data(peer, p);
+			peer_pdd = kfd_process_device_data_by_id(p, devices_arr[i]);
 			if (WARN_ON_ONCE(!peer_pdd))
 				continue;
 			kfd_flush_tlb(peer_pdd, TLB_FLUSH_HEAVYWEIGHT);
@@ -1695,29 +1717,29 @@ static int kfd_ioctl_import_dmabuf(struct file *filep,
 	struct kfd_ioctl_import_dmabuf_args *args = data;
 	struct kfd_process_device *pdd;
 	struct dma_buf *dmabuf;
-	struct kfd_dev *dev;
 	int idr_handle;
 	uint64_t size;
 	void *mem;
 	int r;
 
-	dev = kfd_device_by_id(args->gpu_id);
-	if (!dev)
-		return -EINVAL;
-
 	dmabuf = dma_buf_get(args->dmabuf_fd);
 	if (IS_ERR(dmabuf))
 		return PTR_ERR(dmabuf);
 
 	mutex_lock(&p->mutex);
+	pdd = kfd_process_device_data_by_id(p, args->gpu_id);
+	if (!pdd) {
+		r = -EINVAL;
+		goto err_unlock;
+	}
 
-	pdd = kfd_bind_process_to_device(dev, p);
+	pdd = kfd_bind_process_to_device(pdd->dev, p);
 	if (IS_ERR(pdd)) {
 		r = PTR_ERR(pdd);
 		goto err_unlock;
 	}
 
-	r = amdgpu_amdkfd_gpuvm_import_dmabuf(dev->adev, dmabuf,
+	r = amdgpu_amdkfd_gpuvm_import_dmabuf(pdd->dev->adev, dmabuf,
 					      args->va_addr, pdd->drm_priv,
 					      (struct kgd_mem **)&mem, &size,
 					      NULL);
@@ -1738,7 +1760,7 @@ static int kfd_ioctl_import_dmabuf(struct file *filep,
 	return 0;
 
 err_free:
-	amdgpu_amdkfd_gpuvm_free_memory_of_gpu(dev->adev, (struct kgd_mem *)mem,
+	amdgpu_amdkfd_gpuvm_free_memory_of_gpu(pdd->dev->adev, (struct kgd_mem *)mem,
 					       pdd->drm_priv, NULL);
 err_unlock:
 	mutex_unlock(&p->mutex);
@@ -1751,13 +1773,16 @@ static int kfd_ioctl_smi_events(struct file *filep,
 				struct kfd_process *p, void *data)
 {
 	struct kfd_ioctl_smi_events_args *args = data;
-	struct kfd_dev *dev;
+	struct kfd_process_device *pdd;
 
-	dev = kfd_device_by_id(args->gpuid);
-	if (!dev)
+	mutex_lock(&p->mutex);
+
+	pdd = kfd_process_device_data_by_id(p, args->gpuid);
+	mutex_unlock(&p->mutex);
+	if (!pdd)
 		return -EINVAL;
 
-	return kfd_smi_event_open(dev, &args->anon_fd);
+	return kfd_smi_event_open(pdd->dev, &args->anon_fd);
 }
 
 static int kfd_ioctl_set_xnack_mode(struct file *filep,
@@ -1834,6 +1859,62 @@ static int criu_checkpoint_process(struct kfd_process *p,
 	return ret;
 }
 
+static int criu_checkpoint_devices(struct kfd_process *p,
+			     uint32_t num_devices,
+			     uint8_t __user *user_addr,
+			     uint8_t __user *user_priv_data,
+			     uint64_t *priv_offset)
+{
+	struct kfd_criu_device_priv_data *device_priv = NULL;
+	struct kfd_criu_device_bucket *device_buckets = NULL;
+	int ret = 0, i;
+
+	device_buckets = kvzalloc(num_devices * sizeof(*device_buckets), GFP_KERNEL);
+	if (!device_buckets) {
+		ret = -ENOMEM;
+		goto exit;
+	}
+
+	device_priv = kvzalloc(num_devices * sizeof(*device_priv), GFP_KERNEL);
+	if (!device_priv) {
+		ret = -ENOMEM;
+		goto exit;
+	}
+
+	for (i = 0; i < num_devices; i++) {
+		struct kfd_process_device *pdd = p->pdds[i];
+
+		device_buckets[i].user_gpu_id = pdd->user_gpu_id;
+		device_buckets[i].actual_gpu_id = pdd->dev->id;
+
+		/*
+		 * priv_data does not contain useful information for now and is reserved for
+		 * future use, so we do not set its contents.
+		 */
+	}
+
+	ret = copy_to_user(user_addr, device_buckets, num_devices * sizeof(*device_buckets));
+	if (ret) {
+		pr_err("Failed to copy device information to user\n");
+		ret = -EFAULT;
+		goto exit;
+	}
+
+	ret = copy_to_user(user_priv_data + *priv_offset,
+			   device_priv,
+			   num_devices * sizeof(*device_priv));
+	if (ret) {
+		pr_err("Failed to copy device information to user\n");
+		ret = -EFAULT;
+	}
+	*priv_offset += num_devices * sizeof(*device_priv);
+
+exit:
+	kvfree(device_buckets);
+	kvfree(device_priv);
+	return ret;
+}
+
 uint32_t get_process_num_bos(struct kfd_process *p)
 {
 	uint32_t num_of_bos = 0;
@@ -1902,9 +1983,9 @@ static int criu_checkpoint_bos(struct kfd_process *p,
 			bo_bucket = &bo_buckets[bo_index];
 			bo_priv = &bo_privs[bo_index];
 
+			bo_bucket->gpu_id = pdd->user_gpu_id;
 			bo_bucket->addr = (uint64_t)kgd_mem->va;
 			bo_bucket->size = amdgpu_bo_size(dumper_bo);
-			bo_bucket->gpu_id = pdd->dev->id;
 			bo_bucket->alloc_flags = (uint32_t)kgd_mem->alloc_flags;
 			bo_priv->idr_handle = id;
 
@@ -1928,7 +2009,7 @@ static int criu_checkpoint_bos(struct kfd_process *p,
 
 			for (i = 0; i < p->n_pdds; i++) {
 				if (amdgpu_amdkfd_bo_mapped_to_dev(p->pdds[i]->dev->adev, kgd_mem))
-					bo_priv->mapped_gpuids[dev_idx++] = p->pdds[i]->dev->id;
+					bo_priv->mapped_gpuids[dev_idx++] = p->pdds[i]->user_gpu_id;
 			}
 
 			pr_debug("bo_size = 0x%llx, bo_addr = 0x%llx bo_offset = 0x%llx\n"
@@ -1967,6 +2048,7 @@ static int criu_checkpoint_bos(struct kfd_process *p,
 }
 
 static int criu_get_process_object_info(struct kfd_process *p,
+					uint32_t *num_devices,
 					uint32_t *num_bos,
 					uint32_t *num_objects,
 					uint64_t *objs_priv_size)
@@ -1976,6 +2058,7 @@ static int criu_get_process_object_info(struct kfd_process *p,
 	uint32_t num_queues, num_events, num_svm_ranges;
 	uint64_t queues_priv_data_size;
 
+	*num_devices = p->n_pdds;
 	*num_bos = get_process_num_bos(p);
 
 	ret = kfd_process_get_queue_info(p, &num_queues, &queues_priv_data_size);
@@ -1989,6 +2072,7 @@ static int criu_get_process_object_info(struct kfd_process *p,
 
 	if (objs_priv_size) {
 		priv_size = sizeof(struct kfd_criu_process_priv_data);
+		priv_size += *num_devices * sizeof(struct kfd_criu_device_priv_data);
 		priv_size += *num_bos * sizeof(struct kfd_criu_bo_priv_data);
 		priv_size += queues_priv_data_size;
 		priv_size += num_events * sizeof(struct kfd_criu_event_priv_data);
@@ -2003,10 +2087,10 @@ static int criu_checkpoint(struct file *filep,
 			   struct kfd_ioctl_criu_args *args)
 {
 	int ret;
-	uint32_t num_bos, num_objects;
+	uint32_t num_devices, num_bos, num_objects;
 	uint64_t priv_size, priv_offset = 0;
 
-	if (!args->bos || !args->priv_data)
+	if (!args->devices || !args->bos || !args->priv_data)
 		return -EINVAL;
 
 	mutex_lock(&p->mutex);
@@ -2025,11 +2109,12 @@ static int criu_checkpoint(struct file *filep,
 		goto exit_unlock;
 	}
 
-	ret = criu_get_process_object_info(p, &num_bos, &num_objects, &priv_size);
+	ret = criu_get_process_object_info(p, &num_devices, &num_bos, &num_objects, &priv_size);
 	if (ret)
 		goto exit_unlock;
 
-	if (num_bos != args->num_bos ||
+	if (num_devices != args->num_devices ||
+	    num_bos != args->num_bos ||
 	    num_objects != args->num_objects ||
 	    priv_size != args->priv_data_size) {
 
@@ -2042,6 +2127,11 @@ static int criu_checkpoint(struct file *filep,
 	if (ret)
 		goto exit_unlock;
 
+	ret = criu_checkpoint_devices(p, num_devices, (uint8_t __user *)args->devices,
+				(uint8_t __user *)args->priv_data, &priv_offset);
+	if (ret)
+		goto exit_unlock;
+
 	ret = criu_checkpoint_bos(p, num_bos, (uint8_t __user *)args->bos,
 			    (uint8_t __user *)args->priv_data, &priv_offset);
 	if (ret)
@@ -2102,6 +2192,108 @@ static int criu_restore_process(struct kfd_process *p,
 	return ret;
 }
 
+static int criu_restore_devices(struct kfd_process *p,
+				struct kfd_ioctl_criu_args *args,
+				uint64_t *priv_offset,
+				uint64_t max_priv_data_size)
+{
+	struct kfd_criu_device_bucket *device_buckets;
+	struct kfd_criu_device_priv_data *device_privs;
+	int ret = 0;
+	uint32_t i;
+
+	if (args->num_devices != p->n_pdds)
+		return -EINVAL;
+
+	if (*priv_offset + (args->num_devices * sizeof(*device_privs)) > max_priv_data_size)
+		return -EINVAL;
+
+	device_buckets = kmalloc_array(args->num_devices, sizeof(*device_buckets), GFP_KERNEL);
+	if (!device_buckets)
+		return -ENOMEM;
+
+	ret = copy_from_user(device_buckets, (void __user *)args->devices,
+				args->num_devices * sizeof(*device_buckets));
+	if (ret) {
+		pr_err("Failed to copy devices buckets from user\n");
+		ret = -EFAULT;
+		goto exit;
+	}
+
+	for (i = 0; i < args->num_devices; i++) {
+		struct kfd_dev *dev;
+		struct kfd_process_device *pdd;
+		struct file *drm_file;
+
+		/* device private data is not currently used */
+
+		if (!device_buckets[i].user_gpu_id) {
+			pr_err("Invalid user gpu_id\n");
+			ret = -EINVAL;
+			goto exit;
+		}
+
+		dev = kfd_device_by_id(device_buckets[i].actual_gpu_id);
+		if (!dev) {
+			pr_err("Failed to find device with gpu_id = %x\n",
+				device_buckets[i].actual_gpu_id);
+			ret = -EINVAL;
+			goto exit;
+		}
+
+		pdd = kfd_get_process_device_data(dev, p);
+		if (!pdd) {
+			pr_err("Failed to get pdd for gpu_id = %x\n",
+					device_buckets[i].actual_gpu_id);
+			ret = -EINVAL;
+			goto exit;
+		}
+		pdd->user_gpu_id = device_buckets[i].user_gpu_id;
+
+		drm_file = fget(device_buckets[i].drm_fd);
+		if (!drm_file) {
+			pr_err("Invalid render node file descriptor sent from plugin (%d)\n",
+				device_buckets[i].drm_fd);
+			ret = -EINVAL;
+			goto exit;
+		}
+
+		if (pdd->drm_file) {
+			ret = -EINVAL;
+			goto exit;
+		}
+
+		/* create the vm using render nodes for kfd pdd */
+		if (kfd_process_device_init_vm(pdd, drm_file)) {
+			pr_err("could not init vm for given pdd\n");
+			/* On success, the PDD keeps the drm_file reference */
+			fput(drm_file);
+			ret = -EINVAL;
+			goto exit;
+		}
+		/*
+		 * pdd now already has the vm bound to render node so below api won't create a new
+		 * exclusive kfd mapping but use existing one with renderDXXX but is still needed
+		 * for iommu v2 binding  and runtime pm.
+		 */
+		pdd = kfd_bind_process_to_device(dev, p);
+		if (IS_ERR(pdd)) {
+			ret = PTR_ERR(pdd);
+			goto exit;
+		}
+	}
+
+	/*
+	 * We are not copying device private data from user as we are not using the data for now,
+	 * but we still adjust for its private data.
+	 */
+	*priv_offset += args->num_devices * sizeof(*device_privs);
+
+exit:
+	kfree(device_buckets);
+	return ret;
+}
+
 static int criu_restore_bos(struct kfd_process *p,
 			    struct kfd_ioctl_criu_args *args,
 			    uint64_t *priv_offset,
@@ -2160,19 +2352,6 @@ static int criu_restore_bos(struct kfd_process *p,
 		bo_bucket = &bo_buckets[i];
 		bo_priv = &bo_privs[i];
 
-		dev = kfd_device_by_id(bo_bucket->gpu_id);
-		if (!dev) {
-			ret = -EINVAL;
-			pr_err("Failed to get pdd\n");
-			goto exit;
-		}
-		pdd = kfd_get_process_device_data(dev, p);
-		if (!pdd) {
-			ret = -EINVAL;
-			pr_err("Failed to get pdd\n");
-			goto exit;
-		}
-
 		pr_debug("kfd restore ioctl - bo_bucket[%d]:\n", i);
 		pr_debug("size = 0x%llx, bo_addr = 0x%llx bo_offset = 0x%llx\n"
 			"gpu_id = 0x%x alloc_flags = 0x%x\n"
@@ -2184,6 +2363,14 @@ static int criu_restore_bos(struct kfd_process *p,
 			bo_bucket->alloc_flags,
 			bo_priv->idr_handle);
 
+		pdd = kfd_process_device_data_by_id(p, bo_bucket->gpu_id);
+		if (!pdd) {
+			pr_err("Failed to get pdd\n");
+			ret = -ENODEV;
+			goto exit;
+		}
+		dev = pdd->dev;
+
 		if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_DOORBELL) {
 			pr_debug("restore ioctl: KFD_IOC_ALLOC_MEM_FLAGS_DOORBELL\n");
 			if (bo_bucket->size != kfd_doorbell_process_slice(dev)) {
@@ -2265,12 +2452,12 @@ static int criu_restore_bos(struct kfd_process *p,
 			if (!bo_priv->mapped_gpuids[j])
 				break;
 
-			peer = kfd_device_by_id(bo_priv->mapped_gpuids[j]);
-			if (!peer) {
-				pr_debug("Getting device by id failed for 0x%x\n", pdd->dev->id);
+			peer_pdd = kfd_process_device_data_by_id(p, bo_priv->mapped_gpuids[j]);
+			if (IS_ERR(peer_pdd)) {
 				ret = -EINVAL;
 				goto exit;
 			}
+			peer = peer_pdd->dev;
 
 			peer_pdd = kfd_bind_process_to_device(peer, p);
 			if (IS_ERR(peer_pdd)) {
@@ -2414,6 +2601,10 @@ static int criu_restore(struct file *filep,
 	if (ret)
 		goto exit_unlock;
 
+	ret = criu_restore_devices(p, args, &priv_offset, args->priv_data_size);
+	if (ret)
+		goto exit_unlock;
+
 	ret = criu_restore_bos(p, args, &priv_offset, args->priv_data_size);
 	if (ret)
 		goto exit_unlock;
@@ -2519,13 +2710,14 @@ static int criu_process_info(struct file *filep,
 	args->pid = task_pid_nr_ns(p->lead_thread,
 					task_active_pid_ns(p->lead_thread));
 
-	ret = criu_get_process_object_info(p, &args->num_bos, &args->num_objects,
-					   &args->priv_data_size);
+	ret = criu_get_process_object_info(p, &args->num_devices, &args->num_bos,
+					   &args->num_objects, &args->priv_data_size);
 	if (ret)
 		goto err_unlock;
 
-	dev_dbg(kfd_device, "Num of bos:%u objects:%u priv_data_size:%lld\n",
-				args->num_bos, args->num_objects, args->priv_data_size);
+	dev_dbg(kfd_device, "Num of devices:%u bos:%u objects:%u priv_data_size:%lld\n",
+				args->num_devices, args->num_bos, args->num_objects,
+				args->priv_data_size);
 
 err_unlock:
 	if (ret) {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_events.c b/drivers/gpu/drm/amd/amdkfd/kfd_events.c
index 9341ce5d0fc9..b5eda1e04f34 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_events.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_events.c
@@ -342,11 +342,12 @@ int kfd_kmap_event_page(struct kfd_process *p, uint64_t event_page_offset)
 		return -EINVAL;
 	}
 
-	kfd = kfd_device_by_id(GET_GPU_ID(event_page_offset));
-	if (!kfd) {
+	pdd = kfd_process_device_data_by_id(p, GET_GPU_ID(event_page_offset));
+	if (!pdd) {
 		pr_err("Getting device by id failed in %s\n", __func__);
 		return -EINVAL;
 	}
+	kfd = pdd->dev;
 
 	pdd = kfd_bind_process_to_device(kfd, p);
 	if (IS_ERR(pdd))
@@ -1094,6 +1095,7 @@ void kfd_signal_iommu_event(struct kfd_dev *dev, u32 pasid,
 {
 	struct kfd_hsa_memory_exception_data memory_exception_data;
 	struct vm_area_struct *vma;
+	int user_gpu_id;
 
 	/*
 	 * Because we are called from arbitrary context (workqueue) as opposed
@@ -1115,12 +1117,17 @@ void kfd_signal_iommu_event(struct kfd_dev *dev, u32 pasid,
 		return; /* Process is exiting */
 	}
 
+	user_gpu_id = kfd_process_get_user_gpu_id(p, dev->id);
+	if (unlikely(user_gpu_id == -EINVAL)) {
+		WARN_ONCE(1, "Could not get user_gpu_id from dev->id:%x\n", dev->id);
+		return;
+	}
 	memset(&memory_exception_data, 0, sizeof(memory_exception_data));
 
 	mmap_read_lock(mm);
 	vma = find_vma(mm, address);
 
-	memory_exception_data.gpu_id = dev->id;
+	memory_exception_data.gpu_id = user_gpu_id;
 	memory_exception_data.va = address;
 	/* Set failure reason */
 	memory_exception_data.failure.NotPresent = 1;
@@ -1196,11 +1203,19 @@ void kfd_signal_vm_fault_event(struct kfd_dev *dev, u32 pasid,
 	uint32_t id;
 	struct kfd_process *p = kfd_lookup_process_by_pasid(pasid);
 	struct kfd_hsa_memory_exception_data memory_exception_data;
+	int user_gpu_id;
 
 	if (!p)
 		return; /* Presumably process exited. */
+
+	user_gpu_id = kfd_process_get_user_gpu_id(p, dev->id);
+	if (unlikely(user_gpu_id == -EINVAL)) {
+		WARN_ONCE(1, "Could not get user_gpu_id from dev->id:%x\n", dev->id);
+		return;
+	}
+
 	memset(&memory_exception_data, 0, sizeof(memory_exception_data));
-	memory_exception_data.gpu_id = dev->id;
+	memory_exception_data.gpu_id = user_gpu_id;
 	memory_exception_data.failure.imprecise = true;
 	/* Set failure reason */
 	if (info) {
@@ -1240,27 +1255,34 @@ void kfd_signal_reset_event(struct kfd_dev *dev)
 
 	/* Whole gpu reset caused by GPU hang and memory is lost */
 	memset(&hw_exception_data, 0, sizeof(hw_exception_data));
-	hw_exception_data.gpu_id = dev->id;
 	hw_exception_data.memory_lost = 1;
 	hw_exception_data.reset_cause = reset_cause;
 
 	memset(&memory_exception_data, 0, sizeof(memory_exception_data));
 	memory_exception_data.ErrorType = KFD_MEM_ERR_SRAM_ECC;
-	memory_exception_data.gpu_id = dev->id;
 	memory_exception_data.failure.imprecise = true;
 
 	idx = srcu_read_lock(&kfd_processes_srcu);
 	hash_for_each_rcu(kfd_processes_table, temp, p, kfd_processes) {
+		int user_gpu_id = kfd_process_get_user_gpu_id(p, dev->id);
+
+		if (unlikely(user_gpu_id == -EINVAL)) {
+			WARN_ONCE(1, "Could not get user_gpu_id from dev->id:%x\n", dev->id);
+			continue;
+		}
+
 		mutex_lock(&p->event_mutex);
 		id = KFD_FIRST_NONSIGNAL_EVENT_ID;
 		idr_for_each_entry_continue(&p->event_idr, ev, id) {
 			if (ev->type == KFD_EVENT_TYPE_HW_EXCEPTION) {
 				ev->hw_exception_data = hw_exception_data;
+				ev->hw_exception_data.gpu_id = user_gpu_id;
 				set_event(ev);
 			}
 			if (ev->type == KFD_EVENT_TYPE_MEMORY &&
 			    reset_cause == KFD_HW_EXCEPTION_ECC) {
 				ev->memory_exception_data = memory_exception_data;
+				ev->memory_exception_data.gpu_id = user_gpu_id;
 				set_event(ev);
 			}
 		}
@@ -1276,18 +1298,25 @@ void kfd_signal_poison_consumed_event(struct kfd_dev *dev, u32 pasid)
 	struct kfd_hsa_hw_exception_data hw_exception_data;
 	struct kfd_event *ev;
 	uint32_t id = KFD_FIRST_NONSIGNAL_EVENT_ID;
+	int user_gpu_id;
 
 	if (!p)
 		return; /* Presumably process exited. */
 
+	user_gpu_id = kfd_process_get_user_gpu_id(p, dev->id);
+	if (unlikely(user_gpu_id == -EINVAL)) {
+		WARN_ONCE(1, "Could not get user_gpu_id from dev->id:%x\n", dev->id);
+		return;
+	}
+
 	memset(&hw_exception_data, 0, sizeof(hw_exception_data));
-	hw_exception_data.gpu_id = dev->id;
+	hw_exception_data.gpu_id = user_gpu_id;
 	hw_exception_data.memory_lost = 1;
 	hw_exception_data.reset_cause = KFD_HW_EXCEPTION_ECC;
 
 	memset(&memory_exception_data, 0, sizeof(memory_exception_data));
 	memory_exception_data.ErrorType = KFD_MEM_ERR_POISON_CONSUMED;
-	memory_exception_data.gpu_id = dev->id;
+	memory_exception_data.gpu_id = user_gpu_id;
 	memory_exception_data.failure.imprecise = true;
 
 	mutex_lock(&p->event_mutex);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index a629e9dc92af..df68c4274bd9 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -774,6 +774,12 @@ struct kfd_process_device {
 	uint64_t faults;
 	uint64_t page_in;
 	uint64_t page_out;
+	/*
+	 * If this process has been checkpointed before, then the user
+	 * application will use the original gpu_id on the
+	 * checkpointed node to refer to this device.
+	 */
+	uint32_t user_gpu_id;
 };
 
 #define qpd_to_pdd(x) container_of(x, struct kfd_process_device, qpd)
@@ -933,6 +939,11 @@ int kfd_process_restore_queues(struct kfd_process *p);
 void kfd_suspend_all_processes(void);
 int kfd_resume_all_processes(void);
 
+struct kfd_process_device *kfd_process_device_data_by_id(struct kfd_process *process,
+							 uint32_t gpu_id);
+
+int kfd_process_get_user_gpu_id(struct kfd_process *p, uint32_t actual_gpu_id);
+
 int kfd_process_device_init_vm(struct kfd_process_device *pdd,
 			       struct file *drm_file);
 struct kfd_process_device *kfd_bind_process_to_device(struct kfd_dev *dev,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 0649064b8e95..06e6e9180fbc 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1526,6 +1526,7 @@ struct kfd_process_device *kfd_create_process_device_data(struct kfd_dev *dev,
 	pdd->runtime_inuse = false;
 	pdd->vram_usage = 0;
 	pdd->sdma_past_activity_counter = 0;
+	pdd->user_gpu_id = dev->id;
 	atomic64_set(&pdd->evict_duration_counter, 0);
 	p->pdds[p->n_pdds++] = pdd;
 
@@ -1981,6 +1982,37 @@ void kfd_flush_tlb(struct kfd_process_device *pdd, enum TLB_FLUSH_TYPE type)
 	}
 }
 
+struct kfd_process_device *kfd_process_device_data_by_id(struct kfd_process *p, uint32_t gpu_id)
+{
+	int i;
+
+	if (gpu_id) {
+		for (i = 0; i < p->n_pdds; i++) {
+			struct kfd_process_device *pdd = p->pdds[i];
+
+			if (pdd->user_gpu_id == gpu_id)
+				return pdd;
+		}
+	}
+	return NULL;
+}
+
+int kfd_process_get_user_gpu_id(struct kfd_process *p, uint32_t actual_gpu_id)
+{
+	int i;
+
+	if (!actual_gpu_id)
+		return 0;
+
+	for (i = 0; i < p->n_pdds; i++) {
+		struct kfd_process_device *pdd = p->pdds[i];
+
+		if (pdd->dev->id == actual_gpu_id)
+			return pdd->user_gpu_id;
+	}
+	return -EINVAL;
+}
+
 #if defined(CONFIG_DEBUG_FS)
 
 int kfd_debugfs_mqds_by_process(struct seq_file *m, void *data)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
index bd89dd0ca83e..70ea4849e6a2 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
@@ -610,7 +610,7 @@ static int criu_checkpoint_queue(struct kfd_process_device *pdd,
 	mqd = (void *)(q_data + 1);
 	ctl_stack = mqd + q_data->mqd_size;
 
-	q_data->gpu_id = pdd->dev->id;
+	q_data->gpu_id = pdd->user_gpu_id;
 	q_data->type = q->properties.type;
 	q_data->format = q->properties.format;
 	q_data->q_id =  q->properties.queue_id;
@@ -769,7 +769,6 @@ int kfd_criu_restore_queue(struct kfd_process *p,
 	uint64_t q_extra_data_size;
 	struct queue_properties qp;
 	unsigned int queue_id;
-	struct kfd_dev *dev;
 	int ret = 0;
 
 	if (*priv_data_offset + sizeof(*q_data) > max_priv_data_size)
@@ -807,20 +806,11 @@ int kfd_criu_restore_queue(struct kfd_process *p,
 
 	*priv_data_offset += q_extra_data_size;
 
-	dev = kfd_device_by_id(q_data->gpu_id);
-	if (!dev) {
-		pr_err("Could not get kfd_dev from gpu_id = 0x%x\n",
-		q_data->gpu_id);
-
-		ret = -EINVAL;
-		goto exit;
-	}
-
-	pdd = kfd_get_process_device_data(dev, p);
+	pdd = kfd_process_device_data_by_id(p, q_data->gpu_id);
 	if (!pdd) {
 		pr_err("Failed to get pdd\n");
-		ret = -EFAULT;
-		return ret;
+		ret = -EINVAL;
+		goto exit;
 	}
 	/* data stored in this order: mqd, ctl_stack */
 	mqd = q_extra_data;
-- 
2.17.1

