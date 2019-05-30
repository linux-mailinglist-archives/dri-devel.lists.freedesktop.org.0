Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 506CC2F7E3
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2019 09:26:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08E736E0AC;
	Thu, 30 May 2019 07:26:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150071.outbound.protection.outlook.com [40.107.15.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B44D6E0AC
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2019 07:26:36 +0000 (UTC)
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com (52.133.246.150) by
 VI1PR08MB4285.eurprd08.prod.outlook.com (20.179.25.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.16; Thu, 30 May 2019 07:26:32 +0000
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::ada6:12ed:65d0:4629]) by VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::ada6:12ed:65d0:4629%4]) with mapi id 15.20.1922.021; Thu, 30 May 2019
 07:26:32 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "james qian wang (Arm Technology
 China)" <james.qian.wang@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "seanpaul@chromium.org"
 <seanpaul@chromium.org>, "airlied@linux.ie" <airlied@linux.ie>, Brian Starkey
 <Brian.Starkey@arm.com>
Subject: [PATCH] drm/komeda: Adds gamma and color-transform support for DOU-IPS
Thread-Topic: [PATCH] drm/komeda: Adds gamma and color-transform support for
 DOU-IPS
Thread-Index: AQHVFrkBpv04RIOEP0OWo9CBhVRsvQ==
Date: Thu, 30 May 2019 07:26:32 +0000
Message-ID: <1559201154-6587-1-git-send-email-lowry.li@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR02CA0186.apcprd02.prod.outlook.com
 (2603:1096:201:21::22) To VI1PR08MB5488.eurprd08.prod.outlook.com
 (2603:10a6:803:137::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 1.9.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0bb258d3-4649-4ce2-3f04-08d6e4d02343
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB4285; 
x-ms-traffictypediagnostic: VI1PR08MB4285:
x-ms-exchange-purlcount: 9
nodisclaimer: True
x-microsoft-antispam-prvs: <VI1PR08MB42854A42CA45B2DBAD11DDA79F180@VI1PR08MB4285.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 00531FAC2C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(376002)(136003)(396003)(39860400002)(346002)(189003)(199004)(4326008)(53936002)(486006)(86362001)(305945005)(7736002)(26005)(6486002)(186003)(68736007)(66066001)(476003)(73956011)(316002)(6306002)(2501003)(2616005)(66946007)(2906002)(25786009)(6436002)(6512007)(99286004)(36756003)(6636002)(110136005)(3846002)(6116002)(54906003)(14444005)(256004)(71200400001)(71190400001)(72206003)(55236004)(386003)(5660300002)(52116002)(64756008)(66446008)(66476007)(50226002)(81166006)(14454004)(8676002)(102836004)(966005)(8936002)(81156014)(66556008)(6506007)(478600001)(2201001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4285;
 H:VI1PR08MB5488.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XhtSuxRtBVG2jdboUyDesUrqwipkchP4WUdhnCASh+kcxz5phSEpHlY7vH1ceBvgO7DUY/pna2ixI55zkwFnAY2esXyxt9MNefla6pO+CdKl4WCJf280RkXROQY/Tb7LKY0ibubeu19kKttCS5RndiYr8z/JDpZMZF1Af/cWwvzpfUuXfqqJIVDYW0eTEsOU3XjmBrQxN+61T1PO3jagHXn9yL1vg7bz3wfb3VYI+kB47Ciw87U0Pz80yQh3+5gbwz+dw1PLfQCiSLutDcvEZQSiV9HDuJ3EnJjmsBwBogHXcDIJrG3p9N05l/CgIwz/RetW6ckguS6MvzcK51KxRQDs04NSWeJG8Ib2pymIop97Mue2Lf/Fb53iSmbKWZPvvBiKEcagXwj5N4S4Ho4BKic41herOHt8zrrj8BtJXMQ=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bb258d3-4649-4ce2-3f04-08d6e4d02343
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2019 07:26:32.6522 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lowry.Li@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4285
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=01gwSFAYA3Uk4IeDNbVDz4hKTeRat6clKeRgvLpNlk8=;
 b=nOggFycEOQ4lxv/jIjiJjA+OgMu+qrclk2HNd0DgJGuepj5Zc8HW9f5Gut6xF8El9S3c0TqDtRaxG2fznnXZFzfXGyqW1mng+/hvLgaAz3C209a2bsHhMm5RA4qjzp9TQEiehyaCB/5Y/5Yf+Aj4SIwFohSCiuG67yOqm1Or3dc=
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

QWRkcyBnYW1tYSBhbmQgY29sb3ItdHJhbnNmb3JtIHN1cHBvcnQgZm9yIERPVS1JUFMuDQpBZGRz
IHR3byBjYXBzIG1lbWJlcnMgZmdhbW1hX2NvZWZmcyBhbmQgY3RtX2NvZWZmcyB0byBrb21lZGFf
aW1wcm9jX3N0YXRlLg0KSWYgY29sb3IgbWFuYWdlbWVudCBjaGFuZ2VkLCBzZXQgZ2FtbWEgYW5k
IGNvbG9yLXRyYW5zZm9ybSBhY2NvcmRpbmdseS4NCg0KVGhpcyBwYXRjaCBzZXJpZXMgZGVwZW5k
cyBvbjoNCi0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy81ODcxMC8N
Ci0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy81OTAwMC8NCi0gaHR0
cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy81OTAwMi8NCi0gaHR0cHM6Ly9w
YXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy81OTc0Ny8NCi0gaHR0cHM6Ly9wYXRjaHdv
cmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy81OTkxNS8NCi0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJl
ZWRlc2t0b3Aub3JnL3Nlcmllcy82MDA4My8NCi0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0
b3Aub3JnL3Nlcmllcy82MDY5OC8NCi0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3Jn
L3Nlcmllcy82MDg1Ni8NCi0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmll
cy82MDg5My8NCg0KU2lnbmVkLW9mZi1ieTogTG93cnkgTGkgKEFybSBUZWNobm9sb2d5IENoaW5h
KSA8bG93cnkubGlAYXJtLmNvbT4NCi0tLQ0KIC4uLi9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9kNzEvZDcxX2NvbXBvbmVudC5jIHwgMjQgKysrKysrKysrKysrKysrKysrKysrKw0KIGRyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYyAgIHwgIDIgKysNCiAu
Li4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmggICB8ICAzICsr
Kw0KIC4uLi9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jIHwg
IDYgKysrKysrDQogNCBmaWxlcyBjaGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50
LmMNCmluZGV4IDk2NjgwNjMuLjI0MGY4MmMgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMNCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYw0KQEAgLTg4MiwxNSAr
ODgyLDM5IEBAIHN0YXRpYyBpbnQgZDcxX2Rvd25zY2FsaW5nX2Nsa19jaGVjayhzdHJ1Y3Qga29t
ZWRhX3BpcGVsaW5lICpwaXBlLA0KIHN0YXRpYyB2b2lkIGQ3MV9pbXByb2NfdXBkYXRlKHN0cnVj
dCBrb21lZGFfY29tcG9uZW50ICpjLA0KIAkJCSAgICAgIHN0cnVjdCBrb21lZGFfY29tcG9uZW50
X3N0YXRlICpzdGF0ZSkNCiB7DQorCXN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqY3J0Y19zdCA9IHN0
YXRlLT5jcnRjLT5zdGF0ZTsNCiAJc3RydWN0IGtvbWVkYV9pbXByb2Nfc3RhdGUgKnN0ID0gdG9f
aW1wcm9jX3N0KHN0YXRlKTsNCisJc3RydWN0IGQ3MV9waXBlbGluZSAqcGlwZSA9IHRvX2Q3MV9w
aXBlbGluZShjLT5waXBlbGluZSk7DQogCXUzMiBfX2lvbWVtICpyZWcgPSBjLT5yZWc7DQogCXUz
MiBpbmRleDsNCisJdTMyIG1hc2sgPSAwLCBjdHJsID0gMDsNCiANCiAJZm9yX2VhY2hfY2hhbmdl
ZF9pbnB1dChzdGF0ZSwgaW5kZXgpDQogCQltYWxpZHBfd3JpdGUzMihyZWcsIEJMS19JTlBVVF9J
RDAgKyBpbmRleCAqIDQsDQogCQkJICAgICAgIHRvX2Q3MV9pbnB1dF9pZChzdGF0ZSwgaW5kZXgp
KTsNCiANCiAJbWFsaWRwX3dyaXRlMzIocmVnLCBCTEtfU0laRSwgSFZfU0laRShzdC0+aHNpemUs
IHN0LT52c2l6ZSkpOw0KKw0KKwlpZiAoY3J0Y19zdC0+Y29sb3JfbWdtdF9jaGFuZ2VkKSB7DQor
CQltYXNrIHw9IElQU19DVFJMX0ZUIHwgSVBTX0NUUkxfUkdCOw0KKw0KKwkJaWYgKGNydGNfc3Qt
PmdhbW1hX2x1dCkgew0KKwkJCW1hbGlkcF93cml0ZV9ncm91cChwaXBlLT5kb3VfZnRfY29lZmZf
YWRkciwgRlRfQ09FRkYwLA0KKwkJCQkJICAgS09NRURBX05fR0FNTUFfQ09FRkZTLA0KKwkJCQkJ
ICAgc3QtPmZnYW1tYV9jb2VmZnMpOw0KKwkJCWN0cmwgfD0gSVBTX0NUUkxfRlQ7IC8qIGVuYWJs
ZSBnYW1tYSAqLw0KKwkJfQ0KKw0KKwkJaWYgKGNydGNfc3QtPmN0bSkgew0KKwkJCW1hbGlkcF93
cml0ZV9ncm91cChyZWcsIElQU19SR0JfUkdCX0NPRUZGMCwNCisJCQkJCSAgIEtPTUVEQV9OX0NU
TV9DT0VGRlMsDQorCQkJCQkgICBzdC0+Y3RtX2NvZWZmcyk7DQorCQkJY3RybCB8PSBJUFNfQ1RS
TF9SR0I7IC8qIGVuYWJsZSBnYW11dCAqLw0KKwkJfQ0KKwl9DQorDQorCWlmIChtYXNrKQ0KKwkJ
bWFsaWRwX3dyaXRlMzJfbWFzayhyZWcsIEJMS19DT05UUk9MLCBtYXNrLCBjdHJsKTsNCiB9DQog
DQogc3RhdGljIHZvaWQgZDcxX2ltcHJvY19kdW1wKHN0cnVjdCBrb21lZGFfY29tcG9uZW50ICpj
LCBzdHJ1Y3Qgc2VxX2ZpbGUgKnNmKQ0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX2NydGMuYw0KaW5kZXggMjRhOTYxMy4uMThjMjNmOCAxMDA2NDQNCi0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYw0KKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jDQpAQCAt
NTczLDYgKzU3Myw4IEBAIHN0YXRpYyBpbnQga29tZWRhX2NydGNfYWRkKHN0cnVjdCBrb21lZGFf
a21zX2RldiAqa21zLA0KIAlpZiAoZXJyKQ0KIAkJcmV0dXJuIGVycjsNCiANCisJZHJtX2NydGNf
ZW5hYmxlX2NvbG9yX21nbXQoY3J0YywgMCwgdHJ1ZSwgS09NRURBX0NPTE9SX0xVVF9TSVpFKTsN
CisNCiAJcmV0dXJuIDA7DQogfQ0KIA0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmggYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oDQppbmRleCA0OWJiMDU4Li45ODk0MDhiIDEw
MDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlw
ZWxpbmUuaA0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
cGlwZWxpbmUuaA0KQEAgLTExLDYgKzExLDcgQEANCiAjaW5jbHVkZSA8ZHJtL2RybV9hdG9taWMu
aD4NCiAjaW5jbHVkZSA8ZHJtL2RybV9hdG9taWNfaGVscGVyLmg+DQogI2luY2x1ZGUgIm1hbGlk
cF91dGlscy5oIg0KKyNpbmNsdWRlICJrb21lZGFfY29sb3JfbWdtdC5oIg0KIA0KICNkZWZpbmUg
S09NRURBX01BWF9QSVBFTElORVMJCTINCiAjZGVmaW5lIEtPTUVEQV9QSVBFTElORV9NQVhfTEFZ
RVJTCTQNCkBAIC0zMTMsNiArMzE0LDggQEAgc3RydWN0IGtvbWVkYV9pbXByb2Mgew0KIHN0cnVj
dCBrb21lZGFfaW1wcm9jX3N0YXRlIHsNCiAJc3RydWN0IGtvbWVkYV9jb21wb25lbnRfc3RhdGUg
YmFzZTsNCiAJdTE2IGhzaXplLCB2c2l6ZTsNCisJdTMyIGZnYW1tYV9jb2VmZnNbS09NRURBX05f
R0FNTUFfQ09FRkZTXTsNCisJdTMyIGN0bV9jb2VmZnNbS09NRURBX05fQ1RNX0NPRUZGU107DQog
fTsNCiANCiAvKiBkaXNwbGF5IHRpbWluZyBjb250cm9sbGVyICovDQpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVfc3RhdGUuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lX3N0YXRl
LmMNCmluZGV4IGFmYjIzMDEuLjgyZWE2Y2YgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jDQorKysgYi9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jDQpAQCAt
NzAwLDYgKzcwMCwxMiBAQCB2b2lkIHBpcGVsaW5lX2NvbXBvc2l0aW9uX3NpemUoc3RydWN0IGtv
bWVkYV9jcnRjX3N0YXRlICprY3J0Y19zdCwNCiAJc3QtPmhzaXplID0gZGZsb3ctPmluX3c7DQog
CXN0LT52c2l6ZSA9IGRmbG93LT5pbl9oOw0KIA0KKwlpZiAoa2NydGNfc3QtPmJhc2UuY29sb3Jf
bWdtdF9jaGFuZ2VkKSB7DQorCQlkcm1fbHV0X3RvX2ZnYW1tYV9jb2VmZnMoa2NydGNfc3QtPmJh
c2UuZ2FtbWFfbHV0LA0KKwkJCQkJIHN0LT5mZ2FtbWFfY29lZmZzKTsNCisJCWRybV9jdG1fdG9f
Y29lZmZzKGtjcnRjX3N0LT5iYXNlLmN0bSwgc3QtPmN0bV9jb2VmZnMpOw0KKwl9DQorDQogCWtv
bWVkYV9jb21wb25lbnRfYWRkX2lucHV0KCZzdC0+YmFzZSwgJmRmbG93LT5pbnB1dCwgMCk7DQog
CWtvbWVkYV9jb21wb25lbnRfc2V0X291dHB1dCgmZGZsb3ctPmlucHV0LCAmaW1wcm9jLT5iYXNl
LCAwKTsNCiANCi0tIA0KMS45LjENCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
