Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2BB638EC1
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 18:05:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD1E10E76B;
	Fri, 25 Nov 2022 17:05:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7004A10E76B
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 17:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pATJkeyZnotQ8rpA/v8VOmJi/HAhovO9x7uZ3qwZ0zo=; b=Sexc4UYddbvJIBie7vCWE6Oqcr
 lwQx8uax8p+AXtXOqiSAq7mX+lJJg/D2tVt+y8PaFQPfpZvdIy46aolXx4vpGEZc90zBoaOcAZCrR
 tGsivR1BD4/IO3sk5zZMhp/fHf7ds/icw72Ej/CaKBx11UUZAUSzlfRaCA+Jipn6MtdpGGDT8a6W9
 hFyhVZo1Lh3s5TUORy0/mJXrML6wvlRvzIGxM6drCDxJ+t0g9BveXnflLL0teJOwVnpGJ3stV8QcO
 Uh8bhmmHR2DgPqeZxyp7n/M66ZllhHD37kg3WbgX/1EZWveCHYqsibDs1mrIZU7WCxyy4QMl8BqMx
 Vp41jvlg==;
Received: from [2a01:799:95e:1700:6395:ccbd:d000:d42b] (port=64532)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1oyc8a-00022L-Pr; Fri, 25 Nov 2022 18:05:16 +0100
Message-ID: <bb7b35b5-088d-e141-adf7-b718c16d30fb@tronnes.org>
Date: Fri, 25 Nov 2022 18:05:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 4/8] drm/mipi-dbi: Initialize default driver functions
 with macro
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 thierry.reding@gmail.com, sam@ravnborg.org, emma@anholt.net,
 david@lechnology.com, kamlesh.gurudasani@gmail.com, javierm@redhat.com
References: <20221121104532.8301-1-tzimmermann@suse.de>
 <20221121104532.8301-5-tzimmermann@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20221121104532.8301-5-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 21.11.2022 11.45, skrev Thomas Zimmermann:
> Introduce DRM_MIPI_DBI_SIMPLE_DISPLAY_PIPE_FUNCS to initialize MIPI-DBI
> helpers to default values and convert drivers. The prepare_fb function
> set by some drivers is called implicitly by simple-kms helpers, so leave
> it out.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

>  static const struct drm_simple_display_pipe_funcs hx8357d_pipe_funcs = {
> -	.mode_valid = mipi_dbi_pipe_mode_valid,
> -	.enable = yx240qv29_enable,
> -	.disable = mipi_dbi_pipe_disable,
> -	.update = mipi_dbi_pipe_update,
> +	DRM_MIPI_DBI_SIMPLE_DISPLAY_PIPE_FUNCS(yx240qv29_enable),
>  };

>  static const struct drm_simple_display_pipe_funcs ili9163_pipe_funcs = {
> -	.mode_valid = mipi_dbi_pipe_mode_valid,
> -	.enable = yx240qv29_enable,
> -	.disable = mipi_dbi_pipe_disable,
> -	.update = mipi_dbi_pipe_update,
> +	DRM_MIPI_DBI_SIMPLE_DISPLAY_PIPE_FUNCS(yx240qv29_enable),
>  };

>  static const struct drm_simple_display_pipe_funcs ili9341_pipe_funcs = {
> -	.mode_valid = mipi_dbi_pipe_mode_valid,
> -	.enable = yx240qv29_enable,
> -	.disable = mipi_dbi_pipe_disable,
> -	.update = mipi_dbi_pipe_update,
> +	DRM_MIPI_DBI_SIMPLE_DISPLAY_PIPE_FUNCS(yx240qv29_enable),
>  };

3 drivers have the same enable function name, ili9163 and hx8357d has
clearly copied from ili9341 which actually supports the yx240qv29 panel.
At least hx8357d managed to update the display mode variable name,
ili9163 didn't. It's not unlikely that I reviewed these drivers...

But that has nothing to do with this patch:

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
