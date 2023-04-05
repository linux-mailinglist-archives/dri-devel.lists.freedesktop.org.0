Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC236D729E
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 05:05:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA1E910E077;
	Wed,  5 Apr 2023 03:05:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD31C10E077
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 03:05:11 +0000 (UTC)
Received: from pendragon.ideasonboard.com (fp76f193f3.tkyc206.ap.nuro.jp
 [118.241.147.243])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D401C905;
 Wed,  5 Apr 2023 05:05:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1680663910;
 bh=7Q6te+srG/YQdMjnP9zmGIwnmU0iy8ZmFiqkBUkPSuk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Gg/FhMUGg5AYJeuHo5MXTd29ntJknBw+mZ2gjT3cFKXTjhCFIcLSan7RalR6gZBWi
 MOnXoM5d8bJWZ/iV5qG8v8wlDtqSwjfRbBIIXPMpjc1Aq9DfIlfVxvaLnSdhe0RAGP
 ZMGiR/vXU0i57pYqnkixScAUM83zMoUScls+Ua/o=
Date: Wed, 5 Apr 2023 06:05:16 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 1/5] drm: shmobile: Use %p4cc to print fourcc codes
Message-ID: <20230405030516.GG9915@pendragon.ideasonboard.com>
References: <cover.1680273039.git.geert+renesas@glider.be>
 <1912536b0972568efc3d4f96c89de96b2abd7510.1680273039.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1912536b0972568efc3d4f96c89de96b2abd7510.1680273039.git.geert+renesas@glider.be>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

Thank you for the patch.

On Fri, Mar 31, 2023 at 04:48:07PM +0200, Geert Uytterhoeven wrote:
> Replace the printing of hexadecimal fourcc format codes by
> pretty-printed format names, using the "%p4cc" format specifier.

I really like %p4cc :-) I makes things much neater.

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/gpu/drm/shmobile/shmob_drm_crtc.c | 4 ++--
>  drivers/gpu/drm/shmobile/shmob_drm_kms.c  | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
> index d354ab3077cecf94..713a7612244c647a 100644
> --- a/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
> +++ b/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
> @@ -355,8 +355,8 @@ static int shmob_drm_crtc_mode_set(struct drm_crtc *crtc,
>  
>  	format = shmob_drm_format_info(crtc->primary->fb->format->format);
>  	if (format == NULL) {
> -		dev_dbg(sdev->dev, "mode_set: unsupported format %08x\n",
> -			crtc->primary->fb->format->format);
> +		dev_dbg(sdev->dev, "mode_set: unsupported format %p4cc\n",
> +			&crtc->primary->fb->format->format);
>  		return -EINVAL;
>  	}
>  
> diff --git a/drivers/gpu/drm/shmobile/shmob_drm_kms.c b/drivers/gpu/drm/shmobile/shmob_drm_kms.c
> index 60a2c8d8a0d947d2..3c5fe3bc183c7c13 100644
> --- a/drivers/gpu/drm/shmobile/shmob_drm_kms.c
> +++ b/drivers/gpu/drm/shmobile/shmob_drm_kms.c
> @@ -96,8 +96,8 @@ shmob_drm_fb_create(struct drm_device *dev, struct drm_file *file_priv,
>  
>  	format = shmob_drm_format_info(mode_cmd->pixel_format);
>  	if (format == NULL) {
> -		dev_dbg(dev->dev, "unsupported pixel format %08x\n",
> -			mode_cmd->pixel_format);
> +		dev_dbg(dev->dev, "unsupported pixel format %p4cc\n",
> +			&mode_cmd->pixel_format);
>  		return ERR_PTR(-EINVAL);
>  	}
>  

-- 
Regards,

Laurent Pinchart
