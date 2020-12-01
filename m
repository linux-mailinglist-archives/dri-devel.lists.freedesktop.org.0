Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E92562CB6BB
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 09:20:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 992E86EA2B;
	Wed,  2 Dec 2020 08:19:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 805886E53E
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 15:02:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3ECB30E;
 Tue,  1 Dec 2020 07:02:28 -0800 (PST)
Received: from localhost (unknown [10.1.198.32])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 75D6A3F575;
 Tue,  1 Dec 2020 07:02:28 -0800 (PST)
Date: Tue, 1 Dec 2020 15:02:27 +0000
From: Ionela Voinescu <ionela.voinescu@arm.com>
To: Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [PATCH 3/5] thermal: devfreq_cooling: add new registration
 functions with Energy Model
Message-ID: <20201201150227.GA29042@arm.com>
References: <20200921122007.29610-1-lukasz.luba@arm.com>
 <20200921122007.29610-4-lukasz.luba@arm.com>
 <20201007120746.GA15063@arm.com>
 <71cfae58-8ea5-c591-455b-d84420d8412a@arm.com>
 <20201201140520.GA7206@arm.com>
 <a0b70daf-fbd8-928e-36d0-d44d5fd68ca6@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a0b70daf-fbd8-928e-36d0-d44d5fd68ca6@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 02 Dec 2020 08:19:47 +0000
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
Cc: amit.kucheria@verdurent.com, linux-pm@vger.kernel.org, airlied@linux.ie,
 daniel.lezcano@linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, rui.zhang@intel.com, orjan.eide@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday 01 Dec 2020 at 14:37:58 (+0000), Lukasz Luba wrote:
> 
> 
> On 12/1/20 2:05 PM, Ionela Voinescu wrote:
> > Hi,
> > 
> > On Thursday 22 Oct 2020 at 12:17:31 (+0100), Lukasz Luba wrote:
> > [..]
> > 
> > > > > +/**
> > > > > + * devfreq_cooling_em_register_power() - Register devfreq cooling device with
> > > > > + *		power information and attempt to register Energy Model (EM)
> > > > 
> > > > It took me a while to understand the differences between devfreq
> > > > register functions and it left me with a nagging feeling that we don't
> > > > need all of them. Also, looking over the cpufreq cooling devices, they
> > > > keep their registering interfaces quite simple.
> > > 
> > > This was discussed in previous series, related to EM core changes.
> > > It was requested to have a helper registration function which would
> > > create EM automatically.
> > > 
> > > > 
> > > > With the functions added by this patch, the devfreq cooling devices will have:
> > > >    - old:
> > > >          of_devfreq_cooling_register_power
> > > >          of_devfreq_cooling_register
> > > >          devfreq_cooling_register
> > > >          devfreq_cooling_unregister
> > > >    - new:
> > > >          devfreq_cooling_em_register_power
> > > >          devfreq_cooling_em_register
> > > > 
> > > > My question is whether we actually need the two new
> > > > devfreq_cooling_em_register_power() and devfreq_cooling_em_register()?
> > > 
> > > It is just for consistency, with older scheme. It is only a wrapper, one
> > > line, with default NULL. This scheme is common in thermal and some other
> > > frameworks.
> > > 
> > > > 
> > > > The power_ops and the em are dependent on one another, so could we
> > > > extend the of_devfreq_cooling_register_power() to do the additional em
> > > > registration. We only need a way to pass the em_cb and I think that
> > > > could fit nicely in devfreq_cooling_power.
> > > 
> > > No, they aren't 'dependent on one another'. The EM usage doesn't depend
> > > on presence of power_ops. Drivers might not support power_ops, but want
> > > the framework still use EM and do power estimation.
> > > 
> > 
> > Okay, wrong choice of words. There's only a one way dependency: you can't
> > use power_ops without an em, according to
> > of_devfreq_cooling_register_power().
> > 
> > Correct me if I'm wrong, but I see this as being okay as you still need
> > an em to give you the maximum power of a device in a certain state.
> > 
> > With this in mind, and taking in detail the possible calls of the
> > devfreq cooling register functions:
> > 
> > 1. Register devfreq cooling device with energy model.
> >     (used in patch 5/5)
> > 
> >   -> devfreq_cooling_em_register()
> >      -> devfreq_cooling_em_register_power(dfc_power = NULL, em obtained
> >                                        through various methods)
> >        -> of_devfreq_cooling_register_power(same as above)
> > 
> > 2. Register devfreq cooling device with power_ops and em:
> >     (not used)
> > 
> >   -> devfreq_cooling_em_register_power(dfc_power != NULL, em obtained
> >                                       through various methods)
> >     -> of_devfreq_cooling_register_power(same as above)
> > 
> > 3. Register a devfreq cooling devices with power_ops but no em
> >     (not used)
> > 
> >   -> of_devfreq_cooling_register_power(dfc_power != NULL)
> > 
> > 
> > 4. Register a devfreq cooling devices without any kind of power
> >     information (em or dfc_power/power_ops)
> > 
> >   -> devfreq_cooling_register() or of_devfreq_cooling_register()
> >     -> of_devfreq_cooling_register_power(dfc_power = NULL)
> > 
> > 
> > Given this, aren't we ending up with some possible calls to these
> > registration functions that don't make sense? That is case 3, as
> > of_devfreq_cooling_register_power() could not assign and later use
> > power_ops without an em. For this usecase, 2 should be used instead.
> 
> In use case 3. you missed that the driver could registered EM by itself.
> Maybe wanted to manage the EM internally, for various reasons. Then this
> registration use case 3. makes sense.
> 

Yes, the code allows it but it would be unlikely.

> > 
> > Therefore, can't the same be achieved by collapsing
> > devfreq_cooling_em_register_power() into
> > of_devfreq_cooling_register_power()? (with the user having the
> > possibility to provide the em callback similarly to how get_real_power()
> > is provided - in devfreq_cooling_power).
> > 
> > IMO is cleaner to unify the functionality (registration and callbacks)
> > of cooling devices with power capabilities (based on em alone or together
> > with power_ops). Otherwise we just create confusion for users registering
> > cooling devices not knowing which function to call.
> 
> I don't want to add the code from devfreq_cooling_em_register_power()
> into the of_devfreq_cooling_register_power(), these are pretty dense
> functions with complicated error handling paths.
> In this shape and a few wrappers, which help users to register according
> to their needs, it looks OK.
> 
> There will be always a review of the coming drivers which would like to
> register.
> 

Okay, no other arguments from my part.

I'll now take a look over v2. I just wanted to get some of these design
choices out of the way first.

Thanks,
Ionela.

> > 
> > If this has been discussed previously and I'm missing some details,
> > please provide some links to the discussions.
> > 
> > Thank you for the patience :).
> > 
> > Ionela.
> > 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
