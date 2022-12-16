Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8876764F4D0
	for <lists+dri-devel@lfdr.de>; Sat, 17 Dec 2022 00:13:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D52010E63E;
	Fri, 16 Dec 2022 23:12:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7725810E63E
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 23:12:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CBE3FB81DA5;
 Fri, 16 Dec 2022 23:12:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5AC7C433EF;
 Fri, 16 Dec 2022 23:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671232358;
 bh=lYqEm1fOBG2ZvsK3262UnpfCxKIr59xmbX4WUI9+htU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R3aljbYPMsnGlPeHgiK1DUQ3xwr0d4fmiMCs/8vmBzIu1sHmTNOQohXKuiWHs1P6j
 TlSo1xTs4gA6iuOV472eg7VdT4EFmFc8ahjLAjxkKywTKAUN39ypaKdLucRfW9Tmzw
 90tWJIJWSTjrg2yxPtx2FLdw/qdXyHvfZm4hIU8UX3VDxcxbRTHnNceemIpwmWdqPJ
 5JRuKD+Re771M2FAFWHkKKWtK2rnl8XKcglscbZ5sPgU/QbmmGTzeVNDwoPfecKK47
 Gu50yb9q7pFbIzHph/83s7xWEeFCSL9vZyxUGmhswKq6DPDyXYqfd+hU/xIWjcTIqp
 gjG9euIKIPoiA==
Date: Fri, 16 Dec 2022 16:12:36 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] drm/tests: reduce drm_mm_test stack usage
Message-ID: <Y5z7ZJdioD0Nyqss@dev-arch.thelio-3990X>
References: <20221215163511.266214-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221215163511.266214-1-arnd@kernel.org>
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
 linux-kernel@vger.kernel.org,
 =?iso-8859-1?Q?Ma=EDra?= Canal <maira.canal@usp.br>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 15, 2022 at 05:34:49PM +0100, Arnd Bergmann wrote:
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

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

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
> -- 
> 2.35.1
> 
