Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C94773A37
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 14:42:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B232F10E002;
	Tue,  8 Aug 2023 12:42:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2072.outbound.protection.outlook.com [40.107.96.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AEC310E002
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Aug 2023 12:42:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=myevh/uXjnStY1GaPgqsuBh/pdybGeR/C52/19OCqP05yOEZ3BBucWwx2y8wR49MGuraNge5ruaVg/cPsnQUacNeg+RHkK3TgbKlAI4vCCyT6H7rCQb9S7hJrR87WL27fUB+CUXlFs6rnIt//omjn5lZFPNl1lkxR6b14mrkDS+NViX8M77cY2BvK1ak2ElY/+VQb9VZgE54Fc3aCUk94+ebpOHoOj6ext3xSL8u6PDr7YHnaRhDZTYbwebitAwfXjpTvCm899xfyQTd0h295TjXrzgFFOTjV4keNSvHtNJDijYCPZZ47W1bnlK5/4rgl+YCL35I/Qnxge4fn+Ytpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=leF/oCEat2bXSVjyO+1FkU/uQdOeDyBDg0rGugIBiGs=;
 b=XXgdLQ39ZV7+EcQ/PSUaZsoZQMh/PnSjYAcXoPlfrjs3m0MPOVUMXol2DcFl1ppz4DiwblxlhFV/x0EbgXyo30PwD41ndCgxnlkHLcI5CVj2MzRyQ89pbxwVydrcl0YlYROrfnUC6mvIG48Rz0kyMyoUbRIlB6u+wicrb3BkBgIanIwzQr1ej2Fou/LrZO6lpJNb0+OKq5hKgZH8KUJdzUoMGlmanrpZ9wWgdmDnAUep1Ag1htE4yHxw3GF13q1llskzlzvoG+NQm4C0uKTT50YqCIGAeTMDoxhklQku/fodokQNlC2utc5zfkEXICjlJRJKTb/xSpqXchm/+xX9tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=leF/oCEat2bXSVjyO+1FkU/uQdOeDyBDg0rGugIBiGs=;
 b=rqwunRrLeTcdjm9I23n/2ay8WigoINE+0497UlH/1BmnFX8Zre8oPDzNNJODv8h6pweZhVWGsim6hzuWt6dST/uB9GImbUck/X3Ksy8trg6FRRI4SMBIzzTQHdhjVg7f1qcqPrw36vA/hHTUQAH/TrXtv3THhgfqigGnmXEvQpE21UZe4/Gu5CDgl4gFYcEQxzGya+k9BA9XtsToPpcLICS70Tr08O3lVdbhBMrImXmWWcshMppwvij0wMJ587EeDKaUu8PiwnsH+NgqcJgwWaAG8JV8H1Hl+KySbSfQPZ5qEztiiJ1B3d7lYhC6GNz/1RA550NG8uT3RnPBPuk50A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by BL0PR12MB4851.namprd12.prod.outlook.com (2603:10b6:208:1c1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 12:42:18 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 12:42:18 +0000
Date: Tue, 8 Aug 2023 09:42:17 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: Re: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Message-ID: <ZNI4KV+Z7CvffiHI@nvidia.com>
References: <3427735b-2a73-2df7-ebd9-0d1066a55771@redhat.com>
 <IA0PR11MB7185CF1FDFA5D5EDE3B6AF08F80AA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMlMoRIkPoO0gG3B@nvidia.com>
 <IA0PR11MB7185304345516521FA3005C2F808A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMuaQ4vpv03GTPbF@nvidia.com>
 <2aee6681-f756-9ace-74d8-2f1e1e7b3ae6@redhat.com>
 <87cz0364kx.fsf@nvdebian.thelocal>
 <IA0PR11MB7185974FA204015EA3B74066F809A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMzz2OKbmiD6SKPE@nvidia.com>
 <IA0PR11MB718593A011700F06BD6414E8F80DA@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA0PR11MB718593A011700F06BD6414E8F80DA@IA0PR11MB7185.namprd11.prod.outlook.com>
X-ClientProxiedBy: MN2PR18CA0002.namprd18.prod.outlook.com
 (2603:10b6:208:23c::7) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|BL0PR12MB4851:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fb28d50-6b69-482b-9d32-08db980ce6eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NnJ1VpinmxArnHdmg03FIxoUWoDtXRUSGMhBjXQDqa8MuG5d6+kKWXaTINFqbBjGN3Irwz5tLH7U69UgcGaDDEuOLXQvHQss+qWwpUitAsV3oFq1LFlt/UHiYjWvAoAWzKagR6QNYI5PXotshqJUvj5KK9GIB+JfGPxYbHSTk5XKrGFxDhJTMfL0z3rLnXYs5kWQK0nQk1HBwbiKC5VBGkBwvz8tYN0E94V39sSUlZYchdDAJztbwv1JmJsBhX2SBCJEtIMFHtqjyDAS+dXTprMP9oluPKEKk86G12vE5ZXWrGbNGUx8eZ9PO7HsP1ti9/0bkB4ggD4kiW7ptsigJk7C1GjqwbtkVQLkAjid69PtvoXFfuCBwCW2fv64vATlW9AalY/qfVYDAxk94n9Ub0xawHM5oTMrScnS/Pd/Ypw8ME47e3qEWWjRAUSMw6B29f9b5lupuJb12YgJ7QYpphskXq7OeNfrGfJrWwO5LDzPySUd48hTnm4LE8+lIUbyWiVDZmSMFaKvmyF589ix3IRyEjKp6HcG6KI+dEm0ZYG4/OxmeMyepvucqFRKVjxsn3Om4ZlxqGnwZWhjWuGg2pkcsioTPT5qLZBGqY9XhKo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(346002)(39860400002)(366004)(396003)(186006)(1800799003)(451199021)(26005)(15650500001)(8936002)(2906002)(5660300002)(7416002)(83380400001)(8676002)(41300700001)(2616005)(6916009)(316002)(478600001)(6506007)(54906003)(38100700002)(6486002)(66476007)(66556008)(86362001)(66946007)(6512007)(4326008)(36756003)(67856001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A8RR8cwYrG/Y3pAAoSO1P+SCGKZ/yfmn1nMbmolk1h62JQJi88TbwSYsD7ta?=
 =?us-ascii?Q?7BC2Lsae/X1jwsVOvrG2Bo2cmb7Fvl5NUAIMfznyvQb1ZTeSbecQmWaJ78CV?=
 =?us-ascii?Q?6aPgoyCUmPe860HxQuGiCzhfX/jjKeM4j2RGfU8BBzUDONxB4kD9Xp4UVWvC?=
 =?us-ascii?Q?BfKNjfi8y0zZCJULuCRke2FDsgAndXvSPHJZz6dWY5VWgF76Am5w9pW7fy0j?=
 =?us-ascii?Q?ddpo7RHub1efK1mlA2VW2oSmKgFBYsYfa06LXWBUjnv6Kp+I/JaOirGcySS7?=
 =?us-ascii?Q?Y6G2vYyOc2K5Vmrb5cBz+6HzgxexJKHsepPdKrpOBqANY6lNEucBrr4xMbzM?=
 =?us-ascii?Q?Npiz9SDTW+w5hj+1pBFACvzqkMlGiOvBr7MLqgA4juwGTwoSnJWVVptM8vgr?=
 =?us-ascii?Q?llVw0CsSztQnNC9RNshAYtRHhJ5o4h+Vy8VeGZq+ewRD5xeDRamH1M3m9LW9?=
 =?us-ascii?Q?2+uJWPZN59+6TvIOU8bP5sHQYdYhKOx+PfFcubWQi3qQAhx6Kcz55wpiKSVX?=
 =?us-ascii?Q?q3PH8J1M6RwvuOvNkllz3cCmQysTvv4rkFL1XhP1E3qaZZrsdMVnpEmF+9j2?=
 =?us-ascii?Q?2U7cT9p7qjy1W/dpacQUUPPGUvItbSmON5uxMKJsHeFolsCLGmaq4hL67L6v?=
 =?us-ascii?Q?KoIGBfkK8dJqxyP+1pTUuMHCcuKkhktt1hV3EUwwTZxHxhbxFLqIEmG1T+qg?=
 =?us-ascii?Q?MMD1lsbnXgr3RaRsctB3Q/t5vzPw2e18J19wvZoSZMcxNA2mUVZximk/s9ed?=
 =?us-ascii?Q?x1LiOs44Kt8H9NcCowDjZtdv5NRnR3jMKECWaG1c6zKzNAeah0knQu5LHXLB?=
 =?us-ascii?Q?PRoK6V03WCKVZHWE2j/g3ejOaPTGfC+ASqz79H8uIPczJsDOJJa+EufACu+y?=
 =?us-ascii?Q?P3FRGI4GD2Va6P85CsS9dJWfNAVsBnIYyNIF/GvpJ/Z5L/d0UeRMe56YqyiR?=
 =?us-ascii?Q?Kd1g6UDIFcu+IQUixNR+z3OTSXC9ZNaN9i9BraFfYeUBbs6BJCcptph50XJK?=
 =?us-ascii?Q?DwY8WKM6vVogNz04C+NbHaDSthLY3U62mFYyD3eyEiKPSa9aXIEkqYboTtl6?=
 =?us-ascii?Q?j1/giUyVRdY4kTwBmPTevQmgd8CcL3Mq+wm43fWblZrDk+YkIU/uauMfUrWZ?=
 =?us-ascii?Q?V1CFlFcyio7iVwSl4Hk+4edpzCRAlF1CDjxLQhgFuYzuCwmWRw/2c8qbeGDZ?=
 =?us-ascii?Q?MLXITuVX3YN5qwpEoltHeUDAIXmLwZF+Der49D1qe+k5bqynwBvh6163bFsM?=
 =?us-ascii?Q?DrTk1qpfYVSo6fcLK4tEdqF7ZQD9t2Up4HVvTfDTKzvMYbqMnfjcJCAyO8vo?=
 =?us-ascii?Q?jGwMqaF+RBnHFWAqQ/NTyaQ54Uw6oRCMiXxsTzBLrGzBR2GwWobcrP87NEhC?=
 =?us-ascii?Q?hCyYD+WtK/Zzh+Fo4TN1YHRV6O3xg6KXPGS8lzegoGUdY9A6JLabwqLbjJpX?=
 =?us-ascii?Q?xF2bIVBeXBzNheWCG95MeFbTL4ACQMR0YCIfrAA+r/WBiSWhovgRoqbttH0+?=
 =?us-ascii?Q?2/JcYqiDNKCEBggEsxtegGCFKTLYh8J/AXp+aNmyLkFb3cEptZrJyNQjOtxz?=
 =?us-ascii?Q?MpCafUlf+3qiqu6fxkcaQlqM+we+4XGLmpUmyaic?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fb28d50-6b69-482b-9d32-08db980ce6eb
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 12:42:18.5814 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8GqaWFltaf1VE0vFtj3U+k5uMwjgkJwb5TfY2rxjx8/Ldz7HvPD8koNGQKdTljXT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4851
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
 Junxiao" <junxiao.chang@intel.com>, Alistair Popple <apopple@nvidia.com>,
 Hugh Dickins <hughd@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>,
 Mike Kravetz <mike.kravetz@oracle.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 08, 2023 at 07:37:19AM +0000, Kasireddy, Vivek wrote:
> Hi Jason,
> 
> > 
> > > No, adding HMM_PFN_REQ_WRITE still doesn't help in fixing the issue.
> > > Although, I do not have THP enabled (or built-in), shmem does not evict
> > > the pages after hole punch as noted in the comment in shmem_fallocate():
> > 
> > This is the source of all your problems.
> > 
> > Things that are mm-centric are supposed to track the VMAs and changes to
> > the PTEs. If you do something in userspace and it doesn't cause the
> > CPU page tables to change then it certainly shouldn't cause any mmu
> > notifiers or hmm_range_fault changes.
> I am not doing anything out of the blue in the userspace. I think the behavior
> I am seeing with shmem (where an invalidation event (MMU_NOTIFY_CLEAR)
> does occur because of a hole punch but the PTEs don't really get updated)
> can arguably be considered an optimization. 

Your explanations don't make sense.

If MMU_NOTIFER_CLEAR was sent but the PTEs were left present then:

> > There should still be an invalidation notifier at some point when the
> > CPU tables do eventually change, whenever that is. Missing that
> > notification would be a bug.
> I clearly do not see any notification getting triggered (from both shmem_fault()
> and hugetlb_fault()) when the PTEs do get updated as the hole is refilled
> due to writes. Are you saying that there needs to be an invalidation event
> (MMU_NOTIFY_CLEAR?) dispatched at this point?

You don't get to get shmem_fault in the first place.

If they were marked non-prsent during the CLEAR then the shadow side
remains non-present until it gets its own fault.

If they were made non-present without an invalidation then that is a
bug.

> > hmm_range_fault() is the correct API to use if you are working with
> > notifiers. Do not hack something together using pin_user_pages.

> I noticed that hmm_range_fault() does not seem to be working as expected
> given that it gets stuck(hangs) while walking hugetlb pages.

You are the first to report that, it sounds like a serious bug. Please
try to fix it.

> Regardless, as I mentioned above, the lack of notification when PTEs
> do get updated due to writes is the crux of the issue
> here. Therefore, AFAIU, triggering an invalidation event or some
> other kind of notification would help in fixing this issue.

You seem to be facing some kind of bug in the mm, it sounds pretty
serious, and it almost certainly is a missing invalidation.

Basically, anything that changes a PTE must eventually trigger an
invalidation. It is illegal to change a PTE from one present value to
another present value without invalidation notification.

It is not surprising something would be missed here.

Jason
