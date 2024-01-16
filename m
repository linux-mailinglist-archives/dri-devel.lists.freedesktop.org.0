Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 338B682EBFC
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 10:46:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7801F10E458;
	Tue, 16 Jan 2024 09:46:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2074.outbound.protection.outlook.com [40.107.244.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5E9010E45C
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 09:45:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YsYUBg/e/BhsiQsQ8tutD8fYzoL5Kg4BFx53oX1lHk2Y2hiXRlA9VWgms6DRG/z1ipJKSDBuxDNxa3XoRC5BlvUayqVptb+MEH19E9CgFrZiSMbPVpf8dJ6kxcZKMEBD4hhv0J75PmesOXAV+xio43OJeCPKd2ndd8TDKXd3CUzbx7kTadG4qSDg0S13p1ipjr3RkRjAczYBlzS7SnXz3T8TioTOsc3UqeQhg6BuGg6C1dQGLM5abFAyFoGs3n+1zsr1RN6WIgT6rpflbO4JKzzqx4WBAz2JTryC/OIi4mum1JURZMyz1ztMjJFn6/W5EwECXvSprhuUp73fZtCDTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sx38MaBtLlwNz+Y6BGtS9Y9cErc3OytQB03/FpvBb8o=;
 b=IKWYHybsTGHpGU6nKD7ami4UfszRAUGy5mvDwJmT7FeXUVJxeUBRtfdftvkeU+3VPglE4aybvqm0EQXs6p804Z5vyvvx0IxY0NWke5prdr4RMzKVa6gzYFVOUj8qm7JPKpoTOaK9PoeJSjiVAUOKZNAm7Lz9PC9bUEYeFt476wZ09kWUJwB3npzxlxUrwsFQxLNn5sZKAXaqBxmAsSJJMSuYEKwYEDJJtrutmj6jEya/mpPL0FTyw3FOXb+R25cxmQusMTTap1+0kd0Zlr5r8NMw+CSX89ih98khVxL5BrlVWawZiGHd8uP2ij8eZwSzWYT5CIbeWpprqNWKmo95ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sx38MaBtLlwNz+Y6BGtS9Y9cErc3OytQB03/FpvBb8o=;
 b=LWAdoX2Bryw8yjtsHOvgj3FSRzsZfbOAN72N+v0X4xoTRZjAqOiSXTmsG/4G+7MlTfJpfCDM86IoXhl8V0hyBIHxth3H7he7skrd+WGlFStPTHm9ZB0mp9f02ikJg5OINZ01TatdcwL+hSiTSVnX3FGn19vorBI0RaJ1DArPNpw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB6181.namprd12.prod.outlook.com (2603:10b6:8:a9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.19; Tue, 16 Jan
 2024 09:45:53 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7159.020; Tue, 16 Jan 2024
 09:45:53 +0000
Message-ID: <2b715134-9d63-4de1-94e5-37e180aeefd2@amd.com>
Date: Tue, 16 Jan 2024 10:45:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: only use DMA32 if needed for dummy_read_page
Content-Language: en-US
To: Yangyu Chen <cyy@cyyself.name>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <tencent_0B319B215E8D487CC082C0DA5E8E46B86B08@qq.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <tencent_0B319B215E8D487CC082C0DA5E8E46B86B08@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0426.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB6181:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a29006f-f3f3-4076-fa0c-08dc1677ee5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xMQRMYlNlsQKPgNsGzWsS0yfT99SLBpipMeKwj8kA1bdz76aDzgGqnHmZDKtKgE1789wSc+CPMcj0KzrQr060oAyd8G+EwWY0GHMueul+KEbQ0qQuIlbIA6wzG16frf69HJh0Nttp9bZ/jYjdHZsK7CCkJnrUgCZDE+GmT2mms1B4QHz2VMKnFO0gtx3QEZWWV7APllCIH1sZxGAjHDTvSxHpfHebvM7qq5a9sdKElSTgYKRbGaw9bhOCcpBNjqGfp7niu0MTdDdBMuxL090w2cWO5TW68TzxxN+sCanyDTxpCUZ/+hWu4zcLThvHrnn7BY+wl6IvKQ+/SKrT66l2o/rDwcB7/6JfFFhEIJ5KkHIu4UjW39tX4ZSt9FdtnufpdCHNC6NVIglhCY8W1W+2VTDLN9ZCmjW+PEtyKvF7RVVwBm9Uw0yPJSF99RyQXeTV3zU6TRiXzHimgATTobwI7n8+cTjQVg+9GSYEsBMDzAPxmhJIm0mMIkfZk0LLxHcS3jdXZIyVpQLm7T+j3Hj+rdNP7Aj7CnkyQ2qu+s+2M7gaocwmT8Y6Lww/PFGJdRoT1zcssI5Vi1AoebGAr//gPsrQ29J4lAe27SXXbhmBwKHITSz0PD73yjOpibwNj9gCUxxsLe+r5Nz1YvuKZ0sNQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(376002)(366004)(396003)(136003)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(5660300002)(8936002)(8676002)(66946007)(4326008)(54906003)(7416002)(2906002)(316002)(66476007)(31686004)(66556008)(6666004)(6512007)(6506007)(6486002)(478600001)(83380400001)(36756003)(2616005)(41300700001)(31696002)(86362001)(38100700002)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0dtWEdtc2FsOWRUUVlpQW1LNU15b3NhUW52c1lMVy9GOGhZT3hXRGFSQ2E2?=
 =?utf-8?B?RkFZRDd1NVhvWlBoQmZqRWYvRHpBVnVNUXBlV2oyWmRvNkw4NllvY21pbmVE?=
 =?utf-8?B?NVozOUtmQnUxZnJJcGFja0xEeEdjYzFXWjh4ME5NU1ZLeExTNFZYcmJnMkY5?=
 =?utf-8?B?Vm5jT2tRamZaWXBtUVhwU3NrWjRzRUhXMVk0eXl5NktYNTZLcG1LeTZYeTZC?=
 =?utf-8?B?SzlFRFFJaGU2aUY1NzVaSkdoTE1OV3g2eU9oMktkY1kvQXBUU1VxUlplV2Ja?=
 =?utf-8?B?SUVPVlRGWG14OFA3NWpORE9INnZlaytVc1hqU01YMGIxZG1xL0xnTGJicGNW?=
 =?utf-8?B?V0o5Lzk2VVg2R2RscG9tN0dNM3dNYnc1dFAwR0c5OXhyb1E3TCtiTk45blgw?=
 =?utf-8?B?ZTJnSnZqb0dzWW0vZG9qanl0bWY1WGpqelkreDU1ay9RSHhPMGFwMUdZSnNZ?=
 =?utf-8?B?Wkp4MUtTQXExZ1BVVFlBMjhud2UvNFYybzl4eDhhUEpWbEtxdHFMM0h3RlVr?=
 =?utf-8?B?MU04QkNjcVI3c1c4M3ZEdXFCdldscVNQQlJQalFjcEdRbE1Wby9ESUhZVDJL?=
 =?utf-8?B?WFNyS1pwaHBxMzI0SThYWDlONnd0bnRFbWFMSllhK1lVZGh1VkhaV2ZiUFZH?=
 =?utf-8?B?SlFid2tnYk5CYmRyYmNvL2h5UmlGY0RmaFU0cmRFLy9HblQwNTNOeUJFQTJk?=
 =?utf-8?B?NlZTM0JNL29tTWFqTStoNjc0OGFaSkNKV1FJUjR2c2RSb1JsRlpqK0RkZVdZ?=
 =?utf-8?B?K2VEVjJVclJXdHB0UGlzUkRXaWFLcFRZSWt0WVRERFhkNmIrUE1YTUNZM0Zi?=
 =?utf-8?B?allVU1paVlFQQW1JSEFVeks1RmVjbnpMaDBSdFp0R0dGRjBPbEtHYUNPNmRo?=
 =?utf-8?B?SlZIYWRCUmpCbTl4NlFYTVZTMWNadGNwNlZFdkxTNC8rc2dLSi9NL3hlTk5z?=
 =?utf-8?B?c2hXM0JqNXExbmc0SHRNKzZEamJZZkFyOTNudDJJQWEwazZEeUlYTXIyK04w?=
 =?utf-8?B?bStDSmhQdThFSDlENzZRSC9lTDkxbTBFeW5hckE1VnFrNFFDYllhWTNPT3JZ?=
 =?utf-8?B?K3RQZWs5b2hyTklBU2VsR2wvRFdyb1ducHlIbWJPcEg2NGVhbkhlN1k1MStj?=
 =?utf-8?B?TEdZR2YzSzYxbUl1ZStXVUNXNy9OL2NnUmplS2YwMXhtajZNbld2VzhadW10?=
 =?utf-8?B?aWMrZHBaZk9vdm1qUXh4S0hWT2R1c1NVLzVCeXZKQ2VHQmVmMy9OZlZqcngx?=
 =?utf-8?B?c1EwbTl5RUlSb1Qvak5UcWtqUUlJazExNGYrdTlQY0NhQ0puOFp6TWpmTFR3?=
 =?utf-8?B?WTh0LzF5RkRyYnU2SnoxckllaGd0cnExYlNNekpoYmM2VzBuemtjNmVTL1RG?=
 =?utf-8?B?WVRtWWZtMFRqektzbWdub1l2SmJ2Wm1TWHVRNmM2a3ZBYitQSTB3UnhBUkVW?=
 =?utf-8?B?MzBMZEo0aWIzSHVXV1hJZkNSL2dMbEdFcDVSankzbW9IWUlQTlBsNzByTkZt?=
 =?utf-8?B?SGdIYThGWmk2MzFSZmRjcFVrNmlSb1Y3eks4a1htSWR3TytIbWQ0UmgzVTFG?=
 =?utf-8?B?dGNkWE42dSszamt4aDJvRFNLM1hPS2hZMUZRK3pncFVESzU4UVhiazh6L3Zm?=
 =?utf-8?B?eW9oQ2pCb2lubXZvVWRoTlNnR3djZ2lpQ0JmaXpiNEt3MlpDNGtNR2FCdDMv?=
 =?utf-8?B?ZG9TUldrSlRPNTNuc3orckdIY21RNHZRN2FmY1dIbXUyQ1RoV2hwRjhCN3N2?=
 =?utf-8?B?TWRJV1BFSVRmZGdxc0hybzdXLzEyS2lFdUZpN1hQZ3BuM3NGSEFYTE9hWnFH?=
 =?utf-8?B?c0hJUklydjlPbXhoTVArWDgyY2ZsN3pUT0l4WWZONzZGSFE0ZnVhZzAwTXhr?=
 =?utf-8?B?VVkvVDFWT01IRmpPRkZiZi9VSWFmalovMnpLVDFFNU1SR1ZabnFzSy93amY3?=
 =?utf-8?B?ZDRJczZ4OHZobnJ5ckUvT0Z4VWhiSDNrSmpYL1llQXdOWmdVQ3NBTnZWUGRq?=
 =?utf-8?B?ZU1DM2JlVzVuTDZwczZXMnJ3aC9IcTkxUi9XZ2o2VTE2akdJcjNKZ0NXNmV5?=
 =?utf-8?B?S3hNbTdkalppNE5haExCUEVpNnJIMWp3Vy9nbzVaUEJxVm5pU0RQdG1UODVy?=
 =?utf-8?Q?skAYzO6oZZVoe09hx6U7hikH2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a29006f-f3f3-4076-fa0c-08dc1677ee5f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2024 09:45:53.6875 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GMYgsOa2FXtmK5F/m6mOuf1R27qr9tH0DSonyj19EHPyWTh7BK5tTSZ4XB5WFWs9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6181
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jiuyang Liu <liu@jiuyang.me>,
 Maxime Ripard <mripard@kernel.org>, Huang Rui <ray.huang@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Yichuan Gao <i@gycis.me>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.01.24 um 08:24 schrieb Yangyu Chen:
> Some platforms may not have any memory in ZONE_DMA32 and use IOMMU to allow
> 32-bit-DMA-only device to work. Forcing GFP_DMA32 on dummy_read_page will
> fail in such platforms. Only use DMA32 when it must to get the bug
> resolved.

Well that makes no sense.

If a platform doesn't have a ZONE_DMA32 then GFP_DMA32 is just ignored 
as far as I know.

This patch here won't work since the use_dma32 flag is a per device flag 
which can't be used for the global initialization.

Otherwise this can randomly fail depending on if a DMA32 device 
initializes first or after some device with larger addressing 
capabilities. This configuration is quite common on older motherboards 
with both integrated and dedicated graphics.

Regards,
Christian.

>
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> ---
>   drivers/gpu/drm/ttm/ttm_device.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index d48b39132b32..62f16fb72428 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -63,7 +63,7 @@ static void ttm_global_release(void)
>   	mutex_unlock(&ttm_global_mutex);
>   }
>   
> -static int ttm_global_init(void)
> +static int ttm_global_init(bool use_dma32)
>   {
>   	struct ttm_global *glob = &ttm_glob;
>   	unsigned long num_pages, num_dma32;
> @@ -95,7 +95,8 @@ static int ttm_global_init(void)
>   	ttm_pool_mgr_init(num_pages);
>   	ttm_tt_mgr_init(num_pages, num_dma32);
>   
> -	glob->dummy_read_page = alloc_page(__GFP_ZERO | GFP_DMA32);
> +	glob->dummy_read_page = use_dma32 ? alloc_page(__GFP_ZERO | GFP_DMA32) :
> +					    alloc_page(__GFP_ZERO);
>   
>   	if (unlikely(glob->dummy_read_page == NULL)) {
>   		ret = -ENOMEM;
> @@ -200,7 +201,7 @@ int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_funcs *func
>   	if (WARN_ON(vma_manager == NULL))
>   		return -EINVAL;
>   
> -	ret = ttm_global_init();
> +	ret = ttm_global_init(use_dma32);
>   	if (ret)
>   		return ret;
>   

