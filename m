Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1128B05C
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 08:59:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EACE8984D;
	Tue, 13 Aug 2019 06:59:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770043.outbound.protection.outlook.com [40.107.77.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5267A89346;
 Tue, 13 Aug 2019 06:59:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LQfRUQLMbZjI3ThckX5616mtGtAK3fUiytP6LVEqklm1naJZpLwJQhTe7mponmX/Bn1I8/uRREl3+BRBtunP6QAL7buVHz12mpDLyzmZwxSRXNswf3JkbiL3A89gn28IvXNAfziLWlRvRMTa/wIwiAjOLbVAQkmeJh/l7m6rK0nUr4uOovZl1M09VuRzBaIKxSickCkUyK8NdNzWgWfbNzhRDPFcAC1AzjnxUD07DwUXno2gWIXsmQwHA43l+JsSEHriNcMp2PfMYAbigj9a8QqBexUw38+/uPLBSQ/IucJ5J4S/NH8bmAO3/0Jw+KRyrBG2DNmA14mJ13qrnSwuSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0EleEi6MRytO7e8TDAGOFv5r9xTPG+gipFDyd95HEno=;
 b=MWgEtISz9rVmtsw0sUiAczjDQCAImkOFdpWbiTdSDz1uLRYyVg4qqKl27gXFNMhLwivLr3v2+MEzqovJ9H6daJeHtHON1vOYgpuh8Jx2Elinbxpy6DDI101veSiBL+KRuUK7jqMD37ujfrHHsN1zVMCmhovjVdiG3dzk06YUStdC27ashXaDuunGSjSWCLwxWH/6Wifu2ZfgLewZxAJZcSvQvZq2yGaZ9SReBhheBtqoe2ZiDDpYCxEsmHFgkZCCrJ7H+V9/+wBWg5a3o4OYDH2apGdLGJp3hRxlbNO6Vc7quid6KZOjTYU/Rxhle230fuNi6uOpC1MM+yvJumJF7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1244.namprd12.prod.outlook.com (10.168.236.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.21; Tue, 13 Aug 2019 06:59:28 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3%5]) with mapi id 15.20.2157.022; Tue, 13 Aug 2019
 06:59:28 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 3/4] dma-fence: Refactor signaling for manual invocation
Thread-Topic: [PATCH 3/4] dma-fence: Refactor signaling for manual invocation
Thread-Index: AQHVT5FcoLDXFG6zukyZzm7Lcg/sg6b3lvQAgAACdICAAAIkAIAAAKWAgAEN8IA=
Date: Tue, 13 Aug 2019 06:59:28 +0000
Message-ID: <091b5d17-241e-53a8-17e0-b61b30720bbb@amd.com>
References: <20190810153430.30636-1-chris@chris-wilson.co.uk>
 <20190810153430.30636-3-chris@chris-wilson.co.uk>
 <886f647b-24a6-ee24-4f50-68153fec6c53@amd.com>
 <156562099543.2301.5895998761855095437@skylake-alporthouse-com>
 <40961588-a377-9c92-379f-e24e3b711ce7@amd.com>
 <156562159336.2301.12364265101196283146@skylake-alporthouse-com>
In-Reply-To: <156562159336.2301.12364265101196283146@skylake-alporthouse-com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0046.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::34) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a7d185d6-619a-4c42-7c9c-08d71fbbc868
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1244; 
x-ms-traffictypediagnostic: DM5PR12MB1244:
x-microsoft-antispam-prvs: <DM5PR12MB12441E4200193102B7C8F20783D20@DM5PR12MB1244.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01283822F8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(396003)(366004)(376002)(346002)(189003)(199004)(2906002)(305945005)(6116002)(2501003)(14454004)(52116002)(8676002)(76176011)(81156014)(81166006)(36756003)(6512007)(110136005)(6436002)(31686004)(54906003)(66476007)(66556008)(7736002)(446003)(66946007)(66446008)(86362001)(64756008)(99286004)(478600001)(71200400001)(46003)(186003)(256004)(4326008)(65956001)(65806001)(11346002)(65826007)(58126008)(64126003)(25786009)(53936002)(229853002)(6486002)(31696002)(316002)(6506007)(386003)(486006)(102836004)(5660300002)(2616005)(8936002)(476003)(71190400001)(6246003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1244;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: F1Lb76iSZaLEpPRFD9LHXac6quUOKNxoBFOHPEBXKnAAxTdqM+xb/oyxjBj95s2pcgN89IeXVBct9qI0j4UfSsf8GBAUMX/umowgRCRHdyYKWxteQ/sONnEryUJXc4kIFheRpOvx2zSzLOTK2KcX3F7uapKRozr3tNrKBIrbDDIAsCAUFZgP50kCp+X1lwYUVmlftzQljI2tmmsj9LZB5UjkE+bHpU5d7ybR1RO/yw7OPoD210Nhz56pcRfQZq60g/gKHiAZyHCMKxztiuJ1xZuGQzd643Umnva3iDR+bprFxbTR6ImU5u5CkyHXRUcs63z5ol3yJqCzJewspdAbHpeX5tTgWvmv9G6nJ0klhQzoR+JnbOTYkuJhmU3MSoXY69IrwBgOBOy2Tedt0FaV63nhHJUpdWjTUVrCr0sYEZw=
x-ms-exchange-transport-forked: True
Content-ID: <C92244037BFA984FB764A2418975324B@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7d185d6-619a-4c42-7c9c-08d71fbbc868
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2019 06:59:28.3218 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ANAHLC7tXPlSvaIG8axjmaVhICJ6SG3LLczrCp1Xs25F3l2E1I1HuCeDNd1nhmv0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1244
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0EleEi6MRytO7e8TDAGOFv5r9xTPG+gipFDyd95HEno=;
 b=HbdE7uObEzzSuTP9WasoH+8+NazyTTbPp+92lhYUtY0Ffz+yZdFMUvlLtG+c5F8LgPeQTKeCGBfDHEk8cDUsu5RV6jS6875hRORKta64wi8ebbZvaC4/9C3Px0Y4hQGOC4eJKISg2D1ggEthVRHh5DqOJrFMsar9d3pMUmnARcE=
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

QW0gMTIuMDguMTkgdW0gMTY6NTMgc2NocmllYiBDaHJpcyBXaWxzb246DQo+IFF1b3RpbmcgS29l
bmlnLCBDaHJpc3RpYW4gKDIwMTktMDgtMTIgMTU6NTA6NTkpDQo+PiBBbSAxMi4wOC4xOSB1bSAx
Njo0MyBzY2hyaWViIENocmlzIFdpbHNvbjoNCj4+PiBRdW90aW5nIEtvZW5pZywgQ2hyaXN0aWFu
ICgyMDE5LTA4LTEyIDE1OjM0OjMyKQ0KPj4+PiBBbSAxMC4wOC4xOSB1bSAxNzozNCBzY2hyaWVi
IENocmlzIFdpbHNvbjoNCj4+Pj4+IE1vdmUgdGhlIGR1cGxpY2F0ZWQgY29kZSB3aXRoaW4gZG1h
LWZlbmNlLmMgaW50byB0aGUgaGVhZGVyIGZvciB3aWRlcg0KPj4+Pj4gcmV1c2UuIEluIHRoZSBw
cm9jZXNzIGFwcGx5IGEgc21hbGwgbWljcm8tb3B0aW1pc2F0aW9uIHRvIG9ubHkgcHJ1bmUgdGhl
DQo+Pj4+PiBmZW5jZS0+Y2JfbGlzdCBvbmNlIHJhdGhlciB0aGFuIHVzZSBsaXN0X2RlbCBvbiBl
dmVyeSBlbnRyeS4NCj4+Pj4+DQo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNo
cmlzQGNocmlzLXdpbHNvbi5jby51az4NCj4+Pj4+IENjOiBUdnJ0a28gVXJzdWxpbiA8dHZydGtv
LnVyc3VsaW5AaW50ZWwuY29tPg0KPj4+Pj4gLS0tDQo+Pj4+PiAgICAgZHJpdmVycy9kbWEtYnVm
L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICB8ICAxMCArLQ0KPj4+Pj4gICAgIGRyaXZlcnMv
ZG1hLWJ1Zi9kbWEtZmVuY2UtdHJhY2UuYyAgICAgICAgICAgfCAgMjggKysrDQo+Pj4+PiAgICAg
ZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5jZS5jICAgICAgICAgICAgICAgICB8ICAzMyArLS0NCj4+
Pj4+ICAgICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9icmVhZGNydW1icy5jIHwgIDMy
ICstLQ0KPj4+Pj4gICAgIGluY2x1ZGUvbGludXgvZG1hLWZlbmNlLWltcGwuaCAgICAgICAgICAg
ICAgfCAgODMgKysrKysrKw0KPj4+Pj4gICAgIGluY2x1ZGUvbGludXgvZG1hLWZlbmNlLXR5cGVz
LmggICAgICAgICAgICAgfCAyNTggKysrKysrKysrKysrKysrKysrKysNCj4+Pj4+ICAgICBpbmNs
dWRlL2xpbnV4L2RtYS1mZW5jZS5oICAgICAgICAgICAgICAgICAgIHwgMjI4ICstLS0tLS0tLS0t
LS0tLS0tDQo+Pj4+IE1obSwgSSBkb24ndCByZWFsbHkgc2VlIHRoZSB2YWx1ZSBpbiBjcmVhdGlu
ZyBtb3JlIGhlYWRlciBmaWxlcy4NCj4+Pj4NCj4+Pj4gRXNwZWNpYWxseSBJJ20gcHJldHR5IHN1
cmUgdGhhdCB0aGUgdHlwZXMgc2hvdWxkIHN0YXkgaW4gZG1hLWZlbmNlLmgNCj4+PiBpaXJjLCB3
aGVuIEkgaW5jbHVkZWQgdGhlIHRyYWNlLmggZnJvbSBkbWEtZmVuY2UuaCBvciBkbWEtZmVuY2Ut
aW1wbC5oDQo+Pj4gd2l0aG91dCBzZXBhcmF0aW5nIHRoZSB0eXBlcywgYW1kZ3B1IGZhaWxlZCB0
byBjb21waWxlICh3aGljaCBpcyBtb3JlDQo+Pj4gdGhhbiBsaWtlbHkgdG8gYmUgc2ltcGx5IGR1
ZSB0byBiZSBmaXJzdCBkcm0gaW4gdGhlIGxpc3QgdG8gY29tcGlsZSkuDQo+PiBBaCwgYnV0IHdo
eSBkbyB5b3Ugd2FudCB0byBpbmNsdWRlIHRyYWNlLmggaW4gYSBoZWFkZXIgaW4gdGhlIGZpcnN0
IHBsYWNlPw0KPj4NCj4+IFRoYXQncyB1c3VhbGx5IG5vdCBzb21ldGhpbmcgSSB3b3VsZCByZWNv
bW1lbmQgZWl0aGVyLg0KPiBUaGUgcHJvYmxlbSBpcyB0aGF0IHdlIGRvIGVtaXQgYSB0cmFjZXBv
aW50IGFzIHBhcnQgb2YgdGhlIHNlcXVlbmNlIEkNCj4gd2FudCB0byBwdXQgaW50byB0aGUgcmV1
c2FibGUgY2h1bmsgb2YgY29kZS4NCg0KT2ssIHdlIGFyZSBnb2luZyBpbiBjaXJjbGVzIGhlcmUu
IFdoeSBkbyB5b3Ugd2FudCB0byByZXVzZSB0aGUgY29kZSB0aGVuPw0KDQpDaHJpc3RpYW4uDQoN
Cj4gLUNocmlzDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
