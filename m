Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D4F734A1C
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 04:23:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 243BE10E148;
	Mon, 19 Jun 2023 02:23:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2059.outbound.protection.outlook.com [40.107.244.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B3C10E13A;
 Mon, 19 Jun 2023 02:23:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GhevWjIu6ofs1793hd+H+HWGuGDkeFNw3ZSlcBKO8dbXUcUt/q+wwyH5XSwGOOJfvEuqO1kU228Zg0nmrxY+XIsce4g3c1Eb9FsOaIThym2L16ItsgGIfIiw8R9e+eBJkcPr5/dBYnevdsc94wDYfZX32wOuUFG9Y/KTDTQi3obyjdONKXAHkeYk7/+G2V913Oh3g3NxRBqHAhgVghzfhIvn+/oUS+nMZyVqpA6AwnUvvSCWxS3jVaKW4TJrmcXOB93ViLnMDaSb2E9udmKCj0oQSSdQ9Qj+m/1X0wEdSvB350QD8hqqHiQv0wzlVvwhtfsfmCUMtUZm/hpy3EhKEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E/LWtaEYa1rN9CpTglx0fpLmvUWxrRps8/Yy2F2q+Es=;
 b=GF0P8fMj/JR8uQa/hANAf8DMRFWSttozcgcTsifwyT0IX5HWqBor4YhUwkQlLLZG7s/x9KEgpkR0u/N380gQUR0LtWRhiME6crirrNbYqQzJik+mHuKWdzoDeTJsyg2dLLa/1LyAn8mTGG1Bkf0C94KCLlvYDFMW7fsFw19++Mv1DMDazKNZtwWKNJI+q2T31I2+Oi8H96K3aPZTozj1fCJF3/uOol1TN7Ok4eg9xP+3YcwLnBWzxpa4jioCeHCCj8BKL7rA4vG+OIBNuJnrur7DuuqPW2awFmb18aCpuPUhMDJYorVyswdJJ+Wfr3258+H8tMcUM2V4vwzlFiE5Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E/LWtaEYa1rN9CpTglx0fpLmvUWxrRps8/Yy2F2q+Es=;
 b=DY4iThVCxixSjPUWqR9k66s2V5sqwpS+I0IU04a1PryEjLOc7azbgl9VbWXm9dL65em8fhAxTeav3DRdjN7EiPo+Xt+K5kAshAyeifHCbwEdREDHicV6hB7JprORTnryHRQl2dRlltKcGudjBR+egwpPPWyOw4bm9fsag6vCcVQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA0PR12MB8424.namprd12.prod.outlook.com (2603:10b6:208:40c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.39; Mon, 19 Jun
 2023 02:23:02 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70%5]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 02:23:02 +0000
Message-ID: <83f35ea2-935e-3026-908e-74a5147b22f8@amd.com>
Date: Sun, 18 Jun 2023 21:22:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH V3 5/7] drm/amd/pm: add flood detection for wbrf events
Content-Language: en-US
To: Evan Quan <evan.quan@amd.com>, rafael@kernel.org, lenb@kernel.org,
 Alexander.Deucher@amd.com, Christian.Koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, kvalo@kernel.org, nbd@nbd.name,
 lorenzo@kernel.org, ryder.lee@mediatek.com, shayne.chen@mediatek.com,
 sean.wang@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, Lijo.Lazar@amd.com
References: <20230616065757.1054422-1-evan.quan@amd.com>
 <20230616065757.1054422-6-evan.quan@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20230616065757.1054422-6-evan.quan@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR03CA0100.namprd03.prod.outlook.com
 (2603:10b6:5:333::33) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA0PR12MB8424:EE_
X-MS-Office365-Filtering-Correlation-Id: 46a1dd6b-57ae-49d0-0dd9-08db706c1b5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A+18N5FQt2qYVoxvEU/SWQIVHJcQFxd5sAMvJbtbGYa9CqJRlfMy55uwO/vpjntGg2MnwNIRHbprbfTh2FZkJ8np3ELV5qp6DNQMXei/jFSZoCX76A1aVubwcr42KUfn2uHIxyz+JTIYMjHvXLOUwotQGwKII2h2M/GFZz0yVQoe8KbKENjg9TCIR7xuVEWbwHF4Qk6Y03BTokCOjEc7wVhn/XzgnfCCyytdu33Wbw7RUdVlc3yLmnziQXMj3VYdx063qodNM+yX5hNZ4JeqBqi8sPM91NOeoqz6l8B24sUVuSBC1aVwaSLSiUGtrC0xtZVIFd7y+8LnpNvv2eJOf+AcFZkMuNimuV90SS0BvkIZuLQDxZYsCBCdyhPhUzZ822nGy98XW6kS4t3Ud3JbrxBEVBOSzuaeUvI3bFLndjQnrsu4Pf4KMuoXFEmOTsUXtkcqBmKg198H2KqwqwXQO+2W2+TiIZGTf1oAM2ao9H/EruK2Evw5oU1VY/9fFw8/9Ij5aSAd5xLs4fMvKJbmR1wILgZR2ZknkJcS2Mitl18O0p4pdnX9WfRBca30yQpaSKmvVxwdhJ3j54n1v7MVCsK1XShHAfG4cstAkXGXlAmFcwegCHZD/skCB1zWLT92/42UcUetkYN95RBMSrrcZF5aLfU61ewUw1mxupV5rNk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(376002)(366004)(39860400002)(396003)(451199021)(316002)(6486002)(41300700001)(53546011)(186003)(86362001)(6506007)(44832011)(83380400001)(2616005)(2906002)(6512007)(7416002)(921005)(38100700002)(31696002)(36756003)(5660300002)(8676002)(6636002)(4326008)(66476007)(66556008)(66946007)(31686004)(8936002)(478600001)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SndkQzl2UEltcFVVVmo0dm94MjVLM2tndXgrcTI2dTJVNGRhbk84UGxjaGxF?=
 =?utf-8?B?TmM5Y0lPZnZwNnhLUGo2eGxDYVgzYUZDeWlKZEltaCtLSWxFUzVmQ2YvZm5h?=
 =?utf-8?B?cXhyTXEyb0RFMnQ3QmthclJUUG15R3pncXdaV25STWd2d1hXYzduTjZmVHp3?=
 =?utf-8?B?Z3hlWHd5aUFmUUpVUUNUVHJCYU0wMVlVVGlMNldWWVoxWmZJY0RBUXZLbm5v?=
 =?utf-8?B?STMxcklVS25NcXdWNkdQN1d0R3pjMGpXa083WGw5RW1JWUpDMVJVbnNuZk56?=
 =?utf-8?B?T3ZMTnBhYk50N0Q1WVlvVFRmeEZVcTQ1TTR4dlJGeUwvQ1Jma0ovOTlWSDRZ?=
 =?utf-8?B?eERkek4zUWV6Z0Y5anUyaUJScStKenAzcHpLOVZRZmVXWHhxU3VoS2U0a1py?=
 =?utf-8?B?Wm5LUzRUNmRSR0FzSjI5OWx4Wnd1NFBQNFVEdWNyZnVtdVBhSkhPUFhlcGs2?=
 =?utf-8?B?YXVIejJ2QVZYWWEzQzVxc3QyTnBEZXg2a3RTcEVDWTIrdGZhY0xPN0hpSElK?=
 =?utf-8?B?SUdjWEU2MHk0dldGejRsRlpweUF3OU5LVm9GRWlHYnRwSUtmTHdlN043SVo2?=
 =?utf-8?B?a3ZyL2E2U28rRUlISmNDbzYwQ24rQk1mSVJjYzdEb0xMeDZZamkvRFF4SnRZ?=
 =?utf-8?B?OXVjczdVb2k1elFDc25RNGVCQk5iYU9aZEZNemFFdVE4YlJONUQ2WlFMWTBi?=
 =?utf-8?B?T3VOVk9pVy9NM24xd0RCa252Nlk3b2RQcStXdkVmVER6ZStjT0NPSXNHU3ZI?=
 =?utf-8?B?NldkWGlrSEN5UVJCWmp1Tk5nbUl1OVFsTG9JSExaQXlseXdNR2s0Z2NveVFI?=
 =?utf-8?B?SmY4ano2b1ZBM0tGVkFwT1hkUGxNQitWUnQ1Q25EK1V1V1BWSmpzcFM0VnBr?=
 =?utf-8?B?U3ZlN0xVWko1T2d3YjhObFV4aFEwWkRWRTJzc2ZNR1NNQndXclJVb3dvUDJo?=
 =?utf-8?B?MS96N1J5VzlrSHloQnhnRmtOV3pic1dwc3BFeG5oYkI5OFc4NjRGcUxWYTZa?=
 =?utf-8?B?d2JyZGsxN3I1Mkt0TVI3QW5Dc2s0WHpnY3kyb1E3YzJYZGVYbTlMMll2SG1I?=
 =?utf-8?B?VXVBdy94Y3N0QjFXOGlwN0hXODJrZ05sWUdnRzNZYWlTR2pUeGlISHlVSFpI?=
 =?utf-8?B?TjlWQm8xRFZOeHE0ais5MjF1eUVRcGtNemVNVmFEblc1bEtVOVVSeXlaQjF3?=
 =?utf-8?B?WnkyTTRaaHN4MmdwNDcyODl5Z0V6QURIeGFWdkU0ZzFIdHp3bzBsSjYxZ0FP?=
 =?utf-8?B?cURCUVo3WjhrcW9FYXprMFBYODNPZTB2OHZCZGg0RE11UndUTlhJMXBZTHFI?=
 =?utf-8?B?cUM4aFF2VG5iWDRVTDlmUDZpL2VLL3NTLzAyYVNHeGVmeWUyU2JiRVhDNGd0?=
 =?utf-8?B?L1NFOHhTMWMrRWFLZHlzZlRMR1lhTjhOMUFESTNsKytJU0VKc0JJdlY4VSsz?=
 =?utf-8?B?ajF2M2Q3VWRLd0NzRUhIOGkyTDJhelU1bmJsNmtQVFZEQlZaUlRMb0VtRjNK?=
 =?utf-8?B?TkNTemdJbDVVVDBLMUV6WUYxWGZFZnYySGV1VWl0Nm51SWJaanN5SHNFbUg1?=
 =?utf-8?B?M044THpvcUpZMC9uY3V4MXFLQ0ZJOFdicGFBU3F3NVNHRHAxOCsxTU5xTTk3?=
 =?utf-8?B?VWZaYjIvUnNHTHRDd0pib2sxeVNaanpTeXpSdkQ0aVZmOHlLU1ExTXZwYjBy?=
 =?utf-8?B?MGJQcGdNcldpZjdZbWowV3hqZG9mMGt5YmNaSlVWd0RpMTNGa2E5Mkk4em9Y?=
 =?utf-8?B?VEF5eTFDaU1NNnBSTGw1d1k2cFBacDRUUmpUTXh3RlI5Z3VmbDJ5bVcvZkRC?=
 =?utf-8?B?RVliSldqQjE5MFFTZjdPNDFlRzJvSGo5c0hmdlI1R3V5dHQ1QjRtT01uNHF5?=
 =?utf-8?B?SHd6T1FjeVptaEtLTmJQRStTMWJ0MWZMYk5zWVZwV3ArbFNaZlZrUkdzNU1R?=
 =?utf-8?B?YzJxUkh2azEwZFFDdGV2azZQMFlqZFFRRWVyUDdGcmdoSEJWSkNBQTBMSk9D?=
 =?utf-8?B?bW9QZ0drQ0RNaW9nUnZmVm85akI5a3BQUUlPRVNCc293MlA3NVlKdzlwK3ZC?=
 =?utf-8?B?SnJWVkVNUW5qa0RpWUxqa2E3Z0YwSXQzc0hmbWVmWmVNM3FYT1FMU0RuUHNE?=
 =?utf-8?B?emNrSFRiUlV4aE04MmlOemJkRmZUMjVzUEExN3VqL0pQOTV6cmRydFZWTlZU?=
 =?utf-8?B?YUE9PQ==?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46a1dd6b-57ae-49d0-0dd9-08db706c1b5f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 02:23:02.2115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 19UFpwm+cAx1XhISoVcioXX/1EvAMM9ZGquanXXHTbjogMF4DlOn2eR00lxF+NFkxB6knFUX48O6g9PWp/XXdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8424
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
> To protect PMFW from being overloaded.
> 
> Signed-off-by: Evan Quan <evan.quan@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c     | 28 ++++++++++++++++---
>   drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h |  7 +++++
>   2 files changed, 31 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> index 89f876cc60e6..2619e310ef54 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> @@ -1272,6 +1272,22 @@ static void smu_wbrf_event_handler(struct amdgpu_device *adev)
>   {
>   	struct smu_context *smu = adev->powerplay.pp_handle;
>   
> +	schedule_delayed_work(&smu->wbrf_delayed_work,
> +			      msecs_to_jiffies(SMU_WBRF_EVENT_HANDLING_PACE));
> +}
> +
> +/**
> + * smu_wbrf_delayed_work_handler - callback on delayed work timer expired
> + *
> + * @work: struct work_struct pointer
> + *
> + * Flood is over and driver will consume the latest exclusion ranges.
> + */
> +static void smu_wbrf_delayed_work_handler(struct work_struct *work)
> +{
> +	struct smu_context *smu =
> +		container_of(work, struct smu_context, wbrf_delayed_work.work);
> +
>   	smu_wbrf_handle_exclusion_ranges(smu);
>   }
>   
> @@ -1311,6 +1327,9 @@ static int smu_wbrf_init(struct smu_context *smu)
>   	if (!smu->wbrf_supported)
>   		return 0;
>   
> +	INIT_DELAYED_WORK(&smu->wbrf_delayed_work,
> +			  smu_wbrf_delayed_work_handler);
> +
>   	ret = amdgpu_acpi_register_wbrf_notify_handler(adev,
>   						       smu_wbrf_event_handler);
>   	if (ret)
> @@ -1321,11 +1340,10 @@ static int smu_wbrf_init(struct smu_context *smu)
>   	 * before our driver loaded. To make sure our driver
>   	 * is awared of those exclusion ranges.
>   	 */
> -	ret = smu_wbrf_handle_exclusion_ranges(smu);
> -	if (ret)
> -		dev_err(adev->dev, "Failed to handle wbrf exclusion ranges\n");
> +	schedule_delayed_work(&smu->wbrf_delayed_work,
> +			      msecs_to_jiffies(SMU_WBRF_EVENT_HANDLING_PACE));
>   
> -	return ret;
> +	return 0;
>   }
>   
>   /**
> @@ -1343,6 +1361,8 @@ static void smu_wbrf_fini(struct smu_context *smu)
>   		return;
>   
>   	amdgpu_acpi_unregister_wbrf_notify_handler(adev);
> +
> +	cancel_delayed_work_sync(&smu->wbrf_delayed_work);
>   }
>   
>   static int smu_smc_hw_setup(struct smu_context *smu)
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
> index ff0af3da0be2..aa63cc43d41c 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
> +++ b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
> @@ -478,6 +478,12 @@ struct stb_context {
>   
>   #define WORKLOAD_POLICY_MAX 7
>   
> +/*
> + * Configure wbrf event handling pace as there can be only one
> + * event processed every SMU_WBRF_EVENT_HANDLING_PACE ms.
> + */
> +#define SMU_WBRF_EVENT_HANDLING_PACE	10
> +
>   struct smu_context
>   {
>   	struct amdgpu_device            *adev;
> @@ -576,6 +582,7 @@ struct smu_context
>   
>   	/* data structures for wbrf feature support */
>   	bool				wbrf_supported;
> +	struct delayed_work		wbrf_delayed_work;
>   };
>   
>   struct i2c_adapter;

