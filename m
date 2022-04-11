Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0723B4FC098
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 17:25:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A71410E310;
	Mon, 11 Apr 2022 15:25:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2085.outbound.protection.outlook.com [40.107.237.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B48FD10E310;
 Mon, 11 Apr 2022 15:25:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GP6kBY4NttOr763IOv23kOtjg3mmxWoYVn7R+qGNhyAEuEbcF9/eUQl8aV+XOWEHPyEacaJwkM983Zv8wF7vXAwe3Eslae9lRgj8pBnxQMZCpUoryX6E6JWPEE/UtyAJThtpcvVB1KN57pv/sLYdsGSX1zdRpm6/ks13KtaMlfeElkC+YIsxYZHy85HRNxe2UcLkDekn6Za2ZwI/w5tBZoaDm+nNejfMYKnRIsw2w/hoK3wLAiPyGE1FcB3IN+dws8QZO8Pz+/GDn7345qSksNaDY6EElxgobcsIByJVbGAH2MeCBqg7jbB1/lMSUYFr/hVRHR09wAeebl5M6nIwIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LBeCZyekL/Bh6F3m9Ep8MTxKb/TuGMUWVRh0hVdmxtw=;
 b=VaSie8CbH8ePyXpHjVz+ekgSTi3VrHZCXdkbkWjBuJzhKHL9KLygc722IYA9UYTVpMP6WhOwt6oo9YVp9cWwwD2Gmz1Av5PL6+EjniolORpM2zE9M0yXr+WgSo6zPJqPncmYJtDMYYS/Qn+vsU/orjD1w6rbdwAtiy7m/b+fRC1fAICTKd+pXAULOpnP6zo4wMiiiocxDZlOFVp202Txg0ztEy+pcu5UIoeS+tDanfIvzD6HmpOkWVgA5m0QCitKZ4idQ+S+pdKr/rdY/vA0EKuzrW7bO1fRF1OFoIPjT0y8KzgQKL1qG5MhRQZTMwoMjF363HCemSfwq/j+qIHBLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LBeCZyekL/Bh6F3m9Ep8MTxKb/TuGMUWVRh0hVdmxtw=;
 b=O3ddQrFQtp0MadR/OuZqtVcSNK5FoeNky94r8JoG1daHk4SnWVwA3CJELJ9b+Kd+epmytTkFWgrrORptg9xJC36BrfJIwq1QMSTp99vlbvatRWGLEbYRlAwKKQSImJ8eM0Gx2uTYah+wi7pUWkAVXQS0BginCuRtQ4elV4sjdBl7DVVTOm0H7nhlik0di2OpXcYdWKBsh3BN/xOyikWLeWEIkMuNWLJF5691eEFT3hFp6f6m1qDGJN3WOGU0kvWKRaqNaqKqkmMgF2zqQbMyBZf6lCH+OJCaIjoneg3Ze4C4GnSW039YgdaEKYYn5VmfW1phVbcIans3BH9aztJ5Dw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DM6PR12MB4105.namprd12.prod.outlook.com (2603:10b6:5:217::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 15:25:09 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374%6]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 15:25:09 +0000
Date: Mon, 11 Apr 2022 12:25:08 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 05/34] drm/i915/gvt: cleanup the Makefile
Message-ID: <20220411152508.GH2120790@nvidia.com>
References: <20220411141403.86980-1-hch@lst.de>
 <20220411141403.86980-6-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411141403.86980-6-hch@lst.de>
X-ClientProxiedBy: BL1P221CA0027.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::8) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ac77500-be48-4060-84f4-08da1bcf76bc
X-MS-TrafficTypeDiagnostic: DM6PR12MB4105:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB41051494B767182F996E1FF7C2EA9@DM6PR12MB4105.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zLTA+W7pVna2QQzdYOg6C9inNU7CEGqqUlMXw6oRknkPTa4al3IN7vp6jfothVjQ1wuBQlKQc4IRkAalde0Km+x1IJwUb+InRg8UhxgA1JNOFb5nV9aS8+EJ9MkbLt/5aXABo4ZlszdrUJ1/BB6BzzlCounvQ6OgLTLbqSbBEn2vqZD/w/GXOqzEtqvqxFT8auCm91XGRqQnaXgDxsCndI8e+SuP80i7N6Ps7X+V7eUzu1uSLrRJqp6IVTSCsQ3bZ48tRo0ZM4O1sSznSQX9DY3AAFhDW2jpSOc2Soi6PN83F168doO8ulTYl1zhGoAbste7KFeffgxn2ovoGO+omHHCoi32BwEXxASeRahwp/1wsUinmnUOPnkso0QMkrbwJEZjeOHK9SRwCNP2pl8cwZPM9CKaaXaD7FNSp/ECsUN0bf+gKO+1KO4uxh1n4l2Eg7E0A+k/TujRcqCpr9q65VsHqXsCP4K2UYP7MmGsAUxKZwiNjLqxRrUwzmZlIB81w3ZlzChW8gIC2HxzVxeIix9C8NsxxtcOmWZ4/lsNrl+DdCedOSxypBbaK5+ktH4EQuWwERmBgip6Id0SJ8iXSfgaAM/IXxxUWKS31OC70osLne4RA3cP5SDHJZr//Lc5lu+Hxe1YTHTqU01OLr+sVg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(186003)(26005)(66946007)(6486002)(83380400001)(86362001)(8676002)(66476007)(36756003)(66556008)(1076003)(2616005)(38100700002)(508600001)(316002)(6916009)(7416002)(5660300002)(8936002)(54906003)(6506007)(6512007)(33656002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wzPuRw6mQbvzxJOnLSVLJBXySCi6aPKnLEoLxoLpaFcAAkvcSXaoowrQ7RtB?=
 =?us-ascii?Q?zakniJXVB2ZFsoj/tQdeLqMvmC/Z50EaI9ibuyVQ8v11cqhLULELEE/7oAnh?=
 =?us-ascii?Q?fwOcJBrJDVQGUvifd2MYOFn8HEZmtpAqQljn/0r2H3BBb1n6cHMdfL7MYaFo?=
 =?us-ascii?Q?TSwJd+LheC4nY8dxTVvIp2gaUMqVGDTDn3TAxjouh/c3+3yiI4u36WvjiPZ0?=
 =?us-ascii?Q?hdmeQxrKSFa+QS1Y6e7rgVovsHGs4B+G/+fLXdSGRuTnY6coVFKg2FPWlWnU?=
 =?us-ascii?Q?wZUWm/Pv8Q8HTzbuV84ZnrN32NsT3UpzmAmBXy5yx5i3YZnORTAHY5QtSxg+?=
 =?us-ascii?Q?kRWufAdcDni5jN2fiIMXpYDA8stzhoaVrLDiSyT/sH6hqeliX8F0VkX6WXrh?=
 =?us-ascii?Q?dBGnNxSNcc59+l3EPkCNRLf/ooqV62ifZd1ER8+Z2CQfH+TsDUtFdI9rZiGR?=
 =?us-ascii?Q?yS7CE7lfuRPN1Xmd8iWCNPd5Fbg67N/wP06WhJsa+5aV4sRq4wLqzEBjp65W?=
 =?us-ascii?Q?igBZOjgeJbHZcHyBgs9ppaxWQHx+l/TNkBIrPUPIzvdmPtRURpNJBoUWsk3u?=
 =?us-ascii?Q?NFZuIWrDnnZNtP3gdA1qXZ3O4nbPgACA3BrdVOb76wQ2Z0xGA+DgyB4LDkRP?=
 =?us-ascii?Q?pchIXYyeJkJ95ZOVFizr5lqEyU2cJeDEuPjIhVYvzwPY1mQLsmnvTmPXrm1G?=
 =?us-ascii?Q?xvvLQAd58IQXgm7TWDZuj0T87kxS9dtHAaAhsNfAu3wilZos7Sk1nzbdCNhv?=
 =?us-ascii?Q?coUgMH68DDDMKIfQzqnxLn6fNAtDxQfkUQU8Z38DowPNPFCugjRNXFzpOq7q?=
 =?us-ascii?Q?m3z5XJZmv4AH2zo+WKfWBVCGwO+kKntGwflNbCI6EU1qmaJPVlfCmOqVhfNq?=
 =?us-ascii?Q?R0Nn8+PZNkavLEJd6iLNlCEP1yCLNWBIohjlgKQujAqAgVRJxvmZNMuCGwmV?=
 =?us-ascii?Q?tUVVb2wNKH4yTCKSILHOmwv0h/XdCyW3oPKBUm1hMDGdUy3niH3wsg3pp+Ao?=
 =?us-ascii?Q?MbgA9gFNzSkmzBpCL4WBDIAhBy7ducPl41kre6YD5qL9ybHo2bQNrFYJzUzj?=
 =?us-ascii?Q?oiB74CgBBQ+Iku/6RGMqUKFScHNQntqtMEV96ueEOPPcSOF1o6K8+ZWoM/ZC?=
 =?us-ascii?Q?wQIfvte/4/axw7GZbctVsOO8GnD2xXfcicsPkcpGMkVbvpcD7KoJdWD3uy00?=
 =?us-ascii?Q?I8RpH5dcGhh1Kdt/E5zFNk8bpdKuX1XYPZ1egUmlRfDSuULdf7E/h0QCCpRg?=
 =?us-ascii?Q?AW/MY9aKckXszeXJIXMNflD/+84jlt6EjnRVBtl+BMEHCiE0u2QERlx0q0aL?=
 =?us-ascii?Q?Ag6z4VFzfEmdPdydLMHDpZ4GGHO2OP66L23FrCQeVw+hxXwZuHn3BxGSCAOc?=
 =?us-ascii?Q?nXHgS6Dazi9TsG6VmEE74PwuEaRAJvOo4F+osqg4a0IVd2YqP9BGHM+XFsa8?=
 =?us-ascii?Q?/BR0gggs9EYndlIN7K/YzYDBb3naWVqFr7Eymksd3E6xCHeMr01UELXx5k7c?=
 =?us-ascii?Q?vRjMsj6bJY29WpSDjjjBTMcnWXSXEOtYexMn3PzYFAvioRPS6QiVVInuh5ff?=
 =?us-ascii?Q?9oVTjpa4pYJhG82HwEXlplTijBP3bT42EE26M3F9lBypwtSyNbfHB58985ee?=
 =?us-ascii?Q?DRiZS3DNmJ6ThDUD297GF0cvyCHXBZQSUyOVWNw7jMFtvVwfbqmLfdkom9jS?=
 =?us-ascii?Q?nIbEvcwC9OJXKH71GqN2a8L9NlljukAMGFdedbSIWIlYUJDiKwyKR0SxNp+k?=
 =?us-ascii?Q?gpGryeQ5MA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ac77500-be48-4060-84f4-08da1bcf76bc
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 15:25:09.1374 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KNImqD7L5nX6ia+s+3n3m6fZLbSw2hi43IqDcMF8T2N+DNq6U6k5SaoXx78El1Iw
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

On Mon, Apr 11, 2022 at 04:13:34PM +0200, Christoph Hellwig wrote:
> Match the style of the main i915 Makefile in the gvt-specfic one and
> remove the GVT_DIR and GVT_SOURCE variables.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
>  drivers/gpu/drm/i915/gvt/Makefile | 29 +++++++++++++++++++++++------
>  1 file changed, 23 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gvt/Makefile b/drivers/gpu/drm/i915/gvt/Makefile
> index 4d70f4689479c..f2f6ea02714ec 100644
> +++ b/drivers/gpu/drm/i915/gvt/Makefile
> @@ -1,8 +1,25 @@
>  # SPDX-License-Identifier: GPL-2.0
> -GVT_DIR := gvt
> -GVT_SOURCE := gvt.o aperture_gm.o handlers.o vgpu.o trace_points.o firmware.o \
> -	interrupt.o gtt.o cfg_space.o opregion.o mmio.o display.o edid.o \
> -	execlist.o scheduler.o sched_policy.o mmio_context.o cmd_parser.o debugfs.o \
> -	fb_decoder.o dmabuf.o page_track.o
>  
> -i915-y					+= $(addprefix $(GVT_DIR)/, $(GVT_SOURCE))
> +i915-y += \
> +	gvt/gvt.o \
> +	gvt/aperture_gm.o \
> +	gvt/handlers.o \
> +	gvt/vgpu.o \
> +	gvt/trace_points.o \
> +	gvt/firmware.o \
> +	gvt/interrupt.o \
> +	gvt/gtt.o \
> +	gvt/cfg_space.o \
> +	gvt/opregion.o \
> +	gvt/mmio.o \
> +	gvt/display.o \
> +	gvt/edid.o \
> +	gvt/execlist.o \
> +	gvt/scheduler.o \
> +	gvt/sched_policy.o \
> +	gvt/mmio_context.o \
> +	gvt/cmd_parser.o \
> +	gvt/debugfs.o \
> +	gvt/fb_decoder.o \
> +	gvt/dmabuf.o \
> +	gvt/page_track.o

Up to you but I usually sort these lists

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
