Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C356A1DB7CC
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 17:11:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFD7A6E860;
	Wed, 20 May 2020 15:11:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2056.outbound.protection.outlook.com [40.107.93.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E3816E860;
 Wed, 20 May 2020 15:11:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hU/G2D3GMPlOkjVHKdBEkKTwUYvCnN5c/WTNe1pBEb6AXMSL3WpA89zwdEGQn1ZcXlLJ+vm4sfVg5Fy5pGdzSrmQ/u0xpkZH9ZM4+oBHqPqn9iX2/O9CnIQaNA+SYdsaLO3YUhy0IHqpApuuAAdaSTHiRb8uDmyUesRMlWTvLSDhzDpUeomL+3QfIxFN2Xai+D2bMLY2xn41ZGUpiGiJI9jZ3mam3kfQ9df1DmIR3mSESV2vV+9ywCyQa5oJPd7Gq82dKTE73tDmqWcREckwiJqTOkq641Zf556z4Ejr1aS+R3BAP5M/32KFXQfH1UyQ59G7tufbAbDEUOQPlsmWxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZmQA9ukqCfQXZYoTLl+sOFDFSsvJ/wfQSJfnEMPLFTQ=;
 b=h97ryfXK9trW74hNLngfvLktQ6iYI0VhAlXxlu9NJqA0mF4kK4GB64sJT4iM0iAItSUVuRu04MbXQXi7aKrWY0i1cnWg8J+n6msVDc/ecnm7Ux1HNXK5ZJFhZ1KFsOwCaPn/nK1MMnehG7D5l24/l+rpJqZss/FMDAMAtfQ1BWf3jlk65QspaDNI22qKUmbOBAV41xsrcqqVURzp+KyEV3/MxZaVrONgiYcZH9AXFdxiSGxowjZWC+vc+ItHQmCVDL53/FC7al9xOdBhPd/Kzr8DVReEeVG8tBfJKTuCcJAtO3fH8f+0HSagZuD9yjxNETYr22vGSoQLmtIsI67FgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZmQA9ukqCfQXZYoTLl+sOFDFSsvJ/wfQSJfnEMPLFTQ=;
 b=BPlSyXgPBqAlwqUCrcwwZZzdaNeChgX4WM80OQlVrRnqTFYUbGl0fuw4LNBp0u7IxmesEN6h6SUGuCnMYbZXmMjV010i5YJrzIoQL8+kW9RraevEhlFOxQciopTLXzUVbw+92yfxYOwRz5MQeYq/hbOAWEuvptWD3Y5l7sZSIJM=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (2603:10b6:a03:ae::10)
 by BYAPR12MB3080.namprd12.prod.outlook.com (2603:10b6:a03:de::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.27; Wed, 20 May
 2020 15:11:51 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::fd29:4119:9ef5:8210]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::fd29:4119:9ef5:8210%7]) with mapi id 15.20.3021.020; Wed, 20 May 2020
 15:11:51 +0000
Subject: Re: [PATCH 2/2] drm/amd/display: Enable fp16 also on DCE-11.0 -
 DCE-12.
To: Mario Kleiner <mario.kleiner.de@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20200515051924.12331-1-mario.kleiner.de@gmail.com>
 <20200515051924.12331-3-mario.kleiner.de@gmail.com>
From: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Message-ID: <e5bb3a02-fd03-9d27-17da-6bf078ee5753@amd.com>
Date: Wed, 20 May 2020 11:11:48 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200515051924.12331-3-mario.kleiner.de@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0105.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::14) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.148.234] (165.204.55.211) by
 YT1PR01CA0105.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.23 via Frontend Transport; Wed, 20 May 2020 15:11:50 +0000
X-Originating-IP: [165.204.55.211]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 27951bdf-c625-4490-d99c-08d7fcd01fb7
X-MS-TrafficTypeDiagnostic: BYAPR12MB3080:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR12MB308010A4F08B5480917BF024ECB60@BYAPR12MB3080.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-Forefront-PRVS: 04097B7F7F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A1ke4Ha0aURLNyl/dDSVpzanJd/DmUHKEetrIvKJoXmZnu3NucGWMN+myOpB+pVMZIevhwZwq590m7FnpSF0wBK19tLAQR+/viCd6ngWCx6R5Wt5sK0QmE2ghFsbT1HFLCOz/zmeo0YLH44bP3EGiTVVb6AiF3hvNJ7ZasGyRZo/1vmM2iDamY8My6/07NNZ7QcQ0qfB/NMkQZ3vcYsh410RbuyAD5DF9eHFyemxbc0nx7oR1b7QtLLtXURyEi3pxLjtY3hk2wn4SO4boQD/Kw9EX6Z/XhH7zYnqnx4AAeneWSYvSMDnSw/pkojCGWbas4S57KkQjlwstHymRuJYXDF5weNVjBBoSamdaDiuOXBcQhZo1gCTpnQueIgwOR4Dcs72f9KRvH2hBQ4RRdxJZbecrEEUiJlz4yWp2H4ifJ6+O1XU+9/j8kX30yQivHEAz7NeBbRv3nt34lza/C0kWM0n3DkHSb9vcNvbYVS7+YGxpt8/fgnX52DiOAdiO+4m
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3560.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(39860400002)(376002)(136003)(346002)(396003)(31696002)(16576012)(316002)(8676002)(2616005)(956004)(5660300002)(52116002)(26005)(4326008)(478600001)(8936002)(31686004)(186003)(16526019)(66476007)(6486002)(53546011)(36756003)(66946007)(86362001)(66556008)(2906002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 5itOpSN8vLfPOchnr3RUpnAdC4ybvRT2jYkzvPoveQxZ6kpS8EygltV0MHW+IHldqz2oULPc4JiqpUlO3KtjWY0Em1G09Fgsvs3GJYg/JfaVH9qvFy11Yx2kZZyVWUmLnwEKD/dKMDNZ7eNnYEXhekwDt/+uwZId4OGxauLNnfCLFfSBcGL5DL5e+VYdTB5ldxyhRfaJglD8pIjLIthv/9Xfyqo2TNx9SxWMAYFUeywZj4EZpF8zg7Ed536yxEt9xKsGsikrUVzB0MJt5issBBVEFjxivn30q5B0k1+1ByJlHdA1MQNWX1c+QTOfF6caXlWmZ6ooGZvKzlm8yU6SvVElLPk5T5LOEQYUZuaZbNt0gdTBDKqOQl2tGwdl0GI5xp3RnSiNAnyDCJnQaDsZdvp0i4tnlj4ivREJ2UmbA1F430Xc0yQaU0azaeLP3tBUr59ikUSbPujyk6EQgXcqGgRfD2BvKjnSa/cB0pHgMDqNEHql4SJVotCMMQUbfqKj
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27951bdf-c625-4490-d99c-08d7fcd01fb7
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2020 15:11:51.4662 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4EYxQPEOjLQ5QVbbDi70lgq67gNoJbZvTAPsIvwWn9D6WOE8ZSGcfAlO7lAzp9RlDOkGBDFzA+7K5D7g7bOaoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3080
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
Cc: alexander.deucher@amd.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-05-15 1:19 a.m., Mario Kleiner wrote:
> Testing on a Polaris11 gpu with DCE-11.2 suggests that it
> seems to work fine there, so optimistically enable it for
> DCE-11 and later.
> 
> Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>

Series is:

Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

Thanks!

> ---
>   drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c | 2 +-
>   drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c | 2 +-
>   drivers/gpu/drm/amd/display/dc/dce120/dce120_resource.c | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c
> index 9597fc79d7fa..a043ddae5149 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c
> @@ -410,7 +410,7 @@ static const struct dc_plane_cap plane_cap = {
>   		.pixel_format_support = {
>   				.argb8888 = true,
>   				.nv12 = false,
> -				.fp16 = false
> +				.fp16 = true
>   		},
>   
>   		.max_upscale_factor = {
> diff --git a/drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c b/drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c
> index 4a7796de2ff5..51b3fe502670 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c
> @@ -411,7 +411,7 @@ static const struct dc_plane_cap plane_cap = {
>   	.pixel_format_support = {
>   			.argb8888 = true,
>   			.nv12 = false,
> -			.fp16 = false
> +			.fp16 = true
>   	},
>   
>   	.max_upscale_factor = {
> diff --git a/drivers/gpu/drm/amd/display/dc/dce120/dce120_resource.c b/drivers/gpu/drm/amd/display/dc/dce120/dce120_resource.c
> index 9a9764cbd78d..8f362e8c1787 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce120/dce120_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce120/dce120_resource.c
> @@ -516,7 +516,7 @@ static const struct dc_plane_cap plane_cap = {
>   	.pixel_format_support = {
>   			.argb8888 = true,
>   			.nv12 = false,
> -			.fp16 = false
> +			.fp16 = true
>   	},
>   
>   	.max_upscale_factor = {
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
