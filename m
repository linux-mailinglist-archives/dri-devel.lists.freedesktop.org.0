Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4407C5E97
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 22:44:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED79A10E1C3;
	Wed, 11 Oct 2023 20:44:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E24F10E1C3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 20:44:06 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-503397ee920so367352e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 13:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697057044; x=1697661844; darn=lists.freedesktop.org;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P31EaSRln5Y8qXIhPg5k92XnAsV91qhf1ea5PLnQlac=;
 b=gjnnV0q9DoEHTARidgVtmEGVvtO7n8hhExrGNZ28OvG6VOeNsHgcI2+aHm3jKQ6ud8
 ODr48lOd+8TWVVjw2fT7vkEuD7PQgd2zzbJQQrtCpNucAAnapwlMAZDbN1xH9iCty4ow
 qdMI31/ulJJAhsBlEph/cspahxHY2ukbr4AnIfUaPbRvxPEfebUJv6VtLL0mSg+NNHTL
 5e9nsqASRdkH+f7f2XZgbXiQ+hc+zcRimQ0uH37mGWQwjDqrgl0zJo7Y8uY1xfOJRlDr
 PqnZp7idPKNQWgQJSIrKcbsWSs5RDqzXaTEtk1ugMgqDnc5ZmGmYqBbxkQO4fnAwGOO2
 Z3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697057044; x=1697661844;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P31EaSRln5Y8qXIhPg5k92XnAsV91qhf1ea5PLnQlac=;
 b=QuqQTGIgehf8kJB3VtOLtjBNYf0NdKIQE2WI0VtVOeR2AakrbnvQvjas0l0K3JmYCR
 H4XbBlL1XORp/1/S1Fjr7OL/YLw/hX1+xxdI9TGPOxlTvWu0v42bJlCk9qJhKnjEpab/
 XWKc3iy4RHD7pvYm8STYe5KI3j0QyjLlLttXEyjwBFYLpJZHtec18hVispiwT4QAkCQp
 1Gcm42tujzMflx9x30/XZcdrjtTnorbfUUK5P7hkxPIZqPjAxAuOLiLzpm8Ap/lyTwKd
 YPi85HXKxKR+jTrgNfshqy1fcOJFOXeyB1MA+YIAsoQ7Xd82xkCWq9j9ML86HumxT0mF
 pEWQ==
X-Gm-Message-State: AOJu0YysdhwsimA/TGas3aZrbLEoATCGv/VoIuKdCUSN6yfsh0ph3sHQ
 lJxyagf4SFLCYHSQFY0+UQnjDNjPxA0=
X-Google-Smtp-Source: AGHT+IFQxx5VCl8KKjK9TQ9WjcRa0ePH4vtXFloK3iDhSbfTnnC5mV9npmHSp/URant9nZFf6rq5pQ==
X-Received: by 2002:a19:2d14:0:b0:505:84c8:c640 with SMTP id
 k20-20020a192d14000000b0050584c8c640mr19445254lfj.48.1697057044063; 
 Wed, 11 Oct 2023 13:44:04 -0700 (PDT)
Received: from orome.fritz.box
 (p200300e41f3f4900f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f3f:4900:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 i16-20020a1709064ed000b0099bd0b5a2bcsm10267065ejv.101.2023.10.11.13.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 13:44:03 -0700 (PDT)
Date: Wed, 11 Oct 2023 22:44:01 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <cyndis@kapsi.fi>
Subject: Re: [PATCH 1/3] gpu: host1x: Add locking in channel allocation
Message-ID: <ZScJEcoHQvi22Tg4@orome.fritz.box>
References: <20230901111510.663401-1-cyndis@kapsi.fi>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="EHUtb8eUTGdPEKmK"
Content-Disposition: inline
In-Reply-To: <20230901111510.663401-1-cyndis@kapsi.fi>
User-Agent: Mutt/2.2.12 (2023-09-09)
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--EHUtb8eUTGdPEKmK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 01, 2023 at 02:15:07PM +0300, Mikko Perttunen wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
>=20
> Add locking around channel allocation to avoid race conditions.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/host1x/channel.c | 7 +++++++
>  drivers/gpu/host1x/channel.h | 3 +++
>  2 files changed, 10 insertions(+)

All three patches applied, thanks.

Thierry

--EHUtb8eUTGdPEKmK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmUnCREACgkQ3SOs138+
s6GH+A//QmJ4c3RRvMjnASjZz/n6FJB1QRhFqjrBtygOt+15mW6zqGaL1XUoTR/c
q9PV84sXYyooWoVAp3IKa/hXrNhRxjsEwkxDTEetnvIi+ANSMe0I5gjIJDq40rdg
RClG6XT1sh9zD6ez8Uy++Ge5qOd2Kx8zMKZ56gsZ97pG15bXLjSMfbtGrT0Iq0R6
CdpKkDAQcKB1z+rikxt0pd+J36ibF+usXOM0HRz5Xfcz5Ssfy1c5Thp98MLYgaKu
i9akppvkAmWU7CPv/DzFDXdewtRfKA6FjGvWUMjY8oHJ8xHgiFpY/5DG+eD7DftT
lI4ngk4U4Vt+BfBgAooD5BfDEDgGAU0LSz7yK6WTAI3UZyPCw9moYw5LD3n2WtfO
LUI7I5IOiQKfvRGVxMY2t2EYNbRSb9Ti8gNUMobmoEmd2ZEPDOQh5Vv4O5yEs7El
R32rNJlaz+AoL3ojbNwu570XvDJL1H5sgzHG4Oo+DSP8Id4zEx4KIDcu8MevFhXh
UETZvCd4DkQaLRxuw65IgRwr+PdO3IpQWP4LbVzEFlLHmEeZaUqU0E9C5aA3E90t
fykEqYDr9BA79V2lox+KamGcq2ZeCrGZ62JCM3boB7y2zmFFulHTgIuA7rmZo0Iu
dHrlYhTNsHMg4059Ty7qQwSr4Ez5I3Fwa2BC2W5Db5sb1LbnHqg=
=8Scw
-----END PGP SIGNATURE-----

--EHUtb8eUTGdPEKmK--
