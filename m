Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8063E1A2A55
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 22:27:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C8F16EAF8;
	Wed,  8 Apr 2020 20:27:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C9536EAF5
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 20:27:43 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.129]) with ESMTPA (Nemesis) id
 1Ma1kC-1jpzv402E8-00VxbF; Wed, 08 Apr 2020 22:27:22 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
 Nicolas Pitre <nico@fluxnic.net>
Subject: [RFC 5/6] drm/rcar-du: fix selection of CMM driver
Date: Wed,  8 Apr 2020 22:27:10 +0200
Message-Id: <20200408202711.1198966-6-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200408202711.1198966-1-arnd@arndb.de>
References: <20200408202711.1198966-1-arnd@arndb.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:BHGsIuVv5ZbKZcE4TjncqtpdBu8WjZS+2Q1lxqyGkiA2mhZOxWk
 P/dnbzJufBgPE0K1DKdoofKWfp0z22YhTz+VuyDG06en1W4KOhovhJrv6BugOwEFXqTaTj2
 288ntMN6bhI9PumD50NA/n3txC43UpJhfmdGrdxosHRyNYVJgDBMQiwxTTn/uWVFTqjSdUU
 fDQQqODpLa+nnX9eremjg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:pp2T8S8fwiY=:YFTKAmm3THs3lkgTu/9cJO
 OlEtbaj4m1Q5rf7W3W0uZLdMofdnYljtx8FY5AetjTPsNapbUFYF/lEmeEIi2ZJ2XntmC8zYC
 EJ8vhWs3nd3PF4ZiisP0ZuphikEQmE6sMD/MqJ4fMBozRB7Y7Q9WYtgy9LYl4pofjT5ITkfj8
 zn1K+ou3M5Zg8obfkcB7h2q53e3Xf0UwPgVqBhex3D/m3VsHxFczoP4Ke5g8FGmAhJCUxAlwL
 2PFHFwGyb6KCkVHbnDkhoOeZxvn0QqXK8+45nCfJIvr2AbPnhixWzgQByM2NXOAZEd4teCAz/
 qxorUPGpDH1S7dbIj3N3ooaHTS3oi4JQacv8a+RLyyJQ9pwxlazye1rH6RI0Z6gK3MiRFnhZ2
 lq9fUUdQg/KctqBHG8a73RVU0VDaP0fy1BjwPBZaFhlWURfyNLxRG/qVhfmA0raUlGneT2iOW
 He+R/86cyk0/B1G6OZZxXsX5ZBaVdYxOT/CYk3yXRB40jdkw/v8ZTle5gBvZ6zySj1Ad0dcs/
 4iMaS5adZbjp1svnyH2qvzvuB4vAmca9l1RJLzwFCdzSwFMdwNpowt/525p3rQ5hPvavQkS8W
 6eOsFHwpp9Kp7ZCoHvnhNwEEvUI7wiYSRg1BO7t3B5OgB19ndMAHUoTgc3lbOxgyhoTXPaX8o
 tI7K8mzkll+T9iyBn99wcIbTYTEiYhRM1BvmfTtCRyn9H7UWD3WTPba8PPrynVA50MrI7uLly
 BS8Jy4fz75apY/KbCLbbT54mmCW1x+HAOJaCCcrHcpdZkjz0fj3tWKOz+LDi0Kvmt0qRb5tKd
 rSVLD4Vzw4UcAzTHMoiBj6bSie1LlISiOrXQ/oOoxrZBCBLNp8=
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Leon Romanovsky <leon@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, netdev@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, Saeed Mahameed <saeedm@mellanox.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 "David S. Miller" <davem@davemloft.net>, linux-rdma@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The 'imply' statement does not seem to have an effect, as it's
still possible to turn the CMM code into a loadable module
in a randconfig build, leading to a link error:

arm-linux-gnueabi-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function `rcar_du_crtc_atomic_enable':
rcar_du_crtc.c:(.text+0xad4): undefined reference to `rcar_lvds_clk_enable'
arm-linux-gnueabi-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function `rcar_du_crtc_atomic_disable':
rcar_du_crtc.c:(.text+0xd7c): undefined reference to `rcar_lvds_clk_disable'
arm-linux-gnueabi-ld: drivers/gpu/drm/rcar-du/rcar_du_drv.o: in function `rcar_du_init':
rcar_du_drv.c:(.init.text+0x4): undefined reference to `rcar_du_of_init'
arm-linux-gnueabi-ld: drivers/gpu/drm/rcar-du/rcar_du_encoder.o: in function `rcar_du_encoder_init':

Remove the 'imply', and instead use a silent symbol that defaults
to the correct setting.

Fixes: e08e934d6c28 ("drm: rcar-du: Add support for CMM")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/rcar-du/Kconfig | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index 0919f1f159a4..5e35f5934d62 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -4,7 +4,6 @@ config DRM_RCAR_DU
 	depends on DRM && OF
 	depends on ARM || ARM64
 	depends on ARCH_RENESAS || COMPILE_TEST
-	imply DRM_RCAR_CMM
 	imply DRM_RCAR_LVDS
 	select DRM_KMS_HELPER
 	select DRM_KMS_CMA_HELPER
@@ -15,9 +14,8 @@ config DRM_RCAR_DU
 	  If M is selected the module will be called rcar-du-drm.
 
 config DRM_RCAR_CMM
-	tristate "R-Car DU Color Management Module (CMM) Support"
+	def_tristate DRM_RCAR_DU
 	depends on DRM && OF
-	depends on DRM_RCAR_DU
 	help
 	  Enable support for R-Car Color Management Module (CMM).
 
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
