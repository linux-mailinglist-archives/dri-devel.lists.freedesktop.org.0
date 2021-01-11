Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA052F0D57
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 08:44:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BD5A89C3F;
	Mon, 11 Jan 2021 07:44:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 835DA89C3F
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 07:44:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 00397AD6A;
 Mon, 11 Jan 2021 07:44:22 +0000 (UTC)
To: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210111064320.72780-1-kuohsiang_chou@aspeedtech.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/ast: Disable fast reset after DRAM initial
Message-ID: <88f197b6-4df8-76ca-ec31-7f8f739f161e@suse.de>
Date: Mon, 11 Jan 2021 08:44:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210111064320.72780-1-kuohsiang_chou@aspeedtech.com>
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
Cc: airlied@linux.ie, jenmin_yuan@aspeedtech.com, tommy_huang@aspeedtech.com,
 arc_sung@aspeedtech.com, airlied@redhat.com
Content-Type: multipart/mixed; boundary="===============0600129337=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0600129337==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="VTXPfHnMJUypUAkRAZXoX0g4VffYM8VYU"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--VTXPfHnMJUypUAkRAZXoX0g4VffYM8VYU
Content-Type: multipart/mixed; boundary="LBj3fJpi9mJIbX0X9L5LAn7kJSJPvNGKq";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: airlied@linux.ie, tommy_huang@aspeedtech.com, jenmin_yuan@aspeedtech.com,
 airlied@redhat.com, arc_sung@aspeedtech.com
Message-ID: <88f197b6-4df8-76ca-ec31-7f8f739f161e@suse.de>
Subject: Re: [PATCH] drm/ast: Disable fast reset after DRAM initial
References: <20210111064320.72780-1-kuohsiang_chou@aspeedtech.com>
In-Reply-To: <20210111064320.72780-1-kuohsiang_chou@aspeedtech.com>

--LBj3fJpi9mJIbX0X9L5LAn7kJSJPvNGKq
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 11.01.21 um 07:43 schrieb KuoHsiang Chou:
> [Bug][AST2500]
> When AST2500 acts as stand-alone VGA so that DRAM and DVO initializatio=
n
> have to be achieved by VGA driver with P2A (PCI to AHB) enabling.
> However, HW suggests disable Fast reset mode after DRAM initializaton,
> because fast reset mode is mainly designed for ARM ICE debugger.
> Once Fast reset is checked as enabling, WDT (Watch Dog Timer) should be=

> first enabled to avoid system deadlock before disable fast reset mode.
>=20
> Signed-off-by: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
> ---
>   drivers/gpu/drm/ast/ast_drv.h  |  1 +
>   drivers/gpu/drm/ast/ast_main.c |  4 ++
>   drivers/gpu/drm/ast/ast_post.c | 72 ++++++++++++++++++++++-----------=
-
>   3 files changed, 51 insertions(+), 26 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_dr=
v.h
> index da6dfb677540..8bdd1482370d 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -320,6 +320,7 @@ bool ast_is_vga_enabled(struct drm_device *dev);
>   void ast_post_gpu(struct drm_device *dev);
>   u32 ast_mindwm(struct ast_private *ast, u32 r);
>   void ast_moutdwm(struct ast_private *ast, u32 r, u32 v);
> +void patch_ahb_ast2500(struct ast_private *ast);

The function name should be named ast_patch_ahb_2500() because it's not=20
static.

>   /* ast dp501 */
>   void ast_set_dp501_video_output(struct drm_device *dev, u8 mode);
>   bool ast_backup_fw(struct drm_device *dev, u8 *addr, u32 size);
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_m=
ain.c
> index 3775fe26f792..3c072c6589a2 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -96,6 +96,10 @@ static void ast_detect_config_mode(struct drm_device=
 *dev, u32 *scu_rev)
>   	jregd0 =3D ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xd0, 0xff)=
;
>   	jregd1 =3D ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xd1, 0xff)=
;
>   	if (!(jregd0 & 0x80) || !(jregd1 & 0x10)) {
> +		/* Patch AST2500 */
> +		if (((dev->pdev->revision & 0xF0) =3D=3D 0x40) && ((jregd0 & 0xC0) =3D=
=3D 0))

The field dev->pdev is considered deprecated. Instead, you can get the=20
CP device from dev->dev like this

struct pci_dev *pdev =3D to_pci_dev(dev->dev);

It's the same instance, but dev->pdev will removed soon.

> +			patch_ahb_ast2500(ast);
> +
>   		/* Double check it's actually working */
>   		data =3D ast_read32(ast, 0xf004);
>   		if (data !=3D 0xFFFFFFFF) {
> diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_p=
ost.c
> index 8902c2f84bf9..2d121c5b2233 100644
> --- a/drivers/gpu/drm/ast/ast_post.c
> +++ b/drivers/gpu/drm/ast/ast_post.c
> @@ -2026,6 +2026,33 @@ static bool ast_dram_init_2500(struct ast_privat=
e *ast)
>   	return true;
>   }
>=20
> +void patch_ahb_ast2500(struct ast_private *ast)
> +{
> +	u32	data;
> +
> +patch_ahb_lock:
> +	/* Clear bus lock condition */
> +	ast_moutdwm(ast, 0x1e600000, 0xAEED1A03);
> +	ast_moutdwm(ast, 0x1e600084, 0x00010000);
> +	ast_moutdwm(ast, 0x1e600088, 0x00000000);
> +	ast_moutdwm(ast, 0x1e6e2000, 0x1688A8A8);
> +	data =3D ast_mindwm(ast, 0x1e6e2070);
> +	if (data & 0x08000000) {				/* check fast reset */
> +
> +		ast_moutdwm(ast, 0x1E785004, 0x00000010);
> +		ast_moutdwm(ast, 0x1E785008, 0x00004755);
> +		ast_moutdwm(ast, 0x1E78500c, 0x00000033);
> +		udelay(1000);
> +	}
> +	ast_moutdwm(ast, 0x1e6e2000, 0x1688A8A8);
> +	do {
> +		data =3D ast_mindwm(ast, 0x1e6e2000);
> +		if (data =3D=3D 0xffffffff)
> +			goto patch_ahb_lock;
> +	}	while (data !=3D 1);
> +	ast_moutdwm(ast, 0x1e6e207c, 0x08000000);		/* clear fast reset */
> +}
> +
>   void ast_post_chip_2500(struct drm_device *dev)
>   {
>   	struct ast_private *ast =3D to_ast_private(dev);
> @@ -2033,39 +2060,32 @@ void ast_post_chip_2500(struct drm_device *dev)=

>   	u8 reg;
>=20
>   	reg =3D ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xd0, 0xff);
> -	if ((reg & 0x80) =3D=3D 0) {/* vga only */
> +	if ((reg & 0xC0) =3D=3D 0) {/* vga only */
>   		/* Clear bus lock condition */
> -		ast_moutdwm(ast, 0x1e600000, 0xAEED1A03);
> -		ast_moutdwm(ast, 0x1e600084, 0x00010000);
> -		ast_moutdwm(ast, 0x1e600088, 0x00000000);
> -		ast_moutdwm(ast, 0x1e6e2000, 0x1688A8A8);
> -		ast_write32(ast, 0xf004, 0x1e6e0000);
> -		ast_write32(ast, 0xf000, 0x1);
> -		ast_write32(ast, 0x12000, 0x1688a8a8);
> -		while (ast_read32(ast, 0x12000) !=3D 0x1)
> -			;
> -
> -		ast_write32(ast, 0x10000, 0xfc600309);
> -		while (ast_read32(ast, 0x10000) !=3D 0x1)
> -			;
> +		patch_ahb_ast2500(ast);
> +
> +		/* Disable watchdog */
> +		ast_moutdwm(ast, 0x1E78502C, 0x00000000);
> +		ast_moutdwm(ast, 0x1E78504C, 0x00000000);
> +		/* Reset USB port */
> +		ast_moutdwm(ast, 0x1E6E2090, 0x20000000);		/* add at V1.2 */
> +		ast_moutdwm(ast, 0x1E6E2094, 0x00004000);		/* add at V1.2 */
> +		if (ast_mindwm(ast, 0x1E6E2070) & 0x00800000) {		/* add at V1.2 */
> +			ast_moutdwm(ast, 0x1E6E207C, 0x00800000);	/* add at V1.2 */
> +			mdelay(100);					/* add at V1.2 */
> +			ast_moutdwm(ast, 0x1E6E2070, 0x00800000);	/* add at V1.2 */
> +		}							/* add at V1.2 */
> +		/* Modify eSPI reset pin */
> +		temp =3D ast_mindwm(ast, 0x1E6E2070);			/* add at V1.3 */
> +		if (temp & 0x02000000) {				/* add at V1.3 */
> +			ast_moutdwm(ast, 0x1E6E207C, 0x00004000);	/* add at V1.3 */
> +		}

Do these v1.2 and v1.3 code paths not need a version check in the code?

Best regards
Thomas

>=20
>   		/* Slow down CPU/AHB CLK in VGA only mode */
>   		temp =3D ast_read32(ast, 0x12008);
>   		temp |=3D 0x73;
>   		ast_write32(ast, 0x12008, temp);
>=20
> -		/* Reset USB port to patch USB unknown device issue */
> -		ast_moutdwm(ast, 0x1e6e2090, 0x20000000);
> -		temp  =3D ast_mindwm(ast, 0x1e6e2094);
> -		temp |=3D 0x00004000;
> -		ast_moutdwm(ast, 0x1e6e2094, temp);
> -		temp  =3D ast_mindwm(ast, 0x1e6e2070);
> -		if (temp & 0x00800000) {
> -			ast_moutdwm(ast, 0x1e6e207c, 0x00800000);
> -			mdelay(100);
> -			ast_moutdwm(ast, 0x1e6e2070, 0x00800000);
> -		}
> -
>   		if (!ast_dram_init_2500(ast))
>   			drm_err(dev, "DRAM init failed !\n");
>=20
> --
> 2.18.4
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--LBj3fJpi9mJIbX0X9L5LAn7kJSJPvNGKq--

--VTXPfHnMJUypUAkRAZXoX0g4VffYM8VYU
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/8AdUFAwAAAAAACgkQlh/E3EQov+AZ
4g/9FKX4seEh3hmrKcOrt+iTyFpS01EDqbPoBrb7Jyuu5DPaKQtifWvalE58fA2OrUOMxLQNOlhM
sjCd6NIbgPX5IU01vuOZuQ4nq0t9L0ZdBWtskFdF+ZJqnhP9kLuZ1kl1DcS5CzptAScQMY+cENxT
XAfvze+o/5QXyq9u5E3VdkdsY2TQMdrO259C4tAWwyFLl+Ks6k5JAIvrLg9tAlp1BmZWif90evAF
ikQ/7LHF3VHQFaoAOhuL1XkjolZu3SIIFDRfsMCLtk1Zuw8WSoAsO+OpMWdaQIQ7dxjvPTzqUTcM
xjDtTODQKs83E2X1PrEhO6w7jUIWHHyEXWGjcWUgsCL/UbxlwyVxAufzl1zvWVADGSudPcEPQhso
BGqN9tHoyp0QyPR/3wuIryXjwWCSeWAzSx9FZxRM9jIpJgduq9FVLbgxgaHnI9g536XLG/lA7Tq3
5+iZZ3bYTFoyNNhI8Bdki99PEkHiXazg1VuXHA3TSGBLKWsYotpSYiqRIwRyw/AxbYi0jXEgG9iT
tRsO7Exb9uehgTX15Hei5UNizOuOtAEED7BTiM+K+lHAfKw9FFyrOsFjddT9wNfUJv62Dc7R4ptD
CBhVN4o4xGVDB5HQrLapx0gqVJVHCSccZ39J6qpLKFW3D9cMxLQqK/wIp1dDsj6RPjGwVkTK1LOI
iB4=
=xgqy
-----END PGP SIGNATURE-----

--VTXPfHnMJUypUAkRAZXoX0g4VffYM8VYU--

--===============0600129337==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0600129337==--
