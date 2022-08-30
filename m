Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A178E5A63BC
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 14:44:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E763E10E0AB;
	Tue, 30 Aug 2022 12:44:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CA2C10E0AB;
 Tue, 30 Aug 2022 12:44:16 +0000 (UTC)
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4MH6SZ4KNnzDqYX;
 Tue, 30 Aug 2022 12:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1661863455; bh=uZMlrgjdtYHPfnYgaoLEQXYNDFmWqkQNUlugxV7e01Y=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nn107C3HMKJ3EWboC9fBpeFAH3y/uZ1KjPZ08ApweCMS5qqRUGsyCU4sj4TPMD4V2
 FXAIjjOhdjbHG+ioenblciw6poCAjWfiza/YFNCFS8O2MJGpolad6x7SZAwuOVzG46
 wyq78GJSkRl5qnfSCdVdIs3k6a+QiliQYkFs/kZc=
X-Riseup-User-ID: F5CCEA00DF4334D3899ABC01531EBEE332C82C80DFBDDAC361B7E3BA0D8BEA06
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4MH6SP4gKBz5vXJ;
 Tue, 30 Aug 2022 12:44:05 +0000 (UTC)
Message-ID: <89ae0eb2-7838-6bb0-65b8-02ec0a6bb564@riseup.net>
Date: Tue, 30 Aug 2022 09:44:03 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v2 19/41] drm/modes: Introduce the tv_mode property as a
 command-line option
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Maxime Ripard <mripard@kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>, Lyude Paul <lyude@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Karol Herbst <kherbst@redhat.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Emma Anholt <emma@anholt.net>, Daniel Vetter <daniel@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-19-459522d653a7@cerno.tech>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-19-459522d653a7@cerno.tech>
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/29/22 10:11, Maxime Ripard wrote:
> Our new tv mode option allows to specify the TV mode from a property.
> However, it can still be useful, for example to avoid any boot time
> artifact, to set that property directly from the kernel command line.
> 
> Let's add some code to allow it, and some unit tests to exercise that code.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> index 73d01e755496..a759a4ba0036 100644
> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -2115,6 +2115,30 @@ static int drm_mode_parse_panel_orientation(const char *delim,
>  	return 0;
>  }
>  
> +static int drm_mode_parse_tv_mode(const char *delim,
> +				  struct drm_cmdline_mode *mode)
> +{
> +	const char *value;
> +	unsigned int len;
> +	int ret;
> +
> +	if (*delim != '=')
> +		return -EINVAL;
> +
> +	value = delim + 1;
> +	delim = strchr(value, ',');
> +	if (!delim)
> +		delim = value + strlen(value);
> +
> +	ret = drm_get_tv_mode_from_name(value, delim - value);
> +	if (ret < 0)
> +		return ret;
> +
> +	mode->tv_mode = ret;
> +
> +	return 0;
> +}
> +
>  static int drm_mode_parse_cmdline_options(const char *str,
>  					  bool freestanding,
>  					  const struct drm_connector *connector,
> @@ -2184,6 +2208,9 @@ static int drm_mode_parse_cmdline_options(const char *str,
>  		} else if (!strncmp(option, "panel_orientation", delim - option)) {
>  			if (drm_mode_parse_panel_orientation(delim, mode))
>  				return -EINVAL;
> +		} else if (!strncmp(option, "tv_mode", delim - option)) {
> +			if (drm_mode_parse_tv_mode(delim, mode))
> +				return -EINVAL;
>  		} else {
>  			return -EINVAL;
>  		}
> @@ -2212,20 +2239,22 @@ struct drm_named_mode {
>  	unsigned int xres;
>  	unsigned int yres;
>  	unsigned int flags;
> +	unsigned int tv_mode;
>  };
>  
> -#define NAMED_MODE(_name, _pclk, _x, _y, _flags)	\
> +#define NAMED_MODE(_name, _pclk, _x, _y, _flags, _mode)	\
>  	{						\
>  		.name = _name,				\
>  		.pixel_clock_khz = _pclk,		\
>  		.xres = _x,				\
>  		.yres = _y,				\
>  		.flags = _flags,			\
> +		.tv_mode = _mode,			\
>  	}
>  
>  static const struct drm_named_mode drm_named_modes[] = {
> -	NAMED_MODE("NTSC", 13500, 720, 480, DRM_MODE_FLAG_INTERLACE),
> -	NAMED_MODE("PAL", 13500, 720, 576, DRM_MODE_FLAG_INTERLACE),
> +	NAMED_MODE("NTSC", 13500, 720, 480, DRM_MODE_FLAG_INTERLACE, DRM_MODE_TV_MODE_NTSC_M),
> +	NAMED_MODE("PAL", 13500, 720, 576, DRM_MODE_FLAG_INTERLACE, DRM_MODE_TV_MODE_PAL_B),
>  };
>  
>  static int drm_mode_parse_cmdline_named_mode(const char *name,
> @@ -2271,6 +2300,7 @@ static int drm_mode_parse_cmdline_named_mode(const char *name,
>  		cmdline_mode->xres = mode->xres;
>  		cmdline_mode->yres = mode->yres;
>  		cmdline_mode->interlace = !!(mode->flags & DRM_MODE_FLAG_INTERLACE);
> +		cmdline_mode->tv_mode = mode->tv_mode;
>  		cmdline_mode->specified = true;
>  
>  		return 1;
> diff --git a/drivers/gpu/drm/tests/drm_cmdline_parser_test.c b/drivers/gpu/drm/tests/drm_cmdline_parser_test.c
> index 59b29cdfdd35..f1e73ed65be0 100644
> --- a/drivers/gpu/drm/tests/drm_cmdline_parser_test.c
> +++ b/drivers/gpu/drm/tests/drm_cmdline_parser_test.c
> @@ -885,6 +885,201 @@ static void drm_cmdline_test_multiple_options(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, mode.force, DRM_FORCE_UNSPECIFIED);
>  }
>  
> +static void drm_cmdline_test_tv_options(struct kunit *test,
> +					const char *cmdline,
> +					const struct drm_display_mode *expected_mode,
> +					unsigned int expected_tv_mode)
> +{
> +	struct drm_cmdline_mode mode = { };
> +
> +	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +									  &no_connector, &mode));
> +	KUNIT_EXPECT_TRUE(test, mode.specified);
> +	KUNIT_EXPECT_EQ(test, mode.xres, expected_mode->hdisplay);
> +	KUNIT_EXPECT_EQ(test, mode.yres, expected_mode->vdisplay);
> +	KUNIT_EXPECT_EQ(test, mode.tv_mode, expected_tv_mode);
> +
> +	KUNIT_EXPECT_FALSE(test, mode.refresh_specified);
> +
> +	KUNIT_EXPECT_FALSE(test, mode.bpp_specified);
> +
> +	KUNIT_EXPECT_FALSE(test, mode.rb);
> +	KUNIT_EXPECT_FALSE(test, mode.cvt);
> +	KUNIT_EXPECT_EQ(test, mode.interlace, !!(expected_mode->flags & DRM_MODE_FLAG_INTERLACE));
> +	KUNIT_EXPECT_FALSE(test, mode.margins);
> +	KUNIT_EXPECT_EQ(test, mode.force, DRM_FORCE_UNSPECIFIED);
> +}
> +
> +static void drm_cmdline_test_tv_option_ntsc_443(struct kunit *test)
> +{
> +	drm_cmdline_test_tv_options(test,
> +				    "720x480i,tv_mode=NTSC-443",
> +				    drm_mode_analog_ntsc_480i(NULL),
> +				    DRM_MODE_TV_MODE_NTSC_443);
> +}
> +
> +static void drm_cmdline_test_tv_option_ntsc_j(struct kunit *test)
> +{
> +	drm_cmdline_test_tv_options(test,
> +				    "720x480i,tv_mode=NTSC-J",
> +				    drm_mode_analog_ntsc_480i(NULL),
> +				    DRM_MODE_TV_MODE_NTSC_J);
> +}
> +
> +static void drm_cmdline_test_tv_option_ntsc_m(struct kunit *test)
> +{
> +	drm_cmdline_test_tv_options(test,
> +				    "720x480i,tv_mode=NTSC-M",
> +				    drm_mode_analog_ntsc_480i(NULL),
> +				    DRM_MODE_TV_MODE_NTSC_M);
> +}
> +
> +static void drm_cmdline_test_tv_option_pal_60(struct kunit *test)
> +{
> +	drm_cmdline_test_tv_options(test,
> +				    "720x576i,tv_mode=PAL-60",
> +				    drm_mode_analog_pal_576i(NULL),
> +				    DRM_MODE_TV_MODE_PAL_60);
> +}
> +
> +static void drm_cmdline_test_tv_option_pal_b(struct kunit *test)
> +{
> +	drm_cmdline_test_tv_options(test,
> +				    "720x576i,tv_mode=PAL-B",
> +				    drm_mode_analog_pal_576i(NULL),
> +				    DRM_MODE_TV_MODE_PAL_B);
> +}
> +
> +static void drm_cmdline_test_tv_option_pal_d(struct kunit *test)
> +{
> +	drm_cmdline_test_tv_options(test,
> +				    "720x576i,tv_mode=PAL-D",
> +				    drm_mode_analog_pal_576i(NULL),
> +				    DRM_MODE_TV_MODE_PAL_D);
> +}
> +
> +static void drm_cmdline_test_tv_option_pal_g(struct kunit *test)
> +{
> +	drm_cmdline_test_tv_options(test,
> +				    "720x576i,tv_mode=PAL-G",
> +				    drm_mode_analog_pal_576i(NULL),
> +				    DRM_MODE_TV_MODE_PAL_G);
> +}
> +
> +static void drm_cmdline_test_tv_option_pal_h(struct kunit *test)
> +{
> +	drm_cmdline_test_tv_options(test,
> +				    "720x576i,tv_mode=PAL-H",
> +				    drm_mode_analog_pal_576i(NULL),
> +				    DRM_MODE_TV_MODE_PAL_H);
> +}
> +
> +static void drm_cmdline_test_tv_option_pal_i(struct kunit *test)
> +{
> +	drm_cmdline_test_tv_options(test,
> +				    "720x576i,tv_mode=PAL-I",
> +				    drm_mode_analog_pal_576i(NULL),
> +				    DRM_MODE_TV_MODE_PAL_I);
> +}
> +
> +static void drm_cmdline_test_tv_option_pal_m(struct kunit *test)
> +{
> +	drm_cmdline_test_tv_options(test,
> +				    "720x480i,tv_mode=PAL-M",
> +				    drm_mode_analog_ntsc_480i(NULL),
> +				    DRM_MODE_TV_MODE_PAL_M);
> +}
> +
> +static void drm_cmdline_test_tv_option_pal_n(struct kunit *test)
> +{
> +	drm_cmdline_test_tv_options(test,
> +				    "720x576i,tv_mode=PAL-N",
> +				    drm_mode_analog_pal_576i(NULL),
> +				    DRM_MODE_TV_MODE_PAL_N);
> +}
> +
> +static void drm_cmdline_test_tv_option_pal_nc(struct kunit *test)
> +{
> +	drm_cmdline_test_tv_options(test,
> +				    "720x576i,tv_mode=PAL-Nc",
> +				    drm_mode_analog_pal_576i(NULL),
> +				    DRM_MODE_TV_MODE_PAL_NC);
> +}
> +
> +static void drm_cmdline_test_tv_option_secam_60(struct kunit *test)
> +{
> +	drm_cmdline_test_tv_options(test,
> +				    "720x576i,tv_mode=SECAM-60",
> +				    drm_mode_analog_pal_576i(NULL),
> +				    DRM_MODE_TV_MODE_SECAM_60);
> +}
> +
> +static void drm_cmdline_test_tv_option_secam_b(struct kunit *test)
> +{
> +	drm_cmdline_test_tv_options(test,
> +				    "720x576i,tv_mode=SECAM-B",
> +				    drm_mode_analog_pal_576i(NULL),
> +				    DRM_MODE_TV_MODE_SECAM_B);
> +}
> +
> +static void drm_cmdline_test_tv_option_secam_d(struct kunit *test)
> +{
> +	drm_cmdline_test_tv_options(test,
> +				    "720x576i,tv_mode=SECAM-D",
> +				    drm_mode_analog_pal_576i(NULL),
> +				    DRM_MODE_TV_MODE_SECAM_D);
> +}
> +
> +static void drm_cmdline_test_tv_option_secam_g(struct kunit *test)
> +{
> +	drm_cmdline_test_tv_options(test,
> +				    "720x576i,tv_mode=SECAM-G",
> +				    drm_mode_analog_pal_576i(NULL),
> +				    DRM_MODE_TV_MODE_SECAM_G);
> +}
> +
> +static void drm_cmdline_test_tv_option_secam_k(struct kunit *test)
> +{
> +	drm_cmdline_test_tv_options(test,
> +				    "720x576i,tv_mode=SECAM-K",
> +				    drm_mode_analog_pal_576i(NULL),
> +				    DRM_MODE_TV_MODE_SECAM_K);
> +}
> +
> +static void drm_cmdline_test_tv_option_secam_k1(struct kunit *test)
> +{
> +	drm_cmdline_test_tv_options(test,
> +				    "720x576i,tv_mode=SECAM-K1",
> +				    drm_mode_analog_pal_576i(NULL),
> +				    DRM_MODE_TV_MODE_SECAM_K1);
> +}
> +
> +static void drm_cmdline_test_tv_option_secam_l(struct kunit *test)
> +{
> +	drm_cmdline_test_tv_options(test,
> +				    "720x576i,tv_mode=SECAM-L",
> +				    drm_mode_analog_pal_576i(NULL),
> +				    DRM_MODE_TV_MODE_SECAM_L);
> +}

Instead of creating a function to each drm_cmdline_test_tv_options test,
you can create a parameterized test [1] for this function. This will
help the readability of the tests.

[1] https://docs.kernel.org/dev-tools/kunit/usage.html#parameterized-testing

> +
> +static void drm_cmdline_test_tv_option_invalid(struct kunit *test)
> +{
> +	struct drm_cmdline_mode mode = { };
> +	const char *cmdline = "720x480i,tv_mode=invalid";
> +
> +	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +									   &no_connector, &mode));
> +}
> +
> +static void drm_cmdline_test_tv_option_truncated(struct kunit *test)
> +{
> +	struct drm_cmdline_mode mode = { };
> +	const char *cmdline = "720x480i,tv_mode=NTSC";
> +
> +	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +									   &no_connector, &mode));
> +}
> +

I guess this tests can be incorporated in the future to the negative
tests from Michał Winiarski [2]. I don't know which one will be merged
first.

[2]
https://lore.kernel.org/dri-devel/20220817211236.252091-1-michal.winiarski@intel.com/

Best Regards,
- Maíra Canal

>  static void drm_cmdline_test_invalid_option(struct kunit *test)
>  {
>  	struct drm_cmdline_mode mode = { };
> @@ -1047,6 +1242,27 @@ static struct kunit_case drm_cmdline_parser_tests[] = {
>  	KUNIT_CASE(drm_cmdline_test_name_refresh_invalid_mode),
>  	KUNIT_CASE(drm_cmdline_test_name_option),
>  	KUNIT_CASE(drm_cmdline_test_name_bpp_option),
> +	KUNIT_CASE(drm_cmdline_test_tv_option_ntsc_443),
> +	KUNIT_CASE(drm_cmdline_test_tv_option_ntsc_j),
> +	KUNIT_CASE(drm_cmdline_test_tv_option_ntsc_m),
> +	KUNIT_CASE(drm_cmdline_test_tv_option_pal_60),
> +	KUNIT_CASE(drm_cmdline_test_tv_option_pal_b),
> +	KUNIT_CASE(drm_cmdline_test_tv_option_pal_d),
> +	KUNIT_CASE(drm_cmdline_test_tv_option_pal_g),
> +	KUNIT_CASE(drm_cmdline_test_tv_option_pal_h),
> +	KUNIT_CASE(drm_cmdline_test_tv_option_pal_i),
> +	KUNIT_CASE(drm_cmdline_test_tv_option_pal_m),
> +	KUNIT_CASE(drm_cmdline_test_tv_option_pal_n),
> +	KUNIT_CASE(drm_cmdline_test_tv_option_pal_nc),
> +	KUNIT_CASE(drm_cmdline_test_tv_option_secam_60),
> +	KUNIT_CASE(drm_cmdline_test_tv_option_secam_b),
> +	KUNIT_CASE(drm_cmdline_test_tv_option_secam_d),
> +	KUNIT_CASE(drm_cmdline_test_tv_option_secam_g),
> +	KUNIT_CASE(drm_cmdline_test_tv_option_secam_k),
> +	KUNIT_CASE(drm_cmdline_test_tv_option_secam_k1),
> +	KUNIT_CASE(drm_cmdline_test_tv_option_secam_l),
> +	KUNIT_CASE(drm_cmdline_test_tv_option_invalid),
> +	KUNIT_CASE(drm_cmdline_test_tv_option_truncated),
>  	KUNIT_CASE(drm_cmdline_test_rotate_0),
>  	KUNIT_CASE(drm_cmdline_test_rotate_90),
>  	KUNIT_CASE(drm_cmdline_test_rotate_180),
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 49d261977d4e..9589108ba202 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1447,6 +1447,11 @@ struct drm_cmdline_mode {
>  	 * @tv_margins: TV margins to apply to the mode.
>  	 */
>  	struct drm_connector_tv_margins tv_margins;
> +
> +	/**
> +	 * @tv_mode: TV mode standard. See DRM_MODE_TV_MODE_*.
> +	 */
> +	enum drm_connector_tv_mode tv_mode;
>  };
>  
>  /**
> 
