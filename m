Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EEE95397E
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 19:52:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A36D10E4CB;
	Thu, 15 Aug 2024 17:52:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="JFYMWCAB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9B4510E4CB
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 17:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sX4ji4tZ/IC07+4SxnMSoyXeYOb8nKo0ZJ2qqmmYDyc=; b=JFYMWCABVQ+r4mZG0/w602Ykns
 M8haWA4KNBJNiL6ZMJ46N7TfIFUIls4XAXTDPsLwbyo7NUzQ4hWDNUO3kkJ4W9Ms+bOgjJcXNr0Ay
 gDb+CVEW3+hbGXjBp1jpTHN2mBhJK7zgmGYcmcqUrKsw8R2VwGeejiJhuV9RR6UoGuzPpe7kFqqfZ
 Ic0hcpwZntC5FVHeHIjg0YHkpyXsQ9mBz3XDu3tp+isnbsLH0ZsLq9k4XKRmP17yyoas82MRg+qLb
 i2NhR3ZMPFALMTaKE/2HBDeRJ92yskvmisKSg8IJjza7J4wVe6/8xQGCvTiIXlTTf8EciUCQfd8Fc
 qEUAAYIw==;
Received: from i53875a9f.versanet.de ([83.135.90.159] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1seeeE-0006Qv-On; Thu, 15 Aug 2024 19:52:30 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <seanpaul@chromium.org>, Jeffy Chen <jeffy.chen@rock-chips.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Mark Yao <markyao0591@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] drm/rockchip: Unregister platform drivers in
 reverse order
Date: Thu, 15 Aug 2024 19:52:29 +0200
Message-ID: <12056454.6ASCnIXroE@diego>
In-Reply-To: <80ffed99-7368-4f84-8dc9-4c980055e48d@collabora.com>
References: <20240808-rk-drm-fix-unreg-v1-1-c30d9a754722@collabora.com>
 <9027071.qdD9tO9HgI@diego>
 <80ffed99-7368-4f84-8dc9-4c980055e48d@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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

Am Donnerstag, 15. August 2024, 19:26:54 CEST schrieb Cristian Ciocaltea:
> On 8/15/24 5:21 PM, Heiko St=FCbner wrote:
> > Am Donnerstag, 8. August 2024, 13:58:02 CEST schrieb Cristian Ciocaltea:
> >> Move rockchip_drm_platform_driver unregistration after its sub-drivers,
> >> which ensures all drivers are unregistered in the reverse order used
> >> when they were registered.
> >=20
> > are you sure about that?
> >=20
> > I.e. currently rockchip_drm_init() does=20
> >   platform_register_drivers(rockchip_sub_drivers, ...)
> > to register the sub-drivers and only after that registers the main
> > drm-platform-driver
> >=20
> > rockchip_drm_fini currently does the reverse of first unregistering the
> > main drm-platform-driver and after that unregistering the array of sub-
> > drivers.
> >=20
> >=20
> > So as it stands right now, rockchip_drm_fini does already do exactly the
> > reverse when de-registering.
>=20
> Indeed, somehow I overlooked this while debugging some module unloading
> issues.  I guess it just felt more naturally to have the subdrivers
> unregistered first.
>=20
> Out of curiosity to see if there's a common pattern for handling this, I
> found that most drivers do indeed unregister the subdrivers before the ma=
in
> platform one, but weirdly enough, some of them do also keep the same order
> on registration, similarily to what this patch unintentionally does:
>=20
>   drivers/power/supply/ab8500_charger.c
>   drivers/gpu/drm/vc4/vc4_drv.c
>   drivers/gpu/drm/mcde/mcde_drv.c
>=20
> Not sure if those are potential mistakes, or maybe it doesn't really matt=
er?!
>=20
> Please let me know if you have a preference for it, and I'll update the
> patch accordingly, otherwise let's just ignore it altogether.

in theory it shouldn't matter, simply because the component framework
will only bind when all driver are present and unbind when the first driver
vanishes.

But I really like doing the reverse order more - so as it is now.

You also wouldn't disable clocks, before trying to deactivate some device-
function.

So deactivating stuff in the reverse order of them getting activated is most
likely less error prone.



