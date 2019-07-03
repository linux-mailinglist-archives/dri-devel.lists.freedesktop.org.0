Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A809F5DC85
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 04:27:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ABEA6E0BF;
	Wed,  3 Jul 2019 02:27:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790058.outbound.protection.outlook.com [40.107.79.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 960986E088;
 Wed,  3 Jul 2019 02:27:24 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB2873.namprd12.prod.outlook.com (20.179.71.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Wed, 3 Jul 2019 02:27:22 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927%7]) with mapi id 15.20.2032.019; Wed, 3 Jul 2019
 02:27:22 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: Jason Gunthorpe <jgg@mellanox.com>, Christoph Hellwig <hch@lst.de>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, David Airlie
 <airlied@linux.ie>
Subject: Re: [RFC] mm/hmm: pass mmu_notifier_range to
 sync_cpu_device_pagetables
Thread-Topic: [RFC] mm/hmm: pass mmu_notifier_range to
 sync_cpu_device_pagetables
Thread-Index: AQHVHY88L0Ra3sy2MEC8cRT/FiJ1Iqa35H2AgAAxIACAAALQAIAAOiIA
Date: Wed, 3 Jul 2019 02:27:22 +0000
Message-ID: <1dc82dc8-3e6f-1d6f-b14d-41ae3c1b2709@amd.com>
References: <20190608001452.7922-1-rcampbell@nvidia.com>
 <20190702195317.GT31718@mellanox.com> <20190702224912.GA24043@lst.de>
 <20190702225911.GA11833@mellanox.com>
In-Reply-To: <20190702225911.GA11833@mellanox.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-clientproxiedby: YTXPR0101CA0037.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::14) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f4c43e91-ac3d-445c-4f9c-08d6ff5dfa93
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2873; 
x-ms-traffictypediagnostic: DM6PR12MB2873:
x-microsoft-antispam-prvs: <DM6PR12MB28738436ECA864445C0B152292FB0@DM6PR12MB2873.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1443;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(39860400002)(366004)(376002)(189003)(199004)(486006)(2906002)(4326008)(476003)(36756003)(256004)(99286004)(2616005)(65956001)(64126003)(446003)(71200400001)(11346002)(64756008)(66556008)(53546011)(6486002)(65826007)(66446008)(66946007)(110136005)(66476007)(86362001)(478600001)(3846002)(58126008)(31696002)(6116002)(5660300002)(71190400001)(66066001)(6246003)(25786009)(65806001)(73956011)(186003)(229853002)(7736002)(53936002)(52116002)(6436002)(7416002)(6512007)(26005)(8936002)(68736007)(6506007)(316002)(76176011)(102836004)(81156014)(8676002)(81166006)(31686004)(54906003)(386003)(14454004)(305945005)(72206003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2873;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: T4A0SOEZuvMXDc2GJkaoVOja/4vmbBgDv1OJqL5jnyITlxTrHw/QCxACcsNEfaG5ELCf+S4PdsOwcmvxwy7ueYuhuwQ/YE/QSw6R7nwaGysRm8t3sNeJmVjbvNGkecAK7BTu1+S52Q4Zw1QqD0CP36p1De2eqy05E3XOfFty0OEgqJWFfDNXFh9gQ0+nNNFZz2cjKaH7C8TLsfNrS16JZtux4j8kh7hRy7JY2aJeBHEAXABU5nBpjUJXjaRs7aeNFKDGypocWd5pEWx0alb3pUFmeTpMpnn74Y0jCz3RYBQkGc4y8B0kYHC37wkqxAiYbHcmvOk53x/BvVO0t2BjjSKzKnP8mtWNBi7CKrKc9J39MoxF+0teiggKcPalSBQIlP28lGydZQJpdDTG/y+xbZkUAdOZEzJXlGyRT66pLoo=
Content-ID: <545ED388DC4B924F8D65E5F30ACEE5DA@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4c43e91-ac3d-445c-4f9c-08d6ff5dfa93
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 02:27:22.3841 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2873
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wy8FO9Kpq0mYscU2pRZ988JGN5ZGYBRBcI9oCJCrgeY=;
 b=c7vT3JqHuw5GLWBbDW+KTW8nsyMU+XPiZAj5jbIgC/Ke4rsXrkwaI4CY/X58owwLlI4pT3IPzHdc1BD0OcCVtz4lnqWodvOvvqe6Ceqsy46RoQBp30rTcYToq0d97i68u0BVTG2y2jGlJMPoUIcDUXld7eu8tGSSnKELVL6NEp4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
 John Hubbard <jhubbard@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jerome Glisse <jglisse@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNy0wMiA2OjU5IHAubS4sIEphc29uIEd1bnRob3JwZSB3cm90ZToNCj4gT24gV2Vk
LCBKdWwgMDMsIDIwMTkgYXQgMTI6NDk6MTJBTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3aWcgd3Jv
dGU6DQo+PiBPbiBUdWUsIEp1bCAwMiwgMjAxOSBhdCAwNzo1MzoyM1BNICswMDAwLCBKYXNvbiBH
dW50aG9ycGUgd3JvdGU6DQo+Pj4+IEknbSBzZW5kaW5nIHRoaXMgb3V0IG5vdyBzaW5jZSB3ZSBh
cmUgdXBkYXRpbmcgbWFueSBvZiB0aGUgSE1NIEFQSXMNCj4+Pj4gYW5kIEkgdGhpbmsgaXQgd2ls
bCBiZSB1c2VmdWwuDQo+Pj4gVGhpcyBtYWtlIHNvIG11Y2ggc2Vuc2UsIEknZCBsaWtlIHRvIGFw
cGx5IHRoaXMgaW4gaG1tLmdpdCwgaXMgdGhlcmUNCj4+PiBhbnkgb2JqZWN0aW9uPw0KPj4gQXMg
dGhpcyBjcmVhdGVzIGEgc29tZXdoYXQgaGFpcnkgY29uZmxpY3QgZm9yIGFtZGdwdSwgd291bGRu
J3QgaXQgYmUNCj4+IGEgYmV0dGVyIGlkZWEgdG8gd2FpdCBhIGJpdCBhbmQgYXBwbHkgaXQgZmly
c3QgdGhpbmcgZm9yIG5leHQgbWVyZ2UNCj4+IHdpbmRvdz8NCj4gTXkgdGhpbmtpbmcgaXMgdGhh
dCBBTUQgR1BVIGFscmVhZHkgaGFzIGEgbW9uc3RlciBjb25mbGljdCBmcm9tIHRoaXM6DQo+DQo+
ICAgaW50IGhtbV9yYW5nZV9yZWdpc3RlcihzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSwNCj4gLSAg
ICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgbW1fc3RydWN0ICptbSwNCj4gKyAgICAgICAgICAg
ICAgICAgICAgICBzdHJ1Y3QgaG1tX21pcnJvciAqbWlycm9yLA0KPiAgICAgICAgICAgICAgICAg
ICAgICAgICB1bnNpZ25lZCBsb25nIHN0YXJ0LA0KPiAgICAgICAgICAgICAgICAgICAgICAgICB1
bnNpZ25lZCBsb25nIGVuZCwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgcGFn
ZV9zaGlmdCk7DQo+DQo+IFNvLCBkZXBlbmRpbmcgb24gaG93IHRoYXQgaXMgcmVzb2x2ZWQgd2Ug
bWlnaHQgd2FudCB0byBkbyBib3RoIEFQSQ0KPiBjaGFuZ2VzIGF0IG9uY2UuDQoNCkkganVzdCBz
ZW50IG91dCBhIGZpeCBmb3IgdGhlIGhtbV9taXJyb3IgQVBJIGNoYW5nZS4NCg0KDQo+DQo+IE9y
IHdlIG1heSBoYXZlIHRvIHJldmVydCB0aGUgYWJvdmUgY2hhbmdlIGF0IHRoaXMgbGF0ZSBkYXRl
Lg0KPg0KPiBXYWl0aW5nIGZvciBBTURHUFUgdGVhbSB0byBkaXNjdXNzIHdoYXQgcHJvY2VzcyB0
aGV5IHdhbnQgdG8gdXNlLg0KDQpZZWFoLCBJJ20gd29uZGVyaW5nIHdoYXQgdGhlIHByb2Nlc3Mg
aXMgbXlzZWxmLiBXaXRoIEhNTSBhbmQgZHJpdmVyIA0KZGV2ZWxvcG1lbnQgaGFwcGVuaW5nIG9u
IGRpZmZlcmVudCBicmFuY2hlcyB0aGVzZSBraW5kcyBvZiBBUEkgY2hhbmdlcyANCmFyZSBwYWlu
ZnVsLiBUaGVyZSBzZWVtcyB0byBiZSBhIGJ1aWx0LWluIGFzc3VtcHRpb24gaW4gdGhlIGN1cnJl
bnQgDQpwcm9jZXNzLCB0aGF0IGNvZGUgZmxvd3MgbW9zdGx5IGluIG9uZSBkaXJlY3Rpb24gYW1k
LXN0YWdpbmctZHJtLW5leHQgLT4gDQpkcm0tbmV4dCAtPiBsaW51eC1uZXh0IC0+IGxpbnV4LiBU
aGF0IGFzc3VtcHRpb24gaXMgYnJva2VuIHdpdGggSE1NIGNvZGUgDQpldm9sdmluZyByYXBpZGx5
IGluIGJvdGggYW1kZ3B1IGFuZCBtbS4NCg0KSWYgd2Ugd2FudCB0byBjb250aW51ZSBkZXZlbG9w
aW5nIEhNTSBkcml2ZXIgY2hhbmdlcyBpbiANCmFtZC1zdGFnaW5nLWRybS1uZXh0LCB3ZSdsbCBu
ZWVkIHRvIHN5bmNocm9uaXplIHdpdGggaG1tLmdpdCBtb3JlIA0KZnJlcXVlbnRseSwgYm90aCB3
YXlzLiBJIGJlbGlldmUgcGFydCBvZiB0aGUgcHJvYmxlbSBpcywgdGhhdCB0aGVyZSBpcyBhIA0K
ZmFpcmx5IGxvbmcgbGVhZC10aW1lIGZyb20gZ2V0dGluZyBjaGFuZ2VzIGZyb20gYW1kLXN0YWdp
bmctZHJtLW5leHQgDQppbnRvIGxpbnV4LW5leHQsIGFzIHRoZXkgYXJlIGhlbGQgZm9yIG9uZSBy
ZWxlYXNlIGN5Y2xlIGluIGRybS1uZXh0LiANClB1c2hpbmcgSE1NLXJlbGF0ZWQgY2hhbmdlcyB0
aHJvdWdoIGRybS1maXhlcyBtYXkgb2ZmZXIgYSBraW5kIG9mIA0Kc2hvcnRjdXQuIFBoaWxpcCBh
bmQgbXkgbGF0ZXN0IGZpeHVwIGlzIGp1c3QgYnlwYXNzaW5nIGRybS1uZXh0IA0KY29tcGxldGVs
eSBhbmQgZ29pbmcgc3RyYWlnaHQgaW50byBsaW51eC1uZXh0LCB0aG91Z2guDQoNClJlZ2FyZHMs
DQogwqAgRmVsaXgNCg0KDQo+DQo+IEphc29uDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
