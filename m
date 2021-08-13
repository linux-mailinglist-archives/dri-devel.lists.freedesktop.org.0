Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9D33EB027
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 08:32:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49D8B6E500;
	Fri, 13 Aug 2021 06:32:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2076.outbound.protection.outlook.com [40.107.220.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F34656E4E3;
 Fri, 13 Aug 2021 06:32:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QP3rt7Oop0Xy1FdCC6/UdJOJ1qYzFFN1adUeI93ujDrtt6HqijezhMVxZhtNe4zqQg4bDI0QwkPTs5haeEb5MjpvOqeaPaDivcKNPvwxHeTO0Kd8jiHcDmK1zpAFtzZLydkKma5/8RDKpy6BA6tarZLSFu+NDaGUm/5SU1QIEWmCa31lUsw5WbPeOeIfpbzRi6ltYEW7jQysthYdCWhq/4OS+oTbFfG0UOmkR38CNg3k3VwTKQw0GeZM1r9DyFjbGabxJu6fk+sWZ347wjGWi9ujvBKf/T1KFfu6r9FqMWVnjQ9OZe3AHsEOEp/n+sGE/bpacoyRnSbZ5iIPz8ZyIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NkgzVl+/WajoOylKd+qelb4J16WUJoVRVM9petSZXSQ=;
 b=MQJhMlf7+Ildrwg0txriWFrC7Fz9XOQY+JDZRprZvT39L8vWMpDmAZL1+zBXbVHetOAhidtmUtaOjwK1lAIM0iCjaKgMhZ31z3NLZ3K6Rhf7H5qcaPAb4/i4a4hVZMNYD6LoUgJOmWfILsiBvfTPCZeoN8eq/wcAiTqwL5ri5l58xea6PNylknrarlqHw4Y2M1iLuJkgY8nSK0qBjHvmyI47hudVM02+diGsi6xLyyJtLeL6PXatPsc5YpO7LAtRd/1eBDk00Bgy1qik26wfzlDhChKIpWxfw/V9tx6+jZlNuRk0zKnm3kBKbpgfshP4zszmMl2P32YfjtfI+5HcHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NkgzVl+/WajoOylKd+qelb4J16WUJoVRVM9petSZXSQ=;
 b=xWO6N83k6diXu2c5KGZSWXveTEwIAF8zvE08cMlycHLdlqMU1IemS3j1LLQ1CsKFdiUeZcCWmojgFd0n9j5EAeQK3oxgd400FbcyG5R+IZF3IkMQe0IaSB333c02sVqmk7NaDomn093IlCIlyWMOGHa9h+57IofuoAUD6J4khXA=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN6PR12MB2782.namprd12.prod.outlook.com (2603:10b6:805:73::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Fri, 13 Aug
 2021 06:32:08 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb%5]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 06:32:08 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v6 07/13] mm: add generic type support to migrate_vma helpers
Date: Fri, 13 Aug 2021 01:31:44 -0500
Message-Id: <20210813063150.2938-8-alex.sierra@amd.com>
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
 15.20.4415.17 via Frontend Transport; Fri, 13 Aug 2021 06:32:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed1e8986-ae07-45ca-d386-08d95e2412cc
X-MS-TrafficTypeDiagnostic: SN6PR12MB2782:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2782F7B4BABD735DFA06D066FDFA9@SN6PR12MB2782.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rg3ShFueTcz9lEgjGgUWfjDqWVnsPBLRZlKums/Weo9h73PgG6lom36q4RqX1+HSaeeQp/4uDau/pyXD5fL6jOYwuwv7un5RfU1AV013uwo2YShIuLbETLZzfok64Li6QF4a4mg9dwZGiIrYi5ZscpHnwps+NnKKaZE/ObULAPPFsHkvfArRZKuU+Ha5h/LfQFV46dSxfe5xl8S0fIkx3AbaCtTxYv6uYU/Bg6uEyFhEkmlBh85jhB91Fr7TJWxsyaZKMaqehYSOjnw90ZHIhuVslBPEVOsyMxKh6CpWalOxX4RuIuJpWGC9NzR0FntlXnD5T9DgAVYangBpie7Z5JdvDFZXaUFAyzYbe5tTSrRIM5OBoHUDt5z7QazWOfsYpIQM7mdRddqwKjO1+wa7ugqgBK6dsz4ZHjTEVrRodG09kncCBrKjSyFMJjgSN5RYE5LcApV5cR4tEjW9UeKzwFqfQe8hKeXXRTbpI89l7kBYAgW0AXLGE3Imj/BC/tqvhBqzuN+JJrBAqSZn4E6K81SyqCTPcH+exg3GMJdGtNH4KFawF8Ol7q5IVFhd9lL1p6iO788GN9CNwTSAKeJMVK9IMyHVwJtGKHb9HIYnPUvNajDgmsHLlH7j4PIwf1tR/fEC22rcgxJdTmPhLwxHzMFkCLWFThLQQRY44xJ7vIySEUqQ9mChwKEOV+/Xsnh9FyuNX/6Qk6LB+7kEtGu1j4Ag+1XsufHoaiOtUmOwEa4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(316002)(2616005)(956004)(7416002)(38350700002)(7696005)(38100700002)(66946007)(66556008)(4326008)(52116002)(36756003)(6666004)(66476007)(1076003)(8936002)(5660300002)(83380400001)(44832011)(2906002)(478600001)(26005)(6486002)(186003)(8676002)(86362001)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Dplcw4GvGkSCMdfXZsn44I2BvKy2p7xaL7d498iBEniu7E+zntdszuKT/AlN?=
 =?us-ascii?Q?Ad8pqmxfsm1ep6+GWJcHhfwwocrD7hsEqp/f6+FcdUMnfpTvh4Jp6IZw+DLw?=
 =?us-ascii?Q?hs7Tp9hRH3EzDEbazTaUW+u5RPXaYYMuhZWZGmsOLAvIcxmmR8oGg/0NGLZO?=
 =?us-ascii?Q?aigzkqr2OisEJ+2FmksUmsG7cTxYNZljgMWngS4bUv441cj3N5rHodrW9VJe?=
 =?us-ascii?Q?Sythjzo4pl3++sPZjBqb6jqwZPXJn1BHp1M4IxKK+uSUQ6jM3euVtzFnfOQm?=
 =?us-ascii?Q?LFsV9AjWdIz5wW5qUpLlAzwxgx6NfPGrYVcX6IToQjkUsp+w4G8R1Foy88UM?=
 =?us-ascii?Q?k6jYbNM5Icg5IEQ8IhNZv/ZLZesM8JH4/nMx+Ji/jW/NbzOshuyorPZyBcta?=
 =?us-ascii?Q?Scz6UQK+Clg/Fmo3jtD1fo1TAGpk/gezK696Ov8qvt2ni5PhuJwBeFidMlH4?=
 =?us-ascii?Q?vcrFjH4GvmvqZMUBfhXUr22RIn2HBVcewQ6c+suAfx7QB5qOMtCM/C7B1sVH?=
 =?us-ascii?Q?TrNHiELKo7vwCTgvUMacxYbGEQ81jFdqSTHIoqwyV0MbCI5BfeYyVZQxD0fl?=
 =?us-ascii?Q?oDfGCVkHUNdJ1shedIswNtXOpTSAHijcXQGBEbwOOcH67qN/oVljIK3uJBwH?=
 =?us-ascii?Q?JOMreLaPWQmeg9It6GHgerJ8HWnEqtFHjwmra4ifoKRkovjohEg9glwFamPn?=
 =?us-ascii?Q?Bjsp1gUrfzFitriSqfusVJuijpgkZE0oDGgvmq+t9r5ktabgabXh07eoUJXI?=
 =?us-ascii?Q?MVQQImdX6rNqhIBhaO0JEEH263QzEegdqMW9UO+HMSWzxpgBegeRPbQRAgxH?=
 =?us-ascii?Q?eoqbzyrYE5shIGGhM12QxG45Y9iDY5XH2kHPfMx1m4ZswUKEDSzUFzPGaLSe?=
 =?us-ascii?Q?W9e40zT0rlCFn3YJlcDT5wKYdacumZOG9Erybq7yH6vTyF+ZpupQmV+pHd3U?=
 =?us-ascii?Q?qSINMZNf8uCHFbigQCmfC5/OTQL15+J5giZF3utHl2gB4bpQn21h4zX4454W?=
 =?us-ascii?Q?iN82uyJCJyUZIxcTOS2uABGCmoKpDKOtZW5DMMS5tojJi5EfKmb1EY4nRqmP?=
 =?us-ascii?Q?XBy6MmBuyl7sfg+G50emrKJexfV2FleCYXitNEsmZHkuRSFSU2whEH+tr5+F?=
 =?us-ascii?Q?0K9KNZR+s9qGHOFlXRNHG0crAYOxJ7flmzgk+JK+Ic5G8tUU/cYZACnVIgBF?=
 =?us-ascii?Q?YMOhCg0SNfphhZhMZt6f3EW9NUuOpgahCiwH/4T0B0d+MWLBI9e5aAB0cF8E?=
 =?us-ascii?Q?QeRFdDZgkrPEpVfYVgpjBcBzbU5yADaZ8ENluW6W2TdUV3qQ3lfWUrlNUwhL?=
 =?us-ascii?Q?1k/5TANkf4e53W8M+g9oI10H?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed1e8986-ae07-45ca-d386-08d95e2412cc
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 06:32:07.8396 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iy6lqwV1JSzVhgsn/JpiZBG9en2UTL//aTqbI5G0P7bkCK2aw6OIaocblNpDzqRWXfrbBb56oRqNqvTHviXHSg==
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

Device generic type case added for migrate_vma_pages and
migrate_vma_check_page helpers.
Both, generic and private device types have the same
conditions to decide to migrate pages from/to device
memory.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 mm/migrate.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index e3a10e2a1bb3..f9e6bfa2867c 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2565,7 +2565,7 @@ static bool migrate_vma_check_page(struct page *page)
 		 * FIXME proper solution is to rework migration_entry_wait() so
 		 * it does not need to take a reference on page.
 		 */
-		return is_device_private_page(page);
+		return is_device_page(page);
 	}
 
 	/* For file back page */
@@ -2854,7 +2854,7 @@ EXPORT_SYMBOL(migrate_vma_setup);
  *     handle_pte_fault()
  *       do_anonymous_page()
  * to map in an anonymous zero page but the struct page will be a ZONE_DEVICE
- * private page.
+ * private or generic page.
  */
 static void migrate_vma_insert_page(struct migrate_vma *migrate,
 				    unsigned long addr,
@@ -2925,10 +2925,14 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
 
 			swp_entry = make_device_private_entry(page, vma->vm_flags & VM_WRITE);
 			entry = swp_entry_to_pte(swp_entry);
+		} else if (is_device_page(page)) {
+			entry = mk_pte(page, vma->vm_page_prot);
+			if (vma->vm_flags & VM_WRITE)
+				entry = pte_mkwrite(pte_mkdirty(entry));
 		} else {
 			/*
-			 * For now we only support migrating to un-addressable
-			 * device memory.
+			 * We support migrating to private and generic types for device
+			 * zone memory.
 			 */
 			pr_warn_once("Unsupported ZONE_DEVICE page type.\n");
 			goto abort;
@@ -3034,10 +3038,10 @@ void migrate_vma_pages(struct migrate_vma *migrate)
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

