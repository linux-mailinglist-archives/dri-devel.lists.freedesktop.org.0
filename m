Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D057C3AE960
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 14:46:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A81B8892CD;
	Mon, 21 Jun 2021 12:46:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B070892CD
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 12:46:34 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BB48021A44;
 Mon, 21 Jun 2021 12:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624279592; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5RDhhx3FGTrsxBZykHnck/c0ytxwxiJULPqxF9cqpeU=;
 b=CCwY9agslmwnfogTpVLcsXnJCUfay7qwSAPe9Qf3ysl9uQdUVR8mKTRXgVxLdE3cAyc9eF
 FCLWyO/xQSsOSGfSxKGfTY/nB+9EhPX8U+M+nf/w8rpD8JbDhIGHw1s+fT9Jtuw8h1O8U/
 c8SUb+hBgHRyQoc/J/b9sViG2toloAQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624279592;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5RDhhx3FGTrsxBZykHnck/c0ytxwxiJULPqxF9cqpeU=;
 b=/QSaVh0TkrRIBRLL5mk7KNUiXv0+Sb8dZvA2knm4IiJ/Ek95QvkvuH+nmh0Rldhfl7p4f1
 dhUGnlAZJ6EoBnDg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 923F7118DD;
 Mon, 21 Jun 2021 12:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624279592; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5RDhhx3FGTrsxBZykHnck/c0ytxwxiJULPqxF9cqpeU=;
 b=CCwY9agslmwnfogTpVLcsXnJCUfay7qwSAPe9Qf3ysl9uQdUVR8mKTRXgVxLdE3cAyc9eF
 FCLWyO/xQSsOSGfSxKGfTY/nB+9EhPX8U+M+nf/w8rpD8JbDhIGHw1s+fT9Jtuw8h1O8U/
 c8SUb+hBgHRyQoc/J/b9sViG2toloAQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624279592;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5RDhhx3FGTrsxBZykHnck/c0ytxwxiJULPqxF9cqpeU=;
 b=/QSaVh0TkrRIBRLL5mk7KNUiXv0+Sb8dZvA2knm4IiJ/Ek95QvkvuH+nmh0Rldhfl7p4f1
 dhUGnlAZJ6EoBnDg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id IH/DIiiK0GBEOgAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Mon, 21 Jun 2021 12:46:32 +0000
Subject: Re: [PATCH v4] drm/ast: Disable fast reset after DRAM initial
To: Kuo-Hsiang Chou <kuohsiang_chou@aspeedtech.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <bbe8ccfd-7e73-e1e6-32a5-f08f71c4ed3f@suse.de>
 <20210507092708.39552-1-kuohsiang_chou@aspeedtech.com>
 <HK2PR06MB33004A57DA1F99AC77E8F2CD8C249@HK2PR06MB3300.apcprd06.prod.outlook.com>
 <HK2PR06MB3300CDB7ADFA9108EEAE6FD08C0A9@HK2PR06MB3300.apcprd06.prod.outlook.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <b1ada407-1e2f-a45e-ff38-c81cb3c6f7b5@suse.de>
Date: Mon, 21 Jun 2021 14:46:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <HK2PR06MB3300CDB7ADFA9108EEAE6FD08C0A9@HK2PR06MB3300.apcprd06.prod.outlook.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="XMAX8gAkte6nQCysfHLccxVHseKqp4IYc"
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "airlied@redhat.com" <airlied@redhat.com>,
 Jenmin Yuan <jenmin_yuan@aspeedtech.com>, Arc Sung <arc_sung@aspeedtech.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--XMAX8gAkte6nQCysfHLccxVHseKqp4IYc
Content-Type: multipart/mixed; boundary="rIBC9lwCSpiEEthpgzmLANqXVub6xTGJp";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Kuo-Hsiang Chou <kuohsiang_chou@aspeedtech.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "airlied@redhat.com" <airlied@redhat.com>,
 Jenmin Yuan <jenmin_yuan@aspeedtech.com>, Arc Sung <arc_sung@aspeedtech.com>
Message-ID: <b1ada407-1e2f-a45e-ff38-c81cb3c6f7b5@suse.de>
Subject: Re: [PATCH v4] drm/ast: Disable fast reset after DRAM initial
References: <bbe8ccfd-7e73-e1e6-32a5-f08f71c4ed3f@suse.de>
 <20210507092708.39552-1-kuohsiang_chou@aspeedtech.com>
 <HK2PR06MB33004A57DA1F99AC77E8F2CD8C249@HK2PR06MB3300.apcprd06.prod.outlook.com>
 <HK2PR06MB3300CDB7ADFA9108EEAE6FD08C0A9@HK2PR06MB3300.apcprd06.prod.outlook.com>
In-Reply-To: <HK2PR06MB3300CDB7ADFA9108EEAE6FD08C0A9@HK2PR06MB3300.apcprd06.prod.outlook.com>

--rIBC9lwCSpiEEthpgzmLANqXVub6xTGJp
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 21.06.21 um 13:06 schrieb Kuo-Hsiang Chou:
> Hi Thomas,
>=20
> May I know if I need to port this patch to the latest drm-misc-next aga=
in, because the patch has send to review for a while.
> If the porting or any other thing can reduce your review effort, please=
 instruct me. Thanks!

I'm sorry for not replying to you. I've been away for a while and had=20
limited time. I only returned to work today and will look at the patch so=
on.

Best regards
Thomas

>=20
> Best Regards,
> 	Kuo-Hsiang Chou
>=20
> -----Original Message-----
> From: dri-devel [mailto:dri-devel-bounces@lists.freedesktop.org] On Beh=
alf Of Kuo-Hsiang Chou
> Sent: Wednesday, May 26, 2021 6:24 PM
> To: tzimmermann@suse.de; dri-devel@lists.freedesktop.org; linux-kernel@=
vger.kernel.org
> Subject: RE: [PATCH v4] drm/ast: Disable fast reset after DRAM initial
>=20
>=20
>=20
> -----Original Message-----
> From: Kuo-Hsiang Chou
> Sent: Friday, May 07, 2021 5:27 PM
> To: tzimmermann@suse.de; dri-devel@lists.freedesktop.org; linux-kernel@=
vger.kernel.org
> Cc: airlied@redhat.com; airlied@linux.ie; daniel@ffwll.ch; Jenmin Yuan =
<jenmin_yuan@aspeedtech.com>; Kuo-Hsiang Chou <kuohsiang_chou@aspeedtech.=
com>; Arc Sung <arc_sung@aspeedtech.com>
> Subject: [PATCH v4] drm/ast: Disable fast reset after DRAM initial
>=20
> Hi Thomas,
>=20
> May I know if this patch has sth wrong. Or something I need to improve =
on it, I can fix it right now. Thanks!
>=20
> Regards,
> 	Kuo-Hsiang Chou
>=20
> [Bug][AST2500]
>=20
> V1:
> When AST2500 acts as stand-alone VGA so that DRAM and DVO initializatio=
n have to be achieved by VGA driver with P2A (PCI to AHB) enabling.
> However, HW suggests disable Fast reset mode after DRAM initializaton, =
because fast reset mode is mainly designed for ARM ICE debugger.
> Once Fast reset is checked as enabling, WDT (Watch Dog Timer) should be=
 first enabled to avoid system deadlock before disable fast reset mode.
>=20
> V2:
> Use to_pci_dev() to get revision of PCI configuration.
>=20
> V3:
> If SCU00 is not unlocked, just enter its password again.
> It is unnecessary to clear AHB lock condition and restore WDT default s=
etting again, before Fast-reset clearing.
>=20
> V4:
> repatch after "error : could not build fake ancestor" resolved.
>=20
> Signed-off-by: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
> ---
>   drivers/gpu/drm/ast/ast_drv.h  |  1 +
>   drivers/gpu/drm/ast/ast_main.c |  4 ++
>   drivers/gpu/drm/ast/ast_post.c | 68 +++++++++++++++++++++------------=
-
>   3 files changed, 47 insertions(+), 26 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_dr=
v.h index 911f9f414..5ebb5905d 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -346,6 +346,7 @@ bool ast_is_vga_enabled(struct drm_device *dev);  v=
oid ast_post_gpu(struct drm_device *dev);
>   u32 ast_mindwm(struct ast_private *ast, u32 r);  void ast_moutdwm(str=
uct ast_private *ast, u32 r, u32 v);
> +void ast_patch_ahb_2500(struct ast_private *ast);
>   /* ast dp501 */
>   void ast_set_dp501_video_output(struct drm_device *dev, u8 mode);  bo=
ol ast_backup_fw(struct drm_device *dev, u8 *addr, u32 size); diff --git =
a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c index 2=
aff2e6cf..cfb56ea3a 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -97,6 +97,10 @@ static void ast_detect_config_mode(struct drm_device=
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
>   		if ((data !=3D 0xFFFFFFFF) && (data !=3D 0x00)) { diff --git a/driv=
ers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c index 0607658=
dd..56428798a 100644
> --- a/drivers/gpu/drm/ast/ast_post.c
> +++ b/drivers/gpu/drm/ast/ast_post.c
> @@ -2028,6 +2028,30 @@ static bool ast_dram_init_2500(struct ast_privat=
e *ast)
>   	return true;
>   }
>=20
> +void ast_patch_ahb_2500(struct ast_private *ast) {
> +	u32	data;
> +
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
> +	do {
> +		ast_moutdwm(ast, 0x1e6e2000, 0x1688A8A8);
> +		data =3D ast_mindwm(ast, 0x1e6e2000);
> +	}	while (data !=3D 1);
> +	ast_moutdwm(ast, 0x1e6e207c, 0x08000000);	/* clear fast reset */
> +}
> +
>   void ast_post_chip_2500(struct drm_device *dev)  {
>   	struct ast_private *ast =3D to_ast_private(dev); @@ -2035,39 +2059,3=
1 @@ void ast_post_chip_2500(struct drm_device *dev)
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

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--rIBC9lwCSpiEEthpgzmLANqXVub6xTGJp--

--XMAX8gAkte6nQCysfHLccxVHseKqp4IYc
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDQiigFAwAAAAAACgkQlh/E3EQov+B6
tg/+JEjIJyBe7lN0O+AKIS2pPTQ/XdzAHiSyJlEeHysJ5ZoRNXG542boN2uszjy+Klgnp0jD/wzl
g2QSEGc81CLTFwxX910udQ2aeZkG7Z202iBoIEJO/jx43GHwnxK0irnHRGBtvNsL3Dl7uP7riWQ7
7DSlWZLEXzFETzLRs2OuKVsBs/gODzw0fIZqCwpOz/ETL8pClXg2zmVu7G+lMrLxTfHeVZcmIswd
ajvR/S5cL5AbdZlA+L1AvPUj28sS007rei5uOdLlN321B4drMdwr9Ze2mcqQDeeVyzepaWX/KEvm
ByX4HI9ZbbisJhJEh+V6sQkl7fryuNtWTk/WhRNEz7zF76uEUY8CPMVnGwVIKHO3PsSQ34bUm6aL
C04IZLoEn52QlvlTH2KDiSIueSBtcQ73QuRelzvuoENMwYz8U2bJR9tsCShx3kort7w5tbSNiLwM
D9+XB2sXpSR2/muNU8rxbqL2K04GLup4LPWlkoPt1mp7qrkDH2Dk4JLSJ5YE/QzakE1r1l19A9T5
ZBwjlLCicG114lTC1/uYwgkOrf21uTyaokyaB+YkDaXVHqLWB/Hmzf1nXkpJH7M6LXDWvpK3QYGd
bd/R4HWGolzjAEem5m+NcaKgIkZwoX3yKk0vRW9j+PWk+4guBWwSuWZlzPSG38H0HbtRFORIW0JV
ZFM=
=QrQW
-----END PGP SIGNATURE-----

--XMAX8gAkte6nQCysfHLccxVHseKqp4IYc--
