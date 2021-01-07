Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC682EC8B1
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 04:03:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 648556E43D;
	Thu,  7 Jan 2021 03:03:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2065.outbound.protection.outlook.com [40.107.236.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AAC16E43B;
 Thu,  7 Jan 2021 03:03:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jgtpdg+aH860wPCDdx+XIwfSBFXfrKz7j+V0J3Unagrg5nnxdW4ZYiFPgnPNnPh7C/Y2IfSKoehcOJqolqq2kaKPgNzjfJUGDSmTgZW4DVdxDvH2ZWmlCj4samHBjED1IAZXvurWiLU6gCdzINIIw9S6D+7HaWVOfz5IVPPFmU0TiJZnKgYUXeFB1tHs+VowZpjNbBbHpWIe6tAoWHvhzkuE79YiT2EjGxXJQfIIOCMeawyH8gBfIPu2457C6/PyRHSFqUkuhtGKAtJYWnapQBTOsDbKxwoJym3emL+5CXzLL2ZqW0Qd5wGiTBvnGq//cyO9PgbfVlmzB6IW0D+TIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mOy9UCzQqnLFNONviPjh1LuSWDDoZPkWdVtQGnaNc3s=;
 b=Y/4pHZrkcTkyTXM7NVYp9P5ZPcHk/kJbsPkZT2a11F0M3X6TZWiE7bEsRNN1cenM+bqCYGilfM2OqJJZiEouhr36As8ry7pKkNtxl7kkgp2p2EZgODQ89ewE3v79KmIbFwQp7p3E9YjIOxNLTh7nqEnkMLWbTQVkoJ8EFq3TlOXtaO/HZRb6LURplOhAuwkTAo9fTatFOY5hEm4nwv6k5iADmdVj0HjrzqkzjbAiB26K9LQ5tNOD5TWQjrAbTwUhef2ZW/EewzhWDlORAetfyIq9YrNRZo9TfINF9LAad2dNG/UQSMgpLt9QobGNpq1qVSgF7IVAhgARCONR0RiXcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mOy9UCzQqnLFNONviPjh1LuSWDDoZPkWdVtQGnaNc3s=;
 b=zltNkaVXuMr38+sIxXM2hV6KBjNR+vb6/uwEfYcCC1DbhUtD/WCPlDuszqiVUYrsikp5skJ6SJwFA8nxq54OE2meC4ojiAqdwDtHlhIGoph64kDOUPYy/zt760Isy45xkNQtu+kriS/SRfLAQc6TgHxmRngW20VRVnpYtipa+/0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4408.namprd12.prod.outlook.com (2603:10b6:208:26c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 7 Jan
 2021 03:03:01 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b%9]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 03:03:01 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 23/35] drm/amdkfd: invalidate tables on page retry fault
Date: Wed,  6 Jan 2021 22:01:15 -0500
Message-Id: <20210107030127.20393-24-Felix.Kuehling@amd.com>
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
 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 03:03:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 75631755-935b-4752-22e1-08d8b2b8bece
X-MS-TrafficTypeDiagnostic: MN2PR12MB4408:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB44089D5C44A60D9FBC6C9A7D92AF0@MN2PR12MB4408.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sxpDKX6G/a3lewL5Jetk8fO/8G5QawPyhCBSDXkeuY1TkeNx89BoQkTjfSAAL+7rubQrCd7/t4Et60M74t5O0xASbSKi3P0v8oyMhTVaRg7k5wBVXm2xGrnxx8nwecIoudMzXvVKuM9ZEweIwx4YjllurmyG+/OrWqw0j6UeOwOG5zDsOOOSs0fg+UvJDy3y99uwjAshNS7J/ia0AtsSf/CNIdb0dMdbaI+hOhMLQQqVN+On6/pcProUq5xbMxcz9ZdnWtI5LtOmtl1AdNeYPEYsWu3XL4ZSYAEwWSjeDnjH1vUZ09SYgUe70Kx3pXPaogeB1KPZPs5Z5VWXzBCyN27aIiAN/vbZo0RhE65P59Am+i15U9qVwn5k3WkN58Y06eZd9jl6t/rb7wKtzYqLaQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(8676002)(2906002)(86362001)(450100002)(66556008)(4326008)(66476007)(8936002)(5660300002)(66946007)(1076003)(6486002)(83380400001)(52116002)(316002)(7696005)(2616005)(36756003)(16526019)(956004)(478600001)(26005)(6666004)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?VwMckAuFd4AONW91Mu6u8znxapVHGjdf2HLKp6NeaNK3Vx+qJfZa/E6pdKAm?=
 =?us-ascii?Q?lWOmT8D7fMvxIGUXEzpiIEB/nJ2BRMJDNw0JnVnOM1zIYYg/fdLYT3VQsa8f?=
 =?us-ascii?Q?F9XPALp7zLlSGeeVxuPw8dUoQaFDnra+vfzaxsb+ZGZwz4cTrvnESxPL13mw?=
 =?us-ascii?Q?8E9ZxiYIkTEi8tKdT8iXRdqBjBhBXBP0FTcxOw6lns0mGtXZ86y586C3wLvW?=
 =?us-ascii?Q?uSJWey56rxzfWde8ebZTgfZ30HiT/eRp3tqgk2R3ebL/egYgOFm9ZYsTbB0z?=
 =?us-ascii?Q?xkAjjNd5AAFpgiVwa1XoeTiKTmPg3TJkolmGlglMzypQ3HaLJK2XdZ1bQRh+?=
 =?us-ascii?Q?zGn2TIeY5eYfqEEVN42q8/ghpbR6YV1F0h3r154pSZacW83eCVTUcUDXRCQA?=
 =?us-ascii?Q?Rp6Xqioj0du2U/Q9QPInX2ZQSBGoo5NP5ZQwvqruysShs7WykRt3ccXGMy6W?=
 =?us-ascii?Q?hT9uNXE4kEUMelNA7zycNFpIGVSHCMcojwMehM575LRnheBKC8K88yy5ttZ8?=
 =?us-ascii?Q?jvFVOm6U+LDgYMdyxPxVcO5uRMMIMu12Mgb/CpRtb1cl9N339XoJUO/kU5i+?=
 =?us-ascii?Q?Qt1eGqwvPeHIetQ23sZ/W1Ea98FknP+yo4pcmZNvBCOyfG6lgV6rWsL4jQQL?=
 =?us-ascii?Q?Tz5UUOrjM+fdv/5UP14eSUHlzPzBXAtEJdwdmsUiruak9XUUIaxEUirmqS2z?=
 =?us-ascii?Q?g7wluOwWMmTzcABa4IoeqgBXgFB12Ur9szwNUErHPLMEacOYwBUgU5cMi97d?=
 =?us-ascii?Q?Vl8awX7aB9tPbNaicAhYXDmNYQ3FGW1WTCKwIJhRVoumwRNZ0Tp5ZbBPFh/U?=
 =?us-ascii?Q?HrIRRY5WDXUBp1nmZ0ar8mnCqfTenLXUjM37jmfz0sopaWoV02Egso+D1MyS?=
 =?us-ascii?Q?lMMsohwcl/38m4wbPYDAb8pNfnqCUhSpdmxcDN+GGPcDUh06pl1lYsENKRDf?=
 =?us-ascii?Q?Mc8hCW84waQAPtTbyyAAreZxLQjcZQqWxrKBEXuTGOWoACDXfP+zJ4WOCA2z?=
 =?us-ascii?Q?S29K?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 03:03:01.5432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 75631755-935b-4752-22e1-08d8b2b8bece
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yhhUL+8sSHn++z1OXFO+uWPNtdbQY1lYSszp+GOWNzC8U9hqoOO9U6KSdT6Pu5SCfm4I+dWGAJTkSUlxDZW6tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4408
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

From: Alex Sierra <alex.sierra@amd.com>

GPU page tables are invalidated by unmapping prange directly at
the mmu notifier, when page fault retry is enabled through
amdgpu_noretry global parameter. The restore page table is
performed at the page fault handler.

If xnack is on, we need update GPU mapping after prefetch migration
to avoid GPU vm fault, because range migration unmap the range from
GPUs, there is no restore work scheduled to update GPU mapping.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 37f35f986930..ea27c5ed4ef3 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -1279,7 +1279,9 @@ svm_range_evict(struct svm_range_list *svms, struct mm_struct *mm,
 	int r = 0;
 	struct interval_tree_node *node;
 	struct svm_range *prange;
+	struct kfd_process *p;
 
+	p = container_of(svms, struct kfd_process, svms);
 	svms_lock(svms);
 
 	pr_debug("invalidate svms 0x%p [0x%lx 0x%lx]\n", svms, start, last);
@@ -1292,8 +1294,13 @@ svm_range_evict(struct svm_range_list *svms, struct mm_struct *mm,
 		next = interval_tree_iter_next(node, start, last);
 
 		invalid = atomic_inc_return(&prange->invalid);
-		evicted_ranges = atomic_inc_return(&svms->evicted_ranges);
-		if (evicted_ranges == 1) {
+
+		if (!p->xnack_enabled) {
+			evicted_ranges =
+				atomic_inc_return(&svms->evicted_ranges);
+			if (evicted_ranges != 1)
+				goto next_node;
+
 			pr_debug("evicting svms 0x%p range [0x%lx 0x%lx]\n",
 				 prange->svms, prange->it_node.start,
 				 prange->it_node.last);
@@ -1306,7 +1313,14 @@ svm_range_evict(struct svm_range_list *svms, struct mm_struct *mm,
 			pr_debug("schedule to restore svm %p ranges\n", svms);
 			schedule_delayed_work(&svms->restore_work,
 			   msecs_to_jiffies(AMDGPU_SVM_RANGE_RESTORE_DELAY_MS));
+		} else {
+			pr_debug("invalidate svms 0x%p [0x%lx 0x%lx] %d\n",
+				 prange->svms, prange->it_node.start,
+				 prange->it_node.last, invalid);
+			if (invalid == 1)
+				svm_range_unmap_from_gpus(prange);
 		}
+next_node:
 		node = next;
 	}
 
@@ -1944,7 +1958,7 @@ svm_range_set_attr(struct kfd_process *p, uint64_t start, uint64_t size,
 		if (r)
 			goto out_unlock;
 
-		if (migrated) {
+		if (migrated && !p->xnack_enabled) {
 			pr_debug("restore_work will update mappings of GPUs\n");
 			mutex_unlock(&prange->mutex);
 			continue;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
