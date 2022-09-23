Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 514585E7250
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 05:04:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED0F910E223;
	Fri, 23 Sep 2022 03:04:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2073.outbound.protection.outlook.com [40.107.212.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3E4D10E219;
 Fri, 23 Sep 2022 03:04:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lslwnqk1PLCHUwLOAlLF4cXA3HQyLrGQ5DoB1HIJabGr4N98iOaukboVES1vrrAHis7dexBwRt1pxwDUGxRRTlZtrMZtFcOI838kayyabfXdcDMYxqZ0oXgrOJ8L9IzuRoWmfUwy5kKJxH2DaOvLKIEAWStlv/1ink0GLH3cAnn8YwLFTs5r1hqyaM9nijjKaUwQNOZvFG22Cai3SfP7pckhBx2daIVRgaCH3sxDa3hgc6qW4WZEl6RyMSC83bbqNC7eAVmErTdDsimvqMwflXk+KT9uiE1D8m+cGzGyF6yjj14sNDce/MXtS3Qx+nQJAZNCFQIerL6R/4WYrZfCiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BrvgUfnDGt3XFG95nQBUxRs/4m/3pMwKvhuPi6WEpS8=;
 b=Uzl8PfOwI7TPHyAmGHWFxW5gZ7OmfWHvbKzZqsMSxN/1S/QhHSt0KpQEEHi4YBxRS3sJ46f/WVO5vYOJEAJxVpmp2hPATXSpJ+RJ7SyGr2eq5P3h8dCUdKW7MDM/QLsmx9VnzWh9KZdVzeT7fF3DjjDqduc52FDYRFzin5J6clHOCH/fW8VSoTdQu+YDRlM/QkUTxDW8x7I99VJ4vgavEHbdQU/dblNwS1BCREyiETLPvTl5ZDVaGCPZnufCKdv5K6QWbdKuZ4Nbf8VQ1M+8imgCl6rAyqfzVebQhGbsjcqN8ST18wvAkjfbKkDRn1xv3rWD6MP8JNkjrUjZp4pshw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BrvgUfnDGt3XFG95nQBUxRs/4m/3pMwKvhuPi6WEpS8=;
 b=ucuzEjABV7j23pfq4lCAhKPl7VSi5MEQXqnbh7wxQ4/+mlf3mjIYeaRxBoJ0zMl2/ZRXB+VhjMEJ9n5HX6/ATqR1alLmw57WcUixpO5GGI447zi8lz8/vIzwsRy+OVbQCRzE898DdXO5U38IkjVG33FPv14RW2Kk+VtsgOM4YHE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4621.namprd12.prod.outlook.com (2603:10b6:805:e4::10)
 by PH7PR12MB6696.namprd12.prod.outlook.com (2603:10b6:510:1b3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.18; Fri, 23 Sep
 2022 03:04:33 +0000
Received: from SN6PR12MB4621.namprd12.prod.outlook.com
 ([fe80::49bb:3d09:3f04:5ee3]) by SN6PR12MB4621.namprd12.prod.outlook.com
 ([fe80::49bb:3d09:3f04:5ee3%5]) with mapi id 15.20.5654.019; Fri, 23 Sep 2022
 03:04:33 +0000
Message-ID: <900023c1-a02e-25cd-f255-0e43693afe23@amd.com>
Date: Fri, 23 Sep 2022 08:34:22 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v1] drivers/amd/kv_dpm: check the return value of
 amdgpu_kv_smc_bapm_enable
Content-Language: en-US
To: Li Zhong <floridsleeves@gmail.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20220922200613.1703624-1-floridsleeves@gmail.com>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <20220922200613.1703624-1-floridsleeves@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::10) To SN6PR12MB4621.namprd12.prod.outlook.com
 (2603:10b6:805:e4::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB4621:EE_|PH7PR12MB6696:EE_
X-MS-Office365-Filtering-Correlation-Id: 76b7b39e-c385-4bed-13f6-08da9d1056b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lYNH0RwNbxNIJ8Ja3pIC0HSuQHrl3DQfM8cB/zT7z0S4yjAepzYAetYeZ8zYUhGRa1JD+np7SC9q27v/6DhVCwz+7XdNEC0otivwvt83Z1rJA3NG8Vlnl3W+KCEgYxaPx2z+ORsjB6LRD8aX8retAugK593VaYN1ocZSKRZ/odNI5CrNlc8wUHk9X5y60bVsMr8m7ULdp+P7V2wN0kNR8BMW8rWpmsuiN3VuV/tAzAWkjntTlj01jAxCyvGTCq9jY/tVC02r6+56fIICreAoJPbF4/4ae01DiP7BxpUSUutCS905ArAUzEKfiNvPt9mX7Tw4/Czn9noYGpvKEhhDaU5iyrNo7PmLS2GDJjjSfuOhYbTmrd7kzMQkV2rQZF7HcwlMybd7Nv8+sQM4opsqKMdeZ51vnDb6PccoDaJpj0XZT8U/ejQGJDbE16zu555cOmVZiBLzPbQHY0CZK5bzFFk6M9mL4G9FW++MyjX3deuWmWYti5yMmFLp3EbwqTJscvJTMS1R9MOuesABHAnktEOZl4CAg6ppe1zMa9Be687NmZy+a1xNpn42KftdXQ8X7cleRCt/LTmVhdfqiE8bp54W8fDvkqx4APM9u4uL3x5RGgOzmYfZ7Q4r3gCA/rGPfAF7pc7N0n2v4t8KrJCHbqpQ+Q9fVHa5RemZ/BaLVCyjs2STdvRP8XrMSAPGsj6poVGd7JO+QHibMEOkZeyidB1R+sjBGe2Y+k0SCUd9KlyQlH9gZhZ2q5kdfDMRla1Ph3CPD4wVtAIzKyw2OTK/OiiWBWn2IxhGY01SwCv5m/8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4621.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(136003)(39860400002)(346002)(366004)(451199015)(66946007)(31696002)(86362001)(38100700002)(5660300002)(8936002)(66476007)(6486002)(478600001)(316002)(4326008)(66556008)(41300700001)(8676002)(2906002)(186003)(83380400001)(6512007)(2616005)(26005)(6666004)(6506007)(53546011)(31686004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmhzbWI3Z25vZ0tQa3RwbTY3cnRFZ2poMHpqeDdFNUg2MmlBZFJ5aFBsa2Rl?=
 =?utf-8?B?QVFlYi8wV3BnSi81Zk5aLzBUYjcxWmk2d3kwZUtLcjM3ZWIvaUdyT0VncWMr?=
 =?utf-8?B?RzN2T29PM01Kd3FweVVXbjM5MjNUc0krdVVGaXNqS1dJbnlkUlM5WnYyN0o1?=
 =?utf-8?B?Tlp6a3hOSVFFeWtaSXByRXIyeWlyTnZBUkpHK1NhRjBHQlplbmRiY3NNMDNS?=
 =?utf-8?B?TmdUOFp5OEVDN1FHT29UK3dFQWZxMXFnY2M3aTZESGk2SWszYlVGVUU4V0o5?=
 =?utf-8?B?YXFuZjNvZDBxZGt6WjJqaWc5cnl4SkxLVk5vWkxZOFExb0VxNSt3cUMxdm1T?=
 =?utf-8?B?TEcrWi9Sc2Rzd3JFWHJCUlN1QzJiZmRlQ2ozQ1VUNU9LVFBpMlNuYnBOdTZn?=
 =?utf-8?B?VC9Tb3VhYVVVRFZUMWxFWEo2a1g0OXRhY1FrRUVoT0FyZ2ZkVUxibEFqMmFE?=
 =?utf-8?B?QmtXQXR6KzBGRGpwaTdQV3c4REVqZkFiRzE4Ym5uU2xWdkEyRkZhUi9VYXNo?=
 =?utf-8?B?dkhiUEIvS2dYZFlkUlJtbG5Ma01OU2NpKytzK1FRMkxISVVrVjBEWWZOa3Jr?=
 =?utf-8?B?WGdrUEhtRVV2MUN1MnhvWkU5VVp4eTdkWjZxT1JLRGdOanRpb0Z0SnhyS2xj?=
 =?utf-8?B?ZTZIblZPWllpM3NjdFdWbVdpMHBEb2RMWUduYmVzeWRONFZLTlNHV012RW4w?=
 =?utf-8?B?MU05M2l2UEJmNmtUejJ5RDV0UERSdjAvcWJHQ2ZTRUxlSTMrV1lGRUYvT3FD?=
 =?utf-8?B?SnUzTXE2Q2tXQlRPVHF3R3pQUk5WZmFYVDNNVVI5cjJFd0FaR2c0aHpOTFhW?=
 =?utf-8?B?aTZ2YUdTYXJwSC9pS1lncldLWTY0b1FXaDZVa29hZm5GV3FkOXFjbUwyeGhS?=
 =?utf-8?B?a3d5eURNVC9SbVlwMm1UenJxbFVKQVV0dzJlMlFTT3BYNmRGajBQaEZCdk94?=
 =?utf-8?B?Q2xpWHViaXJUS1NGdXlTK2pKMlprU29Fd3FsbTNFS28rNVpTYVFEcmtuTm5E?=
 =?utf-8?B?VlNrRmF1VU5ESnZiRHJUOUdyOGhhSVFLbDdubmFVbk9rR2s0WUdKT21OVi9o?=
 =?utf-8?B?QjdpSmgwSDVMYTUrRmJQblNLQlI0TVR1UFYzMW1uT0llWGZ1M2E5cVZnSU9P?=
 =?utf-8?B?L2xMakhzRGgxdkcrWW9zZGI4ejArY0lmcktXZEd3V3RTUDN3dmZQMXNJM2pW?=
 =?utf-8?B?dy9YRnFqOXpxU2FnTlF4UE0wKzVGd1NBazIvRzVvLytZUGhQeGR2K1JNckh5?=
 =?utf-8?B?Uk4zZXV3cURTSmlxSzRVV2JrczltZnFuV01tUVZRVzY2ZE8za0RkVWFTOGND?=
 =?utf-8?B?QW5qWmtGaGtNOXlyMkdxbVlnS2loTk9mc01TSEhmTDBkNVBQb3gvVFJYYUtn?=
 =?utf-8?B?ckM4Z2g1b25mR3FVdmNSdmN2WlVwa3JjMlAybENmbTJHM05XZkFDRXZGYitM?=
 =?utf-8?B?ekN1WjV1YTFOWTVqRnJtVTRwUmpmYVpXN2JpVGtHcW1hZm9mK21Sd1Q1M3Ir?=
 =?utf-8?B?bFJEZkVlcVJqdmR2cTZYM1FwRlQyQjBKVUtNWmQyZFBENTNPVCtHV3Mza3lK?=
 =?utf-8?B?QzJ4Tmk4dWpTd2JNNXlyQXNta3B4MnlxSG5xU3dLdkpOam11SU5HbXRsbkNV?=
 =?utf-8?B?SW9CRmc2a0FiSUJkSm5UWVNXTHdkYXlyaFlHVVRQQVBWNG4vMS9zM0MxTTdi?=
 =?utf-8?B?NWpxVXp3UXZoeWNGcnpmd3ZFWUp2T3VYUXIrSTNtaWxEUENrQU9JY0FyNDFh?=
 =?utf-8?B?bHBEN2dFa0U0ZzMwS001S2JlNm0zVXI0NnJqSjNsNHVBRnBjakcvN2JaVGx5?=
 =?utf-8?B?blRZUkVnREJKOS9ZZ1BibDVoREx4UzkvektkbVNVNTRodVJrT2licWNiR3hk?=
 =?utf-8?B?YU1mMnk0NlgzbHBzWmoyenQxY1lGU0hveG5rK3NSWXlob05ITjVIaDhieHhu?=
 =?utf-8?B?ME53V0hHZVhOQWlMTlZkdU92V1pHS2FUZUVJaXhWZFd5b2JndE52cUFGS0Zn?=
 =?utf-8?B?Z3FMUDNjQmMwWUhHTDYrQTQvNlFPb0pFbUxWV3RIZDNkVFhldlpqaXlJM2Np?=
 =?utf-8?B?YTFqeXFrV0tYWlQ4c0YzV2llR25XTGFxSUd5d3BPOW9TZ3k4bldsUkpkUTgv?=
 =?utf-8?Q?5rAq52NQhayeJB8Nea1Si90VL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76b7b39e-c385-4bed-13f6-08da9d1056b9
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2022 03:04:33.0103 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6MrMt26T0Kd4qHQDKXXEGG4SLXZijjl3sHjcc89EgglUAPJm4Vst1PXHt7r2IzRR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6696
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
Cc: airlied@linux.ie, Xinhui.Pan@amd.com, alexander.deucher@amd.com,
 evan.quan@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/23/2022 1:36 AM, Li Zhong wrote:
> Check the return value of amdgpu_kv_smc_bapm_enable() and log the error
> when it fails.
> 
> Signed-off-by: Li Zhong <floridsleeves@gmail.com>
> ---
>   drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c b/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
> index 8fd0782a2b20..d392256effe2 100644
> --- a/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
> +++ b/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
> @@ -1384,13 +1384,16 @@ static int kv_dpm_enable(struct amdgpu_device *adev)
>   static void kv_dpm_disable(struct amdgpu_device *adev)
>   {
>   	struct kv_power_info *pi = kv_get_pi(adev);
> +	int err;
>   
>   	amdgpu_irq_put(adev, &adev->pm.dpm.thermal.irq,
>   		       AMDGPU_THERMAL_IRQ_LOW_TO_HIGH);
>   	amdgpu_irq_put(adev, &adev->pm.dpm.thermal.irq,
>   		       AMDGPU_THERMAL_IRQ_HIGH_TO_LOW);
>   
> -	amdgpu_kv_smc_bapm_enable(adev, false);
> +	err = amdgpu_kv_smc_bapm_enable(adev, false);
> +	if (ret)
> +		DRM_ERROR("amdgpu_kv_smc_bapm_enable failed\n");

Return code is captured in 'err' and check is for ret' variable.

BTW, does this code compile?

Thanks,
Lijo

>   
>   	if (adev->asic_type == CHIP_MULLINS)
>   		kv_enable_nb_dpm(adev, false);
> 
