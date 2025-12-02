Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3324C9A5B2
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 07:43:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2D0A10E5D2;
	Tue,  2 Dec 2025 06:43:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RzFL1rYc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2180010E5D1;
 Tue,  2 Dec 2025 06:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764657779; x=1796193779;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=F+fizJQDVJtAVJw6qiGyPaG9LpFyjZqpdFoAJsueIi8=;
 b=RzFL1rYc0P+Kf4rJq6W8nIrjJUEuYculU0lnwNyBhxOcnIZCe0sTIzXZ
 xuDuyZ/+PTRc+hNmheQTKIdvSkous5D31WwY7E4dPR8zlAmREPijicOgB
 DP42OzBR+WAXstizRwwr2nJ0W5aDsWTo2XiOANLVB6U9xACCd8wr04RGr
 uWZuvajr/dQWotHpvjbttEJjiO1Q3khYHHv/hsoolgE7z7Dei02Uez88G
 yl94GTjGDVJjkz3skx7NtHCCxRwuHdFGfx7Cpp9QTT1V4v4tGgsOdJ/xg
 gi9kN47v1BTngWTBgCFGAb2YTyTTyhjqEnuStmV9zA/iJsEpwd1HPdvKq w==;
X-CSE-ConnectionGUID: r3GaEDZ5QEOmnPqTtX34qg==
X-CSE-MsgGUID: 8wa8wxQ6SuaxVAFpF9XI6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66653108"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="66653108"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 22:42:59 -0800
X-CSE-ConnectionGUID: uLnJMV1NQ32i2AQ2Hl7AQw==
X-CSE-MsgGUID: ePuVVhEkQpqGmu2BjAZ/Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="194506297"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 22:42:58 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 22:42:57 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 22:42:57 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.20)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 22:42:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w8M8wK5M+gFCSu6afpDa0tf4bSYqji34SabTxEc5p9asZagJIGxUNUZg/l6HmkSOevHqjh0u9H2WgW/axbAkxc1/LTnMAZujt0RRNko2kmFcSZy6ZOyfQsChYC/+L9Q34bE7pflaa0imIBBDcevhRoh0RpJL+W4E2MczrVta2JNUlissplqfeIf7SbVpmH8uQUW+942iNreKpbGqKnJRObnfhGKwgP76LCRwFdNS8aFYBwgb5BdMMCI0hlY/0p+I5+Ds5YM6Lux1Tcb9jYYVSfQ8UqzH2bNO/SbOCE8QRdDVIyJpaXCZy1i8ot1PnaOC0zkX0Jk5/S7MfA+gjkd72A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hVlqhEtGU7bD9hEgaepw5mz+0mopvs4YdMRZEyiT6mY=;
 b=QBEeXCoPf7qXBbVjIMPIA//HMm2IdF5QMN7fW+ZB9YiN8cSUD19JB5Lnlt6lAJLYcSmvK20LmIvNpZzuK+lG/z9N55lVkfkpVX7PCbAWkDcaL/gIFNsAoA8M/wIFBLYi0AClEcpEm3mBw3gUNCq8YrBOv6XjYdeHX6DohyPz/EWGB9qCcl3v8m1V6EmUFgGq3O13BFlXxi/Xqair1awP+eI5Vp6CQbqQl8J2sE5QiZl+r9OfNmKmj//CY+azFFEtqhLS49jPWlS23ptaF24bHefFTyNWld3O7QuRN2Ww018ccMwjfELamu5r3/ULJ9UsXbYmoujbTXsmI6sMY1PEyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH7PR11MB6031.namprd11.prod.outlook.com (2603:10b6:510:1d2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 06:42:55 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 06:42:55 +0000
Date: Mon, 1 Dec 2025 22:42:50 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v7 8/9] drm/xe: Disable timestamp WA on VFs
Message-ID: <aS6KauZxwYKZBmoU@soc-5CG1426VCC.clients.intel.com>
References: <20251201183954.852637-1-matthew.brost@intel.com>
 <20251201183954.852637-9-matthew.brost@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251201183954.852637-9-matthew.brost@intel.com>
X-ClientProxiedBy: MW4PR03CA0032.namprd03.prod.outlook.com
 (2603:10b6:303:8e::7) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH7PR11MB6031:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a01eabb-6de6-4491-87da-08de316e062a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WFV3VE9JMjZ6VE45UmZEdCszbTFrenZ5eDlUTW11bXhNOGlwTGxIWjlpV01R?=
 =?utf-8?B?RFY5aUU2K0REZEdOdFJJNVNoeS9iUkVnSTJiQXlXcU5NTUhtR0pFa0dSMWlu?=
 =?utf-8?B?eEdObGthclJIUzcrVlhyRnZRUmhBT2h4SHFrZVBneWp0TDN2ZEozdXJCODQx?=
 =?utf-8?B?V2VMV3RjbmdMNWI2Y2M4dVBpd1ArbS81UCtTU0IraWNDTkpPT3V4VDhLcFpV?=
 =?utf-8?B?QlhYMFFQVE8rUkdmcU1HbWJIZ2JXczBPTDJCVmgwY0NNZXJKZ2c3M1dpYTJO?=
 =?utf-8?B?UThtNkQzZElZUVdUNGJKeGovYnVDVklkaVF5eVlEWkcxSy9TUTFUS0p0RDJE?=
 =?utf-8?B?Ymh2WEFvL2tJaVh5S2Jqa0lUeFA4TkYxUDlJYUUyUkVCNUFlQWlYQzdDTG0r?=
 =?utf-8?B?TlhjUHlSU0tHWGhEb3poWk5vUW9GaGtiaXdHTG4rL3Y0M2Z0QWZpWE1nL0Zl?=
 =?utf-8?B?amlQUDNPRU5YbHRIaFQ1NXpYT3ZabEZzaTFFeGdkaFVOU1RFR0tjQkFBNTh2?=
 =?utf-8?B?bHE2eXYvRStDRFdNSHZvWHVydkJHK0c3d0ZBRGxIclRuNFVVT0NmTWhnb3lz?=
 =?utf-8?B?ak4zWUNDVlZKUUtVRHhtTkR1MEgwSDVYRmJlK2tpYld1dkFkUER0dzBwdEEy?=
 =?utf-8?B?eGNGdDRZSGNJaE9YbjA1QmMvK050T1BscXhZbW1NN2hzVnNCVFdmczVvTEtL?=
 =?utf-8?B?RjZacmJ3dkU4YlpaRUVLdnB0UHl0dFRnS2E3TGlQRkg2NjE4QTg3NmF1WWlS?=
 =?utf-8?B?aHhWZTNnT3BmZWtmcGhPMlFYZFhjaGZDZWVNQzd6NkZ1bG9aK2F1ckYwdFhv?=
 =?utf-8?B?blJlemIwUTdKb2pCbjh1bTZLam5SajBseTQyM0JFVWRmM3h4S2IxNjZHdDYy?=
 =?utf-8?B?dFRHQnA3WGlTb3lmbzVyMnZmSVNtajI2Q28wbEFWdnNySFh6dFpuVXBCb2RV?=
 =?utf-8?B?QzJyQ2Y3a2xVb3pzZ0U3TzM5K3hrTjI3OU9qeEF2QjNFaEhNTlhacmFQQjh5?=
 =?utf-8?B?ak5WaEhoQWxKbUhHT1hJeVF5Zk44bWFNaWlmb2pnM205aVlxNlFXRGluWGEx?=
 =?utf-8?B?akRDN0tJVTBjVWlNVTZIYWpmM2U2NmRySFJVMlU3QTBSTHlsWHpzL0owWHFw?=
 =?utf-8?B?cTVMNDRmVENqTzJhbW5ENmsvU0E4Y3BLZy84OXRpcUE3YnpaS0RPMlhOSGI5?=
 =?utf-8?B?cTROWXZUbERWSnhCVmZOVmZ0YzBldStGOGhiRk1tZy8xbGZCcW5DY3N5ck9q?=
 =?utf-8?B?eno4eWRJeHRMcHphYmhQNTlWZWFSYVBNZjkyUG1ibmpFaWIybE1yenl4Vi9U?=
 =?utf-8?B?K01pZlhRUWhlK1RuVGJCemhucENNVUR2cmlKRi8zNHpEUEk4Zng4MURKcmY5?=
 =?utf-8?B?NlhzbCs3TFk5RE8wNHpBMHkxaVM1ZWxqTVF4Z1loTlBmSUgxOUY5QjZzMXRo?=
 =?utf-8?B?OW9sRlQ3Zy8xQmM1QjkyK0xCQnIxTmxpSVFLZ1NWamZVSnVWTXY1RG5iRFNh?=
 =?utf-8?B?Zks0SGFmRERLdTZmbk9nU3hjdXl0N1NjWGs2T1NEQ3dUM3ZwUXdEUzc0eVFU?=
 =?utf-8?B?R1dkam5URHRMSm00dlBXZlFhTkpmK0ZMZy9CdzQ1TVdxQ0hFQjJ5YnlBNTNi?=
 =?utf-8?B?aTdYdUJGUUlOYk10RDFJQ0hlV08xalN4cmswRlVRRE43V09LY21YcVBZeHBN?=
 =?utf-8?B?NlZ3VXpEVTliTC9hOGRRY3JVc2JZcytpT2xIb0ZlRm1qUWpObVZwWVhQMERV?=
 =?utf-8?B?RFJWVlRSRnFZZ0dEM0dzbGdjSHN2bnlCcnQ5Nko3b0xZakphSHZzU1R6eEpQ?=
 =?utf-8?B?dmM0M0hYSWllVGdxUjZPcDNtWVZxYTA3dzRGTnR3N2o5YXZRY00zRlRPRkQy?=
 =?utf-8?B?UWhhbmNqVUc2R1p3bWZuWFhNM0xOb2lLa29BZWhpOGR0Rnp3RjJndE5oZ01N?=
 =?utf-8?Q?kTlSafsI0Q7LJ+Hgv/Nu0HJzs4Lvr943?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGdBai9TNkJVRk0wNGk0SDFLODNGV2Z3ZUFuR0c3V2hta3d4ZEZqQUR3OUsr?=
 =?utf-8?B?a3JlY2ZNOUdkRTFYSTVhQkp0VENaeStrTmgzWElHMFkwbndRa2UzQmpZS2Zn?=
 =?utf-8?B?NHQyZExyeVd6UVZMSFE0UW9hT2FvdzczV0o1cC9aV2pvZzlidnc3UXc5MnVi?=
 =?utf-8?B?ek1vVlBNQzMxZWoxcDFqN25VQkIxRE50UmwwTDhaei9PRE5kcFpLRkJqT1NO?=
 =?utf-8?B?VFRjS3JrcHQremJleWdJdFJraDEvUkE0Z2hlemlOMldscE8vRTg1VGhIRXJp?=
 =?utf-8?B?M25sOHRwREJkanVocVcra21scTAxRFlLbXE0NENkUFg0Q1pPOHdCVXJURE5n?=
 =?utf-8?B?eGpnODlaNXpDbFpLQTd0cFdiZnhybWJSbU5ZQUZtVUE2dVZDK0p5dWx3N08w?=
 =?utf-8?B?TE9MRS9iQTVDVlpFWWs1QnRhWmVVZmU1R2NyM1ZoRERDeW0wVHdaeGZsUUxy?=
 =?utf-8?B?aGo2TXc2QkU3VElBV01UOE41V2lzdTVXNWpScmlWM1RUajcyNytzQnFrVlFp?=
 =?utf-8?B?L0dSdGRLUE5GUVZqWGdUODk2ZWs0UERubGVxM2tHa0tEeTBsb0pTMXdNNTZv?=
 =?utf-8?B?WjZOS0xlQWJHU2FiclN1SXJHY1RQek9CSm5xMDhscTNLckJwei8wWkVsVjIz?=
 =?utf-8?B?UDBYb2xqY2FyczZ4RzQ1Yk1lREcyVlVZdDVJRENPS3VXOFZ5NDZBSzcyM3N1?=
 =?utf-8?B?cEFPODBPTk9XeVRTYTREbVYzc2h3Nks1TktTRmRXdjNvclpVQkpVRGYyNnJY?=
 =?utf-8?B?NzVTbmhLLzRYMis1Wi95VXVLem1BQ1dqa0tUYlJWT1A1NmFtSWRZbnBMZzVZ?=
 =?utf-8?B?V1M5LzFjS2oyZGgwNTI2K2tvVzdscy85a1UyeUh2Z1Boa1A3NHdpZUZFVzJN?=
 =?utf-8?B?L05QcktBdHhCOW0rNVVJZG9uVnRxN0JQVzBYL0VsREhZRjNsTm9QRjhJOTZj?=
 =?utf-8?B?ZTNYMGQ5VktjdDJDWmxHYkN1NzVySHFFRGMvL2RTRjZ1VkwvUW5Tb3BpSlMy?=
 =?utf-8?B?UFNpb1pvbi9Qd1g1ajhmbk1MTUFpRFV4WitSQWcrNHlsNEFQWHEzcUpONllo?=
 =?utf-8?B?ZEVyQ25ta1kwWCtpR1ZBSklFcVcxZnlSR3dTcThzQzhPRnJnemp3aUlHZ3Qz?=
 =?utf-8?B?Z0xSK2hDd0dmYTlHNVhaNGpqcXI1UmpWTXZKU3M1NjRIUUtZbk5WbEl1bit2?=
 =?utf-8?B?cWZzK0pLWHB5VDVKaUd0Wm9MS0VsRjRnMkE2cmJpTlpjMjBTZDNBSzZ2ZEdz?=
 =?utf-8?B?Mzd0eVp0Q2hZSzQ2NFdqZThxejlqcHQ5THhVUkNrcExtYnQ5VUNSeWtjdmEz?=
 =?utf-8?B?ZTFQNHducGFGN2MyUjBNblNOclFyeXJjLytSSnlHQmUvLzdFWTNUaHQxd2gw?=
 =?utf-8?B?VUZkNDlPQURHNFpvc3V2VktWdm8rQ2ZINHhKZ1JsL1BvYTNIZFVxeTVWRUdT?=
 =?utf-8?B?Q3JKOFo2YmFERHFoR2hZVHZ3WjFDUC85U3k5bDNBdStmWFgvbzJrS2tLaHZU?=
 =?utf-8?B?bGVPN1BNMFlERjZUY3E0Yk1CWHZsOWlZWURvNnVUbkN6VkNMRGxpWVhpK1hO?=
 =?utf-8?B?T0c3VTdyaE9jN0dTTlRNZFUvMCtSMEdtQjNkQjJkcnc2NUw0M0oyY0dKbEY2?=
 =?utf-8?B?TmlsSFozQ1hackxITjJWOGtvOHZJM3lRQytUQmtnS0ppL1dRS09EQ21SVDdh?=
 =?utf-8?B?QjgvbTV4RktaMlNqRGlxSVpoOWpYaGVDUGxlOGZFTDhENUU3UjNLV2owT1hH?=
 =?utf-8?B?OWhZT2NwMHZyYnFnMW16akI2U09KelhmdlM0czk3clppL3VwZTJTeWZDUUJR?=
 =?utf-8?B?ZjJHWVNxV1ZaeG5OdVdIYmlBK3R0WUsvRzlIc2pmeG0xbUVoNWU0TkZUWFBv?=
 =?utf-8?B?WnBiRVg4V2ZmeUlnd0lrQkxHNG5pNlRidzdZNmt6bDhVdzBzT0xRMy9BNFBS?=
 =?utf-8?B?cUdTOXlkQ1l4N2JwWDdXS1h1SmFBVmprYmZ2eTRHaGVaMklmWEU0N0tUdGw4?=
 =?utf-8?B?cFZTaFFza2d4UFIvOHpYbGpPRzgzdVE0RStjRXBUVlJtSUZGN0Y1ejN2cTI0?=
 =?utf-8?B?VFU2Y2ZyZXRlL29lOW9hZzJmM1RxRHJrVmJvaS92c0VwS3lQUlVjTUY5MzRp?=
 =?utf-8?B?cEYzSU9zdEMrbW1hVmlXWVZrSU5YVmtYQmx4Ry9iRVBWdk05Qk1TazVDTTNN?=
 =?utf-8?Q?zIkWQ4B/biIJh0XV4S8IWF0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a01eabb-6de6-4491-87da-08de316e062a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 06:42:55.4725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lvD9BLwh/9tFrRae5FLBRaxTHefvU51xB+S+uHysQ30HrYZ3snBXkU8MgZaUh/ckJywC6D2wQC5LnMFC2fi3d/8EJr18PYxG43YlnvcDmcA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6031
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

On Mon, Dec 01, 2025 at 10:39:53AM -0800, Matthew Brost wrote:
>The timestamp WA does not work on a VF because it requires reading MMIO
>registers, which are inaccessible on a VF. This timestamp WA confuses
>LRC sampling on a VF during TDR, as the LRC timestamp would always read
>as 1 for any active context. Disable the timestamp WA on VFs to avoid
>this confusion.
>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Thanks for fixing this.

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

I think this needs a Fixes tag.

Fixes: 617d824c5323 ("drm/xe: Add WA BB to capture active context utilization")

This patch may not easily backport since functions are renamed later in 
a refactor. May need to be manually sent to stable or needs Maintainer's 
inputs.

Regards,
Umesh


>---
> drivers/gpu/drm/xe/xe_lrc.c | 3 +++
> 1 file changed, 3 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index a05060f75e7e..166353455f8f 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -1063,6 +1063,9 @@ static ssize_t setup_utilization_wa(struct xe_lrc *lrc,
> {
> 	u32 *cmd = batch;
>
>+	if (IS_SRIOV_VF(gt_to_xe(lrc->gt)))
>+		return 0;
>+
> 	if (xe_gt_WARN_ON(lrc->gt, max_len < 12))
> 		return -ENOSPC;
>
>-- 
>2.34.1
>
