Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B07D07F536C
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 23:31:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE9ED10E6A3;
	Wed, 22 Nov 2023 22:31:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D5C10E6A3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 22:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=wgffmZ/dYxQZ02n5BsqrMFH/W/q3OoPJX37Pj57udDA=; b=upAuJebrU3TrsLEwkoVS7Ex3WW
 WEtBDvF9CHd7xdUqxbXxY4yAaBfW1ftPvZilCeiO/2PR1TKJ/5GjrPzxcmBwJoRIAZocLkgUup9E9
 VA8P25+jg5MwFYBH8XU8V3+BWnch+756FPMrNkWBTaoenYX19pO/C5tRVy9qdPs4jUM/FXFpBBJ7X
 NAGHkQs9zhOuj3rGishWr8m7fEwgYrgVLjRuXSzEFcPZKLzLZ2ANfKr6ilX4PdD1PyqF/fIym/ohd
 n6e1K2Ofk3XyjpPcSP6mdorAiDzvvr7lG2yQgDqhP3d521rDFdmzZil7gqtIAvhESk6xpN1TIZTNV
 oESCZLNQ==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1r5vkD-003D6K-34; Wed, 22 Nov 2023 22:30:53 +0000
Message-ID: <a194eb9e-c11e-4bc2-a1b3-d43122973368@infradead.org>
Date: Wed, 22 Nov 2023 14:30:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/rockchip: rk3066_hdmi: include drm/drm_atomic.h
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Johan Jonker <jbx6244@gmail.com>
References: <20231122221838.3164349-1-arnd@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20231122221838.3164349-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Azeem Shaikh <azeemshaikh38@gmail.com>,
 linux-rockchip@lists.infradead.org,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/22/23 14:18, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Without this header, the newly added code fails to build:
> 
> drivers/gpu/drm/rockchip/rk3066_hdmi.c: In function 'rk3066_hdmi_encoder_enable':
> drivers/gpu/drm/rockchip/rk3066_hdmi.c:397:22: error: implicit declaration of function 'drm_atomic_get_new_connector_state'; did you mean 'drm_atomic_helper_connector_reset'? [-Werror=implicit-function-declaration]
>   397 |         conn_state = drm_atomic_get_new_connector_state(state, &hdmi->connector);
>       |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |                      drm_atomic_helper_connector_reset
> drivers/gpu/drm/rockchip/rk3066_hdmi.c:397:20: error: assignment to 'struct drm_connector_state *' from 'int' makes pointer from integer without a cast [-Werror=int-conversion]
>   397 |         conn_state = drm_atomic_get_new_connector_state(state, &hdmi->connector);
>       |                    ^
> drivers/gpu/drm/rockchip/rk3066_hdmi.c:401:22: error: implicit declaration of function 'drm_atomic_get_new_crtc_state'; did you mean 'drm_atomic_helper_swap_state'? [-Werror=implicit-function-declaration]
>   401 |         crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
>       |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |                      drm_atomic_helper_swap_state
> drivers/gpu/drm/rockchip/rk3066_hdmi.c:401:20: error: assignment to 'struct drm_crtc_state *' from 'int' makes pointer from integer without a cast [-Werror=int-conversion]
>   401 |         crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
>       |                    ^
> 
> Fixes: ae3436a5e7c2 ("drm/rockchip: rk3066_hdmi: Switch encoder hooks to atomic")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks.

> ---
>  drivers/gpu/drm/rockchip/rk3066_hdmi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
> index 0e7aae341960..7d561c5a650f 100644
> --- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
> +++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
> @@ -4,6 +4,7 @@
>   *    Zheng Yang <zhengyang@rock-chips.com>
>   */
>  
> +#include <drm/drm_atomic.h>
>  #include <drm/drm_edid.h>
>  #include <drm/drm_of.h>
>  #include <drm/drm_probe_helper.h>

-- 
~Randy
