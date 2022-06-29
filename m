Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8F955F470
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 05:55:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 019FE12A7B5;
	Wed, 29 Jun 2022 03:55:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2078.outbound.protection.outlook.com [40.107.92.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD7D311BCA7;
 Wed, 29 Jun 2022 03:55:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VSc/uy/mlwyQpoiRnZXKCZ5yjlCZiVTu69M+GEiFtTK1M5yuK/8PAxq1SKnpENaOtE4Utd6AUf33QvzmU1acRGG5rpAaMHXHD8nnpZUj7HTBH8o9cjs/XeV9CSBY7Yqt/qBU+sItDAWwZN+3bCsn/tFknTJunSBbN2H3cXKM9V+siSpGU2xgB4rgS2chwBqfpuq+QwjuTcSyzWw91d9BXNtLz+emJKn9rh6EwhkVJou/PxSoUYb/cWtagNIj6ST1e0nC7AMy60k+2aGvvRpqvu9Q0ryby5hKsg/XrvM5cwFI3nQjm4+adQfA4y33cKPOv+mE9bhgZl34CgNVrIJtzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Gq5krbSDZgVmQmlPCe18YVS7UIhP8NZXgBaLYb/5yI=;
 b=NKa8CCUgyToyoaOQe36rNyXX0pN4sNqmvBGk+MSaBatPcUVxvtSx2qBJBmn6AHbDGD8RJINroM4CDobvNhKlMacW24JXC9VQWVmtV79qGrkeCLlotJhU1y0zGPLKnZgchhBYQ831pqpNEFjXbom4FIC4cVT021nB80IkP1ZC2jNGaQb7bvW+bDJRuWLg1+uqfvvPoqxffHE/SKKE6vmZ24ZGsPaUMM4cLukWIfDt5hnqAkPg2PX+Ak/nlCSqKJfsYoY65ioJLcsqyxOvjJGUxb0tm8XEEs0EXP+Y34A4RQtmn6/O8Fr+9bGdtpITRuPkVX8utsOPxKNNLOFS7qjbgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Gq5krbSDZgVmQmlPCe18YVS7UIhP8NZXgBaLYb/5yI=;
 b=HPmMh0uZerII+pcg07XWY/difoooamEOZETXFrSsp9JrsAbn4uVzrIuRwjDmkU4tsxkGGbbbH3NVTlA50GUaJbnmtW45yILeZQ0sJEM9/xnn8spPxBUZnUCYfY9d5sYTUZK/h6BGpEumNHnJEBfG8op79mHMySMz1fKnC0yoXQI=
Received: from BN8PR12CA0009.namprd12.prod.outlook.com (2603:10b6:408:60::22)
 by CH2PR12MB4069.namprd12.prod.outlook.com (2603:10b6:610:ac::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Wed, 29 Jun
 2022 03:55:12 +0000
Received: from BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:60:cafe::18) by BN8PR12CA0009.outlook.office365.com
 (2603:10b6:408:60::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16 via Frontend
 Transport; Wed, 29 Jun 2022 03:55:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT058.mail.protection.outlook.com (10.13.177.58) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Wed, 29 Jun 2022 03:55:12 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 28 Jun
 2022 22:55:11 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v7 09/14] lib: test_hmm add module param for zone device type
Date: Tue, 28 Jun 2022 22:54:21 -0500
Message-ID: <20220629035426.20013-10-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220629035426.20013-1-alex.sierra@amd.com>
References: <20220629035426.20013-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe4fd305-d3a1-4ef4-513c-08da59832b00
X-MS-TrafficTypeDiagnostic: CH2PR12MB4069:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3s9T44qM2CUPqgLAutBdi7tV9Rq12N34GOqWk1hLlggN1WKz0vrbPNUwuwkpX0FTjNadYFr50HambekYJU3zobmUY3H3y61CQrAnqEBnykx1Jeg4VqEhde4fa6uwpOhAOem/0tKkqin/I3sX60uO9/mmj0WBoteMssSBYfczM5eVPZbejwUtVjNQyBentiE3O+e6WGSNb0Mqoh8zAKlw+w+ZqumnmROCGxixZrYRLtzHy6fKn4iTvZGyhwxeFn4u1XwQ7XRKvvNQSbz4gBV5YoYl5gN6BRsYlqVIrdCvoXzHscgsyUXfY5dtLxBnxeTau7H//QNNDVoTl4y2ItqXsojgojIFVTVfi2IKoi61jGOEkVbLpEM6I5y4fjMYxIjzG/82V3pcsnLp5PQ9UwMT5Jn95mDv7GtrQE37j8F7sOTdfHkBbC8dGHz9v0vQBwLfhGthC2JyphaSoo1KzAEX4ZW3TDEuLwgn6RFAbY27Xam5geW8JonVDg1SNWriiPENbze7NyhQbfkguLB7HwXP1Ym3FxTctNGLf4fflvPnaeAmoFZmeTl5wjUK1GjhL1UcGZHQigxmTTD9lwSTQHcK33QQH7sIAdAD7Y+nS1eJ3E4sd6eQ/E8iJbeNp0cCLhd9Fki359wxkDU2Wu5rZ49EmlQlJlFjPS4IbZpa8kVtGOIdA7e//4pEO68G8howKFy5nJNUGt/YihyUGaIEURWhXKJYuGPWarQwWExwRH0OxV7Aztpr1OOCaCQSJQKRSLtohVFPZ6wOXput4rPpJK16NZbpWt5UfpET3f0a1OF2Udb1veP3Bx2tMmW2H4sLj/CDqJJHphDuJ1hWlvE0G8i2Ug==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(39860400002)(376002)(396003)(40470700004)(46966006)(36840700001)(54906003)(82740400003)(82310400005)(426003)(47076005)(7696005)(44832011)(336012)(7416002)(26005)(6916009)(81166007)(356005)(36756003)(316002)(6666004)(40480700001)(186003)(41300700001)(70586007)(70206006)(36860700001)(1076003)(83380400001)(86362001)(16526019)(40460700003)(478600001)(4326008)(8936002)(8676002)(2906002)(5660300002)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 03:55:12.2750 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe4fd305-d3a1-4ef4-513c-08da59832b00
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4069
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

In order to configure device coherent in test_hmm, two module parameters
should be passed, which correspond to the SP start address of each
device (2) spm_addr_dev0 & spm_addr_dev1. If no parameters are passed,
private device type is configured.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
Reviewed-by: Alistair Poppple <apopple@nvidia.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 lib/test_hmm.c      | 73 ++++++++++++++++++++++++++++++++-------------
 lib/test_hmm_uapi.h |  1 +
 2 files changed, 53 insertions(+), 21 deletions(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 915ef6b5b0d4..afb30af9f3ff 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -37,6 +37,16 @@
 #define DEVMEM_CHUNK_SIZE		(256 * 1024 * 1024U)
 #define DEVMEM_CHUNKS_RESERVE		16
 
+static unsigned long spm_addr_dev0;
+module_param(spm_addr_dev0, long, 0644);
+MODULE_PARM_DESC(spm_addr_dev0,
+		"Specify start address for SPM (special purpose memory) used for device 0. By setting this Coherent device type will be used. Make sure spm_addr_dev1 is set too. Minimum SPM size should be DEVMEM_CHUNK_SIZE.");
+
+static unsigned long spm_addr_dev1;
+module_param(spm_addr_dev1, long, 0644);
+MODULE_PARM_DESC(spm_addr_dev1,
+		"Specify start address for SPM (special purpose memory) used for device 1. By setting this Coherent device type will be used. Make sure spm_addr_dev0 is set too. Minimum SPM size should be DEVMEM_CHUNK_SIZE.");
+
 static const struct dev_pagemap_ops dmirror_devmem_ops;
 static const struct mmu_interval_notifier_ops dmirror_min_ops;
 static dev_t dmirror_dev;
@@ -455,28 +465,44 @@ static int dmirror_write(struct dmirror *dmirror, struct hmm_dmirror_cmd *cmd)
 	return ret;
 }
 
-static bool dmirror_allocate_chunk(struct dmirror_device *mdevice,
+static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 				   struct page **ppage)
 {
 	struct dmirror_chunk *devmem;
-	struct resource *res;
+	struct resource *res = NULL;
 	unsigned long pfn;
 	unsigned long pfn_first;
 	unsigned long pfn_last;
 	void *ptr;
+	int ret = -ENOMEM;
 
 	devmem = kzalloc(sizeof(*devmem), GFP_KERNEL);
 	if (!devmem)
-		return false;
+		return ret;
 
-	res = request_free_mem_region(&iomem_resource, DEVMEM_CHUNK_SIZE,
-				      "hmm_dmirror");
-	if (IS_ERR(res))
+	switch (mdevice->zone_device_type) {
+	case HMM_DMIRROR_MEMORY_DEVICE_PRIVATE:
+		res = request_free_mem_region(&iomem_resource, DEVMEM_CHUNK_SIZE,
+					      "hmm_dmirror");
+		if (IS_ERR_OR_NULL(res))
+			goto err_devmem;
+		devmem->pagemap.range.start = res->start;
+		devmem->pagemap.range.end = res->end;
+		devmem->pagemap.type = MEMORY_DEVICE_PRIVATE;
+		break;
+	case HMM_DMIRROR_MEMORY_DEVICE_COHERENT:
+		devmem->pagemap.range.start = (MINOR(mdevice->cdevice.dev) - 2) ?
+							spm_addr_dev0 :
+							spm_addr_dev1;
+		devmem->pagemap.range.end = devmem->pagemap.range.start +
+					    DEVMEM_CHUNK_SIZE - 1;
+		devmem->pagemap.type = MEMORY_DEVICE_COHERENT;
+		break;
+	default:
+		ret = -EINVAL;
 		goto err_devmem;
+	}
 
-	devmem->pagemap.type = MEMORY_DEVICE_PRIVATE;
-	devmem->pagemap.range.start = res->start;
-	devmem->pagemap.range.end = res->end;
 	devmem->pagemap.nr_range = 1;
 	devmem->pagemap.ops = &dmirror_devmem_ops;
 	devmem->pagemap.owner = mdevice;
@@ -497,10 +523,14 @@ static bool dmirror_allocate_chunk(struct dmirror_device *mdevice,
 		mdevice->devmem_capacity = new_capacity;
 		mdevice->devmem_chunks = new_chunks;
 	}
-
 	ptr = memremap_pages(&devmem->pagemap, numa_node_id());
-	if (IS_ERR(ptr))
+	if (IS_ERR_OR_NULL(ptr)) {
+		if (ptr)
+			ret = PTR_ERR(ptr);
+		else
+			ret = -EFAULT;
 		goto err_release;
+	}
 
 	devmem->mdevice = mdevice;
 	pfn_first = devmem->pagemap.range.start >> PAGE_SHIFT;
@@ -529,15 +559,17 @@ static bool dmirror_allocate_chunk(struct dmirror_device *mdevice,
 	}
 	spin_unlock(&mdevice->lock);
 
-	return true;
+	return 0;
 
 err_release:
 	mutex_unlock(&mdevice->devmem_lock);
-	release_mem_region(devmem->pagemap.range.start, range_len(&devmem->pagemap.range));
+	if (res && devmem->pagemap.type == MEMORY_DEVICE_PRIVATE)
+		release_mem_region(devmem->pagemap.range.start,
+				   range_len(&devmem->pagemap.range));
 err_devmem:
 	kfree(devmem);
 
-	return false;
+	return ret;
 }
 
 static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
@@ -562,7 +594,7 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
 		spin_unlock(&mdevice->lock);
 	} else {
 		spin_unlock(&mdevice->lock);
-		if (!dmirror_allocate_chunk(mdevice, &dpage))
+		if (dmirror_allocate_chunk(mdevice, &dpage))
 			goto error;
 	}
 
@@ -1232,10 +1264,8 @@ static int dmirror_device_init(struct dmirror_device *mdevice, int id)
 	if (ret)
 		return ret;
 
-	/* Build a list of free ZONE_DEVICE private struct pages */
-	dmirror_allocate_chunk(mdevice, NULL);
-
-	return 0;
+	/* Build a list of free ZONE_DEVICE struct pages */
+	return dmirror_allocate_chunk(mdevice, NULL);
 }
 
 static void dmirror_device_remove(struct dmirror_device *mdevice)
@@ -1248,8 +1278,9 @@ static void dmirror_device_remove(struct dmirror_device *mdevice)
 				mdevice->devmem_chunks[i];
 
 			memunmap_pages(&devmem->pagemap);
-			release_mem_region(devmem->pagemap.range.start,
-					   range_len(&devmem->pagemap.range));
+			if (devmem->pagemap.type == MEMORY_DEVICE_PRIVATE)
+				release_mem_region(devmem->pagemap.range.start,
+						   range_len(&devmem->pagemap.range));
 			kfree(devmem);
 		}
 		kfree(mdevice->devmem_chunks);
diff --git a/lib/test_hmm_uapi.h b/lib/test_hmm_uapi.h
index 0511af7464ee..f700da7807c1 100644
--- a/lib/test_hmm_uapi.h
+++ b/lib/test_hmm_uapi.h
@@ -66,6 +66,7 @@ enum {
 enum {
 	/* 0 is reserved to catch uninitialized type fields */
 	HMM_DMIRROR_MEMORY_DEVICE_PRIVATE = 1,
+	HMM_DMIRROR_MEMORY_DEVICE_COHERENT,
 };
 
 #endif /* _LIB_TEST_HMM_UAPI_H */
-- 
2.32.0

