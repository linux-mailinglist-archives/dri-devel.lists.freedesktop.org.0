Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3714E109738
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 01:09:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29EC389D44;
	Tue, 26 Nov 2019 00:09:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770073.outbound.protection.outlook.com [40.107.77.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED4F89D44;
 Tue, 26 Nov 2019 00:09:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LTlbjcysRamA5L4HCVDnhymrsvuT7pgKXVoS0q/2ywOIruO581OpsEh8VrLt/8wnfkYiy450cfIcLYe9y1gdUs9ia2fp45/pjMAMp8yYypui3XTR5lsCBNVAtJO3gh8sAvqX6rqHGbu+afe/ru8R8v+GjQeycZhrZ3K0qvo+6ZNI/qb7zD19g038srPy+srdLyBx1/PXb8yKA3lmRYnXwmAqW2SpxP85u5b123IwBD2iLtTbD1LSSiC0kpDk7TkaBANOGwe/PJUGlLl21uCPJ15+FZzYTBk/o+HY58DumTqzmQzfomTjjU9jI7QoRS7ktArUSd4ozE0KSSv2ZFVarQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lT/4zlTev11u8Bf2Km3oAtiutKxra1R1id8bCWeCAMg=;
 b=aYvlXEZxiJRMPH7FCVKbBN3+ANwLMdOtlLBM7GyIvRra0ISMkTKNMya8+9Ue4W+zk5bKijLp+TuATSqhejpDpMjiAG6+SLboqlCSu8356teurfs5V/Yn0jrfDxoS2F+xosMv06WoAD/9muiWITsE0Tl5Ld1oeE85mFwMvm+Dj/+scu9jWUtAtmXB0+BC2VBClESU3rh5cvFq1m8bBFQhfZelId1RNDSaqHm/sGzCtqXlf391s/P34DrDslf0WytA/b6X2bw4UyeQ4SuomgMaeLcP6qq/uTmH9uY5c+jEyE/lz24T9dnWfRrMYG2I++ZgQD7HEIKNIm95HJ3H92jOqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1678.namprd12.prod.outlook.com (10.172.53.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.19; Tue, 26 Nov 2019 00:09:31 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::514b:dbf8:d19f:a80]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::514b:dbf8:d19f:a80%12]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 00:09:31 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: "Deng, Emily" <Emily.Deng@amd.com>
Subject: Re: [PATCH v4] drm/scheduler: Avoid accessing freed bad job.
Thread-Topic: [PATCH v4] drm/scheduler: Avoid accessing freed bad job.
Thread-Index: AQHVo9IiMDsD4YzY4ECdHMyeKHRLgqeca2sAgAAnI04=
Date: Tue, 26 Nov 2019 00:09:30 +0000
Message-ID: <MWHPR12MB1453C6FC45A83482232CA3EDEA450@MWHPR12MB1453.namprd12.prod.outlook.com>
References: <1574715089-14875-1-git-send-email-andrey.grodzovsky@amd.com>,
 <MN2PR12MB2975C10E36FF996BD423CEBA8F4A0@MN2PR12MB2975.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB2975C10E36FF996BD423CEBA8F4A0@MN2PR12MB2975.namprd12.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [208.98.222.117]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 59ca2ea4-ebc0-4917-7916-08d77204e903
x-ms-traffictypediagnostic: MWHPR12MB1678:|MWHPR12MB1678:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB1678199FAABBAB537A55DB5CEA450@MWHPR12MB1678.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0233768B38
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(39860400002)(396003)(136003)(376002)(13464003)(199004)(189003)(76176011)(2906002)(6436002)(8936002)(66476007)(71200400001)(25786009)(66946007)(52536014)(64756008)(76116006)(229853002)(55016002)(8676002)(9686003)(71190400001)(6862004)(4326008)(66556008)(6116002)(3846002)(66066001)(102836004)(53546011)(6506007)(6246003)(7696005)(26005)(66574012)(11346002)(5660300002)(54906003)(81156014)(33656002)(256004)(14444005)(81166006)(6636002)(74316002)(305945005)(14454004)(478600001)(86362001)(99286004)(446003)(66446008)(186003)(316002)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1678;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VQm1DZIOFeL32Mv5r0CQGhdkG+i7930c0jXIhEcKs/pwQLSkeuhJCWm5SFZHwfzo5IgoCj31PxERWDIpCqkt4OtPZi2NzXG0DHMwembrGiw6eYrhk69ZZxJEC0USbELDjqZB0958iikpnOUH4aYwO6H9+2lqvCusBUIxG8qcBMAkVS3psmqSEX+MSpwCL8595p7ghoMhqdU+EfQoG2sl3xhqIYOEethH7e3jzEyIEzehdNrl3KmxsrMO36z3YW8i+5DKoq6KYozCUqIVXBt0ki+mfItFqqJVQJsgryaLqZte51tP4SbUCGh2tRVbsV5IF26u4JYvc/J5aQQWyOVOsivGdHwwivd3Rmj1Mdj1LcbMUfk6mHp8Vtp6gNHUwTiZM2OMEdh+T+x5QndPbXyJab5EAYFat2moK5UEaU5vmONzycC0wfrq/jjtCjtJ1X+u
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59ca2ea4-ebc0-4917-7916-08d77204e903
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2019 00:09:30.9669 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gEZQr9G92nd1yQovO7z4DHgGwu9TOltYwNnTqDVvHQQQKzFfzWG0ATEnRC+hPfEPq7WeULNLVqNy5h2qWvUv9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1678
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lT/4zlTev11u8Bf2Km3oAtiutKxra1R1id8bCWeCAMg=;
 b=oPfM4JmopFWxaH4IDr7tZWnTw9k7iD881Xc9h5955l7YHNUfDPoDzZl72uhRoEBXUGB7wbv3sipAFSkB4kSZbk9xHn52c0x/t+9V3uBnrFEe/Ae3mzg900GZwihJb7edawh7fmSz80YEtaK9pS+r17UGwqVZqDnqKk2968DtGl4=
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
 "steven.price@arm.com" <steven.price@arm.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Koenig, 
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q2hyaXN0aWFuIGFza2VkIHRvIHN1Ym1pdCBpdCB0byBkcm0tbWlzYyBpbnN0ZWFkIG9mIG91ciBk
cm0tbmV4dCB0byBhdm9pZCBsYXRlciBjb25mbGljdHMgd2l0aCBTdGV2ZW4ncyBwYXRjaCB3aGlj
aCBoZSBtZW50aW9uZWQgaW4gdGhpcyB0aHJlYWQgd2hpY2ggaXMgbm90IGluIGRybS1uZXh0IHll
dC4KQ2hyaXN0aWFuLCBBbGV4LCBvbmNlIHRoaXMgbWVyZ2VkIHRvIGRybS1taXNjIEkgZ3Vlc3Mg
d2UgbmVlZCB0byBwdWxsIGFsbCBsYXRlc3QgY2hhbmdlcyBmcm9tIHRoZXJlIHRvIGRybS1uZXh0
IHNvIHRoZSBpc3N1ZSBFbWlseSByZXBvcnRlZCBjYW4gYmUgYXZvaWRlZC4KCkFuZHJleQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcm9tOiBEZW5nLCBFbWlseSA8
RW1pbHkuRGVuZ0BhbWQuY29tPgpTZW50OiAyNSBOb3ZlbWJlciAyMDE5IDE2OjQ0OjM2ClRvOiBH
cm9kem92c2t5LCBBbmRyZXkKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBLb2VuaWcsIENocmlzdGlhbjsgc3RldmVuLnBy
aWNlQGFybS5jb207IEdyb2R6b3Zza3ksIEFuZHJleQpTdWJqZWN0OiBSRTogW1BBVENIIHY0XSBk
cm0vc2NoZWR1bGVyOiBBdm9pZCBhY2Nlc3NpbmcgZnJlZWQgYmFkIGpvYi4KCltBTUQgT2ZmaWNp
YWwgVXNlIE9ubHkgLSBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0KCkhpIEFuZHJleSwKICAg
IFNlZW1zIHlvdSBkaWRuJ3Qgc3VibWl0IHRoaXMgcGF0Y2g/CgpCZXN0IHdpc2hlcwpFbWlseSBE
ZW5nCgoKCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+RnJvbTogQW5kcmV5IEdyb2R6b3Zz
a3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+Cj5TZW50OiBNb25kYXksIE5vdmVtYmVyIDI1
LCAyMDE5IDEyOjUxIFBNCj5DYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IEtvZW5pZywKPkNocmlzdGlhbiA8Q2hyaXN0aWFu
LktvZW5pZ0BhbWQuY29tPjsgRGVuZywgRW1pbHkKPjxFbWlseS5EZW5nQGFtZC5jb20+OyBzdGV2
ZW4ucHJpY2VAYXJtLmNvbTsgR3JvZHpvdnNreSwgQW5kcmV5Cj48QW5kcmV5Lkdyb2R6b3Zza3lA
YW1kLmNvbT4KPlN1YmplY3Q6IFtQQVRDSCB2NF0gZHJtL3NjaGVkdWxlcjogQXZvaWQgYWNjZXNz
aW5nIGZyZWVkIGJhZCBqb2IuCj4KPlByb2JsZW06Cj5EdWUgdG8gYSByYWNlIGJldHdlZW4gZHJt
X3NjaGVkX2NsZWFudXBfam9icyBpbiBzY2hlZCB0aHJlYWQgYW5kCj5kcm1fc2NoZWRfam9iX3Rp
bWVkb3V0IGluIHRpbWVvdXQgd29yayB0aGVyZSBpcyBhIHBvc3NpYmxpdHkgdGhhdCBiYWQgam9i
Cj53YXMgYWxyZWFkeSBmcmVlZCB3aGlsZSBzdGlsbCBiZWluZyBhY2Nlc3NlZCBmcm9tIHRoZSB0
aW1lb3V0IHRocmVhZC4KPgo+Rml4Ogo+SW5zdGVhZCBvZiBqdXN0IHBlZWtpbmcgYXQgdGhlIGJh
ZCBqb2IgaW4gdGhlIG1pcnJvciBsaXN0IHJlbW92ZSBpdCBmcm9tIHRoZSBsaXN0Cj51bmRlciBs
b2NrIGFuZCB0aGVuIHB1dCBpdCBiYWNrIGxhdGVyIHdoZW4gd2UgYXJlIGdhcmFudGVlZCBubyBy
YWNlIHdpdGgKPm1haW4gc2NoZWQgdGhyZWFkIGlzIHBvc3NpYmxlIHdoaWNoIGlzIGFmdGVyIHRo
ZSB0aHJlYWQgaXMgcGFya2VkLgo+Cj52MjogTG9jayBhcm91bmQgcHJvY2Vzc2luZyByaW5nX21p
cnJvcl9saXN0IGluIGRybV9zY2hlZF9jbGVhbnVwX2pvYnMuCj4KPnYzOiBSZWJhc2Ugb24gdG9w
IG9mIGRybS1taXNjLW5leHQuIHYyIGlzIG5vdCBuZWVkZWQgYW55bW9yZSBhcwo+ZHJtX3NjaGVk
X2dldF9jbGVhbnVwX2pvYiBhbHJlYWR5IGhhcyBhIGxvY2sgdGhlcmUuCj4KPnY0OiBGaXggY29t
bWVudHMgdG8gcmVsZmVjdCBsYXRlc3QgY29kZSBpbiBkcm0tbWlzYy4KPgo+U2lnbmVkLW9mZi1i
eTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+Cj5SZXZpZXdl
ZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+VGVzdGVk
LWJ5OiBFbWlseSBEZW5nIDxFbWlseS5EZW5nQGFtZC5jb20+Cj4tLS0KPiBkcml2ZXJzL2dwdS9k
cm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYyB8IDI3Cj4rKysrKysrKysrKysrKysrKysrKysrKysr
KysKPiAxIGZpbGUgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKQo+Cj5kaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMKPmIvZHJpdmVycy9ncHUvZHJtL3Nj
aGVkdWxlci9zY2hlZF9tYWluLmMKPmluZGV4IDY3NzQ5NTUuLjFiZjljNDAgMTAwNjQ0Cj4tLS0g
YS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYwo+KysrIGIvZHJpdmVycy9n
cHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMKPkBAIC0yODQsMTAgKzI4NCwyMSBAQCBzdGF0
aWMgdm9pZCBkcm1fc2NoZWRfam9iX3RpbWVkb3V0KHN0cnVjdAo+d29ya19zdHJ1Y3QgKndvcmsp
Cj4gICAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsKPgo+ICAgICAgIHNjaGVkID0gY29udGFpbmVy
X29mKHdvcmssIHN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciwKPndvcmtfdGRyLndvcmspOwo+Kwo+
KyAgICAgIC8qIFByb3RlY3RzIGFnYWluc3QgY29uY3VycmVudCBkZWxldGlvbiBpbgo+ZHJtX3Nj
aGVkX2dldF9jbGVhbnVwX2pvYiAqLwo+KyAgICAgIHNwaW5fbG9ja19pcnFzYXZlKCZzY2hlZC0+
am9iX2xpc3RfbG9jaywgZmxhZ3MpOwo+ICAgICAgIGpvYiA9IGxpc3RfZmlyc3RfZW50cnlfb3Jf
bnVsbCgmc2NoZWQtPnJpbmdfbWlycm9yX2xpc3QsCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHN0cnVjdCBkcm1fc2NoZWRfam9iLCBub2RlKTsKPgo+ICAgICAgIGlmIChq
b2IpIHsKPisgICAgICAgICAgICAgIC8qCj4rICAgICAgICAgICAgICAgKiBSZW1vdmUgdGhlIGJh
ZCBqb2Igc28gaXQgY2Fubm90IGJlIGZyZWVkIGJ5IGNvbmN1cnJlbnQKPisgICAgICAgICAgICAg
ICAqIGRybV9zY2hlZF9jbGVhbnVwX2pvYnMuIEl0IHdpbGwgYmUgcmVpbnNlcnRlZCBiYWNrIGFm
dGVyCj5zY2hlZC0+dGhyZWFkCj4rICAgICAgICAgICAgICAgKiBpcyBwYXJrZWQgYXQgd2hpY2gg
cG9pbnQgaXQncyBzYWZlLgo+KyAgICAgICAgICAgICAgICovCj4rICAgICAgICAgICAgICBsaXN0
X2RlbF9pbml0KCZqb2ItPm5vZGUpOwo+KyAgICAgICAgICAgICAgc3Bpbl91bmxvY2tfaXJxcmVz
dG9yZSgmc2NoZWQtPmpvYl9saXN0X2xvY2ssIGZsYWdzKTsKPisKPiAgICAgICAgICAgICAgIGpv
Yi0+c2NoZWQtPm9wcy0+dGltZWRvdXRfam9iKGpvYik7Cj4KPiAgICAgICAgICAgICAgIC8qCj5A
QCAtMjk4LDYgKzMwOSw4IEBAIHN0YXRpYyB2b2lkIGRybV9zY2hlZF9qb2JfdGltZWRvdXQoc3Ry
dWN0Cj53b3JrX3N0cnVjdCAqd29yaykKPiAgICAgICAgICAgICAgICAgICAgICAgam9iLT5zY2hl
ZC0+b3BzLT5mcmVlX2pvYihqb2IpOwo+ICAgICAgICAgICAgICAgICAgICAgICBzY2hlZC0+ZnJl
ZV9ndWlsdHkgPSBmYWxzZTsKPiAgICAgICAgICAgICAgIH0KPisgICAgICB9IGVsc2Ugewo+KyAg
ICAgICAgICAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmc2NoZWQtPmpvYl9saXN0X2xvY2ss
IGZsYWdzKTsKPiAgICAgICB9Cj4KPiAgICAgICBzcGluX2xvY2tfaXJxc2F2ZSgmc2NoZWQtPmpv
Yl9saXN0X2xvY2ssIGZsYWdzKTsgQEAgLTM3MCw2ICszODMsMjAKPkBAIHZvaWQgZHJtX3NjaGVk
X3N0b3Aoc3RydWN0IGRybV9ncHVfc2NoZWR1bGVyICpzY2hlZCwgc3RydWN0Cj5kcm1fc2NoZWRf
am9iICpiYWQpCj4gICAgICAga3RocmVhZF9wYXJrKHNjaGVkLT50aHJlYWQpOwo+Cj4gICAgICAg
LyoKPisgICAgICAgKiBSZWluc2VydCBiYWNrIHRoZSBiYWQgam9iIGhlcmUgLSBub3cgaXQncyBz
YWZlIGFzCj4rICAgICAgICogZHJtX3NjaGVkX2dldF9jbGVhbnVwX2pvYiBjYW5ub3QgcmFjZSBh
Z2FpbnN0IHVzIGFuZCByZWxlYXNlIHRoZQo+KyAgICAgICAqIGJhZCBqb2IgYXQgdGhpcyBwb2lu
dCAtIHdlIHBhcmtlZCAod2FpdGVkIGZvcikgYW55IGluIHByb2dyZXNzCj4rICAgICAgICogKGVh
cmxpZXIpIGNsZWFudXBzIGFuZCBkcm1fc2NoZWRfZ2V0X2NsZWFudXBfam9iIHdpbGwgbm90IGJl
Cj5jYWxsZWQKPisgICAgICAgKiBub3cgdW50aWwgdGhlIHNjaGVkdWxlciB0aHJlYWQgaXMgdW5w
YXJrZWQuCj4rICAgICAgICovCj4rICAgICAgaWYgKGJhZCAmJiBiYWQtPnNjaGVkID09IHNjaGVk
KQo+KyAgICAgICAgICAgICAgLyoKPisgICAgICAgICAgICAgICAqIEFkZCBhdCB0aGUgaGVhZCBv
ZiB0aGUgcXVldWUgdG8gcmVmbGVjdCBpdCB3YXMgdGhlIGVhcmxpZXN0Cj4rICAgICAgICAgICAg
ICAgKiBqb2IgZXh0cmFjdGVkLgo+KyAgICAgICAgICAgICAgICovCj4rICAgICAgICAgICAgICBs
aXN0X2FkZCgmYmFkLT5ub2RlLCAmc2NoZWQtPnJpbmdfbWlycm9yX2xpc3QpOwo+Kwo+KyAgICAg
IC8qCj4gICAgICAgICogSXRlcmF0ZSB0aGUgam9iIGxpc3QgZnJvbSBsYXRlciB0byAgZWFybGll
ciBvbmUgYW5kIGVpdGhlciBkZWFjdGl2ZQo+ICAgICAgICAqIHRoZWlyIEhXIGNhbGxiYWNrcyBv
ciByZW1vdmUgdGhlbSBmcm9tIG1pcnJvciBsaXN0IGlmIHRoZXkgYWxyZWFkeQo+ICAgICAgICAq
IHNpZ25hbGVkLgo+LS0KPjIuNy40Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
