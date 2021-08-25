Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 321763F6E00
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 06:03:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 833536E11C;
	Wed, 25 Aug 2021 04:03:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2088.outbound.protection.outlook.com [40.107.93.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 681576E113;
 Wed, 25 Aug 2021 04:03:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aPHAJpxyS9TpVw+Y28l/DEgd09I/24emCwZuBJ7kOi6AfSArvmxsgkDnBmC87075/DrN6FRWIRYcYyhdGOrFBMWrK4Wzqdm3lTBnGFNU9wDdWWLBw/BlMMe1YqQL6k/niQfwB5ZpOYSe1vECibKq4Ap6xbFEtjVqsBwqoKYhNq97lzrbFm/M0B897EWjROAvQ+aPI4TPi6KfrK0tnNuuUV8IINK3wE431g/LC9alHBknaJeB7qCOtLULKtRUr78med7OgRbu4JC7Z87vtVVbFwiY/x1ONo6aFNc7L7/3XB0rLoSt5zKxDDlwF8Fk/nRJHeoALIgREF36S1XYOZdl+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fQPvpQvAObOGLCrtDQx0fOMFpE3uCAqzCz3ILT9YB9U=;
 b=JRFSqk3LrFbuiqtOdSL8xJwXZOkd9g5OlO6QcOwms8Pq1gRGrZjVBMAWd7d22llGEnuA4S1vUdem/8Yif0jPb1vbOlZaPrNCtxt7k+q5rekoY1oiGJM76DSCAZOsJE2kqVE/ThAz7+jHO5A2aZLrIGjBIAXLPTLMgT1L/9FwPA6nZiCwtW27qqdOddrI+jjA+e8GOaLGSQSjydWSLfzK695YZY8Eqe043Q7NMCH6ImxRgPNnH6ycqiCfEXKLebMGNFVKKU6M9fw6NZH98F0pLu752SIbTOuPU/a0kDj4bOV44Iq2AUZ1bqY2CfxO8PtihKH2TGUr86c4r9Yih9MATA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fQPvpQvAObOGLCrtDQx0fOMFpE3uCAqzCz3ILT9YB9U=;
 b=5rN2fBtCW5CJVHiLsZZ6pg0o3xTu70o9VR3zIUgKp2nrXBwD02am6y8+LVMDBfIP2CWyorPvZfdLqfi6foeyIFQmZt/f2BfdyNdB+wgt7LL4nC1sxuaSuNBHOsVY3dIy+gteqFsEJAmF5sDOjoNxKk9l2Eec9MszRnUlSiQsgTU=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN6PR12MB4750.namprd12.prod.outlook.com (2603:10b6:805:e3::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Wed, 25 Aug
 2021 03:48:47 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::855b:1f8c:c5d1:331f]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::855b:1f8c:c5d1:331f%7]) with mapi id 15.20.4457.017; Wed, 25 Aug 2021
 03:48:47 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v1 08/14] mm: add public type support to migrate_vma helpers
Date: Tue, 24 Aug 2021 22:48:22 -0500
Message-Id: <20210825034828.12927-9-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210825034828.12927-1-alex.sierra@amd.com>
References: <20210825034828.12927-1-alex.sierra@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0190.namprd04.prod.outlook.com
 (2603:10b6:806:126::15) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SN7PR04CA0190.namprd04.prod.outlook.com (2603:10b6:806:126::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Wed, 25 Aug 2021 03:48:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5748ab7-2501-4ccf-06ee-08d9677b3e54
X-MS-TrafficTypeDiagnostic: SN6PR12MB4750:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB4750D5615D8CC84709697C6BFDC69@SN6PR12MB4750.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rcNwhrv4/LP8IA/DLTBeV8NEdhuvukhyW2wxGldaStA9i03F+7rbUPvC6cq854wk3DARTIxg10aLeQWVnmhfUkzQvLXjbPMdvIs7y3Y2hbKpKL74sBaz8Juz/NQsCaQhDBaQintOXeOA66UycAL/oEIvNEHNnKb3YJioccSOYEjvGd+0ckvce6+1CSb1YVPxQhoe5s425MZyrK0N80MU1mygscNDNPvFcZKk83Y3DHK0Tq0l/WgLVwCO0eK1bpX/Sh47dnmLcripnNFhslEWZVQ4xp6tW3DACQgiCxuVHmAil6r0yRwXlNaBJFNi6oYo+WW9iRU9XWA2Za5PfqokfHKV6PbKqyxtGwSm4uObVBg59Ep6o7K4XOoJxRHsUgdKQIIBuVU7McuoE6WNZsmRlBEZoxXcKJTpifUL0dqNZxLoLgPCpqfB9OD+haFhxR+11kVdU201+7NuO4v+S79KG3omPt01eBzTfRGfmq52Q4JS6WroK4HipNdZiJ+0qT1hY3tfdESJQ/VyKBmIcT7c6vcK9zc3ppAkYzIcGQVNfBQLgPkxzNjZiNzvRoIngbxLNNFGjunevH6KwhniHtrQ1jji7S5iYyJ2ZotzkwQ0Q5/SRZRJ3BS/C/C6oo5vZQ2riVLU6nDXo4UVRx/TOsnLnc4kmwwm+m7dzx32SQvaitQxdcTwU5FPwK8PywtmZDyk6OCGQcDu5TZT9jwoVcwJ4Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(7416002)(6486002)(1076003)(4326008)(86362001)(7696005)(44832011)(52116002)(186003)(2616005)(956004)(38350700002)(38100700002)(478600001)(66476007)(66556008)(6666004)(316002)(26005)(36756003)(8936002)(5660300002)(8676002)(66946007)(83380400001)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z4fMhxm5LHLWFxzNY4km6Wgd0UtfKbsE5+SmMO1K0knqKZAWs2tJA4yqu6+a?=
 =?us-ascii?Q?Z8HfRYxclWvwvQczL4xb1ZfQhn13ZbvUUm2BKUlo7GAwin6V2KtWqeFE5feG?=
 =?us-ascii?Q?NAocfU3xRh+8avc1CEMd3jr0gXFQHHJlcBuxF0IHeeJZ3KXPFeBHBWah41zC?=
 =?us-ascii?Q?iSAdKQ6jZ9XE3z+LHEYxIQr9FJ6RNICJbsaoB/yiMfNsNLu6g+VnVjMXr3v7?=
 =?us-ascii?Q?EhV79zhlDeuBrbqSQeAb59nfgLtHidVZNXuJFQqgQ3sU5b6En/lLWzyG+dk9?=
 =?us-ascii?Q?A87sraqA7zZsMKC8YbUdgaKRuABzq+3xzfe4t6/fACWmwDXFGxVlOJF+bRz4?=
 =?us-ascii?Q?tT+Omr94QS2tcNDZ3LwDIBHa97Vv0NK4ArTNdhqfXNlbu+ZAwqdLueilSMW8?=
 =?us-ascii?Q?Zsb2nzb2uIx+nYHKzu+sDcBGLOTTfywUuvMmTLCUZwPEdmbc+7UfdGpargZL?=
 =?us-ascii?Q?K0BddzfQu7qjSVNcXy8FOD4h3CSUpYoJydEhpfXn4QknkSyg7YQ+eFFc8nMc?=
 =?us-ascii?Q?q31hyxN+whzme8i2mPsTTWQYwx84zzy0PailYqNtaIOUmLWn6ZFNwDBGc9vO?=
 =?us-ascii?Q?J7yZY8WhX+jUwtc87Qq8rpzwIIVFCrd85iU3R2vVlTrxkRf0GGyBEirEtuc7?=
 =?us-ascii?Q?MNRpmoFjI1RZsbajBUj8zwNU2pc+XCiJ21YLGHIQBbfC6/5xyJi7USd9rkVc?=
 =?us-ascii?Q?iP+GmS/K8PD+tfEQzdIJvj7I5ah6oX3ivaIBO0oj3oDeL3J1UDZ5jMnudThD?=
 =?us-ascii?Q?eGj9wHANY/YATypjCrLXC2t8y7wIERptevYjo7/na51Mo00eC4jGmst7Qz5h?=
 =?us-ascii?Q?YkwBymw3OzXnCbKXrBcPbXg1x+h3dKWf4chPir9tAOJDGD8SyLnuEMLy5pRq?=
 =?us-ascii?Q?r9Zazrwvw+4L6oguMShoMaRDAnNG5qTbZBdWm0duxY3z5u5RToCYMUvrEsLf?=
 =?us-ascii?Q?z2o0CeKV8DSmDLlSfe82fWTBSIvpzspINhFN3vGVGqE6yyU4QuyIb1ZTafAd?=
 =?us-ascii?Q?rrqMC0hg5wrS8TksIb5m65mxmKdNKirkQMSBxfQYe6x1K3tsYZldc4q9riyW?=
 =?us-ascii?Q?QCW1bewbevXr/zjkG9ULeBaGkJEet9jhQfqkoHGB5YzsfUE0TymjRrb6Mq7H?=
 =?us-ascii?Q?DBiCfdbEgewhz7C99/4ge2S/pwLUYEfeOkazWaeGa1YF2SXAnVkafRxZf0AS?=
 =?us-ascii?Q?Jg/uOcAF3hIKzMI32+W+O/e6ZdVWBNWqZfgkbeG0LsTWrcqgn30CIzKXE9M1?=
 =?us-ascii?Q?8sonyGL5NPpNrnYxrE8fNwQbowQ+muAKqzDxXDiZDMe1L9V9AOHeBGerZYl1?=
 =?us-ascii?Q?xNxv3aw1NoeuH8kqn5XgJbEm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5748ab7-2501-4ccf-06ee-08d9677b3e54
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 03:48:47.6556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NjH6x6ZH6K/pUzLL6sGRR9GpWT2bWjcySxTlCltq82dIbptInGVw7Je899WssbSf2QeN2/h+Eayu2HNmXAUL2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4750
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

Add device public type case to migrate_vma_insert_page,
migrate_vma_pages and migrate_vma_check_page helpers.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 mm/migrate.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index d4ae2da99607..09817aded633 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2566,7 +2566,7 @@ static bool migrate_vma_check_page(struct page *page)
 		 * FIXME proper solution is to rework migration_entry_wait() so
 		 * it does not need to take a reference on page.
 		 */
-		return is_device_private_page(page);
+		return is_device_page(page);
 	}
 
 	/* For file back page */
@@ -2855,7 +2855,7 @@ EXPORT_SYMBOL(migrate_vma_setup);
  *     handle_pte_fault()
  *       do_anonymous_page()
  * to map in an anonymous zero page but the struct page will be a ZONE_DEVICE
- * private page.
+ * private or public page.
  */
 static void migrate_vma_insert_page(struct migrate_vma *migrate,
 				    unsigned long addr,
@@ -2926,10 +2926,15 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
 
 			swp_entry = make_device_private_entry(page, vma->vm_flags & VM_WRITE);
 			entry = swp_entry_to_pte(swp_entry);
+		} else if (is_device_page(page)) {
+			entry = pte_mkold(mk_pte(page,
+						 READ_ONCE(vma->vm_page_prot)));
+			if (vma->vm_flags & VM_WRITE)
+				entry = pte_mkwrite(pte_mkdirty(entry));
 		} else {
 			/*
-			 * For now we only support migrating to un-addressable
-			 * device memory.
+			 * We support migrating to private and public types
+			 * for device zone memory.
 			 */
 			pr_warn_once("Unsupported ZONE_DEVICE page type.\n");
 			goto abort;
@@ -3035,10 +3040,10 @@ void migrate_vma_pages(struct migrate_vma *migrate)
 		mapping = page_mapping(page);
 
 		if (is_zone_device_page(newpage)) {
-			if (is_device_private_page(newpage)) {
+			if (is_device_page(newpage)) {
 				/*
-				 * For now only support private anonymous when
-				 * migrating to un-addressable device memory.
+				 * For now only support private and public
+				 * anonymous when migrating to device memory.
 				 */
 				if (mapping) {
 					migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
-- 
2.32.0

