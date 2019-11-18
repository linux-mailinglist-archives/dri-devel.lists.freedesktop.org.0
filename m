Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BED98100A2E
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 18:25:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82F336E783;
	Mon, 18 Nov 2019 17:25:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750087.outbound.protection.outlook.com [40.107.75.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 877B76E783;
 Mon, 18 Nov 2019 17:25:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nnZbipoQE95xpee/d74Zq9HyK2BF7//dWEhI+qSPIdfqSvyxxYJ1lhwpms5R+mm74g3grv9bcQCWrFNWFp1Ic88zJXXLoqSrmPy1w1vyD4WyFiyZcEkOEdDrMCL+Z+JJaG+SDMPpEl0TssZ8AemsdW6WrgNV6uDAoN5LYTAFw+1VsDFDgIIWdmteAupZULSQ+2E2AkvOV5XVaYEFmPQoTxtRB8cw68/L4PB4LpZrQt6ecXccOCcnmxLSRUbR2Oxw7qOBvppOuo1vdXOmAaz7+2u6vCl63GmmO5hdyLMa5IZuXQtmTkVlVmTS2nxAOsx0bexeKLiK63mcxRebWJ5JQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mx0oHV3mdx0gIjP2XqehLF8bXqPSYSxoAVDbaHhUVmA=;
 b=CEGSheO2ne/X66uKHqyahS+Qb8Ojg/DSKSNRxYpJLcaJB80jTV6u7AQ0CdCQZEjlB9xmUs/nC6f5MFbQx6QGENje8aEVxSChh5+LaBE4SU+JfkMM48D0TQ3j09X0c7gp5z7tUKDwAL/hUucgFlhRhQsoDU98BaLrt6I7Rwofk628JZYjDjVHjvd5DtMqovmqErejGFGXXw54tFe5ebhz0HYnul2q1eolz47ey1btpw40ao7oFa1KTVDvPlyZfDlBp6ENR+YhWx+yjrR78fZh/qutTJrmZBcs/opORvWCJ0R+OCEpy+Mdqi1fkcvRKrcdKlQqf7Z9dB1l4J0ZTLK9QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
Received: from MN2PR05MB6141.namprd05.prod.outlook.com (20.178.241.217) by
 MN2PR05MB6911.namprd05.prod.outlook.com (52.135.37.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.7; Mon, 18 Nov 2019 17:25:12 +0000
Received: from MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::fc6c:1ed8:d63d:4dc8]) by MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::fc6c:1ed8:d63d:4dc8%5]) with mapi id 15.20.2474.012; Mon, 18 Nov 2019
 17:25:12 +0000
From: Thomas Hellstrom <thellstrom@vmware.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 10/15] drm/vmwgfx: Delete mmaping functions
Thread-Topic: [PATCH 10/15] drm/vmwgfx: Delete mmaping functions
Thread-Index: AQHVnfv3fSEAyCCMnUK2g//cEGfdD6eRLkuA
Date: Mon, 18 Nov 2019 17:25:12 +0000
Message-ID: <4949ad6873cf75db0622499f47fb849a5463bb13.camel@vmware.com>
References: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
 <20191118103536.17675-11-daniel.vetter@ffwll.ch>
In-Reply-To: <20191118103536.17675-11-daniel.vetter@ffwll.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [155.4.205.35]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5d1afe19-676f-441c-8c89-08d76c4c44d3
x-ms-traffictypediagnostic: MN2PR05MB6911:|MN2PR05MB6911:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR05MB69115FD6EEA558A3DC963FBDA14D0@MN2PR05MB6911.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0225B0D5BC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(346002)(39860400002)(396003)(366004)(189003)(199004)(66946007)(186003)(66476007)(81156014)(64756008)(66556008)(66446008)(81166006)(86362001)(5660300002)(256004)(8936002)(4326008)(229853002)(118296001)(5024004)(26005)(6246003)(7736002)(14454004)(305945005)(6506007)(102836004)(71190400001)(2501003)(6512007)(8676002)(76116006)(25786009)(2616005)(6116002)(478600001)(476003)(91956017)(446003)(71200400001)(4744005)(3846002)(11346002)(99286004)(110136005)(4001150100001)(2906002)(66066001)(54906003)(316002)(6436002)(76176011)(486006)(36756003)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR05MB6911;
 H:MN2PR05MB6141.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4Z0j8tU1Cpn/v41V3UEnlSl3lxUtCsETgj+K9JYLt+LQX/t+xjoFa0iQpJU5eU0WJDegfugQvBqZbvGRks0j63Jz3Nc1++vGtYpJ3TS4Bn3lPzgw4AccuAzmZhcttUYFfmtJsTwewWpIWV0zR71yXpelmUdkRW7LAL1prSUIHwfSeUsscslzYBxPySU8TLaC7l9sfPMWMSKiSh2ULzsF630MP5KAFX0I3LpLX+QxJ/U/n2OV/VGH/FP2+VUQ5jMFxMwR9ix+zZWCHGuRNmD+wQecKTf8wP2Ir1hBiZAIBOms9ydVaILL1A6QnSgKlnzKD5CXvkn4VlGSi3wt24Jo/4m8paXex/O1F7dKX3FIr6lx16DruB4bLrQa7ijLbVm84aDooIDvB1lxm55RZN0fu+CFdiRp7utBs6rPxlk0wX5WYaZtL4nk/rkgJYpkLHYJ
Content-ID: <A1692BE0B7D9B142834CE495BBD1A203@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d1afe19-676f-441c-8c89-08d76c4c44d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2019 17:25:12.2964 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1MAIM1s0jF5hHlOAbdlDiZZ4M9jrdpLKeyrFnYermJa0QkhZMg6mIUQr/oPk4G9JzVS0Smrbf28aTIAsQ+5nNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6911
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vmware.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mx0oHV3mdx0gIjP2XqehLF8bXqPSYSxoAVDbaHhUVmA=;
 b=b0XxOuhaOfRqG3RwQa9896GuEpjy4KppglNRcDWwXp/w15UT63T8rxQV4CFkD6Svl5wSRwROCMV1+rM1RDb62kVA2ILZRJeBH2WM4vubNHTpEy3n4Pc0rdqOjhmcwyjJbEDA7YbYoF5uh4BgTbW2n9vJh/+ZosTvC6K29oDdEVE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=thellstrom@vmware.com; 
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
Cc: "daniel.vetter@intel.com" <daniel.vetter@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDE5LTExLTE4IGF0IDExOjM1ICswMTAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOg0K
PiBObyBuZWVkIGZvciBzdHVicywgZG1hLWJ1Zi5jIHRha2VzIGNhcmUgb2YgdGhhdC4NCj4gDQo+
IEFzaWRlLCBub3QgaGF2aW5nIGEgLT5yZWxlYXNlIGNhbGxiYWNrIHNtZWxsZWQgbGlrZSByZWZj
b3VudGluZyBsZWFrDQo+IHNvbWV3aGVyZS4gSXQgd2lsbCBhbHNvIHNjb3JlIHlvdSBhIFdBUk5f
T04gYmFja3RyYWNlIGluIGRtYS1idWYuYyBvbg0KPiBldmVyeSBleHBvcnQuIEJ1dCB0aGVuIEkg
Zm91bmQgdGhhdCB0dG1fZGV2aWNlX29iamVjdF9pbml0IG92ZXJ3cml0ZXMNCj4gaXQuIE92ZXJ3
cml0aW5nIGNvbnN0IG1lbW9yeSBpcyBub3QgZ29pbmcgdG8gZ28gZG93biB3ZWxsIGluIHJlY2Vu
dA0KPiBrZXJuZWxzLg0KDQpJdCdzIGFjdHVhbGx5IHRha2luZyBhIG5vbi1jb25zdCBjb3B5IGFu
ZCB1cGRhdGluZyBpdC4gTm90IHRoYXQgdGhhdCdzDQptdWNoIGJldHRlciwgYnV0IGF0IGxlYXN0
IGl0IHdvbid0IGNyYXNoIGR1ZSB0byB3cml0aW5nIHRvIHdwIG1lbW9yeS4NCkknbGwgYWRkIGEg
YmFja2xvZyBpdGVtIHRvIHJldmlzaXQgdGhpcy4NCg0KPiANCj4gT25lIG1vcmUgYXNpZGU6IFRo
ZSAodW4pbWFwX2RtYV9idWYgY2FuJ3QgZXZlciBiZSBjYWxsZWQgYmVjYXVzZQ0KPiAtPmF0dGFj
aCByZWplY3RzIGV2ZXJ5dGhpbmcuIE1pZ2h0IHdhbnQgdG8gZHJvcCBhIEJVR19PTigxKSBpbiB0
aGVyZS4NCj4gU2FtZSBmb3IgLT5kZXRhY2guDQoNCkFuZCB0aGlzLg0KDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4NCj4gQ2M6IFZN
d2FyZSBHcmFwaGljcyA8bGludXgtZ3JhcGhpY3MtbWFpbnRhaW5lckB2bXdhcmUuY29tPg0KPiBD
YzogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPg0KPiAtLS0NCj4gDQoN
Cg0KUmV2aWV3ZWQtYnk6IFRob21hcyBIZWxsc3Ryb20gPHRoZWxsc3Ryb21Adm13YXJlLmNvbT4N
Cg0KV2lsbCB5b3UgYmUgdGFraW5nIHRoaXMgdGhyb3VnaCBkcm0tbWlzYz8NCg0KVGhhbmtzLA0K
VGhvbWFzDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
