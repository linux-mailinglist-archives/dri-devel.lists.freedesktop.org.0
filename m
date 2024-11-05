Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F4D9BD1F3
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 17:14:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C951688EBA;
	Tue,  5 Nov 2024 16:14:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="DnJsMLZ/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010050.outbound.protection.outlook.com [52.101.228.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29D9E88EBA
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 16:14:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sWwdI93EXWcxOUHDY2LR/YidO2z1JRfIBRCZiv/mTDGweiLMXRC3Tjpvfb//YDOkA/Ek95AFJoAbjJlV8a+SVBu5Xxx7EqoH1mOHBKfsvoURUTeQw9xZ3jGXKC58HJUIIKgBNxuuJzioRiMgClStLS5b2MDiEL4N3yNqHnGZVbSKSWWNGbdnf/YBEBWhsmPqTJ1XmE4bvjF9twgihygCP+nf6vu5mQFmuGzD8X5FTjXZcAH1CchiTu35kTy5QBQmE04AeZLanlPpaxpcj0E4C4WU62i7DVHsJXdmbOuk9Z+iUzuGJKxcg534eBjuRQ66rPV4T5UoQ9LS/lDtHxjGJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KF9bChmDHRGP9IiovvSIFxL18jzDhR2A9C3yqOwVWrk=;
 b=m5W4Ev7yBIucNGbExMXSXS2y9acOruXjCqAKlZDIqx66j6zOOR1gFy6BHxGkGV4eEICZELE/W6UHE3TRgVfGNxl1o1p19DDsQCotCvduE4NO8aZ0xyxE0+ReZoaMrDQXfzwd6gKWJbZ9lNbs4CzukS0KHi0ZMN3zvIZe+I32cIXc1ay8/M95z9MTtKGnJl8s/1YR3C7OkIlYeyrzacJAcluU60P3UHEk8osQSkyPZEI0tQkPWtdDnhvDTS0pAGKoPguJhVm2nf3CJY4xVZHf0WKh6Cjy9hVEqZ09XFta2siD+iG2EtdwepU7LD9lvTd6ZnKIhmPcBIToCMWiJz1jog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KF9bChmDHRGP9IiovvSIFxL18jzDhR2A9C3yqOwVWrk=;
 b=DnJsMLZ/VG2Xb6Dyo/J+PLBeQu3oHReZsFJwTy06v42EEL+xC2qEhhCjOYt/lAkZ8BOwfWP55TGt3lBYUq5Pa7512tf7xxyIUiNL3WrvGtf62gyHP49vTsWdKZnKThuJrlFnGX0WYLED3eVJiulLsdvZuuPI78JpTI0Eo+sU5fQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB13796.jpnprd01.prod.outlook.com (2603:1096:604:36a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 16:14:09 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8114.031; Tue, 5 Nov 2024
 16:14:09 +0000
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
 <linux-renesas-soc@vger.kernel.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: RE: [PATCH v2 1/2] drm: adv7511: Fix use-after-free in
 adv7533_attach_dsi()
Thread-Topic: [PATCH v2 1/2] drm: adv7511: Fix use-after-free in
 adv7533_attach_dsi()
Thread-Index: AQHbL3Okpra/DKjljEOs2/tbkAegdLKo2RYAgAAAzdA=
Date: Tue, 5 Nov 2024 16:14:09 +0000
Message-ID: <TY3PR01MB113464515EEF0DCFF3B96D15186522@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241105111228.112813-1-biju.das.jz@bp.renesas.com>
 <20241105111228.112813-2-biju.das.jz@bp.renesas.com>
 <20241105160138.GB6317@pendragon.ideasonboard.com>
In-Reply-To: <20241105160138.GB6317@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB13796:EE_
x-ms-office365-filtering-correlation-id: cb53cb34-198c-48bc-c4d6-08dcfdb4e121
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?bStRakgwa0VKU1puMXZaRWFrSHFTRGV2QnFHYjdsWEZDakZDQWFFcVdOQ3Yz?=
 =?utf-8?B?Rk50OHFUNWlNY0JmZUJXdnJ5NkVqdEFtRHpMVkwrUU1UM080WCsrc0RRYlBo?=
 =?utf-8?B?ekRMa1BpOGM1eWFOQW8zbmN4a3U3R1RuM3lvSGQ0ZjJDS0tUNllTZTNaZEhN?=
 =?utf-8?B?VCtENUN2SzJ1dnZKeWY0VVpkSUUrenI4K25Bei9yOFNGdjZmc25kamxqRzU0?=
 =?utf-8?B?OWRvUzA1SXViNzRPZ3Qzc0Rtck9DeW1TVzNxZzFSc3BucE5uUVIwUWx6S2l4?=
 =?utf-8?B?dW1xeGpON2tCYmJLYmZ6V3pJYkx3YmNDYTZCRTY4amFNYUNpWmhldUpSNVpy?=
 =?utf-8?B?QlQ1VjdzanBhZVV2RWVEcHU2UEFaSHhQelYwcWhDWjZ1cE9CUk9KdEFzbTdE?=
 =?utf-8?B?anZqdXh1dDdKY05zZGRoVmEyZkphZStnVUZGTi91VFFsR1Q3bENFS09QTEVB?=
 =?utf-8?B?QjB2N2xraVZxMUZmRmc4L0FWZWw1YkNLR0ZuUjlhd1hwUHNlRFljVTgwMWN6?=
 =?utf-8?B?VUJucDFJTCtUVm5YTXYxUnRHMjRMemhkVTcvK0tBS1hrMVRvRDhKbnEzbEZm?=
 =?utf-8?B?TWdKRU1CaFUrc2l6Zmt3N0loRWRmV1J5NWhMVk0zK3dzTG91d1JzeHg3U1Nk?=
 =?utf-8?B?VXA0OUN5RUNZdUVoZGlySTBVUVNnVGdOTU9LTFZWZ3c3Vmt6QWFQTHluNFVE?=
 =?utf-8?B?Y0hPV2xhTCtmZ0pITW8va0w3d1ErRDFpcWpOdGpGQW04TnJPM2cvQlVQUkk4?=
 =?utf-8?B?Z1J3d01vV1pLS1A2Y0J1MU1EMmdLYTFXM2RNVy9JK2o5RlAvZFQ2bXh0cCtn?=
 =?utf-8?B?ODVCWXdmV1pORGYvMzZHcENvYmZ2L2tOMHlVV1p2c2p3cXFoSDFWeWlObHN6?=
 =?utf-8?B?TjI1M0VSY0E0WCt4MDNpZmxDT3hZdGRiSXNxeDNyVFJvREYrdDdXMWJORjE1?=
 =?utf-8?B?TG8yc2liT3k3aTJHSCtwUkQrbThSYlc3QklkSzRySEF4VXFiK05jVjh1VFRz?=
 =?utf-8?B?VnNuUUtiaitEcE5lUkp1MEg5dlU2WmxRNUNKdTg5V2Y1cFV2My8xOE1ZRTF5?=
 =?utf-8?B?UExoWjJ1dUNlSHUrbCt6TW5PeTlLSEFzeDU3L0krWENxV0JUQ3lKWHhIK3hZ?=
 =?utf-8?B?SHBOYkhzNXJxRnlUS1ZwNzRlby8rU3pzdEVVeWJVNU93TGIrRWJzZld0SzBq?=
 =?utf-8?B?SU5FYjI1UHZscEw3Z0RQektaT09KMHpLOS9oRzNYWjhpNE85em9ScGFiTWVX?=
 =?utf-8?B?UDdnZ0RwTEZEdURRN1RxakYwU21HTDZqQTk1bjhmZUZBajNqNnRTL3UxVWc4?=
 =?utf-8?B?eGhncnFYbCtPaGFmUk9PM1Q1RHZLQTU2M1l3UEM1RXhrU1hGdWNVZXBLdkJU?=
 =?utf-8?B?NVZGSU9RSHhrTExQYkJPR1EyMUdpaDl1MFI1STNMcmJFeEIwVExleVh4dGxG?=
 =?utf-8?B?dnpaMUpGZXd4Z0hMV3RMQTNoWkVweDR6K3E2QnhxdXdsaEExMVozMnB3Q04v?=
 =?utf-8?B?UTFlYzRkTjBTMmtSR3J4eXN1TmFjRllPcEVZOWszUHVFak1VYWpQd3J4L0VX?=
 =?utf-8?B?SFE0Smc0KzJ5RzJZVGtWVTFDUUhRS3N6Q0s4MVRHdFFCaDJnQ25lYURsbXZu?=
 =?utf-8?B?VVhyeC9vWExVUDN6dnhYR05yQjUvUmtwMVFlL1ZZNHR5Qmt5QnJUTnR3TXht?=
 =?utf-8?B?a3Zqek51QXNOcFZ6U096NGRqNVgreTc0Q21KYW5HWkxuWU0xemRNNTR3YmVw?=
 =?utf-8?Q?Gz0kd6tSNPKfF+fS30S7Dg+qYbPNR8/gv8lNuBB?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TUxrQjBVWFlieVlYYlkzTklJdUhib2lmOVI3RlhvSWhyM1JVQVRCQ0Q2YThB?=
 =?utf-8?B?YlZxUFo1K3NVNUFpK2JQYmVIV0UvZWhwdE11Y2hMYnlqR2pOZXBibGRqVVFl?=
 =?utf-8?B?TEk2WkQzMFZTMVljZGJOSkt6RkpSbjFCVXZWR1JMRXdEdHRUNEFueGRucXBq?=
 =?utf-8?B?QXFheUFGUmw3aHJvT1ZFQk90WElJWlNFZWJnZkNaRjZYK1ZycEUzc3lLUGNX?=
 =?utf-8?B?clZUOTZ1VDhpNi9DVTdiU3pnMk5TU041cjZ0WGJLNlRVSXhxQWZWY3FPNXVm?=
 =?utf-8?B?VXowV1NmRC9IRkM4STBWNTdOYklLcVJkWkYvSnJwVjAyNFlUSWVJaEwwdlJh?=
 =?utf-8?B?RWl4ajU4S0x5cXFNY0tOcVI2MlN2UmM3andtTFJyUWZZeVNxcnZ4bEtDZjR0?=
 =?utf-8?B?NTEvZ1NQcGpDUGRzcUtnendKZk9KM204YmZrK1laak0wa2FNZjc0Qlp2WXVY?=
 =?utf-8?B?ZEc5Z0RLWEsxbzd3RDJJUndwWkFzMFlXNkZ5N2RZaEhULzNuTTlURDFXTExH?=
 =?utf-8?B?NHBscEp5bXcyVkN3TVFUME1LNHpCUHh1ODR6MnF6bDlMaU90My85bVBjZlVO?=
 =?utf-8?B?amRNcU02eHBpYUNDaVE4Sm9XaDJtcG1FR0RzcVVnNExOTW1McjRjNEd0aDhu?=
 =?utf-8?B?YVQ5VUZCT21iQ0VVZUVyKzlFbC9hQzgwUkdrdmNVZTZmWGJMWUJuMW5JNFBC?=
 =?utf-8?B?M0kvZU9UT0pSejRUdlJkaVhUb1RZSVdqUjJuQ3FNc3J1UE9EWVQxSE8xMVdy?=
 =?utf-8?B?WHZDcUNCT0x6bUZrTzQwdDZCZDZCTkdUUVFDK3dPeGhhMVArRHVNRmNGZE5m?=
 =?utf-8?B?QmtoTjVVZEplTkpzOUt0K2NkZ3ZRY3g0UmNUMTZXN2JEdE50dFRmUGlkdHEz?=
 =?utf-8?B?OU9xUFRZUEZkblF6N3k5Nmo4MytlalFEcngrQVRWRXAzOHNVcTFmTEtnVFU1?=
 =?utf-8?B?MHFDejdsZ29GdTdoSG8zUDN5UnRxNGVTa1ZQWmNkbEtITDNUcGVnZTVKTm5l?=
 =?utf-8?B?T2s5bUFxb28xeHVBV1dwbDdDMjNHYlhIUlEzTjlRdlJMMStWdVg0ZlVuK2k4?=
 =?utf-8?B?a3lWT1g0d0Y0OExsRnhKeWg1ekE2MHdGQjVrVWZzVXc4L2NsRTZMdWZneUpX?=
 =?utf-8?B?U0p5MWZjRTFHZk1LUmp3MjBtdHhjR2ZLMndjcGczUkoxYk1RYnE5dTZ0Nk41?=
 =?utf-8?B?MFVZUGJyWWdFWVZFejZvRkhoTTVEbkhqZ3NqTEZUem1KaUZCRGNFdEFCU2ZF?=
 =?utf-8?B?R2p1TTRwQjl1ajk1bkk3L1FXSGRMODBUSFVTSkp6RVdvVnFBaWxxdkZkQ01W?=
 =?utf-8?B?cnZtOVVDYUgrUmpVRHZPdDR5dzdMMEhwTHBQSDJLOE4yc3VYNytNZ3dOUW5V?=
 =?utf-8?B?b09QNmZTOUVoVWRZNUdFdWJ1YlpBTlpZRUtMN1lPZkRBbEZuUVRZNGR3c1VU?=
 =?utf-8?B?N3FVRjRMMndNVUxmUTN5bForTGVsOTh3aGx0UEpYb1VRQ0sxRndMWVNNdFBp?=
 =?utf-8?B?UDdYZ3dYN1RtS3B0YjlYU0lubzFJbFZJcTY0dEVmR1dNWXcydjRxeHRXU1U5?=
 =?utf-8?B?dW1NNTJFdlBHaGJOTUNwME81bnlGMXpKc2hBQ0IxVWFhWDNLM211OW1OMXBj?=
 =?utf-8?B?TzNYM3Qyd3lOZk1zTlYyc0x2QWNUWXhMazVsLzJLeFVCVmVXUGNBbHdjQ2gv?=
 =?utf-8?B?cUE0dkM3ZVBDRHl0amhQUEdLc0JUVld3ZVNCeDRpUGNSbmZVMEFoUnFpUUdw?=
 =?utf-8?B?TldScytNY0FmZGFrblFzdzNhQWVKQUZZZ1hsYjRoS3FDc3NwWW90Zy82VlhE?=
 =?utf-8?B?Z0VNT05VT2RkT3JTTTl1dHIvak92UVFEVEhDWkFmNXZVY0V5U00zYm04T2tT?=
 =?utf-8?B?clJSSXBJbGVDM2tUZVMzTEVEazFad0p0WlYxdjZEY2JDcGZGYUxwSDJ3a1pU?=
 =?utf-8?B?b3M1dVgxdndEOERtMmlVckh0UmtOMHljblZYdENkZElocjRQdVp3cXhOb2s4?=
 =?utf-8?B?MS9uSTYrQVVtZkZLTUo5Ymczc0JCOWdEOXhzUDFWQitvdXhqeUYyN1NlaS9i?=
 =?utf-8?B?Q1lKcEF3T2Z0alBSRU5QR2I4dlRmVlVNOW9TUmhETHRTWWhWeFVqSzdrc3Zi?=
 =?utf-8?B?ZkhTMjBNWk44SVJzUEFvcEUzOEhnWm95Q1cvNng5S3puSG5PZ0c1LzBCVXRJ?=
 =?utf-8?B?Smc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb53cb34-198c-48bc-c4d6-08dcfdb4e121
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2024 16:14:09.2460 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tz1bvFIkqlda3XwJW1stQWkWHGaITSjGo7vzib21iSypBRddL+H/tsxgRz/T2ba56Mo6DSB1UgCMjVdLn4mD98g0C0xlGCVXQka4MN+/Wgs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB13796
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
dEBpZGVhc29uYm9hcmQuY29tPg0KPiBTZW50OiAwNSBOb3ZlbWJlciAyMDI0IDE2OjAyDQo+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMS8yXSBkcm06IGFkdjc1MTE6IEZpeCB1c2UtYWZ0ZXItZnJl
ZSBpbiBhZHY3NTMzX2F0dGFjaF9kc2koKQ0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IFRoYW5rIHlv
dSBmb3IgdGhlIHBhdGNoLg0KPiANCj4gT24gVHVlLCBOb3YgMDUsIDIwMjQgYXQgMTE6MTI6MThB
TSArMDAwMCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gVGhlIGhvc3Rfbm9kZSBwb2ludGVyIGFzc2ln
bmVkIGFuZCBmcmVlZCBpbiBhZHY3NTMzX3BhcnNlX2R0KCkgYW5kDQo+ID4gbGF0ZXIgYWR2NzUz
M19hdHRhY2hfZHNpKCkgdXNlcyB0aGUgc2FtZS4gRml4IHRoaXMgaXNzdWUgYnkgZnJlZWluZw0K
PiA+IHRoZSBob3N0X25vZGUgaW4gYWR2NzUzM19hdHRhY2hfZHNpKCkgaW5zdGVhZCBvZiBhZHY3
NTMzX3BhcnNlX2R0KCkuDQo+ID4NCj4gPiBGaXhlczogMWU0ZDU4Y2Q3Zjg4ICgiZHJtL2JyaWRn
ZTogYWR2NzUzMzogQ3JlYXRlIGEgTUlQSSBEU0kgZGV2aWNlIikNCj4gPiBDYzogc3RhYmxlQHZn
ZXIua2VybmVsLm9yZw0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBi
cC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiBDaGFuZ2VzIGluIHYyOg0KPiA+ICAtIEFkZGVk
IHRoZSB0YWcgIkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnIiBpbiB0aGUgc2lnbi1vZmYgYXJl
YS4NCj4gPiAgLSBEcm9wcGVkIEFyY2hpdCBUYW5lamEgaW52YWxpZCBNYWlsIGFkZHJlc3MNCj4g
PiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MzMuYyB8IDMg
Ky0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkN
Cj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2
NzUzMy5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUzMy5jDQo+
ID4gaW5kZXggNDQ4MTQ4OWFhZjVlLi4zZTU3YmE4MzhlNWUgMTAwNjQ0DQo+ID4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MzMuYw0KPiA+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTMzLmMNCj4gPiBAQCAtMTMzLDYgKzEzMyw3IEBA
IGludCBhZHY3NTMzX3BhdGNoX2NlY19yZWdpc3RlcnMoc3RydWN0IGFkdjc1MTENCj4gPiAqYWR2
KQ0KPiA+DQo+ID4gIGludCBhZHY3NTMzX2F0dGFjaF9kc2koc3RydWN0IGFkdjc1MTEgKmFkdikg
IHsNCj4gPiArCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAgX19mcmVlKGRldmljZV9ub2RlKSA9IGFk
di0+aG9zdF9ub2RlOw0KPiANCj4gVGhpcyByYWlzZXMgc28gbWFueSByZWQgZmxhZ3MuIFRoZSBm
dW5jdGlvbiB3aWxsIGZyZWUgdGhlIG5vZGUgd2hpbGUgdGhlDQo+IGFkdi0+aG9zdF9ub2RlIHZh
cmlhYmxlIHN0aWxsIHBvaW50cyB0byBpdCwgb3BlbmluZyB0aGUgZG9vciB0bw0KDQpJIGFncmVl
LCBhZHYtPmhvc3Rfbm9kZSBzdGlsbCBwb2ludHMgdG8gaXQgYW5kIG9wZW4gYWdhaW4gdGhlIGRv
b3IgdG8gdXNlLWFmdGVyLWZyZWUuDQoNCj4gdXNlLWFmdGVyLWZyZWUuIEZ1cnRoZXJtb3JlLCB0
aGVyZSdzIG5vdGhpbmcgaW4gdGhlIGZ1bmN0aW9uIG5hbWUgdGhhdCBoaW50cyBpdCB3aWxsIGRv
IHRoaXMsIGNhbGxlcnMNCj4gY2FuIGdldCBzdXJwcmlzZWQgYnkgdGhpcyBiZWhhdmlvdXIuDQoN
CkJ5IGxvb2tpbmcgYXQgWzFdLCBpdCBjYW4gZnJlZSB0aGUgbm9kZSBwb2ludGVyIHdoZW4gaXQg
cmV0dXJucyBmcm9tIHRoZSBmdW5jdGlvbi4gQXMgeW91DQpzYWlkIHRoZXJlIGlzIG5vIGhpbnRz
IGZyb20gZnVuY3Rpb24gbmFtZS4gX19mcmVlKGRldmljZV9ub2RlKSBqdXN0IHRlbGxzIHRvIGZy
ZWUgdGhlIA0KcmFuZG9tIGRldmljZSBub2RlIGFzc2lnbmVkIHRvIHRoZSBsb2NhbCB2YXJpYWJs
ZS4NCg0KWzFdDQpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni4xMi1yYzUvc291
cmNlL2luY2x1ZGUvbGludXgvb2YuaCNMMTM4DQoNCg0KPiANCj4gSSdtIHN1cmUgeW91IGNhbiBk
byBiZXR0ZXIgdGhhbiB0aGlzIGFuZCBmaXggdGhlIHByb2JsZW0gd2l0aCByZWFkYWJsZSBjb2Rl
LCBub3QgY3J5cHRpYyBhbmQgZXJyb3ItDQo+IHByb25lIGNvbnN0cnVjdHMgOi0pDQoNCkFncmVl
ZC4gV2lsbCBmaXggdGhlIHByb2JsZW0gd2l0aCByZWFkYWJsZSBjb2RlLg0KDQpDaGVlcnMsDQpC
aWp1DQoNCj4gDQo+ID4gIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmYWR2LT5pMmNfbWFpbi0+ZGV2
Ow0KPiA+ICAJc3RydWN0IG1pcGlfZHNpX2hvc3QgKmhvc3Q7DQo+ID4gIAlzdHJ1Y3QgbWlwaV9k
c2lfZGV2aWNlICpkc2k7DQo+ID4gQEAgLTE4MSw4ICsxODIsNiBAQCBpbnQgYWR2NzUzM19wYXJz
ZV9kdChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLCBzdHJ1Y3QgYWR2NzUxMSAqYWR2KQ0KPiA+ICAJ
aWYgKCFhZHYtPmhvc3Rfbm9kZSkNCj4gPiAgCQlyZXR1cm4gLUVOT0RFVjsNCj4gPg0KPiA+IC0J
b2Zfbm9kZV9wdXQoYWR2LT5ob3N0X25vZGUpOw0KPiA+IC0NCj4gPiAgCWFkdi0+dXNlX3RpbWlu
Z19nZW4gPSAhb2ZfcHJvcGVydHlfcmVhZF9ib29sKG5wLA0KPiA+ICAJCQkJCQkiYWRpLGRpc2Fi
bGUtdGltaW5nLWdlbmVyYXRvciIpOw0KPiA+DQo+IA0KPiAtLQ0KPiBSZWdhcmRzLA0KPiANCj4g
TGF1cmVudCBQaW5jaGFydA0K
