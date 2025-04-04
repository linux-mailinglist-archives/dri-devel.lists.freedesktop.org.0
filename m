Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF754A7C463
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 22:00:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02F2010E290;
	Fri,  4 Apr 2025 20:00:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jRrJX5bV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 331A310E290
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 20:00:27 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-3061513d353so26180091fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Apr 2025 13:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743796824; x=1744401624; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NGnSFRzuoAQP7JbKLfcQWzVzDu4XKirqs+YYRbjcXCs=;
 b=jRrJX5bV0Qc8VJRMRUqXk2jNE+UKiKHundmViIOqfPzFKzWi1lRz9cTySbRJ5lOjGH
 kknhkvFkdm29I4v/izYarzVniOSbr2PwXOKtUXPbNb4iTZ9RQBgC6llWSDLSSfSPYV+m
 s9jbEWtFWCQW/BaFDowJClUmHfyShRJhXh7qzeJMb9H4egQBrNUtJaFnP0yvhDibiww/
 3HgPHouUrG+3bWRmUdjFGszDbmWIRGEovBC4HG+v+1KO0w48qzMfJrfvLAnp80FHrcsF
 f0KOw39dZ9hat+hvGeSCqqV6ZhPGF+YkDVK0gxrP0UCKB1iuCnHnukw3W0pv5yJ+UG0s
 R03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743796824; x=1744401624;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NGnSFRzuoAQP7JbKLfcQWzVzDu4XKirqs+YYRbjcXCs=;
 b=Ryj2dDon0owchUVjf3jQkenCJGU6h11tl5L1pokTw4hvy3+oRziSilR+fIMVGIzPUW
 soB+Lo/KG8FZ3QAhqwSRetjcP9/eElKcvUBCMgNjXRtnbbTe/8AqSWyBbU+QcRpX37Bd
 1EXgpTAVEdN+pLSZyQFVLjpqpKGUeec4Jro+MSPziMyS0jdJCKE7H1TY96oB2anmds+0
 /O1nDZ2NmU/8RItN5oq1vMgeVWLz/7M3k70v4uX0qBrylb1XBpSAFXIyuhNJ4rO++Yd6
 Y131/GFrQ1ZY5zK+Gte0PkUEBT1BaqmzLFclJbJkGHXUDmZgFhnRZH+3rRtDR6zcPSKO
 eboA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5BLDxWkyHWB/a7pBZqgNC8DZRzjG71b241BqyjYArdkJRyjdfnceFkA1Pry9UxvNHJeVuWkqeQCE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnJY/EEzmFROBeB3ozTOKhLoZ+7RIUfKrRKUSq0DqULesM7kgD
 iv7D+r+akIay87JxsDgl38eWRezLVhb/KuZGbtc/BouRxTLJRjPD
X-Gm-Gg: ASbGncvYwJb8nwnMkDpEXgXdibptE3kiCgwvdpCnm7Rew3IH5/rY16JKj8juMWXABl8
 6ZKifxz+VcmrAsvF/9hNl8Dx8sVN18eJcJXZQQ2AlUJhnpQB1f5VMmv4z/NeiorDIfJYJD8e6a0
 Vx9b+OvQYiAI3Azsg986hctXMquXihfXb6MtJvkd6vWqUhjdKv2p4nkzt/zr6FP1WoGBl7iwEzS
 VBbTCOse3/a3gAzGaezuy1SSBradLZCdgW3Qk+UMcwCnQoGEI5PuR2+8ybvmK9PXHp1EqcBkDyw
 RDRb/iMPz+dzD6k9cbQVrHW8DdiwwMkWpx+rGj0g4U7MWwY8lz/M41CPBKErl9YvR2MmOh5J1nE
 W6Fpz2g==
X-Google-Smtp-Source: AGHT+IEEDhNz2RLU0cU7UeS/zJmcHV5Dl+HcylWgqmeC/Yvy6JjRimOfReWDSNO1EN6tnir9PBbWUg==
X-Received: by 2002:a05:651c:30c1:b0:30b:b956:53bd with SMTP id
 38308e7fff4ca-30f164eb958mr2440851fa.4.1743796824081; 
 Fri, 04 Apr 2025 13:00:24 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f031bd00csm6479541fa.66.2025.04.04.13.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Apr 2025 13:00:23 -0700 (PDT)
Date: Fri, 4 Apr 2025 22:00:21 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: display: Add Sitronix ST7571 panel
Message-ID: <Z_A6VXPLuOfk9HPL@gmail.com>
References: <20250404-st7571-v2-0-4c78aab9cd5a@gmail.com>
 <20250404-st7571-v2-1-4c78aab9cd5a@gmail.com>
 <d2ffca88-6773-4e40-b737-65a451ba1d01@kernel.org>
 <e1a7c9d6-9c14-48d3-ac2e-c6e0df04bbbf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="C7W91j7lgF/0CeRL"
Content-Disposition: inline
In-Reply-To: <e1a7c9d6-9c14-48d3-ac2e-c6e0df04bbbf@kernel.org>
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


--C7W91j7lgF/0CeRL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Fri, Apr 04, 2025 at 07:36:12PM +0200, Krzysztof Kozlowski wrote:
> On 04/04/2025 19:30, Krzysztof Kozlowski wrote:
> >> +
> >> +examples:
> >> +  - |
> >> +    #include <dt-bindings/gpio/gpio.h>
> >> +   =20
> >> +    i2c {
> >> +        #address-cells =3D <1>;
> >> +        #size-cells =3D <0>;
> >> +
> >> +        display@3f {
> >=20
> > Not much improved. How is this called in every other binding? panel.
>=20
> Hmmm, unless this is not a panel, but it looks like a panel and
> description partially suggests it. Other sitronix devices are split
> between these two, but OTOH your driver is more complex than just simple
> panel.

I've counted this as a display, but the border is not crystal
clear, and, as you say, other Sitronix devices are split between the two.
It is a controller/driver for a LCD panel.

>=20
> Your commit msg is one sentence and binding description is basically
> non-existing, so not sure how to help. You need to describe the hardware
> so people understand what this device is.

I've prepared this description for the next version of the patch:

description:
  Sitronix ST7571 is a driver and controller for up to 4-level gray
  scale dot-matrix LCD panels.
  It drives 128 segment outputs and 128+1 common outputs.
  It provides several system interfaces like SPI, I2C and 8-bit parallel bu=
s.

But still, it is not obvious if I should move it to panel or not.

>=20
> Best regards,
> Krzysztof

Best regards,
Marcus Folkesson

--C7W91j7lgF/0CeRL
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmfwOlAACgkQiIBOb1ld
UjIxkw/+IYMZdy49mNky3ZxLZOHPj6jfpICZtwU3QV7hHQtccjTrAxO58wKk14U7
0NLdVZY3VN9Tjr2ASKebQRgEbesEiKdZQJ2ZKu7z5tpj0WrImU0+jYIAKAPhO66f
NtfwOD++IQJX0ZoX0oTfC8aMTD3qUN/vZ0NM+fvlSpu0+GEhZClA/yU2P5pVN66X
B3i6COv/Bu7WWuJ/z6widLqqMf/ru6u1iOfhg4NJ4Bg6WiOazVnjLY72iQNreVho
UQy7KJfCbT8aFptnaGPDZPtELCrxDNCifRmOhk1jylIiteWpEgjkdAFGCfjHXGm+
ZsuH0ZhCHjEIfiqR0hG5IP33fP30d2dzmSBOS5nO0FldZIMGyC61VJ78MNoaleYl
bivx5fsKvzJqgLL9kn2CaJKqEkZXePudspz0wTwcwNfSaTGBKBB9fzHcscnbGB2H
hajQauJM6+ntV7QRqAhBhrP/A7eyNg/CUWY4K0eJridwQwSSXVKGhhYROoOsDCC+
OABuvYbVIPt74NNgKXq5AJpdAZedMwPUYIptWBWirToYJ59zzAlE67lTmKU3MjTH
Hzo0EKqEq0x+m6x85naY3ytm9FcLX8dKmsh5Zpo6TCaO5bdzd4yNunMTRekkjBc2
KeGYDxA3g9UR00GSS3ib9DoGMpHWrQjCbIBhe9h4KuQtYmaFpPs=
=HeD4
-----END PGP SIGNATURE-----

--C7W91j7lgF/0CeRL--
