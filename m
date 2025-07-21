Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 100A0B0B97C
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 02:11:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEC7B10E46B;
	Mon, 21 Jul 2025 00:11:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mi4uuqKM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2067.outbound.protection.outlook.com [40.107.244.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EAD910E46A;
 Mon, 21 Jul 2025 00:11:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e8JuE8Se7BsJmEinTr6ZfxqlU6oo/c0+/uI5POYfJbAMzSCzuCHmFRrW+PnSK54k+N7ztnR2zAjaYXVsSBV8W2dlWvOkq+rHH/9dFLs+LXLAFFElZoCtgUp7Z3Cx83jgqN2FGVjkh+RWGSO5FQ40+vO/qcbA7OHQWVC6xRnj8Kc0YWxNRVrgqIgITLs1PSQ9YyNBzgQz0Gi3uZ9FtRPoF0ss1I5eg6R0ht9in7MsnnZAL6SDJg8nJzYg0i9lmm1LVDicb//9LKGj04KVl3zXLuV4pRtdu1OUVMMAFAZdf7YKWa0Jh4KGuy3879dZ8fV8kF/sL95o82Mkz38/xTZItw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=plwQglDZFwQGXvph8gEHsQrTPjvEBq42Afbc7x39MBY=;
 b=vaKcJW+PE9XaHKf3+qMcvnHCsI11gSfbou0cHKbvER/kNMLP+Zx992JcUp5E8M7f/GbeFPejwa2gW5+N1PslcoY1SBgC3JApGp93rdGxrC6IIssZHSWjl/n8uCkfvq+w+BhzdIA/R/ToOJDiCeCt+WgNNLNw1cFgFfGkWmpSVcyRRlhRtrPB3vzw2WrMhTiAmxKl5E5bk4YkGgPjxvGbn+PbxLrTmle9GwTu7CgfA45zNWDJTtLov01pEJTPINxLe1nXT6bu3EhJkmP0woCKUK7UyjNPV2By7Q47vAr9aoycAGPq4IGEMSkpmt39ERvFLsmM+kr89KXM4Lm+PQqRtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=plwQglDZFwQGXvph8gEHsQrTPjvEBq42Afbc7x39MBY=;
 b=mi4uuqKMAPQ8p3nXP0ftETdKKLX6PQ6ADN7LF8aL0xFnniG93L1w/w9AQcMjr0z1s1H9tB11uSa6w6aeTbp54YSfUkcxKmN5r1KHKaNh+CkInCG+ODP8flzzvwc/RtyKkCCOgAOLILeUFcK+72ZvhBdCvIcj2H9uNOYaFTQv82WL+urpKlDVGepSezM78JvrPeN/ztH68OmnnXVl8r8NmDrJfWMhm+voOASfnIaVqxabuD8RUlkkvGioaaiAEdkjCdNV9CPyHew85E5wnRaGKn2nZJZIbZuVHws3LFY3xNI1mOLowQTbT7kvxXHdmjcxNzownKu9sL2rq7LJwvTMHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CH3PR12MB8403.namprd12.prod.outlook.com (2603:10b6:610:133::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 00:11:27 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%3]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 00:11:26 +0000
Date: Mon, 21 Jul 2025 10:11:20 +1000
From: Alistair Popple <apopple@nvidia.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Matthew Wilcox <willy@infradead.org>, Yonatan Maman <ymaman@nvidia.com>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Leon Romanovsky <leon@kernel.org>,
 Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Ben Skeggs <bskeggs@nvidia.com>, 
 Michael Guralnik <michaelgur@nvidia.com>, Or Har-Toov <ohartoov@nvidia.com>, 
 Daisuke Matsuda <dskmtsd@gmail.com>, Shay Drory <shayd@nvidia.com>,
 linux-mm@kvack.org, 
 linux-rdma@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Gal Shalom <GalShalom@nvidia.com>
Subject: Re: [PATCH v2 1/5] mm/hmm: HMM API to enable P2P DMA for device
 private pages
Message-ID: <zuhyma5kafacf7zwszgww3ghc5dscyvuwj7csvmiqogbppavtd@z4q6ux5w7fao>
References: <20250718115112.3881129-1-ymaman@nvidia.com>
 <20250718115112.3881129-2-ymaman@nvidia.com>
 <aHpXXKTaqp8FUhmq@casper.infradead.org>
 <20250718144442.GG2206214@ziepe.ca>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718144442.GG2206214@ziepe.ca>
X-ClientProxiedBy: ME2PR01CA0083.ausprd01.prod.outlook.com
 (2603:10c6:201:2d::23) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CH3PR12MB8403:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ff38381-0032-4700-4b45-08ddc7eb225d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/WM2Sjy5Iaugzv9Xhln1e7kBrTPRt548lzsq3+OwEOse4tuLvNb8MUW47duV?=
 =?us-ascii?Q?QNb/i9obcy/+jFEWp8lGB0BNsXdcafAPCuchUbXg7jHnQ12T7lgP/i6tAh5F?=
 =?us-ascii?Q?BsgA6JgI4YChjZe+pHCbCH+9KZLH6Si9uSMhBON8ppC/lTIia/VM9T2Fj3cd?=
 =?us-ascii?Q?73aNwCGnRQjKwnS5lK+GMBwhfqkdYLe0zW2eS6XGiRWtnQz15oD6OugnYpe0?=
 =?us-ascii?Q?hk3okqh8eS5FlOT1snPAOnguG8AXoXv6dB9MnafiRvjHgE3M/ZknFDnlqR1N?=
 =?us-ascii?Q?YAcjTqgrijhly52npS+Q8lL8GGFnricV8gZZDyJ6Tfz5dtOLWovPGctq3Rue?=
 =?us-ascii?Q?lp0GwQgNj2sGmBvu5tAk3uEIQBLwnwYjpVMuLM19l4udBDQPn7G6rj4tPieb?=
 =?us-ascii?Q?MA9KgBbgeEKH71KVMuHa9WKBHL0k1M7F4+AqjVnF+GVa6ybtLpzHbPm10e4q?=
 =?us-ascii?Q?9G7obV0wDkIbGTm5pByfIzEHpp6IWKCg4uuZaGeLR11+JA4Y3vzL6hl/84wJ?=
 =?us-ascii?Q?1ckASMNt3A+VRA4OTNpb1Q1kD1sd6VLLtPPbZZGuhYMfEauzciSKDwwuOg72?=
 =?us-ascii?Q?4WgElLLLdXYSBzH+bCk41CJJanT3AnBTqdyBZ+7O+DSWy0Nx4oaTd3RpYqB4?=
 =?us-ascii?Q?H3I5QsyrZyuPEmL/OaPzq4RlU44xawxdy0z0cQufqtXLnB3OAZPQFN506uZ+?=
 =?us-ascii?Q?jheN7HzN/GZ1pLdLLlRUDiaKUM2DDYi4+n73yUGVfZgYQNF/XZ1NYTb6vcto?=
 =?us-ascii?Q?zy/k5y2Csau10ngGeEWuQxFQZGEQqP/VmeSj9O8UXc5TK2NgSY03wGI3rwci?=
 =?us-ascii?Q?+GzlI1SJD0R+2oGmynQaiVXOJNVq/o5zHJjN6rF7MeMAcREEoKxUeKLYefZp?=
 =?us-ascii?Q?Jj9Q4mkiQ/comFdkh51CeEJEJoZZq9C7rQTDG04il3STTDuhhHuyHbpDP3qg?=
 =?us-ascii?Q?WBZaaUrEypor7OZReqq/aK3qgF0bgpQ3UJHfhhPDSsZ7TRUO0ROiU4L41byJ?=
 =?us-ascii?Q?6nhqIUNA8h71RL+kf/IKUe03ikoDBQHXRqJ1U/GKUavUOGVndVkeuYJseuZR?=
 =?us-ascii?Q?BFHWrA69lghn4gxAkC68nkSe3CEKmA2qcQ33PP1kDTbZfID6H9RUMrknn+Rc?=
 =?us-ascii?Q?fMzFBSivOTuupkbwjk+vWzTxqO8n6TdjM2mep8SwMfkEhEGXJHHvd71aV5qd?=
 =?us-ascii?Q?fzq7t56zczBlApMSZS7EPnolaYrrOoOQRNjmz2DZk7z6CeEMEnDjYfYKsyYJ?=
 =?us-ascii?Q?R7lNX2DRvTX/AADF4Hgole3RHbfNw+J6NUhnACG9rWIf9flwHjK1d6txvSxS?=
 =?us-ascii?Q?DACf2wimNjYlBBc+APnQ8pTSQgKngTxrke/SZDl4VL39JFafuHhJu7JL09GH?=
 =?us-ascii?Q?/uMpCFIsGGw/lK/+B+4lHgEPjql5PXxuFoCQHM6C+UP1eVXROnHOwY6E/IfA?=
 =?us-ascii?Q?5ob8vbcT+r8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hHJXgkEltv5OVxBUeLa1+4qmX2LXOerWfsvrtML1Gj/CIyE8KvDwB3h7SB17?=
 =?us-ascii?Q?bh5X5iB6nbcM+EhB6c1fB8YRo3VanwIGFUM060p1e7BqJBlzHxwmv9y/8bLv?=
 =?us-ascii?Q?xPetYHn9VgdQsTAaleK6KIaHrA2sx+tDXorkoNYFOUSidocMHTquxG+PFnKf?=
 =?us-ascii?Q?WUKC9wL727v4LtxE54sCPrZ/sjR97JjyVo0pAEWgSRGrvvqFi1ULQwUqJo6x?=
 =?us-ascii?Q?ooNtxekojdAnkvtnyGZ0bE2XWxRmpqDjL4RIf8+pksgpxhvv0DCunl2JTxsL?=
 =?us-ascii?Q?sSaIIxCNJT38BbQzsVZRYN7AKdByIA5fpUSNInEronXNO/epmYdA8rJlqKkS?=
 =?us-ascii?Q?1tihDk1QOY2+orDOwFPtYB4cl+NEMefc+dsTGm6pn6/NZ/80DQmZKB3hmb0u?=
 =?us-ascii?Q?0Sf+Vl2nctrEoV6Gv0PGKuUIQpNVYVlOdQa+XweOqUorZr83kZz0rlpeqO/G?=
 =?us-ascii?Q?XQT4YwiWwLaeyw6T8Fan97mCQlYVZl+OzaIpfDgN4pRlEJufyQQZrqbQT5GU?=
 =?us-ascii?Q?oayQbRopuNRKHd0BoCnlrgbGNPzOvw8p7M0sXw5xAWxHTkPnBGjVn983LdWA?=
 =?us-ascii?Q?6sxFYKvxvMiG52V+h2mFstDZvaZm39BgxbTdqDSD8KJJEnkBE+rAItb7tCMx?=
 =?us-ascii?Q?Fnc3zskdejwnR6AVKxJ2OpnmyQyLKhTyvi3BQkmEDt+Sfybike/XLonxCqeJ?=
 =?us-ascii?Q?H6kPaL19RK+a2pbWF/qkRTVA/w/VrzriNJf8bnLwULbTeRfxOpChDFcInGNg?=
 =?us-ascii?Q?qAlAQ6l+GP1vZLZD90efp+kquFl/D72KNy6rP5vQSOncEzz5iK2Xpko6YCMQ?=
 =?us-ascii?Q?DgaF9pUdheIYWXdX1T8F7OsOBdNmxD+gy6zfL1teuJ3Gcc5iYQs2fqPRlQJG?=
 =?us-ascii?Q?Ma8XWOzOdo+o810KKTkC844Qh0tROEvydBEDKf5ywdfzJ0N1IE3I7A9y/VkL?=
 =?us-ascii?Q?uMo2+cC0Ktg3prVyTt8wokXL5fvyvgaT2pR5feMjwjdSUSFTchN9oteYiOH2?=
 =?us-ascii?Q?znw4CWgxKEWteBQL2aCmlbU/KjsCRQWESZYTdgpQAmucbJus9UD0VGRFoJH+?=
 =?us-ascii?Q?gpHiK5r8UOoAW/lkLunLOl23n5HH5Go3VWbKW9XCqOf9yHmCL4NKrPR61OGr?=
 =?us-ascii?Q?2b2o0JEl9TDZ4xckrKFUEvkLWPaYXfLztKTDngQ17/HJjw83Lr5sqOXVp+UC?=
 =?us-ascii?Q?JlNn7qnsFME2NVU99grhVVwejFqLqdAHVregf0phMILUCLk7CILZtGOkKXFq?=
 =?us-ascii?Q?dtr4pJ/hiv+a7BHwNh/uheG84pKErK29nwH+ASAi19eHiZo2EAf/BmlJyd+X?=
 =?us-ascii?Q?XPn1tYqz/OkRckHV6EhzAIPRvVcSY2ipDNHJwQ8T/C/2LRBYPHKrcZDyBvjL?=
 =?us-ascii?Q?tNM3AzpIhBSV5P9z95TJZbzX1f+r+yoyVYsUMPZJqzhRivCNOQ5z8XEzcHJD?=
 =?us-ascii?Q?5BbzV/4TMgeLhcquOfM0pzWzjICLbxk5lcEE4EsnBo1mUJyeI0du5SA7aizi?=
 =?us-ascii?Q?JSsuRzF9pQ5JFcjUwvAWLoubi5J0N+C8gdlH3S40+dmOTNlidFFc3ZF7aRRE?=
 =?us-ascii?Q?8Ik5AiPJw7Z1x0XsmTgB+bb4D+uK5vXC4qlNEFvN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ff38381-0032-4700-4b45-08ddc7eb225d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 00:11:26.7278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2YY3Jl7ntp64GZnRAGC/HcHjs13igjK7lfAyft9wrB0W01+QCA6nJ6sDn1rfIfKBiIMlG7Qa/fmg36ajeJpC/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8403
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

On Fri, Jul 18, 2025 at 11:44:42AM -0300, Jason Gunthorpe wrote:
> On Fri, Jul 18, 2025 at 03:17:00PM +0100, Matthew Wilcox wrote:
> > On Fri, Jul 18, 2025 at 02:51:08PM +0300, Yonatan Maman wrote:
> > > +++ b/include/linux/memremap.h
> > > @@ -89,6 +89,14 @@ struct dev_pagemap_ops {
> > >  	 */
> > >  	vm_fault_t (*migrate_to_ram)(struct vm_fault *vmf);
> > >  
> > > +	/*
> > > +	 * Used for private (un-addressable) device memory only. Return a
> > > +	 * corresponding PFN for a page that can be mapped to device
> > > +	 * (e.g using dma_map_page)
> > > +	 */
> > > +	int (*get_dma_pfn_for_device)(struct page *private_page,
> > > +				      unsigned long *dma_pfn);
> > 
> > This makes no sense.  If a page is addressable then it has a PFN.
> > If a page is not addressable then it doesn't have a PFN.
> 
> The DEVICE_PRIVATE pages have a PFN, but it is not usable for
> anything.
> 
> This is effectively converting from a DEVICE_PRIVATE page to an actual
> DMA'able address of some kind. The DEVICE_PRIVATE is just a non-usable
> proxy, like a swap entry, for where the real data is sitting.

Yes, it's on my backlog to start looking at using something other than a real
PFN for this proxy. Because having it as an actual PFN has caused us all sorts
of random issues as it still needs to reserve a real physical address range
which may or may not be available on a given machine.

> 
> Jason
> 
