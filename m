Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC503A7E7A3
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 19:01:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F5B110E528;
	Mon,  7 Apr 2025 17:01:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="EFasts5l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010012.outbound.protection.outlook.com [52.101.228.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E12710E527
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 17:01:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HM/9C4dBBYWef7t0UTF9kFIAj7CkwHV8ishdMjBUYdusPJVQawvK0DxwGPBFGfwHcRw9BcAlvCLD05ptwTqJ8dFhlKlva+LSSkUVjbVUvOP2OurjTJElsVqTaBlCZaoFr330/IFMgVWa9uUlVDKxgr3azCJpvDkTJn6ZuN/sznbESo0AcKk5q+web6/8S5CfHKA3l/xtS3R4KmVGv890Cr3BZjXGwGWG0H7TAwFdqW5N3QyDJomzzm7h9Utvxnc6JyIim3nrk/rYPF2NqvGgxfh4pleP/+4eJbbzTTVkCqhDAJjtio3VE59EoBxugwgs47bGh8Z1qatZ5njvSaFYRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y2SobaH9j3ZiGm3AvzoLrVsD6HwSppVX1iUSKvIk+Y8=;
 b=iS3dxb+I7TQ/lw6zC6S8ieOPSvC/5idLyKXOTGdoP5RlQa3zNZi+Mb/+BnrVdVYF2Ula0nuqugqNppYRebC/ugkN+Or9aTBG43xwKGOwZ/P18d3KTTTcilEw17E8dbS8z4/r62xC5lCGkt4VmOQEGBi1MB7JzMsPM5BfwUiiLwZzJBF3kzzv2IkuxdBuJwkoASGxx3eVxfv8yVPqsoEajTM/d8yPpqU0VYDS7xOVMeuYU9vNYPG5jvWOX6Bw7oATN3DQHb6dEYgp7tbEmkGkHqGWDqLsTcRAWofDql1Jw4N3qzQRi8uD/FlUedllt2IApvEUF9qbUiG9vfex8yEP3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2SobaH9j3ZiGm3AvzoLrVsD6HwSppVX1iUSKvIk+Y8=;
 b=EFasts5laCY4Y/1uDMtbxg9erftMWapS5/LsSQzis1QKu/DvBaH8QEx1iSEhOGuhUnCO6K65+tUqm00zkeet2VJ2kfY7HfXliznBPSN6ZgNwBJCBwNEmve/XDEXrbMgKAR8Ns6YtzkP1n7GUHp8Gn4la7IVyK7efEl9dZI+pp0A=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB10545.jpnprd01.prod.outlook.com (2603:1096:400:30e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Mon, 7 Apr
 2025 17:01:37 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 17:01:37 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: laurent.pinchart <laurent.pinchart@ideasonboard.com>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Tommaso Merciai
 <tommaso.merciai.xr@bp.renesas.com>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
 <biju.das.au@gmail.com>
Subject: RE: [PATCH] drm: renesas: Add zpos, alpha and blend properties to
 RZ/G2L DU
Thread-Topic: [PATCH] drm: renesas: Add zpos, alpha and blend properties to
 RZ/G2L DU
Thread-Index: AQHbpWXLqpY6a08n6USxSsvJvEBwubOT/VqAgAR0hKA=
Date: Mon, 7 Apr 2025 17:01:37 +0000
Message-ID: <TY3PR01MB11346DEFE9EB1B23BCB09A0FD86AA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250404133047.172080-1-biju.das.jz@bp.renesas.com>
 <20250404205645.GO4845@pendragon.ideasonboard.com>
In-Reply-To: <20250404205645.GO4845@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB10545:EE_
x-ms-office365-filtering-correlation-id: 1f4f7308-fb1f-4592-1ea0-08dd75f5dbf0
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?cTJicE4zV0wwdUIzVjFKeUFjREVNWlZSVU1GUTlyRGF1ZXZJaUpwUGJPM1h0?=
 =?utf-8?B?SUkxSXQ2dXZxdktNaTN3T0haUjVzWTMyL3pEWFFidFFaTXc3Z3Yyei9oZmtz?=
 =?utf-8?B?S04yVGNmcStRbVdPVlVQRGNVaXcxa1RPV2hXdm5pNnhsNG9oYmtWK0VleXhk?=
 =?utf-8?B?ajd0ekxDTmVBcVpxSThSWFRmUGN1N1VoejhmaFhUbjN6ZldOYVJhcld1Z1Yx?=
 =?utf-8?B?Uk4yS3dUa3B3UndCYTQwVkx1cmVnenhSdi9QcHo1clMwaGE5YjVOSjJFeVJ1?=
 =?utf-8?B?enI2aWRYbVUzNXdHZnVkQXp3MTQ1SWxsblNnRlRxYmVTbVViazhFaGEzVWN6?=
 =?utf-8?B?RW9YK0dMeFJNaXk2L0U0V1prSVorMDc4Q1IwWjFUTCtaY0ZicFJoeDBkaFZy?=
 =?utf-8?B?UWNrTXg0MWZDZERiZXF5TGIzOUoyTkZXbXRySzBKMERVMXRlcEJoVlZpWFk2?=
 =?utf-8?B?ZjJIMGVmODhia0tiZHZ4UHVVdUVqODRzZGNTeDhGWjY4OWg0anlWU0IzdzhM?=
 =?utf-8?B?RG5PZzNDRXBsVlpKeHdSZENUeWNhdm0zSGZxcUxaU1dMemcxeks1MWxkUEdB?=
 =?utf-8?B?S1NHNFFQNFVDVmNpOVE5QWNNTzhnRUY2dU5FMFlzb091Nk1KUFFBNzNnZFBL?=
 =?utf-8?B?TjMvWGp6MklkQVIrRjhRZVU1VWxqeGsvVEtPWk5aMEpVcFd3RkltWFphUHUz?=
 =?utf-8?B?UmsyYVlpT2czS2FmTFgrOEZkZUR5Y0V5eG9RUzg5WEUvNjNwaVh1cDlJUXBW?=
 =?utf-8?B?MkoxaHBjZy9udUlsUkVpUU9DRGZ6c3BNRlBUaS9sQW9OTzdKU2NOdlM0d3pS?=
 =?utf-8?B?L3dNWUFHTnZFbHF6clJMdlZZZkFyTWNNSG5ScnZicWltU3NYeW9sWG0rTXZE?=
 =?utf-8?B?L2tDcXZVd0xTamlpSE10ZVNSMXdFUXEzZFZRL3h6YkhJY0Y4WGRObi9HVm1v?=
 =?utf-8?B?bjBtVStYWmY0TUVUY0dzYWNIMHBHbmRyUFIrbWhtVDdxNmVTZ3NQbzdPNE9w?=
 =?utf-8?B?OWhNa29YcE94OXhVaVVSZm5aa0hMUmZNMU80S01aUzVJZlE3SzZQUU5yMmlB?=
 =?utf-8?B?KzBqYWdYTHR1TXRMYzRQL1N0NUhXL0wxT2hYU1FoOWpMVXNVSk9lUEJsZW9C?=
 =?utf-8?B?Y2ZjSVRUdHhEKzF5cmVzcjc2VnNHd1JoNzZueXVJZmFEMk5xWkNseFVQMVhV?=
 =?utf-8?B?MWZBVkZJUVVjUTllSXJ4N2ZOU2w0ZDhhK1IwWG5CY3QrbGtJSElMbDkvV0xP?=
 =?utf-8?B?K01PNmpxWWVGUE5GQjlFYWJoTzF6RWxlZUtnV1hoOHhZUUE4dEZUSUtlZkVQ?=
 =?utf-8?B?Nm4rb3VZdUpiVkpUVXp2SnlRT0FoaVpvNnRLL1FnM1FsSjJadDM1dnJFa2hO?=
 =?utf-8?B?M0QyWGhyYW9KdzZYNU1XVWZ6Si9LU256L3FoTXNlVVBhS1oxVUdFQXV5bFJ5?=
 =?utf-8?B?dTAxc1M4cDNhdVVLZWlmZ2daN25IellERTk3a2VrcDlJQUo0MG9MRDlFb3pa?=
 =?utf-8?B?SmJkSFA2TFRIRFhUVGtWWGxyWmkwdmJWWXZpTXRHUUJPVzlUWHNCUVZreTZ6?=
 =?utf-8?B?c2dVd29mWk9yL3dWV29HT3huZDBNVWU5Zk84aHh2Wi9xbHlUcFNtR2Npa1RW?=
 =?utf-8?B?TUdQR2ZYTDJYV20zOXZMZlB2Vk9nRjhOMWJXT1FTNGhwZ3h2M2piTVpEWmRP?=
 =?utf-8?B?cTRPdTJwTGwyRnVTVGVjLzV5bEg1LzJzWTN5OWtzejcvV1FkRWxKVWFtVGdO?=
 =?utf-8?B?VmY4V3pDS1Y1NDI4Q0Q3TGlTd3RBUXRYMmsxUlV3QjM1aGJ1QXF5ZU1hTEZ1?=
 =?utf-8?B?Y3hqVkI1MlhuWmp2Uzd6SitpT2ZzVHkwL3lzTUtBN1Q1Q1Q2WVJ2a05JWGFq?=
 =?utf-8?B?RVJZSlpWZno4a1BFejVuWXFGSmo2RmZEMDl1UC80UTJHZlZFbEcvbVRYU1Bt?=
 =?utf-8?B?Z1REeWNjci9DWkladDVMRzB6ZVlCNEJVNDd1Y0dNL2Q2MWY5MkFrQ1RCQkxL?=
 =?utf-8?B?MDlLT09rLzlnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b0hZbTU3VlZ5THFMMUNnNGZMVVZ0ekNsazYrSm11TW5Md0hIWVpkb0ZqSTB0?=
 =?utf-8?B?UVQvRFlVOU5aVDROUmd5QVNVMkJkbkhud1ViUnB0bDRCdzNibVY3WlJzM1Iv?=
 =?utf-8?B?aXA3bkpncDNMUEcyY0V1elhhVldwRVYyYmNDV3VlSC9tMk5BZVJQcU84S21I?=
 =?utf-8?B?QWpnNFVHTmxDckhpU0tUSmwrbWJoZ2dHdGJDQ1B2dDVTSVE5OE5RejNmTUsv?=
 =?utf-8?B?RnI3RjRBQ3BkR3BIUXBKY0hld3RBODhtUTNLZjVDd3NUNEF0SHB2VGpmZ1dx?=
 =?utf-8?B?WWJ3WmY4VnlzWG1vMzQ0STZaOUpQak5ObXdxM2wzc1E3R2gvelY5MGE3M3E5?=
 =?utf-8?B?RlFkZTcwZDB1VkNDaDBDbmxaVWdmTXAvZ0NzZkwrRzlnQWFmUkEraGhaWlFn?=
 =?utf-8?B?N3NnMTBqMk5mZm5EUFFVeXo2MUQvdjNLOWdMdGszeVdnT0R0ZUVsS2tqeUc4?=
 =?utf-8?B?QnIxUmRBNmtUU1ZOc3pwSmFtU2VNRlZ6WExTb1p4YVcxZDJObERIRXcvekZV?=
 =?utf-8?B?ci9BUlRVTlUvWTlSWlFWblphYjNhQllpU0F3U3BwOW5CMldIVDN2L0YrbUNl?=
 =?utf-8?B?WUpUVFVsYUMzWGpHWmJJSUpGK1pyLzRvWGdjT3dhc3pEdHlWSVdJMjhaZWp4?=
 =?utf-8?B?NXMxYXV0ZXpFa05xRTJKMjVPb3l4eHlhTnVCS1pzenJKU1pvVTlJeEZuWlN3?=
 =?utf-8?B?MnVUei9SUm8rQ2k4ZWw1bGh2RG5scjNUQko4M3hTVEwrY1A4bnBMemU5U0dq?=
 =?utf-8?B?VmViRUpZK3VIR0xGN1lpU0xVMmFCcGI3V0E0czFMYi9kT3RDMEJoYWhncC93?=
 =?utf-8?B?K1VKT1VXS1ZRR1NIb1gwZ083YUFza0VSUFc0MW5LUXhhTHdvYTFrZnVUUjZl?=
 =?utf-8?B?akZRVkR1V3VuYTgwRGVsdm82RXBIU2xzNmNoaTdNcjA3OXpvdzZ3WGdjSHBO?=
 =?utf-8?B?MlJuOStaK2lMQUs5UVJ4aWRNRFlRNnVEcUhvWlE2dUovcTVzWnNBRk1neUlN?=
 =?utf-8?B?SXlIVFE0bnlWQTFoTVlKK096WndOb0FoOC9aVDdDb0phcjN4Q2Z5ZFk0U241?=
 =?utf-8?B?ZDZzSVJOa0RxOTI3eWxGRXRzcGNXWURHYlpTeEFwb05ndVRsWG9lM2JYOGpt?=
 =?utf-8?B?NFRsd1I5Z0ErUVRjdnlqeGF3aldhcS9XdjRYOXd1c2l2WEtkaGZ2VXAvMkJl?=
 =?utf-8?B?UXhNTkN2NjcxYTQzQWNMdDQrOGZTbG5IYmlISW1UOG5GOGxZOFVkUW41OTBN?=
 =?utf-8?B?OGVrY3F6TUZYbU83RVJNMEJadHdheGx4S0ZOU0ZIYTd5Z3ZyUE9MVEpBVUsr?=
 =?utf-8?B?UGtVeldQLzNNeHhPRzIveElvLzRZWHU5NWF0SVMzUk5uREhhZEd0SmdYN3dP?=
 =?utf-8?B?ejBHZmtFL2VzNlg3N0FiVjl0dTBzSGM5WGgySFF3b3owZnljTkhzek1YckND?=
 =?utf-8?B?STVpb1JJc3R5WnF6Q2swald0aFBrZ1dkbEhoSEJPUnNNdUhLbXN5ODdaYS9m?=
 =?utf-8?B?eFFCcGx6NHBQR0ZIUUhkQkdGOXZhTHJwRWRuSGhRaHJWTFc0NFhJaXRaQjJZ?=
 =?utf-8?B?NVN2azEyR0R1MHV3OTl2T0MzR0FlV1Z1Q1FybHEvYzc1YVBkT3FCK3N5ZFFW?=
 =?utf-8?B?YWVGSlM3YTVidXJZclBlMTFoY2VhY24vVExOYjFMNzNhb0FkUVgyUytvbnJL?=
 =?utf-8?B?TVc2MU0vTUEwS0VlZHh0dnBKUkJWcVZHNG5Xc0tld2pYOVh5cGRTL250b2E0?=
 =?utf-8?B?ODM2Wm1vYTN3bmpXRldURGpRUlBtbjdxVS9NVmpzUGIzY3FsVHYvM1VhRHdG?=
 =?utf-8?B?bGgzK1RrandzMTZjZGtuSGw2em44V3BZdGl6dmZheHdNQ1JkemNma3YwMCtN?=
 =?utf-8?B?ekp3bnEzZE5Kc0dIQ3BJUmVXNG1oM0xFYXNvYWdsSDBQS3ZoVnF0UXBGb1Ur?=
 =?utf-8?B?bXR2SXZIeWtZakVDV0FTWjk0TzRxZjJDQVk0U29uMmJ1Yy9TNTAzMExUUUMx?=
 =?utf-8?B?R1lPWWdQYnhZMUg2cDJRS2FlOHE0ZFc2THBHOFJyVDdDOWpMNU5MNmlXUlZz?=
 =?utf-8?B?VjFtckgvYzk0bGZ3Z0ZSTGd2dlhqNGd2VHhpcjY2LzdiLzM1QWVtSGdYdElX?=
 =?utf-8?B?U3ZydEJoemhFaGVvbTYyaEtGN1VUejg4R3NvczhSMlRnSFlJVU9yY1ZSek5u?=
 =?utf-8?B?a0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f4f7308-fb1f-4592-1ea0-08dd75f5dbf0
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2025 17:01:37.3474 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yaga/ZEeWVDweD6y+XUgfIQVIQa7hIWYvy2hBj+qZGn45wTx/rAbqipbxeffbP++bf8yjvsaKEkTfLH8FgKUtnWSX9xj2kkXQpOtdfJFcE0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB10545
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
IDA0IEFwcmlsIDIwMjUgMjE6NTcNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtOiByZW5lc2Fz
OiBBZGQgenBvcywgYWxwaGEgYW5kIGJsZW5kIHByb3BlcnRpZXMgdG8gUlovRzJMIERVDQo+IA0K
PiBIaSBCaWp1LA0KPiANCj4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guDQo+IA0KPiBPbiBGcmks
IEFwciAwNCwgMjAyNSBhdCAwMjozMDo0NVBNICswMTAwLCBCaWp1IERhcyB3cm90ZToNCj4gPiBB
ZGQgc3VwcG9ydCBmb3IgenBvcywgYWxwaGEgYW5kIGJsZW5kIHByb3BlcnRpZXMgdG8gUlovRzJM
IERVIGRyaXZlcg0KPiA+IGFzIHRoZSBJUCBzdXBwb3J0cyBhbGwgdGhlc2UgcHJvcGVydGllcy4N
Cj4gPg0KPiA+IEl0IGlzIHRlc3RlZCBieSB0aGUgYmVsb3cgbW9kZXRlc3QgY29tbWFuZHM6DQo+
ID4NCj4gPiBtb2RldGVzdCAtTSByemcybC1kdSAtcyA0NEA0MjoxOTIweDEwODBAQVIyNCAtZCAt
UCBcDQo+ID4gMzdANDI6NTEyeDMwMCsyMDArMjAwQFhSMTUNCj4gPg0KPiA+IG1vZGV0ZXN0IC1N
IHJ6ZzJsLWR1IC13IHszMiwzN306YWxwaGE6ezAsNjU1MzV9IG1vZGV0ZXN0IC1NIHJ6ZzJsLWR1
DQo+ID4gLXcgezMyLDM3fTp6cG9zOnswLDF9DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1
IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMv
Z3B1L2RybS9yZW5lc2FzL3J6LWR1L3J6ZzJsX2R1X3ZzcC5jIHwgOSArKysrKysrKysNCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9yZW5lc2FzL3J6LWR1L3J6ZzJsX2R1X3ZzcC5jDQo+ID4gYi9kcml2ZXJz
L2dwdS9kcm0vcmVuZXNhcy9yei1kdS9yemcybF9kdV92c3AuYw0KPiA+IGluZGV4IDg2NDNmZjJl
ZWM0Ni4uMDQwZDRlNGFmZjAwIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yZW5l
c2FzL3J6LWR1L3J6ZzJsX2R1X3ZzcC5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JlbmVz
YXMvcnotZHUvcnpnMmxfZHVfdnNwLmMNCj4gPiBAQCAtMzQwLDYgKzM0MCwxNSBAQCBpbnQgcnpn
MmxfZHVfdnNwX2luaXQoc3RydWN0IHJ6ZzJsX2R1X3ZzcCAqdnNwLA0KPiA+IHN0cnVjdCBkZXZp
Y2Vfbm9kZSAqbnAsDQo+ID4NCj4gPiAgCQlkcm1fcGxhbmVfaGVscGVyX2FkZCgmcGxhbmUtPnBs
YW5lLA0KPiA+ICAJCQkJICAgICAmcnpnMmxfZHVfdnNwX3BsYW5lX2hlbHBlcl9mdW5jcyk7DQo+
ID4gKw0KPiA+ICsJCWRybV9wbGFuZV9jcmVhdGVfYWxwaGFfcHJvcGVydHkoJnBsYW5lLT5wbGFu
ZSk7DQo+ID4gKwkJZHJtX3BsYW5lX2NyZWF0ZV96cG9zX3Byb3BlcnR5KCZwbGFuZS0+cGxhbmUs
IGksIDAsDQo+ID4gKwkJCQkJICAgICAgIG51bV9wbGFuZXMgLSAxKTsNCj4gPiArDQo+ID4gKwkJ
ZHJtX3BsYW5lX2NyZWF0ZV9ibGVuZF9tb2RlX3Byb3BlcnR5KCZwbGFuZS0+cGxhbmUsDQo+ID4g
KwkJCQkJQklUKERSTV9NT0RFX0JMRU5EX1BJWEVMX05PTkUpIHwNCj4gPiArCQkJCQlCSVQoRFJN
X01PREVfQkxFTkRfUFJFTVVMVEkpIHwNCj4gPiArCQkJCQlCSVQoRFJNX01PREVfQkxFTkRfQ09W
RVJBR0UpKTsNCj4gDQo+IEl0J3MgaW50ZXJlc3RpbmcgdGhhdCB0aGUgZHJpdmVyIGFscmVhZHkg
aGFuZGxlcyB0aGUgYWxwaGEsIHpwb3MgYW5kIGJsZW5kIG1vZGUgcHJvcGVydGllcyBzZXQgaW4g
dGhlDQo+IHN0YXRlLCBidXQgZG9lc24ndCBleHBvc2UgdGhvc2UgcHJvcGVydGllcyB0byB1c2Vy
c3BhY2UuDQoNClllcywgc29tZWhvdyBtaXNzZWQgYWRkaW5nIGFscGhhLCB6cG9zIGFuZCBibGVu
ZCBwcm9wZXJ0eS4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+IA0KPiBSZXZpZXdlZC1ieTogTGF1cmVu
dCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydCtyZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+DQo+
IA0KPiA+ICAJfQ0KPiA+DQo+ID4gIAlyZXR1cm4gMDsNCj4gDQo+IC0tDQo+IFJlZ2FyZHMsDQo+
IA0KPiBMYXVyZW50IFBpbmNoYXJ0DQo=
