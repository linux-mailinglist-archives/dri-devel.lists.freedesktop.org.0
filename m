Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EF975C48D
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 12:22:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3599510E645;
	Fri, 21 Jul 2023 10:22:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBBA410E64E
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 10:22:48 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-316eabffaa6so1382544f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 03:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689934967; x=1690539767;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LQV2smbNrzQFDcHhhFzTBfVgq4bxasw/BYlbRhCNkjA=;
 b=n15e6E22gYiBhLREK+/4tG+5gtdUZMDiek584MyoxR5DvC4k6sAH/0bHnDyml4AUML
 u8NI4q4LJYkeU4p4WyKgqIind6DeYj2ZpPIhhXxdH+AV/IMLe0NSxuZrLv3DgfzUfr5E
 D/xiASI1ye+wzhHWgTLPbjxt9WA2BYyB4yqXpgu39rb12XwirQlxjx8jVSNfDSSsqlcK
 BGeV5xCxdopm0+x35MesVyGeORCID23Kx30Rlu3fa4HnkBsnIK6XhGclYd8g/+CKB50H
 rgvaAElOzUO4Ye/9HZ0+f8YFJYLoKF/W5ajcU3wsgK2S8a1XK6d/6hDGmrRrrP3AMUy5
 QK+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689934967; x=1690539767;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LQV2smbNrzQFDcHhhFzTBfVgq4bxasw/BYlbRhCNkjA=;
 b=e5TOWxdP0UDUEc4KZcWyXpPjWXYD2S6TJKzp0ZGaNxERvJ0ntYyRk6J/e5ag6lUmCY
 cEs7+6/J3frE1Ba83iy7QoYIdei55JOnisZ+waAfm/scQ5Tse33U9kSR3xNpYDC8QdYK
 Echb3209mmcznjXHF13WTX7jQMScjAltw6wrvspPzE0NBP8hZgzS63IeEeQWd7XbNa8/
 li99EEmNiG4O8whLFkqhsbrrrJOYAkvyssimfcObA6qBeVkhFJw5/u4z3vgECcLMvq83
 vYTdd7VdNTlH9VLKUrqd0NsJzRuiswbi+P4FQMBnYWLcsLi3aKOg9ffhqZX/ohtla2ra
 BrPg==
X-Gm-Message-State: ABy/qLaSGOE8ksNptXsfOqPiOoRpYMoLnGLn1/DayQJl1RbzZ1fLm/lC
 hcZGDaSYvCoa5fy4WMpS7L2MP0QTca8=
X-Google-Smtp-Source: APBJJlFyryxa1uHJkw5w7d2VXGVUUkM+Cfx5daiFmZUYIQp/lPX+LKfbX2kzzHLBeIfXORIYUJSQuA==
X-Received: by 2002:adf:e7ca:0:b0:314:1494:fe28 with SMTP id
 e10-20020adfe7ca000000b003141494fe28mr1033893wrn.53.1689934967139; 
 Fri, 21 Jul 2023 03:22:47 -0700 (PDT)
Received: from orome (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 r6-20020adff106000000b0031424950a99sm3793324wro.81.2023.07.21.03.22.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jul 2023 03:22:46 -0700 (PDT)
Date: Fri, 21 Jul 2023 12:22:45 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3 2/2] gpu: host1x: Stop open-coding of_device_uevent()
Message-ID: <ZLpcdYYMgJjycvLE@orome>
References: <20230622213214.3586530-1-miquel.raynal@bootlin.com>
 <20230622213214.3586530-3-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dtWf7IRVx8KpQMZQ"
Content-Disposition: inline
In-Reply-To: <20230622213214.3586530-3-miquel.raynal@bootlin.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
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
Cc: devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Frank Rowand <frowand.list@gmail.com>, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>, Rob Herring <robh+dt@kernel.org>,
 linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--dtWf7IRVx8KpQMZQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 22, 2023 at 11:32:14PM +0200, Miquel Raynal wrote:
> There is apparently no reasons to open-code of_device_uevent() besides:
> - The helper receives a struct device while we want to use the of_node
>   member of the struct device *parent*.
> - of_device_uevent() could not be called by modules because of a missing
>   EXPORT_SYMBOL*().
>=20
> In practice, the former point is not very constraining, just calling
> of_device_uevent(dev->parent, ...) would have made the trick.

Yeah, looks like that's correct. I guess I always thought this
information would get added to the sysfs node of the struct device *
that was passed in, while it actually gets passed to the environment
created for the struct device passed into the caller. In other words
what we pass to of_device_uevent() here is only ever used as a source of
information, so passing dev->parent works.

I've also verified this on Tegra30 Beaver just to make sure and it looks
like the generated uevent file is identical before and after this patch.

Applied to drm-misc, thanks.

Thierry

--dtWf7IRVx8KpQMZQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmS6XHQACgkQ3SOs138+
s6HoYQ//QZI4hsS1hsIAv5neWAT2cYurT0oKAB/0lYWOfY4uWBC9+3yVBkatirlf
k8iRuDMTqb7WagBicylKoGr79MvJmbqzxU9gKqIMuqFGplHmmRTFVCg6DZdEtt5j
HO/pXAaSBJWLu1u08C1Aa34uOiLcQs/qE22ufuyLJgTVW0Ol4vRIiy9bWf+VvmIr
OqwFfRPV3Wu7B5a8cMIyAIruU4NjaEjDELt8Ltlelc2q8UEkd0Wl2OSSsejuHbDX
8Cg2ZwRdBe54h+rBZEznQdup61MyT9uxyER9RWE5rn0NqlTkEPoAq4G16Q1TigYA
Lt/vabmiBkcfKXtCHD9lVaVpHlMtP9NGrjztJwN7Vn++o1/SWGX/rCqS7U4Lu8W5
De1aRUUcd5N+WSFsFIFKbQ8Op6d0LeZGgkh/sPxvBl01cwBd9cozVkNJInxNJoX7
dV1KPVBugRRRsQyQgyjP0dsh8ypFui0PrT50AFlUD4XFcw/zJ9p60hdZFyuuq65v
Fkq8bg7vJRjEfGAlLn35GLfmOtMK0KDO+35vv8tVqAngjDscu3ADXGYE2o0DcIi7
cIrcbi0S7BraIn7ta2MwVDfYMi0701GOol1WstmXlfbk23ym+VySTsLlpuZmeVzV
dxAHVPyfEAW/aiVQWpFLvhrfgiOx2T/SEexcsP5Rft+pNH3ZuaM=
=eWzi
-----END PGP SIGNATURE-----

--dtWf7IRVx8KpQMZQ--
