Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 339F819A731
	for <lists+dri-devel@lfdr.de>; Wed,  1 Apr 2020 10:24:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D42D56E07B;
	Wed,  1 Apr 2020 08:24:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4986E6E07B
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Apr 2020 08:24:32 +0000 (UTC)
IronPort-SDR: 6kvUmRE2NG4TxJZRh9NVbSg8L3+lwpKjj5lkMT/x5zu88k0oqIq+K6oUCOuVXY9w0S/m6mAxZX
 nwTzrZxQHyVQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2020 01:24:31 -0700
IronPort-SDR: XajtLvmlnZf2kTFpNPjqE8xdJButFPkAmtRAbO1+hDNmf+hKuWiQPh6dS3GDE977iE07Y26eZN
 g9Z9ylX2WO8g==
X-IronPort-AV: E=Sophos;i="5.72,331,1580803200"; d="scan'208";a="422626349"
Received: from unknown (HELO localhost) ([10.252.38.43])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2020 01:24:29 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniel Dadap <ddadap@nvidia.com>, dri-devel@lists.freedesktop.org
Subject: Re: How to handle disconnection of eDP panels due to dynamic display
 mux switches
In-Reply-To: <0b49427d-325b-d248-1b9b-421af6ecb8f9@nvidia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <956fd624-e1f5-e2a0-90de-9a5f2934547d@nvidia.com>
 <874ku5ho77.fsf@intel.com> <0b49427d-325b-d248-1b9b-421af6ecb8f9@nvidia.com>
Date: Wed, 01 Apr 2020 11:24:26 +0300
Message-ID: <87ftdnfwat.fsf@intel.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 31 Mar 2020, Daniel Dadap <ddadap@nvidia.com> wrote:
> On 3/30/20 10:11 AM, Jani Nikula wrote:
>> On Fri, 27 Mar 2020, Daniel Dadap <ddadap@nvidia.com> wrote:
>>> A number of hybrid GPU notebook computer designs with dual (integrated
>>> plus discrete) GPUs are equipped with multiplexers (muxes) that allow
>>> display panels to be driven by either the integrated GPU or the discrete
>>> GPU. Typically, this is a selection that can be made at boot time as a
>>> menu option in the system firmware's setup screen, and the mux selection
>>> stays fixed for as long as the system is running and persists across
>>> reboots until it is explicitly changed. However, some muxed hybrid GPU
>>> systems have dynamically switchable muxes which can be switched while
>>> the system is running.
>>>
>>> NVIDIA is exploring the possibility of taking advantage of dynamically
>>> switchable muxes to enhance the experience of using a hybrid GPU system.
>>> For example, on a system configured for PRIME render offloading, it may
>>> be possible to keep the discrete GPU powered down and use the integrated
>>> GPU for rendering and displaying the desktop when no applications are
>>> using the discrete GPU, and dynamically switch the panel to be driven
>>> directly by the discrete GPU when render-offloading a fullscreen
>>> application.
>>>
>>> We have been conducting some experiments on systems with dynamic muxes,
>>> and have found some limitations that would need to be addressed in order
>>> to support use cases like the one suggested above:
>>>
>>> * In at least the i915 DRM-KMS driver, and likely in other DRM-KMS
>>> drivers as well, eDP panels are assumed to be always connected. This
>>> assumption is broken when the panel is muxed away, which can cause
>>> problems. A typical symptom is i915 repeatedly attempting to retrain the
>>> link, severely impacting system performance and printing messages like
>>> the following every five seconds or so:
>>>
>>> [drm:intel_dp_start_link_train [i915]] *ERROR* failed to enable link
>>> training
>>> [drm] Reducing the compressed framebuffer size. This may lead to less
>>> power savings than a non-reduced-size. Try to increase stolen memory
>>> size if available in BIOS.
>>>
>>> This symptom might occur if something causes the DRM-KMS driver to probe
>>> the display while it's muxed away, for example a modeset or DPMS state
>>> change.
>>>
>>> * When switching the mux back to a GPU that was previously driving a
>>> mode, it is necessary to at the very least retrain DP links to restore
>>> the previously displayed image. In a proof of concept I have been
>>> experimenting with, I am able to accomplish this from userspace by
>>> triggering DPMS off and then back on again; however, it would be good to
>>> have an in-kernel API to request that an output owned by a DRM-KMS
>>> driver be refreshed to resume driving a mode on a disconnected and
>>> reconnected display. This API would need to be accessible from outside
>>> of the DRM-KMS driver handling the output. One reason it would be good
>>> to do this within the kernel, rather than rely on e.g. DPMS operations
>>> in the xf86-video-modesetting driver, is that it would be useful for
>>> restoring the console if X crashes or is forcefully killed while the mux
>>> is switched to a GPU other than the one which drives the console.
>>>
>>> Basically, we'd like to be able to do the following:
>>>
>>> 1) Communicate to a DRM-KMS driver that an output is disconnected and
>>> can't be used. Ideally, DRI clients such as X should still see the
>>> output as being connected, so user applications don't need to keep track
>>> of the change.
>> I think everything will be much easier if you provide a way for
>> userspace to control the muxing using the KMS API, and not lie to the
>> userspace about what's going on.
>>
>> You're not actually saying what component you think should control the
>> muxing.
>>
>> Why should the drivers keep telling the userspace the output is
>> connected when it's not? Obviously the userspace should also switch to
>> using a different output on a different GPU, right? Or are you planning
>> some proprietary behind the scenes hack for discrete?
>
>
> The desire to lie to userspace is driven mainly by trying to avoid 
> interactions from desktop environments / window managers reacting to the 
> display going away. Many desktops will do things like try to migrate 
> windows in response to a change in the current display configuration, 
> and updating all of them to avoid doing so when a display appears to 
> disappear from one GPU and reappear on another GPU seems harder than 
> allowing userspace to believe that nothing has changed. I wouldn't mind 
> if e.g. X drivers were in on the lie, and the lie boundary shifts to 
> RandR, but it would be nice to avoid having to deal with the fallout of 
> desktop environments handling displays apparently vanishing and 
> re-appearing.

If the change from one GPU to another was driven and initiated by
userspace, it would not be responding to changes in display
configuration to begin with.

I think lying to the userspace in this case is a hack to enable a very
specific use case. Of course it's going to seem easier if you're only
looking at enabling that narrowly defined feature. But usually the hacks
end up being restrictions that make future work harder.

I also think you're downplaying the complexity of gracefully pretending
a display is there when it's not. And realistically, a lot of that
complexity is going to end up being forced on i915.

And then there are plenty of additional details, for example who
controls panel power sequencing, how does brightness control work, is
PWM pin muxed or not, and what if you have DPCD brightness control
instead of PWM?

> The particular use case we're envisioning here is as follows:
>
> * GPU A drives an X protocol screen which hosts a desktop session.
> Applications are rendered on GPU A by default. The mux is switched to 
> GPU A by default.
> * GPU B drives a GPU screen that can be used as a PRIME render offload 
> source. Applications rendered on GPU B can run in windows presented by 
> GPU A via PRIME render offloading.
> * If an application rendered on GPU B and presented on GPU A becomes 
> fullscreen, the mux can switch to GPU B and GPU B can present the 
> application directly for as long as the application remains in the 
> foreground and fullscreen.
> * The mux switches back to GPU A and the application presents via GPU A 
> and render offloading if it transitions to a window or another window 
> occludes it.
>
> I think DRI3 render offload works a bit differently, but hopefully the 
> high-level concept is somewhat applicable to that framework as well.
>
> As for what should be controlling the muxing, I suppose that depends on 
> what you mean by controlling:
>
> If you mean controlling the mux device itself, that should be a platform 
> driver that offers an API to execute the mux switch itself. The existing 
> vga-switcheroo framework would be a natural fit, but it would need some 
> substantial changes in order to support this sort of use case. I've 
> described some of the challenges we've observed so far in my response to 
> Daniel Vetter.
>
> If you mean what should drive the policy of when automatic mux switches 
> occur, it would have to be something that is aware of what at least one 
> of the GPUs is displaying. It could be one of the GPU drivers, or a 
> client of the GPU drivers, e.g. X11 or a Wayland compositor.

IMO the policy should obviously be in the userspace, and the kernel
would only provide the mechanism.

> For the proof of concept experiments we are currently conducting, both 
> of these roles are currently performed by components of the NVIDIA 
> proprietary GPU stack, but the functionality could be moved to another 
> component (e.g. vga-switcheroo, X11, server-side GLVND, ???) if the 
> necessary functionality becomes supported in the future.

Now, this brings us to the so far unspoken issue. It is highly unlikely
that we'd start making changes in i915 to support a feature in a
proprietary stack. I really don't think this is the kind of feature that
can be done with open design only, it's going to have to be open
source. It's basically handing over live peripheral hardware from one
driver to another.

We can keep talking, of course, and I appreciate this discussion. But
please keep the above in mind when you come up with ideas that impose
complexity on i915 with no benefit to i915 or open source users.


BR,
Jani.

>
>
>> BR,
>> Jani.
>>
>>> 2) Request that a mode that was previously driven on a disconnected
>>> output be driven again upon reconnection.
>>>
>>> If APIs to do the above are already available, I wasn't able to find
>>> information about them. These could be handled as separate APIs, e.g.,
>>> one to set connected/disconnected state and another to restore an
>>> output, or as a single API, e.g., signal a disconnect or reconnect,
>>> leaving it up to the driver receiving the signal to set the appropriate
>>> internal state and restore the reconnected output. Another possibility
>>> would be an API to disable and enable individual outputs from outside of
>>> the DRM-KMS driver that owns them. I'm curious to hear the thoughts of
>>> the DRM subsystem maintainers and contributors on what the best approach
>>> to this would be.
>>>
>>> _______________________________________________
>>> dri-devel mailing list
>>> dri-devel@lists.freedesktop.org
>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>> --
>> Jani Nikula, Intel Open Source Graphics Center

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
