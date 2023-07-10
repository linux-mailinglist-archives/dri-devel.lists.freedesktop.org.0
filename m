Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F1B74DCBB
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 19:47:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74D8010E2BB;
	Mon, 10 Jul 2023 17:46:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 562EE10E2BB
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 17:46:57 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id C2E36200AE;
 Mon, 10 Jul 2023 17:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1689011215; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2bgYYUfNlXqRAulFmwC4oTIUnr7Hav2E8ZDZIyQ3RRg=;
 b=wDVhrPr7JqE9PofEW+tSQEob8PLlqvfUrfLl1RBWkXpnE0jo5piaIbonRTSI56C0D2kF7c
 30uJOvj0PwYPDINZIZXSfzGWPa1c2VSQd2WwVgxed3+DEa9HxpU+19lYwVAfF313uWsrvG
 0LBx+NgEfm58kIKXo0qDl4b6dN9bBzU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1689011215;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2bgYYUfNlXqRAulFmwC4oTIUnr7Hav2E8ZDZIyQ3RRg=;
 b=IU4VrQXDE+tAy2TP6HlHbeZmloMIyXZ/HWL2wEx0gHPMglSYUGDwcX99PTTGqfiNOeQnFo
 RIHVVtJLHabJLVAw==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 8ADD12C142;
 Mon, 10 Jul 2023 17:46:55 +0000 (UTC)
Date: Mon, 10 Jul 2023 19:46:54 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] of: Preserve "of-display" device name for compatibility
Message-ID: <20230710174654.GB9196@kitsune.suse.cz>
References: <20230710174007.2291013-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230710174007.2291013-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Cyril Brulebois <cyril@debamax.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Frank Rowand <frowand.list@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 10, 2023 at 11:40:07AM -0600, Rob Herring wrote:
> Since commit 241d2fb56a18 ("of: Make OF framebuffer device names unique"),
> as spotted by Frédéric Bonnard, the historical "of-display" device is
> gone: the updated logic creates "of-display.0" instead, then as many
> "of-display.N" as required.
> 
> This means that offb no longer finds the expected device, which prevents
> the Debian Installer from setting up its interface, at least on ppc64el.
> 
> Fix this by keeping "of-display" for the first device and "of-display.N"
> for subsequent devices.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217328
> Link: https://bugs.debian.org/1033058
> Fixes: 241d2fb56a18 ("of: Make OF framebuffer device names unique")
> Cc: stable@vger.kernel.org
> Cc: Cyril Brulebois <cyril@debamax.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Helge Deller <deller@gmx.de>
> Signed-off-by: Rob Herring <robh@kernel.org>

This is exclusive with the other patchset that updates the other side:
https://lore.kernel.org/lkml/20230412095509.2196162-1-cyril@debamax.com/

Reviewed-by: Michal Suchánek <msuchanek@suse.de>

Thanks

Michal

> ---
>  drivers/of/platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index 051e29b7ad2b..0c3475e7d2ff 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -552,7 +552,7 @@ static int __init of_platform_default_populate_init(void)
>  			if (!of_get_property(node, "linux,opened", NULL) ||
>  			    !of_get_property(node, "linux,boot-display", NULL))
>  				continue;
> -			dev = of_platform_device_create(node, "of-display.0", NULL);
> +			dev = of_platform_device_create(node, "of-display", NULL);
>  			of_node_put(node);
>  			if (WARN_ON(!dev))
>  				return -ENOMEM;
> -- 
> 2.40.1
> 
