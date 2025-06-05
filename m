Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14089ACEBA7
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 10:19:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A244D10E9CB;
	Thu,  5 Jun 2025 08:19:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="IXkFA4UF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010005.outbound.protection.outlook.com [52.101.228.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E9910E9CB
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 08:19:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t2msjPFDqaHfkTHQFNLz1ysrLaovTAhIwDGSjctFHB5sRoHkjmpHOLNq5lU7fY0fn7bhpCN89VVWNi97D9eyGN0ZQeM0QVt4GFG+syD/RWiT8+ixeT6lq+1K1E960/ACMHoGNS8Zl22kgO69bkRaLPRp8p2XXAdpX1/tHTJATCRqj1QvCbY0KImlJTcJEPWmP7qIfC4CD3d/vADYyUS+aJqG84DMOvlR52d9g4az0dF/dWsOWbD9L/siAtH6fJsje09duagPOUPVIP7up4SBW/mCbGRUYIIG9vimzy5qtkZ80YQ+eBotl85Y4QsJ6ox5ZyjsTfxmSw+KGXQrTgSJlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3jBjFjX4HYcr8QFXJLo4V1SV+EJi0j6QHFG2GRBUUjk=;
 b=dJjqYbLVvdBCeexjp3RDeJFee3HYrYxig9QUVrBnPZ2rYs4K9fvnBi20yIZPq9zqYuzL6fJCnN3VOZT45tOzYgQEWJWO7y/7nMqrztnU2I/xkJvlSNmEkIjy1MPwgoEyaLKGllMXtPoMjBHF7cxXfyVVUADUogVW/iwTwdeM89aGuEuvL8q0OlBjpGNMgHyGgSQDN8xQZmtAJJVgSeeSvASRSfksYDFcjPq14HwvJW4gc+sgf34KvSY9Tr+HQyLPMfEytqcQe9o8VhPZkQqsVVSi/HxCtrFFLlTslUop74gdZLJY6YXvAJeUQ17AcmcYh8WyayBf5x8qc+sEB4Jk0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3jBjFjX4HYcr8QFXJLo4V1SV+EJi0j6QHFG2GRBUUjk=;
 b=IXkFA4UFn/HKczRD/QNsW5s0dqqumlWCQ33yNhGPGyCO+arXsJr9LqV0WXQ417dnlCmO9Z5lqsVVFQw4jAgy8Q7eEWvX+ir6AJGoln9LWIsXgsS7d9aWTqfvX6FGmJqYM73QG72j451xG5RDIoiKbcmlRe+5kOYSlMXTMLEDtao=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSOPR01MB12426.jpnprd01.prod.outlook.com (2603:1096:604:2d6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Thu, 5 Jun
 2025 08:19:00 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8813.020; Thu, 5 Jun 2025
 08:18:57 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Hugo Villeneuve <hugo@hugovil.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Brandt
 <Chris.Brandt@renesas.com>, Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: RE: [PATCH v4 1/1] drm: renesas: rz-du: Implement MIPI DSI host
 transfers
Thread-Topic: [PATCH v4 1/1] drm: renesas: rz-du: Implement MIPI DSI host
 transfers
Thread-Index: AQHb1WCzl1fRJdT/dU2ZQy26h5cCr7P0NxoQ
Date: Thu, 5 Jun 2025 08:18:57 +0000
Message-ID: <TY3PR01MB11346884D4BBC705AB64801B0866FA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250604145306.1170676-1-hugo@hugovil.com>
 <20250604145306.1170676-2-hugo@hugovil.com>
In-Reply-To: <20250604145306.1170676-2-hugo@hugovil.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSOPR01MB12426:EE_
x-ms-office365-filtering-correlation-id: 81187f79-d17f-488a-e6bc-08dda4099e48
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?/3nrWms2WUkairXXLnCX3eQES9YE6QusrwTbfuzKMQjxPKHmX6suXlFJaF48?=
 =?us-ascii?Q?EnMFa96ifuDOtzo/Kr/TLTKoybWWeLr7diJf4CiP8Yx+YvGRG+z2xXVIGMDV?=
 =?us-ascii?Q?maNVf1imG2uGzzMfiAIfhqKz70BlROSEgUx5qkSX74dHa6+1YalIs0f5Zv3b?=
 =?us-ascii?Q?r8rGv8E+G2dUh/h2Om7yvoX8CBMIXxwqmz6bRJzRO8sdnRK0thfQAdBKhY+T?=
 =?us-ascii?Q?81wKS8IKHYFCKj0JMCEbhVfBbXO3qMttIKVe/08KvVS5Hei+6znHJKfFR0o1?=
 =?us-ascii?Q?9v1GWD7YdKXmKvj6HRGN6VIwrf+RvoW8jIcR/snGzFLb6pQnBO8b4JpOlpSh?=
 =?us-ascii?Q?CjJ37Lh5vqzRTjuYfJkxVaAcgL1RduxunChLR0FXUnJQNVwwwkQqbhbVoUhn?=
 =?us-ascii?Q?xS4m8L7EcHZZW9OaJ1QQlPC677RXcyeuRcBZQbZsT94rO2UPyikIF+6X1iV+?=
 =?us-ascii?Q?D37zCXyo65SAlv5iNYwAZn6XUU5RIQ3XIGABj9Z9KDuPiiB71QTOKHW2JMEE?=
 =?us-ascii?Q?uJY9Glssgi/6Trhj/l/24vRBG/zVhvqQkVAjgEJ2N2coj6R/ZHeIkxdderRP?=
 =?us-ascii?Q?nGzb+j/bNSJPehfwHTf6wNMeAHs+rSgjSrrHuJo78NF/X/D7FkX7WFoqNU7I?=
 =?us-ascii?Q?C/wgbQxJ/N97QDYiVv0iSD4+NvtYBYLNpcLloP50YI3Tik530tc5aTSebau+?=
 =?us-ascii?Q?CBmdE7B8x35QsddRCRBjJspxU3+4jrH+8Q7jXcH/J6xUBcMWFCMv4O5jfWXu?=
 =?us-ascii?Q?NwuttTpo1K2m1jpqU9MlfCkN28f2O9V8+N7QEZYOteCKx8EzmI2qiAPqe95S?=
 =?us-ascii?Q?U8vx1WT8mu3rZfdA4sryQZl0yNRhMV9Yl5ltNaF1v6yp6bFLAFMPQvx2P4To?=
 =?us-ascii?Q?b86cb9cfokzl7zSOIgFcIsUOzEnOf0+YfvuavWNpZ0pNc1/aUt14bs3dYUqk?=
 =?us-ascii?Q?kxbzw18j0Sz14Li5WaV5g/daxpNLY7nPXbI2I+zSO8r5uqtp/alJ/IvMdMw9?=
 =?us-ascii?Q?tttehwrifIXugWGVe3kOH0rl9KqwF/2fBgKqKjelreN3P4hW5IbLWKWupguj?=
 =?us-ascii?Q?gX1oYbM0O9XisaTJSCbs82svGD7CtkFeAjA2d/bodEOJ84uoM6wvk8+CVudM?=
 =?us-ascii?Q?bQ1UmcZcvt6YGfayPYC4n8IIPCEt8I/Ju9T2BX2NIdJ5rwgZKYlgIBnYsxG2?=
 =?us-ascii?Q?iZ1gUmW2NfMIZKC6dyASzD9Gk9sV5Ktsx9doBU0Gpl4PEutEiqKqvspm5SDV?=
 =?us-ascii?Q?QmahOAs9HivJLTp2Pa+1A8m5rqTtM09babmoIoTf96Lu0a8E3Le4FWhg3Orj?=
 =?us-ascii?Q?dkbFCUSn5svLU3tUbAs20rTDXrxEagNr863JOkmeIfLraYr10IEyPr4p6oNY?=
 =?us-ascii?Q?rce34ButzG45yth9PuV1FtaCWMvN833FhT3MhrJjcGKrb8NOsYZ5cGfLtEy+?=
 =?us-ascii?Q?j6aD8XtDtYiyivYSnmL5N8+dbmPVO6O91RGwLTvCNMiO0B/rxpvBIZM4tjlw?=
 =?us-ascii?Q?2EMipEa8llvUkeo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FbSw+1xMcqbl+LVzkOeCARQH3d5zNNmpQUUiVhV0KPcIVGOi2Oe3Kdasl0Z9?=
 =?us-ascii?Q?YH37tnSbzUj3lQSiZeKdAtcDIWjcI8Uv/FPAqvRURgblT4+YJY88OnvkKpbQ?=
 =?us-ascii?Q?13/61WQnAKyVjzZWd6MF9646Nhb4aJ4oydcBfHOByzat1yTHQcPViqKeY9LO?=
 =?us-ascii?Q?xDJNCzI9RUbwUgOpoUwMJiJTpGdkHet1UJGDKdP8lAEzv9kPXXc6PqQG5w7w?=
 =?us-ascii?Q?7VfLxftFY8wDjj7pdtLX43ln/6FXlkUEXsqo1GPerFi3jI99jccr9FlkXIq8?=
 =?us-ascii?Q?Kg5PQ4klwABlz0ZlJtnS+e+PwMfffMGDz1QbUB6jUHJtHTugkrIOJk8si7QC?=
 =?us-ascii?Q?Vu2LCg6b79vtJV+QZ1TX2fvvfrCrAZrEu3qPO2GqIor1TB2UsQdKSrqb3KV8?=
 =?us-ascii?Q?Ntrq95KLTuuzvRGSLHZzLeh1KHIj8fHdPW875bGdjF/CEt+5ksyESeX6QTYm?=
 =?us-ascii?Q?gc1+2FwX8CXSLtHhk6BcRZDNXymF+lYbNzUaLe+lmK7z1ApHfrwmThYm9In9?=
 =?us-ascii?Q?w4xY+6DLJXN1CE9WPLI7Sc9tTSt4/uMP+a60shx5lXUid/2O4lHB0zdY9yj8?=
 =?us-ascii?Q?Tgi/F8HQOS0poAdnkeJqTzp5fYBfDanQBc9XXxFmcpW7XUyJJauKSiFQ9QmP?=
 =?us-ascii?Q?XONBcgsmMTWpvH2RfOqzcYQ83GCtE8l3EWGp0evtrli0opvnM/oQ0OxZCfL0?=
 =?us-ascii?Q?8BhNo1giPgnSKoXzXT4zOTwj1jkjgeA+xEMCZ/UOL60TvHWtp7mBT2n1nR8T?=
 =?us-ascii?Q?zAuuoYOSK3iFGH/OqTH05zZGzR0fJEsK3Q8kZGAw9ABE650ny+R0iGC2Yy36?=
 =?us-ascii?Q?rkHtiZIvqQQnYWXmdlIzpHlp+hqriQIigOQvXJUCEPSVPID6Tl2YfhliYj4I?=
 =?us-ascii?Q?AwmwCcJq6TyZcUgvoP7YkUiZoH7VV0R3/Ka7s1OV1Lptmn+hcNWR2xisj+aD?=
 =?us-ascii?Q?4OLLfLIDqBF82V1qAFAphegIzwUHv0sxzLWwOvqstyEd/lv+5JqlqWdf6h7D?=
 =?us-ascii?Q?COnC2AkRvw7yzSsEEt6x89di8M0WJh9QBJSkNXjxes8jK8/CmiSqkcz2O9KY?=
 =?us-ascii?Q?wi227WqCUcmbIoudmIXgwtdKrk0EnfgqLwUt75kWfAVMGLL9QEMP0NBIwE8x?=
 =?us-ascii?Q?Xe7hUfWJ1KXwnKsmDVX0d4gdcRW0SaHqOq77QZRRV8jS/RvNTRH1lzeVQh6p?=
 =?us-ascii?Q?2epc4wdz4emfL1ljH9zG79SkCbPi2WRXjQmqew8N3oA18SY92rmyM4AgKApe?=
 =?us-ascii?Q?Po0gmILhn1cy8T2/LvoqagrAyJSUjcZYfc19pVLcsEMtlb7s9jw5KYwqOBvP?=
 =?us-ascii?Q?R4DryYFx8kuZlFihzEta5wDVBo6io6P+KK5Js4lw6pyMYgO4oavNr/cVH8MH?=
 =?us-ascii?Q?kLYfJTLt79WwQd0I/bNT2nCR+Fz6HjRCI2YETsHStYD7dMDclJ6gRsasPufB?=
 =?us-ascii?Q?7WwnYhDroi/jDXElNxeMitNAlds9c7NSDxq6QCmIhtRnzxg7dwjBClPm4PhM?=
 =?us-ascii?Q?kAtuj7bxzZHm+seBGnmASODzCXgkUKyqTys8ab8J4mCB98aTTaaqWtQzeIWQ?=
 =?us-ascii?Q?/vCdmV3w9kooKS4ORmoZtKHkEMbJFieZMMp9E/xa?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81187f79-d17f-488a-e6bc-08dda4099e48
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2025 08:18:57.3462 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EztxGIg9dLRP0nDjtlBAhBHtdQDjX6YeWGzfM9oE2HpfVvsSfA0QU6kvk6L9LpPI9QLUonLjGeqQuym0c7LXmUDgjPQ0fcrO5wFGNX3alp4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB12426
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

> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Hu=
go Villeneuve
> Sent: 04 June 2025 15:53
> Subject: [PATCH v4 1/1] drm: renesas: rz-du: Implement MIPI DSI host tran=
sfers
>=20
> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
>=20
> Add support for sending MIPI DSI command packets from the host to a perip=
heral. This is required for
> panels that need configuration before they accept video data.
>=20
> Also for long reads to work properly, set DCS maximum return packet size =
to the value of the DMA
> buffer size.
>=20
> Based on Renesas Linux kernel v5.10 repos [1].
>=20
> Link: https://github.com/renesas-rz/rz_linux-cip.git
> Cc: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

FYI, Checkpatch is complaining about duplicate signature.
I can fix this while applying,if there are no more comments for this patch.

I am seeing below duplicate tags with your patch now.

Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>                  =
     =20
Tested-by: Chris Brandt <Chris.Brandt@renesas.com>                         =
     =20
Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com> =20

$ scripts/checkpatch.pl --strict 0001-drm-renesas-rz-du-Implement-MIPI-DSI-=
host-transfers.patch=20
WARNING: Duplicate signature
#19:=20
Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>

total: 0 errors, 1 warnings, 0 checks, 306 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
      mechanically convert to the typical style using --fix or --fix-inplac=
e.

0001-drm-renesas-rz-du-Implement-MIPI-DSI-host-transfers.patch has style pr=
oblems, please review.

NOTE: If any of the errors are false positives, please report
      them to the maintainer, see CHECKPATCH in MAINTAINERS.


> ---
>  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 186 ++++++++++++++++++
>  .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  54 +++++
>  2 files changed, 240 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu=
/drm/renesas/rz-
> du/rzg2l_mipi_dsi.c
> index 91e1a9adad7d6..50ec109aa6ed3 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -4,8 +4,11 @@
>   *
>   * Copyright (C) 2022 Renesas Electronics Corporation
>   */
> +

Normally, changes like this should reflect in commit message.

Cheers,
Biju

> +#include <linux/bitfield.h>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
> +#include <linux/dma-mapping.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
>  #include <linux/module.h>
> @@ -23,9 +26,12 @@
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
> @@ -44,6 +50,10 @@ struct rzg2l_mipi_dsi {
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
> @@ -267,6 +277,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_d=
si *dsi,
>  	u32 clkbfht;
>  	u32 clkstpt;
>  	u32 golpbkt;
> +	u32 dsisetr;
>  	int ret;
>=20
>  	/*
> @@ -328,6 +339,15 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_=
dsi *dsi,
>  	lptrnstsetr =3D LPTRNSTSETR_GOLPBKT(golpbkt);
>  	rzg2l_mipi_dsi_link_write(dsi, LPTRNSTSETR, lptrnstsetr);
>=20
> +	/*
> +	 * Increase MRPSZ as the default value of 1 will result in long read
> +	 * commands payload not being saved to memory.
> +	 */
> +	dsisetr =3D rzg2l_mipi_dsi_link_read(dsi, DSISETR);
> +	dsisetr &=3D ~DSISETR_MRPSZ;
> +	dsisetr |=3D FIELD_PREP(DSISETR_MRPSZ, RZG2L_DCS_BUF_SIZE);
> +	rzg2l_mipi_dsi_link_write(dsi, DSISETR, dsisetr);
> +
>  	return 0;
>=20
>  err_phy:
> @@ -659,9 +679,168 @@ static int rzg2l_mipi_dsi_host_detach(struct mipi_d=
si_host *host,
>  	return 0;
>  }
>=20
> +static ssize_t rzg2l_mipi_dsi_read_response(struct rzg2l_mipi_dsi *dsi,
> +					    const struct mipi_dsi_msg *msg) {
> +	u8 *msg_rx =3D msg->rx_buf;
> +	u8 datatype;
> +	u32 result;
> +	u16 size;
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
> @@ -779,6 +958,11 @@ static int rzg2l_mipi_dsi_probe(struct platform_devi=
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
> @@ -793,6 +977,8 @@ static void rzg2l_mipi_dsi_remove(struct platform_dev=
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
> index 1dbc16ec64a4b..26d8a37ee6351 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
> @@ -81,6 +81,20 @@
>  #define RSTSR_SWRSTLP			(1 << 1)
>  #define RSTSR_SWRSTHS			(1 << 0)
>=20
> +/* DSI Set Register */
> +#define DSISETR				0x120
> +#define DSISETR_MRPSZ			GENMASK(15, 0)
> +
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
> @@ -148,4 +162,44 @@
>  #define VICH1HPSETR_HFP(x)		(((x) & 0x1fff) << 16)
>  #define VICH1HPSETR_HBP(x)		(((x) & 0x1fff) << 0)
>=20
> +/* Sequence Channel 0 Set 0 Register */
> +#define SQCH0SET0R			0x5c0
> +#define SQCH0SET0R_START		BIT(0)
> +
> +/* Sequence Channel 0 Status Register */
> +#define SQCH0SR				0x5d0
> +#define SQCH0SR_ADESFIN			BIT(8)
> +
> +/* Sequence Channel 0 Status Clear Register */
> +#define SQCH0SCR			0x5d4
> +#define SQCH0SCR_ADESFIN		BIT(8)
> +
> +/* Sequence Channel 0 Descriptor 0-A Register */
> +#define SQCH0DSC0AR			0x780
> +#define SQCH0DSC0AR_NXACT_TERM		0	/* Bit 28 */
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
> +#define SQCH0DSC0BR_DTSEL_MEM_SPACE	BIT(24)	/* Use external memory */
> +
> +/* Sequence Channel 0 Descriptor 0-C Register */
> +#define SQCH0DSC0CR			0x788
> +#define SQCH0DSC0CR_FINACT		BIT(0)
> +#define SQCH0DSC0CR_AUXOP		BIT(22)
> +
> +/* Sequence Channel 0 Descriptor 0-D Register */
> +#define SQCH0DSC0DR			0x78c
> +
>  #endif /* __RZG2L_MIPI_DSI_REGS_H__ */
> --
> 2.39.5

