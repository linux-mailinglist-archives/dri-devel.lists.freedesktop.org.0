Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B12E43F6DFD
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 06:03:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 223016E114;
	Wed, 25 Aug 2021 04:03:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2044.outbound.protection.outlook.com [40.107.223.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8172B6E111;
 Wed, 25 Aug 2021 04:03:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m4rbjPhOhO30QgBWlpTSdzqAqaC0UjGAeptIul5KIH+LVTq/GxDhVTPP+uEsOr4WwJoG/3zxGpoCQN3X2j2EVQRLuuUrIGjCFWHBogt9lV8sun6LZcyw9iQhvXZ/UJhBHCcjQWAoMdJrCtrWPK4pFQhqcfwpAVSEl1DDi7INCOlunOSuMfh6/nzFntIh5hnYyf8R49Y0HEIgWVjxaEIdFGPcNVwcujCtZmA5O2tc0JGHDH4mtuR1W6OV4dhK3Ln1VI++wfVCryDM1o4EVwkdLv+tbCbTOZcb7fMRs5yGubWoX1W90g84SAogVNm6nVssrgcY8gjscqqhepFicIppcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vezipz8HAGylYBhfg6EP5x9zGWoGwLSUmkbOu5ZdCTY=;
 b=mefmL70kroQBOKgF7lZ7yHMjQMXkc3X8DD83k6HfBfOyq7TPxlw4ynVCbGKxVfKdKpI6W9H/VSsyJilCbhJVJIKyReUjcAeS1r9DOd54UPgEdU/7ZlKlo1nUmFXtT+JZylMvsP28C0PRL8o9mP5nOrJiQf38GT0Aa23Xux70lR3K9Dzo13El7f2FDP9+Q4sEFK5x7xsXPvkQeRXIjWFSupwUwCC/9g++1ZKGZp2dc3WCKof257psH0Y13FKu4xeDmEu4D8MojNUeAzq1i+wypFHvVHP5VxeQloterCmcbWIztHJG6t1mVq7WbwXGh7CMk97nyR14k2Och8yxzrOSOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vezipz8HAGylYBhfg6EP5x9zGWoGwLSUmkbOu5ZdCTY=;
 b=KUXeHjo7wtBAT+XeU+I1Hm4UrOnIwTGnx0ciaeqT6YJDK2AJjVb01zzAdraNDFUJpEi/6qov2DKXQBPj2IGxRGCUPj5WJpiStLr5HuoHIFnG2UWti6cXyYxyyftcS+nXXJfCJHn/G2z+tRq1EmJov/QjquPRPuQd8Nke1HT1n7Y=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN6PR12MB4750.namprd12.prod.outlook.com (2603:10b6:805:e3::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Wed, 25 Aug
 2021 03:48:50 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::855b:1f8c:c5d1:331f]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::855b:1f8c:c5d1:331f%7]) with mapi id 15.20.4457.017; Wed, 25 Aug 2021
 03:48:50 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v1 11/14] lib: test_hmm add module param for zone device type
Date: Tue, 24 Aug 2021 22:48:25 -0500
Message-Id: <20210825034828.12927-12-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210825034828.12927-1-alex.sierra@amd.com>
References: <20210825034828.12927-1-alex.sierra@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0190.namprd04.prod.outlook.com
 (2603:10b6:806:126::15) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SN7PR04CA0190.namprd04.prod.outlook.com (2603:10b6:806:126::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Wed, 25 Aug 2021 03:48:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34be4cc8-c4cb-4f63-28d9-08d9677b3fda
X-MS-TrafficTypeDiagnostic: SN6PR12MB4750:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB475029C317BE90551E57BA4BFDC69@SN6PR12MB4750.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7os4c1McGVINmDlnZXGOqMROqpRwJ5CxEoiU02/wSgq7tRU99Xo6++riJwYoJxy0u7TBAPrEFwdnnTiG5i1Z/Ajc2QqTXMHHESTykBRGuIh1H20skj4yL8HQEAqE49uJRCU9/Mz25WhxnN2SWSALirTDL4CuDF2eaMcE/pnYSQMC9FecRQbZZwN+9W8XaBlDJhshBTmcSLHXnNK6PhTJKq+kfpzD/Osuo6EY9vuOjZJj/+4dxsIDFIGF7OWUW4njUhAoOTrdJT46Nhi99tGnmDKDkkODpzRBq3SI4secAy6oKLCGK3kgic7WmBhY/N6/oyQpXBUDoVKh3FTGYNHyucjl6Ljr5r05XyfuWFlumD/Vcmai+6YKygqbfVaEMVg33EuKvL1CZ+sSQA0YpDykNjR3DhZMiCgS/178FflZo045gS2mlRhmtPlyvCIINzvBprMZEUVnu41hYNTDbLl0Z+sE9PKVGvNvqTj19Fz05/Y+ijmrZfkAkdwkdf6qOouzkCdMJADJX2u1UTWaBVTRyxWa2WrVA3ydomod4D+kf4RJ0QSgBpFy5hOljfln+HwzE+M68hsIminNIye2wneZlFD1MahMqVSN2d7g8Ak2HFOzijxmvKX5ANGNDBRVYRTxy3P0R9cnWbkj6HnA1YWGenf9XN637D0m48VAga392SLiD0oDvrehXrCceWaqQ04NaIYQNsiNriZ8+bdr1XX0SA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(7416002)(6486002)(1076003)(4326008)(86362001)(7696005)(44832011)(52116002)(186003)(2616005)(956004)(38350700002)(38100700002)(478600001)(66476007)(66556008)(6666004)(316002)(26005)(36756003)(8936002)(5660300002)(8676002)(66946007)(83380400001)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6jK+pEfFoBnCUHBHdphh+YbpIS9kT4edaN9ArwpAX9/CUxghlLvRueeP7/bS?=
 =?us-ascii?Q?9MrUi++ICbOMIvRAE46IaP4ygHQK6MZzQE0RNhNUxFcru5xi49tCpbmQpFsI?=
 =?us-ascii?Q?472g6WBgpsASVz4L7U8OZ0yjrjDqROonWmU4+7Mcl97DNWruB2qELKVU1MNk?=
 =?us-ascii?Q?BgyFJldmx/dvq7b/iFYGPA+koauwiY3sGXaLXd5BS/BBQuWgC+d3kzeUWM+a?=
 =?us-ascii?Q?KL4pf70+6WEVCsVGUrfAKvvK4Jj5WNTNv0LzqPLlGO4hQYpLtn32b3lEQCD9?=
 =?us-ascii?Q?qYidaVe0VoTh0ywkfES8zNng1nbdrpDLFUFdqCT+WSmYNuzYE3slcr5eR8zB?=
 =?us-ascii?Q?IROs+7/S0DuIDScTEqtJTdLtlpZ60KT9mkr5M23kBvMPwPyrYjr995RsL8iH?=
 =?us-ascii?Q?5U6KOeGKSn4FixWdWeS4U7NmR1acJ/Rz6rmQ+XohZm3x0xrn8ZAr7TcBpe4j?=
 =?us-ascii?Q?gQqrfVBphSuSuV9FjugvkwzH/uFxCC7PONbCw1AWOf4F+VgRH76Tx457s0ND?=
 =?us-ascii?Q?yb9+hZuGYtcvLMJs2xbYL00Atkw7SVu/dtjcU5WLeKYUV814tAzO4rT2OqeB?=
 =?us-ascii?Q?wG/W4VqXa37oYgMbviah/TON5wuTnLyGbWBbs0bq3IzgrtZTpNX+IxDMnAAO?=
 =?us-ascii?Q?YqULXYyaq8BP//tz02sqR0K+qQGcDffckvP37Wyk4wJzuD/1XOZBp9K5bAt+?=
 =?us-ascii?Q?0NSsknGoWMyxeIKe3vPbUbt/kn8Lin9Cx3AtxZEgotU+NLZqxE9aUEUzy40R?=
 =?us-ascii?Q?TZ1N6QsWVVnQsrwDrGx+icvJK2PYcxeo7UB0y7xB7a1drZJSpKZEPlew5EYE?=
 =?us-ascii?Q?nvQftwQLUoLs2KDgFmEEU9EMb04QXbgEIK5AgfooZiPXv2YoObVb4b9BFHgp?=
 =?us-ascii?Q?6z5TgUyGtMVQaUWeRoY+w3vEv7PPDNcD+KM3quZ2W/+XxczdiJCT30gqjWrT?=
 =?us-ascii?Q?bhhj1/TV6uySfa3mWTOOgvidlO8AMJxXz05O29aBu4fa+3HyPVbkGsl/9Kbw?=
 =?us-ascii?Q?R+jmb/6FfANPkBpO3FFqgyq+upuLaW7A+6GEHWKARWnUMtMgJ//QQXSL+M/L?=
 =?us-ascii?Q?IAGKTFBh1dZaoKtdxTVeofmK57OWeGAxylToCk5j0X8i2vAKe/LHlQQrb4Oj?=
 =?us-ascii?Q?wT2U8CAm0RxRte55MHRpmFs+utihjF/AB2FIjZHSip1jn5kEQKAmK3n5s+ag?=
 =?us-ascii?Q?g/+rdtQMJauJLIMcmPK9uiF9fyWssYNCSkilQKaf8k5wD1dU0g4zXPgVduJx?=
 =?us-ascii?Q?KRBKL1C39NTaOtT7KQoMgfzrKApvGGdLm5URp15EvldSi27A2ENeDFg1fxoa?=
 =?us-ascii?Q?4/23D9CP7albe+bnMDGzcDI8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34be4cc8-c4cb-4f63-28d9-08d9677b3fda
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 03:48:50.0750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0jZEKm+z6RU9McCZRsps8GtZkKept7rw64B7NLot3lZoBXpu7eogJjdKyyj0QTI+8Bvb6yJtIeohrJ0f1Nkt1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4750
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

