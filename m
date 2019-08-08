Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 670C08626B
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 14:57:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6957D6E49E;
	Thu,  8 Aug 2019 12:57:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760044.outbound.protection.outlook.com [40.107.76.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 848036E49E
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 12:57:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SZdm40nQXD3qm804VNG1D3Yzg0RYOtK0HGFmP/B+fUTOG5akQTM1Ds18S3Ed67ontZt/31XKKNbyf0bxED5k0Z2Hcyfa7AChqfnUNOM8p2t9fOu8e8Tk3IS/G6pF9/rupuSOCVOsdzLtPGJ85yrYruueDlKt3Dw8MoasBqcxV2zcUNjD6KslOZqmiQbP9tExbXbvgIvHWkmCm10XOGi0w/jDnHihS7wECFlnxo2czxhfCTKLBtcATYRMw6SRFE4jHG3ZjteDbceUepE726BEMeu/1QgpGlTuzwfZ1/tEIp69WO/xce9/2i8rbv8ROkQ/LhJcVC9JWrAmHiXkqeK59A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gUS+C3E/1+5+SL69q88c5D5AtMnppIS6Mvf8+a9sZrU=;
 b=I0exZ/paUHGbyJ2vujhlBFnJhSZsJDHex3eH+pZ9IBaSjDLzX3s4CY9HwGc3Kii0cnTYUI6etL3fpYMUyBWcMxofqj+4jCFCm8faPuKY+pUJzMskMOCFrnuuAq+h3Vtdh+Ko1+KYzuCOMj7ONBYCII1xkrAa0uZxhyXdk4doHa7KHNtDdPPdtd/eYZgDpc4Jx/qhu0ytoxgG7foD/qy50vYdy6aA3eRTuBLXQrhfzK1owC73k9ZvEz9K0HBCuQwqTYUj69aZRKDntYcix0Kijpac2AV5UYKUBn6KZ8GqnxFnw5W/4ED2r239lPwp0Cv/lZtW9gzjiDA2ZIJpLXCFOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB2422.namprd12.prod.outlook.com (52.132.141.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.13; Thu, 8 Aug 2019 12:57:03 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::fc5f:ce01:e8c8:db89]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::fc5f:ce01:e8c8:db89%12]) with mapi id 15.20.2157.015; Thu, 8 Aug 2019
 12:57:03 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSk=?= <thomas@shipmail.org>,
 Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@linux.ie>, "Huang,
 Ray" <Ray.Huang@amd.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, open
 list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/8] ttm: turn ttm_bo_device.vma_manager into a pointer
Thread-Topic: [PATCH v3 2/8] ttm: turn ttm_bo_device.vma_manager into a pointer
Thread-Index: AQHVTczZ148ZeVypkE2tWSJBUfCei6bxAVSAgAANB4CAABh0AIAAC0uAgAADz4A=
Date: Thu, 8 Aug 2019 12:57:03 +0000
Message-ID: <bfe6eb50-7d90-3699-607d-9146b47bb6e4@amd.com>
References: <20190808093702.29512-1-kraxel@redhat.com>
 <20190808093702.29512-3-kraxel@redhat.com>
 <2a90c899-19eb-5be2-3eda-f20efd31aa29@amd.com>
 <20190808103521.u6ggltj4ftns77je@sirius.home.kraxel.org>
 <20190808120252.GO7444@phenom.ffwll.local>
 <36145412-3c31-e635-1e8b-b42439811742@shipmail.org>
In-Reply-To: <36145412-3c31-e635-1e8b-b42439811742@shipmail.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR2P264CA0016.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::28)
 To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aa992e1d-8bb9-4f96-b441-08d71bffe8d0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2422; 
x-ms-traffictypediagnostic: DM5PR12MB2422:
x-microsoft-antispam-prvs: <DM5PR12MB242228A7FC5414103E7E50DF83D70@DM5PR12MB2422.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(346002)(366004)(136003)(396003)(199004)(189003)(5660300002)(81156014)(52116002)(58126008)(6512007)(110136005)(14454004)(8936002)(81166006)(6246003)(31686004)(2501003)(36756003)(2906002)(65806001)(6506007)(76176011)(65956001)(386003)(53546011)(478600001)(316002)(8676002)(186003)(6116002)(99286004)(102836004)(53936002)(11346002)(229853002)(86362001)(446003)(486006)(6486002)(65826007)(476003)(2616005)(31696002)(6436002)(25786009)(64126003)(256004)(66446008)(66574012)(305945005)(64756008)(66946007)(71200400001)(7736002)(71190400001)(46003)(66556008)(66476007)(2201001)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2422;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hrUFGHUNVy3JPbUU/eDrvXUoYR7uNzwLQ8w+kp4G9wYcKEBajyyjQbTExpY3ESDFpw4qv5LgZOew0NW/zBXdKoUcNK9U7rv0EXy9imnOMR/BKujiR/ieHI6VZc2SCxVmj8sQ+CQLpjaXN+YKtOGiNrUErsNoU3aV6usaSrHl7ujcglhIDsP7cbFuWPZJXP+Su7GznkE06Jztgnn4PQi4rWlzkd0IBydsF9Lr2g9ArC8MEABkJmhbn4TF+CjCrDSM2rSjtyvwP5IvvChK8N7EcUWQ1BEjTabVCNLt6KPhRmCJX3dPAf681qgKMb8fjnkE34Lp1/LmAL3dcIda9jL9sPR3MartjyOckspJas46EUaRmQCxjXpr7iJ5A/B+s9LLxF2Cfcnt8KeCU636AvdIIzuR0LqLXJ/sDE26BfL+09o=
Content-ID: <6B6A81925663D543BCFA2970609DBAC9@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa992e1d-8bb9-4f96-b441-08d71bffe8d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 12:57:03.5435 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PMqWCPpDVkXCw6EnPKrbCJzzt1Y2VUbyc7ZMWjUc0LDE+hSK4lThtiUJOdDaE6Jv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2422
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gUS+C3E/1+5+SL69q88c5D5AtMnppIS6Mvf8+a9sZrU=;
 b=dBmQrd9q5Z3ZwfeIzMSimvuwzxbmE6HXit55e2kVwropsi89uWlo1Z9fhsgDEeTTtqBkyIgGWLsj1Fl/yuaWKi2wkLkD7diieyRhNo3wKAaIjF4coEW118cgMWg1TUCgBwTUfnVHZOoiwymDWV96kPDZ/PiY7RJ5aUZwVy3eEjs=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDguMDguMTkgdW0gMTQ6NDMgc2NocmllYiBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKToN
Cj4gT24gOC84LzE5IDI6MDIgUE0sIERhbmllbCBWZXR0ZXIgd3JvdGU6DQo+PiBPbiBUaHUsIEF1
ZyAwOCwgMjAxOSBhdCAxMjozNToyMVBNICswMjAwLCBHZXJkIEhvZmZtYW5uIHdyb3RlOg0KPj4+
IE9uIFRodSwgQXVnIDA4LCAyMDE5IGF0IDA5OjQ4OjQ5QU0gKzAwMDAsIEtvZW5pZywgQ2hyaXN0
aWFuIHdyb3RlOg0KPj4+PiBBbSAwOC4wOC4xOSB1bSAxMTozNiBzY2hyaWViIEdlcmQgSG9mZm1h
bm46DQo+Pj4+PiBSZW5hbWUgdGhlIGVtYmVkZGVkIHN0cnVjdCB2bWFfb2Zmc2V0X21hbmFnZXIs
IGl0IGlzIG5hbWVkIA0KPj4+Pj4gX3ZtYV9tYW5hZ2VyDQo+Pj4+PiBub3cuwqAgdHRtX2JvX2Rl
dmljZS52bWFfbWFuYWdlciBpcyBhIHBvaW50ZXIgbm93LCBwb2ludGluZyB0byB0aGUNCj4+Pj4+
IGVtYmVkZGVkIHR0bV9ib19kZXZpY2UuX3ZtYV9tYW5hZ2VyIGJ5IGRlZmF1bHQuDQo+Pj4+Pg0K
Pj4+Pj4gQWRkIHR0bV9ib19kZXZpY2VfaW5pdF93aXRoX3ZtYV9tYW5hZ2VyKCkgZnVuY3Rpb24g
d2hpY2ggYWxsb3dzIHRvDQo+Pj4+PiBpbml0aWFsaXplIHR0bSB3aXRoIGEgZGlmZmVyZW50IHZt
YSBtYW5hZ2VyLg0KPj4+PiBDYW4ndCB3ZSBnbyBkb3duIHRoZSByb3V0ZSBvZiBjb21wbGV0ZWx5
IHJlbW92aW5nIHRoZSB2bWFfbWFuYWdlciBmcm9tDQo+Pj4+IFRUTT8gdHRtX2JvX21tYXAoKSB3
b3VsZCBnZXQgdGhlIEJPIGFzIHBhcmFtZXRlciBpbnN0ZWFkLg0KPj4+IEl0IHN1cmVseSBtYWtl
cyBzZW5zZSB0byB0YXJnZXQgdGhhdC7CoCBUaGlzIHBhdGNoIGNhbiBiZSBhIGZpcnN0IHN0ZXAN
Cj4+PiBpbnRvIHRoYXQgZGlyZWN0aW9uLsKgIEl0IGFsbG93cyBnZW0gYW5kIHR0bSB0byB1c2Ug
dGhlIHNhbWUNCj4+PiB2bWFfb2Zmc2V0X21hbmFnZXIgKHNlZSBwYXRjaCAjMyksIHdoaWNoIGlu
IHR1cm4gbWFrZXMgdmFyaW91cyBnZW0NCj4+PiBmdW5jdGlvbnMgd29yayBvbiB0dG0gb2JqZWN0
cyAoc2VlIHBhdGNoICM0IGZvciB2cmFtIGhlbHBlcnMpLg0KPj4gKzEgb24gY2xlYW5pbmcgdGhp
cyB1cCBmb3IgZ29vZCwgYXQgbGVhc3QgbG9uZy10ZXJtIC4uLg0KPj4NCj4+Pj4gVGhhdCB3b3Vs
ZCBhbHNvIG1ha2UgdGhlIHZlcmlmeV9hY2Nlc3MgY2FsbGJhY2sgY29tcGxldGVseSBzdXBlcmZs
dW91cw0KPj4+PiBhbmQgbG9va3MgbGlrZSBhIGdvb2Qgc3RlcCBpbnRvIHRoZSByaWdodCBkaXJl
Y3Rpb24gb2YgZGUtbWlkbGF5ZXJpbmcuDQo+Pj4gSG1tLCByaWdodCwgbm90aWNlZCB0aGF0IHRv
byB3aGlsZSB3b3JraW5nIG9uIGFub3RoZXIgcGF0Y2ggc2VyaWVzLg0KPj4+IEd1ZXNzIEknbGwg
dHJ5IHRvIG1lcmdlIHRob3NlIHR3byBhbmQgc2VlIHdoZXJlIEkgZW5kIHVwIC4uLg0KPj4gLi4u
IGJ1dCBpZiBpdCBnZXRzIHRvbyBpbnZhc2l2ZSBJJ2Qgdm90ZSBmb3IgaW5jcmVtZW50YWwgY2hh
bmdlcy4gDQo+PiBFdmVuIGlmDQo+PiB3ZSBjb21wbGV0ZWx5IHJpcCBvdXQgdGhlIHZtYS9tbWFw
IGxvb2t1cCBzdHVmZiBmcm9tIHR0bSwgd2Ugc3RpbGwgDQo+PiBuZWVkIHRvDQo+PiBrZWVwIGEg
Y29weSBzb21ld2hlcmUgZm9yIHZtd2dmeC4gT3Igd291bGQgdGhlIGV2aWwgcGxhbiBiZSB0aGUg
dm13Z2Z4DQo+PiB3b3VsZCB1c2UgdGhlIGdlbSBtbWFwIGhlbHBlcnMgdG9vPw0KPg0KPiBJIGRv
bid0IHRoaW5rIGl0IHdvdWxkIGJlIHRvbyBpbnZhc2l2ZS4gV2UgY291bGQgc2ltcGx5IG1vdmUg
DQo+IHR0bV9ib192bV9sb29rdXAgaW50byBhIHZtd19tbWFwLg0KDQpZZWFoLCBhZ3JlZS4gdm13
Z2Z4IHdvdWxkIGp1c3QgaW5oZXJpdCB3aGF0IFRUTSBpcyBjdXJyZW50bHkgZG9pbmcgYW5kIA0K
ZXZlcnlib2R5IGVsc2Ugd291bGQgc3RhcnQgdG8gdXNlIHRoZSBHRU0gaGVscGVycy4NCg0KU3dp
dGNoaW5nIHRoZSB2bWFfbWFuYWdlciB0byBhIHBvaW50ZXIgbWlnaHQgYmUgaGVscGZ1bCBpbiB0
aGUgbWlkZGxlIG9mIA0KdGhlIHBhdGNoIHNldCwgYnV0IGFzIHN0YW5kIGEgbG9uZSBjaGFuZ2Ug
dGhhdCBsb29rcyBsaWtlIGEgZGV0b3VyIHRvIG1lLg0KDQpJIHN1Z2dlc3QgdG8gc3RhcnQgYnkg
YWRkaW5nIHRoZSBibyBhcyBwYXJhbWV0ZXIgdG8gdHRtX2JvX21tYXAgYW5kIA0KbW92aW5nIHRo
ZSBsb2NrdXAgb3V0IG9mIHRoYXQgZnVuY3Rpb24uDQoNCkNocmlzdGlhbi4NCg0KPg0KPiAvVGhv
bWFzDQo+DQo+DQo+DQo+DQo+PiAtRGFuaWVsDQo+DQo+DQoNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
