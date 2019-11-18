Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C86FFEF0
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 07:56:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF7A489F0A;
	Mon, 18 Nov 2019 06:56:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790088.outbound.protection.outlook.com [40.107.79.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AA0389F0A;
 Mon, 18 Nov 2019 06:56:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RPLf3JsxFTb1CK4CfTzZDXNyG6s2lbZMwRyzSLQw5R/zlN22cWHLWwR7KvGQGAqWj4S15opoYpDIJFW/jwu2vRl99wbbZia/xYu/9m1wjcQI8vSEJorrrfSTwGr7SkinTwCf5Q0fbBjGKmSYFyPhuEI2GVeVY/+UoYnh2LOvZmVw4uk1WfeflbZISRfeel9C8jkY8bi47PdK86IF/oWTr2Cd5Vh1E51BXaHb2BINpGKfCiJYgn8Zn9MS80AuZDnQkyNamXSXcrFaC/p0HNItSfnDsmhIeh7IVuKtx//SjcTKscBVndw9qg1R2P93h7dJFoaXajUpXImJMesB/SDusg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Zo3x93dycOYai4jq/z68+1Tm0SiwMlHV6u6ODxinCs=;
 b=OYy43wMbGsbGyxAYRNpWxgY1NHQBHbU6byvEyOhb2GHPZb89wihTSC50iTSjYDkcvqOIJyVDAgQsoHMd7Bq98NfrBRV4dL6o2KfP7hnl9TMNYYuf74NjirskqAmdtSWHF5MSAvi3e6ZmSUVs4+BY1xIP+gXXk3jzxTicV1DTyHljtPLkKQxZe+ftzwqzEvbZkamxib7gnpT86g5L3bJH9Oc+hZrtaJyRG9bpKuaI63+Re9qt7/tzVQNwS4pvQr+Vc6bYEMw9IljrL5NxIARqAdBQJo0XisViRzjdCuksSKqrdF6lJNBiBx1kPAG8P1exKyCO9Ci+t3NKRNFeUcpraw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB2893.namprd12.prod.outlook.com (20.179.83.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23; Mon, 18 Nov 2019 06:56:44 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::5895:bbd8:c1d6:1587]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::5895:bbd8:c1d6:1587%7]) with mapi id 15.20.2451.029; Mon, 18 Nov 2019
 06:56:44 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Colin King <colin.king@canonical.com>, Rex Zhu <rex.zhu@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH][next] drm/amdgpu/powerplay: fix dereference before null
 check of pointer hwmgr
Thread-Topic: [PATCH][next] drm/amdgpu/powerplay: fix dereference before null
 check of pointer hwmgr
Thread-Index: AQHVm5nDtS8eL8LCskyvgcx9Z3hY8KeQgtBg
Date: Mon, 18 Nov 2019 06:56:43 +0000
Message-ID: <MN2PR12MB3344F8D7498FC9DA8302AD05E44D0@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20191115094754.40920-1-colin.king@canonical.com>
In-Reply-To: <20191115094754.40920-1-colin.king@canonical.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 17a4f8e2-ee22-441c-b14e-08d76bf478e9
x-ms-traffictypediagnostic: MN2PR12MB2893:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB2893F6DA039DF8734B10DC8DE44D0@MN2PR12MB2893.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1850;
x-forefront-prvs: 0225B0D5BC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(396003)(39860400002)(366004)(13464003)(199004)(189003)(6116002)(81156014)(81166006)(54906003)(55016002)(9686003)(71190400001)(71200400001)(7696005)(256004)(14444005)(26005)(3846002)(33656002)(486006)(6246003)(476003)(5660300002)(99286004)(76116006)(76176011)(11346002)(25786009)(2501003)(102836004)(6436002)(2906002)(8936002)(8676002)(229853002)(305945005)(66476007)(66556008)(6506007)(7736002)(316002)(53546011)(4326008)(110136005)(66446008)(64756008)(446003)(14454004)(52536014)(478600001)(74316002)(86362001)(66066001)(2201001)(186003)(66946007)(17423001)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2893;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MON2f3clSE/nUMktQmAgGepG2lrPEzEobuDF7OnCu6DptbajcRnosUXN5c5ED3IL2wpqYHYyHn/WR7G2NqI6NIcspQNgUo1ocKAusA1MqyV4d+oUXyMIe+nnLrvKQQUoSrGyx6OhoIuq9EW1EON+D7F2RRgWjexvG6D+jn6GWw/PT/XPhFve6gQXpMInmNoQtEYEnTssQo1A30Lq3gSpUNvArpVgucgFZEMc397MmX5x6JL9WtA0/Cqv84qw6wBB09fzhl+JNZdsqNYLzJW53CcWlsKBwCAXqhTOit0fmdKvHmUtwKX3lzi8OMQtahNAAQOYHPE11aaczixSGgDvmYHHKXWE5+GuDXBsOwUA40Rjnxjj7wPxHnUPh2+jiN+e5+ELaTo3IYBEiDgfVBpTEjtStmbBWwDdPQy61mjzcy64S2QEKGYtPditMCIBwEy8
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17a4f8e2-ee22-441c-b14e-08d76bf478e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2019 06:56:44.0058 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nTQ13I1eE0WUMFUOhZb/RxNgROZj4SSythP2fL0Vh8KUNxbn764S6TAfG0bRBU3i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2893
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Zo3x93dycOYai4jq/z68+1Tm0SiwMlHV6u6ODxinCs=;
 b=CCfCHIfJu81wtMvDGSEzs4e0ffuckxHaHGSTxgybRUy/kGouOA0O22LzxtHRj1s6fp8o0L1FV/RGkXmVC3MqSbnYs78HDJDgRv9dc+62wzu0CWmD5kXGWCAg48rLpiRN4Z+ifq1iwLg55Qq+Fm3K77uPYrDAXmkykEwA2jyx2Hw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+DQoNCi0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBDb2xpbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5j
b20+IA0KU2VudDogRnJpZGF5LCBOb3ZlbWJlciAxNSwgMjAxOSA1OjQ4IFBNDQpUbzogUmV4IFpo
dSA8cmV4LnpodUBhbWQuY29tPjsgUXVhbiwgRXZhbiA8RXZhbi5RdWFuQGFtZC5jb20+OyBEZXVj
aGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBLb2VuaWcsIENocmlz
dGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPjsgWmhvdSwgRGF2aWQoQ2h1bk1pbmcpIDxE
YXZpZDEuWmhvdUBhbWQuY29tPjsgRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPjsgRGFu
aWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBrZXJuZWwtamFuaXRvcnNA
dmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQpTdWJqZWN0OiBb
UEFUQ0hdW25leHRdIGRybS9hbWRncHUvcG93ZXJwbGF5OiBmaXggZGVyZWZlcmVuY2UgYmVmb3Jl
IG51bGwgY2hlY2sgb2YgcG9pbnRlciBod21ncg0KDQpGcm9tOiBDb2xpbiBJYW4gS2luZyA8Y29s
aW4ua2luZ0BjYW5vbmljYWwuY29tPg0KDQpUaGUgYXNzaWdubWVudCBvZiBhZGV2IGRlcmVmZXJl
bmNlcyBwb2ludGVyIGh3bWdyIGJlZm9yZSBod21nciBpcyBudWxsIGNoZWNrZWQsIGhlbmNlIHRo
ZXJlIGlzIGEgcG90ZW50aWFsIG51bGwgcG9pbnRlciBkZWZlcmVuY2UgaXNzdWUuIEZpeCB0aGlz
IGJ5IGFzc2lnbmluZyBhZGV2IGFmdGVyIHRoZSBudWxsIGNoZWNrLg0KDQpBZGRyZXNzZXMtQ292
ZXJpdHk6ICgiRGVyZWZlcmVuY2UgYmVmb3JlIG51bGwgY2hlY2siKQ0KRml4ZXM6IDA4OTZkMmY3
YmE0ZCAoImRybS9hbWRncHUvcG93ZXJwbGF5OiBwcm9wZXJseSBzZXQgUFBfR0ZYT0ZGX01BU0si
KQ0KU2lnbmVkLW9mZi1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNv
bT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL2h3bWdyLmMgfCA0
ICsrKy0NCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQoN
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9od21nci5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvaHdtZ3IuYw0KaW5kZXggNDQz
NjI1YzgzZWM5Li5kMjkwOWM5MWQ2NWIgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9od21nci9od21nci5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9od21nci9od21nci5jDQpAQCAtODEsNyArODEsNyBAQCBzdGF0aWMgdm9pZCBod21ncl9p
bml0X3dvcmtsb2FkX3Byb3JpdHkoc3RydWN0IHBwX2h3bWdyICpod21ncikNCiANCiBpbnQgaHdt
Z3JfZWFybHlfaW5pdChzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyKSAgew0KLQlzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldiA9IGh3bWdyLT5hZGV2Ow0KKwlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
djsNCiANCiAJaWYgKCFod21ncikNCiAJCXJldHVybiAtRUlOVkFMOw0KQEAgLTk2LDYgKzk2LDgg
QEAgaW50IGh3bWdyX2Vhcmx5X2luaXQoc3RydWN0IHBwX2h3bWdyICpod21ncikNCiAJaHdtZ3Jf
aW5pdF93b3JrbG9hZF9wcm9yaXR5KGh3bWdyKTsNCiAJaHdtZ3ItPmdmeG9mZl9zdGF0ZV9jaGFu
Z2VkX2J5X3dvcmtsb2FkID0gZmFsc2U7DQogDQorCWFkZXYgPSBod21nci0+YWRldjsNCisNCiAJ
c3dpdGNoIChod21nci0+Y2hpcF9mYW1pbHkpIHsNCiAJY2FzZSBBTURHUFVfRkFNSUxZX0NJOg0K
IAkJYWRldi0+cG0ucHBfZmVhdHVyZSAmPSB+UFBfR0ZYT0ZGX01BU0s7DQotLQ0KMi4yMC4xDQoN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
