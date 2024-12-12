Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D5B9EE520
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 12:34:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31F4510E2F4;
	Thu, 12 Dec 2024 11:34:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="MsA9y0jh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011000.outbound.protection.outlook.com [40.107.74.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D59310E2F4
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 11:34:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vTncrvebUDsYfw60IGzWuH8Q0Hk59Vj/B1Fkt1jmYuXZuICx+amL5G3+gnSO1PHZCmATwYzONdAML9aLe2tu4SduEqbZ9NoXLg0jKxGApwjDsIQzmEi6JSwaIGVa2nxbpMgABbq1c7e8QzKiCusZ6W8Vili+0gdhgX5HSjb2FbHr3Cvi1rBt6hyM5LPun3HdAO1NKbPpLh7uCxWxq0eiUnhugyyFNSDbI7xNn+okUytJNM54OZnOiD2n1FKrEpveIpnPE4rsd5uozGjAjaVHNp6DuUucv2VK/tTYIrtSpcwOWrznOvuTkjecF02wQfrQqSMlbTrGT1dO8TMqCkMiIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AetssQPjUvFDEKnbERS+Zu0twJJAQBMcE0FCHg+mOL0=;
 b=AZs1d8bxsqfBetX8NP7tOR7p/cgU6dlgdpojWBLcdWThR7ewv7jDIbMYQ/1FMKsp2UnpMEKgtH4TepipE79X5jI9YqW1txJYaoZtRIaM98wGLPyjxZk4l3V2mqaSh60V3pb+eerow1kWPw/fXFkuWlVp/hv/hO/hXKxOVZEYqcnyqQe5xSKH5707EA5Gs7cPRaps/gxvdIyQgX1ET1ryB8Nkv7qga7eNHiEuo2p3bsfKwiwPCzmd1qTH1XbSFbMAWNElMj/ZGhiO3hFzp8rWdc4l16bPDp90E6WrCrZ7NX0n+wnKh2fiACgQ86Oj69TpGja7eNMonscq+FzyE8/9fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AetssQPjUvFDEKnbERS+Zu0twJJAQBMcE0FCHg+mOL0=;
 b=MsA9y0jhuaOupbcyUypziX3+gkjGmdiGe/knuFDO5GzSRX6cnUpabDZ61+vIXADhH9gzLhdw0SfWgX0u2Ut4FOEJSODrAlATi1Da8ZL6N053YZAea0SMuInQ6LvAxq8P65HwuZ+jm8v7ruF7SapL3D9lLG3zo2uIHcFAs09PMVU=
Received: from TYWPR01MB11343.jpnprd01.prod.outlook.com
 (2603:1096:400:3f5::13) by OS0PR01MB5330.jpnprd01.prod.outlook.com
 (2603:1096:604:a1::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Thu, 12 Dec
 2024 11:34:36 +0000
Received: from TYWPR01MB11343.jpnprd01.prod.outlook.com
 ([fe80::f54f:8da2:5ffb:1391]) by TYWPR01MB11343.jpnprd01.prod.outlook.com
 ([fe80::f54f:8da2:5ffb:1391%6]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 11:34:33 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: laurent.pinchart <laurent.pinchart@ideasonboard.com>
CC: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
 <biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v6 0/3] drm: adv7511: ADV7535 fixes
Thread-Topic: [PATCH v6 0/3] drm: adv7511: ADV7535 fixes
Thread-Index: AQHbOrMYVkaJgo344UuWkeUl3s1BnLLds1nwgAA+foCABKtPsA==
Date: Thu, 12 Dec 2024 11:34:33 +0000
Message-ID: <TYWPR01MB113431BCC310190CB264C72BD863F2@TYWPR01MB11343.jpnprd01.prod.outlook.com>
References: <20241119184420.138785-1-biju.das.jz@bp.renesas.com>
 <TY3PR01MB11346BF6C74FF1E5014F1E9DF863C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20241209121231.GH11343@pendragon.ideasonboard.com>
In-Reply-To: <20241209121231.GH11343@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB11343:EE_|OS0PR01MB5330:EE_
x-ms-office365-filtering-correlation-id: 4842bc72-c12e-4132-4056-08dd1aa0f37e
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?UEQrdjgxZ3Fkb2lCc2dpN0JYL2FaV0N2aTBrY3RNemtZa05BS1lESCtHUjRH?=
 =?utf-8?B?WmRHVXptc011ODRUQVFkd3RkUmc1a1FGdGcrKzVKcFRianJneU54S1NWeHNs?=
 =?utf-8?B?L25mMmltN2ZMTC84a2UzN3NRV1NmVVo2K1JLVVhmSkV3WjRTRE5KUGg3encx?=
 =?utf-8?B?Yk5QM3pyMDlSR3BuTUZoVDE5RDFVOXFpU2ZoWmdpK2pYNWlYb0hZeHJGTTA0?=
 =?utf-8?B?TkVQRnB5TDYyR0Fxa0hVam0xcjF5a1NIYndVbXl4RkZpclVzeEc1eU9YNEE3?=
 =?utf-8?B?ZEYyaGVvdnEzc2ZtV2lXTzZ3U2Ira1ZkVWJ1cFQzOFRQNFRUbkRxNkUwVEdG?=
 =?utf-8?B?eFE2NDREc096UzFySXdRci9pcURuVUlKR1lvS1J2RHd1MkFFTUhDMS9MdEth?=
 =?utf-8?B?d0ZVNERSdWZ3bENtMVB3SUlmS01rcjNHWW1NN05UWFlQMW0yTExTdzlsQnQ3?=
 =?utf-8?B?aWNodVZSNXBKY251NkU1Q3pOQnh3YStLbVFkYXBuc0t6VzUwdVNnNGZCMXJU?=
 =?utf-8?B?YTZwNjV3SEVZUWk0ZkRTN0FJMGxTOWwxcnlQYWZwOE1xQ0E4RnNGWm44cmgy?=
 =?utf-8?B?MlkzRkNVVDVhb2dWT2wzSmtGRDFIVE1TaHluT2ZVR3dWMFpCU01rVmtqUDZY?=
 =?utf-8?B?NXNPZVRsNWlHOEU1WEhSQmlVbG5BOVJoQ0ttdFpjaWoyZy94VC9seWR4czdw?=
 =?utf-8?B?S0czVkduWFNjRGJRTG9lVHhVZkVPSnNBUEwxNmxtTnZranVWZnNreE1vQXhV?=
 =?utf-8?B?d0Rsa1p1Z0NTSHBsL2ZkWTZORFppMUVCMVJpV1cySG16NXFpbVByN1dwMDR4?=
 =?utf-8?B?emNKeVJHa2ZNNjRFZnZ5Y2xtaVhJdzN3LzdKbGVQNjlSZjJxQ3pwcFlxUVBH?=
 =?utf-8?B?WEE2emdaYUVodG1UZzdaZ2hYQVZHb1NQZm4yUnA2NzVtOGlQNE0yL1FHSEFh?=
 =?utf-8?B?V2lTUlZTQm1zRW1ncHBYbm5yaUU5K2c1dG01Z2E2NDBMOHZUNDdmbVJRc0xD?=
 =?utf-8?B?dE5LUmZnaW5TdDZQNEVHT1ZOamUvNGllS1hOUVh1c29nQUxGd0RNb3c4Mk9P?=
 =?utf-8?B?U0Nsc0c4dmlpS2QwUjRVczVROUlxUTZYbTRyeGJpWE90S1ZpQUY5eUFZK2Fh?=
 =?utf-8?B?N0YrdktjWlVoSDlheFdFUURSSVQyYnNGTW1pSzVoSWp6TkhmS0htMHEyTVVL?=
 =?utf-8?B?aU8zSG4wWjRiOUI0RGVIZWxOOXlvd0UyYlJlRUtSd0FDSnZTVUlLanMrUTZY?=
 =?utf-8?B?T25Xd01TWXNRS1o5NWM2SnVnRG9qTFpiYTMwazhPZTBxbzhHRzk4SVBpRWtm?=
 =?utf-8?B?UkprQVNNRzBIUHpmOEJPSENtMkxnQWdjMndHV2pyQVZhUlV3cUhYbUIzTm9r?=
 =?utf-8?B?UzIxSHg5NUgwWFd6RE1IOXRua2ZpT3EwUVlWWm5TWTdYOTFQcXVvZ1VSRGpG?=
 =?utf-8?B?UXZ5QzhMSnlvTUc1QzkzVHE5TXdxbEEvWUlHVDZ3VjNtYXRrNlc5eG9sRmd2?=
 =?utf-8?B?OUgyYnNkM3FTQm5CZmZWMU5QV29vV1ZFckVpZlNGSkNTeE1kM2RzQ0RsZ2xl?=
 =?utf-8?B?VUJMb2FzTS9lYmNrSVR6YVBOVkZBQVFrNGYzZGlRby9PSVRFQWl4Yy82Nmtj?=
 =?utf-8?B?RDdHaDNCM0JuVEhaMk1aeS81aHMwYWRYWi95RHliTjF3WUZMSmdObldjZlNs?=
 =?utf-8?B?K1ZKQWF5QnhvNDNzaGxZZnhhZk94Sk9OV0lwcW1EQXZ1RmFUbXZnMzU5VDZi?=
 =?utf-8?B?MXFLSEVFdENLdHd0eU5SOTFiTnhTRzFaekFPODRGVVcxcWh3RkhpUHN4SUFk?=
 =?utf-8?B?cEtjM1pyL0tSVTV1M1BVdEFwNnZxWk5BK0xJVmVWNmZBbUk1TDg3c0pKOWtE?=
 =?utf-8?B?M2VqMzlBajR6RUhub2RPb2MycDNwTGVCbXRHRzhVeVVVdnc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYWPR01MB11343.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UXJTU1cwVllUTTZXTlJuZnYwdEhuVElDVEcvNkQ5djNXbzdGaGRNRmRoZE8x?=
 =?utf-8?B?UHdPa05yRDZWMWtlaWJqaDVQQmZjVDZGU1FSTWg5OVhZUkwxbHM0M1JJVmMy?=
 =?utf-8?B?TFZWRlp5N0wyTDZVeWxLNHdTbkJSVXUzQlVFL29KRlk4ZU1FNlh2a1BEM3d5?=
 =?utf-8?B?YURlWnQyOFFRWi9IZElMa3g4cURkdzFJMlpSUmIxaUVRT0JMKzl2MzBRWjV3?=
 =?utf-8?B?K2J0Qk9hYmlRNmdrbjA2MzdVRWJTSXRobFJSZE5tZW0vMjV1SklqMXhvaDRE?=
 =?utf-8?B?Q0tqMENyVHdNdnJsbGpKVDJ4WE9BOHI3NG1hVnFmZ242SFh4UDhEM2lpMDR6?=
 =?utf-8?B?VzJYUXBSUzhYZyt0eC81UWU1SjBWWkU0RHFpWlhWTmcxenhveHl0em43eE4v?=
 =?utf-8?B?RXp4UzVGcjNwYVI3Rm9BTmUvZXczalo5UkFSbWlKbzkxVmE4Q1g2cHBQdnhV?=
 =?utf-8?B?eEV2ckhoNnk1V3JqN3J5MVVieDZzVno4cGkrQWhWLzJrOVF0SnRkcTE4SzJO?=
 =?utf-8?B?UmNOVlp6RXg2SkxQVjliaGl3SVpFQnJZbnRMY28zbkt3MVYyMlc2c3JaNVdj?=
 =?utf-8?B?TmRGOGozUDA3ZHlnNlVtNU1qK2x1NDBUeWdEWG42aUgwdTVoQUlCcjI4Y0c4?=
 =?utf-8?B?SkVCRHl6Y28wcTd1aldYOVRnRm5WeDJYa3hCSkh3TmhycW9ocVg4UjMxRnh4?=
 =?utf-8?B?ZXo1L0M2UDBTaU9LcFdtaHloS3Z1Ti9pUHM4V2VvTHd1Rm9GY3J5N2xoNmFu?=
 =?utf-8?B?dTdwa3JnVkVVaElwRDZUVzBreG1CK0ttN2pwYVA5SDJ0SEErZUdUMCs4Qmwv?=
 =?utf-8?B?bGtrZ21uNExhSEFZQU02R0V1MVVvRnlaRm16Qm1rcDRmOGs3L0ZiZlE0MnAy?=
 =?utf-8?B?c1NlaE5VTFpCcldWQXowallPcjlCd05qc3pZaWZNcm5SMXdZdDhpc2NpMTND?=
 =?utf-8?B?cVVjZS90eXpPdTFPNkRIcUZKVFB4c042WnVvQVU3NkRvRDY3NkV3QTJiTFZo?=
 =?utf-8?B?d1JKbzJKQ0ZwUW5OeDRSUDRCaE9yaWdmK1ROck1WQ0pITTRaZlBSdmw0a3JS?=
 =?utf-8?B?VmlnSUlYNFdMMXIvMzB1MVpQTzFOSUY2UFpsa2lyK29Qd3ZKY1I1azJCNlA1?=
 =?utf-8?B?YnVWK1phQzNRRWU1S0d2akFjN2pscVNXOWF4bWR6WGVxalRoYlduRGZCdDZs?=
 =?utf-8?B?ckRRdVMrOGlOTTNoUmZWdFFDeHBvS1I2NEtGK2VrR1lKVllFTVVUd0t3YWdK?=
 =?utf-8?B?U3JWQjMwU1RGRWtaVTRiZC93WittdythNTF0dEF2TjdlWGIzUWovK3JjZ0Mz?=
 =?utf-8?B?OUgvQzl6M3pqTm5sU2JhckhjSS81TENwUWxDZkloOUpvditCNVVDSUxlRk1O?=
 =?utf-8?B?dFM5K2Y1ZlNzVEtORzBITHRCWVA4VjEzVjlaVDV2Skd3Z1BKMXgzbzI4Qms2?=
 =?utf-8?B?cEJKWDRHMkFxY0RPYVE1ekhpZWxqOFlUUCtYQThwK0dpRkhNU3l6dnFCOFB0?=
 =?utf-8?B?K2xuaDVCbGpsSW41d0xBTXo5K0JFL2Q4a1Q3bzE4ejNSbG1pSk5sT3VwYy85?=
 =?utf-8?B?dkUrdnluZ0NYZUJqL09BTEd1VUpybUVNdngxZGgyVWUwSit2S2VVbnV6OU1E?=
 =?utf-8?B?TXBkaWhmb3hwZ3p2cFRpakh3OTMwNFRrVTF4WCt2ZkFxYmRJTU5leWdhSUx0?=
 =?utf-8?B?Ri9LQXpEMlV5WEQ1N3hTeWJmK1NFZllIdHdkMmFOSjI2ZmxRVmFkd0R3YWF4?=
 =?utf-8?B?MXR1NEYzQVZKTkFvdWlSMENkZjhXZEwzUUdzWDZqOFRFMVNJWjZHNEtqNkxN?=
 =?utf-8?B?MmU5RkF1YXVEeEErUFAxTENYemNYMFVUbkI3WFhPOTVXRUFTbExXNzZOWVhF?=
 =?utf-8?B?c0Q4QmFZbGpsQnYzK2d6bUtDaFplNjJyN2NBdnhrVDJVR0pheTcwTUxxOURy?=
 =?utf-8?B?UXl0alJES3NBSzlvbUx5MWpZZHIzOWl2VC9FZURRTWJzczFtRUFBc0RzSFM5?=
 =?utf-8?B?b2RGRmd6cVJPc3JGTXFMZ1FKOUEwQ3NiL2U2OFh2WExmdDZDRDdSdis2UG9l?=
 =?utf-8?B?QjJlTjJBblVBKzgwUG1vNkJ3cGpqK0dqNDM1OTgwOWZRT1V4ejRjOTE2VXJR?=
 =?utf-8?B?YTBFZjRicDB3OE9GZzdTc2Y4MDlRRUxMd0xkTGFpaE1YeU0wZUJ4cHAwZitZ?=
 =?utf-8?B?aXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11343.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4842bc72-c12e-4132-4056-08dd1aa0f37e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2024 11:34:33.8255 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PbIiL555chglfp/XVeYIPKbLdxg3l82tfZ/HddlCRyYLQRbKjx8bK4ice5LIaNfjrL5qjAJyEbH4qs5DyOlTZ8TyERRyGEbgAk2HS/1urXg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5330
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

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFy
dEBpZGVhc29uYm9hcmQuY29tPg0KPiBTZW50OiAwOSBEZWNlbWJlciAyMDI0IDEyOjEzDQo+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggdjYgMC8zXSBkcm06IGFkdjc1MTE6IEFEVjc1MzUgZml4ZXMNCj4g
DQo+IEhpIEJpanUsDQo+IA0KPiBPbiBNb24sIERlYyAwOSwgMjAyNCBhdCAwODoyOTo0MEFNICsw
MDAwLCBCaWp1IERhcyB3cm90ZToNCj4gPiBIaSBBbGwsDQo+ID4NCj4gPiBHZW50bGUgcGluZyB0
byBhcHBseSB0aGUgc2VyaWVzLCBpZiB5b3UgYXJlIGhhcHB5Lg0KPiANCj4gdjcgc2VlbXMgdG8g
aGF2ZSBhbGwgdGhlIG5lY2Vzc2FyeSBSYiwgYW5kIEkgYmVsaWV2ZSB5b3Ugbm93IGhhdmUgZHJt
LW1pc2MgY29tbWl0IGFjY2Vzcy4gQW5kcnplaiwNCj4gTmVpbCwgUm9iLCBjYW4gQmlqdSBwdXNo
IERSTSBicmlkZ2UgcGF0Y2hlcyB0byBkcm0tbWlzYyBvbmNlIHRoZXkgaGF2ZSBiZWVuIHJldmll
d2VkLCBldmVuIGlmIG5vbmUgb2YNCj4geW91IGhhdmUgcHJvdmlkZWQgUmIgdGFncywgb3IgZG8g
eW91IHdhbnQgdG8gaGFuZGxlIHRoaXMgeW91cnNlbHZlcyA/DQoNClllcywgeW91IGFyZSBjb3Jy
ZWN0LiBpdCBpcyB2NyBbMV0uDQoNClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1y
ZW5lc2FzLXNvYy8yMDI0MTExOTE5MjA0MC4xNTI2NTctMS1iaWp1LmRhcy5qekBicC5yZW5lc2Fz
LmNvbS8NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo=
