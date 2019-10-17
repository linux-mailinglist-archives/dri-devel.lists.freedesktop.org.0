Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E109DA655
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 09:22:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 803F06E453;
	Thu, 17 Oct 2019 07:22:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 543FB6E453
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 07:22:28 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id b20so1382478ljj.5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 00:22:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=uZdFfHnySTEwK72wxovqAAx7jEJGQ4Xo3h3H48qnX3Y=;
 b=Yf4+8naoPbV4xPC7BgewAP1KSNQay1Dz+fgTyK5etlZ4q2cP71m+EQXdqSCKugrZw0
 6zCBhLTGAnqWn4HFywLUsEnl5Awl1H13wdwL8D2OJBqNWC2yKKDWKQ5yRXpdShmLh/t3
 duZ11UNDK4Lv5I6AxWUzCEiRBfDReHwuU5KDCr11aSENVwTlsp+GsCuUsNMbBs2hYGx2
 HWCfzGLPUQ8dibN0KCvA5Q0GkYrK2F2b979IzTGhIuGErspL89amsTaeip8kBAmd1SB2
 Cr+cAhnXIeGD5NJtprY9sp/fGmRRIKSLjQaskDSimJmDz9h+bV31tar+bViroiStGx+B
 k/ag==
X-Gm-Message-State: APjAAAUi4fEgM9mw/1gE+EoLAxW45x+LEXMQD2G5IPvWsfpYANqM7EEi
 vkCB8lEHqUnFmyi5RxL7Jw4=
X-Google-Smtp-Source: APXvYqy7/Hl13kES7WG8q3Kkoz4qWbu9PFVnKV3wCYvXiaLJoIqZvN19blJSJUWCvR6bIEeqb4e84Q==
X-Received: by 2002:a2e:8197:: with SMTP id e23mr1454067ljg.218.1571296946611; 
 Thu, 17 Oct 2019 00:22:26 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id s7sm565140ljs.16.2019.10.17.00.22.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 00:22:26 -0700 (PDT)
Date: Thu, 17 Oct 2019 10:22:16 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm: Funnel drm logs to tracepoints
Message-ID: <20191017102216.20f98533@eldfell.localdomain>
In-Reply-To: <d6b47400-c254-4f6b-5fac-59693571dee0@suse.de>
References: <20191010204823.195540-1-sean@poorly.run>
 <242462f0-ac8d-ab8a-e567-74678da3f68f@suse.de>
 <20191015191156.GW85762@art_vandelay>
 <20191015200233.GK1208@intel.com>
 <CAKMK7uE_DiXH_Gz6JBObv_Fs7cUhkH1wTVw4LDx2GZVueqYAPA@mail.gmail.com>
 <20191016160557.73b634c9@eldfell.localdomain>
 <d6b47400-c254-4f6b-5fac-59693571dee0@suse.de>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=uZdFfHnySTEwK72wxovqAAx7jEJGQ4Xo3h3H48qnX3Y=;
 b=oLecQv9YV7wC8yIGP5tOMKYXEHicb6YgOgybmfZv7zbkqOUh7EBNWjWwzYgOZzPdQ/
 gbfN42k3Nw29CxPTkaJt+zWdlmvH9x/E46MtDTcuofc5uHo+NM16oE6Q6dJGfdRfXLek
 RO7AWi+kbGz7mhAvpY3vwwAsBjvKPJ1uSHUxrJdJJhW7Wo/tVmJbEa2G8LPNr9Nzc1l3
 NGoGe3XcQHZfUnR3Jk1SVkYPmlQcscZcof8heGYCB8abVQP17YkKkZxBOBr7NJG8wKRQ
 qA0Gzz6rlPeM8s9CO0fnWc61CIPMYxaxonmdZXHdwAy/2gAK2nt1k85JWWNMsU9T/8Qx
 Jpxg==
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============1374107109=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1374107109==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ueu3hbQR1BEgUBw8zqwu85e"; protocol="application/pgp-signature"

--Sig_/ueu3hbQR1BEgUBw8zqwu85e
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 16 Oct 2019 15:23:45 +0200
Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Hi
>=20
> Am 16.10.19 um 15:05 schrieb Pekka Paalanen:

> > specifically be available in production. So a new file in some fs
> > somewhere it should be, and userspace in production can read it at will
> > to attach to a bug report.
> >=20
> > Those semantics, "only use this content for attaching into a bug
> > report" should be made very clear in the UAPI. =20
>=20
> Has this ever worked? As soon as a userspace program starts depending on
> the content of this file, it becomes kabi. From the incidents I know,
> Linus has always been quite strict about this. Even for broken interfaces.

The kernel log content is not kabi, is it? I've seen it change plenty
during the years. This would be just another similar log with free-form
text.


Thanks,
pq

--Sig_/ueu3hbQR1BEgUBw8zqwu85e
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl2oFqgACgkQI1/ltBGq
qqdtgxAAhgLNYtWGWk8fEwO+DxtAMsqB6idCLwVIyNwAAzNKqX81vsoFthQGGHx5
69Jbo7M3n1EFJyff9V+8g5KRaUeI0tKDX/y4v+Dh1yo1c4CAtq+8QCsUmIdYmW6S
se5Yykfrh49MNSmTReAj9JXN6uVCOVDs+eo/WRw19HRhNH85IqMoRm5JF64/bNB5
qj+uU6W7RISW5FPGognQcZrb5Ho+FRkbq4Ms6fJ/41hyB6+icdz+t6q3lnm0g0qv
g07IEW9leiDc/KKV+4wkitYyq5+CLoat9ccYdee1krmMjHNyDfU9z6cepliHGmPQ
Qt+KwOXS752Dw1nm0mXWD0onOWzcj5fS5CVIJhBg738tMWfcmMC6Ff6UY0w+6DC3
NRXaDKtn/ZOcju2X/eik7EAHmLFa92GikOF9OHmy46E9csikibg6FyvOrzGEmRvl
w+2LuEKF54Ejs2cq/KUibe7EeenL1IdM868sdNx/A1zlYV6WnBluimeRrJ1kw3Mx
lvumxIwDuaQd837WYv8I+xgqTq6yiOmYGbpMpkTOas621EUuK4F9OxvvrCJEhdEX
tAxaLD9wH8gLjMQ1pUIoyP0+m452TgcUHLJ90ecdZCv3xpknL9zN/DzVRyBJj36C
/eV6zGOaWGUDwAEM1F+rCfjuAq+o1kOxcbVnLWhoBenVZjKYaRk=
=v/JI
-----END PGP SIGNATURE-----

--Sig_/ueu3hbQR1BEgUBw8zqwu85e--

--===============1374107109==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1374107109==--
