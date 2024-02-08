Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8241084E32E
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 15:30:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06F5C10E81A;
	Thu,  8 Feb 2024 14:30:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KxZ+e1JD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2834710E810;
 Thu,  8 Feb 2024 14:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707402626; x=1738938626;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=cO4DGQcN88X02fdmQJpLbysWXS60LYbn9HZfH6R3nPc=;
 b=KxZ+e1JDd0B1H5rI/w0zhcyPwSfc+nkqF1itmbpIgM6L+zCXLLFENWDg
 gPdGT9gmI1awoccMXOU1hhxtv+XIGuFs+fJGpxX0C7ZUt19D8HCM0cDad
 BTt1vrizubrAw4wEcZfna61oYWq/Pk1DYzfUy2M5my0flZmxbjhHfjUNX
 bHhcb4QuBL2AqtXSiz89Qi/uURYJ3geTIJ1VeX9aUaDbi/z2AEawUiWG5
 fAsjYRHkh3a4oggM13Oc6Cne6ym7viYrzWO+U4FwvBJlMY01owISOZfPG
 jF6gOI5jAOusHvOL42m+BICJSgQUJBQk5aIxfYZE6HO84Qvb+LsLmkWSQ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1380920"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1380920"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 06:30:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1654864"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Feb 2024 06:30:21 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 8 Feb 2024 06:30:20 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 8 Feb 2024 06:30:20 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 8 Feb 2024 06:30:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iS+QqV8UZOf5PEtscEdhgmjDEfmOgWFYmTnV7ExD6Ctyu7XYTV7tyYJk7eNNlk86tkJvagAHIiL7Mxdl3TFJhtYU6708LaIp6eQtKu7hvpLUaPnybrj9z7cn5dznOlH/YuUwCS1KCPGTLb7jaPthC1chFeko/ZE7pa+oNv4Y6ku37viKAld5foz4B19tA2kfTGXidXEaepPE95htV+u5pZ1byhwALBRlG1Htuxk5Lvr24FSRE+5ktciNMCL7rhaUERCfAR88h78iEPnuch0su5wFFFP5HyIRYP9qe6XayAgawztknNmW2PVGtxjU6J2HLDbVoSt/a85dIA3lqehVkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cO4DGQcN88X02fdmQJpLbysWXS60LYbn9HZfH6R3nPc=;
 b=EaOgxhgAt2h6L5OPUEas6htCxhPigqSea6avjE5bf/2RVQ6Vtz6ApZYKiIAXNKQNHutCZKCRKazNaJiDDksVU/XFILpuYAdnlgwSjHvGXp5NOn6sK2n0fhU2y8h/XZWccaAJtDg37x27+JTFUelhTJzLD9yn4vnAxGsbVtAiiK2E+Ve2P2C0DkpdWvSg5q/0L3yrbQKtszNokQSVgMQ5/aOwsN6R5csG9zM5nxDBeY0Tkwivy2bFb7N85ArINRQAZ09Gwc9BIXsqzEiLBCmUOlxLXHhh480rdyXAtegs3hO0HSfT4M2NI5wZzceHxNRsQ3lVUwKJQyrgHI2R3ByEKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by MW6PR11MB8312.namprd11.prod.outlook.com (2603:10b6:303:242::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Thu, 8 Feb
 2024 14:30:17 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f3a9:7ba0:d19a:a630]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f3a9:7ba0:d19a:a630%7]) with mapi id 15.20.7249.035; Thu, 8 Feb 2024
 14:30:17 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "Intel-gfx@lists.freedesktop.org" <Intel-gfx@lists.freedesktop.org>
CC: "kenneth@whitecape.org" <kenneth@whitecape.org>, "Zanoni, Paulo R"
 <paulo.r.zanoni@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Ghuge, 
 Sagar" <sagar.ghuge@intel.com>, "Balasubrawmanian, Vivaik"
 <vivaik.balasubrawmanian@intel.com>, "Nikula, Jani" <jani.nikula@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "Ursulin, Tvrtko" <tvrtko.ursulin@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>
Subject: Re: [PATCH v2] drm/i915: Add GuC submission interface version query
Thread-Topic: [PATCH v2] drm/i915: Add GuC submission interface version query
Thread-Index: AQHaWmhhgwFANVHU4kmlLC0PYFc33rEAgdiA
Date: Thu, 8 Feb 2024 14:30:17 +0000
Message-ID: <8a0a964cc1312e5fcccf0850d72e6374bb578943.camel@intel.com>
References: <20240207115612.1322778-1-tvrtko.ursulin@linux.intel.com>
 <20240208082510.1363268-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20240208082510.1363268-1-tvrtko.ursulin@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|MW6PR11MB8312:EE_
x-ms-office365-filtering-correlation-id: d959bbec-2639-4a70-9301-08dc28b278d0
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +iWz6KLx7PARHLfBdCu07kHke1zp6Iw2BjDzr0uDsFToucXcYoVxhwKyFkThPp8+KKWx2GAsEUf8BAh0B8/5mrx9MXZ/4haskIqXGa9/vI9TeScoJWvwLUWmCjYtrqNsdLOHthDu9g9EDmkxBjSmSYbkmwrPtaBqw8exDv8P/wcwgXqlncqQvm8sKy4Bi9B/3P8YSY34k50U8Cak8lIp0yy5cpmW6OJJOJ4CjhGy4fk9mQfQcCtBtmdS6kxjMIvVQD2S6IgxmJ2g4CPInqkCsXurCJrkGGdu2EW34lQwuWGKU4tioitAxfuv82kWGN4tHthr/e3OZH/JZbnCRddP9MVQy/85tCq5jASfNtUTAFYrwZiAtXJDFI3UhPHa+sNrWyPZJ9/VbEDu1OAwRyDVKWSX/3xRV1U9E8ZenvjsJ/v+Xvj1a/+BlnXrMPQg/1w6VSHd6ZHImgSYRICv4yADL8+TFQ8OPf2DdlBbvkcoUbO6PLpBFOdqOBxlU1IVxNf5gLzYbjegB+tkS5o/5aZqYX9yGXouZz9kfY7NcvK2cbp2TaorXII70mouRJlLkKyb1zbYdz0p1l0/O0/feoSeIalG9fRJZ1yoZZGxqDWNOVM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(346002)(39860400002)(376002)(136003)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(83380400001)(38100700002)(2906002)(122000001)(82960400001)(41300700001)(66476007)(316002)(76116006)(26005)(110136005)(64756008)(54906003)(66946007)(66446008)(66556008)(38070700009)(71200400001)(6506007)(86362001)(8676002)(8936002)(4326008)(6512007)(2616005)(5660300002)(478600001)(966005)(6486002)(36756003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?azV5c3k2ZDdJSk10SFRxZE5GbXVJRUdLbDFuaGRzdUFiUEhmOVhjeVRwL0RS?=
 =?utf-8?B?TUtrWGRFck9KRjJZcmtwMkVXS01OdmFXeis0d0paakhFOERBNVFvc1pkWXY5?=
 =?utf-8?B?ZnlxWXBZN3kxZnRadGNFdWNYR3Q3RE5EWjlDdSsvOE1VZjhHQ3RSMWJRMGxm?=
 =?utf-8?B?R1NYV3RPdkZkR01NUmdseHZsdDQ1Njd1d0RPRFVXQ0ZXUFZ1WGRaYU1WbmE2?=
 =?utf-8?B?d2tYTlJJUFhaUmVwWVMxY044b0JsSnhoMWJManpaM0xma014Nmd3NEZId3Zv?=
 =?utf-8?B?ZFBGRFRaR1E1NWo4Vjh6L2Y5TXBCMjlYSFREZENkK1M2Q2FRbzRaRGpDQmcw?=
 =?utf-8?B?WW91emxhV3JuMVljd05FVkpoYm5peG9UQ3RyV05IS0ZQQ0JNVUVmK05Gc1p0?=
 =?utf-8?B?TS83d2hFV3dFNE9Sd253YmJvRkhKS0dQRGwvTEZLdG5CTVVVczdiNTdnbmhv?=
 =?utf-8?B?aTdHWG55YW5RQUFLaWxwUGZ4M3FkYm5ld0xZTlhsRWpMK1daZ1Z3VzY1Mk54?=
 =?utf-8?B?SFpjTVdKVHltb0I2LzlHSXRUa1BOMjFoZUxmejYxeXZZNTF4bUNFK3NUYnIw?=
 =?utf-8?B?cW9qWEVHbmJHaStjQkJiY3o1VzBiN2I5LzVnL09PR3BROWRUNVl5bkYwbVpL?=
 =?utf-8?B?SDJTcnhDZkNLZ3VPc1pLOHl0RHo3U0pBbnpNWXc5UDYvNUQzNVk2eXJsN0pE?=
 =?utf-8?B?T1lLTWtGNzRpb1AwRWVMc1VNTlZmdDV5Z2VPMmVMWllOVGQwejFJSXdycktE?=
 =?utf-8?B?VE1QUVY5Qnd3RFcwcGhWbVFINkMzUE5XbGF0R1kwT1hiSzZOUnJONlJESE5D?=
 =?utf-8?B?dzZZb3RjZUFNVkUrVlNIY0pEQTB4emN6SDlScUxSOGRlZnNoV3FIelpIUXRL?=
 =?utf-8?B?WUJaNXl0WHhsRWtxS0FYNWYrYkJERUV4RFNpbU1ya0QwSjdNeDNWcXBnYkZO?=
 =?utf-8?B?aVp4bUdicVBEeEpkVXNpNjhhR1ZLMVEvTFlFVGNxMis2Rk1FWURONFVPT01a?=
 =?utf-8?B?blpla2s5Zlk3NzhCb0V4L1FNcVgvNnRBcmppQnRVUk1JT0IvbGlXcFg5ZVd2?=
 =?utf-8?B?cE8yQjZOamFnRkNCMHdOb0N5UFQ5OUg2QUM4N2ZtZmZRcHY5TDhDTU1jN0do?=
 =?utf-8?B?Z3kwdmtJWUNUR0dqc2NacmwzRWIwSDRWT25LeEhPdi9Jd3VtVFVwNFpSczJi?=
 =?utf-8?B?YkdoU2pjWHJqaXVHUFpYSVZzNmh4R0t3R2dKL2JncUJ6K0ZEYjZTN0YvVUc0?=
 =?utf-8?B?eXhwcWZEWFczUktCb3VwQXJtWXdVSDBESXZUVGNJTURsa0JVdkd5aXJ0VitS?=
 =?utf-8?B?M2ROc0xUdlVVRUp5Ty91TkxMN280MUoyWkkvSlBCT09aM3U4cDlOSWlzR1A1?=
 =?utf-8?B?ZGFQenZHeHJQT0JMVTRtZzhwV3NUWW9IM0tjWGtTSEprdDNDUzF2T0F3aEF0?=
 =?utf-8?B?N1U1VFBPT2JiS2V1d1l0cTM5TlljNTFtOVpZR2sxNHhKdmNlVFBvMjhqQVd4?=
 =?utf-8?B?cUF2QkE2Q01zZ3pmeVRRVUJXTnVHWklHV3FxMUluTlZGUUJhWHhCSU9xSzZ5?=
 =?utf-8?B?dkxuK2xCN3BCaU81RzRRZUI3bzdubkZjMkhiWjRFRlk5ZU02R3dGaTJiWVlR?=
 =?utf-8?B?RGtZay91TzNVb0dFcVMxVVN6V3JScjRzRFNtdXNIRFpNSGdGY2w1Qmd4d2lC?=
 =?utf-8?B?L1dtWWp4UE1MQXdSOGZiVnZCUkk5WHBLc3NBMGZ2RE5mdHBNRXEvNi8zNWRV?=
 =?utf-8?B?ZlN4TC9KNnllODlVT3VEb1F0UDBKRkRBOEtZRUFzUUoxN09PV2xzeVEwREhG?=
 =?utf-8?B?SlZMdnRIMi9sb05XMDAweHkveHFlWEMycXFreVRleFhobkh1Q01URlhJczgw?=
 =?utf-8?B?eHlZTWRNSFZYQm9veVpHTldRNmR2TFc1cFEwZEhOcGZ2K0ZkQjZHVVlKMC9M?=
 =?utf-8?B?YmJJTlUramp4bk5oWGZPQVV1aG5FSGh0cW5lelVKZHVQNmRNYXU0SC9lRFQ2?=
 =?utf-8?B?Rit5UVN2MG9HaCtRaXV0cGRkZzdvenFWTmFWdWRaSmR3YlA3eUhEL1BDRmtW?=
 =?utf-8?B?dUxEUGgzTC8zUDVUWWJkRXFZekhWVkdJbU1CdkdWNnIvQzlORVZWeFRLbzFt?=
 =?utf-8?B?Wjg5ZHZGd0RCa1NuZE1DN0ZHMmU4aFV2YURCU2NzZUlWQVRmSHQwVzlXMVh0?=
 =?utf-8?B?Mnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5D32E973068B1A48A63DD0A2B988295D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d959bbec-2639-4a70-9301-08dc28b278d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2024 14:30:17.5579 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gqyP7CGlMuNLgJknrdnPTdHs+wzDqgHDQ3Mb+K8LNt9i0cdU5eJvpyf/rpeb8mhDTtDu2bAOdi9cnVlkVtGx7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8312
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

T24gVGh1LCAyMDI0LTAyLTA4IGF0IDA4OjI1ICswMDAwLCBUdnJ0a28gVXJzdWxpbiB3cm90ZToN
Cj4gRnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4NCj4gDQo+
IEFkZCBhIG5ldyBxdWVyeSB0byB0aGUgR3VDIHN1Ym1pc3Npb24gaW50ZXJmYWNlIHZlcnNpb24u
DQo+IA0KPiBNZXNhIGludGVuZHMgdG8gdXNlIHRoaXMgaW5mb3JtYXRpb24gdG8gY2hlY2sgZm9y
IG9sZCBmaXJtd2FyZSB2ZXJzaW9ucw0KPiB3aXRoIGEga25vd24gYnVnIHdoZXJlIHVzaW5nIHRo
ZSByZW5kZXIgYW5kIGNvbXB1dGUgY29tbWFuZCBzdHJlYW1lcnMNCj4gc2ltdWx0YW5lb3VzbHkg
Y2FuIGNhdXNlIEdQVSBoYW5ncyBkdWUgaXNzdWVzIGluIGZpcm13YXJlIHNjaGVkdWxpbmcuDQo+
IA0KPiBCYXNlZCBvbiBwYXRjaGVzIGZyb20gVml2YWlrIGFuZCBKb29uYXMuDQo+IA0KPiBDb21w
aWxlIHRlc3RlZCBvbmx5Lg0KPiANCj4gdjI6DQo+ICAqIEFkZGVkIGJyYW5jaCB2ZXJzaW9uLg0K
DQpSZXZpZXdlZC1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5j
b20+DQpUZXN0ZWQtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwu
Y29tPg0KVU1EOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9tZXNhLy0vbWVy
Z2VfcmVxdWVzdHMvMjUyMzMNCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVHZydGtvIFVyc3VsaW4g
PHR2cnRrby51cnN1bGluQGludGVsLmNvbT4NCj4gQ2M6IEtlbm5ldGggR3JhdW5rZSA8a2VubmV0
aEB3aGl0ZWNhcGUub3JnPg0KPiBDYzogSm9zZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+
DQo+IENjOiBTYWdhciBHaHVnZSA8c2FnYXIuZ2h1Z2VAaW50ZWwuY29tPg0KPiBDYzogUGF1bG8g
WmFub25pIDxwYXVsby5yLnphbm9uaUBpbnRlbC5jb20+DQo+IENjOiBKb2huIEhhcnJpc29uIDxK
b2huLkMuSGFycmlzb25ASW50ZWwuY29tPg0KPiBDYzogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZp
dmlAaW50ZWwuY29tPg0KPiBDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4N
Cj4gQ2M6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+DQo+IENjOiBW
aXZhaWsgQmFsYXN1YnJhd21hbmlhbiA8dml2YWlrLmJhbGFzdWJyYXdtYW5pYW5AaW50ZWwuY29t
Pg0KPiBDYzogSm9vbmFzIExhaHRpbmVuIDxqb29uYXMubGFodGluZW5AbGludXguaW50ZWwuY29t
Pg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcXVlcnkuYyB8IDMzICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gIGluY2x1ZGUvdWFwaS9kcm0vaTkxNV9kcm0u
aCAgICAgICB8IDEyICsrKysrKysrKysrDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDQ1IGluc2VydGlv
bnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3F1ZXJ5
LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3F1ZXJ5LmMNCj4gaW5kZXggMDA4NzFlZjk5
NzkyLi5kNGRiYTEyNDBiNDAgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5
MTVfcXVlcnkuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3F1ZXJ5LmMNCj4g
QEAgLTU1MSw2ICs1NTEsMzggQEAgc3RhdGljIGludCBxdWVyeV9od2NvbmZpZ19ibG9iKHN0cnVj
dCBkcm1faTkxNV9wcml2YXRlICppOTE1LA0KPiAgCXJldHVybiBod2NvbmZpZy0+c2l6ZTsNCj4g
IH0NCj4gIA0KPiArc3RhdGljIGludA0KPiArcXVlcnlfZ3VjX3N1Ym1pc3Npb25fdmVyc2lvbihz
dHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSwNCj4gKwkJCSAgICAgc3RydWN0IGRybV9pOTE1
X3F1ZXJ5X2l0ZW0gKnF1ZXJ5KQ0KPiArew0KPiArCXN0cnVjdCBkcm1faTkxNV9xdWVyeV9ndWNf
c3VibWlzc2lvbl92ZXJzaW9uIF9fdXNlciAqcXVlcnlfcHRyID0NCj4gKwkJCQkJICAgIHU2NF90
b191c2VyX3B0cihxdWVyeS0+ZGF0YV9wdHIpOw0KPiArCXN0cnVjdCBkcm1faTkxNV9xdWVyeV9n
dWNfc3VibWlzc2lvbl92ZXJzaW9uIHZlcjsNCj4gKwlzdHJ1Y3QgaW50ZWxfZ3VjICpndWMgPSAm
dG9fZ3QoaTkxNSktPnVjLmd1YzsNCj4gKwljb25zdCBzaXplX3Qgc2l6ZSA9IHNpemVvZih2ZXIp
Ow0KPiArCWludCByZXQ7DQo+ICsNCj4gKwlpZiAoIWludGVsX3VjX3VzZXNfZ3VjX3N1Ym1pc3Np
b24oJnRvX2d0KGk5MTUpLT51YykpDQo+ICsJCXJldHVybiAtRU5PREVWOw0KPiArDQo+ICsJcmV0
ID0gY29weV9xdWVyeV9pdGVtKCZ2ZXIsIHNpemUsIHNpemUsIHF1ZXJ5KTsNCj4gKwlpZiAocmV0
ICE9IDApDQo+ICsJCXJldHVybiByZXQ7DQo+ICsNCj4gKwlpZiAodmVyLmJyYW5jaCB8fCB2ZXIu
bWFqb3IgfHwgdmVyLm1pbm9yIHx8IHZlci5wYXRjaCkNCj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+
ICsNCj4gKwl2ZXIuYnJhbmNoID0gMDsNCj4gKwl2ZXIubWFqb3IgPSBndWMtPnN1Ym1pc3Npb25f
dmVyc2lvbi5tYWpvcjsNCj4gKwl2ZXIubWlub3IgPSBndWMtPnN1Ym1pc3Npb25fdmVyc2lvbi5t
aW5vcjsNCj4gKwl2ZXIucGF0Y2ggPSBndWMtPnN1Ym1pc3Npb25fdmVyc2lvbi5wYXRjaDsNCj4g
Kw0KPiArCWlmIChjb3B5X3RvX3VzZXIocXVlcnlfcHRyLCAmdmVyLCBzaXplKSkNCj4gKwkJcmV0
dXJuIC1FRkFVTFQ7DQo+ICsNCj4gKwlyZXR1cm4gMDsNCj4gK30NCj4gKw0KPiAgc3RhdGljIGlu
dCAoKiBjb25zdCBpOTE1X3F1ZXJ5X2Z1bmNzW10pKHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpk
ZXZfcHJpdiwNCj4gIAkJCQkJc3RydWN0IGRybV9pOTE1X3F1ZXJ5X2l0ZW0gKnF1ZXJ5X2l0ZW0p
ID0gew0KPiAgCXF1ZXJ5X3RvcG9sb2d5X2luZm8sDQo+IEBAIC01NTksNiArNTkxLDcgQEAgc3Rh
dGljIGludCAoKiBjb25zdCBpOTE1X3F1ZXJ5X2Z1bmNzW10pKHN0cnVjdCBkcm1faTkxNV9wcml2
YXRlICpkZXZfcHJpdiwNCj4gIAlxdWVyeV9tZW1yZWdpb25faW5mbywNCj4gIAlxdWVyeV9od2Nv
bmZpZ19ibG9iLA0KPiAgCXF1ZXJ5X2dlb21ldHJ5X3N1YnNsaWNlcywNCj4gKwlxdWVyeV9ndWNf
c3VibWlzc2lvbl92ZXJzaW9uLA0KPiAgfTsNCj4gIA0KPiAgaW50IGk5MTVfcXVlcnlfaW9jdGwo
c3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwgc3RydWN0IGRybV9maWxlICpmaWxl
KQ0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS9pOTE1X2RybS5oIGIvaW5jbHVkZS91
YXBpL2RybS9pOTE1X2RybS5oDQo+IGluZGV4IDU1MGM0OTZjZTc2ZC4uODRmYjdmN2VhODM0IDEw
MDY0NA0KPiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL2k5MTVfZHJtLmgNCj4gKysrIGIvaW5jbHVk
ZS91YXBpL2RybS9pOTE1X2RybS5oDQo+IEBAIC0zMDM4LDYgKzMwMzgsNyBAQCBzdHJ1Y3QgZHJt
X2k5MTVfcXVlcnlfaXRlbSB7DQo+ICAJICogIC0gJURSTV9JOTE1X1FVRVJZX01FTU9SWV9SRUdJ
T05TIChzZWUgc3RydWN0IGRybV9pOTE1X3F1ZXJ5X21lbW9yeV9yZWdpb25zKQ0KPiAgCSAqICAt
ICVEUk1fSTkxNV9RVUVSWV9IV0NPTkZJR19CTE9CIChzZWUgYEd1QyBIV0NPTkZJRyBibG9iIHVB
UElgKQ0KPiAgCSAqICAtICVEUk1fSTkxNV9RVUVSWV9HRU9NRVRSWV9TVUJTTElDRVMgKHNlZSBz
dHJ1Y3QgZHJtX2k5MTVfcXVlcnlfdG9wb2xvZ3lfaW5mbykNCj4gKwkgKiAgLSAlRFJNX0k5MTVf
UVVFUllfR1VDX1NVQk1JU1NJT05fVkVSU0lPTiAoc2VlIHN0cnVjdCBkcm1faTkxNV9xdWVyeV9n
dWNfc3VibWlzc2lvbl92ZXJzaW9uKQ0KPiAgCSAqLw0KPiAgCV9fdTY0IHF1ZXJ5X2lkOw0KPiAg
I2RlZmluZSBEUk1fSTkxNV9RVUVSWV9UT1BPTE9HWV9JTkZPCQkxDQo+IEBAIC0zMDQ2LDYgKzMw
NDcsNyBAQCBzdHJ1Y3QgZHJtX2k5MTVfcXVlcnlfaXRlbSB7DQo+ICAjZGVmaW5lIERSTV9JOTE1
X1FVRVJZX01FTU9SWV9SRUdJT05TCQk0DQo+ICAjZGVmaW5lIERSTV9JOTE1X1FVRVJZX0hXQ09O
RklHX0JMT0IJCTUNCj4gICNkZWZpbmUgRFJNX0k5MTVfUVVFUllfR0VPTUVUUllfU1VCU0xJQ0VT
CTYNCj4gKyNkZWZpbmUgRFJNX0k5MTVfUVVFUllfR1VDX1NVQk1JU1NJT05fVkVSU0lPTgk3DQo+
ICAvKiBNdXN0IGJlIGtlcHQgY29tcGFjdCAtLSBubyBob2xlcyBhbmQgd2VsbCBkb2N1bWVudGVk
ICovDQo+ICANCj4gIAkvKioNCj4gQEAgLTM1OTEsNiArMzU5MywxNiBAQCBzdHJ1Y3QgZHJtX2k5
MTVfcXVlcnlfbWVtb3J5X3JlZ2lvbnMgew0KPiAgCXN0cnVjdCBkcm1faTkxNV9tZW1vcnlfcmVn
aW9uX2luZm8gcmVnaW9uc1tdOw0KPiAgfTsNCj4gIA0KPiArLyoqDQo+ICsqIHN0cnVjdCBkcm1f
aTkxNV9xdWVyeV9ndWNfc3VibWlzc2lvbl92ZXJzaW9uIC0gcXVlcnkgR3VDIHN1Ym1pc3Npb24g
aW50ZXJmYWNlIHZlcnNpb24NCj4gKyovDQo+ICtzdHJ1Y3QgZHJtX2k5MTVfcXVlcnlfZ3VjX3N1
Ym1pc3Npb25fdmVyc2lvbiB7DQo+ICsJX191MzIgYnJhbmNoOw0KPiArCV9fdTMyIG1ham9yOw0K
PiArCV9fdTMyIG1pbm9yOw0KPiArCV9fdTMyIHBhdGNoOw0KPiArfTsNCj4gKw0KPiAgLyoqDQo+
ICAgKiBET0M6IEd1QyBIV0NPTkZJRyBibG9iIHVBUEkNCj4gICAqDQoNCg==
