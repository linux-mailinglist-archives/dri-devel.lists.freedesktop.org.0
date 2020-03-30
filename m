Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36728197F49
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 17:12:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A87B76E418;
	Mon, 30 Mar 2020 15:12:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 277C06E418
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 15:12:02 +0000 (UTC)
IronPort-SDR: qM+9dFr5JmTtvnSFqIlV+eSoVfjd3x4u17S5M9jtmn3b60WiOUPgQXbOPWUuHZFnkl8DX0Md2s
 UKuX6EBNFkWw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2020 08:12:01 -0700
IronPort-SDR: duvVEIU0KGo6R1ywYmSf+F+JNL7mpHaa6GZAW85nbQFzLqcvxkT/UtjFUiKyVVocC1zFDJ855s
 2YIcOcsGhENA==
X-IronPort-AV: E=Sophos;i="5.72,324,1580803200"; d="scan'208";a="421957907"
Received: from unknown (HELO localhost) ([10.252.36.25])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2020 08:11:59 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniel Dadap <ddadap@nvidia.com>, dri-devel@lists.freedesktop.org
Subject: Re: How to handle disconnection of eDP panels due to dynamic display
 mux switches
In-Reply-To: <956fd624-e1f5-e2a0-90de-9a5f2934547d@nvidia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <956fd624-e1f5-e2a0-90de-9a5f2934547d@nvidia.com>
Date: Mon, 30 Mar 2020 18:11:56 +0300
Message-ID: <874ku5ho77.fsf@intel.com>
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

On Fri, 27 Mar 2020, Daniel Dadap <ddadap@nvidia.com> wrote:
> A number of hybrid GPU notebook computer designs with dual (integrated 
> plus discrete) GPUs are equipped with multiplexers (muxes) that allow 
> display panels to be driven by either the integrated GPU or the discrete 
> GPU. Typically, this is a selection that can be made at boot time as a 
> menu option in the system firmware's setup screen, and the mux selection 
> stays fixed for as long as the system is running and persists across 
> reboots until it is explicitly changed. However, some muxed hybrid GPU 
> systems have dynamically switchable muxes which can be switched while 
> the system is running.
>
> NVIDIA is exploring the possibility of taking advantage of dynamically 
> switchable muxes to enhance the experience of using a hybrid GPU system. 
> For example, on a system configured for PRIME render offloading, it may 
> be possible to keep the discrete GPU powered down and use the integrated 
> GPU for rendering and displaying the desktop when no applications are 
> using the discrete GPU, and dynamically switch the panel to be driven 
> directly by the discrete GPU when render-offloading a fullscreen 
> application.
>
> We have been conducting some experiments on systems with dynamic muxes, 
> and have found some limitations that would need to be addressed in order 
> to support use cases like the one suggested above:
>
> * In at least the i915 DRM-KMS driver, and likely in other DRM-KMS 
> drivers as well, eDP panels are assumed to be always connected. This 
> assumption is broken when the panel is muxed away, which can cause 
> problems. A typical symptom is i915 repeatedly attempting to retrain the 
> link, severely impacting system performance and printing messages like 
> the following every five seconds or so:
>
> [drm:intel_dp_start_link_train [i915]] *ERROR* failed to enable link 
> training
> [drm] Reducing the compressed framebuffer size. This may lead to less 
> power savings than a non-reduced-size. Try to increase stolen memory 
> size if available in BIOS.
>
> This symptom might occur if something causes the DRM-KMS driver to probe 
> the display while it's muxed away, for example a modeset or DPMS state 
> change.
>
> * When switching the mux back to a GPU that was previously driving a 
> mode, it is necessary to at the very least retrain DP links to restore 
> the previously displayed image. In a proof of concept I have been 
> experimenting with, I am able to accomplish this from userspace by 
> triggering DPMS off and then back on again; however, it would be good to 
> have an in-kernel API to request that an output owned by a DRM-KMS 
> driver be refreshed to resume driving a mode on a disconnected and 
> reconnected display. This API would need to be accessible from outside 
> of the DRM-KMS driver handling the output. One reason it would be good 
> to do this within the kernel, rather than rely on e.g. DPMS operations 
> in the xf86-video-modesetting driver, is that it would be useful for 
> restoring the console if X crashes or is forcefully killed while the mux 
> is switched to a GPU other than the one which drives the console.
>
> Basically, we'd like to be able to do the following:
>
> 1) Communicate to a DRM-KMS driver that an output is disconnected and 
> can't be used. Ideally, DRI clients such as X should still see the 
> output as being connected, so user applications don't need to keep track 
> of the change.

I think everything will be much easier if you provide a way for
userspace to control the muxing using the KMS API, and not lie to the
userspace about what's going on.

You're not actually saying what component you think should control the
muxing.

Why should the drivers keep telling the userspace the output is
connected when it's not? Obviously the userspace should also switch to
using a different output on a different GPU, right? Or are you planning
some proprietary behind the scenes hack for discrete?

BR,
Jani.

> 2) Request that a mode that was previously driven on a disconnected 
> output be driven again upon reconnection.
>
> If APIs to do the above are already available, I wasn't able to find 
> information about them. These could be handled as separate APIs, e.g., 
> one to set connected/disconnected state and another to restore an 
> output, or as a single API, e.g., signal a disconnect or reconnect, 
> leaving it up to the driver receiving the signal to set the appropriate 
> internal state and restore the reconnected output. Another possibility 
> would be an API to disable and enable individual outputs from outside of 
> the DRM-KMS driver that owns them. I'm curious to hear the thoughts of 
> the DRM subsystem maintainers and contributors on what the best approach 
> to this would be.
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
