Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3EC42A3BB
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 14:00:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E82876E94F;
	Tue, 12 Oct 2021 12:00:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D627C6E94F;
 Tue, 12 Oct 2021 12:00:16 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id j21so69150419lfe.0;
 Tue, 12 Oct 2021 05:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=igDUHpXOmKdm4UruCUvrsiTZiKsXHfmtoXi/2LFwPCY=;
 b=H6VEgDBH3IriwFL50I51uy/h+ewKIzKnSeE5H6yRxMAnl7e54sTs+NOSZDSTglZRaq
 7kOdFXxkGDRkaWveuQ8LKOD1t7mxl+U9skFA9JwkbWPfOfZBphypcyFzz4/n3NJ7XjYd
 IJDtNUTI7U6qFbkUrbvhg2DiG4REvLt/JP7T+kp7nb0hpGkXQGp6Y2tHC/Sup9cb4uDI
 nscHV82bMw+hhbYYEPTtZnXjAgOFzAaMKNZBYAoWv/CpyTKpmBOhmQsNf4OHkcyWYt+8
 qpi5THI1m6QrUBs2OQM1mQj2zDNxWW1Rhe0HI32LVWxtZhBwmnbXKfbUq9eIP0kkS7p1
 xsWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=igDUHpXOmKdm4UruCUvrsiTZiKsXHfmtoXi/2LFwPCY=;
 b=kdg3/+v0vgZrLLBYZaxVFuHW3OIpZw/yqszoOtaDzFCDFWaog5SvxjaOLb/fSyCCBs
 yHv5RBepZDzrhQCxCnB5Y9Q8wbi40NqdF5N63LHTpteTUI7EXQR6mifXBrAPwmiFtEFa
 bz0gweKUybzQJEJD8f3eIx1yMjNEIbZAbZ1B9xEYppbRx8GyccM/ROSxz64dfVXbj0i/
 Bmerxp4VglsuFlj7SWa7npmClA0TzjQH0LCZTIH3HTUjMqFoByX6y0KfH69iwYdPh2Yl
 KmQy6/+osAqITOxhjWA+dxuaN/vpGOWxzBnHjOW+Sn/WWIHknrjmrD4eMWUqjRw/irGg
 97BQ==
X-Gm-Message-State: AOAM532x/Kz+1E7qs3hde2CeO//frPJYdKAhT8Swv6PvEmZpfnHkLycV
 tRtCAu5Lu9KmE8kCkY8f/5k=
X-Google-Smtp-Source: ABdhPJzH8Hh6zWGktlQJoA5iu/YzVqWGzOeEq5oKiGxWBp87XJyGuoaOa2CHow7jUMv+sRFESJTsAQ==
X-Received: by 2002:a19:5e11:: with SMTP id s17mr25729879lfb.2.1634040015126; 
 Tue, 12 Oct 2021 05:00:15 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id q12sm1155664ljg.19.2021.10.12.05.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 05:00:14 -0700 (PDT)
Date: Tue, 12 Oct 2021 15:00:11 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Cc: Uma Shankar <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, harry.wentland@amd.com,
 ville.syrjala@linux.intel.com, brian.starkey@arm.com,
 sebastian@sebastianwick.net, Shashank.Sharma@amd.com
Subject: Re: [RFC v2 01/22] drm: RFC for Plane Color Hardware Pipeline
Message-ID: <20211012150011.6ca63157@eldfell>
In-Reply-To: <vBmviRgvVBT-q8HSsJLnRc5CfOMr5rFRj6oeIqwh8QJSicQzQxu8_ORxE3OffANSSyF3wUF9_QFRk1uzrggdx_dcI-1WGzmruI4kIFdZQcU=@emersion.fr>
References: <20210906213904.27918-1-uma.shankar@intel.com>
 <20210906213904.27918-2-uma.shankar@intel.com>
 <20211006155559.606521de@eldfell>
 <vBmviRgvVBT-q8HSsJLnRc5CfOMr5rFRj6oeIqwh8QJSicQzQxu8_ORxE3OffANSSyF3wUF9_QFRk1uzrggdx_dcI-1WGzmruI4kIFdZQcU=@emersion.fr>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Le53QRq=O80SERjVN1JiOQb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_/Le53QRq=O80SERjVN1JiOQb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 12 Oct 2021 10:35:37 +0000
Simon Ser <contact@emersion.fr> wrote:

> On Tuesday, October 12th, 2021 at 12:30, Pekka Paalanen <ppaalanen@gmail.=
com> wrote:
>=20
> > is there a practise of landing proposal documents in the kernel? How
> > does that work, will a kernel tree carry the patch files?
> > Or should this document be worded like documentation for an accepted
> > feature, and then the patches either land or don't? =20
>=20
> Once everyone agrees, the RFC can land. I don't think a kernel tree is
> necessary. See:
>=20
> https://dri.freedesktop.org/docs/drm/gpu/rfc/index.html

Does this mean the RFC doc patch will land, but the code patches will
remain in the review cycles waiting for userspace proving vehicles?
Rather than e.g. committed as files that people would need to apply
themselves? Or how does one find the code patches corresponding to RFC
docs?


Thanks,
pq

--Sig_/Le53QRq=O80SERjVN1JiOQb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmFleMsACgkQI1/ltBGq
qqdkfQ//YJrXu73rNESEICldEEeWHzzYQnnknfZsEp1A6EfzlFQhZbLQc/1V+JaX
ykYk5ZSUk67TPAmxDkiSPmTnO/xMm4FBRD7Zp/24m213MPmQXSX/STPJbCzweio/
arkO3npNbS3ayczL7/OuMfZo6YReeAiGM3sIvHRBH/wUE4417MBMARLmIQlVf4wL
9xRAVrUiaBr86MoFa3klNDN4hSKptb2tCbvTJSr/voWLZx198Pime/ej7VsEMHQ3
+v1LB/HTA2eA6ofoxh8tKgDjZU+fKzOgsQAmZNRtoWVZP5n1FYRbwqXHElrpppTm
R7aOL137bd0cbAHoZiX9gr2ff2rCVuxfhI8qNj3e7aSkYgBPI/MBpAhuVR/u7uoW
IWNCZg1NsxRmfGVUDVSFsp0KIoBKJsubOefUzvKS7zX45b1v8Khbyb3868Bs6YSP
dLn90NZU8byx5JPi9chvBlpIj7I9xOg51jo0yjRf5Wk23HsSSry9x3+JJWj8pLRX
0CVWmELO4T1VTUiC17Dd83TdvPY3Cq8cyip0oytHVFVqP/sG54VNlO+FGxpe0DXk
6QP5fFWcXBRV732hlEBABcx9wxoFaFB53oFwf1KUa5CwGiI3l6N8Ao0e/gYSDTQJ
3+OhqWjiCCg+CyBU59E8c3ZO+3PUPDEnb0J+db8HzFDoEIglCOg=
=+N4R
-----END PGP SIGNATURE-----

--Sig_/Le53QRq=O80SERjVN1JiOQb--
