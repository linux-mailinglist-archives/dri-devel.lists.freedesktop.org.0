Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F980451236
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 20:31:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C84F36EA45;
	Mon, 15 Nov 2021 19:31:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2072.outbound.protection.outlook.com [40.107.94.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F266E7E5;
 Mon, 15 Nov 2021 19:30:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jbrTtOkdCNtd2oPgOSowsyyUybt/FD63LJI5qpO+JXCZENqCxEXinkkGJnlcTXELqzMGT7tirI2frnMumWuVPaRy0nGXSyNt9qfF6jEukt2d9Jl+ziYDbI168kd1/CqAPa6ddNU0rdgmCYS4c66jrVu3SXPZgpfXg8jcm7SkKtcqUNVnSzyRMt3MmObkaj2ltDNo/Bu57SynWH++k7EcwhlE9vVW3pYWJ5eN/LOAomxFE87GfpVaCfX4cGocJ2zrlFkQ53X0odBquXWM3qkF8zSiVkKhqljZyxk1YaxrxVY4qM+nLeh7gkyTb5X3TVKPDutRRXCPauWiTehc0da9rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yKA1JQB8NqjzxNQPQuWC6zObdpLiuxUOB4d+R3aArFY=;
 b=CaJ4wGDGlq81+9c7+vQxxZkSHPqryjSVf8R6MDYLENwgzpmJOdFh/PSPuPQAtT/m8AWCiuJlO87bOlwcUa3qkMA0kmzGPL4zEE1BJDhQkK/GrCbwsYUohzcLGzaH4Hj5wYDCLenuKlWxcpNMW5DY4T5E1uSQ49G0wlnHYh7uzavMu+F5/fVyMN5oDz7zcUBrLrVGflTVLtpmc7xgElopvrEmMinCawAEQRzSxvSrEeknXiZOXvs1UrHo/M2zwLJCA2DrH2o1XSzwgo9RWrWB11OAyzDbuOVBNsUXG372Isn3WpUZY62SXbMR65fPS4XxZWMmdLChNteO9v2f0m/pbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yKA1JQB8NqjzxNQPQuWC6zObdpLiuxUOB4d+R3aArFY=;
 b=LIf8VZIMP4w0WuX8YlBJUF4dBbYv5De+efhq+15f99sec10wuy4bJnBRUUlPiIVNbgFkg1J1Sl+gFHMaCPZRi3e9EB8hDNqkb/kpdp9PkDa8FuEYSg32YbisQuNxqRVrVp2dtFvVtF0/x1iiUP5at4+K+pCwDybvI+GB6v6sC8M=
Received: from CO2PR05CA0090.namprd05.prod.outlook.com (2603:10b6:104:1::16)
 by DM5PR1201MB0218.namprd12.prod.outlook.com (2603:10b6:4:4d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Mon, 15 Nov
 2021 19:30:51 +0000
Received: from CO1NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:1:cafe::4a) by CO2PR05CA0090.outlook.office365.com
 (2603:10b6:104:1::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.15 via Frontend
 Transport; Mon, 15 Nov 2021 19:30:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT026.mail.protection.outlook.com (10.13.175.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.15 via Frontend Transport; Mon, 15 Nov 2021 19:30:50 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 15 Nov
 2021 13:30:41 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
Subject: [PATCH v1 6/9] lib: test_hmm add module param for zone device type
Date: Mon, 15 Nov 2021 13:30:23 -0600
Message-ID: <20211115193026.27568-7-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211115193026.27568-1-alex.sierra@amd.com>
References: <20211115193026.27568-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 096151f3-f980-4abb-298d-08d9a86e6ed3
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0218:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB02182D28A2AE7FA1D8F7B6A1FD989@DM5PR1201MB0218.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nEB3ESC4qjeU01Le1CeFI5LGT4OgvUH1KbT8SnrNLdR27LgViR3wH2vPvk2pg3ZFT4UsgQ5zvCDDNoHHAL7LRwbW/Kv55JT6pC4+GEmuK09gRVlt6Ee9MrkqrMbLteSxurpHIgLG/j42hT4owq8tMQN3+AGavvtdwdOAKMZlXWV79U/PL/kXWVEHQYnIfI1oXHYrb3EH7wG0RkVIO7zlBa48jShwBrZPne0F67O61N+0ovXcIZUQKh0e24AxR6dh/NgE0QHNyiL/SqvdMHcuD3f3UmwIOCODZQ77OfQ67+uVf93puiwjacxfqUwn6FsjUeQBdVE3YDwiwhEFlFbFpLLR/1FVuf4ewvWSuNFWyc+3CzXDZF1l25cxD+AkDEXklNpFVSiRjVgKbxFDQMxbbExFymK6lJWefiiuYUfR0WyJrKk0rbkUyzMuzNcOsNZ3Or/JilIDhKyVx5jrYp9iotxHp74Z79zRtGn4MZdNs0cy+VJI8w0fslR/7vfoR+uxA5lIJlQ9kfzv/SKEk6uXN1UtF+W4sz8sHohDfNM0BfggcSNgu3iy7BwozBSQGcLFjHxn0b2tpAC2xpZHxYkqFKmh1kKv9lG/guYMGwmmW+UgCsGchSedtg/Tmnzi+w0mBhU0m/tOzvAPkegRShsqorqZFbyGImLnSDlPwBKJaIHZdfDLuJytOSMSXieoNUtJQrrRhh9mGfmHgK0Qz0R9J4jnq8+sNeKj8h3CZLcaOg12ulwoSfPtXk8LA/RSyfyER26t98BtI+5GabzzbVsZxg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(36756003)(4326008)(426003)(83380400001)(336012)(44832011)(70586007)(82310400003)(36860700001)(356005)(81166007)(47076005)(8936002)(7696005)(316002)(5660300002)(508600001)(86362001)(70206006)(54906003)(110136005)(8676002)(1076003)(7416002)(16526019)(186003)(26005)(2906002)(2616005)(6666004)(334744004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 19:30:50.7238 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 096151f3-f980-4abb-298d-08d9a86e6ed3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT026.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0218
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
Cc: willy@infradead.org, apopple@nvidia.com, dri-devel@lists.freedesktop.org,
 jglisse@redhat.com, amd-gfx@lists.freedesktop.org, jgg@nvidia.com, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to configure device coherent in test_hmm, two module parameters
should be passed, which correspond to the SP start address of each
device (2) spm_addr_dev0 & spm_addr_dev1. If no parameters are passed,
private device type is configured.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 lib/test_hmm.c      | 66 +++++++++++++++++++++++++++++++--------------
 lib/test_hmm_uapi.h |  1 +
 2 files changed, 47 insertions(+), 20 deletions(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 2daaa7b3710b..45334df28d7b 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -34,6 +34,16 @@
 #define DEVMEM_CHUNK_SIZE		(256 * 1024 * 1024U)
 #define DEVMEM_CHUNKS_RESERVE		16
 
+static unsigned long spm_addr_dev0;
+module_param(spm_addr_dev0, long, 0644);
+MODULE_PARM_DESC(spm_addr_dev0,
+		"Specify start address for SPM (special purpose memory) used for device 0. By setting this Coherent device type will be used. Make sure spm_addr_dev1 is set too");
+
+static unsigned long spm_addr_dev1;
+module_param(spm_addr_dev1, long, 0644);
+MODULE_PARM_DESC(spm_addr_dev1,
+		"Specify start address for SPM (special purpose memory) used for device 1. By setting this Coherent device type will be used. Make sure spm_addr_dev0 is set too");
+
 static const struct dev_pagemap_ops dmirror_devmem_ops;
 static const struct mmu_interval_notifier_ops dmirror_min_ops;
 static dev_t dmirror_dev;
@@ -452,11 +462,11 @@ static int dmirror_write(struct dmirror *dmirror, struct hmm_dmirror_cmd *cmd)
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
@@ -464,17 +474,29 @@ static bool dmirror_allocate_chunk(struct dmirror_device *mdevice,
 
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
+		devmem->pagemap.type = MEMORY_DEVICE_COHERENT;
+		mdevice->zone_device_type = HMM_DMIRROR_MEMORY_DEVICE_COHERENT;
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
@@ -495,10 +517,14 @@ static bool dmirror_allocate_chunk(struct dmirror_device *mdevice,
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
@@ -531,7 +557,8 @@ static bool dmirror_allocate_chunk(struct dmirror_device *mdevice,
 
 err_release:
 	mutex_unlock(&mdevice->devmem_lock);
-	release_mem_region(devmem->pagemap.range.start, range_len(&devmem->pagemap.range));
+	if (res)
+		release_mem_region(devmem->pagemap.range.start, range_len(&devmem->pagemap.range));
 err_devmem:
 	kfree(devmem);
 
@@ -1219,10 +1246,8 @@ static int dmirror_device_init(struct dmirror_device *mdevice, int id)
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
@@ -1235,8 +1260,9 @@ static void dmirror_device_remove(struct dmirror_device *mdevice)
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
index c42e57a6a71e..77f81e6314eb 100644
--- a/lib/test_hmm_uapi.h
+++ b/lib/test_hmm_uapi.h
@@ -67,6 +67,7 @@ enum {
 enum {
 	/* 0 is reserved to catch uninitialized type fields */
 	HMM_DMIRROR_MEMORY_DEVICE_PRIVATE = 1,
+	HMM_DMIRROR_MEMORY_DEVICE_COHERENT,
 };
 
 #endif /* _LIB_TEST_HMM_UAPI_H */
-- 
2.32.0

