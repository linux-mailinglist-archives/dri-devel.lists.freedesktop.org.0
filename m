Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AFCA3D35C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 09:39:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F7889C5E;
	Thu, 20 Feb 2025 08:39:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ur312CK6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 467 seconds by postgrey-1.36 at gabe;
 Thu, 20 Feb 2025 08:39:32 UTC
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD4E89C5E;
 Thu, 20 Feb 2025 08:39:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id F250261319;
 Thu, 20 Feb 2025 08:31:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA79CC4CED1;
 Thu, 20 Feb 2025 08:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1740040304;
 bh=18G7Hj9q8cncfV3hH9722v8zJ7usf7Q8Ng96aoe59RU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ur312CK6OZntPrD/B/vpgyRBV0khNbq4RMObqL3AFcWJcZwgHMzR8fC01L9WuPOBA
 QH7NCc8dpW0Dwo8Ea3vNgGXx7m5lVpAffwyRxxZf6jBNn0+O8o528POtH7Wxe/XphW
 SgoVvAIMPjhmazLOAomPqJTTdUl/hqDpt7ezOIM4=
Date: Thu, 20 Feb 2025 09:31:41 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: linux-kernel@vger.kernel.org, jbaron@akamai.com, ukaszb@chromium.org,
 intel-gfx-trybot@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com
Subject: Re: [PATCH 00/63] Fix CONFIG_DRM_USE_DYNAMIC_DEBUG=y
Message-ID: <2025022012-viscous-cringing-bf88@gregkh>
References: <20250125064619.8305-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250125064619.8305-1-jim.cromie@gmail.com>
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

On Fri, Jan 24, 2025 at 11:45:14PM -0700, Jim Cromie wrote:
> This series fixes dynamic-debug's support for DRM debug-categories.
> Classmaps-v1 evaded full review, and got committed in 2 chunks:
> 
>   b7b4eebdba7b..6ea3bf466ac6	# core dyndbg changes
>   0406faf25fb1..ee7d633f2dfb	# drm adoption
> 
> DRM-CI found a regression during init with drm.debug=<initval>; the
> static-keys under the drm-dbgs in drm.ko got enabled, but those in
> drivers & helpers did not.
> 
> Root Problem:
> 
> DECLARE_DYNDBG_CLASSMAP violated a K&R rule "define once, refer
> afterwards".  Replace it with DYNDBG_CLASSMAP_DEFINE (invoked once in
> drm-core) and DYNDBG_CLASSMAP_USE (invoked repeatedly, in drivers &
> helpers).
> 
> _DEFINE exports the classmap it creates (in drm.ko), other modules
> _USE the classmap.  The _USE adds a record ref'g the _DEFINEd (&
> exported) classmap, in a 2nd __dyndbg_class_users section.
> 
> So now at modprobe, dyndbg scans the new section after the 1st
> __dyndbg_class_maps section, follows the linkage to the _DEFINEr
> module, finds the (optional) kernel-param controlling the classmap,
> examines its drm.debug=<initval>, and applies it to the module being
> initialized.
> 
> To recapitulate the multi-module problem wo DRM involvement, Add:
> 
> A. tools/testing/selftests/dynamic_debug/*
> 
> This alters pr_debugs in the test-modules, counts the results and
> checks them against expectations.  It uses this formula to test most
> of the control grammar, including the new class keyword.
> 
> B. test_dynamic_debug_submod.ko
> 
> This alters the test-module to build both parent & _submod ko's, with
> _DEFINE and _USE inside #if/#else blocks.  This recap's DRM's 2 module
> failure scenario, allowing A to exersize several cases.
> 
> The #if/#else puts the 2 macro uses together for clarity, and gives
> the 2 modules identical sets of debugs.
> 
> Recent DRM-CI tests are here:
>   https://patchwork.freedesktop.org/series/139147/
> 
> Previous rev:
>   https://lore.kernel.org/lkml/20240716185806.1572048-1-jim.cromie@gmail.com/
> 
> Noteworthy Additions:
> 
> 1- drop class "protection" special case, per JBaron's preference.
>    only current use is marked BROKEN so nobody to affect.
>    now framed as policy-choice:
>    #define ddebug_client_module_protects_classes() false
>    subsystems wanting protection can change this.
> 
> 2- compile-time arg-tests in DYNDBG_CLASSMAP_DEFINE
>    implement several required constraints, and fail obviously.
> 
> 3- modprobe time check of conflicting class-id reservations
>    only affects 2+classmaps users.
>    compile-time solution not apparent.
> 
> 4- dyndbg can now cause modprobe to fail.
>    needed to catch 3.
>    maybe some loose ends here on failure.
> 
> 5- refactor & rename ddebug_attach_*module_classes
>    reduce repetetive boilerplate on 2 types: maps, users.
>    rework mostly brought forward in patchset to reduce churn
>    TBD: maybe squash more.
> 
> Several recent trybot submissions (against drm-tip) have been passing
> CI.BAT, and failing one or few CI.IGT tests randomly; re-tests do not
> reliably repeat the failures.
> 
> its also at github.com:jimc/linux.git
>   dd-fix-9[st]-ontip  &  dd-fix-9-13
> 
> Ive been running it on my desktop w/o issues.
> 
> The drivers/gpu/drm patches are RFC, I think there might be a single
> place to call DRM_CLASSMAP_USE(drm_dedbug_classes) to replace the
> sprinkling of _USEs in drivers and helpers.  IIRC, I tried adding a
> _DEFINE into drm_drv.c, that didn't do it, so I punted for now.
> 
> I think the dyndbg core additions are ready for review and merging
> into a (next-next) test/integration tree.

So whose tree should this go through?

And I think the last patch in this series isn't correct, it looks like a
000 email somehow.

thanks,

greg k-h
