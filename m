Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8730469EF7A
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 08:39:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37CF210E3E8;
	Wed, 22 Feb 2023 07:39:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B9E10E3E8
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 07:39:10 +0000 (UTC)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi
 [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9059D4E1;
 Wed, 22 Feb 2023 08:39:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1677051548;
 bh=t+TMtD5Zn03WHd6qsYl9LuMZ9DpfHfQ3aY7iciJ4+jE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=EGYTGnyHxX47k+womJZ3Tf8JAjTVoU5zAifAei9u5eIsc7wKuYR4hAyTceLbIweYd
 tiYytMnRi+kGEm76sNHaPt45bXki5YZzPKAcPAUr8ae538Mdbm6iZZ0iJqlkyb+7En
 XVoGTlDSWv7xaXDv1/tvlJM8tN1Ec4wezlGSdYzU=
Message-ID: <118bf036-de06-959f-49cc-6de0233100a0@ideasonboard.com>
Date: Wed, 22 Feb 2023 09:39:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] drm: rcar-du: Disable alpha blending for DU planes
 used with VSP
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20230222050623.29080-1-laurent.pinchart+renesas@ideasonboard.com>
 <20230222050623.29080-3-laurent.pinchart+renesas@ideasonboard.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230222050623.29080-3-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/02/2023 07:06, Laurent Pinchart wrote:
> When the input to a DU channel comes from a VSP, the DU doesn't perform
> any blending operation. Select XRGB8888 instead of ARGB8888 to ensure
> that the corresponding registers don't get written with invalid values.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>   drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> index fe90be51d64e..45c05d0ffc70 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> @@ -73,7 +73,7 @@ void rcar_du_vsp_enable(struct rcar_du_crtc *crtc)
>   			.src.y2 = mode->vdisplay << 16,
>   			.zpos = 0,
>   		},
> -		.format = rcar_du_format_info(DRM_FORMAT_ARGB8888),
> +		.format = rcar_du_format_info(DRM_FORMAT_XRGB8888),
>   		.source = RCAR_DU_PLANE_VSPD1,
>   		.colorkey = 0,
>   	};

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

