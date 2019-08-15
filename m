Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9438EE2F
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 16:30:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7C1D6E9CA;
	Thu, 15 Aug 2019 14:29:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780084.outbound.protection.outlook.com [40.107.78.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA9406E9C9;
 Thu, 15 Aug 2019 14:29:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gk+qa49wXeeurRddDE6gispAm3RH1Tlxzuo2+DWUAj2aviFSvTtkw5uaUsP2IYYNHoSk/TBKEf1g+TyCxQiqOpNOw+IZbOYBu9I+JAawTCTPAH46oVz3tL12fKnIPYHzvmT7vE/Lz+qvol8B4Qsgv+2BOe1NiSIb1FWppmA+KaJzBbTpPE1iGtFrkMT0MgBGq9+YO0UlBxqSprQ3Fsbz7H+hnX9vgXC19qlzJj/f6yfY3d7FpEQW8GqiroNeSdf8EAiEQLqFmbTZ+irn8qg4pZUDZXi8cYTgpJxrFDiUC9Q5HWNq01zlcFgiaEKH3in2suiPtkKujEXxIQcXGihy0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PWboKnI7vpsbEPWSaLnvCLy428XvWsXOYIspTI8WLt8=;
 b=QKDdqlx0ColBcmCxnDMYv+wCXJcAeRlFt0bGnq/lfR3cKNINZm/1NFljx9a0mnHPH2GWnOSYW8Ok68Hsu2DnCKYWG1jEYtuROFshKcsvBRza1JScXHiNg9qq0piV+je4TNx8P/WChd1OBELQnGVK7e+LCc6Imv95lJJCo5REu/VMwKBUTxlhyhFFs7NgSSe3D4kuwcR/ZzhPgyGRBwx2l+c6GRULT4baw/1VOMNd9WFU8sNpV/wHJrPZDX+v6SA0LqokIRV6pcsbFrY86cvVkejVc9PKFkCHOhce3Svwtfs8PPfZ5PEwxapAHSozoIatSYizLuzt31XU0pZpenr8dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB2518.namprd12.prod.outlook.com (52.132.141.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Thu, 15 Aug 2019 14:29:55 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3%5]) with mapi id 15.20.2157.022; Thu, 15 Aug 2019
 14:29:55 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 1/4] drm/radeon: handle PCIe root ports with addressing
 limitations
Thread-Topic: [PATCH 1/4] drm/radeon: handle PCIe root ports with addressing
 limitations
Thread-Index: AQHVUzra1CBLTgdm802owDhMdzV6Fab74e4AgABfewCAAAPqgA==
Date: Thu, 15 Aug 2019 14:29:55 +0000
Message-ID: <838ea437-f4b4-fc0a-c31c-db4568d1877e@amd.com>
References: <20190815072703.7010-1-hch@lst.de>
 <20190815072703.7010-2-hch@lst.de>
 <d1cf1435-92e3-edb5-c239-18c71f2d27c7@amd.com>
 <CADnq5_NghUyn1K7ed6E_vk-8SgLXKj3QpriGRxbNDChdb0hU5Q@mail.gmail.com>
In-Reply-To: <CADnq5_NghUyn1K7ed6E_vk-8SgLXKj3QpriGRxbNDChdb0hU5Q@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR2P264CA0015.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::27)
 To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9115d106-b1ea-4e1a-9dca-08d7218d0af3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2518; 
x-ms-traffictypediagnostic: DM5PR12MB2518:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB2518B958A3A0395BFD47CC7183AC0@DM5PR12MB2518.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(396003)(366004)(346002)(136003)(189003)(199004)(65806001)(54906003)(186003)(65956001)(58126008)(25786009)(14444005)(31686004)(53546011)(65826007)(36756003)(386003)(6506007)(102836004)(76176011)(46003)(4326008)(256004)(229853002)(6486002)(1411001)(6436002)(71200400001)(6246003)(6916009)(71190400001)(64126003)(53936002)(316002)(6512007)(2906002)(8676002)(486006)(14454004)(86362001)(476003)(2616005)(6306002)(305945005)(7736002)(52116002)(66574012)(6116002)(81166006)(81156014)(31696002)(11346002)(966005)(478600001)(446003)(66946007)(66556008)(5660300002)(64756008)(66446008)(99286004)(66476007)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2518;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vEegGrfZwQt2/rdzGdkbmNnbSW3RmYlKYoeLwnE+Yy5IIFYs8lv3UO3P+Tjtf3quPVVO1HHBhjtwmiGIdGphWP9AoLm192JKwo5LwGWHFQBKRUk6uoKcvScnbiMjTXBIapmTBCQVENSnNoqJ5piiNlnfvE68jLkcwCjxgIGC2pVSgdX11dvH1ilpKlKWi6u+WSN/aqPRGBjwPBJDxpXsUeWKsnhTh5Zks8eaDzGLAh3tFuPfGJpNBtXUF4aK6tN1lBeiImBNeO5wjJRIHkZkuE0IopCkQQNjCJoRPEORZbBDxFRdk3mqUhe4RXDtS5LzEX0sCEOkguyHEpc7LV5bFQfD26fTYYmYjGteTFStGaTjGNy3SVWQpufGFi3npLeuc7Vf+SFhO6eOScSVk7jiyrNm/Fy2Xl8WaIMLMeWHzFM=
Content-ID: <1D855281E343EE4F974C7CEDAF1DBD5B@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9115d106-b1ea-4e1a-9dca-08d7218d0af3
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 14:29:55.7396 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jpadVYTUTEFxiTVrDrMgH2CllABMBM43kuPBnx+9HmHBGiMDxuBl7fJPQ+qQm1e4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2518
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PWboKnI7vpsbEPWSaLnvCLy428XvWsXOYIspTI8WLt8=;
 b=xnwSO93qnfmN7pbtqzSqOpQVfPJMjQKALNhs59CtZbRQ55yS1u6Q6oGxbsveqFxIMaxxNuIAxxo0odOb+ekz09vIwt8+O245YLW2sEjK5yG6AT0N/sqCmxF20IYKkk9UhmkKf3cz2GMIoLPFh9mMMGJ+MxKSgw2rtKD/94nkxQM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Atish Patra <Atish.Patra@wdc.com>, Alistair Francis <alistair.francis@wdc.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTUuMDguMTkgdW0gMTY6MTUgc2NocmllYiBBbGV4IERldWNoZXI6DQo+IE9uIFRodSwgQXVn
IDE1LCAyMDE5IGF0IDQ6MzQgQU0gS29lbmlnLCBDaHJpc3RpYW4NCj4gPENocmlzdGlhbi5Lb2Vu
aWdAYW1kLmNvbT4gd3JvdGU6DQo+PiBBbSAxNS4wOC4xOSB1bSAwOToyNyBzY2hyaWViIENocmlz
dG9waCBIZWxsd2lnOg0KPj4+IHJhZGVvbiB1c2VzIGEgbmVlZF9kbWEzMiBmbGFnIHRvIGluZGlj
YXRlIHRvIHRoZSBkcm0gY29yZSB0aGF0IHNvbWUNCj4+PiBhbGxvY2F0aW9ucyBuZWVkIHRvIGJl
IGRvbmUgdXNpbmcgR0ZQX0RNQTMyLCBidXQgaXQgb25seSBjaGVja3MgdGhlDQo+Pj4gZGV2aWNl
IGFkZHJlc3NpbmcgY2FwYWJpbGl0aWVzIHRvIG1ha2UgdGhhdCBkZWNpc2lvbi4gIFVuZm9ydHVu
YXRlbHkNCj4+PiBQQ0llIHJvb3QgcG9ydHMgdGhhdCBoYXZlIGxpbWl0ZWQgYWRkcmVzc2luZyBl
eGlzdCBhcyB3ZWxsLiAgVXNlIHRoZQ0KPj4+IGRtYV9hZGRyZXNzaW5nX2xpbWl0ZWQgaW5zdGVh
ZCB0byBhbHNvIHRha2UgdGhvc2UgaW50byBhY2NvdW50Lg0KPj4+DQo+Pj4gUmVwb3J0ZWQtYnk6
IEF0aXNoIFBhdHJhIDxBdGlzaC5QYXRyYUB3ZGMuY29tPg0KPj4+IFNpZ25lZC1vZmYtYnk6IENo
cmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPg0KPj4gTG9va3Mgc2FuZSB0byBtZS4gUmV2aWV3
ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4uDQo+IElz
IHRoaXMgZm9yIHRoZSBmdWxsIHNlcmllcyBvciBqdXN0IHRoaXMgcGF0Y2g/DQoNCkZvciB0aGUg
ZnVsbCBzZXJpZXMsIHNvcnJ5IGZvciBub3QgYmVpbmcgY2xlYXIgb24gdGhpcy4NCg0KQ2hyaXN0
aWFuLg0KDQo+DQo+IEFsZXgNCj4NCj4+IFNob3VsZCB3ZSBtZXJnZSB0aGlzIHRocm91Z2ggb3Vy
IG5vcm1hbCBhbWRncHUvcmFkZW9uIGJyYW5jaGVzIG9yIGRvIHlvdQ0KPj4gd2FudCB0byBzZW5k
IHRoaXMgdXBzdHJlYW0gc29tZWhvdyBlbHNlPw0KPj4NCj4+IFRoYW5rcywNCj4+IENocmlzdGlh
bi4NCj4+DQo+Pj4gLS0tDQo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb24uaCAg
ICAgICAgfCAgMSAtDQo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZGV2aWNl
LmMgfCAxMiArKysrKy0tLS0tLS0NCj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVv
bl90dG0uYyAgICB8ICAyICstDQo+Pj4gICAgMyBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMo
KyksIDkgZGVsZXRpb25zKC0pDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9yYWRlb24uaCBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uLmgNCj4+PiBp
bmRleCAzMjgwOGU1MGJlMTIuLjFhMGIyMjUyNmE3NSAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vcmFkZW9uL3JhZGVvbi5oDQo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9yYWRlb24uaA0KPj4+IEBAIC0yMzg3LDcgKzIzODcsNiBAQCBzdHJ1Y3QgcmFkZW9uX2Rldmlj
ZSB7DQo+Pj4gICAgICAgIHN0cnVjdCByYWRlb25fd2IgICAgICAgICAgICAgICAgd2I7DQo+Pj4g
ICAgICAgIHN0cnVjdCByYWRlb25fZHVtbXlfcGFnZSAgICAgICAgZHVtbXlfcGFnZTsNCj4+PiAg
ICAgICAgYm9vbCAgICAgICAgICAgICAgICAgICAgICAgICAgICBzaHV0ZG93bjsNCj4+PiAtICAg
ICBib29sICAgICAgICAgICAgICAgICAgICAgICAgICAgIG5lZWRfZG1hMzI7DQo+Pj4gICAgICAg
IGJvb2wgICAgICAgICAgICAgICAgICAgICAgICAgICAgbmVlZF9zd2lvdGxiOw0KPj4+ICAgICAg
ICBib29sICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFjY2VsX3dvcmtpbmc7DQo+Pj4gICAg
ICAgIGJvb2wgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmFzdGZiX3dvcmtpbmc7IC8qIElH
UCBmZWF0dXJlKi8NCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRl
b25fZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kZXZpY2UuYw0KPj4+
IGluZGV4IGRjZWI1NTRlNTY3NC4uYjhjYzA1ODI2NjY3IDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2RldmljZS5jDQo+Pj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9yYWRlb25fZGV2aWNlLmMNCj4+PiBAQCAtMTM2NSwyNyArMTM2NSwyNSBAQCBp
bnQgcmFkZW9uX2RldmljZV9pbml0KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2LA0KPj4+ICAg
ICAgICBlbHNlDQo+Pj4gICAgICAgICAgICAgICAgcmRldi0+bWMubWNfbWFzayA9IDB4ZmZmZmZm
ZmZVTEw7IC8qIDMyIGJpdCBNQyAqLw0KPj4+DQo+Pj4gLSAgICAgLyogc2V0IERNQSBtYXNrICsg
bmVlZF9kbWEzMiBmbGFncy4NCj4+PiArICAgICAvKiBzZXQgRE1BIG1hc2suDQo+Pj4gICAgICAg
ICAqIFBDSUUgLSBjYW4gaGFuZGxlIDQwLWJpdHMuDQo+Pj4gICAgICAgICAqIElHUCAtIGNhbiBo
YW5kbGUgNDAtYml0cw0KPj4+ICAgICAgICAgKiBBR1AgLSBnZW5lcmFsbHkgZG1hMzIgaXMgc2Fm
ZXN0DQo+Pj4gICAgICAgICAqIFBDSSAtIGRtYTMyIGZvciBsZWdhY3kgcGNpIGdhcnQsIDQwIGJp
dHMgb24gbmV3ZXIgYXNpY3MNCj4+PiAgICAgICAgICovDQo+Pj4gLSAgICAgcmRldi0+bmVlZF9k
bWEzMiA9IGZhbHNlOw0KPj4+ICsgICAgIGRtYV9iaXRzID0gNDA7DQo+Pj4gICAgICAgIGlmIChy
ZGV2LT5mbGFncyAmIFJBREVPTl9JU19BR1ApDQo+Pj4gLSAgICAgICAgICAgICByZGV2LT5uZWVk
X2RtYTMyID0gdHJ1ZTsNCj4+PiArICAgICAgICAgICAgIGRtYV9iaXRzID0gMzI7DQo+Pj4gICAg
ICAgIGlmICgocmRldi0+ZmxhZ3MgJiBSQURFT05fSVNfUENJKSAmJg0KPj4+ICAgICAgICAgICAg
KHJkZXYtPmZhbWlseSA8PSBDSElQX1JTNzQwKSkNCj4+PiAtICAgICAgICAgICAgIHJkZXYtPm5l
ZWRfZG1hMzIgPSB0cnVlOw0KPj4+ICsgICAgICAgICAgICAgZG1hX2JpdHMgPSAzMjsNCj4+PiAg
ICAjaWZkZWYgQ09ORklHX1BQQzY0DQo+Pj4gICAgICAgIGlmIChyZGV2LT5mYW1pbHkgPT0gQ0hJ
UF9DRURBUikNCj4+PiAtICAgICAgICAgICAgIHJkZXYtPm5lZWRfZG1hMzIgPSB0cnVlOw0KPj4+
ICsgICAgICAgICAgICAgZG1hX2JpdHMgPSAzMjsNCj4+PiAgICAjZW5kaWYNCj4+Pg0KPj4+IC0g
ICAgIGRtYV9iaXRzID0gcmRldi0+bmVlZF9kbWEzMiA/IDMyIDogNDA7DQo+Pj4gICAgICAgIHIg
PSBwY2lfc2V0X2RtYV9tYXNrKHJkZXYtPnBkZXYsIERNQV9CSVRfTUFTSyhkbWFfYml0cykpOw0K
Pj4+ICAgICAgICBpZiAocikgew0KPj4+IC0gICAgICAgICAgICAgcmRldi0+bmVlZF9kbWEzMiA9
IHRydWU7DQo+Pj4gICAgICAgICAgICAgICAgZG1hX2JpdHMgPSAzMjsNCj4+PiAgICAgICAgICAg
ICAgICBwcl93YXJuKCJyYWRlb246IE5vIHN1aXRhYmxlIERNQSBhdmFpbGFibGVcbiIpOw0KPj4+
ICAgICAgICB9DQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9u
X3R0bS5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMNCj4+PiBpbmRleCBm
YjM2OTZiYzYxNmQuLjExNmEyN2IyNWRjNCAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vcmFkZW9uL3JhZGVvbl90dG0uYw0KPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24v
cmFkZW9uX3R0bS5jDQo+Pj4gQEAgLTc5NCw3ICs3OTQsNyBAQCBpbnQgcmFkZW9uX3R0bV9pbml0
KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KQ0KPj4+ICAgICAgICByID0gdHRtX2JvX2Rldmlj
ZV9pbml0KCZyZGV2LT5tbWFuLmJkZXYsDQo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgJnJhZGVvbl9ib19kcml2ZXIsDQo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cmRldi0+ZGRldi0+YW5vbl9pbm9kZS0+aV9tYXBwaW5nLA0KPj4+IC0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcmRldi0+bmVlZF9kbWEzMik7DQo+Pj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBkbWFfYWRkcmVzc2luZ19saW1pdGVkKCZyZGV2LT5wZGV2LT5kZXYpKTsNCj4+PiAg
ICAgICAgaWYgKHIpIHsNCj4+PiAgICAgICAgICAgICAgICBEUk1fRVJST1IoImZhaWxlZCBpbml0
aWFsaXppbmcgYnVmZmVyIG9iamVjdCBkcml2ZXIoJWQpLlxuIiwgcik7DQo+Pj4gICAgICAgICAg
ICAgICAgcmV0dXJuIHI7DQo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXw0KPj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdA0KPj4gZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZw0KPj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
