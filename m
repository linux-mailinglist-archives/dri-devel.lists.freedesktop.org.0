Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D6179A4F4
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 09:49:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E8A10E111;
	Mon, 11 Sep 2023 07:49:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09AE10E111;
 Mon, 11 Sep 2023 07:49:01 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id BE2A466072F4;
 Mon, 11 Sep 2023 08:48:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694418540;
 bh=yxwpTAPyHaYbVsbWh810fGVyGlWADLqxOAqOHIMcmJo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=C3ApnLRXYKyFNabPBH/6hhNdg3noz4gDCQjXf/ULk+LP1q2qjLBtbAd3RjPD3FPo7
 4vJ+P/Zv3+Oz/kej7k0yg5ASCSjTzEe4WPK1nNPybwsKDjMy1HWFJ3cZoRfTCdo1KV
 4Yf4pVixs24IVTXGSr3YlYExeUUK1esV6nkCKmiNvhKDo4fD0cwtHafF5xduI8W9Q/
 iDpPTwH+vyAi11PlvBMjYWONFfUamHqIj0enMp6OuGsC9fpTbxCiYIpW9fuF1kQpvA
 08jcUPIrLa7HgOKdh+uJkA6AZYiy8ReCB6b69hjJasrXOVyHOkK5/Vdr7FoNoX04Sc
 quoksSYvegGlQ==
Date: Mon, 11 Sep 2023 09:48:56 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Subject: Re: [PATCH v3 8/8] drm/drm-file: Show finer-grained BO sizes in
 drm_show_memory_stats
Message-ID: <20230911094856.5c89aee5@collabora.com>
In-Reply-To: <dgo4x2tbdqvpfjf7cnspq2xvvkacc7pv2rdk5fesrqcv2xr3pi@mbwmqsg742hu>
References: <20230905184533.959171-1-adrian.larumbe@collabora.com>
 <20230905184533.959171-9-adrian.larumbe@collabora.com>
 <20230906101101.04f4e1a2@collabora.com>
 <dgo4x2tbdqvpfjf7cnspq2xvvkacc7pv2rdk5fesrqcv2xr3pi@mbwmqsg742hu>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: tzimmermann@suse.de, sean@poorly.run, quic_abhinavk@quicinc.com,
 mripard@kernel.org, steven.price@arm.com, freedreno@lists.freedesktop.org,
 healych@amazon.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 marijn.suijten@somainline.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 9 Sep 2023 17:55:17 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> On 06.09.2023 10:11, Boris Brezillon wrote:
> >On Tue,  5 Sep 2023 19:45:24 +0100
> >Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:
> > =20
> >> The current implementation will try to pick the highest available size
> >> display unit as soon as the BO size exceeds that of the previous
> >> multiplier.
> >>=20
> >> By selecting a higher threshold, we could show more accurate size numb=
ers.
> >>=20
> >> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> >> ---
> >>  drivers/gpu/drm/drm_file.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>=20
> >> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> >> index 762965e3d503..0b5fbd493e05 100644
> >> --- a/drivers/gpu/drm/drm_file.c
> >> +++ b/drivers/gpu/drm/drm_file.c
> >> @@ -879,7 +879,7 @@ static void print_size(struct drm_printer *p, cons=
t char *stat,
> >>  	unsigned u;
> >> =20
> >>  	for (u =3D 0; u < ARRAY_SIZE(units) - 1; u++) {
> >> -		if (sz < SZ_1K)
> >> +		if (sz < (SZ_1K * 10000))
> >>  			break; =20
> >
> >This threshold looks a bit random. How about picking a unit that allows
> >us to print the size with no precision loss?
> >
> >	for (u =3D 0; u < ARRAY_SIZE(units) - 1; u++) {
> >		if (sz & (SZ_1K - 1))
> >			break;
> >	} =20
>=20
> In this case I picked up on Rob Clark's suggestion of choosing a hard lim=
it of
> perhaps 10k or 100k times the current unit before moving on to the next o=
ne.
> While this approach guarantees that we don't lose precision, it would ren=
der a
> tad too long a number in KiB for BO's that aren't a multiple of a MiB.

I'd expect big BOs to have their size naturally aligned on something
bigger than a 4k page anyway, so I don't expect multi-MB/GB buffers to
be using the KiB unit in practice. It's just that it's weird to have,
8MiB printed as 8192KiB when we could have used the upper unit,
because it's naturally aligned on a megabyte.

Maybe we should have something like that instead:

	for (u =3D 0; u < ARRAY_SIZE(units) - 1; u++) {
		if ((sz & (SZ_1K - 1)) &&
		    sz < UPPER_UNIT_THRESHOLD * SZ_1K)
			break;

		sz =3D div_u64(sz, SZ_1K);
	}
>=20
> >>  		sz =3D div_u64(sz, SZ_1K);
> >>  	} =20

