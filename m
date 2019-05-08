Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CADE1747F
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2019 11:03:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3566A89819;
	Wed,  8 May 2019 09:03:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790087.outbound.protection.outlook.com [40.107.79.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D97489815;
 Wed,  8 May 2019 09:03:36 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1130.namprd12.prod.outlook.com (10.168.237.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.11; Wed, 8 May 2019 09:03:34 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::70fc:f26c:1e22:73ba]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::70fc:f26c:1e22:73ba%10]) with mapi id 15.20.1856.012; Wed, 8 May 2019
 09:03:34 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Thomas Hellstrom <thomas@shipmail.org>, "Zhou, David(ChunMing)"
 <David1.Zhou@amd.com>, "Liang, Prike" <Prike.Liang@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/ttm: fix busy memory to fail other user v6
Thread-Topic: [PATCH 1/2] drm/ttm: fix busy memory to fail other user v6
Thread-Index: AQHVBLhzEpGLJ43PNEqgNfgyqPuuKaZffLwAgAAEJQCAAAGEAIAAAmuAgAAAuoCAAAN3gIAAAXUAgAFdsQCAAAgqgA==
Date: Wed, 8 May 2019 09:03:34 +0000
Message-ID: <c100cb61-311f-aa07-7b6b-335b9049b0fc@amd.com>
References: <20190507093642.7859-1-david1.zhou@amd.com>
 <f4b1ddf2-b80b-260e-54c9-b0e62ecbe90b@amd.com>
 <f6a63550-3c1d-41b7-d0c3-98f567695f59@amd.com>
 <6c90881c-1cf3-3b04-c6e0-c6eea5914f9b@amd.com>
 <6c6e5dd5-3264-e4c1-738d-f70cb3346807@amd.com>
 <968487eb-f78e-9922-a073-8ed08111e307@gmail.com>
 <93fbb994-d305-dfc4-f8e5-502647d7386f@shipmail.org>
 <fe4a6a5e-b075-b1cc-a24c-af6c3126145b@amd.com>
 <27bbe674-1095-1015-e4f3-1c336f71879f@shipmail.org>
In-Reply-To: <27bbe674-1095-1015-e4f3-1c336f71879f@shipmail.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM0PR06CA0019.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::32) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b6e697b9-ea50-4802-1595-08d6d3940cd4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1130; 
x-ms-traffictypediagnostic: DM5PR12MB1130:
x-microsoft-antispam-prvs: <DM5PR12MB113016F0226E3DA5050DA97683320@DM5PR12MB1130.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0031A0FFAF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(366004)(396003)(346002)(376002)(136003)(189003)(199004)(65806001)(31686004)(102836004)(72206003)(81156014)(8936002)(8676002)(6116002)(2906002)(68736007)(6436002)(81166006)(66476007)(76176011)(66946007)(229853002)(6512007)(31696002)(52116002)(64756008)(53936002)(66446008)(73956011)(86362001)(99286004)(66556008)(110136005)(2201001)(256004)(14444005)(6246003)(58126008)(25786009)(6486002)(316002)(486006)(11346002)(2616005)(446003)(386003)(6506007)(36756003)(476003)(64126003)(65956001)(2501003)(7736002)(305945005)(5660300002)(186003)(46003)(71200400001)(71190400001)(65826007)(14454004)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1130;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tETSPqTJnqrQ5wQrS0f+qz/KkJ0bTEssmQeZzqQqOYT6Q5A4pFvKiWwwVV8xk+OdNsMu1LyVjrZtAX9rZl0Bh6pr3YBwGFXIw15GWM3NV1FJpBNDLh23P6OhGF7U0gJ6WogENvA7eGLYydPqCfm3HORWVYK46WK935P9Pk3FClthRCu+Z6bZDuL09EPyBYJ4EFqoel8BJqiFJZRZBwvPxbNAIgm4ZY1GOwBOb9pAGqwibMDT402lqlgvmL40XnkSYhclyd/7MotDSIo1NOAGeVZagWVP2trQPdDHxHF7ll8iU33kwoq8VHB865Fkc9AXHklczAOAmDM6XXttyd07alu+q7jHi7FbOkbyF57fLOAwK/kLpWOalRsaRVX15aYV4/PCGIgNLNu+eVeTX71WLDZOdUS+DJygum/b6GdVPaQ=
Content-ID: <A3C0B72A338E1146AF501377695199DD@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6e697b9-ea50-4802-1595-08d6d3940cd4
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2019 09:03:34.7173 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1130
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K5abqR7H+oj/L60iz6Y/udCwW+Aljz4iEFgyU2/QDIo=;
 b=W4NFc9C+EC6ZGsdzZ47xBFw83b+7dM64m3dLQyFFk25Zicg3IWqQhdbnFc/NSSjws80kol6ZlkUqPW8YFI1yK2byxX9MHfGzL7FvsL18gvJ4AKT8osK2tzJPto+aIe/X4SMfT+4U7/S+DRZeJ+0pn3EOQIep1qbAqhI8A4lCIGc=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDguMDUuMTkgdW0gMTA6MzQgc2NocmllYiBUaG9tYXMgSGVsbHN0cm9tOg0KPiBbU05JUF0N
Cj4+Pj4gTm8sIHdoYXQgSSBtZWFuIGlzIHRvIGFkZCB0aGUgYWNxdWlyZV9jdHggYXMgc2VwYXJh
dGUgcGFyYW1ldGVyIHRvDQo+Pj4+IHR0bV9tZW1fZXZpY3RfZmlyc3QoKS4NCj4+Pj4NCj4+Pj4g
RS5nLiB3ZSBvbmx5IG5lZWQgaXQgaW4gdGhpcyBmdW5jdGlvbiBhbmQgaXQgaXMgYWN0dWFsbHkg
bm90IHJlbGF0ZWQNCj4+Pj4gdG8gdGhlIHR0bSBvcGVyYXRpb24gY29udGV4dCBmaWxsZWQgaW4g
YnkgdGhlIGRyaXZlci4NCj4+Pg0KPj4+IEZXSVcsIEkgdGhpbmsgaXQgd291bGQgYmUgbmljZSBh
dCBzb21lIHBvaW50IHRvIGhhdmUgYSByZXNlcnZhdGlvbg0KPj4+IGNvbnRleHQgYmVpbmcgcGFy
dCBvZiB0aGUgdHRtIG9wZXJhdGlvbiBjb250ZXh0LCBzbyB0aGF0IHZhbGlkYXRlIGFuZA0KPj4+
IGV2aWN0IGNvdWxkIGRvIHNsZWVwaW5nIHJlc2VydmF0aW9ucywgYW5kIGhhdmUgYm9zIHJlbWFp
biBvbiB0aGUgbHJ1DQo+Pj4gZXZlbiB3aGVuIHJlc2VydmVkLi4uDQo+PiBZZWFoLCB3ZWxsIHRo
YXQncyBleGFjdGx5IHdoYXQgdGhlIGN0eC0+cmVzdiBwYXJhbWV0ZXIgaXMgZ29vZCBmb3IgOikN
Cj4NCj4gSG1tLiBJIGRvbid0IHF1aXRlIGZvbGxvdz8gSXQgbG9va3MgdG8gbWUgbGlrZSBjdHgt
PnJlc3YgaXMgdGhlcmUgdG8NCj4gd29yayBhcm91bmQgcmVjdXJzaXZlIHJlc2VydmF0aW9ucz8N
Cg0KV2VsbCB5ZXMgYW5kIG5vLCB0aGlzIGlzIHRvIGFsbG93IGV2aWN0aW9uIG9mIEJPcyB3aGlj
aCBzaGFyZSB0aGUgc2FtZSANCnJlc2VydmF0aW9uIG9iamVjdC4NCg0KPg0KPg0KPiBXaGF0IEkn
bSBhZnRlciBpcyBiZWluZyBhYmxlIHRvIGRvIHNsZWVwaW5nIHJlc2VydmF0aW9ucyB3aXRoaW4g
dmFsaWRhdGUNCj4gYW5kIGV2aWN0IGFuZCBvcGVuIHVwIGZvciByZXR1cm5pbmcgLUVERUFETEsu
IE9uZSBiZW5lZml0IHdvdWxkIGJlIHRvDQo+IHNjYW4gb3ZlciB0aGUgTFJVIGxpc3RzLCByZXNl
cnZpbmcgZXhhY3RseSB0aG9zZSBib3Mgd2Ugd2FudCB0byBldmljdCwNCj4gYW5kIHdoZW4gYWxs
IGFyZSByZXNlcnZlZCwgd2UgZXZpY3QgdGhlbS4gSWYgd2UgaGl0IGFuIC1FREVBRExLIHdoaWxl
DQo+IGV2aWN0aW5nIHdlIG5lZWQgdG8gcmVzdGFydC4gVGhlbiB3ZSBuZWVkIGFuIGFjcXVpcmVf
Y3R4IGluIHRoZQ0KPiB0dG1fb3BlcmF0aW9uX2N0eC4NCg0KVGhlIGFjcXVpcmVfY3R4IGlzIGF2
YWlsYWJsZSBmcm9tIHRoZSBCTyB5b3UgdHJ5IHRvIGZpbmQgc3BhY2UgZm9yLg0KDQpCdXQgd2Ug
YWxyZWFkeSB0cmllZCB0aGlzIGFwcHJvYWNoIGFuZCBpdCBkb2Vzbid0IHdvcmsuIFdlIGhhdmUg
YSBsb3Qgb2YgDQpCT3Mgd2hpY2ggbm93IHNoYXJlIHRoZSBzYW1lIHJlc2VydmF0aW9uIG9iamVj
dCBhbmQgc28gd291bGQgY2F1c2UgYW4gDQotRURFQURMSy4NCg0KPj4gQW5kIHllcywgd2UgZG8g
a2VlcCB0aGUgQk9zIG9uIHRoZSBMUlUgZXZlbiB3aGVuIHRoZXkgYXJlIHJlc2VydmVkLg0KPg0K
PiBzdGF0aWMgaW5saW5lIGludCB0dG1fYm9fcmVzZXJ2ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmpl
Y3QgKmJvLA0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBib29sIGludGVycnVw
dGlibGUsIGJvb2wgbm9fd2FpdCwNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
c3RydWN0IHd3X2FjcXVpcmVfY3R4ICp0aWNrZXQpDQoNCnR0bV9ib19yZXNlcnZlKCkgaXMgbm90
IGFsd2F5cyB1c2VkIGFueSBtb3JlIG91dHNpZGUgb2YgVFRNLiBUaGUgZm9yIA0KRE1BLWJ1ZiBh
cyB3ZWxsIGFzIGFtZGdwdSBWTXMgY29kZSB0aGUgcmVzZXJ2YXRpb24gb2JqZWN0IGlzIGxvY2tl
ZCANCndpdGhvdXQgY2FsbGluZyB0dG1fYm9fcmVzZXJ2ZSBub3cuDQoNClJlZ2FyZHMsDQpDaHJp
c3RpYW4uDQoNCj4NCj4gL1Rob21hcw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
