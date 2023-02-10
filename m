Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79513691D86
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 12:04:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D42E610ECE6;
	Fri, 10 Feb 2023 11:04:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2058.outbound.protection.outlook.com [40.107.243.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECD3110E0E1;
 Fri, 10 Feb 2023 11:04:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dytE7/sODw8oVUfXI1abeRJcDfkRP78YD0KBUcrr+XJVUnEJfYW+t7IEWTGLchg+Qt/paBZQS2Jz1s3RL8fj/MBe3uvOUBxuilFjKUcOw2XGnBGIGAaCC3V3uZ9+oFUgvOpbTWimim87zUw4qEyBl5sbyo9WhCy/3Cqtl04cku/FHiwNpEQMvt9X/Ixg4keCKhwbbqyb0MGoNPu+P5NpOMhkEBiXQ3PeCpQytZ7yL2KBfA6MoRgY/6osrZdzOWEilDNoyL7hSOQT3//FnvPMcrZ5Ja/tiOMMbfC+f5PPbLFCwkkKjKuVdsUGHHP5d52TEwFPUF5NfY8VNlN4uxUBwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3DEfAmeKIX0591zgfW2nC8HJjs8Ffmni9PBNGD7ww/Q=;
 b=DPZVntgIuEaFwy5/qsLnAfTCPl4WejOgDudT7srgFnghbm0K+5WTYGuJ4D80H4dWIvpSCXiYlZvzG/GMOlQCfsigL8gR4wLQr5fc+N19keC5HX1wpEwlnxoYwZGioZffk9q5fHSt7Dyn5M/yQt2q9PWop/ZD4b5XXVkO7gz5Td4C69kJwX4C8ibpnrhOxnQfTtqjjRil5z6hxExkfmCbR7jAddRU63g3sUCacV2n/YTbr847TVa8k4iY3SXmLqavPAF2gGuYMiFaL9Z0mn3Xj/ccXAtMkrmHygCbeOe8YHrX3+RKmr/XRvYxCfcjEXjvtkZA+wluTYSdjrqZoFNtxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3DEfAmeKIX0591zgfW2nC8HJjs8Ffmni9PBNGD7ww/Q=;
 b=kKShBHlxEYKIAq1oXuogfjYk9mH5R4/XstpthO3xEqJL4bF0OkWidBOqRHzTct87cOsMH1ZBcOn1AaE4n3rGooAiAAr6o5pp5y6P1lUd7hQY8oVLaEKuBnEWcAIzGMi4YhDHPYWL7BwvbKXKVrx0G7Ot2Nj37d20TVTehIhGoIo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4155.namprd12.prod.outlook.com (2603:10b6:5:221::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.21; Fri, 10 Feb
 2023 11:04:02 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6086.019; Fri, 10 Feb 2023
 11:04:02 +0000
Message-ID: <03b9cbee-e453-255b-923c-6b116b9e2cf1@amd.com>
Date: Fri, 10 Feb 2023 12:03:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/4] drm/gem-vram: handle NULL bo->resource in move
 callback
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20230208145319.397235-1-matthew.auld@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230208145319.397235-1-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM6PR12MB4155:EE_
X-MS-Office365-Filtering-Correlation-Id: e14eb0a5-4dec-4e98-e611-08db0b568411
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NbZcf8YPJnuHWTZPkGUTvFDWR4CfEf9RrNoA/L+6aO3tpl4oo8Adqw/VAGKWm+AB4oyvoL2eBpeyNes0Ej8gIk/FFgVyy51lmip6OspZM8gTYWiz3QPHQfA+FtFAz1x+QpM+d9TKp6shP4s04AGrHC/gF6ZLbFWMopdklfM0OxXGy3UqCQ90k+99mUNX8AlvnNGJkLG8b8c3kKyPoWf2CCR7QKYquiZY6w8PkWMPRLxDI8ldkizZt3ARa+lZwWHpj3zGMyd5i+B/5hE86+QAWHgCSJFOMczEWS2phSj4jBVmDTj1J+nQUSCih4d0LPbnQ6Qx7ZYHJxprDBWPkF1PwDVuV7xoUSJur/MwbEI8vTx9cm6QxXDyNMHZk1+LwTlahdjK3/kTSlSYc+zqC4CWyyTgfqoxwb6xM++EUIPPndWQOkc7MulaMYFmBVFkJJOsFbiZd/pi5QiUUtnRkxqMak+iovrJpfCo2SvoYWMACViTvR+2kuB+AKaeLEjcYa7fPb9ARgAUYWW5LJziLh5vpt0Tlma/3PndJUZv5HOH0BcHhdhC3FHStfCk0w417fr9XBWF51DSqiN7pXWWSFJpSff43sFA7ZhufGl3J9LTzpj1X1OITw60Y8JanMx4ZTb59FwVri4tLeZloKJt7+rOfQ2SyBIHeGPJIP6jHEKFlaDamaxtAXmtjq7TYlYnqk91aFcivGxFGmC+7vI+gfsIXsFsEBZRh+3CAPRXTdPcq4o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(136003)(396003)(376002)(346002)(366004)(451199018)(31696002)(86362001)(36756003)(38100700002)(66476007)(66946007)(66556008)(41300700001)(316002)(8676002)(4326008)(8936002)(5660300002)(2906002)(66574015)(83380400001)(478600001)(6666004)(2616005)(186003)(6512007)(6506007)(6486002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2w1QnJWR29ZRXNMaGhQVm9LMnRoNXhIK1N3a1QyRmFmWC9FdUh5N2dvOWtX?=
 =?utf-8?B?S25nSlgrNm11TVRTWVlvVEpIbjdkY2NtQWx6RkIwYzRTSVEwRERBSVlyTlYv?=
 =?utf-8?B?b2dIMWpkNi9SbWhnYUNSK2JndE0zMVJrZU8xaVF4aWlxMmlWdWUwSXVsYUtz?=
 =?utf-8?B?ZTk3c2RtNnZVeE1PZWRrUVJKVkFFa1ZycVdPUU9GbDdsWGNJRDl0R1Y3cGZP?=
 =?utf-8?B?NmV3cG1Ga3cxaCtod1pwejBFV2R3NzE1R3IvbU1jMkNFemh0R2I3WGhVTEdn?=
 =?utf-8?B?ZlRyN1BPY0t4Vm5LWlFxbWRjNG9PWlpkT001Z3I2YWlmWXduZjNjTllHaWht?=
 =?utf-8?B?LzNISW8xR1lLSEZINjJlbi9naC91V3VoeERGTmsxYTFXdGRFWVNOQ1Qxd1lh?=
 =?utf-8?B?YmFLTktVbTdZTVZWelN3ZjdGUDJrN2tnYXg2Rlg0c3RHV2pxRmsrbndPdUN4?=
 =?utf-8?B?M0U1dXc5Z0hUcUFkTkZ6SmlNTDdHdUxYd3hsOFZjdkorOFQzMTNSS09lMm9s?=
 =?utf-8?B?RU1PYmtLcUt3OWhRa0Ria2VZVDBEWnA5eHNJTkllcFByRTZPbUdoV211YkI0?=
 =?utf-8?B?bWVweWxrYzFNNlhkdFpUUWxXSzNYU0QxdTV1MVpKTjlWVklLVmhmb2ZpWEVQ?=
 =?utf-8?B?R3BDU3RiSityMU1vOEVCalFPYlM2YUNYMU5yQjlDQXc2dzhXNWw2MkFzQTha?=
 =?utf-8?B?U1pHaFE2ek5wajNsb2ZYV2tIOW1uTDdyRkd5R3RsdGdFazVvS25mN01wTS9G?=
 =?utf-8?B?aC81SzJHOThmSFlSSzl1ckRJcXlCdzdXT1ZpSWhaODlqUWM2dFpQMllkdXhF?=
 =?utf-8?B?Z3lyaWpnWnF4Kzd4eE9BeGxxN0ZtWlJVWFJlSzJjYURtT3UwajUzcjJsNUVw?=
 =?utf-8?B?K2JvQmNhbVA5RVhCTDVWME5hNmJkNDRDTm00TUFWdFFJU0pzNFg0WmZGdGxS?=
 =?utf-8?B?emVNV0s1L0ZTZklUT3Y0N3dYOS85ZmFOSUREV09ZR3hmM2Z6dC9vb3NweWVn?=
 =?utf-8?B?RU1YZ0lJNHhiN2lYK09PKzdxeXBRdHE4YldDYjJjQmxtVmNNVGRZaktHc3Mv?=
 =?utf-8?B?ZlltUE1jNURSSFQ2UytJVUE3NkRYcnJjVjh2Z2Rmbm8wS2htOUJ1ZzVPWjRh?=
 =?utf-8?B?MGZ5aXByR0hFQWhHb0ZtMENVZjUwaDJiS1JRUUh5UHJtbEFJYnFDZDhlbWNo?=
 =?utf-8?B?S3lQcmdiMmZnQ2tKY2RHR09iZ3dWUTVFT2NLTXlSZTV0UWFWa1poSFVsUFNG?=
 =?utf-8?B?UWtGa0x5c0FPL1Y0TTJVMGNHV2daaWRyTjN3SmZmbnVoNzVzdXpleVBremVU?=
 =?utf-8?B?cWRkdXVZbTRBQzJ4eno4dXBsTDZPODIyKzc5VGZmdnY1VmVuVlplN0RUbzM3?=
 =?utf-8?B?TGRLV1dYWXVjUS9LVzZZM2tjOUxzMjJyMEd1ekhVUkthY1FFTVRZZVNuWmt0?=
 =?utf-8?B?Z3QzQzVMdm56amhQcHRrd2t5WFl2M0d2UVR2Ymx1cXJ2WGR3QVlLSVZYQjBJ?=
 =?utf-8?B?Z1lRYVJVbEZnYWZMQkxHTGtVZHBYRGFrcEZ0dnE0MUVoZXYrWXd1R1YrQXpl?=
 =?utf-8?B?TXA1UFVLRk0vZ0wya252Q2ZVcUREeWdnT0NlQStsWnhJR3ZMTnpSZ2Jxd1dT?=
 =?utf-8?B?MDAvUlJ4TVEwa1V0ZE9qcTFVVmJMaWhueGxaZzZRNTVlNCtxbmNFaFJ3QVpy?=
 =?utf-8?B?YThmNWVrYjFxYkhNenhDUWc5L1ZJc2lBUUErdTA2M0xTOUlVMzl1Wm1GaFdG?=
 =?utf-8?B?VmVaQXQvYlNmRWw5aE5zdHBldThuMmRDUWxjMXZEWUZjU3BHVWpnTnRRb2dz?=
 =?utf-8?B?SDFvbEF4dmNXZjVKcjlhWXgxK1oxV1dsTnZXMzI4Q1oza2s5N1hkOWdwMmNz?=
 =?utf-8?B?RFNOYVlRdWQ4UVNGQVpmYVY5VE02VFJmamJRc2FsQkFuSFh4cUp1dm9GWURo?=
 =?utf-8?B?Z0hyc0xmYlNBc2lXNGkzZndYUWpXNEtiVGR2VHFZbHRpL1dUSWs4Q0M1bTUz?=
 =?utf-8?B?U0YxeG1GL0Z5MHNSK2dLRnlBME9uZWx0QThYRjR3ZFpDUGc1V3pYVU5OSkFl?=
 =?utf-8?B?K1JsdExpNkVMVTZlS1puOU9xSmM1U2Vya1FaL1FJdjVidDk4NCt0YjdYbndS?=
 =?utf-8?B?aFd0MHRXTEY3OVNZeXVhTGxxM0VVdEh2V0Vnd3kzYVA0bFJJdzZ5Y0JyRkZv?=
 =?utf-8?Q?pAS+G7n/GAeMICdiF9XGJoqi5yFOXvPpqMo4C2xsgHd3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e14eb0a5-4dec-4e98-e611-08db0b568411
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2023 11:04:01.7040 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TVu3BwOfoFZGmP+m3jvT89uadEPJI6j1/xArMECj1KZIK+1jwjQI4met7JJWkHZw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4155
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.02.23 um 15:53 schrieb Matthew Auld:
> The ttm BO now initially has NULL bo->resource, and leaves the driver
> the handle that. However it looks like we forgot to handle that for
> ttm_bo_move_memcpy() users, like with vram-gem, since it just silently
> returns zero. This seems to then trigger warnings like:
>
> WARNING: CPU: 0 PID: 1 at drivers/gpu/drm/drm_gem_vram_helper.c:255 drm_gem_vram_offset (??:?)
>
> Fix this by calling move_null() if the new resource is TTM_PL_SYSTEM,
> otherwise do the multi-hop sequence to ensure can safely call into
> ttm_bo_move_memcpy(), since it might also need to clear the memory.
> This should give the same behaviour as before.
>
> While we are here let's also treat calling ttm_bo_move_memcpy() with
> NULL bo->resource as programmer error, where expectation is that upper
> layers should now handle it.
>
> Fixes: 180253782038 ("drm/ttm: stop allocating dummy resources during BO creation")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Christian König <christian.koenig@amd.com>

Oh, I wasn't aware that this broke at so many places. Especially radeon 
was tested earlier in the development of the patch set.

Thanks for looking into that, the radeon patch has my rb and the rest of 
the series is Acked-by: Christian König <christian.koenig@amd.com>.

Regards,
Christian.

> ---
>   drivers/gpu/drm/drm_gem_vram_helper.c | 11 +++++++++++
>   drivers/gpu/drm/ttm/ttm_bo_util.c     |  4 ++--
>   2 files changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> index d40b3edb52d0..0bea3df2a16d 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -916,6 +916,17 @@ static int bo_driver_move(struct ttm_buffer_object *bo,
>   {
>   	struct drm_gem_vram_object *gbo;
>   
> +	if (!bo->resource) {
> +		if (new_mem->mem_type != TTM_PL_SYSTEM) {
> +			hop->mem_type = TTM_PL_SYSTEM;
> +			hop->flags = TTM_PL_FLAG_TEMPORARY;
> +			return -EMULTIHOP;
> +		}
> +
> +		ttm_bo_move_null(bo, new_mem);
> +		return 0;
> +	}
> +
>   	gbo = drm_gem_vram_of_bo(bo);
>   
>   	return drm_gem_vram_bo_driver_move(gbo, evict, ctx, new_mem);
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index d9d2b0903b22..fd9fd3d15101 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -157,8 +157,8 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
>   	bool clear;
>   	int ret = 0;
>   
> -	if (!src_mem)
> -		return 0;
> +	if (WARN_ON(!src_mem))
> +		return -EINVAL;
>   
>   	src_man = ttm_manager_type(bdev, src_mem->mem_type);
>   	if (ttm && ((ttm->page_flags & TTM_TT_FLAG_SWAPPED) ||

