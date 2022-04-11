Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2D64FC085
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 17:23:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01DA810E26E;
	Mon, 11 Apr 2022 15:23:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2082.outbound.protection.outlook.com [40.107.237.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B973410E10D;
 Mon, 11 Apr 2022 15:23:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HRg1s6fEnl7y9txVGnOzW7pT5dn19G86p9em2etbtgk3kc1Bo+MWjIEx5wAaauhLgUUAneXNndlGOjGGrnnNaq2K7UgK4iywAEe62d16Tv2mJ5Ip1/WugpzoGATgCTFtceUf/XNVWz1bSdkmHnJMk4vszWQ6Hpw3vpx0ugbaNtNQ2l6xSiX2aWuA2+wE8MC3zqngequniatdUY+jQYkzq/mEAfeCifHq1rexEOGy8+0CDgiSbfmnud3YwpNIdx1saKj8EwXyWoUdc7W+CLpzSxqeWrj5w5oiHLq3Q8jxqN7et3ArHlSqTr2+hm2l0E+vtafrOioSgsrWgtilTLdwZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUrO5ENOoxXySb+EmccEluhPuv3N/Zhbj/ac+d5egDU=;
 b=EOQsEjcDa/mhDqPPoeSWXz40/CmvyfD4OTOhfPIkY75Ql884nkChAYrf4A5rDZcq/Y51OkEbA/MIHkIVAizAXddenGVCty82HXqkNgup5BBG0qbnQKjr+B62F5B96Hi+u0d7rBIkKTIVHHtwnmgDXbw/OEE6D8xjEFXVOmf8kvqVets0soa0eRHOvTjDnnaa4nhkkYKkuyV2yGBOGrbxDXvZg121W11KCIK8RCvoVzxvjFBdO/rS6k1rZgJRwzRyZyciBXKCZnsUeTSp8jOI/eU2rpbrnTjNLh4gxWAPKn8+Ka6LtfCnhCdEQXFKjnHSrbJNSxoE6FrYcpPssFJ5UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HUrO5ENOoxXySb+EmccEluhPuv3N/Zhbj/ac+d5egDU=;
 b=tyvFSxKwNGCJmWqwqAdC4364VNmAtAyWp/+tXh//BkDt4TdV16Ii8xMrpCaCxYQ78Fhk/8OYIt7Xf4Ym74SnJw7yfC7lrorExpF3BZE3sSmtMGOCBDVU94PQLrGBWHPUzoEd6Vl0OcTmNfZmw6w1S4vsv/UmuXbYOdP1tV8NN2f91O40cZlxmROJymbR3koUOKVP3KpyVXINV1VZYjOReLq1LOeLuzHzUyUqXhfcQAJxbS5TEqHH8IgRl2RFrjq90xNb0aqDR/U82T3ocblsF+o8Or/JSBMk1FiNU58Vn4ZL8glqbBoz3ciBOW1LHOu7JSVp3Xxr2AXnK1QFZIzFOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DM6PR12MB4105.namprd12.prod.outlook.com (2603:10b6:5:217::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 15:23:52 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374%6]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 15:23:52 +0000
Date: Mon, 11 Apr 2022 12:23:51 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 03/34] drm/i915/gvt: rename intel_vgpu_ops to
 intel_vgpu_mdev_ops
Message-ID: <20220411152351.GF2120790@nvidia.com>
References: <20220411141403.86980-1-hch@lst.de>
 <20220411141403.86980-4-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411141403.86980-4-hch@lst.de>
X-ClientProxiedBy: MN2PR17CA0005.namprd17.prod.outlook.com
 (2603:10b6:208:15e::18) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e6745df-830b-4d50-78f9-08da1bcf48e1
X-MS-TrafficTypeDiagnostic: DM6PR12MB4105:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB410567931BF39AFB80257519C2EA9@DM6PR12MB4105.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: emiixFQEIUgJbheNzJLbjR+zIMDR0lMTzM1AoSjkDDrKOays2lpWhv3fjpMFvndVn5JSl2oux4t6kwZSnRRNuPSx45PgMhSAU0ue58ZWWOMuPV4MBGj3b3rwaQeTFYwKaP+wvI6hEm7pVbbl2YU+sc6ez9BkMEw3UNC3JjcCK6NoXaTkNSrIe7LVruc3uoV4dowfNMjXl/HiyMbGCgvzb1peuz1kaMsLzE1oZnauFVCs0xcc1CS3A+KIY80Y1vC1XHx7UkX9DhTKUtiOOv3lrSGpBV/KlLk/NuICnrM9IwWGX2XcsUe+AaqhK2id+bUWw+CG//CSadW5IG0VVmF6+oybCNOkM+bZcNKUsyIGUsvHvECezqzsjoVAnFLoA4scvzl0eeB+KI4fD4pn2B+thARdWvoxyfCGaRw1R+lnrtVkPtM+8FzsXWY/i/g8bryBJZZ4kCsVMlAWurSQo9Koc3vyYW7yIkq+f/rONvUXHq0YEnVNrgad1kUmO2awK2WLQlsWpI42V8acyCYZF/bUHnOD8W2UiRTSzAbrFkxmone4n/3+OewUj9VaCyl9DCfC8yB+rxfEdbBufBkeGIw54P6B+WAA+qfUXJxRApkAzqrfwTZhsV5umW6NuCfLMRLzfFnV/C0OtREYblqm1PGXkQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(186003)(26005)(66946007)(6486002)(83380400001)(86362001)(8676002)(66476007)(36756003)(66556008)(1076003)(2616005)(38100700002)(508600001)(316002)(6916009)(7416002)(5660300002)(8936002)(54906003)(6506007)(6512007)(4744005)(33656002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AvNeBYYY4mX8F0eYyQT7e282sxDRD0l/E9gy04vb2fODDAGRhup8CIFImz3d?=
 =?us-ascii?Q?74GdxOZLzwDuJoxEQNJMudMpsCVFPTJkRftatwIvJeutMJ/AvjHl2hv1NmCG?=
 =?us-ascii?Q?YLvDHYMr8bBY1bIpPTf5ia6XGxWVJi+HC/znQO824JVcgADU7AP9XdojmCdK?=
 =?us-ascii?Q?qE9tueHe1F3/cPmr1e2gw8owUV2ROSX0o7FN8bsri//BjqFy5aQ4O/u5HA2f?=
 =?us-ascii?Q?BJscarJadL01VkWcgiLCitbYU1MtXdpQ2PPUPjuHIFYshWQ4O6GNMkBGagM5?=
 =?us-ascii?Q?H8xHu/zi1VVnx7nWoRJqNF4UO+aR7JYJNt0gSvpazQjI4s29x7/1SfLSz5RR?=
 =?us-ascii?Q?6Z8OAp6wOegvedwAw7XLhE8yiivUZNpyxTehjnYJCkCvmUoRZt5B+RLqY6lc?=
 =?us-ascii?Q?kLUt47seUy9SvHEMWO1KsWKuVZ+6E1I7GmeDp6z3mYf669DuYFpd74yCkDrj?=
 =?us-ascii?Q?Ct08HMcfmR9BoGyPVGzwmu7D1VuEL/77biNO6brZyvedMgVTqjsQGjYnqqSX?=
 =?us-ascii?Q?huffS742CZcgI5nTOli1uAXI2mh4ty1mfI7fcKub5UlXeZAC6CFnm0UHqcju?=
 =?us-ascii?Q?Mx90yAH+nMl0c3+sFb//Rnr6Ef5j8Rc86D0te4dtcvasFokMSL8/LSYCoQzc?=
 =?us-ascii?Q?2Y0WFVJV6xsh8K5zE8NowfbsuJOz8uq8LN77Gk01XiA2/CdIdXSJqcMkH2R9?=
 =?us-ascii?Q?yansEYCqhmn1Ps8VFHP8iLp66l6yjn0mVBYf4cIulDT+icgD4Mp9xFPCKm6y?=
 =?us-ascii?Q?ZdMSkCfNuDfmQ/qdp3DlSvdtwbP83hVxsoz7u18kd2HKzbcHDfG/ct1QBaEt?=
 =?us-ascii?Q?x7OJRCIPNn4MikcNjxrjMPI59DdEtZEY9+zJbYYQUyVqjPbYhHLMa3oF77Wl?=
 =?us-ascii?Q?KW/NwaZnClbYKV0LR5qqTdq5vUBlPmsNJ4PCrTwkaGnJsL+aQ4mRXY8NxOsj?=
 =?us-ascii?Q?j9yD8KbH34HtxSAJvpU/qJxKZ5qwqAd+I0JtRl1s9vlaDZ16I7IIJJvRGI1d?=
 =?us-ascii?Q?54HWwPy8V7N1elMGtfrg2Tw00FGZPY+Jom6R/Hi0fE8hrV40KP1SZmdFIHpP?=
 =?us-ascii?Q?LlEWXpkIGbfqN6S3rLzmDaH6KMQgeh5hZwUPrbP4kCeYCe9sY0R0c0z2gWfF?=
 =?us-ascii?Q?WzQLLbjHb+SfIBdoO8UZj5PajWCBXGhJGynxTARbNVb5tIqB+NEHyGF7o1L4?=
 =?us-ascii?Q?lTITBC39wu+nQJ3K8gYPcMjUUxB5zKvUUA0lLs1twIpViT/SdvHW/Albojjr?=
 =?us-ascii?Q?sxws/Yt+bhQPbFeGUjzWJlXdWNktfO+8++qeGQfD9yb6EHBe1Gp9vPNktCmC?=
 =?us-ascii?Q?SMxfIG6WW+7Q4ab4svl0oR393/zG62zkfFEaCSpiX+2tqYhJyl9BKwUNrCOM?=
 =?us-ascii?Q?JBSjhcS0NG4HrsDANx678oIOUs0CTNwS5AjjrymKhl3m8wmXJwWNJibJdM3z?=
 =?us-ascii?Q?RzCQu6GGicxc2yvDuRqSev5Ty51dF2pc05m8oSORMDPYWelUSGwqzRncjPQ8?=
 =?us-ascii?Q?6La2tFFajAmZRSRn0wHq0q3UhC98ex+xhtiGlQoIsmWKgGiMsQZRJWu/pR5W?=
 =?us-ascii?Q?7QWlpRUj/na/GZm2Zs4ZaQukoZLmqJWVG66wtBKOXJQ0yZLZ2MzHzEusKugo?=
 =?us-ascii?Q?nRRhKIzTfdZJedRj3AlYY2bwr9nisYAy/G3lMWM/q636CLmloJ2FKhp4bE+g?=
 =?us-ascii?Q?h/s24FOrpcuT3WgjorYtBINh1D2OnY3zYGZLHu80J8TSJzBYREBPmn0zrhvs?=
 =?us-ascii?Q?XwT+3yHE5A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e6745df-830b-4d50-78f9-08da1bcf48e1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 15:23:52.2512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BvmeFZSjQZ8eUku1PdJCGY92ZthsklbDTShRulSHPtR8P75YNRh6sHZBcX6IFTGV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4105
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 11, 2022 at 04:13:32PM +0200, Christoph Hellwig wrote:
> Free the intel_vgpu_ops symbol name for something that fits better.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/i915/gvt/kvmgt.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
