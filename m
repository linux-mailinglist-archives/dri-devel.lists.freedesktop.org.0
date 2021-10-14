Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEE942E48E
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 01:06:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E0446E8DE;
	Thu, 14 Oct 2021 23:06:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2086.outbound.protection.outlook.com [40.107.101.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6F6E6E8DE;
 Thu, 14 Oct 2021 23:06:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ecBH+2d8bj1fyejjzq5O3zXpC3cToIpHbcW0k8U7fMFAAJEaHUErRQuRG6ww1fk65vBD9saPS97elTaI9HiDhYU2FmXpDAogON2wbApl9ez50QN9diMPH0RfTLm26eUM904DpymdV8DzeTiHZlOlYuKRfWI5FZpssWCXACsW/ic4twUSP1FcwXkeJlofJm+4Rd1ynt1y8eow4Pm+uSeQc0DJFobvZsfaxWQins6Uk6ZoB7ehtEt1nq2Q+NxzzGUGNLcuWYDbnSr+QVuP3Wg7aRLljs0DwwnPgM/ORMRl0PlhS3PPK8LXndKwqBecrt6ANFBkSVDecZttXYBLyQoicg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eus5i0ybzaExcOKrGblhnaRvjEHuS6RHtijRiymB9Ec=;
 b=mh8VIQoRTwWWpceEZen/8k49fyNAm4NVWBtXAuTlQFYDD7SD/HIiKC/k9VEkYW0/k2SqiO/MrLXh0Fg8o1pRcCl5hXahaTYnfn3eu8hRIag8mF1AcMLWkEqbSAkdFPhit1F9ymvoHgUD2fEmCI+iZPXlvC8Mwl4Vim+sCqIuyZF1o+V8CzOlRTIYUhgrr/a90Awr0iWQULJco8hJuRFxBkLTlE+tiNl6I7bWbNcRjoGolXxEHLfUb5JhVDmXo00UROnRs/A+RwqxsUKB+NelJghZIEIWqX/EYWDFSl4okXuKikODBGbL4v+2DjzremKyiKvraTLBwrWtn6suvhIz+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eus5i0ybzaExcOKrGblhnaRvjEHuS6RHtijRiymB9Ec=;
 b=OYcR36KdDtAtoW/Sb68r4UtUkly4Rj8VBgNdwXy5RF2Lhe5tUTB3SxyCMj5jNBIOgFzRhsquYuZcQY3i4npfCWWuUSHLpNohWxua16ro0mkmMGIXGccCw8kajt0GeMqBqu28+l6FjzoqTB0tg8a2Slj4qrAMFuR7ZfK9xyB7BRvFQJjmVSuUXnfYZAHTJHer5adqpZvko0DxAAOc2Xt0NVY65n407syE3IsJzeL3W+vJ1kLy3SBVRMYKCpAXhEHSHmttZKbjNdl8jkZNjN4o7QA+uCyUpwh8CkJgjjjZIE6ZHUUniWMyHY/0iS787pvZvMdV6WVs/GvGj5EhPVLuGQ==
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5191.namprd12.prod.outlook.com (2603:10b6:208:318::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24; Thu, 14 Oct
 2021 23:06:07 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%6]) with mapi id 15.20.4608.017; Thu, 14 Oct 2021
 23:06:07 +0000
Date: Thu, 14 Oct 2021 20:06:06 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Matthew Wilcox <willy@infradead.org>, Alex Sierra <alex.sierra@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>, Linux MM <linux-mm@kvack.org>,
 Ralph Campbell <rcampbell@nvidia.com>,
 linux-ext4 <linux-ext4@vger.kernel.org>,
 linux-xfs <linux-xfs@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Alistair Popple <apopple@nvidia.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Linux NVDIMM <nvdimm@lists.linux.dev>
Subject: Re: [PATCH v1 2/2] mm: remove extra ZONE_DEVICE struct page refcount
Message-ID: <20211014230606.GZ2744544@nvidia.com>
References: <20211014153928.16805-1-alex.sierra@amd.com>
 <20211014153928.16805-3-alex.sierra@amd.com>
 <20211014170634.GV2744544@nvidia.com>
 <YWh6PL7nvh4DqXCI@casper.infradead.org>
 <CAPcyv4hBdSwdtG6Hnx9mDsRXiPMyhNH=4hDuv8JZ+U+Jj4RUWg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPcyv4hBdSwdtG6Hnx9mDsRXiPMyhNH=4hDuv8JZ+U+Jj4RUWg@mail.gmail.com>
X-ClientProxiedBy: MN2PR14CA0020.namprd14.prod.outlook.com
 (2603:10b6:208:23e::25) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR14CA0020.namprd14.prod.outlook.com (2603:10b6:208:23e::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Thu, 14 Oct 2021 23:06:07 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mb9na-00F5NO-6d; Thu, 14 Oct 2021 20:06:06 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a430f7e5-f0ec-4631-e937-08d98f673470
X-MS-TrafficTypeDiagnostic: BL1PR12MB5191:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB51915B84E92675E0FC9A77EEC2B89@BL1PR12MB5191.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FVefM7EwS6nwmox1ftGOja2NGJWuBwgWa2splR0suw8QWu9BNFmF0zYd0n9rH+HogFIEPLGyfYRXZrrdMvd7DOtSBezNhWzsAiUDOYJ0cGozuf/J4PQl+Dx1mEtwgAQFWVds3SpAshzCJmQWmNTiSBtsMiCAfh7Px1Tst03NqLRiS+Tzi/+LOVJLzh46O/9Vc+s5+w5a1zUHioe2q+urG7fZ3cbaw0zpoiWwd25eE7NRfOYlmQ9zmoJcvKpBGWLOAJMrMXrEcPE72c7OdFQe7HxE5rBxZAW7wyVxPNxpPFPbogL3IVFKRbHrdAqyH4/W3FBzDhOZGtePy1tEUyOIO5B5HkQKrzHa1enb4LG3zavtNNz0FmdHkZePD6Z5QkIzcax2DoyuNXwovBy7ITeEx8BWa5FYjcvJhwRbBSl+ya2whZTkwkZjcpXlzcB8X5yH7WFOcGuyCRfqagaET1nx+Aah4nZd6G1p0iS9twQypI3OzRQ6Jk0888hRmhG2ZqxFf0JiKv6AMQHdDu4UO90Ug4D/i7h+jOqDoySnTkVVZNV04BODABfSccoXUztQJiE2kbsyU2r3Ha8BKt2nDJlRBZO3Z/wOOPFBXKebbOpHOhWdCZN1+qh3nPKUiyZkDD5AEjYfXlQB2JO4eoOK0Rx9Md6oz89MROsU2sMuF0FNxlL4rlG4UiSMyJflHPSAu+LtoyHUHRLtt9J5PYa92NZF990pipo7eRnfs/A4F4n1qTDO7jTEVahZF+xM9If0BMamz+KaU3SVrayvcguvLZ4MjA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(9786002)(316002)(9746002)(7416002)(66476007)(8936002)(83380400001)(66946007)(86362001)(4326008)(54906003)(26005)(33656002)(2616005)(36756003)(426003)(1076003)(966005)(66556008)(6916009)(5660300002)(508600001)(38100700002)(2906002)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BpFYrVf7lzO5u5Ac42S3SXWHokieeDy7FzsMISryOxDmFDCxxxwX1aUzalTL?=
 =?us-ascii?Q?23qdZkdeJIVxPa8k7dSCZRnddY4RQaDJ3XcfqRVOg7e9QsdVRe6KvKX4XYOC?=
 =?us-ascii?Q?n+LGuMa8BpXHtKsO5FYS0nMaQQ55Sic2pt4jVssqS4c+29hlLsmZg4aMwkA9?=
 =?us-ascii?Q?qWe0LNN+7kONeuPGIke4QUN6ghMEg9T6MJUUucvYzhJYTpfhHkNY6nrmdvf0?=
 =?us-ascii?Q?0b0u+t5qPzJwca97rdljxryvQY9tskns6Hpo+HcYXVE+8FQdWwMkzWdQNqnf?=
 =?us-ascii?Q?NMiC6mYj2qZBtHAKHLg0WfhJw1+hu1dGZW0goyo/5vk9XXM7fYcTaKA0GPgg?=
 =?us-ascii?Q?NrxO1S/+SsqddV14sf9qyTQ3HtxlO4izPHYtPcGrhJ0OSkujeWn1HQHpwcQ2?=
 =?us-ascii?Q?aGWtbjvIxoIYP0e6M3NLNcSK940uGhC+70tcN4oxmR+CjJLxlkicW0c1KaMD?=
 =?us-ascii?Q?wNT4dSA3H7cPQvxW+c+Keq7A4jrI4ZXOvrrQ6o3r4AgtlZQPgzRzvEangdxz?=
 =?us-ascii?Q?n1IJRnh7iryILz0ulLImElxnvAI6RzbAYNNAdbCo+Vi8lzkeYExtuSpvTXvO?=
 =?us-ascii?Q?qrVou79Ec8ymHdKD6TRR1UWM41jAbdnX47Vx0C9Kf5ZnQPuwLLsesmePTuuP?=
 =?us-ascii?Q?O4Ry9b/9PfS8fJf2nl4MfAT5SNCMFm1aETJnvxOzA8nqlg06HOT6TWFvr6nU?=
 =?us-ascii?Q?N/XvsN8Y7dFu+aaoykHGKY9TDyeftXa1xm6+lRFy8n3ljMA5buiY+CJOZgr/?=
 =?us-ascii?Q?LApttLYzcksmEDOMYBJ3kh9fIb03t3WXwfVrGwMHtBQlbQNGraqvKbyhKOTd?=
 =?us-ascii?Q?BkrwFFYtV17f/iUYqzmdSrGqQfAXv5Y7OFuyIMCQgFidfD0jvaFPiEibm2wL?=
 =?us-ascii?Q?N2WnEZ4l4A4U7fUcn/AS8JMZ50pNT5EPEJxxrZqh6O8Mc6tqsmOs0+1YKZkS?=
 =?us-ascii?Q?j0MyvTClO/04KFWhT7ZaRjKVOhixQ55C++e89yxNOabvv1Uqv9YYNaFwDgJ4?=
 =?us-ascii?Q?NltxR334ztqs1PFsKEz8D6ClhflYSXAhA/SI5tQ2G9pqZzbAuHPywDKi+g4w?=
 =?us-ascii?Q?8MfOjhuxoiu5dUm0tLQ6Svl3nIpZ9HNYreVJ62yE/b3FbmjWxcyp99IMUtAQ?=
 =?us-ascii?Q?BF1o8rDGw5pCou26ECfKjkC5IEW5P3PgXpdZVo6QsmIcpO1vYnHuRXJKEYVT?=
 =?us-ascii?Q?Gvftrv/ZLE7DiuULV8yBCRTkAmEajbZbVlpD0FVo/c4X/VTaKpiS9c9gjKgF?=
 =?us-ascii?Q?oRwj4avpVyZ6AFqpzMpGMl1eZE67J9Y0cmRVbKRzr+90giAN0IpC65UJKNAd?=
 =?us-ascii?Q?UIOm5A6qzUUmiId7hJEz9+0Z6YohRtM49vlAqaT/xhCpTg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a430f7e5-f0ec-4631-e937-08d98f673470
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 23:06:07.6582 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5JBlmbqrGVJSWIk4776Kp8B0Eg5TA2GC0045Oo/VHQxnNoL+0idR+ABHYhrAMjwX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5191
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

On Thu, Oct 14, 2021 at 12:01:14PM -0700, Dan Williams wrote:
> > > Does anyone know why devmap is pte_special anyhow?
> 
> It does not need to be special as mentioned here:
> 
> https://lore.kernel.org/all/CAPcyv4iFeVDVPn6uc=aKsyUvkiu3-fK-N16iJVZQ3N8oT00hWA@mail.gmail.com/

I added a remark there

Not special means more to me, it means devmap should do the refcounts
properly like normal memory pages.

It means vm_normal_page should return !NULL and it means insert_page,
not insert_pfn should be used to install them in the PTE. VMAs should
not be MIXED MAP, but normal struct page maps.

I think this change alone would fix all the refcount problems
everwhere in DAX and devmap.

> The refcount dependencies also go away after this...
> 
> https://lore.kernel.org/all/161604050866.1463742.7759521510383551055.stgit@dwillia2-desk3.amr.corp.intel.com/
>
> ...but you can see that patches 1 and 2 in that series depend on being
> able to guarantee that all mappings are invalidated when the undelying
> device that owns the pgmap goes away.

If I have put everything together right this is because of what I
pointed to here. FS-DAX is installing 0 refcount pages into PTEs and
expecting that to work sanely. 

This means the page map cannot be removed until all the PTEs are fully
flushed, which buggily doesn't happen because of the missing unplug.

However, this is all because nobody incrd a refcount to represent the
reference in the PTE and since this ment that 0 refcount pages were
wrongly stuffed into PTEs then devmap used the refcount == 1 hack to
unbreak GUP?

So.. Is there some reason why devmap pages are trying so hard to avoid
sane refcounting???

If the PTE itself holds the refcount (by not being special) then there
is no need for the pagemap stuff in GUP. pagemap already waits for
refs to go to 0 so the missing shootdown during nvdimm unplug will
cause pagemap to block until the address spaces are invalidated. IMHO
this is already better than the current buggy situation of allowing
continued PTE reference to memory that is now removed from the system.

> For that to happen there needs to be communication back to the FS for
> device-gone / failure events. That work is in progress via this
> series:
> 
> https://lore.kernel.org/all/20210924130959.2695749-1-ruansy.fnst@fujitsu.com/

This is fine, but I don't think it should block fixing the mm side -
the end result here still cannot be 0 ref count pages installed in
PTEs.

Fixing that does not depend on shootdown during device removal, right?

It requires holding refcounts while pages are installed into address
spaces - and this lack is a direct cause of making the PTEs all
special and using insert_pfn and MIXED_MAP.

Thanks,
Jason
