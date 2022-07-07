Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F76856AB58
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 21:04:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3158113DA9;
	Thu,  7 Jul 2022 19:04:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2082.outbound.protection.outlook.com [40.107.223.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9783B11346A;
 Thu,  7 Jul 2022 19:04:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U6KjflSP5KuwW5gRr/eMs1Z9f2cIUdKEeJYmveEk3RNPzEwPD06nfE+8OMsaDZoe1H9EtDwb9Lvip1dn7IsIaDsjYjR3Ff4L0jtLYZguCx4QsCGaKZyCXyMTNbHLH3hSgyVKnP8fngnrR8YtpeKKcj/ZxCWzzlWn9EmUVaAq2QLnnnBSSmNgmuLGsLQKUJN8EpTR/KA5QQ7y1FLJ/5B873IohJ1nn8C2MwimPCMVKXeMjcrbqNrh7UpU4xTHl2l2eI10Pvj7StnR8YBpHoVlChpd/qi0mK6n9/jM0wpdM2WWERbCNlfrHEi33ce2pZxi3dhO+LY4/c4Eyv682FRZew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Gq5krbSDZgVmQmlPCe18YVS7UIhP8NZXgBaLYb/5yI=;
 b=dCCzp3pwfhVYGxPEcZWIyPJS1wbFMV/ZJByTSAQR5pJ7+3N8pezo+lqHlyJzIcx9biopJ5vUhsYyfr+ZyvJC5TF+fs6k6empdAGfx1u0SuPeQn3+FQFPJi29dy+LC2dxyjrFc26q5jTBvn/Ii02Pm+/7FmqshPF/f19xTH69t/O/7dmwiuhFnAsZwjXevHkpDS8FvOz7aaDb5GTIJ79FwkLbizTJqK3X1BDiqnCUTSKlncPrVxn3pTrWlDUCdyiJF+1+5zHHZa0gqom2XyaN/bzV9hSgDT2B93mqtif0Ed3USS+zXRphBssGn9+aw6gvBfHfIf4JBUlJtJc9eJTzxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Gq5krbSDZgVmQmlPCe18YVS7UIhP8NZXgBaLYb/5yI=;
 b=a2sryF3qh9b8EaRTQy1UnJMp7FY6S1PNJ8GMSVWw30zD7IX5EuoNlKvS1F1Pr2TX5J/BllhJMmd2XajSldiG7RQlfHURpFtpsUQjAA7c+EQgPswwvl2o+kR36XvItjwb8hORmVjNJrOHFQ/3mi4tSIdpcaI4iBOchGdbkJ3bNho=
Received: from BN9PR03CA0256.namprd03.prod.outlook.com (2603:10b6:408:ff::21)
 by MWHPR12MB1694.namprd12.prod.outlook.com (2603:10b6:301:11::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17; Thu, 7 Jul
 2022 19:04:18 +0000
Received: from BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ff:cafe::46) by BN9PR03CA0256.outlook.office365.com
 (2603:10b6:408:ff::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15 via Frontend
 Transport; Thu, 7 Jul 2022 19:04:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT012.mail.protection.outlook.com (10.13.177.55) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Thu, 7 Jul 2022 19:04:17 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 7 Jul
 2022 14:04:16 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v8 10/15] lib: test_hmm add module param for zone device type
Date: Thu, 7 Jul 2022 14:03:44 -0500
Message-ID: <20220707190349.9778-11-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220707190349.9778-1-alex.sierra@amd.com>
References: <20220707190349.9778-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a65340c-4aa1-4fb9-a64d-08da604b7e1b
X-MS-TrafficTypeDiagnostic: MWHPR12MB1694:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DlQIlpq5FiCoP3bgF6AcLsKQxpGYn6/R66/XoMSZjsG6QKjjp3B2QOGiF1uB24lPlfi/4gH1+NC7t0d6+D/7Xby1AzSXA3oT9Pp/O6Qzzp2E0vikmbTSlCL9wbkE6+Sna1k3iFIvgyb7NHm4OH0S17GhpmcwhWp2n2U7ifTOwAJKcd7mNFpzxw8XyZ/o5VqijX9fogAu1iOepii8Y7Hs8QjlmL9s2RU0kf40lzPhSVCl8SZLXL5+8+gBWETYkjO43uBQen5A5f/ALI4WiPJ71HCHmzLATJypu+v6uWZ1v7AZuohiTTbR4dTk8GnSQo8w9kA2F6vybGg+5ZbeDSHiLGGwCtIRxHz85ZQH8n0yLxCyzUesFWRjwN2OKm5yQkyiwyrz8hTF5qPaizs7zs1ilTp4IKL1rRzOjLptWcG6JxEzXqYjnLSXmiHv5/WOe8tlfBFoPjUHbrITKMRgpjjnLFFAnvwJ6Eg6Y79Yic/PzB5UNdB5XAeDZcZPlP51RZFp2uVrp8RKVTIOnM6x4mEt5TUIuNPpjSU+bu7C2HomuziHwip7rDDkZmYKFbb27FZZ67w5rCu52YgDWcCDKAy8cNh1+75eAUWO4/LGHUOGCjcFzqnmAvEi62+enj4fWnX+GUu1cAbKcnyp8MGHuF4CLMKhvWK1x+JZlCJgXAsJXLZILfJPlEVEWpJfNchVZ2z6/yHajdoGjIAHG66vD6MeYDW45aJVdJNQNyUsv+UbKzXgErPqAGdSRDu7gfutP74DMTrislhjhvhnlHOe/ZTJ3RBaBVoAIIyCjUX8vEA40K56DRHMuNOxuh9ckbCRA9JNcRGMUQD7tKcCCzJbb1wrD3z1c2OPpqTbxiAvFGEnVovcSNZy3vKeEd4IFw7ULF8Y
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(136003)(346002)(39860400002)(396003)(36840700001)(46966006)(40470700004)(40460700003)(81166007)(44832011)(478600001)(7696005)(86362001)(7416002)(41300700001)(6666004)(36860700001)(8936002)(5660300002)(82740400003)(26005)(356005)(34020700004)(2906002)(426003)(54906003)(1076003)(47076005)(316002)(83380400001)(186003)(2616005)(16526019)(40480700001)(70206006)(336012)(36756003)(70586007)(4326008)(6916009)(8676002)(82310400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 19:04:17.9964 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a65340c-4aa1-4fb9-a64d-08da604b7e1b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1694
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

