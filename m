Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C47EB511BD5
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 17:22:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2546910F59F;
	Wed, 27 Apr 2022 15:22:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2068.outbound.protection.outlook.com [40.107.243.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88B1910F59F;
 Wed, 27 Apr 2022 15:21:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hgqBAcd3+IGbszu6GXr9t+Hev+dC9J3DEpC4bjmXFkpeqQB3NtjvqAH8NBG9G2qWoUAngG0Vm+50rb1cwwCNg3WEwKgaf+9BwGuSI1TmZ2sS709xQis2tTM8PvLOzNfFZNSUO6I3U/8/6BQVRx8+Uwi1qTl54et4Zoh6/FpRnD6eOHX/haodv743k8WGml7+kG6pP72Cl+QXSjTUQ4k/1U2B4DeDHxMKfLgFenLUybRTvsmkhWHN8vjQTxoXhmV/z3Ffig7f33iVZnjOalumfo3o3SgBwZIXc4ygKZe0Wqcmk5P+pGC0LebMozccbKp/QNGxWhRhBkSDS8sYHIfzJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MS6bjCDe6CuEB1U1SQ8kkjTv4g2ATyQtp+yY1/MBAeQ=;
 b=B6svgXlpiWNNBp2ChNJF1/4y18livkBNZBNPEbVBBEANDkb0a8PNXMIU7HVLWbuTBtWhDR+IHxu5z3gTRfc3nRqK4FcgKF1cMZRerDBLTNQbEvjmFYL0BBIFZA+tFI/uaRAiwg5fl7dZTSAbkJc+U0DC91no9+5mlbuxT3DpUBEBMUJvioegDGEm/FzCOgNGoMYhPIOjiPYrqumUpR313Wu9vEY8WkNm9kQmWmRpFS3CIERAVkuMNZJ5EDBNXZVDdTI58e+8F3rz5vL5mJO55HML+ZyxlqXfiUxGwbGlOKHLYe9Xl6UXxYN91MCWWAum8qqDKB5a5Op+aJrqDf4zKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MS6bjCDe6CuEB1U1SQ8kkjTv4g2ATyQtp+yY1/MBAeQ=;
 b=auNU73gVcD/PBNE6pW68A0c4fYh2HZsqIcsUS9ENpkP4ZcG7IC9GC9U8oxr8Au59EaYCjDjx6tHgzAnLy+VScbuPpw+kOVZb8j+d3ylmDFT1RJzUAKcCcyxHzMQjUfZoEJ9P4Q91OIRs2DZf/4V72FFzYc015h0iuU6Wmo0gonQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5438.namprd12.prod.outlook.com (2603:10b6:a03:3ba::23)
 by BN8PR12MB3315.namprd12.prod.outlook.com (2603:10b6:408:41::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 27 Apr
 2022 15:21:53 +0000
Received: from SJ0PR12MB5438.namprd12.prod.outlook.com
 ([fe80::9181:b3c9:478c:751c]) by SJ0PR12MB5438.namprd12.prod.outlook.com
 ([fe80::9181:b3c9:478c:751c%7]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 15:21:53 +0000
Message-ID: <fe946a4d-c427-a13a-b1a3-df8ae37cb554@amd.com>
Date: Wed, 27 Apr 2022 11:21:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4] drm/amdgpu: Disable ABM when AC mode
Content-Language: en-US
To: Ryan Lin <tsung-hua.lin@amd.com>, leon.li@amd.com, ching-shih.li@amd.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, sunpeng.li@amd.com,
 seanpaul@chromium.org, Pratik.Vishwakarma@amd.com, lijo.lazar@amd.com,
 sathishkumar.sundararaju@amd.com, rdunlap@infradead.org,
 linux-patches-robot@chromeos-missing-patches.google.com.iam.gserviceaccount.com,
 Hawking.Zhang@amd.com, andrey.grodzovsky@amd.com, shaoyun.liu@amd.com,
 Jack.Zhang1@amd.com, horace.chen@amd.com, haonan.wang2@amd.com,
 Anthony.Koo@amd.com, qingqing.zhuo@amd.com, wyatt.wood@amd.com,
 robin.chen@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20220324231000.4072275-1-tsung-hua.lin@amd.com>
 <20220427080802.1687117-1-tsung-hua.lin@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20220427080802.1687117-1-tsung-hua.lin@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0348.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6b::25) To SJ0PR12MB5438.namprd12.prod.outlook.com
 (2603:10b6:a03:3ba::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 837f82fe-6cc8-4412-2615-08da2861a8b0
X-MS-TrafficTypeDiagnostic: BN8PR12MB3315:EE_
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-Microsoft-Antispam-PRVS: <BN8PR12MB3315E7EF10F2188CE5171B088CFA9@BN8PR12MB3315.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m2lxUoG5qkejfEM/iLhy3P80g5P/N402kjhHjz2G17Un/EQ674U8kQ/kEI3Q99aOYsj7VYWJWmkiwmGSrqQBE3pSzJhxg0IgC5tzKCvCWNVCwFbo1MyqzI1ZS2cYR2NOgXyVV6k28xYeG0n8GOv7H+q/ngIgEYjDYodO+oJ0IP5B048dbfF90ELsM3xbThRlfRM0zKcRdiGntPhHjg7xlJfW8r2qbWCXVOPTVbPRkCSZZMWeOefEVJm16tIUeatykmk/yUFh60n+HYmlYTCkb/2byMe39S1Rz5EHeFzfWSfh8PSLcbfXro8MRlzfHVH7c600DJLaSYe2jyQdbSXEE0blAFW95RsTD3CCOGblBD+wYoQ2sXrlw+JWuT0XE2Yc/ZRch03E3mM5xKlfXaO0hRkUbERV01voFWAoDQEqG30RecCiKUtnkusItK619VuEkZ66l3LVTHCiWfF2EH22+81+OAd1/i+XHEtz1vTqjIPa2Kv478vkd8Q+ycekxeWufxSc4wKpIY/b9poY36ZwMY63T2PPFTA8GF94bpU0cdqWYZQXoPdkoNeGT1sfYJczdBd2phPozMu+yLDKcinuJCvco6dRwi0h4EixXd8e+wUWapuANLy73hGjBv/DsKRUWXSVV7M+HC7DU7Kq+TDoGf83g0nqH4dMn63SOlcjfsueV353uuW45NbLEPPGbjtOBaLfUPeEtYrpUP2n10jlxnMfn+7noJl0piE2McTEj1N90GWzws9esSt1hpkrXS8A
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5438.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(44832011)(6486002)(2616005)(6506007)(8936002)(5660300002)(53546011)(186003)(31686004)(83380400001)(921005)(86362001)(26005)(38100700002)(31696002)(6512007)(6666004)(8676002)(508600001)(66556008)(2906002)(66946007)(66476007)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHZ1cklVOTBCTTdFaHFGQmVWNUNCYUFDNEJYL0xqMDZZQis2anVpaE5IV2NG?=
 =?utf-8?B?SGl5T0JOeUVMb1dkbS93MVE0L0FmVjV0c2pmcEZ4RkdpNlF5Z3ZqUWFBWFh1?=
 =?utf-8?B?d0o3bmRXUjcwMzZXN0Q0R2ljZHRnY0hqTjhtWXV1UTIwMG9jVURCNnM4eE8v?=
 =?utf-8?B?c2x6SCt0YjZDOHVtWTNTTnR6Zld2eFNtWWpWMktYR1hvdDNOU2pkOEFycjFT?=
 =?utf-8?B?M045azRtbFFYUlNoanp0YlBtVWRHQTlNOENaTEZXYTUvbXNGZU1RMkNwQ0xk?=
 =?utf-8?B?bWJDTUVIbFBnMnRqZW1aUjBST3E4c1RXUVIwdkpFU3BoTGhxZDRPRVIrL2dx?=
 =?utf-8?B?MXNUejdwZlF6WHNGNFVoVnRrVklnL3VFT0ZjSCtqWDczT29sdTZEam1pRkJW?=
 =?utf-8?B?MElSVXR2WGpGQTRFeEFQaG5lYVh4SEFCNnhkNnB3OGVuTnNleHNNTUdnZTRv?=
 =?utf-8?B?LzNIZllrR3ZLb0ROS2NpNG1PLzZUYTRXbXg5K2c3TmQ3U1VLdzNKN2tqZ1M0?=
 =?utf-8?B?RDFxNTR0NGpVY0RDd0s3Tlk5R05jN0lCcTZyT1pCbytVaGM4RE5Bd3NRNGlM?=
 =?utf-8?B?emVENjBuVkxlT2lCTFcrVjhESGpHL2F3UC9JaVZsVUxSV2R6TW5pTW0vN2Nu?=
 =?utf-8?B?UG1jVkdEZGhrVENjbm83Y0lPVSszdFhPem1vUWFxY2dPMFFBQjUwOTg5cGE2?=
 =?utf-8?B?RkVmdW91alUzeWRzQ1dGdnhwakg1RXo3T1NMUFhGUzRwVDNXdmlLZEZaSFhR?=
 =?utf-8?B?bHBJTGM0YlYwNmhSRytuckF2eGl1dGEyOGNEaHJDa3U1bmJRSEwzUmtNVXV6?=
 =?utf-8?B?akZLVUtlTHpNM1VtMll6MHlxMlY0OUNmYXdvaGliOE5lbGlsSzdpQ2l0YjBL?=
 =?utf-8?B?WmZ5dnhtOVZPREN0bzM0UjhwR1lBV0hBckVXeTZHempadmFnU1Fjd0lUYUVY?=
 =?utf-8?B?bXRyQ2NjUlF4aUhZQXZoTlRhNlBxUEdER2NFWFNaQ21UR2wwZ3lzbkFrWkJO?=
 =?utf-8?B?ZFZFdUgrU21wTFF4Q0tuUmhxSUtUaXYxQ0Q4ZDlaU2JKMVhyWGtzVzA5V25G?=
 =?utf-8?B?SHJqY0ZRalI1bC9ZSFZOQmFDU2ZLeEFhNjJwMHJrV2EyUXJ5c21XeDlvZTIr?=
 =?utf-8?B?V2xzRVQ1Sm9zNDdReGgzSXVaRXpQS3NwakNQZ0xPSzI3bG5sZ25pK0RlVmh6?=
 =?utf-8?B?WmFGM0lBdGdZblQyQmRVNnV2K0RUZHdMVWFVRlUwK29CdzI3TitwdlZnMEdo?=
 =?utf-8?B?Q0FUK3RpS3p1S2JrRWN0M3NnTmgwK1p4dkt5dWhKbGFPVzd6MjVOalNETDlu?=
 =?utf-8?B?OVFyQkdWNXh1cnJCQjQ2RitWOGM4cHRzTUw1bVNXcjgxb2ZRY25kQ2ZOdjdX?=
 =?utf-8?B?VXlBUTFrWDZYaWVETWJySGxuRUp2UG9pWmpRWWRLdTUzdmg1Q2dkakVRWHYx?=
 =?utf-8?B?VFlBUXRkN0Q4KzdQamVnZXgxSjRkL2V3dERlb1lNSmV1TkFobEZtTEd5Uy9r?=
 =?utf-8?B?emY5bEdCQUJBV0RtdTVvczl4TEVuUlM0Zm00N0ExdDg5eDZKQVZhcWlZZzla?=
 =?utf-8?B?RHNpSVY0eWVoTkV4YzRNZ0V5ZTUxUHVYSE51SGJqbnY0eHY0WmU1eUhKVGI4?=
 =?utf-8?B?Rm1rL2V2aWo2VWhvenpNSFUvZG5DOWk5K2VPRlVzQkdrQVlWQUp0ZGdVbXFj?=
 =?utf-8?B?RGRYVDlNb0RNem8rbEM1b3FiOGJwdkNXMnQyMmtwaCtkc0NpSHJHTVhyTkJS?=
 =?utf-8?B?RnYxblRsOTNidEZqbjRwQ0ZhRTB1c1dWYnBvcThFbDk3bE8zYWxTM1VIWWxE?=
 =?utf-8?B?Sk42V0Zsd3prcXo0aDF5Vk1JV0VQNHh2bzdqT2doYmhtKzJweFhUc0dhMXYr?=
 =?utf-8?B?WG5ZYXZMVlp6c3RFMDRiZGRTUUM5KzBwZFdLSEJUcktGM1NuZ09YN3lWblQz?=
 =?utf-8?B?eGZFczB3ZDJaakpmRTFjU294Y0NkVVQ2bTB0VWhqOEZXVmlVc2dSOUsxTEo2?=
 =?utf-8?B?LzlPVTVnb3NNL0FCNm1VcGFyVWFpRFFlckczZHh3NEFSMDEyZ3owK2prZm5P?=
 =?utf-8?B?Vk5FeG9ZSElPQkVkUEFLOVd4UURoWVhJb0dwQzBGMytaWmhKSU5VdTBtUUl3?=
 =?utf-8?B?YlU3UUxTQlpOZmYvMmpyK1ZITnducFQ5Yk9DOVkrMW5mTSt3OTdHcDJ3clJW?=
 =?utf-8?B?bUdVamh2N0RkTHBUc2lROXd0TUljQUw2MEg1Vk9vcTJMcENjbGYvREZRQld4?=
 =?utf-8?B?bWFWOTYzYU8yUzNPZGZMVkgxL1NMNEpMQTR3RXBMdkt6NVhwOVpUYjdwL3dl?=
 =?utf-8?B?YVVxQzBBdlJqWHlpeVBpRmUyZmVwU3JhVm0rZERkL0M5QXhobXFldz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 837f82fe-6cc8-4412-2615-08da2861a8b0
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5438.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 15:21:53.6369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KnZRfkrUPhPltaTaxX57hSZBnzA6YqBTN9BwKG3yNQGYDaagRsBrq8Kq8n7wpeRqlkBC0uX3acymUhdWgxxJgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3315
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



On 2022-04-27 04:08, Ryan Lin wrote:
> Disable ABM feature when the system is running on AC mode to get the more
> perfect contrast of the display.
> 
> v2: remove "UPSTREAM" from the subject.
> 
> v3: adv->pm.ac_power updating by amd gpu_acpi_event_handler.
> 
> V4: Add the file I lost to fix the build error.
> 
> Signed-off-by: Ryan Lin <tsung-hua.lin@amd.com>
> 
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c      |  3 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  1 +
>   drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c | 61 +++++++++++--------
>   drivers/gpu/drm/amd/include/amd_acpi.h        |  1 +
>   drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h       |  1 +
>   5 files changed, 42 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> index 4811b0faafd9a..6ac331ee4255d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> @@ -822,7 +822,8 @@ static int amdgpu_acpi_event(struct notifier_block *nb,
>   	struct amdgpu_device *adev = container_of(nb, struct amdgpu_device, acpi_nb);
>   	struct acpi_bus_event *entry = (struct acpi_bus_event *)data;
>   
> -	if (strcmp(entry->device_class, ACPI_AC_CLASS) == 0) {
> +	if (strcmp(entry->device_class, ACPI_AC_CLASS) == 0 ||
> +	    strcmp(entry->device_class, ACPI_BATTERY_CLASS) == 0) {
>   		if (power_supply_is_system_supplied() > 0)
>   			DRM_DEBUG_DRIVER("pm: AC\n");
>   		else
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index abfcc1304ba0c..3a0afe7602727 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -3454,6 +3454,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>   
>   	adev->gfx.gfx_off_req_count = 1;
>   	adev->pm.ac_power = power_supply_is_system_supplied() > 0;
> +	adev->pm.old_ac_power = true;
>   
>   	atomic_set(&adev->throttling_logging_enabled, 1);
>   	/*
> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c b/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c
> index 54a1408c8015c..090bd23410b45 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c
> @@ -22,7 +22,8 @@
>    * Authors: AMD
>    *
>    */
> -
> +#include <linux/power_supply.h>
> +#include "amdgpu.h"
>   #include "dmub_abm.h"
>   #include "dce_abm.h"
>   #include "dc.h"
> @@ -50,7 +51,7 @@
>   
>   #define DISABLE_ABM_IMMEDIATELY 255
>   
> -
> +extern uint amdgpu_dm_abm_level;
>   
>   static void dmub_abm_enable_fractional_pwm(struct dc_context *dc)
>   {
> @@ -117,28 +118,6 @@ static void dmub_abm_init(struct abm *abm, uint32_t backlight)
>   	dmub_abm_enable_fractional_pwm(abm->ctx);
>   }
>   
> -static unsigned int dmub_abm_get_current_backlight(struct abm *abm)
> -{
> -	struct dce_abm *dce_abm = TO_DMUB_ABM(abm);
> -	unsigned int backlight = REG_READ(BL1_PWM_CURRENT_ABM_LEVEL);
> -
> -	/* return backlight in hardware format which is unsigned 17 bits, with
> -	 * 1 bit integer and 16 bit fractional
> -	 */
> -	return backlight;
> -}
> -
> -static unsigned int dmub_abm_get_target_backlight(struct abm *abm)
> -{
> -	struct dce_abm *dce_abm = TO_DMUB_ABM(abm);
> -	unsigned int backlight = REG_READ(BL1_PWM_TARGET_ABM_LEVEL);
> -
> -	/* return backlight in hardware format which is unsigned 17 bits, with
> -	 * 1 bit integer and 16 bit fractional
> -	 */
> -	return backlight;
> -}
> -
>   static bool dmub_abm_set_level(struct abm *abm, uint32_t level)
>   {
>   	union dmub_rb_cmd cmd;
> @@ -147,6 +126,10 @@ static bool dmub_abm_set_level(struct abm *abm, uint32_t level)
>   	int i;
>   	int edp_num;
>   	uint8_t panel_mask = 0;
> +	struct amdgpu_device *dev = dc->driver_context;

NAK. We can't access amdgpu_device in DC. This is code that's
shared with other OSes.

I've mentioned this in my previous review a month ago.

What happened to the other suggestion I had? I never saw
a follow-up.

My previous comments, copy-pasted here again. Please address
or answer why you disagree:

>>
>> This patch still has the problem of accessing adev from within DC.
>> That'll break things on other platforms. This information needs to
>> come in through the DC interface if we want to enable/disable ABM in
>> this function.
>>
>> After a closer look I also don't think that amdgpu is the right place
>> to control the logic to disable ABM in AC mode, i.e. to switch between
>> ABM levels. Take a look at dm_connector_state.abm_level and the
>> abm_level_property. It's exposed to userspace as "abm level".
>>
>> The "abm level" defaults to "0" unless userspace sets the "abm level"
>> to something else. The same component that sets the "abm level"
>> initially is the one that should set it to "0" when in AC mode.
>>
> 
> It might be that the ABM level is controlled via the abmlevel module
> parameter. If that's the case and there isn't a userspace that sets the
> "abm level" property then the easiest way to handle this is to switch
> between 0 and amdgpu_dm_abm_level inside amdgpu_dm when there is a
> AC/DC switch. Either way we shouldn't need to change DC.

Thanks,
Harry

> +
> +	if (dev->pm.ac_power)
> +		level = 0;
>   
>   	get_edp_links(dc->dc, edp_links, &edp_num);
>   
> @@ -170,6 +153,36 @@ static bool dmub_abm_set_level(struct abm *abm, uint32_t level)
>   	return true;
>   }
>   
> +static unsigned int dmub_abm_get_current_backlight(struct abm *abm)
> +{
> +	struct dce_abm *dce_abm = TO_DMUB_ABM(abm);
> +	unsigned int backlight = REG_READ(BL1_PWM_CURRENT_ABM_LEVEL);
> +	struct dc_context *dc = abm->ctx;
> +	struct amdgpu_device *adev = dc->driver_context;
> +
> +	if (adev->pm.ac_power != adev->pm.old_ac_power) {
> +		dmub_abm_set_level(abm, amdgpu_dm_abm_level);
> +		adev->pm.ac_power = power_supply_is_system_supplied() > 0;
> +		adev->pm.old_ac_power = adev->pm.ac_power;
> +	}
> +
> +	/* return backlight in hardware format which is unsigned 17 bits, with
> +	 * 1 bit integer and 16 bit fractional
> +	 */
> +	return backlight;
> +}
> +
> +static unsigned int dmub_abm_get_target_backlight(struct abm *abm)
> +{
> +	struct dce_abm *dce_abm = TO_DMUB_ABM(abm);
> +	unsigned int backlight = REG_READ(BL1_PWM_TARGET_ABM_LEVEL);
> +
> +	/* return backlight in hardware format which is unsigned 17 bits, with
> +	 * 1 bit integer and 16 bit fractional
> +	 */
> +	return backlight;
> +}
> +
>   static bool dmub_abm_init_config(struct abm *abm,
>   	const char *src,
>   	unsigned int bytes,
> diff --git a/drivers/gpu/drm/amd/include/amd_acpi.h b/drivers/gpu/drm/amd/include/amd_acpi.h
> index 2d089d30518f3..5a62e580668e4 100644
> --- a/drivers/gpu/drm/amd/include/amd_acpi.h
> +++ b/drivers/gpu/drm/amd/include/amd_acpi.h
> @@ -25,6 +25,7 @@
>   #define AMD_ACPI_H
>   
>   #define ACPI_AC_CLASS           "ac_adapter"
> +#define ACPI_BATTERY_CLASS  "battery"
>   
>   struct atif_verify_interface {
>   	u16 size;		/* structure size in bytes (includes size field) */
> diff --git a/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h b/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
> index f6e0e7d8a0077..de459411a0e83 100644
> --- a/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
> +++ b/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
> @@ -445,6 +445,7 @@ struct amdgpu_pm {
>   	uint32_t                smu_prv_buffer_size;
>   	struct amdgpu_bo        *smu_prv_buffer;
>   	bool ac_power;
> +	bool old_ac_power;
>   	/* powerplay feature */
>   	uint32_t pp_feature;
>   
