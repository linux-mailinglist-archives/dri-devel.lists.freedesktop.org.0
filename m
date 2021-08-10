Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD0F3E58B2
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 12:58:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1A7F89FF6;
	Tue, 10 Aug 2021 10:58:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.180])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8222989FF6
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 10:58:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 757DC20201C;
 Tue, 10 Aug 2021 12:58:01 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id r9H_7ZftF1Ah; Tue, 10 Aug 2021 12:57:57 +0200 (CEST)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id CB99620201A;
 Tue, 10 Aug 2021 12:57:56 +0200 (CEST)
Received: from [::1] by thor with esmtp (Exim 4.94.2)
 (envelope-from <michel@daenzer.net>)
 id 1mDPSF-001gct-Fy; Tue, 10 Aug 2021 12:57:55 +0200
To: Daniel Vetter <daniel@ffwll.ch>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Pekka Paalanen <ppaalanen@gmail.com>,
 Simon Ser <contact@emersion.fr>, "Zhang, Tina" <tina.zhang@intel.com>,
 "Kim, Dongwon" <dongwon.kim@intel.com>,
 "Singh, Satyeshwar" <satyeshwar.singh@intel.com>
References: <612fd31a51384cb28ac6da9db3e840ca@intel.com>
 <YQepZMFaCNLBNGx9@phenom.ffwll.local>
 <fa53f9db229e481784bfe3a61a195fd3@intel.com>
 <1b96e91f-d65c-a155-8c8c-8a4326733c4e@daenzer.net>
 <CAKMK7uH7gy7x-MrN7EWwwdsZKn-i5XB5Wie_ueRXXdnx5Yhefw@mail.gmail.com>
 <8722db11a6d245259c15ca2262a40d07@intel.com>
 <YQvUsYgKxPM/2KZm@phenom.ffwll.local>
 <47938a95ac0640cbb1b713ff1a48dd8d@intel.com>
 <YRE4jaQsOYNsLb+1@phenom.ffwll.local>
 <dfb19f81e9a04bfcadd1b010dfd67edc@intel.com>
 <YRI5PZiGXjbjlBO2@phenom.ffwll.local>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [RFC v1 0/4] drm: Add support for DRM_CAP_DEFERRED_OUT_FENCE
 capability
Message-ID: <a565666e-818d-b85b-b570-c30b57979d01@daenzer.net>
Date: Tue, 10 Aug 2021 12:57:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YRI5PZiGXjbjlBO2@phenom.ffwll.local>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-08-10 10:30 a.m., Daniel Vetter wrote:
> On Tue, Aug 10, 2021 at 08:21:09AM +0000, Kasireddy, Vivek wrote:
>>> On Fri, Aug 06, 2021 at 07:27:13AM +0000, Kasireddy, Vivek wrote:
>>>>>>>
>>>>>>> Hence my gut feeling reaction that first we need to get these two
>>>>>>> compositors aligned in their timings, which propobably needs
>>>>>>> consistent vblank periods/timestamps across them (plus/minux
>>>>>>> guest/host clocksource fun ofc). Without this any of the next steps
>>>>>>> will simply not work because there's too much jitter by the time the
>>>>>>> guest compositor gets the flip completion events.
>>>>>> [Kasireddy, Vivek] Timings are not a problem and do not significantly
>>>>>> affect the repaint cycles from what I have seen so far.
>>>>>>
>>>>>>>
>>>>>>> Once we have solid events I think we should look into statically
>>>>>>> tuning guest/host compositor deadlines (like you've suggested in a
>>>>>>> bunch of places) to consisently make that deadline and hit 60 fps.
>>>>>>> With that we can then look into tuning this automatically and what to
>>>>>>> do when e.g. switching between copying and zero-copy on the host side
>>>>>>> (which might be needed in some cases) and how to handle all that.
>>>>>> [Kasireddy, Vivek] As I confirm here:
>>> https://gitlab.freedesktop.org/wayland/weston/-
>>>>> /issues/514#note_984065
>>>>>> tweaking the deadlines works (i.e., we get 60 FPS) as we expect. However,
>>>>>> I feel that this zero-copy solution I am trying to create should be independent
>>>>>> of compositors' deadlines, delays or other scheduling parameters.
>>>>>
>>>>> That's not how compositors work nowadays. Your problem is that you don't
>>>>> have the guest/host compositor in sync. zero-copy only changes the timing,
>>>>> so it changes things from "rendering way too many frames" to "rendering
>>>>> way too few frames".
>>>>>
>>>>> We need to fix the timing/sync issue here first, not paper over it with
>>>>> hacks.
>>>> [Kasireddy, Vivek] What I really meant is that the zero-copy solution should be
>>>> independent of the scheduling policies to ensure that it works with all compositors.
>>>>  IIUC, Weston for example uses the vblank/pageflip completion timestamp, the
>>>> configurable repaint-window value, refresh-rate, etc to determine when to start
>>>> its next repaint -- if there is any damage:
>>>> timespec_add_nsec(&output->next_repaint, stamp, refresh_nsec);
>>>> timespec_add_msec(&output->next_repaint, &output->next_repaint, -compositor-
>>>> repaint_msec);
>>>>
>>>> And, in the case of VKMS, since there is no real hardware, the timestamp is always:
>>>> now = ktime_get();
>>>> send_vblank_event(dev, e, seq, now);
>>>
>>> vkms has been fixed since a while to fake high-precision timestamps like
>>> from a real display.
>> [Kasireddy, Vivek] IIUC, that might be one of the reasons why the Guest does not need 
>> to have the same timestamp as that of the Host -- to work as expected.
>>
>>>
>>>> When you say that the Guest/Host compositor need to stay in sync, are you
>>>> suggesting that we need to ensure that the vblank timestamp on the Host
>>>> needs to be shared and be the same on the Guest and a vblank/pageflip
>>>> completion for the Guest needs to be sent at exactly the same time it is sent
>>>> on the Host? If yes, I'd say that we do send the pageflip completion to Guest
>>>> around the same time a vblank is generated on the Host but it does not help
>>>> because the Guest compositor would only have 9 ms to submit a new frame
>>>> and if the Host is running Mutter, the Guest would only have 2 ms.
>>>> (https://gitlab.freedesktop.org/wayland/weston/-/issues/514#note_984341)
>>>
>>> Not at the same time, but the same timestamp. And yes there is some fun
>>> there, which is I think the fundamental issue. Or at least some of the
>>> compositor experts seem to think so, and it makes sense to me.
>> [Kasireddy, Vivek] It is definitely possible that if the timestamp is messed up, then
>> the Guest repaint cycle would be affected. However, I do not believe that is the case
>> here given the debug and instrumentation data we collected and scrutinized. Hopefully,
>> compositor experts could chime in to shed some light on this matter.
>>
>>>
>>>>>
>>>>> Only, and I really mean only, when that shows that it's simply impossible
>>>>> to hit 60fps with zero-copy and the guest/host fully aligned should we
>>>>> look into making the overall pipeline deeper.
>>>> [Kasireddy, Vivek] From all the experiments conducted so far and given the
>>>> discussion associated with https://gitlab.freedesktop.org/wayland/weston/-/issues/514
>>>> I think we have already established that in order for a zero-copy solution to work
>>>> reliably, the Guest compositor needs to start its repaint cycle when the Host
>>>> compositor sends a frame callback event to its clients.
>>>>
>>>>>
>>>>>>> Only when that all shows that we just can't hit 60fps consistently and
>>>>>>> really need 3 buffers in flight should we look at deeper kms queues.
>>>>>>> And then we really need to implement them properly and not with a
>>>>>>> mismatch between drm_event an out-fence signalling. These quick hacks
>>>>>>> are good for experiments, but there's a pile of other things we need
>>>>>>> to do first. At least that's how I understand the problem here right
>>>>>>> now.
>>>>>> [Kasireddy, Vivek] Experiments done so far indicate that we can hit 59 FPS
>>> consistently
>>>>>> -- in a zero-copy way independent of compositors' delays/deadlines -- with this
>>>>>> patch series + the Weston MR I linked in the cover letter. The main reason why this
>>>>>> works is because we relax the assumption that when the Guest compositor gets a
>>>>>> pageflip completion event that it could reuse the old FB it submitted in the previous
>>>>>> atomic flip and instead force it to use a new one. And, we send the pageflip
>>> completion
>>>>>> event to the Guest when the Host compositor sends a frame callback event. Lastly,
>>>>>> we use the (deferred) out_fence as just a mechanism to tell the Guest compositor
>>> when
>>>>>> it can release references on old FBs so that they can be reused again.
>>>>>>
>>>>>> With that being said, the only question is how can we accomplish the above in an
>>>>> upstream
>>>>>> acceptable way without regressing anything particularly on bare-metal. Its not clear
>>> if
>>>>> just
>>>>>> increasing the queue depth would work or not but I think the Guest compositor has to
>>> be
>>>>> told
>>>>>> when it can start its repaint cycle and when it can assume the old FB is no longer in
>>> use.
>>>>>> On bare-metal -- and also with VKMS as of today -- a pageflip completion indicates
>>>>> both.
>>>>>> In other words, Vblank event is the same as Flip done, which makes sense on bare-
>>> metal.
>>>>>> But if we were to have two events at-least for VKMS: vblank to indicate to Guest to
>>> start
>>>>>> repaint and flip_done to indicate to drop references on old FBs, I think this problem
>>> can
>>>>>> be solved even without increasing the queue depth. Can this be acceptable?
>>>>>
>>>>> That's just another flavour of your "increase queue depth without
>>>>> increasing the atomic queue depth" approach. I still think the underlying
>>>>> fundamental issue is a timing confusion, and the fact that adjusting the
>>>>> timings fixes things too kinda proves that. So we need to fix that in a
>>>>> clean way, not by shuffling things around semi-randomly until the specific
>>>>> config we tests works.
>>>> [Kasireddy, Vivek] This issue is not due to a timing or timestamp mismatch. We
>>>> have carefully instrumented both the Host and Guest compositors and measured
>>>> the latencies at each step. The relevant debug data only points to the scheduling
>>>> policy -- of both Host and Guest compositors -- playing a role in Guest rendering
>>>> at 30 FPS.
>>>
>>> Hm but that essentially means that the events your passing around have an
>>> even more ad-hoc implementation specific meaning: Essentially it's the
>>> kick-off for the guest's repaint loop? That sounds even worse for a kms
>>> uapi extension.
>> [Kasireddy, Vivek] The pageflip completion event/vblank event indeed serves as the
>> kick-off for a compositor's (both Guest and Host) repaint loop. AFAICT, Weston 
>> works that way and even if we increase the queue depth to solve this problem, I don't
>> think it'll help because the arrival of this event always indicates to a compositor to
>> start its repaint cycle again and assume that the previous buffers are all free.
> 
> I thought this is how simple compositors work, and weston has since a
> while it's own timer, which is based on the timestamp it gets (at on
> drivers with vblank support), so that it starts the repaint loop a few ms
> before the next vblank. And not immediately when it receives the old page
> flip completion event.

As long as it's a fixed timer, there's still a risk that the guest compositor repaint cycle runs too late for the host one (unless the guest cycle happens to be scheduled significantly earlier than the host one).

Note that current mutter Git main (to become the 41 release this autumn) uses dynamic scheduling of its repaint cycle based on how long the last 16 frames took to draw and present. In theory, this could automatically schedule the guest cycle early enough for the host one.


-- 
Earthling Michel Dänzer               |               https://redhat.com
Libre software enthusiast             |             Mesa and X developer
