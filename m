Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABED5AFDFCE
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 08:06:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B0DF10E730;
	Wed,  9 Jul 2025 06:06:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LcpzD6yj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2063.outbound.protection.outlook.com [40.107.96.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68EC910E72E;
 Wed,  9 Jul 2025 06:06:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MwkoaBMUR75aXKLswdT6hGG4KVir468FIPQlHDh58V0QUeWZLF6W6Njwzu7ca+ETIZ3m1Jfsa3RjqDyYVvXlwtOn7b8WITeQmQRzniJNCRaicNLnnCK+9jrSRrUkh0pzxoicy6js5VYe77Au3KitaRgUAVcP32G9cjgTa+SvAq188JspMeBi9c31V+traBzRuLg9MZcxyNNTKYOIOIqtGGXycVV3hjJHZ8Q0g0eZjqKs7XqiY6GkBfGafPj7mwY+KV8SQiifr1w6RuWChGXbzU6kHlTL7u6GV0M8uBJPVdUJCEqHAe6QT2l6m/ST8DlhrnxN964DTFCk20M4iMSUkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EWBqPBaSTk+CFyIo1UFKjJP7ssXyR/uIyI8GLIR1Tz4=;
 b=r+nYsZDm+GW7fmNPf3jKa+EJl9oiFompWNoKJPvFNpUvBBNjHnUnlpjuCOMU+tEgPTBrFqktKVrmEUbLnvJnjAKmtVsV1/zYE2kvIuVlagWVwuXQaiZqvQb14UJcORsm58IzsBiB0uK1hKQJSuw9kDY5lO4op/e40NF9Admrm0r1jN32+VKGrqvUimsXtJs/UjRqrUK40PB94cGwCrgIlYITdKKqvLh5DUnei5ECFrTZe8SNuLKYP1ZcKvMVrW5kPZQMrRQX8CxEfAkyOc8rQngjzCY/3+mnPN5gqqDasRhgY011Sod6sn2T2muk6sZFg4jd/RQaj1QS2CNwN+LH7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EWBqPBaSTk+CFyIo1UFKjJP7ssXyR/uIyI8GLIR1Tz4=;
 b=LcpzD6yjopS15cPOcShWIYzAW6P1IILU9609cfcqbR5auxGmTGzUIwrV52s2tt5MoMvbVFzgTNuRZtCqjkpStU6aD5gbBAojLsD9Md/trsZbV7bmEObdfXJOHkdwFqFv7k2CcPVr3vJN8W493f3vNpsJRxFAaxHRoMLDKzUuwrSZK6wanuHRyy5PgGEYIDtevzqkQ+dfGfc/DE1ghwDPIEWZDUt/K7CMlyrRcgNw9JjWtClrivrrHdFzc3A6uGWYu+Sq3i/2QC7QomH6y+RYTcDf1/kUKIaEFcSxZk1zvjqHZ8J8I+RSHXBKW9ZC8Mk0B6b0JS7gAnKFO4L1VNBnww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 BN5PR12MB9463.namprd12.prod.outlook.com (2603:10b6:408:2a9::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.27; Wed, 9 Jul 2025 06:06:15 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%3]) with mapi id 15.20.8901.023; Wed, 9 Jul 2025
 06:06:14 +0000
Date: Wed, 9 Jul 2025 16:06:09 +1000
From: Alistair Popple <apopple@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: Balbir Singh <balbirs@nvidia.com>, linux-mm@kvack.org, 
 akpm@linux-foundation.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>, 
 Shuah Khan <shuah@kernel.org>, Barry Song <baohua@kernel.org>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, 
 Matthew Wilcox <willy@infradead.org>, Peter Xu <peterx@redhat.com>,
 Zi Yan <ziy@nvidia.com>, 
 Kefeng Wang <wangkefeng.wang@huawei.com>, Jane Chu <jane.chu@oracle.com>, 
 Donet Tom <donettom@linux.ibm.com>
Subject: Re: [RFC 03/11] mm/thp: zone_device awareness in THP handling code
Message-ID: <ijmtnot6veysbdhwmn5hbchecllsoookwnca3sxostb6evderu@ux2pujcp5ctf>
References: <20250306044239.3874247-1-balbirs@nvidia.com>
 <20250306044239.3874247-4-balbirs@nvidia.com>
 <be029205-9d03-43b0-84f7-1dab530639ca@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be029205-9d03-43b0-84f7-1dab530639ca@redhat.com>
X-ClientProxiedBy: SY6PR01CA0074.ausprd01.prod.outlook.com
 (2603:10c6:10:110::7) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|BN5PR12MB9463:EE_
X-MS-Office365-Filtering-Correlation-Id: 86a66a71-21c2-4161-8295-08ddbeaeb615
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RQGq2rFA8QOSK5c97HMMuAZsWc13l+HbB3pJbwKDpSVpNrj+2IRRCJLG7Z1N?=
 =?us-ascii?Q?JgBYt3lbOaKE0lwu5gzaPGUQ+AN/acG/UjpjCCQQ8qbGVwWql7kle1dk1mZq?=
 =?us-ascii?Q?ZFcEE2Iz6vHZzpnsX9z7MKC5J00zMhbFpkmenAz4lNcvV7QQtJo25GyykG3/?=
 =?us-ascii?Q?AjAN5l7F4znoNcdVNjv/GYCRDRUNwEiuouLKJCsybuStaZyURGbJ4StNoAx3?=
 =?us-ascii?Q?nmPbPbj7J+HN9wi2SpW+ulXjmhSNmMdsk1hidYQ1QTLaBIEdzKkMlpnuUO92?=
 =?us-ascii?Q?MogyxOphoPbmT9cFkzCE8QPp9zVuwV/Xmh0JA/QwYAKi2WdLq5Eykn68NtlK?=
 =?us-ascii?Q?I54QTIwDl7WU+kufxIWYsjGMywjRIj0eGFnAI7dzTUknHKEYGFLQafmem18m?=
 =?us-ascii?Q?sogecr5TYoR1mIz/3/dHWAnTayXP69FCgQQeeAIUOObpc94G7HmxhoYypo6k?=
 =?us-ascii?Q?Z/ZX9VVSjYCjVzkKfBEViLmVCKcincHb6lMjndutO+j1xoVmvqDOHEBwC7EP?=
 =?us-ascii?Q?iyy/4PMgCa2Sq7W8lAjAklcUSkjeelb+OdozqF4h6n+PihdURaSE/jS28u6q?=
 =?us-ascii?Q?tNqQ4lgGJwS1n92qTXXT1mvmObkIpxthYpjNZUtKwucOfoxyqxHVSBLG+bEe?=
 =?us-ascii?Q?IW0TXQhnQ543RjpwG9V7WCqOPsnn6h1dGaR72UrhWT+4mN7bwmigDiiDwp5Q?=
 =?us-ascii?Q?HG9cl20yP7440DQRdMxvxnSy5TGkjfYSmrhUb6m9vmJ723cFaFjNSEXkR790?=
 =?us-ascii?Q?8Yvn42EY52hmJFRFaPsEakp6zSGlq/6pwNV3XreB4uRWk9S9SI2qLpDhSeyH?=
 =?us-ascii?Q?NwNw6oMZSbuVNXdW5M+kzo5HvqCMziebCQuHLcNLCC+TXuXgLC6OU0yiACw3?=
 =?us-ascii?Q?CkwCnMA9BDTZkny5RinfeGzCkt9S/Susz/xwOTXr1Syprcqyd0Cwa5XtfFyz?=
 =?us-ascii?Q?u5szGz/np2AtlHWKu1TgOqgTgFgCBd1qm5RNGZNQxB/f3uD1mftC2y5xT5Sg?=
 =?us-ascii?Q?qmvJjbu4YtO0QmXDQXJ7xdUFb+E/hhYh0UNFmucCotAlKIClLbqWiEOrHpuB?=
 =?us-ascii?Q?KEvZ46A+THycqmFa7muMB/ra4OctlXsHB/twSvjKnWPBKSyxZWFoQ4dV1NGK?=
 =?us-ascii?Q?pTgD3mkDR2M0r3XRpCnvsyjr2gnaJg3CrcMCRqJ0t6byUvYTMRvsT4tDnB8P?=
 =?us-ascii?Q?tLFjqVk27mE9F/BkTY2EaFq3PmwMn4Xm5smXaORyPDNe7nl8heQIDuzwLxj6?=
 =?us-ascii?Q?S5Nhudap6/juAN3qzLsGpXW3Y8cJNfNaYOJVr6Cr1yzKmHbhLzxMszFH1A1R?=
 =?us-ascii?Q?hLjfrrRojhFH3Aku2qQ+F/9nFjEBnoSOIykMWDj9iMl2sBXzcpiDhHobviws?=
 =?us-ascii?Q?cS8fpTIdJup+ZUWkDwbqxRzhJCqiC++tPGN48XVKHo4MtLXfbw2IJsYOcaRI?=
 =?us-ascii?Q?mEZmiCmPAcE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yJ0v/YXVkJQBo3jCE9zGAV0oEzHl4r/fWHRaz5UNsa0cjkZO0n17QMP1mi1X?=
 =?us-ascii?Q?Yikm96mb3i8kuOGnYks6Mu4dX5XCi8z1OYYE8K/1XWwwXEBrK/Toyv1sukU1?=
 =?us-ascii?Q?ua8iE/sJkirFSdibSJDMJQxaO/ri7TckCXa1sx02YGaR/AnH9YD29B+GzcBq?=
 =?us-ascii?Q?Mb8d8Y1q79cKrjtNon/HcJHyYffE3KPrpPry+5mjsVU/JT1DKNwTd/t0IiGQ?=
 =?us-ascii?Q?qNl17A+73j8Ydy0BVfI1PcGvLpjXNpeoGL62C2fRyyRnhiId30WNDGS96Xm7?=
 =?us-ascii?Q?307uhPRHRsIeOdOQo4AXjgeUX47E8ti/4IgJQL0Oz5IqfiD7NWBqq3fjj/qo?=
 =?us-ascii?Q?IhNEoLxYy8qE0PujAXlxcjDkoMETaMneFTzN/OJyt+dwybsS2pbWVjyism9d?=
 =?us-ascii?Q?7t6GlKZdKJO0RSztTMmntduge+y0gbKN0YEBscYK0W+ZEM4oIGGWoK1YLODX?=
 =?us-ascii?Q?cDkxC+LB7Il+N7+QuMpTcvJqZZ3ZAcUG9utmohc9opOxWazvvGqlYLS3PjA9?=
 =?us-ascii?Q?E1MdtNCzNZkKxa7nVyiuyZh0I5bmdMAX1m3/wO7JJokjYU2WHFjzFa1KqvkN?=
 =?us-ascii?Q?AxIaW1H8L5fLqrGEsncIKs+3PTCTFcj5kFE2Iyn9l1z+jxOA/iRwstTBkbRz?=
 =?us-ascii?Q?QcIb9ubm6yUZHd+N1pQDrKZK1u3O8Cmd+qSQwOmJS1wocj8hlPOa1HM7iKlK?=
 =?us-ascii?Q?7OJAYcTF8knXK5mmAuyW/RAJlEQU/ZGJc95Ehou/GFE2SmTA+MWR4Q1le0KG?=
 =?us-ascii?Q?NBW2CzbFvR3slS2jwt/KIvfeNul9gTn0tWjjfC3GMPtnPWDVUjcn44CwkTYY?=
 =?us-ascii?Q?N/R8DQVov+NewboO1fNsdHM9TEBHxkkP8mgtXvPFQAtsvlkjE0LhqXd6O3VN?=
 =?us-ascii?Q?X/l1i05co1ZKSOPMeVWkuSrXwj9dwb1YYMquc9g7GtFPS4362ofiGL824GKL?=
 =?us-ascii?Q?pLqkwRGbZoEdRxEyb55Sxjm1yOLBU0S6cqEki+fCzBF/7p0F9DTKg77okf/e?=
 =?us-ascii?Q?rxCu8OuIPHYMHA3S9axGvycjazj89CqfXpR8GP39BynA34+rrZvcOdgQUgiO?=
 =?us-ascii?Q?hjVoAZI3g9hLbZXz3dJ+nSF9gLHjjLaVQW9fu2t+8HyPsJnfW6W8g8opAmQo?=
 =?us-ascii?Q?Ueka62njqOCLTk2V4+bSl42MslUvajptxxg667A1ynKjSJe6r5PnMlP+ZuRB?=
 =?us-ascii?Q?TrWmqaiS/RWRbxr6LOb1KM62TbAVB3P1ls1omHcsTrqAF8aig6OphZdzvenI?=
 =?us-ascii?Q?7KSooVUCv0HhB/Z4vCNrnNAa49CisT1UDvVjNv4qtEg2S1nx8HVd2NfLEvhC?=
 =?us-ascii?Q?BgQXkEb+rBxicmILT7KIGLPN9BbKbvdPbUWgTNJ1/Ava7HJvmBL4lNhKqz/J?=
 =?us-ascii?Q?YQhOa8E6EIzJwxNcsEqnF2wcT9kKhwqllEmI34u2W3BJwXekqR7zGs20plm/?=
 =?us-ascii?Q?K6CvrGNbFYF1aJeyOxCuwg+bnikbI3nrc7gQc6hqJyudbsM+gAHTfDU5a1Lc?=
 =?us-ascii?Q?75EtpMMwD1D/YJpa+kICDigM4cKWG1MY2Bwdjk8oFM/4W6utihzQbrPZoRoP?=
 =?us-ascii?Q?6Z5f/4OaWn850ycXUNNJd1RrqEttQ6TwK4IfiXRs?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86a66a71-21c2-4161-8295-08ddbeaeb615
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 06:06:14.6770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eBjsaJQjj8+GdsvCyySF15Du1PwPRdZnAp5RMk7uXFQyVOGSvJPQRiltHpV+VANyPX3pX2S6VeE7VBt55aEabg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9463
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

On Tue, Jul 08, 2025 at 04:10:55PM +0200, David Hildenbrand wrote:
> On 06.03.25 05:42, Balbir Singh wrote:
> > Make THP handling code in the mm subsystem for THP pages
> > aware of zone device pages. Although the code is
> > designed to be generic when it comes to handling splitting
> > of pages, the code is designed to work for THP page sizes
> > corresponding to HPAGE_PMD_NR.
> > 
> > Modify page_vma_mapped_walk() to return true when a zone
> > device huge entry is present, enabling try_to_migrate()
> > and other code migration paths to appropriately process the
> > entry
> > 
> > pmd_pfn() does not work well with zone device entries, use
> > pfn_pmd_entry_to_swap() for checking and comparison as for
> > zone device entries.
> > 
> > try_to_map_to_unused_zeropage() does not apply to zone device
> > entries, zone device entries are ignored in the call.
> > 
> > Signed-off-by: Balbir Singh <balbirs@nvidia.com>
> > ---
> >   mm/huge_memory.c     | 151 +++++++++++++++++++++++++++++++------------
> >   mm/migrate.c         |   2 +
> >   mm/page_vma_mapped.c |  10 +++
> >   mm/rmap.c            |  19 +++++-
> >   4 files changed, 138 insertions(+), 44 deletions(-)
> > 
> > diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> > index 826bfe907017..d8e018d1bdbd 100644
> > --- a/mm/huge_memory.c
> > +++ b/mm/huge_memory.c
> > @@ -2247,10 +2247,17 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
> >   		} else if (thp_migration_supported()) {
> >   			swp_entry_t entry;
> > -			VM_BUG_ON(!is_pmd_migration_entry(orig_pmd));
> >   			entry = pmd_to_swp_entry(orig_pmd);
> >   			folio = pfn_swap_entry_folio(entry);
> >   			flush_needed = 0;
> > +
> > +			VM_BUG_ON(!is_pmd_migration_entry(*pmd) &&
> > +					!folio_is_device_private(folio));
> 
> Convert that to a VM_WARN_ON_ONCE() while you are at it.
> 
> But really, check that the *pmd* is as expected (device_pritavte entry), and
> not the folio after the effects.
> 
> Also, hiding all that under the thp_migration_supported() looks wrong.
> 
> Likely you must clean that up first, to have something that expresses that
> we support PMD swap entries or sth like that. Not just "migration entries".
> 
> 
> > +
> > +			if (folio_is_device_private(folio)) {
> > +				folio_remove_rmap_pmd(folio, folio_page(folio, 0), vma);
> > +				WARN_ON_ONCE(folio_mapcount(folio) < 0);
> > +			}
> 
> 
> zap_nonpresent_ptes() does
> 
> if (is_device_private_entry(entry)) {
> 	...
> } else if (is_migration_entry(entry)) {
> 	....
> }
> 
> Can we adjust the same way of foing things? (yes, we might want a
> thp_migration_supported() check somewhere)
> 
> >   		} else
> >   			WARN_ONCE(1, "Non present huge pmd without pmd migration enabled!");
> > @@ -2264,6 +2271,15 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
> >   				       -HPAGE_PMD_NR);
> >   		}
> > +		/*
> > +		 * Do a folio put on zone device private pages after
> > +		 * changes to mm_counter, because the folio_put() will
> > +		 * clean folio->mapping and the folio_test_anon() check
> > +		 * will not be usable.
> > +		 */
> > +		if (folio_is_device_private(folio))
> > +			folio_put(folio);
> > +
> >   		spin_unlock(ptl);
> >   		if (flush_needed)
> >   			tlb_remove_page_size(tlb, &folio->page, HPAGE_PMD_SIZE);
> > @@ -2392,7 +2408,8 @@ int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
> >   		struct folio *folio = pfn_swap_entry_folio(entry);
> >   		pmd_t newpmd;
> > -		VM_BUG_ON(!is_pmd_migration_entry(*pmd));
> > +		VM_BUG_ON(!is_pmd_migration_entry(*pmd) &&
> > +			  !folio_is_device_private(folio));
> >   		if (is_writable_migration_entry(entry)) {
> >   			/*
> >   			 * A protection check is difficult so
> > @@ -2405,9 +2422,11 @@ int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
> >   			newpmd = swp_entry_to_pmd(entry);
> >   			if (pmd_swp_soft_dirty(*pmd))
> >   				newpmd = pmd_swp_mksoft_dirty(newpmd);
> > -		} else {
> > +		} else if (is_writable_device_private_entry(entry)) {
> > +			newpmd = swp_entry_to_pmd(entry);
> > +			entry = make_device_exclusive_entry(swp_offset(entry));
> > +		} else
> >   			newpmd = *pmd;
> > -		}
> >   		if (uffd_wp)
> >   			newpmd = pmd_swp_mkuffd_wp(newpmd);
> > @@ -2860,11 +2879,12 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
> >   	struct page *page;
> >   	pgtable_t pgtable;
> >   	pmd_t old_pmd, _pmd;
> > -	bool young, write, soft_dirty, pmd_migration = false, uffd_wp = false;
> > -	bool anon_exclusive = false, dirty = false;
> > +	bool young, write, soft_dirty, uffd_wp = false;
> > +	bool anon_exclusive = false, dirty = false, present = false;
> >   	unsigned long addr;
> >   	pte_t *pte;
> >   	int i;
> > +	swp_entry_t swp_entry;
> >   	VM_BUG_ON(haddr & ~HPAGE_PMD_MASK);
> >   	VM_BUG_ON_VMA(vma->vm_start > haddr, vma);
> > @@ -2918,20 +2938,25 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
> >   		return __split_huge_zero_page_pmd(vma, haddr, pmd);
> >   	}
> > -	pmd_migration = is_pmd_migration_entry(*pmd);
> > -	if (unlikely(pmd_migration)) {
> > -		swp_entry_t entry;
> > +	present = pmd_present(*pmd);
> > +	if (unlikely(!present)) {
> > +		swp_entry = pmd_to_swp_entry(*pmd);
> >   		old_pmd = *pmd;
> > -		entry = pmd_to_swp_entry(old_pmd);
> > -		page = pfn_swap_entry_to_page(entry);
> > -		write = is_writable_migration_entry(entry);
> > +
> > +		folio = pfn_swap_entry_folio(swp_entry);
> > +		VM_BUG_ON(!is_migration_entry(swp_entry) &&
> > +				!is_device_private_entry(swp_entry));
> > +		page = pfn_swap_entry_to_page(swp_entry);
> > +		write = is_writable_migration_entry(swp_entry);
> > +
> >   		if (PageAnon(page))
> > -			anon_exclusive = is_readable_exclusive_migration_entry(entry);
> > -		young = is_migration_entry_young(entry);
> > -		dirty = is_migration_entry_dirty(entry);
> > +			anon_exclusive =
> > +				is_readable_exclusive_migration_entry(swp_entry);
> >   		soft_dirty = pmd_swp_soft_dirty(old_pmd);
> >   		uffd_wp = pmd_swp_uffd_wp(old_pmd);
> > +		young = is_migration_entry_young(swp_entry);
> > +		dirty = is_migration_entry_dirty(swp_entry);
> >   	} else {
> >   		/*
> >   		 * Up to this point the pmd is present and huge and userland has
> > @@ -3015,30 +3040,45 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
> >   	 * Note that NUMA hinting access restrictions are not transferred to
> >   	 * avoid any possibility of altering permissions across VMAs.
> >   	 */
> > -	if (freeze || pmd_migration) {
> > +	if (freeze || !present) {
> >   		for (i = 0, addr = haddr; i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE) {
> >   			pte_t entry;
> > -			swp_entry_t swp_entry;
> > -
> > -			if (write)
> > -				swp_entry = make_writable_migration_entry(
> > -							page_to_pfn(page + i));
> > -			else if (anon_exclusive)
> > -				swp_entry = make_readable_exclusive_migration_entry(
> > -							page_to_pfn(page + i));
> > -			else
> > -				swp_entry = make_readable_migration_entry(
> > -							page_to_pfn(page + i));
> > -			if (young)
> > -				swp_entry = make_migration_entry_young(swp_entry);
> > -			if (dirty)
> > -				swp_entry = make_migration_entry_dirty(swp_entry);
> > -			entry = swp_entry_to_pte(swp_entry);
> > -			if (soft_dirty)
> > -				entry = pte_swp_mksoft_dirty(entry);
> > -			if (uffd_wp)
> > -				entry = pte_swp_mkuffd_wp(entry);
> > -
> > +			if (freeze || is_migration_entry(swp_entry)) {
> > +				if (write)
> > +					swp_entry = make_writable_migration_entry(
> > +								page_to_pfn(page + i));
> > +				else if (anon_exclusive)
> > +					swp_entry = make_readable_exclusive_migration_entry(
> > +								page_to_pfn(page + i));
> > +				else
> > +					swp_entry = make_readable_migration_entry(
> > +								page_to_pfn(page + i));
> > +				if (young)
> > +					swp_entry = make_migration_entry_young(swp_entry);
> > +				if (dirty)
> > +					swp_entry = make_migration_entry_dirty(swp_entry);
> > +				entry = swp_entry_to_pte(swp_entry);
> > +				if (soft_dirty)
> > +					entry = pte_swp_mksoft_dirty(entry);
> > +				if (uffd_wp)
> > +					entry = pte_swp_mkuffd_wp(entry);
> > +			} else {
> > +				VM_BUG_ON(!is_device_private_entry(swp_entry));
> > +				if (write)
> > +					swp_entry = make_writable_device_private_entry(
> > +								page_to_pfn(page + i));
> > +				else if (anon_exclusive)
> > +					swp_entry = make_device_exclusive_entry(
> > +								page_to_pfn(page + i));
> 
> I am pretty sure this is wrong. You cannot suddenly mix in device-exclusive
> entries.
> 
> And now I am confused again how device-private, anon and GUP interact.

See my comments on Balbir's v1 resend. I'm pretty sure he's just gotten mixed
up with the wonderfully confusing naming I helped create and incorrectly copied
the code for making migration entries above. GUP doesn't work for device-private
pages - it will fault which will cause the device driver to migrate the pages
back.

> > +				else
> > +					swp_entry = make_readable_device_private_entry(
> > +								page_to_pfn(page + i));
> > +				entry = swp_entry_to_pte(swp_entry);
> > +				if (soft_dirty)
> > +					entry = pte_swp_mksoft_dirty(entry);
> > +				if (uffd_wp)
> > +					entry = pte_swp_mkuffd_wp(entry);
> > +			}
> >   			VM_WARN_ON(!pte_none(ptep_get(pte + i)));
> >   			set_pte_at(mm, addr, pte + i, entry);
> >   		}
> > @@ -3065,7 +3105,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
> >   	}
> >   	pte_unmap(pte);
> > -	if (!pmd_migration)
> > +	if (present)
> >   		folio_remove_rmap_pmd(folio, page, vma);
> >   	if (freeze)
> >   		put_page(page);
> > @@ -3077,6 +3117,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
> >   void split_huge_pmd_locked(struct vm_area_struct *vma, unsigned long address,
> >   			   pmd_t *pmd, bool freeze, struct folio *folio)
> >   {
> > +	struct folio *pmd_folio;
> >   	VM_WARN_ON_ONCE(folio && !folio_test_pmd_mappable(folio));
> >   	VM_WARN_ON_ONCE(!IS_ALIGNED(address, HPAGE_PMD_SIZE));
> >   	VM_WARN_ON_ONCE(folio && !folio_test_locked(folio));
> > @@ -3089,7 +3130,14 @@ void split_huge_pmd_locked(struct vm_area_struct *vma, unsigned long address,
> >   	 */
> >   	if (pmd_trans_huge(*pmd) || pmd_devmap(*pmd) ||
> >   	    is_pmd_migration_entry(*pmd)) {
> > -		if (folio && folio != pmd_folio(*pmd))
> > +		if (folio && !pmd_present(*pmd)) {
> > +			swp_entry_t swp_entry = pmd_to_swp_entry(*pmd);
> > +
> > +			pmd_folio = page_folio(pfn_swap_entry_to_page(swp_entry));
> > +		} else {
> > +			pmd_folio = pmd_folio(*pmd);
> > +		}
> > +		if (folio && folio != pmd_folio)
> >   			return;
> >   		__split_huge_pmd_locked(vma, pmd, address, freeze);
> >   	}
> > @@ -3581,11 +3629,16 @@ static int __split_unmapped_folio(struct folio *folio, int new_order,
> >   				     folio_test_swapcache(origin_folio)) ?
> >   					     folio_nr_pages(release) : 0));
> > +			if (folio_is_device_private(release))
> > +				percpu_ref_get_many(&release->pgmap->ref,
> > +							(1 << new_order) - 1);
> > +
> >   			if (release == origin_folio)
> >   				continue;
> > -			lru_add_page_tail(origin_folio, &release->page,
> > -						lruvec, list);
> > +			if (!folio_is_device_private(origin_folio))
> > +				lru_add_page_tail(origin_folio, &release->page,
> > +							lruvec, list);
> >   			/* Some pages can be beyond EOF: drop them from page cache */
> >   			if (release->index >= end) {
> > @@ -4625,7 +4678,10 @@ int set_pmd_migration_entry(struct page_vma_mapped_walk *pvmw,
> >   		return 0;
> >   	flush_cache_range(vma, address, address + HPAGE_PMD_SIZE);
> > -	pmdval = pmdp_invalidate(vma, address, pvmw->pmd);
> > +	if (!folio_is_device_private(folio))
> > +		pmdval = pmdp_invalidate(vma, address, pvmw->pmd);
> > +	else
> > +		pmdval = pmdp_huge_clear_flush(vma, address, pvmw->pmd);
> 
> Please handle this like we handle the PTE case -- checking for pmd_present()
> instead.
> 
> Avoid placing these nasty folio_is_device_private() all over the place where
> avoidable.
> 
> >   	/* See folio_try_share_anon_rmap_pmd(): invalidate PMD first. */
> >   	anon_exclusive = folio_test_anon(folio) && PageAnonExclusive(page);
> > @@ -4675,6 +4731,17 @@ void remove_migration_pmd(struct page_vma_mapped_walk *pvmw, struct page *new)
> >   	entry = pmd_to_swp_entry(*pvmw->pmd);
> >   	folio_get(folio);
> >   	pmde = mk_huge_pmd(new, READ_ONCE(vma->vm_page_prot));
> > +
> > +	if (unlikely(folio_is_device_private(folio))) {
> > +		if (pmd_write(pmde))
> > +			entry = make_writable_device_private_entry(
> > +							page_to_pfn(new));
> > +		else
> > +			entry = make_readable_device_private_entry(
> > +							page_to_pfn(new));
> > +		pmde = swp_entry_to_pmd(entry);
> > +	}
> > +
> >   	if (pmd_swp_soft_dirty(*pvmw->pmd))
> >   		pmde = pmd_mksoft_dirty(pmde);
> >   	if (is_writable_migration_entry(entry))
> > diff --git a/mm/migrate.c b/mm/migrate.c
> > index 59e39aaa74e7..0aa1bdb711c3 100644
> > --- a/mm/migrate.c
> > +++ b/mm/migrate.c
> > @@ -200,6 +200,8 @@ static bool try_to_map_unused_to_zeropage(struct page_vma_mapped_walk *pvmw,
> >   	if (PageCompound(page))
> >   		return false;
> > +	if (folio_is_device_private(folio))
> > +		return false;
> 
> Why is that check required when you are adding THP handling and there is a
> PageCompound check right there?
> 
> >   	VM_BUG_ON_PAGE(!PageAnon(page), page);
> >   	VM_BUG_ON_PAGE(!PageLocked(page), page);
> >   	VM_BUG_ON_PAGE(pte_present(*pvmw->pte), page);
> > diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
> > index e463c3be934a..5dd2e51477d3 100644
> > --- a/mm/page_vma_mapped.c
> > +++ b/mm/page_vma_mapped.c
> > @@ -278,6 +278,16 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
> >   			 * cannot return prematurely, while zap_huge_pmd() has
> >   			 * cleared *pmd but not decremented compound_mapcount().
> >   			 */
> > +			swp_entry_t entry;
> > +
> > +			if (!thp_migration_supported())
> > +				return not_found(pvmw);
> 
> This check looks misplaced. We should follow the same model as check_pte().
> 
> Checking for THP migration support when you are actually caring about
> device-private entries is weird.
> 
> That is, I would expect something like
> 
> } else if (is_swap_pmd(pmde)) {
> 	swp_entry_t entry;
> 
> 	entry = pmd_to_swp_entry(pmde);
> 	if (!is_device_private_entry(entry))
> 		return false;
> 
> 	...
> }
> 
> > +			entry = pmd_to_swp_entry(pmde);
> > +			if (is_device_private_entry(entry)) {
> > +				pvmw->ptl = pmd_lock(mm, pvmw->pmd);
> > +				return true;
> > +			}
> > +
> >   			if ((pvmw->flags & PVMW_SYNC) &&
> >   			    thp_vma_suitable_order(vma, pvmw->address,
> >   						   PMD_ORDER) &&
> > diff --git a/mm/rmap.c b/mm/rmap.c
> > index 67bb273dfb80..67e99dc5f2ef 100644
> > --- a/mm/rmap.c
> > +++ b/mm/rmap.c
> > @@ -2326,8 +2326,23 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
> >   #ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
> >   		/* PMD-mapped THP migration entry */
> >   		if (!pvmw.pte) {
> > -			subpage = folio_page(folio,
> > -				pmd_pfn(*pvmw.pmd) - folio_pfn(folio));
> > +			/*
> > +			 * Zone device private folios do not work well with
> > +			 * pmd_pfn() on some architectures due to pte
> > +			 * inversion.
> > +			 */
> > +			if (folio_is_device_private(folio)) {
> > +				swp_entry_t entry = pmd_to_swp_entry(*pvmw.pmd);
> > +				unsigned long pfn = swp_offset_pfn(entry);
> > +
> > +				subpage = folio_page(folio, pfn
> > +							- folio_pfn(folio));
> > +			} else {
> > +				subpage = folio_page(folio,
> > +							pmd_pfn(*pvmw.pmd)
> > +							- folio_pfn(folio));
> > +			}
> > +
> 
> 
> Please follow the same model we use for PTEs.
> 
> /*
>  * Handle PFN swap PMDs, such as device-exclusive ones, that
>  * actually map pages.
>  */
> if (likely(pmd_present(...))) {
> 
> }
> 
> 
> -- 
> Cheers,
> 
> David / dhildenb
> 
