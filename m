Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9DC1169FC
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 10:47:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D99A76E3AA;
	Mon,  9 Dec 2019 09:47:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30040.outbound.protection.outlook.com [40.107.3.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B5BD6E2ED;
 Sun,  8 Dec 2019 18:23:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=brffZRXycTqbSYNfG8Q9eQTCvlEh0TcFdxegTr7Rm5O6smzoxIozCZokkVf+fD3zim7SsGRYAXznt62jG1Bhnhack0y/mDt+4dM41jALFPTnk440J9u1dYS+e0YCV6Lbovu729Uijy0tYCSMKZKQKKWz7fcmQ3hGrPIw8V5SGH0F5PWUGh2J7MEBPX42kan1U3Y395fQ4DbwUwyOwU0qFDlgh5nxb+JOWJ45GGuVMn7oi2oTAmuArKcgIsWDg6RPiDpA7XfGlQtxLfMS9Zvr7qbdCAJf16osuuk2KPbnsvNiFBnN0+phPrxNDqj3mmoPy8176t0VZ+wdHKA3wBvGog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MLEZhRtYlCD2524M6XL5UaWhaTS0ik60lqYRzL16GMo=;
 b=YZ79ZVqP0ScwjQyR8mLT1O7y9t2EddvGeH6OQ7b3XaNc6bxf3Gas60jOod+0OolpAptCIdYe3lLB3COztDAeScowPVbZsY4YPXRR4ao/wcvn7GsW19s+Q/P0W1tU41DQT5CWkecOflN4x7WICX3bPDubZ4OyljkkEUEOpFR+cfAusNAwjno6TGCRXDetjCUlHdaHceNR4dVAYJD7vFSOPnHnFzmvNqY/beA45dEnw/zGVAtF/j/YiJlQAZ1ZEwbYaJ1xkozM7ZbYsdgBptKEPidxitXO3dcomvzJnAo6WwynWy/xObkZDs1uSfzBZsMLkdXdsPzoGAgWElW24R541A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB6718.eurprd05.prod.outlook.com (10.186.162.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.14; Sun, 8 Dec 2019 18:23:40 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::18df:a0fe:18eb:a96b]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::18df:a0fe:18eb:a96b%6]) with mapi id 15.20.2516.018; Sun, 8 Dec 2019
 18:23:40 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Jerome Glisse <jglisse@redhat.com>
Subject: Re: [RFC 06/13] drm/i915/svm: Page table mirroring support
Thread-Topic: [RFC 06/13] drm/i915/svm: Page table mirroring support
Thread-Index: AQHVoXkU4+8qDaOXOUCsq1WAd1fqfqeX13IAgARBvICAAbOsgIALDW+AgAG8xACABg82AA==
Date: Sun, 8 Dec 2019 18:23:39 +0000
Message-ID: <20191208182336.GC11291@mellanox.com>
References: <20191122205734.15925-1-niranjana.vishwanathapura@intel.com>
 <20191122205734.15925-7-niranjana.vishwanathapura@intel.com>
 <20191122233308.GA7481@mellanox.com> <20191125163327.GA5516@redhat.com>
 <20191126183247.GM7481@mellanox.com>
 <20191203191943.GQ14488@nvishwa1-DESK.sc.intel.com>
 <20191204215136.GA4049@redhat.com>
In-Reply-To: <20191204215136.GA4049@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR17CA0019.namprd17.prod.outlook.com
 (2603:10b6:208:15e::32) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.68.57.212]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 949eeae1-fc52-4245-1d38-08d77c0bbf99
x-ms-traffictypediagnostic: VI1PR05MB6718:
x-microsoft-antispam-prvs: <VI1PR05MB6718A37CCD778321986A53CCCF590@VI1PR05MB6718.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0245702D7B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39850400004)(396003)(376002)(366004)(346002)(136003)(199004)(189003)(2906002)(54906003)(102836004)(99286004)(229853002)(6506007)(52116002)(86362001)(1076003)(305945005)(76176011)(33656002)(5660300002)(186003)(36756003)(6916009)(7416002)(316002)(26005)(64756008)(66446008)(66556008)(66476007)(71200400001)(71190400001)(2616005)(478600001)(8676002)(6512007)(6486002)(4326008)(8936002)(66946007)(81156014)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB6718;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e8I8ZcfasTB0cNyW8py9GAG9ZOC4q49NBL4gS3QOU3uKAahRVeO+LMA7Hwvq+ZXFVNHXVEn2E/nXRgoHJPSKnzbyNLWAiY28r9qE95lQSuNf4Wy0aaSQgAFW2Tz62nu5UegCabCHp8VSYbQX6DzfoUUaUNfa0OiTnORyerFk/ijQqUthggNcEenoioRguXJHLYpxC0+h1VahLk+3UtXGMeL20u9rQtYMtBeGcUECpt5vZTHJxUJ6LmuLTwMD/SHJnCV71ytnl60PTvuq1nHyZbuvP30+9sCMZ6tshWKtoaJV+hFP/KLcVN0csadvsU80s7Obw4zoGUe/FMI+TyL4NqAl6B7V6scfRKQptRNjy9WhO+/IIrrhhODBA5mhIrgAyXUqwryq1/N6HLway6FK5r51Au8jIjw4nVlHPYDtfTZl2CctMzku0p+7MBNVW1Wr
x-ms-exchange-transport-forked: True
Content-ID: <AED4C5E794630741BB5AB7CA2A2E6CF9@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 949eeae1-fc52-4245-1d38-08d77c0bbf99
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2019 18:23:40.0030 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dmaM4IdAaiBEubXYDGHRXCEv9UEsIxrtDlo+SdlByU+uJxY4SVEEa+1bh02Dkhflwx8ggrZJzuNXoxUSYObu0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6718
X-Mailman-Approved-At: Mon, 09 Dec 2019 09:46:36 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MLEZhRtYlCD2524M6XL5UaWhaTS0ik60lqYRzL16GMo=;
 b=ksMwOSXKxIZuOdCR8EMtv3N2Ets0KuWCox5CR/18EFiNuFFT42NoUsoN8xVEDXAtdccrm/c1Tbl8bUbkkcIh1b+d0/tBMCLtmSIejL7+DvPp/3dJEO5jVe0pG/UHY11Rjwiaj74DgQ1KsrFE7gWTQknT1zZNpyZfvQISiLSl/W8=
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
 Niranjan Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 "ira.weiny@intel.com" <ira.weiny@intel.com>,
 "dan.j.williams@intel.com" <dan.j.williams@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBEZWMgMDQsIDIwMTkgYXQgMDQ6NTE6MzZQTSAtMDUwMCwgSmVyb21lIEdsaXNzZSB3
cm90ZToKPiBPbiBUdWUsIERlYyAwMywgMjAxOSBhdCAxMToxOTo0M0FNIC0wODAwLCBOaXJhbmph
biBWaXNod2FuYXRoYXB1cmEgd3JvdGU6Cj4gPiBPbiBUdWUsIE5vdiAyNiwgMjAxOSBhdCAwNjoz
Mjo1MlBNICswMDAwLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gPiA+IE9uIE1vbiwgTm92IDI1
LCAyMDE5IGF0IDExOjMzOjI3QU0gLTA1MDAsIEplcm9tZSBHbGlzc2Ugd3JvdGU6Cj4gPiA+ID4g
T24gRnJpLCBOb3YgMjIsIDIwMTkgYXQgMTE6MzM6MTJQTSArMDAwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+ID4gPiA+ID4gT24gRnJpLCBOb3YgMjIsIDIwMTkgYXQgMTI6NTc6MjdQTSAtMDgw
MCwgTmlyYW5qYW5hIFZpc2h3YW5hdGhhcHVyYSB3cm90ZToKPiA+ID4gPiAKPiA+ID4gPiBbLi4u
XQo+ID4gPiA+IAo+ID4gPiA+ID4gPiArc3RhdGljIGludAo+ID4gPiA+ID4gPiAraTkxNV9yYW5n
ZV9mYXVsdChzdHJ1Y3QgaTkxNV9zdm0gKnN2bSwgc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UpCj4g
PiA+ID4gPiA+ICt7Cj4gPiA+ID4gPiA+ICsJbG9uZyByZXQ7Cj4gPiA+ID4gPiA+ICsKPiA+ID4g
PiA+ID4gKwlyYW5nZS0+ZGVmYXVsdF9mbGFncyA9IDA7Cj4gPiA+ID4gPiA+ICsJcmFuZ2UtPnBm
bl9mbGFnc19tYXNrID0gLTFVTDsKPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiArCXJldCA9IGht
bV9yYW5nZV9yZWdpc3RlcihyYW5nZSwgJnN2bS0+bWlycm9yKTsKPiA+ID4gPiA+ID4gKwlpZiAo
cmV0KSB7Cj4gPiA+ID4gPiA+ICsJCXVwX3JlYWQoJnN2bS0+bW0tPm1tYXBfc2VtKTsKPiA+ID4g
PiA+ID4gKwkJcmV0dXJuIChpbnQpcmV0Owo+ID4gPiA+ID4gPiArCX0KPiA+ID4gPiA+Cj4gPiA+
ID4gPgo+ID4gPiA+ID4gVXNpbmcgYSB0ZW1wb3JhcnkgcmFuZ2UgaXMgdGhlIHBhdHRlcm4gZnJv
bSBub3V2ZWF1LCBpcyBpdCByZWFsbHkKPiA+ID4gPiA+IG5lY2Vzc2FyeSBpbiB0aGlzIGRyaXZl
cj8KPiA+ID4gPiAKPiA+ID4gPiBKdXN0IHRvIGNvbW1lbnQgb24gdGhpcywgZm9yIEdQVSB0aGUg
dXNhZ2UgbW9kZWwgaXMgbm90IGFwcGxpY2F0aW9uCj4gPiA+ID4gcmVnaXN0ZXIgcmFuZ2Ugb2Yg
dmlydHVhbCBhZGRyZXNzIGl0IHdhbnRzIHRvIHVzZS4gSXQgaXMgR1BVIGNhbgo+ID4gPiA+IGFj
Y2VzcyBfYW55XyBDUFUgdmFsaWQgYWRkcmVzcyBqdXN0IGxpa2UgdGhlIENQVSB3b3VsZCAobW9k
dWxvIG1tYXAKPiA+ID4gPiBvZiBkZXZpY2UgZmlsZSkuCj4gPiA+ID4gCj4gPiA+ID4gVGhpcyBp
cyBiZWNhdXNlIHRoZSBBUEkgeW91IHdhbnQgaW4gdXNlcnNwYWNlIGlzIGFwcGxpY2F0aW9uIHBh
c3NpbmcKPiA+ID4gPiByYW5kb20gcG9pbnRlciB0byB0aGUgR1BVIGFuZCBHUFUgYmVpbmcgYWJs
ZSB0byBjaGFzZSBkb3duIGFueSBraW5kCj4gPiA+ID4gb2YgcmFuZG9tIHBvaW50ZXIgY2hhaW4g
KGFzc3VtaW5nIGFsbCB2YWxpZCBpZSBwb2ludGluZyB0byB2YWxpZAo+ID4gPiA+IHZpcnR1YWwg
YWRkcmVzcyBmb3IgdGhlIHByb2Nlc3MpLgo+ID4gPiA+IAo+ID4gPiA+IFRoaXMgaXMgdW5saWtl
IHRoZSBSRE1BIGNhc2UuCj4gPiA+IAo+ID4gPiBObywgUkRNQSBoYXMgdGhlIGZ1bGwgYWRkcmVz
cyBzcGFjZSBvcHRpb24gYXMgd2VsbCwgaXQgaXMgY2FsbGVkCj4gPiA+ICdpbXBsaWNpdCBPRFAn
Cj4gPiA+IAo+ID4gPiBUaGlzIGlzIGltcGxlbWVudGVkIGJ5IHJlZ2lzdGVyaW5nIHJhbmdlcyBh
dCBhIGxldmVsIGluIG91ciBwYWdlCj4gPiA+IHRhYmxlIChjdXJyZW50bHkgNTEyRykgd2hlbmV2
ZXIgdGhhdCBsZXZlbCBoYXMgcG9wdWxhdGVkIHBhZ2VzIGJlbG93Cj4gPiA+IGl0Lgo+ID4gPiAK
PiA+ID4gSSB0aGluayBpcyBhIGJldHRlciBzdHJhdGVneSB0aGFuIHRlbXBvcmFyeSByYW5nZXMu
Cj4gCj4gSE1NIG9yaWdpbmFsIGRlc2lnbiBkaWQgbm90IGhhdmUgcmFuZ2UgYW5kIHdhcyB3ZWxs
IHN1aXRlZCB0byBub3V2ZWF1Lgo+IFJlY2VudCBjaGFuZ2VzIG1ha2UgaXQgbW9yZSB0aWUgdG8g
dGhlIHJhbmdlIGFuZCBsZXNzIHN1aXRlZCB0byBub3V2ZWF1Lgo+IEkgd291bGQgbm90IGNvbnNp
ZGVyIDUxMkdCIGltcGxpY2l0IHJhbmdlIGFzIGdvb2QgdGhpbmcuIFBsYW4gaSBoYXZlIGlzCj4g
dG8gY3JlYXRlIGltcGxpY2l0IHJhbmdlIGFuZCBhbGlnbiB0aGVtIG9uIHZtYS4gSSBkbyBub3Qg
a25vdyB3aGVuIGkgd2lsbAo+IGhhdmUgdGltZSB0byBnZXQgdG8gdGhhdC4KCkZvciBtbHg1IHRo
ZSA1MTJHIGlzIGFsaWduZWQgdG8gdGhlIHBhZ2UgdGFibGUgbGV2ZWxzLCBzbyBpdCBpcyBhCnJl
YXNvbmFibGUgYXBwcm94aW1hdGlvbi4gR1BVIGNvdWxkIGRvIHRoZSBzYW1lLgoKTm90IHN1cmUg
Vk1BIHJlbGF0ZWQgaXMgcmVhbGx5IGFueSBiZXR0ZXIuLgoKSmFzb24KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
