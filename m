Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 809B35B8EA1
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 20:10:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5707510E9B8;
	Wed, 14 Sep 2022 18:10:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D52D410E9B4;
 Wed, 14 Sep 2022 18:10:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 05C8461E68;
 Wed, 14 Sep 2022 18:10:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13443C433C1;
 Wed, 14 Sep 2022 18:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1663179046;
 bh=mVGUDoPGJ3+fyw9UwUrdODWJg12rzQGWMTswdFgtKjE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kh1DjcyskucyUtPTKYR86ZbXkBJNmlPf90jfhzqb1gEwPTNm4jzQn8me8fQoPEpq1
 Tnj/qEeiYymWWgX416zh6AidfY88NP0Z5nJUnsWhBaFj9RjfNtIEIIe/Hbs5vot23D
 vG1Yr8hFEHaBl+3isRmd8USdJ2i4YNOWgxKLrnUA=
Date: Wed, 14 Sep 2022 20:11:11 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Winkler, Tomas" <tomas.winkler@intel.com>
Subject: Re: [PATCH v5 00/15] drm/i915: HuC loading for DG2
Message-ID: <YyIZP2DjqyztwxxF@kroah.com>
References: <20220913005739.798337-1-daniele.ceraolospurio@intel.com>
 <MN2PR11MB4093E87A6EAE878EFCE805ABE5469@MN2PR11MB4093.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MN2PR11MB4093E87A6EAE878EFCE805ABE5469@MN2PR11MB4093.namprd11.prod.outlook.com>
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
Cc: "Ye, Tony" <tony.ye@intel.com>, "Teres Alexis,
 Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Usyskin,
 Alexander" <alexander.usyskin@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 14, 2022 at 04:51:03PM +0000, Winkler, Tomas wrote:
> > 
> > On DG2, HuC loading is performed by the GSC, via a PXP command. The load
> > operation itself is relatively simple (just send a message to the GSC with the
> > physical address of the HuC in LMEM), but there are timing changes that
> > requires special attention. In particular, to send a PXP command we need to
> > first export the GSC as an aux device and then wait for the mei-gsc and mei-
> > pxp modules to start, which means that HuC load will complete after i915
> > load is complete. This means that there is a small window of time after i915 is
> > registered and before HuC is loaded during which userspace could submit
> > and/or check the HuC load status, although this is quite unlikely to happen
> > (HuC is usually loaded before kernel init/resume completes).
> > We've consulted with the media team in regards to how to handle this and
> > they've asked us to stall all userspace VCS submission until HuC is loaded.
> > Stalls are expected to be very rare (if any), due to the fact that HuC is usually
> > loaded before kernel init/resume is completed.
> > 
> > Timeouts are in place to ensure all submissions are unlocked in case
> > something goes wrong. Since we need to monitor the status of the mei
> > driver to know what's happening and when to time out, a notifier has been
> > added so we get a callback when the status of the mei driver changes.
> > 
> > Note that this series includes several mei patches that add support for
> > sending the HuC loading command via mei-gsc. We plan to merge those
> > patches through the drm tree because i915 is the sole user.
> > 
> > v2: address review comments, Reporting HuC loading still in progress while
> > we wait for mei-gsc init to complete, rebase on latest mei-gsc series.
> > 
> > v3: fix cc list in mei patches.
> > 
> > v4: update mei patches, fix includes, rebase on new FW fetch logic and
> > merged mei-gsc support.
> > 
> > v5: update mei patches
> 
> Greg,  I hope I've addressed most of your comments.
> Can you please check if the mei patches are in acceptable state or anything else can be improved with this series.  Appreciated. 

These were sent 2 days ago, in the middle of a conference travel.
Please relax, there's no special rush needed here, you know better.

In the mean time, if you are just waiting for my review, please take the
time to review other pending patches from other developers to help
lighten the load on me, and other maintainers.

thanks,

greg k-h
