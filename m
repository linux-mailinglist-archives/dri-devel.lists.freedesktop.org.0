Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A7C5146B5
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 12:24:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E76F010FC67;
	Fri, 29 Apr 2022 10:24:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38F4710FC67;
 Fri, 29 Apr 2022 10:24:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A037B62336;
 Fri, 29 Apr 2022 10:24:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55AFAC385A4;
 Fri, 29 Apr 2022 10:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651227840;
 bh=VrvVa5/GusZJ9VrpG6S/DfT6kLbm0YgE/cVZm1EEsfM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=W01SN75HD/9NKxwPAcdRHgQ6deX+WrGupf3yk6SNkXQIEnduJtYsEYWi3sfbOgTmS
 6MwopNddRW2Mfuzwh5EyiAjvDtjIiT4ivU/0GV1msqWw/VWzI+LVT98VoZatLxCMCx
 4qIocUDIsZjHyg/rGXYmYEWUPCg4APwXrUZZ1lcofStDRRmLkQSqYeY/usr+E9V7lF
 Q/hy3vpb0xK9Dpnr04F6PtJrsvclnxSnJ6fhqjOT7sm5hhQXKRqajLKzMxafVsiOaF
 5gi8dQtcVzsgxyL9VMlyQYIDePwQpkoJC+wGD6h09G/5Dpg0mYWy9YcrW0BnaHKjqr
 PZMZv6lhsirPQ==
Date: Fri, 29 Apr 2022 11:23:51 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/2] module: add a function to add module references
Message-ID: <20220429112351.0e044950@sal.lan>
In-Reply-To: <Ymu5f8EjdC1Mawzt@kroah.com>
References: <cover.1651212016.git.mchehab@kernel.org>
 <a078eb2e46d00ec59c8a91ea0afa5190730c9e58.1651212016.git.mchehab@kernel.org>
 <YmuZovuDaCYDDG4c@phenom.ffwll.local>
 <20220429090757.1acb943a@sal.lan> <YmuiKcHgl+nABvo/@kroah.com>
 <20220429101503.4048db5b@sal.lan> <Ymu5f8EjdC1Mawzt@kroah.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
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
Cc: Kai Vehmanen <kai.vehmanen@intel.com>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Luis Chamberlain <mcgrof@kernel.org>, mauro.chehab@intel.com,
 Dan Williams <dan.j.williams@intel.com>, linux-modules@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Em Fri, 29 Apr 2022 12:10:07 +0200
Greg KH <gregkh@linuxfoundation.org> escreveu:

> On Fri, Apr 29, 2022 at 10:15:03AM +0100, Mauro Carvalho Chehab wrote:
> > HI Greg,
> > 
> > Em Fri, 29 Apr 2022 10:30:33 +0200
> > Greg KH <gregkh@linuxfoundation.org> escreveu:
> >   
> > > On Fri, Apr 29, 2022 at 09:07:57AM +0100, Mauro Carvalho Chehab wrote:  
> > > > Hi Daniel,
> > > > 
> > > > Em Fri, 29 Apr 2022 09:54:10 +0200
> > > > Daniel Vetter <daniel@ffwll.ch> escreveu:
> > > >     
> > > > > On Fri, Apr 29, 2022 at 07:31:15AM +0100, Mauro Carvalho Chehab wrote:    
> > > > > > Sometimes, device drivers are bound using indirect references,
> > > > > > which is not visible when looking at /proc/modules or lsmod.
> > > > > > 
> > > > > > Add a function to allow setting up module references for such
> > > > > > cases.
> > > > > > 
> > > > > > Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> > > > > > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>      
> > > > > 
> > > > > This sounds like duct tape at the wrong level. We should have a
> > > > > device_link connecting these devices, and maybe device_link internally
> > > > > needs to make sure the respective driver modules stay around for long
> > > > > enough too. But open-coding this all over the place into every driver that
> > > > > has some kind of cross-driver dependency sounds terrible.
> > > > > 
> > > > > Or maybe the bug is that the snd driver keeps accessing the hw/component
> > > > > side when that is just plain gone. Iirc there's still fundamental issues
> > > > > there on the sound side of things, which have been attempted to paper over
> > > > > by timeouts and stuff like that in the past instead of enforcing a hard
> > > > > link between the snd and i915 side.    
> > > > 
> > > > I agree with you that the device link between snd-hda and the DRM driver
> > > > should properly handle unbinding on both directions. This is something
> > > > that require further discussions with ALSA and DRM people, and we should
> > > > keep working on it.
> > > > 
> > > > Yet, the binding between those drivers do exist, but, despite other
> > > > similar inter-driver bindings being properly reported by lsmod, this one
> > > > is invisible for userspace.
> > > > 
> > > > What this series does is to make such binding visible. As simple as that.    
> > > 
> > > It also increases the reference count, and creates a user/kernel api
> > > with the symlinks, right?  Will the reference count increase prevent the
> > > modules from now being unloadable?
> > >
> > > This feels like a very "weak" link between modules that should not be
> > > needed if reference counting is implemented properly (so that things are
> > > cleaned up in the correct order.)  
> > 
> > The refcount increment exists even without this patch, as
> > hda_component_master_bind() at sound/hda/hdac_component.c uses 
> > try_module_get() when it creates the device link.  
> 
> Ok, then why shouldn't try_module_get() be creating this link instead of
> having to manually do it this way again?  You don't want to have to go
> around and add this call to all users of that function, right?

Works for me, but this is not a too trivial change, as the new 
try_module_get() function will require two parameters, instead of one:

	- the module to be referenced;
	- the module which will reference it.

On trivial cases, one will be THIS_MODULE, but, in the specific case
of snd_hda, the binding is done via an ancillary routine under 
snd_hda_core, but the actual binding happens at snd_hda_intel.

Ok, we could add a __try_module_get() (or whatever other name that
would properly express what it does) with two parameters, and then
define try_module_get() as:

	#define try_module_get(mod) __try_module_get(mod, THIS_MODULE)

Would that work for you?

Regards,
Mauro
