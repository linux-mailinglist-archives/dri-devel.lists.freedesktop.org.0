Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2BA2C8F7F
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 21:56:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1E9B6E841;
	Mon, 30 Nov 2020 20:56:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2056.outbound.protection.outlook.com [40.107.93.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50D586E841
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 20:56:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OQbvq9mg8C1he47hMgPkXvkEAlKi/vfPToDkwOghRHHDdJvMZ1IWhMmJewlL4Af94MFXykXHkryKKUL2MSDXARXu2LYRZRXKltIEvrKqrI9Qn7aVUkadXZMZCLTWO1za3pGbfswA8DQM1pYTVd7bACI+imOcGpq9qm3LprF9ktbjNw53nf54Ao3NObC96JOW3koNXMHAjmNMuJTaKBFGn3s8jxwdZV3ZnxxS/Weml+cAUIPeG23Pfru3DzUjYIrUfo9FrWMZILyY+khhU+GrnVHOFCt6eq9noFtPI65uwDH57RSShIb7t6vpsQSEwvzch+59R+IVoDyVCJM565++jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WR9DOzlOVzbA/RX/UzUwyTu4WtDeYSPUt+7nxwW0AVg=;
 b=E1hFScRv3xnckfY1vKU5zBCNPo4sttY54ndXRHR+OdVn3x146GDB9uBJIYT0rimJ62P0AOLyEQDGIRAOEXTpZzSSeSWsgdmTf5HdncVb+FWnYB9lAUdxHGHgmQU3f2oXJw/ci5ccSJBywjWZHXJU3Nr9MXHeq98twSGl3Q1Vy8DRi7/8LMyDvr8NIKWFAz5M9J/f+xMLnGn9U6ukLH29V5e5k6okSa1Id4TomBW2Sz/MBrr+iXAVuREeiclHygpBBMe8lu0Y6SJlzV3qYWkozK2rZrgRwIZoPfJAOuvoJgLNIYhWwpDHG3VAFqbz8EpI7zT3lUXftFBGNMLerdMIHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WR9DOzlOVzbA/RX/UzUwyTu4WtDeYSPUt+7nxwW0AVg=;
 b=YQFcxFrIzmi8OplpsY6IgxuNYzQMCumt5HLqEXpD1f2nMA41cmz/xhgz5XKO3Q1gijFMO0a3PcWg2wjZd55BzztnTTo4OoRdXSpTHylEcRmUcsyKjz7dwQGjwKrZmg/JdnA8gKKFDVaSW6BPogfUL+DGh3rRivEmj5IlUWQXbMk=
Received: from BL0PR05MB5186.namprd05.prod.outlook.com (2603:10b6:208:8f::18)
 by MN2PR05MB6798.namprd05.prod.outlook.com (2603:10b6:208:184::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.7; Mon, 30 Nov
 2020 20:56:13 +0000
Received: from BL0PR05MB5186.namprd05.prod.outlook.com
 ([fe80::59ed:18ca:252d:72f6]) by BL0PR05MB5186.namprd05.prod.outlook.com
 ([fe80::59ed:18ca:252d:72f6%7]) with mapi id 15.20.3632.016; Mon, 30 Nov 2020
 20:56:13 +0000
From: Zack Rusin <zackr@vmware.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 4/7] drm/vmwgfx: switch to ttm_sg_tt_init
Thread-Topic: [PATCH 4/7] drm/vmwgfx: switch to ttm_sg_tt_init
Thread-Index: AQHWwyrUPKFZMl6x6kuQj+ALUmb5v6nhMCIA
Date: Mon, 30 Nov 2020 20:56:13 +0000
Message-ID: <F507E112-DA9E-40EB-875E-C7B28751B2C8@vmware.com>
References: <20201125125919.1372-1-christian.koenig@amd.com>
 <20201125125919.1372-4-christian.koenig@amd.com>
In-Reply-To: <20201125125919.1372-4-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.4)
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=vmware.com;
x-originating-ip: [71.175.59.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bb492c53-15d6-4487-701d-08d895725f8b
x-ms-traffictypediagnostic: MN2PR05MB6798:
x-microsoft-antispam-prvs: <MN2PR05MB679852BCBCCBD43B291C607ACEF50@MN2PR05MB6798.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nyByeMsS6pJs6RaTcmyrjY0aqK62+q7pqswCcxwH5vKg1fwKj7g2u9Wb0n53CYSkrCFuab+IRga75wozF5CLp66q/W98QBS3to7T3sEvtuaKamRSvR7LbSOub0Nj4hE942krWHWjQ+pif4gDJeSYdBl5xRu5+v0RUnMROr1dw0d3K8byNEkCXBNvZJVaBMhCoxTFMmFuuCcoRDipnDpxCF85jcdpzTpK93merAFH3GMA4F7IFG8PqizK1rrVdlE7b4EbcRTzRfrpmzJ14vTzep3Zi4ED+NuWBo1bE7nRzFaXwsi3WMRj19Qz9O9lpQMFvyLKNcvsAcmsjtHRx8dgEw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR05MB5186.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(376002)(346002)(39860400002)(83380400001)(33656002)(4326008)(26005)(316002)(186003)(6512007)(71200400001)(478600001)(6486002)(36756003)(66446008)(66476007)(66556008)(64756008)(8936002)(2906002)(6916009)(8676002)(5660300002)(6506007)(53546011)(66946007)(76116006)(2616005)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?KzFFOFBLN3ZUQldvMjRwWXFVWUZVOUxRc0RCd1RHREh2Sy9Wc1dKeFcyQnA0?=
 =?utf-8?B?MnN0bmV3VDZWZ1FyeWJNcGx5ekhzdkpEWitITGwwVFdkQlNLSnhHcGgvL1pG?=
 =?utf-8?B?cytYU2pXSzV1QVNxUk11cnkzNUxYcjljK2hPZXJtTTh4RW8vOFNVRU9HY1kw?=
 =?utf-8?B?ZCtaWnhYdlNFZEJPbGJYTmZWS2hQUkROTllSSDlCMENFL01CY0lTbXB2ZnBH?=
 =?utf-8?B?ZDY5RkkyeWVSVmVKbHV0QWlLdE8ydm9pbGJUdFZLdTVzTG1aY1M4V29oQ3Fh?=
 =?utf-8?B?cjgzSkg4TFltdjdGRGYwenpKNktXeURRRFpocHhqcVNmTnN3ZzJhd29SSU4r?=
 =?utf-8?B?alNBeENNNVd6RkZEZ3I3dU9WTGFNdXkreGQ0MkFyM3B0STkrL3FHV01KYytZ?=
 =?utf-8?B?cjJYT2p3aEw2cjVFOVdBb3Z6WUNRbk5kaDE3RThDWjA3T1RTeCs5NzBaRTlN?=
 =?utf-8?B?SjVxTXdOYXBITGc0cnRsVkFzQTI4L0s3WXgyMkl0Vko5MnRpTUtZQU90QkNy?=
 =?utf-8?B?SzV6TDlpZzF6SERkNGx6ZE9udG9qV3Q3dzM4VExSc29ZRzBlc0krTlRDYXU4?=
 =?utf-8?B?eDhDcEhKNFd0ZGg0cUtCTkVXYk5zdk1STXlOYllMVUtYclNnLzZObjdab3lM?=
 =?utf-8?B?M05WTXlRaXhrSDdEU0x0RXB3eTJGS0ZKVUZsZHk1RCtsMDc1SER4L2hYK2tn?=
 =?utf-8?B?YUVQK2dCbnkwQkMrU3premVxQ2hjbnl0UDdFOEc3bDZtNmgvd1pEOFc0SE55?=
 =?utf-8?B?aWt5UHZmLy9HNHgrV2VmTFpzNWtTQ3ZMYWEvYyszQTZ1anRTR2VFMDE0Vyty?=
 =?utf-8?B?Vkl5V1M5WGRPaFdyazd1MzZwQ2ZaVW1BK01GVXY0eWEzL2hTeUxjMTlHZnAw?=
 =?utf-8?B?bmZSMFJlSGNZQnA0c2UwS2sraHllajYzSkFaSmpOQ1B4YUFSRll4L0diWmh5?=
 =?utf-8?B?Y2w3VENpUi80OGw0SEVMZ2lYNFh5KzRQaktoNHdadWhmQndOc1lHMEwycDlT?=
 =?utf-8?B?UHVLdmR3b0VBUkhxZHc5M3pSKzV0YkZETkpCNHJ1QmFZUDdJZGwrVEk5b1lq?=
 =?utf-8?B?eGRWQzFoYkNSRjE5ZWNTVkJWdk5Oby9MTDFiNmVtZ2x4SDRJd2JqSmlwTWRG?=
 =?utf-8?B?dVhrSDQwRC94Y2o0TnNzTG1NRnRic3djSUtHRjd6cWhrMER2Ym83eUp1TDkr?=
 =?utf-8?B?NFh4azJnN0RZdENOODNPbmtjUDJhU2RwQzByUG16cG85cmNwZytMb1F0b2Ns?=
 =?utf-8?B?c1hDYzhVb2xvbU9PN3Y5SThpUmZ4bE1CcVY2T3ArTEoxSnQvSXNFOHNZTkFD?=
 =?utf-8?Q?+Xl6kvaDWLGFYx1n8S4gIe2EGYvHNHsJi2?=
x-ms-exchange-transport-forked: True
Content-ID: <43273A47B60E134BB6882B6C1BAF1D9A@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR05MB5186.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb492c53-15d6-4487-701d-08d895725f8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2020 20:56:13.3599 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6J/gP0B/ViqvfPQCEnyxQj6neNabEqHDeGeFMROT0MLdNPKrPmW3UHVrd6EBEy4bCCwz99ZueWW8582MvxRXkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6798
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gT24gTm92IDI1LCAyMDIwLCBhdCAwNzo1OSwgQ2hyaXN0aWFuIEvDtm5pZyA8Y2tvZW5p
Zy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOg0KPiANCj4gQWNjb3JkaW5nIHRvIERh
bmllbCBWTVdHRlggZG9lc24ndCBzdXBwb3J0IERNQS1idWYgYW55d2F5Lg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPiAt
LS0NCj4gZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfdHRtX2J1ZmZlci5jIHwgNCArKy0t
DQo+IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfdHRtX2J1ZmZlci5j
IGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfdHRtX2J1ZmZlci5jDQo+IGluZGV4IDZh
MDQyNjFjZTc2MC4uMWM3NWY3MzUzOGMwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
dm13Z2Z4L3Ztd2dmeF90dG1fYnVmZmVyLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dm
eC92bXdnZnhfdHRtX2J1ZmZlci5jDQo+IEBAIC02MTEsOCArNjExLDggQEAgc3RhdGljIHN0cnVj
dCB0dG1fdHQgKnZtd190dG1fdHRfY3JlYXRlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8s
DQo+IAl2bXdfYmUtPm1vYiA9IE5VTEw7DQo+IA0KPiAJaWYgKHZtd19iZS0+ZGV2X3ByaXYtPm1h
cF9tb2RlID09IHZtd19kbWFfYWxsb2NfY29oZXJlbnQpDQo+IC0JCXJldCA9IHR0bV9kbWFfdHRf
aW5pdCgmdm13X2JlLT5kbWFfdHRtLCBibywgcGFnZV9mbGFncywNCj4gLQkJCQkgICAgICB0dG1f
Y2FjaGVkKTsNCj4gKwkJcmV0ID0gdHRtX3NnX3R0X2luaXQoJnZtd19iZS0+ZG1hX3R0bSwgYm8s
IHBhZ2VfZmxhZ3MsDQo+ICsJCQkJICAgICB0dG1fY2FjaGVkKTsNCj4gCWVsc2UNCj4gCQlyZXQg
PSB0dG1fdHRfaW5pdCgmdm13X2JlLT5kbWFfdHRtLCBibywgcGFnZV9mbGFncywNCj4gCQkJCSAg
dHRtX2NhY2hlZCk7DQoNCkEgbGl0dGxlIGJpdCBtb3JlIGluZm8gd291bGQgYmUgbXVjaCBhcHBy
ZWNpYXRlZCwgaXTigJlzIGhhcmQgdG8gdGVsbCBmcm9tIHRoZSBtZXNzYWdlIGxvZyB3aGF04oCZ
cyBnb2luZyBvbi4gSXMgdGhlIGFzc3VtcHRpb24gdGhhdCBzaW5jZSB2bXdnZnggZG9lc27igJl0
IHN1cHBvcnQgZG1hYnVmIGl0IHdpbGwgbmV2ZXIgdXNlIHR0bV9ib190eXBlX3NnIG9yIFRUTV9Q
QUdFX0ZMQUdfU0cgYW5kIHR0bV9zZ190dF9pbml0IHdpbGwgc3RpbGwgZW5kdXAgY2FsbGluZyB0
dG1fZG1hX3R0X2FsbG9jX3BhZ2VfZGlyZWN0b3J5IHRvIHNldHVwIHRoZSB0dG1fdHQ6OnBhZ2Vz
Pw0KDQpJZiBzbzoNClJldmlld2VkLWJ5OiBaYWNrIFJ1c2luIDx6YWNrckB2bXdhcmUuY29tPg0K
DQp6DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
