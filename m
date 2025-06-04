Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60871ACDB31
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 11:40:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB72310E662;
	Wed,  4 Jun 2025 09:40:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="BBU7uEBD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE38F10E662
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 09:40:49 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3a51481a598so1002995f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jun 2025 02:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749030048; x=1749634848;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JYI3oUdEvBapqkfwny3CdaVIKxOUyl9weCW1cN9D3mU=;
 b=BBU7uEBDQ9EsrusOVXwOZ+GF6QoU+NDpJcDXS140eLM0rhPoS+WpalzppJZFASzCR8
 byYXuROBBaP2a8m017WclD94qWDHjvOgBFOtpIg5AA49YosCqe2+1Q3NI4M2KSW8ZUJk
 j3VDzAW7gLSKMK5o53H6yLi29iVonf8+dNaWtXeFASQeODOo3Pg5F1yRE1jXFYNR25hQ
 ENauWDBNNs4gF5DwmU9f15oC4xas0QCFSq14zxnJca8umpRZ1/K7BFZWoAU+/e0TeQPy
 mA/SbiXsl6pVX6oWXH0fPOXPSbMXT+/EoxkXtiOIdsZ2XctgAvkPVE7Xet3XOS7OEsaq
 tD5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749030048; x=1749634848;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JYI3oUdEvBapqkfwny3CdaVIKxOUyl9weCW1cN9D3mU=;
 b=oWvU6cfffhrqvB8JYhGDxplFUUWOu2ynvXC3QhyU7/oQOSlxxRKKIdARtJpR7kM5DA
 RG4fLkfz25YJoUeZ56EQzvGykN0dkLxlnOojhE7cRCA6ULYa4fK25dNWmRualelwWtSx
 8DW29bm88uTJTkuBOIA2nhaea68yw4YajX2AtgpA09s2y3ZsYUUnBNAQMAHFWJRFZFQz
 Xs6pnb3VyTZmFIFDRL71JuFqZg9Mvy2qCaT7lcYQZkrbF7QgPmgxsaTnKNc0DvnnUygu
 Z0WF7TZNEgyacfRaXJMOma7PDovvjqphjMFPqZa4iApQfJiXQJMq0X3eMcy3CJxPbG9P
 yGMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqtpT6u5gJwV/lShm0Bt4MXH9VsXH/W81F+ceS9I3NN1hNwj76I2akuQ8X8ANfAyqksUdNaHib2ZY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTljHHYpJ3yaQxH5ZGikFvnpALYgtfM79WIJnT35Zi8ZriDvGt
 pM17Xzk2766KFIvrLj1/RvGy/HXSzUjoFpiYaPYSNLzHb+nWQZTVoxTkRmjw1/oBXWz0NNfh6Tv
 aA2mQ
X-Gm-Gg: ASbGncuHFH8UKipxV9FTS+VqaOmppTIwGoY8HVmbGxaZam9BZfmh5hR3ZuylikEuD01
 8CveeOqRqOb//xlku+ywSk2LNiUUz62uKz2HMjx51W0k5EmBIVStx5YsYHwk1cA8mmXdhEGwT0O
 +UG8xeoXlZKfqCHga2wqtu7S7wjwm121R9wxcCOu7IS4OUBdFA3mugunE+dckyPSvU98LnCtNth
 vlCxAfyNSGlc46IvlovgH7T9XG/oolZmTmPrxT99q6604qX1mKM6BjCHseM2HXEeNNwPSll2ydI
 w5XY9/VAd38SoSZvr0ETDqnKLztOlBZE6CnsOGDDwSlUupm7MpuiuVTAvvZQooMQFBNeO9VN9Tg
 9fhcvsEhqlYjgnOgeDQ==
X-Google-Smtp-Source: AGHT+IGlDLmpPl2zCWmrTLJq7SUerDnsdxtYZFczMcw9Hq88U0jJtCHAgf74LzMfHqeRTtLEa6i0Qw==
X-Received: by 2002:a05:6000:2913:b0:3a3:6415:96c8 with SMTP id
 ffacd0b85a97d-3a51d973ce1mr1542135f8f.41.1749030048074; 
 Wed, 04 Jun 2025 02:40:48 -0700 (PDT)
Received: from localhost
 (p200300f65f13c80400000000000001b9.dip0.t-ipconnect.de.
 [2003:f6:5f13:c804::1b9]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a4efe6c8b4sm21566932f8f.36.2025.06.04.02.40.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 02:40:47 -0700 (PDT)
Date: Wed, 4 Jun 2025 11:40:46 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>, stable@vger.kernel.org, 
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] Revert "drm/amd/display: more liberal vmin/vmax update
 for freesync"
Message-ID: <jn3rvqffhemwjltd6z5ssa2lfpszsw4w7c4kjmkqqbum6zqvmi@pv6x2rkbeys6>
References: <20250530200918.391912-1-aurabindo.pillai@amd.com>
 <CADnq5_P1Wf+QmV7Xivk7j-0uSsZHD3VcoROUoSoRa2oYmcO2jw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gzfrlhuuaavchuze"
Content-Disposition: inline
In-Reply-To: <CADnq5_P1Wf+QmV7Xivk7j-0uSsZHD3VcoROUoSoRa2oYmcO2jw@mail.gmail.com>
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


--gzfrlhuuaavchuze
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] Revert "drm/amd/display: more liberal vmin/vmax update
 for freesync"
MIME-Version: 1.0

Hello Alex,

On Fri, May 30, 2025 at 04:14:09PM -0400, Alex Deucher wrote:
> On Fri, May 30, 2025 at 4:09=E2=80=AFPM Aurabindo Pillai
> <aurabindo.pillai@amd.com> wrote:
> >
> > This reverts commit 219898d29c438d8ec34a5560fac4ea8f6b8d4f20 since it
> > causes regressions on certain configs. Revert until the issue can be
> > isolated and debugged.
> >
> > Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4238
> > Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
> > Acked-by: Alex Deucher <alexander.deucher@amd.com>
>=20
> Already included in my -fixes PR for this week:
> https://lists.freedesktop.org/archives/amd-gfx/2025-May/125350.html

Note the way this was done isn't maximally friendly to our stable
maintainers though.

The commit in your tree (1b824eef269db44d068bbc0de74c94a8e8f9ce02) is a
tad better than the patch that Aurabindo sent as it has:

	This reverts commit cfb2d41831ee5647a4ae0ea7c24971a92d5dfa0d ...

which at least is a known commit and has Cc: stable.

However this is still a bit confusing as commit cfb2d41831ee has no Cc:
stable, but a duplicate in mainline: f1c6be3999d2 that has Cc: stable.

So f1c6be3999d2 was backported to 6.14.7 (commit
4ec308a4104bc71a431c75cc9babf49303645617), 6.12.29 (commit
468034a06a6e8043c5b50f9cd0cac730a6e497b5) and 6.6.91 (commit
c8a91debb020298c74bba0b9b6ed720fa98dc4a9). But it might not be obvious
that 1b824eef269db44d068bbc0de74c94a8e8f9ce02 needs backporting to trees
that don't contain cfb2d41831ee (or a backport of it).

Please keep an eye on that change that it gets properly backported.

Best regards
Uwe

--gzfrlhuuaavchuze
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhAFJoACgkQj4D7WH0S
/k5n6wf/VlmfUOIe50cqBTUUIeeMNPBzDFT/pZ3xuy9BtsWt0RBVULTZv7v9YjGy
0ab2JCut1k2lBa3p77E6KTLkkeWgitWNBauo45cenQOj+EQBZnHOViNJmjfP5f7+
4d/GOCV2fZwwR3QDQmc50j2NqkMVs3hPYk7mv4RBEtRjyZJBNtnYBCNl1zZqIZw/
s7RjTnsXli8iUfDJwlu1Sk1RHv6sOtodWhSIaylwRag5+oGyxYNtW9KCMjOrrIbZ
i6DLxABGY7Nt3EPtTkvcTBAYOXmMNrxDRTvu1Njek0B5aCQkgnyEzqd1vplRgIkG
ahM1uNWSyCHT/zCjx9+7CGwcj8nMYw==
=drHe
-----END PGP SIGNATURE-----

--gzfrlhuuaavchuze--
