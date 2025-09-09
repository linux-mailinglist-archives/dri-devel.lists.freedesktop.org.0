Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2902FB49E57
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 02:52:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF83710E21B;
	Tue,  9 Sep 2025 00:52:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="MYxqLEe2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013026.outbound.protection.outlook.com [40.107.159.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7C1F10E21B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 00:52:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p/zSM4EzspV/9dAGp8p2aJ1d/VB3QsnXwsoi7lu/WWPfuQzXt2FVTZyLXMf7uFW27nqsJaNb8ji0vg7+U8Duc1OVtkx7ojDIr6QN8mV8HY2jmUGmQM+PjWB6Dz0AXtvuIx9gNAWGT8IvWiL8tsvWP6YEbEe9CciRrGZM8WECA0kUtzAUFlipeYQFzV+5oYMgndRuo9jlp4XHYwHkUy52g0D+/NeTvQeixhuwG8j37AR7ThkkV0UXPTANEdX37vctanOPcvbA3XkUA3Ek4Gjf58hwGQ7RyapsyohrP+TxOmIoQgbj7pBGKwTXcGUG8EkzTlG7ncHX5VUgXNdkxYBjxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EMl8OLfFWALQ1UWUexXCJh+p0U690W6Tvjj6ZygLzrk=;
 b=COIRjLkQkTGBUN8MWkyNfKcXx57woFjBBestbloE6O0UrEmD/Kmb+02MqzHa3us7xrHTfrOGoHGeXywliRiiVWw6iDDdK2IT/E2xraY+Ox1X/VKfKwcWpQ7obejpmO9dT5EoRSCfuyxw7FAKqhle+KD5ko/N7ucHeyW44Ouofux7gd24o62KRQCNSUMSpxkp4RxNBwFytWLiVO4CYPrNHWIYrcQeKpLNtXGQ+y3vJBPBUT2MqZffIXSaTu13UniATDYv+i7v2R6PahPUHheQ3baeuS+9/lsoZucZvUW/W7mSFy5affJ/5QbsXD+o9BnmWOSJAwnaQcQ6U7YBi26s7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EMl8OLfFWALQ1UWUexXCJh+p0U690W6Tvjj6ZygLzrk=;
 b=MYxqLEe2FJQ9zAe2Kk4FjvvNsrQoghbv5MbPADOh5KgOMN/QWQznAww09w8GOEgSfK49fcZeuCETrYhlQR4TiRAC5/hJdqfBlTAWEQoB8SGDgI2x3euKODRrJEr4vMWCtxwF+MWnRAS0caSZ9zfuiyb4BBDDPjNU2Ee4ByY0Fb93Ubk8/XfdEWOIFeesXaFuFoc5Wjh69AIAUSwKYGKGi+ycllyZLOWzkIkja4BDAPXeofLdxlG/voqjHrrPA5e36bxnl3GdLhrtQHCkAuPs2WNe4pG/vXhv8Qoal69LJ9uAtk2e7wlfjVeS4kfKFstIQ4oE5aSQVYUZZ+Ozmboqjg==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB9401.eurprd04.prod.outlook.com (2603:10a6:10:36b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.14; Tue, 9 Sep
 2025 00:52:04 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9115.010; Tue, 9 Sep 2025
 00:52:04 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Marek Vasut <marek.vasut@mailbox.org>, "Peng Fan (OSS)"
 <peng.fan@oss.nxp.com>, Alexander Stein <alexander.stein@ew.tq-group.com>
CC: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Boris Brezillon
 <boris.brezillon@collabora.com>, Conor Dooley <conor+dt@kernel.org>, David
 Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>, Steven Price
 <steven.price@arm.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [PATCH v2 9/9] arm64: dts: imx95: Describe Mali G310 GPU
Thread-Topic: [PATCH v2 9/9] arm64: dts: imx95: Describe Mali G310 GPU
Thread-Index: AQHbmpzqfZKsR5n3oESZEmuaBaK55LOB4BQAgQHuiICAADoJAIAHCQaw
Date: Tue, 9 Sep 2025 00:52:04 +0000
Message-ID: <PAXPR04MB845928079F1D909E88726135880FA@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250321200625.132494-1-marex@denx.de>
 <20250321200625.132494-10-marex@denx.de> <6144881.lOV4Wx5bFT@steina-w>
 <20250904095435.GD13411@nxa18884-linux.ap.freescale.net>
 <ff353bd9-500b-4d73-86d3-32283774082c@mailbox.org>
In-Reply-To: <ff353bd9-500b-4d73-86d3-32283774082c@mailbox.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|DB9PR04MB9401:EE_
x-ms-office365-filtering-correlation-id: 960f0306-a2c8-4e2f-c8e4-08ddef3b1829
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|19092799006|366016|1800799024|376014|7416014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?bGp2WmI5K2hhaW1aTTcxc0M3b2pNS0Uwcm8vckFQYlB5YUZGUVJsUitxOGhh?=
 =?utf-8?B?UHdLUTNkV3lUbm9GaDQ5alc1eGtqZnMwdEFIei91bVdDeVVOYkJNSWlEQnZS?=
 =?utf-8?B?UENlT1NqUlIxMFZqWit0bm9PY003MFNLeUZqVitrZ0dWaVdIWFlOVmtsWDR5?=
 =?utf-8?B?cTRrZWI0Q0hXRGhZK2hTL1h5VU1HeTZHSWZIa3c4ZnV4UkFERG1BUEg0M1lD?=
 =?utf-8?B?QjNVeHJ1d2M3NklyRkk3NDY3U2RpdFhEWklwM2loTkNRZU5zOENVK3B4dWZw?=
 =?utf-8?B?MnMxMzVwenJuWlRLc0t3WWdvWUVWTEpYdjBybUE4ZDJ1NHJvMUQraXNKZml5?=
 =?utf-8?B?SFdDK29ZdWhhOEx6VnhoN2FORklkUUozTWV6QkFjYUtaelFqZHRIVit2SEx2?=
 =?utf-8?B?RHRhNDBDUmdEOWdZSU80anJIcFlZVmZyOWNRcHhNNCt5c21xOUxlbjRlSmll?=
 =?utf-8?B?aEI2L0wxYXZoeXZsZEhlRU40Y0dlMTJhUEdwQ3BQK2YxU3pGZ0dseFB6NmYr?=
 =?utf-8?B?Zkw1UjM1dmJ5Nkl6QzJXeFhraTdRbVFWWWdiQjIwRisrWWc5MGxxRjJsaExB?=
 =?utf-8?B?alpKWmQ3NjhSWlREdTQ0RDhZRGtpOVV0ZTIzSkNadEZQdWdXY0hlSmlmeW5h?=
 =?utf-8?B?RDBDWVhTb0pSMm4rTWN0ZUluMUtBWnJUNHBDMndNU1FDQWtFcGtPcS9MWUFO?=
 =?utf-8?B?S2RQU3JaYkk1a0VXWmJtVm8zMzJzUGNENVArYWtPM1pDS0IrYzlwWnVWS1Vk?=
 =?utf-8?B?UmViL0VTbTJHZGcxM2JCMU1qbkdRdWhIcUlEVm5ndHhycHphVHZqU1h0akZq?=
 =?utf-8?B?TFJDNWZSLzc1WjIwUWZXRjJUdUxubkxvTGhtU0QyWGhyakk4M3hvT1BRWVBu?=
 =?utf-8?B?YXF0RTNTM2xvMlZwSEZDUXBjUVMydWxlam9rSDc1SDRJNmdRdzJkOCtpcVVG?=
 =?utf-8?B?cnU0aWgzMUZPU1JFMkxUdjQybzg2Rjhiem1xa2xWajYyM2VxSWdnVWthZVZM?=
 =?utf-8?B?TmNTcWhpckk1WlZ3anBnTTFtZVlKR3ExbUxWWXFDbDZOMWNESVRtVXRJV3NL?=
 =?utf-8?B?VUZuZXM3NDhMSEZkU3phK0JLOUlBdzVVa2x6VmJpd001cnFlYm5Vc1lPTXYy?=
 =?utf-8?B?NnNYWlFHeWRGN09DRlN6ay9EM0did0FOdjh2REJTRVJ4Q0hycnpZNFdJU3Nu?=
 =?utf-8?B?RnlZd2JiYTZJdkFpZVpKazluVWJ3RzRmWFVIeXkzODgzNUNhS3FQdlVnREsr?=
 =?utf-8?B?WEpjbFYycktIN3pkVWdiamVTMXZNQnp3N2hEMVM1MXJYek1aRm5MK25WQ01Z?=
 =?utf-8?B?VC9XOHNVRkZIT0lLWXFxV1ZPYUlMamxleGJvOUt4MGV1WVN6bm1LenJaUW1H?=
 =?utf-8?B?QnJXWWRiQkwzeHdRZ3g5eGZaaTNXdjJiRkVIUkxseGZtWER5Yk4wT0FxVDBi?=
 =?utf-8?B?TFFDdzBweS9iZThWaHhZRmtQczNwQlIyTUNIcHArL3kvYmRuVlI1UkxZNWFI?=
 =?utf-8?B?T3c2ZEhiYVh0dHdtMkdhWTg5MEJpR3RaTldySGYxVGY4KzdPK2M3NmlXWFZG?=
 =?utf-8?B?U3lXL203Nm44ZHF2MkFYZ0IyTGJmYmNiOElJZnYxSjlFSEtyZDFzMTBzSUla?=
 =?utf-8?B?NVozeml5bnlCbUV2T0FrY1hOcWVGL21xWjdFZEJLLzBieGtsNWZCSVo5WDRk?=
 =?utf-8?B?QjlGb2l4ZGZYbXVFdlZpYU5SYnFCVzQ3N09iRmhRR1A0RzU5RHpKQWVhWFky?=
 =?utf-8?B?c3pBaDhOaDd3OGJVbHhESTV2cnFBcldWcE1uUGF5YlVHL2dOZXJ5bzBCazQv?=
 =?utf-8?B?Z2NoUGFLdUlMdDlFei96ZmpnMndUbFE2ZHZURjhMbUczUUNWUkhRZEs4SVA5?=
 =?utf-8?B?TE5oYVVjOHpKdWpDSEx0eXM1aEo1NDAxS1lMcW1QZXYxMGlicGVubmd5WWov?=
 =?utf-8?B?VDhvajdsTkZEYlM2WlJuZFQ5aWFLaStyNXdsWVlUdmQ1VEFFcGtpZUk3ZnNU?=
 =?utf-8?B?NW9wd2lLb2JBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VklhNjN4RTVnSHU3ajZuTGlLM3JnUVUyRmFJcUoxZFFuSms5SWNNREU2M3c2?=
 =?utf-8?B?bnR2QUpCcGI1RUVnVTh0L3IxaDNZOVo0NGxXY2J3bm1WOXZiV2kySU13anJH?=
 =?utf-8?B?d2h1cHFTcEt0N0p5bEhrV2txTGpVUE1wVEMxZVBnQ1JyeHY3QWxhU3hLalh1?=
 =?utf-8?B?N2REUHJHMWdiVm4zaXY0T1kvVy9qZ2ovV2p5R01mQkxuSDJVbWVvYXlZa3Rs?=
 =?utf-8?B?dGlFL0ZBRFpKa3lNNjVZaUFFSWlucjBZZWlPWUFiSEFQOFg1WjBwUmpUVUwz?=
 =?utf-8?B?ZHp1dUtzWTdPaE1lSzVIMWd4TWhMeTdqQmp1eHQyZEYrYmVwY0Ixd2hMak5J?=
 =?utf-8?B?OTNqak0xenJ5QVZlVURUbGRBR2J0dnBlMWZCQmtETEpuM3RSSThvWHZOTlhy?=
 =?utf-8?B?NHhTSFhnQXlUM25mSFlYQi8xR1liU2kyNjNkQnl3K0FCZ3BHcmhGRDNaNVY5?=
 =?utf-8?B?ajJ4TENGZVJ4ZlNobzNSTW1RU0lseWlUOG0xUkNWVndEVCtGRGs4VVh2VmxP?=
 =?utf-8?B?VHlwUkQ1VEJkSFZvMzEzTXZ4bDIyVi9JekVPTHcrenN6UEZ4aGoyeUdSSTRx?=
 =?utf-8?B?R2tpcllhSW85ZVE0bXN6bHJmQWh0dDZTbUNSUm5tYVdTYm5iVmFUWFZ5SkxG?=
 =?utf-8?B?MnZIWXpBUzZXVFJMRE15WjZ0K25sWG1ieWFRQnp5b2srdGVhME1LdVpXTmVT?=
 =?utf-8?B?Q2NoTHZiMXVSd1pKeFV5K0RZNk9rT2ZQbTR6blRSVkdRWDZkM3hyRUcrMzNW?=
 =?utf-8?B?bFlrMDhMR3BFbmtXRGIxV0UwazhXRUh5YlVCbkVML2doVmViU0JwTERCWTMy?=
 =?utf-8?B?SkZybENONVZjY0Z4TmhFSXVZd2Z0Yk1QQVJhR05YZ1Q3M29mWTdlb0JmT2lo?=
 =?utf-8?B?YjhNM01DMk1CRnNQWHl1UE5sSTFwakdPcmdFd2lwOHAwWE1RejIyM2p0czV0?=
 =?utf-8?B?QzMyWk1GZ2NNNFVkNVNnUkdHbVdmL3Y3ZEJWTTRsK0JJOXZRRWhHMWZ6bWRN?=
 =?utf-8?B?TERxWEZqLzFTUjg1ZmxFY1BBaHdkK08vbkZsc21hRkhzRkdTY1Jyc0ZycElR?=
 =?utf-8?B?S1JjTWxvY1kyK0VwdjJ4S2kxTlVzcldKeWk0SlRsQkNNa3F6VDZpeUQxbVFQ?=
 =?utf-8?B?Vkx2VXNNV3JJdCt5dHdya0pPd2pGUkg4RDVrdTVNNmtxNHVUV2VnRzBQV09m?=
 =?utf-8?B?MnRTNU9wNnltbVdqMEl3a3lnZm44NTIrUHV2WU9qeDVVdEtKUGYrMzMvKzBF?=
 =?utf-8?B?QUpBVWE3empkV0tlNkRJNWhzTy9zM0VrUFNSMWE1QjhhZ0Y3bWZMdEloS01t?=
 =?utf-8?B?RUZwd2g2T0RRMmlURmFoNDl3d0JUdEhvTm83NXR5ZTEzcytxY3ZSaFBpYklY?=
 =?utf-8?B?a2Zib2szSGJ0WGI5KzNIenR2VDhxdWxRNzhMSjE5bTAwZ2NqM09IMWJmM2lV?=
 =?utf-8?B?cnBpQ0g3bTlRK3F6NHFVdTZEK1M2UnpZS21hU3h3MWFJRUxkOTdRZWhjQXRE?=
 =?utf-8?B?MDBGZTgvWnA2TGZHWnJZTzR2WGdqdHZrUjBWRzBjN0VCd01EaDVBMVZaaDZw?=
 =?utf-8?B?YWNtNzRKOEMzV1RQeU85VTA0Zm1ESzc0eTlSaTVYb1ZFQ1pxUkk0M01kNWJj?=
 =?utf-8?B?SFVDSGVvODVNSklyam9TTGhtSWYwRnFWb1dOdlo3bTdLRXlESEVJS2FlYmZX?=
 =?utf-8?B?WmJHT1NLazNMK1dYYW0ra1NLcjY1N2tpK2orRlNlQk1SL2xYaEN0b0dwSEZX?=
 =?utf-8?B?ODd2cjNhL013NHBBZHZ1dWoxamwxbmJBUUFyMlkvdEJKNG0za2kzdUd5ckhJ?=
 =?utf-8?B?Q3diNHNZQ0hkbVZ4QnBiVDRzNU5IeUJ2ZHFMZCs3YTB6KytEVzdPeHcwSlFv?=
 =?utf-8?B?UWFtL0ZyUTZSWU81ZDlLSGhPWm1IZHZsQU9JQnZ5b0NTbzVDVXJDazVZbENF?=
 =?utf-8?B?Q1hzWkxPK0Nha0IrUXpmSE5FNU1rc3g3OUptVFFiUkoySTF0blZYV0JKSU9m?=
 =?utf-8?B?bTdYeVkrb1VQUGVWMzJmV1c0OVN2L01QUUxTb0VrVVFhdE9MelJkQ3BIMmR1?=
 =?utf-8?B?Z0xLb010bUd6dzJqUzJQemV3c1B4UWVwMFVmZFBpZU9tR0VlemtLdjZENXVC?=
 =?utf-8?Q?sMLY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 960f0306-a2c8-4e2f-c8e4-08ddef3b1829
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2025 00:52:04.3813 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jPiDqsMIvVjPAUJT60sTmVR5ACnbEemGBmukaLYJq/bnhS6mEHthCoEcwNytG97JPz6AO42SFS76ZHSdhDQ4ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9401
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

SGkgTWFyZWssDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiA5LzldIGFybTY0OiBkdHM6IGlt
eDk1OiBEZXNjcmliZSBNYWxpIEczMTANCj4gR1BVDQo+IA0KPiBPbiA5LzQvMjUgMTE6NTQgQU0s
IFBlbmcgRmFuIHdyb3RlOg0KPiANCj4gSGVsbG8gUGVuZywNCj4gDQo+ID4+PiBAQCAtMTg5MCw2
ICsxOTE5LDM1IEBAIG5ldGNfZW1kaW86IG1kaW9AMCwwIHsNCj4gPj4+ICAgCQkJfTsNCj4gPj4+
ICAgCQl9Ow0KPiA+Pj4NCj4gPj4+ICsJCWdwdV9ibGtfY3RybDogcmVzZXQtY29udHJvbGxlckA0
ZDgxMDAwMCB7DQo+ID4+PiArCQkJY29tcGF0aWJsZSA9ICJueHAsaW14OTUtZ3B1LWJsay1jdHJs
IjsNCj4gPj4+ICsJCQlyZWcgPSA8MHgwIDB4NGQ4MTAwMDAgMHgwIDB4Yz47DQo+ID4+PiArCQkJ
I3Jlc2V0LWNlbGxzID0gPDE+Ow0KPiA+Pj4gKwkJCWNsb2NrcyA9IDwmc2NtaV9jbGsgSU1YOTVf
Q0xLX0dQVUFQQj47DQo+ID4+PiArCQkJYXNzaWduZWQtY2xvY2tzID0gPCZzY21pX2Nsaw0KPiBJ
TVg5NV9DTEtfR1BVQVBCPjsNCj4gPj4+ICsJCQlhc3NpZ25lZC1jbG9jay1wYXJlbnRzID0gPCZz
Y21pX2Nsaw0KPiBJTVg5NV9DTEtfU1lTUExMMV9QRkQxX0RJVjI+Ow0KPiA+Pj4gKwkJCWFzc2ln
bmVkLWNsb2NrLXJhdGVzID0gPDEzMzMzMzMzMz47DQo+ID4+PiArCQkJcG93ZXItZG9tYWlucyA9
IDwmc2NtaV9kZXZwZA0KPiBJTVg5NV9QRF9HUFU+Ow0KPiA+Pj4gKwkJfTsNCj4gPj4NCj4gPj4g
V2l0aCB0aGUgU00gcmVsZWFzZSBsZi02LjEyLjMtMS4wLjAgQVAgZG9lcyBub3QgaGF2ZSBhbnkg
YWNjZXNzIHRvDQo+ID4+IHRoaXMgQkxLX0NUUkwgYW55bW9yZS4gU2VlIFsxXQ0KPiA+DQo+ID4g
UmlnaHQuIEluIGNvbmZpZ3MvbXg5NWV2ay5jZmcsIEJMS19DVFJMX0dQVU1JWCBpcyBhc3NpZ25l
ZCB0bw0KPiBNMzNQLA0KPiA+IGFuZCBTeXN0ZW0gbWFuYWdlciB3aWxsIGF1dG9tYXRpY2FsbHkg
aGFuZGxlIHRoaXMgcmVzZXQuDQo+IFRoaXMgZGlzY3Vzc2lvbiB3aWxsIGdldCBpbnRlcmVzdGlu
ZywgYmVjYXVzZSB0aGVyZSBhcmUgc3lzdGVtcyBpbiB0aGUNCj4gZmllbGQgd2hlcmUgdGhpcyBp
cyBub3QgdGhlIGNhc2UsIGFuZCB0aGV5IGNhbm5vdCBlYXNpbHkgdXBkYXRlIHRoZWlyDQo+IGJv
b3Rsb2FkZXIuIEhvdyBkbyB3ZSBoYW5kbGUgdGhhdCA/DQo+IA0KPiBJIGNhbiBzdGlsbCB1cGRh
dGUgbW9zdCBvZiB0aGUgc3lzdGVtcyBJIGNhcmUgYWJvdXQsIGJ1dCB0aGlzIHJlYWxseSBpc24n
dA0KPiB0aGUgd2F5IHRvIGhhbmRsZSB0aGlzLCBiZWNhdXNlIHRoaXMgcmVzZXQgcGFydCBpcyBw
YXJ0IG9mIGZpcm13YXJlIEFCSSwNCj4gd2hpY2ggaGFzIGNoYW5nZWQgbm93Lg0KDQpJIHVuZGVy
c3RhbmQgeW91ciBjb25jZXJuLiBCdXQgdGhhdCdzIGl0IGFscmVhZHkgd2hhdCBmaXJtd2FyZSBo
YXMuDQpJIHdvdWxkIHN1Z2dlc3QgeW91IHVwZ3JhZGUgZmlybXdhcmUgdmVyc2lvbi4NCg0KUmVn
YXJkcywNClBlbmcuDQoNCg==
