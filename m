Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91449AD5996
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 17:06:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB0510E680;
	Wed, 11 Jun 2025 15:06:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="g0mPoUAh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9377910E680
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 15:06:52 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3a50fc7ac4dso6007f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 08:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749654411; x=1750259211; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rZvstCIx0930gy+FitWy2h9ieXUWIADy6nD/O8Xen/w=;
 b=g0mPoUAhG1a2zXQm/gNsHFGUvW60fP54naXnVpwgsZqJ2tfmkgPiFDaNkxbMyHl0Tf
 E3/U6KmJxchirvtJOKDhVMslSf2/OENexGH6HXDUclUT7HexQviM2kJWdkMtrUfiwY3A
 R8RzLv7nyCzkANWA65mWiA6qJWIRjcqihBRCXmzv7/giQL/9nTJVRSZ3dWbYxJ3njUxe
 QNb6FtYxTtOG8imFwGVbBl9SpWVqsUy0kU0UjyqFTmmMp7NZo+6O4y/SFN/+VizePMMb
 +wnH/j4tIrQIQbJmOnRErPyxm7A92qp2wjdz9BnLiWeXh++J2pSDJ7UDj+t1RxfAx9Cg
 2VDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749654411; x=1750259211;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rZvstCIx0930gy+FitWy2h9ieXUWIADy6nD/O8Xen/w=;
 b=i6BcaS/pDeCQ2kc7X0HpU8m/fH+avfcxImnu0yla+nns5NN0qaX1tDLoIzvute9fqt
 xzdDDX0xLdAFAbx59cq0H/ZKqHf8T0C2hRg9NJi4TPxahSbeMK5A+AZ0TprW7TNs5iwa
 No9D9AHE7X/EPag9zVYVY7Vx1jMOkIZ8jBosl5fw1RV0WLs3W4apEbMdff+v4t02zMhe
 zHxNmNHUTIs23OpMPHp3RKnl8f6tel7u7uv+GVrz6lrQ788biwaTp3v03kDV/zw27bNI
 jJCejcKB2EWq5GGyy6t/jxkkJj2cNNOCVAhbaxVKHBn9XxmWGvIWJmkPRQeZ8Zwte/dz
 qoeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+TB+XMlncWHkhl2V4Kk9t7CnfgfOjaAVCeTnUQC5E04ohKW9LDjFQGN7VjT490OlFw8bpfnxQ6U4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwO5DL5eYZOxCsCgDQ+bkxS5PYNMLZg725pMzChqNZ5o9AeUB6l
 4bKbWZHpzwiio+6wCknliMbK/VkQiLVNqWaphcsU6+C+8xkK/h/XsUS2
X-Gm-Gg: ASbGnctBf0fQ+/QSRPbb+G5PGgbqh47ItJx5EmT5y45wg7KYTCKfrn/sk7g/1eHfIaq
 O5Mjcbyp40YxF2feIxg3CRsWyMZPcPRHNWuuKt1cOaE7dD0aVCAjgXcH3Fua0IvxF3GunaNKZDb
 wg5RMah9eIZk7IDLhXDiyZlwzhCD+H8giMDyiW9o9pH5Ci+5JYCY92Q/VoIa49Vkw879EwG9UjJ
 Rw2gPEk0QuO6/RnuYaYgLjuNLP6LnGfCUxh6oa7tJnwxbT2xRNtREb2jTIV7fbTc0YE5EJsQ/cf
 1fHzeVaN/Ac34/3pz09jMjVy+57hzR5G4WX0WMcSth2bkCSD+HVBM8ycNdJ3i4WUdRPKCEGpdKg
 Cg/k5JB4sUlh9kt0EzMwJJZcBA1bcF333AnGhd14ht7Ft73g2
X-Google-Smtp-Source: AGHT+IH7gCL0A1jwyehirZD75wEUOdI2MNoMc6qGX53PjwOW0K3sU25NqW7e29pI1Cuyu7enpaum4w==
X-Received: by 2002:a05:6000:2304:b0:3a4:f50b:ca2 with SMTP id
 ffacd0b85a97d-3a558689146mr2940381f8f.8.1749654410702; 
 Wed, 11 Jun 2025 08:06:50 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a532436871sm15373810f8f.49.2025.06.11.08.06.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 08:06:49 -0700 (PDT)
Date: Wed, 11 Jun 2025 17:06:47 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: Mikko Perttunen <cyndis@kapsi.fi>, 
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 0/3] NVIDIA Tegra210 NVJPG support
Message-ID: <4cibh66elviiatataa45lsfcyeovkqyxe4fjvfh7uqddhsbe6z@svt2dgeafrdh>
References: <20250606-diogo-nvjpg-v1-0-5f2c36feeb39@tecnico.ulisboa.pt>
 <mz5sytol6aw7ouwiimmrd7lqhtvq6nj7pqpxq4ie6em6nwvvkh@2cux3no33gre>
 <621a9459-f2dd-4b19-a083-0e62f1a42f50@kapsi.fi>
 <96b721cd-7223-4b28-a3fd-a4d92c9d5142@tecnico.ulisboa.pt>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ahdzzbv4aoxgwn2z"
Content-Disposition: inline
In-Reply-To: <96b721cd-7223-4b28-a3fd-a4d92c9d5142@tecnico.ulisboa.pt>
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


--ahdzzbv4aoxgwn2z
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/3] NVIDIA Tegra210 NVJPG support
MIME-Version: 1.0

On Wed, Jun 11, 2025 at 01:05:40PM +0100, Diogo Ivo wrote:
>=20
>=20
> On 6/10/25 10:52 AM, Mikko Perttunen wrote:
> > On 6/10/25 6:05 PM, Thierry Reding wrote:
> > > On Fri, Jun 06, 2025 at 11:45:33AM +0100, Diogo Ivo wrote:
> > > > Hello,
> > > >=20
> > > > This series adds support for the NVJPG hardware accelerator found i=
n the
> > > > Tegra210 SoC.
> > > >=20
> > > > The kernel driver is essentially a copy of the NVDEC driver as both
> > > > engines are Falcon-based.
> > > >=20
> > > > For the userspace part I have written a Mesa Gallium backend [1] th=
at,
> > > > while still very much experimental, works in decoding images
> > > > with VA- API.
> > > >=20
> > > > I have been using ffmpeg to call VA-API with the following command:
> > > >=20
> > > > ffmpeg -v verbose -hwaccel vaapi -hwaccel_device
> > > > /dev/dri/renderD129 -i <input.jpg> -pix_fmt bgra -f fbdev
> > > > /dev/fb0
> > > >=20
> > > > which decodes <input.jpg> and shows the result in the framebuffer.
> > > >=20
> > > > The firmware for the engine can be obtained from a Linux for Tegra
> > > > distribution.
> > >=20
> > > By the way, have you tried running this on anything newer than Tegra2=
10?
> > > Given your progress on this, we can probably start thinking about
> > > submitting the binaries to linux-firmware.
> >=20
> > FWIW, the impression I have is that NVJPG is basically unchanged all the
> > way to Tegra234. So if we add stream ID support and the firmwares, it'll
> > probably just work. Tegra234 has the quirk that it has two instances of
> > NVJPG -- these have to be distinguished by their different class IDs.
> > But we should go ahead with the T210 support first.
>=20
> I have a question here, what exactly are the stream IDs? While working
> on the driver this came up and I didn't manage to figure it out.

Stream IDs are a way to identify memory transactions as belonging to a
certain device. This comes into play when working with the IOMMU (which
is a Tegra SMMU on Tegra210 and earlier, and an ARM SMMU on Tegra) and
is used to isolate DMA capable devices. Basically for every stream ID
you get a separate I/O address space. NVJPG will have its own address
space, and so will VIC. Each device can only access whatever has been
mapped to it's I/O address space. That means NVJPG can't interfere with
VIC and vice-versa. And neither can any of these engines read from or
write to random system memory if badly programmed.

For Tegra SMMU there's no such thing as programmable stream IDs, so the
stream ID is fixed for the given device.

On newer chips (Tegra186 and later, or maybe it wasn't until Tegra194),
certain IP blocks have special registers that can be used to override
the stream ID. There's also a way to set the stream ID via command
streams, which means that you can have different I/O address spaces (I
think we call them memory context) per engine, which means that you can
isolate different processes using the same engine from each other.

Again, for Tegra210 that's nothing we need to worry about. For newer
chips it's probably just a matter of adding .get_streamid_offset() and
=2Ecan_use_memory_ctx() implementations.

Thierry

--ahdzzbv4aoxgwn2z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhJm4MACgkQ3SOs138+
s6FNWBAAtJCLRWy3HnLpatC3L34V9NYYS65LIc6i75tLGDS4+bBBVllqqYZrDaMc
2QXib+yx+tG3P1z43Nq+Cp26YfjIRVdLqlOiQ89bURxrCas6jTBg4o8N8mYIkS62
s9p/Q+YO58bNDfPVGhXOfSLTLciU5i/ull7kAkJMYmAsI31Bt1HywLimUCwHwdlC
sSzGKK38fIZdwKYqR1yAEmtKzc04lOZGXN74/OW8o+h77WrLUlcwIpKb8mF3Q4Sc
wzGX3IJah5vmZHWBnWvWo3ans257qlqz7B6P6lEe3jgPhhs1yL1TD4ii7X8T/sc2
l6wHexytUYYPgWYOV+nIzqrL+F2SU+52YDVng4ADB1HtvdH4X/ransteUoo59MEc
9glcqy40Y6PCAwXwQGGizpQ88Tlg6ttBru0npckcN44iJuHksyca9JO1crBlWoMs
OiRpu8/YOzVGKHlolwhNfFdcJ77C1UP/UoHSnCndgVuTx14ZoFZVjhCpBqwlviU2
7luQxXj5LZdk3sxnlP+q054H8udEC9PDavNwwO4jpH+0mcFZH06lpSGad67nOVgA
dVTI15W89MocI4CDrbq8wLOlDJijKz5ztoLwm+e5V0BXgu4SrdvbuCvcnRlxvphV
wX0oNHG2ZZ6OZFZQ2eaWAxWniSkNKFfuV3lnVMlz7B4bR6hmD1E=
=pPIb
-----END PGP SIGNATURE-----

--ahdzzbv4aoxgwn2z--
