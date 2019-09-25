Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4B0BDF4D
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 15:45:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B6176EBBC;
	Wed, 25 Sep 2019 13:45:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730077.outbound.protection.outlook.com [40.107.73.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC3FB6EBBD;
 Wed, 25 Sep 2019 13:45:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=APnpRiAc8AyqHDIfHw9HAenTB1NN+kFlp7/ikhGKp7naaPn3nXghEvutteLKXKg3ruDhSJ0AQpN9NlQ20XJ7qkcfa5efdYM+LuhPVfubQ1aXonCOwDvlKdZYKpMABeeWFhUqFIpg3rixu4JOdl9n/+8/gDY6ysJ6dNOSicJik5OJVEYrDyOqXIXaM4+B04/wm5vs1XP0FAgWFSqZ35W28n0LX6Jk8+YmRFTRoyVtPTsDhquJW7ZsRcneorngC8a7Duyu4+T4c2LR3YqRMv3uaO/EwIDJ84IpqJXvmng6pTjOZyYwDSZ5vTS9BQ5ONX7TB+04P/7uLRW4TBNB/Et7kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j5ZCWdumQ1m47v1W2RSr5NlSa7eKBAn3F/H4TuqXe6o=;
 b=Y46YQy8ENW7V8I7JmsgVJmJjwM6tIBwDmbYPNByPH9T+JHTP57dLLnU2vszJBb76WpM5TAsJS6V6lNo4D2GOz4pr/Rw/++Z57EWUAMG1e4envUPVyGNhAEBeM5ILuRJLHh6TPd/QtwGfMj+WeyyxOYO/YAkXKi/v8Q5MpmqhHYzSrRq/3W5euxDm3f8tokoSUPKZGFXnruWuHv50lnAnSscy2rntI9F3n/2cAjAuQDVMOJdGILpAATohLh4MUSRmsquqnhmJnIVvnkCQDd4Ly0WKqSEjOV0pp/DUxqgCyAb5VLk8nLlZeGaaYYg05Otf5pTHc+c7L6TdeqLrcOopUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB4304.namprd12.prod.outlook.com (10.255.224.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Wed, 25 Sep 2019 13:45:28 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d%4]) with mapi id 15.20.2305.016; Wed, 25 Sep 2019
 13:45:28 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: [PATCH v2 06/11] drm/amdgpu: add function to check tmz capability (v4)
Thread-Topic: [PATCH v2 06/11] drm/amdgpu: add function to check tmz
 capability (v4)
Thread-Index: AQHVc6d9hS+lKNsGN0yoqrJ3DVQn3w==
Date: Wed, 25 Sep 2019 13:45:28 +0000
Message-ID: <1569419090-5304-7-git-send-email-ray.huang@amd.com>
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
x-ms-office365-filtering-correlation-id: 82c35f37-0055-4464-dd0b-08d741bea006
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB4304; 
x-ms-traffictypediagnostic: MN2PR12MB4304:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB43040AD44CE6BA93AE3452C8EC870@MN2PR12MB4304.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01713B2841
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(376002)(346002)(396003)(366004)(189003)(199004)(86362001)(8936002)(305945005)(2501003)(50226002)(6636002)(14444005)(256004)(6486002)(6116002)(3846002)(6436002)(6512007)(2906002)(4326008)(66066001)(102836004)(26005)(186003)(52116002)(76176011)(486006)(476003)(2616005)(11346002)(66946007)(66476007)(66556008)(64756008)(66446008)(446003)(99286004)(5660300002)(81156014)(6506007)(81166006)(450100002)(25786009)(36756003)(316002)(478600001)(386003)(8676002)(71190400001)(71200400001)(110136005)(54906003)(7736002)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4304;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lpTIZt22PNt8JFvKHaUnRvat610FMKS7QzxnSDda3OuXNTM3WRdUFMUUbd4fPLdlR3/cMsuuVgsa2bfnL4d68UgMQlImQU8iFRazrc8s49II13dqefhnV90TgkyE7V+rEpa+7sQ91Vzy88jjgOUXSkF4VAc+QmZshalNyYGNPueM/zgQWEIWoHLbrSIAcwxUh7WwJNSBXjKi12fxaKuyeL39ycQ+MeyJeM/oPZDwQm5u2hJzk8DU4Z3fVYjgF15torBRWGncqoGTqQmeHNyxHTVYLk9ai5uVhKvcPQoEMBH0fJqdPor1St4QldteA/dBvjJFbSwqvPkJTFDa9dhTdmhWhC6SSyGjv3eQks5qd84Ss/Ixe+xSSO+wO4QlwO8xV7lGNeAvWjA254Ml5H+aM3Uy9hGbdT8b9gW5oTjhx6k=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82c35f37-0055-4464-dd0b-08d741bea006
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2019 13:45:28.3668 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TYDQOCofOHX/PIk8S2S9rIB7j/YwZ+3WpDnGbTfAXRFUGVO+yCWwOXBFLvhI3ECU3P5LmEO3D6Oig/rMaIdcMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4304
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j5ZCWdumQ1m47v1W2RSr5NlSa7eKBAn3F/H4TuqXe6o=;
 b=hQE6eVBlVkoNUJZxELWxpu7U84eNYlB5qc6huRXx/6LbVlDQ1Uh4fWq3lqct3f+bG5DGW9IuNPskPQe268o0XsBz4cjlyGqs9DEV2p5kziRiJDXMB5lohsVNrsT1yU6zK00nu+PrVgxG890ndsNQrKHNFd2JXX+7GjVfpe0hdVE=
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

QWRkIGEgZnVuY3Rpb24gdG8gY2hlY2sgdG16IGNhcGFiaWxpdHkgd2l0aCBrZXJuZWwgcGFyYW1l
dGVyIGFuZCBBU0lDIHR5cGUuCgp2MjogdXNlIGEgcGVyIGRldmljZSB0bXogdmFyaWFibGUgaW5z
dGVhZCBvZiBnbG9iYWwgYW1kZ3B1X3Rtei4KdjM6IHJlZmluZSB0aGUgY29tbWVudHMgZm9yIHRo
ZSBmdW5jdGlvbi4gKEx1YmVuKQp2NDogYWRkIGFtZGdwdV90bXouYy9oIGZvciBmdXR1cmUgdXNl
LgoKU2lnbmVkLW9mZi1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KUmV2aWV3ZWQt
Ynk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9NYWtlZmlsZSAgICAgICAgfCAgMiArLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIHwgIDMgKysKIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV90bXouYyAgICB8IDQ5ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Rtei5oICAgIHwgIDMgKysK
IDQgZmlsZXMgY2hhbmdlZCwgNTYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQogY3JlYXRl
IG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90bXouYwoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L01ha2VmaWxlIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvTWFrZWZpbGUKaW5kZXggOTEzNjljOC4uMjcwY2U4MiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvTWFrZWZpbGUKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvTWFrZWZpbGUKQEAgLTU1LDcgKzU1LDcgQEAgYW1kZ3B1LXkgKz0g
YW1kZ3B1X2RldmljZS5vIGFtZGdwdV9rbXMubyBcCiAJYW1kZ3B1X3ZmX2Vycm9yLm8gYW1kZ3B1
X3NjaGVkLm8gYW1kZ3B1X2RlYnVnZnMubyBhbWRncHVfaWRzLm8gXAogCWFtZGdwdV9nbWMubyBh
bWRncHVfbW1odWIubyBhbWRncHVfeGdtaS5vIGFtZGdwdV9jc2EubyBhbWRncHVfcmFzLm8gYW1k
Z3B1X3ZtX2NwdS5vIFwKIAlhbWRncHVfdm1fc2RtYS5vIGFtZGdwdV9wbXUubyBhbWRncHVfZGlz
Y292ZXJ5Lm8gYW1kZ3B1X3Jhc19lZXByb20ubyBhbWRncHVfbmJpby5vIFwKLQlhbWRncHVfdW1j
Lm8gc211X3YxMV8wX2kyYy5vCisJYW1kZ3B1X3VtYy5vIHNtdV92MTFfMF9pMmMubyBhbWRncHVf
dG16Lm8KIAogYW1kZ3B1LSQoQ09ORklHX1BFUkZfRVZFTlRTKSArPSBhbWRncHVfcG11Lm8KIApk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCmluZGV4IDI1MzVkYjIu
LmUzNzZmZTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
ZXZpY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMK
QEAgLTYzLDYgKzYzLDcgQEAKICNpbmNsdWRlICJhbWRncHVfeGdtaS5oIgogI2luY2x1ZGUgImFt
ZGdwdV9yYXMuaCIKICNpbmNsdWRlICJhbWRncHVfcG11LmgiCisjaW5jbHVkZSAiYW1kZ3B1X3Rt
ei5oIgogCiAjaW5jbHVkZSA8bGludXgvc3VzcGVuZC5oPgogCkBAIC0xMDMyLDYgKzEwMzMsOCBA
QCBzdGF0aWMgaW50IGFtZGdwdV9kZXZpY2VfY2hlY2tfYXJndW1lbnRzKHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2KQogCiAJYWRldi0+ZmlybXdhcmUubG9hZF90eXBlID0gYW1kZ3B1X3Vjb2Rl
X2dldF9sb2FkX3R5cGUoYWRldiwgYW1kZ3B1X2Z3X2xvYWRfdHlwZSk7CiAKKwlhZGV2LT50bXou
ZW5hYmxlZCA9IGFtZGdwdV9pc190bXooYWRldik7CisKIAlyZXR1cm4gcmV0OwogfQogCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdG16LmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdG16LmMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5k
ZXggMDAwMDAwMC4uMTRhNTUwMAotLS0gL2Rldi9udWxsCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV90bXouYwpAQCAtMCwwICsxLDQ5IEBACisvKgorICogQ29weXJpZ2h0
IDIwMTkgQWR2YW5jZWQgTWljcm8gRGV2aWNlcywgSW5jLgorICoKKyAqIFBlcm1pc3Npb24gaXMg
aGVyZWJ5IGdyYW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBhbnkgcGVyc29uIG9idGFpbmluZyBh
CisgKiBjb3B5IG9mIHRoaXMgc29mdHdhcmUgYW5kIGFzc29jaWF0ZWQgZG9jdW1lbnRhdGlvbiBm
aWxlcyAodGhlICJTb2Z0d2FyZSIpLAorICogdG8gZGVhbCBpbiB0aGUgU29mdHdhcmUgd2l0aG91
dCByZXN0cmljdGlvbiwgaW5jbHVkaW5nIHdpdGhvdXQgbGltaXRhdGlvbgorICogdGhlIHJpZ2h0
cyB0byB1c2UsIGNvcHksIG1vZGlmeSwgbWVyZ2UsIHB1Ymxpc2gsIGRpc3RyaWJ1dGUsIHN1Ymxp
Y2Vuc2UsCisgKiBhbmQvb3Igc2VsbCBjb3BpZXMgb2YgdGhlIFNvZnR3YXJlLCBhbmQgdG8gcGVy
bWl0IHBlcnNvbnMgdG8gd2hvbSB0aGUKKyAqIFNvZnR3YXJlIGlzIGZ1cm5pc2hlZCB0byBkbyBz
bywgc3ViamVjdCB0byB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnM6CisgKgorICogVGhlIGFib3Zl
IGNvcHlyaWdodCBub3RpY2UgYW5kIHRoaXMgcGVybWlzc2lvbiBub3RpY2Ugc2hhbGwgYmUgaW5j
bHVkZWQgaW4KKyAqIGFsbCBjb3BpZXMgb3Igc3Vic3RhbnRpYWwgcG9ydGlvbnMgb2YgdGhlIFNv
ZnR3YXJlLgorICoKKyAqIFRIRSBTT0ZUV0FSRSBJUyBQUk9WSURFRCAiQVMgSVMiLCBXSVRIT1VU
IFdBUlJBTlRZIE9GIEFOWSBLSU5ELCBFWFBSRVNTIE9SCisgKiBJTVBMSUVELCBJTkNMVURJTkcg
QlVUIE5PVCBMSU1JVEVEIFRPIFRIRSBXQVJSQU5USUVTIE9GIE1FUkNIQU5UQUJJTElUWSwKKyAq
IEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFIEFORCBOT05JTkZSSU5HRU1FTlQuICBJ
TiBOTyBFVkVOVCBTSEFMTAorICogVEhFIENPUFlSSUdIVCBIT0xERVIoUykgT1IgQVVUSE9SKFMp
IEJFIExJQUJMRSBGT1IgQU5ZIENMQUlNLCBEQU1BR0VTIE9SCisgKiBPVEhFUiBMSUFCSUxJVFks
IFdIRVRIRVIgSU4gQU4gQUNUSU9OIE9GIENPTlRSQUNULCBUT1JUIE9SIE9USEVSV0lTRSwKKyAq
IEFSSVNJTkcgRlJPTSwgT1VUIE9GIE9SIElOIENPTk5FQ1RJT04gV0lUSCBUSEUgU09GVFdBUkUg
T1IgVEhFIFVTRSBPUgorICogT1RIRVIgREVBTElOR1MgSU4gVEhFIFNPRlRXQVJFLgorICovCisK
KyNpbmNsdWRlIDxkcm0vZHJtUC5oPgorI2luY2x1ZGUgImFtZGdwdS5oIgorI2luY2x1ZGUgImFt
ZGdwdV90bXouaCIKKworCisvKioKKyAqIGFtZGdwdV9pc190bXogLSB2YWxpZGF0ZSB0cnVzdCBt
ZW1vcnkgem9uZQorICoKKyAqIEBhZGV2OiBhbWRncHVfZGV2aWNlIHBvaW50ZXIKKyAqCisgKiBS
ZXR1cm4gdHJ1ZSBpZiBAZGV2IHN1cHBvcnRzIHRydXN0ZWQgbWVtb3J5IHpvbmVzIChUTVopLCBh
bmQgcmV0dXJuIGZhbHNlIGlmCisgKiBAZGV2IGRvZXMgbm90IHN1cHBvcnQgVE1aLgorICovCiti
b29sIGFtZGdwdV9pc190bXooc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCit7CisJaWYgKCFh
bWRncHVfdG16KQorCQlyZXR1cm4gZmFsc2U7CisKKwlpZiAoYWRldi0+YXNpY190eXBlIDwgQ0hJ
UF9SQVZFTiB8fCBhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9BUkNUVVJVUykgeworCQlkZXZfd2Fy
bihhZGV2LT5kZXYsICJkb2Vzbid0IHN1cHBvcnQgdHJ1c3RlZCBtZW1vcnkgem9uZXMgKFRNWilc
biIpOworCQlyZXR1cm4gZmFsc2U7CisJfQorCisJZGV2X2luZm8oYWRldi0+ZGV2LCAiVE1aIGZl
YXR1cmUgaXMgZW5hYmxlZFxuIik7CisKKwlyZXR1cm4gdHJ1ZTsKK30KZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90bXouaCBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV90bXouaAppbmRleCAyNGJiYmMyLi4yOGUwNTE3IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdG16LmgKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Rtei5oCkBAIC0zMyw0ICszMyw3IEBAIHN0cnVjdCBh
bWRncHVfdG16IHsKIAlib29sCWVuYWJsZWQ7CiB9OwogCisKK2V4dGVybiBib29sIGFtZGdwdV9p
c190bXooc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOworCiAjZW5kaWYKLS0gCjIuNy40Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
