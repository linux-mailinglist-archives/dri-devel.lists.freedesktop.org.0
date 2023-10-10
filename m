Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3377C0067
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 17:31:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2723C10E394;
	Tue, 10 Oct 2023 15:31:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82C5710E3A0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 15:31:38 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-53db1fbee70so344757a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 08:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696951897; x=1697556697; darn=lists.freedesktop.org;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p6BYB1gCd5puXrl5LhZGEIzQSxrp+C2PnhtSQqSgeLo=;
 b=d6qTSg/T1L9oR+XyXAKtxChMRJFZx5p57UkcgNUec2hZ6yt6dqxkCNkvAZFwiyQacG
 nFcwMTx2B9J4euCLAjFe2PnxHJM/1sIfOwcE84dMmvZnUrXl7gJz6QNKQkvBO+GmhpPp
 9G4gpu5mMogrlISxWrKsIrFYNju1JLqwcsq01mStDdYjW60oZe3otGzpcHS3NOIQqJrB
 sA17Gdfqg9cuh4EfD3gQsXHP03efblX6BryVE5kihikWSgxV19AZn/tyEnDkIdNaS8pM
 HCxD15Zl7slMqN929y/ZAy75wMC/0hJtBSAAfMii0kxg3ISu6mvBxj4S4HrJLLRkXeea
 kOMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696951897; x=1697556697;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p6BYB1gCd5puXrl5LhZGEIzQSxrp+C2PnhtSQqSgeLo=;
 b=AyRnHfdsB1+xlqKawRnG4MFq9qrytxbGnrCfM/Y69kyJFi5sS8PnXXRWMgVeJs4wGi
 q+qZgm99PMKKgS8A7MXT6AG16n9bhcAEeQSryV4CjacSpY+Y8h9V+dFh+5dZwomVxVw+
 91OTs7vxaE5YC9DE58S6xuLEQQTlE/25Hg3VBr06Q4pRHJNzmmjpZXow/2eCFipQbd7h
 MMzlPZHnqJexZYejCPNe6wND4No215/1VqVOgh6cwnAtdIY23YZkqRoyRHYSlS3EfkMZ
 E5bXyQBhVNv6OlqnpNnQ+FIoMEsUsWdet8csiOLzWdljqfTEGv12nK4Cs4t3k60+heQ0
 Hy0A==
X-Gm-Message-State: AOJu0YzcghCw3kDwS/Q4HhusXvnQkVsOlKVwcq80leEgYIu9rZ2k7Ri4
 9C9njmtl5FDL1drAHeHb75Y=
X-Google-Smtp-Source: AGHT+IHvfsnQ7+i3iZ3Zvae/Raj7PBddxMUZ6kGbLtTloPkfNG2VNrs83wD0dZZP1pi7ZcA5IWPCDw==
X-Received: by 2002:a05:6402:50b:b0:523:18db:e3ab with SMTP id
 m11-20020a056402050b00b0052318dbe3abmr15352125edv.39.1696951896561; 
 Tue, 10 Oct 2023 08:31:36 -0700 (PDT)
Received: from orome.fritz.box
 (p200300e41f3f4900f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f3f:4900:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 l25-20020aa7c319000000b0053441519ed5sm7749685edq.88.2023.10.10.08.31.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 08:31:35 -0700 (PDT)
Date: Tue, 10 Oct 2023 17:31:33 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Sui Jingfeng <suijingfeng@loongson.cn>
Subject: Re: [PATCH 1/2] drm/tegra: Return an error code if fails
Message-ID: <ZSVuVcqdGfGtQIQj@orome.fritz.box>
References: <20230626143331.640454-1-suijingfeng@loongson.cn>
 <ZSVQMPuRnXzC0lgf@orome.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vvxnvHZb1NK8XLPt"
Content-Disposition: inline
In-Reply-To: <ZSVQMPuRnXzC0lgf@orome.fritz.box>
User-Agent: Mutt/2.2.12 (2023-09-09)
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--vvxnvHZb1NK8XLPt
Content-Type: multipart/mixed; boundary="r4Kogl6ypPFjzAmq"
Content-Disposition: inline


--r4Kogl6ypPFjzAmq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 10, 2023 at 03:22:56PM +0200, Thierry Reding wrote:
> On Mon, Jun 26, 2023 at 10:33:30PM +0800, Sui Jingfeng wrote:
> > Return -ENOMEM if tegra_bo_mmap() fails.
> >=20
> > Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> > ---
> >  drivers/gpu/drm/tegra/gem.c | 2 ++
> >  1 file changed, 2 insertions(+)
>=20
> Sorry, this fell through the cracks. I think it'd be better if
> tegra_bo_mmap() were to be improved to always return either an ERR_PTR()
> encoded error code or a valid pointer. Throwing NULL into the mix isn't
> useful because it typically means something like -ENOMEM anyway. Error
> codes are more explicit, so since we're already using them for some
> cases, might as well return them for all.
>=20
> Actually, looks like tegra_bo_mmap() never actually returns an ERR_PTR()
> encoded error code. It's either obj->vaddr, the return value of vmap()
> (which is either NULL or the address of the mapping), or the address
> obtained from dma_buf_vmap_unlocked() (i.e. map.vaddr) or NULL on
> failure. So I think it would equally make sense to keep your patch and
> to remove the IS_ERR() check below it.
>=20
> I would slightly prefer the first option, but either is fine.

How about the attached patch?

Thierry

--r4Kogl6ypPFjzAmq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline;
	filename="0001-drm-tegra-gem-Do-not-return-NULL-in-tegra_bo_mmap.patch"
Content-Transfer-Encoding: quoted-printable

=46rom b34a09efcf7b1d2c25d3baf8c6d91c5ca09b4e0f Mon Sep 17 00:00:00 2001
=46rom: Thierry Reding <treding@nvidia.com>
Date: Tue, 10 Oct 2023 17:26:14 +0200
Subject: [PATCH] drm/tegra: gem: Do not return NULL in tegra_bo_mmap()

It's confusing for a function to return NULL and ERR_PTR()-encoded error
codes on failure. Make sure we only ever return the latter since that's
what callers already expect.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/gem.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 11296de59c5a..679460e05c05 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -178,6 +178,7 @@ static void *tegra_bo_mmap(struct host1x_bo *bo)
 {
 	struct tegra_bo *obj =3D host1x_to_tegra_bo(bo);
 	struct iosys_map map;
+	void *vaddr;
 	int ret;
=20
 	if (obj->vaddr)
@@ -185,10 +186,18 @@ static void *tegra_bo_mmap(struct host1x_bo *bo)
=20
 	if (obj->gem.import_attach) {
 		ret =3D dma_buf_vmap_unlocked(obj->gem.import_attach->dmabuf, &map);
-		return ret ? NULL : map.vaddr;
+		if (ret < 0)
+			return ERR_PTR(ret);
+
+		return map.vaddr;
 	}
=20
-	return vmap(obj->pages, obj->num_pages, VM_MAP, pgprot_writecombine(PAGE_=
KERNEL));
+	vaddr =3D vmap(obj->pages, obj->num_pages, VM_MAP,
+		     pgprot_writecombine(PAGE_KERNEL));
+	if (!vaddr)
+		return -ENOMEM;
+
+	return vaddr;
 }
=20
 static void tegra_bo_munmap(struct host1x_bo *bo, void *addr)
--=20
2.42.0


--r4Kogl6ypPFjzAmq--

--vvxnvHZb1NK8XLPt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmUlblUACgkQ3SOs138+
s6HbFQ//bsnt3abbnn17U1TAa/8MQJFfsftjgYFRxI694IYsPODox18L3gAonHIq
SdJHBJG6oOFxS+iZG5FIj7xvrC58ZmpzRe7I6eo34ofsY9R0ay6nBPS8SIFSoyRl
Q9GLgycc5c+wAJi6TuPJRWRn/JKo4hsOwdd5TXJmAGXGrF5QbLW0NPAH5tZMg0hv
VauiIqZInTUq8RcbrpFqVhCGGICxZ/WVmTSl5FiAXCD+ZbBkP8ZXj7+uY8pjoZXu
D1bXer2kUktVUethMZOYQpwhCv+L/Uo6YSMB+328oXvI5AXcX8DFx3tp3ZASwCOp
u7lveGKHWfXTMW94k0+zoYT3DZHENEnYe0VMqB4W49Uon/vMtJcq4VXS3SkWB0oI
plfE2HUFW1ACvMSt9aJpEyVcqhw99aoRKCJuCaEHG+X/3ZbfWSHYGSqphv0P526d
rVsZSx6tHy6F+/gevcYN3Zf2c6dWWYNqzorip3wgs732jIjidQ64Sp6EiO8UXFgW
fwi1l4FTuWhex34lfVdzs+jhcFIAf5d8AjIYvkayRKHOB+2GZlwllwcH1g7AT2AH
CaFdIw6sjTm3yqH8tiwLTeDIKP//JDJq1T6Mu3VZ3q9oDaYEcGNGkkdbAzCd8Su7
jcUYGR9wCyin91tD5DkkAwtqDqApzQCo5xWCDxVl6cp3agz5Z7U=
=4DyQ
-----END PGP SIGNATURE-----

--vvxnvHZb1NK8XLPt--
