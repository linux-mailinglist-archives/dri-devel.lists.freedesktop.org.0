Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 292D37A9295
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 10:30:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 214C210E586;
	Thu, 21 Sep 2023 08:30:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84DAE10E586
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 08:30:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W8sV4zc4oECLmdchUkP5YHvC3/SbZjdFwwqz+EsjDanuVhYa4PSUon6suy2evvaswbjvVnR3K7u59gdAK6MP64hoZkkwOFFiUBfOnEBU8uaOLQwyOkkvPLxnWkG/88KU6KoWGYQ35vIJwvBmBg+VemkuvsSyHpMkp1zKtbSEKdzNPqQVf7W2Ln2/r4aNosWFrFmmzzl8Yxd540jZ7aKLuLa/s6UM3DAnvtcgJe4qFAkuze4WniCyfFSFnVw8ww5o48DE48xo78xf8dZ3F7YtjZIqs4nRciTG3V1KMqMEjcV4ILvRrd5qyHUFW6ShflHozQwP2KAa2jeBRI8h0XAvGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XzZ9ceIB8zPGjI2Cp0qgLEa3YFZawuO1R+cb5bnPsrM=;
 b=XYGSf4YENzOOPO5kYvWt7hirHtisfzSTx5qDZTnY67i8DpYFu7O0UgEH2jIxOugqThsJvcqka5OYvRSBBiLI0GLqCnkS0DJHc7tIIAKR7s5NHAFDBSaeM3qLDZJGw/t7Ze55OUVl1Rcw75fdnSJihVMlB9lUh0FKYpnmm6b1SMtIJcvKWNTvi/kVEKWoLI2ukL9gM9LtohWxahIsA0UeUiyaxW0mCpPInN82kSGrawQOYOZ3uPG0AYMVQ3FvRslbrrJXNABe/6BFNDZUgTGNeCtb0z95w+yjUqDr0+c5rrKKdi7mgfyZlwufgDCbXDpJ/KpNidtp7WrO5PlwWOlj6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XzZ9ceIB8zPGjI2Cp0qgLEa3YFZawuO1R+cb5bnPsrM=;
 b=JaORlwXj1J1X9vFy3Exmcp58dy3figSEvNuNNeVYx1K2ltefNCMp8iMolxgji7ISoXlwCQYDl0BM8eLbFjSp53wkTnA7nQi+Qg6JhALgPt3IwCsjYF8Z6Bzqht2zfZYWnb3dJZoJJn0keFPN+okZMzdpYmzXgmEhRXnIK2HHitY=
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8295.eurprd04.prod.outlook.com (2603:10a6:20b:3b0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Thu, 21 Sep
 2023 08:30:04 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::1ace:f566:c57a:7d4b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::1ace:f566:c57a:7d4b%3]) with mapi id 15.20.6813.017; Thu, 21 Sep 2023
 08:30:04 +0000
From: Ying Liu <victor.liu@nxp.com>
To: Lucas Stach <l.stach@pengutronix.de>, Marek Vasut <marex@denx.de>
Subject: RE: [PATCH 5/5] drm: lcdif: force modeset when FB format changes
Thread-Topic: [PATCH 5/5] drm: lcdif: force modeset when FB format changes
Thread-Index: AQHZ662eWr7cl3xpJE+lZ5+GA2ueirAk4xpggAAIkwCAAAdo8A==
Date: Thu, 21 Sep 2023 08:30:04 +0000
Message-ID: <AM7PR04MB7046F51DFA9D30E4A1C57A4298F8A@AM7PR04MB7046.eurprd04.prod.outlook.com>
References: <20230920103126.2759601-1-l.stach@pengutronix.de>
 <20230920103126.2759601-6-l.stach@pengutronix.de>
 <AM7PR04MB7046B544BFB1BAEE2335E7FF98F8A@AM7PR04MB7046.eurprd04.prod.outlook.com>
 <7ea313d77869183975246cdaf6352713ff4253c0.camel@pengutronix.de>
In-Reply-To: <7ea313d77869183975246cdaf6352713ff4253c0.camel@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR04MB7046:EE_|AS8PR04MB8295:EE_
x-ms-office365-filtering-correlation-id: 6d2afce2-c9c5-443c-d4ad-08dbba7cf45d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IBYt4Mjj+opaCBqOlKsoCpJIDVeevxqZ48760AXMdMkGGKIcCvIDTxKRzpLE6+XKjFxV6ZlMPX3TSxtm9MHZyHA/y8ZZtC0JUoJDNyCXlPeWDoGkA9D2D5oxeLPmPOJ9uWBKQXHCNvjhOTdoGpJsTxtVdx2ufeVVNR2liF4wAGWl/ifwwqF9vzzbiHZkLtnig2OA1fdmcYknRHfcEarJ145voEfglYekrfuK+olb4pP0yvAaXMfiNJh680WzTWrMn9QDB0yeCMYA56lv0MearhwtzGKTLElllb9q5FJ62hg84glYk88ckGGjvqgnKu49Y+6QwlI44iO1oXQZKEautpCw6iyMhMoQfFwRPYRbtRrp6doAD4SpPa4GqwHyzD5ht53jpSUuYehg/NKdNbAOAWMT9lGuXafF5+qQFQLasz53iSitoaoaOlaxeKInbX+f57CO84YRY5q40aPYlAa6ZFH9BH5OUbOcGZbQVz9uh3N7yP/xMWckpmtwfMYImKesb+abJpISGrIW1Po6/ku7BGwEl8qztS+dEVrjPCi6V34ufi4Cxq4zUe53/wN9k6DUJDWItN5q2pISbYS1YNO+YFymVLq6zUa4uncl8eNp1MozEryjtLaHs4Bkskaq0bgc
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(346002)(366004)(396003)(39860400002)(451199024)(186009)(1800799009)(83380400001)(6506007)(7696005)(53546011)(9686003)(5660300002)(4326008)(52536014)(2906002)(316002)(64756008)(54906003)(8676002)(33656002)(41300700001)(8936002)(71200400001)(478600001)(38070700005)(55016003)(38100700002)(122000001)(86362001)(66946007)(76116006)(110136005)(26005)(66556008)(66446008)(66476007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Nm9HWS9YZnljOHNUOVZaRzFYdlZlZklrdWg2OFpVWjJjaUJoM29vbGUrZnRn?=
 =?utf-8?B?V29uZXBaYzlEbGZkWitHU2d3aWJBdW4wcm14RDZXMmFLUmUzb1AyRDRlMEZ1?=
 =?utf-8?B?N1lVQWR0bnBucGdYRDh1blFyYzYraHZQbytoS21VaDQ5V3dpN2VrekpkVm9i?=
 =?utf-8?B?MDRVcXFoQUNtOWUwYjJST1RIRmt1Q0JtWnNydStRUzJWeHpRc08wUm5wbW1l?=
 =?utf-8?B?Y2VGaGwybGMyRklVTjlFSGgwK3lzbmt5MlV1cFI2SHM5YVIyZ1ZZSTRDWThJ?=
 =?utf-8?B?Z09LblR1YW9FSThSdzQ5UjRCbks4aHQwVFpMbVAyT0xXS28xZmJQbmFBYm5Z?=
 =?utf-8?B?K0t4QktJY1dhUjA1dHowZGZlYnRmUEVJNkF0NUUwMUhqRmpQanZjRmQvWk5B?=
 =?utf-8?B?eG0wOW9MQUxGZGtUM0JPTXFnOE9HNG9CSmkyMWFwUmJZeHdLWGh1QkVXNDdE?=
 =?utf-8?B?eU81TGRNbVE4MGpzQWVwWWltM3B3OUd2Q3dGcWJIbFZhQUh4d2dhWTRBKyt5?=
 =?utf-8?B?anRhY3pESm5GSU5GN0xaZ25Wb3kxRE52akUvcW82VjlLS2ZIN1Y2R0pzaHNF?=
 =?utf-8?B?YTdjZy9tdWlwSDVzMjBHNEhPblV6UE1hczVBbTRJOVErUlVuUklEQW9pMkZ6?=
 =?utf-8?B?aTVGQkE0TUxyS3lqUlh4cHpmNTNOV3N4QUVIbDc4S2JaU05lUktab2k0bk53?=
 =?utf-8?B?UEU0ZmJQMzFzSldDd05CQk1kNzZrbjBMWnFka21JOTBIV1JOaDkyb2pWVS95?=
 =?utf-8?B?VEpnUE81azVvcGx2Z2JMUGpOek5lK2JuN1ZHKzRnaHZZVFh1NmtpYmxoUm5P?=
 =?utf-8?B?K0xVdFQ2RFZyMHBlc3BBV1ZIdHpmdzY3RmQ4OGNyeXRGNGNheFNaWENkc05H?=
 =?utf-8?B?UkE4SEdScGtLSy9WQXRaK21UclFSa1ZUZE1aSERIRWNzcm9KRXpYQngwN1NB?=
 =?utf-8?B?T1J4TEpsY2p1MmFOY0VkakNIZ3NMSzNMOG8wa2RWcGxFWXFJMllUV3pQUGdn?=
 =?utf-8?B?TjE1aEZaQzh3M3lBbm1jSFArYUZMWHpNU0JPUzhhSFh0NTBNRjRkbGFIaUp4?=
 =?utf-8?B?QWlwVmVqNU15REoxaCs1SzRadHBLc0w3djdZa3ZocCtOem8vbXRNQWVHUzV6?=
 =?utf-8?B?Y0g4amRlWmRmcUVsWWFxOFVxemtuUXk3Uy9xYlp2ZUJsbS90dXU5R1hwV3BD?=
 =?utf-8?B?TUp2TVFCT0ZabTBCUFpGN25NWmxRQ1p3VlJJa3dXRnV1aHMwSEdNWDh0T3hZ?=
 =?utf-8?B?QjdzLzVTcFFYUzhoc2g5K282TmFqQW1DTHVqM1UvRCtScGtvVVNkQ3pkNmxM?=
 =?utf-8?B?eEczeUlhZHM2eXBUUXBSNGw1eXV0emh5YUEzZ3d3bkl6VEVJd0FVVXZYeExp?=
 =?utf-8?B?SDNQWHAva0dEUHJaOUN3UnVOWUFGTEJibzgrVUZ0ZkZrZEU2S1dWWkJ6Tmhi?=
 =?utf-8?B?TGVGWDVLWDd6MUdIWXZTK3hXYkkwZDI3NkpYbkE2ZzVTM3BpSFJJMFpVSDRl?=
 =?utf-8?B?T2ZJZFpnbjM2dTdoc2NSeTBSZ3NRSlc1ZkdwWTVjQUpCTmIrbXFQQXBwSWJN?=
 =?utf-8?B?TWhXR2x2TFZRYUJtQUZoK01xSDUybFlIUHpPQUdrU2o5ZDBTdXlLbm1HdTFC?=
 =?utf-8?B?L0kzdFZnUkhPQWRiNkhMRzlrS0xJVURnTVZESFhUVzYvaGhBdVo1N1lMUDlj?=
 =?utf-8?B?Yi8vcm9hN3I0MzlKZzE1SGw0ZnJKWFM5VzNmNFdVdmhqRzVsb0Z5Y1REejh3?=
 =?utf-8?B?MkZaMzJhWDZCL2FtN1NCcDBSMlREMWZwazhSNXdsSmQrZGZ4QU9PUFdlTVNi?=
 =?utf-8?B?QzJnTVByZkVUbW00M1FiMFJjMDBmYm1pa0YzTmQzcUQranA2QUU0VXJpYVRZ?=
 =?utf-8?B?RVBrbUU5OW4yS1kwdUxXMzNiemt1cGk0b0tya1JyM3lSeENHOFZQVVN2d2N0?=
 =?utf-8?B?TXk5Y2VRc3E3elpXaFV2Z1pwOEcvdFFNTXZvZkphQW1iSHF5K2VNV0FFOGF2?=
 =?utf-8?B?MHVkdHdQUnpSUjhrd0grYjJXZTVkZkZIbzlNV2F2a1RMdU4va1lnRCt5b2lR?=
 =?utf-8?B?UU13d095QmlYcEtPNHV4Q0pDRjVNSm8yOHNncHFBZTJVNm94Z25ITVdLYWdp?=
 =?utf-8?Q?+dUI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d2afce2-c9c5-443c-d4ad-08dbba7cf45d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2023 08:30:04.1534 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ll2ypdMah0YIq5s1Q3FGBLxogZQCLAiGM7DKBchuC3ai4rfUX63HUH1d7uxZ8WG6DUATDSEoHYv5byKaYBgv1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8295
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
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 dl-linux-imx <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 "patchwork-lst@pengutronix.de" <patchwork-lst@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1cnNkYXksIFNlcHRlbWJlciAyMSwgMjAyMyAzOjU5IFBNIEx1Y2FzIFN0YWNoIDxsLnN0
YWNoQHBlbmd1dHJvbml4LmRlPiB3cm90ZToNCj4gQW0gRG9ubmVyc3RhZywgZGVtIDIxLjA5LjIw
MjMgdW0gMDc6MzQgKzAwMDAgc2NocmllYiBZaW5nIExpdToNCj4gPiBIaSwNCj4gPg0KPiA+IE9u
IFdlZG5lc2RheSwgU2VwdGVtYmVyIDIwLCAyMDIzIDY6MzEgUE0gTHVjYXMgU3RhY2gNCj4gPGwu
c3RhY2hAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOg0KPiA+ID4gRm9yY2UgYSBtb2Rlc2V0IGlmIHRo
ZSBuZXcgRkIgaGFzIGEgZGlmZmVyZW50IGZvcm1hdCB0aGFuIHRoZQ0KPiA+ID4gY3VycmVudGx5
IGFjdGl2ZSBvbmUuIFdoaWxlIGl0IG1pZ2h0IGJlIHBvc3NpYmxlIHRvIGNoYW5nZSBiZXR3ZWVu
DQo+ID4gPiBjb21wYXRpYmxlIGZvcm1hdHMgd2l0aG91dCBhIGZ1bGwgbW9kZXNldCBhcyB0aGUg
Zm9ybWF0IGNvbnRyb2wgaXMNCj4gPiA+IGFsc28gc3VwcG9zZWQgdG8gYmUgZG91YmxlIGJ1ZmZl
cmVkLCB0aGUgY29sb3JzcGFjZSBjb252ZXJzaW9uIGlzDQo+ID4gPiBub3QsIHNvIHdoZW4gdGhl
IENTQyBjaGFuZ2VzIHdlIG5lZWQgYSBtb2Rlc2V0Lg0KPiA+ID4NCj4gPiA+IEZvciBub3cganVz
dCBhbHdheXMgZm9yY2UgYSBtb2Rlc2V0IHdoZW4gdGhlIEZCIGZvcm1hdCBjaGFuZ2VzIHRvDQo+
ID4gPiBwcm9wZXJseSByZWNvbmZpZ3VyZSBhbGwgcGFydHMgb2YgdGhlIGRldmljZSBmb3IgdGhl
IG5ldyBmb3JtYXQuDQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogTHVjYXMgU3RhY2ggPGwu
c3RhY2hAcGVuZ3V0cm9uaXguZGU+DQo+ID4gPiAtLS0NCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0v
bXhzZmIvbGNkaWZfZHJ2LmMgfCAxOCArKysrKysrKysrKysrKysrKy0NCj4gPiA+ICBkcml2ZXJz
L2dwdS9kcm0vbXhzZmIvbGNkaWZfa21zLmMgfCAyNiArKysrKysrKysrKysrKysrKysrKy0tLS0t
LQ0KPiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMo
LSkNCj4gPiA+DQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL214c2ZiL2xjZGlm
X2Rydi5jDQo+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9sY2RpZl9kcnYuYw0KPiA+ID4g
aW5kZXggMThkZTJmMTdlMjQ5Li5iNzRmMGNmMWUyNDAgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbXhzZmIvbGNkaWZfZHJ2LmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9teHNmYi9sY2RpZl9kcnYuYw0KPiA+ID4gQEAgLTMwLDkgKzMwLDI1IEBADQo+ID4gPiAgI2lu
Y2x1ZGUgImxjZGlmX2Rydi5oIg0KPiA+ID4gICNpbmNsdWRlICJsY2RpZl9yZWdzLmgiDQo+ID4g
Pg0KPiA+ID4gK3N0YXRpYyBpbnQgbGNkaWZfYXRvbWljX2NoZWNrKHN0cnVjdCBkcm1fZGV2aWNl
ICpkZXYsDQo+ID4gPiArCQkJCXN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSkNCj4gPg0K
PiA+ICIgY2hlY2twYXRjaC5wbCAtLXN0cmljdCIgY29tcGxhaW5zOg0KPiA+IENIRUNLOiBBbGln
bm1lbnQgc2hvdWxkIG1hdGNoIG9wZW4gcGFyZW50aGVzaXMNCj4gPiAjMzE6IEZJTEU6IGRyaXZl
cnMvZ3B1L2RybS9teHNmYi9sY2RpZl9kcnYuYzozNDoNCj4gPiArc3RhdGljIGludCBsY2RpZl9h
dG9taWNfY2hlY2soc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSkNCj4gPg0KPiBS
aWdodCwgSSdsbCBmaXggdGhhdC4NCj4gDQo+ID4gPiArew0KPiA+ID4gKwlpbnQgcmV0Ow0KPiA+
ID4gKw0KPiA+ID4gKwlyZXQgPSBkcm1fYXRvbWljX2hlbHBlcl9jaGVjayhkZXYsIHN0YXRlKTsN
Cj4gPiA+ICsJaWYgKHJldCkNCj4gPiA+ICsJCXJldHVybiByZXQ7DQo+ID4gPiArDQo+ID4gPiAr
CS8qDQo+ID4gPiArCSAqIENoZWNrIG1vZGVzZXQgYWdhaW4gaW4gY2FzZSBjcnRjX3N0YXRlLT5t
b2RlX2NoYW5nZWQgaXMNCj4gPiA+ICsJICogdXBkYXRlZCBpbiBwbGFuZSdzIC0+YXRvbWljX2No
ZWNrIGNhbGxiYWNrLg0KPiA+ID4gKwkgKi8NCj4gPiA+ICsJcmV0dXJuIGRybV9hdG9taWNfaGVs
cGVyX2NoZWNrX21vZGVzZXQoZGV2LCBzdGF0ZSk7DQo+ID4NCj4gPiBUaGlzIGFkZGl0aW9uYWwg
Y2hlY2sgbG9va3MgZmluZSwgYnV0IGl0J3MgZG9uZSBmb3IgZXZlcnkgY29tbWl0Lg0KPiA+IElz
IGl0IG9rIHRvIG1vdmUgaXQgdG8gbGNkaWZfcGxhbmVfYXRvbWljX2NoZWNrKCkgd2hlcmUgbW9k
ZV9jaGFuZ2VkDQo+ID4gaXMgc2V0IGZvciB0aG9zZSBjb21taXRzIGluIHF1ZXN0aW9uPw0KPiAN
Cj4gUG90ZW50aWFsbHkgeWVzLCBhcyB3ZSBvbmx5IGhhdmUgYSBzaW5nbGUgcGxhbmUgaW4gdGhl
IExDRElGLCBidXQgaXQNCj4gd291bGQgYmUgYSBkZXZpYXRpb24gb2YgaG93IGV2ZXJ5IG90aGVy
IERSTSBkcml2ZXIgaXMgaW1wbGVtZW50aW5nIHRoaXMNCg0KbWFsaWRwX2NydGNfYXRvbWljX2No
ZWNrX2dhbW1hKCkgY2FsbHMgaXQgdG9vLg0KDQo+IGNoZWNrLiBJZiB0aGVyZSBhcmUgbXVsdGlw
bGUgcGxhbmVzIHRoYW4gdGhpcyBjYWxsIG11c3QgaGFwcGVuIGFmdGVyDQo+IGFsbCBvZiB0aGVt
IGNoZWNrZWQgdGhlIHN0YXRlLCBzbyB0aGlzIGlzIHRoZSBtb3N0IGxvZ2ljYWwgcGxhY2UgdG8N
Cj4gaGF2ZSB0aGlzIGNoZWNrLiBEb2luZyB0aGlzIGNoZWNrIG9uIGV2ZXJ5IGNvbW1pdCBkb2Vz
bid0IHNlZW0gdG8gaHVydA0KPiBvdGhlciBkcml2ZXJzLCBzbyBJJ20gbm90IHJlYWxseSBrZWVu
IG9uIGRvaW5nIHRoaW5ncyBkaWZmZXJlbnRseSBoZXJlLg0KDQpVcCB0byB5b3UuICBObyBzdHJv
bmcgb3Bpbmlvbi4NCg0KUmVnYXJkcywNCkxpdSBZaW5nDQoNCj4gDQo+IFJlZ2FyZHMsDQo+IEx1
Y2FzDQo+IA0KPiA+DQo+ID4gUmVnYXJkcywNCj4gPiBMaXUgWWluZw0KPiA+DQo+ID4gPiArfQ0K
PiA+ID4gKw0KPiA+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX21vZGVfY29uZmlnX2Z1bmNz
IGxjZGlmX21vZGVfY29uZmlnX2Z1bmNzID0gew0KPiA+ID4gIAkuZmJfY3JlYXRlCQk9IGRybV9n
ZW1fZmJfY3JlYXRlLA0KPiA+ID4gLQkuYXRvbWljX2NoZWNrCQk9IGRybV9hdG9taWNfaGVscGVy
X2NoZWNrLA0KPiA+ID4gKwkuYXRvbWljX2NoZWNrCQk9IGxjZGlmX2F0b21pY19jaGVjaywNCj4g
PiA+ICAJLmF0b21pY19jb21taXQJCT0gZHJtX2F0b21pY19oZWxwZXJfY29tbWl0LA0KPiA+ID4g
IH07DQo+ID4gPg0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9sY2Rp
Zl9rbXMuYw0KPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbGNkaWZfa21zLmMNCj4gPiA+
IGluZGV4IDNlYmY1NWQwNjAyNy4uODE2NzYwNGJkM2Y4IDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL214c2ZiL2xjZGlmX2ttcy5jDQo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vbXhzZmIvbGNkaWZfa21zLmMNCj4gPiA+IEBAIC02NDcsMTggKzY0NywzMiBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IGRybV9jcnRjX2Z1bmNzDQo+IGxjZGlmX2NydGNfZnVuY3MNCj4gPiA+ID0g
ew0KPiA+ID4gIHN0YXRpYyBpbnQgbGNkaWZfcGxhbmVfYXRvbWljX2NoZWNrKHN0cnVjdCBkcm1f
cGxhbmUgKnBsYW5lLA0KPiA+ID4gIAkJCQkgICAgc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0
YXRlKQ0KPiA+ID4gIHsNCj4gPiA+IC0Jc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqcGxhbmVfc3Rh
dGUgPQ0KPiA+ID4gZHJtX2F0b21pY19nZXRfbmV3X3BsYW5lX3N0YXRlKHN0YXRlLA0KPiA+ID4g
LQ0KPiA+ID4gcGxhbmUpOw0KPiA+ID4gKwlzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpuZXdfc3Rh
dGUgPQ0KPiA+ID4gZHJtX2F0b21pY19nZXRfbmV3X3BsYW5lX3N0YXRlKHN0YXRlLA0KPiA+ID4g
Kw0KPiA+ID4gcGxhbmUpOw0KPiA+ID4gKwlzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpvbGRfc3Rh
dGUgPQ0KPiA+ID4gZHJtX2F0b21pY19nZXRfb2xkX3BsYW5lX3N0YXRlKHN0YXRlLA0KPiA+ID4g
Kw0KPiA+ID4gcGxhbmUpOw0KPiA+ID4gIAlzdHJ1Y3QgbGNkaWZfZHJtX3ByaXZhdGUgKmxjZGlm
ID0gdG9fbGNkaWZfZHJtX3ByaXZhdGUocGxhbmUtPmRldik7DQo+ID4gPiAgCXN0cnVjdCBkcm1f
Y3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZTsNCj4gPiA+ICsJaW50IHJldDsNCj4gPiA+ICsNCj4gPiA+
ICsJLyogYWx3YXlzIG9rYXkgdG8gZGlzYWJsZSB0aGUgcGxhbmUgKi8NCj4gPiA+ICsJaWYgKCFu
ZXdfc3RhdGUtPmZiKQ0KPiA+ID4gKwkJcmV0dXJuIDA7DQo+ID4gPg0KPiA+ID4gIAljcnRjX3N0
YXRlID0gZHJtX2F0b21pY19nZXRfbmV3X2NydGNfc3RhdGUoc3RhdGUsDQo+ID4gPiAgCQkJCQkJ
ICAgJmxjZGlmLT5jcnRjKTsNCj4gPiA+DQo+ID4gPiAtCXJldHVybiBkcm1fYXRvbWljX2hlbHBl
cl9jaGVja19wbGFuZV9zdGF0ZShwbGFuZV9zdGF0ZSwNCj4gPiA+IGNydGNfc3RhdGUsDQo+ID4g
PiAtCQkJCQkJICAgRFJNX1BMQU5FX05PX1NDQUxJTkcsDQo+ID4gPiAtCQkJCQkJICAgRFJNX1BM
QU5FX05PX1NDQUxJTkcsDQo+ID4gPiAtCQkJCQkJICAgZmFsc2UsIHRydWUpOw0KPiA+ID4gKwly
ZXQgPSBkcm1fYXRvbWljX2hlbHBlcl9jaGVja19wbGFuZV9zdGF0ZShuZXdfc3RhdGUsIGNydGNf
c3RhdGUsDQo+ID4gPiArCQkJCQkJICBEUk1fUExBTkVfTk9fU0NBTElORywNCj4gPiA+ICsJCQkJ
CQkgIERSTV9QTEFORV9OT19TQ0FMSU5HLA0KPiA+ID4gKwkJCQkJCSAgZmFsc2UsIHRydWUpOw0K
PiA+ID4gKwlpZiAocmV0KQ0KPiA+ID4gKwkJcmV0dXJuIHJldDsNCj4gPiA+ICsNCj4gPiA+ICsJ
aWYgKG9sZF9zdGF0ZS0+ZmIgJiYgbmV3X3N0YXRlLT5mYi0+Zm9ybWF0ICE9IG9sZF9zdGF0ZS0+
ZmItPmZvcm1hdCkNCj4gPiA+ICsJCWNydGNfc3RhdGUtPm1vZGVfY2hhbmdlZCA9IHRydWU7DQo+
ID4gPiArDQo+ID4gPiArCXJldHVybiAwOw0KPiA+ID4gIH0NCj4gPiA+DQo+ID4gPiAgc3RhdGlj
IHZvaWQgbGNkaWZfcGxhbmVfcHJpbWFyeV9hdG9taWNfdXBkYXRlKHN0cnVjdCBkcm1fcGxhbmUg
KnBsYW5lLA0KPiA+ID4gLS0NCj4gPiA+IDIuMzkuMg0KPiA+DQoNCg==
