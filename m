Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 388448BA80A
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 09:48:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7EBB112883;
	Fri,  3 May 2024 07:48:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HjSMUt10";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 673BC10E7AA;
 Fri,  3 May 2024 07:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714722515; x=1746258515;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=fK8OrLn47fydRe3e9GxD80yIoR0yEuRpRSbblJW1cgA=;
 b=HjSMUt10YBSHcpasI/MU8YbVXrL0+B1dfuqTUIhqgkBecRMbTCgoffwe
 +F/x2VfOUuxgUiKVwYrtfQskxmW/5QWWf5T61PZL7+iVwKOW0CWctlnix
 wS0rkb4EdTE8ivedZhkxdTT8NZIeBAJ6qXU+4WJ0CexWqCaE6rIusFfwi
 cP7nuJokHEN5XTxEbw1Aq0eKIgq4cf/gsEe9cE93sskmjT2llP+uwMvkK
 d7elAZyZnf9xsrjZaP4SrtHQOua29E6fIKzjut6F6/L3SiQVwORaB69Ys
 k2AAfzRi5bWcpfx0qU+/zir/eEpvhBUy7nQanlDVt1DxZvRxTxEnOrhUs w==;
X-CSE-ConnectionGUID: P85TqkNNSWqLr4LmZJqNNg==
X-CSE-MsgGUID: o/daJk28Q52oib3/EeXe/w==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="14307737"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="14307737"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 00:48:34 -0700
X-CSE-ConnectionGUID: +rOzQyQuT+ms1ktLuE4yFg==
X-CSE-MsgGUID: XWHtQ8RzQdWj0VD4ibqc+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="31994939"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 May 2024 00:48:33 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 00:48:32 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 00:48:32 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 3 May 2024 00:48:32 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 3 May 2024 00:48:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gINMh/+0eg7ohXp4djN2tQNAxlis/IQmPCeD5+7nnbH9B97DoNceqM2uqAQx+YGVa6MAFlf7LIpTg/49KT+2pifgdgyv4xWCo2xBXASbNv+vIEAIN78/VY9Q91z/C8vMFBNkR/FZCi5FT1hrd2wvrOBcFuF323gmyrKbnI6LxBUp3dGtF2waxBeL6a0bDIaVLZF2yWBL+22S6pHZRPndB22eWsz971T0RaXjGulyas4qeTGVhmLLgKu5/hNx3f+NPsgmjP8rCGeEP2EZLprDkpKF746R0l3CBtnTBqV17ykKbzCzAW/xSjS667Vm5HvXg/WziJyHsg2h2Py3Nu8X/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fK8OrLn47fydRe3e9GxD80yIoR0yEuRpRSbblJW1cgA=;
 b=ZAWWQkuX5EWj9JWW0rMlFf0OSX3WVIxnfnsZcmr7LHTX1cbGIZucowQ47J5sGNVEtWW+mi2rcH/iM8LxV2oh7wQZdxe7d6C7ULt7w1gU3VxGXIKVJJ/pp1x2hsonVhia48Beyl9OiZ8L8ulp1wtoXMa5ZQvHqrd9xbcQSJiod5QtidxfWQiJ7mvV+bL5t1tuP6d1EFM+NAQmBk2sLl6CIKgUqsC6d94d179+TSOyka+87OvMT7R3tiNBU+NxvRbcMntd0NYwcXl+TXwdxop0cvaKACpF03RAffdhtwufT8MIY9Gd67coH+5YE9Kp39eyp10oK+eEmC/v6I4Sx5bp3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 MN2PR11MB4743.namprd11.prod.outlook.com (2603:10b6:208:260::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.30; Fri, 3 May 2024 07:48:23 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::bccd:7928:80ae:179f]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::bccd:7928:80ae:179f%5]) with mapi id 15.20.7519.031; Fri, 3 May 2024
 07:48:23 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "Manna, Animesh" <animesh.manna@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Murthy, Arun R" <arun.r.murthy@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
Subject: Re: [PATCH v3 5/6] drm/i915/alpm: Enable lobf from source in ALPM_CTL
Thread-Topic: [PATCH v3 5/6] drm/i915/alpm: Enable lobf from source in ALPM_CTL
Thread-Index: AQHalnjWJncI+riS0U+Q3BrxAe5GFbGFL5iA
Date: Fri, 3 May 2024 07:48:22 +0000
Message-ID: <8996bb1d911feaecff7c551853f6f020480a33a2.camel@intel.com>
References: <20240424183820.3591593-1-animesh.manna@intel.com>
 <20240424183820.3591593-6-animesh.manna@intel.com>
In-Reply-To: <20240424183820.3591593-6-animesh.manna@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|MN2PR11MB4743:EE_
x-ms-office365-filtering-correlation-id: e941e3eb-a098-49a2-0986-08dc6b456854
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?b3plMTh6WitSd3FYR01jQXZnV3g4bDN5V0M3R2xYRVFya1FYTjJDUFBYZFpI?=
 =?utf-8?B?TlE5TGY5UWRpcWkvQTR0SENKVWxKbFVQL2h1U1JVcUhGbDJSa1RWUklxc09K?=
 =?utf-8?B?bjhaZmNRaGZQVGxZK1QwTkh0QUdRYWhYaEJOUXBKQUFSNG5nemwxQnVjVUhq?=
 =?utf-8?B?SE5kSXFtTnViWVFsejFiMXppOVhXTm5GdWVDRlFaREFhVGIwUkZPazdkcGp5?=
 =?utf-8?B?dlFMbzFLOEYwNkJtVmMzay9tTjZJYjd5TmRHRzVHbjQyMFgyV2VjMEIvL0RG?=
 =?utf-8?B?blhiQ2NwOFN1TjkwbVY2UVJuRGtoeWtValRNOGpQTUJ5Z1RGWTBhYnVCeUdR?=
 =?utf-8?B?MWl2cmlCWEp1L0hxRSs3OUVSN3E5TytSajgwR0FNSG5JdXh6UWYzeWJ5ZWhE?=
 =?utf-8?B?VGQxN0NZNk44OUhXWlR3cEVuYUR4bkJYQzM5Z2lVN3dtZDhtUzNuemR4aWJ5?=
 =?utf-8?B?SjRIcERRR3I3blhDblV3TE5WdzFMYndHUXJyT1FxQVRUK0tBOTRYc3VMclN5?=
 =?utf-8?B?UDh4SVNkdS8rbC9MZ3R0c1Nkbm1qS2loN0hhNVloNUpxVkFSWEJvTmdWT054?=
 =?utf-8?B?ZnFNbFZVVjZRck55Y0hsSnpDa0R0NU94RjlwWHpJckExdjRMcVpYajZGYTFh?=
 =?utf-8?B?K2VUTEU2T01kQVB0bHZhd3ZGMkFQdjYraktsSXN2KzZvbUFwSGFZY0ZnU0FS?=
 =?utf-8?B?UDF4YTJrZzBiRGtpdUpleUtmREo0K0xwRGxuT2s5K2lJaTFuQ1BVRGZ4d01h?=
 =?utf-8?B?c1ZZajJUajlIN205OHk3QU1odFhocUZpZzlyNC9CR2FOUlhjUjhaRkVFUjh2?=
 =?utf-8?B?U0tWcmtKcmRkZEczMXpHMVVyTmlHN0svUEdUR0k4MnlwMFVFTGtUaWVNSi83?=
 =?utf-8?B?Sy9JTUdkUXQrYVZ0Zmg3Y25NM0JmOEJtY3NLSXhkWUN1WGwwUDBnTGJFWGpt?=
 =?utf-8?B?dkdLbnJ3TmJGZjBpamNRcC9yWkNaRkFOU1BocDlqT3ZIeEFjdThsZnZ0R1Zy?=
 =?utf-8?B?ZHpJSlVIUENJL1ptWUZBNXUrVXFIRXhJb1lnQTBRak52K0JDSWVnc09KUHJV?=
 =?utf-8?B?MjhIYWZXS0Q1WThsNlhrSXJwLzlITDRXTEx3cGk5WlhLRW0wSng3aDRCUUZx?=
 =?utf-8?B?TGVFNXkwaXA2MjkwMWt3eCszRDhtRStWUHZRZ2tqWUQ1cWFtdCtJSjN0Y1Fi?=
 =?utf-8?B?ZGJVZkx5ai9QQnlKLyt1VXp1RWQzZGR0ZUdFN3Z3ZG1sVEFuTnFwdVlhcDJT?=
 =?utf-8?B?ckZ6MGhzbFVVMVlnTndOOFFSYUdBQWxvRUxsR2h2dGl5VnljS2JsWUZlTWY0?=
 =?utf-8?B?UTdyOWFiZEpUc01yWW1mdGRaMjZNSUNyK1hjMTFSa1NVNjFCY1VSMmNqZWdu?=
 =?utf-8?B?TFV4T0Q4Q2diK3NlTnE4U1NESW5tcTlWV1p5R1FybVgyZHhDODNWcWN6Q2Vm?=
 =?utf-8?B?ZU1nSEVDVFg2Snd6TW5XZUd2ZGRrNWcvK2JqVXA0TEg5NjNKQlJRVFZzS29H?=
 =?utf-8?B?bEZYMjhDdFpRejd1OFg1L2QxMzdrM2MxbXVlelF3R3lBRFJuNVRZYVBZd2Ey?=
 =?utf-8?B?MlFQM1J5YXhPOE1jaE1xWmkxM281ajgrLzZFb0poTlVFZStiU0djWE5TaUcw?=
 =?utf-8?B?QmNIU2xJdmJsY21rOWYyVDFudjN1aVpkOHhGMHBJb1lTMlI3dWRLMEo0Qjdv?=
 =?utf-8?B?cndqRGtySjVQUHVkQXRYZTZIeVR1VnFrL1V1UDVFMmNCUXpqUWFoTjZtd2wv?=
 =?utf-8?B?dTU3aHczRkxOMTE4MXB0ZkwzYVZ2ZHduZXZzaVkwRkQ0QkFjWHVDUGJSTklm?=
 =?utf-8?B?ZWEvTUNBZkUzS3NpWWtDZz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OWNnRmM0b2R0T3JtK0ZpYjZ2cllQSUFQeER2b0FHZngydVE3RmlyMFdxbzVj?=
 =?utf-8?B?M1AzeUtBOVBmdUYzNjg3c3V3OXpkT2EvS09BUG1icm5GL3ZUUjU3MXhIZExq?=
 =?utf-8?B?eTQvSHFZUFlrTjFMSzJxNzVZd1ZQVVliL28vMHVIWi9wWTYyNVozN01KUkZi?=
 =?utf-8?B?S3FaVEI4WlBqWFhTVllNRFFiSm42ZytZUVVQTUZ1bWVERDVTTjR0VHdRTVNG?=
 =?utf-8?B?eitBc3I4dVRaUWlRd0RGTFh3ZWdMM3YvK1dsNUVwY01VcU5vc3V2U0V5bjRi?=
 =?utf-8?B?ZER3SzNPNVdsTDQ1Qk1YRWFOTmZEcjhzMUxTdnV3Q0lRd1RyMW03a0tTOFhQ?=
 =?utf-8?B?Y0pYRjl5ZkE5QjFhTUtNZUN5dzJjZzh5UmdKeWYrT0ttRWhRSmFjaGZjY0tP?=
 =?utf-8?B?YldjK1hYWGVsc2F0NjkzeGVydGx4Ym9VSk1ZODNnZnBuQTNCV0RrcHJtWS8x?=
 =?utf-8?B?NUtCSkN6b1NCNnZKSjVIekpYRHlFOGhIbkdURHJmWVJOWFFqcklwMkphUkhQ?=
 =?utf-8?B?bnhRZnNKdDN2WW9HbUZsdm5MUUZXb1Q1S1QzM2Y4QTNvZDJxV3VOMTYxU2Ex?=
 =?utf-8?B?ZXRERklzNmdrWU1FM2dlMEFGWmxTTDRBVXphL0tzeFZTcStpY2F2U0NUTjNP?=
 =?utf-8?B?bWlLamhoRUVpR2gzbHZycnVYa1hDVHp1WkJBdmdEejdhN0gwcVVmTzJVc3hk?=
 =?utf-8?B?b1FBaGg5TW41MERtRVQxR2dLelNITHZ5c0M0UTVEUElBdmltMmN0K0pLKzZY?=
 =?utf-8?B?MFNmR1o1ck1GR09WM1AwM0ZvV2dOdVdRc0NPTmlnRHFoRTJLYTVLRlo0YW4x?=
 =?utf-8?B?S3RCbVZXMG0vZW96dHhWMktOWWJGbVNBYlZnendjZmJETDdVUVNwV1dyZDJy?=
 =?utf-8?B?bklOWUVOVmtJMisvNllCWWJOeGNTeEVuYXlrWWNLVE55S2tMTTg4Z1c0TmRj?=
 =?utf-8?B?bzBvMVZKekhqRUpZbGphQnVzNFhLY1NhTC9YY3cyVzk5RU5JRkhPSVNqK1Y4?=
 =?utf-8?B?ZmJHSEdBbUVraHJHbXNkUHZMQ1JwRXpRekpqWXNCSEhjeGxJaUZ0UFB5LzJO?=
 =?utf-8?B?UTdDaDhRbVp4QTViR0ZydEVYZFcreDBLNWNwTFlJcHVzVjFyTmdCZnRkNjcr?=
 =?utf-8?B?TEh0Qlp0cVlKUm9yOEJCU3ZCdm1ZQ3NpbzhXZVNzbFNXNHAyWGExZUpacnNN?=
 =?utf-8?B?bWl3MnMwQlVFNGkzYUhYR05zcjRKdnpPcW53VnViRm4rNWQzeXRjVkRYenFa?=
 =?utf-8?B?Q3pRbjJVSFc5Q2lWS2dnUkMrOWpRL1ZSVFhrdm5xQ1ZrWEY0RmN5VEc0M21F?=
 =?utf-8?B?VEQzRzZHOUdOZFFCT0JwbGs1L2RscWtKUkhyOTJTZldRdm9VWWN6QkExZGJX?=
 =?utf-8?B?dUZndEhCS0RvUm9lQzhLeUgzbUQzWi85dUtWVzZ6OW1TNk9WNzFJUVRLckty?=
 =?utf-8?B?cUlRU1Y4Y0oxNnFxazdhWUhkeGMza2FEaDhUWEYwUzBZdmJLSlpxWm1DK3hk?=
 =?utf-8?B?NklpZUVmS2RGbjFVRHIwLzd2MDB2c0dqNUlhL2pULzBrRkdnRGgyUEJYelZu?=
 =?utf-8?B?SkN4YVN2OVphbm5QMC9sSFl1RWRjQ1IwdWRzbElwNzZmWjdENXp0NmJKeCtQ?=
 =?utf-8?B?VlluNnF3c0hING14WW9NM2ZNajVwNVZUamlkTnNYeEdEMGpvUnRkZkJBNjZW?=
 =?utf-8?B?V0xpUmlpMVN0Ni94TEoxUHRmKzdxTjIyV3RqOFhLL2RoUjR6UDJtazlxWDZM?=
 =?utf-8?B?eWE0djZaWUMwL3lpdXg2S00yNXRPYnJyRDB4N2dYbVNkRzNROFpPcXAvZHBM?=
 =?utf-8?B?V0ZvWEtycmtEZEZEdHBZTWt2MFRaN0xKNzdnd3VNSEtBeEhNN3MxNE9XUXFl?=
 =?utf-8?B?KytSeUhaejA0NS9BN3kyc3hGUFNnWXpoRVBsOHRDSmRVcy9TRTZQOFdCNnJY?=
 =?utf-8?B?MkJWT09DS0Ric3FWY1JUTHV5U29DQzJLUHlTT1RjT21Wd2dadkxOSUZydjZp?=
 =?utf-8?B?cVVtT2h4V2N4ZnIxTWhPVC9wbUU4cEN4dENmeGZ4ZjhyU3p1TEp2RUMvc3JD?=
 =?utf-8?B?a1pxYkhnOUFmZjd4ZG9TTC9BMzBuWWJyNGplN2R6RGtvMGV5MklZK0xJYXRX?=
 =?utf-8?B?UUNZaG5LcmFqMG8ycExxQVZWSVdkQ2dmY1o3Yk5ab09BZW1JQS94VkxsNGNL?=
 =?utf-8?B?bHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <123073C14A51554EA93AD8E33604C1C5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e941e3eb-a098-49a2-0986-08dc6b456854
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2024 07:48:22.6891 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q8aGb/hKSblQzm6wOoTbNt+c8Ri8HcFRE8sHcR6yYMu+aYlAcZoO6wGeF7VNwvhEI4hhoqrYu218o4aLs2UmbWjjXRIneEC64HwbwpEd6Yk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4743
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

T24gVGh1LCAyMDI0LTA0LTI1IGF0IDAwOjA4ICswNTMwLCBBbmltZXNoIE1hbm5hIHdyb3RlOgo+
IFNldCB0aGUgTGluayBPZmYgQmV0d2VlbiBGcmFtZXMgRW5hYmxlIGJpdCBpbiBBTFBNX0NUTCBy
ZWdpc3Rlci4KPiAKPiBOb3RlOiBMb2JmIG5lZWQgdG8gYmUgZW5hYmxlZCBhZGFwdGl2ZSBzeW5j
IGZpeGVkIHJlZnJlc2ggbW9kZQo+IHdoZXJlIHZtaW4gPSB2bWF4ID0gZmxpcGxpbmUsIHdoaWNo
IHdpbGwgYXJpc2UgYWZ0ZXIgY21tciBmZWF0dXJlCj4gZW5hYmxlbWVudC4gV2lsbCBhZGQgZW5h
Ymxpbmcgc2VxdWVuY2UgaW4gYSBzZXBhcmF0ZSBwYXRjaC4KCklzIGFkYXB0aXZlIHN5bmMgbmVl
ZGVkIGZvciBib3RoIEF1eCBXYWtlIGFuZCBBdXggTGVzcyBXYWtlPwoKPiAKPiBTaWduZWQtb2Zm
LWJ5OiBBbmltZXNoIE1hbm5hIDxhbmltZXNoLm1hbm5hQGludGVsLmNvbT4KPiAtLS0KPiDCoGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5jIHwgMTMgKysrKysrKysrLS0t
LQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmggfMKgIDQgKyst
LQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuY8KgIHzCoCAyICst
Cj4gwqAzIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5j
Cj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uYwo+IGluZGV4IDNi
YjY5ZWQxNmFhYi4uYjA4Nzk5NTg2YjU4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9hbHBtLmMKPiBAQCAtMjkwLDEwICsyOTAsMTEgQEAgdm9pZCBpbnRlbF9hbHBt
X2NvbXB1dGVfbG9iZl9jb25maWcoc3RydWN0Cj4gaW50ZWxfZHAgKmludGVsX2RwLAo+IMKgwqDC
oMKgwqDCoMKgwqB9Cj4gwqB9Cj4gwqAKPiAtc3RhdGljIHZvaWQgbG5sX2FscG1fY29uZmlndXJl
KHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHApCj4gK3N0YXRpYyB2b2lkIGxubF9hbHBtX2NvbmZp
Z3VyZShzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnN0IHN0cnVjdCBpbnRlbF9j
cnRjX3N0YXRlCj4gKmNydGNfc3RhdGUpCj4gwqB7Cj4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBk
cm1faTkxNV9wcml2YXRlICpkZXZfcHJpdiA9IGRwX3RvX2k5MTUoaW50ZWxfZHApOwo+IC3CoMKg
wqDCoMKgwqDCoGVudW0gdHJhbnNjb2RlciBjcHVfdHJhbnNjb2RlciA9IGludGVsX2RwLT5wc3Iu
dHJhbnNjb2RlcjsKPiArwqDCoMKgwqDCoMKgwqBlbnVtIHRyYW5zY29kZXIgY3B1X3RyYW5zY29k
ZXIgPSBjcnRjX3N0YXRlLT5jcHVfdHJhbnNjb2RlcjsKPiDCoMKgwqDCoMKgwqDCoMKgdTMyIGFs
cG1fY3RsOwo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoGlmIChESVNQTEFZX1ZFUihkZXZfcHJpdikg
PCAyMCB8fCAoIWludGVsX2RwLQo+ID5wc3IucHNyMl9lbmFibGVkICYmCj4gQEAgLTMyOSwxMiAr
MzMwLDE2IEBAIHN0YXRpYyB2b2lkIGxubF9hbHBtX2NvbmZpZ3VyZShzdHJ1Y3QgaW50ZWxfZHAK
PiAqaW50ZWxfZHApCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBBTFBNX0NUTF9FWFRFTkRFRF9GQVNUX1dBS0VfVElNRShpbnRlbF9kcC0KPiA+
YWxwbV9wYXJhbWV0ZXJzLmZhc3Rfd2FrZV9saW5lcyk7Cj4gwqDCoMKgwqDCoMKgwqDCoH0KPiDC
oAo+ICvCoMKgwqDCoMKgwqDCoGlmIChjcnRjX3N0YXRlLT5oYXNfbG9iZikKPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgYWxwbV9jdGwgfD0gQUxQTV9DVExfTE9CRl9FTkFCTEU7Cj4g
KwoKSG93IHlvdSBhcmUgcGxhbm5pbmcgdG8gZGlmZmVyZW50aWF0ZSBiZXR3ZWVuIEFVWCBXYWtl
IGFuZCBBVVggTGVzcwpXYWtlIGZvciBMT0JGPwoKQlIsCgpKb3VuaSBIw7ZnYW5kZXIKCj4gwqDC
oMKgwqDCoMKgwqDCoGFscG1fY3RsIHw9IEFMUE1fQ1RMX0FMUE1fRU5UUllfQ0hFQ0soaW50ZWxf
ZHAtCj4gPmFscG1fcGFyYW1ldGVycy5jaGVja19lbnRyeV9saW5lcyk7Cj4gwqAKPiDCoMKgwqDC
oMKgwqDCoMKgaW50ZWxfZGVfd3JpdGUoZGV2X3ByaXYsIEFMUE1fQ1RMKGNwdV90cmFuc2NvZGVy
KSwgYWxwbV9jdGwpOwo+IMKgfQo+IMKgCj4gLXZvaWQgaW50ZWxfYWxwbV9jb25maWd1cmUoc3Ry
dWN0IGludGVsX2RwICppbnRlbF9kcCkKPiArdm9pZCBpbnRlbF9hbHBtX2NvbmZpZ3VyZShzdHJ1
Y3QgaW50ZWxfZHAgKmludGVsX2RwLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgY29uc3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUgKmNydGNfc3Rh
dGUpCj4gwqB7Cj4gLcKgwqDCoMKgwqDCoMKgbG5sX2FscG1fY29uZmlndXJlKGludGVsX2RwKTsK
PiArwqDCoMKgwqDCoMKgwqBsbmxfYWxwbV9jb25maWd1cmUoaW50ZWxfZHAsIGNydGNfc3RhdGUp
Owo+IMKgfQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2FscG0uaAo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmgKPiBp
bmRleCBiOTYwMmI3MWQyOGYuLmE5Y2ExOTBkYTNlNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5oCj4gQEAgLTE4LDYgKzE4LDYgQEAgYm9vbCBpbnRlbF9h
bHBtX2NvbXB1dGVfcGFyYW1zKHN0cnVjdCBpbnRlbF9kcAo+ICppbnRlbF9kcCwKPiDCoHZvaWQg
aW50ZWxfYWxwbV9jb21wdXRlX2xvYmZfY29uZmlnKHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHAs
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZQo+ICpjcnRjX3N0YXRlLAo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUKPiAqY29ubl9zdGF0ZSk7
Cj4gLXZvaWQgaW50ZWxfYWxwbV9jb25maWd1cmUoc3RydWN0IGludGVsX2RwICppbnRlbF9kcCk7
Cj4gLQo+ICt2b2lkIGludGVsX2FscG1fY29uZmlndXJlKHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxf
ZHAsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBj
b25zdCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSk7Cj4gwqAjZW5kaWYKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYwo+IGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYwo+IGluZGV4IGM0YWIyODlk
YmMxNS4uNGViNDVkZjIwYWQyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfcHNyLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX3Bzci5jCj4gQEAgLTE2MTEsNyArMTYxMSw3IEBAIHN0YXRpYyB2b2lkIGludGVsX3Bzcl9l
bmFibGVfc291cmNlKHN0cnVjdAo+IGludGVsX2RwICppbnRlbF9kcCwKPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBJR05PUkVfUFNSMl9I
V19UUkFDS0lORyA6IDApOwo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoGlmIChpbnRlbF9kcF9pc19l
ZHAoaW50ZWxfZHApKQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpbnRlbF9hbHBt
X2NvbmZpZ3VyZShpbnRlbF9kcCk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlu
dGVsX2FscG1fY29uZmlndXJlKGludGVsX2RwLCBjcnRjX3N0YXRlKTsKPiDCoAo+IMKgwqDCoMKg
wqDCoMKgwqAvKgo+IMKgwqDCoMKgwqDCoMKgwqAgKiBXYV8xNjAxMzgzNTQ2OAoK
