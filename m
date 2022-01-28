Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C06364A0198
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 21:09:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FFA410E31E;
	Fri, 28 Jan 2022 20:09:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2062.outbound.protection.outlook.com [40.107.96.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F4DE10E2C4;
 Fri, 28 Jan 2022 20:09:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B4DxPg/Yoxj9e37hCqXzX6N3S9z/lWWQrsg6kOZjKzZ/0xerDynakTZdBDznjkY4JEdzdIZgFDqu/U7x3dFvVXGaG4uiS8+EZaoLAE4TTWAvigd9ilk1TBd6t1focQeqoNOwhLbAdK4ziCWUSUaf6XAwQ8sydUWYktYoVObNNy5Im3jlq7Sq8VQeIFgDETbTEdMh/4XznHDbeJS6YfCQw54bLLOKroizzf/vX3BAWWTH0YaiWPVCd24uNRHj7JxvXypvnftVOP5yNTFpHmvoBGRLnLvM+SkiNT3xArSiFrkEnyA48zlyhDMNa5H17L00UtupXBAv5Z4g3/u6E9jTHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hIkRxjdiMCIarckjXFr9wmIp2NOEFYMNIxQxsR44EmA=;
 b=Y5YbZy6fu1WE/IEKaCG2ierrwp+cdp0yKdPF+yz7HEzogbpsMhGjBY4LsAaKYr4JkBxCX6sGxWX1oRnZwTawDS02IfqhTEvw7/Is1g9vOjKvxUtULbTe0C2nb7FqUGZCNLmk2PAe/keJiBGH+OQcuL0eczki9MQAqxRjPqa0as78/5fy37fUjSG9Jgqbp5ZiSZnTNQBjOwwmAcNlD7rS0S6I9keeLAnOVXNstNBhriAy66lY8ZYGKydOAmfNGdTVvGpyNsIxNvHapuVA3fQDY7wM8x1iTKAovvnEszp9KAUxM0Ut9YHIJeEGVB4ZzSK7qgdVvKmfULdScnZHZ4VMeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hIkRxjdiMCIarckjXFr9wmIp2NOEFYMNIxQxsR44EmA=;
 b=yeFdK5t1vSjSxEjAxAU4UCkKT2xrJpc7b5hQpcFC3l0Vujyc6COq1OV+ujbZ1WdJShImKWDHRp2QNUi6CX8XX+jvFwi2OU/Kc+tlM3Tttk0w4+LubNqJmGYUkqipPTdsLv4DPNRHV3dyxxjFv/YEwwTdluLr8M/X1xCUvJU6Eog=
Received: from MWHPR19CA0072.namprd19.prod.outlook.com (2603:10b6:300:94::34)
 by BN6PR1201MB0177.namprd12.prod.outlook.com (2603:10b6:405:4d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Fri, 28 Jan
 2022 20:08:57 +0000
Received: from CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:94:cafe::b2) by MWHPR19CA0072.outlook.office365.com
 (2603:10b6:300:94::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Fri, 28 Jan 2022 20:08:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT022.mail.protection.outlook.com (10.13.175.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Fri, 28 Jan 2022 20:08:56 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 28 Jan
 2022 14:08:54 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
Subject: [PATCH v5 07/10] lib: test_hmm add module param for zone device type
Date: Fri, 28 Jan 2022 14:08:22 -0600
Message-ID: <20220128200825.8623-8-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220128200825.8623-1-alex.sierra@amd.com>
References: <20220128200825.8623-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab238bb0-a1ee-495a-e88f-08d9e29a0409
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0177:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1201MB0177D9C3F9603EA6FB8AA18BFD229@BN6PR1201MB0177.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1wudiaHVQQkucPDKaNPT4yBxbY/CV3aGqvhDMK5/CjaKBpBrIQDyuAqjPv7B296rDZJ84maQvlSNwTIOWXO/8ZvhkRo2Jn5yyVrXjrAT1B5sDG5RSR1oc5mzQzzJnAICA4cDpY2OSlurQTuhhHKRhV4JKEyD1SGvDKUGqC7iMW2+89wps2Jojb6JVell+OrCkhzf8LY+5r3hIZpo9PFmvUGdFd/oPijh0hFXr1cW4F2qCdGDOWYWqwTEADjYuC9SuEDc79vcrQtEi0T/i0yTI9lh26NCH9Svfwby1SQpzIvIZ//E2d7zbRNhzHUHcIcF/8Ry8hDAcFNUC0WhY5/qSvg/UIBx1DbuAvhdB0S+B2n1aUMaw/Mu5XDDOPX6tVh1YJ3x+d8wS/EayfUtliWkZ/dHG5ANJ4Y/06QtLhKNnV68GiG0jUBWZoVDxIUSVzw5qeUWQpfh/eBJUpm2Hm6Q3uxsAJa2bDfU1zN9+JTAKMz1kdr7E5Nel+Pk3ALHX5tXQp+dNncqzpARkt2hLmz9xb1AN7tIBqUQIuhkAZbuXN1b5rwQ4pelNoukCAlanumglGb6vzS/dpMSWW2LrT/qlq9UGULUQB+OKBlhhNh2Bchkhv+l6NP7wigTa0PTOiGvbUj2MDJQl2aYcOxszXNqte+2zz+wGYvLZcGMz1HH7yepDEkXAOfzFuA5+V7Sak/M9Dla0cRTx29nPdx3KdtcbQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(83380400001)(81166007)(44832011)(2906002)(356005)(426003)(336012)(186003)(26005)(16526019)(1076003)(82310400004)(2616005)(316002)(47076005)(6666004)(5660300002)(7696005)(86362001)(70586007)(8676002)(8936002)(4326008)(70206006)(40460700003)(508600001)(54906003)(36860700001)(7416002)(36756003)(110136005)(36900700001)(20210929001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 20:08:56.8360 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab238bb0-a1ee-495a-e88f-08d9e29a0409
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0177
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
Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
Reviewed-by: Alistair Poppple <apopple@nvidia.com>
---
 lib/test_hmm.c      | 73 ++++++++++++++++++++++++++++++++-------------
 lib/test_hmm_uapi.h |  1 +
 2 files changed, 53 insertions(+), 21 deletions(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 556bd80ce22e..c7f8d00e7b95 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -34,6 +34,16 @@
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
@@ -452,28 +462,44 @@ static int dmirror_write(struct dmirror *dmirror, struct hmm_dmirror_cmd *cmd)
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
@@ -494,10 +520,14 @@ static bool dmirror_allocate_chunk(struct dmirror_device *mdevice,
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
@@ -526,15 +556,17 @@ static bool dmirror_allocate_chunk(struct dmirror_device *mdevice,
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
@@ -559,7 +591,7 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
 		spin_unlock(&mdevice->lock);
 	} else {
 		spin_unlock(&mdevice->lock);
-		if (!dmirror_allocate_chunk(mdevice, &dpage))
+		if (dmirror_allocate_chunk(mdevice, &dpage))
 			goto error;
 	}
 
@@ -1242,10 +1274,8 @@ static int dmirror_device_init(struct dmirror_device *mdevice, int id)
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
@@ -1258,8 +1288,9 @@ static void dmirror_device_remove(struct dmirror_device *mdevice)
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
index 17f842f1aa02..625f3690d086 100644
--- a/lib/test_hmm_uapi.h
+++ b/lib/test_hmm_uapi.h
@@ -68,6 +68,7 @@ enum {
 enum {
 	/* 0 is reserved to catch uninitialized type fields */
 	HMM_DMIRROR_MEMORY_DEVICE_PRIVATE = 1,
+	HMM_DMIRROR_MEMORY_DEVICE_COHERENT,
 };
 
 #endif /* _LIB_TEST_HMM_UAPI_H */
-- 
2.32.0

