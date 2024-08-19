Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 904FC956775
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 11:50:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E59E610E23C;
	Mon, 19 Aug 2024 09:50:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="pfvGv1Vs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010046.outbound.protection.outlook.com [52.101.228.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B1E10E23C;
 Mon, 19 Aug 2024 09:50:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EKlklko0UBK7A7EIJlVfsakLp2Da4ppTyhg6bAmrkxl3AqIqCxqCldR5Rgw+r+FqFZw6eAaXB8mXBY4dhP9NLdwv7XrKOy12nqeER+uPZfy5ZPeOPZtMclKOxxtiPHxK4cJZbfAyhaurSpd24BEY+liaOxhMyUmCWBFsXnjQW/1zevI7/QqWY9CYYubKEWCvMRnZCg2IXmCnWsclxEzi2AVRvZiZvcEl0QdFhyjn0sZhCHCIwU1hQ7DBthulcXlq75uGs5XkyqVIsVKEarjFyDpaLwvk8DGJn8Y/chM7Bsc2KRAlAihsGfK2swTltmkzbL+le2rlwd4h2KuzPSyfJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A4jypXCZKPvlO4Hha3P+CtXMXU3AoOm4Z2C01B75AG0=;
 b=OegwU7N0rdlb7syTCJptvcdNCAASpVhH4+Sm2ChJ29G5uT8CtQ2wWV7JKvYKX8YHAku2iMyKa+Rt1zSVh8ow5F5x0MfHOSyjTjPB6y9/exvX7Gu4JqUPkRIF4/zX7wZhlRhEZQP7uXxNb8dYUd7hr7ceuO1NwNlnbuk6RCsiDZS0hki2cD0jROhERmLnyES9LmhEkTSP+27qRdH3pE+iT1jz2Wm86ABaMNLpb3IVAyfGRY6cwDgb4vhLRoI4+piHTbSrHOGMAs2nvEHVvI7x07e/NahSa+AzALHY3oX/usqWY5mJA+VBb1+yoTEBeEfyGvZ6hixqMal2PAj0SnW4gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A4jypXCZKPvlO4Hha3P+CtXMXU3AoOm4Z2C01B75AG0=;
 b=pfvGv1Vs3Zqx0UUd/xpAqQGPz+FjBGstMlZ40jPv0BhHBaEF7prtUBNGUi4K+6y4bV/Opw+s88dbwnJmswMGva8hxzs0y9lkCcRSH22/9lDX0EnGyd4SmI5UL1iSXqv7o64FwenNxukWWPpUZ4HFmXpiYU4WmjGd5OPpanlkAaE=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSRPR01MB11773.jpnprd01.prod.outlook.com (2603:1096:604:22d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 09:50:20 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 09:50:20 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "airlied@gmail.com" <airlied@gmail.com>,
 "jfalempe@redhat.com" <jfalempe@redhat.com>, "javierm@redhat.com"
 <javierm@redhat.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Subject: RE: [PATCH 35/86] drm/renesas/rz-du: Run DRM default client setup
Thread-Topic: [PATCH 35/86] drm/renesas/rz-du: Run DRM default client setup
Thread-Index: AQHa79tuNZvEXbvPwU6/C6ldf1lFVLIuWm8g
Date: Mon, 19 Aug 2024 09:50:20 +0000
Message-ID: <TY3PR01MB11346645399AB4B6F83E59853868C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240816125408.310253-1-tzimmermann@suse.de>
 <20240816125408.310253-36-tzimmermann@suse.de>
In-Reply-To: <20240816125408.310253-36-tzimmermann@suse.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSRPR01MB11773:EE_
x-ms-office365-filtering-correlation-id: d56d8ee2-79de-487f-b6b1-08dcc03456b9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?xz983qP2qmSVorufN5InXMvsze/YzA8qesrYFRcRubiMWyl+DrV899PSTANU?=
 =?us-ascii?Q?wLbbcZlHs1xBfT4TfadCPnAUYKrP/+emGGHk2dN0ol+uMNAP3TlqRJYX9mNT?=
 =?us-ascii?Q?mpHVSN2bpXYB2QYV+/0Gz700vrdO5FGxkYUVAMTMbDfvo5EOUYDyOrXSnPvp?=
 =?us-ascii?Q?WCA3U65+WjZN3iRrPsXGLnzlUrKevsyV+nN1BlXowVDhro8p3Xq0KTlstLAQ?=
 =?us-ascii?Q?Xjra/MJdfjJJOiUzeR2zSPMa3oYWI1O/Ox8fIWVIsCMGeAigZ+FtFaKGZCn/?=
 =?us-ascii?Q?iEDmhQIIf8ReBp84GoqSJlC4hB02FtboYWjNiXvZ2fYiem52CdY9nifhBM9E?=
 =?us-ascii?Q?pXbGhFNuIZO/4CvFCJYUk8NhjPNvYGHTMif840C7PgIKGo8iHpVQ+JKOWDXR?=
 =?us-ascii?Q?Gt+xRmOZxg7lX7eTIB1j2ZjF26f9ApOnG9nlWIkTgtwmpld36TDjHugUkMWd?=
 =?us-ascii?Q?avzmOcoTmZNOOZb+XBwOHyizipoIolJrJkkO8muwPmI67Jzm1z3BneDAX96M?=
 =?us-ascii?Q?wIILq/zfLPat/WgAcQ1be107peTkZahH3lEBLvBQ0CD4sisPLXs10lIiIqg7?=
 =?us-ascii?Q?Zw6ThUxFKLjPGSn+zpz2es78p0avUs+6oBxbICHjG0e2otyNC7ad8ZUEaFA3?=
 =?us-ascii?Q?g9GDYY0bO2Wz5iRk+ZML6/aCkOa3idil2m6nS3RAVHnm0dptoQXoRzA1kZiA?=
 =?us-ascii?Q?Z5AC+EdtbC4VOwEjooo7JjCpwWTvdb9PFiLq1koeomHPlpB+nfWiC6DxGNj/?=
 =?us-ascii?Q?8iT5Bg7pKBhuySggVr8ya2hU3tW7lusXzF4utdEb5ZjxoMCEuAnsFzwEStew?=
 =?us-ascii?Q?bFxag1EQOxmMz8aD3GFYUba9dYrRAhfkFvnGZOmnSTJMcBE/CGsa8UTwr0/r?=
 =?us-ascii?Q?X/KA0hXGbrWGbJYVMs67L4aZmpsnYqamK9LirglKuksjC1YogCQNrOFnya4v?=
 =?us-ascii?Q?pfZvuWDZIkgzbaj5K9BXoNpkXzyJDJP8pZExW+M4eyyPcTN00JK+SgfZpc7j?=
 =?us-ascii?Q?s3eRTxxy5Er8CNLfq9MPQM3xaa+DP1xuF7zFj8VmHjO9qecmfxORcSK35OpJ?=
 =?us-ascii?Q?EYWjBiF9VwDkupMc4axhFgoIvmT++y9v9ro+UCIKX6Zae2WqfESqHWgvuTlU?=
 =?us-ascii?Q?GdyucVGXYXo+gPX1jdiyK+llI+TndypXDnYGfjjM+AvzM/K4RFU6OgvO5Tjh?=
 =?us-ascii?Q?QCLOiLVxzjnv+hHD270SW/fjtLIWk2J4QinOgZHL9913cxrT3Nt9wnoXxjjz?=
 =?us-ascii?Q?Qb4YeoE4HQnmMMMDOCj1PqbBnx/NJKb3nnOGdOZGHiF2YOV5O94rQc7jKMrj?=
 =?us-ascii?Q?2+3+V7AuNQ7T99djqPslUxaGyA6UBDGHap3mKzsRfTLzDoEPnjXkQTqcn9LR?=
 =?us-ascii?Q?X668Bwc82+p9IblPh9IsdhdjoAGnh3YEsTzj8SbvQxCNOmCHEw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sYXJ9AQ1H5PLXPtyGymLX25fxgGH52EP2kBC3RdF8t7hFluLUhKOcqmC80zp?=
 =?us-ascii?Q?zh2AcW1l6X3YPPouQ2sbDRnN6X33UeZbJXUGhKZlMFZ75yli7y6kcLCiwBPr?=
 =?us-ascii?Q?mUwwcxdt+dYQOwvslMimwlg3CO+yxJcM0GE9K3veTDwXwbOQFQSKkrxzKWQz?=
 =?us-ascii?Q?ERqLGhtKvHqsmmLkuVxbo1o5IFHuCvmCS6nzMspiw23gkMbFSGhDtCUyrAPf?=
 =?us-ascii?Q?oJ4Qq4xi96XpLTELpKYjbMtX+P99kkctXLPHZh7g7Ho6bstfMkPuvQJcqxny?=
 =?us-ascii?Q?nwwZrfAxudTT7tfZbs5JIB+1XW2IkU3za8Jc+nYZYp1WzUTCjZS8KaLQK9UA?=
 =?us-ascii?Q?vJFYKEYjs9+K6S5YSCyihc/qOYIwiY7bvBxfCxdBO9FFEeaX6MJt+gReHf0o?=
 =?us-ascii?Q?GPtsfbCRum8QuiOdaGlzmZ175k9VivDtthZeyff2Pj8mbWyB8kZtFef3UNe0?=
 =?us-ascii?Q?vlghyikxkfka0buKA6BP5T5REqYj31pE+Gr7MtyjU/JtSbxmmOqT7PJFYw9b?=
 =?us-ascii?Q?mJ4whxy4sZzMyb3E1jFqZp6MlFX/b/1B7V1UXG+QMxX2MG5k6y7FFfwzPXCX?=
 =?us-ascii?Q?axT2ktgXFmI045VhwGX3xawXxB6rlDTNsNuau0N20hZ0sXgZLXuNGQk9+fR1?=
 =?us-ascii?Q?27dW9NErooSwxF8YEtwBaR1joyoSmll0ehNsI/QXgaXr1B2jRYH3wqy19cDg?=
 =?us-ascii?Q?41FvX9yc1F+TirAAQEvpFfgMhmeQjg5jw6arl2hEvEH7NKg+MpWAU/vE1ogf?=
 =?us-ascii?Q?cokQd15mmwvT++81WIMjJP6IWhx5AdIqgUzm/QHOuzlKHMifD4NsSg2xow7M?=
 =?us-ascii?Q?Hx2XcSunecrwizFC3XIxtd+xe2fIKKYVO6Q08kK3fR7+0fuogK6jNkijuZQj?=
 =?us-ascii?Q?ekNB5JuzlQr5/hL9X2AP/IS0c3eqoq12z8h7cD7AqdQOTo7XBQYWYFW/9MsN?=
 =?us-ascii?Q?k77ht6YbGj55GpKC10jbFzNvdLAG1Qilen7K1J6Crt7ZAlkhn3Vl4omyIRfT?=
 =?us-ascii?Q?w5oW7yzl6v47ouUWp1Mq1vxj0O2zaZLZSVtM7E+Grby3L6esPuFVQmWUph+k?=
 =?us-ascii?Q?pzHxDXl1sjhfh+A53KmYqEigdgtOTFu1tv7vFXxqR9znLAKrw8p7LXhbMToX?=
 =?us-ascii?Q?VUxKag9ALkz0u49kKqy6bDxa2DDSRg/vPdC3mB9qcJDE1Dyky/1cH6vdKVox?=
 =?us-ascii?Q?B03z0t868BS+4sYq+VpptlkmdzXDBfXR36wA4XYSKnFV1I/pMMbxkN7xRPHD?=
 =?us-ascii?Q?idviPzWDThZhSQxEI/NVWxRd5eW4h8HxRkZQk57hQ3OZSFWuUlyktOzxqx6H?=
 =?us-ascii?Q?mBzTjST00KOxYum6qE/EsaERRMKDoGzOgOHSi55kJSGMlxNOzGa6Vw5g0hvW?=
 =?us-ascii?Q?b8B92H5vWZ+nkxgv+4ZhYRHx7U+iGJ3CShT9lqGFNW/DbGkJNtciIkZvjvZd?=
 =?us-ascii?Q?zvMWlQ1juAHfgt2VzjPR7n3nTVBLLVTO1KWW2BAmRKD/tE4Kbb/hLeQ/lQVS?=
 =?us-ascii?Q?d7Hf9fdZjawddqH1oSCvMZFFBUFnaT8+4GvSHVKcHQF1VSgFH901RZjBezzO?=
 =?us-ascii?Q?vmkM/Ghc9FCZSHOdcVRhX445JEBMJ/q03EZUeUbBVLC3qmaAaZkfzE3MSPvE?=
 =?us-ascii?Q?KA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d56d8ee2-79de-487f-b6b1-08dcc03456b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2024 09:50:20.5523 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H1Z8ZExI34Rrqs/MtHuF4gR1cheL3pdzk+Xb8B/bpIwI+K7ckcmUtKcX8qK7xZch6wu6cX0lgnNnNLk+6Tq98ofom+UdLNz8us5+HM3I2a8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11773
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

Hi Thomas Zimmermann,

> -----Original Message-----
> From: Thomas Zimmermann <tzimmermann@suse.de>
> Sent: Friday, August 16, 2024 1:23 PM
> Subject: [PATCH 35/86] drm/renesas/rz-du: Run DRM default client setup
>=20
> Call drm_client_setup() to run the kernel's default client setup for DRM.=
 Set fbdev_probe in struct
> drm_driver, so that the client setup can start the common fbdev client.
>=20
> The rz-du driver specifies a preferred color mode of 32. As this is the d=
efault if no format has been
> given, leave it out entirely.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Biju Das <biju.das.jz@bp.renesas.com>

Tested-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju

> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/d=
rm/renesas/rz-
> du/rzg2l_du_drv.c
> index e5eca8691a33..53f9e1b7fa87 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> @@ -13,6 +13,7 @@
>  #include <linux/platform_device.h>
>=20
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_client_setup.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_fbdev_dma.h>
>  #include <drm/drm_gem_dma_helper.h>
> @@ -68,6 +69,7 @@ DEFINE_DRM_GEM_DMA_FOPS(rzg2l_du_fops);
>  static const struct drm_driver rzg2l_du_driver =3D {
>  	.driver_features	=3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>  	.dumb_create		=3D rzg2l_du_dumb_create,
> +	DRM_FBDEV_DMA_DRIVER_OPS,
>  	.fops			=3D &rzg2l_du_fops,
>  	.name			=3D "rzg2l-du",
>  	.desc			=3D "Renesas RZ/G2L Display Unit",
> @@ -149,7 +151,7 @@ static int rzg2l_du_probe(struct platform_device *pde=
v)
>=20
>  	drm_info(&rcdu->ddev, "Device %s probed\n", dev_name(&pdev->dev));
>=20
> -	drm_fbdev_dma_setup(&rcdu->ddev, 32);
> +	drm_client_setup(&rcdu->ddev, NULL);
>=20
>  	return 0;
>=20
> --
> 2.46.0

