Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 186ABC55941
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 04:44:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4421310E1E5;
	Thu, 13 Nov 2025 03:44:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DCYGn2MT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C8F10E1E2;
 Thu, 13 Nov 2025 03:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763005448; x=1794541448;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Y9HXEm5bM4ptHi2W0wvhq1kPQ4pdBS0x7QlJKx8QA0o=;
 b=DCYGn2MTun8YewvPJMJ6NzZnQNFuH52+kpLgNyftBzMY+XurSEJuOKOD
 VPPHZxJw8aUE7Cc4NhG+pzGoFyBvIkPzYkFbk5w0FyA5cFU1d1bcg8VU1
 bPugq40ckJ+FRz6qyp1qO/ZZx3ZkPli2Wqhw79exnJJTfgDPw9DCh4oIw
 XjI2rMwrkvtyApzjC14/XScmnLC5nIHdd/D++s9xOdZSoQKMihKPBlojk
 CHnpfrZdOSGuxvUZL2CoA+KZJ4KyhFj5HjRK5UEFvrH3mk+c8QoZ46dt1
 YwHQs85UcE9C7TbFRZqW2TC9IKsz8qK9I3PTh4gOSpA9Ag5qIMXYZv7/v A==;
X-CSE-ConnectionGUID: 4n61RmT/TGy8RTcgNIVTtg==
X-CSE-MsgGUID: 2yedW40HTpGhorOhLfs+Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="68944497"
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; d="scan'208";a="68944497"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 19:44:08 -0800
X-CSE-ConnectionGUID: 0qdiQWW0Ttmzglf+C47o/Q==
X-CSE-MsgGUID: Are2+gnJTsGCMszSlpUYrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; d="scan'208";a="220050372"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 19:44:07 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 19:44:07 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 19:44:07 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.14) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 19:44:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XNYicvnnW1ZpvjM5OtVvJpWYUqO+4y+rDElh1cnq8pHFqJYnnnSWvIUWAkw88oGEgna+WaGRXgnt0u9HKaK60bjufc5r7KwBgRWLeuDZ5+pPQSV144LAh7UXg8ht1FpJJ7f5L9Gsyaxzb+d35/Lmq5vIILimEfaAd3lnF7IK88GqA09/MReqxhN76hVryZlQ6X+fSyZHKPkf2+Uz3GgWr8MlbpaMbTMJUTtsiZAPhMJeULtHWJeoA8b5C4rKWeA/+3L5isnTTXopXHZyTf2nCejpriz4kzSKTmXaMc8BIQZvg9AhMmbmL+Rbp3P+hlhRrkxM7N7K+0x+uA9RZKdUKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y9HXEm5bM4ptHi2W0wvhq1kPQ4pdBS0x7QlJKx8QA0o=;
 b=et9NCz3ejxw8BaDIFCCU9MSvekYJ5zk9WKoseGxjQmGMOkOc0vkKDqBxRoCCX3mh+2J6+5LHhj5x7v8hSoWPjLtl9cCfKDF8NcjaoOno8uV6EqIN+5cC9mpHAT3q8XNKkr3WppzZ5kJL1QZA6orRhin2b7mRFRPDZrjTbTiNy0/7xSYCtGeWiglOgugU4u4TOBDU6uvxa37VBlEAUhOWVJlAL/S2XbLvyWayKnLoqs+S15Jw4cLKawInTzydQTAxrkHVVSsiYZfPHWZeyonli40ZP96NHS7IBU9MFwmJClmO/UVERZuq+uaMEP6CYHb7b0b3P+RCCVHld58jAHTTcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by CH0PR11MB5250.namprd11.prod.outlook.com (2603:10b6:610:e1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 03:43:52 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%6]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 03:43:52 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH 1/3] drm/plane: Fix create_in_format_blob() return value
Thread-Topic: [PATCH 1/3] drm/plane: Fix create_in_format_blob() return value
Thread-Index: AQHcVCxnIxLSf3/4cEey8KnbMytLQbTv9t7g
Date: Thu, 13 Nov 2025 03:43:52 +0000
Message-ID: <IA0PR11MB73077C1B5A94BADD22C1A6EABACDA@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20251112233030.24117-1-ville.syrjala@linux.intel.com>
 <20251112233030.24117-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20251112233030.24117-2-ville.syrjala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|CH0PR11MB5250:EE_
x-ms-office365-filtering-correlation-id: bda4f78c-3c07-4b50-edec-08de2266dd25
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?YnBkVUFDNGtMZXFGVXJ1MTFoMnpianE3QlVjZW5ZdVpWNmJXRmk0YjBjcXkz?=
 =?utf-8?B?RUNPMFZFMGRiUS95eHFtbmRheHpTdlRjK1lhTElldmRoTk9RcWtmdXR6WUZl?=
 =?utf-8?B?b2crbnA1UUxVbFJ6Z1h5SXJqS0ZNL24vWCtKMXZTVXB3RFdyY0VPSVhhQjA3?=
 =?utf-8?B?NHp5dnRVSUYxcjVIL0ZkQ0NKaWNSR2xmRFh6Rlk3OUp4MEU2c3NVSHlzU1ht?=
 =?utf-8?B?MDJpaVZtL1QyUkpGandGdFNFYldvdG1sWURGWGJKWENNc1RlWitzcEcwZ1BR?=
 =?utf-8?B?bDBnekhGbER3OUd2VHdkUDJmVElaOE92UVZ5aXpKMWF6V2N6ZEFCYXFiRG5k?=
 =?utf-8?B?TVVFbkI2TzRQNEpHdTZTdkFRbDJ0ZkhTSmMyaU9mQm9xSG5WRG5hc3FjNmNY?=
 =?utf-8?B?TnZuQmlVQlhLamFuNlJEZFlhc1B2ZzlZN0ZWbmpHaW9Wc1RnOXhjUmJMY3Ez?=
 =?utf-8?B?clJxdmxJelFtbHhkVUNCOE1ZU3VtbWNDL1dZazFyR2hYRlBDZ2g3T0lnaTN0?=
 =?utf-8?B?STJHWWYxUi8yeXZrcVBvRzRBTm41SVIwY2xFcENodWRlanhyUXFrU05MK2I5?=
 =?utf-8?B?MWVmUUROWHJDSjVyNnRqdVBndFhCdkdvUUk0WTJodURHb2d1NnlHNWdIeklm?=
 =?utf-8?B?ZTNJL3dBQVJ1dnExc1pLeHpQeVZDYXdkOXN3cHNiM05kVzdTZExzc1BIUnF2?=
 =?utf-8?B?cHRvWEl4d1ZTazhIZzBGTHVCTEdnLzdJdFMvS29MWUhUNTQrQkRuanBCa3FK?=
 =?utf-8?B?MXFzbjdBMENLdWxCQm1UaEtYQjZiUjIvUlVlWk5IeXNpeTN5Rzc3bTgzdk1U?=
 =?utf-8?B?S0Ewalp2cExnbFZsUVpwZExYYzRrLzBnL0F6dlFYNVRUKzZRTVh6YnA2dEJO?=
 =?utf-8?B?TU9lUE9PTStEL1NUS2VyRDZDU2tQQURSMTBVeFJjY2RvMUtSQndWWW9ndTBW?=
 =?utf-8?B?TVNKTkFITDNVOWh0Ny9zSW9RWGt0dEhyZ3d3S2FVSGFWbG5SNWRVcXZIMzkx?=
 =?utf-8?B?Zk9GLzd2cnczbDlQZjBFUmEzSzZCS2VQQkNaRWJrTlNFOHdPZndXdkt2Zldj?=
 =?utf-8?B?UVluN2RtUCtheG8yTGFoOGJjNDN1U09JVEM4M05NcUkzbTczOTRyOXU5bmhC?=
 =?utf-8?B?MkNmazRPbDZ0TjZhd0daYWpLSVpQcU5vLzE2d0pSdTMzcmg5cWZadUt6ZVVZ?=
 =?utf-8?B?cEpDaGRZNm4zM3JWNi9WT3FqUzFFZzdoQWorbE1sUTQxVTYrVFZMMktuRjJ3?=
 =?utf-8?B?cTA2dXpDNWoxL2dPcmpGcWJIRFlXQ1JXbDlXeGZqNWZtMzNEa2ZrandyOTE3?=
 =?utf-8?B?VFFjeHpvcmZ1SGZ3K09BSzV1ejdZWEVKQVRwN0xKdnB3RUNPc1NBRm1SZEVo?=
 =?utf-8?B?U0pOSjVHRUgrZnUrUVVlQkpTZUZ5Z1A3dG5rMlBJRklXeFlSdUxvYVRabUtU?=
 =?utf-8?B?ZC85Wms2TGlpcGZzWFU1c0tuY0xNM2VwSnFFNHllc0RVd2lNb1dzWjB0ZTRK?=
 =?utf-8?B?QjRucUM5aEU0b1d2a2RrNytTeFNXS0QvWUw3akkzaWlmSllRVXB5OEIxN2Zk?=
 =?utf-8?B?UVh6RHFEK2NWKzZMd2xKMGNUSGJJM3BHblFCUWRrcW1McCtGVmlFVjluU09z?=
 =?utf-8?B?Z2ZwZjJhYThRNUIvajc1ei8zMkFqVGcyYU9OaDdWUmhJdTdZYXFmNldkUFZV?=
 =?utf-8?B?OTEvUlpYcTAyRTNlWEVnNlFURnJpTnorNEwrWU1jbVlTYkJWYmpDU3ZJOUsx?=
 =?utf-8?B?Z1lVd2VoMXg2SUdxbmNrTm5BMTlCazVyU3Z3UjMvTnJSNWUvdkRTWlJRS1lm?=
 =?utf-8?B?T3FtWm42bXJQUU56blBVQ29ObHNJdmllajZyWXg0MWlMbzc4ZHk5VzhYWHgx?=
 =?utf-8?B?TVRVUjUxQTNveUNrOGpyNGhxRnNrTW9rcGpVS0k0Znp6SFZGSDI4WnBGNFpr?=
 =?utf-8?B?UTdQNFdzUm91THEyM1o0KzlsQ1MvVDBzTkxyUEducVpSa2NhYmhLc1Q4R056?=
 =?utf-8?B?Q3lqYmFQTTl4VlJyZmFRZ21SQmR3cEp4eGVqWU16VUwvWnJCdm5la0x3T2F2?=
 =?utf-8?Q?v0lraJ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TXJyU3FWMm1FMDhnTWZGdVdpUjRIVFBDdWp1VUtYSzR3RVl2dXBhbGV0eUlL?=
 =?utf-8?B?TStGR1VFYURDUkhtcWdaUVcxVEtwYS9kckRmTmI3aXlnbXJwVTJCYmhlSHJj?=
 =?utf-8?B?K24vVkpMUlRVQzY4Z0JVanVZdlZHSTdBTStxVmFZWjN3eHJqQjE3aFMxUnZU?=
 =?utf-8?B?aXkycGx1WWVXRVVBNWMwbnNJZVBxOW5NUk5hQmhjMVRpZmtzVXJxQXhqSjBN?=
 =?utf-8?B?ZzdCZTZmRkJRNTh1SXVFeFNRZHludXJ3dkNmbVVGMzdPeWZuNXdsZEljcmIv?=
 =?utf-8?B?bXkzTFAxUFVvbU12a1lsRFZuNVdrWUUxOHNsd0lRTy9RSkk4VHhveFBJWGl4?=
 =?utf-8?B?V095aDkvWUpkRXZJd1kycEU0dXJ2d2pXZG5oY0hLeWo4ZUVJYjE5WTlCU0Jq?=
 =?utf-8?B?cyszeGhQU2FFMlNPcEVFT1F4aUJ5R2ErNW5ZM0RYbU5NNFBRU0pFSDJjeUI5?=
 =?utf-8?B?amVkY3I1Mk5nWUk1Z0xRSkJGVTh0VXFKRjlkcUZmOVhyTm84OEdoSUJVZ1pl?=
 =?utf-8?B?bDBkaW4zc1hOZ3ErWHJtSWZuSkJwRnUrVmx1TTI3YTlkTzhFWmlaYjlWWnRz?=
 =?utf-8?B?bXN5UHVMb3Z1MHNicloyanpCWGtUbmh4eFJpM2RoU255TmVwLzJKcTFSSXY2?=
 =?utf-8?B?Z3NQQ3IrU2RmQnE5bEJOOHJOT3NPQXhRNU02eWgxTjlvMHBwM0w0b01ySDlp?=
 =?utf-8?B?eXRZc2dJOStnN1JEUHJmeU9uOEN3QnVFRmxYUWVvVTJTTnk1YnhwSUhxc013?=
 =?utf-8?B?VVNtQ3AzV0N0Tms5aHBYOEhrdlZWT0tJckNhZEVReWxaLytLdjY1dFlvWHU1?=
 =?utf-8?B?MWJ2UGR0SXpFOXlJYmRTOEg1SlJFUS9sektGaHFTMWtnL0NOdjltOEtyZ0dh?=
 =?utf-8?B?M1VKZ0RzcGpJaGxYazhjbjZSU0p3S3VxUlNORkRPMW44dlQ0R2J3NUxFUDZz?=
 =?utf-8?B?Z1ZtNlN4Vks1R3NQWkZMYmVhSlhmZHBFRUthSXNOMjhiWGhyVU5lcFFBMlRp?=
 =?utf-8?B?WUtTV1BXakVXa0pmZGRYYmpuV2VUZmR0dXR1aGFFWUdUTDgzMENyMGxQcnZa?=
 =?utf-8?B?Vk1GQTNKWlA1TWlCRGlwOXpxVkJEUWROUEplUU1zT29Jc1dxRDVEMWZMQlFv?=
 =?utf-8?B?UmlublRCYjF1bG1CbnI1MlloQTZDZUp2c0tDQ0REaDNyREk3UEM2V1pNaDBH?=
 =?utf-8?B?RUdvS2xsZmQ4SUsyNWFKeTlJbEpYVy9vMkFHR1l1eHB4YkVZMWFKMjFBaVJv?=
 =?utf-8?B?RWk4MGRwR0hPam5lMFFrQnoreTF5NXVsbXgxeXRib2tpcWVlQlcwWkdFdUU1?=
 =?utf-8?B?S1JoemFHQytUR2M2Uks0MmNCNE8vWEpLRyt0eitsZVZqcUY0Tyt4SHYzcVhu?=
 =?utf-8?B?MkdxTmh2YUh6eGJuN3I3djYycVI0Y0M0Z2JoMlhaL0xSb3VRVkY2dlh6SFRh?=
 =?utf-8?B?a0dZUllUL0hpZ0FnY0RLSFZJcWV6NGFRQ1FkbWZtS1dBTTJSTURUS2tpVmUw?=
 =?utf-8?B?L0ZzM0YvbUMyQjVXU05mSkF3MkdwNHdrbUU1d0Y1Q055SjQ0bmpYOE50Q1dn?=
 =?utf-8?B?NWJ1cDcva0M0MHdEcktraGVRZVRkenRZbU1GUkc0QUFmZU5NSEVmeUZOUEd1?=
 =?utf-8?B?cmkvS2FnL3JISDZIV0xhVks0cEczNkV1Q1IzbC9JcWVrb0xNNHVFdGJUYVU4?=
 =?utf-8?B?NnExd1h3NHVCU2FnV2ZTRmtjVWJENTUvWEMyWnU2enJpU0c5ZmxuUHVxSlZp?=
 =?utf-8?B?QTdpZXloSC8yRGpQNHlIYkF3TERoVm9hR2RhSEVEQTBIdHRtZld3U0xyMVhs?=
 =?utf-8?B?d0xXai9PZlR2VCtEUWM0OHhJZjI4QlNSQzFWVXZLOHBOdG9naCtNNm8rdnEw?=
 =?utf-8?B?YjRoMGI3VG5OY1A1QTRnMkZMTStmYTBIdW1iVXFDTW1IUE05eURlVHI4Sk5B?=
 =?utf-8?B?cWorMEJFcS9qMFpLRHYvdDVUZHZveDdGQ0hzdnl4eWJTOTRIK2tJa20wb3V3?=
 =?utf-8?B?NmRBZ2orRFF1UmdwYXB4SjFRME5kOTdaQSttb3R1MDY2dnFUeDFFaFpKVFpv?=
 =?utf-8?B?cEZ2MFhKcm1VU3ZabEFFSkMvdnRaVGF5aXo3VlFsN2VoT2NoOW5YU1VMUURs?=
 =?utf-8?Q?HTDS42uMEH7sJWQx5cONalep+?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bda4f78c-3c07-4b50-edec-08de2266dd25
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2025 03:43:52.5414 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fq39EQ/tLmuVFmauw3ljnit7amQG4X+XCilQylJq8qmLepOamqVv2pVinFJxrAM7aVKAKM9RDd1EP9oTAh/boA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5250
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

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFZpbGxlIFN5cmphbGEgPHZp
bGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgTm92ZW1iZXIg
MTMsIDIwMjUgNTowMCBBTQ0KPiBUbzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0K
PiBDYzogaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwteGVAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnOw0KPiBzdGFibGVAdmdlci5rZXJuZWwub3JnOyBNdXJ0aHksIEFydW4gUiA8
YXJ1bi5yLm11cnRoeUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCAxLzNdIGRybS9wbGFu
ZTogRml4IGNyZWF0ZV9pbl9mb3JtYXRfYmxvYigpIHJldHVybiB2YWx1ZQ0KPiANCj4gRnJvbTog
VmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4NCj4gDQo+IGNy
ZWF0ZV9pbl9mb3JtYXRfYmxvYigpIGlzIGVpdGhlciBzdXBwb3NlZCB0byByZXR1cm4gYSB2YWxp
ZCBwb2ludGVyIG9yIGFuIGVycm9yLA0KPiBidXQgbmV2ZXIgTlVMTC4gVGhlIGNhbGxlciB3aWxs
IGRlcmVmZXJlbmNlIHRoZSBibG9iIHdoZW4gaXQgaXMgbm90IGFuIGVycm9yLCBhbmQNCj4gdGh1
cyB3aWxsIG9vcHMgaWYgTlVMTCByZXR1cm5lZC4gUmV0dXJuIHByb3BlciBlcnJvciB2YWx1ZXMg
aW4gdGhlIGZhaWx1cmUgY2FzZXMuDQo+IA0KPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZw0K
PiBDYzogQXJ1biBSIE11cnRoeSA8YXJ1bi5yLm11cnRoeUBpbnRlbC5jb20+DQo+IEZpeGVzOiAw
ZDZkY2Q3NDFjMjYgKCJkcm0vcGxhbmU6IG1vZGlmeSBjcmVhdGVfaW5fZm9ybWF0cyB0byBhY29t
bW9kYXRlDQo+IGFzeW5jIikNCj4gU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxs
ZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4NCj4gLS0tDQpSZXZpZXdlZC1ieTogQXJ1biBSIE11
cnRoeSA8YXJ1bi5yLm11cnRoeUBpbnRlbC5jb20+DQoNClRoYW5rcyBhbmQgUmVnYXJkcywNCkFy
dW4gUiBNdXJ0aHkNCi0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJt
X3BsYW5lLmMgfCA0ICsrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9wbGFu
ZS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wbGFuZS5jIGluZGV4DQo+IDM4ZjgyMzkxYmZkYS4u
YTMwNDkzZWQ5NzE1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wbGFuZS5jDQo+IEBAIC0yMTAsNyArMjEwLDcg
QEAgc3RhdGljIHN0cnVjdCBkcm1fcHJvcGVydHlfYmxvYg0KPiAqY3JlYXRlX2luX2Zvcm1hdF9i
bG9iKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+ICAJZm9ybWF0c19zaXplID0gc2l6ZW9mKF9f
dTMyKSAqIHBsYW5lLT5mb3JtYXRfY291bnQ7DQo+ICAJaWYgKFdBUk5fT04oIWZvcm1hdHNfc2l6
ZSkpIHsNCj4gIAkJLyogMCBmb3JtYXRzIGFyZSBuZXZlciBleHBlY3RlZCAqLw0KPiAtCQlyZXR1
cm4gMDsNCj4gKwkJcmV0dXJuIEVSUl9QVFIoLUVJTlZBTCk7DQo+ICAJfQ0KPiANCj4gIAltb2Rp
ZmllcnNfc2l6ZSA9DQo+IEBAIC0yMjYsNyArMjI2LDcgQEAgc3RhdGljIHN0cnVjdCBkcm1fcHJv
cGVydHlfYmxvYg0KPiAqY3JlYXRlX2luX2Zvcm1hdF9ibG9iKHN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYsDQo+IA0KPiAgCWJsb2IgPSBkcm1fcHJvcGVydHlfY3JlYXRlX2Jsb2IoZGV2LCBibG9iX3Np
emUsIE5VTEwpOw0KPiAgCWlmIChJU19FUlIoYmxvYikpDQo+IC0JCXJldHVybiBOVUxMOw0KPiAr
CQlyZXR1cm4gYmxvYjsNCj4gDQo+ICAJYmxvYl9kYXRhID0gYmxvYi0+ZGF0YTsNCj4gIAlibG9i
X2RhdGEtPnZlcnNpb24gPSBGT1JNQVRfQkxPQl9DVVJSRU5UOw0KPiAtLQ0KPiAyLjQ5LjENCg0K
