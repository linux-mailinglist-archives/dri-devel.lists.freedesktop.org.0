Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 396C78A65F3
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 10:20:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFD5010E1DB;
	Tue, 16 Apr 2024 08:20:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BsZxG9yT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF2510E1DB;
 Tue, 16 Apr 2024 08:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713255651; x=1744791651;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fPrSlkCowzmhKOhxCU1iwAYzw65xA52H/H5/bpkV7iI=;
 b=BsZxG9yTheuy4lL55uGpPh0g9GGrAB+5jCFtpBK8Hy9ZJrSam2mBPgs+
 aCih+WrevIZY/bFH2id+DBpD1bYijJ9fQYHK8jjSwIWfbV9pMXlfeRQ6Q
 8HQydvYaBBtpf++Wy+wW5k19DXGmzVGqY39GDsEgv/ktuSnUFXiospoNp
 89eM1DFyE/1x1Et9XnPltFjq1xu1rykjHkls3CAeJYcT01KcVjSRPtxIq
 M7cr+T4oSqXVtn/liSwCp6533BIrmP/qT7bIaKAaR2MLeOyb+O2/iRknS
 d8z5X5ylEOH1yR0radS5n9KXWGtwPf7xGWPeDgmbWn/I5TWGMHSqvugHP g==;
X-CSE-ConnectionGUID: gvPIpIt8QR6XD+P9f9xJ2Q==
X-CSE-MsgGUID: imKOr5RISn6vHoyaMYPaGw==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8542105"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="8542105"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 01:20:50 -0700
X-CSE-ConnectionGUID: m7u3xMzPS1O08zGu90wHFA==
X-CSE-MsgGUID: g9oDPqC8TD+oPOEfEuNVNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; d="scan'208";a="22254576"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Apr 2024 01:20:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 01:20:50 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Apr 2024 01:20:50 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Apr 2024 01:20:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MKX4dm70rCtBR5X44qlEngKew3Jqw3dD4Qrv50bbZQvI+gfX45zbNanFDq7MgUn3EESrhytHx5Wm1C3Uc6RQb8uuoF1xQ8vL/0TLclerhurYW7g1BoNBaV9lNvvy29+oL4pNIsGvOd6D+IK1blmRuNljty1y2h0H5ik7KHgb4Zu3GprPcJlLNOnTj2ySgr/pGnEdATahhuETUZyhH7bw24yQ70Ug8KbvGFvQgEI8SINCuIxrrrWWEB7mFPJOe/l/0sqgreaE/91nRLYKM26NV94/+3iRCf3Qw0N9EwqsUpd/gR8032s6O0q+ozs75wIky14J3JaUF2Iwv7W8e1RYIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fPrSlkCowzmhKOhxCU1iwAYzw65xA52H/H5/bpkV7iI=;
 b=ZNnUKyvqevaKdqDwaViT6RhG8BAmGU6gdj2RaOtj8BxKcjie40IL1b7AMdNs3eRM+xlVu/BZhO0Nz9fcuFnGYmu6mSQBAZTDCJGBCZRv5QYh1UCcjamIJWJqCr0+Z60bC6mfGA0JgMPXRpY9diVu7N7HmBU8t37l3kcfmpwW6umG6TUWOqLUJMPQa8m20/b4ozKtGr8rj28nhyHoLhd1oNYHpMuiq0s7A7uWcJT/7BVUZ9PpU7Rc/ZfEn6riZiGqdn8em57RZCxuYhszZVy4Q5aPn2mqLKSW23CbFXL1wzSnxuKC83bpbWJ9CfrDwKGnHyPDBzPiAwKaq90FvbbDdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB5981.namprd11.prod.outlook.com (2603:10b6:510:1e0::15)
 by CO1PR11MB4964.namprd11.prod.outlook.com (2603:10b6:303:9e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.27; Tue, 16 Apr
 2024 08:20:48 +0000
Received: from PH7PR11MB5981.namprd11.prod.outlook.com
 ([fe80::8970:61a2:f00d:b23f]) by PH7PR11MB5981.namprd11.prod.outlook.com
 ([fe80::8970:61a2:f00d:b23f%4]) with mapi id 15.20.7472.025; Tue, 16 Apr 2024
 08:20:48 +0000
From: "Manna, Animesh" <animesh.manna@intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Murthy, Arun R" <arun.r.murthy@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
Subject: RE: [PATCH v2 5/6] drm/i915/alpm: Enable lobf from source in ALPM_CTL
Thread-Topic: [PATCH v2 5/6] drm/i915/alpm: Enable lobf from source in ALPM_CTL
Thread-Index: AQHajPOx+kARdWocSEKjTgZ2m8uaKrFpIAuAgAFy/tA=
Date: Tue, 16 Apr 2024 08:20:48 +0000
Message-ID: <PH7PR11MB5981972857C523A13EEC56B6F9082@PH7PR11MB5981.namprd11.prod.outlook.com>
References: <20240412155243.2891996-1-animesh.manna@intel.com>
 <20240412155243.2891996-6-animesh.manna@intel.com>
 <e4c8d59b514ddf260934104f0021301ea1c0d2cd.camel@intel.com>
In-Reply-To: <e4c8d59b514ddf260934104f0021301ea1c0d2cd.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB5981:EE_|CO1PR11MB4964:EE_
x-ms-office365-filtering-correlation-id: ad7efbcd-3864-43c7-35b7-08dc5dee1eea
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GcYpJmgC5S/QP/MXoSaZBAf/MpEADlUmYM8kq55ILLLaegmr38UheFdDkws6CejxtISJbDW7zljl8mSwJ2rMFeCPj9l2y8vGhNHkJS9YWryByaiuKA7SjBLEOyYTKEExsFKJiQKebIZ6jg+ftNu7uLr6fpLs3Enk1CwfjYfd9yRC7WJR9YCPr3HoaB4oOQojDN5Tkyg54BjMKOpSuuHV7qg6WbroiZCAVzEQfQ/MvYopa128R2r9ncJJY0wL+SD1+oV+a6VgY8RoNKgu1Y2DB6wZkRLI+slRYuARgWb4B63NGjCg7OoVkdbeVfqFOlsS4BDcZkO+eU3q4vr0pDyO4xHZ9R2HEKOcO6rImYHenEP5u9TXl40FvzM4JFfNlA9w8OxiJ8y/G+qOuFLGze8Df3Mz4Aq3R44LQypeLkwF8v8Ftq6cwp0Wd4HXxmi6dPa4X1UhSgUZLLoJPw/LviJpj2vVZ9a/hXM0OQEwsm2puw/5cDT3qflJOkzGlsDeewKs+oF8Vja3tVSPXWQ2drtxjH2opt/3jTKCyz8eR3VZNLlrz6rDWOHKVgUK+ses9ZEFQEJFGFfcnPik0bq9Wh9ykfN/FxGJll+sq5TPcT7F7XRilnR0qgKMglEUv/vxw54QVWL42MLFnDMawzgvNWKicrJ+3/zJE3VxwigZFEueADt4o4vZKpPRp8K/gq0KyFd9AcgkdKr7yBZ7WkHfjsH2Oeuuy9nrYZz1vgty3EFk/eo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB5981.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZSt6dGVsdzh4d0hqTkJicHVvSm41ZE54RmdUT2lhUitQUFZoTmNSN2FXZysw?=
 =?utf-8?B?bkpST29QbW1SRlFQeFRueGVhcStPZ2ZhSUZDS0RsVlE0ZmsvZVB6SkF2ZlNy?=
 =?utf-8?B?bHU5OElWL0doQkpIWGNJdlFnRDYydFllM0RrcGdHT3cxTUpZaVZrM0U3THpy?=
 =?utf-8?B?UVZtdDAxV0hLc2FCdDNaL0RLK09yUVBXd3NCdW1xcW9PeXlOYlYrc1RvOHB1?=
 =?utf-8?B?N0U5STRra2hiSVBtN2Zra2J4dSswZ3JOaHJLdFJuZ2NnTVVaTXZKY044U2Rw?=
 =?utf-8?B?UHY3OHZybVg1aThURlRNNmg0Q2N1NnVtVTNLR1RUM1l0eEIxd1FHaElsOXo4?=
 =?utf-8?B?cXlVdWM5VWxTT2xEZ1B6S3lmcy93cmZzbXB0d3p5MGQxa2FrRXZQRDhURDZ0?=
 =?utf-8?B?a0hMWHFMeGJZTGc0ZnpyZ1I1NTVUS0tQYnMrL294Y3lQTlNGT2x3QU1ueFFm?=
 =?utf-8?B?OVpCRCs4TnYyVGVjWVRRbVh6K2FsbE1lS3l3MDVzL283VVdnYXkzdW8yUU9K?=
 =?utf-8?B?eE42Z2RWdkNjdXJTUGxFdDkrZ0ZEWHQzSWRTakU2dFlkUlU3WklGbHJhVFNB?=
 =?utf-8?B?VjBmR1QvVDA5SnIvZHdrVEVMdkRmZVp5aVRWUVZyNWI0QjJ5WVZDNm4vcEVP?=
 =?utf-8?B?a2xhYXhrZ2YzN3ZTYk93alF2YjhFbml4UjMrS3RqTlpmM2Z0eTl5My9ka1hJ?=
 =?utf-8?B?ck80eG0wT1QyLzcrL1pDUWVxclY4YU1KYUxlc0xjVzhnY1FKVWhRd0JUeGsz?=
 =?utf-8?B?cU9TZDlZd0xhTjRkVlhSZ1JFT2tqYUsxeURFZnBLY3hQMm8xQlJnbVdKQWZj?=
 =?utf-8?B?MGh5V3dKRSttZk9rU3NqTGtLSDVpaEFNOWVRRWJLMGhpZ1FpMjJzckI5MzdR?=
 =?utf-8?B?ZExHaVJaTG1ycFJkZXp3RVBvdHBsTFFMKytzNEg3L2xqUHFjQVk1aWpFWGNN?=
 =?utf-8?B?VlZhMW5Qb29CVzBNSFdxR2RNQ1NtckgzSUVOSWdsVEVuVWp1NmFSSVVYQ3Fj?=
 =?utf-8?B?QUxEKzJIQys3dThmNzFFT2FsbFU4dkZndUJQVUpVWU1pN1BrME8yUjIvTUJD?=
 =?utf-8?B?SkVXM3JwdHY0cVA5WUkvMnFvQjZvQ25NaUpIamZ6cVZrZWo3ZjlMK0pNZ0dr?=
 =?utf-8?B?T3Zrc2dWbFhqVWpCRy9nUGhGUk9Ic0p3ZndZMDJyM0QvUTd0REtjVUkwMnVq?=
 =?utf-8?B?T0Y2dzFqNXp4UFoyOFlVOUtiNkdmRFV2VHpxTFhiY09UclhEWjJQRXlYZEp2?=
 =?utf-8?B?eWowT3kxb2RHS2JRRVdaNVR3aWVKQnFjM2FXOW5QOUJ1aGkzRUlWU3JDMEpw?=
 =?utf-8?B?T2hBUVhvSXZTL2ZaclZGeXg5QTRlZndsaTR5cmh5VEpYNEpWdEErR004aWhs?=
 =?utf-8?B?VkcxUndJMkFPYm9ySDJFOSt4QWp6SUtOYStrV0h6TEYrRlU4SXNrSVNvOGll?=
 =?utf-8?B?TjJSWnJGditoVUNyM3Y1OWRIdWVrOHo3Wm5Rd0RnaVJ6OEFieW44b1VBaUhI?=
 =?utf-8?B?SFBmOFkvK2VBWFRiN1lCbEJYYVZJYVYwNGFSUXpBZEF4RHFyWEhibEJEZmZp?=
 =?utf-8?B?T09ESG1BVUE5WUQxdWN3ejdEMER5c0k4NTgwN3U1Z2srT0phcW94N1BZR3Av?=
 =?utf-8?B?YmdadEgxdkNqdFMyOGNFblo1SGhCTUVSaWxhTG03cDJDU3EvQ09IVFM2eFVa?=
 =?utf-8?B?VEQrN3hVb1lGVWlZTUUwSkpobngzY3ZDMjdEcVBMYm44T2tGeGhIeW9kcStO?=
 =?utf-8?B?ZEVxaE1QT0RPMlpZckZYUjFzKysvL2wwVXFYcWhFZW5aQzhTVEdYMGM1ZzZB?=
 =?utf-8?B?LzRYa0R5NFYzQ2NmL0FDTHhRci8zeWpyWEFTTXJVV0xXVkVlMVZ2SzZYZ0ls?=
 =?utf-8?B?M0ZpNjdmQTBFcmhvVVZ0amhydVZYejBuTTBiLzZLNVFQZWlBbUhLNEdmTHZ5?=
 =?utf-8?B?U0dWNnpxcVZDd1VOTTlYS1gyMWFxNUFWTmlGdHA0WnArTnlsNEdodnZubDd6?=
 =?utf-8?B?cTBBbHh2MkNMMzNLMEU5SGt5M2t0WWoydS80c1VsMnR4cDBSREtnZ1AxQnZ0?=
 =?utf-8?B?T0hIb1MvSFREc2FSTzA4N3JwdFR2RTlmTmdpeDVJZzlwb2NZVU9lMUdmcXdk?=
 =?utf-8?Q?vKcJ0y5uiYrcit6vxLD9GCOTr?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5981.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad7efbcd-3864-43c7-35b7-08dc5dee1eea
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2024 08:20:48.1967 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zws80djiwiHSeEq0hC+xhgK6WXFzjkf52sCXWutuUCw8RlCwxGnwXto3I//qCOHygxvo87xdAQr62lgi/uBR2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4964
X-OriginatorOrg: intel.com
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSG9nYW5kZXIsIEpvdW5p
IDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgQXByaWwgMTUsIDIw
MjQgMzozOSBQTQ0KPiBUbzogTWFubmEsIEFuaW1lc2ggPGFuaW1lc2gubWFubmFAaW50ZWwuY29t
PjsgaW50ZWwtDQo+IGdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmc7IE11cnRoeSwgQXJ1biBSDQo+IDxhcnVuLnIubXVydGh5QGlu
dGVsLmNvbT47IE5pa3VsYSwgSmFuaSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPg0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIHYyIDUvNl0gZHJtL2k5MTUvYWxwbTogRW5hYmxlIGxvYmYgZnJvbSBzb3Vy
Y2UgaW4NCj4gQUxQTV9DVEwNCj4gDQo+IE9uIEZyaSwgMjAyNC0wNC0xMiBhdCAyMToyMiArMDUz
MCwgQW5pbWVzaCBNYW5uYSB3cm90ZToNCj4gPiBTZXQgdGhlIExpbmsgT2ZmIEJldHdlZW4gRnJh
bWVzIEVuYWJsZSBiaXQgaW4gQUxQTV9DVEwgcmVnaXN0ZXIuDQo+ID4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBBbmltZXNoIE1hbm5hIDxhbmltZXNoLm1hbm5hQGludGVsLmNvbT4NCj4gPiAtLS0NCj4g
PiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5jwqDCoMKgwqDCoMKg
wqDCoMKgIHwgNSArKysrKw0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9kaXNwbGF5X3R5cGVzLmggfCAxICsNCj4gPiDCoDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRp
b25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9hbHBtLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
YWxwbS5jDQo+ID4gaW5kZXggNjk5ZjJmMDUxNzY2Li5hZTg5NGM4NTIzM2MgMTAwNjQ0DQo+ID4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmMNCj4gPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uYw0KPiA+IEBAIC0zMjUs
NiArMzI1LDExIEBAIHN0YXRpYyB2b2lkIGxubF9hbHBtX2NvbmZpZ3VyZShzdHJ1Y3QgaW50ZWxf
ZHANCj4gPiAqaW50ZWxfZHApDQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBBTFBNX0NUTF9FWFRFTkRFRF9GQVNUX1dBS0VfVElNRShpbnRl
bF9kcC0NCj4gPiA+YWxwbV9wYXJhbWV0ZXJzLmZhc3Rfd2FrZV9saW5lcyk7DQo+ID4gwqDCoMKg
wqDCoMKgwqDCoH0NCj4gPg0KPiA+ICvCoMKgwqDCoMKgwqDCoGlmIChpbnRlbF9kcC0+bG9iZl9z
dXBwb3J0ZWQpIHsNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYWxwbV9jdGwg
fD0gQUxQTV9DVExfTE9CRl9FTkFCTEU7DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGludGVsX2RwLT5sb2JmX2VuYWJsZWQgPSB0cnVlOw0KPiA+ICvCoMKgwqDCoMKgwqDCoH0N
Cj4gPiArDQo+IA0KPiBJIGRvbid0IHNlZSBsbmxfYWxwbV9jb25maWd1cmUgYmVpbmcgY2FsbGVk
IGZvciBsb2JmIGNhc2UgaW4geW91ciBwYXRjaGVzLg0KDQpFbmFibGluZy9EaXNhYmxpbmcgTE9C
RiB3aWxsIGJlIGRvbmUgYWxvbmcgd2l0aCBhbHBtKGF1eC13YWtlL2F1eC1sZXNzKSBlbmFibGVt
ZW50Lg0KSGVyZSBsb2JmX3N1cHBvcnRlZCBmbGFnIGlzIHRoZSBzd2l0Y2ggdG8gZW5hYmxlIExP
QkYgb3Igbm90Lg0KUGxlYXNlIGxldCBtZSBrbm93IGlmIEkgYW0gbWlzc2luZyBhbnl0aGluZy4N
Cg0KUmVnYXJkcywNCkFuaW1lc2gNCg0KPiANCj4gQlIsDQo+IA0KPiBKb3VuaSBIw7ZnYW5kZXIN
Cj4gDQo+ID4gwqDCoMKgwqDCoMKgwqDCoGFscG1fY3RsIHw9IEFMUE1fQ1RMX0FMUE1fRU5UUllf
Q0hFQ0soaW50ZWxfZHAtDQo+ID4gPmFscG1fcGFyYW1ldGVycy5jaGVja19lbnRyeV9saW5lcyk7
DQo+ID4NCj4gPiDCoMKgwqDCoMKgwqDCoMKgaW50ZWxfZGVfd3JpdGUoZGV2X3ByaXYsIEFMUE1f
Q1RMKGNwdV90cmFuc2NvZGVyKSwgYWxwbV9jdGwpOw0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfdHlwZXMuaA0KPiA+IGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3R5cGVzLmgNCj4gPiBpbmRleCA2
MTE2YzM4M2I1NDMuLmY2MWJhNTgyNDI5YiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfdHlwZXMuaA0KPiA+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV90eXBlcy5oDQo+ID4gQEAgLTE4ODQs
NiArMTg4NCw3IEBAIHN0cnVjdCBpbnRlbF9kcCB7DQo+ID4NCj4gPiDCoMKgwqDCoMKgwqDCoMKg
LyogTE9CRiBmbGFncyovDQo+ID4gwqDCoMKgwqDCoMKgwqDCoGJvb2wgbG9iZl9zdXBwb3J0ZWQ7
DQo+ID4gK8KgwqDCoMKgwqDCoMKgYm9vbCBsb2JmX2VuYWJsZWQ7DQo+ID4gwqB9Ow0KPiA+DQo+
ID4gwqBlbnVtIGxzcGNvbl92ZW5kb3Igew0KDQo=
