Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F570B4813
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 09:17:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB8EB6EAFD;
	Tue, 17 Sep 2019 07:17:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300092.outbound.protection.outlook.com [40.107.130.92])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B216EA8D
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 21:48:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BK0FL6sy4V0DH4/YHJzx1jnSHOwr0VzmdRv4Nxb3lJHJ7xPF/UomT6kYLEXsRm0M1O8aHN0ZJE9opuXwH7KFQmU5RCZ6jc+iilFTWBwCPhLhGVbWSWorVlPyCiz52F9IAueclXXoifmslhq6Q6OAhV7wLa3Ey+UsUjnT4w0W3GV5jl9rW36jFLRqttRRJcYX5k+5s9QuqA4JDd5Tv+g5Eh0NVD1oYzJnRtTO0upY9y+3ih56vfZ8x7by7qn8IqWOmOYX3/scxPGUxAZdeKmDAA+QSfgasajOHp9W4ksL69GpG0r2oFeFY3X6/iZY/F+PSpr5wuBXimcH3cL40GK2MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mfnpTDoDbzTkRu4B59V9DQgudXHKs1dIxvU8tDdNchA=;
 b=i7Inf6BHNeM4Ln3EV7UVb89akBsZItVQHtRvhlel5kVZXvLznyonWi5lJbcfp2PPg7R1n+57ev+4GqRFmTRJYRI1yOItwmhNmZ8zxyYRIvdTqHK1UBMrZQ21RRIRvjddFmk1Qe/euj3FC0jFYlc+o/ztzhwL97ScpTBF6bdAVxeON0DEoxPLdPYm8dYzmgdq/TcaShYnXHiTq+WOs6xve6HHBR49WsHIJMYK6MPzUhhBxSAK5aVs09rJXYyDwS5hif+9pX7KdhVTyule/oRTKMbwUGbK1cD0kOtoG6ohcSwH8LhUGh8AccIsq+LrhcojwEryA2vEZH0V8H3EpFYz7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
Received: from PU1P153MB0169.APCP153.PROD.OUTLOOK.COM (10.170.189.13) by
 PU1P153MB0201.APCP153.PROD.OUTLOOK.COM (10.170.190.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.3; Mon, 16 Sep 2019 21:48:52 +0000
Received: from PU1P153MB0169.APCP153.PROD.OUTLOOK.COM
 ([fe80::fc44:a784:73e6:c1c2]) by PU1P153MB0169.APCP153.PROD.OUTLOOK.COM
 ([fe80::fc44:a784:73e6:c1c2%8]) with mapi id 15.20.2305.000; Mon, 16 Sep 2019
 21:48:52 +0000
From: Dexuan Cui <decui@microsoft.com>
To: Michael Kelley <mikelley@microsoft.com>, Wei Hu <weh@microsoft.com>,
 "b.zolnierkie@samsung.com" <b.zolnierkie@samsung.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stephen
 Hemminger <sthemmin@microsoft.com>, "sashal@kernel.org" <sashal@kernel.org>,
 Haiyang Zhang <haiyangz@microsoft.com>, KY Srinivasan <kys@microsoft.com>
Subject: RE: [PATCH v4] video: hyperv: hyperv_fb: Obtain screen resolution
 from Hyper-V host
Thread-Topic: [PATCH v4] video: hyperv: hyperv_fb: Obtain screen resolution
 from Hyper-V host
Thread-Index: AQHVY8n1ZHStyEKyQEWtq6qT8x1cIqcdHi/QgAwV3LCABbGEQIAAA1Bw
Date: Mon, 16 Sep 2019 21:48:51 +0000
Message-ID: <PU1P153MB016944F69C36D4199C12F117BF8C0@PU1P153MB0169.APCP153.PROD.OUTLOOK.COM>
References: <20190905091120.16761-1-weh@microsoft.com>
 <DM5PR21MB0137D40DF705CDB372497266D7BB0@DM5PR21MB0137.namprd21.prod.outlook.com>
 <PU1P153MB0169656B3EC48BFCF4D8C134BFB30@PU1P153MB0169.APCP153.PROD.OUTLOOK.COM>
 <PU1P153MB0169E5FA3D359C6BDD50EC34BF8C0@PU1P153MB0169.APCP153.PROD.OUTLOOK.COM>
In-Reply-To: <PU1P153MB0169E5FA3D359C6BDD50EC34BF8C0@PU1P153MB0169.APCP153.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=mikelley@ntdev.microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-09-05T14:05:47.2964572Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=5fdc59c0-9d8b-4103-9a31-ed8f82961311;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
x-originating-ip: [2001:4898:80e8:a:58f6:aea4:93d:b127]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8ab6eefd-2e7e-4169-f372-08d73aefaa0e
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: PU1P153MB0201:|PU1P153MB0201:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PU1P153MB02015BB9B7446B79F178D5D2BF8C0@PU1P153MB0201.APCP153.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0162ACCC24
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(346002)(396003)(39860400002)(366004)(376002)(189003)(199004)(66946007)(2501003)(478600001)(8990500004)(6636002)(8676002)(2940100002)(305945005)(7736002)(74316002)(6436002)(10090500001)(53936002)(55016002)(22452003)(486006)(2906002)(81166006)(229853002)(14444005)(256004)(8936002)(6116002)(476003)(46003)(446003)(11346002)(52536014)(25786009)(76116006)(186003)(4326008)(14454004)(81156014)(6246003)(9686003)(110136005)(71190400001)(71200400001)(316002)(107886003)(7696005)(2201001)(86362001)(33656002)(10290500003)(5660300002)(66446008)(64756008)(66556008)(66476007)(6506007)(76176011)(102836004)(99286004)(53546011)(1511001)(921003)(1121003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:PU1P153MB0201;
 H:PU1P153MB0169.APCP153.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pEwCQmDLUqw4jo11Lm9Gn5BW5p//uD11KpoUIu5LbThBk2hj+YmfcHyalCxHz/LQawR8XRNI0D67gOiiQOu/1yJprlCCb1qbNrhBUoGQVJ0icn0z8arKKfB/CbC7y4FXMjZDklE3ldp3R5w+Yxn0a9XTMU9QsVCSo1DdcyM36qBNH5cXPZoTDQvIU8EHZmz7Fve6EWafcK4dlmCgJ0qyJq/fiaqEJebdxix4VSnz7/QrRQhQrodP7nNohl3l7vpV/D7W79adIwLpFVbedat1aq9RAM+U245+anA0j1LVE5v6IThhjIBZ7ruG/AJ9qDpp5WMmF4IFMkS+SATWhPlzkYTr6DWNkxyGNsc2q9a5Rqf5UsHZQ8yZAugEVf/1S2/RP6Tr2DEuldxqXuOPuYyiftz2UR2CeLLPkrOJ/Ed/k/s=
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ab6eefd-2e7e-4169-f372-08d73aefaa0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2019 21:48:51.6898 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1fbsjY6u/NOlnXwq+2f9M4iTsyMxRIGjWq9/UPKkYXx+1Q7yCISm9PnLQcyFDjwvLV1nlDRh4sMZhhakLkIWrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1P153MB0201
X-Mailman-Approved-At: Tue, 17 Sep 2019 07:17:12 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mfnpTDoDbzTkRu4B59V9DQgudXHKs1dIxvU8tDdNchA=;
 b=dfdUMyNI6Uh69PFFvZowOSBXAfdcC1pAseaIKb0OQRJo3j9phuArU1JC4nU5oYhMRqLr1sY0tF0FssRVDsAqKArVmyAYHFA2NUWX2poJEx5Hl9Kq0dHLAsGFx4NZ9EKkc/5oD4XQbLRWHd8bNPPeD2JbB9pq0y6hemJcZegTypU=
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
Cc: Iouri Tarassov <iourit@microsoft.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBGcm9tOiBEZXh1YW4gQ3VpDQo+IFNlbnQ6IE1vbmRheSwgU2VwdGVtYmVyIDE2LCAyMDE5IDI6
NDYgUE0NCj4gVG86IE1pY2hhZWwgS2VsbGV5IDxtaWtlbGxleUBtaWNyb3NvZnQuY29tPjsgV2Vp
IEh1IDx3ZWhAbWljcm9zb2Z0LmNvbT47DQo+IGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbTsgbGlu
dXgtaHlwZXJ2QHZnZXIua2VybmVsLm9yZzsNCj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZzsgbGludXgtZmJkZXZAdmdlci5rZXJuZWwub3JnOw0KPiBsaW51eC1rZXJuZWxAdmdlci5r
ZXJuZWwub3JnOyBTdGVwaGVuIEhlbW1pbmdlcg0KPiA8c3RoZW1taW5AbWljcm9zb2Z0LmNvbT47
IHNhc2hhbEBrZXJuZWwub3JnOyBIYWl5YW5nIFpoYW5nDQo+IDxoYWl5YW5nekBtaWNyb3NvZnQu
Y29tPjsgS1kgU3Jpbml2YXNhbiA8a3lzQG1pY3Jvc29mdC5jb20+DQo+IENjOiBJb3VyaSBUYXJh
c3NvdiA8aW91cml0QG1pY3Jvc29mdC5jb20+DQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggdjRdIHZp
ZGVvOiBoeXBlcnY6IGh5cGVydl9mYjogT2J0YWluIHNjcmVlbiByZXNvbHV0aW9uDQo+IGZyb20g
SHlwZXItViBob3N0DQo+IA0KPiA+IEZyb206IGxpbnV4LWh5cGVydi1vd25lckB2Z2VyLmtlcm5l
bC5vcmcNCj4gPiA8bGludXgtaHlwZXJ2LW93bmVyQHZnZXIua2VybmVsLm9yZz4gT24gQmVoYWxm
IE9mIERleHVhbiBDdWkNCj4gPiBTZW50OiBUaHVyc2RheSwgU2VwdGVtYmVyIDEyLCAyMDE5IDEx
OjM5IFBNDQo+ID4gVG86IE1pY2hhZWwgS2VsbGV5IDxtaWtlbGxleUBtaWNyb3NvZnQuY29tPjsg
V2VpIEh1DQo+IDx3ZWhAbWljcm9zb2Z0LmNvbT47DQo+ID4gYi56b2xuaWVya2llQHNhbXN1bmcu
Y29tOyBsaW51eC1oeXBlcnZAdmdlci5rZXJuZWwub3JnOw0KPiA+IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmc7IGxpbnV4LWZiZGV2QHZnZXIua2VybmVsLm9yZzsNCj4gPiBsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnOyBTdGVwaGVuIEhlbW1pbmdlcg0KPiA+IDxzdGhlbW1pbkBt
aWNyb3NvZnQuY29tPjsgc2FzaGFsQGtlcm5lbC5vcmc7IEhhaXlhbmcgWmhhbmcNCj4gPiA8aGFp
eWFuZ3pAbWljcm9zb2Z0LmNvbT47IEtZIFNyaW5pdmFzYW4gPGt5c0BtaWNyb3NvZnQuY29tPg0K
PiA+IENjOiBJb3VyaSBUYXJhc3NvdiA8aW91cml0QG1pY3Jvc29mdC5jb20+DQo+ID4gU3ViamVj
dDogUkU6IFtQQVRDSCB2NF0gdmlkZW86IGh5cGVydjogaHlwZXJ2X2ZiOiBPYnRhaW4gc2NyZWVu
IHJlc29sdXRpb24NCj4gPiBmcm9tIEh5cGVyLVYgaG9zdA0KPiA+DQo+ID4gPiBGcm9tOiBNaWNo
YWVsIEtlbGxleSA8bWlrZWxsZXlAbWljcm9zb2Z0LmNvbT4NCj4gPiA+IFNlbnQ6IFRodXJzZGF5
LCBTZXB0ZW1iZXIgNSwgMjAxOSA3OjA2IEFNDQo+ID4gPg0KPiA+ID4gRnJvbTogV2VpIEh1IDx3
ZWhAbWljcm9zb2Z0LmNvbT4gU2VudDogVGh1cnNkYXksIFNlcHRlbWJlciA1LCAyMDE5DQo+ID4g
MjoxMg0KPiA+ID4gQU0NCj4gPiA+ID4NCj4gPiA+ID4gQmVnaW5uaW5nIGZyb20gV2luZG93cyAx
MCBSUzUrLCBWTSBzY3JlZW4gcmVzb2x1dGlvbiBpcyBvYnRhaW5lZCBmcm9tDQo+ID4gPiBob3N0
Lg0KPiA+ID4gPiBUaGUgInZpZGVvPWh5cGVydl9mYiIgYm9vdCB0aW1lIG9wdGlvbiBpcyBub3Qg
bmVlZGVkLCBidXQgc3RpbGwgY2FuIGJlDQo+ID4gPiA+IHVzZWQgdG8gb3ZlcndyaXRlIHdoYXQg
dGhlIGhvc3Qgc3BlY2lmaWVzLiBUaGUgVk0gcmVzb2x1dGlvbiBvbiB0aGUgaG9zdA0KPiA+ID4g
PiBjb3VsZCBiZSBzZXQgYnkgZXhlY3V0aW5nIHRoZSBwb3dlcnNoZWxsICJzZXQtdm12aWRlbyIg
Y29tbWFuZC4NCj4gPiA+ID4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSW91cmkgVGFyYXNzb3Yg
PGlvdXJpdEBtaWNyb3NvZnQuY29tPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgSHUgPHdl
aEBtaWNyb3NvZnQuY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gICAgIHYyOg0KPiA+ID4gPiAg
ICAgLSBJbXBsZW1lbnRlZCBmYWxsYmFjayB3aGVuIHZlcnNpb24gbmVnb3RpYXRpb24gZmFpbGVk
Lg0KPiA+ID4gPiAgICAgLSBEZWZpbmVkIGZ1bGwgc2l6ZSBmb3Igc3VwcG9ydGVkX3Jlc29sdXRp
b24gYXJyYXkuDQo+ID4gPiA+DQo+ID4gPiA+ICAgICB2MzoNCj4gPiA+ID4gICAgIC0gQ29ycmVj
dGVkIHRoZSBzeW50aHZpZCBtYWpvciBhbmQgbWlub3IgdmVyc2lvbiBjb21wYXJpc29uDQo+ID4g
cHJvYmxlbS4NCj4gPiA+ID4NCj4gPiA+ID4gICAgIHY0Og0KPiA+ID4gPiAgICAgLSBDaGFuZ2Vk
IGZ1bmN0aW9uIG5hbWUgdG8gc3ludGh2aWRfdmVyX2dlKCkuDQo+ID4gPiA+DQo+ID4gPiA+ICBk
cml2ZXJzL3ZpZGVvL2ZiZGV2L2h5cGVydl9mYi5jIHwgMTU5DQo+ID4gPiArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKy0tLQ0KPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDE0NyBpbnNlcnRp
b25zKCspLCAxMiBkZWxldGlvbnMoLSkNCj4gPiA+ID4NCj4gPiA+DQo+ID4gPiBSZXZpZXdlZC1i
eTogTWljaGFlbCBLZWxsZXkgPG1pa2VsbGV5QG1pY3Jvc29mdC5jb20+DQo+ID4NCj4gPiBMb29r
cyBnb29kIHRvIG1lLg0KPiA+DQo+ID4gUmV2aWV3ZWQtYnk6IERleHVhbiBDdWkgPGRlY3VpQG1p
Y3Jvc29mdC5jb20+DQo+IA0KPiBIaSBXZWksDQo+IEl0IHR1cm5zIG91dCB3ZSBuZWVkIHRvIG1h
a2UgYSBmdXJ0aGVyIGZpeC4gOi0pDQo+IA0KPiBUaGUgcGF0Y2ggZm9yZ2V0cyB0byB0YWtlIHBh
ci0+dXBkYXRlIGludG8gY29uc2lkZXJhdGlvbi4NCj4gDQo+IFdoZW4gdGhlIFZNIENvbm5lY3Rp
b24gd2luZG93IGlzIGNsb3NlZCAob3IgbWluaW1pemVkPyksDQo+IHRoZSBob3N0IHNlbmRzIGEg
bWVzc2FnZSB0byB0aGUgZ3Vlc3QsIGFuZCB0aGUgZ3Vlc3Qgc2V0cw0KPiBwYXItPnVwZGF0ZSB0
byBmYWxzZSBpbiBzeW50aHZpZF9yZWN2X3N1YigpLg0KPiANCj4gSWYgcGFyLT51cGRhdGUgaXMg
ZmFsc2UsIHRoZSBndWVzdCBkb2Vzbid0IG5lZWQgdG8gY2FsbA0KPiBzeW50aHZpZF91cGRhdGUo
KS4NCj4gDQo+IFRoYW5rcywNCj4gLS0gRGV4dWFuDQoNClBsZWFzZSBpZ25vcmUgdGhlIGxhc3Qg
cmVwbHkgZnJvbSBtZS4gDQoNCkl0IHdhcyBtZWFudCB0byByZXBseSBhbm90aGVyIG1haWw6DQpS
RTogW1BBVENIIHY1XSB2aWRlbzogaHlwZXJ2OiBoeXBlcnZfZmI6IFN1cHBvcnQgZGVmZXJyZWQg
SU8gZm9yIEh5cGVyLVYgZnJhbWUgYnVmZmVyIGRyaXZlcg0KDQpTb3JyeSBmb3IgdGhlIGNvbmZ1
c2lvbi4NCg0KVGhhbmtzLA0KLS0gRGV4dWFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
