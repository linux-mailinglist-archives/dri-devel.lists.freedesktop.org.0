Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B85ACCF4D8
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 11:14:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57EFD10E1C2;
	Fri, 19 Dec 2025 10:14:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="gFxLJIIC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010005.outbound.protection.outlook.com [52.101.228.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17C5210E1C2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 10:13:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UzQ91vFTsglSwvDa4ycoHKOOo7tEV1GxsPcl3YU7/Nvmwi3RCmN4sAOcbW4Tg/bPftaoCZAk3m76o5dNCQE9kvEEGM9tF4wMBAE06CdiGIVAKIqszjjq9D8tGfkzIJSEOFeitkLOIXQQApE5gm34pelQ4R4eqkMSC+Njbf7Z4HRpZ+c9IgrK/5jHWfO75GOoEUH2AyDphOnLquZ6t9S5L1NGAAnET9V4G6mAcZya2zzFp4P4e39iIZGvk+dBz78ULQfRXbcbDvJlCZO5U+sGl3LNWVcFdgGJzWLiht7xwr4BuDAi7cYJ6h8Tw8FXMy6ao8f5mBvexXwP1Ir7cxfVow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VH3nkZGcQMZK9dnZ8x2zWRylnysgep6OoNa2h3+oIfI=;
 b=ZuzE4VmfS2crcO4buq51HGbDmx2rUl7NaCjIvdSkG38l9tdrEkoEi1niCveCkIRL/ghc9EHkVQISpvril2glbD+7nYlDjo0dDzGpVwmXsMXtBa6Faa2L+Lw9oSP3AuMPOfy9DmGuN//+HB5eIJRDo4Rx+g0a4T8NSs54apYb/efyfxYcSVw8A6vtTFtbqL1n3gxaluQuNqf009+zHz0M0nYANfYL147mGfvLXYqf4VqxV/uHczi/HwSW2UJvrh4HGILAQbhR3jR/WF1nnF6sUV4xEJK7YiMuenXI5Lt7jE/7GBur8rOjgn6rdy5gU3ei3+6bpllRLlTFcPjS1H448g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VH3nkZGcQMZK9dnZ8x2zWRylnysgep6OoNa2h3+oIfI=;
 b=gFxLJIICh3jBzUOz6BTTVOTGw3SDhLw7EBSkFWp5PWGVKgFOV+DnhXfLfuJpLj/T7VzAB1fDlVG6uyNagR/bP42liiCni+CtzT5eMs3+gN7yvgYNjVQ6x7VgaxSSaYZOCIQOUxfW97lzk9zDhrbLkXkJYwAmcL9UP7FWdrDs6Go=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB15169.jpnprd01.prod.outlook.com (2603:1096:405:228::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Fri, 19 Dec
 2025 10:13:54 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 10:13:45 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: =?utf-8?B?QWRyacOhbiBMYXJ1bWJl?= <adrian.larumbe@collabora.com>
CC: biju.das.au <biju.das.au@gmail.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Rob Herring <robh@kernel.org>, Steven Price
 <steven.price@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Geert Uytterhoeven
 <geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH] drm/panfrost: Add GPU_PM_RT support for RZ/G3E SoC
Thread-Topic: [PATCH] drm/panfrost: Add GPU_PM_RT support for RZ/G3E SoC
Thread-Index: AQHcZFOA+GIugFCTB06Le7W8wzatY7Uo0NWQgAADboCAAAEqYA==
Date: Fri, 19 Dec 2025 10:13:45 +0000
Message-ID: <TY3PR01MB1134676D5905B0AC0127955DC86A9A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251203125104.67596-1-biju.das.jz@bp.renesas.com>
 <TYCPR01MB11332FE6BEA86E8FBBD4707DC86A9A@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <zdeak3e65wt2jw7n6rcskyeokmyt7cxhsrvwaeqodp2yjxw7kg@vbqza5hpnrym>
In-Reply-To: <zdeak3e65wt2jw7n6rcskyeokmyt7cxhsrvwaeqodp2yjxw7kg@vbqza5hpnrym>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB15169:EE_
x-ms-office365-filtering-correlation-id: d7e062cc-25f0-455e-92ee-08de3ee74b4a
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?OXBPcTc5Y01HZjd0RnQ2MWtEeXdpMXMrWW1PclBWNldRc0tGRXFTM1JMNmlY?=
 =?utf-8?B?UllvRGM5YTNjaHZwZHYyMHlkWW1RcVhSMHpvTk5WYnM0SkxTdjUxMGRHSTgw?=
 =?utf-8?B?bjZVZktmSWhSajR6QS90S0N5cG00UkpuQ1VOeXd6eVc4R1RhdE5Vc09FUlpT?=
 =?utf-8?B?T041VlBudVZ1Wlo0TFY5U2pGYXJUYVZLOG9wemo5Nys5RjNrMmNjbEh0cFJu?=
 =?utf-8?B?SWpXb1dabmpHTjVVdzcrUWlWdEg0UUtsK3BGOXdCTmpBUnZXWmNENmZRaGp3?=
 =?utf-8?B?VkRWQ21uUEhRd1d6REdKS1gwTGRCdEpiMDNUQWprdXNJV2xGUFZFSDE0VG5i?=
 =?utf-8?B?MkdlemJZQTh0b2NjeUlHSUZGQjlLbWpIRkxhR2VxRWQ2dVhBbkpObUVVaXJy?=
 =?utf-8?B?d0xSYmgwM0xCOW9LVTI1RTBLV1AxWFFiN0ZMbVpDM2tGWFBKeUM1blRtd2NP?=
 =?utf-8?B?c0NCemZ0d1NGb3FaeTVXM0VvM2xoeGhWcnFMKzF5UmhKN0YrRktZR0xZaSsy?=
 =?utf-8?B?VExOZER3YnV2VHhkNmNxR0hleWw3cWdPUFlNWHFHZzh6SmJyd0NDN2sreUlu?=
 =?utf-8?B?UlBIK0JPRWpkWHJxOC9VZ0JveW5jWmQrT25hbXZYQXpoQUxLMHFOUlc4b2w5?=
 =?utf-8?B?SXJDSFltc0NRNllNbU9pK1d0NnhWNEd5cDJDanQwWjl4YjV2SEE4WkRBWE5r?=
 =?utf-8?B?dzB2Y1JHU3hwczdMTkEvOVU4TGFQcnp4cDVLbHBIYzlrOVZyNHhsTkhDT0Ns?=
 =?utf-8?B?aTd0bFp3Y1ZNR2NkUC9rNXV3WXhEdXM0V09lWXZESHowR2MvbTFlQzM4REpq?=
 =?utf-8?B?cWlIbEh0WmtlbHJvZndPRHNRSEU2cXd0dEREcSs5YVFJY1FBM1dPeGdSL1VU?=
 =?utf-8?B?aUhmaHNoQ012Vi9jdmNDY2g1VzNJQkJZWjlYbU5Ud2YvTVFUV3RZWTFlRzNH?=
 =?utf-8?B?OWVUZVJVVWMwbVVqZThscm9DeCtsSldSNGFXbWxFM3gwV0tPdC91RVNjTUE1?=
 =?utf-8?B?cmo2ZHE2T3JzbXNXRWE4UFU5N0FVLzZVeVI5cG82TkpxZ2dIaHRCOFRzQ0FZ?=
 =?utf-8?B?cjdzS2tUNFlyb09rSnozN1JkenNsazVqZXp6ZTZjZG8yalZXS1VLRXV6Q3py?=
 =?utf-8?B?eXpSdlB5bmpHRTVmaURIdS8xbjVYajNjbDBNRTcyOVZxY21SbVBhcWk1bmRX?=
 =?utf-8?B?bDJhN2pwdDlHUWVtUTJKOTBPWUY5Kzl2OG9EZ1I5UW9kMVA1MG5PMURaUUN0?=
 =?utf-8?B?MmtucjVlVjlSWkxSVWxUTitzTDNuTUpwbmo1dVJxdTUvS1dZamgxZmxJeUxE?=
 =?utf-8?B?YzVmT3Y0cmJSNzFPSm4vVTMwbXBQeFNIeHZJc0dUMTdGQ1Bzazg0eGx2dGsz?=
 =?utf-8?B?VW5JL1Z0ZUxlMkp5VUVMbGdsb2dkK3V0dFJDTFNMNFdzd2t5OWJHR0hFU0xR?=
 =?utf-8?B?cTViZnpNRVpyWG1XeVoyWWVYQ0ZSMWtLL3ZSSStjb3BPZDBSSDdpcmZqVFR6?=
 =?utf-8?B?bmlHd1c5T25Kd2I4RnkvMFdFSXdSUDZ1VWZST3VzZmJJMjFLcHRhM01jaDhR?=
 =?utf-8?B?WkZIU21acFRGRW1tdW5rS1FBTEF1bkxSbWVHMWkxTVJWWksyN1pTTTdpSlZm?=
 =?utf-8?B?c21XdEdyOW5KdUlzRzI2WnFKNVp4UW1sdXIrOXYrSjU1WCtMc0k1VHl5TjRT?=
 =?utf-8?B?TG9TTmx0SnpWUHJyYWF6N3N5UzRMMUIvWmhxUCtNSVNPcTYxN25sSHpySUhz?=
 =?utf-8?B?RjlFbSswWVVDWjdJV05BWmRJMkdmMDBWaVQrS1ZaalBLZkRKQm9oRVF6bkpS?=
 =?utf-8?B?SzV0T3VSZHhpRk9Ua0xhRzIxblR5UnVJOE55VXp5ckRXc3Iva2N6TXUrNUdU?=
 =?utf-8?B?Y3BLWEk2WXYwZldsUUYwYlZhTVpWMi84MG9wNy9URE1FM1dCL09PV2FhYXBp?=
 =?utf-8?B?akVuUFAxN0tkSUtEMFlvT1FFV2p1MlNMTDcyYlBWd0FtR1VjUnp3OFVya1ZY?=
 =?utf-8?B?NlhFMkErV1UxcVdTRHdwUVJuQ0RQSm5nQzVIZ0pieFZRNnZtR3VELzQxWHZn?=
 =?utf-8?Q?9OSNx0?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QW9aaEo0L1VXRU1INmFpQ1RHZHBHT1BYTWJrRElOWlVvQ2tRKzJEU3BMdFVO?=
 =?utf-8?B?djgxN2RJTUhqcllPd2FDZWZGSW1vOHJXcnpyZXRiQ2Z1RjJnZ283cXVNb3Ax?=
 =?utf-8?B?dGtuU3l0QXpjcGhIQlRVbHNhdTBSVGdqeEpDRWFRME85LzNOWUQrd01JaW1P?=
 =?utf-8?B?aUkySnpJN0RHRFRBZkMzZnpFckJqYmsvMWVHOHdrcUJJWEg4bFRmUmpYY1V0?=
 =?utf-8?B?T3A5MS9jcDJoc0YzRklTblplK2dVS3JEVWtJQVMyN1I5OUtIL3BnNGZzZVdB?=
 =?utf-8?B?ZDFKNm94MnFUNzV3QXV4Z29oeDRkcWFUNHhlS1R4alFTanFLckR6d05VUjYz?=
 =?utf-8?B?RDYwSVlZdnVEUE1vUmlFMnZxa0xuT0ZzYmJMZHh1dEZDQWUyUDdEMUpOanU0?=
 =?utf-8?B?Q0dBRzZDWFlKQytuNGJNU2lVOGJDTVhuTmRmbXk5eWNROGpCS3pGaDlVTWV3?=
 =?utf-8?B?WURtbGJQTUp6Snc1dUVqMXFTSFF2bzJpZXZ6ZWxyNGYyQnZkZ2ZFVGwzY3h5?=
 =?utf-8?B?d0xmTXlwTUJkY0NuV3p4SysxRnpHeUJIYnVzdFluVWo1L3Ntbk1xTng1UGJ6?=
 =?utf-8?B?RHVQSTFHanJYT1oyYTIzbXloamxqeEI5cDgxOEY2alBMaTJNREVreGZ2Q0dt?=
 =?utf-8?B?WmZYUmFMV2FFUDMrYmcrV09xckNyc3NKQytjRGc1V0pueXhYSG9pallwTDk3?=
 =?utf-8?B?WWFkM2laYjJyMnNQWHZVdzgxcDIycmdxc1BBL2w5V2pXcjhuUVJqRHo0dFc5?=
 =?utf-8?B?L1RocDdaR0pxT3lNMFYyMUNYWVNuZk1iOXRvaURaUVV5ak1nZ0xGUHdNVkZl?=
 =?utf-8?B?VEV5Y0xaYTRwemZXY0paQ2RLTlNZdU9MRXhpRTkrWDZwc0czZ3RJeTFKeTkw?=
 =?utf-8?B?aGxOUzRHWTBqNnNTZXY0QmVHK0VhT3AvZ3g5VmxwYm8ybmYyaHN5SlZlN2FP?=
 =?utf-8?B?a1UrbDB4TzFpcDJEU1RnclJHWEJRQXh1Mmd2M2tjeDF6S0d1NzE0UU8yQVNQ?=
 =?utf-8?B?bUxyRjNtK1h1Ny9YWXl4cnN4TzNVM29mWWJPRk5RcGFTMSt2aFZub1dndWVo?=
 =?utf-8?B?YTdlamlEdWZKMWk2WldmV3dpelowNXJKSE9mRHJ3MHE0YTgzd1V6YU9lZFov?=
 =?utf-8?B?eFY5NWQ2K0N3a2MrMFBnWnZQeFAwVGNKYjcyOXlUaGtVWnluVzhVbmJROFNI?=
 =?utf-8?B?L1gyeExDMFlxMzNrL1lBcFN4cUQ0SEl5QkwyeE9laHJXNmVjQ3V6SW9uSlk4?=
 =?utf-8?B?QXpyaVUveno4QlpqUnhiRkJNUjFIVGJZTG12YUlxTnd1OHdQWUZ1citZR1E2?=
 =?utf-8?B?aWJVUTZiVHRZRkhYcTVFdmZuenQvMnRDUTMwRnFvUEhTbWdoaHJNRW8vV001?=
 =?utf-8?B?bXZBUmNoMWk3UGxkTEhoMUJsZEp0SHE2TFRlL2ZxanJXZUhtTmE4M0kxUlFO?=
 =?utf-8?B?Y3oxLzUzZnpvS0d1RmdZTXVPV0RhQnNJMkN3bmFZRnRlMEgrQlhyczhBZ1J3?=
 =?utf-8?B?SzNTWExUeE43Q0V6elJvOVprbDVWeERCNlJDL05FcmREUlhYRWhwVmE0WHQy?=
 =?utf-8?B?NU1vd2g4UWJoSER6VlhCT2pSMVpodUZsbHVYQm1NYXdLbUZ5SVFsK3ltVHVM?=
 =?utf-8?B?eFV2WU83ZWNSTW8xZ2hCVS9UQjRyU3lReVJtTnlIdm84V1M0VHcrb0xBdm1u?=
 =?utf-8?B?azJDZnFnMFQ0aEZ3QXE3ZSs0bTZwdWJHTXA1bU9POXRuSFVWOFR6UmpyRFRz?=
 =?utf-8?B?L016NGRQcHFRQ3h1VVluL3k1b21YdndlbUFPQ0hkMVNSNWJMTWFhKzVYYzl6?=
 =?utf-8?B?Zm9LUHk3S2QweHJNVmlGNHZMQ2xYd3hKUGN3eEVLOTRuc1B2aHYweVpSLy80?=
 =?utf-8?B?VloxOGdnbEUrTjBYMzhjcDM1bytDU3pIVk1jNituZ0JlWjdKMjZYV2ZkU0Fr?=
 =?utf-8?B?dVpjUmplN3BCc1p3ZmNQRDdQMDZxV1p4RzNrejN2RjlMWnZwbm96RXBKMUM2?=
 =?utf-8?B?aks4NVdJbWROaWtzbG1nZWRkaitjakQ2NGdqUjE0SlZ4SzB4RGJwZXQ5bVpl?=
 =?utf-8?B?L3JpZ1J6K1Frd1VQNHhXZ0JkKzBlOExocm01MzBoajU4aFNwSDRyRC8yTGV5?=
 =?utf-8?B?YjN4Yjl5TXIvdUszRGI4UjEvbFA0THllMXQ1K280RnZNM01XbWhpOWxpQmdW?=
 =?utf-8?B?Nmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7e062cc-25f0-455e-92ee-08de3ee74b4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2025 10:13:45.4206 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gq0jbBDIj+NygO1L+tLhOLIkUvgS8dIe3J+F/QmkCXXm2SzZYjDpMC9C5uY0USHMMWuU79PtQBuik6FEgOkQOsmupciCkRiLn2hbR3g29WA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15169
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

SGkgQWRyacOhbiBMYXJ1bWJlLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZy
b206IEFkcmnDoW4gTGFydW1iZSA8YWRyaWFuLmxhcnVtYmVAY29sbGFib3JhLmNvbT4NCj4gU2Vu
dDogMTkgRGVjZW1iZXIgMjAyNSAxMDowMg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0vcGFu
ZnJvc3Q6IEFkZCBHUFVfUE1fUlQgc3VwcG9ydCBmb3IgUlovRzNFIFNvQw0KPiANCj4gSGkgQmlq
dSwNCj4gDQo+IEknbGwgYmUgbWVyZ2luZyB5b3VyIHBhdGNoLiBJdCdsbCBiZSBteSBmaXJzdCB0
aW1lIGFzIGEgUGFuZnJvc3QgbWFpbnRhaW5lciwgc28gYmVhciBtZSB3aXRoIG1lIHdoaWxlDQo+
IEkgYmVjb21lIGZhbWlsaWFyIHdpdGggdGhlIHByb2Nlc3MuDQoNCk9LLiBUaGFua3MuDQoNCkZZ
SSwgSSBqdXN0IHVzZSB0aGUgYmVsb3cgNCBjb21tYW5kcyBiYXNlZCBvbiB0aGUgZG9jdW1lbnRh
dGlvbiB0byBtZXJnZSBhIHBhdGNoIGFmdGVyIHRoZSBpbml0aWFsIGRpbSBzZXR1cC4NCg0KPT4g
Li9tYWludGFpbmVyLXRvb2xzL2RpbSB1cGRhdGUtYnJhbmNoZXMNCj0+IC4vbWFpbnRhaW5lci10
b29scy9kaW0gY2hlY2tvdXQgZHJtLW1pc2MtbmV4dA0KPT4gY3VybCB4eHggfCAuL21haW50YWlu
ZXItdG9vbHMvZGltIGFwcGx5LWJyYW5jaCBkcm0tbWlzYy1uZXh0DQo9PiAuL21haW50YWluZXIt
dG9vbHMvZGltIHB1c2gtYnJhbmNoIGRybS1taXNjLW5leHQNCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+
IA0KPiBLaW5kIFJlZ2FyZHMsDQo+IEFkcmlhbg0KPiANCj4gT24gMTkuMTIuMjAyNSAwOTo0OSwg
QmlqdSBEYXMgd3JvdGU6DQo+ID4gSGkgQWxsLA0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogQmlqdSA8YmlqdS5kYXMuYXVAZ21haWwuY29tPg0KPiA+
ID4gU2VudDogMDMgRGVjZW1iZXIgMjAyNSAxMjo1MQ0KPiA+ID4gU3ViamVjdDogW1BBVENIXSBk
cm0vcGFuZnJvc3Q6IEFkZCBHUFVfUE1fUlQgc3VwcG9ydCBmb3IgUlovRzNFIFNvQw0KPiA+ID4N
Cj4gPiA+IEZyb206IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiA+
DQo+ID4gPiBSWi9HM0UgU29DIGlzIGVtYmVkZGVkIHdpdGggTWFsaS1HNTIgR1BVIHN5c3RlbS4g
VGhlIHN5c3RlbSBoYW5ncw0KPiA+ID4gYWZ0ZXIgU1RSIGluIHRoZSBmb2xsb3dpbmcNCj4gPiA+
IGNvbmRpdGlvbjoNCj4gPiA+DQo+ID4gPiBTVFIgLT4gV2FrZXVwIGZyb20gU1RSIC0+IFVubG9h
ZCBwYW5mcm9zdCB1c2luZyAnbW9kcHJvYmUgLXIgcGFuZnJvc3QnLg0KPiA+ID4NCj4gPiA+IEZp
eCB0aGlzIGlzc3VlIGJ5IGFzc2VydGluZy9kZWFzc2VydGluZyB0aGUgcmVzZXQgZHVyaW5nIHN1
c3BlbmQvcmVzdW1lLg0KPiA+ID4gUmVuYW1lIHRoZSB2YXJpYWJsZSBhbGx3aW5uZXJfaDYxNl9k
YXRhLT5kZWZhdWx0X3BtX3J0X2RhdGEgZm9yIGRhdGENCj4gPiA+IHJldXNlIGFuZCBtYWtlIGl0
IGFzIGdlbmVyaWMgR1BVIFBNIHJ1bnRpbWUgZGF0YS4NCj4gPiA+DQo+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiAtLS0NCj4g
PiA+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMgfCA1ICsrKy0tDQo+
ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4g
PiA+DQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0
X2Rydi5jDQo+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYw0K
PiA+ID4gaW5kZXggN2Q4YzdjMzM3NjA2Li5lNTUzZjE4M2M3ODAgMTAwNjQ0DQo+ID4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMNCj4gPiA+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYw0KPiA+ID4gQEAgLTk3Niw3ICs5
NzYsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmZyb3N0X2NvbXBhdGlibGUgZGVmYXVsdF9k
YXRhID0gew0KPiA+ID4gIAkucG1fZG9tYWluX25hbWVzID0gTlVMTCwNCj4gPiA+ICB9Ow0KPiA+
ID4NCj4gPiA+IC1zdGF0aWMgY29uc3Qgc3RydWN0IHBhbmZyb3N0X2NvbXBhdGlibGUgYWxsd2lu
bmVyX2g2MTZfZGF0YSA9IHsNCj4gPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmZyb3N0X2Nv
bXBhdGlibGUgZGVmYXVsdF9wbV9ydF9kYXRhID0gew0KPiA+ID4gIAkubnVtX3N1cHBsaWVzID0g
QVJSQVlfU0laRShkZWZhdWx0X3N1cHBsaWVzKSAtIDEsDQo+ID4gPiAgCS5zdXBwbHlfbmFtZXMg
PSBkZWZhdWx0X3N1cHBsaWVzLA0KPiA+ID4gIAkubnVtX3BtX2RvbWFpbnMgPSAxLA0KPiA+ID4g
QEAgLTEwNTYsNiArMTA1Niw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGR0
X21hdGNoW10gPSB7DQo+ID4gPiAgCSAgLmRhdGEgPSAmYW1sb2dpY19kYXRhLCB9LA0KPiA+ID4g
IAl7IC5jb21wYXRpYmxlID0gImFtbG9naWMsbWVzb24tZzEyYS1tYWxpIiwNCj4gPiA+ICAJICAu
ZGF0YSA9ICZhbWxvZ2ljX2RhdGEsIH0sDQo+ID4gPiArCXsgLmNvbXBhdGlibGUgPSAicmVuZXNh
cyxyOWEwOWcwNDctbWFsaSIsIC5kYXRhID0NCj4gPiA+ICsmZGVmYXVsdF9wbV9ydF9kYXRhIH0s
DQo+ID4gPiAgCXsgLmNvbXBhdGlibGUgPSAiYXJtLG1hbGktdDYwNCIsIC5kYXRhID0gJmRlZmF1
bHRfZGF0YSwgfSwNCj4gPiA+ICAJeyAuY29tcGF0aWJsZSA9ICJhcm0sbWFsaS10NjI0IiwgLmRh
dGEgPSAmZGVmYXVsdF9kYXRhLCB9LA0KPiA+ID4gIAl7IC5jb21wYXRpYmxlID0gImFybSxtYWxp
LXQ2MjgiLCAuZGF0YSA9ICZkZWZhdWx0X2RhdGEsIH0sIEBADQo+ID4gPiAtMTA3Myw3ICsxMDc0
LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgZHRfbWF0Y2hbXSA9IHsNCj4g
PiA+ICAJeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxODgtbWFsaSIsIC5kYXRhID0gJm1l
ZGlhdGVrX210ODE4OF9kYXRhIH0sDQo+ID4gPiAgCXsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWss
bXQ4MTkyLW1hbGkiLCAuZGF0YSA9ICZtZWRpYXRla19tdDgxOTJfZGF0YSB9LA0KPiA+ID4gIAl7
IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODM3MC1tYWxpIiwgLmRhdGEgPSAmbWVkaWF0ZWtf
bXQ4MzcwX2RhdGEgfSwNCj4gPiA+IC0JeyAuY29tcGF0aWJsZSA9ICJhbGx3aW5uZXIsc3VuNTBp
LWg2MTYtbWFsaSIsIC5kYXRhID0gJmFsbHdpbm5lcl9oNjE2X2RhdGEgfSwNCj4gPiA+ICsJeyAu
Y29tcGF0aWJsZSA9ICJhbGx3aW5uZXIsc3VuNTBpLWg2MTYtbWFsaSIsIC5kYXRhID0NCj4gPiA+
ICsmZGVmYXVsdF9wbV9ydF9kYXRhIH0sDQo+ID4gPiAgCXt9DQo+ID4gPiAgfTsNCj4gPiA+ICBN
T0RVTEVfREVWSUNFX1RBQkxFKG9mLCBkdF9tYXRjaCk7DQo+ID4gPiAtLQ0KPiA+ID4gMi40My4w
DQo+ID4NCj4gPiBHZW50bGUgcGluZy4NCj4gPg0KPiA+IENoZWVycywNCj4gPiBCaWp1DQo=
