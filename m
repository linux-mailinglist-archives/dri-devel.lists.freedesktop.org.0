Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5A0788B03
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 16:09:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97D6110E6A3;
	Fri, 25 Aug 2023 14:09:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 257EE10E6A0;
 Fri, 25 Aug 2023 14:09:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AKTgqMsKSUtF5FVXzhcmoYDoa8iCTOZWdVJJ+tPiUV8veE/oMFjUSzh5VuLnEFeqLOyPNjfisxBWMOqd438Dv7WpxYwvKAOC9/uWnUvsNYJp24hkgFK4TJFNhreC5BeAumI+tm69ps3ISBJ74SUmMy6QqhH2cR/r+flhkmXdSGIT8hBDgDaPh5R/cm6XMnR/FGHbSXIQRMbyDMMfm/f6k5xXLE4QObyztP0OvYXy5LAMAcLzGg2JeR08Tvs0Ic97LwO6zYtRIh+Sp1QIH0JXvG4LqpmOfNJaWLoGc44Z1DVUmCINRNCDunATvSCSkQaCkWKS6lrod3CdkQ4MStm1LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mh+8XZRaRgCFIeFaHu7Zltl46ANdrngSRB9lncFfTXI=;
 b=WzN46zlLUv5P3vZYtg22xYqMhpU4LI17/ZpFUlON7Z8I108wODIL00CYGwsmVjm5bzAuEwBj6NDbyLh07OQnJG5O9AJiNg+ED+whXd+DAYv8I7gleLZ6yia0t3M6Hsq/xTHpaDk5vu7WFV+WOrmnucqjOY4A5rhaFExz2cftIzjridaLhRmnXI3gnNZQy/0bo0cyNC7wVkYNYa/adX2aivwLYUimmJslLd4kERSDfr1X4oa3QMWWSd9H6ENIzP6XgNDhw5vdUFH3vYtsYXBZ/Oa8qJ8CeSXWBuVFVUW+3uQb+fd3Q81ccvuw3lXQCGMbRpvpT2aiZzIv9vvipLZN7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mh+8XZRaRgCFIeFaHu7Zltl46ANdrngSRB9lncFfTXI=;
 b=q1ByyV4zgIFrdWtXJSesndxmLG0VyS+Olun1BtMgGrcZRjEBj6glDGaK3jznz7cmVNc/pVx5+LXjrLY2OKuyIdhcnyjNqplfRFhOjHhqeDK093vECNHCLPWTSfoO+9EVtvTZJy71Rc32pI3sp+TXcBp7QmNY7Ua67uGMhSWCGbE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4614.namprd12.prod.outlook.com (2603:10b6:a03:a6::22)
 by PH7PR12MB7428.namprd12.prod.outlook.com (2603:10b6:510:203::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Fri, 25 Aug
 2023 14:09:17 +0000
Received: from BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::af11:a0ea:b4e4:d1e0]) by BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::af11:a0ea:b4e4:d1e0%5]) with mapi id 15.20.6699.028; Fri, 25 Aug 2023
 14:09:17 +0000
Message-ID: <a45c6e51-0dbf-af27-1723-fb1477e6155d@amd.com>
Date: Fri, 25 Aug 2023 19:39:03 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [V10 5/8] drm/amd/pm: setup the framework to support Wifi RFI
 mitigation feature
Content-Language: en-US
To: Evan Quan <evan.quan@amd.com>, lenb@kernel.org,
 johannes@sipsolutions.net, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, alexander.deucher@amd.com,
 rafael@kernel.org, mario.limonciello@amd.com
References: <20230825083846.4001973-1-evan.quan@amd.com>
 <20230825083846.4001973-6-evan.quan@amd.com>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <20230825083846.4001973-6-evan.quan@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0120.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::15) To BYAPR12MB4614.namprd12.prod.outlook.com
 (2603:10b6:a03:a6::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB4614:EE_|PH7PR12MB7428:EE_
X-MS-Office365-Filtering-Correlation-Id: de7f382f-06f1-40e5-5d31-08dba574de8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7+zbppUqbT2IR+hcexwBP/ENR5CJ5g7Xl97GYm3WE1IgV+vSFaYsqdLr5ZbbePLPEZjHmjo+RYho5VkgFwCWswsbPAhE8i39WL4oRDEO4H2mMra0gNLENAq6/lfEB92rpHtzXaZ3u5xXm5f9a3+Fo1pj9rxEFLsXc361BMhyC25pSnXlLEUWnCuJiDR9n/xWaHU5Bp8vCi39xkGY0CWFMWzWRwBMcYcZcKFvlS9+Mmax331whmSrc3PiHoAtcYKl72zrB23Tdzrc7/aH0a3PHDT+f4OB8ZpyNXTRXotsv+A6SI/k0Cyc48+nzFkYPsm6KskXhAGekZG1R0WNWIEI9jdbKzgH4N1/MekF0Ig1tLpAQ8/cDRh/JCZoNij2ggkFaSfxxJlkfcu9bcplyQAF9ZRYLB9f4EwBMa13JbPJ/rfYkkn6l9whNbRzeuCJ3UbiqVGLrbeJxRNoFY87ozqeE0w/QSTB680rvVHELlX3gpbzp3ObNXCD5w/UfZPaXUqpgyWxz1j3NcYybDX7woC6EPPmRDJ2fXrZS3otvAAlTgaM5DZL/U4R2uKi/mfVQWEtP93BECwrx528TY9RapJJWA18OcGPj/FDq1dUzkxDY45QeNoMUmGZBiE7xYnQrxdfYvSAEcrWjq717xR879z+O3SEmkU/i9wtp6qz9okH2AG999xuMryO5QJkCCUN+kAS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4614.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(39860400002)(376002)(136003)(396003)(451199024)(186009)(1800799009)(38100700002)(2906002)(30864003)(7416002)(53546011)(6486002)(5660300002)(83380400001)(26005)(6506007)(31686004)(31696002)(86362001)(8676002)(8936002)(2616005)(4326008)(66946007)(316002)(6512007)(66556008)(66476007)(6636002)(478600001)(921005)(6666004)(36756003)(41300700001)(45980500001)(43740500002)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3RQcDhLNWxIMnZxVTB1aXJJUTRPUnIyWVg1bmZJSXZVd0VoUFU4R3c5Z3N2?=
 =?utf-8?B?UG9WcCtMZkc2ZzlQK1FEdW9NWTFLekExQXkzKzBkSTdMREltcXAzUFN0L3V5?=
 =?utf-8?B?MzkxelhsUkVUMUtEZjFJZElJb0xuQk9PSHR0b2EwQ0djcmY0bWlLbTBNckls?=
 =?utf-8?B?YzZhV2YvTTNBbGN6VzZkalVjK245R1lnUGw0blNPL3lXME1kM0VqM24rYVh1?=
 =?utf-8?B?cStzU0srcytNWGVNc1dBKzRhK28xQTNFTkR3RTZBbTRzYnJyalVjZUFHYVo2?=
 =?utf-8?B?RUhXYnMzUlh6dGRJWnh6R0RESkdWVXZSbVF3V2NDUGtnY1RYT0hhc1hTVEYz?=
 =?utf-8?B?T1hXaHBsRmNYVC85WjJ3Sm1US0VMd05xTmcvL1ZqTjZySTZnQ3B0N2NoVzRD?=
 =?utf-8?B?QlJ0T0FtNFlzT1B6Q2Vmb0lGMnl0RUtMMkxYSG5pYk1XcXBDYzlZazJFTGZr?=
 =?utf-8?B?MWc1dGZuUmRPWHVUOVRnUkhSeUdtN3JXL1VrUlhUT0JkMkhQZGxHOVJ1bFJw?=
 =?utf-8?B?eHpxRUdIUC9uN1BoL1Q4K2pEVklpWTdnb2plT2c0dHJNb3FlSUdlZkloWG5n?=
 =?utf-8?B?am9mdi9SdEUrWGlyeVdndVo2aG51Z0VJdlBZM0ZTUC80RnNwVGk3ejZ2eDRR?=
 =?utf-8?B?ZGtDajh2ekdqQzA3SXZnRmYyeEVqdWlicGlzQ3l1cEVXaFdHNlhOcFZXTEU4?=
 =?utf-8?B?VHpRQ1F1Q1FRdFlvTU9oZHNma2dLZUdoKzFiek4xbjlXMEpWN2s3UnNBM0RH?=
 =?utf-8?B?YnpOTHVYMU1nYzhQekdHSlk2dzFoTXlqRHZ0Y0V1MEtEQVlpRExVcVY3akhG?=
 =?utf-8?B?S1UyOERCR2Qyb3pPZ1BVZmExWWNueTJRY3Rnc05FZ1FWMEFhd0JpbU5hQmwr?=
 =?utf-8?B?NGtOZFdyaHkwVUlBeis0dktNR1VjODR3Wmo0cDZ6SDlueE5pMUZROW5rTEtH?=
 =?utf-8?B?Q3BId0RlRGhUcFYxTTFUd1BWdFZqb0NKeUFmanBRK2pBVGUrTUdPZ2pxVWdG?=
 =?utf-8?B?bGluNDkwSUJvTVh5ZHIvVDJBWUZUaFdqcVVaTUJNMEtwT0FRMzVRbkNrMVp0?=
 =?utf-8?B?S210OE1FN0t1eEZ3MFMvaTVsRzd3WHlyU2hiZ3ozY1NiMUpnL2tPeWZ6bjZy?=
 =?utf-8?B?aVFZeTJPS2w1ZlM4YnFRZENuVmxqS1UyVFYzZVhoNW9hNlMzUmt1aWY1dWdY?=
 =?utf-8?B?WnhJV2ZrU3ZpcThiK011VlJXbGEwMFAvYmdpYVNFWk5KcEkyM3JlUjE2blQ5?=
 =?utf-8?B?cEZGdVQvWTc0endWVjNTczlrSUl1QjhrU0JvVXVOdW8vMERVdUw3bmErQWQ4?=
 =?utf-8?B?T0QveFRYVTJxTXNnVVI0UnBFak9JZUlUY292NGNCR1NQMkJCbDg2bUdBNkI4?=
 =?utf-8?B?MmszRGc1ZUc5bVJUM3lidTgzWkZXRmR1QlhXbDR0QnpvcmpHVVgvbW5YNVc0?=
 =?utf-8?B?Uk4zQktHaS9UWjV0UXpRQUxaeGtaUDB4bUNWWDdrSk81Q01YSDF0SVNidGxk?=
 =?utf-8?B?T0VTTzJkMFRPR2tWanMvL3AyUkJwc0FScTh2ZTlYWVhIZ0JhMFpjUVh2T1Zo?=
 =?utf-8?B?WnEwZ2p1SG1tbzM0eGgvanNKZzNpeHJXNHcxOVVVcnFGQUluWVFmbG5RWi8y?=
 =?utf-8?B?cWNPa3pXTmRxNkZQUVRiMG1JVjJwK3hlMVpPZU9mb1psc1NDMnB4RjFLWXpu?=
 =?utf-8?B?T0tLR0x0UzhxZUQrKzdXd2s1ZUd4clpNUlVuMTJLb3RQeGFkNExlbVNpbFVR?=
 =?utf-8?B?SUdoMkUxZGY3aWlJcnRFWDU1cDAyR3BKSmtRU3U3c25wekNrcmw5ZjdEc205?=
 =?utf-8?B?VnRjRHFKQTdNdGUxTndDai9oT1huYjFwSHNnSmZKaStLMFVpOTBXMlJPcnM4?=
 =?utf-8?B?V3pZYzVQQnpyODlBZS93S0JnaDRNVjh3V2lteWYyOUsySHRyRmNDQkRGSkYx?=
 =?utf-8?B?REtWbkg1ODRhZDJ1L21zUDFab3dLaUdCTnpBU01Ha1dhdU0ycFp0ajMzZUh4?=
 =?utf-8?B?a2hoR3ZndUlqS3c2VXNHeG10WThDTzNXNzBwS28zUW9VYWtZakhXQTl6RzZ3?=
 =?utf-8?B?MVdrUm94MlJPL3JRbHVQaUE0N2E3eTFhK3NHdDB0RnlnakZCczJoOGwvUm9y?=
 =?utf-8?Q?cq/tv65RykalUCeRURlu7dAfI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de7f382f-06f1-40e5-5d31-08dba574de8d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 14:09:17.6397 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qXVMiSNySvbUR3yVOnojpOMOwyxBd/AJZzM/jGTOiMTSZqv7LAP5hPMjxlTVgIjQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7428
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/25/2023 2:08 PM, Evan Quan wrote:
> With WBRF feature supported, as a driver responding to the frequencies,
> amdgpu driver is able to do shadow pstate switching to mitigate possible
> interference(between its (G-)DDR memory clocks and local radio module
> frequency bands used by Wifi 6/6e/7).
> 
> Signed-off-by: Evan Quan <evan.quan@amd.com>
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> --
> v1->v2:
>    - update the prompt for feature support(Lijo)
> v8->v9:
>    - update parameter document for smu_wbrf_event_handler(Simon)
> v9->v10:
>   - correct the logics for wbrf range sorting(Lijo)
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   2 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  17 ++
>   drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c     | 195 ++++++++++++++++++
>   drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h |  23 +++
>   drivers/gpu/drm/amd/pm/swsmu/smu_internal.h   |   3 +
>   5 files changed, 240 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index a3b86b86dc47..2bfc9111ab00 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -247,6 +247,8 @@ extern int amdgpu_sg_display;
>   
>   extern int amdgpu_user_partt_mode;
>   
> +extern int amdgpu_wbrf;
> +
>   #define AMDGPU_VM_MAX_NUM_CTX			4096
>   #define AMDGPU_SG_THRESHOLD			(256*1024*1024)
>   #define AMDGPU_WAIT_IDLE_TIMEOUT_IN_MS	        3000
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 0593ef8fe0a6..1c574bd3b60d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -195,6 +195,7 @@ int amdgpu_use_xgmi_p2p = 1;
>   int amdgpu_vcnfw_log;
>   int amdgpu_sg_display = -1; /* auto */
>   int amdgpu_user_partt_mode = AMDGPU_AUTO_COMPUTE_PARTITION_MODE;
> +int amdgpu_wbrf = -1;
>   
>   static void amdgpu_drv_delayed_reset_work_handler(struct work_struct *work);
>   
> @@ -981,6 +982,22 @@ module_param_named(user_partt_mode, amdgpu_user_partt_mode, uint, 0444);
>   module_param(enforce_isolation, bool, 0444);
>   MODULE_PARM_DESC(enforce_isolation, "enforce process isolation between graphics and compute . enforce_isolation = on");
>   
> +/**
> + * DOC: wbrf (int)
> + * Enable Wifi RFI interference mitigation feature.
> + * Due to electrical and mechanical constraints there may be likely interference of
> + * relatively high-powered harmonics of the (G-)DDR memory clocks with local radio
> + * module frequency bands used by Wifi 6/6e/7. To mitigate the possible RFI interference,
> + * with this feature enabled, PMFW will use either “shadowed P-State” or “P-State” based
> + * on active list of frequencies in-use (to be avoided) as part of initial setting or
> + * P-state transition. However, there may be potential performance impact with this
> + * feature enabled.
> + * (0 = disabled, 1 = enabled, -1 = auto (default setting, will be enabled if supported))
> + */
> +MODULE_PARM_DESC(wbrf,
> +	"Enable Wifi RFI interference mitigation (0 = disabled, 1 = enabled, -1 = auto(default)");
> +module_param_named(wbrf, amdgpu_wbrf, int, 0444);
> +
>   /* These devices are not supported by amdgpu.
>    * They are supported by the mach64, r128, radeon drivers
>    */
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> index ce41a8309582..bdfd234d1558 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> @@ -1228,6 +1228,174 @@ static int smu_get_thermal_temperature_range(struct smu_context *smu)
>   	return ret;
>   }
>   
> +/**
> + * smu_wbrf_handle_exclusion_ranges - consume the wbrf exclusion ranges
> + *
> + * @smu: smu_context pointer
> + *
> + * Retrieve the wbrf exclusion ranges and send them to PMFW for proper handling.
> + * Returns 0 on success, error on failure.
> + */
> +static int smu_wbrf_handle_exclusion_ranges(struct smu_context *smu)
> +{
> +	struct wbrf_ranges_in_out wbrf_exclusion = {0};
> +	struct exclusion_range *wifi_bands = wbrf_exclusion.band_list;
> +	struct amdgpu_device *adev = smu->adev;
> +	uint32_t num_of_wbrf_ranges = MAX_NUM_OF_WBRF_RANGES;
> +	uint64_t start, end;
> +	int ret, i, j;
> +
> +	ret = acpi_amd_wbrf_retrieve_exclusions(adev->dev, &wbrf_exclusion);
> +	if (ret) {
> +		dev_err(adev->dev, "Failed to retrieve exclusion ranges!\n");
> +		return ret;
> +	}
> +
> +	/*
> +	 * The exclusion ranges array we got might be filled with holes and duplicate
> +	 * entries. For example:
> +	 * {(2400, 2500), (0, 0), (6882, 6962), (2400, 2500), (0, 0), (6117, 6189), (0, 0)...}
> +	 * We need to do some sortups to eliminate those holes and duplicate entries.
> +	 * Expected output: {(2400, 2500), (6117, 6189), (6882, 6962), (0, 0)...}
> +	 */
> +	for (i = 0; i < num_of_wbrf_ranges; i++) {
> +		start = wifi_bands[i].start;
> +		end = wifi_bands[i].end;
> +
> +		/* get the last valid entry to fill the intermediate hole */
> +		if (!start && !end) {
> +			for (j = num_of_wbrf_ranges - 1; j > i; j--)
> +				if (wifi_bands[j].start &&
> +				    wifi_bands[j].end)
> +					break;
> +
> +			/* no valid entry left */
> +			if (j <= i)
> +				break;
> +
> +			wifi_bands[i].start = wifi_bands[j].start;
> +			wifi_bands[i].end = wifi_bands[j].end;

start/end variables remain 0. Thus it won't have any effect on the loop 
below which looks for duplicates. start/end need to be reassigned here.

> +			wifi_bands[j].start = 0;
> +			wifi_bands[j].end = 0;
> +			num_of_wbrf_ranges--;

Instead of decrementing by 1, this can be kept equal to j - 1 as jth 
entry is 0 now.

Thanks,
Lijo

> +		}
> +
> +		/* eliminate duplicate entries */
> +		for (j = i + 1; j < num_of_wbrf_ranges; j++) {
> +			if ((wifi_bands[j].start == start) &&
> +			     (wifi_bands[j].end == end)) {
> +				wifi_bands[j].start = 0;
> +				wifi_bands[j].end = 0;
> +			}
> +		}
> +	}
> +
> +	/* Send the sorted wifi_bands to PMFW */
> +	ret = smu_set_wbrf_exclusion_ranges(smu, wifi_bands);
> +	/* Give it another chance */
> +	if (unlikely(ret == -EBUSY)) {
> +		mdelay(5);
> +		ret = smu_set_wbrf_exclusion_ranges(smu, wifi_bands);
> +	}
> +
> +	return ret;
> +}
> +
> +/**
> + * smu_wbrf_event_handler - handle notify events
> + *
> + * @nb: notifier block
> + * @action: event type
> + * @_arg: event data
> + *
> + * Calls relevant amdgpu function in response to wbrf event
> + * notification from kernel.
> + */
> +static int smu_wbrf_event_handler(struct notifier_block *nb,
> +				  unsigned long action, void *_arg)
> +{
> +	struct smu_context *smu = container_of(nb, struct smu_context,
> +					       wbrf_notifier);
> +
> +	switch (action) {
> +	case WBRF_CHANGED:
> +		smu_wbrf_handle_exclusion_ranges(smu);
> +		break;
> +	default:
> +		return NOTIFY_DONE;
> +	};
> +
> +	return NOTIFY_OK;
> +}
> +
> +/**
> + * smu_wbrf_support_check - check wbrf support
> + *
> + * @smu: smu_context pointer
> + *
> + * Verifies the ACPI interface whether wbrf is supported.
> + */
> +static void smu_wbrf_support_check(struct smu_context *smu)
> +{
> +	struct amdgpu_device *adev = smu->adev;
> +
> +	smu->wbrf_supported = smu_is_asic_wbrf_supported(smu) &&
> +			      !!amdgpu_wbrf &&
> +			      acpi_amd_wbrf_supported_consumer(adev->dev);
> +
> +	if (smu->wbrf_supported)
> +		dev_info(adev->dev, "RF interference mitigation is supported\n");
> +}
> +
> +/**
> + * smu_wbrf_init - init driver wbrf support
> + *
> + * @smu: smu_context pointer
> + *
> + * Verifies the AMD ACPI interfaces and registers with the wbrf
> + * notifier chain if wbrf feature is supported.
> + * Returns 0 on success, error on failure.
> + */
> +static int smu_wbrf_init(struct smu_context *smu)
> +{
> +	struct amdgpu_device *adev = smu->adev;
> +	int ret;
> +
> +	if (!smu->wbrf_supported)
> +		return 0;
> +
> +	smu->wbrf_notifier.notifier_call = smu_wbrf_event_handler;
> +	ret = acpi_amd_wbrf_register_notifier(&smu->wbrf_notifier);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Some wifiband exclusion ranges may be already there
> +	 * before our driver loaded. To make sure our driver
> +	 * is awared of those exclusion ranges.
> +	 */
> +	ret = smu_wbrf_handle_exclusion_ranges(smu);
> +	if (ret)
> +		dev_err(adev->dev, "Failed to handle wbrf exclusion ranges\n");
> +
> +	return ret;
> +}
> +
> +/**
> + * smu_wbrf_fini - tear down driver wbrf support
> + *
> + * @smu: smu_context pointer
> + *
> + * Unregisters with the wbrf notifier chain.
> + */
> +static void smu_wbrf_fini(struct smu_context *smu)
> +{
> +	if (!smu->wbrf_supported)
> +		return;
> +
> +	acpi_amd_wbrf_unregister_notifier(&smu->wbrf_notifier);
> +}
> +
>   static int smu_smc_hw_setup(struct smu_context *smu)
>   {
>   	struct smu_feature *feature = &smu->smu_feature;
> @@ -1320,6 +1488,15 @@ static int smu_smc_hw_setup(struct smu_context *smu)
>   	if (ret)
>   		return ret;
>   
> +	/* Enable UclkShadow on wbrf supported */
> +	if (smu->wbrf_supported) {
> +		ret = smu_enable_uclk_shadow(smu, true);
> +		if (ret) {
> +			dev_err(adev->dev, "Failed to enable UclkShadow feature to support wbrf!\n");
> +			return ret;
> +		}
> +	}
> +
>   	/*
>   	 * With SCPM enabled, these actions(and relevant messages) are
>   	 * not needed and permitted.
> @@ -1416,6 +1593,15 @@ static int smu_smc_hw_setup(struct smu_context *smu)
>   	 */
>   	ret = smu_set_min_dcef_deep_sleep(smu,
>   					  smu->smu_table.boot_values.dcefclk / 100);
> +	if (ret) {
> +		dev_err(adev->dev, "Error setting min deepsleep dcefclk\n");
> +		return ret;
> +	}
> +
> +	/* Init wbrf support. Properly setup the notifier */
> +	ret = smu_wbrf_init(smu);
> +	if (ret)
> +		dev_err(adev->dev, "Error during wbrf init call\n");
>   
>   	return ret;
>   }
> @@ -1471,6 +1657,13 @@ static int smu_hw_init(void *handle)
>   		return ret;
>   	}
>   
> +	/*
> +	 * Check whether wbrf is supported. This needs to be done
> +	 * before SMU setup starts since part of SMU configuration
> +	 * relies on this.
> +	 */
> +	smu_wbrf_support_check(smu);
> +
>   	if (smu->is_apu) {
>   		ret = smu_set_gfx_imu_enable(smu);
>   		if (ret)
> @@ -1623,6 +1816,8 @@ static int smu_smc_hw_cleanup(struct smu_context *smu)
>   	struct amdgpu_device *adev = smu->adev;
>   	int ret = 0;
>   
> +	smu_wbrf_fini(smu);
> +
>   	cancel_work_sync(&smu->throttling_logging_work);
>   	cancel_work_sync(&smu->interrupt_work);
>   
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
> index 6e2069dcb6b9..3eb1c72a76f1 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
> +++ b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
> @@ -22,6 +22,8 @@
>   #ifndef __AMDGPU_SMU_H__
>   #define __AMDGPU_SMU_H__
>   
> +#include <linux/acpi_amd_wbrf.h>
> +
>   #include "amdgpu.h"
>   #include "kgd_pp_interface.h"
>   #include "dm_pp_interface.h"
> @@ -575,6 +577,10 @@ struct smu_context
>   	u32 debug_resp_reg;
>   
>   	struct delayed_work		swctf_delayed_work;
> +
> +	/* data structures for wbrf feature support */
> +	bool				wbrf_supported;
> +	struct notifier_block		wbrf_notifier;
>   };
>   
>   struct i2c_adapter;
> @@ -1356,6 +1362,23 @@ struct pptable_funcs {
>   	 * @init_pptable_microcode: Prepare the pptable microcode to upload via PSP
>   	 */
>   	int (*init_pptable_microcode)(struct smu_context *smu);
> +
> +	/**
> +	 * @is_asic_wbrf_supported: check whether PMFW supports the wbrf feature
> +	 */
> +	bool (*is_asic_wbrf_supported)(struct smu_context *smu);
> +
> +	/**
> +	 * @enable_uclk_shadow: Enable the uclk shadow feature on wbrf supported
> +	 */
> +	int (*enable_uclk_shadow)(struct smu_context *smu,
> +				  bool enablement);
> +
> +	/**
> +	 * @set_wbrf_exclusion_ranges: notify SMU the wifi bands occupied
> +	 */
> +	int (*set_wbrf_exclusion_ranges)(struct smu_context *smu,
> +					 struct exclusion_range *exclusion_ranges);
>   };
>   
>   typedef enum {
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu_internal.h b/drivers/gpu/drm/amd/pm/swsmu/smu_internal.h
> index ceb13c838067..67d7495ab49e 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu_internal.h
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu_internal.h
> @@ -97,6 +97,9 @@
>   #define smu_get_default_config_table_settings(smu, config_table)	smu_ppt_funcs(get_default_config_table_settings, -EOPNOTSUPP, smu, config_table)
>   #define smu_set_config_table(smu, config_table)				smu_ppt_funcs(set_config_table, -EOPNOTSUPP, smu, config_table)
>   #define smu_init_pptable_microcode(smu)					smu_ppt_funcs(init_pptable_microcode, 0, smu)
> +#define smu_is_asic_wbrf_supported(smu)					smu_ppt_funcs(is_asic_wbrf_supported, false, smu)
> +#define smu_enable_uclk_shadow(smu, enablement)				smu_ppt_funcs(enable_uclk_shadow, 0, smu, enablement)
> +#define smu_set_wbrf_exclusion_ranges(smu, exclusion_ranges)		smu_ppt_funcs(set_wbrf_exclusion_ranges, -EOPNOTSUPP, smu, exclusion_ranges)
>   
>   #endif
>   #endif
