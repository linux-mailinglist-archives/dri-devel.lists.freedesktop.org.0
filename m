Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 267DC4B7CFE
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 02:59:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0422210E5EF;
	Wed, 16 Feb 2022 01:59:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2052.outbound.protection.outlook.com [40.107.220.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFBBF10E5F0;
 Wed, 16 Feb 2022 01:59:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fkIZGrSkFaOVcGLEXMnGRd5ESqiRN2Ad//CrRKcCbVr6Ko/KU2Zfb2EPT6QNJLUyGKNf1bxRi6RHbBBKmKv8uv8hA2mIfbs1maQmDNQm5fXpBR8V4w/5oa3fTfbgyfRbGj0rZ/9k5XK+0UGCNAR/kS2cG1y4e5GhB63LYN/56J4E5gXEo1VBF3EXV5Z15JnGYrcnrSvkOo6nqGZFA0X7wkb5jDG/+k90ZoFYPgecRFjspsA9fjBGPROuKQNcVyd4Wi3ZWHPQI+C/xUFg7Mmsx1MxWRDbKy8MY2fM5SBXKRalzIbfSm8XkB/N6O5Q/VQrYNQSbnipmcirvNWuVz8cng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wiAGY9J6hBs55TYV19qkBE/0yt4FsMmKVbVzXfnMrss=;
 b=dnCIzqJGgLZeeTgV9PArIjk6xG69HbJcIV6EKxobzxZUzZ/se8D6bcZYZIh2gpEVKQNXOZTxolDevYNnbw5V6oWAXqP7AVFQ7qX5ijEHGNe3Ub1ehagbYViDR6b+d6KCHyKMiyG/JbqYz5bMuqKr0DrDb5IfYqYe4ObjnjV4qPhVdgJyMB3IPbX4/UoCDR/k9+wCWAhm5kzqZXr1epDxFMkl0A2n1aZ8qQvp3PKgXsAFXHbL8Rmc5Cvlf4MP6HqXcoAzLwZEUY/vXo1GY4YuA060ZlnWs9/pCh3aHopsWx9xaxuhM6Zd8ANlT20LnhTEK9VYUvxHlgtrWGzi/8/prg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wiAGY9J6hBs55TYV19qkBE/0yt4FsMmKVbVzXfnMrss=;
 b=Mec/DCmqSuNhXEkq3RCtWTKqRDesT8RhgMnBpAOMSlV242QBNGhvKwEPfwJTW1oDS1k7TQQEM3nFJCAwjJt6p2eEVDGXEFvj3ZnlpK91oII1+K9G6aEVuq9f9DLuDc0ewzxsZ5NHXJGVcbTIQ1Si9LYzj9pdnd1bEFSzZVJuHZW7buYtSHqXpjItIhDDdBm/DP1kAP9iPm8iwn/2/OZnXmYOdSz4WZ0S5gFxtso6A5glEMU/VLnvf0ZZ6meTcwhjLC82reS03iM1uiWdJaOYPAyQQe9An2x2ny+GySBWWbjKOiZUbJ3MRcJoCzt9cb/9Jezo8plWCK30OJUsA0D/6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by BN8PR12MB3268.namprd12.prod.outlook.com (2603:10b6:408:6c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Wed, 16 Feb
 2022 01:59:48 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::1528:82a2:aa0:7aa6]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::1528:82a2:aa0:7aa6%6]) with mapi id 15.20.4975.019; Wed, 16 Feb 2022
 01:59:48 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v6 01/10] mm: add zone device coherent type memory support
Date: Wed, 16 Feb 2022 12:23:44 +1100
References: <20220201154901.7921-1-alex.sierra@amd.com>
 <20220201154901.7921-2-alex.sierra@amd.com>
 <beb38138-2266-1ff8-cc82-8fe914bed862@redhat.com>
 <f2af73c1-396b-168f-7f86-eb10b3b68a26@redhat.com>
 <a24d82d9-daf9-fa1a-8b9d-5db7fe10655e@amd.com>
 <078dd84e-ebbc-5c89-0407-f5ecc2ca3ebf@redhat.com>
 <20220215144524.GR4160@nvidia.com> <20220215183209.GA24409@lst.de>
 <20220215194107.GZ4160@nvidia.com>
 <ac3d5157-9251-f9fb-a973-f268ce58b4e0@amd.com>
 <20220215214749.GA4160@nvidia.com>
User-agent: mu4e 1.6.9; emacs 27.1
In-reply-to: <20220215214749.GA4160@nvidia.com>
Message-ID: <877d9vd10u.fsf@nvdebian.thelocal>
Content-Type: multipart/mixed; boundary="=-=-="
X-ClientProxiedBy: BY5PR16CA0018.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::31) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b735cc9-17a6-47ae-d826-08d9f0f002d1
X-MS-TrafficTypeDiagnostic: BN8PR12MB3268:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB326852FAF362E0BCBE956F44DF359@BN8PR12MB3268.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BFKxd24A2JCt37A5qzPVV1NO7NN1zkP/UNGC0PdSnzb5UYFe9o5TyFAZOt295RWycjN1DAyTC2okWsTBT8SHjnRRGufNPlIc+4CM9zcKQgViUH71yK42GoO3OZqS7Zx9U8NiFXO8ElpfiEFUtMZJ3lwnmI0e7oHSsr3ddnPJIJikvIYZJ7/oBlEm/vx9HocoAG7sYqdIvJEFpFbtFj5cGijJHmpYtC0iLY2kXO8+aZHQEObqvQy7AkxriNCynB17BBudDS5jBdArvQ3Yj/V92v1NubjE0B60D+osnIW6H16GqlOj7N+5NQTFtSK6DA1Ml473iCmq14nD1oVgLyQntgwBWVlDFswIxgQ61uvBGItvsCNI05xapKhaoO+V33yb2g/ld1GDyC5WoBYjGXPAaCcTJs+wtDRT7Q1NmGGBRK+XYr3RaaazG7IF2MXfUnrvI7XJK6Ta8eRaITB8n2aewjmT7jSv2WYbev3FRuFw9Vuj30RWL2lWMR8eXP2a91M1gH/EOgEGzIyX2fex1TpvWV27jEZKt7C5cdF7ws47IvF8O6p7UJmSf/89IxirYZTfMgZZ4Y7fbj9BmGx56UaK1MDYaAMb7Wtv3KqSsKPQohhEOdtkdeoi5Eij89gHWsCx4opLU/9WC00O1+r+XrHRbw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(6862004)(6636002)(66476007)(66556008)(26005)(4326008)(186003)(316002)(7416002)(38100700002)(54906003)(6486002)(66946007)(8676002)(2906002)(6512007)(8936002)(86362001)(6506007)(6666004)(53546011)(44144004)(5660300002)(9686003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aufCifvl2+1r8IBD8fm9vthpTUWN3JCDT20Cc/U1pdmwDSnNpe4r25Jzfl2G?=
 =?us-ascii?Q?Gw7U7tPRDDNWbvCEbg71wTbufG3OdONTWkYMcS2xlca6IjTIkxPoxtHpmKja?=
 =?us-ascii?Q?l3n2qPfSF6R0hBgfWL4aNEHY5Juos0JkuT34T79jTatHTgwjVLBvwiN+wgMH?=
 =?us-ascii?Q?HOJPuT+n8tNJHk9zfD+PThjAflGw3163Xv6bNOCRZNiJB/zPYk0DQzINoQX6?=
 =?us-ascii?Q?Daf+C+EbSGQsgvxyfy2uQV2uGz0D6dBYOM0X2RM1QXlT2pqGfxXxbTIjk3ZT?=
 =?us-ascii?Q?q7yeUGgBTaFu3UVKLAK/pCPTmX4eUl6p6lfsGlzRY03+wxmk7s/0VXoeqA82?=
 =?us-ascii?Q?CCJaIdJlFy6t2Z7La1lRIOnlbbH+hAB0KM+UBeS0Nvrj15+c1F7p0pn04Lzd?=
 =?us-ascii?Q?brhFC+yTSMrLmbYLoShZaQHAkPEJurA2Ujvx1W4B+TLCY62DBTwIfWjatrJ+?=
 =?us-ascii?Q?V6EUkVwZQJYL4UmE/IekNtnPrXafXsgjo5q5Gm9E1bVxqzk7oYyql1atRcIQ?=
 =?us-ascii?Q?GEFVmC4dgRSIwzmd3e2oR8L4GAVB/+3lLh6rQlelPgnMAsYgMA0PHjdQUvXg?=
 =?us-ascii?Q?U2uCot1xWvUOKC/inu2FAQjS+tdCczXPLSmGNb68PYdXaS26g+iN/2x6niwC?=
 =?us-ascii?Q?AciCBXQ5HEtgm955PZ+QYFKyOUgodyZS8FM1qBLNnpnyCmhJSJ91h8MEMcwC?=
 =?us-ascii?Q?Zn3WilXdnTUMKvilGQJ54mkfShdPNw2F3UoIlNmTWk6nk5wHewaN9ofn1o1Y?=
 =?us-ascii?Q?2pg1DaTIEIXVWN9AqOBXfnCGxjDbHUD0BIQQqmg/20i/gJhmPEagcTo71kSH?=
 =?us-ascii?Q?4yw32yvs5iFxN0rm/X/NgcvregdIluOkvMbT2OT+7lM7sFg9KBG0tsRH2FQJ?=
 =?us-ascii?Q?oqMg+9ePZ/0W8mA1ExzDgErYTRW5yjdDs91N/+bid2W067/+YFij+qnTDVI3?=
 =?us-ascii?Q?UyptFz48Byzz8aQG08/LJXFHiWI/Xpd9AwX0HJd2mUR4+DsS28JItFO6X+TY?=
 =?us-ascii?Q?k3F7yJqem0A5aiVl0jFtpoXh1iOxddqu1yC6pQ5xZH+76xxwyiaMMyxc8e+w?=
 =?us-ascii?Q?rIitmjfJTDy2vRpS4mUsu/fBguZcsdeF5r2YiLQgSvjftXmUc8SzjxxdwIGI?=
 =?us-ascii?Q?PGUuAEgpmwYvOgLEiW3i28LDi5Aq1dCYsV6Y94SV7TziSph37TzQShO8D1ZR?=
 =?us-ascii?Q?0Eb2HB1qSyTayhoK91rem+uWWvCd7bqVn9ufoMiytr1IVpp/vWOH4GMSza0j?=
 =?us-ascii?Q?iCxMbvEtL+ndWQoKTIB00+kDp1mHxjfhKF/liApheW+o/4tHbBai5Pa7alN2?=
 =?us-ascii?Q?iKDrcYl9VQZqkyLPCy4xOjS6lS2Ira8C3FKos3F6UtXKU0pQPgZce62t1D6/?=
 =?us-ascii?Q?0WarzuJiLeZmLEkBTZLRaaAu2uaaZVyeNxL6d+POjAUmyY0BontaXB7LavEE?=
 =?us-ascii?Q?b3XM58ecDtpaWVEx09fUNrdVjx5hpUvWTY33xyqAXGvDgEawtC3jRxMPKR9f?=
 =?us-ascii?Q?E+iPU9fG8z+VEe0EbzrYU2iKmTryrKPkzqq26nN9IBI/5gkX3PBl7mTynKbo?=
 =?us-ascii?Q?QPOfm1NNwBJcq7o4CVj5wDW93wazj3hecZgNtxD9olwKweYICwEyNvekVgv+?=
 =?us-ascii?Q?RxxqEbE7AdPioTqKTVmFYnc=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b735cc9-17a6-47ae-d826-08d9f0f002d1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 01:59:48.1947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XPGkitRuRn1JGng18z90KblluL4BsROevpxI8jcs+OQMjwFRkfIwIYJy1M8R2Ng50h2C7WS/KUJMHrCqZMSr4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3268
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
Cc: Alex Sierra <alex.sierra@amd.com>, rcampbell@nvidia.com,
 willy@infradead.org, David Hildenbrand <david@redhat.com>,
 Felix Kuehling <felix.kuehling@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--=-=-=
Content-Type: text/plain
Content-Disposition: inline

Jason Gunthorpe <jgg@nvidia.com> writes:

> On Tue, Feb 15, 2022 at 04:35:56PM -0500, Felix Kuehling wrote:
>>
>> On 2022-02-15 14:41, Jason Gunthorpe wrote:
>> > On Tue, Feb 15, 2022 at 07:32:09PM +0100, Christoph Hellwig wrote:
>> > > On Tue, Feb 15, 2022 at 10:45:24AM -0400, Jason Gunthorpe wrote:
>> > > > > Do you know if DEVICE_GENERIC pages would end up as PageAnon()? My
>> > > > > assumption was that they would be part of a special mapping.
>> > > > We need to stop using the special PTEs and VMAs for things that have a
>> > > > struct page. This is a mistake DAX created that must be undone.
>> > > Yes, we'll get to it.  Maybe we can do it for the non-DAX devmap
>> > > ptes first given that DAX is more complicated.
>> > Probably, I think we can check the page->pgmap type to tell the
>> > difference.
>> >
>> > I'm not sure how the DEVICE_GENERIC can work without this, as DAX was
>> > made safe by using the unmap_mapping_range(), which won't work
>> > here. Is there some other trick being used to keep track of references
>> > inside the AMD driver?
>>
>> Not sure I'm following all the discussion about VMAs and DAX. So I may be
>> answering the wrong question: We treat each ZONE_DEVICE page as a reference
>> to the BO (buffer object) that backs the page. We increment the BO refcount
>> for each page we migrate into it. In the dev_pagemap_ops.page_free callback
>> we drop that reference. Once all pages backed by a BO are freed, the BO
>> refcount reaches 0 [*] and we can free the BO allocation.
>
> Userspace does
>  1) mmap(MAP_PRIVATE) to allocate anon memory
>  2) something to trigger migration to install a ZONE_DEVICE page
>  3) munmap()
>
> Who decrements the refcout on the munmap?
>
> When a ZONE_DEVICE page is installed in the PTE is supposed to be
> marked as pte_devmap and that disables all the normal page refcounting
> during munmap().

Device private and device coherent pages are not marked with pte_devmap and they
are backed by a struct page. The only way of inserting them is via migrate_vma.
The refcount is decremented in zap_pte_range() on munmap() with special handling
for device private pages. Looking at it again though I wonder if there is any
special treatment required in zap_pte_range() for device coherent pages given
they count as present pages.

> fsdax makes this work by working the refcounts backwards, the page is
> refcounted while it exists in the driver, when the driver decides to
> remove it then unmap_mapping_range() is called to purge it from all
> PTEs and then refcount is decrd. munmap/fork/etc don't change the
> refcount.

The equivalent here is for drivers to use migrate_vma to migrate the pages back
from device memory to CPU memory. In this case the refcounting is (mostly)
handled by migration code which decrements the refcount on the original source
device page during the migration.

- Alistair

> Jason

--=-=-=--
