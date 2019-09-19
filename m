Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E00B74B2
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 10:03:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 983C76FB3C;
	Thu, 19 Sep 2019 08:03:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760089.outbound.protection.outlook.com [40.107.76.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 422626FB37;
 Thu, 19 Sep 2019 08:03:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J/xycMhbtgIMTS53qgO1axi1M7dkjB+2WyJZzLhJNw7hJVK+VzMIbVsLs0PNwxBVhqC3m9HAjPKAZnRxUc/Dozmi2O6NRse7hKikET5WvFwxW2ETCGh+923sCpIcWRiCzM4NWeS7f8WnnmmnCzBIiNnocCM8N26Iui8n81gLbaJiM9NX6jRjZvkR4OWEHn+vedp9UOukua6UDL2cKXGcQDVwj4yInxEr21A8RMz2wQlk9HCqcWJ+qczxVZLv1yLeHj3536XIikgBgSIq4Tfl4/1cjtQmaiGU+Wv6kSsJPHFO/ckeR+KOVv5+uimqOPB86KDrsrcwnFHubmsKxc3xrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HphsLqg/38JqnGTJHayzeYk6SMrf+Ax8rwlOFcDcrKc=;
 b=KOWKmbzwGjd9RGpzEty6LrKqwfWGM+YgWkGt7CbEmFqMIWnukJvR5Kxxn8wAwQ+3JOKDV8SJY6ox1PUpUhY1GA80YDyeVfcPrOsVEbTnwvG6OocOCaKPBbRBVIqKcaya7rCcEQVIbHNY8ZiJQhq4l2jNZvVG9mCqtYT7918h72XzblTd2szzGgwzZrbYfxIMY+ImCaBPnfD0Uch7z+hFZx2usxLhOPclyCXoccV5hDjIr7wCl5UCb8w05d1TnovmjfIFJYIT18Y7fXp6LK3BQHorfR6g++cD8PRZIOKZuSbD3H+lbC0srxNlebSJkjnHyveggf4osXTqRx7yGKHpuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1129.namprd12.prod.outlook.com (10.168.240.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.21; Thu, 19 Sep 2019 08:03:33 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc%8]) with mapi id 15.20.2263.023; Thu, 19 Sep 2019
 08:03:33 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Navid Emamdoost <navid.emamdoost@gmail.com>
Subject: Re: [PATCH v2] drm/amdgpu: fix multiple memory leaks
Thread-Topic: [PATCH v2] drm/amdgpu: fix multiple memory leaks
Thread-Index: AQHVblQS6/8T9OuguEStJ7+but2+fKcypL4A
Date: Thu, 19 Sep 2019 08:03:33 +0000
Message-ID: <88fc639a-32ed-b6c6-f930-552083d5887d@amd.com>
References: <7bab24ff-ded7-9f76-ba25-efd07cdd30dd@amd.com>
 <20190918190529.17298-1-navid.emamdoost@gmail.com>
In-Reply-To: <20190918190529.17298-1-navid.emamdoost@gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM0PR02CA0070.eurprd02.prod.outlook.com
 (2603:10a6:208:d2::47) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: da2ebdc5-fb40-4f8c-3090-08d73cd7ddd4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM5PR12MB1129; 
x-ms-traffictypediagnostic: DM5PR12MB1129:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1129ECACC390AA148111649983890@DM5PR12MB1129.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(136003)(39860400002)(396003)(346002)(189003)(199004)(8676002)(66556008)(66476007)(6436002)(66446008)(99286004)(58126008)(66946007)(54906003)(4326008)(446003)(76176011)(486006)(52116002)(36756003)(11346002)(476003)(5660300002)(81156014)(2616005)(6916009)(186003)(7416002)(14444005)(81166006)(316002)(65956001)(31696002)(71200400001)(8936002)(86362001)(65806001)(478600001)(64756008)(46003)(6246003)(2906002)(25786009)(7736002)(6486002)(6506007)(71190400001)(256004)(31686004)(305945005)(6116002)(102836004)(6512007)(14454004)(229853002)(386003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1129;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: I134z/Keovx4rdHjOw/0d6Uf1AvQbTFH8eoDtfnouIONg3/xbGrbrdsONLzRtxmXkeJOuailvB1QKVqnn2gj4aCP9KGBgkdqwks5wfG+SjVfFtmTJ3XeXNR7mXIQV3Mg9kKtZo5mxcPJnBBms0iIkk8+thVYSO10TqDfiPb5u+LfWFfrl+l537TEsJiqygfkaDG5PHeCCDy8p+H+7Zfo1bYZU2iwma/jUuVlwOrzDMd3cPH058JhW3A9M9jgRkxJeewh995aCwg3VHndYV5PxUWtPckkJSq5qM2g0SwPwX4gncZl5O8Br8V3ggifeMMX5eZjhVL6CdPy+3iHK8QFBKrRTWa/FprKQ1uLnWPm8J/Lua1pVijBwbxSgZda5W7pmSNnSheUg32hPg6Ba4VhTmj802UtM/eCIkWki1omw3U=
Content-ID: <F1BEACD7F4E4B94984DC28A890D89C7E@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da2ebdc5-fb40-4f8c-3090-08d73cd7ddd4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 08:03:33.6469 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wBSdV3XmwdZucqxSpN1UPy2I79hwglb9yQXBMT3X3pmPZYGAo13g3wx11fYNUYXR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1129
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HphsLqg/38JqnGTJHayzeYk6SMrf+Ax8rwlOFcDcrKc=;
 b=iuRA5fYSJsEYl2nbVmFQxcT3lpqs/kclt1zTwv6lTVhu9Bqu4WfUrM2/hfBP9u8W/QMbQfWgeSOV88w0B6RnMu5vWOF46Tb8NdeM4LMssDdP2QhRXLU00JIxDmUhilJ31xc9vum+aa/ZVW7eDYVkfrYtYGHqzrUsLQ7fGiGWU4Q=
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

QW0gMTguMDkuMTkgdW0gMjE6MDUgc2NocmllYiBOYXZpZCBFbWFtZG9vc3Q6DQo+IEluIGFjcF9o
d19pbml0IHRoZXJlIGFyZSBzb21lIGFsbG9jYXRpb25zIHRoYXQgbmVlZHMgdG8gYmUgcmVsZWFz
ZWQgaW4NCj4gY2FzZSBvZiBmYWlsdXJlOg0KPg0KPiAxLSBhZGV2LT5hY3AuYWNwX2dlbnBkIHNo
b3VsZCBiZSByZWxlYXNlZCBpZiBhbnkgYWxsb2NhdGlvbiBhdHRlbXAgZm9yDQo+IGFkZXYtPmFj
cC5hY3BfY2VsbCwgYWRldi0+YWNwLmFjcF9yZXMgb3IgaTJzX3BkYXRhIGZhaWxzLg0KPiAyLSBh
bGwgb2YgdGhvc2UgYWxsb2NhdGlvbnMgc2hvdWxkIGJlIHJlbGVhc2VkIGlmIHBtX2dlbnBkX2Fk
ZF9kZXZpY2UNCj4gZmFpbHMuDQo+DQo+IHYyOiBtb3ZlZCB0aGUgcmVsZWFzZWQgaW50byBnb3Rv
IGVycm9yIGhhbmRsaW5ncw0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBOYXZpZCBFbWFtZG9vc3QgPG5h
dmlkLmVtYW1kb29zdEBnbWFpbC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9hY3AuYyB8IDMwICsrKysrKysrKysrKysrKysrLS0tLS0tLS0NCj4gICAx
IGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkNCj4NCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hY3AuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hY3AuYw0KPiBpbmRleCBlYmE0MmM3NTJiY2Eu
LmMwZGI3NWI3MTg1OSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2FjcC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9h
Y3AuYw0KPiBAQCAtMTg0LDcgKzE4NCw3IEBAIHN0YXRpYyBzdHJ1Y3QgZGV2aWNlICpnZXRfbWZk
X2NlbGxfZGV2KGNvbnN0IGNoYXIgKmRldmljZV9uYW1lLCBpbnQgcikNCj4gICAgKi8NCj4gICBz
dGF0aWMgaW50IGFjcF9od19pbml0KHZvaWQgKmhhbmRsZSkNCj4gICB7DQo+IC0JaW50IHIsIGk7
DQo+ICsJaW50IHIsIGksIHJldDsNCj4gICAJdWludDY0X3QgYWNwX2Jhc2U7DQo+ICAgCXUzMiB2
YWwgPSAwOw0KPiAgIAl1MzIgY291bnQgPSAwOw0KPiBAQCAtMjMxLDIwICsyMzEsMjEgQEAgc3Rh
dGljIGludCBhY3BfaHdfaW5pdCh2b2lkICpoYW5kbGUpDQo+ICAgCWFkZXYtPmFjcC5hY3BfY2Vs
bCA9IGtjYWxsb2MoQUNQX0RFVlMsIHNpemVvZihzdHJ1Y3QgbWZkX2NlbGwpLA0KPiAgIAkJCQkJ
CQlHRlBfS0VSTkVMKTsNCj4gICANCj4gLQlpZiAoYWRldi0+YWNwLmFjcF9jZWxsID09IE5VTEwp
DQo+IC0JCXJldHVybiAtRU5PTUVNOw0KPiArCWlmIChhZGV2LT5hY3AuYWNwX2NlbGwgPT0gTlVM
TCkgew0KPiArCQlyZXQgPSAtRU5PTUVNOw0KPiArCQlnb3RvIG91dDE7DQo+ICsJfQ0KPiAgIA0K
PiAgIAlhZGV2LT5hY3AuYWNwX3JlcyA9IGtjYWxsb2MoNSwgc2l6ZW9mKHN0cnVjdCByZXNvdXJj
ZSksIEdGUF9LRVJORUwpOw0KPiAgIAlpZiAoYWRldi0+YWNwLmFjcF9yZXMgPT0gTlVMTCkgew0K
PiAtCQlrZnJlZShhZGV2LT5hY3AuYWNwX2NlbGwpOw0KPiAtCQlyZXR1cm4gLUVOT01FTTsNCj4g
KwkJcmV0ID0gLUVOT01FTTsNCj4gKwkJZ290byBvdXQyOw0KPiAgIAl9DQo+ICAgDQo+ICAgCWky
c19wZGF0YSA9IGtjYWxsb2MoMywgc2l6ZW9mKHN0cnVjdCBpMnNfcGxhdGZvcm1fZGF0YSksIEdG
UF9LRVJORUwpOw0KPiAgIAlpZiAoaTJzX3BkYXRhID09IE5VTEwpIHsNCj4gLQkJa2ZyZWUoYWRl
di0+YWNwLmFjcF9yZXMpOw0KPiAtCQlrZnJlZShhZGV2LT5hY3AuYWNwX2NlbGwpOw0KPiAtCQly
ZXR1cm4gLUVOT01FTTsNCj4gKwkJcmV0ID0gLUVOT01FTTsNCj4gKwkJZ290byBvdXQzOw0KPiAg
IAl9DQo+ICAgDQo+ICAgCXN3aXRjaCAoYWRldi0+YXNpY190eXBlKSB7DQo+IEBAIC0zNDgsNyAr
MzQ5LDggQEAgc3RhdGljIGludCBhY3BfaHdfaW5pdCh2b2lkICpoYW5kbGUpDQo+ICAgCQlyID0g
cG1fZ2VucGRfYWRkX2RldmljZSgmYWRldi0+YWNwLmFjcF9nZW5wZC0+Z3BkLCBkZXYpOw0KPiAg
IAkJaWYgKHIpIHsNCj4gICAJCQlkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBhZGQgZGV2IHRvIGdl
bnBkXG4iKTsNCj4gLQkJCXJldHVybiByOw0KPiArCQkJcmV0ID0gcjsNCj4gKwkJCWdvdG8gb3V0
NDsNCj4gICAJCX0NCj4gICAJfQ0KPiAgIA0KPiBAQCAtMzkzLDYgKzM5NSwxNiBAQCBzdGF0aWMg
aW50IGFjcF9od19pbml0KHZvaWQgKmhhbmRsZSkNCj4gICAJdmFsICY9IH5BQ1BfU09GVF9SRVNF
VF9fU29mdFJlc2V0QXVkX01BU0s7DQo+ICAgCWNnc193cml0ZV9yZWdpc3RlcihhZGV2LT5hY3Au
Y2dzX2RldmljZSwgbW1BQ1BfU09GVF9SRVNFVCwgdmFsKTsNCj4gICAJcmV0dXJuIDA7DQo+ICsN
Cj4gK291dDQ6DQo+ICsJa2ZyZWUoaTJzX3BkYXRhKTsNCj4gK291dDM6DQo+ICsJa2ZyZWUoYWRl
di0+YWNwLmFjcF9yZXMpOw0KPiArb3V0MjoNCj4gKwlrZnJlZShhZGV2LT5hY3AuYWNwX2NlbGwp
Ow0KPiArb3V0MToNCj4gKwlrZnJlZShhZGV2LT5hY3AuYWNwX2dlbnBkKTsNCg0Ka2ZyZWUgb24g
YSBOVUxMIHBvaW50ZXIgaXMgaGFybWxlc3MsIHNvIGEgc2luZ2xlIGVycm9yIGxhYmVsIHNob3Vs
ZCBiZSANCnN1ZmZpY2llbnQuDQoNCkNocmlzdGlhbi4NCg0KPiArCXJldHVybiByZXQ7DQo+ICAg
fQ0KPiAgIA0KPiAgIC8qKg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
