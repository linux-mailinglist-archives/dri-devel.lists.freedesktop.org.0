Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F2711289E
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 10:54:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40CAD72DCF;
	Wed,  4 Dec 2019 09:54:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6766A72DCF
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 09:54:41 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id u17so7359344lja.4
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2019 01:54:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=LMfnDz9OfMA3ceIEyvSQnXs0KXru3o+0rwwDfyQTLYs=;
 b=XRaRvHfVAEFWdxrpiyZDDaGGjdUNKZdBQa6zt8H3Y274fgZDDxyGmjkI4F9ogOrm2J
 tgiziCg0i6E78khl2ewaalFmq4s094w/UnAcJImxLH8vpTUqLmmyr/NeZgY+tVsOurXf
 YArZCZ2VMgQtcpUkcT4g/UeURzOjyg+dYJfxgJlTCmPbb5+KPp0nyE5CgIHg+kGeVH8h
 rAzMdowMPvUtdXIC7nHfe1t7jpr0ae5M7wRBfnx4SaIApSrdm0dp2V409thKJegwpWy6
 93vSnEeXLAocV3Zyq34Dh0b5UpALeq4t770Yr0QXJDSwPhJw6C2Upg+S7b4bTAKvuHX4
 /7tg==
X-Gm-Message-State: APjAAAWATYnDJsW95MhPHOS0f1XLKFAjgK7OCfEAz9nxKNaBrv1mQ14i
 IWYenfFkC+fYpuseNMLgwGI=
X-Google-Smtp-Source: APXvYqyk5kZuML4UzlcMkdjrX9hJ4KgtyTtToA0N+nVfQYrExC1aR52S7XTn2Ume0z0nhlxwfDxI8A==
X-Received: by 2002:a2e:864f:: with SMTP id i15mr1346439ljj.29.1575453279744; 
 Wed, 04 Dec 2019 01:54:39 -0800 (PST)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id j10sm3029091lfc.53.2019.12.04.01.54.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2019 01:54:39 -0800 (PST)
Date: Wed, 4 Dec 2019 11:54:20 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm: Funnel drm logs to tracepoints
Message-ID: <20191204115420.4cd3f916@eldfell.localdomain>
In-Reply-To: <CAKMK7uEUQu_M5fqoaiKdVKtdxoDZv49qgNB=w6+uvZL1bK0OwA@mail.gmail.com>
References: <20191010204823.195540-1-sean@poorly.run>
 <242462f0-ac8d-ab8a-e567-74678da3f68f@suse.de>
 <20191015191156.GW85762@art_vandelay>
 <20191015200233.GK1208@intel.com>
 <CAKMK7uE_DiXH_Gz6JBObv_Fs7cUhkH1wTVw4LDx2GZVueqYAPA@mail.gmail.com>
 <20191016160557.73b634c9@eldfell.localdomain>
 <d6b47400-c254-4f6b-5fac-59693571dee0@suse.de>
 <20191017102216.20f98533@eldfell.localdomain>
 <20191203191054.GA162979@art_vandelay>
 <CAKMK7uF4F7WTHTvWmdrM+BBaPbvFtwVG0G7rSLx97NH5aEq+2w@mail.gmail.com>
 <20191204093326.57404495@eldfell.localdomain>
 <CAKMK7uEUQu_M5fqoaiKdVKtdxoDZv49qgNB=w6+uvZL1bK0OwA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=LMfnDz9OfMA3ceIEyvSQnXs0KXru3o+0rwwDfyQTLYs=;
 b=oNUupb2KvEY6DsyepNfPT8mBSXfJ7hiCkwdUG8lHBlb6UdKiX8pZk0+iORJpEhlAL6
 oBm5kE7c6o0vtj/rlNgmRwzwntU/ZdnYnE9G2GEYDvDbEL7h2Cp5u4vDnSqayx1jaQON
 sOyS8qPetMD+HPAdz3X8KUtBL+fkgD0Wt/VaEratN43yvbk8NiuvIxr1PvEvGVO0yk02
 9m7pZQh/19/xb2bZMFkjUmZqqEKBRCxe8g6oIUIJoHTxivOwS1upwSMTFWRUX6qLohBu
 A5Ag8t0E/s82XlCN7IrbaPqOpwpd1EUTtmr/eJoOemvXI1N2u1x552eDRpQtEi6ou9gN
 KdGQ==
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============0112960819=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0112960819==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Fjktixic=pVq/ENF8TvlnKz"; protocol="application/pgp-signature"

--Sig_/Fjktixic=pVq/ENF8TvlnKz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 4 Dec 2019 10:14:11 +0100
Daniel Vetter <daniel.vetter@ffwll.ch> wrote:

> On Wed, Dec 4, 2019 at 8:33 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> >
> > On Tue, 3 Dec 2019 22:20:14 +0100
> > Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > =20
> > > On Tue, Dec 3, 2019 at 8:10 PM Sean Paul <sean@poorly.run> wrote: =20
> > > >
> > > > On Thu, Oct 17, 2019 at 10:22:16AM +0300, Pekka Paalanen wrote: =20
> > > > > On Wed, 16 Oct 2019 15:23:45 +0200
> > > > > Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > > > > =20
> > > > > > Hi
> > > > > >
> > > > > > Am 16.10.19 um 15:05 schrieb Pekka Paalanen: =20
> > > > > =20
> > > > > > > specifically be available in production. So a new file in som=
e fs
> > > > > > > somewhere it should be, and userspace in production can read =
it at will
> > > > > > > to attach to a bug report.
> > > > > > >
> > > > > > > Those semantics, "only use this content for attaching into a =
bug
> > > > > > > report" should be made very clear in the UAPI. =20
> > > > > >
> > > > > > Has this ever worked? As soon as a userspace program starts dep=
ending on
> > > > > > the content of this file, it becomes kabi. From the incidents I=
 know,
> > > > > > Linus has always been quite strict about this. Even for broken =
interfaces. =20
> > > > >
> > > > > The kernel log content is not kabi, is it? I've seen it change pl=
enty
> > > > > during the years. This would be just another similar log with fre=
e-form
> > > > > text.
> > > > > =20
> > > >
> > > > Ok, so given the more structured version of this set [1] was not we=
ll received,
> > > > are we all comfortable going with the freeform approach in this ver=
sion? =20
> > >
> > > Imo yes. It's still uabi, so someone will have regrets about it. But
> > > given that dmesg has been around forever, and causes rather little
> > > breakage, I think we should be fairly ok.
> > >
> > > I still think that figuring out the drm_dev logging bikeshed might be
> > > good, while we noodle around in here. =20
> >
> > Hi,
> >
> > one more wacky idea: have a flight recorder buffer(s) in the kernel,
> > but do not expose them as is to userspace. Instead, create a trigger
> > somewhere (/proc?) that causes the flight recorder buffers to be
> > flushed into dmesg. That way the amount of new UABI is reduced to just
> > the trigger. Obviously this spams dmesg and would need the rights to
> > access dmesg to actually collect the logs. I'm not sure if that's good
> > or bad, but it would re-use dmesg. =20
>=20
> That's roughly how we ended up here, since trace buffer dumping is
> something that exists already (you can e.g. dump it on an Oops too, we
> do that in our CI with a few i915 tracepoints enabled). I think at
> that point a section in drm-uapi.rst explaining what you
> should/shouldn't do with these tracepoints is about as dmesg.

Sorry?

Is there already a kernel flight recorder buffer (a ring buffer
continuously overwritten with DRM debug messages) and some userspace
trigger to flush it out after the fact, without any preparations
needed beforehand from userspace?

I specifically mean not like "you need to enable a thousand tracepoints
manually from userspace and they don't have any stable names so you
can't even do that". The whole point is to have a single one-bit stable
UAPI: "flush out" and nothing else, into dmesg (maybe as debug level
prints). Not any tracepoint enabling hassle that userspace would need
to take care of, since it cannot.

Preferably as much tied to debugfs as dmesg is: not at all.


Thanks,
pq

--Sig_/Fjktixic=pVq/ENF8TvlnKz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl3ngkwACgkQI1/ltBGq
qqePrxAAhsszBmy2M9fiUoio05g86DU3S8GYo9g33WwA6QEN/XjgYk+sA5L2xdtS
QkWyXFqiPyQ2ZCdHtflczzlTjKJ9obEeVhTdbf35o2aYMeG4hGcy+Q4Xo924Jw5Q
8HmWp4y3GKc+tstnT7ovzEXDixIM6aq2cNbwsUA0RtpWvKxlBnhzsSWY4QJSEZVS
5QuJSTXnwQdbJNT1H9VLcoOeQ80hJPMgL3TCvzV99h38I3UpKjYjrX+m5YpVQwtD
izA4d6KUOm8psYW0S21f2AhsLhBwkkvYI0enmkYw27wrmsE6emqWAOOdLaMadi2n
pXDuIzpTlT0/8SJ+TMd2NE3N28y1mfJCiPw7W3VO/mBXx8DIgNF1DtP746eFzPD7
7L7HEetpJdytJRxHOIIs+2rpXkanwy0B8vLLopTdDGXnn+kDNP2sO2ctqTXxItTm
RJ/HHezjS6+up5ttifWODkZIotDR82ZFGLe1uVX1QX6qvT5wKEX9VOngCSCb3IFh
srDHwShOLtGXJcOqz0xH2y/vOVQ2Dgke/1xwZH9Sfx+/WQJFlOq4Ot+MskwBQPQI
1jr0QoSxyYarHCbI5659950vsfldfIau9ff6B2DiiipGONO1VX5BKdsrFsi45BOr
6Of6MAsw2v4miRVG/JmwZTtyR6fiOYLtM0m/txbdVnFV4tV42wc=
=wdeu
-----END PGP SIGNATURE-----

--Sig_/Fjktixic=pVq/ENF8TvlnKz--

--===============0112960819==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0112960819==--
