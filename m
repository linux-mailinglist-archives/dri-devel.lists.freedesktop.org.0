Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BFADB2BB
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 18:47:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE9A66E9FD;
	Thu, 17 Oct 2019 16:47:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750088.outbound.protection.outlook.com [40.107.75.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEFFF6E9FD;
 Thu, 17 Oct 2019 16:47:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TGKk/9XxYqlvu3sIuSX+B/p8JEEhJ2vPbW/EyV1ARmP1gVSRoxd4XnE6N+1JCcnCeO1BHTgxcezTuizruVUvA7/YNT7AWqR9FNUedgqWwhHdXE7YKY9/X9tQoGeo0a9u7yqHXUyobP5pJ3/EquLZddJ/BhoKqicLphG7PT0ikGxc1U9QwXfwvS/pdI/zkwpsBbHpF58uSaZqiIax93MNoVEmA4KFdXS4VjqY+HWQW/atO3uFiEY4kTJzG6N64aac6oPlIo2bvmjHpseYSZiNIwtar8AdPzxJdOriY8KJ982cSV8BnnfbOix/1rUKApuL6mMTW/T56EL38ySd8yq93Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+V11xkZZODnjvdE577B6ydQIjsygq7vQAVntNEs5Qd4=;
 b=VAnlMpLWeppljgdFrwL5gQMMVXoh1RBn2dej19KWWD9GnO0t1/eAXy8Qyl+NxKxyF1ucmabau/v49X/+SkzHkZCttALjn8qXkbGimVp1OyP27x/gaPhZnt3UzCmNTVLqN7rGN+JkDgUQ1Is5EjNLgHqZ/QTUSBa+J34OykIDhvTdrnLkIzoFed6toT5hl9qrCDTdd81zcM+9IDujnMQesCNzHUvzzxla3/PlLVHjYJ0E77Gp6x5RiPsWWthVGoELVXSW1fdYHMFpcpFWEciTRnE7HqIHvvCAI6RPF5VCEQhAWcgA1NdHuA4RCNGH7E/1gsPHXyq46PedLf8OcIjTBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1564.namprd12.prod.outlook.com (10.172.39.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Thu, 17 Oct 2019 16:47:21 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::7428:f6b3:a0b1:a02e]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::7428:f6b3:a0b1:a02e%10]) with mapi id 15.20.2347.023; Thu, 17 Oct
 2019 16:47:21 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Yang, Philip" <Philip.Yang@amd.com>, Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [PATCH hmm 00/15] Consolidate the mmu notifier interval_tree and
 locking
Thread-Topic: [PATCH hmm 00/15] Consolidate the mmu notifier interval_tree and
 locking
Thread-Index: AQHVg4Sqa7CCxCToXEeTrrYAqVQVhqdc+JgAgAB3OACAARovgIAAficAgAAF3YA=
Date: Thu, 17 Oct 2019 16:47:20 +0000
Message-ID: <d6bcbd2a-2519-8945-eaf5-4f4e738c7fa9@amd.com>
References: <20191015181242.8343-1-jgg@ziepe.ca>
 <bc954d29-388b-9e29-f960-115ccc6b9fea@gmail.com>
 <20191016160444.GB3430@mellanox.com>
 <2df298e2-ee91-ef40-5da9-2bc1af3a17be@gmail.com>
 <2046e0b4-ba05-0683-5804-e9bbf903658d@amd.com>
In-Reply-To: <2046e0b4-ba05-0683-5804-e9bbf903658d@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM4PR0701CA0038.eurprd07.prod.outlook.com
 (2603:10a6:200:42::48) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 32488905-5440-4433-18db-08d75321ad96
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR12MB1564:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1564F21D229096B31C64740D836D0@DM5PR12MB1564.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 01930B2BA8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(366004)(136003)(376002)(396003)(189003)(199004)(58126008)(6246003)(110136005)(229853002)(446003)(6436002)(65956001)(186003)(102836004)(52116002)(86362001)(54906003)(5660300002)(2616005)(6512007)(31696002)(36756003)(4001150100001)(7736002)(6116002)(305945005)(6306002)(46003)(476003)(486006)(4326008)(65806001)(11346002)(99286004)(6486002)(316002)(76176011)(386003)(53546011)(6506007)(66574012)(64756008)(966005)(8936002)(81166006)(81156014)(8676002)(71200400001)(14454004)(66476007)(71190400001)(256004)(7416002)(478600001)(31686004)(66946007)(25786009)(66556008)(14444005)(2906002)(66446008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1564;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vLemEo9naREzl1OhOEToWwOWb3lajiWaoQUtxi3n5PJG/OYiqVhQ2iFbOHGoOnUpv30sZQP0l1ufqgcghIYFonHg91PMygn1l3eX+oP5wYSs9Nj00xAZCUjZ+EgBTfs7gT1Soe726Re9+Lx/XGGO6apk9EW7IC7SyAexK5XeaF45qkD8jB/YIhbt/QRkkBsrgfJ6v80PqT2ydkbRUYFix+NqiPNrZ2jgsbfXIrXiWIgG3IC2DPTbhd8KFg+Zox9pewdrHXejNIo98Qes7Xs8TsSzhoc1KvY1VYIYady/Q3EtfOHaUN6kAFhfHihEkC7n0Osp02A9tXfCDE9ATvsCvAty3CVO7+JRzqzE34dqvjTA7LO6Paf7ADJPevnlLFd0w1qLYco4NToEAyb8p5g1tNOjF5FVPlSJwa81RQSdnQaHEVRAbi0U2074qrOyJOu34rHSznvpc+RZD5CrogtD5Q==
Content-ID: <2F13E49366CE5448B811EAFC895C0B5E@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32488905-5440-4433-18db-08d75321ad96
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2019 16:47:21.0294 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DgL3Xq75Ndcp/5NF1cvCuzDO6rxRwhpru62zu5VcyBtjSc55yZaoI9C57g9Wn4ce
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1564
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+V11xkZZODnjvdE577B6ydQIjsygq7vQAVntNEs5Qd4=;
 b=JXEKbw3KNxw2XkZdIZPMg/MEnJ82X7xmeJlyE6JE7mY6skaMAZC3L3eXoGICrBmUoNwV3wU6IcPhZadAcExmQvshxpxocWfkC9SBUOzrs+IR0R7EFglUs8kiJQ6Z3S0BdGEMFS1TWMiJ977fQYaRNowLfZZ+lXRZxQ2V4hA79Yw=
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, "Kuehling, 
 Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jerome Glisse <jglisse@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2VuZGluZyBvbmNlIG1vcmUgYXMgdGV4dC4NCg0KQW0gMTcuMTAuMTkgdW0gMTg6MjYgc2Nocmll
YiBZYW5nLCBQaGlsaXA6DQo+IE9uIDIwMTktMTAtMTcgNDo1NCBhLm0uLCBDaHJpc3RpYW4gS8O2
bmlnIHdyb3RlOg0KPj4gQW0gMTYuMTAuMTkgdW0gMTg6MDQgc2NocmllYiBKYXNvbiBHdW50aG9y
cGU6DQo+Pj4gT24gV2VkLCBPY3QgMTYsIDIwMTkgYXQgMTA6NTg6MDJBTSArMDIwMCwgQ2hyaXN0
aWFuIEvDtm5pZyB3cm90ZToNCj4+Pj4gQW0gMTUuMTAuMTkgdW0gMjA6MTIgc2NocmllYiBKYXNv
biBHdW50aG9ycGU6DQo+Pj4+PiBGcm9tOiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5j
b20+DQo+Pj4+Pg0KPj4+Pj4gOCBvZiB0aGUgbW11X25vdGlmaWVyIHVzaW5nIGRyaXZlcnMgKGk5
MTVfZ2VtLCByYWRlb25fbW4sIHVtZW1fb2RwLA0KPj4+Pj4gaGZpMSwNCj4+Pj4+IHNjaWZfZG1h
LCB2aG9zdCwgZ250ZGV2LCBobW0pIGRyaXZlcnMgYXJlIHVzaW5nIGEgY29tbW9uIHBhdHRlcm4g
d2hlcmUNCj4+Pj4+IHRoZXkgb25seSB1c2UgaW52YWxpZGF0ZV9yYW5nZV9zdGFydC9lbmQgYW5k
IGltbWVkaWF0ZWx5IGNoZWNrIHRoZQ0KPj4+Pj4gaW52YWxpZGF0aW5nIHJhbmdlIGFnYWluc3Qg
c29tZSBkcml2ZXIgZGF0YSBzdHJ1Y3R1cmUgdG8gdGVsbCBpZiB0aGUNCj4+Pj4+IGRyaXZlciBp
cyBpbnRlcmVzdGVkLiBIYWxmIG9mIHRoZW0gdXNlIGFuIGludGVydmFsX3RyZWUsIHRoZSBvdGhl
cnMgYXJlDQo+Pj4+PiBzaW1wbGUgbGluZWFyIHNlYXJjaCBsaXN0cy4NCj4+Pj4+DQo+Pj4+PiBP
ZiB0aGUgb25lcyBJIGNoZWNrZWQgdGhleSBsYXJnZWx5IHNlZW0gdG8gaGF2ZSB2YXJpb3VzIGtp
bmRzIG9mIHJhY2VzLA0KPj4+Pj4gYnVncyBhbmQgcG9vciBpbXBsZW1lbnRhdGlvbi4gVGhpcyBp
cyBhIHJlc3VsdCBvZiB0aGUgY29tcGxleGl0eSBpbiBob3cNCj4+Pj4+IHRoZSBub3RpZmllciBp
bnRlcmFjdHMgd2l0aCBnZXRfdXNlcl9wYWdlcygpLiBJdCBpcyBleHRyZW1lbHkNCj4+Pj4+IGRp
ZmZpY3VsdCB0bw0KPj4+Pj4gdXNlIGl0IGNvcnJlY3RseS4NCj4+Pj4+DQo+Pj4+PiBDb25zb2xp
ZGF0ZSBhbGwgb2YgdGhpcyBjb2RlIHRvZ2V0aGVyIGludG8gdGhlIGNvcmUgbW11X25vdGlmaWVy
IGFuZA0KPj4+Pj4gcHJvdmlkZSBhIGxvY2tpbmcgc2NoZW1lIHNpbWlsYXIgdG8gaG1tX21pcnJv
ciB0aGF0IGFsbG93cyB0aGUgdXNlciB0bw0KPj4+Pj4gc2FmZWx5IHVzZSBnZXRfdXNlcl9wYWdl
cygpIGFuZCByZWxpYWJseSBrbm93IGlmIHRoZSBwYWdlIGxpc3Qgc3RpbGwNCj4+Pj4+IG1hdGNo
ZXMgdGhlIG1tLg0KPj4+PiBUaGF0IHNvdW5kcyByZWFsbHkgZ29vZCwgYnV0IGNvdWxkIHlvdSBv
dXRsaW5lIGZvciBhIG1vbWVudCBob3cgdGhhdCBpcw0KPj4+PiBhcmNoaXZlZD8NCj4+PiBJdCB1
c2VzIHRoZSBzYW1lIGJhc2ljIHNjaGVtZSBhcyBobW0gYW5kIHJkbWEgb2RwLCBvdXRsaW5lZCBp
biB0aGUNCj4+PiByZXZpc2lvbnMgdG8gaG1tLnJzdCBsYXRlciBvbi4NCj4+Pg0KPj4+IEJhc2lj
YWxseSwNCj4+Pg0KPj4+ICDCoCBzZXEgPSBtbXVfcmFuZ2VfcmVhZF9iZWdpbigmbXJuKTsNCj4+
Pg0KPj4+ICDCoCAvLyBUaGlzIGlzIGEgc3BlY3VsYXRpdmUgcmVnaW9uDQo+Pj4gIMKgIC4uIGdl
dF91c2VyX3BhZ2VzKCkvaG1tX3JhbmdlX2ZhdWx0KCkgLi4NCj4+IEhvdyBkbyB3ZSBlbmZvcmNl
IHRoYXQgdGhpcyBnZXRfdXNlcl9wYWdlcygpL2htbV9yYW5nZV9mYXVsdCgpIGRvZXNuJ3QNCj4+
IHNlZSBvdXRkYXRlZCBwYWdlIHRhYmxlIGluZm9ybWF0aW9uPw0KPj4NCj4+IEluIG90aGVyIHdv
cmRzIGhvdyB0aGUgdGhlIGZvbGxvd2luZyByYWNlIHByZXZlbnRlZDoNCj4+DQo+PiBDUFUgQSBD
UFUgQg0KPj4gaW52YWxpZGF0ZV9yYW5nZV9zdGFydCgpDQo+PiAgIMKgwqDCoCDCoCBtbXVfcmFu
Z2VfcmVhZF9iZWdpbigpDQo+PiAgIMKgwqDCoCDCoCBnZXRfdXNlcl9wYWdlcygpL2htbV9yYW5n
ZV9mYXVsdCgpDQo+PiBVcGRhdGluZyB0aGUgcHRlcw0KPj4gaW52YWxpZGF0ZV9yYW5nZV9lbmQo
KQ0KPj4NCj4+DQo+PiBJIG1lYW4gZ2V0X3VzZXJfcGFnZXMoKSB0cmllcyB0byBjaXJjdW12ZW50
IHRoaXMgaXNzdWUgYnkgZ3JhYmJpbmcgYQ0KPj4gcmVmZXJlbmNlIHRvIHRoZSBwYWdlcyBpbiBx
dWVzdGlvbiwgYnV0IHRoYXQgaXNuJ3Qgc3VmZmljaWVudCBmb3IgdGhlDQo+PiBTVk0gdXNlIGNh
c2UuDQo+Pg0KPj4gVGhhdCdzIHRoZSByZWFzb24gd2h5IHdlIGhhZCB0aGlzIGhvcnJpYmxlIHNv
bHV0aW9uIHdpdGggYSByL3cgbG9jayBhbmQNCj4+IGEgbGlua2VkIGxpc3Qgb2YgQk9zIGluIGFu
IGludGVydmFsIHRyZWUuDQo+Pg0KPj4gUmVnYXJkcywNCj4+IENocmlzdGlhbi4NCj4gZ2V0X3Vz
ZXJfcGFnZXMvaG1tX3JhbmdlX2ZhdWx0KCkgYW5kIGludmFsaWRhdGVfcmFuZ2Vfc3RhcnQoKSBi
b3RoIGFyZQ0KPiBjYWxsZWQgd2hpbGUgaG9sZGluZyBtbS0+bWFwX3NlbSwgc28gdGhleSBhcmUg
YWx3YXlzIHNlcmlhbGl6ZWQuDQoNCk5vdCBldmVuIHJlbW90ZWx5Lg0KDQpGb3IgY2FsbGluZyBn
ZXRfdXNlcl9wYWdlcygpL2htbV9yYW5nZV9mYXVsdCgpIHlvdSBvbmx5IG5lZWQgdG8gaG9sZCB0
aGUgDQptbWFwX3NlbSBpbiByZWFkIG1vZGUuDQoNCkFuZCBJSVJDIGludmFsaWRhdGVfcmFuZ2Vf
c3RhcnQoKSBpcyBzb21ldGltZXMgY2FsbGVkIHdpdGhvdXQgaG9sZGluZyANCnRoZSBtbWFwX3Nl
bSBhdCBhbGwuDQoNClNvIGFnYWluIGhvdyBhcmUgdGhleSBzZXJpYWxpemVkPw0KDQpSZWdhcmRz
LA0KQ2hyaXN0aWFuLg0KDQo+DQo+IFBoaWxpcA0KPj4+ICDCoCAvLyBSZXN1bHQgY2Fubm90IGJl
IGRlcmZlcmVuY2VkDQo+Pj4NCj4+PiAgwqAgdGFrZV9sb2NrKGRyaXZlci0+dXBkYXRlKTsNCj4+
PiAgwqAgaWYgKG1tdV9yYW5nZV9yZWFkX3JldHJ5KCZtcm4sIHJhbmdlLm5vdGlmaWVyX3NlcSkg
ew0KPj4+ICDCoMKgwqDCoCAvLyBjb2xsaXNpb24hIFRoZSByZXN1bHRzIGFyZSBub3QgY29ycmVj
dA0KPj4+ICDCoMKgwqDCoCBnb3RvIGFnYWluDQo+Pj4gIMKgIH0NCj4+Pg0KPj4+ICDCoCAvLyBu
byBjb2xsaXNpb24sIGFuZCBub3cgdW5kZXIgbG9jay4gTm93IHdlIGNhbiBkZS1yZWZlcmVuY2Ug
dGhlDQo+Pj4gcGFnZXMvZXRjDQo+Pj4gIMKgIC8vIHByb2dyYW0gSFcNCj4+PiAgwqAgLy8gTm93
IHRoZSBpbnZhbGlkYXRlIGNhbGxiYWNrIGlzIHJlc3BvbnNpYmxlIHRvIHN5bmNocm9uaXplIGFn
YWluc3QNCj4+PiBjaGFuZ2VzDQo+Pj4gIMKgIHVubG9jayhkcml2ZXItPnVwZGF0ZSkNCj4+Pg0K
Pj4+IEJhc2ljYWxseSwgYW55dGhpbmcgdGhhdCB3YXMgdXNpbmcgaG1tX21pcnJvciBjb3JyZWN0
bHkgdHJhbnNpc2lvbnMNCj4+PiBvdmVyIGZhaXJseSB0cml2aWFsbHksIGp1c3Qgd2l0aCB0aGUg
bW9kaWZpY2F0aW9uIHRvIHN0b3JlIGEgc2VxdWVuY2UNCj4+PiBudW1iZXIgdG8gY2xvc2UgdGhh
dCByYWNlIGRlc2NyaWJlZCBpbiB0aGUgaG1tIGNvbW1pdC4NCj4+Pg0KPj4+IEZvciBzb21ldGhp
bmcgbGlrZSBBTUQgZ3B1IEkgZXhwZWN0IGl0IHRvIHRyYW5zaXRpb24gdG8gdXNlIGRtYV9mZW5j
ZQ0KPj4+IGZyb20gdGhlIG5vdGlmaWVyIGZvciBjb2hlcmVuY3kgcmlnaHQgYmVmb3JlIGl0IHVu
bG9ja3MgZHJpdmVyLT51cGRhdGUuDQo+Pj4NCj4+PiBKYXNvbg0KPj4+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+Pj4gYW1kLWdmeCBtYWlsaW5nIGxp
c3QNCj4+PiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPj4+IGh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KPj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4+IGFtZC1nZnggbWFpbGluZyBs
aXN0DQo+PiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPj4gaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQoNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
