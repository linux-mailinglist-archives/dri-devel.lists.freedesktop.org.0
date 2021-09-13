Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BC04098BE
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 18:17:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF8E89FF9;
	Mon, 13 Sep 2021 16:16:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2077.outbound.protection.outlook.com [40.107.100.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D4756E200;
 Mon, 13 Sep 2021 16:16:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aFfJxNSeP3zAJeYPKE9x4A1gKBkN0nx+1XIBHfU0R45lgag5MzkN9oE1ZIX51IPAWeqf9CACFEcG5gwsVXmjeZfroS4pEKg7FF1gyP6FE+rorJ6u9oiZN6IG1+mCLg2okKuqiC1+LY0IIf86rR7mmYGaUi5dGjx1e3he5mlOMWUlbtuXipMZ8yO2Ht6n7Qp9jJaUiz8d6iThaBsVR5HuyZ9+wIxaWRJJA5WU1wy9ljXQeRT6Q+c/PEXl3JA1FmLjROyqQe/syMGzhM9ZiLzX5vT1vkWCuc1UB2C/IJ2yxqOK0ze5XZw56TlS8VmE2VvQnXF9SlmnbZwcKhL0x2wdug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Vezipz8HAGylYBhfg6EP5x9zGWoGwLSUmkbOu5ZdCTY=;
 b=Mw19/o1tZsNhU59jHBaq0lhgvRvnAyKBoiUD0cpWcucS0YX2kxc3iCHnGb86gzCTNyyJ2w+1k84SGqYSiVAfyTZ0Vv/8SECWND7Ynl4FpBiKdnBEWfnD0BrioDLnozn1mAzTbKwmMYieWtqE+aXzz0/9fWpP51HJF8nElebjjg+e2HrNj0aGaM4U19Wfw6G9TQzxqMSzj31SMLjeXKIdQJreje5gJ1ikZ2/SHjGf8IfMxeuFQvOY1OXOH/0NKVLmN6ecOOkYcULbtuWRkQ7I3PVPZnegXME5nkVCHHo8k/ObJJN6RlI7Ps3SX9iMeaFszdplUbV95qCUzjO+H4wfFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vezipz8HAGylYBhfg6EP5x9zGWoGwLSUmkbOu5ZdCTY=;
 b=Lm1Q46bIc7RVx6BbuZVnTT2e1ZG8NFrmwErqSixvVXTRDqBPOhEcnCbPdYdFnNABpghRH5210azfL+dmL9enfQO/o0DNI7h+RbpwWYQcNyexghGaO+BQ7Kg5sIHGRx7NE3/RMAsLQOa7TrCMXroW5T1dqhwplZekY6GHa7osufs=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SA0PR12MB4349.namprd12.prod.outlook.com (2603:10b6:806:98::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.25; Mon, 13 Sep
 2021 16:16:25 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::f1aa:9adc:b4f:4d14]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::f1aa:9adc:b4f:4d14%7]) with mapi id 15.20.4500.019; Mon, 13 Sep 2021
 16:16:25 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v2 09/12] lib: test_hmm add module param for zone device type
Date: Mon, 13 Sep 2021 11:16:01 -0500
Message-Id: <20210913161604.31981-10-alex.sierra@amd.com>
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
 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 16:16:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d922d66a-e5b4-4717-6273-08d976d1d544
X-MS-TrafficTypeDiagnostic: SA0PR12MB4349:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB43496A3C4FE391A39D96730DFDD99@SA0PR12MB4349.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e1x2q6NwtQfM/zIjmtTEGJ2BfeGeL8nLWSrLW47rwrVflz3qa0pIaWsvYuZ31n6neGQzXVvx5oGnJ48idsGPc4UMP/t7+lPbyJLmHCL7FWrMarCPfLkqns2ilxH6zq3FRFb2BGoTDqJbId+PO5F47Ww/fIY8c86tf2f09d88WRHXMmdO+WhkRPB6FTrh3CnlcH96PrFWXEkM44SYWx9f5rsBS3iQwhJjENpzs11fmcfb/8bep3DZ2y68u7fiKHjy65/mtxisfUWrBpMllgD8JbHqp4Gg6hrOsWbEV36++UlEO8s96XZd5ST8fwtIu3IJtjT13xtZvbkFHMotx7g/u1oXIiIcWwDVhyoar3p8inuZffJUhvs2h9/2rSAZqME3dcguvfNiRRqbCZCXCGHcbTBwxMRiNjta73LP5UXHYSr1ncRFjGUcOlFRIKmfivsPHS0JkIWrEVfHgOcQoQEMxIq9sXcgz40XZLU3yKykyDU8dDbOHxcljM1BO/KG4ApN2utMsLQFmYDEMOWlHiIQESkAHEo9svlHRAN4V9q7cNwxi8xOmE52WO0i+51ZAwldPXy62DTOoC7KU8H8uEn4qmeAGrYCNTdmxktBttfddp9hsRoHowO6EK92EI8rxcu27OvPKPsDMWhLj8ypVGjGjrF9u9mnO8RLtMG5Zf4J3FjUCtY/aGGOW2mVuEUWuWTayML+07lgEzA7PAFRuQvGgg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(396003)(136003)(346002)(376002)(66556008)(52116002)(86362001)(66946007)(1076003)(186003)(7696005)(478600001)(44832011)(6666004)(38350700002)(26005)(38100700002)(66476007)(316002)(2906002)(83380400001)(956004)(2616005)(4326008)(8936002)(36756003)(8676002)(5660300002)(6486002)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xA7YQYVn4yIkIsThlcQlYCvHw5vWrhOKN+XHx8QM/yA/WCe+MUt8Wr+PiZYi?=
 =?us-ascii?Q?sCy6J3Y7xqaPGQjA9TlxR38oVWhCm2bfllRmJCPFN+EOlapaC2ysf2W6+1Ej?=
 =?us-ascii?Q?3ISVQHdNSlERou+xLLs9zo9+EQ9tH7PFoqw30We9APYnxA6x4gOdYaQM0W+p?=
 =?us-ascii?Q?w9nc6+puNxME3EzL2aim4OEpzbbb9aZm0XVSj/mUkogoGDwGa9w0WUa25fTv?=
 =?us-ascii?Q?d6mjWWHB1lk7xAOfo+CkozYeOwbHP0KirsSQ7oen7SpcAAmtf0r0mxIIIiCb?=
 =?us-ascii?Q?unzZmze78J14SJtE5H9ykcuoJFNYAZBWvMaFj+fv64FHeSu5hKrnMTc0gWHu?=
 =?us-ascii?Q?bGgkyGRFhbFZPBzSUejNcLQhQdifbkpUC0rcwSP1TwjMDDycdgMuXUTbxH8m?=
 =?us-ascii?Q?mQpYQzQ0/bT1UMB2Pnbs4Upj55/ud+W+GWnzUcSh5tsV9gVnshWD+/JPVjmo?=
 =?us-ascii?Q?TFcFMeeTBR7XV+uGMUMN23T7lh4Mm3y+2LZ1q2a6K21fxzdeA5/gcGSGrGi/?=
 =?us-ascii?Q?4qFQmgw5cZ4sUF0+TarnM6TeDWSl1q3pW1tHzHwWUcZOTJZWAzltDOBm0JuJ?=
 =?us-ascii?Q?EDsDnbp8DVc/RopEtThJ8SIq1K8QXVOwX90zCruUmG8jQo2Wt36NiZFyROt9?=
 =?us-ascii?Q?lc4LyAShl//ulExDyg3+vNh+Wu9eHD+JGkWLCAS5GKjXvO2TaDIT+lpslI8M?=
 =?us-ascii?Q?AQ4q5JkRu+RRcW9LWghPKRfvCrN/St5apAmNvBqcF0FfmoT8YlhpXeKZ3iZp?=
 =?us-ascii?Q?mRy10pUSD9bsrE9erRJfngLfc8xQat6ZuFcvxe0Wf7KuTB3reXhQAwsE7dRT?=
 =?us-ascii?Q?GSR7dhsDqPTbz5RepM7zuzjK3gO6TGHR7lt8H7GNWZkrfotAJeRzjc9uBwfU?=
 =?us-ascii?Q?rbdMjpa5QbczcrbAvaGogT6Nu7YAHWV29dj61Z2+/MAZgmsFuK7HZIBS9xTv?=
 =?us-ascii?Q?CXhp40Yfjprf9/LIqC5gel0Xyg4QB57zhsepQDm/l6hfAdkRfEkxx8N5ZisN?=
 =?us-ascii?Q?vXgIpoU0qDmrv/381WriDh+CN1m3OvweKX3uFcgJurguvn0yYSV9Cw5PviHY?=
 =?us-ascii?Q?quM77YYhzHSiLRIfASjY/gFN9awVBVMnz9Oq1hoNJ/scRnwUzEzFOMsVg2Ug?=
 =?us-ascii?Q?EZJOlRk+TVmZUhxXwRdeDsNeFC1WyWlRafihB1etP7h4R/Wbch3MkVFLCcuY?=
 =?us-ascii?Q?NR/8PuBpFzQpOBCBrLVV8dAbbrX5GcD6CyfhYBctCNMH27kHP0S8OViUQOjs?=
 =?us-ascii?Q?b/Wz4xePbMkPVCTDDy2NM9822YU2nfOE9bx18y1J3D9ledUNSL41zO+YdkYr?=
 =?us-ascii?Q?NQvrrxe70h1LzCj0ar0PTqQy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d922d66a-e5b4-4717-6273-08d976d1d544
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 16:16:25.0216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CtyRMt9ps6dzS2Nlu8G84wGfH1O2QW77ATHum7TiN+xW1EqhCg+HkVZwv0ACMtEUpBq75r1mO0pGDZFS3Pc8mQ==
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

In order to configure device public in test_hmm, two module parameters
should be passed, which correspond to the SP start address of each
device (2) spm_addr_dev0 & spm_addr_dev1. If no parameters are passed,
private device type is configured.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
v5:
Remove devmem->pagemap.type = MEMORY_DEVICE_PRIVATE at
dmirror_allocate_chunk that was forcing to configure pagemap.type
to MEMORY_DEVICE_PRIVATE

v6:
Check for null pointers for resource and memremap references
at dmirror_allocate_chunk

v7:
Due to patch dropped from these patch series "kernel: resource:
lookup_resource as exported symbol", lookup_resource was not longer a
callable function. This was used in public device configuration, to
get start and end addresses, to create pgmap->range struct. This
information is now taken directly from the spm_addr_devX parameters and
the fixed size DEVMEM_CHUNK_SIZE.
---
 lib/test_hmm.c      | 66 +++++++++++++++++++++++++++++++--------------
 lib/test_hmm_uapi.h |  1 +
 2 files changed, 47 insertions(+), 20 deletions(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 3cd91ca31dd7..ef27e355738a 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -33,6 +33,16 @@
 #define DEVMEM_CHUNK_SIZE		(256 * 1024 * 1024U)
 #define DEVMEM_CHUNKS_RESERVE		16
 
+static unsigned long spm_addr_dev0;
+module_param(spm_addr_dev0, long, 0644);
+MODULE_PARM_DESC(spm_addr_dev0,
+		"Specify start address for SPM (special purpose memory) used for device 0. By setting this Generic device type will be used. Make sure spm_addr_dev1 is set too");
+
+static unsigned long spm_addr_dev1;
+module_param(spm_addr_dev1, long, 0644);
+MODULE_PARM_DESC(spm_addr_dev1,
+		"Specify start address for SPM (special purpose memory) used for device 1. By setting this Generic device type will be used. Make sure spm_addr_dev0 is set too");
+
 static const struct dev_pagemap_ops dmirror_devmem_ops;
 static const struct mmu_interval_notifier_ops dmirror_min_ops;
 static dev_t dmirror_dev;
@@ -450,11 +460,11 @@ static int dmirror_write(struct dmirror *dmirror, struct hmm_dmirror_cmd *cmd)
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
@@ -462,17 +472,29 @@ static bool dmirror_allocate_chunk(struct dmirror_device *mdevice,
 
 	devmem = kzalloc(sizeof(*devmem), GFP_KERNEL);
 	if (!devmem)
-		return false;
+		return -ENOMEM;
 
-	res = request_free_mem_region(&iomem_resource, DEVMEM_CHUNK_SIZE,
-				      "hmm_dmirror");
-	if (IS_ERR(res))
-		goto err_devmem;
+	if (!spm_addr_dev0 && !spm_addr_dev1) {
+		res = request_free_mem_region(&iomem_resource, DEVMEM_CHUNK_SIZE,
+					      "hmm_dmirror");
+		if (IS_ERR_OR_NULL(res))
+			goto err_devmem;
+		devmem->pagemap.range.start = res->start;
+		devmem->pagemap.range.end = res->end;
+		devmem->pagemap.type = MEMORY_DEVICE_PRIVATE;
+		mdevice->zone_device_type = HMM_DMIRROR_MEMORY_DEVICE_PRIVATE;
+	} else if (spm_addr_dev0 && spm_addr_dev1) {
+		devmem->pagemap.range.start = MINOR(mdevice->cdevice.dev) ?
+							spm_addr_dev0 :
+							spm_addr_dev1;
+		devmem->pagemap.range.end = devmem->pagemap.range.start +
+					    DEVMEM_CHUNK_SIZE - 1;
+		devmem->pagemap.type = MEMORY_DEVICE_PUBLIC;
+		mdevice->zone_device_type = HMM_DMIRROR_MEMORY_DEVICE_PUBLIC;
+	} else {
+		pr_err("Both spm_addr_dev parameters should be set\n");
+	}
 
-	mdevice->zone_device_type = HMM_DMIRROR_MEMORY_DEVICE_PRIVATE;
-	devmem->pagemap.type = MEMORY_DEVICE_PRIVATE;
-	devmem->pagemap.range.start = res->start;
-	devmem->pagemap.range.end = res->end;
 	devmem->pagemap.nr_range = 1;
 	devmem->pagemap.ops = &dmirror_devmem_ops;
 	devmem->pagemap.owner = mdevice;
@@ -493,10 +515,14 @@ static bool dmirror_allocate_chunk(struct dmirror_device *mdevice,
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
@@ -529,7 +555,8 @@ static bool dmirror_allocate_chunk(struct dmirror_device *mdevice,
 
 err_release:
 	mutex_unlock(&mdevice->devmem_lock);
-	release_mem_region(devmem->pagemap.range.start, range_len(&devmem->pagemap.range));
+	if (res)
+		release_mem_region(devmem->pagemap.range.start, range_len(&devmem->pagemap.range));
 err_devmem:
 	kfree(devmem);
 
@@ -1097,10 +1124,8 @@ static int dmirror_device_init(struct dmirror_device *mdevice, int id)
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
@@ -1113,8 +1138,9 @@ static void dmirror_device_remove(struct dmirror_device *mdevice)
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
index ee88701793d5..00259d994410 100644
--- a/lib/test_hmm_uapi.h
+++ b/lib/test_hmm_uapi.h
@@ -65,6 +65,7 @@ enum {
 enum {
 	/* 0 is reserved to catch uninitialized type fields */
 	HMM_DMIRROR_MEMORY_DEVICE_PRIVATE = 1,
+	HMM_DMIRROR_MEMORY_DEVICE_PUBLIC,
 };
 
 #endif /* _LIB_TEST_HMM_UAPI_H */
-- 
2.32.0

