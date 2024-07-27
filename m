Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC81193E017
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jul 2024 18:13:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7632710E029;
	Sat, 27 Jul 2024 16:13:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XemhbkXJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A384B10E029
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2024 16:13:42 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2ef25511ba9so17431671fa.0
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2024 09:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722096821; x=1722701621; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=R65NOswuKmOlcg5v/47v/NC7ISjyuU0IR8ikjFCmA14=;
 b=XemhbkXJEM2lAPWgITnNwzZFW6s4siR9HX9JKCJvPtEiD7IuUIqUyCO02L1TrMQYvu
 VDQXADLjO0KQr8lhWJAGbXwFheA1b9Kbv5QI1TN0xmy6Fn02nGYB/IZsnagSFWHXjnN9
 tjOaw5kdLzTHzomXtJ/Q0roTfnJNP5g9A3ZCdjEWkt92ZAIkgl9jgl8LH38FJXIg3mrv
 ehi8BBDy3EPYOHtLZx9k+JOWqMPS6YHlAdZqbnmspwfLMoJ0EvnrtGGyhKr9bB183PT6
 qvbBcBE4h5vwoZm49M+iiYRzOLe1/hNn5GeuVyStYun5FJKx6se/UtC8ur/ZFVglxYz3
 7OnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722096821; x=1722701621;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R65NOswuKmOlcg5v/47v/NC7ISjyuU0IR8ikjFCmA14=;
 b=n9w2svMWJSYAJg92qWRciM1DMdAH6QOZrXrpUoxA0a+bvZFzCiYGJDCatoQV9b8Ubr
 5ZyETtBmXO1MvI5dY2GnqfROWZykvW8NtsOfDbR3iNxH9BgG75Te2s+5L+FtYgeTI8fn
 YZ2d09GxNnLbMbUeU9dczwnK2/qxaulKDIL6fKP91iJO4AGrZTXuQvl0yE6yE5LoXb6+
 cZioUoN2ZH73MoihS9nBYmO/6n6gIhPdY8ocvtQF+aQb8geT9x+YMwBHHeHssDwPdglL
 t705hjrigrogaBuOJiFFoEuVtdScawFN3D0OWNdejmiQxswavXrg5wrA94lbIbUrJK/R
 Rc5A==
X-Gm-Message-State: AOJu0YwtJbzpP8Tau9QNwi2bB/SVAVPEK2bZBBE65n287tgJc20C5YWH
 g01TdzMJPO2WYd/YfD5hnRPzE7gwYI9iRIy7kNPSaJcNPg1NF1WCcXv7Q9SkIBY=
X-Google-Smtp-Source: AGHT+IFmhVyFWyXbEhPfCIHxIT/ADxUCtbXvdsR87jH1Y5GSmJB81c7AAgcrJPh51vmgGGoCWI49Lg==
X-Received: by 2002:a2e:9085:0:b0:2ef:2f8a:52d5 with SMTP id
 38308e7fff4ca-2f12f0bb2b1mr6793381fa.8.1722096820422; 
 Sat, 27 Jul 2024 09:13:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f12dda4129sm2714401fa.139.2024.07.27.09.13.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Jul 2024 09:13:40 -0700 (PDT)
Date: Sat, 27 Jul 2024 19:13:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 p.zabel@pengutronix.de, 
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org, francesco@dolcini.it,
 frank.li@nxp.com
Subject: Re: [PATCH v2 07/16] drm/imx: Add i.MX8qxp Display Controller pixel
 engine
Message-ID: <ibdzow7lvbimaefrp2z2aolgp4pytpq3dcr2y3pegjavvknhgm@2e6j3f4zytqp>
References: <20240712093243.2108456-1-victor.liu@nxp.com>
 <20240712093243.2108456-8-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240712093243.2108456-8-victor.liu@nxp.com>
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

On Fri, Jul 12, 2024 at 05:32:34PM GMT, Liu Ying wrote:
> i.MX8qxp Display Controller pixel engine consists of all processing
> units that operate in the AXI bus clock domain.  Add drivers for
> ConstFrame, ExtDst, FetchLayer, FetchWarp and LayerBlend units, as
> well as a pixel engine driver, so that two displays with primary
> planes can be supported.  The pixel engine driver as a master binds
> those unit drivers as components.  While at it, the pixel engine
> driver is a component to be bound with the upcoming DRM driver.

Same question / comment: create subnodes directly, without going
through the subdevices. A lot of small functions that would benefit
being inlined.

> +static int dc_cf_bind(struct device *dev, struct device *master, void *data)
> +{
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct dc_drm_device *dc_drm = data;
> +	struct dc_pe *pe = dc_drm->pe;
> +	struct dc_cf_priv *priv;
> +	int id;
> +
> +	priv = drmm_kzalloc(&dc_drm->base, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->reg_cfg = devm_platform_ioremap_resource_byname(pdev, "cfg");
> +	if (IS_ERR(priv->reg_cfg))
> +		return PTR_ERR(priv->reg_cfg);
> +
> +	id = of_alias_get_id(dev->of_node, "dc0-constframe");

Is it documented? Acked?

> +	if (id < 0) {
> +		dev_err(dev, "failed to get alias id: %d\n", id);
> +		return id;
> +	}
> +

-- 
With best wishes
Dmitry
