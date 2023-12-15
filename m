Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04858814712
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 12:37:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D018C10E9C8;
	Fri, 15 Dec 2023 11:37:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::701])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D44E510E9C8
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 11:37:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PbhgihbjOUZkUogKM1ew3mofrQxeZYZSYJiJpv+Sl+dnkre9HKMzmILupHBQscthZcJwWufV0LCD8LoMk29zTJ1jOyH5FCRBW3ePTEBbND1+dN4/D0QhgdflJ2qqKK16/V9qTFBdc1l2L71kVvKrYRuN8gJd7nMU7CqM0253N/ZATw2wL42SwK3LRz1gQ8XZ1XiA1wYdR2YW09iHiVaHS2LFexrwY6wAcbzxMg1sLxtPtXHmB1pZ74+waSqgyFMwXoGrWEt7Qf4wSIhJaE0zxaH81PHGm5ww3vsvnO2zYMevjDeTKiFnB6rDYrU7JDgCjQqDFWxiw5r6u+d9kkgv/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V7tpS96/E1ZN3tzI+CBSpvvwwaOmhO1BTuWtWlHSpWE=;
 b=EhqJhH6hMMn1lepbYO8jvNsavu9+uW8qIjzbkTVN6r76rQgVdd2r4B4in20Kg+S81Qj6W18QkhfhQWjsuBI8kYuGYrg/poElQBXi2Hv9v+aU7ska/DZcHCNMSOuf21ZUvPOodRIoSJZ7+TbaOeYLri/Mou4I+X/Gl17o9KoVrzI0+HWhLgcvthOej4Fxs1OCFFK+Ec93FpJ41P/k8f63jrogt97jc20/6Yxt9pnUCDsV5rsGDsk7yCkNO3vRSnnE0VQfMyhuJRJ88pevvGzplWmb3ibquPd0fvS0dZ6tcNSklIWnckmytqLRpIPUR4ZdXOlYOmYWwYy8Lbc4iND8ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V7tpS96/E1ZN3tzI+CBSpvvwwaOmhO1BTuWtWlHSpWE=;
 b=qFOs0HzObchq3mRf1riHwrtUaSVXwQoBsay17K2Ue9t4XO2/R171J8aIOxySK09jNM3nzi5GYUsVaO30HGvs613GqbZQIZI9pyknGH7/HaPz4IfGdZgYbzCXtgoXORcHAXNCBI7pAseqp7Z/YQRB+5Gf5iT0LUG8mDhzM1ZkmuM=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYAPR01MB6284.jpnprd01.prod.outlook.com
 (2603:1096:402:3c::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.10; Fri, 15 Dec
 2023 11:37:07 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::f216:24ab:3668:3a48]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::f216:24ab:3668:3a48%4]) with mapi id 15.20.7113.010; Fri, 15 Dec 2023
 11:37:07 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: RE: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
Thread-Topic: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
Thread-Index: AQHaIejqQbh+O2CetkGmd2PHSouIl7Cnc3CAgAFZmGCAAXC4AIAAEXww
Date: Fri, 15 Dec 2023 11:37:07 +0000
Message-ID: <TYCPR01MB112699C55873FA75B8F4469C18693A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231128105129.161121-1-biju.das.jz@bp.renesas.com>
 <20231128105129.161121-4-biju.das.jz@bp.renesas.com>
 <sechknyg33iucaku37vfhk7ie7xgcealfqbvaopm4rrnqbo5g5@s35peonkzzoz>
 <TYCPR01MB11269767836DEB995747B7ED3868CA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <zp2ews2by6fg5irmb7ms6blox6vruezdjlor3rutqtokbvlle2@tl775slyvhyf>
In-Reply-To: <zp2ews2by6fg5irmb7ms6blox6vruezdjlor3rutqtokbvlle2@tl775slyvhyf>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYAPR01MB6284:EE_
x-ms-office365-filtering-correlation-id: 655b2f20-f4ee-4161-69c8-08dbfd622add
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cOIcL+a93U5zZyB/mI9fqDmTqO5GtInssqSBqbfBNFYF6175ARJRLzUzmIeqVoIEOAOSjaf/C3mQnwYmt/kA0TgvQ9whCEd1M86WZfPUNSrghIDI03rKV5J9wKEg/q+1XHV2SaDJlZqBP3h/GZDthcbKoUxpSA1W/dTYtkyrl7u1sodYmb46ouxvixVbyb41vKU9pW+vhsH8CBEuadZJ6LSo0rlEWqGtenvYPfw7k2LXWdI2MA7vXjp8tHhc7mZCpDjqmLnkUxtLPfnepC9X4mjxN/7SXgJ3PPcO5dHQc8ED15UQqK78NnNi13LUMnhMy+0WBz2w38fHdaV7xViJznXy2Y0Kc/laysLh04zYeCy092QicHS/oxWg7TrmRuTVV+7ukXMepL4/Qkh7cApQfsOBdtSE8CM8WD1z2YL8sKzSKCciq1Yu+c3QJaaB2kVxRvmx3jRPHp9zf0gSdQhuC7bnUjwyT6dCc5zRmZ5o6pFpur6p4bXB8WjUf7PUvXAIYyFopsRLNWIQDalMu2seuWbRl3JbIae7UCJCjoMEsbOz1JVGYaFOQwlJfvMju0sFV7hNCLWXAzSODVFuK4lJ60pincUY3mYWtUr76kS0curmiVXRlY+5ewJpNdcoknwy
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11269.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(346002)(376002)(366004)(136003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(55016003)(26005)(7696005)(6506007)(33656002)(38070700009)(86362001)(38100700002)(122000001)(83380400001)(4326008)(52536014)(5660300002)(7416002)(53546011)(9686003)(71200400001)(76116006)(6916009)(316002)(66946007)(8676002)(8936002)(66556008)(66476007)(66446008)(64756008)(54906003)(2906002)(41300700001)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cm9KVHd0UlNiWml3Z3kwa2hxQ2NIWW9SUWVnTmVmcVZjWDVnci9QNWphUE5p?=
 =?utf-8?B?ZjJ6bVRPVXl1dUI5d0hJQmRCZnM4UmswU1Y0Q2l3K1BXTlhLZW5PK1ZDQjlq?=
 =?utf-8?B?UEFrakNPdktPQUxCT3RwdkZ3aWFPZGtEamVkczhlQUVZdFpDbjJ2eWFDdDA4?=
 =?utf-8?B?aHB1ZUx4TkpUZmhiblhLQzJ5Wk1aNXlUSis5aXk2Z2dVRGhJSGowdXBkeGwv?=
 =?utf-8?B?S0ltZVRqWUZ3NDRUWlhaZlRyZEZyMFhYOFlFZnQvMEpIVk43SWtzUW5wL3Zi?=
 =?utf-8?B?WllJZjAwS3lEOHpjbkEvUUt4a2x1YWpMN3NjMmVJeHNjSlhSTUpIYlVEd3Ew?=
 =?utf-8?B?MWlPek9VME9aMllScmtHaW9HVVg3enFiVGZ2QVZ4UktGNklYL2U0NXBGOTQz?=
 =?utf-8?B?d29aUGF2WHVXaWs0bEpzUjlkWk04TUFNRlhRUzlBdGFFQU9oaUtsVmFOZFVF?=
 =?utf-8?B?REUzN0orUkxLdlBpM3dja2VxRk5HTEdBWGUzZDdWU0tXZWtrTmVQUjhvaWFl?=
 =?utf-8?B?Yy9ZOW1ySFc3QzFGcjVpRmRpLzJjRGlqUXQ1eTYyeFBHazJyRGZNU0lBZzBW?=
 =?utf-8?B?VVJqZDRRRE9FdnYvR092UVFab1R3L2huUGg1bXlxM1c3T3BGalBnVDBlSzhr?=
 =?utf-8?B?TUdzcWxKN3FNQ05LUC80akgvSnA5NTJLNXEvWUExdzJRMnRRemZBK25FNFcr?=
 =?utf-8?B?N3FxRVBDMkVFVnpHbUFUNklPVWdOekhYMWwrYlNvb2JLbWNVVzQ1QkU4eDJ3?=
 =?utf-8?B?U2Nmd3hFTy9YMHpsS29JcDIwNjJ1Ny9lcjlsNThubE1wOWhoWGU2QnErdXdp?=
 =?utf-8?B?UnZxenNTMm9GRzNDQ3B3cTJKZ1YvbDdZNkduQUo1cVRUR3JiYTc3eG52cEgw?=
 =?utf-8?B?SWtiR0NRN0E0NVFMMTRsSHpMNjA5RGY1Q2ZHVCsvTzExK3FNdTJ4RkN5QTBv?=
 =?utf-8?B?bVVlakp6VS9HVWh4MGhwOUp4REgwVzdGeGszR01oVElNY1hBUXFBZCsxNGRi?=
 =?utf-8?B?VFN0eGxhNlJOOU96d1poTHJ3UXN5V1pBNUhKVUZ4NUZxTXI3Vmp3eWtSSGRH?=
 =?utf-8?B?ZzNkSytpQjQ4cDRiWWZ3RG9zaXFBUjM1aStqR0pCN1FJakp3V3N4RzZCbjQw?=
 =?utf-8?B?RmpBT0VHWHR0WER6WGV1RCtXMDdNNVprR0tUQldQd3IwZEd2bmt1Q1owS0lx?=
 =?utf-8?B?cTBuck1SUVA5MzNodnlUL3duNWNjZmxiS1doYnRGc3VlUGltUGRQSG5XMlZO?=
 =?utf-8?B?TnovVWpiUFd0cEVvSnYzZkhYZ3pwM2d2MytIV01XSFozbWNaK2t4VVZUSVZJ?=
 =?utf-8?B?UEdMbkhkMWJ1eU4zeTNQZFFheEl2K25xZkYvZlhqQzVCUjRBRm83a0ZJYkRm?=
 =?utf-8?B?RlorUGlreUhVTlo1MTk3OFhxMC9WKzFZZURxWGJoU24vV0ZKTFZQcnY4TkVV?=
 =?utf-8?B?NGN6dE42WWh3SzFuL1JBeWE2RmMrYk9kc0FMdnBVRlo3cDJuR290aDROSGd0?=
 =?utf-8?B?KzlNSXFMaXp4cTVSem5PRGwweW43Ym5JSHFibjlvSzJHaURxT2hodVBYM0M0?=
 =?utf-8?B?dXBhZlBieC9RSlE3SWJ4MzJ0KzFBZ0JZOUJPUlljN2QvTkE1cmNjbmErVUsv?=
 =?utf-8?B?Wlp4SXdkQW9YdXlmVk9kU2JnT3BkOWlJc096amVZK0xBc0toSVlzYUYvWTkv?=
 =?utf-8?B?dzE1RVM5SGNFbTZlZDhJMzhzV2h4aHdVeDFsc2RqUU04aS9ZODhlVXBldThj?=
 =?utf-8?B?MzRBYXlKOVB4RkV5NG5SdWJxdFQ0aytMNmNzTVZtYVFWblVSN21HOGJONS9x?=
 =?utf-8?B?QmdOM2hkK0pxMmdRVmxTWU56eVRnZENWbGtGRnBsTHcvUXZVeThza3k3a1BW?=
 =?utf-8?B?T3BVVzlqbDc3NFpweVlCSVlCTUdLckg5NEN4c2VuZXptVHN2TnE0ejFvbXIw?=
 =?utf-8?B?ajlrZ2Jja0ZIRTlJM00wR09CUFV5eGI3VmZ5UUY2RlVRTU5Ed0JZQ0ZvTkoz?=
 =?utf-8?B?dDJ0MGlkaThrWlR5MTJWVXJ1MWk5N3RoU3ZmN043czNuaVlMMUFPaHY2L2Zi?=
 =?utf-8?B?UDdWanJ5OWRuMkh6RkZQenQ5amVuWUl2TDJxYVdBeldDSmQ5NG82RzVzeDJE?=
 =?utf-8?B?cjhrZ3ZENnFZbEQxTkVKaFRVNWplWjlYbDIyTG1HY1VTQ3UwWFRFcllTeFVC?=
 =?utf-8?B?a1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 655b2f20-f4ee-4161-69c8-08dbfd622add
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2023 11:37:07.0397 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rgoN0+JhxDEP5xgkqjnMqqRcqAXwyAGLr7tjbNBDIBRx7hO8usWXMjK0LvfSYXdvTR5/YMTa+2zj5K2TlSKPKnWKDJd64Vm65+jraSJC0FQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6284
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
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 "biju.das.au" <biju.das.au@gmail.com>, Magnus Damm <magnus.damm@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWF4aW1lIFJpcGFyZCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9t
OiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgRGVj
ZW1iZXIgMTUsIDIwMjMgMTA6MjQgQU0NCj4gVG86IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5y
ZW5lc2FzLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MTUgMy81XSBkcm06IHJlbmVzYXM6
IEFkZCBSWi9HMkwgRFUgU3VwcG9ydA0KPiANCj4gT24gVGh1LCBEZWMgMTQsIDIwMjMgYXQgMDM6
MjQ6MTdQTSArMDAwMCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gSGkgTWF4aW1lIFJpcGFyZCwNCj4g
Pg0KPiA+IFRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwu
b3JnPg0KPiA+ID4gU2VudDogV2VkbmVzZGF5LCBEZWNlbWJlciAxMywgMjAyMyAzOjQ3IFBNDQo+
ID4gPiBUbzogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gU3Vi
amVjdDogUmU6IFtQQVRDSCB2MTUgMy81XSBkcm06IHJlbmVzYXM6IEFkZCBSWi9HMkwgRFUgU3Vw
cG9ydA0KPiA+ID4NCj4gPiA+ID4gKwkgKi8NCj4gPiA+ID4gKwlyemcybF9kdV9jcnRjX2dldChy
Y3J0Yyk7DQo+ID4gPg0KPiA+ID4gVGhhdCdzIGEgYml0IHN1c3BpY2lvdXMuIEhhdmUgeW91IGxv
b2tlZCBhdA0KPiA+ID4gZHJtX2F0b21pY19oZWxwZXJfY29tbWl0X3RhaWxfcnBtKCkgPw0KPiA+
DQo+ID4gT2ssIEkgd2lsbCBkcm9wIHRoaXMgYW5kIHN0YXJ0IHVzaW5nDQo+ID4gZHJtX2F0b21p
Y19oZWxwZXJfY29tbWl0X3RhaWxfcnBtKCkNCj4gPiBpbnN0ZWFkIG9mIHJ6ZzJsX2R1X2F0b21p
Y19jb21taXRfdGFpbCgpLg0KPiANCj4gSXQgd2FzIG1vcmUgb2YgYSBzdWdnZXN0aW9uLCByZWFs
bHkuIEknbSBub3Qgc3VyZSB3aGV0aGVyIGl0IHdvcmtzIGZvcg0KPiB5b3UsIGJ1dCBpdCB1c3Vh
bGx5IGFkZHJlc3NlcyBzaW1pbGFyIGlzc3VlcyBpbiBkcml2ZXJzLg0KDQpJIGNvbmZpcm0sIGl0
IGlzIHdvcmtpbmcgaW4gbXkgY2FzZSwgZXZlbiBhZnRlciByZW1vdmluZyByemcybF9kdV9jcnRj
X2dldCgpDQphbmQgdXNpbmcgdGhlIGhlbHBlciBmdW5jdGlvbiBkcm1fYXRvbWljX2hlbHBlcl9j
b21taXRfdGFpbF9ycG0oKS4NCg0KPiANCj4gPiA+DQo+ID4gPiA+ICtzdGF0aWMgaW50IHJ6ZzJs
X2R1X2NydGNfZW5hYmxlX3ZibGFuayhzdHJ1Y3QgZHJtX2NydGMgKmNydGMpIHsNCj4gPiA+ID4g
KwlzdHJ1Y3QgcnpnMmxfZHVfY3J0YyAqcmNydGMgPSB0b19yemcybF9jcnRjKGNydGMpOw0KPiA+
ID4gPiArDQo+ID4gPiA+ICsJcmNydGMtPnZibGFua19lbmFibGUgPSB0cnVlOw0KPiA+ID4gPiAr
DQo+ID4gPiA+ICsJcmV0dXJuIDA7DQo+ID4gPiA+ICt9DQo+ID4gPiA+ICsNCj4gPiA+ID4gK3N0
YXRpYyB2b2lkIHJ6ZzJsX2R1X2NydGNfZGlzYWJsZV92Ymxhbmsoc3RydWN0IGRybV9jcnRjICpj
cnRjKSB7DQo+ID4gPiA+ICsJc3RydWN0IHJ6ZzJsX2R1X2NydGMgKnJjcnRjID0gdG9fcnpnMmxf
Y3J0YyhjcnRjKTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArCXJjcnRjLT52YmxhbmtfZW5hYmxlID0g
ZmFsc2U7DQo+ID4gPiA+ICt9DQo+ID4gPg0KPiA+ID4gWW91IHNob3VsZCBlbmFibGUgLyBkaXNh
YmxlIHlvdXIgaW50ZXJydXB0cyBoZXJlDQo+ID4NCj4gPiBXZSBkb24ndCBoYXZlIGRlZGljYXRl
ZCB2YmxhbmsgSVJRIGZvciBlbmFibGluZy9kaXNhYmxpbmcgdmJsYW5rLg0KPiA+DQo+ID4gdmJs
YW5rIGlzIGhhbmRsZWQgYnkgdnNwZC4NCj4gPg0KPiA+IHZzcGQgaXMgZGlyZWN0bHkgcmVuZGVy
aW5nIGltYWdlcyB0byBkaXNwbGF5LA0KPiA+IHJjYXJfZHVfY3J0Y19maW5pc2hfcGFnZV9mbGlw
KCkgYW5kIGRybV9jcnRjX2hhbmRsZV92YmxhbmsoKSBjYWxsZWQgaW4NCj4gPiB2c3BkJ3MgcGFn
ZWZsaXAgY29udGV4dC4NCj4gPg0KPiA+IFNlZSByemcybF9kdV92c3BfY29tcGxldGUoKWluIHJ6
ZzJsX2R1X3ZzcC5jDQo+IA0KPiBTb3JyeSwgSSBjb3VsZG4ndCByZWFsbHkgZ2V0IGhvdyB0aGUg
aW50ZXJydXB0IGZsb3cgLyB2YmxhbmsgcmVwb3J0aW5nIGlzDQo+IGdvaW5nIHRvIHdvcmsuIENv
dWxkIHlvdSBleHBsYWluIGl0IGEgYml0IG1vcmU/DQoNCldlIGp1c3QgbmVlZCB0byBoYW5kbGUg
dmVydGljYWwgYmxhbmtpbmcgaW4gdGhlIFZTUCBmcmFtZSBlbmQgaGFuZGxlci4NClNlZSB0aGUg
Y29kZSBiZWxvdy4NCg0Kc3RhdGljIHZvaWQgcnpnMmxfZHVfdnNwX2NvbXBsZXRlKHZvaWQgKnBy
aXZhdGUsIHVuc2lnbmVkIGludCBzdGF0dXMsIHUzMiBjcmMpDQp7DQoJc3RydWN0IHJ6ZzJsX2R1
X2NydGMgKmNydGMgPSBwcml2YXRlOw0KDQoJaWYgKGNydGMtPnZibGFua19lbmFibGUpDQoJCWRy
bV9jcnRjX2hhbmRsZV92YmxhbmsoJmNydGMtPmNydGMpOw0KDQoJaWYgKHN0YXR1cyAmIFZTUDFf
RFVfU1RBVFVTX0NPTVBMRVRFKQ0KCQlyemcybF9kdV9jcnRjX2ZpbmlzaF9wYWdlX2ZsaXAoY3J0
Yyk7DQoNCglkcm1fY3J0Y19hZGRfY3JjX2VudHJ5KCZjcnRjLT5jcnRjLCBmYWxzZSwgMCwgJmNy
Yyk7DQp9DQoNCkNoZWVycywNCkJpanUNCg0K
