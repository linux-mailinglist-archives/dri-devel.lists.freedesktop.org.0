Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BAB19A5E5
	for <lists+dri-devel@lfdr.de>; Wed,  1 Apr 2020 09:04:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EBAD6E8FE;
	Wed,  1 Apr 2020 07:04:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8E1F6E8C4
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Apr 2020 01:58:09 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e83f5230000>; Tue, 31 Mar 2020 18:57:55 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 31 Mar 2020 18:58:09 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 31 Mar 2020 18:58:09 -0700
Received: from [10.20.22.102] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 1 Apr
 2020 01:58:00 +0000
Subject: Re: How to handle disconnection of eDP panels due to dynamic display
 mux switches
To: Daniel Vetter <daniel@ffwll.ch>
References: <956fd624-e1f5-e2a0-90de-9a5f2934547d@nvidia.com>
 <CAKMK7uF8cX9ie5DPCNkCr1CCWqFjXBbsW7+Ode3ioM64spMojw@mail.gmail.com>
From: Daniel Dadap <ddadap@nvidia.com>
Message-ID: <3057b60b-4526-2d52-b551-d4769fe97c7b@nvidia.com>
Date: Tue, 31 Mar 2020 20:59:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uF8cX9ie5DPCNkCr1CCWqFjXBbsW7+Ode3ioM64spMojw@mail.gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1585706276; bh=LnInQHi7QmyZPnYTJ90b/HmlxxeBKXuO/iAhyG3JS84=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=ErLFcE48WFoY7/gSDXt2KTBhI6GRcuB6BpiUiKWzufxOBRhqp+2QQ+LFwve7wj1qu
 DUnKHHiKbRbDKRj2/8ydOioL2o/F49I5TOiYvMLI9r67ikwNl+eB9AQCwwit0NdTCU
 sEqwZn+Cyx9ixZe3LFJ32KxNPMSFvDLDBQ5a0qeJkPHjFDcmNUkxupBlGCKAa/LUDS
 iLNN4/AvZXUXnwEYJchcq2iv0dN8XKWd7ef/Lxkn0LYi/iZqsqiLYMIqA2bgLtmr8c
 ehaFbJEVkHS726yJSHcMoUzGrqJfWzK8TCG5Ao+N6dpe0s/dGihbWKeABiU+x5BvJo
 6Udc5yNfD9/mg==
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/31/20 2:32 AM, Daniel Vetter wrote:
> Since I see no mention of this anywhere in your mail ... have you
> tried looking at drivers/gpu/vga/vga_switcheroo.c? This also supports
> switching of just outputs, not just the old optimus way of switching
> out the entire gpu and having to disable the other one.


We did look into vga-switcheroo while developing our PoC, but found it 
insufficient for supporting the use case we had in mind in its current 
form. Among the limitations we observed were that it didn't seem to be 
possible to switch with output-level granularity, only with gpu-level 
granularity, with the whole switched-away-to GPU being powered down. 
Your description suggests that this is indeed possible, but if that's 
the case, then the mechanism for doing so isn't obvious in what I can 
see of the API from the kernel source code, even in the drm-next tree. 
Do you have pointers to documentation on how the per-output switching is 
supposed to work?

Other limitations of vga-switcheroo included:

* The can_switch() callbacks for all current vga-switcheroo-capable GPU 
drivers don't seem to allow for a switch to occur while there are active 
KMS clients. This has the effect of making it so that non-deferred 
switches can only be initiated under the same circumstances that 
deferred switches wait for.
* It's only possible to address one mux device. Some systems have 
separate muxes for internal and external displays. From what I could see 
in existing vga-switcheroo mux handlers, it seems that multi-muxed 
systems just switch all of the muxes simultaneously, which makes sense 
for the all-or-nothing "power down the GPU not in use" approach, but 
might not be desirable for fine-grained output-level switching.
* On some systems, it's possible to put the panel into a self-refresh 
mode before switching the mux and exit self-refresh mode after 
switching, to hide any glitches that might otherwise appear while 
transitioning. Additional handler callbacks for pre-switch and 
post-switch operations would be useful.

If vga-switcheroo could be updated to address these limitatons, then it 
could make sense to handle the display disconnect/connect notifications 
and display refreshing as part of a vga_switcheroo client driver's 
set_gpu_state() callback (or a finer-grained per-output callback); 
however, it also seems that it should be possible to implement APIs 
within the DRM subsystem to accomplish the desired functionality 
independently of current or future vga-switcheroo design.


> There's some rough corners (like the uapi doesn't exist, it's in
> debugfs), and the locking has an inversion problem (I have ideas), but
> generally what you want exists already.
> -Daniel
>
> On Mon, Mar 30, 2020 at 9:12 AM Daniel Dadap <ddadap@nvidia.com> wrote:
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
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> +41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
