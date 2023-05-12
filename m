Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B76B700F57
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 21:37:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32AE710E0C2;
	Fri, 12 May 2023 19:37:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84FAF10E0C2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 19:37:25 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1pxYZr-0000Ys-SS; Fri, 12 May 2023 21:37:19 +0200
Message-ID: <275064c0e6c814d8e8fda6bcf70d6e8c3bdc3011.camel@pengutronix.de>
Subject: Re: [PATCH V5 5/6] drm: bridge: samsung-dsim: Dynamically configure
 DPHY timing
From: Lucas Stach <l.stach@pengutronix.de>
To: Adam Ford <aford173@gmail.com>, dri-devel@lists.freedesktop.org
Date: Fri, 12 May 2023 21:37:11 +0200
In-Reply-To: <20230506192453.725621-6-aford173@gmail.com>
References: <20230506192453.725621-1-aford173@gmail.com>
 <20230506192453.725621-6-aford173@gmail.com>
Content-Type: multipart/mixed; boundary="=-vlyej8fJXiDn+C7Q6nI9"
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 aford@beaconembedded.com, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-kernel@vger.kernel.org, Jagan Teki <jagan@amarulasolutions.com>,
 Michael Walle <michael@walle.cc>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--=-vlyej8fJXiDn+C7Q6nI9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Adam,

Am Samstag, dem 06.05.2023 um 14:24 -0500 schrieb Adam Ford:
> The DPHY timings are currently hard coded. Since the input
> clock can be variable, the phy timings need to be variable
> too.  Add an additional variable to the driver data to enable
> this feature to prevent breaking boards that don't support it.
>=20
> The phy_mipi_dphy_get_default_config function configures the
> DPHY timings in pico-seconds, and a small macro converts those
> timings into clock cycles based on the pixel clock rate.
>=20
This week I finally had some time to take a deeper look at this series
and test it on some of my systems.

This patch causes issues when the burst clock rate is fixed by
supplying the DT entry. Instead of describing the issue below, I'm
attaching the patch that makes things work on my system.

I would appreciate if you could test this one on your side. Feel free
to squash it into yours if you find it working properly.

Also I would almost bet that dynamic_dphy is working on the Exynos
boards with that fix added. So if anyone with access to those boards
would like to give it a shot, we may be able to get rid of the
hardcoded PHY parameters altogether, which would be a nice cleanup.

Regards,
Lucas

> Signed-off-by: Adam Ford <aford173@gmail.com>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Tested-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 74 ++++++++++++++++++++++++---
>  include/drm/bridge/samsung-dsim.h     |  1 +
>  2 files changed, 68 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index 08266303c261..d19a5c87b749 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -218,6 +218,8 @@
> =20
>  #define OLD_SCLK_MIPI_CLK_NAME		"pll_clk"
> =20
> +#define PS_TO_CYCLE(ps, hz) DIV64_U64_ROUND_CLOSEST(((ps) * (hz)), 10000=
00000000ULL)
> +
>  static const char *const clk_names[5] =3D {
>  	"bus_clk",
>  	"sclk_mipi",
> @@ -487,6 +489,7 @@ static const struct samsung_dsim_driver_data imx8mm_d=
si_driver_data =3D {
>  	.m_min =3D 64,
>  	.m_max =3D 1023,
>  	.min_freq =3D 1050,
> +	.dynamic_dphy =3D 1,
>  };
> =20
>  static const struct samsung_dsim_driver_data *
> @@ -698,13 +701,50 @@ static void samsung_dsim_set_phy_ctrl(struct samsun=
g_dsim *dsi)
>  	const struct samsung_dsim_driver_data *driver_data =3D dsi->driver_data=
;
>  	const unsigned int *reg_values =3D driver_data->reg_values;
>  	u32 reg;
> +	struct drm_display_mode *m =3D &dsi->mode;
> +	int bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> +	struct phy_configure_opts_mipi_dphy cfg;
> +	int clk_prepare, lpx, clk_zero, clk_post, clk_trail;
> +	int hs_exit, hs_prepare, hs_zero, hs_trail;
> +	unsigned long long clock_in_hz =3D m->clock * 1000;
> =20
>  	if (driver_data->has_freqband)
>  		return;
> =20
> +	/* The dynamic_phy has the ability to adjust PHY Timing settings */
> +	if (driver_data->dynamic_dphy) {
> +		phy_mipi_dphy_get_default_config(clock_in_hz, bpp, dsi->lanes, &cfg);
> +
> +		/*
> +		 * TODO:
> +		 * The tech reference manual for i.MX8M Mini/Nano/Plus
> +		 * doesn't state what the definition of the PHYTIMING
> +		 * bits are beyond their address and bit position.
> +		 * After reviewing NXP's downstream code, it appears
> +		 * that the various PHYTIMING registers take the number
> +		 * of cycles and use various dividers on them.  This
> +		 * calculation does not result in an exact match to the
> +		 * downstream code, but it is very close, and it appears
> +		 * to sync at a variety of resolutions. If someone
> +		 * can get a more accurate mathematical equation needed
> +		 * for these registers, this should be updated.
> +		 */
> +
> +		lpx =3D PS_TO_CYCLE(cfg.lpx, clock_in_hz);
> +		hs_exit =3D PS_TO_CYCLE(cfg.hs_exit, clock_in_hz);
> +		clk_prepare =3D PS_TO_CYCLE(cfg.clk_prepare, clock_in_hz);
> +		clk_zero =3D PS_TO_CYCLE(cfg.clk_zero, clock_in_hz);
> +		clk_post =3D PS_TO_CYCLE(cfg.clk_post, clock_in_hz);
> +		clk_trail =3D PS_TO_CYCLE(cfg.clk_trail, clock_in_hz);
> +		hs_prepare =3D PS_TO_CYCLE(cfg.hs_prepare, clock_in_hz);
> +		hs_zero =3D PS_TO_CYCLE(cfg.hs_zero, clock_in_hz);
> +		hs_trail =3D PS_TO_CYCLE(cfg.hs_trail, clock_in_hz);
> +	}
> +
>  	/* B D-PHY: D-PHY Master & Slave Analog Block control */
>  	reg =3D reg_values[PHYCTRL_ULPS_EXIT] | reg_values[PHYCTRL_VREG_LP] |
>  		reg_values[PHYCTRL_SLEW_UP];
> +
>  	samsung_dsim_write(dsi, DSIM_PHYCTRL_REG, reg);
> =20
>  	/*
> @@ -712,7 +752,11 @@ static void samsung_dsim_set_phy_ctrl(struct samsung=
_dsim *dsi)
>  	 * T HS-EXIT: Time that the transmitter drives LP-11 following a HS
>  	 *	burst
>  	 */
> -	reg =3D reg_values[PHYTIMING_LPX] | reg_values[PHYTIMING_HS_EXIT];
> +	if (driver_data->dynamic_dphy)
> +		reg  =3D DSIM_PHYTIMING_LPX(lpx) | DSIM_PHYTIMING_HS_EXIT(hs_exit);
> +	else
> +		reg =3D reg_values[PHYTIMING_LPX] | reg_values[PHYTIMING_HS_EXIT];
> +
>  	samsung_dsim_write(dsi, DSIM_PHYTIMING_REG, reg);
> =20
>  	/*
> @@ -728,10 +772,17 @@ static void samsung_dsim_set_phy_ctrl(struct samsun=
g_dsim *dsi)
>  	 * T CLK-TRAIL: Time that the transmitter drives the HS-0 state after
>  	 *	the last payload clock bit of a HS transmission burst
>  	 */
> -	reg =3D reg_values[PHYTIMING_CLK_PREPARE] |
> -		reg_values[PHYTIMING_CLK_ZERO] |
> -		reg_values[PHYTIMING_CLK_POST] |
> -		reg_values[PHYTIMING_CLK_TRAIL];
> +	if (driver_data->dynamic_dphy) {
> +		reg =3D DSIM_PHYTIMING1_CLK_PREPARE(clk_prepare)	|
> +		      DSIM_PHYTIMING1_CLK_ZERO(clk_zero)	|
> +		      DSIM_PHYTIMING1_CLK_POST(clk_post)	|
> +		      DSIM_PHYTIMING1_CLK_TRAIL(clk_trail);
> +	} else {
> +		reg =3D reg_values[PHYTIMING_CLK_PREPARE] |
> +		      reg_values[PHYTIMING_CLK_ZERO] |
> +		      reg_values[PHYTIMING_CLK_POST] |
> +		      reg_values[PHYTIMING_CLK_TRAIL];
> +	}
> =20
>  	samsung_dsim_write(dsi, DSIM_PHYTIMING1_REG, reg);
> =20
> @@ -744,8 +795,17 @@ static void samsung_dsim_set_phy_ctrl(struct samsung=
_dsim *dsi)
>  	 * T HS-TRAIL: Time that the transmitter drives the flipped differentia=
l
>  	 *	state after last payload data bit of a HS transmission burst
>  	 */
> -	reg =3D reg_values[PHYTIMING_HS_PREPARE] | reg_values[PHYTIMING_HS_ZERO=
] |
> -		reg_values[PHYTIMING_HS_TRAIL];
> +
> +	if (driver_data->dynamic_dphy) {
> +		reg =3D DSIM_PHYTIMING2_HS_PREPARE(hs_prepare) |
> +		      DSIM_PHYTIMING2_HS_ZERO(hs_zero) |
> +		      DSIM_PHYTIMING2_HS_TRAIL(hs_trail);
> +	} else {
> +		reg =3D reg_values[PHYTIMING_HS_PREPARE] |
> +		      reg_values[PHYTIMING_HS_ZERO] |
> +		      reg_values[PHYTIMING_HS_TRAIL];
> +	}
> +
>  	samsung_dsim_write(dsi, DSIM_PHYTIMING2_REG, reg);
>  }
> =20
> diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsu=
ng-dsim.h
> index a1a5b2b89a7a..76ea8a1720cc 100644
> --- a/include/drm/bridge/samsung-dsim.h
> +++ b/include/drm/bridge/samsung-dsim.h
> @@ -62,6 +62,7 @@ struct samsung_dsim_driver_data {
>  	const unsigned int *reg_values;
>  	u16 m_min;
>  	u16 m_max;
> +	bool dynamic_dphy;
>  };
> =20
>  struct samsung_dsim_host_ops {


--=-vlyej8fJXiDn+C7Q6nI9
Content-Disposition: attachment;
	filename*0=0001-drm-bridge-samsung-dsim-use-HS-clock-to-calculate-PH.pat;
	filename*1=ch
Content-Type: text/x-patch;
	name="0001-drm-bridge-samsung-dsim-use-HS-clock-to-calculate-PH.patch";
	charset="UTF-8"
Content-Transfer-Encoding: base64

RnJvbSAyNTk4NmJmYjYwZDM1MGEzZmM2Yzg2NWZjNjIyNTVkYWUzZTAwMzZlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4K
RGF0ZTogRnJpLCAxMiBNYXkgMjAyMyAyMToyMDowMyArMDIwMApTdWJqZWN0OiBbUEFUQ0hdIGRy
bTogYnJpZGdlOiBzYW1zdW5nLWRzaW06IHVzZSBIUyBjbG9jayB0byBjYWxjdWxhdGUgUEhZCiB0
aW1pbmdzCgpUaGUgY3VycmVudCBQSFkgdGltaW5nIGNhbGN1bGF0aW9uIGFzc3VtZXMgdGhhdCB0
aGUgSFMgY2xvY2sgaXMgc2NhbGVkCndpdGggdGhlIG1vZGUgcGl4ZWxjbG9jaywgd2hpY2ggaXNu
J3QgYWx3YXlzIHRoZSBjYXNlLiBVc2UgdGhlIEhTIGNsb2NrCmRpcmVjdGx5IHRvIGNhbGN1bGF0
ZSB0aGUgdGltaW5nIHBhcmFtZXRlcnMuCgpBbHNvIGl0IGRvZXNuJ3QgbWFrZSBtdWNoIHNlbnNl
IHRvIHNjYWxlIHRoZSB0aW1pbmdzIGJ5IGRpdmlkaW5nCmJ5IHRoZSBtb2RlIHBpeGVsIGNsb2Nr
LCBhcyB0aGUgUEhZIG5ldmVyIGdldHMgdG8gc2VlIHRoaXMgY2xvY2suClVzZSB0aGUgYnl0ZWNs
b2NrIGluc3RlYWQsIHdoaWNoIHNlZW1zIG11Y2ggbW9yZSBsaWtlbHkgdG8gYmUgdGhlCmNvcnJl
Y3Qgc291cmNlIGRyaXZpbmcgdGhvc2UgY291bnRlcnMuCgpTaWduZWQtb2ZmLWJ5OiBMdWNhcyBT
dGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3NhbXN1bmctZHNpbS5jIHwgMjUgKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2Ftc3VuZy1kc2ltLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3NhbXN1bmctZHNpbS5jCmluZGV4IGNhY2FkMTMwY2ZiMDUuLmFiMzRhZGI3OWMxNTggMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2Ftc3VuZy1kc2ltLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9zYW1zdW5nLWRzaW0uYwpAQCAtNzEzLDE5ICs3MTMsMTggQEAg
c3RhdGljIHZvaWQgc2Ftc3VuZ19kc2ltX3NldF9waHlfY3RybChzdHJ1Y3Qgc2Ftc3VuZ19kc2lt
ICpkc2kpCiAJY29uc3Qgc3RydWN0IHNhbXN1bmdfZHNpbV9kcml2ZXJfZGF0YSAqZHJpdmVyX2Rh
dGEgPSBkc2ktPmRyaXZlcl9kYXRhOwogCWNvbnN0IHVuc2lnbmVkIGludCAqcmVnX3ZhbHVlcyA9
IGRyaXZlcl9kYXRhLT5yZWdfdmFsdWVzOwogCXUzMiByZWc7Ci0Jc3RydWN0IGRybV9kaXNwbGF5
X21vZGUgKm0gPSAmZHNpLT5tb2RlOwotCWludCBicHAgPSBtaXBpX2RzaV9waXhlbF9mb3JtYXRf
dG9fYnBwKGRzaS0+Zm9ybWF0KTsKIAlzdHJ1Y3QgcGh5X2NvbmZpZ3VyZV9vcHRzX21pcGlfZHBo
eSBjZmc7CiAJaW50IGNsa19wcmVwYXJlLCBscHgsIGNsa196ZXJvLCBjbGtfcG9zdCwgY2xrX3Ry
YWlsOwogCWludCBoc19leGl0LCBoc19wcmVwYXJlLCBoc196ZXJvLCBoc190cmFpbDsKLQl1bnNp
Z25lZCBsb25nIGxvbmcgY2xvY2tfaW5faHogPSBtLT5jbG9jayAqIDEwMDA7CisJdW5zaWduZWQg
bG9uZyBsb25nIGJ5dGVfY2xvY2sgPSBkc2ktPmhzX2Nsb2NrIC8gODsKIAogCWlmIChkcml2ZXJf
ZGF0YS0+aGFzX2ZyZXFiYW5kKQogCQlyZXR1cm47CiAKIAkvKiBUaGUgZHluYW1pY19waHkgaGFz
IHRoZSBhYmlsaXR5IHRvIGFkanVzdCBQSFkgVGltaW5nIHNldHRpbmdzICovCiAJaWYgKGRyaXZl
cl9kYXRhLT5keW5hbWljX2RwaHkpIHsKLQkJcGh5X21pcGlfZHBoeV9nZXRfZGVmYXVsdF9jb25m
aWcoY2xvY2tfaW5faHosIGJwcCwgZHNpLT5sYW5lcywgJmNmZyk7CisJCXBoeV9taXBpX2RwaHlf
Z2V0X2RlZmF1bHRfY29uZmlnX2Zvcl9oc2Nsayhkc2ktPmhzX2Nsb2NrLAorCQkJCQkJCSAgIGRz
aS0+bGFuZXMsICZjZmcpOwogCiAJCS8qCiAJCSAqIFRPRE86CkBAIC03NDIsMTUgKzc0MSwxNSBA
QCBzdGF0aWMgdm9pZCBzYW1zdW5nX2RzaW1fc2V0X3BoeV9jdHJsKHN0cnVjdCBzYW1zdW5nX2Rz
aW0gKmRzaSkKIAkJICogZm9yIHRoZXNlIHJlZ2lzdGVycywgdGhpcyBzaG91bGQgYmUgdXBkYXRl
ZC4KIAkJICovCiAKLQkJbHB4ID0gUFNfVE9fQ1lDTEUoY2ZnLmxweCwgY2xvY2tfaW5faHopOwot
CQloc19leGl0ID0gUFNfVE9fQ1lDTEUoY2ZnLmhzX2V4aXQsIGNsb2NrX2luX2h6KTsKLQkJY2xr
X3ByZXBhcmUgPSBQU19UT19DWUNMRShjZmcuY2xrX3ByZXBhcmUsIGNsb2NrX2luX2h6KTsKLQkJ
Y2xrX3plcm8gPSBQU19UT19DWUNMRShjZmcuY2xrX3plcm8sIGNsb2NrX2luX2h6KTsKLQkJY2xr
X3Bvc3QgPSBQU19UT19DWUNMRShjZmcuY2xrX3Bvc3QsIGNsb2NrX2luX2h6KTsKLQkJY2xrX3Ry
YWlsID0gUFNfVE9fQ1lDTEUoY2ZnLmNsa190cmFpbCwgY2xvY2tfaW5faHopOwotCQloc19wcmVw
YXJlID0gUFNfVE9fQ1lDTEUoY2ZnLmhzX3ByZXBhcmUsIGNsb2NrX2luX2h6KTsKLQkJaHNfemVy
byA9IFBTX1RPX0NZQ0xFKGNmZy5oc196ZXJvLCBjbG9ja19pbl9oeik7Ci0JCWhzX3RyYWlsID0g
UFNfVE9fQ1lDTEUoY2ZnLmhzX3RyYWlsLCBjbG9ja19pbl9oeik7CisJCWxweCA9IFBTX1RPX0NZ
Q0xFKGNmZy5scHgsIGJ5dGVfY2xvY2spOworCQloc19leGl0ID0gUFNfVE9fQ1lDTEUoY2ZnLmhz
X2V4aXQsIGJ5dGVfY2xvY2spOworCQljbGtfcHJlcGFyZSA9IFBTX1RPX0NZQ0xFKGNmZy5jbGtf
cHJlcGFyZSwgYnl0ZV9jbG9jayk7CisJCWNsa196ZXJvID0gUFNfVE9fQ1lDTEUoY2ZnLmNsa196
ZXJvLCBieXRlX2Nsb2NrKTsKKwkJY2xrX3Bvc3QgPSBQU19UT19DWUNMRShjZmcuY2xrX3Bvc3Qs
IGJ5dGVfY2xvY2spOworCQljbGtfdHJhaWwgPSBQU19UT19DWUNMRShjZmcuY2xrX3RyYWlsLCBi
eXRlX2Nsb2NrKTsKKwkJaHNfcHJlcGFyZSA9IFBTX1RPX0NZQ0xFKGNmZy5oc19wcmVwYXJlLCBi
eXRlX2Nsb2NrKTsKKwkJaHNfemVybyA9IFBTX1RPX0NZQ0xFKGNmZy5oc196ZXJvLCBieXRlX2Ns
b2NrKTsKKwkJaHNfdHJhaWwgPSBQU19UT19DWUNMRShjZmcuaHNfdHJhaWwsIGJ5dGVfY2xvY2sp
OwogCX0KIAogCS8qIEIgRC1QSFk6IEQtUEhZIE1hc3RlciAmIFNsYXZlIEFuYWxvZyBCbG9jayBj
b250cm9sICovCi0tIAoyLjQwLjAKCg==


--=-vlyej8fJXiDn+C7Q6nI9--
