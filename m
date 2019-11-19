Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 420E4101E75
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:48:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 564006E34B;
	Tue, 19 Nov 2019 08:48:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700062.outbound.protection.outlook.com [40.107.70.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FB1E6E28E;
 Tue, 19 Nov 2019 08:48:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZKJGeZS76/kXZ3UCIvqbnBcjMOa1erMLAafwP66DrUSCB2w7/66VAIO5e+LkxndBqf5cP3CWLH1q/omKgls+3Bkc4m4WcMr5lPPa3vuVF48ddVeqBX3s0w03tfQFu1dbgNmyTBOu9aWekS0jPR6AwdDvrhu1ducUORaOtAIEgtcWNytRSVOLlPC8hMADqgGtcG9gMWTRPHPkRuw2NKlpyEyXe5pFT3bKEPEAZW//3q0NRGnnZcD4zA6YnOSzJlpwLW9KiWgtCilGGQQFehe9jwt0HNo0+dQIH9VO5+D9Ji5WROwQv9driKCZTijxSsPBSER8jybM+rZh6F4rTtT2Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=50Bw5AMKd2S1B+3zq+OyS/I+G2yVUf6jyqFGYubvioo=;
 b=hPW7oMunNgqOrsdQKwatzHutB3Gy+xqnKxSU4fkGVGtVJiE6jYAdLHd/PnUGl82s95VhOoBivS9Gm611yaLQeu1Upd1Upzc3cO+bjlUNBZEvYwsSpNHqfK73pRc1dMqolOXgvcmdxEy2aM+Cg6TUXMABAqhh5G+2rFbB9qDbdUnWuokOZuxhW00XnlcgbTDtI1wpS3JAa9oBAIWlIrvN8XaOa4KTQ2mjKF7ImMNrRz9043fVCDXhn5RPEWwJQvmcabZyjKh1UcshxpLqSIdBS2A8sIT715qw7xxNyqKApFR0K4Cnv5D4vqypwsbjhdARgRT/vPIvPLYyDmocRAU5QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB2975.namprd12.prod.outlook.com (20.178.243.142) by
 MN2PR12MB4302.namprd12.prod.outlook.com (52.135.51.71) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23; Tue, 19 Nov 2019 08:48:30 +0000
Received: from MN2PR12MB2975.namprd12.prod.outlook.com
 ([fe80::49e3:7f2c:931c:36e7]) by MN2PR12MB2975.namprd12.prod.outlook.com
 ([fe80::49e3:7f2c:931c:36e7%7]) with mapi id 15.20.2451.029; Tue, 19 Nov 2019
 08:48:30 +0000
From: "Deng, Emily" <Emily.Deng@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
Subject: RE: [PATCH v2] drm/scheduler: Avoid accessing freed bad job.
Thread-Topic: [PATCH v2] drm/scheduler: Avoid accessing freed bad job.
Thread-Index: AQHVnjj53AqgXYTnIEiXWUX0Bq+zFKeSL5sA
Date: Tue, 19 Nov 2019 08:48:30 +0000
Message-ID: <MN2PR12MB2975CDA40AAB3F24E518A5228F4C0@MN2PR12MB2975.namprd12.prod.outlook.com>
References: <1574099545-20430-1-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1574099545-20430-1-git-send-email-andrey.grodzovsky@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5c1217d5-9fce-40b5-f4a3-08d76ccd40d5
x-ms-traffictypediagnostic: MN2PR12MB4302:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4302A5D58422B2BC9644F2738F4C0@MN2PR12MB4302.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1186;
x-forefront-prvs: 022649CC2C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(39860400002)(376002)(396003)(346002)(199004)(189003)(13464003)(7696005)(6436002)(450100002)(54906003)(7736002)(6636002)(11346002)(305945005)(74316002)(66476007)(486006)(76116006)(446003)(316002)(14454004)(52536014)(99286004)(5660300002)(186003)(26005)(25786009)(14444005)(6246003)(256004)(102836004)(6506007)(6862004)(478600001)(64756008)(66946007)(66446008)(4326008)(476003)(66556008)(9686003)(76176011)(55016002)(6116002)(8676002)(8936002)(81166006)(86362001)(81156014)(71200400001)(2906002)(3846002)(66066001)(71190400001)(229853002)(33656002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4302;
 H:MN2PR12MB2975.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TBXmwT8ptICGVXvvFJFuzrl58nOBIVvz1DX/Agec8qVRW1xVozfg001SmRF4y9bFrY4KfO8erWxKpY/fTS0Ob49tM5EfkZgzfCTrYR+a9ltFQnixpvXM04RlDOvmYw7+gXSHNllzI/GHjepmZ9hl41CYqeoUxdJ1uSdDGeXbrWVlOzOyXsrEX48EXLBGyYqC1mEuFDTs6KhEbFfAR8GYoV488Jr3VAUIm6sOytGB80p1AR6NRQnJ+CPVIo0MmSLad6WIEvk0x2cQq8pvNCQ9zDOCJzP78YXoivWIvwoO2vb1jT+hwAXKiayyMC/v7U1wKuql4+Oyh8bb7v+WJMJBeUfiZDqFibbJ4djdHeBlnvFeEMxmkmItvTZ4Y6tPboml+Up8f9w38SWhFD4TH5LDLLvrVgg25J72bUsH6BQGC4ZnRjH5YOnq6gcBLaVo2i9k
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c1217d5-9fce-40b5-f4a3-08d76ccd40d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2019 08:48:30.7344 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H7fkz2rcy3I84aPC2ZSrrdLMVXAt8ng4flvyJxt+HwtMyP6I07xix6fzvnWYdYB8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4302
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=50Bw5AMKd2S1B+3zq+OyS/I+G2yVUf6jyqFGYubvioo=;
 b=mo85nlW23NoH7sOjOso7fSsCPXHQCRy7uhfwgH9Fg3TnjjgzXDuKV95EUrKQrnI5B6WrDrONlDUhIqhl7sLQYyWL8Gbi1jGuC1aogPEEux3m5MK6Nfafk5sN/+j2DXj5f4NMABprMVsbf+ZFkQMeALM2WKhyYWYnWcG/TB8YWlQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Emily.Deng@amd.com; 
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Koenig, 
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGVzdGVkLWJ5OiBFbWlseSBEZW5nIDxFbWlseS5EZW5nQGFtZC5jb20+Cgo+LS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0KPkZyb206IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNr
eUBhbWQuY29tPgo+U2VudDogVHVlc2RheSwgTm92ZW1iZXIgMTksIDIwMTkgMTo1MiBBTQo+Q2M6
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnOyBLb2VuaWcsCj5DaHJpc3RpYW4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT47IERl
bmcsIEVtaWx5Cj48RW1pbHkuRGVuZ0BhbWQuY29tPjsgR3JvZHpvdnNreSwgQW5kcmV5Cj48QW5k
cmV5Lkdyb2R6b3Zza3lAYW1kLmNvbT4KPlN1YmplY3Q6IFtQQVRDSCB2Ml0gZHJtL3NjaGVkdWxl
cjogQXZvaWQgYWNjZXNzaW5nIGZyZWVkIGJhZCBqb2IuCj4KPlByb2JsZW06Cj5EdWUgdG8gYSBy
YWNlIGJldHdlZW4gZHJtX3NjaGVkX2NsZWFudXBfam9icyBpbiBzY2hlZCB0aHJlYWQgYW5kCj5k
cm1fc2NoZWRfam9iX3RpbWVkb3V0IGluIHRpbWVvdXQgd29yayB0aGVyZSBpcyBhIHBvc3NpYmxp
dHkgdGhhdCBiYWQgam9iCj53YXMgYWxyZWFkeSBmcmVlZCB3aGlsZSBzdGlsbCBiZWluZyBhY2Nl
c3NlZCBmcm9tIHRoZSB0aW1lb3V0IHRocmVhZC4KPgo+Rml4Ogo+SW5zdGVhZCBvZiBqdXN0IHBl
ZWtpbmcgYXQgdGhlIGJhZCBqb2IgaW4gdGhlIG1pcnJvciBsaXN0IHJlbW92ZSBpdCBmcm9tIHRo
ZSBsaXN0Cj51bmRlciBsb2NrIGFuZCB0aGVuIHB1dCBpdCBiYWNrIGxhdGVyIHdoZW4gd2UgYXJl
IGdhcmFudGVlZCBubyByYWNlIHdpdGgKPm1haW4gc2NoZWQgdGhyZWFkIGlzIHBvc3NpYmxlIHdo
aWNoIGlzIGFmdGVyIHRoZSB0aHJlYWQgaXMgcGFya2VkLgo+Cj52MjogTG9jayBhcm91bmQgcHJv
Y2Vzc2luZyByaW5nX21pcnJvcl9saXN0IGluIGRybV9zY2hlZF9jbGVhbnVwX2pvYnMuCj4KPlNp
Z25lZC1vZmYtYnk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29t
Pgo+LS0tCj4gZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMgfCA0NAo+Kysr
KysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLQo+IDEgZmlsZSBjaGFuZ2VkLCAzOCBpbnNl
cnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+Cj5kaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3NjaGVkdWxlci9zY2hlZF9tYWluLmMKPmIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hl
ZF9tYWluLmMKPmluZGV4IDgwZGRiZGYuLmIwNWIyMTAgMTAwNjQ0Cj4tLS0gYS9kcml2ZXJzL2dw
dS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYwo+KysrIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVk
dWxlci9zY2hlZF9tYWluLmMKPkBAIC0yODcsMTAgKzI4NywyNCBAQCBzdGF0aWMgdm9pZCBkcm1f
c2NoZWRfam9iX3RpbWVkb3V0KHN0cnVjdAo+d29ya19zdHJ1Y3QgKndvcmspCj4gCXVuc2lnbmVk
IGxvbmcgZmxhZ3M7Cj4KPiAJc2NoZWQgPSBjb250YWluZXJfb2Yod29yaywgc3RydWN0IGRybV9n
cHVfc2NoZWR1bGVyLAo+d29ya190ZHIud29yayk7Cj4rCj4rCS8qCj4rCSAqIFByb3RlY3RzIGFn
YWluc3QgY29uY3VycmVudCBkZWxldGlvbiBpbiBkcm1fc2NoZWRfY2xlYW51cF9qb2JzCj50aGF0
Cj4rCSAqIGlzIGFscmVhZHkgaW4gcHJvZ3Jlc3MuCj4rCSAqLwo+KwlzcGluX2xvY2tfaXJxc2F2
ZSgmc2NoZWQtPmpvYl9saXN0X2xvY2ssIGZsYWdzKTsKPiAJam9iID0gbGlzdF9maXJzdF9lbnRy
eV9vcl9udWxsKCZzY2hlZC0+cmluZ19taXJyb3JfbGlzdCwKPiAJCQkJICAgICAgIHN0cnVjdCBk
cm1fc2NoZWRfam9iLCBub2RlKTsKPgo+IAlpZiAoam9iKSB7Cj4rCQkvKgo+KwkJICogUmVtb3Zl
IHRoZSBiYWQgam9iIHNvIGl0IGNhbm5vdCBiZSBmcmVlZCBieSBhbHJlYWR5IGluCj5wcm9ncmVz
cwo+KwkJICogZHJtX3NjaGVkX2NsZWFudXBfam9icy4gSXQgd2lsbCBiZSByZWluc3J0ZWQgYmFj
ayBhZnRlcgo+c2NoZWQtPnRocmVhZAo+KwkJICogaXMgcGFya2VkIGF0IHdoaWNoIHBvaW50IGl0
J3Mgc2FmZS4KPisJCSAqLwo+KwkJbGlzdF9kZWxfaW5pdCgmam9iLT5ub2RlKTsKPisJCXNwaW5f
dW5sb2NrX2lycXJlc3RvcmUoJnNjaGVkLT5qb2JfbGlzdF9sb2NrLCBmbGFncyk7Cj4rCj4gCQlq
b2ItPnNjaGVkLT5vcHMtPnRpbWVkb3V0X2pvYihqb2IpOwo+Cj4gCQkvKgo+QEAgLTMwMiw2ICsz
MTYsOCBAQCBzdGF0aWMgdm9pZCBkcm1fc2NoZWRfam9iX3RpbWVkb3V0KHN0cnVjdAo+d29ya19z
dHJ1Y3QgKndvcmspCj4gCQkJc2NoZWQtPmZyZWVfZ3VpbHR5ID0gZmFsc2U7Cj4gCQl9Cj4gCX0K
PisJZWxzZQo+KwkJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmc2NoZWQtPmpvYl9saXN0X2xvY2ss
IGZsYWdzKTsKPgo+IAlzcGluX2xvY2tfaXJxc2F2ZSgmc2NoZWQtPmpvYl9saXN0X2xvY2ssIGZs
YWdzKTsKPiAJZHJtX3NjaGVkX3N0YXJ0X3RpbWVvdXQoc2NoZWQpOwo+QEAgLTM3Myw2ICszODks
MTkgQEAgdm9pZCBkcm1fc2NoZWRfc3RvcChzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVsZXIKPipzY2hl
ZCwgc3RydWN0IGRybV9zY2hlZF9qb2IgKmJhZCkKPiAJa3RocmVhZF9wYXJrKHNjaGVkLT50aHJl
YWQpOwo+Cj4gCS8qCj4rCSAqIFJlaW5zZXJ0IGJhY2sgdGhlIGJhZCBqb2IgaGVyZSAtIG5vdyBp
dCdzIHNhZmUgYXMKPmRybV9zY2hlZF9jbGVhbnVwX2pvYnMKPisJICogY2Fubm90IHJhY2UgYWdh
aW5zdCB1cyBhbmQgcmVsZWFzZSB0aGUgYmFkIGpvYiBhdCB0aGlzIHBvaW50IC0gd2UKPnBhcmtl
ZAo+KwkgKiAod2FpdGVkIGZvcikgYW55IGluIHByb2dyZXNzIChlYXJsaWVyKSBjbGVhbnVwcyBh
bmQgYW55IGxhdGVyIG9uZXMgd2lsbAo+KwkgKiBiYWlsIG91dCBkdWUgdG8gc2NoZWQtPnRocmVh
ZCBiZWluZyBwYXJrZWQuCj4rCSAqLwo+KwlpZiAoYmFkICYmIGJhZC0+c2NoZWQgPT0gc2NoZWQp
Cj4rCQkvKgo+KwkJICogQWRkIGF0IHRoZSBoZWFkIG9mIHRoZSBxdWV1ZSB0byByZWZsZWN0IGl0
IHdhcyB0aGUgZWFybGllc3QKPisJCSAqIGpvYiBleHRyYWN0ZWQuCj4rCQkgKi8KPisJCWxpc3Rf
YWRkKCZiYWQtPm5vZGUsICZzY2hlZC0+cmluZ19taXJyb3JfbGlzdCk7Cj4rCj4rCS8qCj4gCSAq
IEl0ZXJhdGUgdGhlIGpvYiBsaXN0IGZyb20gbGF0ZXIgdG8gIGVhcmxpZXIgb25lIGFuZCBlaXRo
ZXIgZGVhY3RpdmUKPiAJICogdGhlaXIgSFcgY2FsbGJhY2tzIG9yIHJlbW92ZSB0aGVtIGZyb20g
bWlycm9yIGxpc3QgaWYgdGhleSBhbHJlYWR5Cj4gCSAqIHNpZ25hbGVkLgo+QEAgLTY1NiwxNiAr
Njg1LDE5IEBAIHN0YXRpYyB2b2lkIGRybV9zY2hlZF9jbGVhbnVwX2pvYnMoc3RydWN0Cj5kcm1f
Z3B1X3NjaGVkdWxlciAqc2NoZWQpCj4gCSAgICBfX2t0aHJlYWRfc2hvdWxkX3Bhcmsoc2NoZWQt
PnRocmVhZCkpCj4gCQlyZXR1cm47Cj4KPi0KPi0Jd2hpbGUgKCFsaXN0X2VtcHR5KCZzY2hlZC0+
cmluZ19taXJyb3JfbGlzdCkpIHsKPisJLyogU2VlIGRybV9zY2hlZF9qb2JfdGltZWRvdXQgZm9y
IHdoeSB0aGUgbG9ja2luZyBpcyBoZXJlICovCj4rCXdoaWxlICh0cnVlKSB7Cj4gCQlzdHJ1Y3Qg
ZHJtX3NjaGVkX2pvYiAqam9iOwo+Cj4tCQlqb2IgPSBsaXN0X2ZpcnN0X2VudHJ5KCZzY2hlZC0+
cmluZ19taXJyb3JfbGlzdCwKPi0JCQkJICAgICAgIHN0cnVjdCBkcm1fc2NoZWRfam9iLCBub2Rl
KTsKPi0JCWlmICghZG1hX2ZlbmNlX2lzX3NpZ25hbGVkKCZqb2ItPnNfZmVuY2UtPmZpbmlzaGVk
KSkKPisJCXNwaW5fbG9ja19pcnFzYXZlKCZzY2hlZC0+am9iX2xpc3RfbG9jaywgZmxhZ3MpOwo+
KwkJam9iID0gbGlzdF9maXJzdF9lbnRyeV9vcl9udWxsKCZzY2hlZC0+cmluZ19taXJyb3JfbGlz
dCwKPisJCQkJCSAgICAgICBzdHJ1Y3QgZHJtX3NjaGVkX2pvYiwgbm9kZSk7Cj4rCj4rCQlpZiAo
IWpvYiB8fCAhZG1hX2ZlbmNlX2lzX3NpZ25hbGVkKCZqb2ItPnNfZmVuY2UtPmZpbmlzaGVkKSkg
ewo+KwkJCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnNjaGVkLT5qb2JfbGlzdF9sb2NrLCBmbGFn
cyk7Cj4gCQkJYnJlYWs7Cj4rCQl9Cj4KPi0JCXNwaW5fbG9ja19pcnFzYXZlKCZzY2hlZC0+am9i
X2xpc3RfbG9jaywgZmxhZ3MpOwo+IAkJLyogcmVtb3ZlIGpvYiBmcm9tIHJpbmdfbWlycm9yX2xp
c3QgKi8KPiAJCWxpc3RfZGVsX2luaXQoJmpvYi0+bm9kZSk7Cj4gCQlzcGluX3VubG9ja19pcnFy
ZXN0b3JlKCZzY2hlZC0+am9iX2xpc3RfbG9jaywgZmxhZ3MpOwo+LS0KPjIuNy40CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
