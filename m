Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D55810953A
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 22:44:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B77989CB9;
	Mon, 25 Nov 2019 21:44:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680044.outbound.protection.outlook.com [40.107.68.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D457689CB9;
 Mon, 25 Nov 2019 21:44:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RSFEGH6bfrnYevdTZxr2CbH/zm/nBw2T3wsbfhSUYHwJzeA1pAZoFWpXG7SyWagJOu3D8MFcrJsOM3ZBzh2meMt45r9WCZZMNK4+DpEHBIwo/cECU0v+hhHxMa5y4JXETo76zE5qitYq2+tN/3+C88obUhT3gueAc6pQNMFL0FsEGPzJBQDU06Ez5ITFt9F7EJX1yUwQqofXk+aajE3O8WOwXE259g9GabVooAKtzHDziWRkqbBtcSUzm9ytkiUFdl1T1AQENJ3WGDNiUgA4Y09fH9b+fB+QdTgV8z7jExkDw/qrhFR0H22AM3miTgbdhhVGJF70aGGB40Pyhvos7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O35lWvAMjqaAWvOdIwEcewsW1vKglOeSu6Al0nbGFjk=;
 b=C0VAq0voaFnKWW/9ZcMNaAhcNMb9rfuCCE82NBWIl+uAHrmFgERdz8yJNQMoXHWZKUnvXa3AoiLvLU8vqTVhsFRm3PsrmAWHV/7tzlu3FmGHkTUYwvRKBNU64Es68FRgCiLRKvLymPiHttH7W488niOuF2PDPlUv6FycyJgFYjlzJ3lTTarlXxQ1q1SxYAU+WIhpjcfMhZWnoSS4jTincJMfiJdSUYoTXKV2X1EErQHTYERjFI737qXxRIy/5B1Adymy5Lg1vczcrcma5UIyKTluDqtJ9pVkEa/Wxo/qI8DPREJDAz5NzlhwFsLfSQN0CGNSwWmbvKgj8SMXC1uVoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB2975.namprd12.prod.outlook.com (20.178.243.142) by
 MN2PR12MB3760.namprd12.prod.outlook.com (10.255.239.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.21; Mon, 25 Nov 2019 21:44:37 +0000
Received: from MN2PR12MB2975.namprd12.prod.outlook.com
 ([fe80::49e3:7f2c:931c:36e7]) by MN2PR12MB2975.namprd12.prod.outlook.com
 ([fe80::49e3:7f2c:931c:36e7%7]) with mapi id 15.20.2474.023; Mon, 25 Nov 2019
 21:44:37 +0000
From: "Deng, Emily" <Emily.Deng@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
Subject: RE: [PATCH v4] drm/scheduler: Avoid accessing freed bad job.
Thread-Topic: [PATCH v4] drm/scheduler: Avoid accessing freed bad job.
Thread-Index: AQHVo9IhnWBRQA7TSUuQ4gUMKSHN+6eca1Gw
Date: Mon, 25 Nov 2019 21:44:36 +0000
Message-ID: <MN2PR12MB2975C10E36FF996BD423CEBA8F4A0@MN2PR12MB2975.namprd12.prod.outlook.com>
References: <1574715089-14875-1-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1574715089-14875-1-git-send-email-andrey.grodzovsky@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2019-11-25T21:44:35Z; 
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=ba798891-0c1f-4515-b3d1-0000d57d5943;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_enabled: true
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2019-11-25T21:44:35Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: 66b76e56-6ca4-442f-9ff0-0000092550fe
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
x-originating-ip: [165.204.53.123]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c332a642-60bd-4c08-f912-08d771f0ab0a
x-ms-traffictypediagnostic: MN2PR12MB3760:|MN2PR12MB3760:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB376059ACC83D0CD69C66C3848F4A0@MN2PR12MB3760.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0232B30BBC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(39860400002)(136003)(346002)(366004)(189003)(199004)(13464003)(26005)(76176011)(7696005)(6436002)(11346002)(99286004)(64756008)(66556008)(66476007)(66446008)(33656002)(229853002)(66574012)(5660300002)(4326008)(6862004)(52536014)(86362001)(66946007)(102836004)(71190400001)(71200400001)(9686003)(55016002)(6506007)(66066001)(6246003)(6636002)(14454004)(256004)(14444005)(25786009)(316002)(7736002)(74316002)(305945005)(76116006)(8676002)(6116002)(81156014)(3846002)(81166006)(8936002)(2906002)(446003)(54906003)(478600001)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3760;
 H:MN2PR12MB2975.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2/9i9wM40JxFcp9w8oBxoVBuRHnNO3NpXoItQc+/UxNgPg7KvPMB7j5r+5V7YJ840F/M2v3Q5JuwmjhioMRS6iFO+tUEkjSVE9e4fKh5GN+uoi8Rd/6unvfQJAFjN+kJNgZxy/znW8UdJd0Y0o1KyxT5+Cs+PwLzlA/rVDxbOyndAZsycyVbDgVeYCuPzP6Y7LfZFXUL8SNHpgOMK+Nv1PuuPEzGIswwUJw2ou+ZcTwjRw0Q5HGBBfkQqyMS0oG/lr+LpJ3CKPhleMBsM1uQAmSNZiR1N7sHUti2j0g5N3oBtF5cYsNn5fftObXApcDo5y2EGPsGIqPQCFMGdpJYH0DBukE3EXm6zDA96Z8I4vBh78DjWjRH5rFmU2x/OHw7l/rG73lN4PvVlJyaxGRyeBVNf/VnQe+xM+oY/21+Uetgb1xOWsL6mLdMn+xAN+By
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c332a642-60bd-4c08-f912-08d771f0ab0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2019 21:44:37.0198 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 39PKvOyPdZmyicW+VnRBvZPYvFGRfY30eTQSgUzlfbCLB2DjW/z/yX2qM+qjKB+0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3760
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O35lWvAMjqaAWvOdIwEcewsW1vKglOeSu6Al0nbGFjk=;
 b=jmI2Ym4cPNY44/CAGw+nv9U/FZTtAhveBHBMw6yh2ypsu5r725pKsfxgA933eTm1zKMRqz83O2QAmhLr2oiK9Q5mONQhT0MblIJyV82RNfpjM85voNCLyhgz+ScrzeiyEwYZ4qc36IkAzPYI+T405X6DUgmH9MNqnmKMr1lfres=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Emily.Deng@amd.com; 
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
Cc: "steven.price@arm.com" <steven.price@arm.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Koenig, 
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEludGVybmFsIERpc3RyaWJ1dGlvbiBPbmx5XQ0KDQpI
aSBBbmRyZXksDQogICAgU2VlbXMgeW91IGRpZG4ndCBzdWJtaXQgdGhpcyBwYXRjaD8NCg0KQmVz
dCB3aXNoZXMNCkVtaWx5IERlbmcNCg0KDQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PkZyb206IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPg0KPlNl
bnQ6IE1vbmRheSwgTm92ZW1iZXIgMjUsIDIwMTkgMTI6NTEgUE0NCj5DYzogZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZzsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IEtvZW5p
ZywNCj5DaHJpc3RpYW4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT47IERlbmcsIEVtaWx5DQo+
PEVtaWx5LkRlbmdAYW1kLmNvbT47IHN0ZXZlbi5wcmljZUBhcm0uY29tOyBHcm9kem92c2t5LCBB
bmRyZXkNCj48QW5kcmV5Lkdyb2R6b3Zza3lAYW1kLmNvbT4NCj5TdWJqZWN0OiBbUEFUQ0ggdjRd
IGRybS9zY2hlZHVsZXI6IEF2b2lkIGFjY2Vzc2luZyBmcmVlZCBiYWQgam9iLg0KPg0KPlByb2Js
ZW06DQo+RHVlIHRvIGEgcmFjZSBiZXR3ZWVuIGRybV9zY2hlZF9jbGVhbnVwX2pvYnMgaW4gc2No
ZWQgdGhyZWFkIGFuZA0KPmRybV9zY2hlZF9qb2JfdGltZWRvdXQgaW4gdGltZW91dCB3b3JrIHRo
ZXJlIGlzIGEgcG9zc2libGl0eSB0aGF0IGJhZCBqb2INCj53YXMgYWxyZWFkeSBmcmVlZCB3aGls
ZSBzdGlsbCBiZWluZyBhY2Nlc3NlZCBmcm9tIHRoZSB0aW1lb3V0IHRocmVhZC4NCj4NCj5GaXg6
DQo+SW5zdGVhZCBvZiBqdXN0IHBlZWtpbmcgYXQgdGhlIGJhZCBqb2IgaW4gdGhlIG1pcnJvciBs
aXN0IHJlbW92ZSBpdCBmcm9tIHRoZSBsaXN0DQo+dW5kZXIgbG9jayBhbmQgdGhlbiBwdXQgaXQg
YmFjayBsYXRlciB3aGVuIHdlIGFyZSBnYXJhbnRlZWQgbm8gcmFjZSB3aXRoDQo+bWFpbiBzY2hl
ZCB0aHJlYWQgaXMgcG9zc2libGUgd2hpY2ggaXMgYWZ0ZXIgdGhlIHRocmVhZCBpcyBwYXJrZWQu
DQo+DQo+djI6IExvY2sgYXJvdW5kIHByb2Nlc3NpbmcgcmluZ19taXJyb3JfbGlzdCBpbiBkcm1f
c2NoZWRfY2xlYW51cF9qb2JzLg0KPg0KPnYzOiBSZWJhc2Ugb24gdG9wIG9mIGRybS1taXNjLW5l
eHQuIHYyIGlzIG5vdCBuZWVkZWQgYW55bW9yZSBhcw0KPmRybV9zY2hlZF9nZXRfY2xlYW51cF9q
b2IgYWxyZWFkeSBoYXMgYSBsb2NrIHRoZXJlLg0KPg0KPnY0OiBGaXggY29tbWVudHMgdG8gcmVs
ZmVjdCBsYXRlc3QgY29kZSBpbiBkcm0tbWlzYy4NCj4NCj5TaWduZWQtb2ZmLWJ5OiBBbmRyZXkg
R3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4NCj5SZXZpZXdlZC1ieTogQ2hy
aXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPlRlc3RlZC1ieTogRW1p
bHkgRGVuZyA8RW1pbHkuRGVuZ0BhbWQuY29tPg0KPi0tLQ0KPiBkcml2ZXJzL2dwdS9kcm0vc2No
ZWR1bGVyL3NjaGVkX21haW4uYyB8IDI3DQo+KysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+
IDEgZmlsZSBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspDQo+DQo+ZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jDQo+Yi9kcml2ZXJzL2dwdS9kcm0vc2No
ZWR1bGVyL3NjaGVkX21haW4uYw0KPmluZGV4IDY3NzQ5NTUuLjFiZjljNDAgMTAwNjQ0DQo+LS0t
IGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMNCj4rKysgYi9kcml2ZXJz
L2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYw0KPkBAIC0yODQsMTAgKzI4NCwyMSBAQCBz
dGF0aWMgdm9pZCBkcm1fc2NoZWRfam9iX3RpbWVkb3V0KHN0cnVjdA0KPndvcmtfc3RydWN0ICp3
b3JrKQ0KPiAJdW5zaWduZWQgbG9uZyBmbGFnczsNCj4NCj4gCXNjaGVkID0gY29udGFpbmVyX29m
KHdvcmssIHN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciwNCj53b3JrX3Rkci53b3JrKTsNCj4rDQo+
KwkvKiBQcm90ZWN0cyBhZ2FpbnN0IGNvbmN1cnJlbnQgZGVsZXRpb24gaW4NCj5kcm1fc2NoZWRf
Z2V0X2NsZWFudXBfam9iICovDQo+KwlzcGluX2xvY2tfaXJxc2F2ZSgmc2NoZWQtPmpvYl9saXN0
X2xvY2ssIGZsYWdzKTsNCj4gCWpvYiA9IGxpc3RfZmlyc3RfZW50cnlfb3JfbnVsbCgmc2NoZWQt
PnJpbmdfbWlycm9yX2xpc3QsDQo+IAkJCQkgICAgICAgc3RydWN0IGRybV9zY2hlZF9qb2IsIG5v
ZGUpOw0KPg0KPiAJaWYgKGpvYikgew0KPisJCS8qDQo+KwkJICogUmVtb3ZlIHRoZSBiYWQgam9i
IHNvIGl0IGNhbm5vdCBiZSBmcmVlZCBieSBjb25jdXJyZW50DQo+KwkJICogZHJtX3NjaGVkX2Ns
ZWFudXBfam9icy4gSXQgd2lsbCBiZSByZWluc2VydGVkIGJhY2sgYWZ0ZXINCj5zY2hlZC0+dGhy
ZWFkDQo+KwkJICogaXMgcGFya2VkIGF0IHdoaWNoIHBvaW50IGl0J3Mgc2FmZS4NCj4rCQkgKi8N
Cj4rCQlsaXN0X2RlbF9pbml0KCZqb2ItPm5vZGUpOw0KPisJCXNwaW5fdW5sb2NrX2lycXJlc3Rv
cmUoJnNjaGVkLT5qb2JfbGlzdF9sb2NrLCBmbGFncyk7DQo+Kw0KPiAJCWpvYi0+c2NoZWQtPm9w
cy0+dGltZWRvdXRfam9iKGpvYik7DQo+DQo+IAkJLyoNCj5AQCAtMjk4LDYgKzMwOSw4IEBAIHN0
YXRpYyB2b2lkIGRybV9zY2hlZF9qb2JfdGltZWRvdXQoc3RydWN0DQo+d29ya19zdHJ1Y3QgKndv
cmspDQo+IAkJCWpvYi0+c2NoZWQtPm9wcy0+ZnJlZV9qb2Ioam9iKTsNCj4gCQkJc2NoZWQtPmZy
ZWVfZ3VpbHR5ID0gZmFsc2U7DQo+IAkJfQ0KPisJfSBlbHNlIHsNCj4rCQlzcGluX3VubG9ja19p
cnFyZXN0b3JlKCZzY2hlZC0+am9iX2xpc3RfbG9jaywgZmxhZ3MpOw0KPiAJfQ0KPg0KPiAJc3Bp
bl9sb2NrX2lycXNhdmUoJnNjaGVkLT5qb2JfbGlzdF9sb2NrLCBmbGFncyk7IEBAIC0zNzAsNiAr
MzgzLDIwDQo+QEAgdm9pZCBkcm1fc2NoZWRfc3RvcChzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVsZXIg
KnNjaGVkLCBzdHJ1Y3QNCj5kcm1fc2NoZWRfam9iICpiYWQpDQo+IAlrdGhyZWFkX3Bhcmsoc2No
ZWQtPnRocmVhZCk7DQo+DQo+IAkvKg0KPisJICogUmVpbnNlcnQgYmFjayB0aGUgYmFkIGpvYiBo
ZXJlIC0gbm93IGl0J3Mgc2FmZSBhcw0KPisJICogZHJtX3NjaGVkX2dldF9jbGVhbnVwX2pvYiBj
YW5ub3QgcmFjZSBhZ2FpbnN0IHVzIGFuZCByZWxlYXNlIHRoZQ0KPisJICogYmFkIGpvYiBhdCB0
aGlzIHBvaW50IC0gd2UgcGFya2VkICh3YWl0ZWQgZm9yKSBhbnkgaW4gcHJvZ3Jlc3MNCj4rCSAq
IChlYXJsaWVyKSBjbGVhbnVwcyBhbmQgZHJtX3NjaGVkX2dldF9jbGVhbnVwX2pvYiB3aWxsIG5v
dCBiZQ0KPmNhbGxlZA0KPisJICogbm93IHVudGlsIHRoZSBzY2hlZHVsZXIgdGhyZWFkIGlzIHVu
cGFya2VkLg0KPisJICovDQo+KwlpZiAoYmFkICYmIGJhZC0+c2NoZWQgPT0gc2NoZWQpDQo+KwkJ
LyoNCj4rCQkgKiBBZGQgYXQgdGhlIGhlYWQgb2YgdGhlIHF1ZXVlIHRvIHJlZmxlY3QgaXQgd2Fz
IHRoZSBlYXJsaWVzdA0KPisJCSAqIGpvYiBleHRyYWN0ZWQuDQo+KwkJICovDQo+KwkJbGlzdF9h
ZGQoJmJhZC0+bm9kZSwgJnNjaGVkLT5yaW5nX21pcnJvcl9saXN0KTsNCj4rDQo+KwkvKg0KPiAJ
ICogSXRlcmF0ZSB0aGUgam9iIGxpc3QgZnJvbSBsYXRlciB0byAgZWFybGllciBvbmUgYW5kIGVp
dGhlciBkZWFjdGl2ZQ0KPiAJICogdGhlaXIgSFcgY2FsbGJhY2tzIG9yIHJlbW92ZSB0aGVtIGZy
b20gbWlycm9yIGxpc3QgaWYgdGhleSBhbHJlYWR5DQo+IAkgKiBzaWduYWxlZC4NCj4tLQ0KPjIu
Ny40DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
