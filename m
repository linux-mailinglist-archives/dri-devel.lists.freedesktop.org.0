Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7ADA541C8
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 05:44:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D55BB10E8E7;
	Thu,  6 Mar 2025 04:44:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="V49qwEit";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062.outbound.protection.outlook.com [40.107.220.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E41BC10E8E4;
 Thu,  6 Mar 2025 04:44:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U0nDYrCKuq7xGImWwsj35l/Ohmzj7T6/sABUtsz2UzHCJxpLk2eGY90YL5JLWCPf7TKnicX5jvzM/EG6UlsTQzLqCRHrgh4gOaf6CGLaho5E8dsqxhHx7Jvmu3B1lPtI+2DNGQDCquIEGYaeUEpSs8NRQln5la5l0rPkNLMOBVdvzUGJzGRFq8OGZenF2uzf5IxmBdtkZnWtwKj2lFWOyoPXLQH+AOm28gaEihFG5eYSCWYautepu4norttczu8oK7skkGHzgG6gQQ53A6qq5sglAsqTFEAoZqtoB13YAatYSv+ffDZOyNzz8KGLj/P+GJn2V26bMCDS4//azzsQaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EfAQ5J7KgEMnhpzY/3xJHeeTxTuaO5ru8T/vnoUf9xs=;
 b=WxgtvaXyuPKMK7dyp+7Hu9okHQrekdLSP8GLMAubPOJlonspnnCcwsw/+QlVxGmCIZkplODywoDjt+YLqSd5K8e1ptqmwTgl0R6HWxex0CFqFuaedgoE4eow0NmetZvLvWrqsTh0pjyRbe9Mx1yu0fXyWPHNczVt7Cj3Ikrs/dcILe8UkX3OOa6U/4H2H2QUV+8w+mwz5XUji9Mk4P+VKxchoKVS9YqRAZUQ31EjWhM5gGZQavK1RmXgT5S9pgTH50JchSWaLxC7DQx4nuKGlyKy4QTJFmhGgf2ZP4OheUtHcmEwy1lplxmh2UHLfa+9usf3RTDdYCmQK78MxUVpZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EfAQ5J7KgEMnhpzY/3xJHeeTxTuaO5ru8T/vnoUf9xs=;
 b=V49qwEitCKnA4xtOwdqZZO66PEAUffYOacKfoxXFRLLiDBTbPLrYRffyEjNb16VZTmgLEfXFnoWWawraw4wH9UFxgcXOCntKT5QCx2XuIyEOggMd4C7fHElASQkiLDFTdsyFM8NUb/kX0SEtg22nfZZU0ktNTd3E7x1I++GtU/PqGM6HVoGBohJtzmMBmwiU38oNf/9CQExydTUXx7IjwwqwSkCJp3XQcKfR6jbRdZ6Jq/iuGydh34+7D92Lme9R2tVdFM0sTBiqst4N3lzthXkziNJ/B6n/vBedN40c7dMpmndPH7R/BFraR55YvcVDxuc+NT6TaoEYLn6rgaH1Gg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB7272.namprd12.prod.outlook.com (2603:10b6:806:2b6::7)
 by SJ0PR12MB5674.namprd12.prod.outlook.com (2603:10b6:a03:42c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 04:43:58 +0000
Received: from SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::a970:b87e:819a:1868]) by SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::a970:b87e:819a:1868%7]) with mapi id 15.20.8489.028; Thu, 6 Mar 2025
 04:43:57 +0000
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
Subject: [RFC 07/11] mm/memremap: Add folio_split support
Date: Thu,  6 Mar 2025 15:42:35 +1100
Message-ID: <20250306044239.3874247-8-balbirs@nvidia.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306044239.3874247-1-balbirs@nvidia.com>
References: <20250306044239.3874247-1-balbirs@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0006.namprd21.prod.outlook.com
 (2603:10b6:a03:114::16) To SA1PR12MB7272.namprd12.prod.outlook.com
 (2603:10b6:806:2b6::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB7272:EE_|SJ0PR12MB5674:EE_
X-MS-Office365-Filtering-Correlation-Id: c3a2bc03-9d0c-4634-a6f7-08dd5c6981bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZSmTMkc52VQF95t8ntgQ7R5W9IiunuTeSlY7hkVZ2Nstf7/4vVfjbAKQn6qJ?=
 =?us-ascii?Q?uroAdeRNphEsd+73x5UWGqAbiAzm3i3CQ2oovtQTGNejTDHX9bTv77cJhM6B?=
 =?us-ascii?Q?X2jp+STyGTnAcmCGZrCok7ssefx87J8dfbb6BrKFYcFbnLT3pugMnfY22FS+?=
 =?us-ascii?Q?3jjsgYR8GO8fJ8ZWMuPNinUlnxA0hijImc0G5dINaFYdR5n2PW7VN+uPkLVn?=
 =?us-ascii?Q?r3Lf5ksttg/KWpeepEk5gnTgIoRi60+YjoX6a1YEzOjiu3i9TCTx/KkC94zH?=
 =?us-ascii?Q?AnJUBhzvO+amrgvtukG5LfA+KnuGbfrjb8BlR2Ug2aVlBjUKOCpKwLi/V+dC?=
 =?us-ascii?Q?D1scMP7sCUlun+BO57xV+pCNQuOzHjQhR9lJe+KFmEW1kYHe/FhC0VIZVH0y?=
 =?us-ascii?Q?A4HOjqeKK4VNeId2xX9gnxwNeKrQTxyiQ6exKuwh0zalL2uOi4B6lFbsYuc3?=
 =?us-ascii?Q?MZGkSWsvxvUtIMr1JoAAXtPn/sfT2IMScvBtYMeQNn9bHF4LGdBQjzZI7qdt?=
 =?us-ascii?Q?S69W/jUuDNth1IhSrv5LFusN8dthmyir/NuW+FGV/4gt5AbingzNzhg8idX+?=
 =?us-ascii?Q?FxpETHecLgl5+yjvf+oXK0J7nscwQhwESlvE35BnjAn5A+9v7nS0/09Mkn2k?=
 =?us-ascii?Q?PgKZioQ/eoCqop+/mFN3vXRZQnlv2dlirR1RMG4g9yH408TvV5BiByb0ZvdE?=
 =?us-ascii?Q?3gKW6PtsLuONFMNNh+D3x58CqSrn2ALsvzCoF6l6XaQHJu1Wi11HHr84A5dM?=
 =?us-ascii?Q?0Md0IlEqdr3wOigpnir8uMzrUfKuJr6K4pvdIY5LGLPIPn42w+xJeOjhjh5/?=
 =?us-ascii?Q?WrxLmiq7J5o3RpFhi4EkYxn8UBf3o0AVZKAIXgZBSlWBbtl3pNdUF9fCENOM?=
 =?us-ascii?Q?en7q0IoU8m9PuyJ/4PozM7HaeyMe/Q14flpLUpe5zBovjpKi+poR6GW0JANL?=
 =?us-ascii?Q?H0bSBvdvRx1pW50ZzcMu6zc624M8sMidfs/gXKCxCv9qDpd+1LLHpf1vvaU6?=
 =?us-ascii?Q?oMT6je+U9b107Z1DKXkLjife4DDvmxxB/PkDOpusMypOD5BTx2aOdLGbg06K?=
 =?us-ascii?Q?+MtRISHxCSNZyLn3oYqav/Hfn8q+iXLKkED4sD717q66QhZNpiYFtGKDTbjc?=
 =?us-ascii?Q?wz7jEtmiHSXu/gVpz5h6iquHDq8wQfvfCNoebfYiazSu5Wz7dEpSFjOadQw/?=
 =?us-ascii?Q?5Fj00k8kvue1uNtFLT2AP+vJO39GhLMz2/sgF2r6L6soD2RE4a8URDGFRIts?=
 =?us-ascii?Q?0h6k11UWh8HuoaeaDV6g1rQuO4ZamLrLjxBl6TlOUQHzJQGEBR1+nsoNNvEa?=
 =?us-ascii?Q?QbfgZ02ADh+w87tnP2YfibjlyANx/5MEWs1ZXLg8atQc2dRiTA1/ZX+whGaO?=
 =?us-ascii?Q?LCPaJRvttuqdZfGQP+rRrrfxQ9xR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB7272.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/9MFiabw7JK7w6ItwPVRnRemiz6usjUeAo0mrEEigGUI3YGKi3SKtn/c2D2f?=
 =?us-ascii?Q?S3PFR9mOA1TxvON6yaw2y3nff8fLUtUuzKUsb4OjNrxmpAi4dfRckp8KXuqk?=
 =?us-ascii?Q?8oRlhmnj7yvesxpwO9J4U6h45eausyQitbDyPtzIzp1LAZdel2fKaC22OPpE?=
 =?us-ascii?Q?59iDHCLTptV7I+suie+4D2CPKj57+VyvLIllJBYZJkaja/3pOjAN0onYPZoH?=
 =?us-ascii?Q?DonJ+vjnGo6Oz8VREbers3dmDEoS0GefZxmKe5Kmr/0Dqz+ypHxN/3AKTNSw?=
 =?us-ascii?Q?SqLFXm4N6LaIrkVVJvryaphVZhewToPr9eef57OxyLX4x2ruKwKTx0BlRNas?=
 =?us-ascii?Q?hWpsgAd3zjG7DwZthkpOfHEk0isE8ruLsbNmt80Z1/f7Zw193Tv7va5n+Ooh?=
 =?us-ascii?Q?IG0W8LY4OXBgk9MHP67u/z2Iv6Jw6oNE0erXVE2e9yXE0wpAEpGz9NwLMb3s?=
 =?us-ascii?Q?BghFJ7LaD0ebJxhSBiay1mt/ecuqYsL/lt7Ncpav2dFO+Mp6qk10JWj4jC56?=
 =?us-ascii?Q?v6BaRr12gRX2NT8jxUoCERvICYocnEisZ6Uqr4kXW3kYpUGrVLG40PY63uQH?=
 =?us-ascii?Q?VkwlNVmsLtnIv5WA5DI2AzK/Or5MyXlt+QBucQN8r2HMGkIMsjxK32eRMy1n?=
 =?us-ascii?Q?JTUdLu6NuYQuWrCEzmTn5cbFX65v1G1ZOym5/tvAoUEJpL6M5gAzPayfsCU2?=
 =?us-ascii?Q?NCFOc+RAVoXFDjtwvIK8dGuBzuamqutY4tyOet+Qax2mNJLpp1Ng/yEGGYNK?=
 =?us-ascii?Q?We5homE3FPw3sV5hR+WrNFZJLJT0/QwohtuJBb6rCDBtSaZPImOl+Ct9GaaK?=
 =?us-ascii?Q?MFWx/6s7AbASWaS058+KUNv8UJIM7efNvRb/HLiGvfQ3WuOitqnA7ZmObIpk?=
 =?us-ascii?Q?Lyrb1kLfb52/Ht3yzX4HM9AqqYWU8iAXsgI38Wckg93buEYNsPr0h1g7o/E/?=
 =?us-ascii?Q?th/4Lhdzj+zl9j7ujqjm/Qn98ZYD8vAcvGDzR59MNDcHHz313FZGpR/VVyW8?=
 =?us-ascii?Q?upm1xHgH2AcDt18W9y6QmTnqHZnTEL2dJfUwlcspizNv9M6M0qfjkGBzvQ+o?=
 =?us-ascii?Q?UTETAU05gbEO6rNPOnVoP7VZmN1apX0VM0Fy/30iO+NFmqYZjJpmXmzTYTY2?=
 =?us-ascii?Q?ZVPQ1T8s3AlLmk/8voDvbbjMY59xqJPCef/zM2x1dQtvKukE8oM7P6i0deb4?=
 =?us-ascii?Q?MgpRgg/nOqNL2ty8Ythuqn898a/gF5mNDmNjiW7h4GEQXrn496s84DC58Dd+?=
 =?us-ascii?Q?BLuh8zeInJhzmagHTyp4e1z3kEHER5vO5kfZ4y2FvUOdtGo67RLwm5lYqjRc?=
 =?us-ascii?Q?W0dM5UUpbk/v5O+gGs+cqh19FmmbUbvYpu+85KQAw1ywH+01k/kd+fIdgHry?=
 =?us-ascii?Q?L70ujZsFT6A0JuwvjLtdni+0CNKgAD6IeuK4rG4J0iOTEyqga6vg5EtqDib9?=
 =?us-ascii?Q?2hRbtIZse+KtHkfF9o572j3LzYvGk1ob4W2NIvUSVEHKq6xZbkI/Tn0rw6Mf?=
 =?us-ascii?Q?c9eSBchYE0xaN2ApZ0Zr7GGeVVUsz9/Lhqrz1lv7NL8BYjQrpb0F/zOvbJn2?=
 =?us-ascii?Q?cx9KCZ0eDMEkGIBK4IwWNwzDBRBte27K3EFXUk53?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3a2bc03-9d0c-4634-a6f7-08dd5c6981bc
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB7272.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 04:43:57.6752 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j1hrAssSrWSairo8gUxXMWQIHQnspsMWEYEyOO3yLBL+KFkMoU0VdIvybEJvMsiStx8F8KJKR6izTptse9wEkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5674
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

When a zone device page is split (via huge pmd folio split). The
driver callback for folio_split is invoked to let the device driver
know that the folio size has been split into a smaller order.

The HMM test driver has been updated to handle the split, since the
test driver uses backing pages, it requires a mechanism of reorganizing
the backing pages (backing pages are used to create a mirror device)
again into the right sized order pages. This is supported by exporting
prep_compound_page().

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
 include/linux/memremap.h |  7 +++++++
 include/linux/mm.h       |  1 +
 lib/test_hmm.c           | 35 +++++++++++++++++++++++++++++++++++
 mm/huge_memory.c         |  5 +++++
 mm/page_alloc.c          |  1 +
 5 files changed, 49 insertions(+)

diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index 11d586dd8ef1..2091b754f1da 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -100,6 +100,13 @@ struct dev_pagemap_ops {
 	 */
 	int (*memory_failure)(struct dev_pagemap *pgmap, unsigned long pfn,
 			      unsigned long nr_pages, int mf_flags);
+
+	/*
+	 * Used for private (un-addressable) device memory only.
+	 * This callback is used when a folio is split into
+	 * a smaller folio
+	 */
+	void (*folio_split)(struct folio *head, struct folio *tail);
 };
 
 #define PGMAP_ALTMAP_VALID	(1 << 0)
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 98a67488b5fe..3d0e91e0a923 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1415,6 +1415,7 @@ static inline struct folio *virt_to_folio(const void *x)
 void __folio_put(struct folio *folio);
 
 void split_page(struct page *page, unsigned int order);
+void prep_compound_page(struct page *page, unsigned int order);
 void folio_copy(struct folio *dst, struct folio *src);
 int folio_mc_copy(struct folio *dst, struct folio *src);
 
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index a81d2f8a0426..18b6a7b061d7 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -1640,10 +1640,45 @@ static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
 	return ret;
 }
 
+
+static void dmirror_devmem_folio_split(struct folio *head, struct folio *tail)
+{
+	struct page *rpage = BACKING_PAGE(folio_page(head, 0));
+	struct folio *new_rfolio;
+	struct folio *rfolio;
+	unsigned long offset = 0;
+
+	if (!rpage) {
+		folio_page(tail, 0)->zone_device_data = NULL;
+		return;
+	}
+
+	offset = folio_pfn(tail) - folio_pfn(head);
+	rfolio = page_folio(rpage);
+	new_rfolio = page_folio(folio_page(rfolio, offset));
+
+	folio_page(tail, 0)->zone_device_data = folio_page(new_rfolio, 0);
+
+	if (folio_pfn(tail) - folio_pfn(head) == 1) {
+		if (folio_order(head))
+			prep_compound_page(folio_page(rfolio, 0),
+						folio_order(head));
+		folio_set_count(rfolio, 1);
+	}
+	clear_compound_head(folio_page(new_rfolio, 0));
+	if (folio_order(tail))
+		prep_compound_page(folio_page(new_rfolio, 0),
+						folio_order(tail));
+	folio_set_count(new_rfolio, 1);
+	folio_page(new_rfolio, 0)->mapping = folio_page(rfolio, 0)->mapping;
+	tail->pgmap = head->pgmap;
+}
+
 static const struct dev_pagemap_ops dmirror_devmem_ops = {
 	.page_free	= dmirror_devmem_free,
 	.migrate_to_ram	= dmirror_devmem_fault,
 	.page_free	= dmirror_devmem_free,
+	.folio_split	= dmirror_devmem_folio_split,
 };
 
 static int dmirror_device_init(struct dmirror_device *mdevice, int id)
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 995ac8be5709..518a70d1b58a 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3655,6 +3655,11 @@ static int __split_unmapped_folio(struct folio *folio, int new_order,
 						MTHP_STAT_NR_ANON, 1);
 			}
 
+			if (folio_is_device_private(origin_folio) &&
+					origin_folio->pgmap->ops->folio_split)
+				origin_folio->pgmap->ops->folio_split(
+					origin_folio, release);
+
 			/*
 			 * Unfreeze refcount first. Additional reference from
 			 * page cache.
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 17ea8fb27cbf..563f7e39aa79 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -573,6 +573,7 @@ void prep_compound_page(struct page *page, unsigned int order)
 
 	prep_compound_head(page, order);
 }
+EXPORT_SYMBOL_GPL(prep_compound_page);
 
 static inline void set_buddy_order(struct page *page, unsigned int order)
 {
-- 
2.48.1

