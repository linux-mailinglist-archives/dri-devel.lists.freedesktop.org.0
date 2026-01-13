Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26634D1AA9C
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 18:36:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6D3510E51E;
	Tue, 13 Jan 2026 17:36:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="a2MTtJnA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010036.outbound.protection.outlook.com [52.101.201.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48A4110E51E
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 17:36:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QnWkg8Q7W4nDEI07HWM0+ckqzlpsClDAiaXUHIYG31TwwvqOcEjuwTnaS4hdZOlRXcOdveKUcpItxTRyUjVS7NrW5zLL3oacUgv4Yay5RMtdzRYBskO3rjlAOTdQt/vOpc5BrguuItzQOEDBNS+QoBJD5Qmg40y83demg94/wHYWgLftC2yj01YyCA6B+8xSZxGRaSDTlAop40n9d7jrGHGdMe19TLF1n/vX02Y1yl+VYlWYEDF9BC+1wFBdwlCvwfzq7FP/37zNqEc2h/efqtG2HKyWTuMt/DFS7HQG2KG8f20GiNrU3dYUOzPk4F7Cy7ZvcsKSG/3I4clGW2xIAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fdd7duDjYvVHjjYmzvUVemoolHo3sr4hJ/eR0ywZ/+Y=;
 b=Ai2ZXUL+FjgUFLz4P1BUVzGqmoh0H9whKn+k86S0nGR6kGmjIFPuQtYMOT4JtFEzJHDTuTvJ6dZm3BV8vgU5zLM0kO9cLGTAz0BMwMkiBsnz9of0bTJQu8LhcjHTx8PFj6y0Uij3K9tJluRrEILrZoiTQDPQJG8qlddqBdcW64yN6loo0BlgFJhyiWUMRlJrxGAL1mTHeso36/RfV5z2ziu56CXZ9gkhYS+HA9+Y0mI7aOtEzx7CT01xemsXjO0ZWJIyYHzar7VJcchpXGl9gHhnRR87zF4VHGNaorTau+qM+69Q7yEbe9nr5kBEp3sRxQo+MQcVyD2m8+QdTjUZqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fdd7duDjYvVHjjYmzvUVemoolHo3sr4hJ/eR0ywZ/+Y=;
 b=a2MTtJnA+A18R9PnUk5+zkSpUZJCLLJgr9ltYL7kiYUFxj0JeevLETmtYUliqh3keoLw+ndO2PS5u0ufi7x92tzPg6ANQLDtdEBzM1z3WcY00fChhPCnn8ga+8u3hqotxLqKJoJRiUV64UGcpw3TB7UZw3xK4dNnc172nliPcnE=
Received: from SA1P222CA0001.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:22c::34)
 by DS0PR12MB8219.namprd12.prod.outlook.com (2603:10b6:8:de::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 17:36:34 +0000
Received: from SN1PEPF0002636A.namprd02.prod.outlook.com
 (2603:10b6:806:22c:cafe::94) by SA1P222CA0001.outlook.office365.com
 (2603:10b6:806:22c::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Tue,
 13 Jan 2026 17:35:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF0002636A.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 17:36:33 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 13 Jan
 2026 11:36:32 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 13 Jan
 2026 11:36:32 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 13 Jan 2026 11:36:31 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <maciej.falkowski@linux.intel.com>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V1] accel/amdxdna: Fix notifier_wq flushing warning
Date: Tue, 13 Jan 2026 09:36:24 -0800
Message-ID: <20260113173624.256053-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636A:EE_|DS0PR12MB8219:EE_
X-MS-Office365-Filtering-Correlation-Id: 7105192b-665e-4c8e-172c-08de52ca4b42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tYuigXvJyvj31ZSvHPXUTpa5AunRn5vr0uJAkL88MtH5yHqlMMMRUbHpxR+0?=
 =?us-ascii?Q?3XoRwCx6hoVEGRuYojm1POodxUe4uju3VjngiANPJ/nqNc9y36/tR6hyxeE4?=
 =?us-ascii?Q?1t6CdU65GXCu8c/6Idq87BZ+zpRL0aheiBaORZWwS8zQOGVEvVUUiRZmXIsU?=
 =?us-ascii?Q?o2PLV3oEPh+VT7siqktO1T7wkRolGPBEybt7H+LH/HNvfrjZqbdxw7ty21Jp?=
 =?us-ascii?Q?VxRUDlj/r5RZSVJcR3lx/Qn+01LI3Tr7dinCcyOdcDRES0vkElFDtjWN6j6D?=
 =?us-ascii?Q?WxY5msyYHwaJmdUIy2tI/CFvPi0aJP6L1YGFvS/+DkEm3+6s2x+xKBpXwIZO?=
 =?us-ascii?Q?hfXKQtZXOtwRqpxp/Tu4dkur6fR+nMLLy8YNdAtxs0SXfw9j94BfPc64kpY/?=
 =?us-ascii?Q?25H5tZNjD2GYp4wS79rvSbUp6BA0J8DoZxwGHXVGSvcNAr0qPg2ZrjR6Zdxa?=
 =?us-ascii?Q?XPa8P98Uw8mc7Au9x7r2H1Zc8xSAXpeiFPdXYORPkg+2nj3MC+wj4PeiRX+H?=
 =?us-ascii?Q?3oE0T3zPuNp7cSCSbWZ/8EhcZd07+/GQc2i3hHD2cdKXJbMkoF6xxxq5wtNQ?=
 =?us-ascii?Q?x5RcOLtXen2MwN8/McbanSqnvM+CXEABMgge6+g7C64QImbJOvIuogfy96/R?=
 =?us-ascii?Q?2hZbOTgAPcjIkKi/ohCRj8iNhAbnEfvuSMML2rrQxsUNpf/mYUggEj4+zoZE?=
 =?us-ascii?Q?mRqA75QUL1pMlnkqjdhKPXOp6rxlZWErXbTXYp9bKCnArKZf7cla3+2r/d9W?=
 =?us-ascii?Q?9fae8zmcZuKDoq/XlFFWpjc1SfZjwzm7ZM/iMraOmFig3zG9F2nNkAy7fXnQ?=
 =?us-ascii?Q?54rTi+7d4EN+YxV9ifCEulnra6hNhu/z4V2eWW4Y6Tl+9atKFe+2i/tNCUb7?=
 =?us-ascii?Q?dld+zeg6q2vFp9A1ODnma54gC3Kvbw7rbCVGQJSaeNXVuzehuuipqvsO2pDa?=
 =?us-ascii?Q?Hs8pgEjq0ZG8G0SgHjVazLN1t93xdb7+iZBYpOi8OTGz/9zzuz6eAZCky52V?=
 =?us-ascii?Q?94i5WVFaKglf/kelQUm0DxWx8emJzFBqFHxSHnPIB6lVHZDF/rEl+9MPZKzy?=
 =?us-ascii?Q?LHQqbS+knj4JgxZp/iio4nB7aBCHv2xDCTN5u7wbZXTTQrNisK4K6bn1wMPX?=
 =?us-ascii?Q?03LIF+kzvHPOvNGSdSapTA996mJMxz4ly83myToT6Z7fQsBzZg0KA/E6RzJk?=
 =?us-ascii?Q?PlnVl/AYiipX1oyRzFi+FlILdv8svatmj1/xAsw1ojTiDiiImt9Oh6eS3ibO?=
 =?us-ascii?Q?OS5hgEG+ERla15jX5fOH8Vn7/NN28HJ4wwizhCVuTFUlZ0U/JRX2J7VjqWhA?=
 =?us-ascii?Q?iyWEE6bGsRemwmbwDNqcBsDLfmNYrjCX83kqC9GSly1vx7ji8j1wHtU/2oSG?=
 =?us-ascii?Q?d36sWZomNk+NPFLjDNlWHGIUBbf+XYEbiwMW6AHU84TB07MsrpqBRSyE6Mve?=
 =?us-ascii?Q?oFGzxYCKe+ZZTnGWuGBmQHqzM4Bv9SPYH/3hUPVI3BxVUqVIR+QZ138sCIwO?=
 =?us-ascii?Q?rjtYptohvErfIuvkAjfz5MUGOcGChNVdGiSXcVIBDv4w7piHX+Cp7Il1ngzD?=
 =?us-ascii?Q?x4H10Su+DVpb0oLrGN4=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 17:36:33.2032 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7105192b-665e-4c8e-172c-08de52ca4b42
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8219
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

Create notifier_wq with WQ_MEM_RECLAIM flag to fix the possible warning.

  workqueue: WQ_MEM_RECLAIM amdxdna_js:drm_sched_free_job_work [gpu_sched] is flushing !WQ_MEM_RECLAIM notifier_wq:0x0

Fixes: e486147c912f ("accel/amdxdna: Add BO import and export")
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/amdxdna_pci_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
index a7968fd140a9..1c83efb51f7d 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
@@ -277,7 +277,7 @@ static int amdxdna_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		fs_reclaim_release(GFP_KERNEL);
 	}
 
-	xdna->notifier_wq = alloc_ordered_workqueue("notifier_wq", 0);
+	xdna->notifier_wq = alloc_ordered_workqueue("notifier_wq", WQ_MEM_RECLAIM);
 	if (!xdna->notifier_wq)
 		return -ENOMEM;
 
-- 
2.34.1

