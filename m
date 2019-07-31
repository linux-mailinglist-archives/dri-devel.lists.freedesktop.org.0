Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1C27C30A
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 15:13:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2E3089C2A;
	Wed, 31 Jul 2019 13:13:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700058.outbound.protection.outlook.com [40.107.70.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFA8F89C2A;
 Wed, 31 Jul 2019 13:13:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G1AESCN6gQdmwrzFmJFI/vELY1KKo/d+xv3Bjw92oa2WFh2ULvd7/unyAAvg62LBGAK0fb2DXavE/5rwpexpZ8b1tbN84znoYkHNUHXvUTMoz8MFTlqYigC4aaCyBZ8H6NVghdiH8IZXxXCDZuYzPwELKdrWv18cb3xvtCnBl+RV5eZV20sq7N9Se3UummaXewvEEqoK7aM6bH6Mls7jrSJvY8eMf5sWI/7Q+FPvZf8jLTi5pxjM1eDeZCO2mpLe0aomB464ZOJao+LZLSHGR6wyZtphP18TCpZGQJK6JBbnKmVZRNlXRmArQZDcZE704NeCV/44PrVHDCI5/gfV0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B0tTjFnf39wS+fhVYyFuQVgGwJMfGVjbxgpIZOrl2zI=;
 b=ATupPWgwI0VXTQOMPEBf0MlAUBeJxzX/oNe9PCQyLUZhf8iUkpeG+bV+UlBtAzoPS5huOYJ/xXTo/VxvdiF47Ww5ZidyNMraXQwH0Y3eQxnmst+7vmv7WYfrXAqxxlUBLtpPpzF7Hvp441JgmGHBAhK9Wk4i1bOChBbCiGXOpVocx23AL67hRbmGYj27+r6BdzWJmyjV+lRBAkXhEz0jNuUpODyKRUZzdQkT2LH9Y7vuoqWTIjJ5Q0SqwQZF+7ZRkkEgg2Rp2XUrqZnFAIXLOjENwZQM4C0/WTKwjZfuN/Gz4QxD48506unYM0/zNIhhMYusTZkavkR3+bLwUV2jMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3612.namprd12.prod.outlook.com (20.178.199.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Wed, 31 Jul 2019 13:13:42 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::1c82:54e7:589b:539c]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::1c82:54e7:589b:539c%5]) with mapi id 15.20.2136.010; Wed, 31 Jul 2019
 13:13:42 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: Christoph Hellwig <hch@lst.de>, =?utf-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs
 <bskeggs@redhat.com>
Subject: Re: [PATCH 01/13] amdgpu: remove -EAGAIN handling for hmm_range_fault
Thread-Topic: [PATCH 01/13] amdgpu: remove -EAGAIN handling for hmm_range_fault
Thread-Index: AQHVRpr0Un6PYBf3lk+NPGPUoq8WK6bktlQA
Date: Wed, 31 Jul 2019 13:13:41 +0000
Message-ID: <c2f277a9-476d-a14c-d619-860508aa4ca0@amd.com>
References: <20190730055203.28467-1-hch@lst.de>
 <20190730055203.28467-2-hch@lst.de>
In-Reply-To: <20190730055203.28467-2-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTXPR0101CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::25) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 484d67c9-0096-4501-706e-08d715b8e8ab
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3612; 
x-ms-traffictypediagnostic: DM6PR12MB3612:
x-microsoft-antispam-prvs: <DM6PR12MB3612A402DB8E7F300E56054D92DF0@DM6PR12MB3612.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:626;
x-forefront-prvs: 011579F31F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(396003)(346002)(39860400002)(366004)(199004)(189003)(102836004)(8936002)(229853002)(446003)(486006)(26005)(86362001)(6506007)(386003)(11346002)(2906002)(14454004)(25786009)(53546011)(31696002)(65806001)(256004)(476003)(6486002)(5660300002)(53936002)(4326008)(64126003)(2616005)(31686004)(76176011)(7736002)(6512007)(52116002)(66476007)(66946007)(81156014)(36756003)(6116002)(66066001)(54906003)(6436002)(3846002)(186003)(65956001)(6246003)(7416002)(71190400001)(68736007)(305945005)(110136005)(478600001)(81166006)(8676002)(64756008)(316002)(66556008)(66446008)(71200400001)(58126008)(99286004)(65826007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3612;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 21gLlnslHZ97qe4fMq48pfSsEU9K0i7Hn2EKKfKhtGlghWNbsaxDeg1mu/a/ChAAkVA8kRT/aqYf1yJCdcydmA2MUbWSoQPVJ+6hiyskB5tnVda3rbQyCFQxMk7ovOQSXX+Ek2+f1t807mZH5o69+FhgKkzVoquqZXvFsWksq6Pr9rDSVbqzbkHiZsCMDeUB/IEfO7NqHk/1SzFgGE5VqS43R7Glg34WHiFezRDnCTUKvKLsDS9w7lzSKVQNGiflraKm+AJNvyoy1VDCVZtuWKU6JjzcvFKMJyFO7QOG/gX/TCrIiiLiWXf4M2FPlIpl7ZWWZA0s/uG8Xx/OXkdgYB6JrV2XJadVhFG7mW4YcLCte0XSE2g78mYESU9bTt0Pdkf/+JNML4Z6mqjG3XSyuaRc+M8tBu1bWRSOoxKqZOg=
Content-ID: <898170DF95EE3B4799287122532C589F@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 484d67c9-0096-4501-706e-08d715b8e8ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2019 13:13:41.9269 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3612
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B0tTjFnf39wS+fhVYyFuQVgGwJMfGVjbxgpIZOrl2zI=;
 b=XLaLFrbB5s9bUV/KrArgGKYndICAVetRlgPaNyrlfRe1e6C6/KEm8HQRkxl+iNhIdJzDjEwyo+SmAEUTQpckjBuPtRLagxpmOtffY22o1WnUf+UpFbgShpBe1NEye8RW6JzuphRRBU1/vmmQNGpUF3pOZG90o3C333fLQ2DxSWg=
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNy0zMCAxOjUxIGEubS4sIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOg0KPiBobW1f
cmFuZ2VfZmF1bHQgY2FuIG9ubHkgcmV0dXJuIC1FQUdBSU4gaWYgY2FsbGVkIHdpdGggdGhlIGJs
b2NrDQo+IGFyZ3VtZW50IHNldCB0byBmYWxzZSwgc28gcmVtb3ZlIHRoZSBzcGVjaWFsIGhhbmRs
aW5nIGZvciBpdC4NCg0KVGhlIGJsb2NrIGFyZ3VtZW50IG5vIGxvbmdlciBleGlzdHMuIFlvdSBy
ZXBsYWNlZCB0aGF0IHdpdGggdGhlIA0KSE1NX0ZBVUxUX0FMTE9XX1JFVFJZIHdpdGggb3Bwb3Np
dGUgbG9naWMuIFNvIHRoaXMgc2hvdWxkIHJlYWQgDQoiaG1tX3JhbmdlX2ZhdWx0IGNhbiBvbmx5
IHJldHVybiAtRUFHQUlOIGlmIGNhbGxlZCB3aXRoIHRoZSANCkhNTV9GQVVMVF9BTExPV19SRVRS
WSBmbGFnIHNldCwgc28gcmVtb3ZlIHRoZSBzcGVjaWFsIGhhbmRsaW5nIGZvciBpdC4NCg0KV2l0
aCB0aGF0IGZpeGVkLCB0aGlzIGNvbW1pdCBpcyBSZXZpZXdlZC1ieTogRmVsaXggS3VlaGxpbmcg
DQo8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4NCg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3Rv
cGggSGVsbHdpZyA8aGNoQGxzdC5kZT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3R0bS5jIHwgMjMgKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gICAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYw0KPiBpbmRleCAxMmE1OWFjODNmNzIuLmYw
ODIxNjM4YmJjNiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3R0bS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0u
Yw0KPiBAQCAtNzc4LDcgKzc3OCw2IEBAIGludCBhbWRncHVfdHRtX3R0X2dldF91c2VyX3BhZ2Vz
KHN0cnVjdCBhbWRncHVfYm8gKmJvLCBzdHJ1Y3QgcGFnZSAqKnBhZ2VzKQ0KPiAgIAlzdHJ1Y3Qg
aG1tX3JhbmdlICpyYW5nZTsNCj4gICAJdW5zaWduZWQgbG9uZyBpOw0KPiAgIAl1aW50NjRfdCAq
cGZuczsNCj4gLQlpbnQgcmV0cnkgPSAwOw0KPiAgIAlpbnQgciA9IDA7DQo+ICAgDQo+ICAgCWlm
ICghbW0pIC8qIEhhcHBlbnMgZHVyaW5nIHByb2Nlc3Mgc2h1dGRvd24gKi8NCj4gQEAgLTgyMiw3
ICs4MjEsNiBAQCBpbnQgYW1kZ3B1X3R0bV90dF9nZXRfdXNlcl9wYWdlcyhzdHJ1Y3QgYW1kZ3B1
X2JvICpibywgc3RydWN0IHBhZ2UgKipwYWdlcykNCj4gICAJaG1tX3JhbmdlX3JlZ2lzdGVyKHJh
bmdlLCBtaXJyb3IsIHN0YXJ0LA0KPiAgIAkJCSAgIHN0YXJ0ICsgdHRtLT5udW1fcGFnZXMgKiBQ
QUdFX1NJWkUsIFBBR0VfU0hJRlQpOw0KPiAgIA0KPiAtcmV0cnk6DQo+ICAgCS8qDQo+ICAgCSAq
IEp1c3Qgd2FpdCBmb3IgcmFuZ2UgdG8gYmUgdmFsaWQsIHNhZmUgdG8gaWdub3JlIHJldHVybiB2
YWx1ZSBhcyB3ZQ0KPiAgIAkgKiB3aWxsIHVzZSB0aGUgcmV0dXJuIHZhbHVlIG9mIGhtbV9yYW5n
ZV9mYXVsdCgpIGJlbG93IHVuZGVyIHRoZQ0KPiBAQCAtODMxLDI0ICs4MjksMTIgQEAgaW50IGFt
ZGdwdV90dG1fdHRfZ2V0X3VzZXJfcGFnZXMoc3RydWN0IGFtZGdwdV9ibyAqYm8sIHN0cnVjdCBw
YWdlICoqcGFnZXMpDQo+ICAgCWhtbV9yYW5nZV93YWl0X3VudGlsX3ZhbGlkKHJhbmdlLCBITU1f
UkFOR0VfREVGQVVMVF9USU1FT1VUKTsNCj4gICANCj4gICAJZG93bl9yZWFkKCZtbS0+bW1hcF9z
ZW0pOw0KPiAtDQo+ICAgCXIgPSBobW1fcmFuZ2VfZmF1bHQocmFuZ2UsIDApOw0KPiAtCWlmICh1
bmxpa2VseShyIDwgMCkpIHsNCj4gLQkJaWYgKGxpa2VseShyID09IC1FQUdBSU4pKSB7DQo+IC0J
CQkvKg0KPiAtCQkJICogcmV0dXJuIC1FQUdBSU4sIG1tYXBfc2VtIGlzIGRyb3BwZWQNCj4gLQkJ
CSAqLw0KPiAtCQkJaWYgKHJldHJ5KysgPCBNQVhfUkVUUllfSE1NX1JBTkdFX0ZBVUxUKQ0KPiAt
CQkJCWdvdG8gcmV0cnk7DQo+IC0JCQllbHNlDQo+IC0JCQkJcHJfZXJyKCJSZXRyeSBobW0gZmF1
bHQgdG9vIG1hbnkgdGltZXNcbiIpOw0KPiAtCQl9DQo+IC0NCj4gLQkJZ290byBvdXRfdXBfcmVh
ZDsNCj4gLQl9DQo+IC0NCj4gICAJdXBfcmVhZCgmbW0tPm1tYXBfc2VtKTsNCj4gICANCj4gKwlp
ZiAodW5saWtlbHkociA8IDApKQ0KPiArCQlnb3RvIG91dF9mcmVlX3BmbnM7DQo+ICsNCj4gICAJ
Zm9yIChpID0gMDsgaSA8IHR0bS0+bnVtX3BhZ2VzOyBpKyspIHsNCj4gICAJCXBhZ2VzW2ldID0g
aG1tX2RldmljZV9lbnRyeV90b19wYWdlKHJhbmdlLCBwZm5zW2ldKTsNCj4gICAJCWlmICh1bmxp
a2VseSghcGFnZXNbaV0pKSB7DQo+IEBAIC04NjQsOSArODUwLDYgQEAgaW50IGFtZGdwdV90dG1f
dHRfZ2V0X3VzZXJfcGFnZXMoc3RydWN0IGFtZGdwdV9ibyAqYm8sIHN0cnVjdCBwYWdlICoqcGFn
ZXMpDQo+ICAgDQo+ICAgCXJldHVybiAwOw0KPiAgIA0KPiAtb3V0X3VwX3JlYWQ6DQo+IC0JaWYg
KGxpa2VseShyICE9IC1FQUdBSU4pKQ0KPiAtCQl1cF9yZWFkKCZtbS0+bW1hcF9zZW0pOw0KPiAg
IG91dF9mcmVlX3BmbnM6DQo+ICAgCWhtbV9yYW5nZV91bnJlZ2lzdGVyKHJhbmdlKTsNCj4gICAJ
a3ZmcmVlKHBmbnMpOw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
