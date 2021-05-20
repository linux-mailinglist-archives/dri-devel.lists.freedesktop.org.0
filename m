Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE39538B479
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 18:41:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11E006E415;
	Thu, 20 May 2021 16:41:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2088.outbound.protection.outlook.com [40.107.223.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F04A96F4ED;
 Thu, 20 May 2021 16:40:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j0ewTf+O7GVIU6j7kxOzXvCkBtHf3irQxatf/KEzeZiFHt5XiVPJGbCbBwMO3XLE7uYz2wW0nBfPAptMWf/lkMcEzy3qmRqqofFQJP6VK4l8RBVqNKOeMgBS9onVh5lA+iqMCIh5SIE4sviAJ42lcm3HPg188ZpNmiaKqWFrFEkBYp1w0HLKLhjAf+pozkDUMNocnIUUokbit+bkkq6yxO6QlBfOGqKJKnx8KH5Ely65k73FneYm04GC2wT605+u7mU+1MoXsBNaJEV6qzLQSEmu9iKzOZ2Qcf/iMSakdE1QCK+goejmuFoNk50TbxA7DPRGqGAh4BBBpH30P4wBeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=78nV8qwt55wTYZcR9USkSRjzIS/JOr1J8JlKA6x1U48=;
 b=eB67AEta6+P4oe2lLslEY1idItKRzTr6sy2c6Gm5rIA/6PW7MqJdJiVpZ/WnecI7BbwgEuXU4bDHW3FiAfJtXBQPEauxWWaX0RoayRL3+yBF5GLqktyTiyTDOBVAu6GXXslvcpsZ+Uc5HiGubjxeCm1IjRLRYFY7GEUsW5n1GyVYAXH8j2Hw5HfxkpJLC2dHNcrk/UmiGnUHpFFvJToYJ/s3RBdkIzAGTdyD4H+d8GNoDCHJHDCbJidS9HBE9Hm50i/fJ8rcPedOlPujATJlhit6TRGy7DCInnd9LP0Py019BCVXPKTLm5g9HoyB91hRx6GXJD9eRRiHnCB22tezJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=78nV8qwt55wTYZcR9USkSRjzIS/JOr1J8JlKA6x1U48=;
 b=mjnDHzqCJOFQCeJSke9g+2NxMGSORrhNG3APBOHUb8h4k/pbM7eUgrqNmSiMRGlaONay0sm51hXjaO8/UlQZUBOTw3k8cmtUWzTOeeCCqKyH4rSGLyseOyJ0ZGTKNBWw7+09ZpGGlyvQ6tkptCrzeiBID96tA8QRUPz6dmKHHK8=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4946.namprd12.prod.outlook.com (2603:10b6:208:1c5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Thu, 20 May
 2021 16:40:57 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4150.023; Thu, 20 May 2021
 16:40:57 +0000
Subject: Re: [Linaro-mm-sig] [RFC 1/3] dma-fence: Add boost fence op
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Rob Clark <robdclark@chromium.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, freedreno
 <freedreno@lists.freedesktop.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
References: <20210519183855.1523927-1-robdclark@gmail.com>
 <20210519183855.1523927-2-robdclark@gmail.com>
 <8dcdc8d5-176c-f0ad-0d54-6466e9e68a0a@amd.com>
 <CAF6AEGtg_VnxYrj94AfbAfViK1v8U0ZJyfJjS4taVLMF=YVy+w@mail.gmail.com>
 <d65acf46-4c3b-4903-6222-0b81915d355d@amd.com>
 <CAF6AEGvm1tFwpfyJrX1bTGoHg_wzKKLQvSk2qLHf3XeqvEzDPA@mail.gmail.com>
 <e8f3d71c-7025-deab-4dd7-14f3fa6a8810@gmail.com>
 <YKaPf3VLfjoZJRw7@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <4244879a-e2b8-7994-e3fb-f63c0e115a2c@amd.com>
Date: Thu, 20 May 2021 18:40:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <YKaPf3VLfjoZJRw7@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:b48f:ff97:fb4c:5b1d]
X-ClientProxiedBy: AM0PR06CA0106.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::47) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:b48f:ff97:fb4c:5b1d]
 (2a02:908:1252:fb60:b48f:ff97:fb4c:5b1d) by
 AM0PR06CA0106.eurprd06.prod.outlook.com (2603:10a6:208:fa::47) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Thu, 20 May 2021 16:40:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0461ea9a-e53c-4016-ec4f-08d91bae0abc
X-MS-TrafficTypeDiagnostic: BL0PR12MB4946:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4946D187EB9F8AC587EB2984832A9@BL0PR12MB4946.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: alQHxaebRU9EGGJNA/GmQQcOV5zCPCYgGiYyPTLol1/rM/W/nImGkrndNhwi+h0RKF29QoHlYRX6zMZ1HozDL3f7PiC+5bpZSiICQXy3Ik1QeTCHmgXjRMa3ZzEh6qqBe5rmT06BVDP13xMG26M4ldWuBjMcejI1Fm4WCjMSPHNV+Z0lx8oeFDWJjbkPHL+zj/mu80uJQpZBYEQ/B09bJsi7riWw+tIx4bbIaR7eeb1ElUstmfc2Dgx0rmdiLEm8nNYy7Ai6BMOOeAZIpMKWHR/rsytZGh6bDZJTEDLbHHlU2OHk1Ho4nzDMQKlc2XL2j7N69rXEBuk/xo8BFp3M3SbOyOoRG2OpekST7+DFqyw5BzRPgCkLzGdMjd3UgDe6nw3152PBmQwubxysh7we8H+apkUokhhV+GjLsYDW6VDSaYWxgdpF2nM5irjN/0LensvFM/TP2OkcfngUkyb692M3cmPGO2QET703gm9F1R6BYLplCCB3krXECxYbeRqBcPc3txRUZ2AAztKTTawRye1HEIPcFI7ih9vMcR09Ej/vGCkqRAtF5HGyKhJMPxDqNPKeOysJZk73pmWXkLer4hy9DfWbHkPVzB1rZr8UmIZOykfwG2QR8VCyZtJEZSlKsfdMeMWsUXoDhgSU6BuC5krhI5aezrtnaaEgKdkb4QEcKb50TD0X6sT5K4TET0iUeSd+A+LeAmpR7iwkSiSBjzfFSRuKdoR06E5jaw5Nz06a2fmicDKOPXR/a2MhXZh6LL89pE6VWw0D93Nt7TCqm5AjyCBOAkDr7wnCzJEs7MMJu8b7R0XfTQbrVpONDJIT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(396003)(346002)(136003)(39850400004)(316002)(36756003)(66556008)(186003)(8936002)(31686004)(16526019)(66946007)(8676002)(66476007)(110136005)(31696002)(52116002)(2906002)(86362001)(66574015)(2616005)(83380400001)(6486002)(53546011)(5660300002)(966005)(478600001)(38100700002)(45080400002)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?L3ZDOUowUjgySzVSZkxZdytVNGMvLy9KemNVVXNsWm4zSUNiNkgzZnEzTGlq?=
 =?utf-8?B?WEt5RSsvMW9lUkdlQkU4dmc1N1Bpd2p4UnRIcXU4YWR1UU9hNGtQdXpIek8r?=
 =?utf-8?B?SGZYOGppb0ZTenBNWXgyVFovNTN4NjJTaml2bjNFbEVtbVRhR21SOTJVNXl6?=
 =?utf-8?B?Y0s0bC9zN2RtcnlpUCt3dTRodThPTG8zaTk0Y3NQRTBUTXpLNmpoMzI0OTJ5?=
 =?utf-8?B?WmtDTytsR2FnWlBBbVFEV1JJc3pxdmp2aGZVaFJ2bjNEZUxrTEY0Smt1TGZE?=
 =?utf-8?B?V3M2NXNJNDNkTnUrUTNnU1p0Nmo0ZU53N01qTGQ2RXhlVHpZenljUkpCTzZR?=
 =?utf-8?B?TkI1KytYTGpVOUdyY1NMRjNBanNxdWc0ZlFzUmRoWExrMHZlaTAyRElTLzhU?=
 =?utf-8?B?WXBBaDhZcTNOSnIrV2JmZW5mL2pIZW5FNmN4Vi9kVi9mVmUySGZWM1VydXNR?=
 =?utf-8?B?dFlNRXVYSDlNdWJ2a1BWRGdHREZ4VGU1bmxTYVV5Z044NXNVc01qbnVnaXJK?=
 =?utf-8?B?WDZnZGViSGNhbkZnMWRvL2M1WGxVTERRU0JaMkxURmhWeWdGQ2xzS2dMOXFX?=
 =?utf-8?B?ekI2czNJaXgyS1diVWttNXVrWG40dGx6cEhxY0NoUWtoNU9RNUhBU1IvZjlJ?=
 =?utf-8?B?M21KOURIL1ZHbDNzU1lZL2s1VnJ1bXhCdGk4Mk12MlZOOFlIbUt6aTdyVjV1?=
 =?utf-8?B?TytCQ284TC94NjRXc3lsdTRvMzNuQWxONHJoTUw1Sm1ocjBFNDhEd2FxeXNy?=
 =?utf-8?B?dHdta0RaaVNGWnllbmpJOFpYUmdNK28zSmp5clVBRHZid1Urc2pyOGVjd2la?=
 =?utf-8?B?VHNkMktibDJuaUJ3cklSOHNxVXlaYlhuUzloQTdQa0J0OHRQTlMxMDVTa1dN?=
 =?utf-8?B?WEkwTTZ3VHNkSjVIdlNTQzc1VkttalRRWm93MGQ2M2xoZmh2ZVFYVWREVnlw?=
 =?utf-8?B?OVRZZVR1WVZIdlpMQnNWYW5VQmRwaURjMG5jRFV2eU9sOTJxR1Z3ekdrcU1R?=
 =?utf-8?B?ZGxCQXlYZEpRR04vbmxpOVRBMWRrbmtBQTdvTDcrWGZmV1JuNGlnVEdlS0t4?=
 =?utf-8?B?SXVTU1BLYThSY2NFUVFqeTAzYmd2TDRhMFlyVU1Iak9pUGUvb2xROEE5aGVG?=
 =?utf-8?B?Z1BUWWNGRXM2NFlkQ0k4UFZIUGhXdVBwbC9pazUxNldSaU0zdm04Z0d5TUNm?=
 =?utf-8?B?MGNyMlRzREk4ejZNTFlwU1JNMnhVUFN0MTBZNDBKelhEZ3dvNmRkSjdieS9r?=
 =?utf-8?B?U3JjLytJV2FZT2poeS9NbUxVYWxHSEZnNnVKU3dJUmFBM08yd2tkYXlNKzVv?=
 =?utf-8?B?RXJ2ZjIweURnaUh3UVNFc0JJdHRGaGlxMU1RbEFnaHZXMENrNC90alpPajRl?=
 =?utf-8?B?RzVYZ2pTNnZDQlNaUDZpY2pobHRiSUNncTZsZmdGUW5zMHhTZFVHaytsSWY0?=
 =?utf-8?B?NlRmSUFhYXdhbCt6RXhLbzNZbWxrK1RrV3JteXNCKy81YURmd2ZKem9vK290?=
 =?utf-8?B?akp1cFkvdGw0bzV4VHpWUW1udklXYlBIRVV0S3FFZmNycTBhZE5SL2dhY0pL?=
 =?utf-8?B?OXl5NTVSUnNIT2tiWHVvZVdBY2xWZFV5d0NoZnlzNUIvdzhqZU5uaWhxTkli?=
 =?utf-8?B?alpjOUI0WnZzeXR3dFRtMEpkWFpxV0VWbHhVaXlxZlFwY3BJN1ZuVUlwemtF?=
 =?utf-8?B?aTBpRkM3YUNkc25sYTRpbXpMeVo5VVVyWVVIU0FhQXNXYmF5MzhUd2d3aWY2?=
 =?utf-8?B?S0ozcGpCY1dYSlhGdmpJeGVYa2Z0aUJnUmUvaG11akYxc3NUNGdVdG1jbXkz?=
 =?utf-8?B?Mml0ZVY4RDljdGUwc004czd6N3NIYzVYc1kxb0h5UmxGNjR5R3JpVHBSMlYr?=
 =?utf-8?Q?k+S7UTM0V84eQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0461ea9a-e53c-4016-ec4f-08d91bae0abc
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 16:40:57.0057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L1VbLD3y1QH6W1gM02EyA58RC/aAAbeltTWPKTlcIAfL6SAUu0Wq3Xe4bY81kSj+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4946
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

Am 20.05.21 um 18:34 schrieb Daniel Vetter:
> On Thu, May 20, 2021 at 06:01:39PM +0200, Christian König wrote:
>> Am 20.05.21 um 16:54 schrieb Rob Clark:
>>> On Thu, May 20, 2021 at 7:11 AM Christian König
>>> <christian.koenig@amd.com> wrote:
>>>>
>>>> Am 20.05.21 um 16:07 schrieb Rob Clark:
>>>>> On Wed, May 19, 2021 at 11:47 PM Christian König
>>>>> <christian.koenig@amd.com> wrote:
>>>>>> Uff, that looks very hardware specific to me.
>>>>> Howso?  I'm not sure I agree.. and even if it was not useful for some
>>>>> hw, it should be useful for enough drivers (and harm no drivers), so I
>>>>> still think it is a good idea
>>>>>
>>>>> The fallback plan is to go the i915 route and stop using atomic
>>>>> helpers and do the same thing inside the driver, but that doesn't help
>>>>> any of the cases where you have a separate kms and gpu driver.
>>>> Yeah, that's certainly not something we want.
>>>>
>>>>>> As far as I can see you can also implement completely inside the backend
>>>>>> by starting a timer on enable_signaling, don't you?
>>>>> Not really.. I mean, the fact that something waited on a fence could
>>>>> be a useful input signal to gpu freq governor, but it is entirely
>>>>> insufficient..
>>>>>
>>>>> If the cpu is spending a lot of time waiting on a fence, cpufreq will
>>>>> clock down so you spend less time waiting.  And no problem has been
>>>>> solved.  You absolutely need the concept of a missed deadline, and a
>>>>> timer doesn't give you that.
>>>> Ok then I probably don't understand the use case here.
>>>>
>>>> What exactly do you try to solve?
>>> Basically situations where you are ping-ponging between GPU and CPU..
>>> for example if you are double buffering instead of triple buffering,
>>> and doing vblank sync'd pageflips.  The GPU, without any extra signal,
>>> could get stuck at 30fps and a low gpu freq, because it ends up idle
>>> while waiting for an extra vblank cycle for the next back-buffer to
>>> become available.  Whereas if it boosted up to a higher freq and
>>> stopped missing a vblank deadline, it would be less idle due to
>>> getting the next back-buffer sooner (due to not missing a vblank
>>> deadline).
>> Ok the is the why, but what about the how?
>>
>> How does it help to have this boost callback and not just start a time on
>> enable signaling and stop it when the signal arrives?
> Because the render side (or drm/scheduler, if msm would use that) has no
> idea for which vblank a rendering actually is for.

AH! So we are basically telling the fence backend that we have just 
missed an event we waited for.

So what we want to know is how long the frontend wanted to wait instead 
of how long the backend took for rendering.

> So boosting right when you've missed your frame (not what Rob implements
> currently, but fixable) is the right semantics.
>
> The other issue is that for cpu waits, we want to differentiate from fence
> waits that userspace does intentially (e.g. wait ioctl) and waits that
> random other things are doing within the kernel to keep track of progress.
>
> For the former we know that userspace is stuck waiting for the gpu, and we
> probably want to boost. For the latter we most definitely do _not_ want to
> boost.
>
> Otoh I do agree with you that the current api is a bit awkward, so perhaps
> we do need a dma_fence_userspace_wait wrapper which boosts automatically
> after a bit. And similarly perhaps a drm_vblank_dma_fence_wait, where you
> give it a vblank target, and if the fence isn't signalled by then, we kick
> it real hard.

Yeah, something like an use case driven API would be nice to have.

For this particular case I suggest that we somehow extend the enable 
signaling callback.

> But otherwise yes this is absolutely a thing that matters a ton. If you
> look at Matt Brost's scheduler rfc, there's also a line item in there
> about adding this kind of boosting to drm/scheduler.

BTW: I still can't see this in my inbox.

Do you have a link?

Christian.

> -Daniel
>
>
>> Regards,
>> Christian.
>>
>>> BR,
>>> -R
>>>
>>>> Thanks,
>>>> Christian.
>>>>
>>>>> BR,
>>>>> -R
>>>>>
>>>>>> Christian.
>>>>>>
>>>>>> Am 19.05.21 um 20:38 schrieb Rob Clark:
>>>>>>> From: Rob Clark <robdclark@chromium.org>
>>>>>>>
>>>>>>> Add a way to hint to the fence signaler that a fence waiter has missed a
>>>>>>> deadline waiting on the fence.
>>>>>>>
>>>>>>> In some cases, missing a vblank can result in lower gpu utilization,
>>>>>>> when really we want to go in the opposite direction and boost gpu freq.
>>>>>>> The boost callback gives some feedback to the fence signaler that we
>>>>>>> are missing deadlines, so it can take this into account in it's freq/
>>>>>>> utilization calculations.
>>>>>>>
>>>>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>>>>>> ---
>>>>>>>      include/linux/dma-fence.h | 26 ++++++++++++++++++++++++++
>>>>>>>      1 file changed, 26 insertions(+)
>>>>>>>
>>>>>>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>>>>>>> index 9f12efaaa93a..172702521acc 100644
>>>>>>> --- a/include/linux/dma-fence.h
>>>>>>> +++ b/include/linux/dma-fence.h
>>>>>>> @@ -231,6 +231,17 @@ struct dma_fence_ops {
>>>>>>>          signed long (*wait)(struct dma_fence *fence,
>>>>>>>                              bool intr, signed long timeout);
>>>>>>>
>>>>>>> +     /**
>>>>>>> +      * @boost:
>>>>>>> +      *
>>>>>>> +      * Optional callback, to indicate that a fence waiter missed a deadline.
>>>>>>> +      * This can serve as a signal that (if possible) whatever signals the
>>>>>>> +      * fence should boost it's clocks.
>>>>>>> +      *
>>>>>>> +      * This can be called in any context that can call dma_fence_wait().
>>>>>>> +      */
>>>>>>> +     void (*boost)(struct dma_fence *fence);
>>>>>>> +
>>>>>>>          /**
>>>>>>>           * @release:
>>>>>>>           *
>>>>>>> @@ -586,6 +597,21 @@ static inline signed long dma_fence_wait(struct dma_fence *fence, bool intr)
>>>>>>>          return ret < 0 ? ret : 0;
>>>>>>>      }
>>>>>>>
>>>>>>> +/**
>>>>>>> + * dma_fence_boost - hint from waiter that it missed a deadline
>>>>>>> + *
>>>>>>> + * @fence: the fence that caused the missed deadline
>>>>>>> + *
>>>>>>> + * This function gives a hint from a fence waiter that a deadline was
>>>>>>> + * missed, so that the fence signaler can factor this in to device
>>>>>>> + * power state decisions
>>>>>>> + */
>>>>>>> +static inline void dma_fence_boost(struct dma_fence *fence)
>>>>>>> +{
>>>>>>> +     if (fence->ops->boost)
>>>>>>> +             fence->ops->boost(fence);
>>>>>>> +}
>>>>>>> +
>>>>>>>      struct dma_fence *dma_fence_get_stub(void);
>>>>>>>      u64 dma_fence_context_alloc(unsigned num);
>>>>>>>
>>> _______________________________________________
>>> Linaro-mm-sig mailing list
>>> Linaro-mm-sig@lists.linaro.org
>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.linaro.org%2Fmailman%2Flistinfo%2Flinaro-mm-sig&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C69c1843a93ec4888abd308d91bad18bd%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637571252548030247%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=EJBA9rVl5xTRmdEPzyCyGX7xyZMKAGVhTmoEnsPfOxw%3D&amp;reserved=0

