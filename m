Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C507A95E
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 15:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D2466E4F8;
	Tue, 30 Jul 2019 13:21:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-bn3nam04on0609.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4e::609])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 017766E4F5
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 13:20:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I51RmpXIlZo/M/2rBn7gTdfCqxEfnyIBzN7ghAS551zxgOw2yaV1ov6Tdu/wNRJFOARobE0lPQG0kVE8TaNkH9WTnSq9KsATSeb2dRrejG35kISDj5V8m2GbNBIVv11PZLLEtAgPe1Ver6kQTQTVn5MRN8iznFdKorKBrUXQZrWAqu/T+KLAQcTnGCQ+3uLCGBhzlFzg7CxyE0kKjKsb85jYcSf+U9MZKovEtQYdn9zUQ6o8Idy0ni1UuwXaRAORHfl8gSeN+eC0AhY3t31ekFAOY92CXlIIToQnsvNf8BRx3RTOHeWyvXkgGbogE4CyYgPguqXQ7Z0aoWWTlFHa6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6mEfzahGp/2vA6HtKyG6sj3Nlo/jnp86cl/nDRstVl8=;
 b=oF91XkL8+8KB96TUuLkh+xbdCUhDSaKZ+kYr3p900UHjwM3i2eaErT2fu+qAgE9PYad81tOSEVwECyT2DrRqGFDF3ZhBxXRFBFayHyW18477k+kMSWrml+En8XQG2sFni4JaU4T6MgVljReG16oSeBEBayshdJzG49w85qKXayI0EboXLtBjeit0jZAsAH10jbGZlQqKxktarzsOK0iICbDtj92edOj5qQcmv00oPJlMI2g1/5/ynDO1BMQmd1sjanmrJnZIBXwcry/oz+V8tZ4I2vCPgO5WqVLeHlJEpw0fp5n6hvFe6X9TP8BdG764Zh04NJXW8X9RDE3kpEuIhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB2423.namprd12.prod.outlook.com (52.132.141.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Tue, 30 Jul 2019 13:17:46 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::9ddf:934:8155:a6ff]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::9ddf:934:8155:a6ff%2]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 13:17:46 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Lionel
 Landwerlin <lionel.g.landwerlin@intel.com>
Subject: Re: [PATCH] drm/syncobj: extend syncobj query ability v3
Thread-Topic: [PATCH] drm/syncobj: extend syncobj query ability v3
Thread-Index: AQHVRtcNZEct+0DseES6uMGld7hT8qbjJKSA
Date: Tue, 30 Jul 2019 13:17:46 +0000
Message-ID: <cfd2ad24-9210-0ba6-bc36-7cc44ac92112@amd.com>
References: <20190730130208.30977-1-david1.zhou@amd.com>
In-Reply-To: <20190730130208.30977-1-david1.zhou@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0186.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::30) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 53262777-cae7-485b-61db-08d714f04fcc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2423; 
x-ms-traffictypediagnostic: DM5PR12MB2423:
x-microsoft-antispam-prvs: <DM5PR12MB2423FC083E195BE10BE5EBE483DC0@DM5PR12MB2423.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(136003)(346002)(39860400002)(376002)(189003)(199004)(66946007)(31686004)(316002)(65806001)(76176011)(64756008)(71200400001)(65956001)(66476007)(229853002)(71190400001)(6506007)(386003)(58126008)(31696002)(66446008)(256004)(53936002)(186003)(6512007)(102836004)(66556008)(6486002)(52116002)(81166006)(478600001)(86362001)(99286004)(6436002)(14454004)(5660300002)(65826007)(64126003)(36756003)(6116002)(81156014)(46003)(8936002)(68736007)(11346002)(110136005)(486006)(2616005)(476003)(305945005)(8676002)(4326008)(6246003)(25786009)(7736002)(2501003)(446003)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2423;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hK3V6XCz1ims4N+ny9qqKU7+ZKcbHg9HKOeo6vpKcNY9P2LbpTKYT6ZK9iPTc2rt7bgk+ebp50TPJc6XJjOL9DXNfgWNbmH/pcge8PW+tCyu0OSE9n+7AN9HYnQLzXJf/dB51bSbeyEnlqrOQY3OpVTXCEelEII8f4VA+G/KDYdXRNnTJ6mHBON6JWeGFScy+qCDFmrEfdmWFR8NSmrrWwyagZoLa32JEiws/Hmaw1nI16frJL84Y6Mf9f+caUn86/AcEuZOnu3NxY424TiX2TDfB2lPOTLHxA+HHDvn0BN1Sebeusf5whFEohQr2KqW6+YB3BRqdvGryJrIT3qtTGeG8GBF4booMRoA3MKRXWmjK4zfF571VEVqT2ugWp2TYYodKKdJJvKVf9VgwsUzzjV+GO7DozjI0G7kBgV9Pa8=
Content-ID: <7E63A2ADF864A14A87DF6E01FDDADD5F@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53262777-cae7-485b-61db-08d714f04fcc
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 13:17:46.2437 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2423
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6mEfzahGp/2vA6HtKyG6sj3Nlo/jnp86cl/nDRstVl8=;
 b=gDzv3A6kuKMr+gIN0JSqJFILH5qcaiRtINoAbB/KvtZvuKWhGSlJkc/FTZgoTNkDs3rDtew0pHI3FD7GG0+Nk0dSFx73BfvAPvQbhT2mDAq0ZIbwkh8V6A2JGBwVRoRhma8czJq17FRK4h1X1l+q6clhLJngtFU+81mpkcxLBrU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMzAuMDcuMTkgdW0gMTU6MDIgc2NocmllYiBDaHVubWluZyBaaG91Og0KPiB1c2VyIHNwYWNl
IG5lZWRzIGEgZmxleGlhYmxlIHF1ZXJ5IGFiaWxpdHkuDQo+IFNvIHRoYXQgdW1kIGNhbiBnZXQg
bGFzdCBzaWduYWxlZCBvciBzdWJtaXR0ZWQgcG9pbnQuDQo+IHYyOg0KPiBhZGQgc2FuaXRpemVy
IGNoZWNraW5nLg0KPiB2MzoNCj4gcmViYXNlDQo+DQo+IENoYW5nZS1JZDogSTY1MTJiNDMwNTI0
ZWJhYmU3MTVlNjAyYTJiZjVhYmIwYTdlNzgwZWENCj4gU2lnbmVkLW9mZi1ieTogQ2h1bm1pbmcg
WmhvdSA8ZGF2aWQxLnpob3VAYW1kLmNvbT4NCj4gQ2M6IExpb25lbCBMYW5kd2VybGluIDxsaW9u
ZWwuZy5sYW5kd2VybGluQGludGVsLmNvbT4NCj4gQ2M6IENocmlzdGlhbiBLw7ZuaWcgPENocmlz
dGlhbi5Lb2VuaWdAYW1kLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IExpb25lbCBMYW5kd2VybGluIDxs
aW9uZWwuZy5sYW5kd2VybGluQGludGVsLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBL
w7ZuaWcgPGNyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KDQpMaW9uZWwgaXMgdGhlIEludGVsIGNv
ZGUgdXNpbmcgdGhpcyBhbHJlYWR5IHB1YmxpYz8gT3IgRGF2aWQgYW55IGNoYW5jZSANCnRoYXQg
d2UgY2FuIGdldCBhIHB1YmxpYyBhbWR2bGsgcmVsZWFzZSB1c2luZyB0aGlzPw0KDQpDaHJpc3Rp
YW4uDQoNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMgfCAzNyArKysr
KysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLQ0KPiAgIGluY2x1ZGUvdWFwaS9kcm0vZHJt
LmggICAgICAgIHwgIDMgKystDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCsp
LCAxNiBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
c3luY29iai5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMNCj4gaW5kZXggY2VjZmYy
ZTQ0N2IxLi5kNDQzMmYxNTEzYWMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
c3luY29iai5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jDQo+IEBAIC0x
MTk3LDcgKzExOTcsNyBAQCBkcm1fc3luY29ial90aW1lbGluZV9zaWduYWxfaW9jdGwoc3RydWN0
IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwNCj4gICAJaWYgKCFkcm1fY29yZV9jaGVja19m
ZWF0dXJlKGRldiwgRFJJVkVSX1NZTkNPQkpfVElNRUxJTkUpKQ0KPiAgIAkJcmV0dXJuIC1FT1BO
T1RTVVBQOw0KPiAgIA0KPiAtCWlmIChhcmdzLT5wYWQgIT0gMCkNCj4gKwlpZiAoYXJncy0+Zmxh
Z3MgIT0gMCkNCj4gICAJCXJldHVybiAtRUlOVkFMOw0KPiAgIA0KPiAgIAlpZiAoYXJncy0+Y291
bnRfaGFuZGxlcyA9PSAwKQ0KPiBAQCAtMTI2OCw3ICsxMjY4LDcgQEAgaW50IGRybV9zeW5jb2Jq
X3F1ZXJ5X2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsDQo+ICAgCWlm
ICghZHJtX2NvcmVfY2hlY2tfZmVhdHVyZShkZXYsIERSSVZFUl9TWU5DT0JKX1RJTUVMSU5FKSkN
Cj4gICAJCXJldHVybiAtRU9QTk9UU1VQUDsNCj4gICANCj4gLQlpZiAoYXJncy0+cGFkICE9IDAp
DQo+ICsJaWYgKGFyZ3MtPmZsYWdzICYgfkRSTV9TWU5DT0JKX1FVRVJZX0ZMQUdTX0xBU1RfU1VC
TUlUVEVEKQ0KPiAgIAkJcmV0dXJuIC1FSU5WQUw7DQo+ICAgDQo+ICAgCWlmIChhcmdzLT5jb3Vu
dF9oYW5kbGVzID09IDApDQo+IEBAIC0xMjg5LDI1ICsxMjg5LDMyIEBAIGludCBkcm1fc3luY29i
al9xdWVyeV9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLA0KPiAgIAkJ
ZmVuY2UgPSBkcm1fc3luY29ial9mZW5jZV9nZXQoc3luY29ianNbaV0pOw0KPiAgIAkJY2hhaW4g
PSB0b19kbWFfZmVuY2VfY2hhaW4oZmVuY2UpOw0KPiAgIAkJaWYgKGNoYWluKSB7DQo+IC0JCQlz
dHJ1Y3QgZG1hX2ZlbmNlICppdGVyLCAqbGFzdF9zaWduYWxlZCA9IE5VTEw7DQo+IC0NCj4gLQkJ
CWRtYV9mZW5jZV9jaGFpbl9mb3JfZWFjaChpdGVyLCBmZW5jZSkgew0KPiAtCQkJCWlmIChpdGVy
LT5jb250ZXh0ICE9IGZlbmNlLT5jb250ZXh0KSB7DQo+IC0JCQkJCWRtYV9mZW5jZV9wdXQoaXRl
cik7DQo+IC0JCQkJCS8qIEl0IGlzIG1vc3QgbGlrZWx5IHRoYXQgdGltZWxpbmUgaGFzDQo+IC0J
CQkJCSAqIHVub3JkZXIgcG9pbnRzLiAqLw0KPiAtCQkJCQlicmVhazsNCj4gKwkJCXN0cnVjdCBk
bWFfZmVuY2UgKml0ZXIsICpsYXN0X3NpZ25hbGVkID0NCj4gKwkJCQlkbWFfZmVuY2VfZ2V0KGZl
bmNlKTsNCj4gKw0KPiArCQkJaWYgKGFyZ3MtPmZsYWdzICYNCj4gKwkJCSAgICBEUk1fU1lOQ09C
Sl9RVUVSWV9GTEFHU19MQVNUX1NVQk1JVFRFRCkgew0KPiArCQkJCXBvaW50ID0gZmVuY2UtPnNl
cW5vOw0KPiArCQkJfSBlbHNlIHsNCj4gKwkJCQlkbWFfZmVuY2VfY2hhaW5fZm9yX2VhY2goaXRl
ciwgZmVuY2UpIHsNCj4gKwkJCQkJaWYgKGl0ZXItPmNvbnRleHQgIT0gZmVuY2UtPmNvbnRleHQp
IHsNCj4gKwkJCQkJCWRtYV9mZW5jZV9wdXQoaXRlcik7DQo+ICsJCQkJCQkvKiBJdCBpcyBtb3N0
IGxpa2VseSB0aGF0IHRpbWVsaW5lIGhhcw0KPiArCQkJCQkJKiB1bm9yZGVyIHBvaW50cy4gKi8N
Cj4gKwkJCQkJCWJyZWFrOw0KPiArCQkJCQl9DQo+ICsJCQkJCWRtYV9mZW5jZV9wdXQobGFzdF9z
aWduYWxlZCk7DQo+ICsJCQkJCWxhc3Rfc2lnbmFsZWQgPSBkbWFfZmVuY2VfZ2V0KGl0ZXIpOw0K
PiAgIAkJCQl9DQo+IC0JCQkJZG1hX2ZlbmNlX3B1dChsYXN0X3NpZ25hbGVkKTsNCj4gLQkJCQls
YXN0X3NpZ25hbGVkID0gZG1hX2ZlbmNlX2dldChpdGVyKTsNCj4gKwkJCQlwb2ludCA9IGRtYV9m
ZW5jZV9pc19zaWduYWxlZChsYXN0X3NpZ25hbGVkKSA/DQo+ICsJCQkJCWxhc3Rfc2lnbmFsZWQt
PnNlcW5vIDoNCj4gKwkJCQkJdG9fZG1hX2ZlbmNlX2NoYWluKGxhc3Rfc2lnbmFsZWQpLT5wcmV2
X3NlcW5vOw0KPiAgIAkJCX0NCj4gLQkJCXBvaW50ID0gZG1hX2ZlbmNlX2lzX3NpZ25hbGVkKGxh
c3Rfc2lnbmFsZWQpID8NCj4gLQkJCQlsYXN0X3NpZ25hbGVkLT5zZXFubyA6DQo+IC0JCQkJdG9f
ZG1hX2ZlbmNlX2NoYWluKGxhc3Rfc2lnbmFsZWQpLT5wcmV2X3NlcW5vOw0KPiAgIAkJCWRtYV9m
ZW5jZV9wdXQobGFzdF9zaWduYWxlZCk7DQo+ICAgCQl9IGVsc2Ugew0KPiAgIAkJCXBvaW50ID0g
MDsNCj4gICAJCX0NCj4gKwkJZG1hX2ZlbmNlX3B1dChmZW5jZSk7DQo+ICAgCQlyZXQgPSBjb3B5
X3RvX3VzZXIoJnBvaW50c1tpXSwgJnBvaW50LCBzaXplb2YodWludDY0X3QpKTsNCj4gICAJCXJl
dCA9IHJldCA/IC1FRkFVTFQgOiAwOw0KPiAgIAkJaWYgKHJldCkNCj4gZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvdWFwaS9kcm0vZHJtLmggYi9pbmNsdWRlL3VhcGkvZHJtL2RybS5oDQo+IGluZGV4IDY2
MWQ3M2Y5YTkxOS4uZmQ5ODdjZTI0ZDlmIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJt
L2RybS5oDQo+ICsrKyBiL2luY2x1ZGUvdWFwaS9kcm0vZHJtLmgNCj4gQEAgLTc3NywxMSArNzc3
LDEyIEBAIHN0cnVjdCBkcm1fc3luY29ial9hcnJheSB7DQo+ICAgCV9fdTMyIHBhZDsNCj4gICB9
Ow0KPiAgIA0KPiArI2RlZmluZSBEUk1fU1lOQ09CSl9RVUVSWV9GTEFHU19MQVNUX1NVQk1JVFRF
RCAoMSA8PCAwKSAvKiBsYXN0IGF2YWlsYWJsZSBwb2ludCBvbiB0aW1lbGluZSBzeW5jb2JqICov
DQo+ICAgc3RydWN0IGRybV9zeW5jb2JqX3RpbWVsaW5lX2FycmF5IHsNCj4gICAJX191NjQgaGFu
ZGxlczsNCj4gICAJX191NjQgcG9pbnRzOw0KPiAgIAlfX3UzMiBjb3VudF9oYW5kbGVzOw0KPiAt
CV9fdTMyIHBhZDsNCj4gKwlfX3UzMiBmbGFnczsNCj4gICB9Ow0KPiAgIA0KPiAgIA0KDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
