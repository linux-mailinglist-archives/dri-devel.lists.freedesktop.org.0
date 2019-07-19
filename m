Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2BE6EC57
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jul 2019 00:02:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E84286E870;
	Fri, 19 Jul 2019 22:02:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740045.outbound.protection.outlook.com [40.107.74.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB7EF6E86C;
 Fri, 19 Jul 2019 22:02:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Enfo9SPFxpOicGZxvaYDaO94SmJtQE9FXFL6EuoJRJHz/85gKDx/RKYbrQ8i49Vijf9NlesNtJI91A25bkHzOEglKPeVKRqR+CBlXqb///0vWMIB8NG8Vzybv2dgP1pHjMouDH0N01SeE2JDd6gtDmGqWkoWItzHH91dqYJYox2KgkBXorcfcTjA9+Hp8fHA89qltF9TrQHeRUj80H38+FHrjhqU4ag7X9hK4QHZc2ITgwcW4hJbxu/S0XhnqrTTDxU4ZhB3KlO9B8xcWAHzJBX8ilOD77Bitysf7YxdQ0JnMdAJ1f9rECW92TNZS1NjOCvlImSzL/HBhzAVjPTjww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYz163Iy4mzaY2gFboYtP1ZoRqm4ctg7xFA9N5x/UPo=;
 b=Hu0CNoSan3NN8IKDLpn2HHE4N5jp8U804aEtIKOE1bhsSYyl4GU0TWoIM2IYFAL1fYNbvO4ooBBwlKIAUrflkac08NPDWyAwfjT/JtK1z8GDPmyAceVHxSQvU5hszIwDHkA2kWDLHif79+/hlmAmWhqTT+Vq+LEMrkuMzvoSe+YVmq4saSaH35kT5E1Euh/jgev0DxsZaMXtAeM3ZS/yk41YbHF12ppq2jIp3iYJPsdjduG1pSpKdxw+HiXdKOgsxaFN5wME+zrfs4lGr2oBFyVB1bnI8tYbTG/oya5NQc9NiskoWZ6hpcShWDuKv65ORbFA7GQzp+FFP+XUfgfCvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3915.namprd12.prod.outlook.com (10.255.174.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.15; Fri, 19 Jul 2019 22:02:05 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927%7]) with mapi id 15.20.2073.012; Fri, 19 Jul 2019
 22:02:05 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/4] drm/amdgpu: Mark KFD VRAM allocations for wipe on release
Thread-Topic: [PATCH 2/4] drm/amdgpu: Mark KFD VRAM allocations for wipe on
 release
Thread-Index: AQHVPn2ZHovwIJLpEk6qAugRNCow1Q==
Date: Fri, 19 Jul 2019 22:02:04 +0000
Message-ID: <20190719220140.18968-2-Felix.Kuehling@amd.com>
References: <20190719220140.18968-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190719220140.18968-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YTXPR0101CA0061.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::38) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b7c8f80c-424f-4a46-435f-08d70c94bbef
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3915; 
x-ms-traffictypediagnostic: DM6PR12MB3915:
x-microsoft-antispam-prvs: <DM6PR12MB391535545CDB8B3A0C60241A92CB0@DM6PR12MB3915.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(396003)(346002)(376002)(366004)(189003)(199004)(66446008)(66556008)(66476007)(66946007)(5660300002)(66066001)(64756008)(478600001)(53936002)(25786009)(7736002)(305945005)(256004)(14444005)(6436002)(486006)(86362001)(6486002)(52116002)(76176011)(450100002)(476003)(50226002)(68736007)(186003)(8676002)(2616005)(1076003)(14454004)(6506007)(102836004)(11346002)(446003)(2906002)(99286004)(2501003)(386003)(36756003)(71200400001)(71190400001)(6512007)(26005)(81156014)(6116002)(3846002)(8936002)(110136005)(81166006)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3915;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Gj9wpxyOML5g9GwdZ4X5l/qYfnHuhcTnOxP/JiHIc6nvrNj6ztbPyBM+4cbNGjuhYTkCxDJBoX4vmOFzpCvRE3v7HN1aLwSfKb7Fgj0XDrCkxNNUa29IIBWlDi/dZIW0G9FHVvuYwyrfEozjSL3ezLoEvXLM0gPbnbbSOUplbqUtAG8bsvsaJEuDYahYVwFLE7hcUAudcGbtNtxiSZhdO/oY9FJ9fcLkJL41OSaiTqh2cvEaAQgnD/hp0q6Oln50I5RNIjsDaSHYpFx6C1jVmFQzED4qBxjwxlKwPA40DqBkrRmuLWMaTa6qqxFM3c1LemaL8hn4l2YLsZTqWZyXmm5zfNMu7SVgEKcqp/zQ/C0p4Db1jadeQnHUOTwn/vKDdGD7gupDOVMbl8pfsLllg3PkAryafal2U3DDZAUWrVE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7c8f80c-424f-4a46-435f-08d70c94bbef
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 22:02:04.7055 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3915
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYz163Iy4mzaY2gFboYtP1ZoRqm4ctg7xFA9N5x/UPo=;
 b=DgUpZrXVeEJHwuFs0Ga7MXD7bd90tBkB5O6Qkci6Cj6wzlUgVtLR9Ty4U0jNz+/W0QToSerxEUOrEi96C5JOmKsD+Khk4fr5sSaG1OaQBPYh1r+t3v1kjj8WhPeebLhtPQKBjQtVGfSCvGgHoVCx9bq7G2Mav7FlduEP0UKWPvU=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TWVtb3J5IHVzZWQgYnkgS0ZEIGFwcGxpY2F0aW9ucyBjYW4gY29udGFpbiBzZW5zaXRpdmUgaW5m
b3JtYXRpb24gdGhhdApzaG91bGQgbm90IGJlIGxlYWtlZCB0byBvdGhlciBwcm9jZXNzZXMuIFRo
ZSBjdXJyZW50IGFwcHJvYWNoIHRvIHByZXZlbnQKbGVha3MgaXMgdG8gY2xlYXIgVlJBTSBhdCBh
bGxvY2F0aW9uIHRpbWUuIFRoaXMgaXMgbm90IGVmZmVjdGl2ZSBiZWNhdXNlCm1lbW9yeSBjYW4g
YmUgcmV1c2VkIGluIG90aGVyIHdheXMgd2l0aG91dCBiZWluZyBjbGVhcmVkLiBTeW5jaHJvbm91
c2x5CmNsZWFyaW5nIG1lbW9yeSBvbiB0aGUgYWxsb2NhdGlvbiBwYXRoIGFsc28gY2FycmllcyBh
IHNpZ25pZmljYW50CnBlcmZvcm1hbmNlIHBlbmFsdHkuCgpTdG9wIGNsZWFyaW5nIG1lbW9yeSBh
dCBhbGxvY2F0aW9uIHRpbWUuIEluc3RlYWQgbWFyayB0aGUgbWVtb3J5IGZvcgp3aXBlIG9uIHJl
bGVhc2UuCgpTaWduZWQtb2ZmLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1k
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZt
LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dw
dXZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMK
aW5kZXggZjVlY2YyOGViMzdjLi4yZGI2ZTQ5OGMwNjkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMKQEAgLTEwODksNyArMTA4OSw3IEBA
IGludCBhbWRncHVfYW1ka2ZkX2dwdXZtX2FsbG9jX21lbW9yeV9vZl9ncHUoCiAJICovCiAJaWYg
KGZsYWdzICYgQUxMT0NfTUVNX0ZMQUdTX1ZSQU0pIHsKIAkJZG9tYWluID0gYWxsb2NfZG9tYWlu
ID0gQU1ER1BVX0dFTV9ET01BSU5fVlJBTTsKLQkJYWxsb2NfZmxhZ3MgPSBBTURHUFVfR0VNX0NS
RUFURV9WUkFNX0NMRUFSRUQ7CisJCWFsbG9jX2ZsYWdzID0gQU1ER1BVX0dFTV9DUkVBVEVfVlJB
TV9XSVBFX09OX1JFTEVBU0U7CiAJCWFsbG9jX2ZsYWdzIHw9IChmbGFncyAmIEFMTE9DX01FTV9G
TEFHU19QVUJMSUMpID8KIAkJCUFNREdQVV9HRU1fQ1JFQVRFX0NQVV9BQ0NFU1NfUkVRVUlSRUQg
OgogCQkJQU1ER1BVX0dFTV9DUkVBVEVfTk9fQ1BVX0FDQ0VTUzsKLS0gCjIuMTcuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
