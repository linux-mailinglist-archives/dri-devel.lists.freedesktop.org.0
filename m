Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3E8A21544
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 00:44:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D446C10E27B;
	Tue, 28 Jan 2025 23:44:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OSghu9Mo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9140310E27B
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 23:44:14 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-53e384e3481so5945032e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 15:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738107853; x=1738712653; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9yRxeMsKIz/YlsBTxIgGuyD6zsTp2VG/EbzO3/ftdXc=;
 b=OSghu9MocC8hZT7mO7x3Mn7QbnSh+v2aDFuIAu2r/ADl5aO/OFugHsr1RWmUdWHTCP
 SmxkU8xtpVTMFnmwuLldgxfvC3g7icHDjF3R6s+E4BWu12pSUSUZjmccZGwidQ6bH6vL
 R/Bk9WWYhwiSdIVvbj41MeiCnSowmyTdy7QfhibTTIx+xhvWGNf6Q4aHktQpOrxTtxYn
 e2pED9u/KgCyJLkIk3Z1qmbvZBENN9sriHV2/cfBXmWDKfhu62UwXgM4nGzh6XyKy+qt
 VYfhqqphTJrWQexPGZ+PO+N3LDHiH2f0DJP0QDlaTP/KEMM+3FGb0ZkGpkHjVZuhSLth
 ZLQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738107853; x=1738712653;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9yRxeMsKIz/YlsBTxIgGuyD6zsTp2VG/EbzO3/ftdXc=;
 b=riawjlD7A12xF86dM593UkYC5NfZleZXTmgBw+jnamvaz0ESqg2iTNevCAu8tWsW15
 RWkwvGTubo2fK7fK1arnoZ+7BS1NPmvC/ZtgeQXlN3/x1ecMHOWQObVOtf7bHq2AtmxG
 LJ5l8PL36BxV2X/xnWJN/7s8A/QI/xgC9tH4REmAsgA6CwYi4i+zUaBxiQACwcNkaR18
 PFUZd8R/0dqFBPwl8oJr2/hZtLxze7BN7xCpR8/8IJIpktVPXH6oEjUyVmH3g4HdW52G
 MxqmE/GWaRSdteiQ1x5Yv1Hf+qkdjQ8S5Xy4tMSIBhcm2CJZwV1he94DZKTAsw+uBYNJ
 RyEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWp+rdG5yrVqN6pK+VjB3FSOwXKZ/qjgcHQPP1eLF8SkJTPqHe54f+O4Bw8IzXR8nG7Ce8bn8lUp0E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7yNgSsOQQqBT18BwvodRqwmOE7deLWowUtFq8kRRLWeCjZKJ+
 JB707XxgPaYGAgmojag7LCRGrFx75XAQfwpzVN9kbUA+e9CPeO45E5d2eFwKf0w=
X-Gm-Gg: ASbGnctygtct5FAW9LVZ4WIMrqEtUDjo4F8n8g9LTtqb7VAoeF08eu0Bet9HwXMevSb
 gwIHdipxPgJxyVb5uFKUUkT8tO6jBnkd5ZIuHMCsYnYFdYmbGt75zpJrq2E6cGaPQ4oV58LvWN3
 Ea6KJU4+iq5yzZ/CX+Xvllp6bq44IsGVELRKsF+idOX2z8eDtUUR0lN91BN7OTUPfsoXqPoErlq
 +v83BTk5Nb3vhe2S7x8ZKbTxwlMwIAsqAYhDf8Gz0QgQ1Wbu0tjHXdwbIgSA8oxh8GZG5gZVQ3u
 0wYwezrizfSsrgqkOJimFo13R/W5Lv53lO4SJ8u7oMmlyWEX3gPYC7BZAP4xpw9dW0ga3mw=
X-Google-Smtp-Source: AGHT+IEGlNcPFc12SjKB8koMN+2/y0IzhsTezyy3VtwxS/oT0lSx1QNE/x0xRWOcin+Kv46ubnOZwQ==
X-Received: by 2002:a05:6512:131e:b0:540:1d37:e6e with SMTP id
 2adb3069b0e04-543e4c32554mr324610e87.33.1738107852766; 
 Tue, 28 Jan 2025 15:44:12 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543c8229281sm1790066e87.32.2025.01.28.15.44.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 15:44:11 -0800 (PST)
Date: Wed, 29 Jan 2025 01:44:09 +0200
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
Subject: Re: [PATCH v3 08/10] drm/display: bridge-connector: handle CEC
 adapters
Message-ID: <qe7cm52nozxvawm6yjzbvfarwoiokpwkr26s66tkypgrsztc7t@vnzbek6i4qhr>
References: <20250126-drm-hdmi-connector-cec-v3-0-5b5b2d4956da@linaro.org>
 <20250126-drm-hdmi-connector-cec-v3-8-5b5b2d4956da@linaro.org>
 <j5vgb5kcjs2ax3kws6rlbcca57set22ncj6onvgbm4xwjtw43t@uplzdjywzrkr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <j5vgb5kcjs2ax3kws6rlbcca57set22ncj6onvgbm4xwjtw43t@uplzdjywzrkr>
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

On Tue, Jan 28, 2025 at 05:14:06PM +0100, Maxime Ripard wrote:
> On Sun, Jan 26, 2025 at 03:29:13PM +0200, Dmitry Baryshkov wrote:
> >  /* -----------------------------------------------------------------------------
> >   * Bridge Connector Initialisation
> >   */
> > @@ -633,6 +711,21 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> >  			if (ret)
> >  				return ERR_PTR(ret);
> >  		}
> > +
> > +		if (bridge->hdmi_cec_adapter_name) {
> > +			if (!bridge->funcs->hdmi_cec_enable ||
> > +			    !bridge->funcs->hdmi_cec_log_addr ||
> > +			    !bridge->funcs->hdmi_cec_transmit)
> > +				return ERR_PTR(-EINVAL);
> > +
> > +			ret = drm_connector_hdmi_cec_register(connector,
> > +							      &drm_bridge_connector_hdmi_cec_ops,
> > +							      bridge->hdmi_cec_adapter_name,
> > +							      bridge->hdmi_cec_available_las,
> > +							      bridge->hdmi_dev);
> > +			if (ret)
> > +				return ERR_PTR(ret);
> > +		}
> 
> Maybe we can use a different bridge feature flag to trigger the CEC code
> support instead?

it is possible, but what is the possible usecase? DP drivers should be
using DP_AUX CEC instead. And I think there are no other kinds of
bridges which implement CEC support. Meson driver does something strange
by registering CEC notifier from meson_encoder_hdmi. I think instead
this should be moved to the DW HDMI bridge itself

-- 
With best wishes
Dmitry
