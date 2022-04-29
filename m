Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8507251464C
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 12:10:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2319F10FBD3;
	Fri, 29 Apr 2022 10:10:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 767AF10FBD3;
 Fri, 29 Apr 2022 10:10:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CB3D2B83402;
 Fri, 29 Apr 2022 10:10:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10EDBC385AD;
 Fri, 29 Apr 2022 10:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1651227010;
 bh=/fZkfLjWpmIzhdcxrKUWxcmqUV1u1Y3FbmbQ8JbUy1Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OcZ3H86tp/Jk8BaNgocIT5hnynF3bb/7AyyykOP2bQIno2P9PAhMqBT8aY6HX1Xnp
 7E3bNt9X93xBxz7L8xUKzAFo+K/H4BP4R1ksbf9Ybo947jWW2YnkbghthPWkp6BEq8
 jieo7akxYIqUd6M2CjQoDFGgu1RCwZb88gR/WPB4=
Date: Fri, 29 Apr 2022 12:10:07 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 1/2] module: add a function to add module references
Message-ID: <Ymu5f8EjdC1Mawzt@kroah.com>
References: <cover.1651212016.git.mchehab@kernel.org>
 <a078eb2e46d00ec59c8a91ea0afa5190730c9e58.1651212016.git.mchehab@kernel.org>
 <YmuZovuDaCYDDG4c@phenom.ffwll.local>
 <20220429090757.1acb943a@sal.lan> <YmuiKcHgl+nABvo/@kroah.com>
 <20220429101503.4048db5b@sal.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220429101503.4048db5b@sal.lan>
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
Cc: Kai Vehmanen <kai.vehmanen@intel.com>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Luis Chamberlain <mcgrof@kernel.org>, mauro.chehab@intel.com,
 Dan Williams <dan.j.williams@intel.com>, linux-modules@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 29, 2022 at 10:15:03AM +0100, Mauro Carvalho Chehab wrote:
> HI Greg,
> 
> Em Fri, 29 Apr 2022 10:30:33 +0200
> Greg KH <gregkh@linuxfoundation.org> escreveu:
> 
> > On Fri, Apr 29, 2022 at 09:07:57AM +0100, Mauro Carvalho Chehab wrote:
> > > Hi Daniel,
> > > 
> > > Em Fri, 29 Apr 2022 09:54:10 +0200
> > > Daniel Vetter <daniel@ffwll.ch> escreveu:
> > >   
> > > > On Fri, Apr 29, 2022 at 07:31:15AM +0100, Mauro Carvalho Chehab wrote:  
> > > > > Sometimes, device drivers are bound using indirect references,
> > > > > which is not visible when looking at /proc/modules or lsmod.
> > > > > 
> > > > > Add a function to allow setting up module references for such
> > > > > cases.
> > > > > 
> > > > > Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> > > > > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>    
> > > > 
> > > > This sounds like duct tape at the wrong level. We should have a
> > > > device_link connecting these devices, and maybe device_link internally
> > > > needs to make sure the respective driver modules stay around for long
> > > > enough too. But open-coding this all over the place into every driver that
> > > > has some kind of cross-driver dependency sounds terrible.
> > > > 
> > > > Or maybe the bug is that the snd driver keeps accessing the hw/component
> > > > side when that is just plain gone. Iirc there's still fundamental issues
> > > > there on the sound side of things, which have been attempted to paper over
> > > > by timeouts and stuff like that in the past instead of enforcing a hard
> > > > link between the snd and i915 side.  
> > > 
> > > I agree with you that the device link between snd-hda and the DRM driver
> > > should properly handle unbinding on both directions. This is something
> > > that require further discussions with ALSA and DRM people, and we should
> > > keep working on it.
> > > 
> > > Yet, the binding between those drivers do exist, but, despite other
> > > similar inter-driver bindings being properly reported by lsmod, this one
> > > is invisible for userspace.
> > > 
> > > What this series does is to make such binding visible. As simple as that.  
> > 
> > It also increases the reference count, and creates a user/kernel api
> > with the symlinks, right?  Will the reference count increase prevent the
> > modules from now being unloadable?
> >
> > This feels like a very "weak" link between modules that should not be
> > needed if reference counting is implemented properly (so that things are
> > cleaned up in the correct order.)
> 
> The refcount increment exists even without this patch, as
> hda_component_master_bind() at sound/hda/hdac_component.c uses 
> try_module_get() when it creates the device link.

Ok, then why shouldn't try_module_get() be creating this link instead of
having to manually do it this way again?  You don't want to have to go
around and add this call to all users of that function, right?

thanks,

greg k-h
