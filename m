Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E93F452B82
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 08:23:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEFF26E212;
	Tue, 16 Nov 2021 07:23:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2054.outbound.protection.outlook.com [40.107.220.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C69226E0CC;
 Tue, 16 Nov 2021 07:23:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UooMVD27SXWvAy6f1CL0Yhb3QoSQ6lRAb7RIvr63koNdnwLPyY/mFtN01CXLNIPyHO3QceLSnlzF8kq91hnHPre5d3RBwcNwfejhy15ZBHA08ltT3P2PkfU2yuszY+RM6eQRFjZ1O4RIufP13Sy495S+CNaVoAf5z+vTg2ueA57QG9ioSjMxqEACTYHVYYVzYn1ulLll8I0vHGFHZBv/eESJrtnJZ3p/1h9lXNSoQVZa7Kd46j2QTyMRVgKcgwXLQgrMbDqJ5LfX3hnQsXpac6f4UkGs2Y+hTnuLfUALx+cT/RWhEjBIIFEQSKnWx40+ymkxHWbTJXwIHj/fNmAmtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jqiC2ULqezkOWSiKcEHOWgDdgDpZSEjOeDuEA23VbRI=;
 b=WqD1fLTunLICcUy2vzb6KzoY6FKD8yViarUnz8yfounGmWddo1TRxpM0uWNP4N2P7aTU9xxTNiNfxsqOBiUSydUeEtuZ3VlWDZwHDivPv6CDpgVV6qUfFE9zUxNuv3vizN+k2OWJCynb9q/ZyqVOFvxKLWSZIbrWWe069JYxdTIC5lUDiE3RfQ5iBqKqqj2GBGd1AFvBOxnQpUdudR5aOUHK73TKgLNTjIpvAkcx0NzTYu95OOhlVya8sMlJmOUquI/nr+HtjMXP8w60SUe19tp+3Q7ZRZ4Fs5KH9Sd3OWZTXLqbfMzWwd9yV5AMzIP3V7rW3SGEjzQWLb9HtUbi4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jqiC2ULqezkOWSiKcEHOWgDdgDpZSEjOeDuEA23VbRI=;
 b=amvU7aJ95Axp6Y7rvvmrTFeMSN7euO3LiN1aS+0SYYEvolaTxlbsCXjVNOMX90ARUxFCWkKq2MSdj+yj0wfhg9G1Ug480AJrYIou0EVA4xwHGSckdaCSuQ5mm9WE2cYHT0G5SwTYovx1uYh1PblEV3UE7nCj9BWxoD+vzNe5YWc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MW3PR12MB4412.namprd12.prod.outlook.com
 (2603:10b6:303:58::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Tue, 16 Nov
 2021 07:23:04 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769%5]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 07:23:04 +0000
Subject: Re: [PATCH] drm/radeon:WARNING opportunity for max()
To: zhaoxiao <zhaoxiao@uniontech.com>, airlied@linux.ie, daniel@ffwll.ch
References: <20211116055031.31621-1-zhaoxiao@uniontech.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <3dafeeed-dfab-a7c0-315d-62f74f90d839@amd.com>
Date: Tue, 16 Nov 2021 08:22:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211116055031.31621-1-zhaoxiao@uniontech.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AM4PR0302CA0031.eurprd03.prod.outlook.com
 (2603:10a6:205:2::44) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [192.168.178.21] (87.176.183.123) by
 AM4PR0302CA0031.eurprd03.prod.outlook.com (2603:10a6:205:2::44) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19 via Frontend
 Transport; Tue, 16 Nov 2021 07:23:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78ec027e-a1a2-4de3-1bdd-08d9a8d1ee15
X-MS-TrafficTypeDiagnostic: MW3PR12MB4412:
X-Microsoft-Antispam-PRVS: <MW3PR12MB4412840EB208270EBF6C3A7983999@MW3PR12MB4412.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NlZEK0ZhPal40gt5nrzas0uBr6vdvHw10lpxzVWo3aZ02pxz1dLWNVnALHVT4wuqD93Omy4y+ef6L+OU6hY2iB5ydEnKVJOa1EYllZ8cTjcW/i9EGHSpWmW98ynNOzEw4FgbQT02yBGTbA0egqmJt4v4Ny0Ts0qv7iVPEBdaTstcn2/qsgbr+zODGSLPVKGu1ksdOa7Sw7lilmzLFIIIFD2TwpbRCdfaOo4B4kTjeQYxnkJEFBJWj9U/Bu2b/D98SuuQACprXDRq9uTeU2HAClp/TelXmMHH3BUKLRWEoI+4b+BFRgZItwuprKHgoegHS6HxORpfYVcpewy15l1XmZuyGclsaJXQzSGmMpnVlw9RpD2DdX5JEIPD2j4CqOJ7soT+mGa8SoyDFM4u+0kqWgojO9MALQS/NcuAlySfuwbHqX2lo1YQiFRRaciOaF2XVyX4NaozGsU+ov0E/ILGTcsb2SRiqz9dDaMonlHCtQyY6sjL7LQaDOpBwODVo21PZXY7sbl3TIjrdynNrRjeOm2JmYkB9jLS7+d0PS+mdkU/wDDoH4YA9Qvda+x7cZ3qtGUS4/uGFYaDxQJh15djJzCktKjKN8kUwZAtx/jOtAdfY1DTniZdtSEkZe9bpc+UrPUQPqdl1YDqn0tQu264RTrMtxQcOGM5PMDhiC+75cYvUkHZ1cgc96EgoFFJorxeZs0gG1PXQcyrctV4i0gwIJYGF7FUjF4/6XckxFMZdYQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(16576012)(8936002)(6486002)(86362001)(4326008)(83380400001)(31696002)(8676002)(956004)(2616005)(38100700002)(36756003)(31686004)(26005)(66476007)(66556008)(508600001)(6666004)(2906002)(5660300002)(66946007)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVdlOXJuVTU5NTB3QjFzSTI2Nkt3TWtvc25wSmNTNmJCUXFGQ0pwNCtrY3Vs?=
 =?utf-8?B?S0ZVOGV2b3pkd2FLYzQ4MlZoUFJsUG4zSllTL0E0MlQyMEVuQmZHWHR1dnlD?=
 =?utf-8?B?ak55WFU5QTdseWIxSmkzdnJOSWJON0EvVEx2MnZ3dUZqZzUrYWhEK1JFTWtY?=
 =?utf-8?B?UDEvZDZkNTJlemx4NGFWZkszUjBieWdjSGFSb3N5RDU3UVZQRGU0blJJSUFV?=
 =?utf-8?B?UlRKdG0zVHFzWlNXdVJ0R0VlcnhrYnd0QkVVYmx2QUgyWWg4a2o3SlBIQWRX?=
 =?utf-8?B?T1dQUnhuL2NveC9MUHhjcGNNbnBkellHY2VpdUpzRUtmaVY3aVNlZnlEY3RR?=
 =?utf-8?B?ZlRhTHpLYm9yQ1ZTTmdRakFKa3dpZllYR3BOZmtIMGVreVQxYzNWNExxK0p1?=
 =?utf-8?B?WjN1cXY4bnNLaFFsL2txSkljNDYvcVA4YlRCc3E0VzdHNXJ0am1Mc1YxSEZE?=
 =?utf-8?B?RlJuNUNKNmN5cy81WjM2UXZkdlNxUzdpR0Vja080U2J6Z0hyVXNncEZ0ZEhX?=
 =?utf-8?B?TklHNy9IUGx5TG5IS1RYYzNTWjdjdGRCYnIra2lQS01mMXFsUnp4VHp0Nnp3?=
 =?utf-8?B?dzZITWpZc2tqVldkZGd0YVRnZnJudHFrSkliQVNENEJ0V2w5NU12bG1nSkVj?=
 =?utf-8?B?dUszaHFGekhkT2llRWJJOTRtaVlNaEJML2tnMi81N3ZMY09pZEF0TmI4VmMy?=
 =?utf-8?B?cVIwY1FIaVNnQkRoS2JzVWk3ckhrTE5JODREaUxlMkY0Y21rM0NpZHllbkIx?=
 =?utf-8?B?MWNyd2JENW1rUU9EQ1B5Y1JHR1FlTWVmMG1JSTI3Yk80cjYrVFkrRC9FZkdu?=
 =?utf-8?B?dUpITVM4VEcwVVZjb3E4QmlLTURsL0IvM3FVcXc3T0FCckt1TGVUaklOWHNz?=
 =?utf-8?B?cWV3NG43dy9BcGJFYVVmV2p5ajJxd1ZaMUJPNzdua3pFOTgxaWlpSG1xcGs3?=
 =?utf-8?B?SXNOL283WXliWjdseXE0RGUvcUw5OWl2bjBMMXh5clVFTUR6UG9jSXdTSFNv?=
 =?utf-8?B?MVJyM1owb004eFFPTjVoNm5EcjF5OGwxY3lSSytpK2dhTThmYko5VnN1WHRM?=
 =?utf-8?B?VW96am9sTEo3dHNKeUhrNlJ1M0Y4Wk9kTUxEMG9nS2dKRGVqVG15dUdlWGZh?=
 =?utf-8?B?SjZ1S0dSUWF4U3JYWDdpNVB2ODU3YjNiTmdCN3Iva0xqRWhJUythRS9ydTBh?=
 =?utf-8?B?ZGZUcTQ1a1FiVGo0bzRocE5uNVJIZTRNUU0xekU0VjRNQTJaRnBNdUdQVmQ0?=
 =?utf-8?B?N2NVUnF1TzV2cWYrSldSMFhzbE9sTTV5WTNwTTE1dDVGQ2ZkQ2s3LzMxQ1h2?=
 =?utf-8?B?Vk1EVTJzcGNOTmEyK3BSellsQ0NQVnQwUktKdWVaMVJycTZhd3RldXp6SVRn?=
 =?utf-8?B?RHBTMEluenQ0YlNhZHU4NjY3MHN5VzY3MzFQWkF6U2RLODQvNVlxUExkUnFn?=
 =?utf-8?B?WDA3U29YNXJSUndxb1E3WHpJbS96b0VBN0JENnlWdENRL2o4ams0L3gyR1Bq?=
 =?utf-8?B?MTd3elRFVS83UDdQWEduMndVWFJOMzI0eExGWUFWZGNtbTZ3M0VDdEVGOEw0?=
 =?utf-8?B?Y0RzL3kyelFobTBlUDRlTGhEVnZsUzErckU5NCt2dlNNbXBkWVhTQ3hheDFp?=
 =?utf-8?B?cW9rMnMweDZnKzQ1R1dJZ0hmbEE1aEFjSzdzQzUwSFlPTUxUTlpWMmF1MEd6?=
 =?utf-8?B?ZFlyUXRmREJtRE02VXVsUjFYa2xYMGJZR05iWEZ3VWQwYnQ4UTJtYlQ2czE2?=
 =?utf-8?B?UEl2eW9rdklvaU4vV2dodFpLS2xjL1FaeDh1aWxCN25MSzR1bXJTMXlLNzNK?=
 =?utf-8?B?NkE0b3RlVTR5bWE5MGNNaUZGd1dFdWFBcUF3VTNNN3lLRkZ1YXJaRFNLKzcr?=
 =?utf-8?B?L2M3SkFTbm5LUUpEaWIzeno0eG94S2djYmFkYi9TS0hZb25IM3pLUmJMNWlE?=
 =?utf-8?B?UFVJUGw2dkNndXBNcFpGbDlPbDNZOUFSdUczTmxjRWJaUElBa1JwUXNHdlA0?=
 =?utf-8?B?TG5Ia1FOMWU0aDRVeUE5L2dPQUV5Y1dMQ2U3ZWdVTmxjTXhKcUdCNFFaekJI?=
 =?utf-8?B?b3VqYUhmWVY0NHdaQnh2akhsNHBFZGo5M2kvQ05MR2lxT2RGcWlwc1pvWG83?=
 =?utf-8?Q?W3FA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78ec027e-a1a2-4de3-1bdd-08d9a8d1ee15
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 07:23:04.6937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GD5Q0OXxhfOY3fiKFfqNMmiXMHoTyhA7ALkZRqVN9rs4t5k1TSpl7PCoijP1HV2U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4412
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
Cc: alexander.deucher@amd.com, Xinhui.Pan@amd.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.11.21 um 06:50 schrieb zhaoxiao:
> Fix following coccicheck warning:
> drivers/gpu/drm/radeon/r100.c:3450:26-27: WARNING opportunity for max()
> drivers/gpu/drm/radeon/r100.c:2812:23-24: WARNING opportunity for max()
>
> Signed-off-by: zhaoxiao <zhaoxiao@uniontech.com>

In general feel free to add my Acked-by, but I'm not sure if we want 
such cleanups in a driver which is only in maintenance mode.

If you do this as part of a general and automated cleanup then it is 
probably ok.

Regards,
Christian.

> ---
>   drivers/gpu/drm/radeon/r100.c | 10 ++--------
>   1 file changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/r100.c b/drivers/gpu/drm/radeon/r100.c
> index 2dd85ba1faa2..c65ee6f44af2 100644
> --- a/drivers/gpu/drm/radeon/r100.c
> +++ b/drivers/gpu/drm/radeon/r100.c
> @@ -2809,10 +2809,7 @@ void r100_vram_init_sizes(struct radeon_device *rdev)
>   		if (rdev->mc.aper_size > config_aper_size)
>   			config_aper_size = rdev->mc.aper_size;
>   
> -		if (config_aper_size > rdev->mc.real_vram_size)
> -			rdev->mc.mc_vram_size = config_aper_size;
> -		else
> -			rdev->mc.mc_vram_size = rdev->mc.real_vram_size;
> +		rdev->mc.mc_vram_size = max(config_aper_size, rdev->mc.real_vram_size);
>   	}
>   }
>   
> @@ -3447,10 +3444,7 @@ void r100_bandwidth_update(struct radeon_device *rdev)
>   	mc_latency_mclk.full += disp_latency_overhead.full + cur_latency_mclk.full;
>   	mc_latency_sclk.full += disp_latency_overhead.full + cur_latency_sclk.full;
>   
> -	if (mc_latency_mclk.full > mc_latency_sclk.full)
> -		disp_latency.full = mc_latency_mclk.full;
> -	else
> -		disp_latency.full = mc_latency_sclk.full;
> +	disp_latency.full = max(mc_latency_mclk.full, mc_latency_sclk.full);
>   
>   	/* setup Max GRPH_STOP_REQ default value */
>   	if (ASIC_IS_RV100(rdev))

