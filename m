Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA17B3597
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 09:28:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D6766E854;
	Mon, 16 Sep 2019 07:28:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740138.outbound.protection.outlook.com [40.107.74.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B68716F4B4
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 23:31:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vsaz/xWagGolbbsnU1d/rXIuORXtcp1hfU2+BP5SvpgbSq1pBb096XFO8AIxbJw2sZW1xAZNlgfQv64zyLSmUkzx/qn9ORfRKGsZe6gCHF/yWJZpudTHTTERFFdHJquQ6lNSRFj2AuYIT1Rnr/aSCZOu/+pnvR7YgdtUx/HMbE71IJR+bclQsuV00ZlWu663nyGFGa2JcakdO7W7vMApbTVdQW0eghCmFCAp9hqDCFJQH3+vpDOy6kW8zxu5tzlvTTJb5xadRPQqlowaiU3GEeoXxkNe7x6+CX6vdd0/8ZDAcX6R5b0LfyvXpt2WM555ll/ESLH+u8czax3Znklb9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nn9Nb5DL5E93ZFXy8gh3o47z1kOizl8kYGnHaMonEKM=;
 b=WKqJgKxcZ8ntAvuzpUz2bhRl7jehIiqlzMy1GnxkqB9y1mq9lyWyIx65oy2ADKWUpiXWVYizDNcXnbeQYIwCWM3+6ODd+BTtxMJhky/4jD6xasD6pt423NnoRBHz3NucdOy+/fBw8kmTpqxxciIVG8Mt52KIwN3yjxc9vh1BfihaDFEaZ6l4eaNj/gjnuNxslVVyPfctp5XlShoXgInEUhGXcLpB6+DqBRbACxk2Hqw0np88qTtr2DCoWDd8WwIBIHhjp2J/3IA2mRh0TjRvE15fDo1HVA3bnUWdFq2fHPcZUNRgkLuJ1kG/RcHy1Cr9cx/M1sDXemOXQLvanJHJ8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
Received: from DM5PR21MB0137.namprd21.prod.outlook.com (10.173.173.12) by
 DM5PR21MB0172.namprd21.prod.outlook.com (10.173.173.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.5; Fri, 13 Sep 2019 23:31:42 +0000
Received: from DM5PR21MB0137.namprd21.prod.outlook.com
 ([fe80::7d6d:e809:21df:d028]) by DM5PR21MB0137.namprd21.prod.outlook.com
 ([fe80::7d6d:e809:21df:d028%9]) with mapi id 15.20.2284.008; Fri, 13 Sep 2019
 23:31:42 +0000
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
Subject: RE: [PATCH v5] video: hyperv: hyperv_fb: Support deferred IO for
 Hyper-V frame buffer driver
Thread-Topic: [PATCH v5] video: hyperv: hyperv_fb: Support deferred IO for
 Hyper-V frame buffer driver
Thread-Index: AQHVafjiL2AndauzGUaHnigxWapFw6cqQqIA
Date: Fri, 13 Sep 2019 23:31:42 +0000
Message-ID: <DM5PR21MB013732C4B83792CB49AC27A6D7B30@DM5PR21MB0137.namprd21.prod.outlook.com>
References: <20190913060209.3604-1-weh@microsoft.com>
In-Reply-To: <20190913060209.3604-1-weh@microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=mikelley@ntdev.microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-09-13T23:31:40.5080268Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=38c50c3f-ce84-47e3-add5-7a6a4daaa3ad;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
x-originating-ip: [24.22.167.197]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 50a82dbb-92fd-4211-bbe4-08d738a288b7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR21MB0172; 
x-ms-traffictypediagnostic: DM5PR21MB0172:|DM5PR21MB0172:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR21MB0172B3A4680F5AA14526E3CFD7B30@DM5PR21MB0172.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0159AC2B97
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(136003)(346002)(39860400002)(376002)(396003)(199004)(189003)(110136005)(11346002)(52536014)(10290500003)(99286004)(478600001)(53936002)(76176011)(66946007)(1250700005)(316002)(66476007)(66066001)(55016002)(1511001)(66446008)(64756008)(186003)(446003)(6506007)(26005)(5660300002)(7416002)(102836004)(22452003)(9686003)(33656002)(2906002)(71190400001)(71200400001)(486006)(476003)(6246003)(3846002)(74316002)(2201001)(229853002)(6436002)(76116006)(66556008)(81156014)(7696005)(8990500004)(14454004)(8676002)(8936002)(81166006)(2501003)(7736002)(86362001)(256004)(10090500001)(14444005)(6116002)(305945005)(25786009)(6636002)(921003)(1121003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR21MB0172;
 H:DM5PR21MB0137.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sF8bEA0rHAexyMY8kT2efeLyVAFGgGc+pnJQO9q4KBausKX0+FyFfLUREPQBzPlThGQ/CtoUgrQZ0Zu6gqFqPp81eqiBPocLhmlV/HlHQaSIKRefWX7edxJFmHud1hDZoAKKcrETJ8K1lp68KM8BiK5+k3lGen2KYc6ScydrsVYp4zPJiGwAkBDM19O/AK0ZnNpk5RtD/SYagSAGsStDrKjhkKs9s6BrdaM3QqKhVFYINHK7A8lMY2Jqyt0yAFPZE75sj12NOqQq2ptTrUGWlODAE8ud+bofq0KVUQ69CnvuvWUpb9ampsD2b8aiWe7xEUiGOxLoNYFOgMLoxvUrI7laYegnWmvt3dcIghwPE8vwVI4GR7LliOxbFs9RoocrulgbFPOLraaI8REzrCUu9dmchDoZWg+sdVOOXUqqrMk=
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50a82dbb-92fd-4211-bbe4-08d738a288b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2019 23:31:42.4455 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H81D9WsE3f0OFmSpwmWTdCb+k9y88ko0+2JdBCykWFAij884RvEpnKPUZlqsmhPKtofJwbWTMPU7YhF2C+Q5XteQu2wwWjtFz/N29+aFpJY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR21MB0172
X-Mailman-Approved-At: Mon, 16 Sep 2019 07:28:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nn9Nb5DL5E93ZFXy8gh3o47z1kOizl8kYGnHaMonEKM=;
 b=Kgg6GBMz8Rn2owwagdnzLlysoWqGUWT9+YMO80a04Iitu7iLYI66yA/jlZrzFPAzxnULoBTaElkESB8qgmmiidO/VfKhQkHmKajPqdUjOjs/uZp961/1sZjXgSG4+lLNZeiYibek0c6GYMrJzigAaryNf0+E3Lt/Ah+zIH/YUZI=
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
ciAxMiwgMjAxOSAxMTowMyBQTQo+IAo+IFdpdGhvdXQgZGVmZXJyZWQgSU8gc3VwcG9ydCwgaHlw
ZXJ2X2ZiIGRyaXZlciBpbmZvcm1zIHRoZSBob3N0IHRvIHJlZnJlc2gKPiB0aGUgZW50aXJlIGd1
ZXN0IGZyYW1lIGJ1ZmZlciBhdCBmaXhlZCByYXRlLCBlLmcuIGF0IDIwSHosIG5vIG1hdHRlciB0
aGVyZQo+IGlzIHNjcmVlbiB1cGRhdGUgb3Igbm90LiBUaGlzIHBhdGNoIHN1cHBvcnRzIGRlZmVy
cmVkIElPIGZvciBzY3JlZW5zIGluCj4gZ3JhcGhpY3MgbW9kZSBhbmQgYWxzbyBlbmFibGVzIHRo
ZSBmcmFtZSBidWZmZXIgb24tZGVtYW5kIHJlZnJlc2guIFRoZQo+IGhpZ2hlc3QgcmVmcmVzaCBy
YXRlIGlzIHN0aWxsIHNldCBhdCAyMEh6Lgo+IAo+IEN1cnJlbnRseSBIeXBlci1WIG9ubHkgdGFr
ZXMgYSBwaHlzaWNhbCBhZGRyZXNzIGZyb20gZ3Vlc3QgYXMgdGhlIHN0YXJ0aW5nCj4gYWRkcmVz
cyBvZiBmcmFtZSBidWZmZXIuIFRoaXMgaW1wbGllcyB0aGUgZ3Vlc3QgbXVzdCBhbGxvY2F0ZSBj
b250aWd1b3VzCj4gcGh5c2ljYWwgbWVtb3J5IGZvciBmcmFtZSBidWZmZXIuIEluIGFkZGl0aW9u
LCBIeXBlci1WIEdlbiAyIFZNcyBvbmx5Cj4gYWNjZXB0IGFkZHJlc3MgZnJvbSBNTUlPIHJlZ2lv
biBhcyBmcmFtZSBidWZmZXIgYWRkcmVzcy4gRHVlIHRvIHRoZXNlCj4gbGltaXRhdGlvbnMgb24g
SHlwZXItViBob3N0LCB3ZSBrZWVwIGEgc2hhZG93IGNvcHkgb2YgZnJhbWUgYnVmZmVyCj4gaW4g
dGhlIGd1ZXN0LiBUaGlzIG1lYW5zIG9uZSBtb3JlIGNvcHkgb2YgdGhlIGRpcnR5IHJlY3Rhbmds
ZSBpbnNpZGUKPiBndWVzdCB3aGVuIGRvaW5nIHRoZSBvbi1kZW1hbmQgcmVmcmVzaC4gVGhpcyBj
YW4gYmUgb3B0aW1pemVkIGluIHRoZQo+IGZ1dHVyZSB3aXRoIGhlbHAgZnJvbSBob3N0LiBGb3Ig
bm93IHRoZSBob3N0IHBlcmZvcm1hbmNlIGdhaW4gZnJvbSBkZWZlcnJlZAo+IElPIG91dHdlaWdo
cyB0aGUgc2hhZG93IGNvcHkgaW1wYWN0IGluIHRoZSBndWVzdC4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBXZWkgSHUgPHdlaEBtaWNyb3NvZnQuY29tPgo+IC0tLQo+ICAgICB2MjogSW5jb3Jwb3JhdGVk
IHJldmlldyBjb21tZW50cyBmcm9tIE1pY2hhZWwgS2VsbGV5Cj4gICAgIC0gSW5jcmVhc2VkIGRp
cnR5IHJlY3RhbmdsZSBieSBvbmUgcm93IGluIGRlZmVycmVkIElPIGNhc2Ugd2hlbiBzZW5kaW5n
Cj4gICAgIHRvIEh5cGVyLVYuCj4gICAgIC0gQ29ycmVjdGVkIHRoZSBkaXJ0eSByZWN0YW5nbGUg
c2l6ZSBpbiB0aGUgdGV4dCBtb2RlLgo+ICAgICAtIEFkZGVkIG1vcmUgY29tbWVudHMuCj4gICAg
IC0gT3RoZXIgbWlub3IgY29kZSBjbGVhbnVwcy4KPiAKPiAgICAgdjM6IEluY29ycG9yYXRlZCBt
b3JlIHJldmlldyBjb21tZW50cwo+ICAgICAtIFJlbW92ZWQgYSBmZXcgdW5uZWNlc3NhcnkgdmFy
aWFibGUgdGVzdHMKPiAKPiAgICAgdjQ6IEluY29ycG9yYXRlZCB0ZXN0IGFuZCByZXZpZXcgZmVl
ZGJhY2sgZnJvbSBEZXh1YW4gQ3VpCj4gICAgIC0gTm90IGRpc2FibGUgaW50ZXJydXB0IHdoaWxl
IGFjcXVpcmluZyBkb2NvcHlfbG9jayBpbgo+ICAgICAgIGh2ZmJfdXBkYXRlX3dvcmsoKS4gVGhp
cyBhdm9pZHMgc2lnbmlmaWNhbnQgYm9vdHVwIGRlbGF5IGluCj4gICAgICAgbGFyZ2UgdkNQVSBj
b3VudCBWTXMuCj4gCj4gICAgIHY1OiBDb21wbGV0ZWx5IHJlbW92ZSB0aGUgdW5uZWNlc3Nhcnkg
ZG9jb3B5X2xvY2sgYWZ0ZXIgZGlzY3Vzc2luZwo+ICAgICB3aXRoIERleHVhbiBDdWkuCj4gCgpS
ZXZpZXdlZC1ieTogTWljaGFlbCBLZWxsZXkgPG1pa2VsbGV5QG1pY3Jvc29mdC5jb20+Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
