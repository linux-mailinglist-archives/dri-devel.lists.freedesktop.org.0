Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BF119A5DA
	for <lists+dri-devel@lfdr.de>; Wed,  1 Apr 2020 09:04:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D79A96E8F5;
	Wed,  1 Apr 2020 07:04:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 300 seconds by postgrey-1.36 at gabe;
 Wed, 01 Apr 2020 02:03:26 UTC
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09CAA6E8C5
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Apr 2020 02:03:25 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e83f4e00000>; Tue, 31 Mar 2020 18:56:48 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 31 Mar 2020 18:58:25 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 31 Mar 2020 18:58:25 -0700
Received: from [10.20.22.102] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 1 Apr
 2020 01:58:23 +0000
Subject: Re: How to handle disconnection of eDP panels due to dynamic display
 mux switches
To: Jani Nikula <jani.nikula@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <956fd624-e1f5-e2a0-90de-9a5f2934547d@nvidia.com>
 <874ku5ho77.fsf@intel.com>
From: Daniel Dadap <ddadap@nvidia.com>
Message-ID: <0b49427d-325b-d248-1b9b-421af6ecb8f9@nvidia.com>
Date: Tue, 31 Mar 2020 20:59:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <874ku5ho77.fsf@intel.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1585706209; bh=dTynOFr273xg90anaFJDs11g27wxvNIkCHsqXxQ/ZP4=;
 h=X-PGP-Universal:Subject:To:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=bkVutm4q8aFysjag1j9fnxLRUkpRz+GbPn7kBUrW3d3jeRx43DTlavJBbqcv2ZTEh
 aTOTbzVaMGPX7croCHm7E1XN7KKsrVxVMRlf2+11M8FhG0fLjei3lBOoYoSkG1WhuF
 DceFDutC/h4K4bTXgeV7Xtjrb6REuh1zjK1mpQzA9ey+J9dBP2Z+xHqvHlA2T+MWL/
 5Cn6Ainp5CEcO2sqtVZRMeZu97LhHW5FproYIetwtJ1MT6bEEhD6v2FbGr1iZmcmYh
 SaLGjR8HkUPvRsXxjOTLnaMogPtOkyT0tDYpiGtIXfkQUuOtIBOhj2n5LuT4t9jDGL
 1EuV0iaxKVf6w==
X-Mailman-Approved-At: Wed, 01 Apr 2020 07:03:42 +0000
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/30/20 10:11 AM, Jani Nikula wrote:
> On Fri, 27 Mar 2020, Daniel Dadap <ddadap@nvidia.com> wrote:
>> A number of hybrid GPU notebook computer designs with dual (integrated
>> plus discrete) GPUs are equipped with multiplexers (muxes) that allow
>> display panels to be driven by either the integrated GPU or the discrete
>> GPU. Typically, this is a selection that can be made at boot time as a
>> menu option in the system firmware's setup screen, and the mux selection
>> stays fixed for as long as the system is running and persists across
>> reboots until it is explicitly changed. However, some muxed hybrid GPU
>> systems have dynamically switchable muxes which can be switched while
>> the system is running.
>>
>> NVIDIA is exploring the possibility of taking advantage of dynamically
>> switchable muxes to enhance the experience of using a hybrid GPU system.
>> For example, on a system configured for PRIME render offloading, it may
>> be possible to keep the discrete GPU powered down and use the integrated
>> GPU for rendering and displaying the desktop when no applications are
>> using the discrete GPU, and dynamically switch the panel to be driven
>> directly by the discrete GPU when render-offloading a fullscreen
>> application.
>>
>> We have been conducting some experiments on systems with dynamic muxes,
>> and have found some limitations that would need to be addressed in order
>> to support use cases like the one suggested above:
>>
>> * In at least the i915 DRM-KMS driver, and likely in other DRM-KMS
>> drivers as well, eDP panels are assumed to be always connected. This
>> assumption is broken when the panel is muxed away, which can cause
>> problems. A typical symptom is i915 repeatedly attempting to retrain the
>> link, severely impacting system performance and printing messages like
>> the following every five seconds or so:
>>
>> [drm:intel_dp_start_link_train [i915]] *ERROR* failed to enable link
>> training
>> [drm] Reducing the compressed framebuffer size. This may lead to less
>> power savings than a non-reduced-size. Try to increase stolen memory
>> size if available in BIOS.
>>
>> This symptom might occur if something causes the DRM-KMS driver to probe
>> the display while it's muxed away, for example a modeset or DPMS state
>> change.
>>
>> * When switching the mux back to a GPU that was previously driving a
>> mode, it is necessary to at the very least retrain DP links to restore
>> the previously displayed image. In a proof of concept I have been
>> experimenting with, I am able to accomplish this from userspace by
>> triggering DPMS off and then back on again; however, it would be good to
>> have an in-kernel API to request that an output owned by a DRM-KMS
>> driver be refreshed to resume driving a mode on a disconnected and
>> reconnected display. This API would need to be accessible from outside
>> of the DRM-KMS driver handling the output. One reason it would be good
>> to do this within the kernel, rather than rely on e.g. DPMS operations
>> in the xf86-video-modesetting driver, is that it would be useful for
>> restoring the console if X crashes or is forcefully killed while the mux
>> is switched to a GPU other than the one which drives the console.
>>
>> Basically, we'd like to be able to do the following:
>>
>> 1) Communicate to a DRM-KMS driver that an output is disconnected and
>> can't be used. Ideally, DRI clients such as X should still see the
>> output as being connected, so user applications don't need to keep track
>> of the change.
> I think everything will be much easier if you provide a way for
> userspace to control the muxing using the KMS API, and not lie to the
> userspace about what's going on.
>
> You're not actually saying what component you think should control the
> muxing.
>
> Why should the drivers keep telling the userspace the output is
> connected when it's not? Obviously the userspace should also switch to
> using a different output on a different GPU, right? Or are you planning
> some proprietary behind the scenes hack for discrete?


The desire to lie to userspace is driven mainly by trying to avoid 
interactions from desktop environments / window managers reacting to the 
display going away. Many desktops will do things like try to migrate 
windows in response to a change in the current display configuration, 
and updating all of them to avoid doing so when a display appears to 
disappear from one GPU and reappear on another GPU seems harder than 
allowing userspace to believe that nothing has changed. I wouldn't mind 
if e.g. X drivers were in on the lie, and the lie boundary shifts to 
RandR, but it would be nice to avoid having to deal with the fallout of 
desktop environments handling displays apparently vanishing and 
re-appearing.

The particular use case we're envisioning here is as follows:

* GPU A drives an X protocol screen which hosts a desktop session.
Applications are rendered on GPU A by default. The mux is switched to 
GPU A by default.
* GPU B drives a GPU screen that can be used as a PRIME render offload 
source. Applications rendered on GPU B can run in windows presented by 
GPU A via PRIME render offloading.
* If an application rendered on GPU B and presented on GPU A becomes 
fullscreen, the mux can switch to GPU B and GPU B can present the 
application directly for as long as the application remains in the 
foreground and fullscreen.
* The mux switches back to GPU A and the application presents via GPU A 
and render offloading if it transitions to a window or another window 
occludes it.

I think DRI3 render offload works a bit differently, but hopefully the 
high-level concept is somewhat applicable to that framework as well.

As for what should be controlling the muxing, I suppose that depends on 
what you mean by controlling:

If you mean controlling the mux device itself, that should be a platform 
driver that offers an API to execute the mux switch itself. The existing 
vga-switcheroo framework would be a natural fit, but it would need some 
substantial changes in order to support this sort of use case. I've 
described some of the challenges we've observed so far in my response to 
Daniel Vetter.

If you mean what should drive the policy of when automatic mux switches 
occur, it would have to be something that is aware of what at least one 
of the GPUs is displaying. It could be one of the GPU drivers, or a 
client of the GPU drivers, e.g. X11 or a Wayland compositor.

For the proof of concept experiments we are currently conducting, both 
of these roles are currently performed by components of the NVIDIA 
proprietary GPU stack, but the functionality could be moved to another 
component (e.g. vga-switcheroo, X11, server-side GLVND, ???) if the 
necessary functionality becomes supported in the future.


> BR,
> Jani.
>
>> 2) Request that a mode that was previously driven on a disconnected
>> output be driven again upon reconnection.
>>
>> If APIs to do the above are already available, I wasn't able to find
>> information about them. These could be handled as separate APIs, e.g.,
>> one to set connected/disconnected state and another to restore an
>> output, or as a single API, e.g., signal a disconnect or reconnect,
>> leaving it up to the driver receiving the signal to set the appropriate
>> internal state and restore the reconnected output. Another possibility
>> would be an API to disable and enable individual outputs from outside of
>> the DRM-KMS driver that owns them. I'm curious to hear the thoughts of
>> the DRM subsystem maintainers and contributors on what the best approach
>> to this would be.
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> --
> Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
