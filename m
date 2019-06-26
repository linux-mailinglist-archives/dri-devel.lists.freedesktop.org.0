Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0008562DC
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 09:04:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F008E6E29F;
	Wed, 26 Jun 2019 07:04:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760082.outbound.protection.outlook.com [40.107.76.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8046D6E29A;
 Wed, 26 Jun 2019 07:04:10 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3849.namprd12.prod.outlook.com (10.255.173.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Wed, 26 Jun 2019 07:04:07 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480%2]) with mapi id 15.20.2008.017; Wed, 26 Jun 2019
 07:04:07 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/1] drm/ttm: return -EBUSY if waiting for busy BO fails
Thread-Topic: [PATCH 1/1] drm/ttm: return -EBUSY if waiting for busy BO fails
Thread-Index: AQHVK+oDNe/OvjJJB0qJniNoSHCIOaatgDsAgAACoAA=
Date: Wed, 26 Jun 2019 07:04:07 +0000
Message-ID: <33c2b0f0-6747-1a36-117f-8e7fe12cbef0@amd.com>
References: <20190626063958.19941-1-Felix.Kuehling@amd.com>
 <410e8232-4edc-78ea-dc5b-4385cda01266@amd.com>
In-Reply-To: <410e8232-4edc-78ea-dc5b-4385cda01266@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
x-clientproxiedby: YT1PR01CA0018.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::31)
 To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 540bfb3b-0c4d-493f-337f-08d6fa047b10
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3849; 
x-ms-traffictypediagnostic: DM6PR12MB3849:
x-microsoft-antispam-prvs: <DM6PR12MB38495747C96E860993E51DDC92E20@DM6PR12MB3849.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00808B16F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(366004)(376002)(346002)(396003)(199004)(189003)(53546011)(53936002)(186003)(386003)(86362001)(52116002)(36756003)(102836004)(2201001)(6116002)(66574012)(76176011)(26005)(6506007)(2501003)(72206003)(478600001)(65826007)(99286004)(31696002)(229853002)(446003)(68736007)(256004)(14444005)(6436002)(6512007)(11346002)(476003)(66446008)(81156014)(66476007)(66066001)(65806001)(8936002)(66946007)(8676002)(6486002)(73956011)(2616005)(65956001)(316002)(64126003)(110136005)(25786009)(66556008)(14454004)(31686004)(486006)(6246003)(2906002)(3846002)(305945005)(64756008)(7736002)(58126008)(71200400001)(71190400001)(5660300002)(450100002)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3849;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UMgzG/2mMlyjWjlbwA+grHRYEePSs04LJe5nTrn5jg4wAN9U7cIxo3J+7L124huweRfAjhkK88jIGCqBk40G77eJCnLpW2N7hM8U4Z4lbMRCISgtwRY3xUZ4S3E3M3SeJVocmjy9ptUFKb8Tvk52j+ruxWwsfK88ZUYiy7nppp2tBm/G7LqwIm1/NtGEI3n+kzoaqajPiEx0YLT8G/lUlvs2E3TaVvdA5p8UqD8KtFK/uC0qURyyY+mlpuXLsLkr/tLisyBK0yom47bTBZZQXQ+IGU1W5G54I0onrsDK8uyDb77fWnyxG7JjXHEH/pif6tWbC0uD1LbV0KCEm3zojgVDVicI+3YBgXI5IxClLNmgmPEf9FS4izzl9zKDl6xa4ZTSdI+UQiFWSdMbYI0UIrGxtvu7AZmZ43PKbRF9XhQ=
Content-ID: <E7999E0456F5BD47B92C86954A88B4C1@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 540bfb3b-0c4d-493f-337f-08d6fa047b10
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2019 07:04:07.3404 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3849
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RI31ti2QOHzyFvNCj0d1eSJBVlGi0YXqE0jzrTnaugU=;
 b=pj1GucQ5Dfi0B1GDi70RZvX/KtbMsFwOdzfkHjqEZz+CL7DNfusrGMpTdKvxKP0NgB0ULBYBL1CNxcATB2NbVglLLd30FxmZhMJ430W2MbQg8Bbl+OgWoVhXB40xdnNTP/LnFvWVGF2ulB12sCVxLScXlnAYXKj5MbZL6GE5ryQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNi0yNiAyOjU0IGEubS4sIEtvZW5pZywgQ2hyaXN0aWFuIHdyb3RlOg0KPiBBbSAy
Ni4wNi4xOSB1bSAwODo0MCBzY2hyaWViIEt1ZWhsaW5nLCBGZWxpeDoNCj4+IFJldHVybmluZyAt
RUFHQUlOIHByZXZlbnRzIHR0bV9ib19tZW1fc3BhY2UgZnJvbSB0cnlpbmcgYWx0ZXJuYXRlDQo+
PiBwbGFjZW1lbnRzIGFuZCBjYW4gbGVhZCB0byBsaXZlLWxvY2tzIGluIGFtZGdwdV9jcywgcmV0
cnlpbmcNCj4+IGluZGVmaW5pdGVseSBhbmQgbmV2ZXIgc3VjY2VlZGluZy4NCj4+DQo+PiBGaXhl
czogY2ZjYzUyZTQ3N2U0ICgiZHJtL3R0bTogZml4IGJ1c3kgbWVtb3J5IHRvIGZhaWwgb3RoZXIg
dXNlciB2MTAiKQ0KPj4gQ0M6IENocmlzdGlhbiBLb2VuaWcgPENocmlzdGlhbi5Lb2VuaWdAYW1k
LmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0Bh
bWQuY29tPg0KPiBDcmFwLCBJIGZlYXJlZCB0aGF0IHRoaXMgY291bGQgbGl2ZS1sb2NrIHVuZGVy
IHNvbWUgY2lyY3Vtc3RhbmNlcywgYnV0DQo+IGhvcGVkIHRoYXQgdGhpcyB3b3VsZCBiZSBhIHJh
dGhlciByYXJlIGNhc2UuDQo+DQo+IEhvdyBkaWQgeW91IHJlcHJvZHVjZSB0aGlzPw0KDQprZmR0
ZXN0IC0tZ3Rlc3RfZmlsdGVyPUtGREV2aWN0VGVzdC4qIC0tZ3Rlc3RfcmVwZWF0PTEwDQoNCkl0
IHJ1bnMgdHdvIHByb2Nlc3NlcywgYm90aCBvZiB3aGljaCBkbyBncmFwaGljcyBDUyBhbmQgS0ZE
IGNvbXB1dGUgDQpxdWV1ZXMgYXQgdGhlIHNhbWUgdGltZSB3aXRoIGVub3VnaCBtZW1vcnkgcHJl
c3N1cmUgdG8gY2F1c2UgZnJlcXVlbnQgDQpLRkQgZXZpY3Rpb25zLiBJdCdzIG1lYW50IHRvIHRl
c3QgS0ZEIGV2aWN0aW9uIGNvZGUgcGF0aHMsIGJ1dCBlbmRlZCB1cCANCmZpbmRpbmcgYSBwcm9i
bGVtIHRoZSBncmFwaGljcyBDUyBjb2RlIHBhdGguIDovDQoNCkkgd2FzIGFibGUgdG8gcmVwcm9k
dWNlIGl0IHJpZ2h0IGFmdGVyIHlvdXIgY2hhbmdlcy4gV2l0aCB0aGUgbGF0ZXN0IA0KdmVyc2lv
biBvZiB0aGUgYnJhbmNoIEkgY2FuJ3QgcmVwcm9kdWNlIGl0IGFueSBtb3JlLiBTb21lIG90aGVy
IGNvbW1pdCANCm11c3QgaGF2ZSBjaGFuZ2VkIHRoaW5ncyBlbm91Z2ggdG8gYXZvaWQgdGhlIGxp
dmUgbG9jay4NCg0KSSBhbHNvIHRyaWVkIHdyaXRpbmcgYSB0ZXN0IHRoYXQgcmVwcm9kdWNlZCBp
dCBvbmx5IHdpdGggYW1kZ3B1X2NzIGNhbGxzIA0KKHdpdGhvdXQgS0ZEKSwgYnV0IG5vIGx1Y2sg
eWV0Lg0KDQpSZWdhcmRzLA0KIMKgIEZlbGl4DQoNCj4NCj4gQW55d2F5IHBhdGNoIGlzIFJldmll
d2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQo+IGZv
ciBub3cuDQo+DQo+PiAtLS0NCj4+ICAgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgfCAy
ICstDQo+PiAgICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkN
Cj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyBiL2RyaXZl
cnMvZ3B1L2RybS90dG0vdHRtX2JvLmMNCj4+IGluZGV4IGM3ZGU2NjdkNDgyYS4uNThjNDAzZWRh
MDRlIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYw0KPj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYw0KPj4gQEAgLTgyNyw3ICs4MjcsNyBAQCBz
dGF0aWMgaW50IHR0bV9tZW1fZXZpY3Rfd2FpdF9idXN5KHN0cnVjdCB0dG1fYnVmZmVyX29iamVj
dCAqYnVzeV9ibywNCj4+ICAgIAlpZiAoIXIpDQo+PiAgICAJCXJlc2VydmF0aW9uX29iamVjdF91
bmxvY2soYnVzeV9iby0+cmVzdik7DQo+PiAgICANCj4+IC0JcmV0dXJuIHIgPT0gLUVERUFETEsg
PyAtRUFHQUlOIDogcjsNCj4+ICsJcmV0dXJuIHIgPT0gLUVERUFETEsgPyAtRUJVU1kgOiByOw0K
Pj4gICAgfQ0KPj4gICAgDQo+PiAgICBzdGF0aWMgaW50IHR0bV9tZW1fZXZpY3RfZmlyc3Qoc3Ry
dWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
