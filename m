Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0DD719DC
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 16:01:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 777116E2A9;
	Tue, 23 Jul 2019 14:01:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700049.outbound.protection.outlook.com [40.107.70.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 870736E2A9;
 Tue, 23 Jul 2019 14:01:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f+Teo2fl0o1LVdydacvGkRZPmilTzpyO6Wacejic8cJ4hrjbi1k3IN9pxMyd71MNwAvJJGro8LkSwBDPUCPtQy+hfGkxJ4RiboYLMKZqtKLzpoHanT2YXm41fpzM71v+jw+wxCdXqLFRzt0WvpTn1Htil8yTkhTPgwKGzXhbf9k3n2ARvEP4ckrlYTjDXJrnRu3jnfC8h2KGPRejcoKO0pJbVMRWObWGYZlY6g9XhukB7hdCP0Mrhtt0dnE5VcePTbYYQQ9iUUqRi7o+DnnPtn/OhH4bFB1fY/dzCo7QCzJ47qF12M5DS+5c635OSo7a0zrRJzpQEAsGC0uu4Zzu5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XxaF6gys5QHGvx5W5Wy8y/Gg0BD8g7b3PIkPSVEVbQM=;
 b=Jf/oEmZoW+X1Lxq4sJ+cT6chQoBXQlOu2UnhbD2LSrpVIk8WZw9pcCBV/Aqbw01eMEXRvwh9FdUNRM/4aIRwHgSG77CfkfpdaVEn+KRlzx6bgRwNVMobvxgJa13MY7lBStA4e0cxC3so39v/HDLcr6EoGKm6txBho1h7t7p/yQLY9/LhZZp5kfzeHqCyeS+NTXyudIArUYItH5+QuPe7RCDyH4Ec31IM1Cw8wavNOPC5YI0eG2Qcxl7/qahsFI8PqPCKKcYpqLyG9QIU8wG+QOpok52/7MYdEkzuUlq2T3JILZiZOnQMF3wP/nrDd2D1EA3T4a7wIaaSn1GaYptOXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BYAPR12MB2853.namprd12.prod.outlook.com (20.179.90.150) by
 BYAPR12MB3640.namprd12.prod.outlook.com (20.178.54.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Tue, 23 Jul 2019 14:01:20 +0000
Received: from BYAPR12MB2853.namprd12.prod.outlook.com
 ([fe80::dd9c:e1c8:face:eaa9]) by BYAPR12MB2853.namprd12.prod.outlook.com
 ([fe80::dd9c:e1c8:face:eaa9%6]) with mapi id 15.20.2094.013; Tue, 23 Jul 2019
 14:01:20 +0000
From: "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>
To: =?utf-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Lyude
 Paul <lyude@redhat.com>
Subject: Re: [PATCH 07/10] drm/i915: Implement MST Aux device registration
Thread-Topic: [PATCH 07/10] drm/i915: Implement MST Aux device registration
Thread-Index: AQHVMpue0bxrzZVhkUquATZr0xOamKbHcHOAgAAEx4CAAAKjgIAQ4QqA
Date: Tue, 23 Jul 2019 14:01:20 +0000
Message-ID: <c7c47828-cabb-f176-f480-d10335913bdd@amd.com>
References: <20190704190519.29525-1-sunpeng.li@amd.com>
 <20190704190519.29525-8-sunpeng.li@amd.com>
 <5673f815f4bc01b5d88961a1c087bed2e84ad466.camel@redhat.com>
 <20190712200559.GN5942@intel.com> <20190712201525.GO5942@intel.com>
In-Reply-To: <20190712201525.GO5942@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0060.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::37) To BYAPR12MB2853.namprd12.prod.outlook.com
 (2603:10b6:a03:12c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d9ed00c3-d5e3-486c-954a-08d70f763d2a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3640; 
x-ms-traffictypediagnostic: BYAPR12MB3640:
x-microsoft-antispam-prvs: <BYAPR12MB364005E0620D29B13E9D321382C70@BYAPR12MB3640.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:494;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(366004)(39860400002)(136003)(189003)(199004)(81156014)(66066001)(71190400001)(6246003)(53546011)(386003)(6116002)(6506007)(3846002)(316002)(6436002)(66476007)(66946007)(64756008)(7736002)(305945005)(6512007)(76176011)(66556008)(4326008)(66446008)(256004)(5024004)(6486002)(14444005)(14454004)(26005)(186003)(476003)(2906002)(71200400001)(102836004)(486006)(8936002)(54906003)(86362001)(229853002)(8676002)(31696002)(110136005)(68736007)(36756003)(446003)(25786009)(478600001)(99286004)(31686004)(81166006)(53936002)(2616005)(52116002)(11346002)(5660300002)(66574012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3640;
 H:BYAPR12MB2853.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3vA+BKEyQt2A1ggt9OOCwx5qiKksdh8tCnhnc3te3OqL9NhDApWwsxugIBjqP4t2a6UjO7031/s6ozbq+8F2Z98S3l5JBdsvgVDs+pd2grLRkclF8VzAr+Ezn2LXkupeAOi3ZCqva0esk7XTUkswm7BPQnzxn/pcK3Cs6PMDkTIRAyaoaHyiJSmnOH3QaOMrmtBdnFaF+nvRYIqbR9y/ljMCNXpWNSHgHEC+whc2+Vt79WzqQe3DOfU6Ebm/H5GehYD6utaeMpGsGUm4bj1P74dbBiS46rmFj+Akqry66tKqtKPuKzwEBaKwiVYUTMi+on9vNKqI5xDXq1rdfaKXfOlClhWSNvnWBJSyTLlyPuRumnJg+gP8IlquoI/nwimPAsZ2MaFDfeTmc2UVF2pjz9I78gw4CNs1q+O46HsgI/A=
Content-ID: <532ECEFAF17DC0479277A30B5319C28C@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9ed00c3-d5e3-486c-954a-08d70f763d2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 14:01:20.5821 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sunli1@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3640
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XxaF6gys5QHGvx5W5Wy8y/Gg0BD8g7b3PIkPSVEVbQM=;
 b=laBptcWLS1A21ZTsjuzy91MsoFvUqc7x2ubOCykKItbuauVgObJjfMCuHf5s+668IfmA7M2+xoHfXrxjvm9tETP+XteNZEb68c8JrT9he/u/6V0ftQWYCpi1Vd/1MyKKXx+C87lxrEki5APolrc1h/bP2gC+nSuE9B/AS8qfm4s=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <sean@poorly.run>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCk9uIDIwMTktMDctMTIgNDoxNSBwLm0uLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6DQo+IE9u
IEZyaSwgSnVsIDEyLCAyMDE5IGF0IDExOjA1OjU5UE0gKzAzMDAsIFZpbGxlIFN5cmrDpGzDpCB3
cm90ZToNCj4+IE9uIEZyaSwgSnVsIDEyLCAyMDE5IGF0IDAzOjQ4OjUzUE0gLTA0MDAsIEx5dWRl
IFBhdWwgd3JvdGU6DQo+Pj4gQlRXLCBJIGp1c3QgdHJpZWQgdGhlc2UgcGF0Y2hlcyBvbiBteSBU
NDUwcyAodXNpbmcgaTkxNSkgYW5kIEknbSBzZWVpbmcgc29tZQ0KPj4+IGtlcm5lbCB3YXJuaW5n
cyB3aXRoIHRoZW0gd2hlbiBhZGRpbmcgRFAgYXV4IGRldmljZXMgYWZ0ZXIgY29ubmVjdGluZyBh
IG5ldw0KPj4+IE1TVCB0b3BvbG9neSB0byB0aGUgc3lzdGVtOiANCj4+Pg0KPj4+IFsgIDM2Ny43
NDI1NzFdIFdBUk5JTkc6IENQVTogMiBQSUQ6IDQ0MiBhdCBkcml2ZXJzL2dwdS9kcm0vZHJtX21v
ZGVfb2JqZWN0LmM6NDUgX19kcm1fbW9kZV9vYmplY3RfYWRkKzB4YWEvMHhiMCBbZHJtXQ0KPj4N
Cj4+IExvb2tzIGxpa2UgRGFuaWVsIGFkZGVkIHRoYXQgcGFydGljdWxhciBXQVJOIGluDQo+PiBj
b21taXQgNGY1MzY4YjU1NDFhICAoImRybS9rbXM6IENhdGNoIG1vZGVfb2JqZWN0IGxpZmV0aW1l
IGVycm9ycyIpLg0KPiANCj4gQW5kIEknbSB0aGUgb25lIHdobyBhZGRlZCB0aGUgbWF4X2JwYyBw
cm9wIHRvIHRoZSBtc3QgY29ubmVjdG9ycywgd2hpY2gNCj4gaXMgYSBwZXItY29ubmVjdG9yIHBy
b3BlcnR5IChpZS4gYSBuZXcgb25lIGdldHMgY3JlYXRlZCBmb3IgZXZlcnkNCj4gY29ubmVjb3Rv
cikuIFNvIHRoYXQgY291bGQgYmUgYSBwcm9ibGVtIEkgc3VwcG9zZS4gSSBndWVzcyB3ZSBtYXkg
bmVlZA0KPiB0byBjcmVhdGUganVzdCBvbmUgb2YgdGhlc2UgZm9yIE1TVCBhbmQgcmV1c2UgaXQg
Zm9yIGV2ZXJ5IGNvbm5lY3Rvci4NCj4gQ291bGQganVzdCBwb2ludCBhdCB0aGUgcHJvcCBvZiB0
aGUgY29ycmVzcG9uZGluZyBTU1QgY29ubmVjdG9yIEkNCj4gc3VwcG9zZS4uLg0KPiANCj4gKyAg
ICAgICAvKiBSZXVzZSB0aGUgcHJvcCBiZWNhdXNlIGJsYWggKi8NCj4gKyAgICAgICBjb25uZWN0
b3ItPm1heF9icGNfcHJvcGVydHkgPQ0KPiArICAgICAgICAgICAgICAgaW50ZWxfZHAtPmF0dGFj
aGVkX2Nvbm5lY3Rvci0+YmFzZS5tYXhfYnBjX3Byb3BlcnR5Ow0KPiAgICAgICAgIGRybV9jb25u
ZWN0b3JfYXR0YWNoX21heF9icGNfcHJvcGVydHkoY29ubmVjdG9yLCA2LCAxMik7DQoNCkknZCBw
cmVmZXIgdG8gYWRkcmVzcyB0aGlzIHNlcGFyYXRlbHksIGlmIHRoYXQncyBhbHJpZ2h0Lg0KSXQg
aXNuJ3QgcmVsYXRlZCB0byB0aGlzIHNlcmllcywgYW5kIG5vIG5ldyB3YXJuaW5ncyBhcmUgaW50
cm9kdWNlZCBieQ0KdGhpcyBlaXRoZXIuDQoNCkxlbw0KDQo+IA0KPiANCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
