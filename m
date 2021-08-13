Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A35A33EB02E
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 08:32:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92E696E508;
	Fri, 13 Aug 2021 06:32:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2051.outbound.protection.outlook.com [40.107.220.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 395716E4E3;
 Fri, 13 Aug 2021 06:32:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kdq/7hh996NUYmjU+DIwV9AwdY8A0QX1rAX7P7QSdlJDs2HOFaNXYeWMEqylLduG9HtDXrpyxL54jmI91oLF7potepRViFqPuix/2haaDW+6k4DmvUnHxvTFDdkEp2wWAxmZfm7S0A/cFHevy0mFnvpjkkd8LXXzuvf/mp2cjvBjyVYxbg5OpP97ugRe/EKzcYrfz5VACzV2+zpaOWPs177B2pakxc/NhY55XPLfRQ59rsw+pDV4XAZCkbMFUHk7aIwSNSKlvIlR4k+68we2HiOPNZARDAVGTjnf+F4dEP9npejmPrUapkW/QB6kJQqrkmxSdLL6IA4wcNmDFk1KHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JsBEIybxLlWQ1DvvPR9uO9H1ffiY515x5QP2dx6aNZI=;
 b=IkmUV+jFm6EvaOZUXH594FrlKrOtc5iejyBc87H335kPRVtSwtUIwoVD4c6typOaKF67i4GP3ildiYkWHmdC8iMwSPGC4vqkYZ7LXclDpueD7T6zm4tOpXAT9whPp8CNCmZ/JlV4lBN6/IRHKgf1RzNVJK2x7An4IR4CuSNUVUz/Kve1iS7FipUpLohJyICV7PPJmH6U898ldkTMqNQ9RGhv8+GxjxjWPW0LgJjP2K5+L6xLMC8UcRZlOPVrBAA0aajlXJVN1KXBkNEssICPDMUemdF4sTL7KnMk9oGjXiNOSdjQ5EUDnvNRdFBk7ZbhqWkXyR/12pQMxCEeJuBrCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JsBEIybxLlWQ1DvvPR9uO9H1ffiY515x5QP2dx6aNZI=;
 b=Aff3Km2+yPEv8lQyBgURpfX0gY84b6jq7Dv4VTZRCOMvXs1brNNfVebm2b4rr911EHj81YxF9BbTCa7GhEWMVziJ77pUhv5o7cFbNXwCtpNLxgVFH+xoBiX2DoPomM4avQkFgNjimh2sRa6S0XeLklcZlkLz5r6t/wMJaW6X5+M=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN6PR12MB2782.namprd12.prod.outlook.com (2603:10b6:805:73::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Fri, 13 Aug
 2021 06:32:10 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb%5]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 06:32:10 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v6 10/13] lib: test_hmm add module param for zone device type
Date: Fri, 13 Aug 2021 01:31:47 -0500
Message-Id: <20210813063150.2938-11-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210813063150.2938-1-alex.sierra@amd.com>
References: <20210813063150.2938-1-alex.sierra@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR18CA0026.namprd18.prod.outlook.com
 (2603:10b6:806:f3::18) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SN7PR18CA0026.namprd18.prod.outlook.com (2603:10b6:806:f3::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.17 via Frontend Transport; Fri, 13 Aug 2021 06:32:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d37b7bb-2d1d-43bf-74f2-08d95e24140d
X-MS-TrafficTypeDiagnostic: SN6PR12MB2782:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB278287D76F3F1D6C8ED2F883FDFA9@SN6PR12MB2782.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZAGYzmakKvvJk2m3v8GkmMj9aifzCiTHgLxu+/w1olG6eI5wK2+O5N+49sNwuH5mG3vGxg4/r9dQdqoKKlQxzsDNxdQIomEfhVblFsrgX1VZhCtSpp3pZInZMAY6o5X+QMrIo2rrz7gLGv6Mchc+M8Fgr/R0du7eB41HvqfFX1M5rouxPFwHDsFgwzQmaZGgIfEcl8dfSFd40ZpUN/uonf+kdw4xtPYVOFSDoOyk+lF9o/sCSxXsVueyy9deN9oOnHPJWIUeV7I7fiCXI378FIkly3EGIUsb6pSb0sMkNgfl1S1U481XFV9jFEwHnMKHYJRlGKgsRfW03AdPUIoEw6AOme1p6G0QLCu/2bK878k5hgB/VJww6xVb2PWC7APbNhm3a8c4T4tXXOoRb4YqJ8txNSG5kSygCaLC85TKreVU9LBeAQAIag37CJ5JP9GrShRD7+1kreBpjb4RTb5164vcrU0vcaQWr7uMqTKf0ql8Kpvudqnf6hZD+3D+v+TrMu9BwCxcsHydteGQDVhDYS6WuivpOP/emD6dl+kSwYVa7DIfR3Ve8zVnoRRh5HIrp6oLcP722MCgaPlpEPWYFKWASmFJ5FZJfZCO1S9cZHHK+P69Z0k/nq1jG4xyRCttWtwJjgLegpPHD68JHs1utvMQZ47LpPBtxzGb2Y16yexRk/hlPr/QAFfekPboWB798sy6g/NI09IF4lkg4AosKQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(316002)(2616005)(956004)(7416002)(38350700002)(7696005)(38100700002)(66946007)(66556008)(4326008)(52116002)(36756003)(6666004)(66476007)(1076003)(8936002)(5660300002)(83380400001)(44832011)(2906002)(478600001)(26005)(6486002)(186003)(8676002)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wnDOf6PA8Kd4Y6Nx/ouIhCZkKUjds6ONup73Mw2PI1TpIrYUZ4K0XKL9FdQq?=
 =?us-ascii?Q?PI71gRCMH2EUHtRcmR11tOJltTHyOCSDYjFooo8k80cZTwbPBzEBweFaMp4R?=
 =?us-ascii?Q?tdEXHqlekjsAunLk+k2akiRq/Hfgn7a+4VY2fuTpL2BZ92tT86Dxo+fBUiTm?=
 =?us-ascii?Q?FetoW02f6X5FrGT1N8+Pg0/zKE5RHxWGYdiQNzcUWo4AwoOBKSuKQquxOs30?=
 =?us-ascii?Q?O4eBnyW7wwbiHWb8LwOpasoMmpE78w1DZksRAXyqddi/EMHTKFEz2qYTLUFk?=
 =?us-ascii?Q?wRjZszQ16eCGOkh5q7nS3Xg7eZKRGRJOoJ5Ie5deY3ZGev1xdW+9+uA8105U?=
 =?us-ascii?Q?LNwUW59Fs5a3QMeBhdYwKX9/G90sgnJcNGPYJGos5NFEtcYA+LY48LnsD1Vx?=
 =?us-ascii?Q?4zgohdMOoS7Dm7OA++IFcjMbviLNg68ThXKSB7cyJrUira14NqTRG4x8iqje?=
 =?us-ascii?Q?STNj+l4EMtS9TuthEalf5VsLdReCqMZRrGbLrwDqfrkY8c8QU4l22DAzry9A?=
 =?us-ascii?Q?2cAcayezOdcyMiefIQgKkdT7OhO7SW+CfG6HDrR5mByKNVPyPgu+udBYyedz?=
 =?us-ascii?Q?GBnpN8ctRXoIZZjYLHD9+8l6AXpcP8udU9x+z94IXVSCbTZXvTkbJ5qyoSFI?=
 =?us-ascii?Q?MvoEOQQoTqjUkIVZvHMnQJQRUat/37Cg6kEemPwuZ4jn+oc45eReEQ9FN9r2?=
 =?us-ascii?Q?1WndRcvdSJmczD8WYCmuMhL7zqX3vdaOhNVQC0FcvPqTuTabAiG4BHDK3vxj?=
 =?us-ascii?Q?v/MSdwwP70hEFK7npLB+jUddYQHFdvg4Me96YiulhHzJsEOL9llZz4jnxfjc?=
 =?us-ascii?Q?t2+SibpISQxJH8Hpwm1lM1ghY+GtffkFyvhn0P9W7I9jKy+whamWHqwE5ebc?=
 =?us-ascii?Q?oQ0Q961LSxl3zcu9azBpvzTXCKBzQyjwfpelC4uJcEmnH484x1p95urtQhkg?=
 =?us-ascii?Q?hDSzqHh9UM6x07uPKUCa7Omxuzn1AIQLTi9Uq76214EYSEPRttK/1izvNSAi?=
 =?us-ascii?Q?bkF/G+DzyMwHPwGuKGMhErdHXpVgUYgV9XHxeHB3dWZcr9nf5W3zYGKFJ/F1?=
 =?us-ascii?Q?i3Zm4PxKAyaGDsD1O4UajQMNltmgdMsmk6hKezob+X0CK/L19LP4tfOI3NQA?=
 =?us-ascii?Q?UjkUhRQfKf6ogwJyvifmm4IocWBd/EZQiX1MFI/BsZ3JFtsvioh2/Pi7ZyR6?=
 =?us-ascii?Q?BankQlOHHd47DuzYAq5rlyyaUQyxprGktoW/i4Lp7teXPl8rzYB68IVcNKHQ?=
 =?us-ascii?Q?SK9YBD6KOXzfDdxVPJlu1uQRcH6SuBNSpHorJ5zP9jpPSaphXgxOa42DpjJw?=
 =?us-ascii?Q?IcDCyzsmzzT6Um27rgORkP6x?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d37b7bb-2d1d-43bf-74f2-08d95e24140d
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 06:32:09.9339 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3g/BXQhqIqEXqZSBmnSZVI8/WZv3RNJp8djrJB+Ml7/ZGsLI+/GsLz8843NDjFL88G3+CI/g73+5EP/oAYyXEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2782
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

In order to configure device generic in test_hmm, two
module parameters should be passed, which correspon to the
SP start address of each device (2) spm_addr_dev0 &
spm_addr_dev1. If no parameters are passed, private device
type is configured.

v5:
Remove devmem->pagemap.type = MEMORY_DEVICE_PRIVATE at
dmirror_allocate_chunk that was forcing to configure pagemap.type
to MEMORY_DEVICE_PRIVATE

v6:
Check for null pointers for resource and memremap references
at dmirror_allocate_chunk

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 lib/test_hmm.c      | 56 ++++++++++++++++++++++++++++++++-------------
 lib/test_hmm_uapi.h |  1 +
 2 files changed, 41 insertions(+), 16 deletions(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 3cd91ca31dd7..b4f885c6c6ae 100644
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
@@ -462,15 +472,26 @@ static bool dmirror_allocate_chunk(struct dmirror_device *mdevice,
 
 	devmem = kzalloc(sizeof(*devmem), GFP_KERNEL);
 	if (!devmem)
-		return false;
+		return -ENOMEM;
+
+	if (!spm_addr_dev0 && !spm_addr_dev1) {
+		res = request_free_mem_region(&iomem_resource, DEVMEM_CHUNK_SIZE,
+					      "hmm_dmirror");
+		devmem->pagemap.type = MEMORY_DEVICE_PRIVATE;
+		mdevice->zone_device_type = HMM_DMIRROR_MEMORY_DEVICE_PRIVATE;
+	} else if (spm_addr_dev0 && spm_addr_dev1) {
+		res = lookup_resource(&iomem_resource, MINOR(mdevice->cdevice.dev) ?
+							spm_addr_dev0 :
+							spm_addr_dev1);
+		devmem->pagemap.type = MEMORY_DEVICE_GENERIC;
+		mdevice->zone_device_type = HMM_DMIRROR_MEMORY_DEVICE_GENERIC;
+	} else {
+		pr_err("Both spm_addr_dev parameters should be set\n");
+	}
 
-	res = request_free_mem_region(&iomem_resource, DEVMEM_CHUNK_SIZE,
-				      "hmm_dmirror");
-	if (IS_ERR(res))
+	if (IS_ERR_OR_NULL(res))
 		goto err_devmem;
 
-	mdevice->zone_device_type = HMM_DMIRROR_MEMORY_DEVICE_PRIVATE;
-	devmem->pagemap.type = MEMORY_DEVICE_PRIVATE;
 	devmem->pagemap.range.start = res->start;
 	devmem->pagemap.range.end = res->end;
 	devmem->pagemap.nr_range = 1;
@@ -493,10 +514,14 @@ static bool dmirror_allocate_chunk(struct dmirror_device *mdevice,
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
@@ -1097,10 +1122,8 @@ static int dmirror_device_init(struct dmirror_device *mdevice, int id)
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
@@ -1113,8 +1136,9 @@ static void dmirror_device_remove(struct dmirror_device *mdevice)
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
index ee88701793d5..17a6b5059871 100644
--- a/lib/test_hmm_uapi.h
+++ b/lib/test_hmm_uapi.h
@@ -65,6 +65,7 @@ enum {
 enum {
 	/* 0 is reserved to catch uninitialized type fields */
 	HMM_DMIRROR_MEMORY_DEVICE_PRIVATE = 1,
+	HMM_DMIRROR_MEMORY_DEVICE_GENERIC,
 };
 
 #endif /* _LIB_TEST_HMM_UAPI_H */
-- 
2.32.0

