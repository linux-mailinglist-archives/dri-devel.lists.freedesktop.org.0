Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C0036AE04
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 09:41:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2104C89BD4;
	Mon, 26 Apr 2021 07:41:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E9CF89BD4
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 07:41:34 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id zg3so1329242ejb.8
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 00:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=c1vBPck8JU0pwgwWsq/snACpybxqrhklsB99FqhjoPI=;
 b=btKhBB/tFIdFQPgrpPpl6N2mY5cxZFwqPqUxdsGBx0wugCltKIgoZqNWemwLRzgn67
 XUBVcPTHxLGLYObb4I2rb5wpvfnA0eFEJTdsdUvrkheQyp/h4Q5sz9YT9cHnVLGPkX9d
 Nh09oHnBnL0EYqayiSih9K7q7UtSXotDlmfEUjeaGEx9mo2XZvS51H8KuePo4zoc9WV6
 I/s8zOAgoMPQ4UXlwFA1sC1tUmBiFfvq8ruQ6T/HSlBLEwpxkNBlWEwp0FPVQWEwTuPC
 hCyRmKntWEx0JzG0yFTnUAfDOmVRnhoUNgKAaWdz8oZUWpg7rBly/txd7ozzKO5etZkQ
 v92w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=c1vBPck8JU0pwgwWsq/snACpybxqrhklsB99FqhjoPI=;
 b=tA4AMFK3DMCiiJnwlIKaSQNoEDwssl1uQdpCrOctjKd7aVKzTnTM6k0d/DZrWYrmwJ
 LucN7Vz9XMJrHavZno4Etl8zs+mf7c8eRnbpFwsnnhrAdu1+UADz7vJHw51caA+EV/kH
 QpbIImhBArw7tb++ix9RZBdVIKJjoiTT88yNyTOc/wbiLqri0COr5OWfsGIdJ6z6zaL9
 2HcfAdpTREFrxTF39Lgh5ns3Oe34P6sdEeeQEh1pMTVMJKgUeyA55iG0DK5SRYuEqg+L
 BeF1XkqtlBrPn2+G0IaI1INFWecDnC+qpoqAZ1Jh93+1JdxYX34dUR7PSbbJsuoLYZ+1
 YPTA==
X-Gm-Message-State: AOAM5336QX5TgpXMUH4rSTzhGkymX0FKEgW3XgzUQvdc4dRRhXkc9efT
 IM+LmmQ3wp88CHFqODCsRbY=
X-Google-Smtp-Source: ABdhPJxUjB9yH2Enni4Q3e63AZXAGAWmsaB5WN2KunBgTRUHiE0T+mMvnnHhosoIzZ83Pa89llj2OQ==
X-Received: by 2002:a17:906:524f:: with SMTP id
 y15mr16985419ejm.65.1619422892867; 
 Mon, 26 Apr 2021 00:41:32 -0700 (PDT)
Received: from localhost (p2e5be10e.dip0.t-ipconnect.de. [46.91.225.14])
 by smtp.gmail.com with ESMTPSA id c19sm13506940edu.20.2021.04.26.00.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 00:41:31 -0700 (PDT)
Date: Mon, 26 Apr 2021 09:42:24 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 1/2] drm/tegra: Get ref for DP AUX channel, not its ddc
 adapter
Message-ID: <YIZu4PD6BmlGYXuc@orome.fritz.box>
References: <20210423182146.185633-1-lyude@redhat.com>
 <20210423182146.185633-2-lyude@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210423182146.185633-2-lyude@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-tegra@vger.kernel.org, Thierry Reding <treding@nvidia.com>
Content-Type: multipart/mixed; boundary="===============0545663583=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0545663583==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cyYgln7x2rIbz3eF"
Content-Disposition: inline


--cyYgln7x2rIbz3eF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 23, 2021 at 02:21:45PM -0400, Lyude Paul wrote:
> While we're taking a reference of the DDC adapter for a DP AUX channel in
> tegra_sor_probe() because we're going to be using that adapter with the
> SOR, now that we've moved where AUX registration happens the actual device
> structure for the DDC adapter isn't initialized yet. Which means that we
> can't really take a reference from it to try to keep it around anymore.
>=20
> This should be fine though, because we can just take a reference of its
> parent instead.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Fixes: 39c17ae60ea9 ("drm/tegra: Don't register DP AUX channels before co=
nnectors")
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-tegra@vger.kernel.org
> ---
>  drivers/gpu/drm/tegra/sor.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
> index 7b88261f57bb..4e0e3a63e586 100644
> --- a/drivers/gpu/drm/tegra/sor.c
> +++ b/drivers/gpu/drm/tegra/sor.c
> @@ -3739,11 +3739,11 @@ static int tegra_sor_probe(struct platform_device=
 *pdev)
>  		if (!sor->aux)
>  			return -EPROBE_DEFER;
> =20
> -		if (get_device(&sor->aux->ddc.dev)) {
> -			if (try_module_get(sor->aux->ddc.owner))
> +		if (get_device(sor->aux->dev)) {
> +			if (try_module_get(sor->aux->dev->driver->owner))
>  				sor->output.ddc =3D &sor->aux->ddc;
>  			else
> -				put_device(&sor->aux->ddc.dev);
> +				put_device(sor->aux->dev);
>  		}
>  	}

Unfortunately, I think it's a bit more subtle than that. The reason for
this get_device()/try_module_get() dance was to mirror the behaviour of
of_get_i2c_adapter_by_node() so that when we call i2c_put_adapter() in
tegra_output_remove() we correctly decrease the reference count.

The above will increase the reference on the I2C adapter's parent while
i2c_put_adapter() will then only decrease the reference on the I2C
adapter, so I think effectively we'd be leaking a reference to the I2C
adapter's parent.

Also, since we didn't take a reference on the I2C adapter explicitly,
releasing that reference in tegra_output_remove() might free the I2C
adapter too early.

I wonder if perhaps it'd be easier to get rid of the struct tegra_output
abstraction altogether and push this down into the individual drivers,
even if that means a bit more code duplication. That's not the kind of
quick fix to resolve this current situation, so perhaps as a stop-gap we
just need to sprinkle a few more conditionals throughout tegra_output
code. We could, for example, avoid calling i2c_put_adapter() in
tegra_output_remove() for the DisplayPort cases and instead manually
release the reference to the I2C adapter's parent in tegra_sor_remove().
On top of your patch above that /should/ fix things properly for now.

Thierry

--cyYgln7x2rIbz3eF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmCGbtgACgkQ3SOs138+
s6GwRg/9Fz0mMHegO0rimUIpYL7RJ0L1F7bH0RxDPapEknjZ3xf3NxdDOZT1Z92l
5ZhInuo9EkAwfUm7MyFoatuRV2hc/Xk3ZXAcNaMHjuzhhZ/ixfAWllpOsk1lY5X6
7NsXyALSj7U0FP+/gZaPsztz5xomCojRdmW0EsBKxGJNCP3ttcPUimx6zPr9ASkJ
LHFVV3isrxA9cGIiM6qAPNLE/Gwp17++aME0sdjboqzXHINXCjgk7n55DJp8Ou2x
LOJFq62NGbZqLYkKDuQq3A0hF08xpVMMvcONwtlJkgO0dIwH5LaDbhyC7Xaxv/zU
TuBEcYDVijaLZxH7deQdVqSFeS8U/NWebN6hO4MWzZuVy8vVIzYXyH4ordrsUITQ
N6x0c1tx2O+vEGJiNzVn35J9gxGIc2NjfH5JBVddszwNBLeZSs4ReAejpVa2E0Sk
S55SnjSm/1B9UpPxmaic3p2cMRz0nS/GvdJ8i5uRDyC1fIRDLujPuoDA/p52AKNd
pLCzK/4OFOd6akh4mhm0cjfB8SWwVqxvWqsGLsjeZNZSu74hz9xMaP4yPdzGsmJ7
W94YOpvqEfLw5uFK1b8NdXlPEe5VVjj9yzQLocvbtobws9N6j1ydRh3zTtisd0RU
y7DBKuFNGtaYWslW0zUhwGQbIbfv3vW8EeJ796x1iF+MFdAwV+4=
=wpO5
-----END PGP SIGNATURE-----

--cyYgln7x2rIbz3eF--

--===============0545663583==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0545663583==--
