Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83543961E2E
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 07:27:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C82F710E19F;
	Wed, 28 Aug 2024 05:27:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j/FsW2/8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5097810E19F;
 Wed, 28 Aug 2024 05:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724822855; x=1756358855;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RwNmlQ7zJeOJ59C79MJgXnjFhhUlUIyIAYIi0oOyB3E=;
 b=j/FsW2/8LaNTKf+AVA8ddgBmuD4yc2QyYr/XD+Y8xCB+74ufTgkdvofR
 zvmKDrmUg7o89UwOTnGBsGkQsxB1AQMNRmQz2zGDco2mBXcZB2X217dfn
 xzfs7bpI1C4AlUXv2bcJ6jeiPPGEOhJfO5rfgYjFmTIaNEtjlN6Qpxg3v
 cBVVlKOoYF1b91kIAObhO3wmEnmbininCnL0RjpXee9RvROcs/CjHazrg
 qoD0OOCtrmlPHkestnAXu/5lAg7KIrJ2/AL8lXqMYXS1S/1GHsM4NmTsB
 /WRY0xIFDfPFFzTx9svy1b402mtxYHuNSDL0daaTTXHBVbLJHwmFLyss0 Q==;
X-CSE-ConnectionGUID: P55Z2CWgSuy6JOBVIQowaA==
X-CSE-MsgGUID: Vp8OJagkTV2Ig87kKSnXow==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="23198114"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="23198114"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 22:27:34 -0700
X-CSE-ConnectionGUID: f0buphF/S5esPJdAQ5o3Qg==
X-CSE-MsgGUID: GbR7AIrTSGGfek0/LLOc8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="67793639"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Aug 2024 22:27:35 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 Aug 2024 22:27:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 Aug 2024 22:27:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 27 Aug 2024 22:27:33 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 27 Aug 2024 22:27:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lGxQb6/nwU9MlAoTEpo4o9A+Vq6Fo/7T88iEYUR0GSNgd5OxQh7Hfu8qa1ne9f03VxlYgt8fK8BKU29LT3oKWhIFMplIcHPJ+gbHXr0Ynvc1DCC0z+w33Aa1O1cya/ql6Db9ONgfMOLN3X8Yc7pzz14pUmAeYf2xUXz/jWjd6uwONSd8VuzZzy/WawYVUB2lLOTbMsMPG3d3rTYu55+bB9V2KNdHndo7MO0Xp945tBdSVf63rQGvJHMi7Nc3ecVZzfmk1Sj8uytISslh+/0tnabCvAlZnwXOIS1MxA73eaPwO3a7e3U5irTMlO3CtG5Gc6x8v3yilbebHpMuAo+8Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sECfjDmh97wGcWBrpe61pIAxY1CZn40kSjjdY6T5GG4=;
 b=se0poo53Fi5kj7e1ooSO7RHO1CayODswb6OgpDgitnrC4lQgsB4E30ajkdJXq35wCs3L4mzNp+ic3wy+uM6EulHv/JfqJsoRMpaHDtMNdFrcEh+YPMa0o7Q5ezjUxx4ZnjDQhqk6BMOPn483O8eUlkcRaX7RgiudSGZQtaOiGkVjRUdM49fGKdV+f5PWq/FVnIgX3G7IToiiIxxXa8nyv8UaQJEjqnO1hDUYIMwu473LgLyYs/WIEYN/WiX00sW522WVX/7pscgOuOfSwYjadVk8iVE3PKPDrglBhLucsAbWKzYUIDQNI2Tmxu0g4N+7eR7EMBP4rEp1fQ7MhIg1mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SA2PR11MB4812.namprd11.prod.outlook.com (2603:10b6:806:f8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Wed, 28 Aug
 2024 05:27:25 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%5]) with mapi id 15.20.7897.021; Wed, 28 Aug 2024
 05:27:25 +0000
Message-ID: <b8f1ef27-e66f-4a65-97c3-e13ea87e9853@intel.com>
Date: Wed, 28 Aug 2024 10:57:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] drm/i915/hwmon: expose fan speed
To: Raag Jadav <raag.jadav@intel.com>, <jani.nikula@linux.intel.com>,
 <joonas.lahtinen@linux.intel.com>, <rodrigo.vivi@intel.com>,
 <tursulin@ursulin.net>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <linux@roeck-us.net>, <andi.shyti@linux.intel.com>,
 <andriy.shevchenko@linux.intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <anshuman.gupta@intel.com>, <riana.tauro@intel.com>,
 <ashutosh.dixit@intel.com>, <karthik.poosa@intel.com>
References: <20240823034548.2670032-1-raag.jadav@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240823034548.2670032-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::17) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SA2PR11MB4812:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fc3bd88-eca4-4378-f30e-08dcc72219a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SVEzdDdEa3gyd2VOV05BTld2V09McTZXMXpzcklFbG83YkVKclN1bkw1MTQz?=
 =?utf-8?B?Ukc4NDhhOEo5SjJ5a0sxTnpIODQzVTR4OXJVMGRPTGhLR2RJZDY3U01LNXF6?=
 =?utf-8?B?OTRIVjdTL1pndmNwWmRUQS90MUc0eGswd2o0WENEOHl4RDk1ZysyQyt6dXF3?=
 =?utf-8?B?ZFU3cGE3VmVqeUM2Vi94bWVZblVHeFVwT084b3BCZEQ1ZCtHZW5ZMm5TeUJH?=
 =?utf-8?B?YnVjN2dOaCszMWU1SlhzcE15ZnpjWnFoS3JUL05HSFVGRm5IRnRkd1p0WUtt?=
 =?utf-8?B?T1JQRktSOEZtR2VSTVJlM0w0eXN4T0w4Ym5NcTc2Y0lxWXlXV21KUVp3dnEy?=
 =?utf-8?B?VUdhQSsvNndlWHNxVGZ4U0xMS1BDbFVNWkxqTllwWmZKM0NncnQ2OWZwWXh4?=
 =?utf-8?B?YW01VHZ2b1dzeHhlYmhEWVM5c3UyWTdKZTBoTm5oM3FVK1FES0w3L3MwZnYv?=
 =?utf-8?B?VlVwYkppNHZsWVpGd29mdWY2cU1hNzFBekFXeTVQSXFYRmkrQmR5VWUvMHp2?=
 =?utf-8?B?T0tqNnY4WjdveVFsMXBxcVkzeUlaWXMxVWoxQmMyckQrNkphSCs5T1RGWHVE?=
 =?utf-8?B?UTVrV1c0clV1dDYyTTFHVGZtdkxnZFZhOHdMTmR2TWhnTXloZlVXRnphVUM1?=
 =?utf-8?B?TnlWM2kzR2VLTVduTGpsM2xNMzA4akVkNkE5SURZOEQwVmhCQ0J6QkQ0OU5n?=
 =?utf-8?B?eTgwSHVodW8xbnNBU3Q3THNobVJRa2pmcE5ZNHlBRDczN21kVmRsanhXazV5?=
 =?utf-8?B?YVgvdFplWDVESWw0SHkreDBZYjRiTTBUZ05TdkR6SDdyNzVLRUVrUnJ0bEpa?=
 =?utf-8?B?eFE4c3ByQ0ViMzN0UkFWb0VpZHpZaUFIcGdHdm56dHViSk1YT2Q3SytPcmtw?=
 =?utf-8?B?cms5SWw1UXlOemxLOUJGWmNZek9ueVY0aEtlS1VpdU1NdUxXeDhWMTZ4b0Fs?=
 =?utf-8?B?Qko2RTlFaHYrendVU1ZKSjFGVVZQb3JOZHZsQU1NdGhPaGt2QkUySE9tN011?=
 =?utf-8?B?NVgwaWJFZTNUY2lFZWpqUzJQbGZxRWdhWlZWVlZjanF1UlZMdnN3OFRGWHBK?=
 =?utf-8?B?R2dURDN1aEFQV0JFS3RCRzRlS0J3NkFBRER3bFY1djRncGkzczZFMmJSR0d3?=
 =?utf-8?B?RjdIQ3MwN1ZIWlJhQzNGWk5UckRiem5vVjVBcnlGUlJzb2l1VnBsa1ZGU3RQ?=
 =?utf-8?B?MXNFK0FTbjNmWFlPSU5yMUpJV3VHQWRtOXRpQml3NGpUTVUyOVZ1MWVERm1U?=
 =?utf-8?B?WXA1eEhXcE91RksvMHFscWtxNTN5dFJFclNtWVJiZ09aTjd3ZjU4ZFhVemZO?=
 =?utf-8?B?NmdCNmZFSjB2L21JMzgzQmRRSzNLUUVkMlFWQmtsM0ZPMTFJQXBZbk1xNnBQ?=
 =?utf-8?B?cDZ3bFRpMjRhS09rYXlYUFkrd05jd2ZmWW91SnRLRGFkdjQxUXRFMzl5Mm8w?=
 =?utf-8?B?UWo0d2tPT1VHSEdqK21IaEVreFNKSGg3SThUdHZOVXZCYWZybng0TWxObDRo?=
 =?utf-8?B?QkY4b0RmTllJamxFSE1WWGNHaXJQdTRiTDZlbG1xOWIzWDBhWXZzZWF6aGxR?=
 =?utf-8?B?Z1Awa2pTU2lFNmttbE1nNDY2UDd4eERKMHh5dWlzQ0tSUlo0cFNIQUZVNTRr?=
 =?utf-8?B?SzhMeFlTbHVNak5IMk83UGR3UmE0YWQ1WUdHSy9IU0Y2Zks2cXRiZmxUaTkr?=
 =?utf-8?B?bTFacUlLcCsyY0tkQWtsUUQyMUQwQ2EwMjJSaU1CZXBuc2lEMzFaS1lML0Z4?=
 =?utf-8?B?U0o2NW1SNTkzQlJvU3RpdkQvMXhPOXhKTkxlRXJzRlBnbk5pbDlmbGwrejE4?=
 =?utf-8?B?eW5hQThPR3V2QndjaC9jSFplc0laNEkzTGt3eFlUb0NaNHBtV3BMTEIwNWlk?=
 =?utf-8?Q?SjbUoAYep/iPI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkdPcWRUbVA2eC93cmk0S20yUVYydFg1YTgzUEpmR0dUd25oOWM3T2NGdEky?=
 =?utf-8?B?NjhnZUYxM1hZTHlia09NUDZKeDZLYjNYTURYeUxnVEZnb1JYOEhMbVFWamNl?=
 =?utf-8?B?aW1wd2pmaEhxNlNSWTM5cEc4UG8vMXBsOFFsYlV2YzNxd1ViaklxNHNWcEZn?=
 =?utf-8?B?WDJhNkpmTVRNNlFmdHl3Z2tXRDBIQi92N09DV2JFWkpWRmUzdFZOUnBhUUp2?=
 =?utf-8?B?emlZWTdmSVZYSlhVYllPbnN5SFdmaEJDM0hWbytUWGxFT1IrdVMvRVdoOHVj?=
 =?utf-8?B?WTJTODBGd0VNMEcrbUt5ZERGYnZidEpOcklSbjByUXdxNjQxdHJoTC9udFdS?=
 =?utf-8?B?UC9BcGxVSlIrTVFkeG1hQjYzVjVIbUJLOU52Nmg3SW5yd0RyT0s1d0VoZjR5?=
 =?utf-8?B?SFpEb0Zpa1J5aFcyQU5vV0FvL2NGQ2xKdE1pZ1RXYzFNTzRwb0JnaDJ5WVZy?=
 =?utf-8?B?SUFzbEZpSGp5RzI1eUw0c0lEVHJ1Y2MvTXhqb3pUY1RqRFdidjhaYXZaVjhS?=
 =?utf-8?B?dlRMQnJqOEIwQndiRW5vMFU3a0FNVXpTVlF2dm9GSENlQjFzOEVPWTd6bmZS?=
 =?utf-8?B?KzI5WGNTYlNlVkd0YWpzVDg4TlRnVFR2cEFsc2ZOK1E5VmtvYXVCdFlQbHZI?=
 =?utf-8?B?dUlSUzNpN2J5b1VWTmNVeGRBUHBDcTUwbnJUUVhLVGs1UHNPcXNKa3RVOVNi?=
 =?utf-8?B?THk5OE82Y1BpT2VITDl6d2ozclVyakk2N1NCNHNCTS8zdVNyNHNOS2JVakN4?=
 =?utf-8?B?T2pKMnFlS0t1M0MxeGlINmxNNzFyejJVSHBlWW1MUnNjeGx2eDF6RkVQdzZL?=
 =?utf-8?B?c0liYmNHOXlEWTYzZUlnV1dpVHFyempWSGNqSDlzLzBmaWJBbzlFTWY3MnFK?=
 =?utf-8?B?L3NQc1dNRXdyRmlUeXdhTVRMMlVjcElzck9YeFh5ekt3Y3pIR3kycERzeFg0?=
 =?utf-8?B?Q0ZvRi8vQ1R0anZoODNZY1JiZXBEZEFHMDdlL09EY1hzN09MbVc1L1kvUEJs?=
 =?utf-8?B?eG9sSkJsWFVpc2dkWmZzL2VTNzNGUXMvS1orbHNRZjFwZlo3ZGtUUU5TbU56?=
 =?utf-8?B?emZpUlRHcHNjWmMxeGFrOVRDM082VTF1aVNOQjIySHZSNFhsdFBtWWF6ZGNq?=
 =?utf-8?B?UDdnNEFFQ2EyNkFOMFNVZmQrY1hHSjhZUUI3OEFkd25iZkpsTysyL2RFcjgy?=
 =?utf-8?B?T21NYmNJY3BlV2MyOWtJMWpobCtOWWhXVFhrWVJpakVPeXUzSXY5ZnZ1U2ha?=
 =?utf-8?B?cG00d3RPYkFwZGV2MUplWklON1lRK1FCMnRDU1ErRkhHaDJWaVZuZ2h6TVJh?=
 =?utf-8?B?c0NQQzVEVFkxSE9oKzNvUmgyTmQvaXRnOHE0L3pPK3J5TEZpSklzeS9xQUY3?=
 =?utf-8?B?Y2VibTk2TmZCL0FsWjE4TWJqck1OWC95aytkc3V4R3p1Q01CZ1RIOWdod1Y4?=
 =?utf-8?B?L0tsclk1clJBeTREdGVyTUNZVFJueGJQWEcraW15RDk5YzVjRlV1dFBvM0xY?=
 =?utf-8?B?c0VrczMwa2tjdmwxd0lLNkNqbW5aSzNXQzJpZW8xYUpzblpvOWZpN05YSGlB?=
 =?utf-8?B?aldlQVNwKzlkYXY5cGxpU0JsaFZDMEpURFRtczlUUXp1TWdSUC9WM0RhYlJQ?=
 =?utf-8?B?SWROL3o2OFQxUHp6KzVYcjJlY2RTN282WSt1eWl3VmxMSmo4dnlRdUVSUGtw?=
 =?utf-8?B?aW5HendvN1pwZU9RUEx1c1VhUVcrNkdncmxKTFROWVFwb0tXYVpDck1ickY2?=
 =?utf-8?B?RzJ1ZExMQlh1NmdIUWZzUEEzcTJpYUFzK3dsWTl1YkNVTVV2TWU2bzRqYjRq?=
 =?utf-8?B?UmZuYjRCZzIxMmhTUG9iM05VdXVVdDdqTmZvWnU5Z2g5YlF1ZWdnVVZQampE?=
 =?utf-8?B?aWFyRmkvZGh6ZFdaZmV1cmZhSzUrNlM1WkZNMnA3OEtwcWlpVjRtSEdaOTNJ?=
 =?utf-8?B?NTdLbVhucjlFdG53MVl1c1g4QStUb0UvRFJrUHd5OStkRnZtNHhSRkJRY1Jz?=
 =?utf-8?B?Mld6U3dhVTJHNzJpOVJQeDVLWURpZC92ZzRjREVjSWpaSFhFT2pWVDRuZUZn?=
 =?utf-8?B?amlwdHJXb3dOdWNXbEUybXBnZituY1hxTm1lcHhDaDcxZ2pqWDZNajVoMGJ2?=
 =?utf-8?B?Uk9TcURobTdHVU1zUnhKeXlTWlMvVDVxdGhhYkZiV0krNmFBOHpJS0xpVG8x?=
 =?utf-8?B?bUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fc3bd88-eca4-4378-f30e-08dcc72219a1
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 05:27:25.5923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XDI6gCAfDqWQGcps0ZJwWDCupWKmx0ubpLqj9HzK4V/wMP84v7sqkQKjoT+fw24n8jm4GIJzJprXUl542JRVcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4812
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



On 23-08-2024 09:15, Raag Jadav wrote:
> Add hwmon support for fan1_input attribute, which will expose fan speed
> in RPM. With this in place we can monitor fan speed using lm-sensors tool.
> 
> $ sensors
> i915-pci-0300
> Adapter: PCI adapter
> in0:         653.00 mV
> fan1:        3833 RPM
> power1:           N/A  (max =  43.00 W)
> energy1:      32.02 kJ
> 
> v2: Handle overflow, add mutex protection and ABI documentation
>      Aesthetic adjustments (Riana)
> v3: Change rotations data type, ABI date and version
> v4: Fix wakeref leak
>      Drop switch case and simplify hwm_fan_xx() (Andi)
> v5: Rework time calculation, aesthetic adjustments (Andy)
> v6: Drop redundant overflow logic (Andy)
>      Split fan_input_read() into dedicated helper (Badal)
> v7: Fix undefined reference to __udivdi3 for i386 (Andy)
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>   .../ABI/testing/sysfs-driver-intel-i915-hwmon |  8 ++
>   drivers/gpu/drm/i915/gt/intel_gt_regs.h       |  2 +
>   drivers/gpu/drm/i915/i915_hwmon.c             | 88 +++++++++++++++++++
>   3 files changed, 98 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> index 92fe7c5c5ac1..be4141a7522f 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> @@ -75,3 +75,11 @@ Description:	RO. Energy input of device or gt in microjoules.
>   		for the gt.
>   
>   		Only supported for particular Intel i915 graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/i915/.../hwmon/hwmon<i>/fan1_input
> +Date:		November 2024
> +KernelVersion:	6.12
> +Contact:	intel-gfx@lists.freedesktop.org
> +Description:	RO. Fan speed of device in RPM.
> +
> +		Only supported for particular Intel i915 graphics platforms.
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index e42b3a5d4e63..57a3c83d3655 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -1553,6 +1553,8 @@
>   #define VLV_RENDER_C0_COUNT			_MMIO(0x138118)
>   #define VLV_MEDIA_C0_COUNT			_MMIO(0x13811c)
>   
> +#define PCU_PWM_FAN_SPEED			_MMIO(0x138140)
> +
>   #define GEN12_RPSTAT1				_MMIO(0x1381b4)
>   #define   GEN12_VOLTAGE_MASK			REG_GENMASK(10, 0)
>   #define   GEN12_CAGF_MASK			REG_GENMASK(19, 11)
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> index 49db3e09826c..17d30f6b84b0 100644
> --- a/drivers/gpu/drm/i915/i915_hwmon.c
> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> @@ -5,6 +5,7 @@
>   
>   #include <linux/hwmon.h>
>   #include <linux/hwmon-sysfs.h>
> +#include <linux/jiffies.h>
>   #include <linux/types.h>
>   
>   #include "i915_drv.h"
> @@ -36,6 +37,7 @@ struct hwm_reg {
>   	i915_reg_t pkg_rapl_limit;
>   	i915_reg_t energy_status_all;
>   	i915_reg_t energy_status_tile;
> +	i915_reg_t fan_speed;
>   };
>   
>   struct hwm_energy_info {
> @@ -43,11 +45,17 @@ struct hwm_energy_info {
>   	long accum_energy;			/* Accumulated energy for energy1_input */
>   };
>   
> +struct hwm_fan_info {
> +	u32 reg_val_prev;
> +	u64 time_prev;
> +};
> +
>   struct hwm_drvdata {
>   	struct i915_hwmon *hwmon;
>   	struct intel_uncore *uncore;
>   	struct device *hwmon_dev;
>   	struct hwm_energy_info ei;		/*  Energy info for energy1_input */
> +	struct hwm_fan_info fi;			/*  Fan info for fan1_input */
>   	char name[12];
>   	int gt_n;
>   	bool reset_in_progress;
> @@ -276,6 +284,7 @@ static const struct hwmon_channel_info * const hwm_info[] = {
>   	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
>   	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT),
>   	HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT),
> +	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
>   	NULL
>   };
>   
> @@ -613,6 +622,69 @@ hwm_curr_write(struct hwm_drvdata *ddat, u32 attr, long val)
>   	}
>   }
>   
> +static umode_t
> +hwm_fan_is_visible(const struct hwm_drvdata *ddat, u32 attr)
> +{
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +
> +	if (attr == hwmon_fan_input && i915_mmio_reg_valid(hwmon->rg.fan_speed))
> +		return 0444;
> +
> +	return 0;
> +}
> +
> +static int
> +hwm_fan_input_read(struct hwm_drvdata *ddat, long *val)
> +{
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +	struct hwm_fan_info *fi = &ddat->fi;
> +	u64 rotations, time_now, time;
> +	intel_wakeref_t wakeref;
> +	u32 reg_val;
> +	int ret = 0;
> +
> +	wakeref = intel_runtime_pm_get(ddat->uncore->rpm);
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	reg_val = intel_uncore_read(ddat->uncore, hwmon->rg.fan_speed);
> +	time_now = get_jiffies_64();
> +
> +	/*
> +	 * HW register value is accumulated count of pulses from
> +	 * PWM fan with the scale of 2 pulses per rotation.
> +	 */
> +	rotations = (reg_val - fi->reg_val_prev) / 2;
> +
> +	time = jiffies_delta_to_msecs(time_now - fi->time_prev);
> +	if (unlikely(!time)) {
> +		ret = -EAGAIN;
> +		goto exit;
> +	}
> +
> +	/*
> +	 * Calculate fan speed in RPM by time averaging two subsequent
> +	 * readings in minutes.
> +	 * RPM = number of rotations * msecs per minute / time in msecs
> +	 */
> +	*val = DIV_ROUND_UP_ULL(rotations * (MSEC_PER_SEC * 60), time);
> +
> +	fi->reg_val_prev = reg_val;
> +	fi->time_prev = time_now;
> +exit:
> +	mutex_unlock(&hwmon->hwmon_lock);
> +	intel_runtime_pm_put(ddat->uncore->rpm, wakeref);
> +	return ret;
> +}
> +
> +static int
> +hwm_fan_read(struct hwm_drvdata *ddat, u32 attr, long *val)
> +{
> +	if (attr == hwmon_fan_input)
> +		return hwm_fan_input_read(ddat, val);
> +
> +	return -EOPNOTSUPP;
> +}
> +
>   static umode_t
>   hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   	       u32 attr, int channel)
> @@ -628,6 +700,8 @@ hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   		return hwm_energy_is_visible(ddat, attr);
>   	case hwmon_curr:
>   		return hwm_curr_is_visible(ddat, attr);
> +	case hwmon_fan:
> +		return hwm_fan_is_visible(ddat, attr);
>   	default:
>   		return 0;
>   	}
> @@ -648,6 +722,8 @@ hwm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   		return hwm_energy_read(ddat, attr, val);
>   	case hwmon_curr:
>   		return hwm_curr_read(ddat, attr, val);
> +	case hwmon_fan:
> +		return hwm_fan_read(ddat, attr, val);
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> @@ -739,12 +815,14 @@ hwm_get_preregistration_info(struct drm_i915_private *i915)
>   		hwmon->rg.pkg_rapl_limit = PCU_PACKAGE_RAPL_LIMIT;
>   		hwmon->rg.energy_status_all = PCU_PACKAGE_ENERGY_STATUS;
>   		hwmon->rg.energy_status_tile = INVALID_MMIO_REG;
> +		hwmon->rg.fan_speed = PCU_PWM_FAN_SPEED;
>   	} else {
>   		hwmon->rg.pkg_power_sku_unit = INVALID_MMIO_REG;
>   		hwmon->rg.pkg_power_sku = INVALID_MMIO_REG;
>   		hwmon->rg.pkg_rapl_limit = INVALID_MMIO_REG;
>   		hwmon->rg.energy_status_all = INVALID_MMIO_REG;
>   		hwmon->rg.energy_status_tile = INVALID_MMIO_REG;
> +		hwmon->rg.fan_speed = INVALID_MMIO_REG;
>   	}
>   
>   	with_intel_runtime_pm(uncore->rpm, wakeref) {
> @@ -755,6 +833,16 @@ hwm_get_preregistration_info(struct drm_i915_private *i915)
>   		if (i915_mmio_reg_valid(hwmon->rg.pkg_power_sku_unit))
>   			val_sku_unit = intel_uncore_read(uncore,
>   							 hwmon->rg.pkg_power_sku_unit);
> +
> +		/*
> +		 * Store the initial fan register value, so that we can use it for
> +		 * initial fan speed calculation.
> +		 */
> +		if (i915_mmio_reg_valid(hwmon->rg.fan_speed)) {
> +			ddat->fi.reg_val_prev = intel_uncore_read(uncore,
> +								  hwmon->rg.fan_speed);
> +			ddat->fi.time_prev = get_jiffies_64();
> +		}
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
>   	}
>   
>   	hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
