Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AF279CBDD
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 11:32:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF1010E225;
	Tue, 12 Sep 2023 09:32:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ECB110E08E;
 Tue, 12 Sep 2023 09:32:14 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 9A7DE66072F2;
 Tue, 12 Sep 2023 10:32:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694511133;
 bh=eeI0C4r6TV9rH54wW4ZS7WZ8fXen+SsJRbpmKuHbmrQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=F3XA6ZMRhxEcRaaIG78QIW35HZz81I/2rWotiaTcVL5WU/TWALitPEZKC7YJbesGk
 plFU7O+4PzdXq5QBTfMurrOPmctAlTA5LH+rb5OTsi0Z1deJhaiYZ0DAaEmu1eW62A
 z9w/P/KGBNcqm5yDBF3tVk1YlwSzsklzR5bqw7gCTF4ApVuZM0nTvuMlmUYXVVKtxI
 av5ef2inX/fYZrGIRiLI81XBtN7wTd2IJw0macH5QgZ5xyg3VQh6m7ETMkTP611rl8
 /8ehZH38kro0WXptil0SQQsDozxYDcoI4/gmS/0BOtxVY5naMBvNMseKVbQt/EQTUH
 dnVzdy6cU5X5g==
Date: Tue, 12 Sep 2023 11:32:10 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Subject: Re: [PATCH v4 6/6] drm/drm-file: Show finer-grained BO sizes in
 drm_show_memory_stats
Message-ID: <20230912113210.65897aab@collabora.com>
In-Reply-To: <20230912084044.955864-7-adrian.larumbe@collabora.com>
References: <20230912084044.955864-1-adrian.larumbe@collabora.com>
 <20230912084044.955864-7-adrian.larumbe@collabora.com>
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

On Tue, 12 Sep 2023 09:37:00 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> The current implementation will try to pick the highest available size
> display unit as soon as the BO size exceeds that of the previous
> multiplier. That can lead to loss of precision in BO's whose size is
> not a multiple of a MiB.
>=20
> Fix it by changing the unit selection criteria.
>=20
> For much bigger BO's, their size will naturally be aligned on something
> bigger than a 4 KiB page, so in practice it is very unlikely their display
> unit would default to KiB.

Let's wait for Rob's opinion on this.

>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/drm_file.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 762965e3d503..bf7d2fe46bfa 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -879,7 +879,7 @@ static void print_size(struct drm_printer *p, const c=
har *stat,
>  	unsigned u;
> =20
>  	for (u =3D 0; u < ARRAY_SIZE(units) - 1; u++) {
> -		if (sz < SZ_1K)
> +		if (sz & (SZ_1K - 1))
>  			break;
>  		sz =3D div_u64(sz, SZ_1K);
>  	}

