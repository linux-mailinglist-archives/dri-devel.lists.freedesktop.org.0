Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E959E5DEC
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 19:04:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F5D410EF57;
	Thu,  5 Dec 2024 18:04:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="SLgIBSPy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B67310EF57
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 18:04:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1733421881; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=CD7IQ9sWFL7LplVEoEnc0NaZmOuF/y0rMnTPwHbvX/n0+Wy1kmwvi2g/Dmov9FV8tSDE6QihziJhYSLNZUJIGVhVNk2b0nR9aTGiX44aNWWKy1lrT+7YlppBJXhurBP2IwpVlv3dAli0nEGsKSGcrIq/cdZkDcSQs+HR0ntm0VY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1733421881;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=tXsmplCWIfDU1nslWwIzWjXlT1Uhwo23G/KzmcVHbWA=; 
 b=AOBAnGEz+5pBuWHF1fr3zRWsZvFOUonvoDDj1zKnmNeTuEvDsb5rbbpXSSZbUM8mcJD2R8EgDMRCzkTyXAIH311txt422DYrmbHPLfSsLQ8S5H6XMuInc+HBX2skjSTMg/DQObGD7U+10Ndm+xtIQRcnxjQ8vPPUMUnSTNLX2ww=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
 dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733421881; 
 s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=tXsmplCWIfDU1nslWwIzWjXlT1Uhwo23G/KzmcVHbWA=;
 b=SLgIBSPyZrlSRVdtdt8u5wyKkpez+z41A5lkHP/IjxRXWMXULNC2fPxqpO2qn4xh
 Q69s3f7XeGip3ZO8f3afDchahlQ4n5yTM9V4p0A5MS/dHduVGpSKG9lBDjEoayEfSxa
 Jxjg8ssPj3vD6lBlYGrC2szq5y5Kqo8Hp0T7Ceqk=
Received: by mx.zohomail.com with SMTPS id 1733421877901470.7310984148362;
 Thu, 5 Dec 2024 10:04:37 -0800 (PST)
Received: by mercury (Postfix, from userid 1000)
 id 563EF10604B0; Thu, 05 Dec 2024 19:04:32 +0100 (CET)
Date: Thu, 5 Dec 2024 19:04:32 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
 cristian.ciocaltea@collabora.com, l.stach@pengutronix.de,
 andy.yan@rock-chips.com, 
 hjc@rock-chips.com, algea.cao@rock-chips.com, kever.yang@rock-chips.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: Re: [PATCH v1 04/10] phy: phy-rockchip-samsung-hdptx: Add support
 for eDP mode
Message-ID: <5ncdog66jtc4s7vxk2yt4jkknf2es3whvweuqmrxbot3azi5ge@t6s3xadkiasp>
References: <20241127075157.856029-1-damon.ding@rock-chips.com>
 <2131853.KlZ2vcFHjT@diego>
 <6e1f35c0-5ea8-414f-b3ea-4e7222c605ef@rock-chips.com>
 <2886747.Y6S9NjorxK@diego>
 <h4giob7bcrh7qmtepti6huym2llw4ujfmeff76vrgpahb5zy6x@dz6zghsifww5>
 <2342f342-672c-447e-90d8-674b748af6a4@rock-chips.com>
 <abzu2chif2g3urxoqbm3gbe6cciexbmqvn44qezrx4hgllfkkn@7bzi5jl3stqe>
 <42035ebe-09b7-4005-912a-8ec72d5dabcc@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tgjajudtqqajoprm"
Content-Disposition: inline
In-Reply-To: <42035ebe-09b7-4005-912a-8ec72d5dabcc@rock-chips.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.3.1/233.339.97
X-ZohoMailClient: External
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


--tgjajudtqqajoprm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 04/10] phy: phy-rockchip-samsung-hdptx: Add support
 for eDP mode
MIME-Version: 1.0

Hello Damon,

On Thu, Dec 05, 2024 at 09:13:33AM +0800, Damon Ding wrote:
> Firstly, the term "the HDMI and eDP dynamic switching" can be somewhat
> misleading, because the eDP usually does not support hot plug. The RK3588
> eDP is often used as DP, and it actually supports DP 1.2. Therefore, it is
> better to use the "the HDMI and DP dynamic switching" description.

The part unclear to me is how the dynamic switching is supposed to
happen. Looking at the TRM the hotplug detect signals also seem to be
shared between HDMI and eDP. Can the RK3588S EVB distinguish if HDMI
or eDP has been plugged, or does this require some user interaction
to set the right mode?

> Indeed, the devm_phy_get(dp->dev, "dp") and devm_of_phy_get_by_index() wi=
ll
> help to get the phy reference in .probe() or .bind().
>=20
> However, the phy_set_mode() may be still needed in the HDMI and DP dynamic
> switching application scenarios. We need the enum phy_mode
> PHY_MODE_DP/PHY_MODE_HDMI to differentiate the configuration processes in
> .power_on(), .power_off() and .configure() of struct phy_ops, which will =
be
> called in conjunction with plugging in and unplugging an HDMI or DP cable.

I suppose you could fetch the PHY in power_on() and release it in
power_off(). But using phy_set_mode() might indeed be better here.

-- Sebastian

--tgjajudtqqajoprm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmdR6ykACgkQ2O7X88g7
+pqINw/8CISqq7TtaVuYjbUOVbMUju+XZCYIgQ86pXkRiTB8jbo9FSE0v+9rD3B2
oxzyPpwv6e3CW9hJHsPgmeUz+zqzwa+gzHDTtdyapfOhrDHbALNBaskJavvFxjAG
rXs/kJaga35Z1AtGug6P//VQt5jOKx6VjBe51mQqphngJngD4gW2xr7Jh3zjSuJU
uwx7QiMwxdT2ysmQkwddEXm5B8Wjn4NqmxehkLSQWF+gi9P0al9uuYua17vbz5OA
sP3mpDYUsvPVUwPjYO+8c2eGuKFCIAwZBS01v1TtpjeEMCLqIZAAVcGpx1jwN2H/
XIFLQaf06CvqvB4IqErNgoXfqVV/B/X0kCnHVEfu0AD8yrZ7sT7EVo/FtFF8/DtD
yd7p3/+x+7z34LPUf6uhpjzyyko5gPZpFXILYSFACxhDO8ayX95PEQazQbmGnG0U
pLanIRga3lIxoCaGXaFetBHOCeSiqWxBs9SPO7r3gWYQmBv15VPLhR4q+9lSjoFT
O25niK3n7hgpuT40FfAcLgnftvycNIrTK9SWQbEeOKGH0G2Rq1rdk74zcgmlnQEM
DjucMFzuoftYsJlq8HN2nPrwr7P07N6F0eFapyTH3xfGj3O1zbKroiosXZEFJDTo
tl/VwfSg8bbGG/Zbc+/D+ZIvD+ovCWItkKoKJqB7j+lZJmbCzvc=
=0mlA
-----END PGP SIGNATURE-----

--tgjajudtqqajoprm--
