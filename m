Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BACF6526E9
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 20:28:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 394E010E3D5;
	Tue, 20 Dec 2022 19:28:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B865110E3CC
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 19:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cjwugnyOcfkc5U5fWcTHxiaxFg7f7rBtDIM03J92Ct0=; b=SnBtcTV75E1lEfSyHuKfTiMV5H
 dMwnXrYDrExtJHABsJMQgpNI2DqpYMI2olV+z/urHHiT3C1ZtDTjema5OKq06/N2qkYkJLeGLXm5g
 l/sXtbaeIeXm/nkVlgAvu5iKq1Ezgz2HN6J7/KVvMIxvdoKVAoNQvTUhHDArZlKD+TWir5KTQmXZt
 lv6BvBQmi0J1H8eVp405HYKR1f+Nz4V8AIa93X0BnmS574dZAfJi0Utos3uUnHohfmQWwIdbwQa5H
 VRl4zrt8JzJmyCGTWn5XSMppc2YXzL2G0YBy7AdGCsLA+/NiNo0K/NgvNAS9Z6gseI/xYA0jGHyGw
 t+3dXwgw==;
Received: from [177.34.169.227] (helo=[192.168.0.8])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1p7iHI-007609-Ub; Tue, 20 Dec 2022 20:27:53 +0100
Message-ID: <9c9d97a9-7543-06ed-f50b-f48b1c3a9def@igalia.com>
Date: Tue, 20 Dec 2022 16:27:43 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] drm/tests: reduce drm_mm_test stack usage
To: Arnd Bergmann <arnd@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20221215163511.266214-1-arnd@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20221215163511.266214-1-arnd@kernel.org>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Tom Rix <trix@redhat.com>,
 Daniel Latypov <dlatypov@google.com>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <maira.canal@usp.br>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/15/22 13:34, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The check_reserve_boundaries function uses a lot of kernel stack,
> and it gets inlined by clang, which makes __drm_test_mm_reserve
> use even more of it, to the point of hitting the warning limit:
> 
> drivers/gpu/drm/tests/drm_mm_test.c:344:12: error: stack frame size (1048) exceeds limit (1024) in '__drm_test_mm_reserve' [-Werror,-Wframe-larger-than]
> 
> When building with gcc, this does not happen, but the structleak
> plugin can similarly increase the stack usage and needs to be
> disabled, as we do for all other kunit users.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Apart from the checkpatch problem on the function
check_reserve_boundaries(),

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra Canal

> ---
>  drivers/gpu/drm/tests/Makefile      | 2 ++
>  drivers/gpu/drm/tests/drm_mm_test.c | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
> index b29ef1085cad..f896ef85c2f2 100644
> --- a/drivers/gpu/drm/tests/Makefile
> +++ b/drivers/gpu/drm/tests/Makefile
> @@ -12,3 +12,5 @@ obj-$(CONFIG_DRM_KUNIT_TEST) += \
>  	drm_mm_test.o \
>  	drm_plane_helper_test.o \
>  	drm_rect_test.o
> +
> +CFLAGS_drm_mm_test.o := $(DISABLE_STRUCTLEAK_PLUGIN)
> diff --git a/drivers/gpu/drm/tests/drm_mm_test.c b/drivers/gpu/drm/tests/drm_mm_test.c
> index 89f12d3b4a21..90a5becc99b8 100644
> --- a/drivers/gpu/drm/tests/drm_mm_test.c
> +++ b/drivers/gpu/drm/tests/drm_mm_test.c
> @@ -298,7 +298,7 @@ static bool expect_reserve_fail(struct kunit *test, struct drm_mm *mm, struct dr
>  	return false;
>  }
>  
> -static bool check_reserve_boundaries(struct kunit *test, struct drm_mm *mm,
> +static bool noinline_for_stack check_reserve_boundaries(struct kunit *test, struct drm_mm *mm,
>  				     unsigned int count,
>  				     u64 size)
>  {
