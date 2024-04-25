Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 300E68B1B53
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 08:58:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C8011A1EC;
	Thu, 25 Apr 2024 06:58:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SpkUX11y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2074.outbound.protection.outlook.com [40.107.244.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C34C11A1EB;
 Thu, 25 Apr 2024 06:58:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UrG7rjp+GzgT8wn4qvEwif3Xl58rjUfpqt8f3mgBtLDGR8vOTC5McEjoaQqdNYb+DrEQMhc/3TlEkxYYMDHouyYQsHw/2lByAH5O4P3rBFClhqPm68WZx/DayqxtSvYW41M91eVBbvIH/aw4p5YQrvgQ9R/dB9/h3sPoQFNwjJlccPXBJYPytGDQPRNxVz09ax9wDVmuVcRocZN29M+PNhmEeND6nt50lH4k86BrN5FHz8T/g+sf6e1O9am3zq3MpFY/igZ1FiRHosPa3Xm7YwFpLA3TeRp4lnDmenXzq+I5/+LDmqyszjWxvRioHzSK1bDsxZIStGYsLZzs7g9NRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aNI2SDX19asgOZvSWxSzU8cxV10Yv5MBIpUAGKqLAuA=;
 b=K/GOxR8Cky1qVX7XTsfD6VMZNShyQxtyI3e8bGMN8MkVEQgYXAI5mQBAHISw2dgdfPR8DGyav3FTxKBXuMfUnoLPf1uyv/N9GXHjuaXe5yw4I0EsPdu8u6t/QPzHjBXYXs5dhjaaOTuzkWNhntWd87NnxVvj8YpnQW1EONHJKZi2j7ntOVDAWCEDe7coRqS1HKRiutz5p/Vnj/JoaaKG+TRvAd0zhQNYm8yITSOU1hfY9vmm4jmvnGG86tb2lRh5EVUHDPHruKMOuZHS1lnH7rmmdUeX5IHwUcrCdANjolUYw9A3I5jx3zIiL/xjERQrw9rX65BKXXcYmnKahts02Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aNI2SDX19asgOZvSWxSzU8cxV10Yv5MBIpUAGKqLAuA=;
 b=SpkUX11yfIKQSSYnh22h4Ut9wYGsD86ClBhGLf4ozFyI4NzUyoz6/6GHIxzXJKNPZgM3y7HgUBwcQTF1/Ma+89ALOSpvP8jA+nNdoJW9Lxblsf7VC46cSaRKrdWI15W1ZB6R1h3NJ61Tezb/wHBvYjZ+4zC9v3NZ3DjPLUxKp5s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB6598.namprd12.prod.outlook.com (2603:10b6:930:42::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Thu, 25 Apr
 2024 06:58:20 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7519.021; Thu, 25 Apr 2024
 06:58:20 +0000
Message-ID: <b2e62f12-4490-4438-a54f-10e0c4a4e793@amd.com>
Date: Thu, 25 Apr 2024 08:58:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 16/18] drm/amdgpu: Implement SET_PRIORITY GEM op
To: Friedrich Vock <friedrich.vock@gmx.de>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Pierre-Loup Griffais <pgriffais@valvesoftware.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>, Joshua Ashton
 <joshua@froggi.es>, Alex Deucher <alexander.deucher@amd.com>
References: <20240424165937.54759-1-friedrich.vock@gmx.de>
 <20240424165937.54759-17-friedrich.vock@gmx.de>
 <e5224fdf-ecc0-41f2-a7d9-42e3937f2e63@amd.com>
 <6830272c-e3c0-4d54-aa10-6c96c1e644fc@gmx.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <6830272c-e3c0-4d54-aa10-6c96c1e644fc@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0235.eurprd07.prod.outlook.com
 (2603:10a6:802:58::38) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB6598:EE_
X-MS-Office365-Filtering-Correlation-Id: 38d16018-f359-4551-dbd9-08dc64f51779
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dHljbSs0Z3F0WmJGUkx2UjdVczJnSWVXeTVpUExWRWFVQ1B5clBZYU4vWVlx?=
 =?utf-8?B?dmxWcUNWL0FTY0pWQTkwS3Z3V2ZYMTdyT3Z6b2doOGRBSStqbGtuZVVzTXFh?=
 =?utf-8?B?MnF1VGxHM2ZVcHBBdTZ3OFV5YklCYWtHUEVQWHcrWUgyTDZ0OUFZTGJOSWQ1?=
 =?utf-8?B?cmtKM05aMmo4N2VYQ0JmU3Q4VXdDQitKMjFudktvbzUxTDJ4bm1hc2dudDJm?=
 =?utf-8?B?UXB4V3d5YWxkYVllZ1ptcldKcUhaUjc2QzVZTlpiSHdiUWFqYnkwczZXOGJU?=
 =?utf-8?B?TEp4eDhSUzlhbFhzdDJ1NTJDTVM2MllPQ25FcHFKdE9HNUZvSmN1QWhqRVZ2?=
 =?utf-8?B?QS9TUjlHVC9BZHJHOGNFVWdLREErZExuT2xXQUlveVIzMkt1cXU4UzdVcVc3?=
 =?utf-8?B?Qmh2Ukh5aWVHcytsUmVuYkkvM0JBZ1JTUFdaaWxCeHZJZjZFOFJHU1lLQ2VY?=
 =?utf-8?B?ZkpEQmgxYzhaTzU0dXVHbFRjeERWcWwyNVA2Z25WUk9DdGJQN2ttUmRBcXRv?=
 =?utf-8?B?UGhxK1NIN2J1SlpKdU5UeWQ5YWRubGdmTE1RYnc3SGcrQ2YxMm43TTJQTUpu?=
 =?utf-8?B?NlNzZjlvUXZ2SkNYTGlRSUh2N1FWbEVCVFNKbS9LRlZHd3BSTnhVRnVjN2RR?=
 =?utf-8?B?cTlqKzBPbkdBRE1qOFdTSWkxUlhkSDRDMEZETkFxbC9pYk1tQ2xoQnlnYTdC?=
 =?utf-8?B?ckEyZnpsSGtCYzJPRENRSGZybkJ4NUUyanQwSTY5L0s3QnlTeW4xWndUcGRk?=
 =?utf-8?B?UXpmRkEvNHhWaTNoOThZRGRoQlJEMFMyd0NncFovOHJTSjI0a3AzR0lUdVFU?=
 =?utf-8?B?eFVMZ3p5V2lKYTBsVC8rVmpncVluTHZUZDlLbHo1Q0JRZWpQRFYxZmtld2Nz?=
 =?utf-8?B?NkVBR3M3UXpmTUVZbHpzaFlDQTNDMFJNcDA4OUhTbDRBMkE0ZDVxM3QyWElO?=
 =?utf-8?B?MGFScVBGa1JqYk5MTERDRHhlYmlhWm1uWlVjdjM1dENSYTFVTFlBUVJHY3RD?=
 =?utf-8?B?dm1pU2FvQnoxSlhpNlBmZGN3emRSM0VsT2txUm5iWEp6ejYzWE4rV3E0MjFn?=
 =?utf-8?B?N0FzcXJOeHdseVYxN0plLzRta0VxbFhXMzJmWHRUbHduS25YZUZHb3paemZJ?=
 =?utf-8?B?SisxazJqRXFEY25yUllpT3UyVDFPL0dEM1hrMnZ6T25HZXV5Ny9qV2lMalNu?=
 =?utf-8?B?aEhwdEhMR3ZJTHpTYUQ5NjZhTCs3SVlTbFFyeWNvQ3hoVXJOOVhxN0Q2RE1E?=
 =?utf-8?B?Nlc4MDIyQ3Nvekx6VFZZU2xBZkpEajdOckhPNjVkRGJ4QzBpTm1lNmJsemo4?=
 =?utf-8?B?cU5TNWdBbnh4aTV1Vk10QVRmY1ZSaWxZUVY5eXpTVXQvNm9OT1hqaVE0Ukds?=
 =?utf-8?B?V3Q0MmZaMDZyRS9YQnZKMXFONUo0TmMyNVByMXFCd0t6MXljZUVKb0pkbW94?=
 =?utf-8?B?ZzQxTE14WlVmcExIaTB6ZWRkLytFN1JwaXIzYkdZb3NLWmNjcmNiNEd5SzY0?=
 =?utf-8?B?VFI3enNPaWlFRVVNVTltRlBTS0pSSFFDTEhSM25oSEo0OVYwYUtqbnkzNDhm?=
 =?utf-8?B?bHd6aTJJM0dqN1lFQVBKYXB3aVl3Y280SmU0aVR2Q21STXJINmtuRFllTStl?=
 =?utf-8?B?WThLdWVzQWtJc0cyK0NqYnNYb1pjTkg3b3NWL2pKWkNEK1RVbG03eHQ4SEU1?=
 =?utf-8?B?T3lDZS9uSXhua2VxbFBJUWk5TUYyczdiTzlTOFVqUWZyc1dPMjJpd0Z3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUwvZk4rOFpsUWt5b1dVQU9FRE9BOU1kSWFPZG9yQmY5b2dhTThEakgraS9j?=
 =?utf-8?B?QUx2V0VzZWRFcWVZQjRtSDNxWUg5by8wK3hBMGUxb2tRVUlteXNZQnczY0FJ?=
 =?utf-8?B?RkRWYUd2ejFBOXZYMXhVZzh0QlpDUkxlSlVPdmk5WW11U1dHZzVnVG1WNTlB?=
 =?utf-8?B?M3JLNmE3OFIxZWM2ZTNiU29UMjlCSnlJRzJVUVc5M0Q2K1ZNTWY2WHdSSjFE?=
 =?utf-8?B?UzNvQkNsY29KT3ZqNzVNSE92emk4eDNTTlZlbTJaQ3JEQXA4TGhwWEd0UFl3?=
 =?utf-8?B?N0V1VnFwbzl4cGtKZmFEWXZZT2xxOEUrKzY3L2FpV3RWRXhlQlVsL0pzeEVN?=
 =?utf-8?B?MHJVWDZrWnJEdVd4UTFHVnFjZWlDeTNiSmwrUWh2VUJrS2JqblJlUXlIWTlu?=
 =?utf-8?B?WGMwUE1RL3VqV1FwQTd2SDFucGhJaVBBZHhnamUvOVZzTmtpQXp3SlhrZ1JM?=
 =?utf-8?B?QlZOcHh6Yng0Y3lsaURuWk1nVm5Fb2Q1cFd3QWNPcFA2eW90MFdBNGs2ekNL?=
 =?utf-8?B?UEUzRGJuY2FBdS8yWk45M1pxWmRRd0hyd2p5Qm9WZUZGanV0cThQMVdCRVJl?=
 =?utf-8?B?VnA4TVYxd0xGMHYweW1NcjN6NDdmR3ZibHM2dUg3Y3c4S0Q5Y1BLcEd3OFlQ?=
 =?utf-8?B?OGpsb3dwVUJRa290bnAxSmd0U1VRZlpLQXJ6WFFtVEdxRXY4V2J0TVpCdEds?=
 =?utf-8?B?ZUhrQS9za211MzQ0U0ZocGQ1V2lpQ1Z4RndkZTdtV2xrYVduOTZURFAvOVBM?=
 =?utf-8?B?aHRGcWMyWG8zaW5VSUx5aEVBT3c1Wk8xdkM1eVRDcGptQm53V21BKzBTM3Zh?=
 =?utf-8?B?anMwaVNXNnpraVVhL3cxeEM2ZjRoL0hQMTBaQjdLUzNwMmFsSTk4eU9ra0N4?=
 =?utf-8?B?REVZRFJ4MWlPamxmNUlONnRKRFN6d3VudW4zS3dteUpWTzA1MkQzWlZrVFoz?=
 =?utf-8?B?bFZSdzVBeWNMY1F5bHFGVHZlYzlpRUdwS2UxT1VMNERNcmZhZnRHNmJoVGZm?=
 =?utf-8?B?MEpnTTFvZWdxaVVuR2hYYmlkVWRHU3RFbi9WaE9LVGpNSjBSQXpRd3FiWGNn?=
 =?utf-8?B?S2M5eXpQT0JjdEhxUERVd2RXY1dJN3lJbnBhYVdVQUFoa3RNdnRJTWFRZThV?=
 =?utf-8?B?alZrSDh3LzVEdy8yejQzY0hBOFptelJwTFVCZWl5R1VqUkxVSWY4TGg3bXNq?=
 =?utf-8?B?c0R3WnVydzBSeERZNzJUMVQ2M3ZOMlRtOUdkNzA5TE5RS0c5cEZFNElzZ1Rj?=
 =?utf-8?B?VXl1dnRHOGxxbnR3TGRGbllGT3YzUXpjaUtsMUVwMUFoam1sSUFaV3lXYmtt?=
 =?utf-8?B?SGNnTThuSlVYaVdMM293UjVMMFVSNzVPOE9yTW1SNlFJNjhJMld1a1JvZ0Jx?=
 =?utf-8?B?b2I3cFNNWkhWT0V3U0pxdml3OFZmRitrM1crS0pwUTJIS0s5eU1obzRMekp1?=
 =?utf-8?B?NFNvcS8xUlNoYjkzd3JnUWtyWEhiSmg0WlQzYURNemRLczVGQUhNTDRLOTB0?=
 =?utf-8?B?Y3lJMFJxYm90cUl3dlRMbXN6NFo0VkwrVEhoaVgvNHJhMWZldVRNOFV4a3Vr?=
 =?utf-8?B?WVFId2xWWGtvZWRKbTdyeUVvOW9jVmp3ZG40cno2OUw0cnczQ1hJUlliMG9l?=
 =?utf-8?B?NFpWN3dJZDMvaEs3b0x4WmF0eDZLeVo3YWJvUFFnSVlEN3ZnYWFxSThKUlJW?=
 =?utf-8?B?MXBvdWo2ZkVIV2h2OWQ4QVp6NTdFUUdvd1NxTTZlaHNhL1pVcnM1U3QrOXJS?=
 =?utf-8?B?M2plRFZ1YTNQYlNMalNSZ3U0dktIbE5sbVovbDRabmxpRlYvVHVPNGpPREdG?=
 =?utf-8?B?cmJSSlpMam12TDUxMVpGa0lMZ0Z3QXhIZlZFRjZPbFhVRlZlZkQwdlVDRjc5?=
 =?utf-8?B?WGJMejlhUG1JQUlKRnpCNW5rdTdodHZ4SC9rTENaU29KL0twZGwrbElVNU9r?=
 =?utf-8?B?VStIRlFYMVlnZTF1QTVxcGFaU0tVVWY0K1k5T21rb05zWUV6R2lOUUY0Q0VT?=
 =?utf-8?B?VlRUN3RPWmhhVmhnOUVzZ0liQXdKT2dVbGRudk16SjdKTWUzVStxMi9uVEFO?=
 =?utf-8?B?QUdlNUhIVTlkMmtGM2pUMWl3c2E1YmNNdm14Q20vdWpzNElwTUpPSFJqZEdV?=
 =?utf-8?Q?2LH8Zrc8G0Qt4su7sLivDnqqF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38d16018-f359-4551-dbd9-08dc64f51779
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 06:58:20.6236 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5fKLqKQFuHfjzQ5hbxx8QCdWa+HwiarLDGNtQMGq6AqhBlKluzUbpdn80OCk2gX8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6598
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

Am 25.04.24 um 08:46 schrieb Friedrich Vock:
> On 25.04.24 08:32, Christian König wrote:
>> Am 24.04.24 um 18:57 schrieb Friedrich Vock:
>>> Used by userspace to adjust buffer priorities in response to changes in
>>> application demand and memory pressure.
>>
>> Yeah, that was discussed over and over again. One big design criteria
>> is that we can't have global priorities from userspace!
>>
>> The background here is that this can trivially be abused.
>>
> I see your point when apps are allowed to prioritize themselves above
> other apps, and I agree that should probably be disallowed at least for
> unprivileged apps.
>
> Disallowing this is a pretty trivial change though, and I don't really
> see the abuse potential in being able to downgrade your own priority?

Yeah, I know what you mean and I'm also leaning towards that 
argumentation. But another good point is also that it doesn't actually help.

For example when you have desktop apps fighting with a game, you 
probably don't want to use static priorities, but rather evict the apps 
which are inactive and keep the apps which are active in the background.

In other words the priority just tells you which stuff from each app to 
evict first, but not which app to globally throw out.

Regards,
Christian.

>
> Regards,
> Friedrich
>
>> What we can do is to have per process priorities, but that needs to be
>> in the VM subsystem.
>>
>> That's also the reason why I personally think that the handling
>> shouldn't be inside TTM at all.
>>
>> Regards,
>> Christian.
>>
>>>
>>> Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 20 ++++++++++++++++++++
>>>   include/uapi/drm/amdgpu_drm.h           |  1 +
>>>   2 files changed, 21 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> index 5ca13e2e50f50..6107810a9c205 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> @@ -836,8 +836,10 @@ int amdgpu_gem_op_ioctl(struct drm_device *dev,
>>> void *data,
>>>   {
>>>       struct amdgpu_device *adev = drm_to_adev(dev);
>>>       struct drm_amdgpu_gem_op *args = data;
>>> +    struct ttm_resource_manager *man;
>>>       struct drm_gem_object *gobj;
>>>       struct amdgpu_vm_bo_base *base;
>>> +    struct ttm_operation_ctx ctx;
>>>       struct amdgpu_bo *robj;
>>>       int r;
>>>
>>> @@ -851,6 +853,9 @@ int amdgpu_gem_op_ioctl(struct drm_device *dev,
>>> void *data,
>>>       if (unlikely(r))
>>>           goto out;
>>>
>>> +    memset(&ctx, 0, sizeof(ctx));
>>> +    ctx.interruptible = true;
>>> +
>>>       switch (args->op) {
>>>       case AMDGPU_GEM_OP_GET_GEM_CREATE_INFO: {
>>>           struct drm_amdgpu_gem_create_in info;
>>> @@ -898,6 +903,21 @@ int amdgpu_gem_op_ioctl(struct drm_device *dev,
>>> void *data,
>>>
>>>           amdgpu_bo_unreserve(robj);
>>>           break;
>>> +    case AMDGPU_GEM_OP_SET_PRIORITY:
>>> +        if (args->value > AMDGPU_BO_PRIORITY_MAX_USER)
>>> +            args->value = AMDGPU_BO_PRIORITY_MAX_USER;
>>> +        ttm_bo_update_priority(&robj->tbo, args->value);
>>> +        if (robj->tbo.evicted_type != TTM_NUM_MEM_TYPES) {
>>> +            ttm_bo_try_unevict(&robj->tbo, &ctx);
>>> +            amdgpu_bo_unreserve(robj);
>>> +        } else {
>>> +            amdgpu_bo_unreserve(robj);
>>> +            man = ttm_manager_type(robj->tbo.bdev,
>>> +                robj->tbo.resource->mem_type);
>>> +            ttm_mem_unevict_evicted(robj->tbo.bdev, man,
>>> +                        true);
>>> +        }
>>> +        break;
>>>       default:
>>>           amdgpu_bo_unreserve(robj);
>>>           r = -EINVAL;
>>> diff --git a/include/uapi/drm/amdgpu_drm.h
>>> b/include/uapi/drm/amdgpu_drm.h
>>> index bdbe6b262a78d..53552dd489b9b 100644
>>> --- a/include/uapi/drm/amdgpu_drm.h
>>> +++ b/include/uapi/drm/amdgpu_drm.h
>>> @@ -531,6 +531,7 @@ union drm_amdgpu_wait_fences {
>>>
>>>   #define AMDGPU_GEM_OP_GET_GEM_CREATE_INFO    0
>>>   #define AMDGPU_GEM_OP_SET_PLACEMENT        1
>>> +#define AMDGPU_GEM_OP_SET_PRIORITY              2
>>>
>>>   /* Sets or returns a value associated with a buffer. */
>>>   struct drm_amdgpu_gem_op {
>>> -- 
>>> 2.44.0
>>>
>>

