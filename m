Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22383F33B8
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 16:47:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 757CA6F729;
	Thu,  7 Nov 2019 15:47:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770084.outbound.protection.outlook.com [40.107.77.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76C126F729;
 Thu,  7 Nov 2019 15:47:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m/D8k3ry9sznb3PqQ7d4PvT2yLd02UB4z8ir0Yh69GN/3mf2UtgtzqQufuImaKQa5nhDZTpLDZwnHbLv4htO7H4FOCPdLcKE2OEJZjtvXZao64qeb3u+3wj6xJJy9PLzFN3YJ5jyvpaNEnTZnDNd8OGbdJ144ck2gIFCrkNmSJhaHvSZ4FQDJihXp4ybWSzIIE0YpjA69BfIuhBg40Of8VBoaG8hzav3bEAtNt/GiJ5pLuw77+lusk90f4SXGm1WPuB6FHZClSfXfEWFfnxpx8kaWhTjGvHUFzJb8lPYlsoYAllbedUou3CjadoC7V5XmRPXyWB66crhNaB+FYJdHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6OfhIXrjX4CQwvccY79Zg0gmb40ARi5XwUU3qHyh0Ws=;
 b=Ergcz3VrKPGZqQtRCW1oEepFlXb/f9bN86YmXmA2ozXJkBiEGZcwNOoFcsFhfCMW9upKqE+t2WCd1WZa79H+QZWqDXIVBCqTt/zAkI68I0g0RoYjTMKOI3mmZxZs85WxHv7KLyUWQMQOX3qRsq2ohykVsaKRyly5+BAAyzZ+s8dCtMaEObzYx6T1vPHUFb/BDnuuLGyr/QFteLO3LGjL9BLIWzeCdVLLMpbvRZ/TILcmFmV7SzPQ2YEIbVF5VhZTNRTUnuvrvQpX/oWr2Y5kq+3qt9OH0zXsc3h86L2dDVrAVEcGqfibCETfDar4AqtIV/6qD8sdTJTXzEeTjDA5Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB2856.namprd12.prod.outlook.com (20.179.93.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.22; Thu, 7 Nov 2019 15:47:25 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::f950:f7be:9139:7c26]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::f950:f7be:9139:7c26%7]) with mapi id 15.20.2408.025; Thu, 7 Nov 2019
 15:47:25 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: =?utf-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 01/12] drm: Inline drm_color_lut_extract()
Thread-Topic: [PATCH 01/12] drm: Inline drm_color_lut_extract()
Thread-Index: AQHVlX59RomI2LmlmkGSSsApDGSLHqd/ggaAgABXEwCAAAEygA==
Date: Thu, 7 Nov 2019 15:47:24 +0000
Message-ID: <2f7a643e-b036-fb5a-cf2e-2792f5d36115@amd.com>
References: <20191107151725.10507-1-ville.syrjala@linux.intel.com>
 <20191107151725.10507-2-ville.syrjala@linux.intel.com>
 <79b85116-1a88-5a2d-a1ea-46836a67bfa2@amd.com>
 <20191107154304.GD1208@intel.com>
In-Reply-To: <20191107154304.GD1208@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0066.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::43) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 224b4ebe-d3b5-4622-c31c-08d76399c8d3
x-ms-traffictypediagnostic: BYAPR12MB2856:
x-microsoft-antispam-prvs: <BYAPR12MB28568FD0CD790C94841B7204EC780@BYAPR12MB2856.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0214EB3F68
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(39860400002)(136003)(346002)(366004)(199004)(189003)(229853002)(305945005)(86362001)(8936002)(31696002)(36756003)(8676002)(5660300002)(81166006)(66066001)(54906003)(6116002)(66574012)(99286004)(14454004)(3846002)(316002)(64756008)(66946007)(4326008)(66446008)(66556008)(66476007)(71190400001)(6436002)(446003)(256004)(6916009)(6486002)(6246003)(486006)(81156014)(71200400001)(186003)(11346002)(2616005)(476003)(7736002)(76176011)(6506007)(386003)(2906002)(25786009)(31686004)(53546011)(52116002)(478600001)(102836004)(6512007)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2856;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3Q/V2w6C+xMoEPjqlWXnFMP6ea7aBRb8viVK3moJ1I3o43/oHQt194vsj+UV+63DNpIsI2cEpu0V4OKjj1BJLccQzy/WMZPONRw5rTOTDA8B/eCwEkjPTbpZOE1NZpsKDIFvpVkdJ8rGmuyf0ksdstVknzbaPKy1rvFQh9cw+cTcHayzTVjA9/BFpF28QROG4OnLTXyQkcyONA0jwDCzGljKPJpZhSMOwtIHwPk+iZuZgf4hi+LDBBP6nrwZFbXJzwpFQdVG2pLS4ALeLXuWBRwekm8YXHXgEU2Hht55xIPslFEmwzKXsHui7dIDvQPqroYR0TScmsgC6D0pI1KMGlHEO759UZWCUGCrKAr8dbEAARU8joXXFXAgtfvI7hCckEmx8Sny6MYB4c9OIeerPAAwAglrcIH1CaTopmrDNrW7jRhHsWOb0M5hXfXrd2ub
x-ms-exchange-transport-forked: True
Content-ID: <8138363074E47647BB8B656B3CB91717@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 224b4ebe-d3b5-4622-c31c-08d76399c8d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2019 15:47:24.8570 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P8zoUp4IO92hESswYYVg777KPOYxVUPU6Ibzuf0xFkmI7PPN42C28TuexQ2L2gFix49cMneXYQEqxq6LMbRS0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2856
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6OfhIXrjX4CQwvccY79Zg0gmb40ARi5XwUU3qHyh0Ws=;
 b=apM7C6SewFHR51mvPCqKsg2BOvKfHWsRfaItTKvANAA/nl43070fSDEvQS3Z3+h61BLSygQRy/EzK5h8C+Xuq+SNPbfLnumud+YGmWigItDQUA7aDSYZtERC0ZcCB460te7xWvplIIdnfJZw0HE/+7K/pbf95vFkR5YDKwo1Zrc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nicholas.Kazlauskas@amd.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Swati Sharma <swati2.sharma@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0xMS0wNyAxMDo0MyBhLm0uLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6DQo+IE9uIFRo
dSwgTm92IDA3LCAyMDE5IGF0IDAzOjMxOjI4UE0gKzAwMDAsIEthemxhdXNrYXMsIE5pY2hvbGFz
IHdyb3RlOg0KPj4gT24gMjAxOS0xMS0wNyAxMDoxNyBhLm0uLCBWaWxsZSBTeXJqYWxhIHdyb3Rl
Og0KPj4+IEZyb206IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5j
b20+DQo+Pj4NCj4+PiBUaGlzIHRoaW5nIGNhbiBnZXQgY2FsbGVkIHNldmVyYWwgdGhvdXNhbmQg
dGltZXMgcGVyIExVVA0KPj4+IHNvIHNlZW1zIGxpa2Ugd2Ugd2FudCB0byBpbmxpbmUgaXQgdG86
DQo+Pj4gLSBhdm9pZCB0aGUgZnVuY3Rpb24gY2FsbCBvdmVyaGVhZA0KPj4+IC0gYWxsb3cgY29u
c3RhbnQgZm9sZGluZw0KPj4+DQo+Pj4gQSBxdWljayBzeW50aGV0aWMgdGVzdCAody9vIGFueSBo
YXJkd2FyZSBpbnRlcmFjdGlvbikgd2l0aA0KPj4+IGEgcmlkaWN1bG91c2x5IGxhcmdlIExVVCBz
aXplIHNob3dzIGFib3V0IDUwJSByZWR1Y3Rpb24gaW4NCj4+PiBydW50aW1lIG9uIG15IEhTVyBh
bmQgQlNXIGJveGVzLiBTbGlnaHRseSBsZXNzIHdpdGggbW9yZQ0KPj4+IHJlYXNvbmFibGUgTFVU
IHNpemUgYnV0IHN0aWxsIGVhc2lseSBtZWFzdXJhYmxlIGluIHRlbnMNCj4+PiBvZiBtaWNyb3Nl
Y29uZHMuDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5
cmphbGFAbGludXguaW50ZWwuY29tPg0KPj4NCj4+IFJldmlld2VkLWJ5OiBOaWNob2xhcyBLYXps
YXVza2FzIDxuaWNob2xhcy5rYXpsYXVza2FzQGFtZC5jb20+DQo+Pg0KPj4gU2VlbXMgcmVhc29u
YWJsZSB0byBtZS4gSXQgd291bGQgcHJvYmFibHkgbWFrZSBzZW5zZSB0byBldmVuIHNwbGl0IHRo
aXMNCj4+IGZ1cnRoZXIgaW50byB0d28gZnVuY3Rpb25zLCBvbmUgZm9yIGhpZ2ggcHJlY2lzaW9u
IGFuZCBvbmUgZm9yIGxvdw0KPj4gcHJlY2lzaW9uIHNvIGl0J3MgcHVyZWx5IGEgY2FsY3VsYXRp
b24gYW5kIG5vdCBoaXR0aW5nIGFueSBicmFuY2hlcy4NCj4gDQo+IENvbnN0YW50IGZvbGRpbmcg
Z2V0cyByaWQgb2YgaXQuDQoNCkkgcmVhbGl6ZWQgYWZ0ZXIgc2VuZGluZyB0aGF0IGVtYWlsIHRo
YXQgbW92aW5nIHRoaXMgdG8gaW5saW5lIGlzIA0KcHJvYmFibHkgYWxsb3dpbmcgdGhlIGNvbXBp
bGVyIHRvIG9wdGltaXplIHRoaXMgb3V0IGFuZCBnaXZlIHlvdSB0aGF0IA0KbGFyZ2Ugc3BlZWR1
cCBpbiB0aGUgZmlyc3QgcGxhY2UuIFRob3VnaCBicmFuY2ggcHJlZGljdGlvbiBwcm9iYWJseSAN
CmhlbHBlZCBjdXQgZG93biBvbiB0aGUgY29zdCBldmVuIHdoZW4gaXQgd2Fzbid0IGlubGluZS4N
Cg0KVGhpcyBpcyBmaW5lIGFzIGlzIHRoZW4sIHRoYW5rcy4NCg0KTmljaG9sYXMgS2F6bGF1c2th
cw0KDQo+IA0KPj4NCj4+IE5pY2hvbGFzIEthemxhdXNrYXMNCj4+DQo+Pj4gLS0tDQo+Pj4gICAg
ZHJpdmVycy9ncHUvZHJtL2RybV9jb2xvcl9tZ210LmMgfCAyNCAtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0NCj4+PiAgICBpbmNsdWRlL2RybS9kcm1fY29sb3JfbWdtdC5oICAgICB8IDIzICsrKysr
KysrKysrKysrKysrKysrKystDQo+Pj4gICAgMiBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25z
KCspLCAyNSBkZWxldGlvbnMoLSkNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX2NvbG9yX21nbXQuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29sb3JfbWdtdC5jDQo+
Pj4gaW5kZXggNGNlNWM2ZDhkZTk5Li4xOWM1ZjYzNTk5MmEgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2RybV9jb2xvcl9tZ210LmMNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2NvbG9yX21nbXQuYw0KPj4+IEBAIC0xMDgsMzAgKzEwOCw2IEBADQo+Pj4gICAgICogCXN0
YW5kYXJkIGVudW0gdmFsdWVzIHN1cHBvcnRlZCBieSB0aGUgRFJNIHBsYW5lLg0KPj4+ICAgICAq
Lw0KPj4+ICAgIA0KPj4+IC0vKioNCj4+PiAtICogZHJtX2NvbG9yX2x1dF9leHRyYWN0IC0gY2xh
bXAgYW5kIHJvdW5kIExVVCBlbnRyaWVzDQo+Pj4gLSAqIEB1c2VyX2lucHV0OiBpbnB1dCB2YWx1
ZQ0KPj4+IC0gKiBAYml0X3ByZWNpc2lvbjogbnVtYmVyIG9mIGJpdHMgdGhlIGh3IExVVCBzdXBw
b3J0cw0KPj4+IC0gKg0KPj4+IC0gKiBFeHRyYWN0IGEgZGVnYW1tYS9nYW1tYSBMVVQgdmFsdWUg
cHJvdmlkZWQgYnkgdXNlciAoaW4gdGhlIGZvcm0gb2YNCj4+PiAtICogJmRybV9jb2xvcl9sdXQg
ZW50cmllcykgYW5kIHJvdW5kIGl0IHRvIHRoZSBwcmVjaXNpb24gc3VwcG9ydGVkIGJ5IHRoZQ0K
Pj4+IC0gKiBoYXJkd2FyZS4NCj4+PiAtICovDQo+Pj4gLXVpbnQzMl90IGRybV9jb2xvcl9sdXRf
ZXh0cmFjdCh1aW50MzJfdCB1c2VyX2lucHV0LCB1aW50MzJfdCBiaXRfcHJlY2lzaW9uKQ0KPj4+
IC17DQo+Pj4gLQl1aW50MzJfdCB2YWwgPSB1c2VyX2lucHV0Ow0KPj4+IC0JdWludDMyX3QgbWF4
ID0gMHhmZmZmID4+ICgxNiAtIGJpdF9wcmVjaXNpb24pOw0KPj4+IC0NCj4+PiAtCS8qIFJvdW5k
IG9ubHkgaWYgd2UncmUgbm90IHVzaW5nIGZ1bGwgcHJlY2lzaW9uLiAqLw0KPj4+IC0JaWYgKGJp
dF9wcmVjaXNpb24gPCAxNikgew0KPj4+IC0JCXZhbCArPSAxVUwgPDwgKDE2IC0gYml0X3ByZWNp
c2lvbiAtIDEpOw0KPj4+IC0JCXZhbCA+Pj0gMTYgLSBiaXRfcHJlY2lzaW9uOw0KPj4+IC0JfQ0K
Pj4+IC0NCj4+PiAtCXJldHVybiBjbGFtcF92YWwodmFsLCAwLCBtYXgpOw0KPj4+IC19DQo+Pj4g
LUVYUE9SVF9TWU1CT0woZHJtX2NvbG9yX2x1dF9leHRyYWN0KTsNCj4+PiAtDQo+Pj4gICAgLyoq
DQo+Pj4gICAgICogZHJtX2NydGNfZW5hYmxlX2NvbG9yX21nbXQgLSBlbmFibGUgY29sb3IgbWFu
YWdlbWVudCBwcm9wZXJ0aWVzDQo+Pj4gICAgICogQGNydGM6IERSTSBDUlRDDQo+Pj4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvZHJtL2RybV9jb2xvcl9tZ210LmggYi9pbmNsdWRlL2RybS9kcm1fY29s
b3JfbWdtdC5oDQo+Pj4gaW5kZXggZDFjNjYyZDkyYWI3Li4wNjliMjFkNjE4NzEgMTAwNjQ0DQo+
Pj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2NvbG9yX21nbXQuaA0KPj4+ICsrKyBiL2luY2x1ZGUv
ZHJtL2RybV9jb2xvcl9tZ210LmgNCj4+PiBAQCAtMjksNyArMjksMjggQEANCj4+PiAgICBzdHJ1
Y3QgZHJtX2NydGM7DQo+Pj4gICAgc3RydWN0IGRybV9wbGFuZTsNCj4+PiAgICANCj4+PiAtdWlu
dDMyX3QgZHJtX2NvbG9yX2x1dF9leHRyYWN0KHVpbnQzMl90IHVzZXJfaW5wdXQsIHVpbnQzMl90
IGJpdF9wcmVjaXNpb24pOw0KPj4+ICsvKioNCj4+PiArICogZHJtX2NvbG9yX2x1dF9leHRyYWN0
IC0gY2xhbXAgYW5kIHJvdW5kIExVVCBlbnRyaWVzDQo+Pj4gKyAqIEB1c2VyX2lucHV0OiBpbnB1
dCB2YWx1ZQ0KPj4+ICsgKiBAYml0X3ByZWNpc2lvbjogbnVtYmVyIG9mIGJpdHMgdGhlIGh3IExV
VCBzdXBwb3J0cw0KPj4+ICsgKg0KPj4+ICsgKiBFeHRyYWN0IGEgZGVnYW1tYS9nYW1tYSBMVVQg
dmFsdWUgcHJvdmlkZWQgYnkgdXNlciAoaW4gdGhlIGZvcm0gb2YNCj4+PiArICogJmRybV9jb2xv
cl9sdXQgZW50cmllcykgYW5kIHJvdW5kIGl0IHRvIHRoZSBwcmVjaXNpb24gc3VwcG9ydGVkIGJ5
IHRoZQ0KPj4+ICsgKiBoYXJkd2FyZS4NCj4+PiArICovDQo+Pj4gK3N0YXRpYyBpbmxpbmUgdTMy
IGRybV9jb2xvcl9sdXRfZXh0cmFjdCh1MzIgdXNlcl9pbnB1dCwgaW50IGJpdF9wcmVjaXNpb24p
DQo+Pj4gK3sNCj4+PiArCXUzMiB2YWwgPSB1c2VyX2lucHV0Ow0KPj4+ICsJdTMyIG1heCA9IDB4
ZmZmZiA+PiAoMTYgLSBiaXRfcHJlY2lzaW9uKTsNCj4+PiArDQo+Pj4gKwkvKiBSb3VuZCBvbmx5
IGlmIHdlJ3JlIG5vdCB1c2luZyBmdWxsIHByZWNpc2lvbi4gKi8NCj4+PiArCWlmIChiaXRfcHJl
Y2lzaW9uIDwgMTYpIHsNCj4+PiArCQl2YWwgKz0gMVVMIDw8ICgxNiAtIGJpdF9wcmVjaXNpb24g
LSAxKTsNCj4+PiArCQl2YWwgPj49IDE2IC0gYml0X3ByZWNpc2lvbjsNCj4+PiArCX0NCj4+PiAr
DQo+Pj4gKwlyZXR1cm4gY2xhbXBfdmFsKHZhbCwgMCwgbWF4KTsNCj4+PiArfQ0KPj4+ICAgIA0K
Pj4+ICAgIHZvaWQgZHJtX2NydGNfZW5hYmxlX2NvbG9yX21nbXQoc3RydWN0IGRybV9jcnRjICpj
cnRjLA0KPj4+ICAgIAkJCQl1aW50IGRlZ2FtbWFfbHV0X3NpemUsDQo+Pj4NCj4+DQo+IA0KDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
