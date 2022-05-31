Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 554E0539796
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 22:01:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A3DD10E5AB;
	Tue, 31 May 2022 20:01:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2067.outbound.protection.outlook.com [40.107.220.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75DF010E4A7;
 Tue, 31 May 2022 20:01:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TEDdNc561R4PxsIAVJrZ2UAAaYxK40n1rmblhLYARPe2tmqVP8ERsPXohPJ22ImecEl00nD6wT7Am5yIsDlZ+ZLi5mZfm3UPS9ihR4s/N2pU+HYbRMmlez0mg06gOSTqKJC6zK5fCn2qnvcN31fYiD66BdieoCQUqpQU2v5uXRRmXxv96g1wAAlNA7Hk3ZzwOGPSUWimj6NxkUNokP1F0SXmqtpevCIgE6fq71Xq1Ad5d/qG0PsLGeWZAlNb4U3ieWCVed/X8y1DBMgmCujAX5jmj4nnoYqeZe1T821DZzXplPIXZR4a5VJYGYAz0DBluTOe80DdfeMiSosJWFD2bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Gq5krbSDZgVmQmlPCe18YVS7UIhP8NZXgBaLYb/5yI=;
 b=bFKvoC2H7F8L2hbqYEM0gUc+SGKdjV1MHNuDPmHefxTzL2T74h5mH2gDHIKWoegjpJhYAXkOxS+Ny18c9KSNuLCjYre9AfIPe/AUA1dSqhm2mElwGp/WPQ2iK6/WFmMrV2gJ43p654rvSgrdyvi+N3dfEEt8/rQZJjQhZX4dPKDRwVqMJKyOmWl1ndElJwRCqZbxFWDxn+WKcb7t2EuvVrUZA3+cRz02CRwHgd8WkeffQAvPQyUx2J1xivD8MRyNZ002ik8edaIk8v2YvA3imExtaNBW26K9XlLmG2+TdqOXBKHyZ4QlAb7VvlWIWLHX7Pclnw9GuT/iGj1nOlXZAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Gq5krbSDZgVmQmlPCe18YVS7UIhP8NZXgBaLYb/5yI=;
 b=n0dca9tO8nPIpy2LYZWcdTkc3FnG3xUL+LEwmo+iFbgZKU1xCYbphXcelFDo9KKZNmS/cJ1WkMqxiH+eTQs62+L2kSojWMjF7pkNX92PUzBw7hc2t1X/pzMjLaG2dZU08uCfW9jA4nmCARhVaq2nDaZfywly2E4R5j2rggZu8gM=
Received: from BN9PR03CA0392.namprd03.prod.outlook.com (2603:10b6:408:111::7)
 by DM4PR12MB5722.namprd12.prod.outlook.com (2603:10b6:8:5d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19; Tue, 31 May
 2022 20:01:02 +0000
Received: from BN8NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:111:cafe::bf) by BN9PR03CA0392.outlook.office365.com
 (2603:10b6:408:111::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Tue, 31 May 2022 20:01:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT027.mail.protection.outlook.com (10.13.177.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5293.13 via Frontend Transport; Tue, 31 May 2022 20:01:02 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 31 May
 2022 15:00:59 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v5 08/13] lib: test_hmm add module param for zone device type
Date: Tue, 31 May 2022 15:00:36 -0500
Message-ID: <20220531200041.24904-9-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220531200041.24904-1-alex.sierra@amd.com>
References: <20220531200041.24904-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb825e27-d639-4da8-2ac0-08da434049e3
X-MS-TrafficTypeDiagnostic: DM4PR12MB5722:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB572276F5F3C5B99A8B8327B2FDDC9@DM4PR12MB5722.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N7XEiALXBEFeqgtjrawAcfkTX/cLGnuq+Qs+qKsJS8PSnqhtYcPTx1o7dgxF1vXgdjf5Q6KS6jR1IA7BCKbqa748DmCyCUSYd+VsFOooGOOhiQSKsowT3WE8ZsCARb0zJY93/yMhJnSs5JRNiDDwKjrOhrcaHu47nuHbpuFXZ0XV/G7WnYpDWUD+iIN+HvBOaS6d2eePr98NjUd8KJLoFokfxYUzsADXCaFxrMmpbrEXRG21AVZDXlzAJ3IiykrDERDV4281lhoDpEv+JsODMq401Lr1S3A9XPuPGDNJP8m9vL6ZKYPOY+Tej23LQ953cO2dpjGMmyJLWfwVYJIqm1POOjJ/OG7JSg+N9JH/LZcgFDbNoZPh3+r1LhF602kk3IH388nKMHsN9tNlp/QY0sAABWsZZAwfcO2UB2qxli4JFwbXNbWHZkKP3RWM5XJ6qZe4h9TfmQXmKmcSSZuxAuTonln1Ctoxhurkuq7lwbzd1zK2lnUH55zm2Eb505WpmsPtvDaygb172iWDt3OmmNBk6hzudxtaAh3css7zNRvnxWkSRSH2285Df7nh3S4wuFVxouH2JlMTdQLRlHnrWofdMSWqtNkgDlII9Z29TbtaoIyQwUzdkeSlkZHRttEOkC9liUxkzRovkISlcBlyKaikfldJIbVRZ383wnKds+J1rdsOfGODEH8s1MFcWzOxjdAdyFWrwNSNgHnBb7JybQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(6666004)(16526019)(86362001)(316002)(508600001)(186003)(81166007)(2906002)(36860700001)(1076003)(336012)(54906003)(6916009)(26005)(47076005)(426003)(7416002)(356005)(5660300002)(7696005)(40460700003)(83380400001)(8676002)(44832011)(82310400005)(36756003)(4326008)(70586007)(2616005)(8936002)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 20:01:02.2157 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb825e27-d639-4da8-2ac0-08da434049e3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5722
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

