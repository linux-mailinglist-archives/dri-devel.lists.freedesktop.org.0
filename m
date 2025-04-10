Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3611A84D3C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 21:41:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB35C10EA6C;
	Thu, 10 Apr 2025 19:41:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jThzMrpt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FD1E10EA6D;
 Thu, 10 Apr 2025 19:41:14 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 436D1496;
 Thu, 10 Apr 2025 21:39:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1744313954;
 bh=gApCB9zDj21uPasiuBjC0Wsj5Q1jjZkIFqZxl7WupEs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jThzMrpt/vs+OHImLU74rzY7H8ltkVMrbdoKwONTsfSN05KMIYO2a1lO1NVHAwNgB
 5bDfszKnXnnmvoVcRX2srWVmVChTuD3AjvpQ3Z/f6uU7rke+tXXdxEhPqnmRGYBG/e
 btu9bPeZ/Qu7ATYafZztAK9DkVqhCktvFK7j3Uyo=
Date: Thu, 10 Apr 2025 22:40:47 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 19/19] drm: Make passing of format info to
 drm_helper_mode_fill_fb_struct() mandatory
Message-ID: <20250410194047.GG27834@pendragon.ideasonboard.com>
References: <20250410163218.15130-1-ville.syrjala@linux.intel.com>
 <20250410163218.15130-20-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250410163218.15130-20-ville.syrjala@linux.intel.com>
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

Hi Ville,

Thank you for the patch.

On Thu, Apr 10, 2025 at 07:32:18PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Now that everyone passes along the format info to
> drm_helper_mode_fill_fb_struct() we can make this behaviour
> mandatory and drop the extra lookup.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/drm_modeset_helper.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_modeset_helper.c b/drivers/gpu/drm/drm_modeset_helper.c
> index ae2a83ecb1cf..3c153d420822 100644
> --- a/drivers/gpu/drm/drm_modeset_helper.c
> +++ b/drivers/gpu/drm/drm_modeset_helper.c
> @@ -86,8 +86,7 @@ void drm_helper_mode_fill_fb_struct(struct drm_device *dev,
>  	int i;
>  
>  	fb->dev = dev;
> -	fb->format = info ? : drm_get_format_info(dev, mode_cmd->pixel_format,
> -						  mode_cmd->modifier[0]);
> +	fb->format = info;
>  	fb->width = mode_cmd->width;
>  	fb->height = mode_cmd->height;
>  	for (i = 0; i < 4; i++) {

-- 
Regards,

Laurent Pinchart
