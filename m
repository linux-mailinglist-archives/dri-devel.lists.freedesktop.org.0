Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BC836C48F
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 13:01:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E8B89F6B;
	Tue, 27 Apr 2021 11:01:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E420189F6B
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 11:01:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 67672B16D;
 Tue, 27 Apr 2021 11:01:42 +0000 (UTC)
To: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <214f1451-2406-b298-e233-4939cae9e1f2@suse.de>
 <20210421085859.17761-1-kuohsiang_chou@aspeedtech.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v5] drm/ast: Fixed CVE for DP501
Message-ID: <2662b502-edbe-b79b-b458-dbabafe6ca3c@suse.de>
Date: Tue, 27 Apr 2021 13:01:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210421085859.17761-1-kuohsiang_chou@aspeedtech.com>
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
Cc: airlied@linux.ie, jenmin_yuan@aspeedtech.com, arc_sung@aspeedtech.com,
 airlied@redhat.com
Content-Type: multipart/mixed; boundary="===============0896935475=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0896935475==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="srJtaTwXFNDP0DD96H2XQtdUKY4K48tYC"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--srJtaTwXFNDP0DD96H2XQtdUKY4K48tYC
Content-Type: multipart/mixed; boundary="8qCX6uppK8rnciD4GO6kmb5p7e0PLlmVm";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: airlied@linux.ie, jenmin_yuan@aspeedtech.com, airlied@redhat.com,
 arc_sung@aspeedtech.com
Message-ID: <2662b502-edbe-b79b-b458-dbabafe6ca3c@suse.de>
Subject: Re: [PATCH v5] drm/ast: Fixed CVE for DP501
References: <214f1451-2406-b298-e233-4939cae9e1f2@suse.de>
 <20210421085859.17761-1-kuohsiang_chou@aspeedtech.com>
In-Reply-To: <20210421085859.17761-1-kuohsiang_chou@aspeedtech.com>

--8qCX6uppK8rnciD4GO6kmb5p7e0PLlmVm
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 21.04.21 um 10:58 schrieb KuoHsiang Chou:
> [Bug][DP501]
> If ASPEED P2A (PCI to AHB) bridge is disabled and disallowed for
> CVE_2019_6260 item3, and then the monitor's EDID is unable read through=

> Parade DP501.
> The reason is the DP501's FW is mapped to BMC addressing space rather
> than Host addressing space.
> The resolution is that using "pci_iomap_range()" maps to DP501's FW tha=
t
> stored on the end of FB (Frame Buffer).
> In this case, FrameBuffer reserves the last 2MB used for the image of
> DP501.
>=20

Your patches are missing a short changelog, so that reviewers can see=20
what changed between versions. Anyway, I merged your patch into=20
drm-misc-next now. Thanks for the fix.


More generally speaking, the DP501 code needs a major refactoring. It's=20
currently bolted onto the regular VGA connector code. It should rather=20
be a separate connector or a DRM bridge. I always wanted to work on=20
this, but don't have a device for testing. If I'd provide patches, would =

you be in a position to test them?

Best regards
Thomas


> Signed-off-by: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
> Reported-by: kernel test robot <lkp@intel.com>
> ---
>   drivers/gpu/drm/ast/ast_dp501.c | 139 +++++++++++++++++++++++--------=
-
>   drivers/gpu/drm/ast/ast_drv.h   |  12 +++
>   drivers/gpu/drm/ast/ast_main.c  |  11 ++-
>   3 files changed, 125 insertions(+), 37 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/ast/ast_dp501.c b/drivers/gpu/drm/ast/ast_=
dp501.c
> index 88121c0e0..cd93c44f2 100644
> --- a/drivers/gpu/drm/ast/ast_dp501.c
> +++ b/drivers/gpu/drm/ast/ast_dp501.c
> @@ -189,6 +189,9 @@ bool ast_backup_fw(struct drm_device *dev, u8 *addr=
, u32 size)
>   	u32 i, data;
>   	u32 boot_address;
>=20
> +	if (ast->config_mode !=3D ast_use_p2a)
> +		return false;
> +
>   	data =3D ast_mindwm(ast, 0x1e6e2100) & 0x01;
>   	if (data) {
>   		boot_address =3D get_fw_base(ast);
> @@ -207,6 +210,9 @@ static bool ast_launch_m68k(struct drm_device *dev)=

>   	u8 *fw_addr =3D NULL;
>   	u8 jreg;
>=20
> +	if (ast->config_mode !=3D ast_use_p2a)
> +		return false;
> +
>   	data =3D ast_mindwm(ast, 0x1e6e2100) & 0x01;
>   	if (!data) {
>=20
> @@ -271,25 +277,55 @@ u8 ast_get_dp501_max_clk(struct drm_device *dev)
>   	struct ast_private *ast =3D to_ast_private(dev);
>   	u32 boot_address, offset, data;
>   	u8 linkcap[4], linkrate, linklanes, maxclk =3D 0xff;
> +	u32 *plinkcap;
>=20
> -	boot_address =3D get_fw_base(ast);
> -
> -	/* validate FW version */
> -	offset =3D 0xf000;
> -	data =3D ast_mindwm(ast, boot_address + offset);
> -	if ((data & 0xf0) !=3D 0x10) /* version: 1x */
> -		return maxclk;
> -
> -	/* Read Link Capability */
> -	offset  =3D 0xf014;
> -	*(u32 *)linkcap =3D ast_mindwm(ast, boot_address + offset);
> -	if (linkcap[2] =3D=3D 0) {
> -		linkrate =3D linkcap[0];
> -		linklanes =3D linkcap[1];
> -		data =3D (linkrate =3D=3D 0x0a) ? (90 * linklanes) : (54 * linklanes=
);
> -		if (data > 0xff)
> -			data =3D 0xff;
> -		maxclk =3D (u8)data;
> +	if (ast->config_mode =3D=3D ast_use_p2a) {
> +		boot_address =3D get_fw_base(ast);
> +
> +		/* validate FW version */
> +		offset =3D AST_DP501_GBL_VERSION;
> +		data =3D ast_mindwm(ast, boot_address + offset);
> +		if ((data & AST_DP501_FW_VERSION_MASK) !=3D AST_DP501_FW_VERSION_1) =
/* version: 1x */
> +			return maxclk;
> +
> +		/* Read Link Capability */
> +		offset  =3D AST_DP501_LINKRATE;
> +		plinkcap =3D (u32 *)linkcap;
> +		*plinkcap  =3D ast_mindwm(ast, boot_address + offset);
> +		if (linkcap[2] =3D=3D 0) {
> +			linkrate =3D linkcap[0];
> +			linklanes =3D linkcap[1];
> +			data =3D (linkrate =3D=3D 0x0a) ? (90 * linklanes) : (54 * linklane=
s);
> +			if (data > 0xff)
> +				data =3D 0xff;
> +			maxclk =3D (u8)data;
> +		}
> +	} else {
> +		if (!ast->dp501_fw_buf)
> +			return AST_DP501_DEFAULT_DCLK;	/* 1024x768 as default */
> +
> +		/* dummy read */
> +		offset =3D 0x0000;
> +		data =3D readl(ast->dp501_fw_buf + offset);
> +
> +		/* validate FW version */
> +		offset =3D AST_DP501_GBL_VERSION;
> +		data =3D readl(ast->dp501_fw_buf + offset);
> +		if ((data & AST_DP501_FW_VERSION_MASK) !=3D AST_DP501_FW_VERSION_1) =
/* version: 1x */
> +			return maxclk;
> +
> +		/* Read Link Capability */
> +		offset =3D AST_DP501_LINKRATE;
> +		plinkcap =3D (u32 *)linkcap;
> +		*plinkcap =3D readl(ast->dp501_fw_buf + offset);
> +		if (linkcap[2] =3D=3D 0) {
> +			linkrate =3D linkcap[0];
> +			linklanes =3D linkcap[1];
> +			data =3D (linkrate =3D=3D 0x0a) ? (90 * linklanes) : (54 * linklane=
s);
> +			if (data > 0xff)
> +				data =3D 0xff;
> +			maxclk =3D (u8)data;
> +		}
>   	}
>   	return maxclk;
>   }
> @@ -298,26 +334,57 @@ bool ast_dp501_read_edid(struct drm_device *dev, =
u8 *ediddata)
>   {
>   	struct ast_private *ast =3D to_ast_private(dev);
>   	u32 i, boot_address, offset, data;
> +	u32 *pEDIDidx;
>=20
> -	boot_address =3D get_fw_base(ast);
> -
> -	/* validate FW version */
> -	offset =3D 0xf000;
> -	data =3D ast_mindwm(ast, boot_address + offset);
> -	if ((data & 0xf0) !=3D 0x10)
> -		return false;
> -
> -	/* validate PnP Monitor */
> -	offset =3D 0xf010;
> -	data =3D ast_mindwm(ast, boot_address + offset);
> -	if (!(data & 0x01))
> -		return false;
> +	if (ast->config_mode =3D=3D ast_use_p2a) {
> +		boot_address =3D get_fw_base(ast);
>=20
> -	/* Read EDID */
> -	offset =3D 0xf020;
> -	for (i =3D 0; i < 128; i +=3D 4) {
> -		data =3D ast_mindwm(ast, boot_address + offset + i);
> -		*(u32 *)(ediddata + i) =3D data;
> +		/* validate FW version */
> +		offset =3D AST_DP501_GBL_VERSION;
> +		data =3D ast_mindwm(ast, boot_address + offset);
> +		if ((data & AST_DP501_FW_VERSION_MASK) !=3D AST_DP501_FW_VERSION_1)
> +			return false;
> +
> +		/* validate PnP Monitor */
> +		offset =3D AST_DP501_PNPMONITOR;
> +		data =3D ast_mindwm(ast, boot_address + offset);
> +		if (!(data & AST_DP501_PNP_CONNECTED))
> +			return false;
> +
> +		/* Read EDID */
> +		offset =3D AST_DP501_EDID_DATA;
> +		for (i =3D 0; i < 128; i +=3D 4) {
> +			data =3D ast_mindwm(ast, boot_address + offset + i);
> +			pEDIDidx =3D (u32 *)(ediddata + i);
> +			*pEDIDidx =3D data;
> +		}
> +	} else {
> +		if (!ast->dp501_fw_buf)
> +			return false;
> +
> +		/* dummy read */
> +		offset =3D 0x0000;
> +		data =3D readl(ast->dp501_fw_buf + offset);
> +
> +		/* validate FW version */
> +		offset =3D AST_DP501_GBL_VERSION;
> +		data =3D readl(ast->dp501_fw_buf + offset);
> +		if ((data & AST_DP501_FW_VERSION_MASK) !=3D AST_DP501_FW_VERSION_1)
> +			return false;
> +
> +		/* validate PnP Monitor */
> +		offset =3D AST_DP501_PNPMONITOR;
> +		data =3D readl(ast->dp501_fw_buf + offset);
> +		if (!(data & AST_DP501_PNP_CONNECTED))
> +			return false;
> +
> +		/* Read EDID */
> +		offset =3D AST_DP501_EDID_DATA;
> +		for (i =3D 0; i < 128; i +=3D 4) {
> +			data =3D readl(ast->dp501_fw_buf + offset + i);
> +			pEDIDidx =3D (u32 *)(ediddata + i);
> +			*pEDIDidx =3D data;
> +		}
>   	}
>=20
>   	return true;
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_dr=
v.h
> index e82ab8628..911f9f414 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -150,6 +150,7 @@ struct ast_private {
>=20
>   	void __iomem *regs;
>   	void __iomem *ioregs;
> +	void __iomem *dp501_fw_buf;
>=20
>   	enum ast_chip chip;
>   	bool vga2_clone;
> @@ -325,6 +326,17 @@ int ast_mode_config_init(struct ast_private *ast);=

>   #define AST_MM_ALIGN_SHIFT 4
>   #define AST_MM_ALIGN_MASK ((1 << AST_MM_ALIGN_SHIFT) - 1)
>=20
> +#define AST_DP501_FW_VERSION_MASK	GENMASK(7, 4)
> +#define AST_DP501_FW_VERSION_1		BIT(4)
> +#define AST_DP501_PNP_CONNECTED		BIT(1)
> +
> +#define AST_DP501_DEFAULT_DCLK	65
> +
> +#define AST_DP501_GBL_VERSION	0xf000
> +#define AST_DP501_PNPMONITOR	0xf010
> +#define AST_DP501_LINKRATE	0xf014
> +#define AST_DP501_EDID_DATA	0xf020
> +
>   int ast_mm_init(struct ast_private *ast);
>=20
>   /* ast post */
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_m=
ain.c
> index 0ac3c2039..3976a2587 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -99,7 +99,7 @@ static void ast_detect_config_mode(struct drm_device =
*dev, u32 *scu_rev)
>   	if (!(jregd0 & 0x80) || !(jregd1 & 0x10)) {
>   		/* Double check it's actually working */
>   		data =3D ast_read32(ast, 0xf004);
> -		if (data !=3D 0xFFFFFFFF) {
> +		if ((data !=3D 0xFFFFFFFF) && (data !=3D 0x00)) {
>   			/* P2A works, grab silicon revision */
>   			ast->config_mode =3D ast_use_p2a;
>=20
> @@ -411,6 +411,7 @@ struct ast_private *ast_device_create(const struct =
drm_driver *drv,
>   		return ast;
>   	dev =3D &ast->base;
>=20
> +	dev->pdev =3D pdev;
>   	pci_set_drvdata(pdev, dev);
>=20
>   	ast->regs =3D pci_iomap(pdev, 1, 0);
> @@ -450,6 +451,14 @@ struct ast_private *ast_device_create(const struct=20
drm_driver *drv,
>   	if (ret)
>   		return ERR_PTR(ret);
>=20
> +	/* map reserved buffer */
> +	ast->dp501_fw_buf =3D NULL;
> +	if (dev->vram_mm->vram_size < pci_resource_len(dev->pdev, 0)) {
> +		ast->dp501_fw_buf =3D pci_iomap_range(dev->pdev, 0, dev->vram_mm->vr=
am_size, 0);
> +		if (!ast->dp501_fw_buf)
> +			drm_info(dev, "failed to map reserved buffer!\n");
> +	}
> +
>   	ret =3D ast_mode_config_init(ast);
>   	if (ret)
>   		return ERR_PTR(ret);
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


--8qCX6uppK8rnciD4GO6kmb5p7e0PLlmVm--

--srJtaTwXFNDP0DD96H2XQtdUKY4K48tYC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmCH7xUFAwAAAAAACgkQlh/E3EQov+A6
XxAAxxthqqoX6DngW2u2+QEOGJd+xpO9aTH4mCzCKPzEcW1t7PEx441DE7Cq8OB04H+I0o7X5Gar
qSQTdwbkldXSD4QfwL2jhbsLrGaNiAai9UJY+l+vZL0F/H9uUhQmJdVwaUfIBVpIqRwsexNzYDd/
bOdqxAK96C2iIEtHBnccontTabXpktreghbn/1kQV3DiHix36uq7uJ6/HJjolZG08BdCtYP7h9+7
4xYmygf4a0Gvoq6+3VM2yELD/U06CKCg7Ja+xlST58b0kTcCs7pBHfNImq2EHcY+uAb5XLpL/H0G
GvrTesxlHKYVqZl3g5FThNXxTkoyF9SL2SW89bR1jT+2Jlp7nh1wVq6d0OswvQm59oOURR/6n7/h
22ymuYbcETgnpem8YS1Sp7WYmc9hAaQpDJJXIMpu3gBCMlH5KjZIQQBpaSNkfm/kmgaNDxZ8ywId
B67sExT35VtHo/wsdWVJ8IzcRroQgoc/KVbiCvgj2+Y0vQmcpNsgBMpgbQrhVVUqulvj8Acg7g2i
53DwAhgAPZDAuhbFFeK1Gp15VEnSjwwgkf3EmuQBFPx7XYjwtf0x3QrYJQSPghmJyILpEX/TkFjD
VoNw2L0t11XQ9PwdkRJztiYepitQD88U75Qh/UAB7GzB65Yje3exVn3PvGGkrIOfdn2GwvKTrUpV
R3Y=
=KcS8
-----END PGP SIGNATURE-----

--srJtaTwXFNDP0DD96H2XQtdUKY4K48tYC--

--===============0896935475==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0896935475==--
