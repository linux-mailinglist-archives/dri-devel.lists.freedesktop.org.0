Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 692978A2B0
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 17:53:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 733416E564;
	Mon, 12 Aug 2019 15:53:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680074.outbound.protection.outlook.com [40.107.68.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C32C6E560
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 15:53:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gw3OEULeeXWIVqBG/rr9oRlQ9y21uZkap5KHVq3V9xZuWlbiawDPny8CkeuWzBe0yrDEeCrWG4BaRFy6+KbJi8TaNrDSSngUxr/ogNTJI4eSsg03o3ZG+YSqJc/fPHRycnLq56NMRwHfGxaRHZM86o4zaIeFdguxJN5B5D7soNx6Gkzvj5cPAe574eRfeqJx5zQ7scuhbbnW26XpD+ZzHDkZvaML+dRgtLGNfbVaDSMbHYugAkevMfNeCBh6HpmMLUsPTkd0s7zRUfmscSpmXUq5OtlRyqNvdz6McYqv1Ch9FmmpEeq17svJAu/qRLE1/4XlFfrX65T1hbiA+VeTMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSb7YxuEi0xJH1rceqSl4HR0cnS2iv0iFuCVSVf+fIs=;
 b=O9SnSwVIO4Hcg5EcKpBXSAvwpvdURYBb3XnVUXSGVLtsztO/xEvp2yLLFFbhiW9VYiXbxe+vhCwYJXYlU2YS2Fw8w9SfVr6WTvVzgKctK/m8A79BRy9ZI9Uwqpjy7LSplWJc5HZhj2/+SHYE8Lykwj3QUFEEhqf54uqf6Qf0/pzJXxRpPsLE/1hOZOCW0jYhbMT26xCiK78MogMDLSZGo/zpqXfMJ3kooE3SJAUBG/fT4L2PriMBPFOnvLxydXO39RceWeR1o36kEfmBMg/bzem4rqlQppJ0qlTaY2r89DtfuqUKm6rJog6qoZou+9x6kH086XG6p+s0Kjr8XiBN4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1887.namprd12.prod.outlook.com (10.175.54.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Mon, 12 Aug 2019 15:53:24 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::9065:8869:9c1c:931d]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::9065:8869:9c1c:931d%12]) with mapi id 15.20.2157.022; Mon, 12 Aug
 2019 15:53:24 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Liu,
 Monk" <Monk.Liu@amd.com>, "Deng, Emily" <Emily.Deng@amd.com>
Subject: Re: [PATCH] drm/scheduler: use job count instead of peek
Thread-Topic: [PATCH] drm/scheduler: use job count instead of peek
Thread-Index: AQHVTsd6c0t1yIcqgEqhYqj6pLjAnab3rpKA
Date: Mon, 12 Aug 2019 15:53:24 +0000
Message-ID: <6fab14fc-d0c9-a3d5-5bc5-adb4f0c99aaa@amd.com>
References: <20190809153109.79228-1-christian.koenig@amd.com>
In-Reply-To: <20190809153109.79228-1-christian.koenig@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0021.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::34) To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f8df00d2-e2e5-46ac-5e57-08d71f3d3501
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1887; 
x-ms-traffictypediagnostic: MWHPR12MB1887:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB188797510DF00FE3A0709465EAD30@MWHPR12MB1887.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1775;
x-forefront-prvs: 012792EC17
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(39860400002)(366004)(346002)(376002)(199004)(189003)(66446008)(66556008)(8676002)(66476007)(64756008)(66946007)(53546011)(478600001)(6636002)(81156014)(6506007)(386003)(31686004)(99286004)(81166006)(71190400001)(186003)(71200400001)(305945005)(486006)(6436002)(102836004)(66574012)(6486002)(76176011)(6116002)(52116002)(3846002)(6512007)(316002)(446003)(86362001)(110136005)(2616005)(229853002)(476003)(5660300002)(11346002)(2501003)(14444005)(25786009)(14454004)(7736002)(66066001)(6246003)(2906002)(256004)(31696002)(36756003)(26005)(53936002)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1887;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qmcD883Mr4L8eCWORTi5e8x5doZ8Sv+uLK32zgSiKTZsr3d2rv9br7hGk/fR6SL1UrcuvVPM0ZR6lXVaekNoYSuw0E0ubz+dYPZQ7s9p8fEgz7wwn2mFeTs/dSeU/BFdn/y21UNdfUNQ8A7DZKKZA7WXbwA+yWwVRqiICppXtg6BEJbO/SSCV/EpG7CspfjHLdxYND/p1spJwJRPDnU2twF/UmaBaNXR5fVdaxUKlA37qmjtlhTGdE9CFH59YUbyvW5RlNhV7QJSc9beiy2KmJtzwG9NtgPbduIq4ViHH+2XuwSe8J4El40hz0s+Dfn3/fvDSrMoHnlhlKdjYKqfhex5kWvCXdptX0W63OS+MN9/R9O6/ScqpygJ1NJxnAoYbu67zAux4+JKk/jUIOAF4Pbm78cJ0/Tja8A9lUaqA3c=
Content-ID: <0D9E3383EC76F047BCB1A6ED7DEEE135@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8df00d2-e2e5-46ac-5e57-08d71f3d3501
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2019 15:53:24.1951 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DbGMWQIapOPWyWOSNyKe6a0aizn3OrdO08qBHzlr0pEcKvl6fFspvMOaZONQXJgIIPVHjT9druF+bk7xlByvxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1887
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSb7YxuEi0xJH1rceqSl4HR0cnS2iv0iFuCVSVf+fIs=;
 b=jGp5/JV84TdUSedt1vTq6oHlAE6a25Y+JJhFnn5vhNM6oD1F57wiGriaqT6BLFikyonemhaUkQhUBcywEF9BhgtJEfbsCsVCyabc1rHPCWXKx1NomhnbkZsbmTMpdTJ2wZ8zE2GdMpPiz942r+YjTxle1FwrtzXt+/YHbU/C0uA=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWNrZWQtYnk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPg0K
DQpBbmRyZXkNCg0KT24gOC85LzE5IDExOjMxIEFNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOg0K
PiBUaGUgc3BzY19xdWV1ZV9wZWVrIGZ1bmN0aW9uIGlzIGFjY2Vzc2luZyBxdWV1ZS0+aGVhZCB3
aGljaCBiZWxvbmdzIHRvDQo+IHRoZSBjb25zdW1lciB0aHJlYWQgYW5kIHNob3VsZG4ndCBiZSBh
Y2Nlc3NlZCBieSB0aGUgcHJvZHVjZXINCj4NCj4gVGhpcyBpcyBmaXhpbmcgYSByYXJlIHJhY2Ug
Y29uZGl0aW9uIHdoZW4gZGVzdHJveWluZyBlbnRpdGllcy4NCj4NCj4gU2lnbmVkLW9mZi1ieTog
Q2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPiAtLS0NCj4gICBk
cml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX2VudGl0eS5jIHwgNCArKy0tDQo+ICAgMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfZW50aXR5LmMgYi9kcml2ZXJz
L2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX2VudGl0eS5jDQo+IGluZGV4IDM1ZGRiZWMxMzc1YS4u
NjcxYzkwZjM0ZWRlIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3Nj
aGVkX2VudGl0eS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfZW50
aXR5LmMNCj4gQEAgLTk1LDcgKzk1LDcgQEAgc3RhdGljIGJvb2wgZHJtX3NjaGVkX2VudGl0eV9p
c19pZGxlKHN0cnVjdCBkcm1fc2NoZWRfZW50aXR5ICplbnRpdHkpDQo+ICAgCXJtYigpOyAvKiBm
b3IgbGlzdF9lbXB0eSB0byB3b3JrIHdpdGhvdXQgbG9jayAqLw0KPiAgIA0KPiAgIAlpZiAobGlz
dF9lbXB0eSgmZW50aXR5LT5saXN0KSB8fA0KPiAtCSAgICBzcHNjX3F1ZXVlX3BlZWsoJmVudGl0
eS0+am9iX3F1ZXVlKSA9PSBOVUxMKQ0KPiArCSAgICBzcHNjX3F1ZXVlX2NvdW50KCZlbnRpdHkt
PmpvYl9xdWV1ZSkgPT0gMCkNCj4gICAJCXJldHVybiB0cnVlOw0KPiAgIA0KPiAgIAlyZXR1cm4g
ZmFsc2U7DQo+IEBAIC0yODEsNyArMjgxLDcgQEAgdm9pZCBkcm1fc2NoZWRfZW50aXR5X2Zpbmko
c3RydWN0IGRybV9zY2hlZF9lbnRpdHkgKmVudGl0eSkNCj4gICAJLyogQ29uc3VtcHRpb24gb2Yg
ZXhpc3RpbmcgSUJzIHdhc24ndCBjb21wbGV0ZWQuIEZvcmNlZnVsbHkNCj4gICAJICogcmVtb3Zl
IHRoZW0gaGVyZS4NCj4gICAJICovDQo+IC0JaWYgKHNwc2NfcXVldWVfcGVlaygmZW50aXR5LT5q
b2JfcXVldWUpKSB7DQo+ICsJaWYgKHNwc2NfcXVldWVfY291bnQoJmVudGl0eS0+am9iX3F1ZXVl
KSkgew0KPiAgIAkJaWYgKHNjaGVkKSB7DQo+ICAgCQkJLyogUGFyayB0aGUga2VybmVsIGZvciBh
IG1vbWVudCB0byBtYWtlIHN1cmUgaXQgaXNuJ3QgcHJvY2Vzc2luZw0KPiAgIAkJCSAqIG91ciBl
bml0eS4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
