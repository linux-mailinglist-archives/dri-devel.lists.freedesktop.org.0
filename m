Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB62885BE30
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 15:09:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D92510E42F;
	Tue, 20 Feb 2024 14:09:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IO3LbziJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2063.outbound.protection.outlook.com [40.107.92.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCE1E10E42E;
 Tue, 20 Feb 2024 14:09:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZIeMJXB4eHbxPzbPU01jnEML7YeRl6RbWNLc4pnW0qc2uUsvvsLPITdiBfc0eHvKHtcO5HZWH5v46sAThBXQFG0rt5siZtm55UJLaFUwaC7dmjSDDxA0tNFGdMGx2EKaYb2xfhXzS1Ez+Y8vegIC9YQXa4kep968DuVPqZexQdCoG2/r4Lb7pM5jajNAwX1FhdcD12EkotMJ/DtUrfsRpxYdp5OavWxlgTUofNVTxk1XOlmV6/xoCIBbh8v9oV662bliZ7Q3fsAfcPVhYQwWuBNycKuxyUJ99DcgROoVFhQAUhoRzgtDT+/cadb0E0/4N9QwwbDYrqQZHyCUGHwrBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RWIqA2yliZMudRze5As4pSXhq2mjCCjVOYOyrFyQemg=;
 b=VK796NN8TfV8xjemK4duYOhbREJnoWkIJdrsP6m8I25r3rnVLOEOvcOWn9s8ajq0Ff6+kPv6O6E3O/dqkIzN+jBK5ZPIVDA9owLlr2+iijjNdRbGrlICBjeh/u5CyLQ637qL6G+A5IYPRxKHw86O9Ry6rw1Iex4rk4FtH4NBKkZLeWmvDBPPN6tZSB/uMj63G+wSxls7vuA0In2DYOTD+kLNr9IM6CItGgmmiRuKu+gYvxzdnPE/6EVxoK7NolZ1GUP216W+Mqwt2C05lqvIFQgir3pqzgQwNGzWX9JproccZQToeK6OOs8e2Mo76c8jc8h2r7knA22rG4G11gVjAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RWIqA2yliZMudRze5As4pSXhq2mjCCjVOYOyrFyQemg=;
 b=IO3LbziJjYOM84A7I6skMmDUBAQO4L5thBgurmePrmSVJFkYnlSgVaW6CKE7UCjaGmB0//Ew7vbyVj9Tr89vfFFRo3GcQJbv1cjRi9yzBMrXYDl+b0+dDThRkaSK4BYuBajwp8j2JAvIF15rKuB1jqZpUIvdx7oOQlvBWqG5/1I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB6357.namprd12.prod.outlook.com (2603:10b6:8:96::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.20; Tue, 20 Feb
 2024 14:09:39 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7316.018; Tue, 20 Feb 2024
 14:09:39 +0000
Message-ID: <4db052e8-9350-4e35-8dcf-22740769a6fa@amd.com>
Date: Tue, 20 Feb 2024 15:09:31 +0100
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
 <8d6402eb-804b-4b8c-8322-ce374d864bad@amd.com>
 <CADnq5_N9=ngOr5srp9CGZRx-=JVmQxte5MgpkcRnTMcSCNfuYA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CADnq5_N9=ngOr5srp9CGZRx-=JVmQxte5MgpkcRnTMcSCNfuYA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0231.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB6357:EE_
X-MS-Office365-Filtering-Correlation-Id: 8615ab7f-03c6-486d-f07c-08dc321d936f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AMXnJYknh8q/o7N5BjzpTs/yNqVHZlbLe2rFJWy8WEZDtv2C68VaHtJh9DTuiqKGWn9+DJcPHY1Nvtlps8E3PQwiKqcGLucPsplbth2NefL7Ur1U7G7DqG5qXN++JYNTMdC+xMHsIoLPz+hVZ039mkbQQIETjbxtZUkSOELDAUjCfZd2T2BadEVDtACDUn/Nl+ikIo4SAkz8LLZ7N286XEOLMarcVmPsPJVMI6H3ItwYfoVS0/18S90aaobA4Qs/qbWArISXNtqJKEAUYYMvStF1TXnythKiTjRO7TZbCeRJcUAC2Obs4JcaSSgKFYYJ5/L2Frik+jXeKhrSt6IPAhwdRCtwh3PRBsGYpL/J/W/tArqoOGvRlRroe2entSawZv2GrV4M2nUlCeo/mgurJJ6wQaWN+xZYtguCqtR6w1rfUhi65fHkUswrob9In0vJ39xHIf3sOOoGDBAu6Ly4T0wGNK43cLqp+49gI0DJa9gcNxgdlCkwjaegCsgpAOncRiHiPxsRYFcGWVcf3acaIlY8X/b4immMNBYVv3JqusDQGdKZMmjEIvsBwrrMNGKi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(230273577357003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3BFN01kRlRGNkRrQmdRNjF5WjErWWlrekF3c1ZyTklQZlVmcG5UaWlnZ05R?=
 =?utf-8?B?UkhhN3NydGE2b1NOdm05b1VrTTJhOUdRQTBpUDlySmg5SGkwYUhFTWxIRjhK?=
 =?utf-8?B?dnIrVUU4bytjMk8zOXllSzYxVkQ4R3cwOVpLNlMyZStMMlo3d1o5Y2VScGIx?=
 =?utf-8?B?ODNxZ3A2Z1pzenNkYys4THFwZ0k1Tm55NHdVWHd5elFXbk9yeGU4TFBHVUZW?=
 =?utf-8?B?dWFTUWowVytlL0svQk5ZSkp1YmR3NlRicE5DMUk4eWZZam9JVVA2L2x6Wmha?=
 =?utf-8?B?bkJUYU9GVnpNR2htNFkwbURoUmZIc0hYWllrNmYwVUh1OTRaaDd0eUp3Uk9j?=
 =?utf-8?B?K0JvYzFXTklPT25oQkh2ajRiZEZIWHcyOUVPTHZTVldPSWxTZmFMSmdKMC9l?=
 =?utf-8?B?WXFXb1p3Z0IyQkl4c1RtV0lBaG5GbVl1MCtEUnMvVGozVVFQa1ltd2hkWG1U?=
 =?utf-8?B?NFAwQWllb2VrLzQwMittc1hQeW5oaUNyViswbjNpZjUvWk5WVm9yM0NpUXZK?=
 =?utf-8?B?U3gxMkJFSU1tK0hmTXRhcW5TbURsM3pyWlNLb0hjS1cxdWczVkFJNTUyUWZa?=
 =?utf-8?B?ZFh6Rk9TeVA2NnlINFlJcHBianB5MU1DclhVSGdaNW1Jdy9UL24yVjJGeWpk?=
 =?utf-8?B?R0VOamM1YjFXOWRiZUJWYVdodEZqY1Rqc3lZNS9HWXZScnA0TkVMSnByNGZz?=
 =?utf-8?B?aE8rVVNkQ2U3STVWNjF1dGtieWVnUDRDdXI5eFlUc1hKUE9hK3pMYmFVc0xw?=
 =?utf-8?B?d1ZuK0o2U0hYTktvNTRGYWMxOVhOMGJubzNMdWViYWs4bmlNekJ5cm1wS0VI?=
 =?utf-8?B?YVNuWmQwRXZoaWplOTkxWlZtNGY2cnJnQ2NSV2hyeW5BWSs4RE9zaWo0d0Qr?=
 =?utf-8?B?bUpFbjRBMkYvRmc4ZG5iTlF0Q0NBcHlXc0xEcm5UR2hqZWxSWGlEL01YM0ZW?=
 =?utf-8?B?YktCZjkyVnkxbWh2OWdwbHFHK2ZCck80dE1GUUMwU0lYNEZmMjhLeWNPSUZt?=
 =?utf-8?B?ejhFUWRENHJ0V2Rqd0s5TWhVWTB0MFVnNWJtcjlTZ2p6Y1hXaXd0eGZwTCs5?=
 =?utf-8?B?V2NoZjA0QU1YRitWUGJmWUExVmdzMlc3K1gxRjdXYit5WWhTVVVrb2h2cThP?=
 =?utf-8?B?a1o0dDNLeTVNdVVYZllBemI5SXZuWjFGcktLYUlLaHY3WkdBVlFid1dZYmtL?=
 =?utf-8?B?d1VVRFRrUUN5SCtFOG1CTEtXV055a2xJY2JweGJuTWZqRmV0WEIyMlVSVS9G?=
 =?utf-8?B?cFprZ2g2Z0syN2RoTFpSbW1KWERJc3Z3UStQUDI3dEFVTUZoeGZvRXJMbEZS?=
 =?utf-8?B?dG84a1g0OGpvblVVdXEzRUtVVkhYcEhTQ1BKTmZ2c2VIOGdtNUZJR242ZGU1?=
 =?utf-8?B?ZDUwRG1aUjVrbkdYZEpUaVllbEpKZ3doejVPaHVLc21wVCszQmZzQTFkOEJh?=
 =?utf-8?B?SWdXOSsrZWxNQ3RqYzc2dXdxUW5FV3ovekVIeDQreTE2L2hjaENqemI1SDBx?=
 =?utf-8?B?c2xXbjVyaC85SEkrVmtGNm9xWUxGN0MyOWdVa3BXN1RKZWRtSEwxUG9JYkti?=
 =?utf-8?B?RThQU1NoTXZHcnIzb3JZcDBBS2kzT3ZPQ2Y4R1AyNlRXbjh5VCtjQWV5ZnV2?=
 =?utf-8?B?NGo0dmZrK2hTRlpVbFZCMmRabWJRcEpsV1U0dENBVDVUdUJQZ0dDMmNQYkJ4?=
 =?utf-8?B?QS93MTdBT0dpaERzSGVobHFKY3pZM28zSjBJeXNFVi93cUp2clpnVDJRUk9T?=
 =?utf-8?B?YXY5THE0ZTFxbWJBTzZUUVVmWnNPaW9mTmZwRWlXZllDaUJhTXhsWW9tRXBB?=
 =?utf-8?B?QTNZMjF6S29NQTE4M2c3VE03cSt3NmJVNjQxUWVORkNKb0JBcmlLeEt2dGZx?=
 =?utf-8?B?TUl0ZjlBOVY1ZVNFc0x6eGdMTHIwam1KWWFvcnFUdTRkcVFDTEVIK3I1THF2?=
 =?utf-8?B?U0FwY1kzYVF4aUJKbjlTdnY0UERSSE1oYndZNUVLaDloZmVycXpnci9zMGNJ?=
 =?utf-8?B?amNuZUhLelZNRnc2RFY1T2lzeVhpU0JnU3ZidzJIY0RkUnkxREx5YzVQMlJH?=
 =?utf-8?B?NWZHRUxyR2NhTzh2MUVuSVRDdUxzSVdFdFVGaWtReWtBdlAvdFVKczJLcDN2?=
 =?utf-8?Q?4+GJdEVjLHkXG2CkpPrMWtJGk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8615ab7f-03c6-486d-f07c-08dc321d936f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 14:09:39.1621 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FlIv6s6Eaou/Jx/t5wviW2w0DD6S+DYu+IPtVgc05K4zTLwaJkEw6OHPpqbYwTgY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6357
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

Am 19.02.24 um 16:28 schrieb Alex Deucher:
> On Mon, Feb 19, 2024 at 10:19 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 16.02.24 um 19:37 schrieb Alex Deucher:
>>> On Fri, Feb 16, 2024 at 10:42 AM Christian König
>>> <christian.koenig@amd.com> wrote:
>>>> Am 16.02.24 um 16:12 schrieb Mario Limonciello:
>>>>> On 2/16/2024 09:05, Harry Wentland wrote:
>>>>>> On 2024-02-16 09:47, Christian König wrote:
>>>>>>> Am 16.02.24 um 15:42 schrieb Mario Limonciello:
>>>>>>>> On 2/16/2024 08:38, Christian König wrote:
>>>>>>>>> Am 16.02.24 um 15:07 schrieb Mario Limonciello:
>>>>>>>>>> By exporting ABM to sysfs it's possible that DRM master and software
>>>>>>>>>> controlling the sysfs file fight over the value programmed for ABM.
>>>>>>>>>>
>>>>>>>>>> Adjust the module parameter behavior to control who control ABM:
>>>>>>>>>> -2: DRM
>>>>>>>>>> -1: sysfs (IE via software like power-profiles-daemon)
>>>>>>>>> Well that sounds extremely awkward. Why should a
>>>>>>>>> power-profiles-deamon has control over the panel power saving
>>>>>>>>> features?
>>>>>>>>>
>>>>>>>>> I mean we are talking about things like reducing backlight level
>>>>>>>>> when the is inactivity, don't we?
>>>>>>>> We're talking about activating the ABM algorithm when the system is
>>>>>>>> in power saving mode; not from inactivity.  This allows the user to
>>>>>>>> squeeze out some extra power "just" in that situation.
>>>>>>>>
>>>>>>>> But given the comments on the other patch, I tend to agree with
>>>>>>>> Harry's proposal instead that we just drop the DRM property
>>>>>>>> entirely as there are no consumers of it.
>>>>>>> Yeah, but even then the design to let this be controlled by an
>>>>>>> userspace deamon is questionable. Stuff like that is handled inside
>>>>>>> the kernel and not exposed to userspace usually.
>>>>>>>
>>>>> Regarding the "how" and "why" of PPD; besides this panel power savings
>>>>> sysfs file there are two other things that are nominally changed.
>>>>>
>>>>> ACPI platform profile:
>>>>> https://www.kernel.org/doc/html/latest/userspace-api/sysfs-platform_profile.html
>>>>>
>>>>> AMD-Pstate EPP value:
>>>>> https://www.kernel.org/doc/html//latest/admin-guide/pm/amd-pstate.html
>>>>>
>>>>> When a user goes into "power saving" mode both of those are tweaked.
>>>>> Before we introduced the EPP tweaking in PPD we did discuss a callback
>>>>> within the kernel so that userspace could change "just" the ACPI
>>>>> platform profile and everything else would react.  There was pushback
>>>>> on this, and so instead knobs are offered for things that should be
>>>>> tweaked and the userspace daemon can set up policy for what to do when
>>>>> a a user uses a userspace client (such as GNOME or KDE) to change the
>>>>> desired system profile.
>>>> Ok, well who came up with the idea of the userspace deamon? Cause I
>>>> think there will be even more push back on this approach.
>>>>
>>>> Basically when we go from AC to battery (or whatever) the drivers
>>>> usually handle that all inside the kernel today. Involving userspace is
>>>> only done when there is a need for that, e.g. inactivity detection or
>>>> similar.
>>> Well, we don't want policy in the kernel unless it's a platform or
>>> hardware requirement.  Kernel should provide the knobs and then
>>> userspace can set them however they want depending on user preference.
>> Well, you not have the policy itself but usually the handling inside the
>> kernel.
>>
>> In other words when I connect/disconnect AC from my laptop I can hear
>> the fan changing, which is a switch in power state. Only the beep which
>> comes out of the speakers as conformation is handled in userspace I think.
>>
>> And IIRC changing background light is also handled completely inside the
>> kernel and when I close the lid the display turns off on its own and not
>> because of some userspace deamon.
>>
>> So why is for this suddenly a userspace deamon involved?
> It's a user preference.  Some people won't like ABM, some will.  They
> set the policy from user space.  It's similar to the backlight level.
> Some users always prefer a bright backlight regardless of AC/DC state,
> others want the backlight to get brighter when on AC power.  The
> kernel provides the knobs to set the ABM level and then user space can
> specify the level and also device when they want it enabled (never,
> only on DC, etc.).  The kernel driver for the backlight doesn't change
> the backlight at AC/DC switch, userspace gets an event when the power
> source changes and it then talks to the kernel to change the backlight
> level.  I think lid is handled the same way.  Userspace gets a lid
> event and it turns off the displays and maybe enters suspend or maybe
> not depending on what the user wants.

Ok, well that comes as a surprise. Which userspace component is 
responsible for this?

Christian.

>
> Alex
>
>> Christian.
>>
>>> Alex
>>>
>>>
>>>>>> I think we'll need a bit in our kernel docs describing ABM.
>>>>>> Assumptions around what it is and does seem to lead to confusion.
>>>>>>
>>>>>> The thing is that ABM has a visual impact that not all users like. It
>>>>>> would make sense for users to be able to change the ABM level as
>>>>>> desired, and/or configure their power profiles to select a certain
>>>>>> ABM level.
>>>>>>
>>>>>> ABM will reduce the backlight and compensate by adjusting brightness
>>>>>> and contrast of the image. It has 5 levels: 0, 1, 2, 3, 4. 0 means
>>>>>> off. 4 means maximum backlight reduction. IMO, 1 and 2 look okay. 3
>>>>>> and 4 can be quite impactful, both to power and visual fidelity.
>>>>>>
>>>>> Aside from this patch Hamza did make some improvements to the kdoc in
>>>>> the recent patches, can you read through again and see if you think it
>>>>> still needs improvements?
>>>> Well what exactly is the requirement? That we have different ABM
>>>> settings for AC and battery? If yes providing different DRM properties
>>>> would sound like the right approach to me.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>> Harry
>>>>>>
>>>>>>> Regards,
>>>>>>> Christian.
>>>>>>>
>>>>>>>>> Regards,
>>>>>>>>> Christian.
>>>>>>>>>
>>>>>>>>>> 0-4: User via command line
>>>>>>>>>>
>>>>>>>>>> Also introduce a Kconfig option that allows distributions to choose
>>>>>>>>>> the default policy that is appropriate for them.
>>>>>>>>>>
>>>>>>>>>> Fixes: f97e4303da16 ("drm/amd/display: add panel_power_savings
>>>>>>>>>> sysfs entry to eDP connectors")
>>>>>>>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>>>>>>>>> ---
>>>>>>>>>> Cc: Hamza Mahfooz <Hamza.Mahfooz@amd.com>
>>>>>>>>>> Cc: Harry Wentland <Harry.Wentland@amd.com>
>>>>>>>>>> Cc: Sun peng (Leo) Li <Sunpeng.Li@amd.com>
>>>>>>>>>>      drivers/gpu/drm/amd/amdgpu/Kconfig            | 72
>>>>>>>>>> +++++++++++++++++++
>>>>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       | 23 +++---
>>>>>>>>>>      .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  6 +-
>>>>>>>>>>      3 files changed, 90 insertions(+), 11 deletions(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig
>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/Kconfig
>>>>>>>>>> index 22d88f8ef527..2ab57ccf6f21 100644
>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/Kconfig
>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
>>>>>>>>>> @@ -80,6 +80,78 @@ config DRM_AMDGPU_WERROR
>>>>>>>>>>            Add -Werror to the build flags for amdgpu.ko.
>>>>>>>>>>            Only enable this if you are warning code for amdgpu.ko.
>>>>>>>>>> +choice
>>>>>>>>>> +    prompt "Amdgpu panel power Savings"
>>>>>>>>>> +    default AMDGPU_SYSFS_ABM
>>>>>>>>>> +    help
>>>>>>>>>> +        Control the default behavior for adaptive panel power
>>>>>>>>>> savings.
>>>>>>>>>> +
>>>>>>>>>> +        Panel power savings features will sacrifice color accuracy
>>>>>>>>>> +        in exchange for power savings.
>>>>>>>>>> +
>>>>>>>>>> +        This can be configured for:
>>>>>>>>>> +        - dynamic control by the DRM master
>>>>>>>>>> +        - dynamic control by sysfs nodes
>>>>>>>>>> +        - statically by the user at kernel compile time
>>>>>>>>>> +
>>>>>>>>>> +        This value can also be overridden by the amdgpu.abmlevel
>>>>>>>>>> +        module parameter.
>>>>>>>>>> +
>>>>>>>>>> +config AMDGPU_DRM_ABM
>>>>>>>>>> +    bool "DRM Master control"
>>>>>>>>>> +    help
>>>>>>>>>> +        Export a property called 'abm_level' that can be
>>>>>>>>>> +        manipulated by the DRM master for supported hardware.
>>>>>>>>>> +
>>>>>>>>>> +config AMDGPU_SYSFS_ABM
>>>>>>>>>> +    bool "sysfs control"
>>>>>>>>>> +    help
>>>>>>>>>> +        Export a sysfs file 'panel_power_savings' that can be
>>>>>>>>>> +        manipulated by userspace for supported hardware.
>>>>>>>>>> +
>>>>>>>>>> +config AMDGPU_HARDCODE_ABM0
>>>>>>>>>> +    bool "No Panel power savings"
>>>>>>>>>> +    help
>>>>>>>>>> +        Disable panel power savings.
>>>>>>>>>> +        It can only overridden by the kernel command line.
>>>>>>>>>> +
>>>>>>>>>> +config AMDGPU_HARDCODE_ABM1
>>>>>>>>>> +    bool "25% Panel power savings"
>>>>>>>>>> +    help
>>>>>>>>>> +        Set the ABM panel power savings algorithm to 25%.
>>>>>>>>>> +        It can only overridden by the kernel command line.
>>>>>>>>>> +
>>>>>>>>>> +config AMDGPU_HARDCODE_ABM2
>>>>>>>>>> +    bool "50% Panel power savings"
>>>>>>>>>> +    help
>>>>>>>>>> +        Set the ABM panel power savings algorithm to 50%.
>>>>>>>>>> +        It can only overridden by the kernel command line.
>>>>>>>>>> +
>>>>>>>>>> +config AMDGPU_HARDCODE_ABM3
>>>>>>>>>> +    bool "75% Panel power savings"
>>>>>>>>>> +    help
>>>>>>>>>> +        Set the ABM panel power savings algorithm to 75%.
>>>>>>>>>> +        It can only overridden by the kernel command line.
>>>>>>>>>> +
>>>>>>>>>> +config AMDGPU_HARDCODE_ABM4
>>>>>>>>>> +    bool "100% Panel power savings"
>>>>>>>>>> +    help
>>>>>>>>>> +        Set the ABM panel power savings algorithm to 100%.
>>>>>>>>>> +        It can only overridden by the kernel command line.
>>>>>>>>>> +endchoice
>>>>>>>>>> +
>>>>>>>>>> +config AMDGPU_ABM_POLICY
>>>>>>>>>> +    int
>>>>>>>>>> +    default -2 if AMDGPU_DRM_ABM
>>>>>>>>>> +    default -1 if AMDGPU_SYSFS_ABM
>>>>>>>>>> +    default 0 if AMDGPU_HARDCODE_ABM0
>>>>>>>>>> +    default 1 if AMDGPU_HARDCODE_ABM1
>>>>>>>>>> +    default 2 if AMDGPU_HARDCODE_ABM2
>>>>>>>>>> +    default 3 if AMDGPU_HARDCODE_ABM3
>>>>>>>>>> +    default 4 if AMDGPU_HARDCODE_ABM4
>>>>>>>>>> +    default -1
>>>>>>>>>> +
>>>>>>>>>> +
>>>>>>>>>>      source "drivers/gpu/drm/amd/acp/Kconfig"
>>>>>>>>>>      source "drivers/gpu/drm/amd/display/Kconfig"
>>>>>>>>>>      source "drivers/gpu/drm/amd/amdkfd/Kconfig"
>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>>>>>>> index af7fae7907d7..00d6c8b58716 100644
>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>>>>>>> @@ -844,17 +844,24 @@ module_param_named(visualconfirm,
>>>>>>>>>> amdgpu_dc_visual_confirm, uint, 0444);
>>>>>>>>>>       * DOC: abmlevel (uint)
>>>>>>>>>>       * Override the default ABM (Adaptive Backlight Management)
>>>>>>>>>> level used for DC
>>>>>>>>>>       * enabled hardware. Requires DMCU to be supported and loaded.
>>>>>>>>>> - * Valid levels are 0-4. A value of 0 indicates that ABM should
>>>>>>>>>> be disabled by
>>>>>>>>>> - * default. Values 1-4 control the maximum allowable brightness
>>>>>>>>>> reduction via
>>>>>>>>>> - * the ABM algorithm, with 1 being the least reduction and 4
>>>>>>>>>> being the most
>>>>>>>>>> - * reduction.
>>>>>>>>>> + * Valid levels are -2 through 4.
>>>>>>>>>>       *
>>>>>>>>>> - * Defaults to -1, or disabled. Userspace can only override this
>>>>>>>>>> level after
>>>>>>>>>> - * boot if it's set to auto.
>>>>>>>>>> + *  -2: indicates that ABM should be controlled by DRM property
>>>>>>>>>> 'abm_level.
>>>>>>>>>> + *  -1: indicates that ABM should be controlled by the sysfs file
>>>>>>>>>> + *      'panel_power_savings'.
>>>>>>>>>> + *   0: indicates that ABM should be disabled.
>>>>>>>>>> + * 1-4: control the maximum allowable brightness reduction via
>>>>>>>>>> + *      the ABM algorithm, with 1 being the least reduction and
>>>>>>>>>> 4 being the most
>>>>>>>>>> + *      reduction.
>>>>>>>>>> + *
>>>>>>>>>> + * Both the DRM property 'abm_level' and the sysfs file
>>>>>>>>>> 'panel_power_savings'
>>>>>>>>>> + * will only be available on supported hardware configurations.
>>>>>>>>>> + *
>>>>>>>>>> + * The default value is configured by kernel configuration
>>>>>>>>>> option AMDGPU_ABM_POLICY
>>>>>>>>>>       */
>>>>>>>>>> -int amdgpu_dm_abm_level = -1;
>>>>>>>>>> +int amdgpu_dm_abm_level = CONFIG_AMDGPU_ABM_POLICY;
>>>>>>>>>>      MODULE_PARM_DESC(abmlevel,
>>>>>>>>>> -         "ABM level (0 = off, 1-4 = backlight reduction level,
>>>>>>>>>> -1 auto (default))");
>>>>>>>>>> +         "ABM level (0 = off, 1-4 = backlight reduction level,
>>>>>>>>>> -1 = sysfs control, -2 = drm control");
>>>>>>>>>>      module_param_named(abmlevel, amdgpu_dm_abm_level, int, 0444);
>>>>>>>>>>      int amdgpu_backlight = -1;
>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>>>>>>>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>>>>>>>> index b9ac3d2f8029..147fe744f82e 100644
>>>>>>>>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>>>>>>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>>>>>>>> @@ -6515,7 +6515,7 @@ static void
>>>>>>>>>> amdgpu_dm_connector_unregister(struct drm_connector *connector)
>>>>>>>>>>          struct amdgpu_dm_connector *amdgpu_dm_connector =
>>>>>>>>>> to_amdgpu_dm_connector(connector);
>>>>>>>>>>          if (connector->connector_type == DRM_MODE_CONNECTOR_eDP &&
>>>>>>>>>> -        amdgpu_dm_abm_level < 0)
>>>>>>>>>> +        amdgpu_dm_abm_level == -1)
>>>>>>>>>> sysfs_remove_group(&connector->kdev->kobj, &amdgpu_group);
>>>>>>>>>> drm_dp_aux_unregister(&amdgpu_dm_connector->dm_dp_aux.aux);
>>>>>>>>>> @@ -6623,7 +6623,7 @@ amdgpu_dm_connector_late_register(struct
>>>>>>>>>> drm_connector *connector)
>>>>>>>>>>          int r;
>>>>>>>>>>          if (connector->connector_type == DRM_MODE_CONNECTOR_eDP &&
>>>>>>>>>> -        amdgpu_dm_abm_level < 0) {
>>>>>>>>>> +        amdgpu_dm_abm_level == -1) {
>>>>>>>>>>              r = sysfs_create_group(&connector->kdev->kobj,
>>>>>>>>>>                             &amdgpu_group);
>>>>>>>>>>              if (r)
>>>>>>>>>> @@ -7654,7 +7654,7 @@ void amdgpu_dm_connector_init_helper(struct
>>>>>>>>>> amdgpu_display_manager *dm,
>>>>>>>>>>          if (connector_type == DRM_MODE_CONNECTOR_eDP &&
>>>>>>>>>>              (dc_is_dmcu_initialized(adev->dm.dc) ||
>>>>>>>>>> -         adev->dm.dc->ctx->dmub_srv) && amdgpu_dm_abm_level < 0) {
>>>>>>>>>> +         adev->dm.dc->ctx->dmub_srv) && amdgpu_dm_abm_level ==
>>>>>>>>>> -2) {
>>>>>>>>>> drm_object_attach_property(&aconnector->base.base,
>>>>>>>>>> adev->mode_info.abm_level_property, 0);
>>>>>>>>>>          }

