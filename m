Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF072902E0
	for <lists+dri-devel@lfdr.de>; Fri, 16 Oct 2020 12:38:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56C5D6E106;
	Fri, 16 Oct 2020 10:38:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E99FB6E106
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 10:38:11 +0000 (UTC)
Date: Fri, 16 Oct 2020 10:38:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1602844689;
 bh=CueFArQ/QJnG/eBhSBQupebzUzZcch5Pm4+5Gvtp4fs=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=dtpvV4r/wcrtgTsSgKqmt6W2TLk1bAW5h2zV6zzZJmoUyJ3xlx4U5Zk4OWsKHI8kW
 NswCWCAODUU20M1jVlYww3+TvmA2FTCpE8teeItXPmusYkpUak6mgAoEJz4DWumKQL
 syauzcCjnwnSYegGGQbbD2/Y62sgILa1Gyq+BmkyvYKzehjnOuUL62UwgPTKcQYoFF
 XMW+SWWyPnkfIkFicyuIj8wkSQ5ZTmkccUmsR9Z8yB6ahJnsB0px+05d5pBagG6zRj
 4QuYfbChI5aV9kjKPgK32mV3bYEMNZENvKL9LBjttkGGQ3N889x7OrpygE6kqwttdy
 8BKNDqWJz3xZQ==
To: Daniel Vetter <daniel.vetter@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 1/3] drm/vkms: Set preferred depth correctly
Message-ID: <UQ4Aj6rvEUPvWt1cTYlNRLNoawlAIGTCnzstzNkRjZkv_NH-jIpnL7Xt9kGALYGc1M0RzZS0BcdvTb0V4przOwP8UBG_Xm6q2yRjCi3n-QE=@emersion.fr>
In-Reply-To: <20201009232156.3916879-1-daniel.vetter@ffwll.ch>
References: <20201009232156.3916879-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> The only thing we support is xrgb8888.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> Cc: Melissa Wen <melissa.srw@gmail.com>
> Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index 726801ab44d4..eb4007443706 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -124,7 +124,7 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
>  	dev->mode_config.max_height = YRES_MAX;
>  	dev->mode_config.cursor_width = 512;
>  	dev->mode_config.cursor_height = 512;
> -	dev->mode_config.preferred_depth = 24;
> +	dev->mode_config.preferred_depth = 32;

Are you sure xrgb8888's depth is 32 and not 24? Looking at drmdb [1], *all*
drivers set it to 24.

[1]: https://drmdb.emersion.fr/capabilities

>  	dev->mode_config.helper_private = &vkms_mode_config_helpers;
>
>  	return vkms_output_init(vkmsdev, 0);
> --
> 2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
