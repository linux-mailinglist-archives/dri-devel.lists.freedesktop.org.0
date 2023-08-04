Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F64B77024B
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 15:51:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E8D10E70C;
	Fri,  4 Aug 2023 13:50:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD9210E70B
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 13:50:29 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C72722E4;
 Fri,  4 Aug 2023 15:49:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1691156963;
 bh=PzI4mzdQbBo7dqgyXhXRYV0kIZNKcUK5DdEZVp1gg1I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HwnZSx2cwso4DOSftqjTWgl9+XQlM0Kj4HYaMGACN+HhVb8W/7DjF33x68VfRYKMP
 w1Z+hXa2GLoUP8LSC2hhk7USsZiXlm8d9+UDxYAf4AwQWXB+8YcD34Gvm3ykTH99lq
 ST/63o/yLnXNdlqdAh2VFoCt+/Y3L4Vn9r79JALc=
Date: Fri, 4 Aug 2023 16:50:32 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 1/2] drm/drm_file: fix use of uninitialized variable
Message-ID: <20230804135032.GG12951@pendragon.ideasonboard.com>
References: <20230804-uninit-fixes-v1-0-a60772c04db5@ideasonboard.com>
 <20230804-uninit-fixes-v1-1-a60772c04db5@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230804-uninit-fixes-v1-1-a60772c04db5@ideasonboard.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Francesco Dolcini <francesco.dolcini@toradex.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 04, 2023 at 01:57:39PM +0300, Tomi Valkeinen wrote:
> smatch reports:
> 
> drivers/gpu/drm/drm_file.c:967 drm_show_memory_stats() error: uninitialized symbol 'supported_status'.
> 
> 'supported_status' is only set in one code path. I'm not familiar with
> the code to say if that path will always be ran in real life, but
> whether that is the case or not, I think it is good to initialize
> 'supported_status' to 0 to silence the warning (and possibly fix a bug).
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/drm_file.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 883d83bc0e3d..cc06e1836bf5 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -924,7 +924,7 @@ void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
>  {
>  	struct drm_gem_object *obj;
>  	struct drm_memory_stats status = {};
> -	enum drm_gem_object_status supported_status;
> +	enum drm_gem_object_status supported_status = 0;
>  	int id;
>  
>  	spin_lock(&file->table_lock);
> 

-- 
Regards,

Laurent Pinchart
