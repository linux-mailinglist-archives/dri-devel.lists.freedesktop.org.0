Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B7B634B85
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 01:10:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B76F10E4B2;
	Wed, 23 Nov 2022 00:10:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2055.outbound.protection.outlook.com [40.107.237.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E88A410E4B0;
 Wed, 23 Nov 2022 00:10:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nje559zMpULyKJGy7OqizupSHd94s02ZOQ3GafbGioN3eyxPPLInrgUdorRwI9uDEZmX52/gCS4sToC2FG6oBoWP68Vgfx9IB7cojCI66h3FcZygIRWKUooyRToE1cqmJ3uttpJ3DgxrEsR8OPAuUZ7pZ6h26trMB1MtiOOukZdjf9JgFiFsSfS9mkt+Y0wHoJ93drhK1IYUvZecPz58O0OTSIiFcAgd7Gc+yGm6zeVz6jeALSqxeevn6OkkMgtFZevbS1XXIh0hXnBilBDOC7J5W0inTO2m6oCOR3+2cj7lGB50OzNGbuU1PoPpItII3Ql6mPaNP2LAJwhdXTH4OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kF+9M3CEDIjIdoWWwsDh2YPvOj21M4Mh1mz0HOaGu8M=;
 b=OjZ1wH7fWfkQUMrWEOeci55chzWhdM0tfMuqdHTcs3t8HLzTDTooKS0O4Gv5ljP6RgFRuUVk3JirpuNuy3mkMwqYTophwbMhfwVbKDaVXvNRG8idi7+Kk1iK3B+ZoqbtkyhlfEgVNvAYQHjLMRcpmxQz6ZSOLmE8AwbotQBcFZISKTjmuJ6QrkD9vCn4Nn4f0RTC/0+2/BwHtc3NGC37lnocIMIbp7CZKo3p1vwb0g23Hyop/fbZR/V4Mc7kzj7jmOUoEzfiIg3P7JeQNZTl1ktb5AdNVzFb6jjnaGxKIZ+ZMfoBO7PqPD2RXZJV9T05tHPswWyeevLevV84RP8CUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kF+9M3CEDIjIdoWWwsDh2YPvOj21M4Mh1mz0HOaGu8M=;
 b=NW4oCF1Ym0oEZUZwk74K4mh1VlrO1ACsauQoaCm1kSyM4qBX8co/SAITWgIAqmrtZFjBqSgVt7EhG0Uchx1PFokJ0pR7g52TsBT5N29yPNUEH8kLLmj+C3D6Wgv4dQCb1bhaC9u0X9+z4VT25bJ43AWHg5bPyjwXn0Fr/V+N1mQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3375.namprd12.prod.outlook.com (2603:10b6:208:cc::12)
 by DS0PR12MB7678.namprd12.prod.outlook.com (2603:10b6:8:135::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Wed, 23 Nov
 2022 00:10:18 +0000
Received: from MN2PR12MB3375.namprd12.prod.outlook.com
 ([fe80::a292:9d0c:e0a9:e4ea]) by MN2PR12MB3375.namprd12.prod.outlook.com
 ([fe80::a292:9d0c:e0a9:e4ea%4]) with mapi id 15.20.5834.009; Wed, 23 Nov 2022
 00:10:18 +0000
Message-ID: <549f659b-4121-d14d-fe84-352a0b5096f3@amd.com>
Date: Tue, 22 Nov 2022 19:10:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2] drm/amdgpu: Fix potential double free and null pointer
 dereference
Content-Language: en-CA
To: Liang He <windhl@126.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, sumit.semwal@linaro.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20221122042849.1097369-1-windhl@126.com>
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <20221122042849.1097369-1-windhl@126.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4P288CA0019.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d4::21) To MN2PR12MB3375.namprd12.prod.outlook.com
 (2603:10b6:208:cc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3375:EE_|DS0PR12MB7678:EE_
X-MS-Office365-Filtering-Correlation-Id: 690ae97b-0636-4170-aa30-08dacce71a92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F1oVmkJ5FM0aGMZMHpQvDLx5sueyYCFxkQ3UVtxAjSUylDVIEfFjCvjv/CbfGdRBOsnDx21YF8hMqlbERpJ59lybqt46U5ZE9NfZDkOtLgMKAqwm/Rx4ecx8bw1CXUjF9CBn5JcegT5Bg7gnzF8RETVe7uD+aLAJQoiNlTovqkhZZ6aWxK0X4zUlOJ/Ag0rx6AePUUNCyvWR3RFSJsWlRM3nBqzZy79m19ZfInVTsYbnTDv75WIV6BqxOTQ2bXbf4lrbZJj5J5V1Sya8qYtt6AT07u5flq5fNPRgwDWgp72bMOsE2Ssdc9XpACHAJHc50figVuI7vDRC1MP8QApj8GQsfEFWFiVsW1fdqYrbLPgcL0JuiAY8vp+UP6UyFjlX+I1jp2Jq/Lm6KZ6wkY3uZfD6AVP9fMvgHHnTtyxfAOssXjIR15iFLA/t5xRVFbXsXRMyQ7o1bct06S+ewoQdC2sAoxk4tL/zPiiVaxkHAUmdXRB4lhkDpFttH53SC2ToJf0nyxPiYkuqXW8EtDfVfa++yIDU0ZuUfjRl/UDDeRKctQqU4s7uoFe1UG7b78phIKPU8l+3eEigb0dED0qCxUo13FDvygs+Pl+GhYXJ5/KEqiYaj54r3xsp4mTbnECGlDlj2BQeEWZ3Poa/qC69+7rqQVRGKzj65aN2l3UHoGtyMFKeMwmHNjT25+g1fsKoEB4sUTZyFzuXj2Y4VZwxcSxyLXap6Uxqibbx/Xi8DpdSNORfR3ZmuK4wEhsTwc8u
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3375.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(396003)(136003)(346002)(366004)(451199015)(6486002)(36756003)(66556008)(8676002)(66946007)(66476007)(316002)(41300700001)(478600001)(83380400001)(38100700002)(53546011)(6512007)(6506007)(2616005)(186003)(26005)(31696002)(86362001)(5660300002)(2906002)(31686004)(4001150100001)(8936002)(44832011)(525324003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHV3eTdveVRWWEJ4akk0dmRicjFwT0tYRldraW93L04waERMcXBlRWtQRkgv?=
 =?utf-8?B?dmV4ditUazdZbkFLWEtZK1JOVUdtNjFESnE5SW9yMHdBaGNJbmlUak5SWW1R?=
 =?utf-8?B?OXdkbHA4NnpPdDRwRXZ4WU15ajN1QXlPNEJnZE8wclExcjhwRFRVNjMwLzcw?=
 =?utf-8?B?VzRIQjQyQ3pNMjBaZi90amlnWlR6TFFYZ2RLdHR3ZzgwMklLQzJ1YlNOWGo5?=
 =?utf-8?B?eWtZc01QT3pyQmhaQlJNTVB4ckJzM3prNzlwKzJ5T2Q5RGhsdFcrcHdwNWMy?=
 =?utf-8?B?L0diWjVYOFRseEV6aDc0eWNTclUvVEVseE5OT2IrdnI5bk9jRkN1VlplZXo2?=
 =?utf-8?B?cUJralN5TFhBcUFkT0RTSWZ5dVhKNDY0OGRuVk55ZHRySWdFNEhyM3IyUDYx?=
 =?utf-8?B?VHV4OWwrRkg5M3FsYWhqYnN4d1VZMmZzNmFldGVteDlZaGQ1UUZqYm4vT3NE?=
 =?utf-8?B?SFNTWkJkQU9BYVNtaDQvNkNDMUxuOTdySjZyT3BqdzAxWUdaTjUvS2UydjE2?=
 =?utf-8?B?ZXA2aTZ6aWhwTC9QNEIrMmhrcjA2Q0pseGdCekZNOElwbDVjMUUxcjgvZmdQ?=
 =?utf-8?B?OHVUYVhLMnh1NDkwV3dCZ2xEY0x5TE43eTZYZnlOclpLeThkMGlmYlZ5TXpR?=
 =?utf-8?B?MWU3S3NmKzFQRkNNQUpycE5tMlZCQm1uY0lleHpBQXlGcVlCS2IwTUFHelNG?=
 =?utf-8?B?bWFVVXAxalFpcXk3Z0FBQjYwTVNZaFVYVHZiZ0xOOWlIbE81NGJCeXVtTmkr?=
 =?utf-8?B?cWEzTWlJQ3ZQSTlpSVdERGhua1FFV0RGYUE0ZXdJb2d3R04xVGRCdURyaWlZ?=
 =?utf-8?B?dmx4c0lSWGxtZ0VJSHZmSVJSWEVVTjN6YWNoZkNUTjV3WHpTakI0eWVOQVll?=
 =?utf-8?B?OGk4cG1FaTJrQ1p1QjhNRlJFKzUyVUI0SlV3RnNiZWJkSFNKOFBNOHdLWjB1?=
 =?utf-8?B?aFM0VytTTmVVSUoyT2MzSWtiM2Zlc25OK1F3NUU0WXRYQVk2aGxqVUdZTEJU?=
 =?utf-8?B?dEM0eXI1aytpK2dxbzRnWFRVVmdnTXA5ZVAxTXczTXRuSDVvODIwQVRGSmRU?=
 =?utf-8?B?di9uQkhDVzZCWHlkZnlSNEtHYVBlZFhVSkNNOWVSeVh6SGVYL3V5dSs1NCts?=
 =?utf-8?B?QXpHRDBXR1p5NURqdnlHWXVsT0NSU21iQVEvdmhKT3N4VTV3UG9DZFU2Qkw5?=
 =?utf-8?B?cTBFSzkvY1FBMUpIZCtVN2ZUOFpZZkIrL2gxbmpoNWZKMmIwcXlGU0psTmZ4?=
 =?utf-8?B?TkgzZi9ha2lTdnV3NjcxaGpXcjBHKzhwNXVra2liRnNabTBaU0Vvam5uU3Yv?=
 =?utf-8?B?SjFnRUJQbm8yWmVyYldqTXJyUlFRWmlpVnpBR2t0WnNIUm1pN1dUcFFrbmVv?=
 =?utf-8?B?SGxQVk1XTTgranFta2RPL3d3YUljTDcvMGdNKyt3RXdqeHlVMjd2QnhkelJj?=
 =?utf-8?B?QmRXQ3htOG5lWXN2Z2JiTENaMWdxaWFuMVNmRDNTOHJBZ3lpaGM3YWsrVVk5?=
 =?utf-8?B?UTJJd1pOd2ptZnVNdzJCTFh1S0tLMEt1MHkxUmZ3VUtmU0d0NCs5bWJnWERX?=
 =?utf-8?B?Q0FnRTZ0TzRXWnJkeXN0bGcvL1VrYklZVVJsMWgrRDNtTFF4R3BrTDZXSFli?=
 =?utf-8?B?aVB1ZGcyLzQvRzFsVEJGTDNzTm5teUw3M1hwWlFTazBSdG9RMUZWcHpwdDJt?=
 =?utf-8?B?c296RTIyVGoxeGJQV1creC9raEZqQ0tJNTlqY3IyU1NSdVplZkJUV0FxSjNl?=
 =?utf-8?B?Z0pleXp5cFZhY2tYSjc2N3Z2cmJ4MTNzQ1RuYmY5ZHlHOWVvTHhmT25uQUZY?=
 =?utf-8?B?eWJnQk16MCtFOThGeUFyZG1iMlpyOHJicUpWTTA3WkljeTRKRFZYWExwcVFI?=
 =?utf-8?B?RG9jVUFSR3VuOCtkTVNpUVJ3Y04vVGdHWi9Xa2hTWWZnY3E2WWVPVGFFZFdj?=
 =?utf-8?B?RTJueThZaHA5T0pQN2dESnROaVFBc1Byd1JZRDIyMDh1b2RHU1lBc2g0NWRG?=
 =?utf-8?B?NGxOY0xsVWN4eVY4UnI0WXZudTlROHZjamRaZkRMZmxsRVJmMXA5RUsvTU9t?=
 =?utf-8?B?WFp1bS9yRW5Xa0FTajN3VE1YVmRTU2VIa1VDWVhlSVdEZGhPMUxPOTlzRFJF?=
 =?utf-8?Q?l+7w6PD0W9weWIQ5hE6baSSiW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 690ae97b-0636-4170-aa30-08dacce71a92
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3375.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 00:10:18.2927 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YDmoZLXzt3sDZ9/juZDlY14hSNAtqRbzdIbvZN+SOpdIpt7CrLgPZePpTL5YZXQ/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7678
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

amdgpu_xgmi_hive_type does provide a release method which frees the allocated "hive",
so we don't need a kfree() after a kobject_put().

Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>

Regards,
Luben

On 2022-11-21 23:28, Liang He wrote:
> In amdgpu_get_xgmi_hive(), we should not call kfree() after
> kobject_put() as the PUT will call kfree().
> 
> In amdgpu_device_ip_init(), we need to check the returned *hive*
> which can be NULL before we dereference it.
> 
> Signed-off-by: Liang He <windhl@126.com>
> ---
>  v1->v2: we need the extra GET to keep *hive* alive, it is
>  my fault to remove the GET in v1.
> 
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 5 +++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c   | 2 --
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index f1e9663b4051..00976e15b698 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -2462,6 +2462,11 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
>  			if (!amdgpu_sriov_vf(adev)) {
>  				struct amdgpu_hive_info *hive = amdgpu_get_xgmi_hive(adev);
>  
> +				if (WARN_ON(!hive)) {
> +					r = -ENOENT;
> +					goto init_failed;
> +				}
> +
>  				if (!hive->reset_domain ||
>  				    !amdgpu_reset_get_reset_domain(hive->reset_domain)) {
>  					r = -ENOENT;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> index 47159e9a0884..4b9e7b050ccd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> @@ -386,7 +386,6 @@ struct amdgpu_hive_info *amdgpu_get_xgmi_hive(struct amdgpu_device *adev)
>  	if (ret) {
>  		dev_err(adev->dev, "XGMI: failed initializing kobject for xgmi hive\n");
>  		kobject_put(&hive->kobj);
> -		kfree(hive);
>  		hive = NULL;
>  		goto pro_end;
>  	}
> @@ -410,7 +409,6 @@ struct amdgpu_hive_info *amdgpu_get_xgmi_hive(struct amdgpu_device *adev)
>  				dev_err(adev->dev, "XGMI: failed initializing reset domain for xgmi hive\n");
>  				ret = -ENOMEM;
>  				kobject_put(&hive->kobj);
> -				kfree(hive);
>  				hive = NULL;
>  				goto pro_end;
>  			}

