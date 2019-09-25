Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBC0BDF4B
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 15:45:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 246766EBBD;
	Wed, 25 Sep 2019 13:45:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam05on0613.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe51::613])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDB9E6EBB5;
 Wed, 25 Sep 2019 13:45:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TyasxYAb+peSYnTVOAQ/t9XPUNLLMmy4EGN0GQXrNLCLe7u/IGubaXLfm67CWNG8B0jJ5IwWwYTobUoqPwQrDGLmwoSDU8sCl/V5inE/rJuaxmwi8+9P0UPhYSKcDCKUUuf3r8jFRthUu7G1wLg43DE864thQBff+bVNo+TJHp8T6mGh2woyZPBQRM7ktdEXJEMXcxlFtOzbR6h9LIMGUpN4WJp2Jlj4ItF7jgy08NZmyaNAb6rqr+xsfBsRPps4/P17D2R6dgirLAfxc8IRUTnoNtBSneSrZrpgGDrGUKtucb8q9OwbSgOHk3HRqFg/n6U8CJPqFC61Ys53lzFnNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tk7TfjXhdSzKCsW/N/u3FOvs26+TdhdULz4alZknL5A=;
 b=XqtQAcQ/0QhKZ57d4bTzWGAdk144t2Bvn0lHGm3WD3l/h9pyTCwJQusXFsVcpbQfKNO1FNpqNUSj+zmtlqq7K9v96jGnmPT3XxSlYre7qgBS+bvTCgJzeNhn95FTL5cnKGMCKUpzo9riR9pyzgNmy4tdhPplt5Q3GRgnpApTp2uLHTFTnP5L++EGRyPP3dat9E6Si4jvV8Au0XuoL11no+8V4JLJcr4hX6n+npEuhQscUSe+jQr8Xf4pxnjg9D6dZ8buTHVqEGhc2jm/UULcaNUKA3VwpxO2L+cKXpDE4kAADl5xph1ZWRXfrxm3OZvAgXUc4nydOemgCIDvMUaieg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB4304.namprd12.prod.outlook.com (10.255.224.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Wed, 25 Sep 2019 13:45:18 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d%4]) with mapi id 15.20.2305.016; Wed, 25 Sep 2019
 13:45:18 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: [PATCH v2 03/11] drm/amdgpu: define the TMZ bit for the PTE
Thread-Topic: [PATCH v2 03/11] drm/amdgpu: define the TMZ bit for the PTE
Thread-Index: AQHVc6d3mr4p1eZadEKDwG2eAv3bYw==
Date: Wed, 25 Sep 2019 13:45:18 +0000
Message-ID: <1569419090-5304-4-git-send-email-ray.huang@amd.com>
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
x-ms-office365-filtering-correlation-id: a80ff704-0b56-40fd-5af9-08d741be99bf
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB4304; 
x-ms-traffictypediagnostic: MN2PR12MB4304:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4304E34116A34670BC885689EC870@MN2PR12MB4304.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 01713B2841
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(376002)(346002)(396003)(366004)(189003)(199004)(86362001)(8936002)(305945005)(2501003)(50226002)(6636002)(256004)(6486002)(6116002)(3846002)(6436002)(6512007)(2906002)(4326008)(66066001)(102836004)(26005)(186003)(52116002)(76176011)(486006)(476003)(2616005)(11346002)(66946007)(66476007)(66556008)(64756008)(66446008)(446003)(99286004)(5660300002)(81156014)(6506007)(81166006)(450100002)(25786009)(36756003)(316002)(478600001)(386003)(8676002)(71190400001)(71200400001)(110136005)(54906003)(7736002)(4744005)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4304;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: TbJjNoseS5QMzpIy294OcTl65Sb0SCUH2d/B+mbAEER4CsE+r/mfTc2lv18uWHsl+hBVAmvoVkH6YYv3i6mGWbTM+rLeKi724bUHj0zYoYBAMKvTIthmtC21fo6mLGbVyNRiN/Zirdse+xyFijoDremkC9VEA7pZOKxy8cNHr9pnS10spEFK7ftgsn33vLvpsRPKgFcrFwrzEVpNkJFREZt+Tvi566MgxRFMrIUo08bboQCUGUPCJHmjPyqZ2YMM5a0SoQgUIsMevyXVvLMwK9bgEWsFd7GoYWmtdVNC3p0f8DAsf9OHP6px26FEUeN/GcisWJJYoaU+Y2KC6zJPfHX674ks+TrYJ95+Kef9NuQk2kG0WJHjEDMk+iHxnr4Z78QK6LXYWk7uGwWoq669xTFCxkr3ufo5bKHmlAPpAbc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a80ff704-0b56-40fd-5af9-08d741be99bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2019 13:45:18.1297 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZpCbReaeIAz0ngkv7r5d7w/9uLCwo4wPXa4ydpNzJVA5NgE7nwfgQ2z62Mmx5tBtkgyWXBx0LC4z5MN3Qj67uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4304
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tk7TfjXhdSzKCsW/N/u3FOvs26+TdhdULz4alZknL5A=;
 b=JLD9OVN/gKyR/kQMn1E2rrfhur/MkgDGuc5j+MXq1GXK32TGmyzN7OXwNncniO2t8k75vzRhgBcyFuMsDW2p25uRDXPfw0XMwMYirfXQwhpySQWaqBxs2N0V6hRLyrPaQrrq2GqEMi/HHBpcVs5hZlPsqcQLvBs0XfOmOZYdwj8=
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

RnJvbTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgoKRGVmaW5lIHRo
ZSBUTVogKGVuY3J5cHRpb24pIGJpdCBpbiB0aGUgcGFnZSB0YWJsZSBlbnRyeSAoUFRFKSBmb3IK
UmF2ZW4gYW5kIG5ld2VyIGFzaWNzLgoKU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4
YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpSZXZpZXdlZC1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdA
YW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uaCB8IDMg
KysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdm0uaAppbmRleCAzMzUyYTg3Li40YjVkMjgzIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uaAorKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdm0uaApAQCAtNTMsNiArNTMsOSBAQCBzdHJ1Y3QgYW1kZ3B1X2Jv
X2xpc3RfZW50cnk7CiAjZGVmaW5lIEFNREdQVV9QVEVfU1lTVEVNCSgxVUxMIDw8IDEpCiAjZGVm
aW5lIEFNREdQVV9QVEVfU05PT1BFRAkoMVVMTCA8PCAyKQogCisvKiBSVisgKi8KKyNkZWZpbmUg
QU1ER1BVX1BURV9UTVoJCSgxVUxMIDw8IDMpCisKIC8qIFZJIG9ubHkgKi8KICNkZWZpbmUgQU1E
R1BVX1BURV9FWEVDVVRBQkxFCSgxVUxMIDw8IDQpCiAKLS0gCjIuNy40CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
