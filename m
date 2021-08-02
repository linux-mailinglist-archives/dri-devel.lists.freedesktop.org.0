Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5103DD245
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 10:49:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE2F86E3F5;
	Mon,  2 Aug 2021 08:49:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.180])
 by gabe.freedesktop.org (Postfix) with ESMTP id C34856E3F5
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Aug 2021 08:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id BFC7320201B;
 Mon,  2 Aug 2021 10:49:41 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id oxd4bOWG6vd6; Mon,  2 Aug 2021 10:49:40 +0200 (CEST)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id 51B6720201A;
 Mon,  2 Aug 2021 10:49:40 +0200 (CEST)
Received: from [::1] by thor with esmtp (Exim 4.94.2)
 (envelope-from <michel@daenzer.net>)
 id 1mATdh-000T3T-Ic; Mon, 02 Aug 2021 10:49:37 +0200
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Dongwon Kim <dongwon.kim@intel.com>, dri-devel@lists.freedesktop.org,
 Tina Zhang <tina.zhang@intel.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <20210729081659.2255499-1-vivek.kasireddy@intel.com>
 <YQPTo0D5SZfX44dn@phenom.ffwll.local>
 <22e9230f-8d12-9cad-7b89-8a2bc8c71e05@daenzer.net>
 <YQel+/qLNC/ga7Ez@phenom.ffwll.local>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [RFC v1 0/4] drm: Add support for DRM_CAP_DEFERRED_OUT_FENCE
 capability
Message-ID: <9996e4d6-7335-9854-0505-83e114e4fbe6@daenzer.net>
Date: Mon, 2 Aug 2021 10:49:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YQel+/qLNC/ga7Ez@phenom.ffwll.local>
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

On 2021-08-02 9:59 a.m., Daniel Vetter wrote:
> On Fri, Jul 30, 2021 at 02:50:10PM +0200, Michel Dänzer wrote:
>> On 2021-07-30 12:25 p.m., Daniel Vetter wrote:
>>> On Thu, Jul 29, 2021 at 01:16:55AM -0700, Vivek Kasireddy wrote:
>>>> By separating the OUT_FENCE signalling from pageflip completion allows
>>>> a Guest compositor to start a new repaint cycle with a new buffer
>>>> instead of waiting for the old buffer to be free. 
>>>>
>>>> This work is based on the idea/suggestion from Simon and Pekka.
>>>>
>>>> This capability can be a solution for this issue:
>>>> https://gitlab.freedesktop.org/wayland/weston/-/issues/514
>>>>
>>>> Corresponding Weston MR:
>>>> https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/668
>>>
>>> Uh I kinda wanted to discuss this a bit more before we jump into typing
>>> code, but well I guess not that much work yet.
>>>
>>> So maybe I'm not understanding the problem, but I think the fundamental
>>> underlying issue is that with KMS you can have at most 2 buffers
>>> in-flight, due to our queue depth limit of 1 pending flip.
>>>
>>> Unfortunately that means for virtual hw where it takes a few more
>>> steps/vblanks until the framebuffer actually shows up on screen and is
>>> scanned out, we suffer deeply. The usual fix for that is to drop the
>>> latency and increase throughput, and have more buffers in-flight. Which
>>> this patch tries to do.
>>
>> Per
>> https://gitlab.freedesktop.org/wayland/weston/-/issues/514#note_986797 ,
>> IMO the underlying issue is actually that the guest compositor repaint
>> cycle is not aligned with the host compositor one. If they were aligned,
>> the problem would not occur even without allowing multiple page flips in
>> flight, and latency would be lower.
> 
> Yeah my proposal here is under the premise that we do actually need to fix
> this with a deeper queue depth.
> 
>>> Now I think where we go wrong here is that we're trying to hack this up by
>>> defining different semantics for the out-fence and for the drm-event. Imo
>>> that's wrong, they're both meant to show eactly the same thing:
>>> - when is the new frame actually visible to the user (as in, eyeballs in a
>>>   human head, preferrably, not the time when we've handed the buffer off
>>>   to the virtual hw)
>>> - when is the previous buffer no longer being used by the scanout hw
>>>
>>> We do cheat a bit right now in so far that we assume they're both the
>>> same, as in, panel-side latency is currently the compositor's problem to
>>> figure out.
>>>
>>> So for virtual hw I think the timestamp and even completion really need to
>>> happen only when the buffer has been pushed through the entire
>>> virtualization chain, i.e. ideally we get the timestamp from the kms
>>> driver from the host side. Currently that's not done, so this is most
>>> likely quite broken already (virtio relies on the no-vblank auto event
>>> sending, which definitely doesn't wait for anything, or I'm completely
>>> missing something).
>>>
>>> I think instead of hacking up some ill-defined 1.5 queue depth support,
>>> what we should do is support queue depth > 1 properly. So:
>>>
>>> - Change atomic to support queue depth > 1, this needs to be a per-driver
>>>   thing due to a bunch of issues in driver code. Essentially drivers must
>>>   never look at obj->state pointers, and only ever look up state through
>>>   the passed-in drm_atomic_state * update container.
>>>
>>> - Aside: virtio should loose all it's empty hooks, there's no point in
>>>   that.
>>>
>>> - We fix virtio to send out the completion event at the end of this entire
>>>   pipeline, i.e. virtio code needs to take care of sending out the
>>>   crtc_state->event correctly.
>>>
>>> - We probably also want some kind of (maybe per-crtc) recommended queue
>>>   depth property so compositors know how many buffers to keep in flight.
>>>   Not sure about that.
>>
>> I'd say there would definitely need to be some kind of signal for the
>> display server that it should queue multiple flips, since this is
>> normally not desirable for latency. In other words, this wouldn't really
>> be useful on bare metal (in contrast to the ability to replace a pending
>> flip with a newer one).
> 
> Hm I was thinking that the compositor can tune this. If the round-trip
> latency (as measured by events) is too long to get full refresh rate, it
> can add more buffers to the queue. That's kinda why I think the returned
> event really must be accurate wrt actual display time (and old buffer
> release time), so that this computation in the compositor because a pretty
> simple
> 
> num_buffers = (flip_time - submit_time) / frame_time
> 
> With maybe some rounding up and averaging. You can also hit this when your
> 3d engine has an extremely deep pipeline (like some of the tiling
> renders have), where rendering just takes forever, but as long as you keep
> 2 frames in the renderer in-flight you can achieve full refresh rate (at a
> latency cost).

As long as a page flip submitted after vblank N can complete during vblank N+1, full frame rate can be sustained[0]. User space can use as many buffers as needed to keep the rendering pipeline busy.

[0] This is broken by the mis-aligned compositor repaint cycles: The flip from the guest compositor misses the host compositor's cycle, so it takes more than one display refresh cycle to complete.


> So kernel can't really tell you in all cases how many buffers you should
> have.

That's not exactly what I mean. Right now, KMS user space has to wait for a flip to complete before submitting another one, or it gets EBUSY. So if the kernel wants to allow multiple flips to be submitted, it has to somehow tell user space that this is possible, or it'll never happen. And the kernel should never advertise this for bare metal, since it's not needed there (and undesirable).


-- 
Earthling Michel Dänzer               |               https://redhat.com
Libre software enthusiast             |             Mesa and X developer
