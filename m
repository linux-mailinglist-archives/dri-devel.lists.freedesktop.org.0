Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAA6958B4E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 17:30:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A945A10E20B;
	Tue, 20 Aug 2024 15:30:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WeEybNol";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9092E10E20B
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 15:30:06 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-428e3129851so46640215e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 08:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724167805; x=1724772605; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DEq7NMppy1gt4NfpoToKq8O2NR/NFez+l+dfZydtA2U=;
 b=WeEybNolYTeGJPF8KUCMklLD3aWes2KfalnhPQg+Ho+5owkE3Q//TxnclPxQePhKks
 s7ISOWgNrsu+O24AvOl2MzBNv73BqfuZGi4ycDKcfTy1uAlAkT/jg3ij6vt2M12b97oU
 /trz5KlXnIXfL0FQDlKkI2a0cJM1o84+IPuDpdTd+o+/iuumx24wJRXCTQ9dIpDqHLTu
 izXHG8Cffqxnpp/gj/Twp2h2fzXlvRwZQkKkpsoGZRNxr0VHOjZzc1SCPQ2JLadUEWQ3
 cFhu/2pL3GrHNbwCPkJJn4sP2Gm0vHXCu2yIci0sXAgrNEhM0yvzWVUDsIt5ORJc1T2G
 tKJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724167805; x=1724772605;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DEq7NMppy1gt4NfpoToKq8O2NR/NFez+l+dfZydtA2U=;
 b=I65DP8R6J4IOAe0PSgGd15NN1mMb2JMC4zsPWJqDmpV8pM0Wxm4mXQIjlV6t4t5+Ci
 UtT26W9mTrbJyd2uU7WouUkYbeFBf7pGwMi//Qfh9rXu8vKhx6kM5ByVp5ZO5WhePmbq
 gxRJWUEix4/Y5oInwiMCPEXtp70LWZhI2UvPZu2U7rD7nHojQPr1xGXyzxw9iinccK80
 s+tF9ZOX2HHdKT6OIYF0oUuuVemcAip58kOWNpuh8awLE8159PJkB0NEFwWBgdy7XRz/
 Q0HmO51ygi0gGVPANDke9Yt3S1jDBMxJGoGsxQSX2dK3O8iduFWoXtbJNREVcjwFCxTs
 zA9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXgku9GC47FoyhPX0TtSv7sx0bIazDKq0/w/NB0cJAw/ulodH8FsuoUyKWaXVCwyRHOEaXwEV9j08=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4sKWOT1l70aLHLsVBFQFvp02nqVUoiE4AkM30cJ3qhxWMccov
 AJwSC72UvQhn42XcWVHCYSk984ZtOE1/rmnKUwbBFtPSteC4sJVs
X-Google-Smtp-Source: AGHT+IH5v6j/VMUOZmSJJRpKuoVYPkrfm7/W88if2ic7Mu0gZz/aOczMza3ZgepMjX3o/JrPTJ/1Yw==
X-Received: by 2002:a05:600c:450b:b0:428:640:c1b1 with SMTP id
 5b1f17b1804b1-429ed7c0944mr96908305e9.17.1724167804728; 
 Tue, 20 Aug 2024 08:30:04 -0700 (PDT)
Received: from fedora.. ([213.94.26.172]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ded7d5a9sm198247505e9.43.2024.08.20.08.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 08:30:03 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: airlied@gmail.com, arthurgrillo@riseup.net, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
 jeremie.dautheribes@bootlin.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mairacanal@riseup.net,
 marcheu@google.com, melissa.srw@gmail.com, miquel.raynal@bootlin.com,
 mripard@kernel.org, nicolejadeyee@google.com,
 rodrigosiqueiramelo@gmail.com, seanpaul@google.com,
 thomas.petazzoni@bootlin.com, tzimmermann@suse.de,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH RFC 6/6] drm/vkms: Extract vkms_composer header
Date: Tue, 20 Aug 2024 17:30:00 +0200
Message-ID: <20240820153001.2899-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240814-google-split-headers-v1-6-51712f088f5d@bootlin.com>
References: <20240814-google-split-headers-v1-6-51712f088f5d@bootlin.com>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> The vkms composer functions are defined in a different .c, so make the
> same thing for the function declaration in the headers and create
> vkms_composer.h.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Reviewed-by: José Expósito <jose.exposito89@gmail.com>

> ---
>  drivers/gpu/drm/vkms/vkms_composer.c  |  2 ++
>  drivers/gpu/drm/vkms/vkms_composer.h  | 18 ++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_crtc.c      |  1 +
>  drivers/gpu/drm/vkms/vkms_drv.h       | 11 -----------
>  drivers/gpu/drm/vkms/vkms_writeback.c |  1 +
>  5 files changed, 22 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index 139d249454c4..15ef07ed304e 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -10,7 +10,9 @@
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_vblank.h>
>  #include <linux/minmax.h>
> +#include <drm/drm_print.h>
>  
> +#include "vkms_composer.h"
>  #include "vkms_crtc.h"
>  #include "vkms_writeback.h"
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.h b/drivers/gpu/drm/vkms/vkms_composer.h
> new file mode 100644
> index 000000000000..91b33af1e013
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/vkms_composer.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +
> +#ifndef _VKMS_COMPOSER_H
> +#define _VKMS_COMPOSER_H

#ifndef _VKMS_COMPOSER_H_
#define _VKMS_COMPOSER_H_

> +#include "vkms_drv.h"
> +#include "vkms_crtc.h"
> +
> +void vkms_composer_worker(struct work_struct *work);
> +void vkms_set_composer(struct vkms_output *out, bool enabled);
> +
> +/* CRC Support */
> +const char *const *vkms_get_crc_sources(struct drm_crtc *crtc, size_t *count);
> +int vkms_set_crc_source(struct drm_crtc *crtc, const char *src_name);
> +int vkms_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
> +			   size_t *values_cnt);
> +
> +#endif //_VKMS_COMPOSER_H

#endif /* _VKMS_COMPOSER_H_ */

> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> index cb6e49a86745..6fae43932b60 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -9,6 +9,7 @@
>  #include <drm/drm_print.h>
>  
>  #include "vkms_crtc.h"
> +#include "vkms_composer.h"
>  #include "vkms_plane.h"

+#include "vkms_composer.h"
 #include "vkms_crtc.h"
 #include "vkms_plane.h"

>  static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 943ad55e0172..f74a5c2045f9 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -106,15 +106,4 @@ struct vkms_device {
>  
>  int vkms_output_init(struct vkms_device *vkmsdev, int possible_crtc_index);
>  
> -/* CRC Support */
> -const char *const *vkms_get_crc_sources(struct drm_crtc *crtc,
> -					size_t *count);
> -int vkms_set_crc_source(struct drm_crtc *crtc, const char *src_name);
> -int vkms_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
> -			   size_t *values_cnt);
> -
> -/* Composer Support */
> -void vkms_composer_worker(struct work_struct *work);
> -void vkms_set_composer(struct vkms_output *out, bool enabled);
> -
>  #endif /* _VKMS_DRV_H_ */
> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
> index 48f3f7f2e2a4..5e75880a5845 100644
> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> @@ -15,6 +15,7 @@
>  #include "vkms_writeback.h"
>  #include "vkms_crtc.h"
>  #include "vkms_formats.h"
> +#include "vkms_composer.h"

 #include "vkms_crtc.h"
 +#include "vkms_composer.h"
 #include "vkms_formats.h"

>  static const u32 vkms_wb_formats[] = {
>  	DRM_FORMAT_ARGB8888,
> 
