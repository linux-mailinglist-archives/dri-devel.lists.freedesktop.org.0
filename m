Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D8A6057D
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 13:44:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3E5E6E48B;
	Fri,  5 Jul 2019 11:44:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00065.outbound.protection.outlook.com [40.107.0.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 899526E105
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 11:44:47 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4797.eurprd08.prod.outlook.com (10.255.112.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Fri, 5 Jul 2019 11:44:45 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::4062:a380:35ba:11d1]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::4062:a380:35ba:11d1%3]) with mapi id 15.20.2032.019; Fri, 5 Jul 2019
 11:44:45 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>
Subject: [PATCH 2/2] drm/komeda: Computing layer_split and image_enhancer
 internally
Thread-Topic: [PATCH 2/2] drm/komeda: Computing layer_split and image_enhancer
 internally
Thread-Index: AQHVMycKXWrZUM5S4k2zCR4X2FJ5Yw==
Date: Fri, 5 Jul 2019 11:44:45 +0000
Message-ID: <20190705114427.17456-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR04CA0064.apcprd04.prod.outlook.com
 (2603:1096:202:14::32) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 188c5478-6b7b-41be-549b-08d7013e2cc9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4797; 
x-ms-traffictypediagnostic: VE1PR08MB4797:
x-microsoft-antispam-prvs: <VE1PR08MB4797E6EA92495797F2775D58B3F50@VE1PR08MB4797.eurprd08.prod.outlook.com>
nodisclaimer: True
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 008960E8EC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(366004)(39860400002)(136003)(199004)(189003)(52116002)(53936002)(6512007)(6436002)(66066001)(6506007)(25786009)(386003)(6486002)(478600001)(3846002)(6116002)(2501003)(68736007)(50226002)(99286004)(26005)(36756003)(316002)(4326008)(55236004)(103116003)(102836004)(54906003)(110136005)(186003)(71190400001)(71200400001)(5660300002)(2906002)(7736002)(305945005)(14444005)(476003)(2616005)(1076003)(8936002)(66476007)(66556008)(64756008)(66446008)(86362001)(2201001)(8676002)(256004)(486006)(73956011)(66946007)(81166006)(14454004)(81156014)(309714004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4797;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DUAJ+2jOq5oV7cyV8CsWFzCsjsh1sJwnJEz4vCZKNGqtb0EzbvO018Yo0YOebLL/Jx8EKWbfPG8YSd6Bn9+z3eye7rPO3zPv7k/ipqaWf0p33FWpXMNu1eINKX8BBeUtBLRq625kXYkTB3i3m2VFIAgmYprf0cWPl7ZWEkxQ2SVbO8No7oLLHNsawNiAxnAY+ts8TZzLAcjRaG3RDuUijkTo8qsvRCLkfoHj9NMN1pZYXf7ExvxFn8TGuDbNRVz2a/Uv7yeJXbLNRmKHGBSGejeFOI2S6YvSwLAIKlHn/aLmkDRbVp8lwJ5gEA63EwM6dQxWj3Tl2JUIINbESEHywMnJGvJjZKbdejFj811GIMZa/gQUAQ1ObX+jIWF43TlvNZMJgZ3NpNkOPrcthBeOsYsrj/Cyh/zqsA6MI9Myha8=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 188c5478-6b7b-41be-549b-08d7013e2cc9
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2019 11:44:45.0164 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: james.qian.wang@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4797
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mKsK/wofcQGnD67tOGoS7SlvTZ6SziwjPE/qMkgHKpI=;
 b=F/v7SKjOoQwGETBbXT4lq8pSQrxYp/TceYgSzDjGJwe8BohE/3dTiX5lbTJXIn0vfg8G1FqmojiclktD7I0ld4eOybIekkPnGNab+aLDQvOE2nGUwqg72nMWRwpFmF7WE435M2b9qqQHMoLueySq/w8DAMkvd0Rrv7wsgr94qkk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>, "Tiannan Zhu \(Arm
 Technology China\)" <Tiannan.Zhu@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Julien
 Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>, "james qian wang \(Arm Technology
 China\)" <james.qian.wang@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rm9yIGxheWVyX3NwbGl0OgpFbmFibGUgaXQgaWYgdGhlIHNjYWxpbmcgZXhjZWVkIHRoZSBhY2Nl
cHQgcmFuZ2Ugb2Ygc2NhbGVyLgoKRm9yIGltYWdlX2VuaGFuY2VyOgpFbmFibGUgaXQgaWYgdGhl
IHNjYWxpbmcgaXMgYSAyeCsgc2NhbGluZwoKU2lnbmVkLW9mZi1ieTogamFtZXMgcWlhbiB3YW5n
IChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPgotLS0KIC4u
Li9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaCAgfCAgMyArKy0K
IC4uLi9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lX3N0YXRlLmMgICAgfCAxNSAr
KysrKysrKysrKysrKy0KIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X3BsYW5lLmMgfCAgOCArLS0tLS0tLQogLi4uL2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X3diX2Nvbm5lY3Rvci5jICB8IDEwICstLS0tLS0tLS0KIDQgZmlsZXMgY2hhbmdlZCwgMTggaW5z
ZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaCBiL2RyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmgKaW5kZXggZmMxYjg2MTMzODVlLi5h
OTBiY2JiM2NiMjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX3BpcGVsaW5lLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tv
bWVkYS9rb21lZGFfcGlwZWxpbmUuaApAQCAtNTM3LDcgKzUzNyw4IEBAIHZvaWQga29tZWRhX3Bp
cGVsaW5lX2Rpc2FibGUoc3RydWN0IGtvbWVkYV9waXBlbGluZSAqcGlwZSwKIHZvaWQga29tZWRh
X3BpcGVsaW5lX3VwZGF0ZShzdHJ1Y3Qga29tZWRhX3BpcGVsaW5lICpwaXBlLAogCQkJICAgIHN0
cnVjdCBkcm1fYXRvbWljX3N0YXRlICpvbGRfc3RhdGUpOwogCi12b2lkIGtvbWVkYV9jb21wbGV0
ZV9kYXRhX2Zsb3dfY2ZnKHN0cnVjdCBrb21lZGFfZGF0YV9mbG93X2NmZyAqZGZsb3csCit2b2lk
IGtvbWVkYV9jb21wbGV0ZV9kYXRhX2Zsb3dfY2ZnKHN0cnVjdCBrb21lZGFfbGF5ZXIgKmxheWVy
LAorCQkJCSAgIHN0cnVjdCBrb21lZGFfZGF0YV9mbG93X2NmZyAqZGZsb3csCiAJCQkJICAgc3Ry
dWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIpOwogCiAjZW5kaWYgLyogX0tPTUVEQV9QSVBFTElORV9I
XyovCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9waXBlbGluZV9zdGF0ZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9r
b21lZGFfcGlwZWxpbmVfc3RhdGUuYwppbmRleCAyYjQxNWVmMmI3ZDMuLjcwOTg3MGJkYWE0ZiAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlw
ZWxpbmVfc3RhdGUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9waXBlbGluZV9zdGF0ZS5jCkBAIC03ODQsOSArNzg0LDExIEBAIGtvbWVkYV90aW1pbmdf
Y3RybHJfdmFsaWRhdGUoc3RydWN0IGtvbWVkYV90aW1pbmdfY3RybHIgKmN0cmxyLAogCXJldHVy
biAwOwogfQogCi12b2lkIGtvbWVkYV9jb21wbGV0ZV9kYXRhX2Zsb3dfY2ZnKHN0cnVjdCBrb21l
ZGFfZGF0YV9mbG93X2NmZyAqZGZsb3csCit2b2lkIGtvbWVkYV9jb21wbGV0ZV9kYXRhX2Zsb3df
Y2ZnKHN0cnVjdCBrb21lZGFfbGF5ZXIgKmxheWVyLAorCQkJCSAgIHN0cnVjdCBrb21lZGFfZGF0
YV9mbG93X2NmZyAqZGZsb3csCiAJCQkJICAgc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIpCiB7
CisJc3RydWN0IGtvbWVkYV9zY2FsZXIgKnNjYWxlciA9IGxheWVyLT5iYXNlLnBpcGVsaW5lLT5z
Y2FsZXJzWzBdOwogCXUzMiB3ID0gZGZsb3ctPmluX3c7CiAJdTMyIGggPSBkZmxvdy0+aW5faDsK
IApAQCAtODAzLDYgKzgwNSwxNyBAQCB2b2lkIGtvbWVkYV9jb21wbGV0ZV9kYXRhX2Zsb3dfY2Zn
KHN0cnVjdCBrb21lZGFfZGF0YV9mbG93X2NmZyAqZGZsb3csCiAKIAlkZmxvdy0+ZW5fc2NhbGlu
ZyA9ICh3ICE9IGRmbG93LT5vdXRfdykgfHwgKGggIT0gZGZsb3ctPm91dF9oKTsKIAlkZmxvdy0+
aXNfeXV2ID0gZmItPmZvcm1hdC0+aXNfeXV2OworCisJLyogdHJ5IHRvIGVuYWJsZSBpbWFnZSBl
bmhhbmNlciBpZiBpdCBpcyBhIDJ4KyB1cHNjYWxpbmcgKi8KKwlkZmxvdy0+ZW5faW1nX2VuaGFu
Y2VtZW50ID0gZGZsb3ctPm91dF93ID49IDIgKiB3IHx8CisJCQkJICAgIGRmbG93LT5vdXRfaCA+
PSAyICogaDsKKworCS8qIHRyeSB0byBlbmFibGUgc3BsaXQgaWYgc2NhbGluZyBleGNlZWQgdGhl
IHNjYWxlcidzIGFjY2VwdGFibGUKKwkgKiBpbnB1dC9vdXRwdXQgcmFuZ2UuCisJICovCisJaWYg
KGRmbG93LT5lbl9zY2FsaW5nICYmIHNjYWxlcikKKwkJZGZsb3ctPmVuX3NwbGl0ID0gIWluX3Jh
bmdlKCZzY2FsZXItPmhzaXplLCBkZmxvdy0+aW5fdykgfHwKKwkJCQkgICFpbl9yYW5nZSgmc2Nh
bGVyLT5oc2l6ZSwgZGZsb3ctPm91dF93KTsKIH0KIAogc3RhdGljIGJvb2wgbWVyZ2VyX2lzX2F2
YWlsYWJsZShzdHJ1Y3Qga29tZWRhX3BpcGVsaW5lICpwaXBlLApkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGxhbmUuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BsYW5lLmMKaW5kZXggNWJiODU1M2NjMTE3
Li5jMDk1YWYxNTQyMTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9r
b21lZGEva29tZWRhX3BsYW5lLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tv
bWVkYS9rb21lZGFfcGxhbmUuYwpAQCAtMTgsNyArMTgsNiBAQCBrb21lZGFfcGxhbmVfaW5pdF9k
YXRhX2Zsb3coc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqc3QsCiAJCQkgICAgc3RydWN0IGtvbWVk
YV9kYXRhX2Zsb3dfY2ZnICpkZmxvdykKIHsKIAlzdHJ1Y3Qga29tZWRhX3BsYW5lICprcGxhbmUg
PSB0b19rcGxhbmUoc3QtPnBsYW5lKTsKLQlzdHJ1Y3Qga29tZWRhX3BsYW5lX3N0YXRlICprcGxh
bmVfc3QgPSB0b19rcGxhbmVfc3Qoc3QpOwogCXN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiID0g
c3QtPmZiOwogCWNvbnN0IHN0cnVjdCBrb21lZGFfZm9ybWF0X2NhcHMgKmNhcHMgPSB0b19rZmIo
ZmIpLT5mb3JtYXRfY2FwczsKIAlzdHJ1Y3Qga29tZWRhX3BpcGVsaW5lICpwaXBlID0ga3BsYW5l
LT5sYXllci0+YmFzZS5waXBlbGluZTsKQEAgLTU3LDEwICs1Niw3IEBAIGtvbWVkYV9wbGFuZV9p
bml0X2RhdGFfZmxvdyhzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpzdCwKIAkJcmV0dXJuIC1FSU5W
QUw7CiAJfQogCi0JZGZsb3ctPmVuX2ltZ19lbmhhbmNlbWVudCA9ICEha3BsYW5lX3N0LT5pbWdf
ZW5oYW5jZW1lbnQ7Ci0JZGZsb3ctPmVuX3NwbGl0ID0gISFrcGxhbmVfc3QtPmxheWVyX3NwbGl0
OwotCi0Ja29tZWRhX2NvbXBsZXRlX2RhdGFfZmxvd19jZmcoZGZsb3csIGZiKTsKKwlrb21lZGFf
Y29tcGxldGVfZGF0YV9mbG93X2NmZyhrcGxhbmUtPmxheWVyLCBkZmxvdywgZmIpOwogCiAJcmV0
dXJuIDA7CiB9CkBAIC0xNzUsOCArMTcxLDYgQEAga29tZWRhX3BsYW5lX2F0b21pY19kdXBsaWNh
dGVfc3RhdGUoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUpCiAKIAlvbGQgPSB0b19rcGxhbmVfc3Qo
cGxhbmUtPnN0YXRlKTsKIAotCW5ldy0+aW1nX2VuaGFuY2VtZW50ID0gb2xkLT5pbWdfZW5oYW5j
ZW1lbnQ7Ci0KIAlyZXR1cm4gJm5ldy0+YmFzZTsKIH0KIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfd2JfY29ubmVjdG9yLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV93Yl9jb25uZWN0b3IuYwppbmRleCBi
YjhhNjFmNmU5YTQuLjYxN2UxZjdiODQ3MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfd2JfY29ubmVjdG9yLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfd2JfY29ubmVjdG9yLmMKQEAgLTEzLDcgKzEz
LDYgQEAga29tZWRhX3diX2luaXRfZGF0YV9mbG93KHN0cnVjdCBrb21lZGFfbGF5ZXIgKndiX2xh
eWVyLAogCQkJIHN0cnVjdCBrb21lZGFfY3J0Y19zdGF0ZSAqa2NydGNfc3QsCiAJCQkgc3RydWN0
IGtvbWVkYV9kYXRhX2Zsb3dfY2ZnICpkZmxvdykKIHsKLQlzdHJ1Y3Qga29tZWRhX3NjYWxlciAq
c2NhbGVyID0gd2JfbGF5ZXItPmJhc2UucGlwZWxpbmUtPnNjYWxlcnNbMF07CiAJc3RydWN0IGRy
bV9mcmFtZWJ1ZmZlciAqZmIgPSBjb25uX3N0LT53cml0ZWJhY2tfam9iLT5mYjsKIAogCW1lbXNl
dChkZmxvdywgMCwgc2l6ZW9mKCpkZmxvdykpOwpAQCAtMjgsMTQgKzI3LDcgQEAga29tZWRhX3di
X2luaXRfZGF0YV9mbG93KHN0cnVjdCBrb21lZGFfbGF5ZXIgKndiX2xheWVyLAogCWRmbG93LT5w
aXhlbF9ibGVuZF9tb2RlID0gRFJNX01PREVfQkxFTkRfUElYRUxfTk9ORTsKIAlkZmxvdy0+cm90
ID0gRFJNX01PREVfUk9UQVRFXzA7CiAKLQlrb21lZGFfY29tcGxldGVfZGF0YV9mbG93X2NmZyhk
ZmxvdywgZmIpOwotCi0JLyogaWYgc2NhbGluZyBleGNlZWQgdGhlIGFjY2VwdGFibGUgc2NhbGVy
IGlucHV0L291dHB1dCByYW5nZSwgdHJ5IHRvCi0JICogZW5hYmxlIHNwbGl0LgotCSAqLwotCWlm
IChkZmxvdy0+ZW5fc2NhbGluZyAmJiBzY2FsZXIpCi0JCWRmbG93LT5lbl9zcGxpdCA9ICFpbl9y
YW5nZSgmc2NhbGVyLT5oc2l6ZSwgZGZsb3ctPmluX3cpIHx8Ci0JCQkJICAhaW5fcmFuZ2UoJnNj
YWxlci0+aHNpemUsIGRmbG93LT5vdXRfdyk7CisJa29tZWRhX2NvbXBsZXRlX2RhdGFfZmxvd19j
Zmcod2JfbGF5ZXIsIGRmbG93LCBmYik7CiAKIAlyZXR1cm4gMDsKIH0KLS0gCjIuMjAuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
