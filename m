Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 901867839C5
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 08:13:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A85F10E2DC;
	Tue, 22 Aug 2023 06:13:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4FE310E2D6;
 Tue, 22 Aug 2023 06:13:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQUIfzYO/d4cE6BIuyQ6qI+L2zu/KUCoLoV95AuTRCTiHOGlwnMyNfEMgjBc0cYBIn1wD1U9NsXlK2XtjaHFcGbVGj7+PsF1NKDnYActZoB52G51il7iV+CVrsgx61gBAThxl46LEtqBl0PovvnxHNfq0v8Ygs+3QYy2Zf2uHowmyf7GMg5mAGNPzZ6hyP2Z7dm8UXFU9u671MuQoA4ADUwNuI/cyXK6JmJu552lJZPqdJAQxhf85iqqSjx6YP0Bqbq5t8UZuGsOuhqI1+kHZd6964CNC6XX1Rghxm2Hupxr0tPMK+H/3SV1UyAa6NDiLPpJsHETALeJueNw1eR4ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rqQvajFHBnj+YXKq7O1T6nGj43S6SPxplK0nrlK1svk=;
 b=PyfrYTS5BRIcCM6fqOmLeq6nRwdAmVh+hYDwt1/lFoTd/3sVCLgdZccRJ6f2al0yzfvtRvXIwbXAqtmiApdYFSnleUMKchHSAC0GCwiyvigTxExn1eAYEvjO8xAztIsixHYTa6rqaQ6G3wRUrd/IIFTL6BHzLMxdhwnziIVt2BUjCozjax7l9Th9y/n+nvBAy7hkBXLhw2iAgWkJLsQqA6HZAka+BOC4FQsK8pxGGDA13aswFl3bs22l7A0Ibevc7NiTBhRdaLmAMjrr4dXFldX/gh6+txrciz1Y1IUHhQxf55Ii8s2mSIMEveyCUyetCbU6VS0T6hhBWpJ2DWqdBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rqQvajFHBnj+YXKq7O1T6nGj43S6SPxplK0nrlK1svk=;
 b=1MY/s7W/KEkaNoIMUjV4u3rmSMb14K9Fuv4t/trwW9ZLeuIyitWX8CYAQdtIhbtI7PAWN/BeeiNZMs4mjZaiIqEow3zMPjnTR8XNECYWbfcjLQLHpqfV/T2VgWDMK5dwIXjU7/LBtAjVlYAr8sBDjUtxVO9fg77RSa2fNqxYBXs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6000.namprd12.prod.outlook.com (2603:10b6:510:1dc::15)
 by PH7PR12MB6394.namprd12.prod.outlook.com (2603:10b6:510:1fe::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 06:13:32 +0000
Received: from PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::f78e:33f4:56d2:1ef4]) by PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::f78e:33f4:56d2:1ef4%7]) with mapi id 15.20.6699.020; Tue, 22 Aug 2023
 06:13:31 +0000
Message-ID: <cccd1cd1-28ec-5fb0-e3a3-07caa4bf1b07@amd.com>
Date: Tue, 22 Aug 2023 11:43:18 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 2/7] drm/amdgpu: Add new function to set GPU power
 profile
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>
References: <20230821064759.94223-1-Arvind.Yadav@amd.com>
 <20230821064759.94223-3-Arvind.Yadav@amd.com>
 <CADnq5_OBLh=fzsifOEhV3F2F1XGOcCujtVAba3KZ75MkY+tKHg@mail.gmail.com>
 <fff2391b-fc18-af9f-6fe0-7b4c6650dcdd@amd.com>
 <CADnq5_PYYy6D__49h6jud9vpbzhnyHh8wossNmzDqryxkcRnqQ@mail.gmail.com>
From: "Yadav, Arvind" <arvyadav@amd.com>
In-Reply-To: <CADnq5_PYYy6D__49h6jud9vpbzhnyHh8wossNmzDqryxkcRnqQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0163.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::18) To PH7PR12MB6000.namprd12.prod.outlook.com
 (2603:10b6:510:1dc::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6000:EE_|PH7PR12MB6394:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e6978e8-5f0f-4952-7470-08dba2d6e884
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: brSFkvT6l3fix1b2Wh9+ASDeQCcbnpxACZFfudTCM+40PcpF1QHktJOA/ZKh1kM/hzbs+jf2BGh3QAoVIfGSolqGZeor1XlqaJqhnj5dMN7iJPDAqEuWDX48S0/vU/MxMYhrGaFk6uRVKqE6Jb1xl4tzaaKxU8gv7LfXFrjWeFN6EguvRbwJAMgKQxNsUb4QHk1ka2GAXzvYcTGZ6kfjIKByV7YJXww5XG50v7gx0WIbV4gXlXjcTTEJRGJU9SNdXRMqlXdX21DK+u+b7UMNZo8QPEdLuyLZHKPGUnkw1bCcMmkA9CphBX2CQQEfsQGhqsqnO1ukWICiOKfKQUA2c/4pzmBBT0uSQxJrMZQuN+3J+fzVo7IWxn2Yi/R131cnBNOh0OxkLQL2UmXCqjWzOF86EgRSYwmwK08gZ9mzRdPGLQqkBsfQW3ehh6R1iK6UDR0OrubVdrc4PbbWDrFwQRo7bgtdm3aRXXuQq3fd7A3Sv0vWa6VQaIaOn66bdLxA2MD3vmT5Q4RNHli7IcAE44PlrEA5qT+vpD3UZswRU4eO6YDzpAgduvXu+Se6TINafaSt7j9JiflNNZ6HqFQRsEzBNt5uXTN4Cc4sxYuWuMy9lNl9cTH+RHs0r12I/8drVtlZFtN2wNHNydFkAtR8rw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6000.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(396003)(366004)(346002)(376002)(186009)(1800799009)(451199024)(6916009)(66476007)(66556008)(316002)(6512007)(66946007)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(478600001)(6666004)(38100700002)(53546011)(6506007)(6486002)(83380400001)(2906002)(31686004)(31696002)(5660300002)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3FIVkdLM1dYVjBmWUVSRnlhYk81MnRTZGtwcXBFTUFtNENaQkdpZEhQdUwy?=
 =?utf-8?B?WktVbjBpVldSZG40Nk95a2Z1UGc5NVA5SkdJMjV6MWJvNU0zN0JjNjVsUG9i?=
 =?utf-8?B?eWdJc3poMTNnYitWMWxEUUZGbTFkb01mZHZNWngrNVdmZzRLcW16T0pHM1BP?=
 =?utf-8?B?QkswY2lSTHEvMm5la2g3SmJrYmRySDhWd0lRWWlPQm5sMEJkdGlidmIwendF?=
 =?utf-8?B?eHZEUkdIeGdoUW5nQWpUeWdxT25JR2R2TUFPMEFRVGRLNVBqN0wyUWtOVW4v?=
 =?utf-8?B?OG8yM09seUV2dnB0M1U2WWV4em9ZeGsrdytKbEZ4Sy9BaloyRzg3KzNMdXB2?=
 =?utf-8?B?SVdHL29sT0RzbUZIdytZSWd6Q3VpNy9jQTdHVGd0V2JRdFBlOVIrUHU3WnlB?=
 =?utf-8?B?NHhiZ1oza0tBRmNjak5kL3ZZWVJrTlZhckFYRld6ODUySDhMeTgxckt5bmh0?=
 =?utf-8?B?dUljaDYwdnNNU1BmZEc1MVZjMU14am16ZEdDQ0ZFTDR0L1VzeE1ONHA3U3pX?=
 =?utf-8?B?SkFKS0hvSnErVi9Ob2FkeVkyMS8rUmtHMGpkMTdFNG9DSi9hSFc0NTEvZHlM?=
 =?utf-8?B?Q0Q1QW5rOGg5akdqeTRkcVJ6RmVlYmVMdEx2ZUNSV2E4YlRCTmJnaythMkIy?=
 =?utf-8?B?THFvTUNqdXplSVplUnU1alkvWmRlUW5rOG9ZRXU0K204UWxQTzBDdE1XcHVk?=
 =?utf-8?B?YVlCZnJLR09aM29SRkFIb1ZZeXNEOWhtVWErcEJoSWVwZHQrRi9DV1NIYjZV?=
 =?utf-8?B?V1ducjI2RlJ2RXZaOXhDRUZxNVR5UEZtL1U4d1lOOGZsVUphKzJEVkNIb3pB?=
 =?utf-8?B?QWdqdmtGeEdoQjNBN2lveEFZNnRzdXpmUkFKeEd6aEQvOGhkRXA4bzB2eXBF?=
 =?utf-8?B?bTFGVTRzWGdZNldkN3hCa1FQWDFzeHhxRkxNTmorOTNZR0lXR3VGWnJnNzZV?=
 =?utf-8?B?NkRSTmEyMEtmMmJUK3E5anYyVjFPTGc0dDRFQU1FTDExR0dxT0o2SnluRlp6?=
 =?utf-8?B?bk54VHFSTE9KdGV6RW5DNnRVb1lvNy9qZ3JwT09sL3RHR2Q5UE13d0Y3VnRW?=
 =?utf-8?B?bGVvRmtURWNpSmNSYW1BS0hZRmZ1cXlOVlYxeDNzUHhRVU5tVHAvSEN3TThS?=
 =?utf-8?B?VXR0TWRCL3lpRFlQWG5sR3NMZkM3aHZnNVJyZWtYYmxOYnhLMG1Mb1JDRzQ2?=
 =?utf-8?B?WUlxbmd1VVFjK09VY05FQlVvUTYvbENnd1ROSVpBbHZoc1F3Q09SZWJWUFla?=
 =?utf-8?B?K1FwVXFyV0huOWd1aHdUQlJHaHdNY2lpd2xkdzFZZnpLT3JNSGFXZS90azhy?=
 =?utf-8?B?ZWpzM254RFdiZXRPenIrcGpOWUQ3bUlVR2kzc04zbUJ1ZHlIRlY4d2lVaGJk?=
 =?utf-8?B?VCtJTTRUejhwQkE1dStXOHk4MUIyU2JvOXQxQlB0Sjd3Q3RzcjhaMms3eWZR?=
 =?utf-8?B?Wm9GVG1kNUJTL2FOMUdJR0svVlRtWWxDTHNLejlSM2R0Q2x3a044Nmo3Sysx?=
 =?utf-8?B?OVNGTnlHNGxzbFhjck40SUN1S0ZldWd3RDNxSzRUdlROMzNEYmhmNG01dG5J?=
 =?utf-8?B?VGNva2ZhNUpWOXRmaEZ4MDZGYnF4MGgzOC9Ebk0zSDVkU2xEeXhybFBGK2gv?=
 =?utf-8?B?ODl1elJ0ZVJvTnRTK3YvQUVQZnU2QlJpWWp4RURVTjJKNFNDREY2c3V5UEF6?=
 =?utf-8?B?bjl5bzdzejY3cXhSWlpwdWdlTnZnN2w1MWJXbEdRNk8yYzQ4TzJFTVJKYUJ6?=
 =?utf-8?B?SjdDTVlYcnkwMDIxS1NFY05Gd3ZlSHhPcG9EREUycjZRaWF2SGVPMDE4emx0?=
 =?utf-8?B?SmZYNG9zWmdlTTdtL3lFNXpyZUg2Y2FoZGNXWXE1U1J3bmxNaHA0cXpJclZw?=
 =?utf-8?B?ejBKbnducTdXZXJ1QWhqUDBTckFJL1JkcUZmLzhMalVKblBUVXJjaFpqbHhP?=
 =?utf-8?B?aWREWE96RGZNLzNHS0Y2a3RLdnczd29tcnc2UjV5MFJVQk5VRlo3WHcrT0Qw?=
 =?utf-8?B?elYwemZmbzdoendBQ2RmeEtEeWhHQnNNM2luanlYaDRHSStKclh2NmtlRkY0?=
 =?utf-8?B?czlNTWFuVS9mVVpjRFBveTdCaXhBYkZXK0NyMXZKTldYUnpXY3RCOXdaZjRx?=
 =?utf-8?Q?PFMasUCvBfxC2jKd/WkXo9j3h?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e6978e8-5f0f-4952-7470-08dba2d6e884
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6000.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 06:13:31.4921 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iIBzxErC2n64+aybySYVCuwbxEaPd4hKAYAiqjiuUk/3AXty9u+GQLt03XD2yuV4ThmonzRJZxr06UmKoPMCCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6394
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
Cc: dri-devel@lists.freedesktop.org, shashank.sharma@amd.com,
 Felix.Kuehling@amd.com, Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 Arvind Yadav <Arvind.Yadav@amd.com>, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, Christian.Koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 8/21/2023 11:40 PM, Alex Deucher wrote:
> On Mon, Aug 21, 2023 at 1:54 PM Yadav, Arvind <arvyadav@amd.com> wrote:
>>
>> On 8/21/2023 9:52 PM, Alex Deucher wrote:
>>> On Mon, Aug 21, 2023 at 2:55 AM Arvind Yadav <Arvind.Yadav@amd.com> wrote:
>>>> This patch adds a function which will change the GPU
>>>> power profile based on a submitted job. This can optimize
>>>> the power performance when the workload is on.
>>>>
>>>> v2:
>>>> - Splitting workload_profile_set and workload_profile_put
>>>>     into two separate patches.
>>>> - Addressed review comment.
>>>>
>>>> Cc: Shashank Sharma <shashank.sharma@amd.com>
>>>> Cc: Christian Koenig <christian.koenig@amd.com>
>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
>>>> ---
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c  | 56 +++++++++++++++++++
>>>>    drivers/gpu/drm/amd/include/amdgpu_workload.h |  3 +
>>>>    2 files changed, 59 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
>>>> index 32166f482f77..e661cc5b3d92 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
>>>> @@ -24,6 +24,62 @@
>>>>
>>>>    #include "amdgpu.h"
>>>>
>>>> +static enum PP_SMC_POWER_PROFILE
>>>> +ring_to_power_profile(uint32_t ring_type)
>>>> +{
>>>> +       switch (ring_type) {
>>>> +       case AMDGPU_RING_TYPE_GFX:
>>>> +               return PP_SMC_POWER_PROFILE_FULLSCREEN3D;
>>>> +       case AMDGPU_RING_TYPE_COMPUTE:
>>>> +               return PP_SMC_POWER_PROFILE_COMPUTE;
>>>> +       case AMDGPU_RING_TYPE_UVD:
>>>> +       case AMDGPU_RING_TYPE_VCE:
>>>> +       case AMDGPU_RING_TYPE_UVD_ENC:
>>>> +       case AMDGPU_RING_TYPE_VCN_DEC:
>>>> +       case AMDGPU_RING_TYPE_VCN_ENC:
>>>> +       case AMDGPU_RING_TYPE_VCN_JPEG:
>>>> +               return PP_SMC_POWER_PROFILE_VIDEO;
>>>> +       default:
>>>> +               return PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT;
>>>> +       }
>>>> +}
>>>> +
>>>> +static int
>>>> +amdgpu_power_profile_set(struct amdgpu_device *adev,
>>>> +                        enum PP_SMC_POWER_PROFILE profile)
>>>> +{
>>>> +       int ret = amdgpu_dpm_switch_power_profile(adev, profile, true);
>>>> +
>>>> +       if (!ret) {
>>>> +               /* Set the bit for the submitted workload profile */
>>>> +               adev->smu_workload.submit_workload_status |= (1 << profile);
>>>> +               atomic_inc(&adev->smu_workload.power_profile_ref[profile]);
>>>> +       }
>>>> +
>>>> +       return ret;
>>>> +}
>>>> +
>>>> +void amdgpu_workload_profile_set(struct amdgpu_device *adev,
>>>> +                                uint32_t ring_type)
>>>> +{
>>>> +       struct amdgpu_smu_workload *workload = &adev->smu_workload;
>>>> +       enum PP_SMC_POWER_PROFILE profile = ring_to_power_profile(ring_type);
>>>> +       int ret;
>>>> +
>>>> +       if (profile == PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT)
>>>> +               return;
>>> Why is this one skipped?  How do we get back to the boot up profile?
>> Hi Alex,
>>
>> enum PP_SMC_POWER_PROFILE {
>>       PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT = 0x0,
>>       PP_SMC_POWER_PROFILE_FULLSCREEN3D = 0x1,
>>       PP_SMC_POWER_PROFILE_POWERSAVING  = 0x2,
>>       PP_SMC_POWER_PROFILE_VIDEO        = 0x3,
>>       PP_SMC_POWER_PROFILE_VR           = 0x4,
>>       PP_SMC_POWER_PROFILE_COMPUTE      = 0x5,
>>       PP_SMC_POWER_PROFILE_CUSTOM       = 0x6,
>>       PP_SMC_POWER_PROFILE_WINDOW3D     = 0x7,
>>       PP_SMC_POWER_PROFILE_COUNT,
>> };
>>
>> These are all the profiles. We are using which is >
>> PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT.
>> Now suppose the profile was DEFAULT and we set it to VIDEO, SMU will
>> move the profile to a higher level.
>> When we reset the VIDEO profile then SMU will move back to the DEFAULT one.
>>
>> Our job is to set the profile and reset it after the job is done.
>> SMU will take care to move to a higher profile and after reset, it will
>> move back to DEFAULT.
> I guess that is the part I'm missing.  How does the call to the SMU to
> set the profile back to DEFAULT actually happen?  It seems that both
> the put and get functions return early in this case.
SMU is calculating a workload for given the profile and setting it when 
we call the *get and *put function.
When we call *set function for VIDEO then SMU will calculate a workload 
for VIDEO and set it. Now We call
*put function for the same profile then SMU calculates a workload which 
will be lower or DEFAULT (0)
and then it will set it.

Suppose we have called *set function for VIDEO profile then SMU will 
calculate the workload = 4 and set it.
Now we have called *put function for the same profile then SMU will 
calculate the workload = 0 and set it.

please see the below smu code where index will be DEFAULT (0) or lower 
for *put function.

if (!en) { // put function
         smu->workload_mask &= ~(1 << smu->workload_prority[type]);
         index = fls(smu->workload_mask);
         index = index > 0 && index <= WORKLOAD_POLICY_MAX ? index - 1 : 0;
         workload = smu->workload_setting[index];
} else { // set function.
         smu->workload_mask |= (1 << smu->workload_prority[type]);
         index = fls(smu->workload_mask);
         index = index <= WORKLOAD_POLICY_MAX ? index - 1 : 0;
         workload = smu->workload_setting[index];
}

In our case the *set function will set the GPU  power profile and the 
*put function will schedule
the smu_delayed_work task after 100ms delay. This smu_delayed_work task 
will clear a GPU power profile if any
new jobs are not scheduled within 100 ms. But if any new job comes 
within 100ms then the *set function
will cancel this work and set the GPU power profile based on preferences.

Thank You
~Arvind

>
> Alex
>
>
> Alex
>
>
>> ThankYou,
>> ~Arvind
>>
>>> Alex
>>>
>>>> +
>>>> +       mutex_lock(&workload->workload_lock);
>>>> +
>>>> +       ret = amdgpu_power_profile_set(adev, profile);
>>>> +       if (ret) {
>>>> +               DRM_WARN("Failed to set workload profile to %s, error = %d\n",
>>>> +                        amdgpu_workload_mode_name[profile], ret);
>>>> +       }
>>>> +
>>>> +       mutex_unlock(&workload->workload_lock);
>>>> +}
>>>> +
>>>>    void amdgpu_workload_profile_init(struct amdgpu_device *adev)
>>>>    {
>>>>           adev->smu_workload.adev = adev;
>>>> diff --git a/drivers/gpu/drm/amd/include/amdgpu_workload.h b/drivers/gpu/drm/amd/include/amdgpu_workload.h
>>>> index 5d0f068422d4..5022f28fc2f9 100644
>>>> --- a/drivers/gpu/drm/amd/include/amdgpu_workload.h
>>>> +++ b/drivers/gpu/drm/amd/include/amdgpu_workload.h
>>>> @@ -46,6 +46,9 @@ static const char * const amdgpu_workload_mode_name[] = {
>>>>           "Window3D"
>>>>    };
>>>>
>>>> +void amdgpu_workload_profile_set(struct amdgpu_device *adev,
>>>> +                                uint32_t ring_type);
>>>> +
>>>>    void amdgpu_workload_profile_init(struct amdgpu_device *adev);
>>>>
>>>>    void amdgpu_workload_profile_fini(struct amdgpu_device *adev);
>>>> --
>>>> 2.34.1
>>>>
