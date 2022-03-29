Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D044EAF4B
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 16:33:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61BE210E8CA;
	Tue, 29 Mar 2022 14:33:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3CCC10E8CA;
 Tue, 29 Mar 2022 14:33:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T05fMWWSdFgffOIH0r1WX4DUZ1DhbFE8VlLYoXiAYbcugwxW4pZvuF+6nLbEzRR9wX8NJw53GL0eTe5xjHwL+Y/sOxZ/QxwGCKXF3cenOr7G3Tl5pDy2DE0mW4T2vQenz39C3VuhsLGe/GJtPrfzY1B3xY+QatFJB70vDhFI6msFsTrey1+ROenKrLFLju1/J5bA9yj3E8CfGh3wlMnOYreS8RLQh0yxS5Q9rDn/eIoth3Xsj0NEPYWJMfu7leMh0myAaRH0sPKc5YJbdYANvvGqUJNv5AabjYiCVlcVYhiGy1evLxJmLaG3r3zoSAXTh9XXpMfDqz8LQDzcIpTwCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oR/fDS1XPrp2C0005YGU5d93rQHkAmBFtJ4J/Tlcxp0=;
 b=XGuzoxmDrr0Q4SOgV/sbsLmm7imjFkXvZMs3vmrZOE9grXy83K2iUc43gIzPh9vlsttSECPmNRlPZZVgg2x98FRQOvlP//+BYvozahPkTgqJZ0tnowVvyZGVa+zeB47LwW4EzJXTi4mrh5zHAy4lLl6IpadinrBM5kzyDKJ8X2d5VvMwbukNpWINynPFeBCFyLneL0Fm8vzIf3K39mh9v4Sb/V1PEHhEKyQoUMk4jMxwCJfMhuLekM8f6w6M/bdHKFUlFCNo4wmw0aEu3DkjXB3tgfyuPLwuZRO64vfGiurr70H7oGFQe1ecY3ACPDLfmXN4VgWbG6fy96cDSilOzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oR/fDS1XPrp2C0005YGU5d93rQHkAmBFtJ4J/Tlcxp0=;
 b=Urn+l+KxkyfQ3znW9H/8KWfUt971tITXPeTSy3KL0Qr78SG3XfWVXsVSMHYpL2KyscROBcutqK/BaM+fCrPsRtZ93W0pMH31IzzXBN/fZcLnVG01annObOu31/n4xleQfu5C5dS6pnKrqX9/c9xBBWEdoJ4TqtPgQibxFJ5oSAo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CH2PR12MB4200.namprd12.prod.outlook.com (2603:10b6:610:ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Tue, 29 Mar
 2022 14:33:29 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::192:5346:4ece:7ca3]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::192:5346:4ece:7ca3%4]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 14:33:29 +0000
Message-ID: <cd030261-6d49-263b-0018-4fc87cdf0958@amd.com>
Date: Tue, 29 Mar 2022 10:33:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] UPSTREAM: drm/amdgpu: Disable ABM when AC mode
Content-Language: en-US
To: Ryan Lin <tsung-hua.lin@amd.com>, sunpeng.li@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, David1.Zhou@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, seanpaul@chromium.org,
 bas@basnieuwenhuizen.nl, nicholas.kazlauskas@amd.com, sashal@kernel.org,
 markyacoub@google.com, victorchengchi.lu@amd.com,
 ching-shih.li@amd.corp-partner.google.com, Rodrigo.Siqueira@amd.com,
 ddavenport@chromium.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 leon.li@amd.com
References: <20220324231000.4072275-1-tsung-hua.lin@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20220324231000.4072275-1-tsung-hua.lin@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0133.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::12) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 569986d4-61bc-42ce-a552-08da1191179c
X-MS-TrafficTypeDiagnostic: CH2PR12MB4200:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB4200B660E0096E9ED585798F8C1E9@CH2PR12MB4200.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bcUo9L8g5qejtA4DrdoaM5q6giDp41SqTHKuG8R5+vrut1sf9VR1olPk+MU0T3zMqco7+YYPFpKfv5NKOvZLFDt6tMefZxIVdxdwS6osS5NczTB4tJrdPrjcNWLzLC6ARQVwKQbmrUdgiAYvZ+8POYPgPHc28zEUhGMK56KaZR9dLhGTRvMSe97tO5CeWX4m2X1sJrvnxvrtUU1q8IoiPfhE2b9xhDsGGBclSUq/c1JkzSMmvGMLNGarGAlQ5h5iN9I09YVwTnJgiKdANMiHSX7YZM3cLFqQWlwpXOcKc7mpE3AEHRYIl/I+UBQs4CI9Qv+8wGDIZz0meQsDdKO7d8kIK/KWiW+I7TO8Q5I5sbBdgV5tuw5EhANN6drZHRlSfHvf98np5tLgJvVnVqxMo94xSSd7gUE9KTtmEpok+0Mj8FA+c3h8EROt5EbBUMGq6E53/QCAWQ95rYuCnCuHzW/Z8fGVnnYwpvbaiQg9T51X01yRiy2/ahSnN0FKSZhRypyuWXvK/1Ik9jYtcNvfqyygMpvog4uGhFN5/DoAUiKtJNTJA2GI3qpAUVv7vJwhWpYkYySgs0Bx2l6cTtAtQP/Hw8nKa+s1B67sqfZPJ0MAdnpYmjUnCAjC5lQNtOhv6lHNg3yi0Sn87uQ0eX7TRzk+IHdlV7PzF1nmtsjhyNOu6DM3m9fjMPc5kxB6uwUW7UW0fLThHIYy6sv7HOEiDeFtL7vhUw6LxN9IYDHsg3vyGEWEt7fAMWHvB5VS15xI56p9tc2koDfiIo/MIw9obA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(31686004)(86362001)(36756003)(31696002)(26005)(316002)(6486002)(186003)(6636002)(53546011)(2906002)(2616005)(8676002)(7416002)(921005)(6512007)(6506007)(5660300002)(6666004)(8936002)(83380400001)(44832011)(38100700002)(66476007)(66946007)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXhkNVRWODFKNklsLzR3d2Jjbmc4SlFqMmdKVkg3bFIwRHZNbjluYzcvWUta?=
 =?utf-8?B?MmNYQi8wQyt0WXN3RHpCMkxkb3UzeC9lUERtNDg2ZFdjeW9iS3VqUUFFQis2?=
 =?utf-8?B?bVZ0N2NZeXdUc2FWQm5yUThjSmxuVGpocjdaTmlabSs5TGd5SzBUV0p0VXVJ?=
 =?utf-8?B?eFA1dGZXalRLNHBhNldxVlFhTy9TK3U5K0l2RmhqODBqWjNnSGV6MUtLV291?=
 =?utf-8?B?ZXg2b2JzSkkyMVkydmFNSFRzcTluN1NNSTlWQnhCRG4zcmYwSVVsRkdzclo5?=
 =?utf-8?B?T29WcG1nQVZPdFhrajBRR0NETldScnFZS1Q0dTNYTnZ0UHRwK1NRSGliV3FQ?=
 =?utf-8?B?S3pIdFAwUHdtYTFxS1lhTUxLTlJCelFwOStZZTdGbzBLVlZNVGVzK1h3SVR5?=
 =?utf-8?B?V1gvdGx1NEdGZktEdHpuanAwRElpaER5cys2OXlJN2JGL1hQUXZXcVFvcG5C?=
 =?utf-8?B?NkpnWGwrSzZJTmg0QXlJMzgzbjd6WUZ1QmxxZ3ZHZjRLaE1NbVY2R2tWUHZG?=
 =?utf-8?B?VUE0U3dncGgyVzdhK0xCUTJUSUV0RE9BeWdza1A2S0lvT0ZERFZGTG00cWdv?=
 =?utf-8?B?Um1lRXo0WlBvZkJPRkpkTkhMcWJZNDAwSkZTUEpucjVNYnBuR0Nwa1pJOE5D?=
 =?utf-8?B?QmNmaU9OcEY4L1lsTlV4Y3VPR0FWaWFHaXgzTUN6eHBlSkJydVlUeU9HcklK?=
 =?utf-8?B?Q25kWkQxVHcwTk9aQ2x5Q1k3cDFKejlzMkRlcThmbENQbVdobi9CaklTbUJD?=
 =?utf-8?B?VlBWalp5b2JkcTQrK1labU9hVlF5M0dGYUNuMzh5YnNXSUV2NFNUSS90YjJX?=
 =?utf-8?B?c25DQzAxdmI1citVNDJYcFhWZFNpZzBReTFlclBkR2xMbWU2N04wOFFJendP?=
 =?utf-8?B?SlNMOSs4clhQZ1RZaENnanNEUGtmc3BIakxzSUFNSkZCOHlwZ1lsbkI4ZmlP?=
 =?utf-8?B?eURpN1BVcmYyTlppNXR0TzJWZWtYTXl0SWNSZkpKc0N1Q0pia3lOTG9RYWwx?=
 =?utf-8?B?clpPdTRFVHdyUkdvVWJ6dkw5eUtzcjlDZzBpUTZuZ1h2SW85d1RyRkNvK0Zv?=
 =?utf-8?B?UXlFM1JsL2drdDBCckRQTUJaS0RWc05JK2E2eTNXNXUvRUJocExKY2dJaG1h?=
 =?utf-8?B?TlFqaVFJaGFjVGErY09ITitDcEFEaG5TWHRpYmp0T2QxTEZGcitXcWlhek1C?=
 =?utf-8?B?UTIyRW94VmtYaFJUdnJSMENoaEZYcEZJUnY5WUVPU21xSnUvMVNjTGM5WTZ4?=
 =?utf-8?B?K1k3aWU2KzNzaDdXNE8wSm9JR3dQT1F6VXdVVS9lOTQzM2hHWEVaanQ1bnAr?=
 =?utf-8?B?cEVKU2psbnZ2Z1l1SWpzU0srY2U5TXg3TXpsSm0vR0k4OU4wQThUTGhFcFg5?=
 =?utf-8?B?dWhMZlhMLzIrOUdwcG5jK2hpSWpqdVFSY3JlM0pCSzhGaXJUTlV1REI4UE1o?=
 =?utf-8?B?eEVuQndranVySEVteC82SzRFYXREQndFUHFNbzRuVXExRzdsdnJyREhJUEUw?=
 =?utf-8?B?b1pLRS9TQi94N1JCZk1Mak83OU41bXNjdHZidWQxaUxLTXh5OExhSWwxb0hQ?=
 =?utf-8?B?dzZXNStuVUIrN0I0OTZuZkN1eElJUWEwazVoYTJHaVlxRDlyTHRhMk02dWVC?=
 =?utf-8?B?d0RUN09pdWlVR0k3bnRSenJ3bEVtTTNLL3QvM3RZbnMvVzZTMDM3Y1RkTU1t?=
 =?utf-8?B?OUtoUFBJZHczNE9BY21yaHA4Nm9YV0FqSFZYQy9iZ0cvNXBqYVdmeG5EQWc4?=
 =?utf-8?B?NXRJQzREaEs0QzJZazhuL1RETjhMTFFxajJIT0JRVkZlTldrL3FNcmEydTVF?=
 =?utf-8?B?RC9QTGZ5eFlvU0NHWkJZbitnS0hSb2RiZ0EzZ1pwR0xpYlNLdWVGa0NpTmJG?=
 =?utf-8?B?OFNkb1hTNTJmdEpHNVcxZ0Y0YU1lS1BaSGx3ZG5VTCtoNFNJTElwUWU2VktR?=
 =?utf-8?B?cnFjQW51NkZUeUNDUUlFbHNlYWQzNGdQMmlWY25KL0lOQThGSVJuY0QvUmJy?=
 =?utf-8?B?YktwUHJjbHFOVzFnTzRRUmI1YUdjc1g0aEhZd3A3NHRGTGxvSFpGK3BPdG5B?=
 =?utf-8?B?dm5peVp4NFF5L1Z3b21yVkhmM0UrM1dpZmduRHl4am1valpSSllPcGdVL25l?=
 =?utf-8?B?c2VnU3ZQbitJUEJkNWtKUWJaK2ovSklqWXV5L2oxdDZNUGN6cjJYUmlDTE9a?=
 =?utf-8?B?dlhaREV4NlhINUNYYm5UWkxtNTdTY0VTeEJabEpIcytOUzhxQnRQK1l3NVFk?=
 =?utf-8?B?ejZOSm9IMXVVZHJCaEFabFkxZ2ZBWElBY0JNZCtucThGdHRrMjZWVkZWenlp?=
 =?utf-8?B?Y3dSVUt5QncyV0dNTTgzWG1wUzJIQncyaWxMMEl5MlNaaHlZRCtIQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 569986d4-61bc-42ce-a552-08da1191179c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 14:33:29.3386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yWuLL8IJo1PeQxXuYuiiMb8E7vTb8Egzv7jYYz3XflbE2O5gEKcSiYTr2JNtWwCNZr8zUgCNCJ0HeXR8t4Ecrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4200
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



On 2022-03-24 19:10, Ryan Lin wrote:
> Disable ABM feature when the system is running on AC mode to get
> the more perfect contrast of the display.
> 
> Signed-off-by: Ryan Lin <tsung-hua.lin@amd.com>
> 
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c      |  4 ++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  1 +
>  drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c | 58 ++++++++++++-------
>  drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h       |  1 +
>  4 files changed, 42 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> index c560c1ab62ecb..bc8bb9aad2e36 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> @@ -822,6 +822,10 @@ static int amdgpu_acpi_event(struct notifier_block *nb,
>  	struct amdgpu_device *adev = container_of(nb, struct amdgpu_device, acpi_nb);
>  	struct acpi_bus_event *entry = (struct acpi_bus_event *)data;
>  
> +	if (strcmp(entry->device_class, "battery") == 0) {
> +		adev->pm.ac_power = power_supply_is_system_supplied() > 0;
> +	}
> +
>  	if (strcmp(entry->device_class, ACPI_AC_CLASS) == 0) {
>  		if (power_supply_is_system_supplied() > 0)
>  			DRM_DEBUG_DRIVER("pm: AC\n");
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index abfcc1304ba0c..3a0afe7602727 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -3454,6 +3454,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>  
>  	adev->gfx.gfx_off_req_count = 1;
>  	adev->pm.ac_power = power_supply_is_system_supplied() > 0;
> +	adev->pm.old_ac_power = true;
>  
>  	atomic_set(&adev->throttling_logging_enabled, 1);
>  	/*
> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c b/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c
> index 54a1408c8015c..478a734b66926 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c
> @@ -23,6 +23,8 @@
>   *
>   */
>  
> +#include <linux/power_supply.h>
> +#include "amdgpu.h"
>  #include "dmub_abm.h"
>  #include "dce_abm.h"
>  #include "dc.h"
> @@ -51,6 +53,7 @@
>  #define DISABLE_ABM_IMMEDIATELY 255
>  
>  
> +extern uint amdgpu_dm_abm_level;
>  
>  static void dmub_abm_enable_fractional_pwm(struct dc_context *dc)
>  {
> @@ -117,28 +120,6 @@ static void dmub_abm_init(struct abm *abm, uint32_t backlight)
>  	dmub_abm_enable_fractional_pwm(abm->ctx);
>  }
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
>  static bool dmub_abm_set_level(struct abm *abm, uint32_t level)
>  {
>  	union dmub_rb_cmd cmd;
> @@ -148,6 +129,9 @@ static bool dmub_abm_set_level(struct abm *abm, uint32_t level)
>  	int edp_num;
>  	uint8_t panel_mask = 0;
>  
> +	if (power_supply_is_system_supplied() > 0)
> +		level = 0;
> +
>  	get_edp_links(dc->dc, edp_links, &edp_num);
>  
>  	for (i = 0; i < edp_num; i++) {
> @@ -170,6 +154,36 @@ static bool dmub_abm_set_level(struct abm *abm, uint32_t level)
>  	return true;
>  }
>  
> +static unsigned int dmub_abm_get_current_backlight(struct abm *abm)
> +{
> +	struct dce_abm *dce_abm = TO_DMUB_ABM(abm);
> +	unsigned int backlight = REG_READ(BL1_PWM_CURRENT_ABM_LEVEL);
> +	struct dc_context *dc = abm->ctx;
> +	struct amdgpu_device *adev = dc->driver_context;
> +
> +	if (adev->pm.ac_power != adev->pm.old_ac_power) {

This patch still has the problem of accessing adev from within DC.
That'll break things on other platforms. This information needs to
come in through the DC interface if we want to enable/disable ABM in
this function.

After a closer look I also don't think that amdgpu is the right place
to control the logic to disable ABM in AC mode, i.e. to switch between
ABM levels. Take a look at dm_connector_state.abm_level and the
abm_level_property. It's exposed to userspace as "abm level".

The "abm level" defaults to "0" unless userspace sets the "abm level"
to something else. The same component that sets the "abm level"
initially is the one that should set it to "0" when in AC mode.

Harry

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
>  static bool dmub_abm_init_config(struct abm *abm,
>  	const char *src,
>  	unsigned int bytes,
> diff --git a/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h b/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
> index f6e0e7d8a0077..de459411a0e83 100644
> --- a/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
> +++ b/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
> @@ -445,6 +445,7 @@ struct amdgpu_pm {
>  	uint32_t                smu_prv_buffer_size;
>  	struct amdgpu_bo        *smu_prv_buffer;
>  	bool ac_power;
> +	bool old_ac_power;
>  	/* powerplay feature */
>  	uint32_t pp_feature;
>  

