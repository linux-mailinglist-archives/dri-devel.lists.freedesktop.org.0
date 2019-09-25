Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4480EBDF48
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 15:45:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B926EBB9;
	Wed, 25 Sep 2019 13:45:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730068.outbound.protection.outlook.com [40.107.73.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BBE56EBB3;
 Wed, 25 Sep 2019 13:45:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IVCoyShZF+Kt3KkGrEt8J7fmKqGbBKLYUopV/4eJN4e78McqnRBNmaY3rR6dyj5lpXp6h/vry4kBBESxROorHKLfFP9P4+J75aHF6s41T8t6JAfqi6FuUwytt4jzdcRvyt82bJQ5sFBT91FvtY2g0SnbBrFo5RXleARl0k0yE+DI3s0ca6GHY7wABgTavmaQy5dFk/k1NrWXF1eTzbrCpkYmogu7yuZojWBKDNXTWPvOvb1ItLS4RvTx15rkwxjVfYEKHPnp0PhsowfW8Ic73IM8xh2fHe2c0Ht1z8mXqGBpxAveJo51VZrSThvF6c+Z+SzGGFuDZDZTNsF7M+yIYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f3bAjAulClvu9ph2kT/jW3gO6vlZITV00+33w8bnlXw=;
 b=fPOTZp88lzHyW0tSCeP3s8OsZcX3eNK86CtmctHqYYgvd5HZxuct+85pYXK1lN5Y+P+LykGv36urtfUbN3lypMTpbtyhMiWiCd527EiaYHJ+Wx/uKqqeXeNYhXhqT3c4hAWeQzQFogEOS1P31LsQsVot5CSfgENRkgPXpHOqBtNJbIpOdWXDXhFmxu/ekxPXC3itsV7PW6FpRyk+2TqQtBS74m6Cy9UlUnS3xieGmPRKREcWmyjZFcCyZISMsLjDvEv1rHrcRTlLo8vBr8TZIlHikkvp4rBPZEubOBGdMQ8iJd9lwZJxtMNTrBNzYGtbnumLb/RrvWPpA64GefwNeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB4304.namprd12.prod.outlook.com (10.255.224.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Wed, 25 Sep 2019 13:45:11 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d%4]) with mapi id 15.20.2305.016; Wed, 25 Sep 2019
 13:45:11 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: [PATCH v2 01/11] drm/amdgpu: add UAPI for creating encrypted buffers
Thread-Topic: [PATCH v2 01/11] drm/amdgpu: add UAPI for creating encrypted
 buffers
Thread-Index: AQHVc6dzBSlURytWtU+KU92WjhXpBA==
Date: Wed, 25 Sep 2019 13:45:11 +0000
Message-ID: <1569419090-5304-2-git-send-email-ray.huang@amd.com>
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
x-ms-office365-filtering-correlation-id: 0fe246a8-62e2-4a0e-b979-08d741be95f0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB4304; 
x-ms-traffictypediagnostic: MN2PR12MB4304:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4304F7421DA49BE4CC6F1F18EC870@MN2PR12MB4304.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01713B2841
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(376002)(346002)(396003)(366004)(189003)(199004)(86362001)(8936002)(305945005)(2501003)(50226002)(6636002)(14444005)(256004)(6486002)(6116002)(3846002)(6436002)(6512007)(2906002)(4326008)(66066001)(102836004)(26005)(186003)(52116002)(76176011)(486006)(476003)(2616005)(11346002)(66946007)(66476007)(66556008)(64756008)(66446008)(446003)(66574012)(99286004)(5660300002)(81156014)(6506007)(81166006)(450100002)(25786009)(36756003)(316002)(478600001)(386003)(8676002)(71190400001)(71200400001)(110136005)(54906003)(7736002)(4744005)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4304;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LMli6ol8rwj6RlDePqpttZ78usrxCf4epIUQI3D8Uo5RPQWeHuIlL1gibI5dMs52CX4JjaGJj0Q5Gz1drhvqVGImRzlNxhJw09d6w425Pk01JPOlBXgx20DIms2qD2gd79iRAonMAOuE0yLGrFioZ5AKkfj0f/JEo465Hzf8k7DknpPjg31YW7UeTa/1NEWs3kdtivUcBfHO0Cf1PAqLRmKZAWx/0u/22ZM+qJ4YN1WKMqdYu2R290P7bTK+oZLhWXwjQrFI/+/6M3JR8HQhZm2oqw6LC+cColHmmEpe1asYNuUyVJrGGtqozxbd0xmiK5LgXa8h/64zzyxAOimr+7zzKUyYTxvx18caT9yeXGiLgcus2m6qH2yXEMdUKG5tmv5+UxlFKGlPk9eW18hVx6ge5sahk2AvvNl3ThvJ5eo=
Content-ID: <8099FBBC75C83A4B8A2D7BD1CFF9D698@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fe246a8-62e2-4a0e-b979-08d741be95f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2019 13:45:11.6434 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QvfE3fBGeUgNLhMNGh/s5SZvmOd+Iw1kdMKFwmcW64TxvDTcAfuIavd2phJjdWwXFf5BDyq1AVJUB4c2c3kXIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4304
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f3bAjAulClvu9ph2kT/jW3gO6vlZITV00+33w8bnlXw=;
 b=XrR/BhVEf4GyGPzZSUa06Xk2z4U2SJfNxtVxyI2587cmAzPgpHKXdG9bm/4Nvr5tR+2GjWAucM+tw4Dq/2jF7GcsV9YuU9Pu41jR+mK2nQcCUD1j45PcZAzZu/gVP9CsyoEXW9BWmmXmhUTfiGKP1XVNrkutZucKCVS12ENNj2Q=
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

RnJvbTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KDQpBZGQgYSBm
bGFnIHRvIHRoZSBHRU1fQ1JFQVRFIGlvY3RsIHRvIGNyZWF0ZSBlbmNyeXB0ZWQgYnVmZmVycy4N
CkJ1ZmZlcnMgd2l0aCB0aGlzIGZsYWcgc2V0IHdpbGwgYmUgY3JlYXRlZCB3aXRoIHRoZSBUTVog
Yml0IHNldA0KaW4gdGhlIFBURXMgb3IgZW5naW5lcyBhY2Nlc3NpbmcgdGhlbS4gIFRoaXMgaXMg
cmVxdWlyZWQgaW4gb3JkZXINCnRvIHByb3Blcmx5IGFjY2VzcyB0aGUgZGF0YSBmcm9tIHRoZSBl
bmdpbmVzLg0KDQpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+DQpSZXZpZXdlZC1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4NClJl
dmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQot
LS0NCiBpbmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0uaCB8IDUgKysrKysNCiAxIGZpbGUgY2hh
bmdlZCwgNSBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL2Ft
ZGdwdV9kcm0uaCBiL2luY2x1ZGUvdWFwaS9kcm0vYW1kZ3B1X2RybS5oDQppbmRleCBmM2FkNDI5
Li5mOTBiNDUzIDEwMDY0NA0KLS0tIGEvaW5jbHVkZS91YXBpL2RybS9hbWRncHVfZHJtLmgNCisr
KyBiL2luY2x1ZGUvdWFwaS9kcm0vYW1kZ3B1X2RybS5oDQpAQCAtMTM1LDYgKzEzNSwxMSBAQCBl
eHRlcm4gIkMiIHsNCiAgKiByZWxlYXNpbmcgdGhlIG1lbW9yeQ0KICAqLw0KICNkZWZpbmUgQU1E
R1BVX0dFTV9DUkVBVEVfVlJBTV9XSVBFX09OX1JFTEVBU0UJKDEgPDwgOSkNCisvKiBGbGFnIHRo
YXQgQk8gd2lsbCBiZSBlbmNyeXB0ZWQgYW5kIHRoYXQgdGhlIFRNWiBiaXQgc2hvdWxkIGJlDQor
ICogc2V0IGluIHRoZSBQVEVzIHdoZW4gbWFwcGluZyB0aGlzIGJ1ZmZlciB2aWEgR1BVVk0gb3IN
CisgKiBhY2Nlc3NpbmcgaXQgd2l0aCB2YXJpb3VzIGh3IGJsb2Nrcw0KKyAqLw0KKyNkZWZpbmUg
QU1ER1BVX0dFTV9DUkVBVEVfRU5DUllQVEVECQkoMSA8PCAxMCkNCiANCiBzdHJ1Y3QgZHJtX2Ft
ZGdwdV9nZW1fY3JlYXRlX2luICB7DQogCS8qKiB0aGUgcmVxdWVzdGVkIG1lbW9yeSBzaXplICov
DQotLSANCjIuNy40DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
