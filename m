Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F00CC42B7
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 23:29:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 412B96E89F;
	Tue,  1 Oct 2019 21:29:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710058.outbound.protection.outlook.com [40.107.71.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6069E89F6E;
 Tue,  1 Oct 2019 21:29:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IGwa3GDTwbvfSOjS0CqsQPhiKXYfj/xuGcZzwNMlKLjJiQtVD67bARx714RT6UYBHPDyu5kcp1aMoiegVpZE2xgWmRioFwgeWRxc0+oobJzxjlkdJ2AFByvAzsFf6RxrE/nTvGEV9qOF520RPreTKeEdxGtuxIMObd9yVGTom7twVSdoYoIicFvthM5VEvwHBTf/wOyURDnIV63TilrnCeA59V7M32Vz3cI6ROdiNWYu3ZkEW9rN9L84bc/QbCpcJvIXTrUqJmUffiyVrq6AE2QP4VRNL1K8EhUJSekxVXgxZk87V2i4U+bhFUMA4JKPy4ykk+M70BeFfqvjTvGKcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p4AMzhDMWlIsMMyNikXEDNxRx9gyyR+NE3rUR7F8XmE=;
 b=nLg6Eul3JLaQMwAZqPx8j0Jjmli8CqPoEhkQEtDpSEUxqAY6W0j32jz6PNt3XL/6jOCnrdL7VeadyxfgHD7Q667U7fajwJhH04P4eNVcGdSu20NPMBxk+aqT9Bsjyc6wACaYzADhStYuc7+7gj1mgzw+qRQPw1QLDlHPWmmH4kcDOpjNsT+tMo04EQPzJetDmmTEEPBIRRsi4rkmTl3DGGymIU0KiLp7hTUYLfFmPu4XV+fZOTKv5/bulPfVwnrskERDgABSDDXozPM5qK5+VBbbZ+WcCUUT1ukwF9eAwYstPTIsrUD73hicbXxlm5Hfv4KQV+meveS5FnegRMrnBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB2456.namprd12.prod.outlook.com (52.132.141.37) by
 DM5PR12MB1258.namprd12.prod.outlook.com (10.168.239.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 21:29:30 +0000
Received: from DM5PR12MB2456.namprd12.prod.outlook.com
 ([fe80::3449:def:4457:5b72]) by DM5PR12MB2456.namprd12.prod.outlook.com
 ([fe80::3449:def:4457:5b72%3]) with mapi id 15.20.2305.022; Tue, 1 Oct 2019
 21:29:30 +0000
From: "Liu, Leo" <Leo.Liu@amd.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Zhou, David(ChunMing)" <David1.Zhou@amd.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/amdgpu: fix structurally dead code vcn_v2_5_hw_init
Thread-Topic: [PATCH] drm/amdgpu: fix structurally dead code vcn_v2_5_hw_init
Thread-Index: AQHVeHwU+1a8umxE5EyQDrqeTbYcDKdGTaMA
Date: Tue, 1 Oct 2019 21:29:30 +0000
Message-ID: <192815d9-5ecb-09a7-4624-5fd36126890d@amd.com>
References: <20191001171635.GA17306@embeddedor>
In-Reply-To: <20191001171635.GA17306@embeddedor>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YT1PR01CA0027.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::40)
 To DM5PR12MB2456.namprd12.prod.outlook.com
 (2603:10b6:4:b4::37)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 01a85e82-c2a3-4ff9-8742-08d746b67198
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR12MB1258:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB12589C24E218E36CA52D7593E59D0@DM5PR12MB1258.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(136003)(39860400002)(376002)(346002)(189003)(199004)(7736002)(6116002)(3846002)(64756008)(86362001)(66066001)(66556008)(305945005)(71190400001)(71200400001)(4326008)(99286004)(31696002)(52116002)(54906003)(110136005)(316002)(58126008)(76176011)(65956001)(36756003)(65806001)(66476007)(81156014)(8936002)(8676002)(81166006)(66446008)(31686004)(6506007)(2906002)(386003)(66946007)(5660300002)(486006)(6512007)(478600001)(256004)(14444005)(2616005)(446003)(476003)(11346002)(26005)(102836004)(186003)(6246003)(25786009)(229853002)(6436002)(6486002)(14454004)(53546011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1258;
 H:DM5PR12MB2456.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZJm9qOeDMFcJKOvmd4a3cTbhwHtfkxXMfWZgR4p9lzjEJ7oMcxl6uFooMaPnG+3jNK6CgCeiw90qXdxfG/Q13v9Worey/ow2wvyobIeQk/V0zxLvomnx3zsKfus+0nJtERHk0TikViVoBnzay7kU+aoLRS9gYoAs+b9CT6gW1Ckz8eEdeG9u2QAElIOJI0u8im7SnQFzJWrzcv1/IJqqXn6OZZxFETVpTT0OzrTfEmkNkpYLR+1jsR/H9el3x8TfX9hEpD7O+JtLcBD4xC0Fg63yc2ZxhU1ah25SEfO3fawmy3gXGGktNrW7XhiqoX4KkVtD6DeUR41OZcyzysI6F6DurE4q8oBpaiyEQfVGVnjOZvKW0uRJi/KJ3BS7dRNPnJjWPDvniew3HPoeZLsVhfZ2JU6C9QctGg43Ozr63o8=
Content-ID: <ECA8B4F795D59A4F98CD32414F5655B4@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01a85e82-c2a3-4ff9-8742-08d746b67198
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 21:29:30.1997 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rxyDzWZCn1kd4na7lOjAszKBTvpFE2t8Vq2+jpCLS3Mbc/VzPkRHc7ggtsazFIMS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1258
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p4AMzhDMWlIsMMyNikXEDNxRx9gyyR+NE3rUR7F8XmE=;
 b=3HkkubYV7FHzZVEyAEL9+Ozk1qgwsIg9iHqyYwqLanHJFKVQPBHGVCGaZ2bCnCqz7MRS4zt3rUhky3ZJgZwyvMXzS0CZQLciSveSt/OwawlP1joYPjn0oGi7ERAf8uAmuMVmVcPQI2+2Dqcut4ynGljpBzLP4bpXXmuykUSW6Gc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Leo.Liu@amd.com; 
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
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQpPbiAyMDE5LTEwLTAxIDE6MTYgcC5tLiwgR3VzdGF2byBBLiBSLiBTaWx2YSB3cm90ZToNCj4g
Tm90aWNlIHRoYXQgdGhlcmUgaXMgYSAqY29udGludWUqIHN0YXRlbWVudCBpbiB0aGUgbWlkZGxl
IG9mIHRoZQ0KPiBmb3IgbG9vcCBhbmQgdGhhdCBwcmV2ZW50cyB0aGUgY29kZSBiZWxvdyBmcm9t
IGV2ZXIgYmVpbmcgcmVhY2hlZDoNCj4NCj4gCXIgPSBhbWRncHVfcmluZ190ZXN0X3Jpbmcocmlu
Zyk7DQo+IAlpZiAocikgew0KPiAJCXJpbmctPnNjaGVkLnJlYWR5ID0gZmFsc2U7DQo+IAkJZ290
byBkb25lOw0KPiAJfQ0KPg0KPiBGaXggdGhpcyBieSByZW1vdmluZyB0aGUgY29udGludWUgc3Rh
dGVtZW50IGFuZCB1cGRhdGluZyByaW5nLT5zY2hlZC5yZWFkeQ0KPiB0byB0cnVlIGJlZm9yZSBj
YWxsaW5nIGFtZGdwdV9yaW5nX3Rlc3RfcmluZyhyaW5nKS4NCj4NCj4gTm90aWNlIHRoYXQgdGhp
cyBmaXggaXMgYmFzZWQgb24NCj4gY29tbWl0IDFiNjFkZTQ1ZGZhZiAoImRybS9hbWRncHU6IGFk
ZCBpbml0aWFsIFZDTjIuMCBzdXBwb3J0ICh2MikiKQ0KPg0KPiBBZGRyZXNzZXMtQ292ZXJpdHkt
SUQgMTQ4NTYwOCAoIlN0cnVjdHVyYWxseSBkZWFkIGNvZGUiKQ0KPiBGaXhlczogMjhjMTdkNzIw
NzJiICgiZHJtL2FtZGdwdTogYWRkIFZDTjIuNSBiYXNpYyBzdXBwb3J0cyIpDQo+IFNpZ25lZC1v
ZmYtYnk6IEd1c3Rhdm8gQS4gUi4gU2lsdmEgPGd1c3Rhdm9AZW1iZWRkZWRvci5jb20+DQo+IC0t
LQ0KPg0KPiBBbnkgZmVlZGJhY2sgaXMgZ3JlYXRseSBhcHByZWNpYXRlZC4NCj4NCj4gICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfNS5jIHwgNSArKystLQ0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfNS5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvdmNuX3YyXzUuYw0KPiBpbmRleCAzOTVjMjI1OWY5NzkuLjQ3YjBkY2Q1OWUx
MyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzUuYw0K
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfNS5jDQo+IEBAIC0yNTgs
NiArMjU4LDcgQEAgc3RhdGljIGludCB2Y25fdjJfNV9od19pbml0KHZvaWQgKmhhbmRsZSkNCj4g
ICAJCWFkZXYtPm5iaW9fZnVuY3MtPnZjbl9kb29yYmVsbF9yYW5nZShhZGV2LCByaW5nLT51c2Vf
ZG9vcmJlbGwsDQo+ICAgCQkJCQkJICAgICByaW5nLT5kb29yYmVsbF9pbmRleCwgaik7DQo+ICAg
DQo+ICsJCXJpbmctPnNjaGVkLnJlYWR5ID0gdHJ1ZTsNCg0KVGhpcyBpcyByZWR1bmRhbnQuIGFs
bCB0aGUgc2NoZWQtPnJlYWR5IGlzIGluaXRpYWxpemVkIGFzIHRydWUsIHBsZWFzZSANCnJlZmVy
IHRvIGRybV9zY2hlZF9pbml0KCkNCg0KDQo+ICAgCQlyID0gYW1kZ3B1X3JpbmdfdGVzdF9yaW5n
KHJpbmcpOw0KPiAgIAkJaWYgKHIpIHsNCj4gICAJCQlyaW5nLT5zY2hlZC5yZWFkeSA9IGZhbHNl
Ow0KPiBAQCAtMjY2LDggKzI2Nyw3IEBAIHN0YXRpYyBpbnQgdmNuX3YyXzVfaHdfaW5pdCh2b2lk
ICpoYW5kbGUpDQo+ICAgDQo+ICAgCQlmb3IgKGkgPSAwOyBpIDwgYWRldi0+dmNuLm51bV9lbmNf
cmluZ3M7ICsraSkgew0KPiAgIAkJCXJpbmcgPSAmYWRldi0+dmNuLmluc3Rbal0ucmluZ19lbmNb
aV07DQo+IC0JCQlyaW5nLT5zY2hlZC5yZWFkeSA9IGZhbHNlOw0KPiAtCQkJY29udGludWU7DQo+
ICsJCQlyaW5nLT5zY2hlZC5yZWFkeSA9IHRydWU7DQoNCkJlY2F1c2UgdGhlIFZDTiAyLjUgRlcg
c3RpbGwgaGFzIGlzc3VlIGZvciBlbmNvZGUsIHNvIHdlIGhhdmUgaXQgDQpkaXNhYmxlZCBoZXJl
Lg0KDQoNClJlZ2FyZHMsDQoNCkxlbw0KDQoNCg0KDQo+ICAgCQkJciA9IGFtZGdwdV9yaW5nX3Rl
c3RfcmluZyhyaW5nKTsNCj4gICAJCQlpZiAocikgew0KPiAgIAkJCQlyaW5nLT5zY2hlZC5yZWFk
eSA9IGZhbHNlOw0KPiBAQCAtMjc2LDYgKzI3Niw3IEBAIHN0YXRpYyBpbnQgdmNuX3YyXzVfaHdf
aW5pdCh2b2lkICpoYW5kbGUpDQo+ICAgCQl9DQo+ICAgDQo+ICAgCQlyaW5nID0gJmFkZXYtPnZj
bi5pbnN0W2pdLnJpbmdfanBlZzsNCj4gKwkJcmluZy0+c2NoZWQucmVhZHkgPSB0cnVlOw0KPiAg
IAkJciA9IGFtZGdwdV9yaW5nX3Rlc3RfcmluZyhyaW5nKTsNCj4gICAJCWlmIChyKSB7DQo+ICAg
CQkJcmluZy0+c2NoZWQucmVhZHkgPSBmYWxzZTsNCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
