Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3C87C59E4
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 19:03:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A3BC10E0BB;
	Wed, 11 Oct 2023 17:03:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B576A10E0B0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 17:03:53 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1qqccf-0005vR-JA; Wed, 11 Oct 2023 19:03:49 +0200
Message-ID: <e9826fb1cd037e829533edddd6e9e18683ad5e6f.camel@pengutronix.de>
Subject: Re: [PATCH v2] drm/etnaviv: refactor deprecated strncpy
From: Lucas Stach <l.stach@pengutronix.de>
To: Justin Stitt <justinstitt@google.com>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>,  David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
Date: Wed, 11 Oct 2023 19:03:47 +0200
In-Reply-To: <20230918-strncpy-drivers-gpu-drm-etnaviv-etnaviv_perfmon-c-v2-1-8ae12071c138@google.com>
References: <20230918-strncpy-drivers-gpu-drm-etnaviv-etnaviv_perfmon-c-v2-1-8ae12071c138@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Bo YU <tsu.yubo@gmail.com>, linux-hardening@vger.kernel.org,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Montag, dem 18.09.2023 um 13:34 +0000 schrieb Justin Stitt:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1]=
.
>=20
> We should prefer more robust and less ambiguous string interfaces.
>=20
> A suitable replacement is `strscpy_pad` due to the fact that it
> guarantees NUL-termination on the destination buffer whilst maintaining
> the NUL-padding behavior that strncpy provides.
>=20
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strn=
cpy-on-nul-terminated-strings [1]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Cc: Bo YU <tsu.yubo@gmail.com>
> Signed-off-by: Justin Stitt <justinstitt@google.com>

Thanks, applied to my etnaviv/next branch.

Regards,
Lucas
> ---
> Changes in v2:
> - use strscpy_pad (thanks Kees)
> - Link to v1: https://lore.kernel.org/r/20230914-strncpy-drivers-gpu-drm-=
etnaviv-etnaviv_perfmon-c-v1-1-3adc2d9bfc52@google.com
> ---
> Similar to [2] which was never picked up. Let's prefer strscpy_pad to str=
lcpy, though
>=20
> [2]: https://lore.kernel.org/all/20190328080918.9290-1-tsu.yubo@gmail.com=
/
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_perfmon.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c b/drivers/gpu/drm/=
etnaviv/etnaviv_perfmon.c
> index bafdfe49c1d8..dc9dea664a28 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> @@ -511,7 +511,7 @@ int etnaviv_pm_query_dom(struct etnaviv_gpu *gpu,
> =20
>  	domain->id =3D domain->iter;
>  	domain->nr_signals =3D dom->nr_signals;
> -	strncpy(domain->name, dom->name, sizeof(domain->name));
> +	strscpy_pad(domain->name, dom->name, sizeof(domain->name));
> =20
>  	domain->iter++;
>  	if (domain->iter =3D=3D nr_domains)
> @@ -540,7 +540,7 @@ int etnaviv_pm_query_sig(struct etnaviv_gpu *gpu,
>  	sig =3D &dom->signal[signal->iter];
> =20
>  	signal->id =3D signal->iter;
> -	strncpy(signal->name, sig->name, sizeof(signal->name));
> +	strscpy_pad(signal->name, sig->name, sizeof(signal->name));
> =20
>  	signal->iter++;
>  	if (signal->iter =3D=3D dom->nr_signals)
>=20
> ---
> base-commit: 3669558bdf354cd352be955ef2764cde6a9bf5ec
> change-id: 20230914-strncpy-drivers-gpu-drm-etnaviv-etnaviv_perfmon-c-dd0=
95491dfde
>=20
> Best regards,
> --
> Justin Stitt <justinstitt@google.com>
>=20

