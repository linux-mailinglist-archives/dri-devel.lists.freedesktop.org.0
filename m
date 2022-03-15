Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2034DA3EE
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 21:24:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F64D10E357;
	Tue, 15 Mar 2022 20:24:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40EA510E357
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 20:24:37 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id ed0f5d83-a49d-11ec-9faa-0050568c148b;
 Tue, 15 Mar 2022 20:24:33 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id C84D8194B3C;
 Tue, 15 Mar 2022 21:24:34 +0100 (CET)
Date: Tue, 15 Mar 2022 21:24:32 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm: Don't make DRM_PANEL_BRIDGE dependent on
 DRM_KMS_HELPERS
Message-ID: <YjD2ACc5DRos8Efc@ravnborg.org>
References: <20220315084559.23510-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220315084559.23510-1-tzimmermann@suse.de>
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
Cc: andrzej.hajda@intel.com, narmstrong@baylibre.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 kernel test robot <lkp@intel.com>, thierry.reding@gmail.com,
 robert.foss@linaro.org, airlied@redhat.com,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 Naresh Kamboju <naresh.kamboju@linaro.org>, Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 15, 2022 at 09:45:59AM +0100, Thomas Zimmermann wrote:
> Fix a number of undefined references to drm_kms_helper.ko in
> drm_dp_helper.ko:
> 
>   arm-suse-linux-gnueabi-ld: drivers/gpu/drm/dp/drm_dp_mst_topology.o: in function `drm_dp_mst_duplicate_state':
>   drm_dp_mst_topology.c:(.text+0x2df0): undefined reference to `__drm_atomic_helper_private_obj_duplicate_state'
>   arm-suse-linux-gnueabi-ld: drivers/gpu/drm/dp/drm_dp_mst_topology.o: in function `drm_dp_delayed_destroy_work':
>   drm_dp_mst_topology.c:(.text+0x370c): undefined reference to `drm_kms_helper_hotplug_event'
>   arm-suse-linux-gnueabi-ld: drivers/gpu/drm/dp/drm_dp_mst_topology.o: in function `drm_dp_mst_up_req_work':
>   drm_dp_mst_topology.c:(.text+0x7938): undefined reference to `drm_kms_helper_hotplug_event'
>   arm-suse-linux-gnueabi-ld: drivers/gpu/drm/dp/drm_dp_mst_topology.o: in function `drm_dp_mst_link_probe_work':
>   drm_dp_mst_topology.c:(.text+0x82e0): undefined reference to `drm_kms_helper_hotplug_event'
> 
> This happens if panel-edp.ko has been configured with
> 
>   DRM_PANEL_EDP=y
>   DRM_DP_HELPER=y
>   DRM_KMS_HELPER=m
> 
> which builds DP helpers into the kernel and KMS helpers sa a module.
> Making DRM_PANEL_EDP select DRM_KMS_HELPER resolves this problem.
> 
> To avoid a resulting cyclic dependency with DRM_PANEL_BRIDGE, don't
> make the latter depend on DRM_KMS_HELPER and fix the one DRM bridge
> drivers that doesn't already select DRM_KMS_HELPER. As KMS helpers
> cannot be selected directly by the user, config symbols should avoid
> depending on it anyway.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 3755d35ee1d2 ("drm/panel: Select DRM_DP_HELPER for DRM_PANEL_EDP")
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Naresh Kamboju <naresh.kamboju@linaro.org>
> Cc: Linux Kernel Functional Testing <lkft@linaro.org>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
