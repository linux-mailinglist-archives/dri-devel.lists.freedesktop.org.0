Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F2096B176
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 08:21:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 002C010E66F;
	Wed,  4 Sep 2024 06:21:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kVDDzh6Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A1B10E66F
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 06:21:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 36AA3A40E52;
 Wed,  4 Sep 2024 06:21:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D618C4CEC2;
 Wed,  4 Sep 2024 06:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1725430888;
 bh=45T0UdM4XULpq6I/wvSmgNZL5OfJfMSSqZmgV1iBb8c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kVDDzh6QVMrQmWm/Ayy6BLEtPbpWxLD7Dmok9kpi96Xv/j0ze8gum1MQweUGRZbqZ
 31M1w8Yh3WWSQU6f7wOP33I8H5JvRqJZUjUc19FCXDNw81VsJpVLEVOi+xUaEzIhOj
 SWymqg1X2y7EYjHRJXXnn0znfNviyj2J1jFaQMw8=
Date: Wed, 4 Sep 2024 08:21:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Paul Pu <hui.pu@gehealthcare.com>
Cc: p.zabel@pengutronix.de,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Sasha Levin <sashal@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>, HuanWang@gehealthcare.com,
 taowang@gehealthcare.com, sebastian.reichel@collabora.com,
 ian.ray@gehealthcare.com, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: imx: ipuv3-plane: fix HDMI cannot work for odd
 screen resolutions
Message-ID: <2024090452-canola-unwoven-1c6c@gregkh>
References: <20240904024315.120-1-hui.pu@gehealthcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904024315.120-1-hui.pu@gehealthcare.com>
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

On Wed, Sep 04, 2024 at 05:43:15AM +0300, Paul Pu wrote:
> This changes the judgement of if needing to round up the width or not,
> from using the `dp_flow` to the plane's type.
> 
> The `dp_flow` can be -22(-EINVAL) even the plane is a PRIMARY one.
> See `client_reg[]` in `ipu-common.c`.
> 
> [    0.605141] [drm:ipu_plane_init] channel 28, dp flow -22, possible_crtcs=0x0
> 
> Per the commit message in commit: 71f9fd5bcf09, using the plane type for
> judging if rounding up is needed is correct.
> 
> Fixes: 71f9fd5bcf09 ("drm/imx: ipuv3-plane: Fix overlay plane width")

That id is not in Linus's tree :(

> Cc: stable@vger.kernel.org
> 
> Signed-off-by: Paul Pu <hui.pu@gehealthcare.com>

No need for the blank line before this.

thanks,

greg k-h
