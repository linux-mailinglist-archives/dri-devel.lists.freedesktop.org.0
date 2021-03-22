Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B75343EEE
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 12:07:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5183D89ED6;
	Mon, 22 Mar 2021 11:07:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2058.outbound.protection.outlook.com [40.107.237.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C279B89BF5;
 Mon, 22 Mar 2021 11:07:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K+3guLpkUT8/jrih/lYX+PQk5xV1FcIy4KzyCVZ09TBOH9BTS6s7VWY15dCkzg1vJ6JSnsgmsdZCuywUkLNva7fk60dIqKj1aerwuB+LP7VYmU4N79dpqoQf2+r0Hj2hEY4xk1+ac1dUHVds68hx/dc/MruSr+ocyoFYediyB4on4009+F2XpwJRdqBVHHyihwK/9CRm6VpqKCKS5uqXA0a/FyUsCGGH9yy4mXWQqZsnHt67HMfmyerflAUtsDlwhrANBoGTVNUCxuI/iiFkfwQ5QmLPtzTtbL0EnsHUN2IZwIi2HOoy+BCd34SJ56ZKU3RLFgG7qu/JZZWwJZokdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kN5YAv8bz3xTUe1pbWt/af+RIwUCwjeiVHoVzVkc1nE=;
 b=fAHVQ1sC8lSYNkyNk4mXXpyrsmnJDf4rUudh0RWoK0PQeiRAAtSjA+M4XrS5jqTa0KQIvV39E7cNhtvVOieH/ep41/UqeAY3uCYu6reZghwls0RkaGh2TeqREu0ejEHj142BaqAfkKIQgLhsYVsme4iQFSCTmo+fAVfQybW9X4Jgn5GAjp6ivIKgSSDY7afND6OAeOm9YFcaVJjHNW4KySgYCmCTvA4YXn6ectC8Y9L54tdzG/V3JLryQvEfv9bmtmZJvWNdiCYo6TqjyqJqw9yItEeo+uCO/mQ6YPX4UJ1ATYxIq7n9kop6jjqtZRmTE4WRU+yiM3khBOvplyuxQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kN5YAv8bz3xTUe1pbWt/af+RIwUCwjeiVHoVzVkc1nE=;
 b=pJ0m6MUqrdUeFQtSeYFOBlB4IAOMGy62s1QkIvJuHbloAC2RAtd55gHBAHnbBrGa758R+JGtJZHOI9nsnqy498nNnybHuZ5DeWwaaa0CEqBYHaAd6QAumBI05/KRWLR4sAdPnZihN01uTUJRlTxi1D+vpbetWqQ83/LhNtAVy9U=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3678.namprd12.prod.outlook.com (2603:10b6:208:158::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 11:07:36 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.3933.036; Mon, 22 Mar 2021
 11:07:36 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 12/44] drm/amdkfd: add xnack enabled flag to kfd_process
Date: Mon, 22 Mar 2021 06:58:28 -0400
Message-Id: <20210322105900.14068-13-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210322105900.14068-1-Felix.Kuehling@amd.com>
References: <20210322105900.14068-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::21) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24 via Frontend
 Transport; Mon, 22 Mar 2021 11:07:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b538c24e-2d30-4c43-511a-08d8ed22b2fa
X-MS-TrafficTypeDiagnostic: MN2PR12MB3678:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3678069FB93EBFC045B934DB92659@MN2PR12MB3678.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IuiEOCXBR+mhP6IU17RgoFWx3SF3NgXsxtvrlmJi9KLiSWPhBY1WXM59S0ugMrgm5u/qAS28J4ubGV6EnN2XlSu9z/b4wesDiQfQH9gpt8th8bwMHqC590jcKV4NJ/mHoKqBpHfaYpgY+ruRcgYNJNfenvUC1/3xi7pB+Bgt/vYvx9Zl8VuKxByB9v5qDNsqeZ/aMp1N+eZKKQKPxEjM6IWxdTZklMdiq9+BPY5iHTm4XPALMi4FS+0wJmEF7ZIOC3J7SPOLzQPgWGeMNFnLXiVqpfB7aiG79YBno5Vcjnb1VUig0HRMhokaosVo0/6N5UP/3aMvSv7fsR0nV7TAjxLShv5BZ+PZZyLtMRa1yHfL3xTRNfPIHHoUscI6g3iYSanMkYT4b//HeMeO3V7ItjzBuYN2datyKwhbkfuddQdBRjsKwycs83UBAOXS+pEXZCSlO5bCbkCsJjnFhJSaXa3e0l8l+/LBuUzQLTu4KBWwdK1HtYb+6/pfdKj2ACTVjIR37VhcL+oJApOvguiEX3iS8brRI9aKEQ12ypBfaNq26LGzodTGhU10lPBeSiYMtnBJdG+PR6uKn7gDtj0NbBDT7lWC3B7YehrZBzlFDkCj959b3vFH9Lh+JhlYYs7tlKEk+b1AiDu0AVIP0I8U0JENrD/0o9rvW8SXFJBsseY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(366004)(39860400002)(346002)(52116002)(7696005)(6486002)(1076003)(36756003)(38100700001)(6666004)(83380400001)(478600001)(2616005)(956004)(4326008)(450100002)(16526019)(2906002)(186003)(26005)(5660300002)(66556008)(66476007)(8936002)(66946007)(316002)(86362001)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?J3sD/Vqs2B20l3DfVQJoKlMKHmllcMBvrMo24CuqR6EA76YB/esiLqzCfSQl?=
 =?us-ascii?Q?KYtYFcRj3uLRG8IfAJDbDR3S17WYwAYbEKjrbCc/zuk9Gvnk11uTgpwDALyr?=
 =?us-ascii?Q?+GbNO88VLL5W1IbUGiAKDKHXzndHoFWIcoKkwZnH0PYSogctH9kGCOZwZWlv?=
 =?us-ascii?Q?RLyJCyDNTwr28zyfyPXLJOQkXBtl96AsyeGwvvE6fHvM2zVjsfebNiPcBKnL?=
 =?us-ascii?Q?MfrUZX+228TJD0JgAFncIWHRLLJhTpOF+/FzfySrw2R6713/ylZGlpC1YLGE?=
 =?us-ascii?Q?thfxrnrKbxOm87pncXjI4Wo7d+GmcmGIRNZX57rlBhBWzoE4TkkOZ7SWjFLp?=
 =?us-ascii?Q?MkKBpDMbdaCBaAJK6eOBZUu6bEeAH9F+m0Qy/SbxfES4AYBNzRnV7L0N9bGn?=
 =?us-ascii?Q?cGJKxgXB3g1a8JBO1jH6NAfXKIRd9nXPrMLBwM2JY+rq3vpl39jvvygPr8Kd?=
 =?us-ascii?Q?UH8opptb/202yzYE4+ilfo95kP8hBEcP7qnPn1/VILvHMV1smKbSCByCRMJX?=
 =?us-ascii?Q?dyRj1+jJ8kEFbfjwYT8BJuVGMK2NFwkgnr25Q8vR0ThZvDiAXPiWpInZKiFV?=
 =?us-ascii?Q?OFaLhWhxrH9zbMyhTVKsYJi1FB5atzpMKf1/qxpqjOqKPFDB12+TRcC+qFzB?=
 =?us-ascii?Q?sIlODIyswFntUNMgdIQSTlHXNqilyZ8i5qfF5nHPlDk/APoeLhfS3qnbqYgF?=
 =?us-ascii?Q?I24quGgvCjzecHgfhXQAKV4t3dLXldesmrlkPTTJeb7RBGeq2nHir77aOerx?=
 =?us-ascii?Q?Rk0ipcmOUuz/qRCRDKojkUXId7wksyfBUDIw0r8e7radaBafQ3+HYAa57BBY?=
 =?us-ascii?Q?+Ta1CQi+1BHaSnocwTXEnl1Jn0GvG83ir9FUOQVzr7OIhPJVFli0lnwLDRRX?=
 =?us-ascii?Q?JI5lskWaWgx0inUINsSSqGC6HIyLqUa5OuFc5aKXdE6DBW2fdOTPHa47juXJ?=
 =?us-ascii?Q?NzgDEnzVqKMvpNoFa8XuI+6CIClsJvCjxh1C8dur86JcdL4ylzo/Lmx7AIx0?=
 =?us-ascii?Q?UuP8QDScFLqAMlCwvZpUDhL7GLZbUUDf283yLp4oy7dWySOXKyd664mPIZgF?=
 =?us-ascii?Q?nkvZFPnIfsJLgp0x2VShnVG1ObeS1V1WWxxWPagQdLtCqdVj5CAivY/yw8IW?=
 =?us-ascii?Q?5+doZ9p45rnSobWZxV/MlgsJiOc0u2Y1wiBflwS2tjYjWXNdzLRm3FzgmgNh?=
 =?us-ascii?Q?63gFTn0GUogdwUzALGgEZqzKDsVbxReoRLA9ZNMi8L15bi5P1cSqBeWxI2W0?=
 =?us-ascii?Q?h4jBMyjkQ3BARv/NjOuz6Fb0lRhq3Q+kFf4o2Z0Lw9TVu4CVe7WXmoSXsKlV?=
 =?us-ascii?Q?nS4RVZqVHhwvjNIloDWBzU0J?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b538c24e-2d30-4c43-511a-08d8ed22b2fa
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 11:07:36.1759 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nungjb8eOIRtnHy2iqXymzLPmc1AI8SJ3zBybtDbPyBv+LdDnd+uuj3046QoP1StvhmfEI1r18JQpnwILtexFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3678
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
Cc: Alex Sierra <alex.sierra@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Sierra <alex.sierra@amd.com>

This flag is useful at cpu invalidation page table
decision. Between select queue eviction or page fault.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |  4 +++
 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 36 ++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 7d70af26b5c7..d66430740e52 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -824,6 +824,8 @@ struct kfd_process {
 	/* shared virtual memory registered by this process */
 	struct svm_range_list svms;
 	bool svm_disabled;
+
+	bool xnack_enabled;
 };
 
 #define KFD_PROCESS_TABLE_SIZE 5 /* bits: 32 entries */
@@ -877,6 +879,8 @@ struct kfd_process_device *kfd_get_process_device_data(struct kfd_dev *dev,
 struct kfd_process_device *kfd_create_process_device_data(struct kfd_dev *dev,
 							struct kfd_process *p);
 
+bool kfd_process_xnack_supported(struct kfd_process *p);
+
 int kfd_reserved_mem_mmap(struct kfd_dev *dev, struct kfd_process *process,
 			  struct vm_area_struct *vma);
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 321895d7555a..c8479f6bd68c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1193,6 +1193,39 @@ void kfd_process_set_trap_handler(struct qcm_process_device *qpd,
 	}
 }
 
+bool kfd_process_xnack_supported(struct kfd_process *p)
+{
+	int i;
+
+	/* On most GFXv9 GPUs, the retry mode in the SQ must match the
+	 * boot time retry setting. Mixing processes with different
+	 * XNACK/retry settings can hang the GPU.
+	 *
+	 * Different GPUs can have different noretry settings depending
+	 * on HW bugs or limitations. We need to find at least one
+	 * XNACK mode for this process that's compatible with all GPUs.
+	 * Fortunately GPUs with retry enabled (noretry=0) can run code
+	 * built for XNACK-off. On GFXv9 it may perform slower.
+	 *
+	 * Therefore applications built for XNACK-off can always be
+	 * supported and will be our fallback if any GPU does not
+	 * support retry.
+	 */
+	for (i = 0; i < p->n_pdds; i++) {
+		struct kfd_dev *dev = p->pdds[i]->dev;
+
+		/* Only consider GFXv9 and higher GPUs. Older GPUs don't
+		 * support the SVM APIs and don't need to be considered
+		 * for the XNACK mode selection.
+		 */
+		if (dev->device_info->asic_family >= CHIP_VEGA10 &&
+		    dev->noretry)
+			return false;
+	}
+
+	return true;
+}
+
 /*
  * On return the kfd_process is fully operational and will be freed when the
  * mm is released
@@ -1232,6 +1265,9 @@ static struct kfd_process *create_process(const struct task_struct *thread)
 	if (err != 0)
 		goto err_init_apertures;
 
+	/* Check XNACK support after PDDs are created in kfd_init_apertures */
+	process->xnack_enabled = kfd_process_xnack_supported(process);
+
 	err = svm_range_list_init(process);
 	if (err)
 		goto err_init_svm_range_list;
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
