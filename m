Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E1ABF630
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 17:48:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A1B76EDBB;
	Thu, 26 Sep 2019 15:48:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710041.outbound.protection.outlook.com [40.107.71.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 997236EDBB
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 15:48:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fBqB/QmTXqaxxhTyUzhp31N2sPfSyjWfcFRCzZsFgpazCwcABB0ZAjfSDUBJZFKq8VQ/e9r+mwD9Z1/ksaZvEPqq5IRwsmjj6XFPirBVYY2wbwnXykFH+3/JvuATP8I9FCIMmMg/vaIX5P1t6ALo/SgmXHZLbROrEZ9UgDWGU8gRmqqwg1LGLEkdyCrrmYLNw0/fv6ZRHjDa+EwA3B4DAMAWP8V4XZLywJti9qjEf6LOiRo5xvo2K+34Dntgr/8pFTEVOKEFc9cAxZMg5aqFBO8UEJdzLQf5cNCOrChhY1rxH3b4kM6CFBjJ550/fTXwfPyEswULp98FAw3rYaVLeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5pPE662d4cYkVBtb1S/px23Au+Mfs7jlkYgwse5cec=;
 b=PtuFLFgw8eMkXqaaJ8pow49Hg3vxxbBS83cxKuLMxZC0SCh45XwRgxOHsqPnvwoAdi6ex0K7RGcQ1q+0PlgwLSIj4CmWrbILj1LlUu7jVi4bGbZPZee2odxGVyv882CrnyXx16Uh6gGdT0cynYGR9VtoY6hRzGy+UE32M4AWtSw5Q3enK1tZMq/jOfqXiCM4zZ+WgIKww/PteEXf4Y8oalofcSWqYKK8sHdrTkqFuCqB+RPoAoVMPSdWyUHZxnoGysZKv/LprPjuKBbgVfQs/9NjQdbuUe9vf9vMjVo3AD5Mxj4QbQlFnM3K27jQcEcHfm/r5GNu2PN5Nz87Uz+mhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR12MB1446.namprd12.prod.outlook.com (10.172.72.19) by
 CY4PR12MB1910.namprd12.prod.outlook.com (10.175.82.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Thu, 26 Sep 2019 15:48:35 +0000
Received: from CY4PR12MB1446.namprd12.prod.outlook.com
 ([fe80::1dbd:eba0:5fcf:c9f3]) by CY4PR12MB1446.namprd12.prod.outlook.com
 ([fe80::1dbd:eba0:5fcf:c9f3%6]) with mapi id 15.20.2284.028; Thu, 26 Sep 2019
 15:48:35 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: Steven Price <steven.price@arm.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
Subject: Re: [PATCH v4] drm: Don't free jobs in wait_event_interruptible()
Thread-Topic: [PATCH v4] drm: Don't free jobs in wait_event_interruptible()
Thread-Index: AQHVdHUKP1r0Rq5tqEO46l3IKyYg76c+EUmAgAACcYCAAAcPgA==
Date: Thu, 26 Sep 2019 15:48:35 +0000
Message-ID: <b4713fe7-80d4-4706-206e-f4786a70e70b@amd.com>
References: <20190926141630.14258-1-steven.price@arm.com>
 <b457a269-4aa9-7e3b-283e-b4920455e396@amd.com>
 <48214f02-e853-015f-55cc-397c7b06cb5d@arm.com>
In-Reply-To: <48214f02-e853-015f-55cc-397c7b06cb5d@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0014.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::27) To CY4PR12MB1446.namprd12.prod.outlook.com
 (2603:10b6:910:10::19)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 75324949-7c2b-48fd-7cf3-08d74298fd77
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR12MB1910; 
x-ms-traffictypediagnostic: CY4PR12MB1910:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR12MB19100D76DF580FB61449B5ACEA860@CY4PR12MB1910.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:336;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(39860400002)(366004)(376002)(136003)(189003)(199004)(5660300002)(229853002)(31686004)(110136005)(6486002)(86362001)(6436002)(76176011)(31696002)(478600001)(14454004)(52116002)(66066001)(71190400001)(25786009)(71200400001)(99286004)(6512007)(11346002)(446003)(14444005)(256004)(6506007)(386003)(53546011)(4326008)(66946007)(66476007)(66556008)(64756008)(66446008)(102836004)(6246003)(81166006)(26005)(81156014)(186003)(486006)(2616005)(36756003)(8676002)(2906002)(54906003)(476003)(6636002)(8936002)(6116002)(3846002)(305945005)(316002)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1910;
 H:CY4PR12MB1446.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WDQyDyFRn+tcPiCu1u+SC7xV7HXvaaXPppE2cpRfE9ryan0t3nUAPhvFRyRX68tdWujxcagthy6GBY7UGzgcsZt6E6sBlqR/jij8WquvJdGUBgohuXoxHdQdqpgiX4vBBUiiDX//U1+U/MVaxCXrOpxoYu2sN700VLCDPRhadKs5XPpkG9cCvXqw+VYNWWWhfvsRtn4e4HRZkrZ5qaVou9pMbLEWBot76mq4oSZveOqT+sxyI4os0dqv0uUIA+iMfqMcbC5xRllt+29pN6UXuPDY5JX7KbPLXf2/cE9L6jXLr3tRDS3lDXKmVCORZqF1NaEB0w/vi1yTcgq1BqWG6clbJGRJuBEx5RoJm3miLG/ZoVNhkBZdKJ6No8FdL+FV5HP+pXo56wEGCHTeJAs3L081TVpaXQOsypE4yePq100=
Content-ID: <B851821273F18340A7914BB96BB68EA8@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75324949-7c2b-48fd-7cf3-08d74298fd77
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 15:48:35.3252 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qrTqUQC3Sd9/McVlX12zSCPqrS2LAfKeW07+3za5+iXoXL57tGymI3zlzCe/9YfXCbjfDvzx+bOoXtMKOt/TYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1910
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5pPE662d4cYkVBtb1S/px23Au+Mfs7jlkYgwse5cec=;
 b=jcH8AASk3Xv4grS+4q3U/Gsw4z4xUipErRapTm3L4i8r/ogkUVoOgNxJXi9VybPzVvyw3Dz2vxQsmnzuVw8El+nT44VeXv4adQFNKu1GhJTZjWlZw6+zNAJ5luK6oCCcxssnYEhLa7cI2AcZFRpGvocIQlSDCo0DXvbHhS4XOPc=
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

DQpPbiA5LzI2LzE5IDExOjIzIEFNLCBTdGV2ZW4gUHJpY2Ugd3JvdGU6DQo+IE9uIDI2LzA5LzIw
MTkgMTY6MTQsIEdyb2R6b3Zza3ksIEFuZHJleSB3cm90ZToNCj4+IE9uIDkvMjYvMTkgMTA6MTYg
QU0sIFN0ZXZlbiBQcmljZSB3cm90ZToNCj4+PiBkcm1fc2NoZWRfY2xlYW51cF9qb2JzKCkgYXR0
ZW1wdHMgdG8gZnJlZSBmaW5pc2hlZCBqb2JzLCBob3dldmVyIGJlY2F1c2UNCj4+PiBpdCBpcyBj
YWxsZWQgYXMgdGhlIGNvbmRpdGlvbiBvZiB3YWl0X2V2ZW50X2ludGVycnVwdGlibGUoKSBpdCBt
dXN0IG5vdA0KPj4+IHNsZWVwLiBVbmZvcnR1YW50bHkgc29tZSBmcmVlIGNhbGxiYWNrcyAobm90
aWJseSBmb3IgUGFuZnJvc3QpIGRvIHNsZWVwLg0KPj4+DQo+Pj4gSW5zdGVhZCBsZXQncyByZW5h
bWUgZHJtX3NjaGVkX2NsZWFudXBfam9icygpIHRvDQo+Pj4gZHJtX3NjaGVkX2dldF9jbGVhbnVw
X2pvYigpIGFuZCBzaW1wbHkgcmV0dXJuIGEgam9iIGZvciBwcm9jZXNzaW5nIGlmDQo+Pj4gdGhl
cmUgaXMgb25lLiBUaGUgY2FsbGVyIGNhbiB0aGVuIGNhbGwgdGhlIGZyZWVfam9iKCkgY2FsbGJh
Y2sgb3V0c2lkZQ0KPj4+IHRoZSB3YWl0X2V2ZW50X2ludGVycnVwdGlibGUoKSB3aGVyZSBzbGVl
cGluZyBpcyBwb3NzaWJsZSBiZWZvcmUNCj4+PiByZS1jaGVja2luZyBhbmQgcmV0dXJuaW5nIHRv
IHNsZWVwIGlmIG5lY2Vzc2FyeS4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IFN0ZXZlbiBQcmlj
ZSA8c3RldmVuLnByaWNlQGFybS5jb20+DQo+Pj4gLS0tDQo+Pj4gQ2hhbmdlcyBmcm9tIHYzOg0K
Pj4+ICAgICogZHJtX3NjaGVkX21haW4oKSByZS1hcm1zIHRoZSB0aW1lb3V0IGZvciB0aGUgbmV4
dCBqb2IgYWZ0ZXIgY2FsbGluZw0KPj4+ICAgICAgZnJlZV9qb2IoKQ0KPj4+DQo+Pj4gICAgZHJp
dmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMgfCA0NSArKysrKysrKysrKysrKyst
LS0tLS0tLS0tLQ0KPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCAxOSBk
ZWxldGlvbnMoLSkNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1
bGVyL3NjaGVkX21haW4uYyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5j
DQo+Pj4gaW5kZXggOWEwZWU3NGQ4MmRjLi4xNDg0Njg0NDdiYTkgMTAwNjQ0DQo+Pj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMNCj4+PiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYw0KPj4+IEBAIC02MjIsNDMgKzYyMiw0MSBA
QCBzdGF0aWMgdm9pZCBkcm1fc2NoZWRfcHJvY2Vzc19qb2Ioc3RydWN0IGRtYV9mZW5jZSAqZiwg
c3RydWN0IGRtYV9mZW5jZV9jYiAqY2IpDQo+Pj4gICAgfQ0KPj4+ICAgIA0KPj4+ICAgIC8qKg0K
Pj4+IC0gKiBkcm1fc2NoZWRfY2xlYW51cF9qb2JzIC0gZGVzdHJveSBmaW5pc2hlZCBqb2JzDQo+
Pj4gKyAqIGRybV9zY2hlZF9nZXRfY2xlYW51cF9qb2IgLSBmZXRjaCB0aGUgbmV4dCBmaW5pc2hl
ZCBqb2IgdG8gYmUgZGVzdHJveWVkDQo+Pj4gICAgICoNCj4+PiAgICAgKiBAc2NoZWQ6IHNjaGVk
dWxlciBpbnN0YW5jZQ0KPj4+ICAgICAqDQo+Pj4gLSAqIFJlbW92ZSBhbGwgZmluaXNoZWQgam9i
cyBmcm9tIHRoZSBtaXJyb3IgbGlzdCBhbmQgZGVzdHJveSB0aGVtLg0KPj4+ICsgKiBSZXR1cm5z
IHRoZSBuZXh0IGZpbmlzaGVkIGpvYiBmcm9tIHRoZSBtaXJyb3IgbGlzdCAoaWYgdGhlcmUgaXMg
b25lKQ0KPj4+ICsgKiByZWFkeSBmb3IgaXQgdG8gYmUgZGVzdHJveWVkLg0KPj4+ICAgICAqLw0K
Pj4+IC1zdGF0aWMgdm9pZCBkcm1fc2NoZWRfY2xlYW51cF9qb2JzKHN0cnVjdCBkcm1fZ3B1X3Nj
aGVkdWxlciAqc2NoZWQpDQo+Pj4gK3N0YXRpYyBzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqDQo+Pj4g
K2RybV9zY2hlZF9nZXRfY2xlYW51cF9qb2Ioc3RydWN0IGRybV9ncHVfc2NoZWR1bGVyICpzY2hl
ZCkNCj4+PiAgICB7DQo+Pj4gKwlzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqam9iID0gTlVMTDsNCj4+
PiAgICAJdW5zaWduZWQgbG9uZyBmbGFnczsNCj4+PiAgICANCj4+PiAgICAJLyogRG9uJ3QgZGVz
dHJveSBqb2JzIHdoaWxlIHRoZSB0aW1lb3V0IHdvcmtlciBpcyBydW5uaW5nICovDQo+Pj4gICAg
CWlmIChzY2hlZC0+dGltZW91dCAhPSBNQVhfU0NIRURVTEVfVElNRU9VVCAmJg0KPj4+ICAgIAkg
ICAgIWNhbmNlbF9kZWxheWVkX3dvcmsoJnNjaGVkLT53b3JrX3RkcikpDQo+Pj4gLQkJcmV0dXJu
Ow0KPj4+IC0NCj4+PiArCQlyZXR1cm4gTlVMTDsNCj4+PiAgICANCj4+PiAtCXdoaWxlICghbGlz
dF9lbXB0eSgmc2NoZWQtPnJpbmdfbWlycm9yX2xpc3QpKSB7DQo+Pj4gLQkJc3RydWN0IGRybV9z
Y2hlZF9qb2IgKmpvYjsNCj4+PiArCXNwaW5fbG9ja19pcnFzYXZlKCZzY2hlZC0+am9iX2xpc3Rf
bG9jaywgZmxhZ3MpOw0KPj4+ICAgIA0KPj4+IC0JCWpvYiA9IGxpc3RfZmlyc3RfZW50cnkoJnNj
aGVkLT5yaW5nX21pcnJvcl9saXN0LA0KPj4+ICsJam9iID0gbGlzdF9maXJzdF9lbnRyeV9vcl9u
dWxsKCZzY2hlZC0+cmluZ19taXJyb3JfbGlzdCwNCj4+PiAgICAJCQkJICAgICAgIHN0cnVjdCBk
cm1fc2NoZWRfam9iLCBub2RlKTsNCj4+PiAtCQlpZiAoIWRtYV9mZW5jZV9pc19zaWduYWxlZCgm
am9iLT5zX2ZlbmNlLT5maW5pc2hlZCkpDQo+Pj4gLQkJCWJyZWFrOw0KPj4+ICAgIA0KPj4+IC0J
CXNwaW5fbG9ja19pcnFzYXZlKCZzY2hlZC0+am9iX2xpc3RfbG9jaywgZmxhZ3MpOw0KPj4+ICsJ
aWYgKGpvYiAmJiBkbWFfZmVuY2VfaXNfc2lnbmFsZWQoJmpvYi0+c19mZW5jZS0+ZmluaXNoZWQp
KSB7DQo+Pj4gICAgCQkvKiByZW1vdmUgam9iIGZyb20gcmluZ19taXJyb3JfbGlzdCAqLw0KPj4+
ICAgIAkJbGlzdF9kZWxfaW5pdCgmam9iLT5ub2RlKTsNCj4+PiAtCQlzcGluX3VubG9ja19pcnFy
ZXN0b3JlKCZzY2hlZC0+am9iX2xpc3RfbG9jaywgZmxhZ3MpOw0KPj4+IC0NCj4+PiAtCQlzY2hl
ZC0+b3BzLT5mcmVlX2pvYihqb2IpOw0KPj4+ICsJfSBlbHNlIHsNCj4+PiArCQlqb2IgPSBOVUxM
Ow0KPj4+ICsJCS8qIHF1ZXVlIHRpbWVvdXQgZm9yIG5leHQgam9iICovDQo+Pj4gKwkJZHJtX3Nj
aGVkX3N0YXJ0X3RpbWVvdXQoc2NoZWQpOw0KPj4+ICAgIAl9DQo+Pj4gICAgDQo+Pj4gLQkvKiBx
dWV1ZSB0aW1lb3V0IGZvciBuZXh0IGpvYiAqLw0KPj4+IC0Jc3Bpbl9sb2NrX2lycXNhdmUoJnNj
aGVkLT5qb2JfbGlzdF9sb2NrLCBmbGFncyk7DQo+Pj4gLQlkcm1fc2NoZWRfc3RhcnRfdGltZW91
dChzY2hlZCk7DQo+Pj4gICAgCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnNjaGVkLT5qb2JfbGlz
dF9sb2NrLCBmbGFncyk7DQo+Pj4gICAgDQo+Pj4gKwlyZXR1cm4gam9iOw0KPj4+ICAgIH0NCj4+
PiAgICANCj4+PiAgICAvKioNCj4+PiBAQCAtNjk4LDEyICs2OTYsMjEgQEAgc3RhdGljIGludCBk
cm1fc2NoZWRfbWFpbih2b2lkICpwYXJhbSkNCj4+PiAgICAJCXN0cnVjdCBkcm1fc2NoZWRfZmVu
Y2UgKnNfZmVuY2U7DQo+Pj4gICAgCQlzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqc2NoZWRfam9iOw0K
Pj4+ICAgIAkJc3RydWN0IGRtYV9mZW5jZSAqZmVuY2U7DQo+Pj4gKwkJc3RydWN0IGRybV9zY2hl
ZF9qb2IgKmNsZWFudXBfam9iID0gTlVMTDsNCj4+PiAgICANCj4+PiAgICAJCXdhaXRfZXZlbnRf
aW50ZXJydXB0aWJsZShzY2hlZC0+d2FrZV91cF93b3JrZXIsDQo+Pj4gLQkJCQkJIChkcm1fc2No
ZWRfY2xlYW51cF9qb2JzKHNjaGVkKSwNCj4+PiArCQkJCQkgKGNsZWFudXBfam9iID0gZHJtX3Nj
aGVkX2dldF9jbGVhbnVwX2pvYihzY2hlZCkpIHx8DQo+Pj4gICAgCQkJCQkgKCFkcm1fc2NoZWRf
YmxvY2tlZChzY2hlZCkgJiYNCj4+PiAgICAJCQkJCSAgKGVudGl0eSA9IGRybV9zY2hlZF9zZWxl
Y3RfZW50aXR5KHNjaGVkKSkpIHx8DQo+Pj4gLQkJCQkJIGt0aHJlYWRfc2hvdWxkX3N0b3AoKSkp
Ow0KPj4+ICsJCQkJCSBrdGhyZWFkX3Nob3VsZF9zdG9wKCkpOw0KPj4+ICsNCj4+PiArCQl3aGls
ZSAoY2xlYW51cF9qb2IpIHsNCj4+PiArCQkJc2NoZWQtPm9wcy0+ZnJlZV9qb2IoY2xlYW51cF9q
b2IpOw0KPj4+ICsJCQkvKiBxdWV1ZSB0aW1lb3V0IGZvciBuZXh0IGpvYiAqLw0KPj4+ICsJCQlk
cm1fc2NoZWRfc3RhcnRfdGltZW91dChzY2hlZCk7DQo+Pj4gKw0KPj4+ICsJCQljbGVhbnVwX2pv
YiA9IGRybV9zY2hlZF9nZXRfY2xlYW51cF9qb2Ioc2NoZWQpOw0KPj4+ICsJCX0NCj4+DQo+PiBX
aHkgZHJtX3NjaGVkX3N0YXJ0X3RpbWVvdXQgaXMgY2FsbGVkIGJvdGggaGVyZSBhbmQgaW5zaWRl
DQo+PiBkcm1fc2NoZWRfZ2V0X2NsZWFudXBfam9iID8gQW5kIGFsc28gd2h5IGNhbGwgaXQgbXVs
dGlwbGUgdGltZXMgaW4gdGhlDQo+PiBsb29wIGluc3RlYWQgb2Ygb25seSBvbmNlIGFmdGVyIHRo
ZSBsb29wIGlzIGRvbmXCoCA/DQo+IENocmlzdGlhbiBwb2ludGVkIG91dCB0byBiZSB0aGF0IHRo
ZSBmaXJzdCB0aGluZw0KPiBkcm1fc2NoZWRfZ2V0X2NsZWFudXBfam9iIGRvZXMgaXMgY2FsbCBj
YW5jZWxfZGVsYXllZF93b3JrKCksIGFuZCBpZg0KPiB0aGF0IHJldHVybnMgZmFsc2UgdGhlbiBp
dCBiYWlscyBvdXQgd2l0aCBhIE5VTEwgcmV0dXJuLiBTbyB0byBhY3R1YWxseQ0KPiBnZXQgYW5v
dGhlciBqb2IgKGlmIG9uZSBleGlzdHMpIHRoZSB0aW1lb3V0IGhhcyB0byBiZSByZXN0YXJ0ZWQu
DQoNCg0KRm9yIHRoaXMgY2FzZSB3aGVyZSB0aW1lb3V0IHdvcmsgYWxyZWFkeSBpbiBwcm9ncmVz
cyBub3RlIHRoYXQgDQpkcm1fc2NoZWRfam9iX3RpbWVkb3V0IHJlc3RhcnRzIHRoZSB0aW1lb3V0
IGluIGl0J3MgZW5kIHNvIGl0IHNob3VsZCBiZSANCm9rIHRvIHJlc3RhcnQgdGhlIHRpbWVvdXQg
dW5jb25kaXRpb25hbGx5IGluc2lkZSANCmRybV9zY2hlZF9nZXRfY2xlYW51cF9qb2IgYXMgaXQg
d2FzIGRvbmUgYmVmb3JlLg0KDQoNCj4NCj4gSXQncyBhbHNvIG5lY2Vzc2FyeSB0byByZXN0YXJ0
IHRoZSB0aW1lb3V0IGluIHRoZSBjYXNlIHdoZXJlIHRoZSByZXR1cm4NCj4gaXMgTlVMTCB3aGlj
aCBpcyBoYW5kbGVkIGluIHRoZSBmdW5jdGlvbiBpdHNlbGYuDQo+DQo+IFRCSCBJJ20gbm90IHN1
cmUgd2hldGhlciB0aGlzIHdoaWxlIGxvb3AgaXMgd29ydGggaXQgLSBpdCBtYXkgYmUgYmV0dGVy
DQo+IHRvIHJlcGxhY2UgaXQgd2l0aCBzaW1wbHk6DQo+DQo+IAlpZiAoY2xlYW51cF9qb2IpIHsN
Cj4gCQlzY2hlZC0+b3BzLT5mcmVlX2pvYihjbGVhbnVwX2pvYik7DQo+IAkJLyogcXVldWUgdGlt
ZW91dCBmb3IgbmV4dCBqb2IgKi8NCj4gCQlkcm1fc2NoZWRfc3RhcnRfdGltZW91dChzY2hlZCk7
DQo+IAl9DQo+DQo+IFRoZSBvdXRlciBsb29wIHdvdWxkIHRoZW4gaGFuZGxlIHRoZSBuZXh0IGNh
bGwgdG8NCj4gZHJtX3NjaGVkX2dldF9jbGVhbnVwX2pvYigpIGFzIG5lY2Vzc2FyeS4NCg0KDQpX
aGF0IG91dGVyIGxvb3AgPw0KDQpBbmRyZXkNCg0KPg0KPiBTdGV2ZQ0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
