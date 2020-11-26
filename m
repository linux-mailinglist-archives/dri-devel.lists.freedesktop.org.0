Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F06E2C5403
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 13:35:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E368689358;
	Thu, 26 Nov 2020 12:35:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E791689358
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 12:35:09 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id C301E5C2CC6;
 Thu, 26 Nov 2020 13:35:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1606394107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a/ohOrDEQhSdItJx+X/QZcIwP1mWXT7GQN3gdhNgxpA=;
 b=A7MzKdkoErPN9WYI5x9tQmX3y0P65c9PdXXMr2sub6xRwqDUVWQbJ4Umw9wGW8Mo3MhsiB
 gdNUqx5OZ53IrlUtsbOVrGI6MUVIh6fo3dIbnfeSkY0IZu0wKDqK3A44kXTI6soah394Kl
 ze3UgwSHCe0f7mQQFlfS7X5Db8Ls+wY=
MIME-Version: 1.0
Date: Thu, 26 Nov 2020 13:35:07 +0100
From: Stefan Agner <stefan@agner.ch>
To: Daniel Abrecht <freedesktop-linux-dri-devel@nodmarc.danielabrecht.ch>
Subject: Re: [PATCH v2 RESEND] drm: mxsfb: Implement .format_mod_supported
In-Reply-To: <2a99ffffc2378209307e0992a6e97e70@nodmarc.danielabrecht.ch>
References: <2a99ffffc2378209307e0992a6e97e70@nodmarc.danielabrecht.ch>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <df99d516583e710e947f17892da27ddb@agner.ch>
X-Sender: stefan@agner.ch
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

On 2020-11-08 22:00, Daniel Abrecht wrote:
> This will make sure applications which use the IN_FORMATS blob
> to figure out which modifiers they can use will pick up the
> linear modifier which is needed by mxsfb. Such applications
> will not work otherwise if an incompatible implicit modifier
> ends up being selected.
> 
> Before commit ae1ed0093281 ("drm: mxsfb: Stop using DRM simple
> display pipeline helper"), the DRM simple display pipeline
> helper took care of this.
> 
> Signed-off-by: Daniel Abrecht <public@danielabrecht.ch>
> Fixes: ae1ed0093281 ("drm: mxsfb: Stop using DRM simple display
> pipeline helper")

Reviewed-by: Stefan Agner <stefan@agner.ch>

I allowed myself to update the author email to the one used in the
Signed-off-by line as checkpatch.pl printed a warning.

Applied to drm-misc-fixes. Thanks!

--
Stefan

> ---
>  drivers/gpu/drm/mxsfb/mxsfb_kms.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> index 956f631997f2..fc4b1626261b 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> @@ -484,6 +484,13 @@ static void
> mxsfb_plane_overlay_atomic_update(struct drm_plane *plane,
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
>  static const struct drm_plane_helper_funcs mxsfb_plane_primary_helper_funcs = {
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
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
