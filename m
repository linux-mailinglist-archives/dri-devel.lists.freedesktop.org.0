Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 024073447AB
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 15:46:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD75D6E4B5;
	Mon, 22 Mar 2021 14:45:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A65576E4B5
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 14:45:56 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id kt15so12231868ejb.12
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 07:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=nTyQcARXnlDDl7OQGBUXitsA62q9TmPwTmT50OvP6kw=;
 b=RDaDbtCmfo7SY6L1Rub5TCTzllSa+YCIT6ramC9wUKzGtEDQONFO8ovLZ1EjwCqkSU
 hCQJV0nKwXiyq2BC7hspzMfOlnZxNS2br5RGDujxrxZM4IwG9m8tzf4dp/7+o/Supdtq
 HtowThZ17CUQeeardPLNAXAdpjMVExrlU+Mnolby3iPtUYlSG0K8A/KwWIlHr7oeaomz
 Znj4jKzMpVvqxtKSctzoIDIF2tCWzlKFYd4HqjuwkAmoa6i+MwoTtUSYcfURjaZvb/cv
 3kkYvOaIrpkqzPg0M1FsMzF16IFKeU5DVGu8Bxl1IHJk6G0nsCN/uDH6iVvxWpitBExZ
 Y4Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nTyQcARXnlDDl7OQGBUXitsA62q9TmPwTmT50OvP6kw=;
 b=K8kBR1m0FrA468YaYOtisf/EsW6cDoT2xbBCzj49J4xM4VTss7mN8e0wY2JEoEreUI
 /d13gGhcEwSMXlg6d0ZRJ7jIdfdx9A+4/l0F0x22iHQqSCxKc6CEyvbUxwexIHn7Bvnw
 g4yovsgUK+auHkdUDwHNvTeLtaJ8P9lfm5dkIRKs3t5iP0JnhvKAoI0Vra4Ne0IA/D6o
 gTJahrgG+aweHdPsI6QwNOlJ4N+NYnLGUaitudN0oQUbFTOOAwirYd95rdCS+XajniZZ
 CM66CekYxrlaQABwFq/pwoD7Rx+Q5z7UVrObmpKTtTvDKPkuYP6PUpzMzu+L4vkb4SFb
 FoJQ==
X-Gm-Message-State: AOAM530viFknCw2uJEaQBrG1wZ3XbIWsm199+7zJgYaHM0DKaoYNa1fA
 sg4gYOH+HBjHUSfZwRfuHk8=
X-Google-Smtp-Source: ABdhPJwx6n0Tf/w3xF586Z0RExXK58aKkhIVBRtu6A0p3oCX3+N5xp76SHJCvbOHRBX2QHzAnRs2dQ==
X-Received: by 2002:a17:906:311a:: with SMTP id 26mr56595ejx.395.1616424355410; 
 Mon, 22 Mar 2021 07:45:55 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id mc10sm9603809ejb.56.2021.03.22.07.45.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 07:45:52 -0700 (PDT)
Date: Mon, 22 Mar 2021 15:46:10 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <mperttunen@nvidia.com>
Subject: Re: [PATCH v5 01/21] gpu: host1x: Use different lock classes for
 each client
Message-ID: <YFitsk3I2l7IBnLR@orome.fritz.box>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-2-mperttunen@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20210111130019.3515669-2-mperttunen@nvidia.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 talho@nvidia.com, bhuntsman@nvidia.com, linux-tegra@vger.kernel.org,
 digetx@gmail.com
Content-Type: multipart/mixed; boundary="===============0532990999=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0532990999==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KSQhT/oMBEacnAK5"
Content-Disposition: inline


--KSQhT/oMBEacnAK5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 11, 2021 at 02:59:59PM +0200, Mikko Perttunen wrote:
> To avoid false lockdep warnings, give each client lock a different
> lock class, passed from the initialization site by macro.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/host1x/bus.c | 7 ++++---
>  include/linux/host1x.h   | 9 ++++++++-
>  2 files changed, 12 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
> index 347fb962b6c9..8fc79e9cb652 100644
> --- a/drivers/gpu/host1x/bus.c
> +++ b/drivers/gpu/host1x/bus.c
> @@ -715,13 +715,14 @@ EXPORT_SYMBOL(host1x_driver_unregister);
>   * device and call host1x_device_init(), which will in turn call each cl=
ient's
>   * &host1x_client_ops.init implementation.
>   */
> -int host1x_client_register(struct host1x_client *client)
> +int __host1x_client_register(struct host1x_client *client,
> +			   struct lock_class_key *key)

I've seen the kbuild robot warn about this because the kerneldoc is now
out of date.

>  {
>  	struct host1x *host1x;
>  	int err;
> =20
>  	INIT_LIST_HEAD(&client->list);
> -	mutex_init(&client->lock);
> +	__mutex_init(&client->lock, "host1x client lock", key);

Should we maybe attempt to make this unique? Could we use something like
dev_name(client->dev) for this?

Thierry

--KSQhT/oMBEacnAK5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBYrbAACgkQ3SOs138+
s6Gvsw//Xk4Xa0bqe9jKgWc5VaMBt2TkzoWG3GsYt3YldT4P/v1zSBc04d3qANo8
wNt++XqOltaJCju6MCRMTPD70N79qdl0tEq956XcU+NV+TIOdrY/CdijuAtkd63u
q2MQK6t25YSeua7KLtqmcCt5nOU4ImRLDgbBSYiApQB3jJg/kqcxKvx1Zf9hKsbF
oPSVrOhU3UkrzO1wTQijoLVRUyZzO/4R3eegtXt8s6WgzhXGmhrKSXa9/HnnmWRC
7NBjBVsGOd+hTCFO78LI7BkWomiz+X+pwsMsILfGIrjxq8CD7WugonBQZN5+FjOX
qcSqT0IaN7fYn3nbIxeLQEDGBOb6vi1VwHCH1y1JYh+agnWthHt2/bRx4KmLpM7F
nvAXnJrddnKWxuFRwBY+Jo0YGrRI1Dk6p9pvrPk6r2RYtrXPg2nFLzJIAlZyJ7ip
DwLPMoz4kRPbY256BN7WCQ8WlkflKBiKU1qlSOfZV6Kizw/eCloYoXWk+CJ9uTyr
xq1wun2DLIFJabDmy6k3biJaUXUelJ7iJTP8SiB85y0XagfE9qUi/96VIjD/VS+U
pbbwkOipAbP5fZA1b8lkY/Gt+vyIop7BHPT6454ypOnzd6sZ0R7nnsPdzdzHWUea
99HcXvuMw0Ba/RekrhHCXxtwrO6Q/Vb8ProS1rcXXd8ne1vdAFw=
=ZLRS
-----END PGP SIGNATURE-----

--KSQhT/oMBEacnAK5--

--===============0532990999==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0532990999==--
