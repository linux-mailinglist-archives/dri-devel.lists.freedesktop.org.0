Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C65067B1368
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 08:56:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA8C510E5D5;
	Thu, 28 Sep 2023 06:56:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2046.outbound.protection.outlook.com [40.107.93.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A6E810E5D5
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 06:56:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P4vRxGSXkkby2AVgv0BimJDrhfIFdyprC16ZONPeI5sbJ+1p8vjcCnJR95vUcxal4B1T3OTltVJZ6PaDZK2F7kf2n936Jndc87uwOppVfse+p344pxVVXoLEr75AujslsWt/Bk3GZMEWRvTu81+Kxs4KwyQ6vaBqzZbIYIZAUGYQaqOM/neYaGOvCqGf5ESjjmdRYj5m66nKlyjVKH28XcS/wYmusov0gcq5Vx+jZPvxh7fgVeI96o7DB7AxCzWkmD2pHKEeelvrenV/p3hfSdrCrJwobWor3t+kXxtQFikoOWl4fqjt/cs8Dg8EglC3KggLyc3HS9bRcN+VSePorA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IY6nirpNluipxq0v2dCGVrq11nEKwE8VnBxRZZeeM5Y=;
 b=JpTiePcg91PX+LtZ8ttVk1fnOUrSMRi2E74GC+8oKchYAYXCr2lMQxuxy6IaFJRlhTdb1fvrrDkic94DTCep2z0IZ6Zuscq1S868D8IWgDQDAJ5kL6zVKsPq6JZEjwZNphgDHUc+vhvGunvYC5xc3zAOcqPoW/heQsyH8SuI1Yf6ZTQs5dEt5vOCIw6CFNdro09ETw6ZzJpxYEDfQ9FwHkuQq9VvcEbao/tjjWlbWlPnTmU8f4H5/zhM515NF22lv8zwBNiUW8vFm6WDumUdGxXweJ1VTAndCiycQop+O2HpMchWzlEdLnKcR4L6qd0KEq3HuyRwzRGQuM8OfdtYww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IY6nirpNluipxq0v2dCGVrq11nEKwE8VnBxRZZeeM5Y=;
 b=ynqSDCDGwJ4F+qnHjeOfibh/o/LVejVhHdMkFMeQEXMI5wg1cvHg1fVGTf7yiSTBk5APBhCNF6JtEQEmdRTrDqA+FpK5J/0N7WLNmG8xKT+pdjlyt8wrvI6bR9XegzmQa1gfaRRlhrR1Ozidyr+159CIUobVz+BE8nzI6Y40C7A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by CY5PR12MB6273.namprd12.prod.outlook.com (2603:10b6:930:22::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Thu, 28 Sep
 2023 06:56:27 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::ab9:d87b:dd03:4ee8]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::ab9:d87b:dd03:4ee8%5]) with mapi id 15.20.6838.016; Thu, 28 Sep 2023
 06:56:27 +0000
Message-ID: <a1316597-e91b-32f8-78d3-13977438149b@amd.com>
Date: Thu, 28 Sep 2023 08:56:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] drm/atomic: Perform blocking commits on workqueue
Content-Language: en-US
To: Ray Strode <halfline@gmail.com>
References: <20230926170549.2589045-1-halfline@gmail.com>
 <c2ffc21e-bf92-81f6-aa9b-233e3475025f@amd.com>
 <CAA_UwzKiNJe6hjbAo7SK7-OB7sb_ieV_DcQ_8vf6UYw2gppGcA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAA_UwzKiNJe6hjbAo7SK7-OB7sb_ieV_DcQ_8vf6UYw2gppGcA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::6) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3589:EE_|CY5PR12MB6273:EE_
X-MS-Office365-Filtering-Correlation-Id: 8893fa2a-3606-4950-a0f3-08dbbff0089d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L5YLbmUOUZwE9BdXa3sadmeAinZ7yG9rJA0ZeYwAWHzhgCulXKVvGo4UmCIMgrl1zanwGipia2kTerMe1H/GM3TOtjDDq+p05VXYWXmF7O8WvAODYdA9FsNJPPAL+N38Ue/nkIuQWrOcgvnuCAl6akzyqbBSed/Ty+/EIxtawSu6/xafXjyC0rZuJzwdcxkJ2qcDgNB9zuPXXJA+3yV1dq27jg1+QFji6yde7Brg+M731sJiOeUY2ztjMiig2Uah7r1PjPwtaTDHQE/MH+iEj0iUNHUqizJRF6lHzDUWqq0IFCgVKXwruYwTnH9Qy7x4+Gt52dg/DlCC8WLA9usTQ/u1xLP1UGYS6Nd7IP5KfdBBbE9SimiwifNpGcZ9GdGEvDisXj0jbLuvY2s7aR2tMnhui90CcZyRGpWZCGuso6/x8uL6mMNuzrbr05WgHaTBRQUZEMce+YuEOSLjAv1nrrDrKZoC/vgqVtauOExJxI2HXdSIT6GrAo3K7WfujYn7ijS6Fp5G9ALiFbVD3ziaQEh0NhaV+byptO2GYpHtQQfcf/Co+dA+RL4jq8HaqVrGJiU2pygNC1wOVldpTMa/Fp9TgxlOLuSScrce7sKjylG6GmWDoYtrrLzqHtRz6WZi1BzUh+0gi/ixT7TtxZ4Q4A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(376002)(396003)(346002)(366004)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(66574015)(6512007)(6486002)(6506007)(53546011)(6666004)(26005)(2616005)(41300700001)(316002)(66476007)(66556008)(6916009)(66946007)(2906002)(8936002)(8676002)(86362001)(38100700002)(31696002)(31686004)(4326008)(5660300002)(36756003)(478600001)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y29aYnB5cnhHV3pNOVJTSHJFWVdmQS9IbkZES2syYXZWRCtYNm9nSWMvL3k0?=
 =?utf-8?B?RjVlbFVvREh0eDY4bjJRYy9laVRNN2JEaTNUbjhCSTZzeXNCVzdrSHE5QUxt?=
 =?utf-8?B?VHlVYWsycU5oQnZ4WERJNlRNVWZaaG9IOWhZbWhwTWlnVlBsd2RjUnVZOGM3?=
 =?utf-8?B?bHdBbzMwUjlNc1NoUEkwVGZJQmx1ZGU1czFtQXRvOU00WEorY3NId0YxWHc3?=
 =?utf-8?B?WFJnMjRDYWlGaHNQUkQ3R3hHQnowVU9qc2RyK25HWVpHRTB0b3dBMGtlSjZj?=
 =?utf-8?B?ZXZicGcyd1NSSEhvcGViaUZZSzBuY3NxWWtzakgrSGZtOVV2cUV0QnNHMnVz?=
 =?utf-8?B?R0tIa25JZ3o0Rk8yaWYyRGlCelBnSmt6bitZZmRCek1vc2RMek1ZQTRKSVJW?=
 =?utf-8?B?V0MwUy8vK3gwZWFTTjBBWUg4ekJRVUduZFgvQnppREtPZWQ0TXltdlVqMDU3?=
 =?utf-8?B?Q3gxaDZPbVdLMlVaVTlPK1VFcEoxcjZGSXJYMExXckFYV3VmVWpjV2lVTXYz?=
 =?utf-8?B?TFQ3Uk5uN2hiWXFxWUgvcFN6aHpGSjJ1ZW0rcjN5WEhWdUhPcDRHQzlpK0sx?=
 =?utf-8?B?STU0RUR5aTJRSGFEOEZmOUR0Sm9FOWZuZ0tKNEtEMUl1TGgyY0UvSk9nY0Y1?=
 =?utf-8?B?RGlGeVZ6aDM2U2JReHIvckwxNVRmQlFoRTNwOHZRbCtjUTVFb1hjdkFKQm1D?=
 =?utf-8?B?Sm9lUmk2aTBzOERpQzdTTW95RzBsQXFicURtTmxQZXBacnJhRitxajYwdEhK?=
 =?utf-8?B?eTI5ZmFHSDlRZml2KzlMbjh2ZHFMMXNjeGZCNEVZak1pUGw4Rk9WQ2QxQTVj?=
 =?utf-8?B?ZkFiMnh3VTVoYVMyQlB2WUhqM0x5VXlRb3RDbFYvelpsMjNubEFOQVoySDZS?=
 =?utf-8?B?TWVQQlhqNjdZSzRtcGJhWTdlTk1KdkVRSUt2T0FBWXE3OXVWY0RCTDR1R3dP?=
 =?utf-8?B?YjdsUlREOTV4MDI0aXl6eEZBMk9LNXJlalM4WWVPYkxuYW9hRDNtaDRyM3pX?=
 =?utf-8?B?b2Y5Y3F2cHVhVEx1U2hsSU1tZXkxYkR3WnhIaGZtR3RZTmZaektpZU00QW5G?=
 =?utf-8?B?c2N6THgzRlJiMWkvYzY4emsyTm5TY1RoMGhLWWZXaHpBRExPZmNFTENKQXhT?=
 =?utf-8?B?a2Nqd3hPc05PMmljRUt6UWQ0ZWRRTS9FS3ZxSUh6a2xCeHhqMW1mQXdYVUZZ?=
 =?utf-8?B?cWdjT0IwUjhjWnEwMnZVODZlTXJnblp5eXZ4ajBic1pkeWw5SFNsQWR0ZzZY?=
 =?utf-8?B?WExXTVEyRUM1cEtodlVyZzhGWHJsNFQrdXhCeFZoSGxYRkhiWDFMeXVSYTZ4?=
 =?utf-8?B?dFh2NGdnU3lSdi9qRERlbGx1djFDZWdycVJRU1Q0NGFuTVRwdWQvN3Y0UElQ?=
 =?utf-8?B?dVFONlV3QmZEZjJ3N3daaDJLandJOTMyVDF3NzYrQnRuS2phSUxjOUh0d3cy?=
 =?utf-8?B?Vk04dXNkYkNhbTVLeXZLa0Noa1VTK2JmUGh0aG1wb1pCZnJ0ZXJhRnZzUXpD?=
 =?utf-8?B?Y1JJRXZ5eXplYXh4eGl1dk1MSnhJaGlIa0ZCdHhTZ2JtN3Zza0xmWHpXMkV1?=
 =?utf-8?B?Z2ZMdUwvck5MMUdFNzdFMXdVWGZiMG9WL0ZBT0ZsQVhPWExVbldFbk5rY01U?=
 =?utf-8?B?c1ZUVjFMaDVWM09HY1lmMkd1UTBUUmkwOVBBeWUrcXh3ZUtvVGE0VVBMSmpU?=
 =?utf-8?B?cWRORGFtL21wZURyVkVhYkpPTDNRTWZwc1A1SEZyd0xaMVlQUFNpOWR0ZERn?=
 =?utf-8?B?bGdHQXhyay9Ud2RkQ0hZMGNYTUxaSDlIWkpETUtKcHM3UU1UenlTWTJHTEk0?=
 =?utf-8?B?V0J1NDhBNldsS1UyOWdYMHZLWUQ1RndMVVFweEdQNEFGU0M5akJpYTd3UmRv?=
 =?utf-8?B?emdQcWJEUE1QdFA2eVY5dE9DK1liMUkzVlRybC83ajJ0bDcxK3FrTVl3ZzFB?=
 =?utf-8?B?VTZMdTdKYWZ5Qkl6SGZtcjliUU4xUkxMSHZqd3N2YzZvQy91bnptdjdrSnlC?=
 =?utf-8?B?RElkUlJXN2Q0eHdBUHQ0cVV3QzZSQmMxSE53Y1hyK1d5Qyt4OXBNSGFNWENU?=
 =?utf-8?B?Ri95dkUwTDJlUjJtemMvcFhOUjVOdDg4MmZERDFadjhDWHYzanlCdy8xanlE?=
 =?utf-8?Q?Z61MGbfIFJdwhrox7Pvx6cWnC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8893fa2a-3606-4950-a0f3-08dbbff0089d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 06:56:26.5438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Qos8y2D2gAXy3lGK58l8G2ksqdnkBehHC3P+W2azT29C0N7NSRrCedTeSDUyAU5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6273
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
Cc: daniel.vetter@ffwll.ch, Xinhui.Pan@amd.com, dri-devel@lists.freedesktop.org,
 mdaenzer@redhat.com, alexander.deucher@amd.com, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ray,

Am 27.09.23 um 22:25 schrieb Ray Strode:
> Hi,
>
> On Wed, Sep 27, 2023 at 4:05 AM Christian König
> <christian.koenig@amd.com> wrote:
>> I'm not an expert for that stuff, but as far as I know the whole purpose
>> of the blocking functionality is to make sure that the CPU overhead
>> caused by the commit is accounted to the right process.
> I'm not an expert either, but that's clearly wrong.
>
> The point of blocking functionality in drmAtomicCommit is for the
> ioctl to block until the operation is completed, so userspace knows
> that they can commit again after it returns without getting EBUSY, and
> they can be sure, e.g., the mode is set or the displays are disabled
> or whatever.
>
> To say the "whole point" is about CPU overhead accounting sounds
> rather absurd to me. Is that really what you meant?

Yes, absolutely. See the functionality you try to implement already exists.

After making a non blocking commit userspace can still wait on the 
commit to finish by looking at the out fence.

This just happens asynchronously so you can use (for example) 
select()/poll() etc on multiple events.

> You could try to make the argument that one of the points of the
> blocking call is about CPU accounting (instead of the whole point),
> maybe that's what you meant? That seems likely wrong to me too. I mean
> just check the docs:
>
>         RLIMIT_RTTIME (since Linux 2.6.25)
>                This is a limit (in microseconds) on the amount of CPU
> time that a process scheduled under a real‐time scheduling policy may
> consume without making a blocking system call.  For  the  purpose  of
>                this limit, each time a process makes a blocking system
> call, the count of its consumed CPU time is reset to zero.
> drmAtomicCommit() is making a blocking system call so the limit should
> be reset, in my opinion.

Exactly that's the point why I'm rejecting this. As far as I can see 
this opinion does not match what RLIMIT_RTTIME is intended to do.

A blocking system call in the sense of RLIMIT_RTTIME means something 
which results in the process listening for external events, e.g. calling 
select(), epoll() or read() on (for example) a network socket etc...

As far as I can see drmAtomicCommit() is *not* meant with that what 
similar to for example yield() also doesn't reset the RLIMIT_RTTIME counter.

> Furthermore, a lot happens under the covers as part of drmAtomicCommit.
>
> Are you telling me that in all the drivers handling drmAtomicCommit,
> none of the work from those drivers gets deferred outside of process
> context if DRM_MODE_ATOMIC_NONBLOCK isn't set? I find that very hard
> to believe. But it would have to be true, if one of the main points of
> the blocking call is about CPU accounting, right? You can't say the
> point is about CPU accounting if some of the work is handled in a
> helper thread or work queue or whatever.
>
> ╎❯ git grep -E 'INIT_WORK|DECLARE_TASKLET|open_softirq|timer_setup|kthread_run'
> | wc -l
> 182
>
> There seems to be a lot of non-process context execution going on in the tree...
>
>> So what you are suggesting here is to actually break that functionality
>> and that doesn't seem to make sense.
> What's the use case here that could break?

Well you are breaking the RLIMIT_RTTIME functionality.

The purpose of that functionality is to allow debugging and monitoring 
applications to make sure that they keep alive and can react to external 
signals.

 From the RLIMIT_RTTIME documentation: "The intended use of this limit 
is to stop a runaway real-time process from locking up the system."

And when drmAtomicCommit() is triggering this then we either have a 
problem with the application doing something it is not supposed to do 
(like blocking for vblank while it should listen to network traffic) or 
the driver is somehow buggy.

>   Walk me through a
> real-world, sensible example where a program depends on
> drmAtomicCommit() blocking and continuing to eat into process cpu time
> while it blocks. I just want to see where you are coming from. Maybe
> I'm being unimaginative but I just don't see it. I do see actual
> main-stream display servers breaking today because the current
> behavior defies expectations.
>
>> When it's really not desirable to account the CPU overhead to the
>> process initiating it then you probably rather want to use an non
>> blocking commit plus a dma_fence to wait for the work to end from userspace.
> Well, first I don't think that's very convenient. You're talking about
> a per-plane property, so there would need to be a separate file
> descriptor allocated for every plane, right? and user-space would have
> to block on all of them before proceeding? Also, are you sure that
> works in all cases? The problematic case we're facing right now is
> when all planes and all crtcs are getting disabled. I'm just skimming
> over the code here, but I see this:
>
> →       for_each_new_crtc_in_state(state, crtc, crtc_state, i) {•
> ...
> →       →       if (arg->flags & DRM_MODE_PAGE_FLIP_EVENT || fence_ptr) {•
> ...
> →       →       →       e = create_vblank_event(crtc, arg->user_data);•
> ...
> →       →       →       crtc_state->event = e;•
> →       →       }•
> ...
> →       →       if (fence_ptr) {•
> ...
> →       →       →       fence = drm_crtc_create_fence(crtc);•
> ...
> →       →       →       ret = setup_out_fence(&f[(*num_fences)++], fence);•
> ...
> →       →       →       crtc_state->event->base.fence = fence;•
> →       →       }•
>
> Is the code really going to allocate a vblank_event when all the
> crtc's are disabled ? I guess it's possible, but that's
> counterintuitive to me. I really don't know. You're confident a set of
> fences will actually work?

No when you disable everything there is of course no fence allocated.

But then you also should never see anything waiting for to long to 
actually be able to trigger the RLIMIT_RTTIME.

> Regardless, this seems like a roundabout way to address a problem that
> we could just ... fix.

Well to make it clear: This is not a problem but intended behavior!

 From what I know RLIMIT_RTTIME usually works in units of multiple 
seconds. Milliseconds are possible as well, but when an application sets 
a low millisecond timeout and then blocks for a vblank which can easily 
take 30ms to complete that means you have a bug inside your application.

With this commit you are completely papering over that.

Regards,
Christian.

>
> --Ray

