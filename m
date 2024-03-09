Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 095C48771A2
	for <lists+dri-devel@lfdr.de>; Sat,  9 Mar 2024 15:33:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0CFD1120E3;
	Sat,  9 Mar 2024 14:33:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DCB81120DF
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Mar 2024 14:33:16 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-253-14N-Did4PAW8hIsoNs_d-Q-1; Sat, 09 Mar 2024 14:33:12 +0000
X-MC-Unique: 14N-Did4PAW8hIsoNs_d-Q-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Sat, 9 Mar
 2024 14:33:26 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Sat, 9 Mar 2024 14:33:26 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Maxime Ripard' <mripard@kernel.org>, Arnd Bergmann <arnd@arndb.de>
CC: Naresh Kamboju <naresh.kamboju@linaro.org>, open list
 <linux-kernel@vger.kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, "linux-sunxi@lists.linux.dev"
 <linux-sunxi@lists.linux.dev>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "lkft-triage@lists.linaro.org"
 <lkft-triage@lists.linaro.org>, Dave Airlie <airlied@redhat.com>, "Dan
 Carpenter" <dan.carpenter@linaro.org>, Ard Biesheuvel <ardb@kernel.org>
Subject: RE: arm: ERROR: modpost: "__aeabi_uldivmod"
 [drivers/gpu/drm/sun4i/sun4i-drm-hdmi.ko] undefined!
Thread-Topic: arm: ERROR: modpost: "__aeabi_uldivmod"
 [drivers/gpu/drm/sun4i/sun4i-drm-hdmi.ko] undefined!
Thread-Index: AQHabimenIC0ADhmjUqxSQo36gIP17EvfaYA
Date: Sat, 9 Mar 2024 14:33:26 +0000
Message-ID: <85b807289ff2400ea5887ced63655862@AcuMS.aculab.com>
References: <CA+G9fYvG9KE15PGNoLu+SBVyShe+u5HBLQ81+kK9Zop6u=ywmw@mail.gmail.com>
 <338c89bb-a70b-4f35-b71b-f974e90e3383@app.fastmail.com>
 <20240304-brawny-goshawk-of-sorcery-860cef@houat>
In-Reply-To: <20240304-brawny-goshawk-of-sorcery-860cef@houat>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maxime Ripard
> Sent: 04 March 2024 11:46
>=20
> On Mon, Mar 04, 2024 at 12:11:36PM +0100, Arnd Bergmann wrote:
> > On Mon, Mar 4, 2024, at 09:07, Naresh Kamboju wrote:
> > > The arm defconfig builds failed on today's Linux next tag next-202403=
04.
> > >
> > > Build log:
> > > ---------
> > > ERROR: modpost: "__aeabi_uldivmod"
> > > [drivers/gpu/drm/sun4i/sun4i-drm-hdmi.ko] undefined!
> > >
> >
> > Apparently caused by the 64-bit division in 358e76fd613a
> > ("drm/sun4i: hdmi: Consolidate atomic_check and mode_valid"):
> >
> >
> > +static enum drm_mode_status
> > +sun4i_hdmi_connector_clock_valid(const struct drm_connector *connector=
,
> > +                                const struct drm_display_mode *mode,
> > +                                unsigned long long clock)
> >  {
> > -       struct sun4i_hdmi *hdmi =3D drm_encoder_to_sun4i_hdmi(encoder);
> > -       unsigned long rate =3D mode->clock * 1000;
> > -       unsigned long diff =3D rate / 200; /* +-0.5% allowed by HDMI sp=
ec */
> > +       const struct sun4i_hdmi *hdmi =3D drm_connector_to_sun4i_hdmi(c=
onnector);
> > +       unsigned long diff =3D clock / 200; /* +-0.5% allowed by HDMI s=
pec */
> >         long rounded_rate;
> >
> > This used to be a 32-bit division. If the rate is never more than
> > 4.2GHz, clock could be turned back into 'unsigned long' to avoid
> > the expensive div_u64().
>=20
> I sent a fix for it this morning:
> https://lore.kernel.org/r/20240304091225.366325-1-mripard@kernel.org
>=20
> The framework will pass an unsigned long long because HDMI character
> rates can go up to 5.9GHz.

You could do:
=09/* The max clock is 5.9GHz, split the divide */
=09u32 diff =3D (u32)(clock / 8) / (200/8);

The code should really use u32 and u64.
Otherwise the sizes are different on 32bit.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

