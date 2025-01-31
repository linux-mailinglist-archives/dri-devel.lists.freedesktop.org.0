Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6C5A23838
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 01:28:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C0B10E9FD;
	Fri, 31 Jan 2025 00:28:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mpwK3+5R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2067.outbound.protection.outlook.com [40.107.237.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C11E10E9F9;
 Fri, 31 Jan 2025 00:28:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EH76xnhp7OeEqOTYQWhVnw6sdsDgk6tMQWuhmYN5X0GKXrSdxYGhj3JUJydVy7lU2k/GozHD3lWU4Lztczj8J6CjExZe1u4sxWlOprXdIIb8AcExAws3CrKDhZPgDBftFapGhNHRdkeFMVXb51kdcuGhjHaPXs+MRlrlaH1sAEaMLyXSPAT6/qELStElOI3BSzn4iCRNTdHt3t89+yaw1yb+rUDb+w+IXjfAMUtJzyIf/NLO83vvkqsnkp2k5oIMy9Z28QJbncQSf5m7SiuUn+j6EFJiqXzPLAj4dZ0CptqRnEbxQro/ITK1B/388bynNjlVDvJdCVAXzv7SY6Udvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GaC/EXkkX/c64L9gZx1kvi/940w3ceiS3iyk6uoc2Qc=;
 b=xMYShVmFNDnqPQVqISKTQ+LBxvEOE5IUCaq0FGRalTR9tm58CCPqe3UKakDp2qzo7BdlDx3e96dM/4y4cdvet04wi8tL4/+dGTmSM4GJLj/h/4I6j7I2oJ7MOTO6oOTX9ESsS4hM37TdqV5T7z29vy3LW4pnUV1tr4InJ8koOpQNTg8IceSX8myGhEJrmRNYJdioQ75f/ocL8AhIpeEYiCUivUIB7I3e9wmMcAyySgO/5NCiAkCfVHXWf9GNWQFKGt7Vb8Gqzl92WVLhLPlLAanJLb563BjIq41lA0Gaco1amCkg+A/3CnlX5/ZoOo4ILMGBlp+hgt6YGq+TuXh1IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GaC/EXkkX/c64L9gZx1kvi/940w3ceiS3iyk6uoc2Qc=;
 b=mpwK3+5RB4W+C22A/75vcZCMy9eSdeHpe73YawqAYN6+8gk6+0p2gz0Y/TITtwebOmKd/nukdapGOvUKZTqDUj0pQRfn3LeeAZm2Niy5Ht81UirQCL8CwtJTT1wjYoUpmp09UxP4KiP1Ms6o8blYEo+uSa709nNjZn+2MiH3qL/jyZkBGdV7zzPeKFiLltdCdDXd0IOAOjxQQCitQL095chp7eY6zHbpxD2xoVRHLJKA9tjEOZ7e4VSoY/f3ALOUi8S6Q4/ysqbSvuUtT8OCs+cqzJGJhhx0hUsmSC4W/FEt+LnVfoMeSuRVLeEWseZsHA8vvJJLn1jVrzMxWE76hA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 MW4PR12MB7437.namprd12.prod.outlook.com (2603:10b6:303:21a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Fri, 31 Jan
 2025 00:28:19 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8398.017; Fri, 31 Jan 2025
 00:28:19 +0000
Date: Fri, 31 Jan 2025 11:28:16 +1100
From: Alistair Popple <apopple@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>, 
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>,
 Jann Horn <jannh@google.com>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v1 03/12] mm/rmap: convert make_device_exclusive_range()
 to make_device_exclusive()
Message-ID: <dibd7n5uhmpjvy2welm2lrxnrpxd3h2qkzgboca4xq634ib5dl@oojnkmmi7frl>
References: <20250129115411.2077152-1-david@redhat.com>
 <20250129115411.2077152-4-david@redhat.com>
 <b3stuhf2s6236zawaa6zt6x3fg6oamrtj3pwajlyoxlaxdmdtf@arqxcoemsjfg>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3stuhf2s6236zawaa6zt6x3fg6oamrtj3pwajlyoxlaxdmdtf@arqxcoemsjfg>
X-ClientProxiedBy: SYBPR01CA0005.ausprd01.prod.outlook.com (2603:10c6:10::17)
 To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|MW4PR12MB7437:EE_
X-MS-Office365-Filtering-Correlation-Id: 87225a1f-1442-45f6-a882-08dd418e298d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6Zh2sWQ27/04JP/kqZvqHS8sudmTz6IFELnc7sO8VakKQjiX4l5hw/TJCIRl?=
 =?us-ascii?Q?HGWUvsP0oDFzSh35/6hFmJdtupzu4caB496SvTtXnyJZBFloe8eLZE0tD4pO?=
 =?us-ascii?Q?RZn3C0bCeYrABhDjk2eborSDI1f55GBel6hfIOBaJrs9BiWdhGIhI7cKIgph?=
 =?us-ascii?Q?fAhk7ymMtN6VnJtnwS0hQbNQH0U4A17BvdO5dgLzOgMyaRMrRuYvgbC62bgf?=
 =?us-ascii?Q?7bx4wOqxkENXnayIgGh4Kh3HgfD9At+w4cEGY/IaojvQKu7fDJunydxluX4Y?=
 =?us-ascii?Q?qk+1pFloHeRHMJu6SEneqdq7GZuvNkg/HLw5MrWWcElwoejT3C4kdLzn1Ih+?=
 =?us-ascii?Q?zbvmIGYFmZHjk0z2bRWRwbcmNcA+QjfwaraXU4ADusgvz77CAz4lp8JOXMVy?=
 =?us-ascii?Q?8chhp4SsWhlnFJuU5jp66sGBd+b7KIzT9qFkOvfcT/w2OlvUF8U7IEtgNzu6?=
 =?us-ascii?Q?045DnzosFMNLBjoXDtFw4owRS6mM9qbhU/75gq6XKIDtt+goZ68HNzuWpaus?=
 =?us-ascii?Q?mbV60lvTKV9QkgJ6PuKQArGJTjAqgGLzaK2b8K7mdd3bl8I4Dq4ZwFnf90/g?=
 =?us-ascii?Q?T7qVTYztOmYaeDfKuc6M7A7SBrRtBmhYMMr43YAplNMJVotcbjEEj4iZ6bmD?=
 =?us-ascii?Q?ZdmXpGLF+AKW7bp7G8eWVJTIgvUTEgK9BFxgt92L7kR6bK4luH+0G74yQ/6U?=
 =?us-ascii?Q?P8DOYe2zLAVZ4Ut5JqlqzKN/UbEogci8H+Cd3YvuiyH2HCDVfm1vuzG3I1KM?=
 =?us-ascii?Q?szI+RQjjpsKV1F/ta3sAbAPyp+mRsiTS+jdC+OHMUdw4lpZbszRY+lFQBvu2?=
 =?us-ascii?Q?3q/CwdaTym59japmudFowpE7PfJ8wmZn5sAJVtVhbQI3hyg5aok93kyFQqWa?=
 =?us-ascii?Q?q6uteefKT4qJ3c42iOLQojSaq9ljAbbclQHNkF8uGqT8q4MCKfPJonG36gqu?=
 =?us-ascii?Q?z6RhA93PU8Mg2H6XVxJ2BkBXJicKI4n/BcwL//wxaiRE3KIuQkRktOD/TVBn?=
 =?us-ascii?Q?CBCIf/WiXh9ouVQpb/zqNAaGnQQR0ebB+Qv8xMdeVCOdU5AZ5uM5tBgm9tRT?=
 =?us-ascii?Q?ouhziHZmHpK8RCYYplPgGCk499Eq84ChKNOOv4bbA5C5Lm91H9bwIGwPnI0B?=
 =?us-ascii?Q?iSKzC7y035H/Gz2YzyKAC3vytUZK2vdKY6LHo4yKTWFrniH3hbdzlAQWPbBO?=
 =?us-ascii?Q?1gnaNIFR8+OqfmEunZBGSUZXArRTCRV4C54J+DCK8nWXVTPVaeUpJmuICjiC?=
 =?us-ascii?Q?rqCcKKwG4zJn0nB8N5L0cU7XXBZp2CrVIs2GHsCNjSSBOa7APs4IzNAWMSvb?=
 =?us-ascii?Q?7bk3JimvUnqRE1zbZ1kafH1XkXtvPuYlWQxof5em/ZDyyTiMtTR+hJ6t5pFI?=
 =?us-ascii?Q?RLMTwIZUpO5QOmQE3tMZNEjyVE3q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EbSG89z41oM9jyYrkh84zDg9KmCcnFdREY/OyCt+VQ+tX09N4aC7K8c3FD8p?=
 =?us-ascii?Q?QXCoyVAMP3/ehQEJ5BKd1ibb7e2JmSRK0E7jS6m8iHXd/ZhpwqJjjiVhrlSC?=
 =?us-ascii?Q?0A5oULXXOkdB/HLQb4a28kLcsyfQQESd77NwFrZXbHITmRCVj/Lt54XMIsdk?=
 =?us-ascii?Q?utJkVOFf5BMLnxqS8IcHZoQcERI9ks/AUYYCPHMKWABfgn0yOYel+AqoW2LL?=
 =?us-ascii?Q?4D/IEopS0tHouJnRiwem7GwgOY1BoG/yyNibdxrzj8SKEyAtNGMR/3oYmgZI?=
 =?us-ascii?Q?isLCRivlJvrwVMdd6vf624SE8K4G+GFZlZJlG6qfP6FsoQyzEIr1KM8VJV2B?=
 =?us-ascii?Q?lv166CtJn5PdV/NVsqN78N/rIkMcRm1jOdmzH9YIxWgSD1rhnRbKk+ycPWaX?=
 =?us-ascii?Q?WNUcvGeJgXqnr+ZN6xidCfYa98pWD+z3zWFXM4mz9U5ocyI6BmYinXCZp7yw?=
 =?us-ascii?Q?lLIi4GFH79LasxK1Q0ILkp65VhrW4wTLhBlXIfZ1KghuehGE0ect8pxjRLiA?=
 =?us-ascii?Q?hIfPsH5netqsdi9dPKVkemvRs4c1OmMySre/ctArsrP0f30F96OLYgEqg8YA?=
 =?us-ascii?Q?Y9EfL64tPMLYD36vJVfrzKwVNPT4obAtW42BPMYdV0qnDlDTCRI38hSlK4TX?=
 =?us-ascii?Q?d3uYFu3BafFf85qX8xhc9BTgGoM5IDKpZ1BOLaBQzHqbAUbLka1J8bZAWZaB?=
 =?us-ascii?Q?eFoXPXtIyqejFPVgApS5Ip7QL8infclSouXZHsMd1ledkVd1s03Dj8QwocBW?=
 =?us-ascii?Q?b9i61O+KfrGBD/9tjqcmlnk741JRDixf5vYoIy0NN0BBvc/mlpGYHFY4YjCw?=
 =?us-ascii?Q?cG+54ASZ5weGeJO9nEmjvNv+rLUMt/WP8rvcmASeI7MKdFapkyDKzDuRBIFY?=
 =?us-ascii?Q?6sPcs/6jRc2od75eHDvadAKO6uNNMt08UdL6lcVuMWmiSwe2i7h+QZQivpW8?=
 =?us-ascii?Q?L2oATiPk5dTP1Y8VlfJDtQtdpYzN2RBibdHwxFbmy7QOyMWTcTHf/ru0BuMk?=
 =?us-ascii?Q?r1bQtRp75gbRKLTrOl2FD8x5YxDEm/2WhTbDRm3iCdv0NtQANW1KkYM0fqLv?=
 =?us-ascii?Q?fg0Of9xUNyjNAkKhdcp9ecr5BCJoQaj0ZWqr+3XkcYAtnYze1hcx+E2elqZ2?=
 =?us-ascii?Q?tLGd781kht84Ii2ZXibX+O5CMrJS0OIIcOr6axMP7ckDos/Mur7iPPgI+RkF?=
 =?us-ascii?Q?YKI8c0nwqZAPGnBQhxPAN07ZvbUTbOFtEMuHk9sM3CMYl1zUKyCPKudG9hXm?=
 =?us-ascii?Q?YMtC69GrK9AzWyjsRy0SCxoWXAMCOxJudXW37odzw4ffuNKvJ4G6w+X/c+P6?=
 =?us-ascii?Q?umWYNfhih5A4/1rQGj85Qy/kCJUPwR0KH7cKJZlDUogxfGqfCkgcD3lePAni?=
 =?us-ascii?Q?/1jMbmFy1upnZuBEewsb8TlBvKvp0XogG/pxIJyETqfH8Wg8Y3h+zGe3HYqI?=
 =?us-ascii?Q?Znl9l8guoCP3zxYQIkXn1yTb7Hlao9lONbuXnvyt3+lQwNwvI4ZEhh3JKmqV?=
 =?us-ascii?Q?2HhXDob215QyiuJjsyUhGFF5aHNR7g1BHFIgW448ZZ6xrQs2aY7lFjS42JMo?=
 =?us-ascii?Q?zi7DyIVbBWuwAqlxMa/iQFOhb/nsVtMfJAiOBau2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87225a1f-1442-45f6-a882-08dd418e298d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 00:28:19.7811 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7OcFZ8edZwx/B8TrlrCZBoVdtI9atFDlugHgumdMepcsfoq9GCARGUXqnCJ/fcM9pligE1w8cxenhYi0rKC45g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7437
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

On Thu, Jan 30, 2025 at 04:57:39PM +1100, Alistair Popple wrote:
> On Wed, Jan 29, 2025 at 12:54:01PM +0100, David Hildenbrand wrote:

[...]

> > -int make_device_exclusive_range(struct mm_struct *mm, unsigned long start,
> > -				unsigned long end, struct page **pages,
> > -				void *owner)
> > +struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
> > +		void *owner, struct folio **foliop)
> >  {
> > -	long npages = (end - start) >> PAGE_SHIFT;
> > -	long i;
> > +	struct folio *folio;
> > +	struct page *page;
> > +	long npages;
> > +
> > +	mmap_assert_locked(mm);
> >  
> > -	npages = get_user_pages_remote(mm, start, npages,
> > +	/*
> > +	 * Fault in the page writable and try to lock it; note that if the
> > +	 * address would already be marked for exclusive use by the device,
> > +	 * the GUP call would undo that first by triggering a fault.
> > +	 */
> > +	npages = get_user_pages_remote(mm, addr, 1,
> >  				       FOLL_GET | FOLL_WRITE | FOLL_SPLIT_PMD,
> > -				       pages, NULL);
> > -	if (npages < 0)
> > -		return npages;
> > -
> > -	for (i = 0; i < npages; i++, start += PAGE_SIZE) {
> > -		struct folio *folio = page_folio(pages[i]);
> > -		if (PageTail(pages[i]) || !folio_trylock(folio)) {
> > -			folio_put(folio);
> > -			pages[i] = NULL;
> > -			continue;
> > -		}
> > +				       &page, NULL);
> > +	if (npages != 1)
> > +		return ERR_PTR(npages);
> > +	folio = page_folio(page);
> >  
> > -		if (!folio_make_device_exclusive(folio, mm, start, owner)) {
> > -			folio_unlock(folio);
> > -			folio_put(folio);
> > -			pages[i] = NULL;
> > -		}
> > +	if (!folio_test_anon(folio) || folio_test_hugetlb(folio)) {
> > +		folio_put(folio);
> > +		return ERR_PTR(-EOPNOTSUPP);
> > +	}
> > +
> > +	if (!folio_trylock(folio)) {

Actually I think we can make this folio_lock(folio) now. The only reason for
the trylock was to avoid deadlock between other threads looping over a range
of folios while holding folio locks which is something the migration code also
does.

 - Alistair

> > +		folio_put(folio);
> > +		return ERR_PTR(-EBUSY);
> >  	}
> >  
> > -	return npages;
> > +	if (!folio_make_device_exclusive(folio, mm, addr, owner)) {
> > +		folio_unlock(folio);
> > +		folio_put(folio);
> > +		return ERR_PTR(-EBUSY);
> > +	}
> > +	*foliop = folio;
> > +	return page;
> >  }
> > -EXPORT_SYMBOL_GPL(make_device_exclusive_range);
> > +EXPORT_SYMBOL_GPL(make_device_exclusive);
> >  #endif
> >  
> >  void __put_anon_vma(struct anon_vma *anon_vma)
> > -- 
> > 2.48.1
> > 
> 
