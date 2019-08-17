Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 360B39112B
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:16:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DDD16E50C;
	Sat, 17 Aug 2019 15:16:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790049.outbound.protection.outlook.com [40.107.79.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25FBC6E50C;
 Sat, 17 Aug 2019 15:16:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CyE5WDy/Gr6Nb72Y9FqvAj5kV9gtlpGtBs+3hm5txYmMjP2Y/ojt6D88PLvPzOC9FIPzumvYAZd/U8Mmwb7Ph1miSVPx4lJFaf59XKEzrg2KMt28qmLvXoMUGCGwCu8sexse4K9DK14DMzuKqaE7NqH+tYdngUPSF+ue/EEqINBrsCmYwAK6LpKwUjaFk1ySruog9p89tekSYQEFXA9Z3X8H+2g3hb07Tv0H+Hxpmsd2tKHnD7AC+ZqIB8S6EwToLhFjA/ROsvA+tJAVjKAG5zDcNyX0zSQG4cuUoOO1QvsGZSl+D7XA1Rn6r0DGTVEOWVQoaU0VieA4fMeT+046oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9VpqJk5uFgdLsJ00S2WUwcs1UwCyigD7/rN6FWIkRE=;
 b=OGNaIkcQ1PRRWxAtIbvYxB8HFL6YTsSNFx2M0SW73K1bJ5ladeajPsM1pEfivYteol89sp+PY9JLJP6IJgXRGblC7jiLj+RKdlUF3gdUiOyl6b7LWYVfB87AEkOUrdda8KHZR+nYSOW0gPmyyIMmmm3+KIGp40IiCrpfZyZ985wfJUz7L1L0yRC5U5ge/sQeGuRy8imm4xfo998ngN8CQztbOEDJ8awncu61oIh1kCYgjrucIkgsSstSZTjaXl9I36N62jSCyezH2pjWrvzH0HjrpZBMD9MowRWYy+DtMa2UxZ9/5P7jLn2ZlNcSMvFK2f33EtZLGPSS6bOq18lgXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB2584.namprd12.prod.outlook.com (52.132.141.167) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Sat, 17 Aug 2019 15:16:35 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3%5]) with mapi id 15.20.2157.022; Sat, 17 Aug 2019
 15:16:35 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 5/6] dma-fence: Simply wrap dma_fence_signal_locked with
 dma_fence_signal
Thread-Topic: [PATCH 5/6] dma-fence: Simply wrap dma_fence_signal_locked with
 dma_fence_signal
Thread-Index: AQHVVQq/tQwV5A2hj0KNzlnB+rhcl6b/c2eA
Date: Sat, 17 Aug 2019 15:16:35 +0000
Message-ID: <2e703a42-cd86-dea9-30cd-7a3f8836413f@amd.com>
References: <20190817144736.7826-1-chris@chris-wilson.co.uk>
 <20190817144736.7826-5-chris@chris-wilson.co.uk>
In-Reply-To: <20190817144736.7826-5-chris@chris-wilson.co.uk>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: MR2P264CA0119.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::35) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7b129af6-4a82-4617-c59b-08d72325e4a8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2584; 
x-ms-traffictypediagnostic: DM5PR12MB2584:
x-microsoft-antispam-prvs: <DM5PR12MB2584BFD34C64105D3E1A18A183AE0@DM5PR12MB2584.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0132C558ED
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(39860400002)(136003)(346002)(376002)(199004)(189003)(2906002)(31696002)(86362001)(36756003)(58126008)(66556008)(7736002)(66446008)(64756008)(66476007)(66946007)(65806001)(8936002)(66574012)(65826007)(65956001)(6512007)(5660300002)(6116002)(316002)(110136005)(6436002)(81156014)(8676002)(6486002)(229853002)(81166006)(54906003)(31686004)(386003)(6506007)(102836004)(4326008)(11346002)(46003)(2616005)(446003)(476003)(71200400001)(71190400001)(2501003)(25786009)(64126003)(486006)(478600001)(99286004)(53936002)(76176011)(305945005)(256004)(14444005)(6246003)(186003)(52116002)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2584;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zOwA7xwWtJiq3IE82di3gsmyRd5tXOlLMTI2G+SQuRAFSvo/EyOhf3zgmGpiJaBjIkQeMM1NcaAjXtkTcWQEy0MHWJRxjKqPp2s911Iqu1DhgxPU5tgrvbWHqkfO/GxcLAHmQLFeu9rTvsSVDXiipC41lik69xs/GkwNRkGMp2sYetRIZiHjXwlNLx5+OymiwD9jNnDjegXurhRqj+ivUM8V4jpqLBwLCRbj5IUoILwFHkIBUqcXap6df4rLGN/SKkRz7ZKcbbBK6rOCeujazvPFklCpQJ1lMxbYcsnhFWLTnNdvw8qumvLgZ6RBzkbCQhR9f5S80QJzhH3F/INE3ENLa0M8lNu7ss30DthaMC1bxRq4jsdHSGvviZumJC/TQP3rwzzLV7Xgt7alsNP5WuMtTi0LXwLvh1laK5k2kEs=
x-ms-exchange-transport-forked: True
Content-ID: <05D09F5DED783B498616FC23797D417D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b129af6-4a82-4617-c59b-08d72325e4a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2019 15:16:35.5511 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K0QVje71HiA1kDU7DogHeail0qRqflvdht0ZGuJ1u93ij3segqibq1X7xq7wKdkv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2584
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9VpqJk5uFgdLsJ00S2WUwcs1UwCyigD7/rN6FWIkRE=;
 b=OV3Me7M6kvRdCtqXjNqebLRNl128iK/FQZZLo4ueCNHQkU5cSpZ/yhZ+CrG9ROw0noPuSGujFLVkoF2LfeJhuKIPFTi6xftcsgVpZB1LOZd3iI28knqAvya/D0UE5stuGLLAN6gum+4U6346YZHdDNUmaulR0uaszIwTlgSZ6PY=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTcuMDguMTkgdW0gMTY6NDcgc2NocmllYiBDaHJpcyBXaWxzb246DQo+IEN1cnJlbnRseSBk
bWFfZmVuY2Vfc2lnbmFsKCkgdHJpZXMgdG8gYXZvaWQgdGhlIHNwaW5sb2NrIGFuZCBvbmx5IHRh
a2VzDQo+IGl0IGlmIGFic29sdXRlbHkgcmVxdWlyZWQgdG8gd2FsayB0aGUgY2FsbGJhY2sgbGlz
dC4gSG93ZXZlciwgdG8gYWxsb3cNCj4gZm9yIHNvbWUgdXNlcnMgdG8gc3VycmVwdGl0aW91c2x5
IGluc2VydCBsYXp5IHNpZ25hbCBjYWxsYmFja3MgdGhhdA0KPiBkbyBub3QgZGVwZW5kIG9uIGVu
YWJsaW5nIHRoZSBzaWduYWxpbmcgbWVjaGFuaXNtIGFyb3VuZCBldmVyeSBmZW5jZSwNCj4gd2Ug
YWx3YXlzIG5lZWQgdG8gbm90aWZ5IHRoZSBjYWxsYmFja3Mgb24gc2lnbmFsaW5nLiBBcyBzdWNo
LCB3ZSB3aWxsDQo+IGFsd2F5cyBuZWVkIHRvIHRha2UgdGhlIHNwaW5sb2NrIGFuZCBkbWFfZmVu
Y2Vfc2lnbmFsKCkgZWZmZWN0aXZlbHkNCj4gYmVjb21lcyBhIGNsb25lIG9mIGRtYV9mZW5jZV9z
aWduYWxfbG9ja2VkKCkuDQo+DQo+IHYyOiBVcGRhdGUgdGhlIHRlc3RfYW5kX3NldF9iaXQoKSBi
ZWZvcmUgZW50ZXJpbmcgdGhlIHNwaW5sb2NrLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBX
aWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4NCj4gQ2M6IENocmlzdGlhbiBLw7ZuaWcg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52
ZXR0ZXJAZmZ3bGwuY2g+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UuYyB8
IDQzICsrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gICAxIGZpbGUgY2hh
bmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMzAgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNl
LmMNCj4gaW5kZXggZmYwY2Q2ZWFlNzY2Li44OWQ5NmUzZTZkZjYgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UuYw0KPiArKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWZl
bmNlLmMNCj4gQEAgLTEyOSwyNSArMTI5LDE2IEBAIEVYUE9SVF9TWU1CT0woZG1hX2ZlbmNlX2Nv
bnRleHRfYWxsb2MpOw0KPiAgIGludCBkbWFfZmVuY2Vfc2lnbmFsX2xvY2tlZChzdHJ1Y3QgZG1h
X2ZlbmNlICpmZW5jZSkNCj4gICB7DQo+ICAgCXN0cnVjdCBkbWFfZmVuY2VfY2IgKmN1ciwgKnRt
cDsNCj4gLQlpbnQgcmV0ID0gMDsNCj4gICANCj4gICAJbG9ja2RlcF9hc3NlcnRfaGVsZChmZW5j
ZS0+bG9jayk7DQo+ICAgDQo+IC0JaWYgKFdBUk5fT04oIWZlbmNlKSkNCj4gKwlpZiAodW5saWtl
bHkodGVzdF9hbmRfc2V0X2JpdChETUFfRkVOQ0VfRkxBR19TSUdOQUxFRF9CSVQsDQo+ICsJCQkJ
ICAgICAgJmZlbmNlLT5mbGFncykpKQ0KPiAgIAkJcmV0dXJuIC1FSU5WQUw7DQo+ICAgDQo+IC0J
aWYgKHRlc3RfYW5kX3NldF9iaXQoRE1BX0ZFTkNFX0ZMQUdfU0lHTkFMRURfQklULCAmZmVuY2Ut
PmZsYWdzKSkgew0KPiAtCQlyZXQgPSAtRUlOVkFMOw0KPiAtDQo+IC0JCS8qDQo+IC0JCSAqIHdl
IG1pZ2h0IGhhdmUgcmFjZWQgd2l0aCB0aGUgdW5sb2NrZWQgZG1hX2ZlbmNlX3NpZ25hbCwNCj4g
LQkJICogc3RpbGwgcnVuIHRocm91Z2ggYWxsIGNhbGxiYWNrcw0KPiAtCQkgKi8NCj4gLQl9IGVs
c2Ugew0KPiAtCQlmZW5jZS0+dGltZXN0YW1wID0ga3RpbWVfZ2V0KCk7DQo+IC0JCXNldF9iaXQo
RE1BX0ZFTkNFX0ZMQUdfVElNRVNUQU1QX0JJVCwgJmZlbmNlLT5mbGFncyk7DQo+IC0JCXRyYWNl
X2RtYV9mZW5jZV9zaWduYWxlZChmZW5jZSk7DQo+IC0JfQ0KPiArCWZlbmNlLT50aW1lc3RhbXAg
PSBrdGltZV9nZXQoKTsNCj4gKwlzZXRfYml0KERNQV9GRU5DRV9GTEFHX1RJTUVTVEFNUF9CSVQs
ICZmZW5jZS0+ZmxhZ3MpOw0KPiArCXRyYWNlX2RtYV9mZW5jZV9zaWduYWxlZChmZW5jZSk7DQo+
ICAgDQo+ICAgCWlmICghbGlzdF9lbXB0eSgmZmVuY2UtPmNiX2xpc3QpKSB7DQo+ICAgCQlsaXN0
X2Zvcl9lYWNoX2VudHJ5X3NhZmUoY3VyLCB0bXAsICZmZW5jZS0+Y2JfbGlzdCwgbm9kZSkgew0K
PiBAQCAtMTU2LDcgKzE0Nyw4IEBAIGludCBkbWFfZmVuY2Vfc2lnbmFsX2xvY2tlZChzdHJ1Y3Qg
ZG1hX2ZlbmNlICpmZW5jZSkNCj4gICAJCX0NCj4gICAJCUlOSVRfTElTVF9IRUFEKCZmZW5jZS0+
Y2JfbGlzdCk7DQo+ICAgCX0NCj4gLQlyZXR1cm4gcmV0Ow0KPiArDQo+ICsJcmV0dXJuIDA7DQo+
ICAgfQ0KPiAgIEVYUE9SVF9TWU1CT0woZG1hX2ZlbmNlX3NpZ25hbF9sb2NrZWQpOw0KPiAgIA0K
PiBAQCAtMTc2LDI4ICsxNjgsMTkgQEAgRVhQT1JUX1NZTUJPTChkbWFfZmVuY2Vfc2lnbmFsX2xv
Y2tlZCk7DQo+ICAgaW50IGRtYV9mZW5jZV9zaWduYWwoc3RydWN0IGRtYV9mZW5jZSAqZmVuY2Up
DQo+ICAgew0KPiAgIAl1bnNpZ25lZCBsb25nIGZsYWdzOw0KPiArCWludCByZXQ7DQo+ICAgDQo+
ICAgCWlmICghZmVuY2UpDQo+ICAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gICANCj4gLQlpZiAodGVz
dF9hbmRfc2V0X2JpdChETUFfRkVOQ0VfRkxBR19TSUdOQUxFRF9CSVQsICZmZW5jZS0+ZmxhZ3Mp
KQ0KPiArCWlmICh0ZXN0X2JpdChETUFfRkVOQ0VfRkxBR19TSUdOQUxFRF9CSVQsICZmZW5jZS0+
ZmxhZ3MpKQ0KPiAgIAkJcmV0dXJuIC1FSU5WQUw7DQoNCkFjdHVhbGx5IEkgdGhpbmsgd2UgY2Fu
IGNvbXBsZXRlbHkgZHJvcCB0aGlzIGV4dHJhIHRlc3QuIFNpZ25hbGluZyBhIA0KZmVuY2UgdHdp
Y2Ugc2hvdWxkbid0IGJlIHRoZSBmYXN0IHBhdGggd2Ugc2hvdWxkIG9wdGltaXplIGZvci4NCg0K
QXBhcnQgZnJvbSB0aGF0IGl0IGxvb2tzIGdvb2QgdG8gbWUsDQpDaHJpc3RpYW4uDQoNCj4gICAN
Cj4gLQlmZW5jZS0+dGltZXN0YW1wID0ga3RpbWVfZ2V0KCk7DQo+IC0Jc2V0X2JpdChETUFfRkVO
Q0VfRkxBR19USU1FU1RBTVBfQklULCAmZmVuY2UtPmZsYWdzKTsNCj4gLQl0cmFjZV9kbWFfZmVu
Y2Vfc2lnbmFsZWQoZmVuY2UpOw0KPiAtDQo+IC0JaWYgKHRlc3RfYml0KERNQV9GRU5DRV9GTEFH
X0VOQUJMRV9TSUdOQUxfQklULCAmZmVuY2UtPmZsYWdzKSkgew0KPiAtCQlzdHJ1Y3QgZG1hX2Zl
bmNlX2NiICpjdXIsICp0bXA7DQo+ICsJc3Bpbl9sb2NrX2lycXNhdmUoZmVuY2UtPmxvY2ssIGZs
YWdzKTsNCj4gKwlyZXQgPSBkbWFfZmVuY2Vfc2lnbmFsX2xvY2tlZChmZW5jZSk7DQo+ICsJc3Bp
bl91bmxvY2tfaXJxcmVzdG9yZShmZW5jZS0+bG9jaywgZmxhZ3MpOw0KPiAgIA0KPiAtCQlzcGlu
X2xvY2tfaXJxc2F2ZShmZW5jZS0+bG9jaywgZmxhZ3MpOw0KPiAtCQlsaXN0X2Zvcl9lYWNoX2Vu
dHJ5X3NhZmUoY3VyLCB0bXAsICZmZW5jZS0+Y2JfbGlzdCwgbm9kZSkgew0KPiAtCQkJbGlzdF9k
ZWxfaW5pdCgmY3VyLT5ub2RlKTsNCj4gLQkJCWN1ci0+ZnVuYyhmZW5jZSwgY3VyKTsNCj4gLQkJ
fQ0KPiAtCQlzcGluX3VubG9ja19pcnFyZXN0b3JlKGZlbmNlLT5sb2NrLCBmbGFncyk7DQo+IC0J
fQ0KPiAtCXJldHVybiAwOw0KPiArCXJldHVybiByZXQ7DQo+ICAgfQ0KPiAgIEVYUE9SVF9TWU1C
T0woZG1hX2ZlbmNlX3NpZ25hbCk7DQo+ICAgDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
