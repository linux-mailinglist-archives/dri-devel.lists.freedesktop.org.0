Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C005DB2BF
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 18:48:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 728706EADB;
	Thu, 17 Oct 2019 16:48:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740074.outbound.protection.outlook.com [40.107.74.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18BB56EAD8
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 16:48:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P7QTIVjDN/YMr2FqdDxkx8Y3BKSkKAiWktGw6WRGdkl7lC4Z3HOYCeU9bN1ncMZUFoEfX1UwlxTqnmbVMskMUMvNnDSNHrNGm/wXAJ7KXRr7RtGw/BUmIErxILN/0bVJEnOfdXQTzR5IEzXj9AT7Gs8gk+pWC4BxKhFSOD6c5cWPslQEtYMQhBXa0w8/5JyNO8DbJIndYWyzSi2ZzXuUkrvsrSLv20rrxn0zMYiZNp4Si0LAXaUj2p1DaCZElmA5k+tiDN4xHCiXNuo4GGoY80dUXOjOFxA2d3DnH/DlHUmx49Mv+u6CnuijfGfR/VBNYtHlWCRzxmgrtXHQbIacqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQRJp5eAz7AEv7ww6sV2W7u6Gmc/4wrToAItnXSexQY=;
 b=L9FEM2oye4pjv3wxIMKiZKx3Bg6hM72THavnhHgpcq5JC+WEUesdN2N8H/UogOwIKXDwjUiwitx1d+G7E9FDhXCc3xT0hQ34dixmIHhJ8QLr/gJ2uwQ2VVlebDZE4WOrQJyCDM+56MbZIeG12Un5wXbHTe8RXYP36XMplle7uvMRGNe2hdnvjvsbqbZXMhzqsfnIbGm7VlWyF4rJi7z/RlivBIOkmhKBC4U4dIvnuXIXa5MNuD4EzfcqKlycj5lgvQXTuXgdtQaA474rpj/r/nkVg4Vn0TCkeS4HI0nddOo7LPJ54VrR6351C/QBBBmwY8Z8L/LP5yTrh/YlmZEnfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB2342.namprd12.prod.outlook.com (52.132.208.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Thu, 17 Oct 2019 16:48:00 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::7428:f6b3:a0b1:a02e]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::7428:f6b3:a0b1:a02e%10]) with mapi id 15.20.2347.023; Thu, 17 Oct
 2019 16:48:00 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v4 06/11] drm/ttm: factor out ttm_bo_mmap_vma_setup
Thread-Topic: [PATCH v4 06/11] drm/ttm: factor out ttm_bo_mmap_vma_setup
Thread-Index: AQHVhBgm8b1N9k1O9kyDrY9pK+JLoqddL1qAgAF+TYCAABdugIAAR/eA
Date: Thu, 17 Oct 2019 16:48:00 +0000
Message-ID: <7a96ca93-6a71-b895-88ea-2d590270814a@amd.com>
References: <20191016115203.20095-1-kraxel@redhat.com>
 <20191016115203.20095-7-kraxel@redhat.com>
 <c08921f8-8ae9-55aa-c472-6b660b96576b@amd.com>
 <398f5818-296d-67cc-2447-d3075187bf0c@amd.com>
 <20191017123019.ovnexoryrziwkj7d@sirius.home.kraxel.org>
In-Reply-To: <20191017123019.ovnexoryrziwkj7d@sirius.home.kraxel.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM4PR0701CA0035.eurprd07.prod.outlook.com
 (2603:10a6:200:42::45) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0f9cd71b-d427-4893-c693-08d75321c4f5
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR12MB2342:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB23426AEB6A6B0F2668624596836D0@DM5PR12MB2342.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2000;
x-forefront-prvs: 01930B2BA8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(39860400002)(346002)(136003)(396003)(189003)(199004)(76176011)(25786009)(386003)(486006)(66574012)(4744005)(446003)(11346002)(86362001)(476003)(186003)(46003)(8676002)(31696002)(31686004)(2616005)(54906003)(58126008)(316002)(6506007)(52116002)(6116002)(65806001)(65956001)(81156014)(7736002)(81166006)(102836004)(305945005)(99286004)(6916009)(2906002)(229853002)(6246003)(14454004)(66476007)(64756008)(36756003)(66556008)(256004)(6512007)(66946007)(4326008)(14444005)(66446008)(5660300002)(6436002)(71190400001)(71200400001)(6486002)(478600001)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2342;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UcCC+bXxwmNh+QWfDs1FGoQv4WAdWBYGVpYcfsqR+7zSVP46Evb08wpiCX+9ZCHpsokKZUToHDFiPDu++WM+bo1Fb/hTqvDZldEiie5QOjcXVZhJF4fQQleQWa+BtqUsqbreZXDrsnKY6E7ptFdqQBoB1W3crdDpnQ0Nb3ClS9+aax+Sgrc85/kuHHxPRIzvkV8ZSPc2PPE4MTa5bg4vOcUMHMuOxIjQy1jUBKUl0UWuGocUvlDgLrZt73YNnlfvTpYQgsMR32oVKLN9u5UXLNSNHaKlvrAt+JoDGJpojjKY+eQwuPHHB3LOJuPSPGgHuSewJzV7LNInm3MKZ986GHauUx+Vgtiq/5w7fJzZdTq0+NHGgQLNB8/9kQV+hDpzX4bX88c3fhgA1ItkJ5XWjPNez5eK1+5XpK0JCFYomPo=
Content-ID: <1A52F8E300677B468377CC3D5F098540@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f9cd71b-d427-4893-c693-08d75321c4f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2019 16:48:00.1911 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QlpnO25vnVioYwY/HJYG2RBSKpcA3mTYPHANpycaRlQiSxSiv+UoM7wicWoSX9E9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2342
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQRJp5eAz7AEv7ww6sV2W7u6Gmc/4wrToAItnXSexQY=;
 b=1e4UWc2ctFKV4RlgmWRPaGlMgr54Dy9cDpqKolOIjXCtIPkrh3eX5YYwFtUFx/0+1HNReMXlyTpNaYEiESLneC6kEIJLtvnhqHyIY8Uc2H3kjwFbAXAmIb1zHgxDkYitCz3bmEaVJ/mSXgRlzjkbKj1s8nouHGEyF1zoJaIpw2I=
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Huang,
 Ray" <Ray.Huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTcuMTAuMTkgdW0gMTQ6MzAgc2NocmllYiBHZXJkIEhvZmZtYW5uOg0KPiBPbiBUaHUsIE9j
dCAxNywgMjAxOSBhdCAxMTowNjozM0FNICswMDAwLCBLb2VuaWcsIENocmlzdGlhbiB3cm90ZToN
Cj4+IEFtIDE2LjEwLjE5IHVtIDE0OjE4IHNjaHJpZWIgQ2hyaXN0aWFuIEvDtm5pZzoNCj4+PiBB
bSAxNi4xMC4xOSB1bSAxMzo1MSBzY2hyaWViIEdlcmQgSG9mZm1hbm46DQo+Pj4+IEZhY3RvciBv
dXQgdHRtIHZtYSBzZXR1cCB0byBhIG5ldyBmdW5jdGlvbi4NCj4+Pj4gUmVkdWNlcyBjb2RlIGR1
cGxpY2F0aW9uIGEgYml0Lg0KPj4+Pg0KPj4+PiB2MjogZG9uJ3QgY2hhbmdlIHZtX2ZsYWdzICht
b3ZlZCB0byBzZXBhcmF0ZSBwYXRjaCkuDQo+Pj4+IHY0OiBtYWtlIHR0bV9ib19tbWFwX3ZtYV9z
ZXR1cCBzdGF0aWMuDQo+Pj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IEdlcmQgSG9mZm1hbm4gPGty
YXhlbEByZWRoYXQuY29tPg0KPj4+IFJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+IGZvciB0aGlzIG9uZQ0KPj4+IGFuZCAjNyBpbiB0aGUgc2Vy
aWVzLg0KPj4gQW55IG9iamVjdGlvbnMgdGhhdCBJIGFkZCB0aGVzZSB0d28gdG8gbXkgZHJtLXR0
bS1uZXh0IHB1bGwgcmVxdWVzdCBvcg0KPj4gZGlkIHlvdSB3YW50ZWQgdG8gbWVyZ2UgdGhhdCB0
aHJvdWdoIHNvbWUgb3RoZXIgdHJlZT8NCj4gUHVzaGVkIHNlcmllcyB0byBkcm0tbWlzYy1uZXh0
IGEgZmV3IG1pbnV0ZXMgYWdvIChiZWZvcmUgSSBzYXcgeW91ciBtYWlsKS4NCg0KTm8sIHByb2Js
ZW0uIFRoYXQgd29ya3MgZm9yIG1lIGFzIHdlbGwuDQoNCj4NCj4gY2hlZXJzLA0KPiAgICBHZXJk
DQo+DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
