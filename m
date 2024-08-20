Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E36A958B3B
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 17:28:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE2AB10E0F3;
	Tue, 20 Aug 2024 15:28:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Xm707Vmn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1103710E0F3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 15:28:34 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4280ee5f1e3so45784535e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 08:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724167712; x=1724772512; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NIrlCuLTaxo8WrD54SgqcX7G7Cr01d8R61u5rpHn5/c=;
 b=Xm707VmnBfjKFNCiXMOaoT0gEmFPRf8Owk24Dpp8qSW/amM5e25gcByUDFEuFnK5Zt
 XZzTCQMgz9vNrqLxLs5dHkiEL/ReZvWG1JmnhXPCMxeXPAjBzZNyxZUkm9srk6zzD4MI
 KrPJISPFFo/iausUXUi7f4m9BqNgCu9wUTCDBfs8Hshue+h9WNMxR0xZo5MFvTuQaopu
 9znlJkm3FP9zIlGE3jBdBr0UkxSE498lnivCZ/HFaTNAlPwf+uPSJuckLkacQ4YlVKsn
 +yQ9ewRNu13cyfAq3qt7b3KAiqQLp91UD5CJzYtRM+TzyW+M7kj+JhdNPnD5/17nAn0E
 tJ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724167712; x=1724772512;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NIrlCuLTaxo8WrD54SgqcX7G7Cr01d8R61u5rpHn5/c=;
 b=ngat8XL0P/vsOQgLEGBIbR+VIH/SpVc/j5ZDUyzMVdjuxt0Ony7l2an0Yxt3wFhzaW
 F4309zXjoqmaNynW6baoZZcQYWD1s9AL+E/8C2IoAEWz/5ujdDtzOzZMe1dtnIfo/fAP
 X19UV/SGaeEpNCLeZcVDhKn2EzaTzszc/omCcCgkfTF99+T2rpSa4dJDHovkNECvqt7J
 kAG1x1x7pT8OKntnFnmak7YkwOvTbEVHZ/RhQQxzFW+ypZKvSBo/PbHhV/nKvUh/0Prm
 86KxmNZNKPpNCko+GKa+Z+nqlynq1fykRcTvwON4EdFKk5D62BfYbNXMvbwpy9NVAcFq
 YoUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoNWZoC22WT6MUEqovVJ002ezXl9u7aTK71rzVt2EDx0NEe9WoY78EZTzlUIvOniAO/2JfOoVDTR8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8BRufqmDFuYR0Y4P7I1Pj4ElK5oDrkCBMZwy9wlUu2tgkbwMq
 Dwa1ykjUTcUFVGESCPAT8I4YRfugED5VO2FqIFBQdUBXsP0Wo83e
X-Google-Smtp-Source: AGHT+IHO4jvxhy4/S0vM6+zR2P6ICxauJ/zzVFcxMqcuJAHZx/AE4Tk5M9bdXHdy1ayBxRFeUsewqg==
X-Received: by 2002:a05:600c:4fc8:b0:426:593c:9361 with SMTP id
 5b1f17b1804b1-429ed7d1f39mr102340175e9.26.1724167711953; 
 Tue, 20 Aug 2024 08:28:31 -0700 (PDT)
Received: from fedora.. ([213.94.26.172]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ded35744sm199720365e9.23.2024.08.20.08.28.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 08:28:31 -0700 (PDT)
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
Subject: [PATCH RFC 2/6] drm/vkms: Extract vkms_writeback header
Date: Tue, 20 Aug 2024 17:28:28 +0200
Message-ID: <20240820152829.2825-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240814-google-split-headers-v1-2-51712f088f5d@bootlin.com>
References: <20240814-google-split-headers-v1-2-51712f088f5d@bootlin.com>
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

> The vkms writeback functions are defined in a different .c, so
> make the same thing for the function declaration in the headers and create
> vkms_writeback.h.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Reviewed-by: José Expósito <jose.exposito89@gmail.com>

> ---
>  drivers/gpu/drm/vkms/vkms_composer.c  |  1 +
>  drivers/gpu/drm/vkms/vkms_drv.h       | 10 ----------
>  drivers/gpu/drm/vkms/vkms_formats.c   |  2 +-
>  drivers/gpu/drm/vkms/vkms_output.c    |  2 ++
>  drivers/gpu/drm/vkms/vkms_writeback.c |  2 ++
>  drivers/gpu/drm/vkms/vkms_writeback.h | 20 ++++++++++++++++++++
>  6 files changed, 26 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index f0cae142ac22..825011f696ee 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -12,6 +12,7 @@
>  #include <linux/minmax.h>
>  
>  #include "vkms_drv.h"
> +#include "vkms_writeback.h"
>  
>  static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
>  {
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 0db443924a15..46daa2fab6e8 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -46,13 +46,6 @@ struct vkms_frame_info {
>  };
>  
>  
> -struct vkms_writeback_job {
> -	struct iosys_map data[DRM_FORMAT_MAX_PLANES];
> -	struct vkms_frame_info wb_frame_info;
> -	pixel_write_line_t pixel_write;
> -};
> -
> -
>  struct vkms_plane_state;
>  
>  
> @@ -225,7 +218,4 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
>  void vkms_composer_worker(struct work_struct *work);
>  void vkms_set_composer(struct vkms_output *out, bool enabled);
>  
> -/* Writeback */
> -int vkms_enable_writeback_connector(struct vkms_device *vkmsdev);
> -
>  #endif /* _VKMS_DRV_H_ */
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index 5ab84801d8da..cbfa7943e948 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -11,7 +11,7 @@
>  
>  #include <kunit/visibility.h>
>  
> -#include "vkms_drv.h"
> +#include "vkms_writeback.h"
>  #include "vkms_formats.h"

Nit: Keep sorted alphabetically

>  /**
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index 36db2c8923cb..0c55682337a4 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -5,6 +5,8 @@
>  #include <drm/drm_edid.h>
>  #include <drm/drm_probe_helper.h>
>  
> +#include "vkms_writeback.h"
> +
>  static const struct drm_connector_funcs vkms_connector_funcs = {
>  	.fill_modes = drm_helper_probe_single_connector_modes,
>  	.destroy = drm_connector_cleanup,
> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
> index 7e0302c0830c..4a830a4c4d64 100644
> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> @@ -10,8 +10,10 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_gem_shmem_helper.h>
> +#include <drm/drm_framebuffer.h>
>  
>  #include "vkms_drv.h"
> +#include "vkms_writeback.h"
>  #include "vkms_formats.h"

The same here

>  static const u32 vkms_wb_formats[] = {
> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.h b/drivers/gpu/drm/vkms/vkms_writeback.h
> new file mode 100644
> index 000000000000..70f0c4c26c23
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/vkms_writeback.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +
> +#ifndef _VKMS_WRITEBACK_H
> +#define _VKMS_WRITEBACK_H

The style for guards used in the other files is:

#ifndef _VKMS_WRITEBACK_H_
#define _VKMS_WRITEBACK_H_

> +
> +#include "vkms_drv.h"
> +#include "vkms_formats.h"
> +
> +struct vkms_crtc;
> +
> +struct vkms_writeback_job {
> +	struct iosys_map data[DRM_FORMAT_MAX_PLANES];
> +	struct vkms_frame_info wb_frame_info;
> +	pixel_write_line_t pixel_write;
> +};
> +
> +/* Writeback */
> +int vkms_enable_writeback_connector(struct vkms_device *vkmsdev);
> +
> +#endif //_VKMS_WRITEBACK_H

And here a /* */ comment is used:

#endif /* _VKMS_WRITEBACK_H_ */

Best wishes,
Jose
