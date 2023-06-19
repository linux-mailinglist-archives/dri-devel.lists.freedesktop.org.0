Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B42734A2D
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 04:26:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C66210E14E;
	Mon, 19 Jun 2023 02:26:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060.outbound.protection.outlook.com [40.107.92.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 787D810E19E;
 Mon, 19 Jun 2023 02:26:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g82aDgs7rE9FGVhwK8EFTcqIrGTamnZVjTgVmIFfcY1etcEUYOONDdlSHHKZUzy3tS7BTXpvkJnWm4vUWbJpaTXuDtmRT4Y60iqV3Y8xueigivi8AsBxZv6FbXdMLLFmPdeog611m2hb8LBp6OgO7uWj5ZLTuFJZM6iEAdQX4210RyuXV8p4PaF6FuU1MZ1DifyAZWXFoOwDD3In9PJM0PkCw5+NOBrnuo4wyhsoxzob+f2A9GgOn+BcDIVM07wlGkGpQHb3BBudDcUVELM3E5feul9yhYZCVKuoDTLvjUixaRk9D6uWW3+pmUleBvvelGGnWkrA4ByqC3Dyve6oAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TUN02rC0s8GkEYNaLdUVkToG7Zv9jSfJzmq6vovrai8=;
 b=NcogmegAgaaES8B15q+K4YIO6359EniWypilr3ib9guF6sWsi1oiwth23XUw8VwvM0G/xSP+U0tbcEWmggcX2dGha42xZq7jwrAX/XEk3U6fkeXTALGT5C3OAtYb4B2CcGA9BZmckZMa+FYjjm9KLMYvP/8nDSpI6nkOZFJPy7hS6WXM+vTsQq3B6197uqR089g9zMWDACzOGp3/hnW8AH4q4PQI4Efbko3JO3PvWiaUUrwHLahWxp8cQj6vQkoIRI5pQc85DmnP7ztv8JRFh729kCvhQMMlmt/T1UIdSql5cCUtKMEMUOFQ2rcCyIICCkY0ZzzMQfQ1/v7id8zHsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TUN02rC0s8GkEYNaLdUVkToG7Zv9jSfJzmq6vovrai8=;
 b=eFJ+803sr76noNS8WV7V9ZoGTjY7l0ICgssLO4v+hni+ky1or89gA5UXZeueMYyl/uJQGt83F51r9Vf2hIyAspqChGD1890vDJg3hZ/Ktu0CV4b1CyJHAzaafJEjrcoag0cel5kEBrgNpiyz3Z7+5py7LHS7Fi9AOEAc3qP1X+w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SA1PR12MB8860.namprd12.prod.outlook.com (2603:10b6:806:38b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.29; Mon, 19 Jun
 2023 02:26:08 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70%5]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 02:26:07 +0000
Message-ID: <0d60dd52-2475-2f08-90c4-699f8a427291@amd.com>
Date: Sun, 18 Jun 2023 21:26:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH V3 6/7] drm/amd/pm: enable Wifi RFI mitigation feature
 support for SMU13.0.0
Content-Language: en-US
To: Evan Quan <evan.quan@amd.com>, rafael@kernel.org, lenb@kernel.org,
 Alexander.Deucher@amd.com, Christian.Koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, kvalo@kernel.org, nbd@nbd.name,
 lorenzo@kernel.org, ryder.lee@mediatek.com, shayne.chen@mediatek.com,
 sean.wang@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, Lijo.Lazar@amd.com
References: <20230616065757.1054422-1-evan.quan@amd.com>
 <20230616065757.1054422-7-evan.quan@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20230616065757.1054422-7-evan.quan@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR16CA0069.namprd16.prod.outlook.com
 (2603:10b6:805:ca::46) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SA1PR12MB8860:EE_
X-MS-Office365-Filtering-Correlation-Id: 60547120-aba3-4ad0-5bb9-08db706c8990
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xyiD0Qx6O0LDx4/jNZYo4N+/DK9fP5G4xPDs7ma70/GX5fs38Y6Iist3JamtOpuVgySE13JdBTXzfiYMzZWUn1AxUny+AjJJaqT9XMPxgwCEBZy3vJTQvidwBSFYI8ae91dfzCLqdAw55ZO9Yhd4ttpAKGHbfsWwEuno12QrzTmsRvowiecW8pV7WjuK0mPXTRnlD/1zTOY+WTaDgBsKLF7PBQ53qai6qwoZJgfAwrFL06uJLAMQpuN6eUMdkM4TTtGJ9jDMu1zgmPA65pp1tgj/KZV7WmZ4GspPg7fgLV1mk45xglSsJ4k5JjPo8GtKJEVoZLWUVI14x3Wai63/F6zTlsXqxNJFIxIAcTngT12Nm/nx7Ti+46W/NVo4hQcH0l2doMUkFuuzE8zZ9Tj/CixrZzPOKi6HRp1j8UZIYoLzTR6XYkmht0z/ncrK3JLCajo9Px+/iPGW9BDWYSt9AE+s2QupH5diRWFxJ4mzQbg3SdpVuXHFQ5oQGvs/Qer0CpTYUHlmSHPk/ZT187g74mhB7y3qfNgOKojNzPJMASABFMYcwWdllzL4vtVXJ26/zCkf4WOzuuEVVKz8gW7DwuYPeTcA/wqhD/gnR/W2ZDKlmq88iKXeSI79MDYq/nK0LokLVFPOwPMdee1Movse36qWjl4MeP5KNlwGJNOhX44=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(39860400002)(376002)(346002)(366004)(451199021)(316002)(478600001)(44832011)(31696002)(86362001)(6486002)(6666004)(38100700002)(41300700001)(83380400001)(66946007)(66556008)(6636002)(4326008)(66476007)(8676002)(8936002)(31686004)(921005)(2906002)(5660300002)(6506007)(53546011)(186003)(6512007)(2616005)(36756003)(7416002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEdmWUd0QU5YbmN0aWdrREIySUcxbTdvOFVhWFh6YnF2QXNzdmdKQzZBRm1B?=
 =?utf-8?B?RnAwN1ZlV3Z2OFBlMDJwQmVlcE1KeE0yQlhNTWhKcmlKWFIra2ZiQlFzazlq?=
 =?utf-8?B?b01wdTZYOHJDbFNLQ0hhTVkvZElTanJreVJVYWdySWhoR3czUCtZeTJ0R05n?=
 =?utf-8?B?UlZDNnI3S0xRait5cG1wQTZSV0JrQm9qOWtlT0xWK3p1b2h3UTF1RlVUQTJM?=
 =?utf-8?B?UTR2c1BoRC9ReDdvR2kvSm9QVEluVnlUSXNpKzBJb3pvQ0NER3ZHdlN4NjBh?=
 =?utf-8?B?dE4xTnVNM3BBWVQrOG1uZ2cwei9Nem9SVERucXRRTlFHU1piU1EvbUNjR21W?=
 =?utf-8?B?d0thOWE5YTVRd2w5WjVaMGNYZ25lOGZUNGVyK29ZZXJTZXNmSUQ4N3hvWVEr?=
 =?utf-8?B?Z05saFBhYXJuSnBZbHZJQzFtdjZBZlBONXJIZXczT1o0a2pDRzBWOVh5VW5V?=
 =?utf-8?B?d1RHVEkrc01mMEVvTkJodWtNaXFLUWI2QXl2Y3pxUEhiRytNTXpqQ0pvM2tP?=
 =?utf-8?B?SDZjMWZBb3JUSEI5VVRuWkJLT3pmOXpuYUpsa0ZVM2U4dUhBRkhCdUk2TEdt?=
 =?utf-8?B?blpsQmV3MUpqMmhBZWY5dHFrVHFrc1RPQURJSE4wem8ycGF3MlQyRklTOWlQ?=
 =?utf-8?B?VmRBWnJ0c01ZMVhZOU1pT1ZuL3NZZjhwNmhBcW1mYWx5TkZ6VmYrT1Fhak9w?=
 =?utf-8?B?OHlacDJMc05wU2pGU2JaZ0xWU2pDd3FsU2JMRW0xOWt0Wkh3ajBtWFE3emg1?=
 =?utf-8?B?ZkVNcWgwaWV3MWZ2YzFCWm5YS1Bla01SN201UWJ4eCtqOWEyaWgvYnh5T1M4?=
 =?utf-8?B?dDZIeDBvS3dnRHY5UTc4MlpmOFFDVWxjZ01hVTdQd1duOHNjak9GeTNCUkdF?=
 =?utf-8?B?KzM0dnI1dk1EY0xkbTJNVVB4RVhGNjZjaXNwS3RSR0tVcUdiQ2tWSHI5Tjk3?=
 =?utf-8?B?R0Yxa2wveVF0eDlxUWlyZmNBOEV1WGFxWEh0Y3ZiZkk1UnJsQlJ1NkI2a2V2?=
 =?utf-8?B?ZjJQYmJmT1p6SWh6NlRnR01pUHkreUpWbzdGVVRDcERPcVd3QnBkT1hlaEJU?=
 =?utf-8?B?eldaM0wxWExlbTdtdUhBSkRoVW1NM21adzI2bmZiNlhacFFqWG81eC9lcW40?=
 =?utf-8?B?bDhOLzNFWURZQXR0bFlVdnc0MWtGSitoT1ZQUkZOMEhqWGd0ZG52K0V5ZWhO?=
 =?utf-8?B?b2ZQZDA5ZnY0MzRWMnExamxFQ0tPL2g5T2QzL2NMc0dqK3NndTdiZVphVkkr?=
 =?utf-8?B?TW9DQnpLOS9wVk8yNXhINVV6LzN5NVNhYk1zcGw1dkEzTEhkTWNmSDFDK2hl?=
 =?utf-8?B?dGIwWC8zOWhyRW5Qc3MyWU9wanIyT3liTmtJK1daV1pjUDZKTVR0Vk10VllF?=
 =?utf-8?B?OGNXdjl2RkZGMGk3NGQrZFFKZ21YdkRKQ0l3clYzbzIzSzFrWmp5V0VZaDVm?=
 =?utf-8?B?cFZNZEN6eVI4Nm9QUEZsU2x3Z3JHaE4zc09tQ2pIYmVTMmE4Wlh2dFM4RTdM?=
 =?utf-8?B?WU9Ncmo2ZHhKbThrSE9qbGJkWFFZSTZhTjFJVTBMR2hsaXJjYm5mL0UvVjRO?=
 =?utf-8?B?NG50Qy9rQlVINjJyelVUVzg5V3hwazVDZkIyRm9pWlMvQWxjc1EwbGVicTlS?=
 =?utf-8?B?SkZpdW1nRjN0VkJhcERuWWlHV2ZOQ2ZUeWswZFNSOXlkLzVCby9uVTZvWHk1?=
 =?utf-8?B?d1h6L0xqY0JFek8zZW9Hbm1tRitIdUFWMkY2elB1d1pCUExmSFlOUTVsVVZn?=
 =?utf-8?B?Sk02aTYvc3Y5NE4zanNPRFkweFIvaDRqdmliUytnQVRWYUNGSndTOWszZGNP?=
 =?utf-8?B?VHJxTXMyM21RUzdIb2ZRSk56T1FXUmFzZldxMWZqVi93cTF4Nlk0VWdDZUoz?=
 =?utf-8?B?K0QybG1LUmFBMHFSdWtqVVdMMG1NSG9zYWxqcFl0elh4cXFTRjN1SzFtb2JK?=
 =?utf-8?B?NFlHZmNJZzJzNzNNZU1KdmJOWlFnYThRd3ZPYTFTNzM2Sjl6dkZKcW5ockM0?=
 =?utf-8?B?V3QvNTQvL2lKOHBRSlRnSHZ2eGFIZlRHVWM1c2V0cHQwYXdSTHR4QWp5SGxQ?=
 =?utf-8?B?N1VuWHpnV3JsOVVjMi93TC9XRlJqOGh0WUhXL1hzdGsvT29TZlZmVmVnems0?=
 =?utf-8?B?RjNEdFlLRGtIWTVHUEtxY09vT1RsUTF6ckx0cFFBNW9Oano2V0VETCszaFFM?=
 =?utf-8?B?S3c9PQ==?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60547120-aba3-4ad0-5bb9-08db706c8990
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 02:26:07.0982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ozIy2jipPJRTpHlbxWIOILcUIGIitZ7Ak8CR1Gh5BeKAbdVTpG42Fv+jKLCBVpD6mS5ZE3lu8cL2H+voAxqzuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8860
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
Cc: linux-acpi@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/16/23 01:57, Evan Quan wrote:
> Fulfill the SMU13.0.0 support for Wifi RFI mitigation feature.
> 
> Signed-off-by: Evan Quan <evan.quan@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

> ---
>   drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h |  3 +
>   drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h  |  3 +-
>   drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h  |  3 +
>   .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c    |  9 +++
>   .../drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c  | 60 +++++++++++++++++++
>   5 files changed, 77 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
> index aa63cc43d41c..a8a4be32cc59 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
> +++ b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
> @@ -323,6 +323,7 @@ enum smu_table_id
>   	SMU_TABLE_PACE,
>   	SMU_TABLE_ECCINFO,
>   	SMU_TABLE_COMBO_PPTABLE,
> +	SMU_TABLE_WIFIBAND,
>   	SMU_TABLE_COUNT,
>   };
>   
> @@ -1496,6 +1497,8 @@ enum smu_baco_seq {
>   			 __dst_size);					   \
>   })
>   
> +#define HZ_IN_MHZ		1000000U
> +
>   #if !defined(SWSMU_CODE_LAYER_L2) && !defined(SWSMU_CODE_LAYER_L3) && !defined(SWSMU_CODE_LAYER_L4)
>   int smu_get_power_limit(void *handle,
>   			uint32_t *limit,
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h
> index 297b70b9388f..5bbb60289a79 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h
> +++ b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h
> @@ -245,7 +245,8 @@
>   	__SMU_DUMMY_MAP(AllowGpo),	\
>   	__SMU_DUMMY_MAP(Mode2Reset),	\
>   	__SMU_DUMMY_MAP(RequestI2cTransaction), \
> -	__SMU_DUMMY_MAP(GetMetricsTable),
> +	__SMU_DUMMY_MAP(GetMetricsTable), \
> +	__SMU_DUMMY_MAP(EnableUCLKShadow),
>   
>   #undef __SMU_DUMMY_MAP
>   #define __SMU_DUMMY_MAP(type)	SMU_MSG_##type
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h
> index df3baaab0037..b6fae9b92303 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h
> +++ b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h
> @@ -303,5 +303,8 @@ int smu_v13_0_get_pptable_from_firmware(struct smu_context *smu,
>   					uint32_t *size,
>   					uint32_t pptable_id);
>   
> +int smu_v13_0_enable_uclk_shadow(struct smu_context *smu,
> +				 bool enablement);
> +
>   #endif
>   #endif
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
> index 393c6a7b9609..8c2230d1d862 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
> @@ -2453,3 +2453,12 @@ int smu_v13_0_mode1_reset(struct smu_context *smu)
>   
>   	return ret;
>   }
> +
> +int smu_v13_0_enable_uclk_shadow(struct smu_context *smu,
> +				 bool enablement)
> +{
> +	return smu_cmn_send_smc_msg_with_param(smu,
> +					       SMU_MSG_EnableUCLKShadow,
> +					       enablement,
> +					       NULL);
> +}
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
> index 09405ef1e3c8..cf75feaee779 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
> @@ -155,6 +155,7 @@ static struct cmn2asic_msg_mapping smu_v13_0_0_message_map[SMU_MSG_MAX_COUNT] =
>   	MSG_MAP(AllowGpo,			PPSMC_MSG_SetGpoAllow,           0),
>   	MSG_MAP(AllowIHHostInterrupt,		PPSMC_MSG_AllowIHHostInterrupt,       0),
>   	MSG_MAP(ReenableAcDcInterrupt,		PPSMC_MSG_ReenableAcDcInterrupt,       0),
> +	MSG_MAP(EnableUCLKShadow,		PPSMC_MSG_EnableUCLKShadow,            0),
>   };
>   
>   static struct cmn2asic_mapping smu_v13_0_0_clk_map[SMU_CLK_COUNT] = {
> @@ -235,6 +236,7 @@ static struct cmn2asic_mapping smu_v13_0_0_table_map[SMU_TABLE_COUNT] = {
>   	TAB_MAP(DRIVER_SMU_CONFIG),
>   	TAB_MAP(ACTIVITY_MONITOR_COEFF),
>   	[SMU_TABLE_COMBO_PPTABLE] = {1, TABLE_COMBO_PPTABLE},
> +	TAB_MAP(WIFIBAND),
>   	TAB_MAP(I2C_COMMANDS),
>   	TAB_MAP(ECCINFO),
>   };
> @@ -472,6 +474,9 @@ static int smu_v13_0_0_tables_init(struct smu_context *smu)
>   			PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
>   	SMU_TABLE_INIT(tables, SMU_TABLE_ECCINFO, sizeof(EccInfoTable_t),
>   			PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
> +	SMU_TABLE_INIT(tables, SMU_TABLE_WIFIBAND,
> +		       sizeof(WifiBandEntryTable_t), PAGE_SIZE,
> +		       AMDGPU_GEM_DOMAIN_VRAM);
>   
>   	smu_table->metrics_table = kzalloc(sizeof(SmuMetricsExternal_t), GFP_KERNEL);
>   	if (!smu_table->metrics_table)
> @@ -2112,6 +2117,58 @@ static ssize_t smu_v13_0_0_get_ecc_info(struct smu_context *smu,
>   	return ret;
>   }
>   
> +static bool smu_v13_0_0_wbrf_support_check(struct smu_context *smu)
> +{
> +	struct amdgpu_device *adev = smu->adev;
> +
> +	switch (adev->ip_versions[MP1_HWIP][0]) {
> +	case IP_VERSION(13, 0, 0):
> +		return smu->smc_fw_version >= 0x004e5f00;
> +	case IP_VERSION(13, 0, 10):
> +		return smu->smc_fw_version >= 0x00503000;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static int smu_v13_0_0_set_wbrf_exclusion_ranges(struct smu_context *smu,
> +						 struct exclusion_range *exclusion_ranges)
> +{
> +	WifiBandEntryTable_t wifi_bands;
> +	int valid_entries = 0;
> +	int ret, i;
> +
> +	memset(&wifi_bands, 0, sizeof(wifi_bands));
> +	for (i = 0; i < ARRAY_SIZE(wifi_bands.WifiBandEntry); i++) {
> +		if (!exclusion_ranges[i].start &&
> +		    !exclusion_ranges[i].end)
> +			break;
> +
> +		/* PMFW expects the inputs to be in Mhz unit */
> +		wifi_bands.WifiBandEntry[valid_entries].LowFreq =
> +			DIV_ROUND_DOWN_ULL(exclusion_ranges[i].start, HZ_IN_MHZ);
> +		wifi_bands.WifiBandEntry[valid_entries++].HighFreq =
> +			DIV_ROUND_UP_ULL(exclusion_ranges[i].end, HZ_IN_MHZ);
> +	}
> +	wifi_bands.WifiBandEntryNum = valid_entries;
> +
> +	/*
> +	 * Per confirm with PMFW team, WifiBandEntryNum = 0
> +	 * is a valid setting. So, there should be no direct
> +	 * return on that.
> +	 */
> +
> +	ret = smu_cmn_update_table(smu,
> +				   SMU_TABLE_WIFIBAND,
> +				   0,
> +				   (void *)(&wifi_bands),
> +				   true);
> +	if (ret)
> +		dev_err(smu->adev->dev, "Failed to set wifiband!");
> +
> +	return ret;
> +}
> +
>   static const struct pptable_funcs smu_v13_0_0_ppt_funcs = {
>   	.get_allowed_feature_mask = smu_v13_0_0_get_allowed_feature_mask,
>   	.set_default_dpm_table = smu_v13_0_0_set_default_dpm_table,
> @@ -2188,6 +2245,9 @@ static const struct pptable_funcs smu_v13_0_0_ppt_funcs = {
>   	.send_hbm_bad_channel_flag = smu_v13_0_0_send_bad_mem_channel_flag,
>   	.gpo_control = smu_v13_0_gpo_control,
>   	.get_ecc_info = smu_v13_0_0_get_ecc_info,
> +	.is_asic_wbrf_supported = smu_v13_0_0_wbrf_support_check,
> +	.enable_uclk_shadow = smu_v13_0_enable_uclk_shadow,
> +	.set_wbrf_exclusion_ranges = smu_v13_0_0_set_wbrf_exclusion_ranges,
>   };
>   
>   void smu_v13_0_0_set_ppt_funcs(struct smu_context *smu)

