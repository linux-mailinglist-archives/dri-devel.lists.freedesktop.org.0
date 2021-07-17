Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E08B03CC5CF
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jul 2021 21:22:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D3D76EAAF;
	Sat, 17 Jul 2021 19:22:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2057.outbound.protection.outlook.com [40.107.212.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCEAF6EAA7;
 Sat, 17 Jul 2021 19:22:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RJM2zCgBUgOc9S8BU62IRIjzUZMnsgBVHcFrDVHNoaft0Rkw/oHG9hJi/EBZQmeftqrb7PnutNyp/Qm/4HWBnIk5hWgAC6P6pokwqlztWq9Af9TdT0r/+DpKfJ1uJd8P+lrsIcydVAbPe1Rzq1g9OBScJARS+EHIpt+azSIxCIjV2Qz3yaWqb2+Dv/D2Ni3JM5INfp3ap/gGQkUwKw1sEndqpA7JDTSiTDy4aEXiBqBU+I5zIIbPqdFmfvKcFvaVj/m6PVc7cF+9cmbpG4VNfrl5Yi2RM2DihhQZtqGDNOPkW5lyBJsfxv9wfiGHejCMjKgfTC2FOTofSAHmYItWig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aRvbV4JGMbUEpWoe93Bb/nFVKCW02HMvzadh9Q75HKg=;
 b=Mjdjcoz1FDDHHBsP7YvGyhXV2YQPQcPegdrShp0gBXVOzQQ2WlOFlCMytZL7z+WMK75/nbdzqHUbZKKysYg0XgKaW6Zf0i802uGnEDJ5jMYagkLgSCbM/Si1GFkxl2TN046SdFCDbwm6v0/0vvWyG7mgmYMjtVj9Ia5QhH1exPhn/VeykmBj0e5L5QGstxxdmk4EvhPy5amHjeriztpJoSVqd/izZCrENnoRqEAEKYn9y/Qr3cLGmZGyFduykKced8vbES1TqiHu9WnNngiA2cVD496XnLss6Q8fqKKZmQF8mBrWJe/muR8yBJrbkSE5mafC5VwFnfAs5J3SRrF29Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aRvbV4JGMbUEpWoe93Bb/nFVKCW02HMvzadh9Q75HKg=;
 b=yZdDh+z2ff4iMbUknvV4IN6ISX0wY5JKTyJDgq4mAlGniSvwSEQ+pYWMleyBOSqdAypOT+8XLv9t4vwsn0yVdnUSgmnC4X0pR9zIQ1jl4gZAltR5nGFTARTqKPJC+xzdbQDgE/ggoSHLbj2AmiOxkA1LOtZAHn+A7eRL8iUsa5M=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN6PR12MB4670.namprd12.prod.outlook.com (2603:10b6:805:11::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Sat, 17 Jul
 2021 19:21:57 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::d0d3:a97e:6b7f:ab39]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::d0d3:a97e:6b7f:ab39%7]) with mapi id 15.20.4331.029; Sat, 17 Jul 2021
 19:21:57 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Subject: [PATCH v4 10/13] lib: test_hmm add module param for zone device type
Date: Sat, 17 Jul 2021 14:21:32 -0500
Message-Id: <20210717192135.9030-11-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210717192135.9030-1-alex.sierra@amd.com>
References: <20210717192135.9030-1-alex.sierra@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0201CA0067.namprd02.prod.outlook.com
 (2603:10b6:803:20::29) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SN4PR0201CA0067.namprd02.prod.outlook.com (2603:10b6:803:20::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22 via Frontend
 Transport; Sat, 17 Jul 2021 19:21:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a35122d8-478c-48b2-471e-08d9495821f9
X-MS-TrafficTypeDiagnostic: SN6PR12MB4670:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB4670F846D23B99C86DEA433EFD109@SN6PR12MB4670.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i0Ro7dV4dFX7Nmq6KVH9TVtLBvBeg5AAqP6yNC3ORCNsL6FV8zzUB/jFgslnlqx/GT44sv5njEudFG+9X3/zpLnJaj+DfoHki+k3M19RNQtQIhMPUwAZqu9QLUt0vgn9EWFrSxyi1kzpTu3XpeDzPFzktNrJ8fofMRBUpyPJYDz5uBUv/yGxhYxPaxi4c+O6Qz6uyCMLKDF2AwUEyCrnoWBzIm9i6x41+z6/0ZtgZrODZwesVkZp5YXpJXrXJNZnh+oGMLc+SwbizONxKik2zIhm1LgzQJ2XBMsuZ7VoUxOY+eSGA3Ledce+YSXyYC6N71GS8V+D3vIzMb1C0su5kqJfr1d+GM5a+t1w6FUyPll/QoMbFjptr4ILJ7r1bIRCDQkpNWPFb1DyreXCc9cl1PpZtej+gXmtPAajJhYiFrZFK+uKMhK8+jtArVQXTzMHstUNEEmK110FpQySLRg8onQQpzdGsqKv5KiHH7mgTrbxal8EpnPFBLb9Ufsv4GGv4tervz7OpePNc2UGKeMgD20B7EmIfI6DoUJMkAaOVO81OymOZ3GMXW3/l1t+ZBRqsDekzIfbgH+nV8vdkUM41X6OHm5dd7YNI9TqnzBoZszNUf6GDL8oMTR5GucM6t5YhmJtoptoZ+fuDLCi6BtQCacuyFjnHUPey2VYqNrgSIgtkhrEfdIh0JLjvtMeKej2AO2Gc6sjOkUaVE7fykm0Yw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52116002)(2616005)(26005)(5660300002)(2906002)(7696005)(7416002)(1076003)(4326008)(6486002)(6666004)(186003)(8676002)(956004)(66946007)(86362001)(316002)(36756003)(44832011)(8936002)(38350700002)(38100700002)(66476007)(83380400001)(508600001)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UNpJ+LDDLVABxWIPtZ5+98T5T03pjdkD3R3b8sSV7FltycOJIolAo/ABXwSX?=
 =?us-ascii?Q?PnQ9tfRTn+viah7rRPfXRdptERb/uCrzem187cGcaeJELpKNUWDmdyKw08uG?=
 =?us-ascii?Q?AJe3kzjcl2hS6FJlWad9w3mvdcIwGVycWvR361GLL0vB5JnrWK9S7qLAt1WD?=
 =?us-ascii?Q?KkRkdrDJDWMwrZwZ/+cQy7n/SySp1dw0RVXYEvzpS+l+M4Kx59LxSfgogh7G?=
 =?us-ascii?Q?9HZvB6TrlZfzmowHrv4o6U5Arc+BhFcwkFdF1K1KiWChF9vEzjKHrvxBMc/Y?=
 =?us-ascii?Q?AJMEbO9fMjBX/EzXAuOjWxR3ffmrPUAojHhkVtOv+wd8lcarqajPs7cxJxr0?=
 =?us-ascii?Q?Ot3Pc1MBqSumJ7rIZ6KTUcm50r8DP0TAH5ER6DWQ/AMpOAnSKQWb9pGbpI6o?=
 =?us-ascii?Q?LL44W9BxoYlRC1KBkI8xowh3rTwWlwuT8V0zjjSe7tpfCQxEPVKqrelpl/3p?=
 =?us-ascii?Q?ki2AoVoAknLCVcL/HVsvCN2Z/50s4a4jASAaG1qDmMx9b8VQ+vhCiM/4ElN6?=
 =?us-ascii?Q?L5YrmsrUn8jwRXdxVnnhfi292lZZQCQElc3gHEHM+p4640OyEpcS9pn8y9xP?=
 =?us-ascii?Q?KeYJK668aJN1gHoE8L79FaJlAnHOvS/uk+xsmYl7R1YWqeMdGYt7lzhf3IPH?=
 =?us-ascii?Q?jqGQwDeUrg3ETKphmaf76i86f8VV1Q48TcuTDUsfivqcY3UJWYXXh4XJ3RHf?=
 =?us-ascii?Q?OS/L0g3y1hdBvYJCC547VOrRMp7byIpaXXHWry0wJlTERoJ7KmhgQod/kJn4?=
 =?us-ascii?Q?Nu1N8hs51332HLDaIfYLcBoXyT9YP7oVomqMH0vRNYG/qgsHg4AKhRZF/1iA?=
 =?us-ascii?Q?4guzfzRCZ7a7GQJy1EvSsU/G1aSc65pIydiaVzMq19dHJjEcMfKFVycYqELV?=
 =?us-ascii?Q?Kc4WwMFV3w7MBm9WmP02fdxSMlKYOKPnA6lWxsjb8ESnM1NCU0od99Ra2cUU?=
 =?us-ascii?Q?lqvItXIu91+LV+uFtKcAMpqQcK+nWHM58VKjbZ4ns+p2gIQYmUkahKwmYHkv?=
 =?us-ascii?Q?cVx7yivOZKy0ONUMLZ5Ye1kPlYwSjPBiv7MNbHA4Ia/JGv7OuLDyYjxOznk/?=
 =?us-ascii?Q?2afMEEIwGYg2X/x7Q3FEG2sMdOw3y4yS0uPtwSGPSSMC2sa82YvIuxXl7TCn?=
 =?us-ascii?Q?OMht8ckfcXCyxpC/b446IBs+HfuXqXYxLofBiSMOnWzcjIYOsxsdl9NkLaI4?=
 =?us-ascii?Q?BYN2urAR24/K0kiLKvG/DsgPcTAZVidOHv0OWhHIyz350LKs478lC2jhxwZw?=
 =?us-ascii?Q?NMWgMe4j6s+3PxKB+cpfukLBJDw3/B2HxDZ67QOmCkhCTBfrAa/fD8sZIuWo?=
 =?us-ascii?Q?hf64xzbku+V2a3vi9NWjOMad?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a35122d8-478c-48b2-471e-08d9495821f9
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2021 19:21:52.6934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nLmhyzSCPRPl+sTyJmGoT9M+cQ4rw1HhWOtKd/vk7eqa7lRj/CoBhLPH58DgYCyy3I0pi1kO+Kpi6YbmJ/bm1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4670
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
Cc: jglisse@redhat.com, jgg@nvidia.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to configure device generic in test_hmm, two
module parameters should be passed, which correspon to the
SP start address of each device (2) spm_addr_dev0 &
spm_addr_dev1. If no parameters are passed, private device
type is configured.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 lib/test_hmm.c      | 45 +++++++++++++++++++++++++++++++++------------
 lib/test_hmm_uapi.h |  1 +
 2 files changed, 34 insertions(+), 12 deletions(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 3cd91ca31dd7..3c2e1fbedbd4 100644
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
@@ -462,14 +472,26 @@ static bool dmirror_allocate_chunk(struct dmirror_device *mdevice,
 
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
 	devmem->pagemap.type = MEMORY_DEVICE_PRIVATE;
 	devmem->pagemap.range.start = res->start;
 	devmem->pagemap.range.end = res->end;
@@ -1097,10 +1119,8 @@ static int dmirror_device_init(struct dmirror_device *mdevice, int id)
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
@@ -1113,8 +1133,9 @@ static void dmirror_device_remove(struct dmirror_device *mdevice)
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

