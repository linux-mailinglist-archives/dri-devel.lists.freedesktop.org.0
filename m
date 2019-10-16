Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 835AADCE30
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 20:38:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97D986EB93;
	Fri, 18 Oct 2019 18:37:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40080.outbound.protection.outlook.com [40.107.4.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6F016E179;
 Wed, 16 Oct 2019 16:04:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RzuIfoGaL1j/JMrNil1i9ISpl2mr2uAI8Q8Wz69rLEcEC4A2r2ciHJFnQblfdV4IBPGFzwlJ+xidcXBaruR7nlma6SHe2VRG4PT0Shqy8GAQR2SZ0+91dI0Dh1jyTIFCWnU5CFMTBaYWe6EismyWXdvL5f9/GM6EBPsOrMG9MxfVv21qjQyJB/Twpa7ujHU72kc3msd6Vb2oguxbYT2VVcT2qwfCwTvglntMZ5LtaWthUCMIeebnP+2QMj7oLRj7QRGglZHt0C9RAQI1/uk7AWbtlgsQCVUlHXZGnsmz68NNjQ9+B57I6kbq4aJSeoXa6RrpzIT5c3SXs2oEIWvWkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mFFo6Pqk7n93LD0W2nkF3e2OreqyOEsb7nWMJwGVm90=;
 b=KbIaKaTSX/4YvCPKPKtbflKmc9X5gMrT32aXl1kTrnnLPiUuuA/iEO+AOm0Ju9s2YF4Qedkgg95YIwUsQp0yZu6n1+n+An5ljUlHoRrDOwXPkLhBxsszMBmmRE0txTBqLl5HAkbQe5NdUVqy+EqBi6IbRx2MSPS/bllREJf8btt2v4QLy/J3iDNgcdV0LsY4q7wX0RSQbnIXqDMdwCgz5rFNUSho3Ok1nz1pggidkPB+3qxr9TEF3fC4iG+qH3edNGTGqYRlvCUydabmaXm85qqvPmHp/7SrCxSKjatw2ppm3GCJaUaADIzYe/HFI7CzD978iKGXAOhF3HxIv9ni5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB5119.eurprd05.prod.outlook.com (20.178.9.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.23; Wed, 16 Oct 2019 16:04:52 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::75ae:b00b:69d8:3db0]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::75ae:b00b:69d8:3db0%7]) with mapi id 15.20.2347.023; Wed, 16 Oct 2019
 16:04:52 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: "christian.koenig@amd.com" <christian.koenig@amd.com>
Subject: Re: [PATCH hmm 00/15] Consolidate the mmu notifier interval_tree and
 locking
Thread-Topic: [PATCH hmm 00/15] Consolidate the mmu notifier interval_tree and
 locking
Thread-Index: AQHVg4Sqa7CCxCToXEeTrrYAqVQVhqdc+JgAgAB3OAA=
Date: Wed, 16 Oct 2019 16:04:52 +0000
Message-ID: <20191016160444.GB3430@mellanox.com>
References: <20191015181242.8343-1-jgg@ziepe.ca>
 <bc954d29-388b-9e29-f960-115ccc6b9fea@gmail.com>
In-Reply-To: <bc954d29-388b-9e29-f960-115ccc6b9fea@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MW2PR16CA0021.namprd16.prod.outlook.com (2603:10b6:907::34)
 To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [66.51.117.131]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4df213f4-4dad-4f75-c7fb-08d7525293e9
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: VI1PR05MB5119:
x-microsoft-antispam-prvs: <VI1PR05MB5119C6F0423043C996CEB0FACF920@VI1PR05MB5119.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 0192E812EC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(39860400002)(396003)(366004)(136003)(199004)(189003)(36756003)(476003)(486006)(11346002)(2616005)(6246003)(86362001)(26005)(186003)(6512007)(6436002)(446003)(2351001)(316002)(66556008)(66476007)(66574012)(14454004)(6486002)(66446008)(66946007)(64756008)(102836004)(54906003)(5660300002)(2501003)(8676002)(7416002)(33656002)(3846002)(6116002)(6916009)(66066001)(256004)(81166006)(81156014)(25786009)(8936002)(14444005)(478600001)(229853002)(386003)(6506007)(1076003)(52116002)(4326008)(99286004)(7736002)(5640700003)(76176011)(305945005)(2906002)(71190400001)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB5119;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 457yt0h+X0nKCa1mPWC4ptKeBRIm+WBZQ51Qc+UNT0aOdwd3+oNwh0cJlFgct0FfYYJCwjUn1P/6dg1Q68OrkLa6B62TLOH9HhG7+0DTq+DvKymMYGVtouyDNTR8gjCRb3ccuPJs8QGhOlGCGJnpvi/6buPCX0o4icLQ2S9s/3gk98h5H0A83I1BMh3Og8OiTWgHOdECw9xqwHbijXQ61VcPOaaN9rNhNAAc/cAxxscWgsVPM28rAPe2LziMl9ut9Ott8WyuRBZM4TH1pFT/M/dR3FSIIKBh86sB/4i1ZjMwsnrsAhHRTW3kvcGi7IgAF6BQfPBK7X7i1dgPnBSp9/y7NMwaePZ5LHUNv3icwz0mLnDOw3owt0i2Mmn3vAiCr91tegtutIc8EYbQxwIRx/IDTYoI+pE2EzlPrYSRx8Q=
x-ms-exchange-transport-forked: True
Content-ID: <C331C18EA8FE984182031D276F4CB814@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4df213f4-4dad-4f75-c7fb-08d7525293e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2019 16:04:52.3049 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i8XhOdgE2FeTs+Odb8R9DqauLi4GfQBRGryerXJdlOOeW4w+Eit3tD7R39rpt8gnvlvk6IfwLqQMWwefEhd9yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5119
X-Mailman-Approved-At: Fri, 18 Oct 2019 18:37:46 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mFFo6Pqk7n93LD0W2nkF3e2OreqyOEsb7nWMJwGVm90=;
 b=OimHIm6o+fTql5BM9INlm8EqaBUeNCrXN/BbEZ4K0p6P075Fs2Fobu/wOofogHJDORXdaeHW/fxsOV/FDdeV8ghL4KPN70i6nzG7jRXZX76qN7umDqUcJCtlx/cRgNOMSWX8pjbh4lQRNeBCAqpdk9HFauNKCzTOwBo9NYM9voU=
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jerome Glisse <jglisse@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMTYsIDIwMTkgYXQgMTA6NTg6MDJBTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToNCj4gQW0gMTUuMTAuMTkgdW0gMjA6MTIgc2NocmllYiBKYXNvbiBHdW50aG9ycGU6
DQo+ID4gRnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPg0KPiA+IA0KPiA+
IDggb2YgdGhlIG1tdV9ub3RpZmllciB1c2luZyBkcml2ZXJzIChpOTE1X2dlbSwgcmFkZW9uX21u
LCB1bWVtX29kcCwgaGZpMSwNCj4gPiBzY2lmX2RtYSwgdmhvc3QsIGdudGRldiwgaG1tKSBkcml2
ZXJzIGFyZSB1c2luZyBhIGNvbW1vbiBwYXR0ZXJuIHdoZXJlDQo+ID4gdGhleSBvbmx5IHVzZSBp
bnZhbGlkYXRlX3JhbmdlX3N0YXJ0L2VuZCBhbmQgaW1tZWRpYXRlbHkgY2hlY2sgdGhlDQo+ID4g
aW52YWxpZGF0aW5nIHJhbmdlIGFnYWluc3Qgc29tZSBkcml2ZXIgZGF0YSBzdHJ1Y3R1cmUgdG8g
dGVsbCBpZiB0aGUNCj4gPiBkcml2ZXIgaXMgaW50ZXJlc3RlZC4gSGFsZiBvZiB0aGVtIHVzZSBh
biBpbnRlcnZhbF90cmVlLCB0aGUgb3RoZXJzIGFyZQ0KPiA+IHNpbXBsZSBsaW5lYXIgc2VhcmNo
IGxpc3RzLg0KPiA+IA0KPiA+IE9mIHRoZSBvbmVzIEkgY2hlY2tlZCB0aGV5IGxhcmdlbHkgc2Vl
bSB0byBoYXZlIHZhcmlvdXMga2luZHMgb2YgcmFjZXMsDQo+ID4gYnVncyBhbmQgcG9vciBpbXBs
ZW1lbnRhdGlvbi4gVGhpcyBpcyBhIHJlc3VsdCBvZiB0aGUgY29tcGxleGl0eSBpbiBob3cNCj4g
PiB0aGUgbm90aWZpZXIgaW50ZXJhY3RzIHdpdGggZ2V0X3VzZXJfcGFnZXMoKS4gSXQgaXMgZXh0
cmVtZWx5IGRpZmZpY3VsdCB0bw0KPiA+IHVzZSBpdCBjb3JyZWN0bHkuDQo+ID4gDQo+ID4gQ29u
c29saWRhdGUgYWxsIG9mIHRoaXMgY29kZSB0b2dldGhlciBpbnRvIHRoZSBjb3JlIG1tdV9ub3Rp
ZmllciBhbmQNCj4gPiBwcm92aWRlIGEgbG9ja2luZyBzY2hlbWUgc2ltaWxhciB0byBobW1fbWly
cm9yIHRoYXQgYWxsb3dzIHRoZSB1c2VyIHRvDQo+ID4gc2FmZWx5IHVzZSBnZXRfdXNlcl9wYWdl
cygpIGFuZCByZWxpYWJseSBrbm93IGlmIHRoZSBwYWdlIGxpc3Qgc3RpbGwNCj4gPiBtYXRjaGVz
IHRoZSBtbS4NCj4gDQo+IFRoYXQgc291bmRzIHJlYWxseSBnb29kLCBidXQgY291bGQgeW91IG91
dGxpbmUgZm9yIGEgbW9tZW50IGhvdyB0aGF0IGlzDQo+IGFyY2hpdmVkPw0KDQpJdCB1c2VzIHRo
ZSBzYW1lIGJhc2ljIHNjaGVtZSBhcyBobW0gYW5kIHJkbWEgb2RwLCBvdXRsaW5lZCBpbiB0aGUN
CnJldmlzaW9ucyB0byBobW0ucnN0IGxhdGVyIG9uLg0KDQpCYXNpY2FsbHksIA0KDQogc2VxID0g
bW11X3JhbmdlX3JlYWRfYmVnaW4oJm1ybik7DQoNCiAvLyBUaGlzIGlzIGEgc3BlY3VsYXRpdmUg
cmVnaW9uDQogLi4gZ2V0X3VzZXJfcGFnZXMoKS9obW1fcmFuZ2VfZmF1bHQoKSAuLg0KIC8vIFJl
c3VsdCBjYW5ub3QgYmUgZGVyZmVyZW5jZWQNCg0KIHRha2VfbG9jayhkcml2ZXItPnVwZGF0ZSk7
DQogaWYgKG1tdV9yYW5nZV9yZWFkX3JldHJ5KCZtcm4sIHJhbmdlLm5vdGlmaWVyX3NlcSkgew0K
ICAgIC8vIGNvbGxpc2lvbiEgVGhlIHJlc3VsdHMgYXJlIG5vdCBjb3JyZWN0DQogICAgZ290byBh
Z2Fpbg0KIH0NCg0KIC8vIG5vIGNvbGxpc2lvbiwgYW5kIG5vdyB1bmRlciBsb2NrLiBOb3cgd2Ug
Y2FuIGRlLXJlZmVyZW5jZSB0aGUgcGFnZXMvZXRjDQogLy8gcHJvZ3JhbSBIVw0KIC8vIE5vdyB0
aGUgaW52YWxpZGF0ZSBjYWxsYmFjayBpcyByZXNwb25zaWJsZSB0byBzeW5jaHJvbml6ZSBhZ2Fp
bnN0IGNoYW5nZXMNCiB1bmxvY2soZHJpdmVyLT51cGRhdGUpIA0KDQpCYXNpY2FsbHksIGFueXRo
aW5nIHRoYXQgd2FzIHVzaW5nIGhtbV9taXJyb3IgY29ycmVjdGx5IHRyYW5zaXNpb25zDQpvdmVy
IGZhaXJseSB0cml2aWFsbHksIGp1c3Qgd2l0aCB0aGUgbW9kaWZpY2F0aW9uIHRvIHN0b3JlIGEg
c2VxdWVuY2UNCm51bWJlciB0byBjbG9zZSB0aGF0IHJhY2UgZGVzY3JpYmVkIGluIHRoZSBobW0g
Y29tbWl0Lg0KDQpGb3Igc29tZXRoaW5nIGxpa2UgQU1EIGdwdSBJIGV4cGVjdCBpdCB0byB0cmFu
c2l0aW9uIHRvIHVzZSBkbWFfZmVuY2UNCmZyb20gdGhlIG5vdGlmaWVyIGZvciBjb2hlcmVuY3kg
cmlnaHQgYmVmb3JlIGl0IHVubG9ja3MgZHJpdmVyLT51cGRhdGUuDQoNCkphc29uDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
