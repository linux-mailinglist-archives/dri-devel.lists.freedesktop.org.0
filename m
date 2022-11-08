Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 313FF620C74
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 10:40:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44EC910E3C8;
	Tue,  8 Nov 2022 09:40:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A558510E3D1;
 Tue,  8 Nov 2022 09:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ggbcx2/+wU4WPL0deN/0JJ/CN6ehJvsesRYoAq0FYYU=; b=ijCvXTdhEg8PrhALlm8CI7XGDL
 O78hjgrPnZjXdNmqB9jJe/pNhnu2W2WavIFHO/4zJ6TzleOTcP9F2XMWWdJdaE6EH45DnKZSpbkgI
 Z2Io/ZEcBPlWda6ZsgCGrGK9iIKIbT8bPiDgf0Y5EdVZ2vNz/rHI50bcx1VmRJwnKv/urLy71sRJS
 3lmkhMjLWzjIfISPR7TvZ7Olbr+Ag8hw0wL3x2YJQ9Qg6HCp/3KgpLGjd7NHhyLBseZjtycWZUDLW
 dSMoZ0uJ7KFrNQRXija0NZiRJdl8MtlOXI25lVc8OPYoa3p11bYl9KGIz63utD54Vnm9DxhID/tiK
 BrH0OKDQ==;
Received: from [2a01:799:95a:cb00:cca0:57ac:c55d:a485] (port=57695)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1osL5W-0001ox-VM; Tue, 08 Nov 2022 10:40:10 +0100
Message-ID: <85a607b4-2645-68c7-0898-08f7c6d064b9@tronnes.org>
Date: Tue, 8 Nov 2022 10:40:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v7 14/23] drm/modes: Properly generate a drm_display_mode
 from a named mode
To: Maxime Ripard <maxime@cerno.tech>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Emma Anholt <emma@anholt.net>, Karol Herbst <kherbst@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 Lyude Paul <lyude@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>
References: <20220728-rpi-analog-tv-properties-v7-0-7072a478c6b3@cerno.tech>
 <20220728-rpi-analog-tv-properties-v7-14-7072a478c6b3@cerno.tech>
 <9e9a8a48-89f2-35d4-b26f-afa7cc44f2f6@tronnes.org>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <9e9a8a48-89f2-35d4-b26f-afa7cc44f2f6@tronnes.org>
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
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 07.11.2022 18.49, skrev Noralf Trønnes:
> 
> 
> Den 07.11.2022 15.16, skrev Maxime Ripard:
>> The framework will get the drm_display_mode from the drm_cmdline_mode it
>> got by parsing the video command line argument by calling
>> drm_connector_pick_cmdline_mode().
>>
>> The heavy lifting will then be done by the drm_mode_create_from_cmdline_mode()
>> function.
>>
>> In the case of the named modes though, there's no real code to make that
>> translation and we rely on the drivers to guess which actual display mode
>> we meant.
>>
>> Let's modify drm_mode_create_from_cmdline_mode() to properly generate the
>> drm_display_mode we mean when passing a named mode.
>>
>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>>
>> ---
>> Changes in v7:
>> - Use tv_mode_specified in drm_mode_parse_command_line_for_connector
>>
>> Changes in v6:
>> - Fix get_modes to return 0 instead of an error code
>> - Rename the tests to follow the DRM test naming convention
>>
>> Changes in v5:
>> - Switched to KUNIT_ASSERT_NOT_NULL
>> ---
>>  drivers/gpu/drm/drm_modes.c                     | 34 ++++++++++-
>>  drivers/gpu/drm/tests/drm_client_modeset_test.c | 77 ++++++++++++++++++++++++-
>>  2 files changed, 109 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
>> index dc037f7ceb37..49441cabdd9d 100644
>> --- a/drivers/gpu/drm/drm_modes.c
>> +++ b/drivers/gpu/drm/drm_modes.c
>> @@ -2497,6 +2497,36 @@ bool drm_mode_parse_command_line_for_connector(const char *mode_option,
>>  }
>>  EXPORT_SYMBOL(drm_mode_parse_command_line_for_connector);
>>  
>> +static struct drm_display_mode *drm_named_mode(struct drm_device *dev,
>> +					       struct drm_cmdline_mode *cmd)
>> +{
>> +	struct drm_display_mode *mode;
>> +	unsigned int i;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(drm_named_modes); i++) {
>> +		const struct drm_named_mode *named_mode = &drm_named_modes[i];
>> +
>> +		if (strcmp(cmd->name, named_mode->name))
>> +			continue;
>> +
>> +		if (!cmd->tv_mode_specified)
>> +			continue;
> 
> Only a named mode will set cmd->name, so is this check necessary?
> 
>> +
>> +		mode = drm_analog_tv_mode(dev,
>> +					  named_mode->tv_mode,
>> +					  named_mode->pixel_clock_khz * 1000,
>> +					  named_mode->xres,
>> +					  named_mode->yres,
>> +					  named_mode->flags & DRM_MODE_FLAG_INTERLACE);
>> +		if (!mode)
>> +			return NULL;
>> +
>> +		return mode;
> 
> You can just return the result from drm_analog_tv_mode() directly.
> 
> With those considered:
> 
> Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
> 

I forgot one thing, shouldn't the named mode test in
drm_connector_pick_cmdline_mode() be removed now that we have proper modes?

Noralf.

>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>>  /**
>>   * drm_mode_create_from_cmdline_mode - convert a command line modeline into a DRM display mode
>>   * @dev: DRM device to create the new mode for
>> @@ -2514,7 +2544,9 @@ drm_mode_create_from_cmdline_mode(struct drm_device *dev,
>>  	if (cmd->xres == 0 || cmd->yres == 0)
>>  		return NULL;
>>  
>> -	if (cmd->cvt)
>> +	if (strlen(cmd->name))
>> +		mode = drm_named_mode(dev, cmd);
>> +	else if (cmd->cvt)
>>  		mode = drm_cvt_mode(dev,
>>  				    cmd->xres, cmd->yres,
>>  				    cmd->refresh_specified ? cmd->refresh : 60,
>> diff --git a/drivers/gpu/drm/tests/drm_client_modeset_test.c b/drivers/gpu/drm/tests/drm_client_modeset_test.c
>> index 3aa1acfe75df..fdfe9e20702e 100644
>> --- a/drivers/gpu/drm/tests/drm_client_modeset_test.c
>> +++ b/drivers/gpu/drm/tests/drm_client_modeset_test.c
>> @@ -21,7 +21,26 @@ struct drm_client_modeset_test_priv {
>>  
>>  static int drm_client_modeset_connector_get_modes(struct drm_connector *connector)
>>  {
>> -	return drm_add_modes_noedid(connector, 1920, 1200);
>> +	struct drm_display_mode *mode;
>> +	int count;
>> +
>> +	count = drm_add_modes_noedid(connector, 1920, 1200);
>> +
>> +	mode = drm_mode_analog_ntsc_480i(connector->dev);
>> +	if (!mode)
>> +		return count;
>> +
>> +	drm_mode_probed_add(connector, mode);
>> +	count += 1;
>> +
>> +	mode = drm_mode_analog_pal_576i(connector->dev);
>> +	if (!mode)
>> +		return count;
>> +
>> +	drm_mode_probed_add(connector, mode);
>> +	count += 1;
>> +
>> +	return count;
>>  }
>>  
>>  static const struct drm_connector_helper_funcs drm_client_modeset_connector_helper_funcs = {
>> @@ -52,6 +71,9 @@ static int drm_client_modeset_test_init(struct kunit *test)
>>  
>>  	drm_connector_helper_add(&priv->connector, &drm_client_modeset_connector_helper_funcs);
>>  
>> +	priv->connector.interlace_allowed = true;
>> +	priv->connector.doublescan_allowed = true;
>> +
>>  	return 0;
>>  
>>  }
>> @@ -85,9 +107,62 @@ static void drm_test_pick_cmdline_res_1920_1080_60(struct kunit *test)
>>  	KUNIT_EXPECT_TRUE(test, drm_mode_equal(expected_mode, mode));
>>  }
>>  
>> +static void drm_test_pick_cmdline_named_ntsc(struct kunit *test)
>> +{
>> +	struct drm_client_modeset_test_priv *priv = test->priv;
>> +	struct drm_device *drm = priv->drm;
>> +	struct drm_connector *connector = &priv->connector;
>> +	struct drm_cmdline_mode *cmdline_mode = &connector->cmdline_mode;
>> +	struct drm_display_mode *mode;
>> +	const char *cmdline = "NTSC";
>> +	int ret;
>> +
>> +	KUNIT_ASSERT_TRUE(test,
>> +			  drm_mode_parse_command_line_for_connector(cmdline,
>> +								    connector,
>> +								    cmdline_mode));
>> +
>> +	mutex_lock(&drm->mode_config.mutex);
>> +	ret = drm_helper_probe_single_connector_modes(connector, 1920, 1080);
>> +	mutex_unlock(&drm->mode_config.mutex);
>> +	KUNIT_ASSERT_GT(test, ret, 0);
>> +
>> +	mode = drm_connector_pick_cmdline_mode(connector);
>> +	KUNIT_ASSERT_NOT_NULL(test, mode);
>> +
>> +	KUNIT_EXPECT_TRUE(test, drm_mode_equal(drm_mode_analog_ntsc_480i(drm), mode));
>> +}
>> +
>> +static void drm_test_pick_cmdline_named_pal(struct kunit *test)
>> +{
>> +	struct drm_client_modeset_test_priv *priv = test->priv;
>> +	struct drm_device *drm = priv->drm;
>> +	struct drm_connector *connector = &priv->connector;
>> +	struct drm_cmdline_mode *cmdline_mode = &connector->cmdline_mode;
>> +	struct drm_display_mode *mode;
>> +	const char *cmdline = "PAL";
>> +	int ret;
>> +
>> +	KUNIT_ASSERT_TRUE(test,
>> +			  drm_mode_parse_command_line_for_connector(cmdline,
>> +								    connector,
>> +								    cmdline_mode));
>> +
>> +	mutex_lock(&drm->mode_config.mutex);
>> +	ret = drm_helper_probe_single_connector_modes(connector, 1920, 1080);
>> +	mutex_unlock(&drm->mode_config.mutex);
>> +	KUNIT_ASSERT_GT(test, ret, 0);
>> +
>> +	mode = drm_connector_pick_cmdline_mode(connector);
>> +	KUNIT_ASSERT_NOT_NULL(test, mode);
>> +
>> +	KUNIT_EXPECT_TRUE(test, drm_mode_equal(drm_mode_analog_pal_576i(drm), mode));
>> +}
>>  
>>  static struct kunit_case drm_test_pick_cmdline_tests[] = {
>>  	KUNIT_CASE(drm_test_pick_cmdline_res_1920_1080_60),
>> +	KUNIT_CASE(drm_test_pick_cmdline_named_ntsc),
>> +	KUNIT_CASE(drm_test_pick_cmdline_named_pal),
>>  	{}
>>  };
>>  
>>
