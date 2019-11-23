Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDEB1089BC
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 09:08:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5AB58935A;
	Mon, 25 Nov 2019 08:07:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80082.outbound.protection.outlook.com [40.107.8.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E556E072;
 Sat, 23 Nov 2019 23:53:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=POeBndd0jzb2ncX2T2epWiLlK1UGncVUB5bJq9B0CRAEy0EbN1RC30/QyWn6GGjHYB278EsID2fhPBLtbHe0u9B+0j0VNuOrvyVX3SnRo3PnhogSPbJG1pHFYIZc/c/ZbI10JNk1zlMHwih9MI155BWIbUl96nZfJiVlInuOLASwq2F3al0pbYQ+cTJ2EPYJulA4ngKmh/BegGjZu2mnkqiKRPF850C6ClUBP3MSjEpdPjEBTgJ68b+TPSwCEOmJynJ/rP3aA1FeYlZ+TThsNyGcU+6wGviJv+mLRhyAAD8lxORD8J3XxRTeJQC85E1bVh5mLq1TOkZE6LIY24GQ4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hbk7ls38/lZb27netxf3XnpCen2gm9GPFrIkQOoiSzQ=;
 b=l3/NErwABKoMvvvNv8ZxK0t6LPh84W07ELi6BylXr3i+KhoM1AdMPmWzBrKM3i/a/JjIGZsDoWgsMac0RxFfUvOOzvzBCM8bCbmez5JY9nbt+WztHCKLCJJ4Yubj0AiHanP7c4l0W0GWJ5qmV9d4PANPybVRkX2/65WNQF6dsQsNLxlEunbhu3qB8OKmoFy38ProKC1ezvyl8gV4CQghcuTsqR90dkUw4vhBnwJDhMIHFYC7Ax7Qu45J7DRIElDJVrOrLEHZScbSa8OkFQTCesh+WpPBkbjWDBPjxtEIvbsavEyKesSuP+RLgk9PPIn8Q6CTlYFuE4nJ5dBAtUogBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB5358.eurprd05.prod.outlook.com (20.178.10.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.19; Sat, 23 Nov 2019 23:53:52 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d%5]) with mapi id 15.20.2474.022; Sat, 23 Nov 2019
 23:53:52 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Niranjan Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: Re: [RFC 06/13] drm/i915/svm: Page table mirroring support
Thread-Topic: [RFC 06/13] drm/i915/svm: Page table mirroring support
Thread-Index: AQHVoXkU4+8qDaOXOUCsq1WAd1fqfqeX13IAgABW8ACAAUErAA==
Date: Sat, 23 Nov 2019 23:53:52 +0000
Message-ID: <20191123235348.GD7481@mellanox.com>
References: <20191122205734.15925-1-niranjana.vishwanathapura@intel.com>
 <20191122205734.15925-7-niranjana.vishwanathapura@intel.com>
 <20191122233308.GA7481@mellanox.com>
 <20191123044417.GE14488@nvishwa1-DESK.sc.intel.com>
In-Reply-To: <20191123044417.GE14488@nvishwa1-DESK.sc.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BL0PR01CA0019.prod.exchangelabs.com (2603:10b6:208:71::32)
 To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.162.113.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 753e0e26-557a-4ef7-918a-08d77070646c
x-ms-traffictypediagnostic: VI1PR05MB5358:
x-microsoft-antispam-prvs: <VI1PR05MB53589F49B3AEACDC59FE4717CF480@VI1PR05MB5358.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0230B09AC4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(396003)(39850400004)(366004)(376002)(189003)(199004)(66066001)(316002)(386003)(66946007)(102836004)(66476007)(66556008)(64756008)(66446008)(25786009)(81166006)(86362001)(2906002)(2616005)(6506007)(6116002)(3846002)(186003)(52116002)(54906003)(478600001)(6246003)(33656002)(36756003)(6916009)(229853002)(14454004)(76176011)(1076003)(99286004)(4326008)(6486002)(71200400001)(6436002)(6512007)(5660300002)(305945005)(7736002)(8936002)(14444005)(446003)(81156014)(11346002)(7416002)(8676002)(26005)(256004)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB5358;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: =?us-ascii?Q?SokewDMdzOVc/Qh2i1Bd+mK6ubKu4W2eizkwRWibBD3nd6+FpzyLcGSqG+6W?=
 =?us-ascii?Q?LA+cQxDmytrdmXQ53RF82lxcAVrc9QYrat6l0bDnNZKie8DAGus5QJpVTmz/?=
 =?us-ascii?Q?PdqQwN+g562ReIaKEXGav/Xtpj89wE3BlvhPqQ9x3VTzSXyI6qe5qxCkIHVm?=
 =?us-ascii?Q?JpfGo/3sr6y+WNTNPu8NYXRziMyALQ+IcX/iLlbUv52nJyqshM+DiSekLM1s?=
 =?us-ascii?Q?ancuuO/kr8dmj8wib59X/lMOj4SNteD40A0tBrKckRl+RRwqJHfirEtZ0w0q?=
 =?us-ascii?Q?7RihTq/K+1gQFlJ1D9OFXYMz5NEY2bnuVbTETCRi1we2oMHju+fD9FGGSmkO?=
 =?us-ascii?Q?DtrbcbJ+pNTU91lSB+qSflniWVCsanhnYRM5Mth1jdN18ewcCfQnXaZHfwrV?=
 =?us-ascii?Q?fwvDIYb+peKZi0+434siD3cq+Y8CxICpHNy+JuDkATKNLOpJnsWqr4wEmpT0?=
 =?us-ascii?Q?fBb02GLDDKGa7bOoC31o+MnGy/5SgYcO5QlxGUv4Ocm+wC0sOP52HZCQJ1yQ?=
 =?us-ascii?Q?Hd8nIazH3kOZ6p/REHgPuLXPD+qPvW0vcp5cGQpiOif6ab90SmfR4g9ayH8V?=
 =?us-ascii?Q?x3S/fZ/JOPrHTdl4InwpWLDRx9t2Cev78IZuE27bVtYv5tCVQ4uauWZN1PP7?=
 =?us-ascii?Q?gQbH+hA+QrSTnz5WiiM+m2GcHI/d0gXrROl9/ZSga8/HkI8epeaq3Mq7BREt?=
 =?us-ascii?Q?/eIIj7omlzrZIsKk/Jo2Qc9BcfOjU8I0/tkBE3RLZ1kIpkwlTp3jkwEELNHN?=
 =?us-ascii?Q?uh6UX8+cF10YLK4IIPi8M+VfyJdaDgargt/Xv4EreImoYSrYeKVxNKLZjR2k?=
 =?us-ascii?Q?5xLL1DmUjK5vEXqia9oW082RpO+wD7/oDPEE6CosW85xGPwww1HREdcDkevd?=
 =?us-ascii?Q?+1fCEqUA+xCBCIdCN2eo70iCgT2kbykTWS9VQXmzcM/Cfx7TAnMKV4vtyT1F?=
 =?us-ascii?Q?gHF3paG/UeVk9NLL1oO25vAE9IHes2/Wy09TUzaU+HKsWfEyDCR0BKsot8k2?=
 =?us-ascii?Q?NmZ39jU4NTC7iaqHoaYufA7vcO71m5FJZHgz5pUh1aS59ovbchbTYuwpp06E?=
 =?us-ascii?Q?dTYSYmBJELl8hivBXKkNfNKgirQnsyQhAUok7n8AuaGo7BIr6m6o6LWmL0ss?=
 =?us-ascii?Q?mJZbtZmhGTv4nJAlw2a5AZJe718F9OWm7V/Zg0eS8z0E9ZDAGseq6Wil0W+w?=
 =?us-ascii?Q?6/SSyypM9+/K5Ahf9e/E8Tmj03vrWgRMs7BwwTrp1kKaehJUZjcqWKCwv1YH?=
 =?us-ascii?Q?xPYceNOsaROx0wMWY7OpacdqDGDyyL3RMfu0SllNVJJkr/i4NExorUeEwLdd?=
 =?us-ascii?Q?8lXlGbU+WFUHUl7Bmbfsv/SxBv+LD17udinEvlJw3J4XYs+wxu8YJdByocA2?=
 =?us-ascii?Q?YrT7W2kHfaT3Tnoe8sqPdr7u99NCZSqnpr17ZqAIk8MV4HtnEtbO6lCwfq6+?=
 =?us-ascii?Q?2gI9p+8z0ehRa+U/z7UZphSnpoG33dfQOHwHKh8SZFmXVvSHNLZmgs2kf31X?=
 =?us-ascii?Q?JNfsNf5v4QMnLDiBKWLeYThSRsHno/DDQBw1OIdM8CrSilbXwD/1wlVnIts2?=
 =?us-ascii?Q?dnLlJJQqvcyeeoy9/SpyKpGR48ZVzvmsWL03YKUAa2a4jmBNKd1lf0TRWeo6?=
 =?us-ascii?Q?45saWQNVRkdImW94h5lxpvRlkJwLfFNiCr6WwgoLOkDkugmH8T8QnozRmOJY?=
 =?us-ascii?Q?l2vWlqX9mQXxddcnOSp9QDuL67GLedgjTJ9CwiRbauszcMMXbTdC+kJ4ebvK?=
 =?us-ascii?Q?ZBhQHu3ltUzPQd+hwbU6nbZA9PvZjYs=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <EFA0C1D835708348BF4267C1D17DA68C@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 753e0e26-557a-4ef7-918a-08d77070646c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2019 23:53:52.2077 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g6U06mDcBxfx+x9XeVx+qVfy/iPHNK2B9TcRJ15CLhpFwZ3hyKif1rnJj8uHIAfv6/TFeCjJsOCTjzmtGhKXSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5358
X-Mailman-Approved-At: Mon, 25 Nov 2019 08:07:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hbk7ls38/lZb27netxf3XnpCen2gm9GPFrIkQOoiSzQ=;
 b=L/6WaAlRjLIZjlmAzQLPiUVzF33LWpPr5PXfjckiPkEEQt4vYLmaALJkdGkaVrDDV0m03SnZN4IIY928gVzdSME9V2lzyFKpP0t5v0s20oTR9KaY1xvt5Hw0SYWmajdeYbWhAh3+CJlwkGG1NuKGUAXaydP9CVacH9lrv00Hh/I=
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
 "jglisse@redhat.com" <jglisse@redhat.com>,
 "jon.bloomfield@intel.com" <jon.bloomfield@intel.com>,
 "daniel.vetter@intel.com" <daniel.vetter@intel.com>,
 "dan.j.williams@intel.com" <dan.j.williams@intel.com>,
 "ira.weiny@intel.com" <ira.weiny@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjIsIDIwMTkgYXQgMDg6NDQ6MThQTSAtMDgwMCwgTmlyYW5qYW4gVmlzaHdh
bmF0aGFwdXJhIHdyb3RlOgo+IE9uIEZyaSwgTm92IDIyLCAyMDE5IGF0IDExOjMzOjEyUE0gKzAw
MDAsIEphc29uIEd1bnRob3JwZSB3cm90ZToKPiA+IE9uIEZyaSwgTm92IDIyLCAyMDE5IGF0IDEy
OjU3OjI3UE0gLTA4MDAsIE5pcmFuamFuYSBWaXNod2FuYXRoYXB1cmEgd3JvdGU6Cj4gPiAKPiA+
ID4gK3N0YXRpYyBpbmxpbmUgYm9vbAo+ID4gPiAraTkxNV9yYW5nZV9kb25lKHN0cnVjdCBobW1f
cmFuZ2UgKnJhbmdlKQo+ID4gPiArewo+ID4gPiArCWJvb2wgcmV0ID0gaG1tX3JhbmdlX3ZhbGlk
KHJhbmdlKTsKPiA+ID4gKwo+ID4gPiArCWhtbV9yYW5nZV91bnJlZ2lzdGVyKHJhbmdlKTsKPiA+
ID4gKwlyZXR1cm4gcmV0Owo+ID4gPiArfQo+ID4gCj4gPiBUaGlzIG5lZWRzIHRvIGJlIHVwZGF0
ZWQgdG8gZm9sbG93IHRoZSBuZXcgQVBJLCBidXQgdGhpcyBwYXR0ZXJuIGlzCj4gPiBnZW5lcmFs
bHkgd3JvbmcsIGZhaWx1cmUgaWYgaG1tX3JhbmdlX3ZhbGlkIHNob3VsZCByZXRyeSB0aGUKPiA+
IHJhbmdlX2ZhdWx0IGFuZCBzbyBmb3J0aC4gU2VlIHRoZSBobW0ucnN0Lgo+ID4gCj4gCj4gVGhh
bmtzIEphc29uIGZvciB0aGUgZmVlZGJhY2suCj4gWWFoLCB3aWxsIHVwZGF0ZSBhcyBwZXIgbmV3
IEFQSSBpbiB0aGUgbmV4dCByZXZpc2lvbi4KPiBUaGUgY2FsbGVyIG9mIHRoaXMgZnVuY3Rpb24g
aXMgaW5kZWVkIHJldHJ5aW5nIGlmIHRoZSByYW5nZSBpcyBub3QgdmFsaWQuCj4gQnV0IEkgZ290
IHRoZSBwb2ludC4gSSBtYWRlIGNoYW5nZXMgaW4gbXkgbG9jYWwgYnVpbGQgYXMgcGVyIGhtbS5y
c3QKPiBhbmQgaXQgaXMgd29ya2luZyBmaW5lLiBXaWxsIGluY2x1ZGUgdGhlIGNoYW5nZSBpbiBu
ZXh0IHJldmlzaW9uLgoKR2VuZXJhbGx5IHNwZWFraW5nIHRoaXMgbG9ja2luZyBhcHByb2FjaCBp
cyBhIGxpdmUtbG9ja2FibGUKY29sbGlzaW9uLXJldHJ5IHNjaGVtZS4gCgpGb3IgbWFpbnRhaW5h
YmlsaXR5IGl0IGlzIGJlc3QgaWYgdGhlIHJldHJ5IGxvb3AgaXMgZXhwbGljaXQgYW5kCmRvZXNu
J3QgdW5yZWdpc3RlciB0aGUgcmFuZ2UgZHVyaW5nIHRoZSByZXRyeS4gSSBhbHNvIGVuY291cmFn
ZSBhZGRpbmcKYW4gYWJzb2x1dGUgdGltZSBib3VuZCB0byB0aGUgcmV0cnkgYXMgaXQgKmNvdWxk
KiBsaXZlIGxvY2suCgo+ID4gPiArc3RhdGljIGludAo+ID4gPiAraTkxNV9yYW5nZV9mYXVsdChz
dHJ1Y3QgaTkxNV9zdm0gKnN2bSwgc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UpCj4gPiA+ICt7Cj4g
PiA+ICsJbG9uZyByZXQ7Cj4gPiA+ICsKPiA+ID4gKwlyYW5nZS0+ZGVmYXVsdF9mbGFncyA9IDA7
Cj4gPiA+ICsJcmFuZ2UtPnBmbl9mbGFnc19tYXNrID0gLTFVTDsKPiA+ID4gKwo+ID4gPiArCXJl
dCA9IGhtbV9yYW5nZV9yZWdpc3RlcihyYW5nZSwgJnN2bS0+bWlycm9yKTsKPiA+ID4gKwlpZiAo
cmV0KSB7Cj4gPiA+ICsJCXVwX3JlYWQoJnN2bS0+bW0tPm1tYXBfc2VtKTsKPiA+ID4gKwkJcmV0
dXJuIChpbnQpcmV0Owo+ID4gPiArCX0KPiA+IAo+ID4gCj4gPiBVc2luZyBhIHRlbXBvcmFyeSBy
YW5nZSBpcyB0aGUgcGF0dGVybiBmcm9tIG5vdXZlYXUsIGlzIGl0IHJlYWxseQo+ID4gbmVjZXNz
YXJ5IGluIHRoaXMgZHJpdmVyPwo+IAo+IFlhaCwgbm90IHJlcXVpcmVkLiBJbiBteSBsb2NhbCBi
dWlsZCBJIHRyaWVkIHdpdGggcHJvcGVyIGRlZmF1bHRfZmxhZ3MKPiBhbmQgc2V0IHBmbl9mbGFn
c19tYXNrIHRvIDAgYW5kIGl0IGlzIHdvcmtpbmcgZmluZS4KClNvcnJ5LCBJIG1lbnQgY2FsbGlu
ZyBobW1fcmFuZ2VfcmVnaXN0ZXIgZHVyaW5nIGZhdWx0IHByb2Nlc3NpbmcuCgpJZiB5b3VyIGRy
aXZlciB3b3JrcyBhcm91bmQgdXNlciBzcGFjZSBvYmplY3RzIHRoYXQgY292ZXIgYSBWQSB0aGVu
CnRoZSByYW5nZSBzaG91bGQgYmUgY3JlYXRlZCB3aGVuIHRoZSBvYmplY3QgaXMgY3JlYXRlZC4K
Cj4gPiA+ICsJLyoKPiA+ID4gKwkgKiBObyBuZWVkZCB0byBkbWEgbWFwIHRoZSBob3N0IHBhZ2Vz
IGFuZCBsYXRlciB1bm1hcCBpdCwgYXMKPiA+ID4gKwkgKiBHUFUgaXMgbm90IGFsbG93ZWQgdG8g
YWNjZXNzIGl0IHdpdGggU1ZNLiBIZW5jZSwgbm8gbmVlZAo+ID4gPiArCSAqIG9mIGFueSBpbnRl
cm1lZGlhdGUgZGF0YSBzdHJ1Y3V0cmUgdG8gaG9sZCB0aGUgbWFwcGluZ3MuCj4gPiA+ICsJICov
Cj4gPiA+ICsJZm9yIChpID0gMDsgaSA8IG5wYWdlczsgaSsrKSB7Cj4gPiA+ICsJCXU2NCBhZGRy
ID0gcmFuZ2UtPnBmbnNbaV0gJiB+KCgxVUwgPDwgcmFuZ2UtPnBmbl9zaGlmdCkgLSAxKTsKPiA+
ID4gKwo+ID4gPiArCQlpZiAoc2cgJiYgKGFkZHIgPT0gKHNnX2RtYV9hZGRyZXNzKHNnKSArIHNn
LT5sZW5ndGgpKSkgewo+ID4gPiArCQkJc2ctPmxlbmd0aCArPSBQQUdFX1NJWkU7Cj4gPiA+ICsJ
CQlzZ19kbWFfbGVuKHNnKSArPSBQQUdFX1NJWkU7Cj4gPiA+ICsJCQljb250aW51ZTsKPiA+ID4g
KwkJfQo+ID4gPiArCj4gPiA+ICsJCWlmIChzZykKPiA+ID4gKwkJCXNnX3BhZ2Vfc2l6ZXMgfD0g
c2ctPmxlbmd0aDsKPiA+ID4gKwo+ID4gPiArCQlzZyA9ICBzZyA/IF9fc2dfbmV4dChzZykgOiBz
dC0+c2dsOwo+ID4gPiArCQlzZ19kbWFfYWRkcmVzcyhzZykgPSBhZGRyOwo+ID4gPiArCQlzZ19k
bWFfbGVuKHNnKSA9IFBBR0VfU0laRTsKPiA+ID4gKwkJc2ctPmxlbmd0aCA9IFBBR0VfU0laRTsK
PiA+ID4gKwkJc3QtPm5lbnRzKys7Cj4gPiAKPiA+IEl0IGlzIG9kZCB0byBidWlsZCB0aGUgcmFu
Z2UgaW50byBhIHNnbC4KPiA+IAo+ID4gSU1ITyBpdCBpcyBub3QgYSBnb29kIGlkZWEgdG8gdXNl
IHRoZSBzZ19kbWFfYWRkcmVzcyBsaWtlIHRoaXMsIHRoYXQKPiA+IHNob3VsZCBvbmx5IGJlIGZp
bGxlZCBpbiBieSBhIGRtYSBtYXAuIFdoZXJlIGRvZXMgaXQgZW5kIHVwIGJlaW5nCj4gPiB1c2Vk
Pwo+IAo+IFRoZSBzZ2wgaXMgdXNlZCB0byBwbHVnIGludG8gdGhlIHBhZ2UgdGFibGUgdXBkYXRl
IGZ1bmN0aW9uIGluIGk5MTUuCj4gCj4gRm9yIHRoZSBkZXZpY2UgbWVtb3J5IGluIGRpc2NyZXRl
IGNhcmQsIHdlIGRvbid0IG5lZWQgZG1hIG1hcCB3aGljaAo+IGlzIHRoZSBjYXNlIGhlcmUuCgpI
b3cgZGlkIHdlIGdldCB0byBkZXZpY2UgbWVtb3J5IG9uIGEgY2FyZD8gSXNuJ3QgcmFuZ2UtPnBm
bnMgYSBDUFUgUEZOCmF0IHRoaXMgcG9pbnQ/CgpJJ20gY29uZnVzZWQuCgo+ID4gPiAraW50IGk5
MTVfc3ZtX2JpbmRfbW0oc3RydWN0IGk5MTVfYWRkcmVzc19zcGFjZSAqdm0pCj4gPiA+ICt7Cj4g
PiA+ICsJc3RydWN0IGk5MTVfc3ZtICpzdm07Cj4gPiA+ICsJc3RydWN0IG1tX3N0cnVjdCAqbW07
Cj4gPiA+ICsJaW50IHJldCA9IDA7Cj4gPiA+ICsKPiA+ID4gKwltbSA9IGdldF90YXNrX21tKGN1
cnJlbnQpOwo+ID4gCj4gPiBJIGRvbid0IHRoaW5rIHRoZSBnZXRfdGFza19tbShjdXJyZW50KSBp
cyBuZWVkZWQsIHRoZSBtbWdldCBpcyBhbHJlYWR5Cj4gPiBkb25lIGZvciBjdXJyZW50LT5tbSA/
Cj4gCj4gTm8sIEkgZG9uJ3QgdGhpbmsgbW1nZXQgaXMgYWxyZWFkeSBkb25lIGZvciBjdXJyZW50
LT5tbSBoZXJlLgoKSSdtIG5vdCBjZXJ0YWluLCBidXQgSSB0aG91Z2h0IGl0IGlzIGFscmVhZHkg
ZG9uZSBiZWNhdXNlIGl0IGlzCidjdXJyZW50JyBhbmQgY3VycmVudCBjYW5ub3QgYmVnaW4gdG8g
ZGVzdHJveSB0aGUgbW0gd2hpbGUgYSBzeXNjYWxsCmlzIGN1cnJlbnRseSBydW5uaW5nLgoKSmFz
b24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
