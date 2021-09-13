Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BD34098AF
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 18:16:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E3BC6E1F3;
	Mon, 13 Sep 2021 16:16:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2076.outbound.protection.outlook.com [40.107.223.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A1C6E1ED;
 Mon, 13 Sep 2021 16:16:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qe8yKQlvNjE2E+VDJ6UI0yPFHKEN3SYbQ8MKMcBP5t+8YKazyniBfrCGULsumbgL2S3Eq0I02+JQpDJ4UiSH5WFAsGj6rALzI8aBZHB1aK7nydPOyf5N4xJRu9TZ9M7crWzHf2iEGdMWnXRpMaUkGYAyupxYnHWY1BNPJZPmlpQD7lix3+/jtO7qoh0gLQmdf1o0dfq34ZHj/KuQg5SE+Yf0U+hPH8jDO4A2EZYst6PfdgBcFdB4pPGyDAqNWBqORHrjF0dpEWAz2unfZFKwhztZvqxgWedHjOE8W7JIwVBFwTfTATn5MBW9budI4M199XcfBNif75tiRYhUPCGWqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=82oeVwrYnrtoo3t65wmfHCT585AIRkrgZr2iPzW4COc=;
 b=NxziQBkI1RHoURCFg3Dk/U5t3vzRADJfFlu6j3DBBJiaoBt5yZT+XGs+2X8thPpLoo1CLWf9vn30FUVaU4Do7JXyAjWzoajaKL8PARwpTmx8Q0T/cgHnJtRjRWzmKAzY3rwH5IWojIh73ESOxiU2JfR7LPK4x2WgITbKgOy8NWLwZWz4Olmw5qtRH+2LHnc3FFteEq1+iCIXFNFrYSnTLmKKJFuIrLHMuyey0ewFxkLU0OcAo4SMTOSK6FgLtJ1KfzrXaJ6+DulicUibiJQQtGHuWrnRe2QWHhDfQa8oqCWPmYI3AkSnd9pmBwW3hesQ8sySMk/EQnlMNa6muOeH6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=82oeVwrYnrtoo3t65wmfHCT585AIRkrgZr2iPzW4COc=;
 b=EUy21Vz9/NRMJvAW6zSJDrL2DIa0UcrGjA4rfCBaGpZLthQryqMA5lEQuVQwzLJnKBBNPvJK6jnhgEFWiVMgLBX2i//cymA6vme5AnrAxYNqM7ckTfgyjr0zC5xEm5emaVzdE870oAncUI/eWYnKQQl7WZgWVBE8voAmQpYgqyo=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN6PR12MB2767.namprd12.prod.outlook.com (2603:10b6:805:75::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Mon, 13 Sep
 2021 16:16:19 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::f1aa:9adc:b4f:4d14]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::f1aa:9adc:b4f:4d14%7]) with mapi id 15.20.4500.019; Mon, 13 Sep 2021
 16:16:19 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v2 04/12] mm: add device public vma selection for memory
 migration
Date: Mon, 13 Sep 2021 11:15:56 -0500
Message-Id: <20210913161604.31981-5-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210913161604.31981-1-alex.sierra@amd.com>
References: <20210913161604.31981-1-alex.sierra@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9P223CA0015.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::20) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SA9P223CA0015.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 16:16:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97ed0f33-e87c-4b9a-57ef-08d976d1d20e
X-MS-TrafficTypeDiagnostic: SN6PR12MB2767:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2767791044581AC3BC46AFA8FDD99@SN6PR12MB2767.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:635;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O0sJXvWo8eoW8JhnXOuP0bp3kpa709Vsc2EBjQTRMZfF56mfydhQ/bxXqPorQTjjP614wafUH3UpZmUJ/JwQcGUW76XOnJ+to9Ot8QQjdvpuiOe6wWtp20iwVhQoc6V03t7S0Glq6+nrk2M+fOUc8i/UYFHYLysaEI7Ut8jf0L4nzAoEAVxrBe1jXm25zd2Lpl8U7l7xJp7LlXhmCxlTH8fCtCO+RRRf+2+f4dc6D75lXuZugtMEpi0SprzHtTQtsreKWMEoYSVKoecP9JK5CmeSvHcxQDV+YX/T+BbdV0XZjaeKH+9zlMLNB+RlN9TZLPL6CAfk2EAQdvoHyQnFWIvJ9wPf43+nUUUKESvk20nuW9bx6h7duOMM/lV1xg/1+M70K791CstuO/vSuGgsV+93/8bbEP/IBoPaq/4+aqv6vn/bz3ZhRZ7dOnDLbhfMs3ctF0OdWR0aVQB08gZR3RcWmLB75fyFtyRBtLaBl+M4sGqTSMwpTOVyt2GG4lY1JqUu2jlHEEkcDJk7k9lvXvW8JmkOuMKnGUWghlz9mpjX8uu/SdrrceKqKMkcfLe80bphQYC6m281UWFByZ8SK7wVeVntcExjignPGqQiqLHMBMMNiyE1pIm6NvMUDREq+FwfXzQgZaPQP1+fLWJQOskJHsO7OxJBUno788KdxRcTwKpNuVYrBsMNhBTzKfA3+DqAa10Slwlk/CsZJoTVRA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(1076003)(7416002)(86362001)(66946007)(44832011)(478600001)(2616005)(6666004)(6486002)(52116002)(7696005)(956004)(5660300002)(316002)(83380400001)(4326008)(38350700002)(38100700002)(8676002)(66556008)(66476007)(2906002)(186003)(26005)(36756003)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z+pL25j8ZJy4yO1jnKqNnur5kroCEWNuUO3X8HZ4JrzDZGBXaXz5DQrwJ0C7?=
 =?us-ascii?Q?6zkijUcDitYS+yxY8PevXLWLsBafg51teV0r7QVidu2/u8uu6X7l7JX9iLyS?=
 =?us-ascii?Q?DGd41b40T5l0YPPZA0BJXE5nxEf7wGwPKmKsCkcmLmYJ4gHAZO4ZJ5c8yELA?=
 =?us-ascii?Q?YjYiRZK/70wdNccl0BMJKzsJekQ08bnpiq+qmVYmBiHhrc33O+YdEKox76zz?=
 =?us-ascii?Q?geXOTk2EMIUmAegnoF4mhhz5YowYCilxVwANxhTd49LaIkbgekx0+SyU7xOu?=
 =?us-ascii?Q?Ocpp8f+Za+g9Zw14DEKecr1a6Q9DpJ2pxTIjz7x6J2tH5kjLauWjRe/yvxhI?=
 =?us-ascii?Q?AOu0MUtLY1WDqYETcFT5+4iVRCSu76DChxWjrBR5NY978HfltMUYYmTNZUxR?=
 =?us-ascii?Q?tvu10pxABa8QKNpPEwiRSQ2UaZE1VlHZaxlIeE13oVhKVrs8IJg2Ye2kyJO1?=
 =?us-ascii?Q?z7/XTOmRgslu0wlzY/iTchLUbI1mnoguDF2NY9O+IP8+V6GVnrE+DkzwH6dX?=
 =?us-ascii?Q?NL5a3i2COVsIdkNBcjdHNvjp1S0gqvci/FyUyVlkylSm3dTn/sExQB1Pfeqq?=
 =?us-ascii?Q?Luwpb6ktfuSzc21BT9/CRG4SwR6Fvc5kE+kpDajJWNyL49r0CWRCrakYo6yP?=
 =?us-ascii?Q?EuMfjYuSQ/yYD2RAB5Y54TAn520q4W7cgw8LTqZRxxIfD7D4Ldmi8sbZaJjH?=
 =?us-ascii?Q?1MjpKeVLAmm9k54BT2kp5YffPbi9/8Z8rdkD4DvGr1X7rb0Fk5OhUgUBuNAE?=
 =?us-ascii?Q?EiLRBs0OgKhmuL1srJtH/UnhOM+Vt1cwamfr4JdsNVD4Ce8e4Ub7JipFIMVW?=
 =?us-ascii?Q?wutzOJGbeR01Akj9ZBkWP1gNCQ4jFlDoYG/eHbDV5V1ZQUTNMkE4CiOw7a2o?=
 =?us-ascii?Q?vGUuKlRPMYSkwUDyJm1VFaHCjPAeu4Ow6gB/r0RvSAds6VtnR6MyuNdbEhQ7?=
 =?us-ascii?Q?WK1Gjzl3Gxi0S/0ExNLw0QlJTeH+ppAIC7UuQMmjyRbO8yrc5xohMggPm1iu?=
 =?us-ascii?Q?vENB2cqGap3b3DXy2vbxS6RvgP4E+DA4uLy83/V6YKQychuCJPEwaHLT8dm0?=
 =?us-ascii?Q?IOc3ityvO664sOFcz8VZDyU9LvMmKF2/03In7mok3puUfvcS3aLV6XmK/3pw?=
 =?us-ascii?Q?1RUhFLvnbSi/58uL4auZo29oyeUbri+jN9FduzjKxkvBsyKUBt3asG8+HH4U?=
 =?us-ascii?Q?jy9gdmQvRjt4PgS3Rcgi5GoVACHliI3emnAFRX1nRgsRDp8EbR/nxy9aUod2?=
 =?us-ascii?Q?sk+icCxnPnRn/heG3Dr70qIwZlYA2bQHvJ2YwqKxrvEPB5eJMca9lY28f6ni?=
 =?us-ascii?Q?A8Od0d49Oxsdt0Oxybxiouxz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97ed0f33-e87c-4b9a-57ef-08d976d1d20e
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 16:16:19.5756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C343408cN/DD7mRbmMs+C4oMWEgjx6dftyKMIYEqnHbv87ZNfd0MIWIII885qX2HaHFQL5R+E3qC5Irzr3mc4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2767
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

This case is used to migrate pages from device memory, back to system
memory. Device public type memory is cache coherent from device and CPU
point of view.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
v2:
condition added when migrations from device public pages.
---
 include/linux/migrate.h | 1 +
 mm/migrate.c            | 9 +++++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 4bb4e519e3f5..2fe22596e02c 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -156,6 +156,7 @@ static inline unsigned long migrate_pfn(unsigned long pfn)
 enum migrate_vma_direction {
 	MIGRATE_VMA_SELECT_SYSTEM = 1 << 0,
 	MIGRATE_VMA_SELECT_DEVICE_PRIVATE = 1 << 1,
+	MIGRATE_VMA_SELECT_DEVICE_PUBLIC = 1 << 2,
 };
 
 struct migrate_vma {
diff --git a/mm/migrate.c b/mm/migrate.c
index 7392648966d2..036baf24b58b 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2406,8 +2406,6 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 			if (is_write_device_private_entry(entry))
 				mpfn |= MIGRATE_PFN_WRITE;
 		} else {
-			if (!(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM))
-				goto next;
 			pfn = pte_pfn(pte);
 			if (is_zero_pfn(pfn)) {
 				mpfn = MIGRATE_PFN_MIGRATE;
@@ -2415,6 +2413,13 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 				goto next;
 			}
 			page = vm_normal_page(migrate->vma, addr, pte);
+			if (!is_zone_device_page(page) &&
+			    !(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM))
+				goto next;
+			if (is_zone_device_page(page) &&
+			    (!(migrate->flags & MIGRATE_VMA_SELECT_DEVICE_PUBLIC) ||
+			     page->pgmap->owner != migrate->pgmap_owner))
+				goto next;
 			mpfn = migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
 			mpfn |= pte_write(pte) ? MIGRATE_PFN_WRITE : 0;
 		}
-- 
2.32.0

