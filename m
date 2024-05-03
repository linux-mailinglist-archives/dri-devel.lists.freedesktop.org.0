Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F44C8BA9F2
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 11:33:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6049410EEAF;
	Fri,  3 May 2024 09:33:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i4rZbdbY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7247510EEAF;
 Fri,  3 May 2024 09:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714728835; x=1746264835;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=OXcGF4CVkBJDPoBVr6DzRZ2PxPRzs9NcjQ8Zj/uTufA=;
 b=i4rZbdbYMNbyRkaJTwBMH8EK9Ux2EvhihGz0+/0bhUSIjbulF7iv9BAS
 ephkTUGyX1xRLe3m4wi5jk2iFRUWy6Uq7xne8CSWEII5acMSLuOkCNJp6
 H0j3FgEVEvn5o5i0DSjv9+tGEO8g80RgsY3aMBs4CxDCVPpwjdGG/ypFe
 UVeq13uMAgYpsRCubMMq2SaOhjazPA19dTppyvuUO84XcXQG8h0oDo+un
 bjDduOGL08tf/akF/uYRY3fIpsHaTtNK/SgIBAXoRyFZm8Fx2UZ+RuOHK
 QvjqDjD6tQTA86MwyVkZnzMIz2eAHM/eR/QOdR8G9Dy3mdZv8EoRQSkvF Q==;
X-CSE-ConnectionGUID: 9OdaB+SYTdCtvD8YHuTXEw==
X-CSE-MsgGUID: uo7BM6WiRrGyxM4frSi1fw==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="10659216"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="10659216"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 02:33:54 -0700
X-CSE-ConnectionGUID: uLRthPePQO2ni8kHhMRehg==
X-CSE-MsgGUID: R1rowXgnTNuj6brwKVyJfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="27511222"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 May 2024 02:33:54 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 02:33:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 02:33:53 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 3 May 2024 02:33:53 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 3 May 2024 02:33:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fAUi9kCx3PlxRHJKnyKrvsVCS0xsfW3zUpw7yjVfJylkeOEhAWE4ZetgY27NLztMC0kbS8jaaoNwNP9RdzsXm5l9H6LQB0ke7tCcg8TrAYHnFPtaEqOszxd/ehHQ27u73hvlu/r9ARcE37WvIPvaW4qd0pCd5s3Ny4EkZbAjv5ImJC6eo7dKU+7K9Z6wR/+4BZg9hK0C936LJf/JbQ0dfSdOg05FM5KXytLJX+mCYoq321r7j/VMR6oO/XHv745di/Hq0y2/xms/+iZJdNFO0CW/zMx+N1kp6IVNoP4obhGPml79o3HHL9pGVlyaITBZ4PCUV1mAAURAk4QAdiKRqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OXcGF4CVkBJDPoBVr6DzRZ2PxPRzs9NcjQ8Zj/uTufA=;
 b=DSPKrAAw/0XOQaZO3z98UucXsR6e1J7j9s9fDX0zRGT9gErBxTySuFUn33m8Q2b0srdpGKCz11v44gJPl1D9cWjbZw7PvyNPfDOCFw1T876KuOYeLfRC6hGxAsIQvPOoom4DhUlUYJskaRtt52/7RruMfohj9FoQunLlop043p7rbNXrpSM0WBjlOR1Jz+wYa0BiRHRzgFGUg9oOdtikv5QXdjlVt/UhQYhFQW+XG6/h2b2Axne5w0FPOP3HW5T5XYng0x0U5TX6AHwqH0J3bR+74NOQZNN7vl5ow78NoA3NAGGCMpIC+j28LVgVWqZuI3HkGjEwzZNl1migXlaCCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 CY8PR11MB7780.namprd11.prod.outlook.com (2603:10b6:930:78::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7519.35; Fri, 3 May 2024 09:33:51 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::bccd:7928:80ae:179f]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::bccd:7928:80ae:179f%5]) with mapi id 15.20.7519.031; Fri, 3 May 2024
 09:33:51 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "Manna, Animesh" <animesh.manna@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Murthy, Arun R" <arun.r.murthy@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
Subject: Re: [PATCH v3 5/6] drm/i915/alpm: Enable lobf from source in ALPM_CTL
Thread-Topic: [PATCH v3 5/6] drm/i915/alpm: Enable lobf from source in ALPM_CTL
Thread-Index: AQHalnjWJncI+riS0U+Q3BrxAe5GFbGFL5iAgAAIxACAABS0AA==
Date: Fri, 3 May 2024 09:33:51 +0000
Message-ID: <4b68d63679295f7b0de67445ac7235a5ed957110.camel@intel.com>
References: <20240424183820.3591593-1-animesh.manna@intel.com>
 <20240424183820.3591593-6-animesh.manna@intel.com>
 <8996bb1d911feaecff7c551853f6f020480a33a2.camel@intel.com>
 <PH7PR11MB5981E8362DD409AAB082B98DF91F2@PH7PR11MB5981.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB5981E8362DD409AAB082B98DF91F2@PH7PR11MB5981.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|CY8PR11MB7780:EE_
x-ms-office365-filtering-correlation-id: 3ed8665b-ff77-4101-9e28-08dc6b542487
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?dm5mRy9zZ2hDeWVaN2NkZUR3eHBpM3hIdVEzNDlSQWYwZVp5bWxFQlV1RVlO?=
 =?utf-8?B?WUg0UnZlb3MxZU9YTXF6RkEyWDB0b0VEMUhJYjEyVDBIdjJ1aytRMFoxZklr?=
 =?utf-8?B?SEljZHp1S21QeFRNdU5PaGZBNjZza1JIMDBLbTNuNXQxbTlQN3BTeHRtWWJ1?=
 =?utf-8?B?L1hDT2hSN3RBNmFTc1BQV3V2bTI4aStxZGY0VkorTGpCL2thSHYyUXdsZkU0?=
 =?utf-8?B?M3ZVNFpwZlhJWW9lY3dGbWoyVTVIaXo5SGJZL2QvOERJbkxRMnFtYldWYTYv?=
 =?utf-8?B?cHgyVzJveWVXdlp6QjNHbktqZ3FhbTM1TFRYeStrL1FTcVVaMXZzR1BHLzRl?=
 =?utf-8?B?TUZIYWRuVkxSeHdkbVRxcmRReGZFNlREb0JMalg0QXV0QXhRQlQvZ0Z4OW9P?=
 =?utf-8?B?YitCRkI2S05CckdLL0RKLzVRWW1JeXAxYXZVSzAxSEhrcFlMUkdWbjMzOU9Z?=
 =?utf-8?B?VzIwQm5SdEhzQm44eXp2SnNnUlZKMHYwVFhxZDU3VkZQUDIyOWZ4d2tmNnhS?=
 =?utf-8?B?Y0JsSmx4REVHUDZkTGt1ZGc3SVMzM1RPbm96dyswNDh3U2lFMlF2VXJ3YmVu?=
 =?utf-8?B?RkZOVHFXY0hHcWZma2hpUm90aUxrYjZmR2YyTVJqNkxxdDN5NDk3Q20rbllM?=
 =?utf-8?B?VEtDc3pRMXlhZGpaNUNubW53dXRoWGM2MXoxQ3VTWW90Z3U0Z3k2L2UxTW5n?=
 =?utf-8?B?UFFSbktCVTkwbzBlZFR5eW9MSUt2RkdSd3FweUZRamJteEVLU2ZzWUc3VnJn?=
 =?utf-8?B?MG8weWdtaG5QSXBtUVlJQnVQVE0rQVBOYTFpUWIzZW9kbXNXS3UybXpoT1E3?=
 =?utf-8?B?dDBSUDhmcUhnYWFxR0VvUEtxcHlTNjJoMWNCY3pUNG5Pd2tKV3dKNTJsN0tu?=
 =?utf-8?B?SnFwOTQwWGV1QlBTWEtUL3c4MFRlZnpvVVROZThadmNwamJUWENuL0tKeTVC?=
 =?utf-8?B?cThvYkRrK3EzZWVseGZMNVJFN1FsbWltMTByK3A2OXFmaTZ2RUp4T0VjOG56?=
 =?utf-8?B?cHd1ZFAxTkJHbllXbUV4TDJqVmZPalNSaVUvTW10WkdZTkJhUERtK2VxZDBR?=
 =?utf-8?B?emZ2RVhTbGhzOGFaRVZwbHY3bE54YnJFYXlXYTRhOTlJMStwYzJVb29nUWxJ?=
 =?utf-8?B?UlhsYVRSUEhqMGM3RGl4Y2JRUnVZUkMrb2xrQ1BxcERmU012b1JGV2wycWdX?=
 =?utf-8?B?QzZ3RTZrZHRXbC9aOFl2NHJyZFJ0YnZGL25sU3h0UzZ3QXYrUHpLWFYvd3V1?=
 =?utf-8?B?Zlp5ZkRYa2UySThXZ2l1SmU3RzNZWFhqKzJnTE11aC9YQkxkQnUreklrdEFq?=
 =?utf-8?B?R3RvZkM4VWpOYktydU9SSVAzMEpNeG9zY1kwb1oxSGlkcUVLWG1oVmwrdTVy?=
 =?utf-8?B?M2RjeExBOUFzU2lkOTVxN1dUWUE5ZDMzVkJFUVdpVnlkS2cyTzdtak81ZW4y?=
 =?utf-8?B?UFI0M1VVQzE4ZWNiMG1HRDA2K2hMVkJKYUh2RXBEUTB3cmY0RHlNQzNXZ09T?=
 =?utf-8?B?OHd5Z2ZPcmFqSDJ3WjJaTG40aTBEcVZnS3BmenpHaWR1ZWUybmJxVXdMSTc2?=
 =?utf-8?B?NTFadWRJdnB3ZmJhWnlzWS9iVVFkU01abml5YmxXdUs1Z3VBaFI1bElNbXJa?=
 =?utf-8?B?NlBTNmJXY2tjYkhPZTJvc2duQTB4T3hBaThVZ2QxN20zWkdqbGtZYlJDNTNw?=
 =?utf-8?B?L1JqeVMveHZ4UDFibVNYQU9jZVBiWU1yUitmRm5YSDlxSG0wS29HUzlxeVpi?=
 =?utf-8?B?YnJiVUl2d2wrdUlWRlZuaHlDaWxQZDhSNHJ5LytVZU9VakFQbmhlQWhMZjM5?=
 =?utf-8?B?Q0x0ZTg4NGR3bEJtSWZKQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WkZpSXcvTGxGWU0vMXh3RWd5ajVUOWhqT05YY21zUTRvVGk5NDhzZUV1ckph?=
 =?utf-8?B?MmRYRjlORTc4VVZGYnRPNmFwVUNXa2U0RXpkc1JTN2dzMUZGRSttWEZiTWJt?=
 =?utf-8?B?Z0RhMmVHdFVDVlhqTGduUmRIUGh6cThydVZPNGloZnBvek1VWlJBb1Zhb1Mr?=
 =?utf-8?B?aWFnZ1JBUlBLUUljbzRzN2FyNWdLTEsrUnltb09JVFJ5Q21BSUYrQndiaE4r?=
 =?utf-8?B?WTY4OWxRbFFFbVdTMlFCV1FoRnJDc2N2S1FLTXJNbE4rR0FvQmE2SVQwb0tM?=
 =?utf-8?B?RzhuQUhrb1lZYUE3VElVRDRXeUx1WmM1Ym1kUm5LMUNmanB6cEdvbTFDUlU2?=
 =?utf-8?B?RmNFV0RTT0JNTFpJaUhNNU8wQUVxRS9kZDJmZnk5NitGQVhGa3p0cm9nNkg0?=
 =?utf-8?B?NEdSTFVFWUFRR1N5UXZsNmIvTzBVYk1EVnR1NGx3MFZBOERiVzlGNDVjVG9R?=
 =?utf-8?B?ZHpsbGpNTG5LUXU4YXBpRVcvTGdtemNpMUZtMzFjdzdCcW5KbUVtQnhlcmlT?=
 =?utf-8?B?dG4wRGtXVHR4V3ZQZHhXdExBbkoyQ3JZTlFnSVhtZHBUU3JxTDdNTnlyTjJK?=
 =?utf-8?B?QmloalJsTG1laWp3WEFWcXFqcmJ5ZFJ1MmtLSlRxZ3pVL2dpaEFSTG5BWE94?=
 =?utf-8?B?YWNaRlF6NkJFc01mcm9iZDNmRGt2WElpOWhqN05MOHlwM2phbTNxS2tobC9C?=
 =?utf-8?B?MUJNUTFJSkVvcW1GRThFUjduTW5TTk9PU1FoUGJhbHBtTDVERTZEek5pU08y?=
 =?utf-8?B?V0lHbVkxY0sxU1pJcUhncWRzQkxMVnVBYUwzbzNZSGZ4WkdJSS9nL3pMVkhH?=
 =?utf-8?B?bjlncHBaanlDdlcvbWZyRW05YXAyK3dncVppaG00VjRFbDIxMTNTK3dNWm52?=
 =?utf-8?B?a3UxWUFpYitLZ2l0SGR0VGNDVmpXNHZrd2dQNUR1SzJKV0ZUZmwwZWdWb1J2?=
 =?utf-8?B?b05meWw5UjVFeitLK0VtQk5tNlFGdHpmeTQ3amQ3UDdOK3dvdThkSFM2UVBO?=
 =?utf-8?B?R3hmS2k2NUlBRUhhRzYrUS9heDFEdXVPWGNyYU4xNEprcEFsa3Q5dWNRSHhT?=
 =?utf-8?B?aTFPYlJyMGI5VVJkcnRwSGE5a096Mk9rUlJQbE1aRmgyNW42alFGb00vbXBt?=
 =?utf-8?B?RlVjZisrZHR1cnZYb1NUOWhFRHY0Q1M1NkdSRmt5YTYrcnBob2piTVVyVzhp?=
 =?utf-8?B?aFg3MEFMZ3dOT3Bvb3YzYnBMVk4xQUJrcjhpOFg5Z3dUb01ZYkp0OW54bzZG?=
 =?utf-8?B?cmpqUnMxQVJXOEc4a2xQakFRMVBreURNVnNjT1pyb1VOSWpaQ3dMREcxUGN1?=
 =?utf-8?B?Y0NmQVA5MWI2YmFvU25ScG9xWnNLZXp1citaZGpsdmdKRlBqVW9WUEU2RC8x?=
 =?utf-8?B?cWVxVDlKczVUYjF1UUl5S1NVczRuTDBjZU5xWlBXOTBycXJxdDJtTmRndktz?=
 =?utf-8?B?UXdJb3ZSTkw3YXJMejNVNFI4NklJMTJKV0xHMk1MbXNrYWJvdVNiWFN4aWVD?=
 =?utf-8?B?eElBMkhEZnFaT3pONzYyQzNCdCtXaWZJWW0rZ1k5UndZS05iUlVuOXJoMW9s?=
 =?utf-8?B?RUMvTi9GYlNWVkRFZVZUNTA0NnNWcTgwNUx4aTQ1cmp4T0NLSmgvb3Y2aWRT?=
 =?utf-8?B?ZXZQNFgwNUxuR1RxbllhZmZVS3AvYjVXMHdZczhXL3BNSEJyaUhDdmhHaVp2?=
 =?utf-8?B?d211SUVxZ2tJc3JyajNmLytGeVJBcXhYL0N2bkNlME9KazNzSTBvb1F6SXls?=
 =?utf-8?B?V0Q4dEFraVFOMWk1SmhweHlIb0VMRVYrSzZYVXF6TndBQVg5NEpsSFcrUFVP?=
 =?utf-8?B?d1Y5S1pEY3ZxMk51QTh1RW5VSjNUbmlKM2M3NFI2a1Q5UFU3Zks4QVl0S1dG?=
 =?utf-8?B?UmpiemJvaFRLTlRjS0ZpYWZEcytiRHB3Qy9BenF2MGdHN2k1MVI2bEh5Qkkv?=
 =?utf-8?B?RGY2TDNXMGdzdjlWcU1sT3JjbDlVOU1sV0huT2QrODVHY2pCSmVwWEUxUSs3?=
 =?utf-8?B?ODNVajJKeHlDUkx0bm1SUExtSWxhclNVS01YREwvSDc5dnU0OG5BcVoyRmI3?=
 =?utf-8?B?c3FGa204WTh4YVl4RTlNbWNVZUlPOFZyUWp3Tk9hUWtLL0lPRXZiOGtJMVdW?=
 =?utf-8?B?eE8vMWpOaUdkdjR2Mk9HSFYwQTRTd05rczZMM3ZHTTRvZnZaeXZFcGgwWG1q?=
 =?utf-8?B?bXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C4EAB018669E3848915E0B38BDDE034B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ed8665b-ff77-4101-9e28-08dc6b542487
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2024 09:33:51.3676 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: neIH962lwlWtSOfe8GSoi4tZjL4c+VjDTdMYyu8Hi//DOZcYTGpOzZsSIWPmYs991V3xW6Bccqp6OcJNHa5Amw+k3GDk4+9QM9qp2Ait89U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7780
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

T24gRnJpLCAyMDI0LTA1LTAzIGF0IDA4OjE5ICswMDAwLCBNYW5uYSwgQW5pbWVzaCB3cm90ZToN
Cj4gDQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogSG9nYW5k
ZXIsIEpvdW5pIDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQo+ID4gU2VudDogRnJpZGF5LCBN
YXkgMywgMjAyNCAxOjE4IFBNDQo+ID4gVG86IE1hbm5hLCBBbmltZXNoIDxhbmltZXNoLm1hbm5h
QGludGVsLmNvbT47IGludGVsLQ0KPiA+IGdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPiBD
YzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgTXVydGh5LCBBcnVuIFINCj4gPiA8
YXJ1bi5yLm11cnRoeUBpbnRlbC5jb20+OyBOaWt1bGEsIEphbmkgPGphbmkubmlrdWxhQGludGVs
LmNvbT4NCj4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDUvNl0gZHJtL2k5MTUvYWxwbTogRW5h
YmxlIGxvYmYgZnJvbSBzb3VyY2UNCj4gPiBpbg0KPiA+IEFMUE1fQ1RMDQo+ID4gDQo+ID4gT24g
VGh1LCAyMDI0LTA0LTI1IGF0IDAwOjA4ICswNTMwLCBBbmltZXNoIE1hbm5hIHdyb3RlOg0KPiA+
ID4gU2V0IHRoZSBMaW5rIE9mZiBCZXR3ZWVuIEZyYW1lcyBFbmFibGUgYml0IGluIEFMUE1fQ1RM
IHJlZ2lzdGVyLg0KPiA+ID4gDQo+ID4gPiBOb3RlOiBMb2JmIG5lZWQgdG8gYmUgZW5hYmxlZCBh
ZGFwdGl2ZSBzeW5jIGZpeGVkIHJlZnJlc2ggbW9kZQ0KPiA+ID4gd2hlcmUNCj4gPiA+IHZtaW4g
PSB2bWF4ID0gZmxpcGxpbmUsIHdoaWNoIHdpbGwgYXJpc2UgYWZ0ZXIgY21tciBmZWF0dXJlDQo+
ID4gPiBlbmFibGVtZW50LiBXaWxsIGFkZCBlbmFibGluZyBzZXF1ZW5jZSBpbiBhIHNlcGFyYXRl
IHBhdGNoLg0KPiA+IA0KPiA+IElzIGFkYXB0aXZlIHN5bmMgbmVlZGVkIGZvciBib3RoIEF1eCBX
YWtlIGFuZCBBdXggTGVzcyBXYWtlPw0KPiDCoA0KPiBBRkFJSywgQUxQTSAoYXV4LXdha2UvYXV4
LWxlc3MpIGRvIG5vdCBoYXZlIGFueSBkZXBlbmRlbmN5IG9uDQo+IGFkYXB0aXZlIHN5bmMuDQo+
IEJ1dCBMT0JGIGlzIGRlcGVuZGVudCBvbiBBTFBNIChhdXgtd2FrZS9hdXgtbGVzcykgYW5kIGFk
YXB0aXZlIHN5bmMNCj4gZml4ZWQgcmVmcmVzaCBtb2RlLg0KPiANCj4gPiANCj4gPiA+IA0KPiA+
ID4gU2lnbmVkLW9mZi1ieTogQW5pbWVzaCBNYW5uYSA8YW5pbWVzaC5tYW5uYUBpbnRlbC5jb20+
DQo+ID4gPiAtLS0NCj4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9h
bHBtLmMgfCAxMyArKysrKysrKystLS0tDQo+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfYWxwbS5oIHzCoCA0ICsrLS0NCj4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9wc3IuY8KgIHzCoCAyICstDQo+ID4gPiDCoDMgZmlsZXMgY2hhbmdl
ZCwgMTIgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkNCj4gPiA+IA0KPiA+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5jDQo+ID4gPiBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5jDQo+ID4gPiBpbmRleCAz
YmI2OWVkMTZhYWIuLmIwODc5OTU4NmI1OCAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5jDQo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uYw0KPiA+ID4gQEAgLTI5MCwxMCArMjkwLDExIEBA
IHZvaWQgaW50ZWxfYWxwbV9jb21wdXRlX2xvYmZfY29uZmlnKHN0cnVjdA0KPiA+ID4gaW50ZWxf
ZHAgKmludGVsX2RwLA0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoH0NCj4gPiA+IMKgfQ0KPiA+ID4g
DQo+ID4gPiAtc3RhdGljIHZvaWQgbG5sX2FscG1fY29uZmlndXJlKHN0cnVjdCBpbnRlbF9kcCAq
aW50ZWxfZHApDQo+ID4gPiArc3RhdGljIHZvaWQgbG5sX2FscG1fY29uZmlndXJlKHN0cnVjdCBp
bnRlbF9kcCAqaW50ZWxfZHAsDQo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0
ZQ0KPiA+ID4gKmNydGNfc3RhdGUpDQo+ID4gPiDCoHsNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBz
dHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYgPSBkcF90b19pOTE1KGludGVsX2RwKTsN
Cj4gPiA+IC3CoMKgwqDCoMKgwqDCoGVudW0gdHJhbnNjb2RlciBjcHVfdHJhbnNjb2RlciA9IGlu
dGVsX2RwLQ0KPiA+ID4gPnBzci50cmFuc2NvZGVyOw0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgZW51
bSB0cmFuc2NvZGVyIGNwdV90cmFuc2NvZGVyID0gY3J0Y19zdGF0ZS0NCj4gPiA+ID5jcHVfdHJh
bnNjb2RlcjsNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqB1MzIgYWxwbV9jdGw7DQo+ID4gPiANCj4g
PiA+IMKgwqDCoMKgwqDCoMKgwqBpZiAoRElTUExBWV9WRVIoZGV2X3ByaXYpIDwgMjAgfHwgKCFp
bnRlbF9kcC0NCj4gPiA+ID4gcHNyLnBzcjJfZW5hYmxlZCAmJg0KPiA+ID4gQEAgLTMyOSwxMiAr
MzMwLDE2IEBAIHN0YXRpYyB2b2lkIGxubF9hbHBtX2NvbmZpZ3VyZShzdHJ1Y3QNCj4gPiA+IGlu
dGVsX2RwDQo+ID4gPiAqaW50ZWxfZHApDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgDQo+ID4gPiBBTFBNX0NUTF9FWFRFTkRFRF9GQVNU
X1dBS0VfVElNRShpbnRlbF9kcC0NCj4gPiA+ID4gYWxwbV9wYXJhbWV0ZXJzLmZhc3Rfd2FrZV9s
aW5lcyk7DQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgfQ0KPiA+ID4gDQo+ID4gPiArwqDCoMKgwqDC
oMKgwqBpZiAoY3J0Y19zdGF0ZS0+aGFzX2xvYmYpDQo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgYWxwbV9jdGwgfD0gQUxQTV9DVExfTE9CRl9FTkFCTEU7DQo+ID4gPiArDQo+
ID4gDQo+ID4gSG93IHlvdSBhcmUgcGxhbm5pbmcgdG8gZGlmZmVyZW50aWF0ZSBiZXR3ZWVuIEFV
WCBXYWtlIGFuZCBBVVggTGVzcw0KPiA+IFdha2UgZm9yIExPQkY/DQo+IA0KPiBMT0JGIGNhbiBi
ZSBlbmFibGVkIGluIGJvdGggYXV4LXdha2Ugb3IgYXV4LWxlc3MgYWxwbS4gU28sIGNoZWNrIGZv
cg0KPiBhdXgtd2FrZSBvciBhdXgtbGVzcyBpcyBub3QgbmVlZGVkLg0KPiBGb3IgYXV4IHdha2Ug
QUxQTV9DVExbIEFMUE0gQVVYIExlc3MgRW5hYmxlIF0gPSAwDQo+IGFuZCBmb3IgYXV4IGxlc3Mg
QUxQTV9DVExbIEFMUE0gQVVYIExlc3MgRW5hYmxlIF0gPSAxLg0KPiBTbywgSSBhbSBwbGFpbmlu
ZyB0byBhZGQgaGFzX2xvYmYgY2hlY2sgYW5kIGVuYWJsZSBpZiBuZWVkZWQgYmVmb3JlDQo+IEFM
UE1fQ1RMIHJlZ2lzdGVyIGlzIGdldHRpbmcgcHJvZ3JhbW1lZC4gRG8geW91IHNlZSBhbnkgaXNz
dWUgaGVyZT8NCg0KTm8sIEkgd2FzIGp1c3Qgd29uZGVyaW5nIHdoeSB0aGlzIGlzIG1pc3Npbmcg
ZnJvbSB5b3VyIHBhdGNoIHNldD8NCg0KQlIsDQoNCkpvdW5pIEjDtmdhbmRlcg0KDQo+IA0KPiBS
ZWdhcmRzLA0KPiBBbmltZXNoDQo+IA0KPiA+IA0KPiA+IEJSLA0KPiA+IA0KPiA+IEpvdW5pIEjD
tmdhbmRlcg0KPiA+IA0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoGFscG1fY3RsIHw9IEFMUE1fQ1RM
X0FMUE1fRU5UUllfQ0hFQ0soaW50ZWxfZHAtDQo+ID4gPiA+IGFscG1fcGFyYW1ldGVycy5jaGVj
a19lbnRyeV9saW5lcyk7DQo+ID4gPiANCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBpbnRlbF9kZV93
cml0ZShkZXZfcHJpdiwgQUxQTV9DVEwoY3B1X3RyYW5zY29kZXIpLA0KPiA+ID4gYWxwbV9jdGwp
Ow0KPiA+ID4gwqB9DQo+ID4gPiANCj4gPiA+IC12b2lkIGludGVsX2FscG1fY29uZmlndXJlKHN0
cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHApDQo+ID4gPiArdm9pZCBpbnRlbF9hbHBtX2NvbmZpZ3Vy
ZShzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwLA0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0
ZQ0KPiA+ID4gKmNydGNfc3RhdGUpDQo+ID4gPiDCoHsNCj4gPiA+IC3CoMKgwqDCoMKgwqDCoGxu
bF9hbHBtX2NvbmZpZ3VyZShpbnRlbF9kcCk7DQo+ID4gPiArwqDCoMKgwqDCoMKgwqBsbmxfYWxw
bV9jb25maWd1cmUoaW50ZWxfZHAsIGNydGNfc3RhdGUpOw0KPiA+ID4gwqB9DQo+ID4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmgNCj4gPiA+
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmgNCj4gPiA+IGluZGV4
IGI5NjAyYjcxZDI4Zi4uYTljYTE5MGRhM2U0IDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmgNCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5oDQo+ID4gPiBAQCAtMTgsNiArMTgsNiBAQCBi
b29sIGludGVsX2FscG1fY29tcHV0ZV9wYXJhbXMoc3RydWN0IGludGVsX2RwDQo+ID4gPiAqaW50
ZWxfZHAsDQo+ID4gPiDCoHZvaWQgaW50ZWxfYWxwbV9jb21wdXRlX2xvYmZfY29uZmlnKHN0cnVj
dCBpbnRlbF9kcCAqaW50ZWxfZHAsDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBpbnRlbF9j
cnRjX3N0YXRlDQo+ID4gPiAqY3J0Y19zdGF0ZSwNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0
IGRybV9jb25uZWN0b3Jfc3RhdGUNCj4gPiA+ICpjb25uX3N0YXRlKTsgLXZvaWQgaW50ZWxfYWxw
bV9jb25maWd1cmUoc3RydWN0IGludGVsX2RwDQo+ID4gPiAqaW50ZWxfZHApOw0KPiA+ID4gLQ0K
PiA+ID4gK3ZvaWQgaW50ZWxfYWxwbV9jb25maWd1cmUoc3RydWN0IGludGVsX2RwICppbnRlbF9k
cCwNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgY29uc3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUNCj4gPiA+ICpjcnRjX3N0YXRlKTsNCj4g
PiA+IMKgI2VuZGlmDQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9wc3IuYw0KPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX3Bzci5jDQo+ID4gPiBpbmRleCBjNGFiMjg5ZGJjMTUuLjRlYjQ1ZGYyMGFkMiAxMDA2NDQN
Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMNCj4g
PiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMNCj4gPiA+
IEBAIC0xNjExLDcgKzE2MTEsNyBAQCBzdGF0aWMgdm9pZCBpbnRlbF9wc3JfZW5hYmxlX3NvdXJj
ZShzdHJ1Y3QNCj4gPiA+IGludGVsX2RwICppbnRlbF9kcCwNCj4gPiA+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIElHTk9SRV9QU1IyX0hX
X1RSQUNLSU5HIDogMCk7DQo+ID4gPiANCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBpZiAoaW50ZWxf
ZHBfaXNfZWRwKGludGVsX2RwKSkNCj4gPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBpbnRlbF9hbHBtX2NvbmZpZ3VyZShpbnRlbF9kcCk7DQo+ID4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgaW50ZWxfYWxwbV9jb25maWd1cmUoaW50ZWxfZHAsIGNydGNfc3RhdGUp
Ow0KPiA+ID4gDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgLyoNCj4gPiA+IMKgwqDCoMKgwqDCoMKg
wqAgKiBXYV8xNjAxMzgzNTQ2OA0KPiANCg0K
