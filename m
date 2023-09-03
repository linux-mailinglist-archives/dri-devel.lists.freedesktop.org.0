Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F71C790CC4
	for <lists+dri-devel@lfdr.de>; Sun,  3 Sep 2023 17:23:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD1CE10E08B;
	Sun,  3 Sep 2023 15:23:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9AA610E08B
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Sep 2023 15:23:51 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A8C6B6B5;
 Sun,  3 Sep 2023 17:22:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1693754544;
 bh=jqSdoyKWx526+FF9/nQYZnWif025tFD5VF+7BR3PYNE=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=SW5/2tVB7/Z4Beu38xqK1QnIUMEXuzp498iDu6OmIF7u+24BgHYk8ADYPV1nOg3yy
 r6Dv11y1hLPmSKhUqFycrE/4KtrEGYzcYYbKxECqr87PWdUQbVTvV0M/7d2XzQN07D
 UPqf4BAy2XRQUCFo5eD19OwjxlkfF9QUUqq/HYAc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230903133709.8049-1-adiupina@astralinux.ru>
References: <20230903133709.8049-1-adiupina@astralinux.ru>
Subject: Re: [PATCH] drm/rcar-du: fix comment to rcar_du_group_get()
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Alexandra Diupina <adiupina@astralinux.ru>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Sun, 03 Sep 2023 16:23:46 +0100
Message-ID: <169375462648.1779741.7610374659365330420@ping.linuxembedded.co.uk>
User-Agent: alot/0.10
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
Cc: Alexandra Diupina <adiupina@astralinux.ru>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, lvc-project@linuxtesting.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alexandra

Quoting Alexandra Diupina (2023-09-03 14:37:09)
> rcar_du_group_get() never returns a negative
> error code (always returns 0), so change
> the comment about returned value

If so, then perhaps this may as well become a void return and remove the
return 0.

That could then clean up some redundant error path handling in
drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c too ?

Still, this does correct the documentation to match the implementation
as it stands so... for that ...

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

But removing an unused error path seems like a worthy clean up
opportunity too.

>=20
> Fixes: cb2025d2509f ("drm/rcar-du: Introduce CRTCs groups")

Hrm ... well the documented behaviour was the same even before this
commit in rcar_du_get(), so perhaps it was documenting the intent... But
it does seem that the return code has been redundant for quite some time
so perhaps it's just not required.


--
Kieran


> Signed-off-by: Alexandra Diupina <adiupina@astralinux.ru>
> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c b/drivers/gp=
u/drm/renesas/rcar-du/rcar_du_group.c
> index 2ccd2581f544..499d4e56c32d 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
> @@ -200,7 +200,7 @@ static void rcar_du_group_setup(struct rcar_du_group =
*rgrp)
>   *
>   * This function must be called with the DRM mode_config lock held.
>   *
> - * Return 0 in case of success or a negative error code otherwise.
> + * Always return 0.
>   */
>  int rcar_du_group_get(struct rcar_du_group *rgrp)
>  {
> --=20
> 2.30.2
>
