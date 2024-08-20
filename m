Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A2F957E8B
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 08:43:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E3A910E4C9;
	Tue, 20 Aug 2024 06:42:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="L5CB0yZV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010038.outbound.protection.outlook.com [52.101.229.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19AE510E4C9
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 06:42:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LR2dMr/fFShXz6HOnO30P4qDsoBbtBcmntWqEMDGqRB0Ls34k/IeKZtSN779CsW4fTEK/MITsYdYnNHGNXruVZrKaGN/aFcw2MfnG0eUcRlveO9Q1AL3Em21Hl44ZJqxBWjBtiLi60fXlqF7IM9OVmjKJA/4vl8rEkLrVqcqIl6CwO3H7JnszIqklu3ELYzY5+RyoOQ5R1MkHltxONovXBQuaChaDLhDC0X+PBQ1eQxT1za4W7bE8OEwbvbb8v5WswPgYAYyg8ddVHP1LyZWrLNXK9tjp9ZW1cKroAnpPOxPb3mqGUhOQ2oWNV7asXYsTPrIBHzI12OP9ouHQsdQMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LBlL2K3wC9qLgi8a3dT/dhcrP6CmaVKKSlhBvvOwqdQ=;
 b=WLql36OVg61Z+9HjAm9DpuHEeImIQyHmJAYliMXYFSEQS69MjtJ4zB/vYLdbgdgy7qdAC0Gq1A9/hPZjHFbXgBkFGXHhSKL0qaBagNTv2XDJhm7d3Y/dU0dKP6DxYiVp7KK32cqylfmDsfa0KD1CFU57oPEe9nrpo3CLmht4LgUtAcCoBvzgzcdujBFzilNteAQvNo9XjhfV+mkq63470Pbj/RnRqTCy8NQU9s65q6UGSFWzuWP6/YgMOJ/ONyrWUOx0tj2a4c+58yl3yJMsSDYCJTGZL8hm9oxdc+xcxcmtKQUYjfKGvmX/rB1g8LX71B3308Pwnmm+BsQWNX1iSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LBlL2K3wC9qLgi8a3dT/dhcrP6CmaVKKSlhBvvOwqdQ=;
 b=L5CB0yZVuLVa129iLNP/HUEjqSTPdYIMdVSWF6S9Nrbw+JdIXHsmLBfWikZSeC7jdIvOhZBN8COfniDl5NduXLk5h6qRrxNEjkwjHv5PSM/SYbhBXNZNZrvzIU10byJwSKxLuIYrZmdImIktecd774+Lc337PAyuXhxe2vSO9M4=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB13449.jpnprd01.prod.outlook.com (2603:1096:604:332::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Tue, 20 Aug
 2024 06:42:49 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 06:42:48 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
CC: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
 <biju.das.au@gmail.com>
Subject: RE: [PATCH v3 1/4] dt-bindings: display: renesas,rzg2l-du: Document
 RZ/G2UL DU bindings
Thread-Topic: [PATCH v3 1/4] dt-bindings: display: renesas, rzg2l-du: Document
 RZ/G2UL DU bindings
Thread-Index: AQHa51OeDAJ50N6hlE+dnXg1qW6SlbIlbhQAgAA0N4CACPdU0IABLFuw
Date: Tue, 20 Aug 2024 06:42:48 +0000
Message-ID: <TY3PR01MB11346FE2410784131B61DF0E1868D2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240805155242.151661-1-biju.das.jz@bp.renesas.com>
 <20240805155242.151661-2-biju.das.jz@bp.renesas.com>
 <20240813163220.GA1164014-robh@kernel.org>
 <20240813193913.GH24634@pendragon.ideasonboard.com>
 <TY3PR01MB11346EC4C14C99A1771DE9A6C868C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346EC4C14C99A1771DE9A6C868C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB13449:EE_
x-ms-office365-filtering-correlation-id: 5a5d4727-460a-4d4a-6c5f-08dcc0e34e7b
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?eHA0Q3BkM3RBQmdoVTFYVTRLZUVlbmdWMEhCcVZuVk1hNXh4T3NjQzZaaUdl?=
 =?utf-8?B?SGVTbVBpV0poWDIwVU9lcVNvTE5SMjJBM0Rxc1VtbFM0eFpJaFRpV1E4aVo3?=
 =?utf-8?B?eGFDS1E4QTFKSFhGY1hGNW11aGtTcGRndWpyb1ZVQ3lwWWU4QkhMS2h0RXNT?=
 =?utf-8?B?Y2l4cG5KV0d3QjJkU3g5YVJmTnBXdFJNallUcU1kUWh2Wnl5L2RqUEQzVVNO?=
 =?utf-8?B?L2NRb0NmRTZEZ25MZWtTZVJ6M2FGbWxsYjFyeEJLUlVSREZLd3VQQWErOVlT?=
 =?utf-8?B?RjdtWUlKUFNuVm81aytGMlVQaGZaUDgxalFNRGJiNVVzSWNidEkxWE0xbkxE?=
 =?utf-8?B?elhwTG5NUUVwci9lRjhKRW4wd2VMdTdkd0JPMVNXL0VoSW1wclAraEk2Vmdn?=
 =?utf-8?B?MGNtNHRTMjczNmdnZlA0TkJ2QkdubS95cjNZTDl0cHhPRVk4QmRKdVNjYlkw?=
 =?utf-8?B?bWNReTRoanMvbkVBSzZBZi95cUNIQkEwMUluR0MvcVlkTktOUUFKeGMxUFU4?=
 =?utf-8?B?RUM1dWtRdDBwNzVMbnFWUHQwMklwZ05mb1luT0p2eWhBWVRJcXZ5b3BscXZh?=
 =?utf-8?B?WUZSeEJPUmYvckZ5QmpWL1FGV0dhRFpsemJFV0labHRQc1BoWnFaSEUxR0Fx?=
 =?utf-8?B?TnRxb25kbmEzWGJnQy9zSkhOQWJkNXR1U21tc0RWQVg2U0NLVktleVdIcnFt?=
 =?utf-8?B?b2NzamJFV1d0S05ZZUJIM05CQnN0MjdWc2FSVks1TDVHRERrWWorcnZ0RnZh?=
 =?utf-8?B?UU5WWUhIZkxXVHAwQUlSMjRIZGpIbjZWZTl2KzA4WXpGc0p6UVhCa2REVGJr?=
 =?utf-8?B?UXpEUWt4WTdnUEpSWHVpTVhEQnM1dSsrTVA4MitYU2NRTTQwU1lTZmlrVlk5?=
 =?utf-8?B?V09qSk9TclpDY3RPVDNPNm5WaFdsRWtLVVEycW5kZnhtaFhOcDZWckZqOEtl?=
 =?utf-8?B?UTdValVvZkFJNkp3VjdGQmtuVVFQTWpaMTNRdHpGcmtxQ2ZOdDZTV0hDODJM?=
 =?utf-8?B?ZUNVdnpZM21kdWNqRTRZYnQvZmZpY0l3VGlveDNKbU1LQlhxdmVveUlWcHpa?=
 =?utf-8?B?ZlNIYU4ra09UNTVjckFqTHhqWW5tQTVGaENKRzhYd0MxNFRFc092Y00wMU10?=
 =?utf-8?B?bUxMeEF5dnQxbzVxaTJXUUEydlh0cnB6WVp4eGxuVTV3bVRzWUx2NWE5d254?=
 =?utf-8?B?K01tanpDTnpINTZ4YzJuUzNTRnZ5OWpEcExjWUJTUmFyUGNQT0pUc0E2TlpX?=
 =?utf-8?B?VVZVR2FCckdjcWZ2eTVzZVQzNU5wSnhtMHlidnVJUVZjdkVSQnRrSGlZdkNF?=
 =?utf-8?B?Q1A0OUc5cmtUa09oVjNRUDhYUUpWQnlRaFZRRXFyV1lmbkk4Z045S2JPVUZ1?=
 =?utf-8?B?R2NTV25vRDRnL1FjYWRvUWxRTndOc0VGWEdGNnEwTnU1QTdBTGZQMm1PSEhO?=
 =?utf-8?B?N213STYremtTOHV4WTFkTktic20rSElwcm1iNXZKeWY4bjBsRzhwRTBlL0pX?=
 =?utf-8?B?amp5N3FGRC9laTV0dXVia1dGOWdWRmVicVVWaDRFcWJtVFpwNUJwMmJSNU1n?=
 =?utf-8?B?SEwyTXppM0lMWjBxK21hbkZJM2VvTmh3T3g5OWtIcUhJOVR5dVg3TFR2akVs?=
 =?utf-8?B?ajR4QVg3aVU1bUphYWZCUzV6d3NGc1g3R1BKNGxLSFR5a3dza1VmVVF1cUIv?=
 =?utf-8?B?Z1U0YXJIL3dKOGxzRm81WHRTQ1ZWZkdrQnlPczFjVTR4ZFUzc1VJUGtQdTdK?=
 =?utf-8?B?MkFsbG9uRnVCRnlzaUVGVE9OTVJOK0wrSWtaOHNrem5BZXptRjlqeS9oRWI4?=
 =?utf-8?B?OEVWcVFoSk1HempNTm0rMTJlRjAzM2hXYStMcitqUXB4OHZQSDVXZVpGc2pO?=
 =?utf-8?B?eldmMkd1cFFTb3RHcUdWNzk3UGt3OWNNN2tUQ054bkZPL0E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c2NUSzhMSGhURVhiS0NhT3ErMFUvWDZwVXYxakl0aFJCZlVPR2U1WUxQOXdZ?=
 =?utf-8?B?SFUrZEM1NytOV2llSFBJM1dtYVlkSVpoT242NE1BSW9NTzJ6OXBQYzN2WHpl?=
 =?utf-8?B?VGN5cmUwWFppd2k5b2sxdDJmUEx5eUtXamV0NXpHYXlSUDFueUZlRGZMYlEz?=
 =?utf-8?B?SFZZZVR0ZUV2cGhQRzFTMFJCa0pWd3pNQ1ZHZXduQksrdm90SlM5elJTR1hZ?=
 =?utf-8?B?c01oQzA4T05jY0ZEengrY25yMStoR2IvN0NLVXpuODY4bG5zMEVtRkJOdmVn?=
 =?utf-8?B?MTZ3MU5qNExDNkNZUm5Rd3E1and5Qk82c2hRekp5Z1lmQTFCNG5OOXJxRVcy?=
 =?utf-8?B?QVpZZnR1SmUyRlR0YlRQK3VTRFJER3VjY1VSNzRBdGM4Tk9mRFk4TjF2OENw?=
 =?utf-8?B?SHAyWXlMcjlHMTNGWEwyc0RUaUJoQ0lGaWNFUnhYcUVXKzk2d2xqaVdEdmNk?=
 =?utf-8?B?MHNLOGIyQy9mUTlyZS9xbHU0ZkF1a3ZTbi9XZzJrTHp3OWRIMllka2txc3VU?=
 =?utf-8?B?T2w4R3VjOVR4NjNuMjlKdHdRSzJndm5RbzVOVFJIQnB0R25SVW5PSWNsN3Nu?=
 =?utf-8?B?OWhXSm1pOWduYk9yVHRxdjltNXZmd0hTb29tM3c1TW1RUzZURHhkY0I0bm5Y?=
 =?utf-8?B?SGlyZEZsMExac0d4TmlDOW9CVmhPTzNXTlZrMU1peUtIclpVMmFBUU13bWs3?=
 =?utf-8?B?NzlXMHA0TWt3bTB3cnNTV2hPNDE5NHNNZ1hzRDRmaDJ2UFppbGc1UXJ3SVlD?=
 =?utf-8?B?aktzcTNyWmJjYlJmWUZVZ0xGZzJOOG5IUW1qekFXdEVmZUk1WmZmOC9xUG1M?=
 =?utf-8?B?OEhsUWN6RkhKbFpkU3lDRXhsdzdST0pqYXExQkhFQTQ1Y0dBcG96SGg3VFlq?=
 =?utf-8?B?UklrODB5dFVzWVZQZU42aEdvRm9rdWxmVEMwVjNIWkR3d1J5ckcvUzZGb0dG?=
 =?utf-8?B?UjVRU0RkdGl0M1pqazM3MjltZ1lmTGFaZTkrbzdFSm5DNW9oTkhOdkdSc1dK?=
 =?utf-8?B?Zkhib3VXUERXSVBhdVhDR09nV2xpSUs0S28rKzhGZ2JWZm9TRXA1enF6dEpP?=
 =?utf-8?B?cTc4bERIa0pzMzJJZDZNejk0NndpY1hSMWR5TGRtNHQzeFlVZTZzSVZ5QUdn?=
 =?utf-8?B?TU1FY0hQK0s3bVBuQmNES2NuTFI0MVJEN21PWWljeFdSR0t5ZG1vNmxzMVRK?=
 =?utf-8?B?TzJPOG5lQldpaWR0SFdqdVhtQldaSFEzOEZXMC9xajg0eWRGZU9VOHVuaEty?=
 =?utf-8?B?NU5IUDN5Y2FFUnZvb0NBVnFxUk13dU9KMFlJenZlWkRKVjZtZGhlbDg3L3V4?=
 =?utf-8?B?eVVCa3h6SDdhbkRXNkZyUHVSL0hQcXV2RWN4SGxFa2wxc3crOTU1QkdNS20x?=
 =?utf-8?B?SVloSTZwVTFzZmthMVdkVzByZGJENEpsbTJxVXBIVXlUR3dNakl6bnZocXNR?=
 =?utf-8?B?akEwamEzbEl5NGh0K1VKM2NwUkxndzR0eEdaTEJjeFlJMHhjbUVBZUp5MTIv?=
 =?utf-8?B?Y2NnZS9CZkU2SWZCRXNjMjJZc2xWYlIxRzhxOEtaQjRGVG83cUtIZjRLNGYy?=
 =?utf-8?B?ajNNQkFsTzVUV0dRUUNzdlVZdkYyNk8wR2xFdHdyRzREU3J1S2pTUHYvKzN5?=
 =?utf-8?B?UGgwUUlMZ3NCb3UxQ3drcGJkYWZMR0I4bm9CeGUyOStmY2h2MmhqSTNtejJq?=
 =?utf-8?B?cHczR3AwZTlPK3lWVFBXZnR0Rzh5RTZTN2kzdVU2SWJJMGhOWi82ZnNpRHhF?=
 =?utf-8?B?MXFsVW95bUVidUlzVzRRRnQ5SVhXbWlEcmxFZ2grRmdPNzByYnhBWDdxTTRJ?=
 =?utf-8?B?QnFTb1dxM0liZjJxYjA4cExlZmxwU1RaZk14V0RsRy9PYnczM0N1WjllQ3Vs?=
 =?utf-8?B?TnVrV3E1SFI2UThnR3VvZFRXNkZtRWc3dm9lTmx4UW1iRHUzS1djL0ZOR2dt?=
 =?utf-8?B?b3R3aHhPOVJmTWJ6a0NpcDh1N3RnUUFCbVcyeGNJbEVEeHk3a0Q0a2xxbnVp?=
 =?utf-8?B?U2d5SldaNis3d25JaDc3czdqTWR2cHFtdzhtbkhaUHRWSXFPUFRWT1pWQ0ZR?=
 =?utf-8?B?c2ZRMWlScDFta3ZJOGFVd3p1NGhsTzJBVjMrSnBWN1RVbDlweHVaL28vbTdK?=
 =?utf-8?B?dFRqMTZaa0xvdGxaanVrQnh3dldTcHMzYzF5YzJEdHNab0x6YW1LWnFMRUdW?=
 =?utf-8?B?SVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a5d4727-460a-4d4a-6c5f-08dcc0e34e7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2024 06:42:48.6109 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jNSY4kpumbuAz0ocOGNu7IhNpqSX3MW5sNcyvLKDaX7LzIzoiP5ez+FqjD08k2AZBPPDh7bloNHEdXAAPAqZG6pnKdRY/eIjCwlbLJD5PPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13449
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

SGkgUm9iIGFuZCBhbGwsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
QmlqdSBEYXMNCj4gU2VudDogTW9uZGF5LCBBdWd1c3QgMTksIDIwMjQgMTozNyBQTQ0KPiBTdWJq
ZWN0OiBSRTogW1BBVENIIHYzIDEvNF0gZHQtYmluZGluZ3M6IGRpc3BsYXk6IHJlbmVzYXMscnpn
MmwtZHU6IERvY3VtZW50IFJaL0cyVUwgRFUgYmluZGluZ3MNCj4gDQo+IEhpIExhdXJlbnQgYW5k
IFJvYiwNCj4gDQo+IFRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrDQo+IA0KPiA+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5j
aGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiA+IFNlbnQ6IFR1ZXNkYXksIEF1Z3VzdCAxMywgMjAy
NCA4OjM5IFBNDQo+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAxLzRdIGR0LWJpbmRpbmdzOiBk
aXNwbGF5OiByZW5lc2FzLHJ6ZzJsLWR1Og0KPiA+IERvY3VtZW50IFJaL0cyVUwgRFUgYmluZGlu
Z3MNCj4gPg0KPiA+IEhpIFJvYiwNCj4gPg0KPiA+IE9uIFR1ZSwgQXVnIDEzLCAyMDI0IGF0IDEw
OjMyOjIwQU0gLTA2MDAsIFJvYiBIZXJyaW5nIHdyb3RlOg0KPiA+ID4gT24gTW9uLCBBdWcgMDUs
IDIwMjQgYXQgMDQ6NTI6MzVQTSArMDEwMCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gPiA+IERvY3Vt
ZW50IERVIGZvdW5kIGluIFJaL0cyVUwgU29DLiBUaGUgRFUgYmxvY2sgaXMgaWRlbnRpY2FsIHRv
DQo+ID4gPiA+IFJaL0cyTCBTb0MsIGJ1dCBoYXMgb25seSBEUEkgaW50ZXJmYWNlLg0KPiA+ID4g
Pg0KPiA+ID4gPiBXaGlsZSBhdCBpdCwgYWRkIG1pc3NpbmcgcmVxdWlyZWQgcHJvcGVydHkgcG9y
dEAxIGZvciBSWi9HMkwgYW5kDQo+ID4gPiA+IFJaL1YyTCBTb0NzLiBDdXJyZW50bHkgdGhlcmUg
aXMgbm8gdXNlciBmb3IgdGhlIERQSSBpbnRlcmZhY2UgYW5kDQo+ID4gPiA+IGhlbmNlIHRoZXJl
IHdvbid0IGJlIGFueSBBQkkgYnJlYWthZ2UgZm9yIGFkZGluZyBwb3J0QDEgYXMNCj4gPiA+ID4g
cmVxdWlyZWQgcHJvcGVydHkgZm9yIFJaL0cyTCBhbmQgUlovVjJMIFNvQ3MuDQo+ID4gPiA+DQo+
ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNv
bT4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+IHYyLT52MzoNCj4gPiA+ID4gICogUmVwbGFjZWQgcG9y
dHMtPnBvcnQgcHJvcGVydHkgZm9yIFJaL0cyVUwgYXMgaXQgc3VwcG9ydHMgb25seSBEUEkuDQo+
ID4gPiA+ICAgIGFuZCByZXRhaW5lZCBwb3J0cyBwcm9wZXJ0eSBmb3IgUlove0cyTCxWMkx9IGFz
IGl0IHN1cHBvcnRzIGJvdGggRFNJDQo+ID4gPiA+ICAgIGFuZCBEUEkgb3V0cHV0IGludGVyZmFj
ZS4NCj4gPiA+DQo+ID4gPiBXaHk/IEhhdmluZyBwb3J0IGFuZCBwb3J0cyBpcyBqdXN0IGEgbmVl
ZGxlc3MgY29tcGxpY2F0aW9uLg0KPiA+DQo+ID4gSSBhZ3JlZSB0aGF0IG1ha2luZyB0aGUgcG9y
dHMgbm9kZSBtYW5kYXRvcnksIGV2ZW4gd2hlbiB0aGUgZGV2aWNlIGhhcw0KPiA+IGEgc2luZ2xl
IHBvcnQsIHdpbGwgc2ltcGxpZnkgdGhlIGJpbmRpbmdzLiBJbiBoaW5kc2lnaHQgd2Ugc2hvdWxk
IG5ldmVyIGhhdmUgbWFkZSBwb3J0cyBvcHRpb25hbCwNCj4gYnV0IHRoYXQgY2FuJ3QgYmUgY2hh
bmdlZC4NCj4gPg0KPiA+ID4gPiAgKiBBZGRlZCBtaXNzaW5nIGJsYW5rIGxpbmUgYmVmb3JlIGV4
YW1wbGUuDQo+ID4gPiA+ICAqIERyb3BwZWQgdGFncyBmcm9tIENvbm9yIGFuZCBHZWVydCBhcyB0
aGVyZSBhcmUgbmV3IGNoYW5nZXMuDQo+ID4gPiA+IHYxLT52MjoNCj4gPiA+ID4gICogVXBkYXRl
ZCBjb21taXQgZGVzY3JpcHRpb24gcmVsYXRlZCB0byBub24gQUJJIGJyZWFrYWdlLg0KPiA+ID4g
PiAgKiBBZGRlZCBBY2sgZnJvbSBDb25vci4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+ICAuLi4vYmlu
ZGluZ3MvZGlzcGxheS9yZW5lc2FzLHJ6ZzJsLWR1LnlhbWwgICAgfCAzNSArKysrKysrKysrKysr
KysrKy0tDQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkNCj4gPiA+ID4NCj4gPiA+ID4gZGlmZiAtLWdpdA0KPiA+ID4gPiBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMscnpnMmwtZHUueWFtbA0K
PiA+ID4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JlbmVz
YXMscnpnMmwtZHUueWFtbA0KPiA+ID4gPiBpbmRleCAwOGU1Yjk0NzgwNTEuLmNhMDFiZjI2YzRj
MCAxMDA2NDQNCj4gPiA+ID4gLS0tDQo+ID4gPiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvcmVuZXNhcyxyemcybC1kdS55YW1sDQo+ID4gPiA+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMscnpnMmwtZHUu
eQ0KPiA+ID4gPiArKysgYW0NCj4gPiA+ID4gKysrIGwNCj4gPiA+ID4gQEAgLTE4LDYgKzE4LDcg
QEAgcHJvcGVydGllczoNCj4gPiA+ID4gICAgY29tcGF0aWJsZToNCj4gPiA+ID4gICAgICBvbmVP
ZjoNCj4gPiA+ID4gICAgICAgIC0gZW51bToNCj4gPiA+ID4gKyAgICAgICAgICAtIHJlbmVzYXMs
cjlhMDdnMDQzdS1kdSAjIFJaL0cyVUwNCj4gPiA+ID4gICAgICAgICAgICAtIHJlbmVzYXMscjlh
MDdnMDQ0LWR1ICMgUlovRzJ7TCxMQ30NCj4gPiA+ID4gICAgICAgIC0gaXRlbXM6DQo+ID4gPiA+
ICAgICAgICAgICAgLSBlbnVtOg0KPiA+ID4gPiBAQCAtNjAsOCArNjEsOSBAQCBwcm9wZXJ0aWVz
Og0KPiA+ID4gPiAgICAgICAgICAkcmVmOiAvc2NoZW1hcy9ncmFwaC55YW1sIy9wcm9wZXJ0aWVz
L3BvcnQNCj4gPiA+ID4gICAgICAgICAgdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQ0KPiA+
ID4gPg0KPiA+ID4gPiAtICAgIHJlcXVpcmVkOg0KPiA+ID4gPiAtICAgICAgLSBwb3J0QDANCj4g
PiA+ID4gKyAgcG9ydDoNCj4gPiA+ID4gKyAgICAkcmVmOiAvc2NoZW1hcy9ncmFwaC55YW1sIy9w
cm9wZXJ0aWVzL3BvcnQNCj4gPiA+ID4gKyAgICBkZXNjcmlwdGlvbjogQ29ubmVjdGlvbiB0byB0
aGUgRFUgb3V0cHV0IHZpZGVvIHBvcnQuDQo+ID4gPiA+DQo+ID4gPiA+ICAgICAgdW5ldmFsdWF0
ZWRQcm9wZXJ0aWVzOiBmYWxzZQ0KPiA+ID4gPg0KPiA+ID4gPiBAQCAtODMsMTEgKzg1LDM4IEBA
IHJlcXVpcmVkOg0KPiA+ID4gPiAgICAtIGNsb2NrLW5hbWVzDQo+ID4gPiA+ICAgIC0gcmVzZXRz
DQo+ID4gPiA+ICAgIC0gcG93ZXItZG9tYWlucw0KPiA+ID4gPiAtICAtIHBvcnRzDQo+ID4gPiA+
ICAgIC0gcmVuZXNhcyx2c3BzDQo+ID4gPiA+DQo+ID4gPiA+ICBhZGRpdGlvbmFsUHJvcGVydGll
czogZmFsc2UNCj4gPiA+ID4NCj4gPiA+ID4gK2FsbE9mOg0KPiA+ID4gPiArICAtIGlmOg0KPiA+
ID4gPiArICAgICAgcHJvcGVydGllczoNCj4gPiA+ID4gKyAgICAgICAgY29tcGF0aWJsZToNCj4g
PiA+ID4gKyAgICAgICAgICBjb250YWluczoNCj4gPiA+ID4gKyAgICAgICAgICAgIGNvbnN0OiBy
ZW5lc2FzLHI5YTA3ZzA0M3UtZHUNCj4gPiA+ID4gKyAgICB0aGVuOg0KPiA+ID4gPiArICAgICAg
cHJvcGVydGllczoNCj4gPiA+ID4gKyAgICAgICAgcG9ydDoNCj4gPiA+ID4gKyAgICAgICAgICBk
ZXNjcmlwdGlvbjogRFBJDQo+ID4gPg0KPiA+ID4gVGhpcyBpcyBlcXVpdmFsZW50IHRvICdwb3J0
QDAnLiBJTU8sIHRoaXMgY2FzZSBzaG91bGQgaGF2ZSBhICdwb3J0QDEnDQo+ID4gPiBub2RlIHNv
IHRoYXQgRFBJIGludGVyZmFjZSBpcyAqYWx3YXlzKiB0aGUgc2FtZSBwb3J0Lg0KPiA+DQo+ID4g
VGhhdCdzIHdoYXQgQmlqdSBkaWQgaW4gdGhlIHByZXZpb3VzIHZlcnNpb24sIGFuZCBJIHJlY29t
bWVuZGVkIHRvDQo+ID4gbnVtYmVyIHRoZSBwb3J0cyBiYXNlZCBvbiBoYXJkd2FyZSBpbmRpY2Vz
LCBub3QgdHlwZXMuIE1hcHBpbmcgcG9ydA0KPiA+IG51bWJlcnMgdG8gdGhlIGhhcmR3YXJlIGRv
Y3VtZW50YXRpb24gbWFrZXMgaXQgbW9yZSBjb25zaXN0ZW50IGZvciBEVA0KPiA+IHdyaXRlcnMs
IG1ha2VzIHRoZSBsb2dpYyBzaW1wbGVyIHRvIHVuZGVyc3RhbmQgKGluIG15IG9waW5pb24sIGJh
c2VkDQo+ID4gb24gbXkgZXhwZXJpZW5jZSB3aXRoIHRoZSBSLUNhcg0KPiA+IERVKSBvbiB0aGUg
ZHJpdmVyIHNpZGUsIGJ1dCBtb3N0IGltcG9ydGFudGx5LCB0eXBlLWJhc2VkIG51bWJlcmluZw0K
PiA+IHdvdWxkbid0IHNjYWxlIGFzIFNvQ3MgY291bGQgaGF2ZSBtdWx0aXBsZSBwb3J0cyBvZiB0
aGUgc2FtZSB0eXBlICh3ZSd2ZSBzZWVuIHRoYXQgaGFwcGVuaW5nIHdpdGggUi0NCj4gQ2FyKS4N
Cj4gDQo+IE9LLCBJIHdpbGwgc2VuZCBiaW5kaW5ncyBiYXNlZCBvbiBoYXJkd2FyZSBpbmRpY2Vz
Lg0KDQpJIGdldCBhIHdhcm5pbmcsIGlmIEkgdXNlIHBvcnRzIGFuZCBwb3J0QDAgZm9yIHNpbmds
ZSBwb3J0LiBJIGRvbid0IHNlZSB0aGlzIHdhcm5pbmcgaWYgSSB1c2UgcG9ydHMgYW5kIHBvcnRA
MQ0KDQphcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDdnMDQzdS5kdHNpOjE2OS45LTE3
OC41OiBXYXJuaW5nIChncmFwaF9jaGlsZF9hZGRyZXNzKTogL3NvYy9kaXNwbGF5QDEwODkwMDAw
L3BvcnRzOiBncmFwaCBub2RlIGhhcyBzaW5nbGUgY2hpbGQgbm9kZSAncG9ydEAwJywgI2FkZHJl
c3MtY2VsbHMvI3NpemUtY2VsbHMgYXJlIG5vdCBuZWNlc3NhcnkNCg0KQ2FuIHdlIGZpeCB0aGUg
ZHQtc2NoZW1hIHRvIGdldHRpbmcgY29uc2lzdGVudCByZXN1bHRzIGZvciBzaW5nbGUgcG9ydCB1
c2FnZSBpbnZvbHZpbmcgcG9ydHM/DQoNCg0KKyAgLSBpZjoNCisgICAgICBwcm9wZXJ0aWVzOg0K
KyAgICAgICAgY29tcGF0aWJsZToNCisgICAgICAgICAgY29udGFpbnM6DQorICAgICAgICAgICAg
Y29uc3Q6IHJlbmVzYXMscjlhMDdnMDQzdS1kdQ0KKyAgICB0aGVuOg0KKyAgICAgIHByb3BlcnRp
ZXM6DQorICAgICAgICBwb3J0czoNCisgICAgICAgICAgcHJvcGVydGllczoNCisgICAgICAgICAg
ICBwb3J0QDA6DQorICAgICAgICAgICAgICBkZXNjcmlwdGlvbjogRFBJDQorDQorICAgICAgICAg
IHJlcXVpcmVkOg0KKyAgICAgICAgICAgIC0gcG9ydEAwDQoNCkNoZWVycywNCkJpanUNCg==
