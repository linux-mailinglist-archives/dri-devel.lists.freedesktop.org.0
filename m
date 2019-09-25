Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B51BE1F2
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 18:07:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC61289C29;
	Wed, 25 Sep 2019 16:07:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800042.outbound.protection.outlook.com [40.107.80.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1CE189C29
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 16:07:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BPvBv9rf0Nj0+z3ddcb8yDxVXSjKCffxJLspetCCogSxaqzqtiko/LxS05F/RJZalgTc2NYqH+m5+8h51oGyB7KixUadPnxSORTvgAT+tbUxUwyaZju13szoIFFLG4ye+MxkTvbtDUCARhSzQCzuUcVJQJHMuNP4fCCPC1flI30IltKNrkrnszu4FIasL+V8dLJI23Mi17jIsST8HH5XiYzOHtSln3elDM2alonTlVdZ7zgoyOmF83N3So5WYg/LbOcBk3KYpkyZ+uxl6pHsL0lQtX/CyxWJhKgH68oABORyUmtQeWXq1OuclF7vrgKyjXyvMl/YywnwoqKV8PgqEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPxjhI1kVYeLpNu1JJe2C4Sg7in9QUo856n9WE0uyVI=;
 b=aJdJEBVJNJGZo+ZsRNwSIp3Xzb4vkMeQA6NtUW825w+cZpmnfG1x9nxFFS9vE+cnyymmrCTDDX6z/9MaHo5YCVcecbpUDzWpkl2ZicRALrefA53W1dxIPHvT0dSWiBs4c+wUIMhZg79sAMGf0hX/vIUa1bh+69oz+ZWulG5g0bh6Rra5WMDh78e3saD+ngXApc2fizsSNURopjsDlqD+NpUCxPBQt58D+U4j647YT3Kk1e3ZKRTa/mtU0B4lJ739GHAdhCDExhd2UVn8nKUO+svlkYDPj28rZif4jNihypOwfvJIy00U3mj5KV0F+MPumkISBvqiduZoH9UoRdo8yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1694.namprd12.prod.outlook.com (10.172.56.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.18; Wed, 25 Sep 2019 16:07:34 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::31f2:3115:6265:33a0]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::31f2:3115:6265:33a0%11]) with mapi id 15.20.2284.023; Wed, 25 Sep
 2019 16:07:34 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: Steven Price <steven.price@arm.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
Subject: Re: [PATCH] drm: Don't free jobs in wait_event_interruptible()
Thread-Topic: [PATCH] drm: Don't free jobs in wait_event_interruptible()
Thread-Index: AQHVc7PzYTddskm3okCDHaLelWCdUqc8STCAgABEL4CAAAHkgA==
Date: Wed, 25 Sep 2019 16:07:34 +0000
Message-ID: <da04cf92-f4c7-e896-5070-4d2a9be273aa@amd.com>
References: <20190925151404.23222-1-steven.price@arm.com>
 <cc0b260c-059d-7f55-288e-c48f30eb84e3@amd.com>
 <078332cf-ef58-5f76-5c49-8034435f7bea@arm.com>
In-Reply-To: <078332cf-ef58-5f76-5c49-8034435f7bea@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0036.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::49) To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 05bf44a0-dff0-4a6b-339a-08d741d279f2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MWHPR12MB1694; 
x-ms-traffictypediagnostic: MWHPR12MB1694:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB1694E5F47758AF2255910D51EA870@MWHPR12MB1694.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-forefront-prvs: 01713B2841
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(136003)(396003)(376002)(39860400002)(189003)(199004)(6116002)(256004)(66556008)(2906002)(6636002)(11346002)(6512007)(316002)(66946007)(86362001)(110136005)(36756003)(8936002)(476003)(54906003)(52116002)(66446008)(305945005)(76176011)(31696002)(8676002)(7736002)(478600001)(102836004)(5660300002)(386003)(446003)(99286004)(66476007)(64756008)(229853002)(6436002)(31686004)(4326008)(25786009)(71190400001)(53546011)(71200400001)(3846002)(66066001)(6506007)(186003)(486006)(81156014)(14454004)(26005)(2616005)(81166006)(6246003)(6486002)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1694;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dnOQ8Q0B012OF8LQ2o/wWY1w/NAsWrSKexE+eyI1O/NeOqNZE+v/xLQcH3wG/nmQZloQTAmO5GmrlB+71hvhOcre2qAveEw8bx+/QH/1DeC/h7RjGD5F60EALeY3sCoXqnWrq4kr8Dh33gw7Q1jY7p57vNKbgNKkMgUKDPcCStPOoCjLPw1Im1NBLenWGZQ53kqmclG2+GcyRGU4WqJdtCkPTcSJYpp7tRNtvyZH8kGnerZHVebSMW2F4TrBv4OEFUTyggURj91g83Y+4IrAqA1QRq1L0Uph+HHpV01qx5goTwQg3P1f9v9/exwLgEPBONkqYBTX1pXmm12mhRI77OkaqZhZW94DBBesqLui+0UdaNrfC8tzWwNUS198mDtH6bylO/XI1Fv+Am2AkUq0PAXvTlnxctiuN6MjqcyNH1E=
Content-ID: <5364DB814D1F124599350D29E816FC22@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05bf44a0-dff0-4a6b-339a-08d741d279f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2019 16:07:34.2697 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UVgFWa9iQ0PTdA7YYkLuWQgAdlbXRT0HzuQ+Yd7TeWslbM+A7TcyzM8+BI8yapiUjNn732HPQ4xTE62eW/TWJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1694
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPxjhI1kVYeLpNu1JJe2C4Sg7in9QUo856n9WE0uyVI=;
 b=svK5i2xdyytX6RmBUOMjgquObVXmRFSZdqunP0vZSUKnzIgZTkbYqm+JB5tOhE1111o9GJZv+9m/tCRfExYMFfObxP3uIEE6F9T/cCYZrEA7YPtNyBUrM5tbvvTXoTvN9p1GuYkyMbE8p3G4dsmNRre+jGbqsfVS6hMtWPYGnXc=
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

T24gOS8yNS8xOSAxMjowMCBQTSwgU3RldmVuIFByaWNlIHdyb3RlOg0KDQo+IE9uIDI1LzA5LzIw
MTkgMTY6NTYsIEdyb2R6b3Zza3ksIEFuZHJleSB3cm90ZToNCj4+IE9uIDkvMjUvMTkgMTE6MTQg
QU0sIFN0ZXZlbiBQcmljZSB3cm90ZToNCj4+DQo+Pj4gZHJtX3NjaGVkX2NsZWFudXBfam9icygp
IGF0dGVtcHRzIHRvIGZyZWUgZmluaXNoZWQgam9icywgaG93ZXZlciBiZWNhdXNlDQo+Pj4gaXQg
aXMgY2FsbGVkIGFzIHRoZSBjb25kaXRpb24gb2Ygd2FpdF9ldmVudF9pbnRlcnJ1cHRpYmxlKCkg
aXQgbXVzdCBub3QNCj4+PiBzbGVlcC4gVW5mb3J0dW5hdGVseSBzb21lIGZyZWUgY2FsbGJhY2tz
IChub3RhYmx5IGZvciBQYW5mcm9zdCkgZG8gc2xlZXAuDQo+Pj4NCj4+PiBJbnN0ZWFkIGxldCdz
IHJlbmFtZSBkcm1fc2NoZWRfY2xlYW51cF9qb2JzKCkgdG8NCj4+PiBkcm1fc2NoZWRfZ2V0X2Ns
ZWFudXBfam9iKCkgYW5kIHNpbXBseSByZXR1cm4gYSBqb2IgZm9yIHByb2Nlc3NpbmcgaWYNCj4+
PiB0aGVyZSBpcyBvbmUuIFRoZSBjYWxsZXIgY2FuIHRoZW4gY2FsbCB0aGUgZnJlZV9qb2IoKSBj
YWxsYmFjayBvdXRzaWRlDQo+Pj4gdGhlIHdhaXRfZXZlbnRfaW50ZXJydXB0aWJsZSgpIHdoZXJl
IHNsZWVwaW5nIGlzIHBvc3NpYmxlIGJlZm9yZQ0KPj4+IHJlLWNoZWNraW5nIGFuZCByZXR1cm5p
bmcgdG8gc2xlZXAgaWYgbmVjZXNzYXJ5Lg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogU3RldmVu
IFByaWNlIDxzdGV2ZW4ucHJpY2VAYXJtLmNvbT4NCj4+PiAtLS0NCj4+PiAgICBkcml2ZXJzL2dw
dS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYyB8IDQ0ICsrKysrKysrKysrKysrLS0tLS0tLS0t
LS0tDQo+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9u
cygtKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2No
ZWRfbWFpbi5jIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMNCj4+PiBp
bmRleCA5YTBlZTc0ZDgyZGMuLjBlZDRhYWE0ZTZkMSAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYw0KPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jDQo+Pj4gQEAgLTYyMiw0MyArNjIyLDQxIEBAIHN0YXRp
YyB2b2lkIGRybV9zY2hlZF9wcm9jZXNzX2pvYihzdHJ1Y3QgZG1hX2ZlbmNlICpmLCBzdHJ1Y3Qg
ZG1hX2ZlbmNlX2NiICpjYikNCj4+PiAgICB9DQo+Pj4gICAgDQo+Pj4gICAgLyoqDQo+Pj4gLSAq
IGRybV9zY2hlZF9jbGVhbnVwX2pvYnMgLSBkZXN0cm95IGZpbmlzaGVkIGpvYnMNCj4+PiArICog
ZHJtX3NjaGVkX2dldF9jbGVhbnVwX2pvYiAtIGZldGNoIHRoZSBuZXh0IGZpbmlzaGVkIGpvYiB0
byBiZSBkZXN0cm95ZWQNCj4+PiAgICAgKg0KPj4+ICAgICAqIEBzY2hlZDogc2NoZWR1bGVyIGlu
c3RhbmNlDQo+Pj4gICAgICoNCj4+PiAtICogUmVtb3ZlIGFsbCBmaW5pc2hlZCBqb2JzIGZyb20g
dGhlIG1pcnJvciBsaXN0IGFuZCBkZXN0cm95IHRoZW0uDQo+Pj4gKyAqIFJldHVybnMgdGhlIG5l
eHQgZmluaXNoZWQgam9iIGZyb20gdGhlIG1pcnJvciBsaXN0IChpZiB0aGVyZSBpcyBvbmUpDQo+
Pj4gKyAqIHJlYWR5IGZvciBpdCB0byBiZSBkZXN0cm95ZWQuDQo+Pj4gICAgICovDQo+Pj4gLXN0
YXRpYyB2b2lkIGRybV9zY2hlZF9jbGVhbnVwX2pvYnMoc3RydWN0IGRybV9ncHVfc2NoZWR1bGVy
ICpzY2hlZCkNCj4+PiArc3RhdGljIHN0cnVjdCBkcm1fc2NoZWRfam9iICoNCj4+PiArZHJtX3Nj
aGVkX2dldF9jbGVhbnVwX2pvYihzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVsZXIgKnNjaGVkKQ0KPj4+
ICAgIHsNCj4+PiArCXN0cnVjdCBkcm1fc2NoZWRfam9iICpqb2IgPSBOVUxMOw0KPj4+ICAgIAl1
bnNpZ25lZCBsb25nIGZsYWdzOw0KPj4+ICAgIA0KPj4+ICAgIAkvKiBEb24ndCBkZXN0cm95IGpv
YnMgd2hpbGUgdGhlIHRpbWVvdXQgd29ya2VyIGlzIHJ1bm5pbmcgKi8NCj4+PiAgICAJaWYgKHNj
aGVkLT50aW1lb3V0ICE9IE1BWF9TQ0hFRFVMRV9USU1FT1VUICYmDQo+Pj4gICAgCSAgICAhY2Fu
Y2VsX2RlbGF5ZWRfd29yaygmc2NoZWQtPndvcmtfdGRyKSkNCj4+PiAtCQlyZXR1cm47DQo+Pj4g
LQ0KPj4+IC0NCj4+PiAtCXdoaWxlICghbGlzdF9lbXB0eSgmc2NoZWQtPnJpbmdfbWlycm9yX2xp
c3QpKSB7DQo+Pj4gLQkJc3RydWN0IGRybV9zY2hlZF9qb2IgKmpvYjsNCj4+PiArCQlyZXR1cm4g
TlVMTDsNCj4+PiAgICANCj4+PiAtCQlqb2IgPSBsaXN0X2ZpcnN0X2VudHJ5KCZzY2hlZC0+cmlu
Z19taXJyb3JfbGlzdCwNCj4+PiArCWpvYiA9IGxpc3RfZmlyc3RfZW50cnlfb3JfbnVsbCgmc2No
ZWQtPnJpbmdfbWlycm9yX2xpc3QsDQo+Pj4gICAgCQkJCSAgICAgICBzdHJ1Y3QgZHJtX3NjaGVk
X2pvYiwgbm9kZSk7DQo+Pj4gLQkJaWYgKCFkbWFfZmVuY2VfaXNfc2lnbmFsZWQoJmpvYi0+c19m
ZW5jZS0+ZmluaXNoZWQpKQ0KPj4+IC0JCQlicmVhazsNCj4+PiAgICANCj4+PiAtCQlzcGluX2xv
Y2tfaXJxc2F2ZSgmc2NoZWQtPmpvYl9saXN0X2xvY2ssIGZsYWdzKTsNCj4+PiArCXNwaW5fbG9j
a19pcnFzYXZlKCZzY2hlZC0+am9iX2xpc3RfbG9jaywgZmxhZ3MpOw0KPj4+ICsNCj4+PiArCWlm
IChqb2IgJiYgZG1hX2ZlbmNlX2lzX3NpZ25hbGVkKCZqb2ItPnNfZmVuY2UtPmZpbmlzaGVkKSkg
ew0KPj4+ICAgIAkJLyogcmVtb3ZlIGpvYiBmcm9tIHJpbmdfbWlycm9yX2xpc3QgKi8NCj4+PiAg
ICAJCWxpc3RfZGVsX2luaXQoJmpvYi0+bm9kZSk7DQo+Pj4gLQkJc3Bpbl91bmxvY2tfaXJxcmVz
dG9yZSgmc2NoZWQtPmpvYl9saXN0X2xvY2ssIGZsYWdzKTsNCj4+PiAtDQo+Pj4gLQkJc2NoZWQt
Pm9wcy0+ZnJlZV9qb2Ioam9iKTsNCj4+PiArCX0gZWxzZSB7DQo+Pj4gKwkJam9iID0gTlVMTDsN
Cj4+PiArCQkvKiBxdWV1ZSB0aW1lb3V0IGZvciBuZXh0IGpvYiAqLw0KPj4+ICsJCWRybV9zY2hl
ZF9zdGFydF90aW1lb3V0KHNjaGVkKTsNCj4+PiAgICAJfQ0KPj4+ICAgIA0KPj4+IC0JLyogcXVl
dWUgdGltZW91dCBmb3IgbmV4dCBqb2IgKi8NCj4+PiAtCXNwaW5fbG9ja19pcnFzYXZlKCZzY2hl
ZC0+am9iX2xpc3RfbG9jaywgZmxhZ3MpOw0KPj4+IC0JZHJtX3NjaGVkX3N0YXJ0X3RpbWVvdXQo
c2NoZWQpOw0KPj4+ICAgIAlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZzY2hlZC0+am9iX2xpc3Rf
bG9jaywgZmxhZ3MpOw0KPj4+ICAgIA0KPj4+ICsJcmV0dXJuIGpvYjsNCj4+PiAgICB9DQo+Pj4g
ICAgDQo+Pj4gICAgLyoqDQo+Pj4gQEAgLTY5OCwxMiArNjk2LDE4IEBAIHN0YXRpYyBpbnQgZHJt
X3NjaGVkX21haW4odm9pZCAqcGFyYW0pDQo+Pj4gICAgCQlzdHJ1Y3QgZHJtX3NjaGVkX2ZlbmNl
ICpzX2ZlbmNlOw0KPj4+ICAgIAkJc3RydWN0IGRybV9zY2hlZF9qb2IgKnNjaGVkX2pvYjsNCj4+
PiAgICAJCXN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlOw0KPj4+ICsJCXN0cnVjdCBkcm1fc2NoZWRf
am9iICpjbGVhbnVwX2pvYiA9IE5VTEw7DQo+Pj4gICAgDQo+Pj4gICAgCQl3YWl0X2V2ZW50X2lu
dGVycnVwdGlibGUoc2NoZWQtPndha2VfdXBfd29ya2VyLA0KPj4+IC0JCQkJCSAoZHJtX3NjaGVk
X2NsZWFudXBfam9icyhzY2hlZCksDQo+Pj4gKwkJCQkJIChjbGVhbnVwX2pvYiA9IGRybV9zY2hl
ZF9nZXRfY2xlYW51cF9qb2Ioc2NoZWQpKSB8fA0KPj4+ICAgIAkJCQkJICghZHJtX3NjaGVkX2Js
b2NrZWQoc2NoZWQpICYmDQo+Pj4gICAgCQkJCQkgIChlbnRpdHkgPSBkcm1fc2NoZWRfc2VsZWN0
X2VudGl0eShzY2hlZCkpKSB8fA0KPj4+IC0JCQkJCSBrdGhyZWFkX3Nob3VsZF9zdG9wKCkpKTsN
Cj4+PiArCQkJCQkga3RocmVhZF9zaG91bGRfc3RvcCgpKTsNCj4+DQo+PiBDYW4ndCB3ZSBqdXN0
IGNhbGwgZHJtX3NjaGVkX2NsZWFudXBfam9icyByaWdodCBoZXJlLCByZW1vdmUgYWxsIHRoZQ0K
Pj4gY29uZGl0aW9ucyBpbiB3YWl0X2V2ZW50X2ludGVycnVwdGlibGUgKG1ha2UgaXQgYWx3YXlz
IHRydWUpIGFuZCBhZnRlcg0KPj4gZHJtX3NjaGVkX2NsZWFudXBfam9icyBpcyBjYWxsZWQgdGVz
dCBmb3IgYWxsIHRob3NlIGNvbmRpdGlvbnMgYW5kDQo+PiByZXR1cm4gdG8gc2xlZXAgaWYgdGhl
eSBldmFsdWF0ZSB0byBmYWxzZSA/IGRybV9zY2hlZF9jbGVhbnVwX2pvYnMgaXMNCj4+IGNhbGxl
ZCB1bmNvbmRpdGlvbmFsbHkgaW5zaWRlIHdhaXRfZXZlbnRfaW50ZXJydXB0aWJsZSBhbnl3YXku
Li4gVGhpcyBpcw0KPj4gbW9yZSBvZiBhIHF1ZXN0aW9uIHRvIENocmlzdGlhbi4NCj4gQ2hyaXN0
aWFuIG1heSBrbm93IGJldHRlciB0aGFuIG1lLCBidXQgSSB0aGluayB0aG9zZSBjb25kaXRpb25z
IG5lZWQgdG8NCj4gYmUgaW4gd2FpdF9ldmVudF9pbnRlcnJ1cHRpYmxlKCkgdG8gYXZvaWQgcmFj
ZSBjb25kaXRpb25zLiBJZiB3ZSBzaW1wbHkNCj4gcmVwbGFjZSBhbGwgdGhlIGNvbmRpdGlvbnMg
d2l0aCBhIGxpdGVyYWwgInRydWUiIHRoZW4NCj4gd2FpdF9ldmVudF9pbnRlcnJ1cHRpYmxlKCkg
d2lsbCBuZXZlciBhY3R1YWxseSBzbGVlcC4NCj4NCj4gU3RldmUNCg0KWWVzIHlvdSByaWdodCwg
aXQgd29uJ3Qgd29yayBhcyBJIG1pc3NlZCB0aGF0IGNvbmRpdGlvbiBpcyBldmFsdWF0ZWQgYXMg
DQpmaXJzdCBzdGVwIGluIHdhaXRfZXZlbnRfaW50ZXJydXB0aWJsZSBiZWZvcmUgaXQgc2xlZXBz
Lg0KDQpBbmRyZXkNCg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
