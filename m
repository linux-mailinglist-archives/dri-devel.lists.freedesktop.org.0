Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F956C1DF5
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 11:28:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CFDC6E0F7;
	Mon, 30 Sep 2019 09:28:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800087.outbound.protection.outlook.com [40.107.80.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 342196E0F7;
 Mon, 30 Sep 2019 09:28:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SEKI0I7Mak/fBvoAnlZleP+MEE8f5OHRlkzS6BWXFoHQcYeHpjzwS4hvzBgBrkZ5+4v858dMPv0IV76FI6Z1mljrlWo3WkjxsHvTgWGLV7Kkmrs/fa/fUDyncH8xp/KURANSta/jumbCdpFz8y4UT6ON9eGt7yjdBfGtPmhOZxShJIAcqHEd9XlrTpamXkGF+PhPbQdvL1qmVeHfhdtphgVVAV0qDIUsFsUrJ0k9IluIi6xM/cf1C5/Yzvdlhl65fgjgA57QksppMBfE7el/biSKuqx0s/yss8CKobq/wAqNiv0IAWlTF0sMfiZ28EkXzo4Rbz3n2HtTS2r6CWzqlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/4gkafXpqZJEhorlWyh3Moh+P5nHmOz/IwzoEt9piVE=;
 b=Hyr0N4YhIlWociBAW5TRvohZdHvA4cgxFukESd6B1TjysrHGSSYmu3GXGyaMW99m1eNXWoHR+PSp/A/2F/d6mN6mXEKDU0GI+CvRMK8qEqs3R+NLVr7Q99/YELlfqaMDMbvvDJ/v8bLQQtK409ELOxS10j426H2SLg3x0mPmhsSqlG1yNu/VfU2Huep+tqVo0R39y9p8hYO5JwROv/mks138oZV/3aRPyvhOJlh9T8Ma6c5fQuumpbiSC4FUoNYzHNCEmVJgYwEMFdF/A+1xKvX/kwjGz10HzPp+hyuBYg1ZttPROXdN13zutNxhpxOtyCq4HHSo3Z7azq1gcukJCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1699.namprd12.prod.outlook.com (10.175.97.148) by
 BN6PR12MB1508.namprd12.prod.outlook.com (10.172.23.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Mon, 30 Sep 2019 09:28:14 +0000
Received: from BN6PR12MB1699.namprd12.prod.outlook.com
 ([fe80::7d62:3e74:d0f0:be92]) by BN6PR12MB1699.namprd12.prod.outlook.com
 ([fe80::7d62:3e74:d0f0:be92%3]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 09:28:14 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Frediano Ziglio <fziglio@redhat.com>
Subject: Re: [Spice-devel] [PATCH 1/2] drm/qxl: stop abusing TTM to call
 driver internal functions
Thread-Topic: [Spice-devel] [PATCH 1/2] drm/qxl: stop abusing TTM to call
 driver internal functions
Thread-Index: AQHVd3FePLizV3BOzkihcGVBzkmelQ==
Date: Mon, 30 Sep 2019 09:28:13 +0000
Message-ID: <3da66dc5-d78a-4aa7-4ecc-d28085d99502@amd.com>
References: <20190927132458.4359-1-christian.koenig@amd.com>
 <2008023935.3565992.1569601905303.JavaMail.zimbra@redhat.com>
In-Reply-To: <2008023935.3565992.1569601905303.JavaMail.zimbra@redhat.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0081.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::21) To BN6PR12MB1699.namprd12.prod.outlook.com
 (2603:10b6:404:ff::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8180e972-dec4-4b16-9553-08d745888466
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BN6PR12MB1508:
x-microsoft-antispam-prvs: <BN6PR12MB1508C906828EF9E9B2CF11A483820@BN6PR12MB1508.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(366004)(346002)(136003)(39860400002)(199004)(189003)(71190400001)(486006)(66574012)(81166006)(65806001)(8676002)(71200400001)(76176011)(52116002)(102836004)(6246003)(229853002)(6486002)(2906002)(65956001)(99286004)(11346002)(81156014)(31686004)(305945005)(46003)(186003)(2616005)(476003)(7736002)(446003)(8936002)(6916009)(86362001)(66946007)(54906003)(5660300002)(25786009)(66556008)(316002)(6116002)(66476007)(31696002)(4326008)(64756008)(58126008)(66446008)(6512007)(36756003)(14454004)(386003)(6506007)(256004)(6436002)(478600001)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1508;
 H:BN6PR12MB1699.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: exm5hhqyJYMxilpSb2GzMmTAaa226XJg5zB9mVz6gYKaCh1EUleZIbDQ4+VPaF+eDudsh9MjIhMAIO9mLZSV27gckmZGxt/FckqZ68kESF77Wi6VglwNtpAcSBzdL255yLW1POoIhD0ytuXAabHX6DjMsL2UV4OrVQSfwsc9K1CwQGCU8IYVb1qpFPmIfoIoF2feX6e1Br6F1vidIGq+Qhwepmo+xW0JTCBFoUq0mZb47fkLZsc7f4j58BA9paHtXUZaUX6lr9usclO8byOLDjN6jOH3z2jlbhHBGTLPgqB/YiJMuqcpRid0gDWhOMMzoG3iP6MZaDAMwbBFIyQgowD+c/4kUQbrdREpVtkEJwiV4tvI7LZ7I7hUcG3oJ/pnyI+m1AKK5CxfJKtkwXQT9FvCBYDy1b3NgE4fO43caCE=
x-ms-exchange-transport-forked: True
Content-ID: <2BFA81962BF80940AD914B0DF79C774A@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8180e972-dec4-4b16-9553-08d745888466
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 09:28:13.9326 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s0svvYUMrrOs4wz+VIPoHMWyePmvvbe+z8oqwzUSvKI/4l9thuzRVA0p+daEqhLS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1508
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/4gkafXpqZJEhorlWyh3Moh+P5nHmOz/IwzoEt9piVE=;
 b=V3gICFG3+PRfnRh01qHSa6huowLnYhzHmX0f5tx0MzkgZ33EuCnYmn37HrG4wkg8oSvFhJgQkTxJB1TJT5XBQbIG65nL3QPe3vBxp7fzTmkTkB8Ms43Usaday81zUiZylWRNaydNBZ7B4DWiAPxIq8Lemoa2is2h6gB+AMyCY58=
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "airlied@redhat.com" <airlied@redhat.com>,
 "spice-devel@lists.freedesktop.org" <spice-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjcuMDkuMTkgdW0gMTg6MzEgc2NocmllYiBGcmVkaWFubyBaaWdsaW86DQo+PiBUaGUgdHRt
X21lbV9pb18qIGZ1bmN0aW9ucyBhcmUgYWN0dWFsbHkgaW50ZXJuYWwgdG8gVFRNIGFuZCBzaG91
bGRuJ3QgYmUNCj4+IHVzZWQgaW4gYSBkcml2ZXIuDQo+Pg0KPiBBcyBmYXIgYXMgSSBjYW4gc2Vl
IGJ5IHlvdXIgc2Vjb25kIHBhdGNoIFFYTCBpcyBqdXN0IHVzaW5nIGV4cG9ydGVkDQo+ICh0aGF0
IGlzIG5vdCBpbnRlcm5hbCkgZnVuY3Rpb25zLg0KPiBOb3QgdGhhdCB0aGUgaWRlYSBvZiBtYWtp
bmcgdGhlbSBpbnRlcm5hbCBpcyBiYWQgYnV0IHRoaXMgY29tbWVudCBpcw0KPiBhIHdyb25nIHN0
YXRlbWVudC4NCg0KU2VlIHRoZSBoaXN0b3J5IG9mIGV4cG9ydGluZyB0aG9zZSwgdGhhdCB3YXMg
ZG9uZSBzcGVjaWZpY2FsbHkgc28gdGhhdCANClFYTCBjYW4gY2FsbCB0aGVtIChjb21taXQgYWZl
NjgwNGMwNDVmYmQ2OWExYjc1YzY4MTEwN2I1ZDZkZjkxOTBkZSkuDQoNCkJ1dCB0aG9zZSBhcmUg
dGhlIGludGVybmFsIGZ1bmN0aW9ucyB3aGljaCBUVE0gdXNlcyB0byBjYWxsIGludG8gdGhlIA0K
ZHJpdmVyLiBUaGF0IGEgZHJpdmVyIHVzZXMgdGhlbSB0byBjYWxsIGludG8gaXRzZWxmIGRvZXNu
J3Qgc2VlbSB0byBtYWtlIA0Kc2Vuc2UuDQoNCj4+IEluc3RlYWQgY2FsbCB0aGUgcXhsX3R0bV9p
b19tZW1fcmVzZXJ2ZSgpIGZ1bmN0aW9uIGRpcmVjdGx5Lg0KPj4NCj4gSSB3b3VsZCBhZGQgdGhh
dCBxeGxfdHRtX2lvX21lbV9mcmVlIGlzIGVtcHR5IHNvIHRoZSByZW1vdmFsIG9mDQo+IHR0bV9t
ZW1faW9fZnJlZSBpcyBmaW5lLg0KDQpHb29kIHBvaW50LCBnb2luZyB0byBhZGQgdGhhdC4NCg0K
VGhhbmtzLA0KQ2hyaXN0aWFuLg0KDQo+DQo+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2
bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQo+PiAtLS0NCj4+ICAgZHJpdmVycy9ncHUv
ZHJtL3F4bC9xeGxfZHJ2LmggICAgfCAgMiArKw0KPj4gICBkcml2ZXJzL2dwdS9kcm0vcXhsL3F4
bF9vYmplY3QuYyB8IDExICstLS0tLS0tLS0tDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9xeGwvcXhs
X3R0bS5jICAgIHwgIDQgKystLQ0KPj4gICAzIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KSwgMTIgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9x
eGwvcXhsX2Rydi5oIGIvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfZHJ2LmgNCj4+IGluZGV4IDll
MDM0YzVmYTg3ZC4uOGEyNGY4ZTEwMWRhIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3F4bC9xeGxfZHJ2LmgNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2Rydi5oDQo+
PiBAQCAtMzU0LDYgKzM1NCw4IEBAIGludCBxeGxfbW9kZV9kdW1iX21tYXAoc3RydWN0IGRybV9m
aWxlICpmaWxwLA0KPj4gICAvKiBxeGwgdHRtICovDQo+PiAgIGludCBxeGxfdHRtX2luaXQoc3Ry
dWN0IHF4bF9kZXZpY2UgKnFkZXYpOw0KPj4gICB2b2lkIHF4bF90dG1fZmluaShzdHJ1Y3QgcXhs
X2RldmljZSAqcWRldik7DQo+PiAraW50IHF4bF90dG1faW9fbWVtX3Jlc2VydmUoc3RydWN0IHR0
bV9ib19kZXZpY2UgKmJkZXYsDQo+PiArCQkJICAgc3RydWN0IHR0bV9tZW1fcmVnICptZW0pOw0K
Pj4gICBpbnQgcXhsX21tYXAoc3RydWN0IGZpbGUgKmZpbHAsIHN0cnVjdCB2bV9hcmVhX3N0cnVj
dCAqdm1hKTsNCj4+ICAgDQo+PiAgIC8qIHF4bCBpbWFnZSAqLw0KPj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9xeGwvcXhsX29iamVjdC5jDQo+PiBiL2RyaXZlcnMvZ3B1L2RybS9xeGwv
cXhsX29iamVjdC5jDQo+PiBpbmRleCA1NDhkZmU2ZjNiMjYuLjI5OWU2M2E5NTFjNSAxMDA2NDQN
Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX29iamVjdC5jDQo+PiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vcXhsL3F4bF9vYmplY3QuYw0KPj4gQEAgLTE0OCw3ICsxNDgsNiBAQCBpbnQg
cXhsX2JvX2ttYXAoc3RydWN0IHF4bF9ibyAqYm8sIHZvaWQgKipwdHIpDQo+PiAgIHZvaWQgKnF4
bF9ib19rbWFwX2F0b21pY19wYWdlKHN0cnVjdCBxeGxfZGV2aWNlICpxZGV2LA0KPj4gICAJCQkg
ICAgICBzdHJ1Y3QgcXhsX2JvICpibywgaW50IHBhZ2Vfb2Zmc2V0KQ0KPj4gICB7DQo+PiAtCXN0
cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuID0NCj4+ICZiby0+dGJvLmJkZXYtPm1hblti
by0+dGJvLm1lbS5tZW1fdHlwZV07DQo+PiAgIAl2b2lkICpycHRyOw0KPj4gICAJaW50IHJldDsN
Cj4+ICAgCXN0cnVjdCBpb19tYXBwaW5nICptYXA7DQo+PiBAQCAtMTYwLDkgKzE1OSw3IEBAIHZv
aWQgKnF4bF9ib19rbWFwX2F0b21pY19wYWdlKHN0cnVjdCBxeGxfZGV2aWNlICpxZGV2LA0KPj4g
ICAJZWxzZQ0KPj4gICAJCWdvdG8gZmFsbGJhY2s7DQo+PiAgIA0KPj4gLQkodm9pZCkgdHRtX21l
bV9pb19sb2NrKG1hbiwgZmFsc2UpOw0KPj4gLQlyZXQgPSB0dG1fbWVtX2lvX3Jlc2VydmUoYm8t
PnRiby5iZGV2LCAmYm8tPnRiby5tZW0pOw0KPj4gLQl0dG1fbWVtX2lvX3VubG9jayhtYW4pOw0K
Pj4gKwlyZXQgPSBxeGxfdHRtX2lvX21lbV9yZXNlcnZlKGJvLT50Ym8uYmRldiwgJmJvLT50Ym8u
bWVtKTsNCj4+ICAgDQo+PiAgIAlyZXR1cm4gaW9fbWFwcGluZ19tYXBfYXRvbWljX3djKG1hcCwg
Ym8tPnRiby5tZW0uYnVzLm9mZnNldCArIHBhZ2Vfb2Zmc2V0KTsNCj4+ICAgZmFsbGJhY2s6DQo+
PiBAQCAtMTkzLDE3ICsxOTAsMTEgQEAgdm9pZCBxeGxfYm9fa3VubWFwKHN0cnVjdCBxeGxfYm8g
KmJvKQ0KPj4gICB2b2lkIHF4bF9ib19rdW5tYXBfYXRvbWljX3BhZ2Uoc3RydWN0IHF4bF9kZXZp
Y2UgKnFkZXYsDQo+PiAgIAkJCSAgICAgICBzdHJ1Y3QgcXhsX2JvICpibywgdm9pZCAqcG1hcCkN
Cj4+ICAgew0KPj4gLQlzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbiA9DQo+PiAmYm8t
PnRiby5iZGV2LT5tYW5bYm8tPnRiby5tZW0ubWVtX3R5cGVdOw0KPj4gLQ0KPj4gICAJaWYgKChi
by0+dGJvLm1lbS5tZW1fdHlwZSAhPSBUVE1fUExfVlJBTSkgJiYNCj4+ICAgCSAgICAoYm8tPnRi
by5tZW0ubWVtX3R5cGUgIT0gVFRNX1BMX1BSSVYpKQ0KPj4gICAJCWdvdG8gZmFsbGJhY2s7DQo+
PiAgIA0KPj4gICAJaW9fbWFwcGluZ191bm1hcF9hdG9taWMocG1hcCk7DQo+PiAtDQo+PiAtCSh2
b2lkKSB0dG1fbWVtX2lvX2xvY2sobWFuLCBmYWxzZSk7DQo+PiAtCXR0bV9tZW1faW9fZnJlZShi
by0+dGJvLmJkZXYsICZiby0+dGJvLm1lbSk7DQo+PiAtCXR0bV9tZW1faW9fdW5sb2NrKG1hbik7
DQo+PiAgIAlyZXR1cm47DQo+PiAgICBmYWxsYmFjazoNCj4+ICAgCXF4bF9ib19rdW5tYXAoYm8p
Ow0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX3R0bS5jIGIvZHJpdmVy
cy9ncHUvZHJtL3F4bC9xeGxfdHRtLmMNCj4+IGluZGV4IDliMjQ1MTRjNzVhYS4uY2I4MGU1MTJk
ZDQ2IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfdHRtLmMNCj4+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX3R0bS5jDQo+PiBAQCAtMTU5LDggKzE1OSw4IEBA
IHN0YXRpYyBpbnQgcXhsX3ZlcmlmeV9hY2Nlc3Moc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0DQo+
PiAqYm8sIHN0cnVjdCBmaWxlICpmaWxwKQ0KPj4gICAJCQkJCSAgZmlscC0+cHJpdmF0ZV9kYXRh
KTsNCj4+ICAgfQ0KPj4gICANCj4+IC1zdGF0aWMgaW50IHF4bF90dG1faW9fbWVtX3Jlc2VydmUo
c3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsDQo+PiAtCQkJCSAgc3RydWN0IHR0bV9tZW1fcmVn
ICptZW0pDQo+PiAraW50IHF4bF90dG1faW9fbWVtX3Jlc2VydmUoc3RydWN0IHR0bV9ib19kZXZp
Y2UgKmJkZXYsDQo+PiArCQkJICAgc3RydWN0IHR0bV9tZW1fcmVnICptZW0pDQo+PiAgIHsNCj4+
ICAgCXN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuID0gJmJkZXYtPm1hblttZW0tPm1l
bV90eXBlXTsNCj4+ICAgCXN0cnVjdCBxeGxfZGV2aWNlICpxZGV2ID0gcXhsX2dldF9xZGV2KGJk
ZXYpOw0KPiBPdGhlcndpc2UgZmluZSBmb3IgbWUuDQo+DQo+IEZyZWRpYW5vDQoNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
