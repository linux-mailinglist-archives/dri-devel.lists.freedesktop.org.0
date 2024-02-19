Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 668BB85A73E
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 16:20:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D538610E183;
	Mon, 19 Feb 2024 15:19:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="niFLjMle";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3393110E164;
 Mon, 19 Feb 2024 15:19:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g0YE9QCcHpRrIFj4djr03sz49/p8yWbiPjn8Co6m4/KHDvo/BQh2XnV1wf14PcgWBm/i4AUQ5z1EoPFpTtxlKFt4uVq9jjOanBThKvuB4irNAiU/xpffqZEfNTLIkmiah3Hdp6sE/qe5+njFlZrRo2GymEbbMNIdURETsd0v+2tnvdTYwjm61zHHiiJZpj52dx1R8tMqWCiBEZN8sKOIq3Cf2pv7oBEs0DDG8KtlTL8b8wOt+Wrpop8pWBU3fnoHRcgKhFWldTkmieSgCD4LmVbHQ+NW+gIl3fcMF3iYAz334AmQ+38+sfa6MsnjD+4DJTeSvTCobPkOw7SA+G+Uig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lmoD+e2LjpfQUP9AZkThWNCAqa6zM/5c/67vrX16KJ0=;
 b=MdSOK2uKTCd6yOWPb08esYluHieN5sd0q1duicBFMrLX6rAoVcOd2HN4xlJLSk38lYDRdoo7lhLepEqZLJsR3e69i8RnKh6M3zyAct4kTmJi19HoBRbUrWwrSpV9tkRMOYIg9Ovy8+tyXkklGPeS8fjE2MCkP4hMVai4tdhIhoniuKKm6lVEXOz/kz3CZvGvXJdlfTjmaAgLWeUv6E1z2yZRv72Y/xSyLDqOdaDn6YAwCwHWQo1a/tSnwKWnRuuVrFk5jVw1Tf7p/fUllXkFEjTk3TTx8F1qiDxUhbfUHhTTv7Qmjup+JdRd5J0G7qxY3TiWwLrBxZfI6ayINlD3Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lmoD+e2LjpfQUP9AZkThWNCAqa6zM/5c/67vrX16KJ0=;
 b=niFLjMleMrQyauJxDA4mcmrhdPAnBZVGfEYsTaxv9eaaZEjquAD6sBFOMgPCweMXZ0t9jxQIWM3dQCcQs+2AC60wa/Hq3XLc8GRZo0q44Ocd/ygkZTqnAqDvi3g6ttHrYeRg8I4a3q9yFUBn7N0fwTpaRBFOctMyBg34s21rUeg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB7680.namprd12.prod.outlook.com (2603:10b6:8:11c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.17; Mon, 19 Feb
 2024 15:19:51 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7316.018; Mon, 19 Feb 2024
 15:19:51 +0000
Message-ID: <8d6402eb-804b-4b8c-8322-ce374d864bad@amd.com>
Date: Mon, 19 Feb 2024 16:19:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd: Only allow one entity to control ABM
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Hamza Mahfooz <Hamza.Mahfooz@amd.com>,
 Sun peng Li <Sunpeng.Li@amd.com>
References: <20240216140709.73708-1-mario.limonciello@amd.com>
 <8970de85-3117-4e28-82b4-3b35c5beb7cf@gmail.com>
 <6b9e6f24-8fa5-43c5-88a2-068dfcb9996e@amd.com>
 <e47b859d-eb0c-49f8-8a96-6f454fa18592@gmail.com>
 <20361f26-2c83-4619-8f9e-ec8788b8280f@amd.com>
 <126803c6-177a-4ffd-8b65-856fb83f9972@amd.com>
 <0e10db11-0723-47e8-82ed-94d68e3c5afb@amd.com>
 <CADnq5_NQ9Lx_A2v8mmaEPzct6yYJo9pC6EmUtee=HFrJ8ZnUNw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CADnq5_NQ9Lx_A2v8mmaEPzct6yYJo9pC6EmUtee=HFrJ8ZnUNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB7680:EE_
X-MS-Office365-Filtering-Correlation-Id: aceca5e4-929a-47d2-4431-08dc315e379f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wQB0ExQyBNI0y9lX5CG1CdV6cnrDTJ1x9tcg8Ev0hFJEIhohQeB630SExVkFlYBbfenecazc4zeVzC8aX5YwQEZZouAmAQcy8E29GQCm+nN8HWcHIyzkPPxtO9Jy+kPclBQT8ej5xAboEwzwBYs1eWZRebLVweYbluEePyRyKlFEiHrRGk4ZR1ZXDpWK6taIvRE3y7k167YWeHDu6t0QKJygkopbCwYZRFzCnHV96BOx3wdDABX23UMQvFT12Fv1qIzqPxf+nnGZSJbvmNCGQvVtSp4JCDy2mTmM3VqK7hbt3Q/hClHbTovks6jW3/lDBn7HIn1lCsmqRoVY/NuDx2d1mKSPUAoRF/Bd/ltaD7k23ivA+qeLSihgauSgGZ4LpJFdfKWsaAh+fKh0nKdiNFZzI5zcp/gQy+RbhYgc/FB3Q6k1Co40M+tqtr0WqExXBNZkizcuS9s9gzOhPYp+dDTk3cLX4vOBJCfo69Q0TWQsJInNT6AoQCI0noLeGII+HsSFjfIHyE5c0UxjktDNSge9JkLP//5+8f2kWMU3f3bplQP9XQ6yrL9L3D9MkPst
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(230273577357003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVNQVW9mMnNIYzFubG1NWmhVWXhoVlJ2SnJEWFFSSVdicjYwdC83M01LT3dL?=
 =?utf-8?B?YS9sU0locXBFM1pLUlNvYVpQUVJVaDlkN1hzQWVYWjNqY2tic0hiK0FBdEd3?=
 =?utf-8?B?MHYzS1I2a09WM3Jid0w2Nm5uTXNTMVNqL3N4WVdLTUY2dXJoRVlaSFFMcUR0?=
 =?utf-8?B?RmdjR3ZmekgrU0ZjSlJIREFNUFpkR3Fva3BkQmxEaEF2bVp1clRGblVUeGdn?=
 =?utf-8?B?aGdYS2VIYVFvWE5HMHpkNEEyYW5JUmVyRnF2dWgwUHQrVWpaVjliYlBtLzk5?=
 =?utf-8?B?UGw0SHhXMmZEV3MvTHB2S2kyd0pDRzRmQnlJak1DQmpWRnNDRjNsNzA1eEFW?=
 =?utf-8?B?aHJEVEZ3Y1hlaDVIT2NvQW1JMlZnSEFDa1JNNktrdERrVUtzZEVlMHd2UVU0?=
 =?utf-8?B?V25ESXBlZmFDdWJ3M1JEbW9DRVNrczd4QURiUDNCcnhVTmFCa2VMOE50cUh4?=
 =?utf-8?B?clJSc3hkWllWRG5tWUNYYkdpSzQ3VUNrdEUwdzI5VjlQYlRqYnRINkNYN1hC?=
 =?utf-8?B?NEEybmVOa1I4MElGTGwvR0psSUNwVWx6M2ROeFRURHB4czVyTG1qNDBVR2da?=
 =?utf-8?B?cFZ2MjIrUTd2ZmEreGNhVjh3NTQrLzlpRkljOTUwcGxISE5Ka0tKWUZJMGt1?=
 =?utf-8?B?WXE4eXV6VWtuZ2hpcDhpWHdDV1NzeHRRRVhEdmFtOG1QSmx3QVVrSzhOUytB?=
 =?utf-8?B?cE11T0hBQ1VEcGs1RVVMWSs0bGhLck1rUmhiT1VHOW13UDhyNkJsT3ZpL2Q5?=
 =?utf-8?B?bmtwUGh4VnVibXd5aklrQS96YjBxRU9CWUtlbzVHcUFGc1RIK0YrSkNlU1J1?=
 =?utf-8?B?RzA4MW0rZ0ZKZjRnNFBSOGZrU1lNbER1UTZ0NUlpUVkySERxdFNoRi83L1B2?=
 =?utf-8?B?OEZIcWFWL1VwMUlqNWZ3QytscS9hRWRlb1MwT2kzT2hucUYwQ1dUSzBHYnMz?=
 =?utf-8?B?S21VL1FIQThDaWdiZVh6SlYramorRWNQSm9ZYmFtRmlyYXIrQ0FjcXUrdE9l?=
 =?utf-8?B?MmFtK1FkT3lMVjNVODcrb0hDZGlzSUt4Z1BVNjEySGhHZW9TZkNYZmZrQXVT?=
 =?utf-8?B?RVgydE5XdjZSMUJzK3NOOEJFK0ZhSERkZzNjS1E0cmw5QXZWbjJPM09oaWtE?=
 =?utf-8?B?dExONmhUeWFoTW9vN3hBWWp0bU9OVXZ3TTNydHpxNnFYMURBbGlqcFJJQ1h4?=
 =?utf-8?B?MDIwRy94dTdZVHYwdjBJa1h0VFJVTkVFTmoxaE9IVjhacExDd2JmdUZwTnB5?=
 =?utf-8?B?MSt1cTZPQ3ZFS3V0bDBHOHFoSnlXTVBTRWRwSmh6V2lpdEJNaCtJNWp2ZjVC?=
 =?utf-8?B?NWZtR3dwNDZFSnZGbzdIN2d5VnRKbkFRaXZpV1hiMzlCYlI4a243OWVCRGlZ?=
 =?utf-8?B?UXF1WGdObWlkOHRMbThSTkNUdDdXZTJKSmxIMUdFNUNRdEhBazVoUzQwUndu?=
 =?utf-8?B?Z2lZV2puVlZac3ByYnpoMDN2ekMvM2l4eEhBeEJjWWpHenhxRjgrVlA0V3dD?=
 =?utf-8?B?QjNWNUlzZ3FlME81WWRwTGJNYUlNRmh3bUhOeGlEcXE1VWNyMHREL25OTVFn?=
 =?utf-8?B?L0RKdG43YzJzdEJlL0hVUy9PVzZaTE5LL0hxUHNjNExJNVJTVmQxZy9SSTUv?=
 =?utf-8?B?blBqUFlacTNwalkxeGZub25Pa1FlaDJkOGFxMCtqY0RCNFJIMlpLL3dOa0x0?=
 =?utf-8?B?alZnQW5vdFgrUm5TV3hUV0NMK1E3V0crRzFMcGxLTkQ1NHJTcythY1ROUEp1?=
 =?utf-8?B?a2hSMzZLYU9Cb0tTaVNrc3NESGlPNnpSb0piWmM0VS9yb2p6QzY4cEpDWThR?=
 =?utf-8?B?Z1p0NUVtZTZ1V1lKaUllNTlpcE43a3JZSEZ1VDduRC9LUWtnajQxZEJmY1FO?=
 =?utf-8?B?Yk4vVTUxT0w5anpHaTVVYVpjbmRXdnMvU1FYQUk5aE1sbjNRVjc2bjk2RmtX?=
 =?utf-8?B?bXNZK0xLSU5UT2FFZU9YNnl4K2Z2QkdvSFNBejVjS2wxeXJlbXRoWkhreXhi?=
 =?utf-8?B?R3VBZUEvSytJcHpteGY1c0dLUU9MNWdrTERYNEJFcWJmbDBSaFg1Q1dRRHdv?=
 =?utf-8?B?VHlKV3c2c21OWXhwS2E2VmRDMjN4RzdXeDIvNEU0REw3a3piNDdOVkpObFZw?=
 =?utf-8?Q?JbKYsmjZcIKBZ07cqQxnLXmvd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aceca5e4-929a-47d2-4431-08dc315e379f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2024 15:19:51.1744 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jGuAoiio23hgvKEMCuDsXZ7dfdBXHudV/CdsI0DvmxtrSiRnyOjj02VhaniRmPTs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7680
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

Am 16.02.24 um 19:37 schrieb Alex Deucher:
> On Fri, Feb 16, 2024 at 10:42 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 16.02.24 um 16:12 schrieb Mario Limonciello:
>>> On 2/16/2024 09:05, Harry Wentland wrote:
>>>>
>>>> On 2024-02-16 09:47, Christian König wrote:
>>>>> Am 16.02.24 um 15:42 schrieb Mario Limonciello:
>>>>>> On 2/16/2024 08:38, Christian König wrote:
>>>>>>> Am 16.02.24 um 15:07 schrieb Mario Limonciello:
>>>>>>>> By exporting ABM to sysfs it's possible that DRM master and software
>>>>>>>> controlling the sysfs file fight over the value programmed for ABM.
>>>>>>>>
>>>>>>>> Adjust the module parameter behavior to control who control ABM:
>>>>>>>> -2: DRM
>>>>>>>> -1: sysfs (IE via software like power-profiles-daemon)
>>>>>>> Well that sounds extremely awkward. Why should a
>>>>>>> power-profiles-deamon has control over the panel power saving
>>>>>>> features?
>>>>>>>
>>>>>>> I mean we are talking about things like reducing backlight level
>>>>>>> when the is inactivity, don't we?
>>>>>> We're talking about activating the ABM algorithm when the system is
>>>>>> in power saving mode; not from inactivity.  This allows the user to
>>>>>> squeeze out some extra power "just" in that situation.
>>>>>>
>>>>>> But given the comments on the other patch, I tend to agree with
>>>>>> Harry's proposal instead that we just drop the DRM property
>>>>>> entirely as there are no consumers of it.
>>>>> Yeah, but even then the design to let this be controlled by an
>>>>> userspace deamon is questionable. Stuff like that is handled inside
>>>>> the kernel and not exposed to userspace usually.
>>>>>
>>> Regarding the "how" and "why" of PPD; besides this panel power savings
>>> sysfs file there are two other things that are nominally changed.
>>>
>>> ACPI platform profile:
>>> https://www.kernel.org/doc/html/latest/userspace-api/sysfs-platform_profile.html
>>>
>>> AMD-Pstate EPP value:
>>> https://www.kernel.org/doc/html//latest/admin-guide/pm/amd-pstate.html
>>>
>>> When a user goes into "power saving" mode both of those are tweaked.
>>> Before we introduced the EPP tweaking in PPD we did discuss a callback
>>> within the kernel so that userspace could change "just" the ACPI
>>> platform profile and everything else would react.  There was pushback
>>> on this, and so instead knobs are offered for things that should be
>>> tweaked and the userspace daemon can set up policy for what to do when
>>> a a user uses a userspace client (such as GNOME or KDE) to change the
>>> desired system profile.
>> Ok, well who came up with the idea of the userspace deamon? Cause I
>> think there will be even more push back on this approach.
>>
>> Basically when we go from AC to battery (or whatever) the drivers
>> usually handle that all inside the kernel today. Involving userspace is
>> only done when there is a need for that, e.g. inactivity detection or
>> similar.
> Well, we don't want policy in the kernel unless it's a platform or
> hardware requirement.  Kernel should provide the knobs and then
> userspace can set them however they want depending on user preference.

Well, you not have the policy itself but usually the handling inside the 
kernel.

In other words when I connect/disconnect AC from my laptop I can hear 
the fan changing, which is a switch in power state. Only the beep which 
comes out of the speakers as conformation is handled in userspace I think.

And IIRC changing background light is also handled completely inside the 
kernel and when I close the lid the display turns off on its own and not 
because of some userspace deamon.

So why is for this suddenly a userspace deamon involved?

Christian.

>
> Alex
>
>
>>>> I think we'll need a bit in our kernel docs describing ABM.
>>>> Assumptions around what it is and does seem to lead to confusion.
>>>>
>>>> The thing is that ABM has a visual impact that not all users like. It
>>>> would make sense for users to be able to change the ABM level as
>>>> desired, and/or configure their power profiles to select a certain
>>>> ABM level.
>>>>
>>>> ABM will reduce the backlight and compensate by adjusting brightness
>>>> and contrast of the image. It has 5 levels: 0, 1, 2, 3, 4. 0 means
>>>> off. 4 means maximum backlight reduction. IMO, 1 and 2 look okay. 3
>>>> and 4 can be quite impactful, both to power and visual fidelity.
>>>>
>>> Aside from this patch Hamza did make some improvements to the kdoc in
>>> the recent patches, can you read through again and see if you think it
>>> still needs improvements?
>> Well what exactly is the requirement? That we have different ABM
>> settings for AC and battery? If yes providing different DRM properties
>> would sound like the right approach to me.
>>
>> Regards,
>> Christian.
>>
>>>> Harry
>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>>> Regards,
>>>>>>> Christian.
>>>>>>>
>>>>>>>> 0-4: User via command line
>>>>>>>>
>>>>>>>> Also introduce a Kconfig option that allows distributions to choose
>>>>>>>> the default policy that is appropriate for them.
>>>>>>>>
>>>>>>>> Fixes: f97e4303da16 ("drm/amd/display: add panel_power_savings
>>>>>>>> sysfs entry to eDP connectors")
>>>>>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>>>>>>> ---
>>>>>>>> Cc: Hamza Mahfooz <Hamza.Mahfooz@amd.com>
>>>>>>>> Cc: Harry Wentland <Harry.Wentland@amd.com>
>>>>>>>> Cc: Sun peng (Leo) Li <Sunpeng.Li@amd.com>
>>>>>>>>     drivers/gpu/drm/amd/amdgpu/Kconfig            | 72
>>>>>>>> +++++++++++++++++++
>>>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       | 23 +++---
>>>>>>>>     .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  6 +-
>>>>>>>>     3 files changed, 90 insertions(+), 11 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig
>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/Kconfig
>>>>>>>> index 22d88f8ef527..2ab57ccf6f21 100644
>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/Kconfig
>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
>>>>>>>> @@ -80,6 +80,78 @@ config DRM_AMDGPU_WERROR
>>>>>>>>           Add -Werror to the build flags for amdgpu.ko.
>>>>>>>>           Only enable this if you are warning code for amdgpu.ko.
>>>>>>>> +choice
>>>>>>>> +    prompt "Amdgpu panel power Savings"
>>>>>>>> +    default AMDGPU_SYSFS_ABM
>>>>>>>> +    help
>>>>>>>> +        Control the default behavior for adaptive panel power
>>>>>>>> savings.
>>>>>>>> +
>>>>>>>> +        Panel power savings features will sacrifice color accuracy
>>>>>>>> +        in exchange for power savings.
>>>>>>>> +
>>>>>>>> +        This can be configured for:
>>>>>>>> +        - dynamic control by the DRM master
>>>>>>>> +        - dynamic control by sysfs nodes
>>>>>>>> +        - statically by the user at kernel compile time
>>>>>>>> +
>>>>>>>> +        This value can also be overridden by the amdgpu.abmlevel
>>>>>>>> +        module parameter.
>>>>>>>> +
>>>>>>>> +config AMDGPU_DRM_ABM
>>>>>>>> +    bool "DRM Master control"
>>>>>>>> +    help
>>>>>>>> +        Export a property called 'abm_level' that can be
>>>>>>>> +        manipulated by the DRM master for supported hardware.
>>>>>>>> +
>>>>>>>> +config AMDGPU_SYSFS_ABM
>>>>>>>> +    bool "sysfs control"
>>>>>>>> +    help
>>>>>>>> +        Export a sysfs file 'panel_power_savings' that can be
>>>>>>>> +        manipulated by userspace for supported hardware.
>>>>>>>> +
>>>>>>>> +config AMDGPU_HARDCODE_ABM0
>>>>>>>> +    bool "No Panel power savings"
>>>>>>>> +    help
>>>>>>>> +        Disable panel power savings.
>>>>>>>> +        It can only overridden by the kernel command line.
>>>>>>>> +
>>>>>>>> +config AMDGPU_HARDCODE_ABM1
>>>>>>>> +    bool "25% Panel power savings"
>>>>>>>> +    help
>>>>>>>> +        Set the ABM panel power savings algorithm to 25%.
>>>>>>>> +        It can only overridden by the kernel command line.
>>>>>>>> +
>>>>>>>> +config AMDGPU_HARDCODE_ABM2
>>>>>>>> +    bool "50% Panel power savings"
>>>>>>>> +    help
>>>>>>>> +        Set the ABM panel power savings algorithm to 50%.
>>>>>>>> +        It can only overridden by the kernel command line.
>>>>>>>> +
>>>>>>>> +config AMDGPU_HARDCODE_ABM3
>>>>>>>> +    bool "75% Panel power savings"
>>>>>>>> +    help
>>>>>>>> +        Set the ABM panel power savings algorithm to 75%.
>>>>>>>> +        It can only overridden by the kernel command line.
>>>>>>>> +
>>>>>>>> +config AMDGPU_HARDCODE_ABM4
>>>>>>>> +    bool "100% Panel power savings"
>>>>>>>> +    help
>>>>>>>> +        Set the ABM panel power savings algorithm to 100%.
>>>>>>>> +        It can only overridden by the kernel command line.
>>>>>>>> +endchoice
>>>>>>>> +
>>>>>>>> +config AMDGPU_ABM_POLICY
>>>>>>>> +    int
>>>>>>>> +    default -2 if AMDGPU_DRM_ABM
>>>>>>>> +    default -1 if AMDGPU_SYSFS_ABM
>>>>>>>> +    default 0 if AMDGPU_HARDCODE_ABM0
>>>>>>>> +    default 1 if AMDGPU_HARDCODE_ABM1
>>>>>>>> +    default 2 if AMDGPU_HARDCODE_ABM2
>>>>>>>> +    default 3 if AMDGPU_HARDCODE_ABM3
>>>>>>>> +    default 4 if AMDGPU_HARDCODE_ABM4
>>>>>>>> +    default -1
>>>>>>>> +
>>>>>>>> +
>>>>>>>>     source "drivers/gpu/drm/amd/acp/Kconfig"
>>>>>>>>     source "drivers/gpu/drm/amd/display/Kconfig"
>>>>>>>>     source "drivers/gpu/drm/amd/amdkfd/Kconfig"
>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>>>>> index af7fae7907d7..00d6c8b58716 100644
>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>>>>> @@ -844,17 +844,24 @@ module_param_named(visualconfirm,
>>>>>>>> amdgpu_dc_visual_confirm, uint, 0444);
>>>>>>>>      * DOC: abmlevel (uint)
>>>>>>>>      * Override the default ABM (Adaptive Backlight Management)
>>>>>>>> level used for DC
>>>>>>>>      * enabled hardware. Requires DMCU to be supported and loaded.
>>>>>>>> - * Valid levels are 0-4. A value of 0 indicates that ABM should
>>>>>>>> be disabled by
>>>>>>>> - * default. Values 1-4 control the maximum allowable brightness
>>>>>>>> reduction via
>>>>>>>> - * the ABM algorithm, with 1 being the least reduction and 4
>>>>>>>> being the most
>>>>>>>> - * reduction.
>>>>>>>> + * Valid levels are -2 through 4.
>>>>>>>>      *
>>>>>>>> - * Defaults to -1, or disabled. Userspace can only override this
>>>>>>>> level after
>>>>>>>> - * boot if it's set to auto.
>>>>>>>> + *  -2: indicates that ABM should be controlled by DRM property
>>>>>>>> 'abm_level.
>>>>>>>> + *  -1: indicates that ABM should be controlled by the sysfs file
>>>>>>>> + *      'panel_power_savings'.
>>>>>>>> + *   0: indicates that ABM should be disabled.
>>>>>>>> + * 1-4: control the maximum allowable brightness reduction via
>>>>>>>> + *      the ABM algorithm, with 1 being the least reduction and
>>>>>>>> 4 being the most
>>>>>>>> + *      reduction.
>>>>>>>> + *
>>>>>>>> + * Both the DRM property 'abm_level' and the sysfs file
>>>>>>>> 'panel_power_savings'
>>>>>>>> + * will only be available on supported hardware configurations.
>>>>>>>> + *
>>>>>>>> + * The default value is configured by kernel configuration
>>>>>>>> option AMDGPU_ABM_POLICY
>>>>>>>>      */
>>>>>>>> -int amdgpu_dm_abm_level = -1;
>>>>>>>> +int amdgpu_dm_abm_level = CONFIG_AMDGPU_ABM_POLICY;
>>>>>>>>     MODULE_PARM_DESC(abmlevel,
>>>>>>>> -         "ABM level (0 = off, 1-4 = backlight reduction level,
>>>>>>>> -1 auto (default))");
>>>>>>>> +         "ABM level (0 = off, 1-4 = backlight reduction level,
>>>>>>>> -1 = sysfs control, -2 = drm control");
>>>>>>>>     module_param_named(abmlevel, amdgpu_dm_abm_level, int, 0444);
>>>>>>>>     int amdgpu_backlight = -1;
>>>>>>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>>>>>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>>>>>> index b9ac3d2f8029..147fe744f82e 100644
>>>>>>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>>>>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>>>>>> @@ -6515,7 +6515,7 @@ static void
>>>>>>>> amdgpu_dm_connector_unregister(struct drm_connector *connector)
>>>>>>>>         struct amdgpu_dm_connector *amdgpu_dm_connector =
>>>>>>>> to_amdgpu_dm_connector(connector);
>>>>>>>>         if (connector->connector_type == DRM_MODE_CONNECTOR_eDP &&
>>>>>>>> -        amdgpu_dm_abm_level < 0)
>>>>>>>> +        amdgpu_dm_abm_level == -1)
>>>>>>>> sysfs_remove_group(&connector->kdev->kobj, &amdgpu_group);
>>>>>>>> drm_dp_aux_unregister(&amdgpu_dm_connector->dm_dp_aux.aux);
>>>>>>>> @@ -6623,7 +6623,7 @@ amdgpu_dm_connector_late_register(struct
>>>>>>>> drm_connector *connector)
>>>>>>>>         int r;
>>>>>>>>         if (connector->connector_type == DRM_MODE_CONNECTOR_eDP &&
>>>>>>>> -        amdgpu_dm_abm_level < 0) {
>>>>>>>> +        amdgpu_dm_abm_level == -1) {
>>>>>>>>             r = sysfs_create_group(&connector->kdev->kobj,
>>>>>>>>                            &amdgpu_group);
>>>>>>>>             if (r)
>>>>>>>> @@ -7654,7 +7654,7 @@ void amdgpu_dm_connector_init_helper(struct
>>>>>>>> amdgpu_display_manager *dm,
>>>>>>>>         if (connector_type == DRM_MODE_CONNECTOR_eDP &&
>>>>>>>>             (dc_is_dmcu_initialized(adev->dm.dc) ||
>>>>>>>> -         adev->dm.dc->ctx->dmub_srv) && amdgpu_dm_abm_level < 0) {
>>>>>>>> +         adev->dm.dc->ctx->dmub_srv) && amdgpu_dm_abm_level ==
>>>>>>>> -2) {
>>>>>>>> drm_object_attach_property(&aconnector->base.base,
>>>>>>>> adev->mode_info.abm_level_property, 0);
>>>>>>>>         }

