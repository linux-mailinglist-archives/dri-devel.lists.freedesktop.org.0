Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 014CAABED3E
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 09:43:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AD0F10E6A4;
	Wed, 21 May 2025 07:43:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Klywsko+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010008.outbound.protection.outlook.com [52.101.228.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C7410E6A4
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 07:43:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YTQbFYsui9RCHGXNccIIsQD/iDz1weg0UANwJpYaG9BtOoI0HLsccqLtzdKLZMB/idJ79P7Ch8XFIWWv9QbQRN6zvXTh/wbiiBxfB+Dnrki/wutJFqZ3fZP0RAuiXb3i/1YYPBFklaOd08fhisG4Z/h8rlayK5nr4I6wLp3crBjzxFebupEUxn+CSprvBvSMWt3kJreyB8GbTw2evJvxOgQHoG/WGFBxS3ozfSn/Z0sn1rZvAnBqtlnDmMKQc+RmfCQRXjthJWErwGh9I2Wczn3hmKvtuaCD7i2VuVtiF6oRhcwBzRSV2vgZqrWJdlHWF5AvOu/Ln/0SbQFpR7SrFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K03+qsN2UnrweZ1XbhJ2HJd2V3d5AbPFdf6ZD3p/hgM=;
 b=qfIfeRF7TGAs4dLczgTEp+2eAw3boGh2iZW+crMBDVlAOW4eOCZ6i7RcaWix4/+Y0KSuqivf/WezYa1E7qKI1d7A3AM5qs1SmdHA+gx3CpEtFq458vRVBT0Z56+tdHmvAeUSHO2lE1n00hmtkGyB+SZB+kLDUgT8vHlbErXwxCjjdP+sxJ2MOuDiN+LM47si7eqLKDmLvhKQoTENbpfq0wAM7vNMEGn2SKFz4ZID3Y65a0acg5l5N02ECoOEyvXm9CqFAC3KokJwQ1fHtNCZqkTy76hBQWW0uAuQJfyLG8ny9OdiSUSRlCwrWRbN5H1INX6imixPa/FO1IDrDu8q3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K03+qsN2UnrweZ1XbhJ2HJd2V3d5AbPFdf6ZD3p/hgM=;
 b=Klywsko+qGcmVRcq6kKGcpcABO0U4J1vYeHPUZY30f5raHID7RhLTAncNJUDR3Bhxvk/SHQeZ2DMtrOpJkmyWgGmTsOQ8R4fjn/0v2IKX9aEmSWGltmG9rdNpyDZ06SRVsP1A/o/buP22nSgNdqh/KlOA7Ma8IMZvO7nnynK4f0=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by OSCPR01MB16193.jpnprd01.prod.outlook.com (2603:1096:604:3e9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.19; Wed, 21 May
 2025 07:43:08 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%4]) with mapi id 15.20.8769.019; Wed, 21 May 2025
 07:43:08 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Hugo Villeneuve <hugo@hugovil.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hugo
 Villeneuve <hvilleneuve@dimonoff.com>, Chris Brandt
 <Chris.Brandt@renesas.com>
Subject: RE: [PATCH 1/2] drm: rcar-du: rzg2l_mipi_dsi: Implement host transfers
Thread-Topic: [PATCH 1/2] drm: rcar-du: rzg2l_mipi_dsi: Implement host
 transfers
Thread-Index: AQHbyaojXzSdLT9CvEyaJrDByzEfXrPcn0sg
Date: Wed, 21 May 2025 07:43:08 +0000
Message-ID: <TYCPR01MB113329D284B9AFDD68F9E64A3869EA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20250520171034.3488482-2-hugo@hugovil.com>
In-Reply-To: <20250520171034.3488482-2-hugo@hugovil.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|OSCPR01MB16193:EE_
x-ms-office365-filtering-correlation-id: 2f318990-68b0-42ab-e227-08dd983b2146
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?m0F4Uaj6TcqrESixJ3Oz0DgVEWY0bOJmUJAhejhuUGUYlwmDvN29+vFH6xS4?=
 =?us-ascii?Q?en79VkCeGZEHQG+wBTHv2aWamPRI/e/Kh/IQwQHlGLvWGFnne3pPZPXges3f?=
 =?us-ascii?Q?XbvhbJ5g7wkX3fcT3NVSsSoLjqllQG+cjllJVZQHIDUjeVqZmA7QPogm4wtB?=
 =?us-ascii?Q?LTj7c6UtLJtKuBX359PXFyBoHN3QM4Ns7URmCRB5R+P8PD9tnilVSav48lj9?=
 =?us-ascii?Q?H4afNy4caMgbD8sbT2ciCYGAT3yOku6B5XVv4UtWMCu7jPzaaEfadRz0ktr8?=
 =?us-ascii?Q?o2ATZoM/hNLmFDqsEJAKS4oRfTB93iYIjPTK9pC56WEINK1vb6IaKLPQvGWD?=
 =?us-ascii?Q?WPeSGB5/fLuTA2HT/TUpF2YjmBzaITn2wJdAHrHB4wP9sGM98cEiwFi+Zz1j?=
 =?us-ascii?Q?62Lo25GI54fklX+BVptNRKtZgV8V/gNvo0MbwPklxa+CtSrFxi1aq6x130w5?=
 =?us-ascii?Q?apNGXMHlQcw9fp7wH1kBKzf9mDuTUo8KkO3p23Bca6x3JqAh1ijap69kReg/?=
 =?us-ascii?Q?eRD+0SUITHm488ZzF2NzUN8mxd+PoJ/+SOUrAHvTBd/KQOzOxz+kAumJqPL+?=
 =?us-ascii?Q?MWI5s0gbtKS1Nf6Wv9PxLkkQYeQ/qGmqdT6ogMWDkixA/l7UYVNs9ksk8Omv?=
 =?us-ascii?Q?Irt/h/wtTFFneBndjZglKLdeusCPLvja86JqAVM5s9wgHweluneY1xNDmPJz?=
 =?us-ascii?Q?9vFfm+OiVHFYD982/Rg1KXSWSdGyRk33PCpoWvPK/DcmaKt8rlj2KtCVZyIc?=
 =?us-ascii?Q?G3m6uicQNE/+uBr/dmGPk4aNuorp7LfWX6JopnSNDPR/GysNkvVOD+TC4LU6?=
 =?us-ascii?Q?JkUMv0FPAObGjxrRWyPB8k2RjPulUztcSAPv/lua8NAqJUUYiqkd1xfeEuiT?=
 =?us-ascii?Q?BonOF7xWnxiCWFV/P+ol/03x8NL9gztvJTJSwO7IezRpPaXCy8JAMPEsz8kp?=
 =?us-ascii?Q?UavIMsOkIYDcDqNPhTCq31IbWnYhKm/WVlL1ru7lLEhlBCcW2aNx72+INcUL?=
 =?us-ascii?Q?RaZ0zm0hea2Bgg/YLlsnMhds6hMd930weUOSRyzwmo4gC8D88Q8k2de8Pdrd?=
 =?us-ascii?Q?9sdlR+rUtQmMAxU+m7+GU+6rNRJzWxFJRgc0BC27bl9EHZIjWnG1BBaiXdkr?=
 =?us-ascii?Q?6lfVGdCtuRl0/Dy3fMSdftPDLbSsgyixvVSALkZI1L9YsIUudyUqB+5nGmCY?=
 =?us-ascii?Q?Iszi3lwiviip++QGfUKXM9z3ucOF5caazZ3cpwIZCct8fsFcJhdG9yYvJrMQ?=
 =?us-ascii?Q?WxsHktQZJ2T+rmT2sq37QW5zR3PUmHDM2K5K/Grq4Q13IOsyRcW21akuU1yV?=
 =?us-ascii?Q?wsUvfnZqIQ6zBBqTYCn4u8XGuKe/uwsXNZh4z8B61vv2wDyjILsupV0z3xMX?=
 =?us-ascii?Q?4ZM53EpD2hhrM/iCX5fxuuVQFGm5VjE+Mber644/Angi98HZB4l2dz1lPT98?=
 =?us-ascii?Q?VcwCm2RkvKA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11332.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UJLIWa1eTT8T4B9k/L5v+skc9ifJlwfHTyWNEnQaG2B4nHjVjUIp/PF8wpcT?=
 =?us-ascii?Q?ttjiNSZYKM1CuZyWqGxFv5X0JPF585CjWKP5Tm8yoRsSRMsgeHFbMICRdnjT?=
 =?us-ascii?Q?/OD6oNmNjxFUg6LxA8HVolv7lnoYf9c9WXcRtfBE9cV4VdmpdUMb4hhYuc/v?=
 =?us-ascii?Q?YKEMKiohXI7f2qVHPidrz+8BcQMLoW2D070EZvJGjpstTEsPSBPzgkcJwwmC?=
 =?us-ascii?Q?DiLlCYoJv2WFaSTgO+/F9LVALWf9Ox8aKfEq/Lobu8lCwMcZOppLVZywz64b?=
 =?us-ascii?Q?rsTCtJErRi2RfBcIDtNgnw70ubyH3DDTiaBDwPx9tHGpf+h61vTkukskgXvf?=
 =?us-ascii?Q?pp12VlckP4swuAYrLKh9/0vWzm8nX4KmM44PbkiIq97ziafvuF2XvTipbuIk?=
 =?us-ascii?Q?lV3Kn/IlzD6MUCmnlXotBXNpHcXOF5YV9P8qhvfjnuV7EtgryPxnvZ8MHcbA?=
 =?us-ascii?Q?hkZUAMnUgmkRCIGrBInmE2akU7QHdt+WL5Nd6zP7dZTnaFB8sqB2WYRnY519?=
 =?us-ascii?Q?23Jj+KOnKRWf/6WSScwhGwCfxJV4DFJ0ZdjLrzWx8GqjU1k6PDgT+zjwD2aR?=
 =?us-ascii?Q?VZULdZxag+4gAOgU3wsW7zAoHzqpmu8j3ZkYK+QCFsHB5MlwlQSKaB28KeCB?=
 =?us-ascii?Q?F8yDSyl71g/uuPZcrAs3hzuMm4OmI8BIOnQymZ2nvJ75gyCac39pjQ46lSZt?=
 =?us-ascii?Q?W7c6LvFMSU5JbXZLnsV0SYeXyrkaWL8ygzUHYrlieeNRQzhh4o4pw16LwWDZ?=
 =?us-ascii?Q?8XRyXcyUMTi7XLE3M+ElPUvLit0j1R7Bg4bCPgbzdEKkq94GfcTF22C8mmlq?=
 =?us-ascii?Q?szy1+X7eut19DY9QNillwbuPxhEKMcwE55sWBQEN+yi6er8XB9itLmyWOxZy?=
 =?us-ascii?Q?eiu28bOLMveAyvTLvLvAomhRSZTK3x4GD5RBXgAuRBWh+/fZa/CJARLGPded?=
 =?us-ascii?Q?22R9R5Ts2LzlpsnHLOwKbBeTJeIe71GWtnBy1jdQ03gUrv5f5b3HxGpgloc1?=
 =?us-ascii?Q?rG0DGsjEghjqcBd17y/QTDcGQfjqWCQcAoZgd7ZXOvkMjMZG8N8hmE/KzMUy?=
 =?us-ascii?Q?3fBjmpyJGJ5hXLhudzt52GE9yvTaaTFscKicPEZ256KaZTW6W63fPcPyM+cx?=
 =?us-ascii?Q?VqH2/FLAmBGUI21ErrVbyk4rSd3/UwB0L8I9vkDj6Kr807JSZ3takycp7z9D?=
 =?us-ascii?Q?pKWHz04vVQivQmpBr3UfmkWpWiIDczOAHsz+gR7V5XwYroAi0+skNRozYqfl?=
 =?us-ascii?Q?GVJRlTeazTig2El+pk2dpS2SxcciOSsaWip+FF3giRd62lug2PdwYfelNIpd?=
 =?us-ascii?Q?ysyBbftWbUIObCp47RGi0CIsElA73leXjjkgFvhJYnmvUL7JQlckEdTylAXZ?=
 =?us-ascii?Q?ZjGxUIp+r5bByRqUpzo9HF+heVN3m5Qqr7TvMyQ+WYril/9wZK4qIyf1U4GK?=
 =?us-ascii?Q?HS0coAxLxlOYf/q7f4HrWQXYao9lyBEDzMdy0wbKCogLXiN/CN1kGbkDh6q6?=
 =?us-ascii?Q?rQwW9W1pCYU2CIZwiSgFwhZyJeD0Iq27TQiy2p5G62sUnahqbA+a0ydFuepk?=
 =?us-ascii?Q?77v+l0JYm3vlYPal9/D3hEHlkiQ34UbJY+QPMYg6BWYR1HYnxRxo68xfsE4J?=
 =?us-ascii?Q?fA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f318990-68b0-42ab-e227-08dd983b2146
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2025 07:43:08.5189 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8otGQ9d0yFyA178xgb3liJMB1U2sVtxRLnNbU7iwhMbTrU4w7WUjM6+jvRSPhBdd/neIHM4Uxg9HWZimPqC1gShePCxppHoruOLau0SmdWk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16193
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

Hi Hugo,

Thanks for the patch.

For some reason, your cover letter is not showing link to this patch
[1] https://lore.kernel.org/all/20250520164034.3453315-1-hugo@hugovil.com/

> -----Original Message-----
> From: Hugo Villeneuve <hugo@hugovil.com>
> Sent: 20 May 2025 18:11
> Subject: [PATCH 1/2] drm: rcar-du: rzg2l_mipi_dsi: Implement host transfe=
rs

rcar-du->rz-du

>=20
> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
>=20
> Add support for sending MIPI DSI command packets from the host to a perip=
heral. This is required for
> panels that need configuration before they accept video data.
>=20
> Based on Renesas Linux kernel v5.10 repos [1].

>=20
> Link: https://github.com/renesas-rz/rz_linux-cip.git
> Cc: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: Chris Brandt <chris.brandt@renesas.com>
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> ---
>  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 174 ++++++++++++++++++
>  .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  56 ++++++
>  2 files changed, 230 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu=
/drm/renesas/rz-
> du/rzg2l_mipi_dsi.c
> index dc6ab012cdb69..77d3a31ff8e35 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -6,6 +6,7 @@
>   */
>  #include <linux/clk.h>
>  #include <linux/delay.h>
> +#include <linux/dma-mapping.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
>  #include <linux/module.h>
> @@ -23,9 +24,12 @@
>  #include <drm/drm_of.h>
>  #include <drm/drm_panel.h>
>  #include <drm/drm_probe_helper.h>
> +#include <video/mipi_display.h>
>=20
>  #include "rzg2l_mipi_dsi_regs.h"
>=20
> +#define RZG2L_DCS_BUF_SIZE	128 /* Maximum DCS buffer size in external me=
mory. */
> +
>  struct rzg2l_mipi_dsi {
>  	struct device *dev;
>  	void __iomem *mmio;
> @@ -44,6 +48,10 @@ struct rzg2l_mipi_dsi {
>  	unsigned int num_data_lanes;
>  	unsigned int lanes;
>  	unsigned long mode_flags;
> +
> +	/* DCS buffer pointers when using external memory. */
> +	dma_addr_t dcs_buf_phys;
> +	u8 *dcs_buf_virt;
>  };
>=20
>  static inline struct rzg2l_mipi_dsi *
> @@ -651,9 +659,168 @@ static int rzg2l_mipi_dsi_host_detach(struct mipi_d=
si_host *host,
>  	return 0;
>  }
>=20
> +static ssize_t rzg2l_mipi_dsi_read_response(struct rzg2l_mipi_dsi *dsi,
> +					    const struct mipi_dsi_msg *msg) {
> +	u8 *msg_rx =3D msg->rx_buf;
> +	u16 size;
> +	u8 datatype;
> +	u32 result;

Please arrange the variables in reverse xmas tree fashion.
=20
> +
> +	result =3D rzg2l_mipi_dsi_link_read(dsi, RXRSS0R);
> +	if (result & RXRSS0R_RXPKTDFAIL) {
> +		dev_err(dsi->dev, "packet rx data did not save correctly\n");
> +		return -EPROTO;
> +	}
> +
> +	if (result & RXRSS0R_RXFAIL) {
> +		dev_err(dsi->dev, "packet rx failure\n");
> +		return -EPROTO;
> +	}
> +
> +	if (!(result & RXRSS0R_RXSUC))
> +		return -EPROTO;
> +
> +	datatype =3D FIELD_GET(RXRSS0R_DT, result);
> +
> +	switch (datatype) {
> +	case 0:
> +		dev_dbg(dsi->dev, "ACK\n");
> +		return 0;
> +	case MIPI_DSI_RX_END_OF_TRANSMISSION:
> +		dev_dbg(dsi->dev, "EoTp\n");
> +		return 0;
> +	case MIPI_DSI_RX_ACKNOWLEDGE_AND_ERROR_REPORT:
> +		dev_dbg(dsi->dev, "Acknowledge and error report: $%02x%02x\n",
> +			(u8)FIELD_GET(RXRSS0R_DATA1, result),
> +			(u8)FIELD_GET(RXRSS0R_DATA0, result));
> +		return 0;
> +	case MIPI_DSI_RX_DCS_SHORT_READ_RESPONSE_1BYTE:
> +	case MIPI_DSI_RX_GENERIC_SHORT_READ_RESPONSE_1BYTE:
> +		msg_rx[0] =3D FIELD_GET(RXRSS0R_DATA0, result);
> +		return 1;
> +	case MIPI_DSI_RX_DCS_SHORT_READ_RESPONSE_2BYTE:
> +	case MIPI_DSI_RX_GENERIC_SHORT_READ_RESPONSE_2BYTE:
> +		msg_rx[0] =3D FIELD_GET(RXRSS0R_DATA0, result);
> +		msg_rx[1] =3D FIELD_GET(RXRSS0R_DATA1, result);
> +		return 2;
> +	case MIPI_DSI_RX_GENERIC_LONG_READ_RESPONSE:
> +	case MIPI_DSI_RX_DCS_LONG_READ_RESPONSE:
> +		size =3D FIELD_GET(RXRSS0R_WC, result);
> +
> +		if (size > msg->rx_len) {
> +			dev_err(dsi->dev, "rx buffer too small");
> +			return -ENOSPC;
> +		}
> +
> +		memcpy(msg_rx, dsi->dcs_buf_virt, size);
> +		return size;
> +	default:
> +		dev_err(dsi->dev, "unhandled response type: %02x\n", datatype);
> +		return -EPROTO;
> +	}
> +}
> +
> +static ssize_t rzg2l_mipi_dsi_host_transfer(struct mipi_dsi_host *host,
> +					    const struct mipi_dsi_msg *msg) {
> +	struct rzg2l_mipi_dsi *dsi =3D host_to_rzg2l_mipi_dsi(host);
> +	struct mipi_dsi_packet packet;
> +	bool need_bta;
> +	u32 value;
> +	int ret;
> +
> +	ret =3D mipi_dsi_create_packet(&packet, msg);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Terminate operation after this descriptor is finished */
> +	value =3D SQCH0DSC0AR_NXACT_TERM;
> +
> +	if (msg->flags & MIPI_DSI_MSG_REQ_ACK) {
> +		need_bta =3D true; /* Message with explicitly requested ACK */
> +		value |=3D FIELD_PREP(SQCH0DSC0AR_BTA, SQCH0DSC0AR_BTA_NON_READ);
> +	} else if (msg->rx_buf && msg->rx_len > 0) {
> +		need_bta =3D true; /* Read request */
> +		value |=3D FIELD_PREP(SQCH0DSC0AR_BTA, SQCH0DSC0AR_BTA_READ);
> +	} else {
> +		need_bta =3D false;
> +		value |=3D FIELD_PREP(SQCH0DSC0AR_BTA, SQCH0DSC0AR_BTA_NONE);
> +	}
> +
> +	/* Set transmission speed */
> +	if (msg->flags & MIPI_DSI_MSG_USE_LPM)
> +		value |=3D SQCH0DSC0AR_SPD_LOW;
> +	else
> +		value |=3D SQCH0DSC0AR_SPD_HIGH;
> +
> +	/* Write TX packet header */
> +	value |=3D FIELD_PREP(SQCH0DSC0AR_DT, packet.header[0]) |
> +		FIELD_PREP(SQCH0DSC0AR_DATA0, packet.header[1]) |
> +		FIELD_PREP(SQCH0DSC0AR_DATA1, packet.header[2]);
> +
> +	if (mipi_dsi_packet_format_is_long(msg->type)) {
> +		value |=3D SQCH0DSC0AR_FMT_LONG;
> +
> +		if (packet.payload_length > RZG2L_DCS_BUF_SIZE) {
> +			dev_err(dsi->dev, "Packet Tx payload size (%d) too large",
> +				(unsigned int)packet.payload_length);
> +			return -ENOSPC;
> +		}
> +
> +		/* Copy TX packet payload data to memory space */
> +		memcpy(dsi->dcs_buf_virt, packet.payload, packet.payload_length);
> +	} else {
> +		value |=3D SQCH0DSC0AR_FMT_SHORT;
> +	}
> +
> +	rzg2l_mipi_dsi_link_write(dsi, SQCH0DSC0AR, value);
> +
> +	/*
> +	 * Write: specify payload data source location, only used for
> +	 *        long packet.
> +	 * Read:  specify payload data storage location of response
> +	 *        packet. Note: a read packet is always a short packet.
> +	 *        If the response packet is a short packet or a long packet
> +	 *        with WC =3D 0 (no payload), DTSEL is meaningless.
> +	 */
> +	rzg2l_mipi_dsi_link_write(dsi, SQCH0DSC0BR,
> +SQCH0DSC0BR_DTSEL_MEM_SPACE);
> +
> +	/*
> +	 * Set SQCHxSR.AACTFIN bit when descriptor actions are finished.
> +	 * Read: set Rx result save slot number to 0 (ACTCODE).
> +	 */
> +	rzg2l_mipi_dsi_link_write(dsi, SQCH0DSC0CR, SQCH0DSC0CR_FINACT);
> +
> +	/* Set rx/tx payload data address, only relevant for long packet. */
> +	rzg2l_mipi_dsi_link_write(dsi, SQCH0DSC0DR, (u32)dsi->dcs_buf_phys);
> +
> +	/* Start sequence 0 operation */
> +	value =3D rzg2l_mipi_dsi_link_read(dsi, SQCH0SET0R);
> +	value |=3D SQCH0SET0R_START;
> +	rzg2l_mipi_dsi_link_write(dsi, SQCH0SET0R, value);
> +
> +	/* Wait for operation to finish */
> +	ret =3D read_poll_timeout(rzg2l_mipi_dsi_link_read,
> +				value, value & SQCH0SR_ADESFIN,
> +				2000, 20000, false, dsi, SQCH0SR);
> +	if (ret =3D=3D 0) {
> +		/* Success: clear status bit */
> +		rzg2l_mipi_dsi_link_write(dsi, SQCH0SCR, SQCH0SCR_ADESFIN);
> +
> +		if (need_bta)
> +			ret =3D rzg2l_mipi_dsi_read_response(dsi, msg);
> +		else
> +			ret =3D packet.payload_length;
> +	}
> +
> +	return ret;
> +}
> +
>  static const struct mipi_dsi_host_ops rzg2l_mipi_dsi_host_ops =3D {
>  	.attach =3D rzg2l_mipi_dsi_host_attach,
>  	.detach =3D rzg2l_mipi_dsi_host_detach,
> +	.transfer =3D rzg2l_mipi_dsi_host_transfer,
>  };
>=20
>  /* ---------------------------------------------------------------------=
--------
> @@ -771,6 +938,11 @@ static int rzg2l_mipi_dsi_probe(struct platform_devi=
ce *pdev)
>  	if (ret < 0)
>  		goto err_pm_disable;
>=20
> +	dsi->dcs_buf_virt =3D dma_alloc_coherent(dsi->host.dev, RZG2L_DCS_BUF_S=
IZE,
> +					       &dsi->dcs_buf_phys, GFP_KERNEL);
> +	if (!dsi->dcs_buf_virt)
> +		return -ENOMEM;
> +
>  	return 0;
>=20
>  err_phy:
> @@ -785,6 +957,8 @@ static void rzg2l_mipi_dsi_remove(struct platform_dev=
ice *pdev)  {
>  	struct rzg2l_mipi_dsi *dsi =3D platform_get_drvdata(pdev);
>=20
> +	dma_free_coherent(dsi->host.dev, RZG2L_DCS_BUF_SIZE, dsi->dcs_buf_virt,
> +			  dsi->dcs_buf_phys);
>  	mipi_dsi_host_unregister(&dsi->host);
>  	pm_runtime_disable(&pdev->dev);
>  }
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h b/driver=
s/gpu/drm/renesas/rz-
> du/rzg2l_mipi_dsi_regs.h
> index 1dbc16ec64a4b..33cd669bc74b1 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
> @@ -81,6 +81,16 @@
>  #define RSTSR_SWRSTLP			(1 << 1)
>  #define RSTSR_SWRSTHS			(1 << 0)
>=20
> +/* Rx Result Save Slot 0 Register */
> +#define RXRSS0R				0x240
> +#define RXRSS0R_RXPKTDFAIL		BIT(28)
> +#define RXRSS0R_RXFAIL			BIT(27)
> +#define RXRSS0R_RXSUC			BIT(25)
> +#define RXRSS0R_DT			GENMASK(21, 16)
> +#define RXRSS0R_DATA1			GENMASK(15, 8)
> +#define RXRSS0R_DATA0			GENMASK(7, 0)
> +#define RXRSS0R_WC			GENMASK(15, 0) /* Word count for long packet. */
> +
>  /* Clock Lane Stop Time Set Register */
>  #define CLSTPTSETR			0x314
>  #define CLSTPTSETR_CLKKPT(x)		((x) << 24)
> @@ -148,4 +158,50 @@
>  #define VICH1HPSETR_HFP(x)		(((x) & 0x1fff) << 16)
>  #define VICH1HPSETR_HBP(x)		(((x) & 0x1fff) << 0)
>=20
> +/* Sequence Channel 0 Set 0 Register */
> +#define SQCH0SET0R			0x5c0
> +#define SQCH0SET0R_START		BIT(0)
> +
> +/* Sequence Channel 0 Set 1 Register */
> +#define SQCH0SET1R			0x5c4

Unused. Drop it.

> +
> +/* Sequence Channel 0 Status Register */
> +#define SQCH0SR				0x5d0
> +#define SQCH0SR_RUNNING			BIT(2)
Unused

> +#define SQCH0SR_ADESFIN			BIT(8)
> +
> +/* Sequence Channel 0 Status Clear Register */
> +#define SQCH0SCR			0x5d4
> +#define SQCH0SCR_ADESFIN		BIT(8)
> +
> +/* Sequence Channel 0 Descriptor 0-A Register */
> +#define SQCH0DSC0AR			0x780
> +#define SQCH0DSC0AR_NXACT_TERM		0
> +#define SQCH0DSC0AR_NXACT_OPER		BIT(28)
Unused

> +#define SQCH0DSC0AR_BTA			GENMASK(27, 26)
> +#define SQCH0DSC0AR_BTA_NONE		0
> +#define SQCH0DSC0AR_BTA_NON_READ	1
> +#define SQCH0DSC0AR_BTA_READ		2
> +#define SQCH0DSC0AR_BTA_ONLY		3
> +#define SQCH0DSC0AR_SPD_HIGH		0
> +#define SQCH0DSC0AR_SPD_LOW		BIT(25)
> +#define SQCH0DSC0AR_FMT_SHORT		0
> +#define SQCH0DSC0AR_FMT_LONG		BIT(24)
> +#define SQCH0DSC0AR_DT			GENMASK(21, 16)
> +#define SQCH0DSC0AR_DATA1		GENMASK(15, 8)
> +#define SQCH0DSC0AR_DATA0		GENMASK(7, 0)
> +
> +/* Sequence Channel 0 Descriptor 0-B Register */
> +#define SQCH0DSC0BR			0x784
> +#define SQCH0DSC0BR_DTSEL_PAYLOAD_DR	0	/* Use packet payload data regist=
er */
Unused

> +#define SQCH0DSC0BR_DTSEL_MEM_SPACE	BIT(24)	/* Use external memory */
> +
> +/* Sequence Channel 0 Descriptor 0-C Register */
> +#define SQCH0DSC0CR			0x788
> +#define SQCH0DSC0CR_FINACT		BIT(0)
> +#define SQCH0DSC0CR_AUXOP		BIT(22)
Unused

> +
> +/* Sequence Channel 0 Descriptor 0-D Register */
> +#define SQCH0DSC0DR			0x78c
> +

Cheers,
Biju

>  #endif /* __RZG2L_MIPI_DSI_REGS_H__ */
> --
> 2.39.5

