Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E4F9D5F3
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 20:41:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5FEE6E29B;
	Mon, 26 Aug 2019 18:41:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam03on060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe48::60d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D82176E29B
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 18:41:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QbPMZGvKhVnJue/s5jrNSCw3+iyuPhX7kXBL+ITaMzIPb9to3UZ1DtLku6g/gG4OWSh/XEQMQCF2zfjqRhkBH16FnCBJ3F7/x9CxRs6scgTOsP65ZGwVhsgf9U9uhL76DEwNcR9naWcR0ErQLKgEXM3HeIB8pUjIj7lT8RXurJOeRD3ZwFeOiwS/4AbXtXpMNYd3Q45NrtgxnL07OWKissJkZrFtraPP2RXdCHIxCX5J1Sma3IUXP6VjQGhuS0VFU7ggfliuNiPl7ZdYcdoaAXB7DmBfWrXHQx8NZg7wI3jLeLVp+TW+Y0oSqDdnQ9gHrNnU56sPPHesgxsRhlnT8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jtQ/aVvUaQRLwbITIhZzd2dSqSi3UbOv3j7wTsOua58=;
 b=QOOpn3V/Cco7xR3Fe4FRstmV3n1ayXFrcIMRHIPkz0iRJDNIDArelE1Ap2RBaBTpPIOxdqbIFl5jhqPrJNeaSKodIqFXieNZYjCmNswogjLqD56Q08sXBVCbXjk6zzPip9G4L76Lls6NFN/tTaFxfsxGfaPdo/y/KUvMSI+QHC5DBQAX5GvuSpW4I9E0ljLZrSo9/Rsig7eZdoHeXuT2qKnioUKXWbDpteQHDgBNJcE+D9FqVs9VOAm39WuZN4XkCpQVr+0En19tel8ew53VkoP91ovSotD9SVkwL3hqsW28nVe/k87B2leog8ISBs9PHPkssKQkocb1uRTckxnkxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0214.namprd12.prod.outlook.com (10.174.54.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.19; Mon, 26 Aug 2019 18:41:23 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::540f:1eae:7e3a:c6b2]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::540f:1eae:7e3a:c6b2%5]) with mapi id 15.20.2178.023; Mon, 26 Aug 2019
 18:41:23 +0000
From: Harry Wentland <hwentlan@amd.com>
To: "Francis, David" <David.Francis@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v8 3/6] drm/dp_mst: Add MST support to DP DPCD R/W
 functions
Thread-Topic: [PATCH v8 3/6] drm/dp_mst: Add MST support to DP DPCD R/W
 functions
Thread-Index: AQHVXDjZ8Ovq4JNlsUKIhezjzWp4jqcNw0IA
Date: Mon, 26 Aug 2019 18:41:23 +0000
Message-ID: <046406c7-1903-4d28-64ef-cc59975e21ed@amd.com>
References: <20190826180507.17802-1-David.Francis@amd.com>
 <20190826180507.17802-4-David.Francis@amd.com>
In-Reply-To: <20190826180507.17802-4-David.Francis@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YT1PR01CA0005.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::18)
 To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3e9ecc8d-baa9-44b9-2e30-08d72a54fe6d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR1201MB0214; 
x-ms-traffictypediagnostic: CY4PR1201MB0214:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB0214D1C347433FCED458D7948CA10@CY4PR1201MB0214.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(376002)(136003)(346002)(366004)(189003)(199004)(53546011)(386003)(2906002)(186003)(25786009)(8936002)(446003)(26005)(2616005)(53936002)(76176011)(102836004)(229853002)(305945005)(6512007)(11346002)(6506007)(14454004)(66066001)(65956001)(65806001)(6246003)(66446008)(110136005)(99286004)(7736002)(6486002)(81156014)(31696002)(52116002)(6436002)(81166006)(66556008)(486006)(5660300002)(64756008)(476003)(31686004)(256004)(14444005)(3846002)(6116002)(36756003)(2501003)(8676002)(66946007)(71190400001)(71200400001)(66476007)(316002)(58126008)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0214;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9Pz5fAQ6JFRuwzhWFIZVK/5gHm+y1yDg0JUGlvusZ0rvzgMcJVxnujmR4BQ8qmqf5iMPxq+absoC2gY9XQd0ao4Cm5z9r1B7Q9f/iMN7sPXY4ppD68bJaRh0VyJdSf2uV3II+8dw1MKFwpcAfpwc+We8TFmSxRj3GCGsHlBMEVoYQq3voLxTLW4RLLkekIIiUYZ8Gv0wN13I0kW3UT9Wnm4jVuUIFlvBuMEbuAy3+r/mxg1yDq3E7MLt3b3HxxjDOT486dvohjecr3ZLsZyHeEiPvj8FxPecVcVj/Ez0W0Q4pYjKJD9e5c5m7Hklz8mC2QSBf/yYtoFKdqHND5hgn39+l2UXJDAL9bNzsbUcvizjftTfW4a0ot7HpKKtOkx5BSYsRP/9HBBWzaqMlBn5rLkr7JQfAnDmJFRssa0C3Ec=
Content-ID: <528679C0C3E497489C8B57FBB425AD29@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e9ecc8d-baa9-44b9-2e30-08d72a54fe6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 18:41:23.3830 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sb7YeeLiZk1cMFqNzDkswAqjms3SrLiqXFkWQdbF8E+OM25CWUzubiiu9z0Pv3srvhs9aUC+pvUSc2kb2Mhw0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0214
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jtQ/aVvUaQRLwbITIhZzd2dSqSi3UbOv3j7wTsOua58=;
 b=3zcdDVuLrdZhnolmCM/71jyJ0fKtaCODoo50OsDdXFqFi/mI8x+JAQGNBFlN50+pyjZ2Vi6rqryl6EGOc85t9B8a8i46Mq+OMjL9iwe+xjFk4gtPQ91AG8W4ZL49GP0GG+SDvfh7XCzaRD6jS5DnfcA7W7rdYuKs+yEZVaMCfCc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wOC0yNiAyOjA1IHAubS4sIERhdmlkIEZyYW5jaXMgd3JvdGU6DQo+IEluc3RlYWQg
b2YgaGF2aW5nIGRybV9kcF9kcGNkX3JlYWQvd3JpdGUgYW5kDQo+IGRybV9kcF9tc3RfZHBjZF9y
ZWFkL3dyaXRlIGFzIGVudHJ5IHBvaW50cyBpbnRvIHRoZQ0KPiBhdXggY29kZSwgaGF2ZSBkcm1f
ZHBfZHBjZF9yZWFkL3dyaXRlIGhhbmRsZSBib3RoLg0KPiANCj4gVGhpcyBtZWFucyB0aGF0IERS
TSBkcml2ZXJzIGNhbiBtYWtlIE1TVCBEUENEIHJlYWQvd3JpdGVzLg0KPiANCj4gdjI6IEZpeCBz
cGFjaW5nDQo+IHYzOiBEdW1wIGRwY2QgYWNjZXNzIG9uIE1TVCByZWFkL3dyaXRlcw0KPiANCj4g
UmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+DQoNClJldmlld2VkLWJ5
OiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4NCg0KSGFycnkNCg0KPiBT
aWduZWQtb2ZmLWJ5OiBEYXZpZCBGcmFuY2lzIDxEYXZpZC5GcmFuY2lzQGFtZC5jb20+DQo+IC0t
LQ0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9kcF9hdXhfZGV2LmMgfCAxMiArKy0tLS0tLS0tLS0N
Cj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMgIHwgMzAgKysrKysrKysrKysrKysr
KysrKystLS0tLS0tLS0tDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDIw
IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBf
YXV4X2Rldi5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9hdXhfZGV2LmMNCj4gaW5kZXggMGNm
YjM4Njc1NGMzLi40MThjYWQ0ZjY0OWEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZHBfYXV4X2Rldi5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfYXV4X2Rldi5j
DQo+IEBAIC0xNjMsMTEgKzE2Myw3IEBAIHN0YXRpYyBzc2l6ZV90IGF1eGRldl9yZWFkX2l0ZXIo
c3RydWN0IGtpb2NiICppb2NiLCBzdHJ1Y3QgaW92X2l0ZXIgKnRvKQ0KPiAgCQkJYnJlYWs7DQo+
ICAJCX0NCj4gIA0KPiAtCQlpZiAoYXV4X2Rldi0+YXV4LT5pc19yZW1vdGUpDQo+IC0JCQlyZXMg
PSBkcm1fZHBfbXN0X2RwY2RfcmVhZChhdXhfZGV2LT5hdXgsIHBvcywgYnVmLA0KPiAtCQkJCQkJ
ICAgdG9kbyk7DQo+IC0JCWVsc2UNCj4gLQkJCXJlcyA9IGRybV9kcF9kcGNkX3JlYWQoYXV4X2Rl
di0+YXV4LCBwb3MsIGJ1ZiwgdG9kbyk7DQo+ICsJCXJlcyA9IGRybV9kcF9kcGNkX3JlYWQoYXV4
X2Rldi0+YXV4LCBwb3MsIGJ1ZiwgdG9kbyk7DQo+ICANCj4gIAkJaWYgKHJlcyA8PSAwKQ0KPiAg
CQkJYnJlYWs7DQo+IEBAIC0yMTUsMTEgKzIxMSw3IEBAIHN0YXRpYyBzc2l6ZV90IGF1eGRldl93
cml0ZV9pdGVyKHN0cnVjdCBraW9jYiAqaW9jYiwgc3RydWN0IGlvdl9pdGVyICpmcm9tKQ0KPiAg
CQkJYnJlYWs7DQo+ICAJCX0NCj4gIA0KPiAtCQlpZiAoYXV4X2Rldi0+YXV4LT5pc19yZW1vdGUp
DQo+IC0JCQlyZXMgPSBkcm1fZHBfbXN0X2RwY2Rfd3JpdGUoYXV4X2Rldi0+YXV4LCBwb3MsIGJ1
ZiwNCj4gLQkJCQkJCSAgICB0b2RvKTsNCj4gLQkJZWxzZQ0KPiAtCQkJcmVzID0gZHJtX2RwX2Rw
Y2Rfd3JpdGUoYXV4X2Rldi0+YXV4LCBwb3MsIGJ1ZiwgdG9kbyk7DQo+ICsJCXJlcyA9IGRybV9k
cF9tc3RfZHBjZF93cml0ZShhdXhfZGV2LT5hdXgsIHBvcywgYnVmLCB0b2RvKTsNCj4gIA0KPiAg
CQlpZiAocmVzIDw9IDApDQo+ICAJCQlicmVhazsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZHBfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jDQo+
IGluZGV4IGZmYzY4ZDMwNWFmZS4uMmNjMjFlZmY0Y2YzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBf
aGVscGVyLmMNCj4gQEAgLTMwLDYgKzMwLDcgQEANCj4gICNpbmNsdWRlIDxsaW51eC9zZXFfZmls
ZS5oPg0KPiAgDQo+ICAjaW5jbHVkZSA8ZHJtL2RybV9kcF9oZWxwZXIuaD4NCj4gKyNpbmNsdWRl
IDxkcm0vZHJtX2RwX21zdF9oZWxwZXIuaD4NCj4gICNpbmNsdWRlIDxkcm0vZHJtX3ByaW50Lmg+
DQo+ICAjaW5jbHVkZSA8ZHJtL2RybV92YmxhbmsuaD4NCj4gIA0KPiBAQCAtMjUxLDcgKzI1Miw3
IEBAIHN0YXRpYyBpbnQgZHJtX2RwX2RwY2RfYWNjZXNzKHN0cnVjdCBkcm1fZHBfYXV4ICphdXgs
IHU4IHJlcXVlc3QsDQo+ICANCj4gIC8qKg0KPiAgICogZHJtX2RwX2RwY2RfcmVhZCgpIC0gcmVh
ZCBhIHNlcmllcyBvZiBieXRlcyBmcm9tIHRoZSBEUENEDQo+IC0gKiBAYXV4OiBEaXNwbGF5UG9y
dCBBVVggY2hhbm5lbA0KPiArICogQGF1eDogRGlzcGxheVBvcnQgQVVYIGNoYW5uZWwgKFNTVCBv
ciBNU1QpDQo+ICAgKiBAb2Zmc2V0OiBhZGRyZXNzIG9mIHRoZSAoZmlyc3QpIHJlZ2lzdGVyIHRv
IHJlYWQNCj4gICAqIEBidWZmZXI6IGJ1ZmZlciB0byBzdG9yZSB0aGUgcmVnaXN0ZXIgdmFsdWVz
DQo+ICAgKiBAc2l6ZTogbnVtYmVyIG9mIGJ5dGVzIGluIEBidWZmZXINCj4gQEAgLTI4MCwxMyAr
MjgxLDE4IEBAIHNzaXplX3QgZHJtX2RwX2RwY2RfcmVhZChzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4
LCB1bnNpZ25lZCBpbnQgb2Zmc2V0LA0KPiAgCSAqIFdlIGp1c3QgaGF2ZSB0byBkbyBpdCBiZWZv
cmUgYW55IERQQ0QgYWNjZXNzIGFuZCBob3BlIHRoYXQgdGhlDQo+ICAJICogbW9uaXRvciBkb2Vz
bid0IHBvd2VyIGRvd24gZXhhY3RseSBhZnRlciB0aGUgdGhyb3cgYXdheSByZWFkLg0KPiAgCSAq
Lw0KPiAtCXJldCA9IGRybV9kcF9kcGNkX2FjY2VzcyhhdXgsIERQX0FVWF9OQVRJVkVfUkVBRCwg
RFBfRFBDRF9SRVYsIGJ1ZmZlciwNCj4gLQkJCQkgMSk7DQo+IC0JaWYgKHJldCAhPSAxKQ0KPiAt
CQlnb3RvIG91dDsNCj4gKwlpZiAoIWF1eC0+aXNfcmVtb3RlKSB7DQo+ICsJCXJldCA9IGRybV9k
cF9kcGNkX2FjY2VzcyhhdXgsIERQX0FVWF9OQVRJVkVfUkVBRCwgRFBfRFBDRF9SRVYsDQo+ICsJ
CQkJCSBidWZmZXIsIDEpOw0KPiArCQlpZiAocmV0ICE9IDEpDQo+ICsJCQlnb3RvIG91dDsNCj4g
Kwl9DQo+ICANCj4gLQlyZXQgPSBkcm1fZHBfZHBjZF9hY2Nlc3MoYXV4LCBEUF9BVVhfTkFUSVZF
X1JFQUQsIG9mZnNldCwgYnVmZmVyLA0KPiAtCQkJCSBzaXplKTsNCj4gKwlpZiAoYXV4LT5pc19y
ZW1vdGUpDQo+ICsJCXJldCA9IGRybV9kcF9tc3RfZHBjZF9yZWFkKGF1eCwgb2Zmc2V0LCBidWZm
ZXIsIHNpemUpOw0KPiArCWVsc2UNCj4gKwkJcmV0ID0gZHJtX2RwX2RwY2RfYWNjZXNzKGF1eCwg
RFBfQVVYX05BVElWRV9SRUFELCBvZmZzZXQsDQo+ICsJCQkJCSBidWZmZXIsIHNpemUpOw0KPiAg
DQo+ICBvdXQ6DQo+ICAJZHJtX2RwX2R1bXBfYWNjZXNzKGF1eCwgRFBfQVVYX05BVElWRV9SRUFE
LCBvZmZzZXQsIGJ1ZmZlciwgcmV0KTsNCj4gQEAgLTI5Niw3ICszMDIsNyBAQCBFWFBPUlRfU1lN
Qk9MKGRybV9kcF9kcGNkX3JlYWQpOw0KPiAgDQo+ICAvKioNCj4gICAqIGRybV9kcF9kcGNkX3dy
aXRlKCkgLSB3cml0ZSBhIHNlcmllcyBvZiBieXRlcyB0byB0aGUgRFBDRA0KPiAtICogQGF1eDog
RGlzcGxheVBvcnQgQVVYIGNoYW5uZWwNCj4gKyAqIEBhdXg6IERpc3BsYXlQb3J0IEFVWCBjaGFu
bmVsIChTU1Qgb3IgTVNUKQ0KPiAgICogQG9mZnNldDogYWRkcmVzcyBvZiB0aGUgKGZpcnN0KSBy
ZWdpc3RlciB0byB3cml0ZQ0KPiAgICogQGJ1ZmZlcjogYnVmZmVyIGNvbnRhaW5pbmcgdGhlIHZh
bHVlcyB0byB3cml0ZQ0KPiAgICogQHNpemU6IG51bWJlciBvZiBieXRlcyBpbiBAYnVmZmVyDQo+
IEBAIC0zMTMsOCArMzE5LDEyIEBAIHNzaXplX3QgZHJtX2RwX2RwY2Rfd3JpdGUoc3RydWN0IGRy
bV9kcF9hdXggKmF1eCwgdW5zaWduZWQgaW50IG9mZnNldCwNCj4gIHsNCj4gIAlpbnQgcmV0Ow0K
PiAgDQo+IC0JcmV0ID0gZHJtX2RwX2RwY2RfYWNjZXNzKGF1eCwgRFBfQVVYX05BVElWRV9XUklU
RSwgb2Zmc2V0LCBidWZmZXIsDQo+IC0JCQkJIHNpemUpOw0KPiArCWlmIChhdXgtPmlzX3JlbW90
ZSkNCj4gKwkJcmV0ID0gZHJtX2RwX21zdF9kcGNkX3dyaXRlKGF1eCwgb2Zmc2V0LCBidWZmZXIs
IHNpemUpOw0KPiArCWVsc2UNCj4gKwkJcmV0ID0gZHJtX2RwX2RwY2RfYWNjZXNzKGF1eCwgRFBf
QVVYX05BVElWRV9XUklURSwgb2Zmc2V0LA0KPiArCQkJCQkgYnVmZmVyLCBzaXplKTsNCj4gKw0K
PiAgCWRybV9kcF9kdW1wX2FjY2VzcyhhdXgsIERQX0FVWF9OQVRJVkVfV1JJVEUsIG9mZnNldCwg
YnVmZmVyLCByZXQpOw0KPiAgCXJldHVybiByZXQ7DQo+ICB9DQo+IA0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
