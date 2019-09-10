Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 058F1AF2B3
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 23:53:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B82896E9AC;
	Tue, 10 Sep 2019 21:53:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 680F86E9B0;
 Tue, 10 Sep 2019 21:53:04 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id q12so1176431wmj.4;
 Tue, 10 Sep 2019 14:53:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=NvJlS5ikUdPI/fZAaUQffiLfVy94vmRlMhwKBmuW7cs=;
 b=dehg/fdGKfcPxzgp9ydInmaqthA1q9G2ATo25n6/oIlzWb7iwt9z6lfYEgPMTb1Aor
 BZSWkBaz2wqxMpyG/hsk2ayVRBY2fF20atv6HU+Ed9aUaFggJ+qnkNWkVFAvzjQCWTJl
 xl+pR37+PUONP56fB+pIXTdTBDeGFe25vSEE4IqXPQMBjXIcZF89OsHBX7DKly7eCdRA
 uWFO0nHpHDbGUB/xdgRyFLESl2pQbUPu/MfkHth9rj9E71amiuzso8l3ELbb6Xkd6iW3
 sIZxH/f/q2QggNxYffSrt1SV51MIpepkQ/3BJV2NisX33IQdEjv0UkZLVGCD3bMxkhkP
 Kd3Q==
X-Gm-Message-State: APjAAAW/wvS1qnBZ++vOgrKaeCwm9+dSjS6I8nzNtyrX9OAyiczvheSP
 5JbFu4bsalH8SCPL67DOv6Y=
X-Google-Smtp-Source: APXvYqwRW8lD8TokS+XmDOMTDJjpwDAu9rz22Ulrf8cU2S3mkWjpkpjlkMKWDtea7RPu7Fe2XLxKEA==
X-Received: by 2002:a1c:6c09:: with SMTP id h9mr1131662wmc.36.1568152382751;
 Tue, 10 Sep 2019 14:53:02 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id d18sm23344617wra.91.2019.09.10.14.53.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2019 14:53:00 -0700 (PDT)
Date: Tue, 10 Sep 2019 23:52:59 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [Nouveau] [Intel-gfx] [PATCH v6 08/17] drm/ttm: use gem vma_node
Message-ID: <20190910215259.GA7525@ulmo>
References: <20190805140119.7337-1-kraxel@redhat.com>
 <20190805140119.7337-9-kraxel@redhat.com>
 <20190813151115.GA29955@ulmo>
 <20190814055827.6hrxj6daovxxnnvw@sirius.home.kraxel.org>
 <20190814093524.GA31345@ulmo>
 <20190814101411.lj3p6zjzbjvnnjf4@sirius.home.kraxel.org>
 <CACAvsv5Rar9F=Wf-9HBpndY4QaQZcGCx05j0esvV9pitM=JoGg@mail.gmail.com>
 <20190821115523.GA21839@ulmo>
 <CAKb7UvjXq0ptiPYu5EGH6sJAbbRjN3X4f_knrxyOHD1Zi7P1BA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKb7UvjXq0ptiPYu5EGH6sJAbbRjN3X4f_knrxyOHD1Zi7P1BA@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=NvJlS5ikUdPI/fZAaUQffiLfVy94vmRlMhwKBmuW7cs=;
 b=IjiJ3+9Y6r0xaDsm9uuuG6az+m05Tq7/J3/URwGiVxxirDgfueGWC8A3BL4Ki8aARX
 thcMCbMKdoQrMtyrhk6QZ3n3ej5bHf4JnAcDDhUZRnNFd5Py4cSg702UBD5qCAsdaGrE
 9rfsWbj/FWAWlO6iuKOfLcjAeG9LCrFLmaLPee5kHmm697xoaQwUvM/AOtGy0dC4loLU
 NaFBnwHLYIDs9C5uD8jqtsFvG9PyxpgcvtYvnZPc6N9ZJe1sqyQ82uO5EUpOqSMOEC0K
 gh6KxGQNr17l50W5KN4FaRyNekYtvNeI/Ey1cxeOsrzzC8Tf8EQLctuXmsvTlI9LBzOn
 rZ3g==
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
Cc: Ben Skeggs <skeggsb@gmail.com>, ML nouveau <nouveau@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>, linux-graphics-maintainer@vmware.com,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 spice-devel@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/mixed; boundary="===============0272918578=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0272918578==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="J/dobhs11T7y2rNN"
Content-Disposition: inline


--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 07, 2019 at 09:58:46PM -0400, Ilia Mirkin wrote:
> On Wed, Aug 21, 2019 at 7:55 AM Thierry Reding <thierry.reding@gmail.com>=
 wrote:
> >
> > On Wed, Aug 21, 2019 at 04:33:58PM +1000, Ben Skeggs wrote:
> > > On Wed, 14 Aug 2019 at 20:14, Gerd Hoffmann <kraxel@redhat.com> wrote:
> > > >
> > > >   Hi,
> > > >
> > > > > > Changing the order doesn't look hard.  Patch attached (untested=
, have no
> > > > > > test hardware).  But maybe I missed some detail ...
> > > > >
> > > > > I came up with something very similar by splitting up nouveau_bo_=
new()
> > > > > into allocation and initialization steps, so that when necessary =
the GEM
> > > > > object can be initialized in between. I think that's slightly more
> > > > > flexible and easier to understand than a boolean flag.
> > > >
> > > > Yes, that should work too.
> > > >
> > > > Acked-by: Gerd Hoffmann <kraxel@redhat.com>
> > > Acked-by: Ben Skeggs <bskeggs@redhat.com>
> >
> > Thanks guys, applied to drm-misc-next.
>=20
> Hi Thierry,
>=20
> Initial investigations suggest that this commit currently in drm-next
>=20
> commit 019cbd4a4feb3aa3a917d78e7110e3011bbff6d5
> Author: Thierry Reding <treding@nvidia.com>
> Date:   Wed Aug 14 11:00:48 2019 +0200
>=20
>     drm/nouveau: Initialize GEM object before TTM object
>=20
> breaks nouveau userspace which tries to allocate GEM objects with a
> non-page-aligned size. Previously nouveau_gem_new would just call
> nouveau_bo_init which would call nouveau_bo_fixup_align before
> initializing the GEM object. With this change, it is done after. What
> do you think -- OK to just move that bit of logic into the new
> nouveau_bo_alloc() (and make size/align be pointers so that they can
> be fixed up?)

Hi Ilia,

sorry, got side-tracked earlier and forgot to send this out. I'll turn
this into a proper patch, but if you manage to find the time to test
this while I work out the userspace issues that are preventing me from
testing this more thoroughly, that'd be great.

Thierry

--- >8 ---
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau=
/nouveau_bo.c
index e918b437af17..7d5ede756711 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -186,8 +186,8 @@ nouveau_bo_fixup_align(struct nouveau_bo *nvbo, u32 fla=
gs,
 }
=20
 struct nouveau_bo *
-nouveau_bo_alloc(struct nouveau_cli *cli, u64 size, u32 flags, u32 tile_mo=
de,
-		 u32 tile_flags)
+nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32 flags,
+		 u32 tile_mode, u32 tile_flags)
 {
 	struct nouveau_drm *drm =3D cli->drm;
 	struct nouveau_bo *nvbo;
@@ -195,8 +195,8 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 size, u32=
 flags, u32 tile_mode,
 	struct nvif_vmm *vmm =3D cli->svm.cli ? &cli->svm.vmm : &cli->vmm.vmm;
 	int i, pi =3D -1;
=20
-	if (!size) {
-		NV_WARN(drm, "skipped size %016llx\n", size);
+	if (!*size) {
+		NV_WARN(drm, "skipped size %016llx\n", *size);
 		return ERR_PTR(-EINVAL);
 	}
=20
@@ -266,7 +266,7 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 size, u32=
 flags, u32 tile_mode,
 			pi =3D i;
=20
 		/* Stop once the buffer is larger than the current page size. */
-		if (size >=3D 1ULL << vmm->page[i].shift)
+		if (*size >=3D 1ULL << vmm->page[i].shift)
 			break;
 	}
=20
@@ -281,6 +281,8 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 size, u32=
 flags, u32 tile_mode,
 	}
 	nvbo->page =3D vmm->page[pi].shift;
=20
+	nouveau_bo_fixup_align(nvbo, flags, align, size);
+
 	return nvbo;
 }
=20
@@ -292,12 +294,11 @@ nouveau_bo_init(struct nouveau_bo *nvbo, u64 size, in=
t align, u32 flags,
 	size_t acc_size;
 	int ret;
=20
-	acc_size =3D ttm_bo_dma_acc_size(nvbo->bo.bdev, size, sizeof(*nvbo));
-
-	nouveau_bo_fixup_align(nvbo, flags, &align, &size);
 	nvbo->bo.mem.num_pages =3D size >> PAGE_SHIFT;
 	nouveau_bo_placement_set(nvbo, flags, 0);
=20
+	acc_size =3D ttm_bo_dma_acc_size(nvbo->bo.bdev, size, sizeof(*nvbo));
+
 	ret =3D ttm_bo_init(nvbo->bo.bdev, &nvbo->bo, size, type,
 			  &nvbo->placement, align >> PAGE_SHIFT, false,
 			  acc_size, sg, robj, nouveau_bo_del_ttm);
@@ -318,7 +319,8 @@ nouveau_bo_new(struct nouveau_cli *cli, u64 size, int a=
lign,
 	struct nouveau_bo *nvbo;
 	int ret;
=20
-	nvbo =3D nouveau_bo_alloc(cli, size, flags, tile_mode, tile_flags);
+	nvbo =3D nouveau_bo_alloc(cli, &size, &align, flags, tile_mode,
+				tile_flags);
 	if (IS_ERR(nvbo))
 		return PTR_ERR(nvbo);
=20
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.h b/drivers/gpu/drm/nouveau=
/nouveau_bo.h
index 62930d834fba..38f9d8350963 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.h
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.h
@@ -71,8 +71,8 @@ nouveau_bo_ref(struct nouveau_bo *ref, struct nouveau_bo =
**pnvbo)
 extern struct ttm_bo_driver nouveau_bo_driver;
=20
 void nouveau_bo_move_init(struct nouveau_drm *);
-struct nouveau_bo *nouveau_bo_alloc(struct nouveau_cli *, u64 size, u32 fl=
ags,
-				    u32 tile_mode, u32 tile_flags);
+struct nouveau_bo *nouveau_bo_alloc(struct nouveau_cli *, u64 *size, int *=
align,
+				    u32 flags, u32 tile_mode, u32 tile_flags);
 int  nouveau_bo_init(struct nouveau_bo *, u64 size, int align, u32 flags,
 		     struct sg_table *sg, struct dma_resv *robj);
 int  nouveau_bo_new(struct nouveau_cli *, u64 size, int align, u32 flags,
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouvea=
u/nouveau_gem.c
index c2bfc0591909..1bdffd714456 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -188,7 +188,8 @@ nouveau_gem_new(struct nouveau_cli *cli, u64 size, int =
align, uint32_t domain,
 	if (domain & NOUVEAU_GEM_DOMAIN_COHERENT)
 		flags |=3D TTM_PL_FLAG_UNCACHED;
=20
-	nvbo =3D nouveau_bo_alloc(cli, size, flags, tile_mode, tile_flags);
+	nvbo =3D nouveau_bo_alloc(cli, &size, &align, flags, tile_mode,
+				tile_flags);
 	if (IS_ERR(nvbo))
 		return PTR_ERR(nvbo);
=20
diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c b/drivers/gpu/drm/nouv=
eau/nouveau_prime.c
index 84658d434225..656c334ee7d9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_prime.c
+++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
@@ -62,14 +62,15 @@ struct drm_gem_object *nouveau_gem_prime_import_sg_tabl=
e(struct drm_device *dev,
 	struct nouveau_drm *drm =3D nouveau_drm(dev);
 	struct nouveau_bo *nvbo;
 	struct dma_resv *robj =3D attach->dmabuf->resv;
-	size_t size =3D attach->dmabuf->size;
+	u64 size =3D attach->dmabuf->size;
 	u32 flags =3D 0;
+	int align =3D 0;
 	int ret;
=20
 	flags =3D TTM_PL_FLAG_TT;
=20
 	dma_resv_lock(robj, NULL);
-	nvbo =3D nouveau_bo_alloc(&drm->client, size, flags, 0, 0);
+	nvbo =3D nouveau_bo_alloc(&drm->client, &size, &align, flags, 0, 0);
 	dma_resv_unlock(robj);
 	if (IS_ERR(nvbo))
 		return ERR_CAST(nvbo);
@@ -84,7 +85,7 @@ struct drm_gem_object *nouveau_gem_prime_import_sg_table(=
struct drm_device *dev,
 		return ERR_PTR(-ENOMEM);
 	}
=20
-	ret =3D nouveau_bo_init(nvbo, size, 0, flags, sg, robj);
+	ret =3D nouveau_bo_init(nvbo, size, align, flags, sg, robj);
 	if (ret) {
 		nouveau_bo_ref(NULL, &nvbo);
 		return ERR_PTR(ret);

--J/dobhs11T7y2rNN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl14GzgACgkQ3SOs138+
s6GnHA/+I0E/b1ne3feG2PlDXK9oEYO+3hCx/6F/K5oyCkKbKo+Ouy8MOcRFMRIc
QljEQ7c9FJDfJOBUa6Emjbe0oBZ0DmAPJITJjeUN3M8A3MOqoF9hsUHU0j9AHHy4
ZULuvei7oEKv+TxeLNOmS1h5TVqsDJ3+J0SvNrGbG0c3giWewZYFQYi1jYwxSmap
FR4agswIPivk/92ngcYOdrBNiOM4ElVHPPCzHtValO8Zo3Nh3ISwH8CLnxo4mmsB
Yh9OE9MT7BHqnqbppHvwPCq/1VpIhshYRZZT7XSbe0kzIdKb6BEmkuzAZa7dVLo6
4SedYtPuod9q6U9yeqEJDJ7w2E62PHy/Zs8Sv0uh3Gz0oaWEbL7rM+ZWXQ8kdnoL
TKsgjIiPpfuQ0z7+d+lGt0683HysZc3zh0jLKfHovg6GaHZ2I4LBPaW6zHIdJJ8n
7b8JARU2wTf9bnjYZxaO36sECRzdDbEUY7wD83+DrQH+2OBD7wsoboTjnDdvj6g0
Np7XQ8Qjwg3YBJ2x4h+sCx2TR1keN1njmyzSw5UqyiSXm1VG7ivPJwVjo1cco9OR
mB32SfJ1zskJrd20re5vkV8PwcRGKb8q2qTMYt9IJaQ5XhDE2Zo0gDVM/J7Y+IEr
5wFQ0PhMdr0uMNat3btNpJKU4CaDrm/Bzou8Y2fkTlar+/zdAVs=
=NYiz
-----END PGP SIGNATURE-----

--J/dobhs11T7y2rNN--

--===============0272918578==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0272918578==--
