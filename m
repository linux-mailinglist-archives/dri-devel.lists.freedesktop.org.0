Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C82D110AB72
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 09:09:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF8EE6E250;
	Wed, 27 Nov 2019 08:09:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay-out1.synopsys.com (dc8-smtprelay2.synopsys.com
 [198.182.47.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F256E0E1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 07:25:31 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E40ADC0438;
 Wed, 27 Nov 2019 07:25:27 +0000 (UTC)
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 8CB20A0066;
 Wed, 27 Nov 2019 07:25:24 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 26 Nov 2019 23:25:19 -0800
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.13.177.249)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 26 Nov 2019 23:25:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZobPUxBiTjGSETfQEk4s7LHIsY7tCJuycaXyA0VWON7vAySgK5mwoSZGBgRvPcGEbeHSpi4WdqfA0Faau3DqpEpXz7VwkVCVs1J7hVCaLIf2nGl7EjwrVvxv+bvlolIHPTT2tnf19NsAUVISsTgfSPXKlKZl0O+O+UCu+Gb9ziuOHmibBtZhUL2FR6X6jM4JHuBc9UK58GrD168Gf9cGdNQ6fD7Dt+7Q9hdknGgs61G95WjoebgBbC1O3SvaC6nxue4iJyvxNzhQhUvyFHNGB77UrxmoCL2S2ZlF06BwwgUZ7x3TbBbpCq7IbW0nfAxHKQvzUyBmObseAWBHtmHC4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KIB8WN8kcTtmMaVAcpwryw7QnEd7y999Jg+j55L0r/Q=;
 b=JWdDTJIzTWtEbYwWhB2cO45qshbOvtH1u/SvceiDkFaNw/fiI9jMpdVdHvN4Z0OXigBn62ePMooWw5F/HK5MUTEcJzD7ZcllFIoyqfcYI7v3tkGzygD3KljTOA3S8M+uA7zpgjyJS0Ey8xagJxTqTNslUFg3RcNagoDU8i59fOx1Z9aLkNqoLd7V93y6F+StyqE63vbp0GHtecpfn4CNfMn1aLaRbW3kDqa8ihGCRpAkhLdXXkN6x/Oj/dKtGaY45lNoiUrWJ8Lu6AIgaNBDZcXnihJuY9wMUTuctLvCqE4I8h63Rdr9KbBpbLbYZsGp6NAqVWQv32FmxkPlpFahxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
Received: from CY4PR1201MB0120.namprd12.prod.outlook.com (10.172.78.14) by
 CY4PR1201MB0263.namprd12.prod.outlook.com (10.172.76.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.21; Wed, 27 Nov 2019 07:25:16 +0000
Received: from CY4PR1201MB0120.namprd12.prod.outlook.com
 ([fe80::dd88:2597:6bfa:9c69]) by CY4PR1201MB0120.namprd12.prod.outlook.com
 ([fe80::dd88:2597:6bfa:9c69%9]) with mapi id 15.20.2474.023; Wed, 27 Nov 2019
 07:25:16 +0000
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>
Subject: RE: [GIT PULL] drm/arc: Minor improvements
Thread-Topic: [GIT PULL] drm/arc: Minor improvements
Thread-Index: AdU84kwKkbpOuRO9SbWDn3t0PURjrxdMyW8wArd+/9A=
Date: Wed, 27 Nov 2019 07:25:16 +0000
Message-ID: <CY4PR1201MB0120689F9B1F454DEEA75ECCA1440@CY4PR1201MB0120.namprd12.prod.outlook.com>
References: <CY4PR1201MB0120FDB10A777345F9C27720A1C90@CY4PR1201MB0120.namprd12.prod.outlook.com>
 <CY4PR1201MB0120267C8184D31C677A6B37A1760@CY4PR1201MB0120.namprd12.prod.outlook.com>
In-Reply-To: <CY4PR1201MB0120267C8184D31C677A6B37A1760@CY4PR1201MB0120.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [84.204.78.101]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0fae25ef-8370-45ef-8fd3-08d7730af354
x-ms-traffictypediagnostic: CY4PR1201MB0263:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB02630F09F965B23D2B4E362DA1440@CY4PR1201MB0263.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:85;
x-forefront-prvs: 023495660C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(396003)(39860400002)(346002)(376002)(136003)(189003)(199004)(13464003)(4326008)(229853002)(76176011)(2906002)(52536014)(966005)(5660300002)(26005)(6506007)(53546011)(110136005)(9686003)(7696005)(102836004)(54906003)(6436002)(316002)(66556008)(3846002)(6116002)(33656002)(186003)(66946007)(71200400001)(55016002)(14444005)(6306002)(6246003)(71190400001)(99286004)(256004)(66476007)(66446008)(8936002)(66066001)(25786009)(81166006)(478600001)(74316002)(14454004)(76116006)(86362001)(11346002)(7736002)(64756008)(305945005)(8676002)(446003)(81156014);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR1201MB0263;
 H:CY4PR1201MB0120.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n0SZx5Edtc1b+dmqxeKeTlbcvLVwK384XztxSHnmNgb/W9P1KqsVB4J+otp0LUQPoRTjTcnRgnrquxApPgIcNnRQ4vZcOA9KdzRfmFQMsSDncw/NOcavFVAfQaXxXn6VxafrqtyhEJtX3BxfnZwVuzKfl/9zgWvxnWm/CAfJoNdP7rxBR4ze/uG9oOTFNyqmb1f7DLXCxDwwgU83yKRKJpuXJqzf2eRxFREXu3cLtWjnDMAucV+N4FIY6B/nMVniAbRGcObgEx8k9OpyBvQFH7ci8R/1+52wXe3d+Yyn7ASGqvlagnAwEZilaLVSGAtvHySiZsvaIYIjSt0sGHEpxpBgCO0eJT6EeCFSY6CLux6ZLMQZl21jZEIoZjeBvwvgZ7NvWMBBPBzBWQv02FyTqzo7mAacFb8zopfbWtaLXavJAcPQLgM0cMM3dpeMA4oE/q68WpbgR4fZw7jr7EMh8NCqBrJkLyya8EIt0/gZqs4=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fae25ef-8370-45ef-8fd3-08d7730af354
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2019 07:25:16.4717 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bCz2CwdFkWlRw1Q7AUFM/UbbLsij/LYK0HswN2RsvowHN6GU5fB8vsQnhN+2I11F0TfqtVzucKoPMh2aNeY4EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0263
X-OriginatorOrg: synopsys.com
X-Mailman-Approved-At: Wed, 27 Nov 2019 08:09:16 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=synopsys.com; s=mail; 
 t=1574839530; bh=pZDjqzYGhYI1PWMP3iyKmo7naPxHu9iYYBNuXMNqWQQ=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=QpCbWpVj0JnJMC5SR66i5/GwSDVO8NqdwDbhZUZ2lgpqkBWZtTamchX6C4upW9s7v
 HgLuA8XFuvVsTLI90UoTy+SXgrvQ8TJ8sinCK9b7Lmy0Ithy6J9eR/Hcxl9QsjgsEd
 ej67pu6Rr2WaIFIN7/sO7GeLXL/gi9OR+vgXMbtEWnYNOTK1qE324kJ1no/wsJS1Gy
 MtKrJUe6+pj7BoW6y7kg7ubPqGjjhgHIEJoTe2UxFxieJMHcoCtb4tI4NghFGAqaJ8
 xUyi5H2GR7JV/CD4yTDu2GIDsmKP8eQEEt3+LaNOlio5azxKXrRxhEM7eOXnvvPa+V
 QhtWUAp2Z438A==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KIB8WN8kcTtmMaVAcpwryw7QnEd7y999Jg+j55L0r/Q=;
 b=TkSI2p16z+NIRX4ti+UQ+KVffIOaopt29c/W67b8juKIslwggKcfvO6kszjmEaeD9Sg9krsq5GR3ioqXjyQGtFN1C8xSsW0PFCL9bWUHy+y6HgfF6xaMM/ADfMaKjG8k90gdy7pmXHCJFlFrKy9onN4gVEKLrO9gfv+m+yTaQbo=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=abrodkin@synopsys.com; 
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
Cc: arcml <linux-snps-arc@lists.infradead.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLCBEYXZpZCEKCkFueSBjaGFuY2UgZm9yIHRoaXMgb25lIHRvIGJlIHByb2Nlc3Nl
ZCBzb21ldGltZSBzb29uPwpJdCdzIGJlZW4gcXVpdGUgc29tZSB0aW1lIHNpbmNlIEp1bHkgd2hl
biBJIGluaXRpYWxseSBzZW50CnRoaXMgcHVsbC1yZXF1ZXN0LgoKLUFsZXhleQoKPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IGxpbnV4LXNucHMtYXJjIDxsaW51eC1zbnBzLWFy
Yy1ib3VuY2VzQGxpc3RzLmluZnJhZGVhZC5vcmc+IE9uIEJlaGFsZiBPZiBBbGV4ZXkgQnJvZGtp
bgo+IFNlbnQ6IFdlZG5lc2RheSwgTm92ZW1iZXIgMTMsIDIwMTkgMjozMCBQTQo+IFRvOiBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+OyBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXgu
aWU+Cj4gQ2M6IGFyY21sIDxsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnPjsgRXVn
ZW5peSBQYWx0c2V2IDxFdWdlbml5LlBhbHRzZXZAc3lub3BzeXMuY29tPjsgZHJpLQo+IGRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFN1YmplY3Q6IFJFOiBbR0lUIFBVTExdIGRybS9hcmM6
IE1pbm9yIGltcHJvdmVtZW50cwo+IAo+IEhpIERhbmllbCwgRGF2aWQsCj4gCj4gPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4gRnJvbTogbGludXgtc25wcy1hcmMgPGxpbnV4LXNucHMt
YXJjLWJvdW5jZXNAbGlzdHMuaW5mcmFkZWFkLm9yZz4gT24gQmVoYWxmIE9mIEFsZXhleSBCcm9k
a2luCj4gPiBTZW50OiBUaHVyc2RheSwgSnVseSAxOCwgMjAxOSAxMjowOSBBTQo+ID4gVG86IERh
bmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD47IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51
eC5pZT4KPiA+IENjOiBhcmNtbCA8bGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZz47
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+IFN1YmplY3Q6IFtHSVQgUFVMTF0g
ZHJtL2FyYzogTWlub3IgaW1wcm92ZW1lbnRzCj4gPgo+ID4gSGkgRGF2ZSwgRGFuaWVsLAo+ID4K
PiA+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgN2FhZGRkOTZkNWZlYmNmNWIy
NDM1N2EzMjZiMzAzOGQ0OWEyMDUzMjoKPiA+Cj4gPiAgIGRybS9tb2RlczogRG9uJ3QgYXBwbHkg
Y21kbGluZSdzIHJvdGF0aW9uIGlmIGl0IHdhc24ndCBzcGVjaWZpZWQgKDIwMTktMDctMTYgMTA6
MzQ6MzggKzAyMDApCj4gPgo+ID4gYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkg
YXQ6Cj4gPgo+ID4gICBnaXRAZ2l0aHViLmNvbTphYnJvZGtpbi9saW51eC5naXQgdGFncy9hcmNw
Z3UtdXBkYXRlcy0yMDE5LjA3LjE4Cj4gPgo+ID4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVw
IHRvIGNlZTE3YTcxNjU2ZTllMWI1ZmZjMDE3Njc4NDQwMjY1NTBkNWY0YTk6Cj4gPgo+ID4gICBk
cm0vYXJjcGd1OiByZXdvcmsgZW5jb2RlciBzZWFyY2ggKDIwMTktMDctMTcgMjM6MzY6NTYgKzAz
MDApCj4gPgo+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gVGhpcyBpcyBhIHByZXR0eSBzaW1wbGUgaW1wcm92ZW1l
bnQgdGhhdCBhbGxvd3MgdG8gZmluZCBlbmNvZGVyCj4gPiBhcyB0aGUgb25lIGFuZCBvbmx5IChB
UkMgUEdVIGRvZXNuJ3Qgc3VwcG9ydCBtb3JlIHRoYW4gb25lKSBlbmRwb2ludAo+ID4gaW5zdGVh
ZCBvZiB1c2luZyBub24tc3RhbmRhcmQgImVuY29kZXItc2xhdmUiIHByb3BlcnR5Lgo+ID4KPiA+
IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KPiA+IEV1Z2VuaXkgUGFsdHNldiAoMSk6Cj4gPiAgICAgICBkcm0vYXJjcGd1OiBy
ZXdvcmsgZW5jb2RlciBzZWFyY2gKPiA+Cj4gPiAgZHJpdmVycy9ncHUvZHJtL2FyYy9hcmNwZ3Vf
ZHJ2LmMgfCAxNiArKysrKysrKysrKysrLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gQW55IGNoYW5jZSBmb3IgdGhpcyBvbmUgdG8g
Z2V0IHB1bGxlZCBpbnRvIHlvdXIgdHJlZShzKSBzb21ldGltZSBzb29uPwo+IAo+IC1BbGV4ZXkK
PiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxp
bnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdAo+IGxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVh
ZC5vcmcKPiBodHRwczovL3VybGRlZmVuc2UucHJvb2Zwb2ludC5jb20vdjIvdXJsP3U9aHR0cC0z
QV9fbGlzdHMuaW5mcmFkZWFkLm9yZ19tYWlsbWFuX2xpc3RpbmZvX2xpbnV4LTJEc25wcy0KPiAy
RGFyYyZkPUR3SUNBZyZjPURQTDZfWF82SmtYRng3QVhXcUIwdGcmcj1scWRlZVNTRWVzMEdGRERs
NjU2ZVZpWE83YnJlUzU1eXRXa2hwazVSODFJJm09ZjNiRlNqczNnWkk5dkMKPiBMSlc1c2E2S3h1
NDN5WFVzQ1hoYVVOaHRFeW1tayZzPWVGTzZtbnc4SUp5ZnJRWllyTUViSi1icnlwbGZ3OUx2Y1lC
U0NFeWo1WEEmZT0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
