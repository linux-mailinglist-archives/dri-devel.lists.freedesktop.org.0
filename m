Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA6473394
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 18:22:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C58EA6E5ED;
	Wed, 24 Jul 2019 16:22:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690041.outbound.protection.outlook.com [40.107.69.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7E896E5ED
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 16:22:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ErT1XixftIi10Lk0LTwdm+f3PTaixOzjfrqkbTsh8jAuSFr4RZU4y8zxZIRpwDQTZEjr/oEapb7XM7XhB4zqUsLvBVmFZPVjoiijXOsFbP+y9i+S7zV5Ohjqfnp8BJjUByxZFuXAbV2s2KqMIhy9Iceu9gtQ7LjL9/0kYFBVDmtfHvVaHYCdw/uRGMmL26HcuOGgouIgt5T+psCa4mb0rm1NEpK6Q4W81zy4Vg3Y3LRh8fD0F2C8TAH6D+uX7AO3rhlV/kMCTk2b5yklIP/eAfWo0OWMdyQv+IB/wWBCEFwBCjwvG34ARMHcwRXeFPb7k/KvJS/P1bEt5s+Jrgc3Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F87eiszg9QN97//7Jx8h7rbfFHUAALSG2SDaq6wjLpM=;
 b=blEc2XxTFcx5grFEK4yMH9pdrmaud29oqsNl9avICYAjf1cKh0jX15r88sh3HfFYgMUFEJbadrTMOR11iimCp4VWPjssUp6G2kJVRGK533jdcWBdoma881tklVHBlkPCzQ+OvQFy0bNsDtmCbwIkdHG6PPzX0L1fRHaAXL0OxEgraESJbM8dlTG9CepCZOkLn+tvyGyNkZCbeUF2SjeVgLDIjSL4x3nadKUKDlZkFBvjzl4EQl7ZVEaNCfONWkFVm51DUU9yG/Kr3iFL+LAgWt8+n3sg0f4/bwh4xf/LrQ2vR0vjzftx6JtGSpY7VHaX52AIAhXcAN5NoBfJH+62RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=vmware.com;dmarc=pass action=none
 header.from=vmware.com;dkim=pass header.d=vmware.com;arc=none
Received: from BY5PR05MB6883.namprd05.prod.outlook.com (52.132.255.33) by
 BY5PR05MB7140.namprd05.prod.outlook.com (10.255.89.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Wed, 24 Jul 2019 16:22:14 +0000
Received: from BY5PR05MB6883.namprd05.prod.outlook.com
 ([fe80::6d09:ff82:988b:5e03]) by BY5PR05MB6883.namprd05.prod.outlook.com
 ([fe80::6d09:ff82:988b:5e03%5]) with mapi id 15.20.2115.005; Wed, 24 Jul 2019
 16:22:14 +0000
From: Deepak Singh Rawat <drawat@vmware.com>
To: Emil Velikov <emil.l.velikov@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/vmwgfx: add local DRM_AUTH check for PRIME
 TO/FROM HANDLE
Thread-Topic: [PATCH 2/3] drm/vmwgfx: add local DRM_AUTH check for PRIME
 TO/FROM HANDLE
Thread-Index: AQHVQjq1RluDhKE8EUmRjhRVQUwXwKbZ88SA
Date: Wed, 24 Jul 2019 16:22:14 +0000
Message-ID: <8fb5567b7851e0671fa34d115d9a3b5740143f6f.camel@vmware.com>
References: <20190722174025.9830-1-emil.l.velikov@gmail.com>
 <20190722174025.9830-2-emil.l.velikov@gmail.com>
 <20190724161254.GC24644@arch-x1c3>
In-Reply-To: <20190724161254.GC24644@arch-x1c3>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR06CA0029.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::42) To BY5PR05MB6883.namprd05.prod.outlook.com
 (2603:10b6:a03:1c9::33)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-originating-ip: [66.170.99.2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b52db16d-bb2a-4e0c-5303-08d710531650
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR05MB7140; 
x-ms-traffictypediagnostic: BY5PR05MB7140:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-microsoft-antispam-prvs: <BY5PR05MB7140BEC818DE284C42DCC066BAC60@BY5PR05MB7140.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(376002)(396003)(39860400002)(136003)(199004)(189003)(8936002)(256004)(2906002)(8676002)(81166006)(81156014)(50226002)(3846002)(2501003)(6116002)(14444005)(86362001)(6512007)(36756003)(6246003)(305945005)(53936002)(7736002)(25786009)(107886003)(71190400001)(14454004)(4326008)(102836004)(71200400001)(6506007)(478600001)(99286004)(386003)(26005)(52116002)(76176011)(5660300002)(118296001)(110136005)(4744005)(64756008)(66556008)(66476007)(66446008)(68736007)(186003)(66946007)(6436002)(229853002)(316002)(6486002)(486006)(446003)(2616005)(11346002)(476003)(66066001)(54906003)(99106002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR05MB7140;
 H:BY5PR05MB6883.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: MZJlLwT+uN7qIYk2nOp1NdwJCJJBA8tj3S6LnoQBHoeQlo+2gDL4jt07grUzbXPmZ5P+/AaU6h9Uwu3ql3x6EbjIACVvJC6C56ec6ZmaDWaMv68xAmxYgEytiCSAjucuxw5SvPR77Jf+SVXKUxSlDC+UHKUq2XIMcmJaSznHtU80U6nbbLbQU5ETlj4RoMkgEG3d00hBQCfwQT0hlV9hWncY9x7SHMhQ2syz+aEXSUwRHygqRomv+ngf4BfabL0jRFgCfSyQqv1onlgWQFPgOs66fYmhTNMKGm56fMnDTvYrNQP1d1nKkU631c2DGSW5Y434sW+uEOcoozl3j4Z6QyJptGsPegTo39kxSFUc8+/97UuP53pFOu3C8/3TNfPymCLc8XZURYYrIDoRSihcrK4/sePCe1pAY9dJjUcV5vA=
Content-ID: <25D7413E2E37B745AA8FBE7CF1FE0A27@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b52db16d-bb2a-4e0c-5303-08d710531650
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2019 16:22:14.2035 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: drawat@vmware.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR05MB7140
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vmware.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F87eiszg9QN97//7Jx8h7rbfFHUAALSG2SDaq6wjLpM=;
 b=hAS0H2QaLaHrBtiyXnoQ+UJOpWUljRnBw1NNyr6HyfP9c7Ki4FG/dkbZbxbrtdSYzSqTtZmIWXE7h7TgLboDymnKsKd9GBdsyjYoYRMlkQbiE3FZOIsyhbmOWWbLWE3C44qU/95knQhRwrCVimNk+ZhcSYXvmqcGnVd3kH9tyK8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=drawat@vmware.com; 
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBIaSBEZWVwYWssDQo+IA0KPiBBcyBmYXIgYXMgSSBjYW4gdGVsbCBUaG9tYXMgaXMgb24gaG9s
aWRheXMgZm9yIGFub3RoZXIgMisgd2Vla3MuDQo+IA0KPiBJcyB0aGVyZSBhbnlvbmUgZWxzZSBp
biB0aGUgdGVhbSB3aG8gY2FuIHJldmlldyB0aGUgVk1XYXJlIHBhdGNoZXMgb2YNCj4gdGhpcyBz
ZXJpZXM/IEkgdGVzdGVkIHRoZSBsb3QgcXVpY2tseSwgYnV0IGFkZGl0aW9uYWwgY29uZmlybWF0
aW9uDQo+IHdvdWxkDQo+IGJlIGFwcHJlY2lhdGVkLg0KPiANCj4gWW91IGNhbiBmaW5kIHRoZSBz
ZXJpZXMgdmlhIHRoZSAiVk13YXJlIEdyYXBoaWNzIiBhbGlhcywgb3IgaW4gdGhlDQo+IHBhdGNo
d29yayBsaW5rIGJlbG93Lg0KDQpIaSBFbWlsLA0KDQpJIGNhbiBsb29rIGludG8geW91ciBwYXRj
aGVzIGFuZCBJIGRpZCBoYWQgYSBjdXJzb3J5IGxvb2sgYXQgdGhvc2UgYW5kDQp0byBiZSBob25l
c3QgSSBkb24ndCByZWFsbHkga25vdyB0aGlzIGFyZWEgYW5kIGFsc28gc2luY2UgaXQgZGVhbHMg
d2l0aA0Kc2VjdXJpdHkgSSB0aG91Z2h0IGEgUkIgZnJvbSBUaG9tYXMgd291bGQgYmUgbmljZS4g
SSB3aWxsIGRldm90ZSBzb21lDQptb3JlIHRpbWUgb24geW91ciBwYXRjaGVzLiBUaGFua3MgZm9y
IGRvaW5nIHRoaXMuDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
