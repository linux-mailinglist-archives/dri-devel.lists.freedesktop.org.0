Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87614422B1E
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 16:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09EAF6F5DC;
	Tue,  5 Oct 2021 14:35:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B6866F5DC;
 Tue,  5 Oct 2021 14:35:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6DE7161372;
 Tue,  5 Oct 2021 14:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1633444557;
 bh=WvZ8JLb5v93QBADCd0vUKgm5lhpJbxIW9TwhqZ0TzdM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JjFWcOLGO1DYCmQLBXXDU7pHE4TCziZiUu68bh6z27RvqRP1ihbXe1Ukc99/QzH78
 JPaz5bk7gVXpoOMDb2UOHjch5c17x6n9GX3+wNanmyCgiKoRGKX7//xQ+umkLA+Hm3
 fWgJx+vTpPM2oJGtjz7bzQFiYgBLKbmxo0CC4XxM=
Date: Tue, 5 Oct 2021 16:35:55 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, tiwai@suse.de,
 alsa-devel@alsa-project.org, jani.nikula@intel.com,
 Imre Deak <imre.deak@intel.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 "Rafael J . Wysocki" <rafael@kernel.org>, intel-gfx@lists.freedesktop.org,
 Russell King <rmk+kernel@armlinux.org.uk>
Subject: Re: [PATCH v2] component: do not leave master devres group open
 after bind
Message-ID: <YVxiyzNrKG8S1GDb@kroah.com>
References: <20210922085432.2776886-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210922085432.2776886-1-kai.vehmanen@linux.intel.com>
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

On Wed, Sep 22, 2021 at 11:54:32AM +0300, Kai Vehmanen wrote:
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
> the devres group, and by closing the devres group after
> the master->ops->bind() call is done. This allows devres allocations
> done by the driver acting as master to be isolated from the binding state
> of the aggregate driver. This modifies the logic originally introduced in
> commit 9e1ccb4a7700 ("drivers/base: fix devres handling for master device")
> 
> BugLink: https://gitlab.freedesktop.org/drm/intel/-/issues/4136
> Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Acked-by: Imre Deak <imre.deak@intel.com>
> Acked-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/base/component.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

What commit does this "fix:"?  And does it need to go to stable
kernel(s)?

thanks,

greg k-h
