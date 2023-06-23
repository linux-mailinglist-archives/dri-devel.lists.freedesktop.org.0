Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D68F773BD3C
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 18:53:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B96E910E683;
	Fri, 23 Jun 2023 16:53:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 261DA89580
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 16:53:29 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2CF28440;
 Fri, 23 Jun 2023 18:52:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1687539171;
 bh=0o5JXOyLxku6NoKd+xArlaIIcndsIh5cFOxDa+QQXmE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UkSy1I1YN/pSgE1/ghr0KqD6SzCfxezy5+NgpQygi8qcGa2hwSsE42cn8R7HCYRXz
 51hNQt5eInxYwMC2MgpKau/QRneOArV4riw8C9N+iCCxGcrrcA9drz00cObYia2agT
 4g2eAEgqQ7E055GmF83ChaZpGss66M+Eauk7bWgI=
Date: Fri, 23 Jun 2023 19:53:26 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 28/39] drm: renesas: shmobile: Use drm_crtc_handle_vblank()
Message-ID: <20230623165326.GF2112@pendragon.ideasonboard.com>
References: <cover.1687423204.git.geert+renesas@glider.be>
 <7b6ffa43307522833103fe29ec6a084b7d621a16.1687423204.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7b6ffa43307522833103fe29ec6a084b7d621a16.1687423204.git.geert+renesas@glider.be>
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

On Thu, Jun 22, 2023 at 11:21:40AM +0200, Geert Uytterhoeven wrote:
> Replace the call to the legacy drm_handle_vblank() function with a call
> to the new drm_crtc_handle_vblank() helper.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> index c98e2bdd888c3274..6eaf2c5a104f451a 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> @@ -86,7 +86,7 @@ static irqreturn_t shmob_drm_irq(int irq, void *arg)
>  	spin_unlock_irqrestore(&sdev->irq_lock, flags);
>  
>  	if (status & LDINTR_VES) {
> -		drm_handle_vblank(dev, 0);
> +		drm_crtc_handle_vblank(&sdev->crtc.base);
>  		shmob_drm_crtc_finish_page_flip(&sdev->crtc);
>  	}
>  

-- 
Regards,

Laurent Pinchart
