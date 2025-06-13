Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 890EDAD8554
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 10:17:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C18CA10E8F8;
	Fri, 13 Jun 2025 08:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ioscDVjQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D3010E8FD
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 08:17:49 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4532ff4331cso4599905e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 01:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749802667; x=1750407467; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rt6F+Z23Aft+xA5uWezSD5yGbLa3CJYvjiKEwLZVZCA=;
 b=ioscDVjQli76R36Gtz9VqHZMAJwhu83KHrH5zAUysIiXY2y00x+FA0Mv2Ndp11XOoL
 q1YLutRRFNeqqQjNfLwXSH2PFi5bJSNDNMsTRZ8Agsd0NGUO5QeHTZlp1NthpZ1JJVXM
 +Mqfqe4OpYbsbKgEvAgZ3h1tCB9q9LXv0he5j8MFE9b31h6jafK3crPYs6m4lV+7OkJo
 vHPp8t2cDTpQZ5NrJam7lQjfTRH5RgDMg7kRb8vKVN2PznOmbBe8GZfDAxCtoPpfPrjp
 ro06KfnLRVBfeDSdL3osqDLEQ+iRGf5F9BL7PbyKGjlXtIP0fl5z6URpq3EttElhPGRB
 RxqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749802667; x=1750407467;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rt6F+Z23Aft+xA5uWezSD5yGbLa3CJYvjiKEwLZVZCA=;
 b=kf9Gpu5Om6T7d/wS3EhTCgOUtG2PZU8Na3EMy38kE3pnhjj7Zzc1zruqbhp5G2WHL7
 mbY6raboT2BmMbLmr3yG/yPkMLeLdBjZw5yyBFW/oKPCCVuIFNMTssW9c8Zhk+wwHpjg
 QDyLWKPstuN1uO1YtDvhWJ+ZwNTeNNKiqcKL4NAaFckgNeXp5iCpecbZSnqfPP9qRvAZ
 HEl0Ng7BQjbejpct/JS11oRH43uTcPpttF65ZwU4P2AAF5z/ZYcyCNAZjcSTlgzMUv6t
 e4NaTTBVneu3eav2gI9hjfY2LS9d8Uh+sJKWbXA0hAVjj5jjZTrDgt/i/tG21GJpWkJ3
 T15A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrorV9hQmogh/ksXSxETGikbeIqbADBn59nW0qbeR+E5n/QdQfEmsleBnzYnVwTVfcPbBp3yU1SkI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGDMdZybd+rNREJKOh0iB+FSqRT9Rzg87Ra9gakLqtopyuzvb3
 Gkw0xehY2DJhtM2RkKCgPE3lH2LZZXhZQKL8V5YWERz/9lTT2k4FsEaf
X-Gm-Gg: ASbGncvU5ADr4uI9SULulpYzjgb9O7WMDPZdVAQxa0us6EQAYZdQzGDLK+MUQA7IILS
 NllXT1HxYPAwLW7vfP/fxw5k5Y99r0SL2X8bU0vSeCylBrFg51G/M/rtCAsHevwqzEwhZBHiwUs
 NMyKzPKs/StotE7LwZQ29ng5XJMb+fxbTrDawYONCh/pzeJ6lmPKWlauc2NH9vNF2wc+rGexa+s
 /cgxeR7BFrv31ju1pamYajl/Q1+5EY8ZwY1wjif8TwS6RfZtIEoyj1WJmmb7QvDDGziLKSlXkXu
 uGr9oMaCvI0DNwyAzvfhZZ8dg9iCNGcMM7ZXYj9fGyj0lsdbvf3wjUtR4PY=
X-Google-Smtp-Source: AGHT+IE37XdiRncot+0qpOqTgvAdM6xll/nxotswQzRCdD7ARMyB6dvERcyARcTwamIxCnRhu+fp3w==
X-Received: by 2002:a5d:588d:0:b0:3a4:e841:b236 with SMTP id
 ffacd0b85a97d-3a56876b10fmr1989688f8f.33.1749802667251; 
 Fri, 13 Jun 2025 01:17:47 -0700 (PDT)
Received: from fedora ([94.73.34.56]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568b61071sm1588930f8f.90.2025.06.13.01.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 01:17:46 -0700 (PDT)
Date: Fri, 13 Jun 2025 10:17:45 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: Re: [PATCH] drm/vkms: Compile all tests with
 CONFIG_DRM_VKMS_KUNIT_TEST
Message-ID: <aEveqf6QMFSryYFN@fedora>
References: <20250611205704.334527-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250611205704.334527-1-mcanal@igalia.com>
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

Hi Maíra,

On Wed, Jun 11, 2025 at 05:56:49PM -0300, Maíra Canal wrote:
> The Kconfig option `CONFIG_DRM_VKMS_KUNIT_TESTS` does not exist. However,
> the VKMS format tests use such an option for compilation, meaning that
> they are not compiled at all.
> 
> Use the Kconfig option `CONFIG_DRM_VKMS_KUNIT_TEST` to compile all VKMS
> KUnit tests.
> 
> Fixes: 3e897853debd ("drm/vkms: Create KUnit tests for YUV conversions")
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

Good catch!

Reviewed-by: José Expósito <jose.exposito89@gmail.com>

> ---
>  drivers/gpu/drm/vkms/tests/Makefile | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/tests/Makefile b/drivers/gpu/drm/vkms/tests/Makefile
> index 0ee077942ae2..5750f0bd9d40 100644
> --- a/drivers/gpu/drm/vkms/tests/Makefile
> +++ b/drivers/gpu/drm/vkms/tests/Makefile
> @@ -1,4 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  
> -obj-$(CONFIG_DRM_VKMS_KUNIT_TEST) += vkms_config_test.o
> -obj-$(CONFIG_DRM_VKMS_KUNIT_TESTS) += vkms_format_test.o
> +vkms-kunit-tests-y := \
> +	vkms_config_test.o \
> +	vkms_format_test.o
> +
> +obj-$(CONFIG_DRM_VKMS_KUNIT_TEST) += vkms-kunit-tests.o
> -- 
> 2.49.0
> 
