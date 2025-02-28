Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6369A4A0BF
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 18:45:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F5510ED1F;
	Fri, 28 Feb 2025 17:45:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="pdiHPkkE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF45E10ED1F
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 17:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2sRrVQmgK0R2z5wr+aIoaoWSaXv+nBUPnIdA1TCMyRA=; b=pdiHPkkEaE+yoXVffSrekcrk2V
 UceJy7SUF5Xqf9FVYJVBFcEljZXjL6AzMHraNIeHXyC57VQJr2RbKWuxDhqzlcAWUZM/Hi8/8jClL
 p8hMC5A3Wi0Hny1px+xu7OJlmwfsnmVM7Hr4TUTKeZJP5MEinS2qX5h1v1tRLoR9W+nO4nXTBen0M
 CBq3GRbWZNcikLjc39IpKeN3aB7grOAwCjD+AVg7sylF3V9csGTviacBu6KhOsQ79S0FHpkAl/vvy
 thDh212CzjTRYjY/DLxfNz+itc5hwTtOtqE6+T3cIppLTZCAfGXFWWgezZqs3S3jgg466v8JLXXcB
 UPvwwgSA==;
Received: from i53875b47.versanet.de ([83.135.91.71] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1to4QV-0002Po-0K; Fri, 28 Feb 2025 18:45:31 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH 2/2] drm/rockchip: lvds: Hide scary error messages on probe
 deferral
Date: Fri, 28 Feb 2025 18:45:30 +0100
Message-ID: <3032732.6M6d0yLqnL@diego>
In-Reply-To: <b09e5470-2392-4557-9f13-62b6586e5c7b@cherry.de>
References: <20250228165755.405138-1-heiko@sntech.de>
 <20250228165755.405138-3-heiko@sntech.de>
 <b09e5470-2392-4557-9f13-62b6586e5c7b@cherry.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

Am Freitag, 28. Februar 2025, 18:42:32 MEZ schrieb Quentin Schulz:
> Hi Heiko,
> 
> On 2/28/25 5:57 PM, Heiko Stuebner wrote:
> > From: Heiko Stuebner <heiko.stuebner@cherry.de>
> > 
> > Commit 52d11c863ac9 ("drm/rockchip: lvds: do not print scary message when
> > probing defer") already started hiding scary messages that are not relevant
> > if the requested supply just returned EPROBE_DEFER, but there are more
> > possible sources - like the phy.
> > 
> > So modernize the whole logging in the probe path by replacing the
> > remaining deprecated DRM_DEV_ERROR with appropriate dev_err(_probe)
> > and drm_err calls.
> > 
> > The distinction here is that all messages talking about mishaps of the
> > lvds element use dev_err(_probe) while messages caused by interaction
> > with the main Rockchip drm-device use drm_err.
> > 
> > Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>

> > @@ -604,8 +602,8 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
> >   
> >   	ret = drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_LVDS);
> >   	if (ret < 0) {
> > -		DRM_DEV_ERROR(drm_dev->dev,
> > -			      "failed to initialize encoder: %d\n", ret);
> > +		drm_err(drm_dev,
> > +			"failed to initialize encoder: %d\n", ret);
> 
> All the above are using dev_err, but starting here, it's drm_err, is 
> that on purpose?

The last paragraph of the commit message was supposed to explain that
(which it seemingly did poorly :-) ) :

> > The distinction here is that all messages talking about mishaps of the
> > lvds element use dev_err(_probe) while messages caused by interaction
> > with the main Rockchip drm-device use drm_err.



