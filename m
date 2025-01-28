Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D518BA2025D
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 01:09:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E217610E31E;
	Tue, 28 Jan 2025 00:09:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ja2C4mlC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060.outbound.protection.outlook.com [40.107.93.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E60810E21C;
 Tue, 28 Jan 2025 00:09:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cjRkTXeo5pnv+R2u/HrXO7v6BypLy9KKCGGbRfC4wSYkPbM1gvKGZaWYSdSlrSCafl2gbFc6ikUWbA8uNJUQivu+4mS6lMwDR7n/sqiAf+FBgTthTS86nT+RRL8NhGt+c2eOwc8X+p/ZZjkBy9asRU5Q25hsdFn7OjGyL7tVkznDMsvFLbCxIIZepGrivILVGCnjDZlJIzpQAn3hiyyjPW9LMA0K6MCLrgRZr9LRhX3/OZvYYGlhVo2QDvGp41t2H8xnHgkEu2PGlPVlhbUw4rfzUT0MGwBqkUtbpsdQkWFOKNN97PaA140fvgFCNzTroe/KKpFk1XKNIPsD0Wa8SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=maOOL1QAxSm7yyhdSn7WuPHHrWf7Vc6twKcDfL5uOLY=;
 b=J1Z5FTC2X6Nt2u15MQB3hscapq5F+jvO03StxhFZljDJVo2nM42sTD+0Bif/S1A4Ii0iil2sPUH5+cJ53pOrz2f+gs1MDggwmdNmWHzRfgSyeksMGiBMK/UMxrc74qJmdBCpKVbur1b/j7RiS564knnU8Aq94f41ZjMFrYnPpLQSJLE7cc+IDLnDzS9Sm3+uNUgcc0ccgU7Ge5tsHtgfAu3MH/l0LZcPZeXzosn4Ef5cYJvVDRpIe3geYYY092HBBGON49ukfBbaoc/vRDJ0T7/arG0dTwdX5hSzF8YBZONrIXGH4AtI9QqZstTajacclsxkpnv/kcVOOAefFD86/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=maOOL1QAxSm7yyhdSn7WuPHHrWf7Vc6twKcDfL5uOLY=;
 b=Ja2C4mlCgXSsuRsgvjt2VlgZs5wxqgIlGqz/3O+Xy3Ar6KGeZuBBe+isnBmqtlf7T2ftjGBdkTtTvFJOMgx8im3ShHMsPO+0g9WbkiQCs8WC9SX5Nlh/7ex8w1znm/aXGl/zZjtJjyYFxg5WF2g3PEaGimm7gTOcI+YKbUMGaan5aRRaQAMiZRmKZGPf6hrzY4W7OF3v+fq+60PhTXrT+tpvaqAqvwJhXL4/No3ZAAFWFPFIFUxWTThTDVgHtn7NIJyIIsHmFlSNi1hldrOvQOPSApQ9PmPQRx5jKfVOfVhhsAnUSVGLcXSqxdZVs5XPSzQOsHP8P/9f+djv5sHOQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 IA1PR12MB8221.namprd12.prod.outlook.com (2603:10b6:208:3f0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Tue, 28 Jan
 2025 00:09:40 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8377.009; Tue, 28 Jan 2025
 00:09:40 +0000
Date: Tue, 28 Jan 2025 11:09:24 +1100
From: Alistair Popple <apopple@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, 
 John Hubbard <jhubbard@nvidia.com>, nouveau@lists.freedesktop.org,
 Jason Gunthorpe <jgg@nvidia.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>
Subject: Re: [Question] Are "device exclusive non-swap entries" / "SVM
 atomics in Nouveau" still getting used in practice?
Message-ID: <fbwjse2zexcsxuro5w3a5vs2rq4eabpccfkbd3buc4qmkgoo7z@xpdtyukllzvo>
References: <346518a4-a090-4eaa-bc04-634388fd4ca3@redhat.com>
 <Z5JbYC2-slPU0l3n@phenom.ffwll.local>
 <8c6f3838-f194-4a42-845d-10011192a234@redhat.com>
 <Z5OxuGMGT-OvMy5P@phenom.ffwll.local>
 <f2f059a3-0c95-44cf-b79a-8c01e9334919@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2f059a3-0c95-44cf-b79a-8c01e9334919@redhat.com>
X-ClientProxiedBy: SY5P282CA0086.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:201::7) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|IA1PR12MB8221:EE_
X-MS-Office365-Filtering-Correlation-Id: fb5a6f37-495c-4500-ca55-08dd3f300ee7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|27256017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?l8LvocHzWzVucGkK3RVpFuAJKcyseEWGPsTIOp8plteqWI/klGIvybTUf6xZ?=
 =?us-ascii?Q?d888Sy6170NbEuqohRqIaZOrQnMEvobtc/0Tj58EK9a415QwYQiqhZP6PBb5?=
 =?us-ascii?Q?cJG04nwSMSvGEiu+DbOPACf6xQLwyo3T8RtEcZGtQiW/eZbSQrQpWtTIvkzj?=
 =?us-ascii?Q?R/ot0//PMwfh171Zaz/AlipX9IkkDglw0PzS+nvP6/gCYuKP/zAm+tzG2H5O?=
 =?us-ascii?Q?vkEbcZzLqZDyNsvvMoTnDv8Q1OftfMvVLkh4eUlCLldO8N3IxGBkYroARZ9z?=
 =?us-ascii?Q?UiCl7Lh7QLigzGnZwdTOG6l7vZffVUg/Oqo9YNhE6M16Rk/Fq8zzM53Aa/Gz?=
 =?us-ascii?Q?XxDSo2VtmNM6m9RF0I9uEifSrYOTXJhAD1JK9ISOSUMPFPdnrts7gOBtf8I3?=
 =?us-ascii?Q?D9Y9nzymAl4jv/14hC47NMI0lI6Hmx1d/2Z5c+rH1dsek0cQMfVnCHR/IU5M?=
 =?us-ascii?Q?1xKBCpKuMUo40cQ8TTTkhLQr6vcSCD2i7LjG21Om0dcgye2QsKDHr+oT61OI?=
 =?us-ascii?Q?mU4znGqq8ThwxRLlbC8lJO/unke2VC5sAL0ASXYs3mcZUny9yX9R5W4ZPycQ?=
 =?us-ascii?Q?9TaDSqJmn3ANcYzAyInCBwHCOm2J9GP57pzY5tFOQwIJWqqQtrtFgWN6r20r?=
 =?us-ascii?Q?fAkbI145ls3DZ4cPsAvG+H8fXdy3ChIXNOgcW+lxjoRVNrQAB/eu6smdFHs/?=
 =?us-ascii?Q?osYHq1GmdBSJ67e+qANiJs8e1eA36otMMNIDQXyD55I1wuTJAPPTwLGU3/VT?=
 =?us-ascii?Q?OXRbAVnnXitpUUINGdoFaJochN80Rtm0TFeNrOip+33liKvSCBGZ8/Ny4Ke+?=
 =?us-ascii?Q?gW8wLABgkYB0JcmzBcKoIOW9EXyJ8yeQ/M8r1H9J3Svu1/8bVO6XK0mFFxS8?=
 =?us-ascii?Q?QWf4oRfbX7RllkcQatYOQIOACPk6rmmWu3Ah16VA9GcL3R11Mxu6+udfnGBi?=
 =?us-ascii?Q?kH6y6V0MuMl4836iCiTCxQv0nyq2xUtxZChPLs9EVovxTOkltYqKkBxNMIIo?=
 =?us-ascii?Q?AKpPh0kWxmnkSADB9OzYWTfwXtxdvbC4z5BwKHE7RL6Dero9FzQvNRCIoNK9?=
 =?us-ascii?Q?jAfKwrN/Mgo6qF8Tv1OUxE2+UNefRE4zIHx+wVJ2GShLzODpghfUnOjJobxB?=
 =?us-ascii?Q?/QF6DUpbOFJzTyiDlPeblKp78NIJrWtWR/SpoXM1LHcZS+WYWkzVUllJVlOA?=
 =?us-ascii?Q?f2jxdOsVoQYJbheFAdMM/bMh/SYKoZzsFbVvW/FrrTo6nOjmLBhxtxgBij5B?=
 =?us-ascii?Q?juig+GLSypTi5eOHl5NnswtsviXPYQ9rZkiQXRoaK2gTfBjP1swDIqIXujJQ?=
 =?us-ascii?Q?O1+qKdKUA12/exs1daWJdbI1b4XzH3fGE9ErR8y8dYUMt3cpw6Oc9ZB6F538?=
 =?us-ascii?Q?U0ZN2LsKXybK3RZZyQnlGvEu+hLXUXgLniliJcF1RatcrmCCiq7mg+lnrVCN?=
 =?us-ascii?Q?6/52reZioSKpk5UPhD2aNUOpF0plUID1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uOKaeuDl/IvASdnsHNEyWMvoj4+ZMxSC6gPswbKQr4B7xgQ/8+zLtowedWVo?=
 =?us-ascii?Q?OPb8nJhmLIOMbgC8McTSlW8gynLK+SxSUHictmHmSDVLvN487wv0CZWDX3Qp?=
 =?us-ascii?Q?7+FrDpezytsPKKL/o2dayuYLjgqonESOi2Q01BCZqtcrI9I9/KBZiuCmtNVE?=
 =?us-ascii?Q?xpAU/0Vti3Lhij5fTvNAIwwUxW9QoaO4/qQcs9DjuDqSgbqUsSOkxUERMs9t?=
 =?us-ascii?Q?vS0kKw4DUJm3hnjKqQlmA9O4VZW0E6tsD4QWWRxkKJNKq9+dzptrAMQzZxTU?=
 =?us-ascii?Q?ZxsO/3+TB73doqtzu2yop/o1t++slBZSPifHIeorCIad4DNz+2NxzxaEG0ED?=
 =?us-ascii?Q?abv2hpG6w91EcbINV+1gpX3mdntNOYvsU4c+w++ZXyZfo1KI5IQ27frw+Yx6?=
 =?us-ascii?Q?v8SM601s44ciEIoa0AjKUsuZ8sfwvuaQ6+3LhBQifT3xia4aI5lfTOBbm+Dc?=
 =?us-ascii?Q?nAfETVwwrcAPN7lSTJ+TFfif1/Y5/sdepyhzlmMl8O1Go2fm7aia4gL7HBIz?=
 =?us-ascii?Q?d2j2LNtcmZbPJfnh7V4i8YtggiwYdyCJm2QmM0weE65B6MFFQSzCzWRG6skM?=
 =?us-ascii?Q?9lg57N6GOmzzvk2Se4wwr1owqRV+yiKvcMy1McJZwqR5siOvpfPx5xT11Eot?=
 =?us-ascii?Q?WacIIwmMTvWmX2Jolqdfo3qIWAGggTc/knDfhbr/1azq2sqUjRYAfd5Erf7y?=
 =?us-ascii?Q?97r8IMcPMkqeZxlIHSPlazWzoLIJXQ/uoN+NepABSgB2jKcG1dDlPQbpLW8h?=
 =?us-ascii?Q?2HHWPx+3OPALco3t85HA7Bg3xbLC/GvzGZedWq63ISd2GkRjtbLcGDcFdqvh?=
 =?us-ascii?Q?p14w7RtWE1gO+JTPczJ3yvXbtqESOP/lIwgMf2b3atsuCCoNzD9jP7avfalB?=
 =?us-ascii?Q?jwvzr3+xBmvgYRhdpRKrQb8CMGEd03JPjQ7d6TQIXGNvKkDC3sHpEs0lVABg?=
 =?us-ascii?Q?QGI36r7TX5972feDMP5/DCaV7xeM3T7dlq41cqKSkjgwTe8QIxQcLcEPik3H?=
 =?us-ascii?Q?uZAJT6emMX5nmxbKyxMRlU/HM2UiwOEKtnLVms+ddARQTYfTPJ+Yp1ZLK90J?=
 =?us-ascii?Q?RtyvTycJv63LoGIE1R+yd0dZ3Ila9zqxGxXt4KN4HqkWgCAF2X20PmSFeMIy?=
 =?us-ascii?Q?5VwUikmpi+CdhbLVkuP2PlRt9hkICwxBQirqj6ehK+mNChVfRh+P1WRGr9/s?=
 =?us-ascii?Q?MP+AmRTp1uHNBuS0yAIfnHvuErVKbimNViYc29PZAlDOLxZjm79RZ2IERJcY?=
 =?us-ascii?Q?XCTCn+2xsJgKWwqX5d70diQLBOH+wix/Hp9AhSQ2OarLDsLFgJhmqs0AyG0O?=
 =?us-ascii?Q?ZRZzeYbGGXS1o+0JdYtHrHdpjgNSb1m1TUfKMOql16MHMgv1dbABeHf+bBcL?=
 =?us-ascii?Q?+U+i+G0Gdfo9ellump0xbIGPzeAn4LLimNr49JpDaOxayk9PO6sxHA+96Bzf?=
 =?us-ascii?Q?xRRmSDII3NWbk79RM6wuyJcgQSugU1Nte3XUjOATDPmQ1/LnAwxSwxGdFKim?=
 =?us-ascii?Q?dLWDtkeRmC62+bY9Z3FRAgAEy90Cv+8Gq9cYuKpRrjaAJPwIsFN2QXvpWWiw?=
 =?us-ascii?Q?bkezw6SjCIm39ZjGftabLY6TyII01wWp/M3Lb32h?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb5a6f37-495c-4500-ca55-08dd3f300ee7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 00:09:40.1240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EiL2pjvH2zWdGrF8LUu7733e9gQzIy/a7gVOfRHCmpyrBe74WEI54JlY7anHBwTEtoXgGv8rcY87gDmrs0DiqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8221
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

On Fri, Jan 24, 2025 at 06:54:02PM +0100, David Hildenbrand wrote:
> > > > On integrated the gpu is tied into the coherency
> > > > fabric, so there it's not needed.
> > > > 
> > > > I think the more fundamental question with both this function here and
> > > > with forced migration to device memory is that there's no guarantee it
> > > > will work out.
> > > 
> > > Yes, in particular with device-exclusive, it doesn't really work with THP
> > > and is only limited to anonymous memory. I have patches to at least make it
> > > work reliably with THP.
> > 
> > I should have crawled through the implementation first before replying.
> > Since it only looks at folio_mapcount() make_device_exclusive() should at
> > least in theory work reliably on anon memory, and not be impacted by
> > elevated refcounts due to migration/ksm/thp/whatever.
> 
> Yes, there is -- in theory -- nothing blocking the conversion except the
> folio lock. That's different than page migration.

Indeed - this was the entire motivation for make_device_exclusive() - that we
needed a way to reliably exclude CPU access that couldn't be blocked in the same
way page migration can (otherwise we could have just migrated to a device page,
even if that may have added unwanted overhead).
> [...]
> 
> > 
> > > Then, we seem to give up too easily if we cannot lock the folio when wanting
> > > to convert to device-exclusive, which also looks rather odd. But well, maybe
> > > it just works good enough in the common case, or there is some other retry
> > > logic that makes it fly.
> > 
> > I've crawled through the path to migrate pages from device memory back to
> > system memory a few months ago, and found some livelock issues in there.
> > Wouldn't be surprised if m_d_e has some of the same, but I didn't dig
> > through it (least because intel can't use it because not-so-great hw
> > design).
> 
> Yes, that might be possible. Maybe something keeps spinning while the folio
> is locked instead of properly waiting for the lock.
> 
> ... or someone is trying to convert a tail page of a THP, in which case we
> will also keep failing the conversion right now.
>
> > > There are other concerns I have (what if the page is pinned and access
> > > outside of the user space page tables?). Maybe there was not need to handle
> > > these cases so far.
> > 
> > I think that's also ok, but might be good to document this clearly that
> > concurrent direct i/o or rdma registered buffer or whatever will mess with
> > this. The promise is only between the gpu and the cpu, not anything else,
> > in current apis. At least to my knowledge.

That is correct - we never came up with a good solution for direct i/o or
rdma so the promise is only between cpu and gpu. That said direct i/o probably
implies a shared filebacked mapping. We weren't convinced there was a useful use
case there because anything could potentially map a file and use non-atomic CPU
instructions to access shared the shared mapping anyway.

> Well, the issue is that e.g., iouring fixed buffers can be accessed from the
> CPU using the direct map from the CPU, not necessarily using DMA from a
> device.

Right. This was all targetted at private anonymous memory and it's assumed that
both cpu and gpu are using atomic operations. As soon as you're talking shared
non-anonymous mappings it seems impossible for userspace to guarantee nothing
is accessing that memory with non-atomic ops anyway, even with a coherent
interconnect.

> In any case, I'm planning on adding some code-level documentation for that
> and look into extending the high-level doc while at it.

Thanks! Please CC me in.
 
> > 
> > > So best I can do is make anonymous memory more reliable with
> > > device-exclusive and fixup some of the problematic parts that I see (e.g.,
> > > broken page reclaim, page migration, ...).
> > > 
> > > But before starting to cleanup+improve the existing handling of anonymous
> > > memory, I was wondering if this whole thing is getting used at all.
> > 
> > Yeah if this can be made reliable (under the limitation of only anon
> > memory and only excluding userspace access) then I expect we'll need this
> > for a very long time. I just had no idea whether even that is possible.
> > 
> > What isn't good is if it's only mostly reliable, like the current
> > pgmap->ops->migrate_to_ram() path in do_swap_page() still is.

Right. This is _supposed_ to be 100% reliable under those limitations although
I will admit I didn't consider THP deeply as that is not supported for
DEVICE_PRIVATE anyway.

> I'll cc you on patches once I figure out some details on how to fix some
> page table walkers that really don't expect these non-swap entries.
> 
> Fortunately, the hmm test device is in place to trigger some shaky
> scenarios.
> 
> -- 
> Cheers,
> 
> David / dhildenb
> 
