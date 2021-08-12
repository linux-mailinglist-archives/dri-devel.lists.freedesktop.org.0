Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA073E9EA0
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 08:31:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5873E6E2DF;
	Thu, 12 Aug 2021 06:31:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD72F6E25B;
 Thu, 12 Aug 2021 06:31:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lXIdJ3D2N+7JEObeIrDFtt/UJ5KOnUyieeKduLUdGc9Nq4+/KuBuFpN8wTsHGNhAY7fPRo4qa1PQa0Cvfr9wBtjo/MokX/EZbYCnSgCPwe/bvr9Sh9bOLzL3K6un8RJbnPUVC/5ksjCNPeseXcXLLUMPokzmCucAV08/dJLQMlgVDWOIxmgr5cohXEadkJkpJ7S9HQZma1UIeNkboo0Cij4HsbTRjHVYSzvkSmAA5JHmgH/HKigOiCMN4w0K9FxgDjmOfzeYICULZDYK47AELSvv9H+3qviTL6Bt0EvRLFX3HCwcQwoRbFQx4PZUrICQ5ChqZRV7gFSOe7PdXguaCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wE9CCIbaccYZio3sTlK4LeiR5kDXAgPfo1gDsrORsMY=;
 b=DHwcHvlKbgJU+d7CeHkVs7j5FUwPMe9+x18LTxDKeGEcP0oJFqN8W2HE2i+IXvDSmQL+XlcuqWw66AXtyZdFWeneRWCMqYp4XtG2P0QwJxKu55M2lwhCx6/w3DITa5z8SgK2kRJOkBm0h1MgCGZFEwtp3EB4ZWnIFvY2pDkc1dQmWtfwBxE/1lv4UmNzxxrz+cUfqp/sHSbqlWBzyt7HudZgmwvXNWKzX7xU0Qz2tbEZmQOjp6eRXAGVUNxCOhPd4aNoLR1UcNJSjN2cTPg6xJLYb1PyQmjplfoTQmqmXbKh54nUjKfxDJ5WHzdGKaNY3IrfwwC3yaVpg18277UL8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wE9CCIbaccYZio3sTlK4LeiR5kDXAgPfo1gDsrORsMY=;
 b=yb8qMZ3iXPnkSqd06F2C/naAgSBxHNzyU8NHlKA0Jw9GQR+To/NcY4El5FXggKS47yyb1YwCRDI8GWEeh62b7J3beNZozS3ypxaoRHem4sx1FP3laE7NPcxgrbRc+sLHkUEgAImYOjqMfKPNRjugrv3RoB8Fz9ExZSapo6iGioY=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN1PR12MB2448.namprd12.prod.outlook.com (2603:10b6:802:28::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Thu, 12 Aug
 2021 06:31:26 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb%5]) with mapi id 15.20.4415.016; Thu, 12 Aug 2021
 06:31:26 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v5 10/13] lib: test_hmm add module param for zone device type
Date: Thu, 12 Aug 2021 01:30:57 -0500
Message-Id: <20210812063100.31997-11-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210812063100.31997-1-alex.sierra@amd.com>
References: <20210812063100.31997-1-alex.sierra@amd.com>
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
 15.20.4415.17 via Frontend Transport; Thu, 12 Aug 2021 06:31:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5773329-8e6a-445c-a2e3-08d95d5acfa3
X-MS-TrafficTypeDiagnostic: SN1PR12MB2448:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB2448822E3C1497B0993FA1E8FDF99@SN1PR12MB2448.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8rfNxNDpQN2kpyY3f8IlCrBxxdD9OjOq+ictBAozjw+7y/J29EcsvWgPHWItqw/tGBYIrcIcwJxGvBmcw9P4FLpioZK3l7HGBxY8TPFm60+iNpV99u8CAESpWRMu9VMeQRXDsXzw7NsBr2a5xk+g+sqCU5n6fMlam0K1Bmz2BgSUEDWDVh0HKlcb8AHXzaujMAuFSdoUrFxVyinjzRxpFn2zZnAqN6eyquuhgOndCyo4lIpjsdvDltKrmXFgczRpokrRxBWlNEKh83SPLVEr2jULGxcaX2yno9eosmDYPVs7myWJL7d+RFVjkYml/Xz8Uy1HVxByk7zJeZWogf8TL71SDSZRgRemW7n3Humf4Zd3Pp8AOzTLZ4HbtiwcKiLOyKmpB9yy2g08Eqy5QKvu+ICW1FX4fq6HlKP+FvxljXKVed9TyltURZW0U71caraViLSQvOrUkZU2xQpts9NxBMH961UWZBVYZJCwMSnXLwZz0fpAA2kvIypvN7kM3ryL4tamx0WzMpTZ1Qg/is4tHHcpTkCb5AMBF9Fg7nj8F/83sMQ7Vj1+Fo7qMsV5nX7nS2CoCUNYNUsxvUskKIc3d6W3ZIdUP1MZE8BVgnb7J38SVP6txfuFI2UFT0MhdgM2SbxnuhpnjYZwpYFG7Hu2xR9BNH9R/Tv8TRcCREkjK2BIRSMf+3EhnGK8Ii9rZbAR4XpZKnuWt4VWWxy/0W9C3w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(396003)(366004)(136003)(346002)(38350700002)(6666004)(186003)(66556008)(66946007)(2616005)(478600001)(83380400001)(38100700002)(8676002)(26005)(44832011)(2906002)(66476007)(956004)(52116002)(7416002)(1076003)(4326008)(86362001)(36756003)(6486002)(8936002)(5660300002)(316002)(7696005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SI/muzLnjJdjJuGplDaOKMchve38JYy3hRytfGXJAs8TtYnAC5UqIP+OvSD6?=
 =?us-ascii?Q?0Tu0X6COKSDTXBeewBvjEiKV2DWqaF/qLzQ4z1evqwjycHaOzyg9DRFo7kqW?=
 =?us-ascii?Q?r6wbExUNKTp9XWiq8OIJJXW+MDZqiQZMrhFXeyTK2fSK1qN/4NZgYrPQQOpy?=
 =?us-ascii?Q?y4tZAJ7UXa4PQdWKS5yebPdiEzbIJLmUoCfMb1W7y9Z3Yvb1oX5W+EWz1bTs?=
 =?us-ascii?Q?dmxK6ARPSbNZWGPtx6pn1bWVr3zgzSwuQs/JvYHVx9Uf82DUdNXOHte8R4Hj?=
 =?us-ascii?Q?2oOnDo9okCu1ghPyp3zBTyRdar9q0XjzxH4vi2hwtsr0kQTJbrVwmEYDNzuS?=
 =?us-ascii?Q?gmuc7ZLLaV+lbDAkezGjm444cK2+FZPxleRY36K8EKeSxGV6xLHgjm6zNvM4?=
 =?us-ascii?Q?gyxSS9dxE4NFZkPjyqA7sSzZwKC1vpOfet8Dz7ieFKLy5RE7cwV5n+Z+IjqG?=
 =?us-ascii?Q?NpqBB1G5uPb4cSaAqQTWefQ2Nft77jy4fVOsdbNi/8yuhAIQcI08MCbhQyFA?=
 =?us-ascii?Q?nue2PCx2vg9KP5mz0J4OPvIE00skiXJcQRThwPkIae+p8Tqe4mJ7nrR56/KH?=
 =?us-ascii?Q?WQ+N1ojpcq3yycp/6iuZIpOKb4lYZEkdq5Vuf2a0eFCVjFTuPLLCVsI6ph9f?=
 =?us-ascii?Q?cAUmR5441wosRZm4pMSpk+U1XsMRslkTG5p0YZe5lfL5QAaP8OWE5xXzqSiR?=
 =?us-ascii?Q?1nkiThgBPpvbX6boImZK63+ypujJjgDbMDdMCtvShpmV1jkVdTQpkqcKf5Zi?=
 =?us-ascii?Q?CokdTAYiA/LE+t9ga6Ue/DSM5gLGKikMxvxEGerLfCg1PoMjeVNzIYRhYQ9g?=
 =?us-ascii?Q?uofPA0UT5rbuXXP0KLFEMleF/U9+19h3iZT46agL82+JkD8CKtAVR0EoFqPR?=
 =?us-ascii?Q?z6wSA8pWyiOa44ZJ7YhYEzDRFG12Ywh+51z8kr698rbgNYUWLPKwbE0KxS3c?=
 =?us-ascii?Q?cflQxIQUp8cy//kejfNL58j5MkyxLwy7jREgNbazpM5C5aUfSPJxsRY8riHU?=
 =?us-ascii?Q?XSyZUU3FTZgGOASU1xJyhG/8L50UYlMR77F3I7pL2dDl0qJal/fVMYxccCWu?=
 =?us-ascii?Q?y+fOEnZnDZrK2z5f6pZmsPu8Ati8OEz5TiIZschunydrotLBfKL0mTzFoXEO?=
 =?us-ascii?Q?sVGMwGPKdNCiIvkU22SYZkIEH+3A6/MNlP3fsKHA+yas+XYQJYiMeJDNHP1m?=
 =?us-ascii?Q?hsO92SsS7vz5ZA1nnpafhfdl4jBEAu6y7drQIn/r/W9fCRe7lox5Z/RqmVXM?=
 =?us-ascii?Q?BCt5Ooc0MbV7DYifjx8pQFBS5Uec+DRAE+rWQ8t8Y29XEkfYGh5/elWEwFRU?=
 =?us-ascii?Q?tyF2zxSxRixT1gbiy4rgyZV8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5773329-8e6a-445c-a2e3-08d95d5acfa3
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2021 06:31:26.3535 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4dBp9JA9gzvctdcnElg1tHPe0eZlNVLcIbXGsxErX3utN7sb3dJTCKmlX0TZzkyxQjjPX95OFIMcX+QalSye1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2448
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

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 lib/test_hmm.c      | 46 ++++++++++++++++++++++++++++++++-------------
 lib/test_hmm_uapi.h |  1 +
 2 files changed, 34 insertions(+), 13 deletions(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 3cd91ca31dd7..9283ad1f4280 100644
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
 	if (IS_ERR(res))
 		goto err_devmem;
 
-	mdevice->zone_device_type = HMM_DMIRROR_MEMORY_DEVICE_PRIVATE;
-	devmem->pagemap.type = MEMORY_DEVICE_PRIVATE;
 	devmem->pagemap.range.start = res->start;
 	devmem->pagemap.range.end = res->end;
 	devmem->pagemap.nr_range = 1;
@@ -1097,10 +1118,8 @@ static int dmirror_device_init(struct dmirror_device *mdevice, int id)
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
@@ -1113,8 +1132,9 @@ static void dmirror_device_remove(struct dmirror_device *mdevice)
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

