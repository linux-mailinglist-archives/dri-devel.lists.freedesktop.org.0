Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F013DA10C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 12:29:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BDA189D2E;
	Thu, 29 Jul 2021 10:29:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.180])
 by gabe.freedesktop.org (Postfix) with ESMTP id D00E789D2E
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 10:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id E66A520201A;
 Thu, 29 Jul 2021 12:29:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 1L6nuNw0PY7d; Thu, 29 Jul 2021 12:28:38 +0200 (CEST)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id B4F5F20201B;
 Thu, 29 Jul 2021 12:28:37 +0200 (CEST)
Received: from [::1] by thor with esmtp (Exim 4.94.2)
 (envelope-from <michel@daenzer.net>)
 id 1m93HI-001Kjn-Oa; Thu, 29 Jul 2021 12:28:36 +0200
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20210726233854.2453899-1-robdclark@gmail.com>
 <28ca4167-4a65-0ccc-36be-5fb017f6f49d@daenzer.net>
 <CAF6AEGuhQ2=DSDaGGVwBz5O+FoZEjpgoVJOcFecpd--a9yDY1w@mail.gmail.com>
 <99984703-c3ca-6aae-5888-5997d7046112@daenzer.net>
 <CAJs_Fx4O4w5djx3-q5zja51-ko_nQ0X2nEk3qoZB_axpBVSrKA@mail.gmail.com>
 <f6d73ec5-85f9-1b18-f2d2-a5f3b7333efa@gmail.com>
 <c9ee242e-542e-e189-a1ec-c1be34d66c93@daenzer.net>
 <04d44873-d8e6-6ae7-f0f9-17bcb484d697@amd.com>
 <9d5f4415-d470-3bc1-7d52-61ba739706ae@daenzer.net>
 <eedfdc75-72f8-9150-584b-c5e9d16db180@amd.com>
 <20210728165700.38c39cf8@eldfell>
 <74e310fa-e544-889f-2389-5abe06f80eb8@amd.com>
 <20210729112358.237651ff@eldfell>
 <3675d530-c9fc-7ec9-e157-b6abeeec7c2a@amd.com>
 <20210729121542.27d9b1cc@eldfell>
 <15cf73a8-eda4-3559-561a-a05a14f445d0@gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [RFC 0/4] dma-fence: Deadline awareness
Message-ID: <4def9567-f88d-3b7c-5ed2-d1686a25fbb3@daenzer.net>
Date: Thu, 29 Jul 2021 12:28:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <15cf73a8-eda4-3559-561a-a05a14f445d0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-CA
Content-Transfer-Encoding: 8bit
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
Cc: Rob Clark <robdclark@chromium.org>, Matthew Brost <matthew.brost@intel.com>,
 Jack Zhang <Jack.Zhang1@amd.com>, Gustavo Padovan <gustavo@padovan.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Roy Sun <Roy.Sun@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 Lee Jones <lee.jones@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-07-29 12:14 p.m., Christian König wrote:
> Am 29.07.21 um 11:15 schrieb Pekka Paalanen:
>> [SNIP]
>>> But how does it then help to wait on the CPU instead?
>> A compositor does not "wait" literally. It would only check which state
>> set is ready to be used, and uses the most recent set that is ready. Any
>> state sets that are not ready are ignored and reconsidered the next
>> time the compositor updates the screen.
> 
> Mhm, then I'm not understanding what Michel's changes are actually doing.

In a nutshell, my mutter MR holds back all Wayland state changes which were committed together with a new buffer (and dependent later ones) until the dma-buf file descriptors for that buffer have become readable. This is achieved by adding the fds to the main event loop (if they aren't readable already when the buffer is committed), and when they become readable, all corresponding state changes are propagated such that they will be taken into account for drawing the next frame.


>> Depending on which state sets are selected for a screen update, the
>> global window manager state may be updated accordingly, before the
>> drawing commands for the composition can be created.
>>
>>> See what I'm proposing is to either render the next state of the window
>>> or compose from the old state (including all atomic properties).
>> Yes, that's exactly how it would work. It's just that state for a
>> window is not an independent thing, it can affect how unrelated windows
>> are managed.
>>
>> A simplified example would be two windows side by side where the
>> resizing of one causes the other to move. You can't resize the window
>> or move the other until the buffer with the new size is ready. Until
>> then the compositor uses the old state.
>>
>>> E.g. what do you do if you timeout and can't have the new window content
>>> on time? What's the fallback here?
>> As there is no wait, there is no timeout either.
>>
>> If the app happens to be frozen (e.g. some weird bug in fence handling
>> to make it never ready, or maybe it's just bugged itself and never
>> drawing again), then the app is frozen, and all the rest of the desktop
>> continues running normally without a glitch.
> 
> But that is in contradict to what you told me before.
> 
> See when the window should move but fails to draw it's new content what happens?
> 
> Are the other windows which would be affected by the move not drawn as well?

Basically, the compositor draws its output as if the new buffer and all connected Wayland state changes had not been committed yet.


-- 
Earthling Michel Dänzer               |               https://redhat.com
Libre software enthusiast             |             Mesa and X developer
