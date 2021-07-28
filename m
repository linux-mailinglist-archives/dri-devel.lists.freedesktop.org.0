Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3AE3D8EF4
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 15:24:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C60C6E8FD;
	Wed, 28 Jul 2021 13:24:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.180])
 by gabe.freedesktop.org (Postfix) with ESMTP id A29306E8FD
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 13:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id E520420201B;
 Wed, 28 Jul 2021 15:24:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id I_-bR94y0FtT; Wed, 28 Jul 2021 15:24:26 +0200 (CEST)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id 0B98420201A;
 Wed, 28 Jul 2021 15:24:25 +0200 (CEST)
Received: from [::1] by thor with esmtp (Exim 4.94.2)
 (envelope-from <michel@daenzer.net>)
 id 1m8jXs-000xuj-7t; Wed, 28 Jul 2021 15:24:24 +0200
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Rob Clark <robdclark@chromium.org>
References: <20210726233854.2453899-1-robdclark@gmail.com>
 <28ca4167-4a65-0ccc-36be-5fb017f6f49d@daenzer.net>
 <CAF6AEGuhQ2=DSDaGGVwBz5O+FoZEjpgoVJOcFecpd--a9yDY1w@mail.gmail.com>
 <99984703-c3ca-6aae-5888-5997d7046112@daenzer.net>
 <CAJs_Fx4O4w5djx3-q5zja51-ko_nQ0X2nEk3qoZB_axpBVSrKA@mail.gmail.com>
 <f6d73ec5-85f9-1b18-f2d2-a5f3b7333efa@gmail.com>
 <c9ee242e-542e-e189-a1ec-c1be34d66c93@daenzer.net>
 <04d44873-d8e6-6ae7-f0f9-17bcb484d697@amd.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [RFC 0/4] dma-fence: Deadline awareness
Message-ID: <9d5f4415-d470-3bc1-7d52-61ba739706ae@daenzer.net>
Date: Wed, 28 Jul 2021 15:24:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <04d44873-d8e6-6ae7-f0f9-17bcb484d697@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: de-CH-frami
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
Cc: Matthew Brost <matthew.brost@intel.com>, Jack Zhang <Jack.Zhang1@amd.com>,
 Gustavo Padovan <gustavo@padovan.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Roy Sun <Roy.Sun@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 Lee Jones <lee.jones@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-07-28 3:13 p.m., Christian König wrote:
> Am 28.07.21 um 15:08 schrieb Michel Dänzer:
>> On 2021-07-28 1:36 p.m., Christian König wrote:
>>> Am 27.07.21 um 17:37 schrieb Rob Clark:
>>>> On Tue, Jul 27, 2021 at 8:19 AM Michel Dänzer <michel@daenzer.net> wrote:
>>>>> On 2021-07-27 5:12 p.m., Rob Clark wrote:
>>>>>> On Tue, Jul 27, 2021 at 7:50 AM Michel Dänzer <michel@daenzer.net> wrote:
>>>>>>> On 2021-07-27 1:38 a.m., Rob Clark wrote:
>>>>>>>> From: Rob Clark <robdclark@chromium.org>
>>>>>>>>
>>>>>>>> Based on discussion from a previous series[1] to add a "boost" mechanism
>>>>>>>> when, for example, vblank deadlines are missed.  Instead of a boost
>>>>>>>> callback, this approach adds a way to set a deadline on the fence, by
>>>>>>>> which the waiter would like to see the fence signalled.
>>>>>>>>
>>>>>>>> I've not yet had a chance to re-work the drm/msm part of this, but
>>>>>>>> wanted to send this out as an RFC in case I don't have a chance to
>>>>>>>> finish the drm/msm part this week.
>>>>>>>>
>>>>>>>> Original description:
>>>>>>>>
>>>>>>>> In some cases, like double-buffered rendering, missing vblanks can
>>>>>>>> trick the GPU into running at a lower frequence, when really we
>>>>>>>> want to be running at a higher frequency to not miss the vblanks
>>>>>>>> in the first place.
>>>>>>>>
>>>>>>>> This is partially inspired by a trick i915 does, but implemented
>>>>>>>> via dma-fence for a couple of reasons:
>>>>>>>>
>>>>>>>> 1) To continue to be able to use the atomic helpers
>>>>>>>> 2) To support cases where display and gpu are different drivers
>>>>>>>>
>>>>>>>> [1] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fseries%2F90331%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C269b2df3e1dc4f0b856d08d951c8c768%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637630745091538563%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=eYaSOSS5wOngNAd9wufp5eWCx5GtAwo6GkultJgrjmA%3D&amp;reserved=0
>>>>>>> Unfortunately, none of these approaches will have the full intended effect once Wayland compositors start waiting for client buffers to become idle before using them for an output frame (to prevent output frames from getting delayed by client work). See https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.gnome.org%2FGNOME%2Fmutter%2F-%2Fmerge_requests%2F1880&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C269b2df3e1dc4f0b856d08d951c8c768%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637630745091538563%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=1ZkOzLqbiKSyCixGZ0u7Hd%2Fc1YnUZub%2F%2Fx7RuEclFKg%3D&amp;reserved=0 (shameless plug :) for a proof of concept of this for mutter. The boost will only affect the compositor's own GPU work, not the client work (which means no effect at all for fullscreen apps where the compositor can scan out the client buffers directly).
>>>>>>>
>>>>>> I guess you mean "no effect at all *except* for fullscreen..."?
>>>>> I meant what I wrote: The compositor will wait for the next buffer to become idle, so there's no boost from this mechanism for the client drawing to that buffer. And since the compositor does no drawing of its own in this case, there's no boost from that either.
>>>>>
>>>>>
>>>>>> I'd perhaps recommend that wayland compositors, in cases where only a
>>>>>> single layer is changing, not try to be clever and just push the
>>>>>> update down to the kernel.
>>>>> Even just for the fullscreen direct scanout case, that would require some kind of atomic KMS API extension to allow queuing multiple page flips for the same CRTC.
>>>>>
>>>>> For other cases, this would also require a mechanism to cancel a pending atomic commit, for when another surface update comes in before the compositor's deadline, which affects the previously single updating surface as well.
>>>>>
>>>> Well, in the end, there is more than one compositor out there.. and if
>>>> some wayland compositors are going this route, they can also implement
>>>> the same mechanism in userspace using the sysfs that devfreq exports.
>>>>
>>>> But it sounds simpler to me for the compositor to have a sort of "game
>>>> mode" for fullscreen games.. I'm less worried about UI interactive
>>>> workloads, boosting the GPU freq upon sudden activity after a period
>>>> of inactivity seems to work reasonably well there.
>>> At least AMD hardware is already capable of flipping frames on GPU events like finishing rendering (or uploading etc).
>>>
>>> By waiting in userspace on the CPU before send the frame to the hardware you are completely killing of such features.
>>>
>>> For composing use cases that makes sense, but certainly not for full screen applications as far as I can see.
>> Even for fullscreen, the current KMS API only allows queuing a single page flip per CRTC, with no way to cancel or otherwise modify it. Therefore, a Wayland compositor has to set a deadline for the next refresh cycle, and when the deadline passes, it has to select the best buffer available for the fullscreen surface. To make sure the flip will not miss the next refresh cycle, the compositor has to pick an idle buffer. If it picks a non-idle buffer, and the pending rendering does not finish in time for vertical blank, the flip will be delayed by at least one refresh cycle, which results in visible stuttering.
>>
>> (Until the deadline passes, the Wayland compositor can't even know if a previously fullscreen surface will still be fullscreen for the next refresh cycle)
> 
> Well then let's extend the KMS API instead of hacking together workarounds in userspace.

That's indeed a possible solution for the fullscreen / direct scanout case.

Not for the general compositing case though, since a compositor does not want to composite multiple output frames per display refresh cycle, so it has to make sure the one frame hits the target.


-- 
Earthling Michel Dänzer               |               https://redhat.com
Libre software enthusiast             |             Mesa and X developer
