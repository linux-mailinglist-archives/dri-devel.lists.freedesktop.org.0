Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A5B42DFEE
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 19:06:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A4486E1B4;
	Thu, 14 Oct 2021 17:06:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2044.outbound.protection.outlook.com [40.107.220.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AD466E1B4;
 Thu, 14 Oct 2021 17:06:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oa+GBbwMF3YZT1ZvR43nB0m3AphHYF6FG0I7/jFNX2aZKWcbcb/gQ65LVAMzrH5rSeovCAnj58xeFO9g6EtPv5GIbi1d/BskfjALUt6kuGrHew9Dn7MDnS62xqmOq9tqJ+lrVER9Fn/5ln5oBmd/e/ssjDNut9ySIei7zf4Q7rugTMG3QVLAKDRdIEsxLOX6x6lC2t86z+vFLW/IVV1+BicGde+NLeensS7ARKdceBZMF7JOA2ta3eWgcJMfY5mitkPT8AjWP4p60VFSolzeDEbGrlo66BA8Juz9DV8U8FVlcVQSfKdDsZV9ssi84X5zZRZs1loxwymnUU16oP8TDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s1rFXrxB+epYZ/KH+r27A/8S6iW7EtjjrbKRH3annzE=;
 b=fo9a1a45JXu2BG6ZpFqSxxIpqo7rzMGJG88zkTHsnUwCpKkUDVeCAyTzhCSNJxJi20/brlF93v/iR+X0CftsqT5xWdzTKDY8dQUYEm8jqFi3CvPJVlslwEP7IhmFQXnlk4dTpuGdWj7gY9Hm1doADBGOZleFDQZqxhtGlq74JkU+M68h6Fmh69nGwAMv4AntT0cfWj/sOjD2CX9wCh38ckbEPG9RVssbm/R9DZ4lOWjZN41JOccErPjXFLqzFVj6cpE3CeV4tq3Tp86pALsGBtrbteW/Kpufm1KA1mVxrPRyuZD3+fuhWszTRfjhRGG0gguYzvR0S+tc7TMBdshUmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s1rFXrxB+epYZ/KH+r27A/8S6iW7EtjjrbKRH3annzE=;
 b=lFHPx8VUyaIh3eTy/czwGBxS/HEsYuYzqHTeAxjuntim9E43wd5mXgKJWZYvTaOzamfvpBc+L1xxNzfAN/Omll13nBSSic17+4YDQplaM3YHgLC8MaebQdNkhLcZP8vP5qIdzjIztYo4bw5YCrrLVLgEIU6XI5PCGX7foN7vtdnCvFCQtGXsdNZ/3eut1ssP+W+RqCXKnEBcE2WP09AsI4VUPEtA7TmWIuGMZAF8GNhuk4XHZRxuLAKbAY7OMbQTC9Xsgvknql/Rl2n9FMR2Hvbxij4ph1sMzuQXGFzHpzDRS5GoGJcVodihGewaeeYtwVx/JiflnqqSEM5MVyoShg==
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5142.namprd12.prod.outlook.com (2603:10b6:208:312::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Thu, 14 Oct
 2021 17:06:36 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%6]) with mapi id 15.20.4608.017; Thu, 14 Oct 2021
 17:06:36 +0000
Date: Thu, 14 Oct 2021 14:06:34 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Sierra <alex.sierra@amd.com>
Cc: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, hch@lst.de, jglisse@redhat.com,
 apopple@nvidia.com, willy@infradead.org
Subject: Re: [PATCH v1 2/2] mm: remove extra ZONE_DEVICE struct page refcount
Message-ID: <20211014170634.GV2744544@nvidia.com>
References: <20211014153928.16805-1-alex.sierra@amd.com>
 <20211014153928.16805-3-alex.sierra@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211014153928.16805-3-alex.sierra@amd.com>
X-ClientProxiedBy: BL1PR13CA0125.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::10) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL1PR13CA0125.namprd13.prod.outlook.com (2603:10b6:208:2bb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.9 via Frontend
 Transport; Thu, 14 Oct 2021 17:06:35 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mb4Be-00EzE9-Hk; Thu, 14 Oct 2021 14:06:34 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1dbd519-48a6-474c-19de-08d98f34facf
X-MS-TrafficTypeDiagnostic: BL1PR12MB5142:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5142ED13AA4DEEAEA0B57BEDC2B89@BL1PR12MB5142.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vMDGvKMFxbZAdA44gNyp4J5vog7a9SHspy2Vi1D7GgFhwZDjjOaTD9mhNVVutCMIcDfCEKqAiOwTQJSs2DXy5qP935PMv/4px9R0md2MPoYclpJp4M3Mkko4K4rz25lgzrcJTZduL8bPxHLZb/MffuObUAGj3+evdYJdjwlu0nBIiVkWhRriS0t1o52Mo5KRcUKhqtsc/jXBUzgibo8B1np0DgdluzEXiOzc4dY6Kle6g7wStIw+8Vw84NS17ZkNg9WGsm+bDIZeUbNpfEjrQLMTdU140CTrpRtajSFFxXoxkGtj/SwCIjHAO64w9bR390SD2uUG1cHVONjcoB3J8dvreaZ9WPkXtwMcDoWUELl+C2s+82QWD/DYI3UiJKWw/QhkLzsinE58YluwxCS9M38mWbJVyEhnacT3XZsqUaOpQ7dAWz2No2Ew80DtTQTyf2pCSSWzn2lEo/XAjjiB3RZnw0PRutUUAJSSs8J6jg2p+cVbz1EmDLo8SoKq0ykOmezcN7VFvTUGonL6CPzAUk3yH750jZx97zHaV6TpVDGKvLLKkAhZfz8lY1fNKHXChjx6MfE87SfuQrAui6T2IhZEZv5mAaSIJP6uApFsJYxWACtTgsxi8PzEFXNahS7txcZjdBOPhVZCn6PSJSpX18amsKh22o78Qo8KU8Zkiz/rwpaNQYI/+XkwvXpglmU5wf8h3DOoh+Cjtq9dIJ0SyVi/VCXC6Bz3bHQ07nUnMm/uYudRmpFqIN/LvxPCpWZU//TSxUny1K/xoTHrj/txyA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(66946007)(316002)(66556008)(186003)(38100700002)(508600001)(26005)(83380400001)(5660300002)(8936002)(66476007)(4326008)(1076003)(2616005)(86362001)(6916009)(8676002)(36756003)(426003)(7416002)(33656002)(966005)(9786002)(9746002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0GT9uMNkCgm2BQ97o8kEJ2VDmJI+sIIAAgzWhgSkbQDJ+GIQ0FaOyT0+UMmu?=
 =?us-ascii?Q?EuERtEG5lKM9y/EA/saS3Fuf9fj7XI/+4UCaot79XuU0l1aPNBXYrHe1d4Be?=
 =?us-ascii?Q?C7JmmQf+PeyjLdgsRpYLog/BkUz4Ze24EZxrvxia2xvsc14KFH4XoFyqpobG?=
 =?us-ascii?Q?pQJrqehqj0sUTx9Hhmrp5fz5r7BHqfw5ptQyW69GCYPXJ8XRYZNscO4GUFBU?=
 =?us-ascii?Q?EEk5jA6/x6UrftlGJ49CDGTu4U4d0jorKO9MFL9FufQODfChBaNTCfmTzlVX?=
 =?us-ascii?Q?sQjLrRo0R+n87R5LMpuMnm6NQiVpfeK/Moubm/m3ZUplqL45bzqHfnbc6uvs?=
 =?us-ascii?Q?eS//EMuRjoeN0T9K/x31zkLr1ugWWHPDJ7jIeXD7/3G2NdxQ9zgbMdn/Fkrr?=
 =?us-ascii?Q?t57FRNMbxnSAE3p/TCN8l40bF1c2fEFVLjMW+KmIOqNTfxVxvQFs1F7OyHxd?=
 =?us-ascii?Q?C7gsuZtb8b2CjfxqNHUwKMDCdgffXrLaWkUURwUE1eo7TzH+0f3IR52m0yFi?=
 =?us-ascii?Q?+ZqosW6CYcCOb1dx7YgWsBAT7wMPUgSm8Gt0H5HcwcOExWJYI/5ibVyvoGg3?=
 =?us-ascii?Q?iGQwIlHUrb7UH7l9tHHEsj9wRn3Ax9Jo6zVAoCPb8OWF9ArhA71NCSt19fNr?=
 =?us-ascii?Q?qtmP8uqOO2IeRnsKFKO+4d6Lj2H4yDYoimH/4Log0aBDhlVYrhvXHtvsz9xI?=
 =?us-ascii?Q?6jK1B+v3kbNRgCNv5T6pgX02Wc308dDiep169tjascGDzRqbesbNwpqwhWo3?=
 =?us-ascii?Q?NsQqOFvsl5XQSssPiX3W+Pd3/Al+3BXyNuReB/8tmWJGgaz3hoiVZah8z+lw?=
 =?us-ascii?Q?eN1zFcbgwNfu0BZbn4XXmgC4GzGcTBJH7WAKEZZGSpkMmTCO1WK99HJagCnt?=
 =?us-ascii?Q?z/tU5mv3ndFY+0gPE37uxv/HTdNY8mYMpL7EeNxhQ+jxGlS6CqdMe3D1fTTC?=
 =?us-ascii?Q?TmLgvdwle+GWKk+I61VE3UrnJuccp9CqfvpFi4gYF8jxQU7nRGW9zwNOEcTb?=
 =?us-ascii?Q?zFx3ck/Iyp2KFgpO1Jb0ntwmCEeoc6ahRbcPdyfG3PNpk68oq3DflwJFFCa5?=
 =?us-ascii?Q?saAxS9BJI9Ts86uJZ3ESBiYvnSdKqr4SX3zahEQX3gtoDFqdXSQfQpeaUO5M?=
 =?us-ascii?Q?BAJK+qWgIMbitZ1ocq4elvoj5udSe/86/AwjDz8OB1WjXmhSt/+3UtYzSaKy?=
 =?us-ascii?Q?UpG3i2cyXpFtwY4v8EDhQVNOU9O6vh6+Eqp+fZ4cGjS7bwOxna5LW0/61Gdm?=
 =?us-ascii?Q?0oJEsvnxLdeAoNVb2aJSuj6ToCghfYJi3toJxruj25NLP2kMWyV3YU87XHeH?=
 =?us-ascii?Q?OWPLc9DqpxaasmoIqud9l7ms?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1dbd519-48a6-474c-19de-08d98f34facf
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 17:06:36.0634 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KoAZX63yIQHlEcekjS6wt3SUuJ4LaGHrIzM5iDD4uB2EUqvXx07C6FhyAFM66fVN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5142
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

On Thu, Oct 14, 2021 at 10:39:28AM -0500, Alex Sierra wrote:
> From: Ralph Campbell <rcampbell@nvidia.com>
> 
> ZONE_DEVICE struct pages have an extra reference count that complicates the
> code for put_page() and several places in the kernel that need to check the
> reference count to see that a page is not being used (gup, compaction,
> migration, etc.). Clean up the code so the reference count doesn't need to
> be treated specially for ZONE_DEVICE.
> 
> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> ---
> v2:
> AS: merged this patch in linux 5.11 version
> 
> v5:
> AS: add condition at try_grab_page to check for the zone device type, while
> page ref counter is checked less/equal to zero. In case of device zone, pages
> ref counter are initialized to zero.
> 
> v7:
> AS: fix condition at try_grab_page added at v5, is invalid. It supposed
> to fix xfstests/generic/413 test, however, there's a known issue on
> this test where DAX mapped area DIO to non-DAX expect to fail.
> https://patchwork.kernel.org/project/fstests/patch/1489463960-3579-1-git-send-email-xzhou@redhat.com
> This condition was removed after rebase over patch series
> https://lore.kernel.org/r/20210813044133.1536842-4-jhubbard@nvidia.com
> ---
>  arch/powerpc/kvm/book3s_hv_uvmem.c     |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_dmem.c |  2 +-
>  fs/dax.c                               |  4 +-
>  include/linux/dax.h                    |  2 +-
>  include/linux/memremap.h               |  7 +--
>  include/linux/mm.h                     | 11 ----
>  lib/test_hmm.c                         |  2 +-
>  mm/internal.h                          |  8 +++
>  mm/memcontrol.c                        |  6 +--
>  mm/memremap.c                          | 69 +++++++-------------------
>  mm/migrate.c                           |  5 --
>  mm/page_alloc.c                        |  3 ++
>  mm/swap.c                              | 45 ++---------------
>  13 files changed, 46 insertions(+), 120 deletions(-)

Has anyone tested this with FSDAX? Does get_user_pages() on fsdax
backed memory still work?

What refcount value does the struct pages have when they are installed
in the PTEs? Remember a 0 refcount will make all the get_user_pages()
fail.

I'm looking at the call path starting in ext4_punch_hole() and I would
expect to see something manipulating the page ref count before
the ext4_break_layouts() call path gets to the dax_page_unused() test.

All I see is we go into unmap_mapping_pages() - that would normally
put back the page references held by PTEs but insert_pfn() has this:

	if (pfn_t_devmap(pfn))
		entry = pte_mkdevmap(pfn_t_pte(pfn, prot));

And:

static inline pte_t pte_mkdevmap(pte_t pte)
{
	return pte_set_flags(pte, _PAGE_SPECIAL|_PAGE_DEVMAP);
}

Which interacts with vm_normal_page():

		if (pte_devmap(pte))
			return NULL;

To disable that refcounting?

So... I have a feeling this will have PTEs pointing to 0 refcount
pages? Unless FSDAX is !pte_devmap which is not the case, right?

This seems further confirmed by this comment:

	/*
	 * If we race get_user_pages_fast() here either we'll see the
	 * elevated page count in the iteration and wait, or
	 * get_user_pages_fast() will see that the page it took a reference
	 * against is no longer mapped in the page tables and bail to the
	 * get_user_pages() slow path.  The slow path is protected by
	 * pte_lock() and pmd_lock(). New references are not taken without
	 * holding those locks, and unmap_mapping_pages() will not zero the
	 * pte or pmd without holding the respective lock, so we are
	 * guaranteed to either see new references or prevent new
	 * references from being established.
	 */

Which seems to explain this scheme relies on unmap_mapping_pages() to
fence GUP_fast, not on GUP_fast observing 0 refcounts when it should
stop.

This seems like it would be properly fixed by using normal page
refcounting for PTEs - ie stop using special for these pages?

Does anyone know why devmap is pte_special anyhow?

> +void free_zone_device_page(struct page *page)
> +{
> +	switch (page->pgmap->type) {
> +	case MEMORY_DEVICE_PRIVATE:
> +		free_device_page(page);
> +		return;
> +	case MEMORY_DEVICE_FS_DAX:
> +		/* notify page idle */
> +		wake_up_var(&page->_refcount);
> +		return;

It is not for this series, but I wonder if we should just always call
ops->page_free and have free_device_page() logic in that callback for
the non-fs-dax cases?

For instance where is the mem_cgroup_charge() call to pair with the
mem_cgroup_uncharge() in free_device_page()?

Isn't cgroup charging (or not) the responsibility of the "allocator"
eg the pgmap_ops owner?

Jason
