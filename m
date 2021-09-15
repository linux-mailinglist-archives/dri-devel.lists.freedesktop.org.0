Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 237BA40BFF6
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 08:59:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01EAA6E8D6;
	Wed, 15 Sep 2021 06:59:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from na01-obe.outbound.protection.outlook.com
 (mail-oln040093003013.outbound.protection.outlook.com [40.93.3.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF3E16E8D5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 06:59:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e9ufpY3o96Uw+v/+nUYQLvbhybWWspe2JYriYMKehSUKQ6FMLPSsAkt48MC+/4FYg5aB9Yf2B3o+nxLsCSwuDkfflWVdJ/K3tPtsQ20cURZ6qPFXhgY2XEAkAYo2VLfz40aS/MJwCrO7Ne1YxNM/myPssWTSRv5Ox63kIfltCzvDUdCFtzhbzXxR4+tE32yrolWSlCmIR507Pr2nQ7YSjNnGuwpHuwNL8kTs8ENJqh77sWU0XEdS+zKaZM2mmfLtFVShjPgj2mLLjwXTiGWssmbvVfIdXM8IofgofL8gLbuSqo7TA5Fagxk2fHIfD4tUoBN6CU4BOhzNKtmZJm9Qqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=4XFdt6C9Cyu3811H2T81Kuy+ZfEVZHTdRXijJ+O188Y=;
 b=kE42vDyywL+wht+9DDvlnuIRViEuA4U3RUfNBJTdUR/PNQgUUi8dwf3B38nFc82p6nQd05rYp/5NrvOlIN5khBpHy3ug3xAuqnPDVwBwPmJHSB3e2sROZZmkgXcAQ/8FFBwrQpy8pfJDH34IPU82+h3OhB/9svL3fzSBI7Q3Cx8LJJveVJOzKQoGFDDVj0EGzVauxDDbTLdncd0hpTQLUOY54YQ0+AWLvJG7naHJ9qQKC7JosZTb5teLMiQe9JYKu+X5YQpLME1CFsVOuVCAmJx73cz4xsgqlPK20wMcOIuBAdHYvARBkd1crOfkiRWYEEmwivO3klKv5APln4umyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4XFdt6C9Cyu3811H2T81Kuy+ZfEVZHTdRXijJ+O188Y=;
 b=h+DKSr6jTb6P1AubBg4vfQPc/jbjLFnH0V7SOs9gOVtrV/6tOkmWNXT3e0cb+FwlacdpzjrEbIR8YhgUAKROHPcQ8C24Jk8C+0O+VoCljUs8saoN3XqFJEWJWoP5Y0UKGaXhjo0HRgmwsgJ5foFBLIvFVc8ZeQ2ETwxxjIX8gbY=
Received: from BYAPR21MB1270.namprd21.prod.outlook.com (2603:10b6:a03:105::15)
 by BYAPR21MB1736.namprd21.prod.outlook.com (2603:10b6:a02:ca::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.4; Wed, 15 Sep
 2021 06:59:19 +0000
Received: from BYAPR21MB1270.namprd21.prod.outlook.com
 ([fe80::e56b:9b01:9633:78c0]) by BYAPR21MB1270.namprd21.prod.outlook.com
 ([fe80::e56b:9b01:9633:78c0%7]) with mapi id 15.20.4544.002; Wed, 15 Sep 2021
 06:59:19 +0000
From: Dexuan Cui <decui@microsoft.com>
To: Deepak Rawat <drawat.floss@gmail.com>
CC: Haiyang Zhang <haiyangz@microsoft.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drm/hyperv: Fix double mouse pointers
Thread-Topic: [PATCH] drm/hyperv: Fix double mouse pointers
Thread-Index: AQHXqYGDSoFNik8c8kWZU0a77zui5aukpo7Q
Date: Wed, 15 Sep 2021 06:59:18 +0000
Message-ID: <BYAPR21MB1270C4427C264D14F151A0CCBFDB9@BYAPR21MB1270.namprd21.prod.outlook.com>
References: <20210913182645.17075-1-decui@microsoft.com>
 <CAHFnvW0iX1FMTcJzQQtjHGosavSJ6-9wkRb7C0Ljv3c+BBUEXQ@mail.gmail.com>
In-Reply-To: <CAHFnvW0iX1FMTcJzQQtjHGosavSJ6-9wkRb7C0Ljv3c+BBUEXQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=cf3e5a5c-eb7d-4f6a-a708-ad5b99f6293c;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2021-09-15T06:41:59Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 79631515-dbc8-4cf9-3443-08d9781656cc
x-ms-traffictypediagnostic: BYAPR21MB1736:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR21MB1736B5ACE70C9853F9EB83E5BFDB9@BYAPR21MB1736.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tluKZDBEcUuw8tKrVrcNfjHouNaj4V7JNsThLen6vGE1zAOGQEU/uzOdngck2iM5G/gPD5/MgxEW8PJQjccSU2v63S6hJqDRK5EqZIleV0cQ5ByDZUOz6ezz7uBn2zTSQsXrCVbYWUL8cy6F43gf1yibtd8FCEaxqhHccy7VNDQe4Jk6KIa04y0/EsoUJSbO/BZVcHrsXu3ICUoDuQ6zWH8c/awPEpVcmgYMAvFbch7fh9S0ePXzTIoO+tEtnNc4ros3RWV66FQbh7iBsjYKSMsF6FXGZD3LoRTL2cGhbueoPZkFO++L0eHpqWGjdF1OugTu9wn2kFmWDsBKLTVe5Uw+9t1tSfdcYpdHkVG9PFm3Y2WZk1uezImS5E3yifbKv3OIUmSpKn1btfDBbNM17zs/9vzxLfSRj3wbG5XjKMKVrmpaCbz4DOKA7rloQgXVW+OocPl9PxK8ZpwMHKvFf6PVlHWA/+EN5gAFkVnktf8l+x7dk5eM5MK3STW8FuqwON+DhmL84Xj8FyRG2ppOTLfaIbKp7Yrpj7aUjwKGlVrnZmsGmetU8UgpStjw8rZZHGRyazwi5OQnB/YiNrcKquUKSo5GvqeWd1PqADiD0Yz1Wl1UTpIVFP9QpAEaKhIbvStSDEkdjP/z2U5VOiidmeKkpnheHh2IKtWy3eetRV4hTQk2+bIBXuy/I2ugDQ3uiJezBNa9tpLJUfN1rOpI6A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR21MB1270.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(2906002)(7696005)(122000001)(26005)(6506007)(66946007)(8676002)(8990500004)(71200400001)(52536014)(55016002)(4326008)(86362001)(38100700002)(66446008)(82960400001)(64756008)(186003)(9686003)(6916009)(82950400001)(66476007)(66556008)(10290500003)(316002)(54906003)(33656002)(83380400001)(508600001)(76116006)(8936002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?czNmc2NPYmNBRzNwYWRWVm5XOEwza1dtcHBPTkEza013bVhvNW1rcVptTXZM?=
 =?utf-8?B?b3Izc29mdVBHYnZrQVhHS0xkdmd4a0s5Myt2OTJ5dzdSQk9QTjMvcVU4LzFs?=
 =?utf-8?B?clhsQlVOcXJ6cFBDK0ZmVjJCemdvc2lhRkNWc3ROYjNCVUFFc2MyOW9MbFJi?=
 =?utf-8?B?amVtazduUVJ4UDd2TUI5eFg2N2ZwYmZhSWlsYlgvSHJFcDYvdGVDTlc0Zml4?=
 =?utf-8?B?YS9oRldNZmpIZWpYVnkvUG5jaks0UUJzYUhsQkJaWS92OWhEeWFoNjhqTXlo?=
 =?utf-8?B?OHpsa2lOYmxKNnZIeTRMRHNHQ01SZFh3VVhNM2JKMVl4OWs0NHJsUHRwZkpU?=
 =?utf-8?B?NXc3MnRCQjlyQUFiSWRBNDNLNmFiTFR0TUx2LzA1K2VMUnpvdVViUjVhQzVR?=
 =?utf-8?B?MkJkUGtiY1pCbytiVXR4RXQyR05LQUVDbVNkWmlvOVNTNXkzZStXSEd1dTAy?=
 =?utf-8?B?bFNBUjZhbm9qUDh6cHdIUG1aSFBGdTBwYWptM3Y4WFNSaTAwMEFMUFJBZXlP?=
 =?utf-8?B?V1I0WVozL0hhcm1LVU9XdGRCNWowM2pCS1R3d1lyVUZGT0NzVHZXNGlRU0Fl?=
 =?utf-8?B?MUo1UTczSnJHM01DeFBmckR5dFhJaVNDZ2VkRGtBSGNlbGxNNHd2VTFaY3FN?=
 =?utf-8?B?UWlTVnpDaE1vSUMwSUFuT2FWaVNpUUtPRFBlNUhObndqRGFJOHhmZ0ljMGlh?=
 =?utf-8?B?Vm1yVTNlcFhzdW51QkJ4VllxdG5Cc2hqMHlJSlVKbzkzWDZVaW5sbUNSNGVq?=
 =?utf-8?B?b0ZoVFloSzdmKzFNcTh2UEpQejkyZUcyZ0JpMnhRMjhjeE9ZSU9ENjEzTk04?=
 =?utf-8?B?eG0vUmdQODErOGZkWkd4QWxQU2cyRmxrVFE5UC9Xam1lcTdSUGRncW1ORHV6?=
 =?utf-8?B?NXBJbFRqMU1XS1U2VS9yYXFnbEdtSVZYQWJIczZxYmdmcm9yNktweXJkaGNi?=
 =?utf-8?B?NG5Nc1RjVjRNd0VlbEY5aFpxb041bHl5YkNvNTJQMFByKzNLODZ6NTZ1UkdI?=
 =?utf-8?B?NHYvUi9SbHRXSnkvQ056OUFrVGpoRjNJZks2MmtmZGhRenJsNENnY0lHSGhJ?=
 =?utf-8?B?Y0ozRmlFYlIzUTE5S0haYXdLdmJYUmcrVmZIcGZOa3R3MTZEdzE4NzlyRC9a?=
 =?utf-8?B?Y0FmbmdZR3BxMlN2ZDdvNHJ1RVhZNUtmclpldW1GMk1xVURKUjZjQkE1UmZi?=
 =?utf-8?B?OXYxNVZReGV2MldudGxWNlU4RHpUMkU3encvbDl6TzcvYzEweUk5YU5DazFt?=
 =?utf-8?B?SWx1aStRclVSeXZsRjRlUlFOb1hiNnVOaFBydlg0Z1Q5dHk3WkErY0Q1cTha?=
 =?utf-8?B?b1pnWU5DSFljODhHaGxSYlBQdDhGcld4NlhGNE5BZ3hiV3lpU3l6VjJSZ0dY?=
 =?utf-8?B?VWFZN3QwcHNqVkFEOVUvbWkvNzdVbFY1cXV4cG9pcGRuRm01NmhDUFdJWUE4?=
 =?utf-8?B?TUtVTDhtNi9MY1pWZXBjWU5iWE9rSmlrTzZvTXlqSzNZVkEreXU3eFkrdElU?=
 =?utf-8?B?djFxZUZTSWovc05vL2hmd3hEMlI5dmxkQzFYZTcrVlVjR2g3NXl6OS9UUFh4?=
 =?utf-8?B?MFpKQjAra3Q2TEphc1JzcUVDek5lS25aTXNCNXBvcGIrS2hWRjh5dDBPenAx?=
 =?utf-8?B?em1ZMnlWdkJIRFZwQ1BlUDhkUjlDMlp6L0JwWDNRRnhDWXlCWkNKeGhsMnVz?=
 =?utf-8?B?MmpKWXJVN003VXJNYzI0TXJOcHI4OVJndHRJdHM2YTREN1Y3dlNnMldIR3Y0?=
 =?utf-8?Q?c3bzicNOWt3QM8YGYkmlwpS78fhXGOPecsUjctp?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR21MB1270.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79631515-dbc8-4cf9-3443-08d9781656cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2021 06:59:18.9163 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3IxV3A5QnvLaFSTVO0QugTk+6qQWXk/pVH8xEraY/s9UNw2owlucBbKwnqo6S1WG4DgI5cM93dXtXcifm5LkJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR21MB1736
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

PiBGcm9tOiBEZWVwYWsgUmF3YXQgPGRyYXdhdC5mbG9zc0BnbWFpbC5jb20+DQo+IFNlbnQ6IFR1
ZXNkYXksIFNlcHRlbWJlciAxNCwgMjAyMSA4OjU5IEFNDQo+IC4uLg0KPiA+ICsvKiBTZW5kIG1v
dXNlIHBvaW50ZXIgaW5mbyB0byBob3N0ICovDQo+ID4gK2ludCBoeXBlcnZfc2VuZF9wdHIoc3Ry
dWN0IGh2X2RldmljZSAqaGRldikNCj4gPiArew0KPiA+ICsgICAgICAgc3RydWN0IHN5bnRodmlk
X21zZyBtc2c7DQo+ID4gKw0KPiA+ICsgICAgICAgbWVtc2V0KCZtc2csIDAsIHNpemVvZihzdHJ1
Y3Qgc3ludGh2aWRfbXNnKSk7DQo+ID4gKyAgICAgICBtc2cudmlkX2hkci50eXBlID0gU1lOVEhW
SURfUE9JTlRFUl9QT1NJVElPTjsNCj4gPiArICAgICAgIG1zZy52aWRfaGRyLnNpemUgPSBzaXpl
b2Yoc3RydWN0IHN5bnRodmlkX21zZ19oZHIpICsNCj4gPiArICAgICAgICAgICAgICAgc2l6ZW9m
KHN0cnVjdCBzeW50aHZpZF9wb2ludGVyX3Bvc2l0aW9uKTsNCj4gPiArICAgICAgIG1zZy5wdHJf
cG9zLmlzX3Zpc2libGUgPSAxOw0KPiANCj4gImlzX3Zpc2libGUiIHNob3VsZCBiZSAwIHNpbmNl
IHlvdSB3YW50IHRvIGhpZGUgdGhlIHBvaW50ZXIuIE1heWJlDQo+IGJldHRlciwgYWNjZXB0IHRo
ZXNlIGZyb20gdGhlIGNhbGxlci4NCg0KQWNjb3JkaW5nIHRvIG15IHRlc3QsICJpc192aXNpYmxl
ID0gMCIgZG9lc24ndCB3b3JrLCBpLmUuIGNhbid0IGhpZGUgdGhlDQp1bndhbnRlZCBIVyBtb3Vz
ZSBwb2luZXIuIEl0IGxvb2tzIGxpa2UgdGhlIGZpZWxkIGlzIGZvciBzb21lIHZlcnkgb2xkDQps
ZWdhY3kgV2luZG93cyBWTXMgbGlrZSBXaW5kb3dzIFZpc3RhLg0KDQpIYWl5YW5nIGFsc28gcmVw
bGllZCBpbiBhbm90aGVyIGVtYWlsLCBzYXlpbmcgImlzX3Zpc2libGUgPSAwIiBkb2Vzbid0DQp3
b3JrLg0KDQo+ID4gKyAgICAgICBtc2cucHRyX3Bvcy52aWRlb19vdXRwdXQgPSAwOw0KPiA+ICsg
ICAgICAgbXNnLnB0cl9wb3MuaW1hZ2VfeCA9IDA7DQo+ID4gKyAgICAgICBtc2cucHRyX3Bvcy5p
bWFnZV95ID0gMDsNCj4gPiArICAgICAgIGh5cGVydl9zZW5kcGFja2V0KGhkZXYsICZtc2cpOw0K
PiA+ICsNCj4gPiArICAgICAgIG1lbXNldCgmbXNnLCAwLCBzaXplb2Yoc3RydWN0IHN5bnRodmlk
X21zZykpOw0KPiA+ICsgICAgICAgbXNnLnZpZF9oZHIudHlwZSA9IFNZTlRIVklEX1BPSU5URVJf
U0hBUEU7DQo+ID4gKyAgICAgICBtc2cudmlkX2hkci5zaXplID0gc2l6ZW9mKHN0cnVjdCBzeW50
aHZpZF9tc2dfaGRyKSArDQo+ID4gKyAgICAgICAgICAgICAgIHNpemVvZihzdHJ1Y3Qgc3ludGh2
aWRfcG9pbnRlcl9zaGFwZSk7DQo+ID4gKyAgICAgICBtc2cucHRyX3NoYXBlLnBhcnRfaWR4ID0g
U1lOVEhWSURfQ1VSU09SX0NPTVBMRVRFOw0KPiA+ICsgICAgICAgbXNnLnB0cl9zaGFwZS5pc19h
cmdiID0gMTsNCj4gPiArICAgICAgIG1zZy5wdHJfc2hhcGUud2lkdGggPSAxOw0KPiA+ICsgICAg
ICAgbXNnLnB0cl9zaGFwZS5oZWlnaHQgPSAxOw0KPiA+ICsgICAgICAgbXNnLnB0cl9zaGFwZS5o
b3RfeCA9IDA7DQo+ID4gKyAgICAgICBtc2cucHRyX3NoYXBlLmhvdF95ID0gMDsNCj4gPiArICAg
ICAgIG1zZy5wdHJfc2hhcGUuZGF0YVswXSA9IDA7DQo+ID4gKyAgICAgICBtc2cucHRyX3NoYXBl
LmRhdGFbMV0gPSAxOw0KPiA+ICsgICAgICAgbXNnLnB0cl9zaGFwZS5kYXRhWzJdID0gMTsNCj4g
PiArICAgICAgIG1zZy5wdHJfc2hhcGUuZGF0YVszXSA9IDE7DQo+ID4gKyAgICAgICBoeXBlcnZf
c2VuZHBhY2tldChoZGV2LCAmbXNnKTsNCj4gPiArDQo+IA0KPiBJcyBpdCBuZWNlc3NhcnkgdG8g
c2VuZCBTWU5USFZJRF9QT0lOVEVSX1NIQVBFIGhlcmU/IFBlcmhhcHMgd2Ugc2hvdWxkDQoNCkFj
Y29yZGluZyB0byBteSB0ZXN0LCB5ZXMuIElmIEkgZG9uJ3Qgc2VuZCBhIFNZTlRIVklEX1BPSU5U
RVJfU0hBUEUgbWVzc2FnZSwNCnRoZSB1bndhbnRlZCBtb3VzZSBwb2ludGVyIGNhbid0IGJlIGhp
ZGRlbi4gQXMgd2Uga25vdywgdGhlIHByb3RvY29sIGJldHdlZW4NCnRoZSBWU0MgYW5kIHRoZSBW
U1AgaXMgbm90IHdlbGwgZG9jdW1lbnRlZCB0byB1cy4gSSBjYW4gYXNrIEh5cGVyLVYNCnRlYW0g
Zm9yIHNvbWUgY2xhcmlmaWNhdGlvbiBvbiB0aGlzLCBidXQgaXQncyBwcm9iYWJseSB3ZSBjYW4g
anVzdCB1c2UgdGhlIGN1cnJlbnQNCnZlcnNpb24gb2YgaGlkaW5nIHRoZSBtb3VzZSBwb2ludGVy
IGFzLWlzIC0tIHRoaXMgaGFzIGJlZW4gdXNlZCBmb3IgMTArIHllYXJzDQppbiB0aGUgaHlwZXJ2
X2ZiIGRyaXZlciB3aXRob3V0IGFueSBpc3N1ZS4gOi0pDQoNCj4gc2VwYXJhdGUgU1lOVEhWSURf
UE9JTlRFUl9QT1NJVElPTiBhbmQgU1lOVEhWSURfUE9JTlRFUl9TSEFQRSBpbnRvDQo+IGRpZmZl
cmVudCBmdW5jdGlvbnMuDQoNClNpbmNlIHRoZSAyIG1lc3NhZ2VzIGFyZSBvbmx5IHVzZWQgaGVy
ZSwgSSBzdWdnZXN0IHdlIGtlZXAgaXQgYXMtaXMuDQoNClRoYW5rcywNCi0tIERleHVhbg0K
