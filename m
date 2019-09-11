Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EEFAFBE9
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 13:50:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8ADB6EABD;
	Wed, 11 Sep 2019 11:50:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780088.outbound.protection.outlook.com [40.107.78.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC026EABB;
 Wed, 11 Sep 2019 11:50:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ic6jkbTM6OvgraH0IvX2iy/zxqLPp2Lk0gonHJ7+Em6zqUUaYGBSHugArQCicXw9z0suJVn5CJiea47C6Ub4peu9InjTbxNGifW2p8zUFckpDjGal9TerX2HCoiROHAeP7VUzzCTdxfHJKazz3AFVDONTXt5d4urm0H3/Axx2iUP2igIinAhwH+JGWetz6bFsb2mUqu1Cfb/x8EFlW8K90rnljJtDPRgwqzDBcJtzb5a0EVQrDpYiRbsJG7Gi3w6FdAYF1OgOWaoTTufJsYTco1VWoH13GQKRi7UH/pUGobJ67x01kf/FAkEqsbTSQYCqLXhoNzyCbYi8UBPMK9yRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5aB/3agu4o24sR5vhp7NVmf7Dz00oiSqUf5mB/a1+yI=;
 b=FT7u3gw8hLkB2e4zYQI6j3DsjixC6Q1eChg8zGDsfWY1YXV55DMIiyYkMWd2KsIhYx0+e2aXsPcTOyvX6SPLZfjISykSlf7L6sfSbroqNWtScxZBZi1lAqOgn0WdGd0fGpV/b75C6CGOMO4XAijzyXeWXeCVzvBwF/vyZco5fOLt8MYSqqKWoCxKSutPPB0nqsQIimWXEojYUrD/kGzGEq5rmBSWfrAwT1HZRxyjRLHHSTn60twG0ynrGgQxO2YBNIN8pfOAS+iWybtGLPd48Fcmb0EbnQJaSro3GV6rEnMzYex4pqmrd1yPmSv9+4i04VtCee+BaGY5HkANZVT6SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB3421.namprd12.prod.outlook.com (20.178.243.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Wed, 11 Sep 2019 11:50:43 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d%4]) with mapi id 15.20.2241.022; Wed, 11 Sep 2019
 11:50:43 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: [PATCH 12/14] drm/amdgpu: set trusted mode while the job is under
 secure context (v2)
Thread-Topic: [PATCH 12/14] drm/amdgpu: set trusted mode while the job is
 under secure context (v2)
Thread-Index: AQHVaJcjgTT88gakVk20R05UTrUn9Q==
Date: Wed, 11 Sep 2019 11:50:42 +0000
Message-ID: <1568202584-14471-13-git-send-email-ray.huang@amd.com>
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
x-ms-office365-filtering-correlation-id: 0bf492bf-0fbd-41a3-4b42-08d736ae4645
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3421; 
x-ms-traffictypediagnostic: MN2PR12MB3421:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3421ADFBFAECFD8722927B6DECB10@MN2PR12MB3421.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:792;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(136003)(376002)(366004)(199004)(189003)(6436002)(4326008)(25786009)(450100002)(6486002)(486006)(11346002)(446003)(2616005)(305945005)(7736002)(50226002)(8936002)(316002)(110136005)(54906003)(8676002)(6116002)(3846002)(2906002)(81166006)(81156014)(36756003)(14454004)(71190400001)(71200400001)(86362001)(66446008)(478600001)(66476007)(64756008)(66556008)(66946007)(256004)(99286004)(53936002)(5660300002)(76176011)(52116002)(6512007)(6636002)(386003)(6506007)(66066001)(102836004)(26005)(186003)(476003)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3421;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: P1K9mVy4dCDQWF8gM21LDok4jmAIjyB92zFfHpZOyrHFdF8kAyqFA1QXanJSw+4bJLDhGDuWEVgE6GDJjE5SlChbqeE3YJj8UgKIbQJSO3f2os0mDJaDH8EzhfWNtLSw7gJ2xdgwxOxXIppm4sBHGQ/oBGQUyf4WMUeR7pbetZO7qP/sa0VzK5A4EKa1ObzyQ8j3WusXgDLI85Yw+2e45vkU3yRwI5hCTXqC0HUFro9SgG47WHTJI2wTaeXwBwFyiv/K1QA2OrEfpMzT0B68qXKenGyU7j3lkNRwLGZIVmz4PDby/Jrb3A2VpBWOISYJ3WWqz4jzWMWtbCTl996qSvM7HOXITaFJlTJPUFNgrd1/9FZfj4r6gQZD0uMeAqKuv1uSCtKhEmqkHL23KtDLPG7BnNmAsKY51Lgsqsob6pM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bf492bf-0fbd-41a3-4b42-08d736ae4645
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 11:50:43.0358 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hmOEUD0G7Xv21/1dicWtXW5AwzbuFCB0pRJJnUU54wFH7y8e+H9OmZYk6YokL1cOLKYlyMPFJlSy7mIqpI7Sjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3421
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5aB/3agu4o24sR5vhp7NVmf7Dz00oiSqUf5mB/a1+yI=;
 b=FoIxsc0e+IpAjfY3aT2jLasniwAJuyw6Odhb4bOQcnORwlAR6eiZk0Oysvh8bOwhZEOtA98lcnqNaa+z2oH6Kr0j2/6zisnTlqlK4BQwRQi99Y+H782O3uvvE5MsldBpJjpMKQ7lF8cfcX6Xj1WPfQQItYm8EyfQFpGrfzBiRNM=
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

V2hpbGUgdXNlciBtb2RlIHN1Ym1pdCBhIGNvbW1hbmQgd2l0aCBzZWN1cmUgY29udGV4dCwgd2Ug
c2hvdWxkIHNldCB0aGUgY29tbWFuZApidWZmZXIgd2l0aCB0cnVzdGVkIG1vZGUuCgp2MjogZml4
IHRoZSBudWxsIGpvYiBwb2ludGVyIHdoaWxlIGluIHZtaWQgMCBzdWJtaXNzaW9uLgoKU2lnbmVk
LW9mZi1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFsZXgg
RGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfY3MuYyAgfCAxICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9pYi5jICB8IDQgKystLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2pvYi5oIHwgMiArKwogMyBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Nz
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYwppbmRleCA1MWYzZGIw
Li42MGU3Yjc5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
Y3MuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYwpAQCAtMTI1
Miw2ICsxMjUyLDcgQEAgc3RhdGljIGludCBhbWRncHVfY3Nfc3VibWl0KHN0cnVjdCBhbWRncHVf
Y3NfcGFyc2VyICpwLAogCQlwLT5jdHgtPnByZWFtYmxlX3ByZXNlbnRlZCA9IHRydWU7CiAJfQog
CisJam9iLT5zZWN1cmUgPSBwLT5jdHgtPmlzX3NlY3VyZTsKIAljcy0+b3V0LmhhbmRsZSA9IHNl
cTsKIAlqb2ItPnVmX3NlcXVlbmNlID0gc2VxOwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfaWIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9pYi5jCmluZGV4IGUxZGMyMjkuLmNiOWI2NTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pYi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9pYi5jCkBAIC0yMTAsNyArMjEwLDcgQEAgaW50IGFtZGdwdV9pYl9zY2hlZHVs
ZShzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIHVuc2lnbmVkIG51bV9pYnMsCiAJaWYgKGpvYiAm
JiByaW5nLT5mdW5jcy0+ZW1pdF9jbnR4Y250bCkgewogCQlzdGF0dXMgfD0gam9iLT5wcmVhbWJs
ZV9zdGF0dXM7CiAJCXN0YXR1cyB8PSBqb2ItPnByZWVtcHRpb25fc3RhdHVzOwotCQlhbWRncHVf
cmluZ19lbWl0X2NudHhjbnRsKHJpbmcsIHN0YXR1cywgZmFsc2UpOworCQlhbWRncHVfcmluZ19l
bWl0X2NudHhjbnRsKHJpbmcsIHN0YXR1cywgam9iLT5zZWN1cmUpOwogCX0KIAogCWZvciAoaSA9
IDA7IGkgPCBudW1faWJzOyArK2kpIHsKQEAgLTIyOSw3ICsyMjksNyBAQCBpbnQgYW1kZ3B1X2li
X3NjaGVkdWxlKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywgdW5zaWduZWQgbnVtX2licywKIAl9
CiAKIAlpZiAocmluZy0+ZnVuY3MtPmVtaXRfdG16KQotCQlhbWRncHVfcmluZ19lbWl0X3Rteihy
aW5nLCBmYWxzZSwgZmFsc2UpOworCQlhbWRncHVfcmluZ19lbWl0X3RteihyaW5nLCBmYWxzZSwg
am9iID8gam9iLT5zZWN1cmUgOiBmYWxzZSk7CiAKICNpZmRlZiBDT05GSUdfWDg2XzY0CiAJaWYg
KCEoYWRldi0+ZmxhZ3MgJiBBTURfSVNfQVBVKSkKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9qb2IuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9qb2IuaAppbmRleCBkYzdlZTkzLi41OWYxZGJjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfam9iLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2pvYi5oCkBAIC02Myw2ICs2Myw4IEBAIHN0cnVjdCBhbWRncHVfam9iIHsK
IAl1aW50NjRfdAkJdWZfYWRkcjsKIAl1aW50NjRfdAkJdWZfc2VxdWVuY2U7CiAKKwkvKiB0aGUg
am9iIGlzIHVuZGVyIHNlY3VyZSBjb250ZXh0ICovCisJYm9vbAkJCXNlY3VyZTsKIH07CiAKIGlu
dCBhbWRncHVfam9iX2FsbG9jKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1bnNpZ25lZCBu
dW1faWJzLAotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
