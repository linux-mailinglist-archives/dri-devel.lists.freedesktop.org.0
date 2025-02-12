Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7B5A31E62
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 06:57:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98EBE10E7B5;
	Wed, 12 Feb 2025 05:57:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KjsxwmJP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1FBA10E7AD;
 Wed, 12 Feb 2025 05:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739339872; x=1770875872;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CZ97dLqp3ZJP2Ml3D3Tlpc0UeQ6WMfe+74xucSy5Qu8=;
 b=KjsxwmJPLEreVqdr2JhDP6Z3QgQi2EbU4JRDZ/O94FQ+BDfxbCzUFmOy
 r+kDgwNSrSnFTJw/PakcfQvDQyIhhXULEBkbU2F33r6JXEmHW5IvTnsYo
 GSidDEn4Cd1cC6H79RsGTYDmQwB1m1R1uJKksiQjRJq/MKkiLLf8UQPLK
 F636HH3VvEeFYU9Vb33YgWcqxQtKcKyDDn7Xy9l0OORleGZpe1ylQGsAk
 UQJ+dIu56zuktWHl8h3lHt+IsyPd4JKAku7r4XquINZv8Upi6PPXkwtgK
 RepYK0TLZtB6MpePPut23J8CHsWEeK+BjSva/UoxyfxPJJI1gu/tRew+3 w==;
X-CSE-ConnectionGUID: ar+ZF8qBSY6oONriq4z8zQ==
X-CSE-MsgGUID: KjwF4WiSTvKbeog9adC4FA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51412323"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="51412323"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 21:57:51 -0800
X-CSE-ConnectionGUID: NEnAhZTaQBGa9ywF41yoIw==
X-CSE-MsgGUID: DWqKpI3pRJ+2sghVv2f1xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113620429"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Feb 2025 21:57:51 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Feb 2025 21:57:50 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Feb 2025 21:57:50 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Feb 2025 21:57:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RoC81RcaLYy8QhDEKyoiR0OBhocB91TytTqQxl0m7uVhTlcJImABSlmLuEC3qb11U0MJ3n3uI9G+4wu5BBK4d1D1wVd9n56k4ZU7sRBr+6qeSIwNvZGNJsLwB7UemTsiWe7CfYCc+M/K3JC/jL931GtyyP/SKy+16LNj/jSoLtuySjcz+2LEwsozB8sxsBr4+UnGLm9B2ae9+2jaCKj3MCT5LA8fuqLiVfyLsU4VF8O2Pp8W9PwB8hCcRxVs6fNhprc6AiiztMO9w+0DMmTbqyD8SahXo3BM3SiyIxVpUuuyuohSgv3su0zeOk8v45gcnOAt2hwbGLbOz9LYgHhU2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CZ97dLqp3ZJP2Ml3D3Tlpc0UeQ6WMfe+74xucSy5Qu8=;
 b=KzMjKc8OyXF/kQ7QIQOqgWhdZhHkwD11Mo07ssL6EQwFSr+Q4k0LjR4277snuYsRfluM0Vf6vzZiPzZFQWoCZOTuzbCxUS+w2ms9tJj6+7S46awmrLoxhm0TRBNSLcQ0I0q0OYsSAdSEZvWhNLCAC9RhZteYIEszna3QCXsx8oBxHN37sD/DG1mM/ZPmvuAdidtQruI3Eli/XkFE5es+UP08k0Pm4SqVYRPoj1OhSQrKnOr3fwkk1p3xP9XBCHwgrkSulAPt4QDuVUe0r2t04Q6z7Wsgupt46KYLAOqGUjBrw9wvjOdzFnHmr+NRomRjppugN1kNxwEPRx+S4thGpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by PH7PR11MB8597.namprd11.prod.outlook.com (2603:10b6:510:304::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Wed, 12 Feb
 2025 05:57:48 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8445.008; Wed, 12 Feb 2025
 05:57:48 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Syrjala, Ville" <ville.syrjala@intel.com>
Subject: RE: [PATCH v4 2/3] drm/plane: modify create_in_formats to accommodate
 async
Thread-Topic: [PATCH v4 2/3] drm/plane: modify create_in_formats to
 accommodate async
Thread-Index: AQHbd7qg1Li5OhDye0qCOftu9r57D7NDHy3ggAAOLQCAAAiSsA==
Date: Wed, 12 Feb 2025 05:57:48 +0000
Message-ID: <SJ1PR11MB6129CBF880451AAB24E86703B9FC2@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250205-asyn-v4-0-9a5b018e359b@intel.com>
 <20250205-asyn-v4-2-9a5b018e359b@intel.com>
 <SJ1PR11MB61298A26E2E2FD639AB75998B9FC2@SJ1PR11MB6129.namprd11.prod.outlook.com>
 <677163e1-dd44-472b-a0cc-3fdb315b1712@intel.com>
In-Reply-To: <677163e1-dd44-472b-a0cc-3fdb315b1712@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|PH7PR11MB8597:EE_
x-ms-office365-filtering-correlation-id: b7c30a9a-2833-49b1-7e62-08dd4b2a2d7d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?dDdIMkRaYXpxeC9ISHpmV0pFa0RWVHJkTG03ckxERjVzRlhhWkhuVXlaN0dq?=
 =?utf-8?B?dU0vS2NKbUE3d1QrTnBZM0lDRzVSLzBHd0VVbXlWU01RaTBuZWRSKzdmWUtT?=
 =?utf-8?B?bE9hbjQ4N1RadjEyOFZXVzNkWFFkNEpPZXFqckxnalc4MnZZQmgzb3gyd0lE?=
 =?utf-8?B?aFh5Z1FucGoyb1pGSVQxRC8yMmpsWk1kbkRLU3VEWWZOTkhmS3NKSDZLbmZF?=
 =?utf-8?B?d09NdXovY1hTMUpTbFdoQnVlWVB5VnZuMlVUN2Y5R3lnKy96Z1ZWa0hRRm93?=
 =?utf-8?B?bjU5N1V1K3RnejE1REQ3b1BMYTNyNURUUUh4a1g2TDBuZ3p3c1RQOFVwQU52?=
 =?utf-8?B?ZkhLR3BkTHdZOFpqbEwwWlRJeVhDYy80V0hpQ0xiUzJPOGFmSjZqVldJOHpP?=
 =?utf-8?B?cEdSQTBHNU4yd1ByYVI5bkVQeUovZUJnN2drVEYzUTAzcStEVzJIeTZKTklR?=
 =?utf-8?B?UjNreklYaEQvZE4rbXU0cVBuTmZPM1dTeDFtOTNqYmROTVBOTHZySEd3VFdP?=
 =?utf-8?B?b3VyYnozYjV0N3NzQy9ud0ZCenkyWGFPMFBrMEJHWmE5cmFqQzJIUWQyN1JE?=
 =?utf-8?B?SXMydUlGV2Q1d0ZlMTd6SmoyVVNsZ1VJTVEyckhVUjh0ZC9oY2lDK2F4eld3?=
 =?utf-8?B?TlBqbGREaHBKakxDQTZ3UVY0L3NNcUFGZU1VN3kvZlFSYlN1THF3VXgzbXZL?=
 =?utf-8?B?eEdkVWpmZGRvU0RBcGFQaityb29RMzlGb3FUMkR3YlFGYTcxYzBpZVF6WVYz?=
 =?utf-8?B?WWFMalJlcnkwS1hqYkRVUkpZUXExeFpJZHlJRzkrR0tUcENZZE1lUllKR3NO?=
 =?utf-8?B?UHZKRExsWmRkU3IrU2lKRkVkcGEvNERkZ1dTZjBmMnFLSUZXMkpJcVI1Y1hP?=
 =?utf-8?B?d3pXMWxHYm9RdHo5WERFbTJBUmNueXV2WEx3TnhKZlVYNnFyenpYeXhIc252?=
 =?utf-8?B?WThLR2ppKzJXc0t0L3ZGbUhIeVcwcTg1bk1vb2hHRlJWWGlBamhwTDVud1gx?=
 =?utf-8?B?K1pwNk9PUkVvOVhxbHdJTVhVVzlQbzRHWmF6KzN1R1dxV09QTERZUnA1b1hW?=
 =?utf-8?B?T2lHT2puMGNNRFZTejAzZWlsckgxUEYzZzhGUHBMQ2JBWDNwSWxSZ0hXeWxC?=
 =?utf-8?B?OHNINGl3OUVUcXYwK2ZIYUQ0aGE1K25wM1BjclNWQVZSdDNOYkRhNE5jUDk0?=
 =?utf-8?B?d0twOU84bzFTS0diSlIwRVlLODNRM2lpek1kQzFMQ0NHdy9rclRFVUdveUVC?=
 =?utf-8?B?eHVLOFdHNnBxaG5zSUdZSmVyNC9pamZnNUo5RlhJb2p2dFVrbE8zbGJFRitY?=
 =?utf-8?B?QVF3a2lHZFlucXJFVTloTW1iYkFxTVliTmN6YkRic3diQXV1YzIrWko1ZzVq?=
 =?utf-8?B?SmhvRjBtbTFqWVdnb0IrbzFaSEVRMTJlWHpTaVZlcmFKNU5zYVBQYU9HZFAy?=
 =?utf-8?B?SExzN3ByMWJ4MWxhdjg1NHFnR2FRSk13MVBNUG1PN3NWRUprdFFjeHRwK2xV?=
 =?utf-8?B?TXRRcDhTRWdXS0pJRkUybkh3Y3lpNWJPZmhJdThIa1lLM1ZPTC82dmVidkd1?=
 =?utf-8?B?Rkl2dTFWc0dNRmg5QUxaM2Fwb1ZoUDRYOW1tQkJFVlMvcWtmUEo1bmdPaWhM?=
 =?utf-8?B?QVNES0NLZERkdlREZmhoZ1pVUVpNY2s1d2R2VG5WMm90N0E3RlNsMWgvUmpt?=
 =?utf-8?B?WnExaU9jcy8xK3FNL0l0c0pqQkduN0QrQjJtYkU5Y3NzNHRjN3hTRU8rYzl4?=
 =?utf-8?B?TU44NlZyR09Jdk85MEJuWU91c29acjllUSt3c2M1SldGckpncEFqbFJFSHlq?=
 =?utf-8?B?QTRyYVkrVkVrU29WZXJQQjdoa2pVYlpBYjR4V1owaktCUExremtFU3IwelhJ?=
 =?utf-8?B?ZU5QMUtidjRKallzeUZtYldCVHpQRVFRMS9QYnUvT1ZNSU5CMndOVTRSUzhS?=
 =?utf-8?Q?w7ZPMWXqJheuP30EGnJZEQ0t+glI9h1q?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SzZ6YjVxdllMNUJMMUN6RUJScGN1emc3WFZ2TnRPcXNyRFkwaUd4R0lQYmdv?=
 =?utf-8?B?dHE1M296S1RRRVoyMFkvbFZnU2xKVEY2SUF6K3dOSjYvYkhlWGowWGpzWnM5?=
 =?utf-8?B?TTd0Z3ZNR0tUOE52NTRqNk1kblM5YWkvSHluQVc5U09TZjFQQXhpZzJKVnFh?=
 =?utf-8?B?VmlJbTU3ZkUybnkrSEFVWjJzaVRJTHdlL1ZrYThWaXpoTE5xUDM0cHhKL3lM?=
 =?utf-8?B?NzcrTWx6bkZ3dXNrRytqcWlxZDhnNXc0Ri82eTk3YlY4RXFORFkxVkxYczZK?=
 =?utf-8?B?UlF3VHhuYVlQMExXakN2M1hqVEhRdkNJSGs1b21hd3FQcWFBRm93eXhqOE03?=
 =?utf-8?B?aXR5cnUydmU3TzVsRnMwRW53akRLazRLVmtSeWJzYms3WFFSLzRsT2g4OEpi?=
 =?utf-8?B?QmEvNjk3NDFUaWlUdU5YbGRqTzJIT1RneVhtUWVEeWVZSHFyeTlJeDNOWmcy?=
 =?utf-8?B?YWV3MUpIMi85OGZlMTlrdlJMckRVSWVLYTU0R1lDbE1jZEQvMW5rSUhxU3V6?=
 =?utf-8?B?T3VXcnhhSHRUV1V5d1Fjd1FhUGZaZVZqdFpvbU94dnFaanE2eXFuSUlLdU9K?=
 =?utf-8?B?VTJGOTFvKytHNVN6Y2cyMitONFhPNzI4VHV0UE9RTDdxdnREL1lFN0RzRnZn?=
 =?utf-8?B?UTFLcTc1RlZMbVpGbzJ1dDg0MElYdk5UR2ZvZjlteE1yTWRkclcwRGhGWjFM?=
 =?utf-8?B?Vkd3aVFQSXpIclk5ZjZITmdhNy9PMTdMaEkzUDZLRDlvT25oNlUvTWFrL3RM?=
 =?utf-8?B?WUhEaDNic0NJVTRRcE9FVndGWEFIVDFETU1KSE14TzI5c0pyWVdXcllNckFt?=
 =?utf-8?B?VHhQaytzbWRhVk5PUjkwR0hpU21SbU1IVGpUaDJ4azNXVXlkU3lUUjhpMC9u?=
 =?utf-8?B?cUZBWlNQRWlsSEdqeGgrOU1ZUWJraVdGVGNZbjlHWGovYVFhbC94WHlwZXpm?=
 =?utf-8?B?T2lhYUpzKzVjeVB2ZTZVRmZwQlNWcFdhY2o4cDJDRmd5WHM4U25rcFZLaThW?=
 =?utf-8?B?MURpNzViQXplNDNQMkFtUjFwUmlwSkhCWGhRckp1ek5odjdybUlRMlVTSnNs?=
 =?utf-8?B?b2pRTk1rQlEyTHFwOXZpcGFlVFRMZDVGVWk0Ukt4ckd2alRuS3hEWWRYTzdN?=
 =?utf-8?B?NWZLNExPTkMwOHJPYTJrMHRnaFdYdytmd3UvKzF5QXlZMi9LM3ZrMEo3MStr?=
 =?utf-8?B?MDlrMWZKTVB6V0lQTE15Y2dENzN4WXQ3RHM5ZFh6OEdNaDNraFBsUWo0cnhP?=
 =?utf-8?B?Yncvbk1sZGpZS2Jsc0xoT1pRY3d4Q1oxTFlmbThNWCtwQkVKSnNoQmxRanQ1?=
 =?utf-8?B?eFlXRmIvZkh1dU5GUlgvZU15Y1ZpZ0U2WjZlWk5tNytoaU1hYWJhWXRNc1pm?=
 =?utf-8?B?a3BaQ3ZMUnpmbEpNb045RG5qdXR2ZXIvby9vMVJsUDRKMnkwOWZsdk11LzVC?=
 =?utf-8?B?REhWMGo1WU95WVZHVDRUYXlvdURmMTVMb3Z2RUp3UGkrY3l1aExWTFdxWTNq?=
 =?utf-8?B?MmF3dWtPUVpnRFNzZld5eU8wZ29yMkJaVVYzT004cTRwY25MM085YVdUTVZn?=
 =?utf-8?B?bDIxUWtOSFAreTY2bjhNdFZvZzFoQ2tLSDhzYmpuNE9XQStOVGpSMHpDcVVl?=
 =?utf-8?B?cHhzZ1NNOTBONWxmc1Bob01ialcrN0sxZXAwbmtMS2ptRUFLNzEyLzVUdmsr?=
 =?utf-8?B?ZnZSaG1XTzZhNW9jK240cVJva3BFcGlwQU1oTW1rcDdPVjIxVDdxTTR1SlBr?=
 =?utf-8?B?SXlvc3Yya1J1eW5rVW9zQUlHNWozYWg2Z085Y2I4YVdpN0xPSmJ3U1YrYXdn?=
 =?utf-8?B?MHlPcmR0MW42bk9NOGdpU05nb1paWm53WCt6cFJrU3RvMXBpRHhDdGtEdm53?=
 =?utf-8?B?ckxiZVdxcUJ0MTlkT0I0MERzaWs1SjJxNWhKRHZiQUkzQmo0VW5XUnJvOGxW?=
 =?utf-8?B?U3ZKbnUrOGE0WnY1bnB6UkM2UTZlVytHbGc1ZkVVYkQ1YUpIdmxxb1pUVVZF?=
 =?utf-8?B?QVRqeU9oRURUSFFmNHpHV05xNHBUejFnaDRMWU05Sk1sTmNPOW1wRjRBUVEw?=
 =?utf-8?B?Y2Vpc2toREtNMlBWd1lMVWdLQkMzYThFbjJrbnBLb1prbklUUUw0VGVBMGIx?=
 =?utf-8?B?MndkUmdkdy80Tjdwc0w0VjE2MTRDQm5RSTB1aHVUWWRmZjdDN284MDlrNTha?=
 =?utf-8?B?SlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7c30a9a-2833-49b1-7e62-08dd4b2a2d7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2025 05:57:48.0327 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ogZ0ToC6jWgm9MnX2Sl3xxjMaaPcQEy4gFjSgdm0Aa/BSDnEGWgawcvltbDxdybs477Ju2IQA91bep1dtQxj+HCXFySBFiMBiN8fCbS2c/s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8597
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTXVydGh5LCBBcnVuIFIg
PGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEZlYnJ1YXJ5IDEy
LCAyMDI1IDEwOjU1IEFNDQo+IFRvOiBCb3JhaCwgQ2hhaXRhbnlhIEt1bWFyIDxjaGFpdGFueWEu
a3VtYXIuYm9yYWhAaW50ZWwuY29tPjsgZHJpLQ0KPiBkZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmc7IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGludGVsLQ0KPiB4ZUBsaXN0cy5m
cmVlZGVza3RvcC5vcmcNCj4gQ2M6IFN5cmphbGEsIFZpbGxlIDx2aWxsZS5zeXJqYWxhQGludGVs
LmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAyLzNdIGRybS9wbGFuZTogbW9kaWZ5IGNy
ZWF0ZV9pbl9mb3JtYXRzIHRvDQo+IGFjY29tbW9kYXRlIGFzeW5jDQo+IA0KPiBPbiAxMi0wMi0y
MDI1IDEwOjIzLCBCb3JhaCwgQ2hhaXRhbnlhIEt1bWFyIHdyb3RlOg0KPiA+PiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBNdXJ0aHksIEFydW4gUiA8YXJ1bi5yLm11cnRo
eUBpbnRlbC5jb20+DQo+ID4+IFNlbnQ6IFdlZG5lc2RheSwgRmVicnVhcnkgNSwgMjAyNSAzOjU3
IFBNDQo+ID4+IFRvOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnOw0KPiA+PiBpbnRlbC0geGVAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnDQo+ID4+IENjOiBCb3JhaCwgQ2hhaXRhbnlhIEt1bWFyIDxjaGFpdGFueWEua3VtYXIuYm9y
YWhAaW50ZWwuY29tPjsNCj4gPj4gU3lyamFsYSwgVmlsbGUgPHZpbGxlLnN5cmphbGFAaW50ZWwu
Y29tPjsgTXVydGh5LCBBcnVuIFINCj4gPj4gPGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KPiA+
PiBTdWJqZWN0OiBbUEFUQ0ggdjQgMi8zXSBkcm0vcGxhbmU6IG1vZGlmeSBjcmVhdGVfaW5fZm9y
bWF0cyB0bw0KPiA+PiBhY2NvbW1vZGF0ZSBhc3luYw0KPiA+Pg0KPiA+PiBjcmVhdGVfaW5fZm9y
bWF0cyBjcmVhdGVzIHRoZSBsaXN0IG9mIHN1cHBvcnRlZCBmb3JtYXQvbW9kaWZpZXJzIGZvcg0K
PiA+PiBzeW5jaHJvbm91cyBmbGlwcywgbW9kaWZ5IHRoZSBzYW1lIGZ1bmN0aW9uIHNvIGFzIHRv
IHRha2UgdGhlDQo+ID4+IGZvcm1hdF9tb2Rfc3VwcG9ydGVkIGFzIGFyZ3VtZW50IGFuZCBjcmVh
dGUgbGlzdCBvZiBmb3JtYXQvbW9kaWZpZXINCj4gPj4gZm9yIGFzeW5jIGFzIHdlbGwuDQo+ID4+
DQo+ID4+IFNpZ25lZC1vZmYtYnk6IEFydW4gUiBNdXJ0aHkgPGFydW4uci5tdXJ0aHlAaW50ZWwu
Y29tPg0KPiA+PiAtLS0NCj4gPj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMgfCA0MA0K
PiA+PiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tDQo+ID4+IC0tLQ0KPiA+
PiAgIDEgZmlsZSBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkNCj4g
Pj4NCj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGxhbmUuYw0KPiA+PiBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fcGxhbmUuYyBpbmRleA0KPiA+Pg0KPiA0MTY4MThlNTRjY2Zm
Y2YzZDNhYWRhMjcyM2U5NmNlOGNjZjFkZDk3Li4zODE5ZmRkZTk4NTU3NmJkNmJhNmEwOGNlDQo+
ID4+IGI2NDYxM2JkNWUwYTY2MyAxMDA2NDQNCj4gPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9wbGFuZS5jDQo+ID4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGxhbmUuYw0KPiA+PiBA
QCAtMTkxLDcgKzE5MSwxMSBAQCBtb2RpZmllcnNfcHRyKHN0cnVjdCBkcm1fZm9ybWF0X21vZGlm
aWVyX2Jsb2INCj4gPj4gKmJsb2IpDQo+ID4+ICAgCXJldHVybiAoc3RydWN0IGRybV9mb3JtYXRf
bW9kaWZpZXIgKikoKChjaGFyICopYmxvYikgKyBibG9iLQ0KPiA+Pj4gbW9kaWZpZXJzX29mZnNl
dCk7ICB9DQo+ID4+IC1zdGF0aWMgaW50IGNyZWF0ZV9pbl9mb3JtYXRfYmxvYihzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2LCBzdHJ1Y3QNCj4gPj4gZHJtX3BsYW5lDQo+ID4+ICpwbGFuZSkNCj4gPj4g
K3N0YXRpYyBpbnQgY3JlYXRlX2luX2Zvcm1hdF9ibG9iKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYs
IHN0cnVjdA0KPiA+PiArZHJtX3BsYW5lDQo+ID4+ICpwbGFuZSwNCj4gPj4gKwkJCQkgYm9vbCAo
KmZvcm1hdF9tb2Rfc3VwcG9ydGVkKQ0KPiA+PiArCQkJCQkJKHN0cnVjdCBkcm1fcGxhbmUgKnBs
YW5lLA0KPiA+PiArCQkJCQkJIHVpbnQzMl90IGZvcm1hdCwNCj4gPj4gKwkJCQkJCSB1aW50NjRf
dCBtb2RpZmllcikpDQo+ID4+ICAgew0KPiA+PiAgIAljb25zdCBzdHJ1Y3QgZHJtX21vZGVfY29u
ZmlnICpjb25maWcgPSAmZGV2LT5tb2RlX2NvbmZpZzsNCj4gPj4gICAJc3RydWN0IGRybV9wcm9w
ZXJ0eV9ibG9iICpibG9iOw0KPiA+PiBAQCAtMjM1LDEwICsyMzksMTAgQEAgc3RhdGljIGludCBj
cmVhdGVfaW5fZm9ybWF0X2Jsb2Ioc3RydWN0DQo+ID4+IGRybV9kZXZpY2UgKmRldiwgc3RydWN0
IGRybV9wbGFuZSAqcGxhbmUNCj4gPj4gICAJbW9kID0gbW9kaWZpZXJzX3B0cihibG9iX2RhdGEp
Ow0KPiA+PiAgIAlmb3IgKGkgPSAwOyBpIDwgcGxhbmUtPm1vZGlmaWVyX2NvdW50OyBpKyspIHsN
Cj4gPj4gICAJCWZvciAoaiA9IDA7IGogPCBwbGFuZS0+Zm9ybWF0X2NvdW50OyBqKyspIHsNCj4g
Pj4gLQkJCWlmICghcGxhbmUtPmZ1bmNzLT5mb3JtYXRfbW9kX3N1cHBvcnRlZCB8fA0KPiA+PiAt
CQkJICAgIHBsYW5lLT5mdW5jcy0+Zm9ybWF0X21vZF9zdXBwb3J0ZWQocGxhbmUsDQo+ID4+IC0J
CQkJCQkJICAgICAgIHBsYW5lLQ0KPiA+Pj4gZm9ybWF0X3R5cGVzW2pdLA0KPiA+PiAtCQkJCQkJ
CSAgICAgICBwbGFuZS0NCj4gPj4+IG1vZGlmaWVyc1tpXSkpIHsNCj4gPj4gKwkJCWlmICghZm9y
bWF0X21vZF9zdXBwb3J0ZWQgfHwNCj4gPj4gZm9ybWF0X21vZF9zdXBwb3J0ZWQNCj4gPj4gKwkJ
CQkJCQkocGxhbmUsDQo+ID4+ICsJCQkJCQkJIHBsYW5lLQ0KPiA+Pj4gZm9ybWF0X3R5cGVzW2pd
LA0KPiA+PiArCQkJCQkJCSBwbGFuZS0+bW9kaWZpZXJzW2ldKSkNCj4gPj4gew0KPiA+PiAgIAkJ
CQltb2QtPmZvcm1hdHMgfD0gMVVMTCA8PCBqOw0KPiA+PiAgIAkJCX0NCj4gPj4gICAJCX0NCj4g
Pj4gQEAgLTI0OSwxMCArMjUzLDcgQEAgc3RhdGljIGludCBjcmVhdGVfaW5fZm9ybWF0X2Jsb2Io
c3RydWN0DQo+ID4+IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGRybV9wbGFuZSAqcGxhbmUNCj4g
Pj4gICAJCW1vZCsrOw0KPiA+PiAgIAl9DQo+ID4+DQo+ID4+IC0JZHJtX29iamVjdF9hdHRhY2hf
cHJvcGVydHkoJnBsYW5lLT5iYXNlLCBjb25maWctDQo+ID4+PiBtb2RpZmllcnNfcHJvcGVydHks
DQo+ID4+IC0JCQkJICAgYmxvYi0+YmFzZS5pZCk7DQo+ID4+IC0NCj4gPj4gLQlyZXR1cm4gMDsN
Cj4gPj4gKwlyZXR1cm4gYmxvYi0+YmFzZS5pZDsNCj4gPiBJIHRoaW5rIHdlIGNhbiByZXR1cm4g
dGhlIGJsb2IgaW5zdGVhZCBvZiB0aGUgaWQsIG1vcmUgb24gdGhpcyBsYXRlci4NCj4gRG8geW91
IG1lYW4gcG9pbnRlciB0byB0aGUgYmxvYi4gVGhhdCBjYW4gYWxzbyBiZSBkb25lLg0KPiBCdXQg
YW55IGFkdmFudGFnZSBvZiBkb2luZyBzbywgYmVjYXVzZSBmcm9tIGJsb2JfaWQgd2UgY2FuIGdl
dCB0aGUgYmxvYi4NCg0KRm9yZ290IHRvIG1vZGlmeSB0aGlzIGNvbW1lbnQuIFRoaXMgd2FzIGJl
Zm9yZSBJIGZvdW5kIG91dCBhIHZhbGlkICBibG9iIGlkIGlzIGFsd2F5cyBncmVhdGVyIHRoYW4g
MC4NCg0KU28geW91IGNhbiBnbyBhaGVhZCB3aXRoIHVzaW5nIHRoZSBjaGVjayBvZiA+MCBhcyBk
aXNjdXNzZWQgYmVsb3cuDQoNClJlZ2FyZHMNCg0KQ2hhaXRhbnlhDQoNCg0KPiA+DQo+ID4+ICAg
fQ0KPiA+Pg0KPiA+PiAgIC8qKg0KPiA+PiBAQCAtMzY5LDYgKzM3MCw3IEBAIHN0YXRpYyBpbnQg
X19kcm1fdW5pdmVyc2FsX3BsYW5lX2luaXQoc3RydWN0DQo+ID4+IGRybV9kZXZpY2UgKmRldiwN
Cj4gPj4gICAJfTsNCj4gPj4gICAJdW5zaWduZWQgaW50IGZvcm1hdF9tb2RpZmllcl9jb3VudCA9
IDA7DQo+ID4+ICAgCWludCByZXQ7DQo+ID4+ICsJaW50IGJsb2JfaWQ7DQo+ID4+DQo+ID4+ICAg
CS8qIHBsYW5lIGluZGV4IGlzIHVzZWQgd2l0aCAzMmJpdCBiaXRtYXNrcyAqLw0KPiA+PiAgIAlp
ZiAoV0FSTl9PTihjb25maWctPm51bV90b3RhbF9wbGFuZSA+PSAzMikpIEBAIC00NzUsOCArNDc3
LDI0DQo+IEBADQo+ID4+IHN0YXRpYyBpbnQgX19kcm1fdW5pdmVyc2FsX3BsYW5lX2luaXQoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiwNCj4gPj4gICAJCWRybV9wbGFuZV9jcmVhdGVfaG90c3BvdF9w
cm9wZXJ0aWVzKHBsYW5lKTsNCj4gPj4gICAJfQ0KPiA+Pg0KPiA+PiAtCWlmIChmb3JtYXRfbW9k
aWZpZXJfY291bnQpDQo+ID4+IC0JCWNyZWF0ZV9pbl9mb3JtYXRfYmxvYihkZXYsIHBsYW5lKTsN
Cj4gPj4gKwlpZiAoZm9ybWF0X21vZGlmaWVyX2NvdW50KSB7DQo+ID4+ICsJCWJsb2JfaWQgPSBj
cmVhdGVfaW5fZm9ybWF0X2Jsb2IoZGV2LCBwbGFuZSwNCj4gPj4gKwkJCQkJCXBsYW5lLT5mdW5j
cy0NCj4gPj4+IGZvcm1hdF9tb2Rfc3VwcG9ydGVkKTsNCj4gPj4gKwkJaWYgKGJsb2JfaWQpDQo+
ID4gVGhlIGZ1bmN0aW9uIGNyZWF0ZV9pbl9mb3JtYXRfYmxvYigpIGNhbiByZXR1cm4gbmVnYXRp
dmUgdmFsdWUuIFRoaXMgY2hlY2sNCj4gZG9lcyBub3Qgd29yayBpZiB0aGF0IGlzIHRoZSBjYXNl
Lg0KPiANCj4gY29ycmVjdGVkIQ0KPiANCj4gVGhhbmtzIGFuZCBSZWdhcmRzLA0KPiBBcnVuIFIg
TXVydGh5DQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gDQo+ID4+IDAgY2FuIGJlIHVzZWQgYXMg
dGhlIGJsb2IgaWQncyBzdGFydCByYW5nZSBpcyBmcm9tIDEgdG8gSU5UX01BWA0KPiA+IFJlZ2Fy
ZHMNCj4gPg0KPiA+IENoYWl0YW55YQ0KPiA+DQo+ID4+ICsJCQlkcm1fb2JqZWN0X2F0dGFjaF9w
cm9wZXJ0eSgmcGxhbmUtPmJhc2UsDQo+ID4+ICsJCQkJCQkgICBjb25maWctPm1vZGlmaWVyc19w
cm9wZXJ0eSwNCj4gPj4gKwkJCQkJCSAgIGJsb2JfaWQpOw0KPiA+PiArCX0NCj4gPj4gKw0KPiA+
PiArCWlmIChwbGFuZS0+ZnVuY3MtPmZvcm1hdF9tb2Rfc3VwcG9ydGVkX2FzeW5jKSB7DQo+ID4+
ICsJCWJsb2JfaWQgPSBjcmVhdGVfaW5fZm9ybWF0X2Jsb2IoZGV2LCBwbGFuZSwNCj4gPj4gKwkJ
CQkJCXBsYW5lLT5mdW5jcy0NCj4gPj4+IGZvcm1hdF9tb2Rfc3VwcG9ydGVkX2FzeW5jKTsNCj4g
Pj4gKwkJaWYgKGJsb2JfaWQpDQo+ID4+ICsJCQlkcm1fb2JqZWN0X2F0dGFjaF9wcm9wZXJ0eSgm
cGxhbmUtPmJhc2UsDQo+ID4+ICsJCQkJCQkgICBjb25maWctDQo+ID4+PiBhc3luY19tb2RpZmll
cnNfcHJvcGVydHksDQo+ID4+ICsJCQkJCQkgICBibG9iX2lkKTsNCj4gPj4gKwl9DQo+ID4+ICsN
Cj4gPj4NCj4gPj4gICAJcmV0dXJuIDA7DQo+ID4+ICAgfQ0KPiA+Pg0KPiA+PiAtLQ0KPiA+PiAy
LjI1LjENCg==
