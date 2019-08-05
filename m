Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99880815E7
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 11:52:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7111B89D5B;
	Mon,  5 Aug 2019 09:52:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30074.outbound.protection.outlook.com [40.107.3.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E09C89D5B
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 09:52:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OsflULuYnYRUCfoJpOjqv4XiC81+vaRJms4XPiXjmDBuEgB7/0YuxKIV6a2bmkc/oyZ3+pfWnk3u/ResAeGW3vkxjNlIeCHYqgb51p93OvRKSpzZ2MJBWKT6PBfcL0pYty80Wyq+AqN6HwM90GXh1ioFYDbuWe3sQcHfNWVhRt2F7DgLT4fM9CaVuo8zV5Iot+tPlaNyUAxYLd+esnow9Z9dgp/paMH2anB2zBX/MbSqN6iAibn8sKkLWUviNuH6z9hQmS/qEGq8TQMaArKvyR0a9jhMR0QpQhVK6VLiXeIt7gskBy2mbcwVeKdNAnRKjtjEUmT2ogKPzzmHoPbJ4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X4KCZjkk2Qua9X1hPieafjRQTnhZzpgkKZuVTEwLDUE=;
 b=So3c3VxdByjjZMQdvUmf3GYr02eVXRtja7cFBeiNF8FAxRGMu1ODC+SjOtRPV+UaF9lqhMT0rSbhr/vrIzux026NKzLzdDyeGP/TQfLuQMuX5bSAVY3eSBmqTdu3618rBXQvlpaFEwKka+7l2Cq4SsjZyrErWJ8jUaRXf4LRINr7l8WqRev5j/14L3K+q7Ox0/E3eTlr548Lifg1VrrhAEhZn50Kp9MTy+IBq7tcwLog1ZIxhPUNr0YzWR5C6X4BhvFgKW7n84M4dl6XbghKifP+hzI7xwmkbd/WNBSWDwdS6/HMyq4PAFUHhSf7iu9ZcpFBqqn5Blp8pDc7jSu8IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=arm.com;dmarc=pass action=none header.from=arm.com;dkim=pass
 header.d=arm.com;arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3520.eurprd08.prod.outlook.com (20.177.61.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Mon, 5 Aug 2019 09:52:18 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::c8dd:d1c6:5044:a888]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::c8dd:d1c6:5044:a888%3]) with mapi id 15.20.2115.005; Mon, 5 Aug 2019
 09:52:18 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2] drm/komeda: Add support for 'memory-region' DT node
 property
Thread-Topic: [PATCH v2] drm/komeda: Add support for 'memory-region' DT node
 property
Thread-Index: AQHVS3N34kDp/cF7tkmzeLrHpfGDHA==
Date: Mon, 5 Aug 2019 09:52:17 +0000
Message-ID: <20190805095155.17999-1-mihail.atanassov@arm.com>
References: <20190802143951.4436-1-mihail.atanassov@arm.com>
In-Reply-To: <20190802143951.4436-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.52]
x-clientproxiedby: LO2P265CA0051.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::15) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.22.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 46cbcb7b-5fa8-4153-4278-08d7198a9a10
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB3520; 
x-ms-traffictypediagnostic: VI1PR08MB3520:
x-microsoft-antispam-prvs: <VI1PR08MB35206C8B6CE6CEE3ABFD890C8FDA0@VI1PR08MB3520.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:243;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(346002)(39860400002)(396003)(366004)(40434004)(189003)(199004)(6916009)(2906002)(5640700003)(5660300002)(44832011)(5024004)(14444005)(256004)(68736007)(66446008)(66946007)(64756008)(66476007)(66556008)(2616005)(11346002)(446003)(36756003)(4326008)(2501003)(99286004)(81166006)(81156014)(71190400001)(76176011)(2351001)(305945005)(52116002)(102836004)(86362001)(476003)(8676002)(386003)(6506007)(1076003)(486006)(7736002)(54906003)(6116002)(3846002)(316002)(71200400001)(8936002)(50226002)(53936002)(478600001)(14454004)(25786009)(186003)(26005)(6512007)(66066001)(6486002)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3520;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VEN3eukLl6Si86GSfhNhxZw3MASEtEIDDUSbBRBq08G+3LlX1tEhwClc8l4VLfqWsIaHRZrPZkAYV4P4TvMlqs3Pk9HSxc0JmqnaPNO1O90t0Rer2ddOle5GQTylgrHvnO+pD2Qf/0PueUlgRHiqCCPCwiOY8Dygu6dzADgNLdhHprX2qwCeNo85vul9etL317339zPbPaLvEe94tosK9sltDykLf684Y2ok7fjUtd0mYqqo858bxXxxNRExbQRcLw6I6SFp4vm7epBmYDU3jyRlLShk/PLR4Kkzd/D5Yxie8l5kya2+8P54I8ltHpvKp31ltzqkg9Yy15kbOldNaAnmi6SQ2iUgbLo6P1EGAOEQTpNDrCpY5Kxn42VUP0g9NEXhqcqklijR/hckoHY6bW8MvupDCfBcpEvHRYx/Ey0=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46cbcb7b-5fa8-4153-4278-08d7198a9a10
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 09:52:17.9311 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mihail.Atanassov@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3520
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X4KCZjkk2Qua9X1hPieafjRQTnhZzpgkKZuVTEwLDUE=;
 b=KA4FDxA2NmQg6x09Kcxnc3+BXZw9NxN4d4pP1nql9d/2hbQLWBu8wBv0ov2J4GjggLr3FC7eEkh5qTtjYjNm7XSSe7vbbDhDW6Rh6qZDeYsSM37yBPc0UnAaCSFSabvOMocSCOlLbyD5V0xqx1hZGhcK6Pq/0CzCFxpsCN0mPSQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
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
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlICdtZW1vcnktcmVnaW9uJyBwcm9wZXJ0eSBvZiB0aGUga29tZWRhIGRpc3BsYXkgZHJpdmVy
IERUIGJpbmRpbmcKYWxsb3dzIHRoZSB1c2Ugb2YgYSAncmVzZXJ2ZWQtbWVtb3J5JyBub2RlIGZv
ciBidWZmZXIgYWxsb2NhdGlvbnMuIEFkZAp0aGUgcmVxdWlzaXRlIG9mX3Jlc2VydmVkX21lbV9k
ZXZpY2Vfe2luaXQscmVsZWFzZX0gY2FsbHMgdG8gYWN0dWFsbHkKbWFrZSB1c2Ugb2YgdGhlIG1l
bW9yeSBpZiBwcmVzZW50LgoKQ2hhbmdlcyBzaW5jZSB2MToKIC0gTW92ZSBoYW5kbGluZyBpbnNp
ZGUga29tZWRhX3BhcnNlX2R0CgpTaWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxtaWhh
aWwuYXRhbmFzc292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tv
bWVkYS9rb21lZGFfZGV2LmMgfCA5ICsrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX2Rldi5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
ZGV2LmMKaW5kZXggMWZmN2Y0YjJjNjIwLi4wMTQyZWU5OTE5NTcgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5jCkBAIC04LDYgKzgsNyBAQAog
I2luY2x1ZGUgPGxpbnV4L2lvbW11Lmg+CiAjaW5jbHVkZSA8bGludXgvb2ZfZGV2aWNlLmg+CiAj
aW5jbHVkZSA8bGludXgvb2ZfZ3JhcGguaD4KKyNpbmNsdWRlIDxsaW51eC9vZl9yZXNlcnZlZF9t
ZW0uaD4KICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KICNpbmNsdWRlIDxsaW51
eC9kbWEtbWFwcGluZy5oPgogI2lmZGVmIENPTkZJR19ERUJVR19GUwpAQCAtMTQ2LDYgKzE0Nywx
MiBAQCBzdGF0aWMgaW50IGtvbWVkYV9wYXJzZV9kdChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVj
dCBrb21lZGFfZGV2ICptZGV2KQogcmV0dXJuIG1kZXYtPmlycTsKIH0KCisvKiBHZXQgdGhlIG9w
dGlvbmFsIGZyYW1lYnVmZmVyIG1lbW9yeSByZXNvdXJjZSAqLworcmV0ID0gb2ZfcmVzZXJ2ZWRf
bWVtX2RldmljZV9pbml0KGRldik7CitpZiAocmV0ICYmIHJldCAhPSAtRU5PREVWKQorcmV0dXJu
IHJldDsKK3JldCA9IDA7CisKIGZvcl9lYWNoX2F2YWlsYWJsZV9jaGlsZF9vZl9ub2RlKG5wLCBj
aGlsZCkgewogaWYgKG9mX25vZGVfY21wKGNoaWxkLT5uYW1lLCAicGlwZWxpbmUiKSA9PSAwKSB7
CiByZXQgPSBrb21lZGFfcGFyc2VfcGlwZV9kdChtZGV2LCBjaGlsZCk7CkBAIC0yOTIsNiArMjk5
LDggQEAgdm9pZCBrb21lZGFfZGV2X2Rlc3Ryb3koc3RydWN0IGtvbWVkYV9kZXYgKm1kZXYpCgog
bWRldi0+bl9waXBlbGluZXMgPSAwOwoKK29mX3Jlc2VydmVkX21lbV9kZXZpY2VfcmVsZWFzZShk
ZXYpOworCiBpZiAoZnVuY3MgJiYgZnVuY3MtPmNsZWFudXApCiBmdW5jcy0+Y2xlYW51cChtZGV2
KTsKCi0tCjIuMjIuMAoKSU1QT1JUQU5UIE5PVElDRTogVGhlIGNvbnRlbnRzIG9mIHRoaXMgZW1h
aWwgYW5kIGFueSBhdHRhY2htZW50cyBhcmUgY29uZmlkZW50aWFsIGFuZCBtYXkgYWxzbyBiZSBw
cml2aWxlZ2VkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBwbGVhc2Ug
bm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRpYXRlbHkgYW5kIGRvIG5vdCBkaXNjbG9zZSB0aGUgY29u
dGVudHMgdG8gYW55IG90aGVyIHBlcnNvbiwgdXNlIGl0IGZvciBhbnkgcHVycG9zZSwgb3Igc3Rv
cmUgb3IgY29weSB0aGUgaW5mb3JtYXRpb24gaW4gYW55IG1lZGl1bS4gVGhhbmsgeW91LgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
