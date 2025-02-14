Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20ED4A353AA
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 02:25:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 167BA10EBD2;
	Fri, 14 Feb 2025 01:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PQrvGnpR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2086.outbound.protection.outlook.com [40.107.101.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A5B410E1B3;
 Fri, 14 Feb 2025 01:25:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I2ia0pDYsY0hbUKJMw7li91tKhbCT2gX1h+wY6uvYABRkHM09ilUOkkxEVlrgmFjHOFZu+iD9R9XRPYEfrCKx19KLLsPh6dsU+DCnvTohpVSGhEzdgi/FjNaV9xJ+lLY3Y3O8gRpxfLfhIThLSKQEy3STO7qtFG8M1IRefKngRSOksvn+ExodG23xODs39fbF7X+aer8A2P96FZOef13IyUyPxcsVLWtZtzQJgOCzs65TyHx/tDz0+dk6a7Ab027W13D1+Yj3IDI+XeLnIw2mpzF6Khzu2x+M8LpHQSNdnf4n/1P5lQf6EKZf8k6dyuoDOsgEkOxK53RUAKVJUSoEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xxHVxA39KPbLIOi3pDWIRlYDxTo3oagZCKfVsBfAh18=;
 b=eqOApl8IAdnKNygLSGrk0HhnfxMdzLiR+6+34ks9aC2c8M2PzQhjPZFX3IfExK46gPqRsUhXEgHz4bqk9MoSUC5fk0YJG/5R7bAwvGLuciphJ0WIdPqLBXU85B0nw8WP02tdk/Qc8HibpE5laHvxqD0L5SEqP0ZQX29MdNI7SHDXDstQLoAXdAT5c04+WdCfcpCyxqtSndAOwpXdt0xB1AvhrTyTkInvs063iedUWFfNBvZniPlk/q7MbQHVOTjuHxpeYNCHkuzmAapY4JQBpnj1UXrwFGv8bdEZCbzAcaOKnFq9xRFPHf82LefTc7Z1gyuxQQynD6fAI83EJP5pMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xxHVxA39KPbLIOi3pDWIRlYDxTo3oagZCKfVsBfAh18=;
 b=PQrvGnpRv+vzy0x+M6ifYz85+BL3vF0HM6PrjoIUtUM8ZPRealrkLlb+xyYWaU7hUmQU1qfwCwtEv1y64gbRO/6Q/iQo9NMWeSuqJNyA1G5qOdZ0ZJveGg+Psr7xSfLkdCeoGxRdg/qE1NbEWUPnWNZLfZft1MGHtSWmdtmq1aL3okI4JgUXhIu+uMjrRPqV4eCncUblPYpPJaujT+TVuMdWhnVULty3Jbx+YRLXn57IRQgRW+oUbdk7st9rGzjBnZ7c1e1DFPuehgKxN4/QoQ15924Fi7oasyVKnwpqsQNvryltPDpSwU3Lt5PgatNGM+41BZKrWn+jCPowL+MjHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 LV8PR12MB9359.namprd12.prod.outlook.com (2603:10b6:408:1fe::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Fri, 14 Feb
 2025 01:25:35 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8445.013; Fri, 14 Feb 2025
 01:25:35 +0000
Date: Fri, 14 Feb 2025 12:25:29 +1100
From: Alistair Popple <apopple@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, 
 linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 damon@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>, 
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Masami Hiramatsu <mhiramat@kernel.org>, 
 Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 SeongJae Park <sj@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>,
 Jann Horn <jannh@google.com>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v2 00/17] mm: fixes for device-exclusive entries (hmm)
Message-ID: <pqxzfmb2ydjgplkiswb5oxtbvpxyzmfroh2fbeqeuywklmrw6i@jbj73xssektr>
References: <20250210193801.781278-1-david@redhat.com>
 <6sejv2hauce3il5lq6sw53xmjjjglxkhz5copm62oryga6jioi@u66wl2nc3hoy>
 <039b2e48-1d7c-48dc-b832-24db12af216a@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <039b2e48-1d7c-48dc-b832-24db12af216a@redhat.com>
X-ClientProxiedBy: SY8PR01CA0016.ausprd01.prod.outlook.com
 (2603:10c6:10:29c::8) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|LV8PR12MB9359:EE_
X-MS-Office365-Filtering-Correlation-Id: 21ceda00-ff33-43b2-731e-08dd4c967ac5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Wuunw6r4tdDakfc9xX/SOWGRwIb8uwVdpZlqMFRW1pyl2nQKNgy+4BVTiqoU?=
 =?us-ascii?Q?ZlxaoWx90eDxTi7JiH5TVkYGTXdtgNiMlNt41+/9vcZTmHtkpLElwOEDrXI6?=
 =?us-ascii?Q?jYjZspTZwOgM2ugQUHnr/EBnl6zTS+hh9uVPTfPbW6r5DBGVdOUzCF99wP0Y?=
 =?us-ascii?Q?GkVo2ReTHzGTD/1mw7z04w3StDTVUMcO95q3iZifD1YIOT3GB4BnmTCS5BJD?=
 =?us-ascii?Q?VWL0toaqhv1eROrVgCvVPkgxma0+MXyY0uK99WsS8fVkvenSDG1qRsnUXG86?=
 =?us-ascii?Q?GIRESjxUch6Ylnw2fUHv8Suuynxi6T6hbCfGcYQtOZm4WbofqtX5LbB+ioC3?=
 =?us-ascii?Q?bcXtE+vqS89xRu9gc+mMUhkdX7B/rKERCmW9rjBbahmE7c1C16FSbKvx8rGl?=
 =?us-ascii?Q?fXmsPayjwY4C3h90MUOknSfVjU05TaxwLNuJWkHz+GZB8pcoO6Ap0/rzHxF2?=
 =?us-ascii?Q?YDiRwyM4nLpt3dHfMcLdy2PZgHsui1V0Fn5NwiTRvwkoSnOdx9WbaoOUauXU?=
 =?us-ascii?Q?X+WU6f+0o6kokEubR9hzDYkuQ/NepTk9LSKNFXXZtDI/ka9SPnvSEfTzrVTL?=
 =?us-ascii?Q?3/e2ofGuaYjjscFWGbyckXgP0hlQv60BVsqyd2Lrd4VpvBKW8yW6Vul4BbFZ?=
 =?us-ascii?Q?Li/cQ9QodMlWrfda3Yuuwuu8kwtCyoN5xr3MZN8+K4/cPF00FZtYFuCvrSj8?=
 =?us-ascii?Q?Ez1/ANGM7C+qURvfa31YCfIPqyZXOpds8v5b5Lorw8HTZHm2QiQaf6bAlmk7?=
 =?us-ascii?Q?Ud2ZEglUbV5W8AuMQsjvxC6nm/zq2vsMppzisEnY8XSiWy3NR/XJ/5DuKJfU?=
 =?us-ascii?Q?Vl9OVakPtTZytxwzS1b8bvqB/LBH3+HOW4xh2D2wlYhNhTnSjjQDFfFDo9aR?=
 =?us-ascii?Q?TCPBO216a7Cy0wJ0kXeFoaANOvZWhLM4avVKYe2XFrQFTt4vvIDQDHIUyHFO?=
 =?us-ascii?Q?gXHHiHSuFGF2S7wrsD5H9PGHZZiZD2z5+/eanQbWsLjM7kTOl6R2A4/KdnJu?=
 =?us-ascii?Q?S6PV2tx6YCJuwox5PLXi0+xo4VR3mDSqiXc5jWvOUTrT0/u2A6gRibpXiDmM?=
 =?us-ascii?Q?ryidMGC3d1F4Ri6tyCR0+XCnstezugNtN59t9WsQWZP0ZEi115f9AXGTL3sN?=
 =?us-ascii?Q?y/QWf/yuLXNeqjgylJkRlDejRAJaHrbrlpe2W0ZepKjAnR2oax5k6pzOepbf?=
 =?us-ascii?Q?RZYbhUmt21kI0R1cqxVyXyCHbF9wgu71qcZ+OUa4XyjVD1mU7ze63ZjK7w3t?=
 =?us-ascii?Q?Sqe6NM2tGs9HTJ+HLTWhxLpQScYL9ahBnUAp300eMA7jqNd4V452lkQj2ECR?=
 =?us-ascii?Q?KB3UfG4oKo0EIpCUMwBoPKo2O1gHxbs/tFYBgKFbP2P3bboQyJKnQ0+T/VGl?=
 =?us-ascii?Q?8w4FSmugAPNAQiu6otEoF9fCkas7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+hHE3ch9kBZLBY6CVJ6IQWHL7zWZHzjrOWyzQ9TWdtUtbiDqX1euuqz99mem?=
 =?us-ascii?Q?nV9oDgpw0fInVGiHokwn00u/yFsf9rSbjMZyL4Hz/RUYLdy/tZECCw+6mjIg?=
 =?us-ascii?Q?QxWC9kNlRxGIBZBDwYj0EyzDRRmi9cbzgAPXiVMDisKXVmLYJXOcV2wClGEY?=
 =?us-ascii?Q?ZqCt5J/BI9rFnktkln5lnaIZX1qRbJHpVSpeXovmoXpnGsD+Gwm0Bv8xqxVG?=
 =?us-ascii?Q?S/wcBmu/52g4ESLAw2lpI7igYZhrtoRU57Yh6Ha2XcyLiVS0T/H2P+0Glmr0?=
 =?us-ascii?Q?nhtk6SAJR3zKFARW4M+/aJ5twBbHlwL5yil4QTU1ESckyPGQ6McVQ0reUad2?=
 =?us-ascii?Q?8ixscDWd4NsHHRUhzFuVsuKea53YK0W79ikoIoVhRW9n+vNi0LeNAAvbvowq?=
 =?us-ascii?Q?AicSSr2hKvxt4PeHAqDD0EpGsTeg9Rf9dUg0y/qGjfu8gN90Ykmle46p2aCa?=
 =?us-ascii?Q?9n2xx8TJ0b3qkPXB/AXkVAgwvk8vzl7CL955delKxQQCW3AkKhDTQa22rpMA?=
 =?us-ascii?Q?SjGLd5LX8J6HzEqowCfqjjg3Fr80Za+i2mcCCzuNG1xxm9caO2rVmFd9vAvy?=
 =?us-ascii?Q?C68skAJ7Ub7rA3j0KaN9uT66E7+YLPwBGDpr526pGk73ArtcgLCMQusUA4R8?=
 =?us-ascii?Q?yqJUelMAlecPSW6KAqcEUl1prsicQAdr7u7Mf6dKmqpJcpkWAiZNoHwEDPFb?=
 =?us-ascii?Q?TokXS+yFr3WtPrjtEegMIOuIxRktA2J+I17w4Urv7sZr0ldD5rI7aSNGM7eG?=
 =?us-ascii?Q?KEyAKo2YNh4DelbLvYrBLLX5UqZtoiOwczifD1IjRPdqdpULx0d1pu5iScqn?=
 =?us-ascii?Q?jl1pY49yV/XZ7yFdSQXlEzqEdMZp7TPCZ5+qwZV9Fk4A/wpCF//4vBJO5PHR?=
 =?us-ascii?Q?cnAZfCm8WffhbE2mTaJoDNfA9uoppYa4WP2B7LiosfuUGk6rWMKOaxonfFnG?=
 =?us-ascii?Q?a15uyedjhuTaKnCOshU7mt0o44IioT9cFo/cN1FFSXoDVITK9XNglwnCuS++?=
 =?us-ascii?Q?JUjDobBN8AOGHDXmSEsLKjByhjCV7m4aXcmttc0QIu+DZiWuGPOe6YhlNhSM?=
 =?us-ascii?Q?K+JuxFxBA/TG6FhPoG/4YEGsAGiExIv4T/K2IfgG2fSkrI83fses/ln6KVeo?=
 =?us-ascii?Q?dvgbwGHgYoNTn+CweYiksNjhIKA/4hLwi7xmpcNZIWPsDzXv3TIdNVEtsuVO?=
 =?us-ascii?Q?nbayBnbUsu3BVJF6Re8bspY0JaJcMCfVBz2WD9ZqZe1mDkTdnILLfIQxkcSV?=
 =?us-ascii?Q?rhE98DrZ3V2Xo2bHR2ON1PEJeTeyghIhCFspv3PYt0PiO9Usj8zVSLhnMKNG?=
 =?us-ascii?Q?noKUcprNWH4p+YTVwTiWVnswIFoepjCoVj4iYLjVvqS/EkmGsIr6xtLNyk0C?=
 =?us-ascii?Q?tHTqyB3fINguxtQlqCVtdPZEsPJU4FBQRFv2tpNH8f00rpW2NCPKCXs2jhX/?=
 =?us-ascii?Q?g2TT4jqA99hNvZZt6krXA38NdegrnxkDjkZkaU9Yaw/4YcNN6MdAS/u9+lO2?=
 =?us-ascii?Q?0nGoYpbjwB5TEsj1b0hR4lDedZGzbzMXWNSz/1OLeJ+SCfcudWBhuqUTW6ho?=
 =?us-ascii?Q?fS86SeFXSQbBJ2QfIvdftuKRGhJoPfSoYoLedjui?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21ceda00-ff33-43b2-731e-08dd4c967ac5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 01:25:34.9167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wQmgmU+BAZQ5AbZphfcN/dj5YzfVYxRed7ObO6yQj8r/HN1pcb4usvfTGn7vnmhAMIA1OkjKR9PghVfQeq47JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9359
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

On Thu, Feb 13, 2025 at 12:15:58PM +0100, David Hildenbrand wrote:
> On 13.02.25 12:03, Alistair Popple wrote:
> > On Mon, Feb 10, 2025 at 08:37:42PM +0100, David Hildenbrand wrote:
> > > Against mm-hotfixes-stable for now.
> > > 
> > > Discussing the PageTail() call in make_device_exclusive_range() with
> > > Willy, I recently discovered [1] that device-exclusive handling does
> > > not properly work with THP, making the hmm-tests selftests fail if THPs
> > > are enabled on the system.
> > > 
> > > Looking into more details, I found that hugetlb is not properly fenced,
> > > and I realized that something that was bugging me for longer -- how
> > > device-exclusive entries interact with mapcounts -- completely breaks
> > > migration/swapout/split/hwpoison handling of these folios while they have
> > > device-exclusive PTEs.
> > > 
> > > The program below can be used to allocate 1 GiB worth of pages and
> > > making them device-exclusive on a kernel with CONFIG_TEST_HMM.
> > > 
> > > Once they are device-exclusive, these folios cannot get swapped out
> > > (proc$pid/smaps_rollup will always indicate 1 GiB RSS no matter how
> > > much one forces memory reclaim), and when having a memory block onlined
> > > to ZONE_MOVABLE, trying to offline it will loop forever and complain about
> > > failed migration of a page that should be movable.
> > > 
> > > # echo offline > /sys/devices/system/memory/memory136/state
> > > # echo online_movable > /sys/devices/system/memory/memory136/state
> > > # ./hmm-swap &
> > > ... wait until everything is device-exclusive
> > > # echo offline > /sys/devices/system/memory/memory136/state
> > > [  285.193431][T14882] page: refcount:2 mapcount:0 mapping:0000000000000000
> > >    index:0x7f20671f7 pfn:0x442b6a
> > > [  285.196618][T14882] memcg:ffff888179298000
> > > [  285.198085][T14882] anon flags: 0x5fff0000002091c(referenced|uptodate|
> > >    dirty|active|owner_2|swapbacked|node=1|zone=3|lastcpupid=0x7ff)
> > > [  285.201734][T14882] raw: ...
> > > [  285.204464][T14882] raw: ...
> > > [  285.207196][T14882] page dumped because: migration failure
> > > [  285.209072][T14882] page_owner tracks the page as allocated
> > > [  285.210915][T14882] page last allocated via order 0, migratetype
> > >    Movable, gfp_mask 0x140dca(GFP_HIGHUSER_MOVABLE|__GFP_COMP|__GFP_ZERO),
> > >    id 14926, tgid 14926 (hmm-swap), ts 254506295376, free_ts 227402023774
> > > [  285.216765][T14882]  post_alloc_hook+0x197/0x1b0
> > > [  285.218874][T14882]  get_page_from_freelist+0x76e/0x3280
> > > [  285.220864][T14882]  __alloc_frozen_pages_noprof+0x38e/0x2740
> > > [  285.223302][T14882]  alloc_pages_mpol+0x1fc/0x540
> > > [  285.225130][T14882]  folio_alloc_mpol_noprof+0x36/0x340
> > > [  285.227222][T14882]  vma_alloc_folio_noprof+0xee/0x1a0
> > > [  285.229074][T14882]  __handle_mm_fault+0x2b38/0x56a0
> > > [  285.230822][T14882]  handle_mm_fault+0x368/0x9f0
> > > ...
> > > 
> > > This series fixes all issues I found so far. There is no easy way to fix
> > > without a bigger rework/cleanup. I have a bunch of cleanups on top (some
> > > previous sent, some the result of the discussion in v1) that I will send
> > > out separately once this landed and I get to it.
> > > I wish we could just use some special present PROT_NONE PTEs instead of

Yeah, that was my initial instinct when I first investigated this. As you point
out a lack of spare PTE bits made it hard/impossible. Of course I'm about to
give you all one back, maybe I should keep it :) I'm only kidding though - I'm
sure there's more interesting things to spend it on.

> > 
> > First off David thanks for finding and fixing these issues. If you have further
> > clean-ups in mind that you need help with please let me know as I'd be happy
> > to help.
> 
> Sure! I have some cleanups TBD as result of the previous discussion, but
> nothing bigger so far.
> 
> (removing the folio lock could be considered bigger, if we want to go down
> that path)
> 
> > 
> > > these (non-present, non-none) fake-swap entries; but that just results in
> > > the same problem we keep having (lack of spare PTE bits), and staring at
> > > other similar fake-swap entries, that ship has sailed.
> > > 
> > > With this series, make_device_exclusive() doesn't actually belong into
> > > mm/rmap.c anymore, but I'll leave moving that for another day.
> > > 
> > > I only tested this series with the hmm-tests selftests due to lack of HW,
> > > so I'd appreciate some testing, especially if the interaction between
> > > two GPUs wanting a device-exclusive entry works as expected.
> > 
> > I'm still reviewing the series but so far testing on my single GPU system
> > appears to be working as expected. I will try and fire up a dual GPU system
> > tomorrow and test it there as well.
> 
> Great, thanks a bunch for testing!
> 
> Out of interest: does the nvidia driver make use of this interface as well,
> and are you testing with that or with the nouveau driver? I saw some reports
> that nvidia at least checks for it [1] when building the module:

Both. I have tested Nouveau with the Mesa OpenCL stack and a simple stress test
that just thrashes atomic accesses between CPU and GPU and a similar test for
the nvidia driver.

In practice the nvidia driver probably doesn't use this that often as it
more aggressively migrates data but it does use this as a fallback. Also it's
possible for users to force residency on the CPU in which case this is used,
which is what the test does.

Anyway I have just finished testing on a multi-GPU setup so please feel free to
add for the series:

Tested-by: Alistair Popple <apopple@nvidia.com>

> 
> 	CONFTEST: make_device_exclusive_range
> 
> [1] https://www.googlecloudcommunity.com/gc/AI-ML/Can-t-Install-Nvidia-Drivers-on-6-1-0-18-Kernel/m-p/722596
> 
> -- 
> Cheers,
> 
> David / dhildenb
> 
