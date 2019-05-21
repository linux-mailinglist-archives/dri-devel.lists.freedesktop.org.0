Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 622D624F4B
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 14:52:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C5DA89364;
	Tue, 21 May 2019 12:52:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790055.outbound.protection.outlook.com [40.107.79.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 007D3892A7;
 Tue, 21 May 2019 12:52:53 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1530.namprd12.prod.outlook.com (10.172.34.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.20; Tue, 21 May 2019 12:52:52 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5%7]) with mapi id 15.20.1900.020; Tue, 21 May 2019
 12:52:52 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Erico Nunes <nunes.erico@gmail.com>
Subject: Re: [PATCH v2] drm/scheduler: Fix job cleanup without timeout handler
Thread-Topic: [PATCH v2] drm/scheduler: Fix job cleanup without timeout handler
Thread-Index: AQHVD2ItlY2oL1M+kUSIDiIRcAcD2KZ1I28AgABb8ICAAAoEAA==
Date: Tue, 21 May 2019 12:52:52 +0000
Message-ID: <c506edea-e588-869b-de60-925f8e33b173@amd.com>
References: <20190520231649.24595-1-nunes.erico@gmail.com>
 <cff4f34a-c604-b662-c250-15c426062601@amd.com>
 <CAK4VdL2jtyFXDXY1VvVXp=buk4tbY__eqAW5b7nigxuZaw6Wvw@mail.gmail.com>
In-Reply-To: <CAK4VdL2jtyFXDXY1VvVXp=buk4tbY__eqAW5b7nigxuZaw6Wvw@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM0PR01CA0062.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:e6::39) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 25c31aea-bd60-43be-e3d5-08d6ddeb3c52
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1530; 
x-ms-traffictypediagnostic: DM5PR12MB1530:
x-microsoft-antispam-prvs: <DM5PR12MB15306CCE3DD6299E6CC0A22683070@DM5PR12MB1530.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0044C17179
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(346002)(39860400002)(136003)(376002)(396003)(199004)(189003)(81166006)(81156014)(186003)(68736007)(64126003)(52116002)(86362001)(76176011)(65806001)(65956001)(7736002)(6486002)(58126008)(305945005)(54906003)(31696002)(8676002)(102836004)(8936002)(31686004)(64756008)(478600001)(66476007)(73956011)(316002)(5660300002)(46003)(99286004)(66556008)(6506007)(53546011)(66946007)(72206003)(66446008)(386003)(53936002)(14454004)(476003)(2906002)(6246003)(4326008)(6512007)(36756003)(486006)(25786009)(6916009)(446003)(256004)(229853002)(6436002)(71200400001)(71190400001)(11346002)(2616005)(65826007)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1530;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qdUgqgIZTu4WQEX+ghazUfZJsF2EP5KjqjH2cgiHAoFuKpwh//LGyPYzEr6La3k+zZDfvVxN8nZgN25pmcLFoQXdzvOnnxNBLW+V27JcAwAHtTrj1IFIucsRweclArYtAMGow2NYFZWEbEu9FC1LnE949OXxh2hP1redpOfmubiz+ppJT8nlX6yzEQlS6XCp4bx2BxOGS5oeObunZOU5cMv27glS11YQ0AWGTwy5OwlhmEZ94Zkr6QmYrVGmBUPbz/gO3rs94VSeqrLX5T5Hz5p/rYO6w/fJei8hKzn72gwknSAXP27Krg4nRgXnx3ssivg9mfMSsazntp5tN67/TJcxkQYr3VAya93gXsOFSx8bhtl/nGWUTKXQ5agKA6M7H0ZBOtTnzqT2j+UBG6Syn/CoffcGV7SAdBTRoeTxRx8=
Content-ID: <CD1BEDFAC635544E906537FC1F234532@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25c31aea-bd60-43be-e3d5-08d6ddeb3c52
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2019 12:52:52.1674 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1530
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xtMUfWGsVK/HPdwX4ssX/WLkwuFTAz2QEym7bBALfOI=;
 b=RRQx+G2Eo4iAKjkR9z5/Rl/Hg/YtuAXQuM+WTvUWLs8qdLMRZEyRa0GnP4+Qb2glnCLWw9774b11Wnuqm//MBSGB5YQzQ2hPd0119eEFRdmJhT3VC78Y8SOcBVBocSj5OrUpmMyLBDL1jAjo9eNPMWJkP/3cxyTenJ+5tecEHtY=
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
Cc: "lima@lists.freedesktop.org" <lima@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Sharat Masetty <smasetty@codeaurora.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Nayan Deshmukh <nayan26deshmukh@gmail.com>, Qiang Yu <yuq825@gmail.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjEuMDUuMTkgdW0gMTQ6MTYgc2NocmllYiBFcmljbyBOdW5lczoNCj4gW0NBVVRJT046IEV4
dGVybmFsIEVtYWlsXQ0KPg0KPiBPbiBUdWUsIE1heSAyMSwgMjAxOSBhdCA4OjQ3IEFNIEtvZW5p
ZywgQ2hyaXN0aWFuDQo+IDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+IHdyb3RlOg0KPj4gQW0g
MjEuMDUuMTkgdW0gMDE6MTYgc2NocmllYiBFcmljbyBOdW5lczoNCj4+PiBbQ0FVVElPTjogRXh0
ZXJuYWwgRW1haWxdDQo+Pj4NCj4+PiBBZnRlciAiNTkxODA0NWM0ZWQ0IGRybS9zY2hlZHVsZXI6
IHJld29yayBqb2IgZGVzdHJ1Y3Rpb24iLCBqb2JzIGFyZQ0KPj4+IG9ubHkgZGVsZXRlZCB3aGVu
IHRoZSB0aW1lb3V0IGhhbmRsZXIgaXMgYWJsZSB0byBiZSBjYW5jZWxsZWQNCj4+PiBzdWNjZXNz
ZnVsbHkuDQo+Pj4NCj4+PiBJbiBjYXNlIG5vIHRpbWVvdXQgaGFuZGxlciBpcyBydW5uaW5nICh0
aW1lb3V0ID09IE1BWF9TQ0hFRFVMRV9USU1FT1VUKSwNCj4+PiBqb2IgY2xlYW51cCB3b3VsZCBi
ZSBza2lwcGVkIHdoaWNoIG1heSByZXN1bHQgaW4gbWVtb3J5IGxlYWtzLg0KPj4+DQo+Pj4gQWRk
IHRoZSBoYW5kbGluZyBmb3IgdGhlICh0aW1lb3V0ID09IE1BWF9TQ0hFRFVMRV9USU1FT1VUKSBj
YXNlIGluDQo+Pj4gZHJtX3NjaGVkX2NsZWFudXBfam9icy4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYt
Ynk6IEVyaWNvIE51bmVzIDxudW5lcy5lcmljb0BnbWFpbC5jb20+DQo+Pj4gQ2M6IENocmlzdGlh
biBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4+IFJldmlld2VkLWJ5OiBDaHJp
c3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQo+Pg0KPj4gR29pbmcgdG8g
cGljayB0aGF0IHVwIGxhdGVyIHRvZGF5IGludG8gb3VyIGludGVybmFsIGJyYW5jaC4NCj4gVGhh
bmtzLiBJIGFsc28gcG9zdGVkIG9uZSB0byBzZXQgbGltYSB0byB1c2UgYSByZWFsIGRlZmF1bHQg
dGltZW91dC4NCj4NCj4gSXMgaXQgcG9zc2libGUgZm9yIHVzIHRvIHN0aWxsIGdldCBhdCBsZWFz
dCBvbmUgb2YgdGhlc2UgaW50byBhIHRyZWUNCj4gdGhhdCBnb2VzIHRvIGEgbGludXggNS4yLXJj
Pw0KPiBUaGlzIGlzc3VlIG1heSBtYWtlIGxpbWEgdW51c2FibGUgYXMgdGhlIHN5c3RlbSBydW5z
IG91dCBvZiBtZW1vcnkNCj4gcXVpY2tseSBpZiBtYW55IG9wZW5nbCBwcm9ncmFtcyBhcmUgbGF1
bmNoZWQuDQoNCkFsZXggc2hvdWxkIHBpY2sgaXQgdXAgZm9yIGhpcyBuZXh0IC1maXhlcyBwdWxs
IHRoaXMgd2Vlay4NCg0KQ2hyaXN0aWFuLg0KDQo+DQo+IEVyaWNvDQoNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
