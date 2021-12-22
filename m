Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 759E947D7B7
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 20:30:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 730E310E276;
	Wed, 22 Dec 2021 19:30:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2082.outbound.protection.outlook.com [40.107.236.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A146110E26E
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 19:30:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VYUEjZkJSVLKuIdcoQCyE6beDbHL6QEa9OyWiu9KpuQ2QuvL+bpCW6NHMY+uW77Q7SOf2CrrR4ZtK6007iZhcjldjuk/6EdBN10Zoh67mcyxAKGYrwGx0H56qvNQTvdjg2K53uvyFecrWJubmpBcK0Ibwv1dv3vttjAUZ9EW2tiX6fKCAulPv2txj+ZzrRD8I4+yvqmCcW5QGfNspqH8/+uxbSutH139L8bdiBc6SU5oRdWtDL0CvOMWuC2YREPb/2n7o1R1EkkzxFWWeRiO885Ah8AvEUdOZ5p3Cu7fhn3va77ZcFXeEudY2TS7FONz0nR5owAug/RkSq2ClpFY+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vVvwmn4Q4uwdYNgBGdEeGLq2AX8FdOfGKKYl0CG+6GI=;
 b=V37zstBKqFFqsvTBz1mtOkY5f62fAOhIbm8HQVFlHdCtZwTstpqoUo+MncUVY+q5M4zK0/l1ysOw9KyC9ZnKec31f1rUwBs4fNA8+b2rD+viAxXFqU4uOjs1lTXpZLdtkPbZq6PJU12UKtZy3GJ5YXIOUpjeTpSyaBu0MAjThWrVH8XUoMpO0xLHPeBvih6aabwVTobU/vNPFwRhtz7deGNsa79PiApj9E3UofckLAVcdm8AwgzCDpHGNibd0wGMpVCepCUp5wz11v/GeK8ien548N6t0AfCFexT3CTcAxBwwEOXxxlr+a0Xjo6L8/UEevrkNJnfFiQdy3win+hZlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vVvwmn4Q4uwdYNgBGdEeGLq2AX8FdOfGKKYl0CG+6GI=;
 b=uLMcunSm5V/WCFzXslolqk8+HxtCbohhpd66lFXjdlUehDbaZ1WgB9mXImcWwpM2oNc5lFNnGzga2+8VYj89SSv4FzDybVgytFHXfINKlstwJO1V1fnGVrwDqj06KJbvF+uFDCrSOTXa2zSQG2xbWO8OzhOnwZK/gCsth6W4awNBkiH/1LY6BpiaSGc8GArlD8ULAoxLnc7ATdhMbxIljyW0aNMdh6G4h1lL42dLgJn5noxfngU1GOa5rwaDkTwEBdXxTa/79ysupJdcfUm98VKwlSvtNm0nKJ89efqplDpezhGvVFax7XeEVkPMn/X9UBge2p5rXeL6CDRSlik9KQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 CO6PR12MB5458.namprd12.prod.outlook.com (2603:10b6:5:35b::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4823.16; Wed, 22 Dec 2021 19:30:15 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ecac:528f:e36c:39d0]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ecac:528f:e36c:39d0%5]) with mapi id 15.20.4801.020; Wed, 22 Dec 2021
 19:30:15 +0000
Subject: Re: [PATCH v16 08/40] gpu: host1x: Add initial runtime PM and OPP
 support
To: Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver
 <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Michael Turquette <mturquette@baylibre.com>
References: <20211130232347.950-1-digetx@gmail.com>
 <20211130232347.950-9-digetx@gmail.com>
 <21212ddb-205f-71d6-0199-d75768eaf32c@nvidia.com>
 <41edc53b-5ed1-d524-2546-c3d1ee6cdea4@gmail.com>
 <6652ac84-36f5-0e43-65fa-04786f384f21@nvidia.com>
 <56dce9c7-397d-75b0-b5b8-18ce1084e72b@nvidia.com>
 <6dbc8205-5669-8b08-16b8-fe5e1acdd06f@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <796eb3f7-80e2-bc55-fd52-43e76220f8c2@nvidia.com>
Date: Wed, 22 Dec 2021 19:30:05 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <6dbc8205-5669-8b08-16b8-fe5e1acdd06f@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P192CA0005.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::10) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26076b72-8d50-4308-77b7-08d9c5817aa4
X-MS-TrafficTypeDiagnostic: CO6PR12MB5458:EE_
X-Microsoft-Antispam-PRVS: <CO6PR12MB5458EAB3E0FB2F2E38F791FED97D9@CO6PR12MB5458.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r5KdMaLIUvcT/Zt8PValy5Jteg/uRSplUEvPJ5r2ec7s3MMGxPJY9WC0Q6yLc1MCVvL9FqXoKpRxRsozBzZFDYSgfhf+LXXJ8Fl5gkmKGBk4fkmdBUPzdVb0GBcKg/WlnmlsPbrpzp7MZJE5g5UkWXlnaJn+2Kdoa/WO2hV+ON7UYuPiwHlB+ndzo09riU+2e3KSa7fnNAgYRhWT7jolcYYRvVt98iCpXutJRHrIIREg+ExFDiGqJDIel6+4EzfBQoIZRFbugVvWlb3h1+WFNiHxrfd52AM3EaDLI/EUfFQJ/GSVQrb3PUZthm1y6/1iLTscYcL5OKOktJJdHoG7O1iaVH7qd4j9ohKo6xlwKnVDIP5CudvvYXzLfQIm1xWrLgUJiH734nfFwMfzfBGQYk0HlVToY4q77Y1c8bfnW51mit583lKzqqeS10w9ya0mAm+yvIOlXxatpW7qfudO0p18fEiZGoRY3IQai2BuGhsCNFNbAqqYLVgg9IKuxloNVoznERlE4QvrG5I7u60pJ7G8rz5gU+YIQq/qFARqHW+x+4lyBYaUQz6KK6c5Kxqj4sy4eijvr+83z7GJU+Q33WC1D2yYEGCHPDjC4fruDkQ+8keaTGlycm900a74jBRQ+SHyXjhtToeDzz38JuJ841v5urwxwGNJPwoNfwhrwkOq2UDcDAb3jyCPCOWU5O0SSpl+nwz/yz/fNSy2eGrVrvQNKDjOiRKedLWCZXqCsef/59+DSaCLbpHVIYSmMALSpp8fxdKW+wN98w+jW0M6FGMr39Y20IMdKyDKEqSaaH62a2V8nIUlYZNnKcCy6qWo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5444.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(508600001)(83380400001)(66476007)(38100700002)(31696002)(4326008)(921005)(31686004)(66556008)(2616005)(36756003)(7416002)(2906002)(6512007)(8936002)(53546011)(5660300002)(186003)(6666004)(8676002)(316002)(110136005)(26005)(6486002)(86362001)(55236004)(6506007)(32563001)(43740500002)(45980500001)(357404004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0lRK054RDVPWHJLSWZFTHJzRzc3ZWxaVG9uOW1pb1E3Rm4xdk9zdGJFYVpq?=
 =?utf-8?B?d0trQUgrTGdlR2Evb0g4cDJSK1dNRWZPbndrSzlSUCthYlBlaFptcUJMU3cx?=
 =?utf-8?B?OVVzbkd3MTFPTWZ4TmxiMmszNDFzUHR3dXRMZkRXUzJJb0tDaStOU0pwL1pF?=
 =?utf-8?B?WFozczRKQ1lDWlJUQzV3UHNHWXFjOWVNeUtLOTBxUWd1UXowR25jRVlIRkx6?=
 =?utf-8?B?WW4xUUE2a1U3Mlp4TnRoeERWS0dmMnZ5bUhZcm1iNE8yWm82SDBZL2VSZEY2?=
 =?utf-8?B?WndXUnV3N1JaM1Q3bXZDNS9pV2g5eXhFWVN6K0wzQzdQNEk5L3lvbURiQ3pi?=
 =?utf-8?B?Zzg4Z1dqZTBrc2R3R2NnWVk3RCttV2owdVFRWk5JaGxrWk9GRlhPRmdma2hJ?=
 =?utf-8?B?elBHdUsvdGhFVmdWVEkydlpoY0xxVkwzMzV4S0FVelA2eW9icGVFbnNrV2Na?=
 =?utf-8?B?U1FKa2Q5VFRjUW1LZHBWeUM2aXFMVmd5K3kxOVBxRVhlaEovUkdrWnFmT0tq?=
 =?utf-8?B?aTNTcXpzdVZ5eFdZVnZqcTc3YVllcGQ4Nm1uZ0owMVBXRVR0UXRvaTdZOW14?=
 =?utf-8?B?OHJFbStFZEJxVHZVV0pOaTRtQVBIeGxJVGE3T0lYZDROMFh2S2FQdXdsWUE2?=
 =?utf-8?B?NXZ4Ull0QnB4a0FCSm0weWl1VGpNZ1RMdFZjbi9LN3M3OFh3MFg1NWQ1amZP?=
 =?utf-8?B?Z0ltMVFobFBzdzNYQkVENFZxZ1dxRGpla0hSd1M5TTVWQzVCRk1uUDJ4R0JX?=
 =?utf-8?B?VTNISmxDODA2ZlhCeUV5MTJ5YXBEV2laSXFxTzJvR2NwTWF6VmliZWdKVWVx?=
 =?utf-8?B?ZHhHM1o4WlZJNGluTTRmMURpSzVBODNybWJPQ1lVYmhuZjZDbCtNUWdqYSt2?=
 =?utf-8?B?aG1RbXo2dTZjeFJOdm5lNEVHNTJJOVhMQWpVQmxXc0NSa0VRSDZwcmRCaGN2?=
 =?utf-8?B?VHR2alFNNFhPTkVFTytITXZnUDB0c1ZGYUR4bDhWM1RYU3ZLbXZ4NWt4S1Zo?=
 =?utf-8?B?N3dQVGxHMXhza1E3ckNkUFBWbUREZzNtbGJxNk82WTVNQTEzRXRwRThTWDVV?=
 =?utf-8?B?ZGh4NVVxNWRieURRL0R0a0lZN1RGVmluekQ2amdmU0RxelJkZWUybmtmNmFP?=
 =?utf-8?B?VXVQUEZmWjNodHJxakxWZ093N1VlZ25hVDRqd0tCWS81eU1NZWdpcHhqM1NR?=
 =?utf-8?B?TFNXZlhTVHM1QXlqS2hIR1RuSWYzR1c3c2RMOHBudU05eExqUzdWTXVtWVI5?=
 =?utf-8?B?ZWxMeERxaWx3SWdWbUFBLzFhTExlSFdGU2ltTUh0NC9HZldYcGZvVzA2aEJR?=
 =?utf-8?B?dS9YQWlWRFVueUJlWEs1eWpteld6cloxajNqVG5CU0YvVWIvaVd6dmhHS2Fh?=
 =?utf-8?B?WU42d2pWRWxLTzFNRE55QnNRa2pESzdhSHRzVlpsTHkyYTg3NG5OS1FRMU4z?=
 =?utf-8?B?b3lBcnNzcDl4TTd4eStFc3RsRFg2eEM4OXdjWG8vaEgwbU4vdUh6NzA4eS9G?=
 =?utf-8?B?eTlGUCtWbEhqdXJ2S002c2xiM1RkVmNyL1pzREZ1cXRLVVA0NjlRYUJJYmFI?=
 =?utf-8?B?Z3ptRVFZamwxbUYzcTE2bVRkVFRqRHM2amxlMzlHRU1HWlhYMjlEdUUxZUdz?=
 =?utf-8?B?eTU4UWtaclQ2czN4SEQrQ2tkRmRpTmoxVlpoWlROOWd4bnFlNHFEQlY3TlhT?=
 =?utf-8?B?cjc0TUdQVytsM0xTMkQxMWdNOStMUWwvTjFXd283RUpmak5UcG43TjByUkg2?=
 =?utf-8?B?U2lYNVhQOHdNVmxHa21DZ3k2bWhYNzB3SVJZTjUvK2w1UndRL1VTdWhxM1lT?=
 =?utf-8?B?cFVURUpvWGg2cU5LalMzYTdTUWRmcWc0RlF1YVR0UFFnQnZSeWFJeXdVSEpW?=
 =?utf-8?B?Y01MT1hOVVdtaHhLNzFtREtVOTdPYUtId05ralJ5QnowKzNxbmR5Wm5SYVVq?=
 =?utf-8?B?QnF5WXVyMGhEL2ZVWmVNTjkybGY3VlZaaVRGbnVCSzcrZklIRVFqcXI4ZXFq?=
 =?utf-8?B?UnZMWjRvSC9JbkRSTG1YK3FvVEJ6d0NYUlRKQjFHV3M4dDVndVhBd2ZZaU1h?=
 =?utf-8?B?cnYxWS84TGVxdXBJcEp2Z25RalcxZ1UxRlc2V0JQbjhDbUlZUCtBdHhJSXlU?=
 =?utf-8?B?ZXAvbFlrS3pTTFdXc3pTakVhNGRTS0RIU1g0TjhPWmtWK2Z5cDRFNWpEREtm?=
 =?utf-8?Q?aLvTqhh2wUW5AehqRXjDX74=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26076b72-8d50-4308-77b7-08d9c5817aa4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 19:30:15.1027 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K+19VsV3OvWQUpRYNsAE9NKIuX1TvJyqPR5PAvsqPXpu0KscQLqOkz/X/wVyy1A4XJc59caA2QkGimLMgPJ+Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5458
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
Cc: linux-pwm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Heidelberg <david@ixit.cz>,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 22/12/2021 19:01, Dmitry Osipenko wrote:

...

> diff --git a/drivers/gpu/host1x/syncpt.c b/drivers/gpu/host1x/syncpt.c
> index e08e331e46ae..8194826c9ce3 100644
> --- a/drivers/gpu/host1x/syncpt.c
> +++ b/drivers/gpu/host1x/syncpt.c
> @@ -137,6 +137,15 @@ void host1x_syncpt_restore(struct host1x *host)
>   	struct host1x_syncpt *sp_base = host->syncpt;
>   	unsigned int i;
> 
> +	for (i = 0; i < host->info->nb_pts; i++) {
> +		/*
> +		 * Unassign syncpt from channels for purposes of Tegra186
> +		 * syncpoint protection. This prevents any channel from
> +		 * accessing it until it is reassigned.
> +		 */
> +		host1x_hw_syncpt_assign_to_channel(host, sp_base + i, NULL);
> +	}
> +
>   	for (i = 0; i < host1x_syncpt_nb_pts(host); i++)
>   		host1x_hw_syncpt_restore(host, sp_base + i);
> 
> @@ -352,13 +361,6 @@ int host1x_syncpt_init(struct host1x *host)
>   	for (i = 0; i < host->info->nb_pts; i++) {
>   		syncpt[i].id = i;
>   		syncpt[i].host = host;
> -
> -		/*
> -		 * Unassign syncpt from channels for purposes of Tegra186
> -		 * syncpoint protection. This prevents any channel from
> -		 * accessing it until it is reassigned.
> -		 */
> -		host1x_hw_syncpt_assign_to_channel(host, &syncpt[i], NULL);
>   	}
> 
>   	for (i = 0; i < host->info->nb_bases; i++)
> 


Thanks! This fixed it!

Jon

-- 
nvpublic
