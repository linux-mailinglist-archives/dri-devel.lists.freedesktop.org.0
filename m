Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0100D37BFFC
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 16:27:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98F6B6E804;
	Wed, 12 May 2021 14:27:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2060.outbound.protection.outlook.com [40.107.102.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1D336EC05;
 Wed, 12 May 2021 14:27:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ieHFv+rfK5AZWoqRmsGIjaFM21mm9Vu8QHpZYyVTFKKA2+54P0DSg7gj0nh/rDAsB6lENp8qh30LTdG5wlFzqn1vlrtN2Wozsx1TFiSbxqh75z+wmxB0QQDAy04SGROJBxEMhyQkWR1v5XGiCib8Wg/vvjAaID7vOHd5WAeyz6haAUpCX4ka1la79CZ9Y88/opB3BcfWFJV4GJBK1bMQSmO6iwNJ8zD3rWrD5SDYykpy3ZMTmGnp0+LWhn/+Zqyb43c8nTBG6E4JUGFzqRrAKl5az7Lfiq/+GvNSzzsfR9rjptu5xFh73aKlFtEUKMJlkg9sHJSlvOawMzWwwaX9Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0dwKENLsURuCDAMt3HBqU82krOzXD1UOWvf5Glanbw=;
 b=etNqqK5Zeqn/2NXyt8h/QTwxNmpEQdzIzBodmKv915DQAGxLJ8HQsw7RuWOMQnYXcV48lqyACK5X3jn50BzTYbS5M99wvwA+jpWTRUy31EB601WNCX3k4zGFVmM6M7LA9ncjFGkmD+SUqd2eGG6TZFAbbkkK80yrACvOfn7sZuN+R3vHgo3Xgre0JFjwNVbhXwO1vSGDgw9yEx6xdBQm+w76XIJwBRSpEqSnHvmxMy+erEML/pVPIosRzGr5Jd88Le6U6fEDQ83EWv+CvcEicOJnwV3sDoRAww9D6ak6gp3jEMsN900eBTlXkts4KS12BEloBiwPf+KHD8Qq25tCAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0dwKENLsURuCDAMt3HBqU82krOzXD1UOWvf5Glanbw=;
 b=XS1cqmMkuvrEafch1LlsiNBGe1KCXxbdUMskhu37LBDb57Lf/tnOXpM3L8CoNbysAtM+MRE2ntngHEirsu7ZO/Z5bplpYHPS3tOLKL0fwzt+TutvHNZFwmHTa3hDXuoi48pZysSblWEC84ypNvYOGdYQNFqU2G5C/o37n/9ywBw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4576.namprd12.prod.outlook.com (2603:10b6:806:93::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.27; Wed, 12 May
 2021 14:27:19 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4129.026; Wed, 12 May 2021
 14:27:19 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v7 05/16] drm/amdgpu: Handle IOMMU enabled case.
Date: Wed, 12 May 2021 10:26:37 -0400
Message-Id: <20210512142648.666476-6-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
References: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2607:fea8:3edf:49b0:7576:4f76:97d8:1487]
X-ClientProxiedBy: YTOPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::45) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:7576:4f76:97d8:1487) by
 YTOPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.30 via Frontend
 Transport; Wed, 12 May 2021 14:27:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 768fc8e9-dd41-4618-e0d4-08d915520c78
X-MS-TrafficTypeDiagnostic: SA0PR12MB4576:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB45765BA08DB34AF399C933ECEA529@SA0PR12MB4576.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FR6rPtghGwM3J/XyYqrsIWf99XEkkziKNH+qJJNwfpZD+ba6jiOPrbSFNWXDo7ad4l+7pEpucLUZTCcLmLNS2IOqlZAtBFDn+iaR97tlyiUJGtNhvvK7Zv/qomDYUCLOX39Xhh+xYFSyDNzkQ3qb/mY3FwVI43hm4S2tQITxg4SmHUg5zBRN+27yR/CvkvjUc+n8grF1os4lAMiH8cisCP+XIupG/5q2jy9/mKrwC1tXNPFn8To2wpaVNjP38jRdDYdq6n//xCfMMghYu89/mi9fN/1teC/Y1b6nplbnAczwvzIP/c4EeFMpqSZwbIJLzfqGmMCfl1zp6iVUyMobjw0+a1sN3dwIOYqOu3rTRXDOuJga+BRHpoAwagPxKGGc4kIlmzReFBsBLUSEWpHPgimTOwVWlk7Hgg7ueEBIwzrGNmKtCwIm9lzmGxNOYkenYB3zuzi73D6ixQlTiHXUkzXbdq1f/hOSAdMQGmTJoKxANaduX3JJRRJu9+w3I21dBDKvoNpRGXLNRw6LzY6wKFrnO9QjHeoxbZHIAP5B4Ul0iffOqCyLU6lqiCieTffproW9JnZ8+jAVleDz4HfFfTMPj4L0dOyKnp9/CNiwNyY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(366004)(346002)(396003)(136003)(38100700002)(5660300002)(1076003)(6666004)(186003)(316002)(16526019)(8676002)(83380400001)(66476007)(2906002)(6636002)(86362001)(30864003)(52116002)(36756003)(2616005)(66946007)(66556008)(8936002)(6512007)(6506007)(44832011)(478600001)(4326008)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?N3qV0GEhJxKNAaEmxbJpQJURRDDa8KIIA5qdLMWfSpC+KV9CSptgfQTu+96Z?=
 =?us-ascii?Q?a7dxCr47PTJPLUqryDooCn1TKGHB2tR6ZXA1EpZDkPJwT0hLOaC91XS1ioQd?=
 =?us-ascii?Q?q7pH2AeYz3AazW5iB/Igu9P1fhYLIcX0P4jVTUfyB6dYGjNMj5TfJdJmYKWB?=
 =?us-ascii?Q?pC9LQD2C/qgZl6LSJpcvA/4mZPHi4GZZjFBubMoHRxTW0DFwhEf7/FGlldHM?=
 =?us-ascii?Q?Tll7Rcvgt+DiRBVPNJH1SxAQIu0VJ1QpL+SBYGlfZ0uLS3WkSDgdWyNYnK1N?=
 =?us-ascii?Q?P6QY6buyPiGyCGq7MhHQV3SS0GBuCiqzuHcOCFsvZbnHjgoVjlKywvK05IlO?=
 =?us-ascii?Q?GhSGVSkArnaj8hrGC07zzE9Izx0tdhPQjM5F0/Src+c45zj6v4lVxvTKgthq?=
 =?us-ascii?Q?sBK8wr/FfuhJdXnxB0O3920jUw7vwSc/Pdzwjc/oNNHtU1rIYZ0JenHVHWfG?=
 =?us-ascii?Q?2o9twgOiyV0AKKnerI0DCHEV4XYpEpPUYosS1dks+GDWeZ1ueUZcB3CE08Ni?=
 =?us-ascii?Q?pAo6gHK2LPwosNQB/NUOm2vRq2Qp3O3A5NQG0klNQBqBZHD4AhfRqijgfIvr?=
 =?us-ascii?Q?nV9Sh7g0UxWeZt5Dhsvt2l96XiF/I41y+moWmb2tbjhCyrdBR//hA6k6zhCH?=
 =?us-ascii?Q?wRCRO8EskkEiTcFo8nayo66WESXAMSgD09FyUFruDYuqjQ9Ywaogo+aymDRa?=
 =?us-ascii?Q?sUjkLJGLMeHxfWNfwJAcOPY/EG21kJA2xGlKxVJnCgi8ZW1F57/yMpR4aTJB?=
 =?us-ascii?Q?10MTlGPxDd7yVVg+yy+TDLSRE+9pek5Akdtu9L3PMaPrPws7z4YkjrH5RYJt?=
 =?us-ascii?Q?PGUQxABowdjoKxkBulD7u+NCi/YKHG2RU6H84fQpqhwlgC58Nv4lM0hUzqfi?=
 =?us-ascii?Q?cSeqbGXC0aha4F5h8+FngyzYqNldKU74B/NaOQ6jpxIyQNp7DOmFKlwdkeGu?=
 =?us-ascii?Q?u0nuU5XxucfNjk5xzIxj4Y746c59NazL6zwAd7tpJh3jCcbzJQZHyq9lfn2y?=
 =?us-ascii?Q?8C1oSE9lP2W8FEnnXqSDioNjlxF4s3nOW3chelnW4njjATWZcr0hqIo7JYYP?=
 =?us-ascii?Q?76k4XTqFejWbLJphfF6I5U+2pBNsImT028lk9PbaEUyCLYIrofgxegwc2PSQ?=
 =?us-ascii?Q?zjptdQ42BmEkOkg2TQ5yBRC75M92+RXeCPt1zPCCxur7lwBVn2S0zQWlsN6i?=
 =?us-ascii?Q?qzHYXl/2tBDX+e4FgytgmtiwM1jfFEgGj5FJ2bl3TGzxrHXpXjnzmpa0vKuw?=
 =?us-ascii?Q?RoHpm5Z+A+cxb6j5xh0k8AwNokhUzKvgqv42XW0t/zoOhko+N78uZcEnQ2gz?=
 =?us-ascii?Q?8wPNksSn7YhTTYNjkPMwOvcqod+13l1LiRB97MY7kYcQKjYv16LXxzubntjn?=
 =?us-ascii?Q?EJpugY9q+FCggFE9PGTWFQJTq213?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 768fc8e9-dd41-4618-e0d4-08d915520c78
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2021 14:27:19.2834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qc2zuFjldOwwMW2isi6YVIvxnIcTurPbWXuQX6CGA7vVPxuYJ4Vd4FHjFoVrAWn6YMXoMYBnRkObz4C7LEvEhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4576
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
Cc: gregkh@linuxfoundation.org, Felix.Kuehling@amd.com, helgaas@kernel.org,
 Alexander.Deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Handle all DMA IOMMU gropup related dependencies before the
group is removed.

v5: Drop IOMMU notifier and switch to lockless call to ttm_tt_unpopulate
v6: Drop the BO unamp list
v7:
Drop amdgpu_gart_fini
In amdgpu_ih_ring_fini do uncinditional  check (!ih->ring)
to avoid freeing uniniitalized rings.
Call amdgpu_ih_ring_fini unconditionally.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c   | 14 +-------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h   |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c     |  6 ++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c    |  5 +++++
 drivers/gpu/drm/amd/amdgpu/cik_ih.c        |  1 -
 drivers/gpu/drm/amd/amdgpu/cz_ih.c         |  1 -
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c     |  1 -
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c      |  1 -
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c      |  1 -
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c      |  1 -
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c      |  1 -
 drivers/gpu/drm/amd/amdgpu/iceland_ih.c    |  1 -
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c     |  4 ----
 drivers/gpu/drm/amd/amdgpu/si_ih.c         |  1 -
 drivers/gpu/drm/amd/amdgpu/tonga_ih.c      |  1 -
 drivers/gpu/drm/amd/amdgpu/vega10_ih.c     |  4 ----
 drivers/gpu/drm/amd/amdgpu/vega20_ih.c     |  4 ----
 18 files changed, 13 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 18598eda18f6..a0bff4713672 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3256,7 +3256,6 @@ static const struct attribute *amdgpu_dev_attributes[] = {
 	NULL
 };
 
-
 /**
  * amdgpu_device_init - initialize the driver
  *
@@ -3698,12 +3697,13 @@ void amdgpu_device_fini_hw(struct amdgpu_device *adev)
 		amdgpu_ucode_sysfs_fini(adev);
 	sysfs_remove_files(&adev->dev->kobj, amdgpu_dev_attributes);
 
-
 	amdgpu_fbdev_fini(adev);
 
 	amdgpu_irq_fini_hw(adev);
 
 	amdgpu_device_ip_fini_early(adev);
+
+	amdgpu_gart_dummy_page_fini(adev);
 }
 
 void amdgpu_device_fini_sw(struct amdgpu_device *adev)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
index c5a9a4fb10d2..6460cf723f0a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
@@ -92,7 +92,7 @@ static int amdgpu_gart_dummy_page_init(struct amdgpu_device *adev)
  *
  * Frees the dummy page used by the driver (all asics).
  */
-static void amdgpu_gart_dummy_page_fini(struct amdgpu_device *adev)
+void amdgpu_gart_dummy_page_fini(struct amdgpu_device *adev)
 {
 	if (!adev->dummy_page_addr)
 		return;
@@ -365,15 +365,3 @@ int amdgpu_gart_init(struct amdgpu_device *adev)
 
 	return 0;
 }
-
-/**
- * amdgpu_gart_fini - tear down the driver info for managing the gart
- *
- * @adev: amdgpu_device pointer
- *
- * Tear down the gart driver info and free the dummy page (all asics).
- */
-void amdgpu_gart_fini(struct amdgpu_device *adev)
-{
-	amdgpu_gart_dummy_page_fini(adev);
-}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
index a25fe97b0196..030b9d4c736a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
@@ -57,7 +57,7 @@ void amdgpu_gart_table_vram_free(struct amdgpu_device *adev);
 int amdgpu_gart_table_vram_pin(struct amdgpu_device *adev);
 void amdgpu_gart_table_vram_unpin(struct amdgpu_device *adev);
 int amdgpu_gart_init(struct amdgpu_device *adev);
-void amdgpu_gart_fini(struct amdgpu_device *adev);
+void amdgpu_gart_dummy_page_fini(struct amdgpu_device *adev);
 int amdgpu_gart_unbind(struct amdgpu_device *adev, uint64_t offset,
 		       int pages);
 int amdgpu_gart_map(struct amdgpu_device *adev, uint64_t offset,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c
index faaa6aa2faaf..433469ace6f4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c
@@ -115,9 +115,11 @@ int amdgpu_ih_ring_init(struct amdgpu_device *adev, struct amdgpu_ih_ring *ih,
  */
 void amdgpu_ih_ring_fini(struct amdgpu_device *adev, struct amdgpu_ih_ring *ih)
 {
+
+	if (!ih->ring)
+		return;
+
 	if (ih->use_bus_addr) {
-		if (!ih->ring)
-			return;
 
 		/* add 8 bytes for the rptr/wptr shadows and
 		 * add them to the end of the ring allocation.
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
index 233b64dab94b..32ce0e679dc7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
@@ -361,6 +361,11 @@ void amdgpu_irq_fini_hw(struct amdgpu_device *adev)
 		if (!amdgpu_device_has_dc_support(adev))
 			flush_work(&adev->hotplug_work);
 	}
+
+	amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
+	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
+	amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
+	amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/cik_ih.c b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
index 183d44a6583c..df385ffc9768 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
@@ -310,7 +310,6 @@ static int cik_ih_sw_fini(void *handle)
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
 	amdgpu_irq_fini_sw(adev);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
 	amdgpu_irq_remove_domain(adev);
 
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/cz_ih.c b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
index d32743949003..b8c47e0cf37a 100644
--- a/drivers/gpu/drm/amd/amdgpu/cz_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
@@ -302,7 +302,6 @@ static int cz_ih_sw_fini(void *handle)
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
 	amdgpu_irq_fini_sw(adev);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
 	amdgpu_irq_remove_domain(adev);
 
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
index 2bfd620576f2..5e8bfcdd422e 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
@@ -954,7 +954,6 @@ static int gmc_v10_0_sw_init(void *handle)
 static void gmc_v10_0_gart_fini(struct amdgpu_device *adev)
 {
 	amdgpu_gart_table_vram_free(adev);
-	amdgpu_gart_fini(adev);
 }
 
 static int gmc_v10_0_sw_fini(void *handle)
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
index 405d6ad09022..0e81e03e9b49 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
@@ -898,7 +898,6 @@ static int gmc_v6_0_sw_fini(void *handle)
 	amdgpu_vm_manager_fini(adev);
 	amdgpu_gart_table_vram_free(adev);
 	amdgpu_bo_fini(adev);
-	amdgpu_gart_fini(adev);
 	release_firmware(adev->gmc.fw);
 	adev->gmc.fw = NULL;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
index 210ada2289ec..0795ea736573 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
@@ -1085,7 +1085,6 @@ static int gmc_v7_0_sw_fini(void *handle)
 	kfree(adev->gmc.vm_fault_info);
 	amdgpu_gart_table_vram_free(adev);
 	amdgpu_bo_fini(adev);
-	amdgpu_gart_fini(adev);
 	release_firmware(adev->gmc.fw);
 	adev->gmc.fw = NULL;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
index c1bd190841f8..dbf2e5472069 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
@@ -1194,7 +1194,6 @@ static int gmc_v8_0_sw_fini(void *handle)
 	kfree(adev->gmc.vm_fault_info);
 	amdgpu_gart_table_vram_free(adev);
 	amdgpu_bo_fini(adev);
-	amdgpu_gart_fini(adev);
 	release_firmware(adev->gmc.fw);
 	adev->gmc.fw = NULL;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
index c82d82da2c73..5ed0adae05cf 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
@@ -1601,7 +1601,6 @@ static int gmc_v9_0_sw_fini(void *handle)
 	amdgpu_gart_table_vram_free(adev);
 	amdgpu_bo_unref(&adev->gmc.pdb0_bo);
 	amdgpu_bo_fini(adev);
-	amdgpu_gart_fini(adev);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
index da96c6013477..ddfe4eaeea05 100644
--- a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
@@ -301,7 +301,6 @@ static int iceland_ih_sw_fini(void *handle)
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
 	amdgpu_irq_fini_sw(adev);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
 	amdgpu_irq_remove_domain(adev);
 
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
index 5eea4550b856..941d464a2b47 100644
--- a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
@@ -570,10 +570,6 @@ static int navi10_ih_sw_fini(void *handle)
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
 	amdgpu_irq_fini_sw(adev);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/si_ih.c b/drivers/gpu/drm/amd/amdgpu/si_ih.c
index 751307f3252c..9a24f17a5750 100644
--- a/drivers/gpu/drm/amd/amdgpu/si_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/si_ih.c
@@ -176,7 +176,6 @@ static int si_ih_sw_fini(void *handle)
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
 	amdgpu_irq_fini_sw(adev);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
index 973d80ec7f6c..b08905d1c00f 100644
--- a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
@@ -313,7 +313,6 @@ static int tonga_ih_sw_fini(void *handle)
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
 	amdgpu_irq_fini_sw(adev);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
 	amdgpu_irq_remove_domain(adev);
 
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
index dead9c2fbd4c..32ec4b8e806a 100644
--- a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
@@ -514,10 +514,6 @@ static int vega10_ih_sw_fini(void *handle)
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
 	amdgpu_irq_fini_sw(adev);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/vega20_ih.c b/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
index 58993ae1fe11..f51dfc38ac65 100644
--- a/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
@@ -566,10 +566,6 @@ static int vega20_ih_sw_fini(void *handle)
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
 	amdgpu_irq_fini_sw(adev);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
 
 	return 0;
 }
-- 
2.25.1

