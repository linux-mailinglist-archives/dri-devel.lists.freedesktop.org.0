Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD5FA437A7
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 09:31:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7810810E0AD;
	Tue, 25 Feb 2025 08:31:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b="cXRic8Om";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2138.outbound.protection.outlook.com [40.107.21.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C350C10E58E
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 07:39:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cuH0N8jDFOcM18O5wdwRczSdALmzL6h/0oJ7v8FkK8IC36vwYu/Ojzw4abUhRRE1omi7iqmMAUVaw1uAG+wKF7WanFrTyokzYF7YlHimn3quZtp14627PHHhldXVd+giowp55QD8viGITOJ77Hr3GRFhVQC47XVa4fWIb/aYvobmEi+xaroSQfumvvhb5m7NxNUH2DJ/ATTG6GTDPemNnBSpeVaLLELhnkCBxDTa6N4FT9gLHawwGkZeECPCr1ZlGaTLzXNSKTzfynexc1qMamlNR8p+/3L67Sh6icAgdweHwxeeH7/LqATV/GFUoma/1ngr4QZrDv4es4SZjwGIbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0U6S0BmWR200UU2yPcH2lY/WJhLyKoiDERjSvc6SkI4=;
 b=GQONysjpWyW7ZMB+bUlMFd3B62SJIAForCrwroxFVJtDwqiBOPUEIZOMZTC/GTSNMPpOGOJhfTW3xaM7TyqDoZ2hyj/nAvr1O6zvsyMNtvHUXhQ/Pdch3m97yyv1zWCCYzZOUX+BX19QWEJGKw2T+kO/aN7dbDjqRpcKEJq/vvl1l/MA8dI6brDg7D1UtrWyv++Cg6s1A4t7aVZhUvfrRMk03jhnJzARKRccF99H20BTCli2ItcTXRSpLg78VHmdmENIcE0LwWOqWjMu1c2JsvgdCl/+qyw0fJU14HM3OmDRFH/du33RhVS8BSJmyubwb+WihBtV8tXI1fKoT3ipDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0U6S0BmWR200UU2yPcH2lY/WJhLyKoiDERjSvc6SkI4=;
 b=cXRic8Omi2vSfUASoMdWZ1o2014bjCbRP6ooCMJQVFI6/ucEc9zJa1TSjw+YtiUsHMOx2bJCgL9/85FJ1yeCvoggOIB9DW0iOw088OxoWNRhtWv0LWqm3iD9Jv6rffNmb2qLubz7QrtDRKD3JDCjFRpIo2I4OyMqqrMRmUBTN0qb0Gw/8uMmmG23j8+k/4r8c9olJVvlkPEZQ8RLS30N8krm3L4/ydl62riwoo2htU5L4FRQkQnxv0G9d42dVR0txmNvb9eyqWzjDMRapiIXZLVQJYJ4I1/4rbIXPz9lEQSwa80Q1NkCN4/lS43ffAB4xOZV8Hz6ZlrGM5WCjtC5kQ==
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com (2603:10a6:102:ec::16)
 by AM8PR04MB8004.eurprd04.prod.outlook.com (2603:10a6:20b:248::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Tue, 25 Feb
 2025 07:39:52 +0000
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f]) by PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f%4]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 07:39:52 +0000
From: Maud Spierings | GOcontroll <maudspierings@gocontroll.com>
To: Rob Herring <robh@kernel.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Liu Ying
 <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 05/14] dt-bindings: trivial-devices: add GOcontroll
 Moduline IO modules
Thread-Topic: [PATCH 05/14] dt-bindings: trivial-devices: add GOcontroll
 Moduline IO modules
Thread-Index: AQHbhsMosk0/ripJzU6HkH3zRHdpDrNW7EQAgACtnhU=
Date: Tue, 25 Feb 2025 07:39:52 +0000
Message-ID: <PA4PR04MB763009E88F6406CD84ACBD33C5C32@PA4PR04MB7630.eurprd04.prod.outlook.com>
References: <20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com>
 <20250224-initial_display-v1-5-5ccbbf613543@gocontroll.com>
 <20250224204428.GA4050751-robh@kernel.org>
In-Reply-To: <20250224204428.GA4050751-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB7630:EE_|AM8PR04MB8004:EE_
x-ms-office365-filtering-correlation-id: 45f492a3-de4d-46bd-56fb-08dd556f9749
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|10070799003|376014|1800799024|7416014|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?75YVDHyN6dkmGFvPs8MZ2350oHKH7ZWlnQZfDBgCZHJHlIszCvAK2xtPln?=
 =?iso-8859-1?Q?1GKBJmZNgHXzQhWy1x2qY/oXhRztN4w5ialotC7uR33HCZdvyuyFD73ZAm?=
 =?iso-8859-1?Q?Lw6yz34ebfZYvwdS4VRjGphdj+yiMEcj1brfDowBsiMgebtFrxFxCijsx2?=
 =?iso-8859-1?Q?Fdo7AX1Kz2RVKuqd+w9LanZ5+xyCHklUj3CCWrWto+20wMfETUjMZmXHLq?=
 =?iso-8859-1?Q?U4EVvkgJzMR46weZL4qlt+mKSLkaWnC3Qo6mQiptSWfGLYG4MYO5CUd2fI?=
 =?iso-8859-1?Q?yRc8DBLr0agcvO1cUMB1S0i4WajVljFpyXiCsKqXKTg8DkAO57OXP4RDGS?=
 =?iso-8859-1?Q?mgfzCnq3sZVBT3ZOh7Has2D3wEbRHMrMY/PaccFZBbYIuCTUwarYaToujo?=
 =?iso-8859-1?Q?LWS5Ge9fY8mQYU2aXP8jMNX/kOCqYjI6+SfUYBVKbfwPAaVpEyMoGNNnH6?=
 =?iso-8859-1?Q?GjzD9XaZAMfpJtmAESnJ1UGq8M+yPXak8YUpnDeHj+LU/ZvNLWVdGQJ87N?=
 =?iso-8859-1?Q?gXLybJCtQIX6IFCGnWq5SJdknf5JYUAW8GP/a8vwYHmLp4yjIDhHMa16aC?=
 =?iso-8859-1?Q?yUDQbdHzfW6EPGnZ4uSSmOlLVpFA5kNEYNkcj6vvCmAfXi05I8d1rfcJkW?=
 =?iso-8859-1?Q?Bse8RgfVdnBQglOPdtt2V96Ly9sUpGDeLp9F3R6ZLKLBY+umbLGf14orvI?=
 =?iso-8859-1?Q?LkMg3fP+lpVz5p1lrF0Ud7ajBqT7yk1Bv/Zy+MmDzinRLIflFT7uOK77Us?=
 =?iso-8859-1?Q?gECnOX8201OGZf/U1g+6qmUVEKGtwZ7TNR27YRMmN1IbFrHzk5XJZWMmO6?=
 =?iso-8859-1?Q?PEL5AJq3QaUbgBlei2aLGIoVZUQgzAiwVn6yWvDEWgdh5utLl0lDI+mT/V?=
 =?iso-8859-1?Q?woCBfHZHGWSGpLZffPS7IT52SnfoxpGcB+B3sIcq5XrzRW5YUVT8q6Ob0v?=
 =?iso-8859-1?Q?BlfU08RjjBTgq705T1LoxBzB0yehnRhF8sn03otCqDM6PcRBgwUYab2A7V?=
 =?iso-8859-1?Q?OYQtIo33BCGkISHgVgVs6dMs1k/WuAjL31937dmcKdIzb/N0hoyto0gFtH?=
 =?iso-8859-1?Q?FClWqil7fv2WGvVtQn311PWJYPlykME9AJ2BIk5Dpyw6y1uQiGkj7ynmDZ?=
 =?iso-8859-1?Q?4HMGUbrDlFyaDTOhOiwi7K2OvXDPwstkqPjw542n4/Fx+puKywnionQ5dj?=
 =?iso-8859-1?Q?juUSFtXIVoOHhQKWYe5zQbl8owGwbh2ft60n0CK2I/Xa7Q7igTh+LxDorb?=
 =?iso-8859-1?Q?tTYgedcbolG3CJsE89t63jAGN4kKj2ZpfC7L5pvIJAjygxTeyl8v2ptE1W?=
 =?iso-8859-1?Q?wL6M0mlQnW0PsNrYT1UL/kNRoDEeE7fWmvFpuIoLXDz8bh/JRlgupBZfOD?=
 =?iso-8859-1?Q?qbcPi66ImVEn5SUppwDqCWMAxOIuSuSvJNCxkMxc3wo/eDGny48ruiWSS/?=
 =?iso-8859-1?Q?K++om518l+FOwoP5NrUv5HJvCADI9MPunvIgzadMETdHkg/FNJjpcONku+?=
 =?iso-8859-1?Q?wBbKPlGzqPddNGPJwX4HDV?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB7630.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(376014)(1800799024)(7416014)(38070700018);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?X8IGD84bqM6j+6gAmakOoLHDbMp5bx9ODmev0L5XJztKXJxzoStsDa1F4t?=
 =?iso-8859-1?Q?L+EClW4B/ZOwC+vNa7brPaO16qdSHJ/8rcNG1cAEJR5LY8WNLo+00GE856?=
 =?iso-8859-1?Q?4YQFeDuJF/QLZGEnWH6wwlgrZ8H2NOb+a73xe7af8DH7of+GNNFiXUcdxW?=
 =?iso-8859-1?Q?FiSWV3XovPlLdLB5UoqlCXqpQi40qm7aBYZUOAPWIO6K9x8xNIG20cTySg?=
 =?iso-8859-1?Q?1QbYb3ysGW5iTBr3aH7LA8DOCX/BlLkg7qEUPE5x0nFZbzsP5WpEMa0kof?=
 =?iso-8859-1?Q?feJZ42IIKIqa2X3gff7j6yCoXKqZqQE5GAkg5BE8xq1JdA9x3ui9OfYLvi?=
 =?iso-8859-1?Q?dELO0ppC7AuEW81zZ6lPUzHCXwCcEdxtj46DQUI7JJRucqE+Vnh1w6JoLv?=
 =?iso-8859-1?Q?BoiNxfqwqxkW/myyEJ33Cd9wrLuQQCLbV9RH5PAaHqmHWqWyFeDoZ2SZBc?=
 =?iso-8859-1?Q?Nez/vpeYaPDFjVhGx00EoJBI8Hx3p+Xu4NyGhs47bcFs+tDrYyNpqPHivW?=
 =?iso-8859-1?Q?quQ3k1gMkWHTpQQPxtaDwX/TSOAuOUUjRyoya6dUtmup22tvw0t10UFy/a?=
 =?iso-8859-1?Q?YBJK18gJ07ODR05fAWut85LqS3Fs3bgB2CeEXgRuFLByXt4uzyx5iEoFPv?=
 =?iso-8859-1?Q?rxFXuaDTuECi16mvLZayYXJQeNLB6bCWp5gT4oACCcCfb6dL0UG7H+zFtV?=
 =?iso-8859-1?Q?xf2gTDK7btphThL54lBqvgEQHbnMpYylWVbxTLIppDhUOt6bAx1oc5s9vv?=
 =?iso-8859-1?Q?CAuSB2SKG7NZHlWFBlVsHlV6XsIZfhpoiyYJIdlPlIsZWsodI4XGeyOnuw?=
 =?iso-8859-1?Q?0JEuegkEOSb/xTnfhNTMNiLdhG5HCPJrlm2kTqp3gpK6ZKn+wRSJ3KlIRP?=
 =?iso-8859-1?Q?ak0EPHU8o/N0N6IYswJJ5kY/WSa9OF/f4AqnjQxarsUzM7Dk7q0wIglT3Y?=
 =?iso-8859-1?Q?75w72lQwUJ2XHeQlLHdRag9UuUlR8O9HPs+rmmXQ+CdLq3hN4Fc+PMezyJ?=
 =?iso-8859-1?Q?/BGLFYrat/R2zQCNdEk/+SsFgoE2QeVC476u52NAhKDXeZCvFBK4p0CoVQ?=
 =?iso-8859-1?Q?5lqcX+/glpoNWBf8RSKAi8Esd7sNqSJ1d7R5EoguTEOuMTwjnU0BQCv95t?=
 =?iso-8859-1?Q?FYTWyOIXvgO9Fz/jb4fCGzKztl7KRv54nVdT9nwGqCbhmYVaTxxmeWJnhS?=
 =?iso-8859-1?Q?A1EoZYiZ7IkUj3qfP4Ak1WpezX4FqLHJdcOEN4hddNPq8ToHvkZKLPNiEG?=
 =?iso-8859-1?Q?v/Woay4xz1Se5aaIeSndJyM7RNgnZW7rTSzzPuZJOwCalFKtYqhVvEKGcU?=
 =?iso-8859-1?Q?XAe6TMZ0OiuMK8TmgZCgnMNaoI2mye8ASMjsGbp69bZnR8AkOlmr55zihe?=
 =?iso-8859-1?Q?ddxULKmZmJu738jtUhx9EWHE58tMXTSG8l1HJCIsCFohCWLJ7OHT9fMboE?=
 =?iso-8859-1?Q?6NR0cexpQUN1nR3HxIB18sWKkZ6wIwC0ji/JfVaWqlFmfxz9v5vvuhrm+G?=
 =?iso-8859-1?Q?2CMhwK794WWHF3ONmv3QcDJ7YwOIMgGWuRMmpFzeHk9BF8pEpat8qDkcb6?=
 =?iso-8859-1?Q?JWHxqMSQkE33yw8UPdUuJrxjAp0zM5ND27LhFOwAvnMafCz8YCdOkZxHWg?=
 =?iso-8859-1?Q?5PnYFGJFDoIXOqULmrtXZYe1H4CRWZuDt3TedTFUQexsbyU/1FkDwEtZzb?=
 =?iso-8859-1?Q?+XEJNtsgFV0VVoHkj1SWPkjInlv5Eyu16EX10UUj5fYME0lzvA1+rhvCxp?=
 =?iso-8859-1?Q?kCyg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: gocontroll.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7630.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45f492a3-de4d-46bd-56fb-08dd556f9749
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2025 07:39:52.3921 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ECBhS+MbBeEwwPsGskHjFRI9Avw0QUrrKSS5D/KUrg0Lr/NGM5FBh4zoIYkizG3ZyCh/XkdUpDy0XbX8u+AtQyzywIrZbthEFVehj7vXfx8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8004
X-Mailman-Approved-At: Tue, 25 Feb 2025 08:31:33 +0000
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

From:=A0Rob Herring <robh@kernel.org>=0A=
Sent:=A0Monday, February 24, 2025 9:44 PM=0A=
=A0=0A=
>On Mon, Feb 24, 2025 at 02:50:55PM +0100, Maud Spierings wrote:=0A=
>> The main point of the Moduline series of embedded controllers is its=0A=
>> ecosystem of IO modules, these currently are operated through the spidev=
=0A=
>> interface. Ideally there will be a full dedicated driver in the future.=
=0A=
>>=0A=
>> Add the gocontroll moduline-module-slot device to enable the required=0A=
>> spidev interface.=0A=
>>=0A=
>> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>=0A=
>> ---=0A=
>>=A0 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++=0A=
>>=A0 1 file changed, 2 insertions(+)=0A=
>>=0A=
>> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Do=
cumentation/devicetree/bindings/trivial-devices.yaml=0A=
>> index 8255bb590c0cc619d15b27dcbfd3aa85389c0a54..24ba810f91b73efdc615c7fb=
46f771a300926f05 100644=0A=
>> --- a/Documentation/devicetree/bindings/trivial-devices.yaml=0A=
>> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml=0A=
>> @@ -107,6 +107,8 @@ properties:=0A=
>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - fsl,mpl3115=0A=
>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 # MPR121: Proximity Capacitive To=
uch Sensor Controller=0A=
>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - fsl,mpr121=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 # GOcontroll Moduline module slot for=
 spi based IO modules=0A=
>=0A=
>I couldn't find anything about SPI for GOcontroll Moduline. Can you=0A=
>point me to what this hardware looks like. Based on what I did find,=0A=
>this seems incomplete and not likely a trivial device.=0A=
=0A=
I'll give some more details, if there is a v2 of this patch I will also=0A=
add more information in the commit message.=0A=
=0A=
The module slots have a number of pins, a lot of them currently unused as=
=0A=
they have not found a function yet, this is very much still a developing=0A=
product. The currently used interfaces to the SoC are:=0A=
1. SPI bus as a spidev to ease developing new modules and quickly=0A=
integrate them. This is the main communication interface for control and=0A=
firmware updates.=0A=
2. A reset pin, this is/was driven with the gpio-led driver but I doubt=0A=
that would get accepted upstream so I intend to switch to the much better=
=0A=
suited libgpio.=0A=
3. An interrupt pin, this is currently only used in the firmware update=0A=
utility [2] to speed up the update process. Other communication is done at=
=0A=
a regular interval.=0A=
=0A=
What is unused:=0A=
1. A potentially multi-master i2c bus between all the module slots and=0A=
the SoC=0A=
2. An SMBus alert line is shared between the modules, but not the SoC.=0A=
3. A shared line designated as a clock line, intended to in the future=0A=
aid with synchronizing modules to each other for time critical control.=0A=
=0A=
current software that is used to work with the modules can be found at=0A=
[2] and [3], one of them is a Node-RED module the other is a blockset for=
=0A=
Matlab/Simulink generated code.=0A=
=0A=
If you know a better way I could describe this in the devicetree then I=0A=
would love to know, I am always keen on learning more. As I said in the=0A=
commit message it would be nice to have an in kernel driver that would do=
=0A=
all the interrupt handling, firmware updating, probing but that is sadly=0A=
not in our capabilties right now.=0A=
=0A=
We are hoping to eventually make this interface an open standard that=0A=
other people can integrate into their PCB's to make use of the various IO=
=0A=
modules. I have personally made a raspberry pi hat that can take 2 modules=
=0A=
for example, which I hope will in the future serve as an open source=0A=
reference design. It is not open right now though.=0A=
=0A=
[1]: https://github.com/GOcontroll/go-modules=0A=
[2]: https://github.com/GOcontroll/node-red-gocontroll/tree/master/nodes/mo=
dules=0A=
[3]: https://github.com/GOcontroll/GOcontroll-Simulink/tree/2023b/blockset/=
code=0A=
=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - gocontroll,moduline-module-slot=0A=
>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 # Honeywell Humidicon HIH-6130 hu=
midity/temperature sensor=0A=
>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - honeywell,hi6130=0A=
>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 # IBM Common Form Factor Power Su=
pply Versions (all versions)=0A=
>>=0A=
>> --=0A=
>> 2.48.1=0A=
>>=0A=
=0A=
Kind regards,=0A=
Maud=
