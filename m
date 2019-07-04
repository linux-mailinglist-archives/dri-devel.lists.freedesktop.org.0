Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E6B5F2DE
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 08:31:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B52C6E267;
	Thu,  4 Jul 2019 06:31:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1f::61d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C3A16E267
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 06:31:15 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4799.eurprd08.prod.outlook.com (10.255.112.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Thu, 4 Jul 2019 06:31:12 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::4062:a380:35ba:11d1]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::4062:a380:35ba:11d1%3]) with mapi id 15.20.2032.019; Thu, 4 Jul 2019
 06:31:12 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>
Subject: [PATCH 4/6] drm/komeda: Add side by side support for writeback
Thread-Topic: [PATCH 4/6] drm/komeda: Add side by side support for writeback
Thread-Index: AQHVMjISfm5NC72300KwQchECXz2IQ==
Date: Thu, 4 Jul 2019 06:31:12 +0000
Message-ID: <20190704063011.7431-5-james.qian.wang@arm.com>
References: <20190704063011.7431-1-james.qian.wang@arm.com>
In-Reply-To: <20190704063011.7431-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0022.apcprd03.prod.outlook.com
 (2603:1096:203:2e::34) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: adcb0a9f-c3ab-4507-459b-08d70049353d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4799; 
x-ms-traffictypediagnostic: VE1PR08MB4799:
x-microsoft-antispam-prvs: <VE1PR08MB4799EBA1DC8248BDC4EBF7C0B3FA0@VE1PR08MB4799.eurprd08.prod.outlook.com>
nodisclaimer: True
x-ms-oob-tlc-oobclassifiers: OLM:785;
x-forefront-prvs: 0088C92887
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(366004)(376002)(346002)(396003)(199004)(189003)(14444005)(256004)(305945005)(8936002)(4326008)(99286004)(36756003)(110136005)(2616005)(486006)(2501003)(5660300002)(2906002)(316002)(3846002)(50226002)(1076003)(102836004)(26005)(55236004)(6116002)(66066001)(446003)(11346002)(52116002)(476003)(7736002)(66946007)(76176011)(66446008)(54906003)(66476007)(73956011)(386003)(64756008)(68736007)(66556008)(6506007)(6486002)(103116003)(186003)(53936002)(478600001)(25786009)(86362001)(6436002)(2201001)(6512007)(14454004)(81156014)(81166006)(8676002)(71200400001)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4799;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hdjKWvaLDRBCSjexCc5iPHlGDROr0Iuf/NvM2fJiZ320j/r6Eop5a5Tw0r+4cY/hoUhEg5w8Q2Tx/uFt+paCxnhpCQhsgXSoYjLVMqgEgVzxPLIwuChYiNOwWe/9zzGw1cM95jWOWSoqy5fDT4beVkEdOWZs13ym9QgznFAszl/7SLF6ssrGU/lrzpoBZNNbejIt9NRwiyM/Yte8SOUU0fux9Non9w34gKemFA7iQl051osWn13BwtpaDrmeWygTPLbw/3N/lSzF1xPcANf0JoCE/Wr+3TSkSThHYYmFTCLQZu2LpOSEjtINWr9CNT+6EaFS3TtWdhhV5kI50wH1Pd2etK3EaFHG8pKPJXNLwIsn6zcl0UQw7IKOin2b1Bi3SSV3DPOPdgidsuDtswVf8WeeKefD+mTCxck/I5kD+Kc=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adcb0a9f-c3ab-4507-459b-08d70049353d
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2019 06:31:12.5213 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: james.qian.wang@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4799
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ywYIGffmJVJTuipwozQ7D/vOtWbzSjF3LL/JViTvy1o=;
 b=CTyWgzdcJAKFE8hjeTeHyI2i12ZO8GAQOOa9V/Y2UisXXulL2xZ0IeDZW586Ri9SoSvEbGP3Lcf9I/wmVabKciYjQrykdpaZ3eDo6jpkGE82dDtstlFd+LFj8KcGyF3S9bQKITMzxGrenyWu1/nB9yKUaRgjYt66RmJ6bL88EzE=
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

SW4gc2lkZSBieSBzaWRlIG1vZGUsIHRoZSBtYXN0ZXIgcGlwZWxpbmUgd3JpdGViYWNrIHRoZSBs
ZWZ0IGZyYW1lIGFuZCB0aGUKc2xhdmUgd3JpdGViYWNrIHRoZSByaWdodCBwYXJ0LCB0aGUgZGF0
YSBmbG93IGFzIGJlbG93OgoKICBzbGF2ZS5jb21waXogLT4gc2xhdmUud2JfbGF5ZXIgLT4gZmIg
KHJpZ2h0LXBhcnQpCiAgbWFzdGVyLmNvbXBpeiAtPiBtYXN0ZXIud2JfbGF5ZXIgLT4gZmIgKGxl
ZnQtcGFydCkKClNpZ25lZC1vZmYtYnk6IEphbWVzIFFpYW4gV2FuZyAoQXJtIFRlY2hub2xvZ3kg
Q2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4KLS0tCiAuLi4vZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaCAgfCAgNCArKwogLi4uL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9waXBlbGluZV9zdGF0ZS5jICAgIHwgNDIgKysrKysrKysrKysrKysrKysrKwogLi4uL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfd2JfY29ubmVjdG9yLmMgIHwgIDYgKystCiAzIGZpbGVz
IGNoYW5nZWQsIDUxIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oIGIvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaAppbmRleCAz
MzU4YmNlYThmN2QuLjkxNDVhZjMzNTVmNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oCkBAIC01NTQsNiArNTU0LDEwIEBA
IGludCBrb21lZGFfYnVpbGRfd2Jfc3BsaXRfZGF0YV9mbG93KHN0cnVjdCBrb21lZGFfbGF5ZXIg
KndiX2xheWVyLAogCQkJCSAgICBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9zdGF0ZSAqY29ubl9zdCwK
IAkJCQkgICAgc3RydWN0IGtvbWVkYV9jcnRjX3N0YXRlICprY3J0Y19zdCwKIAkJCQkgICAgc3Ry
dWN0IGtvbWVkYV9kYXRhX2Zsb3dfY2ZnICpkZmxvdyk7CitpbnQga29tZWRhX2J1aWxkX3diX3Ni
c19kYXRhX2Zsb3coc3RydWN0IGtvbWVkYV9jcnRjICprY3J0YywKKwkJCQkgIHN0cnVjdCBkcm1f
Y29ubmVjdG9yX3N0YXRlICpjb25uX3N0LAorCQkJCSAgc3RydWN0IGtvbWVkYV9jcnRjX3N0YXRl
ICprY3J0Y19zdCwKKwkJCQkgIHN0cnVjdCBrb21lZGFfZGF0YV9mbG93X2NmZyAqd2JfZGZsb3cp
OwoKIGludCBrb21lZGFfYnVpbGRfZGlzcGxheV9kYXRhX2Zsb3coc3RydWN0IGtvbWVkYV9jcnRj
ICprY3J0YywKIAkJCQkgICBzdHJ1Y3Qga29tZWRhX2NydGNfc3RhdGUgKmtjcnRjX3N0KTsKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVs
aW5lX3N0YXRlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9w
aXBlbGluZV9zdGF0ZS5jCmluZGV4IDRlNWM4OTFmYmJkNC4uOWZjZDNkN2NhYmU1IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9z
dGF0ZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3Bp
cGVsaW5lX3N0YXRlLmMKQEAgLTEzNDksNiArMTM0OSw0OCBAQCBpbnQga29tZWRhX2J1aWxkX3di
X3NwbGl0X2RhdGFfZmxvdyhzdHJ1Y3Qga29tZWRhX2xheWVyICp3Yl9sYXllciwKIAlyZXR1cm4g
a29tZWRhX3diX2xheWVyX3ZhbGlkYXRlKHdiX2xheWVyLCBjb25uX3N0LCBkZmxvdyk7CiB9Cgor
Lyogd3JpdGViYWNrIHNpZGUgYnkgc2lkZSBzcGxpdCBkYXRhIHBhdGg6CisgKgorICogc2xhdmUu
Y29tcGl6IC0+IHNsYXZlLndiX2xheWVyIC0gPiBmYiAocmlnaHQtcGFydCkKKyAqIG1hc3Rlci5j
b21waXogLT4gbWFzdGVyLndiX2xheWVyIC0+IGZiIChsZWZ0LXBhcnQpCisgKi8KK2ludCBrb21l
ZGFfYnVpbGRfd2Jfc2JzX2RhdGFfZmxvdyhzdHJ1Y3Qga29tZWRhX2NydGMgKmtjcnRjLAorCQkJ
CSAgc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgKmNvbm5fc3QsCisJCQkJICBzdHJ1Y3Qga29t
ZWRhX2NydGNfc3RhdGUgKmtjcnRjX3N0LAorCQkJCSAgc3RydWN0IGtvbWVkYV9kYXRhX2Zsb3df
Y2ZnICp3Yl9kZmxvdykKK3sKKwlzdHJ1Y3Qga29tZWRhX3BpcGVsaW5lICptYXN0ZXIgPSBrY3J0
Yy0+bWFzdGVyOworCXN0cnVjdCBrb21lZGFfcGlwZWxpbmUgKnNsYXZlID0ga2NydGMtPnNsYXZl
OworCXN0cnVjdCBrb21lZGFfZGF0YV9mbG93X2NmZyBtX2RmbG93LCBzX2RmbG93OworCWludCBl
cnI7CisKKwlpZiAod2JfZGZsb3ctPmVuX3NjYWxpbmcgfHwgd2JfZGZsb3ctPmVuX2ltZ19lbmhh
bmNlbWVudCkgeworCQlEUk1fREVCVUdfQVRPTUlDKCJzYnMgZG9lc24ndCBzdXBwb3J0IFdCX3Nj
YWxpbmdcbiIpOworCQlyZXR1cm4gLUVJTlZBTDsKKwl9CisKKwltZW1jcHkoJm1fZGZsb3csIHdi
X2RmbG93LCBzaXplb2YoKndiX2RmbG93KSk7CisJbWVtY3B5KCZzX2RmbG93LCB3Yl9kZmxvdywg
c2l6ZW9mKCp3Yl9kZmxvdykpOworCisJLyogbWFzdGVyIHdyaXRlb3V0IHRoZSBsZWZ0IHBhcnQg
Ki8KKwltX2RmbG93LmluX3cgPj49IDE7CisJbV9kZmxvdy5vdXRfdyA+Pj0gMTsKKwltX2RmbG93
LmlucHV0LmNvbXBvbmVudCA9ICZtYXN0ZXItPmNvbXBpei0+YmFzZTsKKworCS8qIHNsYXZlIHdy
aXRlb3V0IHRoZSByaWdodCBwYXJ0ICovCisJc19kZmxvdy5pbl93ID4+PSAxOworCXNfZGZsb3cu
b3V0X3cgPj49IDE7CisJc19kZmxvdy5pbl94ICs9IG1fZGZsb3cuaW5fdzsKKwlzX2RmbG93Lm91
dF94ICs9IG1fZGZsb3cub3V0X3c7CisJc19kZmxvdy5pbnB1dC5jb21wb25lbnQgPSAmc2xhdmUt
PmNvbXBpei0+YmFzZTsKKworCWVyciA9IGtvbWVkYV93Yl9sYXllcl92YWxpZGF0ZShtYXN0ZXIt
PndiX2xheWVyLCBjb25uX3N0LCAmbV9kZmxvdyk7CisJaWYgKGVycikKKwkJcmV0dXJuIGVycjsK
KworCXJldHVybiBrb21lZGFfd2JfbGF5ZXJfdmFsaWRhdGUoc2xhdmUtPndiX2xheWVyLCBjb25u
X3N0LCAmc19kZmxvdyk7Cit9CisKIC8qIGJ1aWxkIGRpc3BsYXkgb3V0cHV0IGRhdGEgZmxvdywg
dGhlIGRhdGEgcGF0aCBpczoKICAqIGNvbXBpeiAtPiBpbXByb2MgLT4gdGltaW5nX2N0cmxyCiAg
Ki8KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X3diX2Nvbm5lY3Rvci5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21l
ZGFfd2JfY29ubmVjdG9yLmMKaW5kZXggYzFiMGFkMjI0MjJlLi5lYTU4NGIxZTViZDIgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3diX2Nvbm5l
Y3Rvci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3di
X2Nvbm5lY3Rvci5jCkBAIC00NSw2ICs0NSw3IEBAIGtvbWVkYV93Yl9lbmNvZGVyX2F0b21pY19j
aGVjayhzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsCiAJCQkgICAgICAgc3RydWN0IGRybV9j
cnRjX3N0YXRlICpjcnRjX3N0LAogCQkJICAgICAgIHN0cnVjdCBkcm1fY29ubmVjdG9yX3N0YXRl
ICpjb25uX3N0KQogeworCXN0cnVjdCBrb21lZGFfY3J0YyAqa2NydGMgPSB0b19rY3J0YyhjcnRj
X3N0LT5jcnRjKTsKIAlzdHJ1Y3Qga29tZWRhX2NydGNfc3RhdGUgKmtjcnRjX3N0ID0gdG9fa2Ny
dGNfc3QoY3J0Y19zdCk7CiAJc3RydWN0IGRybV93cml0ZWJhY2tfam9iICp3cml0ZWJhY2tfam9i
ID0gY29ubl9zdC0+d3JpdGViYWNrX2pvYjsKIAlzdHJ1Y3Qga29tZWRhX2xheWVyICp3Yl9sYXll
cjsKQEAgLTczLDcgKzc0LDEwIEBAIGtvbWVkYV93Yl9lbmNvZGVyX2F0b21pY19jaGVjayhzdHJ1
Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsCiAJaWYgKGVycikKIAkJcmV0dXJuIGVycjsKCi0JaWYg
KGRmbG93LmVuX3NwbGl0KQorCWlmIChrY3J0Yy0+c2lkZV9ieV9zaWRlKQorCQllcnIgPSBrb21l
ZGFfYnVpbGRfd2Jfc2JzX2RhdGFfZmxvdyhrY3J0YywKKwkJCQljb25uX3N0LCBrY3J0Y19zdCwg
JmRmbG93KTsKKwllbHNlIGlmIChkZmxvdy5lbl9zcGxpdCkKIAkJZXJyID0ga29tZWRhX2J1aWxk
X3diX3NwbGl0X2RhdGFfZmxvdyh3Yl9sYXllciwKIAkJCQljb25uX3N0LCBrY3J0Y19zdCwgJmRm
bG93KTsKIAllbHNlCi0tCjIuMjAuMQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
