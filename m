Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC25C269F9
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 19:40:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21CF210E304;
	Fri, 31 Oct 2025 18:40:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H2A33q1s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69BCE10E0C7;
 Fri, 31 Oct 2025 18:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761936009; x=1793472009;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rtRbIxnGmVh8mk4d+0CTo/bvWUa+/6FO13/6BWTtimM=;
 b=H2A33q1sJ8RPdcmpkedcG5p1d048E7BFbBGVtw7zguk1vVM4tlX7uX98
 WKnSl5et9dcFlOVtvrnPka/D20lIgvwWYg884cbn6k+Pzh6klUAmVBjWv
 EpNTckVzKGKYmac3G1H2ZjzNiBql1cGJo5qfb5NcN8YpapEhhNNA+RvxW
 oEKQY0snzpljTIrzn0IyU//6x5djQHyO1rBsBclNdPkTlUeQuR5n2aekd
 M/wyA7cIJCTrBQwy0SqCBfRDsGSpO2kN8sfaDsQeLgtVOFSPQ7qqVz9fz
 u2gdeleRCruTQj+l8xvYymafvtb1u5PwY2AJ3wf/NzKJQCkb5ztUHqGQM Q==;
X-CSE-ConnectionGUID: ZBsATsD5SJqkXbichLos3g==
X-CSE-MsgGUID: slPhFXRtQmqFY+g79WDMUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="63991148"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="63991148"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:40:09 -0700
X-CSE-ConnectionGUID: 7V3kBwleQ5uxjNK2atnvXw==
X-CSE-MsgGUID: icZ+ejZCS0uze+XjBgxWeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="185968436"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:40:09 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 11:40:08 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 31 Oct 2025 11:40:08 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.35) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 11:40:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K/+iCQ9WAXi3LqUqQybeZyBYCUr3xbzNjKFpMvw8AYbPiZjjIFJ1qqsCOhjm2MYGjYYF2ERxvz3Zo3tYGlo6mVTh4XJ/rAZgbv6yh1IinFYpgaUm8tpjaFwT53MzziGSPwz8MkUn0JRjMgabuRqr8eYYFXftYwkx7GLQGTqSdPMxyfrlXCu8/b2Usrx2LOwpQCp3y2v1wv1aI+mT3tBO7wEkiKRx9nOOFmGRKz3YJTogODL/TSXMWKCwU+VBdr53SyHzP0Oq+D1/9tV4oRfFcvNS+9LpQcOmwX1c6AI+6urNRec7eVmpUeeVzaJDc9GGsYzjxf/ITjpHMIVvDaPFYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iSUy6F6LKEgTAMQsnmiG/RihKDvjCaelGrwrBTYUthk=;
 b=gozk6rdrpn7EckTU4D2BeUXkY19cWt9uOniSws0QlFdhFmOPVvUJ3DP2dl9yj9AS3ev3x9zSC/JqKRqhM32NtqbzQ3WW2iiRcpHO8GhIVQIXJpcDnM1JxU6mMEHynfNGE+JXx0QFV0gOGJJCvJxEilCB0wV+nmJ73q3It6TDuVE+6Pjkk96JaDeAiZRNNrJ8X+/Cg0KuZQMpgfOI1giPQqCjkigXJwH78oeYgXTZE5tM9Eum0pGBXDYRn9kUpyhe4/R21shWCLURL3tJLgmSl1K96cweQ++wK0HAmLOMn+s0DMcM+KeV/dafsjVQvuVe2lZ+k0NuzcWiCohqp2Pb8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH7PR11MB6906.namprd11.prod.outlook.com (2603:10b6:510:202::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Fri, 31 Oct
 2025 18:40:05 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 18:40:05 +0000
Message-ID: <63446059-7af2-45b8-906b-4ba0688ed0d4@intel.com>
Date: Fri, 31 Oct 2025 19:39:58 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 19/28] drm/xe/pf: Handle MMIO migration data as part of
 PF control
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, "Alex
 Williamson" <alex@shazbot.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Rodrigo Vivi" <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yishai Hadas <yishaih@nvidia.com>, Kevin Tian <kevin.tian@intel.com>, Shameer
 Kolothum <skolothumtho@nvidia.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>
References: <20251030203135.337696-1-michal.winiarski@intel.com>
 <20251030203135.337696-20-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251030203135.337696-20-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0400.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:80::13) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH7PR11MB6906:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eceb009-7c0f-46e3-823c-08de18ace8b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YnBmajUrWlZvZ2lqdTZXTkpSb3o0RnViOTJIR0Urc2x5S0lZN0Z5UFFQTGpy?=
 =?utf-8?B?bFAwb21YY3B6WFBqZ1lqUkY5SzFZUWZwMm9HVjF4Q1F3QXIxNndYT0VGaDFW?=
 =?utf-8?B?dXdrdW5qZnV1eHdjaHhZWGpCTEhVWVk3bkFxTGdFWW95bUZMU1dSYWIxK2ZJ?=
 =?utf-8?B?SDhJbjhQTUFvVTlzd0ZWOWtMcmt4V3R1MnVvdnYvaEl0Sm1tQWZidVBRVFND?=
 =?utf-8?B?MytuYVBIcHZqTDF3MExMRUdidXEvakRwQlBiUmtUd3QwWkZwWXFIUnQ5YTNF?=
 =?utf-8?B?M2hJcUtOZ2hUVUxmUnlwc3A5Z0ZEUFRha2RrbllRcGVwdFIvTVdpbE82Qjgy?=
 =?utf-8?B?SjBITm1nQ1NJdVAxODFKRDZQelZlMzBXdUZUV3lIVDJHeG0vODUyZzBrbnBn?=
 =?utf-8?B?SkZwSmtVbTJCMk82UEozZWJaQ0wxMlhQbkwrVUVpSTVzWjZMYlpmd2JIVDJR?=
 =?utf-8?B?V3VXbFFuNWYrQmdhcVRIcXBXcW5nUW1Yc1Z2c3p0QnV4YS9weExnTjU0SFhO?=
 =?utf-8?B?azE0c2EzdjdxbWJ0c21PU1RyR3dlVElVMzVOTEM2SUQ2N3FLNnJ5VFdBdFJi?=
 =?utf-8?B?NHhadDloaGdhOG0vKzVQRVArYlpMSU1LUGJWeHJzdzJ3QkdyVXNKMTI2ajk0?=
 =?utf-8?B?SUhhdEZWS2lwY2NPRFdVV1RVODdCTXM1TlBJcGtjMW9iY1REdTZ5MnpnaWhY?=
 =?utf-8?B?R0FhM1hrUmNBZTJEWnBGU3VONGNZbnJ5UE0vakRzQlRZY3A0NE1oejNiOG4z?=
 =?utf-8?B?TXA5WmZTY2Zpa1ZQOXdwdG9nOTE5cUNlWFBaQWNEVlU0SWVwdnV2QklFRC9O?=
 =?utf-8?B?R1ZwYS9aMkJXQUhUMDd1UnR2UGQyRTBzdUdGSCtBME5TaUJVb3VGUXBJZ1Jw?=
 =?utf-8?B?Mi94Vkc3U1FERmVSbWdISVhEL3dNM21sQUdPMmFRZnhLUmZqdWVWZjJFeXZB?=
 =?utf-8?B?N3libkgzSStNMGJGUWFLdUh3R1VRb3lzbWE4dW5MRG5iZHJsc2hjTS9rckZu?=
 =?utf-8?B?eUl4U0JnMUR0RUg1QUlwejJSSlhERWRmOG1abnRMOGJEckdMb2psZnBRM0JQ?=
 =?utf-8?B?VVhQY2k5bFRZSTRzVWtFdkhGVHBNZ2gyd1lIUllETFczMURIOFJZSEJyTC9p?=
 =?utf-8?B?T2J1RSs5MTFwYk1haUVkS1NwcG5pMlErSWpDVFloc1JQNndDQUdYNXdIY05S?=
 =?utf-8?B?bkQwdXd5SlB2cmorTFhPNEFOa2YwZCtEekpZUFNCRitINldIMFcrZXg0aVJU?=
 =?utf-8?B?NXdid25PZXZxSUdjcUZOR1JkSk0rSWxrRzRyYldWUk5VbnFyMWdhaFc0elk1?=
 =?utf-8?B?T1g3a00wL2tTQno4R3dNbllkNDlSV3lwVE9ra0dLMkd3LzdIMkpLSWlWMHl4?=
 =?utf-8?B?VG1vKzVVRWRubWNOcGxucXZvVmhpQWNaNHBXZ3ZvblhKWk0wbmFDMjE1Wita?=
 =?utf-8?B?RTRjUWp6aCs2amJLU3R6WXhwYXU5RUVsVDJ2emduVW51NTVubGVwWk9IZHcy?=
 =?utf-8?B?SWVoSy9JLzl1anB0VWY3N0d5Vm90Y012SGkyb2VvUWVZUERheXM2SnE0eTM5?=
 =?utf-8?B?emRiRTJyaGlJQ2F3VWswZU5LczRSQU1CSVRBaEF3SDJuMy9qcnI4bkNQc0hM?=
 =?utf-8?B?VzFsajJtQ21ndGZjYnovTFN2d3JQUWpKRnpudTYwdHE2WXk3YnhWYzhyZE9K?=
 =?utf-8?B?WVBOdkpNNEdRbGxaUTZUYklQekJXR3JYaEpubVpNSlFBUmtOL041R2xBTUxX?=
 =?utf-8?B?dVROb2hQVHo0OFc2bG95SUtrNWc1SGhpUG5zYnRIaGlVZmhTUkUxdUFVWWc0?=
 =?utf-8?B?S0gyUVZFb3d6aGtOWHVxOHZHU08zY2VsaUFRcWc5K3U0V1NWUnR1SzZmbDNN?=
 =?utf-8?B?ZVRmNitraHJsTmNaRHU0Y2UvZTJXZ2w5QSs5Z3dyMGtRNENRTmwyaFFGMWR3?=
 =?utf-8?B?cHNFSTJ5QXJDTDM5UVlmakdGWFpScXVLTk1sQjM5blE0elVIWjd4SVJKY0th?=
 =?utf-8?Q?UvO3ARghz41x27LZ/zn451xXKJBcbU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzFDL1MyOCt4U0NzQ05vQVkxTHZpbHVrUDdpbXFNTExWazFSWHZmOEx5N3Mv?=
 =?utf-8?B?T2IzRmpDOWYwVjNHdlk1ZUU4aS9YQXBHOEVlU2I4M04wU0VaWEFkcUVTWjV4?=
 =?utf-8?B?WmhLZUxmdm1vQ2I0MHd2TEFaL1A3VU5JSmtiaUlCcTlodFN3SjZZT1h1ZmY0?=
 =?utf-8?B?NFl3TWtvV2RCNWtWTzlSVy92S3IxYXNkZUhtVWMzWDhOY1Qzd0NiTThFQXVw?=
 =?utf-8?B?cjVDdStzZWQraC9BeFYycm5PMkhsWlZFanJnd2hGL3hVWm1ucjZack1XYXZu?=
 =?utf-8?B?QWNxUkRZSHZ0dmlDS2hxTUZvazJqelRpYjUrUHBFRG84ZU51RTRDZXBQeTVv?=
 =?utf-8?B?a0FaUy9EVnhzNVIvZzZNTUVEbFR6cHl0NFU0RXVMR0Mya3FKeTRnc1hZL0p1?=
 =?utf-8?B?MW9GcHhtUWx1d2tjVlRKMVA0eXFhK3ZqYmlLNVJRMHpRa1JiaHF4bmpoaVhN?=
 =?utf-8?B?QzNqK3F1QkdsV3JBZ2pUYURkVGN3WUM5WmFmZjFaQXVYeWpSTjNYc3d4WVcv?=
 =?utf-8?B?TlpXTmd5ajhRb3hCL2tBUzNKMkE5WDhXUDBreFp2bmF3enFtT3Z6T0VjL3VI?=
 =?utf-8?B?VUZuRlVHazdOMitTbnNYU3BSTU8zYWp3TnE3ZVpsbVZtRVRrQ0kyR1pjNndr?=
 =?utf-8?B?VG1XQ0NheWQxYllXYzJjMDZCVk5ydHlEZzlCUi9NdUthS3JDNzRLOTBUN3M5?=
 =?utf-8?B?VndmbHNhemtrRU5kVGhDVnN0bG80S0VTV0RYU3kvTE5jeDZHUFloM3hIc2ty?=
 =?utf-8?B?VzNzZW1NWXJ3enJyaG9mOVBralRDa1dHOXpmZk1LKzg0eEpPSHQrMHoyMmFv?=
 =?utf-8?B?Wko4TDhTYWxNTWhHTkY4eXdibzVCK1F0Ukdtck9ZQjQ4Y29NNCs5MytOVUdJ?=
 =?utf-8?B?bHZwWHdndnJEcDZ4NFptV25lOEpGaWJJNTZLUWlqQWlvZUFPSDFobndQWkpq?=
 =?utf-8?B?UlNKOHNia3RIZDJlMW9iY1MrN1JVeTNtc0VLRkcxd01Rc0FoWi85S25sejU0?=
 =?utf-8?B?cFMydGhJUlhUNXpHeXM4U3JWSFFtTmNTc1VnVmJIcEIxb0htaEpaTjQ2Ukwz?=
 =?utf-8?B?c2lBQmFUelFpTmhONloyNXQ1RXBiMVZFZVFFcnJvWTAwRGFpdlNTQjRabjdD?=
 =?utf-8?B?RXMrVi9iVXUyOEdyWVZLSjFWbHo4bS9hMDkraWU4Q3VoeUNlcGNHWnY4aWFB?=
 =?utf-8?B?a1hJS2JZdFJEWk5wTjUzZUJjdVNXRkwxK1NTajZUNmg0Z3N0d0xpVVNRL0hQ?=
 =?utf-8?B?MFFTZk1rUytacnR4azEwcCtoa1g5ZGt3WEtVd2gyZDlBWTV6Q21QenZmQVAw?=
 =?utf-8?B?NTV2TVJQcmY1bHhXb3NadWhuUWJJWkU1a1ZrTlFWbElYRzMreEVmYmVnM1VE?=
 =?utf-8?B?NUEzaWZQLzRLY0RIUC94UWZoRHpyUEhPNjQralN4d1FiaGxFQXdtVUhKRVFl?=
 =?utf-8?B?dnRnL3MxNjBwOHNGMmNtOG1vQU1naGtWdHNXS0ZyVURwdXIvc3J4S2hCOTRj?=
 =?utf-8?B?UWt0RGl2SkpWam1MWTFZcVVEd3poa3lqQVh1aHY5bVMxMlUyMExjMHJMKytJ?=
 =?utf-8?B?MGVoQ3l3ZjdsbUxaTnhlcXlxd2x6WnZmWVhqN3dmQWtTQ1FQLytyc1IwNFpn?=
 =?utf-8?B?UEJRK3I4NUxWUmlTSUdDeGo5bjdaNHJiWEtKMmp5TG5NOE95aG0rWUdQQUJR?=
 =?utf-8?B?RTIrc0RhYWR2WEtobGpqN1FKUUtGdXJQeTBSSi9rZ2wrdDZxcmsyNVBtZTZz?=
 =?utf-8?B?bE9pOC9UNzJRcC9nRUZnaGhEUDEwTXFMN3RMWVJiSzBsSW83YUZIUTVpU1Z4?=
 =?utf-8?B?aGhCditnaEVkOWpOd3d1TkhsL0RRM253WlU0Mis5YzNiNDVTNHA3NVRQS1Z0?=
 =?utf-8?B?Q3ppM2pwRWYyRlRhZUYrY1d3NUdIWU9qS1JXdXNmZUZDdTQ3cktkVVhmUVky?=
 =?utf-8?B?SFh5Mityb0YrekJ5TXdEWndnSVN5VXFpR0oxWEdRUFhrTWFEUHlpbDQ5NWJ3?=
 =?utf-8?B?cGdGT0RodUVUNk5JVHZKN3V1OTNuVVhwOVJTRVBuaE5meFVQSTltTk5wdGpZ?=
 =?utf-8?B?R3k0K2EyNGE2QVY2aytSOFJOV1BTUTVYRXprYWVGVXZUNFplT25mb0RPZVU4?=
 =?utf-8?B?OGxyVDJ3Qlpyay9maHhySm16ODZnKzlWVXB6S3BoQVNrWjNPYjJHUXJGQmVr?=
 =?utf-8?B?U2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eceb009-7c0f-46e3-823c-08de18ace8b2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 18:40:05.3045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HX3Yevqi8XT6S620jPDiPV71s0Gsz25IQfWmy+bOzAtCQvqo7k8szjmxq3fHTOUMiP7UQIf2Fhf3jzyBSRxec4nB2EWGaIL0/jaoHqFThw8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6906
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



On 10/30/2025 9:31 PM, Michał Winiarski wrote:
> Implement the helpers and use them for save and restore of MMIO
> migration data in stop_copy / resume device state.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf.h           |   2 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |  13 ++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 158 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |   3 +
>  4 files changed, 176 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
> index e7fde3f9937af..c0dcbb1054e4d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
> @@ -6,6 +6,8 @@
>  #ifndef _XE_GT_SRIOV_PF_H_
>  #define _XE_GT_SRIOV_PF_H_
>  
> +#include <linux/types.h>

?

> +
>  struct xe_gt;
>  
>  #ifdef CONFIG_PCI_IOV
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> index e7ea9b88fd246..7cd7cae950bc7 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> @@ -870,6 +870,16 @@ static int pf_handle_vf_save_data(struct xe_gt *gt, unsigned int vfid)
>  		return -EAGAIN;
>  	}
>  
> +	if (xe_gt_sriov_pf_migration_save_test(gt, vfid, XE_SRIOV_MIGRATION_DATA_TYPE_MMIO)) {
> +		ret = xe_gt_sriov_pf_migration_mmio_save(gt, vfid);
> +		if (ret)
> +			return ret;
> +
> +		xe_gt_sriov_pf_migration_save_clear(gt, vfid, XE_SRIOV_MIGRATION_DATA_TYPE_MMIO);
> +
> +		return -EAGAIN;
> +	}
> +
>  	return 0;
>  }
>  
> @@ -1079,6 +1089,9 @@ static int pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid)
>  	case XE_SRIOV_MIGRATION_DATA_TYPE_GGTT:
>  		ret = xe_gt_sriov_pf_migration_ggtt_restore(gt, vfid, data);
>  		break;
> +	case XE_SRIOV_MIGRATION_DATA_TYPE_MMIO:
> +		ret = xe_gt_sriov_pf_migration_mmio_restore(gt, vfid, data);
> +		break;
>  	case XE_SRIOV_MIGRATION_DATA_TYPE_GUC:
>  		ret = xe_gt_sriov_pf_migration_guc_restore(gt, vfid, data);
>  		break;
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> index 6f2ee5820bdd4..5e90aeafeeb41 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> @@ -5,10 +5,13 @@
>  
>  #include <drm/drm_managed.h>
>  
> +#include "regs/xe_guc_regs.h"
> +
>  #include "abi/guc_actions_sriov_abi.h"
>  #include "xe_bo.h"
>  #include "xe_ggtt.h"
>  #include "xe_gt.h"
> +#include "xe_gt_sriov_pf.h"
>  #include "xe_gt_sriov_pf_config.h"
>  #include "xe_gt_sriov_pf_control.h"
>  #include "xe_gt_sriov_pf_helpers.h"
> @@ -16,6 +19,7 @@
>  #include "xe_gt_sriov_printk.h"
>  #include "xe_guc_buf.h"
>  #include "xe_guc_ct.h"
> +#include "xe_mmio.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_migration_data.h"
>  #include "xe_sriov_pf_migration.h"
> @@ -357,6 +361,150 @@ int xe_gt_sriov_pf_migration_guc_restore(struct xe_gt *gt, unsigned int vfid,
>  	return pf_restore_vf_guc_state(gt, vfid, data);
>  }
>  
> +static ssize_t pf_migration_mmio_size(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (xe_gt_is_media_type(gt))
> +		return MED_VF_SW_FLAG_COUNT * sizeof(u32);
> +	else
> +		return VF_SW_FLAG_COUNT * sizeof(u32);
> +}
> +
> +static int pf_migration_mmio_save(struct xe_gt *gt, unsigned int vfid, void *buf, size_t size)
> +{
> +	struct xe_mmio mmio;
> +	u32 *regs = buf;
> +	int n;
> +
> +	xe_mmio_init_vf_view(&mmio, &gt->mmio, vfid);
> +
> +	if (size != pf_migration_mmio_size(gt, vfid))
> +		return -EINVAL;

you may want to check that first (before init vf view)

> +
> +	if (xe_gt_is_media_type(gt))
> +		for (n = 0; n < MED_VF_SW_FLAG_COUNT; n++)
> +			regs[n] = xe_mmio_read32(&gt->mmio, MED_VF_SW_FLAG(n));
> +	else
> +		for (n = 0; n < VF_SW_FLAG_COUNT; n++)
> +			regs[n] = xe_mmio_read32(&gt->mmio, VF_SW_FLAG(n));
> +
> +	return 0;
> +}
> +
> +static int pf_migration_mmio_restore(struct xe_gt *gt, unsigned int vfid,
> +				     const void *buf, size_t size)
> +{
> +	const u32 *regs = buf;
> +	struct xe_mmio mmio;
> +	int n;
> +
> +	xe_mmio_init_vf_view(&mmio, &gt->mmio, vfid);
> +
> +	if (size != pf_migration_mmio_size(gt, vfid))
> +		return -EINVAL;

ditto

> +
> +	if (xe_gt_is_media_type(gt))
> +		for (n = 0; n < MED_VF_SW_FLAG_COUNT; n++)
> +			xe_mmio_write32(&gt->mmio, MED_VF_SW_FLAG(n), regs[n]);
> +	else
> +		for (n = 0; n < VF_SW_FLAG_COUNT; n++)
> +			xe_mmio_write32(&gt->mmio, VF_SW_FLAG(n), regs[n]);
> +
> +	return 0;
> +}
> +
> +static int pf_save_vf_mmio_mig_data(struct xe_gt *gt, unsigned int vfid)
> +{
> +	struct xe_sriov_migration_data *data;
> +	size_t size;
> +	int ret;
> +
> +	size = pf_migration_mmio_size(gt, vfid);
> +	xe_gt_assert(gt, size);
> +
> +	data = xe_sriov_migration_data_alloc(gt_to_xe(gt));
> +	if (!data)
> +		return -ENOMEM;
> +
> +	ret = xe_sriov_migration_data_init(data, gt->tile->id, gt->info.id,
> +					   XE_SRIOV_MIGRATION_DATA_TYPE_MMIO, 0, size);
> +	if (ret)
> +		goto fail;
> +
> +	ret = pf_migration_mmio_save(gt, vfid, data->vaddr, size);
> +	if (ret)
> +		goto fail;
> +
> +	xe_gt_sriov_dbg_verbose(gt, "VF%u MMIO data save (%zu bytes)\n", vfid, size);

maybe make it part of the pf_dump_mig_data() ?

	pf_dump_mig_data(gt, vfid, data, "MMIO saved");

> +	pf_dump_mig_data(gt, vfid, data);
> +
> +	ret = xe_gt_sriov_pf_migration_save_produce(gt, vfid, data);
> +	if (ret)
> +		goto fail;
> +
> +	return 0;
> +
> +fail:
> +	xe_sriov_migration_data_free(data);
> +	xe_gt_sriov_err(gt, "Failed to save VF%u MMIO data (%pe)\n", vfid, ERR_PTR(ret));
> +	return ret;
> +}
> +
> +static int pf_restore_vf_mmio_mig_data(struct xe_gt *gt, unsigned int vfid,
> +				       struct xe_sriov_migration_data *data)
> +{
> +	int ret;
> +
> +	xe_gt_sriov_dbg_verbose(gt, "VF%u MMIO data restore (%llu bytes)\n", vfid, data->size);

and here:

	pf_dump_mig_data(gt, vfid, data, "restoring MMIO");
> +	pf_dump_mig_data(gt, vfid, data);
> +
> +	ret = pf_migration_mmio_restore(gt, vfid, data->vaddr, data->size);
> +	if (ret) {
> +		xe_gt_sriov_err(gt, "Failed to restore VF%u MMIO data (%pe)\n",
> +				vfid, ERR_PTR(ret));
> +
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_migration_mmio_save() - Save VF MMIO migration data.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier (can't be 0)
> + *
> + * This function is for PF only.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_migration_mmio_save(struct xe_gt *gt, unsigned int vfid)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, vfid != PFID);
> +	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
> +
> +	return pf_save_vf_mmio_mig_data(gt, vfid);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_migration_mmio_restore() - Restore VF MMIO migration data.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier (can't be 0)
> + *
> + * This function is for PF only.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_migration_mmio_restore(struct xe_gt *gt, unsigned int vfid,
> +					  struct xe_sriov_migration_data *data)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, vfid != PFID);
> +	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
> +
> +	return pf_restore_vf_mmio_mig_data(gt, vfid, data);
> +}
> +
>  /**
>   * xe_gt_sriov_pf_migration_size() - Total size of migration data from all components within a GT.
>   * @gt: the &xe_gt
> @@ -389,6 +537,13 @@ ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid)
>  		size += sizeof(struct xe_sriov_pf_migration_hdr);
>  	total += size;
>  
> +	size = pf_migration_mmio_size(gt, vfid);
> +	if (size < 0)
> +		return size;
> +	if (size > 0)
> +		size += sizeof(struct xe_sriov_pf_migration_hdr);
> +	total += size;
> +
>  	return total;
>  }
>  
> @@ -453,6 +608,9 @@ void xe_gt_sriov_pf_migration_save_init(struct xe_gt *gt, unsigned int vfid)
>  
>  	if (pf_migration_ggtt_size(gt, vfid) > 0)
>  		set_bit(XE_SRIOV_MIGRATION_DATA_TYPE_GGTT, &migration->save.data_remaining);
> +
> +	xe_gt_assert(gt, pf_migration_mmio_size(gt, vfid) > 0);
> +	set_bit(XE_SRIOV_MIGRATION_DATA_TYPE_MMIO, &migration->save.data_remaining);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> index bc201d8f3147a..b0eec94fea3a6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> @@ -22,6 +22,9 @@ int xe_gt_sriov_pf_migration_guc_restore(struct xe_gt *gt, unsigned int vfid,
>  int xe_gt_sriov_pf_migration_ggtt_save(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_migration_ggtt_restore(struct xe_gt *gt, unsigned int vfid,
>  					  struct xe_sriov_migration_data *data);
> +int xe_gt_sriov_pf_migration_mmio_save(struct xe_gt *gt, unsigned int vfid);
> +int xe_gt_sriov_pf_migration_mmio_restore(struct xe_gt *gt, unsigned int vfid,
> +					  struct xe_sriov_migration_data *data);
>  
>  ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid);
>  

but patch looks ok, so with #include fixed (and maybe with better dump helper),

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

