Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B08AFBD0
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 13:50:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 091366EA9B;
	Wed, 11 Sep 2019 11:50:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780071.outbound.protection.outlook.com [40.107.78.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90BAE6EA9B;
 Wed, 11 Sep 2019 11:50:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DCljYs9hpi7Lc/9I30lDhCmBdZ4M4yIQn2NIG+GWjP0VperTgqcxFAKxmwkiXI+7uh3JTdYRNggsOjktpHjp1xrba/zqsSgc/4fHcrmGPig3X8LefczutRoAF7LcnVDhWtbrDunAbd+d+MSIWNfDhVLjgk543LZNyjFtLOynW/NIhohUpL7JQeEP/yD3H+sS7t82f0hrGA/4qiMb1obvbFKxIHxOuX3EDkRYDw+BkKgmATEacViVvZQ8RMUb9j8Yk+FheaMMiMWYo7tldZ2deUkOub9IeqECtOMl3feyB6AvHCnpNUb38WVlyeUG+QNMqSPydMfYCpAuG/pF8nZI9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ffvk3WQ09O9v9NZaptXduozW8pGuCR4nhOmuEN0sgE0=;
 b=K5SrpWRBI4ZOAH2QhHUO/pe543+1hVON0SPCWZyqaD/CMjN0rbPTx/OQ/JjazyEaqculJ+GiGrqQCTJAmcAMKryAgL1+02ys9r1komTy2M0uohBnxSVMhSDEnhCKU1hj39W5Cyl2U0f88v22ja5y47xRyoFx57w50GFJGYPSA+TE2F1BYD/mLhkHL6aBLly2VoOCN0kJ6zBW3kV20J/b9KjvWxPpYP1KrhRM6lwgdstloirheCNNbG4rhSkNnfGtGj412eWBuKbKsNqBsCWW75HEYE6PtjfvcjXZneWZpsHK+471FD/KZcPWek0pMX1gJYPo07QPqLFlZp2nCXYicw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB3421.namprd12.prod.outlook.com (20.178.243.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Wed, 11 Sep 2019 11:50:09 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d%4]) with mapi id 15.20.2241.022; Wed, 11 Sep 2019
 11:50:09 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: [PATCH 02/14] drm/amdgpu: add UAPI for creating secure contexts (v2)
Thread-Topic: [PATCH 02/14] drm/amdgpu: add UAPI for creating secure contexts
 (v2)
Thread-Index: AQHVaJcPwStaRl5VfkqOECu+8hnhdw==
Date: Wed, 11 Sep 2019 11:50:08 +0000
Message-ID: <1568202584-14471-3-git-send-email-ray.huang@amd.com>
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
x-ms-office365-filtering-correlation-id: 39234c2f-802a-4982-1845-08d736ae31d8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3421; 
x-ms-traffictypediagnostic: MN2PR12MB3421:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB34210BC061E9ED7B836D8550ECB10@MN2PR12MB3421.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(136003)(376002)(366004)(199004)(189003)(6436002)(4326008)(25786009)(450100002)(6486002)(486006)(11346002)(446003)(2616005)(305945005)(7736002)(50226002)(8936002)(316002)(110136005)(54906003)(8676002)(6116002)(3846002)(2906002)(81166006)(81156014)(36756003)(14454004)(71190400001)(71200400001)(86362001)(66446008)(478600001)(66476007)(64756008)(66556008)(66946007)(14444005)(256004)(99286004)(53936002)(5660300002)(76176011)(52116002)(6512007)(6636002)(386003)(6506007)(66066001)(102836004)(26005)(186003)(476003)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3421;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0Q8bHScoPQEVFxkgmnLTXjiDuJB1kGlD9H626SbtcE8uNszABksjbr6ywmxgRg8QhkDrxuCdfqbdmwG0ADurBOL3OdE/vHoK1r9N0hW2XghQr8WXySklkNbeeD1BJnUztfY74fUVYuRGhBs1Uu6SNufdZ0uThJ39Bc0ViRRZk4fTvn50R6vSQ9uOrga0h6HO1SMq2B/30FEp3WZA1y5c4VfWZi+0AUp8LiQ41XnD4fvuEwNDbgmVxhABfUIU/0AiBAammSb0jlXAzvA9UsaqQYb63CYFsWoyFGt2eNhi6gNSKNvX4F5J9IOSpih/kgyotsop21dxamCPENcXlqiQxboLJd5OqqFvZYOFxlWg8h1ohDEzJpIFcXz2IhlS5641AzxFxbPoeCPwRymvMiRSV0G/+B9VdmxliMIZN567bos=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39234c2f-802a-4982-1845-08d736ae31d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 11:50:08.9396 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K6GcS4vEX2hjB1UXXmZ5UVu8u5t4oCmfFHE9x9YYnJlSwM6bu6VjDGpRqmY6xNXDkC68oHVcnTtXXsr/G4W4rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3421
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ffvk3WQ09O9v9NZaptXduozW8pGuCR4nhOmuEN0sgE0=;
 b=GsvJViAbxSL0JX72Bm7FHr4bhL4v/TjvkxMQKb0y+cfZPZXWJ4vhczlpFqPlWDvgh8E88UWErpPyHKS4A5b1+Mth+RWZTuxmyu4xvomMzhRGaKgH4h6pIHrJyStduaf0bOXZUxePwmwItP4Ts8a7pxDnAGWaqOXfqS/cjstL+C0=
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
Cc: "Tuikov, Luben" <Luben.Tuikov@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Liu,
 Aaron" <Aaron.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgoKQWRkIGEgZmxh
ZyBmb3Igd2hlbiBhbGxvY2F0aW5nIGEgY29udGV4dCB0byBmbGFnIGl0IGFzCnNlY3VyZS4gIFRo
ZSBrZXJuZWwgZHJpdmVyIHdpbGwgdXNlIHRoaXMgZmxhZyB0byBkZXRlcm1pbmUKd2hldGhlciBh
IHJlbmRlcmluZyBjb250ZXh0IGlzIHNlY3VyZSBvciBub3Qgc28gdGhhdCB0aGUKZW5naW5lIGNh
biBiZSB0cmFuc2l0aW9uZWQgYmV0d2VlbiBzZWN1cmUgb3IgdW5zZWN1cmUKb3IgdGhlIHdvcmsg
Y2FuIGJlIHN1Ym1pdHRlZCB0byBhIHNlY3VyZSBxdWV1ZSBkZXBlbmRpbmcKb24gdGhlIElQLgoK
djI6IHRoZSBmbGFnIHdpbGwgYmUgdXNlZCBmb3Igc2VjdXJpdHksIHNvIHJlbW92ZSB0aGUgY29t
bWVudCAoUmF5KQoKU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hl
ckBhbWQuY29tPgpSZXZpZXdlZC1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KU2ln
bmVkLW9mZi1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KLS0tCiBpbmNsdWRlL3Vh
cGkvZHJtL2FtZGdwdV9kcm0uaCB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0vYW1kZ3B1
X2RybS5oIGIvaW5jbHVkZS91YXBpL2RybS9hbWRncHVfZHJtLmgKaW5kZXggZjkwYjQ1My4uN2Fh
YjRlMSAxMDA2NDQKLS0tIGEvaW5jbHVkZS91YXBpL2RybS9hbWRncHVfZHJtLmgKKysrIGIvaW5j
bHVkZS91YXBpL2RybS9hbWRncHVfZHJtLmgKQEAgLTIwNyw2ICsyMDcsOSBAQCB1bmlvbiBkcm1f
YW1kZ3B1X2JvX2xpc3QgewogI2RlZmluZSBBTURHUFVfQ1RYX09QX1FVRVJZX1NUQVRFCTMKICNk
ZWZpbmUgQU1ER1BVX0NUWF9PUF9RVUVSWV9TVEFURTIJNAogCisvKiBGbGFnIHRoZSBjb250ZXh0
IGFzIHNlY3VyZSAqLworI2RlZmluZSBBTURHUFVfQ1RYX0FMTE9DX0ZMQUdTX1NFQ1VSRQkoMSA8
PCAwKQorCiAvKiBHUFUgcmVzZXQgc3RhdHVzICovCiAjZGVmaW5lIEFNREdQVV9DVFhfTk9fUkVT
RVQJCTAKIC8qIHRoaXMgdGhlIGNvbnRleHQgY2F1c2VkIGl0ICovCkBAIC0yNDEsNyArMjQ0LDYg
QEAgdW5pb24gZHJtX2FtZGdwdV9ib19saXN0IHsKIHN0cnVjdCBkcm1fYW1kZ3B1X2N0eF9pbiB7
CiAJLyoqIEFNREdQVV9DVFhfT1BfKiAqLwogCV9fdTMyCW9wOwotCS8qKiBGb3IgZnV0dXJlIHVz
ZSwgbm8gZmxhZ3MgZGVmaW5lZCBzbyBmYXIgKi8KIAlfX3UzMglmbGFnczsKIAlfX3UzMgljdHhf
aWQ7CiAJLyoqIEFNREdQVV9DVFhfUFJJT1JJVFlfKiAqLwotLSAKMi43LjQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
