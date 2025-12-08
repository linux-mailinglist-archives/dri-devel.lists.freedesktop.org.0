Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F08CAC5E8
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 08:37:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A7AF10E3A9;
	Mon,  8 Dec 2025 07:37:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=analogixsemi.com header.i=@analogixsemi.com header.b="O3+6SsJf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11020102.outbound.protection.outlook.com
 [52.101.193.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD2810E3A9
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 07:37:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DRXXi44TR7hhsZL6a2YKFOKBqtcSO3TPZKy+gc9GQIvwiI71pTnXv/DR0DWeb/eepXMagWGl6j6ncdIzT1yvYZ+zjkN1DnryGcwGDDPBN9/JrYZH2JOZdTdNS3R2Wlbpj9jqTqSJ9tzLp6e4HLKwoGEFHIBi5OI7GmwRcuC1Iib8ncCz7TwTvtlU7OHX4ZXA9eYze0ZDYcPsqTYWx6kbt4WddMmdisttlUHHlNV+9JUJpNSAaUaz94wj64WYYP+aAa/H63wbujnLmUoezNYR3cN40XxqwM6irjkYMN+OAez4UO9YZAaJS3Hpy45Npkr/50Lz65q/0AlmhqKcbZOcGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FM6MkPjoQ2kp8kRjgvQqWnYQJJz+3tVXmV4xZDYBuEg=;
 b=nXyz0nN8SMhn8JHS8RabunHl3Ynkz0ZrsVKNbD0yqsL96qkiHueGerCwunE3WfupokHYteksluS+quJ6UsToq+RbfGCyfD7wGE3jEA6FceoWVLIO8TCEBvC0quv3kRIgHiHUaRdBgjapPiSg3Bey2VUTC20yHzKXZCgGeR6VpDvCQMHhqkn6ra53DC7kHbsimtyRIAxTxGa3EE/SjjOvmoxUUW+WYFWoTk+xB6vKT92OdeHZK3sV8zNu777fdKLi6YzIb5PGghu2FoAV8Zr49H5eiJ+ZvA6sXYD/k57iPsCtUFKUQde/+4d78RkpC6v4jI/xvjSg7XXfuLuL96weYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analogixsemi.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FM6MkPjoQ2kp8kRjgvQqWnYQJJz+3tVXmV4xZDYBuEg=;
 b=O3+6SsJfByTL0EX7q+1Q0S4FPgpduyhnBAjxDCOzTpaN3RiOYnpEIrV9v+I8wPRhumpFl+nxn1ILM9w1o0aMx/ljE9dYRGCDo+QcJ+vUmzgij1QzR+SqRjyV+qd6ffhCFdqAG0TzYQeYHoZIJs/mzg1G3F9UsgWnP2SdGzxdARc=
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6488.namprd04.prod.outlook.com (2603:10b6:a03:1d1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 07:37:30 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::d0a9:7455:cb02:ca08]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::d0a9:7455:cb02:ca08%4]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 07:37:30 +0000
From: Xin Ji <xji@analogixsemi.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>
CC: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH RFC 2/2] drm: bridge: anx7625: implement minimal Type-C
 support
Thread-Topic: [PATCH RFC 2/2] drm: bridge: anx7625: implement minimal Type-C
 support
Thread-Index: AQHcXrjt6airW14k7Eq2XOw6vcl4hLURgpQAgAXoBbA=
Date: Mon, 8 Dec 2025 07:37:30 +0000
Message-ID: <BY5PR04MB673939B585B2419534D48E77C7A2A@BY5PR04MB6739.namprd04.prod.outlook.com>
References: <20251126-anx7625-typec-v1-0-22b30f846a88@oss.qualcomm.com>
 <20251126-anx7625-typec-v1-2-22b30f846a88@oss.qualcomm.com>
 <aTGJXAnlkK5vQTzk@kuha>
In-Reply-To: <aTGJXAnlkK5vQTzk@kuha>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR04MB6739:EE_|BY5PR04MB6488:EE_
x-ms-office365-filtering-correlation-id: 1d47cf60-f2fb-4896-96c1-08de362ca4b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7416014|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?IAnJjImTCR/8WCSTRuYPWjDvcyC9Jg9TpKmpxejNgENoK2CpDjGsCQL5z63e?=
 =?us-ascii?Q?AgI5ieAhKTQsY8IbON9zxShWCBbzeaSaEih69ozFjQqNhTkWzGzWTvqgGdl8?=
 =?us-ascii?Q?u20XSwFCoQ1w3VbX3wxht6NfzwhmFWNU+3V+9RDxQfU6gTzMDtxAa93J+uyp?=
 =?us-ascii?Q?A46Tp63WjklLL9uMjqtNuipnsc1l67Ov1AiQ3m0h2PstW1UnNpafTT6DCm1G?=
 =?us-ascii?Q?6ryIPPIjmTDjO0MIBxSt5R//2Zu525OwIBEGmWMlsw1npn31W9ibGRVkFRqX?=
 =?us-ascii?Q?uQuTLZqhrRfv5N6lr4p4YEtOQ9UBROehZpHg2qkUGWTg/h3iVSTh5qKwkEik?=
 =?us-ascii?Q?fyQM158t4VomI2wpyjP39ASQW6ayF5kJv2RKaArAc6azWUVrI00rE4TM+7yC?=
 =?us-ascii?Q?yDsaEncEPI1RVoW/alV2Z91CCREtvlp+uH1jajg0iaI0W40meK6obGq4qzmk?=
 =?us-ascii?Q?Tlwp+1o6EBEE9Ygr7ZiBfo9pra3pHz8L0UgsKTpOUO47JnjAUl1+uGkXH7Qp?=
 =?us-ascii?Q?IUhRVZ9ws7ArEV3cso3tHQfADJVUIIA51hAE9Y0xZ9o6uVRYem6QxHbLdd5O?=
 =?us-ascii?Q?Hl6D3cmqKbcEQb9/taFOMqIF9V9w09ZYKzmiAxZ4BpYIM98lXO0J6M/GZjdK?=
 =?us-ascii?Q?opIq/GRXl8mbQ7luuLCv2eMlKBuFR+3KB7zxC9aotD0bO6HPjsErpdh1gcHm?=
 =?us-ascii?Q?JiOCNIhZyzohLRvSK2KHqcOTL3fTSawCveJwPfdG0nwkcAowd1tr4BcbNKQj?=
 =?us-ascii?Q?PTmy7EWR9eO2G9b8IFcg1qzgJBOC8XebPGPuwKIaLUjUUTywWtrNm9MBMYJw?=
 =?us-ascii?Q?Nl6jc2V1ZgN9pNA4TmhNqv9uWXIcSSJKoyQr5I5l+JnSUX9fefotg4qjEoOt?=
 =?us-ascii?Q?DOlWh1RYlDtkswMNyzfj38/wyM/7GmMRQYQOkLqZ+2Sg95UFk3MC9ntvkHlQ?=
 =?us-ascii?Q?iPUf8fpsUNzbOmN697A1JnzrLuY2exeK1S02X4evaviGsPGWFRtMp/YupiU5?=
 =?us-ascii?Q?/kd32u7eLCMnFj+CBbd618kmSsxreR7eQmgEqhVb2l66IqnVuyGrZBfFweAp?=
 =?us-ascii?Q?Gt3YQt38ypVcLyU2TyXfU2R0PICktUHU+2h1TneWzyx4e6ZZcw/wuXrH4lwK?=
 =?us-ascii?Q?tEepC0CcD1T7hVpiZDqk2RdCKcoM4rKGby5ZMLgJH5Xoh2SuAPzuwYuWwWdK?=
 =?us-ascii?Q?K78KTf7GEuaGFhPPY1/ZMcpqcl/cTSrvThHWXMa14R0SjwQyHjyg94Itt96H?=
 =?us-ascii?Q?FJNz7Kghr6bR2qkC8Q67gRhFXYzGH5/o5o4Cj6OORDSMw0Wvy4IYZF7gLA7o?=
 =?us-ascii?Q?1SIRSB+VSmTqjdx5fG9u/ihKVE6uq319lCQYeafK18dupiekK93rCGNVa8H4?=
 =?us-ascii?Q?o92gV7qfRjj94cHoO+pzNbzlHYuUjB/TufOvxQ/wrE1szXDudgo9ENv/Ji1x?=
 =?us-ascii?Q?AKJXXdQroa2MgeGHfYJVFKOGMrbt97mN?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700021); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?midMdQGzP9q44gMkOxnG9CAxdPXU5WPhl5ZCjnX8XKonwpGSDKymk3JWBAfW?=
 =?us-ascii?Q?LqdKkElCGBBp32MxsR32ybDeRi9ea6iqAXV3bMCPz56t99FTd581DQJRpLMW?=
 =?us-ascii?Q?n0Ix0HW/24iXp+bG/yeAZ+bJdZjLkKLGXGmiiUxLCQWuwAoOaLMIMNw61ruP?=
 =?us-ascii?Q?muihii6J5ilLfsln0GZSvkYlpS5Tw6HkVD0jRKCnIC3VwPsUvlqGU13Lc4ql?=
 =?us-ascii?Q?MhE1nfe7CCandIk5nA5nNmenpCdBv48yH1OTSLKGQir3KUGbFx6tO/Afglxv?=
 =?us-ascii?Q?9EVvRm5bx96MycvHM91UbQFD96zTnR+x8fm161YeJWbHsDiV0/9owcR9AQWm?=
 =?us-ascii?Q?OW22yafMixw8gZNp1mgzx6EM0cQ2xFcJq7yHDdVlW6jAv+LuvuxjeHoF3Ih4?=
 =?us-ascii?Q?bZe/msi3UKrNPqEkyKRNU0tV96rkclhq6LmFU+Zh3Pb1hnacnZ6vOmURi4Pr?=
 =?us-ascii?Q?y3InhsTEj8oaDHinbOgcKERYdMW0EHVhF0EtGmg3kbJkL2gPg1P6ERVEKM3r?=
 =?us-ascii?Q?xFDrFZ1xXcmw8o4Z/vPGrWnvj5wisI2NpDPiTTSnkldnum0KrmN0Sic/gw8l?=
 =?us-ascii?Q?RYk1tv8K3gnFOW175JGHhEbrDRAxJT6RmgTtd7j9fh4hHrqlJXbmlGJOtujQ?=
 =?us-ascii?Q?jwLLODx0iSnEQkkmb2tEwoWWgf6xR7LrB5W0SP1eJPobbZI2bpeaA3Zn6fkb?=
 =?us-ascii?Q?IxbIoRXeoFQuzOAPAqa/nF5bX++798jRUDZRoeCuL/sr68jHYC2mJYRDMsnf?=
 =?us-ascii?Q?t0un6SzIK9u1MY4DQ4g19rcErCMfPodCBV6b8tKYA8SBWtnV5VZKcbyeXUlA?=
 =?us-ascii?Q?Zx+EURJ7FCVWrNp4lIwS/QWVCCm6vzP0meeG8M3d+ex21eZ1SpuBETAFa0QH?=
 =?us-ascii?Q?6MWOiKB8Jb06MfcikhITVNPI+M9iQGxKh1tqjSrdA5QSz+qHoy6nvA0SUTwo?=
 =?us-ascii?Q?h65ZnGAaBf8zLOMNTuakw3sMmIWga7K49g8JwfwloqImR6zuRskGseroGiv1?=
 =?us-ascii?Q?mwF4dcD1kL9flUOI7D0FcYWmmQcBN2CjMp+gOv7ohYkt8nzLATQCfNfA69qC?=
 =?us-ascii?Q?kc9jDoFVF8NH6b+1T3D5UghfJtAaobgqnhUlZnfA0qPqKs+GWO3+ifaG7K4I?=
 =?us-ascii?Q?dOTVLsxaiJMABh4n7D8WaJl9s8rR4i9hVRmUvMKcuFthqSNGiFnkIEudyXWQ?=
 =?us-ascii?Q?vwCjuZNmq38OR6t1s60Inxk3MOYI+td8fNGw83wV365+FCpbCOMmmTXMCp7e?=
 =?us-ascii?Q?Njdqn4hSYR6RRyKTfNN85Zl6aK+l2lrscCnRv1/B+lbUymuWAauv/pn1GlAz?=
 =?us-ascii?Q?lUaLXdK/DRfbkf1UHMyXkBp5mZW7tq9zGI5CRj9vaFEkVoGOwcao/LWsnlPP?=
 =?us-ascii?Q?4d+jhfE9hHBNjQuBdHeD5/rfxT4vAxYmVt2GBvzNvmC8M+mAotM3EhBMCO51?=
 =?us-ascii?Q?qdJbSyY1CvcK2x+jInXyf2PUsyeHm0X6dSNLFXPKQyv/24V7E4ZAMGcgT3A+?=
 =?us-ascii?Q?pvvKu+ZGyv2OpJYy37ABtWhe43Tn1zSxGKdATAwpp/zAhl/pg0sNuzDNesiS?=
 =?us-ascii?Q?ZNuTivLp2AYPUz9hxOfYWf+grwqrNV1zUP0oUCCj?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d47cf60-f2fb-4896-96c1-08de362ca4b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2025 07:37:30.2733 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 43Pg+LcM88ZVdGwOdwwV5/DnF90gvtaSJkGjHW3FkvVG6cDbykpsSHJdcHTfSz9KYizKOINBaduOS7B4yBoQVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6488
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

Hi Dmitry, I found there is another patch "Register USB Type-C mode switche=
s" which provided by Pin-yen Lin <treapking@chromium.org>, but I didn't fin=
d it in the v6.18, is it obsolete?.
https://patchew.org/linux/20221124102056.393220-1-treapking@chromium.org/20=
221124102056.393220-6-treapking@chromium.org/

Thanks,
Xin


> ANX7625 can be used as a USB-C controller, handling USB and DP data=20
> streams. Provide minimal Type-C support necessary for ANX7625 to=20
> register the Type-C port device and properly respond to data / power=20
> role events from the Type-C partner.
>=20
> While ANX7625 provides TCPCI interface, using it would circumvent the=20
> on-chip running firmware. Analogix recommended using the higher-level=20
> interface instead of TCPCI.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

FWIW:

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/gpu/drm/bridge/analogix/Kconfig   |   1 +
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 163=20
> ++++++++++++++++++++++++++++-- =20
> drivers/gpu/drm/bridge/analogix/anx7625.h |  21 +++-
>  3 files changed, 175 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/analogix/Kconfig=20
> b/drivers/gpu/drm/bridge/analogix/Kconfig
> index=20
> 4846b2e9be7c2a5da18f6a3cdec53ef5766455e0..f3448b0631fea42e7e7ab1036877
> 7a93ce33cee7 100644
> --- a/drivers/gpu/drm/bridge/analogix/Kconfig
> +++ b/drivers/gpu/drm/bridge/analogix/Kconfig
> @@ -34,6 +34,7 @@ config DRM_ANALOGIX_ANX7625
>  	tristate "Analogix Anx7625 MIPI to DP interface support"
>  	depends on DRM
>  	depends on OF
> +	depends on TYPEC || !TYPEC
>  	select DRM_DISPLAY_DP_HELPER
>  	select DRM_DISPLAY_HDCP_HELPER
>  	select DRM_DISPLAY_HELPER
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c=20
> b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index=20
> 6f3fdcb6afdb9d785bc4515300676cf3988c5807..a44405db739669dfd2907b0afd41
> 293a7b173035 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -3,6 +3,7 @@
>   * Copyright(c) 2020, Analogix Semiconductor. All rights reserved.
>   *
>   */
> +#include <linux/cleanup.h>
>  #include <linux/gcd.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/i2c.h>
> @@ -15,6 +16,9 @@
>  #include <linux/regulator/consumer.h>  #include <linux/slab.h> =20
> #include <linux/types.h>
> +#include <linux/usb.h>
> +#include <linux/usb/pd.h>
> +#include <linux/usb/role.h>
>  #include <linux/workqueue.h>
> =20
>  #include <linux/of_graph.h>
> @@ -1325,7 +1329,7 @@ static int=20
> anx7625_read_hpd_gpio_config_status(struct anx7625_data *ctx)  static=20
> void anx7625_disable_pd_protocol(struct anx7625_data *ctx)  {
>  	struct device *dev =3D ctx->dev;
> -	int ret, val;
> +	int ret;
> =20
>  	/* Reset main ocm */
>  	ret =3D anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, 0x88, 0x40); @@=20
> -1339,6 +1343,11 @@ static void anx7625_disable_pd_protocol(struct anx762=
5_data *ctx)
>  		DRM_DEV_DEBUG_DRIVER(dev, "disable PD feature fail.\n");
>  	else
>  		DRM_DEV_DEBUG_DRIVER(dev, "disable PD feature succeeded.\n");
> +}
> +
> +static void anx7625_configure_hpd(struct anx7625_data *ctx) {
> +	int val;
> =20
>  	/*
>  	 * Make sure the HPD GPIO already be configured after OCM release=20
> before @@ -1369,7 +1378,9 @@ static int anx7625_ocm_loading_check(struct =
anx7625_data *ctx)
>  	if ((ret & FLASH_LOAD_STA_CHK) !=3D FLASH_LOAD_STA_CHK)
>  		return -ENODEV;
> =20
> -	anx7625_disable_pd_protocol(ctx);
> +	if (!ctx->typec_port)
> +		anx7625_disable_pd_protocol(ctx);
> +	anx7625_configure_hpd(ctx);
> =20
>  	DRM_DEV_DEBUG_DRIVER(dev, "Firmware ver %02x%02x,",
>  			     anx7625_reg_read(ctx,
> @@ -1472,6 +1483,115 @@ static void anx7625_start_dp_work(struct anx7625_=
data *ctx)
>  	DRM_DEV_DEBUG_DRIVER(dev, "Secure OCM version=3D%02x\n", ret);  }
> =20
> +#if IS_REACHABLE(CONFIG_TYPEC)
> +static void anx7625_typec_set_orientation(struct anx7625_data *ctx) {
> +	u32 val =3D anx7625_reg_read(ctx, ctx->i2c.rx_p0_client,=20
> +SYSTEM_STSTUS);
> +
> +	if (val & (CC1_RP | CC1_RD))
> +		typec_set_orientation(ctx->typec_port, TYPEC_ORIENTATION_NORMAL);
> +	else if (val & (CC2_RP | CC2_RD))
> +		typec_set_orientation(ctx->typec_port, TYPEC_ORIENTATION_REVERSE);
> +	else
> +		typec_set_orientation(ctx->typec_port, TYPEC_ORIENTATION_NONE); }
> +
> +static void anx7625_typec_isr(struct anx7625_data *ctx,
> +			      unsigned int intr_vector,
> +			      unsigned int intr_status)
> +{
> +	if (intr_vector & CC_STATUS)
> +		anx7625_typec_set_orientation(ctx);
> +	if (intr_vector & DATA_ROLE_STATUS) {
> +		usb_role_switch_set_role(ctx->role_sw,
> +					 (intr_status & DATA_ROLE_STATUS) ?
> +					 USB_ROLE_HOST : USB_ROLE_DEVICE);
> +		typec_set_data_role(ctx->typec_port,
> +				    (intr_status & DATA_ROLE_STATUS) ?
> +				    TYPEC_HOST : TYPEC_DEVICE);
> +	}
> +	if (intr_vector & VBUS_STATUS)
> +		typec_set_pwr_role(ctx->typec_port,
> +				   (intr_status & VBUS_STATUS) ?
> +				   TYPEC_SOURCE : TYPEC_SINK);
> +	if (intr_vector & VCONN_STATUS)
> +		typec_set_vconn_role(ctx->typec_port,
> +				     (intr_status & VCONN_STATUS) ?
> +				     TYPEC_SOURCE : TYPEC_SINK);
> +}
> +
> +static int anx7625_typec_register(struct anx7625_data *ctx) {
> +	struct typec_capability typec_cap =3D { };
> +	struct fwnode_handle *fwnode __free(fwnode_handle) =3D NULL;
> +	u32 val;
> +	int ret;
> +
> +	fwnode =3D device_get_named_child_node(ctx->dev, "connector");
> +	if (!fwnode)
> +		return 0;
> +
> +	ret =3D typec_get_fw_cap(&typec_cap, fwnode);
> +	if (ret < 0)
> +		return ret;
> +
> +	typec_cap.revision =3D 0x0120;
> +	typec_cap.pd_revision =3D 0x0300;
> +	typec_cap.usb_capability =3D USB_CAPABILITY_USB2 | USB_CAPABILITY_USB3;
> +	typec_cap.orientation_aware =3D true;
> +
> +	typec_cap.driver_data =3D ctx;
> +
> +	ctx->typec_port =3D typec_register_port(ctx->dev, &typec_cap);
> +	if (IS_ERR(ctx->typec_port))
> +		return PTR_ERR(ctx->typec_port);
> +
> +	ctx->role_sw =3D fwnode_usb_role_switch_get(fwnode);
> +	if (IS_ERR(ctx->role_sw)) {
> +		typec_unregister_port(ctx->typec_port);
> +		return PTR_ERR(ctx->role_sw);
> +	}
> +
> +	val =3D anx7625_reg_read(ctx, ctx->i2c.rx_p0_client, SYSTEM_STSTUS);
> +	anx7625_typec_set_orientation(ctx);
> +	usb_role_switch_set_role(ctx->role_sw,
> +				 (val & DATA_ROLE_STATUS) ?
> +				 USB_ROLE_HOST : USB_ROLE_DEVICE);
> +	typec_set_data_role(ctx->typec_port,
> +			    (val & DATA_ROLE_STATUS) ?
> +			    TYPEC_HOST : TYPEC_DEVICE);
> +	typec_set_pwr_role(ctx->typec_port,
> +			    (val & VBUS_STATUS) ?
> +			    TYPEC_SOURCE : TYPEC_SINK);
> +	typec_set_vconn_role(ctx->typec_port,
> +			     (val & VCONN_STATUS) ?
> +			     TYPEC_SOURCE : TYPEC_SINK);
> +
> +	return 0;
> +}
> +
> +static void anx7625_typec_unregister(struct anx7625_data *ctx) {
> +	usb_role_switch_put(ctx->role_sw);
> +	typec_unregister_port(ctx->typec_port);
> +}
> +#else
> +static void anx7625_typec_isr(struct anx7625_data *ctx,
> +			      unsigned int intr_vector,
> +			      unsigned int intr_status)
> +{
> +}
> +
> +static int anx7625_typec_register(struct anx7625_data *ctx) {
> +	return 0;
> +}
> +
> +static void anx7625_typec_unregister(struct anx7625_data *ctx) { }=20
> +#endif
> +
>  static int anx7625_read_hpd_status_p0(struct anx7625_data *ctx)  {
>  	return anx7625_reg_read(ctx, ctx->i2c.rx_p0_client, SYSTEM_STSTUS);=20
> @@ -1566,7 +1686,7 @@ static void dp_hpd_change_handler(struct anx7625_da=
ta *ctx, bool on)
>  	}
>  }
> =20
> -static int anx7625_hpd_change_detect(struct anx7625_data *ctx)
> +static int anx7625_intr_status(struct anx7625_data *ctx)
>  {
>  	int intr_vector, status;
>  	struct device *dev =3D ctx->dev;
> @@ -1593,9 +1713,6 @@ static int anx7625_hpd_change_detect(struct anx7625=
_data *ctx)
>  		return status;
>  	}
> =20
> -	if (!(intr_vector & HPD_STATUS_CHANGE))
> -		return -ENOENT;
> -
>  	status =3D anx7625_reg_read(ctx, ctx->i2c.rx_p0_client,
>  				  SYSTEM_STSTUS);
>  	if (status < 0) {
> @@ -1604,6 +1721,12 @@ static int anx7625_hpd_change_detect(struct anx762=
5_data *ctx)
>  	}
> =20
>  	DRM_DEV_DEBUG_DRIVER(dev, "0x7e:0x45=3D%x\n", status);
> +
> +	anx7625_typec_isr(ctx, intr_vector, status);
> +
> +	if (!(intr_vector & HPD_STATUS))
> +		return -ENOENT;
> +
>  	dp_hpd_change_handler(ctx, status & HPD_STATUS);
> =20
>  	return 0;
> @@ -1622,7 +1745,7 @@ static void anx7625_work_func(struct work_struct *w=
ork)
>  		return;
>  	}
> =20
> -	event =3D anx7625_hpd_change_detect(ctx);
> +	event =3D anx7625_intr_status(ctx);
> =20
>  	mutex_unlock(&ctx->lock);
> =20
> @@ -2741,11 +2864,29 @@ static int anx7625_i2c_probe(struct i2c_client *c=
lient)
>  	}
> =20
>  	if (!platform->pdata.low_power_mode) {
> -		anx7625_disable_pd_protocol(platform);
> +		struct fwnode_handle *fwnode;
> +
> +		fwnode =3D device_get_named_child_node(dev, "connector");
> +		if (fwnode)
> +			fwnode_handle_put(fwnode);
> +		else
> +			anx7625_disable_pd_protocol(platform);
> +
> +		anx7625_configure_hpd(platform);
> +
>  		pm_runtime_get_sync(dev);
>  		_anx7625_hpd_polling(platform, 5000 * 100);
>  	}
> =20
> +	if (platform->pdata.intp_irq)
> +		anx7625_reg_write(platform, platform->i2c.rx_p0_client,
> +				  INTERFACE_CHANGE_INT_MASK, 0);
> +
> +	/* After getting runtime handle */
> +	ret =3D anx7625_typec_register(platform);
> +	if (ret)
> +		goto pm_suspend;
> +
>  	/* Add work function */
>  	if (platform->pdata.intp_irq) {
>  		enable_irq(platform->pdata.intp_irq);
> @@ -2759,6 +2900,10 @@ static int anx7625_i2c_probe(struct i2c_client=20
> *client)
> =20
>  	return 0;
> =20
> +pm_suspend:
> +	if (!platform->pdata.low_power_mode)
> +		pm_runtime_put_sync_suspend(&client->dev);
> +
>  free_wq:
>  	if (platform->workqueue)
>  		destroy_workqueue(platform->workqueue);
> @@ -2774,6 +2919,8 @@ static void anx7625_i2c_remove(struct i2c_client=20
> *client)  {
>  	struct anx7625_data *platform =3D i2c_get_clientdata(client);
> =20
> +	anx7625_typec_unregister(platform);
> +
>  	drm_bridge_remove(&platform->bridge);
> =20
>  	if (platform->pdata.intp_irq)
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h=20
> b/drivers/gpu/drm/bridge/analogix/anx7625.h
> index=20
> eb5580f1ab2f86b48b6f2df4fa4d6c3be603ad48..f9570cd6d22e55fd70a12c159607
> 14cbb783d059 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.h
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
> @@ -51,9 +51,21 @@
>  #define INTR_RECEIVED_MSG BIT(5)
> =20
>  #define SYSTEM_STSTUS 0x45
> +#define INTERFACE_CHANGE_INT_MASK 0x43
>  #define INTERFACE_CHANGE_INT 0x44
> -#define HPD_STATUS_CHANGE 0x80
> -#define HPD_STATUS 0x80
> +#define VCONN_STATUS	BIT(2)
> +#define VBUS_STATUS	BIT(3)
> +#define CC_STATUS	BIT(4)
> +#define DATA_ROLE_STATUS	BIT(5)
> +#define HPD_STATUS	BIT(7)
> +
> +#define NEW_CC_STATUS 0x46
> +#define CC1_RD                  BIT(0)
> +#define CC1_RA                  BIT(1)
> +#define CC1_RP			(BIT(2) | BIT(3))
> +#define CC2_RD                  BIT(4)
> +#define CC2_RA                  BIT(5)
> +#define CC2_RP			(BIT(6) | BIT(7))
> =20
>  /******** END of I2C Address 0x58 ********/
> =20
> @@ -447,9 +459,14 @@ struct anx7625_i2c_client {
>  	struct i2c_client *tcpc_client;
>  };
> =20
> +struct typec_port;
> +struct usb_role_switch;
> +
>  struct anx7625_data {
>  	struct anx7625_platform_data pdata;
>  	struct platform_device *audio_pdev;
> +	struct typec_port *typec_port;
> +	struct usb_role_switch *role_sw;
>  	int hpd_status;
>  	int hpd_high_cnt;
>  	int dp_en;
>=20
> --
> 2.47.3

--
heikki
