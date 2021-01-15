Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BCC2F80AF
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 17:26:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C0A6E103;
	Fri, 15 Jan 2021 16:26:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E05DA6E103
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 16:26:13 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id 91so9880846wrj.7
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 08:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=nWLmc3yR2tv/EqCP45DZyypeULeeDqAZ/zy0X3SdJ5s=;
 b=QJB/43JqyTc1Gi68NiR+A3I1qp5KyVQrvM5MJJ/0u86ADDxhG/NCpLGJmGDzakounI
 Xc3fNEifdzB4tW1iLbNNB+lDEqTGiB3zKVmDOdR/k/L0SxymPeckR2twJicjdJ1Bir+2
 WItkF9dN3RRo9cgne1PedOxpOJNrOahbVg4kKKut9GJwpQU+UsIQBCnmcMd/sRzdEJ1Y
 xhcW+Vn5zsgasBELDibw9FLPFHM7qSddwBPsL6bMnJC+HS0/mhWCLkeA2Ua5wiemxKdQ
 +Fv5D7GKK2pCHHgtTyl4D/MLWqWbnjMpoKHviF86d6H3YVaoVnYMGFN0JwPP9SOOxF/V
 7c0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nWLmc3yR2tv/EqCP45DZyypeULeeDqAZ/zy0X3SdJ5s=;
 b=aFlcxrti2Qy7M1x3LB6j5fUtwczhpF1WDaFJatp7h/BHxjo7w6PzmCCd9UsWQBcb5P
 27CxfETZjgYXgxzaPxF0/43r4q0NQ+2uDCkrVbgbzTQwHZbe+jSCzV6iKRQBmBNF9Pev
 sWL0iN8ZZcwLMHuizDNR7xPs8HGXXtCwkJA52sgwVOartG5Csp5Cls7aoNv5YR41gHd4
 uX+AbCXtsihITbz0Lym+1/COJopmYy1z8IMtt9h8xf3LRLIOuJON2z6V3EiZ0H2BGyWi
 O6+v0cYxOk8t/npWrYCRf89KPf2DEDdWm4OxcIcMBeOSIbBDr9zKpsVmB76CEzwBqgGL
 PiRA==
X-Gm-Message-State: AOAM532KyJe0YhGV9qLwCoZ/GaysAxoZjIKSs/agMZCvi21pUp09jNJ2
 nZBYkA3zc0+aXRJ4/LxhA/w=
X-Google-Smtp-Source: ABdhPJxh8Z+P44Wu1c7fkR9xWwjvx8qEckdtWrwy9Mu4uUNFcydekCsOgd9NCGDZ2vrbTt++pa2J+w==
X-Received: by 2002:adf:f6c9:: with SMTP id y9mr14160847wrp.121.1610727972657; 
 Fri, 15 Jan 2021 08:26:12 -0800 (PST)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id v20sm12822294wml.34.2021.01.15.08.26.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 08:26:11 -0800 (PST)
Date: Fri, 15 Jan 2021 17:26:10 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Qinglang Miao <miaoqinglang@huawei.com>
Subject: Re: [PATCH] drm/tegra: fix reference leak when pm_runtime_get_sync
 fails
Message-ID: <YAHCIsQtRUANr+m+@ulmo>
References: <20201201125631.142590-1-miaoqinglang@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20201201125631.142590-1-miaoqinglang@huawei.com>
User-Agent: Mutt/2.0.4 (26f41dd1) (2020-12-30)
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
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-tegra@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1339790206=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1339790206==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mXEwpiDczBzJuSir"
Content-Disposition: inline


--mXEwpiDczBzJuSir
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 01, 2020 at 08:56:31PM +0800, Qinglang Miao wrote:
> The PM reference count is not expected to be incremented on
> return in these tegra functions.
>=20
> However, pm_runtime_get_sync will increment the PM reference
> count even failed. Forgetting to putting operation will result
> in a reference leak here.
>=20
> Replace it with pm_runtime_resume_and_get to keep usage
> counter balanced.
>=20
> Fixes: fd67e9c6ed5a ("drm/tegra: Do not implement runtime PM")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
> ---
>  drivers/gpu/drm/tegra/dc.c   | 2 +-
>  drivers/gpu/drm/tegra/dsi.c  | 2 +-
>  drivers/gpu/drm/tegra/hdmi.c | 2 +-
>  drivers/gpu/drm/tegra/hub.c  | 2 +-
>  drivers/gpu/drm/tegra/sor.c  | 2 +-
>  drivers/gpu/drm/tegra/vic.c  | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)

Applied, thanks.

Thierry

--mXEwpiDczBzJuSir
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmABwiEACgkQ3SOs138+
s6Gq+g//aYAXqOKKZgi5czRT2/84OFx4O+y4q5hyEU08WTnNtySKAdW/EZ7hAFeo
hmeLvPOoa5zjIUx9/4M53lbxnRi8HC4acWL8s+r/WIlGgR6A1zyIIQygYjgQsYAj
UJcN5tWbmTduH2RM/JgrZ5RusiYLrMtxDlZHeGVeC5Zl0UoQulQQFjEdm+lMrlHo
1Lw3CHUnIvhscWzR0AjnQzRIgwCLmGbKRKA7/+kqpgBv6oi+BsR9tWieQhu6fktH
opfas2mz3KILuDTOa4UiBZCbMxEyeXOGIaJsU7+jRiBFEAG8G5I4Of/xXPpqXYV7
o5sVE1xe3W1u9rNha09Ir9cHny7vPWCsg1JHePiFuKzlSjj6Y/vf1YVFg/myrltn
76sCbPDb7aJQ3WbrOeUqJlIMONJGVj69cdhRKe4xbwTQPmAaoS1ywCO3Sm+VyyBf
IfY/SSDJHlqTowdDdGpxOx0mVEdT3OAz+xbEzxjfjX26n76iFKs5UfkG9IWp7lgk
uwsQkE9Y5POipaQNTJ0fuiUmgBCjruQWjnVdBFYAkPBSb/crGgP+8Kq+vAXdU4w1
+T1WLsPBProSSsEqKajIxfsKFqOuwKT5Zb9vi5f0jJZ/ERPybQVEVgxPyIr72dRE
PlYy48vD1184Bbn541hcgtp7eaqMIEizIq+/sHGjKBP5c+SQOGQ=
=TYn/
-----END PGP SIGNATURE-----

--mXEwpiDczBzJuSir--

--===============1339790206==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1339790206==--
