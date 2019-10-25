Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3199E4918
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 13:00:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F68589DFC;
	Fri, 25 Oct 2019 11:00:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780085.outbound.protection.outlook.com [40.107.78.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC31489DFC
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 11:00:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KpmuhXhYjRm48ZBYJEDkHCYkySMzPVIGsSlkvQ0fp0bxClhL7MuB42Q5lSODQeAxHMgQ63b9taQ+ZlOUJsK/kGPXpjzlgL6iNvb7jNOKmjPNHDHQnUwYkZgeA73RQkNW4GxtWt+Gx5Q6HyRcHQ9VKexNFsbvPBLtasojvtkSVkFrzLFWZ5wIndoTd9qQ4tWwjlSVhL3DnmAqEKKjMn86xPI1GHfj5BrxzRustlsF1yGNBRUgsWgkrwenheRfxe+kyVsy+cMmcxDQs1cMr2WjL370y4twNmSeT55SWmw0xAnQ8rC663Re4bfYZQs5h0De24pq5FrRi9D6tCa+GthA9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VFYisQExiX9Dw+XteHs89uKmQ+8zWmWMbKch2jg4dGc=;
 b=KKOLk2uSqao54lTge8BvlusolFWY7ItULEkw/eoKUlOQUi+UiPVaIHwkbyLKvZggCDu3oDzBuL6jzikkE9vQosZu1xFD2INK5lV9sLfI4hgFV3Kqh/ClMK6W5a+yHxDzCk/UgkYvVGMaAfXLhF7MUwLZQW2P15BVD9IaKlxEKyunA4Ive51RqKKnR9mSeeh87L9dTYt2fP6RFQ3K1CsQCBRXYyNiglSOoapsvEl6QXn1q4btv+Xf60AJpq/f8I8i9BA1RQStZTeaGmZ2b2Zs2WjdaUKDPAULMGcvZsYJqMvmeLPQ/62fPce8EcS7nqYUFkzK5ETi864yHLhE/VXW9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1699.namprd12.prod.outlook.com (10.175.97.148) by
 BN6PR12MB1348.namprd12.prod.outlook.com (10.168.228.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.24; Fri, 25 Oct 2019 11:00:08 +0000
Received: from BN6PR12MB1699.namprd12.prod.outlook.com
 ([fe80::bde7:9044:dcdb:4b67]) by BN6PR12MB1699.namprd12.prod.outlook.com
 ([fe80::bde7:9044:dcdb:4b67%7]) with mapi id 15.20.2347.029; Fri, 25 Oct 2019
 11:00:08 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Steven Price <steven.price@arm.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>
Subject: Re: [PATCH v5] drm: Don't free jobs in wait_event_interruptible()
Thread-Topic: [PATCH v5] drm: Don't free jobs in wait_event_interruptible()
Thread-Index: AQHViyLCFDlUFNHUcEKRN2lKnBkdfKdrMGyA
Date: Fri, 25 Oct 2019 11:00:07 +0000
Message-ID: <ff70fd37-8b2b-582c-6d6c-dfb233c0fc08@amd.com>
References: <20191025105156.14785-1-steven.price@arm.com>
In-Reply-To: <20191025105156.14785-1-steven.price@arm.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM3PR03CA0068.eurprd03.prod.outlook.com
 (2603:10a6:207:5::26) To BN6PR12MB1699.namprd12.prod.outlook.com
 (2603:10b6:404:ff::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 37cfcafb-43c6-41b5-5cbf-08d7593a7f42
x-ms-traffictypediagnostic: BN6PR12MB1348:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB134849E874F41E111B71A5EE83650@BN6PR12MB1348.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:843;
x-forefront-prvs: 02015246A9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(366004)(39860400002)(136003)(51914003)(189003)(199004)(6436002)(14444005)(8676002)(71200400001)(31696002)(71190400001)(229853002)(66574012)(476003)(25786009)(6486002)(81156014)(7736002)(2616005)(6246003)(11346002)(36756003)(256004)(14454004)(86362001)(5660300002)(486006)(4326008)(386003)(110136005)(58126008)(99286004)(66946007)(52116002)(66446008)(6506007)(102836004)(186003)(54906003)(66476007)(66556008)(64756008)(316002)(31686004)(6512007)(76176011)(446003)(478600001)(2906002)(6116002)(305945005)(65806001)(65956001)(46003)(8936002)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1348;
 H:BN6PR12MB1699.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oA/S6YcerCrEIKzEw3OUB9w6JAkSVwjnRHNfhv6WoHllifv2WnJZe3ETF1INAhxs3qu8N9vaRZ375bSVBONCULiYnaGwmb9RUziQMrB2AGBl4orbLSs/SruHASDROKxzDQIiN4M9+lNz13EhnltOoSSRZbNhce08/mOLW7xamyvTHqHBz2Il9eY9DLAouHjVE7vTTgVoTzSFmQMoVOchLtO+0ta2cJChYr320yH1O4c7QIDT9V/G9p9Tc8ylKohClZzT6bRXwoATj/1UWX4BXzjoWDYxu+caVR0VSDCj7WWAi94/JRJC82ThXDAdYrZ4SS1f/ASZEyacvO0p/KK6N322VppOuf3t+eVTFycoXI8hjxgqfSoLodct5YI0LodndrK3+6Dxsbv8Ozshy9G2lsR3m95T+cJs2x85KIszW5yOTwfNkDO/9U4YUIhxy5Ae
Content-ID: <969CB6FD5D343445B4F8C9A329C62708@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37cfcafb-43c6-41b5-5cbf-08d7593a7f42
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2019 11:00:07.7818 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5xbfMarmBenuX/b5QfxkGi51R89ZDbTJOQ1e4Ew/caVbekTYL7PWBVmVMyu8KFsK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1348
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VFYisQExiX9Dw+XteHs89uKmQ+8zWmWMbKch2jg4dGc=;
 b=RjEBmDpwu1tmg+r+SeDw5a5BLDIeLqasfRESY0ZByurZ5Ux+sGxyt72RuRa9gdjw8PEdnwHOaMogNF1chdcQYWwT/1u7Lg9LDlyiVhdaGN89CdJ+zj4iGP86FHKo8VlDH0nU/o8IYOxosV0C/bSdz60TQaktmJRoAMgIuBzpunw=
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
Cc: Sharat Masetty <smasetty@codeaurora.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Erico Nunes <nunes.erico@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjUuMTAuMTkgdW0gMTI6NTEgc2NocmllYiBTdGV2ZW4gUHJpY2U6DQo+IGRybV9zY2hlZF9j
bGVhbnVwX2pvYnMoKSBhdHRlbXB0cyB0byBmcmVlIGZpbmlzaGVkIGpvYnMsIGhvd2V2ZXIgYmVj
YXVzZQ0KPiBpdCBpcyBjYWxsZWQgYXMgdGhlIGNvbmRpdGlvbiBvZiB3YWl0X2V2ZW50X2ludGVy
cnVwdGlibGUoKSBpdCBtdXN0IG5vdA0KPiBzbGVlcC4gVW5mb3J0dW5hdGVseSBzb21lIGZyZWUg
Y2FsbGJhY2tzIChub3RhYmx5IGZvciBQYW5mcm9zdCkgZG8gc2xlZXAuDQo+DQo+IEluc3RlYWQg
bGV0J3MgcmVuYW1lIGRybV9zY2hlZF9jbGVhbnVwX2pvYnMoKSB0bw0KPiBkcm1fc2NoZWRfZ2V0
X2NsZWFudXBfam9iKCkgYW5kIHNpbXBseSByZXR1cm4gYSBqb2IgZm9yIHByb2Nlc3NpbmcgaWYN
Cj4gdGhlcmUgaXMgb25lLiBUaGUgY2FsbGVyIGNhbiB0aGVuIGNhbGwgdGhlIGZyZWVfam9iKCkg
Y2FsbGJhY2sgb3V0c2lkZQ0KPiB0aGUgd2FpdF9ldmVudF9pbnRlcnJ1cHRpYmxlKCkgd2hlcmUg
c2xlZXBpbmcgaXMgcG9zc2libGUgYmVmb3JlDQo+IHJlLWNoZWNraW5nIGFuZCByZXR1cm5pbmcg
dG8gc2xlZXAgaWYgbmVjZXNzYXJ5Lg0KPg0KPiBUZXN0ZWQtYnk6IENocmlzdGlhbiBHbWVpbmVy
IDxjaHJpc3RpYW4uZ21laW5lckBnbWFpbC5jb20+DQo+IEZpeGVzOiA1OTE4MDQ1YzRlZDQgKCJk
cm0vc2NoZWR1bGVyOiByZXdvcmsgam9iIGRlc3RydWN0aW9uIikNCj4gU2lnbmVkLW9mZi1ieTog
U3RldmVuIFByaWNlIDxzdGV2ZW4ucHJpY2VAYXJtLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IENocmlz
dGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCg0KR29pbmcgdG8gcGljayB0
aGF0IHVwIGZvciBkcm0tbWlzYy1uZXh0Lg0KDQpUaGFua3MgZm9yIHRoZSBoZWxwLA0KQ2hyaXN0
aWFuLg0KDQo+IC0tLQ0KPiBDaGFuZ2VzIHNpbmNlIHY0Og0KPiAgICogRG9uJ3QgaW5pdGlhbGlz
ZSBqb2IgaW4gZHJtX3NjaGVkX2dldF9jbGVhbnVwX2pvYigpDQo+ICAgKiBDaGFuZ2Ugd2hpbGUg
bG9vcCBpbnRvIGlmIGluIGRybV9zY2hlZF9tYWluKCkNCj4NCj4gICBkcml2ZXJzL2dwdS9kcm0v
c2NoZWR1bGVyL3NjaGVkX21haW4uYyB8IDQzICsrKysrKysrKysrKysrLS0tLS0tLS0tLS0tDQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQ0KPg0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMgYi9k
cml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYw0KPiBpbmRleCA5YTBlZTc0ZDgy
ZGMuLmQ0Y2M3Mjg5MTQ3ZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxl
ci9zY2hlZF9tYWluLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9t
YWluLmMNCj4gQEAgLTYyMiw0MyArNjIyLDQxIEBAIHN0YXRpYyB2b2lkIGRybV9zY2hlZF9wcm9j
ZXNzX2pvYihzdHJ1Y3QgZG1hX2ZlbmNlICpmLCBzdHJ1Y3QgZG1hX2ZlbmNlX2NiICpjYikNCj4g
ICB9DQo+ICAgDQo+ICAgLyoqDQo+IC0gKiBkcm1fc2NoZWRfY2xlYW51cF9qb2JzIC0gZGVzdHJv
eSBmaW5pc2hlZCBqb2JzDQo+ICsgKiBkcm1fc2NoZWRfZ2V0X2NsZWFudXBfam9iIC0gZmV0Y2gg
dGhlIG5leHQgZmluaXNoZWQgam9iIHRvIGJlIGRlc3Ryb3llZA0KPiAgICAqDQo+ICAgICogQHNj
aGVkOiBzY2hlZHVsZXIgaW5zdGFuY2UNCj4gICAgKg0KPiAtICogUmVtb3ZlIGFsbCBmaW5pc2hl
ZCBqb2JzIGZyb20gdGhlIG1pcnJvciBsaXN0IGFuZCBkZXN0cm95IHRoZW0uDQo+ICsgKiBSZXR1
cm5zIHRoZSBuZXh0IGZpbmlzaGVkIGpvYiBmcm9tIHRoZSBtaXJyb3IgbGlzdCAoaWYgdGhlcmUg
aXMgb25lKQ0KPiArICogcmVhZHkgZm9yIGl0IHRvIGJlIGRlc3Ryb3llZC4NCj4gICAgKi8NCj4g
LXN0YXRpYyB2b2lkIGRybV9zY2hlZF9jbGVhbnVwX2pvYnMoc3RydWN0IGRybV9ncHVfc2NoZWR1
bGVyICpzY2hlZCkNCj4gK3N0YXRpYyBzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqDQo+ICtkcm1fc2No
ZWRfZ2V0X2NsZWFudXBfam9iKHN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciAqc2NoZWQpDQo+ICAg
ew0KPiArCXN0cnVjdCBkcm1fc2NoZWRfam9iICpqb2I7DQo+ICAgCXVuc2lnbmVkIGxvbmcgZmxh
Z3M7DQo+ICAgDQo+ICAgCS8qIERvbid0IGRlc3Ryb3kgam9icyB3aGlsZSB0aGUgdGltZW91dCB3
b3JrZXIgaXMgcnVubmluZyAqLw0KPiAgIAlpZiAoc2NoZWQtPnRpbWVvdXQgIT0gTUFYX1NDSEVE
VUxFX1RJTUVPVVQgJiYNCj4gICAJICAgICFjYW5jZWxfZGVsYXllZF93b3JrKCZzY2hlZC0+d29y
a190ZHIpKQ0KPiAtCQlyZXR1cm47DQo+IC0NCj4gKwkJcmV0dXJuIE5VTEw7DQo+ICAgDQo+IC0J
d2hpbGUgKCFsaXN0X2VtcHR5KCZzY2hlZC0+cmluZ19taXJyb3JfbGlzdCkpIHsNCj4gLQkJc3Ry
dWN0IGRybV9zY2hlZF9qb2IgKmpvYjsNCj4gKwlzcGluX2xvY2tfaXJxc2F2ZSgmc2NoZWQtPmpv
Yl9saXN0X2xvY2ssIGZsYWdzKTsNCj4gICANCj4gLQkJam9iID0gbGlzdF9maXJzdF9lbnRyeSgm
c2NoZWQtPnJpbmdfbWlycm9yX2xpc3QsDQo+ICsJam9iID0gbGlzdF9maXJzdF9lbnRyeV9vcl9u
dWxsKCZzY2hlZC0+cmluZ19taXJyb3JfbGlzdCwNCj4gICAJCQkJICAgICAgIHN0cnVjdCBkcm1f
c2NoZWRfam9iLCBub2RlKTsNCj4gLQkJaWYgKCFkbWFfZmVuY2VfaXNfc2lnbmFsZWQoJmpvYi0+
c19mZW5jZS0+ZmluaXNoZWQpKQ0KPiAtCQkJYnJlYWs7DQo+ICAgDQo+IC0JCXNwaW5fbG9ja19p
cnFzYXZlKCZzY2hlZC0+am9iX2xpc3RfbG9jaywgZmxhZ3MpOw0KPiArCWlmIChqb2IgJiYgZG1h
X2ZlbmNlX2lzX3NpZ25hbGVkKCZqb2ItPnNfZmVuY2UtPmZpbmlzaGVkKSkgew0KPiAgIAkJLyog
cmVtb3ZlIGpvYiBmcm9tIHJpbmdfbWlycm9yX2xpc3QgKi8NCj4gICAJCWxpc3RfZGVsX2luaXQo
JmpvYi0+bm9kZSk7DQo+IC0JCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnNjaGVkLT5qb2JfbGlz
dF9sb2NrLCBmbGFncyk7DQo+IC0NCj4gLQkJc2NoZWQtPm9wcy0+ZnJlZV9qb2Ioam9iKTsNCj4g
Kwl9IGVsc2Ugew0KPiArCQlqb2IgPSBOVUxMOw0KPiArCQkvKiBxdWV1ZSB0aW1lb3V0IGZvciBu
ZXh0IGpvYiAqLw0KPiArCQlkcm1fc2NoZWRfc3RhcnRfdGltZW91dChzY2hlZCk7DQo+ICAgCX0N
Cj4gICANCj4gLQkvKiBxdWV1ZSB0aW1lb3V0IGZvciBuZXh0IGpvYiAqLw0KPiAtCXNwaW5fbG9j
a19pcnFzYXZlKCZzY2hlZC0+am9iX2xpc3RfbG9jaywgZmxhZ3MpOw0KPiAtCWRybV9zY2hlZF9z
dGFydF90aW1lb3V0KHNjaGVkKTsNCj4gICAJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmc2NoZWQt
PmpvYl9saXN0X2xvY2ssIGZsYWdzKTsNCj4gICANCj4gKwlyZXR1cm4gam9iOw0KPiAgIH0NCj4g
ICANCj4gICAvKioNCj4gQEAgLTY5OCwxMiArNjk2LDE5IEBAIHN0YXRpYyBpbnQgZHJtX3NjaGVk
X21haW4odm9pZCAqcGFyYW0pDQo+ICAgCQlzdHJ1Y3QgZHJtX3NjaGVkX2ZlbmNlICpzX2ZlbmNl
Ow0KPiAgIAkJc3RydWN0IGRybV9zY2hlZF9qb2IgKnNjaGVkX2pvYjsNCj4gICAJCXN0cnVjdCBk
bWFfZmVuY2UgKmZlbmNlOw0KPiArCQlzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqY2xlYW51cF9qb2Ig
PSBOVUxMOw0KPiAgIA0KPiAgIAkJd2FpdF9ldmVudF9pbnRlcnJ1cHRpYmxlKHNjaGVkLT53YWtl
X3VwX3dvcmtlciwNCj4gLQkJCQkJIChkcm1fc2NoZWRfY2xlYW51cF9qb2JzKHNjaGVkKSwNCj4g
KwkJCQkJIChjbGVhbnVwX2pvYiA9IGRybV9zY2hlZF9nZXRfY2xlYW51cF9qb2Ioc2NoZWQpKSB8
fA0KPiAgIAkJCQkJICghZHJtX3NjaGVkX2Jsb2NrZWQoc2NoZWQpICYmDQo+ICAgCQkJCQkgIChl
bnRpdHkgPSBkcm1fc2NoZWRfc2VsZWN0X2VudGl0eShzY2hlZCkpKSB8fA0KPiAtCQkJCQkga3Ro
cmVhZF9zaG91bGRfc3RvcCgpKSk7DQo+ICsJCQkJCSBrdGhyZWFkX3Nob3VsZF9zdG9wKCkpOw0K
PiArDQo+ICsJCWlmIChjbGVhbnVwX2pvYikgew0KPiArCQkJc2NoZWQtPm9wcy0+ZnJlZV9qb2Io
Y2xlYW51cF9qb2IpOw0KPiArCQkJLyogcXVldWUgdGltZW91dCBmb3IgbmV4dCBqb2IgKi8NCj4g
KwkJCWRybV9zY2hlZF9zdGFydF90aW1lb3V0KHNjaGVkKTsNCj4gKwkJfQ0KPiAgIA0KPiAgIAkJ
aWYgKCFlbnRpdHkpDQo+ICAgCQkJY29udGludWU7DQoNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
