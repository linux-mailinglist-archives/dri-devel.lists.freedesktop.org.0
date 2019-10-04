Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB35ECB8EE
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 13:13:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A350C6EB27;
	Fri,  4 Oct 2019 11:13:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680040.outbound.protection.outlook.com [40.107.68.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A789A6EB27
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 11:13:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dRXvBXHaFNBSniJnmug0SFRZimonVdbpKzOt+a+k7cgj0Vaasw8CjN1z1llIvuDBoU82AOFHg7GIZzT7w7IlNZImF3FZ5pgJXHClnthbFWsABLomVbe7KBwJztyTU8iFf9vtYxIURLgkikUemTWLmE0pEUohBZNpquzXH3/3TYZ8EQZXwZtPPl5OVVs57qfhZ0rakxc/tJ/tNSlMmt0iQjRHMbwKZh+B7hAzbIXIhf5TmME3AuPpfZr8dWatP8NH64rW+jBvUt94t10ywk7FgYRqEOODv/w3//K/GdIiqMYPtkwLovwRT2FFWiMj2YEmH4H5EpOL8ooZVc49aJ+mAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1a1EGyP2WROcVB1PHYvXO2ZYy6lUqYedWiWN9z0cWcI=;
 b=QRB3w9pYZ8hGGTm3Qf6GhMAx/sTzOfaXsvDfOPGmjhenTaLtbiZi67E8rPcwdDbeonUfiyy6kXjBnv6wRpgakN0cMSSHiOk7uO+/7ppxSW0m1EfblLKcKQW+IPPBKqfiaxCLSZpRnwjWA0oJafGe1ENpuQYprb4YMuzw9mMeuHrSv0x61jCZ8wvskgf1YlyvLcAfXpcgRgx0mOlDR3oG+EYUhS3rl7TX+L49gsgqZDpWLwQvMX14x82Gv89fInRGCQ4QunAhJ7Knl7UM5SlRlqTRkUNWj3YSoZUWWayPWpbs8v6WY5auXeW52YqLQUj5dPMMCjbvanaebxLke+DVVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1770.namprd12.prod.outlook.com (10.175.86.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.23; Fri, 4 Oct 2019 11:13:29 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::7428:f6b3:a0b1:a02e]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::7428:f6b3:a0b1:a02e%10]) with mapi id 15.20.2327.023; Fri, 4 Oct 2019
 11:13:29 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Das, Nirmoy" <Nirmoy.Das@amd.com>, Nirmoy Das <nirmoy.aiemd@gmail.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: Re: [PATCH] drm/amdgpu: fix memory leak
Thread-Topic: [PATCH] drm/amdgpu: fix memory leak
Thread-Index: AQHVepz+9tzYVi1V60uU+pu6QVo02qdKTAYAgAAEjYCAAAOrgA==
Date: Fri, 4 Oct 2019 11:13:29 +0000
Message-ID: <4d665d18-2109-675e-dd69-c15bd0b2a011@amd.com>
References: <20191004101746.19574-1-nirmoy.das@amd.com>
 <62ea397d-2847-04d7-3c50-6292255845c5@amd.com>
 <32afa408-0968-2d1a-5add-593907636592@amd.com>
In-Reply-To: <32afa408-0968-2d1a-5add-593907636592@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM0PR01CA0052.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:e6::29) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7bf82198-b1cb-4551-ac96-08d748bbe270
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR12MB1770:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB17703B129AB6622866E44776839E0@DM5PR12MB1770.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 018093A9B5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(39860400002)(376002)(346002)(366004)(189003)(199004)(2616005)(102836004)(86362001)(186003)(46003)(31696002)(316002)(476003)(25786009)(31686004)(52116002)(65806001)(65956001)(76176011)(305945005)(7736002)(2906002)(6636002)(8936002)(66446008)(11346002)(6116002)(386003)(110136005)(6506007)(53546011)(54906003)(58126008)(99286004)(8676002)(446003)(81166006)(81156014)(66946007)(66476007)(64756008)(36756003)(66556008)(229853002)(6512007)(6436002)(71200400001)(14444005)(71190400001)(6486002)(256004)(6246003)(5660300002)(4326008)(486006)(14454004)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1770;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TQbRJye8HHVnHw6bD6D+bIQxZrRz9+rDo9NUJrwufvv7jbTmP6jkdsP5fO6Z+otOb3Cf18yUfk0qK+3jYmMCi0SPqB57bLmagSGkL+AxtnQiZAFyKw39gMtfAIbZPHi4I0BQMk6WcKAI7QbPJJ9Jza0AHzI6VSoimvleSKSlJKm9SylLdIAS8QxjqsEWAd9/IZfZjeKdiqObfAd2aEcLbzSI2KjkuqJSJQWPCi2JNy4HYLug7kDALy9IazPk40HD3+F7hf0N6FBkk8f4JLzEtuoALA0vEVRWZ8PAQS6Iw2y8H1Q7cUJg+kxDCTR4FtgVgckFdYmoBk5SGBlbZK/RPYDJbHZemz7nAPr999l3mMD1fkha/msN4u2D8X9VJZslxD9zLiDX8DQXxc6qLG7nGvZhBOqFnQvBb+415F8JUUw=
Content-ID: <E285AF9157C6FB40B13EC50B15013643@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bf82198-b1cb-4551-ac96-08d748bbe270
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2019 11:13:29.4892 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8uv6815Zl9djobzsxuMtU+8IeQguVmnIMDGEWdG9LcREeF4BaMawGb2U1HeZIUfv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1770
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1a1EGyP2WROcVB1PHYvXO2ZYy6lUqYedWiWN9z0cWcI=;
 b=UuscOR3jdLKbv3PSU+FVpgZYnf6sfEL6KYokAdau8tMd6nQ01uPSqg1RbkSlxAMad0dpSNzRC3/vw3YoRylcacOrjzoa4A4ZAWEf4RE+PaGHm4aU9F2FRCJ4Eb8wjKF3Xeg3OpWdTH7sUQ1KWv2kfLnXyJQ7J+FKpOsNVxuUEEs=
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDQuMTAuMTkgdW0gMTM6MDAgc2NocmllYiBEYXMsIE5pcm1veToNCj4gT24gMTAvNC8xOSAx
Mjo0NCBQTSwgS29lbmlnLCBDaHJpc3RpYW4gd3JvdGU6DQo+PiBGaXJzdCBvZiBhbGwgcGxlYXNl
IHNlbmQgbWFpbHMgcmVnYXJkaW5nIGFtZGdwdSB0byB0aGUgYW1kLWdmeCBtYWlsaW5nDQo+PiBs
aXN0IGFuZCBub3QgbGttbC9kcmktZGV2ZWwuDQo+IE9rYXkuDQo+PiBBbSAwNC4xMC4xOSB1bSAx
MjoxNyBzY2hyaWViIE5pcm1veSBEYXM6DQo+Pj4gSW4gYW1kZ3B1X2JvX2xpc3RfaW9jdGwgd2hl
biBpZHJfYWxsb2MgZmFpbHMNCj4+PiBkb24ndCByZXR1cm4gd2l0aG91dCBmcmVlaW5nIGJvIGxp
c3QgZW50cnkuDQo+Pj4NCj4+PiBGaXhlczogOTY0ZDBmYmY2MzAxZCAoImRybS9hbWRncHU6IEFs
bG93IHRvIGNyZWF0ZSBCTyBsaXN0cyBpbiBDUyBpb2N0bCB2MyIpDQo+Pj4NCj4+PiBTaWduZWQt
b2ZmLWJ5OiBOaXJtb3kgRGFzIDxuaXJtb3kuZGFzQGFtZC5jb20+DQo+Pj4gLS0tDQo+Pj4gICAg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9ib19saXN0LmMgfCAyICstDQo+Pj4g
ICAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPj4+DQo+
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9ib19saXN0
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYm9fbGlzdC5jDQo+Pj4gaW5k
ZXggN2JjZjg2YzYxOTk5Li5jM2U1ZWE1NDQ4NTcgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2JvX2xpc3QuYw0KPj4+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9ib19saXN0LmMNCj4+PiBAQCAtMjg0LDcgKzI4NCw3IEBA
IGludCBhbWRncHVfYm9fbGlzdF9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpk
YXRhLA0KPj4+ICAgICAJCW11dGV4X3VubG9jaygmZnByaXYtPmJvX2xpc3RfbG9jayk7DQo+Pj4g
ICAgIAkJaWYgKHIgPCAwKSB7DQo+Pj4gICAgIAkJCWFtZGdwdV9ib19saXN0X3B1dChsaXN0KTsN
Cj4+PiAtCQkJcmV0dXJuIHI7DQo+Pj4gKwkJCWdvdG8gZXJyb3JfZnJlZTsNCj4+IE5BSywgdGhh
dCBpcyBhIGRvdWJsZSBmcmVlLiBUaGUgYm8gbGlzdCBlbnRyaWVzIGFyZSBmcmVlZCBieQ0KPj4g
YW1kZ3B1X2JvX2xpc3RfcHV0KCkuDQo+IFRoYW5rcywgZGlkbid0IHJlYWxpemUgdGhhdC4NCg0K
V2FpdCBhIHNlY29uZCwgd2hhdCBlbnRyaWVzIGFyZSB5b3UgdGFsa2luZyBhYm91dD8NCg0KVGhl
IGVudHJpZXMgaW4gdGhlIGxpc3Qgb2JqZWN0IGFyZSBmcmVlZCB3aGVuIGFtZGdwdV9ib19saXN0
X3B1dCgpIGlzIA0KY2FsbGVkLCBidXQgdGhlIHRlbXBvcmFyeSBpbmZvIGFycmF5IHdpdGggdGhl
IGhhbmRsZXMgbmVlZHMgdG8gYmUgZnJlZWQgDQphcyB3ZWxsLg0KDQpBbmQgaXQgbG9va3MgbGlr
ZSB0aGF0IGlzIGluZGVlZCBsZWFrZWQgaGVyZS4NCg0KUmVnYXJkcywNCkNocmlzdGlhbi4NCg0K
Pj4gUmVnYXJkcywNCj4+IENocmlzdGlhbi4NCj4gUmVnYXJkcywNCj4NCj4gTmlybW95DQo+DQo+
Pj4gICAgIAkJfQ0KPj4+ICAgICANCj4+PiAgICAgCQloYW5kbGUgPSByOw0KDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
