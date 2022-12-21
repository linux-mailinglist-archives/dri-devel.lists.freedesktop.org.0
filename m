Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A3C653746
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 20:56:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46A1E10E49F;
	Wed, 21 Dec 2022 19:55:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E74C810E49F
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 19:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J+MlVBoYCEz9T58M2pgtXxU0BeBIS7JxC5/m4S7a9W0=; b=mNyC2hv6Ks3E4nSphymcz34mqX
 nxtrmuH4ye057uUL2lzywjQQK8QTmEBWsEtLLkY62hit1mPC1V1kh2srWTePmiq9ErtBFSxpF6crV
 fvUUofgmJZ1FqFjqdtrq/dbhW9ZpZuR8/mp5qpRSjb5s4r3cbeNDXQ+2+YBMXUNA1FokaEdDAYDHc
 pErcdvueGVVUpMAAjzJNFnKcuPpI8NZuk59iBOU8OOIfPMkrki9NdKNdVwz0Oq+ooJx5stD9NWcfd
 iwSjimcu7SzYMovq1EVAFgE8cnnhETR/izfqQtKcgtCbJ/q+38nMOyu7QYqBf+q75C09KNjgb3Z7U
 iiDQoviQ==;
Received: from 187-26-207-44.3g.claro.net.br ([187.26.207.44]
 helo=[192.168.65.202]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1p85Bl-007fW9-GC; Wed, 21 Dec 2022 20:55:41 +0100
Message-ID: <27484c10-35d3-b74c-f883-7afe9b191f34@igalia.com>
Date: Wed, 21 Dec 2022 16:55:34 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 04/13] drm/format-helper: Store RGB565 in little-endian
 order
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, javierm@redhat.com, jose.exposito89@gmail.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
References: <20221220161145.27568-1-tzimmermann@suse.de>
 <20221220161145.27568-5-tzimmermann@suse.de>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20221220161145.27568-5-tzimmermann@suse.de>
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

On 12/20/22 13:11, Thomas Zimmermann wrote:> Fix to-RGB565 conversion
helpers to store the result in little-
> endian byte order. Update test cases as well.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra Canal

> ---
>  drivers/gpu/drm/drm_format_helper.c           |  9 +++++----
>  .../gpu/drm/tests/drm_format_helper_test.c    | 20 ++++++++++++++++++-
>  2 files changed, 24 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> index b98bd7c5caee..f3f3b3809a3e 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -322,7 +322,7 @@ EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb332);
>  
>  static void drm_fb_xrgb8888_to_rgb565_line(void *dbuf, const void *sbuf, unsigned int pixels)
>  {
> -	u16 *dbuf16 = dbuf;
> +	__le16 *dbuf16 = dbuf;
>  	const __le32 *sbuf32 = sbuf;
>  	unsigned int x;
>  	u16 val16;
> @@ -333,14 +333,15 @@ static void drm_fb_xrgb8888_to_rgb565_line(void *dbuf, const void *sbuf, unsigne
>  		val16 = ((pix & 0x00F80000) >> 8) |
>  			((pix & 0x0000FC00) >> 5) |
>  			((pix & 0x000000F8) >> 3);
> -		dbuf16[x] = val16;
> +		dbuf16[x] = cpu_to_le16(val16);
>  	}
>  }
>  
> +/* TODO: implement this helper as conversion to RGB565|BIG_ENDIAN */
>  static void drm_fb_xrgb8888_to_rgb565_swab_line(void *dbuf, const void *sbuf,
>  						unsigned int pixels)
>  {
> -	u16 *dbuf16 = dbuf;
> +	__le16 *dbuf16 = dbuf;
>  	const __le32 *sbuf32 = sbuf;
>  	unsigned int x;
>  	u16 val16;
> @@ -351,7 +352,7 @@ static void drm_fb_xrgb8888_to_rgb565_swab_line(void *dbuf, const void *sbuf,
>  		val16 = ((pix & 0x00F80000) >> 8) |
>  			((pix & 0x0000FC00) >> 5) |
>  			((pix & 0x000000F8) >> 3);
> -		dbuf16[x] = swab16(val16);
> +		dbuf16[x] = cpu_to_le16(swab16(val16));
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
> index e7c49e6d3f6d..04fe373c9d97 100644
> --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
> @@ -264,6 +264,21 @@ static size_t conversion_buf_size(u32 dst_format, unsigned int dst_pitch,
>  	return dst_pitch * drm_rect_height(clip);
>  }
>  
> +static u16 *le16buf_to_cpu(struct kunit *test, const __le16 *buf, size_t buf_size)
> +{
> +	u16 *dst = NULL;
> +	int n;
> +
> +	dst = kunit_kzalloc(test, sizeof(*dst) * buf_size, GFP_KERNEL);
> +	if (!dst)
> +		return NULL;
> +
> +	for (n = 0; n < buf_size; n++)
> +		dst[n] = le16_to_cpu(buf[n]);
> +
> +	return dst;
> +}
> +
>  static u32 *le32buf_to_cpu(struct kunit *test, const u32 *buf, size_t buf_size)
>  {
>  	u32 *dst = NULL;
> @@ -368,7 +383,7 @@ static void drm_test_fb_xrgb8888_to_rgb565(struct kunit *test)
>  	const struct convert_xrgb8888_case *params = test->param_value;
>  	const struct convert_to_rgb565_result *result = &params->rgb565_result;
>  	size_t dst_size;
> -	__u16 *buf = NULL;
> +	u16 *buf = NULL;
>  	__le32 *xrgb8888 = NULL;
>  	struct iosys_map dst, src;
>  
> @@ -390,9 +405,12 @@ static void drm_test_fb_xrgb8888_to_rgb565(struct kunit *test)
>  	iosys_map_set_vaddr(&src, xrgb8888);
>  
>  	drm_fb_xrgb8888_to_rgb565(&dst, &result->dst_pitch, &src, &fb, &params->clip, false);
> +	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
>  	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
>  
> +	buf = dst.vaddr; /* restore original value of buf */
>  	drm_fb_xrgb8888_to_rgb565(&dst, &result->dst_pitch, &src, &fb, &params->clip, true);
> +	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
>  	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected_swab, dst_size), 0);
>  }
>  
