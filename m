Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F868674D7
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 13:28:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8493E10F13E;
	Mon, 26 Feb 2024 12:27:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="mB6dP2If";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D9F10F13E
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 12:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BehYZsTcBskWJbVJTSYJK03NQKC1Vfs2VOyvrT1egZI=; b=mB6dP2IfuiHH2mt6Om4PMPs6LD
 +njc7OCEnWxnk188JDHYXrrtzN6ZVA/52jhCzCL7Zmyq8Au0H8Hhs1qOLmvYUC2zaernc0A4C/4q8
 6KHeZK/Ixtp8yngEKbkrNfXn3iOWHokcG6TsPgJTxBOXahIQylM1PPqzfZN3H9vg6sSKb6W11NwE+
 farhczgWnrfLuQdX1H7PAZP0zYJUB9H9vRj/Dzi/yS2J7z+T/ItwIb5P0gvgvd+8Dn0zCaet0Rnir
 lrzLR5j8rAuvqoWauYbpFF3Y0hdOHR535+5MvMp1N4q/dTPTvJDyNVcGQI3AsAvsS6Z69ayquB+Ay
 tknsYalQ==;
Received: from [177.34.169.255] (helo=[192.168.0.139])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1rea58-003Yij-Nd; Mon, 26 Feb 2024 13:27:43 +0100
Message-ID: <f078cbc0-f8bd-4e14-9395-09afa851a070@igalia.com>
Date: Mon, 26 Feb 2024 09:27:36 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/36] drm/tests: connector: Add tests for
 drmm_connector_init
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20240222-kms-hdmi-connector-state-v7-0-8f4af575fce2@kernel.org>
 <20240222-kms-hdmi-connector-state-v7-5-8f4af575fce2@kernel.org>
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xjMEZIsaeRYJKwYBBAHaRw8BAQdAGU6aY8oojw61KS5rGGMrlcilFqR6p6ID45IZ6ovX0h3N
 H01haXJhIENhbmFsIDxtY2FuYWxAaWdhbGlhLmNvbT7CjwQTFggANxYhBDMCqFtIvFKVRJZQ
 hDSPnHLaGFVuBQJkixp5BQkFo5qAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQNI+cctoYVW5u
 GAEAwpaC5rI3wD8zqETKwGVoXd6+AbmGfZuVD40xepy7z/8BAM5w95/oyPsHUqOsg/xUTlNp
 rlbhA+WWoaOXA3XgR+wCzjgEZIsaeRIKKwYBBAGXVQEFAQEHQGoOK0jgh0IorMAacx6WUUWb
 s3RLiJYWUU6iNrk5wWUbAwEIB8J+BBgWCAAmFiEEMwKoW0i8UpVEllCENI+cctoYVW4FAmSL
 GnkFCQWjmoACGwwACgkQNI+cctoYVW6cqwD/Q9R98msvkhgRvi18fzUPFDwwogn+F+gQJJ6o
 pwpgFkAA/R2zOfla3IT6G3SBoV5ucdpdCpnIXFpQLbmfHK7dXsAC
In-Reply-To: <20240222-kms-hdmi-connector-state-v7-5-8f4af575fce2@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/22/24 15:13, Maxime Ripard wrote:
> drmm_connector_init is the preferred function to initialize a
> drm_connector structure. Let's add a bunch of unit tests for it.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra

> ---
>   drivers/gpu/drm/tests/drm_connector_test.c | 170 ++++++++++++++++++++++++++++-
>   1 file changed, 169 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
> index c66aa2dc8d9d..a268847be8d1 100644
> --- a/drivers/gpu/drm/tests/drm_connector_test.c
> +++ b/drivers/gpu/drm/tests/drm_connector_test.c
> @@ -3,10 +3,175 @@
>    * Kunit test for drm_modes functions
>    */
>   
> +#include <linux/i2c.h>
> +
> +#include <drm/drm_atomic_state_helper.h>
>   #include <drm/drm_connector.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_kunit_helpers.h>
>   
>   #include <kunit/test.h>
>   
> +struct drm_connector_init_priv {
> +	struct drm_device drm;
> +	struct drm_connector connector;
> +	struct i2c_adapter ddc;
> +};
> +
> +static const struct drm_connector_funcs dummy_funcs = {
> +	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
> +	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
> +	.reset			= drm_atomic_helper_connector_reset,
> +};
> +
> +static int dummy_ddc_xfer(struct i2c_adapter *adapter,
> +			  struct i2c_msg *msgs, int num)
> +{
> +	return num;
> +}
> +
> +static u32 dummy_ddc_func(struct i2c_adapter *adapter)
> +{
> +	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
> +}
> +
> +static const struct i2c_algorithm dummy_ddc_algorithm = {
> +	.master_xfer = dummy_ddc_xfer,
> +	.functionality = dummy_ddc_func,
> +};
> +
> +static void i2c_del_adapter_wrapper(void *ptr)
> +{
> +	struct i2c_adapter *adap = ptr;
> +
> +	i2c_del_adapter(adap);
> +}
> +
> +static int drm_test_connector_init(struct kunit *test)
> +{
> +	struct drm_connector_init_priv *priv;
> +	struct device *dev;
> +	int ret;
> +
> +	dev = drm_kunit_helper_alloc_device(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
> +
> +	priv = drm_kunit_helper_alloc_drm_device(test, dev,
> +						 struct drm_connector_init_priv, drm,
> +						 DRIVER_MODESET | DRIVER_ATOMIC);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
> +
> +	strscpy(priv->ddc.name, "dummy-connector-ddc", sizeof(priv->ddc.name));
> +	priv->ddc.owner = THIS_MODULE;
> +	priv->ddc.algo = &dummy_ddc_algorithm;
> +	priv->ddc.dev.parent = dev;
> +
> +	ret = i2c_add_adapter(&priv->ddc);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	ret = kunit_add_action_or_reset(test, i2c_del_adapter_wrapper, &priv->ddc);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	test->priv = priv;
> +	return 0;
> +}
> +
> +/*
> + * Test that the registration of a bog standard connector works as
> + * expected and doesn't report any error.
> + */
> +static void drm_test_drmm_connector_init(struct kunit *test)
> +{
> +	struct drm_connector_init_priv *priv = test->priv;
> +	int ret;
> +
> +	ret = drmm_connector_init(&priv->drm, &priv->connector,
> +				  &dummy_funcs,
> +				  DRM_MODE_CONNECTOR_HDMIA,
> +				  &priv->ddc);
> +	KUNIT_EXPECT_EQ(test, ret, 0);
> +}
> +
> +/*
> + * Test that the registration of a connector without a DDC adapter
> + * doesn't report any error.
> + */
> +static void drm_test_drmm_connector_init_null_ddc(struct kunit *test)
> +{
> +	struct drm_connector_init_priv *priv = test->priv;
> +	int ret;
> +
> +	ret = drmm_connector_init(&priv->drm, &priv->connector,
> +				  &dummy_funcs,
> +				  DRM_MODE_CONNECTOR_HDMIA,
> +				  NULL);
> +	KUNIT_EXPECT_EQ(test, ret, 0);
> +}
> +
> +/*
> + * Test that the registration of a connector succeeds for all possible
> + * connector types.
> + */
> +static void drm_test_drmm_connector_init_type_valid(struct kunit *test)
> +{
> +       struct drm_connector_init_priv *priv = test->priv;
> +       unsigned int connector_type = *(unsigned int *)test->param_value;
> +       int ret;
> +
> +       ret = drmm_connector_init(&priv->drm, &priv->connector,
> +				 &dummy_funcs,
> +				 connector_type,
> +				 &priv->ddc);
> +       KUNIT_EXPECT_EQ(test, ret, 0);
> +}
> +
> +static const unsigned int drm_connector_init_type_valid_tests[] = {
> +	DRM_MODE_CONNECTOR_Unknown,
> +	DRM_MODE_CONNECTOR_VGA,
> +	DRM_MODE_CONNECTOR_DVII,
> +	DRM_MODE_CONNECTOR_DVID,
> +	DRM_MODE_CONNECTOR_DVIA,
> +	DRM_MODE_CONNECTOR_Composite,
> +	DRM_MODE_CONNECTOR_SVIDEO,
> +	DRM_MODE_CONNECTOR_LVDS,
> +	DRM_MODE_CONNECTOR_Component,
> +	DRM_MODE_CONNECTOR_9PinDIN,
> +	DRM_MODE_CONNECTOR_DisplayPort,
> +	DRM_MODE_CONNECTOR_HDMIA,
> +	DRM_MODE_CONNECTOR_HDMIB,
> +	DRM_MODE_CONNECTOR_TV,
> +	DRM_MODE_CONNECTOR_eDP,
> +	DRM_MODE_CONNECTOR_VIRTUAL,
> +	DRM_MODE_CONNECTOR_DSI,
> +	DRM_MODE_CONNECTOR_DPI,
> +	DRM_MODE_CONNECTOR_WRITEBACK,
> +	DRM_MODE_CONNECTOR_SPI,
> +	DRM_MODE_CONNECTOR_USB,
> +};
> +
> +static void drm_connector_init_type_desc(const unsigned int *type, char *desc)
> +{
> +	sprintf(desc, "%s", drm_get_connector_type_name(*type));
> +}
> +
> +KUNIT_ARRAY_PARAM(drm_connector_init_type_valid,
> +		  drm_connector_init_type_valid_tests,
> +		  drm_connector_init_type_desc);
> +
> +static struct kunit_case drmm_connector_init_tests[] = {
> +	KUNIT_CASE(drm_test_drmm_connector_init),
> +	KUNIT_CASE(drm_test_drmm_connector_init_null_ddc),
> +	KUNIT_CASE_PARAM(drm_test_drmm_connector_init_type_valid,
> +			 drm_connector_init_type_valid_gen_params),
> +	{ }
> +};
> +
> +static struct kunit_suite drmm_connector_init_test_suite = {
> +	.name = "drmm_connector_init",
> +	.init = drm_test_connector_init,
> +	.test_cases = drmm_connector_init_tests,
> +};
> +
>   struct drm_get_tv_mode_from_name_test {
>   	const char *name;
>   	enum drm_connector_tv_mode expected_mode;
> @@ -70,7 +235,10 @@ static struct kunit_suite drm_get_tv_mode_from_name_test_suite = {
>   	.test_cases = drm_get_tv_mode_from_name_tests,
>   };
>   
> -kunit_test_suite(drm_get_tv_mode_from_name_test_suite);
> +kunit_test_suites(
> +	&drmm_connector_init_test_suite,
> +	&drm_get_tv_mode_from_name_test_suite
> +);
>   
>   MODULE_AUTHOR("Maxime Ripard <maxime@cerno.tech>");
>   MODULE_LICENSE("GPL");
> 
