Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B525527B68
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 13:10:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 266CB89DBD;
	Thu, 23 May 2019 11:10:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20044.outbound.protection.outlook.com [40.107.2.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 441FA89DBD
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 11:10:12 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5166.eurprd08.prod.outlook.com (20.179.30.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.18; Thu, 23 May 2019 11:10:09 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358%7]) with mapi id 15.20.1922.017; Thu, 23 May 2019
 11:10:09 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>
Subject: [PATCH v2 3/6] drm/komeda: Implement D71 scaler support
Thread-Topic: [PATCH v2 3/6] drm/komeda: Implement D71 scaler support
Thread-Index: AQHVEVgVtotSxs1sYkiKoL99Wga2gA==
Date: Thu, 23 May 2019 11:10:09 +0000
Message-ID: <20190523110933.10742-4-james.qian.wang@arm.com>
References: <20190523110933.10742-1-james.qian.wang@arm.com>
In-Reply-To: <20190523110933.10742-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR02CA0191.apcprd02.prod.outlook.com
 (2603:1096:201:21::27) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ea60dff4-9fba-4c9a-9f8d-08d6df6f37f0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB5166; 
x-ms-traffictypediagnostic: VE1PR08MB5166:
nodisclaimer: True
x-microsoft-antispam-prvs: <VE1PR08MB5166BE9D157095DFCCA18958B3010@VE1PR08MB5166.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 00462943DE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(366004)(376002)(346002)(136003)(39860400002)(199004)(189003)(6512007)(25786009)(50226002)(53936002)(476003)(256004)(14444005)(6436002)(103116003)(446003)(2616005)(11346002)(99286004)(486006)(4326008)(6486002)(81156014)(26005)(81166006)(36756003)(66066001)(54906003)(110136005)(8676002)(2906002)(316002)(8936002)(73956011)(66946007)(2501003)(305945005)(68736007)(7736002)(64756008)(186003)(66556008)(1076003)(76176011)(55236004)(66446008)(66476007)(86362001)(6506007)(386003)(71200400001)(71190400001)(478600001)(3846002)(52116002)(6116002)(2201001)(102836004)(14454004)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5166;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rmISrRnUdXs4mzYVZtmG5SVIfwus/aH3QLjRv3Y3lPNUsKPQHxvCzyiowNyDxrlzF6q/sKW8A78h92ehiqPzuWSB4A3H/pMuFsB+HeGUk55RI7rllqlrGG04hk846xxi4kscWmL92DxZAzaf5bCAlJ0FFGQ8ZMBnzeBJs7jo4HBIv7YkxzLMpNGZN1sjske1l6QYZMk4I7CamowO5dQOHV1g8gmgOQQIRjyfl4zlrw9H/mKw6pEwRkbX/hB4KFiTXLWUR0Kz2ko56EZV88SlYoJ2ckpYEpsMY6xOl3bnIqLfnoj4+F3P44TR3BEYWfi3bcQMKe8Yf/0TQ5BmJy0HLndIb09t+Lzg+JfURmQhI/nUgVjSGCFg5g5EbgkmwDNNtTk4puEctjgaU7xtuFjBfv56vn6ISoyhirZ8U5XXbqQ=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea60dff4-9fba-4c9a-9f8d-08d6df6f37f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2019 11:10:09.5412 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: james.qian.wang@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5166
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/XvXheS014p6Gdjlo3b+jaHQta74WXAKPDAtQPCJlg=;
 b=BD0rqyiZaiRp7BrnZtaco4nyDMHaJ2GFZhi/L6NytSJuHGZq7JhRh9UR11uR1i2WBdMXJL0qwy9UVLBMAYbRNXi9WUyGGNZTwcEdjLLYu8UDx3Nn/G8okJyVxfBuJ+2+gXa/uizMCuHhJ1P9DzcEVacIPXPaOiC17lAeA1UGSKs=
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

MS4gQWRkIHNjYWxlciBjb21wb25lbnQgYW5kIGluaXRpYWxpemUgaXQgYWNjb3JkaW5nIHRvIEQ3
MSBIVy4NCjIuIEltcGxlbWVudCBkNzFfc2NhbGVyX3VwZGF0ZS9kaXNhYmxlL2R1bXANCg0KdjI6
DQotIENvcnJlY3QgYSB0eXBvDQotIENvbnN0aWZ5IGNvbXBvbmVudF9mdW5jczogZDcxX3NjYWxl
cl9mdW5jcw0KDQpTaWduZWQtb2ZmLWJ5OiBKYW1lcyBRaWFuIFdhbmcgKEFybSBUZWNobm9sb2d5
IENoaW5hKSA8amFtZXMucWlhbi53YW5nQGFybS5jb20+DQotLS0NCiAuLi4vYXJtL2Rpc3BsYXkv
a29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMgICAgfCAxMzEgKysrKysrKysrKysrKysrKystDQog
MSBmaWxlIGNoYW5nZWQsIDEzMCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9u
ZW50LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9u
ZW50LmMNCmluZGV4IDVjOWJjODU5Zjg4Ni4uMGJmNWM3YmFlZGI1IDEwMDY0NA0KLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2NvbXBvbmVudC5jDQorKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMN
CkBAIC01NTEsNiArNTUxLDEzMiBAQCBzdGF0aWMgaW50IGQ3MV9jb21waXpfaW5pdChzdHJ1Y3Qg
ZDcxX2RldiAqZDcxLA0KIAlyZXR1cm4gMDsNCiB9DQogDQorc3RhdGljIHZvaWQgZDcxX3NjYWxl
cl91cGRhdGVfZmlsdGVyX2x1dCh1MzIgX19pb21lbSAqcmVnLCB1MzIgaHNpemVfaW4sDQorCQkJ
CQkgdTMyIHZzaXplX2luLCB1MzIgaHNpemVfb3V0LA0KKwkJCQkJIHUzMiB2c2l6ZV9vdXQpDQor
ew0KKwl1MzIgdmFsID0gMDsNCisNCisJaWYgKGhzaXplX2luIDw9IGhzaXplX291dCkNCisJCXZh
bCAgfD0gMHg2MjsNCisJZWxzZSBpZiAoaHNpemVfaW4gPD0gKGhzaXplX291dCArIGhzaXplX291
dCAvIDIpKQ0KKwkJdmFsIHw9IDB4NjM7DQorCWVsc2UgaWYgKGhzaXplX2luIDw9IGhzaXplX291
dCAqIDIpDQorCQl2YWwgfD0gMHg2NDsNCisJZWxzZSBpZiAoaHNpemVfaW4gPD0gaHNpemVfb3V0
ICogMiArIChoc2l6ZV9vdXQgKiAzKSAvIDQpDQorCQl2YWwgfD0gMHg2NTsNCisJZWxzZQ0KKwkJ
dmFsIHw9IDB4NjY7DQorDQorCWlmICh2c2l6ZV9pbiA8PSB2c2l6ZV9vdXQpDQorCQl2YWwgIHw9
IFNDX1ZUU0VMKDB4NkEpOw0KKwllbHNlIGlmICh2c2l6ZV9pbiA8PSAodnNpemVfb3V0ICsgdnNp
emVfb3V0IC8gMikpDQorCQl2YWwgfD0gU0NfVlRTRUwoMHg2Qik7DQorCWVsc2UgaWYgKHZzaXpl
X2luIDw9IHZzaXplX291dCAqIDIpDQorCQl2YWwgfD0gU0NfVlRTRUwoMHg2Qyk7DQorCWVsc2Ug
aWYgKHZzaXplX2luIDw9IHZzaXplX291dCAqIDIgKyB2c2l6ZV9vdXQgKiAzIC8gNCkNCisJCXZh
bCB8PSBTQ19WVFNFTCgweDZEKTsNCisJZWxzZQ0KKwkJdmFsIHw9IFNDX1ZUU0VMKDB4NkUpOw0K
Kw0KKwltYWxpZHBfd3JpdGUzMihyZWcsIFNDX0NPRUZGVEFCLCB2YWwpOw0KK30NCisNCitzdGF0
aWMgdm9pZCBkNzFfc2NhbGVyX3VwZGF0ZShzdHJ1Y3Qga29tZWRhX2NvbXBvbmVudCAqYywNCisJ
CQkgICAgICBzdHJ1Y3Qga29tZWRhX2NvbXBvbmVudF9zdGF0ZSAqc3RhdGUpDQorew0KKwlzdHJ1
Y3Qga29tZWRhX3NjYWxlcl9zdGF0ZSAqc3QgPSB0b19zY2FsZXJfc3Qoc3RhdGUpOw0KKwl1MzIg
X19pb21lbSAqcmVnID0gYy0+cmVnOw0KKwl1MzIgaW5pdF9waCwgZGVsdGFfcGgsIGN0cmw7DQor
DQorCWQ3MV9zY2FsZXJfdXBkYXRlX2ZpbHRlcl9sdXQocmVnLCBzdC0+aHNpemVfaW4sIHN0LT52
c2l6ZV9pbiwNCisJCQkJICAgICBzdC0+aHNpemVfb3V0LCBzdC0+dnNpemVfb3V0KTsNCisNCisJ
bWFsaWRwX3dyaXRlMzIocmVnLCBCTEtfSU5fU0laRSwgSFZfU0laRShzdC0+aHNpemVfaW4sIHN0
LT52c2l6ZV9pbikpOw0KKwltYWxpZHBfd3JpdGUzMihyZWcsIFNDX09VVF9TSVpFLCBIVl9TSVpF
KHN0LT5oc2l6ZV9vdXQsIHN0LT52c2l6ZV9vdXQpKTsNCisNCisJaW5pdF9waCA9IChzdC0+aHNp
emVfaW4gPDwgMTUpIC8gc3QtPmhzaXplX291dDsNCisJbWFsaWRwX3dyaXRlMzIocmVnLCBTQ19I
X0lOSVRfUEgsIGluaXRfcGgpOw0KKw0KKwlkZWx0YV9waCA9IChzdC0+aHNpemVfaW4gPDwgMTYp
IC8gc3QtPmhzaXplX291dDsNCisJbWFsaWRwX3dyaXRlMzIocmVnLCBTQ19IX0RFTFRBX1BILCBk
ZWx0YV9waCk7DQorDQorCWluaXRfcGggPSAoc3QtPnZzaXplX2luIDw8IDE1KSAvIHN0LT52c2l6
ZV9vdXQ7DQorCW1hbGlkcF93cml0ZTMyKHJlZywgU0NfVl9JTklUX1BILCBpbml0X3BoKTsNCisN
CisJZGVsdGFfcGggPSAoc3QtPnZzaXplX2luIDw8IDE2KSAvIHN0LT52c2l6ZV9vdXQ7DQorCW1h
bGlkcF93cml0ZTMyKHJlZywgU0NfVl9ERUxUQV9QSCwgZGVsdGFfcGgpOw0KKw0KKwljdHJsID0g
MDsNCisJY3RybCB8PSBzdC0+ZW5fc2NhbGluZyA/IFNDX0NUUkxfU0NMIDogMDsNCisJY3RybCB8
PSBzdC0+ZW5fYWxwaGEgPyBTQ19DVFJMX0FQIDogMDsNCisNCisJbWFsaWRwX3dyaXRlMzIocmVn
LCBCTEtfQ09OVFJPTCwgY3RybCk7DQorCW1hbGlkcF93cml0ZTMyKHJlZywgQkxLX0lOUFVUX0lE
MCwgdG9fZDcxX2lucHV0X2lkKCZzdGF0ZS0+aW5wdXRzWzBdKSk7DQorfQ0KKw0KK3N0YXRpYyB2
b2lkIGQ3MV9zY2FsZXJfZHVtcChzdHJ1Y3Qga29tZWRhX2NvbXBvbmVudCAqYywgc3RydWN0IHNl
cV9maWxlICpzZikNCit7DQorCXUzMiB2WzldOw0KKw0KKwlkdW1wX2Jsb2NrX2hlYWRlcihzZiwg
Yy0+cmVnKTsNCisNCisJZ2V0X3ZhbHVlc19mcm9tX3JlZyhjLT5yZWcsIDB4ODAsIDEsIHYpOw0K
KwlzZXFfcHJpbnRmKHNmLCAiU0NfSU5QVVRfSUQwOlx0XHQweCVYXG4iLCB2WzBdKTsNCisNCisJ
Z2V0X3ZhbHVlc19mcm9tX3JlZyhjLT5yZWcsIDB4RDAsIDEsIHYpOw0KKwlzZXFfcHJpbnRmKHNm
LCAiU0NfQ09OVFJPTDpcdFx0MHglWFxuIiwgdlswXSk7DQorDQorCWdldF92YWx1ZXNfZnJvbV9y
ZWcoYy0+cmVnLCAweERDLCA5LCB2KTsNCisJc2VxX3ByaW50ZihzZiwgIlNDX0NPRUZGVEFCOlx0
XHQweCVYXG4iLCB2WzBdKTsNCisJc2VxX3ByaW50ZihzZiwgIlNDX0lOX1NJWkU6XHRcdDB4JVhc
biIsIHZbMV0pOw0KKwlzZXFfcHJpbnRmKHNmLCAiU0NfT1VUX1NJWkU6XHRcdDB4JVhcbiIsIHZb
Ml0pOw0KKwlzZXFfcHJpbnRmKHNmLCAiU0NfSF9DUk9QOlx0XHQweCVYXG4iLCB2WzNdKTsNCisJ
c2VxX3ByaW50ZihzZiwgIlNDX1ZfQ1JPUDpcdFx0MHglWFxuIiwgdls0XSk7DQorCXNlcV9wcmlu
dGYoc2YsICJTQ19IX0lOSVRfUEg6XHRcdDB4JVhcbiIsIHZbNV0pOw0KKwlzZXFfcHJpbnRmKHNm
LCAiU0NfSF9ERUxUQV9QSDpcdFx0MHglWFxuIiwgdls2XSk7DQorCXNlcV9wcmludGYoc2YsICJT
Q19WX0lOSVRfUEg6XHRcdDB4JVhcbiIsIHZbN10pOw0KKwlzZXFfcHJpbnRmKHNmLCAiU0NfVl9E
RUxUQV9QSDpcdFx0MHglWFxuIiwgdls4XSk7DQorfQ0KKw0KK3N0YXRpYyBjb25zdCBzdHJ1Y3Qg
a29tZWRhX2NvbXBvbmVudF9mdW5jcyBkNzFfc2NhbGVyX2Z1bmNzID0gew0KKwkudXBkYXRlCQk9
IGQ3MV9zY2FsZXJfdXBkYXRlLA0KKwkuZGlzYWJsZQk9IGQ3MV9jb21wb25lbnRfZGlzYWJsZSwN
CisJLmR1bXBfcmVnaXN0ZXIJPSBkNzFfc2NhbGVyX2R1bXAsDQorfTsNCisNCitzdGF0aWMgaW50
IGQ3MV9zY2FsZXJfaW5pdChzdHJ1Y3QgZDcxX2RldiAqZDcxLA0KKwkJCSAgIHN0cnVjdCBibG9j
a19oZWFkZXIgKmJsaywgdTMyIF9faW9tZW0gKnJlZykNCit7DQorCXN0cnVjdCBrb21lZGFfY29t
cG9uZW50ICpjOw0KKwlzdHJ1Y3Qga29tZWRhX3NjYWxlciAqc2NhbGVyOw0KKwl1MzIgcGlwZV9p
ZCwgY29tcF9pZDsNCisNCisJZ2V0X3Jlc291cmNlc19pZChibGstPmJsb2NrX2luZm8sICZwaXBl
X2lkLCAmY29tcF9pZCk7DQorDQorCWMgPSBrb21lZGFfY29tcG9uZW50X2FkZCgmZDcxLT5waXBl
c1twaXBlX2lkXS0+YmFzZSwgc2l6ZW9mKCpzY2FsZXIpLA0KKwkJCQkgY29tcF9pZCwgQkxPQ0tf
SU5GT19JTlBVVF9JRChibGstPmJsb2NrX2luZm8pLA0KKwkJCQkgJmQ3MV9zY2FsZXJfZnVuY3Ms
DQorCQkJCSAxLCBnZXRfdmFsaWRfaW5wdXRzKGJsayksIDEsIHJlZywNCisJCQkJICJDVSVkX1ND
QUxFUiVkIiwNCisJCQkJIHBpcGVfaWQsIEJMT0NLX0lORk9fQkxLX0lEKGJsay0+YmxvY2tfaW5m
bykpOw0KKw0KKwlpZiAoSVNfRVJSKGMpKSB7DQorCQlEUk1fRVJST1IoIkZhaWxlZCB0byBpbml0
aWFsaXplIHNjYWxlciIpOw0KKwkJcmV0dXJuIFBUUl9FUlIoYyk7DQorCX0NCisNCisJc2NhbGVy
ID0gdG9fc2NhbGVyKGMpOw0KKwlzZXRfcmFuZ2UoJnNjYWxlci0+aHNpemUsIDQsIGQ3MS0+bWF4
X2xpbmVfc2l6ZSk7DQorCXNldF9yYW5nZSgmc2NhbGVyLT52c2l6ZSwgNCwgNDA5Nik7DQorCXNj
YWxlci0+bWF4X2Rvd25zY2FsaW5nID0gNjsNCisJc2NhbGVyLT5tYXhfdXBzY2FsaW5nID0gNjQ7
DQorDQorCW1hbGlkcF93cml0ZTMyKGMtPnJlZywgQkxLX0NPTlRST0wsIDApOw0KKw0KKwlyZXR1
cm4gMDsNCit9DQorDQogc3RhdGljIHZvaWQgZDcxX2ltcHJvY191cGRhdGUoc3RydWN0IGtvbWVk
YV9jb21wb25lbnQgKmMsDQogCQkJICAgICAgc3RydWN0IGtvbWVkYV9jb21wb25lbnRfc3RhdGUg
KnN0YXRlKQ0KIHsNCkBAIC03NzEsOCArODk3LDExIEBAIGludCBkNzFfcHJvYmVfYmxvY2soc3Ry
dWN0IGQ3MV9kZXYgKmQ3MSwNCiAJCWVyciA9IGQ3MV9jb21waXpfaW5pdChkNzEsIGJsaywgcmVn
KTsNCiAJCWJyZWFrOw0KIA0KLQljYXNlIEQ3MV9CTEtfVFlQRV9DVV9TUExJVFRFUjoNCiAJY2Fz
ZSBENzFfQkxLX1RZUEVfQ1VfU0NBTEVSOg0KKwkJZXJyID0gZDcxX3NjYWxlcl9pbml0KGQ3MSwg
YmxrLCByZWcpOw0KKwkJYnJlYWs7DQorDQorCWNhc2UgRDcxX0JMS19UWVBFX0NVX1NQTElUVEVS
Og0KIAljYXNlIEQ3MV9CTEtfVFlQRV9DVV9NRVJHRVI6DQogCQlicmVhazsNCiANCi0tIA0KMi4x
Ny4xDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
