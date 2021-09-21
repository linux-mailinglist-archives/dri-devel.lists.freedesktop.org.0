Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E11413905
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 19:45:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E17D16E9EF;
	Tue, 21 Sep 2021 17:45:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C03226E9E1;
 Tue, 21 Sep 2021 17:45:13 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10114"; a="223475103"
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="223475103"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 10:43:41 -0700
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="512410831"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 10:43:38 -0700
Date: Tue, 21 Sep 2021 20:43:34 +0300
From: Imre Deak <imre.deak@intel.com>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, jani.nikula@intel.com,
 dri-devel@lists.freedesktop.org,
 Russell King <rmk+kernel@arm.linux.org.uk>, gregkh@linuxfoundation.org,
 "Rafael J . Wysocki" <rafael@kernel.org>, intel-gfx@lists.freedesktop.org
Subject: Re: [RFC PATCH] component: do not leave master devres group open
 after bind
Message-ID: <20210921174334.GB1139594@ideak-desk.fi.intel.com>
References: <20210921111810.2766726-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210921111810.2766726-1-kai.vehmanen@linux.intel.com>
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

On Tue, Sep 21, 2021 at 02:18:10PM +0300, Kai Vehmanen wrote:
> In current code, the devres group for aggregate master is left open
> after call to component_master_add_*(). This leads to problems when the
> master does further managed allocations on its own. When any
> participating driver calls component_del(), this leads to immediate
> release of resources.
> 
> This came up when investigating a page fault occurring with i915 DRM
> driver unbind with 5.15-rc1 kernel. The following sequence occurs:
> 
>  i915_pci_remove()
>    -> intel_display_driver_unregister()
>      -> i915_audio_component_cleanup()
>        -> component_del()
>          -> component.c:take_down_master()
>            -> hdac_component_master_unbind() [via master->ops->unbind()]
>            -> devres_release_group(master->parent, NULL)
> 
> With older kernels this has not caused issues, but with audio driver
> moving to use managed interfaces for more of its allocations, this no
> longer works. Devres log shows following to occur:
> 
> component_master_add_with_match()
> [  126.886032] snd_hda_intel 0000:00:1f.3: DEVRES ADD 00000000323ccdc5 devm_component_match_release (24 bytes)
> [  126.886045] snd_hda_intel 0000:00:1f.3: DEVRES ADD 00000000865cdb29 grp< (0 bytes)
> [  126.886049] snd_hda_intel 0000:00:1f.3: DEVRES ADD 000000001b480725 grp< (0 bytes)
> 
> audio driver completes its PCI probe()
> [  126.892238] snd_hda_intel 0000:00:1f.3: DEVRES ADD 000000001b480725 pcim_iomap_release (48 bytes)
> 
> component_del() called() at DRM/i915 unbind()
> [  137.579422] i915 0000:00:02.0: DEVRES REL 00000000ef44c293 grp< (0 bytes)
> [  137.579445] snd_hda_intel 0000:00:1f.3: DEVRES REL 00000000865cdb29 grp< (0 bytes)
> [  137.579458] snd_hda_intel 0000:00:1f.3: DEVRES REL 000000001b480725 pcim_iomap_release (48 bytes)
> 
> So the "devres_release_group(master->parent, NULL)" ends up freeing the
> pcim_iomap allocation. Upon next runtime resume, the audio driver will
> cause a page fault as the iomap alloc was released without the driver
> knowing about it.
> 
> Fix this issue by using the "struct master" pointer as identifier for
> the devres group, and by closing the devres group after the master->ops->bind()
> call is done. This allows devres allocations done by the driver acting as
> master to be isolated from the binding state of the aggregate driver. This
> modifies the logic originally introduced in commit 9e1ccb4a7700
> ("drivers/base: fix devres handling for master device").
> 
> BugLink: https://gitlab.freedesktop.org/drm/intel/-/issues/4136
> Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>

This makes sense to me and also seems to match the devres logic for
component binding (component_bind()), where the only resources freed at
unbind (or at bind failure) are those that were allocated in the
components' bind hook. Any resource allocated later by the components
are not affected by the unbinding:

Acked-by: Imre Deak <imre.deak@intel.com>

If for some reason the current behaviour was intentional, one
alternative I can think of would be for audio to register itself with the
component framework using a dedicated kdev object.

Imo the component framework's devres semantics would need to be
documented as well.

> ---
>  drivers/base/component.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> Hi,
> I'm sending this as RFC as I'm not sure of the implications of
> not leaving the devres group open might have to other users
> of the component framework.
> 
> For audio, the current behaviour seems very problematic. The display
> codec is usually just one of many audio codecs attached to the controller,
> and unbind of the display codec (and the aggregate driver created with
> DRM), should not bring down the whole audio card.
> 
> However, now all allocations audio driver does after call to
> component_master_add_with_match(), will be freed when display
> driver calls component_del().
> 
> Closing the devres group at end of component_master_add_*() would
> seem the cleanest option. Looking for feedback whether this approach
> is feasible. One alternative would be for the audio driver to
> close the "last opened" group after its call to component_master_add(),
> but this seems messy (audio would make assumptions on component.c
> internals).
> 
> diff --git a/drivers/base/component.c b/drivers/base/component.c
> index 5e79299f6c3f..870485cbbb87 100644
> --- a/drivers/base/component.c
> +++ b/drivers/base/component.c
> @@ -246,7 +246,7 @@ static int try_to_bring_up_master(struct master *master,
>  		return 0;
>  	}
>  
> -	if (!devres_open_group(master->parent, NULL, GFP_KERNEL))
> +	if (!devres_open_group(master->parent, master, GFP_KERNEL))
>  		return -ENOMEM;
>  
>  	/* Found all components */
> @@ -258,6 +258,7 @@ static int try_to_bring_up_master(struct master *master,
>  		return ret;
>  	}
>  
> +	devres_close_group(master->parent, NULL);
>  	master->bound = true;
>  	return 1;
>  }
> @@ -282,7 +283,7 @@ static void take_down_master(struct master *master)
>  {
>  	if (master->bound) {
>  		master->ops->unbind(master->parent);
> -		devres_release_group(master->parent, NULL);
> +		devres_release_group(master->parent, master);
>  		master->bound = false;
>  	}
>  }
> 
> base-commit: 930e99a51fcc8b1254e0a45fbe0cd5a5b8a704a5
> -- 
> 2.32.0
> 
