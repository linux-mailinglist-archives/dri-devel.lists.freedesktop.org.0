Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 425C1697639
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 07:18:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F2E10E139;
	Wed, 15 Feb 2023 06:18:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64E1E10E139
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 06:18:38 +0000 (UTC)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi
 [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9BA3E27C;
 Wed, 15 Feb 2023 07:18:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1676441915;
 bh=lIC2L+gftRpP8lEiUF+76honibdcsHuUznoGrRYsaM4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GkyAPZLvp//akR4sHa4eaBt/guzyXcxkeMOqnpvMAnp3n0wXlyXHZv0I9vduW6+4x
 hagtmwmD8gnNXHAwjfj2krnr+zWZAvhajAqEQl2Q80Tvnf7VpS1Kjer93iIQPJ2cYH
 uSyda9wOPcucDWzwRSmeHW4HwugWndw//XaPNX/g=
Message-ID: <50c5113f-4389-dc40-73d8-1da5e6af23a9@ideasonboard.com>
Date: Wed, 15 Feb 2023 08:18:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/3] drm: rcar-du: lvds: Call function directly instead of
 through pointer
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20230214003736.18871-1-laurent.pinchart+renesas@ideasonboard.com>
 <20230214003736.18871-2-laurent.pinchart+renesas@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230214003736.18871-2-laurent.pinchart+renesas@ideasonboard.com>
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

On 14/02/2023 02:37, Laurent Pinchart wrote:
> When disabling the companion bridge in rcar_lvds_atomic_disable(),
> there's no need to go through the bridge's operations to call
> .atomic_disable(). Call rcar_lvds_atomic_disable() on the companion
> directly.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>   drivers/gpu/drm/rcar-du/rcar_lvds.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index 260ea5d8624e..61de18af62e6 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -582,8 +582,7 @@ static void rcar_lvds_atomic_disable(struct drm_bridge *bridge,
>   
>   	/* Disable the companion LVDS encoder in dual-link mode. */
>   	if (lvds->link_type != RCAR_LVDS_SINGLE_LINK && lvds->companion)
> -		lvds->companion->funcs->atomic_disable(lvds->companion,
> -						       old_bridge_state);
> +		rcar_lvds_atomic_disable(lvds->companion, old_bridge_state);
>   
>   	pm_runtime_put_sync(lvds->dev);
>   }

Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

  Tomi

