Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A8BAFBD4
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 13:50:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 434DC6EAA0;
	Wed, 11 Sep 2019 11:50:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780040.outbound.protection.outlook.com [40.107.78.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A6606EAA1;
 Wed, 11 Sep 2019 11:50:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DRM+mDum8oxH/pChk+Gmv9bi1KtvE47ZvWn0Cgrmb1K3kV/uuM11XOlxLXIuHEDqYtL5q0pw337OWLJdxLsT2J/GBiyGPP0EngseiCcrhTGwpLdxfcuY3TmptV5ExMvbgi3oRkKBj5TX7ullA/m9YCmroqTG18zCu/FUGVpsdYINtxCXcId1oyN9mK6082T+/nk3fqaBJZixvHl0wsI8zx/WTOxEB6QG3SODctt2lg2EwnflAWzdT4P5MhZs8ksyJPFGNCDTDOEJuD+uydTdunZLf9VD0QPcGVJvxBc43I/dRhBEQ6Zse/RCs/Ti4pwEwapuMLrx9whj+BykN6WVXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JbU18eF14n6BZ6o0gwD10WfQIJuWWHfiwNQQOfQNUnc=;
 b=K+cVLRJTECj2HEJJu5TMPekpBLR6y4l7IOJHAJAbdbTxIUBX+lPlfvXhH9z6/f/fJPRUAO5omQvlicxvQF2q6fWCP/amBaOXm9/WWCUV/pNu+M0ITHflvqNAq4tumj2QDRWBws+/5bSsH7K0Mkjj5bakxH5JtEsbLXpzniC1ZGUxzaTzO3sw2tgyq1+l6uOG5acFPxH5/p6LIhyQIPfp/UYK3SAAzzTUixrOHO4SIHGUlpv99T61qu6Vkt+jWRLXXRJ1e4h+c7NGKqugqBiU+UpGGmR2Tc8g3zRJ7p4rcI6Z3VOXf4OZ+4MM7csOWF4dM7gYM7DE+ozZgisowh02Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB3421.namprd12.prod.outlook.com (20.178.243.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Wed, 11 Sep 2019 11:50:15 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d%4]) with mapi id 15.20.2241.022; Wed, 11 Sep 2019
 11:50:15 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: [PATCH 04/14] drm/amdgpu: add tmz feature parameter (v2)
Thread-Topic: [PATCH 04/14] drm/amdgpu: add tmz feature parameter (v2)
Thread-Index: AQHVaJcTCa38JOQlqUyUnCvyRYnw5Q==
Date: Wed, 11 Sep 2019 11:50:15 +0000
Message-ID: <1568202584-14471-5-git-send-email-ray.huang@amd.com>
References: <1568202584-14471-1-git-send-email-ray.huang@amd.com>
In-Reply-To: <1568202584-14471-1-git-send-email-ray.huang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-clientproxiedby: HK2PR04CA0046.apcprd04.prod.outlook.com
 (2603:1096:202:14::14) To MN2PR12MB3309.namprd12.prod.outlook.com
 (2603:10b6:208:106::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 15331bb2-3b5c-4cbf-7dbd-08d736ae35ef
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3421; 
x-ms-traffictypediagnostic: MN2PR12MB3421:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB34211E4239BEF0DC5EE4B67CECB10@MN2PR12MB3421.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(136003)(376002)(366004)(199004)(189003)(6436002)(4326008)(25786009)(450100002)(6486002)(486006)(11346002)(446003)(2616005)(305945005)(7736002)(50226002)(8936002)(316002)(110136005)(54906003)(8676002)(6116002)(3846002)(2906002)(81166006)(81156014)(36756003)(14454004)(71190400001)(71200400001)(86362001)(66446008)(478600001)(66476007)(64756008)(66556008)(66946007)(256004)(99286004)(53936002)(5660300002)(76176011)(52116002)(6512007)(6636002)(386003)(6506007)(66066001)(102836004)(26005)(186003)(476003)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3421;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kP9JV50vaXHRefbfDv85tha+x6AXZME5jKLO7evdyz98fus7HhzIJ3lQtTzzjKFNW+tMXmmHmvxk+/GpzZ+itMsYVfBBSjVQ7UyKWechwWI7haPxI9C9CU80x0TUbCNxkUytHtabOhnG3gaHrv6mPpf1K9BekJGQ3NH5iSqf/MjOnItcKf+Px5butuZtc/TS2qP9Tj2H+uf8xtRY798gRjlMJr6rBr66m5h0tAzemTJyxTrFFDUOKHd3vUk9/U6A/FbYA1TJ7c5qvXJSDLbHmWyNxW6l0jHdNgQCjzp3h/FLCBEBqWwFOBC5UwF93TC196e4vKcLKYCEO0DqsUYt94cpXbEQLsYcTzyNjNMw702jOh1TRfiQSFKo+szxmewIZupS4S2/LI5PKZjGO9IDRQDykfBKjQfXD/EcjJucumw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15331bb2-3b5c-4cbf-7dbd-08d736ae35ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 11:50:15.6100 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2y92nVg7xxFdH+qVr407fCC6USNtkBPzHG1283hwB5rMK9eW9zhrPcQvYhVVm0hXFG75QwtUZ4DKWHYIa8r+Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3421
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JbU18eF14n6BZ6o0gwD10WfQIJuWWHfiwNQQOfQNUnc=;
 b=iLtaTnJ4Mydu9rsuhTg4BQy76geqyinPzsHY3S+7SU6U7YAXjjXJtIdjCXrvf3axXGX3OjWsMeAf44D0aue8FtZXboGbVqwB4AMlwimQSrAdAPKdFY71u37P19to8R6212bcuySKvMjU2yq02aHhvTq8IQUhMNsSH4lW4FGjdlE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
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
Cc: "Tuikov, Luben" <Luben.Tuikov@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Liu,
 Aaron" <Aaron.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBhZGRzIHRteiBwYXJhbWV0ZXIgdG8gZW5hYmxlL2Rpc2FibGUgdGhlIGZlYXR1
cmUgaW4gdGhlIGFtZGdwdSBrZXJuZWwKbW9kdWxlLiBOb21hbGx5LCBieSBkZWZhdWx0LCBpdCBz
aG91bGQgYmUgYXV0byAocmVseSBvbiB0aGUgaGFyZHdhcmUKY2FwYWJpbGl0eSkuCgpCdXQgcmln
aHQgbm93LCBpdCBuZWVkIHRvIHNldCAib2ZmIiB0byBhdm9pZCBicmVha2luZyBvdGhlciBkZXZl
bG9wZXJzJwp3b3JrIGJlY2F1c2UgaXQncyBub3QgdG90YWxseSBjb21wbGV0ZWQuCgpXaWxsIHNl
dCAiYXV0byIgdGlsbCB0aGUgZmVhdHVyZSBpcyBzdGFibGUgYW5kIGNvbXBsZXRlbHkgdmVyaWZp
ZWQuCgp2MjogYWRkICJhdXRvIiBvcHRpb24gZm9yIGZ1dHVyZSB1c2UuCgpTaWduZWQtb2ZmLWJ5
OiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVy
IDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdS5oICAgICB8ICAxICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kcnYuYyB8IDExICsrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaCBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oCmluZGV4IGExNTE2YTMuLjkzMDY0M2Mg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oCkBAIC0xNzIsNiArMTcyLDcgQEAgZXh0
ZXJuIGludCBhbWRncHVfZm9yY2VfYXNpY190eXBlOwogI2lmZGVmIENPTkZJR19IU0FfQU1ECiBl
eHRlcm4gaW50IHNjaGVkX3BvbGljeTsKICNlbmRpZgorZXh0ZXJuIGludCBhbWRncHVfdG16Owog
CiAjaWZkZWYgQ09ORklHX0RSTV9BTURHUFVfU0kKIGV4dGVybiBpbnQgYW1kZ3B1X3NpX3N1cHBv
cnQ7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKaW5kZXggNjk3OGQxNy4u
NjA2ZjFkMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Ry
di5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwpAQCAtMTQ1
LDYgKzE0NSw3IEBAIGludCBhbWRncHVfZGlzY292ZXJ5ID0gLTE7CiBpbnQgYW1kZ3B1X21lcyA9
IDA7CiBpbnQgYW1kZ3B1X25vcmV0cnkgPSAxOwogaW50IGFtZGdwdV9mb3JjZV9hc2ljX3R5cGUg
PSAtMTsKK2ludCBhbWRncHVfdG16ID0gMDsKIAogc3RydWN0IGFtZGdwdV9tZ3B1X2luZm8gbWdw
dV9pbmZvID0gewogCS5tdXRleCA9IF9fTVVURVhfSU5JVElBTElaRVIobWdwdV9pbmZvLm11dGV4
KSwKQEAgLTc1Miw2ICs3NTMsMTYgQEAgdWludCBhbWRncHVfZG1fYWJtX2xldmVsID0gMDsKIE1P
RFVMRV9QQVJNX0RFU0MoYWJtbGV2ZWwsICJBQk0gbGV2ZWwgKDAgPSBvZmYgKGRlZmF1bHQpLCAx
LTQgPSBiYWNrbGlnaHQgcmVkdWN0aW9uIGxldmVsKSAiKTsKIG1vZHVsZV9wYXJhbV9uYW1lZChh
Ym1sZXZlbCwgYW1kZ3B1X2RtX2FibV9sZXZlbCwgdWludCwgMDQ0NCk7CiAKKy8qKgorICogRE9D
OiB0bXogKGludCkKKyAqIFRydXN0IE1lbW9yeSBab25lIChUTVopIGlzIGEgbWV0aG9kIHRvIHBy
b3RlY3QgdGhlIGNvbnRlbnRzIGJlaW5nIHdyaXR0ZW4gdG8KKyAqIGFuZCByZWFkIGZyb20gbWVt
b3J5LgorICoKKyAqIFRoZSBkZWZhdWx0IHZhbHVlOiAwIChvZmYpLiAgVE9ETzogY2hhbmdlIHRv
IGF1dG8gdGlsbCBpdCBpcyBjb21wbGV0ZWQuCisgKi8KK01PRFVMRV9QQVJNX0RFU0ModG16LCAi
RW5hYmxlIFRNWiBmZWF0dXJlICgtMSA9IGF1dG8sIDAgPSBvZmYgKGRlZmF1bHQpLCAxID0gb24p
Iik7Cittb2R1bGVfcGFyYW1fbmFtZWQodG16LCBhbWRncHVfdG16LCBpbnQsIDA0NDQpOworCiBz
dGF0aWMgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgcGNpaWRsaXN0W10gPSB7CiAjaWZkZWYg
IENPTkZJR19EUk1fQU1ER1BVX1NJCiAJezB4MTAwMiwgMHg2NzgwLCBQQ0lfQU5ZX0lELCBQQ0lf
QU5ZX0lELCAwLCAwLCBDSElQX1RBSElUSX0sCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
