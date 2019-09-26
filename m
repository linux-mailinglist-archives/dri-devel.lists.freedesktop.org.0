Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FC3BF559
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 16:58:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAB5F6ECCB;
	Thu, 26 Sep 2019 14:58:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780072.outbound.protection.outlook.com [40.107.78.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E3AC6ECCB
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 14:58:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MPNVyh45wJrfniPEux1B0d0NZN5SdlQFwWQpGRb7jxGU3llRB5yNjKJ/EGjE0/voUQ7i4GyZrbfAU9rRsybykoBormNxA0CAHdbwBKIdokP+LYhuz4oqhnvdDItTzR7BB15a5ECjDTCBTL2nOQfzo5rqFT/5WIQHRW1rhfLVzbdQdvLlbNfqVNu6BPI2GDE6uYfm5ELub+CDC+F4NfD+rGxlW/e0Z2qhW3f3/BlDcd21S4hW23sfgtIUzOmNFE6gmnGEffU+FMD3/a8awNSQvxm/DvIexum81akKursg30qePmFuDln1w8gopqIEPdH5jjScIvX3hs2BOBVY+ByFUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fc2jR+avzlhcvu2R+y9T0Xkz/3RaM2Q4XXbDU0Lxv1U=;
 b=mDL5m4cIDx48BTaHqdxaSWPe4r7uDYXpAseKVTY0SBfyXDZPbfIa0Vk+o1qCdg/bPmYrxQQN4Oy4rKalSU387lRTIgfR3++QBlmg4DuxNy9z4RSNcNqPaAJ8UH95P+rH7edDkrYPjsVZ03yS8uJEc3KkN8bElgioWs1ofHD5H9DXVGbRDOmV0ZRuUDKO6Q/h1ns4Kg7B1qQkVkYJsegnyfIKXBuxGfpPnwz21HgiVwXqjzKgOrAWyLAL779J7PQrCYMwRP25Dj7o8gzod8epw/Y5lm1vRLDWZgWpnZA8jC0Xkoh9JoCr8W5q7A5ksONaGnynGd8p9TVt34rhPxxJ5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR12MB1446.namprd12.prod.outlook.com (10.172.72.19) by
 CY4PR12MB1319.namprd12.prod.outlook.com (10.168.169.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.26; Thu, 26 Sep 2019 14:58:42 +0000
Received: from CY4PR12MB1446.namprd12.prod.outlook.com
 ([fe80::1dbd:eba0:5fcf:c9f3]) by CY4PR12MB1446.namprd12.prod.outlook.com
 ([fe80::1dbd:eba0:5fcf:c9f3%6]) with mapi id 15.20.2284.028; Thu, 26 Sep 2019
 14:58:42 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, Steven Price
 <steven.price@arm.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie
 <airlied@linux.ie>
Subject: Re: [PATCH] drm: Don't free jobs in wait_event_interruptible()
Thread-Topic: [PATCH] drm: Don't free jobs in wait_event_interruptible()
Thread-Index: AQHVc7PzYTddskm3okCDHaLelWCdUqc9irsAgACDn4A=
Date: Thu, 26 Sep 2019 14:58:42 +0000
Message-ID: <4d4aa96f-ff2a-681a-6892-b75e2b5bf86a@amd.com>
References: <20190925151404.23222-1-steven.price@arm.com>
 <321e99c1-4ce8-e6e1-83c8-2df1c78acce3@amd.com>
In-Reply-To: <321e99c1-4ce8-e6e1-83c8-2df1c78acce3@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0018.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::31) To CY4PR12MB1446.namprd12.prod.outlook.com
 (2603:10b6:910:10::19)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e25f8448-1235-49d6-4965-08d742920592
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:CY4PR12MB1319; 
x-ms-traffictypediagnostic: CY4PR12MB1319:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR12MB131950A2BF58D9A29B60699CEA860@CY4PR12MB1319.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:134;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(396003)(39860400002)(366004)(346002)(199004)(189003)(86362001)(14454004)(76176011)(5660300002)(36756003)(7736002)(386003)(3846002)(6506007)(6116002)(102836004)(186003)(53546011)(26005)(52116002)(14444005)(71190400001)(478600001)(2906002)(6246003)(81156014)(2616005)(316002)(71200400001)(486006)(6486002)(256004)(31686004)(54906003)(99286004)(6436002)(66946007)(110136005)(66066001)(8936002)(11346002)(476003)(6512007)(81166006)(229853002)(8676002)(66476007)(446003)(31696002)(64756008)(66556008)(25786009)(66446008)(4326008)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1319;
 H:CY4PR12MB1446.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 58zFldtzWHVsq2KIX0hifyB58bhNbMzRQVPz1Ly/fa6D6h7IJv+eeQ+2RgUblRoAR9ALizV/Zdpi1W4kDMj6VKcHnUImS0nZfPrT+0v2hmXDj5800O9tcNHuo3SPhF11zAT/mvv0/d1XIOS2ofrET/XUgpRmhiRetl1v2Y3pPUJjteA4W2dyxNMaB0Y8pBQh37H8NGNyKiDZzc7o8hM4LPnPfepkbcoD3uYf8wx6gHfyTEKROTEZlN/nHfXZaPwipxOiB8HjELqhIHu6qcZrAMDAKKI8KBaA57jzqiBTihdxuTEpciyo8kD+MtnX+iQNSEWed5Aqg97Mee0hZvhBAmk4DgEToQUxkunAswq3smxjmMlrzrsvIZbumMwPeD2dTmBvLNm17UmmiVYFHNjJmuSPxMh9RlYt7iLTqKaS6iA=
Content-ID: <24AABCAB6501394AB808BD54C69D7CF0@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e25f8448-1235-49d6-4965-08d742920592
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 14:58:42.4675 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H40HfOp3psjxL0Fun4ffChKhczpOIizydwpDWSUWJnbJ61k9GjzuupG47Tz4WLMP/LZoNAgly86nWEePnlDRPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1319
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fc2jR+avzlhcvu2R+y9T0Xkz/3RaM2Q4XXbDU0Lxv1U=;
 b=Tknb1Byp3lNoMIztUmT7KG9UhEp594ZWTpplHpAMWsEQUORETeQZ7E8FjduPFKUwu7OBKUm60keyel1JH+86OeKn/Tbouy4CY/boSgBLKOpa9RQhJw3n9rSRypHiw6WUQ1QikMz0e1BArKNcLE+JUzYVbStQNrkzDJnh+6oYN7s=
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

DQpPbiA5LzI2LzE5IDM6MDcgQU0sIEtvZW5pZywgQ2hyaXN0aWFuIHdyb3RlOg0KPiBBbSAyNS4w
OS4xOSB1bSAxNzoxNCBzY2hyaWViIFN0ZXZlbiBQcmljZToNCj4+IGRybV9zY2hlZF9jbGVhbnVw
X2pvYnMoKSBhdHRlbXB0cyB0byBmcmVlIGZpbmlzaGVkIGpvYnMsIGhvd2V2ZXIgYmVjYXVzZQ0K
Pj4gaXQgaXMgY2FsbGVkIGFzIHRoZSBjb25kaXRpb24gb2Ygd2FpdF9ldmVudF9pbnRlcnJ1cHRp
YmxlKCkgaXQgbXVzdCBub3QNCj4+IHNsZWVwLiBVbmZvcnR1bmF0ZWx5IHNvbWUgZnJlZSBjYWxs
YmFja3MgKG5vdGFibHkgZm9yIFBhbmZyb3N0KSBkbyBzbGVlcC4NCj4+DQo+PiBJbnN0ZWFkIGxl
dCdzIHJlbmFtZSBkcm1fc2NoZWRfY2xlYW51cF9qb2JzKCkgdG8NCj4+IGRybV9zY2hlZF9nZXRf
Y2xlYW51cF9qb2IoKSBhbmQgc2ltcGx5IHJldHVybiBhIGpvYiBmb3IgcHJvY2Vzc2luZyBpZg0K
Pj4gdGhlcmUgaXMgb25lLiBUaGUgY2FsbGVyIGNhbiB0aGVuIGNhbGwgdGhlIGZyZWVfam9iKCkg
Y2FsbGJhY2sgb3V0c2lkZQ0KPj4gdGhlIHdhaXRfZXZlbnRfaW50ZXJydXB0aWJsZSgpIHdoZXJl
IHNsZWVwaW5nIGlzIHBvc3NpYmxlIGJlZm9yZQ0KPj4gcmUtY2hlY2tpbmcgYW5kIHJldHVybmlu
ZyB0byBzbGVlcCBpZiBuZWNlc3NhcnkuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogU3RldmVuIFBy
aWNlIDxzdGV2ZW4ucHJpY2VAYXJtLmNvbT4NCj4+IC0tLQ0KPj4gICAgZHJpdmVycy9ncHUvZHJt
L3NjaGVkdWxlci9zY2hlZF9tYWluLmMgfCA0NCArKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQ0K
Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQ0K
Pj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4u
YyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jDQo+PiBpbmRleCA5YTBl
ZTc0ZDgyZGMuLjBlZDRhYWE0ZTZkMSAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9z
Y2hlZHVsZXIvc2NoZWRfbWFpbi5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVy
L3NjaGVkX21haW4uYw0KPj4gQEAgLTYyMiw0MyArNjIyLDQxIEBAIHN0YXRpYyB2b2lkIGRybV9z
Y2hlZF9wcm9jZXNzX2pvYihzdHJ1Y3QgZG1hX2ZlbmNlICpmLCBzdHJ1Y3QgZG1hX2ZlbmNlX2Ni
ICpjYikNCj4+ICAgIH0NCj4+ICAgIA0KPj4gICAgLyoqDQo+PiAtICogZHJtX3NjaGVkX2NsZWFu
dXBfam9icyAtIGRlc3Ryb3kgZmluaXNoZWQgam9icw0KPj4gKyAqIGRybV9zY2hlZF9nZXRfY2xl
YW51cF9qb2IgLSBmZXRjaCB0aGUgbmV4dCBmaW5pc2hlZCBqb2IgdG8gYmUgZGVzdHJveWVkDQo+
PiAgICAgKg0KPj4gICAgICogQHNjaGVkOiBzY2hlZHVsZXIgaW5zdGFuY2UNCj4+ICAgICAqDQo+
PiAtICogUmVtb3ZlIGFsbCBmaW5pc2hlZCBqb2JzIGZyb20gdGhlIG1pcnJvciBsaXN0IGFuZCBk
ZXN0cm95IHRoZW0uDQo+PiArICogUmV0dXJucyB0aGUgbmV4dCBmaW5pc2hlZCBqb2IgZnJvbSB0
aGUgbWlycm9yIGxpc3QgKGlmIHRoZXJlIGlzIG9uZSkNCj4+ICsgKiByZWFkeSBmb3IgaXQgdG8g
YmUgZGVzdHJveWVkLg0KPj4gICAgICovDQo+PiAtc3RhdGljIHZvaWQgZHJtX3NjaGVkX2NsZWFu
dXBfam9icyhzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVsZXIgKnNjaGVkKQ0KPj4gK3N0YXRpYyBzdHJ1
Y3QgZHJtX3NjaGVkX2pvYiAqDQo+PiArZHJtX3NjaGVkX2dldF9jbGVhbnVwX2pvYihzdHJ1Y3Qg
ZHJtX2dwdV9zY2hlZHVsZXIgKnNjaGVkKQ0KPj4gICAgew0KPj4gKwlzdHJ1Y3QgZHJtX3NjaGVk
X2pvYiAqam9iID0gTlVMTDsNCj4+ICAgIAl1bnNpZ25lZCBsb25nIGZsYWdzOw0KPj4gICAgDQo+
PiAgICAJLyogRG9uJ3QgZGVzdHJveSBqb2JzIHdoaWxlIHRoZSB0aW1lb3V0IHdvcmtlciBpcyBy
dW5uaW5nICovDQo+PiAgICAJaWYgKHNjaGVkLT50aW1lb3V0ICE9IE1BWF9TQ0hFRFVMRV9USU1F
T1VUICYmDQo+PiAgICAJICAgICFjYW5jZWxfZGVsYXllZF93b3JrKCZzY2hlZC0+d29ya190ZHIp
KQ0KPj4gLQkJcmV0dXJuOw0KPj4gLQ0KPj4gLQ0KPj4gLQl3aGlsZSAoIWxpc3RfZW1wdHkoJnNj
aGVkLT5yaW5nX21pcnJvcl9saXN0KSkgew0KPj4gLQkJc3RydWN0IGRybV9zY2hlZF9qb2IgKmpv
YjsNCj4+ICsJCXJldHVybiBOVUxMOw0KPj4gICAgDQo+PiAtCQlqb2IgPSBsaXN0X2ZpcnN0X2Vu
dHJ5KCZzY2hlZC0+cmluZ19taXJyb3JfbGlzdCwNCj4+ICsJam9iID0gbGlzdF9maXJzdF9lbnRy
eV9vcl9udWxsKCZzY2hlZC0+cmluZ19taXJyb3JfbGlzdCwNCj4+ICAgIAkJCQkgICAgICAgc3Ry
dWN0IGRybV9zY2hlZF9qb2IsIG5vZGUpOw0KPiBUaGlzIGlzIHByb2JhYmx5IGJldHRlciBkb25l
IGFmdGVyIHRha2luZyB0aGUgbG9jaywgYXBhcnQgZnJvbSB0aGF0DQo+IGxvb2tzIGdvb2QgdG8g
bWUuDQo+DQo+IENocmlzdGlhbi4NCg0KDQpXaHkgaXMgaXQgbmVjZXNzYXJ5IGlmIGluc2VydGlv
biBhbmQgcmVtb3ZhbCBmcm9tIHRoZSByaW5nX21pcnJvcl9saXN0IA0KYXJlIG9ubHkgZG9uZSBm
cm9tIHRoZSBzYW1lIHNjaGVkdWxlciB0aHJlYWQgPw0KDQpBbmRyZXkNCg0KDQo+DQo+PiAtCQlp
ZiAoIWRtYV9mZW5jZV9pc19zaWduYWxlZCgmam9iLT5zX2ZlbmNlLT5maW5pc2hlZCkpDQo+PiAt
CQkJYnJlYWs7DQo+PiAgICANCj4+IC0JCXNwaW5fbG9ja19pcnFzYXZlKCZzY2hlZC0+am9iX2xp
c3RfbG9jaywgZmxhZ3MpOw0KPj4gKwlzcGluX2xvY2tfaXJxc2F2ZSgmc2NoZWQtPmpvYl9saXN0
X2xvY2ssIGZsYWdzKTsNCj4+ICsNCj4+ICsJaWYgKGpvYiAmJiBkbWFfZmVuY2VfaXNfc2lnbmFs
ZWQoJmpvYi0+c19mZW5jZS0+ZmluaXNoZWQpKSB7DQo+PiAgICAJCS8qIHJlbW92ZSBqb2IgZnJv
bSByaW5nX21pcnJvcl9saXN0ICovDQo+PiAgICAJCWxpc3RfZGVsX2luaXQoJmpvYi0+bm9kZSk7
DQo+PiAtCQlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZzY2hlZC0+am9iX2xpc3RfbG9jaywgZmxh
Z3MpOw0KPj4gLQ0KPj4gLQkJc2NoZWQtPm9wcy0+ZnJlZV9qb2Ioam9iKTsNCj4+ICsJfSBlbHNl
IHsNCj4+ICsJCWpvYiA9IE5VTEw7DQo+PiArCQkvKiBxdWV1ZSB0aW1lb3V0IGZvciBuZXh0IGpv
YiAqLw0KPj4gKwkJZHJtX3NjaGVkX3N0YXJ0X3RpbWVvdXQoc2NoZWQpOw0KPj4gICAgCX0NCj4+
ICAgIA0KPj4gLQkvKiBxdWV1ZSB0aW1lb3V0IGZvciBuZXh0IGpvYiAqLw0KPj4gLQlzcGluX2xv
Y2tfaXJxc2F2ZSgmc2NoZWQtPmpvYl9saXN0X2xvY2ssIGZsYWdzKTsNCj4+IC0JZHJtX3NjaGVk
X3N0YXJ0X3RpbWVvdXQoc2NoZWQpOw0KPj4gICAgCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnNj
aGVkLT5qb2JfbGlzdF9sb2NrLCBmbGFncyk7DQo+PiAgICANCj4+ICsJcmV0dXJuIGpvYjsNCj4+
ICAgIH0NCj4+ICAgIA0KPj4gICAgLyoqDQo+PiBAQCAtNjk4LDEyICs2OTYsMTggQEAgc3RhdGlj
IGludCBkcm1fc2NoZWRfbWFpbih2b2lkICpwYXJhbSkNCj4+ICAgIAkJc3RydWN0IGRybV9zY2hl
ZF9mZW5jZSAqc19mZW5jZTsNCj4+ICAgIAkJc3RydWN0IGRybV9zY2hlZF9qb2IgKnNjaGVkX2pv
YjsNCj4+ICAgIAkJc3RydWN0IGRtYV9mZW5jZSAqZmVuY2U7DQo+PiArCQlzdHJ1Y3QgZHJtX3Nj
aGVkX2pvYiAqY2xlYW51cF9qb2IgPSBOVUxMOw0KPj4gICAgDQo+PiAgICAJCXdhaXRfZXZlbnRf
aW50ZXJydXB0aWJsZShzY2hlZC0+d2FrZV91cF93b3JrZXIsDQo+PiAtCQkJCQkgKGRybV9zY2hl
ZF9jbGVhbnVwX2pvYnMoc2NoZWQpLA0KPj4gKwkJCQkJIChjbGVhbnVwX2pvYiA9IGRybV9zY2hl
ZF9nZXRfY2xlYW51cF9qb2Ioc2NoZWQpKSB8fA0KPj4gICAgCQkJCQkgKCFkcm1fc2NoZWRfYmxv
Y2tlZChzY2hlZCkgJiYNCj4+ICAgIAkJCQkJICAoZW50aXR5ID0gZHJtX3NjaGVkX3NlbGVjdF9l
bnRpdHkoc2NoZWQpKSkgfHwNCj4+IC0JCQkJCSBrdGhyZWFkX3Nob3VsZF9zdG9wKCkpKTsNCj4+
ICsJCQkJCSBrdGhyZWFkX3Nob3VsZF9zdG9wKCkpOw0KPj4gKw0KPj4gKwkJd2hpbGUgKGNsZWFu
dXBfam9iKSB7DQo+PiArCQkJc2NoZWQtPm9wcy0+ZnJlZV9qb2IoY2xlYW51cF9qb2IpOw0KPj4g
KwkJCWNsZWFudXBfam9iID0gZHJtX3NjaGVkX2dldF9jbGVhbnVwX2pvYihzY2hlZCk7DQo+PiAr
CQl9DQo+PiAgICANCj4+ICAgIAkJaWYgKCFlbnRpdHkpDQo+PiAgICAJCQljb250aW51ZTsNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
