Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 619219E7F99
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2024 11:52:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D83B210E21B;
	Sat,  7 Dec 2024 10:52:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Xhugr7oU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2082.outbound.protection.outlook.com [40.107.236.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC4D510E21B
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2024 10:52:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SlvR02hKEYgqecz9uAmyFruuuJEldYY2K2oz+/k5/jqjqpwPKQfUekkQnKpKc0mv47KjjSDn5v3O8r9YTLPVkoPPb9/G+6XTMomnrEcTj5GQsS6e192FtrDO7GkFSAFyQSC/OQWj91In3QSsJtaVT1AKBEd36cz3Fu82oI+5bS7gwSdydokkMCNTYErfx2ux2MaOIjQXjaJ08NBcgaGRqSmpxZXg6/pkx+R4+L1mQrOieMfb/vdloLoiUZWXiaLMBfwxZZUGLMpCBni2fZq51v2vLI6XpbBKtjYMrNtZNVCBAejqdJ1NhscRbY+L8ORvxJ6TXTui1AbXnfnokMt5Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3z7f/RAhcwAHkXYmUepiHSK25Jlz0SNuaumnbydHfcc=;
 b=XlfTi3mH4Fu7BLO+vkBCMu3xvYGm6vgCBpORbxO6uetUBPOnJUCPXsVoRN9hAzESvASBLDkj9keVMZ5hZEEF44d07GiauQALwQ2z46YuxTMREhaX/AA6dHuKHaXk89xXNOMKyfJYsAeqjePQat0rhGYI4mVtW+xsXbK9L+nvjoQOuf0jWcxkLda+dh4iKu53eSJS9ICPx/FaI+farccp6Ff+YQBkgJ9wr2QrWCpyNJlGklAuMeYpiFk5/x/wL75nHL5EEo+Ff7lTeczp03qGeU9rLQjUvmdGCnOQLkEZo62sFNtpLCJSLILIN4Q/OMX5SldaAXxl+fRAG6kpeDaRiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3z7f/RAhcwAHkXYmUepiHSK25Jlz0SNuaumnbydHfcc=;
 b=Xhugr7oUoK1G6fhyrFgCD8kKP0JKFbNK8HWiq5awZ+LF78bVE7ecksUnCnTbU2V9FHJWLVvxFbcNHp1Aayufp8LyPu/WeA3ByXk2jKNMkgFpx4BujnF+mz9ZXjYYVXJyt0S4ygh+kXeIQnyghBYYRI3PxFIEvj/ogHTPjTpNVMk=
Received: from CH2PR18CA0023.namprd18.prod.outlook.com (2603:10b6:610:4f::33)
 by SA1PR12MB8119.namprd12.prod.outlook.com (2603:10b6:806:337::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Sat, 7 Dec
 2024 10:52:21 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:4f:cafe::e1) by CH2PR18CA0023.outlook.office365.com
 (2603:10b6:610:4f::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.12 via Frontend Transport; Sat,
 7 Dec 2024 10:52:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Sat, 7 Dec 2024 10:52:17 +0000
Received: from jenkins-julia.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 7 Dec
 2024 04:52:12 -0600
From: Julia Zhang <julia.zhang@amd.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
 <dri-devel@lists.freedesktop.org>,
 <virtualization@lists.linux-foundation.org>, Juergen Gross <jgross@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, <xen-devel@lists.xenproject.org>
CC: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Daniel Vetter
 <daniel@ffwll.ch>, Chen Jiqian <Jiqian.Chen@amd.com>, Huang Rui
 <ray.huang@amd.com>, Penny Zheng <penny.zheng@amd.com>, Zhu Lingshan
 <Lingshan.Zhu@amd.com>, Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Paul Durrant <paul@xen.org>, Julia Zhang
 <julia.zhang@amd.com>
Subject: [PATCH 1/3] xen:get p2pdma_distance
Date: Sat, 7 Dec 2024 18:50:22 +0800
Message-ID: <20241207105023.542399-2-julia.zhang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241207105023.542399-1-julia.zhang@amd.com>
References: <20241207105023.542399-1-julia.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|SA1PR12MB8119:EE_
X-MS-Office365-Filtering-Correlation-Id: ecae0a17-be8f-4c2e-da1a-08dd16ad37e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DU1i4lB89NXMg++EWvDHebP0wVGJ0sI3UJ+iKv+sVi2uSJTyV7UjIJZzESkh?=
 =?us-ascii?Q?xsJ8sDlpy+OZD0o9cptA0TCn+aMbZV6P/W0WEbxeG+GyGGVKv2sTHBzY6/L4?=
 =?us-ascii?Q?qlIkhb9h23QT03iB6e3cTwxsdMANV5LmdvrX/iU/1hdj7uqDyVU6dC8vbAVA?=
 =?us-ascii?Q?ZmIcPs7aoGEl04/3GUX1tJ6qrAqFTO2pY27wKQDq/fBX1lTBZorHVP/d9gYl?=
 =?us-ascii?Q?ExJ1flL3I//ikRm3tXRVRmgH6Kb3lWLYjdR4qRLPP94oEbva+3Tp0599kx97?=
 =?us-ascii?Q?Xhsh2Qw6QACwe9m7zhRmmkWvkmVOVXciQMyhLdGZ7R20Nf9t6Tu5Vf8TJrti?=
 =?us-ascii?Q?PaV/HoSAF5vTSzlz/Jm9sLe8jUDkH08Z6AxDJLJs7tbfDWvb2K1y7ArN94kQ?=
 =?us-ascii?Q?C69eZuNwA90xnKKeFxyPDgfBCF9FnmFK5sRo/i05kPzqiMisbGw5Or528oGu?=
 =?us-ascii?Q?c18U5xwrpt3JDT5283MDFGV9SmKUo77dFIX4Eao6BYOs45Fjw2Z+QrxSNzih?=
 =?us-ascii?Q?cNSEb31XUiJvK5SDH0PuiLRP+rL6SRc4IVssKtqAlz9kgxUaNlk2FMEJNosw?=
 =?us-ascii?Q?yrK8PO+TG+EGemGeM1Gv/F16g1CK8PI9N/ccTcTubHl8BZjqhpT8X6161bQF?=
 =?us-ascii?Q?JejXn6NT5kD7yK3hWholwbsIltzvYrr0y4zxDMiyd+W5Uv4uGE+cmhFnXcVv?=
 =?us-ascii?Q?yh1ldoTqhBPdKHnWboNonA4a64gKYFPbiPLhtbbGrqM/Lv89gLYf3xfTb8kU?=
 =?us-ascii?Q?vVG37IKT+NsgVa7FVb0wdMX/IiYkWpQXgSWlBX/pkae8in/uUdJdCjDk/gIN?=
 =?us-ascii?Q?X66mcdX8hixyjuYdUmS3+BDvrCmYpi9HHvpiy5EqreGTESGXWHcJzfkUFWEy?=
 =?us-ascii?Q?M9ffIUkbYpYunh8dAeMfvVaLJ8oo28jsL6uF6QAcm3tSQOlG1X/+GPgEp+Wv?=
 =?us-ascii?Q?LHCI9rD2IMYpzfLp3Gkf0hNCUqrvFf08D3nGxcNKbprMfHG/spMbf3+TKgMx?=
 =?us-ascii?Q?2IhZnamIevGEMPzYrUxVb1x1nUWmNCWmsjGyg/I8lOGBYjvwo1bM0qt5hJnc?=
 =?us-ascii?Q?0dUaOjbcbHVN13tJatnu5DGNTZeuWNUpwU0vF0nZQMnAO8NXvEKAqxeb/ImO?=
 =?us-ascii?Q?eDeY+ySEiq8y6fDk0k1XfFoSj8jd4Rogc0Twgnc4VSwtbHQnjwz0DFhJrNVW?=
 =?us-ascii?Q?cZgl1OwjDxnoJzaCuIO6Cs1vJN6rfNY4blVg4LULy5DReVMhvIt02rkQ1Ar1?=
 =?us-ascii?Q?2M9mz4JIGW5aihL/uqcJcunjw8teB/pye7C8lEU1q22Rg6dkk9myvjR25kfT?=
 =?us-ascii?Q?Nls6CNN9MQaTawR5eKwxk5Swh1wpK6qXlgbV6A22HwhFqqyX4uZHRh/KLlqV?=
 =?us-ascii?Q?m/5UImk5FQbyJ0hBavBj9WWDCshUqoYmxdnBCSzF+6zwLxTgZIBpeCTa93TA?=
 =?us-ascii?Q?WwrhuWzEMU2uI7/F5U8Gbg3Munkp3msIzRIVpP12qLxzo3KgODkpMA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2024 10:52:17.8242 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecae0a17-be8f-4c2e-da1a-08dd16ad37e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8119
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

To get the p2pdma_distance, this create a new privcmd ioctl to calculate
p2pdma_distance for two pci devices on the host with pci notations sent
from guest virtgpu driver.

Signed-off-by: Julia Zhang <julia.zhang@amd.com>
---
 drivers/xen/privcmd.c      | 42 ++++++++++++++++++++++++++++++++++++++
 include/uapi/xen/privcmd.h | 12 +++++++++++
 2 files changed, 54 insertions(+)

diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index 72c161e94731..95f67815a2ef 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -31,6 +31,9 @@
 #include <linux/miscdevice.h>
 #include <linux/moduleparam.h>
 #include <linux/virtio_mmio.h>
+#include <linux/pci.h>
+#include <linux/pci-p2pdma.h>
+#include <linux/dma-map-ops.h>
 
 #include <asm/xen/hypervisor.h>
 #include <asm/xen/hypercall.h>
@@ -977,6 +980,42 @@ static long privcmd_ioctl_map_hva_to_gpfns(struct file *file, void __user *udata
 	return ret;
 }
 
+static int privcmd_ioctl_p2pdma_distance(struct file *file, void __user *udata)
+{
+	struct privcmd_p2pdma_distance kdata;
+	struct pci_dev *provider = NULL;
+	struct pci_dev *client = NULL;
+	struct pci_dev *dev = NULL;
+	enum pci_p2pdma_map_type map;
+
+	if (copy_from_user(&kdata, udata, sizeof(kdata)))
+		return -EFAULT;
+
+	for_each_pci_dev(dev) {
+		if (dev->bus->number == kdata.provider_bus &&
+		    dev->devfn == PCI_DEVFN(kdata.provider_slot, kdata.provider_func)) {
+			provider = dev;
+		} else if (dev->bus->number == kdata.client_bus &&
+			   dev->devfn == PCI_DEVFN(kdata.client_slot, kdata.client_func)) {
+			client = dev;
+		} else {
+			continue;
+		}
+	}
+
+	if (!provider || !client) {
+		pr_err("%s fail to get provider or client.\n", __func__);
+		return -EINVAL;
+	}
+
+	kdata.distance = pci_p2pdma_distance(provider, &client->dev, false);
+
+	if (copy_to_user(udata, &kdata, sizeof(kdata)))
+		return -EFAULT;
+
+	return 0;
+}
+
 #ifdef CONFIG_XEN_PRIVCMD_EVENTFD
 /* Irqfd support */
 static struct workqueue_struct *irqfd_cleanup_wq;
@@ -1684,6 +1723,9 @@ static long privcmd_ioctl(struct file *file,
 		ret = privcmd_ioctl_map_hva_to_gpfns(file, udata);
 		break;
 
+	case IOCTL_PRIVCMD_P2PDMA_DISTANCE:
+		ret = privcmd_ioctl_p2pdma_distance(file, udata);
+		break;
 
 	default:
 		break;
diff --git a/include/uapi/xen/privcmd.h b/include/uapi/xen/privcmd.h
index d131002dd48f..a7ec3704519f 100644
--- a/include/uapi/xen/privcmd.h
+++ b/include/uapi/xen/privcmd.h
@@ -141,6 +141,16 @@ struct privcmd_map_hva_to_gpfns {
 	int add_mapping;
 };
 
+struct privcmd_p2pdma_distance {
+	__u32 provider_bus;
+	__u32 provider_slot;
+	__u32 provider_func;
+	__u32 client_bus;
+	__u32 client_slot;
+	__u32 client_func;
+	__u32 distance;
+};
+
 /*
  * @cmd: IOCTL_PRIVCMD_HYPERCALL
  * @arg: &privcmd_hypercall_t
@@ -174,6 +184,8 @@ struct privcmd_map_hva_to_gpfns {
 	_IOW('P', 9, struct privcmd_ioeventfd)
 #define IOCTL_PRIVCMD_PCIDEV_GET_GSI				\
 	_IOC(_IOC_NONE, 'P', 10, sizeof(struct privcmd_pcidev_get_gsi))
+#define IOCTL_PRIVCMD_P2PDMA_DISTANCE                          \
+	_IOC(_IOC_NONE, 'P', 11, sizeof(struct privcmd_p2pdma_distance))
 #define IOCTL_PRIVCMD_MAP_HVA_TO_GPFNS                          \
 	_IOC(_IOC_NONE, 'P', 13, sizeof(struct privcmd_map_hva_to_gpfns))
 
-- 
2.34.1

