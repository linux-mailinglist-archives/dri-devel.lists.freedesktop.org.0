Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F46B18D8
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 09:25:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79CEF6EE9E;
	Fri, 13 Sep 2019 07:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300135.outbound.protection.outlook.com [40.107.130.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46C586EE84
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 06:37:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CnAwZpsXNZSduj9A978aNxUaI/IKbDWdbSyGFfVmdd3RK2L5sAybDkElEw2jS/5xbeG3CsOWRj7q5Zjaao96UZRZpUbuz263AWydyHtO2B7SZXfZzfriay/fYCarGoZuEcMbx83YyZY7nN455Y+WaRkLTRaerfQRbTtvVGOlAPFrtJBBuqRIOJOzQ0C5+6WCdJkGfYdm/wBW22pCz3GWLfK6Veka3zlHaqc70jAlD/TH2stDL1dFokydCjNOYyh5/cHr7tgtYhAloSnvikIbyK5g9R3OEoTGEX7quFiZPvQA7DjyZrQnJNVpChU+HfO9/PinYAp8/p/HzwcrIiU1cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lpFQ3fSvlzWzHo6tu36TU5GGCcT5nGwbFPKlmFt9Gnk=;
 b=YbzB4VJFGND6fsfvma3VU0N7kN5sb8D6Uj/wg2jg92SrZ2gnEbMqLc0CNdCJT8ygqYbYha4E/CWWLBU6GMTNGm6hWHR4rhVb2/3VQy1ocrvOy6Db7xrwO9/rPk3vHO6pTVaRce6TBHHyNcUXbAj8pPvjzYjVxKfCr1q8I5IeDJB/NV0WB5MpFI50Kmn4/MJEgiZH+KoJZLS6ES/l6U/jxOrH3wTqLSXl2cL7Xi5O0zf0pmbkkQ/IZzCcjTWhVfel4OT4y5CwQUrq52XBK8Feyxv3vnrXQmVKNG4GO6E5DfEOnt207Adk5dsTNKK6ivts7azi/K77UhEvciguc47dFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
Received: from PU1P153MB0169.APCP153.PROD.OUTLOOK.COM (10.170.189.13) by
 PU1P153MB0153.APCP153.PROD.OUTLOOK.COM (10.170.188.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.7; Fri, 13 Sep 2019 06:37:38 +0000
Received: from PU1P153MB0169.APCP153.PROD.OUTLOOK.COM
 ([fe80::3415:3493:a660:90e3]) by PU1P153MB0169.APCP153.PROD.OUTLOOK.COM
 ([fe80::3415:3493:a660:90e3%4]) with mapi id 15.20.2284.007; Fri, 13 Sep 2019
 06:37:38 +0000
From: Dexuan Cui <decui@microsoft.com>
To: Wei Hu <weh@microsoft.com>, Michael Kelley <mikelley@microsoft.com>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>, "shc_work@mail.ru"
 <shc_work@mail.ru>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>, "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "baijiaju1990@gmail.com" <baijiaju1990@gmail.com>,
 "fthain@telegraphics.com.au" <fthain@telegraphics.com.au>, "info@metux.net"
 <info@metux.net>, "linux-hyperv@vger.kernel.org"
 <linux-hyperv@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-fbdev@vger.kernel.org"
 <linux-fbdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "sashal@kernel.org" <sashal@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Haiyang Zhang
 <haiyangz@microsoft.com>, KY Srinivasan <kys@microsoft.com>
Subject: RE: [PATCH v5] video: hyperv: hyperv_fb: Support deferred IO for
 Hyper-V frame buffer driver
Thread-Topic: [PATCH v5] video: hyperv: hyperv_fb: Support deferred IO for
 Hyper-V frame buffer driver
Thread-Index: AQHVafjiL2AndauzGUaHnigxWapFw6cpJzCw
Date: Fri, 13 Sep 2019 06:37:37 +0000
Message-ID: <PU1P153MB0169E5E73D258A034B4869DCBFB30@PU1P153MB0169.APCP153.PROD.OUTLOOK.COM>
References: <20190913060209.3604-1-weh@microsoft.com>
In-Reply-To: <20190913060209.3604-1-weh@microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=decui@microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-09-13T06:37:36.0011933Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=d71db6b2-3d7b-491a-98c9-03546d3c3e58;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
x-originating-ip: [2601:600:a280:7f70:49e:db48:e427:c2a0]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8bc4b9f3-6785-45b3-0e4f-08d73814df00
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:PU1P153MB0153; 
x-ms-traffictypediagnostic: PU1P153MB0153:|PU1P153MB0153:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PU1P153MB01531A845D6660BD7234D85BBFB30@PU1P153MB0153.APCP153.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0159AC2B97
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(396003)(376002)(366004)(346002)(39860400002)(189003)(199004)(14454004)(76176011)(2906002)(55016002)(99286004)(71190400001)(71200400001)(8676002)(81166006)(81156014)(8936002)(6116002)(478600001)(6636002)(9686003)(229853002)(1511001)(25786009)(6436002)(7696005)(2201001)(10290500003)(66476007)(66446008)(64756008)(76116006)(446003)(66946007)(53936002)(110136005)(52536014)(476003)(186003)(8990500004)(6506007)(33656002)(7416002)(102836004)(2501003)(86362001)(6246003)(22452003)(305945005)(7736002)(1250700005)(316002)(10090500001)(46003)(11346002)(5660300002)(14444005)(74316002)(486006)(256004)(66556008)(921003)(1121003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:PU1P153MB0153;
 H:PU1P153MB0169.APCP153.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tkAwKpY35VwMxE2f+lhrQUZYpGGUFRPniOiTkDSeSCYKTigqYqUpyJmeLwBqh6riXpINgMOtK/Hbn1FUbYulITzHEjkYlhvUi3iggOiIC0M5vCdOa4NEx6C8NN4uDE88sZr8lTFcEIT19M59jlWW5nTvLVru1D4MKUmjLkSN9NqVnnBbpiL1yTMKlOhep4lTRmX49NJ7YmOCatZwZd/8BScR3R6mKX0ZuQG6Vm1DOFnuQdFLOH3667659BztJfVEXxtIA1sfY5KZjZgXVXJB/J9hJ11W3/l4bUypu0AkvfxYql29C0wFR0uK/QTe8RB2fvuEa/p8q+zfw2tPyLUXyxZbpzHsGM+9sBe43JHgEmzJweq3tEuhZPtQ7/fkuxj8J7YwcIuWr5pJBG+hyebYXFhs617u2BTKu/xvS74HNIw=
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bc4b9f3-6785-45b3-0e4f-08d73814df00
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2019 06:37:38.3391 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FcgYO0zRAYLzjEersqHT0iE4fIPsOW9ybQm0j1nJX8tKIWbq1sxCb86QOOroHXjMpBrOf62BMCFvRUEuc/VPQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1P153MB0153
X-Mailman-Approved-At: Fri, 13 Sep 2019 07:24:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lpFQ3fSvlzWzHo6tu36TU5GGCcT5nGwbFPKlmFt9Gnk=;
 b=LnqR4bXuUVuIXyL0KiZ8pDcNwsdxkSFfuC9FXx70Cc/g2bDj7dp1MSKrDWtZebQ/+irQLQ7AFwaSgats1Q1Ih27C/OGTT1Gx6okBTTMByeP/LzE5766YfJ8J4CpZAYuYSbgbcxyP1+/ulOeyCqms9GTk0ZZZEREIpVhFMi5DH68=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=decui@microsoft.com; 
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

PiBGcm9tOiBXZWkgSHUgPHdlaEBtaWNyb3NvZnQuY29tPgo+IFNlbnQ6IFRodXJzZGF5LCBTZXB0
ZW1iZXIgMTIsIDIwMTkgMTE6MDMgUE0KPiAKPiBXaXRob3V0IGRlZmVycmVkIElPIHN1cHBvcnQs
IGh5cGVydl9mYiBkcml2ZXIgaW5mb3JtcyB0aGUgaG9zdCB0byByZWZyZXNoCj4gdGhlIGVudGly
ZSBndWVzdCBmcmFtZSBidWZmZXIgYXQgZml4ZWQgcmF0ZSwgZS5nLiBhdCAyMEh6LCBubyBtYXR0
ZXIgdGhlcmUKPiBpcyBzY3JlZW4gdXBkYXRlIG9yIG5vdC4gVGhpcyBwYXRjaCBzdXBwb3J0cyBk
ZWZlcnJlZCBJTyBmb3Igc2NyZWVucyBpbgo+IGdyYXBoaWNzIG1vZGUgYW5kIGFsc28gZW5hYmxl
cyB0aGUgZnJhbWUgYnVmZmVyIG9uLWRlbWFuZCByZWZyZXNoLiBUaGUKPiBoaWdoZXN0IHJlZnJl
c2ggcmF0ZSBpcyBzdGlsbCBzZXQgYXQgMjBIei4KPiAKPiBDdXJyZW50bHkgSHlwZXItViBvbmx5
IHRha2VzIGEgcGh5c2ljYWwgYWRkcmVzcyBmcm9tIGd1ZXN0IGFzIHRoZSBzdGFydGluZwo+IGFk
ZHJlc3Mgb2YgZnJhbWUgYnVmZmVyLiBUaGlzIGltcGxpZXMgdGhlIGd1ZXN0IG11c3QgYWxsb2Nh
dGUgY29udGlndW91cwo+IHBoeXNpY2FsIG1lbW9yeSBmb3IgZnJhbWUgYnVmZmVyLiBJbiBhZGRp
dGlvbiwgSHlwZXItViBHZW4gMiBWTXMgb25seQo+IGFjY2VwdCBhZGRyZXNzIGZyb20gTU1JTyBy
ZWdpb24gYXMgZnJhbWUgYnVmZmVyIGFkZHJlc3MuIER1ZSB0byB0aGVzZQo+IGxpbWl0YXRpb25z
IG9uIEh5cGVyLVYgaG9zdCwgd2Uga2VlcCBhIHNoYWRvdyBjb3B5IG9mIGZyYW1lIGJ1ZmZlcgo+
IGluIHRoZSBndWVzdC4gVGhpcyBtZWFucyBvbmUgbW9yZSBjb3B5IG9mIHRoZSBkaXJ0eSByZWN0
YW5nbGUgaW5zaWRlCj4gZ3Vlc3Qgd2hlbiBkb2luZyB0aGUgb24tZGVtYW5kIHJlZnJlc2guIFRo
aXMgY2FuIGJlIG9wdGltaXplZCBpbiB0aGUKPiBmdXR1cmUgd2l0aCBoZWxwIGZyb20gaG9zdC4g
Rm9yIG5vdyB0aGUgaG9zdCBwZXJmb3JtYW5jZSBnYWluIGZyb20gZGVmZXJyZWQKPiBJTyBvdXR3
ZWlnaHMgdGhlIHNoYWRvdyBjb3B5IGltcGFjdCBpbiB0aGUgZ3Vlc3QuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogV2VpIEh1IDx3ZWhAbWljcm9zb2Z0LmNvbT4KPiAtLS0KPiAgICAgdjI6IEluY29ycG9y
YXRlZCByZXZpZXcgY29tbWVudHMgZnJvbSBNaWNoYWVsIEtlbGxleQo+ICAgICAtIEluY3JlYXNl
ZCBkaXJ0eSByZWN0YW5nbGUgYnkgb25lIHJvdyBpbiBkZWZlcnJlZCBJTyBjYXNlIHdoZW4gc2Vu
ZGluZwo+ICAgICB0byBIeXBlci1WLgo+ICAgICAtIENvcnJlY3RlZCB0aGUgZGlydHkgcmVjdGFu
Z2xlIHNpemUgaW4gdGhlIHRleHQgbW9kZS4KPiAgICAgLSBBZGRlZCBtb3JlIGNvbW1lbnRzLgo+
ICAgICAtIE90aGVyIG1pbm9yIGNvZGUgY2xlYW51cHMuCj4gCj4gICAgIHYzOiBJbmNvcnBvcmF0
ZWQgbW9yZSByZXZpZXcgY29tbWVudHMKPiAgICAgLSBSZW1vdmVkIGEgZmV3IHVubmVjZXNzYXJ5
IHZhcmlhYmxlIHRlc3RzCj4gCj4gICAgIHY0OiBJbmNvcnBvcmF0ZWQgdGVzdCBhbmQgcmV2aWV3
IGZlZWRiYWNrIGZyb20gRGV4dWFuIEN1aQo+ICAgICAtIE5vdCBkaXNhYmxlIGludGVycnVwdCB3
aGlsZSBhY3F1aXJpbmcgZG9jb3B5X2xvY2sgaW4KPiAgICAgICBodmZiX3VwZGF0ZV93b3JrKCku
IFRoaXMgYXZvaWRzIHNpZ25pZmljYW50IGJvb3R1cCBkZWxheSBpbgo+ICAgICAgIGxhcmdlIHZD
UFUgY291bnQgVk1zLgo+IAo+ICAgICB2NTogQ29tcGxldGVseSByZW1vdmUgdGhlIHVubmVjZXNz
YXJ5IGRvY29weV9sb2NrIGFmdGVyIGRpc2N1c3NpbmcKPiAgICAgd2l0aCBEZXh1YW4gQ3VpLgoK
VGhhbmtzISBMb29rcyBnb29kIHRvIG1lLgoKUmV2aWV3ZWQtYnk6IERleHVhbiBDdWkgPGRlY3Vp
QG1pY3Jvc29mdC5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
