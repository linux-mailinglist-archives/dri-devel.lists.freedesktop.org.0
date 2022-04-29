Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1635146D6
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 12:36:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3736910E07A;
	Fri, 29 Apr 2022 10:36:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C2DA10E07A;
 Fri, 29 Apr 2022 10:36:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AE0ECB83441;
 Fri, 29 Apr 2022 10:36:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D111EC385A7;
 Fri, 29 Apr 2022 10:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1651228564;
 bh=o0zBJ+SKkAUN56ZqpQtuEIJ6OIeAS93jNqU6+Q7RUSQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TyS89al3T0t01lxOPzBl9fvatdfcb1LWSvxIeOjSVrOuF9nslLxBiLa7EwhRJucUm
 o2SWD8uZu9cadtPMyh6cgSPl90t/Fw9//GdIx++e5pvK+npqLM0rVQcxsGJpkxe/Ly
 nc7TSC40HfxNg/LD+Y7/D4gsxOjIcDxqhwJgEg9A=
Date: Fri, 29 Apr 2022 12:36:01 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 1/2] module: add a function to add module references
Message-ID: <Ymu/keaggU6Uajom@kroah.com>
References: <cover.1651212016.git.mchehab@kernel.org>
 <a078eb2e46d00ec59c8a91ea0afa5190730c9e58.1651212016.git.mchehab@kernel.org>
 <YmuZovuDaCYDDG4c@phenom.ffwll.local>
 <20220429090757.1acb943a@sal.lan> <YmuiKcHgl+nABvo/@kroah.com>
 <20220429101503.4048db5b@sal.lan> <Ymu5f8EjdC1Mawzt@kroah.com>
 <20220429112351.0e044950@sal.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220429112351.0e044950@sal.lan>
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

On Fri, Apr 29, 2022 at 11:23:51AM +0100, Mauro Carvalho Chehab wrote:
> Em Fri, 29 Apr 2022 12:10:07 +0200
> Greg KH <gregkh@linuxfoundation.org> escreveu:
> 
> > On Fri, Apr 29, 2022 at 10:15:03AM +0100, Mauro Carvalho Chehab wrote:
> > > HI Greg,
> > > 
> > > Em Fri, 29 Apr 2022 10:30:33 +0200
> > > Greg KH <gregkh@linuxfoundation.org> escreveu:
> > >   
> > > > On Fri, Apr 29, 2022 at 09:07:57AM +0100, Mauro Carvalho Chehab wrote:  
> > > > > Hi Daniel,
> > > > > 
> > > > > Em Fri, 29 Apr 2022 09:54:10 +0200
> > > > > Daniel Vetter <daniel@ffwll.ch> escreveu:
> > > > >     
> > > > > > On Fri, Apr 29, 2022 at 07:31:15AM +0100, Mauro Carvalho Chehab wrote:    
> > > > > > > Sometimes, device drivers are bound using indirect references,
> > > > > > > which is not visible when looking at /proc/modules or lsmod.
> > > > > > > 
> > > > > > > Add a function to allow setting up module references for such
> > > > > > > cases.
> > > > > > > 
> > > > > > > Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> > > > > > > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>      
> > > > > > 
> > > > > > This sounds like duct tape at the wrong level. We should have a
> > > > > > device_link connecting these devices, and maybe device_link internally
> > > > > > needs to make sure the respective driver modules stay around for long
> > > > > > enough too. But open-coding this all over the place into every driver that
> > > > > > has some kind of cross-driver dependency sounds terrible.
> > > > > > 
> > > > > > Or maybe the bug is that the snd driver keeps accessing the hw/component
> > > > > > side when that is just plain gone. Iirc there's still fundamental issues
> > > > > > there on the sound side of things, which have been attempted to paper over
> > > > > > by timeouts and stuff like that in the past instead of enforcing a hard
> > > > > > link between the snd and i915 side.    
> > > > > 
> > > > > I agree with you that the device link between snd-hda and the DRM driver
> > > > > should properly handle unbinding on both directions. This is something
> > > > > that require further discussions with ALSA and DRM people, and we should
> > > > > keep working on it.
> > > > > 
> > > > > Yet, the binding between those drivers do exist, but, despite other
> > > > > similar inter-driver bindings being properly reported by lsmod, this one
> > > > > is invisible for userspace.
> > > > > 
> > > > > What this series does is to make such binding visible. As simple as that.    
> > > > 
> > > > It also increases the reference count, and creates a user/kernel api
> > > > with the symlinks, right?  Will the reference count increase prevent the
> > > > modules from now being unloadable?
> > > >
> > > > This feels like a very "weak" link between modules that should not be
> > > > needed if reference counting is implemented properly (so that things are
> > > > cleaned up in the correct order.)  
> > > 
> > > The refcount increment exists even without this patch, as
> > > hda_component_master_bind() at sound/hda/hdac_component.c uses 
> > > try_module_get() when it creates the device link.  
> > 
> > Ok, then why shouldn't try_module_get() be creating this link instead of
> > having to manually do it this way again?  You don't want to have to go
> > around and add this call to all users of that function, right?
> 
> Works for me, but this is not a too trivial change, as the new 
> try_module_get() function will require two parameters, instead of one:
> 
> 	- the module to be referenced;
> 	- the module which will reference it.
> 
> On trivial cases, one will be THIS_MODULE, but, in the specific case
> of snd_hda, the binding is done via an ancillary routine under 
> snd_hda_core, but the actual binding happens at snd_hda_intel.

For calls that want to increment a module reference on behalf of a
different code segment than is calling it, create a new function so we
can audit-the-heck out of those code paths as odds are, they are unsafe.

For the normal code path, just turn try_module_get() into a macro that
includes THIS_MODULE as part of it like we do for the driver register
functions (see usb_register_driver() in include/linux/usb.h as an
example of how to do that.)

> Ok, we could add a __try_module_get() (or whatever other name that
> would properly express what it does) with two parameters, and then
> define try_module_get() as:
> 
> 	#define try_module_get(mod) __try_module_get(mod, THIS_MODULE)

Yes, that's the way forward.

thanks,

greg k-h
