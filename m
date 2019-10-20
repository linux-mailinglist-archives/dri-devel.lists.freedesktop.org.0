Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0696DDED7
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2019 16:21:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CAB889A4E;
	Sun, 20 Oct 2019 14:21:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760045.outbound.protection.outlook.com [40.107.76.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B92989A4B;
 Sun, 20 Oct 2019 14:21:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AZuS58NbGbQWhi2Mrp9v8mHma93Wolu4AesMmFFto4wz/VuTXNhADAfVyncztB0v0SS/099wzOEvc0r4U+4IQAXv3hutfzLpvI6vO+toueAWBeGkx/ApG2KVg1di7hwwQCAN+rpmjUodQ6OWG3QpKQDLyZLLHE+1Mec6XudX+LM/8Hc1F380fGekaKceDnk0ZDS0UdZvigXATteKuLDzbXLVYQs7H6ccIrdIek5Tux6RZBPUfFH4uGeF8wwhc1ttiovThJBRkmcvIdjannt0BvxS4yq/YfDKPQemJTTnXwibXKHj/pYB7l4ULI+01Iw9TKbmjSVHTeOScj7wmCQcZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQeuR1xwFwAFvupXZc2JLSwvQQYlfNo3w1GfJbRgu0A=;
 b=A6j2Mu1rXp3dSWtw8FjHa39SiIT4+rFcsIqperWDRm9RkuxX1Ee+v+ZH2RbrT0Et2YkRPkzd/CQTRbEkLRk/1WJ7f2mwpOZnCYLKj59UguHKQGm7Jpx9nX05j60DIkR2FifwFXIGey1m2j95ycYgw6a/JQy8PqxBTqSFQZft28QmjSiIzlCV3rUhxX+2HYft4tEiFka9F0zsAcOsuRmFjV4zwVmaL1wsAIEvOHb8/d/mRgr3zuPC/Exk4maPIsCKGGh/CeNMSdjY6Vy+ZZYRrCPtWQwEL7pMYEEpZWoazT+X01eh6CJMIbey/jGD6cgZ5OiW5RrVjfKdp1n7Fyf/Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1276.namprd12.prod.outlook.com (10.168.239.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.20; Sun, 20 Oct 2019 14:21:43 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::7428:f6b3:a0b1:a02e]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::7428:f6b3:a0b1:a02e%10]) with mapi id 15.20.2347.028; Sun, 20 Oct
 2019 14:21:43 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [PATCH hmm 00/15] Consolidate the mmu notifier interval_tree and
 locking
Thread-Topic: [PATCH hmm 00/15] Consolidate the mmu notifier interval_tree and
 locking
Thread-Index: AQHVg4Sqa7CCxCToXEeTrrYAqVQVhqdc+JgAgAB3OACAARovgIAAficAgAAF3YCAAdJKAIACvAUA
Date: Sun, 20 Oct 2019 14:21:42 +0000
Message-ID: <f7e34d8f-f3b0-b86d-7388-1f791674a4a9@amd.com>
References: <20191015181242.8343-1-jgg@ziepe.ca>
 <bc954d29-388b-9e29-f960-115ccc6b9fea@gmail.com>
 <20191016160444.GB3430@mellanox.com>
 <2df298e2-ee91-ef40-5da9-2bc1af3a17be@gmail.com>
 <2046e0b4-ba05-0683-5804-e9bbf903658d@amd.com>
 <d6bcbd2a-2519-8945-eaf5-4f4e738c7fa9@amd.com>
 <20191018203608.GA5670@mellanox.com>
In-Reply-To: <20191018203608.GA5670@mellanox.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM0PR04CA0019.eurprd04.prod.outlook.com
 (2603:10a6:208:122::32) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5b83985b-8fae-4712-75a4-08d75568d48b
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR12MB1276:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB12764D4507D2E94056D24E0F836E0@DM5PR12MB1276.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0196A226D1
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(376002)(136003)(366004)(346002)(189003)(199004)(66556008)(65806001)(65956001)(36756003)(71200400001)(81156014)(8936002)(14444005)(81166006)(64756008)(6512007)(6246003)(66446008)(66946007)(8676002)(66476007)(99286004)(2906002)(6436002)(7416002)(14454004)(256004)(4326008)(6916009)(71190400001)(6486002)(46003)(486006)(102836004)(476003)(2616005)(6506007)(5660300002)(31686004)(76176011)(305945005)(31696002)(478600001)(386003)(186003)(25786009)(86362001)(11346002)(446003)(52116002)(316002)(6116002)(54906003)(7736002)(229853002)(58126008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1276;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DPBpYSVxCJwY8IMQsj8nNaCcIS/ObisVomh3Ob7dlSVoE+uF7YUtV4ETRb8rGD+pp3+piJBWALVJseNpg7b2ckT2R28EcAh0GFH+cM3YkO/SkrvZ9+uMaIVF5n6uPRxVoaohUog99InBQphnFVQuxXQ8qm00at28neHUAR7SL14PgtbM4qpKo8xK+JLwyFJNkU0mlyiaBWVdf6BOBveBazUkgosjVbdhj6uBbOK+FJ3SGhxMJyUJN4Y2xmbX0xQYBAw1KGRsmGugzZOWIBebj54mmXtjisT84ag5no5Mn/6pU7i1n2UDttHYAP45wk92gWIot5bvZv9Dx9jpsUdUGO7o9R2+dnRXoKWD74HigZZahqM7i4d1Ttww6AAalGjRVkMxKj3ki5K3Gej6r6h54YL6tW456/XDYoLhH6ykCpRfI8Qb2GUIClSf73V1YmwL
Content-ID: <1234AEC0EFCF61438D7BE1FC78AA678E@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b83985b-8fae-4712-75a4-08d75568d48b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2019 14:21:42.9120 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VApxCw8aN4ywMD889AN4u0scyvHhX6iukKxbNEVJAFbow4MApxPQ3pnB61VmW0dD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1276
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQeuR1xwFwAFvupXZc2JLSwvQQYlfNo3w1GfJbRgu0A=;
 b=A9SHEPgNtaZlvhkF1SaM7iyYih57SZsJxVUWQE3Kg3XjP0Vcp+8BddeGUhzaNOk2zmETn+e9emXYQpr+lSe2eSLqY5D/tTcL8Us6+WmYMsU24VSJ7ALNLWPFKBftaYkkOwDl6GC38p1BZguITfHwtjp9F/FE/Kp7s05suJ3PPi4=
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, "Yang,
 Philip" <Philip.Yang@amd.com>, Ralph Campbell <rcampbell@nvidia.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jerome Glisse <jglisse@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTguMTAuMTkgdW0gMjI6MzYgc2NocmllYiBKYXNvbiBHdW50aG9ycGU6DQo+IE9uIFRodSwg
T2N0IDE3LCAyMDE5IGF0IDA0OjQ3OjIwUE0gKzAwMDAsIEtvZW5pZywgQ2hyaXN0aWFuIHdyb3Rl
Og0KPg0KPj4+IGdldF91c2VyX3BhZ2VzL2htbV9yYW5nZV9mYXVsdCgpIGFuZCBpbnZhbGlkYXRl
X3JhbmdlX3N0YXJ0KCkgYm90aCBhcmUNCj4+PiBjYWxsZWQgd2hpbGUgaG9sZGluZyBtbS0+bWFw
X3NlbSwgc28gdGhleSBhcmUgYWx3YXlzIHNlcmlhbGl6ZWQuDQo+PiBOb3QgZXZlbiByZW1vdGVs
eS4NCj4+DQo+PiBGb3IgY2FsbGluZyBnZXRfdXNlcl9wYWdlcygpL2htbV9yYW5nZV9mYXVsdCgp
IHlvdSBvbmx5IG5lZWQgdG8gaG9sZCB0aGUNCj4+IG1tYXBfc2VtIGluIHJlYWQgbW9kZS4NCj4g
UmlnaHQNCj4gICANCj4+IEFuZCBJSVJDIGludmFsaWRhdGVfcmFuZ2Vfc3RhcnQoKSBpcyBzb21l
dGltZXMgY2FsbGVkIHdpdGhvdXQgaG9sZGluZw0KPj4gdGhlIG1tYXBfc2VtIGF0IGFsbC4NCj4g
WWVwDQo+ICAgDQo+PiBTbyBhZ2FpbiBob3cgYXJlIHRoZXkgc2VyaWFsaXplZD8NCj4gVGhlICdk
cml2ZXIgbG9jaycgdGhpbmcgZG9lcyBpdCwgcmVhZCB0aGUgaG1tIGRvY3VtZW50YXRpb24sIHRo
ZSBobW0NCj4gYXBwcm9hY2ggaXMgYmFzaWNhbGx5IHRoZSBvbmx5IGFwcHJvYWNoIHRoYXQgd2Fz
IGNvcnJlY3Qgb2YgYWxsIHRoZQ0KPiBkcml2ZXJzLi4NCg0KV2VsbCB0aGF0J3Mgd2hhdCBJJ3Zl
IGRpZCwgYnV0IHdoYXQgSE1NIGRvZXMgc3RpbGwgZG9lc24ndCBsb29rcyBjb3JyZWN0IA0KdG8g
bWUuDQoNCj4gU28gbG9uZyBhcyB0aGUgJ2RyaXZlciBsb2NrJyBpcyBoZWxkIHRoZSByYW5nZSBj
YW5ub3QgYmVjb21lDQo+IGludmFsaWRhdGVkIGFzIHRoZSAnZHJpdmVyIGxvY2snIHByZXZlbnRz
IHByb2dyZXNzIG9mIGludmFsaWRhdGlvbi4NCg0KQ29ycmVjdCwgYnV0IHRoZSBwcm9ibGVtIGlz
IGl0IGRvZXNuJ3Qgd2FpdCBmb3Igb25nb2luZyBvcGVyYXRpb25zIHRvIA0KY29tcGxldGUuDQoN
ClNlZSBJJ20gdGFsa2luZyBhYm91dCB0aGUgZm9sbG93aW5nIGNhc2U6DQoNClRocmVhZCBBwqDC
oMKgIFRocmVhZCBCDQppbnZhbGlkYXRlX3JhbmdlX3N0YXJ0KCkNCiDCoMKgwqAgwqDCoMKgIMKg
wqDCoCDCoMKgwqAgwqDCoMKgIG1tdV9yYW5nZV9yZWFkX2JlZ2luKCkNCiDCoMKgwqAgwqDCoMKg
IMKgwqDCoCDCoMKgwqAgwqDCoMKgIGdldF91c2VyX3BhZ2VzKCkvaG1tX3JhbmdlX2ZhdWx0KCkN
CiDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIGdyYWJfZHJpdmVyX2xvY2soKQ0K
VXBkYXRpbmcgdGhlIHB0ZXMNCmludmFsaWRhdGVfcmFuZ2VfZW5kKCkNCg0KQXMgZmFyIGFzIEkg
Y2FuIHNlZSBpbiBpbnZhbGlkYXRlX3JhbmdlX3N0YXJ0KCkgdGhlIGRyaXZlciBsb2NrIGlzIHRh
a2VuIA0KdG8gbWFrZSBzdXJlIHRoYXQgd2UgY2FuJ3Qgc3RhcnQgYW55IGludmFsaWRhdGlvbiB3
aGlsZSB0aGUgZHJpdmVyIGlzIA0KdXNpbmcgdGhlIHBhZ2VzIGZvciBhIGNvbW1hbmQgc3VibWlz
c2lvbi4NCg0KQnV0IHRoZSBwYWdlcyB3ZSBnb3QgZnJvbSBnZXRfdXNlcl9wYWdlcygpL2htbV9y
YW5nZV9mYXVsdCgpIG1pZ2h0IG5vdCANCmJlIHVwIHRvIGRhdGUgYmVjYXVzZSB0aGUgZHJpdmVy
IGxvY2sgaXMgYWxzbyBkcm9wcGVkIGFnYWluIGluIA0KaW52YWxpZGF0ZV9yYW5nZV9zdGFydCgp
IGFuZCBub3QgaW4gaW52YWxpZGF0ZV9yYW5nZV9lbmQoKS4NCg0KPiBIb2xkaW5nIHRoZSBkcml2
ZXIgbG9jayBhbmQgdXNpbmcgdGhlIHNlcSBiYXNlZCBtbXVfcmFuZ2VfcmVhZF9yZXRyeSgpDQo+
IHRlbGxzIGlmIHRoZSBwcmV2aW91cyB1bmxvY2tlZCBnZXRfdXNlcl9wYWdlcygpIGlzIHN0aWxs
IHZhbGlkIG9yDQo+IG5lZWRzIHRvIGJlIGRpc2NhcmQuDQo+DQo+IFNvIGl0IGRvZXNuJ3QgbWF0
dGVyIGlmIGdldF91c2VyX3BhZ2VzKCkgcmFjZXMgb3Igbm90LCB0aGUgcmVzdWx0IGlzIG5vdA0K
PiB0byBiZSB1c2VkIHVudGlsIHRoZSBkcml2ZXIgbG9jayBpcyBoZWxkIGFuZCBtbXVfcmFuZ2Vf
cmVhZF9yZXRyeSgpDQo+IGNhbGxlZCwgd2hpY2ggcHJvdmlkZXMgdGhlIGNvaGVyZW5jZS4NCj4N
Cj4gSXQgaXMgdGhlIHVzdWFsIHNlcWxvY2sgcGF0dGVybi4NCg0KV2VsbCB3ZSBkb24ndCB1cGRh
dGUgdGhlIHNlcWxvY2sgYWZ0ZXIgdGhlIHVwZGF0ZSB0byB0aGUgcHJvdGVjdGVkIGRhdGEgDQpz
dHJ1Y3R1cmUgKHRoZSBwYWdlIHRhYmxlKSBoYXBwZW5lZCwgYnV0IHJhdGhlciBiZWZvcmUgdGhh
dC4NCg0KVGhhdCBkb2Vzbid0IGxvb2tzIGxpa2UgdGhlIG5vcm1hbCBwYXR0ZXIgZm9yIGEgc2Vx
bG9jayB0byBtZSBhbmQgYXMgZmFyIA0KYXMgSSBjYW4gc2VlIHRoYXQgaXMgcXVpdGUgYSBidWcg
aW4gdGhlIEhNTSBkZXNpZ24vbG9naWMuDQoNClJlZ2FyZHMsDQpDaHJpc3RpYW4uDQoNCj4NCj4g
SmFzb24NCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
