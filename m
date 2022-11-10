Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A35B4624E75
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 00:30:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F310010E125;
	Thu, 10 Nov 2022 23:30:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1076 seconds by postgrey-1.36 at gabe;
 Thu, 10 Nov 2022 23:30:06 UTC
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ED7610E11B;
 Thu, 10 Nov 2022 23:30:06 +0000 (UTC)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4N7dNX4dZwz9svR;
 Thu, 10 Nov 2022 23:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1668123005; bh=fjuKmXRTkwtod6IBPhwlZ1iFXytpH70PXN+uyAnvcJU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bXuDGCl8gu5dbDhZxNCxNGU6m3awVbK/pl9drcFPGlU06RjvGwCTgKLdPJ+49/BLg
 eSp0z/ipegAp4Gs5LVSt/xvRD8PtbyXf9jQHoIJsy9S/uYK9IxCXYXo7L1lle/OaAD
 OiK5LcDol8WaOacjUFveKpKTPwQu8PeKxOV9ZZko=
X-Riseup-User-ID: 6A1C41D0E4C101BEC78841C4EA042529A6EBD75A5D224DDA08027C25E4B89A87
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4N7dNM3v56z1yQc;
 Thu, 10 Nov 2022 23:29:55 +0000 (UTC)
Message-ID: <4e35ba53-ee3d-31b1-cf70-6d8279e25297@riseup.net>
Date: Thu, 10 Nov 2022 20:29:53 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v8 17/24] drm/probe-helper: Provide a TV get_modes helper
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
 <20220728-rpi-analog-tv-properties-v8-17-09ce1466967c@cerno.tech>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20220728-rpi-analog-tv-properties-v8-17-09ce1466967c@cerno.tech>
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
> From: Noralf Trønnes <noralf@tronnes.org>
> 
> Most of the TV connectors will need a similar get_modes implementation
> that will, depending on the drivers' capabilities, register the 480i and
> 576i modes.
> 
> That implementation will also need to set the preferred flag and order
> the modes based on the driver and users preferrence.
> 
> This is especially important to guarantee that a userspace stack such as
> Xorg can start and pick up the preferred mode while maintaining a
> working output.
> 
> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> Tested-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> ---
> Changes in v8:
> - Remove unused tv_mode_support function
> - Add unit tests
> 
> Changes in v7:
> - Used Noralf's implementation
> 
> Changes in v6:
> - New patch
> ---
>  drivers/gpu/drm/drm_probe_helper.c            |  82 ++++++++++
>  drivers/gpu/drm/tests/Makefile                |   1 +
>  drivers/gpu/drm/tests/drm_probe_helper_test.c | 209 ++++++++++++++++++++++++++
>  include/drm/drm_probe_helper.h                |   1 +
>  4 files changed, 293 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tests/drm_probe_helper_test.c b/drivers/gpu/drm/tests/drm_probe_helper_test.c
> new file mode 100644
> index 000000000000..4f295b39f746
> --- /dev/null
> +++ b/drivers/gpu/drm/tests/drm_probe_helper_test.c
> @@ -0,0 +1,209 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Kunit test for drm_probe_helper functions
> + */
> +
> +#include <drm/drm_atomic_state_helper.h>
> +#include <drm/drm_connector.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_mode.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_modeset_helper_vtables.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#include <kunit/test.h>
> +
> +#include "drm_kunit_helpers.h"
> +
> +static const struct drm_display_mode ntsc_mode = {
> +	DRM_MODE("720x480i", 0, 13500,
> +		 720, 736, 800, 858, 0,
> +		 480, 486, 492, 525, 0,
> +		 DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_INTERLACE)
> +};
> +
> +static const struct drm_display_mode pal_mode = {
> +	DRM_MODE("720x576i", 0, 13500,
> +		 720, 732, 796, 864, 0,
> +		 576, 581, 587, 625, 0,
> +		 DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_INTERLACE)
> +};
> +
> +struct drm_probe_helper_test_priv {
> +	struct drm_device *drm;
> +	struct drm_connector connector;
> +};
> +
> +static const struct drm_connector_helper_funcs drm_probe_helper_connector_helper_funcs = {
> +};
> +
> +static const struct drm_connector_funcs drm_probe_helper_connector_funcs = {
> +	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
> +	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
> +	.reset			= drm_atomic_helper_connector_reset,
> +};
> +
> +static int drm_probe_helper_test_init(struct kunit *test)
> +{
> +	struct drm_probe_helper_test_priv *priv;
> +	struct drm_connector *connector;
> +	int ret;
> +
> +	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, priv);
> +	test->priv = priv;
> +
> +	priv->drm = drm_kunit_device_init(test, DRIVER_MODESET | DRIVER_ATOMIC,
> +					  "drm-probe-helper-test");
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->drm);
> +
> +	connector = &priv->connector;
> +	ret = drmm_connector_init(priv->drm, connector,
> +				  &drm_probe_helper_connector_funcs,
> +				  DRM_MODE_CONNECTOR_Unknown,
> +				  NULL);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	drm_connector_helper_add(connector, &drm_probe_helper_connector_helper_funcs);
> +
> +	return 0;
> +}
> +
> +struct drm_connector_helper_tv_get_modes_test {
> +	const char *name;
> +	unsigned int supported_tv_modes;
> +	enum drm_connector_tv_mode default_mode;
> +	bool cmdline;
> +	enum drm_connector_tv_mode cmdline_mode;
> +	const struct drm_display_mode **expected_modes;
> +	unsigned int num_expected_modes;
> +};
> +
> +#define _TV_MODE_TEST(_name, _supported, _default, _cmdline, _cmdline_mode, ...) 			\
> +	{												\
> +		.name = _name,										\
> +		.supported_tv_modes = _supported,							\
> +		.default_mode = _default,								\
> +		.cmdline = _cmdline,									\
> +		.cmdline_mode = _cmdline_mode,								\
> +		.expected_modes = (const struct drm_display_mode*[]) { __VA_ARGS__ }, 			\
> +		.num_expected_modes = sizeof((const struct drm_display_mode*[]) { __VA_ARGS__ }) /	\
> +				      (sizeof(const struct drm_display_mode*)),				\
> +	}
> +
> +#define TV_MODE_TEST(_name, _supported, _default, ...)			\
> +	_TV_MODE_TEST(_name, _supported, _default, false, 0, __VA_ARGS__)
> +
> +#define TV_MODE_TEST_CMDLINE(_name, _supported, _default, _cmdline, ...) \
> +	_TV_MODE_TEST(_name, _supported, _default, true, _cmdline, __VA_ARGS__)
> +
> +static void
> +drm_test_connector_helper_tv_get_modes_check(struct kunit *test)
> +{
> +	const struct drm_connector_helper_tv_get_modes_test *params = test->param_value;
> +	struct drm_probe_helper_test_priv *priv = test->priv;
> +	struct drm_connector *connector = &priv->connector;
> +	struct drm_cmdline_mode *cmdline = &connector->cmdline_mode;
> +	struct drm_display_mode *mode;
> +	const struct drm_display_mode *expected;
> +	size_t len;
> +	int ret;
> +
> +	if (params->cmdline) {
> +		cmdline->tv_mode_specified = true;
> +		cmdline->tv_mode = params->cmdline_mode;
> +	}
> +
> +	ret = drm_mode_create_tv_properties(priv->drm, params->supported_tv_modes);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	drm_object_attach_property(&connector->base,
> +				   priv->drm->mode_config.tv_mode_property,
> +		 		   params->default_mode);
> +
> +	mutex_lock(&priv->drm->mode_config.mutex);
> +
> +	ret = drm_connector_helper_tv_get_modes(connector);
> +	KUNIT_EXPECT_EQ(test, ret, params->num_expected_modes);
> +
> +	list_for_each_entry(mode, &connector->probed_modes, head)
> +		len++;
> +	KUNIT_EXPECT_EQ(test, len, params->num_expected_modes);
> +
> +	if (params->num_expected_modes >= 1) {
> +		mode = list_first_entry_or_null(&connector->probed_modes,
> +						struct drm_display_mode, head);
> +		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mode);
> +
> +		expected = params->expected_modes[0];
> +		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, expected);
> +
> +		KUNIT_EXPECT_TRUE(test, drm_mode_equal(mode, expected));
> +		KUNIT_EXPECT_TRUE(test, mode->type & DRM_MODE_TYPE_PREFERRED);
> +	}
> +
> +	if (params->num_expected_modes >= 2) {
> +		mode = list_next_entry(mode, head);
> +		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mode);
> +
> +		expected = params->expected_modes[1];
> +		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, expected);
> +
> +		KUNIT_EXPECT_TRUE(test, drm_mode_equal(mode, expected));
> +		KUNIT_EXPECT_FALSE(test, mode->type & DRM_MODE_TYPE_PREFERRED);
> +	}
> +
> +	mutex_unlock(&priv->drm->mode_config.mutex);
> +}
> +
> +static const
> +struct drm_connector_helper_tv_get_modes_test drm_connector_helper_tv_get_modes_tests[] = {
> +	{ .name = "None" },
> +	TV_MODE_TEST("PAL", BIT(DRM_MODE_TV_MODE_PAL), DRM_MODE_TV_MODE_PAL, &pal_mode),
> +	TV_MODE_TEST("NTSC", BIT(DRM_MODE_TV_MODE_NTSC), DRM_MODE_TV_MODE_NTSC, &ntsc_mode),
> +	TV_MODE_TEST("Both, NTSC Default",
> +		     BIT(DRM_MODE_TV_MODE_NTSC) | BIT(DRM_MODE_TV_MODE_PAL),
> +		     DRM_MODE_TV_MODE_NTSC,
> +		     &ntsc_mode, &pal_mode),
> +	TV_MODE_TEST("Both, PAL Default",
> +		     BIT(DRM_MODE_TV_MODE_NTSC) | BIT(DRM_MODE_TV_MODE_PAL),
> +		     DRM_MODE_TV_MODE_PAL,
> +		     &pal_mode, &ntsc_mode),
> +	TV_MODE_TEST_CMDLINE("Both, NTSC Default, with PAL on command-line",
> +			     BIT(DRM_MODE_TV_MODE_NTSC) | BIT(DRM_MODE_TV_MODE_PAL),
> +			     DRM_MODE_TV_MODE_NTSC,
> +			     DRM_MODE_TV_MODE_PAL,
> +			     &pal_mode, &ntsc_mode),
> +	TV_MODE_TEST_CMDLINE("Both, PAL Default, with NTSC on command-line",
> +			     BIT(DRM_MODE_TV_MODE_NTSC) | BIT(DRM_MODE_TV_MODE_PAL),
> +			     DRM_MODE_TV_MODE_PAL,
> +			     DRM_MODE_TV_MODE_NTSC,
> +			     &ntsc_mode, &pal_mode),
> +};
> +
> +static void
> +drm_connector_helper_tv_get_modes_desc(const struct drm_connector_helper_tv_get_modes_test *t,
> +				       char *desc)
> +{
> +	sprintf(desc, "%s", t->name);
> +}
> +KUNIT_ARRAY_PARAM(drm_connector_helper_tv_get_modes,
> +		  drm_connector_helper_tv_get_modes_tests,
> +		  drm_connector_helper_tv_get_modes_desc);
> +
> +static struct kunit_case drm_test_connector_helper_tv_get_modes_tests[] = {
> +	KUNIT_CASE_PARAM(drm_test_connector_helper_tv_get_modes_check,
> +			 drm_connector_helper_tv_get_modes_gen_params),
> +	{ }
> +};
> +
> +static struct kunit_suite drm_test_connector_helper_tv_get_modes_suite = {
> +	.name = "drm_test_connector_helper_tv_get_modes",
> +	.init = drm_probe_helper_test_init,
> +	.test_cases = drm_test_connector_helper_tv_get_modes_tests,
> +};
> +
> +kunit_test_suites(
> +	&drm_test_connector_helper_tv_get_modes_suite
> +);

Considering that there is only one suite, you could use the
kunit_test_suite macro instead.

Moreover, it would be nice to run the checkpatch script on this test, as
there are a couple of problems with the code style.

Best Regards,
- Maíra Canal
