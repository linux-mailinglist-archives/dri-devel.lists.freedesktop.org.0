Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D0F8674C2
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 13:25:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 793D210F131;
	Mon, 26 Feb 2024 12:25:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ah5o+uWC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF2F10E56E
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 12:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0oZm3EOg1yNCpu65rB6gTP7q8rSBUzdq39Z9z79Zzt4=; b=ah5o+uWCOiKlW9NBqEsAXSneMW
 9TLSalXYWd6qKxynJUZZqZ0j3ZRcY3o8BX3/B8vr9FJZBm74UnYDR521b/7C4e/DHZxHO+Sxhx3sU
 zwlRAZR+ZqYRLknV1f9iwZEG34AlTIBTEVFL67Y9E3Hm08gocDElk/z0tc0eUpL5HA81Mu0LxhsBM
 GEeVnHQA7QfG/hbj0qhHgXBZ5kKCve8LlQnQYxy8dRdNvd8Zq9vTph13zl4S/bNf2R4JH2ECCymEF
 JZ55GgCMRt4L+0zk/3iVCsIiGHOf/8Vqj64s9D8a86balWxhh2MxMHlcb1dTsnEE1LT6kEzdvdEFh
 eW4sj5Og==;
Received: from [177.34.169.255] (helo=[192.168.0.139])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1rea2G-003YfT-E8; Mon, 26 Feb 2024 13:24:44 +0100
Message-ID: <664d9eca-a3f2-4a87-9a50-9c415781cef9@igalia.com>
Date: Mon, 26 Feb 2024 09:24:38 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/36] drm/tests: Add helper to create mock plane
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
 <20240222-kms-hdmi-connector-state-v7-3-8f4af575fce2@kernel.org>
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
In-Reply-To: <20240222-kms-hdmi-connector-state-v7-3-8f4af575fce2@kernel.org>
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
> We're going to need a full-blown, functional, KMS device to test more
> components of the atomic modesetting infrastructure.
> 
> Let's add a new helper to create a dumb, mocked, primary plane. By
> default, it will create a linear XRGB8888 plane, using the default
> helpers.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra

> ---
>   drivers/gpu/drm/tests/drm_kunit_helpers.c | 85 +++++++++++++++++++++++++++++++
>   include/drm/drm_kunit_helpers.h           | 11 ++++
>   2 files changed, 96 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
> index 4fb11b938bc1..32dc8354641a 100644
> --- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
> +++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
> @@ -3,6 +3,7 @@
>   #include <drm/drm_atomic.h>
>   #include <drm/drm_atomic_helper.h>
>   #include <drm/drm_drv.h>
> +#include <drm/drm_fourcc.h>
>   #include <drm/drm_kunit_helpers.h>
>   #include <drm/drm_managed.h>
>   
> @@ -164,5 +165,89 @@ drm_kunit_helper_atomic_state_alloc(struct kunit *test,
>   }
>   EXPORT_SYMBOL_GPL(drm_kunit_helper_atomic_state_alloc);
>   
> +static const uint32_t default_plane_formats[] = {
> +	DRM_FORMAT_XRGB8888,
> +};
> +
> +static const uint64_t default_plane_modifiers[] = {
> +	DRM_FORMAT_MOD_LINEAR,
> +	DRM_FORMAT_MOD_INVALID
> +};
> +
> +static const struct drm_plane_helper_funcs default_plane_helper_funcs = {
> +};
> +
> +static const struct drm_plane_funcs default_plane_funcs = {
> +	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
> +	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
> +	.reset			= drm_atomic_helper_plane_reset,
> +};
> +
> +/**
> + * drm_kunit_helper_create_primary_plane - Creates a mock primary plane for a KUnit test
> + * @test: The test context object
> + * @drm: The device to alloc the plane for
> + * @funcs: Callbacks for the new plane. Optional.
> + * @helper_funcs: Helpers callbacks for the new plane. Optional.
> + * @formats: array of supported formats (DRM_FORMAT\_\*). Optional.
> + * @num_formats: number of elements in @formats
> + * @modifiers: array of struct drm_format modifiers terminated by
> + *             DRM_FORMAT_MOD_INVALID. Optional.
> + *
> + * This allocates and initializes a mock struct &drm_plane meant to be
> + * part of a mock device for a KUnit test.
> + *
> + * Resources will be cleaned up automatically.
> + *
> + * @funcs will default to the default helpers implementations.
> + * @helper_funcs will default to an empty implementation. @formats will
> + * default to XRGB8888 only. @modifiers will default to a linear
> + * modifier only.
> + *
> + * Returns:
> + * A pointer to the new plane, or an ERR_PTR() otherwise.
> + */
> +struct drm_plane *
> +drm_kunit_helper_create_primary_plane(struct kunit *test,
> +				      struct drm_device *drm,
> +				      const struct drm_plane_funcs *funcs,
> +				      const struct drm_plane_helper_funcs *helper_funcs,
> +				      const uint32_t *formats,
> +				      unsigned int num_formats,
> +				      const uint64_t *modifiers)
> +{
> +	struct drm_plane *plane;
> +
> +	if (!funcs)
> +		funcs = &default_plane_funcs;
> +
> +	if (!helper_funcs)
> +		helper_funcs = &default_plane_helper_funcs;
> +
> +	if (!formats || !num_formats) {
> +		formats = default_plane_formats;
> +		num_formats = ARRAY_SIZE(default_plane_formats);
> +	}
> +
> +	if (!modifiers)
> +		modifiers = default_plane_modifiers;
> +
> +	plane = __drmm_universal_plane_alloc(drm,
> +					     sizeof(struct drm_plane), 0,
> +					     0,
> +					     funcs,
> +					     formats,
> +					     num_formats,
> +					     default_plane_modifiers,
> +					     DRM_PLANE_TYPE_PRIMARY,
> +					     NULL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, plane);
> +
> +	drm_plane_helper_add(plane, helper_funcs);
> +
> +	return plane;
> +}
> +EXPORT_SYMBOL_GPL(drm_kunit_helper_create_primary_plane);
> +
>   MODULE_AUTHOR("Maxime Ripard <maxime@cerno.tech>");
>   MODULE_LICENSE("GPL");
> diff --git a/include/drm/drm_kunit_helpers.h b/include/drm/drm_kunit_helpers.h
> index 3ae19892229d..38667d624aa8 100644
> --- a/include/drm/drm_kunit_helpers.h
> +++ b/include/drm/drm_kunit_helpers.h
> @@ -10,6 +10,8 @@
>   #include <kunit/test.h>
>   
>   struct drm_device;
> +struct drm_plane_funcs;
> +struct drm_plane_helper_funcs;
>   struct kunit;
>   
>   struct device *drm_kunit_helper_alloc_device(struct kunit *test);
> @@ -99,4 +101,13 @@ drm_kunit_helper_atomic_state_alloc(struct kunit *test,
>   				    struct drm_device *drm,
>   				    struct drm_modeset_acquire_ctx *ctx);
>   
> +struct drm_plane *
> +drm_kunit_helper_create_primary_plane(struct kunit *test,
> +				      struct drm_device *drm,
> +				      const struct drm_plane_funcs *funcs,
> +				      const struct drm_plane_helper_funcs *helper_funcs,
> +				      const uint32_t *formats,
> +				      unsigned int num_formats,
> +				      const uint64_t *modifiers);
> +
>   #endif // DRM_KUNIT_HELPERS_H_
> 
