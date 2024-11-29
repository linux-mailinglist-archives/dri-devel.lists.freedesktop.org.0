Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F009DEAB9
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 17:11:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD60A10E520;
	Fri, 29 Nov 2024 16:11:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RWf2sD/t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9A3110E511;
 Fri, 29 Nov 2024 16:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732896686; x=1764432686;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=bGCoPdIaflH1sREVF20uKevBtvi3xK0jmS6oC2Xf8gI=;
 b=RWf2sD/tY+AJQc7QKyQw9hfT2ZNsh+Ns8FgK9eNa5a3k4V4Da7tqvrNk
 P6sCn+w+s+T0f5gUreYEDcPF8XZ70CNYEHCrfHH+MSYHdRKFTQduDlekb
 Z3GvbVUGkV+o+6RAmAywVr6p6Wk3Z2bEDhAKBbX8eR+slem/RpwjFqIrl
 2U0+sxHKsEUJRyzhy3hTvlSXCwungnnGPRaQzsC8lzKdqaY9IZzaM7sJw
 htzlnQE5UNk22keRtrDtQxo1L5QmbDdK63r4dUSEc4wYx12pa9abi/yYU
 m1oTxW6W/3Is31iVW5+rxCzVvzAjpi3uP39baUosE7yls6LAE6lGBzcaY g==;
X-CSE-ConnectionGUID: GrkPho2AS3y8IVFhs1nWew==
X-CSE-MsgGUID: YAaaAYtgSHq4LLR8m1UThg==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="36804165"
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; d="scan'208";a="36804165"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2024 08:11:25 -0800
X-CSE-ConnectionGUID: ne8gN1eLRE6F139Z4jN5Gw==
X-CSE-MsgGUID: 6Fyv2xYcRBCe7ZPOX0frLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; d="scan'208";a="96598889"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2024 08:11:23 -0800
Date: Fri, 29 Nov 2024 18:12:01 +0200
From: Imre Deak <imre.deak@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 1/4] drm/dp: Add a way to init/add a connector in
 separate steps
Message-ID: <Z0nn0VzawSCdOCKY@ideak-desk.fi.intel.com>
References: <20241126161859.1858058-1-imre.deak@intel.com>
 <20241126161859.1858058-2-imre.deak@intel.com>
 <Z0nO-bwpbWPVryd6@ideak-desk.fi.intel.com>
 <20241129-wild-cobra-of-thunder-829d1f@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241129-wild-cobra-of-thunder-829d1f@houat>
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 29, 2024 at 03:46:28PM +0100, Maxime Ripard wrote:
> On Fri, Nov 29, 2024 at 04:26:01PM +0200, Imre Deak wrote:
> > Adding more people from DRM core domain. Any comment, objection to this
> > change?
> > 
> > On Tue, Nov 26, 2024 at 06:18:56PM +0200, Imre Deak wrote:
> > > Atm when the connector is added to the drm_mode_config::connector_list,
> > > the connector may not be fully initialized yet. This is not a problem
> > > for user space, which will see the connector only after it's registered
> > > later, it could be a problem for in-kernel users looking up connectors
> > > via the above list.
> 
> It could be, or it actually is a problem? If so, in what situation?

An actual problem is that after an MST connector is created and added to
the connector list, the connector could be probed without the connector
being fully initialized during a hotplug event handling along with all
the other connectors on the list. The connector's helper functions could
be still unset leading to a NULL deref while trying to call the
connector's detect/detect_ctx callbacks, or if these callbacks are set
already, the detect handler could see a connector which is not yet
initialized fully.

> > > To resolve the above issue, add a way to separately initialize the DRM
> > > core specific parts of the connector and add it to the above list. This
> > > will move adding the connector to the list after the properties on the
> > > connector have been added, this is ok since these steps don't have a
> > > dependency.
> > >
> > > v2: (Jani)
> > > - Let initing DDC as well via drm_connector_init_core().
> > > - Rename __drm_connector_init to drm_connector_init_core_and_add().
> > > 
> > > Cc: Jani Nikula <jani.nikula@intel.com>
> > > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> (v1)
> > > Signed-off-by: Imre Deak <imre.deak@intel.com>
> 
> If we do have an actual problem to solve, we'll need kunit tests too.

I don't have a good idea for this. The problem is not in a parituclar
function, rather in the order a connector is initialized and added to
the connector list. The above is an actual problem though, so I don't
think fixing that should be blocked by this.

> 
> Maxime
