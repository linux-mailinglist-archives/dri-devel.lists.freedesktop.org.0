Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B800890CC
	for <lists+dri-devel@lfdr.de>; Sun, 11 Aug 2019 10:58:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C653F6E2F0;
	Sun, 11 Aug 2019 08:58:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760048.outbound.protection.outlook.com [40.107.76.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 896776E2F0;
 Sun, 11 Aug 2019 08:58:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lxzh8TLVtWIjuNWA4HfpGXCj340nzDrgqs+Tpp81zcCUZY1La10rH2sVRrlzg8WPVahXBVzjytTBEBuLnHeEgyzzedcLGtRQxZl7YlNU5+tT1QNfjfVNc6OwSuCtViBT9leN/EQ1YGTUnR2j/fiftjJlIr6aF9FBv+fUsypr/kQyyE10POeOgUpmWHnkKB5ezLc7RceS4ALYAAMjcYNg5Sxd9i0cShdwYPSHCR3b48XaFUUX6rT2K5+jea9yuSI6BkL1ETb6np8gOUaxKeECxnTEwzClME+HM9KFlis6ap67ESNQVGTasDmA4VNc0JRdHzenYuyeZJKtPLadeJcm8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4sLu9grtm+ld1f4ABXy7m4xVpRoL/DOj4+g1vDniJZs=;
 b=gRfm9vBglJMVj2RBVkIapMHMiw9O3DOhGVdbDUP90H/nGe6ie0Wx63580vgL4OlKwdiexuZ1wyjCXQOhglIO7SqlPNqly187aV8UGAyBjgPqNBI9GT4MOXDwVi8mXfjGi7OSaNgb22yUtMxD/58e4KsdQpSl2oDbA2lc+qhwjxr5g58x/zSBXh50gtaIOB2HHj2jeb+6He6ioQek/Nx7NyBNDl7AGg/qVAijekwbBwuiJd9TvoQiQcWfshzVjTp40VJLrO2cxVOhQrMBDoGdJlRDvyWlD6dSayZtgbpQns8J0XTpzEXcg+lMIYWBrAyFKkrCVmQsGFjOnwXfEXxJ7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1659.namprd12.prod.outlook.com (10.172.40.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Sun, 11 Aug 2019 08:58:31 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::fc5f:ce01:e8c8:db89]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::fc5f:ce01:e8c8:db89%12]) with mapi id 15.20.2157.022; Sun, 11 Aug
 2019 08:58:31 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/4] dma-fence: Propagate errors to dma-fence-array
 container
Thread-Topic: [PATCH 1/4] dma-fence: Propagate errors to dma-fence-array
 container
Thread-Index: AQHVT5FWUyACw0uMMk68pUG3X/TCLab1pruA
Date: Sun, 11 Aug 2019 08:58:31 +0000
Message-ID: <e02b6f98-ce0f-6087-ef23-1e7888738c27@amd.com>
References: <20190810153430.30636-1-chris@chris-wilson.co.uk>
In-Reply-To: <20190810153430.30636-1-chris@chris-wilson.co.uk>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0171.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::15) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 738f3efc-973b-43e9-4cb9-08d71e3a154d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1659; 
x-ms-traffictypediagnostic: DM5PR12MB1659:
x-microsoft-antispam-prvs: <DM5PR12MB165975C1401D64B92BDF10A183D00@DM5PR12MB1659.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0126A32F74
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(366004)(346002)(39860400002)(376002)(136003)(396003)(199004)(189003)(64756008)(6512007)(256004)(86362001)(31696002)(305945005)(7736002)(14444005)(8936002)(66476007)(71200400001)(71190400001)(6116002)(65826007)(81166006)(81156014)(2906002)(5660300002)(8676002)(66446008)(66946007)(53936002)(66556008)(25786009)(4326008)(6246003)(229853002)(58126008)(52116002)(186003)(46003)(102836004)(76176011)(2501003)(446003)(476003)(31686004)(6506007)(478600001)(2616005)(11346002)(386003)(14454004)(486006)(65956001)(99286004)(65806001)(110136005)(36756003)(54906003)(316002)(6436002)(6486002)(64126003)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1659;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: MD3ce442w6ySTtXbSd0w/5K2pAEzFBU7H3H63EYw8gEzkJwB+PnqgK5AcnapxKR87XbbPFOPY19s3jAr/eO9+JmbrNmXfPEsIeHB+IACaRp4AMQJ3Bz+Uy7Mkq2kd0AAZvZEZxBaA+7pt+xcbvAl/1a/L+C6msKq30F75ugDBNyj9Hi7ZUCm5aPAjlLMLSuWhEGwtvyVoaHpJ8bbR9Iq4owgilOvXGYuuMnPYHAwfqbzzVzpjl1ccb4m6IRAQ2BQ1tJ2D3XWbRwvrq5eYFZybe28tIkX64GrNAqGkZ4um8nVXqDxxnn+SK9LXuZcZdIfVKwjJdEb3bJr4yABUELbTUA4yBkmVKq0i+duHF2LHzSoW5SVuWBMLe+ovJlkKKNSoO3hQsgsbDtiM52SJMPjrs/kwiDjTFs5z+MhrA0oYvk=
x-ms-exchange-transport-forked: True
Content-ID: <5585FF12B13DBA44BDF65262DD4B767B@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 738f3efc-973b-43e9-4cb9-08d71e3a154d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2019 08:58:31.4236 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tnAJbfoTFGEUuPZf6alDqKS3RRAsLT7zuOKx2rTga5W/3olOEzfN32mG3E1YW3Ld
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1659
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4sLu9grtm+ld1f4ABXy7m4xVpRoL/DOj4+g1vDniJZs=;
 b=an+woxwIKxfqp4xrBp3OBXLHKpmOeEnt+UYR39Isg1txNi6SoVNJ8FjmYl8Lep5hO2WQWVVERB4OcYtSxe5gueFKPwVXpyIkDP8cIJcxbk5aujhHRf96FRah8CfELElAkKbBvhEaQ4Ps5EVqoP1w8WBcdhP32y4o3qWH9umpQZI=
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
Cc: Gustavo Padovan <gustavo@padovan.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTAuMDguMTkgdW0gMTc6MzQgc2NocmllYiBDaHJpcyBXaWxzb246DQo+IFdoZW4gb25lIG9m
IHRoZSBhcnJheSBvZiBmZW5jZXMgaXMgc2lnbmFsZWQsIHByb3BhZ2F0ZSBpdHMgZXJyb3JzIHRv
IHRoZQ0KPiBwYXJlbnQgZmVuY2UtYXJyYXkgKGtlZXBpbmcgdGhlIGZpcnN0IGVycm9yIHRvIGJl
IHJhaXNlZCkuDQo+DQo+IHYyOiBPcGVuY29kZSBjbXB4Y2hnX2xvY2FsIHRvIGF2b2lkIGNvbXBp
bGVyIGZyZWFrb3V0Lg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNo
cmlzLXdpbHNvbi5jby51az4NCj4gQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFy
by5vcmc+DQo+IENjOiBHdXN0YXZvIFBhZG92YW4gPGd1c3Rhdm9AcGFkb3Zhbi5vcmc+DQo+IC0t
LQ0KPiAgIGRyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UtYXJyYXkuYyB8IDE1ICsrKysrKysrKysr
KysrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspDQo+DQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLWFycmF5LmMgYi9kcml2ZXJzL2RtYS1idWYv
ZG1hLWZlbmNlLWFycmF5LmMNCj4gaW5kZXggMTJjNmY2NGMwYmMyLi5kOTA2NzViYjRmY2MgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UtYXJyYXkuYw0KPiArKysgYi9k
cml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLWFycmF5LmMNCj4gQEAgLTEzLDYgKzEzLDEyIEBADQo+
ICAgI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4NCj4gICAjaW5jbHVkZSA8bGludXgvZG1hLWZlbmNl
LWFycmF5Lmg+DQo+ICAgDQo+ICtzdGF0aWMgdm9pZCBmZW5jZV9zZXRfZXJyb3Jfb25jZShzdHJ1
Y3QgZG1hX2ZlbmNlICpmZW5jZSwgaW50IGVycm9yKQ0KDQpJIHdvdWxkIHVzZSBhIGRtYV9mZW5j
ZV9hcnJheSBwcmVmaXggZm9yIGFsbCBuYW1lcyBpbiB0aGUgZmlsZS4NCg0KPiArew0KPiArCWlm
ICghZmVuY2UtPmVycm9yICYmIGVycm9yKQ0KPiArCQlkbWFfZmVuY2Vfc2V0X2Vycm9yKGZlbmNl
LCBlcnJvcik7DQo+ICt9DQo+ICsNCj4gICBzdGF0aWMgY29uc3QgY2hhciAqZG1hX2ZlbmNlX2Fy
cmF5X2dldF9kcml2ZXJfbmFtZShzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZSkNCj4gICB7DQo+ICAg
CXJldHVybiAiZG1hX2ZlbmNlX2FycmF5IjsNCj4gQEAgLTM4LDYgKzQ0LDEzIEBAIHN0YXRpYyB2
b2lkIGRtYV9mZW5jZV9hcnJheV9jYl9mdW5jKHN0cnVjdCBkbWFfZmVuY2UgKmYsDQo+ICAgCQlj
b250YWluZXJfb2YoY2IsIHN0cnVjdCBkbWFfZmVuY2VfYXJyYXlfY2IsIGNiKTsNCj4gICAJc3Ry
dWN0IGRtYV9mZW5jZV9hcnJheSAqYXJyYXkgPSBhcnJheV9jYi0+YXJyYXk7DQo+ICAgDQo+ICsJ
LyoNCj4gKwkgKiBQcm9wYWdhdGUgdGhlIGZpcnN0IGVycm9yIHJlcG9ydGVkIGJ5IGFueSBvZiBv
dXIgZmVuY2VzLCBidXQgb25seQ0KPiArCSAqIGJlZm9yZSB3ZSBvdXJzZWx2ZXMgYXJlIHNpZ25h
bGVkLg0KPiArCSAqLw0KPiArCWlmIChhdG9taWNfcmVhZCgmYXJyYXktPm51bV9wZW5kaW5nKSA+
IDApDQo+ICsJCWZlbmNlX3NldF9lcnJvcl9vbmNlKCZhcnJheS0+YmFzZSwgZi0+ZXJyb3IpOw0K
DQpUaGF0IGlzIHJhY3kgZXZlbiBpZiB5b3UgY2hlY2sgdGhlIGF0b21pYyBiZWNhdXNlIG51bV9w
ZW5kaW5nIGNhbiBiZSANCmluaXRpYWxpemVkIHRvIDEgZm9yIHNpZ25hbCBhbnkgYXJyYXlzIGFz
IHdlbGwuDQoNCkkgc3VnZ2VzdCB0byByYXRoZXIgdGVzdCBpbiBkbWFfZmVuY2VfYXJyYXlfc2V0
X2Vycm9yX29uY2UgaWYgd2UgZ290IGFuIA0KZXJyb3IgYW5kIGlmIHllcyBncmFiIHRoZSBzZXF1
ZW5jZSBsb2NrIGFuZCB0ZXN0IGlmIHdlIGFyZSBhbHJlYWR5IA0Kc2lnbmFsZWQgb3Igbm90Lg0K
DQpDaHJpc3RpYW4uDQoNCj4gKw0KPiAgIAlpZiAoYXRvbWljX2RlY19hbmRfdGVzdCgmYXJyYXkt
Pm51bV9wZW5kaW5nKSkNCj4gICAJCWlycV93b3JrX3F1ZXVlKCZhcnJheS0+d29yayk7DQo+ICAg
CWVsc2UNCj4gQEAgLTYzLDYgKzc2LDggQEAgc3RhdGljIGJvb2wgZG1hX2ZlbmNlX2FycmF5X2Vu
YWJsZV9zaWduYWxpbmcoc3RydWN0IGRtYV9mZW5jZSAqZmVuY2UpDQo+ICAgCQlkbWFfZmVuY2Vf
Z2V0KCZhcnJheS0+YmFzZSk7DQo+ICAgCQlpZiAoZG1hX2ZlbmNlX2FkZF9jYWxsYmFjayhhcnJh
eS0+ZmVuY2VzW2ldLCAmY2JbaV0uY2IsDQo+ICAgCQkJCQkgICBkbWFfZmVuY2VfYXJyYXlfY2Jf
ZnVuYykpIHsNCj4gKwkJCWZlbmNlX3NldF9lcnJvcl9vbmNlKCZhcnJheS0+YmFzZSwNCj4gKwkJ
CQkJICAgICBhcnJheS0+ZmVuY2VzW2ldLT5lcnJvcik7DQo+ICAgCQkJZG1hX2ZlbmNlX3B1dCgm
YXJyYXktPmJhc2UpOw0KPiAgIAkJCWlmIChhdG9taWNfZGVjX2FuZF90ZXN0KCZhcnJheS0+bnVt
X3BlbmRpbmcpKQ0KPiAgIAkJCQlyZXR1cm4gZmFsc2U7DQoNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
