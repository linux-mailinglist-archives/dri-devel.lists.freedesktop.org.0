Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2947A5A32C5
	for <lists+dri-devel@lfdr.de>; Sat, 27 Aug 2022 01:48:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4024B10EA95;
	Fri, 26 Aug 2022 23:47:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3805C10EA95
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 23:47:54 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 67B47120A;
 Sat, 27 Aug 2022 01:47:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1661557672;
 bh=yojX7helFPwdQ0ybslJkhCGLk3TEOcC6EVBoCDsv0ho=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FMREvxhhnm4yhAtcIvFev1iid6oouEhGBiTrjb3Lxoee81K6AuGJc8F1ShS6khxlW
 zuM15kIU8XXWPUtYfyFCAesqaZbN/6rHG1uekUT8WDlVCFBTqqumfcWLJhuQjdEql4
 0agmueSMIxvyst2AggyQWt6qhCrjPobWWckoJ8Us=
Date: Sat, 27 Aug 2022 02:47:45 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 2/2] drm: rcar-du: Use %p4cc to print 4CC format
Message-ID: <YwlboWrxzP7JWeg/@pendragon.ideasonboard.com>
References: <20220825103905.2450049-1-biju.das.jz@bp.renesas.com>
 <20220825103905.2450049-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220825103905.2450049-2-biju.das.jz@bp.renesas.com>
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

Thank you for the patch.

On Thu, Aug 25, 2022 at 11:39:05AM +0100, Biju Das wrote:
> Replace use of struct rcar_du_format_info with %p4cc for printing
> 4CC formats.

The code change looks good, but doesn't match the commit message. You're
not replacing usage of struct rcar_du_format_info. I propose the
following commit message:

Use the %p4cc format specifier to print 4CCs, which will provide a more
readable message than the raw hex value.

> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> index 21881fb5e84a..8c2719efda2a 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> @@ -405,8 +405,8 @@ rcar_du_fb_create(struct drm_device *dev, struct drm_file *file_priv,
>  
>  	format = rcar_du_format_info(mode_cmd->pixel_format);
>  	if (format == NULL) {
> -		dev_dbg(dev->dev, "unsupported pixel format %08x\n",
> -			mode_cmd->pixel_format);
> +		dev_dbg(dev->dev, "unsupported pixel format %p4cc\n",
> +			&mode_cmd->pixel_format);
>  		return ERR_PTR(-EINVAL);
>  	}
>  

There are two other occurrences:

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
index 26b25ca58968..83631ee2fff1 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
@@ -626,8 +626,8 @@ int __rcar_du_plane_atomic_check(struct drm_plane *plane,

 	*format = rcar_du_format_info(state->fb->format->format);
 	if (*format == NULL) {
-		dev_dbg(dev->dev, "%s: unsupported format %08x\n", __func__,
-			state->fb->format->format);
+		dev_dbg(dev->dev, "%s: unsupported format %p4cc\n", __func__,
+			&state->fb->format->format);
 		return -EINVAL;
 	}

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
index 25f50a297c11..8cd37d7b8ae2 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
@@ -166,8 +166,8 @@ static int rcar_du_wb_enc_atomic_check(struct drm_encoder *encoder,

 	wb_state->format = rcar_du_format_info(fb->format->format);
 	if (wb_state->format == NULL) {
-		dev_dbg(dev->dev, "%s: unsupported format %08x\n", __func__,
-			fb->format->format);
+		dev_dbg(dev->dev, "%s: unsupported format %p4cc\n", __func__,
+			&fb->format->format);
 		return -EINVAL;
 	}

I can add these changes to the patch and update the commit message when
applying if you're fine with that. In that case,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
Regards,

Laurent Pinchart
