Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98277BDF4F
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 15:45:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80BA26EBC3;
	Wed, 25 Sep 2019 13:45:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730043.outbound.protection.outlook.com [40.107.73.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 000B36EBC1;
 Wed, 25 Sep 2019 13:45:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OisRJ9AIw+A9t05I8nQDP6PNCC/25cFvQgaCngKwbc6jCw9Satpoxiumdg0JwW8KFgQPNXNI+MS4ZhHWeb814YPusC7gKF9Hf8wIE3FQWaXwG+6pDBlYOY/L9W5WgNUJuNJs+E+lPLYbVqpernpI2v/HdrLed7L8H3E4VcXKpHDPBzDLPNWBhciPu80C2H5PY9X2GEXb0fKqJZjTAdKUO9/7FWm2Tw3aeyu6ieGpdjkmsbQS3HSJzvhc4MWgH6egnWirRuvSCjgudjlJC0vf4xv0H6MVLLrf7w+obpLc1fgnpL+kKIk3exMvaePGxb/d5kWgKSlz5PPesy3iYUJUYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Z6VLfz+YpSTznlSLu70AJ4pOVJrHNucy74VHXpxvL4=;
 b=JSdJA6LdH+MDRgJwCYs88g8kNcYVQyzSVcF9whBD92idoQCikOT9CMNQaaVoHB0JoonqTTw5q0RE+OV6SlwEg1ZYDeg5welHI7q175RK65Q+9Accu3DPjqdtwRy9VoJPzIHiJMXe9Fhd+H5z/cqrxfScOAqaVdyYPGevldUK0FjVjaR02q0ASgySeMs+lNS36GLSkObge3cKjEehCJRpIxJ0Qk2B4Q4TcRe6aex+Qo+8sn2ataVRwqb9NJAu1KheewwCv7bNoYyeMck/7Q8PeTYErqR6gz1fan2bvTO8qRunxi9WhN1vsEupJZnyL4ZNpZrC4SfCp3JptDA3sAl7UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB4304.namprd12.prod.outlook.com (10.255.224.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Wed, 25 Sep 2019 13:45:32 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d%4]) with mapi id 15.20.2305.016; Wed, 25 Sep 2019
 13:45:32 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: [PATCH v2 07/11] drm/amdgpu: add tmz bit in frame control packet
Thread-Topic: [PATCH v2 07/11] drm/amdgpu: add tmz bit in frame control packet
Thread-Index: AQHVc6d/ZPsYtQ4lsUiGWg8fffj+kg==
Date: Wed, 25 Sep 2019 13:45:31 +0000
Message-ID: <1569419090-5304-8-git-send-email-ray.huang@amd.com>
References: <1569419090-5304-1-git-send-email-ray.huang@amd.com>
In-Reply-To: <1569419090-5304-1-git-send-email-ray.huang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-clientproxiedby: HK2PR02CA0186.apcprd02.prod.outlook.com
 (2603:1096:201:21::22) To MN2PR12MB3309.namprd12.prod.outlook.com
 (2603:10b6:208:106::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 22f0e632-0855-4651-6af5-08d741bea207
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB4304; 
x-ms-traffictypediagnostic: MN2PR12MB4304:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB430487D2D23565C52DED571BEC870@MN2PR12MB4304.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:820;
x-forefront-prvs: 01713B2841
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(39860400002)(136003)(376002)(346002)(396003)(366004)(189003)(199004)(86362001)(8936002)(305945005)(2501003)(50226002)(6636002)(256004)(19627235002)(6486002)(6116002)(3846002)(6436002)(6512007)(2906002)(4326008)(66066001)(102836004)(26005)(186003)(52116002)(76176011)(486006)(476003)(2616005)(11346002)(66946007)(66476007)(66556008)(64756008)(66446008)(446003)(99286004)(5660300002)(81156014)(6506007)(81166006)(450100002)(25786009)(36756003)(316002)(478600001)(386003)(8676002)(71190400001)(71200400001)(110136005)(54906003)(7736002)(14454004)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4304;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2DuJnD6Lf4KkBZt9nXv/crobF62mKOQ0y6Pxzn6JvLFG4dQPRLoAJpA7+e++WrzKYuo+VCRQNKDgM0Cdn7ulRWQw8wXsYrsRaKUUFcHTsTCFxlTPwUYC5Er6EWTFSqTkR6j+Whq2qAqjdHgwx/ybT8C9yLAwDNBu3oLaWCgIXYJGwpJkUH7WDlSaCEWuQSokUlW0lUnUmHAd5jBaiJUXxoJ87f7R/Y9G9/Ript5tzbnOgLnpIFemvGnn4E5SRDjiO8KPAETmEYSpKEjRkOAFVJJNtPVd4n0z43K/Onmrb36DqDfyUXx7Hk3mqWj5kG2fZ3V1oCyoOapQ14kKuknJdV0qs91xHfk/o/wkUgQyUtHAdXg6uxqrIzALGLISIoWyT4QaN2PY7CtVIMW3oureMfKq2E8nW+77zal46wC+1PY=
Content-ID: <D166641A9D244B49957020511F8ADA9C@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22f0e632-0855-4651-6af5-08d741bea207
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2019 13:45:31.9408 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qgfeZum+/AQZdvGL3umLVbf4iT9sOrJk//1TDfXTFRGRYIy1fFGlzlvIBFiQQfXTBcsiIfIGZHtKsrnwvn4ePQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4304
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Z6VLfz+YpSTznlSLu70AJ4pOVJrHNucy74VHXpxvL4=;
 b=itf8bfc9c793nHA3SPpbmQ8cUiwKVNeOlWgZfg5bf6ZCz2VQKyjcC6486etBZu9nb4ANpwV7/cok4DeITn0NtjyrgyKX0Z+n/2D5/qXd1UUnGXnuU+tFgs34V+rAXWr1S0MUB+JZ58c+4DawwabevOyPU2hE4z8g2A2c4hNR4yg=
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

VGhpcyBwYXRjaCBhZGRzIHRteiBiaXQgaW4gZnJhbWUgY29udHJvbCBwbTQgcGFja2V0LCBhbmQg
aXQgd2lsbCB1c2VkIGluIGZ1dHVyZS4NCg0KU2lnbmVkLW9mZi1ieTogSHVhbmcgUnVpIDxyYXku
aHVhbmdAYW1kLmNvbT4NClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVj
aGVyQGFtZC5jb20+DQpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtv
ZW5pZ0BhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnZkLmggICAg
fCAxICsNCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNWQuaCB8IDEgKw0KIDIgZmls
ZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9udmQuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252ZC5oDQpp
bmRleCAxZGU5ODQ2Li5mM2Q4NzcxIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvbnZkLmgNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252ZC5oDQpAQCAt
MzA2LDYgKzMwNiw3IEBADQogI2RlZmluZQlQQUNLRVQzX0dFVF9MT0RfU1RBVFMJCQkJMHg4RQ0K
ICNkZWZpbmUJUEFDS0VUM19EUkFXX01VTFRJX1BSRUFNQkxFCQkJMHg4Rg0KICNkZWZpbmUJUEFD
S0VUM19GUkFNRV9DT05UUk9MCQkJCTB4OTANCisjCQkJZGVmaW5lIEZSQU1FX1RNWgkoMSA8PCAw
KQ0KICMJCQlkZWZpbmUgRlJBTUVfQ01EKHgpICgoeCkgPDwgMjgpDQogCQkJLyoNCiAJCQkgKiB4
PTA6IHRtel9iZWdpbg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Nv
YzE1ZC5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTVkLmgNCmluZGV4IGVkZmU1
MDguLjI5NWQ2OGMgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2Mx
NWQuaA0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTVkLmgNCkBAIC0yODYs
NiArMjg2LDcgQEANCiAjZGVmaW5lCVBBQ0tFVDNfV0FJVF9PTl9ERV9DT1VOVEVSX0RJRkYJCQkw
eDg4DQogI2RlZmluZQlQQUNLRVQzX1NXSVRDSF9CVUZGRVIJCQkJMHg4Qg0KICNkZWZpbmUgUEFD
S0VUM19GUkFNRV9DT05UUk9MCQkJCTB4OTANCisjCQkJZGVmaW5lIEZSQU1FX1RNWgkoMSA8PCAw
KQ0KICMJCQlkZWZpbmUgRlJBTUVfQ01EKHgpICgoeCkgPDwgMjgpDQogCQkJLyoNCiAJCQkgKiB4
PTA6IHRtel9iZWdpbg0KLS0gDQoyLjcuNA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
