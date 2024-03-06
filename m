Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0A18740CD
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 20:51:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6C310FD6E;
	Wed,  6 Mar 2024 19:50:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UaXARvNz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2066.outbound.protection.outlook.com [40.107.220.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F4E81134DF;
 Wed,  6 Mar 2024 19:50:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X5IJv//sg05sHvqqu/V03gFG76RK84P7VG4I5dfpRCC393X3uXNkyybwpMbYBVxh1fA8t2keLE9f6r1FPmi9NLUa5ykgwnS8VX27jUtaNXjLZOOgYiroDJeLRLGNJru7hakM17L9wSnfNgyuS/TG8DYxsMxn8uIOqTrQx3Pe7w6YfDcK8D1XpPRBZZh9BpF+it/2g+mDzct598pns6p+5gQMlrMShYnOdZRn1bGGgyZiVphadOnEpfowA0jY4neotNQS9zzYB8RG8plQbp4GiNlCICacTh11a0OtlDn9xeKfxq4IShOeycvJ/hUvLSbqVSvCM0ruMgSTkZBa5AkYYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fBYe3n0OTohJH/awlcFE2SejBxBRYEirvBUJoUNkI8M=;
 b=fK1T/aLLRp9u8IPDp7QEL2wAAUHtsIp3FTgqJQLD4KcYwmQEmghYf+TU/5eG1WuwhJArE1x5oKe3eeywju8d1GVEc/+DMPiZ8EJXAQr7AefAj07bZrXx+31Qovz5GPQY8nfGFQzcrzLNjjW94qofZsSVCu5i6Mjh9q2xGQXAIWjMBV7H+TsAdtWYp26qZAf0CJ5YY/2esaMMdg+Djr29tMO8FXEISY37PjhuY87QNitBDpM99eqrozrR/G6l3V0bmgb+cm++dSvRYTBzpxjyKmMbFNIRrkR2YCMK+EIb7XeoePRRDgbFHHDic/ThItkh9v21u46vkn8gC4sVCcZZ5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBYe3n0OTohJH/awlcFE2SejBxBRYEirvBUJoUNkI8M=;
 b=UaXARvNzPXNApHETHheeJxBmSrMI7B38F2H4xHGGuQ3mcNyumcM8Cqgqb2Y1bypmHriuq77wD09WN09qMqq/w6CkbMpcXGlmB0UARpr6PKQvyI/EFCAXiFXcC+TdOD4ljjxnMIaYumZTojY1iPhy0XkhH9KDvmf7KFfK5ebR/Eo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ1PR12MB6122.namprd12.prod.outlook.com (2603:10b6:a03:45b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Wed, 6 Mar
 2024 19:50:52 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dcf1:946c:3879:5765]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dcf1:946c:3879:5765%4]) with mapi id 15.20.7339.035; Wed, 6 Mar 2024
 19:50:52 +0000
Message-ID: <ef2e6a21-57d6-463b-8925-695f1c7586f5@amd.com>
Date: Wed, 6 Mar 2024 13:50:50 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd: Drop abm_level property
Content-Language: en-US
To: Harry Wentland <harry.wentland@amd.com>, Xaver Hugl <xaver.hugl@kde.org>
Cc: Hamza.Mahfooz@amd.com, Sunpeng.Li@amd.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>
References: <2333702.irdbgypaU6@xavers-framework>
 <e046ff23-8dd8-43ce-8249-c42d0bff7f5f@amd.com>
 <CAFZQkGyHo8wWXhQYeSm+F37unvfE6O2USiNu5RVu5Zq+EudQmQ@mail.gmail.com>
 <1ce952e9-ba06-4b02-83d0-107df0e4d13c@amd.com>
 <0f281978-4be9-4593-ade5-3d677723bbf9@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <0f281978-4be9-4593-ade5-3d677723bbf9@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0135.namprd11.prod.outlook.com
 (2603:10b6:806:131::20) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ1PR12MB6122:EE_
X-MS-Office365-Filtering-Correlation-Id: fe089388-55a7-4a48-42d3-08dc3e16babe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JPEjhIfHrMqRLEQ7OdXWpLND7aWNmJRGOz7b5hjII6vXhR416aCEbs6fFP8c8DCrDIZmCswVyeWTHQ3Z/qCNP07S5Yw4gy680+kJa0uqeSsJEKtWyF+k50D+B1SQtVr7r753UQjYUpaG23z8DsPxgNTOb5ZLUyu1nPeWByc6mGqREGfussqNekFkrjWy59rfdH9c/wbnTl0GIflroxbFs1utSh80x6+DTRwtPEQ01/FcGCuRlfxpUo2KnjIIbMLOi0PXLIYK15R9rAJ2291/sh/krCdAebIzGUsfKoJ4sDS8stqKKSyeqoDeYtde9AxgR++laJgQd9J5KjwPijSyonkZhMwmldwQo6P6Q+sX0KRfLt28aIyjoNLYeGfZPE33bCzPar4oBaMt9qBq9/LjhnVVY4SJDOZxmrys8wNfmRaY6kNC982nEY2vKoqqIlxVzZ9o+T0TvPIikeuqBWDguPdP8DvVW3Tnj61wuep/i77HouWtppJY+bfWHyRL6ZnTAlI24d9wz2HP7WlwGqcYzM6pNLZnC9kbTGCD9T33awF6jkoIVmb/87NxWofBQjXdoHoH9lA+SuXOjSEiW6rC2UMwZpFgoyF0ZtbWSz6aJN8t5JVuk5tV2T+kAsJVmigtHx1JaMcuEq//cCGMqyWTdkgCgSAcgrWm5rLP55c9sSw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vm5WVHNaTDFsc1hJaVhzZ29aYWt5aVVmaHNZckRjZm5aVS95VU1LSzAvM1Bh?=
 =?utf-8?B?Y2JRVEhHTWRGMXV4eEZCODN5TnR4Q2lzV1UzRlhIOFp6MWtDMjZCNENFYzJ3?=
 =?utf-8?B?RWJaVjZ5QUlIY0t2K0NleDlhZkhiVHNaNVpNM1Z3bkEvSytycENRV0NVZzho?=
 =?utf-8?B?bDdUdEV6Q2VmTDF1VmxRejZnVFNmYVh3bVcvQ3JtaFkraHdLZUxuUDN2M2lE?=
 =?utf-8?B?bzBTY1MxdXgvNFNuRWgyWGJTL2t0Z0NGTWZYdkhqc0pyNG9uQm83L0UxNXpt?=
 =?utf-8?B?YW92Y0VIVUI4MEUzM1hWalBQQkRVOXprQTJWelNra3FLalFPQmpEV0lYVlVZ?=
 =?utf-8?B?OUd1dWpZTDBkUzVQeXgvbkVuYXdWY243UkcrVER6cUJ6U2YzTGRoU0hFVm1I?=
 =?utf-8?B?Rm5EK1FmOEM2RlZsYXIwVmY2Tm1aVGk4RHVjT3lwS2RHUldUMEZMUzdOS2Y0?=
 =?utf-8?B?eHJ1S25JbXpLMXlBL2FSRW9JWWdUVUdQM1hpSHNCK25CTERZYjJQYjJWang0?=
 =?utf-8?B?VENRS0ZLWVZkSzN3Nms1MkhjdEVDVGhWMVlFVS9sMG4vUlJkSmN6RjVoTEZi?=
 =?utf-8?B?WUd1TnhSVHJONnMxU0dIejhWZi8xc3RySlZJV3RQK1RVdUJtZEF4WTNqcjhE?=
 =?utf-8?B?dFIzRGxyNnZFSVRhU0NJZHlock5qN1FQeHZnVG5ZU0RWZmp0bVhES1FYVnE4?=
 =?utf-8?B?RXpKenJCS0ZiR0x1RytDQjFNZ1Awd2ZtTERadC9kQnAvcUVyVnRUNGFMRyto?=
 =?utf-8?B?MmZtd3VpaTZPU3I2K29aNUswbVB6amF5cWZHd3hDUGQxaTBiV2toQTRaWTNp?=
 =?utf-8?B?Z1ZkR2tCRU9nNTNMV2J0UG1EZ0NrZVkrT1hvSUYxMlJnU20yUmRLaXI3RVhU?=
 =?utf-8?B?TEpmcitHd1h5dFFMNFJTMXVjZEZmQnVuK29tWGVlUzBzTTVMbktJd013eTN6?=
 =?utf-8?B?QzNqRWtHcm1HRXcwK3Rvci9GdUFGQnpNK21wNyt6ZmlGWUYxS2xBY25NM2Ex?=
 =?utf-8?B?OXFaamV1VTNBNlJxWGYvY2piVkwxOS9kQ1JBUWRSNHVCc0tGVTlXS3ExYlIr?=
 =?utf-8?B?dWI2NmhpeENmUDA1L04yb21XR1FkbTk5RDlXZi82NUQ5YjlhajlESzcwaVZx?=
 =?utf-8?B?enM4NlI3WGJUWGdaY0x0dGswV2ZqVmY4S2RMaXVwVEczQ0ZneExzV2hrM1Qy?=
 =?utf-8?B?N2o5Z3VSVEcxWDYvbnJha25ZMFZrUTVUazBZN0hheGtVbWgyYzB0SU00S2Vv?=
 =?utf-8?B?NWtlVE5teXBOZWFiWnpkOFhZNWRuK1FxZEV6S2tzQ3E3SWJSd0JYeVAxTlpq?=
 =?utf-8?B?R01NTkZUdGdmQnR4eUk3SC9UUEozQW4xSmdXSnVWVWRtOGdkNW1rTE1nWWRw?=
 =?utf-8?B?ckJMNFBOSDc1NjBZcGI0a0kwVWh2VTVEODhYeXBFdTMwTVNvQ1dpNlE2eWly?=
 =?utf-8?B?Vy9KYmNiajJnSzFnbzNuQ0FleHdMUGJrTXRyYUcrbnRsSVNNeXpYN0FKclhj?=
 =?utf-8?B?SFF3UldUcWRJaVE4c1F0VmFESjdvaGh4b1loR3VQUm8xc2IxVFdtdHNlUTNN?=
 =?utf-8?B?bnJCWTFDQ1A3NTJ2UFZrampVUVJ3N0JXMXVYZktsbVI3eExaV1BUMm5zVCtw?=
 =?utf-8?B?S1lpRkY0TE5yYW43cHdrakVwU3RucENScFFMSDBPNjJ4M2xuY01wQW9HOUJV?=
 =?utf-8?B?eHRZZEZmTEZ6UTNRa3VXQnBCYU9mdXdNeUtON2tOTmRlaSsvNnhUUjFLRmVX?=
 =?utf-8?B?bTF5QTFKcmdNZHVLdlgrLy9oaVlnWFlMTXVrVVRlWkw2Njd1aDhzemptV2tF?=
 =?utf-8?B?MHRuK2lSVnpjWTR3bFlETXRUanh0QmVVclloTXAya3FiQm5qOXZwdDVZaFVT?=
 =?utf-8?B?eC9Qc05BQjBTQjkxOUJzcy8wdHlZbUZsaWJZL00vUng5Rk9DRC9MZUJQMnNZ?=
 =?utf-8?B?UXBIckpLd0pjVVdFUXBFM3lzZmNlUzJ2RVBYUDhKMXhNRXpnL1RiQzFsbnBH?=
 =?utf-8?B?a2xkK05ueDBBRUpmMEtraENMZlh6OUdjZW5qay9YRkdRTWRGeS81YlA1aitP?=
 =?utf-8?B?MmZTTGVZQlRjZTd0MUNRQ0t0R0o5SzlNVmxJUk9kMlV0eGxNYU1sWlc5UDVp?=
 =?utf-8?Q?qMY30F6cTgYjdnJXFNz1DNURo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe089388-55a7-4a48-42d3-08dc3e16babe
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 19:50:52.5364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oh3igA+/T0a+ow2LaOBcAkHBkrVjrSFGQsa5bhlGTW/77r9AYehfbb7AAd5vy/MqWvBwatnmHnggRX8JZCdBdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6122
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

On 3/6/2024 12:59, Harry Wentland wrote:
> 
> 
> On 2024-03-06 13:02, Mario Limonciello wrote:
>> On 3/6/2024 12:00, Xaver Hugl wrote:
>>> Am Mi., 6. März 2024 um 18:19 Uhr schrieb Mario Limonciello
>>> <mario.limonciello@amd.com>:
>>>> So the idea being if the compositor isn't using it we let
>>>> power-profiles-daemon (or any other software) take control via sysfs and
>>>> if the compositor does want to control it then it then it writes a DRM
>>>> cap and we destroy the sysfs file?
>>>
>>> Yes. That way still only one party controls it at a given time, and we
>>> can get both good default behavior for display servers that don't care
>>> (like Xorg or compositors without color management support), and
>>> compositors that want to put in the effort can do more specific things
>>> with it.
>>
>> I think that's a very good solution.
>>
>> Harry, Hamza, what do you guys think?
> 
> In theory I like it. But how will this look in practice? Is PPD or compositor
> on the scene first? Would it be possible to yank the sysfs away from PPD?
> 

I double checked the existing PPD code to see how well this case maps out.

* If the compositor shows up first then PPD just wouldn't find amdgpu 
support when it probed.
* If PPD goes first and then the compositor I expect right now that PPD 
wouldn't explode.  All the cases that would update it check that the 
file exists before trying to write it.

I think the only risk is TOCTOU for that check relative to when it would 
write the file, but the worst case is you have an error in the journal 
log that it tried to write the file but it's not present (there is 
already error handling everywhere for this).

What we can do to smooth it out even more is export a CHANGE uevent from 
amdgpu when this happens.  PPD can react to the change event and totally 
stop the amdgpu plugin.

> DRM client caps are set by the client when the client interacts with DRM.
> At driver creation there is no client. How will the driver set things up?
> 

You jog my mind for another idea.

1) We could reintroduce abm_level property.
2) If client connects with the cap set, we make any reads or writes to 
the sysfs return -EBUSY and we make amdgpu issue a CHANGE uevent.

* Unchanged PPD will likely log a message to the journal that writes 
fail, but won't explode.
* A changed PPD could react to the uevent and look for -EBUSY to not 
bother even logging a message to the journal.

> A user might switch between DRM clients (login manager, to desktop compositor,
> maybe to another VT with a different compositor). I know everything but the
> login manager to desktop compositor hand-off is today considered exotic, but
> what if someone starts building a use-case for it? I've done a bunch of gamescope
> or IGT work in a different VT while I've had Plasma running on its default
> VT.
> 

If going off the cap of the client to decide whether or not to report 
-EBUSY to sysfs I think it handles the handoff cleanly.

> If someone can sketch this out, with answers to all the questions above and
> any other questions you can come up (be creative), I'd be happy to review.
> Alternatively we can discuss this at the hackfest and maybe arrive at a
> solution.
> 
Yes; I think we should use this thread as a basis for that discussion.

