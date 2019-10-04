Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4BBCB8D0
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 13:00:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F4F56E13B;
	Fri,  4 Oct 2019 11:00:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700067.outbound.protection.outlook.com [40.107.70.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5C546E13B
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 11:00:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OmZJmdS3U4wWHFt+Rmyv+xvIK5uEvO/n4sTemfKO19tbnHva0OsdRYMm1SyNyTAe4oKzXKQ9CRN08X9A8daryJt2pat7ieiI6QvQXJOVfTLufP+H6IbENb2NKigDL6GWx7G3bBgdFwm/RWI1xBbu2nHwP5ux4bHm8WOVxxMI7K6f4jEwCfKX+dy0rVxwgIrSv7vYuusLBX3tAxfixprCIBY0+c80HF1vbNJNzpY1FR9SCeRP4eRA3LkB2L2On0+UMQ2ugyBVCJBSutGLAefpvESUqU6kNjpCcz7NBB4QSe7s1HlpyologjCgUYZMDIw+ZIWsa0lN5qU0oqeaXNzwNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XIDUk64bBmTO4CF2y9/4Rp2sTmvy3nM7qXu3ybiIBxg=;
 b=EFDBv1RmAHxYa3cMsTsB8IyM4lq9p/SFm+/nNVyOYlirqwhg1oqptt4BwCCONy7uWBlrfheU6YE3pi+OFnwWuTlyVc5GGlXAxuBsGK6emAkZPIacrHYmnTJO3t+6vzAG1y7Mi66sfk2a/luBlhkO0Tsxlr1dFDFSaLu/Fb/EALG9emvsE6XXbFEY2HeCKJ+vBPnCKj2L6Zo2MWywkgErLjclI9xoU57K+fP5zkoVA9U8ynYxVCdYfK7kfV+CYbPaVNVQHakEjvXEn8dwx80xOfCnRlDWE6/btC18fFmSNPd3QYb8YN6k8aCVF+GAfNbqg7CG8LuubsBgksKf12fx7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB2376.namprd12.prod.outlook.com (52.132.143.139) by
 DM5PR12MB1482.namprd12.prod.outlook.com (10.172.37.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.23; Fri, 4 Oct 2019 11:00:15 +0000
Received: from DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::2941:f319:f890:beb0]) by DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::2941:f319:f890:beb0%7]) with mapi id 15.20.2305.023; Fri, 4 Oct 2019
 11:00:15 +0000
From: Nirmoy <nirmodas@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, Nirmoy Das
 <nirmoy.aiemd@gmail.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: Re: [PATCH] drm/amdgpu: fix memory leak
Thread-Topic: [PATCH] drm/amdgpu: fix memory leak
Thread-Index: AQHVepz+LK3ooMYyA0KdAv//MbdaAadKTA0AgAAEf4A=
Date: Fri, 4 Oct 2019 11:00:15 +0000
Message-ID: <32afa408-0968-2d1a-5add-593907636592@amd.com>
References: <20191004101746.19574-1-nirmoy.das@amd.com>
 <62ea397d-2847-04d7-3c50-6292255845c5@amd.com>
In-Reply-To: <62ea397d-2847-04d7-3c50-6292255845c5@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR06CA0077.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::18) To DM5PR12MB2376.namprd12.prod.outlook.com
 (2603:10b6:4:b9::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2003:c5:8f2d:d200:7f12:8f2c:5192:3b71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a5937b1a-503c-43cb-be5f-08d748ba0919
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR12MB1482:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1482002AD8E0AA7FA89E58AA8B9E0@DM5PR12MB1482.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 018093A9B5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(366004)(376002)(136003)(346002)(199004)(189003)(2906002)(8676002)(81166006)(14444005)(256004)(4326008)(229853002)(6246003)(31686004)(81156014)(66556008)(64756008)(6116002)(71190400001)(71200400001)(66476007)(66446008)(66946007)(6486002)(6512007)(8936002)(476003)(53546011)(386003)(6506007)(46003)(36756003)(102836004)(76176011)(316002)(25786009)(2616005)(6436002)(6636002)(11346002)(446003)(486006)(186003)(5660300002)(305945005)(7736002)(110136005)(478600001)(99286004)(54906003)(31696002)(52116002)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1482;
 H:DM5PR12MB2376.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ANQjP2xaMIydWjbyZboAknIoe3QmGnmPnZC4Obk2abW5wYqr32sQkgf3W7zxSALePrJi/BgkeiUIsuqM+xAiqiBQ/V1ZyEsJS97P6n2Usx01mIP7ZUDMblc65rBvi7LI1DzjrRJmx+vOxSkLNZ4CNfZx7Yvn3vd/g9IqsqfyN7YX0e87QVL1OFy+/0Vbw++gZPk5bp/JgHDPKaA2z6w8q7o4QqeiMUw1AJ3wGLq1DEATdfrx4lYa3TKGRCfg389NpDBpKVZLKu1uxx35wvsXPzfme1S9TL3d0V72798SA9zoIp2cKM3E5gjKkphjBoAbHSCluCDHfyWLdFttjdOAepZ5kN15i9coCJIi5KuPGyxVboOshueQGxu2Z60ldhTCsZAzyFEEAO8kGV5O7uWKX5NC+s1vcuEe1ZOgb8lKJu4=
Content-ID: <2B5F8723BA822A4BA678D07A44512CD0@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5937b1a-503c-43cb-be5f-08d748ba0919
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2019 11:00:15.1952 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DlRKd78c3eq5ptEGSG9mq73Ip3dLBXQXNXVah8yadat4TVH4yT539FhiXzL2/NXJ7as4uDfTWYxFxMSN3utWfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1482
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XIDUk64bBmTO4CF2y9/4Rp2sTmvy3nM7qXu3ybiIBxg=;
 b=1cP7h0Ny7ozI1vKeO21ahSc4+Ndo72AT1ffHnfm8AEgBSiKstNFKFJwrccx1Wk49haMgvyEyZKk2dOTaYKRI/0dhq1eOGAbABUnXGxkVwUWfWuKQJYPeTAHsfFXMmnssLzx/Wz+oCqdGgZuth4QRAqleSG2v9Rm8E2IIxuFI+yY=
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
Cc: "airlied@linux.ie" <airlied@linux.ie>, "Das, Nirmoy" <Nirmoy.Das@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQpPbiAxMC80LzE5IDEyOjQ0IFBNLCBLb2VuaWcsIENocmlzdGlhbiB3cm90ZToNCj4gRmlyc3Qg
b2YgYWxsIHBsZWFzZSBzZW5kIG1haWxzIHJlZ2FyZGluZyBhbWRncHUgdG8gdGhlIGFtZC1nZngg
bWFpbGluZw0KPiBsaXN0IGFuZCBub3QgbGttbC9kcmktZGV2ZWwuDQpPa2F5Lg0KPiBBbSAwNC4x
MC4xOSB1bSAxMjoxNyBzY2hyaWViIE5pcm1veSBEYXM6DQo+PiBJbiBhbWRncHVfYm9fbGlzdF9p
b2N0bCB3aGVuIGlkcl9hbGxvYyBmYWlscw0KPj4gZG9uJ3QgcmV0dXJuIHdpdGhvdXQgZnJlZWlu
ZyBibyBsaXN0IGVudHJ5Lg0KPj4NCj4+IEZpeGVzOiA5NjRkMGZiZjYzMDFkICgiZHJtL2FtZGdw
dTogQWxsb3cgdG8gY3JlYXRlIEJPIGxpc3RzIGluIENTIGlvY3RsIHYzIikNCj4+DQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBOaXJtb3kgRGFzIDxuaXJtb3kuZGFzQGFtZC5jb20+DQo+PiAtLS0NCj4+ICAg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9ib19saXN0LmMgfCAyICstDQo+PiAg
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4+DQo+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2JvX2xpc3QuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9ib19saXN0LmMNCj4+IGluZGV4IDdi
Y2Y4NmM2MTk5OS4uYzNlNWVhNTQ0ODU3IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2JvX2xpc3QuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2JvX2xpc3QuYw0KPj4gQEAgLTI4NCw3ICsyODQsNyBAQCBpbnQgYW1k
Z3B1X2JvX2xpc3RfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwNCj4+
ICAgIAkJbXV0ZXhfdW5sb2NrKCZmcHJpdi0+Ym9fbGlzdF9sb2NrKTsNCj4+ICAgIAkJaWYgKHIg
PCAwKSB7DQo+PiAgICAJCQlhbWRncHVfYm9fbGlzdF9wdXQobGlzdCk7DQo+PiAtCQkJcmV0dXJu
IHI7DQo+PiArCQkJZ290byBlcnJvcl9mcmVlOw0KPiBOQUssIHRoYXQgaXMgYSBkb3VibGUgZnJl
ZS4gVGhlIGJvIGxpc3QgZW50cmllcyBhcmUgZnJlZWQgYnkNCj4gYW1kZ3B1X2JvX2xpc3RfcHV0
KCkuDQpUaGFua3MsIGRpZG4ndCByZWFsaXplIHRoYXQuDQo+IFJlZ2FyZHMsDQo+IENocmlzdGlh
bi4NCg0KUmVnYXJkcywNCg0KTmlybW95DQoNCj4+ICAgIAkJfQ0KPj4gICAgDQo+PiAgICAJCWhh
bmRsZSA9IHI7DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
