Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7A79BF008
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 15:24:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B8710E2DF;
	Wed,  6 Nov 2024 14:24:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="vj7XR2gg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011014.outbound.protection.outlook.com [52.101.125.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC6B10E2DF
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 14:24:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y/Wj7n9WYkiDfDwaEBwqcB+vWP5aJvsWOEXwu/JDNLYSpXZ3TXwPr7Tt74dGhhutAZ5WTbsjIKfUVpZtWmQNB7Vv4ezqCM9H1d26MuXP907s6gWhYye88M7z7yagDAlCYv9cd94ld1c1eJlS68BqGHH52VAKfNDRs9f+B0d2TXO0NY7cfH/eH001dwAvbQSQdYq7q4NzFoXoTl+xS7DSkD+puTa5J+3/xF0UA5GvqlHZE0r6eVx4Ov+Q3K5bo/st+zTCG+yNrDDlhT5qja4sDpudq8WI+0yfUOHnvOgJtTRqRTYphPijKL3pRqzAYJllcg1BWTkF4en38v4aFH0/qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eShAyBmtLpvXpR4Cbnj9s1L5ONzkUy7WqwfSqtPJM08=;
 b=THk0VRH+IjEdcvL1LdkdcvwfV7Wz+D6UaYxhJa2TYCdICvvJKu454uwyJFiEjzQKyBjvRNpLvn9oYXtUUPOuseVEcurBIYSddHSgdEnYGz+GToHtI+W+Tz47vgB3UPclVCTTGahJmahshDu8efvA1wD37UehfdtI2LCJKG0ZsRs2YqLMJ4NOKnruDOW1Gjqh0x1xZgCzsWIBRn7RjfQYGVqtIkAiY4R/L8Li/e3Qc/qNdaqT36np1pnZndv7kYIkn3566bURY3Vus/H9+R2s69x0PVUhlleg9Sq3f2OCzxdckbBqxg82AjPZ5Ivv3bGrMd2YCEMlVv2gdBNXHfu6xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eShAyBmtLpvXpR4Cbnj9s1L5ONzkUy7WqwfSqtPJM08=;
 b=vj7XR2gg2iAstJUxkEQU5rrApBPZOtzsGFI6PZR9qzcoC0Yhv0pKQfrfFA+vbTQ1ETfG3Km2VfP21+quEdX9vq2Q6v8BreW+wydazq0BOBd/jAVtd4J/hM5bXKa4b0DQuJoKDeiD/F8Bn7g21bYbAET1o+DKvO9BNsXDM+dHLWQ=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TYYPR01MB12530.jpnprd01.prod.outlook.com (2603:1096:405:194::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Wed, 6 Nov
 2024 14:24:27 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%4]) with mapi id 15.20.8137.018; Wed, 6 Nov 2024
 14:24:23 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: laurent.pinchart <laurent.pinchart@ideasonboard.com>
CC: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Archit Taneja
 <architt@codeaurora.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
 <biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, Hien Huynh <hien.huynh.px@renesas.com>
Subject: RE: [PATCH v2 2/2] drm: adv7511: Fix out-of-bounds array in
 clock_div_by_lanes
Thread-Topic: [PATCH v2 2/2] drm: adv7511: Fix out-of-bounds array in
 clock_div_by_lanes
Thread-Index: AQHbL3OqGwvURGtuf0yMs4E9+5ouCbKo2l0AgAEqGLCAADkbgIAACW6w
Date: Wed, 6 Nov 2024 14:24:23 +0000
Message-ID: <TYCPR01MB11332F189FC53347F1ABC611C86532@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20241105111228.112813-1-biju.das.jz@bp.renesas.com>
 <20241105111228.112813-3-biju.das.jz@bp.renesas.com>
 <20241105160612.GC6317@pendragon.ideasonboard.com>
 <TY3PR01MB1134619B30EB1894710AB669D86532@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20241106131731.GG9369@pendragon.ideasonboard.com>
In-Reply-To: <20241106131731.GG9369@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TYYPR01MB12530:EE_
x-ms-office365-filtering-correlation-id: 18442d66-e2e9-411f-51ea-08dcfe6eb609
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?OXI5NmsrK3YvcnhBeEVFV1VNZkhnMWRva3VPYmxpZ0hPQVVCa0FCWnZmWG1S?=
 =?utf-8?B?Z2Y1RUtad2U4cjkvcnRNenYvV1V5SlI3WTRqZkZBTEJEeWV4TmRCeW5aZkZh?=
 =?utf-8?B?TFhreXpKa3RVZ3UvQUN5WkdrS0ZoRENwSzk0THFRT1J2THZPaGxRc1FMa1Fv?=
 =?utf-8?B?UGRCQjF4d1B2YkJ1aWxWYUJnRHBaRUhpWTZyWEt0TkE1enZad01VbHNuc0lL?=
 =?utf-8?B?eXRWSDhibGNnSXI2UWUwckhSbnA4Y2xOcXZ2S3hZWlI5M3ZHRXAxemRUR0dp?=
 =?utf-8?B?Sm5LNHE4TkhPYnpxQzBsd1djd3NuU09Eb013cW53QW84cEptS0hUS2RvMDlS?=
 =?utf-8?B?UjJDaHZZc1I4aTRIVDFCWk5VU2FiTHV1bXFGdkxNd1BXcWxqYXArcGNwN000?=
 =?utf-8?B?bmlzYlBSanBTN0xTL2NFSlVUaDl0MTM3Qm5hSFlZb2JNM0Fnb21MQy95UDhW?=
 =?utf-8?B?eVl5NDhycTJrM3JablkrK284OTVJTDdvOHYzNm5nVDFEa2M0RW1GVUZJaGc1?=
 =?utf-8?B?VmN3U1Qyd3MzUm9NT3ZJakNDTE5Vd3ZWb2hwOSt5VVJqTU9MelpnWmMxZHpL?=
 =?utf-8?B?WisyNlE1Y0xqQ3RhaGRnUGNKY0xhTG1ldjZVVDN3SzU3aEMyU0VqR1NhUTRH?=
 =?utf-8?B?VElaK2JYc0F4NFcxZFNzekZGSEY5TS84ZVdTS2ovYkFmLzBzb3c0VzF2SHA4?=
 =?utf-8?B?RjRtZE5OQkJXMytCS0dtdzlxMW9CU2FTREpmeDlNUnpVZDJNV254NkZJbWRj?=
 =?utf-8?B?aGlJZzZLQWYvYnpnM1VXVkFyNVp0c1hxQTZNV1JMYjErNFB0QStHb1VFQUty?=
 =?utf-8?B?eWFWbWsxRjB5Y3dPamExWkZJVjBoUHlwL2lKOFdGZDFqbyt1WEhRd25LNWhP?=
 =?utf-8?B?UitTODlXRWppRWhpcUhvZkRPTlQwRWNmUTkxQS9vYkszb3g5MW1HL2VsMlU5?=
 =?utf-8?B?Z0Y2VWNKWk5OdWJ2eTRRZ0ZKZ1Ruc1Z6M3dGMFQwczJCcEFINHNqZnJIYVZy?=
 =?utf-8?B?N0IzWFlpNFNtR1NsN2VjRHVLeDUydjNQdm9qdlJYZjFSVkZEamMvT3J4cHBB?=
 =?utf-8?B?RC85d2hOL3UyYUJRWjlyVGIycTFBSFJRaGhWVVJGMXZ2QlhteUQ1NzhnaWRl?=
 =?utf-8?B?VmNDMnE3UXpPbHVySVp1a1NxdGphVTRKcmNSWklvR0o2Ym0wYmtvVkMvTjhu?=
 =?utf-8?B?MEw0dDhDTFlhN0dzMngvUUFTZjNuRXZmZWM0T1p1VmpuUkpVd1lBNWl3L0Fo?=
 =?utf-8?B?aU5BY3I4UUhDWHg5TlZ4MHA0UUNJV0Y5cXdieEplUlRjcWpkc3d0WVFYYk5u?=
 =?utf-8?B?ZVdtbytkUmVkYkJPSXhLb25WaG5ETmR1MDRRd09jdDdJRk5QRzV2TGVBM2l3?=
 =?utf-8?B?Uk03bHZ0RWQxMFY2dEZjNmFrUE1xdEkyNEhtaTd1c0dpaldlaWtvcy9idlRK?=
 =?utf-8?B?VVQ5V3dBZVF4Uk1Sa2M2eEY0UG1xNTBHZnNZNDRBZVhyelJPa2FLUzdLVDB0?=
 =?utf-8?B?Z0x2bHZSV0FtZWVwUHhqazV4V0QwZTdQRjRkTDVWVjIvSEd6Kzdja2Q1c2dH?=
 =?utf-8?B?dnYwMFNvSllBaWtHNWoxb09RMll5YzlFLy9VSlFicFNoWVpNZGNsNlpsUVZp?=
 =?utf-8?B?eDc3eXdNNVh6Q2h3RzA1K2xQYXBSWU5KdDIrSldVYUUxbXgwQWIvMGlhVHlK?=
 =?utf-8?B?K1BtbnA3RnBmK2thaE5FNTlKSVZyb2ZTMFpScFFrdGJabHdJUncxSDhjL1k4?=
 =?utf-8?B?QnpqZVNKNy84RG1Wc2k5aEdaZkNYNFQ3eW9VTndxZzBYYUhjRjJIcXVwVXdl?=
 =?utf-8?Q?SsAQaPCu0nBHZ1tuFSCYCysCV9XvAA56U+RW0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11332.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cnZjZzJvaHlrMmszSnVOVVF2K0VEdU9Rbkg3eXJWemEreTlaUkdrc3FRMzhX?=
 =?utf-8?B?MklmRWlNdGhrM2dvQWxkb2dXMUtLOHRtZ2NxUk1tMDQ0T2NkRDRzYTNCTjM2?=
 =?utf-8?B?elRKYlU4eTFFaEkzK243S0t3TytmVWxRRUQ5ZCtyVXBzWkZOdXVES2lxYy8w?=
 =?utf-8?B?MW9uNTlza0UrWmhuZVZ3R0dDVC9wQUdHOUZzdDlXS0xabVUvZzVhQVcyUDhh?=
 =?utf-8?B?VHBadjVTb1BabFFyV1lCZFJTaVRXSHRPdCtYb3pNRkVKWDI1d2RCN1dnN2Zv?=
 =?utf-8?B?TGNxTnh5a2FjNFNkYmYvT2xNUDhsTzl0SUFBS1ExSlA2cEFLZDJqNGp6SGtM?=
 =?utf-8?B?VVlxU1dsOFg3amp2UW5kQ1l4aHJ4WTlmMjc2QmhYdDEvN1ozTi9XM2s0Z20w?=
 =?utf-8?B?ajltWGFPbjVYSzhlc3h3YXdIOGtHOTQ5UG0vU3Zzd0JtWjZrMFhBUzE4eFlj?=
 =?utf-8?B?YXZsRFNuZ3lRMXNWTFpETi9nbzVSUk9WTXh0amxDa1RvN3NMMWlySkhqcjk0?=
 =?utf-8?B?WkFOZ1pJSkdzQzJvMEkrMVJwRlFQNkNtUVhrdzRqWUsxTXZENk5RVVUwdTNp?=
 =?utf-8?B?UytlMlg0WlJKN2ZnU0Z0NTFIOFVwc2dxTlJtaGFNME9RaGxlakNNVTJkVUN2?=
 =?utf-8?B?YlA5eUk5alRFZVJTTkJnekNNUExvUlhvV25yNFdWWElPYmVPMVpWai9rVGg5?=
 =?utf-8?B?bGZMb3ZycW1PWWNFeW9RUithbEpDYUlvaUFJazJmU3c0bmg3Nkt3Zjg1SkdY?=
 =?utf-8?B?bW1BdDhLQXpvNHlrZDJoWTZZYVk1d1dQUUlrUkdMWitDdmlIUkxqZzhQQnJq?=
 =?utf-8?B?R3VER1hGc3YwUThwS1BZd2lBM04vcG1jcFU0RlhNc3I3ZTVxYno5MFBFejQw?=
 =?utf-8?B?Z244RXdkQTBhMFIxNlYreWFlb2YzdmsxcDFteFoxdHBPUVdxeWo3eUFEczln?=
 =?utf-8?B?Ulp0OTZSTzJzM3IwaVJZZEJWK2ZOYkY1L1dqb0xkazR1VEtIeG8wS1ZiS1lR?=
 =?utf-8?B?SXFJb3cvcDR4ZTlYSzdFL1NzUkdkVWhuYlJVNXl0SkljeGJSNXNxRERONFRL?=
 =?utf-8?B?QTNlcnJyM0wrLytnemlyaGt0djE5bFh4b0N1VHB2NmQ5TlpCVitQRmk4YVJv?=
 =?utf-8?B?SFZHZHBZT2FiUDhyUWlITnMvMW9sVmZkM3RWTlkyRzZkMXFnQ0RYMDVSK2Uv?=
 =?utf-8?B?VHlOb2lkSlh6SnhRMzFBRW1RNUFSZmQ4YlhrdUZyTCtvL2NYd2RTRjllQUNq?=
 =?utf-8?B?eHBHaHhZK3A3NWZIUmxhTmZ6OVZoK05YSi9lQlNub0I1VktnWktJd1ZHMmtu?=
 =?utf-8?B?Y2d2a3ZFY2VSWGRZcFcvc1dsb0RraDZJTFdhTFp6SXN2RjFtdE5jTEdiejFG?=
 =?utf-8?B?b04zK2FEd2FLUWZHZHNDRWVuc0JMYXA3SXRUTURMdDN2KzcvdXBJTTZ5MVJR?=
 =?utf-8?B?ZHA1TFY3WTNrS0RwRDRNaURiUHZpeGVJOTltTXNndjFUKzgxdGQ0TFdTT1J3?=
 =?utf-8?B?OE9WVitGaDcwS2hPUUR4U0NOa3BZaEFRcG0vV0ZXaC92Wld1R1NGUWVqNkdE?=
 =?utf-8?B?bExKOE1BR3RteXE0SEQvSlBjWU5FRVZPc0ljamt5SDFtWFQ3Zm10ZlMralJO?=
 =?utf-8?B?RnZRQzgybVFOMEV1LzkwcGtKaXpnNHV5bFNCU3dRL1M1MzRsU0tiazBVVTlh?=
 =?utf-8?B?NlhwL25BYVFvbkVnUEZPbXYxWHFvNWpjSzR4dGRiTEk4Q0JMWW1FTTQ2L3ho?=
 =?utf-8?B?RzRkNkFManNITGhHZ0xMZC8xZUNuN1ZYaXNhK0drc3F5clJqeWs1dm5wNVE5?=
 =?utf-8?B?WTh5ekJRa1NRZTRXSExPY2hEcEJBR3BaSlBsQmJyeEZYQngrcDFwdjM5ZnNz?=
 =?utf-8?B?THp4eDQ2OVZhd1NZd3Z1YXRDUWFvSGhhRCtSSURlc0hDSVljVTB1d3VzazBP?=
 =?utf-8?B?VGhaR1pFcUFRYnlzdUt5bkJ1MDQ4U2plOVJFc21wU0ZQK09paXd5NStwWlFX?=
 =?utf-8?B?dDhvd0xiai93N3pDWmpOSTVERDdLME93aFZSMnpva1F1RmlqbEMwU3RRak02?=
 =?utf-8?B?Q1RTUmZ1WXhOVlJOcHFPM1NSWS84SmVoWXNSaTMybEs0b1AvcXMxK2NacTZU?=
 =?utf-8?B?OSthOXVzTkl2cWdMT0F5bDYrQkpxU05JS3FIOTRsVFpobjVPUmk0YVFsSkZz?=
 =?utf-8?B?RlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18442d66-e2e9-411f-51ea-08dcfe6eb609
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2024 14:24:23.3525 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i1vFeZgfdpngLWXJJTIYdwh7jiYJMBoUU3Zriez7ENT4yeiW5vM+JbjUW2UpBEbe++9W9CQfRAsl9hxTBcM7DCLPvVeM5btqbLiom9g3THw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12530
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

SGkgTGF1cmVudCBQaW5jaGFydCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBG
cm9tOiBkcmktZGV2ZWwgPGRyaS1kZXZlbC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4g
T24gQmVoYWxmIE9mIExhdXJlbnQgUGluY2hhcnQNCj4gU2VudDogMDYgTm92ZW1iZXIgMjAyNCAx
MzoxOA0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDIvMl0gZHJtOiBhZHY3NTExOiBGaXggb3V0
LW9mLWJvdW5kcyBhcnJheSBpbiBjbG9ja19kaXZfYnlfbGFuZXMNCj4gDQo+IE9uIFdlZCwgTm92
IDA2LCAyMDI0IGF0IDEwOjIwOjQzQU0gKzAwMDAsIEJpanUgRGFzIHdyb3RlOg0KPiA+IEhpIExh
dXJlbnQgUGluY2hhcnQsDQo+ID4NCj4gPiBUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCj4gPg0K
PiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IExhdXJlbnQgUGlu
Y2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gPiA+IFNlbnQ6IDA1
IE5vdmVtYmVyIDIwMjQgMTY6MDYNCj4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMi8yXSBk
cm06IGFkdjc1MTE6IEZpeCBvdXQtb2YtYm91bmRzIGFycmF5IGluDQo+ID4gPiBjbG9ja19kaXZf
YnlfbGFuZXMNCj4gPiA+DQo+ID4gPiBIaSBCaWp1LA0KPiA+ID4NCj4gPiA+IFRoYW5rIHlvdSBm
b3IgdGhlIHBhdGNoLg0KPiA+ID4NCj4gPiA+IE9uIFR1ZSwgTm92IDA1LCAyMDI0IGF0IDExOjEy
OjE5QU0gKzAwMDAsIEJpanUgRGFzIHdyb3RlOg0KPiA+ID4gPiBGaXggb3V0LW9mLWJvdW5kcyBh
cnJheSBpbiBhZHY3NTExX2RzaV9jb25maWdfdGltaW5nX2dlbigpLCB3aGVuDQo+ID4gPiA+IGRz
aSBsYW5lcyA9IDEuDQo+ID4gPg0KPiA+ID4gRG9lcyB0aGUgaGFyZHdhcmUgc3VwcG9ydCB1c2lu
ZyB0aGUgaW50ZXJuYWwgdGltaW5nIGdlbmVyYXRvciB3aXRoIGENCj4gPiA+IHNpbmdsZSBsYW5l
ID8gSWYgc28NCj4gPg0KPiA+IEFzIHBlciB0aGUgYmluZGluZyBkb2N1bWVudGF0aW9uIFsxXSwg
QURWNzUzNSBzdXBwb3J0cyBzaW5nbGUgbGFuZS4NCj4gPiBodHRwczovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9uZXh0L2xpbnV4LW5leHQuZ2l0L3RyDQo+ID4gZWUv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2FkaSxhZHY3
NTMzLnlhbWw/aA0KPiA+ID1uZXh0LTIwMjQxMTA2DQo+ID4NCj4gPiA+IGFkdjc1MTFfZHNpX2Nv
bmZpZ190aW1pbmdfZ2VuKCkgc2hvdWxkIGJlIGZpeGVkLCBvdGhlcndpc2UgdGhhdA0KPiA+ID4g
c2hvdWxkIGJlIGV4cGxhaW5lZCBpbiB0aGUgY29tbWl0DQo+ID4NCj4gPiBPbiBSWi9HMkwgU01B
UkMgRVZLIHBsYXRmb3JtLCBsYW5lcz0yLDMsNCB3b3JrcyBvaywgQnV0IHdpdGggc2V0dGluZw0K
PiA+IGxhbmVzPTEsIHZpZGVvIGlzIHVuc3RhYmxlIGJ5IHRyeWluZyB3aXRoIGNsb2NrX2Rpdmlk
ZXIgYXMgNiw3IGFuZCA4IGJ5IHVwZGF0aW5nIHRoZSBhcnJheSBhbmQgYWxzbw0KPiBkaXNhYmxp
bmcgaW50ZXJuYWwgdGltaW5nIGdlbmVyYXRvci4NCj4gDQo+IElzIHRoYXQgYW4gaXNzdWUgc3Bl
Y2lmaWMgdG8gdGhhdCBib2FyZCwgb3IgdG8gdGhlIGNoaXAgaW4gZ2VuZXJhbCA/IElmIGl0J3Mg
c3BlY2lmaWMgdG8gdGhlIGJvYXJkLA0KPiBkaXNhYmxpbmcgMSBsYW5lIHVzYWdlIGZvciBldmVy
eWJvZHkgaW4gdGhlIGRyaXZlciBpc24ndCB0aGUgcmlnaHQgb3B0aW9uLg0KDQpBdCB0aGlzIG1v
bWVudCwgSSBkbyBub3Qga25vdyBpdCBpcyBzcGVjaWZpYyB0byBib2FyZCBhcyB3aXRoIHRoZSBj
dXJyZW50IGNvZGUNCndpdGggbGFuZT0xICBhbmQgaW50ZXJuYWwgdGltaW5nIGdlbmVyYXRvciwg
aXQgd2lsbCBsZWFkIHRvIGtlcm5lbCBjcmFzaC4NClNvIGxvb2tzIGxpa2Ugbm8gb25lIHRlc3Rl
ZCBsYW5lPTEgd2l0aCBpbnRlcm5hbCB0aW1pbmcgZ2VuZXJhdG9yLg0KVGhlbiB0aGUgcXVlc3Rp
b24gaXMgYW55IHVzZXIgaGFzIHRlc3RlZCBsYW5lcz0xIGJ5IGRpc2FibGluZyBpbnRlcm5hbCBn
ZW5lcmF0b3I/Pw0KDQpMYW5lPTEgY29ycmVzcG9uZHMgdG8gcmVzb2x1dGlvbiA4MDB4NjAwQDYw
IGFuZCBiZWxvdy4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo=
