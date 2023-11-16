Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3724E7ED8DC
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 02:24:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 620AE10E2CA;
	Thu, 16 Nov 2023 01:24:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12F4210E2CA
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 01:24:52 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D8B777FC;
 Thu, 16 Nov 2023 02:24:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1700097864;
 bh=J+DT9ecjilclWpyd8Y0psDWo/qQgGyJqD/UaAfvfNV4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UOduQDD1PDuphUBeJg0vEgXlkWBzxsjYXcqSJZhTFcq5xnSpYEh3tNe6x5vofENAz
 YsWdcqrz1RzjsWis9UBvZm/rbogpBHnZaM0xj9kHVP8omFqD1/0w+iRfFiXVaGJ+w1
 MtWmlIcVM3NqKHylUhQsr0BNgcqLQyjArTzVgXJA=
Date: Thu, 16 Nov 2023 03:24:55 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH] drm: rcar-du: Fix memory leak in rcar_du_vsps_init()
Message-ID: <20231116012455.GA20846@pendragon.ideasonboard.com>
References: <20231115150932.107796-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231115150932.107796-1-biju.das.jz@bp.renesas.com>
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
Cc: Biju Das <biju.das.au@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

Thank you for the patch.

On Wed, Nov 15, 2023 at 03:09:32PM +0000, Biju Das wrote:
> The rcar_du_vsps_init() doesn't free the np allocated by
> of_parse_phandle_with_fixed_args() for the non-error case.
> 
> Fix memory leak for the non-error case.

Good catch.

> Fixes: 3e81374e2014 ("drm: rcar-du: Support multiple sources from the same VSP")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> index 70d8ad065bfa..5cd54ea33313 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> @@ -747,8 +747,6 @@ static int rcar_du_vsps_init(struct rcar_du_device *rcdu)
>  			goto error;
>  	}
>  
> -	return 0;
> -
>  error:

If the code path is used in non-error cases as well, I'd prefer renaming
it to "done".

>  	for (i = 0; i < ARRAY_SIZE(vsps); ++i)
>  		of_node_put(vsps[i].np);

The next line is

	return ret;

When reached in the non-error case, ret is guaranteed to be
non-negative, as it has been assigned to the return value of
rcar_du_vsp_init(), with an

	if (ret < 0)

error check following it. While rcar_du_vsp_init() doesn't return a
positive value today, the code here would break in a way that may not be
immediately visible during review if this changed. I thus recommend
either assigning

	ret = 0;

in the success case, just before the "done" label, or changing the

	if (ret < 0)

test with

	if (ret)

after the call to rcar_du_vsp_init(). I think I have a preference for
the latter.

-- 
Regards,

Laurent Pinchart
