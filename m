Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C047F55E2
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 02:28:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C43E410E0A9;
	Thu, 23 Nov 2023 01:28:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ED7410E0A9
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 01:28:16 +0000 (UTC)
Received: from i5e86192d.versanet.de ([94.134.25.45] helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1r5yVb-0005Lp-5S; Thu, 23 Nov 2023 02:27:59 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Arnd Bergmann <arnd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Johan Jonker <jbx6244@gmail.com>,
 David Airlie <airlied@gmail.com>
Subject: Re: [PATCH] drm/rockchip: rk3066_hdmi: include drm/drm_atomic.h
Date: Thu, 23 Nov 2023 02:27:57 +0100
Message-Id: <170070269347.1892155.2069947154071292981.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231122221838.3164349-1-arnd@kernel.org>
References: <20231122221838.3164349-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 linux-rockchip@lists.infradead.org,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Azeem Shaikh <azeemshaikh38@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Kees Cook <keescook@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 22 Nov 2023 23:18:29 +0100, Arnd Bergmann wrote:
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
> [...]

Applied, thanks!

[1/1] drm/rockchip: rk3066_hdmi: include drm/drm_atomic.h
      commit: f4814c20d14ca168382e8887c768f290e4a2a861

Very puzzling, I did testbuild with the atomic conversion in place
and also re-did it again to before applying this patch and didn't get
the mentioned error - not sure what I might have done differently to
create a dufferent reszkt,

In any case, I applied the fix.


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
