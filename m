Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB81C56278
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 08:40:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B49F86E28E;
	Wed, 26 Jun 2019 06:40:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800075.outbound.protection.outlook.com [40.107.80.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A2256E28C;
 Wed, 26 Jun 2019 06:40:19 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3835.namprd12.prod.outlook.com (10.255.173.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Wed, 26 Jun 2019 06:40:16 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480%2]) with mapi id 15.20.2008.017; Wed, 26 Jun 2019
 06:40:16 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/1] drm/ttm: return -EBUSY if waiting for busy BO fails
Thread-Topic: [PATCH 1/1] drm/ttm: return -EBUSY if waiting for busy BO fails
Thread-Index: AQHVK+oDNe/OvjJJB0qJniNoSHCIOQ==
Date: Wed, 26 Jun 2019 06:40:16 +0000
Message-ID: <20190626063958.19941-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YTXPR0101CA0064.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::41) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3d3717ba-9eb6-4a1c-5f49-08d6fa0125e8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3835; 
x-ms-traffictypediagnostic: DM6PR12MB3835:
x-microsoft-antispam-prvs: <DM6PR12MB3835F1014B17605BB504123492E20@DM6PR12MB3835.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-forefront-prvs: 00808B16F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(376002)(396003)(346002)(136003)(39860400002)(199004)(189003)(71190400001)(81156014)(6512007)(36756003)(8936002)(53936002)(7736002)(305945005)(256004)(8676002)(52116002)(81166006)(386003)(99286004)(6506007)(6116002)(14444005)(26005)(5660300002)(3846002)(6486002)(6436002)(68736007)(50226002)(450100002)(54906003)(110136005)(2616005)(316002)(2906002)(25786009)(4326008)(1076003)(64756008)(14454004)(73956011)(66556008)(66946007)(66476007)(66446008)(102836004)(486006)(186003)(4744005)(72206003)(478600001)(66066001)(71200400001)(86362001)(2501003)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3835;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0y1edPcHZaKBIA53pmKmO34qRs7uvV68auJCcynF7WHO3zl+sQUWuIsKW1du1XiipE/WFbP0AqYMlDlFx3Vb8HW8eTNiB5HNDzR3s9GhPMFxRSUnwGV9QBL+2NLAou3htU4gpPMP6ZbLW9YELbjC2rLSZdiXddZOvHFxW9EcC28Z+Sa2mzsrIuouqjwGH54YE2p7pKEPKIXCzFo4FMxnUke+UqW7xsIEuEFq4VpmKl34Jc+oa0fCZU0eWU/0m15aHHhcLii/VECm76dVPlMAEjyJr6cjLPhI70Qf84Ymw2Sk38d/p1Hh5v5PED2+VX4aJKASa2mQb9/pBwkhL0kd+sSHhDhpbJEeQMpJENqXxty+v+271fPGwXUSYe2K+Cw9+bwWG6PtHXDFfEgKdAQKfPNjubatquZgMTdDbBZ/Fpk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d3717ba-9eb6-4a1c-5f49-08d6fa0125e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2019 06:40:16.6125 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3835
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cm3oxMYUbXfaZLo3FWcvWpAooS9rBkBF5NLC4QXxN2Y=;
 b=qohTNFEzTda8OlzTXVnYo1An1e/lHbwDuGknlYoh5kqdQhop03fDn8NmQPSoNmrVC/NWV3v9Ge/IV1Ozd5XQOSHD1GGZG2YuvDXg6u/5wHYg39DFwoMNFTKPYqkfEMu3oWZmhFPYhoYBTwbH7bwcLPNuVzVQ0l80F4wiHtUK7ak=
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV0dXJuaW5nIC1FQUdBSU4gcHJldmVudHMgdHRtX2JvX21lbV9zcGFjZSBmcm9tIHRyeWluZyBh
bHRlcm5hdGUNCnBsYWNlbWVudHMgYW5kIGNhbiBsZWFkIHRvIGxpdmUtbG9ja3MgaW4gYW1kZ3B1
X2NzLCByZXRyeWluZw0KaW5kZWZpbml0ZWx5IGFuZCBuZXZlciBzdWNjZWVkaW5nLg0KDQpGaXhl
czogY2ZjYzUyZTQ3N2U0ICgiZHJtL3R0bTogZml4IGJ1c3kgbWVtb3J5IHRvIGZhaWwgb3RoZXIg
dXNlciB2MTAiKQ0KQ0M6IENocmlzdGlhbiBLb2VuaWcgPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNv
bT4NClNpZ25lZC1vZmYtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29t
Pg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyB8IDIgKy0NCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jDQpp
bmRleCBjN2RlNjY3ZDQ4MmEuLjU4YzQwM2VkYTA0ZSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1
L2RybS90dG0vdHRtX2JvLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMNCkBA
IC04MjcsNyArODI3LDcgQEAgc3RhdGljIGludCB0dG1fbWVtX2V2aWN0X3dhaXRfYnVzeShzdHJ1
Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJ1c3lfYm8sDQogCWlmICghcikNCiAJCXJlc2VydmF0aW9u
X29iamVjdF91bmxvY2soYnVzeV9iby0+cmVzdik7DQogDQotCXJldHVybiByID09IC1FREVBRExL
ID8gLUVBR0FJTiA6IHI7DQorCXJldHVybiByID09IC1FREVBRExLID8gLUVCVVNZIDogcjsNCiB9
DQogDQogc3RhdGljIGludCB0dG1fbWVtX2V2aWN0X2ZpcnN0KHN0cnVjdCB0dG1fYm9fZGV2aWNl
ICpiZGV2LA0KLS0gDQoyLjE3LjENCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
