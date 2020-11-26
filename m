Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE9B2C5434
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 13:51:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EAB96E925;
	Thu, 26 Nov 2020 12:51:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 823376E925
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 12:51:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1E6AAAD21;
 Thu, 26 Nov 2020 12:51:16 +0000 (UTC)
To: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20201125090903.4436-1-kuohsiang_chou@aspeedtech.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/ast: Fixed CVE for DP501
Message-ID: <4d9d5c42-842b-1152-1b81-da634fe4f124@suse.de>
Date: Thu, 26 Nov 2020 13:51:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201125090903.4436-1-kuohsiang_chou@aspeedtech.com>
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
Content-Type: multipart/mixed; boundary="===============0719718935=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0719718935==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="esmsYFNQq4Xi6if2dcfeahjoc94Z1TFtn"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--esmsYFNQq4Xi6if2dcfeahjoc94Z1TFtn
Content-Type: multipart/mixed; boundary="zKbi531oV0Rblz1bLv8dyDgFcyRVEa7rx";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: airlied@linux.ie, tommy_huang@aspeedtech.com, jenmin_yuan@aspeedtech.com,
 airlied@redhat.com, arc_sung@aspeedtech.com
Message-ID: <4d9d5c42-842b-1152-1b81-da634fe4f124@suse.de>
Subject: Re: [PATCH] drm/ast: Fixed CVE for DP501
References: <20201125090903.4436-1-kuohsiang_chou@aspeedtech.com>
In-Reply-To: <20201125090903.4436-1-kuohsiang_chou@aspeedtech.com>

--zKbi531oV0Rblz1bLv8dyDgFcyRVEa7rx
Content-Type: multipart/mixed;
 boundary="------------4FAE2011DCC64905125D52DC"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------4FAE2011DCC64905125D52DC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi,

please see below for a review.

Am 25.11.20 um 10:09 schrieb KuoHsiang Chou:
> [Bug][DP501]
> 1. For security concerning, P2A have to be disabled by CVE regulation.
> 2. FrameBuffer reverses last 2MB used for the image of DP501
> 3. If P2A is disallowed, the default "ioremap()" behavior is non-cached=

>     and could be an alternative accessing on the image of DP501.

Please provide a more verbose description of the change. Which problem=20
does this patch solve?

> ---
>   drivers/gpu/drm/ast/ast_dp501.c | 131 +++++++++++++++++++++++--------=
-
>   drivers/gpu/drm/ast/ast_drv.h   |   2 +
>   drivers/gpu/drm/ast/ast_main.c  |  12 +++
>   drivers/gpu/drm/ast/ast_mm.c    |   1 +
>   4 files changed, 110 insertions(+), 36 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/ast/ast_dp501.c b/drivers/gpu/drm/ast/ast_=
dp501.c
> index 88121c0e0d05..7640364ef2bc 100644
> --- a/drivers/gpu/drm/ast/ast_dp501.c
> +++ b/drivers/gpu/drm/ast/ast_dp501.c
> @@ -189,6 +189,8 @@ bool ast_backup_fw(struct drm_device *dev, u8 *addr=
, u32 size)
>   	u32 i, data;
>   	u32 boot_address;
>=20
> +	if (ast->config_mode !=3D ast_use_p2a) return false;
> +
=09
The coding style is incorrect. 'Return false' needs to be on the next=20
line, indented by an additional tab. Here and in other place.


>   	data =3D ast_mindwm(ast, 0x1e6e2100) & 0x01;
>   	if (data) {
>   		boot_address =3D get_fw_base(ast);
> @@ -207,6 +209,8 @@ static bool ast_launch_m68k(struct drm_device *dev)=

>   	u8 *fw_addr =3D NULL;
>   	u8 jreg;
>=20
> +	if (ast->config_mode !=3D ast_use_p2a) return false;
> +

Coding style.

>   	data =3D ast_mindwm(ast, 0x1e6e2100) & 0x01;
>   	if (!data) {
>=20
> @@ -272,24 +276,51 @@ u8 ast_get_dp501_max_clk(struct drm_device *dev)
>   	u32 boot_address, offset, data;
>   	u8 linkcap[4], linkrate, linklanes, maxclk =3D 0xff;
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
> +		offset =3D 0xf000;
> +		data =3D ast_mindwm(ast, boot_address + offset);
> +		if ((data & 0xf0) !=3D 0x10) /* version: 1x */
> +			return maxclk;

Please give these constants some meaningful names. I suggest something li=
ke

#define AST_DP501_FW_VERSION_MASK	GENMASK(7, 4)
#define AST_DP501_FW_VERSION_1		BIT(4)

There are already a few constants in ast_drv.h. I'd put them there as=20
well. It's better than a comment.

> +
> +		/* Read Link Capability */
> +		offset  =3D 0xf014;

Please give the offset a meaningful name.


> +		*(u32 *)linkcap =3D ast_mindwm(ast, boot_address + offset);

The cast shoudl go to the right-hand side of the assignment.

> +		if (linkcap[2] =3D=3D 0) {
> +			linkrate =3D linkcap[0];
> +			linklanes =3D linkcap[1];
> +			data =3D (linkrate =3D=3D 0x0a) ? (90 * linklanes) : (54 * linklane=
s);
> +			if (data > 0xff)
> +				data =3D 0xff;
> +			maxclk =3D (u8)data;
> +		}
> +	}
> +	else {

else goes on the same line as }

> +		if (!ast->reservedbuffer) return 65;	/* 1024x768 as default */

Coding style. Please give a meaningful name to 65.

> +
> +		/* dummy read */
> +		offset =3D 0x0000;
> +		data =3D *(u32 *) (ast->reservedbuffer + offset);

Why is this required?

reservedbuffer is I/O memory accessed in 32-bit chunks. You should use=20
readl and writel to access its content.

> +
> +			/* validate FW version */
> +			offset =3D 0xf000;

The indention is off.

> +		data =3D *(u32 *) (ast->reservedbuffer + offset);
> +			if ((data & 0xf0) !=3D 0x10) /* version: 1x */
> +				return maxclk;

Indention.

> +
> +		/* Read Link Capability */
> +		offset  =3D 0xf014;
> +		*(u32 *)linkcap =3D *(u32 *) (ast->reservedbuffer + offset);
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
> @@ -299,25 +330,53 @@ bool ast_dp501_read_edid(struct drm_device *dev, =
u8 *ediddata)
>   	struct ast_private *ast =3D to_ast_private(dev);
>   	u32 i, boot_address, offset, data;
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
> +		offset =3D 0xf000;
> +		data =3D ast_mindwm(ast, boot_address + offset);
> +		if ((data & 0xf0) !=3D 0x10)
> +			return false;
> +
> +		/* validate PnP Monitor */
> +		offset =3D 0xf010;

Please name the constant.

> +		data =3D ast_mindwm(ast, boot_address + offset);
> +		if (!(data & 0x01))

Please name the constant.

> +			return false;
> +
> +		/* Read EDID */
> +		offset =3D 0xf020;
> +		for (i =3D 0; i < 128; i +=3D 4) {
> +			data =3D ast_mindwm(ast, boot_address + offset + i);
> +			*(u32 *)(ediddata + i) =3D data;

writel for I/O access

> +		}
> +	}
> +	else {

else on wrong line

> +		if (!ast->reservedbuffer) return false;
> +
> +		/* dummy read */
> +		offset =3D 0x0000;
> +		data =3D *(u32 *) (ast->reservedbuffer + offset);
> +
> +		/* validate FW version */
> +		offset =3D 0xf000;
> +		data =3D *(u32 *) (ast->reservedbuffer + offset);
> +		if ((data & 0xf0) !=3D 0x10)
> +			return false;
> +
> +		/* validate PnP Monitor */
> +		offset =3D 0xf010;
> +		data =3D *(u32 *) (ast->reservedbuffer + offset);
> +		if (!(data & 0x01))
> +			return false;
> +
> +		/* Read EDID */
> +		offset =3D 0xf020;
> +		for (i =3D 0; i < 128; i+=3D4) {
> +			data =3D *(u32 *) (ast->reservedbuffer + offset + i);
> +			*(u32 *)(ediddata + i) =3D data;
> +		}
>   	}
>=20
>   	return true;
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_dr=
v.h
> index 6b9e3b94a712..cd17e0683fd7 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -121,12 +121,14 @@ struct ast_private {
>=20
>   	void __iomem *regs;
>   	void __iomem *ioregs;
> +	void __iomem *reservedbuffer;

reservedbuffer has no meaning. As it stores the DP501's firmware, I'd=20
call it dp501_fw.

>=20
>   	enum ast_chip chip;
>   	bool vga2_clone;
>   	uint32_t dram_bus_width;
>   	uint32_t dram_type;
>   	uint32_t mclk;
> +	uint32_t vram_size;
>=20
>   	int fb_mtrr;
>=20
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_m=
ain.c
> index 4ec6884f6c65..4477b4cf1b06 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -393,6 +393,7 @@ static void ast_device_release(void *data)
>=20
>   	/* enable standard VGA decode */
>   	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa1, 0x04);
> +	pci_iounmap(ast->base.pdev, ast->reservedbuffer);
>   }
>=20
>   struct ast_private *ast_device_create(struct drm_driver *drv,
> @@ -449,6 +450,17 @@ struct ast_private *ast_device_create(struct drm_d=
river *drv,
>   	if (ret)
>   		return ERR_PTR(ret);
>=20
> +	/* map reserved buffer */
> +	ast->reservedbuffer =3D NULL;
> +	if (ast->vram_size < pci_resource_len(dev->pdev, 0)) {
> +		ast->reservedbuffer =3D ioremap( \
> +			pci_resource_start(ast->base.pdev, 0) + (unsigned long)ast->vram_si=
ze, \
> +			pci_resource_len(dev->pdev, 0) - ast->vram_size);

Use pci_iomap_range() instead. The function's offset parameter is=20
vram_size, the function's maxlen parameter is 0.

You also won't need pci_iounmap(). pci_iomap_range() sets up the cleanup =

for you.

> +		if (!ast->reservedbuffer) {

No braces around single-line branch.

> +			DRM_INFO("failed to map reserved buffer! \n");

Use drm_info() instead

> +		}
> +	}
> +
>   	ret =3D ast_mode_config_init(ast);
>   	if (ret)
>   		return ERR_PTR(ret);
> diff --git a/drivers/gpu/drm/ast/ast_mm.c b/drivers/gpu/drm/ast/ast_mm.=
c
> index 8392ebde504b..c6fd24493fb3 100644
> --- a/drivers/gpu/drm/ast/ast_mm.c
> +++ b/drivers/gpu/drm/ast/ast_mm.c
> @@ -90,6 +90,7 @@ int ast_mm_init(struct ast_private *ast)
>   	int ret;
>=20
>   	vram_size =3D ast_get_vram_size(ast);
> +	ast->vram_size =3D (uint32_t) vram_size;

You don't need to store vram_size. Look at dev->vram_mm->vram_size instea=
d.

>=20
>   	ret =3D drmm_vram_helper_init(dev, pci_resource_start(dev->pdev, 0),=

>   				    vram_size);
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

--------------4FAE2011DCC64905125D52DC
Content-Type: application/pgp-keys;
 name="OpenPGP_0x680DC11D530B7A23.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="OpenPGP_0x680DC11D530B7A23.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdgX=
H47
fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0BeB5B=
bqP
5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4YchdHm3bkPj=
z9E
ErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB9GluwvIhSezPg=
nEm
imZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEBAAHNKFRob21hcyBaa=
W1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmNvbT7CwI4EEwEIADgCGwMFCwkIBwIGFQoJCAsCB=
BYC
AwECHgECF4AWIQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCXvxIWAAKCRBoDcEdUwt6I+aZB/9ih=
Onf
G4Lgf1L87cvoXh95/bnaJ6aQhP6/ZeRleuCXflnyDajlm3c9loQr0r2bQUi7JeYwUKbBab2QS=
GJm
DMRGlLMnmzWB8mHmZ6bHAu+2Sth8SraE42p6BB9d8dlYEID+dl/D/xUBeulfkck5rloGtYqDi=
+1Q
DfkEZJaxVSZ6FFkXuQi/G9qcI4iklN2nv02iQ7mZe8WYAysix6s/6vIobhirEBreclSNxXqis=
p8n
91+v855JC11EgRdUXMRK81IAaCKXP8zLx3ixku7mvP9Om61yerHSbeU2HZbIggZYQlFh6llJm=
zF1
CjCWgPTJyk4t4kMTcNOw5ykD47vU/KW+wl0EEBECAB0WIQQn6OOmnzvP/7ktjmoud6EwEfXTw=
gUC
WzodVwAKCRAud6EwEfXTwidvAKDkOADDHfI0QNXqAZcg6i1kOndAYACeLXHBwpjnumkPSyoab=
IiL
+he8r3zCwHMEEAEIAB0WIQQeXZghmQijlU7YzFiqUDvJrg9HpwUCWznxsQAKCRCqUDvJrg9Hp=
42f
CADIvsZcAd04PDFclRltHr2huy6s7+ZZA6PgYlMblEBh4bJA+dNPBTvzpJ7FJv/bmHOa+phWy=
Urj
EpfFGuOKGuWAfzgVAEu52fMrW3/mm+O26z1AKIu8hiZ/x9OAe4AM71ZO2lZrV1/53ZdzWnRuO=
45N
GQcotU8oeVfT9okAfmozmWMmIMq7Q0K6bV8W3qiD5XfDNxjr2caxc/9WX1bZPUo3n0H23MNaA=
Tpy
Oz732UtDh6sKUAB1RfzBBd/REbjHD7+quwJGAdRScyDRncX1vNb2+wihy0ipA69XY3bkhR5iD=
u5r
A9enuiMe6J1IBMI1PZh+vOufB/M6cd2D9RULIJaJwsBzBBABCAAdFiEEuyNtt7Ge78bIRx1op=
/N8
GYw5MYEFAls6MrsACgkQp/N8GYw5MYEnLQf/dwqlDJVQL2q+i8FFaqTMAm0n9jLRV6pN8JxFH=
j0g
voyWUOnQuNdAFgtKd26ZhN8NkLoSMO8E19eBPfLoBIFK5yNNVmRHAZm07MzGbA0uNWINJhmdR=
bZM
RMh0nneXjcEU/IvUmd8TPFTAd24X2mbzHgcaHMLJSVx1ohd4alRJXHIqDobKmiVwekyPnInJn=
zWw
iuZUkIotTkQple1PT/dF3S+KtPXBL6ldQ4NkAeCjsz4wnzSa9+VKOxEhiHM0PMzXSbkCMP+4m=
Xy9
RMplBw9Dm9hN2PSouBPifIrSodiiSWZYXOEkzLiBAB0frCKR63Dnx9kvjCD9Pz5wLd/70rjqI=
cLA
jgQTAQgAOAIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC=
3oj
BQJftODHAAoJEGgNwR1TC3ojZSIIAIV3makffp4P4leU8JSLt0aTNewsOhy7VQzKUtlCw3PKD=
3l/
SuymZhQKgH+n6sijzFauZnZ+x0T+Oy+dDVZb3sNJuuMUDIHw18EO9daZBMcueaS54FGe73lAp=
HUl
7nxyocCxoqIG8+fP+75itV/ls2TSh5rJvjLvHC8J3NqfGlJ/jlSKrQUnzFbXfE5KGWiKNAn+I=
1a2
EE0I7uLpYgkdb8hcjtV9Rxr2ja+GWOaSoqB29P5GUzipkWo4144Q16JBO6QP2R9y/1ZK9VqH2=
5T8
lTKocLAaHCEdpDqY5KI15as9tIxlI1Vh+eqhTh/gwEm1ykO1gmrQ1zvGLDMB1EE6El3NJ1Rob=
21h
cyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIbAwULCQgHAgYVC=
gkI
CwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJe/EheAAoJEGgNwR1TC3ojq=
RgI
AIoegtTp1prPzfHgTAuEPd8v58ssHubwi9tg69a8IJ+iMNozhs4iUou84WOLBJNjSieXHZRa8=
fJj
//2/sTuABn38AQ9FcKX9/B49hrdCo6c0WHHKqlPrSTzuXNKYyOdmSFd/pDhBb2Bn5DTxxH5RP=
m/N
U/C9nUlwi7Y+FgBlDNa5h592wmJfv0cJAfvF56C+QL65jHFOFIW9xSaTOAxxMXHGJHXki6Iwa=
aTg
s7QQlKQcd5XvvED1bwLyQ7rq+MEZo5N7IygpQMM3qqGMlCnDdyQ3W95rd0HCWpfa0oVRCOwdu=
SL3
5hG7ONqBpvBj8z5GjSbt4HLJGvpeT0k37qzRExrCXQQQEQIAHRYhBCfo46afO8//uS2Oai53o=
TAR
9dPCBQJbOh1XAAoJEC53oTAR9dPC05AAoIy0HQ2DBDYugQ42P4HfyxfZTIvKAJ0fqNBcBFW9S=
tbR
DEP9cfpNVOv8YMLAcwQQAQgAHRYhBB5dmCGZCKOVTtjMWKpQO8muD0enBQJbOfGzAAoJEKpQO=
8mu
D0enL0wIAM2NTeUDCofBAkbWHGTZopclefbh0xGPYQEfttNyalp0hn1CrVO7OsX5eTjRqgyOa=
1C5
OAsNghCM4PUmrfv5cZ9+sNn9bRM50uVW9IFRlq8wwBY4+7QejJ5gs7DW/0tZIMZ6iTGKK0WEO=
7gd
2K9hXadPBScTdIqXeWH82meiqElnEQL+K9UeGUBrku+1EQIOxwziKwTDlTvhyJ+xmEKj0uWRc=
Ocl
27xLS9XOWPGXcNQBtlZhF8e/E1kFRt5CPP5UBdUCN8qydUadseXivSNDiYob9dyJSFt7G0Bq4=
/ac
Ret5ANtGRWsp8xYJQRossRMWL0w9P8SiIc2IY/JrQrpz29nCwHMEEAEIAB0WIQS7I223sZ7vx=
shH
HWin83wZjDkxgQUCWzoywAAKCRCn83wZjDkxgQaDCACyFuBLQWNvLT8GTDqTf/gETzmtoEM6Y=
r8O
4jbYg05xiFzAqMZctQsm3zHakx2JrimxDvQJRQJQzp5ICJ7J/BOuSL4FE1SPeQIfjm4jyBZGH=
P/W
vgHsT5e3+ZCPePPZO+3irarTKVhaaP70Tpka6EsOCZzO6L8D6tUDkhxMX0ymy7p8w9Yt1eD0o=
Ume
mxrKdS1ulpNJUTBw7gJN8bMowVnycEm6wntxOjrCxuwbkKhFLdn0ejcXQ0UkfbUFKfU64gGBu=
S53
ZlM8XlOhQEIw/FrdXszhR+Tg3Ag130cmJhOrghgOBLzvJfUd6OvDT5VIz0QGbAm8SWlAIIms1=
9Z8
kBsLwsCOBBMBCAA4AhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEEchf7rIzpz2NEoWjla=
A3B
HVMLeiMFAl+04McACgkQaA3BHVMLeiPHXAf/SEoZa6CKoOAs1ctEP/hN8cEQqbEiuZ+71nm3u=
/BQ
p/CEUvqGq+iVc8kkpClDbPz5fa9mb+yWwufsnXKOs6ygmEoAEOL7dBZZIaRobBEkB09VXIkx8=
lE0
00grBVtToHUGRfZcMoMZ98XhPGU6lJDN200j/2CV46hQDz6PLySecNjOME05mosbYW5N2JwFd=
uXP
Qx++DjWB32QLBhcOcP3WslTy3PKVe/TcTvk0JpPFMz4UFc+awBVhDgZiGGAW3xLZRYyhpoAEs=
N7u
XkV2ct0MRxuZ3y4tTYJobhbZwutRojiPPZduRw9CSpNDcQHruFiSOIQTpnLeCA6K2JAZyqmP/=
8LA
lAQTAQgAPhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKC=
QgL
AgQWAgMBAh4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLC=
dg6
2AmRirxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6=
PXo
clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7m=
neM
C5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6iKupZs=
tMx
stPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8osBv6pnSn7e=
ArO
wE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYbT6XMr=
yR9
hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU63Y0xnQN29=
UGD
bYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWWGKdDegUR5BkDf=
Dg5
O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lvhFXodNFMAgTLJlLuD=
YOG
LK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsAEQEAAcLAfAQYAQgAJhYhB=
HIX
+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkDwmcAAAoJEGgNwR1TC3ojpfcIAInwP5Olc=
EKo
kTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1C=
paD
o4J+0fkrHuyNacnT206CeJV1E7NYntxUn+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4A=
M4G
ZMWX1lg0+eHbd5oL1as28WvvI/uIaMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suS=
KHA
MtbE4jKJ8ZHFOo3GhLgjVrBWHE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8Ct=
irP
dPWu/VXNRYAl/lat7lSI3H26qrHCwHYEGAEIACACGwwWIQRyF/usjOnPY0ShaOVoDcEdUwt6I=
wUC
X7Th+gAKCRBoDcEdUwt6I1UpCAC6QD5CCT0KFET29VVo4d+JdB5YJZmB72bMyVk12MGrx0fPp=
OgW
muh+7n1zULU4UciMSa0C1uq1eZZu044X3xIcVQp9+/nINM2d4+8yLEktK8f2jMIulYRSQOYX5=
909
E7a4oyj+AEgEDvcQ9WZPf+tSVpPDsrLiIezF5JdH8W0SlhPd13kAYSCR0H53PmAS6a3Z8UeOO=
kof
Fp/9g2GvHGr7ln9s6wenGbq7NOPMXtFG0luQDkqOFfTNI82COJ2ak5j8WMl25t9Cr5s9K2FUW=
orW
CeJMmGDIblC76yQzI2Ub2jXudrZCgLzHr3Bnbd/B+CklVwMpaskDluc7z3OP7KvXzsFNBF+04=
RMB
EADSYkyG/50PjD4CAbEnwQYZl61RVMBb3jug1j2dDPmOcQSYbw7pKLLLUoHCwnZXeEhRdiZ5w=
qMo
fW6DNo9irHecDc0815aN5RMxUQIqX7W6L4lI2qdKsaEcMtYQVdxbdf1cjcMGGO6oxlQE0FO3C=
E/8
y4G/kndDT0APK9jb6SatTJyPJxXwNmR+HYrkbWr4RAVM6et0pQmMZ8sak+QEM0kBlKbI0sodQ=
OXs
7Y9acMYJ5F+xfWU9JVAaOs2TOmQavDZMr6MeOpe/UKFjAZvcvv5yF8v7l3U+kWrpj4wc1bbRp=
pDp
5k5RlCckAJ3QBNW6Im/YlgieJCK9ns0So1yVxrmjNZu4Un3UGFnndI+dvp1vahkjTZNRo2FzP=
GUl
k2oF+juZn26c0YAQSv16BPTVkTQGuFfrVF+P76qg5dJvjuBdhmLOhLu1i63nUYMIw7jBf1Qir=
0H6
98oyLfdGYtdHB0MN5IXSVpkgymIHp6b7H36OMeem4onzoeiMUv8IX+fwQMeJ8fBsl+yTtA1J1=
Lon
gjXxBkbvEG2AUjpDv73ZuMcu0WcHc5ajfM4wixTght+OgZ7Md5LtpTbV+qmaGo5nw+KDujdF3=
bNq
RMI7nwnyVvbAi3QZqiw+Tr7EZY8r+77ecNvF0hdbcoUGsSLPvLBSbcHwpYnbn36uehXBaxFws=
bC0
KwARAQABwsKsBBgBCAAgFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl+04RMCGwICQAkQaA3BH=
VML
eiPBdCAEGQEIAB0WIQTGd2b9+m4xR3BgUWiWH8TcRCi/4AUCX7ThEwAKCRCWH8TcRCi/4JMoE=
AC0
B6V5uOWXzAg8e7v3e60R/0exHxFeTgKEvfNSJM204K2/c+mGH4UKh/kdiJoKF/y6Lu80o8ndt=
vyG
mQJ0yhypFyBSDNbgdeOHagIt7VvwXovwknYg+w2NavdhG5envhqX902XQE0mNNH1XizDRZ422=
8wl
V/fixCmAETZu5GKIFSTHOQrlZlwZ/RRRd3IqEb6bmpbPJZbBXOFolASXw3zs41xMar9zjLSY9=
LKp
SrF3Zy5F27QJhLxWsalLjtWcEwkxn5a5/4OAvAoNIn5NMGRoBmEYp3ZCRNbzkGT2gyOxrTcSf=
g7M
eHy//LX+1rpN02erf6HyoY6vLFFQlYZ5cnf97o67g7vz4cMGAbB4zZ/j5h3ggkSbjlsCmqXX4=
x/Z
7bB1078lwQdg9x+zo+0vxzk10TU1FoWsSAiravlw0riSjr+wjXr5IzBeMm0A7K1MZ2lne+mKj=
T72
bz2KE6isyrpIn4xlzLMQuh1OCthrHKb6GiJO4JWg/jWIt3yBov4EdFDXOnJl7Tq2CkpwrDTsH=
Dgi
Sw4xK+mHW3QFztsMQi6p7qaPCUSYAPIY4xzOTqExhMj/3Pgyg6hTvdGIpV9VzfMXIR68Pmw79=
BGZ
tEWaVXS+1ja+6kBOFIQ37sqOBorOGfp6c6Di+IN8mkEHyt9s2Q/YqpPdedm+58tinuaBSBeUk=
mhM
B/9rSzQXr84M1rhAehbaqDE+UYw8sfsQXiJkZYZz9BHp0YfhD9J5iwgGhYj+LU6dW1+eEsgcq=
fMH
Dexdvr9koHXeuMNaXa40++GX9cY9DU8RHbeYxGj35eVY793F4gfAAsD5DCF5pCcd7mhicp5eD=
rIq
258874hM7w1aSwMS+0K+oppSlIfdogKM/l8RA6oDGZySTkwxXQ8RAYb/ddVc5Ua2gzXccODBz=
JuT
a+aY+BxmIdz4oMzaNCiK3gedGKoRjnrGguEO+YL/Ji3NhHOXRKu/QVTFDmgpmA0oQTfY+iaLz=
bFk
keWD97V4vo2flZ8ii37fcKNX4daGGnRRFUh4BrBG
=3DskgE
-----END PGP PUBLIC KEY BLOCK-----

--------------4FAE2011DCC64905125D52DC--

--zKbi531oV0Rblz1bLv8dyDgFcyRVEa7rx--

--esmsYFNQq4Xi6if2dcfeahjoc94Z1TFtn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl+/pMIFAwAAAAAACgkQlh/E3EQov+Cq
sBAAjVI1YbII1Xd4j1jnPCksul6DNIEpSbUFX9HpMq4X7T+YAI9L1ucsGgbqlntkxVz9jUiTIk+5
CarY6Hdpb7jUpEqe08jclgDFBVeeKr+M5hoMrPnn05rmcTF7n6FNt1GpBPWPUeM9RB4K44rYMFwd
QYQ6KXr53ReZMAPnubQnzZToDeT4GKk9JsQItMOuvd3ZUQjS11XWn7jvBQfqAlzH4sfZEJkMCWXM
o08V9lyK/Gui79EvreR4WdE7ueYodRYh06yvOcJDj1hO8W0y80U1sVIJe9vi7+0M2ZFYxo9HKwK7
R0inx8Zp5vs7shPLzjH7zvI7AfDscKtbMNYVkoyH2Cpzmw+Snmsa5yZoLXHizGsrssOpc48aDKV/
MILhcJc+c5crHQ9IIFI1Dv2Y7/lQtE36r3wy1l2jPdNEwmOYWebQcONtkE0bqGRLZtHnWRv5Blgb
GH+VyNjG7rtZOPzqr04DTam8JeWOC6dAVLQbAF7BirojZGvGjebh6O13HM2FKqA95ngZGJ8wjfxf
juTKzuUu8lV/+1ZdLQyDSLEvG7+o3xlweCwqxAnR2RqHnDC3YcRIaNzztxk4RJcfsUdpOJvGB9kq
Ih4O8uKi0FvChJYTkCyIw/jFMPH41CD0HDA1QNgsN2k6fz8dXYlTe5szXphGp9016H7FI4JfWSs5
PDw=
=x4CL
-----END PGP SIGNATURE-----

--esmsYFNQq4Xi6if2dcfeahjoc94Z1TFtn--

--===============0719718935==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0719718935==--
