Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C26AD3B9
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 09:23:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7117389870;
	Mon,  9 Sep 2019 07:23:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140041.outbound.protection.outlook.com [40.107.14.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA2289FF7
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Sep 2019 07:34:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BHD3uG64S8zJ7grknWDzq5vVgR86UZpVUwkeToTKAxg65vkXxuWDLB+e45JHb2pPEPXbI8xoo2jrJ3b7SOIiGTqCW8vKDg5zWz5Ziq1ReFqhnEEIiJg+tFWUXg0lsFdbvYTAOylggAgqcaS4ES4w2RNAN48FWlmExqZyQcXCWnYhTq/oOgprBpxu3OIRsufztanPHT5+5MWzqE8gUsOSMR0TG8t2bLGtMsfGzeYhOPKwyjuOBYa6vjgUdmfpBDodIQH5rA4xxarOk35aeozZVorKF4OIxT3GLoyAuNp1DocwHxx5C35UFC8LIGtmt5c13mcQSMpALZZjG16rAQZ1Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t28VnZpg/4wf8ynM/+VJ5erdvV115Bv02il+8gotWqs=;
 b=RyrftaJ+J20bSo6pZ07WVzTNvQKhQXbbE+wdLplPZru8fyexec4ySJ8bU5tbNX7QqcCvs/yR16Mlg0nbvxksEu9ri/pLoSbh/VLvojDlN1U6PqwU8v5AWWCUWD/60/oQaDmszUwfNoUjEZxBF0n6filrfwGucQWkyQHaOCN//sPVDbSRXsbqVrHUPFTzSBVd95RYgep8Vgc4EBThfgObORJ/RjC/Pd37JCtSBNzAFJZ6SC1tgCiQnzDwDI7Dba5U+FVmL2+AyyFj0BMjAvYdDcHqb9IR/LLCK5X5b1TinWsgdOqNYAJRzkX8hP7+QgSghkMBEsbzmEQ6me8oLprLdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB6160.eurprd05.prod.outlook.com (20.178.123.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.15; Sat, 7 Sep 2019 07:33:58 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::79a3:d971:d1f3:ab6f]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::79a3:d971:d1f3:ab6f%7]) with mapi id 15.20.2220.022; Sat, 7 Sep 2019
 07:33:58 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] mm, notifier: Fix early return case for new lockdep
 annotations
Thread-Topic: [PATCH] mm, notifier: Fix early return case for new lockdep
 annotations
Thread-Index: AQHVZNssp1bwyLm3pUuFKcXxTfYpMqcf036A
Date: Sat, 7 Sep 2019 07:33:58 +0000
Message-ID: <20190907073355.GA3873@mellanox.com>
References: <20190906174730.22462-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20190906174730.22462-1-daniel.vetter@ffwll.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P123CA0018.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::30) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.218.143.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ff8079b-45af-404f-6b9f-08d73365be8a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB6160; 
x-ms-traffictypediagnostic: VI1PR05MB6160:
x-microsoft-antispam-prvs: <VI1PR05MB61608D88A6DEA6767F6F5B8BCFB50@VI1PR05MB6160.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0153A8321A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(346002)(376002)(366004)(396003)(189003)(199004)(66946007)(316002)(54906003)(66446008)(64756008)(33656002)(2906002)(6116002)(66476007)(3846002)(66556008)(14454004)(99286004)(86362001)(7416002)(305945005)(1076003)(8676002)(478600001)(52116002)(7736002)(14444005)(71200400001)(256004)(71190400001)(81166006)(66066001)(6436002)(26005)(2616005)(6512007)(476003)(486006)(186003)(102836004)(4326008)(446003)(11346002)(386003)(6486002)(76176011)(229853002)(6506007)(25786009)(8936002)(5660300002)(36756003)(53936002)(6246003)(6916009)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB6160;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3dsB2eVoC1g2cNY6O/8Rremf9AkuM2kF2SLL7nS95dMg8FK4Bdt2aNIR6UJlzuB88xl6/vkzAdoqJgqEWy/WJt/kg85g4Aw2B+m2LpO8Ypsvp2mtEcq8q29mCYMQkKpF0vrDVhWJFa/ytCR8FSiIWJn0gLrVUjbhpsmFS/0nsZDWIH1YStyYb94xcfGb1Vy4Hxe5zM6dzVrxZyN792Z37v6cFH+DVqh5R9UMuyl/5ZBUbFzCSnVS1gzAmu+OC9zSaIVcR+KPxSQoDzBLSlpmVCCbPmViDK9Z67+fNbxKERWKHkgKDFFveYrk3GJNYsd9knOI7EVUsMC1r2JbTNaWZm2IcBDBy3eproIUSzmHDiXvSvXiSlMVBuvdKhH07jnoS469Yt+/oEV1/jyhbTbI6mEsLFURLSh/vuOxYYZEDkk=
x-ms-exchange-transport-forked: True
Content-ID: <5E3C899ACA82F04791826B13EDEB3254@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ff8079b-45af-404f-6b9f-08d73365be8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2019 07:33:58.5975 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aksp3MTsVJn3W5EHCDyn/P0JIgkYL9MnNd5UPmxm/2QraF9VQXm5WoO2GTUoAvMpqMOIhWQZthKTacSr4KrhOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6160
X-Mailman-Approved-At: Mon, 09 Sep 2019 07:23:02 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t28VnZpg/4wf8ynM/+VJ5erdvV115Bv02il+8gotWqs=;
 b=T+LrT0pdtjSJ3YY7PeF7tJCnR3j421q2ZFFUDPwI7SIkGko4XR0sTEnYz667u0HQkgmeFxTs1oLKWv18SoXlZivZkHHzg0Equjb2Kpce0o39Y0OOhEN/aIMud4Az5GbQv7VRepBNecaWIipgPm56vVVYZ60PN1Uud9YhSIQisUY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Ralph Campbell <rcampbell@nvidia.com>, Michal Hocko <mhocko@suse.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 =?iso-8859-1?Q?J=E9r=F4me_Glisse?= <jglisse@redhat.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 "syzbot+aaedc50d99a03250fe1f@syzkaller.appspotmail.com"
 <syzbot+aaedc50d99a03250fe1f@syzkaller.appspotmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Ira Weiny <ira.weiny@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMDYsIDIwMTkgYXQgMDc6NDc6MzBQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbW11X25vdGlmaWVyLmggYi9pbmNs
dWRlL2xpbnV4L21tdV9ub3RpZmllci5oCj4gaW5kZXggNWEwMzQxN2U1YmY3Li40ZWRkOThiMDY4
MzQgMTAwNjQ0Cj4gKysrIGIvaW5jbHVkZS9saW51eC9tbXVfbm90aWZpZXIuaAo+IEBAIC0zNTYs
MTMgKzM1NiwxNCBAQCBtbXVfbm90aWZpZXJfaW52YWxpZGF0ZV9yYW5nZV9zdGFydChzdHJ1Y3Qg
bW11X25vdGlmaWVyX3JhbmdlICpyYW5nZSkKPiAgc3RhdGljIGlubGluZSBpbnQKPiAgbW11X25v
dGlmaWVyX2ludmFsaWRhdGVfcmFuZ2Vfc3RhcnRfbm9uYmxvY2soc3RydWN0IG1tdV9ub3RpZmll
cl9yYW5nZSAqcmFuZ2UpCj4gIHsKPiArCWludCByZXQgPSAwOwo+ICAJbG9ja19tYXBfYWNxdWly
ZSgmX19tbXVfbm90aWZpZXJfaW52YWxpZGF0ZV9yYW5nZV9zdGFydF9tYXApOwo+ICAJaWYgKG1t
X2hhc19ub3RpZmllcnMocmFuZ2UtPm1tKSkgewo+ICAJCXJhbmdlLT5mbGFncyAmPSB+TU1VX05P
VElGSUVSX1JBTkdFX0JMT0NLQUJMRTsKPiAtCQlyZXR1cm4gX19tbXVfbm90aWZpZXJfaW52YWxp
ZGF0ZV9yYW5nZV9zdGFydChyYW5nZSk7Cj4gKwkJcmV0ID0gX19tbXVfbm90aWZpZXJfaW52YWxp
ZGF0ZV9yYW5nZV9zdGFydChyYW5nZSk7Cj4gIAl9Cj4gIAlsb2NrX21hcF9yZWxlYXNlKCZfX21t
dV9ub3RpZmllcl9pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0X21hcCk7Cj4gLQlyZXR1cm4gMDsKPiAr
CXJldHVybiByZXQ7CgpHYXIsIHllcy4gU2luY2Ugbm9ib2R5IGhhcyBncmFiYmVkIGhtbS5naXQg
SSd2ZSBzcXVhc2hlZCB0aGlzIGludG8gdGhlCm9yaWdpbmFsIHBhdGNoIGFuZCBmaXhlZCB0aGUg
Y2hlY2twYXRjaCB3YXJuaW5nIGFib3V0IG1pc3NpbmcgbGluZQphZnRlciB0aGUgcmV0CgpFdmVy
eXRoaW5nIHNob3VsZCBiZSBpbiBsaW51eC1uZXh0IHRoZSBuZXh0IHRpbWUgaXQgYnVpbGRzCgpU
aGFua3MsCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
