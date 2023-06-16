Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0E3732611
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 05:59:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A85710E591;
	Fri, 16 Jun 2023 03:59:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM4PR02CU001.outbound.protection.outlook.com
 (mail-centralusazon11012003.outbound.protection.outlook.com [52.101.63.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2964510E591
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 03:59:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oF+9inDYUfzE8siZlkdWxhnYunZoG/hQbCBJO6EY+XvsLNU+sZhWxmoJd2qBUJ0OOoDx1gd84LL5LgRWS4dmPRCAhp0T+qaxMA68KRtEyLV52CxQMDz+rKy2aGkPgsgOj9LDGWvcP45nnlHUjm4yy16hqLKkpSv8UJlvr3iHN0awHaol8HntS4tgYIjE7hV99G8a29fZ3ox+Sbz0mkt+2NNRTpscbF6XOdME4TShZZlHjwSBCDgfACYcDoBrMud9YqVWKux9xgFPR5R+gX6YtZYmkwBzZt2omNMhHYsKFpII2+HQ6buc0m6a8fbGAkF1frGEOkuiFaMAvuCq67DALg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WSMBfqiT5rPhC/ZmYCzASDvGVJR830SkFZzGN3wzAf0=;
 b=FE1mGHKZWycr4RGdHwP3yhMmiJORdaJCPtMNUHyxUFk4oOmjewBzOw1E0Zfzymu4ConAZ/6HmX5tPJDaOfgBA+iAJAWxaQY/hCHO+azQl30Sk3zso/l6P+HxCuxOPNa+8lj7FBc9fVO9eXnyvCDodJCcGWGaU1UgrpNyyi7bJGscJggfJC3JChxwPLySWTkAWy7etyEuFczFlcZjlP+7Os2LbZfrSda37PKLQMY+OuwFlpO49YAWSjzrfiOXIRS+IHPZnwJRcBJjySDWD9jG6gmOT9yDwVosmCXDClploBWjFkODthehXoVDiOB2ohTRO+76XlD5T6bgjwEqv5eRXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WSMBfqiT5rPhC/ZmYCzASDvGVJR830SkFZzGN3wzAf0=;
 b=Yd723K5PhXXV2ihIke7WyHLyb+5oDsY3uiyvejLcrSKehB6FaLQc8Cy+xYIpH2UgY0/VqyAxXsSUs4SGkHA7B4YyJj243FeG3x3kzAfyBChVs+JZfq8w6g3QM9/V6aR6DPfixpyQC6am5UueOCaCkNo77JJVv8fz+JSnVDvaWwc=
Received: from CH3PR05MB10206.namprd05.prod.outlook.com
 (2603:10b6:610:155::10) by SN7PR05MB9359.namprd05.prod.outlook.com
 (2603:10b6:806:26d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.27; Fri, 16 Jun
 2023 03:59:44 +0000
Received: from CH3PR05MB10206.namprd05.prod.outlook.com
 ([fe80::b4c3:9441:f0:efb8]) by CH3PR05MB10206.namprd05.prod.outlook.com
 ([fe80::b4c3:9441:f0:efb8%5]) with mapi id 15.20.6455.037; Fri, 16 Jun 2023
 03:59:43 +0000
From: Zack Rusin <zackr@vmware.com>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "airlied@gmail.com" <airlied@gmail.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "contact@emersion.fr"
 <contact@emersion.fr>
Subject: Re: [PATCH 0/3] drm: Allow PRIME 'self-import' for all drivers
Thread-Topic: [PATCH 0/3] drm: Allow PRIME 'self-import' for all drivers
Thread-Index: AQHZn22pk56dSbsCXEeqQKrms6OsaK+MzxoA
Date: Fri, 16 Jun 2023 03:59:43 +0000
Message-ID: <9a8ec363a38e78b1848483baab52c9c61cb2e188.camel@vmware.com>
References: <20230615094206.4424-1-tzimmermann@suse.de>
In-Reply-To: <20230615094206.4424-1-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR05MB10206:EE_|SN7PR05MB9359:EE_
x-ms-office365-filtering-correlation-id: a86d689f-68ee-4d3b-7f5e-08db6e1e1e02
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dMCcENRcoc8mhkbD64eidJYK/2M7UJe7AXUtjWRg+0jPSLIoNLrLFudfUgjpar/QNYSRd2ravEAx8DYKmCU7TV9nwyK7lpVjoKpYpiKELQ3gp0Lfy+HwO7mGLX+fQ3ptl959blWNlGFv/waMP2wweraK4pdHfVNVSkBepFCpAoBVzwr5ybnruXJEvuy5UGhu4cZYEjHR4yvDkb9midBEn8bXoXY8qmgkUe1kCVDgfsZ4UttTYZ50qhrjwmBc80LsrTcryRQES9sfg0TfQkclef4ELOsBnxYCFcOkLLOF2FWuCJLG/eXISc1VfRo02lkyRplcSiOkPb0v0mUYlSotnDLsQUB4VK0wulwAmeq3Fm9Q7LtRYzCFD2wYEjLx7m5M6KK2aAEDDa4wUz3U1qNAzgQpC+F8V+5YLOVP6oRCyFBHcLHxM+Pcp3zrMmORNwwOk9EjOijpRYxFufVMnAvxl50ZKwGcDNR+rQ4GAvADnkTQdH/FaXacSoDdfmUbuHnsa6yA3gzA1W9bQoTgbucYdrALf1IplfD+E9UXunmKIOG52kMnfmHdjvifwfNU9wOrmtg8Acq6UQnAviknm8nEnYdBVnAMbf65zOE+3VrtLe5cIHU0dUxDRf5rg3X4yJrprZKX2X4ti18vu5s0Rln9Q2wbXHQ37TQPZe+IwQFS/8w=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR05MB10206.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(136003)(376002)(346002)(396003)(366004)(451199021)(2616005)(38070700005)(110136005)(83380400001)(122000001)(38100700002)(36756003)(478600001)(71200400001)(91956017)(4326008)(41300700001)(66946007)(66556008)(66476007)(66446008)(64756008)(2906002)(76116006)(316002)(66899021)(8676002)(186003)(8936002)(86362001)(6506007)(6512007)(26005)(6486002)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NVRCRWtZODdVRHlJc3FLTkJPRnVXM0hYWlRoWThWMkxhM2pIMzJjNm8zRFNX?=
 =?utf-8?B?NTVTcFM2RHE3cW94TFlBU3dISk5GMk43NWRJa3Q5c0ZvY3FiSzZWVklFL3ho?=
 =?utf-8?B?M3F3N1M1cURuTXBvakEwSXBjUG4zaVZtRkNBK1Voa21IY3JDSS9CYzI0UWtw?=
 =?utf-8?B?bU5sWXUwZ0p0WnFaQmlRcm9tOHBQd1oweXFrYlBzTmhqc2FMMGRmdVkxSXVM?=
 =?utf-8?B?OEdrNnhFb20zeU5UQUxWbkcyNmVHV2wvQUN0UGxtQnJmcXVvOTN0MVhVd3Vx?=
 =?utf-8?B?R1dEajZ3cHk2a0FVUGdBcUdYQ3BwbkxCdEtSbloyQlhvZk5Wamg0SWJ0dWxF?=
 =?utf-8?B?UWN4ejlGWTBNRlpjcXlmajJGamFBMTF3aDBabmVYQ1JNbS9XZ3Vuc3VmcVhG?=
 =?utf-8?B?cjdzV0JaQUx1VWpxWEFRY0JNRGdrcE1TMm5BTVJCMmxMZUg3UWJoU25tVDk5?=
 =?utf-8?B?aEh6Y2NBMmdtUW9YVUUrenVqOVkyN3B5dEt6dkg2d0hKbTB6TUVwZE8zT09I?=
 =?utf-8?B?b085em8veHpaVGp4a1c0NmJ0a0tZTzZhMGU1VDE3NjVROXZYVjFxbEI5QTF3?=
 =?utf-8?B?ZTA4c2djWVpiQS9UcVdXcDBSQm5uMmViMHhxejNBZHVUUTN2d3I1Wi9jV2tx?=
 =?utf-8?B?V2lMRk1UV0ZhbkdZRkpIV25rRm1GQlNKRzVjUHdYS3B3WjRlREVOTDZXTGtv?=
 =?utf-8?B?ckVMNDJOdHMvT2V6TDcrWlJlSExGUmlVOW4zYnRMNjJMM3lEL3pGeHdDNDBy?=
 =?utf-8?B?RGRXZWNBbzMzeFpVUUp0ZlZveThQWnYvNTAxT2MvTk12SnUvWEtKWU5zMWI2?=
 =?utf-8?B?dHVwU2s5dUVpL3FNYVVIS2U3NXNYRm94WlprQ2wzdm9PSUFsWHlQWitHU0VU?=
 =?utf-8?B?OHA3aFhUV01QR2FaNXRyTU1ZOHdEY2tFbU9SL1g0YzJWeWRoZmtHUTRQTHh4?=
 =?utf-8?B?Mjh3bUQyS0RhTGZIc3ZvVWNFclBPTDg5aE54WEFsbmJuY3BZZkJjRE1lZmY2?=
 =?utf-8?B?SmQ2cFYxTEszSHZiYWo0ZkJmUUM1dnpJTFMvT1JNbUZvc0g0RTJNajBJcFcw?=
 =?utf-8?B?a3RyVG5Ja2pGQkVpWEZtSDlFVnZPdUljd1dhK0VaeFUyRWV3ZDVyMzJxWmFw?=
 =?utf-8?B?d2hveDlGQVNwQ2RROGlBeExGbWVaQU9pNXFobExIeVpyZDcycFdZMDF5ZWZ3?=
 =?utf-8?B?WDdDOGh1ZDJkUkZLbjRtMnZRSFpFWGlBNWs0Ymc0UVVTeGlYdTFqcEtSaFkz?=
 =?utf-8?B?TTFqLzRESGVmZTBzNFRpUWNuVDM3NUJpWkpUekJFN0ptMXhKNTZEWmN2WUNx?=
 =?utf-8?B?emdkSEYzaUpPSXpwKzQ3ekdIME0yNGIyNWZiVkRmdlZSQTFmQ0JKbkIxZXQ3?=
 =?utf-8?B?T2hXOXVqa0NNdEh5bG9qdzBHSFFyeVNzWFhZWWREbXNTUk5kZWxhbGw1Z21n?=
 =?utf-8?B?S0F3cTdyeUFYQm9yK0hqSVZxWk1ZNVl1NExmN2lHZ1VXQ1MyNGdYS0IrbGpG?=
 =?utf-8?B?bm1UR3R2SjVYa3AvMkZMTHA3dGRadDBRZVhhb2NaUFNOSDY3ZFZjck0vaENr?=
 =?utf-8?B?cjROeDZqMlhLVzJ1UVk4aWVqMmdpRGkxcEpwSkZzdW9sUGJBKzQyZmw3L1hC?=
 =?utf-8?B?dzFLaDNpUi9wK3ZHeEVQYTFlVFVtdUxubVl1QTdxVmVyRURIYkwwNlpST0FX?=
 =?utf-8?B?eE45MGJaRVNTQ0hoVmZsVTlOaUUyU1NwWnUwcW1rZmV3UHdFbGw4S2lzZUMw?=
 =?utf-8?B?RGlWcDg2UVJkUFZnRXl4bTFxWHJ2bG9TdWhWdDJFaW5aMjB0OE9TR0NxMVE2?=
 =?utf-8?B?SXY2S2dETEltais4RWIycnFIK0RKMTFXcElmS3Bsa3lxK2FMbnhSYnIwU0k2?=
 =?utf-8?B?dlBGRzRrZXMxMzdmT1lJaWtSdXFRMGI1QzlRZm9YLzYvL3lrZDdRb2RNaW9X?=
 =?utf-8?B?bnRiWmsrNGFZaVR3MzQ3cExFWEJIb3Q2SUpYUFp1eUFwNXk4TEhmRkltNHBk?=
 =?utf-8?B?NENsTXNmQVdWZVArZmd2U1VFM2ZJRHIyNDlBRURucDFtYjZCWTR0RUI0MTdY?=
 =?utf-8?B?SVA4WTk3MXpHWmJ6YXc1ZzZRNG5OZUtmV2UvVW80Q3l5Y21KNU56TnVyUjdI?=
 =?utf-8?Q?MRvPlACb5/d5XoVHj6jJ+HJGB?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <172E18029B00A1408FAC6B467A141841@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR05MB10206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a86d689f-68ee-4d3b-7f5e-08db6e1e1e02
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2023 03:59:43.4578 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u+Jml2BFTsC+fqsJUzbFO7kz2FFHqEP1w0thPCNbSSgP41rwWbIuHlXgPhijIhP3LJmSRFoMV2meEswKDwEv0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR05MB9359
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTA2LTE1IGF0IDExOjMxICswMjAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90
ZToNCj4gU2V0IGRybV9nZW1fcHJpbWVfaGFuZGxlX3RvX2ZkKCkgYW5kIGRybV9nZW1fcHJpbWVf
ZmRfdG9faGFuZGxlKCkNCj4gZm9yIGFsbCBEUk0gZHJpdmVycy4gRXZlbiBkcml2ZXJzIHRoYXQg
ZG8gbm90IHN1cHBvcnQgUFJJTUUgaW1wb3J0DQo+IG9yIGV4cG9ydCBvZiBkbWEtYnVmcyBjYW4g
bm93IGltcG9ydCB0aGVpciBvd24gYnVmZmVyIG9iamVjdHMuIFRoaXMNCj4gaXMgcmVxdWlyZWQg
Ynkgc29tZSB1c2Vyc3BhY2UsIHN1Y2ggYXMgd2xyb290cy1iYXNlZCBjb21wb3NpdG9ycywgdG8N
Cj4gc2hhcmUgYnVmZmVycyBhbW9uZyBwcm9jZXNzZXMuDQo+IA0KPiBUaGUgb25seSBkcml2ZXIg
dGhhdCBkb2VzIG5vdCB1c2UgdGhlIGRybV9nZW1fcHJpbWVfKigpIGhlbHBlcnMgaXMNCj4gdm13
Z2Z4LiBPbmNlIGl0IGhhcyBiZWVuIGNvbnZlcnRlZCwgdGhlIGNhbGxiYWNrcyBpbiBzdHJ1Y3Qg
ZHJtX2RyaXZlcg0KPiBjYW4gYmUgcmVtb3ZlZC4NCg0KSG1tLCBJJ20gbm90IHN1cmUgdGhhdCdz
IGV2ZXIgZ29pbmcgdG8gYmUgcG9zc2libGUgb24gdm13Z2Z4LiBPciBhdCBsZWFzdCBub3QgdW50
aWwNClhvcmcgaXMgdXNlZCBieSBhbnl0aGluZy4gU29tZSB0aGluZ3MgaW4gdm13Z2Z4IHN0YWNr
IGNyZWF0ZSAic3VyZmFjZXMiIHdoaWNoIGFyZQ0Kbm90IEdFTSdzICh0aGV5IGNhbiBiZSBiYWNr
ZWQgYnkgYSBHRU0gb2JqZWN0LCBidXQgZG9uJ3QgaGF2ZSB0bykgYW5kIHRoZSBwcmltZQ0KaW1w
bGVtZW50YXRpb24gb24gdm13Z2Z4IGhhcyB0byBiZSBhYmxlIHRvIGV4cG9ydCBhbmQgaW1wb3J0
IHRob3NlLiANCg0KSW4gYW4gaWRlYWwgd29ybGQgSSdkIGp1c3QgZGVsZXRlIHRoZSBpb2N0bCdz
IHRoYXQgYWxsb3cgY3JlYXRpbmcgdGhvc2UgInN1cmZhY2VzIiwNCmJ1dCBvZiBjb3Vyc2UgdGhh
dCdzIGEgbm8tbm8sIHNvIHBvc3NpYmlsaXR5IG9mIGludHJvZHVjaW5nIHZtd2dmeDIgd2l0aCBh
DQpzYW5lci9tb2Rlcm4gaW9jdGwgbW9kZWwgaGFzIGJlZW4gZmxvYXRpbmcgYXJvdW5kIGludGVy
bmFsbHkuIFdoaWNoIGF0IGxlYXN0IHdvdWxkDQpvcGVuIGEgcGF0aCB0byByZW1vdmluZyB2bXdn
ZnggYXQgc29tZSBwb2ludCBpbiB0aGUgZnV0dXJlLCBidXQgdGhlcmUncyBub3QgbXVjaA0KdGhh
dCBjYW4gYmUgZG9uZSBhYm91dCB2bXdnZnggaGF2aW5nIHRvIGJlIGFibGUgdG8gcHJpbWUgaW1w
b3J0L2V4cG9ydCBHRU0ncyBhbmQNCndvbmt5IG5vbi1HRU0gb2JqZWN0cy4NCg0Keg0KDQo=
