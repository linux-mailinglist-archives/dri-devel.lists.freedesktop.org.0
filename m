Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEFE73C18
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 22:06:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08DC46E649;
	Wed, 24 Jul 2019 20:06:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680054.outbound.protection.outlook.com [40.107.68.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7583C6E649;
 Wed, 24 Jul 2019 20:06:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RxeWqew+8TR2IsOfV1QGZ130U6N0NbEKndw+PBCu9X+COaKFMsHsDFE1bLp6z/hJww1LOMFqJtasOtls5hhg5kHu57h7fhVFsVsPXPVhHl/Al/56E6on5DCTQUb2Im3nU30UOtnU679phEDRbxIkUW3iQCRESo3mg0Oz9tpWz+K3TmIdTMCrdipl5jYho+PFBo+YThVGo+3bExHJWBnUK0QblQC/lprngzaG11oL95345Cw47fDdpDF2V3iqkUxbR75zNsgZ4STcHcBluhzw4eXED9zWHXH/Vs/mzUNOHe6V4WHIaFuqFVNKFuzLq1zpnGFLzNvollp2y6TDMXiNHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OU3YklvKh/91LJce/zFQVOqD0g+r+Hirt1QKc4sSt3g=;
 b=jy4hgpM/Ysxn8maR0tfGElwKi5bidNDsRrb6Wmr5kFCdG2wAYHobap8PQ6IcweDTaawhWyEW51Dk1q82D12jiNxxfswpqq7O+F364MnhN9ZTAaqV8YGzsdtWuOjyR5YVdgWtq0bG+yxIB1EJ8izjY1Pk7CfswH7sne64pXAOsIy3WfKw9D1PkfL3Ri0UutV7+U1V8lct7sUwBQyWci74DliuXIcQ135iFAzdxOewmdT3wZerSvZERfCEOJNXu1tB9v91N16O9QOusW130omPHp6HS8sQW5thQ1pV/FNEfSVAuJMElTzcz+Lvi/6nXFnd7ytU/k8QyLzt7kK9RsLbQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BYAPR12MB2853.namprd12.prod.outlook.com (20.179.90.150) by
 BYAPR12MB3301.namprd12.prod.outlook.com (20.179.93.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Wed, 24 Jul 2019 20:06:14 +0000
Received: from BYAPR12MB2853.namprd12.prod.outlook.com
 ([fe80::dd9c:e1c8:face:eaa9]) by BYAPR12MB2853.namprd12.prod.outlook.com
 ([fe80::dd9c:e1c8:face:eaa9%6]) with mapi id 15.20.2115.005; Wed, 24 Jul 2019
 20:06:14 +0000
From: "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>
To: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 9/9] drm/amd/display: Implement MST Aux device registration
Thread-Topic: [PATCH 9/9] drm/amd/display: Implement MST Aux device
 registration
Thread-Index: AQHVQa55Tbyb5hueUECi1qoeuYDF+6baMvMAgAAAKwA=
Date: Wed, 24 Jul 2019 20:06:14 +0000
Message-ID: <10049e34-8101-f33d-a3f1-133af41543ab@amd.com>
References: <20190723232808.28128-1-sunpeng.li@amd.com>
 <20190723232808.28128-10-sunpeng.li@amd.com>
 <476bc8a8-f151-867e-4c08-5d32977933b1@amd.com>
In-Reply-To: <476bc8a8-f151-867e-4c08-5d32977933b1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0050.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::27) To BYAPR12MB2853.namprd12.prod.outlook.com
 (2603:10b6:a03:12c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b06ecf06-5eb8-4d55-53f9-08d71072617e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3301; 
x-ms-traffictypediagnostic: BYAPR12MB3301:
x-microsoft-antispam-prvs: <BYAPR12MB3301DF19601F93E023D54ED782C60@BYAPR12MB3301.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(39860400002)(346002)(136003)(376002)(189003)(199004)(68736007)(3846002)(86362001)(316002)(6116002)(110136005)(99286004)(81166006)(31696002)(446003)(6486002)(31686004)(54906003)(2201001)(386003)(11346002)(6506007)(6246003)(186003)(76176011)(4326008)(102836004)(25786009)(26005)(2501003)(52116002)(66446008)(53546011)(476003)(66946007)(66556008)(64756008)(6512007)(6436002)(53936002)(2616005)(8936002)(2906002)(7736002)(14454004)(229853002)(66476007)(486006)(305945005)(66066001)(5660300002)(478600001)(71190400001)(71200400001)(14444005)(8676002)(36756003)(256004)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3301;
 H:BYAPR12MB2853.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rFmcHxpSTTWB/AhUv+SFSJKBoYm0GjaYfsGVI+aDODMxobhw+RSDShasgKDcbo1/87QlGILcaGbunDg0/qjfGtdZGE4HjfFrU2Fh1Nl+0zK32ZphC8s7ykrL0biQz524u8y+L5jj14ZvfpqHhekGiCxeWIJ00aDMqvTHOhKH4BEfKgrUzvEUU+Jcpr6RhazVcNyQsyl/aQZqvwJK3eTN4XCQN5XaRz0GYcYKn62d1fVAP5DHR5+hflOeRRqvYY/i+GwHQYjRWEkdK8QkLv2GD/NNVwK08lN8bHlG37BEUH6U3mitKWopsfpJYOUTKrnBSeeYS03kTaJl+TRVEMK46XRvmNEXKztl+UNPaDN2iwdlX20W4eYRLG71/CaT2S+RNDus8IgXD4bq9MNP1WBtRkEk+Pu8IHHEfNyXGx/Zos0=
Content-ID: <D97B1E440660204CA155DC3390FE54D4@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b06ecf06-5eb8-4d55-53f9-08d71072617e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2019 20:06:14.6098 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sunli1@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3301
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OU3YklvKh/91LJce/zFQVOqD0g+r+Hirt1QKc4sSt3g=;
 b=hDE6qxiy7iezODEjmoTbhUNlvuNTP9yrMKL48WsXG9wd5uEkT03BVpRNy/pUslXb1IJt5OsHsgaaRzFjmXeV20KoQUn+jO8ma8JumT88kKbd7itM4dV674Axm//6u9qE4wSug5CnUF2Yyl2TZfJXqyjdpfLTfcW87u8Agz4+pLk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Sunpeng.Li@amd.com; 
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

DQoNCk9uIDIwMTktMDctMjQgNDowNSBwLm0uLCBLYXpsYXVza2FzLCBOaWNob2xhcyB3cm90ZToN
Cj4gT24gNy8yMy8xOSA3OjI4IFBNLCBzdW5wZW5nLmxpQGFtZC5jb20gd3JvdGU6DQo+PiBGcm9t
OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4NCj4+DQo+PiBJbXBsZW1lbnQgbGF0ZV9yZWdp
c3RlciBhbmQgZWFybHlfdW5yZWdpc3RlciBob29rcyBmb3IgTVNUIGNvbm5lY3RvcnMuDQo+PiBD
YWxsIGRybSBoZWxwZXJzIGZvciBNU1QgY29ubmVjdG9yIHJlZ2lzdHJhdGlvbiwgd2hpY2ggcmVn
aXN0ZXJzIHRoZQ0KPj4gQVVYIGRldmljZXMuDQo+Pg0KPj4gQ2M6IEplcnJ5IFp1byA8SmVycnku
WnVvQGFtZC5jb20+DQo+PiBDYzogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1
c2thc0BhbWQuY29tPg0KPj4gQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQu
Y29tPg0KPj4gU2lnbmVkLW9mZi1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+DQo+IA0K
PiBSZXZpZXdlZC1ieTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0Bh
bWQuY29tPg0KPiANCj4gQlRXOiBJIGFscmVhZHkgcmV2aWV3ZWQgcGF0Y2ggNSwgZmVlbCBmcmVl
IHRvIGFkZCBteSBSLUIuDQo+IA0KPiBOaWNob2xhcyBLYXpsYXVza2FzDQoNClNvcnJ5LCB3aWxs
IGRvLg0KDQpUaGFua3MhDQpMZW8NCg0KPiANCj4+IC0tLQ0KPj4gICAuLi4vZGlzcGxheS9hbWRn
cHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5jICAgfCAyNCArKysrKysrKysrKysrKysrKystDQo+
PiAgIDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+Pg0K
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtX21zdF90eXBlcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9k
bS9hbWRncHVfZG1fbXN0X3R5cGVzLmMNCj4+IGluZGV4IDUzZDJjZmU2MmUxMy4uMTYyMThhMjAy
YjU5IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9k
bS9hbWRncHVfZG1fbXN0X3R5cGVzLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5jDQo+PiBAQCAtMTU2LDYgKzE1Niwy
NiBAQCBkbV9kcF9tc3RfY29ubmVjdG9yX2Rlc3Ryb3koc3RydWN0IGRybV9jb25uZWN0b3IgKmNv
bm5lY3RvcikNCj4+ICAgCWtmcmVlKGFtZGdwdV9kbV9jb25uZWN0b3IpOw0KPj4gICB9DQo+PiAg
IA0KPj4gK3N0YXRpYyBpbnQNCj4+ICthbWRncHVfZG1fbXN0X2Nvbm5lY3Rvcl9sYXRlX3JlZ2lz
dGVyKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpDQo+PiArew0KPj4gKwlzdHJ1Y3Qg
YW1kZ3B1X2RtX2Nvbm5lY3RvciAqYW1kZ3B1X2RtX2Nvbm5lY3RvciA9DQo+PiArCQl0b19hbWRn
cHVfZG1fY29ubmVjdG9yKGNvbm5lY3Rvcik7DQo+PiArCXN0cnVjdCBkcm1fZHBfbXN0X3BvcnQg
KnBvcnQgPSBhbWRncHVfZG1fY29ubmVjdG9yLT5wb3J0Ow0KPj4gKw0KPj4gKwlyZXR1cm4gZHJt
X2RwX21zdF9jb25uZWN0b3JfbGF0ZV9yZWdpc3Rlcihjb25uZWN0b3IsIHBvcnQpOw0KPj4gK30N
Cj4+ICsNCj4+ICtzdGF0aWMgdm9pZA0KPj4gK2FtZGdwdV9kbV9tc3RfY29ubmVjdG9yX2Vhcmx5
X3VucmVnaXN0ZXIoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikNCj4+ICt7DQo+PiAr
CXN0cnVjdCBhbWRncHVfZG1fY29ubmVjdG9yICphbWRncHVfZG1fY29ubmVjdG9yID0NCj4+ICsJ
CXRvX2FtZGdwdV9kbV9jb25uZWN0b3IoY29ubmVjdG9yKTsNCj4+ICsJc3RydWN0IGRybV9kcF9t
c3RfcG9ydCAqcG9ydCA9IGFtZGdwdV9kbV9jb25uZWN0b3ItPnBvcnQ7DQo+PiArDQo+PiArCWRy
bV9kcF9tc3RfY29ubmVjdG9yX2Vhcmx5X3VucmVnaXN0ZXIoY29ubmVjdG9yLCBwb3J0KTsNCj4+
ICt9DQo+PiArDQo+PiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9mdW5jcyBk
bV9kcF9tc3RfY29ubmVjdG9yX2Z1bmNzID0gew0KPj4gICAJLmRldGVjdCA9IGRtX2RwX21zdF9k
ZXRlY3QsDQo+PiAgIAkuZmlsbF9tb2RlcyA9IGRybV9oZWxwZXJfcHJvYmVfc2luZ2xlX2Nvbm5l
Y3Rvcl9tb2RlcywNCj4+IEBAIC0xNjQsNyArMTg0LDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBk
cm1fY29ubmVjdG9yX2Z1bmNzIGRtX2RwX21zdF9jb25uZWN0b3JfZnVuY3MgPSB7DQo+PiAgIAku
YXRvbWljX2R1cGxpY2F0ZV9zdGF0ZSA9IGFtZGdwdV9kbV9jb25uZWN0b3JfYXRvbWljX2R1cGxp
Y2F0ZV9zdGF0ZSwNCj4+ICAgCS5hdG9taWNfZGVzdHJveV9zdGF0ZSA9IGRybV9hdG9taWNfaGVs
cGVyX2Nvbm5lY3Rvcl9kZXN0cm95X3N0YXRlLA0KPj4gICAJLmF0b21pY19zZXRfcHJvcGVydHkg
PSBhbWRncHVfZG1fY29ubmVjdG9yX2F0b21pY19zZXRfcHJvcGVydHksDQo+PiAtCS5hdG9taWNf
Z2V0X3Byb3BlcnR5ID0gYW1kZ3B1X2RtX2Nvbm5lY3Rvcl9hdG9taWNfZ2V0X3Byb3BlcnR5DQo+
PiArCS5hdG9taWNfZ2V0X3Byb3BlcnR5ID0gYW1kZ3B1X2RtX2Nvbm5lY3Rvcl9hdG9taWNfZ2V0
X3Byb3BlcnR5LA0KPj4gKwkubGF0ZV9yZWdpc3RlciA9IGFtZGdwdV9kbV9tc3RfY29ubmVjdG9y
X2xhdGVfcmVnaXN0ZXIsDQo+PiArCS5lYXJseV91bnJlZ2lzdGVyID0gYW1kZ3B1X2RtX21zdF9j
b25uZWN0b3JfZWFybHlfdW5yZWdpc3RlciwNCj4+ICAgfTsNCj4+ICAgDQo+PiAgIHN0YXRpYyBp
bnQgZG1fZHBfbXN0X2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQ0K
Pj4NCj4gDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
