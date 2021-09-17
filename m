Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2684040FCCF
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 17:40:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B47A6EDBD;
	Fri, 17 Sep 2021 15:40:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F4DA6EDC8
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 15:40:34 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id c7so13206566qka.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 08:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ySJeE4ysYIw9RaXTv5EfYfSx9XZTDRHe0HBU7fYPDYk=;
 b=HCZgo08IWdYcal6imdSq3F9urscT1LBzNenngRIw6fSEwE6rfra+zCiDK2NzmGR+6S
 jN7pyRkfkKUxmw3gg3iZWxLv0o/IRiO9tW3q17GlWby1NmcvVBqFwzhzgsP+1jgoBKzj
 LEnLhFY8zOMZbEQP6px7mgP6dqRv35CF/67kONqEw7LleaTULBYLDQMhQrEzZyybfoJv
 E4cy5JHzqzVRKGNcAsCilBC4Z1Xwtimv9Xr24uW9zzvez6mIGWGYvtzkOdEl5kNN4xGr
 M9F6i9G+7oeeV+KYp5Nsn8fyh64bhvu2METf9Ae3CadhhaIKLiIcj2u3oP/LarAKCRKE
 y+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ySJeE4ysYIw9RaXTv5EfYfSx9XZTDRHe0HBU7fYPDYk=;
 b=59vLudvB8W2vGz4mJ//Ddw9+A+E5n52nINjVPuhsr/PQQyKOwyt3BbFZvn2z3fLB/1
 VctrJUJFQ6cxnCTrO1g7sicvyqkldz3D71aDYp+1eaP/59eRwzCnJEKTzBzWAwjxpPlt
 IpWwR9ygFB59HZ6d1dQ3ZmuKaHcln8lZSr/Ycy+7XiXK7Be+JH7BEfewdxpaMmlJS/xF
 1gLmbwlR1sDn6SX24GHFh12geYdi43j6XD3z+C+VstN+lWnS2hWkPKb8IE/GTdWILmwQ
 Hd81kWVJaHFsOWmb2ApwEnUrPj4+HrzxEuwTcLwB4dgPEjhzXJfJRvO9GQ/OxKQuFVaq
 Z5rw==
X-Gm-Message-State: AOAM533lNRHz0c33r7zUWwwxRCazk/702O+6TVnXQe7jltS0lA/AgZP/
 +oRAfg3+XUMFpco+O6YPjmK92Q==
X-Google-Smtp-Source: ABdhPJykn7GqWq+6l4vuRei4kg1H47sF8YD8eIEb6O3DxFiapVQYu17NPibEZ1AzkPOzDxPJVNkJSw==
X-Received: by 2002:a37:68d0:: with SMTP id d199mr10726589qkc.96.1631893233467; 
 Fri, 17 Sep 2021 08:40:33 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id az6sm4765236qkb.70.2021.09.17.08.40.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Sep 2021 08:40:33 -0700 (PDT)
Date: Fri, 17 Sep 2021 11:40:31 -0400
From: Sean Paul <sean@poorly.run>
To: Fernando Ramos <greenfoo@u92.eu>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: Re: [PATCH 08/15] drm/radeon: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Message-ID: <20210917154031.GH2515@art_vandelay>
References: <20210916211552.33490-1-greenfoo@u92.eu>
 <20210916211552.33490-9-greenfoo@u92.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210916211552.33490-9-greenfoo@u92.eu>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Thu, Sep 16, 2021 at 11:15:45PM +0200, Fernando Ramos wrote:
> As requested in Documentation/gpu/todo.rst, replace driver calls to
> drm_modeset_lock_all() with DRM_MODESET_LOCK_ALL_BEGIN() and
> DRM_MODESET_LOCK_ALL_END()
> 
> Signed-off-by: Fernando Ramos <greenfoo@u92.eu>
> ---
>  drivers/gpu/drm/radeon/radeon_device.c | 13 +++++++++----
>  drivers/gpu/drm/radeon/radeon_dp_mst.c |  7 +++++--
>  2 files changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
> index 4f0fbf667431..3feb1fd44409 100644
> --- a/drivers/gpu/drm/radeon/radeon_device.c
> +++ b/drivers/gpu/drm/radeon/radeon_device.c
> @@ -37,6 +37,7 @@
>  #include <drm/drm_cache.h>
>  #include <drm/drm_crtc_helper.h>
>  #include <drm/drm_device.h>
> +#include <drm/drm_drv.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/radeon_drm.h>
> @@ -1559,7 +1560,9 @@ int radeon_suspend_kms(struct drm_device *dev, bool suspend,
>  	struct pci_dev *pdev;
>  	struct drm_crtc *crtc;
>  	struct drm_connector *connector;
> +	struct drm_modeset_acquire_ctx ctx;
>  	int i, r;
> +	int ret;

Could you please tuck this up with i & r?

>  
>  	if (dev == NULL || dev->dev_private == NULL) {
>  		return -ENODEV;
> @@ -1573,12 +1576,12 @@ int radeon_suspend_kms(struct drm_device *dev, bool suspend,
>  
>  	drm_kms_helper_poll_disable(dev);
>  
> -	drm_modeset_lock_all(dev);
> +	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
>  	/* turn off display hw */
>  	list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
>  		drm_helper_connector_dpms(connector, DRM_MODE_DPMS_OFF);
>  	}
> -	drm_modeset_unlock_all(dev);
> +	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);

You should check ret here

>  
>  	/* unpin the front buffers and cursors */
>  	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
> @@ -1663,7 +1666,9 @@ int radeon_resume_kms(struct drm_device *dev, bool resume, bool fbcon)
>  	struct radeon_device *rdev = dev->dev_private;
>  	struct pci_dev *pdev = to_pci_dev(dev->dev);
>  	struct drm_crtc *crtc;
> +	struct drm_modeset_acquire_ctx ctx;
>  	int r;
> +	int ret;

Same suggestion here, move up with r

>  
>  	if (dev->switch_power_state == DRM_SWITCH_POWER_OFF)
>  		return 0;
> @@ -1741,11 +1746,11 @@ int radeon_resume_kms(struct drm_device *dev, bool resume, bool fbcon)
>  	if (fbcon) {
>  		drm_helper_resume_force_mode(dev);
>  		/* turn on display hw */
> -		drm_modeset_lock_all(dev);
> +		DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
>  		list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
>  			drm_helper_connector_dpms(connector, DRM_MODE_DPMS_ON);
>  		}
> -		drm_modeset_unlock_all(dev);
> +		DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);

Also check ret here


>  	}
>  
>  	drm_kms_helper_poll_enable(dev);
> diff --git a/drivers/gpu/drm/radeon/radeon_dp_mst.c b/drivers/gpu/drm/radeon/radeon_dp_mst.c
> index ec867fa880a4..04fe7b0a6746 100644
> --- a/drivers/gpu/drm/radeon/radeon_dp_mst.c
> +++ b/drivers/gpu/drm/radeon/radeon_dp_mst.c
> @@ -4,6 +4,7 @@
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_probe_helper.h>
> +#include <drm/drm_drv.h>
>  
>  #include "atom.h"
>  #include "ni_reg.h"
> @@ -737,11 +738,13 @@ static int radeon_debugfs_mst_info_show(struct seq_file *m, void *unused)
>  	struct radeon_device *rdev = (struct radeon_device *)m->private;
>  	struct drm_device *dev = rdev->ddev;
>  	struct drm_connector *connector;
> +	struct drm_modeset_acquire_ctx ctx;
>  	struct radeon_connector *radeon_connector;
>  	struct radeon_connector_atom_dig *dig_connector;
>  	int i;
> +	int ret;

Move up with i

>  
> -	drm_modeset_lock_all(dev);
> +	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
>  	list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
>  		if (connector->connector_type != DRM_MODE_CONNECTOR_DisplayPort)
>  			continue;
> @@ -759,7 +762,7 @@ static int radeon_debugfs_mst_info_show(struct seq_file *m, void *unused)
>  				   radeon_connector->cur_stream_attribs[i].fe,
>  				   radeon_connector->cur_stream_attribs[i].slots);
>  	}
> -	drm_modeset_unlock_all(dev);
> +	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
>  	return 0;
>  }
>  
> -- 
> 2.33.0
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
