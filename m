Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F307A928B
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 10:18:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8CB010E0E5;
	Thu, 21 Sep 2023 08:18:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2077.outbound.protection.outlook.com [40.107.8.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E52C210E04A
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 08:18:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GxCP6/SNdtWwxg46x71Ce7DmnHKP24bTJvLNj596s+8Z3HIFXOzSTn1OsRU72OZ0IJ5MbqV3LA6ehLiHiwWcOr2/V1mT8czx4VjEtiLTmBr0vrmxEkNzwBgyoDRMPDzk3EK01CFJy+besfQ9DhprnrYEi7QMTaCrlQPPySfUvucCHQTpOAPbJO1xXtVcVztTKoeq2KoHCqQ/zGfd91P6SzzTyoUYNbiHymzEb7eiQLcNJbYEmmXLhzPw4E5xiy66nAZ8ZU0mqhJCr467nDFsvX20OHatDZgGkFgqWFF6RGvjyJgItCV5/cVlohZpTuiASgBSNXwf5HloM6SYqATErQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KDbrWtZUvsTIbhYaDOvOgSfBnuXztetTcNbnjYCj+hI=;
 b=On8Wai3wKAO3fjB55lnFI2pIia+suO+0HOIhoPkpk0HC8m5FZvVDzea4U4jTfpM/sZjlnnvca+GboeuWCnxv6du5ykvYDTl8or6Z9IBG/p4B9yxGJst4/2llQD7D3dM2MQWcnpQ8+lVIx6xTEsnIGqb6yE8xxyCmUgKjQ6Os05xXfaau7LHl8rf/dK7FRWVfK77xJvj/fENJsVRchetQf0hii8BoN2hSsBYlz/IxrozJYwAz6as8joK4uuMAQh115svsz8AKmlfp/tZrC4lcG2Y9YGcAaHmv3PrAYNpNEcjFFImYvRUAWEgIBh/B05EztsPAks8ulMfrjimsrbzJyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KDbrWtZUvsTIbhYaDOvOgSfBnuXztetTcNbnjYCj+hI=;
 b=EDeai4I0FwxX6f6xTBv+gpm7rEU2SYRMYmXTLTgb93p6YOVBrToKAytYQa1BJ/jD+vKgqsRTsT7BPVqyNULbrXP6u37dNuoot9qqNKkyhzclVQwzYHDVtLpL2E77grfHpUo3d/yeP27RcDDgEQPKA42F0qUPByULPe1A6eL8/dA=
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB8014.eurprd04.prod.outlook.com (2603:10a6:102:c7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Thu, 21 Sep
 2023 08:18:43 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::1ace:f566:c57a:7d4b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::1ace:f566:c57a:7d4b%3]) with mapi id 15.20.6813.017; Thu, 21 Sep 2023
 08:18:43 +0000
From: Ying Liu <victor.liu@nxp.com>
To: Lucas Stach <l.stach@pengutronix.de>, Marek Vasut <marex@denx.de>
Subject: RE: [PATCH 2/5] drm: lcdif: move controller enable into atomic_flush
Thread-Topic: [PATCH 2/5] drm: lcdif: move controller enable into atomic_flush
Thread-Index: AQHZ662fEUnhuutWEkO/NTaz1A0SHLAk2e8AgAAQo4CAAANhEA==
Date: Thu, 21 Sep 2023 08:18:43 +0000
Message-ID: <AM7PR04MB704644037955946CE3B3A1E698F8A@AM7PR04MB7046.eurprd04.prod.outlook.com>
References: <20230920103126.2759601-1-l.stach@pengutronix.de>
 <20230920103126.2759601-3-l.stach@pengutronix.de>
 <AM7PR04MB7046AA99475489B1220D309998F8A@AM7PR04MB7046.eurprd04.prod.outlook.com>
 <fa07e69431066065ab6dc6df8d4649ba04124aa4.camel@pengutronix.de>
In-Reply-To: <fa07e69431066065ab6dc6df8d4649ba04124aa4.camel@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR04MB7046:EE_|PA4PR04MB8014:EE_
x-ms-office365-filtering-correlation-id: e73e57d3-8dbb-41a3-6d89-08dbba7b5e8a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pijCt6g9IZxpIve9u6lJHft6zFGqi1Uo1RnnZopT7+ukl1CT7MjjT6LDibFovZ5oMqhixcXDGq8yXxdVwY97UB9k2dTU8zDJOeVdRRME4kah9UjqUdF8wIfqB00ef98wtniK7HFkxvYru3Qrop8hZU2Sqh4zn5TimCxob38wbJqen4vhnXbFybhaMjT/E/C+9BbXfcQh4iCjzhetyljEfqKuAa6DhaJ95/geIp98yPlFJYM8HrBT9OsMukD1W3rIz+7vbbsvs2m/Y4S7OnjE/DNkUDRfajxNV6XIzhB+6UFJVgvol/wePkpCO4IK2fc99Smup0lqJYhjwEdyMutABLHz0yO6EbOpAaw6shf0039d/R6CagTNuOGDMfH2nk8lnMXoP60aIOSby7RK6nXPURgIHiOR4OAz7l6atveW+B0DlVfjRwkTLZcKICWkFpicKqKcrTu0kCuPSiEUNWpFyiOBcUr2tGs8xNJSy7O2nF/VsdCZiTuz3cB8rPf4K+7k61Y+MkEvahjwBOrA3Z6FGCGAoEZsScxAk24rzQYPblWhmRyF7YXqzWGdysVoFkE56rN+zRKLC9+2FmuG+9tZPCl8EaZAnax4qQeC3dXzbePOHdCRPFgiglVgW1ltziJN
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(136003)(366004)(39860400002)(376002)(186009)(451199024)(1800799009)(478600001)(7696005)(53546011)(6506007)(71200400001)(9686003)(2906002)(83380400001)(26005)(76116006)(66556008)(4326008)(66946007)(66476007)(54906003)(64756008)(66446008)(316002)(41300700001)(110136005)(8676002)(52536014)(8936002)(5660300002)(55016003)(86362001)(33656002)(122000001)(38100700002)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RXkzZlAvQmFCaDE0ZjIwZDdNQzg4eFQ3eDR6VFRYbzdVdFdnMC9SbnNyL1hm?=
 =?utf-8?B?UHl4ekZuSFNNdjZJYXJ0bGNZV1FsSWk5aVJxRWdqUDBaeXoxNDZSejlMU2Ry?=
 =?utf-8?B?bTIramloRHoxcVJEVy9RL3Z5UnE3ZFF6b1QrcHliMHhxVUx6YlZqeFFvSi9N?=
 =?utf-8?B?elpYRFppanpnR2dOOUovZEw4MG43enJYSWF4cnE5SFM0dWtmQXMxeUFxbkRx?=
 =?utf-8?B?MVV1dyszOTM2S00zU0taRjVZaG5EbWRyTGd3eU9neUM0QXBxYTRNMWY4UGRa?=
 =?utf-8?B?WFVzT0lJS01ZMW1lby9lRmNhWGJKVUZBRHp6Rk9iZjc1M0JibHJTNzlwdGZP?=
 =?utf-8?B?N2ZPNnRGUHJ2NFFGVzZ4aXQ1TVB0ejFQMXBZUkZTeTFCNHlHVjVIU3AraEVv?=
 =?utf-8?B?azczODJyRW9OM0plKzFTTFBXakM2MmtvMHpFTXhpVWduTjBTK2s3T0F6UFdV?=
 =?utf-8?B?cUhJUnNhV3g2K21JYWxsbkZNVHpOZXhCa013bmRNMUFRMDlVN3lsNWVMVzlX?=
 =?utf-8?B?TWcyb3pMR3JOSzBWV1Q5YUhWUkxGWTNMcUdwVTBXV3YySWhqU3FsOVhxVTlr?=
 =?utf-8?B?VEZNTW5acVVYeW1WM2ZLNDVZQzlPWGZSVDlCOElRNHZMT2thb2JpQnIrekZm?=
 =?utf-8?B?VlNxRVNtYjhIOU5aZlZpZGladlcyUHgzSks2Vm03R081dXF1NFVPZ0FGK1I3?=
 =?utf-8?B?VUJYbm1MR1ltMW9FSFhpTTllK0tGRWVzWTQ2NHpLY2VqOStjWVZHQ3NPSlFZ?=
 =?utf-8?B?bll0ZHVtNWhzcVE1Q1p5UkR0RmhsZEdCa2w4d1Y3NFBGMnFVaVUra0J6dFdi?=
 =?utf-8?B?QVFuQkJHdkZIUlVXN1ZOd2lVUVdXbERqdWRhamUwLzFzY2d6NW94Vysyb2E0?=
 =?utf-8?B?Y1QyR2NyYmJVRGtWS0FhcUxKTEZsR2xsUzZORkQ3ZWdIS0NJb2ZHclBNdk84?=
 =?utf-8?B?TVNzUEE1YVNFekhvY1prMWVuTE9DR3dHV3I2VGtXUWp3K3ZzYmFMbmdkNm02?=
 =?utf-8?B?bjUzM0tnU2JHclgxU2RlaTQvZFl4L2tub3B1KzRjNlc4bzR2WEVwbTRWb3li?=
 =?utf-8?B?aktPQWhXODNQbjl1Uk5kd3V2RFhNbngrODVrTHk4WFlsNWZoS1RsdCtBOEFy?=
 =?utf-8?B?VndFMjdxOW1xQUVLNzZwaTFlVVNBMVZHNzM1K3BZOW1EZ0ZJUzlFd3JkM0pT?=
 =?utf-8?B?RUl1akJ1d1JEZkZIVzFwT3hzL0JCTE5TWVg1SysrUFArS3hEV084dWZJODBX?=
 =?utf-8?B?NDV2cmRVTDFUb2swRXRpdUxwd1ViOURrMXc2RWZhbllqYkQwaWRIc09ETmh0?=
 =?utf-8?B?S2JrSHZLdDFvWCtDeGM3UXpSRjRYOXB6RCtsZTR1dXp6eWdzRDlkQmhIWmFK?=
 =?utf-8?B?SVoybERLTW9vdS81NFNqamxhdkFUM2hYdHZKZXRkSnBOalFJUytRKy9ySTh6?=
 =?utf-8?B?RDhrdFFGMkttMDlqMllrbUpTcEtubk41cVVBTzQ1YjhOYVllNitycFJaUGdy?=
 =?utf-8?B?UG1QUkFlY2JGNGZlWnRFVjZWNFZvanltN2F3a3NFbEMrUFJnMStLVUN1VTZW?=
 =?utf-8?B?UjBmOTZFVXpXMnA5Z0VGK2RVeEtIYkRGY2IwRE0yRnB3cmpRVWVIeE9GRmNk?=
 =?utf-8?B?T2ZMTjAzYlZ5cTNQRG9PVUpoc2lFODRRdFk4RFpUdXNnNSsxaExTOGdDV3pT?=
 =?utf-8?B?OGo4U3YrZG5sUEdsaDFUVjk1UmdhaHlhQk9CcHdhMVZFc2dOOFFkVWY4bXdQ?=
 =?utf-8?B?Sk1SNGM3TGpES2RtYzZiblhzNjlIMThQbDlZNFJvcHpQdjkxZTNrakM5Q3FR?=
 =?utf-8?B?by9EMHB6K0wrenNqUFVGRU5URVhjcERXdE13WVhwUUF5VUZwTHJydFY1WU5q?=
 =?utf-8?B?SDE0b1E4emE3OGJTVE9EQmY3UEh1ZHpZczQ2czBRTkpzTGpRdnJndUZPNHlk?=
 =?utf-8?B?OGg2QzI5TGM5Z2ZkVHJROGxOY0paY3VYU2Vhd1pNZ1pGR2JjKzNubjIyNk9a?=
 =?utf-8?B?YnAyc2RFMjFZNXFWWDVIUjNYNzgwQ0FCdkdsU0FWSXZ3S1paQVRpNDVJbnI1?=
 =?utf-8?B?K2dRSGV6V1FhTmR0SXZ5a2ZjdExTL3p6TlFtMDdZMkVDVnFZdDkyNjhiTEZF?=
 =?utf-8?Q?VTs0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e73e57d3-8dbb-41a3-6d89-08dbba7b5e8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2023 08:18:43.2480 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g545nTRH7FqKhbmsLU7J4PQTWsm2A/BzJr2lcX/1Sd3pyM3l9BmxwyViwYzQJh1iN1HmUB+PLKvyXiL/ass6hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8014
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

T24gVGh1cnNkYXksIFNlcHRlbWJlciAyMSwgMjAyMyAzOjU1IFBNIEx1Y2FzIFN0YWNoIDxsLnN0
YWNoQHBlbmd1dHJvbml4LmRlPiB3cm90ZToNCj4gQW0gRG9ubmVyc3RhZywgZGVtIDIxLjA5LjIw
MjMgdW0gMDc6MTMgKzAwMDAgc2NocmllYiBZaW5nIExpdToNCj4gPiBIaSwNCj4gPg0KPiA+IE9u
IFdlZG5lc2RheSwgU2VwdGVtYmVyIDIwLCAyMDIzIDY6MzEgUE0gTHVjYXMgU3RhY2gNCj4gPGwu
c3RhY2hAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOg0KPiA+ID4gQWxsb3cgZHJtX2F0b21pY19oZWxw
ZXJfY29tbWl0X3RhaWxfcnBtIHRvIHNldHVwIGFsbCB0aGUgcGxhbmUNCj4gPiA+IHN0YXRlIGJl
Zm9yZSB0aGUgc2Nhbm91dCBpcyBzdGFydGVkLg0KPiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6
IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPg0KPiA+ID4gLS0tDQo+ID4gPiAg
ZHJpdmVycy9ncHUvZHJtL214c2ZiL2xjZGlmX2ttcy5jIHwgNiArKysrKy0NCj4gPiA+ICAxIGZp
bGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gPg0KPiA+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9sY2RpZl9rbXMuYw0KPiA+ID4gYi9k
cml2ZXJzL2dwdS9kcm0vbXhzZmIvbGNkaWZfa21zLmMNCj4gPiA+IGluZGV4IGY1YmZlOGI1Mjky
MC4uNGFjZjY5MTRhOGQxIDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL214c2Zi
L2xjZGlmX2ttcy5jDQo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbGNkaWZfa21z
LmMNCj4gPiA+IEBAIC01MDUsNiArNTA1LDggQEAgc3RhdGljIGludCBsY2RpZl9jcnRjX2F0b21p
Y19jaGVjayhzdHJ1Y3QgZHJtX2NydGMNCj4gPiA+ICpjcnRjLA0KPiA+ID4gIHN0YXRpYyB2b2lk
IGxjZGlmX2NydGNfYXRvbWljX2ZsdXNoKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywNCj4gPiA+ICAJ
CQkJICAgIHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSkNCj4gPiA+ICB7DQo+ID4gPiAr
CXN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSA9DQo+ID4gPiBkcm1fYXRvbWljX2dl
dF9uZXdfY3J0Y19zdGF0ZShzdGF0ZSwNCj4gPiA+ICsJCQkJCQkJCQkgIGNydGMpOw0KPiA+ID4g
IAlzdHJ1Y3QgbGNkaWZfZHJtX3ByaXZhdGUgKmxjZGlmID0gdG9fbGNkaWZfZHJtX3ByaXZhdGUo
Y3J0Yy0+ZGV2KTsNCj4gPiA+ICAJc3RydWN0IGRybV9wZW5kaW5nX3ZibGFua19ldmVudCAqZXZl
bnQ7DQo+ID4gPiAgCXUzMiByZWc7DQo+ID4gPiBAQCAtNTEzLDYgKzUxNSw5IEBAIHN0YXRpYyB2
b2lkIGxjZGlmX2NydGNfYXRvbWljX2ZsdXNoKHN0cnVjdCBkcm1fY3J0Yw0KPiA+ID4gKmNydGMs
DQo+ID4gPiAgCXJlZyB8PSBDVFJMREVTQ0wwXzVfU0hBRE9XX0xPQURfRU47DQo+ID4gPiAgCXdy
aXRlbChyZWcsIGxjZGlmLT5iYXNlICsgTENEQ19WOF9DVFJMREVTQ0wwXzUpOw0KPiA+ID4NCj4g
PiA+ICsJaWYgKGRybV9hdG9taWNfY3J0Y19uZWVkc19tb2Rlc2V0KGNydGNfc3RhdGUpKQ0KPiA+
ID4gKwkJbGNkaWZfZW5hYmxlX2NvbnRyb2xsZXIobGNkaWYpOw0KPiA+DQo+ID4gTW92aW5nIGxj
ZGlmX2VuYWJsZV9jb250cm9sbGVyKCkgZnVuY3Rpb24gY2FsbCBmcm9tIGF0b21pY19lbmFibGUg
dG8NCj4gPiBhdG9taWNfZmx1c2ggd291bGQgY2hhbmdlIENSVEMgdnMgYnJpZGdlIGVuYWJsZW1l
bnQgb3JkZXIsIHdoaWNoDQo+ID4gZWZmZWN0aXZlbHkgbWFrZXMgYnJpZGdlIGVuYWJsZW1lbnQg
aGFwcGVuIHByaW9yIHRvIENSVEMgZW5hYmxlbWVudCwNCj4gPiBzZWUgZHJtX2F0b21pY19oZWxw
ZXJfY29tbWl0X3RhaWxfcnBtKCkgZGV0YWlsIGltcGxlbWVudGF0aW9uLiAgVGhlDQo+ID4gcmV2
ZXJzZWQgb3JkZXIgcG90ZW50aWFsbHkgY2F1c2VzIG1hbGZ1bmN0aW9ucyBvZiB0aGUgYnJpZGdl
Lg0KPiA+DQo+IFRoaXMgaGFzIG5vdGhpbmcgdG8gZG8gd2l0aCB0aGUgYnJpZGdlIGFmdGVyIHRo
ZSBMQ0RJRiBjb250cm9sbGVyLiBUaGUNCg0KSU1ITywgdGhlIHJlc2VydmVkIENSVEMgdnMgYnJp
ZGdlIGVuYWJsZW1lbnQgb3JkZXIgaXMgcmVsZXZhbnQgZm9yDQp0aGUgb3ZlcmFsbCBkaXNwbGF5
IHBpcGVsaW5lLg0KDQo+IFJQTSBjb21taXRfdGFpbCBpbXBsZW1lbnRhdGlvbiBlbmFibGVzIHRo
ZSBDUlRDIGJlZm9yZSBhbGwgdGhlIHBsYW5lDQo+IHN0YXRlIGlzIHNldCB1cC4gVG8gYXZvaWQg
aGF2aW5nIHRvIHByb2dyYW0gdGhlIHBsYW5lIHN0YXRlIGluIHRoZSBDUlRDDQo+IGVuYWJsZSB0
aGlzIHNlcmllcyBkZWZlcnMgdGhlIGFjdHVhbCBjb250cm9sbGVyIGVuYWJsZSB0byB0aGUgbGFz
dCBzdGVwDQo+IG9mIHRoZSBhdG9taWMgY29tbWl0LiBUaGlzIHdheSB0aGUgcGxhbmUgc3RhdGUg
aXMgcHJvZ3JhbW1lZCB0aGUgdXN1YWwNCj4gd2F5IHZpYSB0aGUgYXRvbWljIHVwZGF0ZV9wbGFu
ZSBjYWxsYmFjayBhbmQgd2UgZG9uJ3QgbmVlZCB0byBkdXBsaWNhdGUNCj4gdGhpcyBzZXR1cC4N
Cg0KSSB1bmRlcnN0YW5kIHRoZSBwYXRjaCBhdm9pZHMgc29tZSBkdXBsaWNhdGlvbnMgdmlhIGRl
ZmVycmFsIGNvbnRyb2xsZXINCmVuYWJsZW1lbnQgdGltZSBwb2ludCwgYnV0IHRoZSByZXZlcnNl
ZCBDUlRDIHZzIGJyaWRnZSBlbmFibGVtZW50IG9yZGVyDQppcyB0aGUgY29uY2VybiBoZXJlLg0K
DQo+IA0KPiA+IEJUVywgZXZlbiBpZiBpdCdzIG9rIHRvIG1vdmUgdGhlIGZ1bmN0aW9uIGNhbGws
IGl0IHdvdWxkIGJlIGJldHRlciB0byBjYWxsDQo+ID4gbGNkaWZfZW5hYmxlX2NvbnRyb2xsZXIo
KSBiZWZvcmUgQ1RSTERFU0NMMF81X1NIQURPV19MT0FEX0VOIGlzDQo+ID4gc2V0IHNvIHRoYXQg
dGhlIG9yaWdpbmFsIHNlcXVlbmNlIGlzIGtlcHQuICBBbHNvLCBMQ0RJRiBjaGFwdGVyIGluIFNv
QyBSTXMNCj4gPiBpbmRpY2F0ZXMgdGhhdCB0aGUgc2hhZG93IGxvYWQgZW5hYmxlbWVudCBpcyB0
aGUgbGFzdCBzdGVwIGluDQo+ID4gIlNvZnR3YXJlIGZsb3cgZGlhZ3JhbSIuDQo+IA0KPiBUaGlz
IGZsb3cgY2hhcnQgc2hvd3MgaG93IHRoZSBkb3VibGUgYnVmZmVyZWQgdXBkYXRlIHNob3VsZCB3
b3JrLCBpdA0KPiBkb2Vzbid0IHNob3cgdGhlIGluaXRpYWwgY29udHJvbGxlciBlbmFibGUgc2Vx
dWVuY2UuIFdpdGhvdXQgdGhlIHNoYWRvdw0KDQpZb3UgYXJlIHJpZ2h0LiAgVGhlIGRvd25zdHJl
YW0gZHJpdmVyIGFsc28gZW5hYmxlcyBzaGFkb3cgbG9hZCBiZWZvcmUNCnRoZSBlbnRpcmUgY29u
dHJvbGxlci4NCg0KUmVnYXJkcywNCkxpdSBZaW5nDQoNCj4gbG9hZCBlbmFibGUgYml0IGJlaW5n
IHNldCBiZWZvcmUgdGhlIGNvbnRyb2xsZXIgZW5hYmxlIEkgY291bGQgb2JzZXJ2ZQ0KPiBzcG9y
YWRpYyBpc3N1ZXMgb24gdGhlIGZpcnN0IGZyYW1lIHdoZXJlIHRoZSBETUEgZW5naW5lIHdvdWxk
IHJlYWQgdGhlDQo+IHdyb25nIG1lbW9yeSBhZGRyZXNzLg0KPiANCj4gUmVnYXJkcywNCj4gTHVj
YXMNCj4gDQo+ID4NCj4gPiBSZWdhcmRzLA0KPiA+IExpdSBZaW5nDQo+ID4NCj4gPiA+ICsNCj4g
PiA+ICAJZXZlbnQgPSBjcnRjLT5zdGF0ZS0+ZXZlbnQ7DQo+ID4gPiAgCWNydGMtPnN0YXRlLT5l
dmVudCA9IE5VTEw7DQo+ID4gPg0KPiA+ID4gQEAgLTU1Miw3ICs1NTcsNiBAQCBzdGF0aWMgdm9p
ZCBsY2RpZl9jcnRjX2F0b21pY19lbmFibGUoc3RydWN0DQo+IGRybV9jcnRjDQo+ID4gPiAqY3J0
YywNCj4gPiA+DQo+ID4gPiAJd3JpdGVsKENUUkxERVNDTF9ISUdIMF80X0FERFJfSElHSCh1cHBl
cl8zMl9iaXRzKHBhZGRyKSksDQo+ID4gPiAgCQkgICAgICAgbGNkaWYtPmJhc2UgKyBMQ0RDX1Y4
X0NUUkxERVNDTF9ISUdIMF80KTsNCj4gPiA+ICAJfQ0KPiA+ID4gLQlsY2RpZl9lbmFibGVfY29u
dHJvbGxlcihsY2RpZik7DQo+ID4gPg0KPiA+ID4gIAlkcm1fY3J0Y192Ymxhbmtfb24oY3J0Yyk7
DQo+ID4gPiAgfQ0KPiA+ID4gLS0NCj4gPiA+IDIuMzkuMg0KPiA+DQoNCg==
