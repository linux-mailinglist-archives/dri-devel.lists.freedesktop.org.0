Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F263B73476D
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jun 2023 20:05:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B89910E0BF;
	Sun, 18 Jun 2023 18:05:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 79023 seconds by postgrey-1.36 at gabe;
 Sun, 18 Jun 2023 18:05:38 UTC
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B08410E0BF
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jun 2023 18:05:37 +0000 (UTC)
Date: Sun, 18 Jun 2023 18:05:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1687111535; x=1687370735;
 bh=YOfx98ZwkTSq19vP+aqft32B086IzCdS8xtWjsVpU+M=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=y0dpusDw5gQ/B3CG/plOmAj54U8x3gtOI2o38xE0QcEbWqG5uQQIiTeGecf/8NMai
 lW1WcOP6h46F+NUUnEpwg7a/6pLv2rMeZeugIiigej0DWiyV95S5LfInU6hB44l3Vb
 Fj5b/X2+DOg/V9EVWolNgha/xRLDxjCyfQyJEptgytvua3IkWFdBmgX0NGOsfA2hK+
 KpDho+zsxWoL3TlXaRXlIqOYkzaSGtF8J9JK2Lfu8f/+qHK74uFDDcpkntTj/6Efs2
 s8r68FGJ3IJ+pufVlfW1MobskU2ZLZU+D1yQCq2+ssEbmeCP9RIRwqCIDYY4ie07qD
 ReGIicUSngjLw==
To: =?utf-8?Q?Ond=C5=99ej_Jirman?= <megi@xff.cz>,
 linux-rockchip@lists.infradead.org
From: Julian <juliannfairfax@protonmail.com>
Subject: Re: [PATCH] drm: bridge: dw-mipi-dsi: Fix enable/disable of DSI
 controller
Message-ID: <cb517ab5-d65e-489d-960e-501d40a06fde@protonmail.com>
Feedback-ID: 23985752:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tested-by: Julian Fairfax

On 17.06.23 17:06, Ond=C5=99ej Jirman wrote:
> From: Ondrej Jirman <megi@xff.cz>
>
> Before this patch, booting to Linux VT and doing a simple:
>
>    echo 2 > /sys/class/graphics/fb0/blank
>    echo 0 > /sys/class/graphics/fb0/blank
>
> would result in failures to re-enable the panel. Mode set callback is
> called only once during boot in this scenario, while calls to
> enable/disable callbacks are balanced afterwards. The driver doesn't
> work unless userspace calls modeset before enabling the CRTC/connector.
>
> This patch moves enabling of the DSI host from mode_set into pre_enable
> callback, and removes some old hacks where this bridge driver is
> directly calling into other bridge driver's callbacks.
>
> pre_enable_prev_first flag is set on the panel's bridge so that panel
> drivers will get their prepare function called between DSI host's
> pre_enable and enable callbacks, so that they get a chance to
> perform panel setup while DSI host is already enabled in command
> mode. Otherwise panel's prepare would be called before DSI host
> is enabled, and any DSI communication used in prepare callback
> would fail.
>
> With all these changes, the enable/disable sequence is now well
> balanced, and host's and panel's callbacks are called in proper order
> documented in the drm_panel API documentation without needing the old
> hacks. (Mainly that panel->prepare is called when DSI host is ready to
> allow the panel driver to send DSI commands and vice versa during
> disable.)
>
> Tested on Pinephone Pro. Trace of the callbacks follows.
>
> Before:
>
> [    1.253882] dw-mipi-dsi-rockchip ff960000.dsi: mode_set
> [    1.290732] panel-himax-hx8394 ff960000.dsi.0: prepare
> [    1.475576] dw-mipi-dsi-rockchip ff960000.dsi: enable
> [    1.475593] panel-himax-hx8394 ff960000.dsi.0: enable
>
> echo 2 > /sys/class/graphics/fb0/blank
>
> [   13.722799] panel-himax-hx8394 ff960000.dsi.0: disable
> [   13.774502] dw-mipi-dsi-rockchip ff960000.dsi: post_disable
> [   13.774526] panel-himax-hx8394 ff960000.dsi.0: unprepare
>
> echo 0 > /sys/class/graphics/fb0/blank
>
> [   17.735796] panel-himax-hx8394 ff960000.dsi.0: prepare
> [   17.923522] dw-mipi-dsi-rockchip ff960000.dsi: enable
> [   17.923540] panel-himax-hx8394 ff960000.dsi.0: enable
> [   17.944330] dw-mipi-dsi-rockchip ff960000.dsi: failed to write command=
 FIFO
> [   17.944335] panel-himax-hx8394 ff960000.dsi.0: sending command 0xb9 fa=
iled: -110
> [   17.944340] panel-himax-hx8394 ff960000.dsi.0: Panel init sequence fai=
led: -110
>
> echo 2 > /sys/class/graphics/fb0/blank
>
> [  431.148583] panel-himax-hx8394 ff960000.dsi.0: disable
> [  431.169259] dw-mipi-dsi-rockchip ff960000.dsi: failed to write command=
 FIFO
> [  431.169268] panel-himax-hx8394 ff960000.dsi.0: Failed to enter sleep m=
ode: -110
> [  431.169282] dw-mipi-dsi-rockchip ff960000.dsi: post_disable
> [  431.169316] panel-himax-hx8394 ff960000.dsi.0: unprepare
> [  431.169357] pclk_mipi_dsi0 already disabled
>
> echo 0 > /sys/class/graphics/fb0/blank
>
> [  432.796851] panel-himax-hx8394 ff960000.dsi.0: prepare
> [  432.981537] dw-mipi-dsi-rockchip ff960000.dsi: enable
> [  432.981568] panel-himax-hx8394 ff960000.dsi.0: enable
> [  433.002290] dw-mipi-dsi-rockchip ff960000.dsi: failed to write command=
 FIFO
> [  433.002299] panel-himax-hx8394 ff960000.dsi.0: sending command 0xb9 fa=
iled: -110
> [  433.002312] panel-himax-hx8394 ff960000.dsi.0: Panel init sequence fai=
led: -110
>
> -----------------------------------------------------------------------
>
> After:
>
> [    1.248372] dw-mipi-dsi-rockchip ff960000.dsi: mode_set
> [    1.248704] dw-mipi-dsi-rockchip ff960000.dsi: pre_enable
> [    1.285377] panel-himax-hx8394 ff960000.dsi.0: prepare
> [    1.468392] dw-mipi-dsi-rockchip ff960000.dsi: enable
> [    1.468421] panel-himax-hx8394 ff960000.dsi.0: enable
>
> echo 2 > /sys/class/graphics/fb0/blank
>
> [   16.210357] panel-himax-hx8394 ff960000.dsi.0: disable
> [   16.261315] dw-mipi-dsi-rockchip ff960000.dsi: post_disable
> [   16.261339] panel-himax-hx8394 ff960000.dsi.0: unprepare
>
> echo 0 > /sys/class/graphics/fb0/blank
>
> [   19.161453] dw-mipi-dsi-rockchip ff960000.dsi: pre_enable
> [   19.197869] panel-himax-hx8394 ff960000.dsi.0: prepare
> [   19.382141] dw-mipi-dsi-rockchip ff960000.dsi: enable
> [   19.382158] panel-himax-hx8394 ff960000.dsi.0: enable
>
> Signed-off-by: Ondrej Jirman <megi@xff.cz>
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 28 +++++++++++--------
>   1 file changed, 16 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/=
drm/bridge/synopsys/dw-mipi-dsi.c
> index b2efecf7d160..352c6829259a 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> @@ -265,6 +265,7 @@ struct dw_mipi_dsi {
>   =09struct dw_mipi_dsi *master; /* dual-dsi master ptr */
>   =09struct dw_mipi_dsi *slave; /* dual-dsi slave ptr */
>  =20
> +=09struct drm_display_mode mode;
>   =09const struct dw_mipi_dsi_plat_data *plat_data;
>   };
>  =20
> @@ -332,6 +333,7 @@ static int dw_mipi_dsi_host_attach(struct mipi_dsi_ho=
st *host,
>   =09if (IS_ERR(bridge))
>   =09=09return PTR_ERR(bridge);
>  =20
> +=09bridge->pre_enable_prev_first =3D true;
>   =09dsi->panel_bridge =3D bridge;
>  =20
>   =09drm_bridge_add(&dsi->bridge);
> @@ -859,15 +861,6 @@ static void dw_mipi_dsi_bridge_post_atomic_disable(s=
truct drm_bridge *bridge,
>   =09 */
>   =09dw_mipi_dsi_set_mode(dsi, 0);
>  =20
> -=09/*
> -=09 * TODO Only way found to call panel-bridge post_disable &
> -=09 * panel unprepare before the dsi "final" disable...
> -=09 * This needs to be fixed in the drm_bridge framework and the API
> -=09 * needs to be updated to manage our own call chains...
> -=09 */
> -=09if (dsi->panel_bridge->funcs->post_disable)
> -=09=09dsi->panel_bridge->funcs->post_disable(dsi->panel_bridge);
> -
>   =09if (phy_ops->power_off)
>   =09=09phy_ops->power_off(dsi->plat_data->priv_data);
>  =20
> @@ -942,15 +935,25 @@ static void dw_mipi_dsi_mode_set(struct dw_mipi_dsi=
 *dsi,
>   =09=09phy_ops->power_on(dsi->plat_data->priv_data);
>   }
>  =20
> +static void dw_mipi_dsi_bridge_atomic_pre_enable(struct drm_bridge *brid=
ge,
> +=09=09=09=09=09=09 struct drm_bridge_state *old_bridge_state)
> +{
> +=09struct dw_mipi_dsi *dsi =3D bridge_to_dsi(bridge);
> +
> +=09/* Power up the dsi ctl into a command mode */
> +=09dw_mipi_dsi_mode_set(dsi, &dsi->mode);
> +=09if (dsi->slave)
> +=09=09dw_mipi_dsi_mode_set(dsi->slave, &dsi->mode);
> +}
> +
>   static void dw_mipi_dsi_bridge_mode_set(struct drm_bridge *bridge,
>   =09=09=09=09=09const struct drm_display_mode *mode,
>   =09=09=09=09=09const struct drm_display_mode *adjusted_mode)
>   {
>   =09struct dw_mipi_dsi *dsi =3D bridge_to_dsi(bridge);
>  =20
> -=09dw_mipi_dsi_mode_set(dsi, adjusted_mode);
> -=09if (dsi->slave)
> -=09=09dw_mipi_dsi_mode_set(dsi->slave, adjusted_mode);
> +=09/* Store the display mode for later use in pre_enable callback */
> +=09memcpy(&dsi->mode, adjusted_mode, sizeof(dsi->mode));
>   }
>  =20
>   static void dw_mipi_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
> @@ -1004,6 +1007,7 @@ static const struct drm_bridge_funcs dw_mipi_dsi_br=
idge_funcs =3D {
>   =09.atomic_duplicate_state=09=3D drm_atomic_helper_bridge_duplicate_sta=
te,
>   =09.atomic_destroy_state=09=3D drm_atomic_helper_bridge_destroy_state,
>   =09.atomic_reset=09=09=3D drm_atomic_helper_bridge_reset,
> +=09.atomic_pre_enable=09=3D dw_mipi_dsi_bridge_atomic_pre_enable,
>   =09.atomic_enable=09=09=3D dw_mipi_dsi_bridge_atomic_enable,
>   =09.atomic_post_disable=09=3D dw_mipi_dsi_bridge_post_atomic_disable,
>   =09.mode_set=09=09=3D dw_mipi_dsi_bridge_mode_set,

