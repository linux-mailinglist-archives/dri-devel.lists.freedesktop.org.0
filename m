Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 899393EB01E
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 08:32:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E54BE6E4DE;
	Fri, 13 Aug 2021 06:32:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2044.outbound.protection.outlook.com [40.107.95.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 393B86E4D4;
 Fri, 13 Aug 2021 06:32:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hk8Pn6bZYZjnpcGYqjGy12GVxYufK73oSaDUTrsh1Go+Tlz5LQsSDFdUzaADRDczuIoHgYatLamlpnbJAADzinw7GbRiux0surg1Co6XJl87Ah5YxpV1B295KKUEGJCs8vMcQIzRdrXHs1toDgsqlHWm26/RvAo8nF7aX+SF/aq/io3924LI/5PnvWxR2w1xr5+WJmWRSLhr3Lj7dMytR1V9i9oc1l0nkTOfco7wPycZgp9WtvhIQbDdzk/rAJUa7Lc08DA8JJ5t+Uidtp22zbGUZwLHHhm1I/9sfQv2ZOLoiWqkidGO9AdVV+tZFqaczc7OClELlRdfNjC1JZJIPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qLzQP0Q2sVgjkO1mJavmGwqXRZqTbEiduZyle3KpBGc=;
 b=LqlfLP4rdnGQrvkrVs7Z7VWQHlPaW3ZQd7N1bOmc+hvAhmTx/61Fwb/17jEGjdww0jlXSZTQQjBW9IzMCiHMj/hWW/HbMMBk9ycvP07nRNMFEers/Ytqgv4m30gny+fU9FwzA5UD+4RRbUaAN9d5dYMr4h8Oo3Hc1PnVHQZMeFMf4sBhcQ5fu/YKF8fn7B7PBOSJhkZh6eXTitYPkaAhfBAtI9jof6uXmuimLIknQMGavE7iUKo/hX5SZZvgu14R4+jTDBcgASIrmiPxhFXWTBmtyU/M8/nejDOo/K0R3rnhC6esP2exkQZ8LXD/xjBaYRr3tjApfoxsHSzw3p4ttQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qLzQP0Q2sVgjkO1mJavmGwqXRZqTbEiduZyle3KpBGc=;
 b=cvQhIkuhSmF82AVHaD6tF5XN9DGuh8bC9iKz1iKzJioeK7QTlMVtE0sYieMXpuyI/1FPnsgIu1/4mTlkYq+L4DFz3yHjdT7S5HsSWlxSn5mhTWto99Kra90z0XJXggs0fQVocFh97hBwxCQKejtkSdfVswmMMvwnzu/HEqmiv/U=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN6PR12MB2718.namprd12.prod.outlook.com (2603:10b6:805:6f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16; Fri, 13 Aug
 2021 06:32:05 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb%5]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 06:32:05 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v6 04/13] drm/amdkfd: add SPM support for SVM
Date: Fri, 13 Aug 2021 01:31:41 -0500
Message-Id: <20210813063150.2938-5-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210813063150.2938-1-alex.sierra@amd.com>
References: <20210813063150.2938-1-alex.sierra@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR18CA0026.namprd18.prod.outlook.com
 (2603:10b6:806:f3::18) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SN7PR18CA0026.namprd18.prod.outlook.com (2603:10b6:806:f3::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.17 via Frontend Transport; Fri, 13 Aug 2021 06:32:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88c3f5be-9326-4079-7fd0-08d95e24118c
X-MS-TrafficTypeDiagnostic: SN6PR12MB2718:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2718C41FB5D9CFDEB9993835FDFA9@SN6PR12MB2718.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K/psTYsG0EMeqKnKOnHiv9md4U47pS2wZYswuqI8A5mwzEwQ7bRt33eU65iwJ8C4VWAWx42anVxHtyX9FClZOf/wIGyr6xHL2oN0pbfnnFDAM/i/AzAwuN/8jQTO34ipxUFMFaPaA2WyidQhsEwI2J03NdvPvuEw6Mfdh2fX/3kfQlAPkxurCWKqjpdtIo2dffvIc/LbAF+s+ub0Znu74c94A314GMcCZyDU4/h5+z8dpOPZZdW59Mh4wPl1RdA2n9jzYIQwM8NOIAYHv3uJzuZ0EXy5u6+YLqD8DlMxXOgKNp9ph3P58n6jr2qJO+X11X90Op6SRETmkCpCRJk2USjHAPb4tpL3eSPf7uGZMvadR6oGgw0UjKuoBmDpwqN90rKznif6xNGeBTsdmgPTLK4wKieUtg2LsxW4dR6H7X6nyNsfnAfX/bXA3s2hYGPjk5GnAnuUzx3MGbQErM4fWegYkRyx6D895/mdnIiUSq4tuCbKuRJCr8ifP4wuLkfggJIJ5dP0wUS1De4QAXiprdwqjg8AO7VY2WHabRErJNrsaFmtOE0YJS3V6PXJJDenjulHr7Cla5GxbdfrZAlu1YB1051RI/ARcj2x5SOTo3odXVIoWRpW7Fs+XTxiW/V1nzQXvtmSpo1vVIYCGQkXKX5jsjbpWoh34NUY/Tj7vDCyNvmYiT2fRr2tBhzUeK3TH4l5N+omck6goYL1SPEdNw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(376002)(136003)(39860400002)(956004)(44832011)(2616005)(6486002)(4326008)(86362001)(1076003)(5660300002)(478600001)(8676002)(38100700002)(8936002)(316002)(38350700002)(7416002)(2906002)(66946007)(6666004)(36756003)(66476007)(186003)(26005)(7696005)(52116002)(66556008)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t+YuQEph7RFqcTuhLol4nNn21A6lV4RCGyNe9vkD1H3xe54E2dZuhBk2j1au?=
 =?us-ascii?Q?2yVRf6WbCL+S5KB9aX6z5yEtomogOC/Ubpru+1DUoqGduGVGts+l2x5nT4iM?=
 =?us-ascii?Q?s+Uy2vH/54swKBI/YS2QzLwQjjJmMBnnVCPdVNCl8Wr5y6IIujZwnn8c9iCq?=
 =?us-ascii?Q?eyzk5AzeriBDqnckuEgIpGbF3am3E9xT2r8Q/HzYt7PubaCpaWGAxZ6wg4U+?=
 =?us-ascii?Q?I0+ENhVrkylW/hWkk+1NymEEbMvKgfGrzhAl0+TaYEVqljoLoU0R68Yb+5jz?=
 =?us-ascii?Q?UCfV7i0MoZw6jhxWXhlTKWGqStS/RTF5e8kuJ2X9B8WG3yvZNL64os6EmQe3?=
 =?us-ascii?Q?RMHggQc2Fy0Yxb8s9Zg8IvX9z04uzKUv5t50jQAljv3eK1e+FRmsh+paV8Rc?=
 =?us-ascii?Q?7FneJTM7gNIJtxKd20VxxBvzMjzrVE6n0JkaG4uarWB6ubWFyyu/wgOmO9sp?=
 =?us-ascii?Q?7/P88P6orCmAv9YUh2SICBdCyv7UpdBvsMeR2HgGo/y57l40+nK0roremKhQ?=
 =?us-ascii?Q?9YIDmsUikrzm9bpK6NwoqMHsbIwrXU0w3lISrjl6NQ3T3sSCkEg88xOJs+BB?=
 =?us-ascii?Q?SjpSAL/mKn70/5T0qiNXQkeAFRZmIx7sQQhZ5rShpkMpK+Cp9Ed0NUJ3OnU5?=
 =?us-ascii?Q?bgAJY79QciKnLm/YfJsysrlodS7+hHzhQMOdCUdlbFMZ390VG+OCij0i9A6H?=
 =?us-ascii?Q?STsUtrP6uxfRDCTOTRNjPlfKjUgL9CMuX/3wkri3kwY4+j03QcGCpylFmIlP?=
 =?us-ascii?Q?ci2LLxF7kDbdAtZpXLnGabXP/bElmqy+JPgIbwWU387ILG+q/C3So6vrxsMr?=
 =?us-ascii?Q?AqDCE06E/L8s5QyOonFjEPz5k4n5MavENafeDfo1gabk10eoNIhN4rIIkXpE?=
 =?us-ascii?Q?HDtAWMAVLA49zSH5eilPIwI3qZieAj2IMRtmgpsresddbScY2ai5pjRaXNyu?=
 =?us-ascii?Q?T+kLCWFci38uqv/hvmCIPmxEZItoJXU72pmSilpTlCSMnLHpCL4CpwI9dwDQ?=
 =?us-ascii?Q?JOvPu0dGEyFf2Jir3fxk/yTJ82wgqhi0QD5k3gM2N7lng5szIwOciuNE+msM?=
 =?us-ascii?Q?qlUPXjfofPj0ourlzQd3vn+rsFfDwdUFZCS2sVEQEXUYLh+4bu6V+t+rDg5E?=
 =?us-ascii?Q?pI6UsR2I9k9ZkGIyv87Iv5b2wj2DXfAMl+aaqoylMnqRqRrYGcZip0AcdYbM?=
 =?us-ascii?Q?fgOU+KcV9z29j/f/BxSvue/lJFH5vCKNpPogxfMqfIfmLOgBhDFxq6Vh5rrt?=
 =?us-ascii?Q?QNcJHJQkZZpIxRU5jkWp5ZwFa4nmO3DLv0Pv2lNrJIkQlgbu61ykfGPkFjJV?=
 =?us-ascii?Q?Y9jMKEg5thq1C01DIYZMeNXa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88c3f5be-9326-4079-7fd0-08d95e24118c
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 06:32:05.7248 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NQKCazYIExa1Wh9Ctjg8XABWxVWJDRH69RPKe/s6bGtL/zbMRWwikHIARrxpZYEQjgk9+jogSpkdXTbf1rNR7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2718
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

When CPU is connected throug XGMI, it has coherent
access to VRAM resource. In this case that resource
is taken from a table in the device gmc aperture base.
This resource is used along with the device type, which could
be DEVICE_PRIVATE or DEVICE_GENERIC to create the device
page map region.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index dab290a4d19d..24a8b6d4f947 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -868,6 +868,7 @@ int svm_migrate_init(struct amdgpu_device *adev)
 	struct resource *res;
 	unsigned long size;
 	void *r;
+	bool xgmi_connected_to_cpu = adev->gmc.xgmi.connected_to_cpu;
 
 	/* Page migration works on Vega10 or newer */
 	if (kfddev->device_info->asic_family < CHIP_VEGA10)
@@ -880,17 +881,22 @@ int svm_migrate_init(struct amdgpu_device *adev)
 	 * should remove reserved size
 	 */
 	size = ALIGN(adev->gmc.real_vram_size, 2ULL << 20);
-	res = devm_request_free_mem_region(adev->dev, &iomem_resource, size);
+	if (xgmi_connected_to_cpu)
+		res = lookup_resource(&iomem_resource, adev->gmc.aper_base);
+	else
+		res = devm_request_free_mem_region(adev->dev, &iomem_resource, size);
+
 	if (IS_ERR(res))
 		return -ENOMEM;
 
-	pgmap->type = MEMORY_DEVICE_PRIVATE;
 	pgmap->nr_range = 1;
 	pgmap->range.start = res->start;
 	pgmap->range.end = res->end;
+	pgmap->type = xgmi_connected_to_cpu ?
+				MEMORY_DEVICE_GENERIC : MEMORY_DEVICE_PRIVATE;
 	pgmap->ops = &svm_migrate_pgmap_ops;
 	pgmap->owner = SVM_ADEV_PGMAP_OWNER(adev);
-	pgmap->flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
+	pgmap->flags = 0;
 	r = devm_memremap_pages(adev->dev, pgmap);
 	if (IS_ERR(r)) {
 		pr_err("failed to register HMM device memory\n");
@@ -914,6 +920,7 @@ void svm_migrate_fini(struct amdgpu_device *adev)
 	struct dev_pagemap *pgmap = &adev->kfd.dev->pgmap;
 
 	devm_memunmap_pages(adev->dev, pgmap);
-	devm_release_mem_region(adev->dev, pgmap->range.start,
-				pgmap->range.end - pgmap->range.start + 1);
+	if (pgmap->type == MEMORY_DEVICE_PRIVATE)
+		devm_release_mem_region(adev->dev, pgmap->range.start,
+					pgmap->range.end - pgmap->range.start + 1);
 }
-- 
2.32.0

