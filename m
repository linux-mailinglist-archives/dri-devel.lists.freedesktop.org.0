Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D58410C4EC
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 09:22:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA78A6E5FE;
	Thu, 28 Nov 2019 08:22:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay-out1.synopsys.com (us03-smtprelay2.synopsys.com
 [149.117.87.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 510676E4DE
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 09:39:59 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5EC3AC0090;
 Wed, 27 Nov 2019 09:39:57 +0000 (UTC)
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 51357A006A;
 Wed, 27 Nov 2019 09:39:55 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.13.188.44) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 27 Nov 2019 01:39:52 -0800
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (10.13.177.249)
 by mrs.synopsys.com (10.13.188.44) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 27 Nov 2019 01:39:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LBKbFkXt3+aYe+B1kU8qug3hUb2ZuS2lo7MEx19QPoF47rz8dK2pcY3gB8uWvFQKif8SrSJw1aAudD2PZVq6aGdk/0PeV1MTDoAnqzU6QEokbN5M28SqtYEnrsnXemCSclghuuZBZMG1Mfh1h77gk2G8GUE72Vt1BX1y0Paj5OVHkEt+dcwzdG9ralOh2hAJcL8wpI2KkzLdfmNSQu1GTYDf+j82MySRQzas4B0akGzJ5eACAawD8NDWBxZVuyxM8g+RaV1I5gU+XtS6/WTbf4KF1Zv7IhEwWLBD3Dm5i15GKKcBW+JEnMFWBYM6ZKTLDBWj3YlS1DY8RRvoe8jDzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g9B1/Y0ZjnXTKD343URo+Bd9wQ6K0js/yZFVwcRuzWc=;
 b=eCEVq2CfUbVfFOR9OkeSBdM0iNZRh0dKS0hxaKnQjPrbioXz0HZXQMb+1UOMPW944BxLF3chBIFHlleqh81M4DQ49rdSUBqQP1o8KkbiMuysg+8jOFM0PVmlu7J2B1x6OzCh2cDg5jjYc3TnvqC0vKFP6R1jPM6v+WFWk/vWEWVNKNb/gghJ5MmlIIgPScY6e1zFR/Lep9WyuKGPJH6qXf6omIYd36AKUVL5o+4O5ctRTztZV/4SJ3sZDMm1v8ZjxS8nmzhVCigKSgcNgoy9JWjKvgOZBr90g4KBSgzL2plV7U8IjgNT57lNHbT0h4Zsi+LbVBmMa/DImC1PAGmBOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
Received: from CY4PR1201MB0120.namprd12.prod.outlook.com (10.172.78.14) by
 CY4PR1201MB2549.namprd12.prod.outlook.com (10.172.121.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.22; Wed, 27 Nov 2019 09:39:51 +0000
Received: from CY4PR1201MB0120.namprd12.prod.outlook.com
 ([fe80::dd88:2597:6bfa:9c69]) by CY4PR1201MB0120.namprd12.prod.outlook.com
 ([fe80::dd88:2597:6bfa:9c69%9]) with mapi id 15.20.2474.023; Wed, 27 Nov 2019
 09:39:51 +0000
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: Sean Paul <sean@poorly.run>, Maxime Ripard <mripard@kernel.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>
Subject: RE: [GIT PULL] drm/arc: Minor improvements
Thread-Topic: [GIT PULL] drm/arc: Minor improvements
Thread-Index: AdU84kwKkbpOuRO9SbWDn3t0PURjrxdMyW8wArd+/9AABLZqcA==
Date: Wed, 27 Nov 2019 09:39:50 +0000
Message-ID: <CY4PR1201MB0120FFA559EAF0C4A773D266A1440@CY4PR1201MB0120.namprd12.prod.outlook.com>
References: <CY4PR1201MB0120FDB10A777345F9C27720A1C90@CY4PR1201MB0120.namprd12.prod.outlook.com>
 <CY4PR1201MB0120267C8184D31C677A6B37A1760@CY4PR1201MB0120.namprd12.prod.outlook.com>
 <CY4PR1201MB0120689F9B1F454DEEA75ECCA1440@CY4PR1201MB0120.namprd12.prod.outlook.com>
In-Reply-To: <CY4PR1201MB0120689F9B1F454DEEA75ECCA1440@CY4PR1201MB0120.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [84.204.78.101]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d088d25-33df-4a5e-5543-08d7731dc030
x-ms-traffictypediagnostic: CY4PR1201MB2549:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB2549C216B0537C95EA0885E0A1440@CY4PR1201MB2549.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:85;
x-forefront-prvs: 023495660C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(376002)(346002)(396003)(366004)(136003)(13464003)(53754006)(189003)(199004)(11346002)(6506007)(71200400001)(53546011)(446003)(71190400001)(6306002)(9686003)(14454004)(55016002)(26005)(107886003)(66066001)(4326008)(66946007)(52536014)(74316002)(76116006)(229853002)(66556008)(66446008)(86362001)(2906002)(64756008)(81156014)(966005)(102836004)(5660300002)(7736002)(6116002)(99286004)(3846002)(66476007)(6246003)(2940100002)(186003)(6436002)(25786009)(478600001)(305945005)(14444005)(256004)(110136005)(76176011)(8676002)(7696005)(8936002)(33656002)(316002)(54906003)(81166006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR1201MB2549;
 H:CY4PR1201MB0120.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GbvfTCMUOuAcDknECk4tl6yIkzzo/AhEIQOnByZb/73DZkY+Zc4I2hw1a1BOrKi27HXomyTrsCJUuS50ecq5vXonZgDvWpwVXZ7yg9psF1l8gSuyerSHnX9njR0cySwZUVMt6JALqIsl+g2PRUOZfX9jOVYULyQ/c02Sc6uiSUIZQutBYRL7fx1RIb5O2FpOAV/wNcIMI1kCcvyprZENZT6fSbKw2lEPo3ws8VzezgfSLAlTMoOdJGWR5+odKO0NeiZSn1+BrEKrCe39A+EwrLvj/QEaulFwT6u7/QQYW1whhxbIs8ahXF83HIg9PQ5y2u+lC+w0Ti8sYDRrUKTSotPDL/+PRlBEHNoma4T71rHKDgAfgNcJaTIPI7Gd7oY1WfIgV4MHy2H6x+wCknUPqBkzvzbeuPA4sj19eLc8PRh+C/esv/hMNVrIl84KAmUgpECnGvSGjZ0W7cjHSmqOhr3RskhzkqG83XQrQccdQYE=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d088d25-33df-4a5e-5543-08d7731dc030
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2019 09:39:51.0164 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A4U8DEtsJUfSxKEeOI21uwAQzoHRSqG011EeXxqnJa36rlvIupwNKX8/onsFgt0Y/lIQBLhp10zdd+1OY+XraA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2549
X-OriginatorOrg: synopsys.com
X-Mailman-Approved-At: Thu, 28 Nov 2019 08:22:47 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=synopsys.com; s=mail; 
 t=1574847598; bh=q0EVu3au/0Kg2Sc+OpEIkaiO+2CcVlJTcRhKAznmZqc=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=i29fGQp4Ph/poHAGtgJ/pkVwqPRXggITW0Uy9d885wPmJR0WeKGf8b72I8UElvZ5S
 pbAx4VwnNcSyColWB6ih69WQTr/tYsM9zapUPH0SWbj9gGy5oN2Twhd5Y8PeFULyVr
 7dLXAycaVEDd/Wh4kLPzeRs2cCBGYFFTPhbjYS5HCHQFQNsLiTnwBYWstrDSxDeRf6
 QdEQ4tgIPCcu14F4QvDah1oZtvczJ8tTb1GAg5ajdTDrx9PEggdOaLdY5mEdiH6+f5
 6AUO0fbmB4rPV1T9cNLit7/Qrn/lFndcOBGaYV70df+kj6/iuR62bnRWLBYF+/knfp
 0FJ31VF3pncOg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g9B1/Y0ZjnXTKD343URo+Bd9wQ6K0js/yZFVwcRuzWc=;
 b=GExze4DJV+pjFoq70L9x8wKzuuXEkMxQQXidAy66sdxk3B2ujw8hXycynhXA+A6DYlJWdfNI9eBpHwzW2Z7avLBSzXFm6tRmO5PtdoCWidV7MeukmEui0K3dPT11sSFIO1h7sNjXhGKrLCY/l3mln9o/Eo/xgO5o6fgDQV1smvw=
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
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, David  Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgYWxsLAoKQXMgSm9zZSBzdWdnZXN0ZWQgSSdtIGFkZGluZyAiZHJtLW1pc2MiIG1haW50YWlu
ZXJzIGFzIHRoYXQgdHJlZQptaWdodCBiZSBhIGJldHRlciBmaXQgZm9yIEFSQyBQR1UgcGF0Y2hl
cy4KCi1BbGV4ZXkKCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiBGcm9tOiBsaW51eC1z
bnBzLWFyYyA8bGludXgtc25wcy1hcmMtYm91bmNlc0BsaXN0cy5pbmZyYWRlYWQub3JnPiBPbiBC
ZWhhbGYgT2YgQWxleGV5IEJyb2RraW4KPiBTZW50OiBXZWRuZXNkYXksIE5vdmVtYmVyIDI3LCAy
MDE5IDEwOjI1IEFNCj4gVG86IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD47IERhdmlk
IEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogYXJjbWwgPGxpbnV4LXNucHMtYXJjQGxp
c3RzLmluZnJhZGVhZC5vcmc+OyBFdWdlbml5IFBhbHRzZXYgPHBhbHRzZXZAc3lub3BzeXMuY29t
PjsgZHJpLQo+IGRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFN1YmplY3Q6IFJFOiBbR0lU
IFBVTExdIGRybS9hcmM6IE1pbm9yIGltcHJvdmVtZW50cwo+IAo+IEhpIERhbmllbCwgRGF2aWQh
Cj4gCj4gQW55IGNoYW5jZSBmb3IgdGhpcyBvbmUgdG8gYmUgcHJvY2Vzc2VkIHNvbWV0aW1lIHNv
b24/Cj4gSXQncyBiZWVuIHF1aXRlIHNvbWUgdGltZSBzaW5jZSBKdWx5IHdoZW4gSSBpbml0aWFs
bHkgc2VudAo+IHRoaXMgcHVsbC1yZXF1ZXN0Lgo+IAo+IC1BbGV4ZXkKPiAKPiA+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tCj4gPiBGcm9tOiBsaW51eC1zbnBzLWFyYyA8bGludXgtc25wcy1h
cmMtYm91bmNlc0BsaXN0cy5pbmZyYWRlYWQub3JnPiBPbiBCZWhhbGYgT2YgQWxleGV5IEJyb2Rr
aW4KPiA+IFNlbnQ6IFdlZG5lc2RheSwgTm92ZW1iZXIgMTMsIDIwMTkgMjozMCBQTQo+ID4gVG86
IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD47IERhdmlkIEFpcmxpZSA8YWlybGllZEBs
aW51eC5pZT4KPiA+IENjOiBhcmNtbCA8bGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9y
Zz47IEV1Z2VuaXkgUGFsdHNldiA8RXVnZW5peS5QYWx0c2V2QHN5bm9wc3lzLmNvbT47IGRyaS0K
PiA+IGRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gU3ViamVjdDogUkU6IFtHSVQgUFVM
TF0gZHJtL2FyYzogTWlub3IgaW1wcm92ZW1lbnRzCj4gPgo+ID4gSGkgRGFuaWVsLCBEYXZpZCwK
PiA+Cj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiA+IEZyb206IGxpbnV4LXNu
cHMtYXJjIDxsaW51eC1zbnBzLWFyYy1ib3VuY2VzQGxpc3RzLmluZnJhZGVhZC5vcmc+IE9uIEJl
aGFsZiBPZiBBbGV4ZXkgQnJvZGtpbgo+ID4gPiBTZW50OiBUaHVyc2RheSwgSnVseSAxOCwgMjAx
OSAxMjowOSBBTQo+ID4gPiBUbzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPjsgRGF2
aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+ID4gPiBDYzogYXJjbWwgPGxpbnV4LXNucHMt
YXJjQGxpc3RzLmluZnJhZGVhZC5vcmc+OyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4gPiA+IFN1YmplY3Q6IFtHSVQgUFVMTF0gZHJtL2FyYzogTWlub3IgaW1wcm92ZW1lbnRzCj4g
PiA+Cj4gPiA+IEhpIERhdmUsIERhbmllbCwKPiA+ID4KPiA+ID4gVGhlIGZvbGxvd2luZyBjaGFu
Z2VzIHNpbmNlIGNvbW1pdCA3YWFkZGQ5NmQ1ZmViY2Y1YjI0MzU3YTMyNmIzMDM4ZDQ5YTIwNTMy
Ogo+ID4gPgo+ID4gPiAgIGRybS9tb2RlczogRG9uJ3QgYXBwbHkgY21kbGluZSdzIHJvdGF0aW9u
IGlmIGl0IHdhc24ndCBzcGVjaWZpZWQgKDIwMTktMDctMTYgMTA6MzQ6MzggKzAyMDApCj4gPiA+
Cj4gPiA+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Ogo+ID4gPgo+ID4g
PiAgIGdpdEBnaXRodWIuY29tOmFicm9ka2luL2xpbnV4LmdpdCB0YWdzL2FyY3BndS11cGRhdGVz
LTIwMTkuMDcuMTgKPiA+ID4KPiA+ID4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIGNl
ZTE3YTcxNjU2ZTllMWI1ZmZjMDE3Njc4NDQwMjY1NTBkNWY0YTk6Cj4gPiA+Cj4gPiA+ICAgZHJt
L2FyY3BndTogcmV3b3JrIGVuY29kZXIgc2VhcmNoICgyMDE5LTA3LTE3IDIzOjM2OjU2ICswMzAw
KQo+ID4gPgo+ID4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiA+IFRoaXMgaXMgYSBwcmV0dHkgc2ltcGxlIGltcHJv
dmVtZW50IHRoYXQgYWxsb3dzIHRvIGZpbmQgZW5jb2Rlcgo+ID4gPiBhcyB0aGUgb25lIGFuZCBv
bmx5IChBUkMgUEdVIGRvZXNuJ3Qgc3VwcG9ydCBtb3JlIHRoYW4gb25lKSBlbmRwb2ludAo+ID4g
PiBpbnN0ZWFkIG9mIHVzaW5nIG5vbi1zdGFuZGFyZCAiZW5jb2Rlci1zbGF2ZSIgcHJvcGVydHku
Cj4gPiA+Cj4gPiA+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ID4gRXVnZW5peSBQYWx0c2V2ICgxKToKPiA+ID4gICAg
ICAgZHJtL2FyY3BndTogcmV3b3JrIGVuY29kZXIgc2VhcmNoCj4gPiA+Cj4gPiA+ICBkcml2ZXJz
L2dwdS9kcm0vYXJjL2FyY3BndV9kcnYuYyB8IDE2ICsrKysrKysrKysrKystLS0KPiA+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ID4KPiA+IEFu
eSBjaGFuY2UgZm9yIHRoaXMgb25lIHRvIGdldCBwdWxsZWQgaW50byB5b3VyIHRyZWUocykgc29t
ZXRpbWUgc29vbj8KPiA+Cj4gPiAtQWxleGV5Cj4gPgo+ID4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IGxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlz
dAo+ID4gbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gaHR0cHM6Ly91cmxk
ZWZlbnNlLnByb29mcG9pbnQuY29tL3YyL3VybD91PWh0dHAtM0FfX2xpc3RzLmluZnJhZGVhZC5v
cmdfbWFpbG1hbl9saXN0aW5mb19saW51eC0KPiAyRHNucHMtCj4gPgo+IDJEYXJjJmQ9RHdJQ0Fn
JmM9RFBMNl9YXzZKa1hGeDdBWFdxQjB0ZyZyPWxxZGVlU1NFZXMwR0ZERGw2NTZlVmlYTzdicmVT
NTV5dFdraHBrNVI4MUkmbT1mM2JGU2pzM2daSTl2Qwo+ID4gTEpXNXNhNkt4dTQzeVhVc0NYaGFV
Tmh0RXltbWsmcz1lRk82bW53OElKeWZyUVpZck1FYkotYnJ5cGxmdzlMdmNZQlNDRXlqNVhBJmU9
Cj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBs
aW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKPiBsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRl
YWQub3JnCj4gaHR0cHM6Ly91cmxkZWZlbnNlLnByb29mcG9pbnQuY29tL3YyL3VybD91PWh0dHAt
M0FfX2xpc3RzLmluZnJhZGVhZC5vcmdfbWFpbG1hbl9saXN0aW5mb19saW51eC0yRHNucHMtCj4g
MkRhcmMmZD1Ed0lDQWcmYz1EUEw2X1hfNkprWEZ4N0FYV3FCMHRnJnI9bHFkZWVTU0VlczBHRkRE
bDY1NmVWaVhPN2JyZVM1NXl0V2tocGs1UjgxSSZtPWM4RGhDTDhfLQo+IDBpWTJ0UzM1bzhrcER5
dmJIWl9DdTc2MnM0cXRuMmhEVmcmcz1zR0ZhRFQ3eVBJYlZjalc0OUVfcmpiNk5EODJOcnEwa3Bs
WWpienRsaDNBJmU9Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
