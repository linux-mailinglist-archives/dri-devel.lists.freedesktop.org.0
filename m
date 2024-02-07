Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E54584D2CF
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 21:21:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E807110E00D;
	Wed,  7 Feb 2024 20:21:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Z8YX39HO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2066.outbound.protection.outlook.com [40.107.212.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E50E10E00D
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 20:21:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JWl0VvB7wNlbUzLk80LfBfIvK9A3oIHZmsyiMBqfZgysKB/jZKclUsaEZKBDYHuOt7cqtz/jVxlkpFebUHYQbpu55/EA4ma3g+N+tn2e35+jV0XRV5tczoDpM9iena81DI9Z/Kyz0xosZb8U6eDniq1pzpfMhf6zdcuK+1rTL3ENDo3qUZLwHnTho1FHnMRxoVLjvo3QtS3h9LRlA2baIRud7utK650uwoTqB0W3kgUI1K0AjrwKub1mgtnp5Pd5csz0su4EiOhvSDigknQP97JqHimdyxiHL78DcYVCfusUtCyGqqnSrHYRxKmgKtKmm+zEQOZWesNfwzQaNveXoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ni0FFk9iLR+oV9a13O0V/bU29eHRD9/DFAsQFZmxsbc=;
 b=KiVQp6kky8rlMYKRLrJsPBWpGGlKAa6gSa1laezaONhougnPCW11net1EFMbicS7NhGFr2L5FExDU10qhCVLXvAzSDZ2Qhx8kC/0WvOomsiXnoqCeqR/LY/voWAXjBhFGYdXlYXH08B/24OP1pc0XazTCUlywSj9Bgjj2ULDsOiohZP9T3Ydt/dA+K2Yteu1afUd8uEYguVuBFmZlJ1MIj9cu/MSnohTOUVU/UAlkmO1UzE9oHWljG7sIw0FNBnUdG0DynPMX/n2FmRaKTjsNXaKgbk1ohw/Sx+SR4C65H7n1K+3fvQ+VFZcCKdO3WPLJMHJFyucsPGvLOWx1/Ywew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ni0FFk9iLR+oV9a13O0V/bU29eHRD9/DFAsQFZmxsbc=;
 b=Z8YX39HOJCDOHZ6uZfBYXI22CyUSYs4Ofid8veIRSUpAWZxJ4CmMu70ejtYenEy3mSOYVmvOCy9bL96I67xBoDrZqToagmimbccJc1TVRwehkbUETjqF8py63UInC87lp5OuUFAlaEIYNQAp8FI2YHAAaykcKS3ZwgpqtfP93bw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA1PR12MB8264.namprd12.prod.outlook.com (2603:10b6:208:3f5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.16; Wed, 7 Feb
 2024 20:21:07 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f6d2:541d:5eda:d826]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f6d2:541d:5eda:d826%5]) with mapi id 15.20.7270.016; Wed, 7 Feb 2024
 20:21:07 +0000
Message-ID: <88f3ff47-8c4b-424c-bf83-1570882cbb54@amd.com>
Date: Wed, 7 Feb 2024 14:21:05 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] fbcon: Defer console takeover for splash screens
 to first switch
To: Daniel van Vugt <daniel.van.vugt@canonical.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller
 <deller@gmx.de>, Jani Nikula <jani.nikula@intel.com>,
 Danilo Krummrich <dakr@redhat.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 andy.whitcroft@canonical.com
References: <f037df4a-8a97-4fcd-b196-43f484b63d8d@amd.com>
 <20240206101100.25536-1-daniel.van.vugt@canonical.com>
 <20240206101100.25536-2-daniel.van.vugt@canonical.com>
 <ZcJAVSyH3gRYx3EG@phenom.ffwll.local>
 <e4fc61ae-97f5-4fa1-bfed-1312466a2a22@amd.com>
 <26893900-2d0d-4624-94f1-c4aa88386e9c@canonical.com>
 <ZcNSleQOrBtSn3uM@phenom.ffwll.local>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <ZcNSleQOrBtSn3uM@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR13CA0062.namprd13.prod.outlook.com
 (2603:10b6:806:23::7) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA1PR12MB8264:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cb9dba2-9159-45e6-68dc-08dc281a50fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RvDhG8SBf4Zt9Fpu7rkP573S5X81QSkHm6QklKUVxAaKLpAk5Xx8tER3sYqXTwxWap4fXjXsKdnkAHbMTWEyzJ51v04Q9Sxc4BnMVKCHSS8EKE5t65Wue8Q66hdRI68guSVfCejV2k/aubsESn1Gla0v8nDkFZRPdIvvB1fqju+W6OeI1SQLJMr/hus/54OeUJEryfoDXCeWdz1fgn+eluS6HoFarnH7kperG/nURslqRk9CifsabFoOfZCgw8PtEhGC3vskPgikP69XkXOPLO+VRzfAVjdYpG1ZdhrDpmL2en2172rrfFhMGKbax3pFqtmoWI0WBh+7OA0g7DCzReZc8a6HSJRUKF23t8Vj6F26MWo0QKTgbb+xBAnFQfVGNs5cR7+1bTzsBE7AuSNH2Md/NEu2MzpLGysR6YXFqpC50idP7MHMR5V2jblOEwMhHL15Py3W/moUj5N1+JyXzYUZr0ctn2RZ9Tpw7aZZ7FB+EsLRFUgZSB3cNQCR+cXWW/YPwikWSbU5kFEyPVfP1wAJQDVLnwhmrIdnPSJYr9A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(366004)(376002)(396003)(346002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(26005)(2616005)(83380400001)(6512007)(478600001)(966005)(6506007)(53546011)(31696002)(6486002)(86362001)(66556008)(66946007)(66476007)(316002)(8676002)(8936002)(110136005)(31686004)(38100700002)(44832011)(36756003)(41300700001)(2906002)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1huVDcvR0t2V1V2Ty92V0tRaVhmNGVjb2g5bWwzb0VsK0lwOHh4MEJnNzRE?=
 =?utf-8?B?dWpQRVR4Skc3cDdpQzFMMiszcEQ0QzdDVURBWHJjblk1K3gwWlc0RVc3ZWxU?=
 =?utf-8?B?dFVwSkdvMFdEQmlrMzd4eHZjZHhsaERHd0JTbU5WSGV1NzNpNW92b0UrMURl?=
 =?utf-8?B?cTUycXVzUXlJc043L0xpZ3BXMGgvc2JlaWI5OWdZVWxxNjJPdmE0MDc1dE1h?=
 =?utf-8?B?Y0NWTldVOGtSZ2VLOFZpR2s1eWRZalJ5TVVQTUVzRXdWajZuY2xISFphdmhY?=
 =?utf-8?B?alFnNXA0N3RmMzNxbVRuK2ZxWFU2bjVLbUtSbkw5bG1hVW4yRk1UZ3RtdlJT?=
 =?utf-8?B?ajNiR3JXY3IzNkhUYmZkUGJFSkFJUjUxNlU1dGltSlprbDlvSUpwQ3RXdUtZ?=
 =?utf-8?B?V3RUd1dIVkFZQkdGcnlQODI0Wk5ieDBPYXdKT1hNL2RkbzhKRm40ZDhLblJZ?=
 =?utf-8?B?OTI2SDNpVEpPcFkwbkdqMFJ3N1BPMEVYL3ZackRqZkFzSExvdTl1RWlMNVpz?=
 =?utf-8?B?M2lTSkN1TGd2TTRYU1cvNHk5d1RGREJ6ZUU3KzRtbjA2UTJ2MTQydmFYdmRz?=
 =?utf-8?B?eXBHY3RIdFVGMVg3ZDJ0TEFPOWVyakJVTmNZUWxEUEJqMm1CQWRmUVNiSEFJ?=
 =?utf-8?B?U0RQbDg0L1RmT3lxWUttaDM4WG1OZnE4UEdpU0xxQkI1d3FpR3gxM05yMXZE?=
 =?utf-8?B?MjBuaHR6SEhxOFFxT3Zlb3RVQXNibXBWVDNCYUoxbnVLeWp1d0EyeE05VHpG?=
 =?utf-8?B?c0VSMmtaT1I0YSt2c3RsV0h4NXQzNjB5dS9JV0djMmtpS0tuMGI0V2RTMmw0?=
 =?utf-8?B?WVlEWkZNZnZlb1pBVDQvb201ejF2aENuT1g0WXU5cWNyZEMxcWQ3NkZCcW9O?=
 =?utf-8?B?MVBsbFdoY09Hd1ZMa0FUb2doTkFPNWdnd3VUSU5WeDEwVk9mbHBtMUxoeVpC?=
 =?utf-8?B?bGNPVDFuNDlHQ3VhaHNmYmtvTHZYKzFDN0c2cGdhRWxSOHFuWkMyb1FXZUMr?=
 =?utf-8?B?bCtianplWXpmWTkwVHZseW9yYTF3ZW9HRE96VTdOUjNIcEthVno0V1ZYdXNG?=
 =?utf-8?B?RjREMENnalJzQjNDWDA1dTVzQU9ZekREaU5KS2RrUjB1QkhXTENNZmMyaVJW?=
 =?utf-8?B?R2NEMEUzNWhIUExjaTlTU1JEQnJKYk1LZTZ1SFFQMVFkdWMvQ3J2R2R4ZC8x?=
 =?utf-8?B?czJQUmE4N0Ewa3pteitaUTZiRmYrMWI5djgvZkhJNkx4SlFud2VSa25EQngv?=
 =?utf-8?B?aEZIUmhzOUlxbGxrRS90alVvaXljeDVTcGpEcC9HcW00eEhUdDYyZ1V4Smhu?=
 =?utf-8?B?Qk40R0I3bW5nM01NdjU2bmFMMVA2TDExYUZBVWNtaFEySWZtREhaTVUvcTdh?=
 =?utf-8?B?aTBUWHg1V3NCTWVXRGRoZFNGSjI4am8wS0ljaTNCZTZtY09nUFZoUUQvd3Ra?=
 =?utf-8?B?RXl1VlNKU2xxRDdOZ1lSSGNyRVdiU2x0R1FWZksxd3NaQ2hndU90S1NJZWFF?=
 =?utf-8?B?VWlqTDA4TlE1MEVlYWgyeDlBcHhDY2t4M2swRDc0V3lXa0FablRWeFB2Mk13?=
 =?utf-8?B?OUdEYkd3enJFQldIZkxCQmVqR1ZmNXZySDlxNXdRUndzdHJrdEk3STdnTUJH?=
 =?utf-8?B?RUF3S21mRUNtdnNTTEVMajQzZzRJQWNweGZhYVIwVFlTUGhKWFZMOWRFbFpX?=
 =?utf-8?B?T0xjRWN4V2NPN0w4OVl0SFZQNEdia09BYlh1THRBcTNtdG9OM2ZjUXlwMUsw?=
 =?utf-8?B?WU1SMEVlNTJoTW5SemRiam1ZRGlORlB0L0FIbjdNdzk0ck4xNEM0QkFlRi9u?=
 =?utf-8?B?Wmo5d2Q3UjdqNmp5V2NvbHdHck1YYWxWTUFLMm9BU2xtT0lERDQ1QnVzSjlw?=
 =?utf-8?B?QzRaOXVYN2lMNytXWVRUT1EvNUt5cDlSWlh4RnVQZkFOVEJCOHRXZFg1YllP?=
 =?utf-8?B?VXlvdm1nRWN2R2R5SFQvUmh4UzJCZ2ZXMHZWQzBIU3FONFRvRWpGc0dBMGZs?=
 =?utf-8?B?d3lSZEtNKzlOVXBVaWZXRkZQOVhoMUxta3F4M2JMd0RKVVBjdVBhYzN5TTRJ?=
 =?utf-8?B?RXk4SUt5TDlDemlBclZJbkt5TjlxTjNiS1ZjSUNQcHBzMlh1TlJNZjZySmNh?=
 =?utf-8?Q?genVrikjKYSpJM7zGqxioFhv+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cb9dba2-9159-45e6-68dc-08dc281a50fc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 20:21:07.4435 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /EiamsAXSx+Y3wPia7/qvGbwrPL3IT5ZEcKjrvaVTxUD6vCijVDm8uiFIDMDMg6iFhd956lCrYMf6DWdswHVeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8264
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

On 2/7/2024 03:51, Daniel Vetter wrote:
> On Wed, Feb 07, 2024 at 10:03:10AM +0800, Daniel van Vugt wrote:
>> On 6/2/24 23:41, Mario Limonciello wrote:
>>> On 2/6/2024 08:21, Daniel Vetter wrote:
>>>> On Tue, Feb 06, 2024 at 06:10:51PM +0800, Daniel van Vugt wrote:
>>>>> Until now, deferred console takeover only meant defer until there is
>>>>> output. But that risks stepping on the toes of userspace splash screens,
>>>>> as console messages may appear before the splash screen. So check the
>>>>> command line for the expectation of userspace splash and if present then
>>>>> extend the deferral until after the first switch.
>>>>>
>>>>> V2: Added Kconfig option instead of hard coding "splash".
>>>>>
>>>>> Closes: https://bugs.launchpad.net/bugs/1970069
>>>>> Cc: Mario Limonciello <mario.limonciello@amd.com>
>>>>> Signed-off-by: Daniel van Vugt <daniel.van.vugt@canonical.com>
>>>>> ---
>>>>>    drivers/video/console/Kconfig    | 13 +++++++++++
>>>>>    drivers/video/fbdev/core/fbcon.c | 38 ++++++++++++++++++++++++++++++--
>>>>>    2 files changed, 49 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/video/console/Kconfig b/drivers/video/console/Kconfig
>>>>> index bc31db6ef7..a6e371bfb4 100644
>>>>> --- a/drivers/video/console/Kconfig
>>>>> +++ b/drivers/video/console/Kconfig
>>>>> @@ -138,6 +138,19 @@ config FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
>>>>>          by the firmware in place, rather then replacing the contents with a
>>>>>          black screen as soon as fbcon loads.
>>>>>    +config FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER_CONDITION
>>>>> +    string "Framebuffer Console Deferred Takeover Condition"
>>>>> +    depends on FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
>>>>> +    default "splash"
>>>>> +    help
>>>>> +      If enabled this defers further the framebuffer console taking over
>>>>> +      until the first console switch has occurred. And even then only if
>>>>> +      text has been output, and only if the specified parameter is found
>>>>> +      on the command line. This ensures fbcon does not interrupt userspace
>>>>> +      splash screens such as Plymouth which may be yet to start rendering
>>>>> +      at the time of the first console output. "splash" is the simplest
>>>>> +      distro-agnostic condition for this that Plymouth checks for.
>>>>
>>>> Hm this seems a bit strange since a lot of complexity that no one needs,
>>>> also my impression is that it's rather distro specific how you want this
>>>> to work. So why not just a Kconfig option that lets you choose how much
>>>> you want to delay fbcon setup, with the following options:
>>>>
>>>> - no delay at all
>>>> - dely until first output from the console (which then works for distros
>>>>     which set a log-level to suppress unwanted stuff)
>>>> - delay until first vt-switch. In that case I don't think we also need to
>>>>     delay for first output, since vt switch usually means you'll get first
>>>>     output right away (if it's a vt terminal) or you switch to a different
>>>>     graphical console (which will keep fbcon fully suppressed on the drm
>>>>     side).
>>>>
>>
>> I had similar thoughts, and had prototyped some of this already. But in the end
>> it felt like extra complexity there was no demand for.
> 
> For me this one is a bit too complex, since if you enable the vt switch
> delay you also get the output delay on top. That seems one too much and I
> can't come up with a use-case where you actually want that. So just a
> choice of one or the other or none feels cleaner.
> 
>> If you would like to specify the preferred Kconfig design then I can implement
>> it. Though I don't think there is an enumeration type. It could also be a
>> runtime enumeration (deferred_takeover) controlled by fbcon=something.
> 
> There's a choice in Kconfig, see e.g. kernel/Kconfig.hz for an example.
> 
>>> IIUC there is an "automatic" VT switch that happens with Ubuntu GRUB + Ubuntu
>>> kernels.
>>>
>>> Why?
>>>
>>> Couldn't this also be suppressed by just not doing that?
>>
>> I have not seen any automatic VT switches in debugging but now that you mention
>> it I was probably only debugging on drm-misc-next and not an Ubuntu kernel.
> 
> Hm but I don't see how the output delay would paper over a race (if there
> is one) reliable for this case? If you do vt switch for boot splash or
> login screen and don't yet have drm opened for display or something like
> that, then fbcon can sneak in anyway ...

Ubuntu has had in (at least some) kernels:

https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linux/+git/unstable/commit/?id=320cfac8ef31

I'm unsure if it's still there today, but maybe it would be best if the 
author (Andy) could enlighten us?  Any idea why that didn't go upstream?

I had thought that tied with a automatic VT switch that was trying to 
hide fbcon as well.

> 
> Cheers, Sima
>>
>> - Daniel
>>
>>>
>>>> I think you could even reuse the existing
>>>> CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER for this, and then just
>>>> compile-time select which kind of notifier to register (well plus the
>>>> check for "splash" on the cmdline for the vt switch one I guess).
>>>>
>>>> Thoughts?
>>>>
>>>> Cheers, Sima
>>>>
>>>>
>>>>> +
>>>>>    config STI_CONSOLE
>>>>>        bool "STI text console"
>>>>>        depends on PARISC && HAS_IOMEM
>>>>> diff --git a/drivers/video/fbdev/core/fbcon.c
>>>>> b/drivers/video/fbdev/core/fbcon.c
>>>>> index 63af6ab034..98155d2256 100644
>>>>> --- a/drivers/video/fbdev/core/fbcon.c
>>>>> +++ b/drivers/video/fbdev/core/fbcon.c
>>>>> @@ -76,6 +76,7 @@
>>>>>    #include <linux/crc32.h> /* For counting font checksums */
>>>>>    #include <linux/uaccess.h>
>>>>>    #include <asm/irq.h>
>>>>> +#include <asm/cmdline.h>
>>>>>      #include "fbcon.h"
>>>>>    #include "fb_internal.h"
>>>>> @@ -3358,6 +3359,26 @@ static int fbcon_output_notifier(struct
>>>>> notifier_block *nb,
>>>>>          return NOTIFY_OK;
>>>>>    }
>>>>> +
>>>>> +#ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER_CONDITION
>>>>> +static int initial_console;
>>>>> +static struct notifier_block fbcon_switch_nb;
>>>>> +
>>>>> +static int fbcon_switch_notifier(struct notifier_block *nb,
>>>>> +                 unsigned long action, void *data)
>>>>> +{
>>>>> +    struct vc_data *vc = data;
>>>>> +
>>>>> +    WARN_CONSOLE_UNLOCKED();
>>>>> +
>>>>> +    if (vc->vc_num != initial_console) {
>>>>> +        dummycon_unregister_switch_notifier(&fbcon_switch_nb);
>>>>> +        dummycon_register_output_notifier(&fbcon_output_nb);
>>>>> +    }
>>>>> +
>>>>> +    return NOTIFY_OK;
>>>>> +}
>>>>> +#endif
>>>>>    #endif
>>>>>      static void fbcon_start(void)
>>>>> @@ -3370,7 +3391,16 @@ static void fbcon_start(void)
>>>>>          if (deferred_takeover) {
>>>>>            fbcon_output_nb.notifier_call = fbcon_output_notifier;
>>>>> -        dummycon_register_output_notifier(&fbcon_output_nb);
>>>>> +#ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER_CONDITION
>>>>> +        if (cmdline_find_option_bool(boot_command_line,
>>>>> +              CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER_CONDITION)) {
>>>>> +            initial_console = fg_console;
>>>>> +            fbcon_switch_nb.notifier_call = fbcon_switch_notifier;
>>>>> +            dummycon_register_switch_notifier(&fbcon_switch_nb);
>>>>> +        } else
>>>>> +#endif
>>>>> +            dummycon_register_output_notifier(&fbcon_output_nb);
>>>>> +
>>>>>            return;
>>>>>        }
>>>>>    #endif
>>>>> @@ -3417,8 +3447,12 @@ void __exit fb_console_exit(void)
>>>>>    {
>>>>>    #ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
>>>>>        console_lock();
>>>>> -    if (deferred_takeover)
>>>>> +    if (deferred_takeover) {
>>>>>            dummycon_unregister_output_notifier(&fbcon_output_nb);
>>>>> +#ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER_CONDITION
>>>>> +        dummycon_unregister_switch_notifier(&fbcon_switch_nb);
>>>>> +#endif
>>>>> +    }
>>>>>        console_unlock();
>>>>>          cancel_work_sync(&fbcon_deferred_takeover_work);
>>>>> -- 
>>>>> 2.43.0
>>>>>
>>>>
>>>
> 

