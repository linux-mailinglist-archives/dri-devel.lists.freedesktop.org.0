Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F26E958B3E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 17:29:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 187BA10E1E1;
	Tue, 20 Aug 2024 15:28:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NqZNfzVU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59EB810E1E1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 15:28:58 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-42ab99fb45dso8041275e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 08:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724167737; x=1724772537; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DQ8nwipYzQ9k/1PPzTLrMyjUCKSjsTZBYLAPEH6Cyy0=;
 b=NqZNfzVUQbkiixXO9UkesZOg+cxHZrb0G6Y6MFBhOUC62kja5G1pfXeqAA13af1KNp
 7o8qgwic2ZCZHSzcsvvV+lfnAc9gg2wgw3xSuGM6Yqn9bGpLxPVi4UkKupbf8qUG2W7L
 XSvRxv50FjsDHja+y8qcVGqOpLnwq9PuDpUxLq3M8Kp+9UOjpzVTCNIXdoAuB/WBj/yI
 C/+Bgp1onSF52XqNGh7s4HVzDyZ8eq/noQRqSDAB1Acon9G8WriV3BoGB3hMuLWzYSFB
 X2SA3CE2D4K50jDHRmu6O8xkw+OnI9z7M2yZAk3oovFHsY9h98AYZiWUzGb5ODoUwWn5
 TDNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724167737; x=1724772537;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DQ8nwipYzQ9k/1PPzTLrMyjUCKSjsTZBYLAPEH6Cyy0=;
 b=b7O8npX8UKhRxGxMsKQlNqxbfkeQPi/pvVOA4ECygbWIGSxP7FNc1NFaRXsihwCpGr
 muqv65iO2mSjwF1GgjwrdpzbP+Yog1YhdLKzcU7HEihvs6AUoxAdqmdw9zSTl6ox6YmD
 2a4pZKy/IPGNvmhXBBMjuEECuCE6xsszO4hOLTZaKmk8i+Gn4CK/nU+Vg8us5O1Qn3Ix
 cXzSRkRDlaDvdLxNzr1Vr+Bn5wmPp35dO6UbftNiGTaq+rbntfAfeVkPCK51L2R3/YQe
 MzyLnziRSPYULoGDaRx6o2J8vQxgOpg8GQjJ0F96qvmo/j4/TG1LxFUuiaAufZt38fqR
 PCDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTC+lhu3T3KQ8aFP5kvkcKe7n0VwbGpGeASKChEIO14C5cCyiJYUeaO1pklGG85zAM0Z1SJTH4s7uCK/ejJ6uPscGMXoHBkZ7BpL125aFX
X-Gm-Message-State: AOJu0Yx6RrPc86xtqbtLIXPlmoJ6xN4UpN/fd2TR3l/nnRa9udSi/tEm
 bcNGlfyQD7N30AvwHMTP8AyZkJvUZxY3gpDoQysr2lmOY0DeFl2l6SgCKwNL
X-Google-Smtp-Source: AGHT+IFgY4oeQnI696QoVkI47ToEkzlQOvxgC4s/31CTEsFThLvQ454i3v0haJ2fZh8PapXdAPNreQ==
X-Received: by 2002:a05:600c:4506:b0:426:5c81:2538 with SMTP id
 5b1f17b1804b1-429ed7955e5mr126993645e9.14.1724167736366; 
 Tue, 20 Aug 2024 08:28:56 -0700 (PDT)
Received: from fedora.. ([213.94.26.172]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3718985ae26sm13368343f8f.55.2024.08.20.08.28.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 08:28:56 -0700 (PDT)
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
Subject: [PATCH RFC 3/6] drm/vkms: Extract vkms_plane header
Date: Tue, 20 Aug 2024 17:28:50 +0200
Message-ID: <20240820152852.2843-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240814-google-split-headers-v1-3-51712f088f5d@bootlin.com>
References: <20240814-google-split-headers-v1-3-51712f088f5d@bootlin.com>
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

> In order to properly split vkms_output function, extract all
> its function to its own header.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Reviewed-by: José Expósito <jose.exposito89@gmail.com>

> ---
>  drivers/gpu/drm/vkms/vkms_crtc.c      |  2 ++
>  drivers/gpu/drm/vkms/vkms_drv.h       | 56 ------------------------------
>  drivers/gpu/drm/vkms/vkms_formats.c   |  3 +-
>  drivers/gpu/drm/vkms/vkms_output.c    |  2 +-
>  drivers/gpu/drm/vkms/vkms_plane.c     |  3 ++
>  drivers/gpu/drm/vkms/vkms_plane.h     | 65 +++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_writeback.c |  1 -
>  drivers/gpu/drm/vkms/vkms_writeback.h |  1 +
>  8 files changed, 74 insertions(+), 59 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> index 06e28305d660..6a4de8f7a678 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -6,8 +6,10 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_vblank.h>
> +#include <drm/drm_print.h>

Seems unrelated to this change? Anyway, it'd be nice to place it after
drm_probe_helper.h.

>  
>  #include "vkms_drv.h"
> +#include "vkms_plane.h"
>  
>  static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
>  {
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 46daa2fab6e8..ea73f01fcc74 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -27,48 +27,6 @@
>  
>  #define VKMS_LUT_SIZE 256
>  
> -/**
> - * struct vkms_frame_info - Structure to store the state of a frame
> - *
> - * @fb: backing drm framebuffer
> - * @src: source rectangle of this frame in the source framebuffer, stored in 16.16 fixed-point form
> - * @dst: destination rectangle in the crtc buffer, stored in whole pixel units
> - * @map: see drm_shadow_plane_state@data
> - * @rotation: rotation applied to the source.
> - *
> - * @src and @dst should have the same size modulo the rotation.
> - */
> -struct vkms_frame_info {
> -	struct drm_framebuffer *fb;
> -	struct drm_rect src, dst;
> -	struct iosys_map map[DRM_FORMAT_MAX_PLANES];
> -	unsigned int rotation;
> -};
> -
> -
> -struct vkms_plane_state;

I guess this forward declaration was added by a previous patch in a different
series, but it is not required. Mentioning just in case you'd like to fix it in
the correct patch.

> -
> -
> -
> -/**
> - * struct vkms_plane_state - Driver specific plane state
> - * @base: base plane state
> - * @frame_info: data required for composing computation
> - * @pixel_read_line: function to read a pixel line in this plane. The creator of a
> - *		     struct vkms_plane_state must ensure that this pointer is valid
> - * @conversion_matrix: matrix used for yuv formats to convert to rgb
> - */
> -struct vkms_plane_state {
> -	struct drm_shadow_plane_state base;
> -	struct vkms_frame_info *frame_info;
> -	pixel_read_line_t pixel_read_line;
> -	struct conversion_matrix conversion_matrix;
> -};
> -
> -struct vkms_plane {
> -	struct drm_plane base;
> -};
> -
>  /**
>   * struct vkms_crtc_state - Driver specific CRTC state
>   *
> @@ -174,9 +132,6 @@ struct vkms_device {
>  #define to_vkms_crtc_state(target)\
>  	container_of(target, struct vkms_crtc_state, base)
>  
> -#define to_vkms_plane_state(target)\
> -	container_of(target, struct vkms_plane_state, base.base)
> -
>  /**
>   * vkms_crtc_init() - Initialize a crtc for vkms
>   * @dev: drm_device associated with the vkms buffer
> @@ -196,17 +151,6 @@ int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
>  
>  int vkms_output_init(struct vkms_device *vkmsdev, int possible_crtc_index);
>  
> -/**
> - * vkms_plane_init() - Initialize a plane
> - *
> - * @vkmsdev: vkms device containing the plane
> - * @type: type of plane to initialize
> - * @possible_crtc_index: Crtc which can be attached to the plane. The caller must ensure that
> - * possible_crtc_index is positive and less or equals to 31.
> - */
> -struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
> -				   enum drm_plane_type type, int possible_crtc_index);
> -
>  /* CRC Support */
>  const char *const *vkms_get_crc_sources(struct drm_crtc *crtc,
>  					size_t *count);
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index cbfa7943e948..4e8494d4ade4 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -11,8 +11,9 @@
>  
>  #include <kunit/visibility.h>
>  
> -#include "vkms_writeback.h"
> +#include "vkms_plane.h"
>  #include "vkms_formats.h"
> +#include "vkms_writeback.h"

The #include "vkms_writeback.h" was added by the previous patch. We can avoid
moving it here by adding it at the bottom. plane.h should go after formats.h.

>  
>  /**
>   * packed_pixels_offset() - Get the offset of the block containing the pixel at coordinates x/y
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index 0c55682337a4..09fcf242ecf7 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -1,11 +1,11 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  
> -#include "vkms_drv.h"
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_edid.h>
>  #include <drm/drm_probe_helper.h>
>  
>  #include "vkms_writeback.h"
> +#include "vkms_plane.h"

#include "vkms_plane.h"
#include "vkms_writeback.h"

>  
>  static const struct drm_connector_funcs vkms_connector_funcs = {
>  	.fill_modes = drm_helper_probe_single_connector_modes,
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> index 9d85464ee0e9..de2c83e1b02c 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -8,9 +8,12 @@
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_framebuffer.h>
> +#include <drm/drm_print.h>

 #include <drm/drm_fourcc.h>
+#include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_print.h>

>  
>  #include "vkms_drv.h"
>  #include "vkms_formats.h"
> +#include "vkms_plane.h"
> 
>  static const u32 vkms_formats[] = {
>  	DRM_FORMAT_ARGB8888,
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.h b/drivers/gpu/drm/vkms/vkms_plane.h
> new file mode 100644
> index 000000000000..161b44da0240
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/vkms_plane.h
> @@ -0,0 +1,65 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +
> +#ifndef _VKMS_PLANE_H
> +#define _VKMS_PLANE_H

#ifndef _VKMS_PLANE_H_
#define _VKMS_PLANE_H_

> +
> +#include <drm/drm_framebuffer.h>
> +#include <drm/drm_plane.h>
> +#include <drm/drm_gem_atomic_helper.h>
> +#include <linux/iosys-map.h>
> +
> +#include "vkms_drv.h"
> +#include "vkms_formats.h"

While including "vkms_drv.h" from other headers should be fine
> +
> +struct vkms_plane {
> +	struct drm_plane base;
> +};
> +
> +/**
> + * struct vkms_plane_state - Driver specific plane state
> + * @base: base plane state
> + * @frame_info: data required for composing computation
> + * @pixel_read_line: function to read a pixel line in this plane. The creator of a vkms_plane_state
> + * must ensure that this pointer is valid
> + * @conversion_matrix: matrix used for yuv formats to convert to rgb
> + */
> +struct vkms_plane_state {
> +	struct drm_shadow_plane_state base;
> +	struct vkms_frame_info *frame_info;
> +	pixel_read_line_t pixel_read_line;
> +	struct conversion_matrix conversion_matrix;
> +};
> +
> +/**
> + * struct vkms_frame_info - structure to store the state of a frame
> + *
> + * @fb: backing drm framebuffer
> + * @src: source rectangle of this frame in the source framebuffer, stored in 16.16 fixed-point form
> + * @dst: destination rectangle in the crtc buffer, stored in whole pixel units
> + * @map: see drm_shadow_plane_state@data
> + * @rotation: rotation applied to the source.
> + *
> + * @src and @dst should have the same size modulo the rotation.
> + */
> +struct vkms_frame_info {
> +	struct drm_framebuffer *fb;
> +	struct drm_rect src, dst;
> +	struct iosys_map map[DRM_FORMAT_MAX_PLANES];
> +	unsigned int rotation;
> +};
> +
> +/**
> + * vkms_plane_init() - Initialize a plane
> + *
> + * @vkmsdev: vkms device containing the plane
> + * @type: type of plane to initialize
> + * @possible_crtc_index: Crtc which can be attached to the plane. The caller must ensure that
> + * possible_crtc_index is positive and less or equals to 31.
> + */
> +struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
> +				   enum drm_plane_type type, int possible_crtc_index);
> +
> +#define to_vkms_plane_state(target)\
> +	container_of(target, struct vkms_plane_state, base.base)
> +
> +#endif //_VKMS_PLANE_H

#endif /* _VKMS_PLANE_H_ */

> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
> index 4a830a4c4d64..740d9e2f3d71 100644
> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> @@ -12,7 +12,6 @@
>  #include <drm/drm_gem_shmem_helper.h>
>  #include <drm/drm_framebuffer.h>
>  
> -#include "vkms_drv.h"
>  #include "vkms_writeback.h"
>  #include "vkms_formats.h"
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.h b/drivers/gpu/drm/vkms/vkms_writeback.h
> index 70f0c4c26c23..44dff15faff6 100644
> --- a/drivers/gpu/drm/vkms/vkms_writeback.h
> +++ b/drivers/gpu/drm/vkms/vkms_writeback.h
> @@ -5,6 +5,7 @@
>  
>  #include "vkms_drv.h"
>  #include "vkms_formats.h"
> +#include "vkms_plane.h"
>  
>  struct vkms_crtc;
>  
> 
