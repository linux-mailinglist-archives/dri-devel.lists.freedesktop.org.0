Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5B985FD97
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 17:06:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DAFE10E997;
	Thu, 22 Feb 2024 16:06:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KWJbfB7i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A51310E9A7;
 Thu, 22 Feb 2024 16:06:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6FECB618A2;
 Thu, 22 Feb 2024 16:06:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E8F2C433F1;
 Thu, 22 Feb 2024 16:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708617968;
 bh=C+TptrLEyKVQZgqziz2FhHnXNxbrMuek3GwWVcpvIo4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KWJbfB7iIrJzA5wgM//VQpK+Eg1Jl7jsjd4SEzbxStIlH2+3ip1yzmyPSHymB5rIP
 +kuPH04cJMfNIEEuP8KlSRti8JVt9Q1OQ9+RCo5Q9bLhbBmhXKKx2VNjyDHEsPbBbK
 txObfjquCti+EIcWW907dO1EI2N0f0pR6lZPMso9UMv/vXM84tR6cV66jS+yrMXDSc
 8+pkoyUMMrMhNi298AylQnGdWqe7h7vQly7yRH6YyKSy2fZiubV7K+QbbHmfavTyza
 fKszN2T/ofej2aQ5sp9beXBRSLahj63YnaDP2IIUwJMH/YOkGHj2yPLuL2IiNgV98j
 r05Ygwua981+A==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1rdBaM-0000000087I-3fOL;
 Thu, 22 Feb 2024 17:06:10 +0100
Date: Thu, 22 Feb 2024 17:06:10 +0100
From: Johan Hovold <johan@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: Re: [PATCH 2/6] drm/bridge: aux-hpd: separate allocation and
 registration
Message-ID: <Zddw8uhFwcwILhK0@hovoldconsulting.com>
References: <20240217150228.5788-1-johan+linaro@kernel.org>
 <20240217150228.5788-3-johan+linaro@kernel.org>
 <cyzl3m67daaijpwhcwx53tk7tgrvw4kxiz7cj6bhx5xxwh6fuj@u2l674nlp4th>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cyzl3m67daaijpwhcwx53tk7tgrvw4kxiz7cj6bhx5xxwh6fuj@u2l674nlp4th>
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

On Wed, Feb 21, 2024 at 08:06:41PM -0600, Bjorn Andersson wrote:
> On Sat, Feb 17, 2024 at 04:02:24PM +0100, Johan Hovold wrote:
> > diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
> [..]
> > +/**
> > + * devm_drm_dp_hpd_bridge_add - register a HDP DisplayPort bridge
> 
> kernel-doc wants () after function names.

I don't think that's required for the symbol name here even if some
subsystems (drivers) use it.

> > + * @dev: struct device to tie registration lifetime to
> > + * @adev: bridge auxiliary device to be registered
> > + *
> > + * Returns: zero on success or a negative errno
> 
> and "Return:" without the 's'.

This was a mistake however. Perhaps whoever applies this can drop it, or
I can send a v2.

Side note: Looks like there are more instances with an 's' than without
under driver/gpu/drm...

> This could however be done in a separate patch, as the file is already
> wrong in this regard.
> 
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Thanks for reviewing.

Johan
