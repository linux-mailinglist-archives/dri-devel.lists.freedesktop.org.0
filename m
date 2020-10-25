Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEC5298268
	for <lists+dri-devel@lfdr.de>; Sun, 25 Oct 2020 16:52:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD2C6E9D6;
	Sun, 25 Oct 2020 15:52:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 532AE6E9D6
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 15:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 3C227FB03;
 Sun, 25 Oct 2020 16:52:03 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XhRdH8LnH_Y6; Sun, 25 Oct 2020 16:52:02 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 437DD4434A; Sun, 25 Oct 2020 16:52:01 +0100 (CET)
Date: Sun, 25 Oct 2020 16:52:01 +0100
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Daniel Abrecht <freedesktop-linux-dri-devel@danielabrecht.ch>
Subject: Re: [PATCH] Implement .format_mod_supported in mxsfb
Message-ID: <20201025155201.GA25070@bogon.m.sigxcpu.org>
References: <96f62304bad202e4f920d2f4ed62c485@abrecht.li>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <96f62304bad202e4f920d2f4ed62c485@abrecht.li>
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
Cc: Marek Vasut <marex@denx.de>, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,
On Sat, Oct 24, 2020 at 04:59:16PM +0000, Daniel Abrecht wrote:
> This will make sure applications which use the IN_FORMATS blob
> to figure out which modifiers they can use will pick up the
> linear modifier which is needed by mxsfb. Such applications
> will not work otherwise if an incompatible implicit modifier
> ends up being selected.

Since this got broken by the switch away for the simple display
pipeline helper (ae1ed0093281939b80664a687689f12436c0e874) could
you add a fixes tag?
Cheers,
 -- Guido

> 
> Signed-off-by: Daniel Abrecht <public@danielabrecht.ch>
> ---
>  drivers/gpu/drm/mxsfb/mxsfb_kms.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> index 956f631997f2..fc4b1626261b 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> @@ -484,6 +484,13 @@ static void mxsfb_plane_overlay_atomic_update(struct
> drm_plane *plane,
>  	writel(ctrl, mxsfb->base + LCDC_AS_CTRL);
>  }
> 
> +static bool mxsfb_format_mod_supported(struct drm_plane *plane,
> +				       uint32_t format,
> +				       uint64_t modifier)
> +{
> +	return modifier == DRM_FORMAT_MOD_LINEAR;
> +}
> +
>  static const struct drm_plane_helper_funcs mxsfb_plane_primary_helper_funcs
> = {
>  	.atomic_check = mxsfb_plane_atomic_check,
>  	.atomic_update = mxsfb_plane_primary_atomic_update,
> @@ -495,6 +502,7 @@ static const struct drm_plane_helper_funcs
> mxsfb_plane_overlay_helper_funcs = {
>  };
> 
>  static const struct drm_plane_funcs mxsfb_plane_funcs = {
> +	.format_mod_supported	= mxsfb_format_mod_supported,
>  	.update_plane		= drm_atomic_helper_update_plane,
>  	.disable_plane		= drm_atomic_helper_disable_plane,
>  	.destroy		= drm_plane_cleanup,
> -- 
> 2.20.1
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
