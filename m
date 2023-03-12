Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9458B6B70F4
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 09:18:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C6ED10E498;
	Mon, 13 Mar 2023 08:17:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 468 seconds by postgrey-1.36 at gabe;
 Sun, 12 Mar 2023 14:53:16 UTC
Received: from comms.puri.sm (comms.puri.sm [159.203.221.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DD6110E06D
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Mar 2023 14:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by comms.puri.sm (Postfix) with ESMTP id 3EC17DFEB9;
 Sun, 12 Mar 2023 07:45:27 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
 by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vrpthDcHlxmp; Sun, 12 Mar 2023 07:45:26 -0700 (PDT)
Message-ID: <4737cacc741c939ca1d980a4858d0748faad11f8.camel@puri.sm>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=comms;
 t=1678632326; bh=Hbkdz18G2p6Un6hj+EQBbkrUeccuvYRQon6o6yKSeKw=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=M85dJVsJSzzLoCFOUV/CITJ09KQuHTcOYz0VLn65npKjIn6krZiwp+AHDIe+R9tiz
 HOTNR6sv/jusJBoHq/XQzQaXlCbw1Nzh2ZC6Lt1zV2lS0n6O4LtQHamCQ2mUV/lUxK
 Z5TRLmcL/D9ZZiWJSVhTjqHXhDjoHTLZFkxUZbza8gF761/kaqoC50CZIh663NreM+
 IiOq1gP9wg2jdBke3+i2iYTMBA/uRIiOoajrGgMW3Nma5nL6C6PhsqYhm3JpgyC/fD
 4Kk1z8zp6fpybXB5xi9DjeINgNjkuQXv01us9D1P5Fh5WzZUclJdrYQWfNV9yCHDHo
 nhFCL/Et8py3Q==
Subject: Re: [PATCH v1] drm/mipi-dsi: Set the fwnode for mipi_dsi_device
From: Martin Kepplinger <martin.kepplinger@puri.sm>
To: Saravana Kannan <saravanak@google.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <treding@nvidia.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Kyungmin Park
 <kyungmin.park@samsung.com>
Date: Sun, 12 Mar 2023 15:45:22 +0100
In-Reply-To: <20230310063910.2474472-1-saravanak@google.com>
References: <20230310063910.2474472-1-saravanak@google.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1+deb11u1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 13 Mar 2023 08:17:55 +0000
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
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Donnerstag, dem 09.03.2023 um 22:39 -0800 schrieb Saravana Kannan:
> After commit 3fb16866b51d ("driver core: fw_devlink: Make cycle
> detection more robust"), fw_devlink prints an error when consumer
> devices don't have their fwnode set. This used to be ignored
> silently.
> 
> Set the fwnode mipi_dsi_device so fw_devlink can find them and
> properly
> track their dependencies.
> 
> This fixes errors like this:
> [    0.334054] nwl-dsi 30a00000.mipi-dsi: Failed to create device
> link with regulator-lcd-1v8
> [    0.346964] nwl-dsi 30a00000.mipi-dsi: Failed to create device
> link with backlight-dsi
> 
> Reported-by: Martin Kepplinger <martin.kepplinger@puri.sm>

Reported-and-tested-by: Martin Kepplinger <martin.kepplinger@puri.sm>

thanks,
                         martin

> Link: 
> https://lore.kernel.org/lkml/2a8e407f4f18c9350f8629a2b5fa18673355b2ae.camel@puri.sm/
> Fixes: 068a00233969 ("drm: Add MIPI DSI bus support")
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> ---
>  drivers/gpu/drm/drm_mipi_dsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c
> b/drivers/gpu/drm/drm_mipi_dsi.c
> index b41aaf2bb9f1..7923cc21b78e 100644
> --- a/drivers/gpu/drm/drm_mipi_dsi.c
> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> @@ -221,7 +221,7 @@ mipi_dsi_device_register_full(struct
> mipi_dsi_host *host,
>                 return dsi;
>         }
>  
> -       dsi->dev.of_node = info->node;
> +       device_set_node(&dsi->dev, of_fwnode_handle(info->node));
>         dsi->channel = info->channel;
>         strlcpy(dsi->name, info->type, sizeof(dsi->name));
>  


