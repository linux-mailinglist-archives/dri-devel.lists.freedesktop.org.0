Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9642AC43C0
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 00:21:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 472886E8AF;
	Tue,  1 Oct 2019 22:21:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04on060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4d::60e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7FF96E8AF;
 Tue,  1 Oct 2019 22:21:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LYkLDQ92MvfyPotgCj46wA72LyLxJ6n4rk3glY2WK5U2lmgLPudD2upfM7BVB2NKK5FK2Bz8cWePmHjLZI0PWQhK+Z4BUxXHsZKLyA98/K7xbhZFHLfy3/JIt7LpkM/IGhyRVNqJkXd/U/Zerlccb731nTjVWurJvOz5n841UYj66r/12GBz/XpKQ+QHywyPdN2YJIq/O047MsauTk5vkJFXaiGhCmPVpa0UNIW0SKAtB7Es0IP6f+8wVppDlIeOaZLtO8C3iAQs4BAQyxfsKJgXQLf97i2MaQr1OGAxJGxEVhaGyBdfWKvz2uSrk55cRVknGarmImZVhZ9Zr8sO/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zd+Yp+3FPe+w9LJbmCLuqRH2619eXdhilusF0KEOSRY=;
 b=Xe8fU/nPnMumNFlNrDL+1J95RpM5ZnoaQ+gsf93MCp9POXdH+qDEqeJZIL4e3AXuNTjSQgO/fdlSAFNhfo5Pmw8wuMvxDSE5zNYDkTbyzXM28s2H5CGIIzw87o93hgx/Zd65kOubyXGbP5hX1PEB3xpFbmPpM3QSeDu30BtkY93CHgHa2eruMI1kx9XF5482DD0SUZ4CNVqi6eHiBYiIM1lIGfVeIP0VZOiOcU4yC3Pa5pKxKqaabG4sTmmocF4L/akH18znE4kOiIVqcQt4ZvE9k1SK3ql0yY9riG61fnHpCk9XGpmnHzwlvTWbTxCrYK+pOqMvAa8vgBOMDp/FzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB2456.namprd12.prod.outlook.com (52.132.141.37) by
 DM5PR12MB1788.namprd12.prod.outlook.com (10.175.86.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 22:21:20 +0000
Received: from DM5PR12MB2456.namprd12.prod.outlook.com
 ([fe80::3449:def:4457:5b72]) by DM5PR12MB2456.namprd12.prod.outlook.com
 ([fe80::3449:def:4457:5b72%3]) with mapi id 15.20.2305.022; Tue, 1 Oct 2019
 22:21:20 +0000
From: "Liu, Leo" <Leo.Liu@amd.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Zhou, David(ChunMing)" <David1.Zhou@amd.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/amdgpu: fix structurally dead code vcn_v2_5_hw_init
Thread-Topic: [PATCH] drm/amdgpu: fix structurally dead code vcn_v2_5_hw_init
Thread-Index: AQHVeHwU+1a8umxE5EyQDrqeTbYcDKdGTaMAgAAD4ACAAADbAIAAAxKAgAAGrwA=
Date: Tue, 1 Oct 2019 22:21:20 +0000
Message-ID: <23314fce-800c-552f-e879-464f9709d12b@amd.com>
References: <20191001171635.GA17306@embeddedor>
 <192815d9-5ecb-09a7-4624-5fd36126890d@amd.com>
 <823b10a3-fe0e-2e8c-02c3-534944dbe6d2@embeddedor.com>
 <dc76a52b-09a2-7ab9-b53e-52500f4f8669@amd.com>
 <3c6ebf4a-8cba-40e2-7d70-c4d5006a160b@embeddedor.com>
In-Reply-To: <3c6ebf4a-8cba-40e2-7d70-c4d5006a160b@embeddedor.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YTOPR0101CA0020.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::33) To DM5PR12MB2456.namprd12.prod.outlook.com
 (2603:10b6:4:b4::37)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c02dfdd6-2e3b-4a6a-2ebe-08d746bdaf60
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR12MB1788:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1788FE2843017A076E8ADDDEE59D0@DM5PR12MB1788.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(396003)(376002)(39860400002)(346002)(199004)(189003)(2906002)(31696002)(6512007)(486006)(5660300002)(229853002)(6486002)(4326008)(6436002)(14444005)(256004)(6246003)(86362001)(8676002)(81166006)(305945005)(81156014)(102836004)(7736002)(53546011)(386003)(6506007)(99286004)(66446008)(71190400001)(36756003)(446003)(31686004)(54906003)(76176011)(71200400001)(66476007)(66556008)(26005)(64756008)(66946007)(65806001)(65956001)(66066001)(8936002)(52116002)(25786009)(2616005)(476003)(316002)(58126008)(110136005)(11346002)(6116002)(14454004)(186003)(3846002)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1788;
 H:DM5PR12MB2456.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SsAeQtbFjaSrZCaVqsEd8f5jcgWlTD06qHhOwm9I2t7WJ6++TrWY+ox8Sm448bpFyvSwrKG4EIxWREHvM5Y9KHss1UjEwAR3C5gE5yftjzpF1Ij+VaY/uu+WiaSxmsa1dk2hjmajyDqbdNsyUSpktfgj1B578Xlp0SoR4QNpx2Rk3TCtVIJ8cAzypgn+6FU0CuRHtl4/DACwlsPrrlTjp/UqPorcPvhrVq3kAYW8FtoNwyruZXM2evt7QjaZLW9qGz2OoSii0ylcqzJOzzpoLByTmeFYB+eiRonkxqFKhvOyZ8rCId3JujSxYoBNPAGUD55bI4ZBY9oZC0wdCCsVgDI2cLBdCEiNasLqVuL4umfzWivHGUWXjH/h/Qsboz6QnzqTyGvVRDpWRI0xigz0nt+OrbfRIEQq5VUDRjDCNjw=
Content-ID: <6815B8CBB7A62E49A2816B454DB0BE00@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c02dfdd6-2e3b-4a6a-2ebe-08d746bdaf60
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 22:21:20.2563 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7d0e5Yhn1dMfH/VaUZlUwQfJyNAVqAhnVGEcR0UpajDgRei6w0J18sx5tis9egsm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1788
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zd+Yp+3FPe+w9LJbmCLuqRH2619eXdhilusF0KEOSRY=;
 b=iJUQ2V/uUGxCsbSl8AcHUBBBwTVkKiQCaWCFJNqS3BcZ/Ca66ZMVUrvaBvHIrxFZ5YPG3FiZN26h+nwhr6u4BKGO2jgn+z+r2XW2Ocr200NLbtrJUsaYadioVNOV8LRqbSy9GpxkoOK5XJo0yZklKmvsdpIlLEfcu/gVEFHTzG4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Leo.Liu@amd.com; 
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
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQpPbiAyMDE5LTEwLTAxIDU6NTcgcC5tLiwgR3VzdGF2byBBLiBSLiBTaWx2YSB3cm90ZToNCj4N
Cj4gT24gMTAvMS8xOSAxNjo0NiwgTGl1LCBMZW8gd3JvdGU6DQo+DQo+Pj4+PiArCQlyaW5nLT5z
Y2hlZC5yZWFkeSA9IHRydWU7DQo+Pj4+IFRoaXMgaXMgcmVkdW5kYW50LiBhbGwgdGhlIHNjaGVk
LT5yZWFkeSBpcyBpbml0aWFsaXplZCBhcyB0cnVlLCBwbGVhc2UNCj4+Pj4gcmVmZXIgdG8gZHJt
X3NjaGVkX2luaXQoKQ0KPj4+Pg0KPj4+IEkgc2VlLi4uIHNvIGluIHRoZSBmb2xsb3dpbmcgY29t
bWl0IDFiNjFkZTQ1ZGZhZiAoImRybS9hbWRncHU6IGFkZCBpbml0aWFsIFZDTjIuMCBzdXBwb3J0
ICh2MikiKQ0KPj4+IHRoYXQgbGluZSBpcyBhbHNvIHJlZHVuZGFudD8NCj4+IFllcy4NCj4+DQo+
IE9LLg0KPg0KPj4+Pj4gICAgIAkJciA9IGFtZGdwdV9yaW5nX3Rlc3RfcmluZyhyaW5nKTsNCj4+
Pj4+ICAgICAJCWlmIChyKSB7DQo+Pj4+PiAgICAgCQkJcmluZy0+c2NoZWQucmVhZHkgPSBmYWxz
ZTsNCj4+Pj4+IEBAIC0yNjYsOCArMjY3LDcgQEAgc3RhdGljIGludCB2Y25fdjJfNV9od19pbml0
KHZvaWQgKmhhbmRsZSkNCj4+Pj4+ICAgICANCj4+Pj4+ICAgICAJCWZvciAoaSA9IDA7IGkgPCBh
ZGV2LT52Y24ubnVtX2VuY19yaW5nczsgKytpKSB7DQo+Pj4+PiAgICAgCQkJcmluZyA9ICZhZGV2
LT52Y24uaW5zdFtqXS5yaW5nX2VuY1tpXTsNCj4+Pj4+IC0JCQlyaW5nLT5zY2hlZC5yZWFkeSA9
IGZhbHNlOw0KPj4+Pj4gLQkJCWNvbnRpbnVlOw0KPj4+Pj4gKwkJCXJpbmctPnNjaGVkLnJlYWR5
ID0gdHJ1ZTsNCj4+Pj4gQmVjYXVzZSB0aGUgVkNOIDIuNSBGVyBzdGlsbCBoYXMgaXNzdWUgZm9y
IGVuY29kZSwgc28gd2UgaGF2ZSBpdA0KPj4+PiBkaXNhYmxlZCBoZXJlLg0KPj4+Pg0KPj4+IE9L
LiBTbywgbWF5YmUgd2UgY2FuIGFkZCBhIGNvbW1lbnQgcG9pbnRpbmcgdGhhdCBvdXQ/DQo+PiBU
aGF0IGNvdWxkIGJlIGJldHRlci4NCj4+DQo+IEdyZWF0LiBJJ20gZ2xhZCBpdCdzIG5vdCBhIGJ1
Zy4gIEknbGwgd3JpdGUgYSBwYXRjaCBmb3IgdGhhdCBzbyBvdGhlcg0KPiBwZW9wbGUgZG9uJ3Qg
d2FzdGUgdGltZSB0YWtpbmcgYSBsb29rLg0KDQpUaGFua3MsIGp1c3Qgc2VudCB0d28gcGF0Y2hl
cyB0byBhZGQgY29tbWVudCwgYW5kIGxvbmcgd2l0aCB0aGUgcGF0Y2ggdG8gDQptYWtlIFZDTiBy
aW5nIHJlYWR5IHByb3Blcmx5Lg0KDQpMZW8NCg0KDQoNCg0KPg0KPiBJIGFwcHJlY2lhdGUgeW91
ciBmZWVkYmFjay4NCj4gVGhhbmtzDQo+IC0tDQo+IEd1c3Rhdm8NCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
