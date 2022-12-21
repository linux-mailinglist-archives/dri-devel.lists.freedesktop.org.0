Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA7E653755
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 21:07:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9872310E4B2;
	Wed, 21 Dec 2022 20:07:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A491610E4AA
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 20:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NlW7FgWz1mMGBJeeoYdfCHqXYnisZEFNrzLfxapOxOU=; b=huiMV/ilR4u1vX/bo8DUA5mDOI
 RoKoRec6ioptULLLRU/YEG5beWmTCzK+D7KBY75w91aO1Jjkm/DgE27rgWZRfRDemiPn22rmujXfl
 Gew7KeuXd5ccaEBkF9ge8tYPou8OgWmkVsHwShErpG9Z/DsHnlA8YphFCEm2LW4M+EqsvGwDKkuLZ
 Pofe/BCxlaXQBx8qn8Oi+VLZyB9juGMKM5w/2T+mDWxNaKEv2VN+lySuwgThPnmRRxwKl0WQ2tRwN
 szQVjsbZeaL70KODqx0fPK/z+zyYbcXgfRKHlYC7babKKvq0Tx9JnrvWO07t/SQ/GeJHxxN1/X/Cv
 OkaSpYoQ==;
Received: from 187-26-207-44.3g.claro.net.br ([187.26.207.44]
 helo=[192.168.65.202]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1p85NH-007g1c-1H; Wed, 21 Dec 2022 21:07:35 +0100
Message-ID: <78e534b4-4c82-c528-80e6-88f1d833a88b@igalia.com>
Date: Wed, 21 Dec 2022 17:07:29 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 07/13] drm/format-helper: Add conversion from XRGB8888
 to ARGB8888
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, javierm@redhat.com, jose.exposito89@gmail.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
References: <20221220161145.27568-1-tzimmermann@suse.de>
 <20221220161145.27568-8-tzimmermann@suse.de>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20221220161145.27568-8-tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/20/22 13:11, Thomas Zimmermann wrote:
> Add dedicated helper to convert from XRGB8888 to ARGB8888. Sets
> all alpha bits to make pixels fully opaque.
> 
> v2:
> 	* use cpubuf_to_le32()
> 	* type fixes
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>  drivers/gpu/drm/drm_format_helper.c           | 53 +++++++++++++++-
>  .../gpu/drm/tests/drm_format_helper_test.c    | 63 +++++++++++++++++++
>  include/drm/drm_format_helper.h               |  3 +
>  3 files changed, 117 insertions(+), 2 deletions(-)
> 

[...]

>  
> +static void drm_test_fb_xrgb8888_to_argb8888(struct kunit *test)
> +{
> +	const struct convert_xrgb8888_case *params = test->param_value;
> +	const struct convert_to_argb8888_result *result = &params->argb8888_result;
> +	size_t dst_size;
> +	u32 *buf = NULL;
> +	__le32 *xrgb8888 = NULL;
> +	struct iosys_map dst, src;
> +
> +	struct drm_framebuffer fb = {
> +		.format = drm_format_info(DRM_FORMAT_XRGB8888),
> +		.pitches = { params->pitch, 0, 0 },
> +	};
> +
> +	dst_size = conversion_buf_size(DRM_FORMAT_ARGB8888,
> +				       result->dst_pitch, &params->clip);
> +	KUNIT_ASSERT_GT(test, dst_size, 0);
> +
> +	buf = kunit_kzalloc(test, dst_size, GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
> +	iosys_map_set_vaddr(&dst, buf);
> +
> +	xrgb8888 = cpubuf_to_le32(test, params->xrgb8888, TEST_BUF_SIZE);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
> +	iosys_map_set_vaddr(&src, xrgb8888);
> +
> +	drm_fb_xrgb8888_to_argb8888(&dst, &result->dst_pitch, &src, &fb, &params->clip);
> +	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
> +	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);

For this test and the tests from patches 08/13 and 09/13, it would be
nice to use the KUNIT_EXPECT_MEMEQ macro instead of the KUNIT_EXPECT_EQ,
as can be seen in [1]. I guess drm-misc-next was not rebased yet to
support KUNIT_EXPECT_MEMEQ, as it was introduced in the current merge
window, but it is good to keep this in mind.

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a52a5451f43bb76743c51dd46788008837243f29

Best Regards,
- Maíra Canal

> +}
> +
>  static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
>  {
>  	const struct convert_xrgb8888_case *params = test->param_value;
> @@ -484,6 +546,7 @@ static struct kunit_case drm_format_helper_test_cases[] = {
>  	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgb332, convert_xrgb8888_gen_params),
>  	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgb565, convert_xrgb8888_gen_params),
>  	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgb888, convert_xrgb8888_gen_params),
> +	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_argb8888, convert_xrgb8888_gen_params),
>  	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_xrgb2101010, convert_xrgb8888_gen_params),
>  	{}
>  };
> diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
> index eb5c98cf82b8..3ce8129dfe43 100644
> --- a/include/drm/drm_format_helper.h
> +++ b/include/drm/drm_format_helper.h
> @@ -33,6 +33,9 @@ void drm_fb_xrgb8888_to_rgb565(struct iosys_map *dst, const unsigned int *dst_pi
>  void drm_fb_xrgb8888_to_rgb888(struct iosys_map *dst, const unsigned int *dst_pitch,
>  			       const struct iosys_map *src, const struct drm_framebuffer *fb,
>  			       const struct drm_rect *clip);
> +void drm_fb_xrgb8888_to_argb8888(struct iosys_map *dst, const unsigned int *dst_pitch,
> +				 const struct iosys_map *src, const struct drm_framebuffer *fb,
> +				 const struct drm_rect *clip);
>  void drm_fb_xrgb8888_to_xrgb2101010(struct iosys_map *dst, const unsigned int *dst_pitch,
>  				    const struct iosys_map *src, const struct drm_framebuffer *fb,
>  				    const struct drm_rect *clip);
