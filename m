Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E209DEC937
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 20:45:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 975C06F857;
	Fri,  1 Nov 2019 19:45:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690045.outbound.protection.outlook.com [40.107.69.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAA1E6E2E8;
 Fri,  1 Nov 2019 19:45:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hbnMUrgCcfvsYZj3jZiyXZsfAjm8HeSUMP5NNZVte9UH+K0SOk5jYeFZtJbpuXqhKqiFplPQnNNRcXSGpWj/EwUsfLpt+Pt8x8laF6+LoAiU9QQBKdQRAfyfpX6xYtJ7LaN8Py3GPuVidjRtze6lBbqdI6wpNP282Wd98Ny7on60jaS5MfIihqKDAwnjdyac5wPHcrY8IDQULNI0BBy87QKR4Tv9HoWG6STn3DqGVhrBjgmolc0ss5n92D+YP7mW0CRXpL4NdQG4ayjvi6zPVLdBrilohtwVAcAnH7AO4G1tt9Ec3UEDpDGhiYL1KXvu19iy5xkHSsUyG2p1gYZ7vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U6ng1eFzOPjyGk61V9A5M5rQ6aMj9rG68kA5xXa/boM=;
 b=gzRKXbS1R9uUlAwUCe2xbkZ7xw3SJZIYWMJK4+q+qMw1aVhM/E89tYL7YOKhNkdtuTyU1c9teC/v6CUspEhAcaOCRAJdBTFVv96M5d+hpoasev2k/qWj66Bfk50HL1Twf8jG+7ShcqhONfG24ZIajKCmmIu5D8HGc4iT2FNcr39B6vd7+p5+/QhoSTd7xcZNnD7cHqmbE1Wluf+7VFMXksRWeZ6f0O+Cy6rtdvSbIxRgv4bfhGrtt+zEhCRbvIltvLh7Wukro8bgN3q7luB7ffQeusU3zSDX/k24thZinBSDl/itPFjq+wY/qAE052vVu2tNcW/2J4Y65WUhu19QAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB4030.namprd12.prod.outlook.com (10.255.86.25) by
 MN2PR12MB3005.namprd12.prod.outlook.com (20.178.241.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Fri, 1 Nov 2019 19:45:22 +0000
Received: from MN2PR12MB4030.namprd12.prod.outlook.com
 ([fe80::1ee:c734:15e5:d8b9]) by MN2PR12MB4030.namprd12.prod.outlook.com
 ([fe80::1ee:c734:15e5:d8b9%5]) with mapi id 15.20.2387.027; Fri, 1 Nov 2019
 19:45:22 +0000
From: "Yang, Philip" <Philip.Yang@amd.com>
To: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [PATCH v2 14/15] drm/amdgpu: Use mmu_range_notifier instead of
 hmm_mirror
Thread-Topic: [PATCH v2 14/15] drm/amdgpu: Use mmu_range_notifier instead of
 hmm_mirror
Thread-Index: AQHVjcy5krMagvVO3k2ER8a03a+2l6dyANaAgAAA5gCABGh8AIAAB7mAgAANHgCAABzRAIAAIk6A
Date: Fri, 1 Nov 2019 19:45:22 +0000
Message-ID: <fc6ded68-287b-5257-db79-42c92458a5f6@amd.com>
References: <20191028201032.6352-1-jgg@ziepe.ca>
 <20191028201032.6352-15-jgg@ziepe.ca>
 <a456ebd0-28cf-997b-31ff-72d9077a9b8e@amd.com>
 <20191029192544.GU22766@mellanox.com>
 <30b2f569-bf7a-5166-c98d-4a4a13d1351f@amd.com>
 <20191101151222.GN22766@mellanox.com>
 <8280fb65-a897-3d71-79f9-9f80d9e474e9@amd.com>
 <20191101174221.GO22766@mellanox.com>
In-Reply-To: <20191101174221.GO22766@mellanox.com>
Accept-Language: en-ZA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0016.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::29) To MN2PR12MB4030.namprd12.prod.outlook.com
 (2603:10b6:208:159::25)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 16257bc4-a1e0-4e3e-08d5-08d75f04082a
x-ms-traffictypediagnostic: MN2PR12MB3005:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3005AEDBF9270C73A2F2EB89E6620@MN2PR12MB3005.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 020877E0CB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(366004)(376002)(136003)(199004)(189003)(99286004)(446003)(11346002)(86362001)(2616005)(476003)(76176011)(478600001)(52116002)(31686004)(386003)(6506007)(53546011)(71200400001)(4326008)(71190400001)(64756008)(66446008)(66946007)(66556008)(66476007)(14454004)(102836004)(26005)(256004)(25786009)(14444005)(486006)(36756003)(186003)(31696002)(66066001)(8676002)(229853002)(2906002)(6512007)(81166006)(54906003)(6246003)(8936002)(6486002)(6436002)(6116002)(3846002)(316002)(81156014)(7416002)(6916009)(305945005)(5660300002)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3005;
 H:MN2PR12MB4030.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oo0hFaaW2PJY9SpKfNXyacnczN/0DWfGGQcNXHUT/wSbKXTTLJeLPXZWYljLpJxu2yXMmZB3fLjmR1aAIEUq4AYvZ3kRI9tIIvAG2IAvNULdwkdKUxJt/jQ953ijzriNgSs4OlCdd/zbIzB37CZzyt+jzn9JA5rO3aQZtYxRGsOZ+PbGewyoVDR/TMavyUxk9J8UwdsIUURMCN0XbZRa9Uj3TMiAeQgxdAMpA/HBVXxXlLAonzSX2fWSn67ykju58vdSVJ2VQc1tp64k53b92cXBOBV3mjOlqpbUvXIgtOXMtOJkHrDHA6szCeRu77biFn208wDf61kbTpaa7o9q3Kw9qVo0lfiFNhRKyEv1yEXg4XK7PXiJjZYTuOmEXOEXUuPsTIMvRoeT+tfbkjdCPa6Xi0vE6lHpPNr7C29ebZOCzTC3GfiszEb71oFO3FVl
Content-ID: <70389B827339AC4C803740DD25F675F6@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16257bc4-a1e0-4e3e-08d5-08d75f04082a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2019 19:45:22.0393 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V7/Hjoc7x454oZUChB905mGApsaqrZyaB+wbFEGwn0/hxvmwPdOZONpO4QnH5hOb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3005
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U6ng1eFzOPjyGk61V9A5M5rQ6aMj9rG68kA5xXa/boM=;
 b=xW8FonpoXI5EDW0HOyjVveKexJrCuJQoe6iTmDZn0JVOBDxyN5634dI5Klb+FEJk9Un+ML/6DPWn5QfdnBrCA7AjsJ289uaEoPTWlAPoOrawvAQIfMpZQhpXvG91FX3s+es2dIP5tksPsiRr4q1d77tHa6KoZMubFvtAIweqB0A=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Philip.Yang@amd.com; 
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>, Ben Skeggs <bskeggs@redhat.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ralph Campbell <rcampbell@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Jerome Glisse <jglisse@redhat.com>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Petr Cvek <petrcvekcz@gmail.com>,
 Juergen Gross <jgross@suse.com>, Mike Marciniszyn <mike.marciniszyn@intel.com>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCk9uIDIwMTktMTEtMDEgMTo0MiBwLm0uLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6DQo+IE9u
IEZyaSwgTm92IDAxLCAyMDE5IGF0IDAzOjU5OjI2UE0gKzAwMDAsIFlhbmcsIFBoaWxpcCB3cm90
ZToNCj4+PiBUaGlzIHRlc3QgZm9yIHJhbmdlX2Jsb2NrYWJsZSBzaG91bGQgYmUgYmVmb3JlIG11
dGV4X2xvY2ssIEkgY2FuIG1vdmUNCj4+PiBpdCB1cA0KPj4+DQo+PiB5ZXMsIHRoYW5rcy4NCj4g
DQo+IE9rYXksIEkgd3JvdGUgaXQgbGlrZSB0aGlzOg0KPiANCj4gCWlmIChtbXVfbm90aWZpZXJf
cmFuZ2VfYmxvY2thYmxlKHJhbmdlKSkNCj4gCQltdXRleF9sb2NrKCZhZGV2LT5ub3RpZmllcl9s
b2NrKTsNCj4gCWVsc2UgaWYgKCFtdXRleF90cnlsb2NrKCZhZGV2LT5ub3RpZmllcl9sb2NrKSkN
Cj4gCQlyZXR1cm4gZmFsc2U7DQo+IA0KPj4+IEFsc28sIGRvIHlvdSBrbm93IGlmIG5vdGlmaWVy
X2xvY2sgaXMgaGVsZCB3aGlsZSBjYWxsaW5nDQo+Pj4gYW1kZ3B1X3R0bV90dF9nZXRfdXNlcl9w
YWdlc19kb25lKCk/IENhbiB3ZSBhZGQgYSAnbG9jayBhc3NlcnQgaGVsZCcNCj4+PiB0byBhbWRn
cHVfdHRtX3R0X2dldF91c2VyX3BhZ2VzX2RvbmUoKT8NCj4+DQo+PiBncHUgc2lkZSBob2xkIG5v
dGlmaWVyX2xvY2sgYnV0IGtmZCBzaWRlIGRvZXNuJ3QuIGtmZCBzaWRlIGRvZXNuJ3QgY2hlY2sN
Cj4+IGFtZGdwdV90dG1fdHRfZ2V0X3VzZXJfcGFnZXNfZG9uZS9tbXVfcmFuZ2VfcmVhZF9yZXRy
eSByZXR1cm4gdmFsdWUgYnV0DQo+PiBjaGVjayBtZW0tPmludmFsaWQgZmxhZyB3aGljaCBpcyB1
cGRhdGVkIGZyb20gaW52YWxpZGF0ZSBjYWxsYmFjay4gSXQNCj4+IHRha2VzIG1vcmUgdGltZSB0
byBjaGFuZ2UsIEkgd2lsbCBjb21lIHRvIGFub3RoZXIgcGF0Y2ggdG8gZml4IGl0IGxhdGVyLg0K
PiANCj4gQWguLiBjb25mdXNpbmcsIE9LLCBJJ2xsIGxldCB5b3Ugc29ydCB0aGF0DQo+IA0KPj4+
IEhvd2V2ZXIsIHRoaXMgaXMgYWxsIHByZS1leGlzdGluZyBidWdzLCBzbyBJJ20gT0sgZ28gYWhl
YWQgd2l0aCB0aGlzDQo+Pj4gcGF0Y2ggYXMgbW9kaWZpZWQuIEkgYWR2aXNlIEFNRCB0byBtYWtl
IGEgZm9sbG93dXAgcGF0Y2ggLi4NCj4+Pg0KPj4geWVzLCBJIHdpbGwuDQo+IA0KPiBXaGlsZSB5
b3UgYXJlIGhlcmUsIHRoaXMgaXMgYWxzbyB3cm9uZzoNCj4gDQo+IGludCBhbWRncHVfdHRtX3R0
X2dldF91c2VyX3BhZ2VzKHN0cnVjdCBhbWRncHVfYm8gKmJvLCBzdHJ1Y3QgcGFnZSAqKnBhZ2Vz
KQ0KPiB7DQo+IAlkb3duX3JlYWQoJm1tLT5tbWFwX3NlbSk7DQo+IAlyID0gaG1tX3JhbmdlX2Zh
dWx0KHJhbmdlLCAwKTsNCj4gCXVwX3JlYWQoJm1tLT5tbWFwX3NlbSk7DQo+IAlpZiAodW5saWtl
bHkociA8PSAwKSkgew0KPiAJCWlmICgociA9PSAwIHx8IHIgPT0gLUVCVVNZKSAmJiAhdGltZV9h
ZnRlcihqaWZmaWVzLCB0aW1lb3V0KSkNCj4gCQkJZ290byByZXRyeTsNCj4gCQlnb3RvIG91dF9m
cmVlX3BmbnM7DQo+IAl9DQo+IA0KPiAJZm9yIChpID0gMDsgaSA8IHR0bS0+bnVtX3BhZ2VzOyBp
KyspIHsNCj4gCQlwYWdlc1tpXSA9IGhtbV9kZXZpY2VfZW50cnlfdG9fcGFnZShyYW5nZSwgcmFu
Z2UtPnBmbnNbaV0pOw0KPiANCj4gSXQgaXMgbm90IGFsbG93ZWQgdG8gcmVhZCB0aGUgcmVzdWx0
cyBvZiBobW1fcmFuZ2VfZmF1bHQoKSBvdXRzaWRlDQo+IGxvY2tpbmcsIGFuZCBpbiBwYXJ0aWN1
bGFyLCB3ZSBjYW4ndCBjb252ZXJ0IHRvIGEgc3RydWN0IHBhZ2UuDQo+IA0KPiBUaGlzIG11c3Qg
YmUgZG9uZSBpbnNpZGUgdGhlIG5vdGlmaWVyX2xvY2ssIGFmdGVyIGNoZWNraW5nDQo+IG1tdV9y
YW5nZV9yZWFkX3JldHJ5KCksIGFsbCBoYW5kbGluZyBvZiB0aGUgc3RydWN0IHBhZ2UgbXVzdCBi
ZQ0KPiBzdHJ1Y3R1cmVkIGxpa2UgdGhhdC4NCj4gDQpCZWxvdyBjaGFuZ2Ugd2lsbCBmaXggdGhp
cywgdGhlbiBkcml2ZXIgd2lsbCBjYWxsIG1tdV9yYW5nZV9yZWFkX3JldHJ5IA0Kc2Vjb25kIHRp
bWUgdXNpbmcgc2FtZSByYW5nZS0+bm90aWZpZXJfc2VxIHRvIGNoZWNrIGlmIHJhbmdlIGlzIA0K
aW52YWxpZGF0ZWQgaW5zaWRlIGFtZGdwdV9jc19zdWJtaXQsIHRoaXMgbG9va3Mgb2sgZm9yIG1l
Lg0KDQpAQCAtODY4LDYgKzg2OSwxMyBAQCBpbnQgYW1kZ3B1X3R0bV90dF9nZXRfdXNlcl9wYWdl
cyhzdHJ1Y3QgYW1kZ3B1X2JvIA0KKmJvLCBzdHJ1Y3QgcGFnZSAqKnBhZ2VzKQ0KICAgICAgICAg
ICAgICAgICBnb3RvIG91dF9mcmVlX3BmbnM7DQogICAgICAgICB9DQoNCisgICAgICAgbXV0ZXhf
bG9jaygmYWRldi0+bm90aWZpZXJfbG9jayk7DQorDQorICAgICAgIGlmIChtbXVfcmFuZ2VfcmVh
ZF9yZXRyeSgmYm8tPm5vdGlmaWVyLCByYW5nZS0+bm90aWZpZXJfc2VxKSkgew0KKyAgICAgICAg
ICAgICAgIG11dGV4X3VubG9jaygmYWRldi0+bm90aWZpZXJfbG9jayk7DQorICAgICAgICAgICAg
ICAgZ290byByZXRyeTsNCisgICAgICAgfQ0KKw0KICAgICAgICAgZm9yIChpID0gMDsgaSA8IHR0
bS0+bnVtX3BhZ2VzOyBpKyspIHsNCiAgICAgICAgICAgICAgICAgcGFnZXNbaV0gPSBobW1fZGV2
aWNlX2VudHJ5X3RvX3BhZ2UocmFuZ2UsIHJhbmdlLT5wZm5zW2ldKTsNCiAgICAgICAgICAgICAg
ICAgaWYgKHVubGlrZWx5KCFwYWdlc1tpXSkpIHsNCkBAIC04NzUsMTAgKzg4MywxMiBAQCBpbnQg
YW1kZ3B1X3R0bV90dF9nZXRfdXNlcl9wYWdlcyhzdHJ1Y3QgYW1kZ3B1X2JvIA0KKmJvLCBzdHJ1
Y3QgcGFnZSAqKnBhZ2VzKQ0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpLCByYW5n
ZS0+cGZuc1tpXSk7DQogICAgICAgICAgICAgICAgICAgICAgICAgciA9IC1FTk9NRU07DQoNCisg
ICAgICAgICAgICAgICAgICAgICAgIG11dGV4X3VubG9jaygmYWRldi0+bm90aWZpZXJfbG9jayk7
DQogICAgICAgICAgICAgICAgICAgICAgICAgZ290byBvdXRfZnJlZV9wZm5zOw0KICAgICAgICAg
ICAgICAgICB9DQogICAgICAgICB9DQoNCisgICAgICAgbXV0ZXhfdW5sb2NrKCZhZGV2LT5ub3Rp
Zmllcl9sb2NrKTsNCiAgICAgICAgIGd0dC0+cmFuZ2UgPSByYW5nZTsNCiAgICAgICAgIG1tcHV0
KG1tKTsNCg0KUGhpbGlwDQoNCj4+Pj4gQEAgLTk5NywxMCArMTAwNCwxOCBAQCBzdGF0aWMgdm9p
ZCBhbWRncHVfdHRtX3R0X3VucGluX3VzZXJwdHIoc3RydWN0IHR0bV90dCAqdHRtKQ0KPj4+PiAg
ICAJc2dfZnJlZV90YWJsZSh0dG0tPnNnKTsNCj4+Pj4gICAgDQo+Pj4+ICAgICNpZiBJU19FTkFC
TEVEKENPTkZJR19EUk1fQU1ER1BVX1VTRVJQVFIpDQo+Pj4+IC0JaWYgKGd0dC0+cmFuZ2UgJiYN
Cj4+Pj4gLQkgICAgdHRtLT5wYWdlc1swXSA9PSBobW1fZGV2aWNlX2VudHJ5X3RvX3BhZ2UoZ3R0
LT5yYW5nZSwNCj4+Pj4gLQkJCQkJCSAgICAgIGd0dC0+cmFuZ2UtPnBmbnNbMF0pKQ0KPj4+PiAt
CQlXQVJOX09OQ0UoMSwgIk1pc3NpbmcgZ2V0X3VzZXJfcGFnZV9kb25lXG4iKTsNCj4+Pj4gKwlp
ZiAoZ3R0LT5yYW5nZSkgew0KPj4+PiArCQl1bnNpZ25lZCBsb25nIGk7DQo+Pj4+ICsNCj4+Pj4g
KwkJZm9yIChpID0gMDsgaSA8IHR0bS0+bnVtX3BhZ2VzOyBpKyspIHsNCj4+Pj4gKwkJCWlmICh0
dG0tPnBhZ2VzW2ldICE9DQo+Pj4+ICsJCQkJaG1tX2RldmljZV9lbnRyeV90b19wYWdlKGd0dC0+
cmFuZ2UsDQo+Pj4+ICsJCQkJCSAgICAgIGd0dC0+cmFuZ2UtPnBmbnNbaV0pKQ0KPj4+PiArCQkJ
CWJyZWFrOw0KPj4+PiArCQl9DQo+Pj4+ICsNCj4+Pj4gKwkJV0FSTigoaSA9PSB0dG0tPm51bV9w
YWdlcyksICJNaXNzaW5nIGdldF91c2VyX3BhZ2VfZG9uZVxuIik7DQo+Pj4+ICsJfQ0KPj4+DQo+
Pj4gSXMgdGhpcyByZWxhdGVkL25lY2Vzc2FyeT8gSSBjYW4gcHV0IGl0IGluIGFub3RoZXIgcGF0
Y2ggaWYgaXQgaXMganVzdA0KPj4+IGRlYnVnZ2luZyBpbXByb3ZlbWVudD8gUGxlYXNlIGFkdmlz
ZQ0KPj4+DQo+PiBJIHNlZSB0aGlzIFdBUk4gYmFja3RyYWNlIG5vdywgYnV0IEkgZGlkbid0IHNl
ZSBpdCBiZWZvcmUuIFRoaXMgaXMNCj4+IHNvbWVob3cgcmVsYXRlZC4NCj4gDQo+IEhtLCBtaWdo
dCBiZSBpbnN0cnVjdGl2ZSB0byBsZWFybiB3aGF0IGlzIGdvaW5nIG9uLi4NCj4gDQo+IFRoYW5r
cywNCj4gSmFzb24NCj4gDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
