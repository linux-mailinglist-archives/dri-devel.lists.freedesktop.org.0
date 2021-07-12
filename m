Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CAF3C60D4
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 18:50:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A459889AEA;
	Mon, 12 Jul 2021 16:50:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3140E89AEA
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 16:50:53 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 33622CC;
 Mon, 12 Jul 2021 18:50:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1626108651;
 bh=+t8lSKMlrb/3E4DhDYLs266oy4TOU8BHEmxESYaNt8I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pieGt0ks0vsh7tOXCU6EM+lcz8G3MzzFccBJJnT/b5ufqCCDusGqc2R5SuqS5//29
 pHi/RuF7RFsy5Kk37tHBmOO25wApXpjMXrepmesbJpg8L9UV+eMlx6Opni6mcpNKIB
 WHpc0Eb8LZOJgfZ4tpeSrSIY4PB0jwf/T5qW8Dj4=
Date: Mon, 12 Jul 2021 19:50:04 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH] drm/of: free the iterator object on failure
Message-ID: <YOxyvIoJcZFAgUz5@pendragon.ideasonboard.com>
References: <20210712155758.48286-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210712155758.48286-1-steven.price@arm.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Biju Das <biju.das.jz@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Steven,

Thank you for the patch.

On Mon, Jul 12, 2021 at 04:57:58PM +0100, Steven Price wrote:
> When bailing out due to the sanity check the iterator value needs to be
> freed because the early return prevents for_each_child_of_node() from
> doing the dereference itself.
> 
> Fixes: 4ee48cc5586b ("drm: of: Fix double-free bug")

I don't think the Fixes tag is correct, the issue was already present
before 4ee48cc5586b. The fix looks right though.

> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>  drivers/gpu/drm/drm_of.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> Daniel's email[1] made me take a look at this function and it appears
> that for_each_child_of_node()'s interface had caused a bad bug fix due
> to the hidden reference counting in the iterator.
> 
> [1] https://lore.kernel.org/r/YOxQ5TbkNrqCGBDJ%40phenom.ffwll.local
> 
> diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
> index 197c57477344..997b8827fed2 100644
> --- a/drivers/gpu/drm/drm_of.c
> +++ b/drivers/gpu/drm/drm_of.c
> @@ -331,8 +331,10 @@ static int drm_of_lvds_get_remote_pixels_type(
>  		 * configurations by passing the endpoints explicitly to
>  		 * drm_of_lvds_get_dual_link_pixel_order().
>  		 */
> -		if (!current_pt || pixels_type != current_pt)
> +		if (!current_pt || pixels_type != current_pt) {
> +			of_node_put(endpoint);
>  			return -EINVAL;
> +		}
>  	}
>  
>  	return pixels_type;

-- 
Regards,

Laurent Pinchart
