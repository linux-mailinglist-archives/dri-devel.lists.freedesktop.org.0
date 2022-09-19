Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D395BC397
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 09:44:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D95110E553;
	Mon, 19 Sep 2022 07:44:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2083.outbound.protection.outlook.com [40.107.92.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D48710E553;
 Mon, 19 Sep 2022 07:44:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RnWDeOb2Rjymknmxz89KhKRk5NVW/6yy1j5TVWK1FmEjVvLhSHIJkUP9sTm+MSw2Vczdthb6YeiHP0i5iOuffzdgMw2Awe9fSOpiwxPCrAQIB4AWRZVIcF2Q6nxd4bXQXOsBVdVnwtCeRJugCYw8gSY9v+QVCe/MyWqnE69ttViBZb7E9ClUgp4DTuMuoAvFZbE0Tg7Ap/Irx9JG8qKlt7PbFDp/fia1MpJgjJMhWrffLusD0pep1sK9bl1SIrpCixMH0mVsOyIbmJd4gON88LzHhzSIxlvw0OKbZ6iJnuAqAkNjwD/kyJRiHf6vpAyP429POhJEpQ9Vvv8v1o7bAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rtlskHon3z82LyKFtavsij98O+Glv5Jhp+/tGqvsVsc=;
 b=JYEhX9Dp/2La9FnXdbtDaz4pR0kpHwkVApO7iErwF766maT4k3fB0bOh623VrV8kI6D5YNXujY4dZVF8HsYxf+MU+qnOXjdbvhYXPAGkhSQONQwCRFM2rw8fkn4GIPE16zjR9lMUO5oP8z1ydhJglQw5iE5XRL87PKdfvUwF4Plw6fK6lal8QODg4h/OAqVWGy35J+h+FS6MYqmxcjwEqlDQEbQQQ68L65YMK/yjFLvGWRS7yMyfFg9qBRN80TKXhzlZLved3/i0S8k7TepKs2ZQwDOLX0V9ccDzMloiK3u9jmRkmOosGtIeuXXp3mo28thnnPM04bdvQzsQoNXBtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rtlskHon3z82LyKFtavsij98O+Glv5Jhp+/tGqvsVsc=;
 b=y/Xl9oqjBVxGBsvwKhi67Ju2ErwxRaDL3kWqN84rGsVV/YIgiEPivyS0sXYYdG86A/iFfQcJE204xlceTRkOVMGz+SMwwjiiLo0D3SSuniMiyUSZKsVUc0I7feQjlcXTpWI3NWqe3bNdujnedayuDAl0KA2c9OAghbxWisxWQm4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH0PR12MB7096.namprd12.prod.outlook.com (2603:10b6:510:21d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Mon, 19 Sep
 2022 07:44:21 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed%6]) with mapi id 15.20.5632.021; Mon, 19 Sep 2022
 07:44:21 +0000
Message-ID: <9b7f030f-eedf-9a14-b442-6afa0c67c5f7@amd.com>
Date: Mon, 19 Sep 2022 09:44:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] gpu: dc: fix enum conversion in display_mode_vba
Content-Language: en-US
To: Zeng Heng <zengheng4@huawei.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 Xinhui.Pan@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 Nevenko.Stupar@amd.com, Pavle.Kotarac@amd.com, aric.cyr@amd.com
References: <20220919014125.3295213-1-zengheng4@huawei.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220919014125.3295213-1-zengheng4@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0029.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::22) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH0PR12MB7096:EE_
X-MS-Office365-Filtering-Correlation-Id: c6dad8c0-fec5-408e-22ec-08da9a12c3a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o/4yynGOJReHTC5WrTAWroCrvyWmAHyzy7A7n7cdb3oCZ3beZ1GUTLdrN/Bg8s7y8O1k+yjBaJgPvkSXPsATkWw+2lp/1dySe458zrZMRbR/6uNXKZ5Vx6B+e2okPe4qXwWVWxamL36RF0NXE1NQq/BEFCfzAp+kDD0cviM1VwhIy7siYCRCzCJx8wZ92A+Z14OnI3AxRgyudzOTtwHtXDuYXd4coF4AJJsjtXpZHpeVbnYMwX7rKytlXY0o6sHIjhmeDHFaI0XEi5oQwSR4P0gRKe1mQql825W43fLdz7orPSf8drKL854+i5ngQUHCrGNYr5eBbXB8Tf6CRUiGfeG/ARBWvr5tuobqsXTRW90b+d7ecyCuU0tJjSnIYWaNGDP+8vsCY6KZ8uPHBMKWJeIPLva0OvORWTMTTl/4T5rTp2+zYkUNTzhAd7/0NEIDO1uou8f8fkNJ/5PJ7Bt8aJvRzlgMLi5advClSnpK85+eguSRxWYD3qu1nc9vL/8rf8Tx6ebZ4O0Nwu5wJ219BGo8GD+rIbn7rFZd13XzbOxc3fsFO7gDZsBOC9AE9HjV6Y2Q4tOlcf51i06b/GMt7onjWad7Q0yfmxGLegUZpiZ8bMdIlbFZCbaDwAGsKij7Mm0UZz9uRaLl1B5jIkuNi83lXqZz+z9hklCRgEU4nv+bRxHBvzQo7NfB5Xry/O3KbfsFCIUlA4mW+aqC/wEkRaZ6ixEO2GaP5JiieGaq9dtRfgUJfpPZiSO3WQdEs94t5oHTBHz9cCL83fVYkCXZsSDz6444Bp2K/eAaPqI/UWP9AhmTGk8HND4y8I+puAzs3gOoSydzX+DInemh2yt7Hw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(366004)(396003)(136003)(376002)(39860400002)(451199015)(31686004)(38100700002)(6512007)(26005)(6506007)(6666004)(8676002)(4326008)(2906002)(2616005)(41300700001)(921005)(86362001)(31696002)(186003)(36756003)(5660300002)(478600001)(8936002)(6636002)(316002)(66946007)(66556008)(66476007)(83380400001)(6486002)(45980500001)(43740500002)(44824005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWdWaFFpK25XaUxKaDZXeVJyODNVQ2FYakxiS0ljTlJrK28vZVprMzg1OXgx?=
 =?utf-8?B?ajNpVktuYjFsMHphWG91VzR1ai84cno2cGR6RTBSMlFMNDlKTXVBYnQ1bWtS?=
 =?utf-8?B?MnpXN1FXcVpvNzNFWllaZ29IRENPczlqWExweEwzekFVUnl4NkxpZThSM01o?=
 =?utf-8?B?ZFNHRzBWMmgvUTVCVHlvUGFhUXNjUmljOUNDdkNlaUtObG1xMzdScWJUSTIy?=
 =?utf-8?B?MXl6RUNNblM0MXBhTFA5ckt6c1VaalNwenRxZXZSTTg2U0FyUmhrdDEvL1JJ?=
 =?utf-8?B?S2ppNjh5bDdnY3JSMEVzdVovUXhQdlNLOUU1RUdIQW1nRHNoUDNGUGhjZEJD?=
 =?utf-8?B?emxtdlNQRHowQUdiTUphODNNRnpKWXFjRVF4dGJwZUxFRVZheTl6VkxSTEtM?=
 =?utf-8?B?TFVtTWY1YXVONWJzR2hHWFkxaVRWVmp2ZFppV2VGSkVxVnM0aVd4bkFFMjZU?=
 =?utf-8?B?YWpYdGgyeG91Y0lWeGROWFF0elBHbVl2RzUzbldFV0FPbkZFb1VpOUhEQUtJ?=
 =?utf-8?B?dzhkVDhSWkovdVpUQTErRlNRYzgyc0tnY3kybElmaUJpOVhoNTJ4aCt4NHlL?=
 =?utf-8?B?a3I3Z0FtS1ZaWWVwcGpuU0pVL0lWa3R1MURoUGxtczFhRERmckN4dGFRYTNU?=
 =?utf-8?B?Uy9QTTduUVQ1bjhlcUxSUit2Wms2VFJ1NDlSY0V2anRQYTdSdXRoSGZjMVV5?=
 =?utf-8?B?RmJSY05jSXhiTjlhUVZuYnlBZWgva2JXLzJRR1FZcWQwc3VwQXhySkZReXFy?=
 =?utf-8?B?UHBrTkpqVTY4ZUg4QUc4YytlS3VnNVdFTUlYR0JXOFlYSlN1azE2TlFpWTRu?=
 =?utf-8?B?VEQ1VmR0dXNtYkVaVFkwekQrWHZ2YUZHYzl2ZGNUR2NyMHBNblIyYnd0eFJn?=
 =?utf-8?B?b0xwOGh3VHhuWmNobVJOOGhOdmhqUjFPdmpVc2N1OWpVZkE0dTlMNnE1eklH?=
 =?utf-8?B?TmJBZXhERTk3RkMvQ0t4WVZtcHdmeExUdTBtckZ2R29UbUFaOXRlaXlNRCtD?=
 =?utf-8?B?NDdNbHRjaTNFazJ5VVpSa1Z3SHZSdDRKTHVyR1BKbFRpWUVMamNBSUkza2I3?=
 =?utf-8?B?bGxPc21ybXNuVGt2UVFKVis0S0VIZHI4U2NPbVFGc2p4OXcyc3p4dmJZSE14?=
 =?utf-8?B?UmVWMFFhczNXS0daTHRmbjRtK0lNemhnbWZSTW1EdWgwRjhlYWt6SnU5M3Nr?=
 =?utf-8?B?UWMxY0NJRWhRcThFNEM4YlZ3WGpRQ0dpK0g5M1NoUzQwTU9UWGtxNnFSK0Y0?=
 =?utf-8?B?R0NqK1E3ZCtTM3hVSnhFOHBQcGVWSnZCWkVJRFZadjhqeEcyd3dwY3pnTmVR?=
 =?utf-8?B?Nks1dUtFMGk2Wm1NV212TzZHRVpuSnFHWUdweDJ3NDZBQVpidEcwem9CODhI?=
 =?utf-8?B?SlpzS1FaRzZxZlo0Q2NpUUZwODkyb3A3RUxReDNZWmpEZVVSYm1EcklKQ1pM?=
 =?utf-8?B?SG1LSU5QM0ZIVHRZU2xhSGlaV1dENmtkK2ZmUUlXREhuMHBid3dWNkkySENZ?=
 =?utf-8?B?RWxaUWpMNERoSHR3cS8yRWpMM3BQaHZWUGdaRWNnRzdXZ0E0WVNOY3EyQ0g2?=
 =?utf-8?B?OVZUMlJ5TmJBenpsZXRFNE9lSTBQWkdPY1pvYmhJcEhxVjN5V2NWN0JtdE5N?=
 =?utf-8?B?VitVeXJsWVI4cDhsQ2xiZjB6V1BhRUI2K1g2ZHB2cEcxUGlIU2tlU2FycHEx?=
 =?utf-8?B?SE1DTUNmZ3RCa0pSQ1RXTXJNejhBUTVpZ3RremJ6WHM4K2NXdUU3RHduUklx?=
 =?utf-8?B?WkFvL09Fd25rYmJoclUvNERxZ2tCUy9Yc2VzUTErRzBiQU1sT3dGQXBoVTRt?=
 =?utf-8?B?eWFqMFREWWFFR2NNV29sSVM0Tmx4NnNuQWZuUmpNeWl4UWhkR05DN3g1MytN?=
 =?utf-8?B?eHEyYW95dU45QWIyVTdKK0w0OHExKzF2Sk5GRUdvK3c4Qzl5cG44YW1tWFJX?=
 =?utf-8?B?eGlPMERxS0FvMWdqWlZWMXhXRHZWWjdWK2pjblo1S3U1MGJ6dCt5WmRMcWw2?=
 =?utf-8?B?ejkyckR0SFVUNXVDaWNhZDlSUEozclEyM0RabHFGb0p4UHJ3TjNWOFdtT3lR?=
 =?utf-8?B?ZmZhYWRZbFVnT1p0NHh2TWx2Y0NBWjhDNXBFcnJ3eXBoYmVyR0lLcmhmQ3B0?=
 =?utf-8?Q?dASFq+JCHDDMwa9vSIM3YOl0+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6dad8c0-fec5-408e-22ec-08da9a12c3a3
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2022 07:44:21.0402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OvlTM1l2rsz8ItG/xmZNiT5+1QalPec5ty3UgQXaVbuE9a0Vq/gOew2plrbGOqUx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7096
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
Cc: weiyongjun1@huawei.com, liwei391@huawei.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 19.09.22 um 03:41 schrieb Zeng Heng:
> Fix below compile warning when open enum-conversion
> option check (compiled with -Wenum-conversion):
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:
> In function ‘dml20_ModeSupportAndSystemConfigurationFull’:
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:3900:44:
> error: implicit conversion from ‘enum <anonymous>’ to ‘enum odm_combine_mode’ [-Werror=enum-conversion]
>   3900 |     locals->ODMCombineEnablePerState[i][k] = false;
>        |                                            ^
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:3904:46:
> error: implicit conversion from ‘enum <anonymous>’ to ‘enum odm_combine_mode’ [-Werror=enum-conversion]
>   3904 |       locals->ODMCombineEnablePerState[i][k] = true;
>        |                                              ^
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:3907:46:
> error: implicit conversion from ‘enum <anonymous>’ to ‘enum odm_combine_mode’ [-Werror=enum-conversion]
>   3907 |       locals->ODMCombineEnablePerState[i][k] = true;
>        |                                              ^
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:3960:45:
> error: implicit conversion from ‘enum <anonymous>’ to ‘enum odm_combine_mode’ [-Werror=enum-conversion]
>   3960 |      locals->ODMCombineEnablePerState[i][k] = false;
>
> Use the proper value from the right enumerated type,
> dm_odm_combine_mode_disabled & dm_odm_combine_mode_2to1,
> so there is no more implicit conversion.
>
> The numerical values of dm_odm_combine_mode_disabled
> & false and dm_odm_combine_mode_2to1 & true
> happen to be the same, so there is no change in
> behavior.

In the subject line the correct prefix is "drm/amdgpu: ....", but apart 
from that looks good to me as well.

But our DC team has to take a closer look.

Thanks,
Christian.

>
> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
> ---
>   .../amd/display/dc/dml/dcn20/display_mode_vba_20.c   |  8 ++++----
>   .../amd/display/dc/dml/dcn20/display_mode_vba_20v2.c | 10 +++++-----
>   .../amd/display/dc/dml/dcn21/display_mode_vba_21.c   | 12 ++++++------
>   3 files changed, 15 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
> index d3b5b6fedf04..6266b0788387 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
> @@ -3897,14 +3897,14 @@ void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>   					mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine = mode_lib->vba.PixelClock[k] / 2
>   							* (1 + mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading / 100.0);
>   
> -				locals->ODMCombineEnablePerState[i][k] = false;
> +				locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_disabled;
>   				mode_lib->vba.PlaneRequiredDISPCLK = mode_lib->vba.PlaneRequiredDISPCLKWithoutODMCombine;
>   				if (mode_lib->vba.ODMCapability) {
>   					if (locals->PlaneRequiredDISPCLKWithoutODMCombine > mode_lib->vba.MaxDispclkRoundedDownToDFSGranularity) {
> -						locals->ODMCombineEnablePerState[i][k] = true;
> +						locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_2to1;
>   						mode_lib->vba.PlaneRequiredDISPCLK = mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine;
>   					} else if (locals->HActive[k] > DCN20_MAX_420_IMAGE_WIDTH && locals->OutputFormat[k] == dm_420) {
> -						locals->ODMCombineEnablePerState[i][k] = true;
> +						locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_2to1;
>   						mode_lib->vba.PlaneRequiredDISPCLK = mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine;
>   					}
>   				}
> @@ -3957,7 +3957,7 @@ void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>   				locals->RequiredDISPCLK[i][j] = 0.0;
>   				locals->DISPCLK_DPPCLK_Support[i][j] = true;
>   				for (k = 0; k <= mode_lib->vba.NumberOfActivePlanes - 1; k++) {
> -					locals->ODMCombineEnablePerState[i][k] = false;
> +					locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_disabled;
>   					if (locals->SwathWidthYSingleDPP[k] <= locals->MaximumSwathWidth[k]) {
>   						locals->NoOfDPP[i][j][k] = 1;
>   						locals->RequiredDPPCLK[i][j][k] = locals->MinDPPCLKUsingSingleDPP[k]
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
> index edd098c7eb92..989d83ee3842 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
> @@ -4008,17 +4008,17 @@ void dml20v2_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode
>   					mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine = mode_lib->vba.PixelClock[k] / 2
>   							* (1 + mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading / 100.0);
>   
> -				locals->ODMCombineEnablePerState[i][k] = false;
> +				locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_disabled;
>   				mode_lib->vba.PlaneRequiredDISPCLK = mode_lib->vba.PlaneRequiredDISPCLKWithoutODMCombine;
>   				if (mode_lib->vba.ODMCapability) {
>   					if (locals->PlaneRequiredDISPCLKWithoutODMCombine > MaxMaxDispclkRoundedDown) {
> -						locals->ODMCombineEnablePerState[i][k] = true;
> +						locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_2to1;
>   						mode_lib->vba.PlaneRequiredDISPCLK = mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine;
>   					} else if (locals->DSCEnabled[k] && (locals->HActive[k] > DCN20_MAX_DSC_IMAGE_WIDTH)) {
> -						locals->ODMCombineEnablePerState[i][k] = true;
> +						locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_2to1;
>   						mode_lib->vba.PlaneRequiredDISPCLK = mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine;
>   					} else if (locals->HActive[k] > DCN20_MAX_420_IMAGE_WIDTH && locals->OutputFormat[k] == dm_420) {
> -						locals->ODMCombineEnablePerState[i][k] = true;
> +						locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_2to1;
>   						mode_lib->vba.PlaneRequiredDISPCLK = mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine;
>   					}
>   				}
> @@ -4071,7 +4071,7 @@ void dml20v2_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode
>   				locals->RequiredDISPCLK[i][j] = 0.0;
>   				locals->DISPCLK_DPPCLK_Support[i][j] = true;
>   				for (k = 0; k <= mode_lib->vba.NumberOfActivePlanes - 1; k++) {
> -					locals->ODMCombineEnablePerState[i][k] = false;
> +					locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_disabled;
>   					if (locals->SwathWidthYSingleDPP[k] <= locals->MaximumSwathWidth[k]) {
>   						locals->NoOfDPP[i][j][k] = 1;
>   						locals->RequiredDPPCLK[i][j][k] = locals->MinDPPCLKUsingSingleDPP[k]
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
> index d40d32e380f4..f15e82492381 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
> @@ -4102,17 +4102,17 @@ void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>   					mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine = mode_lib->vba.PixelClock[k] / 2
>   							* (1 + mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading / 100.0);
>   
> -				locals->ODMCombineEnablePerState[i][k] = false;
> +				locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_disabled;
>   				mode_lib->vba.PlaneRequiredDISPCLK = mode_lib->vba.PlaneRequiredDISPCLKWithoutODMCombine;
>   				if (mode_lib->vba.ODMCapability) {
>   					if (locals->PlaneRequiredDISPCLKWithoutODMCombine > MaxMaxDispclkRoundedDown) {
> -						locals->ODMCombineEnablePerState[i][k] = true;
> +						locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_2to1;
>   						mode_lib->vba.PlaneRequiredDISPCLK = mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine;
>   					} else if (locals->DSCEnabled[k] && (locals->HActive[k] > DCN21_MAX_DSC_IMAGE_WIDTH)) {
> -						locals->ODMCombineEnablePerState[i][k] = true;
> +						locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_2to1;
>   						mode_lib->vba.PlaneRequiredDISPCLK = mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine;
>   					} else if (locals->HActive[k] > DCN21_MAX_420_IMAGE_WIDTH && locals->OutputFormat[k] == dm_420) {
> -						locals->ODMCombineEnablePerState[i][k] = true;
> +						locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_2to1;
>   						mode_lib->vba.PlaneRequiredDISPCLK = mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine;
>   					}
>   				}
> @@ -4165,7 +4165,7 @@ void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>   				locals->RequiredDISPCLK[i][j] = 0.0;
>   				locals->DISPCLK_DPPCLK_Support[i][j] = true;
>   				for (k = 0; k <= mode_lib->vba.NumberOfActivePlanes - 1; k++) {
> -					locals->ODMCombineEnablePerState[i][k] = false;
> +					locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_disabled;
>   					if (locals->SwathWidthYSingleDPP[k] <= locals->MaximumSwathWidth[k]) {
>   						locals->NoOfDPP[i][j][k] = 1;
>   						locals->RequiredDPPCLK[i][j][k] = locals->MinDPPCLKUsingSingleDPP[k]
> @@ -5230,7 +5230,7 @@ void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>   			mode_lib->vba.ODMCombineEnabled[k] =
>   					locals->ODMCombineEnablePerState[mode_lib->vba.VoltageLevel][k];
>   		} else {
> -			mode_lib->vba.ODMCombineEnabled[k] = false;
> +			mode_lib->vba.ODMCombineEnabled[k] = dm_odm_combine_mode_disabled;
>   		}
>   		mode_lib->vba.DSCEnabled[k] =
>   				locals->RequiresDSC[mode_lib->vba.VoltageLevel][k];

