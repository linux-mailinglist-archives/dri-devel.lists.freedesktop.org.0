Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A6865CC72
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 05:54:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE3F010E42D;
	Wed,  4 Jan 2023 04:54:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2046.outbound.protection.outlook.com [40.107.94.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70B4C10E42D;
 Wed,  4 Jan 2023 04:54:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fvzTVFX0/fhe9Qcplggef+vvj/vwnTRLVMXgoLDee/3zyagP/w/XY08iWDQIrVPEsNeF+1wmey4+u1Gq8HSqBuD0XIc0xEUwcrcxWQ1zkfwKxFxzKY/9iAx16zgoafLForXUTc7nwQuzZ/QdNXHd/5xPCDeXvfyasjGieqUWqS807vQXhzfSaTwwcC6NmnF2UEQvRmp4PMg0OOtD2Tq8B1RcshMtdra0dDqe826DwSKq/YvdL737/8IUsvB48Y1fh3jvP8sJemsnRjEX5wZMlOWYCkKh1icZL/v+QS1BuL6vK/8YwnYTsSNE/pd1HSpaph/ix8WiDyNgdA/I1xDq3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/4JKnDa7MQ614h3kffnYcTvxyg34AZwTr0wxrerG+eI=;
 b=ObQvicm3RBneav3AETV5Nq8c+IgsqBXjDrgOJ2WD3QqNLY5kI1NAC3rKp8RmQWS0sJ7ho8aEa8JIW9Zr3GfASaGOpF+XBsIrJpFBiUNXyLVOWBvbKkjj5oAQu2C43C4r+HF/GlqA9Lh1icU4Ju8DXMbyNd1ZUtMxi0J/gGllDSx9+/6bHfedc1O8EYiiPTZMTzM5fP8vv22UsqoEUH7cM8D9Fz1pbSoEhKjkht1ZL7aWEZqfF8Z987rJ25/mJkRMNhJtpruoSrbswe2IIC80LQkNE8g6J2H0Mc1tnNcDQy0eHyvpK2l9BooCivhmNYqt3v8ULIih9xwGJAwB1yqxlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/4JKnDa7MQ614h3kffnYcTvxyg34AZwTr0wxrerG+eI=;
 b=bhknZlXUjIIddg2+J5Za1JxoWRPeymZAMt9wSvMwp1k+Pfx/jErOHNNlnb4HneSL1v2WVlO2sDHBVaYYzxz5f4HKdyn+c9Xy/4h5Zgci07JIdPXI+CGQsgcEBG3OKQTYxGrGyhYBCx87Gb4Z3uhW2w+Be2Mr77DfXFx2u1jox2o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4614.namprd12.prod.outlook.com (2603:10b6:a03:a6::22)
 by MN0PR12MB5858.namprd12.prod.outlook.com (2603:10b6:208:379::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 04:54:20 +0000
Received: from BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::457b:5c58:8ad2:40fa]) by BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::457b:5c58:8ad2:40fa%6]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 04:54:20 +0000
Message-ID: <59ab4749-8fb9-c0d5-1f7e-d5fceda85063@amd.com>
Date: Wed, 4 Jan 2023 10:24:07 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v4 07/27] drm/amd: Convert SDMA to use
 `amdgpu_ucode_ip_version_decode`
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, linux-kernel@vger.kernel.org
References: <20230103221852.22813-1-mario.limonciello@amd.com>
 <20230103221852.22813-8-mario.limonciello@amd.com>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <20230103221852.22813-8-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0195.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::23) To BYAPR12MB4614.namprd12.prod.outlook.com
 (2603:10b6:a03:a6::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB4614:EE_|MN0PR12MB5858:EE_
X-MS-Office365-Filtering-Correlation-Id: 01364e6d-8c8b-446b-8b74-08daee0fbd7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y1f4lcrMiavs+XxSEpJZhW3o3eVw7UjCgLVHq3T9Ntg1z4VJ9oW9GcIiCDbLIqjv4mrquEtMXzTpFEdGa0SqM0f41CA9XoP4Ip7d5oC/WSuBnXwAPfkb4qvx0PrRk/06g0fsNIcHQI0bG9EqeJOUxpK8h+ZneSDvuvXUEMJewo5ZDlmqNvNaWa4t62vrS8xGH31mFPZycUxQCEo2AQixXK6qWCcNW8QPWms3NSzusXjP/3AIRgLOm116DotqM67d8rQRDxgYLsS+MH3nkvcRvnWOU3T28q8AWbPHhOkZPtY2CHxpqoGHFme11IfzuEVQp7hDkdec+SeFjLSpXTMILZ7QmYk6voQnKdjc19fJSsWx+8kF5T5SN9QbnCvAQKtx21nzXVydh2rSDHTpfNvA6Y5LyBJerawOZ+K39QapbdhMmFQ2LT1VYf5DoDUHatuQ9QFMBUMTyGvtNu/eCrvzwctxtyd/ODNenKPMzNbQ+nw98/Yqe10YdxaFmG6t/WmDy8Wc+5387412El2UfRVuHKM51oVrnAW0Wq3K5gwOsvnpiIkftfmGjBFB0FRT1QQxR8CK8wklkBBVVK1jqPMbySSwXZmihJib82GsLqjltpt6jFtSbq81F9BrCf5jrlB13lAbY9PuJVsiBfVjwqors+XtN1dsiH3dbEJs0YxQx4fm7IQqb9fv7JCuWQqvatjC4BmnrYC8NGvovazsI3xZdoRL0+yd7PXCPej54SjUku0bULSdZ/DMlIMr7T0aHJpE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4614.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(396003)(376002)(39860400002)(366004)(451199015)(83380400001)(2616005)(31696002)(86362001)(36756003)(38100700002)(66556008)(8676002)(8936002)(66476007)(4326008)(5660300002)(110136005)(2906002)(316002)(54906003)(66946007)(6506007)(186003)(53546011)(31686004)(6512007)(6666004)(41300700001)(26005)(478600001)(6486002)(81973001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlowdXFqbVVCMFU1a3hjdm43Nkxqcm5zY2dDSVdXZE0vNzFwZ2JKUUdIMi9u?=
 =?utf-8?B?WGdPU2g0c2U2S3FhZXZVTGVqUjY1UDZxamVIRmNhRWZpcTdZVlVXMEs3Q2Zt?=
 =?utf-8?B?NkJIaFcxRHFhekgwZmFMcUNDVFR6ODZvRXNjNFdvckNYWVZxTDdlS2wzZG1O?=
 =?utf-8?B?RkRIemxOVzE3YXZiYzRVRG93TlFWeWJNclN1Ymo4NWlodmlKRVRsaUlrNlVW?=
 =?utf-8?B?cnBtMTMvWnlWVkdRMjdZa1JZV1pTeW83U2lqVUlteVRRMmM3QjU1aTAzaXFi?=
 =?utf-8?B?NVRSWHJSTlBlZFhtQ01SL2RjNERzK0NwMXVIVVYvSUt3RHRTRnk3VnBTQmUx?=
 =?utf-8?B?U3UrTGJ5T0k1S3BtRzZkbGExMk9MOThsUFNHZ3JIZHhTMjMrS3RabWtiWitD?=
 =?utf-8?B?WmFzdWt1Qnlvd3A5cXhvRE5ndFh0a1FPVXgzY0NuRnZpeTQ1dWJqb2JwMzhE?=
 =?utf-8?B?MGFBaDU5Q0hFd2hobVVNRXZTanpBQ1FYcHFxZ0ovalNhQVFER0p2UjQybnNO?=
 =?utf-8?B?MTZKOCtSU3d0cHZ5OHVtT0NvSUVxOHNEeUNhSEhFY2ZYQzNqMS8yOFdQNzRk?=
 =?utf-8?B?cmdWRWt6SmZUMkxkck5acHpOUk1PZ2haU0t6TC9MelJWaUhsN1B4Nkd6dkg3?=
 =?utf-8?B?UE5JMlUwUzZDemFXWG9WZFdYV2xwNnlhbWoxd2UzNlFvL2NaalcxQUNiRjdO?=
 =?utf-8?B?Zm5ocXgwbGpWVVlXcU1aQlh0cFdkejRqMGhXNThZdmtMSWVuWjRBMzcvWEFF?=
 =?utf-8?B?TEd5N1hUdzBSNkVVbUZDNkViOEZxUEFqL1o1Q3pCOG5RY2tIWHlaTEYzQ3Zh?=
 =?utf-8?B?M2s5dVE0aVlQekllR09udUFBK3pIRHNneFVPU3NPaHNMTkNvRnpVZHhpTkF1?=
 =?utf-8?B?SDZnTXVJYkdwOTNzT2Z2K3RYc0NnbExrUXYzR0luT2dZanl1Y2FyMFhhOE0w?=
 =?utf-8?B?dGsvUFpNekJaV2ZsdjlmYmZCZzdOOHZaT2REMVZMY1ZqbkRQQjRSSGt3UFhW?=
 =?utf-8?B?VzZ5VzQ3Q3dDbVdrV1lXbEt5RmpybE40UmF6aDd3ckM5anN4NndlMi9mbTNn?=
 =?utf-8?B?Zm5NSloxV0xiK2ppY1pSVXZyMktIQ3RPWk43UjNGZ1E2NkpWSzlKYzlBT04z?=
 =?utf-8?B?WWR3cGJkR2krMmxuLzFSZkd2TzlDbVZnWEJ4YjZSWnBJbzRVQVRudXVDQ3E4?=
 =?utf-8?B?Q08veXRURlZGMkc3MkxxVHpYeVNCYWRHTnZZZEVwemViSEZLYjFBa0NQMGpY?=
 =?utf-8?B?ejBzdGg5M3lIR215MFhxSUVvSG1IemIzVlBQZ29aZXc0dHNyTVFObVlidGNa?=
 =?utf-8?B?R3VxRjNGdjZWd3RyQUVuaWJxaTlpeXk4aGtoMzFSQkVxanZOdHVTUVFpUHpF?=
 =?utf-8?B?ZWx0WE4vUzh2WmlXVDhaNTVwUTFDNmJSUnhVTTYzc0lhQVUwSGNTM0JmdnV6?=
 =?utf-8?B?ZUhkL3pLV25Jc2NQRW15d0kwU0ZUaXFhcmVqc0pnOVl6ZGFUR3N2SVY5dEZq?=
 =?utf-8?B?WWxKU1lzLzR3VGZ2WERvUEh1MnF5ZnFVdld5SjBRcTE4Y0MrU0duMUt1VXBV?=
 =?utf-8?B?eW5UM3FXYmlqeXpzcDNXdjJ4eGVocHdYNVd5eGxLbUI0TlVwL0VHbHpJTE9Y?=
 =?utf-8?B?SU14MGhzcDZxdHYzREU0eWNvQlFqWi85b1VrcGRYNFRpRE5YekpxSlBpb2Nh?=
 =?utf-8?B?R3cxY3J3MFhEVm5Scks0MUg3TDZVV0x6TDdYWUNCYXpnd2JCL1AwUTZJd1c1?=
 =?utf-8?B?WUF6cTBGUHRPUnJuVThPc2RIYTR1UzhvVFowZGtKU0ZnTFJBOUVhOVdxWDBK?=
 =?utf-8?B?aDAyem81RFd3Mk1Oa0lhQTZVckdZeHpGbVVuT2VaZ3hxZkQ4clV6a2xDdXUy?=
 =?utf-8?B?d24xczlNUjFTa05MbkJHckZCa1JmbEtJb3hMTWg4Wm5JNG1acW9mZlU0OTht?=
 =?utf-8?B?eEpqTjI1N2hiZCt1QlNHWWFaaU1nRTRkbTBPTkh4UDJ5K01XNHo1d1I4Ty9X?=
 =?utf-8?B?Qjd5MFc5TXErL3g0THVMZnM5Z3pIL3FlQ3B0MnE5ZFhaalhwQ1I1VVJvQXVP?=
 =?utf-8?B?eFBwUS9qV3U3c1hwTHFXdFNndC9jMnNUaWx2ek1qMlhOTlQvOTRCVVFsSzJR?=
 =?utf-8?Q?So42JlONN/1ezzQGV5pGSJFXa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01364e6d-8c8b-446b-8b74-08daee0fbd7c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 04:54:20.0447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HTZi0O2YsH1ix6/SawAqcRUQcA+TqTw1iQNvSqbJxAO5S3WxOQI81JByHXkeLnof
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5858
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Carlos Soriano Sanchez <csoriano@redhat.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/4/2023 3:48 AM, Mario Limonciello wrote:
> Simplifies the code so that all SDMA versions will get the firmware
> name from `amdgpu_ucode_ip_version_decode`.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v3->v4:
>   * Move out of IP discovery and instead simplify early_init
> v2->v3:
>   * Fix dGPU naming scheme
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c |  7 ++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h |  4 +-
>   drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c   | 47 +-------------------
>   drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c   | 30 +------------
>   drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c   | 55 +-----------------------
>   drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c   | 25 +----------
>   6 files changed, 13 insertions(+), 155 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
> index 9e85a078d918..83e8f0dae647 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
> @@ -200,15 +200,18 @@ void amdgpu_sdma_destroy_inst_ctx(struct amdgpu_device *adev,
>   }
>   
>   int amdgpu_sdma_init_microcode(struct amdgpu_device *adev,
> -			       char *fw_name, u32 instance,
> -			       bool duplicate)
> +			       u32 instance, bool duplicate)
>   {
>   	struct amdgpu_firmware_info *info = NULL;
>   	const struct common_firmware_header *header = NULL;
>   	int err = 0, i;
>   	const struct sdma_firmware_header_v2_0 *sdma_hdr;
>   	uint16_t version_major;
> +	char ucode_prefix[30];
> +	char fw_name[40];
>   
> +	amdgpu_ucode_ip_version_decode(adev, SDMA0_HWIP, ucode_prefix, sizeof(ucode_prefix));
> +	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s%s.bin", ucode_prefix, !instance ? "" : "1");

It is safer to keep the original logic with instance number as suffix 
rather than hardcoding to 1.

Thanks,
Lijo

>   	err = amdgpu_ucode_load(adev, &adev->sdma.instance[instance].fw, fw_name);
>   	if (err)
>   		goto out;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h
> index 7d99205c2e01..2d16e6d36728 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h
> @@ -124,8 +124,8 @@ int amdgpu_sdma_process_ras_data_cb(struct amdgpu_device *adev,
>   int amdgpu_sdma_process_ecc_irq(struct amdgpu_device *adev,
>   				      struct amdgpu_irq_src *source,
>   				      struct amdgpu_iv_entry *entry);
> -int amdgpu_sdma_init_microcode(struct amdgpu_device *adev,
> -        char *fw_name, u32 instance, bool duplicate);
> +int amdgpu_sdma_init_microcode(struct amdgpu_device *adev, u32 instance,
> +			       bool duplicate);
>   void amdgpu_sdma_destroy_inst_ctx(struct amdgpu_device *adev,
>           bool duplicate);
>   void amdgpu_sdma_unset_buffer_funcs_helper(struct amdgpu_device *adev);
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> index 4d780e4430e7..017ae298558e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> @@ -575,60 +575,17 @@ static void sdma_v4_0_setup_ulv(struct amdgpu_device *adev)
>   // vega10 real chip need to use PSP to load firmware
>   static int sdma_v4_0_init_microcode(struct amdgpu_device *adev)
>   {
> -	const char *chip_name;
> -	char fw_name[30];
>   	int ret, i;
>   
> -	DRM_DEBUG("\n");
> -
> -	switch (adev->ip_versions[SDMA0_HWIP][0]) {
> -	case IP_VERSION(4, 0, 0):
> -		chip_name = "vega10";
> -		break;
> -	case IP_VERSION(4, 0, 1):
> -		chip_name = "vega12";
> -		break;
> -	case IP_VERSION(4, 2, 0):
> -		chip_name = "vega20";
> -		break;
> -	case IP_VERSION(4, 1, 0):
> -	case IP_VERSION(4, 1, 1):
> -		if (adev->apu_flags & AMD_APU_IS_RAVEN2)
> -			chip_name = "raven2";
> -		else if (adev->apu_flags & AMD_APU_IS_PICASSO)
> -			chip_name = "picasso";
> -		else
> -			chip_name = "raven";
> -		break;
> -	case IP_VERSION(4, 2, 2):
> -		chip_name = "arcturus";
> -		break;
> -	case IP_VERSION(4, 1, 2):
> -		if (adev->apu_flags & AMD_APU_IS_RENOIR)
> -			chip_name = "renoir";
> -		else
> -			chip_name = "green_sardine";
> -		break;
> -	case IP_VERSION(4, 4, 0):
> -		chip_name = "aldebaran";
> -		break;
> -	default:
> -		BUG();
> -	}
> -
>   	for (i = 0; i < adev->sdma.num_instances; i++) {
> -		if (i == 0)
> -			snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_sdma.bin", chip_name);
> -		else
> -			snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_sdma%d.bin", chip_name, i);
>   		if (adev->ip_versions[SDMA0_HWIP][0] == IP_VERSION(4, 2, 2) ||
>                       adev->ip_versions[SDMA0_HWIP][0] == IP_VERSION(4, 4, 0)) {
>   			/* Acturus & Aldebaran will leverage the same FW memory
>   			   for every SDMA instance */
> -			ret = amdgpu_sdma_init_microcode(adev, fw_name, 0, true);
> +			ret = amdgpu_sdma_init_microcode(adev, 0, true);
>   			break;
>   		} else {
> -			ret = amdgpu_sdma_init_microcode(adev, fw_name, i, false);
> +			ret = amdgpu_sdma_init_microcode(adev, i, false);
>   			if (ret)
>   				return ret;
>   		}
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> index d4d9f196db83..1941b3b7c5d9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> @@ -237,39 +237,13 @@ static void sdma_v5_0_init_golden_registers(struct amdgpu_device *adev)
>   // emulation only, won't work on real chip
>   // navi10 real chip need to use PSP to load firmware
>   static int sdma_v5_0_init_microcode(struct amdgpu_device *adev)
> -{
> -	const char *chip_name;
> -	char fw_name[40];
> -	int ret, i;
> +{	int ret, i;
>   
>   	if (amdgpu_sriov_vf(adev) && (adev->ip_versions[SDMA0_HWIP][0] == IP_VERSION(5, 0, 5)))
>   		return 0;
>   
> -	DRM_DEBUG("\n");
> -
> -	switch (adev->ip_versions[SDMA0_HWIP][0]) {
> -	case IP_VERSION(5, 0, 0):
> -		chip_name = "navi10";
> -		break;
> -	case IP_VERSION(5, 0, 2):
> -		chip_name = "navi14";
> -		break;
> -	case IP_VERSION(5, 0, 5):
> -		chip_name = "navi12";
> -		break;
> -	case IP_VERSION(5, 0, 1):
> -		chip_name = "cyan_skillfish2";
> -		break;
> -	default:
> -		BUG();
> -	}
> -
>   	for (i = 0; i < adev->sdma.num_instances; i++) {
> -		if (i == 0)
> -			snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_sdma.bin", chip_name);
> -		else
> -			snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_sdma1.bin", chip_name);
> -		ret = amdgpu_sdma_init_microcode(adev, fw_name, i, false);
> +		ret = amdgpu_sdma_init_microcode(adev, i, false);
>   		if (ret)
>   			return ret;
>   	}
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> index 65e7a710298d..8e445eb9dd49 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> @@ -89,59 +89,6 @@ static u32 sdma_v5_2_get_reg_offset(struct amdgpu_device *adev, u32 instance, u3
>   	return base + internal_offset;
>   }
>   
> -/**
> - * sdma_v5_2_init_microcode - load ucode images from disk
> - *
> - * @adev: amdgpu_device pointer
> - *
> - * Use the firmware interface to load the ucode images into
> - * the driver (not loaded into hw).
> - * Returns 0 on success, error on failure.
> - */
> -
> -// emulation only, won't work on real chip
> -// navi10 real chip need to use PSP to load firmware
> -static int sdma_v5_2_init_microcode(struct amdgpu_device *adev)
> -{
> -	const char *chip_name;
> -	char fw_name[40];
> -
> -	DRM_DEBUG("\n");
> -
> -	switch (adev->ip_versions[SDMA0_HWIP][0]) {
> -	case IP_VERSION(5, 2, 0):
> -		chip_name = "sienna_cichlid_sdma";
> -		break;
> -	case IP_VERSION(5, 2, 2):
> -		chip_name = "navy_flounder_sdma";
> -		break;
> -	case IP_VERSION(5, 2, 1):
> -		chip_name = "vangogh_sdma";
> -		break;
> -	case IP_VERSION(5, 2, 4):
> -		chip_name = "dimgrey_cavefish_sdma";
> -		break;
> -	case IP_VERSION(5, 2, 5):
> -		chip_name = "beige_goby_sdma";
> -		break;
> -	case IP_VERSION(5, 2, 3):
> -		chip_name = "yellow_carp_sdma";
> -		break;
> -	case IP_VERSION(5, 2, 6):
> -		chip_name = "sdma_5_2_6";
> -		break;
> -	case IP_VERSION(5, 2, 7):
> -		chip_name = "sdma_5_2_7";
> -		break;
> -	default:
> -		BUG();
> -	}
> -
> -	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", chip_name);
> -
> -	return amdgpu_sdma_init_microcode(adev, fw_name, 0, true);
> -}
> -
>   static unsigned sdma_v5_2_ring_init_cond_exec(struct amdgpu_ring *ring)
>   {
>   	unsigned ret;
> @@ -1288,7 +1235,7 @@ static int sdma_v5_2_sw_init(void *handle)
>   			return r;
>   	}
>   
> -	r = sdma_v5_2_init_microcode(adev);
> +	r = amdgpu_sdma_init_microcode(adev, 0, true);
>   	if (r) {
>   		DRM_ERROR("Failed to load sdma firmware!\n");
>   		return r;
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
> index 049c26a45d85..bf1fa5e8d2f9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
> @@ -78,29 +78,6 @@ static u32 sdma_v6_0_get_reg_offset(struct amdgpu_device *adev, u32 instance, u3
>   	return base + internal_offset;
>   }
>   
> -/**
> - * sdma_v6_0_init_microcode - load ucode images from disk
> - *
> - * @adev: amdgpu_device pointer
> - *
> - * Use the firmware interface to load the ucode images into
> - * the driver (not loaded into hw).
> - * Returns 0 on success, error on failure.
> - */
> -static int sdma_v6_0_init_microcode(struct amdgpu_device *adev)
> -{
> -	char fw_name[30];
> -	char ucode_prefix[30];
> -
> -	DRM_DEBUG("\n");
> -
> -	amdgpu_ucode_ip_version_decode(adev, SDMA0_HWIP, ucode_prefix, sizeof(ucode_prefix));
> -
> -	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
> -
> -	return amdgpu_sdma_init_microcode(adev, fw_name, 0, true);
> -}
> -
>   static unsigned sdma_v6_0_ring_init_cond_exec(struct amdgpu_ring *ring)
>   {
>   	unsigned ret;
> @@ -1260,7 +1237,7 @@ static int sdma_v6_0_sw_init(void *handle)
>   	if (r)
>   		return r;
>   
> -	r = sdma_v6_0_init_microcode(adev);
> +	r = amdgpu_sdma_init_microcode(adev, 0, true);
>   	if (r) {
>   		DRM_ERROR("Failed to load sdma firmware!\n");
>   		return r;
