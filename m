Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAF573BAEE
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 16:59:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F15010E0AC;
	Fri, 23 Jun 2023 14:59:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4108D10E0AC
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 14:59:36 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 57D41440;
 Fri, 23 Jun 2023 16:58:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1687532338;
 bh=UNF4vGYdun0BL/GAZBLgK6Ry2y6OLxCuHlXyuLsgc14=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PxgNCOqeedk+T5onFKGHrGR1B6uHo09Rr5XjVEWKP2Vw6TDJg1PZa9rz0LRBIGc0U
 LSX3ToThkvkqZWAac65PeBC9maGNmSM0k7KPX4JI9wvUP3wkXwBAt8ud3cgtn+glT8
 XqerpJx/S9RVuZUY9gDmuBYdtxdMHT5S1re1ZdX0=
Date: Fri, 23 Jun 2023 17:59:33 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 03/39] drm: renesas: shmobile: Fix overlay plane disable
Message-ID: <20230623145933.GG2112@pendragon.ideasonboard.com>
References: <cover.1687423204.git.geert+renesas@glider.be>
 <9feb39aaab796fc4b59c6c83c3d96757482f714d.1687423204.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9feb39aaab796fc4b59c6c83c3d96757482f714d.1687423204.git.geert+renesas@glider.be>
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
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

Thank you for the patch.

On Thu, Jun 22, 2023 at 11:21:15AM +0200, Geert Uytterhoeven wrote:
> Merely writing zero to the CHn Source Image Format Register is not
> sufficient to disable a plane, as the programmed register value is not
> propagated immediately to the current side.  This can be seen when using
> the -P option of modetest: the extra plane is displayed correctly, but
> does not disappear after exit.
> 
> Fix this by doing the full update dance using the Blend Control
> Register, like is done when enabling the plane.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> index 850986cee848226a..0e34573c3cb3d032 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> @@ -215,7 +215,10 @@ static int shmob_drm_plane_disable(struct drm_plane *plane,
>  
>  	splane->format = NULL;
>  
> +	lcdc_write(sdev, LDBCR, LDBCR_UPC(splane->index));
>  	lcdc_write(sdev, LDBnBSIFR(splane->index), 0);
> +	lcdc_write(sdev, LDBCR,
> +		   LDBCR_UPF(splane->index) | LDBCR_UPD(splane->index));
>  	return 0;
>  }
>  

-- 
Regards,

Laurent Pinchart
