Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A608D3C4C
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 18:27:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 302FA10E706;
	Wed, 29 May 2024 16:27:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sMghtErF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2040.outbound.protection.outlook.com [40.107.100.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D30710E706;
 Wed, 29 May 2024 16:27:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mUy41B7gMg0U5uyiyEckZPjURztlfzkwR2hjsBKPGod3q5f54AnbNBQ8gfiotT4eMJiv/EitOvTA16sb0p7LET15fkzIHU/8n4O2khtZo85xWodLLaoI+PPLodG/n2XM6RpAYUK3Z9NHsC8UmnRTZ031OjPSt18GrMqziRhkV84RImKZMz4BnrHoPldVBLZmfVbofyBWA/Cc+tXDYQErBSCvICyxGLZBejAcSqkekZI0+TLOuFYGP/eLqSlPg6avSpbiy/lVCbGcmI8AjBMcb4eqtQ3oXbMtfam+6gzWBZFSYkjF3gIfBsXxeFfEwWNp8F0SzL8RMcTFuBUmvq8T9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EPlMl405g6R3ZzM5JERXRdiMHDwl21YG7klWfzkUWCk=;
 b=W9pb8dXAglNaATc4++k3GCz3aEi6X8FNmLzilnnPQqzLNoYDaMjxI1uEANomJi1yzVE3O1HFByoDgV+2lhcmoTxhhzPk7jNMmSygQ88RX/ocJy28uZsELWlu9Dzf2qlo66ms4Fo8QqH5iBb0f04QFJhu8wZWTcYh2VvL7iSDE6CJxgzIqNhC4il0nOlFvCHiCSTWg2lD0uexG0dMz9GSX2JDr16bFBV4ESkzip8DDlnIAfM8yZs7XJT/hjOw1EnPHReeqHG/lIwhQvafK85WXnvIN9D94UDS8PM/TaeDiQtxu0hvat0UTO0HjDJqjYzUh8EFIZb2s7tZ4YpSogtHWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EPlMl405g6R3ZzM5JERXRdiMHDwl21YG7klWfzkUWCk=;
 b=sMghtErFdY84Cltu7jZLzsVStuR+WDn4mQodVLfP3QCjT++F0262d2tZT55dxN8bOcxHcEgyyHGEfSkyItEN2+asXVjRsLdf+SbuleoJz31WHw6i9AIseuvwpKcGkNocpjEm4LIwT93TzLwnfslPu6iapkdYtEfPvlJMSv5OazY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA1PR12MB8311.namprd12.prod.outlook.com (2603:10b6:208:3fa::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.26; Wed, 29 May
 2024 16:27:00 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.7611.030; Wed, 29 May 2024
 16:27:00 +0000
Message-ID: <1f8ccefa-204f-4477-814f-4a1dfbbe6741@amd.com>
Date: Wed, 29 May 2024 11:26:58 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/client: Detect when ACPI lid is closed during
 initialization
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org, Chris Bainbridge <chris.bainbridge@gmail.com>,
 hughsient@gmail.com
References: <20240528210319.1242-1-mario.limonciello@amd.com>
 <Zlc4V1goFvU2antl@intel.com> <197d195f-9206-41dd-8ff1-f4bb4988fb9b@amd.com>
 <ZldMKZ1MzSDXOheJ@intel.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <ZldMKZ1MzSDXOheJ@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR11CA0015.namprd11.prod.outlook.com
 (2603:10b6:806:6e::20) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA1PR12MB8311:EE_
X-MS-Office365-Filtering-Correlation-Id: dab408f2-08ea-4119-bcb0-08dc7ffc2a98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|7416005|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VS9YWVk4ME5nN2x1MTh3M2ZkeHZmSk9pU0oyWWlueTVSK0M4d2QzaEFvbU5F?=
 =?utf-8?B?VzlwcjBVUWZSaktEamlPNThFK2luNHU2cHF4YXFvTFl2SmFZNFY3cXQvRGU1?=
 =?utf-8?B?M0Q4bHVVRlZ6WG9wNktaZUQ1ZnB3S0ZMMTV1THVmOTdKZGJISTdSREx5cGdM?=
 =?utf-8?B?UFNldFJ0RU9rc2VSdWlLUHpsVk9PcjZid1J1c280SHZSWjhKM1BxWERmV3F5?=
 =?utf-8?B?aHZScm56RlphaFB1ODNNYWFxOEtDekd5TXJ4d08rYlV1OU53akxoajUxZGM1?=
 =?utf-8?B?V2NQcUNQcmUvOVRXaE1sMFg0QnFEUmhLNzdMUGxDMWpEdk1nUWZLQ3hMRjg0?=
 =?utf-8?B?N3BZSFVMTGRPR2hmUlR1aTZJNlRZc3hRTDFrWEJZRk9lNkdLeGdRODdGUTBv?=
 =?utf-8?B?ZmEvWDdpSDZxR3VYNkZBUmhtdU0vVyt1aXhtRUNVZ0c3VEpRdzJEN0d5Z044?=
 =?utf-8?B?TWVEd2RSSnY1RkZKa3hnNEtHaFBpMXZlRGFqNmZrUFdqeXdvajJDVVYyOEZj?=
 =?utf-8?B?d1drbVdXRHF4Y2NwL29aL3VuWXZGTTRrQkxwcW55UzBpMURpYitxdlVvaWZj?=
 =?utf-8?B?cW56aGQ1R2JUNVk1UWNrb1RVZU91S3FYVm84OFhNa3BUbmV2Q1VCSTlVSzdi?=
 =?utf-8?B?S05pVHlzc251ZVhlb1hkbzhRai8yd21wcVNDVWZTNWpoMUhzSWZ3c3hTQzFa?=
 =?utf-8?B?bHozUU9OODhBb1RJSDVXclFJZTdES3hQeTB1SWNIV21mOG9IcURabUljL1VI?=
 =?utf-8?B?V0x2c2tibGx6blAxQVZkVmVObkdMcWFJaWI3dFpwZ3JVZnczQXhRenJRb29F?=
 =?utf-8?B?WkFjWjdvMy9jSC9GR1ZhU2VKMStiSGF5ZDdUNUVFUHNUY1hoOHQ5MlcvN29o?=
 =?utf-8?B?ODRLb0Ezak92NzhpZWxyMHJiWjVmRUs5N0ttMXdhajZWNVAvcEVTSEhKaTAz?=
 =?utf-8?B?blhDd0FpdXZPb1Zia0xPM0p2c2pVWit5bkZhMnh0WVFCbGs0blBmdVF2VUJx?=
 =?utf-8?B?Yzcvc0Z2MkxJQ1RlQjVJTE5XY0xyNGlUVlZvV3VvV2lOWEpmaEg3dnNYOW1P?=
 =?utf-8?B?cm9BNEFVVHVYWkhlR0Foa2FjSk5mOVlJcDcwdDN6UTZXaWtCTkJ0ZHdNU3Mr?=
 =?utf-8?B?UDFjVFB3ck9zbnFpb1NUTzdMaTNuTUI2bnhGWVRDaUNTckFjUlJ2QTVjZHFk?=
 =?utf-8?B?L1NrSzc5bURoOVF4b3lnMkg0RGhBSWFvUFNQSGV3UEtrZStEa3h2OTB4akNJ?=
 =?utf-8?B?Yk0ydEpYWitDRTFhZ2w1ZUl0WnlGaENVNzJEaXNha3kxaWptVkIyT1lLTnJr?=
 =?utf-8?B?eW4rQWxDU24wUHhXUTJmUmV1K0JSQjBmem1iT2ZUM3NoYk5ocGoxelo3U05V?=
 =?utf-8?B?WXhFdmpESklZbE4yYVk2ZTFjaVp2SlRCQnV6T3ZSdHhMT1FXcEFEaEpmbThO?=
 =?utf-8?B?bGR1aHRsOEdWVWNlMDRHak5BQjByZzJQaVNDMDR4b1FoczRSbTZVVWNGVGt6?=
 =?utf-8?B?U0RYTGxlcmUxSUV1Wmp0VjlUazk4aG44TlVQYlovU0toVGpUd2w1d3V5dTdY?=
 =?utf-8?B?ckRrLy8xQ0pmcnJoSk03d29HV3o0M0RGS1BBbUlEcFJYR1c4WWtqcHdHc2I4?=
 =?utf-8?B?bmRLUGlTaFpSRUJybjdNdlNpdW9OSjROS3Z0T25kOWNDN0hDNTY3YmNnam45?=
 =?utf-8?B?dzR2dGtqOWdqd0hidVQ3dURRd2ZVNVlHYnZrV3RkM1hvbWxEcG9lOXFBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHROUjRzMCtmMTdKMjhhS2pQcVFXd3I0UXZVWHJJbzlXYlBqemhXbVpxaWlh?=
 =?utf-8?B?dXE0RmNURzhZQ2lnNXN3WXZvcnJiNjZWcUt4V3pxYmZCMHFFYTVTYWRjQTVS?=
 =?utf-8?B?L2MvUmtwQ0prWTd3ODJRTnpPWkhaU045UkZsNXM4Yy9BSW1wRXdQek9YaU5N?=
 =?utf-8?B?MDdEaUhHbVBHRHpvdjJRbEcxYUc3Ylh6eEhlRTI0OWlkYjFGWmErcEhsNDdM?=
 =?utf-8?B?dzFQSWNQVGF5YjI0eEswY29oSVhGMHhuSVRWZW5lMEEvWkN3bEMwT1FaRi9V?=
 =?utf-8?B?bjcwelZQc1pzYk45bVhsbjVNWHVrd2Jnc1VlRzNQYTRYdGp2eVo1WENFN1kw?=
 =?utf-8?B?b3pybXZ1bUM3Z1RjZXJiOXJmOFVvVjRYWlNCQjQ5Y04zQno2YWlzdmVmajBD?=
 =?utf-8?B?QVJpZkhYTys1ZkJuL1BJTENVdjFoaHlmbmZRNTYvbFhObDN2Q0prWGVCQ2Mr?=
 =?utf-8?B?UXhQcGx4RFZyNjN1NnJVd3RiTVZhdUEzT1RXZUtUelNTV3FMWURVTStBVnZv?=
 =?utf-8?B?cHpHQlQzNzhuS09HTWgxT28xMUNmcUlkUjNzWitPVEd0cm9ZYWhzMjR6dXpW?=
 =?utf-8?B?UjVOOE52MlA3bzJpd1dZN0tMWko1QVJJeHhZQ000bUZuR0dQc2VPZ2E0VjRD?=
 =?utf-8?B?NTFVRTV3TkZZZEhJQ21NcHJXUjUwd0dWNEZRMytyTXFmaWk1ZVFFQ1N2Qmxr?=
 =?utf-8?B?RXZkMFlqd1lUeWJtZ2htZmtMZ1hxd2hvanpJY21pUFM2cVlEb0NpdXZaMTg5?=
 =?utf-8?B?RU5SVzk4cWNwdkF2c3RoR2xQREdrNDBWclZLQUZCb2tNM0hoS0FvRHJtN3NJ?=
 =?utf-8?B?Z3BXNTRkTXZ5R3FUeTE3N3QrM0daNVNYVmVRSjJScmVZU0dUY1RXNlY3OFFQ?=
 =?utf-8?B?cE43WktUMWFzOTM3WmpWdVplQWtQbExaMGdBVHBsTHNmTnpMMXhXblpZdTl2?=
 =?utf-8?B?MHVwVnAvMWE0R09ON01PQnJOMmRJVkwvS0hOK3JoWDNJNUlPK2RJQUpYejZt?=
 =?utf-8?B?NE9OTVF5SXdsVUk2SGlkUFljcFNwQlhYTXRwei9VOVFtRC80U05VVFhVT3Yz?=
 =?utf-8?B?clJxOEVtMW5SZGZ0NklxdExFVFJ1U09qMkJXUXJ1aEt6MDJqWUZNcWpwcm5T?=
 =?utf-8?B?S3VpdkVQSnVvb2k0d2N4QkE2ejhoNitGUU1LdEsvK1pUSWtDeVBhZHZoenlk?=
 =?utf-8?B?ZEd5dkZOeGxsV1Z3anhYa2pCRGpjdHRGaWhJMDI1L3JOc1VPNlhRcEFVTWpH?=
 =?utf-8?B?NTc2eUZHN3diOFpzM0VZb1JqUTR5dDBESEI2TlZEeXcrLzE4d1I3QUUxbG1t?=
 =?utf-8?B?c2dyZndxd2hWNTVwa2hCV3FTSE5rNzA1eHdzcUJEVUVYRXJCcHBnTXdXdTcz?=
 =?utf-8?B?cGRkVHRYZURRcS9JQ3ZRa0p3dmJ4Uzk5SCtLdy80THZCTkw2cFJQeFVFcVVK?=
 =?utf-8?B?dFh0YThOdDU4SnNPYkZlWVVKaW1jUVN4NlEyTXRoN0o2WFprRDRnOWF2V0pS?=
 =?utf-8?B?WHRmMGdobzVwMW1ENEx4WEhDNFFQR1drNUhkbjF6RlliRnRQVnJDR1hHbG5E?=
 =?utf-8?B?MUE5cklYSkRLNVc4bUdKWTRmNWw2dlhxLzJnVG9TNUI5MDFlQmZJKzFHY05j?=
 =?utf-8?B?a21uL2pWeUN3WlcxZlpRWFlQdCtscTUyQ2dFY3ZZaStRRTBLbnUwUkp4a3gv?=
 =?utf-8?B?ZS94c2NwOGdKNkFSeDhLa095b2ozZ0lkNzUwUVcvZk91UTMxdExxR0ZVZVJQ?=
 =?utf-8?B?SURxeGJxaTNvTU1nZEttRDRIWWhJYWRuVE9nKzF5aVJxeHFNL2hxaCtKQk1J?=
 =?utf-8?B?dXhvc2lpNWo1dysyR0xSMkE4VWx0MThpdXV0c01VS0ROUW8vKzJyMWplQzRG?=
 =?utf-8?B?SmtDTVZFN0RqaEZPdGNwT3lpTjlCUC9HVlpSaVc0SXA2S0JJUXJRQzQ1USsr?=
 =?utf-8?B?emJCNjNRdldUdlBmMHQ3bEtjTG1wVmlrdEpxVkc4TUQ1cm5OUnEweEpmcEdZ?=
 =?utf-8?B?THpGZjlhc1pETXlya09hNnhtekozNlZwOHBnVzRwc0NPb0NVa0x6R3NXdjMy?=
 =?utf-8?B?czJQOXozZ2g5eWg2dHgwcGdOTUtxYXRrQ2IzTzltUVcyemIwS0tqeFFVZ0dZ?=
 =?utf-8?Q?99OqamNGHiw2r64m0G3m0Y6iE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dab408f2-08ea-4119-bcb0-08dc7ffc2a98
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 16:27:00.4543 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jR8o9Z/YcgQjAp0exN2trRsG3eXaRT/RLRJ3xOx6a9FHyr/7OUwKmjmjaKN1ss8wK6DpNYhamXszOXNL63XdLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8311
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


>>>
>>> If you don't hook into some lid notify event how is one supposed to get
>>> the display back to life after opening the lid?
>>
>> I guess in my mind it's a tangential to the "initial modeset".  The DRM
>> master can issue a modeset to enable the combination as desired.
> 
> This code is run whenever there's a hotplug/etc. Not sure why you're
> only thinking about the initial modeset.

Got it; so in that case adding a notification chain for lid events to 
run it again should do the trick.

> 
>>
>> When I tested I did confirm that with mutter such an event is received
>> and it does the modeset to enable the eDP when lid is opened.
> 
> This code isn't relevant when you have a userspace drm master
> calling the shots.

Right.

> 
>>
>> Let me ask this - what happens if no DRM master running and you hotplug
>> a DP cable?  Does a "new" clone configuration get done?
> 
> Yes, this code reprobes the displays and comes up with a new
> config to suit the new situation.

Got it; in this case you're right we should have some notification 
chain.  Do you think it should be in the initial patch or a follow up?

> 
> The other potential issue here is whether acpi_lid_open() is actually
> trustworthy. Some kms drivers have/had some lid handling in their own
> code, and I'm pretty sure those have often needed quirks/modparams
> to actually do sensible things on certain machines.
> 
> FWIW I ripped out all the lid crap from i915 long ago since it was
> half backed, mostly broken, and ugly, and I'm not looking to add it
> back there. But I do think handling that in drm_client does seem
> somewhat sane, as that should more or less match what userspace
> clients would do. Just a question of how bad the quirk situation
> will get...
> 

If the lid reporting is wrong it's not just drm_client that would 
falter.  There are other parts of the kernel that rely upon 
acpi_lid_open() being accurate and IMO it would be best to put any 
quirks to the effect in drivers/acpi/button.c.

If it can't be relied upon then it's best to just report -EINVAL or -ENODEV.

> 
> Also a direct acpi_lid_open() call seems a bit iffy. But I guess if
> someone needs this to work on non-ACPI system they get to figure out
> how to abstract it better. acpi_lid_open() does seem to return != 0
> when ACPI is not supported, so at least it would err on the side
> of enabling everything.
> 

Yeah acpi_lid_open() seemed fine to me specifically because non ACPI 
hardcodes to open.
