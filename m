Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA7739E8A1
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 22:42:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C42B26EA0A;
	Mon,  7 Jun 2021 20:42:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2046.outbound.protection.outlook.com [40.107.94.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32E396EA02;
 Mon,  7 Jun 2021 20:42:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O7PUE39ZS3chl0WenU/WLe1NHk2fslhY9cIuPFNI5lM4Ve1RL5IbtRl16ex2DXW/3Un/qGoVyNwod6sthCwjluAGXmUx9rz3FUrAPjM3f/CkC0TfvUVhRNi2XaYMkRJXZ0ATd/StJLLSYctcAKuDnClJ0SJ2RrKf55Q8LQgViZZo/yJf6drqyTylUsAGq5Ceg1eUlENZanfLOn/a53ht9nuvUrBXQyys0mcmw+6NYhn9EaUNbrgom8Y6jfSGQ7LsBa9RDqUpGeXkteRb0AfGHgppkSbY/7OMdQG/Pi2hOtK5IBXQJ3wYtaFgKH5nKyWBXCmt9IhB3UOjysxTbuQKuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xVTS1977Z/NhsI3R5uOCbHIiScNTi7F80jObhOphaDI=;
 b=AzeqhGh29/0IpMyXym4tKFczibYwXTH8Cd0vkIKPT3OaxvfSw7o1hYas/BpCYVbaFh3xwfF40/ZBTHoku36TpTHdJzwqFTf06QX0q9/XAzQdDGaOK+rfhOseCZbAc0qtc7Wrar4S2ypVu20fXOomUr6UrLY4//ba5BItaMU8+etebEU2PQ+vCyUn6fsD0el/aaPxH171FxKnOw+eFnNAYc4u+95u9eBcp2ZscuEfg8GIlppTdftF/O2T6h54NJy4iXijLy/KaIjzyCD6Yo9ghVhTEX4IMa73UAWFnRoZxn3kq+MJ5qbjX2OMHTcNsrOHhwKFzBQMXMO2icHKwIuhUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xVTS1977Z/NhsI3R5uOCbHIiScNTi7F80jObhOphaDI=;
 b=Psx/gBObQk2SQcEwMeBJhEfrvFiL5FzdX+EoDNp5KmAOfN87khMJs1tmsg+os4z3ewXjsGUyLVkOIgKpNiM8wyTck96KOc6aw2uutwTaeW7U2YFHZx7RYfYVdPRqY7bBSeMOo3zEj/QGYWKuLeRgFr9jpJAWqDGJjLi5c1C/OrA=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SA0PR12MB4495.namprd12.prod.outlook.com (2603:10b6:806:70::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Mon, 7 Jun
 2021 20:42:42 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::5ce6:fed4:e00f:27e4]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::5ce6:fed4:e00f:27e4%5]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 20:42:42 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com
Subject: [RFC PATCH v2 4/8] drm/amdkfd: add SPM support for SVM
Date: Mon,  7 Jun 2021 15:42:22 -0500
Message-Id: <20210607204226.7743-5-alex.sierra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210607204226.7743-1-alex.sierra@amd.com>
References: <20210607204226.7743-1-alex.sierra@amd.com>
Content-Type: text/plain
X-Originating-IP: [165.204.78.1]
X-ClientProxiedBy: SN4PR0601CA0018.namprd06.prod.outlook.com
 (2603:10b6:803:2f::28) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SN4PR0601CA0018.namprd06.prod.outlook.com (2603:10b6:803:2f::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22 via Frontend
 Transport; Mon, 7 Jun 2021 20:42:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04c3f474-959f-4b72-3d35-08d929f4cbfe
X-MS-TrafficTypeDiagnostic: SA0PR12MB4495:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4495B5F32DACD85E905F5710FD389@SA0PR12MB4495.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NKLpuM2POiMNAaV14RV8K+k+3zjMI+oRyrb3qrK2jTWtTquRInBbHzAOwZHvciu1mAfu1JV/FY5BlVtmhLnhYqLEhcO7acKr8BZw8T6luu2HW48E6EVzeFl7yXCQDMfhOYAYYG9WSPgDxPn6aEsGEYMMv+PNfJm3P+eHaIuUXNMhJnyhyZnn5Y+d6sGoVucJ0W/76BDZRxpGVB7ftdlkb6GEqXT2y313DweMc4BtozPu3XIQJDMvH3MflfNbcMQkC4tK1AcoQq77fwuKnxiNCDlPAb4dPtfFxUU+DP6nrFnOUKlzlmR248X/9SssQ6aU7CxIKFI09JT3tUPosG0kBfCmzxuAH+yKvW4B0F/PvzVaHkx/XtEPAppQv6ZBXAyD0c4iwYYiW5beqkpxm9MrYbXPBltP7YC/FasCA8f+pVqASBulWGfYT1GCsI9Y8PBsLZONMKgSBLc1G5sLLM78Lo4AjiTGcXSBmnMtg0ziyWcWqO/v+QHAYCFChSHp6UYqChmWMRoTLEMLz3+PxeziokOywoKrkAfDxTfUkRCjSetRRMV9NfPFSnSsl6ObVS+DhTLsini0osho629fG+WIpcbJWpCQiM6fSDAdXgLQBB5ZDmTdmDZu+b9PKp62FwkgwbIuJfPfyNupNax9zeNThbtOvnhapZXAfpbswEgqy1Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(366004)(39860400002)(396003)(956004)(2616005)(6666004)(38100700002)(316002)(26005)(5660300002)(1076003)(2906002)(6486002)(66556008)(66476007)(186003)(4326008)(16526019)(66946007)(44832011)(52116002)(7696005)(478600001)(83380400001)(36756003)(8676002)(38350700002)(86362001)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?epmZH7U/yfTJzcW1bZx8S0rRX4/RpvB4paSc9+8KTZ2CxBd3EBOwnVTUXA6q?=
 =?us-ascii?Q?MZPsPfO+vMJqPAizFOFkQSFtcq4GN5fhjIaXwacye+hN4gsl+hcdZRHwwEOC?=
 =?us-ascii?Q?iOL/j2TJ61p7+5HYsmehj+lG7UnW2ZzOOn4jH8g4Fk4iKS+NXD52uopUf1sJ?=
 =?us-ascii?Q?dmbivYuDso3qaa7HE86uRsllzapwXNjeeFM7yigkGvPncNUZQDozTHKnOKLm?=
 =?us-ascii?Q?yU5Pq30zxlNWGPEuOPLf+H8qbvNfcdg1yyjJOtqgvDDNrxFJpL3PYqsT6QDy?=
 =?us-ascii?Q?MBLeR6Aez675qZgm7dTNCVymNbacSp9X7J5WYssyD8nqyFqSIbwo/Kbzn8Uc?=
 =?us-ascii?Q?6x4L7Mh2fkvjwVvgxo0satnm8yuF622chq+udVRc76+bib4tSZGP84PMxy0N?=
 =?us-ascii?Q?T81U5GnED2w9Cie9s1chz6DZM3JAMzILLkW4yxryuB5NQkgV59kFSSxL28ii?=
 =?us-ascii?Q?1a8JQ6tOlwAc1KJLEGPWukzs3x9ZqHZ68/RjiGSgqPi94SybeXDDYVazEtQW?=
 =?us-ascii?Q?TnzG4HknopLPPQaf26aIJ9WGAxY7pYfpvQBJ+36VU1hMtCnH/ETRnS1lx+g9?=
 =?us-ascii?Q?NF8HmkT1SxqVuy/SeSWBA9XO7ByQI/PmGt2ZBnrpvNUU6JckkWUr68VyM9t3?=
 =?us-ascii?Q?9+66qdqsvzhrtIaJgTuOnGNa33aPnsrw5ERxUBr8wLJ9twGMeHxTNDgq0Xrz?=
 =?us-ascii?Q?bJcyruouNybpX/9L1vWnr4hkAFFnGv6Q9QPP2qpiMee0rTAn9Wr0bMnV6Psg?=
 =?us-ascii?Q?VzTiXXt8iStCynIBVTYIL6rAgJt+mOZMzJcR0HlvzJvcqnK+uo1Cn3iwAvv9?=
 =?us-ascii?Q?Wp2V0nKmrpr4V5EgsgyAskH0rzoXj5NKG5XM1vIrZKdwIQWHCtlYQDs97b7/?=
 =?us-ascii?Q?ZTIOV4zHHWK+hPCfdk1pbxJBO/yl4CgvxQt0A9UVVpFp0slrVpmpkuOPI3N1?=
 =?us-ascii?Q?Zdmv/STnca6REtKoigbOidJh1/YODY3Sc4ffjgTHxJssFh2K4xpYbhppJWeK?=
 =?us-ascii?Q?n6TR3mR1uZ7y0victSdAU7FjXO8Do8QvHWLa5Y1kBN158qhGPrS1mMMXLS9b?=
 =?us-ascii?Q?+efxFzsnhl1D9qpyQXDJrDxLHZ7aVkhryAQ3HPt0EGuuGyHq25sYTB6BDKoa?=
 =?us-ascii?Q?/Okd7fcFQi8Aaw4kSCQI/cyxtWJNBmq6kanWPEZ3uKGTEVwiJB2ZeNkQNKnJ?=
 =?us-ascii?Q?xH9SbfUlc2wveSdUJ5eGdZxh7O1V9h4GMe865/kvi3PcXoIeimQIFilF+0JT?=
 =?us-ascii?Q?EYBySVDO7DGNwT7mzh/H97+Mx/yd3nHiDfT/w/0N9Vx57sFkJZ2xiDL6gJQd?=
 =?us-ascii?Q?eUZ0TTe6A3pmksiDQ/g4PevY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04c3f474-959f-4b72-3d35-08d929f4cbfe
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 20:42:42.1797 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rZR4kzuV8qpdKT3pSKRDm/H15EbHJnA6A94JyNYn6DhklRCIF85InuurilsGVB/X3/XdKK3FbSU3Ukdd961hWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4495
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
Cc: jglisse@redhat.com, jgg@nvidia.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, hch@lst.de
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
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index c8ca3252cbc2..f5939449a99f 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -895,6 +895,7 @@ int svm_migrate_init(struct amdgpu_device *adev)
 	struct resource *res;
 	unsigned long size;
 	void *r;
+	bool xgmi_connected_to_cpu = adev->gmc.xgmi.connected_to_cpu;
 
 	/* Page migration works on Vega10 or newer */
 	if (kfddev->device_info->asic_family < CHIP_VEGA10)
@@ -907,17 +908,22 @@ int svm_migrate_init(struct amdgpu_device *adev)
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
-- 
2.17.1

