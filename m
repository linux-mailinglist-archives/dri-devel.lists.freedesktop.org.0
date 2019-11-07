Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C023F331D
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 16:31:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B07EF6F6FA;
	Thu,  7 Nov 2019 15:31:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740084.outbound.protection.outlook.com [40.107.74.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15B196F6FA;
 Thu,  7 Nov 2019 15:31:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=itnVfE/oe073r20jW1p3xvzJtoUXyQdveDycp88plSmXi76T8QtvbxM2qZ4NthTGX8vLlkmN6yd0Ic8BgFSh7GBhtpiC+EfLw8eilWTDjRbwlPy36OWcv7dBu52skhMHJESLEy0v5DjbVvOWvahG4dB3CCU88ShQNx8oWC98vmoRgtxaA2jiqmy50g1lmVxfeCsS5v6ugreUDfiIobOxY1h/dr88tJkQSPCUNIoODLK/n+Mk4wobtR3WT2+nYDe+T7tbcsKdhnnQa7EDbxoVGciH9WthvW/F9wzn7HYvddsSFoBDAF3b6gf0rsEnBKBBfxfOvDfYjj44cBvNUsg6iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qALgm3bzbmy2i1nPhvscZAe2skZCXeH9tkGj3VheKBc=;
 b=AASj0NmZjIBsIRX/6uH7qTfX9h1Q7vBnO3D34ruaIF56EYlKwPnbaO86k+/uS2uRXpLYO1GCYwTCtwuUouf/WeAm954l9x9j4AdWhY1xVre+f2cuoU7FpBI4igk1zkyhs/jUSD1JEeukkmBuLFtKSmhdJ1W6UR+RNBxiEAu5afdU6A3i86f855crmyhSf1QM6AY4GdaeVsDTd8JK19Z237Jzp2fcMh2NqacQe777wywYg57LbPeVBKduZU/LcfCHpkCGoi+FCu9bKYvEKvcZFhJ6b5MFBPvU24bAWt9M4SgInFCAgZ0YOfG5+hBJKWxlJV39J9YLhyoVesicfQFumg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB3271.namprd12.prod.outlook.com (20.179.93.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Thu, 7 Nov 2019 15:31:28 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::f950:f7be:9139:7c26]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::f950:f7be:9139:7c26%7]) with mapi id 15.20.2408.025; Thu, 7 Nov 2019
 15:31:28 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 01/12] drm: Inline drm_color_lut_extract()
Thread-Topic: [PATCH 01/12] drm: Inline drm_color_lut_extract()
Thread-Index: AQHVlX59RomI2LmlmkGSSsApDGSLHqd/1deA
Date: Thu, 7 Nov 2019 15:31:28 +0000
Message-ID: <79b85116-1a88-5a2d-a1ea-46836a67bfa2@amd.com>
References: <20191107151725.10507-1-ville.syrjala@linux.intel.com>
 <20191107151725.10507-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20191107151725.10507-2-ville.syrjala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0058.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::35) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 06a1e4f1-8c42-4628-feee-08d763978eb5
x-ms-traffictypediagnostic: BYAPR12MB3271:
x-microsoft-antispam-prvs: <BYAPR12MB32717EECB3AC5A0B2EBC2470EC780@BYAPR12MB3271.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0214EB3F68
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(39860400002)(396003)(346002)(366004)(189003)(199004)(25786009)(3846002)(8676002)(486006)(7736002)(54906003)(446003)(6116002)(99286004)(229853002)(11346002)(110136005)(305945005)(316002)(476003)(2616005)(5660300002)(6512007)(71200400001)(4326008)(71190400001)(6246003)(8936002)(81166006)(6486002)(6506007)(256004)(2501003)(31696002)(386003)(66066001)(31686004)(2906002)(26005)(66556008)(14454004)(102836004)(64756008)(66946007)(66446008)(478600001)(86362001)(36756003)(66476007)(76176011)(186003)(52116002)(6436002)(81156014)(53546011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3271;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vMjxnHFE+PAtexgiuf50SAoxMrhxV91qaxcCqkosC4Rl55vELkDd42PRqIE0WUyflp+iBbpFrkFWijakhurDJnw4q1AvBcd6EnPTRasWkynmcqYnlp+W7hQqz9doMk6CICNuoZ6i/NcuY/4EpLFjt4UA2SDbf0HAfGqFQvP+BFZkEbTu8RALpUAS2Lt/Z24nlY2mDtnqRGpDpRJ6f6l4uW/3QMlwhCNfxL0MLGG9b1M5TNYsMvkqzFtZdUv5cFr+tG6kD11zhMtunkES5SLKzcNJJU08H8sJ3kS4CVj2r99a1GbqsmjSZgWORjPn4jKsex0FWbe+RwQtjRtj0jgpMqS+F94bKsb4T3n3uY7+0o9Tc9eBlf+uoVaHXIaTmcePv3FhP7vwkhPQQZ2TqVYMmzJciHcujCn/cVOsEe1WYtQJrjYIk4G317ny1X2q/uZI
x-ms-exchange-transport-forked: True
Content-ID: <F62B5231567C68488E5DD5F5E3916D98@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06a1e4f1-8c42-4628-feee-08d763978eb5
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2019 15:31:28.4696 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YfFu27WsT1PuX98uQSNfQwreV2gLMsQCxu2yzhRD7vBSmo4RfnXlvxn39EDAQrjc7W6RgtcVfySSeL6K/yN8PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3271
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qALgm3bzbmy2i1nPhvscZAe2skZCXeH9tkGj3VheKBc=;
 b=a7NNgd0lG3sseuv7qTXgf7+WQjXpu2P2dUvQzWYEY5AxCwNei0FybNbFLpv/3v5Kis93fZOllK2CvfzP4jvV//1hOKGpJ0RNX8UkzW1ojZ1fjz5KCzNZcOjrSYJHLb3B5mvwc5E2FKA8pvsf/pCfiTb1XYnouTsmi2FCsEgyg8c=
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Swati Sharma <swati2.sharma@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0xMS0wNyAxMDoxNyBhLm0uLCBWaWxsZSBTeXJqYWxhIHdyb3RlOg0KPiBGcm9tOiBW
aWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0KPiANCj4gVGhp
cyB0aGluZyBjYW4gZ2V0IGNhbGxlZCBzZXZlcmFsIHRob3VzYW5kIHRpbWVzIHBlciBMVVQNCj4g
c28gc2VlbXMgbGlrZSB3ZSB3YW50IHRvIGlubGluZSBpdCB0bzoNCj4gLSBhdm9pZCB0aGUgZnVu
Y3Rpb24gY2FsbCBvdmVyaGVhZA0KPiAtIGFsbG93IGNvbnN0YW50IGZvbGRpbmcNCj4gDQo+IEEg
cXVpY2sgc3ludGhldGljIHRlc3QgKHcvbyBhbnkgaGFyZHdhcmUgaW50ZXJhY3Rpb24pIHdpdGgN
Cj4gYSByaWRpY3Vsb3VzbHkgbGFyZ2UgTFVUIHNpemUgc2hvd3MgYWJvdXQgNTAlIHJlZHVjdGlv
biBpbg0KPiBydW50aW1lIG9uIG15IEhTVyBhbmQgQlNXIGJveGVzLiBTbGlnaHRseSBsZXNzIHdp
dGggbW9yZQ0KPiByZWFzb25hYmxlIExVVCBzaXplIGJ1dCBzdGlsbCBlYXNpbHkgbWVhc3VyYWJs
ZSBpbiB0ZW5zDQo+IG9mIG1pY3Jvc2Vjb25kcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+DQoNClJldmlld2VkLWJ5
OiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5rYXpsYXVza2FzQGFtZC5jb20+DQoNClNl
ZW1zIHJlYXNvbmFibGUgdG8gbWUuIEl0IHdvdWxkIHByb2JhYmx5IG1ha2Ugc2Vuc2UgdG8gZXZl
biBzcGxpdCB0aGlzIA0KZnVydGhlciBpbnRvIHR3byBmdW5jdGlvbnMsIG9uZSBmb3IgaGlnaCBw
cmVjaXNpb24gYW5kIG9uZSBmb3IgbG93IA0KcHJlY2lzaW9uIHNvIGl0J3MgcHVyZWx5IGEgY2Fs
Y3VsYXRpb24gYW5kIG5vdCBoaXR0aW5nIGFueSBicmFuY2hlcy4NCg0KTmljaG9sYXMgS2F6bGF1
c2thcw0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fY29sb3JfbWdtdC5jIHwgMjQg
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICAgaW5jbHVkZS9kcm0vZHJtX2NvbG9yX21nbXQu
aCAgICAgfCAyMyArKysrKysrKysrKysrKysrKysrKysrLQ0KPiAgIDIgZmlsZXMgY2hhbmdlZCwg
MjIgaW5zZXJ0aW9ucygrKSwgMjUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2RybV9jb2xvcl9tZ210LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2NvbG9y
X21nbXQuYw0KPiBpbmRleCA0Y2U1YzZkOGRlOTkuLjE5YzVmNjM1OTkyYSAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9jb2xvcl9tZ210LmMNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9jb2xvcl9tZ210LmMNCj4gQEAgLTEwOCwzMCArMTA4LDYgQEANCj4gICAgKiAJc3Rh
bmRhcmQgZW51bSB2YWx1ZXMgc3VwcG9ydGVkIGJ5IHRoZSBEUk0gcGxhbmUuDQo+ICAgICovDQo+
ICAgDQo+IC0vKioNCj4gLSAqIGRybV9jb2xvcl9sdXRfZXh0cmFjdCAtIGNsYW1wIGFuZCByb3Vu
ZCBMVVQgZW50cmllcw0KPiAtICogQHVzZXJfaW5wdXQ6IGlucHV0IHZhbHVlDQo+IC0gKiBAYml0
X3ByZWNpc2lvbjogbnVtYmVyIG9mIGJpdHMgdGhlIGh3IExVVCBzdXBwb3J0cw0KPiAtICoNCj4g
LSAqIEV4dHJhY3QgYSBkZWdhbW1hL2dhbW1hIExVVCB2YWx1ZSBwcm92aWRlZCBieSB1c2VyIChp
biB0aGUgZm9ybSBvZg0KPiAtICogJmRybV9jb2xvcl9sdXQgZW50cmllcykgYW5kIHJvdW5kIGl0
IHRvIHRoZSBwcmVjaXNpb24gc3VwcG9ydGVkIGJ5IHRoZQ0KPiAtICogaGFyZHdhcmUuDQo+IC0g
Ki8NCj4gLXVpbnQzMl90IGRybV9jb2xvcl9sdXRfZXh0cmFjdCh1aW50MzJfdCB1c2VyX2lucHV0
LCB1aW50MzJfdCBiaXRfcHJlY2lzaW9uKQ0KPiAtew0KPiAtCXVpbnQzMl90IHZhbCA9IHVzZXJf
aW5wdXQ7DQo+IC0JdWludDMyX3QgbWF4ID0gMHhmZmZmID4+ICgxNiAtIGJpdF9wcmVjaXNpb24p
Ow0KPiAtDQo+IC0JLyogUm91bmQgb25seSBpZiB3ZSdyZSBub3QgdXNpbmcgZnVsbCBwcmVjaXNp
b24uICovDQo+IC0JaWYgKGJpdF9wcmVjaXNpb24gPCAxNikgew0KPiAtCQl2YWwgKz0gMVVMIDw8
ICgxNiAtIGJpdF9wcmVjaXNpb24gLSAxKTsNCj4gLQkJdmFsID4+PSAxNiAtIGJpdF9wcmVjaXNp
b247DQo+IC0JfQ0KPiAtDQo+IC0JcmV0dXJuIGNsYW1wX3ZhbCh2YWwsIDAsIG1heCk7DQo+IC19
DQo+IC1FWFBPUlRfU1lNQk9MKGRybV9jb2xvcl9sdXRfZXh0cmFjdCk7DQo+IC0NCj4gICAvKioN
Cj4gICAgKiBkcm1fY3J0Y19lbmFibGVfY29sb3JfbWdtdCAtIGVuYWJsZSBjb2xvciBtYW5hZ2Vt
ZW50IHByb3BlcnRpZXMNCj4gICAgKiBAY3J0YzogRFJNIENSVEMNCj4gZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvZHJtL2RybV9jb2xvcl9tZ210LmggYi9pbmNsdWRlL2RybS9kcm1fY29sb3JfbWdtdC5o
DQo+IGluZGV4IGQxYzY2MmQ5MmFiNy4uMDY5YjIxZDYxODcxIDEwMDY0NA0KPiAtLS0gYS9pbmNs
dWRlL2RybS9kcm1fY29sb3JfbWdtdC5oDQo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9jb2xvcl9t
Z210LmgNCj4gQEAgLTI5LDcgKzI5LDI4IEBADQo+ICAgc3RydWN0IGRybV9jcnRjOw0KPiAgIHN0
cnVjdCBkcm1fcGxhbmU7DQo+ICAgDQo+IC11aW50MzJfdCBkcm1fY29sb3JfbHV0X2V4dHJhY3Qo
dWludDMyX3QgdXNlcl9pbnB1dCwgdWludDMyX3QgYml0X3ByZWNpc2lvbik7DQo+ICsvKioNCj4g
KyAqIGRybV9jb2xvcl9sdXRfZXh0cmFjdCAtIGNsYW1wIGFuZCByb3VuZCBMVVQgZW50cmllcw0K
PiArICogQHVzZXJfaW5wdXQ6IGlucHV0IHZhbHVlDQo+ICsgKiBAYml0X3ByZWNpc2lvbjogbnVt
YmVyIG9mIGJpdHMgdGhlIGh3IExVVCBzdXBwb3J0cw0KPiArICoNCj4gKyAqIEV4dHJhY3QgYSBk
ZWdhbW1hL2dhbW1hIExVVCB2YWx1ZSBwcm92aWRlZCBieSB1c2VyIChpbiB0aGUgZm9ybSBvZg0K
PiArICogJmRybV9jb2xvcl9sdXQgZW50cmllcykgYW5kIHJvdW5kIGl0IHRvIHRoZSBwcmVjaXNp
b24gc3VwcG9ydGVkIGJ5IHRoZQ0KPiArICogaGFyZHdhcmUuDQo+ICsgKi8NCj4gK3N0YXRpYyBp
bmxpbmUgdTMyIGRybV9jb2xvcl9sdXRfZXh0cmFjdCh1MzIgdXNlcl9pbnB1dCwgaW50IGJpdF9w
cmVjaXNpb24pDQo+ICt7DQo+ICsJdTMyIHZhbCA9IHVzZXJfaW5wdXQ7DQo+ICsJdTMyIG1heCA9
IDB4ZmZmZiA+PiAoMTYgLSBiaXRfcHJlY2lzaW9uKTsNCj4gKw0KPiArCS8qIFJvdW5kIG9ubHkg
aWYgd2UncmUgbm90IHVzaW5nIGZ1bGwgcHJlY2lzaW9uLiAqLw0KPiArCWlmIChiaXRfcHJlY2lz
aW9uIDwgMTYpIHsNCj4gKwkJdmFsICs9IDFVTCA8PCAoMTYgLSBiaXRfcHJlY2lzaW9uIC0gMSk7
DQo+ICsJCXZhbCA+Pj0gMTYgLSBiaXRfcHJlY2lzaW9uOw0KPiArCX0NCj4gKw0KPiArCXJldHVy
biBjbGFtcF92YWwodmFsLCAwLCBtYXgpOw0KPiArfQ0KPiAgIA0KPiAgIHZvaWQgZHJtX2NydGNf
ZW5hYmxlX2NvbG9yX21nbXQoc3RydWN0IGRybV9jcnRjICpjcnRjLA0KPiAgIAkJCQl1aW50IGRl
Z2FtbWFfbHV0X3NpemUsDQo+IA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
