Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9718CBDF42
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 15:45:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50E276EBB4;
	Wed, 25 Sep 2019 13:45:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730043.outbound.protection.outlook.com [40.107.73.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39C5E6EBB4;
 Wed, 25 Sep 2019 13:45:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A/gDGN1erXgNcsXsZHg7Hp+fTDE8sXDmwsr7/gW7G7XP0uNyAdxk2sGnRwOsOl1kO6DzDg8ixnHOBz9B69mj18PqVtjhGxGZESsb+/WZCFnevN1qjrGggQcjvnEFCD/6BqoOLSnRar9lt6hPbe0vq4q89tuvpU7AVzbayoKdtybzaM0ZsYcn4yfUyp3rhV9ILIu2IR3t2JOUgIJjauXBe8DefVtIHRm7EtbSVCM2Qy9tRDU6XZVAyJ7xJbHmQ5FlAHv5eq5V7blh1/T4Ckiq4Hp3nCN31o3x8exvAmWyXa5TuHnUGUb1bZOk2lXOFWeDBibfTwYPxdJfU6lwISpbmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y7C/RC5RtGVLy8OJkRfIh2NRaO3HbeXqIYNBFA5Npi8=;
 b=UblH5xeGNl5jfeNXBoXqUhjQDGI05uLfn5u+PRjPWtOM1kqwiCBnbGceuS9vdtQMDsaGSTVsPyVlLDsd3m8XS2h55bnqW+L20Dm0QYVOiPxh+FPSDhcF0quhgmr4efvZsUosVXTedXkCPXGIKfvw8WBnATFNprquoCBzjh6sRxC392xZIEObVnxqfq32bUiRAnv6/7aeke1j6UN8DQ0Yo/BUdxufcDnezkoSooP4NcQ3KrPQnkuKUDjwJ5stwF/Jb6lf+0hYtGafZvvgR933f+5RIJf9FV3rZPGMECQpVK52rEL3QnGihxZgV1lxI1IF54xCLUB53gDJhMO0q4Sa1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB4304.namprd12.prod.outlook.com (10.255.224.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Wed, 25 Sep 2019 13:45:14 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d%4]) with mapi id 15.20.2305.016; Wed, 25 Sep 2019
 13:45:14 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: [PATCH v2 02/11] drm/amdgpu: add UAPI to create secure commands (v3)
Thread-Topic: [PATCH v2 02/11] drm/amdgpu: add UAPI to create secure commands
 (v3)
Thread-Index: AQHVc6d1rU9yy3AEaEGVypePID0RsQ==
Date: Wed, 25 Sep 2019 13:45:14 +0000
Message-ID: <1569419090-5304-3-git-send-email-ray.huang@amd.com>
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
x-ms-office365-filtering-correlation-id: 62d174fe-a5bf-45e4-5dc5-08d741be97e7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB4304; 
x-ms-traffictypediagnostic: MN2PR12MB4304:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4304F8E658A2EDBD8390BBD2EC870@MN2PR12MB4304.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01713B2841
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(376002)(346002)(396003)(366004)(189003)(199004)(86362001)(8936002)(305945005)(2501003)(50226002)(6636002)(14444005)(256004)(6486002)(6116002)(3846002)(6436002)(6512007)(2906002)(4326008)(66066001)(102836004)(26005)(186003)(52116002)(76176011)(486006)(476003)(2616005)(11346002)(66946007)(66476007)(66556008)(64756008)(66446008)(446003)(99286004)(5660300002)(81156014)(6506007)(81166006)(450100002)(25786009)(36756003)(316002)(478600001)(386003)(8676002)(71190400001)(71200400001)(110136005)(54906003)(7736002)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4304;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RnQ0PpLk9Z+uAy6J0J/MPTQkmxrkvjCJ9gjVcXth3AGqV6YbPxciYFJx/l0nRFxIxa2hqSOJJ4JmMgt/N2GXlL890hKL3dzGgzQRKQyrgtrxV9tELn8O8tLw/LaG/HJFy12Txa9WpwHHV3y9GF2oKTcIMqqsYZA9+sf7vWabPy/Q+BH7YK+Ao8AxHB3OvqUGYNiQvFRXndC3tMVRNcfOf5nDKAAzooARUY8aU0zAdTTHNiXf3lVaIWu85ak8bdPUk3oIcJDWGjxvoEH7Md2InqLXUJWn+jTRkWRuercXjhRLsJm4LNK9B+1QLAM9xmYgRMBLTA/zb5ZIiXduVCUC2vhXPw8dMT3qIhxoYD6thay59RFEyfXNgsx2ZDEA9DUPPKlvVzwVL+PqlWvAncNNwqDWSbvYj3n7kytQ8wZgAYs=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62d174fe-a5bf-45e4-5dc5-08d741be97e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2019 13:45:14.7516 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TvNJYUgWLWNWMz4EAAe0+VMYodoLorxkd+XNRzrOXfFAXPxvAYW1qg+uIUc2+qlWRuEGu9Ywr6MYRVyTPJpFDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4304
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y7C/RC5RtGVLy8OJkRfIh2NRaO3HbeXqIYNBFA5Npi8=;
 b=1af7G7r4zHXuC67L9qXXj71tQhACmS1Mws/mEPHJGxebd2DPwdctw1xTpNaBqYDPAdowpMs65FiyIKyc4naoaZbJkWV/cAuhibege4KvJva5nhJqA17+VhvcmVZrkIzP4aW0wmmdS6Ab0gSPudwxlVRgKtGUzDakO96sn1G7wcE=
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

RnJvbTogTHViZW4gVHVpa292IDxsdWJlbi50dWlrb3ZAYW1kLmNvbT4KCkFkZCBhIGZsYWcgdG8g
dGhlIGNvbW1hbmQgc3VibWlzc2lvbiBJT0NUTApzdHJ1Y3R1cmUgd2hpY2ggd2hlbiBwcmVzZW50
IGluZGljYXRlcyB0aGF0IHRoaXMKY29tbWFuZCBzdWJtaXNzaW9uIHNob3VsZCBiZSB0cmVhdGVk
IGFzCnNlY3VyZS4gVGhlIGtlcm5lbCBkcml2ZXIgdXNlcyB0aGlzIGZsYWcgdG8KZGV0ZXJtaW5l
IHdoZXRoZXIgdGhlIGVuZ2luZSBzaG91bGQgYmUKdHJhbnNpdGlvbmVkIHRvIHNlY3VyZSBvciB1
bnNlY3VyZSwgb3IgdGhlIHdvcmsKY2FuIGJlIHN1Ym1pdHRlZCB0byBhIHNlY3VyZSBxdWV1ZSBk
ZXBlbmRpbmcgb24KdGhlIElQLgoKdjM6IHRoZSBmbGFnIGlzIG5vdyBhdCBjb21tYW5kIHN1Ym1p
c3Npb24gSU9DVEwKClNpZ25lZC1vZmYtYnk6IEx1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFt
ZC5jb20+ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+Ci0tLQogaW5jbHVkZS91YXBpL2RybS9hbWRncHVfZHJtLmggfCA1ICsrKystCiAxIGZpbGUg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvaW5j
bHVkZS91YXBpL2RybS9hbWRncHVfZHJtLmggYi9pbmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0u
aAppbmRleCBmOTBiNDUzLi5hMTAxZWVhIDEwMDY0NAotLS0gYS9pbmNsdWRlL3VhcGkvZHJtL2Ft
ZGdwdV9kcm0uaAorKysgYi9pbmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0uaApAQCAtMjA3LDYg
KzIwNyw5IEBAIHVuaW9uIGRybV9hbWRncHVfYm9fbGlzdCB7CiAjZGVmaW5lIEFNREdQVV9DVFhf
T1BfUVVFUllfU1RBVEUJMwogI2RlZmluZSBBTURHUFVfQ1RYX09QX1FVRVJZX1NUQVRFMgk0CiAK
Ky8qIEZsYWcgdGhlIGNvbW1hbmQgc3VibWlzc2lvbiBhcyBzZWN1cmUgKi8KKyNkZWZpbmUgQU1E
R1BVX0NTX0ZMQUdTX1NFQ1VSRSAgICAgICAgICAoMSA8PCAwKQorCiAvKiBHUFUgcmVzZXQgc3Rh
dHVzICovCiAjZGVmaW5lIEFNREdQVV9DVFhfTk9fUkVTRVQJCTAKIC8qIHRoaXMgdGhlIGNvbnRl
eHQgY2F1c2VkIGl0ICovCkBAIC01NjIsNyArNTY1LDcgQEAgc3RydWN0IGRybV9hbWRncHVfY3Nf
aW4gewogCS8qKiAgSGFuZGxlIG9mIHJlc291cmNlIGxpc3QgYXNzb2NpYXRlZCB3aXRoIENTICov
CiAJX191MzIJCWJvX2xpc3RfaGFuZGxlOwogCV9fdTMyCQludW1fY2h1bmtzOwotCV9fdTMyCQlf
cGFkOworCV9fdTMyCQlmbGFnczsKIAkvKiogdGhpcyBwb2ludHMgdG8gX191NjQgKiB3aGljaCBw
b2ludCB0byBjcyBjaHVua3MgKi8KIAlfX3U2NAkJY2h1bmtzOwogfTsKLS0gCjIuNy40CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
