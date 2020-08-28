Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F03F8255D56
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 17:06:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0098F6E4D2;
	Fri, 28 Aug 2020 15:06:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFB696E4D2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 15:06:45 +0000 (UTC)
Received: from localhost (unknown [122.171.38.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 634F32075B;
 Fri, 28 Aug 2020 15:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598627205;
 bh=Nr0kxkFZWse9WtVRoe34d4YlUnG8tQeAyhzLDFCwgCU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=yW2UZm+o4bnsSSNVxHlN4kqZfwWtrtVzR/9cee/m73r+xbWmTs6SZI9tN+9tQfKyE
 4fHXSLUXvPOLj31wSOTjrimqLj/HombWrJWSsash4S1CAYHB1nT34VR0B52fQ4BhqB
 aW1njn+YOPS97vku7as5eiY0HjzQf3LIIL5MpT8Q=
Date: Fri, 28 Aug 2020 20:36:41 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v1 2/2] drm: bridge: add support for lontium LT9611UXC
 bridge
Message-ID: <20200828150641.GZ2639@vkoul-mobl>
References: <20200828120431.1636402-1-dmitry.baryshkov@linaro.org>
 <20200828120431.1636402-3-dmitry.baryshkov@linaro.org>
 <20200828141848.GX2639@vkoul-mobl>
 <d2afbd86-eb53-e273-6de6-dfae64624b37@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d2afbd86-eb53-e273-6de6-dfae64624b37@linaro.org>
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

On 28-08-20, 18:01, Dmitry Baryshkov wrote:
> On 28/08/2020 17:18, Vinod Koul wrote:
> > On 28-08-20, 15:04, Dmitry Baryshkov wrote:
> > > +static int lt9611uxc_bridge_attach(struct drm_bridge *bridge,
> > > +				enum drm_bridge_attach_flags flags)
> > > +{
> > > +	struct lt9611uxc *lt9611uxc = bridge_to_lt9611uxc(bridge);
> > > +	int ret;
> > > +
> > > +	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> > > +		dev_err(lt9611uxc->dev, "Fix bridge driver to make connector optional!");
> > 
> > Can we support both modes as I have done in lt9611, that way once the
> > conversion is done we can drop the init part and support conversion.
> > 
> > I have patch for msm driver to set DRM_BRIDGE_ATTACH_NO_CONNECTOR, you
> > can use that to test
> 
> Probably the message text is misleading. The driver as is does not work w/o
> DRM_BRIDGE_ATTACH_NO_CONNECTOR. Do you plan to push that patch into upstream
> tree?

It causes regression in laptop so have removed it ;( I need to fix that
first
The patch is here though and works on rb3 and db410c.
git.linaro.org/people/vinod.koul/kernel.git drm/no_connector

-- 
~Vinod
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
