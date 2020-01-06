Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D71661316AB
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 18:23:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A9B06E4BB;
	Mon,  6 Jan 2020 17:23:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FD386E4AE;
 Mon,  6 Jan 2020 17:23:04 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Jan 2020 09:23:03 -0800
X-IronPort-AV: E=Sophos;i="5.69,403,1571727600"; d="scan'208";a="370314321"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com) ([10.7.196.150])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Jan 2020 09:23:03 -0800
Date: Mon, 6 Jan 2020 09:23:03 -0800
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [Intel-gfx] [PATCH v2 2/2] drm/connector: Hookup the new
 drm_cmdline_mode panel_orientation member (v2)
Message-ID: <20200106172303.GA3829627@intel.com>
References: <20200105155120.96466-1-hdegoede@redhat.com>
 <20200105155120.96466-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200105155120.96466-2-hdegoede@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jan 05, 2020 at 04:51:20PM +0100, Hans de Goede wrote:
> If the new video=... panel_orientation option is set for a connector, honor
> it and setup a matching "panel orientation" property on the connector.
> 
> Changes in v2:
> -Improve DRM_INFO message to make it clear that the panel_orientation is
>  being forced from the commandline

Thanks

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> BugLink: https://gitlab.freedesktop.org/plymouth/plymouth/merge_requests/83
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index de5031c4aa49..f632ca05960e 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -140,6 +140,13 @@ static void drm_connector_get_cmdline_mode(struct drm_connector *connector)
>  		connector->force = mode->force;
>  	}
>  
> +	if (mode->panel_orientation != DRM_MODE_PANEL_ORIENTATION_UNKNOWN) {
> +		DRM_INFO("cmdline forces connector %s panel_orientation to %d\n",
> +			 connector->name, mode->panel_orientation);
> +		drm_connector_set_panel_orientation(connector,
> +						    mode->panel_orientation);
> +	}
> +
>  	DRM_DEBUG_KMS("cmdline mode for connector %s %s %dx%d@%dHz%s%s%s\n",
>  		      connector->name, mode->name,
>  		      mode->xres, mode->yres,
> -- 
> 2.24.1
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
