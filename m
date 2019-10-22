Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE70DFDDD
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 08:54:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63D026E3E1;
	Tue, 22 Oct 2019 06:54:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740051.outbound.protection.outlook.com [40.107.74.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 058966E3D8;
 Tue, 22 Oct 2019 06:54:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bd21J+SikT++yoowkG2DQ2o+rAeUlrI9zg2aNAYgXJtkf1IwpXBmSI2s/STurJuXWk35tS7DUnXh9MwzfqT9bxyIvjIVzR0v65Av3bpCC8wmgP/xJ7fCAHXYtGK7QuHZkh51J+kygRZ7xwFTY8oO8GGXsv2IIw3rTTuYp0/ftr97SBjA9JJMIiHc8Po50BROUUaUZRUJQ8vG0mEc4Z6/Uz3SNbD0O2xl97kG+AvMoqD/+vgXFc/PDgXXhZlTU99COZ59L/Y1F7LF1uRK0osi/2qoyXEa2pDXTL1+RSQJ6tRFb4xJu682RGzXvJXJuNciLSDT1I8BaD6Omt1RAFv9fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L9jj67AIbtLVV+wtEsGcthC8gbbf7KW0xOmDTgUeFLA=;
 b=FxGBgE1pVhKVLXAxH7YMuDfBB86JLmovOzGv9SPVmPRUw+6kK/lqChrBxQRsCo01v7E4F5PFJMKU8TsHCfqEJw8n9B2vrXypFnZfy6sjL/TZi4z7/LGZRVqsgTmFxIEY+LpsyR+15AAcql6okelBBxfi/jSSbpjz91YgCGkM+7R4hidGmqb1XCy4SfiDhf2kM8+g8wZjYj2th3B/LIao/y6S/xKc8gb/1Xjt85RL964OGHhj9Cd/dgmJrM9IJBB/haGhBtVUHniOgVdT1JoemSbLW8OL8IvMgV5lX6uCjiZiDypCecPUi3fgi2VTO0u7Mo3dMcz6DYA1pcwE7pWL7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1530.namprd12.prod.outlook.com (10.172.34.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.20; Tue, 22 Oct 2019 06:54:13 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::7428:f6b3:a0b1:a02e]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::7428:f6b3:a0b1:a02e%10]) with mapi id 15.20.2347.029; Tue, 22 Oct
 2019 06:54:13 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Navid Emamdoost <navid.emamdoost@gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix memory leak in amdgpu_fence_emit
Thread-Topic: [PATCH] drm/amdgpu: Fix memory leak in amdgpu_fence_emit
Thread-Index: AQHViDq/P8TbUvdRQEq868WpdR2sDKdmOogA
Date: Tue, 22 Oct 2019 06:54:13 +0000
Message-ID: <fad3d810-d3bd-ccdf-1d21-f5a483597043@amd.com>
References: <20191021180944.22183-1-navid.emamdoost@gmail.com>
In-Reply-To: <20191021180944.22183-1-navid.emamdoost@gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM0PR0102CA0013.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:14::26) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8c80dfa4-556e-4542-7b4d-08d756bca5b5
x-ms-traffictypediagnostic: DM5PR12MB1530:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1530B2C030712C2AC805182783680@DM5PR12MB1530.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 01986AE76B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(376002)(136003)(396003)(346002)(189003)(199004)(6506007)(4326008)(6486002)(386003)(2616005)(476003)(186003)(52116002)(229853002)(99286004)(6246003)(11346002)(256004)(14444005)(478600001)(25786009)(486006)(6436002)(76176011)(46003)(446003)(6512007)(102836004)(65806001)(4744005)(31686004)(6916009)(65956001)(36756003)(58126008)(8936002)(31696002)(14454004)(54906003)(8676002)(81166006)(71190400001)(81156014)(66574012)(316002)(71200400001)(86362001)(2906002)(6116002)(5660300002)(7416002)(66946007)(64756008)(66556008)(66446008)(66476007)(7736002)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1530;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JALPQFOlx3JS5KMwNgOKUItH4dl05UcKP37Un5oz8503HIP0RZc+0ak1oE5LJH1hLTM1GenLH4s1rH1D6pIU9kDn3LUVJbBmrY+Pa0ikVrJ59TXw9oslXl9zE02wx1fLhzcMiuaz6skvj7hJwzMLyDJ9O5LubxSYiwbDBIOjtawyIxsnOPMDWlfnSrf2NJz4zRij5RVSDWBsLmMNzi41jeeISSAYOMd3GMRBDI0wsH+yuys1x3Cpvjf+Mok+AvZc0G9Jc+DY/ckmF71uoYsmEcxzqVA8U6ksjL+aOw59MyTT/1aJlkfQqFKJF10m9OgZihzctJ7KX+YM2dO2uU3BMmcVZX3vFZYUdCNFNghDrlB6WgNZD3ppiyKHzhZJzZt2RjdfQGSydL09y2aGnhwkDk6jNnEPs4huDyBz5zK3vgiB8rBY3wQp0oIJYyt/RT5p
Content-ID: <F7F816AE92352B4E8833E3EBD9AB3B3B@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c80dfa4-556e-4542-7b4d-08d756bca5b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2019 06:54:13.3397 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uKPriWDWFZr3AF7qstVIPpzGV3U6/xGA0Oy3gUgbOf9c8NzNILhDxCefYpy5dUpb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1530
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L9jj67AIbtLVV+wtEsGcthC8gbbf7KW0xOmDTgUeFLA=;
 b=KFNyTsvYxfpAqr1SIeDD9xCrmOVKMU8ZezFDVaeL5TZZ+a4e2rUL7X6QH9fV9Y1VNybR3MwDjX5lGVKOOesmeNayJ7nPpMttG0JZwRDGCh7Cig3IBweK4B9l4xzVEZotdjwoljcPMsA32MAwhYZyDIwKrmOo/tKo9JOb4NOnmDI=
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, David Airlie <airlied@linux.ie>,
 "kjlu@umn.edu" <kjlu@umn.edu>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "emamd001@umn.edu" <emamd001@umn.edu>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "smccaman@umn.edu" <smccaman@umn.edu>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Quan, 
 Evan" <Evan.Quan@amd.com>, Sam Ravnborg <sam@ravnborg.org>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjEuMTAuMTkgdW0gMjA6MDkgc2NocmllYiBOYXZpZCBFbWFtZG9vc3Q6DQo+IEluIHRoZSBp
bXBlbGVtZW50YXRpb24gb2YgYW1kZ3B1X2ZlbmNlX2VtaXQoKSBpZiBkbWFfZmVuY2Vfd2FpdCgp
IGZhaWxzDQo+IGFuZCByZXR1cm5zIGFuIGVycm5vLCBiZWZvcmUgcmV0dXJuaW5nIHRoZSBhbGxv
Y2F0ZWQgbWVtb3J5IGZvciBmZW5jZQ0KPiBzaG91bGQgYmUgcmVsZWFzZWQuDQo+DQo+IEZpeGVz
OiAzZDJhY2E4Yzg2MjAgKCJkcm0vYW1kZ3B1OiBmaXggb2xkIGZlbmNlIGNoZWNrIGluIGFtZGdw
dV9mZW5jZV9lbWl0IikNCj4gU2lnbmVkLW9mZi1ieTogTmF2aWQgRW1hbWRvb3N0IDxuYXZpZC5l
bWFtZG9vc3RAZ21haWwuY29tPg0KDQpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9mZW5jZS5jIHwgNCArKystDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ZlbmNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZmVuY2UuYw0KPiBpbmRleCAyMzA4NWIzNTJjZjIuLjJmNTljOTI3MGE3ZSAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ZlbmNlLmMNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ZlbmNlLmMNCj4gQEAgLTE2
Niw4ICsxNjYsMTAgQEAgaW50IGFtZGdwdV9mZW5jZV9lbWl0KHN0cnVjdCBhbWRncHVfcmluZyAq
cmluZywgc3RydWN0IGRtYV9mZW5jZSAqKmYsDQo+ICAgCQlpZiAob2xkKSB7DQo+ICAgCQkJciA9
IGRtYV9mZW5jZV93YWl0KG9sZCwgZmFsc2UpOw0KPiAgIAkJCWRtYV9mZW5jZV9wdXQob2xkKTsN
Cj4gLQkJCWlmIChyKQ0KPiArCQkJaWYgKHIpIHsNCj4gKwkJCQlkbWFfZmVuY2VfcHV0KGZlbmNl
KTsNCj4gICAJCQkJcmV0dXJuIHI7DQo+ICsJCQl9DQo+ICAgCQl9DQo+ICAgCX0NCj4gICANCg0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
