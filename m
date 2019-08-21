Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD39297E13
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 17:07:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 607286E957;
	Wed, 21 Aug 2019 15:07:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700079.outbound.protection.outlook.com [40.107.70.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3185F6E957;
 Wed, 21 Aug 2019 15:07:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QshyLiW7xJe3XyKJN2rGOhb3GhBZAKSGo2dvY8hANG3LBYyLz2HQMNhw04Yh0roQKMjzOrp6R2+v8T/SVg3KkwaHm+6t9kZddYGdOFCJO2INtwxGLZdXTKpk0c081gGRtt3P/QIR29CEa+ujajKzopeIpTC4TL14KCuOyPNvhOWzLOD9AGOaTqIKiGlaiAZ6THFQlKsssdc664U5JpjIN5yPMEbQgicvnIgdymonQkrdt5ckk99VMf69yZz5zRpTyyA4MdmPT8QEpKVGIS0/ZxV+33s42SMlwPRq9V79pF9GGfpDk5wG3zld1FzcrGzbOdmqwZMi3m+yKfcBxp4Sbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fbc4P4w6DlDUVVVf+f6lY/aMfic59NeMCNRImgX9u0k=;
 b=coZqGACZZ2X89+voh6h5EKQ7wDK/tOUegtRKMCpnXThoVPAK78hHymZcmJy7z49XaK3LslGVslzXo1U+OcUY+vgC5/Xgb09Sn/OPZGcCb3oRyWfCHlD2sSdwg8nEjGft6PjYCqysnJae/g+ZQk/9psAQrio3DYnEQfzvOtvkw0pZg6p5Ppprp9hcG4tzbuJbheOmaTpgHeK42l+j/c9H7CRxRWsMyHgdDHpP+LMPiJCFg4u30yGSGxLVXHxJ2bYGUwUVNyRFIM5xQLJT78in9lXrm5NdEH7n2gfS7WJtXC38AJF1Ol9lUMYFSMwFyri6rghgZDJQsiDzt+DD0Pub1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1914.namprd12.prod.outlook.com (10.175.86.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Wed, 21 Aug 2019 15:07:43 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3%5]) with mapi id 15.20.2178.018; Wed, 21 Aug 2019
 15:07:43 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSk=?= <thomas_os@shipmail.org>
Subject: Re: [PATCH 3/3] drm/ttm: remove ttm_bo_wait_unreserved
Thread-Topic: [PATCH 3/3] drm/ttm: remove ttm_bo_wait_unreserved
Thread-Index: AQHVV2cW/tKRttrRtkmgCalTUTQrEacFjFAAgAACI4CAABbUgIAABRaAgAAFqgCAAAWAgA==
Date: Wed, 21 Aug 2019 15:07:43 +0000
Message-ID: <11384851-661b-d84f-ec79-08c325f0f11b@amd.com>
References: <20190820145336.15649-1-daniel.vetter@ffwll.ch>
 <20190820145336.15649-4-daniel.vetter@ffwll.ch>
 <a9190400-2414-8d83-0f37-61eb0f16504a@shipmail.org>
 <45aaf1ba-e8b8-d92e-7ae2-39ed746ffa3a@shipmail.org>
 <CAKMK7uE0Zp86jbGyWnNBOsGA=tiNAwYP8WqdH-AHEYthWPf7jw@mail.gmail.com>
 <2b1ac3ab-4a21-88cc-e518-90f675528ab4@shipmail.org>
 <CAKMK7uHEAkjneZ5k=XfuJ9hftErt7F_UOQoZaUQkpoDkBiCX+w@mail.gmail.com>
In-Reply-To: <CAKMK7uHEAkjneZ5k=XfuJ9hftErt7F_UOQoZaUQkpoDkBiCX+w@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0117.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::33) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b535a92e-bba2-4b41-7c2f-08d72649512d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM5PR12MB1914; 
x-ms-traffictypediagnostic: DM5PR12MB1914:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB191472864433D149DF00049B83AA0@DM5PR12MB1914.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0136C1DDA4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(346002)(376002)(39860400002)(366004)(199004)(189003)(4326008)(25786009)(6486002)(71190400001)(7736002)(11346002)(14454004)(2616005)(53936002)(446003)(76176011)(14444005)(46003)(476003)(99286004)(6246003)(66574012)(486006)(5660300002)(66446008)(66556008)(66476007)(31686004)(478600001)(66946007)(54906003)(52116002)(6436002)(81166006)(2906002)(36756003)(256004)(53546011)(64756008)(86362001)(102836004)(6506007)(8676002)(316002)(65806001)(386003)(65956001)(8936002)(81156014)(6116002)(186003)(110136005)(229853002)(58126008)(6512007)(31696002)(305945005)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1914;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: JPrlnvDx3PswzDcB8/+2VLrWSzNi9IEThuVT48yksQGpYlhF/Jc3By9dbNJo8di58MFll+EAlOglGvLzEIZ+uFIWzKIpRpWTJhkm8WJUAdBtZvjHXOJzyyu1u9feS9/ThWZxh42fPHwTY2bxOri5TuxiodKZvWsX7i+5lHlxAqwLvRM138qQsMiiVCLLXmpf+82VN3EiU+YtwQSj594EDvE2qczbb6Z4aXqvSPRXBFSvyo5vI+MYG3U2i63auEgUyffTZUnHo+6C7YFmbFthH+8l6jDnkmaeVSFxs51WFNQWYyEkN1Zd7+VH44HcJCb1XKa/IS/tN9cJWTnbQDKpZN832klBs0ZHgcm/b2Z8ywj4s8G+Z7bPY7GTWBVYERviXNHx4Sxczrz9ZZosFjdfZMT2EJOpiWVqF5PA1qthA+o=
Content-ID: <2E1C1E680459824AB6C64395D5C116AD@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b535a92e-bba2-4b41-7c2f-08d72649512d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2019 15:07:43.5406 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g0O7pD3qsOtlGJBan8/5JSwHHwIDUQm7RhWJQeW63UD1JkzDYqYXyj/wfRLz5ORG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1914
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fbc4P4w6DlDUVVVf+f6lY/aMfic59NeMCNRImgX9u0k=;
 b=h8cYSx5GBoswC9H/fTVIPHV9zzxeKoL4OD3KHoNVBPkvRb4sc0izloXl9qY9k32hN82bwdPMRZwF5uJBdeccu3Nnc0DwdRX1hH8QP/vzKXrZId51zQor9zSq+SKjA8/M3CcWgqlFl4ClhV0ZWAu7/oqE+B2LYDnTFEU2eLGU1Gc=
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, "Huang,
 Ray" <Ray.Huang@amd.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjEuMDguMTkgdW0gMTY6NDcgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBPbiBXZWQsIEF1
ZyAyMSwgMjAxOSBhdCA0OjI3IFBNIFRob21hcyBIZWxsc3Ryw7ZtIChWTXdhcmUpDQo+IDx0aG9t
YXNfb3NAc2hpcG1haWwub3JnPiB3cm90ZToNCj4+IE9uIDgvMjEvMTkgNDowOSBQTSwgRGFuaWVs
IFZldHRlciB3cm90ZToNCj4+PiBPbiBXZWQsIEF1ZyAyMSwgMjAxOSBhdCAyOjQ3IFBNIFRob21h
cyBIZWxsc3Ryw7ZtIChWTXdhcmUpDQo+Pj4gPHRob21hc19vc0BzaGlwbWFpbC5vcmc+IHdyb3Rl
Og0KPj4+PiBPbiA4LzIxLzE5IDI6NDAgUE0sIFRob21hcyBIZWxsc3Ryw7ZtIChWTXdhcmUpIHdy
b3RlOg0KPj4+Pj4gT24gOC8yMC8xOSA0OjUzIFBNLCBEYW5pZWwgVmV0dGVyIHdyb3RlOg0KPj4+
Pj4gW1NOSVBdDQo+PiBidXQgdG8ga2VlcCB0aGUgbW0gbGF0ZW5jeSBvcHRpbWl6YXRpb24gdXNp
bmcgdGhlIFJFVFJZIGZ1bmN0aW9uYWxpdHk6DQo+IFN0aWxsIG5vIGlkZWEgd2h5IHRoaXMgaXMg
bmVlZGVkPyBBbGwgdGhlIGNvbW1lbnRzIGhlcmUgYW5kIHRoZSBjb2RlDQo+IGFuZCBoaXN0b3J5
IHNlZW0gbGlrZSB0aGV5J3ZlIGJlZW4gYWJvdXQgdGhlIG1tYXBfc2VtIHZzIGRtYV9yZXN2DQo+
IGludmVyc2lvbiBiZXR3ZWVuIGRyaXZlciBpb2N0bHMgYW5kIGZhdWx0IGhhbmRsaW5nIGhlcmUu
IE9uY2UgdGhhdCdzDQo+IG9mZmljaWFsbHkgZml4ZWQgdGhlcmUncyBubyByZWFzb24gdG8gcGxh
eSBnYW1lcyBoZXJlIGFuZCByZXRyeSBsb29wcw0KPiAtIHByZXZpb3VzbHkgdGhhdCB3YXMgbmVj
ZXNzYXJ5IGJlY2F1c2UgdGhlIG9sZCB0dG1fYm9fdm1fZmF1bHQgaGFkIGENCj4gYnVzeSBzcGlu
IGFuZCB0aGF0J3MgZGVmaW5pdGVseSBub3QgbmljZS4gSWYgaXQncyBuZWVkZWQgSSB0aGluayBp
dA0KPiBzaG91bGQgYmUgYSBzZWNvbmQgcGF0Y2ggb24gdG9wLCB0byBrZWVwIHRoaXMgYWxsIGNs
ZWFyLiBJIGhhZCB0bw0KPiBhdWRpdCBhbiBlbm9ybW91cyBhbW91bnQgb2YgY29kZSwgSSdkIGxp
a2UgdG8gbWFrZSBzdXJlIEkgZGlkbid0IG1pc3MNCj4gYW55dGhpbmcgYmVmb3JlIHdlIHN0YXJ0
IHRvIG1ha2UgdGhpcyBzdXBlciBmYW5jeSBhZ2Fpbi4gRnVydGhlcg0KPiBwYXRjaGVzIG9uIHRv
cCBpcyBvYnZpb3VzbHkgYWxsIGZpbmUgd2l0aCBtZS4NCg0KSSB0aGluayB0aGlzIGlzIGp1c3Qg
YW4gb3B0aW1pemF0aW9uIHRvIG5vdCBob2xkIHRoZSBtbWFwX3NlbSB3aGlsZSANCndhaXRpbmcg
Zm9yIHRoZSBkbWFfcmVzdiBsb2NrLg0KDQpJIGFncmVlIHRoYXQgaXQgc2hvdWxkbid0IGJlIG5l
Y2Vzc2FyeSwgYnV0IG1heWJlIGl0J3MgYSBnb29kIGlkZWEgZm9yIA0KcGVyZm9ybWFuY2UuIEkn
bSBhbHNvIE9LIHdpdGggcmVtb3ZpbmcgaXQsIGNhdXNlIEknbSBub3Qgc3VyZSBpZiBpdCdzIA0K
d29ydGggaXQuDQoNCkJ1dCBUaG9tYXMgbm90ZWQgY29ycmVjdGx5IHRoYXQgd2Ugc2hvdWxkIHBy
b2JhYmx5IGRvIGl0IGluIGEgc2VwYXJhdGUgDQpwYXRjaCBzbyB0aGF0IHdoZW4gc29tZWJvZHkg
cG9pbnRzIG91dCAiSGV5IG15IHN5c3RlbSBpcyBzbG93ZXIgbm93ISIgDQpoZSdzIGFibGUgdG8g
YmlzZWN0IHRvIHRoZSBjaGFuZ2UuDQoNCkNocmlzdGlhbi4NCg0KPiAtRGFuaWVsDQo+DQo+PiBU
aGFua3MsDQo+PiBUaG9tYXMNCj4+DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
