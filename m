Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD74A541BB
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 05:43:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 136A610E10B;
	Thu,  6 Mar 2025 04:43:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WxodjVLz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060.outbound.protection.outlook.com [40.107.243.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D892C10E10B;
 Thu,  6 Mar 2025 04:43:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LqCLaHd6M5Qd/lU2XLWoGmSoxjKdGSgblSN1QC9JJpJs/wPWfB9uyev96n3GWqDCSoAHl617gdVRaVubQcI+LiHOIoD9NEolSZmU2kvddR2TMLxYRlpHw9IM8geEnXAukGVZgP2/Anx3oR2LCxPaNUin86JRC1zJ+uIXAxLoYLa8yOE4xH+EXMwW4Xgun1PERLb1CkrK0PTWr/nnr1g7q6aV/rEtVNth/L5hJH896hyxI6QrIntTp8rmFyuooWNXXoZIC/JNDZZp+7B+LmP1dX9ggj+aAccvZeL+XpUhWDYB0VSzEbrRP4CgimzwpZuJ8Ez4GmwY2l5IJUII40B1Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4epqa7E+7N5phhBCx7jHFZ5uXuJg3Bv4xIEzF0uF8gE=;
 b=qYH54XLvKhwGJUamkn5y5SVSqO6GAHVVkoW6l3KYLrQyosdsiyQ+19DnmdIS9vvVAGdBOPzdmDO0LwO8MY3Hs+i7Evcw4p1SAZu+n0TTcXtm4A1saIahuzB355MyF8rG4zEebLjKZSFsm+mDZzXpXFSN5TIqKzm/HDojUbJy+QAeCZP/ihuEFUZ6gezHzNWwKDNJpqoZrToPlkXzMF4gVFigN5simc7AWn/QJaiWnsrzA0IHOfw7c+AohMF0IBx4/ig+FYJuWhoILXcQae7dDGste5v20LTSHVIcDs/JRwCDHmJVdnOzFRluE4DYfOgzRLEt+MDb5XUR4o3D8uCgdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4epqa7E+7N5phhBCx7jHFZ5uXuJg3Bv4xIEzF0uF8gE=;
 b=WxodjVLzb/Ua4+CyyHrMCtCkB81A3vAwv8BQRwO0eWA/oWfYiRHp77LR+yGChy2hzLeMWadGuy/EeIl6qpDU4x4CD9FKaEEKYBmDbVeabo6jQ3FGeyvTyaW4JF7PobFaNbuGDc5+8u3XkDzdOrxc1TSOryOHjAw2Opxmldk+u9HLcCo/VjITpBIDH6FK/rCZ9pcP9cCsaLOoeFheUcKSO6/zjwxgM69aE0BgQZQp+FGksa1hNM59ncdHQRVc+QwHM+1T+WyDzVHpoVQGC7Wo8XIDIaT3gzrfapq1ogK8Py+qql7bqyPqCYTXXN71aoj1FVAJRNcbBS8uMegRrVoyNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB7272.namprd12.prod.outlook.com (2603:10b6:806:2b6::7)
 by DS0PR12MB7534.namprd12.prod.outlook.com (2603:10b6:8:139::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Thu, 6 Mar
 2025 04:43:36 +0000
Received: from SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::a970:b87e:819a:1868]) by SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::a970:b87e:819a:1868%7]) with mapi id 15.20.8489.028; Thu, 6 Mar 2025
 04:43:36 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Balbir Singh <balbirs@nvidia.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Shuah Khan <shuah@kernel.org>, David Hildenbrand <david@redhat.com>,
 Barry Song <baohua@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Matthew Wilcox <willy@infradead.org>,
 Peter Xu <peterx@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Jane Chu <jane.chu@oracle.com>,
 Alistair Popple <apopple@nvidia.com>, Donet Tom <donettom@linux.ibm.com>
Subject: [RFC 01/11] mm/zone_device: support large zone device private folios
Date: Thu,  6 Mar 2025 15:42:29 +1100
Message-ID: <20250306044239.3874247-2-balbirs@nvidia.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306044239.3874247-1-balbirs@nvidia.com>
References: <20250306044239.3874247-1-balbirs@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0007.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::20) To SA1PR12MB7272.namprd12.prod.outlook.com
 (2603:10b6:806:2b6::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB7272:EE_|DS0PR12MB7534:EE_
X-MS-Office365-Filtering-Correlation-Id: 33abd23b-e99e-49ab-9547-08dd5c697510
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IYZQ9ew0+a6st9bNWHuMafKl0VT3SV8Tp47j8iyd5SCc8aHhIkHXAceO9Yl5?=
 =?us-ascii?Q?OvX21uoqproctYLKNGZQx9WFFyP74US5rEiikZ+9aufc/vyr/4cUu0wpsb06?=
 =?us-ascii?Q?v5R/0UyBtKIY5R8yITPSqtmjt2YXDPonyVTxFZu5N7lV0m4pfSajXHl8fG9T?=
 =?us-ascii?Q?giy2NBGnHRN+m4l5uJ7iZUPt9ZgJyvFSfqqbzToOFnyD3GjIixHdOFAr4LOt?=
 =?us-ascii?Q?AEex2WhFecw+cXN63hqTnyLDpXkFKcf/HU3axEHnZ5rn4QsbjNAIig/9K3e+?=
 =?us-ascii?Q?R++p0QuYimS2r3qTg/O8HhNMnHkaKKxsHLCuiMmRC4FThVMLd9RwpINLMcW6?=
 =?us-ascii?Q?fk8IhNjhXxneASIiwfZoDGutpoII013zvSiiIENZUukFAxfSok3BUc+7n0r6?=
 =?us-ascii?Q?8q2RXWGt6L5/xhA8ralkltqvBtrVGBXkfi6D0NxZQ+k35JIJkqXZFC0VI75C?=
 =?us-ascii?Q?df/OH3WR8v0Cz4yKpeGZP4+wQmlZ+87+eCtFwQytNzPowHiphQJXyhaVZWBC?=
 =?us-ascii?Q?lFzAfp3CLoKifrRdNC7wl3hynBFlyia9RNteMxJy1+NbDR3XDS7vDBFYt4Pt?=
 =?us-ascii?Q?AFxDlgCglhhNyo6/LYkeuEjdldHG0J4LYg/L86JavRlwXEhvY042v6zF66gz?=
 =?us-ascii?Q?rKLKLtpHYwYEwIIJNXez+r4gXALnRq3WISnqr9FUlrZDQYYv052di3z/ox74?=
 =?us-ascii?Q?6aHuDdI0+adlvmSlGAjT9EMAmnEszOl1h2sB4yYH1S+7kHGYL8geEqPd/1i8?=
 =?us-ascii?Q?/K+fI3PH4PLjwwsyZJwVYgrkgEd4On5KKV2JoOUcRQ33o6SHYRh+J3dwd0tC?=
 =?us-ascii?Q?HCg25T2OsH3hQ1LFXR8U3Qwduco+N/XTyFDQ3COgRvVLS8uw+XbP8CE/6Brh?=
 =?us-ascii?Q?D/r55GSwVFFwdFZi0JFAvuFPcATKiYV1WnwIxzrktFyapjLaV139WLwbHV1y?=
 =?us-ascii?Q?tw6aEDFLHCKMc8++xJNYAf+Ej0Cd/hl6sqUIuGJlR74TzNdxMW001p7amp5d?=
 =?us-ascii?Q?0QaLwOCO58GXnclXM58uHsg3FljbvPMb37SiA58WiCmunzjdjQjc4Hhg2vDf?=
 =?us-ascii?Q?bSZtyPgsjutPYYYBLF+th95Jc1c1bZW42ehbqv3kV5Jm2HiU6wYZEnzbu4r7?=
 =?us-ascii?Q?zHiL5o5d5gDscMO7a8/CCQb0rzSwE1UGtLuv2pEOE50DXLFlmRhlWBi2ByFG?=
 =?us-ascii?Q?Npq5jVhjAskhS6SLGgQTD12w7K5gSIVDCavBBDHmigHUD4B3iK82nIhKPB5V?=
 =?us-ascii?Q?de3UZByjXy48HjTFJh3uGHhbrmLC47ESunOHLMwWM5ZcwyYuzbDOHCkNL7co?=
 =?us-ascii?Q?NrHBlVc5qFNEr+Dh7QA+nS9k5V1Ku4KHtWfMnJm8pw+g0MQKyiBVTC/wJAmM?=
 =?us-ascii?Q?XwZ2x5HKFxwxsVTyz4S2SHmtZZ47?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB7272.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uflSSZCfX4jurU3fYD/Mk9ZkqPK17ZTp9TkaiOAewrwSDCeGlCtw1JCW1in3?=
 =?us-ascii?Q?mIsBhYihYOUYJ6PjY9UGtq3Ovv+Y3aBjVAqypfObuxlZ1RopDSHPwfBcrsW8?=
 =?us-ascii?Q?kX6+r9Avz5gJO9RwMKDoLHkp8RcyTFA9nJvoOo85SrzpIkX67DWJbXDA8OqT?=
 =?us-ascii?Q?q0OOl01na9k7GmtINjPORUaXg23CEtZ6RiBR7w0IOLFiu5air052LbE/aUDk?=
 =?us-ascii?Q?aM3cZry4Rcf3qMizIpfz71YIHVsLzDhothFBYIakB38Lu8On6M+o0L+EB/ol?=
 =?us-ascii?Q?pYIbwcjmor2P/L8rpBntzBxDwXpv5LKfAzzl7UvwTg7/ZDP5yaamG5qSeV7I?=
 =?us-ascii?Q?WNbyqa5gnftHU1XNXlkCXMHNzDU7tSmRsD0ZvbsRouo0YwDjLXEBzJE41Zpq?=
 =?us-ascii?Q?EmkSKeq/Be8LaQmLEpR8TUgQvAh4ocNYXaUdpZRl6Hl3Zrb3wW2OBPfZ+nTA?=
 =?us-ascii?Q?wBZ/x85M6+dWZl+aCoH/yXP7KLQe+FS34FqQFDwQwI15us3HgFeyY0hTljzh?=
 =?us-ascii?Q?Ji2jodWIKYUWEq/ol1nrYehVQPnrhF2gThyP9vWYKraWNpdTqTVjLhn8WYNl?=
 =?us-ascii?Q?KUYv7fQxS1zV2oYiFvkNFS5/fNSINoo8sCiow/ZBdPKftoROGymU0hp9DodO?=
 =?us-ascii?Q?MYcgFUT33hrnMLc4euqfGPYPLTt+/7XuTMXlt3HUErJlBYUUFU4hbrVx38TD?=
 =?us-ascii?Q?+5H0z93HeoNxQX58wfPoOTF9DGvWMw3q3n+l1tD9TfMhPh49iuk0cL+1Shjq?=
 =?us-ascii?Q?Vp6yye3XJzoO4HyQ7DWrwp/8Oo9NT36BsIpvrXLD6GhpOIui3/azeImI22B9?=
 =?us-ascii?Q?esTKXYJGQpI1E+pvYVq7GnlWET20LMx9DstORsTiuOSpFTycF+WoI9OhwXB1?=
 =?us-ascii?Q?/U2Xn9GQ6xq4ocScj3ONmMaV/Jf2dyQymzBg9RYnVFpIuscfYlO51iYUOJPn?=
 =?us-ascii?Q?uVpYQVitlPfcl4HL6fIkERvCoAkdYa18y33wysqYmse/0nJ5yM0lYDesh3/u?=
 =?us-ascii?Q?T0Bx4Q9rGEAMeyX0wFStUtpKtvUhRPvzIUOakXoPpdxBo0tRJnqbjwvM71Yv?=
 =?us-ascii?Q?U9rxhzQnlK7PWoGqtNn9vbWcifoOVfxTCVl8NMx8JWHMiEvDgwd30BYlAH09?=
 =?us-ascii?Q?gF84hWmiMHvwhiiQWEp9cdSG4eEwXTnD3yMSXBjxeX+ysK82A3B6n2z+AJNg?=
 =?us-ascii?Q?+wuu7Blkl5qShLaumhNI7T2nbfC2+UJMYTfv8Pf1LPqGmYStijWn/uvClG3Y?=
 =?us-ascii?Q?hMXlrJtujE5RDqHZqW5G0MJUdQskAGpMpWuEK5CSOSs0g7qiWkcYs0bDUS8k?=
 =?us-ascii?Q?L0EIDF4GS+HARRBoLh47a4K+U7e3v3LjfF5B6iTH7inPmfuP0l/PYDLpbeI4?=
 =?us-ascii?Q?ai3tPJUXkzdRw8UuY5oH6YyQwPb9suM7cqURnmnRVgJFmu1vgAX5IwbA+VrD?=
 =?us-ascii?Q?1L7eJJa3BqvoBcqww4oYjxF2ZYJYjxHFu8hNsgo0mgi28N5T2YvtBrZauJsq?=
 =?us-ascii?Q?eNnHrZeXRrU7OCKN8SKGrRM+ccob0l5BUaUhjGANf7gQYMicTTW9bMmjGVdc?=
 =?us-ascii?Q?X2nNHpJisSWBM6W+Rv8Gc/Yqi7MUwjG2ve40/3ob?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33abd23b-e99e-49ab-9547-08dd5c697510
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB7272.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 04:43:36.4199 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OPV+o4TkmCu+EOs2SAEdnEFhsLJ9jU6D0/d2ftZhajMhnyZJ/R9kwX9XWfxLn/n4cZhWHPIdcJtBoGRVGiA3dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7534
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

Add routines to support allocation of large order zone device folios
and helper functions for zone device folios, to check if a folio is
device private and helpers for setting zone device data.

When large folios are used, the existing page_free() callback in
pgmap is called when the folio is freed, this is true for both
PAGE_SIZE and higher order pages.

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
 include/linux/memremap.h | 22 +++++++++++++++++-
 mm/memremap.c            | 50 +++++++++++++++++++++++++++++-----------
 2 files changed, 58 insertions(+), 14 deletions(-)

diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index 4aa151914eab..11d586dd8ef1 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -169,6 +169,18 @@ static inline bool folio_is_device_private(const struct folio *folio)
 	return is_device_private_page(&folio->page);
 }
 
+static inline void *folio_zone_device_data(const struct folio *folio)
+{
+	VM_BUG_ON_FOLIO(!folio_is_device_private(folio), folio);
+	return folio->page.zone_device_data;
+}
+
+static inline void folio_set_zone_device_data(struct folio *folio, void *data)
+{
+	VM_BUG_ON_FOLIO(!folio_is_device_private(folio), folio);
+	folio->page.zone_device_data = data;
+}
+
 static inline bool is_pci_p2pdma_page(const struct page *page)
 {
 	return IS_ENABLED(CONFIG_PCI_P2PDMA) &&
@@ -199,7 +211,7 @@ static inline bool folio_is_fsdax(const struct folio *folio)
 }
 
 #ifdef CONFIG_ZONE_DEVICE
-void zone_device_page_init(struct page *page);
+void init_zone_device_folio(struct folio *folio, unsigned int order);
 void *memremap_pages(struct dev_pagemap *pgmap, int nid);
 void memunmap_pages(struct dev_pagemap *pgmap);
 void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
@@ -209,6 +221,14 @@ struct dev_pagemap *get_dev_pagemap(unsigned long pfn,
 bool pgmap_pfn_valid(struct dev_pagemap *pgmap, unsigned long pfn);
 
 unsigned long memremap_compat_align(void);
+
+static inline void zone_device_page_init(struct page *page)
+{
+	struct folio *folio = page_folio(page);
+
+	init_zone_device_folio(folio, 0);
+}
+
 #else
 static inline void *devm_memremap_pages(struct device *dev,
 		struct dev_pagemap *pgmap)
diff --git a/mm/memremap.c b/mm/memremap.c
index 2aebc1b192da..7d98d0a4c0cd 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -459,20 +459,21 @@ EXPORT_SYMBOL_GPL(get_dev_pagemap);
 void free_zone_device_folio(struct folio *folio)
 {
 	struct dev_pagemap *pgmap = folio->pgmap;
+	unsigned int nr = folio_nr_pages(folio);
+	int i;
+	bool anon = folio_test_anon(folio);
+	struct page *page = folio_page(folio, 0);
 
 	if (WARN_ON_ONCE(!pgmap))
 		return;
 
 	mem_cgroup_uncharge(folio);
 
-	/*
-	 * Note: we don't expect anonymous compound pages yet. Once supported
-	 * and we could PTE-map them similar to THP, we'd have to clear
-	 * PG_anon_exclusive on all tail pages.
-	 */
-	if (folio_test_anon(folio)) {
-		VM_BUG_ON_FOLIO(folio_test_large(folio), folio);
-		__ClearPageAnonExclusive(folio_page(folio, 0));
+	WARN_ON_ONCE(folio_test_large(folio) && !anon);
+
+	for (i = 0; i < nr; i++) {
+		if (anon)
+			__ClearPageAnonExclusive(folio_page(folio, i));
 	}
 
 	/*
@@ -496,10 +497,19 @@ void free_zone_device_folio(struct folio *folio)
 
 	switch (pgmap->type) {
 	case MEMORY_DEVICE_PRIVATE:
+		if (folio_test_large(folio)) {
+			folio_unqueue_deferred_split(folio);
+
+			percpu_ref_put_many(&folio->pgmap->ref, nr - 1);
+		}
+		pgmap->ops->page_free(page);
+		put_dev_pagemap(pgmap);
+		page->mapping = NULL;
+		break;
 	case MEMORY_DEVICE_COHERENT:
 		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->page_free))
 			break;
-		pgmap->ops->page_free(folio_page(folio, 0));
+		pgmap->ops->page_free(page);
 		put_dev_pagemap(pgmap);
 		break;
 
@@ -523,14 +533,28 @@ void free_zone_device_folio(struct folio *folio)
 	}
 }
 
-void zone_device_page_init(struct page *page)
+void init_zone_device_folio(struct folio *folio, unsigned int order)
 {
+	struct page *page = folio_page(folio, 0);
+
+	VM_BUG_ON(order > MAX_ORDER_NR_PAGES);
+
+	WARN_ON_ONCE(order && order != HPAGE_PMD_ORDER);
+
 	/*
 	 * Drivers shouldn't be allocating pages after calling
 	 * memunmap_pages().
 	 */
-	WARN_ON_ONCE(!percpu_ref_tryget_live(&page_pgmap(page)->ref));
-	set_page_count(page, 1);
+	WARN_ON_ONCE(!percpu_ref_tryget_many(&page_pgmap(page)->ref, 1 << order));
+	folio_set_count(folio, 1);
 	lock_page(page);
+
+	/*
+	 * Only PMD level migration is supported for THP migration
+	 */
+	if (order > 1) {
+		prep_compound_page(page, order);
+		folio_set_large_rmappable(folio);
+	}
 }
-EXPORT_SYMBOL_GPL(zone_device_page_init);
+EXPORT_SYMBOL_GPL(init_zone_device_folio);
-- 
2.48.1

