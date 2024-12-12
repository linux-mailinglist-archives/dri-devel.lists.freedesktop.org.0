Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A47099EE44B
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 11:38:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CBA210ED57;
	Thu, 12 Dec 2024 10:38:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="INMJygM3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E93C10ED50;
 Thu, 12 Dec 2024 10:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733999887; x=1765535887;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=NANjHfc/NI0/qca6IEvLu8cpbit3p/ZreDXA8v2aGuo=;
 b=INMJygM3kQRtyoUFcoN603R9gHQ6zxFVcfDWo3dFvC4j/JQoWAifgbAu
 b3vfVyJsOz4oi1tU6B4Ro6qsdAVquejHfcK+HQiiyeF0065tpbWYDqCIJ
 xMDZzig9VcpPV2Sv7uoZFx3GKGcJs7nYuSq4SkESwMkeZb8J5uTfb+Acm
 tPbugTey/V5KPJAV9dvgXeXFluDwR/XmdmEScqHpJl1BMTCxzbgyVG8AU
 MUBoxTCGMSXHkgRkXxMAQfMU+5MScNTf1pWhfxQehI/aAoUVPpCRihaF8
 re4PXYc7JN+gWwTpiwM3f1vpBVLsnaUp3ykRojzd2R378TVjFlgByRKFV Q==;
X-CSE-ConnectionGUID: VlzyNMgFTgywqc9PVK5lzQ==
X-CSE-MsgGUID: 7YX3TmtEQFC1fdC6N/Ulmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38342732"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="38342732"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 02:38:06 -0800
X-CSE-ConnectionGUID: cbNnAUtGTdObUGlSeEJ7aA==
X-CSE-MsgGUID: LXxurVpWQhuPwBliVHVNXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; d="scan'208";a="96612089"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 02:38:02 -0800
Date: Thu, 12 Dec 2024 12:37:59 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 aravind.iddamsetty@linux.intel.com, rodrigo.vivi@intel.com,
 michal.wajdeczko@intel.com, lina@asahilina.net,
 anshuman.gupta@intel.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 jani.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com
Subject: Re: [PATCH v10 1/4] drm: Introduce device wedged event
Message-ID: <Z1q9B4iQlQQNieS7@black.fi.intel.com>
References: <20241128153707.1294347-1-raag.jadav@intel.com>
 <20241128153707.1294347-2-raag.jadav@intel.com>
 <1d448e67-0c28-4e21-afdd-223495346921@igalia.com>
 <Z01q1-7OF7jgANEM@black.fi.intel.com>
 <Z06QUpm3o_izNjoV@black.fi.intel.com>
 <7d0660f8-ce78-4458-a084-b65ab71e8243@amd.com>
 <Z1A6PYFCUNL9edv6@black.fi.intel.com>
 <m6ysmkxnit6kqeilkcaa3hoyfzyznymsa3eybzsl66jsn2ku67@jl3ajhxgqmvy>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m6ysmkxnit6kqeilkcaa3hoyfzyznymsa3eybzsl66jsn2ku67@jl3ajhxgqmvy>
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

On Wed, Dec 11, 2024 at 06:14:12PM +0100, Maxime Ripard wrote:
> On Wed, Dec 04, 2024 at 01:17:17PM +0200, Raag Jadav wrote:
> > + misc maintainers
> > 
> > On Tue, Dec 03, 2024 at 11:18:00AM +0100, Christian König wrote:
> > > Am 03.12.24 um 06:00 schrieb Raag Jadav:
> > > > On Mon, Dec 02, 2024 at 10:07:59AM +0200, Raag Jadav wrote:
> > > > > On Fri, Nov 29, 2024 at 10:40:14AM -0300, André Almeida wrote:
> > > > > > Hi Raag,
> > > > > > 
> > > > > > Em 28/11/2024 12:37, Raag Jadav escreveu:
> > > > > > > Introduce device wedged event, which notifies userspace of 'wedged'
> > > > > > > (hanged/unusable) state of the DRM device through a uevent. This is
> > > > > > > useful especially in cases where the device is no longer operating as
> > > > > > > expected and has become unrecoverable from driver context. Purpose of
> > > > > > > this implementation is to provide drivers a generic way to recover with
> > > > > > > the help of userspace intervention without taking any drastic measures
> > > > > > > in the driver.
> > > > > > > 
> > > > > > > A 'wedged' device is basically a dead device that needs attention. The
> > > > > > > uevent is the notification that is sent to userspace along with a hint
> > > > > > > about what could possibly be attempted to recover the device and bring
> > > > > > > it back to usable state. Different drivers may have different ideas of
> > > > > > > a 'wedged' device depending on their hardware implementation, and hence
> > > > > > > the vendor agnostic nature of the event. It is up to the drivers to
> > > > > > > decide when they see the need for device recovery and how they want to
> > > > > > > recover from the available methods.
> > > > > > > 
> > > > > > Thank you for your work. Do you think you can add the optional PID
> > > > > > parameter, as the PID of the app that caused the reset? For SteamOS use case
> > > > > > it has been proved to be useful to kill the fault app as well. If the reset
> > > > > > was caused by a kthread, no PID can be provided hence it's an optional
> > > > > > parameter.
> > > > > Hmm, I'm not sure if it really fits here since it doesn't seem like
> > > > > a generic usecase.
> > > > > 
> > > > > I'd still be open for it if found useful by the drivers but perhaps
> > > > > as an extended feature in a separate series.
> > > > What do you think Chris, are we good to go with v10?
> > > 
> > > I agree with Andre that the PID and maybe the new DRM client name would be
> > > really nice to have here.
> > > 
> > > We do have that in the device core dump we create, but if an application is
> > > supervised by daemon for example then that would be really useful.
> > > 
> > > On the other hand I think we should merge the documentation and code as is
> > > and then add the PID/name later on. That is essentially a separate
> > > discussion.
> > 
> > So how do we proceed, perhaps through misc tree?
> 
> Provided it follows the usual rules (ie, Reviewed-by, open source
> userspace tools using it if it's a new uAPI, etc.) then yeah, we can
> merge it through drm-misc.

My understanding is that the core patches are to be reviewed by the
maintainers? The rest of it (patch 2 to 4) seems already reviewed.

We have a documented example (patch 2) with udev rule and a reference
script which can be setup to get this working. Does that qualify as
a consumer?

Raag
