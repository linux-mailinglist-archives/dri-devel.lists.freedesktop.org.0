Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9471A38B
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2019 21:53:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C58B89FF7;
	Fri, 10 May 2019 19:53:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680048.outbound.protection.outlook.com [40.107.68.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B5E889FEA;
 Fri, 10 May 2019 19:53:26 +0000 (UTC)
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (20.179.92.82) by
 BYAPR12MB3447.namprd12.prod.outlook.com (20.178.196.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.21; Fri, 10 May 2019 19:53:24 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7%4]) with mapi id 15.20.1856.016; Fri, 10 May 2019
 19:53:24 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "jglisse@redhat.com" <jglisse@redhat.com>, "alex.deucher@amd.com"
 <alex.deucher@amd.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] mm/hmm: Only set FAULT_FLAG_ALLOW_RETRY for non-blocking
Thread-Topic: [PATCH 2/2] mm/hmm: Only set FAULT_FLAG_ALLOW_RETRY for
 non-blocking
Thread-Index: AQHVB2oH3gumKK8uVkW/G1cJvzIbZg==
Date: Fri, 10 May 2019 19:53:24 +0000
Message-ID: <20190510195258.9930-3-Felix.Kuehling@amd.com>
References: <20190510195258.9930-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190510195258.9930-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YTXPR0101CA0021.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::34) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:133::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0bb65e5e-6543-480a-32a4-08d6d5812935
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3447; 
x-ms-traffictypediagnostic: BYAPR12MB3447:
x-microsoft-antispam-prvs: <BYAPR12MB34471B0FAC58B853D74E2938920C0@BYAPR12MB3447.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1360;
x-forefront-prvs: 0033AAD26D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(136003)(366004)(39860400002)(346002)(376002)(189003)(199004)(110136005)(102836004)(2501003)(6512007)(86362001)(6436002)(2906002)(76176011)(52116002)(2201001)(6506007)(386003)(99286004)(6486002)(66066001)(3846002)(478600001)(6116002)(14454004)(72206003)(316002)(305945005)(53936002)(66476007)(66556008)(186003)(8936002)(81166006)(7736002)(486006)(4326008)(64756008)(66446008)(14444005)(256004)(25786009)(26005)(66946007)(73956011)(476003)(2616005)(71200400001)(446003)(11346002)(71190400001)(8676002)(36756003)(81156014)(5660300002)(50226002)(4744005)(68736007)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3447;
 H:BYAPR12MB3176.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rn/Ggjr1Nl/zRrTCRjOLymvE6YXZ1ceesRFPMg0pssZdDd7x2nsdvBY2xsJ3ZOvtNqnGWAw8l7NQ+n5lnJKDJ55ND1g+hRNTEGKb78y366B8p1HVRZ1MhjxLTMDvIsmIVO5IQtkX3avdH3Cw7QzcrUr5F5iYmNm0auaT6Fw5oVUGoOcluvaaqgyuIDiFmnPFpJKeIezp/9UVUv57G5FYf40FcpLur6sF7qUWNToXFGFaPsoV9JIdtIDWIX3SVV053p1J0fbxsT1CwIojY1gJo5mM0k+bkxx7t3oH31Uv6cD9FaTMKUXhFV3LgYXXxVFJbj0ZFLPSs/nNnpOMMd5GfhRTxbf2voNvzq2165Rj/E0yEGwAcLWKR3BY3Ps6nZ0dP0vKZbwaTzsrx1baAmwGYUX1mDfFUVJjrYNyuAce7HE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bb65e5e-6543-480a-32a4-08d6d5812935
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2019 19:53:24.3777 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3447
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r68dEYCklCFsZVBUW4IcTm6GYQl0JWxtn6eHLJELlhk=;
 b=t1Ik0EmjrTAmXwn1tFrtBpXamK9ghiEQtvc3CvB3OUk+oFeW8Z4GtAt5wTAHW2NBWKuq36LEzUb8PjrwxMltovb/5DiiG6chGG6SzC4uchONNehmrVIP9CwQdw8HF5sU7p46uBvgKboRz0quHaAzwLHc5+KcxHYrHngtQYPtBR4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RG9uJ3Qgc2V0IHRoaXMgZmxhZyBieSBkZWZhdWx0IGluIGhtbV92bWFfZG9fZmF1bHQuIEl0IGlz
IHNldA0KY29uZGl0aW9uYWxseSBqdXN0IGEgZmV3IGxpbmVzIGJlbG93LiBTZXR0aW5nIGl0IHVu
Y29uZGl0aW9uYWxseQ0KY2FuIGxlYWQgdG8gaGFuZGxlX21tX2ZhdWx0IGRvaW5nIGEgbm9uLWJs
b2NraW5nIGZhdWx0LCByZXR1cm5pbmcNCi1FQlVTWSBhbmQgdW5sb2NraW5nIG1tYXBfc2VtIHVu
ZXhwZWN0ZWRseS4NCg0KU2lnbmVkLW9mZi1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhs
aW5nQGFtZC5jb20+DQotLS0NCiBtbS9obW0uYyB8IDIgKy0NCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL21tL2htbS5jIGIvbW0v
aG1tLmMNCmluZGV4IGI2NWMyN2Q1YzExOS4uM2M0ZjFkNjIyMDJmIDEwMDY0NA0KLS0tIGEvbW0v
aG1tLmMNCisrKyBiL21tL2htbS5jDQpAQCAtMzM5LDcgKzMzOSw3IEBAIHN0cnVjdCBobW1fdm1h
X3dhbGsgew0KIHN0YXRpYyBpbnQgaG1tX3ZtYV9kb19mYXVsdChzdHJ1Y3QgbW1fd2FsayAqd2Fs
aywgdW5zaWduZWQgbG9uZyBhZGRyLA0KIAkJCSAgICBib29sIHdyaXRlX2ZhdWx0LCB1aW50NjRf
dCAqcGZuKQ0KIHsNCi0JdW5zaWduZWQgaW50IGZsYWdzID0gRkFVTFRfRkxBR19BTExPV19SRVRS
WSB8IEZBVUxUX0ZMQUdfUkVNT1RFOw0KKwl1bnNpZ25lZCBpbnQgZmxhZ3MgPSBGQVVMVF9GTEFH
X1JFTU9URTsNCiAJc3RydWN0IGhtbV92bWFfd2FsayAqaG1tX3ZtYV93YWxrID0gd2Fsay0+cHJp
dmF0ZTsNCiAJc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UgPSBobW1fdm1hX3dhbGstPnJhbmdlOw0K
IAlzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSA9IHdhbGstPnZtYTsNCi0tIA0KMi4xNy4xDQoN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
