Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E69178BD9
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 08:48:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 422D06EAF6;
	Wed,  4 Mar 2020 07:47:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0728.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0c::728])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9230F6EA84
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 14:57:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RNkz/o9gKY8NxzwqHvn57nEICPB4NJkbDWFrsB4qSC8+hSG8WFOhl1/ctHCVeYqQvLVbRMV8GzoxlADSdKI1tojcovdUqfWKVbMdUm7fV3hwumrgFkbLWJj3W7IsbR4spMqfmobZzvoxlH0I1o7LBxJ0lSgUuU/k0UrDOmnQgnl62LDRNgnNto+B1acNkqtBGkqbyFpDE2UktAHgBbmJNKZUovqEVCqwe59ECwf0ZXlR0GWOe9vRbZRDPJ0ypqQtBUPEO3D/6lX8vPOupHSM16v0O21Y1rcNUHAcshopn8oQQHNxG+HGsjM+3Cl6+veIXuNWPbq1+Q/3l7vXaBr+xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jo2qdUApFt9BTkbsznncznDbhtzUXXpIrwArAp86Mdc=;
 b=k2949ftCa6SXzRj3sLFzBtQRe9NjTfgqOps3g3HgEf1xQcSJPLzNRZHkYjGzb0NmVDAjaIgcQdJG2H898xS4gsYTNs1Qjy/AiiM7e376BF/fBsyBOJJMAGkAr1ACXw8eyjE5iXlDmNce7QgqlfYavb+e2CUhTipR0yzaIFVIdWQVWKuDJiSZtal21A5mMvP0bfnsM+IHDXdJpSyQsXbX+S3QFVYkUwIpTPRsqx27cZ32i4jQXepMQ/agCHqbIh5p9Wwgasql/ImO2ho7mESh6Hptw2J1CRmQBxteJ36e99BM/x54EQZVfHlxhuFNs0a3VhrJOsBFoBi+FYHJiOUyPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jo2qdUApFt9BTkbsznncznDbhtzUXXpIrwArAp86Mdc=;
 b=Ho4GZxRlntwLmGs1l70FDjVWmsO0oJ9fAAPlC/vMmIs0I3GSJFzkyrYt8/cCyojhGh91HdUK+aW2wm6HSo7IajXheU07V+h39TOr2LllGPXHqWf841v6uRavLVW7ojdpvFc4ytjeEvFfNVa+Aocl9Y2sKTSwOWrAyxC6LMoqpzM=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3548.eurprd02.prod.outlook.com (52.134.68.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.15; Tue, 3 Mar 2020 14:57:46 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::d7c:583:b9cb:7592]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::d7c:583:b9cb:7592%7]) with mapi id 15.20.2772.019; Tue, 3 Mar 2020
 14:57:46 +0000
Received: from [192.168.13.3] (213.112.137.122) by
 HE1PR07CA0047.eurprd07.prod.outlook.com (2603:10a6:7:66::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.5 via Frontend Transport; Tue, 3 Mar 2020 14:57:45 +0000
From: Peter Rosin <peda@axentia.se>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 28/33] drm/panel-simple: Fix dotclock for Sharp LQ150X1LG11
Thread-Topic: [PATCH 28/33] drm/panel-simple: Fix dotclock for Sharp
 LQ150X1LG11
Thread-Index: AQHV8NJLbcHjFGK67k+oSkQVyC4qRqg1+gCAgADyJYCAAApigA==
Date: Tue, 3 Mar 2020 14:57:45 +0000
Message-ID: <eacb0bee-730e-edea-3c60-88dcdc67f604@axentia.se>
References: <20200302203452.17977-1-ville.syrjala@linux.intel.com>
 <20200302203452.17977-29-ville.syrjala@linux.intel.com>
 <c9f756da-ba54-bfd6-87e4-4e52e3e7cecd@axentia.se>
 <20200303142031.GA2856480@ulmo>
In-Reply-To: <20200303142031.GA2856480@ulmo>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
x-originating-ip: [213.112.137.122]
x-clientproxiedby: HE1PR07CA0047.eurprd07.prod.outlook.com
 (2603:10a6:7:66::33) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9b71b995-35cf-47d2-37f4-08d7bf833b9b
x-ms-traffictypediagnostic: DB3PR0202MB3548:
x-microsoft-antispam-prvs: <DB3PR0202MB35486BDC6B6E49D9CB2221D4BCE40@DB3PR0202MB3548.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 03319F6FEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(136003)(376002)(346002)(39830400003)(396003)(199004)(189003)(4326008)(2616005)(16526019)(5660300002)(8676002)(81156014)(81166006)(66574012)(6916009)(66556008)(2906002)(66446008)(508600001)(956004)(66946007)(66476007)(26005)(64756008)(186003)(71200400001)(316002)(52116002)(53546011)(31686004)(54906003)(16576012)(8936002)(36756003)(6486002)(31696002)(86362001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB3PR0202MB3548;
 H:DB3PR0202MB3434.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uG1LndTSNs3j9aFWjBttRvlDVk7U8TZcTEdjXe4BcEikznEG8W0Q39X86GDgVjydyz03qszEcel20R6dkDldz4tS8QCmLXhM+Y8v9SuAKiR46Nhh7LbWOo01hM8p75oUHpBtInSAv/Gio5CZWDq59uM3UT2FJSd4mqL9vqmxOAHX/1rMyKfg1a963ivTIpRtaNhwtuK1lSb4KPitn2KV5t/5ltpYuBSisbZw/9Vm4RR2sOZD7fc3UqA94I9xC5sfrYCH/2vq2P99gOKh046ylDNRRWHYimLPDoqMgEcHvCSGlLOQvyMelQmoSqYPWz7JeXOKdXJp2baTXw6faDqZ7L0pwQ/uQdyxH8dHF4cpozRh93lzCtF90C7xugd+6/LQr7GSv8i/m+9QQSxx5ZlDwfYBUAvS+cwg2aMySTPHkrFC7KdBRSjem2uJJWxsVDtx
x-ms-exchange-antispam-messagedata: AeeFOsMgzBuDTfQ8Bb039G9k+nU4KDOjkX6WRhvLxsWRFviBrIkX1Riq/n9PfYhmhOShptlVGoyRwEWHRfwby9cxd248/R8Nw/kYM1n1U+xrL7rqqW8GFqD+YkSLkbjDiudXyEQ6x15uTP3OoPLsdA==
x-ms-exchange-transport-forked: True
Content-ID: <6D4E9E191414F745A2968F752FA95576@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b71b995-35cf-47d2-37f4-08d7bf833b9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2020 14:57:45.9894 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SCn2AQgJw54JJMXpRXy6sgJze5AZicMk+hKiPHbvRYvJUD39ZWz1VMqvuCNnfSwY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3548
X-Mailman-Approved-At: Wed, 04 Mar 2020 07:47:28 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Thierry Reding <treding@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQpPbiAyMDIwLTAzLTAzIDE1OjIwLCBUaGllcnJ5IFJlZGluZyB3cm90ZToNCj4gT24gTW9uLCBN
YXIgMDIsIDIwMjAgYXQgMTA6NTM6NTZQTSArMDAwMCwgUGV0ZXIgUm9zaW4gd3JvdGU6DQo+PiBP
biAyMDIwLTAzLTAyIDIxOjM0LCBWaWxsZSBTeXJqYWxhIHdyb3RlOg0KPj4+IEZyb206IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+DQo+Pj4NCj4+PiBUaGUg
Y3VycmVudGx5IGxpc3RlZCBkb3RjbG9jayBkaXNhZ3JlZXMgd2l0aCB0aGUgY3VycmVudGx5DQo+
Pj4gbGlzdGVkIHZyZWZyZXNoIHJhdGUuIENoYW5nZSB0aGUgZG90Y2xvY2sgdG8gbWF0Y2ggdGhl
IHZyZWZyZXNoLg0KPj4+DQo+Pj4gU29tZW9uZSB0ZWxsIG1lIHdoaWNoIChpZiBlaXRoZXIpIG9m
IHRoZSBkb3RjbG9jayBvciB2cmVyZXNoIGlzDQo+Pj4gY29ycmVjdD8NCj4+DQo+PiBUTC9EUjsg
SSBkbyBub3QgY2FyZSBpZiB5b3UgY2hhbmdlIHRoZSByZWZyZXNoIHJhdGUgb3IgdGhlIGRvdGNs
b2NrLg0KPj4NCj4+IFRoZSB3aG9sZSBlbnRyeSBmb3IgdGhhdCBwYW5lbCBpbiBzaW1wbGUtcGFu
ZWwgaXMgZHViaW91cy4gVGhlIHBhbmVsDQo+PiBpcyByZWFsbHkgYW4gTFZEUyBwYW5lbCAoY2Fw
YWJsZSBvZiBib3RoIFZFU0EvSmVpZGEgUkdCODg4LCBzZWxlY3RhYmxlDQo+PiB3aXRoIHRoZSBT
RUxMVkRTIHBpbikuICBXaXRoIEplaWRhIHlvdSBjYW4sIGFzIHVzdWFsLCBvbWl0IHRoZSA0dGgN
Cj4+IGRhdGEgY2hhbm5lbCBhbmQgdXNlIHRoZSBwYW5lbCB3aXRoIFJHQjY2Ni4gSW4gZWl0aGVy
IGNhc2UsIHlvdSBuZWVkDQo+PiBhbiBMVkRTIHNpZ25hbCBhbmQgbm90aGluZyBlbHNlLi4uDQo+
Pg0KPj4gVGhlIHBhbmVsIGNhbiBhbHNvIHJvdGF0ZSB0aGUgcGljdHVyZSAxODAgZGVncmVlcyB1
c2luZyB0aGUgUkwvVUQgcGluLg0KPj4NCj4+IFRoZXNlIG9wdGlvbnMgYXJlIG9mIGNvdXJzZSBu
b3QgZXhwcmVzc2VkIGluIHRoZSBzaW1wbGUgcGFuZWwgZHJpdmVyDQo+PiAoYW5kIHdlIGhhdmUg
YWx3YXlzIHVzZWQgZml4ZWQgc2lnbmFscyBmb3IgdGhvc2UgcGlucyBpbiBvdXIgZGVzaWducywN
Cj4+IElJUkMpLiBBcyBmYXIgYXMgSSdtIGNvbmNlcm5lZCwgdGhlIHBhbmVsIGNhbiBiZSByZW1v
dmVkIGZyb20NCj4+IHNpbXBsZS1wYW5lbC4gT3VyIGRldmljZSB0cmVlcyBhcmUgbm93YWRheXMg
Y29ycmVjdGx5IGV4cHJlc3NpbmcgdGhlDQo+PiBoYXJkd2FyZSB3aXRoIGFuIExWRFMgZW5jb2Rl
ciBiZXR3ZWVuIHRoZSBSR0Igb3V0cHV0IGFuZCB0aGUgcGFuZWwNCj4+IGFuZCBwb2ludHMgdG8g
dGhlIHBhbmVsLWx2ZHMgZHJpdmVyIGZvciB0aGUgcGFuZWwuDQo+IA0KPiBIb3cgZG8geW91IG1h
a2Ugc3VyZSB0aGF0IHlvdSBhbHdheXMgYmluZCBhZ2FpbnN0IHRoZSBjb3JyZWN0IGRyaXZlcj8g
SWYNCj4gaXQgbWF0Y2hlcyBzaW1wbGUtcGFuZWwgYW5kIHBhbmVsLWx2ZHMsIGl0J3Mgbm90IGRl
dGVybWluaXN0aWNhbGx5IGdvaW5nDQo+IHRvIHBpY2sgdGhlIHJpZ2h0IG9uZS4gV2VsbCwgaXQg
bWF5IGFjdHVhbGx5IGJlIGRldGVybWluaXN0aWMgb24gTGludXgsDQo+IGJ1dCBwZXJoYXBzIG9u
bHkgYnkgYWNjaWRlbnQuDQoNCllvdSBhcmUgcHJvYmFibHkgcmlnaHQgdGhhdCBpdCdzIGZyYWdp
bGUsIGJ1dCBubyBwcm9ibGVtcyBzbyBmYXIuIFRoYXQNCnNhaWQsIEkgZGlkIHdvbmRlciB3aHkg
dGhlIHBhbmVsLWx2ZHMgZHJpdmVyICJ3aW5zIiBvdmVyIHNpbXBsZS1wYW5lbCBmb3INCg0KCWNv
bXBhdGlibGUgPSAic2hhcnAsbHExNTB4MWxnMTEiLCAicGFuZWwtbHZkcyI7DQoNCkkgZmlndXJl
ZCBpdCB3YXMgYnkgZGVzaWduIGFuZCBkaWRuJ3Qgc3BlbmQgdG9vIG11Y2ggdGltZSB0aGlua2lu
ZyBhYm91dA0KaXQuIE1heWJlIEkgc2hvdWxkIGhhdmU/DQoNCj4+IFRoZSByZWFzb24gdGhhdCBp
dCBpcyBhcyBpdCBpcywgaXMgdGhhdCB3ZSBvYnZpb3VzbHkgZGlkbid0IHVuZGVyc3RhbmQNCj4+
IHdoYXQgd2Ugd2VyZSBkb2luZyB3aGVuIHdlIGFkZGVkIHRoZSBlbnRyeSwgYW5kIHRoaXMgZ2Fy
YmFnZSB3YXMgd2hhdA0KPj4gd2UgY2FtZSB1cCB3aXRoIHRoYXQgcHJvZHVjZWQgYSBwaWN0dXJl
Lg0KPj4NCj4+IElmIHlvdSB3YW50IHRvIGtlZXAgdGhlIHBhbmVsIGluIHNpbXBsZS1wYW5lbCBk
ZXNwaXRlIGFsbCB0aGlzLCB0aGUNCj4+IHRpbWluZyBjb25zdHJhaW50cyBhcmUgYXMgZm9sbG93
czoNCj4+DQo+PiBQaXhlbCBjbG9jayAgICAgICAgIDUwLTgwIE1IeiwgICAgICAgIDY1IE1IeiB0
eXBpY2FsDQo+PiBIb3Jpem9udGFsIHBlcmlvZCAxMDk0LTE3MjAgY2xvY2tzLCAxMzQ0IHR5cGlj
YWwNCj4+ICAgICAgICAgICAgICAgICAgIDE2LjAtMjMuNCB1cyAgICAgIDIwLjcgdXMNCj4+IEhv
cml6b250YWwgZW5hYmxlICAgIDEwMjQgY2xvY2tzLCBhbHdheXMNCj4+IFZlcnRpY2FsIHBlcmlv
ZCAgICA3NzYtOTkwIGxpbmVzLCAgICA4MDYgdHlwaWNhbA0KPj4gICAgICAgICAgICAgICAgICAg
MTMuMy0xOC4wIG1zICAgICAgMTYuNyBtcw0KPj4gVmVydGljYWwgZW5hYmxlICAgICAgIDc2OCBs
aW5lcywgIGFsd2F5cw0KPj4NCj4+IFVzaW5nIGEgImxvbmciICh0aGUgZGF0YXNoZWV0IGlzIG5v
dCB2ZXJ5IHNwZWNpZmljIG9uIHRoaXMgaXNzdWUpIHZlcnRpY2FsDQo+PiBwZXJpb2QgbWF5IGlu
dHJvZHVjZSBkZXRlcmlvcmF0aW9uIG9mIGRpc3BsYXkgcXVhbGl0eSwgZmxpY2tlciBldGMuDQo+
Pg0KPj4gSSBkb24ndCB0aGluayB0aGUgZGl2aXNpb24gYmV0d2VlbiBmcm9udC1wb3JjaC9iYWNr
LXBvcmNoIG1hdHRlcnMgbXVjaC4NCj4+DQo+PiBUaGF0IHNhaWQsIEkgaGF2ZSBubyBpZGVhIHdo
YXRzb2V2ZXIgaWYgb3RoZXJzIGhhdmUgc3RhcnRlZCB1c2luZyB0aGlzDQo+PiBwYW5lbCBlbnRy
eS4gTXkgZ3Vlc3MgaXMgdGhhdCBpdCBoYXMgemVybyB1c2VycywgYnV0IHdobyBjYW4gdGVsbD8N
Cj4gDQo+IEEgcXVpY2sgZ3JlcCBzaG93cyB0aGF0IGFyY2gvYXJtL2Jvb3QvZHRzL2F0OTEtbmF0
dGlzLTItbmF0dGUtMi5kdHMgaXMNCj4gdGhlIG9ubHkgZGV2aWNlIHRyZWUgdGhhdCB1c2VzIHRo
aXMgcGFuZWwgaW4gdGhlIHVwc3RyZWFtIGtlcm5lbC4NCg0KVGhpcyBpcyBvdXIgZGVzaWduLCBh
bmQgd2hhdCBtYWRlIHVzIG9yaWdpbmFsbHkgYWRkIHRoZSBlbnRyeSB0byBzaW1wbGUNCnBhbmVs
LCBidXQgYXMgSSBzYWlkLCB3ZSBubyBsb25nZXIgbmVlZCBzaW1wbGUtcGFuZWwgc3VwcG9ydCBm
b3IgaXQuLi4NCg0KQ2hlZXJzLA0KUGV0ZXINCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
