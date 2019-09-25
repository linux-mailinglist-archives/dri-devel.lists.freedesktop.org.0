Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A14BDF41
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 15:45:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CDA46EBB2;
	Wed, 25 Sep 2019 13:45:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730084.outbound.protection.outlook.com [40.107.73.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 753136EBB1;
 Wed, 25 Sep 2019 13:45:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PBCVDPi2YyYE1Wwvt+VFyjwLQUu8JVS4qicewNZigd7xCMNCofhMQzXZ6lzZ0LB3TEcZnAwiX+yhMl3sokQB4UG6uxpp/vDuR8vX6uNvfvAYKkExNiJ7MO4SIr51yg4wrgWHuH2EHnC+zJrPQRIn0fgnxh77iXPvHtN2bzmv0Tf6xywVEwKNLOpoLyIqK5QJ2Mgkfk83lZImba9O/GyLBkNiZiQr4yaD2AevLCtagOfYLBsbTc2JB6hdFBhUjGwYxhv04Rx+h+m1c+kfrLf43fBdxuNymLC8SyGaTdz7n1V3F0I/tNt+W2M/CB6OpuH+MhlzkntKMnJVTyeQiKllUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kig8dpLmkZNCRUXwsmWKBO/gpli13f9kmBTHuL8hnfk=;
 b=nDa86gImYYdyGQ8d9b3tGaxUPTZ9f1jx8X/vZLRfCFSr1xET/aa+YuMVG2jfEgTA6Vo1oUWj2kX8YvmV3sEu3yDQtDJFEQgAEo0y46ZtPnfc9dJApPa24S1YE4UbsPaxGO9UbZhQakER+ecUCSJJ17B1XETTgy/HkQjDFmE80RlqqSiHa1vu4y9TlJdn+ilRGPxb2/GxuGXVDQ/Z7I+Ejo8suKiG9MH96A2cqIyevV+TvUpZCMRRP+3AntJuGybRjUZdwxAPA5HbVT9bmz+LzYVyxQOYxx39KwM9KcdNka4TzXeGst66HghSV7+6CnfVjHZ3OS5zZmWK3DfYVUrhEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB4304.namprd12.prod.outlook.com (10.255.224.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Wed, 25 Sep 2019 13:45:08 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d%4]) with mapi id 15.20.2305.016; Wed, 25 Sep 2019
 13:45:08 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: [PATCH v2 00/11] drm/amdgpu: introduce secure buffer object support
 (trusted memory zone)
Thread-Topic: [PATCH v2 00/11] drm/amdgpu: introduce secure buffer object
 support (trusted memory zone)
Thread-Index: AQHVc6dxG74lBwTEdUaW5M9ca9Qk4w==
Date: Wed, 25 Sep 2019 13:45:08 +0000
Message-ID: <1569419090-5304-1-git-send-email-ray.huang@amd.com>
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
x-ms-office365-filtering-correlation-id: 7992b5eb-0b2d-4e93-5b01-08d741be9432
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB4304; 
x-ms-traffictypediagnostic: MN2PR12MB4304:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB43049B2D197406A10B666636EC870@MN2PR12MB4304.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01713B2841
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(376002)(346002)(396003)(366004)(189003)(53754006)(199004)(86362001)(8936002)(305945005)(2501003)(50226002)(6636002)(14444005)(256004)(6486002)(6116002)(3846002)(6436002)(6512007)(2906002)(4326008)(66066001)(102836004)(26005)(186003)(52116002)(486006)(476003)(2616005)(66946007)(66476007)(66556008)(64756008)(66446008)(99286004)(5660300002)(81156014)(6506007)(81166006)(450100002)(25786009)(36756003)(316002)(478600001)(386003)(8676002)(71190400001)(71200400001)(110136005)(54906003)(7736002)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4304;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YV5aXPQyDwLZjUJZW4HmkZsFB1Kh38zVa99Rk5Azp1Ch4Qnu/2KKkkz5mP41C112RPNm4Aa+k5dcdxtJ3McZVAhTyV77WaG9eo8J2ijZH3isGKoqkrzeIaQaa7Vf9rSUdU7yXXUwcCtppzSbJi20+oDG/cunrdtw1ubsfrHPK3vennsrizgh9wmLtuceRy1lNMS97v1aNq6DdssL8LN7XuKar4mEy2GQzGZkrA47YCv1NRTH9t1iRRS876baFrhqKyEEVKrRdThXvodajPwFsxWmK0hLycXzSMT6HCMhQRUuro9AgRSek7Y7aDXTsvC4cpCUqd6o4q7KWGveGnJ/DxJbLpIpIrSTflchATjanFw644x5dtdjvjKyD4jmmmpavNQwgaMSp0ugnARaj5WpxGM/52I+RK/40p1+O37vinc=
Content-ID: <545160CE7EA433458D4D55D1F56AC73A@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7992b5eb-0b2d-4e93-5b01-08d741be9432
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2019 13:45:08.5052 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F496o01p1/uTXFLB5q8L678F3Ovwemu7CyuSJnlhYzIo7fW62hFHpGe8egq7Jz+8Lpv7hTFaEnLDcnjElX8+Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4304
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kig8dpLmkZNCRUXwsmWKBO/gpli13f9kmBTHuL8hnfk=;
 b=cSaiu7j5oMomQ+Q1DbdqoH8EmoATesUfMYzAVtIZnr462rPS7sSLhIqsq0RlZTza1mP24G2hjJziAeydzbqWLDteAk17/3XrGiYZDLeRk32mChDZOUHPGCNzf4qOEGi8mG+RrkeXI0AmSzGffKK9eNwvE7HESPd+drcKtGAlqiY=
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

SGkgYWxsLA0KDQpUaGVzZSBzZXJpZXMgb2YgcGF0Y2hlcyBpbnRyb2R1Y2UgYSBmZWF0dXJlIHRv
IHN1cHBvcnQgc2VjdXJlIGJ1ZmZlciBvYmplY3QuDQpUaGUgVHJ1c3RlZCBNZW1vcnkgWm9uZSAo
VE1aKSBpcyBhIG1ldGhvZCB0byBwcm90ZWN0IHRoZSBjb250ZW50cyBiZWluZyB3cml0dGVuDQp0
byBhbmQgcmVhZCBmcm9tIG1lbW9yeS4gV2UgdXNlIFRNWiBoYXJkd2FyZSBtZW1vcnkgcHJvdGVj
dGlvbiBzY2hlbWUgdG8NCmltcGxlbWVudCB0aGUgc2VjdXJlIGJ1ZmZlciBvYmplY3Qgc3VwcG9y
dC4NCg0KVE1aIGlzIHRoZSBwYWdlLWxldmVsIHByb3RlY3Rpb24gdGhhdCBoYXJkd2FyZSB3aWxs
IGRldGVjdCB0aGUgVE1aIGJpdCBpbiB0aGUNCnBhZ2UgdGFibGUgZW50cnkgdG8gc2V0IHRoZSBj
dXJyZW50IHBhZ2UgaXMgZW5jcnlwdGVkLiBXaXRoIHRoaXMgaGFyZHdhcmUNCmZlYXR1cmUsIHdl
IGRlc2lnbiBhIEJPLWxldmVsIHByb3RlY3Rpb24gaW4ga2VybmVsIGRyaXZlciB0byBwcm92aWRl
IGEgbmV3IGZsYWcNCkFNREdQVV9HRU1fQ1JFQVRFX0VOQ1JZUFRFRCB0byBnZW0gY3JlYXRlIGlv
Y3RsIHRvIGxpYmRybSBmb3IgdGhlIHNlY3VyZSBidWZmZXINCmFsbG9jYXRpb24uIEFuZCBhbHNv
IHByb3ZpZGUgdGhlIG5ldyBBTURHUFVfQ1NfRkxBR1NfU0VDVVJFIHRvIGluZGljYXRlIHRoZQ0K
Y29tbWFuZCBzdWJtbWlzc2lvbiBpcyB0cnVzdGVkIG9yIG5vdC4gSWYgdGhlIEJPIGlzIHNlY3Vy
ZSwgdGhlbiB0aGUgZGF0YSBpcw0KZW5jcnlwdGVkLCBvbmx5IHRoZSB0cnVzdGVkIElQIGJsb2Nr
cyBzdWNoIGFzIGdmeCwgc2RtYSwgdmNuIGFyZSBhYmxlIHRvDQpkZWNyeXB0LiBDUFUgYXMgdGhl
IHVuLXRydXN0ZWQgSVAgYXJlIHVuYWJsZSB0byByZWFkIHRoZSBzZWN1cmUgYnVmZmVyLg0KDQpX
ZSB3aWxsIHN1Ym1pdCB0aGUgbmV3IHNlY3VyZSBjb21tYW5kIGxhdGVyIGZvciBsaWJkcm0sIGFu
ZCBjcmVhdGUgYSBuZXcgdGVzdA0Kc3VpdGUgdG8gdmVyaWZ5IHRoZSBzZWN1cml0eSBmZWF0dXJl
IGluIHRoZSBsaWJkcm0gdW5pdCB0ZXN0cy4NCg0KU3VpdGUgaWQgPSAxMTogTmFtZSAnU2VjdXJp
dHkgVGVzdHMgc3RhdHVzOiBFTkFCTEVEJw0KVGVzdCBpZCAxOiBOYW1lOiAnYWxsb2NhdGUgc2Vj
dXJlIGJ1ZmZlciB0ZXN0IHN0YXR1czogRU5BQkxFRCcNClRlc3QgaWQgMjogTmFtZTogJ2dyYXBo
aWNzIHNlY3VyZSBjb21tYW5kIHN1Ym1pc3Npb24gc3RhdHVzOiBFTkFCTEVEJw0KDQpDaGFuZ2Vz
IGZyb20gVjEgLT4gVjI6DQotIENoYW5nZSB0aGUgVUFQSSBmcm9tIHNlY3VyZSBjb250ZXh0IHRv
IHNlY3VyZSBjb21tYW5kIHN1Ym1pc3Npb24gZm9yIGRpc3BsYXkNCiAgc2VydmVyIGFuZCBjbGll
bnQgdXNhZ2UuIChUaGFua3MgTHViZW4pDQotIFJlbW92ZSB0dG1fbWVtX3JlZyBtYWNybyB0byBn
ZXQgdHRtX2JvIG9iamVjdC4NCi0gTW92ZSB0aGUgYW1kZ3B1X2JvX2VuY3J5cHRlZCBpbnRvIGFt
ZGdwdV92bV9ib191cGRhdGUoKS4gDQoNClRoYW5rcywNClJheQ0KDQpBbGV4IERldWNoZXIgKDMp
Og0KICBkcm0vYW1kZ3B1OiBhZGQgVUFQSSBmb3IgY3JlYXRpbmcgZW5jcnlwdGVkIGJ1ZmZlcnMN
CiAgZHJtL2FtZGdwdTogZGVmaW5lIHRoZSBUTVogYml0IGZvciB0aGUgUFRFDQogIGRybS9hbWRn
cHU6IHNldCBUTVogYml0cyBpbiBQVEVzIGZvciBzZWN1cmUgQk8gKHY0KQ0KDQpIdWFuZyBSdWkg
KDcpOg0KICBkcm0vYW1kZ3B1OiBhZGQgdG16IGZlYXR1cmUgcGFyYW1ldGVyICh2MikNCiAgZHJt
L2FtZGdwdTogYWRkIGFtZGdwdV90bXogZGF0YSBzdHJ1Y3R1cmUNCiAgZHJtL2FtZGdwdTogYWRk
IGZ1bmN0aW9uIHRvIGNoZWNrIHRteiBjYXBhYmlsaXR5ICh2NCkNCiAgZHJtL2FtZGdwdTogYWRk
IHRteiBiaXQgaW4gZnJhbWUgY29udHJvbCBwYWNrZXQNCiAgZHJtL2FtZGdwdTogZXhwYW5kIHRo
ZSBlbWl0IHRteiBpbnRlcmZhY2Ugd2l0aCB0cnVzdGVkIGZsYWcNCiAgZHJtL2FtZGdwdTogZXhw
YW5kIHRoZSBjb250ZXh0IGNvbnRyb2wgaW50ZXJmYWNlIHdpdGggdHJ1c3QgZmxhZw0KICBkcm0v
YW1kZ3B1OiBqb2IgaXMgc2VjdXJlIGlmZiBDUyBpcyBzZWN1cmUgKHYzKQ0KDQpMdWJlbiBUdWlr
b3YgKDEpOg0KICBkcm0vYW1kZ3B1OiBhZGQgVUFQSSB0byBjcmVhdGUgc2VjdXJlIGNvbW1hbmRz
ICh2MykNCg0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L01ha2VmaWxlICAgICAgICB8ICAy
ICstDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmggICAgICAgIHwgIDcgKysr
Ky0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYyAgICAgfCAgOCArKysr
LQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyB8ICAzICsrDQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jICAgIHwgMTEgKysrKysrKw0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYyAgICB8IDEyICsrKysrKyst
DQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2liLmMgICAgIHwgIDQgKy0tDQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pvYi5oICAgIHwgIDIgKysNCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmggfCAxMSArKysrKysrDQogZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3JpbmcuaCAgIHwgIDkgKysrLS0tDQogZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Rtei5jICAgIHwgNDkgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Rt
ei5oICAgIHwgMzkgKysrKysrKysrKysrKysrKysrKysrKysrDQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3ZtLmMgICAgIHwgIDUgKysrDQogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3ZtLmggICAgIHwgIDMgKysNCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9nZnhfdjEwXzAuYyAgICAgfCAyMCArKysrKysrKystLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nZnhfdjZfMC5jICAgICAgfCAgMyArLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2dmeF92N18wLmMgICAgICB8ICAzICstDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Z2Z4X3Y4XzAuYyAgICAgIHwgIDMgKy0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhf
djlfMC5jICAgICAgfCAxNiArKysrKysrLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
bnZkLmggICAgICAgICAgIHwgIDEgKw0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1
ZC5oICAgICAgICB8ICAxICsNCiBpbmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0uaCAgICAgICAg
ICAgICAgfCAxMCArKysrKy0NCiAyMiBmaWxlcyBjaGFuZ2VkLCAxOTkgaW5zZXJ0aW9ucygrKSwg
MjMgZGVsZXRpb25zKC0pDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV90bXouYw0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdG16LmgNCg0KLS0gDQoyLjcuNA0KDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
