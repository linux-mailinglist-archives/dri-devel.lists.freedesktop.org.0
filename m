Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1692E989EAA
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 11:45:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7760710E2DC;
	Mon, 30 Sep 2024 09:45:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="D1+w9h2N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010004.outbound.protection.outlook.com [52.101.228.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A88610E2DC
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 09:45:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V5EH0M92Of/YhX8BwOGda3pRfpBZZwiJA/Jm0N3efcYoBeEXHiGgVgrFUeUbU+yGwqk0mKJjJ31ysb+fnfDu44rnUFQ42NbREaG8XDbTzvIRp+ZO6sBl9RfjjMr+6PUc7QyLKOdrH45GCejIwC0WkUwS1BHlTNogfVVVWbqZl4jBBYPZtERMkaz1qOebB2rruTQqEcb5zE31NqMOpqZofPvujIX3ijyVENxeZOIZs6NPj5i5QuYi2wBQTHXJc5X9PCLaym6m0xbf3A3F6LwsuEXGLIINHsCHIDcRoE9+oc29YoBBuIGiS0nRsV9KYR97dKdh/AJmKI3a16SwLYOg4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9DAdbgZpvuIPZFoausCKaeucCx8cSfClaZcNvmO8tMU=;
 b=LRWXFzarVsR6ciTYj9a7NG2hbvwxLhcZmhTX5XiC5PSc2RbcrNKKklNDYDETx6/GBD7+bcMA/6QxztZnFDmnWRyTST2ChAP4BUPMpp7Y0rRrnrOcu5VMbXuOS4R+0aMJVCn5xjc03ZDf4SRsYBjELihmzluWYOMHLJStMw3a/yRKrxNVFt92/sSBNIkgji3ZfNJvLbcb+FAsDC42GoPpd6UqaPBxyuWhdJ1cFQgGJFpPQ3h7Zry9M5ZB5jytMLeEjsf8DirTyWTy1od/8EiC3wOf0LvM8MretpN38XL8dUGOyCHnv4LzsNOzIY+WhBi8ny9WK/6jce5qNuwYqO/s+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9DAdbgZpvuIPZFoausCKaeucCx8cSfClaZcNvmO8tMU=;
 b=D1+w9h2Ny8p37SWZy1wwDOYtAG/YW0dYIV9rtDSuDBC5RaT/nr4bnCU1nlZfxy2J6cmQe9MjsLG3iJplgC5a3K5R1EUT7e3WUyGmpikudfmbekkTJjTHG7q464BSF4mZdLMV0YDlij5trfd6ZAirWVhF5gjtzHKmhHy/qbmdAiE=
Received: from TYWPR01MB11343.jpnprd01.prod.outlook.com
 (2603:1096:400:3f5::13) by TYCPR01MB9368.jpnprd01.prod.outlook.com
 (2603:1096:400:191::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 09:45:00 +0000
Received: from TYWPR01MB11343.jpnprd01.prod.outlook.com
 ([fe80::f54f:8da2:5ffb:1391]) by TYWPR01MB11343.jpnprd01.prod.outlook.com
 ([fe80::f54f:8da2:5ffb:1391%3]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 09:45:00 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Liu Ying <victor.liu@nxp.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
CC: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, "rfoss@kernel.org"
 <rfoss@kernel.org>, laurent.pinchart <laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, "jernej.skrabec@gmail.com"
 <jernej.skrabec@gmail.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, 
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
 <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>, "catalin.marinas@arm.com"
 <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>,
 "quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, "arnd@arndb.de"
 <arnd@arndb.de>, "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>, "y.moog@phytec.de"
 <y.moog@phytec.de>
Subject: RE: [PATCH 6/8] drm/bridge: Add ITE IT6263 LVDS to HDMI converter
Thread-Topic: [PATCH 6/8] drm/bridge: Add ITE IT6263 LVDS to HDMI converter
Thread-Index: AQHbEvtUipP47OqWn0qTbXIXZ3wX97JwA4ZggAAQEICAAADwAA==
Date: Mon, 30 Sep 2024 09:45:00 +0000
Message-ID: <TYWPR01MB11343041A6065078D4466FF3386762@TYWPR01MB11343.jpnprd01.prod.outlook.com>
References: <20240930052903.168881-1-victor.liu@nxp.com>
 <20240930052903.168881-7-victor.liu@nxp.com>
 <TYWPR01MB11343E3DE82874B557B537B6186762@TYWPR01MB11343.jpnprd01.prod.outlook.com>
 <5bdd86cf-ee76-452c-b854-171b3aecb04b@nxp.com>
In-Reply-To: <5bdd86cf-ee76-452c-b854-171b3aecb04b@nxp.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB11343:EE_|TYCPR01MB9368:EE_
x-ms-office365-filtering-correlation-id: 85fae1ff-dcb3-4ce0-9a73-08dce1348d2b
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?cWFYSVplMEFnejRUVy9sNEVUMEZ5Y2hQZVhZY3k2aE5abUNyRnZSbkp3cFQ1?=
 =?utf-8?B?ZFJzckhaM3pLeE5oWlVncnIrUFZnNVZ0Y1orK0xNYzlvVGd5WXJML1drd3ZG?=
 =?utf-8?B?RTBDY0x6QVhhbHhlZU05SWdrVEZpQUlqVVprMksrVmZ3NzAxUFZMMzdmV1cr?=
 =?utf-8?B?TU5oaEtweC83bGRVRXBjV0s1UnhVMHNTUExITVloZFhGbzVTMU43L2N1REJn?=
 =?utf-8?B?Zzl3NG9ua2V6OFZKMC84aWM1YXp6WFg1Y1lTNEh6Q2RUZ3NjOGFMYzN6Z1Ew?=
 =?utf-8?B?L2lrN25kK0xoV3B5bExjT1FpQWtaNkdLcVl2b3lXMU1YNHRZVUtsOU5Bc1dq?=
 =?utf-8?B?aDg0NXJtSVBqQTFaVXVoaXB4WGhGZ1N5aWoweTljSDJMcEk4QlBuR2RTMVdE?=
 =?utf-8?B?aDdJSHBJdGVnclRKa1RBZ1pMaDVOd3d5d0lYTGdBR0tLTWZqZjIzemRmZTVX?=
 =?utf-8?B?QkswZW1qSk9JU0JYM2ZJQ3MyOUtqSHZKRGdYOEtSaWEyMVJjNERsVUZKdjRK?=
 =?utf-8?B?eStEMHVtWXhHSjVpbjQwL2NCNkV0RUhySUJ0MjNrcnp0Z3lGSVR3U0hKa29S?=
 =?utf-8?B?WnVGLzhVVWVCMUFHZGl3TGR0bFhyZndJbkdRNnVNYkxJeit3U2RSbXhaeVhC?=
 =?utf-8?B?QlZMblI0dWI1RzFYcnZENWI1V1hiK2ozeVg1RExyOWhaMTFIeWJLUHpqSUpM?=
 =?utf-8?B?UGd1YTAyMkMrUGJZOVZJY2crUDE3ZHRkNk5tNFM5dzY4Ym9rRHI3RjJiZEw1?=
 =?utf-8?B?dzJYaXJROGpDQnZlWE1PY01Pd0NCNVMySXhKdXdSYmtKZmExYnNkb3Nub0FY?=
 =?utf-8?B?T0RzWTd3YlZrY0VsRDBmcGdRb3RyTlNld2RmdTVZMEp1RFRSS0tRR0NlelZM?=
 =?utf-8?B?OGRycTlhVHpBcHN6WFgxa3FvNG1YQnJVRmFXem5CY2IrTlJJVE1YLzQ1Qmh3?=
 =?utf-8?B?SFpicHFWb3VQR281TXRSaS9oNWJ4cUtnS0oxd000TEhoT3dIMnRRSDZtUjhS?=
 =?utf-8?B?YjdiWnZaME02Qld1ZWV0ckJYV0d0OC93MlVKcWJNZTRiaW5ZOEEvVitCS2h5?=
 =?utf-8?B?Z0IrNWFaazVYL242MmFMdWdjblg2U2VnTUF5WktDUWxtSnYvM2dqVDNTWUNz?=
 =?utf-8?B?dnRqUk80NTZqajFqSVFUc1NPTWRyS20wNFVteTI1Y05Pa0R2VFZaaldYN2lC?=
 =?utf-8?B?bXJKZ0tOYXo4MEpPS09lNTNvYU16cDA4WDc2aHY1bzdtb3QyYmcrRFFhT1da?=
 =?utf-8?B?UFpDL0pLR0RMQ2s1dVZLUkhwVmNGS1FiTnFBOFZuYUh4UkZKMDRSUWo0ajAz?=
 =?utf-8?B?eHI1Q1RiNzMyUWV1aVNPdHNacm9ieDIwQTNzTmNRUVg4cEJZVXpIeXMwZVF2?=
 =?utf-8?B?Ni9uaVA0ZWhoK0hqZ2hOU2FNODlEaUJMa2xnTjR3VURBMTJDeTkyU1paajI4?=
 =?utf-8?B?K1NTMWhVLzdLRmZKSkJHa0J5R3gwK3dKMUhSOVVwNUFKYWh2K3Q0NU10NFJI?=
 =?utf-8?B?WXZsbTRrVkx5UVdCYXZsSkVLMXRHYjZ3RW5NZjJLenZlNlhaMjY0anhGcWxW?=
 =?utf-8?B?blU2Uko3emk5UkdvL2pzOHZoVzFBOW5vRmNzZVJOeHQyUTBkZGFKU21ESE1J?=
 =?utf-8?B?OGtMb1RvZSsvamdLSUd3a3FVYVdmN3NHbUhFNmpqRGtGVi95UkJmRGpXTStD?=
 =?utf-8?B?T29PcC9SR2U1aFcrcjBIRHpxUTZudkUrTkdiRUkvT0tlaFVaTDBsYmNkS0dZ?=
 =?utf-8?B?Y01yRnFXek82bXNkSVYyTGVjT29qVTNyaHlsZ2Y4eC8zMUYrdkI2TDg5MnhX?=
 =?utf-8?B?dkkzQkZyZ2p3QkxOYzRTUT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYWPR01MB11343.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aFJrOUxxMmI1VmVWNnpCSTJVRUdMTW9uay9JMUpzMUVSb3N2VHhkZFFLMWR2?=
 =?utf-8?B?SkZNeElBSHNHVVdxTmFnUVlDUnZhZjlNZHFTaVFQQlo5b293ajNqTTdTNXZG?=
 =?utf-8?B?Y3p1WkxCd2t4YTk5VFcvcUpWZnY0UjhUZFRtMThmN0N2VytkbituNFFVdkpq?=
 =?utf-8?B?SjVQa2lCSGpVRmFqNngvaGMrOXZyemVkeWwweEFmZ0hOV3JIZmRyQVdORnFH?=
 =?utf-8?B?bVFyd3htVzNSN09vcjRmLy9tVjl2THNSc3llZFRvTVYrcFUwUzk1Y2tKTm5u?=
 =?utf-8?B?QnllZzZPTkZyS0dFME9XaHo4ZDQ4QVhBd1RkbXFqRitZZlU1Q2FZQytVZEFs?=
 =?utf-8?B?ODdDelpjSUxDK0ZQajhERTVBeU5aSTNyRlZyL0lueTl6TVVSNk81UHEwM0V5?=
 =?utf-8?B?RXNnOThDZ291YWVwN3lBZEtiVkdVdG8vajVvN0pVQWltREY1QWNtZFFvSUx3?=
 =?utf-8?B?UDFpbnoyeXE5cTF1TlFkV0ZqK2hPYzJ3RnlPa0hieTJkNUpsM0FuaFd2bkhL?=
 =?utf-8?B?UlVqNnExN0NJSW1YdlFtZ2o4SnRiZTA4dEkwSDMzMWNUSHJ3UWdjS0RsdWg1?=
 =?utf-8?B?OXEwZ0M1cWsvS3R4UlFIbEo4OEFpWnVld0N6VFBUaGsyMk5oOFVKNTFLSDR1?=
 =?utf-8?B?MzYwaWh2R01TQ2J3TVg2YWl4SXlkZGJvZjFWMS91Y1VzdnJ2OTNXTjdZUitH?=
 =?utf-8?B?eFRkWlAwd2t2bGU4NkR6RzRpZGhjb1dhSnp4UkxmVEY1WU9rR0YvVjVsU28y?=
 =?utf-8?B?OVBlZENuWGdlMG5paHcvNU5KKzEzOVZYT2I1TUhJZUtlSU8rZU1DcGtPWWVv?=
 =?utf-8?B?MEJqaXAvOEpPQTlFUjRVekJqd0Z4c3FkMTd6anFWY3lPZGtZVC9Sc3c2ZzRE?=
 =?utf-8?B?cUpEK2NzdmJ6Z2ZlWHJGcHltaUc2UWtBTkNsWkxvSlQ1eklXUTFFa0U1Q3ZZ?=
 =?utf-8?B?Q3MwQXAwbkxSWXBFOVlCQ2g1R1ZERE85UmhXZ0JTQzk4WFBKTW9HdVBkN1Vy?=
 =?utf-8?B?bFJhSFowODFGV2NyUzRNOWQxVGZob0lSZzk1amIzTzdMak16cUxPN3NBS1BP?=
 =?utf-8?B?QXhYcTF0OG56YnNmS1Z2cG9JSGNTNUorWTFlVm5qL05VREk4b1MwUTN0NjhS?=
 =?utf-8?B?VUpSRGdaZUNIbHFDRVphQ1pMZVFVNXF2RXZRTEtNc3kySlcrcHZuT0JPRHJu?=
 =?utf-8?B?L0x3MHN2WDhQS1lTeStPODZTYkpVV1NUM3EyL0d3NldKTmN0WTBaOHNaZXlG?=
 =?utf-8?B?b2p6YlV1b3RUODIrSm9CS0l1R1dEdko0b0VQcys0Y3hoa0ZLNE1Gd3FrZk5n?=
 =?utf-8?B?QVdQVkZuNTRDM3J3UVdzZ3NkcFdvRkZDWVdDT21EZ3hWeDVwYlYwSUlnTjRs?=
 =?utf-8?B?MU9HZEJkdU9TUC9kaW9jRGdQU2grUmhZc1lqcFlsekk0a1o4WWZrUzhTSFlu?=
 =?utf-8?B?Mzdmd0d0RlFUYURpS2M3aUZ3ZHF2TmNURDl2VEJaMUJNYnFiemNhOGRzYzYr?=
 =?utf-8?B?Qmd2SDNpK3h4TDF1ZVgzN05UYzFGb0Y2S2pNemI1ZHByVmMvQnFvQTRLd1lB?=
 =?utf-8?B?LzR4b1FXMVNLZ29hTE43TEd5bEc5cFhnZkMzc21HeUFHTzh2UTUvRm5peHZL?=
 =?utf-8?B?SkFUYjlMRVB5ZkY5OEg0NVRvQTk1ZXhPbUd6U1dvTHk2KzEyWEc4RkIxSW5H?=
 =?utf-8?B?R25KR0E3OWxCMWZ3V3REa2R3TFd2MXFZQ3FNb3BOczBmaG1zMy9mTEU4S21q?=
 =?utf-8?B?ZjVEd3M3TUFITHN4dGFkcjM0QUU2SjRkdC93ZlhCanFyc1EzVHpvYkpPNFJI?=
 =?utf-8?B?Tks0d3liMVEzVlJOd1lIZFRmK0NhTEhrRTNYOXgxbHFjcW0xeWozNjNqVzFp?=
 =?utf-8?B?STZxRXprcUV4cE95KzVIUHlTMTU3ZmlOdUlrUlV6RUdaMW43eFBIQjU5YUFX?=
 =?utf-8?B?cGd1ZVJ4Umh0Vk0yNUhmbEFPQmdhbE53V3JWeURmSUt4UjYwb1pIcHVpVy9v?=
 =?utf-8?B?Rm5WS1dDRUFBM091NUR5MC9kYjBJaFcwdmVsc1I0ckFyUVpCR2dUZ21wNU5x?=
 =?utf-8?B?ajJpRGViTTk4QTgxcWdRUFhyWVdjcVZ1R25JQWw1dWp3R2JQeExKbWI5eGhV?=
 =?utf-8?Q?Sm1oKvVorEfhWxpcyBU6UWdGW?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11343.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85fae1ff-dcb3-4ce0-9a73-08dce1348d2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2024 09:45:00.2672 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ipb/NeMQapzqaFAmHhVwBKKj8ghozxlgETeLbWKuHjnhrahQ3MbZqOeWc0JA9diqAxMlnocAwlDE62G4m2Ne58VgDPEJHRdQj8BVZNgo95Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9368
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

SGkgTGl1LA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExpdSBZaW5n
IDx2aWN0b3IubGl1QG54cC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgU2VwdGVtYmVyIDMwLCAyMDI0
IDEwOjQwIEFNDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggNi84XSBkcm0vYnJpZGdlOiBBZGQgSVRF
IElUNjI2MyBMVkRTIHRvIEhETUkgY29udmVydGVyDQo+IA0KPiBPbiAwOS8zMC8yMDI0LCBCaWp1
IERhcyB3cm90ZToNCj4gPiBIaSBMaXUsDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gPg0KPiA+IFRo
YW5rcyBmb3IgdGhlIHBhdGNoLg0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+ID4+IEZyb206IGxpbnV4LWFybS1rZXJuZWwgPGxpbnV4LWFybS1rZXJuZWwtYm91bmNlc0Bs
aXN0cy5pbmZyYWRlYWQub3JnPg0KPiA+PiBPbiBCZWhhbGYgT2YgTGl1IFlpbmcNCj4gPj4gU2Vu
dDogTW9uZGF5LCBTZXB0ZW1iZXIgMzAsIDIwMjQgNjoyOSBBTQ0KPiA+PiBTdWJqZWN0OiBbUEFU
Q0ggNi84XSBkcm0vYnJpZGdlOiBBZGQgSVRFIElUNjI2MyBMVkRTIHRvIEhETUkNCj4gPj4gY29u
dmVydGVyDQo+ID4+DQo+ID4+IEFkZCBiYXNpYyBIRE1JIHZpZGVvIG91dHB1dCBzdXBwb3J0LiBD
dXJyZW50bHksIG9ubHkgUkdCODg4IG91dHB1dA0KPiA+PiBwaXhlbCBmb3JtYXQgaXMgc3VwcG9y
dGVkLiAgQXQgdGhlIExWRFMgaW5wdXQgc2lkZSwgdGhlIGRyaXZlcg0KPiA+PiBzdXBwb3J0cyBz
aW5nbGUgTFZEUyBsaW5rIGFuZCBkdWFsIExWRFMgbGlua3Mgd2l0aCAiamVpZGEtMjQiIExWRFMg
bWFwcGluZy4NCj4gPj4NCj4gPj4gUHJvZHVjdCBsaW5rOg0KPiA+PiBodHRwczovL3d3dy5pdGUu
Y29tLnR3L2VuL3Byb2R1Y3QvY2F0ZTEvSVQ2MjYzDQo+ID4+DQo+ID4+IFNpZ25lZC1vZmYtYnk6
IExpdSBZaW5nIDx2aWN0b3IubGl1QG54cC5jb20+DQo+ID4+IC0tLQ0KPiA+PiAgZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9LY29uZmlnICAgICAgfCAgIDggKw0KPiA+PiAgZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9NYWtlZmlsZSAgICAgfCAgIDEgKw0KPiA+PiAgZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9pdGUtaXQ2MjYzLmMgfCA4MjkNCj4gPj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0K
PiA+PiAgMyBmaWxlcyBjaGFuZ2VkLCA4MzggaW5zZXJ0aW9ucygrKQ0KPiA+PiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvaXRlLWl0NjI2My5jDQo+ID4+DQo+ID4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWcNCj4gPj4gKw0KPiA+
PiArCWl0LT5sdmRzX2kyYyA9IGRldm1faTJjX25ld19kdW1teV9kZXZpY2UoZGV2LCBjbGllbnQt
PmFkYXB0ZXIsDQo+ID4+ICsJCQkJCQkgTFZEU19JTlBVVF9DVFJMX0kyQ19BRERSKTsNCj4gPj4g
KwlpZiAoSVNfRVJSKGl0LT5sdmRzX2kyYykpDQo+ID4+ICsJCWRldl9lcnJfcHJvYmUoaXQtPmRl
diwgUFRSX0VSUihpdC0+bHZkc19pMmMpLA0KPiA+PiArCQkJICAgICAgImZhaWxlZCB0byBhbGxv
Y2F0ZSBJMkMgZGV2aWNlIGZvciBMVkRTXG4iKTsNCj4gPg0KPiA+IE1heWJlIHVzZSBhY3Rpb25f
b3JfcmVzZXQgYW5kIGNhbGwgaTJjX3VucmVnaXN0ZXJfZGV2aWNlKCk7DQo+IA0KPiBkZXZtX2ky
Y19uZXdfZHVtbXlfZGV2aWNlKCkgaXMgY2FsbGVkIGhlcmUuICBJdCBpcyBhIGRldiBtYW5hZ2Vk
IGZ1bmN0aW9uIGNhbGwuICBBY3Rpb24NCj4gZGV2bV9pMmNfcmVsZWFzZV9kdW1teSgpIGlzIGFk
ZGVkIGluIGl0IGFscmVhZHkuDQoNCk9vcHMuIEkgbWlzc2VkIHRoYXQuDQoNCkNoZWVycywNCkJp
anUNCg0K
