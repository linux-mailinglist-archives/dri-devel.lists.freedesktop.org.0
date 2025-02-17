Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5425AA37918
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 01:02:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A51DA10E1A0;
	Mon, 17 Feb 2025 00:01:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Zo8JhxXz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2073.outbound.protection.outlook.com [40.107.100.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41C8910E193;
 Mon, 17 Feb 2025 00:01:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JCFDQj2PoqHbuq7gYFQiW2xBopsbz5VuoBZYGL4K5bSam2DWXYub0Kbyjp6gOQWHzj7da1nHPAZVneCsxozah9SwoEOtGO+ezUZCY6Ph5c4ADwNJX4JyfgxxRRVSS2XPTDN+k9KI17xbqztHWFauRpsoKXY1O1cUpqmo5IsOG5eODQsH0BKtBZu5Xj3H/4sJ6or60TxcJaMA/ouo3p4nGFx7fLO5BEhTx0nxrcPoQ9fXjfeP2ArhLykxFGKTmkRUZ1RttnJdCTsGcpZE7ukxK71cXWZX4FwvyQARZBAaoA3A8DyEtMLHk0mEKIwdA3K4sIUdvz50kcjPfPDDUYqsxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDK0+wxFsGa0EJGThWLTJe9YyKta5PufmyN0g9Qklfw=;
 b=YLgyJYlQKNcA2SuVmumhqz6h2l0br4gtjxR7Fnt7VCjZTZePRS7PQOwKP4eSfXV3zlyOvIgKoZmuzUu/QwsttL1u/1NUyph1KgB2Y+SLO3i1T4R5xyhH1A1wM3Ruy/QLcrds+8gFeO52jl+1rbfOVmMBWyiMdTcm0D/kypy/WOpFlK8Jmla0qw4FxbIUN9ZVqHscWqBtOSgm/jmeAPUOaiRaHuPvu1ERFSjSqGFKQIlJfTrgwcaNolhQs79yZSIrbiHJPJlCMw3Dyw8O1kqzuXErAhXlJKG25tA+UW1rRjj9FXwGqYaA8+k4R1aPrhYfJN+WftfB0cqA8I/Nah48Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDK0+wxFsGa0EJGThWLTJe9YyKta5PufmyN0g9Qklfw=;
 b=Zo8JhxXzR5HqCrQG2oTZT0KuGU59iidfsHFzLDowr26PV6hUaoPUqjAI6iuNU4hsfbson8fWwKTq1tnIfUCgkz3dw8xMjP6ZFchNHsM6XPFb8M/py9cdVr1UwAQYjWICgJ53ZN9mOcFJj/edH55C5VzpzXpkF/iL+IIUSWGZ3wE+9vaKi42ecKFM8Dsz2wnocXQw8DLJaOWa+YfBYMcjdm+NrDIixPfJ/A+t2vdtps/qDUqSXUbQhkG3LaNUdLsTzGMGN0ofLfqRl91bQe52QxwIonDMp0uFigNH3MIX0PaUIfcW6W5n1063JGdD6I9uPtUP5gf1zJ9+VEYVq7UGXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 MW4PR12MB5604.namprd12.prod.outlook.com (2603:10b6:303:18d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Mon, 17 Feb
 2025 00:01:52 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 00:01:52 +0000
Date: Mon, 17 Feb 2025 11:01:47 +1100
From: Alistair Popple <apopple@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linux-mm@kvack.org, nouveau@lists.freedesktop.org, 
 linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 damon@lists.linux.dev, 
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, 
 Yanteng Si <si.yanteng@linux.dev>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Masami Hiramatsu <mhiramat@kernel.org>, 
 Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 SeongJae Park <sj@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>,
 Jann Horn <jannh@google.com>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v2 03/17] mm/rmap: convert make_device_exclusive_range()
 to make_device_exclusive()
Message-ID: <vclmxoorivzhamd4smaaeyamdeangj3aqlbl27muzxuljasdrg@t4jj77rmiozu>
References: <20250210193801.781278-1-david@redhat.com>
 <20250210193801.781278-4-david@redhat.com>
 <20250210210001.5dc68b38eb1bfa44d0fd78f6@linux-foundation.org>
 <48fd75b9-696e-402c-95bd-55f2f0e24dfc@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48fd75b9-696e-402c-95bd-55f2f0e24dfc@redhat.com>
X-ClientProxiedBy: SY0PR01CA0009.ausprd01.prod.outlook.com
 (2603:10c6:10:1bb::10) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|MW4PR12MB5604:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e876eab-77e5-47b4-6f89-08dd4ee64863
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Z61QbeB29V4CFrLt5RxkgBOFYdgujTqOdtLAmTxbDmxQUOqDvnx7wj8yPISQ?=
 =?us-ascii?Q?zcz/bE4XjP8fZSFKi/+6wFY9DXTviz/q/qRKhQicXRlhEXB8CZKK66/eclJX?=
 =?us-ascii?Q?LkwAyWNbwHIWLpf37I8gd9IvDBwbf7kir6ljIZhGWuz4PrG7xoehE+X2QTPu?=
 =?us-ascii?Q?2CfB8UDcBzTVh3TRzGfLSUzx8TuGNT8WMEtgt1j19+04wOQawuQOm+BAmxpn?=
 =?us-ascii?Q?Yr31loZ8Stwfz8T1gsExx8BvUrp5bRszsQQF1ANkb0+UFZzeF655aR5i97Q/?=
 =?us-ascii?Q?UsZauI4wUTze39WM6RkVX7sAYdfY2s1BbDXwOBPERCEe+qk70CqgzPutVpMp?=
 =?us-ascii?Q?QHaeSzrrAf6c+OYfnQ452BMSbv6wLH4MxamdETFFutYtOQNnMQ8oNfOU5QGh?=
 =?us-ascii?Q?POM2o3MeUe5NglGprrlZ+P3+adfV8jnFYTiaVqCHkIlO/aevlh2zSqFXJfcr?=
 =?us-ascii?Q?2P8ghYDTARAGrRaSTZShes5vv6twJ33QcKPLBjqlIwFllIkkT28FOBjug4H8?=
 =?us-ascii?Q?N46d1BimcsxwU/b/0/nT0kz6kCc/k9ImIHxN2/gc+1H2bI9/GCTa3UxaF03E?=
 =?us-ascii?Q?cYdVFgNgZ2KA7F2k6f8K4VfU44kLWsTIMaj3/oQznMi57atl4RRMoYOk5W+r?=
 =?us-ascii?Q?LkH4T+2IDQkas4Dw1QChaXdPFnWWJPE2vStPmejKmtAwgGuT7oRrukbes6je?=
 =?us-ascii?Q?Wux6Ep0gahyS3K7RWNl6jmlkLcKokbQ07GpRlPnpeeIHupz7vGHTTv2bDA1b?=
 =?us-ascii?Q?oQgtHQx7eD09aKhDupHxvMP8sDJP7VMkIknkT4Hhx77GU4UfsRrOvvjPQc0E?=
 =?us-ascii?Q?fdsFR/B2lUUOOaxya3ueLEfAObmq9Z+uuME8xWz0j3fXWVbqFKtwWtJgR2Cy?=
 =?us-ascii?Q?9RgN6qh3mYUaztlBbFZCZKUqd7FEEIZEunJG3lFtsMSaIEwCKSQ+V1B0NaZc?=
 =?us-ascii?Q?2j0dsmzomW+I12r3DJ3xDdYdSEtxf3MedZUyet3uY/xnAACkXTFZcSYh0/IK?=
 =?us-ascii?Q?M2dXuGiX31eQXP7tI5EvCWz9aSp7VyZlDvqPUyx5f1CZ8VvLSPVsuFJoN7oU?=
 =?us-ascii?Q?NL7lC4q1z7k5AJ4d8EQi+9EC8AQQPL9y9Vdj2ywYtmQZT2CuKWTjlOSetHFC?=
 =?us-ascii?Q?sWBfzHG6jhQ7X+G0BqTj7yT+U5YiMDGesfZaX+Uh0JMtn0VWBQO1Oy5XdfWs?=
 =?us-ascii?Q?PUHpFb8V+lifodHiUiHbM6Oej2bw7r/P8qsJNj84ABCuO+uXLOCRigyhgL2W?=
 =?us-ascii?Q?OYh4ubVkBLwAO6BCiZeMeuKaOM8XyCEB9iNPOekK3mJFquMD2WTsBECInsv+?=
 =?us-ascii?Q?llCVVYgBfxkxX1C+zCcKGREJpW6jnBEAf1wLG1zaZ95Ug28eOSOGD3kPmZTR?=
 =?us-ascii?Q?FPA/Fzm0tMqSa+ZdMhlDYayjYN1Y?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ezYWmCw6oJO78Vnd42KLeFwf8g+ju3tSFJOOsXmU5xuZXYxdf8DvMD2pA3vf?=
 =?us-ascii?Q?bP+fM8KypRK19jO2IkWnfRYaZzUIXKGyw6MpFCdCSxXxBW0ymfuZouQf27B4?=
 =?us-ascii?Q?2a1EXJHksSlvVlqHBPzq6uKRyRMaV9GAj9+an/PlC63gRfoTUqljquVD/DHL?=
 =?us-ascii?Q?GqX9U5szGUw9RA3htwxcb+UmngT1bmHPYUJTAb4JmPhIPxw1VONLNv/SnVmZ?=
 =?us-ascii?Q?2mbgs5Ll8o5RYriPALxHIRA0WLryyRK2uv/ruv09tSdVLUXx05HgYpeoTrv2?=
 =?us-ascii?Q?GIAoVyRRI5p5dGgm46lbOz8usD7tj8SuHVFyMtjldnTNkeILHNZfI7Xs9oK2?=
 =?us-ascii?Q?5V8OogBuni95M+XQc+jUGEHmcEoSTd6ndC31mYTgwdWfQSFV5rmIDhErua0q?=
 =?us-ascii?Q?wSTE2VAQSsX/LcpIQ6aw2T0Y+xLJxDw1cjzOR+pauFwNvYR8CKYbY2bZ/pUM?=
 =?us-ascii?Q?xdD6FDg/LVLvfXMm7xgTOyHANVOvIpSloKenD2Q8WbPh3S6Gow0xVa99k0Eo?=
 =?us-ascii?Q?gm4ryx6ESjIKzR4ZmVKiR17L8Tuqwo5qJz1n6RjWSUtS6JGZxvMHXIMuxeED?=
 =?us-ascii?Q?ha2ni6SPUMCq7WMTI+rkwgpIWmZdgOEXWgKB9L+T66NrLXg2yAm8nWKamRRP?=
 =?us-ascii?Q?4fSKUN9mGXB0h3gubFcYfVqjB6+vigtzwrhc8s98r5Mlsu/EqIrt//CJ/Ftl?=
 =?us-ascii?Q?iyRGx8AqPcqXCu9rvNdjtSbhomGwT7KbIv3Hym2HftsKdocuixLb+SOiGCQK?=
 =?us-ascii?Q?0WegO8cYy9Z+5aAag3aiBjvFo3vLJPr1heXfGAr6BtVEkn8DGh7JA3asszbI?=
 =?us-ascii?Q?JtoHZlv+TgI75mv3Bk28dZzdBqdNuzYaipbO/bNQZvqC5qTWLxtHh0edQ6Kk?=
 =?us-ascii?Q?SU63/XNYYrKsFEEdwJbEwNDE32/ob797lLLfpb9C/9wybmIcp7Czg2AQrH4+?=
 =?us-ascii?Q?1JQV/WcgVcK6QbKQWpAF7mwGtY3c3JsvJ1w6DDCL0Bfxcfi5UlYmgnELI/kx?=
 =?us-ascii?Q?88z6PtOWfAkKRv9BiMLWNBGzworAxwrfwaBSnsR5Wr8c+AjJMGffgz78yG8l?=
 =?us-ascii?Q?NTQwCfjJuBFXFNgiP/adm6HYgpe8rq9scZuExs9I1xShgD0mbuTf43d06nMF?=
 =?us-ascii?Q?fabwwDg1tbuIC99xzLH60tHI8D0Zp6pbQH1ZtRZN8a8lU83XH6cRC9Cjp4Ol?=
 =?us-ascii?Q?uolHwyO1pe+r1QTka4Ko8UcKYpnK4hbtMAcO1cmqwdNEyleQFDFq/sUh8vKz?=
 =?us-ascii?Q?zspOFPHlzIoN8S3rI7gjVRr1Fu++0BOsV55R3XiQLA+q+3VEFmdkBH4q/CMq?=
 =?us-ascii?Q?3ia/okC2Q+zaPr67ooX8Nih0xzO8j9IWk5H2fWviIuHzulsNSS4dCCJpI1u8?=
 =?us-ascii?Q?QukG+0NgSCsbNKt0KFGn1KaLq2o7aztOQGm6MrPDGSAZ4Lk8m8/KiX58oFZ/?=
 =?us-ascii?Q?aH/KSEWeSmmzttl08Omb/s3Izxa1kBZC3+7JKJRvnOCw4viYlRBMbPr8tKaQ?=
 =?us-ascii?Q?h27Gl0KcBxknMLH4TnsLrRZYJXmTyKsTivG9BKoKD6gPtQJinXK1O4zGyPKA?=
 =?us-ascii?Q?Gm/A0OVM+i4gErkHQpEyuIxsrgy9+GswvQg1cppq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e876eab-77e5-47b4-6f89-08dd4ee64863
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 00:01:52.3731 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ET7Vdfw3oHU4t19ek+CEXdMKA8blov1w6MzvNuXuCGyAKTzqaOcFP95y7cnYRBgjyt/Jaa09QoTb2ZVWW57keA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5604
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

On Tue, Feb 11, 2025 at 09:33:54AM +0100, David Hildenbrand wrote:
> On 11.02.25 06:00, Andrew Morton wrote:
> > On Mon, 10 Feb 2025 20:37:45 +0100 David Hildenbrand <david@redhat.com> wrote:
> > 
> > > The single "real" user in the tree of make_device_exclusive_range() always
> > > requests making only a single address exclusive. The current implementation
> > > is hard to fix for properly supporting anonymous THP / large folios and
> > > for avoiding messing with rmap walks in weird ways.
> > > 
> > > So let's always process a single address/page and return folio + page to
> > > minimize page -> folio lookups. This is a preparation for further
> > > changes.
> > > 
> > > Reject any non-anonymous or hugetlb folios early, directly after GUP.
> > > 
> > > While at it, extend the documentation of make_device_exclusive() to
> > > clarify some things.
> > 
> > x86_64 allmodconfig:
> > 
> > drivers/gpu/drm/nouveau/nouveau_svm.c: In function 'nouveau_atomic_range_fault':
> > drivers/gpu/drm/nouveau/nouveau_svm.c:612:68: error: 'folio' undeclared (first use in this function)
> >    612 |                 page = make_device_exclusive(mm, start, drm->dev, &folio);
> >        |                                                                    ^~~~~
> > drivers/gpu/drm/nouveau/nouveau_svm.c:612:68: note: each undeclared identifier is reported only once for each function it appears in
> 
> Ah! Because I was carrying on the same branch SVM fixes [1] that are
> getting surprisingly little attention so far.

I believe this has been picked up in drm-misc-fixes now:

https://lore.kernel.org/dri-devel/Z69eloo_7LM6NneO@cassiopeiae/

> 
> 
> The following sorts it out for now:
> 
> From 337c68bf24af59f36477be11ea6ef7c7ce9aa8ae Mon Sep 17 00:00:00 2001
> From: David Hildenbrand <david@redhat.com>
> Date: Tue, 11 Feb 2025 09:33:04 +0100
> Subject: [PATCH] merge
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_svm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
> index 39e3740980bb7..1fed638b9eba8 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_svm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
> @@ -590,6 +590,7 @@ static int nouveau_atomic_range_fault(struct nouveau_svmm *svmm,
>  	unsigned long timeout =
>  		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
>  	struct mm_struct *mm = svmm->notifier.mm;
> +	struct folio *folio;
>  	struct page *page;
>  	unsigned long start = args->p.addr;
>  	unsigned long notifier_seq;
> -- 
> 2.48.1
> 
> 
> I'll resend [1] once this stuff here landed.
> 
> Let me know if you want a full resend of this series, thanks.
> 
> 
> [1] https://lkml.kernel.org/r/20250124181524.3584236-1-david@redhat.com
> 
> -- 
> Cheers,
> 
> David / dhildenb
> 
