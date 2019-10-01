Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7C6C3416
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 14:19:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D23F6E632;
	Tue,  1 Oct 2019 12:19:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770088.outbound.protection.outlook.com [40.107.77.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A39C46E62C;
 Tue,  1 Oct 2019 12:19:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z9HPwY+mr/E6vDIDduiA+CkGacLEFZTUsjlo8A6jgQOC6j2REiQGj9fcwYSVaIAE3cCjmzelhH0LimE2+DLTCbA7h6nVRhDxcVgtUtD1FqUa/wdumiqjwRCeRZNXU/IUHtxugmq59OcuOquyx+ZfiRYeRP5faL/OG7yOdWy8G37o57g5B67unoNNfgLN5mhE8UfhsYHSnNOsZ/TG/15r5NgkBfA0VavHU0aB6qisYoDNps4QVcNp1gyR0TDQ850+EZit8xv/yso5D3JrpKVDkR62Yq8vyQDCMnvBf5K3M06X+FiSyG7PONEHchUeu+GW5w3aZRqvwIJ6tEkdfSY6cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1H3KlVIo2m7jt43C6gYZtLosUlbrOgy+lXJv/qKDbQc=;
 b=EPIZrktMtPSgO6S1k5vtloWFuLdRHfez8hHhb3Q9hW8ygN30dV24ripNywSYQz24s+8zDH45ZIoUSMDaoBuKz8RNLgKEfpLLAH7GigXXfYdZYeX3qczBQ4eDlsrJxc7+1j9SDTnNj7b2Lsn+JUyRyiVboNsddny/ys6yNQ2MzSuiFkbEfh3cYT5rBGYPfBHnriZCV1BpIAgRzLBGXBJ3cH6gRiFFV+qojpnbvfAjgfdztxK8g6VIXfno2dWt8MbQyILm9yHCI6MgeSW3kp0uiOoHe0wNOZ9gPrSFa2GSEHnOI5AySWap5Og5D9yLDp1ikLDOOND8xKugBNLVUtGQ8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1499.namprd12.prod.outlook.com (10.172.36.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 12:19:17 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::bd8c:bbd5:66a4:9e83]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::bd8c:bbd5:66a4:9e83%5]) with mapi id 15.20.2305.017; Tue, 1 Oct 2019
 12:19:17 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Navid Emamdoost <navid.emamdoost@gmail.com>
Subject: Re: [PATCH v3] drm/amdgpu: fix multiple memory leaks in acp_hw_init
Thread-Topic: [PATCH v3] drm/amdgpu: fix multiple memory leaks in acp_hw_init
Thread-Index: AQHVd9XK3+a519Z+nEK6eI1Wsv4aZKdFtS6A
Date: Tue, 1 Oct 2019 12:19:17 +0000
Message-ID: <3a00a4c9-af4c-3505-1bef-b119435da5d7@amd.com>
References: <88fc639a-32ed-b6c6-f930-552083d5887d@amd.com>
 <20190930212644.9372-1-navid.emamdoost@gmail.com>
In-Reply-To: <20190930212644.9372-1-navid.emamdoost@gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM4P190CA0021.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:200:56::31) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 60d0be8e-ee5a-4794-52d2-08d746699449
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR12MB1499:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1499465461714A7622BE35EC839D0@DM5PR12MB1499.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(39860400002)(376002)(396003)(346002)(199004)(189003)(6916009)(446003)(65806001)(66946007)(2616005)(476003)(11346002)(14454004)(6512007)(81166006)(256004)(81156014)(486006)(65956001)(316002)(8676002)(99286004)(25786009)(102836004)(58126008)(4326008)(6436002)(66476007)(66556008)(64756008)(66446008)(6506007)(8936002)(186003)(54906003)(7416002)(46003)(5660300002)(6486002)(31686004)(76176011)(86362001)(52116002)(7736002)(71190400001)(2906002)(386003)(229853002)(305945005)(14444005)(6116002)(71200400001)(6246003)(478600001)(31696002)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1499;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 13TSPRCilP6v986gLjddj4o1LCVzjMlwqIraIb7MCAxl7pwVZfV8NB6HfwZf5AKWMi++4aYmpeDuWAgKZqS/13IUs8A/5gFGRKvD2wwp6vz1pNmKH9kcvpYP1NNUSXv3CXSP5Pt8rt0r3psbjsbt78BqPDvcatjLfnPasf5GKNfyVC5r1sDOwr4YpqX5Sgxmot/jxLJdfpYhFHZB5w5EZpEvxH4nW0tcvn4MjuZl5eKaU73G1EA9ZopaF8fgp9VOarO19p8tMslBJaZdxXVBa0etqhbp9q3wfOUkotFuZsMTGZEpviYitk9nXZZ08IrIcN5NR6rQqOnIVh9JaHu+DujnBuGBNDQunIJKWc/Qeag8Bh8rV2N6R7KKYx6UnAE1Az1I69e+oE34JXHqDDiCyINkunhOVlSFoaSwrWKM2Ao=
Content-ID: <66A240ED74751A4DA4BA020402040C38@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60d0be8e-ee5a-4794-52d2-08d746699449
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 12:19:17.2147 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IWRX1pKa+IuIQBv8AlcsoU0hpWGTsrAzPyGglnM2mJ/y3E9EMXTXT83x6Olc1ioS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1499
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1H3KlVIo2m7jt43C6gYZtLosUlbrOgy+lXJv/qKDbQc=;
 b=h+oI6je46/8aCzOFNnd4DkfIqaj8jA/R40MfUf3rPK2vVQZ73S6QPVMZRZA4THASMYlWK0JrIyjvXZTnA/N78S/Yq9pj9muoZ3J8lUNx3kJbMiziAo4Do3rW6J5dYbgYCMtjQXTFY9MT0bw/SByNfGssjQNUGwEVaJA/6VBxjFQ=
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
Cc: David Airlie <airlied@linux.ie>, Rex Zhu <Rex.Zhu@amd.com>,
 "kjlu@umn.edu" <kjlu@umn.edu>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "emamd001@umn.edu" <emamd001@umn.edu>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "smccaman@umn.edu" <smccaman@umn.edu>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMzAuMDkuMTkgdW0gMjM6MjYgc2NocmllYiBOYXZpZCBFbWFtZG9vc3Q6DQo+IEluIGFjcF9o
d19pbml0IHRoZXJlIGFyZSBzb21lIGFsbG9jYXRpb25zIHRoYXQgbmVlZHMgdG8gYmUgcmVsZWFz
ZWQgaW4NCj4gY2FzZSBvZiBmYWlsdXJlOg0KPg0KPiAxLSBhZGV2LT5hY3AuYWNwX2dlbnBkIHNo
b3VsZCBiZSByZWxlYXNlZCBpZiBhbnkgYWxsb2NhdGlvbiBhdHRlbXAgZm9yDQo+IGFkZXYtPmFj
cC5hY3BfY2VsbCwgYWRldi0+YWNwLmFjcF9yZXMgb3IgaTJzX3BkYXRhIGZhaWxzLg0KPiAyLSBh
bGwgb2YgdGhvc2UgYWxsb2NhdGlvbnMgc2hvdWxkIGJlIHJlbGVhc2VkIGlmDQo+IG1mZF9hZGRf
aG90cGx1Z19kZXZpY2VzIG9yIHBtX2dlbnBkX2FkZF9kZXZpY2UgZmFpbC4NCj4gMy0gUmVsZWFz
ZSBpcyBuZWVkZWQgaW4gY2FzZSBvZiB0aW1lIG91dCB2YWx1ZXMgZXhwaXJlLg0KPg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBOYXZpZCBFbWFtZG9vc3QgPG5hdmlkLmVtYW1kb29zdEBnbWFpbC5jb20+DQo+
IC0tLQ0KPiBDaGFuZ2VzIGluIHYyOg0KPiAJLS0gbW92ZWQgdGhlIHJlbGVhc2VzIHVuZGVyIGdv
dG8NCj4NCj4gQ2hhbmdlcyBpbiB2MzoNCj4gCS0tIGZpeGVkIG11bHRpcGxlIGdvdG8gaXNzdWUN
Cj4gCS0tIGFkZGVkIGdvdG8gZm9yIDMgb3RoZXIgZmFpbHVyZSBjYXNlczogb25lIHdoZW4NCj4g
bWZkX2FkZF9ob3RwbHVnX2RldmljZXMgZmFpbHMsIGFuZCB0d28gd2hlbiB0aW1lIG91dCB2YWx1
ZXMgZXhwaXJlcy4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2FjcC5jIHwgNDEgKysrKysrKysrKysrKysrKy0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2Vk
LCAyNyBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hY3AuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9hY3AuYw0KPiBpbmRleCBlYmE0MmM3NTJiY2EuLjc4MDk3NDVlYzBm
MSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FjcC5j
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hY3AuYw0KPiBAQCAt
MTg0LDEyICsxODQsMTIgQEAgc3RhdGljIHN0cnVjdCBkZXZpY2UgKmdldF9tZmRfY2VsbF9kZXYo
Y29uc3QgY2hhciAqZGV2aWNlX25hbWUsIGludCByKQ0KPiAgICAqLw0KPiAgIHN0YXRpYyBpbnQg
YWNwX2h3X2luaXQodm9pZCAqaGFuZGxlKQ0KPiAgIHsNCj4gLQlpbnQgciwgaTsNCj4gKwlpbnQg
ciwgaSwgcmV0Ow0KDQpQbGVhc2UgZG9uJ3QgYWRkIGFub3RoZXIgInJldCIgdmFyaWFibGUsIGlu
c3RlYWQgYWx3YXlzIHVzZSAiciIgaGVyZS4NCg0KQXBhcnQgZnJvbSB0aGF0IGxvb2tzIGdvb2Qg
dG8gbWUsDQpDaHJpc3RpYW4uDQoNCj4gICAJdWludDY0X3QgYWNwX2Jhc2U7DQo+ICAgCXUzMiB2
YWwgPSAwOw0KPiAgIAl1MzIgY291bnQgPSAwOw0KPiAgIAlzdHJ1Y3QgZGV2aWNlICpkZXY7DQo+
IC0Jc3RydWN0IGkyc19wbGF0Zm9ybV9kYXRhICppMnNfcGRhdGE7DQo+ICsJc3RydWN0IGkyc19w
bGF0Zm9ybV9kYXRhICppMnNfcGRhdGEgPSBOVUxMOw0KPiAgIA0KPiAgIAlzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldiA9IChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqKWhhbmRsZTsNCj4gICANCj4g
QEAgLTIzMSwyMCArMjMxLDIxIEBAIHN0YXRpYyBpbnQgYWNwX2h3X2luaXQodm9pZCAqaGFuZGxl
KQ0KPiAgIAlhZGV2LT5hY3AuYWNwX2NlbGwgPSBrY2FsbG9jKEFDUF9ERVZTLCBzaXplb2Yoc3Ry
dWN0IG1mZF9jZWxsKSwNCj4gICAJCQkJCQkJR0ZQX0tFUk5FTCk7DQo+ICAgDQo+IC0JaWYgKGFk
ZXYtPmFjcC5hY3BfY2VsbCA9PSBOVUxMKQ0KPiAtCQlyZXR1cm4gLUVOT01FTTsNCj4gKwlpZiAo
YWRldi0+YWNwLmFjcF9jZWxsID09IE5VTEwpIHsNCj4gKwkJcmV0ID0gLUVOT01FTTsNCj4gKwkJ
Z290byBmYWlsdXJlOw0KPiArCX0NCj4gICANCj4gICAJYWRldi0+YWNwLmFjcF9yZXMgPSBrY2Fs
bG9jKDUsIHNpemVvZihzdHJ1Y3QgcmVzb3VyY2UpLCBHRlBfS0VSTkVMKTsNCj4gICAJaWYgKGFk
ZXYtPmFjcC5hY3BfcmVzID09IE5VTEwpIHsNCj4gLQkJa2ZyZWUoYWRldi0+YWNwLmFjcF9jZWxs
KTsNCj4gLQkJcmV0dXJuIC1FTk9NRU07DQo+ICsJCXJldCA9IC1FTk9NRU07DQo+ICsJCWdvdG8g
ZmFpbHVyZTsNCj4gICAJfQ0KPiAgIA0KPiAgIAlpMnNfcGRhdGEgPSBrY2FsbG9jKDMsIHNpemVv
ZihzdHJ1Y3QgaTJzX3BsYXRmb3JtX2RhdGEpLCBHRlBfS0VSTkVMKTsNCj4gICAJaWYgKGkyc19w
ZGF0YSA9PSBOVUxMKSB7DQo+IC0JCWtmcmVlKGFkZXYtPmFjcC5hY3BfcmVzKTsNCj4gLQkJa2Zy
ZWUoYWRldi0+YWNwLmFjcF9jZWxsKTsNCj4gLQkJcmV0dXJuIC1FTk9NRU07DQo+ICsJCXJldCA9
IC1FTk9NRU07DQo+ICsJCWdvdG8gZmFpbHVyZTsNCj4gICAJfQ0KPiAgIA0KPiAgIAlzd2l0Y2gg
KGFkZXYtPmFzaWNfdHlwZSkgew0KPiBAQCAtMzQwLDE1ICszNDEsMTggQEAgc3RhdGljIGludCBh
Y3BfaHdfaW5pdCh2b2lkICpoYW5kbGUpDQo+ICAgDQo+ICAgCXIgPSBtZmRfYWRkX2hvdHBsdWdf
ZGV2aWNlcyhhZGV2LT5hY3AucGFyZW50LCBhZGV2LT5hY3AuYWNwX2NlbGwsDQo+ICAgCQkJCQkJ
CQlBQ1BfREVWUyk7DQo+IC0JaWYgKHIpDQo+IC0JCXJldHVybiByOw0KPiArCWlmIChyKSB7DQo+
ICsJCXJldCA9IHI7DQo+ICsJCWdvdG8gZmFpbHVyZTsNCj4gKwl9DQo+ICAgDQo+ICAgCWZvciAo
aSA9IDA7IGkgPCBBQ1BfREVWUyA7IGkrKykgew0KPiAgIAkJZGV2ID0gZ2V0X21mZF9jZWxsX2Rl
dihhZGV2LT5hY3AuYWNwX2NlbGxbaV0ubmFtZSwgaSk7DQo+ICAgCQlyID0gcG1fZ2VucGRfYWRk
X2RldmljZSgmYWRldi0+YWNwLmFjcF9nZW5wZC0+Z3BkLCBkZXYpOw0KPiAgIAkJaWYgKHIpIHsN
Cj4gICAJCQlkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBhZGQgZGV2IHRvIGdlbnBkXG4iKTsNCj4g
LQkJCXJldHVybiByOw0KPiArCQkJcmV0ID0gcjsNCj4gKwkJCWdvdG8gZmFpbHVyZTsNCj4gICAJ
CX0NCj4gICAJfQ0KPiAgIA0KPiBAQCAtMzY3LDcgKzM3MSw4IEBAIHN0YXRpYyBpbnQgYWNwX2h3
X2luaXQodm9pZCAqaGFuZGxlKQ0KPiAgIAkJCWJyZWFrOw0KPiAgIAkJaWYgKC0tY291bnQgPT0g
MCkgew0KPiAgIAkJCWRldl9lcnIoJmFkZXYtPnBkZXYtPmRldiwgIkZhaWxlZCB0byByZXNldCBB
Q1BcbiIpOw0KPiAtCQkJcmV0dXJuIC1FVElNRURPVVQ7DQo+ICsJCQlyZXQgPSAtRVRJTUVET1VU
Ow0KPiArCQkJZ290byBmYWlsdXJlOw0KPiAgIAkJfQ0KPiAgIAkJdWRlbGF5KDEwMCk7DQo+ICAg
CX0NCj4gQEAgLTM4NCw3ICszODksOCBAQCBzdGF0aWMgaW50IGFjcF9od19pbml0KHZvaWQgKmhh
bmRsZSkNCj4gICAJCQlicmVhazsNCj4gICAJCWlmICgtLWNvdW50ID09IDApIHsNCj4gICAJCQlk
ZXZfZXJyKCZhZGV2LT5wZGV2LT5kZXYsICJGYWlsZWQgdG8gcmVzZXQgQUNQXG4iKTsNCj4gLQkJ
CXJldHVybiAtRVRJTUVET1VUOw0KPiArCQkJcmV0ID0gLUVUSU1FRE9VVDsNCj4gKwkJCWdvdG8g
ZmFpbHVyZTsNCj4gICAJCX0NCj4gICAJCXVkZWxheSgxMDApOw0KPiAgIAl9DQo+IEBAIC0zOTMs
NiArMzk5LDEzIEBAIHN0YXRpYyBpbnQgYWNwX2h3X2luaXQodm9pZCAqaGFuZGxlKQ0KPiAgIAl2
YWwgJj0gfkFDUF9TT0ZUX1JFU0VUX19Tb2Z0UmVzZXRBdWRfTUFTSzsNCj4gICAJY2dzX3dyaXRl
X3JlZ2lzdGVyKGFkZXYtPmFjcC5jZ3NfZGV2aWNlLCBtbUFDUF9TT0ZUX1JFU0VULCB2YWwpOw0K
PiAgIAlyZXR1cm4gMDsNCj4gKw0KPiArZmFpbHVyZToNCj4gKwlrZnJlZShpMnNfcGRhdGEpOw0K
PiArCWtmcmVlKGFkZXYtPmFjcC5hY3BfcmVzKTsNCj4gKwlrZnJlZShhZGV2LT5hY3AuYWNwX2Nl
bGwpOw0KPiArCWtmcmVlKGFkZXYtPmFjcC5hY3BfZ2VucGQpOw0KPiArCXJldHVybiByZXQ7DQo+
ICAgfQ0KPiAgIA0KPiAgIC8qKg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
