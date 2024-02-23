Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E412860EF8
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 11:13:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D28F310EB78;
	Fri, 23 Feb 2024 10:13:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G0gphqAy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED48510EB77;
 Fri, 23 Feb 2024 10:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708683206; x=1740219206;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JueZNUZBYz4tPboDy2j9/Wac8MLEtfbbNWGgiVQRpYI=;
 b=G0gphqAy07QRfJQM2nBadAmgoUpmadCBe4gJ9nVQrWMGLVFXstZWytll
 2l/CD0+N6LT03SjG9EYvKKYw+AoPJ8c+dGtceCIB/HzEf41Gztm5cmHyf
 zO7ACQ3jVqOHOv1BLt6rCp3q9HrzIjrQX8afoX4hw9h7B5tkOyPfSFobE
 ZxQurLc0CYUWSYIQZx/EQBHjHlwck3S6/AOHk1ZXBZQ10VjIvJwYG1IcO
 wrjCWPJ3YE31dMVciEw233REVO1Tk53bFbDkEcXtZ9cqi7vVLSGBZQwGB
 gCJRt4tX1hu7cuvaMUEvarZy7a9ipqY+JrlbhGaI0CVmTW+2WS0dG8DhO g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="20528080"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="20528080"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 02:13:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="36879156"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Feb 2024 02:13:25 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 23 Feb 2024 02:13:24 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 23 Feb 2024 02:13:24 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 23 Feb 2024 02:13:24 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 23 Feb 2024 02:13:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VaElxOEjCowyNxefw1bTCRVLCHVKsxY+1Ohu1ZcmEd5JcVJoBmddiYLIMAzJ9JdqAVgtmfEs7fevBHDr8R6Atf15iJJ7hrOrJZOxnE3iUg4yyILc1nOARvUYG5D0VqOGiy2fnl+j2y6hjz+4LGrRE3MiBCvYgxv9zbUKnpkWR3kOPmGyjpEl1T8lHdmRRuozRsiEAmYAaKr3MLL7qwlhNDMOSNEb9B858fYT3vETcjXSoptmAE8Y0LgvAm8Ei4Bhsn0qXQ7GjWCZt2VByQJzTeJ3NnkjEJ/wKZ2RK8oUMOCeaSB1Hu+zcgGpk5qb77facbsytwpyR6WAyxgWe3AOZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JueZNUZBYz4tPboDy2j9/Wac8MLEtfbbNWGgiVQRpYI=;
 b=F6pZdVu47I9Ob8wF600kE/NyOk1LdSzmf0Fy9Lrru3K3BdBgAuUKEd42hF73valA4XNJ/piTz/4W3OQ/9BkjCASHDtdhldw86Fgd2NtKyn6HS6xnLZiyKvuHO00lmQS/KQ9vHilE2aHLoAiSiRPvFmg+XDFvQ/KT7thwIWcBWPdzKj18zQYKHXRS8ztDMob2KN16UTRgjZBIRjM4xwoOHtMKh7ZB0NHlGITT4ju+HBJnOpG5pSz6/UQHrPbJ+VrhU+NUBTUR+bJ2xkimAta2yBNKuBMjlBJUbuwSp0EXhPMYnRkXa6Jm1ROqVx4aArvBQfKTXsEbL+PqGcYa4gkRbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 CH0PR11MB5540.namprd11.prod.outlook.com (2603:10b6:610:d7::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7316.22; Fri, 23 Feb 2024 10:13:22 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::590:38d5:5c7c:3e4d]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::590:38d5:5c7c:3e4d%7]) with mapi id 15.20.7316.018; Fri, 23 Feb 2024
 10:13:22 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: =?utf-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: RE: [PATCH v2 13/21] drm/i915/dp: Add DP tunnel atomic state and
 check BW limit
Thread-Topic: [PATCH v2 13/21] drm/i915/dp: Add DP tunnel atomic state and
 check BW limit
Thread-Index: AQHaZEJ7z17pU0c5dUCBuhZdYm5uk7EXuTZQ
Date: Fri, 23 Feb 2024 10:13:22 +0000
Message-ID: <DM4PR11MB636049A2AE13E750689F9272F4552@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20240220211841.448846-1-imre.deak@intel.com>
 <20240220211841.448846-14-imre.deak@intel.com>
In-Reply-To: <20240220211841.448846-14-imre.deak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|CH0PR11MB5540:EE_
x-ms-office365-filtering-correlation-id: 91c99ea0-8a6c-4ec1-9355-08dc345810ce
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PK9aegXSaKIX1ONUnzL4AqRHEvpJHfrOe6MtNTYd3u+ehkdDNIKzHcfj4VMnIQfzO4QowI8yrsdOHAttAkmwbU6lsZO6c6FgJK353d7zhufsW8q8jA+RflylfB3oaXUz4+aDinDmFZ+XYD3HLplUXpKSGTJOlk+/9kI0918ztHppbg60pWpBEHHDO831pGObr9N2GyY27hrEzRhYaHPVzXaldKoFnEIGHgyWumzjOFpYSXWbPbpYLWLfZ9kB7cnZqwzRIAGBP7rmVfhCLP/eKvT7kIh7N1bUdVZ4mbPiQNkN9/c6+jDwqrrtE4AA+2vSNN2sw+BzeaPKJFCu9M/z5B+c5yd28d2RH7OYWAVvNpSHsSzZw+5WFmXluISq9pChtcdtbaYSaF8FR8olSA/jjKyrxiAO4Mp4yXmEIT/VxkvB5Z0RHbFkdGpXnO6uAS7JQCpEzqyitaqu/vo/K2kot55X4OcAJWZk3wTfZoKstDhwfr/jI+I0eVNKaf6JyQaqEbHS3jqj9eFtawMN3rjJqCzMpB+zLRIgqEuDRrOyRY4On6owHW5FLY5/T2fsrFcnp16b4EqWlkwa0oCa1z3BPG5X1QYyzX3GbLm4VvdZQVyfgrF0g7KsXwD2BiFTvqKN
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a0xiOXRZMExSVmxZVVlaT3k4RnhJWFdNaTJkL2ZrMjBpamdqMS9JRWhGdEZU?=
 =?utf-8?B?MnVLVXhPc3hEeVMxd3JrVXQvVnRNZkc0c2hNYzlQZE8wZDg1OWt4ZzRsSXhC?=
 =?utf-8?B?MWJRV3NxKzk0YTJPRlE3a1k1NG5hTVZielpqU2JzT20ydnJFdVlGR3R4aVdV?=
 =?utf-8?B?YWlkUVQrbCswRDc1cXg0aGJLaEFOTHUwdkpMMGloM00rUUlEd3dqS3J4ZFZW?=
 =?utf-8?B?TkdINWJlSHBhLy9wQmdnTks4OFg0b3l3MlEyV2djOXVxNmtOSlI5YUFNem84?=
 =?utf-8?B?VGVhaHZkN3hvOHQ4ZWFxVndoOUpuZU9RNy8zUDdkWWJRN2ttc0RGVjdoQmZ2?=
 =?utf-8?B?Zm5PM0l5cGJlUFNncW1pNEVPQnhITFUxTFo1dGNqYTJWN3lVOXNmOUI4UDRC?=
 =?utf-8?B?OCtTeG1nNXFUSUVUc0twRlFCUVBuVjRxb2JWUlArUGtxZlRvaUYzYTNiTFlx?=
 =?utf-8?B?anNLYWhPd0FqMGlTREdxV3pNT3JobklXdEROMnRVY1orZ3grSVpwL2ZJeUd5?=
 =?utf-8?B?TDZFdFVUenlLbm9kMDkweFlyV0duaFlJUmV1NkFOdnNmaTliVFFycjNZQVBM?=
 =?utf-8?B?NFY2RXltRnloZzdqVWdPK3RnZENCbVRsNGprQ1hrKzVndDcwWVdKMmFQRUlj?=
 =?utf-8?B?TWZYWXlNSFo2SVdjMmRtSFFJdXdoYUlaa2Z1L2F4S1Bta05HVG9rNEJRQkpt?=
 =?utf-8?B?bkFmNXlWdTFHMFo3QXl4aXhGenIrVzY0OFRDQ1BoeVB2SkZncjJiVUVvR1Fa?=
 =?utf-8?B?MGRZVFB5Z2ZrVFhveWZZcWJFWjcrTi9hNkVPQlZXVU4xMGZnV2ZRVVFzNC9H?=
 =?utf-8?B?NzBhYllNZjQ0YzI4WnFhQ3BmdGhCNHpmOFZZWVhCYnF2d0dxZUJxY1JqYmhT?=
 =?utf-8?B?UEtSR3ZJZU96MnBvbGpSTktxZUN1cVVlQjRSdEQzbVl5REJXUEczT2IrN1lH?=
 =?utf-8?B?Wi9SVGlZeGx2bDdMeXRnN25RNENyOXdSUktXNS9xeEk4SlplZWpJK1dEamZK?=
 =?utf-8?B?eTRyNHFtUFZra3czejlKY3JtZ2todHNMZ2g2RWNmT0VjbUQ2UFhHRDZxR3d5?=
 =?utf-8?B?SldJck5aQVA2U2tuNHlYT1NNeWY0c3ZPZ0hYdHhWUTRaYlFNTjZHTEVMQXlm?=
 =?utf-8?B?bXFmTlhQZDN3YVo5UlRBWGt5NXlBaVFLVHRSVlZvVXpVdjZUeWYwVHBUTi9L?=
 =?utf-8?B?MWV6UmpIQ3RkUXVsanVKQXVTbGdyd3E3aC9IaEJ6K1htOEsxbWRPV1ljejFy?=
 =?utf-8?B?RHZ3aDd4a1JuejZaWFZlUTgvaG92Vk9OTXM0MFIxeDh6TEVaT00xWDA5UURC?=
 =?utf-8?B?Zk5FQ2p5TU9RSjVCMjNUbHdxTmRUbzlrbThNbkd0b2g4RWxWM093OTJwcVFh?=
 =?utf-8?B?SXBOVzlZNUV0T0JMa3RWWk5HU0p2NUJPcXV1UEY5b2RtTXFQZEx0VWxxNVlu?=
 =?utf-8?B?RVdrek9PTG8zaFlDZ214c3FIRHppVWtUeTByTTVwZEhFcVRCWGJLa3FaNDJy?=
 =?utf-8?B?eHpZUmRxdExERDAxbmR6SzlCWUJsbkRubW5WbHRIamlhOExLNkEzNXBtV0Fo?=
 =?utf-8?B?NjNpVHhQUUZYRksxQlVNemJsMkV0R2xwblJKVXFXcE9NVGlyVnVWTnZiNy9m?=
 =?utf-8?B?c0pJVDQ5RlBLWGpqRVFFeEpKekExMHJQRnR3Vi9OTE5kRU5FK3c5N1JSWFk3?=
 =?utf-8?B?d2JSQWFuaHpxZ0M1QndSb0t3NUQzZ1k2Z3FvRytjSWlRVmN4MFlYUkY5M1R3?=
 =?utf-8?B?SkMvRjlDVzVJbGhKMHFRYXpWMnEvQThad1RYS3hsZ25aa1pDOVFOZ3UrNXhJ?=
 =?utf-8?B?TjI2S0FkY2hJOXNoOC8zZDJWYlVmY3cxeXVKdU5zUUFoR3JMOXVRY2lEZHlW?=
 =?utf-8?B?OXV1YlBCanE2L29Ldk5reHlpb0pKa2RLaUp3T1EzbnFIT1NUL1lINkJLY2ty?=
 =?utf-8?B?bU9uaUVFTFpEMlJRM01mR3U2VnIvSVpLbmNCZTh4ck5rN2RLNmNiTzNCWEkx?=
 =?utf-8?B?cFlvV3NWSGh5T0VaeXhzcXhvb3RVQjFCbVBKZlEvUUNxMUsrYjFFRUgrNkRm?=
 =?utf-8?B?bnQ2VkF5Ymlmdllab1FjZkdlaFdFeU55Ukg5czBMV041Ukw4dVpycU0zN3Ru?=
 =?utf-8?Q?G3RTn6G6gyCHSD80SiDjnr73r?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91c99ea0-8a6c-4ec1-9355-08dc345810ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2024 10:13:22.3113 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j4qHqHGU9dJgGCNzxIakk8Ax/Qi25n/kKHR3HVdeKa06tA5kQYrKGVPSXsrurj5prNZwzEK/SsTWS9k86kr0VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5540
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogZHJpLWRldmVsIDxkcmkt
ZGV2ZWwtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBJbXJlDQo+
IERlYWsNCj4gU2VudDogV2VkbmVzZGF5LCBGZWJydWFyeSAyMSwgMjAyNCAyOjQ5IEFNDQo+IFRv
OiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQo+IENjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50
ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggdjIgMTMvMjFdIGRybS9pOTE1L2RwOiBBZGQgRFAg
dHVubmVsIGF0b21pYyBzdGF0ZSBhbmQgY2hlY2sNCj4gQlcgbGltaXQNCj4gDQo+IEFkZCB0aGUg
YXRvbWljIHN0YXRlIGR1cmluZyBhIG1vZGVzZXQgcmVxdWlyZWQgdG8gZW5hYmxlIHRoZSBEUCB0
dW5uZWwgQlcNCj4gYWxsb2NhdGlvbiBtb2RlIG9uIGxpbmtzIHdoZXJlIHN1Y2ggYSB0dW5uZWwg
d2FzIGRldGVjdGVkLiBUaGlzIHN0YXRlIGFwcGxpZXMgdG8NCj4gYW4gYWxyZWFkeSBlbmFibGVk
IG91dHB1dCwgdGhlIHN0YXRlIGFkZGVkIGZvciBhIG5ld2x5IGVuYWJsZWQgb3V0cHV0IHdpbGwg
YmUNCj4gY29tcHV0ZWQgYW5kIGFkZGVkL2NsZWFyZWQgdG8vZnJvbSB0aGUgYXRvbWljIHN0YXRl
IGluIGEgZm9sbG93LXVwIHBhdGNoLg0KPiANCj4gdjI6DQo+IC0gcy9vbGRfY3J0Y19zdGF0ZS9j
cnRjX3N0YXRlIGluIGludGVsX2NydGNfZHVwbGljYXRlX3N0YXRlKCkuDQo+IC0gTW92ZSBpbnRl
bF9kcF90dW5uZWxfYXRvbWljX2NsZWFudXBfaW5oZXJpdGVkX3N0YXRlKCkgdG8gYSBmb2xsb3ct
dXANCj4gICBwYXRjaCBhZGRpbmcgdGhlIGNvcnJlc3BvbmRpbmcgc3RhdGUuIChWaWxsZSkNCj4g
LSBNb3ZlIGludGVsX2RwX3R1bm5lbF9hdG9taWNfY2xlYXJfc3RyZWFtX2J3KCkgdG8gYSBmb2xs
b3ctdXANCj4gICBwYXRjaCBhZGRpbmcgdGhlIGNvcnJlc3BvbmRpbmcgc3RhdGUuDQoNCkxvb2tz
IEdvb2QgdG8gbWUuDQpSZXZpZXdlZC1ieTogVW1hIFNoYW5rYXIgPHVtYS5zaGFua2FyQGludGVs
LmNvbT4NCg0KPiBDYzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVs
LmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogSW1yZSBEZWFrIDxpbXJlLmRlYWtAaW50ZWwuY29tPg0K
PiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYXRvbWljLmMgIHwg
IDYgKysrKysrDQo+IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5j
IHwgMTIgKysrKysrKysrKysrDQo+IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
bGlua19idy5jIHwgIDUgKysrKysNCj4gIDMgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygr
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
YXRvbWljLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2F0b21pYy5j
DQo+IGluZGV4IDk2YWIzN2UxNTg5OTUuLjc5OGNiOTAzNjFhODMgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYXRvbWljLmMNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hdG9taWMuYw0KPiBAQCAtMjYwLDYgKzI2MCwx
MCBAQCBpbnRlbF9jcnRjX2R1cGxpY2F0ZV9zdGF0ZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMpDQo+
ICAJaWYgKGNydGNfc3RhdGUtPnBvc3RfY3NjX2x1dCkNCj4gIAkJZHJtX3Byb3BlcnR5X2Jsb2Jf
Z2V0KGNydGNfc3RhdGUtPnBvc3RfY3NjX2x1dCk7DQo+IA0KPiArCWlmIChjcnRjX3N0YXRlLT5k
cF90dW5uZWxfcmVmLnR1bm5lbCkNCj4gKwkJZHJtX2RwX3R1bm5lbF9yZWZfZ2V0KGNydGNfc3Rh
dGUtPmRwX3R1bm5lbF9yZWYudHVubmVsLA0KPiArCQkJCSAgICAgICZjcnRjX3N0YXRlLT5kcF90
dW5uZWxfcmVmKTsNCj4gKw0KPiAgCWNydGNfc3RhdGUtPnVwZGF0ZV9waXBlID0gZmFsc2U7DQo+
ICAJY3J0Y19zdGF0ZS0+dXBkYXRlX21fbiA9IGZhbHNlOw0KPiAgCWNydGNfc3RhdGUtPnVwZGF0
ZV9scnIgPSBmYWxzZTsNCj4gQEAgLTMxMSw2ICszMTUsOCBAQCBpbnRlbF9jcnRjX2Rlc3Ryb3lf
c3RhdGUoc3RydWN0IGRybV9jcnRjICpjcnRjLA0KPiANCj4gIAlfX2RybV9hdG9taWNfaGVscGVy
X2NydGNfZGVzdHJveV9zdGF0ZSgmY3J0Y19zdGF0ZS0+dWFwaSk7DQo+ICAJaW50ZWxfY3J0Y19m
cmVlX2h3X3N0YXRlKGNydGNfc3RhdGUpOw0KPiArCWlmIChjcnRjX3N0YXRlLT5kcF90dW5uZWxf
cmVmLnR1bm5lbCkNCj4gKwkJZHJtX2RwX3R1bm5lbF9yZWZfcHV0KCZjcnRjX3N0YXRlLT5kcF90
dW5uZWxfcmVmKTsNCj4gIAlrZnJlZShjcnRjX3N0YXRlKTsNCj4gIH0NCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYw0KPiBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jDQo+IGluZGV4IGUxYTQy
MDBmNjdhN2UuLjE2OTczZWJiNzg2NWQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jDQo+IEBAIC0zMyw2ICszMyw3IEBADQo+ICAjaW5jbHVk
ZSA8bGludXgvc3RyaW5nX2hlbHBlcnMuaD4NCj4gDQo+ICAjaW5jbHVkZSA8ZHJtL2Rpc3BsYXkv
ZHJtX2RwX2hlbHBlci5oPg0KPiArI2luY2x1ZGUgPGRybS9kaXNwbGF5L2RybV9kcF90dW5uZWwu
aD4NCj4gICNpbmNsdWRlIDxkcm0vZHJtX2F0b21pYy5oPg0KPiAgI2luY2x1ZGUgPGRybS9kcm1f
YXRvbWljX2hlbHBlci5oPg0KPiAgI2luY2x1ZGUgPGRybS9kcm1fYXRvbWljX3VhcGkuaD4NCj4g
QEAgLTczLDYgKzc0LDcgQEANCj4gICNpbmNsdWRlICJpbnRlbF9kcC5oIg0KPiAgI2luY2x1ZGUg
ImludGVsX2RwX2xpbmtfdHJhaW5pbmcuaCINCj4gICNpbmNsdWRlICJpbnRlbF9kcF9tc3QuaCIN
Cj4gKyNpbmNsdWRlICJpbnRlbF9kcF90dW5uZWwuaCINCj4gICNpbmNsdWRlICJpbnRlbF9kcGxs
LmgiDQo+ICAjaW5jbHVkZSAiaW50ZWxfZHBsbF9tZ3IuaCINCj4gICNpbmNsdWRlICJpbnRlbF9k
cHQuaCINCj4gQEAgLTQ0OTAsNiArNDQ5Miw4IEBAIGNvcHlfYmlnam9pbmVyX2NydGNfc3RhdGVf
bW9kZXNldChzdHJ1Y3QNCj4gaW50ZWxfYXRvbWljX3N0YXRlICpzdGF0ZSwNCj4gIAlzYXZlZF9z
dGF0ZS0+Y3JjX2VuYWJsZWQgPSBzbGF2ZV9jcnRjX3N0YXRlLT5jcmNfZW5hYmxlZDsNCj4gDQo+
ICAJaW50ZWxfY3J0Y19mcmVlX2h3X3N0YXRlKHNsYXZlX2NydGNfc3RhdGUpOw0KPiArCWlmIChz
bGF2ZV9jcnRjX3N0YXRlLT5kcF90dW5uZWxfcmVmLnR1bm5lbCkNCj4gKwkJZHJtX2RwX3R1bm5l
bF9yZWZfcHV0KCZzbGF2ZV9jcnRjX3N0YXRlLT5kcF90dW5uZWxfcmVmKTsNCj4gIAltZW1jcHko
c2xhdmVfY3J0Y19zdGF0ZSwgc2F2ZWRfc3RhdGUsIHNpemVvZigqc2xhdmVfY3J0Y19zdGF0ZSkp
Ow0KPiAgCWtmcmVlKHNhdmVkX3N0YXRlKTsNCj4gDQo+IEBAIC00NTA1LDYgKzQ1MDksMTAgQEAg
Y29weV9iaWdqb2luZXJfY3J0Y19zdGF0ZV9tb2Rlc2V0KHN0cnVjdA0KPiBpbnRlbF9hdG9taWNf
c3RhdGUgKnN0YXRlLA0KPiAgCQkgICAgICAmbWFzdGVyX2NydGNfc3RhdGUtPmh3LmFkanVzdGVk
X21vZGUpOw0KPiAgCXNsYXZlX2NydGNfc3RhdGUtPmh3LnNjYWxpbmdfZmlsdGVyID0gbWFzdGVy
X2NydGNfc3RhdGUtDQo+ID5ody5zY2FsaW5nX2ZpbHRlcjsNCj4gDQo+ICsJaWYgKG1hc3Rlcl9j
cnRjX3N0YXRlLT5kcF90dW5uZWxfcmVmLnR1bm5lbCkNCj4gKwkJZHJtX2RwX3R1bm5lbF9yZWZf
Z2V0KG1hc3Rlcl9jcnRjX3N0YXRlLQ0KPiA+ZHBfdHVubmVsX3JlZi50dW5uZWwsDQo+ICsJCQkJ
CSZzbGF2ZV9jcnRjX3N0YXRlLT5kcF90dW5uZWxfcmVmKTsNCj4gKw0KPiAgCWNvcHlfYmlnam9p
bmVyX2NydGNfc3RhdGVfbm9tb2Rlc2V0KHN0YXRlLCBzbGF2ZV9jcnRjKTsNCj4gDQo+ICAJc2xh
dmVfY3J0Y19zdGF0ZS0+dWFwaS5tb2RlX2NoYW5nZWQgPSBtYXN0ZXJfY3J0Y19zdGF0ZS0NCj4g
PnVhcGkubW9kZV9jaGFuZ2VkOw0KPiBAQCAtNTM2NSw2ICs1MzczLDEwIEBAIHN0YXRpYyBpbnQg
aW50ZWxfbW9kZXNldF9waXBlKHN0cnVjdA0KPiBpbnRlbF9hdG9taWNfc3RhdGUgKnN0YXRlLA0K
PiAgCWlmIChyZXQpDQo+ICAJCXJldHVybiByZXQ7DQo+IA0KPiArCXJldCA9IGludGVsX2RwX3R1
bm5lbF9hdG9taWNfYWRkX3N0YXRlX2Zvcl9jcnRjKHN0YXRlLCBjcnRjKTsNCj4gKwlpZiAocmV0
KQ0KPiArCQlyZXR1cm4gcmV0Ow0KPiArDQo+ICAJcmV0ID0gaW50ZWxfZHBfbXN0X2FkZF90b3Bv
bG9neV9zdGF0ZV9mb3JfY3J0YyhzdGF0ZSwgY3J0Yyk7DQo+ICAJaWYgKHJldCkNCj4gIAkJcmV0
dXJuIHJldDsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfbGlua19idy5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9saW5r
X2J3LmMNCj4gaW5kZXggMjdlYTg1ODg5N2M5Zi4uZGZkN2Q1ZTIzZjNmYSAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9saW5rX2J3LmMNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9saW5rX2J3LmMNCj4gQEAgLTksNiAr
OSw3IEBADQo+ICAjaW5jbHVkZSAiaW50ZWxfY3J0Yy5oIg0KPiAgI2luY2x1ZGUgImludGVsX2Rp
c3BsYXlfdHlwZXMuaCINCj4gICNpbmNsdWRlICJpbnRlbF9kcF9tc3QuaCINCj4gKyNpbmNsdWRl
ICJpbnRlbF9kcF90dW5uZWwuaCINCj4gICNpbmNsdWRlICJpbnRlbF9mZGkuaCINCj4gICNpbmNs
dWRlICJpbnRlbF9saW5rX2J3LmgiDQo+IA0KPiBAQCAtMTYzLDYgKzE2NCwxMCBAQCBzdGF0aWMg
aW50IGNoZWNrX2FsbF9saW5rX2NvbmZpZyhzdHJ1Y3QNCj4gaW50ZWxfYXRvbWljX3N0YXRlICpz
dGF0ZSwNCj4gIAlpZiAocmV0KQ0KPiAgCQlyZXR1cm4gcmV0Ow0KPiANCj4gKwlyZXQgPSBpbnRl
bF9kcF90dW5uZWxfYXRvbWljX2NoZWNrX2xpbmsoc3RhdGUsIGxpbWl0cyk7DQo+ICsJaWYgKHJl
dCkNCj4gKwkJcmV0dXJuIHJldDsNCj4gKw0KPiAgCXJldCA9IGludGVsX2ZkaV9hdG9taWNfY2hl
Y2tfbGluayhzdGF0ZSwgbGltaXRzKTsNCj4gIAlpZiAocmV0KQ0KPiAgCQlyZXR1cm4gcmV0Ow0K
PiAtLQ0KPiAyLjM5LjINCg0K
