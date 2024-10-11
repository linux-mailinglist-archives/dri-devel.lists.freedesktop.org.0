Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5D8999FC7
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 11:08:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5493E10EA8C;
	Fri, 11 Oct 2024 09:08:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="meHYnuj/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 704A110EA8C
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 09:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728637715; x=1760173715;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=wjaX4dezrVKaIgXT3ZLpa0ZEe7OhEKWN0AW3aIej/Mw=;
 b=meHYnuj/QJGrIpkTi8i5UB9SJHr2/Gy90HC2hmYX5lwosQcSjwIgYz+B
 pABpltyJNcqJ1JriaKxEhitHknK2o5ZTkqQdjNsP8k5C4kcYf1BOHsUD/
 1aAH2AJymkena0eKlNNrobZetcG4sPwHmORoAalEeUcn5iTEs85hbYmHA
 WfVQgcek73XzpvzCqqAAjbF1vwrKyIy1F209c3McSQ7uiWu0NjOwkVlJN
 PUeTSPS1xhwLDARjjMOHoNkRVh+1Wdu0RgOx6Lru4EjOH9ErmHr1qlwvl
 yJK1okzMDGix1eTrQPdbfZesr9M5Ho6FrT51YnWJoFE0B3QipqmwlCz3c Q==;
X-CSE-ConnectionGUID: oMsc/wwUTlqgetfx2NXk8A==
X-CSE-MsgGUID: eiWxf/8KSGSecR7r5N8wzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="38602338"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="38602338"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 02:08:25 -0700
X-CSE-ConnectionGUID: N3PMHwsPSDSDzM5YsogWCw==
X-CSE-MsgGUID: pMU15ayITIasVg6Vpq19yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="77061572"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.178])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 02:08:19 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, airlied@redhat.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 0/7] drm: Add physical status and BMC support to conenctor
In-Reply-To: <20241011065705.6728-1-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241011065705.6728-1-tzimmermann@suse.de>
Date: Fri, 11 Oct 2024 12:08:06 +0300
Message-ID: <87v7xz57nt.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 11 Oct 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Track a connector's physical status separately from the logical status
> and implement BMC support for DRM drivers. Connectors with virtual BMC
> stay connected even if no display is physically connected. DRM clients
> then continue displaying output to the BMC.
>
> Ast and mgag200 have been doing this for a while. Moving this into
> struct drm_connector and probe helpers simplifies htese divers and
> makes the functionality available to others. Hibmc is a candidate here.
>
> Patch just simplifies code in probe helpers and has been acked as part
> of the series at [1].
>
> Pathces 2 and 3 add the physical status and a BMC flag to struct
> drm_connector. Usually physical connector status and regular, logical
> status are in sync, so nothing changes for most drivers. If the the
> BMC flag has been set, the logical status is always connected. The
> probe helpers also take care of sending hotplug events if the physical
> status changes.
>
> Patches 4 to 7 update ast and mgag200. Both drivers already implement
> their own tracking of physical status, which is now handled by DRM
> helpers. Ast also receives two simple bug fixes for cleaning up EDID
> properties in the BMC case.
>
> Tested on ast and mgag200 hardware. Another driver that could make use
> of this functionality is hibmc.

Overall,

Acked-by: Jani Nikula <jani.nikula@intel.com>

but please do improve the documentation, and consider alternatives to
the bmc_attached naming.

>
> [1] https://patchwork.freedesktop.org/series/136084/
>
> Thomas Zimmermann (7):
>   drm/probe-helper: Call connector detect functions in single helper
>   drm: Add physical status to connector
>   drm: Add bmc_attached flag to connector
>   drm/ast: sil164: Clear EDID if no display is connected
>   drm/ast: vga: Clear EDID if no display is connected
>   drm/ast: Track physical connector status in struct drm_connector
>   drm/mgag200: Track physical connector status in struct drm_connector
>
>  drivers/gpu/drm/ast/ast_dp.c              | 21 +++-------
>  drivers/gpu/drm/ast/ast_dp501.c           | 17 ++------
>  drivers/gpu/drm/ast/ast_drv.h             | 24 ++---------
>  drivers/gpu/drm/ast/ast_sil164.c          | 19 +++------
>  drivers/gpu/drm/ast/ast_vga.c             | 30 +++-----------
>  drivers/gpu/drm/drm_connector.c           |  1 +
>  drivers/gpu/drm/drm_probe_helper.c        | 50 +++++++++++++----------
>  drivers/gpu/drm/mgag200/mgag200_vga_bmc.c | 32 +++------------
>  include/drm/drm_connector.h               | 15 +++++++
>  9 files changed, 77 insertions(+), 132 deletions(-)

-- 
Jani Nikula, Intel
