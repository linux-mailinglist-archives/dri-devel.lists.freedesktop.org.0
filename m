Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EA9624E30
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 00:02:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1ECA10E0E5;
	Thu, 10 Nov 2022 23:02:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDB0A10E0D9;
 Thu, 10 Nov 2022 23:01:56 +0000 (UTC)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4N7cm32bpSzDqPP;
 Thu, 10 Nov 2022 23:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1668121316; bh=ii9US/7BKMJSswViF5HF5Uy5RI+c/CUVF4WZu52VlbA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cPHdzSv4GOsGXIr9Eb/R795dEV6YP+Wcvkl6eGsKWdtRgGwoVyMK/BV00Y1wmpt+x
 VT5C3PbwkiIXp1CbE3h8tiXgWjaLkL2sz5jPGwP6N5FVDgP14RsM71DWbpx3QKM3DZ
 fIOHgYLoOehEqRAfXsjVCDqO/bPzcTrfbpxvOqTI=
X-Riseup-User-ID: 659E986C72ED052D274028EE1034DB3275D9FA4A0450B3B0042660F6D26D59E1
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4N7cls13Q1z1xx2;
 Thu, 10 Nov 2022 23:01:44 +0000 (UTC)
Message-ID: <28d35094-ac32-e589-274e-76f4b2408aec@riseup.net>
Date: Thu, 10 Nov 2022 20:01:42 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v8 06/24] drm/modes: Add a function to generate analog
 display modes
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Karol Herbst
 <kherbst@redhat.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lyude Paul <lyude@redhat.com>,
 Samuel Holland <samuel@sholland.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>
References: <20220728-rpi-analog-tv-properties-v8-0-09ce1466967c@cerno.tech>
 <20220728-rpi-analog-tv-properties-v8-6-09ce1466967c@cerno.tech>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20220728-rpi-analog-tv-properties-v8-6-09ce1466967c@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On 11/10/22 08:07, Maxime Ripard wrote:
> Multiple drivers (meson, vc4, sun4i) define analog TV 525-lines and
> 625-lines modes in their drivers.
> 
> Since those modes are fairly standard, and that we'll need to use them
> in more places in the future, it makes sense to move their definition
> into the core framework.
> 
> However, analog display usually have fairly loose timings requirements,
> the only discrete parameters being the total number of lines and pixel
> clock frequency. Thus, we created a function that will create a display
> mode from the standard, the pixel frequency and the active area.
> 
> Tested-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> ---
> Changes in v6:
> - Fix typo
> 
> Changes in v4:
> - Reworded the line length check comment
> - Switch to HZ_PER_KHZ in tests
> - Use previous timing to fill our mode
> - Move the number of lines check earlier
> ---
>  drivers/gpu/drm/drm_modes.c            | 474 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/tests/Makefile         |   1 +
>  drivers/gpu/drm/tests/drm_modes_test.c | 145 ++++++++++
>  include/drm/drm_modes.h                |  17 ++
>  4 files changed, 637 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tests/drm_modes_test.c b/drivers/gpu/drm/tests/drm_modes_test.c
> new file mode 100644
> index 000000000000..afeda9f07859
> --- /dev/null
> +++ b/drivers/gpu/drm/tests/drm_modes_test.c
> @@ -0,0 +1,145 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Kunit test for drm_modes functions
> + */
> +
> +#include <drm/drm_drv.h>
> +#include <drm/drm_modes.h>
> +
> +#include <kunit/test.h>
> +
> +#include <linux/units.h>
> +
> +#include "drm_kunit_helpers.h"
> +
> +struct drm_modes_test_priv {
> +	struct drm_device *drm;
> +};
> +
> +static int drm_modes_test_init(struct kunit *test)
> +{
> +	struct drm_modes_test_priv *priv;
> +
> +	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +	priv->drm = drm_kunit_device_init(test, DRIVER_MODESET, "drm-modes-test");
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->drm);
> +
> +	test->priv = priv;
> +
> +	return 0;
> +}
> +

As you did on the other tests, it would be nice to use the same naming
convention as the other DRM tests. So, maybe change the "drm_modes"
prefix to "drm_test_modes".

> +static void drm_modes_analog_tv_ntsc_480i(struct kunit *test)
> +{
> +	struct drm_modes_test_priv *priv = test->priv;
> +	struct drm_display_mode *mode;
> +
> +	mode = drm_analog_tv_mode(priv->drm,
> +				  DRM_MODE_TV_MODE_NTSC,
> +				  13500 * HZ_PER_KHZ, 720, 480,
> +				  true);
> +	KUNIT_ASSERT_NOT_NULL(test, mode);
> +
> +	KUNIT_EXPECT_EQ(test, drm_mode_vrefresh(mode), 60);
> +	KUNIT_EXPECT_EQ(test, mode->hdisplay, 720);
> +
> +	/* BT.601 defines hsync_start at 736 for 480i */
> +	KUNIT_EXPECT_EQ(test, mode->hsync_start, 736);
> +
> +	/*
> +	 * The NTSC standard expects a line to take 63.556us. With a
> +	 * pixel clock of 13.5 MHz, a pixel takes around 74ns, so we
> +	 * need to have 63556ns / 74ns = 858.
> +	 *
> +	 * This is also mandated by BT.601.
> +	 */
> +	KUNIT_EXPECT_EQ(test, mode->htotal, 858);
> +
> +	KUNIT_EXPECT_EQ(test, mode->vdisplay, 480);
> +	KUNIT_EXPECT_EQ(test, mode->vtotal, 525);
> +}
> +
> +static void drm_modes_analog_tv_ntsc_480i_inlined(struct kunit *test)
> +{
> +	struct drm_modes_test_priv *priv = test->priv;
> +	struct drm_display_mode *expected, *mode;
> +
> +	expected = drm_analog_tv_mode(priv->drm,
> +				      DRM_MODE_TV_MODE_NTSC,
> +				      13500 * HZ_PER_KHZ, 720, 480,
> +				      true);
> +	KUNIT_ASSERT_NOT_NULL(test, expected);
> +
> +	mode = drm_mode_analog_ntsc_480i(priv->drm);
> +	KUNIT_ASSERT_NOT_NULL(test, mode);
> +
> +	KUNIT_EXPECT_TRUE(test, drm_mode_equal(expected, mode));
> +}
> +
> +static void drm_modes_analog_tv_pal_576i(struct kunit *test)
> +{
> +	struct drm_modes_test_priv *priv = test->priv;
> +	struct drm_display_mode *mode;
> +
> +	mode = drm_analog_tv_mode(priv->drm,
> +				  DRM_MODE_TV_MODE_PAL,
> +				  13500 * HZ_PER_KHZ, 720, 576,
> +				  true);
> +	KUNIT_ASSERT_NOT_NULL(test, mode);
> +
> +	KUNIT_EXPECT_EQ(test, drm_mode_vrefresh(mode), 50);
> +	KUNIT_EXPECT_EQ(test, mode->hdisplay, 720);
> +
> +	/* BT.601 defines hsync_start at 732 for 576i */
> +	KUNIT_EXPECT_EQ(test, mode->hsync_start, 732);
> +
> +	/*
> +	 * The PAL standard expects a line to take 64us. With a pixel
> +	 * clock of 13.5 MHz, a pixel takes around 74ns, so we need to
> +	 * have 64000ns / 74ns = 864.
> +	 *
> +	 * This is also mandated by BT.601.
> +	 */
> +	KUNIT_EXPECT_EQ(test, mode->htotal, 864);
> +
> +	KUNIT_EXPECT_EQ(test, mode->vdisplay, 576);
> +	KUNIT_EXPECT_EQ(test, mode->vtotal, 625);
> +}
> +
> +static void drm_modes_analog_tv_pal_576i_inlined(struct kunit *test)
> +{
> +	struct drm_modes_test_priv *priv = test->priv;
> +	struct drm_display_mode *expected, *mode;
> +
> +	expected = drm_analog_tv_mode(priv->drm,
> +				      DRM_MODE_TV_MODE_PAL,
> +				      13500 * HZ_PER_KHZ, 720, 576,
> +				      true);
> +	KUNIT_ASSERT_NOT_NULL(test, expected);
> +
> +	mode = drm_mode_analog_pal_576i(priv->drm);
> +	KUNIT_ASSERT_NOT_NULL(test, mode);
> +
> +	KUNIT_EXPECT_TRUE(test, drm_mode_equal(expected, mode));
> +}
> +
> +static struct kunit_case drm_modes_analog_tv_tests[] = {
> +	KUNIT_CASE(drm_modes_analog_tv_ntsc_480i),
> +	KUNIT_CASE(drm_modes_analog_tv_ntsc_480i_inlined),
> +	KUNIT_CASE(drm_modes_analog_tv_pal_576i),
> +	KUNIT_CASE(drm_modes_analog_tv_pal_576i_inlined),
> +	{ }
> +};
> +
> +static struct kunit_suite drm_modes_analog_tv_test_suite = {
> +	.name = "drm_modes_analog_tv",
> +	.init = drm_modes_test_init,
> +	.test_cases = drm_modes_analog_tv_tests,
> +};
> +
> +kunit_test_suites(
> +	&drm_modes_analog_tv_test_suite
> +);

Considering that there is only one suite, you could use the
kunit_test_suite macro instead.

Best Regards,
- Maíra Canal

> +MODULE_LICENSE("GPL v2");
