Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 218D11A38A
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2019 21:53:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0322189FDD;
	Fri, 10 May 2019 19:53:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680087.outbound.protection.outlook.com [40.107.68.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C6CD89B7D;
 Fri, 10 May 2019 19:53:25 +0000 (UTC)
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (20.179.92.82) by
 BYAPR12MB3447.namprd12.prod.outlook.com (20.178.196.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.21; Fri, 10 May 2019 19:53:23 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7%4]) with mapi id 15.20.1856.016; Fri, 10 May 2019
 19:53:23 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "jglisse@redhat.com" <jglisse@redhat.com>, "alex.deucher@amd.com"
 <alex.deucher@amd.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] mm/hmm: support automatic NUMA balancing
Thread-Topic: [PATCH 1/2] mm/hmm: support automatic NUMA balancing
Thread-Index: AQHVB2oGxdqwfWjT3keZMPNyIuFBZw==
Date: Fri, 10 May 2019 19:53:23 +0000
Message-ID: <20190510195258.9930-2-Felix.Kuehling@amd.com>
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
x-ms-office365-filtering-correlation-id: 2aa8c48f-0427-4877-df74-08d6d5812861
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3447; 
x-ms-traffictypediagnostic: BYAPR12MB3447:
x-microsoft-antispam-prvs: <BYAPR12MB34475F0513AC9B90A3082C3F920C0@BYAPR12MB3447.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 0033AAD26D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(136003)(366004)(39860400002)(346002)(376002)(189003)(199004)(110136005)(102836004)(2501003)(6512007)(86362001)(6436002)(2906002)(76176011)(52116002)(2201001)(6506007)(386003)(99286004)(6486002)(66066001)(3846002)(478600001)(6116002)(14454004)(72206003)(316002)(305945005)(53936002)(66476007)(66556008)(186003)(8936002)(81166006)(7736002)(486006)(4326008)(64756008)(66446008)(14444005)(256004)(25786009)(26005)(66946007)(73956011)(476003)(2616005)(71200400001)(446003)(11346002)(71190400001)(8676002)(36756003)(81156014)(5660300002)(50226002)(4744005)(68736007)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3447;
 H:BYAPR12MB3176.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SozOdyCbVyWhsZucRi1nkqT89QpXVuUElrx98H8kPsylK1EJGgawzrDEfe+cLr9wWnjrZeIcUc3MUfZKpWVDNq4lxttKtLb76kVvErHyGKMW2uYrpXLCCWQxSDrQN8FXK+S0tpW3vwsN0PjeyMFqCdz7Y2PiCWzUB2apxyHa0u1IveEB3cL04d5Xv5QU1gs050l4HMDXT03dKi6YX8pMsLVMjOfgmsxxmc8KdYEqdK2gvPdep+9eTV6eT+wVQuQiJWR9JalT0jkPAx+dLEYbRbcq3BnJ/yxuxJ0xdc+pWrwswyhXnAxF1211TpUujkZZzAxbalvVEfUYea1v85bUJV7j/w9XT5WfU55bU77takcZrv/PpIiv2gIyvXKOrI/1ax3JS06iUNJ/492tp9GosdDHhv+Kjhh3bL/oMsVGWBI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aa8c48f-0427-4877-df74-08d6d5812861
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2019 19:53:23.0778 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3447
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=01TE663c8WMujIC20jubp91UV3+DQFkGrM3bWrl8IbU=;
 b=koIJQSAKV4tSIdDeGAsJ8r8laUsSJeUbvwAIUPRqgRBW90AEy4QvL6qmIhh01au+Rld330cHy0FRXsvrj9s6FIwgDda/e4oypHixsOHBNXRwR0bI/whVVGVVxKLqhrPFnJ8zARmsy/dUIfBAmDYc/Pi3O+glwgMEZbLy2J2Zhvo=
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
Cc: "Yang, Philip" <Philip.Yang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUGhpbGlwIFlhbmcgPFBoaWxpcC5ZYW5nQGFtZC5jb20+DQoNCldoaWxlIHRoZSBwYWdl
IGlzIG1pZ3JhdGluZyBieSBOVU1BIGJhbGFuY2luZywgSE1NIGZhaWxlZCB0byBkZXRlY3QgdGhp
cw0KY29uZGl0aW9uIGFuZCBzdGlsbCByZXR1cm4gdGhlIG9sZCBwYWdlLiBBcHBsaWNhdGlvbiB3
aWxsIHVzZSB0aGUgbmV3DQpwYWdlIG1pZ3JhdGVkLCBidXQgZHJpdmVyIHBhc3MgdGhlIG9sZCBw
YWdlIHBoeXNpY2FsIGFkZHJlc3MgdG8gR1BVLA0KdGhpcyBjcmFzaCB0aGUgYXBwbGljYXRpb24g
bGF0ZXIuDQoNClVzZSBwdGVfcHJvdG5vbmUocHRlKSB0byByZXR1cm4gdGhpcyBjb25kaXRpb24g
YW5kIHRoZW4gaG1tX3ZtYV9kb19mYXVsdA0Kd2lsbCBhbGxvY2F0ZSBuZXcgcGFnZS4NCg0KU2ln
bmVkLW9mZi1ieTogUGhpbGlwIFlhbmcgPFBoaWxpcC5ZYW5nQGFtZC5jb20+DQotLS0NCiBtbS9o
bW0uYyB8IDIgKy0NCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkNCg0KZGlmZiAtLWdpdCBhL21tL2htbS5jIGIvbW0vaG1tLmMNCmluZGV4IDc1ZDJlYTkwNmVm
Yi4uYjY1YzI3ZDVjMTE5IDEwMDY0NA0KLS0tIGEvbW0vaG1tLmMNCisrKyBiL21tL2htbS5jDQpA
QCAtNTU0LDcgKzU1NCw3IEBAIHN0YXRpYyBpbnQgaG1tX3ZtYV9oYW5kbGVfcG1kKHN0cnVjdCBt
bV93YWxrICp3YWxrLA0KIA0KIHN0YXRpYyBpbmxpbmUgdWludDY0X3QgcHRlX3RvX2htbV9wZm5f
ZmxhZ3Moc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UsIHB0ZV90IHB0ZSkNCiB7DQotCWlmIChwdGVf
bm9uZShwdGUpIHx8ICFwdGVfcHJlc2VudChwdGUpKQ0KKwlpZiAocHRlX25vbmUocHRlKSB8fCAh
cHRlX3ByZXNlbnQocHRlKSB8fCBwdGVfcHJvdG5vbmUocHRlKSkNCiAJCXJldHVybiAwOw0KIAly
ZXR1cm4gcHRlX3dyaXRlKHB0ZSkgPyByYW5nZS0+ZmxhZ3NbSE1NX1BGTl9WQUxJRF0gfA0KIAkJ
CQlyYW5nZS0+ZmxhZ3NbSE1NX1BGTl9XUklURV0gOg0KLS0gDQoyLjE3LjENCg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
