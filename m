Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7208858186
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 16:41:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DFA110E6AB;
	Fri, 16 Feb 2024 15:41:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YsWR9US4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2079.outbound.protection.outlook.com [40.107.220.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDF5610E139;
 Fri, 16 Feb 2024 15:41:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BzknbsMr9ZMJs+JwF06zKKZxpJ60xW0R8jiGz5CrmkuCtjpTIOWrLjMXrTDklrix5jEHXJ8qTsc0/hYqBySc/FKvFpIy0ZEgoETzm3YwCkA6g5qikQqaBBGfnrKnA+kPLmpNE44poJYpLGZtxQrc5ztUyFLSJY0MJFKv4GznVDBJvu7G5ejBH7x0D3AEd+SzWBC196k622oB4ENoV6UJMKLUouDzYYMBiUIP7+LFAPWym6bthktBrVuRSx8n4lMEZ1lijHMZ0VYCVxU978x5DwosPZLutvbXp8nmivykpT292+F+5/Q4JpybkaMgtuLUtfoE/w9Q9SQAClMI953Rvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qXUv8G4ihP+TjBSgwyquN1b0tBAid/Aw/2Ry0XtNj7Q=;
 b=bhsqV7y74ZCbkE4XHe8gVSISPBRPtfepgUKggb33WrAxXJ2+H0hPgIC/LEiVEMcM2lFAqJSS0MfIR8iIkqOme9PWRtAM7ZGAZHYIckHO4FHPBGpy9jNsFqYPTThojtMBgYSWe3LbbGi2/QMTZftXkxxajIVlH58zJK5DT4j1e0MoEe+0r9PhM2tlCJfL+vxXP8+SKbfE1grxp8vCX6HreWWzjkr3p7xKRgsxYQJn1ZGXiv0MNcu3SgIoFsWaSrXUIMJmbtO5oXifKMhMM1xa8y/mJhidcMsQmgUhTvpgvCBQNG6E16wKx/5A5dheS2AcauKLvEcBXIEGR1/s+8UexA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qXUv8G4ihP+TjBSgwyquN1b0tBAid/Aw/2Ry0XtNj7Q=;
 b=YsWR9US4gC/OxUi5+DfvEvrIuA9mS7oA5KwcKEQI1EuE8S36Wz7SKV7d1w5wBZ53wqp7bSOwxWxYKwYbL2yu8pvYdcaSyKfm1y6gJkC1ZCKSBbKJncOmZGAmwtfceFHfH++wy/2Hi4cQZuQC/QACtkqu+WCe6DxCpd9GI+4tkm0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB8586.namprd12.prod.outlook.com (2603:10b6:208:44e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.15; Fri, 16 Feb
 2024 15:41:47 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7292.022; Fri, 16 Feb 2024
 15:41:46 +0000
Message-ID: <0e10db11-0723-47e8-82ed-94d68e3c5afb@amd.com>
Date: Fri, 16 Feb 2024 16:41:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd: Only allow one entity to control ABM
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Hamza Mahfooz <Hamza.Mahfooz@amd.com>,
 Sun peng Li <Sunpeng.Li@amd.com>
References: <20240216140709.73708-1-mario.limonciello@amd.com>
 <8970de85-3117-4e28-82b4-3b35c5beb7cf@gmail.com>
 <6b9e6f24-8fa5-43c5-88a2-068dfcb9996e@amd.com>
 <e47b859d-eb0c-49f8-8a96-6f454fa18592@gmail.com>
 <20361f26-2c83-4619-8f9e-ec8788b8280f@amd.com>
 <126803c6-177a-4ffd-8b65-856fb83f9972@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <126803c6-177a-4ffd-8b65-856fb83f9972@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P190CA0044.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB8586:EE_
X-MS-Office365-Filtering-Correlation-Id: 62e6eec0-6455-4e24-f784-08dc2f05c88c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: slUEkxkaR5U6D961fKX0JcFbUGR2b6m1OEwsrb9kbQAfiU96UfMWvTS5vY8h6H/63D/VuwLeh7EN9JHJO2vp0cQAP234WTB87cH7Oh2pE3aiz5Q3aNRStCR43ME4vq/rJdQ8CJqeFcGfaKJp0QKh5AX2lS7Im6him+vA35gkzIqymqp/IMnXjwmQn3JLxCLkqSDwdYzrSzUw4PYlATJ/57mvI9X7s2L9mttmIW/ofzNleY6qwLB6CgePH3KII3dMB3SejehBValEbn8xiQaOULfdtb6R6uoFqsDprWuBrqcnujmu4Xj1Oz1mhTtIZ85ck+lvIQni0cQmtBc64M4k9S93y5vNLqX8cgKEPP4Ac7tyyPF7OT+ArCJ8VdmLg6w0RRnE+vVvN8onmnPqZXIyfsXz1E/Sxx0ddC98nuUlbL681r0AHdxG34+FZPuxRz45XSmwDB/+17o72tUegGT7WfcULxprPoXcJXEUFY3EbOZvPVO31LRi/nmUr0KIRrbGydUPMGHXpnZg7xqoy9ZjRfOsEu6NSdrVWXfGURjmlLThYgH5nERZ9hDbNA7afVoo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(39860400002)(136003)(396003)(230273577357003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(8936002)(66556008)(66476007)(4326008)(30864003)(8676002)(5660300002)(66946007)(450100002)(66899024)(2906002)(66574015)(83380400001)(26005)(36756003)(31696002)(86362001)(38100700002)(6506007)(6512007)(6486002)(966005)(316002)(54906003)(6666004)(110136005)(2616005)(41300700001)(53546011)(478600001)(31686004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXRQQU1adTlTSHpzVEVMdnE1UXJENm5pOVFLNVdSQkZnTnN1TmJpT2oxQmdq?=
 =?utf-8?B?YTMvYnZ6a2QzcnkyWHNVMG54MzhERjdldEw3UmZQZFk5dFpNdm1LVHYvRHJ6?=
 =?utf-8?B?R2wzVmNXVzl2bm5QNnZPZnBrQ1R3S3Y0WWF2OXVyTDNiRDFvRkdta2YwYXZq?=
 =?utf-8?B?TnQ1VmR1MklxQ3JoRzBBWGxMRTdhZlp5RjhWSldTUkxndnNCWm1XQmFpWURU?=
 =?utf-8?B?eS93NFlzR3NHbUJ2b2tibG5Bc2JpT0tPS0hTUHcwSzVUMGI3S2tONTF6QlE4?=
 =?utf-8?B?T2pUclVNY1ppaWlyZTRlUC9jSmpMT0dHbDk2T3R1S0ZzZy9KNmFkYXV1N3Zv?=
 =?utf-8?B?ZTNuU1lURFQxODUwdVVtZ3VjT0pQb1VRK2tSSWhjMndkclByN1BhSHJmNjBm?=
 =?utf-8?B?Y1ZMelYxV3BLdmNJZThNWWRBZ3A5SS9CS2RnWlg1QTk4eHBFKzRjWnFJTitv?=
 =?utf-8?B?aDN3ZlBHNjFwcjRITVRTV1BzcVgvMEtxL3EyWWhqSFU0VzNIRTl1SzRrNDNG?=
 =?utf-8?B?dmFaRXZGaWpkL2VRNkE4Nmt3ZkVCL1NzSGVwTlhiemFVL2djcGNocU1DekUz?=
 =?utf-8?B?K2l5T213bjVqekNDZS9jT0ROeEFFdzBXeWsvdTVCMExSS2RGMWN5amE4bkg2?=
 =?utf-8?B?V3NsUTZZUnlXb01qYy9XdU05WTBZZ0loWmVCWFQ1TUthYmVrWWhLSjlKZ1Jw?=
 =?utf-8?B?cXJXVGZtbWVveko5V1g0U3FhVWFib3d2TzZpWkFxUGFqL3V3NG5VZFAvaUZ2?=
 =?utf-8?B?ZTNLcTRHeW4za0VCTHpnMnk2NC9jNzEvMEdrdTYvNy9XdnpyR29FV0hmK09R?=
 =?utf-8?B?SVplcHdhbVlieGoxUTdEdC9PWUcvOEhxTnZ6K0NDQ3I4NStyTEpiLy9QUW85?=
 =?utf-8?B?VUdGRUxaWC9IaGdOOUl2UkpoUHBxTFd5aVdyeURaNGFXOHh3d1hSdnRYT0Z0?=
 =?utf-8?B?ZVQ1VzZzRHQ5dnJOVG04Y0kzOElPM0lGNE15UlRHVnN2RXM5dGRtRUVEVU4z?=
 =?utf-8?B?dFh5Yk5xSmt0dUJFUEtZM1RPR29FeFhiU3M4cmorUjQzQWV1NGx5WU5vdzBB?=
 =?utf-8?B?d2R0V0VZZWxmZENmbm42djZKMGU5Ynh4YnNSY3QwYkszTG5ZVnJzN2pQNWti?=
 =?utf-8?B?a2VHWWxYRExUOVgvNHNiZVN2UDdXUXQ3cTU5TlJmNlhqUzZib21pakkzVjBu?=
 =?utf-8?B?L1RuMXRVR3NPMEI3NHlkUksvblRTN1drOWhuUU1sUzMxamZIc09kTndNZDhF?=
 =?utf-8?B?OSsrdnQ3Ty9RMXVQKzhidy9tdzZ5dUI1MTdpbVMyK2ptK2xIMVV3SnNIRGxE?=
 =?utf-8?B?Y3lHWFlrRzhMU3NReC9IM250a003cmRiemJsanRSZFdUNXlUNUVMVWNCaXpp?=
 =?utf-8?B?YkdhMmkreFEvMmhFTTVaY09yVVd4ZWdDZ295MFpBZzlKNWN2dTBIVEVNRnFG?=
 =?utf-8?B?WUV3Unp5ZlQreGY2My83MTRwb2RuSm5VVTVtajVrcFlXN0x6dzliNSs0eHlq?=
 =?utf-8?B?cXBxN2RrbTdRNzdhQzRKbHNtVy94V1BZc0N4Q2drVlMwbXkwYkk3WlVHV1ph?=
 =?utf-8?B?L21jaEYzK2ZSTC9PVGVySXF5SHFtYWFXSC92S3lZcmNtcEFUd3dHMTdKQW9t?=
 =?utf-8?B?elYwcUljY251bS94cE5pcVhGbUtaOWFKelNHZ0dCVFV3Njk3MC9RMTVqMjN6?=
 =?utf-8?B?dHJUdEgxZURYa1JCa2dxM3UvaDNjV1NVN1lUcGRnZmh0eFp3OW01TEJqQjUz?=
 =?utf-8?B?SW5qMFdSN01DRUJNblR6U1lLQTBGTTJZRlh6RkRJaStWeENyZ1g4MUhGYmh0?=
 =?utf-8?B?dkFlMU1lUEE3aG42VjlYTUNtNG90eUIvZ3o3dzN1Mk5DTzMwM0NjY1ZOVnMz?=
 =?utf-8?B?SXBUNnJHUlY3OTVRalhYV1lvcUVOandJOU1wQlNFdGNEYkZiR3hFam9FQURB?=
 =?utf-8?B?M1R2aExVV01GdjMvc2ZZQkVUc3ZKbHlkVStHMFNpSFg5OGRKU3B5L0FUS2pu?=
 =?utf-8?B?UGlGSlI4QVZCSkwvNklDNnNJTEVjdzNGMWVoRkR6M3FhbExlMmFYSWMwLzZp?=
 =?utf-8?B?MlpoaVBybEdvYlEwOXE0R3YrbDlJcm4vdGVPR201Y0dMOUdOV29rM0ViVDRz?=
 =?utf-8?Q?oDQLoTeq1hwWBsm4sOnTi2Jf+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62e6eec0-6455-4e24-f784-08dc2f05c88c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 15:41:46.9092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SmLwpTGOjocu37Kiz81s76Gc7JiH929SurZWvbP/DbQEdQA3W8TRrpb77XrwMqqf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8586
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

Am 16.02.24 um 16:12 schrieb Mario Limonciello:
> On 2/16/2024 09:05, Harry Wentland wrote:
>>
>>
>> On 2024-02-16 09:47, Christian König wrote:
>>> Am 16.02.24 um 15:42 schrieb Mario Limonciello:
>>>> On 2/16/2024 08:38, Christian König wrote:
>>>>> Am 16.02.24 um 15:07 schrieb Mario Limonciello:
>>>>>> By exporting ABM to sysfs it's possible that DRM master and software
>>>>>> controlling the sysfs file fight over the value programmed for ABM.
>>>>>>
>>>>>> Adjust the module parameter behavior to control who control ABM:
>>>>>> -2: DRM
>>>>>> -1: sysfs (IE via software like power-profiles-daemon)
>>>>>
>>>>> Well that sounds extremely awkward. Why should a 
>>>>> power-profiles-deamon has control over the panel power saving 
>>>>> features?
>>>>>
>>>>> I mean we are talking about things like reducing backlight level 
>>>>> when the is inactivity, don't we?
>>>>
>>>> We're talking about activating the ABM algorithm when the system is 
>>>> in power saving mode; not from inactivity.  This allows the user to 
>>>> squeeze out some extra power "just" in that situation.
>>>>
>>>> But given the comments on the other patch, I tend to agree with 
>>>> Harry's proposal instead that we just drop the DRM property 
>>>> entirely as there are no consumers of it.
>>>
>>> Yeah, but even then the design to let this be controlled by an 
>>> userspace deamon is questionable. Stuff like that is handled inside 
>>> the kernel and not exposed to userspace usually.
>>>
>
> Regarding the "how" and "why" of PPD; besides this panel power savings 
> sysfs file there are two other things that are nominally changed.
>
> ACPI platform profile: 
> https://www.kernel.org/doc/html/latest/userspace-api/sysfs-platform_profile.html
>
> AMD-Pstate EPP value: 
> https://www.kernel.org/doc/html//latest/admin-guide/pm/amd-pstate.html
>
> When a user goes into "power saving" mode both of those are tweaked. 
> Before we introduced the EPP tweaking in PPD we did discuss a callback 
> within the kernel so that userspace could change "just" the ACPI 
> platform profile and everything else would react.  There was pushback 
> on this, and so instead knobs are offered for things that should be 
> tweaked and the userspace daemon can set up policy for what to do when 
> a a user uses a userspace client (such as GNOME or KDE) to change the 
> desired system profile.

Ok, well who came up with the idea of the userspace deamon? Cause I 
think there will be even more push back on this approach.

Basically when we go from AC to battery (or whatever) the drivers 
usually handle that all inside the kernel today. Involving userspace is 
only done when there is a need for that, e.g. inactivity detection or 
similar.

>>
>> I think we'll need a bit in our kernel docs describing ABM. 
>> Assumptions around what it is and does seem to lead to confusion.
>>
>> The thing is that ABM has a visual impact that not all users like. It 
>> would make sense for users to be able to change the ABM level as 
>> desired, and/or configure their power profiles to select a certain 
>> ABM level.
>>
>> ABM will reduce the backlight and compensate by adjusting brightness 
>> and contrast of the image. It has 5 levels: 0, 1, 2, 3, 4. 0 means 
>> off. 4 means maximum backlight reduction. IMO, 1 and 2 look okay. 3 
>> and 4 can be quite impactful, both to power and visual fidelity.
>>
>
> Aside from this patch Hamza did make some improvements to the kdoc in 
> the recent patches, can you read through again and see if you think it 
> still needs improvements?

Well what exactly is the requirement? That we have different ABM 
settings for AC and battery? If yes providing different DRM properties 
would sound like the right approach to me.

Regards,
Christian.

>
>> Harry
>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>> 0-4: User via command line
>>>>>>
>>>>>> Also introduce a Kconfig option that allows distributions to choose
>>>>>> the default policy that is appropriate for them.
>>>>>>
>>>>>> Fixes: f97e4303da16 ("drm/amd/display: add panel_power_savings 
>>>>>> sysfs entry to eDP connectors")
>>>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>>>>> ---
>>>>>> Cc: Hamza Mahfooz <Hamza.Mahfooz@amd.com>
>>>>>> Cc: Harry Wentland <Harry.Wentland@amd.com>
>>>>>> Cc: Sun peng (Leo) Li <Sunpeng.Li@amd.com>
>>>>>>    drivers/gpu/drm/amd/amdgpu/Kconfig            | 72 
>>>>>> +++++++++++++++++++
>>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       | 23 +++---
>>>>>>    .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  6 +-
>>>>>>    3 files changed, 90 insertions(+), 11 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig 
>>>>>> b/drivers/gpu/drm/amd/amdgpu/Kconfig
>>>>>> index 22d88f8ef527..2ab57ccf6f21 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/Kconfig
>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
>>>>>> @@ -80,6 +80,78 @@ config DRM_AMDGPU_WERROR
>>>>>>          Add -Werror to the build flags for amdgpu.ko.
>>>>>>          Only enable this if you are warning code for amdgpu.ko.
>>>>>> +choice
>>>>>> +    prompt "Amdgpu panel power Savings"
>>>>>> +    default AMDGPU_SYSFS_ABM
>>>>>> +    help
>>>>>> +        Control the default behavior for adaptive panel power 
>>>>>> savings.
>>>>>> +
>>>>>> +        Panel power savings features will sacrifice color accuracy
>>>>>> +        in exchange for power savings.
>>>>>> +
>>>>>> +        This can be configured for:
>>>>>> +        - dynamic control by the DRM master
>>>>>> +        - dynamic control by sysfs nodes
>>>>>> +        - statically by the user at kernel compile time
>>>>>> +
>>>>>> +        This value can also be overridden by the amdgpu.abmlevel
>>>>>> +        module parameter.
>>>>>> +
>>>>>> +config AMDGPU_DRM_ABM
>>>>>> +    bool "DRM Master control"
>>>>>> +    help
>>>>>> +        Export a property called 'abm_level' that can be
>>>>>> +        manipulated by the DRM master for supported hardware.
>>>>>> +
>>>>>> +config AMDGPU_SYSFS_ABM
>>>>>> +    bool "sysfs control"
>>>>>> +    help
>>>>>> +        Export a sysfs file 'panel_power_savings' that can be
>>>>>> +        manipulated by userspace for supported hardware.
>>>>>> +
>>>>>> +config AMDGPU_HARDCODE_ABM0
>>>>>> +    bool "No Panel power savings"
>>>>>> +    help
>>>>>> +        Disable panel power savings.
>>>>>> +        It can only overridden by the kernel command line.
>>>>>> +
>>>>>> +config AMDGPU_HARDCODE_ABM1
>>>>>> +    bool "25% Panel power savings"
>>>>>> +    help
>>>>>> +        Set the ABM panel power savings algorithm to 25%.
>>>>>> +        It can only overridden by the kernel command line.
>>>>>> +
>>>>>> +config AMDGPU_HARDCODE_ABM2
>>>>>> +    bool "50% Panel power savings"
>>>>>> +    help
>>>>>> +        Set the ABM panel power savings algorithm to 50%.
>>>>>> +        It can only overridden by the kernel command line.
>>>>>> +
>>>>>> +config AMDGPU_HARDCODE_ABM3
>>>>>> +    bool "75% Panel power savings"
>>>>>> +    help
>>>>>> +        Set the ABM panel power savings algorithm to 75%.
>>>>>> +        It can only overridden by the kernel command line.
>>>>>> +
>>>>>> +config AMDGPU_HARDCODE_ABM4
>>>>>> +    bool "100% Panel power savings"
>>>>>> +    help
>>>>>> +        Set the ABM panel power savings algorithm to 100%.
>>>>>> +        It can only overridden by the kernel command line.
>>>>>> +endchoice
>>>>>> +
>>>>>> +config AMDGPU_ABM_POLICY
>>>>>> +    int
>>>>>> +    default -2 if AMDGPU_DRM_ABM
>>>>>> +    default -1 if AMDGPU_SYSFS_ABM
>>>>>> +    default 0 if AMDGPU_HARDCODE_ABM0
>>>>>> +    default 1 if AMDGPU_HARDCODE_ABM1
>>>>>> +    default 2 if AMDGPU_HARDCODE_ABM2
>>>>>> +    default 3 if AMDGPU_HARDCODE_ABM3
>>>>>> +    default 4 if AMDGPU_HARDCODE_ABM4
>>>>>> +    default -1
>>>>>> +
>>>>>> +
>>>>>>    source "drivers/gpu/drm/amd/acp/Kconfig"
>>>>>>    source "drivers/gpu/drm/amd/display/Kconfig"
>>>>>>    source "drivers/gpu/drm/amd/amdkfd/Kconfig"
>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c 
>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>>> index af7fae7907d7..00d6c8b58716 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>>> @@ -844,17 +844,24 @@ module_param_named(visualconfirm, 
>>>>>> amdgpu_dc_visual_confirm, uint, 0444);
>>>>>>     * DOC: abmlevel (uint)
>>>>>>     * Override the default ABM (Adaptive Backlight Management) 
>>>>>> level used for DC
>>>>>>     * enabled hardware. Requires DMCU to be supported and loaded.
>>>>>> - * Valid levels are 0-4. A value of 0 indicates that ABM should 
>>>>>> be disabled by
>>>>>> - * default. Values 1-4 control the maximum allowable brightness 
>>>>>> reduction via
>>>>>> - * the ABM algorithm, with 1 being the least reduction and 4 
>>>>>> being the most
>>>>>> - * reduction.
>>>>>> + * Valid levels are -2 through 4.
>>>>>>     *
>>>>>> - * Defaults to -1, or disabled. Userspace can only override this 
>>>>>> level after
>>>>>> - * boot if it's set to auto.
>>>>>> + *  -2: indicates that ABM should be controlled by DRM property 
>>>>>> 'abm_level.
>>>>>> + *  -1: indicates that ABM should be controlled by the sysfs file
>>>>>> + *      'panel_power_savings'.
>>>>>> + *   0: indicates that ABM should be disabled.
>>>>>> + * 1-4: control the maximum allowable brightness reduction via
>>>>>> + *      the ABM algorithm, with 1 being the least reduction and 
>>>>>> 4 being the most
>>>>>> + *      reduction.
>>>>>> + *
>>>>>> + * Both the DRM property 'abm_level' and the sysfs file 
>>>>>> 'panel_power_savings'
>>>>>> + * will only be available on supported hardware configurations.
>>>>>> + *
>>>>>> + * The default value is configured by kernel configuration 
>>>>>> option AMDGPU_ABM_POLICY
>>>>>>     */
>>>>>> -int amdgpu_dm_abm_level = -1;
>>>>>> +int amdgpu_dm_abm_level = CONFIG_AMDGPU_ABM_POLICY;
>>>>>>    MODULE_PARM_DESC(abmlevel,
>>>>>> -         "ABM level (0 = off, 1-4 = backlight reduction level, 
>>>>>> -1 auto (default))");
>>>>>> +         "ABM level (0 = off, 1-4 = backlight reduction level, 
>>>>>> -1 = sysfs control, -2 = drm control");
>>>>>>    module_param_named(abmlevel, amdgpu_dm_abm_level, int, 0444);
>>>>>>    int amdgpu_backlight = -1;
>>>>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c 
>>>>>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>>>> index b9ac3d2f8029..147fe744f82e 100644
>>>>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>>>> @@ -6515,7 +6515,7 @@ static void 
>>>>>> amdgpu_dm_connector_unregister(struct drm_connector *connector)
>>>>>>        struct amdgpu_dm_connector *amdgpu_dm_connector = 
>>>>>> to_amdgpu_dm_connector(connector);
>>>>>>        if (connector->connector_type == DRM_MODE_CONNECTOR_eDP &&
>>>>>> -        amdgpu_dm_abm_level < 0)
>>>>>> +        amdgpu_dm_abm_level == -1)
>>>>>> sysfs_remove_group(&connector->kdev->kobj, &amdgpu_group);
>>>>>> drm_dp_aux_unregister(&amdgpu_dm_connector->dm_dp_aux.aux);
>>>>>> @@ -6623,7 +6623,7 @@ amdgpu_dm_connector_late_register(struct 
>>>>>> drm_connector *connector)
>>>>>>        int r;
>>>>>>        if (connector->connector_type == DRM_MODE_CONNECTOR_eDP &&
>>>>>> -        amdgpu_dm_abm_level < 0) {
>>>>>> +        amdgpu_dm_abm_level == -1) {
>>>>>>            r = sysfs_create_group(&connector->kdev->kobj,
>>>>>>                           &amdgpu_group);
>>>>>>            if (r)
>>>>>> @@ -7654,7 +7654,7 @@ void amdgpu_dm_connector_init_helper(struct 
>>>>>> amdgpu_display_manager *dm,
>>>>>>        if (connector_type == DRM_MODE_CONNECTOR_eDP &&
>>>>>>            (dc_is_dmcu_initialized(adev->dm.dc) ||
>>>>>> -         adev->dm.dc->ctx->dmub_srv) && amdgpu_dm_abm_level < 0) {
>>>>>> +         adev->dm.dc->ctx->dmub_srv) && amdgpu_dm_abm_level == 
>>>>>> -2) {
>>>>>> drm_object_attach_property(&aconnector->base.base,
>>>>>> adev->mode_info.abm_level_property, 0);
>>>>>>        }
>>>>>
>>>>
>>>
>>
>

