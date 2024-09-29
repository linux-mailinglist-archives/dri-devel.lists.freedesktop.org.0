Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D38F9892B3
	for <lists+dri-devel@lfdr.de>; Sun, 29 Sep 2024 04:37:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 419D010E273;
	Sun, 29 Sep 2024 02:37:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="TVQX1myo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11011061.outbound.protection.outlook.com [52.101.65.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E27FA10E273
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Sep 2024 02:37:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ws2jUQHIFun9/3EgUymRebogxWvfxdN5EeTNi6fCZdezv3oieElhqIZCVPNFOJ8QlZ1kzfUi+eND1oxoTA+cw9dZCd2AdHCiJUbdTorupRSOtAp1Ms3InYhvGw6Mr85DdG5337blg9IbXmqg6ECsJWSruzrt8i2U7V81oFXveNrQuPxFWDUwfjaHSiAHmaL98JsE4x78bfCKLO0wpMpjJY9RLxzqm8hbxVaxFPLo3jleFN2eTS2aaKoL8oocwftzPQwOJk5mTTaomRsZWGOgTAu3JP0VKfZhWxBgaNLFgW7rQE//VHzn7pYqKH//feF4muU1hY5UWDpD2iIhxJwkvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SvmlGQcB6bLoSEgaQ5yKErnlOA8jiqggA1jwRa8uvyY=;
 b=jx78UhXE2uwZbsKk3HJb8H8RJenRgkNYvhGlxzj4SjhAKD53aT6ikOAUiIG1is2A9rIp9hwb7ZNyD14XQwAk7zdpWml6J/vKkTf7QQVR1vlBiAqhRoQf8xW4OstwLoZiqlhsReJOfRY9UwUxK3Zc8FqgffQSFLPTRZj/sEQcgrP1pdGdVXIcVqd1RB59SpDr05nhO2HlwvOIOWEgPRbNDdAXYI7ZsDpbAyMMDT1FdKP8j2kpYgdl6rzxPtQDsh5OlQLL3EjFEzcEM6Kv+vjm+yX2SSY8QZSF4gpGLvgAOX4O9rmPJoQrnPveHQblVJe4iVpUrG/tNvWxb0uInI/UWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SvmlGQcB6bLoSEgaQ5yKErnlOA8jiqggA1jwRa8uvyY=;
 b=TVQX1myoZ6fI/W62sczy1h/pBmCsleMyzD4CBYmYqlcJ7w4CCdIL1l5/8pZ6SxF4RRwopS+oUIzKQ/vqW10vympmjoqz99MNMpE1cv3wzFP2xouI0x58+nJlCP4c/ErAbkdZSldFwcHzbZ/7pAR7Z9m3nNw+sJnLW007liiKGhj6p2HnTebRHTNDvFHmYroN67WFnolOxo0xz2URaSE1DoybuQJr8sjFPCdAmXyzDwIRN4U7Wa/cLjhCOMYT7bRdHbPX0smCd6Ohp82fx6QXpRhEih9TeVh+Nt2mm33sXD3x8zQUC12JuI4PvSOY3Fp9rtTl5J+mCQXFR5nvVHZHBg==
Received: from DB9PR04MB9452.eurprd04.prod.outlook.com (2603:10a6:10:367::13)
 by AM8PR04MB7812.eurprd04.prod.outlook.com (2603:10a6:20b:245::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.25; Sun, 29 Sep
 2024 02:36:55 +0000
Received: from DB9PR04MB9452.eurprd04.prod.outlook.com
 ([fe80::4c69:3f0c:6701:a1cd]) by DB9PR04MB9452.eurprd04.prod.outlook.com
 ([fe80::4c69:3f0c:6701:a1cd%3]) with mapi id 15.20.8005.024; Sun, 29 Sep 2024
 02:36:55 +0000
From: Sandor Yu <sandor.yu@nxp.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
 <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-phy@lists.infradead.org"
 <linux-phy@lists.infradead.org>, "mripard@kernel.org" <mripard@kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>, dl-linux-imx
 <linux-imx@nxp.com>, Oliver Brown <oliver.brown@nxp.com>,
 "alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>
Subject: Re: [PATCH v17 3/8] dt-bindings: display: bridge: Add Cadence MHDP8501
Thread-Topic: [PATCH v17 3/8] dt-bindings: display: bridge: Add Cadence
 MHDP8501
Thread-Index: AQHbEhhyLpZFpmXKlUec4pLwCRhlGw==
Date: Sun, 29 Sep 2024 02:36:54 +0000
Message-ID: <DB9PR04MB94529379E1947D66848B7BE2F4752@DB9PR04MB9452.eurprd04.prod.outlook.com>
References: <cover.1727159906.git.Sandor.yu@nxp.com>
 <b2e1d26f964a03163ec7a1ba6ac8d7c88d6cb111.1727159906.git.Sandor.yu@nxp.com>
 <wfdanj6ibwybx2puqvi6xjy6h5t4yagnb2mod7ln3zca4dl5wz@4mvbe6wjavb6>
In-Reply-To: <wfdanj6ibwybx2puqvi6xjy6h5t4yagnb2mod7ln3zca4dl5wz@4mvbe6wjavb6>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB9452:EE_|AM8PR04MB7812:EE_
x-ms-office365-filtering-correlation-id: 025fa1b4-3766-41d4-6dba-08dce02f9519
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?gb2312?B?VkthdU92UnJmQTRTWkVSN29IUkpscW1yZVlpd2M2WFhwQlAxWExoRDdycDN3?=
 =?gb2312?B?RDhOQnlJaW5WeGdUNURwVjRvRDNHRmgyZ1dHcnhjMUhvdFJiTkVXUXJKZTl5?=
 =?gb2312?B?YXZrS2k4L0N0ZWpGcmR6WkNyamhmejloSUdCcU9IL3d6OHl0RGl0Yy9tMDRa?=
 =?gb2312?B?blZldHpMeU1sdEtVbGZYL3BOQmh0aUtaMGhnallxVkNOS1Q5b2pXb1JnbUh2?=
 =?gb2312?B?VEdFOEZzWHpFL1hZdS9EdHBBWFRXTGZvay9KVnRWeEhRRFdiKzdJVkpBUDZW?=
 =?gb2312?B?R3orUXRVM3NjamxkRm9tcmVzem56MXptdGY5U2orRDcrT1JKVXNWMFVyQ3E2?=
 =?gb2312?B?WHhxTzFGVlYrWFBFYzlFOFduM3NtQWdPR0VUbnNGb2k2cmFKMEFNT21zMTZR?=
 =?gb2312?B?VWRieHhQSGVzbU1CYWcydlBkSUJtYkIvM2JQMy9paklOQTFCSzZpaDd2UWNR?=
 =?gb2312?B?d29JZVUwNkhBdXhIeUVTVU9nVUltbXNxams5QjV6Tjh0aVVIYUg4UzdPUm9u?=
 =?gb2312?B?MU5RSWpPYTl3QUZYSGxWSlJiZkxwZ0FhUlFSaGJzOVRuM2Jsd2ZUdk12aXdx?=
 =?gb2312?B?dnpFUFVEckNmdVNGeXJNS1VEamNWZU1FMGs4bVhHZ25BcGJYSVBaUjlNVG5z?=
 =?gb2312?B?VjZWeWl3WFpCbHB0Y2hjemMwYzlKbjdkSjZpRTBXSmJQdlpWKzlaTzZxMWJy?=
 =?gb2312?B?N0tBM2lHekgzTTdJU09iVEwwaFV4amt2eitMR2orZDEyVHAwaDdNZUdCdFov?=
 =?gb2312?B?NkNVU1ErcnA5dmo0Y0kyM1FhTWNGRHJ1Nk5COFpHRjhZdld1RWtlQzlNYm8w?=
 =?gb2312?B?YWMzY2VUN2xzL3ZkVXVjcW43dDNBNHNoc0d4WjNZUlJHU2E3NnlFalJhM0Mv?=
 =?gb2312?B?UWxmcGRKcG1sMUU5c3p5SENYSDlLMko3Yy9FVGZUZHBQUWwrUGNiOGVFV29u?=
 =?gb2312?B?alg3b2lhWlY1VDNQR2dyU3JRa0Zhayt3T1pHamU1YTc1NUFrbmhsb29CRkV3?=
 =?gb2312?B?TS9EOEdpZnBrL2xvaGV0TGMwMXAyMTV5d0p6a3JpdWR4K3BZVFNXaEdsZVF0?=
 =?gb2312?B?NW01eWRleGxvNVNVTGJYRUhKYXNLdGdsZ21KcGU1Z2Z2dXBnYTFsVmc5TWlH?=
 =?gb2312?B?SFlHSUZTdHVXcnlROHowbjd0QUlQZndEL1hIV1hrQUM4UmxWVCtOWmFPU0hN?=
 =?gb2312?B?cnVpTG5ZcHRzVzZsT1N0OGNWbmg5ODBIaS9YK0U5UzdHZGlEWGgydWZCdVUr?=
 =?gb2312?B?NXpSeCtYcWVjdlpiMmFSNFRDaVd0SVU4MllockhWZUxiYVhWSm9QNzBlVEll?=
 =?gb2312?B?YkZvNkpVeE9XeHBjMXF4Z1BlNytudmh2T3RjTzdSNmVPaW9lcmpvZEN0ZDk2?=
 =?gb2312?B?L1FPVXc4NVBkZDVlVmNPM2pkbjY2Rzg5ZDVvOE9FQWdRUmppN2piSnI2WFpm?=
 =?gb2312?B?bitMbkhucm4wSlhnbnd4UzRMbXdRZjVHZk8zZ2FITFpPTnl1UnRSZVkxSk51?=
 =?gb2312?B?ZDhWeFJJZUJIc0JRVlJTYUpKVHBxNGtFZjBIaTBDMU5nSWIvcEpNWFc0Mlg2?=
 =?gb2312?B?SGRDZi93cFdheVVCcldCOVdLSHBXc2JQUHZTMzVITjU5M01zdGxXelFWVXlv?=
 =?gb2312?B?NnFmNGF6NitTUkIvQmU0N1RxZlpRUEdpQWYyYnk4TE9XS0NHeGh5bEgrYVJQ?=
 =?gb2312?B?VWFma2NUMGVNV2lRc3ZDRy8wMVZQNXhOWS9yM1NXM0QxeGpXT3hPMHVEUnlu?=
 =?gb2312?B?ellud09yOTQwcHlsdTFydDA3MVZ2RFQyV3E2alZPZmt4S3ZkUjJtRVhXMWFR?=
 =?gb2312?B?WE12eXBRRU0zZ1hURUFHVWxYYTBVeGtrQ2t3TGJuaDErRWxraVBvcDF3WnRk?=
 =?gb2312?B?T1EvNnZXTjFibkMrYnlJM3JCZzdhUlhCblVGR3FyeCtwenc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-cn; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:DB9PR04MB9452.eurprd04.prod.outlook.com; PTR:;
 CAT:NONE; SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?ZTZnc2dlUXdlN05TcTN5NVJQUkYzbVJrUjlxejQzZ2s3SHpMWi9zUnhmVU1q?=
 =?gb2312?B?RTF2YWk4WUEwSHVhZWRsd0p5cFdVRU82RGtvOUYzK21yMlo2QkF6MlZ3d08w?=
 =?gb2312?B?NG44c2gvVEViZENBbWhISU5Nd1FsRlF2dlN4WG1aMnA4QnFkTWg1ZVI4ZjN6?=
 =?gb2312?B?ZEZGVTNnTCsvMmEwSERZdTdIVVZTWG11WjBQYkxZekUzNEM2enRIWHA2QVR3?=
 =?gb2312?B?YzQwWnIxdVFUVDdWRnhyQmNzSWlMUFRubU9ybDB1V2VMYjJHRUpRc01lV0hK?=
 =?gb2312?B?QmNQRlFFd0hpb0RoNk5tTTk2NDRaZEU0Y3dqQ1ZIcWt3MnN3SHQxUjUyRGZ0?=
 =?gb2312?B?Z01hWjRCRE53cHdlb01iTG5ZdlRsbnZwMEhiM1pyMk5qd05OY0ZVdlR4NHRL?=
 =?gb2312?B?WTk5RjRubXNqZExuSEtpaVZ6Q0JoVTAxc1NTSUVjTENBdUs3Tm4xYnlrRkRS?=
 =?gb2312?B?Y2dRQzUxSkhCZTZNUE5EWnJtTldLRTNNdVRvSjY4VEtJa1ZqS2twSTZ4Ukw0?=
 =?gb2312?B?WGxIb05HeDdEdVBhSFdWOGh0RGdzRy9YVXFnZXh3NFY5ZDU3S1EyaXYyT3N4?=
 =?gb2312?B?VDZ3TnEyaXFwTFVram1qV3d0aE9hYmk3ZHZ6U1BVeXJpcCtVaDR0aTRxVVFS?=
 =?gb2312?B?b25XN3NQWjJOOGNFMUxlZFRuRFpxbEg5MysyWTQvZkkzMXVodHNyTGo5MEZ1?=
 =?gb2312?B?c3RnQ0g4MUxXeG8yalRhd2ptVFgxYzlrYnBqcHJlejJKMmsvTUFIODMyK01G?=
 =?gb2312?B?R3MzMDBYSWNMYzlPL093RW55anVSb3hUOUFOWmhFVmhPajhwTkM5WE1ucWhp?=
 =?gb2312?B?TUxpTkludnlCTGJZWjRFeWM2UElEUXFIMHFHUm9MQlVvUFFhQk5mUHpGeHZy?=
 =?gb2312?B?ZzhHdVBSb1V3dms5VmwwNHA2aFIyRk0rSmdMSDJERGhSemR0OXNnZklxZWx1?=
 =?gb2312?B?d0k2Vlh0SnRkbTFpdkhhYTNnN1JzM0tIVFJvZHdxYVBKSS9FdHdFbzlUOXFG?=
 =?gb2312?B?NDNaRVhUNHErcXRhdkpTa3dhRXRBNU9yaC9rc3BCMnk0L1F5bkhzVFZOU3Ir?=
 =?gb2312?B?MUZ6QVZ0N1lwUVp5WEtLZnlkSzBNZDdCTFBROUZXN282djRKbU5NM3lCeEpS?=
 =?gb2312?B?ZjdSZEdlMjlSeTk4ZktXOUJUY3NmNTV0eTMyemRtUFVJMDJPQk5CM0hsb3dF?=
 =?gb2312?B?TzlNUjlXWS9Sa1BYRHZvWnowcmNBSWFIaUU0OGZRVzUydlg4cmxRRzBsdzBl?=
 =?gb2312?B?ZlY1TStKU2ZyZVJvSmlTRHhncXhIM2NmVG9aaENNVE1jT1FYamZmYlB1ZTZZ?=
 =?gb2312?B?aElvTVJwYjFSenI2SGFDT0hWWnpkKzJFR3ppVnVENFl4ZFMrUHZtb1VaQkl2?=
 =?gb2312?B?OW9kQVBrcDJBY3hsU1NIV3FYREt3dXFtSHRyNXJ0OVNnUkhLQ0VIVHpyUy91?=
 =?gb2312?B?NGdyNCtVTXBWVXIrTnFGZktkK0FqSjg3b1pya3pnVnFzQlkvYkZ4azRhZnha?=
 =?gb2312?B?ekZaKy9zT3k2L0d3N2s0U1lsOTRUUUV4c05MOVBCWEZiazJaU2hCNW0wd0V5?=
 =?gb2312?B?b3ZOdnVnbkptcHNMUG4ySURlTEw0ZmlGUFJpRHVLUUpzaHd0d0FoTGpxVFZW?=
 =?gb2312?B?ZHRQUExWSGRUSU0zTUM3cEVsdnl2QXpSb2ZIZis2QUVSb2UvcXE3dTR3ZEFr?=
 =?gb2312?B?ckVPM1BrWDZaanVFWHZxY1BYdUtCdHdpNEdqS2pXYTNSWHIzNDVJY2ZvbXFx?=
 =?gb2312?B?ZUVVVmdqZ1NsT1NXSG1vbE52WDJvOW9hT0R2RkVpL1N5Mjk5aTV6QS9zYXlF?=
 =?gb2312?B?bWIra0hudzYzbGl4UUJTNFA1bGVXSjdyWEVUN2k0Q2taK2FJbFlmZ3prYXA2?=
 =?gb2312?B?bW12eXBmMEtuUXZkQUZ1TVgvbThFZ3dPNmIrVHg0bk5TTFdwS1lNK0dqYVhj?=
 =?gb2312?B?L1dWdEx0VmZFdmN5VkFQT2VKeTVmRE5RNExBRW9PQVhCbWNXS2FhZlhpdjZ5?=
 =?gb2312?B?T0xjSnYyL3JFdThjUFc4U2xaSXJRNU85WHlpWnp5T3Nxc3VTUVMyaHg5ZmZ6?=
 =?gb2312?B?ZVEvYWdXcWgvbktLSmROTkVwV2hGOEdiWWcxbm9xVTd3NVJ2K3JuYk00RmdO?=
 =?gb2312?Q?iYGc=3D?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9452.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 025fa1b4-3766-41d4-6dba-08dce02f9519
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2024 02:36:54.8927 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 68FTJNwWX4kwrjiKb8gYiRy0GdUWvEAr/5+6aAW3T3ZCh/um9wEDl+lsd5bKUpnevF1fVqZif0wPpjgefSLncQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7812
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

SGkgS3J6eXN6dG9mo6wNCg0KVGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzLA0KDQo+IA0KPiANCj4g
T24gVHVlLCBTZXAgMjQsIDIwMjQgYXQgMDM6MzY6NDhQTSArMDgwMCwgU2FuZG9yIFl1IHdyb3Rl
Og0KPiA+IEFkZCBiaW5kaW5ncyBmb3IgQ2FkZW5jZSBNSERQODUwMSBEaXNwbGF5UG9ydC9IRE1J
IGJyaWRnZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFNhbmRvciBZdSA8U2FuZG9yLnl1QG54
cC5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5r
b3psb3dza2lAbGluYXJvLm9yZz4NCj4gDQo+IERyb3ANCk9LLCBJIHdpbGwgcmVtb3ZlIGl0IGlu
IHRoZSBuZXh0IHZlcnNpb24uDQoNCj4gDQo+ID4gLS0tDQo+ID4gdjE2LT52MTc6DQo+ID4gLSBB
ZGQgbGFuZS1tYXBwaW5nIHByb3BlcnR5DQo+IA0KPiBUaGF0J3MgYSBzaWduaWZpY2FudCBjaGFu
Z2UuDQpPSy4NCg0KPiANCj4gPg0KPiA+IHY5LT52MTY6DQo+ID4gICpObyBjaGFuZ2UNCj4gPg0K
PiA+IC4uLi9kaXNwbGF5L2JyaWRnZS9jZG5zLG1oZHA4NTAxLnlhbWwgICAgICAgICB8IDEwOQ0K
PiArKysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEwOSBpbnNlcnRpb25z
KCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9jZG5zLG1oZHA4NTAxLnlhbWwNCj4gPg0KPiA+IGRp
ZmYgLS1naXQNCj4gPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L2JyaWRnZS9jZG5zLG1oZHA4NTAxLnlhbWwNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9jZG5zLG1oZHA4NTAxLnlhbWwNCj4gPiBuZXcgZmls
ZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwMDAuLjNmNzlmMzI4Yzc0MjUNCj4g
PiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvYnJpZGdlL2NkbnMsbWhkcDg1MDEueQ0KPiA+ICsrKyBhbWwNCj4gDQo+ID4g
QEAgLTAsMCArMSwxMDkgQEANCj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0y
LjAgT1IgQlNELTItQ2xhdXNlKSAlWUFNTCAxLjINCj4gPiArLS0tDQo+ID4gKyRpZDoNCj4gPiAr
aHR0cHM6Ly9ldXIwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHAl
M0ElMkYlMkZkZXZpDQo+ID4NCj4gK2NldHJlZS5vcmclMkZzY2hlbWFzJTJGZGlzcGxheSUyRmJy
aWRnZSUyRmNkbnMlMkNtaGRwODUwMS55YW1sJTINCj4gMyZkYXQNCj4gPg0KPiArYT0wNSU3QzAy
JTdDU2FuZG9yLnl1JTQwbnhwLmNvbSU3QzQwYTZiZDRmZjFjZDRkOTM0ZGEwMDhkY2RjNzINCj4g
OWZkMCU3Qw0KPiA+DQo+ICs2ODZlYTFkM2JjMmI0YzZmYTkyY2Q5OWM1YzMwMTYzNSU3QzAlN0Mw
JTdDNjM4NjI3NjMyMDc5OTg2NjANCj4gOCU3Q1Vua25vDQo+ID4NCj4gK3duJTdDVFdGcGJHWnNi
M2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoDQo+IGFX
d2kNCj4gPg0KPiArTENKWFZDSTZNbjAlM0QlN0MwJTdDJTdDJTdDJnNkYXRhPVV3JTJGUVEwUWcz
Nlk4UTZ3RlBDN1pnDQo+IEx6TEh2T2o4R2pIMQ0KPiA+ICtrOE1jZ2NqcnFJJTNEJnJlc2VydmVk
PTANCj4gPiArJHNjaGVtYToNCj4gPiAraHR0cHM6Ly9ldXIwMS5zYWZlbGlua3MucHJvdGVjdGlv
bi5vdXRsb29rLmNvbS8/dXJsPWh0dHAlM0ElMkYlMkZkZXZpDQo+ID4NCj4gK2NldHJlZS5vcmcl
MkZtZXRhLXNjaGVtYXMlMkZjb3JlLnlhbWwlMjMmZGF0YT0wNSU3QzAyJTdDU2FuZG9yLnkNCj4g
dSU0MG4NCj4gPg0KPiAreHAuY29tJTdDNDBhNmJkNGZmMWNkNGQ5MzRkYTAwOGRjZGM3MjlmZDAl
N0M2ODZlYTFkM2JjMmI0YzZmYTkyDQo+IGNkOTljNQ0KPiA+DQo+ICtjMzAxNjM1JTdDMCU3QzAl
N0M2Mzg2Mjc2MzIwODAwMzExMjQlN0NVbmtub3duJTdDVFdGcGJHWnMNCj4gYjNkOGV5SldJam9p
DQo+ID4NCj4gK01DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENK
WFZDSTZNbjAlM0QlN0MwJQ0KPiA3QyU3QyUNCj4gPg0KPiArN0Mmc2RhdGE9SUc5RW0zQVdPd3ps
cFIxV2swVnclMkZGMTYxWWNPeHVNSGJBNFklMkZ6ZnRnWUElM0QNCj4gJnJlc2VydmVkPQ0KPiA+
ICswDQo+ID4gKw0KPiA+ICt0aXRsZTogQ2FkZW5jZSBNSERQODUwMSBEUC9IRE1JIGJyaWRnZQ0K
PiA+ICsNCj4gPiArbWFpbnRhaW5lcnM6DQo+ID4gKyAgLSBTYW5kb3IgWXUgPFNhbmRvci55dUBu
eHAuY29tPg0KPiA+ICsNCj4gPiArZGVzY3JpcHRpb246DQo+ID4gKyAgQ2FkZW5jZSBNSERQODUw
MSBEaXNwbGF5UG9ydC9IRE1JIGludGVyZmFjZS4NCj4gPiArDQo+ID4gK3Byb3BlcnRpZXM6DQo+
ID4gKyAgY29tcGF0aWJsZToNCj4gPiArICAgIGVudW06DQo+ID4gKyAgICAgIC0gZnNsLGlteDht
cS1taGRwODUwMQ0KPiA+ICsNCj4gPiArICByZWc6DQo+ID4gKyAgICBtYXhJdGVtczogMQ0KPiA+
ICsNCj4gPiArICBjbG9ja3M6DQo+ID4gKyAgICBtYXhJdGVtczogMQ0KPiA+ICsgICAgZGVzY3Jp
cHRpb246IE1IRFA4NTAxIERQL0hETUkgQVBCIGNsb2NrLg0KPiA+ICsNCj4gPiArICBwaHlzOg0K
PiA+ICsgICAgbWF4SXRlbXM6IDENCj4gPiArICAgIGRlc2NyaXB0aW9uOg0KPiA+ICsgICAgICBw
aGFuZGxlIHRvIHRoZSBEUC9IRE1JIFBIWQ0KPiA+ICsNCj4gPiArICBpbnRlcnJ1cHRzOg0KPiA+
ICsgICAgaXRlbXM6DQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IEhvdHBsdWcgY2FibGUgcGx1
Z2luLg0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBIb3RwbHVnIGNhYmxlIHBsdWdvdXQuDQo+
ID4gKw0KPiA+ICsgIGludGVycnVwdC1uYW1lczoNCj4gPiArICAgIGl0ZW1zOg0KPiA+ICsgICAg
ICAtIGNvbnN0OiBwbHVnX2luDQo+ID4gKyAgICAgIC0gY29uc3Q6IHBsdWdfb3V0DQo+ID4gKw0K
PiA+ICsgIGxhbmUtbWFwcGluZzoNCj4gPiArICAgIGRlc2NyaXB0aW9uOiBsYW5lIG1hcHBpbmcg
Zm9yIEhETUkgb3IgRGlzcGxheVBvcnQgaW50ZXJmYWNlLg0KPiANCj4gV2hlcmUgaXMgdGhlIGRl
ZmluaXRpb24gb2YgdGhpcyBwcm9wZXJ0eT8gSSBkbyBub3Qgc2VlIGFueSAkcmVmIGhlcmUsIHNv
IGRpZCB5b3UNCj4gYWRkIGl0IHRvIGR0c2NoZW1hPw0KDQpNeSBhcG9sb2dpZXMsIHRoZSAkcmVm
IGlzIG1pc3NpbmcsIHdpbGwgYWRkIGl0IGluIHRoZSBuZXh0IHZlcnNpb24uLg0KDQpCLlINClNh
bmRvcg0KDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KDQo=
