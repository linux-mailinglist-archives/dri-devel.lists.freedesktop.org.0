Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 435075EDC36
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 14:02:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC7CF10E4A2;
	Wed, 28 Sep 2022 12:02:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2049.outbound.protection.outlook.com [40.107.237.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB79410E4B2;
 Wed, 28 Sep 2022 12:02:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mWLh78/LFNhPSqER6AgvsHryUBrRHLCb8GM7KDgwXhC5K+2GzWRxT2TuqrXlgS4lVIq6Mhar3BrB7atGxiYRYNg8kcGyLLVU0+zmG7R/9CCfAp4LbrzlU//pKHzRUwfE8RZKHqtn3PIZiEeQ91M69RyYOzzYLtU8XEw9dwzJalo/A9t5gMtFxabhqXjvbZPGB19XpFAtjkwL1HQSdEGNU3DYbK6X+DuTgKBvh3wCoXKswJcAP3GfQDwDuMh+qJBeIOkAQDDyQ55HsS3FQenDtv2MP8upI2qAvJLNmHjx53ioqjfUUuiqYwMgMGC+/AfLSYIasK+WDBzc0Z99ahw3AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MxnM0Mm+w4dC4/s1WCkbhv6Ca4Qcuv7yec9xOyQ1fNU=;
 b=D7HxZJHHMZemOr0pOL4L0Snf5fGmV1U8SdwTRmJhA7BV6wCvWx0pMvw+H1IYUfjNxt/rAaqjrZlDoWTkgrNkiQsCvrivrzGHtou6P9Jz6CpzblscgzUM8cqIWfYpDydsKWDCsU+VG2HDXZMrlvMCEaT3vIT8Xv8A6zypNN2hU2+85g9DmvTC4e0+dSYpjBvCHEk8RtKiBeMGBCsu5Jp+8r2wwLUvkHMPrn7INJt7iGwzP2s3YicHt/2HbnjGfl4CzLfOOuELkbLOqQ+sYzttYjBus/cvd/QBKa/tuvrcnfnhFetTqNjnv4Dl6tZqCkT78lXdkMfJU+ZIrSFmKi33HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MxnM0Mm+w4dC4/s1WCkbhv6Ca4Qcuv7yec9xOyQ1fNU=;
 b=uEwO8nARf5Z8vGHbnzbdMEky80wz1T4UWIk0TI+wBJ5HIK/WnL6X3bodRIamHdNlFbz7zvG3UCkkE6ot/adI3mXHSQ+gAUgHsVuIH6Qk03sKvnUa3FHGPN/cB/2eezmmBOiR8YldvJe1TOox4RuogDpsRCdoRylTePKpLK3G1xOqYsF8qwErqVs5JhkKX4938H6SJWeyRaaaTS7jiTDCAMMdETyaK3frTEcNQrLN8RWgfc2e7P6oQwP/btJ6374IgGCfG4x1ppZNxXyaTh5cRo7usKyYVAtl1IkgZFqoRxwDxGncMqyTgsoE3PeXwqY8iTQvz3nHIhKw2WNXBZKOMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by IA0PR12MB7604.namprd12.prod.outlook.com (2603:10b6:208:438::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Wed, 28 Sep
 2022 12:02:10 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::4064:6c13:72e5:a936]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::4064:6c13:72e5:a936%5]) with mapi id 15.20.5654.026; Wed, 28 Sep 2022
 12:02:10 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Subject: [PATCH v2 5/8] mm/migrate_device.c: Add migrate_device_range()
Date: Wed, 28 Sep 2022 22:01:19 +1000
Message-Id: <868116aab70b0c8ee467d62498bb2cf0ef907295.1664366292.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.60659b549d8509ddecafad4f498ee7f03bb23c69.1664366292.git-series.apopple@nvidia.com>
References: <cover.60659b549d8509ddecafad4f498ee7f03bb23c69.1664366292.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0009.ausprd01.prod.outlook.com
 (2603:10c6:10:e8::14) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|IA0PR12MB7604:EE_
X-MS-Office365-Filtering-Correlation-Id: f6f069f8-1ae2-407e-236b-08daa14945e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AqsfkSFJRaQLCYEkmv27B/mTs/zhNdSWptRmwZpu2FocEVCdzO1Xm4SmEXlkNqOJRKzTHxAGihl8pWOwFNw1KLSeElsETRPzE7UbSUeVyf+XYv6ImESi9ALCoqlrVjpuOuwLHCw/PK9MwAVQ3NrJlDU8zDF7UhfI0m1g1oRmjAZ65O4C3HVf8MwAtrSSZCLZ1QhR7Wor8z/kB67m1dGhqtocpibH0sg5ix+fg2C2VAJzbtum+tjz5GjtGjNQkChpzjdeQKzWrNdB90dL4YoD/avlGMTM67msbNO/XNo80+oMH5Boy7aOkHou4/UXPkiYcDQISlirGQwUP+PzSklYIidaa5a7UhYErhiDs0XiXGc0lJbH6k1j+Bcowkwrp1eAaGucjK6tMBk2eyeJiQT0pXlwCJAq/rfUW24mxnEcw+GGcr9d9nnFkrbo9atBHvAuMkdfbGZitMlDYr4hPHzUhDVq871v6hFYyty6NB1Sy5atwyd9rIW23L9LyQ2njtHXedZqBoKzCTDuShpxoj+Ah3ZDpwoyyW53sFeBDonMd8n6ytfs+ql/WB9GoSgWIJGbkMHgrxy2S6CQ+qzMqjRmjZYVWO9pFjvOrFyo1oEwdt8yKgijvEz31o1jZ5LLNt3c69rUUFuLCYH5etwto4bZ28VM74/JGErAcO/IhE3lbbamap5QHlxswmZfDnWdIMtuXUK6it0uAEB6lpYrI8m/BA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(346002)(376002)(39860400002)(136003)(396003)(451199015)(8936002)(478600001)(7416002)(316002)(5660300002)(83380400001)(36756003)(6506007)(107886003)(41300700001)(54906003)(6486002)(2906002)(66946007)(186003)(66556008)(2616005)(66476007)(4326008)(8676002)(26005)(86362001)(6512007)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LP6lH00UwAstkkl/R+B4V0Rz9UzueNjgwupYzeS4oZNoHzHI5T5WCBWKsNXq?=
 =?us-ascii?Q?I+mUSJUjPPoK3yOKvU1viyFu4BSvhJqDUlbvfVPTy3oDjqLyViSDwoWiYZvD?=
 =?us-ascii?Q?iwCA9UW92pdXIjJDSbWAfj+I6o0kP0P+MOJbW8rwp5hnHh/Jx5zJo680rFyY?=
 =?us-ascii?Q?IRzkwcW0XbohfmAU5VJIYOGUOikg2hHtcxs6x/oRs5twbNPwzwv1WWPxY6mm?=
 =?us-ascii?Q?CH7+HPXs0JJCKC+INe3IV8TxFBjc+E9nWPV2hyX1lr+/EzXz6E5zByLNQXh9?=
 =?us-ascii?Q?pj7lCson77sm2Gg00h/CdZBpk/w8/jdlKPAM8A0gFxtCb4KK89ZNxCxNXNB9?=
 =?us-ascii?Q?vX8yCNx9ZtBseO+9kLmn+0ec7Jm5w8s6LW8EZSQhQeXQ6KHXQMwOAHcGcO2H?=
 =?us-ascii?Q?O87CSgUtLKyOLbh6ayYIyTd3ynluG8Nn8Kkfu6HwUkT7AEteyi4iJG31OD3F?=
 =?us-ascii?Q?XRQpfOM9ipgDFrQFdlxCNn7+qtY0L2Pt4695HmXONS4B763DI5i+VgD4WByf?=
 =?us-ascii?Q?EhzaA0pGEud/tLu8d0X77IfGm6En5uQp8YNQoyAUNZN/muvFFQ1pK+14NVk8?=
 =?us-ascii?Q?1k/pkcKyWNOyOhsclqIuZd5aqqFWUwY0JbH3jIt5AjKbg/zLrXK+PVrgim/J?=
 =?us-ascii?Q?JgamDkn6KNFcHOp1A5+wcu3bRVWIkTkTxU1c/ptRzJSbKnmKyLBdaSYGz7uo?=
 =?us-ascii?Q?HKfXRvQAWdeINfoWmiSvyM+1HayaJw8H8Cj1T/Swo5voDMYDmOENvsDKRb4q?=
 =?us-ascii?Q?WvrzYpu9wKG3/VIoUVNiWC1daFp1t22io1HAGEL9+JdqrIzfMg1+dNF7YLJF?=
 =?us-ascii?Q?/hoIbmbpIUh6PiyD+/fhfAjdv2HKs/SuvBRaKINW+LqA+WJszLMKEo/yd0/a?=
 =?us-ascii?Q?F7yvZ2rnWZOWiApBFe1+uGozwYCaYcgLVcSxiktD5M6Rcx3BvuzllzRt0Bov?=
 =?us-ascii?Q?TzOXVIKqknJJXNPIn9rh/zsrVxvL1Rk4W3d/BGVxDAZpbTlbDk23nGS+FD6i?=
 =?us-ascii?Q?Wj10AXO8myr+gWyTafNm58bAsjojHbahrT+8vOKm55f98kA7yCPgrFJaRgPF?=
 =?us-ascii?Q?mZkNamVIZlvJ2qOIanQWS417FGst1UYxy4WHZBJg1SLMJp+JnXNxOrOLzcDu?=
 =?us-ascii?Q?6YmBGdEEhf37BbbUcPPXnEQYiWVCh3+0qZ2sApnXzu9PFsl2uMP2Qxd1xzaY?=
 =?us-ascii?Q?EEhWB10rkFEbpJ2gZB0EdVy4osWR7Oo++VLbe9Rq0us9azoPO2Erf4y5k+MC?=
 =?us-ascii?Q?i7OH6/2PZ9uZ8N7HDsVFjMLVbXc57lPFHR4zkn0wBRyzEz0MdfPg1UB0ksRG?=
 =?us-ascii?Q?esMF3wcviL5C7NIhynkL3JCO7xgSPTAeGEY3LWHIipgdKJ0gznwGoERGkoMq?=
 =?us-ascii?Q?eshpmXypGaDGc2qYjuyxd4FUVe8l686oGRUleQJVB2rvGsIV0V78Qb6Kdlvz?=
 =?us-ascii?Q?XyC1KwA7HFCeu6UkRkGn2ODz/HTfG8t7WleqFYAO3W4WAU2LxVcHkSTZUIpu?=
 =?us-ascii?Q?A7a2dU6M+gFnArFTQ1yEs9MY2HNBhBjr+vjm7LyDiTl83eZj6F3vvIVuj/6E?=
 =?us-ascii?Q?/k1Lu4xIrlQk1Ixwsg6jUUqfchkTMmlrJZXJCXUQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6f069f8-1ae2-407e-236b-08daa14945e3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2022 12:02:10.6513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DO7SMGhn0/HwQvHedKylVhXlQ0dsrJ2NwEzWRo3PMh7Gdk6pZAcdOQuFpwssR8omFvWpliQdEwC72vZUbeqZDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7604
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, Matthew Wilcox <willy@infradead.org>,
 John Hubbard <jhubbard@nvidia.com>, David Hildenbrand <david@redhat.com>,
 nouveau@lists.freedesktop.org, Yang Shi <shy828301@gmail.com>,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Zi Yan <ziy@nvidia.com>, "Huang, Ying" <ying.huang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Device drivers can use the migrate_vma family of functions to migrate
existing private anonymous mappings to device private pages. These pages
are backed by memory on the device with drivers being responsible for
copying data to and from device memory.

Device private pages are freed via the pgmap->page_free() callback when
they are unmapped and their refcount drops to zero. Alternatively they
may be freed indirectly via migration back to CPU memory in response to
a pgmap->migrate_to_ram() callback called whenever the CPU accesses
an address mapped to a device private page.

In other words drivers cannot control the lifetime of data allocated on
the devices and must wait until these pages are freed from userspace.
This causes issues when memory needs to reclaimed on the device, either
because the device is going away due to a ->release() callback or
because another user needs to use the memory.

Drivers could use the existing migrate_vma functions to migrate data off
the device. However this would require them to track the mappings of
each page which is both complicated and not always possible. Instead
drivers need to be able to migrate device pages directly so they can
free up device memory.

To allow that this patch introduces the migrate_device family of
functions which are functionally similar to migrate_vma but which skips
the initial lookup based on mapping.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Cc: "Huang, Ying" <ying.huang@intel.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Yang Shi <shy828301@gmail.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Ralph Campbell <rcampbell@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>
---
 include/linux/migrate.h |  7 +++-
 mm/migrate_device.c     | 89 ++++++++++++++++++++++++++++++++++++++----
 2 files changed, 89 insertions(+), 7 deletions(-)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 82ffa47..582cdc7 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -225,6 +225,13 @@ struct migrate_vma {
 int migrate_vma_setup(struct migrate_vma *args);
 void migrate_vma_pages(struct migrate_vma *migrate);
 void migrate_vma_finalize(struct migrate_vma *migrate);
+int migrate_device_range(unsigned long *src_pfns, unsigned long start,
+			unsigned long npages);
+void migrate_device_pages(unsigned long *src_pfns, unsigned long *dst_pfns,
+			unsigned long npages);
+void migrate_device_finalize(unsigned long *src_pfns,
+			unsigned long *dst_pfns, unsigned long npages);
+
 #endif /* CONFIG_MIGRATION */
 
 #endif /* _LINUX_MIGRATE_H */
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index ba479b5..824860a 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -681,7 +681,7 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
 	*src &= ~MIGRATE_PFN_MIGRATE;
 }
 
-static void migrate_device_pages(unsigned long *src_pfns,
+static void __migrate_device_pages(unsigned long *src_pfns,
 				unsigned long *dst_pfns, unsigned long npages,
 				struct migrate_vma *migrate)
 {
@@ -703,6 +703,9 @@ static void migrate_device_pages(unsigned long *src_pfns,
 		if (!page) {
 			unsigned long addr;
 
+			if (!(src_pfns[i] & MIGRATE_PFN_MIGRATE))
+				continue;
+
 			/*
 			 * The only time there is no vma is when called from
 			 * migrate_device_coherent_page(). However this isn't
@@ -710,8 +713,6 @@ static void migrate_device_pages(unsigned long *src_pfns,
 			 */
 			VM_BUG_ON(!migrate);
 			addr = migrate->start + i*PAGE_SIZE;
-			if (!(src_pfns[i] & MIGRATE_PFN_MIGRATE))
-				continue;
 			if (!notified) {
 				notified = true;
 
@@ -767,6 +768,22 @@ static void migrate_device_pages(unsigned long *src_pfns,
 }
 
 /**
+ * migrate_device_pages() - migrate meta-data from src page to dst page
+ * @src_pfns: src_pfns returned from migrate_device_range()
+ * @dst_pfns: array of pfns allocated by the driver to migrate memory to
+ * @npages: number of pages in the range
+ *
+ * Equivalent to migrate_vma_pages(). This is called to migrate struct page
+ * meta-data from source struct page to destination.
+ */
+void migrate_device_pages(unsigned long *src_pfns, unsigned long *dst_pfns,
+			unsigned long npages)
+{
+	__migrate_device_pages(src_pfns, dst_pfns, npages, NULL);
+}
+EXPORT_SYMBOL(migrate_device_pages);
+
+/**
  * migrate_vma_pages() - migrate meta-data from src page to dst page
  * @migrate: migrate struct containing all migration information
  *
@@ -776,12 +793,22 @@ static void migrate_device_pages(unsigned long *src_pfns,
  */
 void migrate_vma_pages(struct migrate_vma *migrate)
 {
-	migrate_device_pages(migrate->src, migrate->dst, migrate->npages, migrate);
+	__migrate_device_pages(migrate->src, migrate->dst, migrate->npages, migrate);
 }
 EXPORT_SYMBOL(migrate_vma_pages);
 
-static void migrate_device_finalize(unsigned long *src_pfns,
-				unsigned long *dst_pfns, unsigned long npages)
+/*
+ * migrate_device_finalize() - complete page migration
+ * @src_pfns: src_pfns returned from migrate_device_range()
+ * @dst_pfns: array of pfns allocated by the driver to migrate memory to
+ * @npages: number of pages in the range
+ *
+ * Completes migration of the page by removing special migration entries.
+ * Drivers must ensure copying of page data is complete and visible to the CPU
+ * before calling this.
+ */
+void migrate_device_finalize(unsigned long *src_pfns,
+			unsigned long *dst_pfns, unsigned long npages)
 {
 	unsigned long i;
 
@@ -825,6 +852,7 @@ static void migrate_device_finalize(unsigned long *src_pfns,
 		}
 	}
 }
+EXPORT_SYMBOL(migrate_device_finalize);
 
 /**
  * migrate_vma_finalize() - restore CPU page table entry
@@ -843,6 +871,53 @@ void migrate_vma_finalize(struct migrate_vma *migrate)
 }
 EXPORT_SYMBOL(migrate_vma_finalize);
 
+/**
+ * migrate_device_range() - migrate device private pfns to normal memory.
+ * @src_pfns: array large enough to hold migrating source device private pfns.
+ * @start: starting pfn in the range to migrate.
+ * @npages: number of pages to migrate.
+ *
+ * migrate_vma_setup() is similar in concept to migrate_vma_setup() except that
+ * instead of looking up pages based on virtual address mappings a range of
+ * device pfns that should be migrated to system memory is used instead.
+ *
+ * This is useful when a driver needs to free device memory but doesn't know the
+ * virtual mappings of every page that may be in device memory. For example this
+ * is often the case when a driver is being unloaded or unbound from a device.
+ *
+ * Like migrate_vma_setup() this function will take a reference and lock any
+ * migrating pages that aren't free before unmapping them. Drivers may then
+ * allocate destination pages and start copying data from the device to CPU
+ * memory before calling migrate_device_pages().
+ */
+int migrate_device_range(unsigned long *src_pfns, unsigned long start,
+			unsigned long npages)
+{
+	unsigned long i, pfn;
+
+	for (pfn = start, i = 0; i < npages; pfn++, i++) {
+		struct page *page = pfn_to_page(pfn);
+
+		if (!get_page_unless_zero(page)) {
+			src_pfns[i] = 0;
+			continue;
+		}
+
+		if (!trylock_page(page)) {
+			src_pfns[i] = 0;
+			put_page(page);
+			continue;
+		}
+
+		src_pfns[i] = migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
+	}
+
+	migrate_device_unmap(src_pfns, npages, NULL);
+
+	return 0;
+}
+EXPORT_SYMBOL(migrate_device_range);
+
 /*
  * Migrate a device coherent page back to normal memory. The caller should have
  * a reference on page which will be copied to the new page if migration is
@@ -873,7 +948,7 @@ int migrate_device_coherent_page(struct page *page)
 		dst_pfn = migrate_pfn(page_to_pfn(dpage));
 	}
 
-	migrate_device_pages(&src_pfn, &dst_pfn, 1, NULL);
+	migrate_device_pages(&src_pfn, &dst_pfn, 1);
 	if (src_pfn & MIGRATE_PFN_MIGRATE)
 		copy_highpage(dpage, page);
 	migrate_device_finalize(&src_pfn, &dst_pfn, 1);
-- 
git-series 0.9.1
