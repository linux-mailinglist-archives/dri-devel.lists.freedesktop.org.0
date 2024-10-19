Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 502639A5067
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2024 21:08:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E85910E137;
	Sat, 19 Oct 2024 19:08:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fg8qI09f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D28C210E027;
 Sat, 19 Oct 2024 19:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729364934; x=1760900934;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=724JEb7bJx5KyvA4qk7Tfnw3+GQOoVld9sssFLU4zw4=;
 b=fg8qI09foSDX/VCopRBuGy9x1fq+x4pTQm55+yp4rw+dMq3EdA1dTtOO
 mNVpemikgtLcLv6+d0a1ALOZ/IoL2bwsAJMzWGUafxExXW4wL2EpMwfjG
 /hVF7HNzarWKseqJw0xDJCKqRGxUXBYyZiZo2MZUmR36UzCfauZf8zTuU
 qeX4I9nMKAs2GuDL04cXlDoFO1/nrZ9oHlAn3qYNrKJ7fYzL9q0BOpJGe
 Nj8bZl8OeULOHDj7hzHRxs/nFesoVn84+BX3S0Amo+QwDcheV7rvxFwVq
 o61c84j48x29oMEoC8gvSzp1B0Tw7eruWxahRNgP5EjIhMdL6T7cBqG6Z g==;
X-CSE-ConnectionGUID: +gwYFhu/RpGhMt5sVc4wiw==
X-CSE-MsgGUID: HjvrDRyZTVqnVZgn3zJ37g==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="16502761"
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; d="scan'208";a="16502761"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2024 12:08:53 -0700
X-CSE-ConnectionGUID: YS1EsQPsS56fLTMtrAi0nw==
X-CSE-MsgGUID: mjSvnrv4SiylaFNdE64qEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; d="scan'208";a="83940563"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2024 12:08:48 -0700
Date: Sat, 19 Oct 2024 22:08:45 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, simona@ffwll.ch,
 intel-gfx@lists.freedesktop.org, joonas.lahtinen@linux.intel.com,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 lucas.demarchi@intel.com, tursulin@ursulin.net,
 francois.dugast@intel.com, jani.nikula@linux.intel.com,
 airlied@gmail.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, andi.shyti@linux.intel.com,
 matthew.d.roper@intel.com, andriy.shevchenko@linux.intel.com,
 lina@asahilina.net, kernel-dev@igalia.com,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH v7 1/5] drm: Introduce device wedged event
Message-ID: <ZxQDvSfFiAjDqEE8@black.fi.intel.com>
References: <20240930073845.347326-1-raag.jadav@intel.com>
 <20240930073845.347326-2-raag.jadav@intel.com>
 <ed8cb1e9-df05-44a7-9088-90b3ee8dce85@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ed8cb1e9-df05-44a7-9088-90b3ee8dce85@igalia.com>
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

On Thu, Oct 17, 2024 at 04:16:09PM -0300, André Almeida wrote:
> Hi Raag,
> 
> Em 30/09/2024 04:38, Raag Jadav escreveu:
> > Introduce device wedged event, which will notify userspace of wedged
> > (hanged/unusable) state of the DRM device through a uevent. This is
> > useful especially in cases where the device is no longer operating as
> > expected even after a hardware reset and has become unrecoverable from
> > driver context.
> > 
> > Purpose of this implementation is to provide drivers a generic way to
> > recover with the help of userspace intervention. Different drivers may
> > have different ideas of a "wedged device" depending on their hardware
> > implementation, and hence the vendor agnostic nature of the event.
> > It is up to the drivers to decide when they see the need for recovery
> > and how they want to recover from the available methods.
> > 
> > Current implementation defines three recovery methods, out of which,
> > drivers can choose to support any one or multiple of them. Preferred
> > recovery method will be sent in the uevent environment as WEDGED=<method>.
> > Userspace consumers (sysadmin) can define udev rules to parse this event
> > and take respective action to recover the device.
> > 
> >      =============== ==================================
> >      Recovery method Consumer expectations
> >      =============== ==================================
> >      rebind          unbind + rebind driver
> >      bus-reset       unbind + reset bus device + rebind
> >      reboot          reboot system
> >      =============== ==================================
> > 
> > 
> 
> I proposed something similar in the past:
> https://lore.kernel.org/dri-devel/20221125175203.52481-1-andrealmeid@igalia.com/

Thanks for sharing. I went through it and I think we can use some of the ideas
with generic adaption.

While we can always execute scripts on uevent, it'd be good to have a userspace
daemon applying automated policies for wedge cases based on admin/user needs.
This way we can also manage repeat offenders.

Xe has devcoredump so telemetry would also be a nice addition.

Great opportunity to collaborate here.

> The motivation was that amdgpu was getting stuck after every GPU reset, and
> there was just a black screen. The uevent would then trigger a daemon to
> reset the compositor and getting things back together. As you can see in my
> thread, the feature was blocked in favor of getting better overall GPU reset
> from the kernel side.

We have hardware level resets but (although rare) they're also prone to failure.
We do what we can to recover from driver context but it adds on to the complexity
overtime. Something like wedging, if done right, would be much more robust IMHO.

Raag
