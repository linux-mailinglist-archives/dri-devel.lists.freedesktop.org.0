Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A428BE178
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 13:56:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5368B10F5D5;
	Tue,  7 May 2024 11:56:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="EAEf+bTE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92A8710F513;
 Tue,  7 May 2024 11:56:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TSTANVqu7nLHdfeJjPn+ptQRnAj7FZ6q/t/HQ1roZnPuvIUcrhZMP4iJ1gPBg1IUyS9e0xxnRs+KoaKFxu2AN+e7PkIOojw22wPkQKlyQwIpiGjrnGkAe8Beb0DzvvXFs/voubH4wgCmJ1ZkQv4x6Myu6lC7uNVT1lX8b0uP963Kx/gwCX5UWcZ2BySWwcY95xt3ndne6XFPZ3sQgB0xVpJZ9RblcOc4mh0Ix1uRBmuUfE6QjQK1673IQo1NDGwwALl2kVnGfZIU4bFfu5TmZuM0IPmH0jaSlYW7WqZII5gzq1nqZDEDa7jwLEM6fwv808t5lQCGc8O8rXS/ptIP6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MNvwELgONuVfI6H9qOk5w2swVAh+aUZ8Ob6qdorh2F0=;
 b=fn4r8jxurqH77D9tM9KrkE7VHwhXklYmK2WPxxOeWP1xFppOFhwp6ZlVYmMx/y1iBHPXG/gCdl444NoHWmbTvnQJl7WqQPfhyeHcTlD1VLr+W6i/Mh+zs+o6oCddHyxh5UWWPQ2d7NI60voNY4EEyxG/OpOlQJpd5dkVdq6+RrvazRZ8osCkWJi9w0S6IEF0a3tC5xfCFNPtjFytxJNhiS/UGSuzpu5HEvjYnuToxeqKUqm5DW3On6FKJwulOE/w4wdssB018idIAMI2qnQ1sMnZ6BISkmf7QDW7wmXHPb1N55drlOtuCm/1J375hSphF9t0W18hjairx8o53WPseA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNvwELgONuVfI6H9qOk5w2swVAh+aUZ8Ob6qdorh2F0=;
 b=EAEf+bTEHXM0OOJlnyFadSaaqfgtobMDkclTm9JrAmgsxRBPZ56CR3kuxlQjTXaSXrt0FSa7jflhDC7xDQLjlfnqeWmb35XDOzqdYfU3rzgWEW78WpGbQ7YuB2Qm+ePrycfwqZPliiEoXKIdeM9R41Syy0UVdUbNfxm9ZJ2mFuXeiVk1Cr5HLe4O3OKXShblZvuzWNkgYwQmcrt2re1LPX4lvqvzZSBvOdfyCOGnvWdzCN+umJ/Y97vMh8zrbbjvpKFMSaMmUijWfp9C5LX/a6j5cMgtulRQ2kV66PaY7bVUzL/5vBvSkDGXJOnyppWdJCtfTRWx6e37HTg/dDAWLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by PH7PR12MB6561.namprd12.prod.outlook.com (2603:10b6:510:213::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.38; Tue, 7 May
 2024 11:56:38 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c296:774b:a5fc:965e]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c296:774b:a5fc:965e%3]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 11:56:37 +0000
Date: Tue, 7 May 2024 08:56:36 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
 "Zeng, Oak" <oak.zeng@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Welty, Brian" <brian.welty@intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH 06/23] drm/xe/svm: Introduce a helper to build sg table
 from hmm range
Message-ID: <20240507115636.GK3341011@nvidia.com>
References: <20240502124632.GB3341011@nvidia.com>
 <0b700baf6fc3d41b4adf6301b1b4dbc4ff7078fa.camel@linux.intel.com>
 <SA1PR11MB6991945628597BCD9D111ECD92182@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240503133732.GD3341011@nvidia.com>
 <SA1PR11MB699156AB3B2603DF1762BEA7921F2@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240503162812.GF3341011@nvidia.com>
 <SA1PR11MB69911B3E675B1072A17A3E49921F2@SA1PR11MB6991.namprd11.prod.outlook.com>
 <CAPM=9tw0w4fY3+fHV4kx8oGUvSM3vzH4KXKFDxg_aqBq4duSsA@mail.gmail.com>
 <ZjjVT-iZvsKrmoaW@phenom.ffwll.local>
 <ZjlszJcn95Ke9e9o@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZjlszJcn95Ke9e9o@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SA0PR13CA0001.namprd13.prod.outlook.com
 (2603:10b6:806:130::6) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|PH7PR12MB6561:EE_
X-MS-Office365-Filtering-Correlation-Id: 801dc427-5d1f-4966-e5fa-08dc6e8cc00a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|7416005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?89Rq51lkW8JZfl46YBJvkL3P1bjtYvgHTuolaUOPs54MXsnFbTfjvNh3svLn?=
 =?us-ascii?Q?7WIqHSoTsgKSrgh4EeCS1+OoZ2pJJ+aop+sR8vTvEkU7Vlej0UI3pyxKPkvG?=
 =?us-ascii?Q?ypnpiedsxOMMph3M3cwV+lWUVZkAR6uiN97QLS1X0QoXGzav+NU4SSeiGX1M?=
 =?us-ascii?Q?/Erl/N9e8a3uRnTTfE689FMLVdlquSf4byuSHvhI/oVeQOpGvw904XIPNI0M?=
 =?us-ascii?Q?0b54gWYmRuRlSvBflxCQ8kebz8p+DsmzVIPxpzPQZKtnw6OL5CY/Q7n+M91g?=
 =?us-ascii?Q?RN07Jfz5ibBr6s31dAHh+c5yeRA7RVhw4PrsWXa2RERaRobYr/nURveQGBA+?=
 =?us-ascii?Q?dWjvqbeoxCpJNqLbREjl0ITR5eFG1MWaBV52awPwO6QZhnwG52nSUI5Z+BvQ?=
 =?us-ascii?Q?/07BQF7UOy6C4P/KE/9Z01/3TFNT42VzbIQCBrDRQGYvxThFNM3rFtKJ2xgH?=
 =?us-ascii?Q?RzitQRywsJ1m8jLEPlvv/PKzEt8I9/LJqZ6qiRb26ta1PHTFObEuE++41O2S?=
 =?us-ascii?Q?+jT0A3dNQtsbw2KIEBtfd+wjcxInzBJK0DKWUqJ043bXFY+ZSWV4eDV8a0YV?=
 =?us-ascii?Q?5/o/2dm6ay8QOFD2Jn9e6SPaiCYAYzj5k0GNkx2yMk8Qtz/EAEhBj2ZPH/g0?=
 =?us-ascii?Q?eZPzb2HxXYbpgsuFmvE/gUaO/VH0MsLYuUmP4n+ywuMDGxzLSzXOYZiux3za?=
 =?us-ascii?Q?IY+o80ycLLmKRPJ0z/zxAgd4+QWAhUgz/TV3hxG8ea0SDHBybzwLVsYxaTs8?=
 =?us-ascii?Q?Sa+4FTw6FGFBXKgJVi/mezN+8UKkYiH8BWh/Jec7DBPMcdGXiMWK5xZtFriZ?=
 =?us-ascii?Q?5+drOJwE6AjPYVnAJHGlmUip2uJ/iy1QPUKLgarWrK+4mJUIdonyjj9WJUos?=
 =?us-ascii?Q?8lCbk24dKN70TK65eqeu7xhaI/cD8/eQovopbpRg98XVqXZYRFsW6LihoP9n?=
 =?us-ascii?Q?w+DLwId+pSf34icujd9jFrwxywJo6sMopQCOGiAfaJVl7/dO+VcgLrEYOP7J?=
 =?us-ascii?Q?EywIuqrSIWXILMsCQSoRAP4Q3nGJx2kvy00FDMIm048G53i+i+djFwt7qzMq?=
 =?us-ascii?Q?ygDu36G/xnj10ZD5pv2YtDPKl1Q1YYJ/G6tpocbTWD5KiV0mexJToNpubTr3?=
 =?us-ascii?Q?sMvF7FJGWjnVGMv15acK/o8Qfp5rX9lmGb8AqwH1BKcSF6J9gKf38WFtIs3d?=
 =?us-ascii?Q?nZi+9iRwny347NIDbicJ/o+H5jbFvZFnkX0gTnIl+D8IdILFpmQkKh+8IZVn?=
 =?us-ascii?Q?oD9QDDr59DUyCni6kJo8fcIBEpJZxQT5X4/k3SvvaA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3849.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(7416005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wMzCVwmFqjU2TzT6WvnTh7n5zUb1PrLrTEFSC/+o9YMZ5M2C5dN2vm5SJnY9?=
 =?us-ascii?Q?z/91wIKegq+J7DXSzvTECe/8Dl7vsPJ0XCWY8kN+3TlYCr4b+pZBw3zZ8NQh?=
 =?us-ascii?Q?30BsZRrqMfbVWTdoau7YFICZo4wGHPC1qVqnQYl7kkZ0JF/5XwWFnm+OtudJ?=
 =?us-ascii?Q?7Y/ozdNeD12RyaKGJSZGuUVCNeuYItREUtNpNEMWnMWeKOpXtX7eY0xkm+zr?=
 =?us-ascii?Q?fskFK9jB2NNUXuaLdJ+sNXmYvC+1KmzSkuV4JKZbSfeGjIpLKzVmALowEMwu?=
 =?us-ascii?Q?p1xepdQcg+xG3zGEK+uZXw9EmPsrv2IHpFAF8Z5HWTW/aL3rjPNwpAn3VNse?=
 =?us-ascii?Q?QnvfhnwbyEFh45bjkhHllwitZGxFKTqMOYMKE1UcdHODVFTCUtKilzuB8oB5?=
 =?us-ascii?Q?5tF3UFrBVgBo71Y8LXKzZfNNGUCXi2ctZY3k9hA3cFW0aAXaYZl2Dgptf1s6?=
 =?us-ascii?Q?jG8SOozKCSGHpRwTKR+aeyQ2oGfRfFSsxQhH4MANfXfxVYEV6IbcTnDTAqfr?=
 =?us-ascii?Q?8mzSjJPWV2s2rnDqnaC9O59EwZNF+Eb+Fz8vzyb7GvmJhu30UfgpNgNj6L2o?=
 =?us-ascii?Q?A603rCIzePajBm4f+hWJUP7wrciULbBhec4oQDYXbzxR1OgKtTP393hRaSeQ?=
 =?us-ascii?Q?CUnP+OziSsVwVqyR7N2eoioC9honvvIVts1yUVBjnJpTeZlt/q8hNO+OZVgj?=
 =?us-ascii?Q?j96+9DKeTxiEXWnK3hiRezTASp1h1njRw2TApl6LWvk2vjC+bN4n4o3lOXME?=
 =?us-ascii?Q?YJroPuCbzLujR7CshBj9IrnAg0bSNqzjXfX8LbCFAC55L5K2Lh73q5ojVbcs?=
 =?us-ascii?Q?fSKaApMvcdA9ULCZ4qo0QgrYATl/UsT5bJQT6GNWjLaShy3VMArBV30z6hqK?=
 =?us-ascii?Q?UbVyvYIIDYVX4+/H2B6flF03jgV/dZJfE8N6o3vAEESdRYkvN3m2gmxaXzsa?=
 =?us-ascii?Q?L9TgEGmGS0UNqhU2z7obl+lbM5KizvL95fqqfOff6MRd0clUpCmrZy7vlmtg?=
 =?us-ascii?Q?uN3+xLLfQEg0k8Q5+iEfNkQjRFDFBXhNZ3YqX7WGE1sC8+A3qq49KRDdSHoi?=
 =?us-ascii?Q?whGGG/EwXzhRBm1bYrjmJrZGVGgjmKMGHwaxYRi0vpvE3pJ5aNJo3Tq78yZ2?=
 =?us-ascii?Q?P01kU1hWQxGjPxOEGYKOV0pe2htS1C/y9BQdw+xdLjdLW0XGIByGYJ78tz8u?=
 =?us-ascii?Q?22kGUDQ32qVwgvlu378QfjbCUJ2LJG23/1w8xtRPeTbDiqTdARqYiLxNBKL4?=
 =?us-ascii?Q?8xVvnW9lwuZ7CY8Bz+3i9ll1NSdmCuCKn2TTCy/abKi5pZs+sfFHYF7Hunnm?=
 =?us-ascii?Q?t7w8krxFZqtDSHVUqgcRJTcsgwofNHYBJYYN/S9DMFwaotUwfOhk119aYVox?=
 =?us-ascii?Q?3bkYW5RDUsLS5kHGXJknPF4B+QHFo1fuGSmo8Us9OtaahYx8RDC8km6qAyqn?=
 =?us-ascii?Q?6fD8MGYyhjSgpg1sIr4Zz1n+Otyep9+dKDg4HyQDUQJo04aKP3geXXwTMMZo?=
 =?us-ascii?Q?HQkOrVWm81rsc9yH/wISDKFWkpxt4VGJ3WTBamFQ3+bgNoQTUD7k2ztdxUhV?=
 =?us-ascii?Q?XPfOndn/PLRrGP7sXExIKErMURe+gvJ1Zo+sivfq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 801dc427-5d1f-4966-e5fa-08dc6e8cc00a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 11:56:37.7532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CwJ4hi5YjeqbbCd8UfbRnsJtKFZxULVAFDjwuCliU0qks6+jXs4gi1MOcNvt4r6D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6561
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

On Mon, May 06, 2024 at 11:50:36PM +0000, Matthew Brost wrote:
> > I think like with the gpu vma stuff we should at least aim for the core
> > data structures, and more importantly, the locking design and how it
> > interacts with core mm services to be common code.
> 
> I believe this is a reasonable request and hopefully, it should end up
> being a pretty thin layer. drm_gpusvm? Have some ideas. Let's see what
> we come up with.

It sounds to me like some of the important peices should not be in DRM
but somewhere in mm

Jason
