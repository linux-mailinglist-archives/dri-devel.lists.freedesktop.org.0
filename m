Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6A534E195
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 08:55:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FB946E852;
	Tue, 30 Mar 2021 06:55:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC2D6E852
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 06:55:22 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id d13so1166726lfg.7
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 23:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=1jsWOxoyQCfkTr5+5+z2lN/kkkTcVyNslggcaR8Rk2c=;
 b=izuMf6e/BLLxHjV5UU54CW7NNsqwSVf0eKAMlC+1b4+sLursxvOB8k0lFWd90wlUJc
 sOpX5nS77HyPpZhoxS4Kt3Esu3JBD9NahRCU8+gcTnzNUlRUqRbDrMWhHPQ28dB+8nmd
 GHZeo2TGa6iTxJQek+yB8X+tV1OavGqOz/WEV7oiVvyB8HMqSG74dnU/EacBct/Il56f
 m6KfDNIdYztG3E9oDqubqTmq+YDsNc1MGFtOFIluHOezKOcWeA2P6ogjY1SXOkQPS5Pz
 qkws9qoQWTtcvkxYmRJkRBJzL36lcY/LD7+Ant4yGrQfHmaLur20uqhxv0rH+cmDSWj9
 f7+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=1jsWOxoyQCfkTr5+5+z2lN/kkkTcVyNslggcaR8Rk2c=;
 b=qx4WhF3myY7lmb4MHjiiNAAT3RKjiEKG6v+pjLaUe1iYtln5liltX35cTt1NmTazvK
 DgTTaeqPQarjha+1Zak02olEsJhOqG0CYA/zQGNa+idi7DKRANA+b6yL5QYqRRQMYzGr
 HwJAdUjIF85QF7gdRUDLEROUDwUWKMof+1oAOQdgqkStGEEb0MrZXRLJkxfK3sE4jh/7
 MBr0qoFsK9pCDveA45mFrPUfem6KaTRFV/nLJnUsMfLvxlp8fehVJye3pc8w2vC361/f
 8EztQbfrowmkzFxcQ+iNVEBSG4tR8LDVp10PqC2lVyLDOEfRc5HbXmiqWn/9g3Sed+eN
 /Plw==
X-Gm-Message-State: AOAM531RJMi6btQ+2xcFKE4kfMHjgaqWHt3TtTi3/REw+Kh+fEWcva7m
 UzzNWaRIBA83qyBb72Y0nxc=
X-Google-Smtp-Source: ABdhPJx0HuuT53YJq6EkxNoywPsAENHibGEd6ZjdO3S1YqjgBzCAuJ1csyt80CVEqKwBP3fN/M25rQ==
X-Received: by 2002:ac2:4205:: with SMTP id y5mr18633234lfh.375.1617087321043; 
 Mon, 29 Mar 2021 23:55:21 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id q3sm2080022lfp.233.2021.03.29.23.55.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 23:55:20 -0700 (PDT)
Date: Tue, 30 Mar 2021 09:55:10 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>, Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] drm: DON'T require each CRTC to have a unique primary
 plane
Message-ID: <20210330095510.4c6432f7@eldfell>
In-Reply-To: <f_BApfXCctltkOAAKup7ZXRsq8N81SZgbxIEFbHWzeoKZCo8z169Bkk4DDwk9WmMNKXpyxaMQCxbWzwVMgfNav0ZYVf3s_6bXRO89LKD_AM=@emersion.fr>
References: <20210327112214.10252-1-paul@crapouillou.net>
 <20210329140731.tvkfxic4fu47v3rz@gilmour>
 <BoDZUOZSsZmHjkYkjHPb18dMl_t_U8ldrh8jZezjkA6a2O-IBkPGaER4wxZ2KlqRYuXlWM8xZwPnvweWEAATzoX-yuBJnBzjGKD3oXNfh5Y=@emersion.fr>
 <TTLQQQ.OCR65URAWJVQ2@crapouillou.net>
 <f_BApfXCctltkOAAKup7ZXRsq8N81SZgbxIEFbHWzeoKZCo8z169Bkk4DDwk9WmMNKXpyxaMQCxbWzwVMgfNav0ZYVf3s_6bXRO89LKD_AM=@emersion.fr>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, od@zcrc.me, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, stable@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0490583426=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0490583426==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Ll+nnIQGkWAZjFxx5fyo+ff"; protocol="application/pgp-signature"

--Sig_/Ll+nnIQGkWAZjFxx5fyo+ff
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 29 Mar 2021 15:36:27 +0000
Simon Ser <contact@emersion.fr> wrote:

> On Monday, March 29th, 2021 at 5:32 PM, Paul Cercueil <paul@crapouillou.n=
et> wrote:
>=20
> > Making the second plane an overlay would break the ABI, which is never
> > something I'm happy to do; but I'd prefer to do it now than later. =20
>=20
> Yeah, I wonder if some user-space depends on this behavior somehow?
>=20
> > I still have concerns about the user-space being "clever" enough to
> > know it can disable the primary plane. Can e.g. wlroots handle that? =20
>=20
> wlroots will always pick the first primary plane, and will never use
> overlays. The plan is to use libliftoff [1] to make use of overlay
> planes. libliftoff should already support the scenario you describe.
>=20
> I think Weston supports that too.

Weston supports overlays, but I don't think it will try without "the"
primary plane, IIRC. I'd need to verify.

I'm not quite sure what Weston would do with multiple primary planes.
It probably picks one for a CRTC ahead of time, and then sticks to it,
always using it.

But if Weston never worked with a driver to begin with, it also can't
regress, so you're safe.


Thanks,
pq

>=20
> [1]: https://github.com/emersion/libliftoff
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel


--Sig_/Ll+nnIQGkWAZjFxx5fyo+ff
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmBiy04ACgkQI1/ltBGq
qqe2JQ//Q12xC+K+PQC1SxJESBwT4t1YaA85MpemH6/+/66zluM5BqGAyC3Yi/bT
YaTeWCrF2wbRx+Ei8aSymFHWypf9D2/eYz2vXra8oYxP3wrGtIM6a4hHo+oCC+XG
TEBtdcvatzWNVLcxs3p0Y6Pe6lgKZr5uPkA/3nrU2FzRkaWIuhs8akYB+KqNv19r
oyYg1Wdcvd57s0OhwcbNZOPuPEt/U5X0gY5HB4LV8v98oPdixrN+4z4ysXgCq2Ka
PvR0kOEkDPSYO2e9KCMthq6lq1J6kcDpd61Jb+sDpUVRnae/s4rr9zD6ddqWgycD
ljw0yuD+c+F6QNYwIIz2NU8uGSfFyUGZAcJfwjZJni4ieG66XEI8nhqHPT4V7qZB
r2n2wx4URDzUdnGoo3XmqO/TA1szHr5aGfwIOIktKVT9l3Gr/ZOptPzRlzjcOc4P
gAjQAhcaHlYYPvHhx1+ainKx0KsJ1hG2CcHGH+7KlglX7DuDCpjTGTg46j+LSrUy
4w6EaLwZgee9vCtH9lH55RnAtyL3hbofnlZmNaUTf/0jAKU7LiV3nqkEAQH9ffoP
HtucrchZO1yqTIdLRY9PITwqKsHOrkcoQP/xkHjyzanmLFYBo+zdyp1/dU99rl9A
Fltv1H3pi7+6+33jb8JN8lnZBC8t3zJVMjugi92D8jAP8xzHRjw=
=gBJ/
-----END PGP SIGNATURE-----

--Sig_/Ll+nnIQGkWAZjFxx5fyo+ff--

--===============0490583426==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0490583426==--
