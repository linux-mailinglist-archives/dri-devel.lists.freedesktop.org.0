Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D7BA9E9D7
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 09:45:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC5C810E3BC;
	Mon, 28 Apr 2025 07:45:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EegkoPQV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA5B110E3BC
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 07:45:50 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-549b159c84cso5099963e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 00:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745826349; x=1746431149; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=dKdwld1K15qYqC7KADuP8DoNmglOc6igkyzr/XL0LKQ=;
 b=EegkoPQVvOx2qmLpJCReE4slOr0bXLb874d1C2GON1RDIS/5EteQ9kJ1CFh0UH1eyE
 xgBWfTJ6ivejP34nR3D/noUqgj7cpR9cyXVMOx4rFa41EMJbKacm0b7IcbdzpqOJxNCf
 lLeq9WQ/IDuIJ/ewywyEDaV4jJLVg/hsTFqDWTL1Jd3JOstBAf4dtXEJ4cj7Q3e17DyB
 h38qil4d7y/5eZEYfZVv0ZaZblxpKVp7MZawpLX2MvwUC6LIsEF4Ig6gduEim2/edyEU
 k+LjT0kQzeYAdLdbHwmdchnwZCvaI+x58BtDeBycKAs99DWLLljpBPnsKz2XnIH8hu/3
 Ve0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745826349; x=1746431149;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dKdwld1K15qYqC7KADuP8DoNmglOc6igkyzr/XL0LKQ=;
 b=sGeAK6X0nZCAkKPsbg7O1PYkx7s6oLqe9otBPkij3k0SPgxYe3W7DpeQx8HI+oUMfO
 SaZ24YN33b2xyMGvdzynQDL2YjW/fsI0BpkZx7mem4s6b4Gj0dZgBJZNByuK2801tgDm
 3pbxD4YW1TYJ2QvWmNC8mjVHKtJ9opWLDAVTqWCEAUOqG4p630lvL77OJsxF6hhn/YU8
 J8XV3BCGKNRIHz54BZY3tStRZcCb0eYzPL1duDiYTxiPEvTYc2ZiouDZZr+4hGb9o1OY
 eD7m0WO8tjzOPpS00cahs8WwVdgBjJhghebSR3o27x82mUlRRZrR2wR18QSQVkB/tqss
 pUBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCRcFY4GT5OQnqmTwvLcgrUILNBIMiJFa1FTR0zs575I0oYaVm1jLuNe1SbyCrUDsdI8zwWTGkqm4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXxHPzo0/82ddsQcz48oHy5je7EFHScGLi+Fcnmi3r4ZtG4Ub3
 3VlEwu0jjEwByqDC9c/l46+K9vLcFBgjFC324Lcek5lBiViWKe3b
X-Gm-Gg: ASbGncvVQM7aaDFe/qC3EN462o9Qqy9mRnAC+0VsF7hXONi0UKRTJtwJmg7Nk8lnDez
 I2sEssJTISJo3qLLbLt3BN0G54im9rylgsLt3CBcSH7k2Vnfb5DVuk7kT0ejt1t9fI1dq3ZUAXj
 tWEJorr6t1B8JM8PM8oOmlFn2FwlwPm3Be00gUSGGnDlflxLYkQVxyyuu2h+9Awa6WZCLHZYIaT
 TuLeNM+mOfk+qsINMYUFYcA11CDjoTQllKyDevOq/ziSFqeq6WyLbzfUMVgJ+0FSZ21Izj7fBFq
 eeXhSr9C6Vm2vP/3SQFqCSc7hnpnX6S6h9eCiJc7jMQ9vIu1DcztSNcsW5fOjeHVMTd/mjVeE0w
 PvQ==
X-Google-Smtp-Source: AGHT+IEWTkLzNXmtUJ1cyJ6I8VC5CcRe2grkI2qhYbv567ugil6j6yVGJUpuggrbLqJgyixmX+oOIA==
X-Received: by 2002:a05:6512:3b22:b0:54a:cc75:3d81 with SMTP id
 2adb3069b0e04-54e8ffb7fdbmr2198951e87.4.1745826348821; 
 Mon, 28 Apr 2025 00:45:48 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7ccb803fsm1582164e87.228.2025.04.28.00.45.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 00:45:48 -0700 (PDT)
Date: Mon, 28 Apr 2025 09:45:46 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 David Lechner <david@lechnology.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/sitronix: move tiny Sitronix drivers to their own
 subdir
Message-ID: <aA8yKi0QDCg1k8mS@gmail.com>
References: <20250428-sitronix-v1-1-4e7cc0a8195a@gmail.com>
 <877c3421tb.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3/OfVP2ovH6knViW"
Content-Disposition: inline
In-Reply-To: <877c3421tb.fsf@minerva.mail-host-address-is-not-set>
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


--3/OfVP2ovH6knViW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Javier,
On Mon, Apr 28, 2025 at 09:16:32AM +0200, Javier Martinez Canillas wrote:
> Marcus Folkesson <marcus.folkesson@gmail.com> writes:
>=20
> Hello Marcus,
>=20
> > We start to have support many Sitronix displays in the tiny directory,
> > and we expect more to come.
> >
> > Move them to their own subdirectory.
> >
> > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> > ---
>=20
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>=20
> You can also include the following if you feel like it:
>=20
> Suggested-by: Javier Martinez Canillas <javierm@redhat.com>

Oh, yes of course, sorry for that.

To whoever applies this patch, please add the Suggested-by tag.

>=20
> --=20
> Best regards,
>=20
> Javier Martinez Canillas
> Core Platforms
> Red Hat
>=20

Best regards,
Marcus Folkesson

--3/OfVP2ovH6knViW
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmgPMiUACgkQiIBOb1ld
UjKEmA/+Ns0AjP3rVWn0ZDwzM7oCpcYNsMQAloJuJBGEQlKWShRXkhUkMf3OwVl2
pnb7joWHLWqDtbqWk5zwnRAiY5aHp9LNOIicmWSyt/dJaVr8afICTL1Z/s87JmSu
ygcxv96iAwPu07CSTAh4F0vySz6nEHVbX6lOzcTIQqPQKBohbuJ5pFPeA79qoryY
xdWVdPhAm9Y1TxtBMAZnkxrzharn8WCzmIMWwMtbEh3a7kef78qAbQuSdjofJyGx
/H6LiVtMvr0MV71VOuyY9jFo3DtL/KgJrj1/URLJajhL2nREv+4FNer7KHZp8u31
TEQR8EL8Xf99rOjrPjsCfdcHKjRIkNcwciuq8j12rWKSIuw2+lPuWRuihe4oLWYf
h+O516gXx7CYwGrk1ZVc9MvSfI2EgXI4jC4SP9wtyCBgYdYsZ/v48hzw25tD7aTg
30GLWM06dmJuNwoVx5ihqL6piT37bpZ4KaNE+09f0DmQNOp4Ht4YqfTV7KrvOY6f
oMH3Jp4ANO8/cUCbrnfVRsmAIakKQRiGmkbqXVJ+G9euuCfbfVJ7K+U82zPLZY8m
Yk/SMKr6JBHN1ofvZRoJTqdkqXnqpBxIrFeAY23SdHmbel/ImnSyQWvj2PbWmPo+
nz4HeRzDGyL5p265VB7X1OqJGr/C80XnKzA9Tmf6LcoQwjRjaQE=
=dBye
-----END PGP SIGNATURE-----

--3/OfVP2ovH6knViW--
