Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4172F4A5091
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 21:52:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE0B410E41F;
	Mon, 31 Jan 2022 20:52:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D3D710E451
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 20:52:39 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id db83d543-82d7-11ec-b20b-0050568c148b;
 Mon, 31 Jan 2022 20:53:35 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id BAB6F194B17;
 Mon, 31 Jan 2022 21:52:37 +0100 (CET)
Date: Mon, 31 Jan 2022 21:52:33 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 1/4] drm: Add I2C connector type
Message-ID: <YfhMESTylI1NTKDg@ravnborg.org>
References: <20220131201225.2324984-1-javierm@redhat.com>
 <20220131201225.2324984-2-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220131201225.2324984-2-javierm@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 31, 2022 at 09:12:21PM +0100, Javier Martinez Canillas wrote:
> There isn't a connector type for display controllers accesed through I2C,
> most drivers use DRM_MODE_CONNECTOR_Unknown or DRM_MODE_CONNECTOR_VIRTUAL.
> 
> Add an I2C connector type to match the actual connector.
> 
> As Noralf Trønnes mentions in commit fc06bf1d76d6 ("drm: Add SPI connector
> type"), user-space should be able to cope with a connector type that does
> not yet understand.
> 
> Tested with `modetest -M ssd1307 -c` and shows the connector as unknown-1.
I had expected unknown-21??

> 
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
> 
>  drivers/gpu/drm/drm_connector.c | 1 +
>  include/uapi/drm/drm_mode.h     | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index a50c82bc2b2f..975a7525a508 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -105,6 +105,7 @@ static struct drm_conn_prop_enum_list drm_connector_enum_list[] = {
>  	{ DRM_MODE_CONNECTOR_WRITEBACK, "Writeback" },
>  	{ DRM_MODE_CONNECTOR_SPI, "SPI" },
>  	{ DRM_MODE_CONNECTOR_USB, "USB" },
> +	{ DRM_MODE_CONNECTOR_I2C, "I2C" },
>  };
>  
>  void drm_connector_ida_init(void)
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index e1e351682872..d6d6288242db 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -421,6 +421,7 @@ enum drm_mode_subconnector {
>  #define DRM_MODE_CONNECTOR_WRITEBACK	18
>  #define DRM_MODE_CONNECTOR_SPI		19
>  #define DRM_MODE_CONNECTOR_USB		20
> +#define DRM_MODE_CONNECTOR_I2C		21
>  
>  /**
>   * struct drm_mode_get_connector - Get connector metadata.
> -- 
> 2.34.1
