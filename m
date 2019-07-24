Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EB673C00
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 22:05:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EC766E64C;
	Wed, 24 Jul 2019 20:05:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810080.outbound.protection.outlook.com [40.107.81.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF9B46E64C;
 Wed, 24 Jul 2019 20:05:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJlWRoS0HamGLHQcaGVhQ3vyRc1MTgMnzNUUiZZ0F2jwFMSIIqWMkIE9RuBbWUNbF1n4xyMRS10k6rHi1RNl9cnFVAe9bxSUwboKXa4kgN0uEe5bqKsLEmKmESE6MFQ1JBnKnA/AF7EpJzZislae7EANXBOusqUmeIHISduQ0Wik3B3EhzpQafN5PNtClCFARgn4pvOogX7sEVzyd7ek913PHqaEA398kxjGx65LE26/QW6rlqYbPpwD9RmtGaHCFklh9UKCgbVx4yEJFsvQhW4E7g3OU3ZXT5QIerDJXCIDEJY9OIbC/yqwwKNYFf7aVAAJIV4qf1JhWssJgliI7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vK4sXRtZ2gLWUp2HVQXpXHyVJYTG254uWOSLCRNX4/w=;
 b=hBueU47bPmmc7d3O4tjXiYi4zZAmlYZ6tw3zNXP5yQCO2ufom+20a6T7PANiG+KSlChRivoL7FJ22TVw53M4OcgzSX8iyTrdLa5uN8LCW6RrGkTflcDdpswyvuJwEun75zWkEW/hB+ezvnjzWB0E1GFgrVqjh4EXLkj/y/f3uhv1arlYzMJXF8BRJxXSDb3zKNcgrQ3iznLhzSA6xlGknsgahSXdcMd+EvASWTo6XtP7cL1lM8c4sE82qn26R4uEQBxUYR+rv1A6Gf4yuTzJu8Cl0CPD5s2P2sqRy9QHHdI9ng/hdN1G0Ep14vZY0FzmoWfSG9XhTtPV9d6RRkWYWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB2821.namprd12.prod.outlook.com (20.177.229.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Wed, 24 Jul 2019 20:05:36 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::8581:1f0c:2002:db97]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::8581:1f0c:2002:db97%7]) with mapi id 15.20.2094.017; Wed, 24 Jul 2019
 20:05:36 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 9/9] drm/amd/display: Implement MST Aux device registration
Thread-Topic: [PATCH 9/9] drm/amd/display: Implement MST Aux device
 registration
Thread-Index: AQHVQa55xQAFwDhIDEy1dpwudo8YBKbaMu+A
Date: Wed, 24 Jul 2019 20:05:36 +0000
Message-ID: <476bc8a8-f151-867e-4c08-5d32977933b1@amd.com>
References: <20190723232808.28128-1-sunpeng.li@amd.com>
 <20190723232808.28128-10-sunpeng.li@amd.com>
In-Reply-To: <20190723232808.28128-10-sunpeng.li@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0052.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::29) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d3d3ca66-b30c-46a0-e9b1-08d710724a96
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2821; 
x-ms-traffictypediagnostic: BYAPR12MB2821:
x-microsoft-antispam-prvs: <BYAPR12MB2821C4BF55C6CDF898317E7EECC60@BYAPR12MB2821.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1148;
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(346002)(366004)(396003)(136003)(189003)(199004)(186003)(66066001)(6506007)(229853002)(386003)(26005)(3846002)(486006)(53546011)(102836004)(6116002)(110136005)(76176011)(52116002)(478600001)(64756008)(66946007)(66556008)(66476007)(66446008)(54906003)(31696002)(2906002)(86362001)(8936002)(7736002)(8676002)(53936002)(25786009)(6512007)(316002)(4326008)(81166006)(14444005)(256004)(14454004)(5660300002)(6436002)(31686004)(81156014)(36756003)(11346002)(6486002)(446003)(476003)(2201001)(2501003)(2616005)(305945005)(71200400001)(68736007)(6246003)(71190400001)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2821;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: D1XHSmd/UDh+XJXZIhA4c56GlQg5S3lv8ZIWEqyPaP9vMpvf3JUTSjs6qU/hamOd0TX8kYE3lFrr6+nb4Z6qDEcEawJZRWMrfxwddUf1dnoNCp2kXl3L5Fyrby9CJ8DyjksF4yFKHwKNA15nvGKgwIkVu6+PSolrCPn3+CTTYSjKaeqT01ddv/wdqjq9kIuh3iI4nj9wYkHyZK9eemBuqOm9WcARDKgYv3Ik+NshWdMH1v/enBGTiTLIjReAktyIBCdCPOsOzacoNh2Zr6p3J0hkf2FD2jwFiot5wNEJaY7cOdZroRLjkzQf0DQxhvaoNOP88sjrf1mcQc7p0AjU+121CtEo8o07AcQTdKLuQkOTlOnetRgBL6BQXQvZnQMenPiA6qExwnOqYF24w2FaL09XjMrrNAwk+hrX4KZQKUU=
Content-ID: <02AF005FF421084ABFC3B45CC6A5B117@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3d3ca66-b30c-46a0-e9b1-08d710724a96
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2019 20:05:36.1773 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nkazlaus@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2821
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vK4sXRtZ2gLWUp2HVQXpXHyVJYTG254uWOSLCRNX4/w=;
 b=RapQdvKGfJUeqmxeInrL0HDGKbfbfE8+hGtak2vxZL571ZHg1UKiqzfL/ZRgM6vQpUZuuEFkdnAfqFZfFLV5XXd66P6oZAeqKUKl/bIU1lkCmvjGdmxR56E6Sa5Q+OjIgsYJKDnw4rWX502MOeeF/dPqsQsUBfxigT4PUAcKAKA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nicholas.Kazlauskas@amd.com; 
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
Cc: "Zuo, Jerry" <Jerry.Zuo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNy8yMy8xOSA3OjI4IFBNLCBzdW5wZW5nLmxpQGFtZC5jb20gd3JvdGU6DQo+IEZyb206IExl
byBMaSA8c3VucGVuZy5saUBhbWQuY29tPg0KPiANCj4gSW1wbGVtZW50IGxhdGVfcmVnaXN0ZXIg
YW5kIGVhcmx5X3VucmVnaXN0ZXIgaG9va3MgZm9yIE1TVCBjb25uZWN0b3JzLg0KPiBDYWxsIGRy
bSBoZWxwZXJzIGZvciBNU1QgY29ubmVjdG9yIHJlZ2lzdHJhdGlvbiwgd2hpY2ggcmVnaXN0ZXJz
IHRoZQ0KPiBBVVggZGV2aWNlcy4NCj4gDQo+IENjOiBKZXJyeSBadW8gPEplcnJ5Llp1b0BhbWQu
Y29tPg0KPiBDYzogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQu
Y29tPg0KPiBDYzogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+DQo+IFNp
Z25lZC1vZmYtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPg0KDQpSZXZpZXdlZC1ieTog
TmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPg0KDQpCVFc6
IEkgYWxyZWFkeSByZXZpZXdlZCBwYXRjaCA1LCBmZWVsIGZyZWUgdG8gYWRkIG15IFItQi4NCg0K
TmljaG9sYXMgS2F6bGF1c2thcw0KDQo+IC0tLQ0KPiAgIC4uLi9kaXNwbGF5L2FtZGdwdV9kbS9h
bWRncHVfZG1fbXN0X3R5cGVzLmMgICB8IDI0ICsrKysrKysrKysrKysrKysrKy0NCj4gICAxIGZp
bGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21z
dF90eXBlcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVf
ZG1fbXN0X3R5cGVzLmMNCj4gaW5kZXggNTNkMmNmZTYyZTEzLi4xNjIxOGEyMDJiNTkgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2Rt
X21zdF90eXBlcy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVf
ZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5jDQo+IEBAIC0xNTYsNiArMTU2LDI2IEBAIGRtX2RwX21z
dF9jb25uZWN0b3JfZGVzdHJveShzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQ0KPiAg
IAlrZnJlZShhbWRncHVfZG1fY29ubmVjdG9yKTsNCj4gICB9DQo+ICAgDQo+ICtzdGF0aWMgaW50
DQo+ICthbWRncHVfZG1fbXN0X2Nvbm5lY3Rvcl9sYXRlX3JlZ2lzdGVyKHN0cnVjdCBkcm1fY29u
bmVjdG9yICpjb25uZWN0b3IpDQo+ICt7DQo+ICsJc3RydWN0IGFtZGdwdV9kbV9jb25uZWN0b3Ig
KmFtZGdwdV9kbV9jb25uZWN0b3IgPQ0KPiArCQl0b19hbWRncHVfZG1fY29ubmVjdG9yKGNvbm5l
Y3Rvcik7DQo+ICsJc3RydWN0IGRybV9kcF9tc3RfcG9ydCAqcG9ydCA9IGFtZGdwdV9kbV9jb25u
ZWN0b3ItPnBvcnQ7DQo+ICsNCj4gKwlyZXR1cm4gZHJtX2RwX21zdF9jb25uZWN0b3JfbGF0ZV9y
ZWdpc3Rlcihjb25uZWN0b3IsIHBvcnQpOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgdm9pZA0KPiAr
YW1kZ3B1X2RtX21zdF9jb25uZWN0b3JfZWFybHlfdW5yZWdpc3RlcihzdHJ1Y3QgZHJtX2Nvbm5l
Y3RvciAqY29ubmVjdG9yKQ0KPiArew0KPiArCXN0cnVjdCBhbWRncHVfZG1fY29ubmVjdG9yICph
bWRncHVfZG1fY29ubmVjdG9yID0NCj4gKwkJdG9fYW1kZ3B1X2RtX2Nvbm5lY3Rvcihjb25uZWN0
b3IpOw0KPiArCXN0cnVjdCBkcm1fZHBfbXN0X3BvcnQgKnBvcnQgPSBhbWRncHVfZG1fY29ubmVj
dG9yLT5wb3J0Ow0KPiArDQo+ICsJZHJtX2RwX21zdF9jb25uZWN0b3JfZWFybHlfdW5yZWdpc3Rl
cihjb25uZWN0b3IsIHBvcnQpOw0KPiArfQ0KPiArDQo+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBk
cm1fY29ubmVjdG9yX2Z1bmNzIGRtX2RwX21zdF9jb25uZWN0b3JfZnVuY3MgPSB7DQo+ICAgCS5k
ZXRlY3QgPSBkbV9kcF9tc3RfZGV0ZWN0LA0KPiAgIAkuZmlsbF9tb2RlcyA9IGRybV9oZWxwZXJf
cHJvYmVfc2luZ2xlX2Nvbm5lY3Rvcl9tb2RlcywNCj4gQEAgLTE2NCw3ICsxODQsOSBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IGRybV9jb25uZWN0b3JfZnVuY3MgZG1fZHBfbXN0X2Nvbm5lY3Rvcl9m
dW5jcyA9IHsNCj4gICAJLmF0b21pY19kdXBsaWNhdGVfc3RhdGUgPSBhbWRncHVfZG1fY29ubmVj
dG9yX2F0b21pY19kdXBsaWNhdGVfc3RhdGUsDQo+ICAgCS5hdG9taWNfZGVzdHJveV9zdGF0ZSA9
IGRybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rvcl9kZXN0cm95X3N0YXRlLA0KPiAgIAkuYXRvbWlj
X3NldF9wcm9wZXJ0eSA9IGFtZGdwdV9kbV9jb25uZWN0b3JfYXRvbWljX3NldF9wcm9wZXJ0eSwN
Cj4gLQkuYXRvbWljX2dldF9wcm9wZXJ0eSA9IGFtZGdwdV9kbV9jb25uZWN0b3JfYXRvbWljX2dl
dF9wcm9wZXJ0eQ0KPiArCS5hdG9taWNfZ2V0X3Byb3BlcnR5ID0gYW1kZ3B1X2RtX2Nvbm5lY3Rv
cl9hdG9taWNfZ2V0X3Byb3BlcnR5LA0KPiArCS5sYXRlX3JlZ2lzdGVyID0gYW1kZ3B1X2RtX21z
dF9jb25uZWN0b3JfbGF0ZV9yZWdpc3RlciwNCj4gKwkuZWFybHlfdW5yZWdpc3RlciA9IGFtZGdw
dV9kbV9tc3RfY29ubmVjdG9yX2Vhcmx5X3VucmVnaXN0ZXIsDQo+ICAgfTsNCj4gICANCj4gICBz
dGF0aWMgaW50IGRtX2RwX21zdF9nZXRfbW9kZXMoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5l
Y3RvcikNCj4gDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
