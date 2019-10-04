Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC08CB949
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 13:36:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA9B86EB45;
	Fri,  4 Oct 2019 11:36:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700084.outbound.protection.outlook.com [40.107.70.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B1006EB45
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 11:36:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EgzLs6zYJHEVJMKPwedafN1xB/vXyjmKvTX4oZjBUFT6wvWb/C9tTo0shqn+bgVZlP1Xu6S/CNyY2etaEp6nS/06kCWb1O6AD9wnHah7X0ybUKN73M63ta0B2FJipU/7HnSSR4Efdnmjoh0NSwn0tp1bS8XKRIHs9eaXjS/pe0jHxHpFYBWvXwEEMw0ZdStd5vhPMDzvZEiZw7mcI4iP0AA7g5/mHQGqIkJ4f7c0gLkAyH+xKcRaG11lMScS1s9uyfhzLxSxby+qYU/Stbq+MAiMFPlP1YR28Femyfhiweas5QBTYBuhs5LT7uzVkcn7h1ZWN+4hhnR9WcRM5vTcuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dsj3ry4eOYYXIegmxc7cdQFZyjskzax6oVgd7GEN/3U=;
 b=UE3IC7OCJHE1CaAPZPq86M/7l7ekGxsB3cGpENzwi0YXDceiL5x9AtjDyw7pokqafcbQGefyQSfShxc0hLRGcrwU1LMSTP0rflrRNhAy2LSS4XM1oqlyPm2zqukQcYZu5O+HEEPEIN8pkRbYit05M1ZwNd4gfAvPOi750iI6GN5YzlfdLMA63VygyyWQVKkXSJBu+gmwFBjZerLe/f3PSAWKvxoVYhOiGdHxgFs6xxEmCFJuwjn0pCyG2LIWxSIs0/9SNncKAvH1x5yqewCSyEhyBz3/haOmPmn2cWEBui8bldJrqtF+v2Q5c0NAsY/yDzkQOkPXTb/p48PhSdn2zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB2376.namprd12.prod.outlook.com (52.132.143.139) by
 DM5PR12MB1676.namprd12.prod.outlook.com (10.172.36.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Fri, 4 Oct 2019 11:36:10 +0000
Received: from DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::2941:f319:f890:beb0]) by DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::2941:f319:f890:beb0%7]) with mapi id 15.20.2305.023; Fri, 4 Oct 2019
 11:36:10 +0000
From: Nirmoy <nirmodas@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Das, Nirmoy"
 <Nirmoy.Das@amd.com>, Nirmoy Das <nirmoy.aiemd@gmail.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Subject: Re: [PATCH] drm/amdgpu: fix memory leak
Thread-Topic: [PATCH] drm/amdgpu: fix memory leak
Thread-Index: AQHVepz+LK3ooMYyA0KdAv//MbdaAadKTA0AgAAEf4CAAAO5gIAAA4IAgAABSQCAAAGCAA==
Date: Fri, 4 Oct 2019 11:36:09 +0000
Message-ID: <d5dc0a2d-4950-d85a-a45b-5e8e0eda6447@amd.com>
References: <20191004101746.19574-1-nirmoy.das@amd.com>
 <62ea397d-2847-04d7-3c50-6292255845c5@amd.com>
 <32afa408-0968-2d1a-5add-593907636592@amd.com>
 <4d665d18-2109-675e-dd69-c15bd0b2a011@amd.com>
 <e79aa8f8-5198-bfd9-3f69-e7975bac3232@amd.com>
 <fef8697b-30c4-e4e1-f45c-d3377dbd444e@amd.com>
In-Reply-To: <fef8697b-30c4-e4e1-f45c-d3377dbd444e@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR0102CA0005.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:14::18) To DM5PR12MB2376.namprd12.prod.outlook.com
 (2603:10b6:4:b9::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2003:c5:8f2d:d200:7f12:8f2c:5192:3b71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4880813e-0500-4572-27bb-08d748bf0d6d
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR12MB1676:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB167642A33DA246A7728E80538B9E0@DM5PR12MB1676.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 018093A9B5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(39860400002)(396003)(366004)(346002)(199004)(189003)(66946007)(66476007)(66446008)(6486002)(66556008)(76176011)(64756008)(2906002)(305945005)(14454004)(71190400001)(8936002)(36756003)(52116002)(6506007)(229853002)(31696002)(386003)(53546011)(478600001)(102836004)(5660300002)(6246003)(186003)(31686004)(2616005)(476003)(14444005)(446003)(11346002)(6436002)(256004)(486006)(8676002)(25786009)(110136005)(99286004)(316002)(54906003)(6636002)(6116002)(6512007)(4326008)(81166006)(46003)(7736002)(71200400001)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1676;
 H:DM5PR12MB2376.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jfBTdozpO/dLPc55cw+uLtuFYck6poul+QUvk4m+6F3ORtqlbsyu4Lu6muiBAbHgfpDtG3NnxeXuydU4YaT9pkhT91bPXhccp5p89U0sB9BkrT/CkqdcM8Ibrapa4bxPNjdIhbnZQr65FoX4hftzGNr8KITMKTAkuMPy4903uToRgoKzMx6aiUrkN+NwbR+iX+bVoQpqrzksf5FXfIYM6XhOly4MoQU4o3O+OIe3lGnLslu11fJtI5nwl1lk7VEhQRMWJ/M2xBmO6SDwUZdak6kj2ZOagFnYkp37GyFO08ABsODDd7vS0RrvLpRMiwgkSFo2xpI7dms7Woi1exyycFAqdUaU/QLzWdpkx8Y528regYipCC8F52n4bMF1QhbVyuWRsr7wZ7hP4z8vIt1mdkx5RXRivH1oXBgyKFnvaHc=
Content-ID: <531F55066347504497DD7BFAFAB9F4D8@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4880813e-0500-4572-27bb-08d748bf0d6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2019 11:36:09.8794 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HXSiZ4JIUzoOIzXksyfNaRWsBEohwq5O3eIdB9bxUl1eUPrJ54jvMdFcWiYto20XEAgJKRCec8TkjFueBw/62w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1676
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dsj3ry4eOYYXIegmxc7cdQFZyjskzax6oVgd7GEN/3U=;
 b=vElcvfBmd+Bu+yt4b50+SP7uDLaJTU4tYMXGV59ex6W1FfhHFQVlYD4M1Kup4x/wZvC+etEfPqZGXFfBKpCIwWgWbortWk3N3BsNN94ZJyNutwhis7X+55oUWA1jCFra9oyBM4T8f9Ck57yKEqWMAh1INnJJhDFAICzFK8b+B8Y=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nirmoy.Das@amd.com; 
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQpPbiAxMC80LzE5IDE6MzAgUE0sIEtvZW5pZywgQ2hyaXN0aWFuIHdyb3RlOg0KPiBBbSAwNC4x
MC4xOSB1bSAxMzoyNiBzY2hyaWViIERhcywgTmlybW95Og0KPj4gT24gMTAvNC8xOSAxOjEzIFBN
LCBLb2VuaWcsIENocmlzdGlhbiB3cm90ZToNCj4+Pj4+IE5BSywgdGhhdCBpcyBhIGRvdWJsZSBm
cmVlLiBUaGUgYm8gbGlzdCBlbnRyaWVzIGFyZSBmcmVlZCBieQ0KPj4+Pj4gYW1kZ3B1X2JvX2xp
c3RfcHV0KCkuDQo+Pj4+IFRoYW5rcywgZGlkbid0IHJlYWxpemUgdGhhdC4NCj4+PiBXYWl0IGEg
c2Vjb25kLCB3aGF0IGVudHJpZXMgYXJlIHlvdSB0YWxraW5nIGFib3V0Pw0KPj4+DQo+Pj4gVGhl
IGVudHJpZXMgaW4gdGhlIGxpc3Qgb2JqZWN0IGFyZSBmcmVlZCB3aGVuIGFtZGdwdV9ib19saXN0
X3B1dCgpIGlzDQo+Pj4gY2FsbGVkLCBidXQgdGhlIHRlbXBvcmFyeSBpbmZvIGFycmF5IHdpdGgg
dGhlIGhhbmRsZXMgbmVlZHMgdG8gYmUgZnJlZWQNCj4+PiBhcyB3ZWxsLg0KPj4+DQo+Pj4gQW5k
IGl0IGxvb2tzIGxpa2UgdGhhdCBpcyBpbmRlZWQgbGVha2VkIGhlcmUuDQo+PiBJIGFtIHRhbGtp
bmcgYWJvdXQgdGhlIGBpbmZvYCBhcnJheSBjcmVhdGVkIGJ5DQo+PiBhbWRncHVfYm9fY3JlYXRl
X2xpc3RfZW50cnlfYXJyYXkoKS4NCj4gWWVhaCwgdGhhdCBhcmUgdGhlIGhhbmRsZXMgYW5kIG5v
dCB0aGUgZW50cmllcy4gU29ycnkgdGhhdCBJIHdhcw0KPiBjb25mdXNlZCBhYm91dCB0aGF0Lg0K
Pg0KPiBZb3VyIHBhdGNoIGlzIGNvcnJlY3QsIHlvdSBzaG91bGQganVzdCB1cGRhdGUgdGhlIGNv
bW1pdCBtZXNzYWdlIGEgYml0Lg0KPg0KPiBCVFc6IENvdWxkIHlvdSBjbGVhbnVwIGVycm9yIGhh
bmRsaW5nIGhlcmUgYSBiaXQgbW9yZT8NCj4NCj4gRS5nLiBhZGQgYW4gZXJyb3JfcHV0X2xpc3Qg
aGFuZGxlIGFuZCBkcm9wIHRoZSAiaWYgKGluZm8pIiBhbmQgaW5zdGVhZA0KPiByZXR1cm4gZGly
ZWN0bHkgaWYgd2UgZmFpbCB0byBhbGxvY2F0ZSBpbmZvLg0KT2theSBJIHdpbGwgZG8gdGhhdCBp
biB2MiBvZiB0aGlzIHBhdGNoLg0KPiBUaGFua3MsDQo+IENocmlzdGlhbi4NCg0KDQpSZWdhcmRz
LA0KDQpOaXJtb3kNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
