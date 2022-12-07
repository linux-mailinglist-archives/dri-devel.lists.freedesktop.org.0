Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 111C5645B9C
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 14:58:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CEAC10E3B1;
	Wed,  7 Dec 2022 13:58:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6B9C10E3B1
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 13:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xpxd7dkkl5q/KfS0CZUbzeIRSdaT0Ah5HzKQhmaMNp0=; b=iEInDFH947pg3B8SyceyF7tc1j
 wwP1ORmMPS5rvfEgJ1iNcND1f1blfyq0cP0kD0kFUmCSUaNheCWxXwvnle6mf7S5Xrx1J2Sgc3NbG
 dTt/DtHtonV7Rvy/f3NvEGMYgs9n+mmNvvXKhvX5Ex+yTvpN3Zc/6qFjTT0INd5SHxd3dDqhRTCdF
 kVb7NsAq3NF653osB67a2W+9/l8/yLMoAMsJ99BzJxpd4UDlKUkjTDcN19/ybAdGP16MVuQMijLZh
 /3xoqLQ6mqgeSH901gFlRn6ijti1e5RF6eHJ0mnJ++Lp/9NW6bkLq32roOTxWAcj6ognkSrB21Tim
 zd8Ciiuw==;
Received: from [143.107.182.242] (helo=[10.41.75.14])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1p2uve-00GbYI-6l; Wed, 07 Dec 2022 14:57:42 +0100
Message-ID: <35023956-d838-55af-63c2-e679a78a27eb@igalia.com>
Date: Wed, 7 Dec 2022 10:57:34 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 02/20] drm/tests: Introduce a config option for the
 KUnit helpers
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>
References: <20221123-rpi-kunit-tests-v3-0-4615a663a84a@cerno.tech>
 <20221123-rpi-kunit-tests-v3-2-4615a663a84a@cerno.tech>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20221123-rpi-kunit-tests-v3-2-4615a663a84a@cerno.tech>
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
Cc: linux-kselftest@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>,
 linux-media@vger.kernel.org, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/1/22 12:11, Maxime Ripard wrote:
> Driver-specific tests will need access to the helpers without pulling
> every DRM framework test. Let's create an intermediate Kconfig options
> for the helpers.
> 
> Suggested-by: Maíra Canal <mcanal@igalia.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra Canal

> ---
>   drivers/gpu/drm/Kconfig        | 7 +++++++
>   drivers/gpu/drm/Makefile       | 2 +-
>   drivers/gpu/drm/tests/Makefile | 4 +++-
>   3 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 315cbdf61979..9f019cd053e1 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -63,6 +63,12 @@ config DRM_USE_DYNAMIC_DEBUG
>   	  bytes per callsite, the .data costs can be substantial, and
>   	  are therefore configurable.
>   
> +config DRM_KUNIT_TEST_HELPERS
> +	tristate
> +	depends on DRM && KUNIT
> +	help
> +	  KUnit Helpers for KMS drivers.
> +
>   config DRM_KUNIT_TEST
>   	tristate "KUnit tests for DRM" if !KUNIT_ALL_TESTS
>   	depends on DRM && KUNIT
> @@ -73,6 +79,7 @@ config DRM_KUNIT_TEST
>   	select DRM_KMS_HELPER
>   	select DRM_BUDDY
>   	select DRM_EXPORT_FOR_TESTS if m
> +	select DRM_KUNIT_TEST_HELPERS
>   	default KUNIT_ALL_TESTS
>   	help
>   	  This builds unit tests for DRM. This option is not useful for
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index f92cd7892711..8d61fbdfdfac 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -125,7 +125,7 @@ obj-$(CONFIG_DRM_KMS_HELPER) += drm_kms_helper.o
>   # Drivers and the rest
>   #
>   
> -obj-$(CONFIG_DRM_KUNIT_TEST) += tests/
> +obj-y			+= tests/
>   
>   obj-$(CONFIG_DRM_MIPI_DBI) += drm_mipi_dbi.o
>   obj-$(CONFIG_DRM_MIPI_DSI) += drm_mipi_dsi.o
> diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
> index 94fe546d937d..ef14bd481139 100644
> --- a/drivers/gpu/drm/tests/Makefile
> +++ b/drivers/gpu/drm/tests/Makefile
> @@ -1,5 +1,8 @@
>   # SPDX-License-Identifier: GPL-2.0
>   
> +obj-$(CONFIG_DRM_KUNIT_TEST_HELPERS) += \
> +	drm_kunit_helpers.o
> +
>   obj-$(CONFIG_DRM_KUNIT_TEST) += \
>   	drm_buddy_test.o \
>   	drm_cmdline_parser_test.o \
> @@ -9,7 +12,6 @@ obj-$(CONFIG_DRM_KUNIT_TEST) += \
>   	drm_format_helper_test.o \
>   	drm_format_test.o \
>   	drm_framebuffer_test.o \
> -	drm_kunit_helpers.o \
>   	drm_mm_test.o \
>   	drm_modes_test.o \
>   	drm_plane_helper_test.o \
> 
