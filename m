Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE328674F5
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 13:30:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F9CF10F13B;
	Mon, 26 Feb 2024 12:30:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="EPkqIIez";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B47710F13B
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 12:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9E9uFo1ZA4/GNHoSVHywi3ucQYA9wjLjy4y7D2QRVoQ=; b=EPkqIIez4XfxwdTWX1fAQshniD
 FJKNTXjlGpDIVV5cx73AbQbU7Azp2+otOzvEDrCbsB1QB+UOdRraNjeC+SLcngtv5x07m/8qNxxEk
 RFGK6TdhGxMHDTlogi9HFkwbumaJaAmi1/JIOxPj4WUSyekNPJzY70rmgEsMuxH/ga1KXbKOfLMGH
 M4DCO2/SXb6kiAQzcWXAQL0Q0WNp1RqilelPemAmio440xzS6+9rI4r3ps1c/E4irVejK+hTBIedD
 SFPxx2OLYHPYoYfP8T2JqQAV016Ngc6nrUsDZuyH4Nx3wzURyDeEYrR+RmUrkTBkKYVCfmB0OA9rX
 BUDcgD0w==;
Received: from [177.34.169.255] (helo=[192.168.0.139])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1rea7q-003YnI-Ph; Mon, 26 Feb 2024 13:30:31 +0100
Message-ID: <1c91ff55-e6c6-4543-bbf5-c7543cc03979@igalia.com>
Date: Mon, 26 Feb 2024 09:30:24 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 30/36] drm/vc4: tests: Convert to plane creation helper
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
 <20240222-kms-hdmi-connector-state-v7-30-8f4af575fce2@kernel.org>
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
In-Reply-To: <20240222-kms-hdmi-connector-state-v7-30-8f4af575fce2@kernel.org>
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

On 2/22/24 15:14, Maxime Ripard wrote:
> Now that we have a plane create helper for kunit mocked drivers, let's
> convert to it in vc4.

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra

> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>   drivers/gpu/drm/vc4/tests/vc4_mock_plane.c | 34 +++++++-----------------------
>   1 file changed, 8 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock_plane.c b/drivers/gpu/drm/vc4/tests/vc4_mock_plane.c
> index 973f5f929097..14357db82238 100644
> --- a/drivers/gpu/drm/vc4/tests/vc4_mock_plane.c
> +++ b/drivers/gpu/drm/vc4/tests/vc4_mock_plane.c
> @@ -1,43 +1,25 @@
>   // SPDX-License-Identifier: GPL-2.0
>   
> -#include <drm/drm_atomic_state_helper.h>
> -#include <drm/drm_fourcc.h>
> -#include <drm/drm_modeset_helper_vtables.h>
> +#include <drm/drm_kunit_helpers.h>
>   #include <drm/drm_plane.h>
>   
>   #include <kunit/test.h>
>   
>   #include "vc4_mock.h"
>   
> -static const struct drm_plane_helper_funcs vc4_dummy_plane_helper_funcs = {
> -};
> -
> -static const struct drm_plane_funcs vc4_dummy_plane_funcs = {
> -	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
> -	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
> -	.reset			= drm_atomic_helper_plane_reset,
> -};
> -
> -static const uint32_t vc4_dummy_plane_formats[] = {
> -	DRM_FORMAT_XRGB8888,
> -};
> -
>   struct drm_plane *vc4_dummy_plane(struct kunit *test, struct drm_device *drm,
>   				  enum drm_plane_type type)
>   {
>   	struct drm_plane *plane;
>   
> -	plane = __drmm_universal_plane_alloc(drm, sizeof(struct drm_plane), 0,
> -						 0,
> -						 &vc4_dummy_plane_funcs,
> -						 vc4_dummy_plane_formats,
> -						 ARRAY_SIZE(vc4_dummy_plane_formats),
> -						 NULL,
> -						 DRM_PLANE_TYPE_PRIMARY,
> -						 NULL);
> +	KUNIT_ASSERT_EQ(test, type, DRM_PLANE_TYPE_PRIMARY);
> +
> +	plane = drm_kunit_helper_create_primary_plane(test, drm,
> +						      NULL,
> +						      NULL,
> +						      NULL, 0,
> +						      NULL);
>   	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, plane);
>   
> -	drm_plane_helper_add(plane, &vc4_dummy_plane_helper_funcs);
> -
>   	return plane;
>   }
> 
