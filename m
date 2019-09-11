Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B0BAFBCC
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 13:50:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56CCF6E25B;
	Wed, 11 Sep 2019 11:50:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780087.outbound.protection.outlook.com [40.107.78.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F28336E25A;
 Wed, 11 Sep 2019 11:50:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nTz5A7coRk1ke7jypMmoKXpWgaIs6FrO/2AiqnM9hTbxR1jwtyTBH0PMZUu2JROU32jK1tGFUIUoNyZ2BIvdJnX7ftLoPm9++lZOTsCIHPdeqVQ684SlR4cXUMk6Zo0ADH1Qh5hjCzMsJ39tefU0IsrNwBYdc8Fj2frzweD95YJUu3qXnn0Vg98PfZUX1sD/Dmf3LZgDQxlr10vP/2bi7f+hhwkiIGsLZpWw8s0BM4SJ+i0dZ33yHhEdbyAM6GksWvIV0aF36pmO7VXqLbFlapE+8OLfWIoa5vE/1i4BF1BcNqqByxDlPNHtBBjfLCoKXd/hM/d22FGtezpb8BsP6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jPXRsck+PnjbafITlvleuNArGe2odSSFtqN307AZ6/Y=;
 b=HJ8QyzwCShqnt6oU5e5JANHwXbyfZwdm8nkWSxa5LJOJEflJISI3slAbnUjjZnPXHYvYFUgJ32b1GgcWeygFhUzW+EZKg4fgcdMjFBRfAjuMPbsCcog2hpU/IQ8rf55mKrIDRn0RYkXfONxAFqOjieAdX14VcNgFusKSNOzV4jscmGfeY1jlKE5rF1w3sU4g6eDj+xSdsHHFdw7xKWU9Rk1rgHXf2E7WLjN1rJmFIjlMbkBye5zcOLPF15RCY3xPr6mg49UuWqvrnKU8L0Ez5nKasneeFcK+YaEdhhidV+MVMY7unZsJ47HyPiXjMg7PMb7jK0fqbViX5GGAl4Ok8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB3421.namprd12.prod.outlook.com (20.178.243.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Wed, 11 Sep 2019 11:50:05 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d%4]) with mapi id 15.20.2241.022; Wed, 11 Sep 2019
 11:50:05 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: [PATCH 01/14] drm/amdgpu: add UAPI for creating encrypted buffers
Thread-Topic: [PATCH 01/14] drm/amdgpu: add UAPI for creating encrypted buffers
Thread-Index: AQHVaJcNNk7UjbN3W0+8I517YPfG9w==
Date: Wed, 11 Sep 2019 11:50:05 +0000
Message-ID: <1568202584-14471-2-git-send-email-ray.huang@amd.com>
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
x-ms-office365-filtering-correlation-id: 4205e1f0-c15b-4ac0-e932-08d736ae2fb4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3421; 
x-ms-traffictypediagnostic: MN2PR12MB3421:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB34213A028EACADF878E76F59ECB10@MN2PR12MB3421.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(136003)(376002)(366004)(199004)(189003)(6436002)(4326008)(25786009)(450100002)(6486002)(486006)(11346002)(446003)(2616005)(305945005)(7736002)(50226002)(8936002)(316002)(110136005)(54906003)(8676002)(6116002)(3846002)(2906002)(81166006)(81156014)(36756003)(14454004)(71190400001)(71200400001)(86362001)(66446008)(478600001)(66476007)(64756008)(66556008)(66946007)(14444005)(4744005)(256004)(99286004)(53936002)(5660300002)(76176011)(52116002)(6512007)(6636002)(386003)(6506007)(66066001)(102836004)(26005)(186003)(476003)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3421;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: K8rNHUXf+MX2IM7AuvawKVWT2TpzIyN1eGB+YYkoVXNwtmCH83GGe0kMeEDHekan6pWkgCZ6+RVmb1QaitSnsMKBTbaPmxbe1KUMPqsoaPoHUrt/2WjvXLV2/uF+anRZLlSJafvlisv5RP5JYg9jUpg1Hmlh3y0uDEDeltHy8hT/d9D3lZC29pKKr/oMA4F5smN8mNSVYVPe8uJIHT80oCIQHIMuHrwyZS/rAeV/PsGbBQq2zXClIa9+KFXFq6Ft+WMysWR3CMBs++s4dduTdoAVw2g2EvNT8ENd/6N4yNLc723nNQpQgwkXsltz43jLx1b8QIdD88J7B03ZKkU2PE0yKtegaFbEO1wkCei612vFKySqgS4+gHzqqiQf0ErJdOAnKDvDq5VgqS/h1KPHTDsPQm+gEt2QJ96KudpaJjU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4205e1f0-c15b-4ac0-e932-08d736ae2fb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 11:50:05.3956 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UBMUnDBtRx+UBq6Cnuuq7sxVM65CkN60LyHmuklF9BzNCXN06saO8XA/T5hBYnwANI79EpimyiJ5OX7nQbTOYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3421
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jPXRsck+PnjbafITlvleuNArGe2odSSFtqN307AZ6/Y=;
 b=O0t6PM7UJ4MNmWhd7FqU3eC18yV/i6+yvzxQyDsPE1wB6pKjwZRjsIbx1e9VRnDQ7ohMPfAWNLBxpw62GvY3yLY2QoUBTP6z2q5pX2RugSrrjpZjqSzC/SrfTV8Cnh1e9zHxnReFV29ZUMWszIsqnXaDIMW95UTFWwV3b4Zb2xw=
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
Cc: "Tuikov, Luben" <Luben.Tuikov@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "Liu, Aaron" <Aaron.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgoKQWRkIGEgZmxh
ZyB0byB0aGUgR0VNX0NSRUFURSBpb2N0bCB0byBjcmVhdGUgZW5jcnlwdGVkIGJ1ZmZlcnMuCkJ1
ZmZlcnMgd2l0aCB0aGlzIGZsYWcgc2V0IHdpbGwgYmUgY3JlYXRlZCB3aXRoIHRoZSBUTVogYml0
IHNldAppbiB0aGUgUFRFcyBvciBlbmdpbmVzIGFjY2Vzc2luZyB0aGVtLiAgVGhpcyBpcyByZXF1
aXJlZCBpbiBvcmRlcgp0byBwcm9wZXJseSBhY2Nlc3MgdGhlIGRhdGEgZnJvbSB0aGUgZW5naW5l
cy4KClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNv
bT4KUmV2aWV3ZWQtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+Ci0tLQogaW5jbHVk
ZS91YXBpL2RybS9hbWRncHVfZHJtLmggfCA1ICsrKysrCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS9hbWRncHVfZHJtLmggYi9p
bmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0uaAppbmRleCBmM2FkNDI5Li5mOTBiNDUzIDEwMDY0
NAotLS0gYS9pbmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0uaAorKysgYi9pbmNsdWRlL3VhcGkv
ZHJtL2FtZGdwdV9kcm0uaApAQCAtMTM1LDYgKzEzNSwxMSBAQCBleHRlcm4gIkMiIHsKICAqIHJl
bGVhc2luZyB0aGUgbWVtb3J5CiAgKi8KICNkZWZpbmUgQU1ER1BVX0dFTV9DUkVBVEVfVlJBTV9X
SVBFX09OX1JFTEVBU0UJKDEgPDwgOSkKKy8qIEZsYWcgdGhhdCBCTyB3aWxsIGJlIGVuY3J5cHRl
ZCBhbmQgdGhhdCB0aGUgVE1aIGJpdCBzaG91bGQgYmUKKyAqIHNldCBpbiB0aGUgUFRFcyB3aGVu
IG1hcHBpbmcgdGhpcyBidWZmZXIgdmlhIEdQVVZNIG9yCisgKiBhY2Nlc3NpbmcgaXQgd2l0aCB2
YXJpb3VzIGh3IGJsb2NrcworICovCisjZGVmaW5lIEFNREdQVV9HRU1fQ1JFQVRFX0VOQ1JZUFRF
RAkJKDEgPDwgMTApCiAKIHN0cnVjdCBkcm1fYW1kZ3B1X2dlbV9jcmVhdGVfaW4gIHsKIAkvKiog
dGhlIHJlcXVlc3RlZCBtZW1vcnkgc2l6ZSAqLwotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
