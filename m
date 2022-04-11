Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F694FC207
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 18:14:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5492010E3E2;
	Mon, 11 Apr 2022 16:14:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2066.outbound.protection.outlook.com [40.107.237.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D82310E3B4;
 Mon, 11 Apr 2022 16:13:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lNT4rtWqupdIohfLw7NtkvzBiv1C+3RTjU3IbVybXgj8PTLBpWt9Nm3iWmfaxvzauDk6BzqSdtj+bNawJNpWNwt22jVA46yMHIrLCrPUP42EfCQAdsiS56qizsCMTPDQC6Twh7IyxiPgzBagDeQ8YPobVHyXZZdKfAckO1s1ta7/ZqQF0oIOuMROrwNyFQune9hYtue3w+EnuqAj7rwFLMOFtbLWoBsrNvvXke/OL65rBHacbSbWf5skk8u/vDfv/x35/UuDxiRRmF2ofk7iuMntq7urp9WviFaLxPu00m3QNx67sPqBY1ZHGlcvnY1xYALNaDDEvl9bWc2BbAxgyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iITXhDYtu1FB6SNXWz2hjHUWSMFNTY+zkMbH67WDAQA=;
 b=IxCPSU4p4bXxQjWLWKiq+2425UIttPUiOs8zD8TZsrqQ4VhO0T9meL+Jcb3OILR2EL7BXj5cufG8OEp9aK+EO5TxLIgCMtHh3lehTOCg9Ai69d+Vnf2fmNC/Tago5CG2Hb1/ePwWbmjeU5bVaCL+G6A8s+CU++ZaWlhaqk4B1uS4NdyVlOEJBtB3Glw0v402nbtg9ARkvEWt6dAMnmUByTVObBiau+fQmYy/DUBDcdYrpkUIQ3sE25/gWbkMbICTWBmt0Fs6F30YeYrScYT+GGztfcYZo112TGlGvGr/g2FvYeNX+QO3LrbBU1zQCTGCqAFmzLtBUIOHajNrnMLEpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iITXhDYtu1FB6SNXWz2hjHUWSMFNTY+zkMbH67WDAQA=;
 b=nYz5DTOvsSp6I4FJN5c/8sVzjBsZ3T76hSsWflosdVFTvRgEomvZ+vVy/SEN6l7Wk/EiuUxz2kE12UmkDxPt8BMs92Z5a6s+knRyHPz8T7e8YxvixXMiXU5IjsqGAivNVP2UBm8k7dFsRK2roLY6I6DO7Jl9HeDuNNAogSF59XxXuVlGO+qpy12rJr0hlNryJB1j0nSN0iiNxTnvCN0dy26op3MLM7BuIgsNRdiZKU/0puiFSMU4lFXrTR9QwFkIx2zN4s1mmFoHNHCT9b/U0nRjdESm9rxr+mqGBMDkQbhsORSHW+lFgUFZHeVAFYJxFZJ42dJnUjyM6b3QEu1Hsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DM6PR12MB4619.namprd12.prod.outlook.com (2603:10b6:5:7c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 16:13:56 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374%6]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 16:13:56 +0000
Date: Mon, 11 Apr 2022 13:13:55 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 11/34] drm/i915/gvt: merge struct kvmgt_guest_info into
 strut intel_vgpu
Message-ID: <20220411161355.GM2120790@nvidia.com>
References: <20220411141403.86980-1-hch@lst.de>
 <20220411141403.86980-12-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411141403.86980-12-hch@lst.de>
X-ClientProxiedBy: MN2PR02CA0025.namprd02.prod.outlook.com
 (2603:10b6:208:fc::38) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c753088-26f1-4204-d7f1-08da1bd647b0
X-MS-TrafficTypeDiagnostic: DM6PR12MB4619:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB4619F28C79C472AB9AFD3E8EC2EA9@DM6PR12MB4619.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1XHWrV5aICV3CNatpoQUbpZtSRKRgEneO1AsREd+1Ov+/sR9APlcVSh6knX/ek+/oF7K65woxBeROpdPvBR0RQSA6orP+laxmyn2DD0e3I2q57zIJpI8tWO27c4u6BL8cvKxDaX6LoX0rbI6Ksa8Ei/Gd6s96ldnJkwUPxfvWNAnSXOowCk+ZWGCC1/ZGtsKIZOfA2llevdnBrIbpR5M99xrP2FE7gYky5Hy704lMO+a++0qZ8lbt+eaR88mBGAkJ/t/LIjDTd4iHLcZXFW2UhEjd+6Y/jRaRiy225IX9ZHAOAHxSJoCgOktot5wkGdH6SDBeKEZgKU2Ax98vYByVps0Max1m8lBsXEVC2RCLXKOIbXeUX566F1u8G8rt+PZ2U2VUy+pGPfhtyyd7DZ1SCjXHPTcBiUXNWueQ2pa4p2J9dPgLrL3LuwiG6LC/SyJordBx+MPSx2MhCZLpJcMdHlVKo3WgoFJppWNLEhRXHEU/PQ7ul2SW2Uso0ne9s+ymW59EHyy4h1bMBy5CfbDAxB4OLn6+BNGJBMD2djn4CLl7Wtc3pIJUxREivFzQ6UOYvnWZLi+zwEyALAVB8+Xlrq1GS87HvDYjYsLWNA6kPDYJZs1nKnzFJT/POwRrmbqjQEW/dkzCSWiuLEWIA5KUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4744005)(38100700002)(508600001)(6486002)(6916009)(86362001)(8936002)(66556008)(7416002)(5660300002)(4326008)(316002)(54906003)(8676002)(66946007)(66476007)(186003)(1076003)(26005)(83380400001)(6506007)(2616005)(6512007)(33656002)(36756003)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Sx46m3dzqIn1jtQme67/prDWldSz8EzE8Dl/IJ/xsAhxNTQ+t1RmTAciJ2JQ?=
 =?us-ascii?Q?/PpbqtArZlJNw3mSEPGtue4jGboBmSclDPP3Ywi6IxXGn+Xmx+3sr5mNkF2H?=
 =?us-ascii?Q?EnJwaAPUWGoD9vrOzaGj4v9H5ZcJ0Uu/+V3ISIpHlJwDupCbhtAIMAZGohjD?=
 =?us-ascii?Q?VSueNi0nOtFcK3bDWxGEkG//fcJyd9NGBif8Gt/ruVF9KuvS9barAwcZjZ/V?=
 =?us-ascii?Q?Rk+ZVt0iOP1IAWxBbWCjPPK3lUJcLvHk11Q+TuB7BRgb+z1V2I5c1yLEi7gj?=
 =?us-ascii?Q?g1HisxkcwnmFNQvbuqwhNsy0pCpdSUw/OtqIanb29FHrvVJB+kZMNRYTiHSD?=
 =?us-ascii?Q?5WRbmcOi4dJDYne1JthYUGPhBXoPKiiPU1wa8YJwQhbBwLldiDhCF7f6naOY?=
 =?us-ascii?Q?C/PD4mQ1owVXxaevLG3UKa02Uq0ocLu8YgoS3Qw3Hagi2+I4RpZf076aZyLm?=
 =?us-ascii?Q?kkAvz2y717OjWnglnvaj+HEzJxoPWr333gZLdZARepEKIQf0YqzLVd8LmXt/?=
 =?us-ascii?Q?2mq8ir88npMN0+Asp37vxOGG2c6v8ECTUvXSu3OnCM1rKxdNZG0rJuJ25QJQ?=
 =?us-ascii?Q?L6+bz/YrnHR1nH/lwOQIPxZ/TOLn8Ranbv4zeCcF4oVsUSPE30+h3Q7HoSbm?=
 =?us-ascii?Q?GcMHHY340sDkABQoIP6dYFIHLCoFQpo0I0o1lhbJ4QBy8WGVLHKxgYKS0XoZ?=
 =?us-ascii?Q?da4TmqSY6LKPr6smq2lz+2qlxTYiVRfTfw5UhuWyki8BkK14i+3ukyXNo56F?=
 =?us-ascii?Q?ncCgfkb3g0WFspjjSZFo0yiV1VvKq07WWogbLSeURC4lJ3fgoI3FoInN1El2?=
 =?us-ascii?Q?O90R8TwEGCK0HJggZWmPRE4HCjkBRYM1F8SSWeJomuw5MF8SS1WToULxonMP?=
 =?us-ascii?Q?C11hnGnVr28iPKH6Q+qUJaOaB1FcTLShJq0gaN2WYZWNu3ecLVFoYpGtsekG?=
 =?us-ascii?Q?AmKtxMUQpGk8UQjGx5Uk3pi6fNJXjrfv3icIbjZNWCMm4CrKYYE3IiFeCNM9?=
 =?us-ascii?Q?hDbLeTrtE0ocPwWDZ/WtdFfnPtyLVyntzn2LowSp+2O4PUVlKrxdjDfh7zt9?=
 =?us-ascii?Q?g7KgQfRE1iKVD9kVBTU0e/y3DGYeZGr28Efc+1xwMXALxdQ4fEd6XIgJ656k?=
 =?us-ascii?Q?rJERUMWb4R/PhHn8pxMbCHEdv1xafs2yuUrHJaTBS0VMyXXB+aGNvvF4Ou7x?=
 =?us-ascii?Q?bgImFT4kLFhLsLwq61GosfeVeVYytSwNLLkP3N8SXcXWA0NZsPuoP3nD/eBo?=
 =?us-ascii?Q?kVXzsmfF8LI82kq8J33Vh8ygGm5WPAxd9NfI79RKsx+lh6hBIiE04oKFQwKq?=
 =?us-ascii?Q?ilbWyAE2gncPSamFRGoNoy9XgFTO8R1ox5eo6cfzktZ03UlsGzugavKIaq+s?=
 =?us-ascii?Q?vSTgsVW9lBVXKc8GuKNyhPAJcC/TvTscwcdKxaO5ky2WyY/gm+3i2HESy3HO?=
 =?us-ascii?Q?zCoFkodyMqRoppE6o3s0O42aFuYPLvbGKH6jvxQ9jA+1Yyd+PM27Efpur9Zo?=
 =?us-ascii?Q?FMnaB2tnmT3rlfFFIJtW0nzFhxtrDoEq39F8X/zfZUpPofaksiwJwZ1vooiI?=
 =?us-ascii?Q?87DhT9U707t46x22z1n31ZNtqXF8YdUIZIXOUaqlKzrZEPMb/ds0swyb3k5/?=
 =?us-ascii?Q?kbPAtyEMs4/km/ZjrpzKUKVEADisgbvCqrUTm4/5UYKFH1ljHQ2h2cX5Wvwy?=
 =?us-ascii?Q?hRRGud8OaWuhcPkMoFu+gtUwmeB+Q13O3yGks802t0rxV7KxfRMtnsYpJ37C?=
 =?us-ascii?Q?58lQGbnDvw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c753088-26f1-4204-d7f1-08da1bd647b0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 16:13:56.7475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vVg2qnYAPKmdKKYaf9yRbrOuJRWB0PKbMee2pTspBbCmvg6tcooXfks5Gum+VWwC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4619
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

On Mon, Apr 11, 2022 at 04:13:40PM +0200, Christoph Hellwig wrote:
> Consolidate the per-VGPU structures into a single one.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/i915/gvt/gvt.h   |   8 +++
>  drivers/gpu/drm/i915/gvt/kvmgt.c | 117 ++++++++++++-------------------
>  2 files changed, 52 insertions(+), 73 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
 
> @@ -236,6 +239,11 @@ struct intel_vgpu {
>  	atomic_t released;
>  	struct vfio_device *vfio_device;
>  	struct vfio_group *vfio_group;
> +
> +	struct kvm_page_track_notifier_node track_node;
> +#define NR_BKT (1 << 18)
> +	struct hlist_head ptable[NR_BKT];
> +#undef NR_BKT

It is what was there before, but it sure read oddly..

Jason
