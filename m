Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B82AAAB36C8
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 14:14:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58C6F10E196;
	Mon, 12 May 2025 12:14:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=siemens.com header.i=@siemens.com header.b="RcGqP0xM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010043.outbound.protection.outlook.com [52.101.69.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D087410E196
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 12:14:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iv2l4iq0vWi3nEQ+uEJOHSqyA4IjgZt2SPAKOOyM0I69OgopvyrmEO2MwQGZVdnVO3VB22pPVsIPzGwOsHCHkOb4TtElrT5f4mK9O7XKbW9vKTlQyCSH7UMQ/Nc5WmaFC8xnpOZ1b7baQVmKv5QePgMCVjXunyAT9wL5vynqdV184NOS3/clcZBo6cZcOAEtpoPmKk3xAyftq4w9YWiYe4m2gb7iscop7qp1HolJTav60TM+FPZA6M9ScCtRz2X09hP0EyC7Dbpv2WyX7/R8l0hMmLKFQA9Dr3VGdK/LUQ80qILxAjDwQIAova0kmk6avcrs74Ld+kru4onNMfT6Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PrK4nocsKtnyiInCIuSzZfV61O1ukDVycAwidOvmnQc=;
 b=RVlBu5w2pyUyNmjfTdeHur9zv9mB+R9G7VgeLru/g4zVxevSqxBNEAeAKqOs6sps1fd8feBAlVWWUEmRysvW7DSADS8EbX1IKLHgtMnREjgDIbNkpWrD4tO2wNd602bs6Mwgl5y4MB7uuy6EhmkDbeycx3zM4Q9OfiU5VRnSrjU0AFQx+Lrf6yrkSiMruYaU5LrNY/cgq4ad/93n+s8mLGN0mDx1Y08csvIN32Aoxthzupm7ovhCZP9b+ijPhtsliu5pTo+XKIXMD2QP6i6QwsiMI/bEKJB2fAbQL5hxKHWeptKaxan0zwA5oN2dAWxwlOZ986r164ejtK4VCPWbrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PrK4nocsKtnyiInCIuSzZfV61O1ukDVycAwidOvmnQc=;
 b=RcGqP0xMWBUO/gATDkoFVU19klAmKyOGT9v4+PvA2L2DlwA4rVfvfnKq58WeyuNi0Omy77OUVxCZFdQBAu38ZtIXL4btwhprcEQ0qp6VmYgxmryY3NXqzg0v42Srxgmd1I1bejFn+COQkijtjItNxVCZ/KmAsLXGK42F4spIiUv3MBqcn9SFcd2N8JJ+9Hg2ge3PdQ1hNNkVDyhsxECsYwyLPHROPtrnS9DlHE33C7cNxuARFsVgfiJlB/rVLbDItvZ3cOB3aTce1mvLJvoM+PhDs7jZ8PWwYqZyND7SzrCgS6XOYbQBsQnQsbJKXFJSVBkTicOdZHWHtAp0G3czFg==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by GV1PR10MB7979.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:80::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.26; Mon, 12 May
 2025 12:13:54 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4%5]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 12:13:54 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH v4 6/8] backlight: led-backlight: add devlink to supplier
 LEDs
Thread-Topic: [PATCH v4 6/8] backlight: led-backlight: add devlink to supplier
 LEDs
Thread-Index: AQHbwy6KQi63IdReNUm0mQlOTxVNOrPO3syAgAAJfAA=
Date: Mon, 12 May 2025 12:13:54 +0000
Message-ID: <b5d2b71ffc38eb1980ce72994a20e8f6ee7869bd.camel@siemens.com>
References: <20240917-hotplug-drm-bridge-v4-0-bc4dfee61be6@bootlin.com>
 <20240917-hotplug-drm-bridge-v4-6-bc4dfee61be6@bootlin.com>
 <fa87471d31a62017067d4c3ba559cf79d6c3afec.camel@siemens.com>
In-Reply-To: <fa87471d31a62017067d4c3ba559cf79d6c3afec.camel@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-1.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|GV1PR10MB7979:EE_
x-ms-office365-filtering-correlation-id: 1079f879-7e9b-4b0a-8b38-08dd914e76ae
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?V2d6V0dKbGx4OE5JeG5vTFVkalZMNUd6b01lUFE4YlR4cG1ySk1HVmZsTlhy?=
 =?utf-8?B?WWRLMElrbzd3cS95cDNabW1YaldUVm56cnNSTDhxWlFvNy9wbG0vb2JCOEdM?=
 =?utf-8?B?UU1kUkJxNDVFV0d4S1hlYXVLeTF1YTNLWHk2QkRjTVhMbWhPbXh1bDM2M1JK?=
 =?utf-8?B?TFdTYTZDVjdtVG9KeWRINUtqUmV2TVQ4RFk2Q25Lc1Z2aXRrYldBTSt6VnVX?=
 =?utf-8?B?UHNTUCtWeUZIT1Azb3Z1M094L3JzMzlaM2N0cWY4VTNaYXhqdlZFM3R5OENI?=
 =?utf-8?B?VkdOWnFXdFE0NmRZR2NaMHYzMjloS1BVaWNoS055Z3lreEdvU2tIdW52d09S?=
 =?utf-8?B?NXVhS0ZhREZwR256a2FWaDdSdXFZYjBpc0xma3R3THhNd0N3dDJLaHFTQ1p5?=
 =?utf-8?B?QXNXQ1djdkkrc2J1Z1BVeFRXdmdBQ01TZTU0STRWaTdwOGJkSVBJUUx0UlVj?=
 =?utf-8?B?cThZVlR5WHhPWkJwVk9hSTVTMEltd25VMnZzVGJrcWQwWG1YcVN4aEVObFFI?=
 =?utf-8?B?c0ZiUjdzWkpETVpXcU1lZTVvVStaUUpFNUN2UFhnUjJWOWVNZkl4d3JGbjFu?=
 =?utf-8?B?cW5FVlBLMWl1ZUk4d1M5NXM1Sm5mOFB0MTFwR0phcWp2RDBvR0FaYWpYRXcv?=
 =?utf-8?B?b3IwUGo4Z0JrZ3lQdXdhaE9yQS9qTThxU2d0R0ZPdFVvSTlaZHhES0ZnN0Ro?=
 =?utf-8?B?Zm1Ma2p2VVMydFBIdFJjUXJZd3lLWFgvTm83WjloSFZpWStZQmZkck80K1h2?=
 =?utf-8?B?Qk9sNTJqU2JkajY3eVhXVjJWbDBiQSt0TFNrSUdBOGduMG84QWtybWFxWWhH?=
 =?utf-8?B?OTBoZDVhVi9XNk1sZFo2UkdyY0lQY09JTG1GZGtsdUtXQzJSUzBpMFVOZGpP?=
 =?utf-8?B?dUhadlFrYUpseGhoZnpoeUhhZ1BtY3MweGI1Q3pKMDZyWlpuck9GVXFqSmFj?=
 =?utf-8?B?SVE0S2hFSExTTlJaOHFIdHBnNEpvRTlwUDRIenR3eEIxQUp0WVhrQUsrbzVJ?=
 =?utf-8?B?dlp4TVVQaHh3ZEJmMjg2M2U2S0NUM3FOUzYvQ1lRa1ZNQ1lORnFtM3psbHVz?=
 =?utf-8?B?U0wxQklJUzVaaTF1VVphMkQ3WnlYUlV0UzBRTmxZSTJsYVBwd1RmUUo2UXF3?=
 =?utf-8?B?U21oMy92Ynl6Rk1TVXJ0a1pWaWwrMDNtS0p2Vjh5dVcrSDY2SmxwS2NyMVFR?=
 =?utf-8?B?WmdxVHJEZDlrVlRzV1E5RmtkTkExUGdBTTFNRW9zTFBteklYUHY3N2l5bFF1?=
 =?utf-8?B?MW9wTkNhUVlWbWQwbUVHZkp3Ykt0THpTMnNjK2tuZHhZY2NtQVh5d3RyeGxQ?=
 =?utf-8?B?UFUxd09IRUJFNkZzd0hyTy80RXh1Yk9tcWVFQTNQbnNGM3lJMjJiNy9JaTQr?=
 =?utf-8?B?VW8vM2duRmVtbkZ0TmdBT0RkUE1Ca1FGWWswVkhvUFEzOW5LV0FRUGV3c3lv?=
 =?utf-8?B?T3UxNjBXVTB5N3hsSkZXVFlzRXRnTEpickdkQjMrMHFLbUdSd3BWelo2SXV1?=
 =?utf-8?B?aC9qaWJ2VnNtL2tvUk4rbTZTNVo1YUlWdGJYcGhpRS9aTlpVc2VIcmlEcXo3?=
 =?utf-8?B?dVJIK3Nia0lreE83dGRGYTBCUWhyYStxdU4yckExcGsvN1E1cGdEejN3cm5v?=
 =?utf-8?B?QTl4Y1ltL0FBaXFPNDQ0RjFCSGsweXl1bzEveHNhRWtsS1lQWWZ0eVRsandE?=
 =?utf-8?B?Y3RVTmpReHFiYnBuUDVKaFFMN3pBMFA5RElTQ0NPWFhjWmtoNm5HaTdDNUNx?=
 =?utf-8?B?TXk2VFVFeFVxUjdGTlB5aUpNMTMzQzJ2eE9aUndWRmw0WndNV2xkaUpKWENk?=
 =?utf-8?B?Nm1KVitBeWFCVCtHTVFWN0ExWTFKNi8zSk9CcGFnN0p3bUNEWEY3TkRaOU8x?=
 =?utf-8?B?L0JYM2NubFZyditDcGk5NHU0U0tvTVpZL2RGT1A2cFVDak4wTnRqRHhsWDNV?=
 =?utf-8?Q?59j7o2pbAgA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?US9TTm50YkdCNTBQbDY5YlJUUllTSy9NMjZ4SCtBT3VGVXBPOGFDQWtMLzhL?=
 =?utf-8?B?U1V0Vy90NGMvcWV1MlVkL1RhVkV4eVgrZ0RERHJhK2hBcWk5NjloL2V0QTY2?=
 =?utf-8?B?d1FwVDlrbFg5clhGb051VWNxbVNMM3pHNURpMHpKcXhndXRaYk05YW1TYndF?=
 =?utf-8?B?MzcvV3BWMzlVclB6TlJ6dTBodSsyV2NmMGI1dm9LNjlZOE1pNllUZmk5TXhJ?=
 =?utf-8?B?Y05ibFhmRXFXVzBCMHJLRUlFdTZFZlNoZXJXQ0FLYUZWeWhvOVhSNnRlalZw?=
 =?utf-8?B?cTc3aW0zOGtiMHpCbmcvVHh2RnpFcjRjWUtmOHNHNmh3czBEMzBCdUZjTVhW?=
 =?utf-8?B?Q2svNzUrNzZuZ1VReEZINFBNM0NUL2xpQTcyeTlORUVlZFNkOVNhVmRSN3hx?=
 =?utf-8?B?ZGZjNUp4ZzhEN3NES0hlUkV3bFdrRk94RzR1cnkzWitkeTA5aVlsL3JSWUpv?=
 =?utf-8?B?bklQUHBxWGY3MmVhZVJubk9rMjVWMks0WnEwUzhHQldWL3p5cVRwRmFtN3Aw?=
 =?utf-8?B?ODBxR1kweHROMlViTDRLdG1GMlA5QzZ2NWo2TTljaWFha2JjUkk0c3Q5L0ZW?=
 =?utf-8?B?OXNiUnpZMWV2OHlycEFIMWNHbHNJYUZybk1paHBXSmlCMkRmc3BxQS91TFJ1?=
 =?utf-8?B?VFk5alkxUkQzRGhRVWxmZE4vRWsvUmFycFlnQVNVNFFLL0dhdGRiRUVOeURN?=
 =?utf-8?B?QnhmWUV1aldDWlV2YklTakxhZXJodzJEQ0xLajE1UUFPeXhCU1VvYXF4N1Jv?=
 =?utf-8?B?Sk1TbnhlSnlhRGtHQmRDd3F1MWtQQjZVYXBBMGlaTEVXSWxlQlBIUi9LTHVs?=
 =?utf-8?B?cVBDM2NwNUtidnRVWjZQeFd5K3NFU2xxblhEbDkrU0d2Zi9xcHJWTTQ0YVBN?=
 =?utf-8?B?U2Y1Skk1dVRyZ1VxbGsrNzVHR1Z5Z0NwMVM4ODFPck1YM2JpeXZubm9wS1R3?=
 =?utf-8?B?VHI4VHZLTHRHeDJiRzF6TmJZZ2tMNkxIMHIrQzBqNm1SWVdFU2gvbFR0aHZn?=
 =?utf-8?B?dmQ1Q1JqN1hIOFpib2MrblYyMnQ1bGNqWG9TUVhYZkJKVDFiRzJRQzJUNytE?=
 =?utf-8?B?OVpjbjg0YUNRVml0a0l1Ti82bk5hUG4rRVJ4b3FMQzNDbFMxSXdMTzJQS2RT?=
 =?utf-8?B?NElDR0NJUGlLRGg1RktNZWd0bmJDMEZUQld6ajZBMFNCTjJZV0FNVFE1WHVQ?=
 =?utf-8?B?VStpK1NMV0FPNzdkVDRkUHFkRWdVYVFXN1hMS0xhY0l3UzJkQjVNaTJMYWdp?=
 =?utf-8?B?WDdlenZ4UURaVno0U09QOGFUWHN6cDRjaXEvVUFEb0FRTVBSK1ZxTEJSVzc4?=
 =?utf-8?B?SkZ2ZU1idUY2NnF1R3VZZ0NwZnRONXNxczkzNFVnUVFRSTdGUkVGRFJ4ZWFo?=
 =?utf-8?B?aUJyNENhQmNpeEdvWE5EUXFqWlBvN0hqc3dBTTRIbEVWallHYUxVSmJDOTlx?=
 =?utf-8?B?dHo2T21laW8yTC9uRmtrb2pQTGtrMVNOU3JQMy8rRnJ2TFVxeFdhVVJMT1Mv?=
 =?utf-8?B?b1FEeVg1SzdkY3ZQV2R0eVg1a2k2aDFuR2VoQWtwRVdYRHEyRkJCUVc4OTlZ?=
 =?utf-8?B?ZHpKSGt1TTZmaE9CMUhPaUY0YlUycTVRRWZJR0c3RCsyOVAvN1R5WGszQzRk?=
 =?utf-8?B?QnBVRjgwVXI1bjVTNHJEcm5sTFVkdjU1S215ZDVGVWdIb1plZXNmNDlIV21m?=
 =?utf-8?B?SVN4QTcweFFaWUU0Zm15NEFCM25Yb0lnbE1LU1RPanZ2OVAxbmxCR0llUlJD?=
 =?utf-8?B?YS9HREJkOGRKREVpQU9XTDVucWM1ek9FTUFwbzlING1nSmJwMGx3dDc0ZjU2?=
 =?utf-8?B?aGo0eUhkRlIxdm1aKyttYkI1ZzlScVd5eENaeWp6em5jYmtEVXFzWkxRUzZ1?=
 =?utf-8?B?NXRpdGlzVUo0UjdTeExHdFFxY3FTV3VsVTRBYjNxTVpYQlcxb1U1U2VSZlgz?=
 =?utf-8?B?V3ZXTXFjZXVub0Z0ZUhiUGExZ0hRVDBJa3dOLzVPejliN1NJYnhRVE1GYkF0?=
 =?utf-8?B?QVhCQnZyQTVaQlBNMS9CZktMb2F2MzV6NUljK0hNZG1uZExqeUxYaGNsL0JF?=
 =?utf-8?B?MjFLaDR1ZkNiMHhSeDd5aXZXYVZueXo1UzhYYmRRUnJPNFEwL3ZaR2JtQjZi?=
 =?utf-8?B?Qjk0TGFBTkYvNFJGL2J1eHhheTJqMmR6SW52SGt5dENLeEZLZ0JsMVM3cmJq?=
 =?utf-8?Q?nrCK4c1m0u7eWtZpHSHsGRM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <098A487A750E644CA0EFF0865F7A7EA2@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1079f879-7e9b-4b0a-8b38-08dd914e76ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2025 12:13:54.0972 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BeeiO3PJIxLn1KTzPoNz7LZTJlG5VoVpvDqbSWt5Vs3wKxuPUS8QaLIOFI3V50tECkGhV/iQ0hE6y/UPrSmgknlPf/XxrbhHdKWRmCOQsNM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB7979
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

SGkgTHVjYSwNCg0KT24gTW9uLCAyMDI1LTA1LTEyIGF0IDEzOjM5ICswMjAwLCBBbGV4YW5kZXIg
U3ZlcmRsaW4gd3JvdGU6DQo+ID4gbGVkLWJhY2tsaWdodCBpcyBhIGNvbnN1bWVyIG9mIG9uZSBv
ciBtdWx0aXBsZSBMRUQgY2xhc3MgZGV2aWNlcywgYnV0IG5vDQo+ID4gZGV2bGluayBpcyBjcmVh
dGVkIGZvciBzdWNoIHN1cHBsaWVyLXByb2R1Y2VyIHJlbGF0aW9uc2hpcC4gT25lIGNvbnNlcXVl
bmNlDQo+ID4gaXMgdGhhdCByZW1vdmFsIG9yZGVyZWQgaXMgbm90IGNvcnJlY3RseSBlbmZvcmNl
ZC4NCj4gPiANCj4gPiBJc3N1ZXMgaGFwcGVuIGZvciBleGFtcGxlIHdpdGggdGhlIGZvbGxvd2lu
ZyBzZWN0aW9ucyBpbiBhIGRldmljZSB0cmVlDQo+ID4gb3ZlcmxheToNCj4gPiANCj4gPiAgICAg
Ly8gQW4gTEVEIGRyaXZlciBjaGlwDQo+ID4gICAgIHBjYTk2MzJANjIgew0KPiA+ICAgICAgICAg
Y29tcGF0aWJsZSA9ICJueHAscGNhOTYzMiI7DQo+ID4gICAgICAgICByZWcgPSA8MHg2Mj47DQo+
ID4gDQo+ID4gCS8vIC4uLg0KPiA+IA0KPiA+ICAgICAgICAgYWRkb25fbGVkX3B3bTogbGVkLXB3
bUAzIHsNCj4gPiAgICAgICAgICAgICByZWcgPSA8Mz47DQo+ID4gICAgICAgICAgICAgbGFiZWwg
PSAiYWRkb246bGVkOnB3bSI7DQo+ID4gICAgICAgICB9Ow0KPiA+ICAgICB9Ow0KPiA+IA0KPiA+
ICAgICBiYWNrbGlnaHQtYWRkb24gew0KPiA+ICAgICAgICAgY29tcGF0aWJsZSA9ICJsZWQtYmFj
a2xpZ2h0IjsNCj4gPiAgICAgICAgIGxlZHMgPSA8JmFkZG9uX2xlZF9wd20+Ow0KPiA+ICAgICAg
ICAgYnJpZ2h0bmVzcy1sZXZlbHMgPSA8MjU1PjsNCj4gPiAgICAgICAgIGRlZmF1bHQtYnJpZ2h0
bmVzcy1sZXZlbCA9IDwyNTU+Ow0KPiA+ICAgICB9Ow0KPiA+IA0KPiA+IE9uIHJlbW92YWwgb2Yg
dGhlIGFib3ZlIG92ZXJsYXksIHRoZSBMRUQgZHJpdmVyIGNhbiBiZSByZW1vdmVkIGJlZm9yZSB0
aGUNCj4gPiBiYWNrbGlnaHQgZGV2aWNlLCByZXN1bHRpbmcgaW46DQo+ID4gDQo+ID4gICAgIFVu
YWJsZSB0byBoYW5kbGUga2VybmVsIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSBhdCB2aXJ0dWFs
IGFkZHJlc3MgMDAwMDAwMDAwMDAwMDAxMA0KPiA+ICAgICAuLi4NCj4gPiAgICAgQ2FsbCB0cmFj
ZToNCj4gPiAgICAgIGxlZF9wdXQrMHhlMC8weDE0MA0KPiA+ICAgICAgZGV2bV9sZWRfcmVsZWFz
ZSsweDZjLzB4OTgNCj4gPiANCj4gPiBGaXggYnkgYWRkaW5nIGEgZGV2bGluayBiZXR3ZWVuIHRo
ZSBjb25zdW1pbmcgbGVkLWJhY2tsaWdodCBkZXZpY2UgYW5kIHRoZQ0KPiA+IHN1cHBseWluZyBM
RUQgZGV2aWNlLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEx1Y2EgQ2VyZXNvbGkgPGx1Y2Eu
Y2VyZXNvbGlAYm9vdGxpbi5jb20+DQo+IA0KPiBJJ3ZlIHRlc3RlZCB0aGUgcGF0Y2ggd2l0IExQ
ODg2NCBMRUQgYXMgYSBwcm92aWRlciBmb3IgbGVkX2JsLCByZW1vdmluZyB0aGUNCj4gdW5kZXJs
eWluZyBJMkMgYnVzLiBUaGUgcGF0Y2ggYXZvaWRzIHRoZSBjcmFzaCBmb3IgbWUgKGJ5IHJlbW92
aW5nIGxlZF9ibCBkZXZpY2UgYXMgd2VsbCksDQo+IHRoYW5rcyBmb3IgZml4aW5nIGl0IQ0KPiAN
Cj4gVGVzdGVkLWJ5OiBBbGV4YW5kZXIgU3ZlcmRsaW4gPGFsZXhhbmRlci5zdmVyZGxpbkBzaWVt
ZW5zLmNvbT4NCg0KV291bGQgaXQgbWFrZSBzZW5zZSB0byBhZGQNCg0KRml4ZXM6IGFlMjMyZTQ1
YWNmOSAoImJhY2tsaWdodDogYWRkIGxlZC1iYWNrbGlnaHQgZHJpdmVyIikNCg0KPw0KDQotLSAN
CkFsZXhhbmRlciBTdmVyZGxpbg0KU2llbWVucyBBRw0Kd3d3LnNpZW1lbnMuY29tDQo=
