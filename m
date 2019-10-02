Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F41ECB55E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 09:40:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A19D6EAE4;
	Fri,  4 Oct 2019 07:39:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300105.outbound.protection.outlook.com [40.107.130.105])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 851A46E8D8
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 07:52:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IblUSxUBtvMvaoOKBnbOKPBb4qBtRnrE59T27aTmxIlF/d3Ni//S2a/oeEjM4M82Cm5uKpffKcspo8ZiMbZRUHl62DSPXI9Cj+XKTNoA5jqIWhjX8h7RA69Jh4jraJi6+Jm4D3IPboloW6qAUMS5hdeu5mrfOCtS2im/Ba24iKqVAXYAscICOJcRojWguUCD+dxBKX4OiDKcs9DWsBf+mSDUT8HfIoHvLTY5EAof131NpoP5RLksvELYr7wvc0R7A40W8Kbg5kNjw1aDVlAV9JVdUaWr1DHRdQ9OmGgBEZnnMqTRuoGskzqsqrebr1RtuB6C4sbYcPOBuAcIoXOfhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZXDa3z7CtxUM0rT/KWg5xdmUMq6f1lZL1bcExHOoPkk=;
 b=n0E6xHgTabBo9sytKmU50Nt/cdTEQuR0CQ5bwhcyi9O10ZF85WBaJXJRxacmMedUxqAkAmZbnfd9wJB29t6U6ZvV7YwVPox5nyNET0Tkm65Sz0aARSy6W+s5WSgjQtXXcuAfVOeW/kRiieH0FSesULM3/jsOUWAAezsNP1YyBGqobo0w6M2pe9EZTDwzhcWtVwECgPx2IXyC7w5t5wvbOJSWAK6myYF/KXkSGZST3X49/0GwiKllV8UPwrrPsnuKBaF/4Uiw+9Od0XPF93NVF1lA0ezAkKzb99FaEAOl/ySN4V7pT9oYBSosIL0FU+tAm2VcPGn659WPCM4Bw/3Q6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
Received: from PU1P153MB0169.APCP153.PROD.OUTLOOK.COM (10.170.189.13) by
 PU1P153MB0155.APCP153.PROD.OUTLOOK.COM (10.170.189.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.6; Wed, 2 Oct 2019 07:52:27 +0000
Received: from PU1P153MB0169.APCP153.PROD.OUTLOOK.COM
 ([fe80::fc44:a784:73e6:c1c2]) by PU1P153MB0169.APCP153.PROD.OUTLOOK.COM
 ([fe80::fc44:a784:73e6:c1c2%7]) with mapi id 15.20.2327.009; Wed, 2 Oct 2019
 07:52:27 +0000
From: Dexuan Cui <decui@microsoft.com>
To: Sasha Levin <sashal@kernel.org>, Wei Hu <weh@microsoft.com>
Subject: RE: [PATCH v5] video: hyperv: hyperv_fb: Support deferred IO for
 Hyper-V frame buffer driver
Thread-Topic: [PATCH v5] video: hyperv: hyperv_fb: Support deferred IO for
 Hyper-V frame buffer driver
Thread-Index: AQHVeIhjL2AndauzGUaHnigxWapFw6dG+x3A
Date: Wed, 2 Oct 2019 07:52:27 +0000
Message-ID: <PU1P153MB0169724E7E7432F1100EE96ABF9C0@PU1P153MB0169.APCP153.PROD.OUTLOOK.COM>
References: <20190913060209.3604-1-weh@microsoft.com>
 <20191001184526.GE8171@sasha-vm>
In-Reply-To: <20191001184526.GE8171@sasha-vm>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=decui@microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-10-02T07:52:24.4667624Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=547f0316-4218-4dff-a043-6acef2fda046;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
x-originating-ip: [2601:600:a280:7f70:24b0:cdff:a7c5:c70f]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5ddb93dd-ff4c-4817-4f16-08d7470d785e
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: PU1P153MB0155:|PU1P153MB0155:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PU1P153MB015560A70E66A6DB5323DBAABF9C0@PU1P153MB0155.APCP153.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0178184651
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(346002)(366004)(136003)(39860400002)(376002)(199004)(189003)(55016002)(2906002)(22452003)(316002)(10290500003)(6506007)(53546011)(305945005)(7736002)(102836004)(33656002)(10090500001)(54906003)(4326008)(52536014)(7416002)(71200400001)(110136005)(71190400001)(8990500004)(5660300002)(186003)(1511001)(14454004)(25786009)(6436002)(14444005)(81166006)(229853002)(8936002)(8676002)(81156014)(256004)(76176011)(476003)(107886003)(6636002)(486006)(86362001)(74316002)(478600001)(66446008)(76116006)(9686003)(6116002)(64756008)(66556008)(66476007)(66946007)(46003)(99286004)(6246003)(11346002)(446003)(7696005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:PU1P153MB0155;
 H:PU1P153MB0169.APCP153.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mM/Ca0HXHoT5UU4mA4rQPX099PlOd+8hm2k4TvZxjEp9/PBGWed3MtI4YFlTV49rqAx449pMH61ntS+upZgSSRjUS9MUD3iZdJhCxFGEsbYI32PHH3+0wpfFV5yCvbgwu+BDS+MFAIfUX3c3aISv4rXCz1sG0vbMUQ1XshxI/J5va5isvkrAF8tpjaB/73ER1E9uKaLkhGssMhYRJ3+gPvZoB714YSEFkv7JZWwzpAuCUfBIMIIMC6XdBPTqxMdXpIbVXJifjp9BvadnSIwR8HsFY3gw9roD4tj3lTuSjTP4bNZuRgOmpDb4XMKywOYBjk0os86EIvsFs3aE+P7l1bj5tlWbeEb5QH4SXSVoSu3QxU/mKynoyPDEEzlhlOSRUbhhcddFkTQHaeJlPQ2BAboHVP5ygWpbHPT0Hx58kAs=
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ddb93dd-ff4c-4817-4f16-08d7470d785e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2019 07:52:27.1050 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0axoKhLk+q2SVIQHMNQEKEPlRgotOGo0gjgNh9Y+iJE2hCN6KQLFLXouY9uLUmoDXzg3/QOEfDKi0qSIFpWbUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1P153MB0155
X-Mailman-Approved-At: Fri, 04 Oct 2019 07:38:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZXDa3z7CtxUM0rT/KWg5xdmUMq6f1lZL1bcExHOoPkk=;
 b=I4sE+0YQOxQ6S+JXHL+lLFHzscByD3bWbRxeC5B6um7Gh8eqS5wyQnyf8ugNez9bYVpspDQU4trmn+bsORzBUuhfYmmoJZywrFKEF3H6PA79e5IXN30aH+YH5UeTwbFwq9n/Y3D/61gaHMmIW+1CT42CPk9f8mXSH1/DnxBv3lU=
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
 Stephen Hemminger <sthemmin@microsoft.com>,
 "shc_work@mail.ru" <shc_work@mail.ru>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "fthain@telegraphics.com.au" <fthain@telegraphics.com.au>,
 Michael Kelley <mikelley@microsoft.com>,
 "baijiaju1990@gmail.com" <baijiaju1990@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 KY Srinivasan <kys@microsoft.com>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBGcm9tOiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Cj4gU2VudDogVHVlc2RheSwg
T2N0b2JlciAxLCAyMDE5IDExOjQ1IEFNCj4gVG86IFdlaSBIdSA8d2VoQG1pY3Jvc29mdC5jb20+
Cj4gCj4gT24gRnJpLCBTZXAgMTMsIDIwMTkgYXQgMDY6MDI6NTVBTSArMDAwMCwgV2VpIEh1IHdy
b3RlOgo+ID5XaXRob3V0IGRlZmVycmVkIElPIHN1cHBvcnQsIGh5cGVydl9mYiBkcml2ZXIgaW5m
b3JtcyB0aGUgaG9zdCB0byByZWZyZXNoCj4gPnRoZSBlbnRpcmUgZ3Vlc3QgZnJhbWUgYnVmZmVy
IGF0IGZpeGVkIHJhdGUsIGUuZy4gYXQgMjBIeiwgbm8gbWF0dGVyIHRoZXJlCj4gPmlzIHNjcmVl
biB1cGRhdGUgb3Igbm90LiBUaGlzIHBhdGNoIHN1cHBvcnRzIGRlZmVycmVkIElPIGZvciBzY3Jl
ZW5zIGluCj4gPmdyYXBoaWNzIG1vZGUgYW5kIGFsc28gZW5hYmxlcyB0aGUgZnJhbWUgYnVmZmVy
IG9uLWRlbWFuZCByZWZyZXNoLiBUaGUKPiA+aGlnaGVzdCByZWZyZXNoIHJhdGUgaXMgc3RpbGwg
c2V0IGF0IDIwSHouCj4gPgo+ID5DdXJyZW50bHkgSHlwZXItViBvbmx5IHRha2VzIGEgcGh5c2lj
YWwgYWRkcmVzcyBmcm9tIGd1ZXN0IGFzIHRoZSBzdGFydGluZwo+ID5hZGRyZXNzIG9mIGZyYW1l
IGJ1ZmZlci4gVGhpcyBpbXBsaWVzIHRoZSBndWVzdCBtdXN0IGFsbG9jYXRlIGNvbnRpZ3VvdXMK
PiA+cGh5c2ljYWwgbWVtb3J5IGZvciBmcmFtZSBidWZmZXIuIEluIGFkZGl0aW9uLCBIeXBlci1W
IEdlbiAyIFZNcyBvbmx5Cj4gPmFjY2VwdCBhZGRyZXNzIGZyb20gTU1JTyByZWdpb24gYXMgZnJh
bWUgYnVmZmVyIGFkZHJlc3MuIER1ZSB0byB0aGVzZQo+ID5saW1pdGF0aW9ucyBvbiBIeXBlci1W
IGhvc3QsIHdlIGtlZXAgYSBzaGFkb3cgY29weSBvZiBmcmFtZSBidWZmZXIKPiA+aW4gdGhlIGd1
ZXN0LiBUaGlzIG1lYW5zIG9uZSBtb3JlIGNvcHkgb2YgdGhlIGRpcnR5IHJlY3RhbmdsZSBpbnNp
ZGUKPiA+Z3Vlc3Qgd2hlbiBkb2luZyB0aGUgb24tZGVtYW5kIHJlZnJlc2guIFRoaXMgY2FuIGJl
IG9wdGltaXplZCBpbiB0aGUKPiA+ZnV0dXJlIHdpdGggaGVscCBmcm9tIGhvc3QuIEZvciBub3cg
dGhlIGhvc3QgcGVyZm9ybWFuY2UgZ2FpbiBmcm9tIGRlZmVycmVkCj4gPklPIG91dHdlaWdocyB0
aGUgc2hhZG93IGNvcHkgaW1wYWN0IGluIHRoZSBndWVzdC4KPiA+Cj4gPlNpZ25lZC1vZmYtYnk6
IFdlaSBIdSA8d2VoQG1pY3Jvc29mdC5jb20+Cj4gCj4gV2hhdCB0cmVlIGlzIHRoaXMgYmFzZWQg
b24/IEkgY2FuJ3QgZ2V0IGl0IHRvIGFwcGx5Lgo+IAo+IFRoYW5rcywKPiBTYXNoYQoKUGxlYXNl
IHVzZSBXZWkncyB2NiBwYXRjaCwgd2hpY2ggY2FuIGFwcGx5IG9uIHRvZGF5J3MgaHlwZXJ2L2xp
bnV4LmdpdC9zIGh5cGVydi1uZXh0IGJyYW5jaC4KClRoYW5rcywKLS0gRGV4dWFuCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
