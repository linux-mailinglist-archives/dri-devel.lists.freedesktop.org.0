Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C096896F9F
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 14:57:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA5B112ADE;
	Wed,  3 Apr 2024 12:57:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Q8gC4MT1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2100.outbound.protection.outlook.com [40.107.236.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C80112ADE;
 Wed,  3 Apr 2024 12:57:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gz0HAL6JosbC4B+PjZgR8UO26mgkVd/QwvBMor182PXGxmsPWUEYfX4K73PwJm9IcXF38Et+Db8IsfrHboACSeR2Iwtxh+NB7OAMnR+C9SViSKjkm5hcUeY1jg3TzUl9un7x3fqnxEycUE8B3h65x2IcCkQYB53Aeun/rj23oe9KZCWwTWD+IDNt8lknVgIB2cpIadmjDB+yWsJqDt5qK6ziIHZoTmochc1/WFpKvcwnn6CWKi7FVrK8Lj8AvUO0m0V1fbsQeijj1A2phFGphsmVSi1/RKeaq8oOCAzwnC+aSah3n2jtcSXIbmBzH+4ssU/oIDtYBC1ahkPKm6gnBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1nN6SZWocct37Xk4v6czZy/tDwdRXY2vIde9HD6pfOA=;
 b=aDAAVDHIFeJRh5yty0mEWO3W1ocqKTnj3PqVAQGAGBitHJg42H2Hvo+Z+idI55f2XK4u1HhLf20qDgdctkPYLIU/zMLZn9LfVHZolsbsx0e0P6yDurT1nhJk6fv+abtMaIudRYSl16Lt8Y363wDzc3U+FEXG6LtSNLuqkNH/37mQxuD4ScgZ76XQ99JZykxd5D9NRzX2rvYoPYp96Z72ChW8GUUb3wjhGjk5ITYaVQs554Wku9ADlmmzHmKVX8qfytxS+pH4s5Bl9jytHhi/BRyTMR5kc8qSuBHCP2C28VVFbIU38JlsrMwA+z76BuZikDei3r6KdWgda5F9Fqvesw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1nN6SZWocct37Xk4v6czZy/tDwdRXY2vIde9HD6pfOA=;
 b=Q8gC4MT1+JXE9aHESWIl8QWdzDbS1yAmNiXrBmNjNndCSK59c4MotR4ZZojotkEZ4vxeXm+9BuURMuJbVIdRJAeSVk9QPKmmkQWBhRw3yWuNcREETbZuhGZnlYtChknOhwn3ZNnqG9DkmhHNQhIs/+mKsoetY3bpW/A89ayHgxyBP2DUEeeUIp+i/qbHwbfTOg8UdLArlc5wDBNUFtLON7tlJFmzJJekf6o3B6THBkjP47EMZwClq1M3h04taa0HZQvQl384aktCMUB6n9mj5nVG5dXYDSvLILGdxOvr/UmlGaoHFP1b1y7Gcqc1W+Gr+p8uCpucoILUvpHMbD5WGA==
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by CY8PR12MB9035.namprd12.prod.outlook.com (2603:10b6:930:77::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 3 Apr
 2024 12:57:14 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222%5]) with mapi id 15.20.7409.042; Wed, 3 Apr 2024
 12:57:14 +0000
Date: Wed, 3 Apr 2024 09:57:12 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Dave Airlie <airlied@gmail.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>, oak.zeng@intel.com,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: Cross-device and cross-driver HMM support
Message-ID: <20240403125712.GA1744080@nvidia.com>
References: <bc4c7b5f19e6479a002ef69949918a45ca89ce69.camel@linux.intel.com>
 <CAPM=9tyMF2POfE4Sm3717ibH3NSaY-AX3bMz6ZRAeaRaQWEURQ@mail.gmail.com>
 <5495090e-dee1-4c8e-91bc-240632fd3e35@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5495090e-dee1-4c8e-91bc-240632fd3e35@amd.com>
X-ClientProxiedBy: SN7PR04CA0199.namprd04.prod.outlook.com
 (2603:10b6:806:126::24) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|CY8PR12MB9035:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jsNiLLpZQA+wGRDex6mzI14ysTaztrKUiJhSiT45VrbtVOc2zs7KMt9/jWxBTzsjxXTkVvPN/aFxyIExnM2z7hgNYfTVualdcIeFoeYFKHBM3L53qIG2jkk5+TK97TLxDza1yxHgayil5DfWJsoIJCdpQhewot7zGkrT8qk0vmaEOKQeia5nSNvruzGF5DBYZnrD8jzaCTWvBW8FwLru9Nmw/Wyq8377fJq/63BLCjbhYR0iQYQiGcH03Iz4z3c8ivfD1qi8j5jNp4xX28nYr6EBcxHwyW2Tnm50ojbaglYIcHV0wljUqhecqCeDu/t4/ggwrBlB9tx9WzYP3dsi3NOGf1cqvo1ZYkfmg+59MxPbUZ2aEWrs9hWOxmgIHqA7pjtNOlePa9awqHlssEr5gcO1XMAUwPzuBvEmBe4agPDoWDhy7eBCwHvm8M+6kNvjjK3HWjEYyj4Wei6N0a1OchgeUd5cCBZ+TZp+CRKfJaU+Y642o3k9e5yebaCXv1819cYeK2E61fG06aXa0Bqc7zdgyPX3xjuTkcdY65CEVqAnaIEnWkC/XgsJHEog//vTj5pi1PSU3GaO8DAN51ebbbArFaU26YxxKBHnyeqqb3gwPXbWGo787cmfq2RpqNm8+SH1MYIPsTeNDzJNqIJjal4b316Ixt+LIUwDaO1ZmB4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3849.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUNGdTVwdW9udW9mVkhHVDdIZDNTTUhIWkphNkFCMWkxWDJZSHFUR0xmQU8v?=
 =?utf-8?B?WDAxbnY5OFlxYnc2dXd0L0JZZmRTRXQrbVNsVlFyaktJN29QaWUzeDRMbCtq?=
 =?utf-8?B?VzB0ajdOVE9DVUxMeGFhRktsYWNiUVE0TG8xd3VrQitwQzVxek81NGhkN0gx?=
 =?utf-8?B?T0krQ21NSEI5Sjd3TiswRkwzczhxM0hBQ3pRVWdrZFZXVUJtQ1ZkMzZwRnV3?=
 =?utf-8?B?NC9XRFRHRUR6Wnc0QkQxcDNvWHlLNGgxcytvZHBjNUtlVnkwSzB1cUg4SlhK?=
 =?utf-8?B?cFB0NGRPTCtnR29JTjVZUHFYeGwvSGh6TzlRQXUvTkxCQWt2M05CYlRvKzdB?=
 =?utf-8?B?eitKc0VlK1FCRnVTRGhyT052T2pJeDJLSk5CNFV5eEI1MFdBbU00WHdhQTVQ?=
 =?utf-8?B?Zk9QVjNtZ051L0txMWxvdGt6MWhaQjVRQzFlS3dxV3JpMWhvVjhIZ2tubTRH?=
 =?utf-8?B?ZUY2bHNvNEx3eFZQNVc0c3ZkMzNuLzFrZ1VhZ1VNL3pZTjVCUmtvdTBxQnhY?=
 =?utf-8?B?MVVJUjBRaEFUVHQ3Q3BYYXdjdm9KdkdwcWpqY2RuVlk4N1ppTytMUmRoUDY2?=
 =?utf-8?B?VmpkQjV0dmNQQndiSlhxQUlsRUw0SmFWbjNtdGlqN1hDeUF4QVdJZ3VNNHEy?=
 =?utf-8?B?U1V3WUZPYU1VbWplS1d4U1lyYlR5TnFSYzVCcER6czFhQlRlLzBML093MjMr?=
 =?utf-8?B?U05KUXoxRXNjKzUxeW9JQ3l2Tnl1MUFRWHJPeVMzemhFUy9OSHVqZXdpY2ho?=
 =?utf-8?B?aHZPNDkzbTlHd2E5RThLU2grMTlKeGlsbmthQTJlMXNNSmkxRlhlclM2a0w3?=
 =?utf-8?B?LzVtYkhhdWFUeFB5NzBGTXR2WFY5R052MjVhWStiZStXQlJHNy95WDBZZ1ky?=
 =?utf-8?B?azhJcm1ZQ0hQSW9Rd05yaExJUmhEUmkwaUhNS3RyR2pOSmNBeUVmRW1yTVlF?=
 =?utf-8?B?amZRa1R0ZDdwN3N4eU5Wb1oxcUFxM25tbFFpTnVwQ1hKWlRSWmlEdGlpL2px?=
 =?utf-8?B?TkJsWktkeFdReHY3YTVTMlVJT1FnaUllUWFGeEFkU0pXREsyTnVSTm5WNzJM?=
 =?utf-8?B?RklKb2tEUktLYldMWVdhbXkxNHJnTVQ1dGhHVjBxUnFUdHR3K1ZMM3g0RXpL?=
 =?utf-8?B?NVJ5QkpTSGM1c3pDRUVoYmlHR2FLNE5FRlZKMnNDakh6OGZWcDdaSytoR2h0?=
 =?utf-8?B?UmxQZm9SQXJ6T09iU3B3YStyek5NaGpKamdRK3pxcHdSL0Y1S2lURk83YndE?=
 =?utf-8?B?MXBzdGZWRGNoZVNWMGVlT29sczNzdzYrZUZZVWZDYnVPRVFCSHNGR0VEd3N1?=
 =?utf-8?B?MmxsV2JVRFVRaEtKanc1akF5ZWg5QklUTEE1bEVLVmlrVElEWGl6c1VncGd2?=
 =?utf-8?B?RzhGTk5iTVV5VEVOdVBRTFdCQ0IrdEdLN3h3VFdvYXc0RVhNM2FmR1h0THZy?=
 =?utf-8?B?ZnFiOUFxdjBQOXBGaDlwejdZUEpla3F5d00vRXdUaDRmbnY0dXI4VlgrRmpU?=
 =?utf-8?B?UG5wakRHbnNNMUpDcDlvM1pxZFVTS2s0T2ZCNzVkUEVIZW16eE5YWWtST2ZN?=
 =?utf-8?B?NlA3OWNjTWl3b3BWUVN2T2MvMXdLcFJycFFBTmhxSTVBbFZnVHhrR0g4d0Zo?=
 =?utf-8?B?TlljZHFkZ1IwUnFsRlpNcFg2WFFjbXpNb09HbUJqY0NyU3NyT1cwenB5ck1u?=
 =?utf-8?B?b0pPMEdVcjYwTXdDM01tUHZ5NzBUQUkxc1pxZHMrV25YclJtWjRiVWtaVW1y?=
 =?utf-8?B?eFF3bTl2Y0JWb29TeFBXaUxTVkR0Z2cwTFVCN0JEaENCVGZnRWw0ekZqck1s?=
 =?utf-8?B?REZ6Z2IydjcxcTBzSU9yd0RSbUpHQTR2OUs0UWY2ZjFRMmtFc3JFUDl2NUFu?=
 =?utf-8?B?aDNPbm5ZZ3AreVhtS29aTWFPV21NSFhpMGpCNHZuZFV0Wiswa0EvNEtvTXhx?=
 =?utf-8?B?eUwzMXBZWXBtdVdFZERTN1ZZZUMxTHJ2WmtydlpMOXoyc2dhUjZJbERwT01s?=
 =?utf-8?B?WDhWdmFqak0wZUlGRUhDWGl5SVd3VzNVTE5GOUtiMmN4aUNJNUx2aEkyS29T?=
 =?utf-8?B?VUFzaForSERJZkVZREEvOFdyN2w0Q1ZHenZkUjBvTVZNMEtGdG1xSEUxdm03?=
 =?utf-8?Q?hM3J3VHmgMBrqxXoi75ML1wv/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50230e72-1166-4e3b-bb98-08dc53dd955b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 12:57:14.3557 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4pnMq7lP0+pVkXOlWXxJF0aj++E+1bI0qtZYpT/S0LdYT2tTbUkjIARYNgaeihHW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB9035
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

On Wed, Apr 03, 2024 at 11:16:36AM +0200, Christian König wrote:
> Am 03.04.24 um 00:57 schrieb Dave Airlie:
> > On Wed, 27 Mar 2024 at 19:52, Thomas Hellström
> > <thomas.hellstrom@linux.intel.com> wrote:
> > > Hi!
> > > 
> > > With our SVM mirror work we'll soon start looking at HMM cross-device
> > > support. The identified needs are
> > > 
> > > 1) Instead of migrating foreign device memory to system when the
> > > current device is faulting, leave it in place...
> > > 1a) for access using internal interconnect,
> > > 1b) for access using PCIE p2p (probably mostly as a reference)
> 
> I still agree with Sima that we won't see P2P based on HMM between devices
> anytime soon if ever.

We've got a team working on the subset of this problem where we can
have a GPU driver install DEVICE_PRIVATE pages and the RDMA driver use
hmm_range_fault() to take the DEVICE_PRIVATE and return an equivilent
P2P page for DMA.

We already have a working prototype that is not too bad code wise.

> E.g. there is no common representation of DMA addresses with address spaces.
> In other words you need to know the device which does DMA for an address to
> make sense.

? Every device device calls hmm_range_fault() on it's own, to populate
its own private mirror page table, and gets a P2P page. The device can
DMA map that P2P for its own use to get a topologically appropriate
DMA address for its own private page table. The struct page for P2P
references the pgmap which references the target struct device, the
DMA API provides the requesting struct device. The infrastructure for
all this is all there already.

There is a seperate discussion about optimizing away the P2P pgmap,
but for the moment I'm focused on getting things working by relying on
it.

> Additional to that we don't have a representation for internal connections,
> e.g. the common kernel has no idea that device A and device B can talk
> directly to each other, but not with device C.

We do have this in the PCI P2P framework, it just isn't very complete,
but it does handle the immediate cases I see people building where we
have switches and ACS/!ACS paths with different addressing depending
on topology.

> > > and we plan to add an infrastructure for this. Probably this can be
> > > done initially without too much (or any) changes to the hmm code
> > > itself.

It is essential any work in this area is not tied to DRM.
hmm_range_fault() and DEVICE_PRIVATE are generic kernel concepts we
need to make them work better not build weird DRM side channels.
 
> > > So the question is basically whether anybody is interested in a
> > > drm-wide solution for this and in that case also whether anybody sees
> > > the need for cross-driver support?
> 
> We have use cases for this as well, yes.

Unfortunately this is a long journey. The immediate next steps are
Alistair's work to untangle the DAX refcounting mess from ZONE_DEVICE
pages:

https://lore.kernel.org/linux-mm/87ttlhmj9p.fsf@nvdebian.thelocal/

Leon is working on improving the DMA API and RDMA's ODP to
be better setup for this:

https://lore.kernel.org/linux-rdma/cover.1709635535.git.leon@kernel.org/

[Which is also the basis for fixing DMABUF's abuse of the DMA API]

Then it is pretty simple to teach hmm_range_fault() to convert a
DEVICE_PRIVATE page into a P2P page using a new pgmap op and from
there the rest already basically exists.

Folks doing non-PCIe topologies will need to teach the P2P layer how
address translation works on those buses.

Jason
