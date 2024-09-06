Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BD896F618
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 15:58:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B721C10EA65;
	Fri,  6 Sep 2024 13:58:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mO98gDiI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 614DE10EA65
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 13:58:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7B3CEA44FD5;
 Fri,  6 Sep 2024 13:58:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D93B0C4CEC9;
 Fri,  6 Sep 2024 13:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725631103;
 bh=UsOmUVqDQNmD3noisM+j25d0nW4Fec14iHTYBS5IraM=;
 h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
 b=mO98gDiIIVIKieMLvIg9azVVIgKdPkXqWCTxrh4Sm10ZUXEw4A7Ahu0oKDeLiNyAP
 UubQgHFD2/4ol7EN5Cy/BpxcTZdQmQWxHEfMUjTmH9q3pdXmWPYTcIZndVR+H8xWXg
 /0/kJz5UGK85esOqpgugUD0qPhqJc+Tro3gHRM5Uyuf5P5JAitrvAdr0z8kei/4JNX
 v1n64WkiEAtKafmBvReoENkhWa+9EaQt4LeDUX7mG/jIJzW+ddLrD+WaOkXWrh/G53
 /jW1K8XBXGkIOCFdauuXDP0kBtDZABhPtCXPU2pptSaFfOEyoJMpXsNMlB9OrbBhwl
 GX9GdTNAygp8A==
Content-Type: multipart/signed;
 boundary=55c931de707a8ac28990aa7fc9bea0976aa99ad4829328b51d70b1f9638d;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 06 Sep 2024 15:58:18 +0200
Message-Id: <D3Z966PUEDVC.2HJCER9HHLTY7@kernel.org>
Subject: Re: [PATCH 07/20] drm/bridge: tc358775: use regmap instead of open
 coded access functions
Cc: "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, "Philipp Zabel" <p.zabel@pengutronix.de>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Sam Ravnborg"
 <sam@ravnborg.org>, "Vinay Simha BN" <simhavcs@gmail.com>, "Tony Lindgren"
 <tony@atomide.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Daniel Semkowicz" <dse@thaumatec.com>
X-Mailer: aerc 0.16.0
References: <20240506-tc358775-fix-powerup-v1-0-545dcf00b8dd@kernel.org>
 <20240506-tc358775-fix-powerup-v1-7-545dcf00b8dd@kernel.org>
 <CAHgnY3=JKUCRvTtw6NzLvm+hy_GeNigj0tjOmbFupEs+=8f6ZQ@mail.gmail.com>
In-Reply-To: <CAHgnY3=JKUCRvTtw6NzLvm+hy_GeNigj0tjOmbFupEs+=8f6ZQ@mail.gmail.com>
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

--55c931de707a8ac28990aa7fc9bea0976aa99ad4829328b51d70b1f9638d
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Daniel,

On Fri Sep 6, 2024 at 3:47 PM CEST, Daniel Semkowicz wrote:
> >         tc->i2c =3D client;
>
> so the assignment above is no longer correct and should
> be also removed. Otherwise, this code will not compile.


Ahh yes. Thanks for noticing. I have a wip patch which I didn't
post, which had this line removed. Will post a new version soon.

Probably also going to split the patches because it seems due to
the controversy in patch 01/20 this whole series is ignored.

-michael

--55c931de707a8ac28990aa7fc9bea0976aa99ad4829328b51d70b1f9638d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZtsKexIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/ipTQF9GUYkBrGWgFmmOGO2Uq3wbAB+Bhm/ksnD
WUfLXwJcGfojX55IOBZCeWf8pdDXdgLEAX9I/tyljsvtI8wAUgcMo9s/WDXEq0Z6
dsAH7yvsQBh8c6L/zZzsKbdTDzAxfZlBycg=
=74xc
-----END PGP SIGNATURE-----

--55c931de707a8ac28990aa7fc9bea0976aa99ad4829328b51d70b1f9638d--
