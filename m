Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E06CC47FC
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 08:58:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19D666E8A7;
	Wed,  2 Oct 2019 06:58:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760081.outbound.protection.outlook.com [40.107.76.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A76156E8A7;
 Wed,  2 Oct 2019 06:58:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KQN9PdDDJaekDUpE8/TV6yBWj8fu1FFMeuIgyKx3q1rmA41r/uhawl8PZxN/LStUwDDYdZF4+uotfUP3maf5BYZS6yjCgBJ/z1Z9kjB8UTc4098RklSRalgr5Yn0Ib+PszTJ3hgLCxj4A7Rc5V+h3g0nYWBKk7Y8lksHEac2LtWhYtMU+tanx42ND7uAvSYqEw8wYOLmlZVpXcvLZZHitVrGxIYJCS3HAEMCNKv65huDxb693CrnJFuCpEDMtBYPfxm/7VTgVbV/KVtmYeMqId9L34EjvWbeVYV5I4CTNNiHbDz7ll97KNFVmn46lVW3jtiihmn7yVTlRQc/kHMRTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WqdY6BzdGx1vxseCrICfTdfp9HM+AFi/WM6+EbB4LGM=;
 b=m+qII255bPLmw7FhNzP50B3EWOeG4TrhnlAawale64VD+PR7W5PMe1nGx5SfzU52CnUWhBaarCz4bj8hwR9PNTZsIxiAiTT+rpXcCSqKpzeNY9qdnnve2XTsMbLOSBGySTAOLyjdXLnaysWV/iC/zKTEFVJgxXZRk9cu8AxNIVElnwpb9FoPsAQrNtxw4E5cQgIbKPq69u5sGmuVvSk2+n24441YTn+cxDL6LH8mN2jX/Ja31D077FgAHk67aWkXDHW/ZEOPyef/ofkr3G2ch4zTqJubkyMXT77fOibd/wTwMKW3P61SiEHxvwedYShDmixzoIxUEzQ1u1JCgI3vRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1404.namprd12.prod.outlook.com (10.168.238.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Wed, 2 Oct 2019 06:58:19 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::bd8c:bbd5:66a4:9e83]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::bd8c:bbd5:66a4:9e83%5]) with mapi id 15.20.2305.023; Wed, 2 Oct 2019
 06:58:19 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Navid Emamdoost <navid.emamdoost@gmail.com>
Subject: Re: [PATCH v4] drm/amdgpu: fix multiple memory leaks in acp_hw_init
Thread-Topic: [PATCH v4] drm/amdgpu: fix multiple memory leaks in acp_hw_init
Thread-Index: AQHVeNP2UddSRAZukUawAY1Qqp6fx6dG69mA
Date: Wed, 2 Oct 2019 06:58:19 +0000
Message-ID: <7bc971c9-3c60-1780-cdd6-16cc97b6b77f@amd.com>
References: <3a00a4c9-af4c-3505-1bef-b119435da5d7@amd.com>
 <20191002034612.26607-1-navid.emamdoost@gmail.com>
In-Reply-To: <20191002034612.26607-1-navid.emamdoost@gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM0PR07CA0014.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::27) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 50fe01c8-5ff1-4415-56b2-08d74705e84c
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR12MB1404:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB14040F3FB6CD41E3E6F29A68839C0@DM5PR12MB1404.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 0178184651
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(136003)(366004)(346002)(396003)(189003)(199004)(66476007)(66446008)(64756008)(66556008)(7416002)(66946007)(5660300002)(305945005)(66574012)(52116002)(65956001)(65806001)(4326008)(31686004)(7736002)(31696002)(229853002)(6486002)(6512007)(86362001)(99286004)(6436002)(71200400001)(6916009)(25786009)(71190400001)(14454004)(186003)(46003)(478600001)(36756003)(6116002)(2906002)(102836004)(386003)(6506007)(2616005)(476003)(81166006)(8676002)(81156014)(14444005)(8936002)(256004)(446003)(11346002)(486006)(54906003)(76176011)(316002)(58126008)(6246003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1404;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nmkc7u1RtRfDEitZiOKml2FuQ6s0b0Ilm7mkxvuj5K79ra7zXAhcbVDw3x+15HWHiNxOOWgXfkAtI1/SQaAe3YB1R0sFbUNYHCy3DwjcD5YvxGPPAgPOey/MXkjch/WS1BX2p5+jix/7YQG1PtzI15bI5mrMJlfOIenvMn0YzEcRWCWCJ3883yd8Wtk+ikCxp/YgulLWRIRlZFNeUavvuI997riXZL/AxKtaxiLknpZcxKhJfj6lOH78S22wIfWkcJlAolettz0lDkO6t89seXwaaJqyg9wPDp+GLqW1Oiozzuls650VKHYuiuw83Qx/6cxf8E7TLmriu8e53+kefQWp320MabtOBFcPhF3WzFakDj9uphPM3QT35/YStwnfONXVbKHnkTaB1Qn2kHHL/ivak/kitYT/zNpunyR+sCw=
Content-ID: <FB0770EA691B394EB6DA21C87E47017C@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50fe01c8-5ff1-4415-56b2-08d74705e84c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2019 06:58:19.5449 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gms6CDLp/2K0dWDhkZLCIoDNo05uA/Goc2gzFtUk7Ikh+Hx+wnyFuwsO8P+zjUPR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1404
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WqdY6BzdGx1vxseCrICfTdfp9HM+AFi/WM6+EbB4LGM=;
 b=xSzsnv4ciqjBTpQxUOOqpLIFonC0nW+HOwjgJV9nrQ1+O/dP8823SR18Wy8kw1dSFcLxfz734No0CVkJVZnXG4GtltxDc4OTlizog4WhjLKbp9Qoq1rga+fQoNupxetqvf0+by1zzH/XjJHy9+NXV7jkq1PZHWAELG0SUdv8g9w=
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

QW0gMDIuMTAuMTkgdW0gMDU6NDYgc2NocmllYiBOYXZpZCBFbWFtZG9vc3Q6DQo+IEluIGFjcF9o
d19pbml0IHRoZXJlIGFyZSBzb21lIGFsbG9jYXRpb25zIHRoYXQgbmVlZHMgdG8gYmUgcmVsZWFz
ZWQgaW4NCj4gY2FzZSBvZiBmYWlsdXJlOg0KPg0KPiAxLSBhZGV2LT5hY3AuYWNwX2dlbnBkIHNo
b3VsZCBiZSByZWxlYXNlZCBpZiBhbnkgYWxsb2NhdGlvbiBhdHRlbXAgZm9yDQo+IGFkZXYtPmFj
cC5hY3BfY2VsbCwgYWRldi0+YWNwLmFjcF9yZXMgb3IgaTJzX3BkYXRhIGZhaWxzLg0KPiAyLSBh
bGwgb2YgdGhvc2UgYWxsb2NhdGlvbnMgc2hvdWxkIGJlIHJlbGVhc2VkIGlmDQo+IG1mZF9hZGRf
aG90cGx1Z19kZXZpY2VzIG9yIHBtX2dlbnBkX2FkZF9kZXZpY2UgZmFpbC4NCj4gMy0gUmVsZWFz
ZSBpcyBuZWVkZWQgaW4gY2FzZSBvZiB0aW1lIG91dCB2YWx1ZXMgZXhwaXJlLg0KPg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBOYXZpZCBFbWFtZG9vc3QgPG5hdmlkLmVtYW1kb29zdEBnbWFpbC5jb20+DQoN
ClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
DQoNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FjcC5jIHwg
MzQgKysrKysrKysrKysrKysrKy0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNl
cnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hY3AuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9hY3AuYw0KPiBpbmRleCBlYmE0MmM3NTJiY2EuLjgyMTU1YWMzMjg4YSAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FjcC5jDQo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hY3AuYw0KPiBAQCAtMTg5LDcgKzE4
OSw3IEBAIHN0YXRpYyBpbnQgYWNwX2h3X2luaXQodm9pZCAqaGFuZGxlKQ0KPiAgIAl1MzIgdmFs
ID0gMDsNCj4gICAJdTMyIGNvdW50ID0gMDsNCj4gICAJc3RydWN0IGRldmljZSAqZGV2Ow0KPiAt
CXN0cnVjdCBpMnNfcGxhdGZvcm1fZGF0YSAqaTJzX3BkYXRhOw0KPiArCXN0cnVjdCBpMnNfcGxh
dGZvcm1fZGF0YSAqaTJzX3BkYXRhID0gTlVMTDsNCj4gICANCj4gICAJc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYgPSAoc3RydWN0IGFtZGdwdV9kZXZpY2UgKiloYW5kbGU7DQo+ICAgDQo+IEBA
IC0yMzEsMjAgKzIzMSwyMSBAQCBzdGF0aWMgaW50IGFjcF9od19pbml0KHZvaWQgKmhhbmRsZSkN
Cj4gICAJYWRldi0+YWNwLmFjcF9jZWxsID0ga2NhbGxvYyhBQ1BfREVWUywgc2l6ZW9mKHN0cnVj
dCBtZmRfY2VsbCksDQo+ICAgCQkJCQkJCUdGUF9LRVJORUwpOw0KPiAgIA0KPiAtCWlmIChhZGV2
LT5hY3AuYWNwX2NlbGwgPT0gTlVMTCkNCj4gLQkJcmV0dXJuIC1FTk9NRU07DQo+ICsJaWYgKGFk
ZXYtPmFjcC5hY3BfY2VsbCA9PSBOVUxMKSB7DQo+ICsJCXIgPSAtRU5PTUVNOw0KPiArCQlnb3Rv
IGZhaWx1cmU7DQo+ICsJfQ0KPiAgIA0KPiAgIAlhZGV2LT5hY3AuYWNwX3JlcyA9IGtjYWxsb2Mo
NSwgc2l6ZW9mKHN0cnVjdCByZXNvdXJjZSksIEdGUF9LRVJORUwpOw0KPiAgIAlpZiAoYWRldi0+
YWNwLmFjcF9yZXMgPT0gTlVMTCkgew0KPiAtCQlrZnJlZShhZGV2LT5hY3AuYWNwX2NlbGwpOw0K
PiAtCQlyZXR1cm4gLUVOT01FTTsNCj4gKwkJciA9IC1FTk9NRU07DQo+ICsJCWdvdG8gZmFpbHVy
ZTsNCj4gICAJfQ0KPiAgIA0KPiAgIAlpMnNfcGRhdGEgPSBrY2FsbG9jKDMsIHNpemVvZihzdHJ1
Y3QgaTJzX3BsYXRmb3JtX2RhdGEpLCBHRlBfS0VSTkVMKTsNCj4gICAJaWYgKGkyc19wZGF0YSA9
PSBOVUxMKSB7DQo+IC0JCWtmcmVlKGFkZXYtPmFjcC5hY3BfcmVzKTsNCj4gLQkJa2ZyZWUoYWRl
di0+YWNwLmFjcF9jZWxsKTsNCj4gLQkJcmV0dXJuIC1FTk9NRU07DQo+ICsJCXIgPSAtRU5PTUVN
Ow0KPiArCQlnb3RvIGZhaWx1cmU7DQo+ICAgCX0NCj4gICANCj4gICAJc3dpdGNoIChhZGV2LT5h
c2ljX3R5cGUpIHsNCj4gQEAgLTM0MSwxNCArMzQyLDE0IEBAIHN0YXRpYyBpbnQgYWNwX2h3X2lu
aXQodm9pZCAqaGFuZGxlKQ0KPiAgIAlyID0gbWZkX2FkZF9ob3RwbHVnX2RldmljZXMoYWRldi0+
YWNwLnBhcmVudCwgYWRldi0+YWNwLmFjcF9jZWxsLA0KPiAgIAkJCQkJCQkJQUNQX0RFVlMpOw0K
PiAgIAlpZiAocikNCj4gLQkJcmV0dXJuIHI7DQo+ICsJCWdvdG8gZmFpbHVyZTsNCj4gICANCj4g
ICAJZm9yIChpID0gMDsgaSA8IEFDUF9ERVZTIDsgaSsrKSB7DQo+ICAgCQlkZXYgPSBnZXRfbWZk
X2NlbGxfZGV2KGFkZXYtPmFjcC5hY3BfY2VsbFtpXS5uYW1lLCBpKTsNCj4gICAJCXIgPSBwbV9n
ZW5wZF9hZGRfZGV2aWNlKCZhZGV2LT5hY3AuYWNwX2dlbnBkLT5ncGQsIGRldik7DQo+ICAgCQlp
ZiAocikgew0KPiAgIAkJCWRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGFkZCBkZXYgdG8gZ2VucGRc
biIpOw0KPiAtCQkJcmV0dXJuIHI7DQo+ICsJCQlnb3RvIGZhaWx1cmU7DQo+ICAgCQl9DQo+ICAg
CX0NCj4gICANCj4gQEAgLTM2Nyw3ICszNjgsOCBAQCBzdGF0aWMgaW50IGFjcF9od19pbml0KHZv
aWQgKmhhbmRsZSkNCj4gICAJCQlicmVhazsNCj4gICAJCWlmICgtLWNvdW50ID09IDApIHsNCj4g
ICAJCQlkZXZfZXJyKCZhZGV2LT5wZGV2LT5kZXYsICJGYWlsZWQgdG8gcmVzZXQgQUNQXG4iKTsN
Cj4gLQkJCXJldHVybiAtRVRJTUVET1VUOw0KPiArCQkJciA9IC1FVElNRURPVVQ7DQo+ICsJCQln
b3RvIGZhaWx1cmU7DQo+ICAgCQl9DQo+ICAgCQl1ZGVsYXkoMTAwKTsNCj4gICAJfQ0KPiBAQCAt
Mzg0LDcgKzM4Niw4IEBAIHN0YXRpYyBpbnQgYWNwX2h3X2luaXQodm9pZCAqaGFuZGxlKQ0KPiAg
IAkJCWJyZWFrOw0KPiAgIAkJaWYgKC0tY291bnQgPT0gMCkgew0KPiAgIAkJCWRldl9lcnIoJmFk
ZXYtPnBkZXYtPmRldiwgIkZhaWxlZCB0byByZXNldCBBQ1BcbiIpOw0KPiAtCQkJcmV0dXJuIC1F
VElNRURPVVQ7DQo+ICsJCQlyID0gLUVUSU1FRE9VVDsNCj4gKwkJCWdvdG8gZmFpbHVyZTsNCj4g
ICAJCX0NCj4gICAJCXVkZWxheSgxMDApOw0KPiAgIAl9DQo+IEBAIC0zOTMsNiArMzk2LDEzIEBA
IHN0YXRpYyBpbnQgYWNwX2h3X2luaXQodm9pZCAqaGFuZGxlKQ0KPiAgIAl2YWwgJj0gfkFDUF9T
T0ZUX1JFU0VUX19Tb2Z0UmVzZXRBdWRfTUFTSzsNCj4gICAJY2dzX3dyaXRlX3JlZ2lzdGVyKGFk
ZXYtPmFjcC5jZ3NfZGV2aWNlLCBtbUFDUF9TT0ZUX1JFU0VULCB2YWwpOw0KPiAgIAlyZXR1cm4g
MDsNCj4gKw0KPiArZmFpbHVyZToNCj4gKwlrZnJlZShpMnNfcGRhdGEpOw0KPiArCWtmcmVlKGFk
ZXYtPmFjcC5hY3BfcmVzKTsNCj4gKwlrZnJlZShhZGV2LT5hY3AuYWNwX2NlbGwpOw0KPiArCWtm
cmVlKGFkZXYtPmFjcC5hY3BfZ2VucGQpOw0KPiArCXJldHVybiByOw0KPiAgIH0NCj4gICANCj4g
ICAvKioNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
