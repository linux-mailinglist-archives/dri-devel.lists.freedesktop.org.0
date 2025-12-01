Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A7AC98653
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 18:02:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5518710E420;
	Mon,  1 Dec 2025 17:02:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jr7StedP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 978D410E0D4;
 Mon,  1 Dec 2025 17:02:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A07CE6014A;
 Mon,  1 Dec 2025 17:01:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5905C116C6;
 Mon,  1 Dec 2025 17:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764608519;
 bh=bmyTq2q+hM5yLfaOwvV4mt3DtxhrkyZjZ87SLQzIRvc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jr7StedPEyC4/M1t7fb11w5L7eX7EwY91G07P7AMGijfckxto+L1WhwGZsjlsXYIY
 oPOBlsHBliJM+a+Ck+s95tJX7dUkcTP5pveCNFp/krPg4vR0LXWKAYEHPMZFH7BnSa
 w/jmhdgHtlBNuR767BlzygS7X3PXNC6OjSXYaqFQBISNpnI6dO3zRh4SkdSFewBq7X
 zREFhG+p8OGRGjPPiSi80gwvkw0y85GNS/W5tNjwqV7H9L1DBf2eLGS8ArX4PFGdca
 NRClciXygKLJ3Mf0U36BtEe3k+YhGpk6jI8Jy8BC6oYJJRGMbYG05OQchgkdz3i2TA
 5RsxeDtcuuY4Q==
Date: Mon, 1 Dec 2025 18:01:56 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Daniel Stone <daniel@fooishbar.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, 
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Liu Ying <victor.liu@nxp.com>, Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 00/11] drm/connector: hdmi: limit infoframes per
 driver capabilities
Message-ID: <20251201-enlightened-zebu-from-asgard-5a20be@houat>
References: <20250925-fervent-merry-beagle-2baba3@penduick>
 <qx5ashx62pufott6hnsfna3qntnoyvxwxze4rihhuxcsdxi37s@bbdvc3sfsgne>
 <20250929-gregarious-worm-of-memory-c5354d@houat>
 <itgffxygopi7etkt7xhvmyuvyl5ad3k43nsxvjzw3ubtwiikn7@ocugfdaigtu7>
 <20251003-uptight-echidna-of-stamina-815305@houat>
 <zpygq4kapil3swsmhhqkdwny4ry2dznnzixsw5rkza5p2kqnvp@abvf2vxlbwif>
 <2a5fitdzr2bz235fj6rvqzxr6ckszkjbazjfszlvnizdh2cvbt@w3ypjo7vahhs>
 <pibxhl5hlcpuk3zsgyienfdlda5cwuxrnofwlw356scuzzplqy@zw3ofelgvwik>
 <bsoqyzxi45i67jpzhwr2d4illufa5ghqf25z6flbp67lsbvh22@rrlcihp2oxea>
 <cgzclxjubj5oca3rdnv44qwrkmpddxve4tlz76cc6p3b4hz3oc@3l7mt5ha7do6>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="nhtgib353qneclwb"
Content-Disposition: inline
In-Reply-To: <cgzclxjubj5oca3rdnv44qwrkmpddxve4tlz76cc6p3b4hz3oc@3l7mt5ha7do6>
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


--nhtgib353qneclwb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 00/11] drm/connector: hdmi: limit infoframes per
 driver capabilities
MIME-Version: 1.0

On Fri, Nov 21, 2025 at 07:09:01PM +0200, Dmitry Baryshkov wrote:
> > So it's not really impossible, you just need some hardware and a day's
> > worth of work.
> >=20
> > There's no reason these should get a pass, it's breaking the spec for no
> > reason.
> >=20
> > > > For SPD, It's really not clear to me why atomic_check should do tha=
t in
> > > > the first place. Your initial concern was about exposing infoframes=
 in
> > > > debugfs that wouldn't be used by the driver.
> > > >=20
> > > > If the driver doesn't register a debugfs file for SPD, and ignores
> > > > whatever is in the atomic state, what's should we force drivers to =
do
> > > > that?
> > >=20
> > > I really don't think that drivers should mess up with debugfs on their
> > > own. Making atomic_check() disable the unsupported InfoFrames makes t=
he
> > > picture perfect: the DRM no longer tries to program them to the
> > > hardware, DebugFS files stay empty, so the whole state becomes
> > > consistent.
> >=20
> > In the "bridge has no access to infoframes" case, there's really no
> > infoframe. An empty file is "the infoframe can be there but isn't used",
> > not "we don't have access to it and can't report them". Only drivers
> > have those infos.
> >=20
> > If we do split up write_infoframe into multiple functions though, I
> > guess we could create the debugfs file only if the function pointer is
> > set, which removes drivers' involvement if you don't like that.
>=20
> I'm fine with not using HDMI connector framework for lt9611uxc.
> Likewise, I think, it's fine to have empty files for the infoframes
> which are not being sent over the wire for any reason (hw not supporting
> it is one of the reasons).

I can't think of any other example in the kernel where an empty file
means that the driver doesn't support something.

Maxime

--nhtgib353qneclwb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaS3KBAAKCRAnX84Zoj2+
dpehAX9df8UFvZVN58dQXWwnBnuke2vOU1UxT4zbhxIdR/6V/O2rER74TkmbviQv
h0HIhF0BgLOgEP5gmSlL9xZCFl5EWhJpy16T7ozKZGULaHEy/3NJR+/SzYOZmLZ5
yR5aU4SDRQ==
=m4w1
-----END PGP SIGNATURE-----

--nhtgib353qneclwb--
