Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A99F7BDF54
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 15:45:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8FD96EBCE;
	Wed, 25 Sep 2019 13:45:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730053.outbound.protection.outlook.com [40.107.73.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB8D6EBCA;
 Wed, 25 Sep 2019 13:45:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UX8VHZcBVrk3c3j0JhefltDRsViSZXM5tUqWAFTWE6mmY0snaQHNHc3N8c/GralHnX1H80/6CTDf0DQs2Tp/BLZkRgnsrSiZa7YHXOn6Agh4mNm0JnOUSdw7imDkbyVRBBsjiokt0N8+vZFwkrGy0n67G0XItA11q0hSWlpTHeX0FqKyJYOJQjtMpcX1LuunwWjyC8vmAngIvEyXNUSeEnEM0dsvlkef0lDdsVZ6Uav8PQHo6cMvmjl3xQ4hndBpfMnm8CXvJa3JSmUUVB+z/q9Abs4/uTB+Z7XI7ywIt8Ma2JIOtQ5/G3SfNT2dp4/1o0uEFFCpdYwdRoBP08yQ4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/rOya0AF4FSBiumuaycpfz+1FkTp0kfeBO1CGsL/DDA=;
 b=gNP3JQP7zpbyUM9xKG4EfHnq/CuskdP+VCdMiCf9lihgJI5+xU/wV9v/Tgt8MK1UY/U4lWXtLlDPb7plrLMFwT0lJuXuPIZE2i60FVhrW1VvYBBMRkBfbWyXsWj4NpOwYCXzrq/qam0PcDnaM3rAXPFphokMGnv4FZVRsYQsTlDiy5Jnsc5Vd1UEaPJafXhf9ZuTk/iTEV/Z7thRj6m5C+X+/8X8UgNCpgowySnsEFDdbZRWVIz370p76hGfihr3QlN9+6WjwLg28Nu5A0oaauuU1WP+sq12cm0SglfXUJh9gQ43wX2ME58ked5fMiM+km/pc82qsKtu9wJjEp8OHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB4304.namprd12.prod.outlook.com (10.255.224.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Wed, 25 Sep 2019 13:45:42 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d%4]) with mapi id 15.20.2305.016; Wed, 25 Sep 2019
 13:45:42 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: [PATCH v2 10/11] drm/amdgpu: job is secure iff CS is secure (v3)
Thread-Topic: [PATCH v2 10/11] drm/amdgpu: job is secure iff CS is secure (v3)
Thread-Index: AQHVc6eGQ8fsYXuB3USvmI2hDudFAQ==
Date: Wed, 25 Sep 2019 13:45:42 +0000
Message-ID: <1569419090-5304-11-git-send-email-ray.huang@amd.com>
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
x-ms-office365-filtering-correlation-id: 15a13e70-585d-4718-f56c-08d741bea853
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB4304; 
x-ms-traffictypediagnostic: MN2PR12MB4304:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4304C38DB0EEC472C9E45A82EC870@MN2PR12MB4304.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 01713B2841
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(376002)(346002)(396003)(366004)(189003)(199004)(86362001)(8936002)(305945005)(2501003)(50226002)(6636002)(256004)(6486002)(6116002)(3846002)(6436002)(6512007)(2906002)(4326008)(66066001)(102836004)(26005)(186003)(52116002)(76176011)(486006)(476003)(2616005)(11346002)(66946007)(66476007)(66556008)(64756008)(66446008)(446003)(99286004)(5660300002)(81156014)(6506007)(81166006)(450100002)(25786009)(36756003)(316002)(478600001)(386003)(8676002)(71190400001)(71200400001)(110136005)(54906003)(7736002)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4304;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SeDfoS+Qn8LBbjrkODdnxsmx0cD+oavHWEClYhHwyRAvonA9nXrJ+iI0wg5NLzpAyA+XAenWczpMCwg5EQtESIzSIoIO/42ekkIDPdDN9hE0LQ3jTazLcQbHuzDWzTBFV7BPSZpredbpr3VEqQJWARO8HpfqJvdlov890npCg2DOsLj7AqjYqYbA9BbSciXOctbByrjnudasuUcYcxD2G+s5OQMnsfap/kh8Tavij57sF+uX99Oo5WqW2biJVRdb9TgdJobE06XU6KAmmEiZ7vKuErA4BWreE2OZO1I66qhLN3o3XbucZhub1a6Pw5zsctq/owkSouQOTxQd6aXtNcaByA+0V6JU4yN1AdHy8sr2mxBhfEblX8IpL2eG9IgBrIbldn5KbJM6aCUBvBabIzXAR8WlfQtmOZ2l+DUOY+8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15a13e70-585d-4718-f56c-08d741bea853
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2019 13:45:42.3218 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p7JO7XmlX9dK12m8ighMO251vjscunZcYdHlTZcywODhW+VFh7xSmoqed6xKv4aLKZ9urt3FDYSHQ8w/F7k+hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4304
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/rOya0AF4FSBiumuaycpfz+1FkTp0kfeBO1CGsL/DDA=;
 b=qpg99ES79TE9a7PNrWGGP392cIvf7ZLMCMGgS+Y41cf81iq1m8hGw4XcIlFxtVcoq4e1FIdB8A0p+5PcU6YkhBIHcQDXDw28q/XMVk50+C6XMxzne6lNA5JG8VujIJtf4po1xT/9CHePBwpg5PM128/d0LTJqMrTJncq0PpUx/E=
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

TWFyayBhIGpvYiBhcyBzZWN1cmUsIGlmIGFuZCBvbmx5IGlmIHRoZSBjb21tYW5kCnN1Ym1pc3Np
b24gZmxhZyBoYXMgdGhlIHNlY3VyZSBmbGFnIHNldC4KCnYyOiBmaXggdGhlIG51bGwgam9iIHBv
aW50ZXIgd2hpbGUgaW4gdm1pZCAwCnN1Ym1pc3Npb24uCnYzOiBDb250ZXh0IC0tPiBDb21tYW5k
IHN1Ym1pc3Npb24uCgpTaWduZWQtb2ZmLWJ5OiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29t
PgpDby1kZXZlbG9wZWQtYnk6IEx1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+ClNp
Z25lZC1vZmYtYnk6IEx1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+ClJldmlld2Vk
LWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMgIHwgOCArKysrKysrLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2liLmMgIHwgNCArKy0tCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfam9iLmggfCAyICsrCiAzIGZpbGVzIGNoYW5nZWQsIDExIGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2NzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
Y3MuYwppbmRleCA1MWYzZGIwLi4wMDc3YmIzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfY3MuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfY3MuYwpAQCAtMTI1Miw4ICsxMjUyLDE0IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2NzX3N1
Ym1pdChzdHJ1Y3QgYW1kZ3B1X2NzX3BhcnNlciAqcCwKIAkJcC0+Y3R4LT5wcmVhbWJsZV9wcmVz
ZW50ZWQgPSB0cnVlOwogCX0KIAotCWNzLT5vdXQuaGFuZGxlID0gc2VxOworCS8qIFRoZSBjb21t
YW5kIHN1Ym1pc3Npb24gKGNzKSBpcyBhIHVuaW9uLCBzbyBhbiBhc3NpZ25tZW50IHRvCisJICog
J291dCcgaXMgZGVzdHJ1Y3RpdmUgdG8gdGhlIGNzIChhdCBsZWFzdCB0aGUgZmlyc3QgOAorCSAq
IGJ5dGVzKS4gRm9yIHRoaXMgcmVhc29uLCBpbnF1aXJlIGFib3V0IHRoZSBmbGFncyBiZWZvcmUg
dGhlCisJICogYXNzaWdubWVudCB0byAnb3V0Jy4KKwkgKi8KKwlqb2ItPnNlY3VyZSA9IGNzLT5p
bi5mbGFncyAmIEFNREdQVV9DU19GTEFHU19TRUNVUkU7CiAJam9iLT51Zl9zZXF1ZW5jZSA9IHNl
cTsKKwljcy0+b3V0LmhhbmRsZSA9IHNlcTsKIAogCWFtZGdwdV9qb2JfZnJlZV9yZXNvdXJjZXMo
am9iKTsKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2li
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaWIuYwppbmRleCBlMWRjMjI5
Li5jYjliNjUwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
aWIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaWIuYwpAQCAtMjEw
LDcgKzIxMCw3IEBAIGludCBhbWRncHVfaWJfc2NoZWR1bGUoc3RydWN0IGFtZGdwdV9yaW5nICpy
aW5nLCB1bnNpZ25lZCBudW1faWJzLAogCWlmIChqb2IgJiYgcmluZy0+ZnVuY3MtPmVtaXRfY250
eGNudGwpIHsKIAkJc3RhdHVzIHw9IGpvYi0+cHJlYW1ibGVfc3RhdHVzOwogCQlzdGF0dXMgfD0g
am9iLT5wcmVlbXB0aW9uX3N0YXR1czsKLQkJYW1kZ3B1X3JpbmdfZW1pdF9jbnR4Y250bChyaW5n
LCBzdGF0dXMsIGZhbHNlKTsKKwkJYW1kZ3B1X3JpbmdfZW1pdF9jbnR4Y250bChyaW5nLCBzdGF0
dXMsIGpvYi0+c2VjdXJlKTsKIAl9CiAKIAlmb3IgKGkgPSAwOyBpIDwgbnVtX2liczsgKytpKSB7
CkBAIC0yMjksNyArMjI5LDcgQEAgaW50IGFtZGdwdV9pYl9zY2hlZHVsZShzdHJ1Y3QgYW1kZ3B1
X3JpbmcgKnJpbmcsIHVuc2lnbmVkIG51bV9pYnMsCiAJfQogCiAJaWYgKHJpbmctPmZ1bmNzLT5l
bWl0X3RteikKLQkJYW1kZ3B1X3JpbmdfZW1pdF90bXoocmluZywgZmFsc2UsIGZhbHNlKTsKKwkJ
YW1kZ3B1X3JpbmdfZW1pdF90bXoocmluZywgZmFsc2UsIGpvYiA/IGpvYi0+c2VjdXJlIDogZmFs
c2UpOwogCiAjaWZkZWYgQ09ORklHX1g4Nl82NAogCWlmICghKGFkZXYtPmZsYWdzICYgQU1EX0lT
X0FQVSkpCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfam9i
LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfam9iLmgKaW5kZXggZGM3ZWU5
My4uYWEwZTM3NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2pvYi5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9qb2IuaApAQCAt
NjMsNiArNjMsOCBAQCBzdHJ1Y3QgYW1kZ3B1X2pvYiB7CiAJdWludDY0X3QJCXVmX2FkZHI7CiAJ
dWludDY0X3QJCXVmX3NlcXVlbmNlOwogCisJLyogdGhlIGpvYiBpcyBkdWUgdG8gYSBzZWN1cmUg
Y29tbWFuZCBzdWJtaXNzaW9uICovCisJYm9vbAkJCXNlY3VyZTsKIH07CiAKIGludCBhbWRncHVf
am9iX2FsbG9jKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1bnNpZ25lZCBudW1faWJzLAot
LSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
