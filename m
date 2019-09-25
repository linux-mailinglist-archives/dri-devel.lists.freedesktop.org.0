Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66159BE1CC
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 17:56:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CEB36E08A;
	Wed, 25 Sep 2019 15:56:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam05on0600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe50::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 560516E08A
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 15:56:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SBs5mF7M6ufdUl2uuhZpek5ddUBwVQsWmyVRLuo32bciHCRPtU5mnChFA3k4ejH14bFEHoBXVX8NzmObMDIMIprKgM3jk1rSxOIQAdnFRdZhiLr6L8xKXL7+g0U3uuAFOVdxh/eXh2wcecePOyj5n4lm92D0sT7xPMjKtFB1jYZ12m+NiZpV3VoDky0aehVtFeJhIfmQeme2iBFsDyhQ0c7sSKrRv8nxWICU1zkkGjqAkC0L5riSUZyrV1xADicvJiV4+INA+q+rL+FKqY4LxFNZ6RpkJEeEW0PqOwvMsHnEEnyjluqakiqFcQnGndhV46xF3WQZsn2G4EXwUSoaTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jMUZXKLd5WeYTeB3roY7BpC4pDcJ4i0QEgEWQW2+32I=;
 b=J1QyV/kX0xqGx6DE8Lk9XneMWz7IBcglwN9/vWRR7vqm3Lb7T6UVoqVc0TmCm7TM+e8SlICB/66zMgN4KZD8+QhnyFoIbRqoHHZ7yhH4+0EnA0c8ESa27yfiHvkuh3gCoxBNh7h2oKaxWai9xZqclXtWoBMYlAinEV8Ov1F6Tf5g9ENM8JkvHc24niYD+UPRG8TdFiIBUGpmr42m/Dku0LKMQ7VomJY+iiKmUNMEQFvS84c1e4xsQFllyDeRwd9wn6gxdz+HtJlcYrmnuwwXZjMeWSnlG9cX6FGmV7KAoCuZKVXsretMInJPLr65zOZ33obkdQ5sINz2UmcS2sTs1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1838.namprd12.prod.outlook.com (10.175.49.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.26; Wed, 25 Sep 2019 15:56:46 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::31f2:3115:6265:33a0]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::31f2:3115:6265:33a0%11]) with mapi id 15.20.2284.023; Wed, 25 Sep
 2019 15:56:46 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: Steven Price <steven.price@arm.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
Subject: Re: [PATCH] drm: Don't free jobs in wait_event_interruptible()
Thread-Topic: [PATCH] drm: Don't free jobs in wait_event_interruptible()
Thread-Index: AQHVc7PzYTddskm3okCDHaLelWCdUqc8jD6A
Date: Wed, 25 Sep 2019 15:56:46 +0000
Message-ID: <cc0b260c-059d-7f55-288e-c48f30eb84e3@amd.com>
References: <20190925151404.23222-1-steven.price@arm.com>
In-Reply-To: <20190925151404.23222-1-steven.price@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0020.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::33) To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 23f7e586-e496-4721-b750-08d741d0f7d0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MWHPR12MB1838; 
x-ms-traffictypediagnostic: MWHPR12MB1838:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB1838A74338DA4A3C1AAB895EEA870@MWHPR12MB1838.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:626;
x-forefront-prvs: 01713B2841
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(346002)(39860400002)(376002)(136003)(189003)(199004)(71190400001)(71200400001)(36756003)(6636002)(2906002)(66066001)(2616005)(476003)(446003)(11346002)(486006)(31686004)(5660300002)(14444005)(229853002)(31696002)(256004)(305945005)(6512007)(14454004)(316002)(478600001)(86362001)(7736002)(6436002)(6486002)(6246003)(66946007)(66476007)(66446008)(66556008)(64756008)(26005)(99286004)(76176011)(52116002)(102836004)(186003)(25786009)(6116002)(3846002)(81166006)(81156014)(8936002)(110136005)(54906003)(386003)(53546011)(8676002)(6506007)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1838;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rj+g6Kf26yVuWcxQqK9HW/IH8KP1rPMHQCxawjiVuEB3q0k+BERlR8FnJrVwP0hO4x4R+vF259Yn/qGakvN2mt879sFW/GsGkRpySrUCsUrGGGQb2oar+duV/NpZTEvyxFKkm0nKQz+JUmDmSNqH5D9tNZsqMHPpiYHN/EGPGpBb5isnYJ7NGVCkaKoxnZC4odMnSYdl8bAeBcoj/0K5dS5ODrhDNkdqjZmqDvPk70uvJjTIo8VJQAx1q6ZZvgME99u55N/5pBU/IigqaVFK4Sdmloyb6QZ8uQteHxljp8rihYetdBHWgnygl2OeXpKj9x0neO+f4VgTaezf7e79ffPqwvfCEyKvZAcC88YafQLtQ20wpI9bs8Qa6AE7wMnnqAqZUrbvbBmRlgeD+N6luDy34fQoAloRC+mt36Fxzhs=
Content-ID: <4108FF92B2F61847972E1781B8C99A1D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23f7e586-e496-4721-b750-08d741d0f7d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2019 15:56:46.5207 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VLknsquL50tDN+h57mUpMsARNtnXE58+s9NzRitZfZFSQiGotqCE4t1nRURdSQdURbvJ4PVawMOehycCPwWHMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1838
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jMUZXKLd5WeYTeB3roY7BpC4pDcJ4i0QEgEWQW2+32I=;
 b=O/EGXG+qzs7ph3r4ioXp/7RwJITKf6ya+E5Ria/RkE0uHXEiwk77mitshtdqpuci0vrqft3PQMlRZJiKOmQsv7tG+QB7viPiOG62ppKE1RlGKjTP0gP4sat6OADvbE8KXdIbt9HsUAv8mq6NuSwnW4nYQv/vlBZlmfx0lbtlD24=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Nayan Deshmukh <nayan26deshmukh@gmail.com>,
 Sharat Masetty <smasetty@codeaurora.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOS8yNS8xOSAxMToxNCBBTSwgU3RldmVuIFByaWNlIHdyb3RlOg0KDQo+IGRybV9zY2hlZF9j
bGVhbnVwX2pvYnMoKSBhdHRlbXB0cyB0byBmcmVlIGZpbmlzaGVkIGpvYnMsIGhvd2V2ZXIgYmVj
YXVzZQ0KPiBpdCBpcyBjYWxsZWQgYXMgdGhlIGNvbmRpdGlvbiBvZiB3YWl0X2V2ZW50X2ludGVy
cnVwdGlibGUoKSBpdCBtdXN0IG5vdA0KPiBzbGVlcC4gVW5mb3J0dW5hdGVseSBzb21lIGZyZWUg
Y2FsbGJhY2tzIChub3RhYmx5IGZvciBQYW5mcm9zdCkgZG8gc2xlZXAuDQo+DQo+IEluc3RlYWQg
bGV0J3MgcmVuYW1lIGRybV9zY2hlZF9jbGVhbnVwX2pvYnMoKSB0bw0KPiBkcm1fc2NoZWRfZ2V0
X2NsZWFudXBfam9iKCkgYW5kIHNpbXBseSByZXR1cm4gYSBqb2IgZm9yIHByb2Nlc3NpbmcgaWYN
Cj4gdGhlcmUgaXMgb25lLiBUaGUgY2FsbGVyIGNhbiB0aGVuIGNhbGwgdGhlIGZyZWVfam9iKCkg
Y2FsbGJhY2sgb3V0c2lkZQ0KPiB0aGUgd2FpdF9ldmVudF9pbnRlcnJ1cHRpYmxlKCkgd2hlcmUg
c2xlZXBpbmcgaXMgcG9zc2libGUgYmVmb3JlDQo+IHJlLWNoZWNraW5nIGFuZCByZXR1cm5pbmcg
dG8gc2xlZXAgaWYgbmVjZXNzYXJ5Lg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBTdGV2ZW4gUHJpY2Ug
PHN0ZXZlbi5wcmljZUBhcm0uY29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vc2NoZWR1
bGVyL3NjaGVkX21haW4uYyB8IDQ0ICsrKysrKysrKysrKysrLS0tLS0tLS0tLS0tDQo+ICAgMSBm
aWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMgYi9kcml2ZXJz
L2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYw0KPiBpbmRleCA5YTBlZTc0ZDgyZGMuLjBl
ZDRhYWE0ZTZkMSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hl
ZF9tYWluLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMN
Cj4gQEAgLTYyMiw0MyArNjIyLDQxIEBAIHN0YXRpYyB2b2lkIGRybV9zY2hlZF9wcm9jZXNzX2pv
YihzdHJ1Y3QgZG1hX2ZlbmNlICpmLCBzdHJ1Y3QgZG1hX2ZlbmNlX2NiICpjYikNCj4gICB9DQo+
ICAgDQo+ICAgLyoqDQo+IC0gKiBkcm1fc2NoZWRfY2xlYW51cF9qb2JzIC0gZGVzdHJveSBmaW5p
c2hlZCBqb2JzDQo+ICsgKiBkcm1fc2NoZWRfZ2V0X2NsZWFudXBfam9iIC0gZmV0Y2ggdGhlIG5l
eHQgZmluaXNoZWQgam9iIHRvIGJlIGRlc3Ryb3llZA0KPiAgICAqDQo+ICAgICogQHNjaGVkOiBz
Y2hlZHVsZXIgaW5zdGFuY2UNCj4gICAgKg0KPiAtICogUmVtb3ZlIGFsbCBmaW5pc2hlZCBqb2Jz
IGZyb20gdGhlIG1pcnJvciBsaXN0IGFuZCBkZXN0cm95IHRoZW0uDQo+ICsgKiBSZXR1cm5zIHRo
ZSBuZXh0IGZpbmlzaGVkIGpvYiBmcm9tIHRoZSBtaXJyb3IgbGlzdCAoaWYgdGhlcmUgaXMgb25l
KQ0KPiArICogcmVhZHkgZm9yIGl0IHRvIGJlIGRlc3Ryb3llZC4NCj4gICAgKi8NCj4gLXN0YXRp
YyB2b2lkIGRybV9zY2hlZF9jbGVhbnVwX2pvYnMoc3RydWN0IGRybV9ncHVfc2NoZWR1bGVyICpz
Y2hlZCkNCj4gK3N0YXRpYyBzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqDQo+ICtkcm1fc2NoZWRfZ2V0
X2NsZWFudXBfam9iKHN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciAqc2NoZWQpDQo+ICAgew0KPiAr
CXN0cnVjdCBkcm1fc2NoZWRfam9iICpqb2IgPSBOVUxMOw0KPiAgIAl1bnNpZ25lZCBsb25nIGZs
YWdzOw0KPiAgIA0KPiAgIAkvKiBEb24ndCBkZXN0cm95IGpvYnMgd2hpbGUgdGhlIHRpbWVvdXQg
d29ya2VyIGlzIHJ1bm5pbmcgKi8NCj4gICAJaWYgKHNjaGVkLT50aW1lb3V0ICE9IE1BWF9TQ0hF
RFVMRV9USU1FT1VUICYmDQo+ICAgCSAgICAhY2FuY2VsX2RlbGF5ZWRfd29yaygmc2NoZWQtPndv
cmtfdGRyKSkNCj4gLQkJcmV0dXJuOw0KPiAtDQo+IC0NCj4gLQl3aGlsZSAoIWxpc3RfZW1wdHko
JnNjaGVkLT5yaW5nX21pcnJvcl9saXN0KSkgew0KPiAtCQlzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAq
am9iOw0KPiArCQlyZXR1cm4gTlVMTDsNCj4gICANCj4gLQkJam9iID0gbGlzdF9maXJzdF9lbnRy
eSgmc2NoZWQtPnJpbmdfbWlycm9yX2xpc3QsDQo+ICsJam9iID0gbGlzdF9maXJzdF9lbnRyeV9v
cl9udWxsKCZzY2hlZC0+cmluZ19taXJyb3JfbGlzdCwNCj4gICAJCQkJICAgICAgIHN0cnVjdCBk
cm1fc2NoZWRfam9iLCBub2RlKTsNCj4gLQkJaWYgKCFkbWFfZmVuY2VfaXNfc2lnbmFsZWQoJmpv
Yi0+c19mZW5jZS0+ZmluaXNoZWQpKQ0KPiAtCQkJYnJlYWs7DQo+ICAgDQo+IC0JCXNwaW5fbG9j
a19pcnFzYXZlKCZzY2hlZC0+am9iX2xpc3RfbG9jaywgZmxhZ3MpOw0KPiArCXNwaW5fbG9ja19p
cnFzYXZlKCZzY2hlZC0+am9iX2xpc3RfbG9jaywgZmxhZ3MpOw0KPiArDQo+ICsJaWYgKGpvYiAm
JiBkbWFfZmVuY2VfaXNfc2lnbmFsZWQoJmpvYi0+c19mZW5jZS0+ZmluaXNoZWQpKSB7DQo+ICAg
CQkvKiByZW1vdmUgam9iIGZyb20gcmluZ19taXJyb3JfbGlzdCAqLw0KPiAgIAkJbGlzdF9kZWxf
aW5pdCgmam9iLT5ub2RlKTsNCj4gLQkJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmc2NoZWQtPmpv
Yl9saXN0X2xvY2ssIGZsYWdzKTsNCj4gLQ0KPiAtCQlzY2hlZC0+b3BzLT5mcmVlX2pvYihqb2Ip
Ow0KPiArCX0gZWxzZSB7DQo+ICsJCWpvYiA9IE5VTEw7DQo+ICsJCS8qIHF1ZXVlIHRpbWVvdXQg
Zm9yIG5leHQgam9iICovDQo+ICsJCWRybV9zY2hlZF9zdGFydF90aW1lb3V0KHNjaGVkKTsNCj4g
ICAJfQ0KPiAgIA0KPiAtCS8qIHF1ZXVlIHRpbWVvdXQgZm9yIG5leHQgam9iICovDQo+IC0Jc3Bp
bl9sb2NrX2lycXNhdmUoJnNjaGVkLT5qb2JfbGlzdF9sb2NrLCBmbGFncyk7DQo+IC0JZHJtX3Nj
aGVkX3N0YXJ0X3RpbWVvdXQoc2NoZWQpOw0KPiAgIAlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZz
Y2hlZC0+am9iX2xpc3RfbG9jaywgZmxhZ3MpOw0KPiAgIA0KPiArCXJldHVybiBqb2I7DQo+ICAg
fQ0KPiAgIA0KPiAgIC8qKg0KPiBAQCAtNjk4LDEyICs2OTYsMTggQEAgc3RhdGljIGludCBkcm1f
c2NoZWRfbWFpbih2b2lkICpwYXJhbSkNCj4gICAJCXN0cnVjdCBkcm1fc2NoZWRfZmVuY2UgKnNf
ZmVuY2U7DQo+ICAgCQlzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqc2NoZWRfam9iOw0KPiAgIAkJc3Ry
dWN0IGRtYV9mZW5jZSAqZmVuY2U7DQo+ICsJCXN0cnVjdCBkcm1fc2NoZWRfam9iICpjbGVhbnVw
X2pvYiA9IE5VTEw7DQo+ICAgDQo+ICAgCQl3YWl0X2V2ZW50X2ludGVycnVwdGlibGUoc2NoZWQt
Pndha2VfdXBfd29ya2VyLA0KPiAtCQkJCQkgKGRybV9zY2hlZF9jbGVhbnVwX2pvYnMoc2NoZWQp
LA0KPiArCQkJCQkgKGNsZWFudXBfam9iID0gZHJtX3NjaGVkX2dldF9jbGVhbnVwX2pvYihzY2hl
ZCkpIHx8DQo+ICAgCQkJCQkgKCFkcm1fc2NoZWRfYmxvY2tlZChzY2hlZCkgJiYNCj4gICAJCQkJ
CSAgKGVudGl0eSA9IGRybV9zY2hlZF9zZWxlY3RfZW50aXR5KHNjaGVkKSkpIHx8DQo+IC0JCQkJ
CSBrdGhyZWFkX3Nob3VsZF9zdG9wKCkpKTsNCj4gKwkJCQkJIGt0aHJlYWRfc2hvdWxkX3N0b3Ao
KSk7DQoNCg0KQ2FuJ3Qgd2UganVzdCBjYWxsIGRybV9zY2hlZF9jbGVhbnVwX2pvYnMgcmlnaHQg
aGVyZSwgcmVtb3ZlIGFsbCB0aGUgDQpjb25kaXRpb25zIGluIHdhaXRfZXZlbnRfaW50ZXJydXB0
aWJsZSAobWFrZSBpdCBhbHdheXMgdHJ1ZSkgYW5kIGFmdGVyIA0KZHJtX3NjaGVkX2NsZWFudXBf
am9icyBpcyBjYWxsZWQgdGVzdCBmb3IgYWxsIHRob3NlIGNvbmRpdGlvbnMgYW5kIA0KcmV0dXJu
IHRvIHNsZWVwIGlmIHRoZXkgZXZhbHVhdGUgdG8gZmFsc2UgPyBkcm1fc2NoZWRfY2xlYW51cF9q
b2JzIGlzIA0KY2FsbGVkIHVuY29uZGl0aW9uYWxseSBpbnNpZGUgd2FpdF9ldmVudF9pbnRlcnJ1
cHRpYmxlIGFueXdheS4uLiBUaGlzIGlzIA0KbW9yZSBvZiBhIHF1ZXN0aW9uIHRvIENocmlzdGlh
bi4NCg0KQW5kcmV5DQoNCg0KPiArDQo+ICsJCXdoaWxlIChjbGVhbnVwX2pvYikgew0KPiArCQkJ
c2NoZWQtPm9wcy0+ZnJlZV9qb2IoY2xlYW51cF9qb2IpOw0KPiArCQkJY2xlYW51cF9qb2IgPSBk
cm1fc2NoZWRfZ2V0X2NsZWFudXBfam9iKHNjaGVkKTsNCj4gKwkJfQ0KPiAgIA0KPiAgIAkJaWYg
KCFlbnRpdHkpDQo+ICAgCQkJY29udGludWU7DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
