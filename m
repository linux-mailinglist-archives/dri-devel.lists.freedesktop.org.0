Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 700DD86B6D0
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 19:09:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 887D710E1C8;
	Wed, 28 Feb 2024 18:09:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vV0Yy6Bl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2060.outbound.protection.outlook.com [40.107.95.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA45D10E1C8
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 18:09:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BXsvsIi4B4ZndaAFVsPL1OA90e0bv+9PWCJQzOgnCrMxx0Z1BQzGToZCHYt+d7haaPGEkq9Hv059tmI40YXqc43q7HB8UiAHBXs/0lXH1tjTNZuPTjul8gfyYjlDtw8YY3v7lmE/o6mKXmZ/w4067QjD5F0j5s+1Dih194y24rI6/SlX1Nc/YUy3KCQWwFw8uVQ7xmRjHwppM1qozNm7Ex6ZwH0LuWjeoJPjrseO7KA6/wlVGgEFm14yMEeOqRuQREp9VQdSbE6SPb2uKPxR6npbon0QzFfAr4fs3jdQaJKr0H2lf4H5DVpAFDyYgWM/G1zFxQm0hjfVBVh0YVV2Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=InpN7CT0rkyoxHClo74d/mhtVhwOyNYa10Sc5jO20Zw=;
 b=UMARjGFl/3lxeDxNRswRtnVav6KiuQVY2ZVAilJd6DWoqywfled01mvArE7U6nTUqHnCzUGOMYKlsfB/wVOue4DlUPATqUpOn9r8GoWUZWr5YiyBBCj2XXDjt/Zo9fFCOKZNGSBqbLrk84/6UJq65KjR1tfgk4yFVvPwrCW7fUv38POPAIRuV/5d5YpJvT6FxjOXZ8HEBNQQogNxWXijtlNJsgeIlWgVd7gWIHMNHqgQP1CnYe574GQaOXwyNqKH1BTmzCYyfy/Xfvj+0Uvs1GKVROfo8Oj385XI6AtB9eP+n7dMl0e/x1USykyLvq4QN7gKtsykH0RId56Cf9urJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=InpN7CT0rkyoxHClo74d/mhtVhwOyNYa10Sc5jO20Zw=;
 b=vV0Yy6Bld5Gk1Gp/qlTU8Lbx8RWWm6D/7AKckZzGrNx7dIbJ8zyTsJIjNmw/NH5RZ9TZ9mt4aN7Sbjf3teUnYZM3zvfMW/TgD9ECiJG2Gwfln2OXitKePBu0YHhTFIJYV4Wy45b9Bbhs5udeiuxuhRRJqM7zIOcqoUYFdC7110w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CY8PR12MB7218.namprd12.prod.outlook.com (2603:10b6:930:5a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Wed, 28 Feb
 2024 18:09:43 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::a1d0:2930:8c24:1ee1]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::a1d0:2930:8c24:1ee1%4]) with mapi id 15.20.7316.035; Wed, 28 Feb 2024
 18:09:43 +0000
Message-ID: <3075809a-479b-4d12-8389-9500a8b0f548@amd.com>
Date: Wed, 28 Feb 2024 12:09:40 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] fbcon: Defer console takeover for splash screens to
 first switch
To: Hans de Goede <hdegoede@redhat.com>,
 Daniel van Vugt <daniel.van.vugt@canonical.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Jani Nikula <jani.nikula@intel.com>, Danilo Krummrich <dakr@redhat.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sebastien Bacher <seb128@ubuntu.com>
References: <20240202085408.23251-1-daniel.van.vugt@canonical.com>
 <20240202085408.23251-2-daniel.van.vugt@canonical.com>
 <7817a2a2-b07d-4e9d-85e6-c11c5720d66e@redhat.com>
 <39ffe230-36ac-484a-8fc1-0a12d6c38d82@canonical.com>
 <f3cdd944-5e68-49e5-bae8-4bc1f9f59131@redhat.com>
 <b98562cc-c4ca-4a74-a0c1-e1192e67d19c@canonical.com>
 <f4ef7381-06e5-4067-af0f-f48dd8d636bb@redhat.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <f4ef7381-06e5-4067-af0f-f48dd8d636bb@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9P223CA0012.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::17) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CY8PR12MB7218:EE_
X-MS-Office365-Filtering-Correlation-Id: 5980aeb5-4ffd-487c-70b0-08dc38887048
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1s8TBtfKBvQf3/NmnC08kS0A+kbQjG7rqkHMB9etBLMZE8i+OY74L1oU1ZfikCiNsf/Eda9AMexMY3rusvsmxChV9708/8k6mBphbEzNWoCrdvWd8n0SYBEDXJf718U7dH8htKFXJykio9qhLlnWP/4GEOxCmeUu5JGVWaBHIYhVEUbRMi9JBNnr5KIxbrpJlKa0Nj2NJBgKNQCptorRBPMhfwOGxFVW0utZ9jZd+9R7uWhAA72V2aPPD1xCho06rWdpYiwY9rmYwMHTqX/aGoE2HRuX+okFFQzfFJqjvcqLPYxS38FpO8Sjnzn3Jd9rcs5ljIF4lQYkbR/Sb4U0fSCs6RDE+jXwWKg89pW98FDuvRDp2ZMr8roUkBVhfNN+z+8PRWw1gosDsxOr19o/w2cutthhG7vq1iQ6Zis0HzWCuOMLGY7dz1Hfp8edZX2lQy6IBQP6Aw7X2juxG3XZrp4mj34xvvFWSB3MlxxVuHcxkIA5Xu/4y9s74X3hQ0hKeRBNvson9IrpL8mgdolg03Muls8gS+1OHTJNM2jBtK8v4YLP9eQNMimJ+2dHu1qf68nFSAoqOmjlICJkbqQUkyMrCZqhM7yo77BhUMPhl8sO3W4oZtFNjn27lQxpZn+0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0owOEdSSHFTT1lvb05DalNKNUJLMlJoZEY5dVF5QXUrT0wrRWIxR0FqQUFC?=
 =?utf-8?B?dG9wY0xqTFl2TjRyRDlQMHFSYkZBNndFMlJYNHNVVGlYVnhiSS96WWg2Rzhz?=
 =?utf-8?B?cnNxdjFRWEZEa1lkNzY5N0ZHQzBXWEoyL3I5TzNCaXVWR0lhQ2ticGtnVUFJ?=
 =?utf-8?B?L3BzbkFqQ1hIRE5kVStYakQwZExUWm5aTm5GM1NBbFJ5VS9MVjA0clVwOXll?=
 =?utf-8?B?eVRZVExySlg5L3BTbTNVQldVbjJ3dDhDTVJJUUM3azlvcTNuTExVaXh0L1Zk?=
 =?utf-8?B?cHdXYWlwK1NyTDdtakdmdnZhVW5OSWE0dGE2bVd1WktlTkFwK0Jzc0tKK1Ni?=
 =?utf-8?B?cG1sREdJSkhaUTRIeVpHanpIS05KNFZ3L2R6dGZyS2oyUDdELzJNMmhDd0ZD?=
 =?utf-8?B?L1A4R1MvQjB6MEVhTndhNnFyY0N5MFVCajc2UnZ4blRLZ3RWc2gwSGtib0c1?=
 =?utf-8?B?WHNzN0JVVGJlWGF0TUV2akRqUktHYmU1UWhzNEV1Y1pUcVBTdUNLMU5jRWpZ?=
 =?utf-8?B?c2ZXMHozejAvUnV5K2xXNkpyNnJFOHhYaWtIaUV4bkdqK2VSU3FDUEsvb3Fh?=
 =?utf-8?B?ckY2Rkt1K0xQS2EvQm10UkZsRGFibnFDZ2ZGMUlUcVg4WVpONXh1Y0lkUFgw?=
 =?utf-8?B?UlZ5OGF3Zi94ajZmTkp4dEtFYmlqOXVyNlVPQi9QOFA5QzErcDVOeDg0SkVV?=
 =?utf-8?B?YWFiazAzSFU2VHNhSmVMamJaNWM2cU1LcjVvcVRxWmVnVkZsZmE1MzFyZXlD?=
 =?utf-8?B?RXpFOXpDbnp1UTFyME1oK1ptYy9KRWxhZ3A0cG1iQmpSZzcvMkZnWEpvTkd0?=
 =?utf-8?B?Y1hKVWdBMWR3R3E1b01DUENmR2RNbnBDUi9DOXhubmMwNWhqTXYraHF2cE9a?=
 =?utf-8?B?M21mc3ZNVks5UDROWlFEYU05UklqbG1mVW9hRXNYaktPUjU0aG9HeGUwRTds?=
 =?utf-8?B?OUNhTVhOQlhrQ1lCYmZzd1M0VHpxeWdRRVZvTmtPUlBIRVVYZHhNdThFZ09G?=
 =?utf-8?B?bTgwYWtLYmtBVGJXdFlMWHJacm5qcmpUN1BYcGFlNVVmNDNuQ3RQczNrRWFz?=
 =?utf-8?B?ZktuQ1BLdTVPYjlnL3pwcnp4VkZUeVJFUmVYMUwzclI4MXRNTDVKd08ydWxV?=
 =?utf-8?B?clRsaUdhQzFqVWdPUWZUSTh3ZlB1blAyaHFRYTl4d081bGxNUGFJUGQrYWJv?=
 =?utf-8?B?Wlk1UFVLd0szcGFZOCs2eUd6SlRqQ3Yyd2JxMVREbmFVKzZVQWtGWVFaMERR?=
 =?utf-8?B?Vm9Uejg0VHFvakExRzFyUXpUWWhLelhPbDVDa1Nva0RwaEpia1U4REJUUTc3?=
 =?utf-8?B?b0Z0REg0WDlremU4NDZuNlJpRkthb2RsUUhFM3dQWklNR1dTdkhSTFFpSVd6?=
 =?utf-8?B?dGN5b0xKL085ck9wZGp3MlFCN0l2UjNHZk9xb2FNZnQ2MjZyRno2QU1vRk1I?=
 =?utf-8?B?VzRwekFndTJaTldGdVhBNnZ6SzBUajB4QXk4b3ZFTUIvYUcwNE1ja0pORlZE?=
 =?utf-8?B?WDdEM01qYXdiR0JhdzBRcXppZjNPQkhkZEpFQlR2VllDMk0rbEMrNlMwUmJp?=
 =?utf-8?B?bWtJdGJPRzdFSVZIS1pXdmZEQjByblhqOE45Q1ZwdXNueFdkZUxlUUJUbHRX?=
 =?utf-8?B?c3E2c0dXelMvZGtIWXJJeVpiQTloUmNpVHMwOFJoMmwzdmdEaW1zSjhyb0Fj?=
 =?utf-8?B?eXJyZWVLcjl4MEx4cmVWQm1MWXdkYXNXcnRPbm5IUVUxdUdiZXh0TVVMTTFn?=
 =?utf-8?B?Y2VoeXdwMmROWUhWanlOK0RvNHNIdUQ5TWo1U3VOS3k3NWpwdmREaHBOVzd1?=
 =?utf-8?B?MEZuMklqMUR3L29UL05nUy9rQWhySHJQUkhzQ0ovc3ZnazZiYTA2NEZjdm4y?=
 =?utf-8?B?b1VsNUZFOCtwemk3NVpGUjRNcW0vTG1kSFZPME1QcHJQSWIrb25OcGc2TDVE?=
 =?utf-8?B?ZlZqUHVLSFU0dXE1Q2N5YjgwSFdSQWZxN1Y1dFpCdncxV3NDRk0ySkNjSURJ?=
 =?utf-8?B?bDBBdkJNM2hMQXQwR2RTajkrRU50ZElKUjBjRmdROEZwVGN3RGtXWUhwQTZa?=
 =?utf-8?B?dGNZMlkzaVlNYWdOMVBUWE9TWUlkUkkzOVptbEpQQ1o4RlRpMEM1ZDNiUUxD?=
 =?utf-8?Q?G08yfsFIRWVpsRvLZU4M113gq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5980aeb5-4ffd-487c-70b0-08dc38887048
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 18:09:43.1791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pmQ4ckBJzEG9+SPJtHfuMZ0u/oWMOO6ZYlPAgnz8PJud5pWP14aZGmh4DBAM0i8c43orC7U5vYx526BO1Clwog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7218
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

On 2/28/2024 05:54, Hans de Goede wrote:
> Hi Daniel,
> 
> On 2/28/24 03:00, Daniel van Vugt wrote:
>> On 27/2/24 21:47, Hans de Goede wrote:
> 
> <snip>
> 
>> I think some boot failures also take you to the grub menu automatically next time?
> 
> In Fedora all boot failures will unhide the grub menu on
> the next boot. This unfortunately relies on downstream changes
> so I don't know what Ubuntu does here.
> 
> <snip>
> 
>>>>> The kernel itself will be quiet as long as you set
>>>>> CONFIG_CONSOLE_LOGLEVEL_QUIET=3 Ubuntu atm has set this
>>>>> to 4 which means any kernel pr_err() or dev_err()
>>>>> messages will get through and since there are quite
>>>>> a few false positives of those Ubuntu really needs
>>>>> to set CONFIG_CONSOLE_LOGLEVEL_QUIET=3 to fix part of:
>>>>> https://bugs.launchpad.net/bugs/1970069
>>>>
>>>> Incorrect. In my testing some laptops needed log level as low as 2 to go quiet.
>>>> And the Ubuntu kernel team is never going to fix all those for non-sponsored
>>>> devices.
>>>
>>> Notice that atm Ubuntu's kernel is using the too high
>>> CONFIG_CONSOLE_LOGLEVEL_QUIET=4 with
>>> CONFIG_CONSOLE_LOGLEVEL_QUIET=3 getting any errors logged
>>> to the console should be very very rare.
>>>
>>> The only thing I can think of is if the kernel oopses
>>> / WARN()s early on but the cause is innocent enough
>>> that the boot happily continues.
>>>
>>> In that case actually showing the oops/WARN() is a good
>>> thing.
>>>
>>> For all the years Fedora has had flickerfree boot I have
>>> seen zero bug reports about this. If you have examples
>>> of this actually being a problem please file bugs for
>>> them (launchpad or bugzilla.kernel.org is fine) and
>>> then lets take a look at those bugs and fix them.
>>>
>>> These should be so rare that I'm not worried about this
>>> becoming a never ending list of bugs (unlike pr_err() /
>>> dev_err() messages of which there are simply too many).
>>
>> I personally own many laptops with so many different boot messages that it's
>> overwhelming for me already to report bugs for each of them. Hence this patch.
>>
>> Also I don't own all the laptops in the world, so fixing all the errors just
>> for my collection wouldn't solve all cases. Whereas this patch does.
> 
> Almost all of those boot messages are because Ubuntu has
> set CONFIG_CONSOLE_LOGLEVEL_QUIET too high. Once that is fixed
> there should be very little of not no messages left.
> 
> I too own many laptops and I'm not seeing this issue on
> any of them.
> 
> You claim you are still seeing errors with
> CONFIG_CONSOLE_LOGLEVEL_QUIET=3 yet you have not provided
> a single example!
> 
>>> Sorry, but your real problem here seems to be your
>>> noisy downstream systemd patch. I'm not going to ack
>>> a kernel patch which I consider a bad idea because
>>> Ubuntu has a non standard systemd patch which is
>>> to trigger happy with spamming the console.
>>
>> Indeed the systemd patch is a big problem. We seem to have had it for 9 years
>> or so. I only just discovered it recently and would love to drop it, but was
>> told we can't. Its main problem is that it uses the console as a communication
>> pipe to plymouth. So simply making it less noisy isn't possible without
>> disabling its functionality. It was seemingly intended to run behind the
>> splash, but since it does fsck it tends to run before the splash (because DRM
>> startup takes a few more seconds).

This comes back to what I was saying before - Ubuntu (and anyone else 
that wants a flicker free boot for that matter) should adopt simpledrm.

When simpledrm is compiled into the kernel DRM will be up long before 
the splash screen comes up.  When drivers do fastboot (Intel) or 
seamless (AMD) handoff you /should/ be able to get the splash screen 
without a modeset.

I think between doing that and changing the default log level not to 
show console err messages will go a long way.

If there is a concern that people need to see those; how about changing 
the kernel command line for the recovery kernel so that they only come 
up in the recovery kernel?

> 
> This does indeed sound like it is a non trivial problem to fix,
> but that is still not a good reason to add this (IMHO) hack
> to the kernel.
> 
> The issue deferred fbcon takeover was designed to fix is that
> the fbcon would mess up the framebuffer contents even if
> nothing was ever logged to the console.
> 
> The whole idea being that to still have the fbcon come up
> as soon as there are any messages.
> 
> Actively hiding messages was never part of the design, so
> this is still a NACK from me.
> 
> Also note that this matches how things work in grub
> and shim when I first implemented flickerfree boot
> I also had to patch shim and grub to not make EFI
> text output protocol calls (including init()) until
> they actually had some text to show.
> 
> So the whole design here for shim, grub and the kernel
> has always been to not mess with the framebuffer until
> there is some text (any text) to output and then show
> that text immediately.
> 
> I do not think that deviating from this design is a good
> idea.
> 
> Regards,
> 
> Hans
> 
> 
> 
>>>>>> Closes: https://bugs.launchpad.net/bugs/1970069
>>>>>> Cc: Mario Limonciello <mario.limonciello@amd.com>
>>>>>> Signed-off-by: Daniel van Vugt <daniel.van.vugt@canonical.com>
>>>>>> ---
>>>>>>   drivers/video/fbdev/core/fbcon.c | 32 +++++++++++++++++++++++++++++---
>>>>>>   1 file changed, 29 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
>>>>>> index 63af6ab034..5b9f7635f7 100644
>>>>>> --- a/drivers/video/fbdev/core/fbcon.c
>>>>>> +++ b/drivers/video/fbdev/core/fbcon.c
>>>>>> @@ -76,6 +76,7 @@
>>>>>>   #include <linux/crc32.h> /* For counting font checksums */
>>>>>>   #include <linux/uaccess.h>
>>>>>>   #include <asm/irq.h>
>>>>>> +#include <asm/cmdline.h>
>>>>>>   
>>>>>>   #include "fbcon.h"
>>>>>>   #include "fb_internal.h"
>>>>>> @@ -146,6 +147,7 @@ static inline void fbcon_map_override(void)
>>>>>>   
>>>>>>   #ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
>>>>>>   static bool deferred_takeover = true;
>>>>>> +static int initial_console = -1;
>>>>>>   #else
>>>>>>   #define deferred_takeover false
>>>>>>   #endif
>>>>>> @@ -3341,7 +3343,7 @@ static void fbcon_register_existing_fbs(struct work_struct *work)
>>>>>>   	console_unlock();
>>>>>>   }
>>>>>>   
>>>>>> -static struct notifier_block fbcon_output_nb;
>>>>>> +static struct notifier_block fbcon_output_nb, fbcon_switch_nb;
>>>>>>   static DECLARE_WORK(fbcon_deferred_takeover_work, fbcon_register_existing_fbs);
>>>>>>   
>>>>>>   static int fbcon_output_notifier(struct notifier_block *nb,
>>>>>> @@ -3358,6 +3360,21 @@ static int fbcon_output_notifier(struct notifier_block *nb,
>>>>>>   
>>>>>>   	return NOTIFY_OK;
>>>>>>   }
>>>>>> +
>>>>>> +static int fbcon_switch_notifier(struct notifier_block *nb,
>>>>>> +				 unsigned long action, void *data)
>>>>>> +{
>>>>>> +	struct vc_data *vc = data;
>>>>>> +
>>>>>> +	WARN_CONSOLE_UNLOCKED();
>>>>>> +
>>>>>> +	if (vc->vc_num != initial_console) {
>>>>>> +		dummycon_unregister_switch_notifier(&fbcon_switch_nb);
>>>>>> +		dummycon_register_output_notifier(&fbcon_output_nb);
>>>>>> +	}
>>>>>> +
>>>>>> +	return NOTIFY_OK;
>>>>>> +}
>>>>>>   #endif
>>>>>>   
>>>>>>   static void fbcon_start(void)
>>>>>> @@ -3370,7 +3387,14 @@ static void fbcon_start(void)
>>>>>>   
>>>>>>   	if (deferred_takeover) {
>>>>>>   		fbcon_output_nb.notifier_call = fbcon_output_notifier;
>>>>>> -		dummycon_register_output_notifier(&fbcon_output_nb);
>>>>>> +		fbcon_switch_nb.notifier_call = fbcon_switch_notifier;
>>>>>> +		initial_console = fg_console;
>>>>>> +
>>>>>> +		if (cmdline_find_option_bool(boot_command_line, "splash"))
>>>>>> +			dummycon_register_switch_notifier(&fbcon_switch_nb);
>>>>>> +		else
>>>>>> +			dummycon_register_output_notifier(&fbcon_output_nb);
>>>>>> +
>>>>>>   		return;
>>>>>>   	}
>>>>>>   #endif
>>>>>> @@ -3417,8 +3441,10 @@ void __exit fb_console_exit(void)
>>>>>>   {
>>>>>>   #ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
>>>>>>   	console_lock();
>>>>>> -	if (deferred_takeover)
>>>>>> +	if (deferred_takeover) {
>>>>>>   		dummycon_unregister_output_notifier(&fbcon_output_nb);
>>>>>> +		dummycon_unregister_switch_notifier(&fbcon_switch_nb);
>>>>>> +	}
>>>>>>   	console_unlock();
>>>>>>   
>>>>>>   	cancel_work_sync(&fbcon_deferred_takeover_work);
>>>>>
>>>>
>>>
>>
> 

