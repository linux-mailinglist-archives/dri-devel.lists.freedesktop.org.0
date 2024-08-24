Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6041B95DEEB
	for <lists+dri-devel@lfdr.de>; Sat, 24 Aug 2024 18:14:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 595CB10E0A8;
	Sat, 24 Aug 2024 16:14:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="HKLOfy35";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010052.outbound.protection.outlook.com [52.101.229.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABAA310E0A8
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Aug 2024 16:14:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FGaF/dUzrFsk/OzPaowct/Xqddw1yxzvkDM/cEiJdVUgk+IVpcVJ8OZ4mzt9iGiYMKAFrLQI4374TRNNWcyUR0VSSHTw0yZnGLyRboZR9rUGZwoGPI0BbZCxegtLHg1hAiCkSF5b08gn90TemqZqWBp3UmMLjuu43wUltrgNr+u/ATtBM9r/qSrfo5nI6hLv12CBh65BX8lZcAb9+pyQCLRzoE0069A+LK8EJnEkoWOO0h4raX4zayk49V4T+TUnpiAFGKdV7NeXpqltSny2aBuioI49XQGEtsu9CkyKnoYHGatt3f5lISTXxVZqw2VfKsUzxkwNBF/51OGciXrvHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s6EKPo9rz6am/QZVQMrbrXgJloZ/uiQcw0GNpGoLneg=;
 b=cTMqA9A3BRYpKa0ert1XBDptS6kUNSPwUJ/nrTYm7r8Q6j2mC0AYf3b11gkBx7FyZF2RSPU+slzoun0U7wx7qLHCP+0wgBHsiOcWIONa5cF41zIslCyt6gRHDMRg6eAajTumvCpxPxQ59tVT40aQUkrba63M+o4FzS+4xdl0AXidbJZxyeTRNn4lxyFazZaitpXGRBfAmjcGGpg1S7+bQO2+aEw5NUudW9f/ic9ELAlcTTs/n4HStwcByUr9yf3xNJ1hSF7nw6q85I86zQ0Ws+1Bzp/fiJrep11q/9f/aZa5OLJlHSkcI3ErA+Da0mC2QDdXCuV9Is+sH/9JG1hcyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6EKPo9rz6am/QZVQMrbrXgJloZ/uiQcw0GNpGoLneg=;
 b=HKLOfy35UBT5reMMA/ueMTZG6pSaIHIvOHnBNChj3SyxzoU8JZJ4TCSEGzfPzVe5zymhjQzWZtyus2rDOvt3vkSJ65Lzi7T+bI9ZnCCoOiKO24qKjAAslYg4aM3cZqrBFszD5tH4sQ9kf2mNFFncftjZEf4aJMU31C/4KNqKXS0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB9525.jpnprd01.prod.outlook.com (2603:1096:400:19a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.22; Sat, 24 Aug
 2024 16:14:40 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.7897.021; Sat, 24 Aug 2024
 16:14:40 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Conor Dooley
 <conor+dt@kernel.org>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
 <biju.das.au@gmail.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: RE: [PATCH v4 0/4] Add support for RZ/G2UL Display Unit
Thread-Topic: [PATCH v4 0/4] Add support for RZ/G2UL Display Unit
Thread-Index: AQHa9K+g3b0qbrJ9gkKCaVY3tzZtn7I0050AgAAG5zCAABZqgIABpqMA
Date: Sat, 24 Aug 2024 16:14:40 +0000
Message-ID: <TY3PR01MB11346820790BBDE23AE618A2B86892@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240822162320.5084-1-biju.das.jz@bp.renesas.com>
 <20240823131516.GD26098@pendragon.ideasonboard.com>
 <TY3PR01MB11346F4E01D1FA2688D2799F586882@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20240823150011.GO26098@pendragon.ideasonboard.com>
In-Reply-To: <20240823150011.GO26098@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB9525:EE_
x-ms-office365-filtering-correlation-id: f949d140-56b3-48a9-cab6-08dcc457db68
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?WDdPd0xGUW9KQkUxSFMvYXhiL2RkQlpMUzlnVGpaR0U2ZzRoQ0E2RlVLR2JQ?=
 =?utf-8?B?aTBVUlZVNjJhRU1uejJGVVpBMmFqR3djK1VwbDkzMld1ZllLQnUzSmlUQ0dV?=
 =?utf-8?B?VFVIU0dUTitHRUpCQjZsUFlqdG5naEp0OTBMU3JrQk9EZkVJWkkxY2VmbEkx?=
 =?utf-8?B?WjVnSkliUytxTHRzVm5YSTlYdy9UTkFnSWRMTTNBRmFoYUJ2cG11eXRNUVp4?=
 =?utf-8?B?VkJTZjFnQTlDQlhpTFg5MC9nQXRBRjg4ZTYzZkpyVXpBeTNrcDdvK0dKZm5s?=
 =?utf-8?B?dWFGNUwzcGljd3BOQm5zY1VPOEhWTGJ6a3VnRWF3RlRtMzl2ckZCVEdheXpK?=
 =?utf-8?B?d21hTm40UFNZQitna0FYN210SXYyYVNKWHg0eUplLzdKWDJmVWNxWTRSa29x?=
 =?utf-8?B?YVZwcWJra0lBb3Nxc3lYNmgycjBwc0o5TmhQOVV6ZldaZ3RRelBObVJhUFdn?=
 =?utf-8?B?TzdENTB0SFJYYjh4bzdhem40ZklJSXBFc29ITWxhWlRzYUU1K3IvaVJ1NHBj?=
 =?utf-8?B?WmlaZVdQaStIQ3dtVElVeWxob1BON3pNbis2SnBJWVEwbGFwcDI1TTB5UEdz?=
 =?utf-8?B?SVRBaVgwQS9LUUV5OXE0QUU0WGZNN291QVlJNlQ1Z2ZQZmppS2dqdXBxUWVn?=
 =?utf-8?B?bkNhRGhzRWVKN1pzTndlSXNubWlKUldacFpJU1RQRzNsdkxNekRDY2txNkw0?=
 =?utf-8?B?eFFoOTdCVDlFUVE1c3BEaWUwRTU5eTNxWW9hOGtmWDdESXRMQVdNYUJGR0Mx?=
 =?utf-8?B?NjQwZ0hzS3QwUDlwOVRrQUc0eDczYnZqQjc2UUs2QktWWThnWVJzczFqdkRy?=
 =?utf-8?B?RjBqVW1YSFRieFhSMmlicDVHcjhzRnZaUmMrNVowV0Rkd3NyOFRQMHdyYVVn?=
 =?utf-8?B?QnZFVjQvTWhIZHVGTUJ6RnJMZUVBdjRJQmVEY1EzZTYyNGJVUFRVUko5MXlr?=
 =?utf-8?B?aFBLaEx4c25NRk15N3JiR0FGdXkyTWx4MGx4YUxjaVBiU1FyVkVtUUNOVXVX?=
 =?utf-8?B?L0FXS0czTHZjYzByODJCcXcvK0dkRTdGOUVQOHNVeHN4S1FEeWttN1QrOTI5?=
 =?utf-8?B?dkFHUDU4MmxURUtwcUVnZmt1ZHZSb3Q2RTdIRStvUjVuSEZyRkorZ3ZOWXVu?=
 =?utf-8?B?VHhSQ1QyZktGTEtGOEduUDhXcnZWSlowdndOQlo2NFlPL0FKVVA1RHg2eHdP?=
 =?utf-8?B?cHQ2b2VRTzBZa2Z1QjRNaWRDZWJjRm5MTkw0Vkx2L3JGV3B6Q1pSbGpWV2RN?=
 =?utf-8?B?Zy9lYUs2T094NGorN05DckQ3ZHhqTUlkZkh2d2dtQ3J6d1ArZEFKTkVvRjNj?=
 =?utf-8?B?N0pKU2hQRmdyT0VZTjQ5YVZoQ1BzTmdSeEdSTGwwelBzWDZzeUo2aE40M0ha?=
 =?utf-8?B?VTVOUGFQLzNhZlg1OE9aRmpyQURXOGVIdTJQTGFtaG9YNHBNSis3eHBVUDN0?=
 =?utf-8?B?cmJBVkxaZmducnNKdjZpWWFkMXVYcmJTL01BV3hzc3lEK29FK00vZkhZQW8v?=
 =?utf-8?B?Y0JlOVJ6a0xYU3hZS1IxZG1LeGQxMGVKaDNSRkQxL3pBVjdrZ3I2V1htSzlv?=
 =?utf-8?B?LzdoaXV1TGRJQnBKcnNBbm1wbmtjYWIvTjNHWFFKcVJYeW1ZVlA1NDZsSkdw?=
 =?utf-8?B?b2hDd084aVRUU3g4L3BZdlc5ai9HTXNRVFZkNzJLTnhYbVBJTm1LNXpaV0xC?=
 =?utf-8?B?SXFmSmhxTWhsTzZqKzRIaGNuLzlITEdPL2VwdUxTWTlRUHUreHFpeDlGU09I?=
 =?utf-8?B?VTZpdzBRVmlqZWlkSnYvMkl0L0NrZ2w5RUNSV0czMEV4OW9iMEFEam16K0lS?=
 =?utf-8?Q?5XIxhZRP7fkE3T+InmbfmneikPO9NwVwP6hEg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UGY1OWxCdEJJTEpDeHFweE9TVVVKY3VRWlNJRVJkM2I0WkFlMVRHWm91dDN1?=
 =?utf-8?B?bGtoZ05vUy8ydWcya3c2ZUI3MmRxVUk1cTFVb0VoTll2VnUzZ1VvNWQ5M3dZ?=
 =?utf-8?B?K3IvMlh6SEhweFN0SkRvaDFJMGVtQVlMVHg0Wmx4M29EUWJEV1FjZHFjSEhz?=
 =?utf-8?B?NnhVQ0wybWNUOCtxNHkzTElhTjJITGsrZktOMUZIR0NxRnQ1QXlFQ21xck9O?=
 =?utf-8?B?bFZvYnhSN09ydjg0K0JiRVFSSmNZUTJWSWh5b1R2SHNteStsQnRlblVMK3ho?=
 =?utf-8?B?MVVCdjVheTJ4cXJXaXRDczRuR01JL1lMMEFNRld1aWd1OXp4ZFBGTFpxckJJ?=
 =?utf-8?B?djBlek4yeHhmdmYrOWJFUUJ0TDhFTHROU29YRnA2dExXckNVMXpHWms4Ujkz?=
 =?utf-8?B?OVpEZUlwRDBUOTNXRDZHUy8xQWZVTzN5NTdacUhiQXNUMUxhK0E3emloUHVH?=
 =?utf-8?B?T3BRckNaOHNyeWg1QUZtMW10Nk1Scit3YUZDYlFJZjYyWDV1WE5FdkQyN1NU?=
 =?utf-8?B?WHI2aGFzd1FhRTBIcXZVR250aUNPeHlITlBKa3JSazFmaHRlTjNCWnRIbElI?=
 =?utf-8?B?S1Z1L3YzNVE0NjJWUDNkODVjTHJsOGVMdW9wNzQxWDFaRFRLMEZJQlRUejha?=
 =?utf-8?B?UEFmWmdmclhHclFBS3ZvdlJhREhwd1hROGF3aEJhcUN2Q002aDNHa210eG5O?=
 =?utf-8?B?Ry9zYkp1SmNJUWFDYkE5ajFsaDMxenUvYUVaYUc1eWJOMmJTdm1ocFd6NTU2?=
 =?utf-8?B?TmNWTE92SnBqRXNuallzZWR5SlVXdmZGdmkxejNnVjRQWUFWVlVnbUd0YkFC?=
 =?utf-8?B?YWZ1dU5WM2xDZEs0cHJvOXNKRjZxdkZ2R1R1eURuRTJEemExM3ovcHkySmVn?=
 =?utf-8?B?V3JVZkUwTTBTQk51SUdPaHhsK0ZkTUhiZk9FYVYzS2h4UUNVNEJDdUxYTUFr?=
 =?utf-8?B?ZTF6d2VSUjZXV2hWRGlkU3piSUxhVDNFSmF1Y284VHdpYjQ2UG1uVmlJK00r?=
 =?utf-8?B?dWxSWGUzVk4rd3oxMmZUcUlOYTZIMWJRdlhNbDJyWERwTG9lRWFTc1NNYmt6?=
 =?utf-8?B?WmRmK1htTUJ3UjE1VTJJNVh6YzNoaVhBZk9PemNjcjRJbnhyOE4rN3pScHVi?=
 =?utf-8?B?VEpkOUgxVjRxTkN0aXpBaVE3bWU5NFZWRzljRW85S1Jvd3ZEd1FNUXJsTUZ5?=
 =?utf-8?B?M0MxZmU3Z1V2Skt2N3FlbVJaNk1DV3g4K1c3Y2xoV1JkWCszRVNublhjQkFS?=
 =?utf-8?B?VDdWOW9YbTJHTEhMT082anhmL1JjMGFaV2JVcGgxMlFDdG4wam0wSFVMWkR0?=
 =?utf-8?B?eVdoeU9pOThpeVhPN3B4Ni9iaHZDYm5ENHE1ZFhBTDJRSzlldTBQVFJmRWJS?=
 =?utf-8?B?NTJrMHZsMTFVUHJqQ1hLTm1XN2NSUVQ2VUNURTJTZHl3QUZIMXl6TEdIN3NW?=
 =?utf-8?B?enluaVlLeE52TXZ2Z2ljNUlDdUdLN3ovTEpVd1QzUGgrWWNHSzRqc3A1S0JI?=
 =?utf-8?B?ejNoekJLczdvQ3AwMjNmV1RQZnJJZmdhMTBzV2l5ZGMxeGJCYUFwakdmWVBC?=
 =?utf-8?B?TWhsd0xKYy9yQ3FIa3QrV0FEK2doekN3MjZUejFsOGxHM0JFbktXQ042c3E3?=
 =?utf-8?B?TjJyUHRWbVQrdm1QTlVjUjQxMVphSzRGUGtRZTBTb3dEVEVodzZFbXU1UzRD?=
 =?utf-8?B?cS8zMFhEdlpqeE1Sd3E4WFM4UjZUSmVwV1hXVW1ZOVk0cjFERDFvQmZsWm5v?=
 =?utf-8?B?b0VjMFdRR0pKUDQvaS91aGVZdVFuU3N0S0FrYURsRXpWdHVYRXYrTW5Gd1BF?=
 =?utf-8?B?SUZnOS91R1RMSmNuQnQ5RXlLRWhpeWVvUjB0RmVWdU1zelZnTVZGTzMvSFVG?=
 =?utf-8?B?eFVadFNQSE1BSjJhemRSZWx2Y25DSFRnYVlqZzhiSGEyKzFyT2FEdmd4SHgv?=
 =?utf-8?B?Ukx6dCt2cUNQblBYKzBtU1dub0tSdjlYNFlvTDRDRWJocm9Mb29GMWlyZ2c5?=
 =?utf-8?B?YnN0dXdsM2VFZjgzRnIzcUh4YWp4S0NyaEp5bDY3U0wxTTNIL0FQbDVNOXI2?=
 =?utf-8?B?MnVRd0hRNHgwTzJtMUg1VjBWdmcxbTFzQ01EdVh6Z1lucVdTQ3ZPbVA5VzRI?=
 =?utf-8?B?Y2hMSGJ4alplc3Y5Uy9aVFZhVXdqL080MHQrMHVOdEl3L1FoM0diRllIS01k?=
 =?utf-8?B?enc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f949d140-56b3-48a9-cab6-08dcc457db68
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2024 16:14:40.1736 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FPydfzrZeMSF2R578OYiA24WRLPmGfx5f3kp+FgOPU3hz7/p5U/gOI1WE10UNJkKpnJNzizQZ7uJrID7aSdcBNY7lf2qftycRekoG8xoxSM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9525
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

SGkgTGF1cmVudCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMYXVy
ZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+IFNlbnQ6
IEZyaWRheSwgQXVndXN0IDIzLCAyMDI0IDQ6MDAgUE0NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2
NCAwLzRdIEFkZCBzdXBwb3J0IGZvciBSWi9HMlVMIERpc3BsYXkgVW5pdA0KPiANCj4gSGkgQmlq
dSwNCj4gDQo+IE9uIEZyaSwgQXVnIDIzLCAyMDI0IGF0IDAxOjUyOjE0UE0gKzAwMDAsIEJpanUg
RGFzIHdyb3RlOg0KPiA+IE9uIEZyaWRheSwgQXVndXN0IDIzLCAyMDI0IDI6MTUgUE0sIExhdXJl
bnQgUGluY2hhcnQgd3JvdGU6DQo+ID4gPiBPbiBUaHUsIEF1ZyAyMiwgMjAyNCBhdCAwNToyMzox
M1BNICswMTAwLCBCaWp1IERhcyB3cm90ZToNCj4gPiA+ID4gVGhpcyBwYXRjaCBzZXJpZXMgYWlt
cyB0byBhZGQgc3VwcG9ydCBmb3IgUlovRzJVTCBEVS4NCj4gPiA+ID4NCj4gPiA+ID4gVGhlIExD
RCBjb250cm9sbGVyIGlzIGNvbXBvc2VkIG9mIEZyYW1lIENvbXByZXNzaW9uIFByb2Nlc3Nvcg0K
PiA+ID4gPiAoRkNQVkQpLCBWaWRlbyBTaWduYWwgUHJvY2Vzc29yIChWU1BEKSwgYW5kIERpc3Bs
YXkgVW5pdCAoRFUpLg0KPiA+ID4gPg0KPiA+ID4gPiBUaGUgb3V0cHV0IG9mIExDREMgaXMgY29u
bmVjdGVkIGRpc3BsYXkgcGFyYWxsZWwgaW50ZXJmYWNlIChEUEkpDQo+ID4gPiA+IGFuZCBzdXBw
b3J0cyBhIG1heGltdW0gcmVzb2x1dGlvbiBvZiBXWEdBIGFsb25nIHdpdGggMiBSUEZzIHRvDQo+
ID4gPiA+IHN1cHBvcnQgdGhlIGJsZW5kaW5nIG9mIHR3byBwaWN0dXJlIGxheWVycyBhbmQgcmFz
dGVyIG9wZXJhdGlvbnMNCj4gPiA+ID4gKFJPUHMpDQo+ID4gPiA+DQo+ID4gPiA+IEl0IGlzIHNp
bWlsYXIgdG8gTENEQyBJUCBvbiBSWi9HMkwgU29DcywgYnV0IGRvZXMgbm90IGhhdmUgRFNJIGlu
dGVyZmFjZS4NCj4gPiA+ID4NCj4gPiA+ID4gdjMtPnY0Og0KPiA+ID4gPiAgKiBSZXN0b3JlZCB0
aGUgcG9ydHMgcHJvcGVydHkgZm9yIFJaL0cyVUwgYW5kIGRlc2NyaWJlZCBwb3J0QDAgZm9yIHRo
ZQ0KPiA+ID4gPiAgICBEUEkgaW50ZXJmYWNlIGluIGJpbmRpbmdzIHBhdGNoLg0KPiA+ID4gPiAg
KiBSZXN0b3JlZCB0YWdzIGZyb20gR2VlcnQgYW5kIENvbm9yIGFzIHRoZSBjaGFuZ2UgaXMgdHJp
dmlhbA0KPiA+ID4gPiAgICAoUmVwbGFjZWQgcG9ydCAxLT4wIGZyb20gdjIpLg0KPiA+ID4gPiAg
KiBVc2VkICImIiBpbnN0ZWFkIG9mICI9PSIgaW4gcnpnMmxfZHVfc3RhcnRfc3RvcCgpIGZvciBz
Y2FsYWJpbGl0eS4NCj4gPiA+ID4gICogUmVzdG9yZWQgcG9ydCB2YXJpYWJsZSBpbiBzdHJ1Y3Qg
cnpnMmxfZHVfb3V0cHV0X3JvdXRpbmcNCj4gPiA+ID4gICogVXBkYXRlZCByemcybF9kdV9lbmNv
ZGVyc19pbml0KCkgdG8gaGFuZGxlIHBvcnQgYmFzZWQgb24gaGFyZHdhcmUgaW5kaWNlcy4NCj4g
PiA+ID4gICogUmVzdG9yZWQgcG9ydHMgcHJvcGVydHkgaW4gZHUgbm9kZSBhbmQgdXNlZCBwb3J0
QDAgZm9yIGNvbm5lY3RlZA0KPiA+ID4gPiAgICBEUEkgaW50ZXJmYWNlLg0KPiA+ID4gPiB2Mi0+
djM6DQo+ID4gPiA+ICAqIFNwbGl0IHBhdGNoIHNlcmllcyBiYXNlZCBvbiBzdWJzeXN0ZW0gZnJv
bSBEVSBwYXRjaCBzZXJpZXMgWzFdLg0KPiA+ID4gPiAgKiBSZXBsYWNlZCBwb3J0cy0+cG9ydCBw
cm9wZXJ0eSBmb3IgUlovRzJVTCBhcyBpdCBzdXBwb3J0cyBvbmx5IERQSQ0KPiA+ID4gPiAgICBh
bmQgcmV0YWluZWQgcG9ydHMgcHJvcGVydHkgZm9yIFJaL3tHMkwsVjJMfSBhcyBpdCBzdXBwb3J0
cyBib3RoIERTSQ0KPiA+ID4gPiAgICBhbmQgRFBJIG91dHB1dCBpbnRlcmZhY2UuDQo+ID4gPiA+
ICAqIEFkZGVkIG1pc3NpbmcgYmxhbmsgbGluZSBiZWZvcmUgZXhhbXBsZS4NCj4gPiA+ID4gICog
RHJvcHBlZCB0YWdzIGZyb20gQ29ub3IgYW5kIEdlZXJ0IGFzIHRoZXJlIGFyZSBuZXcgY2hhbmdl
cyBpbg0KPiA+ID4gPiBiaW5kaW5ncw0KPiA+ID4gPiAgKiBBdm9pZGVkIHRoZSBsaW5lIGJyZWFr
IGluIHJ6ZzJsX2R1X3N0YXJ0X3N0b3AoKSBmb3IgcnN0YXRlLg0KPiA+ID4gPiAgKiBSZXBsYWNl
ZCBwb3J0LT5kdV9vdXRwdXQgaW4gIHN0cnVjdCByemcybF9kdV9vdXRwdXRfcm91dGluZyBhbmQN
Cj4gPiA+ID4gICAgZHJvcHBlZCB1c2luZyB0aGUgcG9ydCBudW1iZXIgdG8gaW5kaWNhdGUgdGhl
IG91dHB1dCB0eXBlIGluDQo+ID4gPiA+ICAgIHJ6ZzJsX2R1X2VuY29kZXJzX2luaXQoKS4NCj4g
PiA+ID4gICogVXBkYXRlZCByemcybF9kdV9yOWEwN2cwNDN1X2luZm8gYW5kIHJ6ZzJsX2R1X3I5
YTA3ZzA0NF9pbmZvLg0KPiA+ID4gPg0KPiA+ID4gPiAgWzFdDQo+ID4gPiA+IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2FsbC8yMDI0MDcwOTEzNTE1Mi4xODUwNDItMS1iaWp1LmRhcy5qekBicA0K
PiA+ID4gPiAucmVuZXNhcy5jb20vDQo+ID4gPiA+IHYxLT52MjoNCj4gPiA+ID4gICogVXBkYXRl
ZCBjb3ZlciBsZXR0ZXIgaGVhZGVyICJEVSBJUC0+RGlzcGxheSBVbml0Ii4NCj4gPiA+ID4gICog
VXBkYXRlZCBjb21taXQgZGVzY3JpcHRpb24gcmVsYXRlZCB0byBub24gQUJJIGJyZWFrYWdlIGZv
ciBwYXRjaCMzLg0KPiA+ID4gPiAgKiBBZGRlZCBBY2sgZnJvbSBDb25vciBmb3IgYmluZGluZyBw
YXRjaGVzLg0KPiA+ID4gPg0KPiA+ID4gPiBCaWp1IERhcyAoNCk6DQo+ID4gPiA+ICAgZHQtYmlu
ZGluZ3M6IGRpc3BsYXk6IHJlbmVzYXMscnpnMmwtZHU6IERvY3VtZW50IFJaL0cyVUwgRFUgYmlu
ZGluZ3MNCj4gPiA+ID4gICBkcm06IHJlbmVzYXM6IHJ6LWR1OiBBZGQgUlovRzJVTCBEVSBTdXBw
b3J0DQo+ID4gPg0KPiA+ID4gVGhlIGZpcnN0IHR3byBwYXRjaGVzIGxvb2sgZ29vZCB0byBtZS4g
RG8geW91IGhhdmUgYWNjZXNzIHRvDQo+ID4gPiBkcm0tbWlzYywgd2lsbCB5b3UgcHVzaCB0aGVt
IHlvdXJzZWxmLCBvciBkbyB5b3UgZXhwZWN0IGEgbWFpbnRhaW5lciB0byBwaWNrIHRoZW0gdXAg
Pw0KPiA+DQo+ID4gSSBkb27igJl0IGhhdmUgYWNjZXNzIHRvIGRybS1taXNjLiBJIGV4cGVjdCBh
IG1haW50YWluZXIgdG8gcGljayBpdA0KPiA+IHVwKE1heWJlIHZpYSByY2FyLWR1IHRyZWUgb3Ig
ZHJtLW1pc2MgdHJlZSksIG9yIGVsc2UgaWYgaXQgaXMgb2ssIHdoYXQgaXMgdGhlIHByb2NlZHVy
ZSB0byBnZXQNCj4gYWNjZXNzIGZvciBkcm0tbWlzYyB0cmVlPz8NCj4gDQo+IFlvdSBjYW4gZmlu
ZCBpbnN0cnVjdGlvbnMgdG8gcmVxdWVzdCBkcm0tbWlzYyBjb21taXQgYWNjZXNzIGF0DQo+IGh0
dHBzOi8vZHJtLnBhZ2VzLmZyZWVkZXNrdG9wLm9yZy9tYWludGFpbmVyLXRvb2xzL2NvbW1pdHRl
ci9jb21taXQtYWNjZXNzLmh0bWwNCg0KVGhhbmtzIGZvciB0aGUgbGluay4gTWVhbnRpbWUsIEkg
aGF2ZSByZXF1ZXN0ZWQgZm9yIGFjY2VzcyBbMV0NClsxXSBodHRwczovL2dpdGxhYi5mcmVlZGVz
a3RvcC5vcmcvZHJtL21pc2Mva2VybmVsLy0vaXNzdWVzLzQ4DQoNCkNoZWVycywNCkJpanUNCg0K
PiANCj4gVG9taSwgdG8gYXZvaWQgZGVsYXlzLCBjb3VsZCB5b3UgcHVzaCB0aGUgZmlyc3QgdHdv
IHBhdGNoZXMgdG8gZHJtLW1pc2MgPw0KPiANCj4gPiA+ID4gICBhcm02NDogZHRzOiByZW5lc2Fz
OiByOWEwN2cwNDN1OiBBZGQgRFUgbm9kZQ0KPiA+ID4gPiAgIGFybTY0OiBkdHM6IHJlbmVzYXM6
IHI5YTA3ZzA0M3UxMS1zbWFyYzogRW5hYmxlIERVDQo+ID4gPiA+DQo+ID4gPiA+ICAuLi4vYmlu
ZGluZ3MvZGlzcGxheS9yZW5lc2FzLHJ6ZzJsLWR1LnlhbWwgICAgfCAgMzIgKysrKy0NCj4gPiA+
ID4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cwNDN1LmR0c2kgICB8ICAyNSAr
KysrDQo+ID4gPiA+ICAuLi4vYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cwNDN1MTEtc21hcmMuZHRz
ICAgfCAxMTEgKysrKysrKysrKysrKysrKysrDQo+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vcmVu
ZXNhcy9yei1kdS9yemcybF9kdV9jcnRjLmMgfCAgIDggKy0NCj4gPiA+ID4gIGRyaXZlcnMvZ3B1
L2RybS9yZW5lc2FzL3J6LWR1L3J6ZzJsX2R1X2Rydi5jICB8ICAxMSArKw0KPiA+ID4gPiAgZHJp
dmVycy9ncHUvZHJtL3JlbmVzYXMvcnotZHUvcnpnMmxfZHVfa21zLmMgIHwgICAzICstDQo+ID4g
PiA+ICA2IGZpbGVzIGNoYW5nZWQsIDE4NSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0K
PiANCj4gLS0NCj4gUmVnYXJkcywNCj4gDQo+IExhdXJlbnQgUGluY2hhcnQNCg==
