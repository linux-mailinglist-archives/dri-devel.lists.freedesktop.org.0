Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0E32F9BB6
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 10:05:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDF9389BF4;
	Mon, 18 Jan 2021 09:05:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3D1A89BF4
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 09:05:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 836B9AC6E;
 Mon, 18 Jan 2021 09:05:41 +0000 (UTC)
Subject: Re: [PATCH v2] drm/ast: Disable fast reset after DRAM initial
To: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <88f197b6-4df8-76ca-ec31-7f8f739f161e@suse.de>
 <20210112075811.9354-1-kuohsiang_chou@aspeedtech.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <787f3c79-b6e5-6015-9fb6-feb3d2ae15e0@suse.de>
Date: Mon, 18 Jan 2021 10:05:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210112075811.9354-1-kuohsiang_chou@aspeedtech.com>
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
Content-Type: multipart/mixed; boundary="===============0914707973=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0914707973==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="O9Ue0xAhdbqGZUXsufHAGyPSvZn8O60Qu"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--O9Ue0xAhdbqGZUXsufHAGyPSvZn8O60Qu
Content-Type: multipart/mixed; boundary="kXR6DXVkPIyEon41C4dActgVuQYMitqSM";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: airlied@linux.ie, tommy_huang@aspeedtech.com, jenmin_yuan@aspeedtech.com,
 airlied@redhat.com, arc_sung@aspeedtech.com
Message-ID: <787f3c79-b6e5-6015-9fb6-feb3d2ae15e0@suse.de>
Subject: Re: [PATCH v2] drm/ast: Disable fast reset after DRAM initial
References: <88f197b6-4df8-76ca-ec31-7f8f739f161e@suse.de>
 <20210112075811.9354-1-kuohsiang_chou@aspeedtech.com>
In-Reply-To: <20210112075811.9354-1-kuohsiang_chou@aspeedtech.com>

--kXR6DXVkPIyEon41C4dActgVuQYMitqSM
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 12.01.21 um 08:58 schrieb KuoHsiang Chou:
> [Bug][AST2500]
>=20
> V1:
> When AST2500 acts as stand-alone VGA so that DRAM and DVO initializatio=
n
> have to be achieved by VGA driver with P2A (PCI to AHB) enabling.
> However, HW suggests disable Fast reset mode after DRAM initializaton,
> because fast reset mode is mainly designed for ARM ICE debugger.
> Once Fast reset is checked as enabling, WDT (Watch Dog Timer) should be=

> first enabled to avoid system deadlock before disable fast reset mode.
>=20
> V2:
> Use to_pci_dev() to get revision of PCI configuration.
>=20
> Signed-off-by: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
> ---
>   drivers/gpu/drm/ast/ast_drv.h  |  1 +
>   drivers/gpu/drm/ast/ast_main.c |  5 +++
>   drivers/gpu/drm/ast/ast_post.c | 71 +++++++++++++++++++++------------=
-
>   3 files changed, 51 insertions(+), 26 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_dr=
v.h
> index da6dfb677540..a2cf5fef2399 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -320,6 +320,7 @@ bool ast_is_vga_enabled(struct drm_device *dev);
>   void ast_post_gpu(struct drm_device *dev);
>   u32 ast_mindwm(struct ast_private *ast, u32 r);
>   void ast_moutdwm(struct ast_private *ast, u32 r, u32 v);
> +void ast_patch_ahb_2500(struct ast_private *ast);
>   /* ast dp501 */
>   void ast_set_dp501_video_output(struct drm_device *dev, u8 mode);
>   bool ast_backup_fw(struct drm_device *dev, u8 *addr, u32 size);
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_m=
ain.c
> index 3775fe26f792..0e4dfcc25623 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -69,6 +69,7 @@ static void ast_detect_config_mode(struct drm_device =
*dev, u32 *scu_rev)
>   {
>   	struct device_node *np =3D dev->pdev->dev.of_node;
>   	struct ast_private *ast =3D to_ast_private(dev);
> +	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
>   	uint32_t data, jregd0, jregd1;
>=20
>   	/* Defaults */
> @@ -96,6 +97,10 @@ static void ast_detect_config_mode(struct drm_device=
 *dev, u32 *scu_rev)
>   	jregd0 =3D ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xd0, 0xff)=
;
>   	jregd1 =3D ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xd1, 0xff)=
;
>   	if (!(jregd0 & 0x80) || !(jregd1 & 0x10)) {
> +		/* Patch AST2500 */
> +		if (((pdev->revision & 0xF0) =3D=3D 0x40) && ((jregd0 & 0xC0) =3D=3D=
 0))
> +			ast_patch_ahb_2500(ast);
> +
>   		/* Double check it's actually working */
>   		data =3D ast_read32(ast, 0xf004);
>   		if (data !=3D 0xFFFFFFFF) {
> diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_p=
ost.c
> index 8902c2f84bf9..1f0007daa005 100644
> --- a/drivers/gpu/drm/ast/ast_post.c
> +++ b/drivers/gpu/drm/ast/ast_post.c
> @@ -2026,6 +2026,33 @@ static bool ast_dram_init_2500(struct ast_privat=
e *ast)
>   	return true;
>   }
>=20
> +void ast_patch_ahb_2500(struct ast_private *ast)
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
> +	if (data & 0x08000000) {					/* check fast reset */
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
> +	ast_moutdwm(ast, 0x1e6e207c, 0x08000000);	/* clear fast reset */
> +}
> +
>   void ast_post_chip_2500(struct drm_device *dev)
>   {
>   	struct ast_private *ast =3D to_ast_private(dev);
> @@ -2033,39 +2060,31 @@ void ast_post_chip_2500(struct drm_device *dev)=

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
> +		ast_patch_ahb_2500(ast);
> +
> +		/* Disable watchdog */
> +		ast_moutdwm(ast, 0x1E78502C, 0x00000000);
> +		ast_moutdwm(ast, 0x1E78504C, 0x00000000);
> +		/* Reset USB port */
> +		ast_moutdwm(ast, 0x1E6E2090, 0x20000000);
> +		ast_moutdwm(ast, 0x1E6E2094, 0x00004000);
> +		if (ast_mindwm(ast, 0x1E6E2070) & 0x00800000) {
> +			ast_moutdwm(ast, 0x1E6E207C, 0x00800000);
> +			mdelay(100);
> +			ast_moutdwm(ast, 0x1E6E2070, 0x00800000);
> +		}
> +		/* Modify eSPI reset pin */
> +		temp =3D ast_mindwm(ast, 0x1E6E2070);
> +		if (temp & 0x02000000)
> +			ast_moutdwm(ast, 0x1E6E207C, 0x00004000);

Instead of answering my question, you simply deleted the comments. It=20
doesn't work like that.

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


--kXR6DXVkPIyEon41C4dActgVuQYMitqSM--

--O9Ue0xAhdbqGZUXsufHAGyPSvZn8O60Qu
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAFT2QFAwAAAAAACgkQlh/E3EQov+BE
Yg//Zsf21OOH1g8P1WhXigwyJH6+bXjeKymUjVRiRq6Sn7DxH30cF8a4tZVls/7eWYaB6a9us6di
++TgrIawbyxm4DHPh96n0Qi92zzPUvYFWL1G12znzcW/R1pev13f64oP4c3cD9wIs8YnG1Cad51M
lSubl5e9PMzqmZg8R2WG2ruVJ0X02kEYtfjHmOhQlYtgxdT/Tn2K8l0qcid2rtKMVn1/VAxVOtvK
jZQb+Bw8+LttHO8jTaMyI7VdU4Up8qI6eOhHe//m3DlQ/6rNO5BbT/lT6XKdW7Oiaqng494KWbC7
NdIJMFAJx7O9kiaz96eFq2DgoJkLgmM30wZLI69/NtDhgQWV16tmCcfxwYyvjLTCN+cvCP1T42KE
6UyKV2Fe0eYk3hrxzO7zz/5NZrtzOtIwJ3O5g+YM3RMkX/E6lYz0KBGNJKYWEEw/5BpV8XVZ4CcT
OPftd66y/DHhZeSE+dp4RnsT9d6/PTWhG+onxnTgrknAXYTvuHSB5rgRROgZZkWAEny4RhMG5aQp
JxCXGGV7eLk5jjtyWOpXeDp6SDZeQTcHpc9kgnCGIyLxP5HchmlL8BdUsjnvAHQftEJJ5ZA4nyFU
pBsksWq7WloDYtDGG5TSUHTQvoAD5eyCtj13PPVUq0Ol8PGehBge0Uscs9/fI0SwJldkkNz42UX8
MLE=
=311s
-----END PGP SIGNATURE-----

--O9Ue0xAhdbqGZUXsufHAGyPSvZn8O60Qu--

--===============0914707973==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0914707973==--
