Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 755CF51CB22
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 23:35:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DD8310F941;
	Thu,  5 May 2022 21:35:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2058.outbound.protection.outlook.com [40.107.237.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D709C10F909;
 Thu,  5 May 2022 21:35:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MpzJl8peQneMVsQIsy3Ue9eFN5SxN15jbafPJlW7AxGwnJGG4QSlK5UTmKF+5cswdUrfhFc5hsnVc2O5B9/3LxAhAJbb9e/Ay84/N7Qha5fv95BsizGx0iDVf5dib02+WdPoLwwtDhSvrIvDgl0yACce+x4igGE1FApfxI37gGgnPaU8xhxHLTC70GBK6Hr2KrTuMca/Rk+N7hZzhbsPNgDL54U/RBC8te0BRhCrGwyKPSXhAu7O36CRetIHiWDvLXa0hwfUorwkMqqAgkXryy9jr+Ehg8YtVRUhRdWstfiE0PUcH5jA7bqqVmWIZbJhWaz/QEYjkIECXmLnT7Zhbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6li4CXTFMpIC5kEC/f1k8myx/ij3/qwqcmvQ89j1Gos=;
 b=fJ2co/Sw7kktz3uM7Nb/ltiOZ3JMU2MUPN38mSPCjmqO0RElMIK+82pE/F10P7A9YpZylD5GsfXR06eS4yCb8eLi2oariGdMxZ0fNL9r9EAhryAfSh7jUkkvbJcLkRxKJvP9fQmfQJtxrcmO1iUwVEIU7rjN6VcVAjgKCvLV1WZja59Jpp+HyEM5EJyPB6Xorr0HMsJy/E1+vaqtSctBMC4UDTovc/Ndgc69pBAeR75OkQa5PxSDesi3SU17sB7Zsff5GydfZ+Ar4azS5fgvjpqOgf/E7koRJLCMB63TX2SIsnuF6gc1TFXpwth/rWaV8Ye2hPA7oxRNeSfIs1PlxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6li4CXTFMpIC5kEC/f1k8myx/ij3/qwqcmvQ89j1Gos=;
 b=FJqOpSvy9bZPADl8cfffztc6Nu7AmreuxB0c0fLoiILRdlewKfeTOU8F3LraPFDtpKU6+47KHcRN3aJE+Qs/FTyGOSqjg1CrCp7a0FmYp6jhtbdAeM0A0BxMDdXSAdrDKyG036EpzbaBdWcfC080OwbfoSFYhJIZHbAJBB2+ZJw=
Received: from MW4P220CA0027.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::32)
 by CY4PR12MB1191.namprd12.prod.outlook.com (2603:10b6:903:44::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Thu, 5 May
 2022 21:35:00 +0000
Received: from CO1NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:115:cafe::33) by MW4P220CA0027.outlook.office365.com
 (2603:10b6:303:115::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.14 via Frontend
 Transport; Thu, 5 May 2022 21:35:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT066.mail.protection.outlook.com (10.13.175.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5227.15 via Frontend Transport; Thu, 5 May 2022 21:34:59 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 5 May
 2022 16:34:58 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v1 06/15] drm/amdkfd: add SPM support for SVM
Date: Thu, 5 May 2022 16:34:29 -0500
Message-ID: <20220505213438.25064-7-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220505213438.25064-1-alex.sierra@amd.com>
References: <20220505213438.25064-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7cbe5edd-2c99-4ff1-9091-08da2edf1b7b
X-MS-TrafficTypeDiagnostic: CY4PR12MB1191:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB1191430EABB73C186A88CD61FDC29@CY4PR12MB1191.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BjMsXH6ZhtFWg1djbHB0Q29F1VyT4h8mFyPWxPWotWeRKPcTtCypVWVAb4+bgxNZshxBygglHO9oEjF75HcXgHVTo3HYqkiUKzeeLo/S0IQH918dACqq+TYW82aLvIgHVtl719JivMvldo/cBczhaYg6khH6RB4PBpsmFIU5tNZ0Icnpnp4tKpAiR7Vq1fJxKt6TWFUUWM/3RbEpzjy9ocQ4PI2yXdgoRrw9W2hHGsxS7IyXqgsIKRbU1DUeyDb6d79vE9rXaJsjhTO/1LIV4PTFt3r3ecl21dYmOVwNSydY4OsGrFWKlQBdNpCNe2RiNrRorG8JmTMvv4OmFuM1MeIS+Nxelcfg8W5CegE7IETyKJp0wtKVmlDKmsnEpO19W3Y3s5wwcpN9i1vmN4a55dRhp3APQ91Ev5WK58spZzs1hzwt3KpUyscUZ/LyAf8bDMQrV8eX2FCh9JO9oayfGNx8FMSShtxrypfp2Eu7mjO1/EjYQha0AizgM1++RD3b5+Ja+cSVn0sHV4Hk6QBtIXO4jjgzd6zYiNhNXRA6+tJRE6DdHGlaYRJQkrg6489hYsCVrxeFNKRDMI4TOeqSxcR42votlruo2tW6LJMFFG8ZLuAv/cyPXOjbpJzim3vqs7YuxWYlL0au6jzOLgOAEFMibHoVxhiJMqGJcHqeK5LoEVJuTxESQDfFLxPtVm58xBCK5ryHNjnPoZep8KVt9Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(4326008)(86362001)(8676002)(70586007)(508600001)(36860700001)(82310400005)(54906003)(316002)(6916009)(336012)(70206006)(2906002)(36756003)(83380400001)(2616005)(47076005)(426003)(1076003)(186003)(40460700003)(16526019)(8936002)(7416002)(356005)(6666004)(81166007)(5660300002)(7696005)(26005)(44832011)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 21:34:59.8139 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cbe5edd-2c99-4ff1-9091-08da2edf1b7b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1191
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
Cc: rcampbell@nvidia.com, willy@infradead.org, david@redhat.com,
 Felix.Kuehling@amd.com, apopple@nvidia.com, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When CPU is connected throug XGMI, it has coherent
access to VRAM resource. In this case that resource
is taken from a table in the device gmc aperture base.
This resource is used along with the device type, which could
be DEVICE_PRIVATE or DEVICE_COHERENT to create the device
page map region.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 28 ++++++++++++++----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 7e3a7fcb9fe6..52bd3fa6a582 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -948,7 +948,7 @@ int svm_migrate_init(struct amdgpu_device *adev)
 {
 	struct kfd_dev *kfddev = adev->kfd.dev;
 	struct dev_pagemap *pgmap;
-	struct resource *res;
+	struct resource *res = NULL;
 	unsigned long size;
 	void *r;
 
@@ -963,28 +963,34 @@ int svm_migrate_init(struct amdgpu_device *adev)
 	 * should remove reserved size
 	 */
 	size = ALIGN(adev->gmc.real_vram_size, 2ULL << 20);
-	res = devm_request_free_mem_region(adev->dev, &iomem_resource, size);
-	if (IS_ERR(res))
-		return -ENOMEM;
+	if (adev->gmc.xgmi.connected_to_cpu) {
+		pgmap->range.start = adev->gmc.aper_base;
+		pgmap->range.end = adev->gmc.aper_base + adev->gmc.aper_size - 1;
+		pgmap->type = MEMORY_DEVICE_COHERENT;
+	} else {
+		res = devm_request_free_mem_region(adev->dev, &iomem_resource, size);
+		if (IS_ERR(res))
+			return -ENOMEM;
+		pgmap->range.start = res->start;
+		pgmap->range.end = res->end;
+		pgmap->type = MEMORY_DEVICE_PRIVATE;
+	}
 
-	pgmap->type = MEMORY_DEVICE_PRIVATE;
 	pgmap->nr_range = 1;
-	pgmap->range.start = res->start;
-	pgmap->range.end = res->end;
 	pgmap->ops = &svm_migrate_pgmap_ops;
 	pgmap->owner = SVM_ADEV_PGMAP_OWNER(adev);
-	pgmap->flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
-
+	pgmap->flags = 0;
 	/* Device manager releases device-specific resources, memory region and
 	 * pgmap when driver disconnects from device.
 	 */
 	r = devm_memremap_pages(adev->dev, pgmap);
 	if (IS_ERR(r)) {
 		pr_err("failed to register HMM device memory\n");
-
 		/* Disable SVM support capability */
 		pgmap->type = 0;
-		devm_release_mem_region(adev->dev, res->start, resource_size(res));
+		if (pgmap->type == MEMORY_DEVICE_PRIVATE)
+			devm_release_mem_region(adev->dev, res->start,
+						res->end - res->start + 1);
 		return PTR_ERR(r);
 	}
 
-- 
2.32.0

