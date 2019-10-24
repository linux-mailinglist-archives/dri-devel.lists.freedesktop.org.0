Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA9AE31A4
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 13:58:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 804066E31A;
	Thu, 24 Oct 2019 11:58:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF136E31A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 11:58:10 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id a11so9666184wra.6
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 04:58:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nvmYs9XGE6Nbxwn8T/kg305FRiX3cQnEULmgTlc37qo=;
 b=LnYASLARnvRiRJEF3c4zYYnPHPxPRedXNntDERRJehSZWZovyA2Qe1t7Nkkyf9LmDg
 3albqZv7d7o7U2gPC3zbGfeczvsErpl/mTSPsWn+ELSJxLBzxVUpUDNrYcGdt3izOnAj
 DLHnttP8CmW9eH0gq8SF11z25cwD6o8vds5hBRL2TNdH8HOLrbzcjTvku9t/KGslWS0J
 8xtRJcGMRm++MpobDrwk9ZDri0txG9OKUmTgza422P/JCU7njl1FGjdrpIJg29rPI0FX
 cHHcrLMA76gI06GMRV2aPV01GTLPWSRHq/u4+NoJ4PL3E3kyDKGajoEb1ivIf0RbaT9k
 ehfg==
X-Gm-Message-State: APjAAAUgltdDVORN77phjzJ4wlWbmxaCR/7sQG0dUr7RfWfYx9j+rbsx
 yIji41xv+GJWQiLm84fyUFk=
X-Google-Smtp-Source: APXvYqwt/WikJqJgE8RUv51dV9sXnqZNK8xHW9hOUKGlifeyhZLhEELjUxJlkOCi9WXDHie7VhbWLA==
X-Received: by 2002:a5d:5227:: with SMTP id i7mr3422410wra.39.1571918288879;
 Thu, 24 Oct 2019 04:58:08 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id l14sm10093768wrr.37.2019.10.24.04.58.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 04:58:05 -0700 (PDT)
Date: Thu, 24 Oct 2019 13:58:04 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 2/3] drm/tegra: Fix 2d and 3d clients detaching from
 IOMMU domain
Message-ID: <20191024115804.GB2924027@ulmo>
References: <20190623173743.24088-1-digetx@gmail.com>
 <20190623173743.24088-2-digetx@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190623173743.24088-2-digetx@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=nvmYs9XGE6Nbxwn8T/kg305FRiX3cQnEULmgTlc37qo=;
 b=YIBFphpsZN9bi0AG0fh0sShzzqlg4OL0bz4H4FkteXdMQg2+t5cGPebQlg6YJhndDw
 658AqUIcZdLDcdpNyngx+/UhdmnQWR4bDKW+kOoHIUtCnjRpXbjlb6B1InxXDUCJc2dm
 AHp/DGA7XcUMVurQ2ZmKtKuK6EMUn8S1HbVOiV4Ko1bY0A06IbWPYW0S3WnhbT3n7hSe
 b0jXaZgiZEO6uZaCkiUX/X/1FM8CvvuD6M0a9rYS8qhzfPuCXeLLrF9JbqFBKOr170T6
 +d4PFYlJjwX2fVgcla3lg7t07hLceSDB5IG3P5OU0qv1wvAR+5T2LJ52eQ8Q67NqGjem
 Apcw==
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1265998683=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1265998683==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wq9mPyueHGvFACwf"
Content-Disposition: inline


--wq9mPyueHGvFACwf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 23, 2019 at 08:37:42PM +0300, Dmitry Osipenko wrote:
> This should should fire up on the DRM's driver module re-loader because
> there won't be enough available domains on older Tegra SoCs.
>=20
> Cc: stable <stable@vger.kernel.org>
> Fixes: 0c407de5ed1a ("drm/tegra: Refactor IOMMU attach/detach")
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/drm/tegra/dc.c   | 4 ++--
>  drivers/gpu/drm/tegra/drm.c  | 9 ++++++---
>  drivers/gpu/drm/tegra/drm.h  | 3 ++-
>  drivers/gpu/drm/tegra/gr2d.c | 4 ++--
>  drivers/gpu/drm/tegra/gr3d.c | 4 ++--
>  5 files changed, 14 insertions(+), 10 deletions(-)

I think I understand what this is trying to do, but the commit message
does not help at all. So what's really going on here is that we need to
detach the device from the group regardless of whether we're sharing the
group or not, just like we attach groups to the shared domain whether
they share the same group or not.

But in that case, I wonder if it's even worth splitting groups the way
we are right now. Wouldn't it be better to just put all the devices into
the same group and be done with it?

The current code gives me headaches every time I read it, so if we can
just make it so that all the devices under the DRM device share the same
group, this would become a lot easier to deal with. I'm not really
convinced that it makes much sense to keep them on separate domains,
especially given the constraints on the number of domains available on
earlier Tegra devices.

Note that sharing a group will also make it much easier for these to use
the DMA API if it is backed by an IOMMU.

Let me see if I can throw something together to that effect.

Thierry

> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index fa505baaaabc..c1b885444d90 100644
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c
> @@ -2388,7 +2388,7 @@ static int tegra_dc_init(struct host1x_client *clie=
nt)
>  	if (!IS_ERR(primary))
>  		drm_plane_cleanup(primary);
> =20
> -	host1x_client_iommu_detach(client, dc->group);
> +	host1x_client_iommu_detach(client, dc->group, true);
>  	host1x_syncpt_free(dc->syncpt);
> =20
>  	return err;
> @@ -2412,7 +2412,7 @@ static int tegra_dc_exit(struct host1x_client *clie=
nt)
>  		return err;
>  	}
> =20
> -	host1x_client_iommu_detach(client, dc->group);
> +	host1x_client_iommu_detach(client, dc->group, true);
>  	host1x_syncpt_free(dc->syncpt);
> =20
>  	return 0;
> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> index d2080bd7d392..f94441457c64 100644
> --- a/drivers/gpu/drm/tegra/drm.c
> +++ b/drivers/gpu/drm/tegra/drm.c
> @@ -1120,15 +1120,18 @@ struct iommu_group *host1x_client_iommu_attach(st=
ruct host1x_client *client,
>  }
> =20
>  void host1x_client_iommu_detach(struct host1x_client *client,
> -				struct iommu_group *group)
> +				struct iommu_group *group,
> +				bool shared)
>  {
>  	struct drm_device *drm =3D dev_get_drvdata(client->parent);
>  	struct tegra_drm *tegra =3D drm->dev_private;
> =20
>  	if (group) {
> -		if (group =3D=3D tegra->group) {
> +		if (!shared || group =3D=3D tegra->group) {
>  			iommu_detach_group(tegra->domain, group);
> -			tegra->group =3D NULL;
> +
> +			if (group =3D=3D tegra->group)
> +				tegra->group =3D NULL;
>  		}
> =20
>  		iommu_group_put(group);
> diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
> index 488f36f00bd8..9f1a3d6f3406 100644
> --- a/drivers/gpu/drm/tegra/drm.h
> +++ b/drivers/gpu/drm/tegra/drm.h
> @@ -107,7 +107,8 @@ int tegra_drm_unregister_client(struct tegra_drm *teg=
ra,
>  struct iommu_group *host1x_client_iommu_attach(struct host1x_client *cli=
ent,
>  					       bool shared);
>  void host1x_client_iommu_detach(struct host1x_client *client,
> -				struct iommu_group *group);
> +				struct iommu_group *group,
> +				bool shared);
> =20
>  int tegra_drm_init(struct tegra_drm *tegra, struct drm_device *drm);
>  int tegra_drm_exit(struct tegra_drm *tegra);
> diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
> index 673059fd2fcb..c486e0a05c9d 100644
> --- a/drivers/gpu/drm/tegra/gr2d.c
> +++ b/drivers/gpu/drm/tegra/gr2d.c
> @@ -69,7 +69,7 @@ static int gr2d_init(struct host1x_client *client)
>  	return 0;
> =20
>  detach:
> -	host1x_client_iommu_detach(client, gr2d->group);
> +	host1x_client_iommu_detach(client, gr2d->group, false);
>  free:
>  	host1x_syncpt_free(client->syncpts[0]);
>  put:
> @@ -89,7 +89,7 @@ static int gr2d_exit(struct host1x_client *client)
>  	if (err < 0)
>  		return err;
> =20
> -	host1x_client_iommu_detach(client, gr2d->group);
> +	host1x_client_iommu_detach(client, gr2d->group, false);
>  	host1x_syncpt_free(client->syncpts[0]);
>  	host1x_channel_put(gr2d->channel);
> =20
> diff --git a/drivers/gpu/drm/tegra/gr3d.c b/drivers/gpu/drm/tegra/gr3d.c
> index 4778ae999668..591bafe455e0 100644
> --- a/drivers/gpu/drm/tegra/gr3d.c
> +++ b/drivers/gpu/drm/tegra/gr3d.c
> @@ -79,7 +79,7 @@ static int gr3d_init(struct host1x_client *client)
>  	return 0;
> =20
>  detach:
> -	host1x_client_iommu_detach(client, gr3d->group);
> +	host1x_client_iommu_detach(client, gr3d->group, false);
>  free:
>  	host1x_syncpt_free(client->syncpts[0]);
>  put:
> @@ -98,7 +98,7 @@ static int gr3d_exit(struct host1x_client *client)
>  	if (err < 0)
>  		return err;
> =20
> -	host1x_client_iommu_detach(client, gr3d->group);
> +	host1x_client_iommu_detach(client, gr3d->group, false);
>  	host1x_syncpt_free(client->syncpts[0]);
>  	host1x_channel_put(gr3d->channel);
> =20
> --=20
> 2.22.0
>=20

--wq9mPyueHGvFACwf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2xkcsACgkQ3SOs138+
s6EiwhAAiUsnjZ6BBMJkLVBwXfEaKLB3ga/tbSXblEDHLFvBNzOx+uAWKpm8TkPz
1qRIA6CZicSjTeD30ilbkeR98LfFjgroz+QkX6Vom2AJCA75MY50RL3h5uFXmcLr
iyNpk3vs8tfDEi9/AdrEYiwQq0LdUZKgf3MZuFBIl7JvbT8WUEt3p1OgHHrOzKH7
6qQ8sJBHWhAVhYIznIDe14h4HeD9XBXX+tfJIvwvxz5LCtfkFW7kpLlU3oCIEER/
T6QVNRUdl7Bv8kp6SttmG1e6zJs2DakhHmnW5FZDszTSQJ4d5vuCQIN1oFRLLyME
PxBNC+lc1PHxiPUQLngHM1hunlvCeePB5RoJINUC/Xy4fSFQc1xbdY0H/E8RoTiK
o0vKyafvWv8fj+17brBh6OLE4lHHmmV+E5skAT/Gf6xasn17RHlf3vZmPihgmVLD
0vwLIQIqs3+CPKgkod2mSV9QQ3Et1NMUV2iztnK+IQFQVc2q/R/0a0HvVcM4QXaY
skhdcp2idXkPShVBitWTT3XdrHi4LYpjySehAMD2d3m608MzlHa2KwHVe1W3IiXj
7LcHKu1yYU3jNaTj4WLZVR/7WCDRU4dYeGynRjiQVr/L6spxM+z4EAXlOvczUZXo
EOZ8WFH3t7HRivUniCCBC2OkvkPUNpt2yRbuMTDa3y+9MwhObpw=
=uq7y
-----END PGP SIGNATURE-----

--wq9mPyueHGvFACwf--

--===============1265998683==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1265998683==--
