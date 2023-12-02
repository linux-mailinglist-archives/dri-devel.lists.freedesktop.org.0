Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B34F7801D7D
	for <lists+dri-devel@lfdr.de>; Sat,  2 Dec 2023 16:28:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F53610E1EB;
	Sat,  2 Dec 2023 15:28:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2053.outbound.protection.outlook.com [40.107.94.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55CC410E080;
 Sat,  2 Dec 2023 15:28:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kMA4/E9TPDXLu1VlMJC9QvOv0Ri0bBrLFwBMup3TjpZTIWH0GeXSJYbNLN2kOYCYFGeXxUnZX+kSJPwFzVNE3n1MoF9hHJNaCmYrt8WG78Ri4fXwZWUUIJLIImLcKmfcqw8vGHwgtm3NmAgBnZCTivHOmzyH85KZWgSpY9g92445EOdRJAbnsQlC/ELOopuHXDAY94XKViJcUz8bWAU+z6MkdxAEmRwY7FqN1vNCQ1L27eQuMVDVZtYgw5/izKfMVvHhKWn8NF97Q45Y4WH6KO97coCDeCaFgLQDX4SP2dkYAPxZL/q50vQ5aN8IKgdAqFy2RX0JMbGWsQ4qbw+JoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6wqBhl1CD5ITRaXDQv9cIPNKUYC3qyzV9lbPNswwz28=;
 b=kcats+iLh/5RYrtgDL8O5tMllQEGydD/NaiHKTrfCWTxE+rP9t6u0ZWNm8GEqncSpFss5dZLO4kEqk1ovcaGNBbtgaiVmUvXzLfV6z5splHIPS/p+eT2zVXvxBtmtxGv+MxQ1/YcS2b7Ndz46OcP+UpbYufmJ21/C1qbcj8GsMixmTMNLr5/JLYG14jPnJLDUaNWKVqb8e/TPdCBca7hJY3wjWOeMz6Pnj4nXgZXuYd/PwDogaugQFCoVm8ZP0gUPg5LgyGXYcpWYiguRUf4CNHqs5LYii7/sdldFqVPVAEZQebJzQPu/sQsIu5i7ct/yYA/l9BrVJbWymXIpNx6Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6wqBhl1CD5ITRaXDQv9cIPNKUYC3qyzV9lbPNswwz28=;
 b=cGOVD25WHUcMMQ64tDFn2Uun6Pto5u0GN8UBRQj1LSZofPqpj+j0U+EQozk2d5IiUHAHLsRl5Ooy/pJr34tq8fPlcsvNaFkkuiaLVyig+5Zs3RynDIDbFSvYsSXUD0vcXdboon1sHYv/TEYGrsSp95xiP/dfDNbwuJi7L1uq8XapKn8a9tJDapZO8ajkG5s51kdIrm4GpZjO2WTUI1v+FBtHBaM4KBmmCJDh4GjbGk9SZ+B7GvGmYYatht66myNM6TMHxOKmmOZknAyL2dBZSwD5GyDrr5WlFmh1yQwaE7ppy7GzqQ+Zgz0yWIA++q/iI2CR+88+nueF7+eh5LmSEA==
Received: from SN7PR12MB8769.namprd12.prod.outlook.com (2603:10b6:806:34b::12)
 by DM6PR12MB4452.namprd12.prod.outlook.com (2603:10b6:5:2a4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.30; Sat, 2 Dec
 2023 15:28:26 +0000
Received: from SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::6799:dc7a:e121:1af6]) by SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::6799:dc7a:e121:1af6%7]) with mapi id 15.20.7046.028; Sat, 2 Dec 2023
 15:28:25 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "bagasdotme@gmail.com" <bagasdotme@gmail.com>, "gert.vanhaerents@hotmail.com"
 <gert.vanhaerents@hotmail.com>
Subject: Re: [Nouveau] Kernel problem with multiseat on one card
Thread-Topic: [Nouveau] Kernel problem with multiseat on one card
Thread-Index: AQHaJSIIsvKg2iKZ90y1m3UUReFMuLCWHhwA
Date: Sat, 2 Dec 2023 15:28:25 +0000
Message-ID: <655a02097e9b49c2da7a2be60d7c154a48a916f4.camel@nvidia.com>
References: <AM7PR10MB39235DD53D163910E88FDB938E82A@AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM>
 <AM7PR10MB3923E07D6024434077E95EBA8E82A@AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM>
 <ZWsuiq7zrYS-pDli@archie.me>
In-Reply-To: <ZWsuiq7zrYS-pDli@archie.me>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8769:EE_|DM6PR12MB4452:EE_
x-ms-office365-filtering-correlation-id: 3bd96aec-a632-441e-d443-08dbf34b53c4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zmXbJEvRobaNEsssCVDsSHkEClCJK3ZZvqdZaZ1grNg1RkpQ0VuiWpFKW1PbAYsrOctoJR9CfHl9Knm3Oulu3UZ30qSdYvOPB2KrZLE2GTL6HjLYzMiZBAh0gMdYKY5X9BhXFwIpusER/smkC+CXR0yJsgOUIo+e5C+VGTFk2bsS5vlCerrQ5Zao/2rSV4aQ8jcD3+hgEx0LcDtqDHrSdjQsjfxhTeA2kev/3jorJyssMsDD99CWhZllVFbxPYPEqPiIH+Bynw13r9atycvG6cTxIcuKFW8WyCGlke1XNNvv5LJhgFkJ3kwlaGf+bnfTDjk8Z6bw4HOrnLoMM7eCRhuZmN2+tsUSKScTlM0vmIgAM9WhJVabVOFWNYFUvDdkeeRfXHhDVKHpPCy90HPF8Q8O6UjVYU9yuOoOI9lrGGk7XNurGdTi2lWFi2kiOK9dZtN09H0MODFhds6drElGmvv83HWRtMZoqB5cBjOCQ5LGtvQFMu125D3sncvpeUXtniei+yJs6pdfbBe/UqJgeQJnFkKR1HKxQP9DgwCc2TeSuMLfJQObBMrU1vfGPCpZrSzY46OBKjgS1ygHUgcOS2lvZLdvk/Ki7iH+xpewwxVtBoeX86cVortNHAHRk0Py4neHhBoFgxt3n13sCnz+0x7XtKu78mx6xkytN/kkrL0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8769.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(346002)(366004)(39860400002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(76116006)(66946007)(66556008)(66476007)(66446008)(316002)(64756008)(110136005)(966005)(6486002)(38100700002)(2906002)(4744005)(5660300002)(41300700001)(86362001)(36756003)(38070700009)(122000001)(8936002)(8676002)(6512007)(6506007)(83380400001)(26005)(2616005)(71200400001)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V3ZKWEVnZWhWaHd0ZlVGNjR1cHI4SHZWdUY1elM3LzlDUkdGYkgzaEVRVXlX?=
 =?utf-8?B?THNjQkVPMElXeUMyUTZjVmh4T2VVai9ic1laTUtueXZaZVJVY29YUW9uem9C?=
 =?utf-8?B?MG9zTDFxUk9pRTM5QXBUYVFkY2JReGx6QmZ3YUFpb1A1dFo0L01LVTdHSnA5?=
 =?utf-8?B?SUlhNUNzR053NldXTzBUbjlrZGdkUWhQYWEyRitHbkNtekYrYS8xaWxwMDY5?=
 =?utf-8?B?MktXZDJhTDVJU0RyK1ZtUVlzeFkxM2w3MUhaNVp6Yk84N3lTZlhKMDFuMnVB?=
 =?utf-8?B?M0RKN2p5MHVVN1JyTVJwdHNHR3JFN2ZzS0lkYnRmeTd5bmNJRGRaRDlVdUNR?=
 =?utf-8?B?Zm13US9HbXNWUk9PcXRwU0NLdzM5VlFaQ2k4NXgzNTZ4SFJLdGV1cDFWczRU?=
 =?utf-8?B?a2RlN3ZWdmxNQzBmRUcvdUZNYVd3ZjQ2b0M0aU1hajd0Z0Q2ZHdVVE5oNngv?=
 =?utf-8?B?RUZTUlJYSGJ0STZJRjF4MW0wcVluVUJocUNERDY1bGZVaEZXbE1Rc1R6ckNJ?=
 =?utf-8?B?S2Zlb0g5dE4rRDNaczNvcXVhM3FWTytYOUQwK2Ird09CVEpWVklxQzV3aFJi?=
 =?utf-8?B?VHIzNWFaSzRDd05WTXY4eC9zZVpPeU0yeDdTUGp3Q001Q3ZrS2lDV3ZWTFB5?=
 =?utf-8?B?SEwrek5JQmhLdGg1K3YwU3ZwVUhjMEZsVTZ2SURXdVJmeElXcUxQanVVUXQr?=
 =?utf-8?B?YzdFNFZLaW9sd0NtNk41WkgrWnFiaGM5c0V2WThVZmpESW10OWVURGU2cnJC?=
 =?utf-8?B?VG5ENXRkZ253T2dGMWplR2VZcVZzMkUxYkI2am5sNXFnb2piVkVCUDROUjVz?=
 =?utf-8?B?R2ROZnZNb2xXVVlwODZlMDNmZFliaGlXU3BDVlMwN0VXTFhKekZRQVBUbEdT?=
 =?utf-8?B?emlOM01ic0pWZHM0S0pmZFRRQ1JDaEJjQWNhU2JXalJibFByTHdRc3ZzMFlu?=
 =?utf-8?B?cEVmSWwwTzJXYkw2V1V0OHhwNHVKODZtYUFyUHVHdlBtNFE2SXJBbVIzbGZl?=
 =?utf-8?B?TnE1S09oQnlFdzVBUEZsbE9TaEhYNmhHSWVMb1VZL3RaT1kyTlpIamdhNWgz?=
 =?utf-8?B?ckRYVjAzYlZFMXNJaS9GcVI0VHNDSmhXZzlyQVlEL3Z2czZKWVhkNUNwZzJZ?=
 =?utf-8?B?YTNkV0QrK1lEbmhVZERiRldOOGZHa0VIVzVGcmRxTXBEL3Vqd0lDSzVqSVhJ?=
 =?utf-8?B?ZE9kTUJTOFJ2NkFWa1hMMko1cUR2QXhYNGp4cDFqL25pZk5aeVhzdm1YVklh?=
 =?utf-8?B?RjBYWStaTEcvUk0yKytWLy8vKys5c2dRc1JSUi9nQm45L2hDZi9XeVNXK0dS?=
 =?utf-8?B?RTdtZ01QNHB3WlRTZ1pQVHlwSDlXSXdzdkZTbTNOTHJoKysrRmV1Zi9HWmtF?=
 =?utf-8?B?bForUDVHbXFkUVQrdFdMUS9UOVh3UXVIQzdtUmZlOWZ3cEpHVGphRmswMVp0?=
 =?utf-8?B?YWZzeXJGRlhCbFlUcjVGVEN4RkFMTFlucVRTamdzQjdPQkFYWTFtZ3BuVHdx?=
 =?utf-8?B?WTRZS1Y2dnI5UGZ1Z1VNdElqNmpPRzhIdGtmR1A2clVFSWxqU0hpNi9SVmVQ?=
 =?utf-8?B?UisxV2tCVzlNTmR1bHRKSitTcm9Yd3NVYVVPZ3hra09VVVhoY0ZZOTVoMURp?=
 =?utf-8?B?cW5YWWQ4bS9ISElSSlZOWTJmbWluVkU0MjdMU1VwVUp3N1FWQWJiNzEwSmk4?=
 =?utf-8?B?bE9scmw0Z0hPeGxQeWVNdHJsKzNiWG9Na2tJcm5uemtVSDN4OVhKdUJra2RR?=
 =?utf-8?B?c1d0cmJlUkF3SFU5MkNXZW1zSHZHOFU4SGtOak1jU0FRYTIyd0tHWis5Q0t2?=
 =?utf-8?B?a3Q2ay9OdEhzMUpmLzNLYWVXeFI0YjIySitqL1FFeGwzSTNuVHJDZG04QzNI?=
 =?utf-8?B?bzc0WnFhYjMxZFoxSmlLbGZaeHNMUnpxU3pweG9qMU45eVUzMFJTWlFOejFa?=
 =?utf-8?B?OTRMcFkyajNUdEJRTDJDaFE5UHFneFBDMDhSRUFuUHRGbitwYVl2VU9XK0VZ?=
 =?utf-8?B?Ui9Da2lBU3lKQ2lmSjVDZzVEMmxvRlpKSFFtdmVGUzRGb2lXVncvMGdDOE40?=
 =?utf-8?B?ZFFQaXErUk5scjVBQ3ZJM0RoWklHaFYrR1dmbEhRNnZYaU82TkhJeVI4b2Jx?=
 =?utf-8?Q?thwf9DiSFcMlPbCVi58hliJtV?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6E986089CBCB4F4384B13A121614F7C4@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8769.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bd96aec-a632-441e-d443-08dbf34b53c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2023 15:28:25.5966 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RiuNV6CHhNaSP1Q8L+Ad1I/345N67Swj90E3AYXHowqmKFbsLpAr62MVzkjy8WKggPrdgMIkn2gvNguWOBsgkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4452
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

T24gU2F0LCAyMDIzLTEyLTAyIGF0IDIwOjE4ICswNzAwLCBCYWdhcyBTYW5qYXlhIHdyb3RlOg0K
PiANCg0KPiA+IFdoZW4gaSBpbnN0YWxsIHRoZSBwcm9wcmlldGFyeSBOdmlkaWEgZHJpdmVycywg
aSBoYXZlIHRoZSBmb2xsb3dpbmc6DQo+ID4gDQo+ID4gW01BU1RFUl0gcGNpOjAwMDA6MDg6MDAu
MA0KPiA+IMKgwqAgwqDCoMKgwqAgwqAg4pSCIOKUnOKUgC9zeXMvZGV2aWNlcy9wY2kwMDAwOjAw
LzAwMDA6MDA6MDMuMS8wMDAwOjA4OjAwLjAvZHJtL2NhcmQwDQo+ID4gwqDCoCDCoMKgwqDCoCDC
oCDilIIg4pSCIFtNQVNURVJdIGRybTpjYXJkMA0KPiA+IMKgwqAgwqDCoMKgwqAgwqAg4pSCDQo+
ID4g4pSU4pSAL3N5cy9kZXZpY2VzL3BjaTAwMDA6MDAvMDAwMDowMDowMy4xLzAwMDA6MDg6MDAu
MC9kcm0vcmVuZGVyRDEyOA0KPiA+IMKgwqAgwqDCoMKgwqAgwqAg4pSCwqDCoCBkcm06cmVuZGVy
RDEyOA0KPiA+IA0KPiA+IOKUgC9zeXMvZGV2aWNlcy9wbGF0Zm9ybS9lZmktZnJhbWVidWZmZXIu
MC9ncmFwaGljcy9mYjANCj4gPiDCoMKgIMKgwqDCoMKgIMKgIOKUgiBncmFwaGljczpmYjAgIkVG
SSBWR0EiDQo+ID4gDQo+ID4gU28gbm8gVkdBLCBEVkkgb3IgSERNSSBpdGVtcy4NCj4gDQo+IFRo
ZW4gcmVwb3J0IHRvIHRoZSBHaXRIdWIgdHJhY2tlciBbMV0uDQo+IA0KPiBUaGFua3MuDQo+IA0K
PiBbMV06IGh0dHBzOi8vZ2l0aHViLmNvbS9OVklESUEvb3Blbi1ncHUta2VybmVsLW1vZHVsZXMv
aXNzdWVzDQo+IA0KDQpObywgZG8gTk9UIHJlcG9ydCB0aGlzIG9uIHRoZSBHaXRodWIgdHJhY2tl
ciENCg0KVGhhdCBnaXRodWIgdHJhY2tlciBpcyBPTkxZIGZvciBidWdzIHRoYXQgb2NjdXIgd2l0
aCBPcGVuUk0gKHRoZSAiT3BlbiBHUFUNCktlcm5lbCBNb2R1bGUiKSBidXQgbm90IHdpdGggdGhl
IHRoZSBwcm9wcmlldGFyeSBkcml2ZXIuICBJZiB5b3UgaGF2ZSBhIGJ1Zw0Kd2l0aCB0aGUgdGhl
IE52aWRpYSBwcm9wcmlldGFyeSBkcml2ZXIsIHRoYXQgbXVzdCBiZSByZXBvcnRlZCBvbiB0aGUg
TnZpZGlhDQpmb3J1bSBpbnN0ZWFkOiANCg0KaHR0cHM6Ly9mb3J1bXMuZGV2ZWxvcGVyLm52aWRp
YS5jb20vYy9ncHUtZ3JhcGhpY3MvbGludXgvMTQ4DQoNCg==
