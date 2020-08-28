Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9DD255C29
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 16:18:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C361B6E4B6;
	Fri, 28 Aug 2020 14:18:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6274F6E4B6
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 14:18:52 +0000 (UTC)
Received: from localhost (unknown [122.171.38.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 65C8D20848;
 Fri, 28 Aug 2020 14:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598624332;
 bh=leHLGjg8aOzdRJPBC4ekk4kQDiYmjF+OUvMLO0aEJMM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wKM/gEClCHdIWfiBdSgaynHkOvikRn9ZyW9iCvIffNgZ8+gvbzUJiXB2kU2JyQgUL
 qPy2HGNe6q6QjT01Sj1aI9AmkW+OVKFadPKrNbojfqCtzk6QJEHHkNNivM4k53EGS1
 z7XwkM2n4g0lF1YNQAf6QHvX1Nmlioqmfnitc92w=
Date: Fri, 28 Aug 2020 19:48:48 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v1 2/2] drm: bridge: add support for lontium LT9611UXC
 bridge
Message-ID: <20200828141848.GX2639@vkoul-mobl>
References: <20200828120431.1636402-1-dmitry.baryshkov@linaro.org>
 <20200828120431.1636402-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200828120431.1636402-3-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28-08-20, 15:04, Dmitry Baryshkov wrote:

> +#define EDID_BLOCK_SIZE	128
> +#define EDID_NUM_BLOCKS 2

tab or space either one, not both ;)

> +static struct mipi_dsi_device *lt9611uxc_attach_dsi(struct lt9611uxc *lt9611uxc,
> +						 struct device_node *dsi_node)

Please align this with open parenthesis of preceding line (checkpatch
with --strict option will check this)

> +static int lt9611uxc_bridge_attach(struct drm_bridge *bridge,
> +				enum drm_bridge_attach_flags flags)
> +{
> +	struct lt9611uxc *lt9611uxc = bridge_to_lt9611uxc(bridge);
> +	int ret;
> +
> +	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> +		dev_err(lt9611uxc->dev, "Fix bridge driver to make connector optional!");

Can we support both modes as I have done in lt9611, that way once the
conversion is done we can drop the init part and support conversion.

I have patch for msm driver to set DRM_BRIDGE_ATTACH_NO_CONNECTOR, you
can use that to test

> +static int lt9611uxc_hdmi_hw_params(struct device *dev, void *data,
> +				 struct hdmi_codec_daifmt *fmt,
> +				 struct hdmi_codec_params *hparms)
> +{
> +	/*
> +	 * LT9611UXC will automatically detect rate and sample size, so no need
> +	 * to setup anything here.
> +	 */
> +	return 0;
> +}

Do we need dummy function?

-- 
~Vinod
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
