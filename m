Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73257B759F
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 11:02:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 010486F4EF;
	Thu, 19 Sep 2019 09:02:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC6E6F4EF
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 09:02:04 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id j19so1284764lja.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 02:02:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=lQ1r8kJ5DfiQI/A7QvaXVYVqUGFRSwT/dMr4ZGuk6B0=;
 b=ttj7yJZUhi9Fu+lI9IIcxT0PMOmEkgkiT1lBy7p+hcem3JJbYm/hNiOC+T66CLDztd
 2yvZs1pqNkJ+/2a2gpSR+2jFLQbxhzlV0NALe7iXULavPclXQPvyIcELKcBRqVo8aPCV
 LNoQNRhhE6a9LwpkXUOPQvNIrGfBEVpZNFDgbx4xAzoR85RVq1bZXqBOSpKIIFnO8CMQ
 5i9wcvN4CQcPspzsH0eGWZf6F1zn8qDsd82C/nKU1/0AQUKcSO7cPczFUEDs6BM9WKDV
 f74kNY38URjZfaFjnGOv+l6xfnxphElrec0mzL47lmRubeTEQ952H2AWZ0pM/l/TEESS
 hazQ==
X-Gm-Message-State: APjAAAUE7n4GBXIvd+Qy4iiJc4erZP3407kNPeDg2qFptNe6BqMm3x5s
 SlEYGU3Y8FfmJS2IadvjyBU=
X-Google-Smtp-Source: APXvYqyFi8vVHaU56I/fbgu54OKtjPf0H6qZyXwjYSjSYHsCcSCoXFCO/p8/x5yQ7kqdJppLi+277A==
X-Received: by 2002:a2e:63da:: with SMTP id s87mr4707907lje.79.1568883722486; 
 Thu, 19 Sep 2019 02:02:02 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id b15sm1439516lfj.84.2019.09.19.02.02.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2019 02:02:02 -0700 (PDT)
Date: Thu, 19 Sep 2019 12:01:52 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm: two planes with the same zpos have undefined ordering
Message-ID: <20190919120152.54875c21@eldfell.localdomain>
In-Reply-To: <CAKMK7uFRtFntwDtiT9+AS1QVMsfVwbA1XVMa+EEn_SphMxqp-w@mail.gmail.com>
References: <KJRi1ROX2_eM1WjtEQ1e1-f--VK4hwMQJQt1nPaS6lcmt3v4yIfdttLIu_EOGdkwXwEMAEo66Xa7ksp7iQABWT5GuMu6UgKoiuEm6EU2N1U=@emersion.fr>
 <20190910133810.64e973f4@eldfell.localdomain>
 <uIh7eDYXe7Cj_3_8V0-WIdUfSrRlIHw8yb91myRQqlv5A7dS8TtfXZTsz0R84_LSQBdqkZvEHc6uWPnGJKIIqa_SnTr6RtmPRwr4d2u13JA=@emersion.fr>
 <20190911103604.4c05ba6b@eldfell.localdomain>
 <fNZQmqVgMDGSK8zIcxQHCsbo-z5GPhcd6GxIEVrpt6ubbauLhe9IbPo77ilXH0SccjutcCbq3iym-DnBQ5Q3wyY1WGPiDxwz3_Pj9--fgZY=@emersion.fr>
 <20190919101836.76d735ba@eldfell.localdomain>
 <CAKMK7uFRtFntwDtiT9+AS1QVMsfVwbA1XVMa+EEn_SphMxqp-w@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=lQ1r8kJ5DfiQI/A7QvaXVYVqUGFRSwT/dMr4ZGuk6B0=;
 b=Vplr1o+NpQ7BDzMBS8FAEeZaS9/7b7VaGFiw3ph/Agc2FsEx/zV8ZiJrfb2mfxmCK6
 XdTuonT70na6dOQionhdjjeF1OEAtILvN93QbHJvfC3LL0eBOCjkr+ax9uThLAMk0ehd
 CyKcWMHZhTuhD57OZOphm9JONUf8ntPGqGnvXz8UHYKpnbZGeQueo05Ay8W2mxRcekfW
 EhE27YLVc6I8+JdXSykHmLXEq9xI78tWSCZ1LBozMSjSkfJULncTiVdL20WhnML2qegP
 ao6y8nnCl7FzQ4rax35FcoMyNlucKU8XYIx2EXj161FNHym4qK8HSYUtlJ0VsrL8DLat
 dcYw==
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
Cc: Simon Ser <contact@emersion.fr>,
 "daniels@collabora.com" <daniels@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Marius-Cristian Vlad <marius.vlad@collabora.com>
Content-Type: multipart/mixed; boundary="===============0423006450=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0423006450==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/bDUpspLRIJly_S=g85cCJCF"; protocol="application/pgp-signature"

--Sig_/bDUpspLRIJly_S=g85cCJCF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 19 Sep 2019 10:18:04 +0200
Daniel Vetter <daniel.vetter@ffwll.ch> wrote:

> On Thu, Sep 19, 2019 at 9:18 AM Pekka Paalanen <ppaalanen@gmail.com> wrot=
e:
> >

...

> > Right, and we are suffering from that confusion already. Should
> > userspace use ID order if zpos property is not there or not? I have no
> > idea. =20
>=20
> Nope. I think the only options for this case are:
> - file bug against upstream driver so they add zpos
> - you magically know how planes work on that hw
> - you don't overlap planes at all
> - cursor is above primary, that much we can guarantee
>=20
> Yes it's kinda uapi fail we didn't add zpos from the start :-/

Good. Weston does the last two. The confusion did not last long
enough to let us add code using the object ID to infer stacking order.

Although, Weston does have the assumption that overlays are in unknown
order between primary and cursor, which now seems false.


Thanks,
pq

--Sig_/bDUpspLRIJly_S=g85cCJCF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl2DRAAACgkQI1/ltBGq
qqcpNQ//Vv5lVfYheSzoniyPItJJqBp0vPW5YGWVJgJ27vKgIZzRW7ccQIuKQiXK
UBO+GhrweUaCP03fCCFwIYveP75CrKOjPO5FCB7MjW3LoH1iRd1wAZUYhF24wzz8
Zd537WGxWGkCMMb1jFrJil8rlLyzteYAFKkbKY5hi4DM2oORjcOs58sciKyXT9VR
bccR9n6FrWv/wlQZQXSsN/H0uq3f2Qhz4xGMtg2kgtK0BbNEqDFKBZOyYDAYyPcV
N+QS9nk/R/KM0bAOBA23KxkQ4gYZOiJ2JhD9FWhhBDTNGVE/xloZpiuIoMVwtNcJ
nui1d6/Y/CvIQpQxxKrwEeA/nh7zxbRa2EcFz78bBQmnbr45S7ywli/8aMjYgOI2
SB8vCJUUngIb09EiubKFDdXB38+5tXDyFRJjom49HgALI8oblMx9w8VTjKA6OLjP
anPXTqp/Lc95v5X9IKYqc9HFs1nxuhaT7eqA4vvOe2NlCvybuXbhb1gBUP7wi2Gt
Ij0rSSyE2vRQqCCE2mqmoIRbg9k5Z9Z8YA7xxKzmbpgedq2AtQ3woRFKiPFhnbc7
QJRqpf8pj7LFTOFxSIaULPMus+/hBRgq7hTZ1aawiYAGukaxqwevcJvK/wTyH4ht
VVacM0pjeVrTj7vk9A3lvBOfmPEtqPcMv0xbuh4MHFOpyIgITXs=
=I+5o
-----END PGP SIGNATURE-----

--Sig_/bDUpspLRIJly_S=g85cCJCF--

--===============0423006450==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0423006450==--
