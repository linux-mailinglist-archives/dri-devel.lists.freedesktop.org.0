Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE0678B47B
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 17:32:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51AEA10E300;
	Mon, 28 Aug 2023 15:32:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D530510E300
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 15:32:38 +0000 (UTC)
Received: from hamburger.collabora.co.uk (hamburger.collabora.co.uk
 [IPv6:2a01:4f8:1c1c:f269::1])
 by madras.collabora.co.uk (Postfix) with ESMTP id 332E2660716E;
 Mon, 28 Aug 2023 16:32:36 +0100 (BST)
From: "Helen Mae Koike Fornazier" <helen.koike@collabora.com>
In-Reply-To: <tencent_73FCC06A3D1C14EE5175253C6FB46A07B709@qq.com>
Content-Type: text/plain; charset="utf-8"
X-Forward: 127.0.0.1
Date: Mon, 28 Aug 2023 16:32:35 +0100
To: "Zhang Shurong" <zhang_shurong@foxmail.com>
MIME-Version: 1.0
Message-ID: <6fd4-64ecbe00-3-213b7840@157890307>
Subject: =?utf-8?q?Re=3A?= [PATCH] =?utf-8?q?spi=3A?==?utf-8?q?_tegra=3A?= Fix
 missing IRQ check in =?utf-8?q?tegra=5Fslink=5Fprobe()?=
User-Agent: SOGoMail 5.8.4
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
Cc: christian.koenig@amd.com, broonie@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, ldewangan@nvidia.com, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org, jonathanh@nvidia.com, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Saturday, August 26, 2023 07:02 -03, Zhang Shurong <zhang=5Fshurong@=
foxmail.com> wrote:

> This func misses checking for platform=5Fget=5Firq()'s call and may p=
asses the
> negative error codes to request=5Firq(), which takes unsigned IRQ #,
> causing it to fail with -EINVAL, overriding an original error code.
>=20
> Fix this by stop calling request=5Firq() with invalid IRQ #s.
>=20
> Fixes: dc4dc3605639 ("spi: tegra: add spi driver for SLINK controller=
")
> Signed-off-by: Zhang Shurong <zhang=5Fshurong@foxmail.com>

Reviewed-by: Helen Koike <helen.koike@collabora.com>

> ---
>  drivers/spi/spi-tegra20-slink.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/spi/spi-tegra20-slink.c b/drivers/spi/spi-tegra2=
0-slink.c
> index 4d6db6182c5e..f5cd365c913a 100644
> --- a/drivers/spi/spi-tegra20-slink.c
> +++ b/drivers/spi/spi-tegra20-slink.c
> @@ -1086,6 +1086,8 @@ static int tegra=5Fslink=5Fprobe(struct platfor=
m=5Fdevice *pdev)
>  	reset=5Fcontrol=5Fdeassert(tspi->rst);
> =20
>  	spi=5Firq =3D platform=5Fget=5Firq(pdev, 0);
> +	if (spi=5Firq < 0)
> +		return spi=5Firq;
>  	tspi->irq =3D spi=5Firq;
>  	ret =3D request=5Fthreaded=5Firq(tspi->irq, tegra=5Fslink=5Fisr,
>  				   tegra=5Fslink=5Fisr=5Fthread, IRQF=5FONESHOT,
> --=20
> 2.30.2
>

