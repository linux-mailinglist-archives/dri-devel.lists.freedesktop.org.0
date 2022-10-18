Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0A3602840
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 11:25:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F72410E102;
	Tue, 18 Oct 2022 09:25:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D077D10E102
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 09:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666085098; x=1697621098;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=UMCO5mJkxdgXG8Vg18aqKASsvHeMgG5yqkmJ96uzOXg=;
 b=l5SorvrEMSVPQEkHbidCeLQkxoJsRSKKV2rf3F3IF2b8Hyji3FYPEsqv
 sA7AbdZeypjvn1SeNcoDZOS/Evztp8SmVPBfywVBSRXZqR+pJhH4JLwGn
 ugMy0tpNYJQ8Dvj5JPIO7/KdYuLCAXgT553AQzKFSMgFOK2eBVBtg42Ih
 OF12srV2qtRwg/Pf4L99oudETV4pOF0SZpBz0rsfxFlVB20Yd8CjDwYQF
 75eEr+om2koqz2b95k3jvAR8jA6s/16GxwT/gsMheAnCbMWcuAVx0QH7m
 mUik5zpmYiQ8ua1UdthdAYmOiwDoqsX4cRANWGOVBsZIQYFIBY+Ix+UUU Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="306033084"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="306033084"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 02:24:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="771119489"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="771119489"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga001.fm.intel.com with SMTP; 18 Oct 2022 02:24:54 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 18 Oct 2022 12:24:53 +0300
Date: Tue, 18 Oct 2022 12:24:53 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 2/2] drm/connector: send hotplug uevent on connector
 cleanup
Message-ID: <Y05w5U0CAbrdA10S@intel.com>
References: <20221017153150.60675-1-contact@emersion.fr>
 <20221017153150.60675-2-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221017153150.60675-2-contact@emersion.fr>
X-Patchwork-Hint: comment
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@redhat.com>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 17, 2022 at 03:32:01PM +0000, Simon Ser wrote:
> A typical DP-MST unplug removes a KMS connector. However care must
> be taken to properly synchronize with user-space. The expected
> sequence of events is the following:
> 
> 1. The kernel notices that the DP-MST port is gone.
> 2. The kernel marks the connector as disconnected, then sends a
>    uevent to make user-space re-scan the connector list.
> 3. User-space notices the connector goes from connected to disconnected,
>    disables it.
> 4. Kernel handles the the IOCTL disabling the connector. On success,
>    the very last reference to the struct drm_connector is dropped and
>    drm_connector_cleanup() is called.
> 5. The connector is removed from the list, and a uevent is sent to tell
>    user-space that the connector disappeared.
> 
> The very last step was missing. As a result, user-space thought the
> connector still existed and could try to disable it again. Since the
> kernel no longer knows about the connector, that would end up with
> EINVAL and confused user-space.

So is the uevent sent by the mst delayed destroy work
useless now, or what is going on there?

> 
> Fix this by sending a hotplug uevent from drm_connector_cleanup().
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: stable@vger.kernel.org
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Jonas Ådahl <jadahl@redhat.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index e3142c8142b3..90dad87e9ad0 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -582,6 +582,9 @@ void drm_connector_cleanup(struct drm_connector *connector)
>  	mutex_destroy(&connector->mutex);
>  
>  	memset(connector, 0, sizeof(*connector));
> +
> +	if (dev->registered)
> +		drm_sysfs_hotplug_event(dev);
>  }
>  EXPORT_SYMBOL(drm_connector_cleanup);
>  
> -- 
> 2.38.0
> 

-- 
Ville Syrjälä
Intel
