Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEF27936E7
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 10:11:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1217F10E591;
	Wed,  6 Sep 2023 08:11:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 006E210E591;
 Wed,  6 Sep 2023 08:11:06 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 231EF6600BB0;
 Wed,  6 Sep 2023 09:11:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693987865;
 bh=8bSTrWbaMc1d/WyrUSjc3GFi3A3hna8Y85gKyKeZ2QE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=A6irFNZNcrndI+FVnSuQe06fuZ1lV4On04bGSuwM3m51elPTmgtclWNK7Ru7tTz0S
 CI153LatWq7IsT87scPUnmoZRN0AoUu2+FBh903IZgY/hF9txKqcppB9Ma9oc4D02C
 ceZlwTYD/7dZpQf4atTnb5/ku4ksxGfcH8gWFMYhxFF0M4cYFa8mOAfD++5tbyoi8b
 mHlbBCY2K4UIlIbr7w+avVxl0oi0KQN4ZznpMhCylFpN++IUw/pdhlP+qAlQrPhENI
 4WEQacSCxAl8dkq6puZEBEyx5Ezc14EwdFguepGJ1mBWWfF+bY9urrIDvHwlan+Aw7
 9RYLoWcWd+c1A==
Date: Wed, 6 Sep 2023 10:11:01 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Subject: Re: [PATCH v3 8/8] drm/drm-file: Show finer-grained BO sizes in
 drm_show_memory_stats
Message-ID: <20230906101101.04f4e1a2@collabora.com>
In-Reply-To: <20230905184533.959171-9-adrian.larumbe@collabora.com>
References: <20230905184533.959171-1-adrian.larumbe@collabora.com>
 <20230905184533.959171-9-adrian.larumbe@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: tzimmermann@suse.de, sean@poorly.run, quic_abhinavk@quicinc.com,
 mripard@kernel.org, steven.price@arm.com, freedreno@lists.freedesktop.org,
 healych@amazon.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 marijn.suijten@somainline.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue,  5 Sep 2023 19:45:24 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> The current implementation will try to pick the highest available size
> display unit as soon as the BO size exceeds that of the previous
> multiplier.
>=20
> By selecting a higher threshold, we could show more accurate size numbers.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/drm_file.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 762965e3d503..0b5fbd493e05 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -879,7 +879,7 @@ static void print_size(struct drm_printer *p, const c=
har *stat,
>  	unsigned u;
> =20
>  	for (u =3D 0; u < ARRAY_SIZE(units) - 1; u++) {
> -		if (sz < SZ_1K)
> +		if (sz < (SZ_1K * 10000))
>  			break;

This threshold looks a bit random. How about picking a unit that allows
us to print the size with no precision loss?

	for (u =3D 0; u < ARRAY_SIZE(units) - 1; u++) {
		if (sz & (SZ_1K - 1))
			break;
	}


>  		sz =3D div_u64(sz, SZ_1K);
>  	}

