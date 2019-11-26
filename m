Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 484A710AB6E
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 09:09:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED9C66E200;
	Wed, 27 Nov 2019 08:09:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on0604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe05::604])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A82C6E47B;
 Tue, 26 Nov 2019 18:32:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BERpwocay57aVutJbBhzmJdnedoxchTdwq0Qp5xqg5YHBRB2JciHsWlTBlhaMwJXzjrfSKfSlRx1Bd6CTKHGcrf4Qv+5RccR8J7ZhD9IZHwy+4q434xAi6TwktgAiNwoh643H6+NyearM5UdD+Qtnt4SQp1266YPdMl57SIupzdPQQD7GY8Rt6z6vDBiqv8+UJSrq+Wv10A5zo1ghXxGLQYgIOpw0mYoUGrhSJMPTPSTJgnFNQCK2QWAM1dVICUQKkRmSlt7OZfAnU7DNOYrR5qq0lM5EZDtn8fxUAfBWwBsGlNZSChQjR4LMOXM1U9sh0zix/ZpTUsnD+fQ3NPSEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7rDOzb8k+N+Ym+e13r96+vmlOly7JOx3j54MWXEWSE0=;
 b=XjyheEhVsdo+Cg5Rzcl0xuvrdFh6ZNzPt6otIEIY8lNW15Y2K+9ltBPBOGQDKdAIl/utiKCGQP5h6bfcNdOAlSsDUJ/ZggTDqOCi2NeK4y46KAEr98R4CaPaABXbe95mWgNPwemFcZCv9cRcLGMVuJXXVSmWnhzaERYrkuy3DJx8gnsaJ6/SdkTNcrYQv/NqD0qaw01O9puhoRu79RU8zeAG0pm3K4VFyoUIQk4STH0RK/TmfrzvwyGNFDqnNSXxmPhpz20UpDd+4RqKDDznc0XuETeIPRMRDNAzZJ2c919ANgzNVaBIRel6YOar1WE0dxGqPmnVMOlgLMSL+YFQ4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB3150.eurprd05.prod.outlook.com (10.170.239.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.21; Tue, 26 Nov 2019 18:32:52 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d%5]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 18:32:52 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Jerome Glisse <jglisse@redhat.com>
Subject: Re: [RFC 06/13] drm/i915/svm: Page table mirroring support
Thread-Topic: [RFC 06/13] drm/i915/svm: Page table mirroring support
Thread-Index: AQHVoXkU4+8qDaOXOUCsq1WAd1fqfqeX13IAgARBvICAAbOsgA==
Date: Tue, 26 Nov 2019 18:32:52 +0000
Message-ID: <20191126183247.GM7481@mellanox.com>
References: <20191122205734.15925-1-niranjana.vishwanathapura@intel.com>
 <20191122205734.15925-7-niranjana.vishwanathapura@intel.com>
 <20191122233308.GA7481@mellanox.com> <20191125163327.GA5516@redhat.com>
In-Reply-To: <20191125163327.GA5516@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BL0PR1501CA0026.namprd15.prod.outlook.com
 (2603:10b6:207:17::39) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.162.113.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 26bc7bbd-9a03-428c-00e7-08d7729f0bcf
x-ms-traffictypediagnostic: VI1PR05MB3150:
x-microsoft-antispam-prvs: <VI1PR05MB315014246663EC8F211BF3E5CF450@VI1PR05MB3150.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0233768B38
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(39860400002)(136003)(346002)(396003)(189003)(199004)(6506007)(6916009)(446003)(6436002)(81156014)(386003)(6486002)(1076003)(66446008)(4326008)(8936002)(86362001)(81166006)(2616005)(66066001)(478600001)(8676002)(6512007)(7416002)(14454004)(229853002)(5660300002)(76176011)(2906002)(256004)(99286004)(102836004)(186003)(36756003)(7736002)(33656002)(26005)(14444005)(64756008)(66946007)(25786009)(52116002)(66476007)(66556008)(6246003)(3846002)(316002)(54906003)(71190400001)(71200400001)(6116002)(11346002)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB3150;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MDTdYQc+BHwKa/cqdoF2FpJM5DiM9/eXFcCVVLW16ZEYxzId48QUCjDOqkh+traoUWCTFL+dgGAVxixF8mk7E7Cv+wdbzYnMH7GqnMF+UoF4YmUU+rbXu00OfDz2nIfGsDpM+bhbn84zk6E+4yJjamNaBDv+LlzHxNS28OlHJ+Je1Qf94DGUZK2DXZ3IZ8iJngNu049z2+jR6F/jh67jin5M0rd+HC1wlcFSED1Cpej1Bh4vxVu/HWeGayAKJVCUeOsWVhrxMYV2hiuIEwOTp8yhDJJBX/PjEJym6lYa2oN2bH9fZO7QitQv77XHfLlF7fAGGFaq2R340nOTEStl29PzTvfA7SUAeTJdc/ENvZcKTJvCbLRwLTJmDyHaVIvsn5+JYJ6sqN25BSUpvgj8GN70Su4WgF3Kh9omd8D2BzOCdfGZDPpvKM7opCEYSstY
x-ms-exchange-transport-forked: True
Content-ID: <6C47604798A0EE4590B9A5B0D8648078@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26bc7bbd-9a03-428c-00e7-08d7729f0bcf
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2019 18:32:52.3654 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +aFM2d8HIZNy89vk+j9Ql1oQsj0Lgws3lP8iMTJfzq0CEJaE/DyLFHIzyOS+mg2q2DIEQ+E8UqDBykSfZje66Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB3150
X-Mailman-Approved-At: Wed, 27 Nov 2019 08:09:16 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7rDOzb8k+N+Ym+e13r96+vmlOly7JOx3j54MWXEWSE0=;
 b=F+Ty2ZOR0lAwlhEEZsNlcmUDEyTD9vQV8I4gYPvtv8xEys0d/93Km5ZxamsMhJLX6ILGHlMYhtJcBBQuxXOOjkJ5OzEKwOmOITn8HXdYwXnhFay/wuhcFDF/T+au0rnfLYMKxu9mtcL5E8EYNTeDPrVfYvZ+a082kh/f9JqUpUA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
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
 "sanjay.k.kumar@intel.com" <sanjay.k.kumar@intel.com>,
 "sudeep.dutt@intel.com" <sudeep.dutt@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dave.hansen@intel.com" <dave.hansen@intel.com>,
 "jon.bloomfield@intel.com" <jon.bloomfield@intel.com>,
 "daniel.vetter@intel.com" <daniel.vetter@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 "ira.weiny@intel.com" <ira.weiny@intel.com>,
 "dan.j.williams@intel.com" <dan.j.williams@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMjUsIDIwMTkgYXQgMTE6MzM6MjdBTSAtMDUwMCwgSmVyb21lIEdsaXNzZSB3
cm90ZToKPiBPbiBGcmksIE5vdiAyMiwgMjAxOSBhdCAxMTozMzoxMlBNICswMDAwLCBKYXNvbiBH
dW50aG9ycGUgd3JvdGU6Cj4gPiBPbiBGcmksIE5vdiAyMiwgMjAxOSBhdCAxMjo1NzoyN1BNIC0w
ODAwLCBOaXJhbmphbmEgVmlzaHdhbmF0aGFwdXJhIHdyb3RlOgo+IAo+IFsuLi5dCj4gCj4gPiA+
ICtzdGF0aWMgaW50Cj4gPiA+ICtpOTE1X3JhbmdlX2ZhdWx0KHN0cnVjdCBpOTE1X3N2bSAqc3Zt
LCBzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSkKPiA+ID4gK3sKPiA+ID4gKwlsb25nIHJldDsKPiA+
ID4gKwo+ID4gPiArCXJhbmdlLT5kZWZhdWx0X2ZsYWdzID0gMDsKPiA+ID4gKwlyYW5nZS0+cGZu
X2ZsYWdzX21hc2sgPSAtMVVMOwo+ID4gPiArCj4gPiA+ICsJcmV0ID0gaG1tX3JhbmdlX3JlZ2lz
dGVyKHJhbmdlLCAmc3ZtLT5taXJyb3IpOwo+ID4gPiArCWlmIChyZXQpIHsKPiA+ID4gKwkJdXBf
cmVhZCgmc3ZtLT5tbS0+bW1hcF9zZW0pOwo+ID4gPiArCQlyZXR1cm4gKGludClyZXQ7Cj4gPiA+
ICsJfQo+ID4gCj4gPiAKPiA+IFVzaW5nIGEgdGVtcG9yYXJ5IHJhbmdlIGlzIHRoZSBwYXR0ZXJu
IGZyb20gbm91dmVhdSwgaXMgaXQgcmVhbGx5Cj4gPiBuZWNlc3NhcnkgaW4gdGhpcyBkcml2ZXI/
Cj4gCj4gSnVzdCB0byBjb21tZW50IG9uIHRoaXMsIGZvciBHUFUgdGhlIHVzYWdlIG1vZGVsIGlz
IG5vdCBhcHBsaWNhdGlvbgo+IHJlZ2lzdGVyIHJhbmdlIG9mIHZpcnR1YWwgYWRkcmVzcyBpdCB3
YW50cyB0byB1c2UuIEl0IGlzIEdQVSBjYW4KPiBhY2Nlc3MgX2FueV8gQ1BVIHZhbGlkIGFkZHJl
c3MganVzdCBsaWtlIHRoZSBDUFUgd291bGQgKG1vZHVsbyBtbWFwCj4gb2YgZGV2aWNlIGZpbGUp
Lgo+IAo+IFRoaXMgaXMgYmVjYXVzZSB0aGUgQVBJIHlvdSB3YW50IGluIHVzZXJzcGFjZSBpcyBh
cHBsaWNhdGlvbiBwYXNzaW5nCj4gcmFuZG9tIHBvaW50ZXIgdG8gdGhlIEdQVSBhbmQgR1BVIGJl
aW5nIGFibGUgdG8gY2hhc2UgZG93biBhbnkga2luZAo+IG9mIHJhbmRvbSBwb2ludGVyIGNoYWlu
IChhc3N1bWluZyBhbGwgdmFsaWQgaWUgcG9pbnRpbmcgdG8gdmFsaWQKPiB2aXJ0dWFsIGFkZHJl
c3MgZm9yIHRoZSBwcm9jZXNzKS4KPiAKPiBUaGlzIGlzIHVubGlrZSB0aGUgUkRNQSBjYXNlLgoK
Tm8sIFJETUEgaGFzIHRoZSBmdWxsIGFkZHJlc3Mgc3BhY2Ugb3B0aW9uIGFzIHdlbGwsIGl0IGlz
IGNhbGxlZAonaW1wbGljaXQgT0RQJwoKVGhpcyBpcyBpbXBsZW1lbnRlZCBieSByZWdpc3Rlcmlu
ZyByYW5nZXMgYXQgYSBsZXZlbCBpbiBvdXIgcGFnZQp0YWJsZSAoY3VycmVudGx5IDUxMkcpIHdo
ZW5ldmVyIHRoYXQgbGV2ZWwgaGFzIHBvcHVsYXRlZCBwYWdlcyBiZWxvdwppdC4KCkkgdGhpbmsg
aXMgYSBiZXR0ZXIgc3RyYXRlZ3kgdGhhbiB0ZW1wb3JhcnkgcmFuZ2VzLgoKQnV0IG90aGVyIEdQ
VSBkcml2ZXJzIGxpa2UgQU1EIGFyZSB1c2luZyBCTyBhbmQgVFRNIG9iamVjdHMgd2l0aCBmaXhl
ZApWQSByYW5nZXMgYW5kIHRoZSByYW5nZSBpcyB0aWVkIHRvIHRoZSBCTy9UVE0uCgpJJ20gbm90
IHN1cmUgaWYgdGhpcyBpOTE1IHVzYWdlIGlzIGNsb3NlciB0byBBTUQgb3IgY2xvc2VyIHRvIG5v
dXZlYXUuCgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
