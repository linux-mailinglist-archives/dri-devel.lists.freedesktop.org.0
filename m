Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC55A5E745
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 17:00:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D787F89875;
	Wed,  3 Jul 2019 15:00:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780054.outbound.protection.outlook.com [40.107.78.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7956989875
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 15:00:14 +0000 (UTC)
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1855.namprd12.prod.outlook.com (10.175.53.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Wed, 3 Jul 2019 15:00:13 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::2884:f3a3:2582:edf6]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::2884:f3a3:2582:edf6%9]) with mapi id 15.20.2032.019; Wed, 3 Jul 2019
 15:00:13 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: Lucas Stach <l.stach@pengutronix.de>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
Subject: Re: [PATCH] drm/scheduler: put killed job cleanup to worker
Thread-Topic: [PATCH] drm/scheduler: put killed job cleanup to worker
Thread-Index: AQHVMYoDUGBPoFod9UaqCvOwnPfn16a4r6EAgABFdoCAAAKPAIAAA5CAgAABugA=
Date: Wed, 3 Jul 2019 15:00:13 +0000
Message-ID: <e7852125-535f-fdf6-01ce-706f92c1856e@amd.com>
References: <20190703102802.17004-1-l.stach@pengutronix.de>
 <e40563b4-3a0f-0370-4790-67328c6e5ad2@amd.com>
 <1562164325.2321.13.camel@pengutronix.de>
 <186e567c-81e7-e874-2dae-4c4495bce224@amd.com>
 <1562165639.2321.16.camel@pengutronix.de>
In-Reply-To: <1562165639.2321.16.camel@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0018.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::31) To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f9ea4645-2c2f-40f7-f629-08d6ffc7267b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1855; 
x-ms-traffictypediagnostic: MWHPR12MB1855:
x-microsoft-antispam-prvs: <MWHPR12MB1855A67E3236551E4083635DEAFB0@MWHPR12MB1855.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:311;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(39860400002)(396003)(346002)(136003)(189003)(199004)(11346002)(446003)(6246003)(2616005)(68736007)(14454004)(8676002)(53936002)(476003)(81166006)(81156014)(7736002)(305945005)(66066001)(25786009)(6436002)(14444005)(256004)(2906002)(6486002)(229853002)(6512007)(72206003)(478600001)(4326008)(31686004)(486006)(71190400001)(71200400001)(36756003)(31696002)(386003)(6506007)(53546011)(102836004)(86362001)(3846002)(5660300002)(186003)(26005)(6636002)(110136005)(54906003)(316002)(66556008)(66476007)(66446008)(64756008)(66946007)(73956011)(52116002)(99286004)(76176011)(8936002)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1855;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fqy2FWCJ9y4jfg9BaEtBJA2e7I1p6EdqxOYA0eeejO04ngMGbFZ1k9j5BNfBJEiXf1BePHRzTCwLuqPHSCbYXfYM2GBxhi8jsuXquudvpjedfH7l7+mUkCSB3UZeRhkZVZDrGVIZ09FpXOkPk+At9QgfyvZZVCSGGazjeuuRO+KeCL5Ci47PSja6zuvyYe1Y3H3ETcOzZOlfUDq2XztdxqSl0sVktiKRRtYM1drll1lKMBRYEefDpf2bx9NN4K0vSmnEP4M9cObIZj8k06R1ydo6vGAkC9PQSmqR3ecJM/8OteUyvUhhUX5Ty0XEYf4n8cWfBANP3eNkh9bUbZqTlteSwu37prA/Zgn7sHYHzt/UKSP87JSIAgkDIC/4NN2Zot/PBjpNGN+0aT/2Sxlzf/nfwT2VWrbWIhlmYNX8orc=
Content-ID: <FAF4F32A6A517A48AE659011756ADD7F@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9ea4645-2c2f-40f7-f629-08d6ffc7267b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 15:00:13.2369 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: agrodzov@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1855
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tr/JdDN3E7BnJyNdEKOiF2pGRa9OJKVbG09WifIL8sY=;
 b=Geb8iJepjdZ1QkymP3XWVw3Tb55/FO1GIdObym9MQsCH/jVb1D2agHOFxyGinNIqt2NlpaDIq/YoT3GuuRQsV8p20/zASOQ8FLezkuPhlzs6PC1On7BS+XMqM4qJ9rpmVWxk9E6rrBOyxsrVUrVoFH9soyESyuPsddY/4/T8U34=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Andrey.Grodzovsky@amd.com; 
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "patchwork-lst@pengutronix.de" <patchwork-lst@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQpPbiA3LzMvMTkgMTA6NTMgQU0sIEx1Y2FzIFN0YWNoIHdyb3RlOg0KPiBBbSBNaXR0d29jaCwg
ZGVuIDAzLjA3LjIwMTksIDE0OjQxICswMDAwIHNjaHJpZWIgR3JvZHpvdnNreSwgQW5kcmV5Og0K
Pj4gT24gNy8zLzE5IDEwOjMyIEFNLCBMdWNhcyBTdGFjaCB3cm90ZToNCj4+PiBBbSBNaXR0d29j
aCwgZGVuIDAzLjA3LjIwMTksIDE0OjIzICswMDAwIHNjaHJpZWIgR3JvZHpvdnNreSwgQW5kcmV5
Og0KPj4+PiBPbiA3LzMvMTkgNjoyOCBBTSwgTHVjYXMgU3RhY2ggd3JvdGU6DQo+Pj4+PiBkcm1f
c2NoZWRfZW50aXR5X2tpbGxfam9ic19jYigpIGlzIGNhbGxlZCByaWdodCBmcm9tIHRoZSBsYXN0
IHNjaGVkdWxlZA0KPj4+Pj4gam9iIGZpbmlzaGVkIGZlbmNlIHNpZ25hbGluZy4gQXMgdGhpcyBt
aWdodCBoYXBwZW4gZnJvbSBJUlEgY29udGV4dCB3ZQ0KPj4+Pj4gbm93IGVuZCB1cCBjYWxsaW5n
IHRoZSBHUFUgZHJpdmVyIGZyZWVfam9iIGNhbGxiYWNrIGluIElSUSBjb250ZXh0LCB3aGlsZQ0K
Pj4+Pj4gYWxsIG90aGVyIHBhdGhzIGNhbGwgaXQgZnJvbSBub3JtYWwgcHJvY2VzcyBjb250ZXh0
Lg0KPj4+Pj4NCj4+Pj4+IEV0bmF2aXYgaW4gcGFydGljdWxhciBjYWxscyBjb3JlIGtlcm5lbCBm
dW5jdGlvbnMgdGhhdCBhcmUgb25seSB2YWxpZCB0bw0KPj4+Pj4gYmUgY2FsbGVkIGZyb20gcHJv
Y2VzcyBjb250ZXh0IHdoZW4gZnJlZWluZyB0aGUgam9iLiBPdGhlciBkcml2ZXJzIG1pZ2h0DQo+
Pj4+PiBoYXZlIHNpbWlsYXIgaXNzdWVzLCBidXQgSSBkaWQgbm90IHZhbGlkYXRlIHRoaXMuIEZp
eCB0aGlzIGJ5IHB1bnRpbmcNCj4+Pj4+IHRoZSBjbGVhbnVwIHdvcmsgaW50byBhIHdvcmsgaXRl
bSwgc28gdGhlIGRyaXZlciBleHBlY3RhdGlvbnMgYXJlIG1ldC4NCj4+Pj4+DQo+Pj4+Pj4+IFNp
Z25lZC1vZmYtYnk6IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPg0KPj4+Pj4g
LS0tDQo+IFsuLi5dDQo+DQo+Pj4+IEkgcmVjaGVja2VkIHRoZSBsYXRlc3QgY29kZSBhbmQgZmlu
aXNoX3dvcmsgd2FzIHJlbW92ZWQgaW4gZmZhZTNlNQ0KPj4+PiAnZHJtL3NjaGVkdWxlcjogcmV3
b3JrIGpvYiBkZXN0cnVjdGlvbicNCj4+PiBBdywgdGhhbmtzLiBTZWVtcyB0aGlzIHBhdGNoIHdh
cyBzdHVjayBmb3IgYSBiaXQgdG9vIGxvbmcgaW4gbXkNCj4+PiBvdXRnb2luZyBxdWV1ZS4gSSd2
ZSBqdXN0IGNoZWNrZWQgdGhlIGNvbW1pdCB5b3UgcG9pbnRlZCBvdXQsIGl0IHNob3VsZA0KPj4+
IGFsc28gZml4IHRoZSBpc3N1ZSB0aGF0IHRoaXMgcGF0Y2ggd2FzIHRyeWluZyB0byBmaXguDQo+
Pg0KPj4gTm90IHN1cmUgYWJvdXQgdGhpcyBhcyB5b3UgcGF0Y2ggb25seSBjb25jZXJucyB1c2Ug
Y2FzZSB3aGVuIGNsZWFuaW5nDQo+PiB1bmZpbmlzaGVkIGpvYidzIGZvciBlbnRpdHkgYmVpbmcg
ZGVzdHJveWVkLg0KPiBBRkFJQ1MgYWZ0ZXIgZmZhZTNlNSBhbGwgdGhlIGZyZWVfam9iIGludm9j
YXRpb25zIGFyZSBkb25lIGZyb20gcHJvY2Vzcw0KPiBjb250ZXh0LCBzbyB0aGluZ3Mgc2hvdWxk
IHdvcmsgZm9yIGV0bmF2aXYuDQo+DQo+IFJlZ2FyZHMsDQo+IEx1Y2FzDQoNCg0KQWN0dWFsbHkg
Zm9yIGpvYnMgdGhhdCB3ZXJlIG5ldmVyIHN1Ym1pdHRlZCB0byBIVyB5b3VyIGNoYW5nZSBhY3R1
YWxseSANCm1ha2VzIHNlbnNlIGFzIHRob3NlIHdpbGwgc3RpbGwgZ2V0IGNsZWFuZWQgZnJvbSBJ
UlEgY29udGV4dCB3aGVuIA0KZW50aXR5LT5sYXN0X3NjaGVkdWxlZCB3aWxsIHNpZ25hbC4NCg0K
QW5kcmV5DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
