Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFA73460EB
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 15:04:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFFEC6E877;
	Tue, 23 Mar 2021 14:04:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2081.outbound.protection.outlook.com [40.107.95.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDCED6E877
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 14:04:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ln8kfYcJZirCJ566+MggnTr7bHfiPzZcoxp1sx3Zt+XIWqPMD4Ak6lluzMAYRLvUd7YqtE0v3c2eIScHCPzWD4BFmi+bUypmMhIcoGGQIMlCzphPukUyBwz/WKFgNDfOBkVHZIJnLSZY+OV+V+UIhgRdSvM03A58Pj1bXtQq7Sp+t3c8zz+GEa5zdUqqnTnYMjP84eeZGuEWjk4wD8HOu8x5KP8SQniit/pquw4UZYcJLvH/tAZdVYNMkK4wOyeOIVRCK8ukaw8VnnfBemT9KTif1vUglTn+Gvp2IGyLerXBswJVGztJeuz/0tSXYZ+teRD1v0RazGK8j/KjggoicQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGCG43YNx69JLlREY99WqR/4vGsO5IOMNRm+anqv7Ws=;
 b=X7UC/X4MJ7M+vc1G5uEn2yBfi15OnTT4OZIXz81vIb2muqj43IsJASB9C2oxj2gqYrDQ9oo4JHQk86v/ZoUu38gwd3fPrtl5qIljoGLyg4fBpSbI+w1vVFDJ5ZQEj7OlfAodgifC6QKr6zetuIi9vyr/3FmePjNaV6mrOspPPnZfF6wo485RcmMC6YXW7I78BONUYdxdzqaXVv3dDWdV8Wo/rJB9UivrJ88ZqIPxtTRbMStMo4JS/g1ZSv77Xd+lqaIjGhBHsIjeiEJni30k4tvZh7x3KF0yHlc0miEuntuhVseA9o1tnaJG3RpYB/Emy/m4RhP1WYcdDQj7bc8FEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGCG43YNx69JLlREY99WqR/4vGsO5IOMNRm+anqv7Ws=;
 b=UectqyK9PoPA2F8jIJzSgg/tK+ZUpRpFHheJe1yDhv+qVZzIdIU26RRj8KcmmTBUkaCNSAgnNeMxm6UG3sBHlKQkNXuJI+WKKpv+H/AP6tqc5DhTtECxyHcQqBO8X7paGgLiGYDkhUCw8BZUw3LDMzoGRqtss2l6Gg5n0XOCNP57huc2X+OmVlt99ns72cpOymDrTFSYi1q2MWbzdrnePmCs0dgbyXEbuIvp03wjZWxThxePadkx/ImoYjURMHIPzNORjKnEu5i/vgkPCMZqBzTbDG4AF1VdJ9EsRLdfeUIxNkRxaDgE8LXJYLt+HQrDWWm9zyR/i4yNTbvpR/CYaw==
Authentication-Results: shipmail.org; dkim=none (message not signed)
 header.d=none;shipmail.org; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB3835.namprd12.prod.outlook.com (2603:10b6:5:1c7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 14:04:48 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 14:04:48 +0000
Date: Tue, 23 Mar 2021 11:04:45 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Thomas =?utf-8?B?SGVsbHN0csO2bSAoSW50ZWwp?= <thomas_os@shipmail.org>,
 dri-devel@lists.freedesktop.org,
 Christian Koenig <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 2/2] mm,drm/ttm: Use VM_PFNMAP for TTM vmas
Message-ID: <20210323140445.GF2356281@nvidia.com>
References: <20210321184529.59006-1-thomas_os@shipmail.org>
 <20210321184529.59006-3-thomas_os@shipmail.org>
 <YFnVTIGKBFnlsGxF@phenom.ffwll.local>
Content-Disposition: inline
In-Reply-To: <YFnVTIGKBFnlsGxF@phenom.ffwll.local>
X-Originating-IP: [206.223.160.26]
X-ClientProxiedBy: BYAPR01CA0014.prod.exchangelabs.com (2603:10b6:a02:80::27)
 To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 BYAPR01CA0014.prod.exchangelabs.com (2603:10b6:a02:80::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.24 via Frontend Transport; Tue, 23 Mar 2021 14:04:48 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lOheH-001WqG-GR; Tue, 23 Mar 2021 11:04:45 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7040697-d243-4faf-ec83-08d8ee049eca
X-MS-TrafficTypeDiagnostic: DM6PR12MB3835:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3835EF0491C5AF4ABEA929F1C2649@DM6PR12MB3835.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EgsPM3I2B/VHra/mzSLUs5jjbKFwbeC+02b+xfRO4krLuQPqXBb+JM0Zv5NieUH3y/0F5AJ/AoNkzVieKakhxhYDBhmDS1RjVO0vyC+N43Jy2Z9Yuhly3JuKXbonHiVzWKtfQIpzGHVO7Ifxu6VTXsRdIWmVNcvpom03XdKdVAwK9hWnoGksYb9V9etcwBXZD2X2BKjYdaWBiZw/ZDZyGBi/PcwT2c8ndS5GQxMj+yn895y4IZyEpEgURLyNzEMvr4dlDUrNdkhZWburIZdvEaFuuz1Uw/AUPiARO8zlSW2qNPPNosV/RwtqMVilWKVvNIThTNPV9xi6vvyCudiLdnJZqq8JWgX7kmCfqZEFMxDrX4TcT2j7KnFnZkNZxi28rmib3X/DmnlC2WW/l8NmKRzYWWcFKXfZCbYIa+23se9dfii7obNEJE0ZFy8akffyDnPGoN7fDAc4Mi+P1WpEdXGvwc+ly2kCjiSuuWTJplGClG3LyWsVPb3jOIE7X+TW6M8VLLUMM90D0KJN3wC5kox9rY8jSL9zs1SurDN7YQc4mnhEpkP3AxfYp8Ev5Cg9mCOs/g8PZMa2cMLajTOKzcKF+PflWrcenWGY7mj4/wsSvJSwL3nWwXJomUS3WkCE+03mlWl1WCh+K7jsEi1V4B3ujDcqLhcFOKxcsVls/H8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(136003)(376002)(396003)(346002)(8676002)(8936002)(66946007)(66476007)(5660300002)(83380400001)(66556008)(86362001)(36756003)(1076003)(478600001)(38100700001)(316002)(4744005)(110136005)(2906002)(33656002)(2616005)(426003)(186003)(26005)(9786002)(9746002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?QGXeXfzP+pakNxGktm8/n3cbpHnGDyHJ/RhiPmaP8xh4K2tNaw9K9AXvRnNk?=
 =?us-ascii?Q?I63usaiEbjmSPu8FUpRYG5fB0KXHi4jpthKocZ1c+3NzFFvFDRzjZAvNK2M8?=
 =?us-ascii?Q?Vms77AZlCHTvD89JJhlp4LJEE5v27I7c37n+dSkfo3IO8zJGLUgT2gzJD3Jm?=
 =?us-ascii?Q?XC/dLmkWRPOOkgS3ucSARQIN3unbGu1KSe2Q4bkqQUJ+gw9qCX3V4xw4+c9G?=
 =?us-ascii?Q?rhmRx3FZ2J0my5gi4uuNDjAyx0WCNC1AnE1KlDcMgEHCo423hkyLTxxm/vvu?=
 =?us-ascii?Q?QHhZ67WJ8q0FxStT8UhdifUDYVDn2DhrBsUsCCK+sSVVQiEjgkbW0Imqulp1?=
 =?us-ascii?Q?sjTKdzfvZq6tQWxWKcEKzo7cHmTenz41whppopihu1p8ANnhS8/Sr31bpdP0?=
 =?us-ascii?Q?iH8XS6mDkMTMYGRMhUWkkwfi3uMXr84cU8z3JcNb/Hyx+W9XjTKRwafyLSWq?=
 =?us-ascii?Q?QlW1p8QI6eXBT2y6nVP7tVUcIhJJ9DcuO9Zzy7gsOP7KQ5eAPQ0sX/jHSuel?=
 =?us-ascii?Q?LsaPuUZrW+fcPxlENxAPDqS8NSg5MzGlhVb44WIEvXzyeuzdnzSyhQjcyfDA?=
 =?us-ascii?Q?l7jKhuOGGVsJTnCCCWvhFbzkAqTTkXDafk9i/jZxMTNOiz8uNgrGwsd+beFK?=
 =?us-ascii?Q?TulDPF8eA8K7NwKzvvYkdwImcT2y+rrS/pLvwczZ0t73/k/OTHyH1ExlgfiH?=
 =?us-ascii?Q?pCbaLYICm5RxJwOkD9vkq86S8poSmENMtKdHlaocOAHuv0AzCjrch9gP2979?=
 =?us-ascii?Q?C7YqxNc2MVVAVqC00W6tOPVSKIN7xvOt30RN/iycWnYY4A6i6Wg2VKUtCTFy?=
 =?us-ascii?Q?JqXp6LJwZskBGll1CLDWXMuRlMEDVRFK4Qp977CgrU9r9aUOAoXVLkgKZxK5?=
 =?us-ascii?Q?fH5oN9HVNNPMwkl8jyyNMloMXxr0nV6IEA/OUvtvZTuziNdj/6RKQVyx0uz9?=
 =?us-ascii?Q?9u2CgUPvWakqVI0b49CbJ3iHQCd0LPDTf/3AUYQVb14FZXmYMlWk437o59Al?=
 =?us-ascii?Q?K+wWGrJqg9JGThZ+SXnI15TOlzBG7inGAq7RdHqRN2IltQUW9Ml4NV730O7v?=
 =?us-ascii?Q?kEQzj/RVKeO42NqaNgc8a5HSJ7uVxj3t3zN3dd8r9788vPMQTKGEvqCf33+b?=
 =?us-ascii?Q?k0hM0pB6upSmcAembKoFYMJt1psQkK9OSURjWc/oE6FMHJ+tOfbYnr3ERErG?=
 =?us-ascii?Q?4XL3QpmSIgY5jLC1hqdB0zd0qCwbs0g+36GeF811v5oWaZjZ5jOoeicoiOyp?=
 =?us-ascii?Q?EA/8B7L6tHFBVa8Z3UPkxWSELslq8+r03RAPg7XLHIS35Br2KIZ09c6gLYTp?=
 =?us-ascii?Q?Tf8W9ElcwcsLLfvInoNgVk79?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7040697-d243-4faf-ec83-08d8ee049eca
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 14:04:48.6372 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hndx7bJ3AVR2hQsWqYJRpjb+4OQYXdSZDaznu9hbXlJrVLshRRm7j35GaxlSFcjH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3835
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 23, 2021 at 12:47:24PM +0100, Daniel Vetter wrote:

> > +static inline bool is_cow_mapping(vm_flags_t flags)
> 
> Bit a bikeshed, but I wonder whether the public interface shouldn't be
> vma_is_cow_mapping. Or whether this shouldn't be rejected somewhere else,
> since at least in drivers/gpu we have tons of cases that don't check for
> this and get it all kinds of wrong I think.
> 
> remap_pfn_range handles this for many cases, but by far not for all.
> 
> Anyway patch itself lgtm:
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I would like it if io_remap_pfn_range() did not allow shared mappings
at all.

IIRC it doesn't work anyway, the kernel can't reliably copy from IO
pages eg the "_copy_from_user_inatomic()" under cow_user_page() will
not work on s390 that requires all IO memory be accessed with special
instructions.

Unfortunately I have no idea what the long ago special case of
allowing COW'd IO mappings is. :\

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
