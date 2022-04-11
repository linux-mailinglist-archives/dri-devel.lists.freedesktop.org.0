Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD544FB103
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 02:28:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E286E10E2BF;
	Mon, 11 Apr 2022 00:27:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2062.outbound.protection.outlook.com [40.107.100.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F005810E2BF;
 Mon, 11 Apr 2022 00:27:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b6EOn+ADnI2ko3Y8NAiavKhcWUUlap9GLR0XY6dhFcZAN3xT6nJfrCzgqtebmk1w2+JD3XTTaEfYlrzqfKJL9ZoEPRoXqzQFFw7gRuM8yIqVrIR9P/QAdzHy+DzaMddJcFlGdwb+BIuFArRAHYmMYLc/riDMv2SZtE8WX5NSNn4BX9JLWK43DjyxQy4u7D8+nqvALEMK3j93EzvVkEr8gdXY7jwbPjM9fZm83M+NbzYzdPDUMbqI2m4/Sxb5GOPnnlaIuxdMnvxxGRBYZ1TxLPaTuwF/lBSpVN+4MHy/ltfS2Rmr97klD8E3K1EYfNLPo7F8Ly6rsnDoPRbP1jq5uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XY+PuP6qKwkVFTZEMd/z8ietOjVRpdwwYmdSk/Sc6jg=;
 b=XHxVOR/AR9a5D1qJIVjpoKzwIPx68csRBP73jAxgjXWqQqT5XWNeI1x2gwhNm8Pkh3tagLo1zCEKkG8hiL1vbuLUfHwqLY4cEHv+vuAzI1J7k/m55q0VM0fs9L0r4LYgHoASCqTU7IlyR9Pl4k3xQ0Eg9X0VRMmWAoCDuDEoc3SLBTo+K+SuzsQioBqVbecxKZ/WYRLYIBSpMBbAM9jgj4LpR4YC02LYtt8G5fNS/jKGPG7OXki5LWAttL2QeEbvIuWH7CFfyvadjLOW6mVt1ULR9Xj0T6Ecv16rqbsvxFMSnOcZDIkhtzsxJ+pc8q7jwdhxbyTs3ROn/wpaMnHbBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XY+PuP6qKwkVFTZEMd/z8ietOjVRpdwwYmdSk/Sc6jg=;
 b=m6FZtejmrtF5VPZmluBFRCFzSsYq8r40B7f6Adp9jovuSpAQstpIcHZyf93Yl9ZvbOSMzASkchgiFbU4aGy3xOW3N4Nd9Nz0VATKYsvx80jmZD05Z2u4sNg8WkmGwUSujZE7pRi4JyHpNEjr02j9+o1hWJEwMKYFbPXMOv9CImI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4526.namprd12.prod.outlook.com (2603:10b6:806:98::23)
 by CY4PR1201MB0072.namprd12.prod.outlook.com (2603:10b6:910:1b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 00:27:53 +0000
Received: from SA0PR12MB4526.namprd12.prod.outlook.com
 ([fe80::7ceb:a37c:cd60:9d5f]) by SA0PR12MB4526.namprd12.prod.outlook.com
 ([fe80::7ceb:a37c:cd60:9d5f%7]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 00:27:53 +0000
Message-ID: <45ea5705-71d6-4008-f094-1aa902e5cc41@amd.com>
Date: Sun, 10 Apr 2022 19:27:48 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCHv2] drm/amdgpu: disable ASPM on Intel AlderLake based
 systems
Content-Language: en-US
To: Paul Menzel <pmenzel@molgen.mpg.de>
References: <20220408190502.4103670-1-richard.gong@amd.com>
 <44354d78-b340-fbc4-fd6c-060d7ad3404e@molgen.mpg.de>
From: "Gong, Richard" <richard.gong@amd.com>
In-Reply-To: <44354d78-b340-fbc4-fd6c-060d7ad3404e@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR11CA0027.namprd11.prod.outlook.com
 (2603:10b6:208:23b::32) To SA0PR12MB4526.namprd12.prod.outlook.com
 (2603:10b6:806:98::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 522923ca-27d3-4fe9-64e7-08da1b521dec
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0072:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0072AAA035572DE6BC5042F895EA9@CY4PR1201MB0072.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P+q5xh/160CKMZDfnOJihWupI+ACfv4hJeRY0TfqtZsgEOg4ZDvaBEGTyhZXibckoMuY6g6435SEWmVDn4qa+vXiJL1Nh9fZBWtEBjV6OJnde/6wZBgn1mXI6yXqynoSOA9Ta4tE1oCkS0q3MVFmOYbpI21Zf0JhSViy+vvodeJ2HKsUWWI/fNjiTtkcIhR3qT9ghEGhXbJAh8DC8UgTm3Vmxk6hyCwbC5t9PZUXRPHVPTVHOoqO5hrWb9gySG295foceExz8FUCR13UAG819pcwMyviNDpN3Up49G780cj28plozfpRYSPE+mUnsbWpGjHaZzJPh7gr8EBMedGMmxpSXv/YSNmpktD6moBFSKooSHic2qZoRLmTsZ0rU0fJ/hHnrpAzMA3Pn5d31sh5Bb7TRnbZAvrUDq1e9jVo8k5ApAix3xaIiedcE4DBGuQLARhgICrJxRRrdkJKhKN7+cUGBD7XcS0atgBs2uwb5eaJJ6wKVz5hTFISk6E+mpbLTCb82e0Jz8EavnQe3/LKRAWQL77cEHgoUW4BOFR+ge0F42Fj/hO62W1rZVtjyC7y07op6mi2jdP07reF/a/EGjIptWE+uP3Ln9CWE3xwEbC10fB5EBE1Q3+767VdnOcThDZlxaPXIRThhYOp7iJxkOtdC+d5eKkGZ1K37SyWZpdoEbYgAVSeTUnN9j6jIxhVNzj3k3slZH/2ZV6X/YqbDkgs3ZFBOgRUW4mSRgDrOds=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(966005)(6666004)(6486002)(45080400002)(6916009)(2616005)(36756003)(508600001)(83380400001)(31686004)(66946007)(4326008)(8676002)(66556008)(186003)(38100700002)(31696002)(86362001)(8936002)(316002)(66476007)(5660300002)(6512007)(6506007)(26005)(53546011)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmJuQ2p1RDc0czJKT3FqK05yaTY2VFFXK2NUMU1KbjNucWxvOGNJUmdoL1hK?=
 =?utf-8?B?aUNmT2VvcW52aWp3bUZzLzZaS3VHelRCdGVYd0JyWFhXWGo0dGJMSUcxbkll?=
 =?utf-8?B?SzlWRk16Y2JDS0dNaTRYYUxjMDNJVU9zaXFrbXRmaDR4Y3lSV1FvL2QweWpR?=
 =?utf-8?B?VkM1S1NOVVhBUEVGQkE3UGR0ZFdxT01kQkRmN3FlUFJGcUVhRXB0NWZ3UjJp?=
 =?utf-8?B?b0lySG5jTFcwSFIyRzFQZjBhSWJlTFEwZ0RPcWtoTThiaVdzWFBYZHNhSkFK?=
 =?utf-8?B?N3ZKKzJOU2NZVml2NC8zaEM2c0ZLY0xSV2p0MVlyVmJEc01mTXlmN0VXaEpy?=
 =?utf-8?B?LzhuTkZuM1RFZjROKzV4QXp3S1dCZDZPSjJ3SzdsK0haV1dnOTd1QXZGZnJY?=
 =?utf-8?B?RXR6YWFDTnFTcWV2UWRRYUJFWjhCR3hsZ052aUdUUDN0QUNKSC9wNG1rY3Jw?=
 =?utf-8?B?QXdPMkZMRURrUTdYUDBqWnRHa1ZNQmg3TmoyOTBuSFF3SDh0SjRjdkVmcmI0?=
 =?utf-8?B?UjNFS3F0LzQ0K2FLaXZkeFhsMUlsMGF4UklsVGlYZDBoMVZ2TXlOU3BmR3Nv?=
 =?utf-8?B?VUt3aE5kUlhhT2xUV1paSEYvQU92RndSSzErSS91L1JkT3JWV3NyTmJBN3d0?=
 =?utf-8?B?REZOQkZ6eUxlNTUyU3Rvc3p5RENOa3cyNWdyTStUby9sSVNuUkgzOWhwSExU?=
 =?utf-8?B?d2dsVC82VzcybTZIVXppdFNvelRSVithamxldGI2OTd3U0N4eHNWUWNnMGEv?=
 =?utf-8?B?Q0dNOW1iYlNQYzZwdEFpaEhIN2xuaTZtcStvaENQa0lmdDJCTStIV2M2UU9E?=
 =?utf-8?B?NXl5dllsSzJFeDk1VnBKZXZzRXgyS3VoTHJWbXc4cWZhU1RNb0hKK243Nlha?=
 =?utf-8?B?U09zNUtxS1hkMjQ1WTlWT2w1azYvdDFGOE1XMi9wU3ZGQS9IR0NoR3BZODR0?=
 =?utf-8?B?QnZ3VTl4ak5EQ1k2OTVIVXlmd0VSeVFuOWEwZ1RtRVpmdnhKb2ZNZGNqcjc5?=
 =?utf-8?B?eTZoclBlTWRJa284Nm55TGl2UWlZV01XQ010dENEMjBlMHd4cVV1OFpLa2x5?=
 =?utf-8?B?bVNseHN1OVdXWFovU2F2VXFWUThJL0tGaXR6RG9nMzdXUmhJcXZETEtCT2x6?=
 =?utf-8?B?aUVoQzJoQk85T2paMTFMRXhnVWh0ZW1Oa3dMYkhLYlE3aFBsM1Fnd0MwWjVX?=
 =?utf-8?B?ZUdwbkw0Vkc5T3d1cEZOQnBOMEdoNUdXYmgxKzM5clZNVFp1VkUrb0JLcWJ0?=
 =?utf-8?B?MjNaSkxISVFoaVlrWjVuWTFoK3lMZzIvdHdielBmRmhBa3pnckQzMkJQSGpr?=
 =?utf-8?B?OFF0eTc4WkdGTjcrT25oWUI3R0pqQWRWRlliNnhVQStaRm1BdVpSaExXaXVO?=
 =?utf-8?B?T0lySFE5bGxFcERmOVRGanBxVWcyNHJHL1pFa2Zzb0VNdEtkRTB2SlJ1RmdZ?=
 =?utf-8?B?ZkhiYWZib1Z4Mk5BUzRKcFJ3K2NxcU5wVmE3ZjJCdmdiZ3Y1SzgzbHZMMVZU?=
 =?utf-8?B?YTNLZUg2VmsxcWZyV0YwdG93WithNVNUNWJMN21MRU1Tc1V3WEd6L283eXhy?=
 =?utf-8?B?OXdOMytJWmU4RkNhdjNsbmJaZHlKdkV3QjF0Q09tNzRQQTlteHVHNjdNQkVs?=
 =?utf-8?B?aEY1V2gvYlFwYVNlWkd1K0pzMGZ4WlFZZGU2M3JXbmF0VUR1aElBNkdmSGZ2?=
 =?utf-8?B?WHF3bzdSaTdqRjV2bExkQlBCYTVGbllwME1Kc1JhMW9ud05TQW1wV2doR3RM?=
 =?utf-8?B?LyswYlVpRy9SMkRqOUZ6TXljelN4d1Roa2pNRDQ4NHV4WkhLRHNsM0cxdkRu?=
 =?utf-8?B?eWw5Qk5NUUZ1aFRyczhmdkFwVUZSTkFlalUyR1QvOFdPOENQWDZnSjZ1RktY?=
 =?utf-8?B?bFZJYXR0MG16dWV2SkJsN0NJNnBhcTY0RE03eFB1YmhvZk8wdm40dTlKOHVt?=
 =?utf-8?B?eDdlRnkzd3ZNU0RLYmhoK1dBbmpaRVhwRkZPWDBYTUh1bEwxaGhxeEJSTDNX?=
 =?utf-8?B?S2pjT3F1S0ZvNlhtVDhBTjBOSzhobHRPVHdOdjRRdHRGajdxVit6SWFsL3NS?=
 =?utf-8?B?SHUxK3NlMFZoM0tMWlZPY00zRFpzbkUxWTBlbUd4MVVoNUtNNXVnTHVwUmtY?=
 =?utf-8?B?dnljbCtwc3l2VUorK0xhMFpHK0RrYWZMbmVXL1dLRm9wcjdWL1NrZFdNZkZF?=
 =?utf-8?B?aFZsMXRHeUF2S3M4TVVCeXZnY2d3aExaZWtuSnB2TWFMR0NNU21MRWFiOHBE?=
 =?utf-8?B?aVNsR1hJYzJuQ09YcGRLdklPMkRSMWw2TmJ5VkxPQ0dSY3BYbm9DaER4bVBp?=
 =?utf-8?B?dnVkNy9Kd3RGbFBKT3ZiWGtYSTZnMEFMTHl3NTRhenZsOHVmeCtBZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 522923ca-27d3-4fe9-64e7-08da1b521dec
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 00:27:53.1846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FfBO3ffe/FtIoh+/myNf0Idse83RDha443O6nq5p/yqvR2nN/88lGXCKzqr6RMgabcf6fa0EgIirM4ZtTiNwSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0072
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, xinhui.pan@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 mario.limonciello@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Pail.

On 4/8/2022 7:19 PM, Paul Menzel wrote:
> Dear Richard,
>
>
> Thank you for your patch.
>
> Am 08.04.22 um 21:05 schrieb Richard Gong:
>> Active State Power Management (ASPM) feature is enabled since kernel 
>> 5.14.
>> There are some AMD GFX cards (such as WX3200 and RX640) that cannot be
>> used with Intel AlderLake based systems to enable ASPM. Using these GFX
>
> Alder Lake
will correct in the next version.
>
>> cards as video/display output, Intel Alder Lake based systems will hang
>> during suspend/resume.
>
> Please reflow for 75 characters per line.
>
> Also please mention the exact system you had problems with (also 
> firmware versions).
>
>>
>> Add extra check to disable ASPM on Intel AlderLake based systems.
>
> Is that a problem with Intel Alder Lake or the Dell system? Shouldn’t 
> ASPM just be disabled for the problematic cards for the Dell system. 
> You write newer cards worked fine.

There is a problem with Dell system (Dell Precision DT workstation), 
which is based on Intel Alder Lake.

ASPM works just fine on these GPU's. It's more of an issue with whether 
the underlying platform supports ASPM or not.

>
>> Fixes: 0064b0ce85bb ("drm/amd/pm: enable ASPM by default")
>> Link: 
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Famd%2F-%2Fissues%2F1885&amp;data=04%7C01%7Crichard.gong%40amd.com%7C6b94ff2249244c04974e08da19bea71b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637850604066094079%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=%2FiF%2Bnwzm5RlClT%2Fv%2B0RJvmVwsc%2FiwV3jCiFq7PB84wM%3D&amp;reserved=0
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
> aspm
s/apsm/aspm in the next version
>
>> +{
>> +#if IS_ENABLED(CONFIG_X86_64)
>> +    struct cpuinfo_x86 *c = &cpu_data(0);
>> +
>> +    return (c->x86 == 6 && c->x86_model == INTEL_FAM6_ALDERLAKE);
>> +#else
>> +    return false;
>> +#endif
>
> Please do the check in C code and not the preprocessor.
followed the pattern with other upsteram drivers.
>
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
>
>
> Kind regards,
>
> Paul

Regards,

Richard

