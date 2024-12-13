Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C25EA9F0BDE
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 13:05:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AB4D10EFF0;
	Fri, 13 Dec 2024 12:05:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DgVKhXrI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FE0F10EFF9;
 Fri, 13 Dec 2024 12:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734091529; x=1765627529;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=VKZpPn6I8wzCL0CIKFbJALWp14PLE3BreK8vOmhe0os=;
 b=DgVKhXrIqtgHY77QYUBjJCrleZyeYZF0ZyQWx5MoLzc5Bc5wjBHuFtyO
 PeWmb8M+IF1bO1G820ODmqvHNmWVY7RpV8R9+cYIQCFi5Ir8R2e703ZUT
 Y3dlHtGeUgyPTleTgZeE7f6UQX5tzIVyEx8HM8FD9LfXYifIpP6BQqur/
 3ebYPgedqgOZl8Dft7fu2IMhjnD0XAN240qcKP724QUpSN72XDTwXOCvo
 el/btgtb0GmdEQSI63mARqB6LSLO0SAqk+k597kDwIo+hQifgYxpCJ6NT
 HxkH+dpGSblHgnuFzzLEHEzD5fYlKajqppywqnYFGQZnRCsq6IrwdRtYN w==;
X-CSE-ConnectionGUID: bpQpec3USpSPZW9Utq9P/Q==
X-CSE-MsgGUID: tAsC6N7uROeUUdG8MO5yOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="51956931"
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; d="scan'208";a="51956931"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 04:05:29 -0800
X-CSE-ConnectionGUID: 9ZEDfrBYR3KoLgPqMjahuA==
X-CSE-MsgGUID: 5/2KB9h8QXiFQhiOxfsoOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; d="scan'208";a="101533282"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 04:05:26 -0800
Date: Fri, 13 Dec 2024 14:06:06 +0200
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Lyude Paul <lyude@redhat.com>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Wayne Lin <wayne.lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Karol Herbst <kherbst@redhat.com>, Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v3 04/11] drm/dp_mst: Register connectors via
 drm_connector_dynamic_register()
Message-ID: <Z1wjLr4EuJoeSCtD@ideak-desk.fi.intel.com>
References: <20241211230328.4012496-1-imre.deak@intel.com>
 <20241211230328.4012496-5-imre.deak@intel.com>
 <87bjxhxla8.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bjxhxla8.fsf@intel.com>
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

On Thu, Dec 12, 2024 at 12:12:15PM +0200, Jani Nikula wrote:
> On Thu, 12 Dec 2024, Imre Deak <imre.deak@intel.com> wrote:
> > MST connectors should be initialized/registered by calling
> > drm_connector_dynamic_init()/drm_connector_dynamic_register(). The
> > previous patch adding these functions explains the issue with the
> 
> References to "previous patch" become meaningless after this has been
> committed.

Ok, will change it to: "The patch adding these functions ...".

> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> 
> > current drm_connector_init*()/drm_connector_register() interface for
> > MST connectors.
> >
> > Based on the above adjust here the registration part and change the
> > initialization part in follow-up patches for each driver.
> >
> > For now, drivers are allowed to keep using the drm_connector_init*()
> > functions, by drm_connector_dynamic_register() checking for this (see
> > drm_connector_add()). A patch later will change this to WARN in such
> > cases.
> >
> > Cc: Lyude Paul <lyude@redhat.com>
> > Cc: Harry Wentland <harry.wentland@amd.com>
> > Cc: Leo Li <sunpeng.li@amd.com>
> > Cc: Wayne Lin <wayne.lin@amd.com>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: Karol Herbst <kherbst@redhat.com>
> > Cc: Danilo Krummrich <dakr@kernel.org>
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >  drivers/gpu/drm/display/drm_dp_mst_topology.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > index 687c70308d82b..f8cd094efa3c0 100644
> > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > @@ -2281,7 +2281,7 @@ drm_dp_mst_port_add_connector(struct drm_dp_mst_branch *mstb,
> >  		port->cached_edid = drm_edid_read_ddc(port->connector,
> >  						      &port->aux.ddc);
> >  
> > -	drm_connector_register(port->connector);
> > +	drm_connector_dynamic_register(port->connector);
> >  	return;
> >  
> >  error:
> 
> -- 
> Jani Nikula, Intel
