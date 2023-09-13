Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF6979E0EC
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 09:36:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D681E10E470;
	Wed, 13 Sep 2023 07:36:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F4FE10E470;
 Wed, 13 Sep 2023 07:36:42 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 29A3C6607319;
 Wed, 13 Sep 2023 08:36:40 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694590600;
 bh=BoaxSmoEMOcQoMOW33cqNIU5YTH3LaR/kBpDcxa9Mtg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MVB4UZdGG1sGVKpv2lA3Ecoc1NWOzsc+C/PO55PphJsf94STiVCVsDY2R3D7RQuHX
 bB1H6jIjjFuswdr7pyL0clLnmEFe+HCxHyGxdbtcBYuGrqCXanA+N7bnCL+1AMcvkH
 LXL1X03aCVuheK5YjaOj9xx1p2NS8aQegZoWzih2qDRGLz47mz5EfZ0sPHq2cBtkAh
 Hj0uPC6QxDFcjug7ldcQR6GDLm91ruCD4xhSTgZyJvp2cZLraWmPrSSC+1LnuArx7Q
 QlJXWR5lg3+vw19v7UzSZLgsrHSSW3UsR3xf6h8rTjg4rwtDi+dNYuKFPTKJ6mdK7c
 RW+DbDu7jt9FA==
Date: Wed, 13 Sep 2023 09:36:37 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v4 6/6] drm/drm-file: Show finer-grained BO sizes in
 drm_show_memory_stats
Message-ID: <20230913093637.2748d217@collabora.com>
In-Reply-To: <CAF6AEGup93tQMYrmx6iKex2Fxz+Yu5m-MMWPmeOQ4yx_Racnag@mail.gmail.com>
References: <20230912084044.955864-1-adrian.larumbe@collabora.com>
 <20230912084044.955864-7-adrian.larumbe@collabora.com>
 <20230912113210.65897aab@collabora.com>
 <CAF6AEGtzOS89V1vbobpSEb9KX8x9T0FfmkW2OAaxAKLs+GugKA@mail.gmail.com>
 <CAF6AEGup93tQMYrmx6iKex2Fxz+Yu5m-MMWPmeOQ4yx_Racnag@mail.gmail.com>
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
Cc: tzimmermann@suse.de, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 sean@poorly.run,
 =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>,
 quic_abhinavk@quicinc.com, mripard@kernel.org, steven.price@arm.com,
 freedreno@lists.freedesktop.org, healych@amazon.com,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 dmitry.baryshkov@linaro.org, marijn.suijten@somainline.org,
 kernel@collabora.com, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 12 Sep 2023 19:14:35 -0700
Rob Clark <robdclark@gmail.com> wrote:

> On Tue, Sep 12, 2023 at 6:46=E2=80=AFPM Rob Clark <robdclark@gmail.com> w=
rote:
> >
> > On Tue, Sep 12, 2023 at 2:32=E2=80=AFAM Boris Brezillon
> > <boris.brezillon@collabora.com> wrote: =20
> > >
> > > On Tue, 12 Sep 2023 09:37:00 +0100
> > > Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:
> > > =20
> > > > The current implementation will try to pick the highest available s=
ize
> > > > display unit as soon as the BO size exceeds that of the previous
> > > > multiplier. That can lead to loss of precision in BO's whose size is
> > > > not a multiple of a MiB.
> > > >
> > > > Fix it by changing the unit selection criteria.
> > > >
> > > > For much bigger BO's, their size will naturally be aligned on somet=
hing
> > > > bigger than a 4 KiB page, so in practice it is very unlikely their =
display
> > > > unit would default to KiB. =20
> > >
> > > Let's wait for Rob's opinion on this. =20
> >
> > This would mean that if you have SZ_1G + SZ_1K worth of buffers, you'd
> > report the result in KiB.. which seems like overkill to me, esp given
> > that the result is just a snapshot in time of a figure that
> > realistically is dynamic.

Yeah, my point was that, generally, such big buffers tend to have
a bigger size alignment (like 2MB for anything bigger than 1GB), but
maybe this assumption doesn't stand for all drivers.

> >
> > Maybe if you have SZ_1G+SZ_1K worth of buffers you should report the
> > result with more precision than GiB, but more than MiB seems a bit
> > overkill.
> >
> > BR,
> > -R
> > =20
> > > >
> > > > Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> > > > ---
> > > >  drivers/gpu/drm/drm_file.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> > > > index 762965e3d503..bf7d2fe46bfa 100644
> > > > --- a/drivers/gpu/drm/drm_file.c
> > > > +++ b/drivers/gpu/drm/drm_file.c
> > > > @@ -879,7 +879,7 @@ static void print_size(struct drm_printer *p, c=
onst char *stat,
> > > >       unsigned u;
> > > >
> > > >       for (u =3D 0; u < ARRAY_SIZE(units) - 1; u++) {
> > > > -             if (sz < SZ_1K) =20
>=20
> btw, I was thinking more along the lines of:
>=20
>    if (sz < 10*SZ_1K)
>=20
> (or perhaps maybe 100*SZ_1K)

I think I suggested doing that at some point:

		if ((sz & (SZ_1K - 1)) &&
		    sz < UPPER_UNIT_THRESHOLD * SZ_1K)
			break;

so we can keep using the upper unit if the size is a multiple of this
upper unit, even if it's smaller than the selected threshold.

>=20
> I mean, any visualization tool is going to scale the y axis based on
> the order of magnitude.. and if I'm looking at the fdinfo with my
> eyeballs I don't want to count the # of digits manually to do the
> conversion in my head.  The difference btwn 4 or 5 or maybe 6 digits
> is easy enough to eyeball, but more than that is too much for my
> eyesight, and I'm not seeing how it is useful ;-)
>=20
> But if someone really has a valid use case for having precision in 1KB
> then I'm willing to be overruled.

So, precision loss was one aspect, but my main concern was having
things displayed in KiB when they could have been displayed in MiB,
because the size is a multiple of a MiB but still not big enough to
pass the threshold test (which was set to 10000x in the previous
version).

> But I'm not a fan of the earlier
> approach of different drivers reporting results differently, the whole
> point of fdinfo was to have some standardized reporting.

Totally agree with that.

>=20
> BR,
> -R
>=20
> > > > +             if (sz & (SZ_1K - 1))
> > > >                       break;
> > > >               sz =3D div_u64(sz, SZ_1K);
> > > >       } =20
> > > =20

