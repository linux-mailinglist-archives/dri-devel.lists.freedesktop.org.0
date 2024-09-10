Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 238AD973CC0
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 17:53:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ACCD10E86D;
	Tue, 10 Sep 2024 15:53:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nnejubvT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F80710E86D;
 Tue, 10 Sep 2024 15:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725983606; x=1757519606;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8A0sImRzGqYtKcvvYf4KPHb7ANZNl5JY3dQAxnuE3e0=;
 b=nnejubvT/D3MnRIyorg4B5QE19JA13IYhzh1y+Mh4qU8GrqN6D0F7vNB
 5n/kAkjh1c7qAWb86xPDeMSWXuRsiRot/37mcdgoyalgeyU15S/5mEy+o
 5lNcWel4sCXtqhTYKTWT+pvs0uXpJSNHzPjB1qnkH7L6HAsDHJhKs4wOY
 lU8xJgOhhCmQaji7Szxr/RXoH7en3GGSp+o+pHcDrIdA2o7omVDNIyEUC
 hikSGIoMWkqlDLvCtyAhJmBvgo4s4ftolnJ4qkrWectXhoptwrNVVBkRw
 +C5dVbBvHsP6CXqqM4j3E0EIrdlTEw90FJ15klQ6xAqUdbAXQng8Oe8hE Q==;
X-CSE-ConnectionGUID: fpCNPlnjTKKKV0MRnm5utQ==
X-CSE-MsgGUID: 8nvRVBZPTvKWFsNqT3I+2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24616902"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="24616902"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 08:53:25 -0700
X-CSE-ConnectionGUID: QDcrU6nDQhiTcBfA1nBe0w==
X-CSE-MsgGUID: CuemNpeITxu2h4/8xT6hbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="66699035"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 08:53:22 -0700
Date: Tue, 10 Sep 2024 18:53:19 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Asahi Lina <lina@asahilina.net>, airlied@gmail.com, daniel@ffwll.ch,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, francois.dugast@intel.com,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com
Subject: Re: [PATCH v4 1/3] drm: Introduce device wedged event
Message-ID: <ZuBrb0KTIxHtio7Z@black.fi.intel.com>
References: <20240906094225.3082162-1-raag.jadav@intel.com>
 <20240906094225.3082162-2-raag.jadav@intel.com>
 <7ca931aa-986d-48d4-bcee-37c3badd91c8@asahilina.net>
 <x5kvnv6cdo6d2wdcsokvvsedzpr5crcncmmiqnkyomf4nez4mk@er3axfov44fc>
 <4c9ce216-9762-4dfd-80c7-fe285cae05c2@asahilina.net>
 <dk67ybpmfdx5dabrcsu4ueesk4prcrifhwcvoo73epskyimyfa@x54wxfe6lagf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dk67ybpmfdx5dabrcsu4ueesk4prcrifhwcvoo73epskyimyfa@x54wxfe6lagf>
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

On Mon, Sep 09, 2024 at 03:01:50PM -0500, Lucas De Marchi wrote:
> On Sun, Sep 08, 2024 at 11:08:39PM GMT, Asahi Lina wrote:
> > On 9/8/24 12:07 AM, Lucas De Marchi wrote:
> > > On Sat, Sep 07, 2024 at 08:38:30PM GMT, Asahi Lina wrote:
> > > > On 9/6/24 6:42 PM, Raag Jadav wrote:
> > > > > Introduce device wedged event, which will notify userspace of wedged
> > > > > (hanged/unusable) state of the DRM device through a uevent. This is
> > > > > useful especially in cases where the device is in unrecoverable state
> > > > > and requires userspace intervention for recovery.
> > > > > 
> > > > > Purpose of this implementation is to be vendor agnostic. Userspace
> > > > > consumers (sysadmin) can define udev rules to parse this event and
> > > > > take respective action to recover the device.
> > > > > 
> > > > > Consumer expectations:
> > > > > ----------------------
> > > > > 1) Unbind driver
> > > > > 2) Reset bus device
> > > > > 3) Re-bind driver
> > > > 
> > > > Is this supposed to be normative? For drm/asahi we have a "wedged"
> > > > concept (firmware crashed), but the only possible recovery action is a
> > > > full system reboot (which might still be desirable to allow userspace to
> > > > trigger automatically in some scenarios) since there is no bus-level
> > > > reset and no firmware reload possible.
> > > 
> > > maybe let drivers hint possible/supported recovery mechanisms and then
> > > sysadmin chooses what to do?
> > 
> > How would we do this? A textual value for the event or something like
> > that? ("WEDGED=bus-reset" vs "WEDGED=reboot"?)
> 
> If there's a need for more than one, than I think exposing the supported
> ones sorted by "side effect" in sysfs would be good. Something like:
> 
> 	$ cat /sys/class/drm/card0/device/wedge_recover
> 	rebind
> 	bus-reset
> 	reboot

How do we expect the drivers to flag supported ones? Extra hooks?

Raag
