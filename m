Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 548171123A0
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 08:33:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F38916E087;
	Wed,  4 Dec 2019 07:33:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35EC66E087
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 07:33:39 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id 203so5232926lfa.12
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2019 23:33:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=Y0LNlSJxWTrbj+zfxka2pLH0tRwSP3DqJogXA03XRxQ=;
 b=R0KDkTF3uMPwfipSAHqIJ92yLKgBjNmP+J6+MxzN/tB7l8FzCdeak7j9xFvVbqm+ag
 aLwReNuspe7NoHUcQldbSn68otTjASjxLyEwwCTb4LFw0LUOtnYZFWxuThufHvjSi571
 aY7R27gX9nAUwo+LFhAqav9xrBziGoM4f5fCjwldvFMS6qg747RZNL2PfL/SviecXthV
 b8l6zAjyzGlJ1pR/av3XRMJ9CJHcrnn0Yil6grkDGnICS10DkQWVH6aMygJXZ3kNHByS
 SX0GewH6YWkpWxCfmw6dS56RR6GacIMXHtix209VBQgOvkUlx4vQUIHvcbinoMZg7Udo
 U18Q==
X-Gm-Message-State: APjAAAUkPCzHHe1Qi0kRXeXY1HBOYi5Tys2HR2NQgnCNTVsAjOGQ1Nfp
 t8WVo4+wmnUh+XMZsTqifdw=
X-Google-Smtp-Source: APXvYqyemasyzee3xeUGmQ94GMKWoibcijbGiKeqZH7noz3rp6OLoIdui6yQFy3giT1rjzjnGbcs8Q==
X-Received: by 2002:ac2:51de:: with SMTP id u30mr1163457lfm.69.1575444817602; 
 Tue, 03 Dec 2019 23:33:37 -0800 (PST)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id u19sm2537752ljk.75.2019.12.03.23.33.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 23:33:37 -0800 (PST)
Date: Wed, 4 Dec 2019 09:33:26 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm: Funnel drm logs to tracepoints
Message-ID: <20191204093326.57404495@eldfell.localdomain>
In-Reply-To: <CAKMK7uF4F7WTHTvWmdrM+BBaPbvFtwVG0G7rSLx97NH5aEq+2w@mail.gmail.com>
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
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=Y0LNlSJxWTrbj+zfxka2pLH0tRwSP3DqJogXA03XRxQ=;
 b=DaoIMJOsH1KYWaersG4G73hNB8ezybnmhl+qjA36rPs3NgLnG8TUAvNZ2XSrrIuCix
 KoVTFo4uxfdP1NT97aeNp3y/0B9ihUYHcJ6CNdN+JI5upZy4c1eD22aDlCN6NBq5xOVK
 vA2SQpY83v0QBeh/vywc5Nh4gfKx9rwsWDtwUcyyAAuU/lBvkaz4rwsyvhMwQLqqePPX
 MEgu1yat65crGmRdDT3gCrBM8MejpJW0CXRsSu0l3yTpQVmm4CJO5aUmf0UTn6kdyMYa
 EV/vycndvfzXWKnRB2VLhQ3j60G1QyGYbMqkHysrbPkLOpAOz9wEIcMXvaDKuiZyUSrP
 XHWQ==
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
Content-Type: multipart/mixed; boundary="===============1941301592=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1941301592==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/3nDhHJwcleTOWGmW/C/RP+m"; protocol="application/pgp-signature"

--Sig_/3nDhHJwcleTOWGmW/C/RP+m
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 3 Dec 2019 22:20:14 +0100
Daniel Vetter <daniel.vetter@ffwll.ch> wrote:

> On Tue, Dec 3, 2019 at 8:10 PM Sean Paul <sean@poorly.run> wrote:
> >
> > On Thu, Oct 17, 2019 at 10:22:16AM +0300, Pekka Paalanen wrote: =20
> > > On Wed, 16 Oct 2019 15:23:45 +0200
> > > Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > > =20
> > > > Hi
> > > >
> > > > Am 16.10.19 um 15:05 schrieb Pekka Paalanen: =20
> > > =20
> > > > > specifically be available in production. So a new file in some fs
> > > > > somewhere it should be, and userspace in production can read it a=
t will
> > > > > to attach to a bug report.
> > > > >
> > > > > Those semantics, "only use this content for attaching into a bug
> > > > > report" should be made very clear in the UAPI. =20
> > > >
> > > > Has this ever worked? As soon as a userspace program starts dependi=
ng on
> > > > the content of this file, it becomes kabi. From the incidents I kno=
w,
> > > > Linus has always been quite strict about this. Even for broken inte=
rfaces. =20
> > >
> > > The kernel log content is not kabi, is it? I've seen it change plenty
> > > during the years. This would be just another similar log with free-fo=
rm
> > > text.
> > > =20
> >
> > Ok, so given the more structured version of this set [1] was not well r=
eceived,
> > are we all comfortable going with the freeform approach in this version=
? =20
>=20
> Imo yes. It's still uabi, so someone will have regrets about it. But
> given that dmesg has been around forever, and causes rather little
> breakage, I think we should be fairly ok.
>=20
> I still think that figuring out the drm_dev logging bikeshed might be
> good, while we noodle around in here.

Hi,

one more wacky idea: have a flight recorder buffer(s) in the kernel,
but do not expose them as is to userspace. Instead, create a trigger
somewhere (/proc?) that causes the flight recorder buffers to be
flushed into dmesg. That way the amount of new UABI is reduced to just
the trigger. Obviously this spams dmesg and would need the rights to
access dmesg to actually collect the logs. I'm not sure if that's good
or bad, but it would re-use dmesg.


Thanks,
pq

--Sig_/3nDhHJwcleTOWGmW/C/RP+m
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl3nYUYACgkQI1/ltBGq
qqdUbw/8D2Xc925gUTuiaBCO9mlq+QAMfBaFsj3tB4s4X8Fa5gORX9i+66+h9Fr7
YCuljSiQIHbOHrKDGx22Z5Ws3S0G1ZPNZVcO/TkzibVZSnhRWhf2JetkjstxwMnd
OiJ8XtYVLgpEX6H34g9b573nmRXj4iu/P8ZDkXpmvBGQxqQyDD/2Er0PG+9ijFGr
oNxWj4/H5CP9Dnd85n8JkRGhD5VlCF7qL7pOWtzxu69+Kliyp3ISjFKkzuVy3s0l
NWvrePEJuJcVS4rU120J55s9E7TMawhgf/VgFOWHYQ57u7LGJINoeRh6ZCYacrNV
mZsK0zjjqYpx6/6IcdzoIaf6aRkTleO2qPLcrIbNZ1goeIU0IlGoAApHkQq0zlWH
65I6EPCQzf8T/XcDzaRNImZ3F7PyunSS+eAI0UkeN5HYrLmsOx//ia6cfo9bXULb
LepT0i88Hx0u/PavTffMrn/9JBSHRZO6frLdNY7kA/ORnm27nKbJm7rGiLTrYv5b
AYaYOorw2cXQLWN1jVD7BP+q7Fd4HjDKi+JbPQz/ttU7Yk/IsYko+EuUxyVgClTN
qx7U9zxgP9ikYpY2d7/LK9V4ssvD3JlRRxFWf0BM9jD2QLdZWNxJF5dUUle8YNiG
AjjBO8QN/l9P3Ly/9CZWSd0EI1NijuHsoanZjSDIp1jHc67etH8=
=qYen
-----END PGP SIGNATURE-----

--Sig_/3nDhHJwcleTOWGmW/C/RP+m--

--===============1941301592==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1941301592==--
