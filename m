Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ODgIob3hWnHIgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 15:15:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA569FEAF4
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 15:15:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C207510E7BE;
	Fri,  6 Feb 2026 14:15:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="OgAVwvdE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41B8910E7BE
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 14:15:29 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id
 5b1f17b1804b1-47ee76e8656so32903585e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Feb 2026 06:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770387328; x=1770992128;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bjyFGYhygp3KhWFix5ES6YgTS5OXgViNhj0NIrCYWy8=;
 b=OgAVwvdE1JfMtCDw7Xnt1OTcMCg/J8pWIrgBEtOPg8BJwb9Y7XaJKkoD7x+4eisjil
 LplNuvRgeDnc4/hjKHfaaLlmncDrAQlf/HnkXUDxG7Stt6USOtQwor2UyJPQh20Gr9Ve
 jx6At6cNwF4Vxg6QtABqdI6GrEchC3MYZbqp6cwcpILOFdaq5UCdI/d19xoSkiMRwcLA
 prC2/DWzk+pG9h8Vfle8gKE7Otc81Bi5IzX2i77hLzWenwxVzUTTYGCRJDaQGo/S1Mx3
 pho5H9IDhFXVkU9MnpP/gtT2qqK/gAUe5iIJ5erzY5DSKf7PI1A2sjugDsnnC77Ln4kx
 xsGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770387328; x=1770992128;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bjyFGYhygp3KhWFix5ES6YgTS5OXgViNhj0NIrCYWy8=;
 b=KL8W9M4qDzpYl/F+rar4EmE3aCbSyt775iUA84SRCFdYctmbJJRyFCPlNlTrSHB/7g
 OswjbMyti3kZ/Gsw6EmSxKQyX3pnTbUuaOm3WJ1GJ3CjmIBBxk2OAW+MGZAeP8JrlaGK
 siJxSlU0JUBeUirpVqa92GPtkTVKRDc3TfsbIcor6u/5lETqqHSwLc9oj9NQnYtg9b4p
 QL2qosXLa6TsCZzkpfDH/XdofPrVVnN/RN1D7xucQsLmBWKyUHOlBKg6YXyaEFsFNpFC
 FU8x1DkYU29tDqvP3uXAjuLso3NHZMGtCCop4YahivfPx//nQLHul3zMNbQx146cjK9J
 FI4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9PGlrrEi/HZURJAy+ghHRyyQu26ReNjnnclgZGSXylfmL2GCrL0foTQWvHxCfwH5MWtZVz7ZK94M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwapaGyucnfR8ejoliW/20YrkYMluPiuZHVXE8sQ1IoOPmosH4K
 OsLPNS+9GDw7RlwT45UmUrtmuR9++SXlyeJVnVETH8VjkNfi7AErqK5izJ/2NJ/aBn8=
X-Gm-Gg: AZuq6aLiap/RANJTnXyjUzam+v8KWOcPRXtB8l4iqJOQ71RJKP5qQ96f3Y1nc6x2j7q
 Het2/1Xn8GLBwBhipy8HHZRbCjbiblPGKuHoervzBh7DgSALikxJOENhx3/rvKfHEGVklvc7FJ/
 RXhqdHkPJUyaTKydRH+wg23WuzDGxpNkRJyVlAfr3hNknHOERb5B19agIPIzEPL9o+LXu/qNJIJ
 v8enmaP3OxnIqL5gtX1w/lAPAMWwpqFZfzIb+ZVQgl4A7xf5gYlvCLhZ12OTediZXSwtRmryUKR
 Q083gqwcsgmGyOIRdKz46Q8Zc4LXiINViw4ZdRBvHXae/QQ996ws1NOiShdZzZ1JCyVlOW56+eU
 uNCZfBdBl6pbhxbv1dUc+BjtdSy4Ekvm/iK1dMj6XBh6GLjg9+925LHjMrjBsWRzN5be8GMD9oI
 hoXrEMm+fEEKMbjXbZKBhydBEZFWtf/c3dleFpl2r361hjQPgy3GHGjgKp90XS221ncLKoY4fFu
 Do=
X-Received: by 2002:a05:600c:c4a7:b0:47f:b737:5ce0 with SMTP id
 5b1f17b1804b1-48320231161mr38699525e9.23.1770387327777; 
 Fri, 06 Feb 2026 06:15:27 -0800 (PST)
Received: from localhost
 (p200300f65f20eb04dd2029d872c27e4b.dip0.t-ipconnect.de.
 [2003:f6:5f20:eb04:dd20:29d8:72c2:7e4b])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-48320410b78sm32854755e9.2.2026.02.06.06.15.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 06:15:26 -0800 (PST)
Date: Fri, 6 Feb 2026 15:15:25 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Helge Deller <deller@gmx.de>
Cc: Chen Ni <nichen@iscas.ac.cn>, linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1 1/3] fbdev: au1100fb: Mark several local functions as
 static
Message-ID: <aYX3KYbdSUPTSHG-@monoceros>
References: <cover.1770196161.git.u.kleine-koenig@baylibre.com>
 <ceb08e29f6a07075b5ca63e4ed30c5051fddcdfd.1770196161.git.u.kleine-koenig@baylibre.com>
 <cf0433eb-e22d-498b-93a2-04b461aaa6e2@gmx.de>
 <28affc45-7f41-40a5-82bf-308a6e34d956@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tbcs3jm2xyvoo2ch"
Content-Disposition: inline
In-Reply-To: <28affc45-7f41-40a5-82bf-308a6e34d956@gmx.de>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.41 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmx.de];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:deller@gmx.de,m:nichen@iscas.ac.cn,m:linux-fbdev@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.982];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,baylibre.com:email,baylibre-com.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: CA569FEAF4
X-Rspamd-Action: no action


--tbcs3jm2xyvoo2ch
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 1/3] fbdev: au1100fb: Mark several local functions as
 static
MIME-Version: 1.0

Hello Helge,

On Fri, Feb 06, 2026 at 12:22:39PM +0100, Helge Deller wrote:
> On 2/6/26 12:06, Helge Deller wrote:
> > On 2/4/26 10:15, Uwe Kleine-K=C3=B6nig wrote:
> > > This fixes several (fatal) compiler warnings =C3=A0 la
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0drivers/video/fbdev/au1100fb.c:530:6: error: =
no previous prototype for =E2=80=98au1100fb_drv_remove=E2=80=99 [-Werror=3D=
missing-prototypes]
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 523 | void au1100fb_drv_remove(struct =
platform_device *dev)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~
> > >=20
> > > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> >=20
> > I've applied patches #1 and #3 of this series to the fbdev git tree.
> >=20
> > Patch #2 needs fixing, as it breaks build on s390x.
>=20
> I fixed up patch #2 manually for now by excluding s390x as test platform.
> If you have a better patch, I'm happy to take it.

I didn't look at that yet, but I suspect that the failure isn't s390x
specific and I think it's better to not relax the dependencies yet.

Best regards
Uwe

--tbcs3jm2xyvoo2ch
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmmF93MACgkQj4D7WH0S
/k7T9wf/QGC6mWJuNMU2J2OQf+ThcYYgLqXINFepVUdYoRPW92brCm7x2TiVdKLO
BYf3ynkCUoPbNLKPYedawSQvGGeC5utCZfZn/LqaAzaS40uGlAPrxJvLw0B3S54N
kzLDMXf6sarX6/QwqgFz9MbHE53rO4bBl3qXnQzXWqt1NYKnusmky9zrP6K3w4DJ
6zJNRxbNNCCD5Doc5ZMVAgRfiH8E8gGGyrrPg5jo7dCHm0b2Be8msMBRVu3pJEn9
2VNGn3c5bMhfKxzfXPLf+S1Kzcv+ZVI0yHg/qu7tzGxlHGrDmorjjbwRR1+d7wk8
Csc5smqEn+67u9awy+L22Xv518hHEw==
=Lbvd
-----END PGP SIGNATURE-----

--tbcs3jm2xyvoo2ch--
