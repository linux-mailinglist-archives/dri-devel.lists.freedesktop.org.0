Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9006413CF5
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 23:49:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D7D76E884;
	Tue, 21 Sep 2021 21:49:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 611D56E884
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 21:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ORMq0lCOy2f9In4z9KGT4J4GdZq0ZWa+fw9HsTMzwD0=; b=IBzt4v0OuH2RwrGBN43RfFewU/
 WUF2wyY5WQgxm8CzDRqgS54Qh7C+q2mStC4AzdtYc74ENV3a73OrXMMlFnXP8JphSix+WU4jgnroR
 UmpLjKCvOdNJ/yqLRdtS0aLGGWJy7OBBJRxkSrKZ+fz1LfdXH/wnbnc7M9p2rIvkoEfZdtM6TNeaE
 O02+aRt0z6QW+t5BaCKIqmRICeiGWEPnnSdJuRTQuAwc72fYoJOeSCxg2Zh5bjHvO9hr+rjAvJD9+
 IvCDQnWw0iDWQ/xeaSegHgwDoGfIM26dBbOOzLa+e8rGvcL5AepCt4krAqqqjzCjNrgD22JE2GQ6R
 JMF8pS/A==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54720)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1mSndt-00037y-4Y; Tue, 21 Sep 2021 22:49:33 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1mSndq-0003eE-Fp; Tue, 21 Sep 2021 22:49:30 +0100
Date: Tue, 21 Sep 2021 22:49:30 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, jani.nikula@intel.com,
 Imre Deak <imre.deak@intel.com>, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [RFC PATCH] component: do not leave master devres group open
 after bind
Message-ID: <YUpTamg3qSe9XmNa@shell.armlinux.org.uk>
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

Yes, this is the right fix - I did not expect people to be claiming
resources after adding the component master, since that is the point
at which the master can become active. Hence all resources that may
be used should either already be claimed, or (preferred) be claimed
when the master gets the bind call.

However, I think the i915 bits are more complex than that simple view,
so putting the component stuff inside its own devres group and closing
it at the end of try_to_bring_up_master() makes sense.

Acked-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
