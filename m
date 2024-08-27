Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B6D9615E5
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 19:50:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C2C10E3E3;
	Tue, 27 Aug 2024 17:50:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="CeOKw0OZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6596110E3DE
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 17:49:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 95DCDC0004;
 Tue, 27 Aug 2024 17:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1724780994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GOnNUG3cd/0waVvohzOx9KHsEr1fpkRCt/BCJPJqJwA=;
 b=CeOKw0OZ2/LUEeuCAS2/nrF0c99Cqqo64u/ZMd3lAicmrGKfZJhsOvHpr5k4d9VI4E4sTU
 kru4bGarSvlF6x3awPI7X9QtycREgSF+/FrTNs6mZEaac1ha7PgsCmsm/O30aQ3Yvx7kXZ
 +8xAxK++SNoLmtzeyeSCJBZ122cnGKtLlZBMVeQFqwmY/Ro46WS0A08mvJJpknTgFzxwtQ
 rCE1riuBZHIu/qb4pImoB+oMPQxvQpY6CH9oEG7+DChK4BQZNXUiEy4upVUXEkWqlC6I9v
 L7Ei3zIRLDp7wCpb4jS7fGNwC4FQvlIt+YlaZ5CTTNPb4UslQHaJZK2qBMRf4w==
Date: Tue, 27 Aug 2024 19:49:52 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org,
 Arthur Grillo <arthurgrillo@riseup.net>
Subject: Re: [PATCH v5 03/44] drm/vkms: Add kunit tests for VKMS LUT handling
Message-ID: <Zs4RwDvKT_8TyyD0@louis-chauvet-laptop>
References: <20240819205714.316380-1-harry.wentland@amd.com>
 <20240819205714.316380-4-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240819205714.316380-4-harry.wentland@amd.com>
X-GND-Sasl: louis.chauvet@bootlin.com
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

Le 19/08/24 - 16:56, Harry Wentland a écrit :

[...]

> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index 3d6785d081f2..3ecda70c2b55 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -435,3 +435,7 @@ int vkms_set_crc_source(struct drm_crtc *crtc, const char *src_name)
diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 3d6785d081f2..3ecda70c2b55 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -435,3 +435,7 @@ int vkms_set_crc_source(struct drm_crtc *crtc, const char *src_name)
 
 	return ret;
 }
+
+#ifdef CONFIG_DRM_VKMS_KUNIT_TESTS
+#include "tests/vkms_color_tests.c"
+#endif>  
>  	return ret;
>  }
> +
> +#ifdef CONFIG_DRM_VKMS_KUNIT_TESTS
> +#include "tests/vkms_color_tests.c"
> +#endif

This is very strange to include a .c in this file, is it something done a 
lot in the kernel? I can find only one occurence of this pattern in the 
kernel [1], the other tests are in their own modules.

In addition it crate many warning during compilations:
	warning: symbol 'test_*' was not declared. Should it be static?

As other tests will be introduced (yuv [2], config [3]), it is maybe 
interesting to introduce a new module as [2] is doing?

[1]: https://elixir.bootlin.com/linux/v6.11-rc5/source/fs/ext4/mballoc.c#L7047
[2]: https://lore.kernel.org/all/20240809-yuv-v10-14-1a7c764166f7@bootlin.com/
[3]: https://lore.kernel.org/all/20240814-google-remove-crtc-index-from-parameter-v1-15-6e179abf9fd4@bootlin.com/

