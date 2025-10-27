Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CD5C0CE91
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 11:16:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC5D10E430;
	Mon, 27 Oct 2025 10:16:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JiWC/eme";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 816E510E430
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 10:16:15 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-427007b1fe5so3779627f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 03:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761560174; x=1762164974; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Y1ycKl+/hhb5itE1+Ltmy7ywAINLYWd1g7hlRkyXI1s=;
 b=JiWC/eme6Z5bdvJ5WKoFUE2dGK5FqrCORj8f3WDBpB1gxIgVpM4TRJONgk/yAI8fDl
 E7v+7+ZCWhLiFTlBWYsgDKZ/0tjD0U8VdqZH2n7EhS136jLubUO3IdhGnRl8KFLUHVUF
 5FUnB51JLP5Ln96gp/gPnc0lgVJTfz5w0a8aXlZGXQiSRary4eVfW8ZfueFDvrp5R8EU
 XpUqJorJ10FAX4McMcL17B95OYLy6ZAr00YT5pdQWBvNowC7MqSnZTvy+cE35Rz6+f3I
 WBXiZYMBaMwaa0YLwSsJSEvfHubTvh5fkrdXifnu924MjgIaDHowBlcJ4ZW3HJyHP6db
 xxPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761560174; x=1762164974;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y1ycKl+/hhb5itE1+Ltmy7ywAINLYWd1g7hlRkyXI1s=;
 b=iaNydZl/nJ8Je4ecDiLsg+7LVobyg1JwZsswKqlcXG72HE2FCgdDYLSoSasocIkTZb
 3dLT7ynLaYKjyLGXKhx/9r3qgaV2LDwvaTEp4PX1QkkiN5NkEfptmUVnlhLBFV1o9JG4
 aQq6ingdld1qL8RXL2EcZT2lEQgEU/ilbq+z45oFsiN9m9VucDeVINNM+cOOcXcIs4iu
 S2YDIwpaLkzpC73DnM50rzsgeOCUeUFzZVWSJxDHUKAif5gHqy4f4bl6eug8eAvrQfSo
 8LNslVz/FDBKckRK2ibKVMQOuhzU6W+7Bkw5K4ugHDQe17/AncaBXdSZblIIofOlStiy
 mIhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8yjXO+WLVO58e0Aq0NO7jR4ioDzh3Ab7PEpUPrB+RqzfZZxms0+ERnNAHQ2E2OD1P+Crv3Qt0C4A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXiiadlcqAU81DV+kNdv7Dz6uqsluLNC6NyxILT/iEHW36wSAB
 qgL5/nTtcCk0jCkXxkaA1V7mAUW6knGBRbypuKvR0jLmVkTh3DvuPXK6
X-Gm-Gg: ASbGncvrPTbpkHJMOhSKjz9oet33QC37mXlN/VCw0t90RbgwH5rEHuuvhLewBYRYkI4
 uaOlAYnuxFgK926lQL6GQPmVmXoS/fgQhSK5Co4T4vFS9uxK9YJIIuFgnqpk1Qvjmii0oU56FI2
 7LWtQHGAfPCTpgOL50OeXIhnK2tsh8iq72n52TPDeSfsSBL/St6Sbbo8Xbp59LJ+dKs2DKBtbqQ
 nIM2l37Bw8HcJ+y6mIqGpFp//ZrEHwXaHNLOyXqLYIjB4a2hWI34TihRvvbh1ERVrtBtlcq6v4P
 6Z9vU75lOsKQ2xCyeW+he9ZC1zQkvyvAiCMIVhT5rpgBORjgTZIJDVQGl5PR2MucB3XHgPbShhm
 n+tafl01gsXAFzrGN5feKz0oPaOlcsfEcOANgF19OV5jylDKTzh15KeYjj2fSc9WV2BQZAiKhT/
 LK89lWuqBn
X-Google-Smtp-Source: AGHT+IE7fN8riSaWaNPQPqcUj2U08wNbGcgk+vXxUy3VGXZu/BsYJXKvAJFY4MF4vDgu2NMVkd5xEw==
X-Received: by 2002:a05:6000:400a:b0:427:492:79e6 with SMTP id
 ffacd0b85a97d-42704d83d9amr24642621f8f.2.1761560173512; 
 Mon, 27 Oct 2025 03:16:13 -0700 (PDT)
Received: from fedora ([94.73.38.14]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952de4a1sm13341611f8f.37.2025.10.27.03.16.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 03:16:13 -0700 (PDT)
Date: Mon, 27 Oct 2025 11:16:11 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 victoria@system76.com, sebastian.wick@redhat.com,
 thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 19/22] drm/vkms: Introduce configfs for connector EDID
Message-ID: <aP9GawE3nY082QJs@fedora>
References: <20251018-vkms-all-config-v1-0-a7760755d92d@bootlin.com>
 <20251018-vkms-all-config-v1-19-a7760755d92d@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018-vkms-all-config-v1-19-a7760755d92d@bootlin.com>
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

On Sat, Oct 18, 2025 at 04:01:19AM +0200, Louis Chauvet wrote:
> Introduce new attributes to configure EDID of a connector:
> - edid_enable - chose if the connector will have an EDD or not
> - edid - raw edid content
> 
> Due to limitation of ConfigFS, the max len of EDID is PAGE_SIZE (4kB on
> x86), it should be sufficient for many tests. One possible evolution is
> using a ConfigFS blob to allow bigger EDID.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---

Hey Louis,

I wasn't able to set the EDID, could you provide an example?

This is what I tried:

# I'm using QEMU's EDID:
$ cat /sys/class/drm/card0-Virtual-1/edid > qemu-edid.bin

# Create a simple device:
$ sudo mkdir /sys/kernel/config/vkms/gpu1 && \
sudo mkdir /sys/kernel/config/vkms/gpu1/planes/plane0  && \
echo "1" | sudo tee /sys/kernel/config/vkms/gpu1/planes/plane0/type && \
sudo mkdir /sys/kernel/config/vkms/gpu1/crtcs/crtc0 && \
echo "0" | sudo tee /sys/kernel/config/vkms/gpu1/crtcs/crtc0/writeback && \
sudo mkdir /sys/kernel/config/vkms/gpu1/encoders/encoder0 && \
sudo mkdir /sys/kernel/config/vkms/gpu1/connectors/connector0 && \
sudo ln -s /sys/kernel/config/vkms/gpu1/crtcs/crtc0 /sys/kernel/config/vkms/gpu1/planes/plane0/possible_crtcs && \
sudo ln -s /sys/kernel/config/vkms/gpu1/crtcs/crtc0 /sys/kernel/config/vkms/gpu1/encoders/encoder0/possible_crtcs && \
sudo ln -s /sys/kernel/config/vkms/gpu1/encoders/encoder0 /sys/kernel/config/vkms/gpu1/connectors/connector0/possible_encoders

$ cat qemu-edid.bin | sudo tee /sys/kernel/config/vkms/gpu1/connectors/connector0/edid

# The EDID is stored and it is correct:
$ cat /sys/kernel/config/vkms/gpu1/connectors/connector0/edid | edid-decode

$ echo "1" | sudo tee /sys/kernel/config/vkms/gpu1/connectors/connector0/edid_enabled
$ echo "1" | sudo tee /sys/kernel/config/vkms/gpu1/enabled

# After enabling the device, the EDID is not present:
$ cat /sys/class/drm/card1-Virtual-2/edid
<empty>

And drm_info does not show the EDID property.

Am I missing something?

>  Documentation/gpu/vkms.rst           |  5 ++-
>  drivers/gpu/drm/vkms/vkms_configfs.c | 81 +++++++++++++++++++++++++++++++++++-
>  2 files changed, 84 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index 650d6f6e79fd..bbd03f61e61c 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -135,7 +135,7 @@ Last but not least, create one or more connectors::
>  
>    sudo mkdir /config/vkms/my-vkms/connectors/connector0
>  
> -Connectors have 3 configurable attribute:
> +Connectors have 5 configurable attribute:
>  
>  - status: Connection status: 1 connected, 2 disconnected, 3 unknown (same values
>    as those exposed by the "status" property of a connector)
> @@ -144,6 +144,9 @@ Connectors have 3 configurable attribute:
>    If supported_colorspaces is not 0, the HDR_OUTPUT_METADATA will also be created.
>    Value is a bitfield, 0x1 = NO_DATA, 0x2 = SMPTE_170M_YCC... see enum drm_colorspace
>    for full list.
> +- edid_enabled: Enable or not EDID for this connector. Some connectors may not have an
> +  EDID but just a list of modes, this attribute allows to disable EDID property.
> +- edid: Content of the EDID. Ignored if edid_enabled is not set
>  
>  
>  To finish the configuration, link the different pipeline items::
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> index 909f4557caec..a977c0842cd6 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -1,5 +1,4 @@
>  // SPDX-License-Identifier: GPL-2.0+
> -#include "asm-generic/errno-base.h"
>  #include <linux/cleanup.h>
>  #include <linux/configfs.h>
>  #include <linux/mutex.h>
> @@ -1222,14 +1221,94 @@ static ssize_t connector_supported_colorspaces_store(struct config_item *item,
>  	return count;
>  }
>  
> +static ssize_t connector_edid_enabled_show(struct config_item *item, char *page)
> +{
> +	struct vkms_configfs_connector *connector;
> +	bool enabled;
> +
> +	connector = connector_item_to_vkms_configfs_connector(item);
> +
> +	scoped_guard(mutex, &connector->dev->lock)
> +		enabled = vkms_config_connector_get_edid_enabled(connector->config);
> +
> +	return sprintf(page, "%d\n", enabled);
> +}
> +
> +static ssize_t connector_edid_enabled_store(struct config_item *item,
> +					    const char *page, size_t count)
> +{
> +	struct vkms_configfs_connector *connector;
> +	struct vkms_config_connector *connector_cfg;
> +	bool enabled;
> +
> +	connector = connector_item_to_vkms_configfs_connector(item);
> +	connector_cfg = connector->config;
> +
> +	if (kstrtobool(page, &enabled))
> +		return -EINVAL;
> +
> +	scoped_guard(mutex, &connector->dev->lock)
> +	{
> +		vkms_config_connector_set_edid_enabled(connector_cfg, enabled);
> +
> +		if (connector->dev->enabled &&
> +		    vkms_config_connector_get_status(connector_cfg) !=
> +		    connector_status_disconnected)
> +			vkms_trigger_connector_hotplug(connector->dev->config->dev);
> +	}
> +	return count;
> +}
> +
> +static ssize_t connector_edid_show(struct config_item *item, char *page)
> +{
> +	struct vkms_configfs_connector *connector;
> +
> +	connector = connector_item_to_vkms_configfs_connector(item);
> +
> +	scoped_guard(mutex, &connector->dev->lock)
> +	{
> +		unsigned int len = 0;
> +		const u8 *edid = vkms_config_connector_get_edid(connector->config, &len);
> +
> +		memcpy(page, edid, min(len, PAGE_SIZE));
> +		return min(len, PAGE_SIZE);
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static ssize_t connector_edid_store(struct config_item *item,
> +				    const char *page, size_t count)
> +{
> +	struct vkms_configfs_connector *connector;
> +
> +	connector = connector_item_to_vkms_configfs_connector(item);
> +
> +	scoped_guard(mutex, &connector->dev->lock)
> +	{
> +		vkms_config_connector_set_edid(connector->config, page, count);
> +
> +		if (connector->dev->enabled &&
> +		    vkms_config_connector_get_status(connector->config) !=
> +		    connector_status_disconnected)
> +			vkms_trigger_connector_hotplug(connector->dev->config->dev);
> +	}
> +
> +	return count;
> +}
> +
>  CONFIGFS_ATTR(connector_, status);
>  CONFIGFS_ATTR(connector_, type);
>  CONFIGFS_ATTR(connector_, supported_colorspaces);
> +CONFIGFS_ATTR(connector_, edid_enabled);
> +CONFIGFS_ATTR(connector_, edid);
>  
>  static struct configfs_attribute *connector_item_attrs[] = {
>  	&connector_attr_status,
>  	&connector_attr_type,
>  	&connector_attr_supported_colorspaces,
> +	&connector_attr_edid_enabled,
> +	&connector_attr_edid,
>  	NULL,
>  };
>  
> 
> -- 
> 2.51.0
> 
