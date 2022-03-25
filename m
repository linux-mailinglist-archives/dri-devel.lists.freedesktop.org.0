Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 392544E754E
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 15:45:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5A3110E39F;
	Fri, 25 Mar 2022 14:45:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2066.outbound.protection.outlook.com [40.107.220.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCDFA10E39F;
 Fri, 25 Mar 2022 14:45:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mPF41UO6Vk0ztn6V4GlVsEju3V4Ka1SQpQO2SVuOeWenQnR0/CzCDGD6bShdD8/7X/TwXbQDieHgUXVJQH/mb2O/WZK3PXE792XPdQNgllrCBB2HdFcDqPb9rfIBkLZvtYCiMnptwfSdhgxIJR6nLBl6Mg4kgkeFbtY05vM2odqwR8CXNteDh3NZH1RQbUbHdtaRx94eMSmvtCeEtfAlvi+8Blxwd/VmyYd/WAofKuhBCT2qYCl0N8OTubKRd2bPzBPpj7yQ28gjK15zQ+dwDb9tuX7j8hT+ryFjvtj8MSpCmaSFvMbkKcOYJchsTO3ZEAcIsVTclZRUYXA62hPkfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=raSjFDf2K0Qc3VqdNqGAGBtk5qYWoEwmkNr102nOk7U=;
 b=ZRx5m78lX1STf/GBUJkRKMkjuvff5PZxyUwhCPWIojbX1wyYSLZnM1h1eNNbsAX7xLdLHWADg0Hro8PKqgbBdYFOmgOZEaXwAQYNvJc4aDBZCcsKpLkVJMO2/9ijg4860lNQvmxb0mT5wQMvE28Q54XiqLSzYju1FONv64zaz7mBSS+VA4Pb8HHhTRTNW6xf7VOxqtMk62/vZov1UTp/xaLePrO3/m8rovx6liSxBlTgXgvhberwnW/E4htpg/g3vvJs8rPHQSAadtqDOoozD+2OOyl+D0kcCtGZq6kHj1ZkPyTBi+FPqH2zBoIAsa9Lavcsg0OZNrMKdFFYzksbrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=raSjFDf2K0Qc3VqdNqGAGBtk5qYWoEwmkNr102nOk7U=;
 b=rIXZvgEnPzEpn5vd/oTVEVeEdQhxj8gDeFi55MPMl8KfPm1DKGBnyEfNxfz7w0PqIedm8h+HQ/CcdSgQo+/6oSAVsFVMLkaOgt/RmutafzbH0SCI4TB5srUUvZN4+cxfGAT+DUNzp1HebFS4VuSsD/dNE97atjny4V7WXLgWUDw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by MWHPR12MB1855.namprd12.prod.outlook.com (2603:10b6:300:10e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Fri, 25 Mar
 2022 14:45:38 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::192:5346:4ece:7ca3]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::192:5346:4ece:7ca3%4]) with mapi id 15.20.5102.016; Fri, 25 Mar 2022
 14:45:38 +0000
Message-ID: <97823682-77b0-8db9-0ed6-3f86bcc296c2@amd.com>
Date: Fri, 25 Mar 2022 10:45:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 3/25] drm/amdgpu: Disable ABM when AC mode
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
References: <20220325040515.4073706-1-tsung-hua.lin@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20220325040515.4073706-1-tsung-hua.lin@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0055.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::24) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18d92a50-b7c4-4f7d-bb42-08da0e6e2097
X-MS-TrafficTypeDiagnostic: MWHPR12MB1855:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB18550002C6AF97AC002B415A8C1A9@MWHPR12MB1855.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yW22Wz9b8uD3QYg37Md1ze6Ow4+iL93t/IOLIfOm8SMdQe7l0cW6i9yT6o8tnwXraPR+b0i4zKVbVxbLUb/5IgZsyVuGrC0DJa8Ix4aQTIMAYUwklqZKb6arCU4DTv5iAdrr/ADbD1CWH6s7fjmEbk9rOZPrWPxEvOOBIcH99SPmdAuzzBS4IL081dOs8LLq3QnMvMhqph185IllGF8lbXtGpfAXALOXgWE/J2XjMegG4TTKPjFBA9/4cJXKmpOOssfathcLAsskDFxL81vaBshJGqFOiN/F0j3SS9cHQP7kxtwngWTfQU46Ah0bQt8TVpdZDSIDAbVE41VMOa60QMyPtowwQaeWP2Ra93XtjUeBmYf+vwbXu1c6mR+7ITz1m1m+njg1orjqEKKOoYBZL8X5mwtVZ1L1cJr7RPnErfhmBmgqXpiNshWpSOQFi2lxaldJrFpJBolbD50Hz0n1BlDLlHFkEEe5qrb4jMjKw28Tw2uemqbFSEPUBOqbnoGCWuREy2/3RFgYMdrfWzEEzRAigspDiAO2uMR8aEXYSiFVnx9X2lZTk1rzQjD0FsYAUe+ezaIHXdf2DRCgtrDOExTefmlbbBVJBuuqduvQqAWjM4Ve3AE85F52488xHnb9GLH7MamcHFGGwGKAaZAjlc68JTAtJ6Gatob+HvTcf5x4UFJQIkXSwOkg1nR03QpylEB8d5pauOFO6USparnts+GZJ1NSUayWfKNSn6z4SP09S+zyBTvLFokl2J+miYvr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6636002)(53546011)(921005)(2906002)(6506007)(26005)(31686004)(5660300002)(44832011)(7416002)(8936002)(36756003)(186003)(66476007)(83380400001)(66556008)(66946007)(2616005)(8676002)(966005)(316002)(6486002)(6512007)(86362001)(38100700002)(508600001)(6666004)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ulo3U3dNZStkbzRyc0Zra3VVd0FGZTc3M2xERXZKU2xOclRsYmxmQ05MZDZi?=
 =?utf-8?B?UXRuMTFGbC81Z0pySEdzWThzUzFJZnhpM1ZVL0lKNkM5dmlzNG1YdjJNTHhE?=
 =?utf-8?B?SW1Cb3FoM1JoRzU3alEzVCtzVVVDS0kvKzhtMVBldTN6LzdVdWwxa2JSV3FC?=
 =?utf-8?B?dE9pZHUvbmpJZHVQYkZraFRRRmx2QkhnOFBiS0lQVzg4UFpFdzRIQVRGVTdV?=
 =?utf-8?B?UWZ2YWY3NVI4N1N5WVNJb1U1ZDNKb0ppOW0zSHlVYkVpVm44MXgvZm50M2h4?=
 =?utf-8?B?dHJidFRyTWZtQVEvL0MyVVRJZjhjR0s1dU1SMENka2xGQTNuaTcxN09NZHUy?=
 =?utf-8?B?NnNUN0ZzTlN5Y2cvbzZWTlkyR3RvQ1lqeFhpeTgrRzNQWXdGZUo3aGx5MGl2?=
 =?utf-8?B?VFd2Z2VDTzNNWHBxb3VtdU15NUs4Ry9qUWVRb3pGd1VrWnU3MS80MjgyNWk0?=
 =?utf-8?B?UlMwK05MbGl5TzNycWVlNWtCWXhRRm5ERFU2UGR1WHlIWUxLam40UTloVGY1?=
 =?utf-8?B?OU9KZmpmMWRhMGFCKzd3Rlp6MHhPMGU2M1MrZVBzbHZwUzArSHB4ajNXRHZ5?=
 =?utf-8?B?c3BVYk1SQnd0cHZBSTIzeE83VFl3RTFlKy9wSENNNCsxRzlMb0U5UVFDYmxv?=
 =?utf-8?B?T2k2dnJmUGoySm05ZE5Wb0NzY1YwRUlZL09DMzkxbG51LzJTV2p5dW0wSDdC?=
 =?utf-8?B?U2JBN3E3Ykk1bWRKcFFlbE9MenJtSVo3OElPdlRZd1B0dDRaNE0yZTBXaDFq?=
 =?utf-8?B?N2NPOUF2SUROK2VrY0hlRVA5dTRSbGo5WjdoUVY0REUxNDJvNmtCZnRxNXZM?=
 =?utf-8?B?VjJiVW95aTlDRTgwT2h3N0FRUm1NanV5VVBxSWNFZk1JSjczMXJFWnA4UjBo?=
 =?utf-8?B?eHJVTnJvRXIrTTRNdXRCSEpNRElTVkFtM3BOem5Ia2NLT3pRWHJkSjZudVc1?=
 =?utf-8?B?aFBmY1RoT0w2RklWK0I3Wmg1VkJEUVpyRXVTWS9qbzdySlY4NjYvZm1iNXND?=
 =?utf-8?B?eEdFMDViVWw4TGttaVNQRDRhcTRzSFE5UUZPT2xTV1Q3Um10RTRKbHY1RDl3?=
 =?utf-8?B?aDFiOTRCeDR2aHF1UUtnb1Y5eUF0NjlaYXJ2Y2hIM3IzY2Q4ME5lcXBFRHdt?=
 =?utf-8?B?NEd3aDNUbHhvKyt1TGYzaEU5eXNPOVpsbHZad1ZPVGFKakg1VDlTZ0dIWm5i?=
 =?utf-8?B?Sk5NQWFIcDdDdmtIckY5ZE1YUVdjd0dUS2Q3Uk1vM3NpSUgwTGlxS1Y1dDRB?=
 =?utf-8?B?T2E0R3ZzRHMwdDdWVzBmNVpqY0JURnphMi9TZ0ZHV3pNN0g5MTlZRm1JRFVW?=
 =?utf-8?B?S2tOWnRVWExiYnRNekNkSWF1R2JnaUdhNW1Ya1g5VnhNYytKYUJzb3ltUGRr?=
 =?utf-8?B?N0V6OU9YRVpXWE5hdTltWG4xUk1ZUXVaZXk1OWNFYklBcVpLYWlQUUU3QWhn?=
 =?utf-8?B?b29IMDcxSzl4NzE2VDQrd1BMUkdaY3NpNWg5N0VnODg3MSs5RFNoSHNtU1c0?=
 =?utf-8?B?Z0lJZUh6eTA2WmU5VkVOR2RkYmw0aSt5YzJtcEp1SUw4ZFFCWlJRSG01WHoz?=
 =?utf-8?B?SHE1V1dJRFFYZlF2QVA3KzAwSm5OMnRmbHp1UDkxY3Z6MWFvcTY5a0lBemZt?=
 =?utf-8?B?amgyblQ5ZXM1RUF5UEtmTkZoQ0JUeHVLOFptSk5tZFpFcFk0dmpGZG4zSG4r?=
 =?utf-8?B?M3RYK0RkbVVTWFdjdjJBQUVhTEJkSVlHbjgydU9ZNDJwN0QzNXZKWTNha3hq?=
 =?utf-8?B?aHpnVUJpMTZsZUF1ZUV4LzRKZEVsYXBXdTFWSVExSkRHRVpWNGo4WlFGaGhn?=
 =?utf-8?B?bG5Oc3JBRTZvdkhJR2pma1A2QVpSbVhCR1lDT0tQQTFNNjFEaHUyZjhGbDVF?=
 =?utf-8?B?d3c2UThEcmVBV2ZhZ1hBOXlUOUx5QmdrOCtBTDEyUVRFUDlVdDBaNE5Xd2lj?=
 =?utf-8?Q?XuGWoYAcLAUgJW9UU08+FEfUppDusur7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18d92a50-b7c4-4f7d-bb42-08da0e6e2097
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 14:45:38.5633 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mf3HUw/vImOcVDMEmnrOGSCksjFAeWQxit9uajiq5OxWlqzalGOxo9XHCR0soYKAhR4fiNbfYLEyk10Nfb2tvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1855
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



On 2022-03-25 00:05, Ryan Lin wrote:
> Disable ABM feature when the system is running on AC mode to get
> the more perfect contrast of the display.

It says patch 3 out of 25. Are there other patches? If so, I can't
find them in my mailbox and neither can patchwork
https://patchwork.freedesktop.org/series/101767/
 
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

This file lives in DC, which is shared code between Windows and Linux. We
cannot directly use adev here. Any information needs to go through DC structs.

I seem to remember someone saying that ABM gets disabled on Windows when
we're in AC mode. Have you checked with our Windows guys about this? I feel
we're re-inventing the wheel here for no good reason.

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

