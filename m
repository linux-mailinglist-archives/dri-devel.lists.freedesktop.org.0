Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5E1AFBD2
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 13:50:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92E6B6EA9E;
	Wed, 11 Sep 2019 11:50:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-bl2nam02on0600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe46::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B78E6EA9F;
 Wed, 11 Sep 2019 11:50:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R/OUOrNJuq8+mmucOTKDaYx6VnZZQQqIMn1sPIwkMj5jdfwu/9UQj1IQUowxcwvTyYdZmJy90YDD0NfwrvYKP+dPnznyP7GpuATGWP4EgEszKVDwSqfmOU45qGh9Y5ILppc5oBGiUzxQkPjYX8xBkYq0Gt5L0jD7HyUIMFZ7IhytuLlNbhujfQSbsuBjQ8shrHPYRmJoNmgsQeZ3JOQjbNaNo15qZI4Qo5RNoZOEFa3Ve9i7CZqMPhVR5SDnshaNtJ4lBbzPVNBdou5Tewpc5ggQeucIJl2m7DlJm4cVyP7k0kjUGHNPqEPsBOnH5UYxbZIOLS+FSoXiXOYHCk/4Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tk7TfjXhdSzKCsW/N/u3FOvs26+TdhdULz4alZknL5A=;
 b=HHAzRB7CNeHJ86Dwp7Rv9xjswYghXToL5i0jQN1QP7XTKInpgC7OQZ3McUSO2LzyjqpJwq5Z1M0N78GOlGOBI9H2Cp8ng0EbDYbVDeizBX7HxAME9XEc/tlBL7KhAA939rJG20zmMC6ISE/cfb8qZPBlvZ0jz/A9fd2SMFQgBDD5DJc8zHjvcVsWUxTp/IbawUoc3CuAfwyqK2csHvALRfdPaU3S2rso7iKv5XM7viSX6CRD3/zvdj635+Hgmo7E5HPqlIu3jnJgt5bPs4mu779OJWQH3u9850YSlB8WZTwkXKKE4qGrS+/87gATYgCe/1qGKOi2W7Ulvo2dPZz6DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB3421.namprd12.prod.outlook.com (20.178.243.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Wed, 11 Sep 2019 11:50:12 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d%4]) with mapi id 15.20.2241.022; Wed, 11 Sep 2019
 11:50:12 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: [PATCH 03/14] drm/amdgpu: define the TMZ bit for the PTE
Thread-Topic: [PATCH 03/14] drm/amdgpu: define the TMZ bit for the PTE
Thread-Index: AQHVaJcRtV99cj/r802P5gWU7xY4vw==
Date: Wed, 11 Sep 2019 11:50:12 +0000
Message-ID: <1568202584-14471-4-git-send-email-ray.huang@amd.com>
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
x-ms-office365-filtering-correlation-id: 9038e117-dfb3-4a67-3866-08d736ae33d6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3421; 
x-ms-traffictypediagnostic: MN2PR12MB3421:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3421410A62F54E4BAA67BF1CECB10@MN2PR12MB3421.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(136003)(376002)(366004)(199004)(189003)(6436002)(4326008)(25786009)(450100002)(6486002)(486006)(11346002)(446003)(2616005)(305945005)(7736002)(50226002)(8936002)(316002)(110136005)(54906003)(8676002)(6116002)(3846002)(2906002)(81166006)(81156014)(36756003)(14454004)(71190400001)(71200400001)(86362001)(66446008)(478600001)(66476007)(64756008)(66556008)(66946007)(4744005)(256004)(99286004)(53936002)(5660300002)(76176011)(52116002)(6512007)(6636002)(386003)(6506007)(66066001)(102836004)(26005)(186003)(476003)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3421;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: opNVfnPdhy6iGotlbjksFJiwSAlTjb+Tt4xMGWgHu+rwPoCpYMGS7HTs2VNAFGXU5whWM5NctiFds8dpVL54fK6oEzJQEugy10aHpwWhM0Hjj83KPrp4gw4sWmC62qXXLYG41mph8RmYR6Pbnd0bk6Jqmp+VlHyyByBkFIpEvQYR0rPczUzs/lPvOQKFm7xkn0QORQz4sVa6IldKOtCA4mYVYGNUbPdwtXwhffOHtc5Z97+sZgtv9zppby8m7sueb04Z3m2j8QNRQNx4ssKvsvGBYHUtfseRQyLnRLrF9msIOqjLgGmLOfmNgoNt70gpNsjH4kg4kVF2zQmwjt9I5yR5Ckx76r7gPGzJUn8P07zoOjW7J2oiaIqRZEahPCFrv/qV7MiSjrRlyJqYt/aVeDB6i4uQhj2xXcbm4Rnf+88=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9038e117-dfb3-4a67-3866-08d736ae33d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 11:50:12.2888 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NV9MLCL7gajWHsuPljKqWTmgYHcY20EYolPrjLtUkkazdgqN9bb9OJ+U00vsuSoucAZIE0nsXujcSiFX2M2/fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3421
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tk7TfjXhdSzKCsW/N/u3FOvs26+TdhdULz4alZknL5A=;
 b=l9dHFOUwLN6VMJK3mfHb7SXCm63ajOm6zdmCupWuBehp0ZXZrUpKpaAoj40GkjO8Q7rSU/Xlcwyn0TDoQiJS9W/mlghXIOrKIKddGeMUUTQuXDUhcq+XvOxhkP+GQHFpTlkIqSeyN62MSje1pzKwaTHHk9GvqKtQvrslA0OiP74=
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
