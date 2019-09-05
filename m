Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4393AB2D2
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 09:01:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 077826E169;
	Fri,  6 Sep 2019 07:01:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690114.outbound.protection.outlook.com [40.107.69.114])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D3346E0FB
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 14:10:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gc2xlkOqytAeLMKpn61dP5axvSx7pPnFfyYyJf4zeiHbOW6O5o2xJ/O3oFmhHKQ1fkx//h74lLZXu7svD6FTPfL3criE0jxsqlHrWbeo1vKIM+vxD6SGNPjH9Nr4jXLNIjRRwyEUv/YtfO6uZ+c707hIfFt2ZNiVo3KpOQ+Dk6jhNku3Ts3HRQGQ4cAAmeD0+6nZ036edioi9pcfRtjLEgRX0coWNYdXTn2PE6vEDAUSkjv0jXjZLi1lSSsiv8amdwpaP6yFL/4OkvMbJOe6WFZYyQoZUisSGd6ooAQTBJilyG2geZO2DIyWLMkp4RRwpE2wevQn1xtuYyxoB80hhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PCzz6TGh5YDPu0fhXRfVHreDzkPAZGnwIzndkFxf26w=;
 b=YqqB+VLxhK7Y1LzTBAY5R6Oi2QFdfNVFvS2yA+s5V1r1Ze8pFsfYdVgqM8AuEX5Nrq/jYp25BJtvCsEbViJcnZULhablpyyFtj4h/Y177ISkt24hr0VTunuv29LnPMbrb8znnOk6MDOFplc6xf2c9VGqsN3oc6yJNtl4lKW7DUP/6c3zTyU+zy5So+wVY9DUDVGAlSqjPdBjibQM6zRg5nEprE+pVHrj4RG1CDrEx8NioJRovRKQO+If90bCACd8Q7ZuErrqK3GNEGYhQtBWE4S011hhbHammPIB+nUucuVkaOIxot2XlIB1ZLs8bD+zwf3UglKGmH0BUor9ss9wCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
Received: from DM5PR21MB0137.namprd21.prod.outlook.com (10.173.173.12) by
 DM5PR21MB0843.namprd21.prod.outlook.com (10.173.172.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.7; Thu, 5 Sep 2019 14:10:10 +0000
Received: from DM5PR21MB0137.namprd21.prod.outlook.com
 ([fe80::c437:6219:efcc:fb8a]) by DM5PR21MB0137.namprd21.prod.outlook.com
 ([fe80::c437:6219:efcc:fb8a%7]) with mapi id 15.20.2263.004; Thu, 5 Sep 2019
 14:10:10 +0000
From: Michael Kelley <mikelley@microsoft.com>
To: Wei Hu <weh@microsoft.com>, "rdunlap@infradead.org"
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
Subject: RE: [PATCH v3] video: hyperv: hyperv_fb: Support deferred IO for
 Hyper-V frame buffer driver
Thread-Topic: [PATCH v3] video: hyperv: hyperv_fb: Support deferred IO for
 Hyper-V frame buffer driver
Thread-Index: AQHVY8PxCEaneStSU0CIK0oNOZcaZ6cdH2Xg
Date: Thu, 5 Sep 2019 14:10:10 +0000
Message-ID: <DM5PR21MB0137437661B0B2DDAC94DD5FD7BB0@DM5PR21MB0137.namprd21.prod.outlook.com>
References: <20190905082816.3612-1-weh@microsoft.com>
In-Reply-To: <20190905082816.3612-1-weh@microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=mikelley@ntdev.microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-09-05T14:10:08.5288979Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=54748b5f-44b5-4b28-b4ca-905de987b8bf;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
x-originating-ip: [24.22.167.197]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8a58408b-0837-45f9-50f4-08d7320ac359
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR21MB0843; 
x-ms-traffictypediagnostic: DM5PR21MB0843:|DM5PR21MB0843:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR21MB0843E24321351C97B1365504D7BB0@DM5PR21MB0843.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 015114592F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(136003)(376002)(346002)(396003)(39860400002)(199004)(189003)(2201001)(86362001)(478600001)(7416002)(6636002)(81166006)(10290500003)(6506007)(33656002)(52536014)(229853002)(8676002)(81156014)(8936002)(66066001)(76176011)(14454004)(99286004)(1511001)(5660300002)(186003)(486006)(25786009)(476003)(10090500001)(2906002)(6246003)(14444005)(3846002)(53936002)(9686003)(446003)(55016002)(7696005)(256004)(2501003)(11346002)(6436002)(66556008)(1250700005)(26005)(305945005)(71190400001)(71200400001)(6116002)(316002)(7736002)(102836004)(8990500004)(110136005)(22452003)(66476007)(64756008)(66946007)(66446008)(76116006)(74316002)(921003)(1121003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR21MB0843;
 H:DM5PR21MB0137.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: okqGSiKVXw0DOoJAbUyST77SX+6y0vC6jixf7w6wQPrLujlDibbOyK14JeIQSB1tstFEXyNGaGvTa8SCKqMNhS/f2BUHzQRcYQfl9XaqbVIkkv3dQiklV9aCssqNwTWlROiVUZpXLH6QnRlURsdO5gTysD5SWRl7cc8yTC4B1kJ8tl4PcK8H0R9uXx2kxWak1s4FY3XPMik0hFBc+qPi0BHdgw25dGufJfCl0HOo5qQFgioW5JQJTvzK2n/GqbjThVpVwtV6e//60IoT/7KetcdVTSk87B8oDI3md36GN3gPzYVFsyG/hLNpHFF4oSpspq98aHo7fyxQYHu62ByGY4oFlvY/zxjTc6v30RyYug+Gxw+zMij48LYLXhJqQd/N0Ragg/RbGT8Lb4TWh4HnHJXwZbMUFTy8tAuqTAPpm0g=
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a58408b-0837-45f9-50f4-08d7320ac359
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2019 14:10:10.3607 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0SVHRfwKLtk9micMfM1dXprJnUjPgfovM7XSYofh42mdlKTYnC8sGb/U5NzVttP70P6TWBHyofVZ8RiJC4ptgKqj/FORWS74XAXSyhDtLqs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR21MB0843
X-Mailman-Approved-At: Fri, 06 Sep 2019 07:01:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PCzz6TGh5YDPu0fhXRfVHreDzkPAZGnwIzndkFxf26w=;
 b=IndvI/B4KcMnmklozIRtXTT5B3ZeGLUPakyGKwl9AtEtDhAW/pGJUA3LQ7zaK7z0U7r+mfmCw5ZbpTCkHv3DF4T88Njv93y849wg4HQ+Q8n+OyUjH9Uvx8kIkuSsRvxowpLe7lzz/yLb2Capy7nRGHIinQZ4S/8CrkPTUDo8ywA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=mikelley@microsoft.com; 
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

RnJvbTogV2VpIEh1IDx3ZWhAbWljcm9zb2Z0LmNvbT4gU2VudDogVGh1cnNkYXksIFNlcHRlbWJl
ciA1LCAyMDE5IDE6MjkgQU0KPiAKPiBXaXRob3V0IGRlZmVycmVkIElPIHN1cHBvcnQsIGh5cGVy
dl9mYiBkcml2ZXIgaW5mb3JtcyB0aGUgaG9zdCB0byByZWZyZXNoCj4gdGhlIGVudGlyZSBndWVz
dCBmcmFtZSBidWZmZXIgYXQgZml4ZWQgcmF0ZSwgZS5nLiBhdCAyMEh6LCBubyBtYXR0ZXIgdGhl
cmUKPiBpcyBzY3JlZW4gdXBkYXRlIG9yIG5vdC4gVGhpcyBwYXRjaCBzdXBwb3J0cyBkZWZlcnJl
ZCBJTyBmb3Igc2NyZWVucyBpbgo+IGdyYXBoaWNzIG1vZGUgYW5kIGFsc28gZW5hYmxlcyB0aGUg
ZnJhbWUgYnVmZmVyIG9uLWRlbWFuZCByZWZyZXNoLiBUaGUKPiBoaWdoZXN0IHJlZnJlc2ggcmF0
ZSBpcyBzdGlsbCBzZXQgYXQgMjBIei4KPiAKPiBDdXJyZW50bHkgSHlwZXItViBvbmx5IHRha2Vz
IGEgcGh5c2ljYWwgYWRkcmVzcyBmcm9tIGd1ZXN0IGFzIHRoZSBzdGFydGluZwo+IGFkZHJlc3Mg
b2YgZnJhbWUgYnVmZmVyLiBUaGlzIGltcGxpZXMgdGhlIGd1ZXN0IG11c3QgYWxsb2NhdGUgY29u
dGlndW91cwo+IHBoeXNpY2FsIG1lbW9yeSBmb3IgZnJhbWUgYnVmZmVyLiBJbiBhZGRpdGlvbiwg
SHlwZXItViBHZW4gMiBWTXMgb25seQo+IGFjY2VwdCBhZGRyZXNzIGZyb20gTU1JTyByZWdpb24g
YXMgZnJhbWUgYnVmZmVyIGFkZHJlc3MuIER1ZSB0byB0aGVzZQo+IGxpbWl0YXRpb25zIG9uIEh5
cGVyLVYgaG9zdCwgd2Uga2VlcCBhIHNoYWRvdyBjb3B5IG9mIGZyYW1lIGJ1ZmZlcgo+IGluIHRo
ZSBndWVzdC4gVGhpcyBtZWFucyBvbmUgbW9yZSBjb3B5IG9mIHRoZSBkaXJ0eSByZWN0YW5nbGUg
aW5zaWRlCj4gZ3Vlc3Qgd2hlbiBkb2luZyB0aGUgb24tZGVtYW5kIHJlZnJlc2guIFRoaXMgY2Fu
IGJlIG9wdGltaXplZCBpbiB0aGUKPiBmdXR1cmUgd2l0aCBoZWxwIGZyb20gaG9zdC4gRm9yIG5v
dyB0aGUgaG9zdCBwZXJmb3JtYW5jZSBnYWluIGZyb20gZGVmZXJyZWQKPiBJTyBvdXR3ZWlnaHMg
dGhlIHNoYWRvdyBjb3B5IGltcGFjdCBpbiB0aGUgZ3Vlc3QuCj4gCj4gU2lnbmVkLW9mZi1ieTog
V2VpIEh1IDx3ZWhAbWljcm9zb2Z0LmNvbT4KPiAtLS0KPiAgICAgdjI6IEluY29ycG9yYXRlZCBy
ZXZpZXcgY29tbWVudHMgZnJvbSBNaWNoYWVsIEtlbGxleQo+ICAgICAtIEluY3JlYXNlZCBkaXJ0
eSByZWN0YW5nbGUgYnkgb25lIHJvdyBpbiBkZWZlcnJlZCBJTyBjYXNlIHdoZW4gc2VuZGluZwo+
ICAgICB0byBIeXBlci1WLgo+ICAgICAtIENvcnJlY3RlZCB0aGUgZGlydHkgcmVjdGFuZ2xlIHNp
emUgaW4gdGhlIHRleHQgbW9kZS4KPiAgICAgLSBBZGRlZCBtb3JlIGNvbW1lbnRzLgo+ICAgICAt
IE90aGVyIG1pbm9yIGNvZGUgY2xlYW51cHMuCj4gCj4gICAgIHYzOiBJbmNvcnBvcmF0ZWQgbW9y
ZSByZXZpZXcgY29tbWVudHMKPiAgICAgLSBSZW1vdmVkIGEgZmV3IHVubmVjZXNzYXJ5IHZhcmlh
YmxlIHRlc3RzCj4gCj4gIGRyaXZlcnMvdmlkZW8vZmJkZXYvS2NvbmZpZyAgICAgfCAgIDEgKwo+
ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2h5cGVydl9mYi5jIHwgMjE2ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrLS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTk3IGluc2VydGlvbnMoKyksIDIw
IGRlbGV0aW9ucygtKQo+IAoKUmV2aWV3ZWQtYnk6IE1pY2hhZWwgS2VsbGV5IDxtaWtlbGxleUBt
aWNyb3NvZnQuY29tPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
