Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BBA89279
	for <lists+dri-devel@lfdr.de>; Sun, 11 Aug 2019 18:09:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F62089C98;
	Sun, 11 Aug 2019 16:09:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700071.outbound.protection.outlook.com [40.107.70.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 012C56E35B;
 Sun, 11 Aug 2019 16:09:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nPUO0lr+lQy71Krp3cy+1VecO+4vEomP4SFCfN0uEZQ33E9LbfaFnTffmDSaBgSRSnEo/9+kCdnrTUWmAnivHQ7cNmf0lgf41I8hZQ+FcTYGcPNt2+9kOpwQoAeZxbdUIfwd3OEuILSA4WOvV0yu68QdRKQO8VbSwRUxzDaGSQ464Da9qXH8XM0pslEEhSYkFqNF/vxDLmwrUrYCKMqVbrhNaMV2M4KfjES8pZlwW+nBBkoOru8I6RmFhMXD5bwXfhUJcvWjRII6EG1B07VbjOve7iMrIAnKva+4bkoWJGmrDckm1IS2JcN0hkRJ609tbVGc+JWyykSSqv9VB0VrOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+325vXSXt/NLxJA4F0raywWTQet2VoEIS1G7Lf0g0RA=;
 b=iywcBFtw8opyaFQrc8Q0xmmAp0e7o90pWC7w/Cx/gTT4KtWGlq9WQqyijNuO2PsgtRaHjMZwvbsNUnt7NHUi1uc2YrY3tktOC0kzhESHvz/l3TZMhLH0rpftjxAl7y/DnW7IDiCdA54ar4f6yAzuDdiKWI3V8ZHuTew7x8vvQqKZF7NVQnSfltLqTN+bCSw/BmTshaj7xtT9SU7Xv/d5lWErQfePdm5dc7RCjgWtK7n7fDDgAe9qhZVTDYXkjOEIRF9gqB6tWS/wt3Lm6cgB+m5tGDfQez4bePSA+qyI5NP5huA905PLbr9JXDwOUlG0Y4EI+mtMTroeyKktExkFBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB2567.namprd12.prod.outlook.com (52.132.141.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Sun, 11 Aug 2019 16:09:25 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::fc5f:ce01:e8c8:db89]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::fc5f:ce01:e8c8:db89%12]) with mapi id 15.20.2157.022; Sun, 11 Aug
 2019 16:09:25 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 5/4] dma-fence: Have dma_fence_signal call signal_locked
Thread-Topic: [PATCH 5/4] dma-fence: Have dma_fence_signal call signal_locked
Thread-Index: AQHVUCVSc8wajMcXIkeNl+26fwB0Hqb2HfkA
Date: Sun, 11 Aug 2019 16:09:25 +0000
Message-ID: <58eedacc-b8e3-e16e-5cc7-b1e8ae63cf30@amd.com>
References: <3b4da1e6-b5df-0f0e-cf4d-21dd6fd33e32@amd.com>
 <20190811091523.9382-1-chris@chris-wilson.co.uk>
In-Reply-To: <20190811091523.9382-1-chris@chris-wilson.co.uk>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0150.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::18) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 92d38279-abf0-4f4b-e990-08d71e764777
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2567; 
x-ms-traffictypediagnostic: DM5PR12MB2567:
x-microsoft-antispam-prvs: <DM5PR12MB25673AB2A61EB081C53C183F83D00@DM5PR12MB2567.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1417;
x-forefront-prvs: 0126A32F74
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(396003)(39860400002)(366004)(346002)(189003)(199004)(5660300002)(476003)(110136005)(7736002)(14454004)(14444005)(2501003)(86362001)(446003)(58126008)(6512007)(11346002)(229853002)(2616005)(316002)(31696002)(53936002)(8936002)(25786009)(36756003)(65806001)(6246003)(65956001)(2906002)(256004)(66446008)(66556008)(4326008)(65826007)(71200400001)(186003)(71190400001)(8676002)(66946007)(64756008)(66476007)(99286004)(102836004)(81166006)(478600001)(31686004)(386003)(6506007)(64126003)(76176011)(6486002)(66574012)(52116002)(6116002)(305945005)(486006)(46003)(81156014)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2567;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: F0sfPw3snv3zq5ATy5oc1WtlUY5d2KbD+WENARJtHcgVJ5BN24CdS07qcImedca01DJEkkThFgE80cPjOEdIIb9F6CQTJ1yZAnmivSdF/Cr6htakdC9fX1BzWwKFjlnfjA8zHHOqJj1XCmGYYcJtjjtwKBHbXxnNthTPtEKXxxsP7FKV87U7g8dG8UzF8C0UslS3rsG21IpHpU3xZrJsmbiOjfJLcVO4pj4TNp838pm9RYNyvd06b/c/QLJCx2FFt2dt9iNnJmKD06LDeDLmXjydwLTeshby6PCp/pdzsRyNtMG7OHtVoVBr4lbDFAOPWBbJ6k0lwVEk/8SFkwhwtMn30CbjAooefefErVs73SIGzcYCPhS+w3k4xF4+y7y+MQ4kxibEwCB76YtzW3fTV5CWoUI2NzehJ6MaqSTSrjc=
x-ms-exchange-transport-forked: True
Content-ID: <D31894DEADD9F540ACBBA87B10AE9A2F@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92d38279-abf0-4f4b-e990-08d71e764777
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2019 16:09:25.5557 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u+Db7wSA3Je2UXNtqzof1SulQksBzuRlvOr/RiOvAJHk19sq+NrP9KQxKDsfag6l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2567
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+325vXSXt/NLxJA4F0raywWTQet2VoEIS1G7Lf0g0RA=;
 b=WV+PRKNHBXPGGhWnzA5TQqKILFbMuhBVMx4tPyDxN1aAlQT/0MTnHag2hyO/2wkTXj6mpxhNKmSZvXLC7MEHQMsurgNOyfEV9Q2RL0jp5jBmPNMbF4RPyNqgY+i6c/kicEOhUonnzvAVV3LhFltbZg3k3TW/D4YSL3Dq+0+rCBs=
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTEuMDguMTkgdW0gMTE6MTUgc2NocmllYiBDaHJpcyBXaWxzb246DQo+IE5vdyB0aGF0IGRt
YV9mZW5jZV9zaWduYWwgYWx3YXlzIHRha2VzIHRoZSBzcGlubG9jayB0byBmbHVzaCB0aGUNCj4g
Y2JfbGlzdCwgc2ltcGx5IHRha2UgdGhlIHNwaW5sb2NrIGFuZCBjYWxsIGRtYV9mZW5jZV9zaWdu
YWxfbG9ja2VkKCkgdG8NCj4gYXZvaWQgY29kZSByZXBldGl0aW9uLg0KPg0KPiBTdWdnZXN0ZWQt
Ynk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4gU2lnbmVk
LW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+DQo+IENjOiBD
aHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQoNClJldmlld2VkLWJ5
OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQoNCj4gLS0tDQo+
ICAgZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5jZS5jIHwgMzIgKysrKysrKysrKysrLS0tLS0tLS0t
LS0tLS0tLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMjAgZGVs
ZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMg
Yi9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMNCj4gaW5kZXggYWI0YTQ1NmJiYTA0Li4zNjdi
NzEwODRkMzQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UuYw0KPiAr
KysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMNCj4gQEAgLTEyMiwyNiArMTIyLDE4IEBA
IEVYUE9SVF9TWU1CT0woZG1hX2ZlbmNlX2NvbnRleHRfYWxsb2MpOw0KPiAgICAqLw0KPiAgIGlu
dCBkbWFfZmVuY2Vfc2lnbmFsX2xvY2tlZChzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZSkNCj4gICB7
DQo+IC0JaW50IHJldCA9IDA7DQo+IC0NCj4gLQlsb2NrZGVwX2Fzc2VydF9oZWxkKGZlbmNlLT5s
b2NrKTsNCj4gLQ0KPiAgIAlpZiAoV0FSTl9PTighZmVuY2UpKQ0KPiAgIAkJcmV0dXJuIC1FSU5W
QUw7DQo+ICAgDQo+IC0JaWYgKCFfX2RtYV9mZW5jZV9zaWduYWwoZmVuY2UpKSB7DQo+IC0JCXJl
dCA9IC1FSU5WQUw7DQo+ICsJbG9ja2RlcF9hc3NlcnRfaGVsZChmZW5jZS0+bG9jayk7DQo+ICAg
DQo+IC0JCS8qDQo+IC0JCSAqIHdlIG1pZ2h0IGhhdmUgcmFjZWQgd2l0aCB0aGUgdW5sb2NrZWQg
ZG1hX2ZlbmNlX3NpZ25hbCwNCj4gLQkJICogc3RpbGwgcnVuIHRocm91Z2ggYWxsIGNhbGxiYWNr
cw0KPiAtCQkgKi8NCj4gLQl9IGVsc2Ugew0KPiAtCQlfX2RtYV9mZW5jZV9zaWduYWxfX3RpbWVz
dGFtcChmZW5jZSwga3RpbWVfZ2V0KCkpOw0KPiAtCX0NCj4gKwlpZiAoIV9fZG1hX2ZlbmNlX3Np
Z25hbChmZW5jZSkpDQo+ICsJCXJldHVybiAtRUlOVkFMOw0KPiAgIA0KPiArCV9fZG1hX2ZlbmNl
X3NpZ25hbF9fdGltZXN0YW1wKGZlbmNlLCBrdGltZV9nZXQoKSk7DQo+ICAgCV9fZG1hX2ZlbmNl
X3NpZ25hbF9fbm90aWZ5KGZlbmNlKTsNCj4gLQlyZXR1cm4gcmV0Ow0KPiArDQo+ICsJcmV0dXJu
IDA7DQo+ICAgfQ0KPiAgIEVYUE9SVF9TWU1CT0woZG1hX2ZlbmNlX3NpZ25hbF9sb2NrZWQpOw0K
PiAgIA0KPiBAQCAtMTYxLDE5ICsxNTMsMTkgQEAgRVhQT1JUX1NZTUJPTChkbWFfZmVuY2Vfc2ln
bmFsX2xvY2tlZCk7DQo+ICAgaW50IGRtYV9mZW5jZV9zaWduYWwoc3RydWN0IGRtYV9mZW5jZSAq
ZmVuY2UpDQo+ICAgew0KPiAgIAl1bnNpZ25lZCBsb25nIGZsYWdzOw0KPiArCWludCByZXQ7DQo+
ICAgDQo+ICAgCWlmICghZmVuY2UpDQo+ICAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gICANCj4gLQlp
ZiAoIV9fZG1hX2ZlbmNlX3NpZ25hbChmZW5jZSkpDQo+IC0JCXJldHVybiAtRUlOVkFMOw0KPiAt
DQo+IC0JX19kbWFfZmVuY2Vfc2lnbmFsX190aW1lc3RhbXAoZmVuY2UsIGt0aW1lX2dldCgpKTsN
Cj4gKwlpZiAodGVzdF9iaXQoRE1BX0ZFTkNFX0ZMQUdfU0lHTkFMRURfQklULCAmZmVuY2UtPmZs
YWdzKSkNCj4gKwkJcmV0dXJuIDA7DQo+ICAgDQo+ICAgCXNwaW5fbG9ja19pcnFzYXZlKGZlbmNl
LT5sb2NrLCBmbGFncyk7DQo+IC0JX19kbWFfZmVuY2Vfc2lnbmFsX19ub3RpZnkoZmVuY2UpOw0K
PiArCXJldCA9IGRtYV9mZW5jZV9zaWduYWxfbG9ja2VkKGZlbmNlKTsNCj4gICAJc3Bpbl91bmxv
Y2tfaXJxcmVzdG9yZShmZW5jZS0+bG9jaywgZmxhZ3MpOw0KPiAtCXJldHVybiAwOw0KPiArDQo+
ICsJcmV0dXJuIHJldDsNCj4gICB9DQo+ICAgRVhQT1JUX1NZTUJPTChkbWFfZmVuY2Vfc2lnbmFs
KTsNCj4gICANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
