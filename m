Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9794346CF
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 10:25:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 183A56E8D8;
	Wed, 20 Oct 2021 08:25:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D460B6E8D2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 08:25:16 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id j21so13564801lfe.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 01:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=Vivsq86AQ/CLsPuXB4L/G859j6z2u+eKtIxWrc/VSoU=;
 b=AkhmSEFbfTYIzt6aK4jNw6UvlcWx8vsiKiEOiZeVsxjbURqDlvBf6NCVoQM5TZv9Pg
 bRwXrntx4YckcDv55byBN3WCqrAZRAcjfPw0YKVuGwjo8RUilAN6J1KFWZ9cOHpyA8e7
 OuBTs2CoO9/6kS8rvVakGaXHGm/oo7ec8jir6SWOJ7SaJ+f1b3HF0VjtAE5l5t3zCLV7
 BagTEr2n7Eh6/DKcnHX04/6UIEyCZUNDc2u9KAK4LcwM0EsgBkBx3MR4ffu3Ih96SiVZ
 k5dSqpvApQi+RKtEbTvuDfWUd6oio6nEzcCjYpkhNLbNyOTws5h/9USwyKvcfCIbqfd1
 3Pag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=Vivsq86AQ/CLsPuXB4L/G859j6z2u+eKtIxWrc/VSoU=;
 b=kiW6oa4rbACkD/K1KXhBG7M5WOL4mbIAb+8y6Ix6Bh5vYCNLufYfh0Ql+Ftz2zk5Aq
 svmQb3PInhW4wXozx/39NvLGmnezn5XGUdZi20Xc3CPnpIpsS9OgEM4oiQAn5PVKhMu/
 HPwICUcC/iO8cqnz02oRsKOd1dl2LZXBTVPrrHu2xPivSuL9cthgRIcYBBGbWjKrDkip
 40IEymtzpXd4snYE3HGAzTUb0B9NjD5Yw+U8SUWFPCwx7zRs3i4XazhEZVw2MRx1Wg48
 9hFXMbfZ43BvOF6VX4FghHwHAK1ZSYqFIgVnGtYq1Uo68Tfg/L1ywVFpVUOfEYuQiigs
 YLrQ==
X-Gm-Message-State: AOAM531XtIVDn1B5IFugorzAsRqPlc7QOMA/K7Qhbz1DhQiSTtYs+ZfR
 HG5XXez25EofEYdzj+aeHOs=
X-Google-Smtp-Source: ABdhPJz0JOlWICPnPtH+Q5H9AvWKxHU7eg1k9b6+sMv1vo+YKE++RoM+CFDQG8IoAJB79PyVsQoymg==
X-Received: by 2002:a05:6512:3049:: with SMTP id
 b9mr10562256lfb.660.1634718314972; 
 Wed, 20 Oct 2021 01:25:14 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id q10sm133956lfe.294.2021.10.20.01.25.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 01:25:14 -0700 (PDT)
Date: Wed, 20 Oct 2021 11:25:11 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
Cc: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 hamohammed.sa@gmail.com, daniel@ffwll.ch, airlied@linux.ie,
 contact@emersion.fr, leandro.ribeiro@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] drm: vkms: Refactor the plane composer to accept
 new formats
Message-ID: <20211020112511.0b6b93ba@eldfell>
In-Reply-To: <c623cfdd-1b0c-0e15-b36e-e74119c41031@gmail.com>
References: <20211005201637.58563-1-igormtorrente@gmail.com>
 <20211005201637.58563-7-igormtorrente@gmail.com>
 <20211018113009.5519457c@eldfell>
 <d5f92494-9c55-2b7d-6107-6048abb41759@gmail.com>
 <20211019110535.18f56272@eldfell>
 <c623cfdd-1b0c-0e15-b36e-e74119c41031@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NoW6hr+ZxT5QKTLil8YPtyD";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_/NoW6hr+ZxT5QKTLil8YPtyD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 19 Oct 2021 18:10:57 -0300
Igor Matheus Andrade Torrente <igormtorrente@gmail.com> wrote:

> Hi Pekka,
>=20
> On 10/19/21 5:05 AM, Pekka Paalanen wrote:
> > On Mon, 18 Oct 2021 16:26:06 -0300
> > Igor Matheus Andrade Torrente <igormtorrente@gmail.com> wrote:
> >  =20
> >> Hi Pekka,
> >>
> >> On 10/18/21 5:30 AM, Pekka Paalanen wrote: =20
> >>> On Tue,  5 Oct 2021 17:16:37 -0300
> >>> Igor Matheus Andrade Torrente <igormtorrente@gmail.com> wrote:
> >>>     =20
> >>>> Currently the blend function only accepts XRGB_8888 and ARGB_8888
> >>>> as a color input.
> >>>>
> >>>> This patch refactors all the functions related to the plane composit=
ion
> >>>> to overcome this limitation.
> >>>>
> >>>> Now the blend function receives a format handler to each plane and a
> >>>> blend function pointer. It will take two ARGB_1616161616 pixels, one
> >>>> for each handler, and will use the blend function to calculate and
> >>>> store the final color in the output buffer.
> >>>>
> >>>> These format handlers will receive the `vkms_composer` and a pair of
> >>>> coordinates. And they should return the respective pixel in the
> >>>> ARGB_16161616 format.
> >>>>
> >>>> The blend function will receive two ARGB_16161616 pixels, x, y, and
> >>>> the vkms_composer of the output buffer. The method should perform the
> >>>> blend operation and store output to the format aforementioned
> >>>> ARGB_16161616. =20
> >>>
> >>> Hi,
> >>>
> >>> here are some drive-by comments which you are free to take or leave.
> >>>
> >>> To find more efficient ways to do this, you might want research=20
> >>> library. It's MIT licensed.
> >>>
> >>> IIRC, the elementary operations there operate on pixel lines (pointer=
 +
> >>> length), not individual pixels (image, x, y). Input conversion functi=
on
> >>> reads and converts a whole line a time. Blending function blends two
> >>> lines and writes the output into back one of the lines. Output
> >>> conversion function takes a line and converts it into destination
> >>> buffer. That way the elementary operations do not need to take stride
> >>> into account, and blending does not need to deal with varying memory
> >>> alignment FWIW. The inner loops involve much less function calls and
> >>> state, probably. =20
> >>
> >> I was doing some rudimentary profiling, and I noticed that the code
> >> spends most of the time with the indirect system call overhead and not
> >> the actual computation. This can definitively help with it. =20
> >=20
> > Hi,
> >=20
> > I suppose you mean function (pointer) call, not system call? =20
>=20
> Yes, I misspelled it.
>=20
> >=20
> > Really good that you have already profiled things. All optimisations
> > should be guided by profiling, otherwise they are just guesses (and I
> > got lucky this time I guess).
> >  =20
> >>> Pixman may not do exactly this, but it does something very similar.
> >>> Pixman also has multiple different levels of optimisations, which may
> >>> not be necessary for VKMS.
> >>>
> >>> It's a trade-off between speed and temporary memory consumed. You need
> >>> temporary buffers for two lines, but not more (not a whole image in
> >>> full intermediate precision). Further optimisation could determine
> >>> whether to process whole image rows as lines, or split a row into
> >>> multiple lines to stay within CPU cache size.
> >>>     =20
> >>
> >> Sorry, I didn't understand the idea of the last sentence. =20
> >=20
> > If an image is very wide, a single row could still be relatively large
> > in size (bytes). If it is large enough that the working set falls out
> > of a faster CPU cache into a slower CPU cache (or worse yet, into RAM
> > accesses), performance may suffer and become memory bandwidth limited
> > rather than ALU rate limited. Theoretically that can be worked around
> > by limiting the maximum size of a line, and splitting an image row into
> > multiple lines. =20
>=20
> Got it now, thanks.
>=20
> >=20
> > However, this is an optimisation one probably should not do until there
> > is performance profiling data showing that it actually is useful. The
> > optimal line size limit depends on the CPU model as well. So it's a bit
> > far out, but something you could keep in mind just in case. =20
>=20
> OK. For now I will not deal with this complexity, and if necessary I
> will revisit it latter.
>=20
> >  =20
> >>> Since it seems you are blending multiple planes into a single
> >>> destination which is assumed to be opaque, you might also be able to =
do
> >>> the multiple blends without convert-writing and read-converting to/fr=
om
> >>> the destination between every plane. I think that might be possible to
> >>> architect on top of the per-line operations still. =20
> >>
> >> I tried it. But I don't know how to do this without looking like a mes=
s. =20
>=20
> I don't think it changes anything, but I forgot to mention that I tried
> it with the blend per pixel and not a per line.

Hi,

I believe that can get messy per-pixel, yeah. You kind of want to keep
the per-pixel (inner loop) operations as fast as possible, and that
naturally tends to lead to contorted code as you try to optimise it
(prematurely perhaps).

I would expect per-line code to be cleaner, because there is less state
to be handled in the inner loop, and the outer loops spin rarely enough
that you can afford to write more clear code.

> > Dedicate one of the temporary line buffers for the destination, and
> > instead of writing it out and loading it back for each input plane,
> > leave it in place over all planes and write it out just once at the end.
> >=20
> > I do expect more state tracking needed. You need to iterate over the
> > list of planes for each output row, extract only the used part of an
> > input plane's buffer into the other temporary line buffer, and offset
> > the destination line buffer and length to match when passing those into
> > a blending function.+ =20
>=20
> It's exactly this state tracking that was a mess when I was trying to
> implement something similar. But this is one more thing that probably
> I will have to revisit later.

Mind the difference between state tracking in the inner loop vs. the
outer loops. Per-line, inner loop becomes simpler while the outer loops
become slightly more complicated, but it should be a net win, because
the outer loops spin fewer times.

When nesting gets too deep, code becomes a mess, or the number of local
variables in a function grows too far, it usually helps to split things
into more functions. The compiler will inline them for you
automatically when that is beneficial.

Function pointer calls cannot usually be inlined, hence they should be
kept out of the innermost loop.

> > It's not an obvious win but a trade-off, so profiling is again needed.
> >=20
> > Btw. the use of temporary line buffers should also help with
> > implementing scaling. You could do the filtering during reading of the
> > input buffer. If the filter is not nearest, meaning you need to access
> > more than one input pixel per pixel-for-blending, there are a few ways
> > to go about that. You could do the filtering during the input buffer
> > reading, or you could load two input buffer rows into temporary line
> > buffers and do filtering as a separate step into yet another line
> > buffer. As the composition advances from top to bottom, only one of the
> > input buffer rows will change at a time (during up-scaling) so you can
> > avoid re-loading a row by swapping the line buffers.
> >=20
> > This is getting ahead of things, so don't worry about scaling or
> > filtering yet. The first thing is to see if you can make the line
> > buffer approach give you a significant speed-up.
> >  =20
> >> Does the pixman perform some similar? =20
> >=20
> > No, Pixman composition operation has only three images: source,
> > mask, and destination. All those it can handle simultaneously, but
> > since there is no "multi-blending" API, it doesn't need to take care of
> > more.
> >=20
> > IIRC, Pixman also has a form of optimised operations that do blending
> > and converting to destination in the same pass. The advantage of that
> > is that blending can work with less precision when it knows what
> > precision the output will be converted to and it saves some bandwidth
> > by not needing to write-after-blending and read-for-conversion
> > intermediate precision values. The disadvantage is that the number of
> > needed specialised blending functions explodes by the number of
> > possible destination formats. Pixman indeed makes those specialised
> > functions optional, falling back to more generic C code. I would hope
> > that VKMS does not need to go this far in optimisations though. =20
>=20
> This should be plenty fast indeed. Maybe worth for formats that are
> extremely common.

My feeling says that it would be better to not aim that far at first,
and see how the per-line approach works with separate pluggable
read-conversion, blending, and write-conversion functions.

Besides, combined blend-write operations would probably conflict with
the idea of blending all planes first and then writing destination once.

There are KMS properties for different blending functions, so that's a
reason to make the blending function pluggable as well. Not just for a
potential optimisation to skip the X channel on input completely.

If you want to support background color property, that might be handled
with a special read-conversion function which just fills the temporary
line buffer with the background color.

It is always possible to get faster by writing more specialised
functions that can take advantage of more invariants/assumptions, but
you get a combinatorial explosion of specialisations.


Thanks,
pq

--Sig_/NoW6hr+ZxT5QKTLil8YPtyD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmFv0mcACgkQI1/ltBGq
qqcepw/8DT6qgPWBhP5DC7+NshQ7RI6qG7jRzl8z29WPF1uQ/0OcMKy1Oiv6gJg0
ALgRgXNVV+sfDE4oRkBPNL4o6L7ge0rZ+Pi9Y/e+zl6iaOFoUJtpQHKajbFscp8c
Gs/POk8fhx+ohUB1bQVPlgE0oN1ZgQtD0yR1pD1fuIU55KjdmCGd7vkhfDgJmyRE
EG+8kQPeXmE2TwZtD8tTVbsYugEazQd+hRnYBi2U7ux6u300mjKFaq0X4gcAZbn3
+Y3dtoPM1oEclZnJ5k0m/kZU0n5SNdJ4QMQCH1n0kzWwRUUuVJyMAIHa5GilH0C3
XBgV1B19YKOLCks1uA/68y0kJbcFbgoB/wKls5UiYZ/jDR1NCA6IZlzJ1VPTPUMA
6Q9QoVNPqegzjzkYhtiXYZseaflHxxID03ODBalxMJNAL0eL5PtkxNHi0TALVJJb
QB67+IKu8eUNRzKLwmiwuZv30hXHLsmMpR1ozFpujn/2i/Tax20yHQo4wqudtNPo
0+labp1rIvFIqDJOGCAUZhOdGzqgHQLNii9ep+6mZqOnMSx8Oy1Q6/wcYnI+PBnj
QFFFh+15HFBZ0TYmTuaH/yXTdLgyp91GJNpyGRy5tCZdO85pMt4XZ+DiBrQ2AJ8x
2hiuObBX9wOR69R0NKcjrNm9Z5Y6mJMMCX1GwHuID45FlTUC+6k=
=rQnj
-----END PGP SIGNATURE-----

--Sig_/NoW6hr+ZxT5QKTLil8YPtyD--
