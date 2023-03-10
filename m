Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E87C46B4825
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 15:59:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D27210E944;
	Fri, 10 Mar 2023 14:59:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AF0010E943
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 14:59:33 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id F0DE92E5;
 Fri, 10 Mar 2023 15:59:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1678460371;
 bh=Chwv7HFTcUaY/JET0sX7VEDo3HbGbnOEAmqSg2EzMbM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ob9KojRlAz9DuOGHlgGEvMtOc+uHUeZdj/WmXCOwIiQaE+E6TVQIjry+0ODhV5NDm
 sZWrRRWmi63Y0pejiCDV9XcL9g/v66a2k9o6100n/mK1tzl4GIN66xQFe5xjjXUFUK
 A7Ph1q+xazouYwW0DwJjdJfy8lvW3XM7wvHAesIA=
Date: Fri, 10 Mar 2023 16:59:35 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] drm: Use of_property_read_bool() for boolean properties
Message-ID: <20230310145935.GI5342@pendragon.ideasonboard.com>
References: <20230310144706.1542295-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230310144706.1542295-1-robh@kernel.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

Thank you for the patch.

On Fri, Mar 10, 2023 at 08:47:05AM -0600, Rob Herring wrote:
> It is preferred to use typed property access functions (i.e.
> of_property_read_<type> functions) rather than low-level
> of_get_property/of_find_property functions for reading properties.
> Convert reading boolean properties to to of_property_read_bool().

s/to to/to/ (or maybe "to use" ?)

With this,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/gpu/drm/bridge/parade-ps8622.c | 2 +-
>  drivers/gpu/drm/tiny/ofdrm.c           | 8 ++------
>  2 files changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/parade-ps8622.c b/drivers/gpu/drm/bridge/parade-ps8622.c
> index 530ee6a19e7e..efa80e309b98 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8622.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8622.c
> @@ -496,7 +496,7 @@ static int ps8622_probe(struct i2c_client *client)
>  		ps8622->lane_count = ps8622->max_lane_count;
>  	}
>  
> -	if (!of_find_property(dev->of_node, "use-external-pwm", NULL)) {
> +	if (!of_property_read_bool(dev->of_node, "use-external-pwm")) {
>  		ps8622->bl = backlight_device_register("ps8622-backlight",
>  				dev, ps8622, &ps8622_backlight_ops,
>  				NULL);
> diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/tiny/ofdrm.c
> index 6e349ca42485..76cd7f515bab 100644
> --- a/drivers/gpu/drm/tiny/ofdrm.c
> +++ b/drivers/gpu/drm/tiny/ofdrm.c
> @@ -162,13 +162,9 @@ static bool display_get_big_endian_of(struct drm_device *dev, struct device_node
>  	bool big_endian;
>  
>  #ifdef __BIG_ENDIAN
> -	big_endian = true;
> -	if (of_get_property(of_node, "little-endian", NULL))
> -		big_endian = false;
> +	big_endian = !of_property_read_bool(of_node, "little-endian");
>  #else
> -	big_endian = false;
> -	if (of_get_property(of_node, "big-endian", NULL))
> -		big_endian = true;
> +	big_endian = of_property_read_bool(of_node, "big-endian");
>  #endif
>  
>  	return big_endian;

-- 
Regards,

Laurent Pinchart
