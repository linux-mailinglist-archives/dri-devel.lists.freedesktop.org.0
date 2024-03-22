Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 559AC886E6F
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 15:25:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2124C1124DC;
	Fri, 22 Mar 2024 14:25:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="p9C1X74a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A5851124D9;
 Fri, 22 Mar 2024 14:24:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 146FFCE16FE;
 Fri, 22 Mar 2024 14:24:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BEC5C433C7;
 Fri, 22 Mar 2024 14:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711117496;
 bh=RVI/efteQCKqZjTG1IpZpoRWMwJCgqrfbqKi4jhZC4o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p9C1X74a1jnG3XpxuajooWGojIDix6bmT6uqBE8l2HkAY9omVA4O1B0byql0SKdyH
 CYi7jeSkQf46LxgR1Ni0T0njDfeLKT7xiNS3gA/3cdGTKGCdel/QpQJQVI7ZeITY/T
 TCw3b5WDMwKKCqqSwoAgcF9kMlW0e7JE77y8nv80k2qYxUuWvRffrtI2EoaSJBWKpy
 UBpTPQohevNnSMe9JV+y1Isxz+8TjQCDi+uY05tQ+wtO1KCYBP0nQ8Xp4t7aO1LI0/
 6Iq4d3j/s4EMcrA3RgzpLv1icIZZFUVxdgMvffPcfwtVNw6BLtFLnHk8e3rdHIXAKm
 nzpFs27W6mSdQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1rnfpQ-000000001yB-3TGf;
 Fri, 22 Mar 2024 15:25:05 +0100
Date: Fri, 22 Mar 2024 15:25:04 +0100
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] drm/msm/dp: Add support for determining the
 eDP/DP mode from DT
Message-ID: <Zf2UwOGU2N7BfTTw@hovoldconsulting.com>
References: <20240322-x1e80100-display-refactor-connector-v3-0-af14c29af665@linaro.org>
 <20240322-x1e80100-display-refactor-connector-v3-1-af14c29af665@linaro.org>
 <CAA8EJpp6V5qVzbYtnU=JjO8FX45fcxBvWsD3PWQ5bu5wuv-T=g@mail.gmail.com>
 <Zf2JYmm3DEaR8vB5@linaro.org>
 <CAA8EJppT2VAXMxAbMztbi=-QZj8nP++_Zy4RQHkY-DrO5W_3EQ@mail.gmail.com>
 <Zf2Se84QnWccpiM/@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zf2Se84QnWccpiM/@linaro.org>
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

On Fri, Mar 22, 2024 at 04:15:23PM +0200, Abel Vesa wrote:
> On 24-03-22 15:38:03, Dmitry Baryshkov wrote:
> > On Fri, 22 Mar 2024 at 15:36, Abel Vesa <abel.vesa@linaro.org> wrote:
> > > On 24-03-22 15:30:54, Dmitry Baryshkov wrote:
> > > > On Fri, 22 Mar 2024 at 15:22, Abel Vesa <abel.vesa@linaro.org> wrote:

> > > > > +static int dp_display_get_connector_type(struct platform_device *pdev,
> > > > > +                                        const struct msm_dp_desc *desc)
> > > > > +{
> > > > > +       struct device *dev = &pdev->dev;
> > > > > +       struct device_node *aux_bus;
> > > > > +       struct device_node *panel;
> > > > > +       int ret = DRM_MODE_CONNECTOR_DisplayPort;
> > > > > +
> > > > > +       /* legacy platforms specify connector type in match data */
> > > > > +       if (desc->connector_type == DRM_MODE_CONNECTOR_eDP ||
> > > > > +               desc->connector_type == DRM_MODE_CONNECTOR_DisplayPort)
> > > >
> > > > misaligned
> > > >
> > >
> > > Sure, will fix.
> > >
> > > > > +               return desc->connector_type;
> > > >
> > > > Can we drop this part completely?
> > > >
> > >
> > > You mean the whole if clause? How should we handle the legacy approach
> > > then?
> > 
> > Legacy platforms still have the aux-bus/panel. so they should be
> > handled by the check below.
> > 
> 
> Oh, in that case we can drop the connector_type from every desc for all
> platforms.

Guys, please trim your replies!

Johan
