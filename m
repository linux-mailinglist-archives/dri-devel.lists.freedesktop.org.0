Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CCA735943
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 16:13:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A179010E210;
	Mon, 19 Jun 2023 14:13:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2055.outbound.protection.outlook.com [40.107.237.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9B7610E210;
 Mon, 19 Jun 2023 14:13:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lMWnX9Gdtvo78tekVuWBvMEuChRU7R4jKiQmb3DbJTvELslkVzgQV0bumuKu1nWhC/4uDrNvQaEddSacerynqDmrlkeoYsLcyn6VuM4z4qsDtOdsOsRPDcr/qJj0evRLkd/ksmJeXjk32LB2NELqm6Cq/Rk17IiIZ1oXEwmLTekYju+kKg9ynDvv8oor2bRSUDQeY7Ix6wYVqzApFJx5kGa+omKegNQls17Esh9vHUJQS2u2+hqm6D2trmB06k11vs9c1G+orhSpOePWp5zcqHagLm6p/Lr26+hq57RoTv8FrUjiBm4qf2e5ytMWTHqz3ie52yQ9vuKRy4fOyahyZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=auHddwvWgj4D7Dk30pz0Uz7hxQo0gXdYDCS2DoDGxXI=;
 b=VS49R00bfgBNJ7cnv+0QUK/26YLGTQ+TRVHnNaqwWOvrGjvdqco3qssQPLD7c+cc6yz+5MTjdG1p5t1rBuOFN3gNFtoTVbI5/n/BnBONlPGOlVX/x+tVoB+UpuRM13nHQ/AwZB+HUBzOQDwU2Pdi001Yg1aMA7ZcWFMOnPQiYGJCrHGYstaMbps0Ex/hJP6vze28azfmst/Zs5AtZUAkITjeJHU2bKrqAmuhIaRFO+Z/G9LI8u91nhNL+nGkmS/WOTr37q45KdetoLRydqvMVkDg/dn75cT3sP9assmLSSuRMoUaT85NrWLSM2QF34ub3aMBrPNLkGsVyIrAQsf35A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=auHddwvWgj4D7Dk30pz0Uz7hxQo0gXdYDCS2DoDGxXI=;
 b=ssg+2XLY3r/WfAP8iHnV50/ktJspCTnnDoZsuqCWhRd2HAcXRP11sTdaXal357Nqgcx+0m3Ob5UCUyyAsctXKght+uRoPZ5MHcyw9e/29qrwL0CYT/uvIK6oWmWEz3naCMDicufhFTywWfdYvr2yszDgXjbWC8Z/sWIRcHwNVik=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN7PR12MB7228.namprd12.prod.outlook.com (2603:10b6:806:2ab::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 14:13:41 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84%7]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 14:13:41 +0000
Message-ID: <74d264fe-7f76-0744-7011-56e04ad1f48a@amd.com>
Date: Mon, 19 Jun 2023 16:13:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/amdgpu: Remove struct drm_driver.gem_prime_mmap
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
 Xinhui.Pan@amd.com, jani.nikula@linux.intel.com
References: <20230619141129.2002-1-tzimmermann@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230619141129.2002-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::19) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SN7PR12MB7228:EE_
X-MS-Office365-Filtering-Correlation-Id: da5f51d6-c7c3-4197-cd4d-08db70cf6218
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MN4tlw9Y3RpQfYqbmnTskwiHpU4d6guV/TS0twNzm/ftrHf/TSwTAOHEVKzQm87bCfX4gy5yFFdZtBxPjSkttD0pkXR2sCrh0ZaDyMpNThIVDq2K6GaGuKhv0BD9k40XM+d20+HoTeS4utTWFSzZDprrGXUu+fga8IMO80ZKuGfyN1W/27MaRoCVAUk0XfVb2FxzcYvoaI993v/GOgvENrZrDwmX12+/7Tm8L74fABpJ2MS+TR5US9RYGUQ+Q41VHRaGsVWOiyRyIPCCiHwiRcEjnyDsAOdkMlU8OtyWwe7k+oWfeDN08qqYAgXqK5/hqZdgzmDTUdQI9nSGtOEiXzTrW94xVsxFwPHmtdIYHrgQ9GYEM5g126zNskpHZna9d9MgLOV/iiTZxUsY7SD7swNhqbhXjvA5zUXu2uSg+S4U++CmWYaRup+y72Ecog30YgYMVuq0j2AyuLlkVkawc5hlPr9wjKleMBg8Zp6u2rhoqbCRV0/E/vCwaEc0m6VWiIY6kvn6/tgoGPK0Pnp6ftNPyi4TZaJQbvDqYZJwaN6UeA6wOC8AnzDVbuxKOxSnS2V8nJa4x2Alxr6cJFiDp/WUbXQDYLFpIusEi/p8Fd5grkEMIlmr92ID7u8IkIUucQuAY/+yfUW+JwVzejqAIg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(136003)(366004)(39860400002)(396003)(346002)(451199021)(86362001)(31696002)(41300700001)(8676002)(8936002)(5660300002)(66556008)(66476007)(66946007)(316002)(31686004)(2616005)(38100700002)(83380400001)(66574015)(186003)(36756003)(6512007)(6486002)(6666004)(6506007)(4326008)(478600001)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGtmY3BhODdrRFd4MFlBOXc0UGdoMVAzdXBmTmxGWkY4OG1FNVRrWFVTVmZy?=
 =?utf-8?B?ZkV3Vkx5d1BldlJ3Y0hJSyt3L0puOG9LTERZckt1ZU5pUkhWMEtERU9OL3Mz?=
 =?utf-8?B?eElJa2pDbDlWbHZHN3kvR1VBTytENUluNkJuSHB4UTcvY043MjYrTmhYODdY?=
 =?utf-8?B?elNua0xYZGNVYnZrZTRRc3ZTNEpVdWE1bDRveUhiWmRSK0hzUkVVOE1MWUFy?=
 =?utf-8?B?cEc4bDZMbFEyWG5DN3E3L08zZGpnSHVETWZpQ1JCWisxa3dxaitqRTZjVVFI?=
 =?utf-8?B?TW53VVd0LytpR2Y1WmFUVmF3TXRTWG1UeDRGbXM4YnkvUFRtTFdzZ21UcnpI?=
 =?utf-8?B?TzgyTlY4cGFiQ2dKRWhsVm10Tks5YTM0VGpCbURTTVhHVnIyU1lWZUtSN2JP?=
 =?utf-8?B?VW11MlROdEpTcHdyWTk0dDYxV2hoTGErTmRYdGpLOTdlUTNGeVFaOUNtYVhE?=
 =?utf-8?B?NHNDMnpzSktjOTIyTlNyWTdMNFFOaWJreFZQeWhQejhEV0tGZHZLdGtGQjJi?=
 =?utf-8?B?NG9FaFBUZ0l4VU9kL2l2REY5aGx6NHR4YWo3dGZmR0xsc1NkYkFjTDhvWHNW?=
 =?utf-8?B?bmIxYlV6UHJrQzZjU2ZPOGJtMGs0WE9GbEREdVE2MjFNNUpzdEZoaVg2Ry9w?=
 =?utf-8?B?S3VhbCtKb3c5ei9zUUpHYndCWEoycXQvU2gxeTdONHFXQXk1Rlh0QnNQd3dG?=
 =?utf-8?B?bkVNUFZHcXVnbWxKMFdneWZJSGpTSFFnVDJnZHNoaUtRZFVWYnM5YTVNYXU0?=
 =?utf-8?B?V01QZU9zZ1d5c01OUkJoVERPZE9oUE9uSlpHRjhjUm5STkYycGw5M3NZb1NX?=
 =?utf-8?B?RDVvL1BUZ3dKMHJqWVNQRkc3Q245RmxDdDdOTE96dGtHZ01UUTRGUnpHUWtU?=
 =?utf-8?B?UVNZNEtXVmQvS2x5MGtvaldTZ29zQ1FNR0U5c3BNT2dSTnB1d1M1RE5uSEx2?=
 =?utf-8?B?QmxzQjhyR0pJU3hEMzRvdy9LMDBnZmJMMTFiY0V4OGhPYW1jYy80bXpFbkRp?=
 =?utf-8?B?R2gyY3BFUHp5aExXNCtlK3Qyc1grZTdyUTFmcWVWR1J6V1BIeUpHRzdSNzVm?=
 =?utf-8?B?Rm1FbTBMc2tzcFFyQU1raTBKWElFb2R5T1VkRzdIVFhIeDZMbmpZUDljYlB0?=
 =?utf-8?B?ZXMyQkFDWkxBdUhjbGtNWFlzeWRiLysvanFXcjhzN2FsT29rd0xzTWMxMm52?=
 =?utf-8?B?cWpCM1Z3dWw0OHBUS055emNlU0ZmWWxZMlJjOVRFa3p4YW9HZmVDM1k5RExp?=
 =?utf-8?B?cXZROHJYanYrNHUyR1VxdWFTeU9SSWJzalF4RFdOQSsyZmdOUncvdE02NDJM?=
 =?utf-8?B?Tmd1UWR2dHZTMTB6OFJMOXRnenN2aHJPWmVJZVhBMXpjdGxSVTE1aHpiOUpn?=
 =?utf-8?B?c2ZhVlFCTStMcWc1Q3dMejUvYjZZUVpvSW04eTY4d1ZBNWxwRG9SbzZHdEdi?=
 =?utf-8?B?MUszcHVsM3ZsNGk1dytmRnpjU1hqS2xZNysvcVIycHJrWW13S3k4Smx0S1Rv?=
 =?utf-8?B?bGJMZ0gwK0RPVUxESW0zMm43UkhZcTNaUDFWNUpWOXhtL2g5K2dOaUhaNHlz?=
 =?utf-8?B?NDJnb0tlSkk1T1lsUEhkV2Z0T1BEUWVsR3RGeDFHL0RTVy82NTJKWk1UOTY5?=
 =?utf-8?B?NFJxOGN5d2JBSjArYlRUNWVucEtaMVpsTnRNdnEyQUhVcVRBWmRVRnlvcWRL?=
 =?utf-8?B?bjBpTzU0dUFHeUVaV2ZqM1BiM3UxL2licm9HQWZHUjNJU2ZpdG1ESDR1ZUs5?=
 =?utf-8?B?aWsxRHJZYXFoV1VPZEh0TkVvUm5UVzRXS084QnIzVmlkMjVVVjlEYVpQa0gy?=
 =?utf-8?B?V0E3eVh2RlNlbUlnQk80Y1dLZ2VWRHk3aldoU1UxRjFkTHgxSXRPVHlpNS9C?=
 =?utf-8?B?ZGtmRjVnTGgrcmc0R1g4VVJ5SVp2ZWYxckU1OE83SFZXZS9mSmxFOFpMbngv?=
 =?utf-8?B?QmVXY3UwSE5tR0N4UTg4cllndVJ2WWt2OHIxTkFHZ29KdWVVWDNpQjZTMVVH?=
 =?utf-8?B?TmRVdFZFTDhzVkpMOXI2VXpCYVpDbTliKzVPM29weVNFeXRLRzVnME5IY2Qv?=
 =?utf-8?B?dHA3KzQvd01FZlplT1JwbEZIRXNWWEc0M1JhT09yQnJHb2dBNnd4emsyNjE3?=
 =?utf-8?B?SGQ2KzlMSkdKV1hsMit5cUljdTBmeFJtOW5kZGhDb3dQQU5ZQ1JoNVJoWUVO?=
 =?utf-8?Q?l5/gjEhqp3EZT3xUOq+g4G+Trq8hLIV5c7R9CECqT3qD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da5f51d6-c7c3-4197-cd4d-08db70cf6218
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 14:13:41.4098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fTSNQNXDa3D343Lu07yB8BIOVk9U3NwJrdNHUM43prvy4FBGuUiir4R8GOaBXmS5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7228
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 19.06.23 um 16:11 schrieb Thomas Zimmermann:
> The callback struct drm_driver.gem_prime_mmap as been removed in
> commit 0adec22702d4 ("drm: Remove struct drm_driver.gem_prime_mmap").
> Do not assign to it. The assigned function, drm_gem_prime_mmap(), is
> now the default for the operation, so there is no change in functionality.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 0adec22702d4 ("drm: Remove struct drm_driver.gem_prime_mmap")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 43613569801b6..07e16ad465d06 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -2879,7 +2879,6 @@ const struct drm_driver amdgpu_partition_driver = {
>   	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
>   	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
>   	.gem_prime_import = amdgpu_gem_prime_import,
> -	.gem_prime_mmap = drm_gem_prime_mmap,
>   
>   	.name = DRIVER_NAME,
>   	.desc = DRIVER_DESC,

