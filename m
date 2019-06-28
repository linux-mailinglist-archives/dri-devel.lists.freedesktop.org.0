Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDD159EA6
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 17:21:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E1306E940;
	Fri, 28 Jun 2019 15:21:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690076.outbound.protection.outlook.com [40.107.69.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C73616E940;
 Fri, 28 Jun 2019 15:21:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=xUb3GEmkEu8buueg6k0ohohPMldUhQweN+Bz0pxEDdKN35AOLF9JOft4nLFCA7p/Fjrf+g0sjbEouSs7bjj1LjS0lI9LlCabeRIoQpCb4LkPO/4Oujr8kb2WiIQHNL7ZTwJFbf30skavJ5BidNp4Ty5Olv0vcwZJEDNqsfP+FDY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qt8Af4iCS1rCDpo+sIVkPV7XgoCvrTfnkaq/eFTOAIM=;
 b=uszc/hUvpXROYV2JwovT+fwEsTigcq5sxlP3bWiPKQYclyou/b+/7Ch2CZ5Ht8oE3B73FXeK1opGPz9/6sgnSnAW4wtyERhEjXkaXQOrYxZ0fIcaIvBYn+1UnZsb1Hmzc110LGbqYZLmHIYMsSHO5wU4Ym+2sd5qn8HWcdnqVh4=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1594.namprd12.prod.outlook.com (10.172.39.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Fri, 28 Jun 2019 15:21:11 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::7d27:3c4d:aed6:2935]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::7d27:3c4d:aed6:2935%6]) with mapi id 15.20.2008.018; Fri, 28 Jun 2019
 15:21:11 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 2/2] dma-buf: cleanup shared fence removal
Thread-Topic: [PATCH 2/2] dma-buf: cleanup shared fence removal
Thread-Index: AQHVLP3VMWiF09ciQkWCisybAkUKsaavpWqAgAAXJ4CAAAKTAIAALBUAgACxN4CAABAtgIAAE82AgAAQ0QCAAAv+gIAARySAgAAL2YA=
Date: Fri, 28 Jun 2019 15:21:11 +0000
Message-ID: <af333288-9804-30e4-28ef-fda4c18b4a5d@amd.com>
References: <20190627101813.61430-1-christian.koenig@amd.com>
 <20190627101813.61430-2-christian.koenig@amd.com>
 <CAKMK7uGtdSxVSUor8P_8XH+uf4_A-kRfY6h+XnJoizscWE4AOg@mail.gmail.com>
 <f1a792c2-87e0-9aba-c6f1-0374122d025b@gmail.com>
 <CAKMK7uFoeugD0ASHm4DRLzq6h3aAvNhE1ODh-bxoH7Lucf1m3w@mail.gmail.com>
 <5e182e5d-efcb-00bd-fa31-6e8bc9571ce6@amd.com>
 <20190627171053.GN12905@phenom.ffwll.local>
 <4844af2e-fbff-ceb9-c16e-32bb7012559f@amd.com>
 <CAKMK7uF2Wb_K9MqALs8o_2i+HDhv=JcnHj6t4VAUO80UVpszZQ@mail.gmail.com>
 <6e9b4005-e490-ab27-2051-1eab801dafd3@amd.com>
 <CAKMK7uFMZLemYkWTyOH_0akUbE53X44Xj7jky90G-jWtwSUicw@mail.gmail.com>
 <92ea4ca1-bb9d-e4d7-792a-33b74f25ccf8@gmail.com>
 <CAKMK7uG-5e_V1OmWJKyHLGLXhBbex1LCVV7cdWjAgLSk-kTozA@mail.gmail.com>
 <1031bb44-449a-f18b-d217-2cb5a4f820f7@amd.com>
 <CAKMK7uFDKDhJQ05b6yb8Srz5E=YkzL+PGTZTYZX-b5dmWrwBVQ@mail.gmail.com>
In-Reply-To: <CAKMK7uFDKDhJQ05b6yb8Srz5E=YkzL+PGTZTYZX-b5dmWrwBVQ@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR2P264CA0039.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::27) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 977b82b6-d08b-4882-5a3b-08d6fbdc4024
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1594; 
x-ms-traffictypediagnostic: DM5PR12MB1594:
x-microsoft-antispam-prvs: <DM5PR12MB1594EF1A85F1E334BA7F4B6283FC0@DM5PR12MB1594.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00826B6158
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(39860400002)(136003)(366004)(199004)(189003)(53834002)(25786009)(7736002)(4326008)(6246003)(53936002)(31686004)(81166006)(11346002)(14454004)(8676002)(8936002)(81156014)(64126003)(446003)(478600001)(2906002)(68736007)(305945005)(72206003)(6116002)(36756003)(6512007)(46003)(58126008)(65806001)(54906003)(186003)(5024004)(14444005)(476003)(65826007)(71200400001)(71190400001)(6436002)(73956011)(256004)(316002)(86362001)(52116002)(6486002)(229853002)(99286004)(5660300002)(486006)(386003)(76176011)(64756008)(66446008)(6916009)(66556008)(6506007)(2616005)(66946007)(31696002)(66476007)(65956001)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1594;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PhzU2+73WUho6akCswJltWPTN9NrJ4ee4DJ5vuqCy0rkfi2ffGg/Zs8jD9OvQ7H4Vsac8WjTCIwn7NpjogSIy0yYnJoXnJ8NgIoPZ71MGhCvNw21/jfCjSr2cdnLfZxSAWgSL1syomfj6UJGEF61QSYTfE/SrTNzTGE0pErP9khJhV6o1LtkCWGKaq/YSKISsawFsnkAG+Ufq+1uOnZ+meYOsRqotwrGe6lnqhQk4heolWwFS6fqX8R5Kt+M0D7sm2o8JsmfbpnvVN+Vp9IHDZYL942UgS/RTfx0ouWrdWFpLhZP7FkuFIJcJ3LNyEcyZES5Ay2pSLa1lcbjcYSFLmm1E+xs49cO035DrmyHs2w7Pl/PCMrHwxKJQczMUe0xqWy6jWlj1DBqdCwk4ATE/m2PLotR0CvTLHRJN+xWuVA=
Content-ID: <C021D52B9903594B9A6301402CC9FD03@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 977b82b6-d08b-4882-5a3b-08d6fbdc4024
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2019 15:21:11.1658 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1594
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qt8Af4iCS1rCDpo+sIVkPV7XgoCvrTfnkaq/eFTOAIM=;
 b=GSV9SAoU9Sw5FtG05hrycLDvpVgb80kTobAtefElNkR20VXbLCwtbvIepa2koh8Typ/ESQ0BZBbS6vA/K0eKNNK1zRbujWVWnAn8gb0fD3nIH+atOncmVPmqXkVIZ6tRs5U2aWBFCQVlz+5yGjSXveEeG4UU3W2R6rN5KSyG+SU=
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjguMDYuMTkgdW0gMTY6Mzggc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KW1NOSVBdDQo+Pj4+
PiAtIHdoZW4geW91IHN1Ym1pdCBjb21tYW5kIGJ1ZmZlcnMsIHlvdSBfZG9udF8gYXR0YWNoIGZl
bmNlcyB0byBhbGwNCj4+Pj4+IGludm9sdmVkIGJ1ZmZlcnMNCj4+Pj4gVGhhdCdzIG5vdCBnb2lu
ZyB0byB3b3JrIGJlY2F1c2UgdGhlbiB0aGUgbWVtb3J5IG1hbmFnZW1lbnQgdGhlbiB0aGlua3MN
Cj4+Pj4gdGhhdCB0aGUgYnVmZmVyIGlzIGltbWVkaWF0ZWx5IG1vdmFibGUsIHdoaWNoIGl0IGlz
bid0LA0KPj4+IEkgZ3Vlc3Mgd2UgbmVlZCB0byBmaXggdGhhdCB0aGVuLiBJIHByZXR0eSBtdWNo
IGFzc3VtZWQgdGhhdA0KPj4+IC0+bm90aWZ5X21vdmUgY291bGQgYWRkIHdoYXRldmVyIGZlbmNl
cyB5b3UgbWlnaHQgd2FudCB0byBhZGQuIFdoaWNoDQo+Pj4gd291bGQgdmVyeSBuZWF0bHkgYWxs
b3cgdXMgdG8gc29sdmUgdGhpcyBwcm9ibGVtIGhlcmUsIGluc3RlYWQgb2YNCj4+PiBjb21pbmcg
dXAgd2l0aCBmYWtlIGZlbmNlcyBhbmQgZnVuIHN0dWZmIGxpa2UgdGhhdC4NCj4+IEFkZGluZyB0
aGUgZmVuY2UgbGF0ZXIgb24gaXMgbm90IGEgc29sdXRpb24gYmVjYXVzZSB3ZSBuZWVkIHNvbWV0
aGluZw0KPj4gd2hpY2ggYmVmb3JlaGFuZCBjYW4gY2hlY2sgaWYgYSBidWZmZXIgaXMgbW92YWJs
ZSBvciBub3QuDQo+Pg0KPj4gSW4gdGhlIGNhc2Ugb2YgYSBtb3ZlX25vdGlmeSB0aGUgZGVjaXNp
b24gdG8gbW92ZSBpdCBpcyBhbHJlYWR5IGRvbmUgYW5kDQo+PiB5b3UgY2FuJ3Qgc2F5IG9oIHNv
cnJ5IEkgaGF2ZSB0byBldmljdCBteSBwcm9jZXNzIGFuZCByZXByb2dyYW0gdGhlDQo+PiBoYXJk
d2FyZSBvciB3aGF0ZXZlci4NCj4+DQo+PiBFc3BlY2lhbGx5IHdoZW4geW91IGRvIHRoaXMgaW4g
YW4gT09NIHNpdHVhdGlvbi4NCj4gV2h5PyBJIG1lYW4gd2hlbiB0aGUgZmVuY2UgZm9yIGEgQ1Mg
aXMgdGhlcmUgYWxyZWFkeSwgaXQgbWlnaHQgYWxzbw0KPiBzdGlsbCBoYW5nIG91dCBpbiB0aGUg
c2NoZWR1bGVyLCBvciBiZSBibG9ja2VkIG9uIGEgZmVuY2UgZnJvbSBhbm90aGVyDQo+IGRyaXZl
ciwgb3IgYW55dGhpbmcgbGlrZSB0aGF0LiBJIGRvbid0IHNlZSBhIGNvbmNlcHR1YWwgZGlmZmVy
ZW5jZS4NCj4gUGx1cyB3aXRoIGR5bmFtaWMgZG1hLWJ1ZiB0aGUgZW50aXJlIHBvaW50IGlzIHRo
YXQgYW4gYXR0YWNoZWQgZmVuY2VzDQo+IGRvZXMgX25vdF8gbWVhbiB0aGUgYnVmZmVyIGlzIHBl
cm1hbmVudGx5IHBpbm5lZCwgYnV0IGNhbiBiZSBtb3ZlZCBpZg0KPiB5b3Ugc3luYyBjb3JyZWN0
bHkuIE1pZ2h0IG5lZWQgYSBiaXQgb2YgdHVuaW5nIG9yIGEgZmxhZyB0byBpbmRpY2F0ZQ0KPiB0
aGF0IHNvbWUgYnVmZmVycyBzaG91bGQgYWx3YXN5IGNvbnNpZGVyZWQgdG8gYmUgYnVzeSwgYW5k
IHRoYXQgeW91DQo+IHNob3VsZG4ndCBzdGFydCBldmljdGluZyB0aG9zZS4gQnV0IHRoYXQncyBr
aW5kYSBhIGRldGFpbC4NCj4NCj4gIEZyb20gYSB2ZXJ5IGhpZ2ggbGV2ZWwgdGhlcmUncyByZWFs
bHkgbm8gZGlmZmVyZW5jZSBiZXR3ZW4NCj4gLT5ub3RpZnlfbW92ZSBhbmQgdGhlIGV2aWN0aW9u
X2ZlbmNlLiBCb3RoIGdpdmUgeW91IGEgY2FsbGJhY2sgd2hlbg0KPiBzb21lb25lIGVsc2UgbmVl
ZHMgdG8gbW92ZSB0aGUgYnVmZmVyLCB0aGF0J3MgYWxsLiBUaGUgb25seSBkaWZmZXJlbmNlDQo+
IGlzIHRoYXQgdGhlIGV2aWN0aW9uX2ZlbmNlIHRoaW5nIGp1bWJsZXMgdGhlIGNhbGxiYWNrIGFu
ZCB0aGUgZmVuY2UNCj4gaW50byBvbmUsIGJ5IHByZWF0dGFjaGluZyBhIGZlbmNlIGp1c3QgaW4g
Y2FzZS4gQnV0IGFnYWluIGZyb20gYQ0KPiBjb25jZXB0dWFsIHBvdiBpdCBkb2Vzbid0IG1hdHRl
ciB3aGV0aGVyIHRoZSBmZW5jZSBpcyBhbHdheXMgaGFuZ2luZw0KPiBhcm91bmQsIG9yIHdoZXRo
ZXIgeW91IGp1c3QgYXR0YWNoIGl0IHdoZW4gLT5ub3RpZnlfbW92ZSBpcyBjYWxsZWQuDQoNClN1
cmUgdGhlcmUgaXMgYSBkaWZmZXJlbmNlLiBTZWUgd2hlbiB5b3UgYXR0YWNoIHRoZSBmZW5jZSBi
ZWZvcmVoYW5kIHRoZSANCm1lbW9yeSBtYW5hZ2VtZW50IGNhbiBrbm93IHRoYXQgdGhlIGJ1ZmZl
ciBpcyBidXN5Lg0KDQpKdXN0IGltYWdpbmUgdGhlIGZvbGxvd2luZzogV2UgYXJlIGluIGFuIE9P
TSBzaXR1YXRpb24gYW5kIG5lZWQgdG8gc3dhcCANCnRoaW5ncyBvdXQgdG8gZGlzayENCg0KV2hl
biB0aGUgZmVuY2UgaXMgYXR0YWNoZWQgYmVmb3JlaGFuZCB0aGUgaGFuZGxpbmcgY2FuIGJlIGFz
IGZvbGxvd2luZzoNCjEuIE1NIHBpY2tzIGEgQk8gZnJvbSB0aGUgTFJVIGFuZCBzdGFydHMgdG8g
ZXZpY3QgaXQuDQoyLiBUaGUgZXZpY3Rpb24gZmVuY2UgaXMgZW5hYmxlZCBhbmQgd2Ugc3RvcCB0
aGUgcHJvY2VzcyB1c2luZyB0aGlzIEJPLg0KMy4gQXMgc29vbiBhcyB0aGUgcHJvY2VzcyBpcyBz
dG9wcGVkIHRoZSBmZW5jZSBpcyBzZXQgaW50byB0aGUgc2lnbmFsZWQgDQpzdGF0ZS4NCjQuIE1N
IG5lZWRzIHRvIGV2aWN0IG1vcmUgQk9zIGFuZCBzaW5jZSB0aGUgZmVuY2UgZm9yIHRoaXMgcHJv
Y2VzcyBpcyANCm5vdyBpbiB0aGUgc2lnbmFsZWQgc3RhdGUgaXQgY2FuIGludGVudGlvbmFsbHkg
cGljayB0aGUgb25lcyB1cCB3aGljaCANCmFyZSBub3cgaWRsZS4NCg0KV2hlbiB3ZSBhdHRhY2gg
dGhlIGZlbmNlIG9ubHkgb24gZXZpY3Rpb24gdGhhdCBjYW4ndCBoYXBwZW4gYW5kIHRoZSBNTSAN
CndvdWxkIGp1c3QgcGljayB0aGUgbmV4dCByYW5kb20gQk8gYW5kIHBvdGVudGlhbGx5IHN0b3Ag
YW5vdGhlciBwcm9jZXNzLg0KDQpTbyBJIHRoaW5rIHdlIGNhbiBzdW1tYXJpemUgdGhhdCB0aGUg
bWVtb3J5IG1hbmFnZW1lbnQgZGVmaW5pdGVseSBuZWVkcyANCnRvIGtub3cgYmVmb3JlaGFuZCBo
b3cgY29zdGx5IGl0IGlzIHRvIGV2aWN0IGEgQk8uDQoNCkFuZCBvZiBjb3Vyc2UgaW1wbGVtZW50
IHRoaXMgd2l0aCBmbGFncyBvciB1c2UgY291bnRlcnMgb3Igd2hhdGV2ZXIsIGJ1dCANCndlIGFs
cmVhZHkgaGF2ZSB0aGUgZmVuY2UgaW5mcmFzdHJ1Y3R1cmUgYW5kIEkgZG9uJ3Qgc2VlIGEgcmVh
c29uIG5vdCB0byANCnVzZSBpdC4NCg0KUmVnYXJkcywNCkNocmlzdGlhbi4NCg0KDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
