Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4609BA7976E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 23:16:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF37410E8D5;
	Wed,  2 Apr 2025 21:16:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=xff.cz header.i=@xff.cz header.b="jqch+iqd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 414 seconds by postgrey-1.36 at gabe;
 Wed, 02 Apr 2025 21:16:05 UTC
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B81DD10E8D5
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 21:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
 t=1743628147; bh=NxU1qh4rEZ3galaYLuwWXch0mLJidkZNwrsLm5kun38=;
 h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
 b=jqch+iqdF1HrmRSVsRvaiDzIazDlj460v0RiPrW6fX8k0OLkha4r9GXYn52s+HdTg
 Avh6wXWHlXw7GhVOEkaNyRYQILZOlS+nMUSHG8rQ7puw1ZoAo6jQ+ajg9fQj/bi4Ca
 4JkaiYZUeHryIItxpdaxsOca0xFD8PN7+pX6IUTI=
Date: Wed, 2 Apr 2025 23:09:06 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Icenowy Zheng <icenowy@aosc.io>, Jagan Teki <jagan@amarulasolutions.com>,
 Javier Martinez Canillas <javierm@redhat.com>, 
 Michael Trimarchi <michael@amarulasolutions.com>,
 Michael Walle <mwalle@kernel.org>, Jagan Teki <jagan@edgeble.ai>, 
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, 
 Linus Walleij <linus.walleij@linaro.org>, Jianhua Lu <lujianhua000@gmail.com>, 
 Stefan Mavrodiev <stefan@olimex.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/30] panel/ilitek-ili9341: Use refcounted allocation in
 place of devm_kzalloc()
Message-ID: <75q6u7kgyhveuzlxujoocvqfzilaxsvh3udzeltk2itwigy2n3@f5sqxddtjxuf>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>, 
 Anusha Srivatsa <asrivats@redhat.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Icenowy Zheng <icenowy@aosc.io>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 Javier Martinez Canillas <javierm@redhat.com>, 
 Michael Trimarchi <michael@amarulasolutions.com>,
 Michael Walle <mwalle@kernel.org>, Jagan Teki <jagan@edgeble.ai>, 
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, 
 Linus Walleij <linus.walleij@linaro.org>, Jianhua Lu <lujianhua000@gmail.com>, 
 Stefan Mavrodiev <stefan@olimex.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20250402-b4-drm_panel_mass_convert_part2-v1-0-903b70999ea6@redhat.com>
 <20250402-b4-drm_panel_mass_convert_part2-v1-7-903b70999ea6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402-b4-drm_panel_mass_convert_part2-v1-7-903b70999ea6@redhat.com>
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

Hi Anusha,

On Wed, Apr 02, 2025 at 11:23:45AM -0400, Anusha Srivatsa wrote:
> Move to using the new API devm_drm_panel_alloc() to allocate the
> panel.
> 
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
>  drivers/gpu/drm/panel/panel-ilitek-ili9341.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> index ff39f5dd4097e8da0a0e16c50c5bfd45c078d91c..d87b7eefe9beedd290fb59065b389b3315c85720 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> @@ -490,9 +490,11 @@ static int ili9341_dpi_probe(struct spi_device *spi, struct gpio_desc *dc,
>  	struct ili9341 *ili;
>  	int ret;
>  
> -	ili = devm_kzalloc(dev, sizeof(struct ili9341), GFP_KERNEL);
> -	if (!ili)
> -		return -ENOMEM;
> +	ili = devm_drm_panel_alloc(dev, struct ili9341, panel,
> +				   &ili9341_dpi_funcs,
> +				   DRM_MODE_CONNECTOR_DPI);
> +	if (IS_ERR(ili))
> +		return PTR_ERR(ili);
>  
>  	ili->dbi = devm_kzalloc(dev, sizeof(struct mipi_dbi),
>  				GFP_KERNEL);

Unlike in other patches, in this one you did not remove:

https://elixir.bootlin.com/linux/v6.13.7/source/drivers/gpu/drm/panel/panel-ilitek-ili9341.c#L529

	drm_panel_init(&ili->panel, dev, &ili9341_dpi_funcs,
		       DRM_MODE_CONNECTOR_DPI);

Unintentional?

kind regards,
	o.

> -- 
> 2.48.1
> 
