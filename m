Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E75F04B8794
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 13:26:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF91B10E65F;
	Wed, 16 Feb 2022 12:26:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2063.outbound.protection.outlook.com [40.107.92.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9086E10E665;
 Wed, 16 Feb 2022 12:26:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P+9VgUFvXm2mnVteB7n1ntE3TnHwXxX0RVUrYuly1MtCVHHt0EO3f1GNfOa60U/Gj/XzxQVv50ceGZI4SlW667yqGMI5yCQ9pMbd5Halnm63sjlxHLdeItf+NgZt+q9UhnYfy0Xk/+s6SQ2IzwBINN7kfpLK6mNjLnwQo5dDHBOzOxUTcNFxUOcjyujJeH+2XFHG3e0h/U0GX6kGghm9WanDW0d+G+R0xvmJ1pSBUSCmukql7mWLGxcW4l+FLKC+LKvLCZzvcb4XKl6Za9y6xZ6+vjvAAczln5sBEcl+x5eQaCwnMEiIyeTdrgNqJNsfY2mKdswJI8It+pRvVf5Ahg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1VNnEIEqpGMfZKfartzhzwNdkSYE0sB+gvPp1wOi3h8=;
 b=enQbuLM9e5k9dPOflrRl9WDJCMY7hJp4qRuxJtUOAYYlh4AwOdVwNaT7ewnuAtbN+E1lhjrgY00WJ12J5Dqb+pNq5+U3PF168ezKaJnjs6WoBs38kjIgNIi/FBeDpAd7Q62HP5OggpZQA6G49yb84PIP8d9gTuyiU9rJJLCGNGr0fB8+QVAZj2n9cyERfo4tU2QlZxa1lJKnQEJ37qFIhARK65roWosE1FKaFkgLcKvgqx+D7OS8iI3AuExNKgDxFbtDrQesnFhl24/HIJkcuE7PBrmXJG4g7ioiAsJI9zB5c2UQw3AbHoigKcRePc2+HBBiaSxR6Xgueim39M/LiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1VNnEIEqpGMfZKfartzhzwNdkSYE0sB+gvPp1wOi3h8=;
 b=YathxqVL8yV/fHaYs/559tnYgvkxgCXtsmJLl5DTEl8JZWO+LWWBCOGu3AKeMgR3jYvdIvb7gcLnUizPaRb82nt+fs77WorkYL2LpO83C/caeZLoaM5sHEj3qKRIkR7zY3fAQODIn414OnM3kc838reQwCrd+VgGikv/bU30hn9IkazMzRFgxyUcUacyBthG+GkLx9Suijbsqw5so1O7BjSfKsWXc1uq7i5ZVN5qLURklYq0mMXEVwfXeqmZ2csNx0WKWU91nDH1EuVcGniyxJNvI23/4f/tEMsVXWREC7sbWGEp3oQ+xSd9eIJ+njyEqmotPSuB+4Oxc2OLF8IyGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by BY5PR12MB4999.namprd12.prod.outlook.com (2603:10b6:a03:1da::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Wed, 16 Feb
 2022 12:26:01 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::e8f4:9793:da37:1bd3]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::e8f4:9793:da37:1bd3%5]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 12:26:01 +0000
Date: Wed, 16 Feb 2022 08:26:00 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v6 01/10] mm: add zone device coherent type memory support
Message-ID: <20220216122600.GG4160@nvidia.com>
References: <beb38138-2266-1ff8-cc82-8fe914bed862@redhat.com>
 <877d9vd10u.fsf@nvdebian.thelocal>
 <20220216020357.GD4160@nvidia.com> <6156515.kVgMqSaHHm@nvdebian>
 <98d8bbc5-ffc2-8966-fdc1-a844874e7ae8@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98d8bbc5-ffc2-8966-fdc1-a844874e7ae8@redhat.com>
X-ClientProxiedBy: BL1PR13CA0139.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::24) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a28a825f-d610-4c42-3d29-08d9f1477e52
X-MS-TrafficTypeDiagnostic: BY5PR12MB4999:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB4999B3182A123DCEAA98E330C2359@BY5PR12MB4999.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v0W6zOSlEZri/6xpqtNaXg+igjtGWEmqOGYb1/jwILLDzvIUPdX1JJyFehR2uNAddh1iICK7GtBPXBs8iIj3ykTCAVKhg6vk2YtlH70jd0H4GSavDls0JDQ+3yQiTlOeWbQgaVnpBcLH3qrGP8D2NIIpttzS1et63LUGQEdDPtcSWB1yZlxR7ZpZmw3WmAlOnow9OPjsDEB7FoMKBVQYCULxxHvVdNothVYa6K/JM8d1W4M6c7wEwIkH3SVxVUm+KZ7vcEVq9GrtynjHs1hYJ0y5Y4WFEc+mVcPXAAgV/y9Ay8JGSr2ZpKla6V3e4udBrzMYQn5zcb6hFHSY4tXQaefDXdjgna60VhmMB0nKCxb2R5+1MBY4kv0oR3Q9bU49h+g+sZ3n4CpoEFg1F+JWx4dCq+kJIFj0td+2eVdRE10SE4WzXUG8QGcLRKDxPEvip/uZyWpsBQy4FBMFLR5tNWyQ+j094sOsvY6MVUDnqeNvfva3eV4Lr6fDF76bsIVudlDn0z7MrIFI0RZ5GCxWqob6+lGQQvIwlhGjxN/IVBFlcD29qSaEMKxolUVl8zZDbLwv6sb3XRXbIPEsGuN5oVwrBHABmw4byQqTKJxWEHKAjlPqs33J8ysJyOvv292g8j8E65slJKoHigOlC9X2qQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2616005)(26005)(2906002)(33656002)(7416002)(1076003)(5660300002)(186003)(38100700002)(36756003)(83380400001)(316002)(53546011)(8676002)(66476007)(66556008)(66946007)(4326008)(8936002)(6506007)(86362001)(508600001)(6486002)(54906003)(6916009)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9wAkmSlpUxgyqXI1fJbtzBoO4SEsd1Vjy3h3sLlspZ/wwORJ7cg5UIHE7ufe?=
 =?us-ascii?Q?69n1GKqTtqS6C2azHKbwzZSUlOx8zSIs6XegglhAFEkADhM5BB1a2iw2QJJ4?=
 =?us-ascii?Q?gTCsUepgcKH30m4++lXx96/4OpkSesxZR36UhvuQd28yST6/fPBtwveVGoXw?=
 =?us-ascii?Q?DFsR1dC2JzPqh52hHywoiL/iCa1Zdke/poJo6TkGH5+2rLQgGyiPq8tGvyMv?=
 =?us-ascii?Q?i9C/qJxArsUNarb/5VO1KO6KXyqRKY3YhJoOYqUccZauVJQJjJyZxWsVfR1p?=
 =?us-ascii?Q?NXCKKm8+xeEgjmVa/ISZBQYwfKWACcHXHy/BDRomHBQkJ/jkXuQwhR0HS4fS?=
 =?us-ascii?Q?qxrbPFuODrxwkTOf8HpcD0wdg9WtL4pD5SQ1276ob+gikzS38dTrnXVLcpuh?=
 =?us-ascii?Q?hQxLWISgL5ToNxN1reP/33xbQ2TzPO6U5R8yZMBHEDs4phnPa9oMJvBmnzOu?=
 =?us-ascii?Q?IIYhEyTBYRUquuajQ+DiBm7AHCGa3Y7V7nb+ReaLTIyqKqyE6YvD1hP2Zqt5?=
 =?us-ascii?Q?gUFZIXLZ3GIgvUSAvXcCc9u8X6V8NJX8+dHlHwouoVjt/h7rs0x+jgqXHphk?=
 =?us-ascii?Q?DwyhnGowm+v0J6MHJgtAKwd6Xzycn9jk8cX99zWSTG2H7di3+CPwIaEJOZut?=
 =?us-ascii?Q?/FFCsJ6bD192taQaD6ZNjGkNUuKl0rguKU6jNKd43Kp4fDloHA4gG4xiNo3E?=
 =?us-ascii?Q?U9/VkBMj+W6msF5eKWQ/YVfLZCTDjA5cNkZbcUH/hOAqPfVIzHAoIYTIIrms?=
 =?us-ascii?Q?GRYcDplL72XUuxZukIJq90dtUhHpkaTQQEI9j6ZVjS2lJ1fDZNjQSHsWOMO3?=
 =?us-ascii?Q?LnqcOTYlV17YeCQgwmz++jycynnS9D/Zrr5H69rqmzrkiMYk79PTqYC83Zb0?=
 =?us-ascii?Q?pIjnv1lEJdsq1HJ/zisEjFO/mnFtsTrYREfcs0SgqIDUyGu+hQ5b5vNbHmJm?=
 =?us-ascii?Q?WUAGvf/suMLl2BqqenV8apT/JIhLqlRdMHFsmbKHmP86kZC+RBOcUizhnkSS?=
 =?us-ascii?Q?/LvvKZV6UbT7ZMp7NmzAQYcq9OcytGffPeBZhE0pBdnqc+/is5P/PU/2QsDj?=
 =?us-ascii?Q?eeOIgczg0UQQ4AkkBvYBdlYLQhGdX0AlaXAxQGRlE7oofAUq4gn5M1GopeZk?=
 =?us-ascii?Q?0s8g2v91GOAEkgJ6o4RNVof1yoN5W6M1+5TSZTIyENrhXMbkaZYo8CmA1b7N?=
 =?us-ascii?Q?6W8Rnr+1fith9PUYFdoIFea96LpIv4igrNcLv+/W/OCKOvQti6A2u1lovrSx?=
 =?us-ascii?Q?GPLjmgh/rjq+7tSBQ7gMjmqOvZPrTYCs6aLCx+AWacysY/TbyF+ju+vkMUs3?=
 =?us-ascii?Q?tnCVv73T/EzKb05VV/3Fdhzlj8uODBpMjEJz1sgFMAf4F+5kn92rXC+G2dms?=
 =?us-ascii?Q?1jw1UXxG8tazPYF7KZTgNPi9nQxyTCpdAOYRwfD4Cracm+PCa9CH2Ne983wC?=
 =?us-ascii?Q?eaPEkzQntE8ynYV6vDoIUZRX3NY/iI51LpQjcU/MVYlMm0B/pLe9HRXZoxGS?=
 =?us-ascii?Q?fc18Hs79nCOziqlrO913gJcGmMYt+C0zR43bkFQeMF+69ScqX/7o5MiqnfLV?=
 =?us-ascii?Q?evQ2a37VJz/oe3q+vBs=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a28a825f-d610-4c42-3d29-08d9f1477e52
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 12:26:01.5488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bSwZv7JQNTYdaBkloha6pKk3Kyh6I3ATKUg+/LEEE8KhQHTGzfqoXesuMo7CyT2t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4999
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
 willy@infradead.org, Felix Kuehling <felix.kuehling@amd.com>,
 Alistair Popple <apopple@nvidia.com>, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 16, 2022 at 09:31:03AM +0100, David Hildenbrand wrote:
> On 16.02.22 03:36, Alistair Popple wrote:
> > On Wednesday, 16 February 2022 1:03:57 PM AEDT Jason Gunthorpe wrote:
> >> On Wed, Feb 16, 2022 at 12:23:44PM +1100, Alistair Popple wrote:
> >>
> >>> Device private and device coherent pages are not marked with pte_devmap and they
> >>> are backed by a struct page. The only way of inserting them is via migrate_vma.
> >>> The refcount is decremented in zap_pte_range() on munmap() with special handling
> >>> for device private pages. Looking at it again though I wonder if there is any
> >>> special treatment required in zap_pte_range() for device coherent pages given
> >>> they count as present pages.
> >>
> >> This is what I guessed, but we shouldn't be able to just drop
> >> pte_devmap on these pages without any other work?? Granted it does
> >> very little already..
> > 
> > Yes, I agree we need to check this more closely. For device private pages
> > not having pte_devmap is fine, because they are non-present swap entries so
> > they always get special handling in the swap entry paths but the same isn't
> > true for coherent device pages.
> 
> I'm curious, how does the refcount of a PageAnon() DEVICE_COHERENT page
> look like when mapped? I'd assume it's also (currently) still offset by
> one, meaning, if it's mapped into a single page table it's always at
> least 2.

Christoph fixed this offset by one and updated the DEVICE_COHERENT
patchset, I hope we will see that version merged.

> >> I thought at least gup_fast needed to be touched or did this get
> >> handled by scanning the page list after the fact?
> > 
> > Right, for gup I think the only special handling required is to prevent
> > pinning. I had assumed that check_and_migrate_movable_pages() would still get
> > called for gup_fast but unless I've missed something I don't think it does.
> > That means gup_fast could still pin movable and coherent pages. Technically
> > that is ok for coherent pages, but it's undesirable.
> 
> We really should have the same pinning rules for GUP vs. GUP-fast.
> is_pinnable_page() should be the right place for such checks (similarly
> as indicated in my reply to the migration series).

Yes, I think this is a bug too.

The other place that needs careful audit is all the callers using
vm_normal_page() - they must all be able to accept a ZONE_DEVICE page
if we don't set pte_devmap.

Jason 
