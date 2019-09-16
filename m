Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CCEB481D
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 09:18:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 924F06EB15;
	Tue, 17 Sep 2019 07:17:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310095.outbound.protection.outlook.com [40.107.131.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A668E6EA8D
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 21:46:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FHX/HT8PfiRc1W7hPZGfjpfPPSxQP7GLA8+dRTv5LnzpTATHzVS9H6y3flm/9RGyk80IpR3/jWv7EaQGX9Tdq9A5U7fUVtwBzpQmRv+ltwUezDCX562DxTMjmoJijhoi5sdYlEwgD0yi/U1cJeNLdf4tCH98S9gDHDd4QHp1SMbWFehw9KTurHhcQGg9srNeZX/Kf0Ycg4WSSyPbF5JAM5BfVG2i0fs5N2wEPMmv0EC5ifV6Xrui+lbUE2yE5rvXTSOpqbXO8mznk7pAaa+HfJp0ZYW2bMmSC+cm1i+R7dD4J95zNnePnWxzloyrKrJphKucLXL3G3yZ3ecCsHWycg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wZrfhKH5K2D4QgBlCAvCP6kIBGUu3MWa/oEZXYyU5XE=;
 b=KM/AfNai6XJoxKmrjNcaqWExdR7ggPgi97D48FwYswS6iZuHgkhNQ168rx63iI4HEwj4iFwBken9fiyngzP1p/PC1snubO5eCBh1Ov9hRoC+KW5k5UeSk3uWHtFztizAlqRDBbh/swsW30k0qvyKvMsLzz5754DWJIUH4tbfdPDRGpy4cjcSyK0WKLBZ+VNdEVBo14GDw0gDuA3MZdmerUVwdU8CvwZCCkiUt5nEwruzEk6zzctUqZtsFjesEthKHq35vckuAo1MVll9kQAX+ddjObxU8wyhZZgoS2W1S2K4v58GhCbW0SK24a4SyVUkIowniPJpQuriPulVO7aoAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
Received: from PU1P153MB0169.APCP153.PROD.OUTLOOK.COM (10.170.189.13) by
 PU1P153MB0201.APCP153.PROD.OUTLOOK.COM (10.170.190.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.3; Mon, 16 Sep 2019 21:46:36 +0000
Received: from PU1P153MB0169.APCP153.PROD.OUTLOOK.COM
 ([fe80::fc44:a784:73e6:c1c2]) by PU1P153MB0169.APCP153.PROD.OUTLOOK.COM
 ([fe80::fc44:a784:73e6:c1c2%8]) with mapi id 15.20.2305.000; Mon, 16 Sep 2019
 21:46:36 +0000
From: Dexuan Cui <decui@microsoft.com>
To: Dexuan Cui <decui@microsoft.com>, Wei Hu <weh@microsoft.com>, Michael
 Kelley <mikelley@microsoft.com>, "rdunlap@infradead.org"
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
 <haiyangz@microsoft.com>, KY Srinivasan <kys@microsoft.com>
Subject: RE: [PATCH v5] video: hyperv: hyperv_fb: Support deferred IO for
 Hyper-V frame buffer driver
Thread-Topic: [PATCH v5] video: hyperv: hyperv_fb: Support deferred IO for
 Hyper-V frame buffer driver
Thread-Index: AQHVafjiL2AndauzGUaHnigxWapFw6cpJzCwgAW1MOA=
Date: Mon, 16 Sep 2019 21:46:35 +0000
Message-ID: <PU1P153MB0169C4B30F86AE8B652A575CBF8C0@PU1P153MB0169.APCP153.PROD.OUTLOOK.COM>
References: <20190913060209.3604-1-weh@microsoft.com>
 <PU1P153MB0169E5E73D258A034B4869DCBFB30@PU1P153MB0169.APCP153.PROD.OUTLOOK.COM>
In-Reply-To: <PU1P153MB0169E5E73D258A034B4869DCBFB30@PU1P153MB0169.APCP153.PROD.OUTLOOK.COM>
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
x-originating-ip: [2001:4898:80e8:a:58f6:aea4:93d:b127]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 795de931-06f2-49bd-57e3-08d73aef592b
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: PU1P153MB0201:|PU1P153MB0201:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PU1P153MB020109B3FCFB04E882C35B1BBF8C0@PU1P153MB0201.APCP153.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0162ACCC24
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(346002)(396003)(39860400002)(366004)(376002)(13464003)(189003)(199004)(66946007)(2501003)(478600001)(8990500004)(6636002)(8676002)(305945005)(7736002)(74316002)(6436002)(10090500001)(1250700005)(53936002)(55016002)(22452003)(486006)(2906002)(81166006)(229853002)(14444005)(256004)(8936002)(6116002)(476003)(46003)(446003)(11346002)(52536014)(25786009)(76116006)(186003)(14454004)(81156014)(6246003)(9686003)(110136005)(71190400001)(71200400001)(316002)(7696005)(2201001)(86362001)(7416002)(33656002)(10290500003)(5660300002)(66446008)(64756008)(66556008)(66476007)(6506007)(76176011)(102836004)(99286004)(53546011)(1511001)(241875001)(921003)(1121003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:PU1P153MB0201;
 H:PU1P153MB0169.APCP153.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZfWMvDSHcfjqDW+II0zqnWUNPmCrHe9B8PnpMk64+0MRiKlopGtSyuT4A8xjVHtSzLpmVKDj/wyFLq6itAREMi46XZkDQ+97QsyQ9otHrtW4d4H9fI52qvfRsTI7ga+VeagbRn8doTqEvsgukvHZ3eTVdsuRh55KyWm45jg3mBevaoq7H+90skvgKD6SU1h3PS5eXtgvRTWGTVVVEGEqO9dIR6Vnpm1R62lOZWuNxO8AgdL2yeVFkg8vo4NEfKY6wUTUVipqIniipJ8FTxPQcD4i+ZgxBS37qBTJZaAJ9w8FrICdMhI/PTtxnE2XrEO8hjAFzbQltdJ9ujr59BCt1fx+7r4ODvr39rodzfnXrhnLgIKcX/49CrULO2anwtti1UM+YUH0JgC+4S3hBea/o+E/++ZBdKW3FOPA+lTnCgM=
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 795de931-06f2-49bd-57e3-08d73aef592b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2019 21:46:35.9974 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GCMS989hu3Wt3OAt/8pn78Ohh9SoSHD5HcDrOh14Fx2diRbhtW6Trk3UZsghO/tOMA9MhDhTgn8hdnMhdzgtFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1P153MB0201
X-Mailman-Approved-At: Tue, 17 Sep 2019 07:17:12 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wZrfhKH5K2D4QgBlCAvCP6kIBGUu3MWa/oEZXYyU5XE=;
 b=huYHTmGJKOfIsyKN30murd2e8ROxPO9VeMx2523dThOGU2KiCH4nDCItNEaarX5ta4RFk2wEfeQWomSyZ5C+RrfaKltHu+IUTmNnmXAnUOAfblX8j0bSUyIRBijzQxtDYvxT6AfIM/z0m9eAzVwSXkB8Q9IX8AfF5TFfrnBk+GU=
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

CgpUaGFua3MsCi0tIERleHVhbgoKPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206
IGxpbnV4LWh5cGVydi1vd25lckB2Z2VyLmtlcm5lbC5vcmcKPiA8bGludXgtaHlwZXJ2LW93bmVy
QHZnZXIua2VybmVsLm9yZz4gT24gQmVoYWxmIE9mIERleHVhbiBDdWkKPiBTZW50OiBUaHVyc2Rh
eSwgU2VwdGVtYmVyIDEyLCAyMDE5IDExOjM4IFBNCj4gVG86IFdlaSBIdSA8d2VoQG1pY3Jvc29m
dC5jb20+OyBNaWNoYWVsIEtlbGxleSA8bWlrZWxsZXlAbWljcm9zb2Z0LmNvbT47Cj4gcmR1bmxh
cEBpbmZyYWRlYWQub3JnOyBzaGNfd29ya0BtYWlsLnJ1OyBncmVna2hAbGludXhmb3VuZGF0aW9u
Lm9yZzsKPiBsZWUuam9uZXNAbGluYXJvLm9yZzsgYWxleGFuZHJlLmJlbGxvbmlAYm9vdGxpbi5j
b207Cj4gYmFpamlhanUxOTkwQGdtYWlsLmNvbTsgZnRoYWluQHRlbGVncmFwaGljcy5jb20uYXU7
IGluZm9AbWV0dXgubmV0Owo+IGxpbnV4LWh5cGVydkB2Z2VyLmtlcm5lbC5vcmc7IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7Cj4gbGludXgtZmJkZXZAdmdlci5rZXJuZWwub3JnOyBs
aW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBzYXNoYWxAa2VybmVsLm9yZzsKPiBTdGVwaGVu
IEhlbW1pbmdlciA8c3RoZW1taW5AbWljcm9zb2Z0LmNvbT47IEhhaXlhbmcgWmhhbmcKPiA8aGFp
eWFuZ3pAbWljcm9zb2Z0LmNvbT47IEtZIFNyaW5pdmFzYW4gPGt5c0BtaWNyb3NvZnQuY29tPgo+
IFN1YmplY3Q6IFJFOiBbUEFUQ0ggdjVdIHZpZGVvOiBoeXBlcnY6IGh5cGVydl9mYjogU3VwcG9y
dCBkZWZlcnJlZCBJTyBmb3IKPiBIeXBlci1WIGZyYW1lIGJ1ZmZlciBkcml2ZXIKPiAKPiA+IEZy
b206IFdlaSBIdSA8d2VoQG1pY3Jvc29mdC5jb20+Cj4gPiBTZW50OiBUaHVyc2RheSwgU2VwdGVt
YmVyIDEyLCAyMDE5IDExOjAzIFBNCj4gPgo+ID4gV2l0aG91dCBkZWZlcnJlZCBJTyBzdXBwb3J0
LCBoeXBlcnZfZmIgZHJpdmVyIGluZm9ybXMgdGhlIGhvc3QgdG8gcmVmcmVzaAo+ID4gdGhlIGVu
dGlyZSBndWVzdCBmcmFtZSBidWZmZXIgYXQgZml4ZWQgcmF0ZSwgZS5nLiBhdCAyMEh6LCBubyBt
YXR0ZXIgdGhlcmUKPiA+IGlzIHNjcmVlbiB1cGRhdGUgb3Igbm90LiBUaGlzIHBhdGNoIHN1cHBv
cnRzIGRlZmVycmVkIElPIGZvciBzY3JlZW5zIGluCj4gPiBncmFwaGljcyBtb2RlIGFuZCBhbHNv
IGVuYWJsZXMgdGhlIGZyYW1lIGJ1ZmZlciBvbi1kZW1hbmQgcmVmcmVzaC4gVGhlCj4gPiBoaWdo
ZXN0IHJlZnJlc2ggcmF0ZSBpcyBzdGlsbCBzZXQgYXQgMjBIei4KPiA+Cj4gPiBDdXJyZW50bHkg
SHlwZXItViBvbmx5IHRha2VzIGEgcGh5c2ljYWwgYWRkcmVzcyBmcm9tIGd1ZXN0IGFzIHRoZSBz
dGFydGluZwo+ID4gYWRkcmVzcyBvZiBmcmFtZSBidWZmZXIuIFRoaXMgaW1wbGllcyB0aGUgZ3Vl
c3QgbXVzdCBhbGxvY2F0ZSBjb250aWd1b3VzCj4gPiBwaHlzaWNhbCBtZW1vcnkgZm9yIGZyYW1l
IGJ1ZmZlci4gSW4gYWRkaXRpb24sIEh5cGVyLVYgR2VuIDIgVk1zIG9ubHkKPiA+IGFjY2VwdCBh
ZGRyZXNzIGZyb20gTU1JTyByZWdpb24gYXMgZnJhbWUgYnVmZmVyIGFkZHJlc3MuIER1ZSB0byB0
aGVzZQo+ID4gbGltaXRhdGlvbnMgb24gSHlwZXItViBob3N0LCB3ZSBrZWVwIGEgc2hhZG93IGNv
cHkgb2YgZnJhbWUgYnVmZmVyCj4gPiBpbiB0aGUgZ3Vlc3QuIFRoaXMgbWVhbnMgb25lIG1vcmUg
Y29weSBvZiB0aGUgZGlydHkgcmVjdGFuZ2xlIGluc2lkZQo+ID4gZ3Vlc3Qgd2hlbiBkb2luZyB0
aGUgb24tZGVtYW5kIHJlZnJlc2guIFRoaXMgY2FuIGJlIG9wdGltaXplZCBpbiB0aGUKPiA+IGZ1
dHVyZSB3aXRoIGhlbHAgZnJvbSBob3N0LiBGb3Igbm93IHRoZSBob3N0IHBlcmZvcm1hbmNlIGdh
aW4gZnJvbSBkZWZlcnJlZAo+ID4gSU8gb3V0d2VpZ2hzIHRoZSBzaGFkb3cgY29weSBpbXBhY3Qg
aW4gdGhlIGd1ZXN0Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFdlaSBIdSA8d2VoQG1pY3Jvc29m
dC5jb20+Cj4gPiAtLS0KPiA+ICAgICB2MjogSW5jb3Jwb3JhdGVkIHJldmlldyBjb21tZW50cyBm
cm9tIE1pY2hhZWwgS2VsbGV5Cj4gPiAgICAgLSBJbmNyZWFzZWQgZGlydHkgcmVjdGFuZ2xlIGJ5
IG9uZSByb3cgaW4gZGVmZXJyZWQgSU8gY2FzZSB3aGVuIHNlbmRpbmcKPiA+ICAgICB0byBIeXBl
ci1WLgo+ID4gICAgIC0gQ29ycmVjdGVkIHRoZSBkaXJ0eSByZWN0YW5nbGUgc2l6ZSBpbiB0aGUg
dGV4dCBtb2RlLgo+ID4gICAgIC0gQWRkZWQgbW9yZSBjb21tZW50cy4KPiA+ICAgICAtIE90aGVy
IG1pbm9yIGNvZGUgY2xlYW51cHMuCj4gPgo+ID4gICAgIHYzOiBJbmNvcnBvcmF0ZWQgbW9yZSBy
ZXZpZXcgY29tbWVudHMKPiA+ICAgICAtIFJlbW92ZWQgYSBmZXcgdW5uZWNlc3NhcnkgdmFyaWFi
bGUgdGVzdHMKPiA+Cj4gPiAgICAgdjQ6IEluY29ycG9yYXRlZCB0ZXN0IGFuZCByZXZpZXcgZmVl
ZGJhY2sgZnJvbSBEZXh1YW4gQ3VpCj4gPiAgICAgLSBOb3QgZGlzYWJsZSBpbnRlcnJ1cHQgd2hp
bGUgYWNxdWlyaW5nIGRvY29weV9sb2NrIGluCj4gPiAgICAgICBodmZiX3VwZGF0ZV93b3JrKCku
IFRoaXMgYXZvaWRzIHNpZ25pZmljYW50IGJvb3R1cCBkZWxheSBpbgo+ID4gICAgICAgbGFyZ2Ug
dkNQVSBjb3VudCBWTXMuCj4gPgo+ID4gICAgIHY1OiBDb21wbGV0ZWx5IHJlbW92ZSB0aGUgdW5u
ZWNlc3NhcnkgZG9jb3B5X2xvY2sgYWZ0ZXIgZGlzY3Vzc2luZwo+ID4gICAgIHdpdGggRGV4dWFu
IEN1aS4KPiAKPiBUaGFua3MhIExvb2tzIGdvb2QgdG8gbWUuCj4gCj4gUmV2aWV3ZWQtYnk6IERl
eHVhbiBDdWkgPGRlY3VpQG1pY3Jvc29mdC5jb20+CgoKSGkgV2VpLApJdCB0dXJucyBvdXQgd2Ug
bmVlZCB0byBtYWtlIGEgZnVydGhlciBmaXguIDotKQoKVGhlIHBhdGNoIGZvcmdldHMgdG8gdGFr
ZSBwYXItPnVwZGF0ZSBpbnRvIGNvbnNpZGVyYXRpb24uCgpXaGVuIHRoZSBWTSBDb25uZWN0aW9u
IHdpbmRvdyBpcyBjbG9zZWQgKG9yIG1pbmltaXplZD8pLAp0aGUgaG9zdCBzZW5kcyBhIG1lc3Nh
Z2UgdG8gdGhlIGd1ZXN0LCBhbmQgdGhlIGd1ZXN0IHNldHMKcGFyLT51cGRhdGUgdG8gZmFsc2Ug
aW4gc3ludGh2aWRfcmVjdl9zdWIoKS4KCklmIHBhci0+dXBkYXRlIGlzIGZhbHNlLCB0aGUgZ3Vl
c3QgZG9lc24ndCBuZWVkIHRvIGNhbGwKc3ludGh2aWRfdXBkYXRlKCkuCgpUaGFua3MsCi0tIERl
eHVhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
