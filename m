Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9608B2E1
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 10:49:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9252589E43;
	Tue, 13 Aug 2019 08:49:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820089.outbound.protection.outlook.com [40.107.82.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67F3689E43;
 Tue, 13 Aug 2019 08:49:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TO+1YGLNfUgAOGpkMsXOQC06cgcsAQ02++APRuFQJTiRVGrtBEq7EHd+CLR7QN8bxIOL5Q7kaVM3V5cXVF5QYHf2D8py8D5taARK+moOXCUKdYMndz41h7QpbsoOVPIPH4lwxkfejObG9JcGMPr026OTtLdcGL/GvZvWdRagZy2KkJ1ie/Xn9sI0JwjJCcvUrWVQqkHq+KMVIyKALMlRHkHePfW8B/fuyPGD0ZO1OU3s4PbB+wUH4i4i6vr8T2ATXtXMzpVULP7snoJNY+J4U9IuUqxj/0SuGR6QfVJaiVjd2i84jlnrg0vtUhQGYGAuWKD95oy8xS4C3ljNhBvFuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nR3nXnOvS1kKgOXUP9dQHb6nhH8d8PdE5sRkjJmMFoI=;
 b=m7kuMOsUQ3AajqRYB6V0YAZdziD/sthY0/Zct5YS41dAcKrTHxvAz8Z+QFHvI18vMFvhsPiE9YnJrAeblJ5UDbFlvkqSMvlMhYhrXjlURraSyisUhydA1V+YkZvGQAaQVu2/1h06EIoomSbZXS/vBPO3HGzkiUNshvliqFfSRq1sumq3wO5TVOQFGAE0tacyc08iTyC8eW0oHjEpNeFrr6A7o7I3TB+GQt+xlS7G/ZcJqPqkdV4u3vmuYxPqbBYpxF6P69GX3XDf306n9YkALIJKCV2ja9EZqEHTn6Ns6CCs9CFQHT4TVlb4dS5Sl48cTauBqsK8ta9dWgJe1QzMeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1209.namprd12.prod.outlook.com (10.168.234.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Tue, 13 Aug 2019 08:49:33 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3%5]) with mapi id 15.20.2157.022; Tue, 13 Aug 2019
 08:49:33 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 3/4] dma-fence: Refactor signaling for manual invocation
Thread-Topic: [PATCH 3/4] dma-fence: Refactor signaling for manual invocation
Thread-Index: AQHVT5FcoLDXFG6zukyZzm7Lcg/sg6b3lvQAgAACdICAAAIkAIAAAKWAgAEN8ICAABgOgIAABrYA
Date: Tue, 13 Aug 2019 08:49:33 +0000
Message-ID: <45779dfe-f23d-d44c-2967-6b3a9318c9ec@amd.com>
References: <20190810153430.30636-1-chris@chris-wilson.co.uk>
 <20190810153430.30636-3-chris@chris-wilson.co.uk>
 <886f647b-24a6-ee24-4f50-68153fec6c53@amd.com>
 <156562099543.2301.5895998761855095437@skylake-alporthouse-com>
 <40961588-a377-9c92-379f-e24e3b711ce7@amd.com>
 <156562159336.2301.12364265101196283146@skylake-alporthouse-com>
 <091b5d17-241e-53a8-17e0-b61b30720bbb@amd.com>
 <156568472775.2301.10010424738623757564@skylake-alporthouse-com>
In-Reply-To: <156568472775.2301.10010424738623757564@skylake-alporthouse-com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR2P264CA0035.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::23) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 67624807-641c-43a1-3109-08d71fcb29cb
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1209; 
x-ms-traffictypediagnostic: DM5PR12MB1209:
x-microsoft-antispam-prvs: <DM5PR12MB1209BC409634ABB78A38686F83D20@DM5PR12MB1209.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01283822F8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(346002)(136003)(376002)(39860400002)(199004)(189003)(6116002)(8936002)(6436002)(6486002)(52116002)(76176011)(25786009)(2501003)(6506007)(386003)(36756003)(31686004)(71190400001)(66446008)(71200400001)(64126003)(476003)(186003)(11346002)(65956001)(102836004)(81166006)(65806001)(86362001)(256004)(99286004)(81156014)(2616005)(46003)(446003)(8676002)(486006)(5660300002)(229853002)(7736002)(14454004)(110136005)(53936002)(316002)(54906003)(305945005)(58126008)(478600001)(31696002)(2906002)(66946007)(6246003)(4326008)(6512007)(65826007)(66556008)(66476007)(64756008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1209;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lHmI6HDRY7vrwl7JMO/FOat3icwaLqvKde/TbsERtXiMIKo2NAi9XTWg7vJt/MH0Dd/nnVI0XdevAwBwwhqqa1JjlDjrzB3QI+2ZpfAfA5amTaVFUB7VlCn35nfAVKVl/b9CpdF/YlEQw2+bjFyeD4PHriRqJIUalCyreh3Ajz1BDiAkC3DXCw4BL1RElO5ZsWWQdG+wvBMi5hFKaDyJYltwo3vgpv35UZzi8qKQnPDLnX2y9ylATgmfS/VScRBlqMRrsg6tpocExOeopccfW8oDyr9PdKHF8GegijFkOFOseF/k9Efy9NOi1dey2Z7v4MxYmyXkcvV/VB+LTrUqsvxiwJJ6bEbBBbYUBYXHOMPVTgFQqTwG9p2Kpgs58RuboTdQ052bClpbadlMBbAwV+OZ5CPhOeGwVhzexydsejE=
x-ms-exchange-transport-forked: True
Content-ID: <C7CBC4F1B13C584E9E629F526BD53868@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67624807-641c-43a1-3109-08d71fcb29cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2019 08:49:33.8267 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7kNj15CBu20eu4VWoB+Fvt7uti79mhN19Lb/nKGtDcJA2zWf33FPwQpMqYmbMxgg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1209
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nR3nXnOvS1kKgOXUP9dQHb6nhH8d8PdE5sRkjJmMFoI=;
 b=Jc78KH0oMOWAni7ZaDJkZRe9OP0jwC3KhMYFquB0Gus1NxPbVjp15xkvGV7BosyNidtEyWkBDPWM/NOWvIjNBvfDbhJOl7QPYLzExujPEylX4FNK28yRaTlUOGzirkfuBYx/HbODd15vuQOxIeMQj2dcsoLXGzQGXfm3KGkX0Dk=
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTMuMDguMTkgdW0gMTA6MjUgc2NocmllYiBDaHJpcyBXaWxzb246DQo+IFF1b3RpbmcgS29l
bmlnLCBDaHJpc3RpYW4gKDIwMTktMDgtMTMgMDc6NTk6MjgpDQo+PiBBbSAxMi4wOC4xOSB1bSAx
Njo1MyBzY2hyaWViIENocmlzIFdpbHNvbjoNCj4+PiBRdW90aW5nIEtvZW5pZywgQ2hyaXN0aWFu
ICgyMDE5LTA4LTEyIDE1OjUwOjU5KQ0KPj4+PiBBbSAxMi4wOC4xOSB1bSAxNjo0MyBzY2hyaWVi
IENocmlzIFdpbHNvbjoNCj4+Pj4+IFF1b3RpbmcgS29lbmlnLCBDaHJpc3RpYW4gKDIwMTktMDgt
MTIgMTU6MzQ6MzIpDQo+Pj4+Pj4gQW0gMTAuMDguMTkgdW0gMTc6MzQgc2NocmllYiBDaHJpcyBX
aWxzb246DQo+Pj4+Pj4+IE1vdmUgdGhlIGR1cGxpY2F0ZWQgY29kZSB3aXRoaW4gZG1hLWZlbmNl
LmMgaW50byB0aGUgaGVhZGVyIGZvciB3aWRlcg0KPj4+Pj4+PiByZXVzZS4gSW4gdGhlIHByb2Nl
c3MgYXBwbHkgYSBzbWFsbCBtaWNyby1vcHRpbWlzYXRpb24gdG8gb25seSBwcnVuZSB0aGUNCj4+
Pj4+Pj4gZmVuY2UtPmNiX2xpc3Qgb25jZSByYXRoZXIgdGhhbiB1c2UgbGlzdF9kZWwgb24gZXZl
cnkgZW50cnkuDQo+Pj4+Pj4+DQo+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8
Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPg0KPj4+Pj4+PiBDYzogVHZydGtvIFVyc3VsaW4gPHR2
cnRrby51cnN1bGluQGludGVsLmNvbT4NCj4+Pj4+Pj4gLS0tDQo+Pj4+Pj4+ICAgICAgZHJpdmVy
cy9kbWEtYnVmL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICB8ICAxMCArLQ0KPj4+Pj4+PiAg
ICAgIGRyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UtdHJhY2UuYyAgICAgICAgICAgfCAgMjggKysr
DQo+Pj4+Pj4+ICAgICAgZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5jZS5jICAgICAgICAgICAgICAg
ICB8ICAzMyArLS0NCj4+Pj4+Pj4gICAgICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9i
cmVhZGNydW1icy5jIHwgIDMyICstLQ0KPj4+Pj4+PiAgICAgIGluY2x1ZGUvbGludXgvZG1hLWZl
bmNlLWltcGwuaCAgICAgICAgICAgICAgfCAgODMgKysrKysrKw0KPj4+Pj4+PiAgICAgIGluY2x1
ZGUvbGludXgvZG1hLWZlbmNlLXR5cGVzLmggICAgICAgICAgICAgfCAyNTggKysrKysrKysrKysr
KysrKysrKysNCj4+Pj4+Pj4gICAgICBpbmNsdWRlL2xpbnV4L2RtYS1mZW5jZS5oICAgICAgICAg
ICAgICAgICAgIHwgMjI4ICstLS0tLS0tLS0tLS0tLS0tDQo+Pj4+Pj4gTWhtLCBJIGRvbid0IHJl
YWxseSBzZWUgdGhlIHZhbHVlIGluIGNyZWF0aW5nIG1vcmUgaGVhZGVyIGZpbGVzLg0KPj4+Pj4+
DQo+Pj4+Pj4gRXNwZWNpYWxseSBJJ20gcHJldHR5IHN1cmUgdGhhdCB0aGUgdHlwZXMgc2hvdWxk
IHN0YXkgaW4gZG1hLWZlbmNlLmgNCj4+Pj4+IGlpcmMsIHdoZW4gSSBpbmNsdWRlZCB0aGUgdHJh
Y2UuaCBmcm9tIGRtYS1mZW5jZS5oIG9yIGRtYS1mZW5jZS1pbXBsLmgNCj4+Pj4+IHdpdGhvdXQg
c2VwYXJhdGluZyB0aGUgdHlwZXMsIGFtZGdwdSBmYWlsZWQgdG8gY29tcGlsZSAod2hpY2ggaXMg
bW9yZQ0KPj4+Pj4gdGhhbiBsaWtlbHkgdG8gYmUgc2ltcGx5IGR1ZSB0byBiZSBmaXJzdCBkcm0g
aW4gdGhlIGxpc3QgdG8gY29tcGlsZSkuDQo+Pj4+IEFoLCBidXQgd2h5IGRvIHlvdSB3YW50IHRv
IGluY2x1ZGUgdHJhY2UuaCBpbiBhIGhlYWRlciBpbiB0aGUgZmlyc3QgcGxhY2U/DQo+Pj4+DQo+
Pj4+IFRoYXQncyB1c3VhbGx5IG5vdCBzb21ldGhpbmcgSSB3b3VsZCByZWNvbW1lbmQgZWl0aGVy
Lg0KPj4+IFRoZSBwcm9ibGVtIGlzIHRoYXQgd2UgZG8gZW1pdCBhIHRyYWNlcG9pbnQgYXMgcGFy
dCBvZiB0aGUgc2VxdWVuY2UgSQ0KPj4+IHdhbnQgdG8gcHV0IGludG8gdGhlIHJldXNhYmxlIGNo
dW5rIG9mIGNvZGUuDQo+PiBPaywgd2UgYXJlIGdvaW5nIGluIGNpcmNsZXMgaGVyZS4gV2h5IGRv
IHlvdSB3YW50IHRvIHJldXNlIHRoZSBjb2RlIHRoZW4/DQo+IEkgYW0gcmV1c2luZyB0aGUgY29k
ZSB0byBhdm9pZCBmdW4gYW5kIGdhbWVzIHdpdGggc2lnbmFsLXZzLWZyZWUuDQoNClllYWgsIGJ1
dCB0aGF0IGRvZXNuJ3Qgc2VlbXMgdG8gYmUgdmFsaWQuDQoNClNlZSB0aGUgZG1hX2ZlbmNlIHNo
b3VsZCBtb3JlIG9yIGxlc3MgYmUgYSBjb250YWluZWQgb2JqZWN0IGFuZCB5b3Ugbm93IA0KZXhw
b3NlIHF1aXRlIGEgYml0IG9mIHRoZSBpbnRlcm5hbCBmdW5jdGlvbmFsaXR5IGluc2lkZSBhIGhl
YWRlcnMuDQoNCkFuZCBjcmVhdGluZyBoZWFkZXJzIHdoaWNoIHdoZW4gaW5jbHVkZWQgbWFrZSBv
dGhlciBkcml2ZXJzIGZhaWwgdG8gDQpjb21waWxlIHNvdW5kcyBsaWtlIGEgcmF0aGVyIGJhZCBp
ZGVhIHRvIG1lLg0KDQpQbGVhc2UgZXhwbGFpbiB0aGUgYmFja2dyb3VuZCBhIGJpdCBtb3JlLg0K
DQpUaGFua3MsDQpDaHJpc3RpYW4uDQoNCj4gLUNocmlzDQoNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
