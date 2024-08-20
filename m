Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E72E5958B4A
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 17:29:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A6F610E250;
	Tue, 20 Aug 2024 15:29:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="I632zlGT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1398310E20B
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 15:29:45 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-428e0d18666so45000765e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 08:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724167783; x=1724772583; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vmy5eyWYXSTGXe5JMYP6uHGEABCpvJZivoHkRZ/jgHs=;
 b=I632zlGTM8y1CXQmUsnk6gGbhFZwVinoAlmfdAZDf7GidYGJiPuKMgqgoe6amSA2S0
 8K5Npr7dDvMueVOIKy+iAwXxb3NVtnupCYzASXVA3PIVc5W4FTvuFbO2HUlerw2ZI+tJ
 nd66Dt3uSfbah1E19XhKL+fUr3q4PTPiW+vyNva0UqJllVH4W36xF1rmxCw3doSf3zo0
 bVRVk5ZGbhcD5S04LcIqc0LRntyR7nwHoiIVk9Tg4ZEwBDyuPjEKdzaYqWYPBiRYEkYu
 DdRL8f2YmX6inmDHeL3E/RJJrb/bs0SG3TjgkvgVM7X3V23mQFfODie5DDVPh4xhmUsD
 6JHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724167783; x=1724772583;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vmy5eyWYXSTGXe5JMYP6uHGEABCpvJZivoHkRZ/jgHs=;
 b=mejEZH8QRqU+2Yb1d3TKghnwfiPRy0UOPQyJYj0QvROtvINdS2Hr2exbjczmX7PCGK
 nS0XDFM4vAiXOqoyB3bzr+NehdDzGBw1VUjqdZFjw0Qy1vY1rleA8EcUgk08OWOnAs3/
 iXGGd8UAftgOm+fw8QeX7X8f9bELrD0AbFmFzIaawR9wQaSrHQq7/lBhILcvZZwzRKp4
 GryiS1xivguhlIqTcoodDtYxYiDMcmoOYrVUBOrYwNSS81GishbOyGDwO1jfb0C53JlV
 2jd9HKEFW42xAYIGeONkGFGmNR1hCgPlfSNTN5EUHOdQL8jM9LPKekea/Nz9eTxYLpKk
 C6Qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEFLM3wpRHCwB6roQ/a6b1oTJ/WgJpimTroumJ1/JSnexPpeOA4eqjeEKy8cr/Yg1HbefEs3pVhEvt1HXg72n2C5tMPaiue8MsfmvVtx+R
X-Gm-Message-State: AOJu0YzJ0+HZ1PMgr3GVJxYoH5AAFxodmt8ROAfJ+6X6Es238b+hn3fu
 f9/nZGFSbflT9OrR8AzcTF5kBhcNDpWv1yUzf9qaEqRG1LvdsvgV
X-Google-Smtp-Source: AGHT+IF12vgFxpdR5bG3QLIVQnVILiwKKPCPu/t68ew/cyUTKRxu9tT281vOdA/VbyuuftPk2di4Hg==
X-Received: by 2002:a05:600c:1e0c:b0:426:6765:d6b0 with SMTP id
 5b1f17b1804b1-429ed789bebmr84999765e9.15.1724167782957; 
 Tue, 20 Aug 2024 08:29:42 -0700 (PDT)
Received: from fedora.. ([213.94.26.172]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ded7ead3sm203113735e9.47.2024.08.20.08.29.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 08:29:42 -0700 (PDT)
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
Subject: [PATCH RFC 5/6] drm/vkms: Extract vkms_crtc header
Date: Tue, 20 Aug 2024 17:29:39 +0200
Message-ID: <20240820152940.2881-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240814-google-split-headers-v1-5-51712f088f5d@bootlin.com>
References: <20240814-google-split-headers-v1-5-51712f088f5d@bootlin.com>
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

> The vkms crtc functions are defined in a different .c, so make the same

The VKMS CRTC...

> thing for the function declaration in the headers and create vkms_crtc.h.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Reviewed-by: José Expósito <jose.exposito89@gmail.com>

> ---
>  drivers/gpu/drm/vkms/vkms_composer.c  |  2 +-
>  drivers/gpu/drm/vkms/vkms_crtc.c      |  2 +-
>  drivers/gpu/drm/vkms/vkms_crtc.h      | 87 +++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_drv.c       |  1 +
>  drivers/gpu/drm/vkms/vkms_drv.h       | 45 ------------------
>  drivers/gpu/drm/vkms/vkms_output.c    |  1 +
>  drivers/gpu/drm/vkms/vkms_plane.h     |  1 -
>  drivers/gpu/drm/vkms/vkms_writeback.c |  1 +
>  8 files changed, 92 insertions(+), 48 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index 825011f696ee..139d249454c4 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -11,7 +11,7 @@
>  #include <drm/drm_vblank.h>
>  #include <linux/minmax.h>
>  
> -#include "vkms_drv.h"
> +#include "vkms_crtc.h"
>  #include "vkms_writeback.h"
>  
>  static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> index 08e5db07aca6..cb6e49a86745 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -8,7 +8,7 @@
>  #include <drm/drm_vblank.h>
>  #include <drm/drm_print.h>
>  
> -#include "vkms_drv.h"
> +#include "vkms_crtc.h"
>  #include "vkms_plane.h"
>  
>  static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.h b/drivers/gpu/drm/vkms/vkms_crtc.h
> new file mode 100644
> index 000000000000..9f5ce21f3425
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.h
> @@ -0,0 +1,87 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +
> +#ifndef _VKMS_CRTC_H
> +#define _VKMS_CRTC_H

#ifndef _VKMS_CRTC_H_
#define _VKMS_CRTC_H_

> +#include <drm/drm_writeback.h>
> +#include <drm/drm_crtc.h>
> +#include <linux/workqueue_types.h>
> +
> +#include "vkms_writeback.h"
> +#include "vkms_plane.h"
> +
> +/**
> + * struct vkms_crtc_state - Driver specific CRTC state
> + *
> + * @base: base CRTC state
> + * @composer_work: work struct to compose and add CRC entries
> + *
> + * @num_active_planes: Number of active planes
> + * @active_planes: List containing all the active planes (counted by
> + *  @num_active_planes). They should be stored in z-order.
> + * @active_writeback: Current active writeback job
> + * @gamma_lut: Look up table for gamma used in this CRTC
> + * @crc_pending: Protected by @vkms_output.composer_lock.
> + * @wb_pending: Protected by @vkms_output.composer_lock.
> + * @frame_start: Protected by @vkms_output.composer_lock.
> + * @frame_end: Protected by @vkms_output.composer_lock.
> + */
> +struct vkms_crtc_state {
> +	struct drm_crtc_state base;
> +	struct work_struct composer_work;
> +
> +	int num_active_planes;
> +	struct vkms_plane_state **active_planes;
> +	struct vkms_writeback_job *active_writeback;
> +	struct vkms_color_lut gamma_lut;
> +
> +	bool crc_pending;
> +	bool wb_pending;
> +	u64 frame_start;
> +	u64 frame_end;
> +};
> +
> +/**
> + * struct vkms_crtc - crtc internal representation
> + *
> + * @crtc: Base crtc in drm
> + * @wb_connecter: DRM writeback connector used for this output
> + * @vblank_hrtimer:
> + * @period_ns:
> + * @event:
> + * @composer_workq: Ordered workqueue for composer_work
> + * @lock: Lock used to project concurrent acces to the composer
> + * @composer_enabled: Protected by @lock.
> + * @composer_lock: Lock used internally to protect @composer_state members
> + * @composer_state: Protected by @lock.
> + */
> +struct vkms_crtc {
> +	struct drm_crtc base;
> +
> +	struct drm_writeback_connector wb_connector;
> +	struct hrtimer vblank_hrtimer;
> +	ktime_t period_ns;
> +	struct drm_pending_vblank_event *event;
> +	struct workqueue_struct *composer_workq;
> +	spinlock_t lock;
> +
> +	bool composer_enabled;
> +	struct vkms_crtc_state *composer_state;
> +
> +	spinlock_t composer_lock;
> +};
> +
> +#define to_vkms_crtc_state(target)\
> +	container_of(target, struct vkms_crtc_state, base)
> +
> +/**
> + * vkms_crtc_init() - Initialize a crtc for vkms
> + * @dev: drm_device associated with the vkms buffer
> + * @crtc: uninitialized crtc device
> + * @primary: primary plane to attach to the crtc
> + * @cursor plane to attach to the crtc
> + */
> +int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
> +		   struct drm_plane *primary, struct drm_plane *cursor);
> +
> +#endif //_VKMS_CRTC_H

#endif /* _VKMS_CRTC_H_ */

> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index 5aeb43592960..5907877bdfa0 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -27,6 +27,7 @@
>  #include <drm/drm_vblank.h>
>  
>  #include "vkms_drv.h"
> +#include "vkms_crtc.h"

It might make sense to leave drv.h on top as it is the main file, but if you
are going to stick to alphabetical order:

+#include "vkms_crtc.h"
 #include "vkms_drv.h"

>  #include <drm/drm_print.h>
>  #include <drm/drm_debugfs.h>
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index ea73f01fcc74..943ad55e0172 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -12,8 +12,6 @@
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_writeback.h>
>  
> -#include "vkms_formats.h"
> -
>  #define XRES_MIN    10
>  #define YRES_MIN    10
>  
> @@ -27,37 +25,6 @@
>  
>  #define VKMS_LUT_SIZE 256
>  
> -/**
> - * struct vkms_crtc_state - Driver specific CRTC state
> - *
> - * @base: base CRTC state
> - * @composer_work: work struct to compose and add CRC entries
> - *
> - * @num_active_planes: Number of active planes
> - * @active_planes: List containing all the active planes (counted by
> - *  @num_active_planes). They should be stored in z-order.
> - * @active_writeback: Current active writeback job
> - * @gamma_lut: Look up table for gamma used in this CRTC
> - * @crc_pending: Protected by @vkms_output.composer_lock.
> - * @wb_pending: Protected by @vkms_output.composer_lock.
> - * @frame_start: Protected by @vkms_output.composer_lock.
> - * @frame_end: Protected by @vkms_output.composer_lock.
> - */
> -struct vkms_crtc_state {
> -	struct drm_crtc_state base;
> -	struct work_struct composer_work;
> -
> -	int num_active_planes;
> -	struct vkms_plane_state **active_planes;
> -	struct vkms_writeback_job *active_writeback;
> -	struct vkms_color_lut gamma_lut;
> -
> -	bool crc_pending;
> -	bool wb_pending;
> -	u64 frame_start;
> -	u64 frame_end;
> -};
> -
>  /**
>   * struct vkms_output - Internal representation of all output components in vkms
>   *
> @@ -129,18 +96,6 @@ struct vkms_device {
>  #define drm_device_to_vkms_device(target) \
>  	container_of(target, struct vkms_device, drm)
>  
> -#define to_vkms_crtc_state(target)\
> -	container_of(target, struct vkms_crtc_state, base)
> -
> -/**
> - * vkms_crtc_init() - Initialize a crtc for vkms
> - * @dev: drm_device associated with the vkms buffer
> - * @crtc: uninitialized crtc device
> - * @primary: primary plane to attach to the crtc
> - * @cursor plane to attach to the crtc
> - */
> -int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
> -		   struct drm_plane *primary, struct drm_plane *cursor);
>  /**
>   * vkms_output_init() - Initialize all sub-components needed for a vkms device.
>   *
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index 09fcf242ecf7..20073a00b200 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -6,6 +6,7 @@
>  
>  #include "vkms_writeback.h"
>  #include "vkms_plane.h"
> +#include "vkms_crtc.h"
>  
>  static const struct drm_connector_funcs vkms_connector_funcs = {
>  	.fill_modes = drm_helper_probe_single_connector_modes,
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.h b/drivers/gpu/drm/vkms/vkms_plane.h
> index 68170a75e9c9..90554c9fe250 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.h
> +++ b/drivers/gpu/drm/vkms/vkms_plane.h
> @@ -8,7 +8,6 @@
>  #include <drm/drm_gem_atomic_helper.h>
>  #include <linux/iosys-map.h>
>  
> -#include "vkms_drv.h"
>  #include "vkms_formats.h"
>  
>  struct vkms_plane {
> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
> index 740d9e2f3d71..48f3f7f2e2a4 100644
> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> @@ -13,6 +13,7 @@
>  #include <drm/drm_framebuffer.h>
>  
>  #include "vkms_writeback.h"
> +#include "vkms_crtc.h"
>  #include "vkms_formats.h"
>  
>  static const u32 vkms_wb_formats[] = {
> 
