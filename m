Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 473E835A7B
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 12:35:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28BF7894DD;
	Wed,  5 Jun 2019 10:35:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60048.outbound.protection.outlook.com [40.107.6.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5017789350
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 10:35:35 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4670.eurprd08.prod.outlook.com (10.255.114.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Wed, 5 Jun 2019 10:35:32 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358%7]) with mapi id 15.20.1943.018; Wed, 5 Jun 2019
 10:35:32 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>
Subject: [PATCH 1/3] drm/komeda: Unify mclk/pclk/pipeline->aclk to one MCLK
Thread-Topic: [PATCH 1/3] drm/komeda: Unify mclk/pclk/pipeline->aclk to one
 MCLK
Thread-Index: AQHVG4pnBDzr0NGrek2q4CapHlQ2Aw==
Date: Wed, 5 Jun 2019 10:35:32 +0000
Message-ID: <20190605103506.22863-2-james.qian.wang@arm.com>
References: <20190605103506.22863-1-james.qian.wang@arm.com>
In-Reply-To: <20190605103506.22863-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0041.apcprd03.prod.outlook.com
 (2603:1096:203:2f::29) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 67296dcd-f70f-46da-87f4-08d6e9a18952
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4670; 
x-ms-traffictypediagnostic: VE1PR08MB4670:
nodisclaimer: True
x-microsoft-antispam-prvs: <VE1PR08MB4670822CEB9E313F00D81FD2B3160@VE1PR08MB4670.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:305;
x-forefront-prvs: 00594E8DBA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(376002)(136003)(366004)(396003)(346002)(199004)(189003)(103116003)(3846002)(110136005)(86362001)(81156014)(81166006)(2501003)(36756003)(66066001)(71200400001)(71190400001)(1076003)(52116002)(316002)(4326008)(99286004)(2906002)(76176011)(256004)(14444005)(54906003)(26005)(8676002)(6116002)(2201001)(386003)(68736007)(55236004)(102836004)(25786009)(7736002)(14454004)(6506007)(2616005)(11346002)(50226002)(486006)(446003)(53936002)(6512007)(476003)(6486002)(6436002)(305945005)(8936002)(73956011)(66446008)(64756008)(66556008)(66476007)(66946007)(186003)(478600001)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4670;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BvpQE7fiGm2dtRfKyB2SfU7F6//ahKKmIyLNkmXGlPNDoym+v3WJDHG+3WjohUoq+4faOR16nLSn1HKjYWlwRCd4EVV9LmhJI+U0rRPt3f+flR09EiFpIwgNqpgXUFWxj7KPcIUHTKJ7/J+IiJSpZj/sddekzwlSwSGUHshz2wR/b2FT4Go7AlxxiLv2pJpNRpRzfNjyH+lf603O9wT+C9Gz/nrqciZWZMtw5OqKxPZl6rkoUi7Hwur+fHFsXDfsG0vPtdJVF1eWu67mURUn7JD+aHZVrLgLf6qbOpMXN+tUcdHyvkIQV0RJCVRCi9P+26qWLI89nh91BqevlgkcQXsyCIkx3+AGp58vr+0bNpyUECR5js82Evgg46Ciero/9OXGT8+AFoJAkdHdh/mWcGwngBAbmhAf+5+U71paOVM=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67296dcd-f70f-46da-87f4-08d6e9a18952
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2019 10:35:32.5815 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: james.qian.wang@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4670
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zth6lmIUC0ihXdvvS2iNEHbpzEVMrZ66ZzIhVxRYYhs=;
 b=Jw7pjVBb4fVy6/qJLLM64LNzMsMKMLOgFotYmcT2+UldHMxXa3fP365BTpbhMNCLEaqehEs2zfJKrA2U75ohJmH7YdTRxiwS6M4ugDg8wdPNFRX0PZU5v6puY3l4mWZ174Ao1TTCjb4eBcoGyP3NeQSWGKYEmtOip3rUg+N3EWo=
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

Q3VycmVudCBrb21lZGEgZHJpdmVyIHVzZXMgdGhyZWUgZGVkaWNhdGVkIGNsa3MgZm9yIGEgc3Bl
Y2lmaWMgcHVycG9zZToNCi0gbWNsazogbWFpbiBlbmdpbmUgY2xvY2sNCi0gcGNsazogQVBCIGNs
b2NrDQotIHBpcGVsaW5lLT5hY2xrOiBBWEkgY2xvY2suDQoNCkJ1dCBwZXIgc3BlYyB0aGUga29t
ZWRhIEhXIG9ubHkgaGFzIHRocmVlIGlucHV0IGNsa3M6DQotIEFDTEs6IHVzZWQgZm9yIEFYSSBt
YXN0ZXJzLCBBUEIgc2xhdmUgYW5kIG1vc3QgcGlwZWxpbmUgcHJvY2Vzc2luZw0KLSBQWENMSyBm
b3IgcGlwZWxpbmUgMDogb3V0cHV0IHBpeGVsIGNsb2NrIGZvciBwaXBlbGluZSAwDQotIFBYQ0xL
IGZvciBwaXBlbGluZSAxOiBvdXRwdXQgcGl4ZWwgY2xvY2sgZm9yIHBpcGVsaW5lIDENCg0KU28g
b25lIEFDTEsgaXMgZW5vdWdoLCBubyBuZWVkIHRvIHNwbGl0IGl0IHRvIHRocmVlIG1jbGsvcGNs
ay9heGljbGsuDQpkcm9wIHBjbGsvcGlwZWxpbmUtPmF4aWNsay4gYnV0IG9ubHkga2VlcCBvbmUg
bWNsayBpbiBrb21lZGEgZHJpdmVyLg0KDQpTaWduZWQtb2ZmLWJ5OiBKYW1lcyBRaWFuIFdhbmcg
KEFybSBUZWNobm9sb2d5IENoaW5hKSA8amFtZXMucWlhbi53YW5nQGFybS5jb20+DQotLS0NCiAu
Li4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYyAgfCAxMSAtLS0tLS0t
DQogLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYyAgIHwgMzMgKysr
Ky0tLS0tLS0tLS0tLS0tLQ0KIC4uLi9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
ZGV2LmggICB8ICAyIC0tDQogLi4uL2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVs
aW5lLmMgIHwgIDEgLQ0KIC4uLi9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGlu
ZS5oICB8ICAyIC0tDQogNSBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDQyIGRlbGV0
aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfY3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21l
ZGFfY3J0Yy5jDQppbmRleCBiNTE5MGExZjc1ZWIuLjM5MzNmNDM3N2NjMSAxMDA2NDQNCi0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYw0KKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jDQpAQCAtMTI3
LDkgKzEyNyw2IEBAIGtvbWVkYV9jcnRjX3ByZXBhcmUoc3RydWN0IGtvbWVkYV9jcnRjICprY3J0
YykNCiAJCQlEUk1fRVJST1IoImZhaWxlZCB0byBlbmFibGUgbWNsay5cbiIpOw0KIAl9DQoNCi0J
ZXJyID0gY2xrX3ByZXBhcmVfZW5hYmxlKG1hc3Rlci0+YWNsayk7DQotCWlmIChlcnIpDQotCQlE
Uk1fRVJST1IoImZhaWxlZCB0byBlbmFibGUgYXhpIGNsayBmb3IgcGlwZSVkLlxuIiwgbWFzdGVy
LT5pZCk7DQogCWVyciA9IGNsa19zZXRfcmF0ZShtYXN0ZXItPnB4bGNsaywgcHhsY2xrX3JhdGUp
Ow0KIAlpZiAoZXJyKQ0KIAkJRFJNX0VSUk9SKCJmYWlsZWQgdG8gc2V0IHB4bGNsayBmb3IgcGlw
ZSVkXG4iLCBtYXN0ZXItPmlkKTsNCkBAIC0xNzAsNyArMTY3LDYgQEAga29tZWRhX2NydGNfdW5w
cmVwYXJlKHN0cnVjdCBrb21lZGFfY3J0YyAqa2NydGMpDQogCW1kZXYtPmRwbW9kZSA9IG5ld19t
b2RlOw0KDQogCWNsa19kaXNhYmxlX3VucHJlcGFyZShtYXN0ZXItPnB4bGNsayk7DQotCWNsa19k
aXNhYmxlX3VucHJlcGFyZShtYXN0ZXItPmFjbGspOw0KIAlpZiAobmV3X21vZGUgPT0gS09NRURB
X01PREVfSU5BQ1RJVkUpDQogCQljbGtfZGlzYWJsZV91bnByZXBhcmUobWRldi0+bWNsayk7DQoN
CkBAIC0zNzQsMTMgKzM3MCw2IEBAIGtvbWVkYV9jcnRjX21vZGVfdmFsaWQoc3RydWN0IGRybV9j
cnRjICpjcnRjLCBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbSkNCiAJCXJldHVybiBN
T0RFX0NMT0NLX0hJR0g7DQogCX0NCg0KLQlpZiAoY2xrX3JvdW5kX3JhdGUobWFzdGVyLT5hY2xr
LCBtb2RlX2NsaykgPCBweGxjbGspIHsNCi0JCURSTV9ERUJVR19BVE9NSUMoImFjbGsgY2FuJ3Qg
c2F0aXNmeSB0aGUgcmVxdWlyZW1lbnQgb2YgJXMtY2xrOiAlbGQuXG4iLA0KLQkJCQkgbS0+bmFt
ZSwgcHhsY2xrKTsNCi0NCi0JCXJldHVybiBNT0RFX0NMT0NLX0hJR0g7DQotCX0NCi0NCiAJcmV0
dXJuIE1PREVfT0s7DQogfQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfZGV2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9kZXYuYw0KaW5kZXggNDg1ZDhiZDEyZTM5Li5mOGY2ZWRiZjZmMGQgMTAwNjQ0
DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYw0K
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmMNCkBA
IC0xMTUsMTMgKzExNSw2IEBAIHN0YXRpYyBpbnQga29tZWRhX3BhcnNlX3BpcGVfZHQoc3RydWN0
IGtvbWVkYV9kZXYgKm1kZXYsIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnApDQoNCiAJcGlwZSA9IG1k
ZXYtPnBpcGVsaW5lc1twaXBlX2lkXTsNCg0KLQljbGsgPSBvZl9jbGtfZ2V0X2J5X25hbWUobnAs
ICJhY2xrIik7DQotCWlmIChJU19FUlIoY2xrKSkgew0KLQkJRFJNX0VSUk9SKCJnZXQgYWNsayBm
b3IgcGlwZWxpbmUgJWQgZmFpbGVkIVxuIiwgcGlwZV9pZCk7DQotCQlyZXR1cm4gUFRSX0VSUihj
bGspOw0KLQl9DQotCXBpcGUtPmFjbGsgPSBjbGs7DQotDQogCWNsayA9IG9mX2Nsa19nZXRfYnlf
bmFtZShucCwgInB4Y2xrIik7DQogCWlmIChJU19FUlIoY2xrKSkgew0KIAkJRFJNX0VSUk9SKCJn
ZXQgcHhjbGsgZm9yIHBpcGVsaW5lICVkIGZhaWxlZCFcbiIsIHBpcGVfaWQpOw0KQEAgLTE0NCwx
NCArMTM3LDggQEAgc3RhdGljIGludCBrb21lZGFfcGFyc2VfZHQoc3RydWN0IGRldmljZSAqZGV2
LCBzdHJ1Y3Qga29tZWRhX2RldiAqbWRldikNCiB7DQogCXN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYgPSB0b19wbGF0Zm9ybV9kZXZpY2UoZGV2KTsNCiAJc3RydWN0IGRldmljZV9ub2RlICpj
aGlsZCwgKm5wID0gZGV2LT5vZl9ub2RlOw0KLQlzdHJ1Y3QgY2xrICpjbGs7DQogCWludCByZXQ7
DQoNCi0JY2xrID0gZGV2bV9jbGtfZ2V0KGRldiwgIm1jbGsiKTsNCi0JaWYgKElTX0VSUihjbGsp
KQ0KLQkJcmV0dXJuIFBUUl9FUlIoY2xrKTsNCi0NCi0JbWRldi0+bWNsayA9IGNsazsNCiAJbWRl
di0+aXJxICA9IHBsYXRmb3JtX2dldF9pcnEocGRldiwgMCk7DQogCWlmIChtZGV2LT5pcnEgPCAw
KSB7DQogCQlEUk1fRVJST1IoImNvdWxkIG5vdCBnZXQgSVJRIG51bWJlci5cbiIpOw0KQEAgLTIw
NSwxNiArMTkyLDE1IEBAIHN0cnVjdCBrb21lZGFfZGV2ICprb21lZGFfZGV2X2NyZWF0ZShzdHJ1
Y3QgZGV2aWNlICpkZXYpDQogCQlnb3RvIGVycl9jbGVhbnVwOw0KIAl9DQoNCi0JbWRldi0+cGNs
ayA9IGRldm1fY2xrX2dldChkZXYsICJwY2xrIik7DQotCWlmIChJU19FUlIobWRldi0+cGNsaykp
IHsNCi0JCURSTV9FUlJPUigiR2V0IEFQQiBjbGsgZmFpbGVkLlxuIik7DQotCQllcnIgPSBQVFJf
RVJSKG1kZXYtPnBjbGspOw0KLQkJbWRldi0+cGNsayA9IE5VTEw7DQorCW1kZXYtPm1jbGsgPSBk
ZXZtX2Nsa19nZXQoZGV2LCAibWNsayIpOw0KKwlpZiAoSVNfRVJSKG1kZXYtPm1jbGspKSB7DQor
CQlEUk1fRVJST1IoIkdldCBlbmdpbmUgY2xrIGZhaWxlZC5cbiIpOw0KKwkJZXJyID0gUFRSX0VS
UihtZGV2LT5tY2xrKTsNCisJCW1kZXYtPm1jbGsgPSBOVUxMOw0KIAkJZ290byBlcnJfY2xlYW51
cDsNCiAJfQ0KDQotCS8qIEVuYWJsZSBBUEIgY2xvY2sgdG8gYWNjZXNzIHRoZSByZWdpc3RlcnMg
Ki8NCi0JY2xrX3ByZXBhcmVfZW5hYmxlKG1kZXYtPnBjbGspOw0KKwljbGtfcHJlcGFyZV9lbmFi
bGUobWRldi0+bWNsayk7DQoNCiAJbWRldi0+ZnVuY3MgPSBwcm9kdWN0LT5pZGVudGlmeShtZGV2
LT5yZWdfYmFzZSwgJm1kZXYtPmNoaXApOw0KIAlpZiAoIWtvbWVkYV9wcm9kdWN0X21hdGNoKG1k
ZXYsIHByb2R1Y3QtPnByb2R1Y3RfaWQpKSB7DQpAQCAtMzE1LDE1ICszMDEsMTAgQEAgdm9pZCBr
b21lZGFfZGV2X2Rlc3Ryb3koc3RydWN0IGtvbWVkYV9kZXYgKm1kZXYpDQogCX0NCg0KIAlpZiAo
bWRldi0+bWNsaykgew0KKwkJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKG1kZXYtPm1jbGspOw0KIAkJ
ZGV2bV9jbGtfcHV0KGRldiwgbWRldi0+bWNsayk7DQogCQltZGV2LT5tY2xrID0gTlVMTDsNCiAJ
fQ0KDQotCWlmIChtZGV2LT5wY2xrKSB7DQotCQljbGtfZGlzYWJsZV91bnByZXBhcmUobWRldi0+
cGNsayk7DQotCQlkZXZtX2Nsa19wdXQoZGV2LCBtZGV2LT5wY2xrKTsNCi0JCW1kZXYtPnBjbGsg
PSBOVUxMOw0KLQl9DQotDQogCWRldm1fa2ZyZWUoZGV2LCBtZGV2KTsNCiB9DQpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmggYi9kcml2
ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuaA0KaW5kZXggNTEyNjg3
OWQ1OTdlLi41ZmVhZWQyZGM5M2YgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9kZXYuaA0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfZGV2LmgNCkBAIC0xNjAsOCArMTYwLDYgQEAgc3RydWN0IGtvbWVk
YV9kZXYgew0KIAlzdHJ1Y3Qga29tZWRhX2NoaXBfaW5mbyBjaGlwOw0KIAkvKiogQGZtdF90Ymw6
IGluaXRpYWxpemVkIGJ5ICZrb21lZGFfZGV2X2Z1bmNzLT5pbml0X2Zvcm1hdF90YWJsZSAqLw0K
IAlzdHJ1Y3Qga29tZWRhX2Zvcm1hdF9jYXBzX3RhYmxlIGZtdF90Ymw7DQotCS8qKiBAcGNsazog
QVBCIGNsb2NrIGZvciByZWdpc3RlciBhY2Nlc3MgKi8NCi0Jc3RydWN0IGNsayAqcGNsazsNCiAJ
LyoqIEBtY2xrOiBIVyBtYWluIGVuZ2luZSBjbGsgKi8NCiAJc3RydWN0IGNsayAqbWNsazsNCg0K
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3Bp
cGVsaW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBl
bGluZS5jDQppbmRleCAwYmI0NDNiMzM2ZjcuLjc4ZTQ0ZDllMTUyMCAxMDA2NDQNCi0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmMNCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmMNCkBA
IC01Myw3ICs1Myw2IEBAIHZvaWQga29tZWRhX3BpcGVsaW5lX2Rlc3Ryb3koc3RydWN0IGtvbWVk
YV9kZXYgKm1kZXYsDQogCX0NCg0KIAljbGtfcHV0KHBpcGUtPnB4bGNsayk7DQotCWNsa19wdXQo
cGlwZS0+YWNsayk7DQoNCiAJb2Zfbm9kZV9wdXQocGlwZS0+b2Zfb3V0cHV0X2Rldik7DQogCW9m
X25vZGVfcHV0KHBpcGUtPm9mX291dHB1dF9wb3J0KTsNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oIGIvZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaA0KaW5kZXggMGMzZjEwMWUw
ZGNlLi4wOTBhNWQ5MmQ1ZjEgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oDQpAQCAtMzg4LDggKzM4OCw2IEBAIHN0cnVj
dCBrb21lZGFfcGlwZWxpbmUgew0KIAlzdHJ1Y3Qga29tZWRhX2RldiAqbWRldjsNCiAJLyoqIEBw
eGxjbGs6IHBpeGVsIGNsb2NrICovDQogCXN0cnVjdCBjbGsgKnB4bGNsazsNCi0JLyoqIEBhY2xr
OiBBWEkgY2xvY2sgKi8NCi0Jc3RydWN0IGNsayAqYWNsazsNCiAJLyoqIEBpZDogcGlwZWxpbmUg
aWQgKi8NCiAJaW50IGlkOw0KIAkvKiogQGF2YWlsX2NvbXBzOiBhdmFpbGFibGUgY29tcG9uZW50
cyBtYXNrIG9mIHBpcGVsaW5lICovDQotLQ0KMi4xNy4xDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
