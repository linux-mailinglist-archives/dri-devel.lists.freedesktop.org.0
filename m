Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9915444CB50
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 22:26:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBB9B6E160;
	Wed, 10 Nov 2021 21:26:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1871789FFD
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 21:26:31 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id s13so6344155wrb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 13:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ch/b+grvVj99hgkjPqojUOToeGS4zqg0KKY+hR3OvXk=;
 b=FqmVIU8r3kPBINKjkkB9m2CzBAcC8nW2VR5Q5kNuPqt3CYN2pf51U1jJe4PMEVdvmP
 uj0/ywDeD2kj9e6yJSRTWe92dfI+TxH4uCvkrIXLQvs2EoGCu77H5JZOwfisFcGfn7zx
 y1UTydUXVPlrskHVgWLX/U0Dup5tM+iFBlkxECBJjAihKUZWt/gPR0gvjzUGnOlFVhuG
 6snVrJaycNKSnb5wGW2asbvDYhsm9tUjNO1zyZqWMfazs6aPQ02GylP1MEExcLBiG7K8
 XKvrQ5t1TfLmuPU3jdq5JuG4DOrVabsIxfMCJV3/Hy3kph+Tzxr0Y6pVStE07SPcKEUZ
 eexw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ch/b+grvVj99hgkjPqojUOToeGS4zqg0KKY+hR3OvXk=;
 b=Hw9uhIOcdqfQPDMTFJMSLV9xHHIf1QjfgAF+RhH8B0fmNK49J6g7byB5NAdo5lin0a
 H5RlTwlCePOwPSi4hGt1sxlr8iap54TzqhuqrM77Ec1BShFrCCoBZ80rJju/b04Ybqyz
 fl5ZpnpxUk+m4LV6drmHjG1Vk0lW135loSAa4eEQCiNtTwaLM8JXLyIEpdpS1F+LH/c8
 Dx00TvQVgv3NNHbpkW8TelPzJ41/OGIiBKQjCYINWOqqpleAQauZQryAeeuhiY/qgDxY
 zwp9l/BkXy4K/qg832PXtZq31dm+TXYbVG92Qzo7T44Uwh2YKKauZXmlXnyfT8xzdZ0B
 v2Vw==
X-Gm-Message-State: AOAM530JDkg/FIUU+kDpcGoUoeOagQG0J8H6cq4ne1e3jhdZ1Obmh4H2
 unSC9EvPZr33sBHmLwf4iDA=
X-Google-Smtp-Source: ABdhPJyV4xmmanK+L5cVMYrdVRtRDSYSykTOvsxMpVUp+2On85mnhnK4uOtt2ldcE+YhiIo3PLr9Iw==
X-Received: by 2002:a05:6000:1813:: with SMTP id
 m19mr2614613wrh.51.1636579588563; 
 Wed, 10 Nov 2021 13:26:28 -0800 (PST)
Received: from jernej-laptop.localnet (cpe-86-58-29-253.static.triera.net.
 [86.58.29.253])
 by smtp.gmail.com with ESMTPSA id f7sm1041562wri.74.2021.11.10.13.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 13:26:28 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Alex Bee <knaerzche@gmail.com>
Subject: Re: [PATCH] drm: bridge: dw-hdmi: Fix RGB to YUV color space
 conversion
Date: Wed, 10 Nov 2021 22:26:23 +0100
Message-ID: <5763303.lOV4Wx5bFT@jernej-laptop>
In-Reply-To: <12887538.uLZWGnKmhe@kista>
References: <20211106130044.63483-1-knaerzche@gmail.com>
 <12887538.uLZWGnKmhe@kista>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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
Cc: Alex Bee <knaerzche@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne sreda, 10. november 2021 ob 21:20:46 CET je Jernej =C5=A0krabec napisal=
(a):
> Hi Alex,
>=20
> Dne sobota, 06. november 2021 ob 14:00:44 CET je Alex Bee napisal(a):
> > As per CEA-861 quantization range is always limited in case of YUV
> > output - indepentently which CEA mode it is or if it is an DMT mode.
> >=20
> > This is already correctly setup in HDMI AVI inforame, but we always do
> > a RGB to YUV conversion which doesn't consider that RGB input can be
> > full range as well.
> > That leads to incorrect colors for all CEA modes except mode 1 for HDMI
> > and always for DVI.
> >=20
> > To fix this, provide additional csc coefficents for converting from RGB
> > full range to EITU601/EITU709 limited range and rename the existing
> > arrays to clarify their meaning.
> >=20
> > Signed-off-by: Alex Bee <knaerzche@gmail.com>
> > ---
> >=20
> >  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 24 +++++++++++++++++++----
> >  1 file changed, 20 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/dr=
m/
>=20
> bridge/synopsys/dw-hdmi.c
>=20
> > index 62ae63565d3a..1cba08b70091 100644
> > --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > @@ -80,13 +80,25 @@ static const u16 csc_coeff_rgb_out_eitu709[3][4] =
=3D {
> >=20
> >  	{ 0x2000, 0x0000, 0x3b61, 0x7e25 }
> > =20
> >  };
> >=20
> > -static const u16 csc_coeff_rgb_in_eitu601[3][4] =3D {
> > +static const u16 csc_coeff_rgb_full_in_eitu601[3][4] =3D {
>=20
> I would rather move "full" and "limited" to the end, since RGB always has
> full range and we want YUV to have full or limited range.
>=20
> Just one observation - no other matrix sets bit 15 in any coefficient, but
> yours do. I can't see anywhere documented if bit 15 is ignored or not. Can
> you try with it set to 0? If it still works, I would set it to 0 for
> consistency.
>=20
> Best regards,
> Jernej
>=20
> > +	{ 0x2044, 0x106f, 0x0644, 0x0040 },
> > +	{ 0xe677, 0x1c1c, 0xfd46, 0x0200 },

By my calculations, above line should be:
{ 0xe876, 0x1c1c, 0xfb6e, 0x0200}

Can you check again?

> > +	{ 0xed60, 0xf685, 0x1c1c, 0x0200 }
> > +};
> > +
> > +static const u16 csc_coeff_rgb_limited_in_eitu601[3][4] =3D {
> >=20
> >  	{ 0x2591, 0x1322, 0x074b, 0x0000 },
> >  	{ 0x6535, 0x2000, 0x7acc, 0x0200 },
> >  	{ 0x6acd, 0x7534, 0x2000, 0x0200 }
> > =20
> >  };
> >=20
> > -static const u16 csc_coeff_rgb_in_eitu709[3][4] =3D {
> > +static const u16 csc_coeff_rgb_full_in_eitu709[3][4] =3D {
> > +	{ 0x2750, 0x0baf, 0x03f8, 0x0040 },
> > +	{ 0xe677, 0x1c1c, 0xfd6d, 0x0200 },
> > +	{ 0xea55, 0xf98f, 0x1c1c, 0x0200 }
> > +};
> > +
> > +static const u16 csc_coeff_rgb_limted_in_eitu709[3][4] =3D {
> >=20
> >  	{ 0x2dc5, 0x0d9b, 0x049e, 0x0000 },
> >  	{ 0x62f0, 0x2000, 0x7d11, 0x0200 },
> >  	{ 0x6756, 0x78ab, 0x2000, 0x0200 }
> >=20
> > @@ -1023,9 +1035,13 @@ static void dw_hdmi_update_csc_coeffs(struct
> > dw_hdmi
>=20
> *hdmi)
>=20
> >  			csc_coeff =3D &csc_coeff_rgb_out_eitu709;
> >  =09
> >  	} else if (is_input_rgb && !is_output_rgb) {
> >  =09
> >  		if (hdmi->hdmi_data.enc_out_encoding =3D=3D
>=20
> V4L2_YCBCR_ENC_601)
>=20
> > -			csc_coeff =3D &csc_coeff_rgb_in_eitu601;
> > +			csc_coeff =3D hdmi->hdmi_data.rgb_limited_range
> > +				?=20
&csc_coeff_rgb_limited_in_eitu601
> > +				: &csc_coeff_rgb_full_in_eitu601;
> >=20
> >  		else
> >=20
> > -			csc_coeff =3D &csc_coeff_rgb_in_eitu709;
> > +			csc_coeff =3D hdmi->hdmi_data.rgb_limited_range
> > +				? &csc_coeff_rgb_limted_in_eitu709
> > +				: &csc_coeff_rgb_full_in_eitu709;
> >=20
> >  		csc_scale =3D 0;
> >  =09
> >  	} else if (is_input_rgb && is_output_rgb &&
> >  =09
> >  		   hdmi->hdmi_data.rgb_limited_range) {
> >=20
> > base-commit: 89636a06fa2ee7826a19c39c19a9bc99ab9340a9




