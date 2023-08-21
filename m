Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38151782AC1
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 15:44:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AEC410E25E;
	Mon, 21 Aug 2023 13:43:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2079.outbound.protection.outlook.com [40.107.93.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1DAC10E257;
 Mon, 21 Aug 2023 13:43:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f3YnHa5swsNHK456bV5TBMZEP67vdmj5l5QV+JLyRWNbd/Wi2cY0uxDf1yza52SemimuVsm6fGpDznQMNeXSSqvSlrBmhwbk15/q02tZbWtLwpLQ+SdukgaWpN6XoyeKzKHTBl2vjphwx7njqQO7JI7vruaayJjC/3s5rrC4T0cdGtptlvG5jrajy6VELkG3eZRSwhi9A9kELjSUZLDXTrGapeVqzjM17jHYSCjQblAj3r00UasUTkIkBafgwSE7PPo/VGKkyTeLJZCsIpVFCbDVYT/iS/edWE4unRZgVAL+4dUu8Q/bVYaJiLJ8li8mo7F9/4xTSYiM7mxvYKuN3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iJxUUA+NorkAakUXfFMSMI5CjRBLA4s5ZyJ0M7iiL38=;
 b=eWyMUu8jaH+7aByngJ7pcfUymqDoULDXspxOWVp87ygiDQyD4Zb8M/3ZV+HIFEp7BBAp5tVTH5BduJAbH8ydGr8bl5Xn3g9pJQZ/HUumtcMwUWxraACgNVPHZZjlhz2D3yq+Trql7zL4IMXSaLFIJf26ZS8davD+j/lp1VIhg127LGW+/aHC/QSRwh9WZ6gqgBrM3hw4NEDEDeSHZoRNxaLRuNpFjoTE5oggsUW3Eu9IkRUkz97pYigSJJEntsoNiTZGEZJFZTrh+WNgoMbV2UNFu/Vl03Fgmiv3RAKXG3mmqsYQElTCr8n7UQAS1dG5oQxp3B4yZuKEERsB/ViwVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iJxUUA+NorkAakUXfFMSMI5CjRBLA4s5ZyJ0M7iiL38=;
 b=fqeJQRacwWFBW2TtzZPE9A2l5HQ1pYh/BoL7Hjg9IjyG4KFksg9/2fFPvXcsFjmj8vrR+Zuuanan+OgQ8PwQ6Yl+wedPcICm+NO/TkYxn09uRU4yximV5DD9f77y9TdvVl9b4VeRDHGZ1W+5otQtRti4/xXOl+aNq2ylevMpm58=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 by PH7PR12MB8038.namprd12.prod.outlook.com (2603:10b6:510:27c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 13:43:50 +0000
Received: from MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::dc06:ffb3:46ec:6b86]) by MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::dc06:ffb3:46ec:6b86%3]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 13:43:50 +0000
Message-ID: <b3c5f921-f518-d3e4-29fb-693a549877b8@amd.com>
Date: Mon, 21 Aug 2023 15:43:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 4/7] drm/amdgpu: Add suspend function to clear the GPU
 power profile.
Content-Language: en-US
To: Arvind Yadav <Arvind.Yadav@amd.com>, Christian.Koenig@amd.com,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org
References: <20230821064759.94223-1-Arvind.Yadav@amd.com>
 <20230821064759.94223-5-Arvind.Yadav@amd.com>
From: Shashank Sharma <shashank.sharma@amd.com>
In-Reply-To: <20230821064759.94223-5-Arvind.Yadav@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0235.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8c::10) To MW4PR12MB5667.namprd12.prod.outlook.com
 (2603:10b6:303:18a::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB5667:EE_|PH7PR12MB8038:EE_
X-MS-Office365-Filtering-Correlation-Id: ad9e40ad-7f57-4266-7fa2-08dba24ca6d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PK10Xg5ii6RUiGDi7+RU0qksPCK0/th7ERc1vNhFuXSPO4e+xaH/9gz1+gdY6DMX+Hu6wWKps9lFC5laBf/KV/4QOTfwhG2V6aROJtZ9jHnlBX0NYhz14/ZnQeVrzfV3KFSeESMXYhbR0W711CVFRRZqrNI71WFp4ZZr+69v3fQvVxtyE0HyVlXUxMKDZ8ncDOJjAr+lX7LP4jcqKttI5ysyC8OEQw6AFw86oPhNV43OR7J10IvVmiruawpBg4Gte9ZzePp7c+RLTxDGr3xWQJj1GH5LhNZzFIPuGoufSDDA5oT2frpVPUIYUakudzKjDSmwljy8lyLreH5AekeB44/sOfRa6dYUAkssll7T1lczikfb4GzAcXHATZxSwSMUcWnmKDfAyHZdSW/cxWTIh1qurZC8fMgoJhJsKAaTvcJL4UzzXgCupjE0L1jL/uvu28VOWAs+o1IhPEQ+bVcY/OnlxOI1BYbl4lLOw9CIGkXmHoKQempatZ71DVe4NbEkgzU0Gw6tSFT9a7y4QdJ+ebk+JURzDZ5FCsNDgaQIGprUYQ7FaydALTlvwp9lsTRDUnl0Qm0i0IeISCBWwMyD86ySHwSLlJDMkBOk3pZBLtOAoRiEThMiigLClefZo4nzeKML93tE4vr6CtcpWh8fzQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(136003)(346002)(366004)(376002)(1800799009)(186009)(451199024)(66476007)(66556008)(66946007)(6512007)(316002)(8676002)(2616005)(8936002)(4326008)(36756003)(41300700001)(478600001)(6666004)(38100700002)(53546011)(6506007)(6486002)(15650500001)(2906002)(83380400001)(86362001)(31686004)(31696002)(44832011)(5660300002)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUpnTUFLNTF2SU1lbmpxaFl6R2cyRTBFUCtsaGd1QWNsZ1VxMTVkYnpYZWN6?=
 =?utf-8?B?amZyaERtZWNyekR4amxoanhEb0YxTE14dndvcmw2UHRIVFBnbmZncHRNREJW?=
 =?utf-8?B?YktzS1dBTjVtdzN6SWI5dk01dnhVL2d3dUpCTEFZS25wc0dTOG5GQXMwT3Nm?=
 =?utf-8?B?QUVoVDZGOVZ3Wld5bE5SUFpLbVVQVzdUVmpzdEhacUw1V2hnRHFpR0lMYXpp?=
 =?utf-8?B?STV4OEllNmdpZnN4ZWlCSnRNZFp3U1N1WkYrUDhGTVpMZTcyVHpqSUlNYXBO?=
 =?utf-8?B?ZGFwajVKN05RMVNBaHdndXNkMGlNbjZOSDREdTdKSWEzSm9Zb0dBQ2hqWGds?=
 =?utf-8?B?SjcvSU1VcmNrM2UvWVVUOUx4ckViTVdyMmwra1hTUjFtelEwVDhCNDZXblZu?=
 =?utf-8?B?aVA1Y2kyTjFhMFNqT1ZzanY5WmVuYkhzM2J3RWFPZElKREtRdTR4c0ZndjFE?=
 =?utf-8?B?OHkybENOdmd5RjZDcDZGQm84Yjhxd0JhUUFxZHpMTGN1UGxzUW9UZEZCT0NO?=
 =?utf-8?B?UHJsMUpPOEExaGlGNFBXSHF5aXI2dmxRVGdycWNyVit6U3FEQS9DdnlUZ2tx?=
 =?utf-8?B?d3VlSGRaYU5BZXZXUElmbkhpL0lmRk9qcFYvMmdocGM1V3RFTEJWckl3eFRx?=
 =?utf-8?B?d3hScW1DVnJRaU1jQ1dwUzRkQzZ2NGVzUGhTV1RuY05aMzRxS2lHaGNIUFVR?=
 =?utf-8?B?RENxWnh2bkl4cHhaMXYxQ0k5cmlEL3BwdkNETWdrNzZYTkFsMXJVMDgxbXhp?=
 =?utf-8?B?dDhNZ2hIOGFtMFlwV2dJMWJDdy83U0dkSHAyOGw2eFFnWXVmUmg2QW8rTVJt?=
 =?utf-8?B?QXVIL1FrU0lNUDkvQVpHL3ZjY29OTFRNUkJwMHJ5RFNBM3ZsQXJBQkJJaVFF?=
 =?utf-8?B?WEdDNG0wWXk1cHJmdGgxK3VZNzFEVkYyNnczdG5tNENCb2xBQ245c1dFek1t?=
 =?utf-8?B?dWZvWHlCQVFISlU5dW1jdU1wblhvMWNONCtQV1RRTDU3a2c5K3dFeWtoZzN5?=
 =?utf-8?B?RC9LQ0FETmpqVU4xUVRqMG5PZkpwa0VnYUxzYkRjK2hwZ3JhTU9nUkZoa2Uy?=
 =?utf-8?B?eDJjRjE0NmU0dVlRd2lRTXhSQ0wzOWFWMjhYZ0E2dWJUb1VodzFwaDF6VjI3?=
 =?utf-8?B?SWFyR1hOWWY1dktPYVFISWh3NlN3OWkyRzN0QzZuTGJxQmtzSHhHUk8wN2xN?=
 =?utf-8?B?NWhMdjVJS085ZzcxLzEzNUhzK3o1WFhOTXJZNmYvb2pnaFRJME9JUlFPQy82?=
 =?utf-8?B?V3V6bFkyVlZRWmFwRnJUQmhrdndpM0hKWWRiMGRUT2FqM1ZIdmJBOHRMTlhx?=
 =?utf-8?B?bkt5Vjh0QTFpUlkxd1BJcVpoa3FPeHhYblg0SGp4VTViTyt3Z0RDaXdpS081?=
 =?utf-8?B?S0x1cFNPWk9va1ZzajNvWCtjZkFHc0Rtekl1QUxnTjI3OVhTSkNuOUJ2Ymtt?=
 =?utf-8?B?MEp4M1R0c0UyazZVVGRTQXlsak8yUkMzVll6ZU5BaStsZVZ3eUU4WUxPK1pU?=
 =?utf-8?B?aVVlaGloeG01MVlXUFEwVFNDOEFQZWRxYVBOTzFha1VTeGFRbEN6QlQ0aGhB?=
 =?utf-8?B?NjVocTUvRHBLNm1JTWtCaWhKcDQ1ZXN5Z1llU1N1MTN0RHVBYjFJVG5VL0xn?=
 =?utf-8?B?WHkrYmhhUFRDcDRmdExVQ3hOc3pKNVZ1VVp3YWlqZ2I1Z3IvbHM4K2thb2Uv?=
 =?utf-8?B?RVVZZzhSenJPU2dIR1orQ2FkVjhtTDVEOEF1azYwV3lnQlhsSldObnduVHpp?=
 =?utf-8?B?UnBUMHdyeHVFamFBWVFNR2R2M0wrdW9SclFydHl6U0xzK1c3RGJYUHZOcjBO?=
 =?utf-8?B?WHNNc1o5aUFTMkZEQnNScDBuQ0tGY1BxYUhvMVdxRzhmSDI4RkExSTIrb3F4?=
 =?utf-8?B?L004RXAwbm9qSWF1QlFLNFJLNkM4S2M1WndiYks5bVFkRDN5akdOWkxmdjhK?=
 =?utf-8?B?bE5KdmJpeWt0SWZvYTEwQ2ZzMnRYN2Z5VWZnZm5zZGJNWTk0ZkZpS2Mwbmlt?=
 =?utf-8?B?Q3J2bHl5OHk4c2VZRlllcEM0cnYvQzVMdThyTlc2cWY0cFBReGFjVDV4MDJa?=
 =?utf-8?B?ZE4vS3RBSGlUNlMycVkyOUcwb29KZENJSitIVDNhU3BPMHhUczQyNE50UUhj?=
 =?utf-8?Q?tHTzLELKWTLLTES5l07rKZDyU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad9e40ad-7f57-4266-7fa2-08dba24ca6d1
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 13:43:50.5865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XfJQMYDZFSzwsYG19vjhTE7/olXNhc83PI71syFHPZRmwtP14PWLKLmuUseBS7N/Efa/112KtTkAXmEHWNWVeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8038
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 21/08/2023 08:47, Arvind Yadav wrote:
> This patch adds a suspend function that will clear the GPU
> power profile before going into suspend state.
>
> v2:
> - Add the new suspend function based on review comment.
>
> Cc: Shashank Sharma <shashank.sharma@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  2 ++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c  | 23 +++++++++++++++++++
>   drivers/gpu/drm/amd/include/amdgpu_workload.h |  2 ++
>   3 files changed, 27 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index cd3bf641b630..3b70e657b439 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -4212,6 +4212,8 @@ int amdgpu_device_suspend(struct drm_device *dev, bool fbcon)
>   
>   	amdgpu_ras_suspend(adev);
>   
> +	amdgpu_workload_profile_suspend(adev);
> +
>   	amdgpu_device_ip_suspend_phase1(adev);
>   
>   	if (!adev->in_s0ix)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
> index 6367eb88a44d..44ca8e986984 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
> @@ -174,6 +174,29 @@ void amdgpu_workload_profile_set(struct amdgpu_device *adev,
>   	mutex_unlock(&workload->workload_lock);
>   }
>   
> +void amdgpu_workload_profile_suspend(struct amdgpu_device *adev)
> +{
> +	struct amdgpu_smu_workload *workload = &adev->smu_workload;
> +	int ret;
> +
> +	mutex_lock(&workload->workload_lock);
> +	cancel_delayed_work_sync(&workload->smu_delayed_work);
> +
> +	/* Clear all the set GPU power profile*/
> +	for (int index = fls(workload->submit_workload_status);
> +	     index > 0; index--) {
> +		if (workload->submit_workload_status & (1 << index)) {
> +			atomic_set(&workload->power_profile_ref[index], 0);
> +			ret = amdgpu_power_profile_clear(adev, index);

Why do we need the checks here ? can't we simply set call 
power_profile_clear() for all profiles ?

- Shashank

> +			if (ret)
> +				DRM_WARN("Failed to clear power profile %s, err = %d\n",
> +					 amdgpu_workload_mode_name[index], ret);
> +		}
> +	}


> +	workload->submit_workload_status = 0;
> +	mutex_unlock(&workload->workload_lock);
> +}
> +
>   void amdgpu_workload_profile_init(struct amdgpu_device *adev)
>   {
>   	adev->smu_workload.adev = adev;
> diff --git a/drivers/gpu/drm/amd/include/amdgpu_workload.h b/drivers/gpu/drm/amd/include/amdgpu_workload.h
> index ee1f87257f2d..0acd8769ec52 100644
> --- a/drivers/gpu/drm/amd/include/amdgpu_workload.h
> +++ b/drivers/gpu/drm/amd/include/amdgpu_workload.h
> @@ -52,6 +52,8 @@ void amdgpu_workload_profile_put(struct amdgpu_device *adev,
>   void amdgpu_workload_profile_set(struct amdgpu_device *adev,
>   				 uint32_t ring_type);
>   
> +void amdgpu_workload_profile_suspend(struct amdgpu_device *adev);
> +
>   void amdgpu_workload_profile_init(struct amdgpu_device *adev);
>   
>   void amdgpu_workload_profile_fini(struct amdgpu_device *adev);
