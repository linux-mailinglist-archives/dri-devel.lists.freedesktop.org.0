Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B8B9A3EAC
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 14:46:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0F2110E084;
	Fri, 18 Oct 2024 12:46:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mHoq06sj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 031D310E084;
 Fri, 18 Oct 2024 12:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729255590; x=1760791590;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=4Vl7QAqoHmPO1FKzXLGkpJuzOb1E6R705GR2DJYGtMY=;
 b=mHoq06sj0O1364/La36n61LPPj/PivUALCMyRif2+Xlmb1O//YxByvWS
 1felh0E/OewyxjoMiv7IW+nxKzQwPKAJux6S1iU6pOx/XEeeRfO17pTRs
 ghi8QC+409FQq+y5cg4oL97MESBZLU0+AW2mx2EM3mi2KTu3PHOvZwPA3
 A2/e/dLWvDeF8bkV20Ypr8updQZwGSj7SUvxPkpDWOTaBbWDCFNJfIkFk
 97JxrwcbRZMGJ1xoEFmYplVIm0lRRnflva9hY4dV8aPlV4eQRwLsUie/F
 ZjAcd3IMzPtICqUSZ7P1zyvA8fcR1fFe1o5lwmXYRW0flHlVRkEX2yDkh g==;
X-CSE-ConnectionGUID: FCND1UG4R66aKEZXlwfTBA==
X-CSE-MsgGUID: as7x/x9vTk61jq/EmgsV9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28942633"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28942633"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 05:46:29 -0700
X-CSE-ConnectionGUID: dvIp3lWnTWK6Y5ImBxC1GA==
X-CSE-MsgGUID: LnNpM252TDGdpzMhHSWKgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="83684011"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 05:46:22 -0700
Date: Fri, 18 Oct 2024 15:46:19 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, airlied@gmail.com,
 simona@ffwll.ch, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, jani.nikula@linux.intel.com,
 andriy.shevchenko@linux.intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, lina@asahilina.net,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, andi.shyti@linux.intel.com,
 matthew.d.roper@intel.com, boris.brezillon@collabora.com,
 adrian.larumbe@collabora.com, kernel@collabora.com,
 maraeo@gmail.com, friedrich.vock@gmx.de, michel@daenzer.net,
 joshua@froggi.es, alexander.deucher@amd.com, andrealmeid@igalia.com,
 amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH v7 1/5] drm: Introduce device wedged event
Message-ID: <ZxJYm6epuuConWdz@black.fi.intel.com>
References: <20240930073845.347326-1-raag.jadav@intel.com>
 <20240930073845.347326-2-raag.jadav@intel.com>
 <ZxB6yKRrgvCoRK7y@black.fi.intel.com>
 <9b720b21-6195-408c-88bf-a092e0e7555c@amd.com>
 <ZxE-x6osh_jFHl5X@intel.com>
 <5a89757f-7000-4ccc-8762-1befe1fae258@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5a89757f-7000-4ccc-8762-1befe1fae258@amd.com>
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

On Fri, Oct 18, 2024 at 12:58:09PM +0200, Christian König wrote:
> Am 17.10.24 um 18:43 schrieb Rodrigo Vivi:
> > On Thu, Oct 17, 2024 at 09:59:10AM +0200, Christian König wrote:
> > > > > Purpose of this implementation is to provide drivers a generic way to
> > > > > recover with the help of userspace intervention. Different drivers may
> > > > > have different ideas of a "wedged device" depending on their hardware
> > > > > implementation, and hence the vendor agnostic nature of the event.
> > > > > It is up to the drivers to decide when they see the need for recovery
> > > > > and how they want to recover from the available methods.
> > > > > 
> > > > > Current implementation defines three recovery methods, out of which,
> > > > > drivers can choose to support any one or multiple of them. Preferred
> > > > > recovery method will be sent in the uevent environment as WEDGED=<method>.
> > > > > Userspace consumers (sysadmin) can define udev rules to parse this event
> > > > > and take respective action to recover the device.
> > > > > 
> > > > >       =============== ==================================
> > > > >       Recovery method Consumer expectations
> > > > >       =============== ==================================
> > > > >       rebind          unbind + rebind driver
> > > > >       bus-reset       unbind + reset bus device + rebind
> > > > >       reboot          reboot system
> > > > >       =============== ==================================
> > > Well that sounds like userspace would need to be involved in recovery.
> > > 
> > > That in turn is a complete no-go since we at least need to signal all
> > > dma_fences to unblock the kernel. In other words things like bus reset needs
> > > to happen inside the kernel and *not* in userspace.
> > > 
> > > What we can do is to signal to userspace: Hey a bus reset of device X
> > > happened, maybe restart container, daemon, whatever service which was using
> > > this device.
> > Well, when we declare device 'wedged' it is because we don't want to take
> > any drastic measures inside the kernel and want to leave it in a protected
> > and unusable state. In a way that users wouldn't lose display for instance,
> > or at least the device is in a debugable state.
> 
> Uff, that needs to be very very well documented or otherwise the whole
> approach is an absolutely clear NAK from my side as DMA-buf maintainer.
> 
> > 
> > Then, the instructions here is to tell what could possibly be attempted
> > from userspace to get the device to an usable state.
> > 
> > The 'wedge' mode (the one emiting this uevent) needs to be responsible
> > for signaling all the fences and everything needed for a clean unbind
> > and whatever next step might be indicated to userspace.
> > 
> > That should already be part of any wedged mode, regardless the uevent
> > to inform the userspace here.
> 
> You need to approach that from a different side. With the current patch set
> you are ignoring documented mandatory driver behavior as far as I can see.
> 
> So first of all describe in the documentation what the wedged mode is and
> what requirements a driver has to fulfill to enter it:
> https://docs.kernel.org/gpu/drm-uapi.html#device-reset
>
> Especially document that all system memory accesses of the device needs to
> be blocked by (for example) disabling DMA accesses in the PCI config space.
> 
> When it is guaranteed that the device can't access any system memory any
> more the device driver should signal all pending fences of this device.
> 
> And only after all of that is done the driver  can send an uevent to inform
> userspace that it can debug the hanged state.

Sure, will do.

> As far as I can see this makes the enum how to recover the device
> superfluous because you will most likely always need a bus reset to get out
> of this again.

That depends on the kind of fault the device has encountered and the bus it is
sitting on. There could be buses that don't support reset.

Raag
