Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 032DF96D8A0
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 14:33:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F4F10E11C;
	Thu,  5 Sep 2024 12:33:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kUpcFPaR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2241210E11C
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 12:33:41 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-42c5347b2f7so6039565e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2024 05:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725539619; x=1726144419; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=94GbVFnsicioIdyF3xHn7JXRu2g3C+MwaoqJeRd73vg=;
 b=kUpcFPaRnKeFUSJHMLSyyJSqmQksMssSk+P8bzANV48+85XBpnGHCKp6y7LlHCA+0h
 I047BIEw78sIUxhq+sWR/AbXMLUcqeYy99GGqVQ4MlU9VJURD4j+u6/stf12O//lQR+h
 bxWpzzHmEdydnSsLRaDbb1fHlym8KL3bTqNezD+92ReSNF+g3f192ElZ02L7peOspaC9
 UcWyvvUChBw9BdS6WKpKhyjPDoNeIrJLpEPjTuI7g6XS3tZJmpfJ7bVwdg34n8Uwcow7
 ge8ICfbhTNvZS0FlAznFr+5Bpe2DY4daIwCEucuepbKElwvpBY5/mZpOz0+HWVtM2WVr
 ExSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725539619; x=1726144419;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=94GbVFnsicioIdyF3xHn7JXRu2g3C+MwaoqJeRd73vg=;
 b=gnLWaaFu5IM+ogm3JqUjqkr3/sIxBSYgT7iMlhyRceHRMEfdARof6TbUnWs9fbtsUy
 QuxSTgjfopi8r3VHrq6gjPLahPLrcQc80Dty1PiVXmpLC4GsmRvy7+wK/lB8ZfAZBTv3
 zF3eDeRBYCzMxe8Dzf6XbIsV1lbxDcLkaQXE8Pkl4QJt+327Z2ZboSBZvXYhh5pwl3/R
 Juq9iKtucz83CgjMHDVmNoFCCHi+k/dc/0w4vpLqY+qfsujhaTT1YH7BmMUQiHKz1eqE
 Qc12TtwcbahKw+02URbZPAmoZCfCX6S9nxFoMfC8S+4fbKkTEuGv1veHCdOU0ctXWa0x
 C3kA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVJaFMryRchij7fYlJQoypHZkqb1hEfeapvfB5VHhUdDHZieGKIVnR0Cq97BewzwMrcw1xK5WLZLU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7Iy5e1lKg402BkXbqS/NcncpRRuWkvb1/faJtlPSZojY3WrFe
 c0ktJJesyzOG/0PGI+iCal8TIaZye9/tbXQZJ0GOOIdVosxrYzjD
X-Google-Smtp-Source: AGHT+IGOJib7VqLZnZxrvUPVjTeAxyAAiwaW7QM0nUABaG4TCuPov69LrUP3Bp8P8DmkUM+Su7TsEQ==
X-Received: by 2002:a05:600c:310b:b0:426:627d:5542 with SMTP id
 5b1f17b1804b1-42bb01e6c05mr173939965e9.28.1725539619461; 
 Thu, 05 Sep 2024 05:33:39 -0700 (PDT)
Received: from fedora.. ([213.94.26.172]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374c23d6a38sm13542443f8f.38.2024.09.05.05.33.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 05:33:39 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: airlied@gmail.com, arthurgrillo@riseup.net, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
 jeremie.dautheribes@bootlin.com, jose.exposito89@gmail.com,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mairacanal@riseup.net, melissa.srw@gmail.com, miquel.raynal@bootlin.com,
 mripard@kernel.org, nicolejadeyee@google.com,
 rodrigosiqueiramelo@gmail.com, seanpaul@google.com,
 thomas.petazzoni@bootlin.com, tzimmermann@suse.de
Subject: [PATCH RFC 03/15] drm/vkms: Extract vkms_config header
Date: Thu,  5 Sep 2024 14:33:36 +0200
Message-ID: <20240905123338.3061-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240814-google-remove-crtc-index-from-parameter-v1-3-6e179abf9fd4@bootlin.com>
References: <20240814-google-remove-crtc-index-from-parameter-v1-3-6e179abf9fd4@bootlin.com>
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

> Creating a new vkms_config structure will be more complex once we
> start adding more options.
> 
> Extract the vkms_config structure to its own header and source files
> and add functions to create and delete a vkms_config and to initialize
> debugfs.
> 
> Refactor, no functional changes.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> [Changes: Cherry picked and conflict solve]
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> ---
>  drivers/gpu/drm/vkms/Makefile      |  3 ++-
>  drivers/gpu/drm/vkms/vkms_config.c | 45 ++++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_config.h | 32 +++++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_drv.c    | 41 ++++++++++------------------------
>  drivers/gpu/drm/vkms/vkms_drv.h    | 15 +------------
>  5 files changed, 91 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Makefile
> index 8d3e46dde635..2b6db5870b97 100644
> --- a/drivers/gpu/drm/vkms/Makefile
> +++ b/drivers/gpu/drm/vkms/Makefile
> @@ -6,7 +6,8 @@ vkms-y := \
>  	vkms_formats.o \
>  	vkms_crtc.o \
>  	vkms_composer.o \
> -	vkms_writeback.o
> +	vkms_writeback.o \
> +	vkms_config.o
>  
>  obj-$(CONFIG_DRM_VKMS) += vkms.o
>  obj-$(CONFIG_DRM_VKMS_KUNIT_TESTS) += tests/
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> new file mode 100644
> index 000000000000..ad5d814e6e83
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -0,0 +1,45 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +#include <drm/drm_debugfs.h>
> +
> +#include "vkms_config.h"
> +#include "vkms_drv.h"

I believe there are some missing includes. In the patch of my
configfs series equivalent to this one I have:


#include <linux/slab.h>

#include <drm/drm_print.h>
#include <drm/drm_debugfs.h>

#include "vkms_config.h"
#include "vkms_drv.h"

> +
> +struct vkms_config *vkms_config_create(void)
> +{
> +	struct vkms_config *config;
> +
> +	config = kzalloc(sizeof(*config), GFP_KERNEL);
> +	if (!config)
> +		return ERR_PTR(-ENOMEM);
> +
> +	return config;
> +}
> +
> +void vkms_config_destroy(struct vkms_config *config)
> +{
> +	kfree(config);
> +}
> +
> +static int vkms_config_show(struct seq_file *m, void *data)
> +{
> +	struct drm_debugfs_entry *entry = m->private;
> +	struct drm_device *dev = entry->dev;
> +	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
> +
> +	seq_printf(m, "writeback=%d\n", vkmsdev->config->writeback);
> +	seq_printf(m, "cursor=%d\n", vkmsdev->config->cursor);
> +	seq_printf(m, "overlay=%d\n", vkmsdev->config->overlay);
> +
> +	return 0;
> +}
> +
> +static const struct drm_debugfs_info vkms_config_debugfs_list[] = {
> +	{ "vkms_config", vkms_config_show, 0 },
> +};
> +
> +void vkms_config_register_debugfs(struct vkms_device *vkms_device)
> +{
> +	drm_debugfs_add_files(&vkms_device->drm, vkms_config_debugfs_list,
> +			      ARRAY_SIZE(vkms_config_debugfs_list));
> +}
> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> new file mode 100644
> index 000000000000..b28483173874
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +
> +#ifndef _VKMS_CONFIG_H
> +#define _VKMS_CONFIG_H

#ifndef _VKMS_CONFIG_H_
#define _VKMS_CONFIG_H_

> +
> +#include <linux/types.h>
> +#include "vkms_drv.h"

You can avoid this import by forward declaring "vkms_device":

struct vkms_device;

> +
> +/**
> + * struct vkms_config - General configuration for VKMS driver
> + *
> + * @writeback: If true, a writeback buffer can be attached to the CRTC
> + * @cursor: If true, a cursor plane is created in the VKMS device
> + * @overlay: If true, NUM_OVERLAY_PLANES will be created for the VKMS device
> + * @dev: Used to store the current vkms device. Only set when the device is instancied.
> + */
> +struct vkms_config {
> +	bool writeback;
> +	bool cursor;
> +	bool overlay;
> +	struct vkms_device *dev;
> +};
> +
> +/**
> + * vkms_config_register_debugfs() - Register the debugfs file to display current configuration
> + */
> +void vkms_config_register_debugfs(struct vkms_device *vkms_device);
> +
> +struct vkms_config *vkms_config_create(void);
> +void vkms_config_destroy(struct vkms_config *config);
> +
> +#endif //_VKMS_CONFIG_H

#endif /* _VKMS_CONFIG_H_ */

> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index e71b45fcb9b8..dbdb1f565a8f 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -28,6 +28,7 @@
>  
>  #include "vkms_drv.h"
>  #include "vkms_crtc.h"
> +#include "vkms_config.h"
>  
>  #include <drm/drm_print.h>
>  #include <drm/drm_debugfs.h>

And here you can drop:

#include <drm/drm_print.h>
#include <drm/drm_debugfs.h>

> @@ -85,22 +86,6 @@ static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
>  	drm_atomic_helper_cleanup_planes(dev, old_state);
>  }
>  
> -static int vkms_config_show(struct seq_file *m, void *data)
> -{
> -	struct drm_debugfs_entry *entry = m->private;
> -	struct drm_device *dev = entry->dev;
> -	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
> -
> -	seq_printf(m, "writeback=%d\n", vkmsdev->config->writeback);
> -	seq_printf(m, "cursor=%d\n", vkmsdev->config->cursor);
> -	seq_printf(m, "overlay=%d\n", vkmsdev->config->overlay);
> -
> -	return 0;
> -}
> -
> -static const struct drm_debugfs_info vkms_config_debugfs_list[] = {
> -	{ "vkms_config", vkms_config_show, 0 },
> -};
>  
>  static const struct drm_driver vkms_driver = {
>  	.driver_features	= DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM,
> @@ -325,8 +310,7 @@ static int vkms_create(struct vkms_config *config)
>  	if (ret)
>  		goto out_unregister;
>  
> -	drm_debugfs_add_files(&vkms_device->drm, vkms_config_debugfs_list,
> -			      ARRAY_SIZE(vkms_config_debugfs_list));
> +	vkms_config_register_debugfs(vkms_device);
>  
>  	ret = drm_dev_register(&vkms_device->drm, 0);
>  	if (ret)
> @@ -344,21 +328,18 @@ static int vkms_create(struct vkms_config *config)
>  static int __init vkms_init(void)
>  {
>  	int ret;
> -	struct vkms_config *config;
> -
> -	config = kmalloc(sizeof(*config), GFP_KERNEL);
> -	if (!config)
> -		return -ENOMEM;
>  
> -	default_config = config;
> +	default_config = vkms_config_create();
> +	if (IS_ERR(default_config))
> +		return PTR_ERR(default_config);
>  
> -	config->cursor = enable_cursor;
> -	config->writeback = enable_writeback;
> -	config->overlay = enable_overlay;
> +	default_config->cursor = enable_cursor;
> +	default_config->writeback = enable_writeback;
> +	default_config->overlay = enable_overlay;
>  
> -	ret = vkms_create(config);
> +	ret = vkms_create(default_config);
>  	if (ret)
> -		kfree(config);
> +		vkms_config_destroy(default_config);
>  
>  	return ret;
>  }
> @@ -386,7 +367,7 @@ static void __exit vkms_exit(void)
>  	if (default_config->dev)
>  		vkms_destroy(default_config);
>  
> -	kfree(default_config);
> +	vkms_config_destroy(default_config);
>  }
>  
>  module_init(vkms_init);
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 08d0ef106e37..64574695f655 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -25,20 +25,7 @@
>  
>  #define VKMS_LUT_SIZE 256
>  
> -/**
> - * struct vkms_config - General configuration for VKMS driver
> - *
> - * @writeback: If true, a writeback buffer can be attached to the CRTC
> - * @cursor: If true, a cursor plane is created in the VKMS device
> - * @overlay: If true, NUM_OVERLAY_PLANES will be created for the VKMS device
> - * @dev: Used to store the current vkms device. Only set when the device is instancied.
> - */
> -struct vkms_config {
> -	bool writeback;
> -	bool cursor;
> -	bool overlay;
> -	struct vkms_device *dev;
> -};
> +struct vkms_config;
>  
>  /**
>   * struct vkms_device - Description of a vkms device
> 
