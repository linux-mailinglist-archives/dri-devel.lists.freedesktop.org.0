Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEF44FBA99
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 13:11:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B9610E354;
	Mon, 11 Apr 2022 11:11:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2050.outbound.protection.outlook.com [40.107.102.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4229010E354;
 Mon, 11 Apr 2022 11:11:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P1kjP0O9zZR9s4Q5plZljZ+oSaaN0XfcJYnCMLoWO6SO5tkOZQ4pQo23DkOnkAp7dq9kZpaCEwjhzwy6zan8g0uKH5QXG1wRt20jC+ewfi7Og3kfOm0RMCWRQ5ZBWTYqELMjKDpgGsJsM/w4gqBrRdAg2EoRlLJtlC9SDLKQzLb738cJP0QAtaQYZxLBUs9lDRkHvxWHiq9KBaMnR98tPGL3qHGrfV51IY+7UKIgXgoSK+sliC7wIEKJFOdO8kqr8kG8bpbvHbtTN3ML4SAmjSSNdCkOVr6uG1fcn6AqBA742CWo0yd9eurzAK+yqkkV6VsBl43a101yYw7Y+CytNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7oZZjbFQB8W6ZvzAqpszRz4W73EpjWLsCs7ERX8p2jk=;
 b=S8yj04t0K900JgaWf3Awfkfo/+uyifxcOiXkN6ULznkt5XSYWLRRoOQ2FSwYqRNf+BGW4PTujTYFz/xNttyv7MYywVUuRJtNCXrGmeqQL2d+RLFyfiPZlQmDbb0KIaNRP4XiaLqEeyN0MjxoQxqH40jG9MGSts8HE5rd0jaVCpKa9pW1nDxq2dEtylGxZoRV5pNhWPRYxmFxXrvSjATHXC0j4cyUKqLd9XWMBd0pFgbcouL/Uwsrudhk+mk5RTHUs60viZfYJ3yx50IplauTPwectrkFcxft/uTiae8poHQDsGC9t5htoQmlP0CA2lpjSve6agjJcCYhHtYe1bHp6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7oZZjbFQB8W6ZvzAqpszRz4W73EpjWLsCs7ERX8p2jk=;
 b=dmjafpFvObapVOpRmsG7PRh/a0u9HKpLx84hWT17snTgf77/6TyViy2uLd17/qleM0bVby5wam313lzu1ZYWU8zKHoxZw1NvfYijchVJOSDcK3PHbQ5kIssCEUGjZswVZti3GNe/1Xd9IUXZCFK11aFCRy4i1am27wp4DzkbwCI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4526.namprd12.prod.outlook.com (2603:10b6:806:98::23)
 by DM6PR12MB4500.namprd12.prod.outlook.com (2603:10b6:5:28f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 11:11:43 +0000
Received: from SA0PR12MB4526.namprd12.prod.outlook.com
 ([fe80::7ceb:a37c:cd60:9d5f]) by SA0PR12MB4526.namprd12.prod.outlook.com
 ([fe80::7ceb:a37c:cd60:9d5f%7]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 11:11:42 +0000
Message-ID: <7775829f-b612-19dd-277b-aed2e9cca991@amd.com>
Date: Mon, 11 Apr 2022 06:11:39 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCHv2] drm/amdgpu: disable ASPM on Intel AlderLake based
 systems
Content-Language: en-US
To: "Lazar, Lijo" <lijo.lazar@amd.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, xinhui.pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch
References: <20220408190502.4103670-1-richard.gong@amd.com>
 <2c1e5bf0-6952-12c3-6e6f-62cb44fe1490@amd.com>
From: "Gong, Richard" <richard.gong@amd.com>
In-Reply-To: <2c1e5bf0-6952-12c3-6e6f-62cb44fe1490@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR18CA0055.namprd18.prod.outlook.com
 (2603:10b6:610:55::35) To SA0PR12MB4526.namprd12.prod.outlook.com
 (2603:10b6:806:98::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2544e1cb-5a5e-4ec7-f269-08da1bac0f06
X-MS-TrafficTypeDiagnostic: DM6PR12MB4500:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB4500ADBD61653B5FF9CBE2ED95EA9@DM6PR12MB4500.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dBXCWbtpeIbSbKpAdQE3vkS70UAY5oA8oWjrfN1Nc0AkNDXSEtjCdw+v+G0B5CNWFYhaJNyCy29/noMHc1KXR7ZIwVqAej909rDtkwuUJZL4eN0Mmn3IhvpStNMexySNQ4jCTb1CDisut7wrF9a/58U6YSERoKyMwyR4sSJpF3dDCnFT2or66fDuC89EjVY03yDoMX0BS8ku8ePtWB4f8vQZ5gJNZQ/629GYdRIMmq2CeAqvXfS6YQbf7j0TDk6+Qp91lmvgSjdCyr2fAbgTnPGgi0BdiTigJ4p1tGQDJAxt1rgUyk9UMuydJ4/qBiKrPk3q9nY7uOBex1FBkBMSCCroCPYaL/4uReH/txPl3ztUTdWIFmexZ4EHi5J0n4SIsmG8AiU8e1NMFNr5wMR7zAkXicoPYaYBrNzJKh47Oo4FIxORVnp849cfWZXsiYfdSwzr9WIlMkHsul3q9LpbP/CkPZPijE0v4UItB0u+65mEI2QzCZbqvE/dP/MEhrVrYM/6gKbYBVUQ4IThTxq5qKjDOnGn7DZENUaLOnd6DKz3zKoebS4xfz2Ihc4NfZhmxanTxLof0bly9BMQx9COlZfr2nTreWzSGdgRWxKiJso4WfRSCs/Zu+DCuPYvfe+oBOcqShZYLiJDJU+vEHF72CyIblSQ351XB+XQ7zOWr89uINMz5vp5QEWNpHoxaWdzUNOGB47ZJZHzHIstH16aVc49FxAx2CGR0+PGAegtYyM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(31686004)(2906002)(26005)(186003)(2616005)(66946007)(66556008)(6486002)(38100700002)(66476007)(6512007)(8936002)(5660300002)(508600001)(4326008)(8676002)(6506007)(83380400001)(86362001)(316002)(6666004)(31696002)(53546011)(966005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sm9TbGRoSk02Rk4vaVdad3pxWXBwTlZaZ1hsTUZEREtKS1c2RUZPL09GMFdr?=
 =?utf-8?B?aFJhV2ZvdHZwUm90SmNrbzZXY2tsZHhYM3ZxTW0reHdGUkJLdk02YXVTYnFv?=
 =?utf-8?B?NldUdGtHVm9VSlQ0MlptYUF3RENyd0EzV0cwT2V1akNRNlMzSE1BUStUL28w?=
 =?utf-8?B?VWJvdmR6RW9aVThhcGIwakk1blpZaFI5S0g4THF4NmNWUFQxeFcyNit3WW1J?=
 =?utf-8?B?RW9sN2xXNkZ3d09HajR0bGdQbmdNMEFWTlNhTzZJaUFMUGFUN1FadERnNnNH?=
 =?utf-8?B?bUdsemVvM0FSZTRCUHR6bVMvUDZIU011MnQwanMzQWcxUS90MTBCeGM0OGRw?=
 =?utf-8?B?V3dVdmloWTZnVnZUc2FYL1lnaEYrSC9UMjA4RjJjei9ITkFIUE13eTFMTkFh?=
 =?utf-8?B?TU1lZW92RUpET0NOMExNeXFKbHFIKy9IajRSbUxKZlNyUjhoU0tXb0JmRnpW?=
 =?utf-8?B?OGRabFZGcjltVTlBb1h6UGM3a05tTnBZYTRUVldpQmZjLzlCUGlNMHh5L3NN?=
 =?utf-8?B?SjV2cXVnWjlCV2NXbHdkWUsrTEVZUFN1U3hLUXlNWHBmRUNhemZXbzdUZWxN?=
 =?utf-8?B?OWNWM2k3R0cwc3ZKa09KSWpMOEZ0UGZxMjVscXQvK2w3TnhLK0RqeXM0Mndo?=
 =?utf-8?B?ekVtRkRyS0tTaldrb0ZjNUdJODVZRWtSN0pzQkk1T1VJVWhldjlsdEgyWmFP?=
 =?utf-8?B?Wm5ibGZYaUFybWI5OWlQQ1IwTk1zcklsUjA2dXJiUHd0ajNpUjNCbFBjdUl0?=
 =?utf-8?B?ZVFWVFI5TWpJYWVtM3hBNXdQa3JVRUJKNUhQVDBYeTJaYUVRVGlDU1NRd2J5?=
 =?utf-8?B?VTdqTHNibXdlTUhUanhRVDB4OHpMdEpKckF4WjZsVCtZa2cvUVVZeUJEZ3hh?=
 =?utf-8?B?L1N0RlVTRGtQaFgvQ01zclZqV0l6UjdNNndIOWJXTjlKNFpLQVI3UkNOeno4?=
 =?utf-8?B?Q0Q2RVlHdWJsZTdDSmVpZVdwTnhhWGFVYWxMTnVGTDlYdFlwUmVOaWlhaGh0?=
 =?utf-8?B?QkNqaHFMZ215Z0dHMWF1NldHWE5SZHk4UUtWNGl5VzRlaktyRWxXaDErVnhK?=
 =?utf-8?B?TjVkVkp5ajBMcHJud0owMjNPSGI1U2gwbWpwb2NRQ1NoeXBZK1NGb25sTmt3?=
 =?utf-8?B?cjRKVlk5Zi9qOHNEZTRnN0ZjRkM1SEZaaWJNMGtnRVZNU0M2aVNHbGZiRHlR?=
 =?utf-8?B?L3Qvb3V0enFJVm9LcWFEQnZ2ZThYdE81QnFoQ0liSzl0a2ZBeTR2VkVCc1FG?=
 =?utf-8?B?c3NXMzdjYzl3czJMUlJBd0NUdFl4azYwY1VycE9ubko2U1hscXFrWTdyVG9x?=
 =?utf-8?B?TnFvNXVoY0p4TGxMdXZDaDA2dEtSODNTeDVWMktKUEs1d2RaeDdXdFY3RHJF?=
 =?utf-8?B?cVpHZEdMeVdILzNjdG1CZUVlY3YyTklkQ1VpK0ZycFpqV014Y0IvdHIwYm55?=
 =?utf-8?B?aHk3OVd1WHhENWFhdWZjalF6b2ZKSlo4b0J2RnZ6WFV4REJqN3J5T3hxMFBH?=
 =?utf-8?B?SmltZDZva1R0enJPOGRtODIzVEhQOFQ3Z0QrU2R4VnZzaVlCSTE0RDFtQUxr?=
 =?utf-8?B?ZmN0bDAxTWFHL2NEZVQ1cVVlWmJlWmQwQURER3JObm4xZXRLZ2J2REp2R2Zp?=
 =?utf-8?B?RE5QazRaZFMrelRiclJxeVVTVGpaRGhQZGZ5Q3RpZncyZ3QxMkd1QjlGVVJH?=
 =?utf-8?B?Ri83b00zM1ZVL2l0c29qbGNTdTRvOG43T200YWZjblJrN043R0ZiNkdUTDdn?=
 =?utf-8?B?SDlHWXJmb3BLRFlrVzRiOWJnUEU4bnpaZm9iY1dodXl6SDNSNWsrR096RzVs?=
 =?utf-8?B?WmhQZlJFbzRVd2Z6NlBUc29FWE4zRmpWcG00dnJlSGo3UEV6VGsyelpsY3Y3?=
 =?utf-8?B?TS9Qd1VhZ2syNWtSMVQ4b3VOam9xS0djK0xpQlF6OW5UUHVSS2dGYU9NYXpY?=
 =?utf-8?B?N2ZsWjVzVDhQbHlYTk9DKy9ibGtIUkQ1NlBTOTRrZjZpQ1JWZTFwRnFzNDJE?=
 =?utf-8?B?L211R1VJdGYzd0R6dkxQYXFVQ0FIUXhPL2FwdkdPNkE0R1FzT0ZhRHM2Y2xN?=
 =?utf-8?B?alJvU29tWDJRaWdpMEh5L09NQXdvdnExRFIrd3l0blJZSWtUd2I1eVlRU2Rp?=
 =?utf-8?B?OTNnbTFqeW9FeWgzVzZUcm9NNVlPaCtPMFl6aXdMWjNhVk1XWkNkazRUVG04?=
 =?utf-8?B?ZkFRUWpKRHZrMGE2VDF1cERuTUF2RFpwbStxSTUxOTQrL0hTcmFoSCtiUzlI?=
 =?utf-8?B?QTZZMGJBTVN1UUZnSjgrb3E5SCt6UURqZmg5WGdqM3U1QXRGVVRlVVZmbzhJ?=
 =?utf-8?B?S1F1ZmV4N3dnZjdYd2pnUmVoazQwNThrZ2pTekFkUWtJVzQxRkg3QT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2544e1cb-5a5e-4ec7-f269-08da1bac0f06
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 11:11:42.8190 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zevk86Bul4qy7vWDblNey4ZCDh0eDHCjIr7NMa4FShXR26uUbXbg7CAwo191TuQNX6n7JxzvBsN125otkU51ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4500
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
Cc: amd-gfx@lists.freedesktop.org, mario.limonciello@amd.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lijo,

On 4/10/2022 11:15 PM, Lazar, Lijo wrote:
>
>
> On 4/9/2022 12:35 AM, Richard Gong wrote:
>> Active State Power Management (ASPM) feature is enabled since kernel 
>> 5.14.
>> There are some AMD GFX cards (such as WX3200 and RX640) that cannot be
>> used with Intel AlderLake based systems to enable ASPM. Using these GFX
>> cards as video/display output, Intel Alder Lake based systems will hang
>> during suspend/resume.
>>
>> Add extra check to disable ASPM on Intel AlderLake based systems.
>>
>> Fixes: 0064b0ce85bb ("drm/amd/pm: enable ASPM by default")
>> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1885
>> Signed-off-by: Richard Gong <richard.gong@amd.com>
>> ---
>> v2: correct commit description
>>      move the check from chip family to problematic platform
>> ---
>>   drivers/gpu/drm/amd/amdgpu/vi.c | 17 ++++++++++++++++-
>>   1 file changed, 16 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c 
>> b/drivers/gpu/drm/amd/amdgpu/vi.c
>> index 039b90cdc3bc..8b4eaf54b23e 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/vi.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/vi.c
>> @@ -81,6 +81,10 @@
>>   #include "mxgpu_vi.h"
>>   #include "amdgpu_dm.h"
>>   +#if IS_ENABLED(CONFIG_X86_64)
>> +#include <asm/intel-family.h>
>> +#endif
>> +
>>   #define ixPCIE_LC_L1_PM_SUBSTATE    0x100100C6
>>   #define PCIE_LC_L1_PM_SUBSTATE__LC_L1_SUBSTATES_OVERRIDE_EN_MASK 
>> 0x00000001L
>>   #define PCIE_LC_L1_PM_SUBSTATE__LC_PCI_PM_L1_2_OVERRIDE_MASK 
>> 0x00000002L
>> @@ -1134,13 +1138,24 @@ static void vi_enable_aspm(struct 
>> amdgpu_device *adev)
>>           WREG32_PCIE(ixPCIE_LC_CNTL, data);
>>   }
>>   +static bool intel_core_apsm_chk(void)
>
> If this is only for Dell systems, use DMI_SYS_VENDOR/DMI_PRODUCT_NAME 
> to identify the platform information from SMBIOS.
Not sure, the report issue was originally for Dell system but may occur 
with others. This is why I just check CPU info.
>
> Better to rename to aspm_support_quirk_check() or similar, and return 
> false on is_alderlake() or is_dell_xyz();
>
Ok, will rename to aspm_support_quick_check in the next versin.

> Thanks,
> Lijo
>
>> +{
>> +#if IS_ENABLED(CONFIG_X86_64)
>> +    struct cpuinfo_x86 *c = &cpu_data(0);
>> +
>> +    return (c->x86 == 6 && c->x86_model == INTEL_FAM6_ALDERLAKE);
>> +#else
>> +    return false;
>> +#endif
>> +}
>> +
>>   static void vi_program_aspm(struct amdgpu_device *adev)
>>   {
>>       u32 data, data1, orig;
>>       bool bL1SS = false;
>>       bool bClkReqSupport = true;
>>   -    if (!amdgpu_device_should_use_aspm(adev))
>> +    if (!amdgpu_device_should_use_aspm(adev) || intel_core_apsm_chk())
>>           return;
>>         if (adev->flags & AMD_IS_APU ||
>>
