Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77128A20A75
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 13:17:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8F2410E645;
	Tue, 28 Jan 2025 12:17:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vrNjx60I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E7DE10E645
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 12:17:23 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5439b0dd4bfso4465865e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 04:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738066642; x=1738671442; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=l3C1t68q5U19l/Tx1wPuMiuxcRImghGDKLx9/b0oVsk=;
 b=vrNjx60IaLOHgZXXdcyjTjXQkCDVoMmr7Eu1tT6H6TJZIS5ktc/JxgIH2bJoPCKrzC
 jPDPicF0TxFtnHc8YmlGet6DFyNxrrz3BPxb1WPQ09PFInQgdyu7dVN6YyLoFjgGvt3o
 sVWyB5cLxV7ac1vN1FRo5EWz36DvqMf6iziYrRqSwdAo2qYRqZHQE5WhiZE7x8Ho1ZIf
 lFH1ud8ZH7kG/5+ppgOiJqyThUzUjfBkJDioX7H9bgmBRb1xox9WVUvGptCO+SQkqaFU
 UZ4hkSY0nRR0A8hibxex1MjXKtMv9YMwmWI968gk6BVW6x5VFUhIPmEoN8ogKhI9Cjt0
 MHIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738066642; x=1738671442;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l3C1t68q5U19l/Tx1wPuMiuxcRImghGDKLx9/b0oVsk=;
 b=i9ixXcnz7ZRcxlSpVpB/ImRMrQA1PdU6BfcJXvk4im6+DDuGalH3He3C2HKpfkGpb3
 Ha8O6j8PV4R7SGpfv8f9Mm+0I5Ikc/nSiCz+v/mvYLNXmKhvV25alSV4Dh4JK2X+bcYf
 COyHPqpycLwuk9ShFDrDnI9Rya6MXmlpChpynnxelcvx1QxEntfSP/3yZ+vcHwiuisUZ
 E5CUej/GOaPmBTXO/unLRQS66DWmhH6WanxmiL64KPpt4PohDwdqyaTAT1sfJbvwH8/3
 dHMwLMFctgaHTeUlaBbF1FDak5WMuoC7N9FRuA6LEL3DoZ8XjyBcNBnreoI65Kgzv3Nc
 GKRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9GnTOWexnA20M3yvSYYGZSQ7JbleJQ+GQ/HaZMKoqxrZXUgL7sshS/OvZKm/O+tvgPOItPapRmfg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUqxM+zoBUdJAk7B/jLfW/9mt6/levfJS45u4hlI/P0+VrUPhZ
 W8h68MeArCRWyXquO2J10fVM8gJDop4XwXkJjJckTQCwI6TLut0V+uyn9XycGLM=
X-Gm-Gg: ASbGncvpBrgOpReqdUfvGM4Mkf1zCHyVQT3su/JstcsSI7ugQfJnhveNqO4nLqLh3bQ
 p/274JvOMedP55KklYUvbYLme9AQvYFVG3f3Zl+kprOMyRIus577Mcawchlwg9Xcw1GRSYFXLJ/
 KjOr4SzgZ+RtIm9dgyUZW6wX08qpMe5TtDzosCQkWiiXQbpoKK/7saztvuXn6zIZ32RDjzmQ8sS
 0CNuOIJONQzs2YmaoykNNHf+eB6UtO2eTbJRFNERCG54j06VDslY+vywsxWAIRJETaWVr5Z3c7p
 b0ZZKvIca00/y5QEp4bV3Sfi1sHsfgkevs15Z9r8XsJ3hbScLJfnvKLRZoiaGgNrHAwdqqU=
X-Google-Smtp-Source: AGHT+IHQIp+o+nAGYRV34OGyAlelb9r3UuwrqoDHiKgu+d/6AF+ouT/bnJAA6edWoyMnaPvE1iaR1Q==
X-Received: by 2002:ac2:59c1:0:b0:540:1b07:e033 with SMTP id
 2adb3069b0e04-5439c287e69mr13823068e87.45.1738066641613; 
 Tue, 28 Jan 2025 04:17:21 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543c82293e8sm1604403e87.29.2025.01.28.04.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 04:17:21 -0800 (PST)
Date: Tue, 28 Jan 2025 14:17:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 02/10] drm/display: add CEC helpers code
Message-ID: <lme4jqksg7djyrxwpo3x363vlsyhld22co3tfsthniistnrm5h@kbygscfa7afr>
References: <20250126-drm-hdmi-connector-cec-v3-0-5b5b2d4956da@linaro.org>
 <20250126-drm-hdmi-connector-cec-v3-2-5b5b2d4956da@linaro.org>
 <ylahtg54vvrpg5rzp3z5oyi37mtblj3hn4pzwylcimfakrzy3m@idqczwb3hvxl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ylahtg54vvrpg5rzp3z5oyi37mtblj3hn4pzwylcimfakrzy3m@idqczwb3hvxl>
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

On Tue, Jan 28, 2025 at 11:36:06AM +0100, Maxime Ripard wrote:
> On Sun, Jan 26, 2025 at 03:29:07PM +0200, Dmitry Baryshkov wrote:
> > Add generic CEC helpers to be used by HDMI drivers. Both notifier and
> > and adapter are supported for registration. Once registered, the driver
> > can call common set of functions to update physical address, to
> > invalidate it or to unregister CEC data.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/display/Kconfig               |   5 +
> >  drivers/gpu/drm/display/Makefile              |   2 +
> >  drivers/gpu/drm/display/drm_hdmi_cec_helper.c | 209 ++++++++++++++++++++++++++
> >  include/drm/display/drm_hdmi_cec_helper.h     |  61 ++++++++
> >  4 files changed, 277 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
> > index 8d22b7627d41f7bc015decf24ae02a05bc00f055..49da9b768acf3e5f84f2cefae4bb042cfd57a50c 100644
> > --- a/drivers/gpu/drm/display/Kconfig
> > +++ b/drivers/gpu/drm/display/Kconfig
> > @@ -82,6 +82,11 @@ config DRM_DISPLAY_HDMI_AUDIO_HELPER
> >  	  DRM display helpers for HDMI Audio functionality (generic HDMI Codec
> >  	  implementation).
> >  
> > +config DRM_DISPLAY_HDMI_CEC_HELPER
> > +	bool
> > +	help
> > +	  DRM display helpers for HDMI CEC implementation.
> > +
> >  config DRM_DISPLAY_HDMI_HELPER
> >  	bool
> >  	help
> > diff --git a/drivers/gpu/drm/display/Makefile b/drivers/gpu/drm/display/Makefile
> > index b17879b957d5401721396e247fa346387cf6c48a..2cd078e2b81c1a9e6b336c4187b444bcb8a50e51 100644
> > --- a/drivers/gpu/drm/display/Makefile
> > +++ b/drivers/gpu/drm/display/Makefile
> > @@ -16,6 +16,8 @@ drm_display_helper-$(CONFIG_DRM_DISPLAY_DSC_HELPER) += \
> >  drm_display_helper-$(CONFIG_DRM_DISPLAY_HDCP_HELPER) += drm_hdcp_helper.o
> >  drm_display_helper-$(CONFIG_DRM_DISPLAY_HDMI_AUDIO_HELPER) += \
> >  	drm_hdmi_audio_helper.o
> > +drm_display_helper-$(CONFIG_DRM_DISPLAY_HDMI_CEC_HELPER) += \
> > +	drm_hdmi_cec_helper.o
> >  drm_display_helper-$(CONFIG_DRM_DISPLAY_HDMI_HELPER) += \
> >  	drm_hdmi_helper.o \
> >  	drm_scdc_helper.o
> > diff --git a/drivers/gpu/drm/display/drm_hdmi_cec_helper.c b/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..a6ed5f0fc3835b013a83308f5285ea0819c5702c
> > --- /dev/null
> > +++ b/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
> > @@ -0,0 +1,209 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright (c) 2024 Linaro Ltd
> > + */
> > +
> > +#include <drm/drm_bridge.h>
> > +#include <drm/drm_connector.h>
> > +#include <drm/display/drm_hdmi_cec_helper.h>
> > +
> > +#include <linux/mutex.h>
> > +
> > +#include <media/cec.h>
> > +#include <media/cec-notifier.h>
> > +
> > +void drm_connector_hdmi_cec_unregister(struct drm_connector *connector)
> > +{
> > +	cec_unregister_adapter(connector->cec.adapter);
> > +	connector->cec.adapter = NULL;
> > +
> > +	cec_notifier_conn_unregister(connector->cec.notifier);
> > +	connector->cec.notifier = NULL;
> > +
> > +	connector->cec.funcs = NULL;
> > +}
> > +EXPORT_SYMBOL(drm_connector_hdmi_cec_unregister);
> > +
> > +static const struct drm_connector_cec_funcs drm_connector_hdmi_cec_funcs = {
> > +	.unregister = drm_connector_hdmi_cec_unregister,
> > +};
> > +
> > +int drm_connector_hdmi_cec_notifier_register(struct drm_connector *connector,
> > +					     const char *port_name,
> > +					     struct device *dev)
> > +{
> > +	struct cec_connector_info conn_info;
> > +	struct cec_notifier *notifier;
> > +	int ret;
> > +
> > +	mutex_lock(&connector->cec.mutex);
> > +
> > +	if (connector->cec.funcs) {
> > +		ret = -EBUSY;
> > +		goto err_unlock;
> > +	}
> > +
> > +	cec_fill_conn_info_from_drm(&conn_info, connector);
> > +
> > +	notifier = cec_notifier_conn_register(dev, port_name, &conn_info);
> > +	if (!notifier) {
> > +		ret = -ENOMEM;
> > +		goto err_unlock;
> > +	}
> > +
> > +	connector->cec.notifier = notifier;
> > +	connector->cec.funcs = &drm_connector_hdmi_cec_funcs;
> > +
> > +	mutex_unlock(&connector->cec.mutex);
> > +
> > +	return 0;
> > +
> > +err_unlock:
> > +	mutex_unlock(&connector->cec.mutex);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL(drm_connector_hdmi_cec_notifier_register);
> > +
> > +#define to_hdmi_cec_adapter_ops(ops) \
> > +	container_of(ops, struct drm_connector_hdmi_cec_adapter_ops, base)
> > +
> > +static int drm_connector_hdmi_cec_adap_enable(struct cec_adapter *adap, bool enable)
> > +{
> > +	struct drm_connector *connector = cec_get_drvdata(adap);
> > +	struct drm_connector_hdmi_cec_adapter_ops *ops =
> > +		to_hdmi_cec_adapter_ops(connector->cec.funcs);
> > +
> > +	return ops->enable(connector, enable);
> > +}
> > +
> > +static int drm_connector_hdmi_cec_adap_log_addr(struct cec_adapter *adap, u8 logical_addr)
> > +{
> > +	struct drm_connector *connector = cec_get_drvdata(adap);
> > +	struct drm_connector_hdmi_cec_adapter_ops *ops =
> > +		to_hdmi_cec_adapter_ops(connector->cec.funcs);
> > +
> > +	return ops->log_addr(connector, logical_addr);
> > +}
> > +
> > +static int drm_connector_hdmi_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
> > +						u32 signal_free_time, struct cec_msg *msg)
> > +{
> > +	struct drm_connector *connector = cec_get_drvdata(adap);
> > +	struct drm_connector_hdmi_cec_adapter_ops *ops =
> > +		to_hdmi_cec_adapter_ops(connector->cec.funcs);
> > +
> > +	return ops->transmit(connector, attempts, signal_free_time, msg);
> > +}
> > +
> > +static const struct cec_adap_ops drm_connector_hdmi_cec_adap_ops = {
> > +	.adap_enable = drm_connector_hdmi_cec_adap_enable,
> > +	.adap_log_addr = drm_connector_hdmi_cec_adap_log_addr,
> > +	.adap_transmit = drm_connector_hdmi_cec_adap_transmit,
> > +};
> > +
> > +int drm_connector_hdmi_cec_register(struct drm_connector *connector,
> > +				    const struct drm_connector_hdmi_cec_adapter_ops *ops,
> > +				    const char *name,
> > +				    u8 available_las,
> > +				    struct device *dev)
> > +{
> > +	struct cec_connector_info conn_info;
> > +	struct cec_adapter *cec_adap;
> > +	int ret;
> > +
> > +	if (!ops->base.unregister ||
> > +	    !ops->init || !ops->enable || !ops->log_addr || !ops->transmit)
> > +		return -EINVAL;
> > +
> > +	mutex_lock(&connector->cec.mutex);
> > +
> > +	if (connector->cec.funcs) {
> > +		ret = -EBUSY;
> > +		goto err_unlock;
> > +	}
> > +
> > +	cec_adap = cec_allocate_adapter(&drm_connector_hdmi_cec_adap_ops, connector, name,
> > +					CEC_CAP_DEFAULTS | CEC_CAP_CONNECTOR_INFO,
> > +					available_las ? : CEC_MAX_LOG_ADDRS);
> > +	ret = PTR_ERR_OR_ZERO(cec_adap);
> > +	if (ret < 0)
> > +		goto err_unlock;
> > +
> > +	cec_fill_conn_info_from_drm(&conn_info, connector);
> > +	cec_s_conn_info(cec_adap, &conn_info);
> > +
> > +	connector->cec.adapter = cec_adap;
> > +	connector->cec.funcs = &ops->base;
> > +
> > +	ret = ops->init(connector);
> > +	if (ret < 0)
> > +		goto err_delete_adapter;
> > +
> > +	ret = cec_register_adapter(cec_adap, dev);
> > +	if (ret < 0)
> > +		goto err_delete_adapter;
> > +
> > +	mutex_unlock(&connector->cec.mutex);
> > +
> > +	return 0;
> > +
> > +err_delete_adapter:
> > +	cec_delete_adapter(cec_adap);
> > +
> > +	connector->cec.adapter = NULL;
> > +
> > +err_unlock:
> > +	mutex_unlock(&connector->cec.mutex);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL(drm_connector_hdmi_cec_register);
> > +
> > +void drm_connector_hdmi_cec_received_msg(struct drm_connector *connector,
> > +					 struct cec_msg *msg)
> > +{
> > +	cec_received_msg(connector->cec.adapter, msg);
> > +}
> > +EXPORT_SYMBOL(drm_connector_hdmi_cec_received_msg);
> > +
> > +void drm_connector_hdmi_cec_transmit_attempt_done(struct drm_connector *connector,
> > +						  u8 status)
> > +{
> > +	cec_transmit_attempt_done(connector->cec.adapter, status);
> > +}
> > +EXPORT_SYMBOL(drm_connector_hdmi_cec_transmit_attempt_done);
> > +
> > +void drm_connector_hdmi_cec_transmit_done(struct drm_connector *connector,
> > +					  u8 status,
> > +					  u8 arb_lost_cnt, u8 nack_cnt,
> > +					  u8 low_drive_cnt, u8 error_cnt)
> > +{
> > +	cec_transmit_done(connector->cec.adapter, status,
> > +			  arb_lost_cnt, nack_cnt, low_drive_cnt, error_cnt);
> > +}
> > +EXPORT_SYMBOL(drm_connector_hdmi_cec_transmit_done);
> > +
> > +void drm_connector_hdmi_cec_phys_addr_invalidate(struct drm_connector *connector)
> > +{
> > +	mutex_lock(&connector->cec.mutex);
> > +
> > +	cec_phys_addr_invalidate(connector->cec.adapter);
> > +	cec_notifier_phys_addr_invalidate(connector->cec.notifier);
> > +
> > +	mutex_unlock(&connector->cec.mutex);
> > +}
> > +EXPORT_SYMBOL(drm_connector_hdmi_cec_phys_addr_invalidate);
> > +
> > +void drm_connector_hdmi_cec_phys_addr_set(struct drm_connector *connector)
> > +{
> > +	mutex_lock(&connector->cec.mutex);
> > +
> > +	cec_s_phys_addr(connector->cec.adapter,
> > +			connector->display_info.source_physical_address, false);
> > +	cec_notifier_set_phys_addr(connector->cec.notifier,
> > +				   connector->display_info.source_physical_address);
> > +
> > +	mutex_unlock(&connector->cec.mutex);
> > +}
> > +EXPORT_SYMBOL(drm_connector_hdmi_cec_phys_addr_set);
> > diff --git a/include/drm/display/drm_hdmi_cec_helper.h b/include/drm/display/drm_hdmi_cec_helper.h
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..cd6274e4ee9b3e41a2d85289c4a420b854340e19
> > --- /dev/null
> > +++ b/include/drm/display/drm_hdmi_cec_helper.h
> > @@ -0,0 +1,61 @@
> > +/* SPDX-License-Identifier: MIT */
> > +
> > +#ifndef DRM_DISPLAY_HDMI_CEC_HELPER
> > +#define DRM_DISPLAY_HDMI_CEC_HELPER
> > +
> > +#include <drm/drm_connector.h>
> > +
> > +#include <linux/types.h>
> > +
> > +struct drm_connector;
> > +
> > +struct cec_msg;
> > +struct device;
> > +
> > +struct drm_connector_hdmi_cec_adapter_ops {
> > +	struct drm_connector_cec_funcs base;
> > +
> > +	int (*init)(struct drm_connector *connector);
> > +	void (*uninit)(struct drm_connector *connector);
> > +
> > +	int (*enable)(struct drm_connector *connector, bool enable);
> > +	int (*log_addr)(struct drm_connector *connector, u8 logical_addr);
> > +	int (*transmit)(struct drm_connector *connector, u8 attempts,
> > +			u32 signal_free_time, struct cec_msg *msg);
> > +};
> 
> Why can't we merge drm_connector_cec_funcs and
> drm_connector_cec_adapter_ops? They look equivalent to me?

Well, not exactly. The funcs is a generic interface. Notifiers do not
need the adapter_ops. And cec_pin (sun4i) would also require a different
set of callbacks. Thus I decided that it's easier to subclass funcs
instead of adding all possible callbacks there.

> 
> We should also document those hooks.


Ack, I forgot to add docs here.

> 
> Aside from the mutex discussion, the rest of the patch looks good to me.
> 
> Maxime



-- 
With best wishes
Dmitry
