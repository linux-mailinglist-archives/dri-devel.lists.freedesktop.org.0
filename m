Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C1DA131C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 10:01:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58D84892D3;
	Thu, 29 Aug 2019 08:01:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310123.outbound.protection.outlook.com [40.107.131.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC2E789487
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 09:12:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AQkTe3PhcOVnvrN3XfNyKztTDHh4JuQpYg1CyZsr7jQWufm4yx3sE4V58wZ/u0/rUf1TodDuGoxK78MMmY/A4LwVrxmehi+/clj0qxbEDu7aBIohmoMC0ovri8sfweowCp5kvUl+hDK/VcwEtPvgTt3DmKsbP8RvFO2875DVPL5nuFDc9KyKlEbpcC1UlQM5VJ99J01RtKXfpCIjK99WbsR7zY9faPbtVeVdksTkceM9tcJWbCG0SFv+NZ00xuBgvG79f0idhE47u8FCJ35eX0/e/j37joOZs8xlYbThZY1OF8VEt23i6e/+YgyTl53JMgaKGVgVNgk0Zwht/Ua2QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JkoVukJyoJ+Behl1JHtmxjroUKALx6RWAo09tW5ko3E=;
 b=E2M6cAE92PdvMxTbvazzRPIeKvFGE89shPLbyYtum6ayM5k0P5C+wFRF9WlcmtoxuvZ8imEE8hVbMNvEIBMd4ChrZXHCOJq1HF0mha4XdpXhTwWlPSVcnyN0nOJdhTqCOnDKW2DqS4SmtMg6wsDy1rIZlJiBbvbqUq+r0fOXvWcYERTaBu3uV0tjM1MrGdM4VAaLo/IQU+Bu+hZOABnKq28S2uO9k5qm8RfHJkHajgnIBpvDow5vx/Iuh3o4+w6tR6PgIDjzDI5noThyb65TaAg9gDQGABDpgYwrrNpt2h0027A36Ij6Jdg2qPjTxS/hJr5NTOcRP0D2ndXp/bN9/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
Received: from KL1P15301MB0264.APCP153.PROD.OUTLOOK.COM (52.132.240.17) by
 KL1P15301MB0006.APCP153.PROD.OUTLOOK.COM (10.170.167.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.3; Wed, 28 Aug 2019 09:12:31 +0000
Received: from KL1P15301MB0264.APCP153.PROD.OUTLOOK.COM
 ([fe80::c402:2ce2:cafa:8b1e]) by KL1P15301MB0264.APCP153.PROD.OUTLOOK.COM
 ([fe80::c402:2ce2:cafa:8b1e%9]) with mapi id 15.20.2241.000; Wed, 28 Aug 2019
 09:12:31 +0000
From: Wei Hu <weh@microsoft.com>
To: Michael Kelley <mikelley@microsoft.com>, "rdunlap@infradead.org"
 <rdunlap@infradead.org>, "shc_work@mail.ru" <shc_work@mail.ru>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "baijiaju1990@gmail.com" <baijiaju1990@gmail.com>,
 "fthain@telegraphics.com.au" <fthain@telegraphics.com.au>, "info@metux.net"
 <info@metux.net>, "linux-hyperv@vger.kernel.org"
 <linux-hyperv@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-fbdev@vger.kernel.org"
 <linux-fbdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "sashal@kernel.org" <sashal@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Haiyang Zhang
 <haiyangz@microsoft.com>, KY Srinivasan <kys@microsoft.com>, Dexuan Cui
 <decui@microsoft.com>
Subject: RE: [PATHC v2] video: hyperv: hyperv_fb: Support deferred IO for
 Hyper-V frame buffer driver
Thread-Topic: [PATHC v2] video: hyperv: hyperv_fb: Support deferred IO for
 Hyper-V frame buffer driver
Thread-Index: AQHVXMoQkghsJmF5GU+6GBoMEWqB8KcPrJWwgACTu4A=
Date: Wed, 28 Aug 2019 09:12:30 +0000
Message-ID: <KL1P15301MB026463D9F94CE517E7A63216BBA30@KL1P15301MB0264.APCP153.PROD.OUTLOOK.COM>
References: <20190827112421.2770-1-weh@microsoft.com>
 <DM5PR21MB0137969B8EB3146160C86A2DD7A30@DM5PR21MB0137.namprd21.prod.outlook.com>
In-Reply-To: <DM5PR21MB0137969B8EB3146160C86A2DD7A30@DM5PR21MB0137.namprd21.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=mikelley@ntdev.microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-08-28T00:07:19.1202362Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=87e41fa5-44a0-4c5f-8eea-bba2bafd67f3;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
x-originating-ip: [167.220.255.109]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a55a85ca-4de8-4418-e6d4-08d72b97db33
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:KL1P15301MB0006; 
x-ms-traffictypediagnostic: KL1P15301MB0006:|KL1P15301MB0006:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <KL1P15301MB0006D942EF1C5940189987B3BBA30@KL1P15301MB0006.APCP153.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 014304E855
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(366004)(39860400002)(376002)(346002)(136003)(199004)(13464003)(189003)(81166006)(81156014)(8676002)(476003)(76116006)(229853002)(2201001)(7736002)(76176011)(26005)(256004)(22452003)(2501003)(14444005)(7696005)(7416002)(66066001)(2906002)(99286004)(1250700005)(186003)(66946007)(8936002)(66476007)(110136005)(64756008)(66556008)(1511001)(66446008)(316002)(33656002)(6246003)(71190400001)(53936002)(6636002)(25786009)(10090500001)(305945005)(5660300002)(52536014)(6506007)(102836004)(3846002)(6116002)(55016002)(9686003)(446003)(11346002)(478600001)(10290500003)(6436002)(486006)(86362001)(71200400001)(74316002)(14454004)(8990500004)(921003)(1121003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:KL1P15301MB0006;
 H:KL1P15301MB0264.APCP153.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: EMGJr0HT1ZjAsHGeY+xTzfgsDBKvoish+//9quWFPXjVJhY/c6RKr3wVcx/CBtG5Q/QyqpFOjaZQaVOtOJZZw7AoF80Blo5NqpHEGAMstCG7CRoqSjP/iXNTRW/N5BPUrL8KEVijNnZnNxHNqLXm8htNFYNJFOui+6VP2jRq6hhiMPTy3RNhFTnvZzMEUffQUKJt+KSkA5020P67pWpB5t2Ez3XezUHe9NECQhEinA7Dgnl2fTqoohTYg5t5HtoKhecLK6+uZNp4hyxEJOC5uOeqd2kFGRN44hmHx4XnDTvP8RGueRTZaEyW+HVYmQtvnGW1dxd0AaCJ67AkZ0vE+DQAeOI4autDDP4ADohezIf5j9chI6oMVw6M4YHptqU5QDYdqBYujzaxSru/lq9BgUmRq2oQf7hOeOYvwsPJEkE=
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a55a85ca-4de8-4418-e6d4-08d72b97db33
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2019 09:12:30.8395 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LTcwVsIBhSYKpv4IoWzcxEm7m1WoYrBwJjA5CxLGYptNMR6T/8Qp/Ztg2rmQE/vGNrvBgvteSSPLcZwt4qzSxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1P15301MB0006
X-Mailman-Approved-At: Thu, 29 Aug 2019 08:01:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JkoVukJyoJ+Behl1JHtmxjroUKALx6RWAo09tW5ko3E=;
 b=UqVo5Swiq2fmGbXvk85uZ4VsHGAheV4ooehxHl89XQb63WGhuF6ZzQCI/R//Rqep/7u4eoJtxU9CsUv4sP2hw9jIYmjLt2LsyPUcbMnggYSClmZxL1Bj1kNd2StWVYBbi7UEPdqwYvE+f6bfOG6r9qtDvB7TK/Py9CGqjBSal/I=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=weh@microsoft.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogTWljaGFlbCBLZWxsZXkgPG1p
a2VsbGV5QG1pY3Jvc29mdC5jb20+Cj4gCj4gRnJvbTogV2VpIEh1IDx3ZWhAbWljcm9zb2Z0LmNv
bT4gIFNlbnQ6IFR1ZXNkYXksIEF1Z3VzdCAyNywgMjAxOSA0OjI1IEFNCj4gPgo+ID4gV2l0aG91
dCBkZWZlcnJlZCBJTyBzdXBwb3J0LCBoeXBlcnZfZmIgZHJpdmVyIGluZm9ybXMgdGhlIGhvc3Qg
dG8gcmVmcmVzaAo+ID4gdGhlIGVudGlyZSBndWVzdCBmcmFtZSBidWZmZXIgYXQgZml4ZWQgcmF0
ZSwgZS5nLiBhdCAyMEh6LCBubyBtYXR0ZXIgdGhlcmUKPiA+IGlzIHNjcmVlbiB1cGRhdGUgb3Ig
bm90LiBUaGlzIHBhdGNoIHN1cHBvcnRzIGRlZmVycmVkIElPIGZvciBzY3JlZW5zIGluCj4gPiBn
cmFwaGljcyBtb2RlIGFuZCBhbHNvIGVuYWJsZXMgdGhlIGZyYW1lIGJ1ZmZlciBvbi1kZW1hbmQg
cmVmcmVzaC4gVGhlCj4gPiBoaWdoZXN0IHJlZnJlc2ggcmF0ZSBpcyBzdGlsbCBzZXQgYXQgMjBI
ei4KPiA+Cj4gPiBDdXJyZW50bHkgSHlwZXItViBvbmx5IHRha2VzIGEgcGh5c2ljYWwgYWRkcmVz
cyBmcm9tIGd1ZXN0IGFzIHRoZSBzdGFydGluZwo+ID4gYWRkcmVzcyBvZiBmcmFtZSBidWZmZXIu
IFRoaXMgaW1wbGllcyB0aGUgZ3Vlc3QgbXVzdCBhbGxvY2F0ZSBjb250aWd1b3VzCj4gPiBwaHlz
aWNhbCBtZW1vcnkgZm9yIGZyYW1lIGJ1ZmZlci4gSW4gYWRkaXRpb24sIEh5cGVyLVYgR2VuIDIg
Vk1zIG9ubHkKPiA+IGFjY2VwdCBhZGRyZXNzIGZyb20gTU1JTyByZWdpb24gYXMgZnJhbWUgYnVm
ZmVyIGFkZHJlc3MuIER1ZSB0byB0aGVzZQo+ID4gbGltaXRhdGlvbnMgb24gSHlwZXItViBob3N0
LCB3ZSBrZWVwIGEgc2hhZG93IGNvcHkgb2YgZnJhbWUgYnVmZmVyCj4gPiBpbiB0aGUgZ3Vlc3Qu
IFRoaXMgbWVhbnMgb25lIG1vcmUgY29weSBvZiB0aGUgZGlydHkgcmVjdGFuZ2xlIGluc2lkZQo+
ID4gZ3Vlc3Qgd2hlbiBkb2luZyB0aGUgb24tZGVtYW5kIHJlZnJlc2guIFRoaXMgY2FuIGJlIG9w
dGltaXplZCBpbiB0aGUKPiA+IGZ1dHVyZSB3aXRoIGhlbHAgZnJvbSBob3N0LiBGb3Igbm93IHRo
ZSBob3N0IHBlcmZvcm1hbmNlIGdhaW4gZnJvbSBkZWZlcnJlZAo+ID4gSU8gb3V0d2VpZ2hzIHRo
ZSBzaGFkb3cgY29weSBpbXBhY3QgaW4gdGhlIGd1ZXN0Lgo+ID4KPiA+IHYyOiBJbmNvcnBvcmF0
ZWQgcmV2aWV3IGNvbW1lbnRzIGZyb20gTWljaGFlbCBLZWxsZXkKPiA+IC0gSW5jcmVhc2VkIGRp
cnR5IHJlY3RhbmdsZSBieSBvbmUgcm93IGluIGRlZmVycmVkIElPIGNhc2Ugd2hlbiBzZW5kaW5n
Cj4gPiB0byBIeXBlci1WLgo+ID4gLSBDb3JyZWN0ZWQgdGhlIGRpcnR5IHJlY3RhbmdsZSBzaXpl
IGluIHRoZSB0ZXh0IG1vZGUuCj4gPiAtIEFkZGVkIG1vcmUgY29tbWVudHMuCj4gPiAtIE90aGVy
IG1pbm9yIGNvZGUgY2xlYW51cHMuCj4gCj4gVmVyc2lvbiBoaXN0b3J5IHNob3VsZCBnbyBhZnRl
ciB0aGUgIi0tLSIgYmVsb3cgc28gaXQgaXMgbm90IGluY2x1ZGVkIGluCj4gdGhlIGNvbW1pdCBt
ZXNzYWdlLgo+IApbV2VpIEh1XSAKSSBzYXcgdmVyc2lvbiBoaXN0b3J5IGluIHRoZSBjb21taXQg
bG9ncy4gCgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFdlaSBIdSA8d2VoQG1pY3Jvc29mdC5jb20+
Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L0tjb25maWcgICAgIHwgICAxICsKPiA+
ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2h5cGVydl9mYi5jIHwgMjIxICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrLS0tCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAyMDIgaW5zZXJ0aW9ucygrKSwg
MjAgZGVsZXRpb25zKC0pCj4gPgo+ID4gKy8qIERlZmVycmVkIElPIGNhbGxiYWNrICovCj4gPiAr
c3RhdGljIHZvaWQgc3ludGh2aWRfZGVmZXJyZWRfaW8oc3RydWN0IGZiX2luZm8gKnAsCj4gPiAr
CQkJCSBzdHJ1Y3QgbGlzdF9oZWFkICpwYWdlbGlzdCkKPiA+ICt7Cj4gPiArCXN0cnVjdCBodmZi
X3BhciAqcGFyID0gcC0+cGFyOwo+ID4gKwlzdHJ1Y3QgcGFnZSAqcGFnZTsKPiA+ICsJdW5zaWdu
ZWQgbG9uZyBzdGFydCwgZW5kOwo+ID4gKwlpbnQgeTEsIHkyLCBtaW55LCBtYXh5Owo+ID4gKwl1
bnNpZ25lZCBsb25nIGZsYWdzOwo+ID4gKwo+ID4gKwltaW55ID0gSU5UX01BWDsKPiA+ICsJbWF4
eSA9IDA7Cj4gPiArCj4gPiArCS8qCj4gPiArCSAqIE1lcmdlIGRpcnR5IHBhZ2VzLiBJdCBpcyBw
b3NzaWJsZSB0aGF0IGxhc3QgcGFnZSBjcm9zcwo+ID4gKwkgKiBvdmVyIHRoZSBlbmQgb2YgZnJh
bWUgYnVmZmVyIHJvdyB5cmVzLiBUaGlzIGlzIHRha2VuIGNhcmUgb2YKPiA+ICsJICogaW4gc3lu
dGh2aWRfdXBkYXRlIGZ1bmN0aW9uIGJ5IGNsYW1waW5nIHRoZSB5Mgo+ID4gKwkgKiB2YWx1ZSB0
byB5cmVzLgo+ID4gKwkgKi8KPiA+ICsJbGlzdF9mb3JfZWFjaF9lbnRyeShwYWdlLCBwYWdlbGlz
dCwgbHJ1KSB7Cj4gPiArCQlzdGFydCA9IHBhZ2UtPmluZGV4IDw8IFBBR0VfU0hJRlQ7Cj4gPiAr
CQllbmQgPSBzdGFydCArIFBBR0VfU0laRSAtIDE7Cj4gPiArCQl5MSA9IHN0YXJ0IC8gcC0+Zml4
LmxpbmVfbGVuZ3RoOwo+ID4gKwkJeTIgPSBlbmQgLyBwLT5maXgubGluZV9sZW5ndGg7Cj4gPiAr
CQlpZiAoeTIgPiBwLT52YXIueXJlcykKPiA+ICsJCQl5MiA9IHAtPnZhci55cmVzOwo+IAo+IFRo
ZSBhYm92ZSB0ZXN0IHNlZW1zIGNvbnRyYWRpY3RvcnkgdG8gdGhlIGNvbW1lbnQgdGhhdAo+IHNh
eXMgdGhlIGNsYW1waW5nIGlzIGRvbmUgaW4gc3ludGh2aWRfdXBkYXRlKCkuICBBbHNvLCBzaW5j
ZQo+IHRoZSBhYm92ZSBjYWxjdWxhdGlvbiBvZiB5MiBpcyAiaW5jbHVzaXZlIiwgdGhlIGNsYW1w
aW5nIHNob3VsZAo+IGJlIGRvbmUgdG8geXJlcyAtIDEgaW4gb3JkZXIgdG8gY29udGludWUgdG8g
YmUgaW5jbHVzaXZlLiAgVGhlbgo+IHdoZW4gbWF4eSArIDEgaXMgcGFzc2VkIHRvIHN5bnRodmlk
X3VwZGF0ZSgpIGV2ZXJ5dGhpbmcgd29ya3MKPiBvdXQgY29ycmVjdGx5Lgo+CltXZWkgSHVdIApB
Y3R1YWxseSB0aGUgb3JpZ2luYWwgY29kZSBJIHNlbnQgb3V0IGp1c3Qgd29ya3MgY29ycmVjdGx5
LiAgSXQgYWx3YXlzIGdldAp0aGUgaW5jbHVzaXZlIHJlY3RhbmdsZSBpbiB0aGUgYWJvdmUgbG9v
cCwgYW5kIG9ubHkgc2VuZCBvbmUgbW9yZSBleHRyYQpsaW5lIChpZiB5MiA9PSB5cmVzKSB0byBz
eXRodmlkX3VwZGF0ZSgpIGFuZCBpdCBpcyBjbGFtcGVkIGluc2lkZSB0aGF0IApmdW5jdGlvbi4g
Q2hhbmdpbmcgaXQgdG8geXJlcyAtMSBhbmQgc2VuZGluZyBtYXh5ICsgMSB0byBzeXRudmlkX3Vw
ZGF0ZSgpCm1ha2VzIGl0IHRoZSBzYW1lIGFzIHRoZSBvcmlnaW5hbCBjb2RlIGluIHRoaXMgY2Fz
ZSwgYW5kIHdvdWxkIGVuZCB1cCAKYWx3YXlzIGNvcHkgYW5kIHJlZnJlc2ggb25lIGV4dHJhIHJv
dyB3aGVuIHkyIDwgeXJlcy4KClRoZSBjb21tZW50IEkgYWRkZWQgd2FzIGFjY29yZGluZyB0byB5
b3VyIGxhc3QgcmV2aWV3IGNvbW1lbnQgYXNraW5nCnRvIGFkZCBzb21lIGNvbW1lbnRzIGV4cGxh
aW5pbmcgaXQuIE1heWJlIEkgbWlzLXVuZGVyc3Rvb2QuIEkgdGhvdWdodApzaW5jZSB5b3Ugd2Fu
dGVkIG1lIHRvIGNoYW5nZSB0byBtYXh5ICsgMSwgdGhlIGNvZGUgY291bGQgcmVhY2ggeXJlcyAr
IDEKc28gaXQgd2lsbCBiZSBjbGFtcGVkIGluIHN5bnRodmlkX3VwZGF0ZSgpIHRvIHlyZXMuCgog
V2VpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
