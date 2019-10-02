Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55037CB550
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 09:40:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED0026EAD0;
	Fri,  4 Oct 2019 07:39:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320127.outbound.protection.outlook.com [40.107.132.127])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB8B89FAD
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 08:09:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RMrnildEcgRFlJjgowOrvGM5vM413b34K1ldkkVuXMBvhaQAz60lkhxGKGjI0IjReDH/O6gS+BMrI9WzsGl6y71jJaJOSAArzOlgrZH/nkS5luP0l4XIGXuyFlKLiZt1YuA7OMthY8lPWnz+J01TuvuF9HUEO2li9ahdJPUQcFIhJ3PyCx+qKcFbsNFWJFjOg6T0FD5jKHTY0MEnilB7oSK+B0z0vam6Y8bB+IXLiL/en8QRoZ0DtTT/wFzOO9Kn2IiFztpAFxWgST15v8Ano0LNdGvF2UfjSRN34G6kHDVK1j4KMuu+jf1kiUyQGt07Vt74pNiWgZChLN98SsGC5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eJwVl3WJYnafSgffs3DQz3Z0TI04pDwpTp1DXjtOEMU=;
 b=MPLJ27ClyRT5sAUYnJdBVUoUaV3YdkMpWKRNkn5OpFvgb6s9V1so65InQcLNVJ5SUjSFqMrHOd/NnIBE3Lzyt54qQm9oyjpdF0YBbM1TRgYes/souWHizagelP/6rlugtRQT5kN37SZUMjT4dXuQxHXvrUjOcV44Yqnp84WW2pwHk9aU0XTuWdzIxy4XYNb7idPyvjmzPXM6pX9oYvXtWApHZ1Qxzn+mdvaVKTKr7q2t05ERZEADIcRnVbdA/s+49vifog4QWL0r61UpUiEKRnoXmygXCagdaeU6GB535BCtGyw73tmmyjNLC00dHjPadwjFvvoopu+v44W0uEW4hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
Received: from PU1P153MB0169.APCP153.PROD.OUTLOOK.COM (10.170.189.13) by
 PU1P153MB0105.APCP153.PROD.OUTLOOK.COM (10.170.188.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.5; Wed, 2 Oct 2019 08:09:41 +0000
Received: from PU1P153MB0169.APCP153.PROD.OUTLOOK.COM
 ([fe80::fc44:a784:73e6:c1c2]) by PU1P153MB0169.APCP153.PROD.OUTLOOK.COM
 ([fe80::fc44:a784:73e6:c1c2%7]) with mapi id 15.20.2327.009; Wed, 2 Oct 2019
 08:09:41 +0000
From: Dexuan Cui <decui@microsoft.com>
To: Sasha Levin <sashal@kernel.org>, Michael Kelley <mikelley@microsoft.com>
Subject: RE: [PATHC v6] video: hyperv: hyperv_fb: Support deferred IO for
 Hyper-V frame buffer driver
Thread-Topic: [PATHC v6] video: hyperv: hyperv_fb: Support deferred IO for
 Hyper-V frame buffer driver
Thread-Index: AQHVeIjQ21J2EyXx3k2x6FCXKaeI5qdG+8Hg
Date: Wed, 2 Oct 2019 08:09:41 +0000
Message-ID: <PU1P153MB0169811097EA55DF795888B2BF9C0@PU1P153MB0169.APCP153.PROD.OUTLOOK.COM>
References: <20190918060227.6834-1-weh@microsoft.com>
 <DM5PR21MB0137DA408FE59E8C1171CFFCD78E0@DM5PR21MB0137.namprd21.prod.outlook.com>
 <DM5PR21MB01375E8543451D4550D622CDD7880@DM5PR21MB0137.namprd21.prod.outlook.com>
 <20191001184828.GF8171@sasha-vm>
In-Reply-To: <20191001184828.GF8171@sasha-vm>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=decui@microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-10-02T08:09:39.9301205Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=91d0fc58-9008-4c8a-bfab-da233f5ee236;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
x-originating-ip: [2601:600:a280:7f70:24b0:cdff:a7c5:c70f]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 74787cce-d125-49d6-55dd-08d7470fe0dc
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: PU1P153MB0105:|PU1P153MB0105:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PU1P153MB0105F0A00A1F11A5D842A1BFBF9C0@PU1P153MB0105.APCP153.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:597;
x-forefront-prvs: 0178184651
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(376002)(396003)(346002)(136003)(366004)(189003)(199004)(13464003)(66476007)(76116006)(7736002)(66556008)(5660300002)(54906003)(6246003)(107886003)(229853002)(4326008)(256004)(10290500003)(110136005)(55016002)(1511001)(22452003)(316002)(66446008)(64756008)(9686003)(52536014)(14444005)(478600001)(66946007)(8990500004)(8936002)(8676002)(81166006)(81156014)(10090500001)(446003)(6636002)(6436002)(6116002)(7416002)(11346002)(74316002)(2906002)(476003)(14454004)(6506007)(99286004)(25786009)(102836004)(46003)(76176011)(33656002)(7696005)(186003)(71200400001)(71190400001)(305945005)(486006)(86362001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:PU1P153MB0105;
 H:PU1P153MB0169.APCP153.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9+EtooMTeXaMqNDi9YllcOTa9sdLXuxoHWfeX0zMnPBUyL4gHJiL1xbwO5Slu46pjX3ZTLzUdriAoAr8PvvW2laWgQdH8bmElXRNk/2mY9INakwWLuh52NbnJA8oW/vKrJHkRLS5kFZUKS8wqMgXasR6IYqNOZI5WaCxVh4C++4AgKITgJ+o4z0HdOdDgGqRegr03Fj1QWGNvPQ7NdCYQfh7nlY/LOt8qs3vEVrRZH42tTgVym4HSWm8/3UmTF78KX6JbUNfh8wN8xAW4pHWtZJ4uAPVSxD674ewJe0HCb7iXzpm1gwjEd0hGymd1pBa/u+4wSIypyjhJZhAGcqGYO0QPMPSMkkNmLVvQzSwPy2oIuq1CY7erlQrd/cISFvl58RPMr+dmqBQ9F8v64efYqTJ+N8s+JP9MtW4ht/hA5Q=
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74787cce-d125-49d6-55dd-08d7470fe0dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2019 08:09:41.4584 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DQkI60V2i6Y1/HoDD7fdYEexYnKH33ZuvWsTLFmRKOyUCRAbDmErVpwHKqKLxwNbNotweBwsyXFAxMWxXfhUEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1P153MB0105
X-Mailman-Approved-At: Fri, 04 Oct 2019 07:38:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eJwVl3WJYnafSgffs3DQz3Z0TI04pDwpTp1DXjtOEMU=;
 b=RD4k1dukXwNu7p0R/BbsLaUWdYHKvXQq8IBmN/5Cf8Xyi1jg4QBA0i6n5QFfjw8p6eBqF4YPSEU2gbrnnBjCjgIV1FdBsYlRtnBcaF5SHBzhXeCRES+POMgQPTArxfHR0PwQ3j9F+VB9iN70r05GvAqq41s2ZUe4TRi4IQJqJk8=
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
Cc: "info@metux.net" <info@metux.net>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 Wei Hu <weh@microsoft.com>, "shc_work@mail.ru" <shc_work@mail.ru>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "baijiaju1990@gmail.com" <baijiaju1990@gmail.com>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, KY Srinivasan <kys@microsoft.com>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFNhc2hhIExldmluIDxzYXNoYWxA
a2VybmVsLm9yZz4KPiBTZW50OiBUdWVzZGF5LCBPY3RvYmVyIDEsIDIwMTkgMTE6NDggQU0KPiAK
PiBPbiBGcmksIFNlcCAyMCwgMjAxOSBhdCAwNToyNjozNFBNICswMDAwLCBNaWNoYWVsIEtlbGxl
eSB3cm90ZToKPiA+RnJvbTogTWljaGFlbCBLZWxsZXkgPG1pa2VsbGV5QG1pY3Jvc29mdC5jb20+
ICBTZW50OiBXZWRuZXNkYXksCj4gU2VwdGVtYmVyIDE4LCAyMDE5IDI6NDggUE0KPiA+PiA+Cj4g
Pj4gPiBXaXRob3V0IGRlZmVycmVkIElPIHN1cHBvcnQsIGh5cGVydl9mYiBkcml2ZXIgaW5mb3Jt
cyB0aGUgaG9zdCB0byByZWZyZXNoCj4gPj4gPiB0aGUgZW50aXJlIGd1ZXN0IGZyYW1lIGJ1ZmZl
ciBhdCBmaXhlZCByYXRlLCBlLmcuIGF0IDIwSHosIG5vIG1hdHRlciB0aGVyZQo+ID4+ID4gaXMg
c2NyZWVuIHVwZGF0ZSBvciBub3QuIFRoaXMgcGF0Y2ggc3VwcG9ydHMgZGVmZXJyZWQgSU8gZm9y
IHNjcmVlbnMgaW4KPiA+PiA+IGdyYXBoaWNzIG1vZGUgYW5kIGFsc28gZW5hYmxlcyB0aGUgZnJh
bWUgYnVmZmVyIG9uLWRlbWFuZCByZWZyZXNoLiBUaGUKPiA+PiA+IGhpZ2hlc3QgcmVmcmVzaCBy
YXRlIGlzIHN0aWxsIHNldCBhdCAyMEh6Lgo+ID4+ID4KPiA+PiA+IEN1cnJlbnRseSBIeXBlci1W
IG9ubHkgdGFrZXMgYSBwaHlzaWNhbCBhZGRyZXNzIGZyb20gZ3Vlc3QgYXMgdGhlIHN0YXJ0aW5n
Cj4gPj4gPiBhZGRyZXNzIG9mIGZyYW1lIGJ1ZmZlci4gVGhpcyBpbXBsaWVzIHRoZSBndWVzdCBt
dXN0IGFsbG9jYXRlIGNvbnRpZ3VvdXMKPiA+PiA+IHBoeXNpY2FsIG1lbW9yeSBmb3IgZnJhbWUg
YnVmZmVyLiBJbiBhZGRpdGlvbiwgSHlwZXItViBHZW4gMiBWTXMgb25seQo+ID4+ID4gYWNjZXB0
IGFkZHJlc3MgZnJvbSBNTUlPIHJlZ2lvbiBhcyBmcmFtZSBidWZmZXIgYWRkcmVzcy4gRHVlIHRv
IHRoZXNlCj4gPj4gPiBsaW1pdGF0aW9ucyBvbiBIeXBlci1WIGhvc3QsIHdlIGtlZXAgYSBzaGFk
b3cgY29weSBvZiBmcmFtZSBidWZmZXIKPiA+PiA+IGluIHRoZSBndWVzdC4gVGhpcyBtZWFucyBv
bmUgbW9yZSBjb3B5IG9mIHRoZSBkaXJ0eSByZWN0YW5nbGUgaW5zaWRlCj4gPj4gPiBndWVzdCB3
aGVuIGRvaW5nIHRoZSBvbi1kZW1hbmQgcmVmcmVzaC4gVGhpcyBjYW4gYmUgb3B0aW1pemVkIGlu
IHRoZQo+ID4+ID4gZnV0dXJlIHdpdGggaGVscCBmcm9tIGhvc3QuIEZvciBub3cgdGhlIGhvc3Qg
cGVyZm9ybWFuY2UgZ2FpbiBmcm9tCj4gZGVmZXJyZWQKPiA+PiA+IElPIG91dHdlaWdocyB0aGUg
c2hhZG93IGNvcHkgaW1wYWN0IGluIHRoZSBndWVzdC4KPiA+PiA+Cj4gPj4gPiBTaWduZWQtb2Zm
LWJ5OiBXZWkgSHUgPHdlaEBtaWNyb3NvZnQuY29tPgo+ID4KPiA+U2FzaGEgLS0gdGhpcyBwYXRj
aCBhbmQgb25lIG90aGVyIGZyb20gV2VpIEh1IGZvciB0aGUgSHlwZXItViBmcmFtZSBidWZmZXIK
PiA+ZHJpdmVyIHNob3VsZCBiZSByZWFkeS4gIEJvdGggcGF0Y2hlcyBhZmZlY3Qgb25seSB0aGUg
SHlwZXItViBmcmFtZSBidWZmZXIKPiA+ZHJpdmVyIHNvIGNhbiBnbyB0aHJvdWdoIHRoZSBIeXBl
ci1WIHRyZWUuICBDYW4geW91IHBpY2sgdGhlc2UgdXA/ICBUaHguCj4gCj4gSSBjYW4ndCBnZXQg
dGhpcyB0byBhcHBseSBhbnl3aGVyZSwgd2hhdCB0cmVlIGlzIGl0IGJhc2VkIG9uPwo+IAo+IC0t
Cj4gVGhhbmtzLAo+IFNhc2hhCgpIaSBTYXNoYSwKVG9kYXkncyBoeXBlcnYvbGludXguZ2l0J3Mg
aHlwZXJ2LW5leHQgYnJhbmNoJ3MgdG9wIGNvbW1pdCBpcwogICAgNDhiNzJhMjY5N2Q1ICgiaHZf
bmV0dnNjOiBBZGQgdGhlIHN1cHBvcnQgb2YgaGliZXJuYXRpb24iKS4KClBsZWFzZSBwaWNrIHVw
IHR3byBwYXRjaGVzIGZyb20gV2VpIEh1OgojMTogW1BBVENIIHY0XSB2aWRlbzogaHlwZXJ2OiBo
eXBlcnZfZmI6IE9idGFpbiBzY3JlZW4gcmVzb2x1dGlvbiBmcm9tIEh5cGVyLVYgaG9zdAojMjog
W1BBVEhDIHY2XSB2aWRlbzogaHlwZXJ2OiBoeXBlcnZfZmI6IFN1cHBvcnQgZGVmZXJyZWQgSU8g
Zm9yIEh5cGVyLVYgZnJhbWUgYnVmZmVyIGRyaXZlcgoKSSBjYW4gYXBwbHkgdGhlIDIgcGF0Y2hl
cyBvbiB0aGUgaHlwZXJ2LW5leHQgYnJhbmNoICh0aGUgdG9wIGNvbW1pdCBpcyA0OGI3MmEyNjk3
ZDUpOgoKW2RlY3VpQGxvY2FsaG9zdCBsaW51eF0kIHBhdGNoIC1wMSA8IDEuZGlmZgpwYXRjaGlu
ZyBmaWxlIGRyaXZlcnMvdmlkZW8vZmJkZXYvaHlwZXJ2X2ZiLmMKSHVuayAjMiBzdWNjZWVkZWQg
YXQgNTMgKG9mZnNldCAxIGxpbmUpLgpIdW5rICMzIHN1Y2NlZWRlZCBhdCA5NSAob2Zmc2V0IDEg
bGluZSkuCkh1bmsgIzQgc3VjY2VlZGVkIGF0IDEyNCAob2Zmc2V0IDEgbGluZSkuCkh1bmsgIzUg
c3VjY2VlZGVkIGF0IDIyMiAob2Zmc2V0IDEgbGluZSkuCkh1bmsgIzYgc3VjY2VlZGVkIGF0IDI2
MiAob2Zmc2V0IDIgbGluZXMpLgpIdW5rICM3IHN1Y2NlZWRlZCBhdCAzOTQgKG9mZnNldCAyIGxp
bmVzKS4KSHVuayAjOCBzdWNjZWVkZWQgYXQgNDQxIChvZmZzZXQgMiBsaW5lcykuCkh1bmsgIzkg
c3VjY2VlZGVkIGF0IDQ4MCAob2Zmc2V0IDIgbGluZXMpLgpIdW5rICMxMCBzdWNjZWVkZWQgYXQg
NTU4IChvZmZzZXQgMiBsaW5lcykuCkh1bmsgIzExIHN1Y2NlZWRlZCBhdCA1OTAgKG9mZnNldCAy
IGxpbmVzKS4KSHVuayAjMTIgc3VjY2VlZGVkIGF0IDc4NSAob2Zmc2V0IDIgbGluZXMpLgpIdW5r
ICMxMyBzdWNjZWVkZWQgYXQgODIzIChvZmZzZXQgMiBsaW5lcykuCgpbZGVjdWlAbG9jYWxob3N0
IGxpbnV4XSQgcGF0Y2ggLXAxIDwgMi5kaWZmCnBhdGNoaW5nIGZpbGUgZHJpdmVycy92aWRlby9m
YmRldi9LY29uZmlnCkh1bmsgIzEgc3VjY2VlZGVkIGF0IDIyMTQgKG9mZnNldCAtMjcgbGluZXMp
LgpwYXRjaGluZyBmaWxlIGRyaXZlcnMvdmlkZW8vZmJkZXYvaHlwZXJ2X2ZiLmMKSHVuayAjMSBz
dWNjZWVkZWQgYXQgMjM4IChvZmZzZXQgMSBsaW5lKS4KSHVuayAjMiBzdWNjZWVkZWQgYXQgMjU5
IChvZmZzZXQgMiBsaW5lcykuCkh1bmsgIzMgc3VjY2VlZGVkIGF0IDI3NyAob2Zmc2V0IDIgbGlu
ZXMpLgpIdW5rICM0IHN1Y2NlZWRlZCBhdCAzNjQgKG9mZnNldCAyIGxpbmVzKS4KSHVuayAjNSBz
dWNjZWVkZWQgYXQgNjkyIChvZmZzZXQgMiBsaW5lcykuCkh1bmsgIzYgc3VjY2VlZGVkIGF0IDcw
MiAob2Zmc2V0IDIgbGluZXMpLgpIdW5rICM3IHN1Y2NlZWRlZCBhdCA3MTkgKG9mZnNldCAyIGxp
bmVzKS4KSHVuayAjOCBzdWNjZWVkZWQgYXQgODAxIChvZmZzZXQgMiBsaW5lcykuCkh1bmsgIzkg
c3VjY2VlZGVkIGF0IDg2MyAob2Zmc2V0IDIgbGluZXMpLgpIdW5rICMxMCBzdWNjZWVkZWQgYXQg
ODc2IChvZmZzZXQgMiBsaW5lcykuCkh1bmsgIzExIHN1Y2NlZWRlZCBhdCA4ODkgKG9mZnNldCAy
IGxpbmVzKS4KSHVuayAjMTIgc3VjY2VlZGVkIGF0IDk1MSAob2Zmc2V0IDIgbGluZXMpLgpIdW5r
ICMxMyBzdWNjZWVkZWQgYXQgOTg4IChvZmZzZXQgMiBsaW5lcykuCkh1bmsgIzE0IHN1Y2NlZWRl
ZCBhdCAxMDA3IChvZmZzZXQgMiBsaW5lcykuCkh1bmsgIzE1IHN1Y2NlZWRlZCBhdCAxMDQxIChv
ZmZzZXQgMiBsaW5lcykuCgpUaGFua3MsCi0tIERleHVhbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
