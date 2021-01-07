Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD222EC891
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 04:03:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29CC66E41B;
	Thu,  7 Jan 2021 03:02:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2054.outbound.protection.outlook.com [40.107.94.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 219B26E413;
 Thu,  7 Jan 2021 03:02:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=amWTZqiXVXxNpP4fM5uikrLc3EVZjjqbE4A2GZKhOFGOWLGPnweqHK51EConQTnm4+3kMcK1MO709+keJ/fJqvYDseebSdidenKU6+K9DPc0y2nIHv7vPylR8NNrQpQUASER4PNwA758jAO4+Q4KXJn3Uuvv+/iqnj75nQsLz1+/JXn/DyJhhXF9H71iNQA3yzNGsQKAum2ZFfcj8Jz7KmHDNOR+6xYaTfKXGBOCKgxmdup6LaKOZvLwEHpc7ZeuIVtkFfGXaJvVZUd8bdPrDgPlD8gZky2VuxCRRdo0neBlZjIfnMRmAIPsLPZQYHfmFFMQAl2GmAaC6jbhtlSJ+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aFPGJevZgpETqRnH6+B3KeESM5YYJMlq731h9WxB82E=;
 b=cO5ZGa8tHGKqIiPkiRLg/r21DA1ywWou9okiUeSBl6wmIBivuz92SvCEVPKV7yjCO1ISvo0a8LTpet3MMftApE2ZxIdgznwGwQ0leoiBp2nUh0WVaflZBO4+xqDnJoP++zHLsWATrMy/WkiaiJnhTzGhzUZiVQ4d8Bju4rgZCawQeDFdm+En1eDl0mlfQYINf0u63rv0TUGLsajEo2KRy/6gt5Cxf8kiq3jMRPGn1g4pSVIWHbKWDRAgByOVqdvbZH0b5+B1MsCE4yzVlxOOfAGjiTCNGM9hVwiN62VWM+2PhGHLZXRMtdGfqI2yEwjhy2WemX9kFP1PuM6+8U8L2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aFPGJevZgpETqRnH6+B3KeESM5YYJMlq731h9WxB82E=;
 b=CDB4umLpegYCTK8p82XgoRPewwmyESvsXPJYEJeNNDZWwjdpBGEByKOi9FfNIwCoW1aS76iUyhsk12HNLobt5Pdkr1CnJyly00HY9y85cmx99BsQ9ukDdmpJ613afAkPZgfh8/zxpb4LhGVJzFlgFAFTiDWGZ8fVSTUYSyTSXRs=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3999.namprd12.prod.outlook.com (2603:10b6:208:158::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.24; Thu, 7 Jan
 2021 03:02:54 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b%9]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 03:02:54 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 11/35] drm/amdkfd: deregister svm range
Date: Wed,  6 Jan 2021 22:01:03 -0500
Message-Id: <20210107030127.20393-12-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210107030127.20393-1-Felix.Kuehling@amd.com>
References: <20210107030127.20393-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::17) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0048.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 03:02:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a6fa2fe0-8c2f-4397-f5c9-08d8b2b8ba54
X-MS-TrafficTypeDiagnostic: MN2PR12MB3999:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB399903E469D0737DF043F99C92AF0@MN2PR12MB3999.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GaE5v6eb3t2yhWhv7kRAE4XJJoQzcH/qlG/Ovlr+yzOloCDmOO3hrlGOv3TNE+pfyW9mvEwEBCQhA5+L7K6zQ8nV8/YAWTeUYx+y7NU2eWyRrO9H87doygIZepbLRuhkrSwm3fHbZyl+jIBZITZ3nimCNJB7OYcNc3od3lwXDkIm6lb39o4yI7ah4xZwM3mEZZrlRHMD7VvDO7I+hywdFJGM9EoFZZlOK9gxHuA8c/rVJH4PX4bg/VStcPKh61XFJgFydnLjRZP87vj3TLxnKnwkVmK9GCw5ruE6LTsVSCKpghXkjAOcYnyCfsODh73AuF0/U2T1kU9QTpictRWXYUjH6JsnXhBQ/FCyBlNGXwU8jKgkCVqiZ6P70w8d8yfadMkdIoT8aV1H6yQLkT5kTA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(316002)(6666004)(7696005)(2616005)(956004)(8936002)(4326008)(66476007)(8676002)(478600001)(5660300002)(26005)(52116002)(1076003)(86362001)(16526019)(66946007)(450100002)(186003)(6486002)(36756003)(83380400001)(2906002)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?dvF+iKkxwOAH95LKCXJXHiWdrSnIxJ8o9Nz7OCZqFSMUVdFw/RgZAAt27AMa?=
 =?us-ascii?Q?gBn3BCSrk8iV5ohKuNHMUFqXfu+eKo6n04a7iuoJsD8xdMHG8/79YYaTNiPW?=
 =?us-ascii?Q?PdJvyNy63q2wR2exssQPB7QGREAG2XcvlRA8WDONrFnbV/TjLUfDmvlPcaS2?=
 =?us-ascii?Q?Nf4qnZyarcVCuDZcCp6n6xBfkJz6ag8YAW+OmXq8fEC2YYS1ZUgiRJGeMZIM?=
 =?us-ascii?Q?Arwan693eGPNoCJq0RTNPqwBpARsLVjmqCi7tdD6XtcWWiP4cjn1lKqc0TPs?=
 =?us-ascii?Q?XGgz9OI6+eYFtFl8jK4a0cJe2gssfQXCa43sTc4kOebrGKskNGmxuE7Z1Jb/?=
 =?us-ascii?Q?ZfCdVduxgEhYCZ4t9+ReQQKdRTEr+YxF1NOks/T4idvoLq0iyWyzfKO+AlJP?=
 =?us-ascii?Q?mEWTO3ci/oFLpudhHWb20kRoslhGrbpNYm/4L5Xx82Hb+j2jeEraXxocl7bG?=
 =?us-ascii?Q?qhJ67lGokmBg4cyadpM0ix4Ytg+c4U+wf0OidxqRpN6ivuaTwHsNpuB8+TRT?=
 =?us-ascii?Q?PnwQ5ecEve2dVggeFHAy+D9IuR3lZndyVL2AIpK6zPNYs4mQjUtJRceFa0ZK?=
 =?us-ascii?Q?Jwyn/BjFdjERvO28sTqcdQDvsIqSLESy2N/Nbpwrbus1tjQvLkK2oHe81u9g?=
 =?us-ascii?Q?sUCghDsUiHy6orBrPn3pXC7jOal9SeDfDflj5sBzMbBZD6YbT05mGDzqVoGF?=
 =?us-ascii?Q?4vJyO9xZkh20eEbir7vCKacX/cNQklA9tT43ev70OhC1QlMDt4ONMocxUqJm?=
 =?us-ascii?Q?P0nhNzu4m0IF2Gfc6mv49doPUiGP9oAorWYm2VZoKnm1X0bCQDet997Kcy2w?=
 =?us-ascii?Q?xqDGq6Lia+cQM+yWi0fz7389lww9wu75XgabTGBTL8NX9WH8UCMCbEtX6Kxj?=
 =?us-ascii?Q?kK+KHdDXhKdHy/ErUIAcGYTC4mk+QLgC9Ukx7avbDE5qZH4g13i4pHd0aJAD?=
 =?us-ascii?Q?K0m6udNmwbUWXbC5mHhTXwPT3J+Ja9GETqw2edB1GTBWY2mB2xKrQ0sTwCEN?=
 =?us-ascii?Q?Wh21?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 03:02:54.2025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: a6fa2fe0-8c2f-4397-f5c9-08d8b2b8ba54
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hLRnVlPFtyFRpv1gw6ace9W4ADvBPE9WvyDK51Htb86tJEryvowfopsHVb1NMjdR3oW7gFgDPBiGgYOp1oNAQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3999
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
Cc: alex.sierra@amd.com, Philip Yang <Philip.Yang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Philip Yang <Philip.Yang@amd.com>

When application explicitly call unmap or unmap from mmput when
application exit, driver will receive MMU_NOTIFY_UNMAP event to remove
svm range from process svms object tree and list first, unmap from GPUs
(in the following patch).

Split the svm ranges to handle unmap partial svm range.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 86 ++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index ad007261f54c..55500ec4972f 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -699,15 +699,101 @@ static void svm_range_srcu_free_work(struct work_struct *work_struct)
 	mutex_unlock(&svms->free_list_lock);
 }
 
+static void
+svm_range_unmap_from_cpu(struct mm_struct *mm, unsigned long start,
+			 unsigned long last)
+{
+	struct list_head remove_list;
+	struct list_head update_list;
+	struct list_head insert_list;
+	struct svm_range_list *svms;
+	struct svm_range new = {0};
+	struct svm_range *prange;
+	struct svm_range *tmp;
+	struct kfd_process *p;
+	int r;
+
+	p = kfd_lookup_process_by_mm(mm);
+	if (!p)
+		return;
+	svms = &p->svms;
+
+	pr_debug("notifier svms 0x%p [0x%lx 0x%lx]\n", svms, start, last);
+
+	svms_lock(svms);
+
+	r = svm_range_handle_overlap(svms, &new, start, last, &update_list,
+				     &insert_list, &remove_list, NULL);
+	if (r) {
+		svms_unlock(svms);
+		kfd_unref_process(p);
+		return;
+	}
+
+	mutex_lock(&svms->free_list_lock);
+	list_for_each_entry_safe(prange, tmp, &remove_list, remove_list) {
+		pr_debug("remove svms 0x%p [0x%lx 0x%lx]\n", prange->svms,
+			 prange->it_node.start, prange->it_node.last);
+		svm_range_unlink(prange);
+
+		pr_debug("schedule to free svms 0x%p [0x%lx 0x%lx]\n",
+			 prange->svms, prange->it_node.start,
+			 prange->it_node.last);
+		list_add_tail(&prange->remove_list, &svms->free_list);
+	}
+	if (!list_empty(&svms->free_list))
+		schedule_work(&svms->srcu_free_work);
+	mutex_unlock(&svms->free_list_lock);
+
+	/* prange in update_list is unmapping from cpu, remove it from insert
+	 * list
+	 */
+	list_for_each_entry_safe(prange, tmp, &update_list, update_list) {
+		list_del(&prange->list);
+		mutex_lock(&svms->free_list_lock);
+		list_add_tail(&prange->remove_list, &svms->free_list);
+		mutex_unlock(&svms->free_list_lock);
+	}
+	mutex_lock(&svms->free_list_lock);
+	if (!list_empty(&svms->free_list))
+		schedule_work(&svms->srcu_free_work);
+	mutex_unlock(&svms->free_list_lock);
+
+	list_for_each_entry_safe(prange, tmp, &insert_list, list)
+		svm_range_add_to_svms(prange);
+
+	svms_unlock(svms);
+	kfd_unref_process(p);
+}
+
 /**
  * svm_range_cpu_invalidate_pagetables - interval notifier callback
  *
+ * MMU range unmap notifier to remove svm ranges
  */
 static bool
 svm_range_cpu_invalidate_pagetables(struct mmu_interval_notifier *mni,
 				    const struct mmu_notifier_range *range,
 				    unsigned long cur_seq)
 {
+	unsigned long start = range->start >> PAGE_SHIFT;
+	unsigned long last = (range->end - 1) >> PAGE_SHIFT;
+	struct svm_range_list *svms;
+
+	svms = container_of(mni, struct svm_range_list, notifier);
+
+	if (range->event == MMU_NOTIFY_RELEASE) {
+		pr_debug("cpu release range [0x%lx 0x%lx]\n", range->start,
+			 range->end - 1);
+		return true;
+	}
+	if (range->event == MMU_NOTIFY_UNMAP) {
+		pr_debug("mm 0x%p unmap range [0x%lx 0x%lx]\n", range->mm,
+			 start, last);
+		svm_range_unmap_from_cpu(mni->mm, start, last);
+		return true;
+	}
+
 	return true;
 }
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
