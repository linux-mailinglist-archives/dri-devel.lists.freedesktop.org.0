Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DEA3E9E9D
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 08:31:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D4406E2D1;
	Thu, 12 Aug 2021 06:31:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E43316E25B;
 Thu, 12 Aug 2021 06:31:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DlEsarxsxNuy5dvM+wNCfkfj7wDSLIyL4ZyOXkc5lLc+7LF8HN6QPB175CKHIuFhX0c+STlNUxkp0QFW3HLrIyYWrMieqGEBhYDMqonmoLsZ78zvbe76Kjif2tVqfh5KqmdkFdAVkpu8HuaT/WGnoaPIY59WhmooA1txcPKdbtaIw33T00YVkyzXid/i65HEin/+hSH3oxhHi3Ss2XGCFEr0bFcPUY46rOuZiaKSmAMPZKr84014uqjNuW0VOBDEO1aOcUYDwqwP8QIBKPYmjzIzMdgRcx7PJv5mxEfV5Q+SwVVMRJsOX8nd5+WkOMBicN8XClhHVdg7u7hL+Q/ecQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y4+r/IEg4rDKbRnDMnysY04/FdE2VvCumV6SQrZ8RLQ=;
 b=K1OutIEAS8xOVVCChd0gKCpPqsQQDJ/n8U783aQxAxxi+oRyeJ0LShRA1Mp5ued6MpY8oSV2Cjy+J/XOzrR2nAhVcbIvHpzqu/fjp8eEOaEgh6JBR0WFjE0oMKvlYX98UcJavlpMq7YwDD+VwvET7BXLqYqiFR/ho4akq3hvECOVaIOcn6nYMmj0nyn5MQHfiELfNy9ubx9nOkXq0Nxjy9t8xgbxaWoV3ZjDMVCMR3h8fCLM8VZ/XvR2Nnaww6w+HyK/UV8VbTjmOq4baC8QJHjoSuAmmB0ZJp7qNSgd+vJTBHN67jqfv9SYyf72zNWLYvmzjYy0d7QyyenLl8y8Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y4+r/IEg4rDKbRnDMnysY04/FdE2VvCumV6SQrZ8RLQ=;
 b=h/vdQ/l4EE1vPMVSoTmWupQ5qCF6y9lsScPCyXLPooNTUUYuTgkeemfwf10GkUCt1E22mb59FjEyWs1GtGvxohSAvJl3DK5kjAO3tK4xzgRJajTV3vE6GLA7DTuq9CtSmIV76y9ZOrfqOEBhsP5hBcwd21iNpYTNG+oZJ35Mdlw=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN1PR12MB2448.namprd12.prod.outlook.com (2603:10b6:802:28::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Thu, 12 Aug
 2021 06:31:24 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb%5]) with mapi id 15.20.4415.016; Thu, 12 Aug 2021
 06:31:24 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v5 07/13] mm: add generic type support to migrate_vma helpers
Date: Thu, 12 Aug 2021 01:30:54 -0500
Message-Id: <20210812063100.31997-8-alex.sierra@amd.com>
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
 15.20.4415.17 via Frontend Transport; Thu, 12 Aug 2021 06:31:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b4c49fa-afc8-42c9-9a84-08d95d5ace64
X-MS-TrafficTypeDiagnostic: SN1PR12MB2448:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB2448E59E3D71059834479F2CFDF99@SN1PR12MB2448.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TCjTgwFkhtwFxo1np2Dwyuh77GLzXkoSaaAno9zYVEvZX4lDgSXVP+MsgsHCYFQK1aSojNuVw7OESsjw9r1krR4rTfUIrSbe+QoHcUkLCfv2ma05l5fdQb4bR+pEcOY6xI7h7/Q/PSA+ZW0Q1BCTVTcppVBusnlAu65GYDagaRFSp4ENxhHCJsbM09Ws3Kk0iYabTd2EODcsPNQ8RgBdwBcaxlCuZu5tUuUZYXBJsmD7RGV2T1tBSebdpJ+IabSonWccc21F9WSKWkwBKOqiOUPaCjNfSt9Y4uawAex9YB0+0hiikshf9HuHHUeXdtXUYRKG1XVqhPB9TOPj523EQB1HT1tYmZOM0BEW9OVyEXvlhZe6RUK1wPYkiMYwwn2wDpILSjWMxn30pAT1p9bfnZODM29KrY7KcCtqBmYqUIf081Ny/ZIhN3NOq8hXBQkq8lDUZs6L7dMTxsa4wcMmpaGHKFITRjgH9evN+Tzcu24r25FBejGyEyhEclXBq5qUTFZOMKa72bF3HkbG+64b3oEI8JYf6QSRSqFoWbAgbXWA/K6/XdQ+VfWlv6p/HA2DXkgHxhfFoAR9lWcUFZXhMq4kW9C79hU/vTaXNCvQ2YDucoGhKk5IaeWtYXX1BW8i9i0aJG2ONFAvsijCjWosHxsPC0c+GigpczrhLsTt4fWOsTJNi666nhNjJNnplszoGkhgwztdYOLF8qyZWld8qH5e92UdzmL7RLqpZFeJJhU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(396003)(366004)(136003)(346002)(38350700002)(6666004)(186003)(66556008)(66946007)(2616005)(478600001)(83380400001)(38100700002)(8676002)(26005)(44832011)(2906002)(66476007)(956004)(52116002)(7416002)(1076003)(4326008)(86362001)(36756003)(6486002)(8936002)(5660300002)(316002)(7696005)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aP5FlJIEV/CG5eZsPypuqz+t+KlGHGuEmotiiIEIxnZu/PWprJ+LqT3R2HSr?=
 =?us-ascii?Q?Sy4YPnjGkAd5s5cPX3EBK24qq9DQeFjJWYR/ZOXdRwleG9rDuL0w0MkczL9y?=
 =?us-ascii?Q?piRLyKy+t2I+WIQ36CP6kK55EK3zEWyRAcnRWa1tn8nKRcwFDgudFEX5HCGV?=
 =?us-ascii?Q?FCGrU+/WPx64BJJ4AUPkbNNL9jCroOUfgcoHsVJWDQWazqKaQ7T0QzcqVIKR?=
 =?us-ascii?Q?+ds/EmBJsw6IoM36k3SbBMQD1vEmUFAOMbbC2+/4WYzIUqR/i/DDFTCTLcYc?=
 =?us-ascii?Q?UiPdb5OzT4x4DOpwRm3NrjoGdI1f3oqCBVp0/lqWZ1E5Mtsp70M6AzyjZd2J?=
 =?us-ascii?Q?2OlsZGnAu3Q3VqUP2oMVpmUffMdsxuViGIHcMfCu4YfajmfmG3yIDDUtlUli?=
 =?us-ascii?Q?NB54ohLACdQ3XkFmbsdAxN17mh4JuFdBbERTS0e+Ij86373+2ASvt6xt0yMg?=
 =?us-ascii?Q?Y9GG4X7do7KyE66XKJ7uQR0rVrTcr4IMyv1Zqpz+Fs7uADTFF+tR/PmNp9Xf?=
 =?us-ascii?Q?ChrZZYglwPI1dVzryRkYu+Na4Zotpwu+rA+aHsarNQxNf5kaz/RL14OsyH32?=
 =?us-ascii?Q?fz5XQncFXDCzdzGrZHIb9mUziKPSkL8vXvppOO1zzImy9BmnJ5xYF72l0mNO?=
 =?us-ascii?Q?jxVB0wn9fV/sy2X4UOeC8TPCD30JFopdMGRU9ExUaT1Ke/DzyfS8+tWSRJp/?=
 =?us-ascii?Q?i7BOMwu7VQszQ5SzqmwGKwPYNemlpiL91Lx7zSOTmPNmWhTcRfYm7lQYIYIL?=
 =?us-ascii?Q?TqqJ1PaLyWuvqIAbHp/093d/GST6GvQbDhFsXPbSeGv5XvibGsWiofs7vlZh?=
 =?us-ascii?Q?qUMKGxLxs5/649j/xXw9+37h9AG+m7nghItDG+ZcW18Gb3bCRb5sO34bhqjb?=
 =?us-ascii?Q?2gW4jPfc/mpMUKXaVc89DavPokx0zQc93quO3dpP0go5GhtSg57skUytDsSH?=
 =?us-ascii?Q?F9ei6oVhQhfmxUJIl93T1xFYheu/lPoyTrWeu06L9kdecffRO+iBVMOpPg5H?=
 =?us-ascii?Q?xY5KuJ3Ru9P8EG7GUlb8aEDnCwi9JFyfe9bgpjnhrtr5Te6f10DJ8AunE1FJ?=
 =?us-ascii?Q?DzZf4JcLhJs7ccD1fUzEUb/cHaGkFSxZG55mYApfm6qKlEj0/ZvQTeFBSZgX?=
 =?us-ascii?Q?CgyPX9qqtRZdjR++o1heGpPIrGAwZFdl1cP09ntvx6duefp85JKfPmfJO3kT?=
 =?us-ascii?Q?5vE/YpQGj8CSkPtqq1tgPEI4SoXWW4oYDnIHjyNPaWOYdjyteQhBnsyu2N/s?=
 =?us-ascii?Q?GMrwW12FBLfA+dHt6wrvF9oRL8xWeShsu5xTW89WP9QR0ae9ilOxXFrefQwk?=
 =?us-ascii?Q?bv1wzahkyJMMn3wbybCy5Qto?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b4c49fa-afc8-42c9-9a84-08d95d5ace64
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2021 06:31:24.2288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qBmIr68tA2ARHgJVZoNxQgaxKND5jIHjUZ/yQfKWsy+cjVtlvUKTTkaGQYtZA0h2un30RF7Ce5qOrf224XZO/Q==
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

Device generic type case added for migrate_vma_pages and
migrate_vma_check_page helpers.
Both, generic and private device types have the same
conditions to decide to migrate pages from/to device
memory.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 mm/migrate.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index 8c2430d3e77b..7bac06ae831e 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2602,7 +2602,7 @@ static bool migrate_vma_check_page(struct page *page)
 		 * FIXME proper solution is to rework migration_entry_wait() so
 		 * it does not need to take a reference on page.
 		 */
-		return is_device_private_page(page);
+		return is_device_page(page);
 	}
 
 	/* For file back page */
@@ -2891,7 +2891,7 @@ EXPORT_SYMBOL(migrate_vma_setup);
  *     handle_pte_fault()
  *       do_anonymous_page()
  * to map in an anonymous zero page but the struct page will be a ZONE_DEVICE
- * private page.
+ * private or generic page.
  */
 static void migrate_vma_insert_page(struct migrate_vma *migrate,
 				    unsigned long addr,
@@ -2956,13 +2956,11 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
 	 */
 	__SetPageUptodate(page);
 
-	if (is_zone_device_page(page)) {
-		if (is_device_private_page(page)) {
-			swp_entry_t swp_entry;
+	if (is_device_private_page(page)) {
+		swp_entry_t swp_entry;
 
-			swp_entry = make_device_private_entry(page, vma->vm_flags & VM_WRITE);
-			entry = swp_entry_to_pte(swp_entry);
-		}
+		swp_entry = make_device_private_entry(page, vma->vm_flags & VM_WRITE);
+		entry = swp_entry_to_pte(swp_entry);
 	} else {
 		entry = mk_pte(page, vma->vm_page_prot);
 		if (vma->vm_flags & VM_WRITE)
@@ -3064,10 +3062,10 @@ void migrate_vma_pages(struct migrate_vma *migrate)
 		mapping = page_mapping(page);
 
 		if (is_zone_device_page(newpage)) {
-			if (is_device_private_page(newpage)) {
+			if (is_device_page(newpage)) {
 				/*
-				 * For now only support private anonymous when
-				 * migrating to un-addressable device memory.
+				 * For now only support private and generic
+				 * anonymous when migrating to device memory.
 				 */
 				if (mapping) {
 					migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
-- 
2.32.0

