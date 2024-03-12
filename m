Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2F7879C28
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 20:14:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB21D10F4D2;
	Tue, 12 Mar 2024 19:14:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="jPGnyV0d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11010001.outbound.protection.outlook.com [52.101.228.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A64D910F4D2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 19:14:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nd7mWfoE6H2P9Nmn21Oo0LExpPtLfHuJH7rQAdAKuI26DwZYqJYX3Rl1ZaUZokfEH9gvsE7DyAJYqCfR5zySs3+IuuFeok63TR8X6ywSPg+8M1FY+b6Am8qiat4Rmu8sSeJy59iQqaQ+6yk/cRjdXqWz0T174XMea4JS1+yHNGfX55mKgObeWkT2DTnRWuGO1IrqZ7SrTJ5zJ/QDBMD0GDq2TJ2O6qq7It8+Vtcb2zUPzxeQVNYjtQAGwCZwlF/Jfh7WntuiKTBG8O5ZsVUvk5G38g569KB+1KNxm0hv+vHz7MpD+2qXIlcdg7XU86oeXjJ91uhRhaZMFjNfXxGD2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YMCr91QMaXFsNofPePtZpDmIk2OpZ5QZ+d+IS+3/Ys8=;
 b=O0CIxBZLrbTS033pCdxZEPuvQc6OP/IrjN/7U6zXDnLGgF1+KJ/ijGCz6m96200QBZG0B/e2f+tcvTnI3gygwg/tHnwLlzAkJAhjUeZgA5VjVMLLclzjVPT/Dq6hTNv0BgA3Tq65bGVJsgiAXuAP0sPrWoKbNYH9/BW4dCuJA8WbLHheI/Fky49AWFJ9s4nhFafeq2XCiuxNtxYXAtRxtQ2SapAgl6BhvXuou6LfJ4oUHUhl5Ril07LyNTHHG5pRLUvpPEmZD75SZqMwUhlo/lIsuWzrKRExx4kcqxeDNEeIopqODQI7fM+27X0/JKjziME3Xdx9ydZkt4zzScjpYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YMCr91QMaXFsNofPePtZpDmIk2OpZ5QZ+d+IS+3/Ys8=;
 b=jPGnyV0dx+Xri+dIIIF9rMU2sFTSck0dXrCKz8+N0iAl+O9fQJF5f3EK2Vx+wDiFc1W4bjJ7DOZ6jwCPU22eT0y/oBau2iX8A3imii/xVCxtTll8Juon3EOdlaY/JVyDpL1naqJyZEAduYIJnRarsj65jsXmpcfqdknkfNUsm0Q=
Received: from OSBPR01MB1592.jpnprd01.prod.outlook.com (2603:1096:603:6::18)
 by OS3PR01MB7996.jpnprd01.prod.outlook.com (2603:1096:604:1be::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.18; Tue, 12 Mar
 2024 19:14:40 +0000
Received: from OSBPR01MB1592.jpnprd01.prod.outlook.com
 ([fe80::7e9c:afa5:f04e:a538]) by OSBPR01MB1592.jpnprd01.prod.outlook.com
 ([fe80::7e9c:afa5:f04e:a538%4]) with mapi id 15.20.7339.035; Tue, 12 Mar 2024
 19:14:39 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "airlied@gmail.com" <airlied@gmail.com>, "deller@gmx.de"
 <deller@gmx.de>, "javierm@redhat.com" <javierm@redhat.com>
CC: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 29/43] drm/renesas/rz-du: Use fbdev-dma
Thread-Topic: [PATCH 29/43] drm/renesas/rz-du: Use fbdev-dma
Thread-Index: AQHadJTHutunuFOFwU6c9fxUwWfqp7E0eZ+Q
Date: Tue, 12 Mar 2024 19:14:39 +0000
Message-ID: <OSBPR01MB1592F28EBCB531481479673C862B2@OSBPR01MB1592.jpnprd01.prod.outlook.com>
References: <20240312154834.26178-1-tzimmermann@suse.de>
 <20240312154834.26178-30-tzimmermann@suse.de>
In-Reply-To: <20240312154834.26178-30-tzimmermann@suse.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSBPR01MB1592:EE_|OS3PR01MB7996:EE_
x-ms-office365-filtering-correlation-id: 1d9605f5-9648-4526-e2de-08dc42c8aa45
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aoQR4ldRb7xJMEXP46KWoVSi/3rVP5B2G2bIVqkLMs4HHws3mk/t7506POKn23yq0NxJdR0oSVFaUMGM7opM3aQYDxsXNRvN/n2c0MAIPaZ0oWrqOjZnlohFASUDiBrcOTkKE+XnEKAhalRCXR2FxhTOgy5MOEEcqblIoSl/IXdfvEgHiA/5JfDCjK5DsorCzxGeeZB81Qio2f28VUu9wTeuVOs0sh4Tj7ixkJ2S/7CmMZLD7fL/ukJHyC6537YavDI29C3lmSKRB/CR2BIHa3SZiLb4Q0jQ/57wMctKxjz7gcPgORPhvgccG7lMx7ZllRoMvcrQUMdll6KZNBS5mwUWXV9rfBk0CjsjnvTyvqHHsv96KiHbAOvn2DC56R6IzgmwVAb66tCYICJFEk/5iID5MABXmiPW8H26poLxAFtsfL+9RdT/KsonvsMzw6CivM98z2weVIBlzvS/XCmFOKEfAbPbNHcJwWki1by+7Hdu9CQvo9/ICdsbo0j3/PE4/yZT9/E+RJRp72hHZFfLkWmL5sO0x//uuF5Ay8U5lh25a0LhD6lezo0NOQUIeqf4X+FeRr9BMzARS2tf6Qdrw/kYBq/X0O3S5j61NU7J0N+cenYSBJnz2shuXSkXWYqdsu078IhSdyoVGhG7NvaHhJ47ReqSiFzY5PPnpGuH271o4YigoJC2sjzZu7oyr44+w61XrqRolieoKpqAvzKz4Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OSBPR01MB1592.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JDqSCqfkzXFgrmEl5K8SgdyTOcchndncmmO0KbZ0CYugS+2SSKYVNGSjCx3n?=
 =?us-ascii?Q?VEY9LZJyQQEqt/4F5ml5yApR9SQ6vMIuQ8JUdE2ljoDt795Kq+mHZq9VwVm0?=
 =?us-ascii?Q?kP740Raq2VhTkd+odb9YAenvzLIOfRQt3VvPIEsus8DA+Y0PRcOXrIzq7jgL?=
 =?us-ascii?Q?1FM+0ZxR55cQqzod0+UIeYi/iZXZsjThsyLzq3/GB7ZcTuaaooul8GDYD1LE?=
 =?us-ascii?Q?3rICMiYVrIKP2miWCnulbTAWofC+onQvGwQObhkFmxPG8UAtMFp5dWlmnp9T?=
 =?us-ascii?Q?PxzFnOHPR+Xsvv93H7jHDmQ0WFeT4F3cKpPJPvTTLerlDB8HgHIUS+EL4QKN?=
 =?us-ascii?Q?b4ocygK3Fn18btuOa2hbDgsDbGYcwxtMtooub8JaP6HcT4TZpPf7zG2kGH74?=
 =?us-ascii?Q?WvCajcdg1llU7ybqDJvSd6hOUevhFCULjdm6S4/0HPPIxQb6IkrXxr2Eg5Oj?=
 =?us-ascii?Q?LtaPHZbP4Qv8RIjldGaScp56r4FW1D7st7r67j/BY4YVX6u2Y59B5GvZfmu/?=
 =?us-ascii?Q?S6nqqXkEGzZgXm9nkDvC9SIvPj0cMQ1jZbrKu9/D8FHJFu3SPDcKxBK9UaTo?=
 =?us-ascii?Q?bbYa3ZLawDz1GSj9eEGKdkdLl8D28YPkbVO+ZM0fgi5nB4i7/IueGDPgMw/C?=
 =?us-ascii?Q?WIxdD3QVy4Sbiflw0hQvjTqpIpUdy2fX8JOHxhgZd9mTlsba3rgN+on+4fvL?=
 =?us-ascii?Q?D3SE6BL2yhMsPA1++bWu485NNn3iGI9bGILPEtF39cZQkyYaYO/pVhOXherz?=
 =?us-ascii?Q?0Q4l6ne8ifP077U+Hh+UiX5/098FspKwvAtu/r2kC3G4m97Re1lwklY4pG3G?=
 =?us-ascii?Q?JyuXL4NMXcMNczRgA8nVINcqkXDtWf4V2KgK1MxP00mgaJlSXzo9rbiHRDSd?=
 =?us-ascii?Q?Tsgg1m1iBytr+TTbjjYt7nv1PTtj0KScNByvJ11bsz1w1DsLOgItosiSCydF?=
 =?us-ascii?Q?LzH1+OfzKVeLWJxUE6V4cniqWw0b2PLbpHgFSMf9WyaVBA32FXE3b5D90baN?=
 =?us-ascii?Q?Q5bT/xuO33Syu5S7QCczsB1FS23tAJBY1Yq0rGnPxieoZzZDp2/WsogQK+US?=
 =?us-ascii?Q?EO0dzFzEXWcN0E9E6Y7AfyAnd/g7yDjQGuyGhaQgrgy7sqfGhdLZWEKwWnSA?=
 =?us-ascii?Q?3l2FJmFzhrK5Mwpj79+88eMOWYpnpVyG93DlNxl+7jOxu4npdq4Q49F4Eb20?=
 =?us-ascii?Q?XtdZP5z0H35yB1QQa1s50Qhsnv0GZ7+UWsUVvN8cWzGHBo6KDEgQtqkTc3nk?=
 =?us-ascii?Q?6ra1UbWSjfjeO+hXNZY8pHAKGKXfutkaKlhRsceoANg1W8VGDwhp6wmSg3ad?=
 =?us-ascii?Q?+YHx+behGYVLw6/WV3vJ13hSJv2VEnjMtwn58LBXjuZB7Xk7FgSWn1XQGNKd?=
 =?us-ascii?Q?2qnJn9PLweuLbUwsK509G+WkL3CMR9S3xULkgcBmFAvldgHUCoCdBzYj6Slz?=
 =?us-ascii?Q?ocfgCycWzOTgOpiXeQUwvtGCpm9A+Va5JfPGYlAaaUHhlA0oCUPgM/bqP2hv?=
 =?us-ascii?Q?+pjbpr5jW3jElpz/m9OMJlYuOLFtFkUyvuVClN4uAcwRa1OYiw2LgXqlaWlz?=
 =?us-ascii?Q?KKZwFHCK8b7rIwaLebB5pJuNvQ6RyHGGzXMMZ24nUnb/vmjkjwJRqHSTvdo2?=
 =?us-ascii?Q?UA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB1592.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d9605f5-9648-4526-e2de-08dc42c8aa45
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2024 19:14:39.6806 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YV4P1rnF8rtWtwLcuDujxvBX6c9AgJPUCSMjit+dQZ8ac6YYun7O4JXbUzwEcBRYUUuuiXpeR3ksUCAYQRHRBYt3oJAxr9OvanDd1Yhf5WM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7996
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

> -----Original Message-----
> From: Thomas Zimmermann <tzimmermann@suse.de>
> Sent: Tuesday, March 12, 2024 3:45 PM
> To: daniel@ffwll.ch; airlied@gmail.com; deller@gmx.de; javierm@redhat.com
> Cc: linux-fbdev@vger.kernel.org; dri-devel@lists.freedesktop.org; Thomas =
Zimmermann
> <tzimmermann@suse.de>; Biju Das <biju.das.jz@bp.renesas.com>
> Subject: [PATCH 29/43] drm/renesas/rz-du: Use fbdev-dma
>=20
> Implement fbdev emulation with fbdev-dma. Fbdev-dma now supports damage h=
andling, which is required by
> rz-du. Avoids the overhead of fbdev-generic's additional shadow buffering=
. No functional changes.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>


Tested-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju

> Cc: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/d=
rm/renesas/rz-
> du/rzg2l_du_drv.c
> index 470d34da1d6c4..e5eca8691a331 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> @@ -14,7 +14,7 @@
>=20
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_drv.h>
> -#include <drm/drm_fbdev_generic.h>
> +#include <drm/drm_fbdev_dma.h>
>  #include <drm/drm_gem_dma_helper.h>
>  #include <drm/drm_probe_helper.h>
>=20
> @@ -149,7 +149,7 @@ static int rzg2l_du_probe(struct platform_device *pde=
v)
>=20
>  	drm_info(&rcdu->ddev, "Device %s probed\n", dev_name(&pdev->dev));
>=20
> -	drm_fbdev_generic_setup(&rcdu->ddev, 32);
> +	drm_fbdev_dma_setup(&rcdu->ddev, 32);
>=20
>  	return 0;
>=20
> --
> 2.44.0

