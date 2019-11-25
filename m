Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CE3108C7E
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 12:02:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2112C6E122;
	Mon, 25 Nov 2019 11:02:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B8B89E41;
 Mon, 25 Nov 2019 11:02:44 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id j18so15902757wmk.1;
 Mon, 25 Nov 2019 03:02:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FRz4MzDRKJ+ZijtJl2QqgCzgUPbb1QKb5IxIvCZ6Eqg=;
 b=S3f5jjYyOKWjCGtsH9TAeOoBYFXn1Ws1LTXopEp6AkGupYcu0oPl5cVHbCOBAO5V5T
 tZ5PzoBJl/vJPsf2+vaFAGs4q/iC5ymYtoW8rskbzECCKkIbNcWJXlGtW0JlSEMJl+r1
 TmWZ5Lsxfl9973OYzcOaV1jlGShvLXIi/6migCyKD0h8xuqDSArLU58ra/H31qe3IL9s
 HHV0jsFKIVlQemwDp2LS8y31DcaqVb4h3vLMJIOxIm4y5186IYDZ8D2iZHcVtAv0sTtG
 yqQFOIBx5l2azfcKOydg6sr2TUuxw7BP0c5pWmhAPaBU1fTjf/JCDd2cdIC8Cwl4om0T
 4LGg==
X-Gm-Message-State: APjAAAWO1Atf89GPIPqaqRIKyZeAn9ckSIY3puNK1g03hAzBNNeOVTVR
 8zvt4MuTtO36GjDn77c9VBxydGq06YI=
X-Google-Smtp-Source: APXvYqyPr06DFPdgKsYagOyi9P7iXFX/7b4ofHrouNKF0YlsMcd7jNFgUERHIK1bDUZc5yIKe20p7g==
X-Received: by 2002:a1c:152:: with SMTP id 79mr27282394wmb.70.1574679762787;
 Mon, 25 Nov 2019 03:02:42 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
 by smtp.gmail.com with ESMTPSA id f1sm9343723wru.6.2019.11.25.03.02.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 03:02:41 -0800 (PST)
Date: Mon, 25 Nov 2019 12:02:40 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 01/15] drm/tegra: Map cmdbuf once for reloc processing
Message-ID: <20191125110240.GH1409040@ulmo>
References: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
 <20191118103536.17675-2-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
In-Reply-To: <20191118103536.17675-2-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=FRz4MzDRKJ+ZijtJl2QqgCzgUPbb1QKb5IxIvCZ6Eqg=;
 b=PYpG0m6KmNyk57FtGSZqWSlhy1+/Q5JVxKq9eSITRkgb6yCJSjTzUhHvlkNYPmpfEx
 fE6Lm3oDV+5h86rYX/rsW7MOPpYfYdVnxPJfS3j03hh7eFsRT4ePfpcHh8sQcXiSKfxj
 eJ2ZEt3/hDjtrkSjU2RVWB248L/8ZF6ETnJCNyZwQmD2B6niV5Vrfn4EMSrkslGdUZQZ
 +Eva3DLDvAZnRpPMbVV0xanoI/YYxhGtI1ODshwJNQ2BwbEF2NtwAkBUZh7fFcnk/yfy
 2Km4NT9fPIRwLeGpRaSWhHWX6AaH7cULLhC5gGO9ipiZneXGbuTU/rqcZrfVmSw8KBqN
 amGw==
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
Cc: linux-tegra@vger.kernel.org, Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============2079434982=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2079434982==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Hlh2aiwFLCZwGcpw"
Content-Disposition: inline


--Hlh2aiwFLCZwGcpw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2019 at 11:35:22AM +0100, Daniel Vetter wrote:
> A few reasons to drop kmap:
>=20
> - For native objects all we do is look at obj->vaddr anyway, so might
>   as well not call functions for every page.
>=20
> - Reloc-processing on dma-buf is ... questionable.
>=20
> - Plus most dma-buf that bother kernel cpu mmaps give you at least
>   vmap, much less kmaps. And all the ones relevant for arm-soc are
>   again doing a obj->vaddr game anyway, there's no real kmap going on
>   on arm it seems.
>=20
> Plus this seems to be the only real in-tree user of dma_buf_kmap, and
> I'd like to get rid of that.
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: linux-tegra@vger.kernel.org
> ---
>  drivers/gpu/host1x/job.c | 21 +++++++--------------
>  1 file changed, 7 insertions(+), 14 deletions(-)

This looks correct to me, and running some of the grate project's tests
against this works just fine, so:

Reviewed-by: Thierry Reding <treding@nvidia.com>
Tested-by: Thierry Reding <treding@nvidia.com>

> diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
> index 25ca54de8fc5..60b2fedd0061 100644
> --- a/drivers/gpu/host1x/job.c
> +++ b/drivers/gpu/host1x/job.c
> @@ -244,8 +244,7 @@ static unsigned int pin_job(struct host1x *host, stru=
ct host1x_job *job)
> =20
>  static int do_relocs(struct host1x_job *job, struct host1x_job_gather *g)
>  {
> -	u32 last_page =3D ~0;
> -	void *cmdbuf_page_addr =3D NULL;
> +	void *cmdbuf_addr =3D NULL;
>  	struct host1x_bo *cmdbuf =3D g->bo;
>  	unsigned int i;
> =20
> @@ -267,28 +266,22 @@ static int do_relocs(struct host1x_job *job, struct=
 host1x_job_gather *g)
>  			goto patch_reloc;
>  		}
> =20
> -		if (last_page !=3D reloc->cmdbuf.offset >> PAGE_SHIFT) {
> -			if (cmdbuf_page_addr)
> -				host1x_bo_kunmap(cmdbuf, last_page,
> -						 cmdbuf_page_addr);
> +		if (!cmdbuf_addr) {
> +			cmdbuf_addr =3D host1x_bo_mmap(cmdbuf);
> =20
> -			cmdbuf_page_addr =3D host1x_bo_kmap(cmdbuf,
> -					reloc->cmdbuf.offset >> PAGE_SHIFT);
> -			last_page =3D reloc->cmdbuf.offset >> PAGE_SHIFT;
> -
> -			if (unlikely(!cmdbuf_page_addr)) {
> +			if (unlikely(!cmdbuf_addr)) {
>  				pr_err("Could not map cmdbuf for relocation\n");
>  				return -ENOMEM;
>  			}
>  		}
> =20
> -		target =3D cmdbuf_page_addr + (reloc->cmdbuf.offset & ~PAGE_MASK);
> +		target =3D cmdbuf_addr + reloc->cmdbuf.offset;
>  patch_reloc:
>  		*target =3D reloc_addr;
>  	}
> =20
> -	if (cmdbuf_page_addr)
> -		host1x_bo_kunmap(cmdbuf, last_page, cmdbuf_page_addr);
> +	if (cmdbuf_addr)
> +		host1x_bo_munmap(cmdbuf, cmdbuf_addr);
> =20
>  	return 0;
>  }
> --=20
> 2.24.0
>=20

--Hlh2aiwFLCZwGcpw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3btM0ACgkQ3SOs138+
s6E8Ug/6AxtIN3gdIMNRpWS1/fxfs4LDI3xY6p8jCgdVzy3VihBMrjUfRhGhCJ4h
zZYzNCHcVhbwo+kg2L0C+q2APAn+N8f+Azqg7zSL8SrDEyC6M8QpcQX6x9vS5FFw
fmFb25YyIOG6yIU+HvA68XbqbbznoZ3pDTKGo/UqrkAo7xN/a8+DqucUj+2jW0L4
zLjsDxHwwSODQJjty3wLj6ICKIT9Uq8SXJFBwekDBhHBKIWnhwUWT1cyOL3+MX0U
YavybeVMfPErj6Wqm9ksu6t6ytQZZjUYU/uhBpQwpFzhuCtXEOYJ6nlPAvvsgF7h
VaFyu5mEY8I1YXWaj/Yulok6ggez1zwdokQkS0jE+lyFwvQBCeAIAziMIBMCaVO1
NS3XK3DnboolU8JS17WOkNalLLZ77AC1P172gLFQHRdYz3eaUR3HujD5bmMIhni1
EqdWdxA/a3hzxEYzacz9Xpo06MuZqiiYly2Au5xwrxAvD5WVyfz9Cg4ulniNjPdX
Qk6ydj+709/EoZux1OHBioPDII4/wLu5lmfy5kg8sopXsgp+wmfWtaWzGeBPF/Ii
QCebUiqNeTCMdUcEI/n75beEfVQm3UVOK6UDsIq9ksU1HaSFyz6RdpIDZPqPUUah
htfjCOT9ffDWoqvObNXLkY2jI5j4oppPHSE19Gr8Z4gUxSSpFgY=
=w4PM
-----END PGP SIGNATURE-----

--Hlh2aiwFLCZwGcpw--

--===============2079434982==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2079434982==--
