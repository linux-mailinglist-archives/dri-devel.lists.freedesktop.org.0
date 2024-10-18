Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F799A3778
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 09:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B6F710E8BE;
	Fri, 18 Oct 2024 07:43:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="l99FD/0t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011015.outbound.protection.outlook.com [52.101.125.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F43710E8BC
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 07:43:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EC7m2M02nE0Cqzl4rRtfVPyM3thrUsBvK7S7git3zGgOx4WIfmT8m9Pg0bX7I1KL+rlEdqlERGuxHLua0YmAzMdjgPGGTxopZU5gpBGgGBP7FXR8D52PkwcTp8GTsF7E6yA8uNWM8K9NTm+ItNz9bcJehNHvUviQYjibIEhpPQhOPZcszTwJGTi96uD5k33JGbfOaH9HGed1/GJrNW1KYPnVWcBIuXj5MUN4McbXW7nMGGv1EY6o50G1dVaz++70cLG7zRELFoCfinAX3Bm1bCAyda0hAs7QKFyx/DS0XZdjCuVW4pVUTeZVAXBv2DzuafWdpX1XsCyGK2NpUABCUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bRbAeANzDaphdKYZYuB7cIBINOl/iRCkwCp8owMO55I=;
 b=s+LvaoIkW6Yh5qBX7459p+1UBbwsdSeSO7sVg6RYAgi+YbaQV2Yl0Af/pfG2ZpbaStgip6yqjkDbfo9dG0ns/RJf6WFH9bfM7tLL4VADjbqda+T0vSY1lW+GOfF/P7L6W28ORuM474sGAJ/sIdZy4++k9gNpnZPo1Kg2Dk9YSs368R/Ox9SRGlFdy3C0jh5cQLq10a4hXdLGz9uboK3BXYSN594i+TJCOeZqgCh+Q6t66PX6UHULzTZJiIWXLB6TK45ZH02zu4MSGvn9xevSp9ozEJI5DHruqwtV5PtG1j2RkjYVJBL+HKnXxm2dbPBi0ZCYQMc014mhSGX9hDZ43Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bRbAeANzDaphdKYZYuB7cIBINOl/iRCkwCp8owMO55I=;
 b=l99FD/0thUXZPWuDysJ5vVfLVotcALEl0lD78Z33QT7Rr/cOAMUdys3Tc4JfSceUV/b4Tbz8170NckXiz7cq5ln6oQLLBrO3lrt1M4te9jlJ6RUC1FS1heo24jiuZf2yed+g+xSnN6jldH0apG7qyrDgNeMS17gKjgultQM0jTs=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by OS9PR01MB12325.jpnprd01.prod.outlook.com (2603:1096:604:2e7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Fri, 18 Oct
 2024 07:43:12 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%7]) with mapi id 15.20.8069.019; Fri, 18 Oct 2024
 07:43:12 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Liu Ying <victor.liu@nxp.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
 <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>, "andrzej.hajda@intel.com"
 <andrzej.hajda@intel.com>, "neil.armstrong@linaro.org"
 <neil.armstrong@linaro.org>, "rfoss@kernel.org" <rfoss@kernel.org>,
 laurent.pinchart <laurent.pinchart@ideasonboard.com>, "jonas@kwiboo.se"
 <jonas@kwiboo.se>, "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "marex@denx.de" <marex@denx.de>,
 "stefan@agner.ch" <stefan@agner.ch>, "dmitry.baryshkov@linaro.org"
 <dmitry.baryshkov@linaro.org>
Subject: RE: [PATCH 5/5] drm: lcdif: Use drm_bridge_connector
Thread-Topic: [PATCH 5/5] drm: lcdif: Use drm_bridge_connector
Thread-Index: AQHbISv3sPpwi6VcD0S7zRnbRJ8jF7KMHKyAgAACSICAAACQUA==
Date: Fri, 18 Oct 2024 07:43:12 +0000
Message-ID: <TYCPR01MB113322F56AC7B122218F2D90286402@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20241018064813.2750016-1-victor.liu@nxp.com>
 <20241018064813.2750016-6-victor.liu@nxp.com>
 <TYCPR01MB113325E42E2E31FB953B1CDF586402@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <bed0ee89-8a53-44bd-b531-edfc74438cd9@nxp.com>
In-Reply-To: <bed0ee89-8a53-44bd-b531-edfc74438cd9@nxp.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|OS9PR01MB12325:EE_
x-ms-office365-filtering-correlation-id: dc127f42-4696-4b38-9523-08dcef4884d6
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?ZmoxenNnTW1sSWFSZWh6a2kxRjVEVXYvd2g2aHBTOFZlamNEQ0Q0SlRMYms2?=
 =?utf-8?B?OG9pZ3RTYlNZejBESzNVNHlDcHJ0WjRPc3pQdDlxcTZxcXBDVGJQM250OFFW?=
 =?utf-8?B?SG4vSjNMbkE5QUlxM2xUTzZmOUJyZmJhcCtzOHJuRk4zdFhUZVRQcTMrK1VM?=
 =?utf-8?B?My82Z2xZZEZ3ckxLN0lJdTFsTVZwemswbXUzalpZdnR5dmM1T1IvQ1lSa2FT?=
 =?utf-8?B?MHlyUGNHc3pWcHQxYUtHR1NwZlZDVCsrWmtOMzZVRXpiMGJWZTVRcGx3eW1E?=
 =?utf-8?B?dXBOczZkU3Nmc3pqZFJBa051U2dXek5Rck5tUEx4UitRZUZXcWFLaDc0c0RP?=
 =?utf-8?B?NjBuaWFiTFZoSGV2bE90dHdqQXMyTnFIZXRrZDVhYjBPZzcySG9RM2hGdXlG?=
 =?utf-8?B?RzI5TmFsMmh2dWtYY1B5SG9RZ284eVdXeXpXOFF3eDFzTnVicFpmUVFXb09B?=
 =?utf-8?B?RzZwYXZHZmEwTDRXaGRrQlp2eFZpc1p3dE5aUWpkZkV5RjNOWTU2Ly8yeVdR?=
 =?utf-8?B?MEZ6ZXVhcFhlQnEzeDd1TmszSnJ6K3JJQUswMTJKVkVHQ2pjRjYrRk82ME5z?=
 =?utf-8?B?NTJPSXhuNUJmQ1FaV0JEVnNVbEFWMy94MVV3R09JbFRTU2p4eFg5Ry9KYy8x?=
 =?utf-8?B?dkdTOFltL0RSaTcwSG5DcFEvbUppWjVqTlNQTWx4NU1qMzAwdWc4eHFEaUlW?=
 =?utf-8?B?OGdGczBRRDhRNE5tSFdOeDdGcTJZSUNoUy9TVGhuT1lwaU9GV2FXNW9wd0dR?=
 =?utf-8?B?WFdkU3VRbmhqblZhYzlqNHF6d01wbWNHUkQ3MG9VUGhNNDB4bmFpWXlqR0Q3?=
 =?utf-8?B?S1lXSVVRa2lZQklBbzQvRUwxV3NQdWZnWnQ0MmVXNFNtSitnbEVJeW5IaEdh?=
 =?utf-8?B?Yno2a205bytEYmswUnE3RkI5T29PR0NYbVlrTlpaQ0ZyMytYZnhEWU1YWldu?=
 =?utf-8?B?RzhFRmx3YWcxTEluOXJ6M1MzM0hPdWY1MlcrdGora0FqT0NtNW9Nc1RJUjVR?=
 =?utf-8?B?eWxpWEhWOXE4aXo1ZWNyZUNmSm5pUlZKWVczSzFkVFhNaC9DR2ZYV3ZTSThm?=
 =?utf-8?B?c3R0QkI2aW50RnpGS2dlcmdBa3NRelBOeS9ENTNVY1plOTF4cEQ4TzhQNXBX?=
 =?utf-8?B?SFVNSDZwTGV4dFgzNzg0Ym1vVlVUNy96bzg2OUJUVzZwbVBYMXdFT2JKbmVz?=
 =?utf-8?B?ZkZmTDhybHROcWZsclk4YXkrLy9EOHNzdEU3QWl2MnBxcDdBbTRYOVM3dWY5?=
 =?utf-8?B?MHBEN29COWlta3RxUCs2SmRlY2s4RlJDbGJzRHZLZXFJYWZkZnpPNTNzWXBN?=
 =?utf-8?B?M3FaWitwMW5sSktEUGpJbmFpamdvejFnVUo5M3B2YVdCMjBqdysrSHhWblVP?=
 =?utf-8?B?M1NqYmVrRGhGNnJVOFVmL2tOUE1PNTRTOE9CYmdtZWNPd2tiMUpHck5iRUtB?=
 =?utf-8?B?YUdaRXFiTHFFRjRyRG45MTJPRjgxczQxVU5ka1dsOWtNUUNPenZMVzVTdDFB?=
 =?utf-8?B?eHZvbDRGemJ6dGJ2VEdXZm5PVnYrcXNaa0g2dGRKYTcyN2g5LzZmYzVaeTdp?=
 =?utf-8?B?bTBqVWx0R0EyTDhyc01SVTJFVnNmY28wU1Q1L1l5NWg1cjNKVHBoQUxxS0FT?=
 =?utf-8?B?SnBYekg0dlVzeElpMmZmOVVrRFRhWXpsaUYxVEhveXdNOC8wNU9xQmJCWStD?=
 =?utf-8?B?UUE0MkQwaXl5cW90QUpwS0VoL1dxYjdoNS9FTFRXUVpLdzFzUXZpNVpCUnZB?=
 =?utf-8?B?Z01pcXluendEZk9QSDBjamJrOE5yUGljek9ZWGt2amU3Z1A5cTg1N0luU29M?=
 =?utf-8?Q?JZXjz9WCTJEqfrHq1oQRFte20m055VsO7jvqQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11332.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OGZ0Um5ZQjRnaTY1UE40K2JQNlZRRjVjYVJwOENHdHIveXhiSTZPZVFCaGl4?=
 =?utf-8?B?SHU3aXBhdDBPWGVUbEdyVHkybEs0VS9YaUxKc0FieHVQQm1IREd1K3cxeXoy?=
 =?utf-8?B?N1ovWVRwaGlxUGNmTnljYUsyd0szVkF0aHZlZkVoWTBjOW9UZHdWZDV6QUpU?=
 =?utf-8?B?R1RmczBLVlZPeDRwSEJmVHhrcjBjT0NtaDRmYTFLTnpTaFdyQWp4MjBJZWlx?=
 =?utf-8?B?Y0JIMEJ1K1YrMHJpZCtkNnFSVjB1S2s3Mm1jbDZkeVpLMEo0bnpiQmUxMEE2?=
 =?utf-8?B?OWUzdnRIdkF2S1UwZkRpSVNKWlpTZ1JIck9TZ3JnMG1Xd1M0L1cxVVIrZjJl?=
 =?utf-8?B?MnNacVRnY05BMU14cWtXMU92eWo2V3dyWkxVdEZ6dXg3dmtvZy8xM3hQOHJR?=
 =?utf-8?B?YkJZeFJHT1g4cjYyZ2VNUkk5ckdqRUI5TitIVENTRGhXc2RzVDBqQnhJRWdQ?=
 =?utf-8?B?Q1VPd0JhK2pPdFcyV3Y4ck5weGswbm1nQXZHRzNCcGlHTVRIdm9iSnRNV0RP?=
 =?utf-8?B?c2JtMjNNZ3hqaVIxSzRTRnUxSUUzWW9hdTVXaVUyUWVnME1EM2Q5SkU5aE9t?=
 =?utf-8?B?YWxSTjVWc3RnbXBDRW0rbTlMYWRPL0wrQ3hrZVMxME5Xamx0d2xSK09aMk00?=
 =?utf-8?B?WXZEYWdPRUxveC9ibTFZZjd6UmF0a2JJdWFlQkNRQjlWVFJDejlUZ2Z2OHcz?=
 =?utf-8?B?RVd3UU5xbjR3RzAwdE9DWDhTUlBJL08xcHR4ZlBOcWE0SWZvSEJaT0pqaStU?=
 =?utf-8?B?U29PWUF2NnhSdjVrUTdJWUJJNlE1dytWaWZtZzVkMDVIRUFzdDZTbzNvd3ZL?=
 =?utf-8?B?R3VZcFpMQ1MvNWxxVnBaMU5Xd2pWT1NEMWJ0eFVxS25ONVd1ampUMkE2YWZo?=
 =?utf-8?B?NDRKa2hWTjlUTkdxOVdZTzZTTWZQK2VOd29Bd0NjU1ZpbzI3bkZRTEp3cU1p?=
 =?utf-8?B?clVOYmhLcWdkVDJKOVpFQTBwTVdzUEV4ZGsxUUNrZ1BqRm4xa0wrVCtFVjNk?=
 =?utf-8?B?dExnZzAyWEszL0dBOVVQNmdoMllmd1lQN2VWQ1R2M2puc0NWUWRMY0daaWg2?=
 =?utf-8?B?Y21lMjRaSE9NM2RFY0ZGamVJU0lmWVllT3JiTTluVXU1R1hobXZSWnN6S2xl?=
 =?utf-8?B?VGxoSmtsYWVMQ0VFUG05djZTY0lCUEpBb1cyNnVLYU5lN0JNWVA2eHlrR3pi?=
 =?utf-8?B?bWRhK0llODBKd1l4eng2blREY1RNVXJYTlpJOE1YdytBbXlhdUJNYVIrY3BI?=
 =?utf-8?B?UFdGY3JISmZLaitZamQ3THU5SW51NWRNbmF0MUxycXZFbkpxR3E4b1UrVUR3?=
 =?utf-8?B?Z3NyNWxrRTdwbUxYVVE5L0s5Q3Fpc01XSkdWRzUrYktqN0ZxQXhuZVg0OHNS?=
 =?utf-8?B?c0hSNHdla2EzRzhiWnl2TStJY0JyaG1SL3A0YmlFaGdWMWp2bmtlQ3ZIeFBZ?=
 =?utf-8?B?eFpZemtXLzNITFROV0UzdnpxWTMvZmh0Szk5N3ZzMlZOdDJTREM4U09MOG5I?=
 =?utf-8?B?N0d5dlBaUWE1SHVpemp4RTYyZXlCTDZBMWhVQkoxa3gzdVBnZFU5TWRxMDRM?=
 =?utf-8?B?VzhiMTVIOWFvYnBqOHd5VWZCaVR3MExqU1FaSklPdVJnYnZuNXlqQy9qL0Vu?=
 =?utf-8?B?RlR5Z1pkWlVXcEFaemNEcHEzYjI4UlFObUxkbnl2VW9JYUNsWXdVMG9ubmtw?=
 =?utf-8?B?dUp0WndLR3h5YktPSHp4Y0VpeUlXTTJrMjVJVDdOeFE5WFpHcHdPbHZxSDJp?=
 =?utf-8?B?c2pZeXpiRnI2OUJCRHZIOVdCQm1ZaERjcVVqM3hWbm5ua3VBM2RNckpicVNH?=
 =?utf-8?B?b3pXWUF0eGlIeC9kVGE4TmFLaVlNMmdrSW12bjhxd1VBOW92enZFemFueXIw?=
 =?utf-8?B?R0xUaWdNY3dNcGQyYk04dmJHYmg4TWlEU2NHbzAwbmdPMkl0bHV1WG5naXB1?=
 =?utf-8?B?RFgxQlNtYWRvSnMwVUZmbkRBNTV2ZUxEUExHd3Q2MHlMRU0yMDRaZmIxYWl3?=
 =?utf-8?B?d2V4bHY5TU52Yk40dVZtTi9ZN3VTUFViNzVaRkpveWJqNzBZbFF3SDBBNWJB?=
 =?utf-8?B?b2ZaSS9EVGNnVkpidWdTTUhYNE9EbUJrYjZyNnRWTzJLMk1aSXFEaGdSNkFL?=
 =?utf-8?B?T1BJOWZDdmFXYzZNTk4xd1BnY3lUU3E2Vi9kalpCa0M5b2M2L0pONlRnMk9L?=
 =?utf-8?B?SXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc127f42-4696-4b38-9523-08dcef4884d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2024 07:43:12.4754 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dkSC7sfFgx5HhFgPeAYM4J/+ykC5P0e/OMAoeSk+7F2F3kM2KnBM4m/KNYM/RLQ7av1t4UX5l/oWocFKx2THwZaJ3ke3aipJMw+N7W/Ao60=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12325
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

SGkgTGl1IFlpbmcsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGl1
IFlpbmcgPHZpY3Rvci5saXVAbnhwLmNvbT4NCj4gU2VudDogRnJpZGF5LCBPY3RvYmVyIDE4LCAy
MDI0IDg6MzggQU0NCj4gVG86IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT47
IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBpbXhAbGlzdHMubGludXguZGV2OyBsaW51eC1h
cm0tDQo+IGtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJu
ZWwub3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiByb2JoQGtlcm5l
bC5vcmc7IGtyemsrZHRAa2VybmVsLm9yZzsgY29ub3IrZHRAa2VybmVsLm9yZzsgc2hhd25ndW9A
a2VybmVsLm9yZzsNCj4gcy5oYXVlckBwZW5ndXRyb25peC5kZTsga2VybmVsQHBlbmd1dHJvbml4
LmRlOyBmZXN0ZXZhbUBnbWFpbC5jb207IGFuZHJ6ZWouaGFqZGFAaW50ZWwuY29tOw0KPiBuZWls
LmFybXN0cm9uZ0BsaW5hcm8ub3JnOyByZm9zc0BrZXJuZWwub3JnOyBsYXVyZW50LnBpbmNoYXJ0
IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Ow0KPiBqb25hc0Brd2lib28uc2U7
IGplcm5lai5za3JhYmVjQGdtYWlsLmNvbTsgbWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwu
Y29tOyBtcmlwYXJkQGtlcm5lbC5vcmc7DQo+IHR6aW1tZXJtYW5uQHN1c2UuZGU7IGFpcmxpZWRA
Z21haWwuY29tOyBzaW1vbmFAZmZ3bGwuY2g7IG1hcmV4QGRlbnguZGU7IHN0ZWZhbkBhZ25lci5j
aDsNCj4gZG1pdHJ5LmJhcnlzaGtvdkBsaW5hcm8ub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
NS81XSBkcm06IGxjZGlmOiBVc2UgZHJtX2JyaWRnZV9jb25uZWN0b3INCj4gDQo+IE9uIDEwLzE4
LzIwMjQsIEJpanUgRGFzIHdyb3RlOg0KPiA+IEhpIExpdSBZaW5nLA0KPiANCj4gSGkgQmlqdSwN
Cj4gDQo+ID4NCj4gPiBUaGFua3MgZm9yIHRoZSBwYXRjaC4NCj4gDQo+IFRoYW5rcyBmb3IgeW91
ciByZXZpZXcuDQo+IA0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+
IEZyb206IGxpbnV4LWFybS1rZXJuZWwgPGxpbnV4LWFybS1rZXJuZWwtYm91bmNlc0BsaXN0cy5p
bmZyYWRlYWQub3JnPg0KPiA+PiBPbiBCZWhhbGYgT2YgTGl1IFlpbmcNCj4gPj4gU2VudDogRnJp
ZGF5LCBPY3RvYmVyIDE4LCAyMDI0IDc6NDggQU0NCj4gPj4gU3ViamVjdDogW1BBVENIIDUvNV0g
ZHJtOiBsY2RpZjogVXNlIGRybV9icmlkZ2VfY29ubmVjdG9yDQo+ID4+DQo+ID4+IEluaXRpYWxp
emUgYSBjb25uZWN0b3IgYnkgY2FsbGluZyBkcm1fYnJpZGdlX2Nvbm5lY3Rvcl9pbml0KCkgZm9y
DQo+ID4+IGVhY2ggZW5jb2RlciBzbyB0aGF0IGRvd24gc3RyZWFtIGJyaWRnZSBkcml2ZXJzIGRv
bid0IG5lZWQgdG8gY3JlYXRlIGNvbm5lY3RvcnMgYW55IG1vcmUuDQo+ID4+DQo+ID4+IFNpZ25l
ZC1vZmYtYnk6IExpdSBZaW5nIDx2aWN0b3IubGl1QG54cC5jb20+DQo+ID4+IC0tLQ0KPiA+PiAg
ZHJpdmVycy9ncHUvZHJtL214c2ZiL0tjb25maWcgICAgIHwgIDEgKw0KPiA+PiAgZHJpdmVycy9n
cHUvZHJtL214c2ZiL2xjZGlmX2Rydi5jIHwgMTcgKysrKysrKysrKysrKysrKy0NCj4gPj4gIDIg
ZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+Pg0KPiA+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL214c2ZiL0tjb25maWcNCj4gPj4gYi9kcml2
ZXJzL2dwdS9kcm0vbXhzZmIvS2NvbmZpZyBpbmRleA0KPiA+PiAyNjRlNzRmNDU1NTQuLjA2Yzk1
ZTU1NjM4MCAxMDA2NDQNCj4gPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL214c2ZiL0tjb25maWcN
Cj4gPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL214c2ZiL0tjb25maWcNCj4gPj4gQEAgLTI3LDYg
KzI3LDcgQEAgY29uZmlnIERSTV9JTVhfTENESUYNCj4gPj4gIAlkZXBlbmRzIG9uIERSTSAmJiBP
Rg0KPiA+PiAgCWRlcGVuZHMgb24gQ09NTU9OX0NMSw0KPiA+PiAgCWRlcGVuZHMgb24gQVJDSF9N
WEMgfHwgQ09NUElMRV9URVNUDQo+ID4+ICsJc2VsZWN0IERSTV9CUklER0VfQ09OTkVDVE9SDQo+
ID4+ICAJc2VsZWN0IERSTV9DTElFTlRfU0VMRUNUSU9ODQo+ID4+ICAJc2VsZWN0IERSTV9NWFMN
Cj4gPj4gIAlzZWxlY3QgRFJNX0tNU19IRUxQRVINCj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9teHNmYi9sY2RpZl9kcnYuYw0KPiA+PiBiL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9s
Y2RpZl9kcnYuYw0KPiA+PiBpbmRleCA1OGNjYWQ5YzQyNWQuLmQ0NTIxZGE2Njc1ZSAxMDA2NDQN
Cj4gPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL214c2ZiL2xjZGlmX2Rydi5jDQo+ID4+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9teHNmYi9sY2RpZl9kcnYuYw0KPiA+PiBAQCAtMTYsNyArMTYsOSBA
QA0KPiA+Pg0KPiA+PiAgI2luY2x1ZGUgPGRybS9kcm1fYXRvbWljX2hlbHBlci5oPg0KPiA+PiAg
I2luY2x1ZGUgPGRybS9kcm1fYnJpZGdlLmg+DQo+ID4+ICsjaW5jbHVkZSA8ZHJtL2RybV9icmlk
Z2VfY29ubmVjdG9yLmg+DQo+ID4+ICAjaW5jbHVkZSA8ZHJtL2RybV9jbGllbnRfc2V0dXAuaD4N
Cj4gPj4gKyNpbmNsdWRlIDxkcm0vZHJtX2Nvbm5lY3Rvci5oPg0KPiA+PiAgI2luY2x1ZGUgPGRy
bS9kcm1fZHJ2Lmg+DQo+ID4+ICAjaW5jbHVkZSA8ZHJtL2RybV9lbmNvZGVyLmg+DQo+ID4+ICAj
aW5jbHVkZSA8ZHJtL2RybV9mYmRldl9kbWEuaD4NCj4gPj4gQEAgLTU2LDYgKzU4LDcgQEAgc3Rh
dGljIGludCBsY2RpZl9hdHRhY2hfYnJpZGdlKHN0cnVjdCBsY2RpZl9kcm1fcHJpdmF0ZSAqbGNk
aWYpDQo+ID4+ICAJCXN0cnVjdCBkZXZpY2Vfbm9kZSAqcmVtb3RlOw0KPiA+PiAgCQlzdHJ1Y3Qg
b2ZfZW5kcG9pbnQgb2ZfZXA7DQo+ID4+ICAJCXN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcjsN
Cj4gPj4gKwkJc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcjsNCj4gPj4NCj4gPj4gIAkJ
cmVtb3RlID0gb2ZfZ3JhcGhfZ2V0X3JlbW90ZV9wb3J0X3BhcmVudChlcCk7DQo+ID4+ICAJCWlm
ICghb2ZfZGV2aWNlX2lzX2F2YWlsYWJsZShyZW1vdGUpKSB7IEBAIC05NywxMyArMTAwLDI1IEBA
IHN0YXRpYw0KPiA+PiBpbnQgbGNkaWZfYXR0YWNoX2JyaWRnZShzdHJ1Y3QgbGNkaWZfZHJtX3By
aXZhdGUgKmxjZGlmKQ0KPiA+PiAgCQkJcmV0dXJuIHJldDsNCj4gPj4gIAkJfQ0KPiA+Pg0KPiA+
PiAtCQlyZXQgPSBkcm1fYnJpZGdlX2F0dGFjaChlbmNvZGVyLCBicmlkZ2UsIE5VTEwsIDApOw0K
PiA+PiArCQlyZXQgPSBkcm1fYnJpZGdlX2F0dGFjaChlbmNvZGVyLCBicmlkZ2UsIE5VTEwsDQo+
ID4+ICsJCQkJCURSTV9CUklER0VfQVRUQUNIX05PX0NPTk5FQ1RPUik7DQo+ID4+ICAJCWlmIChy
ZXQpIHsNCj4gPj4gIAkJCW9mX25vZGVfcHV0KGVwKTsNCj4gPj4gIAkJCXJldHVybiBkZXZfZXJy
X3Byb2JlKGRldiwgcmV0LA0KPiA+PiAgCQkJCQkgICAgICJGYWlsZWQgdG8gYXR0YWNoIGJyaWRn
ZSBmb3IgZW5kcG9pbnQldVxuIiwNCj4gPj4gIAkJCQkJICAgICBvZl9lcC5pZCk7DQo+ID4+ICAJ
CX0NCj4gPj4gKw0KPiA+PiArCQljb25uZWN0b3IgPSBkcm1fYnJpZGdlX2Nvbm5lY3Rvcl9pbml0
KGxjZGlmLT5kcm0sIGVuY29kZXIpOw0KPiA+PiArCQlpZiAoSVNfRVJSKGNvbm5lY3RvcikpIHsN
Cj4gPj4gKwkJCXJldCA9IFBUUl9FUlIoY29ubmVjdG9yKTsNCj4gPj4gKwkJCWRldl9lcnIoZGV2
LCAiRmFpbGVkIHRvIGluaXRpYWxpemUgYnJpZGdlIGNvbm5lY3RvcjogJWRcbiIsDQo+ID4+ICsJ
CQkJcmV0KTsNCj4gPj4gKwkJCW9mX25vZGVfcHV0KGVwKTsNCj4gPj4gKwkJCXJldHVybiByZXQ7
DQo+ID4NCj4gPiBNYXliZSBzYW1lIGVycm9yIHBhdGggc3R5bGUgbGlrZSBhYm92ZT8/DQo+ID4g
CQlvZl9ub2RlX3B1dChlcCk7DQo+ID4gCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9F
UlIoY29ubmVjdG9yKSwiRmFpbGVkIHRvIGluaXRpYWxpemUNCj4gPiBicmlkZ2UgY29ubmVjdG9y
Iik7DQo+IA0KPiBJIHRob3VnaHQgYWJvdXQgdGhhdCBhbmQgZGVjaWRlZCBub3QgdG8gdXNlIGRl
dl9lcnJfcHJvYmUoKSBiZWNhdXNlIEkgZG9uJ3QgdGhpbmsNCj4gZHJtX2JyaWRnZV9jb25uZWN0
b3JfaW5pdCgpIG1heSByZXR1cm4gLUVQUk9CRV9ERUZFUiwgbm8/DQoNClllcywgeW91IGFyZSBj
b3JyZWN0Lg0KDQpSZXZpZXdlZC1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMu
Y29tPg0KDQpDaGVlcnMsDQpCaWp1DQoNCj4gDQo+ID4NCj4gPiBDaGVlcnMsDQo+ID4gQmlqdQ0K
PiA+DQo+ID4+ICsJCX0NCj4gPj4gKw0KPiA+PiArCQlkcm1fY29ubmVjdG9yX2F0dGFjaF9lbmNv
ZGVyKGNvbm5lY3RvciwgZW5jb2Rlcik7DQo+ID4+ICAJfQ0KPiA+Pg0KPiA+PiAgCXJldHVybiAw
Ow0KPiA+PiAtLQ0KPiA+PiAyLjM0LjENCj4gPj4NCj4gPg0KPiANCj4gLS0NCj4gUmVnYXJkcywN
Cj4gTGl1IFlpbmcNCg0K
