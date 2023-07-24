Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 092BC75F859
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 15:35:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CC9A10E2F2;
	Mon, 24 Jul 2023 13:35:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2041.outbound.protection.outlook.com [40.107.92.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F7810E319
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 13:35:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fPz2qh0jOICLsAz+Oe6mlDaVhE4cqyc3Fvb7EXP/KBDGeI0SOfM9QSeK81+C5YxzDEgl7jBU+ISKRkLyV+4nhjSZs2IVMEMbgb8fMrrdr7V+Y9p/JuuBTNgoWOFqC/vRRYKDD9LpxM6iMxZvchXbpM4LAd+uoHNETEQ+MD2Op1SGCxG9BC8qtQpiEBhTqzqPe3MWzVW+Djwoq0qYEG32hf4HGqdSueCvaQnUCog2Jl0oUZxdbnsIATypOPHwLp0iZHD7SY5CBP5LlYnJLcnZ0ejl38oJQXvrCydiuOVZZV/sQHtA1kkTKnESDIEjUKDdZOQYGCEGG0pB1SKpdmiIMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A+OPrWGHBwkQ/IhMmIPOClIU0sP4gdBMQ+64hmkWK3k=;
 b=aqVO4QybRp8DG68vg2CJVGNCGd0HJyK7bkcaEC2Y/Bx5qJ8S/SZ3YJ8ev9EP+r1ha4BoEcJ58ah42zOmXY21eAhvlpXgqPKwPcoGKUNCR5dGPgXF3dqVQ10KZB6CznkO+cI4zhS+sNORvbFqDFrKEcvNlcnZT1umcl+qgsWNkzZiJX6zPp35U5aCKL8xkLYbcZ+8sO1oJteJZSa1+9cUSO2vjr8NtFhUQmXOJPynabhdTSMUxvAvoV5snEs4jrh9eLyCc9yzeoYP+sYpMewHyIApxM1i/5748yjrcVvjrul3rflO8t0Q17PQYkIsGe/81zrZMaPdrzyYEkTIDEiirQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A+OPrWGHBwkQ/IhMmIPOClIU0sP4gdBMQ+64hmkWK3k=;
 b=lGDlypGuSC2JhnLGw7sD6wZMdTcr5bqP4qCplRV2/aE+2hg0AAFQ4rwXhKYrIjVpwBt+xHDoowtFDa9csONeVDZqu82ukkI40IpdQ1otMYGLDNmh2p2mBKSHhAaLZWCUHTzKPAPO237dequpanY134hp9XYcQwEZyTY5jIbYcA3w8eJyrL+g13ws+y+SHnxqeA6cFkIi+jumWBNi7hfpXVDQzPHjouydERCsiIHDFafDsD+TmlvBAgjEbI6O/3WkPRISI/E/Te6ZnEA2QsAjra5IQT//CVnXhCqhL4n425UwQG4AZPqDSJMgAqF2Ik9LI6tiilDMmJgsemXMDLIj/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DS0PR12MB9037.namprd12.prod.outlook.com (2603:10b6:8:f1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Mon, 24 Jul
 2023 13:35:08 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 13:35:08 +0000
Date: Mon, 24 Jul 2023 10:35:06 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: Re: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Message-ID: <ZL5+CiZ6w4RdAt5u@nvidia.com>
References: <20230718082858.1570809-1-vivek.kasireddy@intel.com>
 <20230718082858.1570809-2-vivek.kasireddy@intel.com>
 <87jzuwlkae.fsf@nvdebian.thelocal>
 <IA0PR11MB718527A20068383829DFF6A3F83EA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <87pm4nj6s5.fsf@nvdebian.thelocal>
 <IA0PR11MB7185EA5ABD21EE7DA900B481F802A@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA0PR11MB7185EA5ABD21EE7DA900B481F802A@IA0PR11MB7185.namprd11.prod.outlook.com>
X-ClientProxiedBy: BL6PEPF00013E05.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:4) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DS0PR12MB9037:EE_
X-MS-Office365-Filtering-Correlation-Id: 37199d59-69d8-4453-4c55-08db8c4acbec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nItllhQIJhi013D+Whd93RWQ8iHKHWRZsNAFaEEOgwg8bgf5xlSZqLU5xrzMjeDtOZDxa/y915iTYXBLqIYZQRgrUmUQar5pzado+1EBc6tg2q25H4EPlIcbmaBEFrk6Z3SqjwFlgQUKIz6I1Qxgz67LnD4bp4LbH8ntD1BbYuyl8NOOrZ7NqBWNGwT9rNj+W87VmMI5lNLMS4So4bnBZaMhEcOo6Af4IC9/jrljfy+r9Z9PTH4SjcdVv9m7zyXHUZLwL9Nqvo3w0rgZpl0rLCtQIOgqIvmsi3PQiKFuKAjOl7AxGTfW5MWSxZbft9zksYIdkzFE6mnzD6LXt2fHmMeZ8KG2choZjOx9pwhCwGKXuQpFM5cggFXcNTUZlQ4ACHSAHvN05oCD84m7k+AkHhPKVIF47tHSz7fGm0vaRRKjgfL0FVob/Xl6O21M38dNQNgocwiN+WhO0/UCK9m/j2Adfh7HR3D7lFDNZT40wCParPOPkEsua2L+MxibGL9UwjuvsRAiQMZlOg4CnJDAYWvV+velL1MPqgHAtCeiWwDFLcKlGNsCq9oEAA4/V6wxNYDkct7x7TPBXgs3Xx4w+Hhcw+9O1G5vFJfsgMi/hxI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(366004)(376002)(136003)(396003)(346002)(451199021)(186003)(54906003)(478600001)(6512007)(66476007)(6506007)(2616005)(6486002)(6916009)(4326008)(66556008)(66946007)(83380400001)(38100700002)(26005)(5660300002)(86362001)(15650500001)(2906002)(8936002)(8676002)(7416002)(316002)(41300700001)(36756003)(67856001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U1uvtNEX1A4m8Ty7zHk8h4OFTCVzU+YR5UjF2A8nzsqgFbS0UJwO/OaYXimh?=
 =?us-ascii?Q?uMbRq6IqYkled4JcyxYkeD4Ip6SclaYpYvutERfrYiYHuGj4OCAxfgcZHI8x?=
 =?us-ascii?Q?t7ZL/GXDL6NNDBYqcvKmgBdPDdJWUl1yxhYZUbWQDE4ZFGwriRLXhUcZv4q6?=
 =?us-ascii?Q?zXV19Tj2cz+GRKvOO52eg46kPVEHQpSe7XKgYst3kUWJIE6LT8SuEXp5XGHB?=
 =?us-ascii?Q?GSdzKnhZwWPGTGWvIeUa0Kxx5RMUbXOF05WNaljHANC26j1yu4JuTRIJGKYQ?=
 =?us-ascii?Q?j25U9UAqCeOcXGI4UX8+g14BukXRSeFP8a84PVjUTs/0DvvBHeJNr25MvnEo?=
 =?us-ascii?Q?x4YhE3Cde487nOH1gVgAVCr9i6anafaTa6QvBSZo8u7HxFaPIaJwIeABjpqM?=
 =?us-ascii?Q?6bX+1vIiqTGZ8vPoBhI2mMuALlffl1CIOis/qLLy69NFFTP5BMz5lPZOwe8z?=
 =?us-ascii?Q?Vwri7f/kmU9mC4oq/Fqh7iallBpHeOV7+MLbJS0ZPuSoBC/RpHUH7WVemcOH?=
 =?us-ascii?Q?1Zuo3vkEP0IvASvtxLRHP6P1vS0uIu86pa+Vq0+dMqH+vb4mZz4LNibL06GU?=
 =?us-ascii?Q?KfthOAo7pvGVBi9EAXrQtL+IQcwOEd5DNF8YJibAeAGLQ1kO1pjhScvKjYS/?=
 =?us-ascii?Q?log42j9/kxrwAPPw7eKUMoM5hvMszfNRBi6y0u/26qCvhHwn5vCY6P91KlY7?=
 =?us-ascii?Q?+om29/zLW2kmgN4eVI2Oq4O6jSbRmyXLgQCxTjPMDLRyQ7vnkDzjUOivym43?=
 =?us-ascii?Q?0wMMS5MIwZ/+7XDuWdDHYUThsBySCiyzvRqw1F/x6ILeUiiqSgU51mhgQxhE?=
 =?us-ascii?Q?ZHJBbma7CMOvwZptTrC5cnzcem48eq4mfITcb6EdrV+jd7/cS9yjx+cw4Zkj?=
 =?us-ascii?Q?D0dKQAS6TXVJJ6vtVoame5L601rb8e2IeXH8TFjZndbvI90MNY4h1QWeIQv8?=
 =?us-ascii?Q?Jt1nqGGxeM4mlQtivabY5pYiR2Uey/ZyTwEhN8lIgi8cEtegvhaRKrIpGqmK?=
 =?us-ascii?Q?yLVp3BKoNPtPMdK4FPPSV5VyUDUxOFtML/qYacofxY4xzblEXklvRI6b+6NF?=
 =?us-ascii?Q?oc1K07nkvhn9v6QFS2wTyijXTpzvcmpejiuuHp89SmQIj3RGBSRq7CwFFuhC?=
 =?us-ascii?Q?WvgP0JK2mveX/jxb3qmV0s2oVD5PXpo3fcvs0IUQH+8lA8DWS716AsLcje5+?=
 =?us-ascii?Q?WzhGcQRRTrAednyTVJMz2S3UHaP0P9Fwv08S6UXrclCRNb6cYkoXwTiNder+?=
 =?us-ascii?Q?Vmbip13lmmuj8S2rcO5ffD0lZgGOz4AehxB1yWv5C4NZQwGVyWfdup0ugMpA?=
 =?us-ascii?Q?w5LmmY+1Xby66M6Lc7t9PhlRAg3bV8eEja4SmxjaUomxtioPbJD2+8FlLEzO?=
 =?us-ascii?Q?nUVRYwcKTK5DQqM2BnxszLBX5L6eKbH5MH3YnoBh8MfCkj6meegqVDs3ha63?=
 =?us-ascii?Q?l3+zYkAXVmNLbsSZ5H6QzS0Y/u7vb7HpKuz/N62ackgta0+D5kEs+sDmJ0Gj?=
 =?us-ascii?Q?EPFmrnoYtwuDeCp2BuNFqMBu1kAsBPWB4yxWWIwfhqgNsrVbkNdt9MDtSz11?=
 =?us-ascii?Q?DeFa5CRlPCttFN8sSR1ajYCM9zJH3fxowcorBsfF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37199d59-69d8-4453-4c55-08db8c4acbec
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 13:35:08.1420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DyTRixZ8EvAHR4ac/sjarHlls1kSuehdMy5xs2Bo7P3bUNjfTKT5neys4/zaEt6B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9037
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
Cc: "Kim, Dongwon" <dongwon.kim@intel.com>,
 David Hildenbrand <david@redhat.com>, "Chang,
 Junxiao" <junxiao.chang@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>,
 Peter Xu <peterx@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 24, 2023 at 07:54:38AM +0000, Kasireddy, Vivek wrote:

> > I'm not at all familiar with the udmabuf use case but that sounds
> > brittle and effectively makes this notifier udmabuf specific right?
> Oh, Qemu uses the udmabuf driver to provide Host Graphics components
> (such as Spice, Gstreamer, UI, etc) zero-copy access to Guest created
> buffers. In other words, from a core mm standpoint, udmabuf just
> collects a bunch of pages (associated with buffers) scattered inside
> the memfd (Guest ram backed by shmem or hugetlbfs) and wraps
> them in a dmabuf fd. And, since we provide zero-copy access, we
> use DMA fences to ensure that the components on the Host and
> Guest do not access the buffer simultaneously.

So why do you need to track updates proactively like this?

Trigger a move when the backing memory changes and re-acquire it with
hmm_range_fault like everything else does.

> And replace mmu_notifier_update_mapping(vma->vm_mm, address, pte_pfn(*ptep))
> in the current patch with
> mmu_notifier_change_pte(vma->vm_mm, address, ptep, false));

It isn't very useful because nothing can do anything meaningful under
the PTLs. Can't allocate memory for instance. Which makes me wonder
what it is udmabuf plans to actually do here.

JAson
