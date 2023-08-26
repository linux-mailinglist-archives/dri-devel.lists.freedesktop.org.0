Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EBF789708
	for <lists+dri-devel@lfdr.de>; Sat, 26 Aug 2023 15:56:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0D3A10E0A2;
	Sat, 26 Aug 2023 13:56:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE48B10E0A2
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Aug 2023 13:56:15 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4RXyz31ySXzDqdy;
 Sat, 26 Aug 2023 13:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1693058175; bh=K9zjB4SGxMMF55yrRCbkbCXNloSv7qGE80EWeywOcms=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=prntFsQfi0y+JVb/8vyyqxWjeJ4yxWP8QhzSJt6tnZozRAGfaHi3EVgVDuvqAdrwJ
 6xRD7i4hJYIXNop6b7fQvgm81b/Exp1R8xqWZp06diFHruEflK95xsK6TJQy/lCSff
 IrEkzeykouB/CBP4VIY44/squeF8naim2oqXij+Y=
X-Riseup-User-ID: C01FCAD6DED26A080B2AEFAFE8EA2CA30D6D2579FA585B3820653956D6F4D17D
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4RXyz0202szJq70;
 Sat, 26 Aug 2023 13:56:12 +0000 (UTC)
Message-ID: <94353212-7636-0556-253f-7b1d9d1762de@riseup.net>
Date: Sat, 26 Aug 2023 10:56:10 -0300
MIME-Version: 1.0
Subject: Re: [PATCH 02/10] drm/tests: Add parameters to the
 drm_test_framebuffer_create test
Content-Language: en-US
To: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>,
 dri-devel@lists.freedesktop.org
References: <20230825160725.12861-1-gcarlos@disroot.org>
 <20230825160725.12861-3-gcarlos@disroot.org>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20230825160725.12861-3-gcarlos@disroot.org>
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
Cc: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tales Lelo da Aparecida <tales.aparecida@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, David Gow <davidgow@google.com>,
 =?UTF-8?Q?Micha=c5=82_Winiarski?= <michal.winiarski@intel.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Carlos,

On 8/25/23 13:07, Carlos Eduardo Gallo Filho wrote:
> Extend the existing test case to cover:
> 1. Invalid flag atribute in the struct drm_mode_fb_cmd2.
> 2. Pixel format which requires non-linear modifier with
> DRM_FORMAT_MOD_LINEAR set.
> 3. Non-zero buffer offset for an unused plane
> 
> Also replace strcpy to strscpy on test_to_desc for improved security
> and reliability.
> 
> Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
> ---
>   drivers/gpu/drm/tests/drm_framebuffer_test.c | 23 +++++++++++++++++++-
>   1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
> index 173d42b145ed..aeaf2331f9cc 100644
> --- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
> +++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
> @@ -19,6 +19,8 @@
>   #define MIN_HEIGHT 4
>   #define MAX_HEIGHT 4096
>   
> +#define DRM_MODE_FB_INVALID BIT(2)
> +
>   struct drm_framebuffer_test {
>   	int buffer_created;
>   	struct drm_mode_fb_cmd2 cmd;
> @@ -83,6 +85,18 @@ static const struct drm_framebuffer_test drm_framebuffer_create_cases[] = {
>   		 .pitches = { 4 * MAX_WIDTH, 0, 0 },
>   	}
>   },
> +{ .buffer_created = 0, .name = "ABGR8888 Non-zero buffer offset for unused plane",
> +	.cmd = { .width = MAX_WIDTH, .height = MAX_HEIGHT, .pixel_format = DRM_FORMAT_ABGR8888,
> +		 .handles = { 1, 0, 0 }, .offsets = { UINT_MAX / 2, UINT_MAX / 2, 0 },
> +		 .pitches = { 4 * MAX_WIDTH, 0, 0 }, .flags = DRM_MODE_FB_MODIFIERS,
> +	}
> +},
> +{ .buffer_created = 0, .name = "ABGR8888 Invalid flag",
> +	.cmd = { .width = MAX_WIDTH, .height = MAX_HEIGHT, .pixel_format = DRM_FORMAT_ABGR8888,
> +		 .handles = { 1, 0, 0 }, .offsets = { UINT_MAX / 2, 0, 0 },
> +		 .pitches = { 4 * MAX_WIDTH, 0, 0 }, .flags = DRM_MODE_FB_INVALID,
> +	}
> +},
>   { .buffer_created = 1, .name = "ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers",
>   	.cmd = { .width = MAX_WIDTH, .height = MAX_HEIGHT, .pixel_format = DRM_FORMAT_ABGR8888,
>   		 .handles = { 1, 0, 0 }, .offsets = { UINT_MAX / 2, 0, 0 },
> @@ -262,6 +276,13 @@ static const struct drm_framebuffer_test drm_framebuffer_create_cases[] = {
>   		 .pitches = { MAX_WIDTH, DIV_ROUND_UP(MAX_WIDTH, 2), DIV_ROUND_UP(MAX_WIDTH, 2) },
>   	}
>   },
> +{ .buffer_created = 0, .name = "YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)",
> +	.cmd = { .width = MAX_WIDTH, .height = MAX_HEIGHT, .pixel_format = DRM_FORMAT_YUV420_10BIT,
> +		 .handles = { 1, 0, 0 }, .flags = DRM_MODE_FB_MODIFIERS,
> +		 .modifier = { DRM_FORMAT_MOD_LINEAR, 0, 0 },
> +		 .pitches = { MAX_WIDTH, 0, 0 },
> +	}
> +},
>   { .buffer_created = 1, .name = "X0L2 Normal sizes",
>   	.cmd = { .width = 600, .height = 600, .pixel_format = DRM_FORMAT_X0L2,
>   		 .handles = { 1, 0, 0 }, .pitches = { 1200, 0, 0 }
> @@ -369,7 +390,7 @@ static void drm_test_framebuffer_create(struct kunit *test)
>   
>   static void drm_framebuffer_test_to_desc(const struct drm_framebuffer_test *t, char *desc)
>   {
> -	strcpy(desc, t->name);
> +	strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
I believe this change should be done in a separate patch.

Best Regards,
- Maíra

>   }
>   
>   KUNIT_ARRAY_PARAM(drm_framebuffer_create, drm_framebuffer_create_cases,
