Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C97BF42B3EA
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 06:10:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E8776E06E;
	Wed, 13 Oct 2021 04:09:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2073.outbound.protection.outlook.com [40.107.244.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D30326E06E
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 04:09:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HmxbcA2N0A0K1MS1NmyiH5t2i0Pqv60hAZ8lpNcmNaK4ERjJpFTelaBm81nHW+0OCZ4vr0XEijyTILcY/c9JOJDcoHx9dddtRD952r791q/On6JNJw0aiNIq98Kc0irMVfDQy78FcPyL7FtEfeY9eGsQMlsjAuCuOgejOqN4dJLaEoU8+6q4146IrfwYbb4uwmX2GdJYeRYgw1C103x1M8oeDMdUJzDPqZG0e4YnzUHGNBDQXkO8g/oMFnMiDDcmhdiA1aAEvS4iSdaorUxkGD44SkkEhvlVhMif5IRsHblQM7zGT5m3Y7njMe+zdYyXYEH1Bfexcht2+TYml0oapg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o+s7JsvN7plMtIdR/ZLK0N3I24NblDqZGFdtmJ3Wzqg=;
 b=HXGc89rg8ZPQZFD5RmsU+HA2mq4MHkJfiyi7PZ1k4i78qW496d18Zgf3CsfcJGtRs+K2pOrCBQz4+Jjtaux1M4nsJ3TumM4glQ+lvevDBl/T6POpHllqsrjVvX6UXIETMDNEevJPjwDb4ue88u77Y9zTtnQgxe7wUfIfJ3Zs4HUuav589S+4Jwwa7wlZopDrWlR3bftdpSYrRXSjMarHbUxz9+UA5fXOL5ttGbfIk0b61SAGcOlYXy0GqJKwFvz0MDnNOlq2I4IG/yjPWSS57rGnK+SFx9xvjeOQEc0Fl0g8KvItVHcUKlCLeP1ZyAccLcMripOnRAN0qBHG6CC8ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o+s7JsvN7plMtIdR/ZLK0N3I24NblDqZGFdtmJ3Wzqg=;
 b=iX6WTQxFj+ALfzm90qJ1zHgjqcKMfptMB4eXnaH2H7DmCneORliVcl0Rg+NlkGLdYEnri2Iep16tGgQ0IuPCEEXQFXKRN+qpAPKu2+uKgsP+XbkK1iPxPNShcBpXLUdIsr8QTS6BihakhWlKGTvJFWZqYqW+RTEpGw5wJiA+zFA=
Received: from MN2PR05MB6624.namprd05.prod.outlook.com (2603:10b6:208:d8::18)
 by MN2PR05MB6383.namprd05.prod.outlook.com (2603:10b6:208:d7::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Wed, 13 Oct
 2021 04:09:51 +0000
Received: from MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::611d:3cfb:e99a:b768]) by MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::611d:3cfb:e99a:b768%7]) with mapi id 15.20.4608.015; Wed, 13 Oct 2021
 04:09:51 +0000
From: Zack Rusin <zackr@vmware.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
CC: "christian.koenig@amd.com" <christian.koenig@amd.com>, Martin Krastev
 <krastevm@vmware.com>
Subject: Re: [PATCH 4/5] drm/vmwgfx: Introduce a new placement for MOB page
 tables
Thread-Topic: [PATCH 4/5] drm/vmwgfx: Introduce a new placement for MOB page
 tables
Thread-Index: AQHXvGplKUWJr+QTv02TUuJrpRJsEqvPvTgAgACaR4A=
Date: Wed, 13 Oct 2021 04:09:50 +0000
Message-ID: <53ebf8a447173915aed47a46e5569ba52ce02f83.camel@vmware.com>
References: <20211008173146.645127-1-zackr@vmware.com>
 <20211008173146.645127-5-zackr@vmware.com>
 <a0d82e4c-f762-e6c6-0f08-7f92e735e0c2@linux.intel.com>
In-Reply-To: <a0d82e4c-f762-e6c6-0f08-7f92e735e0c2@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.0-1 
authentication-results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 261f915f-e31e-45f5-8bef-08d98dff4dce
x-ms-traffictypediagnostic: MN2PR05MB6383:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR05MB6383B934AB8346BC79FFC181CEB79@MN2PR05MB6383.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2N8HhRUeZ3oI5BqdWqONMxeB1Ph877oX6MKnfJyEAJjKRrjlUGWAFaBhPk7wxp1fNmh9XhBPGI+DaNQtGBi27YxCDLryxZDfgJAFHAOrVqcagHQ4QmdxuKzuBwE2rDzKt0xuBl6n1Of+S6qFrlcDgc66uLAdv/VvA3My/mp5BjytFGZfZVWpt/3X2Cbx6bvB7KNuQFWZJtIzKUheuWkrGoawZHyrYhe5QpLzhImLiqyCqzw9mp07m4tdnu0Ah9OfnOsESvOtPse6fw/mXBE4W0KmS0SOgkn6ZTbBbuyDQ1EDbiDn6Ydkrf9bJYrgY7JY2r57Nb7ZIlZhF9U6WsyuTukoHLkyPJiQvh0W47+cCIXCkMX/JsJkazG4b27EGhwom8cVD5LeWQ08pdkLYhAYbpdB+61N2XW0a+qf0yNTYGuNLLFDAHp/FC9LFOx8hkWtWh7sUXJiZs7dpJHp27tz9I61eO69NeM7x7iJyuzxfMArwAEOyKUYxjtXgwVK1DHsC8N5yZQcZI8+WDYmu6WRJc5OyOsBmcdM3jtCxf3/72fqdLtWVD72A2XMTSdzdEfeVg/34BHJKogwCF/LFgjbg/Qva23pkiSo7UI0ekN55KquwssRjLTJXHnwIsXIY46C0CzUVfr+DJqTpm4P3XE0BJVGM1DJpwwEUsLm96rarhruK3JkfX3IqvNEFvXCrLkSwHEzqfaZk1Tc8ZpNK5zUHw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR05MB6624.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6506007)(2906002)(38070700005)(66446008)(5660300002)(64756008)(66556008)(66946007)(122000001)(66476007)(110136005)(107886003)(4001150100001)(6486002)(508600001)(54906003)(71200400001)(91956017)(86362001)(8936002)(38100700002)(186003)(6512007)(316002)(26005)(76116006)(36756003)(8676002)(4326008)(2616005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RWE4ZE9vUHdXYTNMSUU5TjhvK3d2QmZseGJKd05sNjJ6c29TRXQ3aC9qRS9M?=
 =?utf-8?B?Vk94YkY5QTF1NDlXVU12OXhCcDFoR0RpSnB4QmxMTnBFOGdUZEZNQUx4RmRD?=
 =?utf-8?B?dTdJUnE2dFVwRTdndmdybVBvcmhjQ3ozeFA0TlZWcUFKaTV0cEZnQXg0ZDBL?=
 =?utf-8?B?RFZuVGYvUmhYcWtFSHZKY1NFR1VDOUllMFZtLzRHNDNBQWNROXk1dFlDTm1D?=
 =?utf-8?B?bUtrcGpRakZBdzQ2Z1VaTjNOUTA5bDdlZmQ2RTl2VGM2N3pLdE9sT25Pankz?=
 =?utf-8?B?TGZ2SXBXKzBtYzJZdllSdGMyWVhSREd4a0x1NjNTRkpjNElnek1rL2Q2REZs?=
 =?utf-8?B?VFJ1ci96NTVveTE0aUVDb2lIdXVoMEdDc3NJdmNIcmxLOVNNRkdVd0YrVEhQ?=
 =?utf-8?B?VHpUNFlTUm1YUnBxTnRscDFoZmJpOHN3dFlkZW1JaFNObHc2aDFRS2psM2JZ?=
 =?utf-8?B?WWpMV1lmOGxBMDZaSjVRZUhIN0VsS01hTnlSS1phRDIwY2FrYkEwMHRIYUVt?=
 =?utf-8?B?SlJpZjhONjVMSUVxUVBKMm9XaDRYdGwxZm9tbHlYWXNYaHgwVjJOU3kyRENp?=
 =?utf-8?B?d0xtMlFyZnhyNGhmNG9QOVZEYnVLdDkzSUhkckthWmNVdmNLYzBLQTEwWnF0?=
 =?utf-8?B?K0RsdTJNZ3ZESWdnejJQOFVzYllPOXlXd0tiL2R6WHc5N3FKWDhSQlduSk1l?=
 =?utf-8?B?NGxoU01QemxTWTBHdG5FOHhITXJxYVhiQ0Q3K2lVRVh1WksxMFRvQkdTbFJo?=
 =?utf-8?B?MWVNT2tvdGIzZUNoTFY2VTE1VEZzdU9jaE8vN2ZOMWhhamx1OXJlUjJhQ2Jz?=
 =?utf-8?B?MTZBZFNTd0hBcmtjQ2YvcGhIT0M3aStFRk9sVWwrdWxEdzByTExkWkZmTVdY?=
 =?utf-8?B?SGVaQWlsSkdmNHdMUTRJcDl2bERjYTFPZlRSdzhNQTdhN0dac1Y0NncwZWp0?=
 =?utf-8?B?WnpVQksxTEpUbkc5NzQvUzhLQzNONzhCS2dnSkk0SjNsNDFrd0IxdEQ0OFBD?=
 =?utf-8?B?M1FNWThybTlNN20wVllmRXZJWWdVU3M2Ujd5a2dkT1MvejFoL2N1SG5EeGJw?=
 =?utf-8?B?d3JOOFYrMnJjL2FjWFVuS0xuT1czYnN5d21FbHZaM0g0cWEzZXBNbktYQy9r?=
 =?utf-8?B?cG9SUnRxL291Nm0vYnRZYmpHSHE5c3h2OGZPUVpGeVRESTJWVXkyMUFuWUlx?=
 =?utf-8?B?d1pFZ0FhendlNWp4ck8wdmRncjlxYTZmRXc5dGxwZzV0OHNRazdqRm1NeVMw?=
 =?utf-8?B?cGkyaEVOM01kTm8xVXBqSTI1ZUhIOTF5V2EwcmU4MU9DQ1BSbE14bGg4YUpJ?=
 =?utf-8?B?eFBVUEcyRVp6WHZIWDFMd2xTTnY4QkFkRGNwL1ZhQVlRVW1GMlJkdnZndWpE?=
 =?utf-8?B?YTY4K2N2b3VQMldDU2lSN3dKalVuQ3lrMFBoME9MTTZ6VG1sUVV5Z3VZVG5m?=
 =?utf-8?B?QWViTHllOEp0QWdjWTJQUk0yazVFVnZxZFdWYndWSUllcFFRMkRpVFV0cmln?=
 =?utf-8?B?Y1krODArUXF5MTV2eC8rMTVuTnZySDgyMk9KN1pIVlZUYmRRSGVXdS9pTFJj?=
 =?utf-8?B?Q1h3NUFjMDZYL1E5b3VIeHR4U3BSeE5ySmxGL0hxMFMyRkFQODdsNjljRDhP?=
 =?utf-8?B?NUtOb1dZRk02MS9CZjg3eURrcjZoSFJ4emRGaW9hQW9VN3hjRkNVeU4rMjQv?=
 =?utf-8?B?Z2ZIdm9qcGJNVlB4YlZjZDQyb0hVZ3lMclpNQmdLOE16VlRrV2h2b1BlUCt4?=
 =?utf-8?Q?q/vMW0KOtOH3Nem3VlvJT7emFavb+tX8A3jYfUq?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A1D4E8DF5F76544DA68F0345DA54B37A@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR05MB6624.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 261f915f-e31e-45f5-8bef-08d98dff4dce
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2021 04:09:51.0285 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ELW+7Bn++IMkqlwdqajZlSKxmjT0bX5JxS/NyZzrzMS1x/xGCZp6DTX3J/b5pv9f7/zKOfQcRRiSewvEC523vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6383
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIxLTEwLTEyIGF0IDIwOjU3ICswMjAwLCBUaG9tYXMgSGVsbHN0csO2bSB3cm90
ZToNCj4gPiArdm9pZCB2bXdfc3lzX21hbl9maW5pKHN0cnVjdCB2bXdfcHJpdmF0ZSAqZGV2X3By
aXYpDQo+ID4gK3sNCj4gPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgdHRtX3Jlc291cmNlX21hbmFn
ZXIgKm1hbiA9DQo+ID4gdHRtX21hbmFnZXJfdHlwZSgmZGV2X3ByaXYtPmJkZXYsDQo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
DQo+ID4gVk1XX1BMX1NZU1RFTSk7DQo+ID4gKw0KPiA+ICvCoMKgwqDCoMKgwqDCoHR0bV9yZXNv
dXJjZV9tYW5hZ2VyX2V2aWN0X2FsbCgmZGV2X3ByaXYtPmJkZXYsIG1hbik7DQo+ID4gKw0KPiA+
ICvCoMKgwqDCoMKgwqDCoHR0bV9yZXNvdXJjZV9tYW5hZ2VyX3NldF91c2VkKG1hbiwgZmFsc2Up
Ow0KPiA+ICvCoMKgwqDCoMKgwqDCoHR0bV9yZXNvdXJjZV9tYW5hZ2VyX2NsZWFudXAobWFuKTsN
Cj4gPiArDQo+ID4gK8KgwqDCoMKgwqDCoMKgdHRtX3NldF9kcml2ZXJfbWFuYWdlcigmZGV2X3By
aXYtPmJkZXYsIFZNV19QTF9TWVNURU0sDQo+ID4gTlVMTCk7DQo+ID4gK8KgwqDCoMKgwqDCoMKg
a2ZyZWUobWFuKTsNCj4gPiArfQ0KPiANCj4gSSBzZWVtIHRvIHJlY29nbml6ZSB0aGUgZ2VuZXJh
bCBwYXR0ZXJuIGhlcmUgZnJvbSB0aGUNCj4gdHRtX3N5c19tYW5hZ2VyLCANCj4gQW55IGNoYW5j
ZSB3ZSBjb3VsZCBhZGQgd2hhdCdzIG5lZWRlZCB0byB0aGUgdHRtX3N5c19tYW5hZ2VyIGFuZCBt
YWtlDQo+IHRoZSBjb2RlIHJldXNhYmxlPyBUaGF0J3MgdGhlIF9maW5pIGZ1bmN0aW9uIGFuZCB0
aGUgbWVtb3J5IHR5cGUNCj4gY2hvaWNlIA0KPiBJIGd1ZXNzLiBJIGZpZ3VyZSBpOTE1IHdpbGwg
bmVlZCBleGFjdGx5IHRoZSBzYW1lLg0KDQpJIHRoaW5rIHRlY2huaWNhbGx5IHdlIGNvdWxkIHNo
YXJlIHRoaXMgZW50aXJlIHRoaW5nLiBJJ20gbm90IHN1cmUgaG93DQptYW55IEdQVSBzcGVjaWZp
YyBmZWF0dXJlcyBvbmUgbmVlZHMgZm9yICJzeXN0ZW0gbWVtb3J5IHBsYWNlbWVudCBidXQNCmFs
bG93aW5nIGZlbmNpbmciLg0KDQpBcyB0byBzaGFyaW5nIGp1c3QgdGhlIGZpbmksIEknZCBiZSBo
YXBweSB0byBzaGFyZSBhbnkgY29kZSB3ZSBjYW4gYnV0DQppdCdkIGJlIHByb2JhYmx5IGJlIG9u
bHkgYmV0d2VlbiB2bXdnZnggYW5kIGk5MTUgYmVjYXVzZSB0aGUgZGVmYXVsdA0Kc3lzX21hbiBk
b2Vzbid0IG5lZWQgdGhlIGV2aWN0X2FsbCBhbmQgaXQncyBhbGxvY2F0ZWQgYXMgcGFydCBvZiBp
dHMNCnBhcmVudCBzdHJ1Y3Qgc28gaXQgZG9lc24ndCBuZWVkIHRvIGZyZWUuIFdlIGNvdWxkIHRy
aXZpYWxseSBhZGQgdm9pZA0KdHRtX2ZlbmNhYmxlX3N5c19tYW5fZmluaShzdHJ1Y3QgdHRtX2Rl
dmljZSAqZGV2LCB1MzIgbWVtX3R5cGUpIGJ1dCBJJ2QNCnByb2JhYmx5IHdhaXQgdW50aWwgaTkx
NSBpcyByZWFkeSB0byB1c2UgaXQgdG8gYXZvaWQgYWRkaW5nIHNoYXJlZCBjb2RlDQp0aGF0J3Mg
b25seSB1c2VkIGJ5IGEgc2luZ2xlIGRyaXZlciA6KQ0KDQp6DQo=
