Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD641C21E2
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 15:23:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29ABE6E42D;
	Mon, 30 Sep 2019 13:23:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810078.outbound.protection.outlook.com [40.107.81.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB66D6E42D;
 Mon, 30 Sep 2019 13:23:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MG2vFyRELNjewu3cymAg7JXQOenZrJlb3HAqUOqUVnHTiNxwtRJWH7k/fuJwT8l6nw1E7Plz8sB3apEnzPhLpTmlab4Ir/o0p6t9J5/byh+7PPN0TFWDtrSTB8vls0wkm+6IZ9QlOy6ac8xXId1/awGSVkwePrZ7JI//Ztmwb6g5x1ZfuNqIJ/c9v4124pdQQYpq49vtMRoddBz4Auoi5xX+Zypl6qpPDHeGOusLd2nVNYtd7xXCiYurA24Ykl/FzxfLzV5VhIzVrE743NAVlHDxzTHD4OUmaCYkE7j6Isq6qLL/jWjolb6GbXEGVmTaWfy+dZv0YPaHTwEv5yzenQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xNevS1Rgr/2uJ4aclBBZJ4MlljfBuAaf7/dk0a6p7iw=;
 b=MHO7eECcRvDReDBU9mJTRNrrxEFkBu/T25i463plYNN7EO9pCV2fK3F3lCjGGWPghAobuhoONpy7tkzrgco3DTcVboTbRsWQVF1m5BdYkW4CvbWEsJZanRDtucJrgC1LG/IaT5Ft1t7T09ldk4rB32+cC89jVLkElZ6fa3YwjT3qdgJENUcESs+jvFsNJfLdkyHWX5uGG/xMiFt2c38KbhnLDmIz7Zm7X/N5QX9MvS1SKdd5zQKOrziySQuFaVGBYjMRGMxtJnm+1N25A4J0srvzfjfbg0aNOocTwjV12HUg0p15KEq1I5qHn0TYN0qLDoSgwb481i0xsZUh6/PDWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1699.namprd12.prod.outlook.com (10.175.97.148) by
 BN6PR12MB1217.namprd12.prod.outlook.com (10.168.229.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Mon, 30 Sep 2019 13:23:51 +0000
Received: from BN6PR12MB1699.namprd12.prod.outlook.com
 ([fe80::7d62:3e74:d0f0:be92]) by BN6PR12MB1699.namprd12.prod.outlook.com
 ([fe80::7d62:3e74:d0f0:be92%3]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 13:23:51 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Frediano Ziglio <fziglio@redhat.com>
Subject: Re: [Spice-devel] [PATCH 1/2] drm/qxl: stop abusing TTM to call
 driver internal functions
Thread-Topic: [Spice-devel] [PATCH 1/2] drm/qxl: stop abusing TTM to call
 driver internal functions
Thread-Index: AQHVd3FePLizV3BOzkihcGVBzkmeldDquPb51ll8tIA=
Date: Mon, 30 Sep 2019 13:23:50 +0000
Message-ID: <18edbb52-d230-8e93-1808-586253d969de@amd.com>
References: <20190927132458.4359-1-christian.koenig@amd.com>
 <2008023935.3565992.1569601905303.JavaMail.zimbra@redhat.com>
 <3da66dc5-d78a-4aa7-4ecc-d28085d99502@amd.com>
 <859065241.3666996.1569837067022.JavaMail.zimbra@redhat.com>
In-Reply-To: <859065241.3666996.1569837067022.JavaMail.zimbra@redhat.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: MR2P264CA0014.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::26) To BN6PR12MB1699.namprd12.prod.outlook.com
 (2603:10b6:404:ff::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b7857209-12ef-4a88-d569-08d745a96ec9
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BN6PR12MB1217:
x-microsoft-antispam-prvs: <BN6PR12MB121747990AD9AFBF3900845383820@BN6PR12MB1217.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(376002)(396003)(346002)(136003)(199004)(189003)(486006)(446003)(476003)(11346002)(2616005)(76176011)(66574012)(52116002)(386003)(6506007)(81166006)(65806001)(65956001)(99286004)(2906002)(46003)(8936002)(8676002)(316002)(81156014)(31696002)(102836004)(58126008)(86362001)(186003)(54906003)(5660300002)(256004)(14444005)(478600001)(14454004)(4326008)(71190400001)(71200400001)(6116002)(36756003)(66446008)(64756008)(66556008)(66476007)(66946007)(6436002)(6486002)(25786009)(6512007)(7736002)(305945005)(229853002)(31686004)(6246003)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1217;
 H:BN6PR12MB1699.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 47iqW5SlrkL/YsW9CJxri3jvdyZBS8DAkcjiINfmn1xFSKfjlCaOtF1HFLF4HHExWuNtNaxxoJiuedVjuzIzK5/K71ZDOIk+yA8yKz8ECMGbUDquHxxmQBeYf3StVxXg1GFhuMrAkZp3LIMcND+2kPslG77sbzdpaGQqaxQJt7h561AzDKiBgM+qFkyemD+D1EwFXYDfudtxmRRqtQXGEcd7wHXcRmGsq7Wx6yaLE7ob/P82VwrvkhsEgDog3spyaIm7M7V7KgXMAz5sh7ehphD3Nuil6awjv1QEY8Qmwl5qJy/vDLvbDpTfFueJljtAMqGC3/knmSr2eOqOjn+iK/IHvbBBMKPCfYCw3YGI3ly883c9zQa+2Lj9RkCAcb65PNPL2E1/JIIGbu3oJWrDm+JuuhMYnAmL1LB6efXNZaA=
x-ms-exchange-transport-forked: True
Content-ID: <B480EB127E505C468D2B992176A6215E@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7857209-12ef-4a88-d569-08d745a96ec9
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 13:23:50.8924 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DDXk8gire2fcGZf4UlZtJhkMPXzcQLzYNZEDY7kmtSoIUxU9RYp5AolRtlPoHLFB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1217
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xNevS1Rgr/2uJ4aclBBZJ4MlljfBuAaf7/dk0a6p7iw=;
 b=ii2HerfX2TCozTO7bkFMwDkSz36Di0mOEuESsy9qC8nCFiwrGAXesIXgg1J+/yw0CNM6vcm5vCSlQl75dfhUUr2cnyUV7CsGjFF1JcMlx9Oyz8vBFdghWA1G+jCLNP5DSmDS2S8mgt1QDEHmBuhwFvbdBFazSkb2p4eaaLFzWFk=
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

QW0gMzAuMDkuMTkgdW0gMTE6NTEgc2NocmllYiBGcmVkaWFubyBaaWdsaW86DQo+PiBBbSAyNy4w
OS4xOSB1bSAxODozMSBzY2hyaWViIEZyZWRpYW5vIFppZ2xpbzoNCj4+Pj4gVGhlIHR0bV9tZW1f
aW9fKiBmdW5jdGlvbnMgYXJlIGFjdHVhbGx5IGludGVybmFsIHRvIFRUTSBhbmQgc2hvdWxkbid0
IGJlDQo+Pj4+IHVzZWQgaW4gYSBkcml2ZXIuDQo+Pj4+DQo+Pj4gQXMgZmFyIGFzIEkgY2FuIHNl
ZSBieSB5b3VyIHNlY29uZCBwYXRjaCBRWEwgaXMganVzdCB1c2luZyBleHBvcnRlZA0KPj4+ICh0
aGF0IGlzIG5vdCBpbnRlcm5hbCkgZnVuY3Rpb25zLg0KPj4+IE5vdCB0aGF0IHRoZSBpZGVhIG9m
IG1ha2luZyB0aGVtIGludGVybmFsIGlzIGJhZCBidXQgdGhpcyBjb21tZW50IGlzDQo+Pj4gYSB3
cm9uZyBzdGF0ZW1lbnQuDQo+PiBTZWUgdGhlIGhpc3Rvcnkgb2YgZXhwb3J0aW5nIHRob3NlLCB0
aGF0IHdhcyBkb25lIHNwZWNpZmljYWxseSBzbyB0aGF0DQo+PiBRWEwgY2FuIGNhbGwgdGhlbSAo
Y29tbWl0IGFmZTY4MDRjMDQ1ZmJkNjlhMWI3NWM2ODExMDdiNWQ2ZGY5MTkwZGUpLg0KPj4NCj4+
IEJ1dCB0aG9zZSBhcmUgdGhlIGludGVybmFsIGZ1bmN0aW9ucyB3aGljaCBUVE0gdXNlcyB0byBj
YWxsIGludG8gdGhlDQo+PiBkcml2ZXIuIFRoYXQgYSBkcml2ZXIgdXNlcyB0aGVtIHRvIGNhbGwg
aW50byBpdHNlbGYgZG9lc24ndCBzZWVtIHRvIG1ha2UNCj4+IHNlbnNlLg0KPj4NCj4gVGhlIGNv
bW1pdCB3YXMgbWVyZ2VkIGFuZCByZWxlYXNlIGluIExpbnV4IDMuMTAgNiB5ZWFycyBhZ28sIHNp
bmNlDQo+IHRoZW4gdGhlc2UgZnVuY3Rpb25zIGhhdmUgYmVlbiBleHBvcnRlZC4gTm90IHNheWlu
ZyB0aGF0IHRoZSBRWEwgY2hhbmdlDQo+IHdhcyB3cm9uZyBhbmQgc2hvdWxkIG5vdCBoYXZlIGJl
ZW4gYWNrZWQgYW5kIG1lcmdlZCBidXQgYWZ0ZXIgNiB5ZWFycw0KPiBzYXlpbmcgdGhhdCB0aGVz
ZSBmdW5jdGlvbnMgYXJlIGludGVybmFsIGl0J3Mgbm90IGNvcnJlY3QuDQoNCldoeT8gSWYgYSBm
dW5jdGlvbiBpcyBpbnRlcm5hbCBvciBub3QgaXMgZGVmaW5lZCBieSB0aGUgZGVzaWduIGFuZCBu
b3QgDQp0aGUgYWN0dWFsIGltcGxlbWVudGF0aW9uLg0KDQo+IFNvbWV0aGluZyBsaWtlDQo+DQo+
ICJUaGUgdHRtX21lbV9pb18qIGZ1bmN0aW9ucyB3ZXJlIGludGVuZGVkIHRvIGJlIGludGVybmFs
IHRvIFRUTSBhbmQNCj4gc2hvdWxkbid0IGhhdmUgYmVlbiB1c2VkIGluIGEgZHJpdmVyLiBUaGV5
IHdlcmUgZXhwb3J0ZWQgaW4gY29tbWl0DQo+IGFmZTY4MDRjMDQ1ZmJkNjlhMWI3NWM2ODExMDdi
NWQ2ZGY5MTkwZGUganVzdCBmb3IgUVhMLiINCg0KR29vZCBwb2ludCBtZW50aW9uaW5nIHRoZSBj
b21taXQgYWRkaW5nIHRoYXQsIGdvaW5nIHRvIHVzZSB0aGlzIGZvciB0aGUgDQpjb21taXQgbWVz
c2FnZS4NCg0KQ2hyaXN0aWFuLg0KDQo+DQo+Pj4+IEluc3RlYWQgY2FsbCB0aGUgcXhsX3R0bV9p
b19tZW1fcmVzZXJ2ZSgpIGZ1bmN0aW9uIGRpcmVjdGx5Lg0KPj4+Pg0KPj4+IEkgd291bGQgYWRk
IHRoYXQgcXhsX3R0bV9pb19tZW1fZnJlZSBpcyBlbXB0eSBzbyB0aGUgcmVtb3ZhbCBvZg0KPj4+
IHR0bV9tZW1faW9fZnJlZSBpcyBmaW5lLg0KPj4gR29vZCBwb2ludCwgZ29pbmcgdG8gYWRkIHRo
YXQuDQo+Pg0KPj4gVGhhbmtzLA0KPj4gQ2hyaXN0aWFuLg0KPj4NCj4gRnJlZGlhbm8NCj4NCj4+
Pj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQu
Y29tPg0KPj4+PiAtLS0NCj4+Pj4gICAgZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfZHJ2LmggICAg
fCAgMiArKw0KPj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9vYmplY3QuYyB8IDExICst
LS0tLS0tLS0tDQo+Pj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX3R0bS5jICAgIHwgIDQg
KystLQ0KPj4+PiAgICAzIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRp
b25zKC0pDQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9k
cnYuaCBiL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2Rydi5oDQo+Pj4+IGluZGV4IDllMDM0YzVm
YTg3ZC4uOGEyNGY4ZTEwMWRhIDEwMDY0NA0KPj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcXhs
L3F4bF9kcnYuaA0KPj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9kcnYuaA0KPj4+
PiBAQCAtMzU0LDYgKzM1NCw4IEBAIGludCBxeGxfbW9kZV9kdW1iX21tYXAoc3RydWN0IGRybV9m
aWxlICpmaWxwLA0KPj4+PiAgICAvKiBxeGwgdHRtICovDQo+Pj4+ICAgIGludCBxeGxfdHRtX2lu
aXQoc3RydWN0IHF4bF9kZXZpY2UgKnFkZXYpOw0KPj4+PiAgICB2b2lkIHF4bF90dG1fZmluaShz
dHJ1Y3QgcXhsX2RldmljZSAqcWRldik7DQo+Pj4+ICtpbnQgcXhsX3R0bV9pb19tZW1fcmVzZXJ2
ZShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwNCj4+Pj4gKwkJCSAgIHN0cnVjdCB0dG1fbWVt
X3JlZyAqbWVtKTsNCj4+Pj4gICAgaW50IHF4bF9tbWFwKHN0cnVjdCBmaWxlICpmaWxwLCBzdHJ1
Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSk7DQo+Pj4+ICAgIA0KPj4+PiAgICAvKiBxeGwgaW1hZ2Ug
Ki8NCj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX29iamVjdC5jDQo+
Pj4+IGIvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfb2JqZWN0LmMNCj4+Pj4gaW5kZXggNTQ4ZGZl
NmYzYjI2Li4yOTllNjNhOTUxYzUgMTAwNjQ0DQo+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9x
eGwvcXhsX29iamVjdC5jDQo+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX29iamVj
dC5jDQo+Pj4+IEBAIC0xNDgsNyArMTQ4LDYgQEAgaW50IHF4bF9ib19rbWFwKHN0cnVjdCBxeGxf
Ym8gKmJvLCB2b2lkICoqcHRyKQ0KPj4+PiAgICB2b2lkICpxeGxfYm9fa21hcF9hdG9taWNfcGFn
ZShzdHJ1Y3QgcXhsX2RldmljZSAqcWRldiwNCj4+Pj4gICAgCQkJICAgICAgc3RydWN0IHF4bF9i
byAqYm8sIGludCBwYWdlX29mZnNldCkNCj4+Pj4gICAgew0KPj4+PiAtCXN0cnVjdCB0dG1fbWVt
X3R5cGVfbWFuYWdlciAqbWFuID0NCj4+Pj4gJmJvLT50Ym8uYmRldi0+bWFuW2JvLT50Ym8ubWVt
Lm1lbV90eXBlXTsNCj4+Pj4gICAgCXZvaWQgKnJwdHI7DQo+Pj4+ICAgIAlpbnQgcmV0Ow0KPj4+
PiAgICAJc3RydWN0IGlvX21hcHBpbmcgKm1hcDsNCj4+Pj4gQEAgLTE2MCw5ICsxNTksNyBAQCB2
b2lkICpxeGxfYm9fa21hcF9hdG9taWNfcGFnZShzdHJ1Y3QgcXhsX2RldmljZSAqcWRldiwNCj4+
Pj4gICAgCWVsc2UNCj4+Pj4gICAgCQlnb3RvIGZhbGxiYWNrOw0KPj4+PiAgICANCj4+Pj4gLQko
dm9pZCkgdHRtX21lbV9pb19sb2NrKG1hbiwgZmFsc2UpOw0KPj4+PiAtCXJldCA9IHR0bV9tZW1f
aW9fcmVzZXJ2ZShiby0+dGJvLmJkZXYsICZiby0+dGJvLm1lbSk7DQo+Pj4+IC0JdHRtX21lbV9p
b191bmxvY2sobWFuKTsNCj4+Pj4gKwlyZXQgPSBxeGxfdHRtX2lvX21lbV9yZXNlcnZlKGJvLT50
Ym8uYmRldiwgJmJvLT50Ym8ubWVtKTsNCj4+Pj4gICAgDQo+Pj4+ICAgIAlyZXR1cm4gaW9fbWFw
cGluZ19tYXBfYXRvbWljX3djKG1hcCwgYm8tPnRiby5tZW0uYnVzLm9mZnNldCArDQo+Pj4+ICAg
IAlwYWdlX29mZnNldCk7DQo+Pj4+ICAgIGZhbGxiYWNrOg0KPj4+PiBAQCAtMTkzLDE3ICsxOTAs
MTEgQEAgdm9pZCBxeGxfYm9fa3VubWFwKHN0cnVjdCBxeGxfYm8gKmJvKQ0KPj4+PiAgICB2b2lk
IHF4bF9ib19rdW5tYXBfYXRvbWljX3BhZ2Uoc3RydWN0IHF4bF9kZXZpY2UgKnFkZXYsDQo+Pj4+
ICAgIAkJCSAgICAgICBzdHJ1Y3QgcXhsX2JvICpibywgdm9pZCAqcG1hcCkNCj4+Pj4gICAgew0K
Pj4+PiAtCXN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuID0NCj4+Pj4gJmJvLT50Ym8u
YmRldi0+bWFuW2JvLT50Ym8ubWVtLm1lbV90eXBlXTsNCj4+Pj4gLQ0KPj4+PiAgICAJaWYgKChi
by0+dGJvLm1lbS5tZW1fdHlwZSAhPSBUVE1fUExfVlJBTSkgJiYNCj4+Pj4gICAgCSAgICAoYm8t
PnRiby5tZW0ubWVtX3R5cGUgIT0gVFRNX1BMX1BSSVYpKQ0KPj4+PiAgICAJCWdvdG8gZmFsbGJh
Y2s7DQo+Pj4+ICAgIA0KPj4+PiAgICAJaW9fbWFwcGluZ191bm1hcF9hdG9taWMocG1hcCk7DQo+
Pj4+IC0NCj4+Pj4gLQkodm9pZCkgdHRtX21lbV9pb19sb2NrKG1hbiwgZmFsc2UpOw0KPj4+PiAt
CXR0bV9tZW1faW9fZnJlZShiby0+dGJvLmJkZXYsICZiby0+dGJvLm1lbSk7DQo+Pj4+IC0JdHRt
X21lbV9pb191bmxvY2sobWFuKTsNCj4+Pj4gICAgCXJldHVybjsNCj4+Pj4gICAgIGZhbGxiYWNr
Og0KPj4+PiAgICAJcXhsX2JvX2t1bm1hcChibyk7DQo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vcXhsL3F4bF90dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX3R0bS5jDQo+
Pj4+IGluZGV4IDliMjQ1MTRjNzVhYS4uY2I4MGU1MTJkZDQ2IDEwMDY0NA0KPj4+PiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vcXhsL3F4bF90dG0uYw0KPj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
cXhsL3F4bF90dG0uYw0KPj4+PiBAQCAtMTU5LDggKzE1OSw4IEBAIHN0YXRpYyBpbnQgcXhsX3Zl
cmlmeV9hY2Nlc3Moc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0DQo+Pj4+ICpibywgc3RydWN0IGZp
bGUgKmZpbHApDQo+Pj4+ICAgIAkJCQkJICBmaWxwLT5wcml2YXRlX2RhdGEpOw0KPj4+PiAgICB9
DQo+Pj4+ICAgIA0KPj4+PiAtc3RhdGljIGludCBxeGxfdHRtX2lvX21lbV9yZXNlcnZlKHN0cnVj
dCB0dG1fYm9fZGV2aWNlICpiZGV2LA0KPj4+PiAtCQkJCSAgc3RydWN0IHR0bV9tZW1fcmVnICpt
ZW0pDQo+Pj4+ICtpbnQgcXhsX3R0bV9pb19tZW1fcmVzZXJ2ZShzdHJ1Y3QgdHRtX2JvX2Rldmlj
ZSAqYmRldiwNCj4+Pj4gKwkJCSAgIHN0cnVjdCB0dG1fbWVtX3JlZyAqbWVtKQ0KPj4+PiAgICB7
DQo+Pj4+ICAgIAlzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbiA9ICZiZGV2LT5tYW5b
bWVtLT5tZW1fdHlwZV07DQo+Pj4+ICAgIAlzdHJ1Y3QgcXhsX2RldmljZSAqcWRldiA9IHF4bF9n
ZXRfcWRldihiZGV2KTsNCj4+PiBPdGhlcndpc2UgZmluZSBmb3IgbWUuDQo+Pj4NCj4+PiBGcmVk
aWFubw0KPj4NCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
