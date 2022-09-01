Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4AA35A9620
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 13:59:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 580BD10E6BA;
	Thu,  1 Sep 2022 11:59:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A6E910E6BA
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Sep 2022 11:59:42 +0000 (UTC)
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4MJKNF4zNQzDs1F;
 Thu,  1 Sep 2022 11:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1662033581; bh=O5Vyomm9qhtK+ycW7/g0l9ocuJSPJ7k2dv845DpHZaA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gvio2YjZ3m6VLQAIPUBvyXJDlEBPII2YKX9BkNDJXDx9VZODCOIRCbEGF8XsrWgRY
 KzJ7Mp3e677noynmaTv0qQYIiW0c+qH7Dbd00y13czIQ4Oq0SJ6r/ikkESBZtyreIp
 26zGynLpact57Xb85dNVX1btSKvP66mF/f9c0nDY=
X-Riseup-User-ID: D3E2F75143B30B8DF8DD008208FBF50EB0230A93A42FF9BB3DD5D20F40AFE0D8
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4MJKNC0tSkz5vTk;
 Thu,  1 Sep 2022 11:59:38 +0000 (UTC)
Message-ID: <fe393ba0-9dd9-2a39-39f6-a4f795a99877@riseup.net>
Date: Thu, 1 Sep 2022 08:59:35 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] drm/cmdline-parser: Merge negative tests
To: =?UTF-8?Q?Micha=c5=82_Winiarski?= <michal.winiarski@intel.com>,
 dri-devel@lists.freedesktop.org
References: <20220817211236.252091-1-michal.winiarski@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20220817211236.252091-1-michal.winiarski@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Latypov <dlatypov@google.com>,
 Arthur Grillo <arthur.grillo@usp.br>,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Michał

Applied both patches to drm-misc-next.

Best Regards,
- Maíra Canal

On 8/17/22 18:12, Michał Winiarski wrote:
> Negative tests can be expressed as a single parameterized test case,
> which highlights that we're following the same test logic (passing
> invalid cmdline and expecting drm_mode_parse_command_line_for_connector
> to fail), which improves readability.
> 
> v2: s/negative/invalid to be consistent with other testcases in DRM
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> Tested-by: Maíra Canal <mairacanal@riseup.net>
> ---
>  .../gpu/drm/tests/drm_cmdline_parser_test.c   | 293 ++++++------------
>  1 file changed, 103 insertions(+), 190 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_cmdline_parser_test.c b/drivers/gpu/drm/tests/drm_cmdline_parser_test.c
> index 59b29cdfdd35..3a46c7d6f2aa 100644
> --- a/drivers/gpu/drm/tests/drm_cmdline_parser_test.c
> +++ b/drivers/gpu/drm/tests/drm_cmdline_parser_test.c
> @@ -109,24 +109,6 @@ static void drm_cmdline_test_force_d_only(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, mode.force, DRM_FORCE_OFF);
>  }
>  
> -static void drm_cmdline_test_margin_only(struct kunit *test)
> -{
> -	struct drm_cmdline_mode mode = { };
> -	const char *cmdline = "m";
> -
> -	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
> -									   &no_connector, &mode));
> -}
> -
> -static void drm_cmdline_test_interlace_only(struct kunit *test)
> -{
> -	struct drm_cmdline_mode mode = { };
> -	const char *cmdline = "i";
> -
> -	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
> -									   &no_connector, &mode));
> -}
> -
>  static void drm_cmdline_test_res(struct kunit *test)
>  {
>  	struct drm_cmdline_mode mode = { };
> @@ -149,42 +131,6 @@ static void drm_cmdline_test_res(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, mode.force, DRM_FORCE_UNSPECIFIED);
>  }
>  
> -static void drm_cmdline_test_res_missing_x(struct kunit *test)
> -{
> -	struct drm_cmdline_mode mode = { };
> -	const char *cmdline = "x480";
> -
> -	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
> -									   &no_connector, &mode));
> -}
> -
> -static void drm_cmdline_test_res_missing_y(struct kunit *test)
> -{
> -	struct drm_cmdline_mode mode = { };
> -	const char *cmdline = "1024x";
> -
> -	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
> -									   &no_connector, &mode));
> -}
> -
> -static void drm_cmdline_test_res_bad_y(struct kunit *test)
> -{
> -	struct drm_cmdline_mode mode = { };
> -	const char *cmdline = "1024xtest";
> -
> -	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
> -									   &no_connector, &mode));
> -}
> -
> -static void drm_cmdline_test_res_missing_y_bpp(struct kunit *test)
> -{
> -	struct drm_cmdline_mode mode = { };
> -	const char *cmdline = "1024x-24";
> -
> -	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
> -									   &no_connector, &mode));
> -}
> -
>  static void drm_cmdline_test_res_vesa(struct kunit *test)
>  {
>  	struct drm_cmdline_mode mode = { };
> @@ -274,15 +220,6 @@ static void drm_cmdline_test_res_bpp(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, mode.force, DRM_FORCE_UNSPECIFIED);
>  }
>  
> -static void drm_cmdline_test_res_bad_bpp(struct kunit *test)
> -{
> -	struct drm_cmdline_mode mode = { };
> -	const char *cmdline = "720x480-test";
> -
> -	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
> -									   &no_connector, &mode));
> -}
> -
>  static void drm_cmdline_test_res_refresh(struct kunit *test)
>  {
>  	struct drm_cmdline_mode mode = { };
> @@ -306,15 +243,6 @@ static void drm_cmdline_test_res_refresh(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, mode.force, DRM_FORCE_UNSPECIFIED);
>  }
>  
> -static void drm_cmdline_test_res_bad_refresh(struct kunit *test)
> -{
> -	struct drm_cmdline_mode mode = { };
> -	const char *cmdline = "720x480@refresh";
> -
> -	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
> -									   &no_connector, &mode));
> -}
> -
>  static void drm_cmdline_test_res_bpp_refresh(struct kunit *test)
>  {
>  	struct drm_cmdline_mode mode = { };
> @@ -411,15 +339,6 @@ static void drm_cmdline_test_res_bpp_refresh_force_off(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, mode.force, DRM_FORCE_OFF);
>  }
>  
> -static void drm_cmdline_test_res_bpp_refresh_force_on_off(struct kunit *test)
> -{
> -	struct drm_cmdline_mode mode = { };
> -	const char *cmdline =  "720x480-24@60de";
> -
> -	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
> -									   &no_connector, &mode));
> -}
> -
>  static void drm_cmdline_test_res_bpp_refresh_force_on(struct kunit *test)
>  {
>  	struct drm_cmdline_mode mode = { };
> @@ -563,24 +482,6 @@ static void drm_cmdline_test_res_vesa_margins(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, mode.force, DRM_FORCE_UNSPECIFIED);
>  }
>  
> -static void drm_cmdline_test_res_invalid_mode(struct kunit *test)
> -{
> -	struct drm_cmdline_mode mode = { };
> -	const char *cmdline = "720x480f";
> -
> -	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
> -									   &no_connector, &mode));
> -}
> -
> -static void drm_cmdline_test_res_bpp_wrong_place_mode(struct kunit *test)
> -{
> -	struct drm_cmdline_mode mode = { };
> -	const char *cmdline = "720x480e-24";
> -
> -	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
> -									   &no_connector, &mode));
> -}
> -
>  static void drm_cmdline_test_name(struct kunit *test)
>  {
>  	struct drm_cmdline_mode mode = { };
> @@ -608,42 +509,6 @@ static void drm_cmdline_test_name_bpp(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, mode.bpp, 24);
>  }
>  
> -static void drm_cmdline_test_name_bpp_refresh(struct kunit *test)
> -{
> -	struct drm_cmdline_mode mode = { };
> -	const char *cmdline = "NTSC-24@60";
> -
> -	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
> -									   &no_connector, &mode));
> -}
> -
> -static void drm_cmdline_test_name_refresh(struct kunit *test)
> -{
> -	struct drm_cmdline_mode mode = { };
> -	const char *cmdline = "NTSC@60";
> -
> -	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
> -									   &no_connector, &mode));
> -}
> -
> -static void drm_cmdline_test_name_refresh_wrong_mode(struct kunit *test)
> -{
> -	struct drm_cmdline_mode mode = { };
> -	const char *cmdline = "NTSC@60m";
> -
> -	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
> -									   &no_connector, &mode));
> -}
> -
> -static void drm_cmdline_test_name_refresh_invalid_mode(struct kunit *test)
> -{
> -	struct drm_cmdline_mode mode = { };
> -	const char *cmdline = "NTSC@60f";
> -
> -	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
> -									   &no_connector, &mode));
> -}
> -
>  static void drm_cmdline_test_name_option(struct kunit *test)
>  {
>  	struct drm_cmdline_mode mode = { };
> @@ -762,33 +627,6 @@ static void drm_cmdline_test_rotate_270(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, mode.force, DRM_FORCE_UNSPECIFIED);
>  }
>  
> -static void drm_cmdline_test_rotate_multiple(struct kunit *test)
> -{
> -	struct drm_cmdline_mode mode = { };
> -	const char *cmdline = "720x480,rotate=0,rotate=90";
> -
> -	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
> -									   &no_connector, &mode));
> -}
> -
> -static void drm_cmdline_test_rotate_invalid_val(struct kunit *test)
> -{
> -	struct drm_cmdline_mode mode = { };
> -	const char *cmdline = "720x480,rotate=42";
> -
> -	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
> -									   &no_connector, &mode));
> -}
> -
> -static void drm_cmdline_test_rotate_truncated(struct kunit *test)
> -{
> -	struct drm_cmdline_mode mode = { };
> -	const char *cmdline = "720x480,rotate=";
> -
> -	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
> -									   &no_connector, &mode));
> -}
> -
>  static void drm_cmdline_test_hmirror(struct kunit *test)
>  {
>  	struct drm_cmdline_mode mode = { };
> @@ -885,15 +723,6 @@ static void drm_cmdline_test_multiple_options(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, mode.force, DRM_FORCE_UNSPECIFIED);
>  }
>  
> -static void drm_cmdline_test_invalid_option(struct kunit *test)
> -{
> -	struct drm_cmdline_mode mode = { };
> -	const char *cmdline = "720x480,test=42";
> -
> -	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
> -									   &no_connector, &mode));
> -}
> -
>  static void drm_cmdline_test_bpp_extra_and_option(struct kunit *test)
>  {
>  	struct drm_cmdline_mode mode = { };
> @@ -1006,64 +835,148 @@ static void drm_cmdline_test_panel_orientation(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, mode.force, DRM_FORCE_UNSPECIFIED);
>  }
>  
> +struct drm_cmdline_invalid_test {
> +	const char *name;
> +	const char *cmdline;
> +};
> +
> +static void drm_cmdline_test_invalid(struct kunit *test)
> +{
> +	const struct drm_cmdline_invalid_test *params = test->param_value;
> +	struct drm_cmdline_mode mode = { };
> +
> +	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(params->cmdline,
> +									   &no_connector,
> +									   &mode));
> +}
> +
> +static const struct drm_cmdline_invalid_test drm_cmdline_invalid_tests[] = {
> +	{
> +		.name = "margin_only",
> +		.cmdline = "m",
> +	},
> +	{
> +		.name = "interlace_only",
> +		.cmdline = "i",
> +	},
> +	{
> +		.name = "res_missing_x",
> +		.cmdline = "x480",
> +	},
> +	{
> +		.name = "res_missing_y",
> +		.cmdline = "1024x",
> +	},
> +	{
> +		.name = "res_bad_y",
> +		.cmdline = "1024xtest",
> +	},
> +	{
> +		.name = "res_missing_y_bpp",
> +		.cmdline = "1024x-24",
> +	},
> +	{
> +		.name = "res_bad_bpp",
> +		.cmdline = "720x480-test",
> +	},
> +	{
> +		.name = "res_bad_refresh",
> +		.cmdline = "720x480@refresh",
> +	},
> +	{
> +		.name = "res_bpp_refresh_force_on_off",
> +		.cmdline = "720x480-24@60de",
> +	},
> +	{
> +		.name = "res_invalid_mode",
> +		.cmdline = "720x480f",
> +	},
> +	{
> +		.name = "res_bpp_wrong_place_mode",
> +		.cmdline = "720x480e-24",
> +	},
> +	{
> +		.name = "name_bpp_refresh",
> +		.cmdline = "NTSC-24@60",
> +	},
> +	{
> +		.name = "name_refresh",
> +		.cmdline = "NTSC@60",
> +	},
> +	{
> +		.name = "name_refresh_wrong_mode",
> +		.cmdline = "NTSC@60m",
> +	},
> +	{
> +		.name = "name_refresh_invalid_mode",
> +		.cmdline = "NTSC@60f",
> +	},
> +	{
> +		.name = "rotate_multiple",
> +		.cmdline = "720x480,rotate=0,rotate=90",
> +	},
> +	{
> +		.name = "rotate_invalid_val",
> +		.cmdline = "720x480,rotate=42",
> +	},
> +	{
> +		.name = "rotate_truncated",
> +		.cmdline = "720x480,rotate=",
> +	},
> +	{
> +		.name = "invalid_option",
> +		.cmdline = "720x480,test=42",
> +	},
> +};
> +
> +static void drm_cmdline_invalid_desc(const struct drm_cmdline_invalid_test *t,
> +				     char *desc)
> +{
> +	sprintf(desc, "%s", t->name);
> +}
> +
> +KUNIT_ARRAY_PARAM(drm_cmdline_invalid, drm_cmdline_invalid_tests, drm_cmdline_invalid_desc);
> +
>  static struct kunit_case drm_cmdline_parser_tests[] = {
>  	KUNIT_CASE(drm_cmdline_test_force_d_only),
>  	KUNIT_CASE(drm_cmdline_test_force_D_only_dvi),
>  	KUNIT_CASE(drm_cmdline_test_force_D_only_hdmi),
>  	KUNIT_CASE(drm_cmdline_test_force_D_only_not_digital),
>  	KUNIT_CASE(drm_cmdline_test_force_e_only),
> -	KUNIT_CASE(drm_cmdline_test_margin_only),
> -	KUNIT_CASE(drm_cmdline_test_interlace_only),
>  	KUNIT_CASE(drm_cmdline_test_res),
> -	KUNIT_CASE(drm_cmdline_test_res_missing_x),
> -	KUNIT_CASE(drm_cmdline_test_res_missing_y),
> -	KUNIT_CASE(drm_cmdline_test_res_bad_y),
> -	KUNIT_CASE(drm_cmdline_test_res_missing_y_bpp),
>  	KUNIT_CASE(drm_cmdline_test_res_vesa),
>  	KUNIT_CASE(drm_cmdline_test_res_vesa_rblank),
>  	KUNIT_CASE(drm_cmdline_test_res_rblank),
>  	KUNIT_CASE(drm_cmdline_test_res_bpp),
> -	KUNIT_CASE(drm_cmdline_test_res_bad_bpp),
>  	KUNIT_CASE(drm_cmdline_test_res_refresh),
> -	KUNIT_CASE(drm_cmdline_test_res_bad_refresh),
>  	KUNIT_CASE(drm_cmdline_test_res_bpp_refresh),
>  	KUNIT_CASE(drm_cmdline_test_res_bpp_refresh_interlaced),
>  	KUNIT_CASE(drm_cmdline_test_res_bpp_refresh_margins),
>  	KUNIT_CASE(drm_cmdline_test_res_bpp_refresh_force_off),
> -	KUNIT_CASE(drm_cmdline_test_res_bpp_refresh_force_on_off),
>  	KUNIT_CASE(drm_cmdline_test_res_bpp_refresh_force_on),
>  	KUNIT_CASE(drm_cmdline_test_res_bpp_refresh_force_on_analog),
>  	KUNIT_CASE(drm_cmdline_test_res_bpp_refresh_force_on_digital),
>  	KUNIT_CASE(drm_cmdline_test_res_bpp_refresh_interlaced_margins_force_on),
>  	KUNIT_CASE(drm_cmdline_test_res_margins_force_on),
>  	KUNIT_CASE(drm_cmdline_test_res_vesa_margins),
> -	KUNIT_CASE(drm_cmdline_test_res_invalid_mode),
> -	KUNIT_CASE(drm_cmdline_test_res_bpp_wrong_place_mode),
>  	KUNIT_CASE(drm_cmdline_test_name),
>  	KUNIT_CASE(drm_cmdline_test_name_bpp),
> -	KUNIT_CASE(drm_cmdline_test_name_refresh),
> -	KUNIT_CASE(drm_cmdline_test_name_bpp_refresh),
> -	KUNIT_CASE(drm_cmdline_test_name_refresh_wrong_mode),
> -	KUNIT_CASE(drm_cmdline_test_name_refresh_invalid_mode),
>  	KUNIT_CASE(drm_cmdline_test_name_option),
>  	KUNIT_CASE(drm_cmdline_test_name_bpp_option),
>  	KUNIT_CASE(drm_cmdline_test_rotate_0),
>  	KUNIT_CASE(drm_cmdline_test_rotate_90),
>  	KUNIT_CASE(drm_cmdline_test_rotate_180),
>  	KUNIT_CASE(drm_cmdline_test_rotate_270),
> -	KUNIT_CASE(drm_cmdline_test_rotate_multiple),
> -	KUNIT_CASE(drm_cmdline_test_rotate_invalid_val),
> -	KUNIT_CASE(drm_cmdline_test_rotate_truncated),
>  	KUNIT_CASE(drm_cmdline_test_hmirror),
>  	KUNIT_CASE(drm_cmdline_test_vmirror),
>  	KUNIT_CASE(drm_cmdline_test_margin_options),
>  	KUNIT_CASE(drm_cmdline_test_multiple_options),
> -	KUNIT_CASE(drm_cmdline_test_invalid_option),
>  	KUNIT_CASE(drm_cmdline_test_bpp_extra_and_option),
>  	KUNIT_CASE(drm_cmdline_test_extra_and_option),
>  	KUNIT_CASE(drm_cmdline_test_freestanding_options),
>  	KUNIT_CASE(drm_cmdline_test_freestanding_force_e_and_options),
>  	KUNIT_CASE(drm_cmdline_test_panel_orientation),
> +	KUNIT_CASE_PARAM(drm_cmdline_test_invalid, drm_cmdline_invalid_gen_params),
>  	{}
>  };
>  
