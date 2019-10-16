Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A348D909C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 14:18:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B6B089954;
	Wed, 16 Oct 2019 12:18:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770045.outbound.protection.outlook.com [40.107.77.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA5E589954
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 12:18:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m54/4ZdfMhUBvtOmZMOv3/t7uNfrKEULXTp2DNCUYr+kC7O2/F7OxEzeQCfo5nYyAM1kQgIhPGNgiQiIbJdKKPH8VN1xVZys8OqwMBZ4CppenrGcPNZ3CnHCDqL+x5Am9uUOdLii6exVNoeEby3PJ/P0zMyh2zDXwiPobbLcOX5nTD4zlIvbthYa4vZcFM5nQQOfQ6DwEXp8QnMooYtQyG7ANBxS2FA+JsnU11dTsjiUWv6JdwtaJsI6brdWimAayELifF7WCyDS6GL0mSwh4A/9Htmm+QoIV5HVAii1DCCJNA+qYbglEeDLiChtgpn1hMlpaqIP5c67rISlvrHDng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3z2xOhWXvmfFZmKdVwcZb8+1Uqsj6TZZPkb2kzhAO5o=;
 b=WZYET+cV6Y5zrLokbfosTL2TO1chJEN4tqDMJRzw1CZLML2ubBmGcC7KgJ370o4MQNNlGuBy+adtPoRpjflih1J+p7c8xvVtYvd3BNw+f37OEGk2OWhs/swvbIfqIwTVmP7gjCnA+Cmc14wFiAS+h8/mmP57EUb9eQs8ThXHVFwiFzLhU3DCiD8g8qX3jFF8o9qxlFs2F/mw1P9rjMQk9P9WSUycdjYBbf1/lE+b4ya6WWtFSLH0pXQ21o4XEwS/+JmW4PisRxH9fnLDCkhLK8y24GHitspt1Zwy7SS3ykigC9Fu6P0nQ/nz2CZCi5zQmn9BbFg2pKnbPRr1OAjG6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1804.namprd12.prod.outlook.com (10.175.91.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Wed, 16 Oct 2019 12:18:15 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::7428:f6b3:a0b1:a02e]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::7428:f6b3:a0b1:a02e%10]) with mapi id 15.20.2347.023; Wed, 16 Oct
 2019 12:18:15 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Gerd Hoffmann <kraxel@redhat.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 06/11] drm/ttm: factor out ttm_bo_mmap_vma_setup
Thread-Topic: [PATCH v4 06/11] drm/ttm: factor out ttm_bo_mmap_vma_setup
Thread-Index: AQHVhBgm8b1N9k1O9kyDrY9pK+JLoqddL1qA
Date: Wed, 16 Oct 2019 12:18:15 +0000
Message-ID: <c08921f8-8ae9-55aa-c472-6b660b96576b@amd.com>
References: <20191016115203.20095-1-kraxel@redhat.com>
 <20191016115203.20095-7-kraxel@redhat.com>
In-Reply-To: <20191016115203.20095-7-kraxel@redhat.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM0PR02CA0069.eurprd02.prod.outlook.com
 (2603:10a6:208:d2::46) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c7ce3351-f65f-4198-cb64-08d75232eb7b
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR12MB1804:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1804A279D2FA57C755A1F96583920@DM5PR12MB1804.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0192E812EC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(396003)(346002)(136003)(366004)(189003)(199004)(478600001)(2616005)(6506007)(66476007)(52116002)(66556008)(386003)(486006)(58126008)(66946007)(110136005)(54906003)(14454004)(65956001)(6246003)(65806001)(25786009)(316002)(5660300002)(476003)(64756008)(2501003)(99286004)(81166006)(76176011)(186003)(8676002)(81156014)(6116002)(4326008)(36756003)(31686004)(2906002)(6486002)(11346002)(6436002)(446003)(46003)(305945005)(256004)(71190400001)(66446008)(8936002)(71200400001)(102836004)(6512007)(7736002)(86362001)(229853002)(31696002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1804;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EvrI819zA/hMne18DGUnm+3eOpc6mAj4G23vEbf9TvDLS+1qqZDx9idK7WfET6N4mg98QFtM0KgyAc9eZAn5yYgZcxxeHi6xvO/YSt8qbCtBTDgiUNFRUFxBC5sabW+PS2r3P2MavJUnXo5HK6/2vR/5feCy+eZZnjwrZ/NT1QPbr083pCf/FBrOCe9huQ3tBhoFv3dW68TLAvcJThce5RjPhd4gQBlmBgpRT5p4YujzvoNwq/Ozu7Ar/Pe0N+7vAG+RtgNDIwYIxmPg0lbBMuS8t8/zPJKsddGwJyoev6akI5LDFP3+tb5eLidclZTaI92v2s0i6VT6ymsMn/snvjV8rOCXvGd5gOGKxJeO47189cg6hX/Euo3ffCDEJVj66BUPNzo1EhOzrzKie9oPO0kny4wWYka1S9z8LJO+Gxo=
Content-ID: <247E3E5866AFC648A293BEFFE195484F@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7ce3351-f65f-4198-cb64-08d75232eb7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2019 12:18:15.1124 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YYA+o5EdSIkf7/xlF5vhBDe4skwuLzCjjhvgy3tDMSiE8Q8TcLSGt3YwVOOfKk2K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1804
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3z2xOhWXvmfFZmKdVwcZb8+1Uqsj6TZZPkb2kzhAO5o=;
 b=AZLLC5CxcV3En6d9nizYhNjFI65Aje2iqVLkCfCXCFVBOVH3xMWwqaYg8FxGfpDf0RuhLTB3FBZZcfNdGcrX54IcwLHnNozEo/XiOVMNocfIGnpeZD87kRb8z5F62Apa534W/IFkZpTxlaFg0I3mvOAZO9ZkKs3BOVfWqLpPYac=
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>, "Huang, Ray" <Ray.Huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTYuMTAuMTkgdW0gMTM6NTEgc2NocmllYiBHZXJkIEhvZmZtYW5uOg0KPiBGYWN0b3Igb3V0
IHR0bSB2bWEgc2V0dXAgdG8gYSBuZXcgZnVuY3Rpb24uDQo+IFJlZHVjZXMgY29kZSBkdXBsaWNh
dGlvbiBhIGJpdC4NCj4NCj4gdjI6IGRvbid0IGNoYW5nZSB2bV9mbGFncyAobW92ZWQgdG8gc2Vw
YXJhdGUgcGF0Y2gpLg0KPiB2NDogbWFrZSB0dG1fYm9fbW1hcF92bWFfc2V0dXAgc3RhdGljLg0K
Pg0KPiBTaWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4NCg0K
UmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4g
Zm9yIHRoaXMgb25lIGFuZCANCiM3IGluIHRoZSBzZXJpZXMuDQoNCj4gLS0tDQo+ICAgZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYyB8IDQ2ICsrKysrKysrKysrKysrKysrLS0tLS0tLS0t
LS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAyMiBkZWxldGlv
bnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jDQo+IGluZGV4IDRhYTAwN2VkZmZiMC4u
NTMzNDVjMDg1NGQ1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192
bS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMNCj4gQEAgLTQyNiw2
ICs0MjYsMjggQEAgc3RhdGljIHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqdHRtX2JvX3ZtX2xv
b2t1cChzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwNCj4gICAJcmV0dXJuIGJvOw0KPiAgIH0N
Cj4gICANCj4gK3N0YXRpYyB2b2lkIHR0bV9ib19tbWFwX3ZtYV9zZXR1cChzdHJ1Y3QgdHRtX2J1
ZmZlcl9vYmplY3QgKmJvLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkNCj4gK3sNCj4gKwl2
bWEtPnZtX29wcyA9ICZ0dG1fYm9fdm1fb3BzOw0KPiArDQo+ICsJLyoNCj4gKwkgKiBOb3RlOiBX
ZSdyZSB0cmFuc2ZlcnJpbmcgdGhlIGJvIHJlZmVyZW5jZSB0bw0KPiArCSAqIHZtYS0+dm1fcHJp
dmF0ZV9kYXRhIGhlcmUuDQo+ICsJICovDQo+ICsNCj4gKwl2bWEtPnZtX3ByaXZhdGVfZGF0YSA9
IGJvOw0KPiArDQo+ICsJLyoNCj4gKwkgKiBXZSdkIGxpa2UgdG8gdXNlIFZNX1BGTk1BUCBvbiBz
aGFyZWQgbWFwcGluZ3MsIHdoZXJlDQo+ICsJICogKHZtYS0+dm1fZmxhZ3MgJiBWTV9TSEFSRUQp
ICE9IDAsIGZvciBwZXJmb3JtYW5jZSByZWFzb25zLA0KPiArCSAqIGJ1dCBmb3Igc29tZSByZWFz
b24gVk1fUEZOTUFQICsgeDg2IFBBVCArIHdyaXRlLWNvbWJpbmUgaXMgdmVyeQ0KPiArCSAqIGJh
ZCBmb3IgcGVyZm9ybWFuY2UuIFVudGlsIHRoYXQgaGFzIGJlZW4gc29ydGVkIG91dCwgdXNlDQo+
ICsJICogVk1fTUlYRURNQVAgb24gYWxsIG1hcHBpbmdzLiBTZWUgZnJlZWRlc2t0b3Aub3JnIGJ1
ZyAjNzU3MTkNCj4gKwkgKi8NCj4gKwl2bWEtPnZtX2ZsYWdzIHw9IFZNX01JWEVETUFQOw0KPiAr
CXZtYS0+dm1fZmxhZ3MgfD0gVk1fSU8gfCBWTV9ET05URVhQQU5EIHwgVk1fRE9OVERVTVA7DQo+
ICt9DQo+ICsNCj4gICBpbnQgdHRtX2JvX21tYXAoc3RydWN0IGZpbGUgKmZpbHAsIHN0cnVjdCB2
bV9hcmVhX3N0cnVjdCAqdm1hLA0KPiAgIAkJc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYpDQo+
ICAgew0KPiBAQCAtNDQ5LDI0ICs0NzEsNyBAQCBpbnQgdHRtX2JvX21tYXAoc3RydWN0IGZpbGUg
KmZpbHAsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLA0KPiAgIAlpZiAodW5saWtlbHkocmV0
ICE9IDApKQ0KPiAgIAkJZ290byBvdXRfdW5yZWY7DQo+ICAgDQo+IC0Jdm1hLT52bV9vcHMgPSAm
dHRtX2JvX3ZtX29wczsNCj4gLQ0KPiAtCS8qDQo+IC0JICogTm90ZTogV2UncmUgdHJhbnNmZXJy
aW5nIHRoZSBibyByZWZlcmVuY2UgdG8NCj4gLQkgKiB2bWEtPnZtX3ByaXZhdGVfZGF0YSBoZXJl
Lg0KPiAtCSAqLw0KPiAtDQo+IC0Jdm1hLT52bV9wcml2YXRlX2RhdGEgPSBibzsNCj4gLQ0KPiAt
CS8qDQo+IC0JICogV2UnZCBsaWtlIHRvIHVzZSBWTV9QRk5NQVAgb24gc2hhcmVkIG1hcHBpbmdz
LCB3aGVyZQ0KPiAtCSAqICh2bWEtPnZtX2ZsYWdzICYgVk1fU0hBUkVEKSAhPSAwLCBmb3IgcGVy
Zm9ybWFuY2UgcmVhc29ucywNCj4gLQkgKiBidXQgZm9yIHNvbWUgcmVhc29uIFZNX1BGTk1BUCAr
IHg4NiBQQVQgKyB3cml0ZS1jb21iaW5lIGlzIHZlcnkNCj4gLQkgKiBiYWQgZm9yIHBlcmZvcm1h
bmNlLiBVbnRpbCB0aGF0IGhhcyBiZWVuIHNvcnRlZCBvdXQsIHVzZQ0KPiAtCSAqIFZNX01JWEVE
TUFQIG9uIGFsbCBtYXBwaW5ncy4gU2VlIGZyZWVkZXNrdG9wLm9yZyBidWcgIzc1NzE5DQo+IC0J
ICovDQo+IC0Jdm1hLT52bV9mbGFncyB8PSBWTV9NSVhFRE1BUDsNCj4gLQl2bWEtPnZtX2ZsYWdz
IHw9IFZNX0lPIHwgVk1fRE9OVEVYUEFORCB8IFZNX0RPTlREVU1QOw0KPiArCXR0bV9ib19tbWFw
X3ZtYV9zZXR1cChibywgdm1hKTsNCj4gICAJcmV0dXJuIDA7DQo+ICAgb3V0X3VucmVmOg0KPiAg
IAl0dG1fYm9fcHV0KGJvKTsNCj4gQEAgLTQ4MSwxMCArNDg2LDcgQEAgaW50IHR0bV9mYmRldl9t
bWFwKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCBzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3Qg
KmJvKQ0KPiAgIA0KPiAgIAl0dG1fYm9fZ2V0KGJvKTsNCj4gICANCj4gLQl2bWEtPnZtX29wcyA9
ICZ0dG1fYm9fdm1fb3BzOw0KPiAtCXZtYS0+dm1fcHJpdmF0ZV9kYXRhID0gYm87DQo+IC0Jdm1h
LT52bV9mbGFncyB8PSBWTV9NSVhFRE1BUDsNCj4gLQl2bWEtPnZtX2ZsYWdzIHw9IFZNX0lPIHwg
Vk1fRE9OVEVYUEFORDsNCj4gKwl0dG1fYm9fbW1hcF92bWFfc2V0dXAoYm8sIHZtYSk7DQo+ICAg
CXJldHVybiAwOw0KPiAgIH0NCj4gICBFWFBPUlRfU1lNQk9MKHR0bV9mYmRldl9tbWFwKTsNCg0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
