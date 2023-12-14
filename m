Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1E381387F
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 18:27:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E4710E1E0;
	Thu, 14 Dec 2023 17:27:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 521E010E1E0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 17:27:43 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40c2db2ee28so89750745e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 09:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702574862; x=1703179662; darn=lists.freedesktop.org;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bhNXYxyAPYzPWe6n1/YVvZ3TcijeuBnRICz1efGH75o=;
 b=jev4ggtnQyGG92ksbvZiUwvjNGF329sLLeDIllsGJQ15FOH0CLJ9EO/4OaW/ztAKjD
 SanLmwQxrvLAqxaqhOv2xdHWBQEWNELDoxO9wmdgIEpvzidkBDR3/fiAfKnTXbS3o1c6
 HpS9I+YSj193cc236ma4e67WwOQxTJLQEapOyQhdZoWoTq4fo0lgcUGQ1b/j1blhC1H6
 eH8CfwwiOFZckWy1HGXA+sllTA0AIRqUmyg2ssMpN918qy4O6Fz57ksSkyBfDCXM9nxf
 VlfBBJbQ+O7ZM3nrv0J3NreLFwadbDheA8MLg9CQSgZAhf8XzWkPEeOEc3QxU35Kur3S
 AD6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702574862; x=1703179662;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bhNXYxyAPYzPWe6n1/YVvZ3TcijeuBnRICz1efGH75o=;
 b=s6KesW02AmEe7HqdGISPb8Hb93qet1uYZOVkSSSzDp8RI17zjF4HW5vn6p7ymp3RnG
 1QejRAwz0ZHLIv/9u4mDZW+QK8NXf0hG0VXF3lgGGhhGrOnUZrbSdU763e7P/PPKGjx9
 PxLsYYUyXcirlCwAFd4ZQfUI4XtCYZxzQOJpI7jZsY9wH9bfEqaOPVrbglvGtvL34Inx
 cPtKI7jabpr7QxJBTlv/BIuPsCa+m1/9Uke/aIC4ELKwuZrd8AGJmy4Z1QNu6twBown8
 CMTVRVs/wj64EBjgLyHpvps0/vQ2D7enbey7bdsg7vkkosuYaatYP6gFqrTWgnlXwMim
 Izdg==
X-Gm-Message-State: AOJu0Yws0Gi8L9ml90bAPtEx7xl9tC6A9dPfjDqcKqOP7azy00JnJxCg
 xnIEXW64Iwue3JdN2MUS0S4=
X-Google-Smtp-Source: AGHT+IH6Yd3h0/uGmjXlcw9M/CRAc2BZ/TlpTItAVqacJkRFU0Q0k2bvne3xpqFXQ6P2hTW1lBP24w==
X-Received: by 2002:a05:600c:501e:b0:40b:5e1d:83a8 with SMTP id
 n30-20020a05600c501e00b0040b5e1d83a8mr5741736wmr.60.1702574861554; 
 Thu, 14 Dec 2023 09:27:41 -0800 (PST)
Received: from orome.fritz.box
 (p200300e41f0fa600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f0f:a600:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a05600c350200b0040c44b4a282sm17521133wmq.43.2023.12.14.09.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 09:27:41 -0800 (PST)
Date: Thu, 14 Dec 2023 18:27:39 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Zhang Shurong <zhang_shurong@foxmail.com>
Subject: Re: [PATCH] drm/tegra: dpaux: Fix PM disable depth imbalance in
 tegra_dpaux_probe
Message-ID: <ZXs7C6Yp77UoMCYV@orome.fritz.box>
References: <tencent_B13DB7F6C0023C46157250A524966F326A09@qq.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2ga4bhpKz+XbSCEL"
Content-Disposition: inline
In-Reply-To: <tencent_B13DB7F6C0023C46157250A524966F326A09@qq.com>
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
Cc: linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 dri-devel@lists.freedesktop.org, jonathanh@nvidia.com, broonie@kernel.org,
 linux-tegra@vger.kernel.org, mperttunen@nvidia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--2ga4bhpKz+XbSCEL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 04, 2023 at 10:10:55PM +0800, Zhang Shurong wrote:
> The pm_runtime_enable function increases the power disable depth,
> which means that we must perform a matching decrement on the error
> handling path to maintain balance within the given context.
> Additionally, we need to address the same issue for pm_runtime_get_sync.
> We fix this by invoking pm_runtime_disable and pm_runtime_put_sync
> when error returns.
>=20
> Fixes: 82b81b3ec1a7 ("drm/tegra: dpaux: Implement runtime PM")
> Signed-off-by: Zhang Shurong <zhang_shurong@foxmail.com>
> ---
>  drivers/gpu/drm/tegra/dpaux.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)

Applied, thanks.

Thierry

--2ga4bhpKz+XbSCEL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmV7OwsACgkQ3SOs138+
s6GKVg//eVk62JGZsNwcomhQ8UjV7GIdFwOYPfRJbaYoFtmZ2jZqMOdYE/NDYYMt
BkvN6UEK87BP4lslecYI7ooR2ORjKjtyX2/8NLqhQSsDxUCbrBjU1VhRO0eyiQvm
0wwFvEF8nWMLnKtmmklnpO9i9T5EuKGOSshRYaRxgN6gJYJGrZLOt+snSMuGx1Pi
BKsyukdE2vHVQ68oiyvMyoFkkEKjQljc8/mkOAhsKxFqObbOwWUJUVZusvE0AoPh
+NuzFBtkCubHntRUaUdMmomqWBufK+xzFPxSuGu3IhJFOfed6y+ENu+shaF0vP98
vHz11q1n5UX6DRgfUhTp2yZLc3HDC/qWzUj44dvccd6HUOUW8he9o2yjle49ZOEG
pwFpmJUICX805jFGhgsL0FenugXkacrQM+VHAnWrfQJfsXR7U5HW9H52So+V/mC/
+e3Vg2Bo7OuDwYR0z2qpxwptT1tH3igfX4t+YZOQxpHPhswPrqwtNW+4ZHWj/bD2
J/A56TIedeoEaL2NdiwhXEV+rqEgh6kTT+OQxkUC+9r36954a2oNi7dUaA69waLk
l+NCMB/lCA8GgFyDTQNWMTNirz0/vficWJx/lE1YArchkglCtlfIIDtiYF3udAzb
4JeZocrkxuxwUxIZltPCyz+rMoS7FUds237S8hXO68sON4uIxRk=
=EYX6
-----END PGP SIGNATURE-----

--2ga4bhpKz+XbSCEL--
