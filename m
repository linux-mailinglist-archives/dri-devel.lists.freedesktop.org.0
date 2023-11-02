Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFF57DF89B
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 18:22:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC4A10E957;
	Thu,  2 Nov 2023 17:22:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::60b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A475C10E957;
 Thu,  2 Nov 2023 17:22:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=huigqPK6waBTAAiFUdlWspUcht+5/NNlvsgfvX2p7q3qcNv1FNoIen0nGWlti3aDW75NqtkmyOVs0akkWPziusnjgt/Tg/TtgK47r7CI5EQlLWLNQgSjuIjaODp38pjee6DYiSsIMFFjwteB/h1QR8ejouocfQbYfiQ0CyXJAWRUQhvRWZhH+ehAI9W2vIuTfBDpVeP0J1uC1KNOhWfayKoqe704C7AbDVaH+z2PUOtoAfmsoQ+3bnv8kuzd1g9DhPGwhHk862dUQ1SlWuuFx52Jd8rj18awbuqh5ePZhXcb9WIOSk3iKGmbJbiSMHnZXXpcuQ66gtgMniKTE55AqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GVNRpM4/P/YrdKoI1l7hEM8SleOGsA9egsFVV71gVTw=;
 b=RoM/spRmwtxB4VktKQU7GSJCgwaOZu1p8H3guFR2e/80hpslcXkYfPyHgOoWtBO4xub1Wrwq63uzxhvuiNTFtolJTGr1LcdUW7N/fBi/ANTqs4Yx7SKkBprvsxiZlP/iTchgjVX/5rBnutZeeSjUuaTINyh77HVpCIe94P7F+PwcM9nvRlzFBU9t0ua/i73tiKIcFpo2k+0quDksasfIbNA6pwQhKtY2OKnnTn2n0SuuUYounulgfkTXlkMao13fTihiUK/fiJsRy4Z24B0ln5dXWm7mTqyYvXWhTAOe2SGGVhdoOr5yaipP6ULBJ7/fuN/r9kJYS2lAnoGm0bzbxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GVNRpM4/P/YrdKoI1l7hEM8SleOGsA9egsFVV71gVTw=;
 b=ehOwOJtgiZUew/ltVWS9KVSMcRFA5f13ES62NHfiHsP8ldRioqAUJzOrn/ORKudRC2/VxR3jYGl9HZ0hhG4bj2zfdtCSA4vkWI/OwcGAx6XxWfrc6xpTTg5y9IxtFKn1/lnZhpW23tigPMpWfFLgEWO7SdC/AU2IanDYgHT3E28=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 IA1PR12MB6355.namprd12.prod.outlook.com (2603:10b6:208:3e1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Thu, 2 Nov
 2023 17:22:30 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5588:7117:d54e:9466]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5588:7117:d54e:9466%7]) with mapi id 15.20.6954.019; Thu, 2 Nov 2023
 17:22:30 +0000
Message-ID: <5b63349c-4e37-47ad-bbc9-723e93e171a3@amd.com>
Date: Thu, 2 Nov 2023 13:22:26 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: Increase frame warning limit for clang
 in dml2
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>
References: <20231102-amdgpu-dml2-increase-frame-size-warning-for-clang-v1-1-6eb157352931@kernel.org>
 <bb3b74c8-8ab5-472c-84c1-8aa0d8bfa3b8@amd.com>
 <20231102171237.GA1184739@dev-arch.thelio-3990X>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20231102171237.GA1184739@dev-arch.thelio-3990X>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0346.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6b::16) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|IA1PR12MB6355:EE_
X-MS-Office365-Filtering-Correlation-Id: 97ace4eb-de14-4115-31ff-08dbdbc84b1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3W7vwnTD0+M9dH03x6JtAlNX7IsJMJaTfRT35/hevtbjHaglCnHJc7TxfUtt347pzR0WDln8Rm2oSiuE7yU7griQYTn+In8gHoEF9cUSQ3++C7ceZwxg1ojVFID2BAhNbVzG+MsF6cQJ4ZLLQz45UL/+9HXlNYRh8ULmpXzlNPgAnwGjRRvqDyx1jWXQRbLmPG37sgslID3z409cqAELykCj2kctQJUNj7U/Mk9h8xrYv7fJJwQtfXHG9ovzeWGo2puK5BO7KyYG6BtMG0ACpdBevKoag98h52tGmCy4GkQOjepPvtg+ZAyyd4uhWNZGkYshqsZNwS6Bsw+/A7fachvrjrIZUHiXGd1PltzmppeJySx2N4Fp8Fn4vzSWNGJqL8nuMoEkfmvNCIjWFyL/hV3jk8kHAbVm4rU0zlBG609u8nWkiruky6bqn2GBFqWXIOWG0PdolR/ujuN8gOYuww4BrU4ywPvuS8V1pddv6kHEBY4Q+qD9ieip2VKRQfAeFTKuOoL3/Y9VHuF9IaSwjdsqsjgPocHklnZ8xhc7x27/H9W43X8s6p95wurQmvpzl5zWWxjcxyrYnrfam0PqCN72bH/+X9qAY0pwc1QX958L1VcIIEWeqbvYxJXH7rkAZb/VOCSQ/XSvBSPrc+yJwDAN2HOtDqu1d+LmyqUSc7/fgDDwS9/LA6KMv2L2Y3mU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(39860400002)(396003)(366004)(376002)(230922051799003)(230273577357003)(230173577357003)(64100799003)(1800799009)(186009)(451199024)(31686004)(26005)(2616005)(6512007)(38100700002)(36756003)(86362001)(31696002)(2906002)(6506007)(83380400001)(478600001)(53546011)(6666004)(4326008)(6486002)(966005)(8936002)(66476007)(66556008)(6916009)(316002)(5660300002)(8676002)(41300700001)(44832011)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2wrK0RuWmNTLzlZeW5Yd081eEdwUWU2YmoxaGx0UjFzTXJoeUEzZmRvQmZL?=
 =?utf-8?B?b3ZucEtLVjVEcitKRkphaFNIdHJ1cFJxL0VPOVdrOEprRkc4cXVzRlpQa0p1?=
 =?utf-8?B?QnYyT2VmcUc4UWJYc2JsU0RRVDlNazliZWNTUm9jaU5tVzFkM1VqSFlGRzd0?=
 =?utf-8?B?UDB0Q2IvcUhVUVQwR29xckpMUlZyOXFweDcydEU5ZFpZSkdTbG1wRDNrMG81?=
 =?utf-8?B?TW11Wm9YR01BMjdMWEFjc1RTY1o4VTEyWHpaVWFta1g3TXJER2owbk44Z3J5?=
 =?utf-8?B?NElwMVBuaUhXUXl4Tk1OaEdZZDBMcWlwRTdKalJIS2V6dVVUNkZERFlFRVpl?=
 =?utf-8?B?ZFoya2xySDBEc3VkNFEzbWdsSEtTR3NEQ244b0FweFlhQUZBYXQ5cG1WaEUv?=
 =?utf-8?B?ZkwzVHFFT3ZqcDFmMzlLRnFLbjB5aDNvaElXL0FvQVR1bTVEU3FaYW9JcVVX?=
 =?utf-8?B?ZWI5MkN2bDkvdUJSVldHRlRSbFg5ak52MGlIL2VBYlordlhkZkdybURoNzV6?=
 =?utf-8?B?MmQ2d09QUGM3bjNpcTkvUXA2VmVTNzdzRlVCZytiOWhjWHRmRzB2Rk51WXZE?=
 =?utf-8?B?ODh2eFBvam85dXpLdm02ZDNxNXVUakZDc3EvdThSeE5PU3JLMTFWMkVFQThE?=
 =?utf-8?B?dkh5c01NT3k4Rk1jOFJuVHV1OXNubGdaQnd5emxpWHFvM1pVbkRKeWgwSjBP?=
 =?utf-8?B?cE5TM0krbkpDUzFCVngxZGxSV21VdjRBUVNzTlpSUFc2QzZ1NmM5bmRVUGhs?=
 =?utf-8?B?VHVOU0RUV3U2QWUxdHhod1JpQ3V0S2wwVE5zVHd4ckZHK1YwaUNFelZqR1h1?=
 =?utf-8?B?eVVMaDlWdjNLTWZITHB1ZnpkVitSVmhUSEdXUHJCNjN0Nm5ZVHNweVUwVXVJ?=
 =?utf-8?B?RHNlMXZQclRLdldDSVVJTjc1WUJjTFNNb2NEbG5RVUJJb1BTZXJ5M1lzeXJm?=
 =?utf-8?B?U0pEZjB4ZWZYNERDcFl3aUhObGJaWWwrRTJjZTlHemtCZkgzd3RrTmdkYURH?=
 =?utf-8?B?MndiZDJCZGZjNFllUUpZRnBhK011aXV3c0YzVjZkeFJwZlh3UVBKL0RJc2lV?=
 =?utf-8?B?L01zemdvdVg2emxwMUhhNnlPS2VGaFlQYjhOejZQUFlCSDRkT3Bad1BNd1VP?=
 =?utf-8?B?ejMxYkRqUmtVcllOcGZmVlh5U3Vwek5UeTJsOVhXWkFPZ29TVS9wbEI4dHdn?=
 =?utf-8?B?bG10RCsrNEFIc2txaFU3WHhxK3NYY1dnRytJMDNGbHZNS1FKZ2thazJpRnlI?=
 =?utf-8?B?THkwV0hlVW9NY2x0aUR0VXRUdkRTNlNoSUlDT1p6Q3hzd2FJRDFzdGNNYnQv?=
 =?utf-8?B?YnB2OEs4UWc4U1Rzay9WaThiS1dST0JpV1A2ZFczdW1UMlcyNjJ4VVgrSTVR?=
 =?utf-8?B?RSszRVJLYmNudHFLcjNibTF2UGNTeG4vRVV4TjVLcWppRHlNR0NoZEF4alFh?=
 =?utf-8?B?YUFHa01reUI2eVF3bkJzVjdPNmMxeHlJTzJlNEwvZ3RIUXM5V3IyR0FiRnFl?=
 =?utf-8?B?Z0orcjdmMHNPNk55SDBYb2VXZHdiUDlnbFhxS2Nlenh4L2VFRVNSblIycnp0?=
 =?utf-8?B?VmpCOTRkcUNlL2YwRkZsZVRyRlkxcElaT2VhUW54VEk2QSs3clR3Rm5jbXlj?=
 =?utf-8?B?c1NpQVdvYW92bWxleVZmMWlIU20yTUc5KzlQVERzOFhKU0dkLzhHZDJLcFhv?=
 =?utf-8?B?MzJKRnI3RXZ4a00wajdoY09EWU50Qktzam1nbG1pRS9JTWhLRS9JMUo2bDhn?=
 =?utf-8?B?OCt0MW1RU0FXTE5yVENZNzJObTlsbmxUUEJzY2FJdUVlZVhENnVMOEtNdlNW?=
 =?utf-8?B?THo1WmYwT0pTSFJJZmlJT09RM1l2Q2VaZjFwNkVZQWpPWXkyUmYxeXhodXhI?=
 =?utf-8?B?YnlranRpTEZDTHFuSzNoSVZxZC8xazNFa1lkUktXYzE4UHRpdkpTVExmWjMv?=
 =?utf-8?B?VXZpeldOcmNjVzd2a2NKNlQ4WEFqczgzWmNQaGkrMXJsbmNLTUtjRzJTUnUy?=
 =?utf-8?B?eHVSYnJUcm8zcmNpUjcyTGRXU3ZsRDRRNUZEMzhVNWtmaUxhemxLTUtOdDRv?=
 =?utf-8?B?VHNpOUZSeDlLQ3JSWm1GRTFDK3IxUjNnMVJSSHBlSDZ4OEpiMzd2ZlJmWEhi?=
 =?utf-8?Q?y8sXENWP5hruisyJ7bHtUzNhi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97ace4eb-de14-4115-31ff-08dbdbc84b1b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 17:22:30.3968 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MUW4ZsxNWn3H4nw/Oen1c6iNUQAoDS4F3QNdY192KUyk4FY/TCn/RrRDHWw6kUQ9kW/AzrqRWYX/GvVJvhzfyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6355
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
Cc: ndesaulniers@google.com, llvm@lists.linux.dev, sunpeng.li@amd.com,
 trix@redhat.com, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 patches@lists.linux.dev, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/2/23 13:12, Nathan Chancellor wrote:
> On Thu, Nov 02, 2023 at 12:59:00PM -0400, Hamza Mahfooz wrote:
>> On 11/2/23 12:24, Nathan Chancellor wrote:
>>> When building ARCH=x86_64 allmodconfig with clang, which have sanitizers
>>> enabled, there is a warning about a large stack frame.
>>>
>>>     drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:6265:13: error: stack frame size (2520) exceeds limit (2048) in 'dml_prefetch_check' [-Werror,-Wframe-larger-than]
>>>      6265 | static void dml_prefetch_check(struct display_mode_lib_st *mode_lib)
>>>           |             ^
>>>     1 error generated.
>>>
>>> Notably, GCC 13.2.0 does not do too much of a better job, as it is right
>>> at the current limit of 2048:
>>>
>>>     drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c: In function 'dml_prefetch_check':
>>>     drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:6705:1: error: the frame size of 2048 bytes is larger than 1800 bytes [-Werror=frame-larger-than=]
>>>      6705 | }
>>>           | ^
>>>
>>> In the past, these warnings have been avoided by reducing the number of
>>> parameters to various functions so that not as many arguments need to be
>>> passed on the stack. However, these patches take a good amount of effort
>>> to write despite being mechanical due to code structure and complexity
>>> and they are never carried forward to new generations of the code so
>>> that effort has to be expended every new hardware generation, which
>>> becomes harder to justify as time goes on.
>>>
>>> There is some effort to improve clang's code generation but that may
>>> take some time between code review, shifting priorities, and release
>>> cycles. To avoid having a noticeable or lengthy breakage in
>>> all{mod,yes}config, which are easy testing targets that have -Werror
>>> enabled, increase the limit for clang by 50% so that cases of extremely
>>> poor code generation can still be caught while not breaking the majority
>>> of builds. When clang's code generation improves, the limit increase can
>>> be restricted to older clang versions.
>>>
>>> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
>>> ---
>>> If there is another DRM pull before 6.7-rc1, it would be much
>>> appreciated if this could make that so that other trees are not
>>> potentially broken by this. If not, no worries, as it was my fault for
>>> not sending this sooner.
>>> ---
>>>    drivers/gpu/drm/amd/display/dc/dml2/Makefile | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/Makefile b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
>>> index 70ae5eba624e..dff8237c0999 100644
>>> --- a/drivers/gpu/drm/amd/display/dc/dml2/Makefile
>>> +++ b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
>>> @@ -60,7 +60,7 @@ endif
>>>    endif
>>>    ifneq ($(CONFIG_FRAME_WARN),0)
>>> -frame_warn_flag := -Wframe-larger-than=2048
>>> +frame_warn_flag := -Wframe-larger-than=$(if $(CONFIG_CC_IS_CLANG),3072,2048)
>>
>> I would prefer checking for `CONFIG_KASAN || CONFIG_KCSAN` instead
>> since the stack usage shouldn't change much if both of those are disabled.
> 
> So something like this? Or were you talking about replacing the clang
> check entirely with the KASAN/KCSAN check?

I think for the time being replacing the clang check with a KASAN/KCSAN
check would make more sense. Considering that, the allmodconfig for older
versions of gcc is also broken (see [1]).

1. 
https://lore.kernel.org/amd-gfx/CADVatmO9NCs=ryNg72HNzMDpqg862gpGnnFhQ4uwTpEkjOkCLw@mail.gmail.com/

> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/Makefile b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
> index 70ae5eba624e..0fc1b13295eb 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
> @@ -60,8 +60,12 @@ endif
>   endif
>   
>   ifneq ($(CONFIG_FRAME_WARN),0)
> +ifeq ($(CONFIG_CC_IS_CLANG)$(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)),yy)
> +frame_warn_flag := -Wframe-larger-than=3072
> +else
>   frame_warn_flag := -Wframe-larger-than=2048
>   endif
> +endif
>   
>   CFLAGS_$(AMDDALPATH)/dc/dml2/display_mode_core.o := $(dml2_ccflags) $(frame_warn_flag)
>   CFLAGS_$(AMDDALPATH)/dc/dml2/display_mode_util.o := $(dml2_ccflags)
> 
>>>    endif
>>>    CFLAGS_$(AMDDALPATH)/dc/dml2/display_mode_core.o := $(dml2_ccflags) $(frame_warn_flag)
>>>
>>> ---
>>> base-commit: 21e80f3841c01aeaf32d7aee7bbc87b3db1aa0c6
>>> change-id: 20231102-amdgpu-dml2-increase-frame-size-warning-for-clang-c93bd2d6a871
>>>
>>> Best regards,
>> -- 
>> Hamza
>>
-- 
Hamza

