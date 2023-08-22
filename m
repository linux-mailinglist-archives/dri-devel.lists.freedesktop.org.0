Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5878F7840A8
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 14:23:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F70010E33E;
	Tue, 22 Aug 2023 12:23:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::615])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A74A110E33E
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 12:23:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kpWlSLRdMeG3gdsGswlDf2SO1+hk90ks5bE0hUJ7gsEKy5p1qpZqihBJT3Rj0nLW9de7kXLo92xFnpMCYKImJtv+FiUhBIt9JhmphHmN+3NJL74oYevMmVNatoOPmk6RzzGNYzBRJbDEB/2NwumFd7lXDnwv3wtyRCbIVSf1BuPm1oaTQiP0n/Fryvm9VCV2hBbK3qKUbSaBI+dZynGzyZdpBQ1ZV1HjDP33ayinXIpafltFXBuQN77AtQpLNmAQfk+KfpFrj63cbsS/ZdSvUdwCYc2w0MhLG4R/8Igl3iBQKQhGr/mPPZUgOoqPTWd5yj1lGV02i/kAcNSukDdfyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KMCWtC7ZhYJ+6Aj855fl4y9brEL54uuEewFG0e5bc4g=;
 b=Pbc9v+m2sVTilNxVMcwaw8PjOmUGIOuaaR726/Yjf53n6rDRloWfj2P4fttl7FGB/tUACf67zd2ECFpztAJs/VM1qBbry3ViYi7aU/rw9xNkZo+QTYAT06Uo2kFA9lIwg+X0aMyx7+tBl5cXOlPTLlL90DNj8zfAyly/20oc/qIHRVGWD886OQdeumQ1c1EFsIsyusGAxaPbeTNWxeYq3XD64YLOhgG089IbTKmGyy6Vo9dRNj5xRmXezjj7TRwt/tWnOlO6NyVeqL+rWMK6i4EYRCOLYx8L8gfaKIyS52wZOIVmEHO/Fd4E9nMMkF8sO0Qv0WJBTWKTaPGXI2YW7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KMCWtC7ZhYJ+6Aj855fl4y9brEL54uuEewFG0e5bc4g=;
 b=uBPhTu5bTGlFuF8nKvfleiDXkBK+a9FNmVWDeBuRds2EkJ6qfm4qGXF3JW9PC0tjimD2VXYlx1Xv5syeWD23CQZWbokTIaq37kdF9GkA4BD2xlOifeLNB4S/0CQW5h/4R/uqTD3pDqARjoUrIwYZ+3pGqVGsVC+6P2rbMS1EmPXyFfyZtZurCE6JELue655UoG/iclQ2u008D74Dzhl6crpeiulGkujvC3EsQr8O85WcZx/Vzq8yro9GNMuQq6YO6bLB5SgJDiAfkwYAk2XSuClr16G6kW8nTRjph/p6wMagPyptXLn5bgnimesTcUqvVf0fc+BCjGnMVg290CL7Wg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DM6PR12MB4354.namprd12.prod.outlook.com (2603:10b6:5:28f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 12:23:54 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6699.020; Tue, 22 Aug 2023
 12:23:54 +0000
Date: Tue, 22 Aug 2023 09:23:53 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v1 0/3] udmabuf: Add support for page migration out of
 movable zone or CMA
Message-ID: <ZOSo2cuw1ashK3+Z@nvidia.com>
References: <20230817064934.3424431-1-vivek.kasireddy@intel.com>
 <ZN42XjuXUyma5uE+@nvidia.com>
 <IA0PR11MB7185ABFBB06771B7646F8F50F81FA@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA0PR11MB7185ABFBB06771B7646F8F50F81FA@IA0PR11MB7185.namprd11.prod.outlook.com>
X-ClientProxiedBy: BL1PR13CA0117.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::32) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DM6PR12MB4354:EE_
X-MS-Office365-Filtering-Correlation-Id: 29f55b2b-4cf4-4e61-ccca-08dba30aa6ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GMWJDD6SOOoK6uykvVe2PfKXdgA8leNd1jxdZNlyN1xCi6ygSfdZGiKYpYP+VQnZQEgKkwypfnITzH0xSYDGl8liBe5E5KGke2sV9DZjynFwlHkPDLoWerHxz5If9k0leMU6PaJsoKxRrVg2vWcEBLJLgyI7Ze/ERfX/2qzfIzjBVgwqnlEYN4yYOuMwJJBT2bvgSE5L3tPEto5oEF1r4s1uDdv6oHhEjYfIcJSGh04gueZrmIwC4OWMKpKgrwm3sD5gCamDlklBNv65Mr3F3EFngzpn4HkwemKE28sC6t4QOwf723E8KYcuA32EbnYN7YsZgPmB6DQU8nI+uu8Wi4npu8c7T43rjVYaHIy5IFAXyYT1Z2tVVqJ3hHUAAV9829ZmPVoGGUj5vX334qiodd2k4E47RPWbgFLvYdodYVSIHUftQMJ2nKh9y1V1qX/x1uu/biwzL//gfAZ2Pv8e3UZnX/Ga4VhSfB3MdWtK1ZC4eVL7wiJRJGj/ryI6wYWORUsI/RT/VCHOCwehwddaOg3vbVu/aoT4ruiwXas43zYX4yAWNwsN4PcxhRNEc9PoglXVoIQPyfVV0eeSZ3nyNkvyrPoEAhXJdG0Pcq3WGfI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(366004)(39860400002)(346002)(1800799009)(186009)(451199024)(54906003)(6916009)(66476007)(66556008)(316002)(66946007)(6512007)(66899024)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(478600001)(38100700002)(6486002)(6506007)(83380400001)(2906002)(7416002)(86362001)(5660300002)(26005)(67856001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ocPDQLScGtupayFxzMkKabqnogaqMeK+pts2mTUx7j6birybsDIeRIR9EwSq?=
 =?us-ascii?Q?4Znjz8krKyrSQj/Ld9AEdLR0v+9UIjuMWMbNbq+Wbjba/z4vIRwo6TYGdtV0?=
 =?us-ascii?Q?uJkH3mRbNQrLyHFPe4LtPRfM5/56UjyGzv+gb1HhDH2nj+yCWC7ZTKtOyOen?=
 =?us-ascii?Q?O2pJchiDx9cRaiovu/UkBhxY4CLjzFrgMm5kuHKo2p80p1hgIJtuKz093FkG?=
 =?us-ascii?Q?FZs4faB8dH8m4dA9Ji81pyEpTUAYJRL5M46shSqwNCHC8BySGEeJLKktsoxl?=
 =?us-ascii?Q?UVlzfu8Q6FZrR25KYbXdUWP48BD5mZJdCrpMls5VS0zGYbCWsOI778EYf2cY?=
 =?us-ascii?Q?wV1raxPd03v7Ncst/vw6HmhfNe3iZT7en3szfLB+iT0DT9LHiV1/8MBWKu2W?=
 =?us-ascii?Q?Od/sAmHvyhtjWozgKcqAf/iI7eCUjy5FCo0JmDzpPvm5WtMKrnQD3saUgyf8?=
 =?us-ascii?Q?chTI/eTerM9L99h+wZN8XLfs4ga80OaATbraVPLrt6Ss5XMUHvdrpZDQVfG/?=
 =?us-ascii?Q?jV4PK3OSg1dcb2rbrYz7dId7DUuPqzdq/usvt8dduCQlHipAKnTM0okpnyRx?=
 =?us-ascii?Q?rlwaHfOhE8trCl7OJxNqwVs+u+kkAC5RhhW7K1nlDXAJ3vbVwmx/x2TX7KnX?=
 =?us-ascii?Q?FK8sR7YMzzA0gkdYHiUWrOUx/BpEjcPtxevjZ84hAeu8pB6jpZdUmMG3zT4+?=
 =?us-ascii?Q?FWNO18t6gFGtzVSYJ8YjiKTaCkqN3RiY5sRfeK4OOll6V7R/vmc2Zhuc3JbX?=
 =?us-ascii?Q?oa/LdyV2bou5JxzxtX6evWX4513+SYLHm6KMu9e2M4C3uL5ToF3w4TjkXhRZ?=
 =?us-ascii?Q?yv4qLZoJ6cEo23eemAcRQg01GO+2ESYhFs5L5AHE1pUdR75zBFJMA9xmaFzL?=
 =?us-ascii?Q?K4Rtfs5wd1sw10awPNSlr8yMzVwhxtG3336hoU0ZwZ9LmNMdFLGo7HmNGNuB?=
 =?us-ascii?Q?6ups2prSqlrQzQzLn9e8bfLkV5cmlJvgh7AjQjojczwEBpQLS4WZRBDBuVNt?=
 =?us-ascii?Q?Oe385e0t6kSX9/LalDIAXViu3zN7YPVeQ/4OOOU90JpsMuGuyirfvU8WLtcg?=
 =?us-ascii?Q?VoeHHm8x5CH24YMOe7gDr814ALUEi80ptFizpTwrTkBSvIBdsaFxLhyGVWCk?=
 =?us-ascii?Q?+2texmRHYb17j58WIvfPUbnH2mIMiWrHGXQaU+oDg4FkU7339x74AKkn+m+H?=
 =?us-ascii?Q?BuvxpHx/Uk8R30Y/EHtcBu5R3aAsnXP1TDdzlK0EES1W4S+KlUsxaY/bkS6n?=
 =?us-ascii?Q?C3q8qmjAm4HDnoX9U1Itq6xoHEfdpBNpbyPaSkF1Fy4Rub7zE7blcNn3Bhl7?=
 =?us-ascii?Q?HJyUMIltpRLGzpaXlB1KvRjUhf4KJmwT51yuaKE4dSIKCyS+jXw7bIKSV9Hp?=
 =?us-ascii?Q?dNI3nUy/YHhHhvWLt/k4R3xe/6xN2S4lzgfUE4yjtBIrMJUCHOdHj9FgsTRH?=
 =?us-ascii?Q?LIs/knqGU7BP3BXoI+TIw3FI09qbnqQIHdiSpxjRWwjPmOuG+PX+DyWT7wW7?=
 =?us-ascii?Q?EbYO6ZMU8vuE5XinYfGG163QSsDpzA9xdYLW0Eiup3zKpIm814dsvCREOfDw?=
 =?us-ascii?Q?JhO6MHJnagNojZUtdOJmzTez3Lne/+hitGxZkm5g?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29f55b2b-4cf4-4e61-ccca-08dba30aa6ce
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 12:23:54.8294 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mUU58fqxoRpXOAkXmrojZC2uskVbOFA3yQjTRAou3ud8/vz9X68qm/GuG75pstPP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4354
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Kim, Dongwon" <dongwon.kim@intel.com>,
 David Hildenbrand <david@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Hugh Dickins <hughd@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>,
 "Chang, Junxiao" <junxiao.chang@intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 22, 2023 at 05:36:56AM +0000, Kasireddy, Vivek wrote:
> Hi Jason,
> 
> > > This patch series adds support for migrating pages associated with
> > > a udmabuf out of the movable zone or CMA to avoid breaking features
> > > such as memory hotunplug.
> > >
> > > The first patch exports check_and_migrate_movable_pages() function
> > > out of GUP so that the udmabuf driver can leverage it for page
> > > migration that is done as part of the second patch. The last patch
> > > adds two new udmabuf selftests to verify data coherency after
> > > page migration.
> > 
> > Please don't do this. If you want to do what GUP does then call
> > GUP. udmabuf is not so special that it needs to open code its own
> > weird version of it.
> We can't call GUP directly as explained in the first patch of this series:
> "For drivers that would like to migrate pages out of the movable
> zone (or CMA) in order to pin them (longterm) for DMA, using
> check_and_migrate_movable_pages() directly provides a convenient
> option instead of duplicating similar checks (e.g, checking
> the folios for zone, hugetlb, etc) and calling migrate_pages()
> directly.
> 
> Ideally, a driver is expected to call pin_user_pages(FOLL_LONGTERM)
> to migrate and pin the pages for longterm DMA but there are
> situations where the GUP APIs cannot be used directly for
> various reasons (e.g, when the VMA or start addr cannot be
> easily determined but the relevant pages are available)."
> 
> Given the current (model and) UAPI (udmabuf_create), the userspace
> only shares (memfd, offset, size) values that we use to find the
> relevant pages and pin them (by doing get_page()). Since the goal
> is to also migrate these pages, I think we have the following options:

This seems like a bad choice of uAPI - we don't have any kernel
support for pinning from a memfd. If you want this then you have to
build this as generic code, not open code it into udmabuf.

> - Leverage check_and_migrate_movable_pages(); but this function
>   needs to be exported from GUP.

GUP has many behaviors, we keep adding more, these functions should
not leak out of the mm core code into drivers.
 
> - Iterate over all the pages (in udmabuf) to check for folio_is_longterm_pinnable()
>   and call migrate_pages() eventually. This requires changes only to
>   the udmabuf driver but we'd be duplicating much of the functionality
>   provided by check_and_migrate_movable_pages().

Definately not

> - Call pin_user_pages_fast(FOLL_LONGTERM) from udmabuf driver. In
>   order to do this, we have to first unpin all pages and iterate over all
>   the VMAs of the VMM to identify the Guest RAM VMA and then use
>   page_address_in_vma() to find the start addr of the ranges and then
>   call GUP. Although this approach is feasible, it feels a bit convoluted.

Userspace should have told the kernel where the memfd is mapped.
 
> - Add a new udmabuf UAPI to have userspace share (start addr, len) values
>   so that the udmabuf driver can directly call GUP APIs. But this means all
>   the current users of udmabuf such as Qemu, CrosVM, etc, need to be
>   updated to use the new UAPI. 

There you go
 
> - Add a new API to the backing store/allocator to longterm-pin the page.
>   For example, something along the lines of shmem_pin_mapping_page_longterm()
>   for shmem as suggested by Daniel. A similar one needs to be added for
>   hugetlbfs as well.

This may also be reasonable.

Jason
