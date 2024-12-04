Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 647B89E3897
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 12:17:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 789BE10ECE1;
	Wed,  4 Dec 2024 11:17:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EWOcB1Dq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2537310E33C;
 Wed,  4 Dec 2024 11:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733311048; x=1764847048;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=r+IpPAuGZ/rPxn5AuiKI5+6CytqFNjN66IUaSyMmBVQ=;
 b=EWOcB1Dqtb18aFRedmpIoVMsFr+5y7JGC2+coa1pXLtaWTWWOErLmS6l
 vwtG0yh3GuqtVYXlHDkd98j/Y9SXWLDuIlYnx7OrjYaeVRmDm+uKiPfdQ
 6zsuGkdGSwqqBeP1mVCQaLaRxE6JXUNA3ZTMwJcuocR/k9zArWq1yj4WV
 l6hL/amyQwiLKwaqx3pPIWGfBLTDdzR6GE+ODdhbunb1HMiq0+Z2M92OG
 ywlXBKLH5VRUv7qo74I3PG/+r+uUXqwv8o+P77Vumqu4A6YxLYQ7KHdJT
 Qi7CUeL7bZWvCKqfUPUPXvuzZKPpwExzCeImKq4FsuopvvaZcImpzYJNd Q==;
X-CSE-ConnectionGUID: TtrovJd4QRqbgYspu/0Uig==
X-CSE-MsgGUID: fw3yS55sTDKqTln2X8Z8PA==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="44182159"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="44182159"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 03:17:25 -0800
X-CSE-ConnectionGUID: wLX6PSf8S1KjWHYBhiHUKQ==
X-CSE-MsgGUID: jwofyawjTWiqpGsZAB1mDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="93627280"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 03:17:20 -0800
Date: Wed, 4 Dec 2024 13:17:17 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Cc: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 aravind.iddamsetty@linux.intel.com, rodrigo.vivi@intel.com,
 michal.wajdeczko@intel.com, lina@asahilina.net,
 anshuman.gupta@intel.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 jani.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com
Subject: Re: [PATCH v10 1/4] drm: Introduce device wedged event
Message-ID: <Z1A6PYFCUNL9edv6@black.fi.intel.com>
References: <20241128153707.1294347-1-raag.jadav@intel.com>
 <20241128153707.1294347-2-raag.jadav@intel.com>
 <1d448e67-0c28-4e21-afdd-223495346921@igalia.com>
 <Z01q1-7OF7jgANEM@black.fi.intel.com>
 <Z06QUpm3o_izNjoV@black.fi.intel.com>
 <7d0660f8-ce78-4458-a084-b65ab71e8243@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7d0660f8-ce78-4458-a084-b65ab71e8243@amd.com>
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

+ misc maintainers

On Tue, Dec 03, 2024 at 11:18:00AM +0100, Christian König wrote:
> Am 03.12.24 um 06:00 schrieb Raag Jadav:
> > On Mon, Dec 02, 2024 at 10:07:59AM +0200, Raag Jadav wrote:
> > > On Fri, Nov 29, 2024 at 10:40:14AM -0300, André Almeida wrote:
> > > > Hi Raag,
> > > > 
> > > > Em 28/11/2024 12:37, Raag Jadav escreveu:
> > > > > Introduce device wedged event, which notifies userspace of 'wedged'
> > > > > (hanged/unusable) state of the DRM device through a uevent. This is
> > > > > useful especially in cases where the device is no longer operating as
> > > > > expected and has become unrecoverable from driver context. Purpose of
> > > > > this implementation is to provide drivers a generic way to recover with
> > > > > the help of userspace intervention without taking any drastic measures
> > > > > in the driver.
> > > > > 
> > > > > A 'wedged' device is basically a dead device that needs attention. The
> > > > > uevent is the notification that is sent to userspace along with a hint
> > > > > about what could possibly be attempted to recover the device and bring
> > > > > it back to usable state. Different drivers may have different ideas of
> > > > > a 'wedged' device depending on their hardware implementation, and hence
> > > > > the vendor agnostic nature of the event. It is up to the drivers to
> > > > > decide when they see the need for device recovery and how they want to
> > > > > recover from the available methods.
> > > > > 
> > > > Thank you for your work. Do you think you can add the optional PID
> > > > parameter, as the PID of the app that caused the reset? For SteamOS use case
> > > > it has been proved to be useful to kill the fault app as well. If the reset
> > > > was caused by a kthread, no PID can be provided hence it's an optional
> > > > parameter.
> > > Hmm, I'm not sure if it really fits here since it doesn't seem like
> > > a generic usecase.
> > > 
> > > I'd still be open for it if found useful by the drivers but perhaps
> > > as an extended feature in a separate series.
> > What do you think Chris, are we good to go with v10?
> 
> I agree with Andre that the PID and maybe the new DRM client name would be
> really nice to have here.
> 
> We do have that in the device core dump we create, but if an application is
> supervised by daemon for example then that would be really useful.
> 
> On the other hand I think we should merge the documentation and code as is
> and then add the PID/name later on. That is essentially a separate
> discussion.

So how do we proceed, perhaps through misc tree?

Raag
