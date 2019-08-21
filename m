Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 526CA9786F
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 13:55:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB716E2EA;
	Wed, 21 Aug 2019 11:55:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B1A897EF;
 Wed, 21 Aug 2019 11:55:28 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id o4so1813840wmh.2;
 Wed, 21 Aug 2019 04:55:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=KcUkbB1oJAzAeUPVtJdwFSVIzZDZ5ZeL5UV3cYaJ4Uo=;
 b=GvPJVH833A2Cd+JQCssZC9hvDk8XzjAQFb8V3cU5IFnjVKbdePzGC8ZoIxkZijwLf4
 36FJ3IEcOge7Lqp+utVPsiLIZSZPq5OMOsPjPyTrHVzGP5gi4FuvcXTSC0lLUuWmYGUw
 DZE1qWv7vxmqLMQj0UGb2CgzztWga20XnJiaBgtMNqhVzAgi9Kc06obnSGtYJv09/6Zr
 2Uh39dQlXqTv90aEJcD2zo5vMcf038ojbZNV3uujNVnw40zLmxz6RpFgbwk79UXnVJba
 Ldvgs4jxADkx8imE3EX4UhVT2SweQHMz1re2jyPub/b/bZjgL8qYh1q605sXkNGyGFqe
 oIFQ==
X-Gm-Message-State: APjAAAWyqRuqwTx4mSy72e2TROQ1Qp1qUUwlaFFiGBSVpvtmBzlE5kyk
 SPvUWzmRLjd2eOPhyGe/us8=
X-Google-Smtp-Source: APXvYqwunuwr2KDBPIxE6ORT5hP4MncsNPzCGpYDpTideW+0/Ep7oYAVY9cvDl3PxN9oqw7yNLeNbA==
X-Received: by 2002:a7b:c3d0:: with SMTP id t16mr6063320wmj.25.1566388526985; 
 Wed, 21 Aug 2019 04:55:26 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
 by smtp.gmail.com with ESMTPSA id o16sm28419234wrp.23.2019.08.21.04.55.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 04:55:25 -0700 (PDT)
Date: Wed, 21 Aug 2019 13:55:23 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [Nouveau] [Intel-gfx] [PATCH v6 08/17] drm/ttm: use gem vma_node
Message-ID: <20190821115523.GA21839@ulmo>
References: <20190805140119.7337-1-kraxel@redhat.com>
 <20190805140119.7337-9-kraxel@redhat.com>
 <20190813151115.GA29955@ulmo>
 <20190814055827.6hrxj6daovxxnnvw@sirius.home.kraxel.org>
 <20190814093524.GA31345@ulmo>
 <20190814101411.lj3p6zjzbjvnnjf4@sirius.home.kraxel.org>
 <CACAvsv5Rar9F=Wf-9HBpndY4QaQZcGCx05j0esvV9pitM=JoGg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACAvsv5Rar9F=Wf-9HBpndY4QaQZcGCx05j0esvV9pitM=JoGg@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=KcUkbB1oJAzAeUPVtJdwFSVIzZDZ5ZeL5UV3cYaJ4Uo=;
 b=sdVMTEFZMbSfY285XeoA6H7quYwLJdPYIKQmnG7KUeYKqYiD2iy8LdwWG1VqWhZYr5
 DGjCZpvV97yFFsDkrm/9rcQ5fTO/SUNwA9FXGdBlAUhlo6ir8uZfv7fJeg8N6TCw2uqa
 niPWPvEXoAfftj+IarHWB8eXj+XtfCKe1J3mm+ddPyDo6prlL+rSWW8ejDbPBdDA4K/2
 70vUw5FxcaUx4P9ved1IuitGn8S3uJmns5h5hd/lIrgF3wJcedyPekDg63GWwl6zh6Z9
 IVDI39+vHNdc5bQao1LmsSpUUtxRDQAicTAcfvRltSBqfgJpV0GvXibqDEZJ1gL2ApPf
 Fmgw==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 ML nouveau <nouveau@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-graphics-maintainer@vmware.com,
 Gerd Hoffmann <kraxel@redhat.com>, spice-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: multipart/mixed; boundary="===============1364063386=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1364063386==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
Content-Disposition: inline


--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 21, 2019 at 04:33:58PM +1000, Ben Skeggs wrote:
> On Wed, 14 Aug 2019 at 20:14, Gerd Hoffmann <kraxel@redhat.com> wrote:
> >
> >   Hi,
> >
> > > > Changing the order doesn't look hard.  Patch attached (untested, have no
> > > > test hardware).  But maybe I missed some detail ...
> > >
> > > I came up with something very similar by splitting up nouveau_bo_new()
> > > into allocation and initialization steps, so that when necessary the GEM
> > > object can be initialized in between. I think that's slightly more
> > > flexible and easier to understand than a boolean flag.
> >
> > Yes, that should work too.
> >
> > Acked-by: Gerd Hoffmann <kraxel@redhat.com>
> Acked-by: Ben Skeggs <bskeggs@redhat.com>

Thanks guys, applied to drm-misc-next.

Thierry

--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1dMSYACgkQ3SOs138+
s6H8fQ/9F4UBF0EhVBpcsMNo5HI1kJ8KEkbiNqUWwZEh/kPLyWXoFWSWvA5FG+rP
521CfufMmyezTHxOkPww6VEUsgaV9yEl00jqIhclgA43sBeDziR4XGzGmA/hpdpc
ky8L49+C8mfoICLHeBjOSbSHoPhv7EqS1w8CtZkCZkf1nApk/R71bbYk6iz8zCCY
dhZo6PGTJMpOoEQtryLjL2NJxvJe57zzsltRKxl9uEnjeDF0LRzqHYZ1Lt/mvRMn
hXMXC1H+jOtP4p7OtP8zE6oM7desaJ2h4jXF1v1/AZHNUxQYtRohHNrYXBDqfQF5
stLLdOjynZ8rcjhObmi3GeLbVeD2wEQJ7Qp7OgTwqbHnE4wXmAYD4KuKboJrQI8t
0Hd25epBD/CHDgn7Kqoj8DRy5NArmeCGRDHVuFYF45utaectO7IzaxRD5zLRs6Q5
vAA0fiy8JVs6ppQ6B9GtlQcXEKbmywLhBAzHb/Q7hukhppOhS+BxZO0FASdPmPnH
0kjoVG0oz9oH8X/ciqubGIAUkrq+SP+OnPVvg1zGfAkxLSUTDKMZ4ZmP2vlrRzaf
KFbFX02Gu+VDe/o7Pcf9F8pDlWS+jQL6KN+PFo2tkGP8HvouRsIagyzY/AJD0xuP
Bb3DKPgm8W5/ggiLoiTbXz+CUWR25Hm2vBU/CZ9Uv9KBPgv95bA=
=lGaC
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--

--===============1364063386==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1364063386==--
