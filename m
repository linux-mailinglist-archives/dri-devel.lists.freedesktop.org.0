Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7622665C14E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 14:56:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1844010E3D9;
	Tue,  3 Jan 2023 13:56:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 281A910E260;
 Tue,  3 Jan 2023 13:56:53 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 82CBB6600359;
 Tue,  3 Jan 2023 13:56:51 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1672754211;
 bh=kdTJCjiczAjPRVV9Q7vA/IaroWz+4ZC1jx5GxLoSlj0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mbD1Hs3UWbDSG6uL0fjYrRCqOu5SWTMk9WvQgQFzknMJ4ynxSV8vPvTHbPV99Sr17
 sjLJ3MfZaXTAp99DKbAsO+GT8Wkv8eAB0nKjiO84M5Ei/y8E4D5ZiRe36TrgKtjZqZ
 CjDvoo5OVcNU+gPjlz9BKaaAIGIKo6cBSdyY8qFbMchA6N7UfD9iEyZYirNfOAha0F
 XqpRnlaN9ec3O3NRUtNqCQArJQmkmoYYo+DgFrKaAQOofHIn9i2arpGUBjP1QUuKYO
 5V+Pasas6nuDESAnsmtdhxdVUHCtjeX0Vx3wJmHBu65J0FK9Q3QG1Y6Rd4p5mynxYX
 jNaXiW1wUunEg==
Date: Tue, 3 Jan 2023 14:56:48 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [RFC PATCH 00/20] Initial Xe driver submission
Message-ID: <20230103145648.24947c06@collabora.com>
In-Reply-To: <87cz7xyxft.fsf@intel.com>
References: <20221222222127.34560-1-matthew.brost@intel.com>
 <8c0a1792-c2bd-375f-fa56-747e34b085f4@suse.de>
 <87cz7xyxft.fsf@intel.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, 02 Jan 2023 13:42:46 +0200
Jani Nikula <jani.nikula@linux.intel.com> wrote:

> On Mon, 02 Jan 2023, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > Hi
> >
> > Am 22.12.22 um 23:21 schrieb Matthew Brost:  
> >> Hello,
> >> 
> >> This is a submission for Xe, a new driver for Intel GPUs that supports both
> >> integrated and discrete platforms starting with Tiger Lake (first platform with
> >> Intel Xe Architecture). The intention of this new driver is to have a fresh base
> >> to work from that is unencumbered by older platforms, whilst also taking the
> >> opportunity to rearchitect our driver to increase sharing across the drm
> >> subsystem, both leveraging and allowing us to contribute more towards other
> >> shared components like TTM and drm/scheduler. The memory model is based on VM
> >> bind which is similar to the i915 implementation. Likewise the execbuf
> >> implementation for Xe is very similar to execbuf3 in the i915 [1].  
> >
> > After Xe has stabilized, will i915 loose the ability to drive this 
> > hardware (and possibly other)?  I'm specfically thinking of the i915 
> > code that requires TTM. Keeping that dependecy within Xe only might 
> > benefit DRM as a whole.  
> 
> There's going to be a number of platforms supported by both drivers, and
> from purely a i915 standpoint dropping any currently supported platforms
> or that dependency from i915 would be a regression.
> 
> >> 
> >> The code is at a stage where it is already functional and has experimental
> >> support for multiple platforms starting from Tiger Lake, with initial support
> >> implemented in Mesa (for Iris and Anv, our OpenGL and Vulkan drivers), as well
> >> as in NEO (for OpenCL and Level0). A Mesa MR has been posted [2] and NEO
> >> implementation will be released publicly early next year. We also have a suite
> >> of IGTs for XE that will appear on the IGT list shortly.
> >> 
> >> It has been built with the assumption of supporting multiple architectures from
> >> the get-go, right now with tests running both on X86 and ARM hosts. And we
> >> intend to continue working on it and improving on it as part of the kernel
> >> community upstream.
> >> 
> >> The new Xe driver leverages a lot from i915 and work on i915 continues as we
> >> ready Xe for production throughout 2023.
> >> 
> >> As for display, the intent is to share the display code with the i915 driver so
> >> that there is maximum reuse there. Currently this is being done by compiling the
> >> display code twice, but alternatives to that are under consideration and we want
> >> to have more discussion on what the best final solution will look like over the
> >> next few months. Right now, work is ongoing in refactoring the display codebase
> >> to remove as much as possible any unnecessary dependencies on i915 specific data
> >> structures there..  
> >
> > Could both drivers reside in a common parent directory and share 
> > something like a DRM Intel helper module with the common code? This 
> > would fit well with the common design of DRM helpers.  
> 
> I think it's too early to tell.
> 
> For one thing, setting that up would be a lot of up front infrastructure
> work. I'm not sure how to even pull that off when Xe is still
> out-of-tree and i915 development plunges on upstream as ever.
> 
> For another, realistically, the overlap between supported platforms is
> going to end at some point, and eventually new platforms are only going
> to be supported with Xe. That's going to open up new possibilities for
> refactoring also the display code. I think it would be premature to lock
> in to a common directory structure or a common helper module at this
> point.
> 
> I'm not saying no to the idea, and we've contemplated it before, but I
> think there are still too many moving parts to decide to go that way.

FWIW, I actually have the same dilemma with the driver for new Mali GPUs
I'm working on. I initially started making it a sub-driver of the
existing panfrost driver (some HW blocks are similar, like the
IOMMU and a few other things, and some SW abstracts can be shared here
and there, like the GEM allocator logic). But I'm now considering
forking the driver (after Alyssa planted the seed :-)), not only
because I want to start from a clean sheet on the the uAPI front
(wouldn't be an issue in your case, because you're talking about
sharing helpers, not the driver frontend), but also because any refactor
to panfrost is a potential source of regression for existing users. So,
I tend to agree with Jani here, trying to share code before things have
settled down is likely to cause pain to both Xe and i915
users+developers.

Best Regards,

Boris
