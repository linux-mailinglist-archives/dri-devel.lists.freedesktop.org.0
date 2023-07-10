Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6760374DB2D
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 18:36:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D268C10E17F;
	Mon, 10 Jul 2023 16:36:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F5A110E17B
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 16:36:13 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 21C0D223A4;
 Mon, 10 Jul 2023 16:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1689006969; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2sfvjB1A0AwpI2PjUSmQqejHy2/OmMjxbXGDG72naLk=;
 b=GEK+HflRi+8JRKXTGL4bcon//yAy5Xaor34VtkrcUwUihWquru0JnCG4Vu0xxgqVaq2fg9
 WxPHdp43SP/IJbJVub65YX01wcWv5lVQNq2xP0ijAsPiFsbJsl0PT6TJQrnQXwc6FJ8GJ1
 dQaY8sNALWhmC5dz/HI2NDZ0kQJCpCM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1689006969;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2sfvjB1A0AwpI2PjUSmQqejHy2/OmMjxbXGDG72naLk=;
 b=9VrmsvD/Z4OdIWNqzeHAomfyR/ln8VG8+XfSo0NbCYtcifnCwQLKnBGFaAV4Z9yp4gDW75
 WIc6murT70bi0tAA==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id EB2542C142;
 Mon, 10 Jul 2023 16:36:08 +0000 (UTC)
Date: Mon, 10 Jul 2023 18:36:07 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Cyril Brulebois <cyril@debamax.com>
Subject: Re: [PATCH 1/2] fbdev/offb: Update expected device name
Message-ID: <20230710163607.GZ9196@kitsune.suse.cz>
References: <20230412095509.2196162-1-cyril@debamax.com>
 <20230412095509.2196162-2-cyril@debamax.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230412095509.2196162-2-cyril@debamax.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 12, 2023 at 11:55:08AM +0200, Cyril Brulebois wrote:
> Since commit 241d2fb56a18 ("of: Make OF framebuffer device names unique"),
> as spotted by Frédéric Bonnard, the historical "of-display" device is
> gone: the updated logic creates "of-display.0" instead, then as many
> "of-display.N" as required.
> 
> This means that offb no longer finds the expected device, which prevents
> the Debian Installer from setting up its interface, at least on ppc64el.
> 
> It might be better to iterate on all possible nodes, but updating the
> hardcoded device from "of-display" to "of-display.0" is confirmed to fix
> the Debian Installer at the very least.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217328
> Link: https://bugs.debian.org/1033058
> Fixes: 241d2fb56a18 ("of: Make OF framebuffer device names unique")
> Cc: stable@vger.kernel.org
> Signed-off-by: Cyril Brulebois <cyril@debamax.com>
Reviewed-by: Michal Suchánek <msuchanek@suse.de>

Thanks

Michal
> ---
>  drivers/video/fbdev/offb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/offb.c b/drivers/video/fbdev/offb.c
> index b97d251d894b..6264c7184457 100644
> --- a/drivers/video/fbdev/offb.c
> +++ b/drivers/video/fbdev/offb.c
> @@ -698,7 +698,7 @@ MODULE_DEVICE_TABLE(of, offb_of_match_display);
>  
>  static struct platform_driver offb_driver_display = {
>  	.driver = {
> -		.name = "of-display",
> +		.name = "of-display.0",
>  		.of_match_table = offb_of_match_display,
>  	},
>  	.probe = offb_probe_display,
> -- 
> 2.30.2
> 
