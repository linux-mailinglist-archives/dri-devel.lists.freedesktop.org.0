Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99511A1211C
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 11:53:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B26F10E050;
	Wed, 15 Jan 2025 10:53:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pFzr+MBj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4097E10E050
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 10:53:22 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5401be44b58so6608123e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 02:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736938341; x=1737543141; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Pe/eBfFEXTtaUJSGQddUyoy4TU9vZhAttfqc4jZ26Q0=;
 b=pFzr+MBj6GXLDc6XZyjhRR3lK6sQ+Tqd5H+uoeWEHLHiUN1qZAAHfEbYCN7fQr34/Q
 UCYEjVvJxpa2hIPbulNmQZWl+mxMr9Bv8pQUYI2c165BX5ymG+Z6ggGWqYgY/zCKQsMk
 SO+Yed7/1kKSiMx9ad4vumsDXJxItmPcz4LoDPLe3/z6TO1+/qDWQF41Wn03QGJDv1Pu
 mvCLaA8ydQBbNCMOokaYuQfdWi0VRg2crVwRcLJeiLA5KOIJHRe0+p3X8H2i6fLxCOKw
 qQeXQaCX5YJStMx2ojalZ/E/NM3d1FWt2qIHurhlwRb/3zLq4IzCopaBicGqm1nfwD0R
 y3Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736938341; x=1737543141;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pe/eBfFEXTtaUJSGQddUyoy4TU9vZhAttfqc4jZ26Q0=;
 b=vWe0F02iyXJRQnZy7eZMTfH39uiw6qlmaG444H56aFcaJ07ZRA2dSIou/YAYT3YtEI
 BWkxOe9I/zev12AMtSuZ5dDc6/3K4jFmUhnFXSWt8mBGgWi8N2FVHPpsosINr7Sbiozx
 KE7NfWQiUWco0AeFHIA3Emr7c6y0jPpgiG1cyvwVsT5NOYLZof7EYxfBASzM6m4I9ABX
 xoI3FxQyRMdUPfDUuvE+k+m861KTSZI3CwKp+m06o99zLDVvCFp2t+ny9C489u8BYA2p
 EqdM1VyuEgBSYznzNh4OJ7rWagu75lks18pzmrxw7eyqLHp8588+d2kcMTk6WMcv9PcO
 Frqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZL8dGisijzjfdIgAFX+s861bObRf4zGqJvKSM4E28eWBt5T2lATmQ4Hs3ObmOa0ILB5ToR1A1WKk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJ6rzQEZM3sKFvSq0E1+0dUC9I9b8Ql+IcmmbMzjWt5lk37YHk
 Ad3x6TjPbBens+cYvmmiWGZWVQyxvh/75i00n8i5ttlU25FjxcVt2VRaYb8993o=
X-Gm-Gg: ASbGnctA3KZGRTJyIMl6wUf24+lUEpd+y3JJBYxfn6u7/mr1HX2QBP2QE6a4gl84zgo
 ZJOQJmqDTikvPd5I8X/u5nyNJw7DKMj3M/wTs9m1S8V8sW1DqspBmkYWWpvR16bYVBtGsqu/TG7
 KFmfdqZi4HEF1llwZsbYKz+V3OLrFHZZSVeNPZViRT4maWp8kQDxlIBYY8wWDqI8z+yBEYoxZfP
 xQkfo02LsoKUtza0TenHS18/S2+DvrQakZIj9DV5uAVAMp6wyHl1i4gCwrDfSDWbUmewSwSWE6w
 iUDgm+MdIB+7GiLabwgMVGhY2K2k/QBXZnK+
X-Google-Smtp-Source: AGHT+IHeKdiQSnCENW2p/w1cSkoj9QJFoIKOkLbHmvFxXqBqc894Ujkrox/BKO+Ug0RQedpSMn3Lyg==
X-Received: by 2002:a05:6512:158f:b0:542:28a9:dcbf with SMTP id
 2adb3069b0e04-542845bac70mr8509007e87.23.1736938340583; 
 Wed, 15 Jan 2025 02:52:20 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542988bc730sm1278012e87.252.2025.01.15.02.52.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 02:52:20 -0800 (PST)
Date: Wed, 15 Jan 2025 12:52:17 +0200
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
Subject: Re: [PATCH RFC/RFT 2/9] drm/display: add CEC helpers code
Message-ID: <mdabdkkdofrwbgs3rxk4iez2yxk4u6hdaxbxyqvi6quxdlm3kx@yc63rpibgwpt>
References: <20241225-drm-hdmi-connector-cec-v1-0-b80380c67221@linaro.org>
 <20241225-drm-hdmi-connector-cec-v1-2-b80380c67221@linaro.org>
 <20250107-psychedelic-earthworm-of-action-cf5ceb@houat>
 <CAA8EJppxnVuVL9LH1Ars0=SKBM1L05Z5KwA_z1_+=dBugfrL-g@mail.gmail.com>
 <20250114-wandering-curly-manul-67ced4@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250114-wandering-curly-manul-67ced4@houat>
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

On Tue, Jan 14, 2025 at 04:45:09PM +0100, Maxime Ripard wrote:
> On Tue, Jan 07, 2025 at 06:18:07PM +0200, Dmitry Baryshkov wrote:
> > On Tue, 7 Jan 2025 at 16:32, Maxime Ripard <mripard@kernel.org> wrote:
> > >
> > > On Wed, Dec 25, 2024 at 01:10:10AM +0200, Dmitry Baryshkov wrote:
> > > > Add generic CEC helpers to be used by HDMI drivers. Both notifier and
> > > > and adapter are supported for registration. Once registered, the driver
> > > > can call common set of functions to update physical address, to
> > > > invalidate it or to unregister CEC data.
> > > >
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > >  drivers/gpu/drm/display/Kconfig               |   5 +
> > > >  drivers/gpu/drm/display/Makefile              |   2 +
> > > >  drivers/gpu/drm/display/drm_hdmi_cec_helper.c | 145 ++++++++++++++++++++++++++
> > > >  include/drm/display/drm_hdmi_cec_helper.h     |  38 +++++++
> > > >  4 files changed, 190 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
> > > > index 8d22b7627d41f7bc015decf24ae02a05bc00f055..49da9b768acf3e5f84f2cefae4bb042cfd57a50c 100644
> > > > --- a/drivers/gpu/drm/display/Kconfig
> > > > +++ b/drivers/gpu/drm/display/Kconfig
> > > > @@ -82,6 +82,11 @@ config DRM_DISPLAY_HDMI_AUDIO_HELPER
> > > >         DRM display helpers for HDMI Audio functionality (generic HDMI Codec
> > > >         implementation).
> > > >
> > > > +config DRM_DISPLAY_HDMI_CEC_HELPER
> > > > +     bool
> > > > +     help
> > > > +       DRM display helpers for HDMI CEC implementation.
> > > > +
> > > >  config DRM_DISPLAY_HDMI_HELPER
> > > >       bool
> > > >       help
> > > > diff --git a/drivers/gpu/drm/display/Makefile b/drivers/gpu/drm/display/Makefile
> > > > index b17879b957d5401721396e247fa346387cf6c48a..2cd078e2b81c1a9e6b336c4187b444bcb8a50e51 100644
> > > > --- a/drivers/gpu/drm/display/Makefile
> > > > +++ b/drivers/gpu/drm/display/Makefile
> > > > @@ -16,6 +16,8 @@ drm_display_helper-$(CONFIG_DRM_DISPLAY_DSC_HELPER) += \
> > > >  drm_display_helper-$(CONFIG_DRM_DISPLAY_HDCP_HELPER) += drm_hdcp_helper.o
> > > >  drm_display_helper-$(CONFIG_DRM_DISPLAY_HDMI_AUDIO_HELPER) += \
> > > >       drm_hdmi_audio_helper.o
> > > > +drm_display_helper-$(CONFIG_DRM_DISPLAY_HDMI_CEC_HELPER) += \
> > > > +     drm_hdmi_cec_helper.o
> > > >  drm_display_helper-$(CONFIG_DRM_DISPLAY_HDMI_HELPER) += \
> > > >       drm_hdmi_helper.o \
> > > >       drm_scdc_helper.o
> > > > diff --git a/drivers/gpu/drm/display/drm_hdmi_cec_helper.c b/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
> > > > new file mode 100644
> > > > index 0000000000000000000000000000000000000000..2a3832e68232fa3b839a3c7457b2013779cada86
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
> > > > @@ -0,0 +1,145 @@
> > > > +// SPDX-License-Identifier: MIT
> > > > +/*
> > > > + * Copyright (c) 2024 Linaro Ltd
> > > > + */
> > > > +
> > > > +#include <drm/drm_bridge.h>
> > > > +#include <drm/drm_connector.h>
> > > > +#include <drm/display/drm_hdmi_cec_helper.h>
> > > > +
> > > > +#include <linux/mutex.h>
> > > > +
> > > > +#include <media/cec.h>
> > > > +#include <media/cec-notifier.h>
> > > > +
> > > > +static void drm_connector_hdmi_cec_adapter_unregister(struct drm_connector *connector)
> > > > +{
> > > > +     cec_unregister_adapter(connector->cec.adapter);
> > > > +     connector->cec.adapter = NULL;
> > > > +     connector->cec.unregister = NULL;
> > > > +}
> > > > +
> > > > +int drm_connector_hdmi_cec_adapter_register(struct drm_connector *connector,
> > > > +                                         const struct cec_adap_ops *ops,
> > > > +                                         const char *name,
> > > > +                                         u8 available_las,
> > > > +                                         int (*init_cec)(struct drm_connector *connector),
> > > > +                                         void (*uninit_cec)(struct drm_connector *connector),
> > > > +                                         struct device *dev)
> > >
> > > We're missing a documentation here. Why do we need drivers to pass both
> > > a set of cec_adap_ops and a bunch of extra functions? Shouldn't we make
> > > this a single structure like we did for audio?
> > 
> > Also might be an option, I didn't want to add extra wrappers in the
> > first place, but I can add them.
> > 
> > >
> > > Also, to remain consistent, we should call that function drm_connector_hdmi_cec_register
> > 
> > I wanted to point out the _adapter_ part, because we also have
> > whatever_cec_notifier_register() and at some point we might also get
> > whatever_cec_pin_register() if we wrap sun4i implementation too.
> 
> I think we can get away with drm_connector_hdmi_cec_register,
> drm_connector_hdmi_cec_pin_register (or bitbanged, or polled, or gpio,
> or whatever), and drm_connector_hdmi_cec_notifier_register

Ack

-- 
With best wishes
Dmitry
