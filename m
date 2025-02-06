Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93854A2AAE5
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 15:15:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A9C10E86D;
	Thu,  6 Feb 2025 14:15:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Tw26qhXb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D75510E86B
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 14:15:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id ACF595C5FB1;
 Thu,  6 Feb 2025 14:15:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2AD1C4CEDF;
 Thu,  6 Feb 2025 14:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738851352;
 bh=rcqJkuQ2HFzZga9D7cWTaXV3gW0ZCzU6MCc8Sw5hnyI=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=Tw26qhXbWI9iCvq7HWmZ+4tYuAvjyk3PNd0H5/RHxQbAHk3EHoktkmDnp5hHUKNkE
 uXYtRJT8jv+nPZbdOaOPt8vcabrmRLHjVcJJblnVV3QoJbk7Flec/hEAfPFUUTH8z6
 0jv8puc8+Qs2HLtihZHxlJKd2V6YatltV3ABPfOfT2YoYHEEQbelrqkyTQQOUgvnIB
 iQD8DrJj53nVVEQQ6vKT1V4zR87O2x4mx1btTdfDGck0ndnt7NevNRM/BWj/aCIU0W
 KGEyIlYD2VBin/BbbCTKxsuCGOL42lbvsBLOl2xELvoALwjfEimg+mCrfsTrYJJgy8
 F2kZWWWe+Jqhg==
Message-ID: <d735c21055c438e756356ef288d8ab0f@kernel.org>
Date: Thu, 06 Feb 2025 14:15:49 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Anusha Srivatsa" <asrivats@redhat.com>
Subject: Re: [PATCH 06/12] drm/sprd: move to
 devm_platform_ioremap_resource() usage
In-Reply-To: <20250205-mem-cocci-newapi-v1-6-aebf2b0e2300@redhat.com>
References: <20250205-mem-cocci-newapi-v1-6-aebf2b0e2300@redhat.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, "Alain
 Volmat" <alain.volmat@foss.st.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>, "Alexey
 Brodkin" <abrodkin@synopsys.com>, "Alison Wang" <alison.wang@nxp.com>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, "Andy Yan" <andy.yan@rock-chips.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Baolin Wang" <baolin.wang@linux.alibaba.com>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, "Chunyan Zhang" <zhang.lyra@gmail.com>, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>,
 "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, "Fabio Estevam" <festevam@gmail.com>,
 =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>,
 "Joel Stanley" <joel@jms.id.au>, "John
 Stultz" <jstultz@google.com>, "Jonathan Corbet" <corbet@lwn.net>, "Jonathan
 Hunter" <jonathanh@nvidia.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marek
 Vasut" <marex@denx.de>, "Matthias Brugger" <matthias.bgg@gmail.com>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, "Maxime Ripard" <mripard@kernel.org>,
 =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 "Mikko Perttunen" <mperttunen@nvidia.com>, "Orson
 Zhai" <orsonzhai@gmail.com>, "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Philippe Cornu" <philippe.cornu@foss.st.com>,
 "Raphael Gallais-Pou" <raphael.gallais-pou@foss.st.com>,
 "Raphael Gallais-Pou" <rgallaispou@gmail.com>, "Raspberry
 Pi Kernel Maintenance" <kernel-list@raspberrypi.com>,
 "Sandy Huang" <hjc@rock-chips.com>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Shawn Guo" <shawnguo@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Stefan Agner" <stefan@agner.ch>,
 "Sumit Semwal" <sumit.semwal@linaro.org>, "Thierry
 Reding" <thierry.reding@gmail.com>, "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Tian
 Tao" <tiantao6@hisilicon.com>, "Xinliang Liu" <xinliang.liu@linaro.org>,
 "Xinwei Kong" <kong.kongxinwei@hisilicon.com>,
 "Yannick Fertre" <yannick.fertre@foss.st.com>, "Yongqin
 Liu" <yongqin.liu@linaro.org>
Content-Transfer-Encoding: 7bit
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

On Wed, 5 Feb 2025 15:08:02 -0500, Anusha Srivatsa wrote:
> Replace platform_get_resource + devm_ioremap
> with just devm_platform_ioremap_resource()
> 
> Used Coccinelle to do this change. SmPl patch:
> @rule_2@
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
