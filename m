Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5758567E31
	for <lists+dri-devel@lfdr.de>; Sun, 14 Jul 2019 09:37:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B71A3898A3;
	Sun, 14 Jul 2019 07:37:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760053.outbound.protection.outlook.com [40.107.76.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A599F898A3;
 Sun, 14 Jul 2019 07:37:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N0M7A19PDzGas+MnHvWMWy3xPn72ra6sfpXQS44aKJTapqcISw7t4PTp7PHl6KSWxXr2Oim/YXrr5eTIkuhAg+/lIuRstz/9uCMrSMPtpoj/0fnZ82chVm5P+DVlPFlvD3MmyI5xjUeMHSqDdplB9ayqKorfq0Rg6GnZru1mRABblFKLyDoneqoEZT4x4CZp2hyVhQwRjwQKo49L14qdT1gTSlxN/v/BrYPweKFgerT+oO1EpQrTpuQ1X5b8F1r+RrT7yI2aQ86tFlhRGnVqBKf62NJBRh39XxnNohhqFr2II6v+jshzCGNXE57JAJP92aN9KUzMQ36+lcyxBfQo3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+dZWGQTE/Mbeff6u37+bRkPtZtbC2cF0PIJStLuXx5o=;
 b=Zhf88wDjtfnyRcwRd8wK6tbNxE7QV2itlmbns44GAiVvVRGZPVp2xVicgmqMBGIOj6oKz0tghTD6QgQP2ot9nJOWp8EFUVY+wCY6UGMvqQmeOHvTgBi4welinf1ktoyNL5nkX0Sx/cjjCts2VdM2xSQGGXh529bRq6a2n1aHizt6GdNZqAXYJZDnU5GkmZndlP8sGx94STowETr9BtPv/KeqsfRydkkM0CgMT7scoaYct0BW7RKAsV6WVwpIaWQp5IhewordnsRPqjh85qCEol9fIMgqATEhh/y+KU2oi5rFQL+b8aWSxRAd7Jnh5x2eQimrTSSLs3udoQFc6oW6Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1916.namprd12.prod.outlook.com (10.175.91.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Sun, 14 Jul 2019 07:37:47 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7%10]) with mapi id 15.20.2073.012; Sun, 14 Jul
 2019 07:37:47 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] dma-buf: Expand reservation_list to fill allocation
Thread-Topic: [PATCH 1/2] dma-buf: Expand reservation_list to fill allocation
Thread-Index: AQHVOIhFEu5c+pfcv0GCHwp5iNGpyKbJvPkA
Date: Sun, 14 Jul 2019 07:37:47 +0000
Message-ID: <d6d1b44d-bec1-6a46-bcd4-5790bf7b6347@amd.com>
References: <20190712080314.21018-1-chris@chris-wilson.co.uk>
In-Reply-To: <20190712080314.21018-1-chris@chris-wilson.co.uk>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0125.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::17) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 10cb50e6-07fe-4374-8be9-08d7082e2aa8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1916; 
x-ms-traffictypediagnostic: DM5PR12MB1916:
x-microsoft-antispam-prvs: <DM5PR12MB19163D367FD668850AB9E12C83CC0@DM5PR12MB1916.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0098BA6C6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(39860400002)(136003)(376002)(346002)(199004)(189003)(64126003)(52116002)(6116002)(58126008)(76176011)(66446008)(64756008)(8676002)(110136005)(46003)(6506007)(386003)(7736002)(68736007)(66556008)(31686004)(66476007)(66946007)(81166006)(6512007)(8936002)(186003)(6486002)(102836004)(478600001)(99286004)(14444005)(6436002)(256004)(53936002)(81156014)(446003)(229853002)(2501003)(2906002)(25786009)(11346002)(36756003)(31696002)(71200400001)(71190400001)(4326008)(54906003)(86362001)(65826007)(305945005)(5660300002)(316002)(66574012)(476003)(14454004)(486006)(65956001)(2616005)(6246003)(65806001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1916;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ba51RzmWoyPt+CRtIzuakEBcrKJY//ddhIhlvpTk35j9tLT7yBh8VBlYX/+EEEjUYGQ0MErkOPX2m16V8WERB+T3+5wpjZdlz1yiUUTfJODnCZiuP0nRCl4QOuhLcW27TNscOvCwqxZqDaR4+FiPpvYUJFHwTq+rNrNb1NOx/VZCnr1Tk7KsCDoggJJkfPQaz2y/c6ugAJOF2L8JRvWuxQMM7+gzl8lm0eFxlPt/GzgYxR9VT1j7vyj8cQBRAJyjN86cfGSP0yAMKS8AssIUe+fZUssVUwqIffWMwMUQcDn9W0bvXQD+Z9Nb7K3rJLmzf4/83U5Cwghpeu1NbAbzTiV0SD8+3HL+ac87UvVZ/8PVm5GL4Kcs0N7J7n8mdqALnkwTw5HVQYTkSpHi8+lvoQWpSWFNTep72GOOWnEYOlo=
Content-ID: <AFE1B974B202284583F6FD10E88FD82B@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10cb50e6-07fe-4374-8be9-08d7082e2aa8
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2019 07:37:47.7084 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1916
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+dZWGQTE/Mbeff6u37+bRkPtZtbC2cF0PIJStLuXx5o=;
 b=BA9pVrJVaJxmpN3/riS94p0QDSEqm52xhpSSFhGWxAdXP0wmpzGb1qhWTfFjWGrZExNLBZx6+lYhevH5Laa3LUbEZThuQvkjUJn0W7aQzycu0D2RPA1r3VdXZ5a+uVqawNXqTUj9eLSZBYzdjLnzDQgnrb9bZwUzqcru6CzwQeE=
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Daenzer, Michel" <Michel.Daenzer@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTIuMDcuMTkgdW0gMTA6MDMgc2NocmllYiBDaHJpcyBXaWxzb246DQo+IFNpbmNlIGttYWxs
b2MoKSB3aWxsIHJvdW5kIHVwIHRoZSBhbGxvY2F0aW9uIHRvIHRoZSBuZXh0IHNsYWIgc2l6ZSBv
cg0KPiBwYWdlLCBpdCB3aWxsIG5vcm1hbGx5IHJldHVybiBhIHBvaW50ZXIgdG8gYSBtZW1vcnkg
YmxvY2sgYmlnZ2VyIHRoYW4gd2UNCj4gYXNrZWQgZm9yLiBXZSBjYW4gcXVlcnkgZm9yIHRoZSBh
Y3R1YWwgc2l6ZSBvZiB0aGUgYWxsb2NhdGVkIGJsb2NrIHVzaW5nDQo+IGtzaXplKCkgYW5kIGV4
cGFuZCBvdXIgdmFyaWFibGUgc2l6ZSByZXNlcnZhdGlvbl9saXN0IHRvIHRha2UgYWR2YW50YWdl
DQo+IG9mIHRoYXQgZXh0cmEgc3BhY2UuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNv
biA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPg0KPiBDYzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPiBDYzogTWljaGVsIETDpG56ZXIgPG1pY2hlbC5kYWVu
emVyQGFtZC5jb20+DQoNClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4u
a29lbmlnQGFtZC5jb20+DQoNCkJUVzogSSB3YXMgd29uZGVyaW5nIGlmIHdlIHNob3VsZG4ndCBy
ZXBsYWNlIHRoZSByZXNlcnZhdGlvbl9vYmplY3RfbGlzdCANCndpdGggYSBkbWFfZmVuY2VfY2hh
aW4uDQoNClRoYXQgd291bGQgY29zdHMgdXMgYSBiaXQgbW9yZSBtZW1vcnkgYW5kIGlzIHNsaWdo
dGx5IHNsb3dlciBvbiBxdWVyeWluZyANCnRoZSBmZW5jZSBpbiB0aGUgY29udGFpbmVyLg0KDQpC
dXQgaXQgd291bGQgYmUgbXVjaCBmYXN0ZXIgb24gYWRkaW5nIG5ldyBmZW5jZXMgYW5kIG1hc3Np
dmVseSANCnNpbXBsaWZpZXMgd2FpdGluZyBvciByZXR1cm5pbmcgYWxsIGZlbmNlcyBjdXJyZW50
bHkgaW4gdGhlIGNvbnRhaW5lci4NCg0KQ2hyaXN0aWFuLg0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMv
ZG1hLWJ1Zi9yZXNlcnZhdGlvbi5jIHwgNiArKysrLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9k
bWEtYnVmL3Jlc2VydmF0aW9uLmMgYi9kcml2ZXJzL2RtYS1idWYvcmVzZXJ2YXRpb24uYw0KPiBp
bmRleCBhNmFjMmIzYTAxODUuLjgwZWNjMTI4M2QxNSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9k
bWEtYnVmL3Jlc2VydmF0aW9uLmMNCj4gKysrIGIvZHJpdmVycy9kbWEtYnVmL3Jlc2VydmF0aW9u
LmMNCj4gQEAgLTE1Myw3ICsxNTMsOSBAQCBpbnQgcmVzZXJ2YXRpb25fb2JqZWN0X3Jlc2VydmVf
c2hhcmVkKHN0cnVjdCByZXNlcnZhdGlvbl9vYmplY3QgKm9iaiwNCj4gICAJCQlSQ1VfSU5JVF9Q
T0lOVEVSKG5ldy0+c2hhcmVkW2orK10sIGZlbmNlKTsNCj4gICAJfQ0KPiAgIAluZXctPnNoYXJl
ZF9jb3VudCA9IGo7DQo+IC0JbmV3LT5zaGFyZWRfbWF4ID0gbWF4Ow0KPiArCW5ldy0+c2hhcmVk
X21heCA9DQo+ICsJCShrc2l6ZShuZXcpIC0gb2Zmc2V0b2YodHlwZW9mKCpuZXcpLCBzaGFyZWQp
KSAvDQo+ICsJCXNpemVvZigqbmV3LT5zaGFyZWQpOw0KPiAgIA0KPiAgIAlwcmVlbXB0X2Rpc2Fi
bGUoKTsNCj4gICAJd3JpdGVfc2VxY291bnRfYmVnaW4oJm9iai0+c2VxKTsNCj4gQEAgLTE2OSw3
ICsxNzEsNyBAQCBpbnQgcmVzZXJ2YXRpb25fb2JqZWN0X3Jlc2VydmVfc2hhcmVkKHN0cnVjdCBy
ZXNlcnZhdGlvbl9vYmplY3QgKm9iaiwNCj4gICAJCXJldHVybiAwOw0KPiAgIA0KPiAgIAkvKiBE
cm9wIHRoZSByZWZlcmVuY2VzIHRvIHRoZSBzaWduYWxlZCBmZW5jZXMgKi8NCj4gLQlmb3IgKGkg
PSBrOyBpIDwgbmV3LT5zaGFyZWRfbWF4OyArK2kpIHsNCj4gKwlmb3IgKGkgPSBrOyBpIDwgbWF4
OyArK2kpIHsNCj4gICAJCXN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlOw0KPiAgIA0KPiAgIAkJZmVu
Y2UgPSByY3VfZGVyZWZlcmVuY2VfcHJvdGVjdGVkKG5ldy0+c2hhcmVkW2ldLA0KDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
