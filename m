Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A1061A53
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 07:37:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 118BF899A3;
	Mon,  8 Jul 2019 05:37:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80048.outbound.protection.outlook.com [40.107.8.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80EA2899A3
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 05:37:53 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5181.eurprd08.prod.outlook.com (20.179.31.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Mon, 8 Jul 2019 05:37:50 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::4062:a380:35ba:11d1]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::4062:a380:35ba:11d1%3]) with mapi id 15.20.2032.019; Mon, 8 Jul 2019
 05:37:50 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>
Subject: [PATCH 1/2] drm/komeda: Computing layer_split internally
Thread-Topic: [PATCH 1/2] drm/komeda: Computing layer_split internally
Thread-Index: AQHVNU9H6u/+WBtsXEalJYGmE2ppQg==
Date: Mon, 8 Jul 2019 05:37:50 +0000
Message-ID: <20190708053729.3502-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0054.apcprd03.prod.outlook.com
 (2603:1096:203:52::18) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3396cd9f-f9e9-450a-56a9-08d703666a2e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB5181; 
x-ms-traffictypediagnostic: VE1PR08MB5181:
x-microsoft-antispam-prvs: <VE1PR08MB51810DB52DFD5CF6AA60A4A9B3F60@VE1PR08MB5181.eurprd08.prod.outlook.com>
nodisclaimer: True
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 00922518D8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39850400004)(136003)(366004)(376002)(396003)(189003)(199004)(2906002)(99286004)(478600001)(8936002)(53936002)(6116002)(52116002)(3846002)(5660300002)(26005)(64756008)(86362001)(14454004)(71190400001)(66066001)(2201001)(66556008)(71200400001)(66446008)(73956011)(305945005)(66476007)(6486002)(1076003)(66946007)(25786009)(103116003)(14444005)(256004)(2616005)(6512007)(186003)(6436002)(316002)(102836004)(110136005)(6506007)(2501003)(476003)(386003)(54906003)(55236004)(36756003)(7736002)(81166006)(8676002)(486006)(50226002)(68736007)(4326008)(81156014)(309714004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5181;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xxlGQUQiQ/q4andzhrDJyhVBeDglWi7waFg5Gy7Hve35nOXYFgRj0PysRRr2DBuJ5Og3ucOlz5mZeBx3YPbhEbrmhgVTIqEZA+XPuVd8/Wbj5gYp+8hIhR+qgYqHafGWZWo7vlYDq+WxaGoFs0WsNaTTaZuC2QLyUyhiu1fbbeXmnACv/GAzDOpk1JW5aKJSoeNMr6kZYEGuBEv2Mo6Q5KrJNQnijYa5xLOzblWPPIqAujGdNWweiBst5nUWyyeUv+wW2FhvO+na0r68uYRXf+WBlnHhukzCCN5DPSeOP8/aR+dVJXL6dopHZVvrcwRMhqfb8xByTGm1GQb/Wk2Y49d2Fn8bg4Xzz7M6xHPZtmK9lMMXA9wK0WUvVOaghtLpyM4w3LNKpi3d5YxJweWAcX8N/WwgOgs6zNzMURpeDoM=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3396cd9f-f9e9-450a-56a9-08d703666a2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2019 05:37:50.3421 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: james.qian.wang@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5181
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xWtzVWm29lMeW7bLs8cDSUBSBDCuOadjFP/cGn0Kj1w=;
 b=0ivlzNsR6Xf9vl4KqrtO1Zd5tXNwB9FFL5F7+vP/27qBp4hJSG90iYkZMVZXztrd7hFQdVTN301wvSJ0N6ATisCbgpdXAaNSgoUG5TpQDxy5z68ruSE43woHsxABxqoevpqFG3of4umGqwB8swNaX8vMAkNQQB1bhouKcs4g3Go=
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

Rm9yIGxheWVyX3NwbGl0IG5vIG5lZWQgdXNlciB0byBlbmFibGUvZGlzYWJsZSBpdCwgYnV0IGNv
bXB1dGUgaXQgaW4Ka29tZWRhIGludGVybmFsbHksIGtvbWVkYSB3aWxsIGVuYWJsZSBpdCBpZiB0
aGUgc2NhbGluZyBleGNlZWQgdGhlCmFjY2VwdGFibGUgcmFuZ2Ugb2Ygc2NhbGVyLgoKU2lnbmVk
LW9mZi1ieTogamFtZXMgcWlhbiB3YW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGphbWVzLnFp
YW4ud2FuZ0Bhcm0uY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX3BpcGVsaW5lLmggIHwgIDMgKystCiAuLi4vZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9r
b21lZGFfcGlwZWxpbmVfc3RhdGUuYyAgICB8IDExICsrKysrKysrKystCiBkcml2ZXJzL2dwdS9k
cm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9wbGFuZS5jICAgICB8ICAzICstLQogLi4uL2dw
dS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV93Yl9jb25uZWN0b3IuYyAgfCAxMCArLS0t
LS0tLS0tCiA0IGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X3BpcGVsaW5lLmggYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9w
aXBlbGluZS5oCmluZGV4IGZjMWI4NjEzMzg1ZS4uYTkwYmNiYjNjYjIzIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmgKQEAg
LTUzNyw3ICs1MzcsOCBAQCB2b2lkIGtvbWVkYV9waXBlbGluZV9kaXNhYmxlKHN0cnVjdCBrb21l
ZGFfcGlwZWxpbmUgKnBpcGUsCiB2b2lkIGtvbWVkYV9waXBlbGluZV91cGRhdGUoc3RydWN0IGtv
bWVkYV9waXBlbGluZSAqcGlwZSwKIAkJCSAgICBzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqb2xk
X3N0YXRlKTsKIAotdm9pZCBrb21lZGFfY29tcGxldGVfZGF0YV9mbG93X2NmZyhzdHJ1Y3Qga29t
ZWRhX2RhdGFfZmxvd19jZmcgKmRmbG93LAordm9pZCBrb21lZGFfY29tcGxldGVfZGF0YV9mbG93
X2NmZyhzdHJ1Y3Qga29tZWRhX2xheWVyICpsYXllciwKKwkJCQkgICBzdHJ1Y3Qga29tZWRhX2Rh
dGFfZmxvd19jZmcgKmRmbG93LAogCQkJCSAgIHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiKTsK
IAogI2VuZGlmIC8qIF9LT01FREFfUElQRUxJTkVfSF8qLwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVfc3RhdGUuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lX3N0YXRlLmMKaW5k
ZXggMmI0MTVlZjJiN2QzLi45NzJhMGYyNTI1NGQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lX3N0YXRlLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVfc3RhdGUuYwpAQCAt
Nzg0LDkgKzc4NCwxMSBAQCBrb21lZGFfdGltaW5nX2N0cmxyX3ZhbGlkYXRlKHN0cnVjdCBrb21l
ZGFfdGltaW5nX2N0cmxyICpjdHJsciwKIAlyZXR1cm4gMDsKIH0KIAotdm9pZCBrb21lZGFfY29t
cGxldGVfZGF0YV9mbG93X2NmZyhzdHJ1Y3Qga29tZWRhX2RhdGFfZmxvd19jZmcgKmRmbG93LAor
dm9pZCBrb21lZGFfY29tcGxldGVfZGF0YV9mbG93X2NmZyhzdHJ1Y3Qga29tZWRhX2xheWVyICps
YXllciwKKwkJCQkgICBzdHJ1Y3Qga29tZWRhX2RhdGFfZmxvd19jZmcgKmRmbG93LAogCQkJCSAg
IHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiKQogeworCXN0cnVjdCBrb21lZGFfc2NhbGVyICpz
Y2FsZXIgPSBsYXllci0+YmFzZS5waXBlbGluZS0+c2NhbGVyc1swXTsKIAl1MzIgdyA9IGRmbG93
LT5pbl93OwogCXUzMiBoID0gZGZsb3ctPmluX2g7CiAKQEAgLTgwMyw2ICs4MDUsMTMgQEAgdm9p
ZCBrb21lZGFfY29tcGxldGVfZGF0YV9mbG93X2NmZyhzdHJ1Y3Qga29tZWRhX2RhdGFfZmxvd19j
ZmcgKmRmbG93LAogCiAJZGZsb3ctPmVuX3NjYWxpbmcgPSAodyAhPSBkZmxvdy0+b3V0X3cpIHx8
IChoICE9IGRmbG93LT5vdXRfaCk7CiAJZGZsb3ctPmlzX3l1diA9IGZiLT5mb3JtYXQtPmlzX3l1
djsKKworCS8qIHRyeSB0byBlbmFibGUgc3BsaXQgaWYgc2NhbGluZyBleGNlZWQgdGhlIHNjYWxl
cidzIGFjY2VwdGFibGUKKwkgKiBpbnB1dC9vdXRwdXQgcmFuZ2UuCisJICovCisJaWYgKGRmbG93
LT5lbl9zY2FsaW5nICYmIHNjYWxlcikKKwkJZGZsb3ctPmVuX3NwbGl0ID0gIWluX3JhbmdlKCZz
Y2FsZXItPmhzaXplLCBkZmxvdy0+aW5fdykgfHwKKwkJCQkgICFpbl9yYW5nZSgmc2NhbGVyLT5o
c2l6ZSwgZGZsb3ctPm91dF93KTsKIH0KIAogc3RhdGljIGJvb2wgbWVyZ2VyX2lzX2F2YWlsYWJs
ZShzdHJ1Y3Qga29tZWRhX3BpcGVsaW5lICpwaXBlLApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGxhbmUuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BsYW5lLmMKaW5kZXggNWJiODU1M2NjMTE3Li5iMTM4
NjQzODM1N2IgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX3BsYW5lLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9r
b21lZGFfcGxhbmUuYwpAQCAtNTgsOSArNTgsOCBAQCBrb21lZGFfcGxhbmVfaW5pdF9kYXRhX2Zs
b3coc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqc3QsCiAJfQogCiAJZGZsb3ctPmVuX2ltZ19lbmhh
bmNlbWVudCA9ICEha3BsYW5lX3N0LT5pbWdfZW5oYW5jZW1lbnQ7Ci0JZGZsb3ctPmVuX3NwbGl0
ID0gISFrcGxhbmVfc3QtPmxheWVyX3NwbGl0OwogCi0Ja29tZWRhX2NvbXBsZXRlX2RhdGFfZmxv
d19jZmcoZGZsb3csIGZiKTsKKwlrb21lZGFfY29tcGxldGVfZGF0YV9mbG93X2NmZyhrcGxhbmUt
PmxheWVyLCBkZmxvdywgZmIpOwogCiAJcmV0dXJuIDA7CiB9CmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV93Yl9jb25uZWN0b3IuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3diX2Nvbm5lY3Rvci5jCmluZGV4
IGJiOGE2MWY2ZTlhNC4uNjE3ZTFmN2I4NDcyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV93Yl9jb25uZWN0b3IuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV93Yl9jb25uZWN0b3IuYwpAQCAtMTMsNyAr
MTMsNiBAQCBrb21lZGFfd2JfaW5pdF9kYXRhX2Zsb3coc3RydWN0IGtvbWVkYV9sYXllciAqd2Jf
bGF5ZXIsCiAJCQkgc3RydWN0IGtvbWVkYV9jcnRjX3N0YXRlICprY3J0Y19zdCwKIAkJCSBzdHJ1
Y3Qga29tZWRhX2RhdGFfZmxvd19jZmcgKmRmbG93KQogewotCXN0cnVjdCBrb21lZGFfc2NhbGVy
ICpzY2FsZXIgPSB3Yl9sYXllci0+YmFzZS5waXBlbGluZS0+c2NhbGVyc1swXTsKIAlzdHJ1Y3Qg
ZHJtX2ZyYW1lYnVmZmVyICpmYiA9IGNvbm5fc3QtPndyaXRlYmFja19qb2ItPmZiOwogCiAJbWVt
c2V0KGRmbG93LCAwLCBzaXplb2YoKmRmbG93KSk7CkBAIC0yOCwxNCArMjcsNyBAQCBrb21lZGFf
d2JfaW5pdF9kYXRhX2Zsb3coc3RydWN0IGtvbWVkYV9sYXllciAqd2JfbGF5ZXIsCiAJZGZsb3ct
PnBpeGVsX2JsZW5kX21vZGUgPSBEUk1fTU9ERV9CTEVORF9QSVhFTF9OT05FOwogCWRmbG93LT5y
b3QgPSBEUk1fTU9ERV9ST1RBVEVfMDsKIAotCWtvbWVkYV9jb21wbGV0ZV9kYXRhX2Zsb3dfY2Zn
KGRmbG93LCBmYik7Ci0KLQkvKiBpZiBzY2FsaW5nIGV4Y2VlZCB0aGUgYWNjZXB0YWJsZSBzY2Fs
ZXIgaW5wdXQvb3V0cHV0IHJhbmdlLCB0cnkgdG8KLQkgKiBlbmFibGUgc3BsaXQuCi0JICovCi0J
aWYgKGRmbG93LT5lbl9zY2FsaW5nICYmIHNjYWxlcikKLQkJZGZsb3ctPmVuX3NwbGl0ID0gIWlu
X3JhbmdlKCZzY2FsZXItPmhzaXplLCBkZmxvdy0+aW5fdykgfHwKLQkJCQkgICFpbl9yYW5nZSgm
c2NhbGVyLT5oc2l6ZSwgZGZsb3ctPm91dF93KTsKKwlrb21lZGFfY29tcGxldGVfZGF0YV9mbG93
X2NmZyh3Yl9sYXllciwgZGZsb3csIGZiKTsKIAogCXJldHVybiAwOwogfQotLSAKMi4yMC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
