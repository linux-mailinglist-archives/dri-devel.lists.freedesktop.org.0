Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9A34A80FD
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 10:09:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F7610EA00;
	Thu,  3 Feb 2022 09:09:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2068.outbound.protection.outlook.com [40.107.236.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF31710EA00;
 Thu,  3 Feb 2022 09:09:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BjU+X7gNPPeIzuEzdkIuRQKS3lN5vwM9dWV7Bs8j2WPVBEPK/KxabSaruclcT7MmNgijp/Y9hr15WtC5c9Nzq2qkjCXTXQqC0wn80gUig6/Hrqelyt7aAwci2sXUvKClz6MlSCiLRvx9Wq6+4x8usFoUSXBDX2Goxb+2Z8GHWrX8jqboDaXSD3sFZBt+2vd6R9VmP3vmEs2ru52VtX5W5hzOqhnUgreMLD3fVp9konytiV+XI/YLYKICWbQ2imjE8aCjWkzRtfaVTQikGrv1bTELqFn0W1ptk7BgQqVpCVFP2Di4P9AUs0DIWBjJsBt9Sx89GHmvJsDATbgX3rnlwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Chy5N7t8sYPBHvybcSxfLQQjqwDbn1CXoXSDH7JC5w=;
 b=fu6OqZOQrCMbNa5b1R7KH+w2ER0Geub/a3GinXQnUHR3+zZQPOw6X/oOKlv+erRCHUpOpx4YqhdmIP0gWmHN2696ZEP5kqMwzbVvccKtmQwQOJPMwTa2FuKMx/QZshBtQBaLNVIqrqbDeCwx4mgDsMZKomr1IgtW5NSUb7ZbR9oKbDfsS3Yfrz1ev+TbOhzLRLAXSAg2VodiYu06huTK2voibmvthc+jr/tAMErMLUM91HjitltEo+zBleHhZnunhCZ7hk+bJag0UmVo3jRT4WQE4ZKTVpHlmXXk5nzgQ9gYv8iuq0lx5r+twAkh/IQsDPy4VhVeMK0ylZaqUqOgEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Chy5N7t8sYPBHvybcSxfLQQjqwDbn1CXoXSDH7JC5w=;
 b=Jt2+NLavjy/X+8TYQE0UkbsfcX+LeaCHtVH5kqjSzzP0yKMTlKm8RgJ42xJHZ24heuT+UiwNXf+ni8StcaLfkDKUz8TWWa77QE5d70zN6FuXr5ZRJ1Ib1gptSLn3uHuFYvLinygTY53O4JvRITZfrx0UHT0Asw9Su36W0yrAGfE=
Received: from BN9PR03CA0367.namprd03.prod.outlook.com (2603:10b6:408:f7::12)
 by DM5PR12MB1929.namprd12.prod.outlook.com (2603:10b6:3:106::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 09:09:36 +0000
Received: from BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::34) by BN9PR03CA0367.outlook.office365.com
 (2603:10b6:408:f7::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Thu, 3 Feb 2022 09:09:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT037.mail.protection.outlook.com (10.13.177.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Thu, 3 Feb 2022 09:09:36 +0000
Received: from rajneesh-desk.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Feb
 2022 03:09:33 -0600
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [Patch v5 03/24] drm/amdkfd: CRIU Implement KFD process_info ioctl
Date: Thu, 3 Feb 2022 04:08:57 -0500
Message-ID: <20220203090918.11520-4-rajneesh.bhardwaj@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: b568d742-67df-48cf-4384-08d9e6f4e68a
X-MS-TrafficTypeDiagnostic: DM5PR12MB1929:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB1929A8298520BED943EAA121FE289@DM5PR12MB1929.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DU1KkGMBl/G/hVxrN8J+4izRP/xrHgwoxmWmmwqxHCkVji9Eg1GAbTjmr3x5uwW85m9zo7t4ppMJb6XEpmMp9dARd18MTfliaVTFwLJNGry8/s3jSViVaWZ6rEWhy18Dh52qPCUR4WZ48daYvHi/aVbKqp+T1oUAGvDxCwSkVM5Qw25YHX7N06UymFaG2Vtq4XiMqnw/ZzRR9iCvQB+nSxn9S5/xIhrNJquxa+hcoFI/JeozyGzIPQm8hjaPeolwsNTkIViZNux73GRaAEqWEHYYK33ev44S4+PZTc7Emu22KTEYEe+gJul706q2crYJJwlizMqp8H8fOVpWLKZ9KDvprlxifZcyJ89YcdmvOcMUMHkp3yLvlU8HO0VDa+52rvB4PMdkrecVTxj3lbiyxCUoDQYjt24n0F1/S5g+XMZv2Gq0aNgKPZPcnlfe+9KycRysxiwtK2YhretGkXHhf01cKmThbXXU5/uBk3TfBeoc9qA7f7aJ5XKNfWGzV7Ta69GG2YskuLSsm9wakA7HM/ApmaGAIkQNU4bf78cxzK5CtREFAgJy0rxS62ml6tmrygTz5/CivDdH/5r0xRs9fms9sjJ5am4Mm4ujdfWPCrzx71I0xXUk1b7uJzP8wDeuASPCCqPODHaWZj3mjP4z1LMegjBvI8Dye9WujV+HyeuoRo/k1mDQCuYQDhFNiQIQJp+Ilf18cW9UOvCgXavcSQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(6916009)(54906003)(316002)(8936002)(4326008)(70586007)(70206006)(450100002)(7696005)(8676002)(508600001)(2906002)(44832011)(36756003)(5660300002)(2616005)(6666004)(16526019)(426003)(336012)(47076005)(356005)(81166007)(186003)(1076003)(26005)(86362001)(82310400004)(40460700003)(36860700001)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 09:09:36.3084 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b568d742-67df-48cf-4384-08d9e6f4e68a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1929
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

This IOCTL op is expected to be called as a precursor to the actual
Checkpoint operation. This does the basic discovery into the target
process seized by CRIU and relays the information to the userspace that
utilizes it to start the Checkpoint operation via another dedicated
IOCTL op.

The process_info IOCTL op determines the number of GPUs, buffer objects
that are associated with the target process, its process id in
caller's namespace since /proc/pid/mem interface maybe used to drain
the contents of the discovered buffer objects in userspace and getpid
returns the pid of CRIU dumper process. Also the pid of a process
inside a container might be different than its global pid so return
the ns pid.

Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
Signed-off-by: David Yat Sin <david.yatsin@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 56 +++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 90e6d9e335a5..29443419bbf0 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1860,6 +1860,42 @@ static int kfd_ioctl_svm(struct file *filep, struct kfd_process *p, void *data)
 }
 #endif
 
+uint32_t get_process_num_bos(struct kfd_process *p)
+{
+	uint32_t num_of_bos = 0;
+	int i;
+
+	/* Run over all PDDs of the process */
+	for (i = 0; i < p->n_pdds; i++) {
+		struct kfd_process_device *pdd = p->pdds[i];
+		void *mem;
+		int id;
+
+		idr_for_each_entry(&pdd->alloc_idr, mem, id) {
+			struct kgd_mem *kgd_mem = (struct kgd_mem *)mem;
+
+			if ((uint64_t)kgd_mem->va > pdd->gpuvm_base)
+				num_of_bos++;
+		}
+	}
+	return num_of_bos;
+}
+
+static void criu_get_process_object_info(struct kfd_process *p,
+					 uint32_t *num_bos,
+					 uint64_t *objs_priv_size)
+{
+	uint64_t priv_size;
+
+	*num_bos = get_process_num_bos(p);
+
+	if (objs_priv_size) {
+		priv_size = sizeof(struct kfd_criu_process_priv_data);
+		priv_size += *num_bos * sizeof(struct kfd_criu_bo_priv_data);
+		*objs_priv_size = priv_size;
+	}
+}
+
 static int criu_checkpoint(struct file *filep,
 			   struct kfd_process *p,
 			   struct kfd_ioctl_criu_args *args)
@@ -1892,7 +1928,25 @@ static int criu_process_info(struct file *filep,
 				struct kfd_process *p,
 				struct kfd_ioctl_criu_args *args)
 {
-	return 0;
+	int ret = 0;
+
+	mutex_lock(&p->mutex);
+
+	if (!p->n_pdds) {
+		pr_err("No pdd for given process\n");
+		ret = -ENODEV;
+		goto err_unlock;
+	}
+
+	args->pid = task_pid_nr_ns(p->lead_thread,
+					task_active_pid_ns(p->lead_thread));
+
+	criu_get_process_object_info(p, &args->num_bos, &args->priv_data_size);
+
+	dev_dbg(kfd_device, "Num of bos:%u\n", args->num_bos);
+err_unlock:
+	mutex_unlock(&p->mutex);
+	return ret;
 }
 
 static int kfd_ioctl_criu(struct file *filep, struct kfd_process *p, void *data)
-- 
2.17.1

