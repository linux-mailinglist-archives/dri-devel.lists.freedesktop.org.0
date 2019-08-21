Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 981CB9792E
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 14:25:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 025046E303;
	Wed, 21 Aug 2019 12:25:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790081.outbound.protection.outlook.com [40.107.79.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B97B6E30D;
 Wed, 21 Aug 2019 12:25:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X9DHvohqltRLAlzP8IJSUndDm1h4+ELRpP09mTh9eEp2WmqBH45EPgxoGMpyEg4NwYOGAyg8B6IpZ1oVnpLbr6eBgS8dE1VkDF68HV+VN7f/IfMTOGESJ9vlvwBrxPnGP6N2m9F2qEssCRiJdi+jGsIPHvXKnCc5eFRJBV49t39MS2kMj5ngdStVeP7JxTVIaXKCRngjQR1hR//2Z/aCQ/A0A2DI7R6GvqQcmhJTF50hdQDxbbjFzYhgnBxP7z87Au/kabL/uCDA/LpWAkbfiBkf8jNQOqj1/ZXdHw7N6HaoAaAPntn4+qfEKPqvOKwPdhoxjjKMsO17Z1jwVUjQcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BTNELApOdrW5FDvjKtKOJvs1XlGqlezM1/pVXGOkZSU=;
 b=iLiaAusa+/G0/7bxUaqPYZLlKkk1V4K5PO0x4VX2W4b4CkdK3CX1AB2A+AW6+SDN3MHIQAnRgjq9Cd4GuCmezEQBlnT7hAcjIS5SWTTgy3UyRzEeyrmhBUNhbkiqYF/tAJD/3jPeyYHc2ofTQvoWFh6rE7jZgaMOrams254oOz8HAq/+YEl2iaopSK7pnUevYKx4sKKgmbrTYZ8lwaa3h3FfSzD7NRAbVuBQaQO3LhPWUIM0F6Pp4DU6JEHhsHnlnKAIfNDxMubvZMJ0jkNFPkQhec2uBTM3SoBcMnjvI4UGhsVaRiG2ux5SeUJphDgTJOlrVd3DRWZ1Oj9FWRvdFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB3477.namprd12.prod.outlook.com (20.178.196.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Wed, 21 Aug 2019 12:25:14 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::d594:85f1:65da:dd82]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::d594:85f1:65da:dd82%5]) with mapi id 15.20.2178.018; Wed, 21 Aug 2019
 12:25:14 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: Lyude Paul <lyude@redhat.com>, "Francis, David" <David.Francis@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2 14/14] drm/amd/display: Trigger modesets on MST DSC
 connectors
Thread-Topic: [PATCH v2 14/14] drm/amd/display: Trigger modesets on MST DSC
 connectors
Thread-Index: AQHVV4tF2xKv5uF/l0aAaujBNf8IrqcEiCcAgAD/toA=
Date: Wed, 21 Aug 2019 12:25:13 +0000
Message-ID: <0b9ed0e9-5fb2-c7ed-4706-ef1b7bd8a9b5@amd.com>
References: <20190820191203.25807-1-David.Francis@amd.com>
 <20190820191203.25807-15-David.Francis@amd.com>
 <f7272de2841c61f1297f0fce493efe5dd5317dfa.camel@redhat.com>
In-Reply-To: <f7272de2841c61f1297f0fce493efe5dd5317dfa.camel@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0011.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::24) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: be5aa43f-ee03-4139-9cec-08d726329dde
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3477; 
x-ms-traffictypediagnostic: BYAPR12MB3477:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3477533556A050B9D0BD543FECAA0@BYAPR12MB3477.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0136C1DDA4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(39860400002)(346002)(136003)(376002)(189003)(199004)(478600001)(7736002)(110136005)(305945005)(71190400001)(52116002)(76176011)(102836004)(26005)(66066001)(386003)(53546011)(6506007)(486006)(2616005)(476003)(99286004)(14454004)(3846002)(446003)(11346002)(6116002)(229853002)(31686004)(6486002)(6512007)(316002)(71200400001)(6436002)(8936002)(8676002)(81166006)(81156014)(2501003)(6246003)(186003)(5660300002)(4326008)(31696002)(25786009)(256004)(2906002)(5024004)(14444005)(66946007)(36756003)(66446008)(86362001)(2201001)(53936002)(66476007)(66556008)(64756008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3477;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: JaJV8STMnNwRP1ekWjzXN0Tz73vwDEBb6Zgy/UiXWBPVvazVz3O5Xvum2fUkH818+DD8LQGh2JWhrq6b6KF3BnLsqb2vSIajys44rgv6su0KRBhAazPvc/bwgo/wS1RBzKzdsxu1SFg+UGUwlXOOedl86JLjmIM1AqAzMUSnl/s9XdSGI88LCmm+wou0tcBvxno4KsYOt8X2Qqwt0w6xIa/D9xdi9itGF/w0jXCgXX8IcmWVXoS9a17bDw2pUJuzEHmIc5RuIJK1BsrwenJdF+BqCGce5IHXPv4s6TIToQVcfygJWIjYxQm1P1w+hFTCG/1cjwEUJyeeJ2NrSdPhFYQMVkUgK9kb6cfhqrHJUMiVhakDuSEsyPnXPfASlLN845gX5tGIfisNepYQzZ/AiZvM6QqHCYFMIH7Runh9mFY=
Content-ID: <69003BEFE7119F40BBF0E095815ECB60@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be5aa43f-ee03-4139-9cec-08d726329dde
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2019 12:25:13.8235 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k4WmbSGGNXgqYj8ajesnAeraks8y+eoTpCAYSYjVcQpEo7+r7WT5imaYvwylcxCphnfD6s8tXSxwCXFEgQCvoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3477
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BTNELApOdrW5FDvjKtKOJvs1XlGqlezM1/pVXGOkZSU=;
 b=SOgnKUERSHWxd6xQf9V6Ei44MzXHarS1dWAkyORpQdfTmB0KC/4XEtjobTRWP7LWTe6tXqVcMgumG/gl5WutAFzM2RSASD6pc1tRThPm3oAdXqb67NjTB02iQSXy1fX904gJq9t93IKAJpgtCydhaJXWIvejnZiM658cqjFWNkc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nicholas.Kazlauskas@amd.com; 
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOC8yMC8xOSA1OjA5IFBNLCBMeXVkZSBQYXVsIHdyb3RlOg0KPiBUaGlzIHNob3VsZCBkZWZp
bml0ZWx5IGJlIGltcGxlbWVudGVkIGFzIGFuIGF0b21pYyBoZWxwZXIgaW4NCj4gZHJtX2RwX21z
dF90b3BvbG9neS5jIGFzIHdlbGwuDQoNClRoaXMgaXMgcHJvYmFibHkgcmVhc29uYWJsZSwgbW9z
dCBkcml2ZXJzIHdvdWxkIHByb2JhYmx5IHdhbnQgdGhpcy4NCg0KVGhlIGlzc3VlcyB3aXRoIHRo
aXMgaW4gZ2VuZXJhbCBhcmUgc3RpbGw6DQoNCigxKSBLbm93aW5nIGlmIHlvdSBoYXZlIGEgRFND
IGluIHRoZSBNU1QgbmV0d29yayB0byBkZWNpZGUgd2hlbiB0byBkbyB0aGlzDQoNCigyKSBNYXJr
aW5nIHRoZSBDUlRDcyBmb3IgdGhlIGNvbm5lY3RvcnMgaW4gdGhlIE1TVCBjaGFpbiBhcyBoYXZp
bmcgDQp0aGVpciBtb2RlIGNoYW5nZWQgd2hpbGUgaXRlcmF0aW5nIG92ZXIgdGhlIGNvbm5lY3Rv
cnMNCg0KRm9yIGFtZGdwdSBpdCdzICJhY2NlcHRhYmxlIiBiYXNlZCBvbiBvdGhlciBkZXNpZ24g
Y29uc3RyYWludHMgdG8ganVzdCANCmxvY2sgYW5kIGdyYWIgZXZlcnl0aGluZyBvbiBhIG1vZGVz
ZXQgYnV0IHRoaXMgbWF5IG5vdCBiZSB0cnVlIGZvciBldmVyeSANCmRyaXZlci4NCg0KTmljaG9s
YXMgS2F6bGF1c2thcw0KDQo+IA0KPiBPbiBUdWUsIDIwMTktMDgtMjAgYXQgMTU6MTIgLTA0MDAs
IERhdmlkIEZyYW5jaXMgd3JvdGU6DQo+PiBXaGVuZXZlciBhIGNvbm5lY3RvciBvbiBhbiBNU1Qg
bmV0d29yayBpcyBhdHRhY2hlZCwgZGV0YWNoZWQsIG9yDQo+PiB1bmRlcmdvZXMgYSBtb2Rlc2V0
LCB0aGUgRFNDIGNvbmZpZ3MgZm9yIGVhY2ggc3RyZWFtIG9uIHRoYXQNCj4+IHRvcG9sb2d5IHdp
bGwgYmUgcmVjYWxjdWxhdGVkLiBUaGlzIGNhbiBjaGFuZ2UgdGhlaXIgcmVxdWlyZWQNCj4+IGJh
bmR3aWR0aCwgcmVxdWlyaW5nIGEgZnVsbCByZXByb2dyYW1taW5nLCBhcyB0aG91Z2ggYSBtb2Rl
c2V0DQo+PiB3YXMgcGVyZm9ybWVkLCBldmVuIGlmIHRoYXQgc3RyZWFtIGRpZCBub3QgY2hhbmdl
IHRpbWluZy4NCj4+DQo+PiBUaGVyZWZvcmUsIHdoZW5ldmVyIGEgY3J0YyBoYXMgZHJtX2F0b21p
Y19jcnRjX25lZWRzX21vZGVzZXQsDQo+PiBmb3IgZWFjaCBjcnRjIHRoYXQgc2hhcmVzIGEgTVNU
IHRvcG9sb2d5IHdpdGggdGhhdCBzdHJlYW0gYW5kDQo+PiBzdXBwb3J0cyBEU0MsIGFkZCB0aGF0
IGNydGMgKGFuZCBhbGwgYWZmZWN0ZWQgY29ubmVjdG9ycyBhbmQNCj4+IHBsYW5lcykgdG8gdGhl
IGF0b21pYyBzdGF0ZSBhbmQgc2V0IG1vZGVfY2hhbmdlZCBvbiBpdHMgc3RhdGUNCj4+DQo+PiB2
MjogRG8gdGhpcyBjaGVjayBvbmx5IG9uIE5hdmkgYW5kIGJlZm9yZSBhZGRpbmcgY29ubmVjdG9y
cw0KPj4gYW5kIHBsYW5lcyBvbiBtb2Rlc2V0dGluZyBjcnRjcw0KPj4NCj4+IENjOiBMZW8gTGkg
PHN1bnBlbmcubGlAYW1kLmNvbT4NCj4+IENjOiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xh
cy5rYXpsYXVza2FzQGFtZC5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBGcmFuY2lzIDxE
YXZpZC5GcmFuY2lzQGFtZC5jb20+DQo+PiAtLS0NCj4+ICAgLi4uL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgNzQgKysrKysrKysrKysrKysrKysrKw0KPj4gICAx
IGZpbGUgY2hhbmdlZCwgNzQgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jDQo+PiBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMNCj4+IGluZGV4IDE0
NWZkNzMwMjVkYy4uZTY0ZjJhNmViNzFhIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYw0KPj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYw0KPj4gQEAgLTY0NzUsNyArNjQ3
NSw3MCBAQCBzdGF0aWMgaW50IGRvX2FxdWlyZV9nbG9iYWxfbG9jayhzdHJ1Y3QgZHJtX2Rldmlj
ZQ0KPj4gKmRldiwNCj4+ICAgDQo+PiAgIAlyZXR1cm4gcmV0IDwgMCA/IHJldCA6IDA7DQo+PiAg
IH0NCj4+ICsjaWZkZWYgQ09ORklHX0RSTV9BTURfRENfRFNDX1NVUFBPUlQNCj4+ICtzdGF0aWMg
aW50IGFkZF9hZmZlY3RlZF9tc3RfZHNjX2NydGNzKHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpz
dGF0ZSwNCj4+IHN0cnVjdCBkcm1fY3J0YyAqY3J0YykNCj4+ICt7DQo+PiArCXN0cnVjdCBkcm1f
Y29ubmVjdG9yICpjb25uZWN0b3I7DQo+PiArCXN0cnVjdCBkcm1fY29ubmVjdG9yX3N0YXRlICpj
b25uX3N0YXRlOw0KPj4gKwlzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9saXN0X2l0ZXIgY29ubl9pdGVy
Ow0KPj4gKwlzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKm5ld19jcnRjX3N0YXRlOw0KPj4gKwlzdHJ1
Y3QgYW1kZ3B1X2RtX2Nvbm5lY3RvciAqYWNvbm5lY3RvciA9IE5VTEwsICphY29ubmVjdG9yX3Rv
X2FkZDsNCj4+ICsJaW50IGksIGo7DQo+PiArCXN0cnVjdCBkcm1fY3J0YyAqY3J0Y3NfYWZmZWN0
ZWRbQU1ER1BVX01BWF9DUlRDU10gPSB7IDAgfTsNCj4+ICsNCj4+ICsJZm9yX2VhY2hfbmV3X2Nv
bm5lY3Rvcl9pbl9zdGF0ZShzdGF0ZSwgY29ubmVjdG9yLCBjb25uX3N0YXRlLCBpKSB7DQo+PiAr
CQlpZiAoY29ubl9zdGF0ZS0+Y3J0YyAhPSBjcnRjKQ0KPj4gKwkJCWNvbnRpbnVlOw0KPj4gKw0K
Pj4gKwkJYWNvbm5lY3RvciA9IHRvX2FtZGdwdV9kbV9jb25uZWN0b3IoY29ubmVjdG9yKTsNCj4+
ICsJCWlmICghYWNvbm5lY3Rvci0+cG9ydCkNCj4+ICsJCQlhY29ubmVjdG9yID0gTlVMTDsNCj4+
ICsJCWVsc2UNCj4+ICsJCQlicmVhazsNCj4+ICsJfQ0KPj4gKw0KPj4gKwlpZiAoIWFjb25uZWN0
b3IpDQo+PiArCQlyZXR1cm4gMDsNCj4+ICsNCj4+ICsJaSA9IDA7DQo+PiArCWRybV9jb25uZWN0
b3JfbGlzdF9pdGVyX2JlZ2luKHN0YXRlLT5kZXYsICZjb25uX2l0ZXIpOw0KPj4gKwlkcm1fZm9y
X2VhY2hfY29ubmVjdG9yX2l0ZXIoY29ubmVjdG9yLCAmY29ubl9pdGVyKSB7DQo+PiArCQlpZiAo
IWNvbm5lY3Rvci0+c3RhdGUgfHwgIWNvbm5lY3Rvci0+c3RhdGUtPmNydGMpDQo+PiArCQkJY29u
dGludWU7DQo+PiArDQo+PiArCQlhY29ubmVjdG9yX3RvX2FkZCA9IHRvX2FtZGdwdV9kbV9jb25u
ZWN0b3IoY29ubmVjdG9yKTsNCj4+ICsJCWlmICghYWNvbm5lY3Rvcl90b19hZGQtPnBvcnQpDQo+
PiArCQkJY29udGludWU7DQo+PiArDQo+PiArCQlpZiAoYWNvbm5lY3Rvcl90b19hZGQtPnBvcnQt
Pm1nciAhPSBhY29ubmVjdG9yLT5wb3J0LT5tZ3IpDQo+PiArCQkJY29udGludWU7DQo+PiAgIA0K
Pj4gKwkJaWYgKCFhY29ubmVjdG9yX3RvX2FkZC0+ZGNfc2luaykNCj4+ICsJCQljb250aW51ZTsN
Cj4+ICsNCj4+ICsJCWlmICghYWNvbm5lY3Rvcl90b19hZGQtPmRjX3NpbmstDQo+Pj4gc2lua19k
c2NfY2Fwcy5kc2NfZGVjX2NhcHMuaXNfZHNjX3N1cHBvcnRlZCkNCj4+ICsJCQljb250aW51ZTsN
Cj4+ICsNCj4+ICsJCWlmIChpID49IEFNREdQVV9NQVhfQ1JUQ1MpDQo+PiArCQkJY29udGludWU7
DQo+PiArDQo+PiArCQljcnRjc19hZmZlY3RlZFtpXSA9IGNvbm5lY3Rvci0+c3RhdGUtPmNydGM7
DQo+PiArCQlpKys7DQo+PiArCX0NCj4+ICsJZHJtX2Nvbm5lY3Rvcl9saXN0X2l0ZXJfZW5kKCZj
b25uX2l0ZXIpOw0KPj4gKw0KPj4gKwlmb3IgKGogPSAwOyBqIDwgaTsgaisrKSB7DQo+PiArCQlu
ZXdfY3J0Y19zdGF0ZSA9IGRybV9hdG9taWNfZ2V0X2NydGNfc3RhdGUoc3RhdGUsDQo+PiBjcnRj
c19hZmZlY3RlZFtqXSk7DQo+PiArCQlpZiAoSVNfRVJSKG5ld19jcnRjX3N0YXRlKSkNCj4+ICsJ
CQlyZXR1cm4gUFRSX0VSUihuZXdfY3J0Y19zdGF0ZSk7DQo+PiArDQo+PiArCQluZXdfY3J0Y19z
dGF0ZS0+bW9kZV9jaGFuZ2VkID0gdHJ1ZTsNCj4+ICsJfQ0KPj4gKw0KPj4gKwlyZXR1cm4gMDsN
Cj4+ICsNCj4+ICt9DQo+PiArI2VuZGlmDQo+PiAgIHN0YXRpYyB2b2lkIGdldF9mcmVlc3luY19j
b25maWdfZm9yX2NydGMoDQo+PiAgIAlzdHJ1Y3QgZG1fY3J0Y19zdGF0ZSAqbmV3X2NydGNfc3Rh
dGUsDQo+PiAgIAlzdHJ1Y3QgZG1fY29ubmVjdG9yX3N0YXRlICpuZXdfY29uX3N0YXRlKQ0KPj4g
QEAgLTcxNjAsNiArNzIyMywxNyBAQCBzdGF0aWMgaW50IGFtZGdwdV9kbV9hdG9taWNfY2hlY2so
c3RydWN0IGRybV9kZXZpY2UNCj4+ICpkZXYsDQo+PiAgIAlpZiAocmV0KQ0KPj4gICAJCWdvdG8g
ZmFpbDsNCj4+ICAgDQo+PiArI2lmZGVmIENPTkZJR19EUk1fQU1EX0RDX0RTQ19TVVBQT1JUDQo+
PiArCWlmIChhZGV2LT5hc2ljX3R5cGUgPj0gQ0hJUF9OQVZJMTApIHsNCj4+ICsJCWZvcl9lYWNo
X29sZG5ld19jcnRjX2luX3N0YXRlKHN0YXRlLCBjcnRjLCBvbGRfY3J0Y19zdGF0ZSwNCj4+IG5l
d19jcnRjX3N0YXRlLCBpKSB7DQo+PiArCQkJaWYgKGRybV9hdG9taWNfY3J0Y19uZWVkc19tb2Rl
c2V0KG5ld19jcnRjX3N0YXRlKSkgew0KPj4gKwkJCQlyZXQgPSBhZGRfYWZmZWN0ZWRfbXN0X2Rz
Y19jcnRjcyhzdGF0ZSwgY3J0Yyk7DQo+PiArCQkJCWlmIChyZXQpDQo+PiArCQkJCQlnb3RvIGZh
aWw7DQo+PiArCQkJfQ0KPj4gKwkJfQ0KPj4gKwl9DQo+PiArI2VuZGlmDQo+PiAgIAlmb3JfZWFj
aF9vbGRuZXdfY3J0Y19pbl9zdGF0ZShzdGF0ZSwgY3J0Yywgb2xkX2NydGNfc3RhdGUsDQo+PiBu
ZXdfY3J0Y19zdGF0ZSwgaSkgew0KPj4gICAJCWlmICghZHJtX2F0b21pY19jcnRjX25lZWRzX21v
ZGVzZXQobmV3X2NydGNfc3RhdGUpICYmDQo+PiAgIAkJICAgICFuZXdfY3J0Y19zdGF0ZS0+Y29s
b3JfbWdtdF9jaGFuZ2VkICYmDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
