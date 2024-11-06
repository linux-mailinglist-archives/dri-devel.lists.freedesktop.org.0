Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE9B9BF450
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 18:32:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B6FC10E2F9;
	Wed,  6 Nov 2024 17:32:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="EtfIRESE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011060.outbound.protection.outlook.com [52.101.125.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6FBE10E2F9
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 17:32:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z8kcGmK6txpBLRs3brrTcg8/29wts9zIuv7tb0rF6lYsKP/i++qBVwr54fIALxckmYZ6JnXD9qfJKXc1LYj/hi8PTwRu2apH5ORQ2nrrdy7viu4aLaIWiHFkw7rMP2vLhaHIGl2iRDl/4c6GTBx/kUL0W7XaZF3W1QU/FFgp3Nr48ZYk7tiaX1a/WerqiK5d4xPZeRD/nDdRoyXjesVv//zOSqcb2u0oPgK0B8WD1CEaS+r3sDi79VaSxrDPXiSN+B0EdY1j5aBD1+zk46bC224KPTCRdu/IdKS+7eeF56fAlKQAa4oHlF9wOBizeRTnQ1K5J56A8L09iOvwA7EhBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8nH+oUh+IKlJluMJMG6rukTnJ5uRp3f/Yh2KwOJXJso=;
 b=GS1inf9I8na/I9TrnXlm2nnNUPeZc6GdVe+8MVsF9DSNltjpLV+o0iQeLv/vw4rCmysW5iVj33juu2dhgUCbhOmvh+ynQYPxb4735ngZ4uTnVx2omLTfZyGkFgf2OjoUPxPFxBbGMgSRVfpSw5Z96yEz11lZL/myNgiLC14gu7JMUnGtg/6iP2K8UYPqa1aqrcR4+dhOqQX3wxVvMJEKCbsxPbqxRajimFqU0jQYFKyHTfQPBp8d4k5vrDEG4pR4Yj2DJzZ7/aSjoOUugSh9FFqEHKMTsTCTrNss17rCWnd+gARNzo25xcpZIMPOqWllxnOHZxA+eGTgTRNtih5BQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8nH+oUh+IKlJluMJMG6rukTnJ5uRp3f/Yh2KwOJXJso=;
 b=EtfIRESE8vz+74+9FWjLnvWDY5GDDNdBZa6Ay18CryRSAqWmIKCS7R4U9+uhzH67wieLjmKJFCzuRXo69UZ5BqpE9Eq4c7+39V+Df6as2I6TsdrtOV76LiF0MQFeqrq4ApeXY5s0FbuedQR1Quh9s5skE5xee8vARhbLab4C10Q=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB11378.jpnprd01.prod.outlook.com (2603:1096:400:3f6::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Wed, 6 Nov
 2024 17:32:04 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8137.018; Wed, 6 Nov 2024
 17:32:03 +0000
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
Thread-Index: AQHbL3OqGwvURGtuf0yMs4E9+5ouCbKo2l0AgAGpbTA=
Date: Wed, 6 Nov 2024 17:32:03 +0000
Message-ID: <TY3PR01MB113466AB53869B3D19421793186532@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241105111228.112813-1-biju.das.jz@bp.renesas.com>
 <20241105111228.112813-3-biju.das.jz@bp.renesas.com>
 <20241105160612.GC6317@pendragon.ideasonboard.com>
In-Reply-To: <20241105160612.GC6317@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB11378:EE_
x-ms-office365-filtering-correlation-id: e8356711-fa9a-4727-5e97-08dcfe88ed6e
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?QU5lZHBXZjJHOHo4RW1nQ3EzRWZpTWtZdjNXd01hSzN5OVBYaTZFbW9yOEpp?=
 =?utf-8?B?aTVWT1dvT0NNeHpwd3gyZTAxVWErK2hkak13SEVHVGcyZ1Q1bCtPSjhvWHZN?=
 =?utf-8?B?alorQVB5SFAwRU5ObHYzQ1BxZkV3WVZ5RlIvTGF3aTAwSEMrd080VklxTDU2?=
 =?utf-8?B?NmRCMUtEQlFBUndkTWVQM1l4VkRrbVdmLzlrQXBtMUdONC9yVmlGY1pSVjdU?=
 =?utf-8?B?Z1BUbW9kN3FUa211MXBXenJReUtaZUF4czZ3M2ZMTVE0K0VIa2hoTURPNTY1?=
 =?utf-8?B?VDdIS1NOOUVVeHBuQnRFMDNSaXNNam9VMENvYkdoemFxaTErYTNma2tNK0Uw?=
 =?utf-8?B?UWIrT1kvakIxR2VTQ2tUc2VKM0lwTTZSVnQ2d2dFM3pSMVV4RXVrQXNYVUo3?=
 =?utf-8?B?enFzNFB3Q3pzNWY4eVAzUzZwSkVoMDUvcXpKYXlwektnL053OCtBQ3NaMlNa?=
 =?utf-8?B?RG0relhCRXJjNmtVSXZ2Yk1PSm9kT1FMd3N1L2YwNS9UOWpXMUJEYm9zY3BP?=
 =?utf-8?B?d2pkN2dLcXdtaWZ1WVFUaWVmUDU5VzRGTlZQUFdzT25XUS9BaFQwOXhaczI3?=
 =?utf-8?B?VFVoRlNJaFJoTS84dVVSZ00xUXdGbUUraEdkaEdER1dUb1N5MTgrV3VWd2N5?=
 =?utf-8?B?cVFMYmhFYytUVWkrWC93WDRQZFo2TFpsWm5IMnc0RXduT21BdzM1UUxxTkQv?=
 =?utf-8?B?ZzMzZ25aZXFkSWROeUxsbWYzRGhnUzEzNzFqZUpPQWFKb0ZEYU9qYXF0U25q?=
 =?utf-8?B?SUN2Q3MrL3ZzZFUxQ05TbW5LZnY1YUx6RVNDdDdCdEFwMFI3WFZvakZSU2NL?=
 =?utf-8?B?c0VOcTlaUURrQ2ZibkJVZERYSTZFcTE4N0JUQTlkZmJsOURMWnY2dStibi9Z?=
 =?utf-8?B?VjlNN0ZYZXpiWGdKSE94cFdPREpDSitIdjVpdWVmWEthSUV3S0FyL3hRUmhP?=
 =?utf-8?B?WDQ2cm5jd3Q0cXVjaUZjWlFmRTg0VVJna2IxSDVrOFZ2cHA1dDZUT1psclpy?=
 =?utf-8?B?azlLVnFlSFhsUzV4bXNYcUtoZDQybkxZRWVKM0FpZklPbXRsYWY5Y1EzNEw4?=
 =?utf-8?B?cnhqWmYwY2h3WVBwb013a1NEUDdsY3BjVHBxWnlrdkJnNzg4UnV2Si9uNnlp?=
 =?utf-8?B?NXNBSVk2NW9waE1LamQxQkRidWlUZERic3NrdktvM20zS3JrRHoyT2draUth?=
 =?utf-8?B?QU95cHBxVGh6M3l2NS96NkhzWXBSeFF1NEFCZEtzVjc1aUNSQk1uKzc4VEV2?=
 =?utf-8?B?clZPVG9yY2JCM3ByeTN0YUNOa2JsRzNNYlU0QWJLQVV4dGR1TzR2R09ISEhn?=
 =?utf-8?B?Zmw0eE96QXNmNDd4UDhuc0YzVExTbVlOc2lmV3dFS1JxVllTd3YvOWIrY0JS?=
 =?utf-8?B?TnVta3BqcnAvVitIZWM3Z081Q1VQTmYxc3dWb2psMFNrT0ZHK3RZa3cyNGdo?=
 =?utf-8?B?VEpWdEl6akIvRStuSWtLSzlJK2xpK2NhYjl6WklEQVNqVW5NZElxSDVKQzc5?=
 =?utf-8?B?M2RUR2x0WUJqTTdBMC9SVE1YKzAwMFBBRG01YU8zekRvWWU3L2ZYVFd5NVZi?=
 =?utf-8?B?SlE4Z3pVSUR3MkZHSEoyRmxCZmpGRFFyVm9yOVQybzEvZUYvendEeXFkOUda?=
 =?utf-8?B?Q1FDckJLSmQyL0hhaUtoNzZUMElkKzlxdCtLRk5JNkl6RTBWcUw1R2g3YnVu?=
 =?utf-8?B?WDRPbGdFMk4wK2FqVFJwR2ZRSXlrREs2dXlTSURNTm0rQjNsWWdQVzJ5aGk5?=
 =?utf-8?B?RW1RNTFzVHdJUkJJQTJzVHpseithWFJBU1lKeVFqeTV1OENtcytKUGdzN1pW?=
 =?utf-8?B?OStpU0kvK05WNUxVRUkyeXNXYXZiQ3RMYytwUzFUeXE4MzBVUXpQcEo1eS93?=
 =?utf-8?Q?s1MysOO4pk/nW?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RVExWjhLRndoZjQwNGVwYW1YckNIYzZTWkMrWGVYNjdtSlR0NDVwSUNudlFy?=
 =?utf-8?B?RVN4SWF5cExnOVhENG9mTlNpR0p5M2lkMzR0UzQ5TUo0UnVmeWc3NXZpcHJH?=
 =?utf-8?B?bVc0YnFacEltVWpMZjljN21SY3l1T3dvM014Z1NaQ0hjU1ZkektMajNGQjBQ?=
 =?utf-8?B?M0dERUt3WVQ5K3VNbkRUYUY5WWZELzZDbkpTZTBmVlhQeEJxVnlEdlh5dFpr?=
 =?utf-8?B?VkpnUTBFbENsK05oajhVRC9yaTJJbE5uZytJcTNQUkxoREtkNFEwZjNiL1F1?=
 =?utf-8?B?QVJQMG5ESjV4Tk1EMkttOFZtdGxXWVJJRzdYWkU1WGsxTUZvY1NGL2JZdFJt?=
 =?utf-8?B?eGZma1ZvT0xSb2FqRUtUUElUYjdKSFFGRWNObHdtNVFMSTd4U3pkRDlJS2Rn?=
 =?utf-8?B?ZDRLdTNmUzRkaFdxSElheTl2d1U2SnFuRlVjRzJQc3V5QmowNmFKZWxIa3hD?=
 =?utf-8?B?UlRBMjc1MTB0ejhqTjFhcnJXRTVmcFpNU2JQYkIxRU1xeWpsUHVZZ3pwSnox?=
 =?utf-8?B?R0orVGxrbGZxSlRpNWphNDZqaXVUeVZ3RlNpQmRoRnV3aDZXMTZyd0djdVA0?=
 =?utf-8?B?ZEtMQjlodUNjOVVHeEJUSklheERWNDNCeWo2bXIyV3dxbW50SVRvbml4RGJC?=
 =?utf-8?B?dkt1UXZwcitQRW9na1FpdlRBQ05NQWpVQ0pmYnNkUmFuNk1IK0I5eE9kQ3kw?=
 =?utf-8?B?NlZrOUcvRW1pSEVNREV5UjRsK2FPajVtbnMxOEY4dWQ4WWRBTEplWXpKb1RD?=
 =?utf-8?B?ZGxxdE1DNnNTNnl2eSt4UFVZYk84WWR0Qzd4TlRpblI1VU56NGZKVGNMQ1VD?=
 =?utf-8?B?Znk2aDI1V3R4TXJsOHkwR1NqVndrTGh2Z1lkUkFVOGl5ZEZHVkN2dTA1bllq?=
 =?utf-8?B?WHVpUVpxSDBVSHhGekZmbTI0bEJtRi9EOC9aUVFsWktGemlteG11R0hKQ1NQ?=
 =?utf-8?B?VVIyblEraEtaeCt1TVVDQXByMEdFcjQ2c1FXQWd6akNoNUJiY2hES0FKMWZr?=
 =?utf-8?B?WHhacTFSakp2WCtmbDJROUxtZGtsT1dWdldjQzRnZlBpN2tGVmY2Qy9sSXhZ?=
 =?utf-8?B?RGUvOVJMSUN5OUNvZ2kwdXhiVmw5cWc1dEMxV1JlbHZCVWg4RkZzb3c3UjFw?=
 =?utf-8?B?cXR0MGZTTkFkRWxDek1NSG9UcWpGaU80VVJ1cjhGUU1NOC9OWFJKTjY3Ny80?=
 =?utf-8?B?MWV5ZEkwRUpIbWVtU0V6YThEWkVaeXZ2YmNrYS92SlZIZVZKNElWdGUzOVli?=
 =?utf-8?B?SXVvblRFVkF6Nm1XU0k4YWk0WWdQZGNFaXA2eWIzU3ZzTkVxZGJIMUVpQVJo?=
 =?utf-8?B?dldPSktBV1I5bkt5SU00RzNnWHRPeUk5S2VRdEdhQWZxQ2Yyb0tVTVRZME5K?=
 =?utf-8?B?N080ZS94R3BORlhielVFRHFYc1d4THFxM3hPUXBycGwrcFR1RFRlZU4xUEEz?=
 =?utf-8?B?eEF6ZUFzNk1jdzE3SjduWnNNbHdGVjN0L0JzK3BReWkyOGpwSDI3ZzZVN2Ix?=
 =?utf-8?B?a291dW5qaUQ5R2laRFhVeXBzVGZlY1lFYkJESnZxclVzUjBGaTJOYzAxR1pG?=
 =?utf-8?B?ajdESWZoUmJFb1JvVEYvOFBvZnNCaElydmdJMW8vemR2T1Y5TElJNUtSTUNR?=
 =?utf-8?B?TmxKWkFQaG9RQWtydmVFTHF3ZHhXN0pkN1pxbGE5WXh3TDhlYXJxaHNFcDh6?=
 =?utf-8?B?MEFBVHZ6UXYxSDBxdGNrZWVzRlRpWUcwbUxQQk9ucjUzK2xCRzVHMW03KzdT?=
 =?utf-8?B?OTBoaFp0MmF2Q29uRU8xZE4rdnlVNGxwaDd5SUFaNUJkN0Qvb1dGQkJUSDUv?=
 =?utf-8?B?N2JRTmZsRk1tby9ZeXFsWkZiTEVickVWc0VPbnRoL3VqSHJnem42cDMrd0RO?=
 =?utf-8?B?V3BEMlhyZi9PbWRkWURXTVFRVHJNdnV6N01qSzJmODhqd1Fmb1lDWGJ3S2JH?=
 =?utf-8?B?b1ZrZXowa2RUQTdFeWdoWnR3U05LbzNvVU5tN1lsWFB4ZG9jZjAra25UNURC?=
 =?utf-8?B?QUtYdHIxRmJ1U0o5Ykt1U3kxVy9sWktNNnR0Qk1CZkIvVDdhazZERUVFQi9O?=
 =?utf-8?B?aEhjd3BpcFpnckIvd0ZZVkRTNjE0MjZIa3YvbUdBUHRKUmZISi9UUzhWU1Fu?=
 =?utf-8?B?MlhPTmVjdWVZVERyY1ZuOFBqT0tjbXE0eWNMMTdoaFgzemgrOTZ1OVZUd0dD?=
 =?utf-8?B?YWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8356711-fa9a-4727-5e97-08dcfe88ed6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2024 17:32:03.1935 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Td9zdT35jBoM6nk3sAA4jlJQ4Jzq/F4YUKtctl+hDcgGmZU8QxwJYhgmPOLugdICjeIBApGKiE/21CORRIqLRcPlTUpw7J4lmkmd2/SzdSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11378
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
cm9tOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+
DQo+IFNlbnQ6IDA1IE5vdmVtYmVyIDIwMjQgMTY6MDYNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2
MiAyLzJdIGRybTogYWR2NzUxMTogRml4IG91dC1vZi1ib3VuZHMgYXJyYXkgaW4gY2xvY2tfZGl2
X2J5X2xhbmVzDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2gu
DQo+IA0KPiBPbiBUdWUsIE5vdiAwNSwgMjAyNCBhdCAxMToxMjoxOUFNICswMDAwLCBCaWp1IERh
cyB3cm90ZToNCj4gPiBGaXggb3V0LW9mLWJvdW5kcyBhcnJheSBpbiBhZHY3NTExX2RzaV9jb25m
aWdfdGltaW5nX2dlbigpLCB3aGVuIGRzaQ0KPiA+IGxhbmVzID0gMS4NCj4gDQo+IERvZXMgdGhl
IGhhcmR3YXJlIHN1cHBvcnQgdXNpbmcgdGhlIGludGVybmFsIHRpbWluZyBnZW5lcmF0b3Igd2l0
aCBhIHNpbmdsZSBsYW5lID8gSWYgc28NCj4gYWR2NzUxMV9kc2lfY29uZmlnX3RpbWluZ19nZW4o
KSBzaG91bGQgYmUgZml4ZWQsIG90aGVyd2lzZSB0aGF0IHNob3VsZCBiZSBleHBsYWluZWQgaW4g
dGhlIGNvbW1pdA0KPiBtZXNzYWdlLCBhbmQgbWVudGlvbmVkIHdpdGggYSBjb21tZW50IGluIGFk
djc1MzNfcGFyc2VfZHQoKS4gSSB3b3VsZCBhbHNvIHByaW50IGFuIGVycm9yIG1lc3NhZ2UgaW4N
Cj4gdGhhdCBjYXNlLg0KPiANCj4gSWYgdGhlIGludGVybmFsIHRpbWluZyBnZW5lcmF0b3IgY2Fu
J3QgYmUgdXNlZCB3aXRoIGEgc2luZ2xlIGxhbmUsIHRoZSBEVCBiaW5kaW5ncyBzaG91bGQgYWxz
byBiZQ0KPiB1cGRhdGVkIHRvIGRvY3VtZW50IHRoYXQuDQoNCkFzIHBlciBbMV0sIGxhbmVzID0g
MSBpcyBub3Qgc3VwcG9ydGVkIGluIEFEVjc1MzUvQURWNzUzMy4gDQoNCkkgd2lsbCB1cGRhdGUg
dGhlIGNvZGUgYW5kIGJpbmRpbmcgdG8gcmVtb3ZlIGxhbmVzPTEgc3VwcG9ydC4NCg0KWzFdDQpo
dHRwczovL3d3dy5hbmFsb2cuY29tL21lZGlhL2VuL3RlY2huaWNhbC1kb2N1bWVudGF0aW9uL2Rh
dGEtc2hlZXRzL0FEVjc1MzUucGRmDQoNCkNoZWVycywNCkJpanUNCg0KPiANCj4gPiBGaXhlczog
NzhmYTQ3OWQ3MDNjICgiZHJtL2JyaWRnZTogYWR2NzUzMzogVXNlIGludGVybmFsIHRpbWluZw0K
PiA+IGdlbmVyYXRvciIpDQo+ID4gUmVwb3J0ZWQtYnk6IEhpZW4gSHV5bmggPGhpZW4uaHV5bmgu
cHhAcmVuZXNhcy5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6
QGJwLnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+IENoYW5nZXMgaW4gdjI6DQo+ID4gIC0gQWRk
ZWQgdGhlIHRhZyAiQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmciIGluIHRoZSBzaWduLW9mZiBh
cmVhLg0KPiA+ICAtIERyb3BwZWQgQXJjaGl0IFRhbmVqYSBpbnZhbGlkIE1haWwgYWRkcmVzcw0K
PiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUzMy5jIHwg
MyArKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPiA+DQo=
