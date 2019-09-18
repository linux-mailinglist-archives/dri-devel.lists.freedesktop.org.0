Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A0BB691F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 19:31:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F5E06F41A;
	Wed, 18 Sep 2019 17:31:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760083.outbound.protection.outlook.com [40.107.76.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B3626F41A;
 Wed, 18 Sep 2019 17:31:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I5wqiLQaieEjBKMwlcvEt/qn2xoEd8640ahWjYxKhb8FfPAIsna9613zOruO6AX0/sooY3WLz4QoGm1xPAHV7B9XbSsplzwtTgR7Y1rpjQawM+H1F4V8MVTJXkpDumZE2/M3sgyJvhN4SayelBNcehPIfsYKyQYP5xbCET17mX7kTLp13EtAhRJcPD/SeFetTSMwldyWKlAdrHSE2X+RUokvJr9Z9EDMZvg4KJIKIdzzENnDQ73So4wvdXg5XQTChBRi67LOMHyArJ2AFpAQkYbRjFSk7mVwY9OlbWRYS16a8khJj9Frw3ndRXxIQgt3RZPbwS/f2n4Vhc5XpUa4NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3y/oRCuyq14oEYLl96e8p1ZW5mOoAD13REJc4BRDPU=;
 b=IPMAhtMrW/r0RE9MI35MckB/93CQ1TDk89JuVWkDjI7i5GqpBhGIpnAEaHzT4DwJ5AAkexdpxFwBHZYj9bf8+R/x5P/+vDW4CRpCdLB5Cl9b3U+nElW/qzktH2chdiHyZIHD3xgy4kiw+gYQAJUHWlJBWS1R76FqXICft+SrV3+J7OetJv1rmuLyum4rjMcVAXTkbJAbgYJickCNfVOKLNUDAxXO7JDFi4LKO1jmiTNX4OpcTkorbZeMisSS+HyKBaHp6SS5wzw/fhpHxFh8BBLSixmQroofAc3qryS8cLzS32gzXdeJ0ehagCPgAkrk5OqSadRIjG8Q6jgfJnQFFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1627.namprd12.prod.outlook.com (10.172.40.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.15; Wed, 18 Sep 2019 17:31:49 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc%8]) with mapi id 15.20.2263.023; Wed, 18 Sep 2019
 17:31:49 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Navid Emamdoost <navid.emamdoost@gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix multiple memory leaks
Thread-Topic: [PATCH] drm/amdgpu: fix multiple memory leaks
Thread-Index: AQHVbjuE/MfZwEKPBUCH6bgJ2zCCjKcxsWcA
Date: Wed, 18 Sep 2019 17:31:49 +0000
Message-ID: <7bab24ff-ded7-9f76-ba25-efd07cdd30dd@amd.com>
References: <20190918160943.14105-1-navid.emamdoost@gmail.com>
In-Reply-To: <20190918160943.14105-1-navid.emamdoost@gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM3PR07CA0058.eurprd07.prod.outlook.com
 (2603:10a6:207:4::16) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c656e406-b8d0-4a70-f2e4-08d73c5e1615
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM5PR12MB1627; 
x-ms-traffictypediagnostic: DM5PR12MB1627:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB162710F0B6DCA61B9AE61EE6838E0@DM5PR12MB1627.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 01644DCF4A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(136003)(366004)(376002)(396003)(189003)(199004)(14444005)(4326008)(256004)(305945005)(6506007)(58126008)(229853002)(7736002)(102836004)(64756008)(76176011)(65956001)(66446008)(71190400001)(31696002)(71200400001)(66476007)(52116002)(7416002)(476003)(25786009)(386003)(11346002)(66946007)(14454004)(6486002)(54906003)(31686004)(99286004)(316002)(81166006)(2616005)(36756003)(6436002)(5660300002)(2906002)(65806001)(66556008)(8676002)(86362001)(6916009)(6246003)(186003)(478600001)(486006)(8936002)(446003)(6116002)(6512007)(81156014)(46003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1627;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kjs2I2AVO3ktgX/o2TJ0kEzZX+TmZhxyp1DCbeE8Sjqty8DLh9ni90tDgcrcJeaDkfZlhGlcf+7APRIUjmzRimIcOeTzwnmMWjiCuZja6sif3jwuK1pjKaKr+9gsPXwYYRfk7e8IdKS97tpI4twcTASrdgWvOyiuzDc/vtS5OkJRIHsRv3vmyaAzrTXgNES9oSw5LLh/73nJUY+JRxlqL5MbvbSSpbN0pF13k4crxEOjNax7BGmveb1fERVU26kWdFtnzLAHPu4xsAz2BfGFXkR7jAZ0d7LLbeT/LJf2CQHJUL2KeBLLeN7oCrvtoFI1fBJILDlEuNLQsDdVCu36najEWKXci+0Oe5xL7E9fMqwlpBSKB+h5w36+8AJ0kGMcKGXI+Q+k8QGXFSm+FXoLs1KeHMaQJPmzRMS2zCnP2XA=
Content-ID: <A1D71F5F5C135646B97850C5FC00E050@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c656e406-b8d0-4a70-f2e4-08d73c5e1615
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2019 17:31:49.4502 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DOOMeh0k3509s2NT3XU298xigJwBTV/4VIVcJ0dasiq36rFIcgXrMOdWCuhvCBdG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1627
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3y/oRCuyq14oEYLl96e8p1ZW5mOoAD13REJc4BRDPU=;
 b=ycKfHT7XgDhWlHrTGk4VcRUVtCEZu6sINy0bxkhmGacZrE3PoT1x9+CiyDF1GAzSSXHwlGxJI1rbTIXlD3PoXQWW0/KPE0JwxDCS/atwLxNiZruO6RAFSw/N/y/3MS8PNQXH1HlMCBZ9SAyPP2gwmUtPwY+SspBGv0+9yh/4Bxo=
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
Cc: David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 "kjlu@umn.edu" <kjlu@umn.edu>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "emamd001@umn.edu" <emamd001@umn.edu>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "smccaman@umn.edu" <smccaman@umn.edu>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Rex Zhu <Rex.Zhu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTguMDkuMTkgdW0gMTg6MDkgc2NocmllYiBOYXZpZCBFbWFtZG9vc3Q6DQo+IEluIGFjcF9o
d19pbml0IHRoZXJlIGFyZSBzb21lIGFsbG9jYXRpb25zIHRoYXQgbmVlZHMgdG8gYmUgcmVsZWFz
ZWQgaW4NCj4gY2FzZSBvZiBmYWlsdXJlOg0KPg0KPiAxLSBhZGV2LT5hY3AuYWNwX2dlbnBkIHNo
b3VsZCBiZSByZWxlYXNlZCBpZiBhbnkgYWxsb2NhdGlvbiBhdHRlbXAgZm9yDQo+IGFkZXYtPmFj
cC5hY3BfY2VsbCwgYWRldi0+YWNwLmFjcF9yZXMgb3IgaTJzX3BkYXRhIGZhaWxzLg0KPiAyLSBh
bGwgb2YgdGhvc2UgYWxsb2NhdGlvbnMgc2hvdWxkIGJlIHJlbGVhc2VkIGlmIHBtX2dlbnBkX2Fk
ZF9kZXZpY2UNCj4gZmFpbHMuDQoNCkdvb2QgY2F0Y2gsIGJ1dCBwbGVhc2UgdXNlIGdvdG8gZXJy
b3IgaGFuZGxpbmcgaW5zdGVhZCBvZiBhZGRpbmcgbW9yZSANCmFuZCBtb3JlIGtmcmVlIGNhbGxz
Lg0KDQpSZWdhcmRzLA0KQ2hyaXN0aWFuLg0KDQo+DQo+IFNpZ25lZC1vZmYtYnk6IE5hdmlkIEVt
YW1kb29zdCA8bmF2aWQuZW1hbWRvb3N0QGdtYWlsLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FjcC5jIHwgMTAgKysrKysrKysrLQ0KPiAgIDEgZmls
ZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4NCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hY3AuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hY3AuYw0KPiBpbmRleCBlYmE0MmM3NTJiY2EuLmRkM2Zh
ODViMTFjNSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2FjcC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hY3AuYw0K
PiBAQCAtMjMxLDE3ICsyMzEsMjEgQEAgc3RhdGljIGludCBhY3BfaHdfaW5pdCh2b2lkICpoYW5k
bGUpDQo+ICAgCWFkZXYtPmFjcC5hY3BfY2VsbCA9IGtjYWxsb2MoQUNQX0RFVlMsIHNpemVvZihz
dHJ1Y3QgbWZkX2NlbGwpLA0KPiAgIAkJCQkJCQlHRlBfS0VSTkVMKTsNCj4gICANCj4gLQlpZiAo
YWRldi0+YWNwLmFjcF9jZWxsID09IE5VTEwpDQo+ICsJaWYgKGFkZXYtPmFjcC5hY3BfY2VsbCA9
PSBOVUxMKSB7DQo+ICsJCWtmcmVlKGFkZXYtPmFjcC5hY3BfZ2VucGQpOw0KPiAgIAkJcmV0dXJu
IC1FTk9NRU07DQo+ICsJfQ0KPiAgIA0KPiAgIAlhZGV2LT5hY3AuYWNwX3JlcyA9IGtjYWxsb2Mo
NSwgc2l6ZW9mKHN0cnVjdCByZXNvdXJjZSksIEdGUF9LRVJORUwpOw0KPiAgIAlpZiAoYWRldi0+
YWNwLmFjcF9yZXMgPT0gTlVMTCkgew0KPiArCQlrZnJlZShhZGV2LT5hY3AuYWNwX2dlbnBkKTsN
Cj4gICAJCWtmcmVlKGFkZXYtPmFjcC5hY3BfY2VsbCk7DQo+ICAgCQlyZXR1cm4gLUVOT01FTTsN
Cj4gICAJfQ0KPiAgIA0KPiAgIAlpMnNfcGRhdGEgPSBrY2FsbG9jKDMsIHNpemVvZihzdHJ1Y3Qg
aTJzX3BsYXRmb3JtX2RhdGEpLCBHRlBfS0VSTkVMKTsNCj4gICAJaWYgKGkyc19wZGF0YSA9PSBO
VUxMKSB7DQo+ICsJCWtmcmVlKGFkZXYtPmFjcC5hY3BfZ2VucGQpOw0KPiAgIAkJa2ZyZWUoYWRl
di0+YWNwLmFjcF9yZXMpOw0KPiAgIAkJa2ZyZWUoYWRldi0+YWNwLmFjcF9jZWxsKTsNCj4gICAJ
CXJldHVybiAtRU5PTUVNOw0KPiBAQCAtMzQ4LDYgKzM1MiwxMCBAQCBzdGF0aWMgaW50IGFjcF9o
d19pbml0KHZvaWQgKmhhbmRsZSkNCj4gICAJCXIgPSBwbV9nZW5wZF9hZGRfZGV2aWNlKCZhZGV2
LT5hY3AuYWNwX2dlbnBkLT5ncGQsIGRldik7DQo+ICAgCQlpZiAocikgew0KPiAgIAkJCWRldl9l
cnIoZGV2LCAiRmFpbGVkIHRvIGFkZCBkZXYgdG8gZ2VucGRcbiIpOw0KPiArCQkJa2ZyZWUoYWRl
di0+YWNwLmFjcF9nZW5wZCk7DQo+ICsJCQlrZnJlZShhZGV2LT5hY3AuYWNwX3Jlcyk7DQo+ICsJ
CQlrZnJlZShhZGV2LT5hY3AuYWNwX2NlbGwpOw0KPiArCQkJa2ZyZWUoaTJzX3BkYXRhKTsNCj4g
ICAJCQlyZXR1cm4gcjsNCj4gICAJCX0NCj4gICAJfQ0KDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
