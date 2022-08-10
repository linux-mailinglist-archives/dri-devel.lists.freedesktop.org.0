Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E732858ED90
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 15:46:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 748A114B4AE;
	Wed, 10 Aug 2022 13:45:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC9C1A8AE6
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 13:45:41 +0000 (UTC)
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4M2rmh5lYFz9sVh;
 Wed, 10 Aug 2022 13:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1660139141; bh=XvOOS2CBq57S4/YNmFwch1/d/yTa53J1FVHI/C4gNz8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VDRpMlI421iGeg/5ezMieASgFjqjcwjVpHlUsgLcdkBkReX3yjsleiUcwBYssKay4
 CJmmRNb5VmhFkszNqBIAz4U/MaojFlCDwrRhqKLtcqBRiGNrBByVY0n+2Kc1nGxs9y
 pWrh+pE1M/nvcIEkPh/YCrAUbkWWlFNrYM/gO6EA=
X-Riseup-User-ID: D2558E71B6E624A0A293CD9ED8C306E29A1C9E6CFAADE9D4A7A273F7228E849D
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4M2rmX0Hnsz5vTk;
 Wed, 10 Aug 2022 13:45:31 +0000 (UTC)
Message-ID: <b5e6b793-a6e0-1d0c-932d-08dcf5e4e79a@riseup.net>
Date: Wed, 10 Aug 2022 10:45:28 -0300
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] drm/cmdline-parser: Use assert when needed
Content-Language: en-US
To: =?UTF-8?Q?Micha=c5=82_Winiarski?= <michal.winiarski@intel.com>,
 dri-devel@lists.freedesktop.org
References: <20220804131704.97083-1-michal.winiarski@intel.com>
 <20220804131704.97083-2-michal.winiarski@intel.com>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20220804131704.97083-2-michal.winiarski@intel.com>
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
 Javier Martinez Canillas <javierm@redhat.com>,
 Arthur Grillo <arthur.grillo@usp.br>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Michał

On 8/4/22 10:17, Michał Winiarski wrote:
> Expecting to observe a specific value, when the function responsible for
> setting the value has failed will lead to extra noise in test output.
> Use assert when the situation calls for it.
> Also - very small tidying up around the changed areas (whitespace /
> variable locality).
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  .../gpu/drm/tests/drm_cmdline_parser_test.c   | 93 +++++++++----------
>  1 file changed, 46 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_cmdline_parser_test.c b/drivers/gpu/drm/tests/drm_cmdline_parser_test.c
> index 058808faaf4a..7a313e2fd52a 100644
> --- a/drivers/gpu/drm/tests/drm_cmdline_parser_test.c
> +++ b/drivers/gpu/drm/tests/drm_cmdline_parser_test.c
> @@ -16,7 +16,7 @@ static void drm_cmdline_test_force_e_only(struct kunit *test)
>  	struct drm_cmdline_mode mode = { };
>  	const char *cmdline = "e";
>  
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>  									  &no_connector, &mode));
>  	KUNIT_EXPECT_FALSE(test, mode.specified);
>  	KUNIT_EXPECT_FALSE(test, mode.refresh_specified);
> @@ -34,7 +34,7 @@ static void drm_cmdline_test_force_D_only_not_digital(struct kunit *test)
>  	struct drm_cmdline_mode mode = { };
>  	const char *cmdline = "D";
>  
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>  									  &no_connector, &mode));
>  	KUNIT_EXPECT_FALSE(test, mode.specified);
>  	KUNIT_EXPECT_FALSE(test, mode.refresh_specified);
> @@ -47,16 +47,16 @@ static void drm_cmdline_test_force_D_only_not_digital(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, mode.force, DRM_FORCE_ON);
>  }
>  
> -static const struct drm_connector connector_hdmi = {
> -	.connector_type	= DRM_MODE_CONNECTOR_HDMIB,
> -};

Minor nit: I guess you miss to delete a line.

>  
>  static void drm_cmdline_test_force_D_only_hdmi(struct kunit *test)
>  {
>  	struct drm_cmdline_mode mode = { };
> +	const struct drm_connector connector_hdmi = {
> +		.connector_type	= DRM_MODE_CONNECTOR_HDMIB,
> +	};


As the kernel test robot pointed out, this leads to stack issues (also
with PowerPC). You might want to leave it as it was or allocate it with
kunit_kzalloc.

Best Regards,
- Maíra Canal


>  	const char *cmdline = "D";
>  
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>  									  &connector_hdmi, &mode));
>  	KUNIT_EXPECT_FALSE(test, mode.specified);
>  	KUNIT_EXPECT_FALSE(test, mode.refresh_specified);
> @@ -69,16 +69,15 @@ static void drm_cmdline_test_force_D_only_hdmi(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, mode.force, DRM_FORCE_ON_DIGITAL);
>  }
>  
> -static const struct drm_connector connector_dvi = {
> -	.connector_type	= DRM_MODE_CONNECTOR_DVII,
> -};
> -
>  static void drm_cmdline_test_force_D_only_dvi(struct kunit *test)
>  {
>  	struct drm_cmdline_mode mode = { };
> +	const struct drm_connector connector_dvi = {
> +		.connector_type = DRM_MODE_CONNECTOR_DVII,
> +	};>  	const char *cmdline = "D";
>  
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>  									  &connector_dvi, &mode));
>  	KUNIT_EXPECT_FALSE(test, mode.specified);
>  	KUNIT_EXPECT_FALSE(test, mode.refresh_specified);
> @@ -96,7 +95,7 @@ static void drm_cmdline_test_force_d_only(struct kunit *test)
>  	struct drm_cmdline_mode mode = { };
>  	const char *cmdline = "d";
>  
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>  									  &no_connector, &mode));
>  	KUNIT_EXPECT_FALSE(test, mode.specified);
>  	KUNIT_EXPECT_FALSE(test, mode.refresh_specified);
> @@ -114,7 +113,7 @@ static void drm_cmdline_test_res(struct kunit *test)
>  	struct drm_cmdline_mode mode = { };
>  	const char *cmdline = "720x480";
>  
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>  									  &no_connector, &mode));
>  	KUNIT_EXPECT_TRUE(test, mode.specified);
>  	KUNIT_EXPECT_EQ(test, mode.xres, 720);
> @@ -136,7 +135,7 @@ static void drm_cmdline_test_res_vesa(struct kunit *test)
>  	struct drm_cmdline_mode mode = { };
>  	const char *cmdline = "720x480M";
>  
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>  									  &no_connector, &mode));
>  	KUNIT_EXPECT_TRUE(test, mode.specified);
>  	KUNIT_EXPECT_EQ(test, mode.xres, 720);
> @@ -158,7 +157,7 @@ static void drm_cmdline_test_res_vesa_rblank(struct kunit *test)
>  	struct drm_cmdline_mode mode = { };
>  	const char *cmdline = "720x480MR";
>  
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>  									  &no_connector, &mode));
>  	KUNIT_EXPECT_TRUE(test, mode.specified);
>  	KUNIT_EXPECT_EQ(test, mode.xres, 720);
> @@ -180,7 +179,7 @@ static void drm_cmdline_test_res_rblank(struct kunit *test)
>  	struct drm_cmdline_mode mode = { };
>  	const char *cmdline = "720x480R";
>  
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>  									  &no_connector, &mode));
>  	KUNIT_EXPECT_TRUE(test, mode.specified);
>  	KUNIT_EXPECT_EQ(test, mode.xres, 720);
> @@ -202,7 +201,7 @@ static void drm_cmdline_test_res_bpp(struct kunit *test)
>  	struct drm_cmdline_mode mode = { };
>  	const char *cmdline = "720x480-24";
>  
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>  									  &no_connector, &mode));
>  	KUNIT_EXPECT_TRUE(test, mode.specified);
>  	KUNIT_EXPECT_EQ(test, mode.xres, 720);
> @@ -225,7 +224,7 @@ static void drm_cmdline_test_res_refresh(struct kunit *test)
>  	struct drm_cmdline_mode mode = { };
>  	const char *cmdline = "720x480@60";
>  
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>  									  &no_connector, &mode));
>  	KUNIT_EXPECT_TRUE(test, mode.specified);
>  	KUNIT_EXPECT_EQ(test, mode.xres, 720);
> @@ -248,7 +247,7 @@ static void drm_cmdline_test_res_bpp_refresh(struct kunit *test)
>  	struct drm_cmdline_mode mode = { };
>  	const char *cmdline = "720x480-24@60";
>  
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>  									  &no_connector, &mode));
>  	KUNIT_EXPECT_TRUE(test, mode.specified);
>  	KUNIT_EXPECT_EQ(test, mode.xres, 720);
> @@ -272,7 +271,7 @@ static void drm_cmdline_test_res_bpp_refresh_interlaced(struct kunit *test)
>  	struct drm_cmdline_mode mode = { };
>  	const char *cmdline = "720x480-24@60i";
>  
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>  									  &no_connector, &mode));
>  	KUNIT_EXPECT_TRUE(test, mode.specified);
>  	KUNIT_EXPECT_EQ(test, mode.xres, 720);
> @@ -294,9 +293,9 @@ static void drm_cmdline_test_res_bpp_refresh_interlaced(struct kunit *test)
>  static void drm_cmdline_test_res_bpp_refresh_margins(struct kunit *test)
>  {
>  	struct drm_cmdline_mode mode = { };
> -	const char *cmdline =  "720x480-24@60m";
> +	const char *cmdline = "720x480-24@60m";
>  
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>  									  &no_connector, &mode));
>  	KUNIT_EXPECT_TRUE(test, mode.specified);
>  	KUNIT_EXPECT_EQ(test, mode.xres, 720);
> @@ -318,9 +317,9 @@ static void drm_cmdline_test_res_bpp_refresh_margins(struct kunit *test)
>  static void drm_cmdline_test_res_bpp_refresh_force_off(struct kunit *test)
>  {
>  	struct drm_cmdline_mode mode = { };
> -	const char *cmdline =  "720x480-24@60d";
> +	const char *cmdline = "720x480-24@60d";
>  
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>  									  &no_connector, &mode));
>  	KUNIT_EXPECT_TRUE(test, mode.specified);
>  	KUNIT_EXPECT_EQ(test, mode.xres, 720);
> @@ -342,9 +341,9 @@ static void drm_cmdline_test_res_bpp_refresh_force_off(struct kunit *test)
>  static void drm_cmdline_test_res_bpp_refresh_force_on(struct kunit *test)
>  {
>  	struct drm_cmdline_mode mode = { };
> -	const char *cmdline =  "720x480-24@60e";
> +	const char *cmdline = "720x480-24@60e";
>  
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>  									  &no_connector, &mode));
>  	KUNIT_EXPECT_TRUE(test, mode.specified);
>  	KUNIT_EXPECT_EQ(test, mode.xres, 720);
> @@ -368,7 +367,7 @@ static void drm_cmdline_test_res_bpp_refresh_force_on_analog(struct kunit *test)
>  	struct drm_cmdline_mode mode = { };
>  	const char *cmdline = "720x480-24@60D";
>  
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>  									  &no_connector, &mode));
>  	KUNIT_EXPECT_TRUE(test, mode.specified);
>  	KUNIT_EXPECT_EQ(test, mode.xres, 720);
> @@ -390,12 +389,12 @@ static void drm_cmdline_test_res_bpp_refresh_force_on_analog(struct kunit *test)
>  static void drm_cmdline_test_res_bpp_refresh_force_on_digital(struct kunit *test)
>  {
>  	struct drm_cmdline_mode mode = { };
> -	static const struct drm_connector connector = {
> +	const struct drm_connector connector = {
>  		.connector_type = DRM_MODE_CONNECTOR_DVII,
>  	};
>  	const char *cmdline = "720x480-24@60D";
>  
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>  									  &connector, &mode));
>  	KUNIT_EXPECT_TRUE(test, mode.specified);
>  	KUNIT_EXPECT_EQ(test, mode.xres, 720);
> @@ -443,7 +442,7 @@ static void drm_cmdline_test_res_margins_force_on(struct kunit *test)
>  	struct drm_cmdline_mode mode = { };
>  	const char *cmdline = "720x480me";
>  
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>  									  &no_connector, &mode));
>  	KUNIT_EXPECT_TRUE(test, mode.specified);
>  	KUNIT_EXPECT_EQ(test, mode.xres, 720);
> @@ -465,7 +464,7 @@ static void drm_cmdline_test_res_vesa_margins(struct kunit *test)
>  	struct drm_cmdline_mode mode = { };
>  	const char *cmdline = "720x480Mm";
>  
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>  									  &no_connector, &mode));
>  	KUNIT_EXPECT_TRUE(test, mode.specified);
>  	KUNIT_EXPECT_EQ(test, mode.xres, 720);
> @@ -487,7 +486,7 @@ static void drm_cmdline_test_name(struct kunit *test)
>  	struct drm_cmdline_mode mode = { };
>  	const char *cmdline = "NTSC";
>  
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>  									  &no_connector, &mode));
>  	KUNIT_EXPECT_STREQ(test, mode.name, "NTSC");
>  	KUNIT_EXPECT_FALSE(test, mode.refresh_specified);
> @@ -499,7 +498,7 @@ static void drm_cmdline_test_name_bpp(struct kunit *test)
>  	struct drm_cmdline_mode mode = { };
>  	const char *cmdline = "NTSC-24";
>  
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>  									  &no_connector, &mode));
>  	KUNIT_EXPECT_STREQ(test, mode.name, "NTSC");
>  
> @@ -514,7 +513,7 @@ static void drm_cmdline_test_name_option(struct kunit *test)
>  	struct drm_cmdline_mode mode = { };
>  	const char *cmdline = "NTSC,rotate=180";
>  
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>  									  &no_connector, &mode));
>  	KUNIT_EXPECT_TRUE(test, mode.specified);
>  	KUNIT_EXPECT_STREQ(test, mode.name, "NTSC");
> @@ -526,7 +525,7 @@ static void drm_cmdline_test_name_bpp_option(struct kunit *test)
>  	struct drm_cmdline_mode mode = { };
>  	const char *cmdline = "NTSC-24,rotate=180";
>  
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>  									  &no_connector, &mode));
>  	KUNIT_EXPECT_TRUE(test, mode.specified);
>  	KUNIT_EXPECT_STREQ(test, mode.name, "NTSC");
> @@ -540,7 +539,7 @@ static void drm_cmdline_test_rotate_0(struct kunit *test)
>  	struct drm_cmdline_mode mode = { };
>  	const char *cmdline = "720x480,rotate=0";
>  
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>  									  &no_connector, &mode));
>  	KUNIT_EXPECT_TRUE(test, mode.specified);
>  	KUNIT_EXPECT_EQ(test, mode.xres, 720);
> @@ -563,7 +562,7 @@ static void drm_cmdline_test_rotate_90(struct kunit *test)
>  	struct drm_cmdline_mode mode = { };
>  	const char *cmdline = "720x480,rotate=90";
>  
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>  									  &no_connector, &mode));
>  	KUNIT_EXPECT_TRUE(test, mode.specified);
>  	KUNIT_EXPECT_EQ(test, mode.xres, 720);
> @@ -586,7 +585,7 @@ static void drm_cmdline_test_rotate_180(struct kunit *test)
>  	struct drm_cmdline_mode mode = { };
>  	const char *cmdline = "720x480,rotate=180";
>  
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>  									  &no_connector, &mode));
>  	KUNIT_EXPECT_TRUE(test, mode.specified);
>  	KUNIT_EXPECT_EQ(test, mode.xres, 720);
> @@ -609,7 +608,7 @@ static void drm_cmdline_test_rotate_270(struct kunit *test)
>  	struct drm_cmdline_mode mode = { };
>  	const char *cmdline = "720x480,rotate=270";
>  
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>  									  &no_connector, &mode));
>  	KUNIT_EXPECT_TRUE(test, mode.specified);
>  	KUNIT_EXPECT_EQ(test, mode.xres, 720);
> @@ -632,7 +631,7 @@ static void drm_cmdline_test_hmirror(struct kunit *test)
>  	struct drm_cmdline_mode mode = { };
>  	const char *cmdline = "720x480,reflect_x";
>  
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>  									  &no_connector, &mode));
>  	KUNIT_EXPECT_TRUE(test, mode.specified);
>  	KUNIT_EXPECT_EQ(test, mode.xres, 720);
> @@ -655,7 +654,7 @@ static void drm_cmdline_test_vmirror(struct kunit *test)
>  	struct drm_cmdline_mode mode = { };
>  	const char *cmdline = "720x480,reflect_y";
>  
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>  									  &no_connector, &mode));
>  	KUNIT_EXPECT_TRUE(test, mode.specified);
>  	KUNIT_EXPECT_EQ(test, mode.xres, 720);
> @@ -679,7 +678,7 @@ static void drm_cmdline_test_margin_options(struct kunit *test)
>  	const char *cmdline =
>  		"720x480,margin_right=14,margin_left=24,margin_bottom=36,margin_top=42";
>  
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>  									  &no_connector, &mode));
>  	KUNIT_EXPECT_TRUE(test, mode.specified);
>  	KUNIT_EXPECT_EQ(test, mode.xres, 720);
> @@ -705,7 +704,7 @@ static void drm_cmdline_test_multiple_options(struct kunit *test)
>  	struct drm_cmdline_mode mode = { };
>  	const char *cmdline = "720x480,rotate=270,reflect_x";
>  
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>  									  &no_connector, &mode));
>  	KUNIT_EXPECT_TRUE(test, mode.specified);
>  	KUNIT_EXPECT_EQ(test, mode.xres, 720);
> @@ -728,7 +727,7 @@ static void drm_cmdline_test_bpp_extra_and_option(struct kunit *test)
>  	struct drm_cmdline_mode mode = { };
>  	const char *cmdline = "720x480-24e,rotate=180";
>  
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>  									  &no_connector, &mode));
>  	KUNIT_EXPECT_TRUE(test, mode.specified);
>  	KUNIT_EXPECT_EQ(test, mode.xres, 720);
> @@ -752,7 +751,7 @@ static void drm_cmdline_test_extra_and_option(struct kunit *test)
>  	struct drm_cmdline_mode mode = { };
>  	const char *cmdline = "720x480e,rotate=180";
>  
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>  									  &no_connector, &mode));
>  	KUNIT_EXPECT_TRUE(test, mode.specified);
>  	KUNIT_EXPECT_EQ(test, mode.xres, 720);
> @@ -774,7 +773,7 @@ static void drm_cmdline_test_freestanding_options(struct kunit *test)
>  	struct drm_cmdline_mode mode = { };
>  	const char *cmdline = "margin_right=14,margin_left=24,margin_bottom=36,margin_top=42";
>  
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>  									  &no_connector, &mode));
>  	KUNIT_EXPECT_FALSE(test, mode.specified);
>  	KUNIT_EXPECT_FALSE(test, mode.refresh_specified);
> @@ -797,7 +796,7 @@ static void drm_cmdline_test_freestanding_force_e_and_options(struct kunit *test
>  	struct drm_cmdline_mode mode = { };
>  	const char *cmdline = "e,margin_right=14,margin_left=24,margin_bottom=36,margin_top=42";
>  
> -	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
> +	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
>  									  &no_connector, &mode));
>  	KUNIT_EXPECT_FALSE(test, mode.specified);
>  	KUNIT_EXPECT_FALSE(test, mode.refresh_specified);
