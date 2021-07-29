Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1C43D9F36
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 10:09:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B396E51B;
	Thu, 29 Jul 2021 08:09:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.180])
 by gabe.freedesktop.org (Postfix) with ESMTP id 814416E51B
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 08:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 9624E20201B;
 Thu, 29 Jul 2021 10:09:05 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id qMf5KNcZpsS5; Thu, 29 Jul 2021 10:09:05 +0200 (CEST)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id 525BC20201A;
 Thu, 29 Jul 2021 10:09:04 +0200 (CEST)
Received: from [::1] by thor with esmtp (Exim 4.94.2)
 (envelope-from <michel@daenzer.net>)
 id 1m916A-00140j-Bn; Thu, 29 Jul 2021 10:08:58 +0200
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Pekka Paalanen <ppaalanen@gmail.com>
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
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [RFC 0/4] dma-fence: Deadline awareness
Message-ID: <fab1c1e6-64cb-6bab-4bc3-e61441174e2f@daenzer.net>
Date: Thu, 29 Jul 2021 10:08:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <74e310fa-e544-889f-2389-5abe06f80eb8@amd.com>
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
 Jack Zhang <Jack.Zhang1@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Roy Sun <Roy.Sun@amd.com>,
 Gustavo Padovan <gustavo@padovan.org>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 Lee Jones <lee.jones@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-07-28 4:30 p.m., Christian König wrote:
> Am 28.07.21 um 15:57 schrieb Pekka Paalanen:
>> On Wed, 28 Jul 2021 15:31:41 +0200
>> Christian König <christian.koenig@amd.com> wrote:
>>
>>> Am 28.07.21 um 15:24 schrieb Michel Dänzer:
>>>> On 2021-07-28 3:13 p.m., Christian König wrote:
>>>>> Am 28.07.21 um 15:08 schrieb Michel Dänzer:
>>>>>> On 2021-07-28 1:36 p.m., Christian König wrote:
>>>>>>> At least AMD hardware is already capable of flipping frames on GPU events like finishing rendering (or uploading etc).
>>>>>>>
>>>>>>> By waiting in userspace on the CPU before send the frame to the hardware you are completely killing of such features.
>>>>>>>
>>>>>>> For composing use cases that makes sense, but certainly not for full screen applications as far as I can see.
>>>>>> Even for fullscreen, the current KMS API only allows queuing a single page flip per CRTC, with no way to cancel or otherwise modify it. Therefore, a Wayland compositor has to set a deadline for the next refresh cycle, and when the deadline passes, it has to select the best buffer available for the fullscreen surface. To make sure the flip will not miss the next refresh cycle, the compositor has to pick an idle buffer. If it picks a non-idle buffer, and the pending rendering does not finish in time for vertical blank, the flip will be delayed by at least one refresh cycle, which results in visible stuttering.
>>>>>>
>>>>>> (Until the deadline passes, the Wayland compositor can't even know if a previously fullscreen surface will still be fullscreen for the next refresh cycle)
>>>>> Well then let's extend the KMS API instead of hacking together workarounds in userspace.
>>>> That's indeed a possible solution for the fullscreen / direct scanout case.
>>>>
>>>> Not for the general compositing case though, since a compositor does not want to composite multiple output frames per display refresh cycle, so it has to make sure the one frame hits the target.
>>> Yeah, that's true as well.
>>>
>>> At least as long as nobody invents a mechanism to do this decision on
>>> the GPU instead.
>> That would mean putting the whole window manager into the GPU.
> 
> Not really. You only need to decide if you want to use the new backing store or the old one based on if the new surface is ready or not.

While something like that might be a possible optimization for (probably common) cases where the new buffer does not come with other state changes which affect the output frame beyond the buffer contents, there will always be cases (at least until a Wayland compositor can fully run on the GPU, as Pekka noted somewhat jokingly :) where this needs to be handled on the CPU.

I'm currently focusing on that general case. Optimizations for special cases may follow later.


-- 
Earthling Michel Dänzer               |               https://redhat.com
Libre software enthusiast             |             Mesa and X developer
