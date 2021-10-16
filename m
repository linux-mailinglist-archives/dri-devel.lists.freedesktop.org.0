Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DD743037D
	for <lists+dri-devel@lfdr.de>; Sat, 16 Oct 2021 17:45:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03FB36E441;
	Sat, 16 Oct 2021 15:44:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2043.outbound.protection.outlook.com [40.107.220.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 231496E441;
 Sat, 16 Oct 2021 15:44:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=emtktXHgfLLcDLO1BVl6nyfZ58DFTy2Q5IQJPiHY6SfyjdHgNzsJhYgI2L++BqheP9rb/qIFNBGE17GSdw+467wPGHeQcHWofruu1EoP9zSNyH7LHBQLUIorvPjJlXGAMp01LWvI5mHJjugjQ3BdSGNLNG/vS/cXhPFNBDMf6uk9tXtvPvgp1UbitGtTVXw+1DahBR0DMzHDQsBnRIwKSzeJQG1scJqAk0os1TjIXve/Q1rCkSEcp2OUGpS8kXnGDvR7rjBKxRJaq6jEKSoJHFxm3+RAEjZQicXw1QlO7HF+Ale19sfeA8RXuz0bU4j+RvVfyB7LTZSp2xg3qmMN4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mP7alHt7lGE7S4IKYV7N8ijY50jHACds0EOkTDZ7MUY=;
 b=e/llNOIJamiFgCqRpmPT7eGlUZLrsrniC4ON9X/BFKy7FEOCVWS+c+Q5ouAFeJg0WAdarEAyvDxXeeXhKCmM188NQMQ4dEE+6ktbxBGmmuNY2+1P3vymc4zfLhO6dUefeDD1IyDF5aLrSg+UDr86VJUHrUZX2xaPn6l7xjos6VL+El7q8T9SH1Q/L9liL6KE3lp5CpxX8zXdslpLvNiDYcxYmgm8JgmqX4tuAyEiUhbsFtNQM8ySX61Roau+yVgVxhYcRKP//ey5yp6KE1NIQ/H14KuHqSzp6FutVANoRWMpkjl/RDWrj1eTfj4fRe3MflwtI46KmYwOhxLQ6gglHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mP7alHt7lGE7S4IKYV7N8ijY50jHACds0EOkTDZ7MUY=;
 b=mDhuLRwIs3lE9xO9o9MlQfzZ4dC+4bQoq7TIfyOXe96JE+97uMLzOQ0VTR/QPyqEuyDzc6AODRVT9u5Ep9FjVRPu4Oajw5NF2eZ/zV8i4WEQy53jkTShsTEevIxOgjo7OBNDvCwwNI/xWQuBPjA5WjonCfTnUXIoX5tXpQe7MTeIHK0c09xgHt6u6UGH10q1g/mCpYsQyAoWkOsY7vRP8KmD/9Y+dH12Qa8VRf4iI2znRNyJ80ANx4nRmRmfBLGSKIuFXZSdYDmRUiCQfXK757jcpI492z+OO71y9zxg+3NrFnSlsLYvP97QjX3xxnWW/qC3B40Ee97LVanoQU7FnA==
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5109.namprd12.prod.outlook.com (2603:10b6:208:309::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Sat, 16 Oct
 2021 15:44:52 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%6]) with mapi id 15.20.4608.018; Sat, 16 Oct 2021
 15:44:51 +0000
Date: Sat, 16 Oct 2021 12:44:50 -0300
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
Message-ID: <20211016154450.GJ2744544@nvidia.com>
References: <20211014153928.16805-1-alex.sierra@amd.com>
 <20211014153928.16805-3-alex.sierra@amd.com>
 <20211014170634.GV2744544@nvidia.com>
 <YWh6PL7nvh4DqXCI@casper.infradead.org>
 <CAPcyv4hBdSwdtG6Hnx9mDsRXiPMyhNH=4hDuv8JZ+U+Jj4RUWg@mail.gmail.com>
 <20211014230606.GZ2744544@nvidia.com>
 <CAPcyv4hC4qxbO46hp=XBpDaVbeh=qdY6TgvacXRprQ55Qwe-Dg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPcyv4hC4qxbO46hp=XBpDaVbeh=qdY6TgvacXRprQ55Qwe-Dg@mail.gmail.com>
X-ClientProxiedBy: BL1PR13CA0186.namprd13.prod.outlook.com
 (2603:10b6:208:2be::11) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL1PR13CA0186.namprd13.prod.outlook.com (2603:10b6:208:2be::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.8 via Frontend
 Transport; Sat, 16 Oct 2021 15:44:51 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mblre-00Fhn7-Dg; Sat, 16 Oct 2021 12:44:50 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b131a182-074f-4683-708c-08d990bbe43f
X-MS-TrafficTypeDiagnostic: BL1PR12MB5109:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5109A7D71E44A395FA9B54BDC2BA9@BL1PR12MB5109.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mK2mvOP8CdOXUKmEM3NpDLF9N4zqXPf7mgiDCl80UV19xrCbYyC7eHstCcfhuNpvaU6heMFf6Es5buivbLmwA2S3vnyr/srlAGzzWXiAyIFEHQAeRpihwzEAqjUCItavW/jrdDht74pqb+vAQVMkEIMkWzcR/KU8ux1P653STU4NnXmyxwp6SDJBTTFo92EYtTNdH9DzNsPDHPe5OwgexWQGR4nBOQphmKtXFCMIzxid0lNGCyKroD16ZMFak8Wo6NmHFuCHC//GunDdSf7XqJEKut0YmSY0gFJYmMH2w+A4Kky6iDFq0QbnrHmXXmFeRDl16datJXMIuR3bKvikUMuUJcnfYMCTR47CvEbBiojolPQva+JbeRIzM4GzwWLQiq8eCE6hrKLLZxk3PgOS3gPgPAihPw0VnXE8Hg0vUNKxjOfHLC8LuURHMp10TKexth8FyZGJqajW5rSE5k8UVvk7XbAOQswZrmW+XslbaNUL4gmye9OrXDw19ztyqU7fB0cMsW5XjcXZ5tpicFV0iLntwfdbzL/lV6Y1oGH1yJeXNHq0LyzAhw4pcDL/PIFXAobdaEAgx4h8TdZpz5z1Tv6Sk8ftPKWeyUR8qoUbHi4RXxgRfTGTbuJSJ6T7h2k1TCTu2ZTHfLrhPA2J3yGOnBQRdjpO5Kh3yTBoyQeLZxAwvj9OluFF4rFCcGd8pnLsqdR+5WOALkDqtdbfm4u4RMjO2U8hd9jYeonWyAGjZF19y/zy6cUI0GJDX579G88ilnOfaxhglI1VizycX8YBcA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(9786002)(9746002)(508600001)(33656002)(2616005)(426003)(86362001)(6916009)(2906002)(66946007)(186003)(1076003)(54906003)(966005)(5660300002)(53546011)(8676002)(83380400001)(26005)(66556008)(66476007)(7416002)(316002)(4326008)(8936002)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FM+pxeW5NI1+xF17nhWK2LD+hf9d2pwGS1Sick2NwoyQe7tidb6dyhGtcJgg?=
 =?us-ascii?Q?Vg7TqpasGNDH02U2F9TZEtRcoctUtEiMzibYZMFy6I7+EPYY4+iM/B5VKhMy?=
 =?us-ascii?Q?xUtNGtOnUhZePCiV924jBtwjarSbVhiIiY1HMiXVNX59ASF55NLmqjzv6afi?=
 =?us-ascii?Q?77pO7kEcnT6d7GB12LpQ0sEd+Vs6oUBVc0tCgJ3NC0EwrsQPfV4gXVC15BGi?=
 =?us-ascii?Q?4evHdQ6JJUDrLsiLJ3Coi7czCKfbJooqvT9scNN8kt7LjplAWIGtFEDfT+RR?=
 =?us-ascii?Q?k9hZRVetJlXzQXS/gYLgQxCD9wCnU2bZkndIufP/HRH2vnhmfi7eetg45fZG?=
 =?us-ascii?Q?IXxcJ/pCdPnqYLet6OwkAinyyKhMAwbAs119CidNkKmKeIVd86kekqYoy/Os?=
 =?us-ascii?Q?1DrrC4b5w9IDAns1ZaTrVfc9lkTSUu9wWXX7ymnLU4mEDxdJlOxCCI+BTi9b?=
 =?us-ascii?Q?WDDK9M2LhLebloqDqU5zMOhtD0+k7Z1JKmOPxzUbk/Q41UKudN5/Gz2VIh0j?=
 =?us-ascii?Q?thUQOY+9VrvglywroWFkkBTjPtqzTNB5s8b7iiVgWMVDDObztB4xtoVTG37T?=
 =?us-ascii?Q?IKlMSDysFwhgpEO8FFEskepyiZoRXpAVu2ZVjVfckxZwlzRpiBkjo+5kfy6v?=
 =?us-ascii?Q?5s5kwTN60vjVCDoJ2ln/+qCOXUudfw6Q1sEPp10jA9TrhfFpv2KhUMkCW3/4?=
 =?us-ascii?Q?1u+o1avYMY+jmEorvo3hk4Yseji+zw64o0D2S+r0WF5r4YOBdqQo5s1DiZpd?=
 =?us-ascii?Q?wY+MOKybAdQ0MtMVPPnZ3P1Hhvda9WYto/J9qdPogZ5020RgEYQ75eRCwT86?=
 =?us-ascii?Q?Wu/BQl8FNJxBTKljqGrkgBzakFVOswHMOXw4AxLO8d0t8/uyYxaC5fiGv9j6?=
 =?us-ascii?Q?722HWiPDK/Qwyvtl4ZVgOaXfENPIlDNOqyDqRTB0l8N2InLMIjIt7okY/ON9?=
 =?us-ascii?Q?ges5oGEb0wGyvOZEcK5JiBW7sG5wpinKj1CpoC1Dg7g+mUZ6UQfKOsHua1Lx?=
 =?us-ascii?Q?meR9lkRt8XP3sm2t0TuRae/hY/ysngB8D/LwMy0GOdMpHIZzP9dV0naKwntZ?=
 =?us-ascii?Q?qqNSaicRvfKdFProyLAM+zTwKk2OwuBgLWpzlHMByVitzNLcoCHFSLzU9XwO?=
 =?us-ascii?Q?LDisH3uRg8Jc7WwlSZY3+exjDVylOqOagPquEy9XLFXoCa/KEfFDmYLsXHet?=
 =?us-ascii?Q?gWwCeD8q38vbSor6jGlt8auZpW4aNKTEJhNBq2bz+2Oatn5GFKj/krUR1eue?=
 =?us-ascii?Q?HHRLmOAWj6Nn8raemlSyfhwhnQeeU0RR9YKGe7GHHW0c/UTOOcJzBkU7X9BA?=
 =?us-ascii?Q?YCuX1OCUQgThRWnyCj1N+pMU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b131a182-074f-4683-708c-08d990bbe43f
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2021 15:44:51.3527 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fp4d+vNK2vfiM460k1DqVSIviIAy4HVhZT2o6KrigNg5CZ2zxU9pCZQP2xmbGBZi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5109
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

On Thu, Oct 14, 2021 at 06:37:35PM -0700, Dan Williams wrote:
> On Thu, Oct 14, 2021 at 4:06 PM Jason Gunthorpe <jgg@nvidia.com> wrote:
> >
> > On Thu, Oct 14, 2021 at 12:01:14PM -0700, Dan Williams wrote:
> > > > > Does anyone know why devmap is pte_special anyhow?
> > >
> > > It does not need to be special as mentioned here:
> > >
> > > https://lore.kernel.org/all/CAPcyv4iFeVDVPn6uc=aKsyUvkiu3-fK-N16iJVZQ3N8oT00hWA@mail.gmail.com/
> >
> > I added a remark there
> >
> > Not special means more to me, it means devmap should do the refcounts
> > properly like normal memory pages.
> >
> > It means vm_normal_page should return !NULL and it means insert_page,
> > not insert_pfn should be used to install them in the PTE. VMAs should
> > not be MIXED MAP, but normal struct page maps.
> >
> > I think this change alone would fix all the refcount problems
> > everwhere in DAX and devmap.
> >
> > > The refcount dependencies also go away after this...
> > >
> > > https://lore.kernel.org/all/161604050866.1463742.7759521510383551055.stgit@dwillia2-desk3.amr.corp.intel.com/
> > >
> > > ...but you can see that patches 1 and 2 in that series depend on being
> > > able to guarantee that all mappings are invalidated when the undelying
> > > device that owns the pgmap goes away.
> >
> > If I have put everything together right this is because of what I
> > pointed to here. FS-DAX is installing 0 refcount pages into PTEs and
> > expecting that to work sanely.
> >
> > This means the page map cannot be removed until all the PTEs are fully
> > flushed, which buggily doesn't happen because of the missing unplug.
> >
> > However, this is all because nobody incrd a refcount to represent the
> > reference in the PTE and since this ment that 0 refcount pages were
> > wrongly stuffed into PTEs then devmap used the refcount == 1 hack to
> > unbreak GUP?
> >
> > So.. Is there some reason why devmap pages are trying so hard to avoid
> > sane refcounting???
>
> I wouldn't put it that way. It's more that the original sin of
> ZONE_DEVICE that sought to reuse the lru field space, by never having
> a zero recount, then got layered upon and calcified in malignant ways.
> In the meantime surrounding infrastructure got decrustified. Work like
> the 'struct page' cleanup among other things, made it clearer and
> clearer over time that the original design choice needed to be fixed.

So, there used to be some reason, but with the current code
arrangement it is not the case? This is why it looks so strange when
reading it..

AFIACT we are good on the LRU stuff now? Eg release_pages() does not
use page->lru for is_zone_device_page()?

> The MIXED_MAP and insert_pfn were a holdover from page-less DAX, but
> now that we have page-available DAX, yes, we can skip the FS
> notification and just rely on typical refcounting and hanging until
> the FS has a chance to uninstall the PTEs. You're right, the FS
> notification is an improvement to the conversion, not a requirement.

It all sounds so simple. I looked at this for a good long time and the
first major roadblock is huge pages.

The mm side is designed around THP which puts a single high order page
into the PUD/PMD such that the mm only has to juggle one page. This a
very sane and reasonable thing to do.

DAX is stuffing arrays of 4k pages into the PUD/PMDs. Aligning with
THP would make using normal refconting much simpler. I looked at
teaching the mm core to deal with page arrays - it is certainly
doable, but it is quite inefficient and ugly mm code.

So, can we fix DAX and TTM - the only uses of PUD/PMDs I could find?

Joao has a series that does this to device-dax:

https://lore.kernel.org/all/20210827145819.16471-1-joao.m.martins@oracle.com/

TTM is kind of broken already but does have a struct page, and it is
probably already a high order one. Maybe it is OK? I will ask Thomas

That leaves FSDAX. Can this be fixed? I know nothing of filesystems or
fsdax to guess. Sounds like folios to me ..

Assuming changing FSDAX is hard.. How would DAX people feel about just
deleting the PUD/PMD support until it can be done with compound pages?

Doing so would allow fixing the lifecycle, cleaning up gup and
basically delete a huge wack of slow DAX and devmap specific code from
the mm. It also opens the door to removing the PTE flag and thus
allowing DAX on more architectures.

> However, there still needs to be something in the gup-fast path to
> indicate that GUP_LONGTERM is not possible because the PTE
> represents

It looks easy now:

1) We know the pfn has a struct page * because it isn't pfn special

2) We can get a valid ref on the struct page *:

      head = try_grab_compound_head(page, 1, flags);

   Holding a ref ensures that head->pgmap is valid.

3) Then check the page type directly:

     if ((flags & FOLL_LONGTERM) && is_zone_device_page(head))

   This tells us we can access the ZONE_DEVICE struct in the union

4) Ask what the pgmap owner wants to do:

    if (head->pgmap->deny_foll_longterm)
          return FAIL

Cost is only paied if FOLL_LONGTERM is given

Thanks,
Jason
