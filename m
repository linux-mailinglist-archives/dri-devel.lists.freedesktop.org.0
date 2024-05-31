Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5888D625E
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 15:07:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE53210E5C9;
	Fri, 31 May 2024 13:07:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="clhIQ4gS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78C9B10E5C9
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 13:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1717160821;
 bh=Gysdjfj+HqOXnRL+AUVd8SZVjhHIt+02/qHfmXbJw7o=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=clhIQ4gSQyiGW5phyxgxdd84B5foEK4VYnSQeq7DvUgYHbzwAaVIZ2bXWBjCo92mi
 T7C52wwHQdzZj+DAUSzgogofYO03sRnI3o3Ursd2JAvwEe7jG6S569hQNb8wJOlfcB
 4AGkX5k56LBN61L2U3WN/E0Xm6Rb3QkqA9CQE/WsE4Vp2Sa125tTRiF3eeVN4BhCfl
 8ye7v/9dKYkuT5+wRTMs2oBsCktswU4OMHiZZyytPjAjgyQW32PC1Q0DJfITlw54ul
 Oqf/HJPIqcIuEbDkMw2ypDA/RtHiBHpi2cN8jypub8M5POIIG+3HKIWQ75pInM7hDq
 QNakC+O45csXQ==
Received: from nicolas-tpx395.localdomain (cola.collaboradmins.com
 [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nicolas)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 717D537821AD;
 Fri, 31 May 2024 13:06:57 +0000 (UTC)
Message-ID: <84d2a7f87add1829fce20495a6b6e0b399381925.camel@collabora.com>
Subject: Re: [PATCH v6,14/24] media: mediatek: vcodec: Add capture format to
 support one plane memory
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Andrzej Pietrasiewicz
 <andrzej.p@collabora.com>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>, Jeffrey Kardatzke
 <jkardatzke@google.com>, =?ISO-8859-1?Q?N=EDcolas?= "F . R . A . Prado"
 <nfraprado@collabora.com>, Nathan Hebert <nhebert@chromium.org>, Hans
 Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Sebastian Fricke
 <sebastian.fricke@collabora.com>, Tomasz Figa <tfiga@chromium.org>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Yong Wu <yong.wu@mediatek.com>,  Hsin-Yi Wang
 <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter
 <daniel@ffwll.ch>,  Steve Cho <stevecho@chromium.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Brian Starkey <Brian.Starkey@arm.com>, John
 Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Matthias
 Brugger <matthias.bgg@gmail.com>,  linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
Date: Fri, 31 May 2024 09:06:51 -0400
In-Reply-To: <CAGXv+5Hg-61qQEiPScqEfO6irHnaJHHqcr=MYX=89RzUBRK7oA@mail.gmail.com>
References: <20240516122102.16379-1-yunfei.dong@mediatek.com>
 <20240516122102.16379-15-yunfei.dong@mediatek.com>
 <1d4618ac-4316-495d-afdb-5849e4b1e805@collabora.com>
 <537a0969-afdf-4e48-a640-2d8fc665c964@collabora.com>
 <CAGXv+5Hg-61qQEiPScqEfO6irHnaJHHqcr=MYX=89RzUBRK7oA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0
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

Hi,

Le jeudi 23 mai 2024 =C3=A0 18:36 +0800, Chen-Yu Tsai a =C3=A9crit=C2=A0:
> On Thu, May 23, 2024 at 6:14=E2=80=AFPM Andrzej Pietrasiewicz
> <andrzej.p@collabora.com> wrote:
> >=20
> > Hi,
> >=20
> > I'm having second thoughts, please see inline,
> >=20
> > W dniu 22.05.2024 o 14:26, Andrzej Pietrasiewicz pisze:
> > > Hi Yunfei,
> > >=20
> > > W dniu 16.05.2024 o 14:20, Yunfei Dong pisze:
> > > > Define one uncompressed capture format V4L2_PIX_FMT_MS21 in order t=
o
> > > > support one plane memory. The buffer size is luma + chroma, luma is
> > > > stored at the start and chrome is stored at the end.
> > > >=20
> > > > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > > > ---
> > > >   Documentation/userspace-api/media/v4l/pixfmt-reserved.rst | 8 +++=
+++++
> > > >   drivers/media/v4l2-core/v4l2-common.c                     | 2 ++
> > > >   drivers/media/v4l2-core/v4l2-ioctl.c                      | 1 +
> > > >   include/uapi/linux/videodev2.h                            | 1 +
> > > >   4 files changed, 12 insertions(+)
> > > >=20
> > > > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-reserved.=
rst b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
> > > > index 886ba7b08d6b..6ec899649d50 100644
> > > > --- a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
> > > > +++ b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
> > > > @@ -295,6 +295,14 @@ please make a proposal on the linux-media mail=
ing list.
> > > >         - Compressed format used by Nuvoton NPCM video driver. This=
 format is
> > > >           defined in Remote Framebuffer Protocol (RFC 6143, chapter=
 7.7.4 Hextile
> > > >           Encoding).
> > > > +    * .. _V4L2-PIX-FMT-MS21:
> > > > +
> > > > +      - ``V4L2_PIX_FMT_MS21``
> > > > +      - 'MS21'
> > > > +      - This format has one plane, luma and chroma are stored in a=
 contiguous
> > >=20
> > > Maybe s/one/single ?
> > >=20
> > > > +        memory. Luma pixel in 16x32 tiles at the start, chroma pix=
el in 16x16
> > >=20
> > > maybe the word "pixel" is reduntant here? What else than pixels could=
 tile sizes mean?
> > > Any padding between luma and chroma?
> > >=20
> > > > +        tiles at the end. The image height must be aligned with 32=
 and the image
> > > > +        width must be aligned with 16.
> > >=20
> > > Maybe aligned to?
> > >=20
> > > >   .. raw:: latex
> > > >       \normalsize
> > > > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/=
v4l2-core/v4l2-common.c
> > > > index 4165c815faef..5ae54cf48dc7 100644
> > > > --- a/drivers/media/v4l2-core/v4l2-common.c
> > > > +++ b/drivers/media/v4l2-core/v4l2-common.c
> > > > @@ -271,6 +271,8 @@ const struct v4l2_format_info *v4l2_format_info=
(u32 format)
> > > >             .block_w =3D { 16, 8, 0, 0 }, .block_h =3D { 32, 16, 0,=
 0 }},
> > > >           { .format =3D V4L2_PIX_FMT_MT2110R, .pixel_enc =3D V4L2_P=
IXEL_ENC_YUV, .mem_planes =3D 2, .comp_planes =3D 2, .bpp =3D { 5, 10, 0, 0=
 }, .bpp_div =3D { 4, 4, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2,
> > > >             .block_w =3D { 16, 8, 0, 0 }, .block_h =3D { 32, 16, 0,=
 0 }},
> > > > +        { .format =3D V4L2_PIX_FMT_MS21, pixel_enc =3D V4L2_PIXEL_=
ENC_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 }, .b=
pp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2,
> > > > +          .block_w =3D { 16, 8, 0, 0 }, .block_h =3D { 32, 16, 0, =
0 }},
> > > >           /* YUV planar formats */
> > > >           { .format =3D V4L2_PIX_FMT_NV12,    .pixel_enc =3D V4L2_P=
IXEL_ENC_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 =
}, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
> > > > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v=
4l2-core/v4l2-ioctl.c
> > > > index 4c76d17b4629..3a68f2b9e7a4 100644
> > > > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > > > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > > @@ -1529,6 +1529,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtd=
esc *fmt)
> > > >           case V4L2_PIX_FMT_MT2110T:    descr =3D "Mediatek 10bit T=
ile Mode"; break;
> > > >           case V4L2_PIX_FMT_MT2110R:    descr =3D "Mediatek 10bit R=
aster Mode"; break;
> > > >           case V4L2_PIX_FMT_HEXTILE:    descr =3D "Hextile Compress=
ed Format"; break;
> > > > +        case V4L2_PIX_FMT_MS21:        descr =3D "MediaTek One Pla=
ne Format"; break;
> > >=20
> > > s/One/Single ?
> > >=20
> >=20
> > On the other hand "single" would be [in this case incorrectly] associat=
ed with
> > single-planar API, which would be totally confusing.
> >=20
> > Still, the reality you are trying to model is complex: you use
> > MPLANE, yet there's a single plane in case of secure playback.
>=20
> I don't think that's a problem though. The NV12 format (seen above in
> the diff context) has the same attributes: 1 contiguous memory plane
> containing two component planes.
>=20
> And it's perfectly fine for MPLANE drivers to support these formats,
> Hantro being one of them that decodes to NV12. If a decoder can decode
> into discontiguous buffers, it surely can decode into contiguous ones;
> just set the second/third buffer address to the correct offset into
> the first buffer based on the format layout.

There is some complexity and limitations not disclose here, but in 99% of t=
he
cases I agree.

>=20
> In retrospect we probably should have named "MM21" as "MM21M" to denote
> that it is multi-memory-plane, and this "MS21" would have been "MM21",
> having a single contiguous memory plane.
>=20
> And the MPLANE driver supporting "single memory plane" oddity gets
> resolved if the API rework ever gets finished.

Not clear what you are proposing here, since its too late to rename MM21. I
agree with you there is no problem adding single allocation version of MM21=
 to
save on secure zones, and this is intented to be support by the MPLANE API =
too.

Though, on the other side, I'm thinking its an internal limitation that we =
must
have multiple allocation when using planar formats. We could certainly expo=
rt
twice the same dmabuf, in that capture case, data_offset would be used with=
 its
original design (driver provided). In fact, if we remove this internal
limitation, we could stop the proliferation of duplicated pixel formats in =
V4L2
which is quite a bad design error in my opinion.

Nicolas

>=20
>=20
> Regards,
> ChenYu
>=20
> > Regards,
> >=20
> > Andrzej
> >=20
> >=20
> > > Regards,
> > >=20
> > > Andrzej
> > >=20
> > > >           default:
> > > >               if (fmt->description[0])
> > > >                   return;
> > > > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/vi=
deodev2.h
> > > > index 89eb1a3c6555..7aff2f2c8f9c 100644
> > > > --- a/include/uapi/linux/videodev2.h
> > > > +++ b/include/uapi/linux/videodev2.h
> > > > @@ -800,6 +800,7 @@ struct v4l2_pix_format {
> > > >   #define V4L2_PIX_FMT_MM21     v4l2_fourcc('M', 'M', '2', '1') /* =
Mediatek 8-bit block mode, two non-contiguous planes */
> > > >   #define V4L2_PIX_FMT_MT2110T  v4l2_fourcc('M', 'T', '2', 'T') /* =
Mediatek 10-bit block tile mode */
> > > >   #define V4L2_PIX_FMT_MT2110R  v4l2_fourcc('M', 'T', '2', 'R') /* =
Mediatek 10-bit block raster mode */
> > > > +#define V4L2_PIX_FMT_MS21     v4l2_fourcc('M', 'S', '2', '1') /* M=
ediaTek 8-bit block mode with one plane */
> > > >   #define V4L2_PIX_FMT_INZI     v4l2_fourcc('I', 'N', 'Z', 'I') /* =
Intel Planar Greyscale 10-bit and Depth 16-bit */
> > > >   #define V4L2_PIX_FMT_CNF4     v4l2_fourcc('C', 'N', 'F', '4') /* =
Intel 4-bit packed depth confidence information */
> > > >   #define V4L2_PIX_FMT_HI240    v4l2_fourcc('H', 'I', '2', '4') /* =
BTTV 8-bit dithered RGB */
> > >=20
> >=20

