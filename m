Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FE0858056
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 16:13:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7496D10EBBE;
	Fri, 16 Feb 2024 15:13:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RzpoW9kR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2043.outbound.protection.outlook.com [40.107.237.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0070510EBB9;
 Fri, 16 Feb 2024 15:13:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y1IkJwKcWf7Lvs00FDAODDu28cu8HddFx+2ijpK2P56X/aODRzySWSWzYzqOyq5e3xTYqa32PukdA6THFM4/GOBnmCauP5D6/2hrTDjv6YMuMS55Je0xjBdCgTYwF4y5soRnOrclrtJplNl7KeorHgpf+71f63nfd24uezaBzx0Q4Bw/28dYfwT66/wFkNyTYLLK82V+B++BR965vk3DX4ozRIXRxRQu1jlQT2szx0f2RWo51QZ+dOqXDEF8K6dgsMz2izYh4dxmSLJSvZEAGbfBZPhMkGSQNUbOk29PjPKett3pCa9wXvZYqBXwrhCjkXlVQHU99ixQ2AHfaSCeHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RYQplBDiAZu1T2WSHsMzZzvmNrmWiw6+k1Of/kGjldQ=;
 b=GbS3r0eCemqgxh5oCA+rsnjW4B2ptq2/lk5fFUqrmYkHOU0ZOX8iJTuRIl1Y22MqbSokqAf6OW1WfDzevhT1N9CQfWFfPrrC/O/Kd1Ib8zLvTbP31l20Rf3c3ziD+cVpK0XcFF5XNuMEepQ2nueSrCtE52jXvTLALUOgdEkPi1mL75azv8wYEHptTUSJSRvLiEfKHekq+6WwaK9FENXCVTqysjXDyEScF5n6E9iHJkcrZxd4Hc5ksBwcY083f3ruPiRQoT8k7jPq//IIpPkq+lqFVfEXt0boEj7Og8XloWiOU/ODqdfcmqBYJvw+8MCijWGiBJ1pWsQUgqLCkjuWJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RYQplBDiAZu1T2WSHsMzZzvmNrmWiw6+k1Of/kGjldQ=;
 b=RzpoW9kRMgzPFWpHCjiaHCndVSCzRi0SR/sJTR+B3eoWJUDSvLg7NFdcWZNKJYPjM+m4gt3jjRCuIxR+87Al8DoSowrGqVDF2zhz9KfeBtU07BhWP7XMC6NaZD9NDRYf2N3AWUDCBkwiQHJWIUe35ZdVeKODvXU0dPQUANpr9Ow=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH2PR12MB4120.namprd12.prod.outlook.com (2603:10b6:610:7b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.15; Fri, 16 Feb
 2024 15:13:02 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dd00:9ab5:4d11:2d1a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dd00:9ab5:4d11:2d1a%7]) with mapi id 15.20.7316.012; Fri, 16 Feb 2024
 15:13:01 +0000
Message-ID: <126803c6-177a-4ffd-8b65-856fb83f9972@amd.com>
Date: Fri, 16 Feb 2024 09:12:59 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd: Only allow one entity to control ABM
Content-Language: en-US
To: Harry Wentland <harry.wentland@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Hamza Mahfooz <Hamza.Mahfooz@amd.com>,
 Sun peng Li <Sunpeng.Li@amd.com>
References: <20240216140709.73708-1-mario.limonciello@amd.com>
 <8970de85-3117-4e28-82b4-3b35c5beb7cf@gmail.com>
 <6b9e6f24-8fa5-43c5-88a2-068dfcb9996e@amd.com>
 <e47b859d-eb0c-49f8-8a96-6f454fa18592@gmail.com>
 <20361f26-2c83-4619-8f9e-ec8788b8280f@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20361f26-2c83-4619-8f9e-ec8788b8280f@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0010.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::12) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH2PR12MB4120:EE_
X-MS-Office365-Filtering-Correlation-Id: bac46ecd-54e8-4d45-7e52-08dc2f01c471
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 21kdXgC3d6IBmOjJXiSrClWlGDuKwCLmnqItTL4icaaeX4CrnTJZpe9OIm7ItUBbAMNmuOzCzka33cmoAUt4qfH4P1nolis76+osQ5vaSrfbE2GJDo8ykdQyDDeGP0Nrl8fp/CbhI99Uyf5V1g8W3gfdHhWW725a/PoNNHOZJEUAz6+ZP9WMaAs/xs+HXWXsZu2qzib5WevUx7w5KkRnDwnKxrRHTqJ7SbC6+ku51p9u6Bsgvn08hEsjA6hqoWpGEBDzbYII78SvrYUkoE7U73UvZJeMQkdiofuyxSyHIRnwT4SOfgovKynVK/tj1d7wC+KzpcepQXXw4AfFz8XuOPmgJPpE0PEUk8J6wjg4la74Lc52DnDQsyCEyPHKZvw10t1WVYuKjnTeJcgebSRGx8FPNU4GqR1HOzWaXExftzB//lUFekMT/qDadVrl1YT15UwYxgDe2pziq3DCYJvoAx8XjUi4QaIN1wnIYsYbK9QxGhG6yN+KDUNunU4AN3bz6ZNhqvtThde6s2MDNc9XzSWEGjWh84J23Wc/LIo7QylngSt+RDGQZdpkoTdeEBqS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(376002)(366004)(136003)(396003)(230273577357003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(38100700002)(31696002)(86362001)(36756003)(6512007)(966005)(6506007)(478600001)(316002)(41300700001)(6486002)(54906003)(110136005)(66574015)(2616005)(26005)(53546011)(83380400001)(66899024)(2906002)(30864003)(44832011)(66946007)(4326008)(66556008)(8676002)(66476007)(31686004)(8936002)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzhJRnFqVlZQckdIWUpMWVprd296OUkxTUZZa2JUNkNkb21XM2tSTXg2ZXFu?=
 =?utf-8?B?S2RoZFlDSGZObHVLcm9OZ3kxUGRBRGFKMlhZbE02V0xXTVZSalBsbWgrQkV5?=
 =?utf-8?B?RW1vdVhaTnUwU1BMN3RyR1dXbGRBMy9QcUVvSENWS1VxTThnWlJnSHRnakUv?=
 =?utf-8?B?SGVzazBJZHZtUG9WTk5CTVZoV1BPUnNPYjk0dExXc2ZtMFNyRnJRRFhEQjBR?=
 =?utf-8?B?aEg0cU5nSTN1WGViU3JOL0tsdXY3MzdES2VYQ3VWNHM3MmtDSytRd0x6TVF5?=
 =?utf-8?B?d1Q3eVRVMGhKUzYza24vOTJ3K1YvVC9jYy9SN2MyZEhia2t1SEJqazJOZ05v?=
 =?utf-8?B?ZExFR2NGclorU3ltUGhjTS9BT2x5VG5NVmZzVVc2K2pCRUtxbU1uMlBTSDdZ?=
 =?utf-8?B?ajVTR2Zza0xwaDh3bmpoZVdpSGxJdndLKzhneHhjWjFSRDVaTENPS29RR0FJ?=
 =?utf-8?B?aUp2cHd3ekJWdm8vdmRiRm9IK1RzK1ZGZGFjbDRGZ2NSaHlVU1l1YUhQUk5D?=
 =?utf-8?B?ZzFFVGtDemZyUExjbWdoRE5lMUNVbTYxZHNaZGNQZ094MGtkTU55WEdZUHBX?=
 =?utf-8?B?dEZOM0JsTllHS084eWVFakZ6N3pSeDZsTDExTjBuSjNyY0FMSERzcGVDK1Vm?=
 =?utf-8?B?MFQ2c05JOU56MVpURVhLMEx0aE95ZDFOWlBsK2U1SWVIREFJTldSUXdBQW1j?=
 =?utf-8?B?bUFvdzRjTHV1c3RPeUswR044YjJ6bEpDaFUvNVZhSytoT1VTOWo0emNvcFBm?=
 =?utf-8?B?RmVUbWxBa0U3T25UejhBT0ZaSnBVRExNOFpiZ0JQZEY1OVhjR1lHU1REcnYw?=
 =?utf-8?B?VmZyRkRGemRDV2FoaVI0bkJQeDlmOThlbGFVK0xWV3Q2a0FScE1PRDBYZHVJ?=
 =?utf-8?B?TjAxSjg1U1dGTWRYdXRycFo4NlZlcSsydEw0ci90c1dFcHVKbFdqNjBvdDJZ?=
 =?utf-8?B?VTI1YkNlTFVENUpGYTRRLzN6UDNTeUFkc0FadXBvNUxXWnM3Nkd0dVlUbFh1?=
 =?utf-8?B?V2dLb3hLeDJLWjd6aXRsbTlHY3UzMThjU2NnSkNMcDBwU3FBV0JWNWtYZkpM?=
 =?utf-8?B?Y2Y2U2F1K2orT3NaRmFuNXlQTUZFZGpXUTVyWjBLTzNyRytmS1VWVnNxaXc3?=
 =?utf-8?B?a201N3owa2R1R3o0YTJobnNHU2U4ZlB4RStHYjQya1R2dUt2R2liVE1MS01k?=
 =?utf-8?B?N2lvV2NDeGNDWkRmTUd3Y2VEVTQ4RHhsV0wzeEo4VnhxR09CUVB1SWVEKzVJ?=
 =?utf-8?B?TEpMNXNkdVR4dlZaSjFoYnV0OXpZekZtNEpvU2tZT1p6TjgzVjdIOWViQ3kv?=
 =?utf-8?B?eGZWQm51OUlwc0Qvc3h5NUhqNldNZ3lIT1k3WXQ3Q2VXNzVWQ2JqSzJHOWJR?=
 =?utf-8?B?UFdHeXhRS2x2SjhjaE1ibE9MZ2hWVUpkK3ErVXovVjhkSUxmQUhrWjMvdnZx?=
 =?utf-8?B?STAzMldXMlc3S2tnbzNCcnZQMEF5U0g0M0NuMnFmczZmZU9QeXhGc0syZm5D?=
 =?utf-8?B?aThBL29kalFBQk82b0VWZFAydTRmQUdHeGQ0RWttOXE3K2pRN2ZVR0lNaU8v?=
 =?utf-8?B?WmllaDVsY1lMR25jMzR1bXFVZnJLWDR1Vm9UY0sxRThZaitPZEovZWJabDRu?=
 =?utf-8?B?N085OEFmTG1qSWxYY0YwdmlvcFV5Ujdod0RIRnZZdTgwaWdibGZaclNDam9k?=
 =?utf-8?B?RXF1R0wvWmRKbC9Eclc3TFR2aVRlM2dsTzV1K21KcXdBMHJlUHcwWEI5enJt?=
 =?utf-8?B?bzl2QUNJb0xwWkJrQ05kZE9lTEZUN2daYnVMc0lrWk44eml3UUwwUmgwUzhq?=
 =?utf-8?B?cTUyNmRES3VpYUV1M1REMFc4WnpiT0VWZ3RFbFlJeDdOc0tCNzdBWXV6NXJi?=
 =?utf-8?B?MXpaTlF5Z1U5cUJJMCtQR2ptYlp2eVVpSy9wZHJoOUQxdHVmSGZCUW5OcFZF?=
 =?utf-8?B?L1hoaU54b3JzOXRnN2NPT2oyK3lqamNYTzI4Smg1RjBiV0I3SEZ5OEk0T0k5?=
 =?utf-8?B?Mk1SS1YxZDU5ckV6MUdDOWp6dVE2dGN6TjRPVlhGM0N2OUJqbTEyTnhxbWVF?=
 =?utf-8?B?eG5ZVTJmWjkwZ0UyS1ZYa1pabE5idkZGbzhjZmE2TWFZY1ZUMTYzaWFhSmQ2?=
 =?utf-8?Q?7+KqslE5zPpWTaBQh2lSramiE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bac46ecd-54e8-4d45-7e52-08dc2f01c471
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 15:13:01.8494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Ps/FFxBklJXnHv+tNcW5ofXlRk5jQNxaiiynkX4Kox/UqF4JS/WBacdZN1egQYJswCkG0aqxG1Jlj/9KFhYbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4120
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

On 2/16/2024 09:05, Harry Wentland wrote:
> 
> 
> On 2024-02-16 09:47, Christian König wrote:
>> Am 16.02.24 um 15:42 schrieb Mario Limonciello:
>>> On 2/16/2024 08:38, Christian König wrote:
>>>> Am 16.02.24 um 15:07 schrieb Mario Limonciello:
>>>>> By exporting ABM to sysfs it's possible that DRM master and software
>>>>> controlling the sysfs file fight over the value programmed for ABM.
>>>>>
>>>>> Adjust the module parameter behavior to control who control ABM:
>>>>> -2: DRM
>>>>> -1: sysfs (IE via software like power-profiles-daemon)
>>>>
>>>> Well that sounds extremely awkward. Why should a power-profiles-deamon has control over the panel power saving features?
>>>>
>>>> I mean we are talking about things like reducing backlight level when the is inactivity, don't we?
>>>
>>> We're talking about activating the ABM algorithm when the system is in power saving mode; not from inactivity.  This allows the user to squeeze out some extra power "just" in that situation.
>>>
>>> But given the comments on the other patch, I tend to agree with Harry's proposal instead that we just drop the DRM property entirely as there are no consumers of it.
>>
>> Yeah, but even then the design to let this be controlled by an userspace deamon is questionable. Stuff like that is handled inside the kernel and not exposed to userspace usually.
>>

Regarding the "how" and "why" of PPD; besides this panel power savings 
sysfs file there are two other things that are nominally changed.

ACPI platform profile: 
https://www.kernel.org/doc/html/latest/userspace-api/sysfs-platform_profile.html

AMD-Pstate EPP value: 
https://www.kernel.org/doc/html//latest/admin-guide/pm/amd-pstate.html

When a user goes into "power saving" mode both of those are tweaked. 
Before we introduced the EPP tweaking in PPD we did discuss a callback 
within the kernel so that userspace could change "just" the ACPI 
platform profile and everything else would react.  There was pushback on 
this, and so instead knobs are offered for things that should be tweaked 
and the userspace daemon can set up policy for what to do when a a user 
uses a userspace client (such as GNOME or KDE) to change the desired 
system profile.

> 
> I think we'll need a bit in our kernel docs describing ABM. Assumptions around what it is and does seem to lead to confusion.
> 
> The thing is that ABM has a visual impact that not all users like. It would make sense for users to be able to change the ABM level as desired, and/or configure their power profiles to select a certain ABM level.
> 
> ABM will reduce the backlight and compensate by adjusting brightness and contrast of the image. It has 5 levels: 0, 1, 2, 3, 4. 0 means off. 4 means maximum backlight reduction. IMO, 1 and 2 look okay. 3 and 4 can be quite impactful, both to power and visual fidelity.
> 

Aside from this patch Hamza did make some improvements to the kdoc in 
the recent patches, can you read through again and see if you think it 
still needs improvements?

> Harry
> 
>> Regards,
>> Christian.
>>
>>>
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> 0-4: User via command line
>>>>>
>>>>> Also introduce a Kconfig option that allows distributions to choose
>>>>> the default policy that is appropriate for them.
>>>>>
>>>>> Fixes: f97e4303da16 ("drm/amd/display: add panel_power_savings sysfs entry to eDP connectors")
>>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>>>> ---
>>>>> Cc: Hamza Mahfooz <Hamza.Mahfooz@amd.com>
>>>>> Cc: Harry Wentland <Harry.Wentland@amd.com>
>>>>> Cc: Sun peng (Leo) Li <Sunpeng.Li@amd.com>
>>>>>    drivers/gpu/drm/amd/amdgpu/Kconfig            | 72 +++++++++++++++++++
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       | 23 +++---
>>>>>    .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  6 +-
>>>>>    3 files changed, 90 insertions(+), 11 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/amdgpu/Kconfig
>>>>> index 22d88f8ef527..2ab57ccf6f21 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/Kconfig
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
>>>>> @@ -80,6 +80,78 @@ config DRM_AMDGPU_WERROR
>>>>>          Add -Werror to the build flags for amdgpu.ko.
>>>>>          Only enable this if you are warning code for amdgpu.ko.
>>>>> +choice
>>>>> +    prompt "Amdgpu panel power Savings"
>>>>> +    default AMDGPU_SYSFS_ABM
>>>>> +    help
>>>>> +        Control the default behavior for adaptive panel power savings.
>>>>> +
>>>>> +        Panel power savings features will sacrifice color accuracy
>>>>> +        in exchange for power savings.
>>>>> +
>>>>> +        This can be configured for:
>>>>> +        - dynamic control by the DRM master
>>>>> +        - dynamic control by sysfs nodes
>>>>> +        - statically by the user at kernel compile time
>>>>> +
>>>>> +        This value can also be overridden by the amdgpu.abmlevel
>>>>> +        module parameter.
>>>>> +
>>>>> +config AMDGPU_DRM_ABM
>>>>> +    bool "DRM Master control"
>>>>> +    help
>>>>> +        Export a property called 'abm_level' that can be
>>>>> +        manipulated by the DRM master for supported hardware.
>>>>> +
>>>>> +config AMDGPU_SYSFS_ABM
>>>>> +    bool "sysfs control"
>>>>> +    help
>>>>> +        Export a sysfs file 'panel_power_savings' that can be
>>>>> +        manipulated by userspace for supported hardware.
>>>>> +
>>>>> +config AMDGPU_HARDCODE_ABM0
>>>>> +    bool "No Panel power savings"
>>>>> +    help
>>>>> +        Disable panel power savings.
>>>>> +        It can only overridden by the kernel command line.
>>>>> +
>>>>> +config AMDGPU_HARDCODE_ABM1
>>>>> +    bool "25% Panel power savings"
>>>>> +    help
>>>>> +        Set the ABM panel power savings algorithm to 25%.
>>>>> +        It can only overridden by the kernel command line.
>>>>> +
>>>>> +config AMDGPU_HARDCODE_ABM2
>>>>> +    bool "50% Panel power savings"
>>>>> +    help
>>>>> +        Set the ABM panel power savings algorithm to 50%.
>>>>> +        It can only overridden by the kernel command line.
>>>>> +
>>>>> +config AMDGPU_HARDCODE_ABM3
>>>>> +    bool "75% Panel power savings"
>>>>> +    help
>>>>> +        Set the ABM panel power savings algorithm to 75%.
>>>>> +        It can only overridden by the kernel command line.
>>>>> +
>>>>> +config AMDGPU_HARDCODE_ABM4
>>>>> +    bool "100% Panel power savings"
>>>>> +    help
>>>>> +        Set the ABM panel power savings algorithm to 100%.
>>>>> +        It can only overridden by the kernel command line.
>>>>> +endchoice
>>>>> +
>>>>> +config AMDGPU_ABM_POLICY
>>>>> +    int
>>>>> +    default -2 if AMDGPU_DRM_ABM
>>>>> +    default -1 if AMDGPU_SYSFS_ABM
>>>>> +    default 0 if AMDGPU_HARDCODE_ABM0
>>>>> +    default 1 if AMDGPU_HARDCODE_ABM1
>>>>> +    default 2 if AMDGPU_HARDCODE_ABM2
>>>>> +    default 3 if AMDGPU_HARDCODE_ABM3
>>>>> +    default 4 if AMDGPU_HARDCODE_ABM4
>>>>> +    default -1
>>>>> +
>>>>> +
>>>>>    source "drivers/gpu/drm/amd/acp/Kconfig"
>>>>>    source "drivers/gpu/drm/amd/display/Kconfig"
>>>>>    source "drivers/gpu/drm/amd/amdkfd/Kconfig"
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>> index af7fae7907d7..00d6c8b58716 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>> @@ -844,17 +844,24 @@ module_param_named(visualconfirm, amdgpu_dc_visual_confirm, uint, 0444);
>>>>>     * DOC: abmlevel (uint)
>>>>>     * Override the default ABM (Adaptive Backlight Management) level used for DC
>>>>>     * enabled hardware. Requires DMCU to be supported and loaded.
>>>>> - * Valid levels are 0-4. A value of 0 indicates that ABM should be disabled by
>>>>> - * default. Values 1-4 control the maximum allowable brightness reduction via
>>>>> - * the ABM algorithm, with 1 being the least reduction and 4 being the most
>>>>> - * reduction.
>>>>> + * Valid levels are -2 through 4.
>>>>>     *
>>>>> - * Defaults to -1, or disabled. Userspace can only override this level after
>>>>> - * boot if it's set to auto.
>>>>> + *  -2: indicates that ABM should be controlled by DRM property 'abm_level.
>>>>> + *  -1: indicates that ABM should be controlled by the sysfs file
>>>>> + *      'panel_power_savings'.
>>>>> + *   0: indicates that ABM should be disabled.
>>>>> + * 1-4: control the maximum allowable brightness reduction via
>>>>> + *      the ABM algorithm, with 1 being the least reduction and 4 being the most
>>>>> + *      reduction.
>>>>> + *
>>>>> + * Both the DRM property 'abm_level' and the sysfs file 'panel_power_savings'
>>>>> + * will only be available on supported hardware configurations.
>>>>> + *
>>>>> + * The default value is configured by kernel configuration option AMDGPU_ABM_POLICY
>>>>>     */
>>>>> -int amdgpu_dm_abm_level = -1;
>>>>> +int amdgpu_dm_abm_level = CONFIG_AMDGPU_ABM_POLICY;
>>>>>    MODULE_PARM_DESC(abmlevel,
>>>>> -         "ABM level (0 = off, 1-4 = backlight reduction level, -1 auto (default))");
>>>>> +         "ABM level (0 = off, 1-4 = backlight reduction level, -1 = sysfs control, -2 = drm control");
>>>>>    module_param_named(abmlevel, amdgpu_dm_abm_level, int, 0444);
>>>>>    int amdgpu_backlight = -1;
>>>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>>> index b9ac3d2f8029..147fe744f82e 100644
>>>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>>> @@ -6515,7 +6515,7 @@ static void amdgpu_dm_connector_unregister(struct drm_connector *connector)
>>>>>        struct amdgpu_dm_connector *amdgpu_dm_connector = to_amdgpu_dm_connector(connector);
>>>>>        if (connector->connector_type == DRM_MODE_CONNECTOR_eDP &&
>>>>> -        amdgpu_dm_abm_level < 0)
>>>>> +        amdgpu_dm_abm_level == -1)
>>>>>            sysfs_remove_group(&connector->kdev->kobj, &amdgpu_group);
>>>>> drm_dp_aux_unregister(&amdgpu_dm_connector->dm_dp_aux.aux);
>>>>> @@ -6623,7 +6623,7 @@ amdgpu_dm_connector_late_register(struct drm_connector *connector)
>>>>>        int r;
>>>>>        if (connector->connector_type == DRM_MODE_CONNECTOR_eDP &&
>>>>> -        amdgpu_dm_abm_level < 0) {
>>>>> +        amdgpu_dm_abm_level == -1) {
>>>>>            r = sysfs_create_group(&connector->kdev->kobj,
>>>>>                           &amdgpu_group);
>>>>>            if (r)
>>>>> @@ -7654,7 +7654,7 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
>>>>>        if (connector_type == DRM_MODE_CONNECTOR_eDP &&
>>>>>            (dc_is_dmcu_initialized(adev->dm.dc) ||
>>>>> -         adev->dm.dc->ctx->dmub_srv) && amdgpu_dm_abm_level < 0) {
>>>>> +         adev->dm.dc->ctx->dmub_srv) && amdgpu_dm_abm_level == -2) {
>>>>> drm_object_attach_property(&aconnector->base.base,
>>>>>                    adev->mode_info.abm_level_property, 0);
>>>>>        }
>>>>
>>>
>>
> 

