Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3AF4098B0
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 18:16:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90B5B6E1F6;
	Mon, 13 Sep 2021 16:16:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2080.outbound.protection.outlook.com [40.107.100.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8233F6E1D8;
 Mon, 13 Sep 2021 16:16:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rccdmfw7i2HI6J5FzSzxqSsKhoiu0glCnBuKce53CDTSsi4tAfnz7t41jgcZTAvdSXIiEmuMvH+HbKdq29+gVUpJEVzwWy+241EbCC/YIAxZ45giUsJZIk/S/zEWedtzH5BdsQfDEbYSmPzf3kOwdTRAXSksJtVRXfNwttRZ3+P7vLpBcnxRN3tXY3t+SX3ZU4WGVoSLamwycXHMQSWa0d0DNNBoDUBi2QMznyMg7G3k0PiO+r0+e+vMke6vYJsWx/avXiODPwdRgmqp7xkNiac5YFI8IfhWRFBU4cS43PY/OiMBB9JpIFZfNmOzOnFE+VgetC9PsH/jp2HEmwg58Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=dgBVJdw5GCMpxWJ5Jn6UKTT8DtbGRCSPuoWxVWP9HLg=;
 b=csV+/QVAGXF9zHLGL1hOCdoRVF2aF+1pOwbOQaClUTYsy+xmAkcLsimf+Hw5UhuQrrZ7cU3jVRFYfhMiHldVC8RkEFvAATHfEGhTHtN2Z1bVEAakqEdH4Jj1K2MdJ9CyAqB53WOEKRMVY42+5wq3QwHD5QJ7qNcFeo4nG6VsIKbM43/bzJrWzTARWr1at9sy4Sv+ggu8HQFW15oaqYcg8g5lDesg7KbiK/RAmYhP57ZXOvN6rCTalpAD+4fPpp5USfjC2PKnnWxamEGsYhkfpLgn7ObUkEqyi9dIVfdARFBvz/8OFVeSIzqt7gHtMFggQ/7nZ+JAEdBY6u3pUNLAKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dgBVJdw5GCMpxWJ5Jn6UKTT8DtbGRCSPuoWxVWP9HLg=;
 b=HezgMxQlEQzq38TMsEoI/8zhCUvWcF0LfuOMjRrtqDxCDgx90hba5qrBF03VEK45j5PBb+cUDmuz8pLoRlP45Pcl48I5wUW1xiVMOqOYZXrKucLvdN/w5u9xUpcLVAxsPxzyI4UhBXHldpIVtW454oJD3Wggncxc9ueny9G7Wk4=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SA0PR12MB4349.namprd12.prod.outlook.com (2603:10b6:806:98::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.25; Mon, 13 Sep
 2021 16:16:21 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::f1aa:9adc:b4f:4d14]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::f1aa:9adc:b4f:4d14%7]) with mapi id 15.20.4500.019; Mon, 13 Sep 2021
 16:16:21 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v2 06/12] drm/amdkfd: add SPM support for SVM
Date: Mon, 13 Sep 2021 11:15:58 -0500
Message-Id: <20210913161604.31981-7-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210913161604.31981-1-alex.sierra@amd.com>
References: <20210913161604.31981-1-alex.sierra@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9P223CA0015.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::20) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SA9P223CA0015.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 16:16:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b15a3250-dd1f-4b49-06fb-08d976d1d31a
X-MS-TrafficTypeDiagnostic: SA0PR12MB4349:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4349C21EBD92B0985B965398FDD99@SA0PR12MB4349.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xra5nwwcBvnYaNhTCR6lkmPoXCz1/EcIsij5Awm5CBTN4b51Oa0bsVVK1hrGLl1IS62KH7YO7CJw79C09L1IVDbJ1Ddxy7mAJNE13QQb0LRjNLB2mMABNnbePo488QtttH2RvY9cmRijol9oRD35s0DeQrBkA8yWkFSU5aoXUFAN6hZpIVky2tgWlqG4p9PMtr57VckfAuLxV4OW/iEkwsGQCvZUeM2ymGVWPx3RvatfTquZVklz7dbMRavZ7xL7UzwhKFv94EekHnyGAf2BZxyuE/EyOsbncdYdmnGOuNWcO66i7qQp8wYX13qW+Rot3sQM+PlEOPCsyhpoR/HbI8sbAQ75HU1hPObfa87DO1/cUxcVzLASHRfwe5aN7X6KvitRFWrEioAd3I7N6KmnaDAHofBpRGZMb7gyi7sJXUEUNe0MPsUAd4N64LU4ok0SuX1PWjXFKsryu136QtjXmn1tRrUBkZtAkP94QyWatO4MTeJOtV8W52doGZoYpyrk0zU2bmBlHyNt9fZwgfNVoYJquBpdTQ9Qu5stXfiGRPi6qJQSpfugK2qvV7n0vGvXky/h9rx+GagSgRrg3n17VC0Ez8lQeWuBF1jGqiR0GYi9RVZGVlWeRiR0RFIAMSudjFPsQl2OnIDHqGPHr7KnnBsEHzPGD72hbuLJfzkqFxFQ7htI0r1RwhuOjE8xtpUUWRM7E9bOe7F7ZLs/F0xTqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(396003)(136003)(346002)(376002)(66556008)(52116002)(86362001)(66946007)(1076003)(186003)(7696005)(478600001)(44832011)(6666004)(38350700002)(26005)(38100700002)(66476007)(316002)(2906002)(83380400001)(956004)(2616005)(4326008)(8936002)(36756003)(8676002)(5660300002)(6486002)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PO2pryC76K3JPilDnjEuWaINdh0pgih37cgosoqupJGcjjYEuPSc581H3Rt5?=
 =?us-ascii?Q?PEw+qObgcDSuisLSZFOO5JvExgcwXP0huN0ZhhP5iqmG/m5te0eALHvnI5wc?=
 =?us-ascii?Q?yu4YvlhT45eKM5cptujnnHhXiySbMQFWNkEzUWziAjzBtFqsDIo6g1Tys+eP?=
 =?us-ascii?Q?49EG5XUYMlOk+sHziG+08DY+3MGn7f5gpU6yZ9oQPSqg7IyL7Kw7ny5Wda2g?=
 =?us-ascii?Q?4FzG2hSgdV8aX4z52GiL3E006KYpUd2bQYrhXmNRlC8T0FU7aOgYTjhQEeZP?=
 =?us-ascii?Q?4Mp7FI388ggd4ygMPtMgupatsMVD4uVY9zil8T9vdu4/4BJTixouwygIHnJQ?=
 =?us-ascii?Q?geglM6awT2DbtkPshfDHqLaF3mY1iG+S6mX6vL1mihh+V27yXSuZAbp3nGxo?=
 =?us-ascii?Q?Wo8g7/2e5uKadpdwS6CxPxeP6tGKf91smv9bJxBcW0rcxAK8ea0oxN0pvvN2?=
 =?us-ascii?Q?ObTl6DL7V5hs6Fh6yW3NoqiTFSS74L8K6VgNsRJ7SRWfJQMA7dcXOWzURYtm?=
 =?us-ascii?Q?2KU8Md+FyAwSJM1cr3E1ypePYfnE+lJALiWPgDEG2V8Dre2gA5avEy4WwkD8?=
 =?us-ascii?Q?wqlqSymoa+Jk6S8/rFi4zsGo9aDXlTdpyG8R0u4HAn+trKmqADl6Jo0HN4zB?=
 =?us-ascii?Q?6lHNMTqL/IO8tZwi6A9IgUkwf3bIqwTgQUoFX3SchaJL5zymBgNb8YcrbI3e?=
 =?us-ascii?Q?hpVh5Wlc1NKPXbMsES4RnHXvrfsfz9udEuayc3bEPzcY3zaOvBadDw91sInc?=
 =?us-ascii?Q?RnIAK1LMbgVqOqfn9gPTss6jTc25W+ZZJKJbbnU9s90ZrE1hzJdn3mtmCVV1?=
 =?us-ascii?Q?qiICimBEN1s+VgEKNU4A4l+d3aXcBPV/C+Uob/D3ueaL0AmDaIe7StYtW0k6?=
 =?us-ascii?Q?TJR7D8K7YmXuRfYSlPZQz5XDJMtSXzzGliIacW3c32fVSvU10fEE45uSfx84?=
 =?us-ascii?Q?mh5BiK5gqPtNLfIdS5VpQZAbNG/stveSRBYipb1gQ7r5EAPs/14DuixtlU1P?=
 =?us-ascii?Q?Kbiwas2fiHG9XdQxpH0hrhtQt3/mTLoJpyqWHqg7bbb46itm32BU3lqnhw+y?=
 =?us-ascii?Q?WP/gTj6n3tM/Y2yJopABHZgzVrV0XIy6pFkvs56DoSBSMldAL/jaJKTvBwa+?=
 =?us-ascii?Q?gIS//0IWhnP11HP0J7JHzR3Oru8lEW0scflhG//uOOmgkCZsz3c5B6upyMUM?=
 =?us-ascii?Q?Sos3iHUJbMC11SqUMg7vTXB4eZ4CKrgXDW5cZ4UR6Sz6coZC9v7Sr+/mtxic?=
 =?us-ascii?Q?O+K/NtmM4qMutuPclrQC9OFI9u0tpvLSLN/Xf9evI8DHbLkItMFCHX3xrdkI?=
 =?us-ascii?Q?XJBeVzgeMnNGmlU8oGdmyTCW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b15a3250-dd1f-4b49-06fb-08d976d1d31a
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 16:16:21.2940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mQdOScBOU/mAg4BEre3gT7P2TfD90DabV+g3JBWRAhFtQTSpIJV4YNUkvBNrH5SeymqXqXHMrfiTl8vIweozcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4349
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
be DEVICE_PRIVATE or DEVICE_PUBLIC to create the device
page map region.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
v7:
Remove lookup_resource call, so export symbol for this function
is not longer required. Patch dropped "kernel: resource:
lookup_resource as exported symbol"
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 32 +++++++++++++++---------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index ffad39ffa8c6..d0e04f79a06e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -866,7 +866,7 @@ int svm_migrate_init(struct amdgpu_device *adev)
 {
 	struct kfd_dev *kfddev = adev->kfd.dev;
 	struct dev_pagemap *pgmap;
-	struct resource *res;
+	struct resource *res = NULL;
 	unsigned long size;
 	void *r;
 
@@ -881,22 +881,29 @@ int svm_migrate_init(struct amdgpu_device *adev)
 	 * should remove reserved size
 	 */
 	size = ALIGN(adev->gmc.real_vram_size, 2ULL << 20);
-	res = devm_request_free_mem_region(adev->dev, &iomem_resource, size);
-	if (IS_ERR(res))
-		return -ENOMEM;
+	if (adev->gmc.xgmi.connected_to_cpu) {
+		pgmap->range.start = adev->gmc.aper_base;
+		pgmap->range.end = adev->gmc.aper_base + adev->gmc.aper_size - 1;
+		pgmap->type = MEMORY_DEVICE_PUBLIC;
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
+	pgmap->flags = 0;
 	r = devm_memremap_pages(adev->dev, pgmap);
 	if (IS_ERR(r)) {
 		pr_err("failed to register HMM device memory\n");
-		devm_release_mem_region(adev->dev, res->start,
-					res->end - res->start + 1);
+		if (pgmap->type == MEMORY_DEVICE_PRIVATE)
+			devm_release_mem_region(adev->dev, res->start,
+						res->end - res->start + 1);
 		return PTR_ERR(r);
 	}
 
@@ -915,6 +922,7 @@ void svm_migrate_fini(struct amdgpu_device *adev)
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

