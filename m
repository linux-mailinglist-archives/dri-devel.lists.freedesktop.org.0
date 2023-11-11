Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B917E8B03
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 14:11:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF92110E28C;
	Sat, 11 Nov 2023 13:11:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2047.outbound.protection.outlook.com [40.107.93.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E683E10E28A;
 Sat, 11 Nov 2023 13:11:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQQDIQYAM0w51UGdjAZ+QQvHZXd9mUv/xBlowgYo6e3VgFp839z/bJe6brDYgfrPkafo7KyAA+V0KQPF37AdV9FjxL0VgUncPF37Hk/xD7Iz1mQXiIJnmSGaMf+gjJpTXIus5g0GeiVynnqKSr42M3sZMZGJJSjiqD+me+W5psdz6kWpywqyVQDKQ9qhInptoXnfI6nvG5FOroTAQs+NBi8Q/U2SUblC1b4fhNIuhZIPFY0M1e1CeMDIIaldzd/w75Lh8Itf52OVCkgbeBc0/mKgXPYdKc/dL7J/8S7OKLsIaG4es7pMbnJ4fe4rWLGekrm3kkjGaP9seDe13QjH0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8XJOMV4AFDTl5UfZ4UfZvuMtZWZISfbRW8RgcM+iEMM=;
 b=fwlELLQrNPQrIfCqRYR2gkjOuSxBIdnw9dgb0IR35f1OGvtmBKcqfHtUl/AN6mtp65u3Zwd+PiF+ft20NnDwFnylWu31cdO8ihanz7OwFZ+SvQWcspPF3HaFJDk6na4EMp6GviAU5XkW094xbqsNkvdb63gK/tvYfNANAGzRrjM5p47uxxO/ZjRw1EV6UKvm6BWLT2a4zYm/duJcnp6mXFpI+qX4YZZhdkeV7iZqCT/bEwAtdGEjMVntTPHPnk/a1XSt6vcAVTAt5/j7UfL25yGK4UiSLlFFTf9TncWhrJakSDJkXg9XrVCE+Wvx76ls7qhsUg7eqM0riMm7CjkeVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8XJOMV4AFDTl5UfZ4UfZvuMtZWZISfbRW8RgcM+iEMM=;
 b=KqcYByzSYOxZXqjC/Y/o8cJFe5uf6uIrYZmROKRQFlsxnOLk2zGoIJMELmrNSXBMA4PpZb4cXbxWnSvBpn6GSMqHIzqHMMA61vKqTAj5jIpUSbtvdUEPV8KHio0Jszcmf3eOjfpkPcCNM3+xHlokw/r3hfnJNV+7fvVcSUrPF90=
Received: from BL1P222CA0009.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::14)
 by MN6PR12MB8472.namprd12.prod.outlook.com (2603:10b6:208:46c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.19; Sat, 11 Nov
 2023 13:11:20 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:208:2c7:cafe::a3) by BL1P222CA0009.outlook.office365.com
 (2603:10b6:208:2c7::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.21 via Frontend
 Transport; Sat, 11 Nov 2023 13:11:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7002.13 via Frontend Transport; Sat, 11 Nov 2023 13:11:20 +0000
Received: from rajneesh-desk.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Sat, 11 Nov
 2023 07:11:19 -0600
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/ttm: set max_active to recommened default
Date: Sat, 11 Nov 2023 08:11:06 -0500
Message-ID: <20231111131106.1169124-1-rajneesh.bhardwaj@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|MN6PR12MB8472:EE_
X-MS-Office365-Filtering-Correlation-Id: f2e466e3-6be5-4c45-96f5-08dbe2b7b244
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7MRyHtbqQuP5oLEkVGogQJMP7A3+fH/9LZDdhsnilhuRywVg+gwe7Duu46APeUzIjsCV4uyiweb8a8dP21vJNnaaHFjgcAd/L7Qi3uFutipHFM9k8H79BKHU+eB6MtT/MwhnaOFey7fK/uUXlm2ednOPB+85btWry0F8ATFeUWBia09kE8hrTevD7FZi8xUvL1c8NdODwpAe8/8WtOwtQm8cg3G6nwyht7UpLTR6zwXt1+B55IIv8Y+Mza85Zbuy5QJ7ZLXJLirzykVgvy7tXZ7bkkn/YgQZv5wnuyPLp3s9Zh6AHiDNHZtyxuHQga3qcSPY1oaY7PtEhj+XFux78gQRprLLFMhYRvhscD1u4Poyw/K2rX+CJumisEOVicn0dDoa+hC2IJcHwK4RxWUmkqjUCaAWgRxiii+Nq87meMQ+Il4GUG+zo4Kcxc2eRZgc2CnDvXW3KXF37yvnWkLCduA5e11fXMQVfrPqtO4wufB7CLAV76/JvGyvrKa71yhP7XRu9I4bwi27go4LcLLWjDavtu4QhNIZNWi2cufBIH1YKdrhomHOISMXIOmWeyEWX0QyA1RdBfRPHFnmwbgduQELtHJeyPkM0hJmwBJjPH/7hGSmnQkQQQhspi242UxflefRP7Xr/saT3jSGSpVbdPczTonlqo/LLexoS8ODdIWRXZDjf1EH0Ocewc1FsxRXYj8MzKMCGw9NjmzAy8cuuWVdFrQzfFhhjWEy5ClO4rvBmXbKMPjE7KYmDSftsyZ5j4wdpkG1WFIqjnrp4eZs5A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(346002)(396003)(376002)(39860400002)(230922051799003)(64100799003)(82310400011)(451199024)(186009)(1800799009)(36840700001)(40470700004)(46966006)(70586007)(70206006)(83380400001)(316002)(6916009)(26005)(16526019)(54906003)(1076003)(450100002)(8676002)(8936002)(6666004)(4326008)(2616005)(5660300002)(44832011)(336012)(47076005)(2906002)(426003)(7696005)(4744005)(40480700001)(82740400003)(356005)(81166007)(41300700001)(36860700001)(478600001)(86362001)(36756003)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2023 13:11:20.0320 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2e466e3-6be5-4c45-96f5-08dbe2b7b244
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8472
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
Cc: alexander.deucher@amd.com, felix.kuehling@amd.com, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To maximize per cpu execution context for the work items, use the
recommended settings i.e. WQ_DFL_ACTIVE(256). There is no apparent
reason to throttle to 16 while process tear down.

Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
---
 drivers/gpu/drm/ttm/ttm_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index bc97e3dd40f0..5443c0f19213 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -205,7 +205,7 @@ int ttm_device_init(struct ttm_device *bdev, struct ttm_device_funcs *funcs,
 		return ret;
 
 	bdev->wq = alloc_workqueue("ttm",
-				   WQ_MEM_RECLAIM | WQ_HIGHPRI | WQ_UNBOUND, 16);
+				   WQ_MEM_RECLAIM | WQ_HIGHPRI | WQ_UNBOUND, 0);
 	if (!bdev->wq) {
 		ttm_global_release();
 		return -ENOMEM;
-- 
2.34.1

