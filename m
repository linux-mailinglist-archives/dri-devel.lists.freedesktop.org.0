Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DBE2BE00
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 05:57:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E73B589AEB;
	Tue, 28 May 2019 03:57:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10054.outbound.protection.outlook.com [40.107.1.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7114989AF3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 03:57:03 +0000 (UTC)
Received: from DB7PR08MB3530.eurprd08.prod.outlook.com (20.177.120.80) by
 DB7PR08MB3580.eurprd08.prod.outlook.com (20.177.120.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.16; Tue, 28 May 2019 03:57:00 +0000
Received: from DB7PR08MB3530.eurprd08.prod.outlook.com
 ([fe80::e41c:9e3c:80bf:25c6]) by DB7PR08MB3530.eurprd08.prod.outlook.com
 ([fe80::e41c:9e3c:80bf:25c6%5]) with mapi id 15.20.1943.016; Tue, 28 May 2019
 03:57:00 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "james qian wang (Arm Technology
 China)" <james.qian.wang@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "seanpaul@chromium.org"
 <seanpaul@chromium.org>, "airlied@linux.ie" <airlied@linux.ie>, Brian Starkey
 <Brian.Starkey@arm.com>
Subject: [PATCH v3 1/2] drm/komeda: Add rotation support on Komeda driver
Thread-Topic: [PATCH v3 1/2] drm/komeda: Add rotation support on Komeda driver
Thread-Index: AQHVFQlnTJI4hpLns0iKHK2Hp+KXgQ==
Date: Tue, 28 May 2019 03:57:00 +0000
Message-ID: <1559015784-18998-2-git-send-email-lowry.li@arm.com>
References: <1559015784-18998-1-git-send-email-lowry.li@arm.com>
In-Reply-To: <1559015784-18998-1-git-send-email-lowry.li@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR02CA0197.apcprd02.prod.outlook.com
 (2603:1096:201:21::33) To DB7PR08MB3530.eurprd08.prod.outlook.com
 (2603:10a6:10:49::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 1.9.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a1a557d8-5077-4dc8-cc05-08d6e3208950
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DB7PR08MB3580; 
x-ms-traffictypediagnostic: DB7PR08MB3580:
nodisclaimer: True
x-microsoft-antispam-prvs: <DB7PR08MB35800CF471AB5DA10FC116729F1E0@DB7PR08MB3580.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:204;
x-forefront-prvs: 00514A2FE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(396003)(346002)(366004)(39860400002)(136003)(189003)(199004)(8936002)(6486002)(2501003)(81166006)(81156014)(6436002)(71200400001)(6512007)(86362001)(305945005)(5660300002)(486006)(66066001)(36756003)(478600001)(7736002)(8676002)(71190400001)(50226002)(53936002)(2201001)(316002)(6636002)(2906002)(54906003)(66476007)(66556008)(66446008)(2616005)(73956011)(186003)(26005)(68736007)(446003)(476003)(14444005)(256004)(25786009)(3846002)(6116002)(11346002)(99286004)(52116002)(386003)(6506007)(102836004)(55236004)(72206003)(76176011)(14454004)(66946007)(110136005)(64756008)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR08MB3580;
 H:DB7PR08MB3530.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FSRp5DSLJayYLGfn9kp+K4sZHX7pZH6LrcwbiI4JyQbA2RMJ61H7hKLIqElHEiyDclhSDU3Au2mj/oCMRKHIZnAsWaXu/nAgrV2d/u5VlghuIrnXP6d11mzfOJQf7sxR6+L1wyL9CZwZctVMITmV7lwVxCuZJdWSdBEyKtqFZNNhwOAbdQbWHWC4zL2GFQJStevLV8JyYvEgPrcIjG4ulNq26B4hbjz503PLW/2NwoDwYwUcYfFeoPui1WVZuHaJoRvdTwbRc8rR8a48+42syWIhUj1Ugzw5wmXLJkybUm96XdXNGrRQ7dAWhxYLVs6jq0Qi2aq4Xh1T/Z4lTxMZbuYm0g9WNOGxWCPCM8tQdTqeUkjpjpiaHDz6n3whgzmr6N/hWH7DQWsNdHIk3oTLrDGWjRQ1RGfCC44xul4UHe4=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1a557d8-5077-4dc8-cc05-08d6e3208950
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2019 03:57:00.6313 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lowry.Li@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3580
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ebkvGMDpB+G8m//iJEFAwcRvCyXF58/1P3aolgwFmLc=;
 b=tpSYF+q4LU9y+mbm8zAlTGHniD8VYmePmWoHmsgBlfA9g7YF3dTZKR/8p7qAKdTd5gUhTgcJlfd2U4IWTGKJlo74SFZzpomIxCMf6m5SH5Q5iRQ/QoUB8iY1dewNcO8m7vApCFZ52l5ySuktrEdY4K0IoHX1sZIZSabqdaYxP/Q=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
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
Cc: Ayan Halder <Ayan.Halder@arm.com>, "Jonathan Chai
 \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogIkxvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGluYSkiIDxMb3dyeS5MaUBhcm0uY29t
Pg0KDQotIEFkZHMgcm90YXRpb24gcHJvcGVydHkgdG8gcGxhbmUuDQotIEtvbWVkYSBkaXNwbGF5
IHJvdGF0aW9uIHN1cHBvcnQgZGl2ZXJnZXMgZnJvbSB0aGUgc3BlY2lmaWMgZm9ybWF0cywNCnNv
IG5lZWQgdG8gY2hlY2sgdGhlIHVzZXIgcmVxdWlyZWQgcm90YXRpb24gdHlwZSB3aXRoIHRoZSBm
b3JtYXQgY2Fwcw0KYW5kIHJlamVjdCB0aGUgY29tbWl0IGlmIGl0IGNhbiBub3QgYmUgc3VwcG9y
dGVkLg0KLSBJbiB0aGUgbGF5ZXIgdmFsaWRhdGUgZmxvdywgc2V0cyB0aGUgcm90YXRpb24gdmFs
dWUgdG8gdGhlIGxheWVyDQpzdGF0ZS4gSWYgcjkwIG9yIHIyNzAsIHN3YXAgdGhlIHdpZHRoIGFu
ZCBoZWlnaHQgb2YgdGhlIGRhdGEgZmxvdw0KZm9yIG5leHQgc3RhZ2UuDQoNClNpZ25lZC1vZmYt
Ynk6IExvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGxvd3J5LmxpQGFybS5jb20+DQot
LS0NCiBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9mb3JtYXRfY2Fw
cy5oICB8IDExICsrKysrKysrKysrDQogLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9waXBlbGluZV9zdGF0ZS5jICAgfCAgNyArKysrKysrDQogZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGxhbmUuYyAgICAgICAgfCAxNiArKysrKysrKysrKysr
KysrDQogMyBmaWxlcyBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9mb3JtYXRfY2Fwcy5oIGIv
ZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZm9ybWF0X2NhcHMuaA0K
aW5kZXggYmMzYjJkZjM2Li45NmRlMjJlIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZm9ybWF0X2NhcHMuaA0KKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZm9ybWF0X2NhcHMuaA0KQEAgLTc5LDYgKzc5
LDE3IEBAIHN0cnVjdCBrb21lZGFfZm9ybWF0X2NhcHNfdGFibGUgew0KIA0KIGV4dGVybiB1NjQg
a29tZWRhX3N1cHBvcnRlZF9tb2RpZmllcnNbXTsNCiANCitzdGF0aWMgaW5saW5lIGNvbnN0IGNo
YXIgKmtvbWVkYV9nZXRfZm9ybWF0X25hbWUodTMyIGZvdXJjYywgdTY0IG1vZGlmaWVyKQ0KK3sN
CisJc3RydWN0IGRybV9mb3JtYXRfbmFtZV9idWYgYnVmOw0KKwlzdGF0aWMgY2hhciBuYW1lWzY0
XTsNCisNCisJc25wcmludGYobmFtZSwgc2l6ZW9mKG5hbWUpLCAiJXMgd2l0aCBtb2RpZmllcjog
MHglbGx4LiIsDQorCQkgZHJtX2dldF9mb3JtYXRfbmFtZShmb3VyY2MsICZidWYpLCBtb2RpZmll
cik7DQorDQorCXJldHVybiBuYW1lOw0KK30NCisNCiBjb25zdCBzdHJ1Y3Qga29tZWRhX2Zvcm1h
dF9jYXBzICoNCiBrb21lZGFfZ2V0X2Zvcm1hdF9jYXBzKHN0cnVjdCBrb21lZGFfZm9ybWF0X2Nh
cHNfdGFibGUgKnRhYmxlLA0KIAkJICAgICAgIHUzMiBmb3VyY2MsIHU2NCBtb2RpZmllcik7DQpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlw
ZWxpbmVfc3RhdGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X3BpcGVsaW5lX3N0YXRlLmMNCmluZGV4IGRiMzRlYTIuLjM0NzM3YzAgMTAwNjQ0DQotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5j
DQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGlu
ZV9zdGF0ZS5jDQpAQCAtMzM5LDYgKzMzOSwxMyBAQCBzdHJ1Y3Qga29tZWRhX3BpcGVsaW5lX3N0
YXRlICoNCiAJLyogdXBkYXRlIHRoZSBkYXRhIGZsb3cgZm9yIHRoZSBuZXh0IHN0YWdlICovDQog
CWtvbWVkYV9jb21wb25lbnRfc2V0X291dHB1dCgmZGZsb3ctPmlucHV0LCAmbGF5ZXItPmJhc2Us
IDApOw0KIA0KKwkvKg0KKwkgKiBUaGUgcm90YXRpb24gaGFzIGJlZW4gaGFuZGxlZCBieSBsYXll
ciwgc28gYWRqdXN0ZWQgdGhlIGRhdGEgZmxvdyBmb3INCisJICogdGhlIG5leHQgc3RhZ2UuDQor
CSAqLw0KKwlpZiAoZHJtX3JvdGF0aW9uXzkwX29yXzI3MChzdC0+cm90KSkNCisJCXN3YXAoZGZs
b3ctPmluX2gsIGRmbG93LT5pbl93KTsNCisNCiAJcmV0dXJuIDA7DQogfQ0KIA0KZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BsYW5lLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9wbGFuZS5jDQppbmRleCA5
Yjg3YzI1Li5jOWYzN2ZmIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfcGxhbmUuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfcGxhbmUuYw0KQEAgLTEwLDYgKzEwLDcgQEANCiAjaW5jbHVkZSA8ZHJt
L2RybV9wcmludC5oPg0KICNpbmNsdWRlICJrb21lZGFfZGV2LmgiDQogI2luY2x1ZGUgImtvbWVk
YV9rbXMuaCINCisjaW5jbHVkZSAia29tZWRhX2ZyYW1lYnVmZmVyLmgiDQogDQogc3RhdGljIGlu
dA0KIGtvbWVkYV9wbGFuZV9pbml0X2RhdGFfZmxvdyhzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpz
dCwNCkBAIC0xNyw2ICsxOCw3IEBADQogew0KIAlzdHJ1Y3Qga29tZWRhX3BsYW5lX3N0YXRlICpr
cGxhbmVfc3QgPSB0b19rcGxhbmVfc3Qoc3QpOw0KIAlzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpm
YiA9IHN0LT5mYjsNCisJY29uc3Qgc3RydWN0IGtvbWVkYV9mb3JtYXRfY2FwcyAqY2FwcyA9IHRv
X2tmYihmYiktPmZvcm1hdF9jYXBzOw0KIA0KIAltZW1zZXQoZGZsb3csIDAsIHNpemVvZigqZGZs
b3cpKTsNCiANCkBAIC0zNyw2ICszOSwxNSBAQA0KIAlkZmxvdy0+aW5fdyA9IHN0LT5zcmNfdyA+
PiAxNjsNCiAJZGZsb3ctPmluX2ggPSBzdC0+c3JjX2ggPj4gMTY7DQogDQorCWRmbG93LT5yb3Qg
PSBkcm1fcm90YXRpb25fc2ltcGxpZnkoc3QtPnJvdGF0aW9uLCBjYXBzLT5zdXBwb3J0ZWRfcm90
cyk7DQorCWlmICghaGFzX2JpdHMoZGZsb3ctPnJvdCwgY2Fwcy0+c3VwcG9ydGVkX3JvdHMpKSB7
DQorCQlEUk1fREVCVUdfQVRPTUlDKCJyb3RhdGlvbigweCV4KSBpc24ndCBzdXBwb3J0ZWQgYnkg
JXMuXG4iLA0KKwkJCQkgZGZsb3ctPnJvdCwNCisJCQkJIGtvbWVkYV9nZXRfZm9ybWF0X25hbWUo
Y2Fwcy0+Zm91cmNjLA0KKwkJCQkJCQlmYi0+bW9kaWZpZXIpKTsNCisJCXJldHVybiAtRUlOVkFM
Ow0KKwl9DQorDQogCWRmbG93LT5lbl9pbWdfZW5oYW5jZW1lbnQgPSBrcGxhbmVfc3QtPmltZ19l
bmhhbmNlbWVudDsNCiANCiAJa29tZWRhX2NvbXBsZXRlX2RhdGFfZmxvd19jZmcoZGZsb3cpOw0K
QEAgLTMwMyw2ICszMTQsMTEgQEAgc3RhdGljIGludCBrb21lZGFfcGxhbmVfYWRkKHN0cnVjdCBr
b21lZGFfa21zX2RldiAqa21zLA0KIA0KIAlkcm1fcGxhbmVfaGVscGVyX2FkZChwbGFuZSwgJmtv
bWVkYV9wbGFuZV9oZWxwZXJfZnVuY3MpOw0KIA0KKwllcnIgPSBkcm1fcGxhbmVfY3JlYXRlX3Jv
dGF0aW9uX3Byb3BlcnR5KHBsYW5lLCBEUk1fTU9ERV9ST1RBVEVfMCwNCisJCQkJCQkgbGF5ZXIt
PnN1cHBvcnRlZF9yb3RzKTsNCisJaWYgKGVycikNCisJCWdvdG8gY2xlYW51cDsNCisNCiAJZXJy
ID0gZHJtX3BsYW5lX2NyZWF0ZV9hbHBoYV9wcm9wZXJ0eShwbGFuZSk7DQogCWlmIChlcnIpDQog
CQlnb3RvIGNsZWFudXA7DQotLSANCjEuOS4xDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
