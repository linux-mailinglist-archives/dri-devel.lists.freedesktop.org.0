Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E81BD302129
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 05:36:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A14A89F06;
	Mon, 25 Jan 2021 04:36:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750050.outbound.protection.outlook.com [40.107.75.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B50A89ED3;
 Mon, 25 Jan 2021 04:36:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ViuCPcSH/SfTEKYTbZhbOGL0MuCewcnhY95PnFCYMaHvTtB7Np9fh49m4FIqsrNMyLEC45/PmufXj+488Yqd0RbENCAawd+DCXjTTbMIapN/Upf/01LODXfdEHumiGaruck0brGiiGZzWB0v579VvnnzuQ73as0VhWOSVDIyUyNgDO2y8Vv055EUrYCy99J9bLqQkTaGqSKFGrLirlHBYqH+VDVkIFnyO0F3RTWen8olWzuL6ls1Q8jOpZYd5BHgSotExOLC97kydMAZeB26NkiZXqgvj5FLd/t7t4cTycQY0gRV6NEZDBgvhvnvbbINBsz9P6/P/ahUNDU18ytYtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CZA83Wl2ihzR1DPW/7eyS+vJ3ZhbzXndw2cgI+/psCQ=;
 b=XCqoNDOyEnXXKY90dFSex6gEDO/Ea9DwQOJ4Z7vE6X1V+UPbu6S0wGv7wXSOGXJiQRZMZ3VxbEOJTIw24hF08Wm4/QOiV9PNP1pauazfh2CcCdHZZCHiAaWXE3jH3e+W6z/AcpXHuP+kcu2cOPlQnO5oMQv7Sl2EYMI/dTa7UCUFOzJkLiEbqc6Ee3hBjxt55MG+PKFOiGdLTYZCtXm6MFt/xGX/guJ6f2HjEtL3r/VQ1JcbrslxKMJkWHBpbEgrWOtUOzQVr+dLooswetVc/nDFgymqnO8U45A6OqMAQEC7HuzjnnXHASEp9Sj5LJWUb1Bm75FD6QFqajZBbz0XKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CZA83Wl2ihzR1DPW/7eyS+vJ3ZhbzXndw2cgI+/psCQ=;
 b=v/lx3T6GCTQ5G0hPgXIRR9FkzkOz+4eEPhVTlpJ3hCTUGersl5hJawwpjLMd90PPCgL8wX0El46EJS6BdhlLTBb2/SWM6x3/t1Bscu8JHvTZwGxwjVuPlxdKEss9vcmr0/ReLMwFJ7i0bgWenwdMcNNaAzle7LqAOEl8RNeDfc4=
Authentication-Results: canonical.com; dkim=none (message not signed)
 header.d=none;canonical.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR12MB1248.namprd12.prod.outlook.com (2603:10b6:300:12::21)
 by MW2PR12MB2459.namprd12.prod.outlook.com (2603:10b6:907:c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Mon, 25 Jan
 2021 04:36:33 +0000
Received: from MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::8c0d:7831:bfa8:d98]) by MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::8c0d:7831:bfa8:d98%6]) with mapi id 15.20.3784.019; Mon, 25 Jan 2021
 04:36:33 +0000
Date: Mon, 25 Jan 2021 12:36:23 +0800
From: Huang Rui <ray.huang@amd.com>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH][next] drm/amdgpu: Fix masking binary not operator on two
 mask operations
Message-ID: <20210125043623.GD610615@hr-amd>
References: <20210122150022.209454-1-colin.king@canonical.com>
Content-Disposition: inline
In-Reply-To: <20210122150022.209454-1-colin.king@canonical.com>
X-Originating-IP: [180.167.199.189]
X-ClientProxiedBy: HK2PR04CA0082.apcprd04.prod.outlook.com
 (2603:1096:202:15::26) To MWHPR12MB1248.namprd12.prod.outlook.com
 (2603:10b6:300:12::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hr-amd (180.167.199.189) by
 HK2PR04CA0082.apcprd04.prod.outlook.com (2603:1096:202:15::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.12 via Frontend Transport; Mon, 25 Jan 2021 04:36:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a7368bbc-9862-4101-ab46-08d8c0eaca9e
X-MS-TrafficTypeDiagnostic: MW2PR12MB2459:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW2PR12MB2459B1D2A2F889C2E668F41DECBD9@MW2PR12MB2459.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HP1y389MylaG27oAEfMUpAK5SvslLgxWbNURiepcFX/9udThDnwXXDAAAINshFGL7QYaqLcXj479MtBPzxa4fHqmJk5nqiFDFBysU+AL//qSjOwDqV+kc3cCf+NpRqpz5++vZyVDLW5M8/WgUbYeLsGkjfIGfZUfSa/1jF7lR8lzoXU+naxUOHz8QI8Uav/lZfl428UhZz7z64h/VvGhDTulO2opopZObCH4QBb030DAKi1CfvE6JBbBN0mOddvgRpEH1+IZyoi5qjIcqkcv3m6EiKnHYdZM4GC60msAoj2Yf6n9dOuTfS7e3NNAhawoOmNQLp0QnvTv9T/Vbx2VNmTiG6JNljBL6faRYpZ+IDT/Y/YS6ug/i7Rerrp9+/O19fwgW3KypzyTaH1vn4/hQQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1248.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(376002)(39860400002)(346002)(6666004)(54906003)(16526019)(1076003)(86362001)(33716001)(83380400001)(6916009)(478600001)(2906002)(186003)(26005)(66556008)(956004)(66476007)(33656002)(8676002)(6496006)(8936002)(66946007)(9686003)(55016002)(316002)(5660300002)(4326008)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?odoEf2JrF2kuloeOUzfCXFEWv44K9tyHk/JS8VJjXFsTh13lc2evvJVm+NJn?=
 =?us-ascii?Q?wu5dpSOIf/4iFldQUvGYHIcxc79/s21vCz31POdFgVcbg9/tjLd+Gg7jQiDT?=
 =?us-ascii?Q?cv9O8mp2bQG0R1pRW5zXMilwAEpwJOJFFbrxAekqaq5tBRHQNGAEDALIhFQb?=
 =?us-ascii?Q?xwpFsSJP5AmTbgi96o640RwVCV+Aw6EVfewA0GMtyPAis2TdA7hAC0yKncCb?=
 =?us-ascii?Q?/4My/8OFTtMmCjmIWsp6+SlCUYLojOXFCYit+5+wFIGPhySYD9MmB9x8WyZh?=
 =?us-ascii?Q?cn12f4Jg/M+hYk7qPDK7qVIU1fd3jVwdIJI6NQjmI58FQVwJ4IpQrl04WQxe?=
 =?us-ascii?Q?Lji7J1bsueV1G4Tiet7eSFZ0CS72wk1+lJXO7UubGleRwq2DGkz1+HrV2C5w?=
 =?us-ascii?Q?jZec4H/mrppt0yIgsEp/sgTQQwZLKvSOZFQ9CtQn4qC2ZeOboo2X1SYSV7O8?=
 =?us-ascii?Q?TJp9PxJdAKTwiTQzEFc9a+VRsxXB8DrrGqVpTKkbD5J9B5mAnvMtbsrDKcC0?=
 =?us-ascii?Q?iKQVERpcDmUN7g/gQISQJ/yCgYt70ovllpBGIJwJ7FaXJ6W6Z4mi4ISn/lS7?=
 =?us-ascii?Q?lCjVi+Ar6jRbNYlO9/q/zab6uXCDDpxsr7yIpQAVGgrdLZIKuhXjk+fzErVf?=
 =?us-ascii?Q?+P43tkyrg5c7BoGBrQCHCsXisI34Ay+FNFHLN96TETMehQuOgcfI8tM6CDag?=
 =?us-ascii?Q?Z0IZhyQkvfens6hsOzR6PEQfiNDvJyGpOzJRBkFebiF68cyTnCKgRswczXxq?=
 =?us-ascii?Q?4Op7G2KgxggAsFqAz4+3Mpv2plJ1bob4ioKynJs+32c7fpVVEBxZ/vBXmLcv?=
 =?us-ascii?Q?eN4xunSy/BPUa0kXd4N0PuW86SrUak/ElAgLAvuNJ9z91OLTOp9pg5D48tmc?=
 =?us-ascii?Q?JAA1CjaUiGH0EW27gF5zuRSpJdHWQV3hKyOIj1hfuI6yCmJ7hiE1Mviz2qy1?=
 =?us-ascii?Q?K1LxmC7y0nc+VnWiA0/U/0EX9cyk6asSRgQpgwY7g/T5fj6AVfhY/+MJM6bB?=
 =?us-ascii?Q?rwzkkynpMfTYqiKIKEX4xQ77cl/0p2OnJspVHvlDtSEuTJNmcYywJ2g2eWk2?=
 =?us-ascii?Q?49DrTHOWg9WgAYFmp5Ln+s0QWtSXeg=3D=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7368bbc-9862-4101-ab46-08d8c0eaca9e
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1248.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 04:36:33.2129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lKQi7Z2PdrU354VFuG7Yqd/5mvJFuOsvRcL3p2bE1TCqnYhBKCnGCO+sSgqAaEvYf+T8kxuU0elkdjh6YuRhKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2459
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
Cc: David Airlie <airlied@linux.ie>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "Liu,
 Aaron" <Aaron.Liu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 22, 2021 at 11:00:22PM +0800, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the ! operator is incorrectly being used to flip bits on
> mask values. Fix this by using the bit-wise ~ operator instead.
> 
> Addresses-Coverity: ("Logical vs. bitwise operator")
> Fixes: 3c9a7b7d6e75 ("drm/amdgpu: update mmhub mgcg&ls for mmhub_v2_3")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks.

Reviewed-by: Huang Rui <ray.huang@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c
> index 1961745e89c7..ab9be5ad5a5f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c
> @@ -531,12 +531,12 @@ mmhub_v2_3_update_medium_grain_light_sleep(struct amdgpu_device *adev,
>  
>  	if (enable && (adev->cg_flags & AMD_CG_SUPPORT_MC_LS)) {
>  		data &= ~MM_ATC_L2_CGTT_CLK_CTRL__MGLS_OVERRIDE_MASK;
> -		data1 &= !(DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_MASK |
> +		data1 &= ~(DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_MASK |
>  			DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_WRITE_MASK |
>  			DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_READ_MASK |
>  			DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_RETURN_MASK |
>  			DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_REGISTER_MASK);
> -		data2 &= !(DAGB0_RD_CGTT_CLK_CTRL__LS_OVERRIDE_MASK |
> +		data2 &= ~(DAGB0_RD_CGTT_CLK_CTRL__LS_OVERRIDE_MASK |
>  			DAGB0_RD_CGTT_CLK_CTRL__LS_OVERRIDE_WRITE_MASK |
>  			DAGB0_RD_CGTT_CLK_CTRL__LS_OVERRIDE_READ_MASK |
>  			DAGB0_RD_CGTT_CLK_CTRL__LS_OVERRIDE_RETURN_MASK |
> -- 
> 2.29.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
