Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47731F4E60
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 15:42:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E0C56F9B9;
	Fri,  8 Nov 2019 14:42:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820089.outbound.protection.outlook.com [40.107.82.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 054F46F9B9;
 Fri,  8 Nov 2019 14:42:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=et7+RzfSJO2+IWuWVNhXTWbHpAinfUIhb1l0lEn6aGd6J9EnvKPsS0iwIKnxdZTDd5PINfH7KKFXhNjf37j/IgQVPV68WGBqvqc7b2QkdbQEoLw0KCircBKwegjuMliA10xmUnz7JJews8TlaGYrt8IYOVr+hFT7qNhgkmp8vJjtzo3B7OwZU4zH0II2cHXRHjv4tbEZ8AV2JDnUC/5O6xZYePNY5IeoJV97Y5CO6w78tMwxRHM4jcZn1dn6dwFYtqmIYvYSjwB3DnfEaKyiHMRU5ZpkMMZ/Ul19zkSdXDxmQIb9ue4RO3SqB0bRcjzd70LEfyMZTNBbsflpe4m80w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8EH2ySTRLQLbdaDHN29VctGH0uv0+ZEUt0DBxnqXLuo=;
 b=V804wvd7wEApCZarR82pA4nuAqEQFcAk2/3C5oHaNA8gN3tbE7gbnq9NUMGAyns33iUgYFafiz0s/dnHYdWtORNTL5pjKFzneHUXlnCEEjczioTr4H600smqSk4eKIgE9yV7Yfv+fo2aqNfUgZ0f+L5rBoeUD1tPyBnIsA4ZAANrY/rttxspqjsfyzRoqA3liJhCEl83sRJU8EE/syA11ikxr6KPrpWebiMqg75CkrD4g9fNL8TVR0TpS4fBh1m29uNQdpIgPWKuc5JcrT2X0r6nalUvHGvMbbGUPo155q2LyIYoi633y06dlgNhWxeYeL+Gm1macpFAOj37K9YvDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB3013.namprd12.prod.outlook.com (20.178.55.219) by
 BYAPR12MB2792.namprd12.prod.outlook.com (20.177.124.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Fri, 8 Nov 2019 14:42:03 +0000
Received: from BYAPR12MB3013.namprd12.prod.outlook.com
 ([fe80::1174:3feb:de01:4fb9]) by BYAPR12MB3013.namprd12.prod.outlook.com
 ([fe80::1174:3feb:de01:4fb9%6]) with mapi id 15.20.2430.023; Fri, 8 Nov 2019
 14:42:03 +0000
From: Mikita Lipski <mlipski@amd.com>
To: Colin King <colin.king@canonical.com>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Lyude Paul
 <lyude@redhat.com>, "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>,
 "Lipski, Mikita" <Mikita.Lipski@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH][next] drm/amd/display: fix dereference of pointer
 aconnector when it is null
Thread-Topic: [PATCH][next] drm/amd/display: fix dereference of pointer
 aconnector when it is null
Thread-Index: AQHVlkIp/tTe277tXEmpnQT+Lu2nIKeBWNWA
Date: Fri, 8 Nov 2019 14:42:03 +0000
Message-ID: <7155ecfc-1aff-002d-9cc6-e097525e7cb6@amd.com>
References: <20191108143814.118856-1-colin.king@canonical.com>
In-Reply-To: <20191108143814.118856-1-colin.king@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0024.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::37)
 To BYAPR12MB3013.namprd12.prod.outlook.com
 (2603:10b6:a03:a9::27)
x-originating-ip: [165.204.55.250]
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9b28eee8-945c-438b-542a-08d76459d1a1
x-ms-traffictypediagnostic: BYAPR12MB2792:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB27929299D56F6AA755507AE0E47B0@BYAPR12MB2792.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1002;
x-forefront-prvs: 0215D7173F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(39860400002)(396003)(376002)(366004)(199004)(189003)(6246003)(186003)(229853002)(2501003)(66446008)(14454004)(52116002)(6506007)(36756003)(54906003)(110136005)(102836004)(71190400001)(71200400001)(66946007)(66066001)(5660300002)(64756008)(316002)(53546011)(386003)(66476007)(486006)(99286004)(66556008)(4326008)(7736002)(31696002)(476003)(305945005)(11346002)(256004)(31686004)(8676002)(446003)(3846002)(6436002)(6116002)(25786009)(6486002)(26005)(81166006)(478600001)(2616005)(81156014)(8936002)(2906002)(2201001)(76176011)(6512007)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2792;
 H:BYAPR12MB3013.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +XTYjAWxMhjho/NftaDmRDWP4CzD95xcbikglUvOW4CziBfKC57A6wJuTc9HSzkRMjOn53GQfuIpgaqt4GqQ5R9Hs8vt60hCrnNR1qzsiXpxtpVlzCN245/46nIAUXVY6R67P0JZ0ysNFtJcZ/N7V1Hs9odMQniHAX7x07CKhNTElQf7DSpVRLbyuq4G57db+gg/GXeo1IKYLhP7XEAGzgEO8FbBxXCRRKv+isvpLiTWabG2v1WFHXaDc8NPz+ZE5iOW4Pryhis/Yq3Soj3sID+fyb4m8ZO5JX+aCrPiaCIx1W5I2HJvzvJNIu6V2C5sKruLEb6ddgYDWqtNDlgfFCuMHuqARIWFSuFpW7FKC3+sAgBjIaPxs53SM0RDgrEdFrHtCVA+MssiyoEcS0Sl7XrXTMllm3n5Q4ty9ol1HCwmKejo6dwQW4MsBThVS7Kv
Content-ID: <6E12F9E10193E2498B9DE2142A6106B4@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b28eee8-945c-438b-542a-08d76459d1a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2019 14:42:03.0561 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bhr9EBZLinrJ5SaTW2eJOt0rddRVWSB1Of6phwA0JOpXOy3nzWDDEFEKKkje9LZc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2792
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8EH2ySTRLQLbdaDHN29VctGH0uv0+ZEUt0DBxnqXLuo=;
 b=b8rh/z43KN1TRvuuZhsE8deRibXIs+DByorp8oi+xZ1vsRdl0BKqnWtduaBsCtmWTyE7Ipz2IlgdKdfyki7Y9g/ARi7YwvhsajRY4fLY/FdfpuB7Kd6DFX8EAWOsJvaf0+PkRXLRVWHFKryZRLik27/w2yiEYga2MEsXJKmpP58=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mikita.Lipski@amd.com; 
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
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzIQ0KDQpSZXZpZXdlZC1ieTogTWlraXRhIExpcHNraSA8bWlraXRhLmxpcHNraUBhbWQu
Y29tPg0KDQpPbiAwOC4xMS4yMDE5IDk6MzgsIENvbGluIEtpbmcgd3JvdGU6DQo+IEZyb206IENv
bGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+DQo+IA0KPiBDdXJyZW50bHkg
cG9pbnRlciBhY29ubmVjdG9yIGlzIGJlaW5nIGRlcmVmZXJlbmNlZCBieSB0aGUgY2FsbCB0bw0K
PiB0b19kbV9jb25uZWN0b3Jfc3RhdGUgYmVmb3JlIGl0IGlzIGJlaW5nIG51bGwgY2hlY2tlZCwg
dGhpcyBjb3VsZA0KPiBsZWFkIHRvIGEgbnVsbCBwb2ludGVyIGRlcmVmZXJlbmNlLiAgRml4IHRo
aXMgYnkgY2hlY2tpbmcgdGhhdA0KPiBhY29ubmVjdG9yIGlzIG51bGwgYmVmb3JlIGRlcmVmZXJl
bmNpbmcgaXQuDQo+IA0KPiBBZGRyZXNzZXMtQ292ZXJpdHk6ICgiRGVyZWZlcmVuY2UgYmVmb3Jl
IG51bGwgY2hlY2siKQ0KPiBGaXhlczogNTEzM2M2MjQxZDljICgiZHJtL2FtZC9kaXNwbGF5OiBB
ZGQgTVNUIGF0b21pYyByb3V0aW5lcyIpDQo+IFNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5n
IDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYyB8IDUgKystLS0NCj4gICAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2Rt
X2hlbHBlcnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1
X2RtX2hlbHBlcnMuYw0KPiBpbmRleCBlM2NkYTY5ODRkMjguLjcyZTY3Nzc5NmE0OCAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1f
aGVscGVycy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0v
YW1kZ3B1X2RtX2hlbHBlcnMuYw0KPiBAQCAtMTkzLDEyICsxOTMsMTEgQEAgYm9vbCBkbV9oZWxw
ZXJzX2RwX21zdF93cml0ZV9wYXlsb2FkX2FsbG9jYXRpb25fdGFibGUoDQo+ICAgCSAqIHRoYXQg
YmxvY2tzIGJlZm9yZSBjb21taXQgZ3VhcmFudGVlaW5nIHRoYXQgdGhlIHN0YXRlDQo+ICAgCSAq
IGlzIG5vdCBnb25uYSBiZSBzd2FwcGVkIHdoaWxlIHN0aWxsIGluIHVzZSBpbiBjb21taXQgdGFp
bCAqLw0KPiAgIA0KPiAtCWRtX2Nvbm5fc3RhdGUgPSB0b19kbV9jb25uZWN0b3Jfc3RhdGUoYWNv
bm5lY3Rvci0+YmFzZS5zdGF0ZSk7DQo+IC0NCj4gLQ0KPiAgIAlpZiAoIWFjb25uZWN0b3IgfHwg
IWFjb25uZWN0b3ItPm1zdF9wb3J0KQ0KPiAgIAkJcmV0dXJuIGZhbHNlOw0KPiAgIA0KPiArCWRt
X2Nvbm5fc3RhdGUgPSB0b19kbV9jb25uZWN0b3Jfc3RhdGUoYWNvbm5lY3Rvci0+YmFzZS5zdGF0
ZSk7DQo+ICsNCj4gICAJbXN0X21nciA9ICZhY29ubmVjdG9yLT5tc3RfcG9ydC0+bXN0X21ncjsN
Cj4gICANCj4gICAJaWYgKCFtc3RfbWdyLT5tc3Rfc3RhdGUpDQo+IA0KDQotLSANClRoYW5rcywN
Ck1pa2l0YSBMaXBza2kNCm1pa2l0YS5saXBza2lAYW1kLmNvbQ0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
