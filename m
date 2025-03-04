Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7B5A4EF31
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 22:11:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E084D10E6B4;
	Tue,  4 Mar 2025 21:11:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="LwuGfFrD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FD9A10E15E
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 21:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=67iaMe7dRzqdmdTZ5v9Y4GVdBIwy//hSn3Sql8CF+no=; b=LwuGfFrDvpwUU2B/5O/ULqbrDV
 oEVLnfpfhFu69Ah2JLQbY0xkmgJLtF02XMOjjT+j6hUtQIjF1n2zEuxMw03K//2AjsxukLhZmm8/s
 0G47epspd1m/oEAqwB74vAgVd3OX5Zx1Xalh6MS2jAD+6NsQn0v+nMPM6rEKT9YW/U+mFI6b+UIsW
 CVqjoYsJn1RnQwgi6WfPvIX4FjYoavZEyP+Ep5Q82IpxQY6Aq2IJUCN6mypnZKaXbZ1riCOfg+3T0
 G7qnvSdnpDszk21aAuNc4yp9TebRb9TxEl9Oo92/0IN5T4vCu8I9lOXD0j2YXWa5GuC+MhNaT0phF
 pcsq8BkA==;
Received: from i53875a38.versanet.de ([83.135.90.56] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1tpZXr-0006Cf-7O; Tue, 04 Mar 2025 22:11:19 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Dragan Simic <dsimic@manjaro.org>
Cc: andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, quentin.schulz@cherry.de,
 Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH v3 1/3] drm/rockchip: lvds: move pclk preparation in with
 clk_get
Date: Tue, 04 Mar 2025 22:11:18 +0100
Message-ID: <3048640.Lt9SDvczpP@diego>
In-Reply-To: <041c5f0e2371817a27577bd0989b9dca@manjaro.org>
References: <20250304124418.111061-1-heiko@sntech.de>
 <20250304124418.111061-2-heiko@sntech.de>
 <041c5f0e2371817a27577bd0989b9dca@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

Am Dienstag, 4. M=C3=A4rz 2025, 21:30:22 MEZ schrieb Dragan Simic:
> Hello Heiko,
>=20
> On 2025-03-04 13:44, Heiko Stuebner wrote:
> > diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c
> > b/drivers/gpu/drm/rockchip/rockchip_lvds.c
> > index 385cf6881504..ecfae8d5da89 100644
> > --- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
> > +++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
> > @@ -448,15 +448,13 @@ struct drm_encoder_helper_funcs
> > px30_lvds_encoder_helper_funcs =3D {
> >  static int rk3288_lvds_probe(struct platform_device *pdev,
> >  			     struct rockchip_lvds *lvds)
> >  {
> > -	int ret;
> > -
> >  	lvds->regs =3D devm_platform_ioremap_resource(pdev, 0);
> >  	if (IS_ERR(lvds->regs))
> >  		return PTR_ERR(lvds->regs);
> >=20
> > -	lvds->pclk =3D devm_clk_get(lvds->dev, "pclk_lvds");
> > +	lvds->pclk =3D devm_clk_get_prepared(lvds->dev, "pclk_lvds");
> >  	if (IS_ERR(lvds->pclk)) {
> > -		DRM_DEV_ERROR(lvds->dev, "could not get pclk_lvds\n");
> > +		DRM_DEV_ERROR(lvds->dev, "could not get or prepare pclk_lvds\n");
>=20
> I'm wondering why this patch isn't replacing deprecated DRM
> logging macros with their preferred successors in a couple of
> places, just like what the patch 2/3 from this series does?

because this patch is about reorganizing the clock handling :-)

Changing the logging functions is a different topic and so has no place
in _this_ patch.

And of course drm-logging is a separate beast to tame altogether.
drm_err vs. dev_err; lvds->dev vs. drm_dev (there was an argument over
what belongs where recently) .

And I had neither the capacity nor time to delve into all that, so limited
myself to stuff I understood :-)

Heiko



