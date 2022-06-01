Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDB953A022
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 11:15:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA60F10E8E9;
	Wed,  1 Jun 2022 09:15:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2647C10E8E9
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 09:15:43 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (lmontsouris-659-1-41-236.w92-154.abo.wanadoo.fr [92.154.76.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2C32B6D1;
 Wed,  1 Jun 2022 11:15:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1654074942;
 bh=UjU1q9TfgLsD2gDqTRWjVsva+5u/3ygk3/IJVilsQA0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HtFZzgzfAZtcU9NHzndDP3NLtIX7FHh/DGIyWu5/zSirZa+AJ20oVn2Sewrc5b65b
 2XQqCbj005zgB5u0XNoXrGAmij8hSbTP7oY6qf7hSud9rLXuAy7RlrCJJOVLzxjCNi
 745kQ5Egt1XxJX1RVGVhCPVP3t7dEjRue07Hl8g8=
Date: Wed, 1 Jun 2022 12:15:37 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: Re: Re: [PATCH] drm: bridge: adv7511: Add check for
 mipi_dsi_driver_register
Message-ID: <YpcuOfeil7ZpE2gH@pendragon.ideasonboard.com>
References: <20220601084501.2900380-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220601084501.2900380-1-jiasheng@iscas.ac.cn>
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
Cc: jagan@amarulasolutions.com, jonas@kwiboo.se, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com, robert.foss@linaro.org,
 andrzej.hajda@intel.com, alsi@bang-olufsen.dk, biju.das.jz@bp.renesas.com,
 sam@ravnborg.org, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 01, 2022 at 04:45:01PM +0800, Jiasheng Jiang wrote:
> On Wed, Jun 01, 2022 at 02:52:00PM +0800, Laurent Pinchart wrote:
> >>  static int __init adv7511_init(void)
> >>  {
> >> -	if (IS_ENABLED(CONFIG_DRM_MIPI_DSI))
> >> -		mipi_dsi_driver_register(&adv7533_dsi_driver);
> >> +	int ret;
> >> +
> >> +	if (IS_ENABLED(CONFIG_DRM_MIPI_DSI)) {
> >> +		ret = mipi_dsi_driver_register(&adv7533_dsi_driver);
> >> +		if (ret)
> >> +			return ret;
> >> +	}
> >>  
> >>  	return i2c_add_driver(&adv7511_driver);
> > 
> > While at it, should this then call mipi_dsi_driver_unregister() on
> > failure ?
> 
> Well, as far as I am concerned, the adv7511_exit() in the same file has already dealt with the issue.
> Therefore, it might not be necessary to add another mipi_dsi_driver_unregister().

The issue is that adv7511_exit() is not called if adv7511_init() fails.

-- 
Regards,

Laurent Pinchart
