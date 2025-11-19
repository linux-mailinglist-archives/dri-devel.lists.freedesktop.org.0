Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E321FC711CF
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 22:09:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 023CD10E697;
	Wed, 19 Nov 2025 21:09:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="oBhzSkif";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41C8F10E690;
 Wed, 19 Nov 2025 21:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1763586568;
 bh=LrJ1g/mq1v+P1H2W9YtowF9FN91OOwyC6sLp2U2TUlY=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=oBhzSkifGTm8y9o1E0H/MtIGYftr8h7ch5J+7dzvEVj8uqwXsN8cdElEYPWy6IZKA
 ziucCHlMQRH2RmQgCxhcJg2X1EI41OLdGH5vVIv9Gm4kMbEvwHxjV4MQd+sGLoOk/0
 c/7JavOLDHXljoeIcEP8VOC7FT5I88yu9XyNjoFoXbnlLLWVGYXva4nTSgk19s3SOQ
 xtlZ+h1pwXivLIMKPj/HQDaA5BJMDqhIAJI/kA+XNtPtZuOFufNsXX8yvvoGBGAztF
 I60+hlZKY/5+4Nh+19jvzjToJ3nRYdcD4+TkEdePoujy73ZDv3Vq4rDZgyFY03iBas
 gyyW4mRVW5iPg==
Received: from [192.168.1.90] (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id CB80217E107C;
 Wed, 19 Nov 2025 22:09:27 +0100 (CET)
Message-ID: <dd1717b7-4e20-4ed7-ae08-7286713d4a71@collabora.com>
Date: Wed, 19 Nov 2025 23:09:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests: (Re)add kms_crtc_background_color test
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, igt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 kernel@collabora.com, Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Karthik B S <karthik.b.s@intel.com>, Swati Sharma <swati2.sharma@intel.com>
References: <20251110-crtc-bgcolor-v1-1-28669b692970@collabora.com>
 <20251119132149.spbl5k3dmj2lwzon@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20251119132149.spbl5k3dmj2lwzon@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi Kamil,

On 11/19/25 3:21 PM, Kamil Konieczny wrote:
> Hi Cristian,
> On 2025-11-10 at 15:18:05 +0200, Cristian Ciocaltea wrote:
>> Provide test to verify the behavior of BACKGROUND_COLOR DRM CRTC
>> property.
>>
>> This is done by filling a full-screen primary plane with a given color
>> and comparing the resulting CRC with the one obtained after turning off
>> all planes while having the CRTC background set to the same color.
>>
>> It's worth noting this is a reworked version of the test that has been
>> dropped over 5 years ago via commit 33f07391e5f6 ("tests: Remove
>> kms_crtc_background_color test"), as the required kernel changes never
>> landed because of missing userspace support.
>>
> +cc J-P, Karthik, Swati
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> 
> I have few nits, see below.
> 
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>> This has been tested on a Radxa ROCK 5B board which is based on Rockchip
>> RK3588 SoC.  It relies on the kernel series [1] introducing the
>> BACKGROUND_COLOR CRTC property and a few additional patches from [2]
>> enabling the required CRC functionality for the Rockchip platform (still
>> require a bit more work before sending those upstream).
>>
>> It's worth noting CRC is only supported by the display controller (VOP2)
>> present in the RK3576 SoC variant.  However, the computation is done by
>> the hardware before applying the background color, hence it has limited
>> usage in IGT testing.
>>
>> Luckily, the frame CRCs can be captured through DPCD, i.e. at
>> DisplayPort AUX channel level, hence I used the USB-C DP AltMode capable
>> port of the aforementioned board to perform the actual validation.
>>
>> [1] https://lore.kernel.org/all/20251013-rk3588-bgcolor-v2-0-25cc3810ba8c@collabora.com/
>> [2] https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/commits/cristicc/rk3588-vop2-crc
>>

[...]

> Please add here:
> 
> /**
>  * TEST: crtc background color
>  * Category: Display
>  * Description: Test background color feature with CRC at CRTC
>  * Driver requirement: i915, xe
>  * Mega feature: General Display Features
>  */
> 
> Feel free to correct me with name and/or description.

Ack.

> Karthik or Swati, please also correct this if I made any
> mistake here.
> 
>> +#include "igt.h"
>> +
>> +IGT_TEST_DESCRIPTION("Test crtc background color feature");
>> +
>> +typedef struct {
>> +	int drm_fd;
>> +	int debugfs;
>> +	igt_display_t display;
>> +} data_t;
>> +
>> +#define __DRM_ARGB64_PREP(c, shift, bpc)			\
>> +	(((__u64)(c) << (16 - (bpc)) & 0xffffU) << (shift))
>> +
>> +#define DRM_ARGB64_PREP_BPC(alpha, red, green, blue, bpc)	\
>> +	(__DRM_ARGB64_PREP(alpha, 48, bpc) |			\
>> +	 __DRM_ARGB64_PREP(red,   32, bpc) |			\
>> +	 __DRM_ARGB64_PREP(green, 16, bpc) |			\
>> +	 __DRM_ARGB64_PREP(blue,   0, bpc))
>> +
>> +static void test_background(data_t *data, enum pipe pipe, igt_output_t *output,
>> +			    __u16 red, __u16 green, __u16 blue)
>> +{
>> +	igt_display_t *display = &data->display;
>> +	igt_crc_t plane_crc, bg_crc;
>> +	igt_pipe_crc_t *pipe_crc;
>> +	igt_plane_t *plane;
>> +	drmModeModeInfo *mode;
>> +	struct igt_fb fb;
>> +
>> +	igt_display_reset(display);
>> +
>> +	igt_output_set_pipe(output, pipe);
>> +	mode = igt_output_get_mode(output);
>> +
>> +	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>> +
>> +	/* Fill the primary plane and set the background to the same color */
>> +	igt_create_color_fb(data->drm_fd,
>> +			    mode->hdisplay, mode->vdisplay,
>> +			    DRM_FORMAT_XRGB8888,
>> +			    DRM_FORMAT_MOD_NONE,
>> +			    (double)red / 0xffff,
>> +			    (double)green / 0xffff,
>> +			    (double)blue / 0xffff,
>> +			    &fb);
>> +
>> +	igt_plane_set_fb(plane, &fb);
>> +	igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_BACKGROUND,
>> +				DRM_ARGB64_PREP_BPC(0xffff, red, green, blue, 8));
>> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>> +
>> +	pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe, IGT_PIPE_CRC_SOURCE_AUTO);
>> +	igt_pipe_crc_collect_crc(pipe_crc, &plane_crc);
>> +
>> +	/* Turn off the primary plane so that only the background is visible */
>> +	igt_plane_set_fb(plane, NULL);
>> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>> +	igt_pipe_crc_collect_crc(pipe_crc, &bg_crc);
>> +
>> +	/*
>> +	 * The test assumes hardware is able to generate valid CRCs when setting
>> +	 * the background color. Some platforms, e.g. Intel, might require at
>> +	 * least one plane to be visible before reading the pipe-level ("dmux")
>> +	 * CRC. Other platforms, e.g. Rockchip, do not take background color
>> +	 * into account when computing CRC at CRTC level.
>> +	 * A possible workaround would be to use alternative CRC sources, e.g.
>> +	 * where computation is performed at encoder or sink level.
>> +	 */
>> +	igt_assert_crc_equal(&plane_crc, &bg_crc);
>> +
>> +	/* Clean-up */
>> +	igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_BACKGROUND,
>> +				DRM_ARGB64_PREP_BPC(0xffff, 0, 0, 0, 8));
>> +	igt_pipe_crc_free(pipe_crc);
>> +	igt_output_set_pipe(output, PIPE_NONE);
>> +	igt_display_commit(display);
>> +	igt_remove_fb(data->drm_fd, &fb);
>> +}
>> +
> 
> Add here:
> 
> /**
>  * SUBTEST: background-color-%s
>  * Description: Tests %arg[1] in background color
>  *
>  * arg[1]:
>  *
>  * @red:      red
>  * @green:    green
>  * @blue:     blue
>  * @yellow:   yellow
>  * @purple:   purple
>  * @cyan:     cyan
>  * @black:    black
>  * @white:    white
>  */
> 
> With this it will compile and will be tested by Intel CI.

Great!  Please note there's already a 2nd revision [1] available which might
require adjusting your kernel driver due to the following change:

- Set the value of the CRTC background color property with 16bpc instead
  of 8bpc, to avoid CRC check failures because of framebuffer format
  precision mismatch - display controller drivers shall convert it back
  from 16bpc to their internal representation of the pixel color if
  necessary, e.g. VKMS already uses 16bpc, hence no conversion is
  required in that case

[1] https://lore.kernel.org/all/20251118-crtc-bgcolor-v2-1-dce4063f85a9@collabora.com/
