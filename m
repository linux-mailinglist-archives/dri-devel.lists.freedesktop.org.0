Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C585BA1F1
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 22:44:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4584010EBDA;
	Thu, 15 Sep 2022 20:44:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 656E910E294;
 Thu, 15 Sep 2022 20:44:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oZy4ajFjpdeIxs8O0eN4awJjM6fIKa4R0mXCET1dUs1B1xhENEn9+iXJmK6mfLHfd3qf3li7L6Z9eUSRA+Lqa1+34EBr1cMI3LBvnq+Nu7Tac2AbI2rOEI8PkAFeMdSv/nxShFUV+EGiMQ6EcK/6jdR7xySX4QkBurGXf02M6IP05oyFQNLZZFVBBrrIOGTWd8EsW1X89360WGzX6Dvx0uzhMBqPvhohmBC+mxrBpCv3r6iSnSNcptrQhABwiSsiu2nhXpfVSaO+NlS1OrDYac0Vq0fzgYwzvzuJACvHB3tcBq/I1vLRZ2DlP9oXmEfImogePiSR8pbHxa9XzJVbIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qORv0C4vVqwNKoSUTbz7Qg5H8z1/8iaOMQYmplGMYWI=;
 b=ch++PIxvAl9esFyP5r94XsPTDiKsnAfTkzaNaVovNLSdNOdOH4zOxC6gMPvnnXb9Ru8jzDKFoT7EU49hq8Qoy+4LEDPFutGtUuK+LA2XkxvtkZrz51T+Zskt3sylB1Gievl7wth0R3PhRuICc6/aY0/KFpIEA5Wex4HQDZmO02kEEbYdc8Obxn6Rbyw+g8ZvJSDbydF9oYQM/7xWpLtenBZVxpdRN9M+PnMwiX5OPw/fM18h8nPHJYkegIcm+WeYInPOpHaHs8XTVCZSUnn4oUzy/PR9yUuMjWFFiCoAUMNSAgs/aNXj/i0pE8BcFIrPL9QtDA4GXw7vRZsNUVIPhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qORv0C4vVqwNKoSUTbz7Qg5H8z1/8iaOMQYmplGMYWI=;
 b=Tn08td9bzAhaJMIIHno21xTis2mzwQsAL97/AFOzC8fFHYB3SAhiA8IRSd2tfrrWdt+AP62RJobaM70KT8Vl2t4TxxYXi8qAfPTjDwJgcO/crA3SEBf6GRXNHj+05EcLyv+qB03H6DaW1MZoN2J9Vg2a3zTdJ+r/1TcetC1d6lM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by SA0PR12MB4399.namprd12.prod.outlook.com (2603:10b6:806:98::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15; Thu, 15 Sep
 2022 20:44:22 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::588c:ac12:d318:bfee]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::588c:ac12:d318:bfee%7]) with mapi id 15.20.5632.015; Thu, 15 Sep 2022
 20:44:22 +0000
Message-ID: <e3f2696a-5c21-3d77-ac61-5b5441d11760@amd.com>
Date: Thu, 15 Sep 2022 16:44:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH V3 46/47] drm/amd/display: Fix failures of disabling
 primary plans
Content-Language: en-US
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>,
 Alex Hung <alex.hung@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Harry.Wentland@amd.com, Mark Yacoub <markyacoub@chromium.org>,
 Sunpeng.Li@amd.com, ddavenport@google.com, Simon Ser <contact@emersion.fr>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
References: <20220914051046.1131186-1-Wayne.Lin@amd.com>
 <20220914051046.1131186-47-Wayne.Lin@amd.com>
 <604a1d7e-1cd9-ad27-6d37-2e8535ce253b@mailbox.org>
 <40e970ca-c0ac-98b3-0549-2d7b1a812f81@mailbox.org>
 <c429010f-30ea-7abf-a67a-e730c7a6728d@amd.com>
 <65bbb8fb-92ae-774c-72ab-d22195851828@mailbox.org>
 <d94e5504-41b2-3546-24cb-6db2877d277c@amd.com>
 <5f12b404-e351-3ae2-65b6-f83f27e1c7be@mailbox.org>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <5f12b404-e351-3ae2-65b6-f83f27e1c7be@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR03CA0053.namprd03.prod.outlook.com
 (2603:10b6:208:32d::28) To MN2PR12MB2941.namprd12.prod.outlook.com
 (2603:10b6:208:a9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB2941:EE_|SA0PR12MB4399:EE_
X-MS-Office365-Filtering-Correlation-Id: f3222d3d-a73d-465c-d7f1-08da975b11ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YO/IQL3BraVgDHW30M3nd78m9I6XULxB0yrz5tRsdnLGkOfxcm4e8KReWHlr1xvCmSQsigZS+uZLVA2Ho1kM4TcrYqKwiHYlUYhBUAvgXsrkXb7uN3jjgSNUt35cOtOPoO8N4cWDtymch2FJbiqeeP3g49TBD1NMKxVUP2umL8Cn5gihV9bST+uFv3VzAopPkrJbQXNAn1JcpaVxCtMkEfiYX518HizGajM/hcyNHdPmjzkuS81AsWHOc4cVIcvz2QyJVXHcsuNY4uqW9lLkNtIGZGdQnYIy0OIuARb8WVzA5InNaDVkAAkTJ8cor7l0f2/nEoscjN7TBTjBJpW5N/pSqaimYkay8cdHHMWBRbujPT2kIVlSrXo6WhF426VsLGOm7ir27paYff6AiI1UCkiRvgXmUFdDElNUNgE4ueu50YhOymp7GK0CdL6m5u8UlDs6am1lxXsnB6WDcuRDbEFmV2b8BG1ODO4HQvZdQvc69SyteYMRj/oBh3GXyl6zKcY40FE9FeuQH99tkyGedSMVRe93Arro5MWhxR2o4YiF85cBZ+GcSXVBtUfz3aiz03o0uZVawx9WsJMiMXoi/udJjL325waMHG5TTp6m+wDhgG/gYQPs2vsDM0CqM+B+tL0DRUb7ZKfmvxnAPy2hD/s0pfDj5KtkqrRW/zbYCTcCI9e4ShZ98S5HaQIDuaZbyeltkrlVcmY5vEzBW9uiL5k2Q8IAGdiVM4JDb3IEJJtt3UM0SfE0zwNweiVYlKnwzjOSd8wTNdgr1vhyMQjjdw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2941.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(136003)(366004)(39860400002)(376002)(451199015)(921005)(86362001)(31696002)(110136005)(38100700002)(8676002)(6636002)(66556008)(66946007)(4326008)(66476007)(316002)(8936002)(478600001)(2906002)(5660300002)(186003)(2616005)(83380400001)(966005)(66574015)(6486002)(53546011)(6506007)(26005)(41300700001)(6512007)(31686004)(66899012)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWZtU0FNaVg0c1NXdFZwSitZSFkzRUQrY0IyNEM2KzFOZ2U1V3h3UDRTNGVw?=
 =?utf-8?B?WDFyQVNEREM4eVdKd0Z0bGNGK21raGQxVnJKSzlTMWZMc2NsR0YzY3RmL3px?=
 =?utf-8?B?UUUzTVFCMXpuVDZpVjk3MVRmQ1hlZlp4N2JMU0V3Vy9oUlFKZlB2QjREd1gw?=
 =?utf-8?B?M0hxRG1pdmtZQ0ZCV3hhMFpkS09pM0tOR004YXV6UjlWQWdySk5ZWEpBSitE?=
 =?utf-8?B?TmlzQmZxK1RpRUdsSUZYUVg4NkVmMm1tbjYrSy9XcnhwMS81MmxBMXRuRjRO?=
 =?utf-8?B?OWFUUHNwQk1lQzA4bFJSRGFScllYcWRCajhGS2FIQzZ6U0RoeDZaTmVJZ3Yz?=
 =?utf-8?B?QVl5RlJsbGFsOXErd1hBczJua21hK1RZTUZqTjF0L1pqV0JHQ1FTeHYzZFNQ?=
 =?utf-8?B?UUQxOGVPb0szUU14SVVaVitieDg1SDN2UC9IenFwV3hTM3ExeDA4eTQ4MGln?=
 =?utf-8?B?enNTSHdsSDYyRnBWOHp4dnBLZlN0TDNXbzlTeXFuRTYveHJiRjd5ajZvTDM4?=
 =?utf-8?B?aE52TnhRWk9pNW9jL1F1ZE43YVYyWnNmSmQxakNsdGhPaEVIbXlyNnBFOGFn?=
 =?utf-8?B?T1JaaUJLZ1IrZjVaL1drcTFoUlQ0NTRJOUZrcnVOMTgwVEtwVFkzN3RRTkZk?=
 =?utf-8?B?ZyszMVB5RTE3WGlmN0VjczZkalF0STdEVTVMR0oyR2VGTHRpa1AyWjlieDhX?=
 =?utf-8?B?aXdDVXhvb1RIR3JrcTI2S0pzSHQ4SVZUZTcwYnJSeFpybXNSTjRZczJvcDdT?=
 =?utf-8?B?QjNha1dpQTg5cUhVWVVxSERGMlBOcXBnMURuUEFwbFlJQ3VtMXZKeE40dE9v?=
 =?utf-8?B?N0EvUTUwRGJZelF5WG1PTm5kWGZPUW53YkxUcCsvQ1NtdDYvTW1NcmhQbHNq?=
 =?utf-8?B?aG9HYzVJb2x5V2lsa3dxMGtOcHFFc085dU1ZTzd0aGUrbzlHSFpXTHFDQytm?=
 =?utf-8?B?dlBtWDNsRmpZdmlIejF3aE02eVc2MmhSN1U4eFhXWUZSdnJhcStsbjBqVktp?=
 =?utf-8?B?WHhKclpyRVJUNWlIZnZyY0FNeUhlOFcrNlI3TVpsek1qeE90RVhGUC9lV2Nn?=
 =?utf-8?B?UFNGWGlDNkFIWlRLbjcvc3didHljK0p5OWhZQzdCWktTTmhzK3dvS25WeTJw?=
 =?utf-8?B?bGtDRHRYb1R6MndMREJqRzAvNjVsc0FRZVlxMi9oUHdJQml5RHhkc1dvNlYw?=
 =?utf-8?B?enFDTXNMdmtHa3B2TjJ3YWw1RDN3RUtxSVU4MnhZdHRTN3FzU0JQd3VQZE04?=
 =?utf-8?B?aWVEZis2M25KdlZSTFBwQjJqNFBIWkExUVpvL040U0E2aTRKblF4d1Q4Y1l1?=
 =?utf-8?B?ZmRPMXFOV204UmgrQ3Y3VGcrWEtTU1RCRW5qLzR2aStNMC9DekZmOXljWHNT?=
 =?utf-8?B?S2pUM0pwY3piSThxUUtuL2gxL3gwbkNwbGNiekFwYTU0OWdpN29iamxlRU8z?=
 =?utf-8?B?ZFFHbW1BLzQzbzlac2l1dE12blM4UGhwVUV1d3dQYVhiS0pHVTFnMG5Dbmcy?=
 =?utf-8?B?SGo0V1RGSG9CcmlydDBDSmRaMG92TkV6S0RMR3dBSGpvcHcrZUUvYndWREJI?=
 =?utf-8?B?OE1hY0NrSTM5bjRscTNqbnBZRkFicjc1WkJ2bmRFUEVLdnpobzlqdUgwVmlF?=
 =?utf-8?B?UWxJNG1HeTZIWWRLSTgvQlc2YlRnNGtoQnpTSlFpanU0ZG1JUEEvcWtGb3Z4?=
 =?utf-8?B?d1c5NjJ6bkQ1VVVzMVJTcm40RkZWa1RsRUlNbVNNeGliUXdOd2dwSG9Oc1h6?=
 =?utf-8?B?aXB3RHFtTTBJYWhCcTZvNjJCRjNzZUVCQVJwNjI3SGlQM1E5OXpQMEo0TW5p?=
 =?utf-8?B?Umg5bXZWaUVyQSttcnRMSTZCb0xRSEJ0V3hZUG1nTVczVHBra0N1TzJPSFV6?=
 =?utf-8?B?SWh4Nm5RQXpHdW95S0pJbStmd1VldkFaVUNzUmdsNFlPcjc0MkYrbXRhRDFE?=
 =?utf-8?B?TEFNaVhKd29uWDdnZGR4cG9oQ0tHU3RydEhIRVF5N3JVaS9mYitYTVpzTlRN?=
 =?utf-8?B?M1VmT3BqSGY0dEJSVlI4eS8vSnRnNTVLcWViRkloWnFaeUZoYmxkYVAzek5o?=
 =?utf-8?B?dUg0NUZ0TzJMMHM1eDVGOGp4eWFXcGh1bmRNVlBUbTZhemNVSDZ3bGNobU9N?=
 =?utf-8?Q?Yw/7ISS4JxXYrc85TCOW4ysF9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3222d3d-a73d-465c-d7f1-08da975b11ba
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2941.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 20:44:22.3497 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VxrttksX6pL9zpQiRalO6ydts8w4PQtUlEY9mV27vrEdx+a0cRJ/CC3GbLCIJmIw/2rNGh46aucF//5nib0TbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4399
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
Cc: stylon.wang@amd.com, qingqing.zhuo@amd.com, roman.li@amd.com,
 solomon.chiu@amd.com, Aurabindo.Pillai@amd.com, Bhawanpreet.Lakha@amd.com,
 agustin.gutierrez@amd.com, pavle.kotarac@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Michel,

First of all, thanks a lot for your review. I want to take this 
opportunity to discuss this topic in more depth and learn more from you 
and others.

+(Nick, Leo, Daniel, Mark, Dave, Sean, Simon)

On 2022-09-15 04:55, Michel Dänzer wrote:
> On 2022-09-14 22:08, Alex Hung wrote:
>> On 2022-09-14 10:55, Michel Dänzer wrote:
>>> On 2022-09-14 18:30, Alex Hung wrote:
>>>> On 2022-09-14 07:40, Michel Dänzer wrote:
>>>>> On 2022-09-14 15:31, Michel Dänzer wrote:
>>>>>> On 2022-09-14 07:10, Wayne Lin wrote:
>>>>>>> From: Alex Hung <alex.hung@amd.com>
>>>>>>>
>>>>>>> [Why & How]
>>>>>>> This fixes kernel errors when IGT disables primary planes during the
>>>>>>> tests kms_universal_plane::functional_test_pipe/pageflip_test_pipe.
>>>>>>
>>>>>> NAK.
>>>>>>
>>>>>> This essentially reverts commit b836a274b797 ("drm/amdgpu/dc: Require primary plane to be enabled whenever the CRTC is") (except that it goes even further and completely removes the requirement for any HW plane to be enabled when the HW cursor is), so it would reintroduce the issues described in that commit log.
>>>>>
>>>>> Actually not exactly the same issues, due to going even further than reverting my fix.
>>>>>
>>>>> Instead, the driver will claim that an atomic commit which enables the CRTC and the cursor plane, while leaving all other KMS planes disabled, succeeds. But the HW cursor will not actually be visible.
>>>>
>>>> I did not observe problems with cursors (GNOME 42.4 - desktop and youtube/mpv video playback: windowed/fullscreen). Are there steps to reproduce cursor problems?
>>>
>>> As described in my last follow-up e-mail: An atomic KMS commit which enables the CRTC and the cursor plane, but disables all other KMS planes for the CRTC. The commit will succeed, but will not result in the HW cursor being actually visible. (I don't know of any specific application or test which exercises this)
>>
>> Did you mean cursor plane depends on primary plane (i.e. no primary plane = no visible HW cursor)?
> 
> Sort of. I understand the HW cursor isn't an actual separate plane in AMD HW. Instead, the HW cursor can be displayed as part of any other HW plane. This means that the HW cursor can only be visible if any other plane is enabled.

The commit that you mentioned (b836a274b797) was created to address some 
issues reported by the user. Please, correct me if I'm wrong, but the 
original issue could be reproduced by following these steps on Gnome 
with Ellesmere:

1. Lock the screen and wait for suspending;
2. Wake up the system a few minutes later;
3. See two cursors, one that can be used and another one that is not 
working.

I tried to reproduce this issue using an Ellesmere board (+this 
patchset), and Daniel has tested it in multiple ASICs; we never repro 
that issue (Gnome and ChromeOS). It is not evident to me why we cannot 
reproduce this problem. Do you have some suggestions? If we find a case 
showing this bug, we can add it as part of our tests.

I feel that the commit b836a274b797 is not directly related to that 
specific bug. I mean, it might make sense to have it, but for other reasons.

> 
>> If there is no primary plane, what scenario would it be required to draw a cursor?
>>
>> If this is a rare case, would it still be a concern?
> 
> Yes. In the KMS API, the cursor plane is like any other plane. A Wayland compositor or other user space may legitimately try to display something (not necessarily a "cursor") using only the cursor plane. The driver must accurately signal that this cannot work. The established way to do so (if a bit indirectly) is to require the primary plane to be enabled whenever the CRTC is.

Is there any real case for this scenario? Is this scenario strong enough 
to say that a driver does not support CRTC enabled without planes?

> 
> 
>>> Also see the commit log of bc92c06525e5 ("drm/amd/display: Allow commits with no planes active").
>>
>> Does it mean dm_crtc_helper_atomic_check does not need to return -EINVAL if there is no active cursor because there are no cursors to be shown anyways, [...]
> 
> This was considered in the review discussion for b836a274b797 ("drm/amdgpu/dc: Require primary plane to be enabled whenever the CRTC is"), see https://patchwork.freedesktop.org/patch/387230/ .
> 
> TL;DR: There were already other KMS drivers requiring the primary plane to be enabled whenever the CRTC is, and there's a special case for that in atomic_remove_fb. 

iirc, this requiring is only available in drm_simple_kms_helper, and 
drivers under the tiny folder are the only ones using it.

> Adding another special case for the cursor plane would make things much more complicated for common DRM code and user space (and possibly even introduce issues which cannot be solved at all).
> 
> 
>>>>>> If IGT tests disable the primary plane while leaving the CRTC enabled, those tests are broken and need to be fixed instead.
>>>>
>>>> There are IGT cursor tests fixed by this:
>>>>
>>>>     igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions
>>>>     igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size
>>>>
>>>> It also reduces amdgpu workaround in IGT's kms_concurrent:
>>>>     https://patchwork.freedesktop.org/patch/499382/?series=107734&rev=1>>>>>
>>>> The change affect multiple IGT tests. Adding amdgpu-specific workarounds to each of the IGT tests is not an ideal solution.
>>>
>>> It's not amdgpu specific, other atomic KMS drivers have the same restriction. IGT tests need to be able to handle this. See e.g. 88e379cef970 ("kms_cursor_legacy: Keep primary plane enabled for XRGB overlay fallback").
>>
>>
>> Commit 88e379cef970 adds the following change to keep primary plane enabled:
>>
>> +               igt_plane_set_fb(primary, prim_fb)
>>
>> but kms_universal_plane fails at testing disabling primary plane, ex.
>>
>> [...]
> 
> User space just cannot rely on being able to disable the primary plane while the CRTC is enabled. Any IGT tests which do so are broken and need to be fixed.
> 
> See also https://patchwork.freedesktop.org/series/80904/ .

Could you resend it?

Again, thanks a lot for your review and comments.
Siqueira

> 
> 

