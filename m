Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D95CD84E72B
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 18:56:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD57710E67F;
	Thu,  8 Feb 2024 17:56:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S/fjOMdx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5FA210E67F;
 Thu,  8 Feb 2024 17:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707414962; x=1738950962;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ZQJ01nxO6Tkfn7A9/UYFbkhIHqQMpbWeAUPz+B/to8w=;
 b=S/fjOMdxyOb+MGD+W2WOVvM8D8UQfwnYp9nMF+/Z6XULj3ktWPVwFe7j
 JtWgm4YeYFTt2shdvgaF+eNMwv87OlmNWdEn36EMN1kzTx9l+6IeEjv+c
 k9gH96LfVgPKOCnEO2DoX1O9GhAHOyLILYmHMDEIq3J9ytO1KRc6olKAq
 e/TcwVDXbhjBE/8Xy5LwUzEQ4PIC2wv8UtZZOpT3czC20lMvFHkUBSEUs
 V1hByLPnWYTkt5UxbWE40FunMcDzr361AisZanvz+ryUg12I2+X1jUX/W
 3Dw0N3jDvwzV0AePBo8TY6Ia7wtGEiJSb/INuu0UX9BaVfwDj2oq3N6Ro A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="395693567"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="395693567"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 09:55:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="6493673"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Feb 2024 09:55:59 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 8 Feb 2024 09:55:58 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 8 Feb 2024 09:55:58 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 8 Feb 2024 09:55:58 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 8 Feb 2024 09:55:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L359pSeJdAXayeg3lr65SkL9PTDjjr9sQh9KT6xL4zDUuQZzR7N5S0XYVm15ceMR8ST2Y/wxvIxhFCLA0R609Mrpp0jYN8WvFM/xtp+QP5gAiS8weVdpRAWpKrEm84JU7yUpRUSH/6OlU2UMLJBwANOcKpQS47NfPWt3zyqD8TXq6h1S7iAHkg9Ve5JSHBP9EwjaZcu9QQcCsTLaD4ffs2cutaIKLc1Xq6pBIRE6DiuKJ4002t7qR/K2Y2xvuqRxZp4V1M64T3JV2e4kSNtYgu5AdOlzX2jECBVcKAdZbiy8E9lWpB8bsmbomVYiLOwPVb4DhlIcXvF30fxCZlywKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQJ01nxO6Tkfn7A9/UYFbkhIHqQMpbWeAUPz+B/to8w=;
 b=G/EI8otU9aNh0KIuNjxnAmOsX4p/HxBtolylgBTokSujQNdJQwz89ZpVo64+8kkq9VAs2M7my0YUcTKnnSetCC4J/Ifc0Hgb5CXZaKp0McRZrx47JUvsD3jELAci+VjQUy64vBfPslZxqPI40Z+qXgWZSpug1rqhktn8e8nWFJ2Mm42sS/m4KT0oC02keTdPjC0vIHl7Q+NOuUWZG+ybxDiXtuWeKb0FM9lA76q0d7NKlUK93UT6F5Wr9bsC/NgbBivZkM9e7FKkoV9dWakujPAVWPLjBtSfkKz+SAYRWqbHqEiQ03LMty3KMMrFa7j6b+ePLQGArZdKvIAdf7ptiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by MW4PR11MB6788.namprd11.prod.outlook.com (2603:10b6:303:208::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.38; Thu, 8 Feb
 2024 17:55:55 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f3a9:7ba0:d19a:a630]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f3a9:7ba0:d19a:a630%7]) with mapi id 15.20.7249.035; Thu, 8 Feb 2024
 17:55:55 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "Intel-gfx@lists.freedesktop.org" <Intel-gfx@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "Zanoni, Paulo R"
 <paulo.r.zanoni@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Ursulin, Tvrtko" <tvrtko.ursulin@intel.com>, "Ghuge, Sagar"
 <sagar.ghuge@intel.com>, "Balasubrawmanian, Vivaik"
 <vivaik.balasubrawmanian@intel.com>, "kenneth@whitecape.org"
 <kenneth@whitecape.org>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>
Subject: Re: [PATCH v2] drm/i915: Add GuC submission interface version query
Thread-Topic: [PATCH v2] drm/i915: Add GuC submission interface version query
Thread-Index: AQHaWmhhgwFANVHU4kmlLC0PYFc33rEAgdiAgAAIDQCAAAWcAIAAK8oA
Date: Thu, 8 Feb 2024 17:55:54 +0000
Message-ID: <0c282ce6fd922ef2cad2bbf84b51214bb66a0411.camel@intel.com>
References: <20240207115612.1322778-1-tvrtko.ursulin@linux.intel.com>
 <20240208082510.1363268-1-tvrtko.ursulin@linux.intel.com>
 <8a0a964cc1312e5fcccf0850d72e6374bb578943.camel@intel.com>
 <db762e07-a5e1-4c47-b1b6-85742ce6498b@linux.intel.com>
 <5daf0215abaf92d9b34fef732d1be010d59bd69c.camel@intel.com>
In-Reply-To: <5daf0215abaf92d9b34fef732d1be010d59bd69c.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|MW4PR11MB6788:EE_
x-ms-office365-filtering-correlation-id: c6fae814-550b-4050-5cc8-08dc28cf327c
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nxliLCiRsIsOc59EWQ0X/wSKi2pmhJOaVEGtb7iiRtLJmsggDeZpHy+hI1IJLeSXFuOoBCIY+SKxpboj1f4OreIhh/EmpwDO17Jj2PcHzENNUGkBi0WBv9zo8Q+V/x989geC6tdVi6nXOiELPCGtHcmHmnG5TcX4QbgX8O4GSDWsZkhJodqYvAC7pegUlIU5PDL5Hbu5HjuearewmMnxDNB+qb6Tj/m+ngztqD2gL01GQlQAvkay0Qpof5G3vgwwuR0G2qpnjjApuaewdtu3/L8JqXKUGZiZzeBI/46YJVaK+8b4FbZJzihtsQi9OXQujOZcy47X3QFeEtMDRnEft/+gHbm0DiLw/4qA4a0faBuVcAlcU12fDrpuHNaGd10FhxiuF6ch7xTa57RGEeTMfF1sctySjkrPOlH18xkLzNm8Wye9ze5zg2uB8tMdoZr5Iqkl7vK9VskqVXnKizBIkZJRWJJKUW29cg8VX8Jd8whcc6XWGQRCojuXfR1bsGV6WcYYc712AM2Ay1bFU7Wlbdjb5uhHAyeveBHaM3LrDGJbDRUV49zviz/DGWPsVMYlxjx06IXQxVJ2UkO8ZyFuiyU35MuhZ8g4KVb85aNPGjA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(396003)(346002)(366004)(136003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(83380400001)(38100700002)(82960400001)(122000001)(2906002)(71200400001)(53546011)(2616005)(478600001)(26005)(966005)(6486002)(6512007)(64756008)(316002)(4326008)(8676002)(8936002)(110136005)(76116006)(66946007)(54906003)(66446008)(66556008)(66476007)(6506007)(5660300002)(38070700009)(86362001)(36756003)(41300700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UjVpRU5YbmZIeFhLMzZuODhlS0M3WURiT1hZUzdvL0dlYXEyMU9xUndSZnJr?=
 =?utf-8?B?TUJqUmF4c0RaeUk0d0NHMEN0Z3Y5TWVHRHVHcnNGWU1POEsrR3JzMmhUa05P?=
 =?utf-8?B?UlU2aVNZYXVKcXpsMllFRkluVTIyZ2g3ZmtadHZwY0pacHlodjFMYmQ4Zlpk?=
 =?utf-8?B?YXUyY005VUF0Yk1FK0RlaVRYSHJuNWMxRXl4Q1ROY0l5QXA4emorUFFyeW9B?=
 =?utf-8?B?Vi84R3RUYVZiMjBZZjZRT1ZqQTdSSVRUWHVUSnFHZDFSdk9RVEFDRmlNY1ZZ?=
 =?utf-8?B?SjVIVE5ISGE3ZTRYQTF5TFFmaWpxdDlCWjRLS3c1dTF3YTR5M3FOU1dEUkNk?=
 =?utf-8?B?M3ppUmlsbk9MU3hCb1oxa0dCekhkcnJGVis5K2xXcFRwQVo0SWZ6Z0x5MzE0?=
 =?utf-8?B?dWlUNWhBVm9xMFFUMHdEQThyRUsrMkFlY0xuT3h6c0tvMU1KaStuZW5rU25p?=
 =?utf-8?B?ZUI5NE1NME4rZnpjMVpkMGoyVjRuUmVWd2ZBbTFpMnVBSkovVEZtUWtpdjRT?=
 =?utf-8?B?VWkzZnE2UllabGRzRUtzNDBYY2h2c3QxNFRrME5CWWJlejQ0dnZyTUR1UkJ0?=
 =?utf-8?B?anBqZk5qYTU5QjNZWHRkek9VTU9yUGZwcVpHUkM1bHlVcVU4OVc1QldNWUxJ?=
 =?utf-8?B?LzNXWG9nbVkyb1FIbUFtbWdQVmpQcXJwRDdkM1RwU0dBeDIxU0oxOGJadUVX?=
 =?utf-8?B?V2JqbDJpTloxK0RCV1M2WnRaQ3oyRVgxNVhoTnBLUDBWNXI5M1BUdWhkMjZF?=
 =?utf-8?B?dUFxbXhiV1lLNk04L0ZuUCtZQ0loTVJhdDI5bEE4NE5ZUlJKWFhNM3k3RmRJ?=
 =?utf-8?B?R21kMEdPVUJmYjQzakNFa0FMZzR0TXlvYzU4bVEwWTl6bXlvZVU4bkl3L3JG?=
 =?utf-8?B?NW4yQXduZ1JZSFN3ZndySVVRR3IydWJQdWVNNWtzVG53RUNxcS9TN3dERHli?=
 =?utf-8?B?eVRvYVI2a2Y2MC91cnRoNFZZUHNkcWwyTTh5OEh3RnBoYTVnUWNZV1Vqbzk1?=
 =?utf-8?B?RkpFaGRXTHZsbUFqUHNlZ3hDNGRqdzd0THBHdUdRaGZyRHdycWpHRUhFcUgx?=
 =?utf-8?B?R3BMVjdhdEN6c3I0d0hnbWdwZGl5UGlnZVUxQ2J3K1J5THNHcXVLRGMwYVVs?=
 =?utf-8?B?dU5sZFErNExpUmlSdkFxKzhjaVprb0huN3VpNkNUdjh5SUJZbUlRUVl1cnpQ?=
 =?utf-8?B?NlROQ0FhUjMvRWl2c3dhMWwxUXdtcWRMY0NLbE5ZZ1RSZjNCbENPeWl0czBu?=
 =?utf-8?B?Q0kvZ3NWeFI4cjlsL1M3dElXRmg4MVB0UEdxZnNhMFE0UXlmci9JZm1PdSsz?=
 =?utf-8?B?OUZzbG1sZTB5dWt0dHpBZmRMbHpBaHZubU5DZ0Z4K1hpcjRDYzdieXdaRmgz?=
 =?utf-8?B?SW1oNW04VWY0dVIvRElSUTdGUWlERVU4bGprUzhiczhHd094dXZ6b1gxYXNz?=
 =?utf-8?B?M09Za01BQ0kzaVJvR0JyK2ppb2VQUHZYSG9NVkxjMzdHcVQrRDdrcjVLZ1Ez?=
 =?utf-8?B?MXhpZXEyZzhWNGsxNVlzdG4vVUQ3MzYxOWQ4RFhRQ1Y2aW9sY1J6N0ZsTlov?=
 =?utf-8?B?K1lGVDRxdndnMXdoTkY0cFR0WlBCVFdydEozTmt1aCtLZzVnMDh6L2hRbmZn?=
 =?utf-8?B?T1JUZkszdVErMTZhQkJKNlhLa05LT1BtV1pGVWpGRWV3VzFwQ3lEdTNlVmxP?=
 =?utf-8?B?SUFIWVk3SjRKWEpEbEhpNUlaMUxQMGhpM1luUjZRbTBzTEJjUnJpUktIVFVQ?=
 =?utf-8?B?YXN1aDRmV05LZlUzY3FCWEd4M0VwekJoQ1pqV25BVktQcHNLcFRIbUZSMWJC?=
 =?utf-8?B?K3BqYmZDM2tyMkRGVnpPeWNGOGhUVDB3Tnk1Qm1tTlJjeGlQY2g1aHU2cjZ2?=
 =?utf-8?B?djZlelFuVXFVMkNMRkxuaUZHSDl6SFl4WHBtMi96djNLNTU1M3R0U2JBd2x5?=
 =?utf-8?B?NDU1TzExZEVEeitFNXg2Y3RaZlR4dzlSVmliL3g3TEhzWm02dmVwSGM2OFRk?=
 =?utf-8?B?UHVaTXdGZllZdWpPdXlkSTlFUEZ4RU9Yc1U5dDcxT1dod0c0MWJJSFZyb0RH?=
 =?utf-8?B?eUZNWkYrVXFsTGpSVUlVZzkxbFQwVUlZTDdxNWFRUTYwdmk2QlJGT0pzYmhU?=
 =?utf-8?B?MmJqZmhzcFhLdll6VUFvbDlTSFFwVG04d2xiVTZ4eEJUd2ppbWV0NmQyQ2xp?=
 =?utf-8?B?ZXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2921B50F482505448CA86C2EC5F007DF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6fae814-550b-4050-5cc8-08dc28cf327c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2024 17:55:55.0009 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IKtiCiWKh3KilsCYmwomklyyPOCW+AL6Bdxk9ok81EtM9dWZxbw1YCuvZa7ceSb2CCdX+FWXkXgasnECVAbcLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6788
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

T24gVGh1LCAyMDI0LTAyLTA4IGF0IDA3OjE5IC0wODAwLCBKb3PDqSBSb2JlcnRvIGRlIFNvdXph
IHdyb3RlOg0KPiBPbiBUaHUsIDIwMjQtMDItMDggYXQgMTQ6NTkgKzAwMDAsIFR2cnRrbyBVcnN1
bGluIHdyb3RlOg0KPiA+IE9uIDA4LzAyLzIwMjQgMTQ6MzAsIFNvdXphLCBKb3NlIHdyb3RlOg0K
PiA+ID4gT24gVGh1LCAyMDI0LTAyLTA4IGF0IDA4OjI1ICswMDAwLCBUdnJ0a28gVXJzdWxpbiB3
cm90ZToNCj4gPiA+ID4gRnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVs
LmNvbT4NCj4gPiA+ID4gDQo+ID4gPiA+IEFkZCBhIG5ldyBxdWVyeSB0byB0aGUgR3VDIHN1Ym1p
c3Npb24gaW50ZXJmYWNlIHZlcnNpb24uDQo+ID4gPiA+IA0KPiA+ID4gPiBNZXNhIGludGVuZHMg
dG8gdXNlIHRoaXMgaW5mb3JtYXRpb24gdG8gY2hlY2sgZm9yIG9sZCBmaXJtd2FyZSB2ZXJzaW9u
cw0KPiA+ID4gPiB3aXRoIGEga25vd24gYnVnIHdoZXJlIHVzaW5nIHRoZSByZW5kZXIgYW5kIGNv
bXB1dGUgY29tbWFuZCBzdHJlYW1lcnMNCj4gPiA+ID4gc2ltdWx0YW5lb3VzbHkgY2FuIGNhdXNl
IEdQVSBoYW5ncyBkdWUgaXNzdWVzIGluIGZpcm13YXJlIHNjaGVkdWxpbmcuDQo+ID4gPiA+IA0K
PiA+ID4gPiBCYXNlZCBvbiBwYXRjaGVzIGZyb20gVml2YWlrIGFuZCBKb29uYXMuDQo+ID4gPiA+
IA0KPiA+ID4gPiBDb21waWxlIHRlc3RlZCBvbmx5Lg0KPiA+ID4gPiANCj4gPiA+ID4gdjI6DQo+
ID4gPiA+ICAgKiBBZGRlZCBicmFuY2ggdmVyc2lvbi4NCj4gPiA+IA0KPiA+ID4gUmV2aWV3ZWQt
Ynk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPg0KPiA+ID4g
VGVzdGVkLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4N
Cj4gPiA+IFVNRDogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvbWVzYS8tL21l
cmdlX3JlcXVlc3RzLzI1MjMzDQo+ID4gDQo+ID4gVGhhbmtzLCBidXQgcGxlYXNlIHdlIGFsc28g
bmVlZCB0byBjbG9zZSBkb3duIG9uIHRoZSBicmFuY2ggbnVtYmVyIA0KPiA+IHNpdHVhdGlvbi4g
SS5lLiBiZSBzdXJlIHdoYXQgaXMgdGhlIGZhaWx1cmUgbW9kZSBpbiBzaGlwcGluZyBNZXNhIHdp
dGggDQo+ID4gdGhlIGNoYW5nZSBhcyBpdCBzdGFuZHMgaW4gdGhlIE1SIGxpbmtlZC4gV2hhdCBw
bGF0Zm9ybXMgY291bGQgc3RhcnQgDQo+ID4gZmFpbGluZyBhbmQgd2hlbiwgZGVwZW5kaW5nIG9u
IEd1QyBGVyByZWxlYXNlIGV2ZW50dWFsaXRpZXMuDQo+IA0KPiB5ZXMsIEkgaGF2ZSBhc2tlZCBK
b2huIEhhcnJpc29uIGZvciBhIGRvY3VtZW50YXRpb24gbGluayBhYm91dCB0aGUgZmlybXdhcmUg
dmVyc2lvbmluZy4NCg0KR290IHRoZSBkb2N1bWVudGF0aW9uIGxpbmssIE1SIHVwZGF0ZWQuDQpX
aWxsIGFzayBmb3IgcmV2aWV3cyBpbiBNZXNhIHNpZGUuDQoNCj4gDQo+ID4gDQo+ID4gUmVnYXJk
cywNCj4gPiANCj4gPiBUdnJ0a28NCj4gPiANCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogVHZydGtv
IFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4NCj4gPiA+ID4gQ2M6IEtlbm5ldGgg
R3JhdW5rZSA8a2VubmV0aEB3aGl0ZWNhcGUub3JnPg0KPiA+ID4gPiBDYzogSm9zZSBTb3V6YSA8
am9zZS5zb3V6YUBpbnRlbC5jb20+DQo+ID4gPiA+IENjOiBTYWdhciBHaHVnZSA8c2FnYXIuZ2h1
Z2VAaW50ZWwuY29tPg0KPiA+ID4gPiBDYzogUGF1bG8gWmFub25pIDxwYXVsby5yLnphbm9uaUBp
bnRlbC5jb20+DQo+ID4gPiA+IENjOiBKb2huIEhhcnJpc29uIDxKb2huLkMuSGFycmlzb25ASW50
ZWwuY29tPg0KPiA+ID4gPiBDYzogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29t
Pg0KPiA+ID4gPiBDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4NCj4gPiA+
ID4gQ2M6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+DQo+ID4gPiA+
IENjOiBWaXZhaWsgQmFsYXN1YnJhd21hbmlhbiA8dml2YWlrLmJhbGFzdWJyYXdtYW5pYW5AaW50
ZWwuY29tPg0KPiA+ID4gPiBDYzogSm9vbmFzIExhaHRpbmVuIDxqb29uYXMubGFodGluZW5AbGlu
dXguaW50ZWwuY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gICBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9pOTE1X3F1ZXJ5LmMgfCAzMyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4g
PiA+ICAgaW5jbHVkZS91YXBpL2RybS9pOTE1X2RybS5oICAgICAgIHwgMTIgKysrKysrKysrKysN
Cj4gPiA+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDQ1IGluc2VydGlvbnMoKykNCj4gPiA+ID4gDQo+
ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3F1ZXJ5LmMgYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3F1ZXJ5LmMNCj4gPiA+ID4gaW5kZXggMDA4NzFlZjk5
NzkyLi5kNGRiYTEyNDBiNDAgMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2k5MTVfcXVlcnkuYw0KPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1
X3F1ZXJ5LmMNCj4gPiA+ID4gQEAgLTU1MSw2ICs1NTEsMzggQEAgc3RhdGljIGludCBxdWVyeV9o
d2NvbmZpZ19ibG9iKHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICppOTE1LA0KPiA+ID4gPiAgIAly
ZXR1cm4gaHdjb25maWctPnNpemU7DQo+ID4gPiA+ICAgfQ0KPiA+ID4gPiAgIA0KPiA+ID4gPiAr
c3RhdGljIGludA0KPiA+ID4gPiArcXVlcnlfZ3VjX3N1Ym1pc3Npb25fdmVyc2lvbihzdHJ1Y3Qg
ZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSwNCj4gPiA+ID4gKwkJCSAgICAgc3RydWN0IGRybV9pOTE1
X3F1ZXJ5X2l0ZW0gKnF1ZXJ5KQ0KPiA+ID4gPiArew0KPiA+ID4gPiArCXN0cnVjdCBkcm1faTkx
NV9xdWVyeV9ndWNfc3VibWlzc2lvbl92ZXJzaW9uIF9fdXNlciAqcXVlcnlfcHRyID0NCj4gPiA+
ID4gKwkJCQkJICAgIHU2NF90b191c2VyX3B0cihxdWVyeS0+ZGF0YV9wdHIpOw0KPiA+ID4gPiAr
CXN0cnVjdCBkcm1faTkxNV9xdWVyeV9ndWNfc3VibWlzc2lvbl92ZXJzaW9uIHZlcjsNCj4gPiA+
ID4gKwlzdHJ1Y3QgaW50ZWxfZ3VjICpndWMgPSAmdG9fZ3QoaTkxNSktPnVjLmd1YzsNCj4gPiA+
ID4gKwljb25zdCBzaXplX3Qgc2l6ZSA9IHNpemVvZih2ZXIpOw0KPiA+ID4gPiArCWludCByZXQ7
DQo+ID4gPiA+ICsNCj4gPiA+ID4gKwlpZiAoIWludGVsX3VjX3VzZXNfZ3VjX3N1Ym1pc3Npb24o
JnRvX2d0KGk5MTUpLT51YykpDQo+ID4gPiA+ICsJCXJldHVybiAtRU5PREVWOw0KPiA+ID4gPiAr
DQo+ID4gPiA+ICsJcmV0ID0gY29weV9xdWVyeV9pdGVtKCZ2ZXIsIHNpemUsIHNpemUsIHF1ZXJ5
KTsNCj4gPiA+ID4gKwlpZiAocmV0ICE9IDApDQo+ID4gPiA+ICsJCXJldHVybiByZXQ7DQo+ID4g
PiA+ICsNCj4gPiA+ID4gKwlpZiAodmVyLmJyYW5jaCB8fCB2ZXIubWFqb3IgfHwgdmVyLm1pbm9y
IHx8IHZlci5wYXRjaCkNCj4gPiA+ID4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ID4gPiA+ICsNCj4g
PiA+ID4gKwl2ZXIuYnJhbmNoID0gMDsNCj4gPiA+ID4gKwl2ZXIubWFqb3IgPSBndWMtPnN1Ym1p
c3Npb25fdmVyc2lvbi5tYWpvcjsNCj4gPiA+ID4gKwl2ZXIubWlub3IgPSBndWMtPnN1Ym1pc3Np
b25fdmVyc2lvbi5taW5vcjsNCj4gPiA+ID4gKwl2ZXIucGF0Y2ggPSBndWMtPnN1Ym1pc3Npb25f
dmVyc2lvbi5wYXRjaDsNCj4gPiA+ID4gKw0KPiA+ID4gPiArCWlmIChjb3B5X3RvX3VzZXIocXVl
cnlfcHRyLCAmdmVyLCBzaXplKSkNCj4gPiA+ID4gKwkJcmV0dXJuIC1FRkFVTFQ7DQo+ID4gPiA+
ICsNCj4gPiA+ID4gKwlyZXR1cm4gMDsNCj4gPiA+ID4gK30NCj4gPiA+ID4gKw0KPiA+ID4gPiAg
IHN0YXRpYyBpbnQgKCogY29uc3QgaTkxNV9xdWVyeV9mdW5jc1tdKShzdHJ1Y3QgZHJtX2k5MTVf
cHJpdmF0ZSAqZGV2X3ByaXYsDQo+ID4gPiA+ICAgCQkJCQlzdHJ1Y3QgZHJtX2k5MTVfcXVlcnlf
aXRlbSAqcXVlcnlfaXRlbSkgPSB7DQo+ID4gPiA+ICAgCXF1ZXJ5X3RvcG9sb2d5X2luZm8sDQo+
ID4gPiA+IEBAIC01NTksNiArNTkxLDcgQEAgc3RhdGljIGludCAoKiBjb25zdCBpOTE1X3F1ZXJ5
X2Z1bmNzW10pKHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdiwNCj4gPiA+ID4gICAJ
cXVlcnlfbWVtcmVnaW9uX2luZm8sDQo+ID4gPiA+ICAgCXF1ZXJ5X2h3Y29uZmlnX2Jsb2IsDQo+
ID4gPiA+ICAgCXF1ZXJ5X2dlb21ldHJ5X3N1YnNsaWNlcywNCj4gPiA+ID4gKwlxdWVyeV9ndWNf
c3VibWlzc2lvbl92ZXJzaW9uLA0KPiA+ID4gPiAgIH07DQo+ID4gPiA+ICAgDQo+ID4gPiA+ICAg
aW50IGk5MTVfcXVlcnlfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwg
c3RydWN0IGRybV9maWxlICpmaWxlKQ0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBp
L2RybS9pOTE1X2RybS5oIGIvaW5jbHVkZS91YXBpL2RybS9pOTE1X2RybS5oDQo+ID4gPiA+IGlu
ZGV4IDU1MGM0OTZjZTc2ZC4uODRmYjdmN2VhODM0IDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9pbmNs
dWRlL3VhcGkvZHJtL2k5MTVfZHJtLmgNCj4gPiA+ID4gKysrIGIvaW5jbHVkZS91YXBpL2RybS9p
OTE1X2RybS5oDQo+ID4gPiA+IEBAIC0zMDM4LDYgKzMwMzgsNyBAQCBzdHJ1Y3QgZHJtX2k5MTVf
cXVlcnlfaXRlbSB7DQo+ID4gPiA+ICAgCSAqICAtICVEUk1fSTkxNV9RVUVSWV9NRU1PUllfUkVH
SU9OUyAoc2VlIHN0cnVjdCBkcm1faTkxNV9xdWVyeV9tZW1vcnlfcmVnaW9ucykNCj4gPiA+ID4g
ICAJICogIC0gJURSTV9JOTE1X1FVRVJZX0hXQ09ORklHX0JMT0IgKHNlZSBgR3VDIEhXQ09ORklH
IGJsb2IgdUFQSWApDQo+ID4gPiA+ICAgCSAqICAtICVEUk1fSTkxNV9RVUVSWV9HRU9NRVRSWV9T
VUJTTElDRVMgKHNlZSBzdHJ1Y3QgZHJtX2k5MTVfcXVlcnlfdG9wb2xvZ3lfaW5mbykNCj4gPiA+
ID4gKwkgKiAgLSAlRFJNX0k5MTVfUVVFUllfR1VDX1NVQk1JU1NJT05fVkVSU0lPTiAoc2VlIHN0
cnVjdCBkcm1faTkxNV9xdWVyeV9ndWNfc3VibWlzc2lvbl92ZXJzaW9uKQ0KPiA+ID4gPiAgIAkg
Ki8NCj4gPiA+ID4gICAJX191NjQgcXVlcnlfaWQ7DQo+ID4gPiA+ICAgI2RlZmluZSBEUk1fSTkx
NV9RVUVSWV9UT1BPTE9HWV9JTkZPCQkxDQo+ID4gPiA+IEBAIC0zMDQ2LDYgKzMwNDcsNyBAQCBz
dHJ1Y3QgZHJtX2k5MTVfcXVlcnlfaXRlbSB7DQo+ID4gPiA+ICAgI2RlZmluZSBEUk1fSTkxNV9R
VUVSWV9NRU1PUllfUkVHSU9OUwkJNA0KPiA+ID4gPiAgICNkZWZpbmUgRFJNX0k5MTVfUVVFUllf
SFdDT05GSUdfQkxPQgkJNQ0KPiA+ID4gPiAgICNkZWZpbmUgRFJNX0k5MTVfUVVFUllfR0VPTUVU
UllfU1VCU0xJQ0VTCTYNCj4gPiA+ID4gKyNkZWZpbmUgRFJNX0k5MTVfUVVFUllfR1VDX1NVQk1J
U1NJT05fVkVSU0lPTgk3DQo+ID4gPiA+ICAgLyogTXVzdCBiZSBrZXB0IGNvbXBhY3QgLS0gbm8g
aG9sZXMgYW5kIHdlbGwgZG9jdW1lbnRlZCAqLw0KPiA+ID4gPiAgIA0KPiA+ID4gPiAgIAkvKioN
Cj4gPiA+ID4gQEAgLTM1OTEsNiArMzU5MywxNiBAQCBzdHJ1Y3QgZHJtX2k5MTVfcXVlcnlfbWVt
b3J5X3JlZ2lvbnMgew0KPiA+ID4gPiAgIAlzdHJ1Y3QgZHJtX2k5MTVfbWVtb3J5X3JlZ2lvbl9p
bmZvIHJlZ2lvbnNbXTsNCj4gPiA+ID4gICB9Ow0KPiA+ID4gPiAgIA0KPiA+ID4gPiArLyoqDQo+
ID4gPiA+ICsqIHN0cnVjdCBkcm1faTkxNV9xdWVyeV9ndWNfc3VibWlzc2lvbl92ZXJzaW9uIC0g
cXVlcnkgR3VDIHN1Ym1pc3Npb24gaW50ZXJmYWNlIHZlcnNpb24NCj4gPiA+ID4gKyovDQo+ID4g
PiA+ICtzdHJ1Y3QgZHJtX2k5MTVfcXVlcnlfZ3VjX3N1Ym1pc3Npb25fdmVyc2lvbiB7DQo+ID4g
PiA+ICsJX191MzIgYnJhbmNoOw0KPiA+ID4gPiArCV9fdTMyIG1ham9yOw0KPiA+ID4gPiArCV9f
dTMyIG1pbm9yOw0KPiA+ID4gPiArCV9fdTMyIHBhdGNoOw0KPiA+ID4gPiArfTsNCj4gPiA+ID4g
Kw0KPiA+ID4gPiAgIC8qKg0KPiA+ID4gPiAgICAqIERPQzogR3VDIEhXQ09ORklHIGJsb2IgdUFQ
SQ0KPiA+ID4gPiAgICAqDQo+ID4gPiANCj4gDQoNCg==
