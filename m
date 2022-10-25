Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA1860D58C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 22:32:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7258F10E331;
	Tue, 25 Oct 2022 20:32:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB1810E2E8;
 Tue, 25 Oct 2022 20:31:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NQTAAiCT5xGkGn5oSE1WDQE/X0SHNtGC4iO0Lfi9vB3YhMZhsKMkccDpYpVnVxJP0iQbXlew6fWe0ypg8EfqMsDI1HkwJ8ZnnHLUctKiJesmKii5py3iQ30foDbjC551InsZeG3nhgp7x96/409J72CpSqcFW6vJ59RV9+i5qA9wkAKdnmzBYXrXu87KyoCK3vbEdW8QEr9RT9NrPjBlddTSbnDq1XAR0/h9SZI52SFzP1O8Uxh5yq+bS0CdXay4MQhlBj5T0wWbUNJ+MTtP42SpwqQv9vE26/0U0akGsGp0KBahdIglbPqWn7njVv/XpixP2JLRC5IfxOzMdsQMDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qvXtLccb3sa1nA4oRh4uenUxjcxsfpJdh2YjsFFCdS0=;
 b=Jcz+9WnsOJhpG8v1r/Ra2b+pHuf2Rge60qfyraBWFLvrhkpY3ROrH6bE2Vwj6xPAOwKgUgwZrINeKEL5bTDQTuhKtddUopVo9x0AEHYeYAvzaJuqJSqPP8TJJ0ZMv+J5lnOWb+XT/YtfKOG4Pj6DPH/UTg+U+2MLJZfulbjP3l8ZxiqWDV97LI4kldR8AmcJvBf20LtNwK9zbepjqLnTpKGcIJvXfYP4NjwPFXvLPVu3ekxfLkSM99bvuBN4rkkQ5DOo0ZcEggr7gurdHk9clbFXkdo8OtdbARSpCq/B4BnMOC6rEAZ7SxZn8TuTpqU8I8je7mnQEXYloXxZVI33oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qvXtLccb3sa1nA4oRh4uenUxjcxsfpJdh2YjsFFCdS0=;
 b=i5AhBSJ0jENo41o5ZA1peN7OVXcHMYj5jyHNe9vW0gRMUiuXnQAua1iXfA3kF3AAPioue1SsQsvqybdWEEoNBd/v1eh87MOOUKEJaheZsF5GQua2yD64WyA05mud7yFjAPSQwatGw4QghbQ0B9TMKDN8Se4VC3zLd2vSpiw49IU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CY8PR12MB7434.namprd12.prod.outlook.com (2603:10b6:930:52::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Tue, 25 Oct
 2022 20:31:55 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f8c0:db03:2d30:792c]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f8c0:db03:2d30:792c%3]) with mapi id 15.20.5746.026; Tue, 25 Oct 2022
 20:31:55 +0000
Message-ID: <430437ff-e6dc-8191-fafd-746469fe7f20@amd.com>
Date: Tue, 25 Oct 2022 15:31:50 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v5 02/31] drm/i915: Don't register backlight when another
 backlight should be used (v2)
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>, Matthew Garrett <mjg59@srcf.ucam.org>
References: <20220825143726.269890-1-hdegoede@redhat.com>
 <20220825143726.269890-3-hdegoede@redhat.com>
 <f914ceb3-94bd-743c-f8b6-0334086e731a@gmail.com>
 <42a5f2c9-a1dc-8fc0-7334-fe6c390ecfbb@redhat.com>
 <20221024203057.GA28675@srcf.ucam.org>
 <8f53b8b6-ead2-22f5-16f7-65b31f7cc05c@redhat.com>
 <20221025193248.GA21457@srcf.ucam.org>
 <144cd47e-42dc-2b84-1a90-ea5e080e08a3@redhat.com>
From: "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <144cd47e-42dc-2b84-1a90-ea5e080e08a3@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR14CA0028.namprd14.prod.outlook.com
 (2603:10b6:610:60::38) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CY8PR12MB7434:EE_
X-MS-Office365-Filtering-Correlation-Id: 58b03d87-5823-4048-4842-08dab6c7f4af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1l+aNbEO5uV0zFQFV3KjlXmh4ZxOX/PPdQQTwpMrkpohdUOIc1T9lK5vtMJOT7YoVWLIg4/FQZ5c5QgDeSofnxRQQ1RxbUW/BvPm9p57A+ugUylpDLHhYS+EyjAlTLuqE76bZ8JVq9K70/v92/pE3N7B69rhdapCWejIexTB4gv7VY+btuJ5/VZ1FBcZewiFSYYpZ7q2HhZDO55lF98LdTU3vSWWuSLHi/Pxd3COI2KSk0OwgxJ6aDIXeg3bPSvY0+1F7Qq1YYLaqGKbiSDCXWOq+aOmGaJpO3xjNG0lTwmbv/KmT/ZYeqalGXrdMV9WST4/QBaAeei9PjqZNJRxoKkcPpU4fTGPgHbXYN+13FirIxPrqYPvnBjUsKfXewR3WE57Qbwo0ofEIvqEP6QUunBN6J/U36wiqHp/c5uT2roPzodqxMA/ipb5uamPpAXJcy5u2XgQZjFF7aufv5PydSbf2LACslMSI4+KjZlDqciKMIjLmY9FHva0LHLLci4wdzJ6zsHw9eSjap2S0b4gQ8OSUEb0LL5MIt2/vjVXiTBodBjmkXzmUu3zRFuqhnZ7vuDY/Huc7WXZ/SZi+JPT7OfAtKLc4zPlNHWCbYh9jsJ7/vY4QS6ZTU/dzE+funBBsdEQjk9UpqgeX3H/1vwXrynPAM4BhUUQsEPiEaD/Uj6EipkhXZ+ljfLc9TxCw2GN+jhPFzZpmi6i1oieak8AXFndOuZ8vbcYYEaCKsODvcFL4zRgUCXr6Aq2X/tGmDk2xbGeJFCiXHpregxLb0GnqoNdKg7qrkiXv4kPkSDIfyM4olNPiADKomEF2Sr8YefGd1TPsp8Jt+2ZtyIxroja+Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(346002)(39860400002)(396003)(366004)(451199015)(53546011)(5660300002)(6666004)(8936002)(966005)(83380400001)(38100700002)(2616005)(31696002)(45080400002)(86362001)(2906002)(8676002)(4326008)(66556008)(26005)(7416002)(186003)(66476007)(66946007)(6506007)(478600001)(316002)(6512007)(54906003)(110136005)(41300700001)(6486002)(36756003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGFVZkJ4UGtXNnFybE5ZSUZ2Q3lOd3R3YzlnajlXeW0ydTFaRWpPM2Y2K3dB?=
 =?utf-8?B?Mm95MDVXaEhrR3Vjb1FkeElSR1hWTWNDeHVvUmg1azVWeXlJT3U4MzB1TEZE?=
 =?utf-8?B?RVJLNE1uTWhoYkpUZ3U3LzVyanVqV0I1ZkJUV0pwQzFoblRGR3RKK3Q4d3d0?=
 =?utf-8?B?Tml2SGtCZnhwTlZmbmVwOFJYUnFZemNxeWZqeEtnMnV6dFB1Z2V4dU12VGRs?=
 =?utf-8?B?QU9CODdZV0hiTnFUSTFvNktxSTV4bzVzMDRXNHpnK2h0VUhPU3FzQkdnWXJ1?=
 =?utf-8?B?YUx1Q2RXZCtFUExjdkZGUU5GN0lCdWxPN3ZpUThON1lQdHduY1VRM2NQU3lt?=
 =?utf-8?B?WlZCWXh5cVI5ZTdVVnJQRHF6blJCOEduTTdUNDhJM3NBbDZVcVE0a1pSS0pn?=
 =?utf-8?B?RGhHcnJMTHZ1WTI0OGhRUXAxQ3BjYk93dU9VbTV6NEJnNGFkR0lOeGNLaDRU?=
 =?utf-8?B?ZXFDMG1VZmQrTHhIdjVjby9reWwvZlhnTEt3eSs0VmZDZXhLWC9Pbi9Sdlgr?=
 =?utf-8?B?WnJwdGNiNit1Yy9MaEtrZVRaV3RyWWUydmJ6VTZkdTN2WnAwTmludnA4NU5j?=
 =?utf-8?B?YUxmMURrVmVxclFwZXpHSlNyZVpvT0J6Wm9jMTh4M2hXNjEwbmE0WlRFbncy?=
 =?utf-8?B?ZVQyTHVVRlplMHZodzNtTWd4NHNYVXRscW5EM1AwSnlJZ2lnWWZiY1dSbHZa?=
 =?utf-8?B?SUMyRElJbURSbGYxZC9lUlVBWXQydDdDa0FNV3B2VmQyZWdXbFUrcnhZbEF3?=
 =?utf-8?B?RFdZMFo1d0VESjlUREtjTFROTFBmUXMzR3AxTFpRWU1Wako0d0xxbFB1SitL?=
 =?utf-8?B?Z3VhbjUvZWsvd1R4MG5zRmdrbDFObDBDOTlUemxvcHh5RExWeURTN2pvR1VZ?=
 =?utf-8?B?N0pWOGpLbjRJM3Y4NHRPT1hhTFBXT050dDQ4SHZ5VGtWSDBQa1R0K0ZPNmNE?=
 =?utf-8?B?aERIR21mRk9wK1FTNVhneHI4ZnJPV0NZeWZEczVYOWh4V01RVXJJVXRSSU41?=
 =?utf-8?B?TXpCMFBFaktiUFNycHZXNmcxTlphUzRRU0FLY2RSVzZRSlFhcEtESVdNTDFI?=
 =?utf-8?B?YXBIZWYraWMvL1h2bW1Qb01Sd0ZacWtrZHpleGdWOUxpR29XbTZVS0RTWitn?=
 =?utf-8?B?OXZ5R0EyTHQ4b2c5Y3V6MDdqTVNkQlBTYXgvVjVKZHhoM1VkUGQ0R0FzNmp5?=
 =?utf-8?B?L2pmbTVNYUI4MXhtWDczajRkb3VjcnhpcUMvajJwNGRhMGZGankvNTJzaFEy?=
 =?utf-8?B?T1dSZ3hqTW82ZlhkUWp6YTVYOFA2dUpEcVdqSFUwbDArSzYyYlROMWFZVE5a?=
 =?utf-8?B?aE1BZ3F5YmVUbU8zay83V3F3UDFJWmczU3pzM3d4aXFpY3ZHTmhNRXJkYXN4?=
 =?utf-8?B?TE1BM2h6aDR4c2JPYjJXNHhiMzFBWWw4djNiRFo3T2g3ckgvMHJ1MzFUSVhm?=
 =?utf-8?B?bmVBOXB6MWpybGtJMUxOMkdkU1hkbkNUTGF4bGFaMWMxVjlZSUMrR0p4eGhH?=
 =?utf-8?B?b0I4OFdwODdrS0p6QlQrak9rYVcvK1NzODliYll5a2tSeUxQbHdBRUI0SzhK?=
 =?utf-8?B?cjFYNVVobSsyd2NwWTJFYmU5a2ZrYTJxMlo0d2s3enBLNUhaT1F2RXIzTFFu?=
 =?utf-8?B?b05RUm51NWRlRVhjMjd4QTZYS0wrVUZXTjgvMmpxSHdJYzJ6SExnWWRuUTVS?=
 =?utf-8?B?T0Y4aFk4WEpQVytBUUIyRzdzbWgyM1dteWFvL2lsUEk5dU9WNTZGQmNFK2o0?=
 =?utf-8?B?NE42VDkrOUlSUjhvWlpRM3RSTzljSmcvYXo3ZHhITnNXMFZ0MGVMaEErWFNG?=
 =?utf-8?B?UjlKNmRTYnZKTFFncmtOMXhkdTZ5V0dUWmRyUUJRaXl1Q1JKQnVhalJZUTZi?=
 =?utf-8?B?enZ1QkdVMFdOZlRudFRQNEhDRkhCVzUxOXphNkJyUGdSbDdMakErb29KQUkw?=
 =?utf-8?B?RVZ5eC8xME12Ylp3Z1pBK0RVa1FydERBR2MwMkdIVXExL04yVVdRVlBvQWtC?=
 =?utf-8?B?dUQyUGlUVjVEL25qUCtTRnlYZmRyb21oQ050S1VSdlM0K1VTUy9EQU5LazdF?=
 =?utf-8?B?Y1JnbWVYYkJEQmhpR3J0cHZvTVBTd3FXaGExRzhBNE5hZjhLaDZIaWgzOHcz?=
 =?utf-8?Q?i63DsKy2/j2yzyt4Plr0LWgrC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58b03d87-5823-4048-4842-08dab6c7f4af
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 20:31:55.0283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CV47fOX/mLzhQd+kQibPmXG1+h/Hcva3ie0072lDT6ItluGhpNoz39a6QRKomZ+eEFDrpr0iQdJ9YR+yWS4r3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7434
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
Cc: Pan@freedesktop.org, Karol Herbst <kherbst@redhat.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>, amd-gfx@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@redhat.com>, Len Brown <lenb@kernel.org>,
 Daniel Dadap <ddadap@nvidia.com>, Jani Nikula <jani.nikula@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, Mark Gross <markgross@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Xinhui <Xinhui.Pan@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/25/2022 15:25, Hans de Goede wrote:
> Hi Matthew,
> 
> On 10/25/22 21:32, Matthew Garrett wrote:
>> On Tue, Oct 25, 2022 at 08:50:54PM +0200, Hans de Goede wrote:
>>
>>> That is a valid point, but keep in mind that this is only used on ACPI
>>> platforms and then only on devices with a builtin LCD panel and then
>>> only by GPU drivers which actually call acpi_video_get_backlight_type(),
>>> so e.g. not by all the ARM specific display drivers.
>>>
>>> So I believe that Chromebooks quite likely are the only devices with
>>> this issue.
>>
>> My laptop is, uh, weird, but it falls into this category.
>>   
>>>> I think for this to work correctly you need to have
>>>> the infrastructure be aware of whether or not a vendor interface exists,
>>>> which means having to handle cleanup if a vendor-specific module gets
>>>> loaded later.
>>>
>>> Getting rid of the whole ping-ponging of which backlight drivers
>>> get loaded during boot was actually one of the goals of the rework
>>> which landed in 6.1 this actually allowed us to remove some quirks
>>> because some hw/firmware did not like us changing our mind and
>>> switching backlight interfaces after first poking another one.
>>> So we definitely don't want to go back to the ping-pong thing.
>>
>> Defaulting to native but then having a vendor driver be able to disable
>> native drivers seems easiest? It shouldn't be a regression over the
>> previous state of affairs since both drivers were being loaded already.
> 
> Part of the reason for the ACPI backlight detect refactor is
> because of a planned new backlight uAPI where the brightness
> control becomes a property on the drm connector object, for a
> RFC including the rationale behind this planned uAPI change see:
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fdri-devel%2Fb61d3eeb-6213-afac-2e70-7b9791c86d2e%40redhat.com%2F&amp;data=05%7C01%7Cmario.limonciello%40amd.com%7C6380e44c87e447eedc3f08dab6c7180a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638023263541559113%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=K4oMmVl51kT9V%2B4GAdx%2FS7tXWHPKyFe5WXZzC3CPeOU%3D&amp;reserved=0
> 
> These plans require that there is only 1 backlight device
> registered (per panel).
> 
> Having the native driver come and then go and be replaced
> with the vendor driver would also be quite inconvenient
> for these planned changes.
> 
> As such I would rather find a solution for your "weird"
> laptop so that acpi_video_get_backlight_type() just always
> returns vendor there.

What exactly is this "weird" laptop?  Is it something running coreboot 
that doesn't "normally" ship with coreboot perhaps?

If that's the category it falls in, I think what we really need is 
something to land in coreboot source for indicating how it should behave 
and then also a change in the kernel to react to that.

That's a similar approach to what was used fore the chromebook laptops 
that run coreboot.

> 
> Note that drivers/acpi/video_detect.c already has a DMI
> quirk tables for models where the heuristics from
> acpi_video_get_backlight_type() don't work. In general
> we (mostly me) try to make it so that the heuristics
> work on most models, to avoid needing to add every model
> under the sun to the DMI quirk table, but if your laptop
> is somehow special then adding a DMI quirk for it should
> be fine ?
> 
> Can you perhaps explain a bit in what way your laptop
> is weird ?
> 
> Note that technically if the native backlight does not work,
> then the GPU driver really should not even try to register
> it. But sometimes the video-bios-tables claim the backlight
> pwm input is attached to the GPU while it is not and things
> have evolved in such a way that the DMI quirks for that
> live in acpi/video_detect.c rather then in the GPU driver.
> 
> Regards,
> 
> Hans
> 

