Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5387174DB34
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 18:36:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E1010E17B;
	Mon, 10 Jul 2023 16:36:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E0410E17B
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 16:36:44 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 1A72E1FF06;
 Mon, 10 Jul 2023 16:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1689007003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=50GMs5nmGpITPWTG7u5Zcxqbmkf0dcUoVQiJpGtLvBg=;
 b=MAkcYfuu2e/AwBYCJ8iEsRGbL7yA8cBwUv3bbYwWUSPqAWWE3+OD7CUwXSDvzwimmPxDm1
 snlvw8+Zbn4vbzubmlOotkSLqVnSnZZloPrWWPbnQLgC3FYXKyueUbjMkHNPEQd9xpbZnd
 rimCb3GOjrBYy3y5WVygqzW/TA9ld7I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1689007003;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=50GMs5nmGpITPWTG7u5Zcxqbmkf0dcUoVQiJpGtLvBg=;
 b=h+IckA4+b99FPAeRV10LGOxH9p9DpOwRbzQ2LuIS61mLAFsz2z61ZESsEGm+Evi1q3fXu3
 3LuUg1XOFV1btxDg==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id E67762C142;
 Mon, 10 Jul 2023 16:36:42 +0000 (UTC)
Date: Mon, 10 Jul 2023 18:36:41 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Cyril Brulebois <cyril@debamax.com>
Subject: Re: [PATCH 2/2] drm/ofdrm: Update expected device name
Message-ID: <20230710163641.GA9196@kitsune.suse.cz>
References: <20230412095509.2196162-1-cyril@debamax.com>
 <20230412095509.2196162-3-cyril@debamax.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230412095509.2196162-3-cyril@debamax.com>
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

On Wed, Apr 12, 2023 at 11:55:09AM +0200, Cyril Brulebois wrote:
> Since commit 241d2fb56a18 ("of: Make OF framebuffer device names unique"),
> as spotted by Frédéric Bonnard, the historical "of-display" device is
> gone: the updated logic creates "of-display.0" instead, then as many
> "of-display.N" as required.
> 
> This means that offb no longer finds the expected device, which prevents
> the Debian Installer from setting up its interface, at least on ppc64el.
> 
> Given the code similarity it is likely to affect ofdrm in the same way.
> 
> It might be better to iterate on all possible nodes, but updating the
> hardcoded device from "of-display" to "of-display.0" is likely to help
> as a first step.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217328
> Link: https://bugs.debian.org/1033058
> Fixes: 241d2fb56a18 ("of: Make OF framebuffer device names unique")
> Cc: stable@vger.kernel.org # v6.2+
> Signed-off-by: Cyril Brulebois <cyril@debamax.com>
Reviewed-by: Michal Suchánek <msuchanek@suse.de>
> ---
>  drivers/gpu/drm/tiny/ofdrm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/tiny/ofdrm.c
> index 6e349ca42485..92df021d71df 100644
> --- a/drivers/gpu/drm/tiny/ofdrm.c
> +++ b/drivers/gpu/drm/tiny/ofdrm.c
> @@ -1390,7 +1390,7 @@ MODULE_DEVICE_TABLE(of, ofdrm_of_match_display);
>  
>  static struct platform_driver ofdrm_platform_driver = {
>  	.driver = {
> -		.name = "of-display",
> +		.name = "of-display.0",
>  		.of_match_table = ofdrm_of_match_display,
>  	},
>  	.probe = ofdrm_probe,
> -- 
> 2.30.2
> 
