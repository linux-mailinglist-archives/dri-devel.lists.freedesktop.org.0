Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6499EA2379B
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 00:07:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC95B10E9F1;
	Thu, 30 Jan 2025 23:07:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qZ5t1y15";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2064.outbound.protection.outlook.com [40.107.243.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B19910E029;
 Thu, 30 Jan 2025 23:07:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FnoX3AV+VsDP6iNYLdFp7Lj4m5invGLTN9toOgB+yjH22O+sDqtUiCpeT4iX7n+bYoe7M9sYqzBSz+dOGGQTR47IgSO4oCwuMsUDPStY1FALjy1+m2XuL8niQ1DMNS1y1kMX2iIRbKm8TOdUstRsI0wmnLUK00HYzygsVjlJzmZljJ5pqw6B85iADnlb+0RHR5IRM+kG8DbxiQKfygx0a/8IXH4l4n/ZreR8mgJtcR0DZU/SMvWdnD55tHeLLkuxvghkxh0F0LO7xabqOBpfvkZsRj9dAV+9ulev2j+/NT9zF4vBj4aI2gkFsxQMXDy+TNv2LtqcGNoxTWKB4jVusg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ckLczTdbd6CcujBvy0iAGAoEK8vq7yYEAR8Q9iGHm+Q=;
 b=nxTSYwd+JXk0di2hJ5nX9tsrvOt66vYW0MrQvG0fd/VYDRdLe74f80PxBfxLJy0QKioKmZbAlri5Asdx/D8LNIDjADDpxB8sOkOfZ9GV1+JLfdyDBYJSzkk/Qf8QBigPAHPH1OQc4rqXT74s5jzt90uA7NLoUQlJQMe5XxMNKDM8cElMeuD5qdBsaJNPntQogZfA6OpNslj6PVpIK/sh4lajmrNc2HAVl2Q0ODKvDfKen3aN9HkpMcNpXx1a+O4H5eZ2MmK5RRm8oxzqoUk6F0+YHvA1Tv92lpf/mEzeqRwWEzRoVVzA+oUtT0RN3bWd0oRiBPNLwMZ1MCo0uvYjpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ckLczTdbd6CcujBvy0iAGAoEK8vq7yYEAR8Q9iGHm+Q=;
 b=qZ5t1y15zYaQ5UIO+SCrCOSQ7mEiyMpK/RHndiWvdq6HPxBL/a8YFbPCtCsOXWiNsBMKZod6rQeMIAiXPLTwXWoXN+NHV3AdP7ZoXPaqguEbfpl7lAknbef8sSr+wpuhzZ5KfZ2yQH/Ff67okhCoiVaxE6E3b6ItBs16zlz0Je0wpaSX4L0ajTMK+ATBvHGPX29qMUwhQhDl+lUC/EyNnOkXYCl/UZq3SF/hgBpudc6sJ63RcNVSAiJcLUyYDXkhAuKiPrKovf9/7GoXFM2TxCLplv/zWbSZdL84I0neoRnkONf4Xp4m9Ex1D6i52yLMNzV8YC84AbEuOyc6Z8LK7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 PH8PR12MB7351.namprd12.prod.outlook.com (2603:10b6:510:215::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Thu, 30 Jan
 2025 23:06:58 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8398.017; Thu, 30 Jan 2025
 23:06:58 +0000
Date: Fri, 31 Jan 2025 10:06:53 +1100
From: Alistair Popple <apopple@nvidia.com>
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>, 
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, 
 Yanteng Si <si.yanteng@linux.dev>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>,
 Jann Horn <jannh@google.com>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v1 05/12] mm/memory: detect writability in
 restore_exclusive_pte() through can_change_pte_writable()
Message-ID: <z7s7xb2ftv5hqg3uzjqkou6enguleazwwehxbi5zulbkar2aej@zlbdh2kdewdn>
References: <20250129115411.2077152-1-david@redhat.com>
 <20250129115411.2077152-6-david@redhat.com>
 <Z5tLmYOQaZrdWQHN@phenom.ffwll.local>
 <2670f65f-e973-483e-aed6-526d00125ad7@redhat.com>
 <Z5t4rrkRiOsRY2jH@phenom.ffwll.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5t4rrkRiOsRY2jH@phenom.ffwll.local>
X-ClientProxiedBy: SY6PR01CA0054.ausprd01.prod.outlook.com
 (2603:10c6:10:e9::23) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|PH8PR12MB7351:EE_
X-MS-Office365-Filtering-Correlation-Id: f162f837-9ada-4f2b-8409-08dd4182cbba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YXxpvTey15wY/Xfa9/aorMzqaA2z7d8So5onz50z2sltb1SBzoLETaNP3cd+?=
 =?us-ascii?Q?7kuChZ3wuCMqfSGBYIZC/zw3oQIHPMqCKxkXE35QZ+uLswou/6mF22W2SR20?=
 =?us-ascii?Q?wu/tp6sgAG1/mJQlcAqM2+lSbMoqO5nL9NR6I9noivHK2OBZDNAxaUXv+luF?=
 =?us-ascii?Q?hdK86/8yLHEmU0rYa2IYJuswrFCjJaorh1D6P9YwTPAAFS3z4gzgMrZZ/8mT?=
 =?us-ascii?Q?bgaYqXG5Pkn+LHE3imY1yHz4+CJBnvppPOI7hLIJgyRobcEpigM7yymvkNiq?=
 =?us-ascii?Q?yoWViAm2xvsLGbqAHZso/LUC/fcQhzDcc9oW34mXSgCND4uzA7exyG6vXHvD?=
 =?us-ascii?Q?Ei+oSuMaNUa/UYP/X0gUoiAg7DfC3CPz4JOfm+8j0gHO4UVLYNe4tkQ3vIuZ?=
 =?us-ascii?Q?9j5L/cg0q5zf+qSkpe7qhoYBuOLWwOUoDApM7sc4vBByCynKYz0PEcYe1z5a?=
 =?us-ascii?Q?oJLfZVvZ42S1Jvz3icxprDCxotHA+OeH8ytkYf5Za+Lzg3GoI71vXNQa1jzd?=
 =?us-ascii?Q?U6OPgHLSEKaPzNADBj8LUFlkdpsDmWDq7BJ29Fc2Wt/qOe18gWQIyTwKURXv?=
 =?us-ascii?Q?ixlD3EptaoeT7GcarLXDz+UWT+jTuoSeR/0AZb25CngcIICEmMQMlbeK6mur?=
 =?us-ascii?Q?Y4K4grzZzQMdySfYgBFT925mVxRi4GA+4DwTnyD8EjnDR9MPKH1WVesCED4F?=
 =?us-ascii?Q?FGffZ+gt+6qWiib0f1GEsV3wzDU4E23efPHsDQG551iDNbL785MvOH+IbETz?=
 =?us-ascii?Q?9Nc/TghcUpPxsYWRHXJ1RBsP85DNU87JKrjS/YyO3USktqpHIOI3fTYuX0FX?=
 =?us-ascii?Q?nQ/SvS3/+ZJTvRcDTblArbmKquYSU6e8SWnsN5YawXYqVNFU1scFiyVuAz7Z?=
 =?us-ascii?Q?07O8/53HGJEgoixqzUj/Apq9lFWIwILKv0fYTQvWkglTcjLaX1vqt47N+pd8?=
 =?us-ascii?Q?kUeV8GooUTcXrTMRnjrHJwIQ/TD9jsvUl3dF4VPgeGixVzczRSixDfNhOIAi?=
 =?us-ascii?Q?auB5pNHZAGXCN4Qbg6eQPqjrgYr8eBqHIdFKfOcull8l+NThd/RTrGbo/ngW?=
 =?us-ascii?Q?RWW3uqjA9gtjITKBzfwJnB1c1Ikm5OfqGRD+zFjjH5qNyma9obyhDqa0PuYI?=
 =?us-ascii?Q?l9kFe4PZBqS26QGbPfUYgR/voEYdDH/KHq3wN4wT3E/vbfXxwXSx+vmyC3d7?=
 =?us-ascii?Q?YTBnb4B/0UwIFqLJr2an4JbqdUpM2hAMHTciyhqjVhmoUxRcSj/reEeMibgB?=
 =?us-ascii?Q?02JK9L/2IEfjDDOPv+isU2uPHWTLhCIIHKIl3Dg6DDXDZqMrxDeOtHaqzAlR?=
 =?us-ascii?Q?XvHBMmkVlccU78g+l3yoc5GYHKe7FC/L7wkG/z8kn+spoJUGTBWy0lhAnqt+?=
 =?us-ascii?Q?ATBVUrxpxBncXg7FfYahy/O3u8aKHoprcAZwS0deTXX3+V5E3QZkSWz8ogKl?=
 =?us-ascii?Q?mTkKwA5zcbg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Yh3hdTIYL2UfTWGCfTn9/h00nRMnfxLhgz8mQlM36pu/wHrzMmkb1lmk7A7U?=
 =?us-ascii?Q?aobTBSDmaAMAj56rTFdTopgPCXSPQc8sfUVPoalRnj7XZmrdKvoO/ITCZCGr?=
 =?us-ascii?Q?UCjI76zH+Ibq29fPz2sFJYJGLD3spas6gdIK4s7kX0JvshZvYZWdvif9iKBg?=
 =?us-ascii?Q?HOnr6FD3RPybUDyNuFuyCUud0H0MNIs2awIcIlnM94Uyby7ys1YpYkZkanQr?=
 =?us-ascii?Q?d3HPLFPTLA5Uc0GaFBz9bb7zfMruU6Mg8hnihfeIkDno/FHKkY4H1WbIaKW4?=
 =?us-ascii?Q?Oihi5TgkM/r6xiZh4Ahd5qAImYir5B2Iay4oO96F/jEN9Lt/GQ1GVDUExTJ8?=
 =?us-ascii?Q?wA0jeOExMCpPA2qceIGTrD/14tWlRz77M4nqRTMrcvyyy0CAKpwZGG9VPtOC?=
 =?us-ascii?Q?CabRJiwxT1Uyj30hS+IsTOMTFNGgJ75AWvO+8slPjCPKv5khX4MVAjoK+xZo?=
 =?us-ascii?Q?oiAduqJBSbMGufBHDrDlW/zjpEYe1kwmaIdmDvbGgq0AKMAsKnKku8UpECTn?=
 =?us-ascii?Q?nl0+cLtzeySaanqLU5BNNB1Lw0sZZua/etFkeL2wk8mUXEe48f7qyBnXZL1n?=
 =?us-ascii?Q?9p9hD7y7ZNMFdzKF1RljEDuT3WzJaIGz0KeSUt9lZkht9KMAzhWZ+zC/QoQV?=
 =?us-ascii?Q?nhj18wHseyPkyM+tj5jOutRqOeAK1YwHtvoGnTbWuXq4Ja6E4cyf19uL5ENK?=
 =?us-ascii?Q?9rbpq7MDXjY3KzvZ5CFePlHtj/2rfEUWJ7fX1MY+qrtVTdKlh6Ik6jRoG3KH?=
 =?us-ascii?Q?rOxUTi4bXH/GvT5dY0IhT+OpqKVpB0Qzn7qHg84VPFGhfqGW+/RGgHZjxlpQ?=
 =?us-ascii?Q?FPX0/fm4IgSr3POMVL1CjjtK+uV67q+CVOr8oVdCOlWNpDQ8rfLme6sDx7NQ?=
 =?us-ascii?Q?wNQjWWMDxTfESb4gRAE6nfyWpEu7U49D2UGOLkpROw6rtuukee4hjZlbrAdS?=
 =?us-ascii?Q?3sCPbae6vDIkLqZZXthMkyjSPRx3FnAmr4idaAtcStNKxsP5rm4rm2QDLkmr?=
 =?us-ascii?Q?rdx9CqgNyuQ5AkV0vcVIEcXryLEvP+bVstCt7vCMlponAXyIp225JlSlLJAW?=
 =?us-ascii?Q?6mXi23EuX0q6oBykdOhFgucYsvP3kFDvyNkd+5QdDn5Z3iNtd8GJvj6aSafe?=
 =?us-ascii?Q?dtioK6XShf50QfVVU2w7X+eHJy9q0App2r7oRgawkOBZQRxkJfXE/DYauTqE?=
 =?us-ascii?Q?xO6TdQmE1c/rv40CDfaVszwKTsK3UdewPv6yrZsuHS11phWwrmWb9XPZSWS/?=
 =?us-ascii?Q?3ds+hsz+7va0rFcyHUfNR4wDXWidU0zrewOet794PPbrBgPfIHxs7hv4RQX3?=
 =?us-ascii?Q?qQ1jP+yEL0RvNbtAF3GUgCSkwjLUsMonhxAvpLZbbXpgrEqzSWEaRozTTGq/?=
 =?us-ascii?Q?wPgQphB+Z0h2ZFODWE3A8NI2LrwcFw6HDi+MbwFqDFQDhemhGizx8lToyluG?=
 =?us-ascii?Q?k6rigDo/PW8MiuaNNy6zdvBuPUJ5SGHLUX3RJfRflQ5jOcezDiol/ySIExW7?=
 =?us-ascii?Q?juiSlIDRcgdGzc9lE64DosNOUEUBvu1iN7zyo1Fapx0igViXC/xQidLR9n4J?=
 =?us-ascii?Q?XQm6JvJ0iJ+TlCHrMxyGFAaQJLeqzOVcUI2tXdQ3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f162f837-9ada-4f2b-8409-08dd4182cbba
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 23:06:57.9814 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9nCNQ6X0WHfXqhG4nqssBHabqcw9AHPag1NlpGPLm3cjkBHNkZrA14kTkXzxFWwJeqtPhyyaMNLvWgv253pQew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7351
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

On Thu, Jan 30, 2025 at 02:03:42PM +0100, Simona Vetter wrote:
> On Thu, Jan 30, 2025 at 10:58:51AM +0100, David Hildenbrand wrote:
> > On 30.01.25 10:51, Simona Vetter wrote:
> > > On Wed, Jan 29, 2025 at 12:54:03PM +0100, David Hildenbrand wrote:
> > > > Let's do it just like mprotect write-upgrade or during NUMA-hinting
> > > > faults on PROT_NONE PTEs: detect if the PTE can be writable by using
> > > > can_change_pte_writable().
> > > > 
> > > > Set the PTE only dirty if the folio is dirty: we might not
> > > > necessarily have a write access, and setting the PTE writable doesn't
> > > > require setting the PTE dirty.
> > > 
> > > Not sure whether there's much difference in practice, since a device
> > > exclusive access means a write, so the folio better be dirty (unless we
> > > aborted halfway through). But then I couldn't find the code in nouveau to
> > > do that, so now I'm confused.
> > 
> > That confused me as well. Requiring the PTE to be writable does not imply
> > that it is dirty.
> > 
> > So something must either set the PTE or the folio dirty.
> 
> Yeah I'm not finding that something.
> 
> > ( In practice, most anonymous folios are dirty most of the time ... )
> 
> And yup that's why I think it hasn't blown up yet.
> 
> > If we assume that "device-exclusive entries" are always dirty, then it
> > doesn't make sense to set the folio dirty when creating device-exclusive
> > entries. We'd always have to set the PTE dirty when restoring the exclusive
> > pte.
> 
> I do agree with your change, I think it's correct to put this
> responsibility onto drivers. It's just that nouveau seems to not be
> entirely correct.

Yeah, agree it should be a driver responsibility but also can't see how nouveau
is correct there either. I might see if I can get it to blow up...

> And thinking about this I have vague memories that I've discussed the case
> of the missing folio_set_dirty in noveau hmm code before, maybe with
> Alistair. But quick search in archives didn't turn up anything.

I have vague recollections of that, but I could be confusing it with some of the
migrate_vma_*() issues we had dropping dirty bits (see
https://lkml.kernel.org/r/dd48e4882ce859c295c1a77612f66d198b0403f9.1662078528.git-series.apopple@nvidia.com)

> -Sima
> -- 
> Simona Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
