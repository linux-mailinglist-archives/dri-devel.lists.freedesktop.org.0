Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43443A6C2F7
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 20:06:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 926F010E823;
	Fri, 21 Mar 2025 19:06:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JA2dCgJo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3EA810E823
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 19:06:13 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 53E4D220;
 Fri, 21 Mar 2025 20:04:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1742583867;
 bh=XQhRMao7IIt/6DRLieEod+aEidzzMi98vtZ3vLD3dNk=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=JA2dCgJoqkADyajnRe40iMA8LOukmRZjsffnOBX1Dciv34ZpFJbkpSj9shLmELQ/M
 ECIb5uZ1wkZMzKE+8G5BW5nR421C4dN1hZ/+YSxbgsPZDgf/y3vePiMIGNXCi1ie0G
 UpkgMgOmayGxKob+u8E2HislxoylFMI/l+qVHA14=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <TY3PR01MB11346C6C1EBF9896A47E9807086DB2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250321172220.867165-1-kieran.bingham@ideasonboard.com>
 <TY3PR01MB11346C6C1EBF9896A47E9807086DB2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Subject: RE: [PATCH] drm: renesas: Extend RZ/G2L supported KMS formats
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Date: Fri, 21 Mar 2025 19:06:08 +0000
Message-ID: <174258396885.1099553.5413524831101034269@ping.linuxembedded.co.uk>
User-Agent: alot/0.10
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

Hi Biju,

Quoting Biju Das (2025-03-21 18:40:50)
> Hi Kieran,
>=20
> Thanks for the patch.
>=20
> > -----Original Message-----
> > From: Kieran Bingham <kieran.bingham@ideasonboard.com>
> > Sent: 21 March 2025 17:22
> > Subject: [PATCH] drm: renesas: Extend RZ/G2L supported KMS formats
> >=20
> > From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >=20
> > The RZ/G2L driver utilises the VSPD to read data from input sources.
> >=20
> > The rzg2l_du_kms component lists a restricted subset of the capabilitie=
s of the VSPd which prevents
>=20
> VSPD
>=20
> > additional formats from being used for display planes.
> >=20
> > The supported display plane formats are mapped in rzg2l_du_vsp_formats[=
].
> >=20
> > Extend the rzg2l_du_format_infos[] table with the corresponding mapping=
s between the supported DRM
> > formats and the formats exposed by the VSP in rzg2l_du_vsp_formats, mai=
ntaining the same ordering in
> > both tables.
> >=20
> > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > ---
> >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c | 141 ++++++++++++++++++-
> >  1 file changed, 136 insertions(+), 5 deletions(-)
> >=20
> > Prior to this patch, kmstest reports all of these formats as supported =
by the Planes, but using them
> > fails during rzg2l_du_fb_create() as the corresponding format isn't fou=
nd in rzg2l_du_format_info.
> >=20
> > This patch now lets me capture and render pixelformats from the Mali-C5=
5 direct to an attached DSI
> > panel on the Kakip board.
>=20
> Previously I got a comment to remove all the formats from this table as D=
SI supports only 3 formats.

Indeed, I can see that the DSI only supports the three RGB variant
formats, but the RPF of the VPSD is very capable and does the pixel format
conversion for us here as I understand it!


> I agree VSPD has two planes(2 rpf-instances) which supports all these for=
mats.
>=20
> Mali-C55(n formats)-->LCDC(VSPD n formats)->DSI(3 formats)-->Panel
>=20
> Am I missing anything w.r.to the comment that I received previously.
> Otherwise patch LGTM.
>=20

I haven't looked completely, but as long as the VSPD is only configured
to /output/ the RGB formats to the DSI then I think this is fine,

> Cheers,
> Biju

Thanks,

Kieran

>=20
> >=20
> > Patch tested with kms-tests:
> >=20
> > PYTHONPATH=3D/usr/lib/aarch64-linux-gnu/python3.11/site-packages ./test=
s/kms-test-formats.py Testing
> > plane formats: SUCCESS
> >=20
> > admin@kakip:~/kms-tests$ cat FormatsTest.log U [66.967523] Testing plan=
e formats U [66.975763] Testing
> > connector DSI-1, CRTC 36, mode 720x1280 U [66.978480] Testing format Pi=
xelFormat.RGB332 U [70.143998]
> > Testing format PixelFormat.ARGB4444 U [73.357056] Testing format PixelF=
ormat.XRGB4444 U [76.574944]
> > Testing format PixelFormat.ARGB1555 U [79.805636] Testing format PixelF=
ormat.XRGB1555 U [83.016599]
> > Testing format PixelFormat.RGB565 U [86.230362] Testing format PixelFor=
mat.BGR888 U [89.444673]
> > Testing format PixelFormat.RGB888 U [92.677093] Testing format PixelFor=
mat.BGRA8888 U [95.904745]
> > Testing format PixelFormat.BGRX8888 U [99.119926] Testing format PixelF=
ormat.ARGB8888 U [102.350298]
> > Testing format PixelFormat.XRGB8888 U [105.579499] Testing format Pixel=
Format.UYVY U [108.878654]
> > Testing format PixelFormat.YUYV U [112.176515] Testing format PixelForm=
at.YVYU U [115.470090] Testing
> > format PixelFormat.NV12 U [118.767513] Testing format PixelFormat.NV21 =
U [122.065851] Testing format
> > PixelFormat.NV16 U [125.364001] Testing format PixelFormat.NV61 U [128.=
662145] Testing format
> > PixelFormat.YUV420 U [131.978102] Testing format PixelFormat.YVU420 U [=
135.292284] Testing format
> > PixelFormat.YUV422 U [138.623485] Testing format PixelFormat.YVU422 U [=
141.955083] Testing format
> > PixelFormat.YUV444 U [145.336759] Testing format PixelFormat.YVU444 U [=
148.761832] Test completed
> > successfully
> >=20
> >=20
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c b/drivers/gpu=
/drm/renesas/rz-
> > du/rzg2l_du_kms.c
> > index b1266fbd9598..a5e96f863172 100644
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
> > @@ -36,8 +36,61 @@
> >=20
> >  static const struct rzg2l_du_format_info rzg2l_du_format_infos[] =3D {
> >       {
> > -             .fourcc =3D DRM_FORMAT_XRGB8888,
> > -             .v4l2 =3D V4L2_PIX_FMT_XBGR32,
> > +             .fourcc =3D DRM_FORMAT_RGB332,
> > +             .v4l2 =3D V4L2_PIX_FMT_RGB332,
> > +             .bpp =3D 8,
> > +             .planes =3D 1,
> > +             .hsub =3D 1,
> > +     }, {
> > +             .fourcc =3D DRM_FORMAT_ARGB4444,
> > +             .v4l2 =3D V4L2_PIX_FMT_ARGB444,
> > +             .bpp =3D 16,
> > +             .planes =3D 1,
> > +             .hsub =3D 1,
> > +     }, {
> > +             .fourcc =3D DRM_FORMAT_XRGB4444,
> > +             .v4l2 =3D V4L2_PIX_FMT_XRGB444,
> > +             .bpp =3D 16,
> > +             .planes =3D 1,
> > +             .hsub =3D 1,
> > +     }, {
> > +             .fourcc =3D DRM_FORMAT_ARGB1555,
> > +             .v4l2 =3D V4L2_PIX_FMT_ARGB555,
> > +             .bpp =3D 16,
> > +             .planes =3D 1,
> > +             .hsub =3D 1,
> > +     }, {
> > +             .fourcc =3D DRM_FORMAT_XRGB1555,
> > +             .v4l2 =3D V4L2_PIX_FMT_XRGB555,
> > +             .bpp =3D 16,
> > +             .planes =3D 1,
> > +     }, {
> > +             .fourcc =3D DRM_FORMAT_RGB565,
> > +             .v4l2 =3D V4L2_PIX_FMT_RGB565,
> > +             .bpp =3D 16,
> > +             .planes =3D 1,
> > +             .hsub =3D 1,
> > +     }, {
> > +             .fourcc =3D DRM_FORMAT_BGR888,
> > +             .v4l2 =3D V4L2_PIX_FMT_RGB24,
> > +             .bpp =3D 24,
> > +             .planes =3D 1,
> > +             .hsub =3D 1,
> > +     }, {
> > +             .fourcc =3D DRM_FORMAT_RGB888,
> > +             .v4l2 =3D V4L2_PIX_FMT_BGR24,
> > +             .bpp =3D 24,
> > +             .planes =3D 1,
> > +             .hsub =3D 1,
> > +     }, {
> > +             .fourcc =3D DRM_FORMAT_BGRA8888,
> > +             .v4l2 =3D V4L2_PIX_FMT_ARGB32,
> > +             .bpp =3D 32,
> > +             .planes =3D 1,
> > +             .hsub =3D 1,
> > +     }, {
> > +             .fourcc =3D DRM_FORMAT_BGRX8888,
> > +             .v4l2 =3D V4L2_PIX_FMT_XRGB32,
> >               .bpp =3D 32,
> >               .planes =3D 1,
> >               .hsub =3D 1,
> > @@ -48,11 +101,89 @@ static const struct rzg2l_du_format_info rzg2l_du_=
format_infos[] =3D {
> >               .planes =3D 1,
> >               .hsub =3D 1,
> >       }, {
> > -             .fourcc =3D DRM_FORMAT_RGB888,
> > -             .v4l2 =3D V4L2_PIX_FMT_BGR24,
> > -             .bpp =3D 24,
> > +             .fourcc =3D DRM_FORMAT_XRGB8888,
> > +             .v4l2 =3D V4L2_PIX_FMT_XBGR32,
> > +             .bpp =3D 32,
> >               .planes =3D 1,
> >               .hsub =3D 1,
> > +     }, {
> > +             .fourcc =3D DRM_FORMAT_UYVY,
> > +             .v4l2 =3D V4L2_PIX_FMT_UYVY,
> > +             .bpp =3D 16,
> > +             .planes =3D 1,
> > +             .hsub =3D 2,
> > +     }, {
> > +             .fourcc =3D DRM_FORMAT_YUYV,
> > +             .v4l2 =3D V4L2_PIX_FMT_YUYV,
> > +             .bpp =3D 16,
> > +             .planes =3D 1,
> > +             .hsub =3D 2,
> > +     }, {
> > +             .fourcc =3D DRM_FORMAT_YVYU,
> > +             .v4l2 =3D V4L2_PIX_FMT_YVYU,
> > +             .bpp =3D 16,
> > +             .planes =3D 1,
> > +             .hsub =3D 2,
> > +     }, {
> > +             .fourcc =3D DRM_FORMAT_NV12,
> > +             .v4l2 =3D V4L2_PIX_FMT_NV12M,
> > +             .bpp =3D 12,
> > +             .planes =3D 2,
> > +             .hsub =3D 2,
> > +     }, {
> > +             .fourcc =3D DRM_FORMAT_NV21,
> > +             .v4l2 =3D V4L2_PIX_FMT_NV21M,
> > +             .bpp =3D 12,
> > +             .planes =3D 2,
> > +             .hsub =3D 2,
> > +     }, {
> > +             .fourcc =3D DRM_FORMAT_NV16,
> > +             .v4l2 =3D V4L2_PIX_FMT_NV16M,
> > +             .bpp =3D 16,
> > +             .planes =3D 2,
> > +             .hsub =3D 2,
> > +     }, {
> > +             .fourcc =3D DRM_FORMAT_NV61,
> > +             .v4l2 =3D V4L2_PIX_FMT_NV61M,
> > +             .bpp =3D 16,
> > +             .planes =3D 2,
> > +             .hsub =3D 2,
> > +     }, {
> > +             .fourcc =3D DRM_FORMAT_YUV420,
> > +             .v4l2 =3D V4L2_PIX_FMT_YUV420M,
> > +             .bpp =3D 12,
> > +             .planes =3D 3,
> > +             .hsub =3D 2,
> > +     }, {
> > +             .fourcc =3D DRM_FORMAT_YVU420,
> > +             .v4l2 =3D V4L2_PIX_FMT_YVU420M,
> > +             .bpp =3D 12,
> > +             .planes =3D 3,
> > +             .hsub =3D 2,
> > +     }, {
> > +             .fourcc =3D DRM_FORMAT_YUV422,
> > +             .v4l2 =3D V4L2_PIX_FMT_YUV422M,
> > +             .bpp =3D 16,
> > +             .planes =3D 3,
> > +             .hsub =3D 2,
> > +     }, {
> > +             .fourcc =3D DRM_FORMAT_YVU422,
> > +             .v4l2 =3D V4L2_PIX_FMT_YVU422M,
> > +             .bpp =3D 16,
> > +             .planes =3D 3,
> > +             .hsub =3D 2,
> > +     }, {
> > +             .fourcc =3D DRM_FORMAT_YUV444,
> > +             .v4l2 =3D V4L2_PIX_FMT_YUV444M,
> > +             .bpp =3D 24,
> > +             .planes =3D 3,
> > +             .hsub =3D 1,
> > +     }, {
> > +             .fourcc =3D DRM_FORMAT_YVU444,
> > +             .v4l2 =3D V4L2_PIX_FMT_YVU444M,
> > +             .bpp =3D 24,
> > +             .planes =3D 3,
> > +             .hsub =3D 1,
> >       }
> >  };
> >=20
> > --
> > 2.48.1
>
