Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDDD9F2E77
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 11:46:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9310F10E404;
	Mon, 16 Dec 2024 10:46:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77CD610E404
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 10:46:17 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1tN8c9-0000uX-MN; Mon, 16 Dec 2024 11:46:13 +0100
Message-ID: <a42981617e880d48e9614c9ab5a8892f7ae0a315.camel@pengutronix.de>
Subject: Re: [PATCH] drm/fourcc: add LINEAR modifiers with an exact pitch
 alignment
From: Lucas Stach <l.stach@pengutronix.de>
To: Michel =?ISO-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>, Marek
 =?UTF-8?Q?Ol=C5=A1=C3=A1k?= <maraeo@gmail.com>, dri-devel
 <dri-devel@lists.freedesktop.org>, amd-gfx mailing list
 <amd-gfx@lists.freedesktop.org>, ML Mesa-dev
 <mesa-dev@lists.freedesktop.org>
Date: Mon, 16 Dec 2024 11:46:13 +0100
In-Reply-To: <340ed70a-a576-43c6-86ff-9b58ed513c72@mailbox.org>
References: <CAAxE2A5BkF13bFt8_UnuiqPM8W-ZESgmKEjqqGfv=DGzSfJ7aQ@mail.gmail.com>
 <340ed70a-a576-43c6-86ff-9b58ed513c72@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

Am Montag, dem 16.12.2024 um 10:27 +0100 schrieb Michel D=C3=A4nzer:
> On 2024-12-15 21:53, Marek Ol=C5=A1=C3=A1k wrote:
> > The comment explains the problem with DRM_FORMAT_MOD_LINEAR.
> > =C2=A0 =C2=A0
> > Signed-off-by: Marek Ol=C5=A1=C3=A1k <marek.olsak@amd.com <mailto:marek=
.olsak@amd.com>>
> >=20
> > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourc=
c.h
> > index 78abd819fd62e..8ec4163429014 100644
> > --- a/include/uapi/drm/drm_fourcc.h
> > +++ b/include/uapi/drm/drm_fourcc.h
> > @@ -484,9 +484,27 @@ extern "C" {
> > =C2=A0 * modifier (e.g. not setting DRM_MODE_FB_MODIFIERS in the DRM_AD=
DFB2 ioctl),
> > =C2=A0 * which tells the driver to also take driver-internal informatio=
n into account
> > =C2=A0 * and so might actually result in a tiled framebuffer.
> > + *
> > + * WARNING:
> > + * There are drivers out there that expose DRM_FORMAT_MOD_LINEAR, but =
only
> > + * support a certain pitch alignment and can't import images with this=
 modifier
> > + * if the pitch alignment isn't exactly the one supported. They can ho=
wever
> > + * allocate images with this modifier and other drivers can import the=
m only
> > + * if they support the same pitch alignment. Thus, DRM_FORMAT_MOD_LINE=
AR is
> > + * fundamentically incompatible across devices and is the only modifie=
r that
> > + * has a chance of not working. The PITCH_ALIGN modifiers should be us=
ed
> > + * instead.
> > =C2=A0 */
> > =C2=A0#define DRM_FORMAT_MOD_LINEAR =C2=A0fourcc_mod_code(NONE, 0)
> > =C2=A0
> > +/* Linear layout modifiers with an explicit pitch alignment in bytes.
> > + * Exposing this modifier requires that the pitch alignment is exactly
> > + * the number in the definition.
> > + */
> > +#define DRM_FORMAT_MOD_LINEAR_PITCH_ALIGN_64B fourcc_mod_code(NONE, 1)
>=20
> It's not clear what you mean by "requires that the pitch alignment is exa=
ctly
> the number in the definition", since a pitch which is aligned to 256 byte=
s is
> also aligned to 128 & 64 bytes. Do you mean the pitch must be exactly the=
 width
> rounded up to the next / smallest possible multiple of the specified numb=
er of bytes?

I guess that's the intention here, as some AMD GPUs apparently have
this limitation that they need an exact aligned pitch.

If we open the can of worms to overhaul the linear modifier, I think it
would make sense to also add modifiers for the more common restriction,
where the pitch needs to be aligned to a specific granule, but the
engine doesn't care if things get overaligned to a multiple of the
granule. Having both sets would probably make it easier for the reader
to see the difference to the exact pitch modifiers proposed in this
patch.

Regards,
Lucas
