Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63ECD55BCAB
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 02:16:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B7810E800;
	Tue, 28 Jun 2022 00:15:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2069.outbound.protection.outlook.com [40.107.100.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F8C010E678;
 Tue, 28 Jun 2022 00:15:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CQBoNlNOEbv562ppiTOUc5ziJc9wKlw7zOfWD2aYhQB2kd0SOw8lSEfa/OQU/Q1rYwriCt0B9srw7vk3EJg1geYHx0oGxS+iIHs15IPLH1rE6ParXJUcyjF+GfDX9f0g09ChqwQXzOitvbSHcXnsNSMJr8TWvLf3wq8WtTov/9qhiQuweEhDfS5H09kQEYRB5M4DpbO1L97vBq1xUSpiuiSUqjgaoWbJwbX93IYsIfAKKx7dT7+s7QR7aFql1TTzdiXeEIpbiaiyVcAUS5zLf4jemU9+5JpqV6CR3kZWhkEDUmu30mydB1yLaR61EtIT7QCZ89306kctCxOI+4n7eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Gq5krbSDZgVmQmlPCe18YVS7UIhP8NZXgBaLYb/5yI=;
 b=DA6BCuaRtkF8NYh5oPiHmGcUWTiF0tRsxobKYVxm5Jizf/HiOdXro89G2Ke9JV5l2Bf967NDFVksdQw9SYnzct3hw9P5fA7hItdGU+ODNhEd9ys1akFcki0hRc1gbKuNgjRqDSDRj3/iBHnRxrrSXWtB13nITYDrU2oaQ0/hhiM65vGpQtkLKH37e258BDyjU+szrl+cGzqUk86q17pRSBKnrFdcLWzWo5fwevtcUWfG58/OTXLex7ICU8g99GF5zjPMir6iKndsV7K1tkVC9O/faO6mUc7yxvmTkIy4XW7i7kzGwFeNQrw6qOZ+lJD8dNlweBwF2dPx6hU0ncDsgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Gq5krbSDZgVmQmlPCe18YVS7UIhP8NZXgBaLYb/5yI=;
 b=2NTeppBeiOqRZNUx3VdUT5FXcIXb459R0UKQyX0gXTqWSVpYvfCKr2VufNkGoSUO9y3wf0SnKsQld4kUYN2tn/gm1DYLwszwoXYFlaqRtweYGZ6NyGit94Ve+AKOl3cEA8KhJFWXVwYZqqdZrBJVeXkoba6pgmIysBfZ8n+Fm6A=
Received: from MW4PR03CA0175.namprd03.prod.outlook.com (2603:10b6:303:8d::30)
 by CH2PR12MB3669.namprd12.prod.outlook.com (2603:10b6:610:27::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Tue, 28 Jun
 2022 00:15:27 +0000
Received: from CO1NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8d:cafe::16) by MW4PR03CA0175.outlook.office365.com
 (2603:10b6:303:8d::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17 via Frontend
 Transport; Tue, 28 Jun 2022 00:15:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT057.mail.protection.outlook.com (10.13.174.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Tue, 28 Jun 2022 00:15:27 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 27 Jun
 2022 19:15:25 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v6 09/14] lib: test_hmm add module param for zone device type
Date: Mon, 27 Jun 2022 19:14:49 -0500
Message-ID: <20220628001454.3503-10-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220628001454.3503-1-alex.sierra@amd.com>
References: <20220628001454.3503-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 785ac2d5-9c84-4c95-0466-08da589b4db5
X-MS-TrafficTypeDiagnostic: CH2PR12MB3669:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DMPK10uccKv4VA3wDYXBsCn+dE2zZs9JaXLG8zUsl+gDxlFsnkDP2Mip09vF+N+lMEa56wgplLUO7BaikDcfTeoVVIPSFO0g2cQtEFkuBpVWafOBHmTvXD2r+D2X8xFQ0ft/9CSB1GlXZ8dvzB5/FJG6o8J2foxuglCoEGWuriroRVzA62K9ijVPwVPW0z5GNEXIJcFctvUzDBky2j8E/Kr8Ft2Dq8YX6IOW//Bmw/PYCzyIFAHjeRVdh5EjCLYyr84VHyfg4i9BLESDbvf4eToO67tmGVDS77/8Mw4QY+eBsvLF/6CBBv46S+IVuMlTv/xnZhDHzMOj6fxb0oFU6nQIyy3Mgm3SbrvGOEIQiNVixJp62r1/v+FrMs248sK1wQkvIDVWU7RpUWSyLzIBOG9MC8X9MCnxKcOVu9/ZH3YCGg7tYVd2Xra16YvhxupJiY4BnjHMnVLqGJ6gPqO2Q6KnLV895WDhBMxf/P9gdh15tbNQVl+An+WkDLc6WqPrhpzgpJvZdhTJ5mwM8ZlHZXbrEdzvUTDWhNzT3ie0TlGC/W4RxEX/BaroWhMHg7JIfKMdaS/auf41sWWV9UnymhNjXrRHBNQHUkLdztk04m+BXLmtUkn0sK4x61pIknYvUGejQTt9ldJz1mg0RuNLaTUmGRgl6ATwOzoMimZBAMx2i9ERjBa2GgRZpvKmAkOP9O0jDJ/M9+XzMWrRGojPRRVSQyvM1xbPUzUHyhoJALRsjIv/2C62tduCNrEzFbm4q4qAB+9Y9e6/J5cvetVUIhIH19ypOS5ZjocZ91m40+xfvqHatYXGyqBpZgCCl4JLbexGQVAOUzhm6RCa5mxlZw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(376002)(396003)(136003)(346002)(36840700001)(40470700004)(46966006)(4326008)(8676002)(82740400003)(316002)(356005)(70586007)(1076003)(70206006)(6666004)(36756003)(54906003)(82310400005)(186003)(36860700001)(40460700003)(16526019)(2616005)(40480700001)(83380400001)(47076005)(7696005)(426003)(2906002)(44832011)(41300700001)(7416002)(336012)(86362001)(8936002)(26005)(6916009)(478600001)(81166007)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 00:15:27.1355 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 785ac2d5-9c84-4c95-0466-08da589b4db5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3669
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

