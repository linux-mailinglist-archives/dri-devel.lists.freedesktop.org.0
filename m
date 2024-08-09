Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6E594CD69
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 11:33:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8821310E8BB;
	Fri,  9 Aug 2024 09:33:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dL/tVSxy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A7710E89C;
 Fri,  9 Aug 2024 09:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723196026; x=1754732026;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1GMhRCzjysZk25QA98DQKaUMGMT1bWh82f6/oix1QAY=;
 b=dL/tVSxyk0l0NK+pG5LerDoOvy54B85xY+0ABYvEiJ+AIiLhA0lUimSw
 xG0YslfNvtWwrY3LPEc5TY54vVcC7N7uglf1fVBUOyS8hEbN8AZHDEuLO
 HrK3L3yNypEUo4epsUH6/mkl7DUlnEA0o8wYamxKx2LcPddU2f66trzPB
 UZTPM+yCmo+dd/tknPC6MVrg4uIYfwru2qRnu7dghOc0n/Cfg0p/kQCdJ
 xWK9f6ZAtrG5vwYwFRW2/wpMi8pSzvReZpEqaaiwmAZR0NMcKNdWwOdiO
 1yO0ynA3aJ9SbufBKagqNtPWwK3KwELOkOGm4GvnxIOWVZlNxgdiyeBWs g==;
X-CSE-ConnectionGUID: KnHJqtw+Tt2SgMB9Ob/2pQ==
X-CSE-MsgGUID: +h0EjHmgRxCWIvmAFsYo0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="25130722"
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; d="scan'208";a="25130722"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 02:33:46 -0700
X-CSE-ConnectionGUID: p+jfA6sNS8KBCJZV9gIg5A==
X-CSE-MsgGUID: irNbTZQgThCSiNM2foQ03A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; d="scan'208";a="88149906"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Aug 2024 02:33:45 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 02:33:44 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 02:33:44 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 9 Aug 2024 02:33:44 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 9 Aug 2024 02:33:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nmVARioeEPYMyZwwb3le7r8P/a7Zmm6XhdWoSRkRrK0bykNbWwScqk5HXP5PX7ipRW8p36aZaKxlUYjOCanyDZMamLHhwEGIGphwd20iff3YJVipUzDPAIjznvA2JR/V8yenwRjgRdIYbjCJIj442ZLQnP+zFhyU9avEaq5psnR10NgmeQgzCmXbuwQZn9oytJn0NmJgkfpUbLY6PaI3JaX/eCnBvFbUZOlB/YlfannEWlg5lvsTiWybHeujGABtqv9rcpLEP8Rh1OH9lElxpiBC5SrA+ZmFstyDc1bOPUiOl0z2lsnEzADab7JTZe0jSaRS2hyYSmOe6ERp9tmqaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QB4pswoCBBnFfhTY+Jp41krdgMWuOG+jAW4+QbLKXks=;
 b=ZFnVgMovQN9/vMA94hh5mpYtEoesQJ6xhQyjZXFvQABG3m7/grrZyI/f97E49a632l7kGZO6k5xWD+X5YgCVJCnIYygNnrhiE6OOr9IOcmzGLj2jIMDwokpVe6s2flX818o4CIGWsjuKUeEZzMPN3S1hrnP7D7m4lSjNtjZ3wQZiJY4f77WXLUg0UBB5xYXjYlhJAIX5xAYDiBb7/jHMWWKsu1eOMD0x9fTShRfAlJszDl9q+ErRLvmBnwSY5hZwk+1WXAKfSxyTIQJWNHbFFhouApDOl08IPCpRE60qlHSPzavoIw0TUYIJKSvGUaCfhHO3LDpbVoqrawAyAr/aSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Fri, 9 Aug
 2024 09:33:36 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%3]) with mapi id 15.20.7828.023; Fri, 9 Aug 2024
 09:33:36 +0000
Message-ID: <23dc7824-50cd-4ba3-be5a-df141e8fe69a@intel.com>
Date: Fri, 9 Aug 2024 15:03:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/i915/hwmon: expose fan speed
To: Raag Jadav <raag.jadav@intel.com>, <jani.nikula@linux.intel.com>,
 <joonas.lahtinen@linux.intel.com>, <rodrigo.vivi@intel.com>,
 <tursulin@ursulin.net>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <linux@roeck-us.net>, <andi.shyti@linux.intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <anshuman.gupta@intel.com>, <riana.tauro@intel.com>,
 <ashutosh.dixit@intel.com>, <karthik.poosa@intel.com>,
 <andriy.shevchenko@linux.intel.com>
References: <20240809061525.1368153-1-raag.jadav@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240809061525.1368153-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0057.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::15) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DM4PR11MB5309:EE_
X-MS-Office365-Filtering-Correlation-Id: 847ec8b8-978f-469c-2e10-08dcb85657f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?elhybkRIWXl6WkwzSmlLUTFBZ0hOaVQ3bmhjY3phQnJTTEpSeXREMjlOeisw?=
 =?utf-8?B?RUNBV0RaUHVQbnU0QjhMMmlSV2M5WTdhMWsxa0dibHhJNTdacVg5clNkd3No?=
 =?utf-8?B?aGdGQlhlTWx6d2tVMEF6WHdnQ0x5Q0dqcE1od2VBKzN0alF3aml6UStCbG1x?=
 =?utf-8?B?WW9sWlJLRVRRd3lPak1ISGdEcERkZmxlbTNNZXZoaXh1K2ZVcURiM3NCZ0l2?=
 =?utf-8?B?dndHQzZtSVAxSGxtWWZId1JtTE96aFh1REt1dlNnK0llQWptWXJjVzlSVDFC?=
 =?utf-8?B?Vk5jMVJlMGZacHUyY2Nya21PNmdyOGNVTElESUlaSktRWlJ6WmRzdDVodzRZ?=
 =?utf-8?B?akhsOEpuTEhVZ1dZY2RSNmJJK21aVzNaQnZMQThNOWdGeDhEQUUrWHEwck5R?=
 =?utf-8?B?ZHVkYVhaSy8zcVlSNXBUN3UrYTNoZGZxcFZ1ZDQ1MFpPVCtOUVllbWYwMVNM?=
 =?utf-8?B?MVdLek5HRzE5TUwraTI5KzUzYUY3Qjc5QnI5NlRMTE9jbnRvMVhwdnpsOXJJ?=
 =?utf-8?B?REFOYjRpSzVIZU12Y3VwSUlJa2ZyemJ6YXlGSmNxb1NLUURWd0V2S29Vektz?=
 =?utf-8?B?WWVudjh3SEZnNVhXRjV2QzRPUEEydDJ3SE1yeE1iUHlGNFZMNEdpandWWW5I?=
 =?utf-8?B?YkRlTVF0RzJJS1J5VFRQWWQyc2xWYWR2RjZFNlN5dVdUM2Y3ZE1Mc3dDUSt6?=
 =?utf-8?B?TGlNK3BTTmpjN1lrMWZ4aTdCQUhSUmF2dUd5MXhjUmY2ZVl4cWNyZWlBWXBR?=
 =?utf-8?B?VS9nWFc3ZFZMYnpXMTRPOXE0V2NHSnhuZElJWWtOL1VlOXJML09GMEtmRVNK?=
 =?utf-8?B?eFc4L2JmMm85TWh2eXBwOCs4WnNydDByYjRGek51N0NZZnNTOWZsSHVjcHN0?=
 =?utf-8?B?TC9jYURPMVM0Y1Q2Nm4zOU00RkUzdVhCaGxvTHA1ZmhtMlJybUxzempSY3Uv?=
 =?utf-8?B?emdLQlpLWWk0NXN2dkNmUEpuQTh1WU1wUlI4Q3RIMHBmUEFZL0hiSTJLZVlJ?=
 =?utf-8?B?clVQYThQbWgzOWd3RStNdklNcXZVTWg2WTU5VXh5cHBXckZiSEk0WUUyMUti?=
 =?utf-8?B?UDFiSS85bk44c1Y5cDhJM3djVWhyVGNVcVVrWUZpclc3emJ6QmRjTG5uZU5p?=
 =?utf-8?B?OWRQSmZmaWNTODUvMzZTK1pDMVNmNTFUTjZDdGRpNWFWRmJFdlQ5eE4rQURV?=
 =?utf-8?B?LzBGS2RwZmNEeFRvUGs4ZG55TXVoY1Fpem5jVlRRejBtVkpxU2MvdkJKSjdC?=
 =?utf-8?B?Q2t1KzZ1N1dDU0Q0Mk1xOGpLVGZWMldHZ1VXa0x1b1EweWxKaWZiZkFwNXpB?=
 =?utf-8?B?OGtKZUZHRzdzYnVqNTY0RzEzVmt6SnN2Q1o5bEJoZ2hmaGVRVkgyK3ZiUDVE?=
 =?utf-8?B?K2c0Q2pjV2o5UlhpU2kzV3EyTS9jM0pueGo1YXlzTk0vWHAwYXI0RGRPTWJR?=
 =?utf-8?B?VTJCZEdQYmxXQThLNzZjR0UyczFUODRIbVNJMXM2NlhCOEtTRkYwcjc3dnpR?=
 =?utf-8?B?MUdqdlJ1VVc1Q0MrK2E2d2huTUxkd2kzKytXLzlHZmlwOC8ybDRPbVVEZ1Fa?=
 =?utf-8?B?bHlsZW9TdzZyalJ2alhGdm52MG1QbDczRFlUaTR4V2w0Mmx3UWdVY0czSkZC?=
 =?utf-8?B?cGN5TXhaNTBDbHVnaGgxZy9VRVovcngwdHpmUHlyeE0weGpzRlMzUjR2d0Q2?=
 =?utf-8?B?djBtNVY0WjAwZFZoOVkyNU95OU4yVzdUTmMzemVJa0pHa0ZuTGE3SlVmeElF?=
 =?utf-8?B?blF2VHBnLzZ1aFJEbmxZYndFelB6aVh2dFFrMVJUMUt6dUdWYlpoSGxEQnBM?=
 =?utf-8?B?L1hBQUZJS05qbFI0SmlkUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXQ0MSt5S0F2OEVsOUJRUk42elk2emVzZWxvVCtYd0xLMTRraVdRVEw5Um1V?=
 =?utf-8?B?alBRdnVUajNGeWlWMERTaTBjU2xkRzBaUDB5TjBORWJNR0ZqVDZJczIxcUYx?=
 =?utf-8?B?YzQ0TktNbzA2UU84ai9pQVdDU3NaQXlMRG9Wc1ZNaGtvcVJOalpYZFZmTVRE?=
 =?utf-8?B?dHBaUEhWTEF5MWNuQytmUjk1TDVZNVBoaW9RMEdrelFZZGVYalVlNlVRUGNa?=
 =?utf-8?B?a0RNUlFJNlNndDVEa0MzY3ovVzJqbFhOVWxBTXNKc3Rjdm85b3IwaDk2ZWlQ?=
 =?utf-8?B?MW9LTWF6UlBGRmVmdmpRWkUvVU1PZTZzTkl5RFBDSGMyaWdLS0hPVWJqbWVO?=
 =?utf-8?B?TUVxeHZzMnFBMXJqbVJQSXRHeTRUTS9XaHJKSVExditUbnRmT2hyTWNzOFBY?=
 =?utf-8?B?dlZNYU5FRXQ0MHc1QXRDdVhUM3JXeXJVWG8rRG51OXJ5WXhVVUsxalN5bURJ?=
 =?utf-8?B?M3VuMGhiamhUMVg0V1V1NllpUktaOFZYMXRMN3VXL2FBeUdSYjhkRmgxQlVU?=
 =?utf-8?B?eGNodTh0R3BTcVozaGZnTjNyUllxL29WYUJWNGdJcE84WlUvcHUxcUJHS3pU?=
 =?utf-8?B?NGZrWmVhUXlZNWs0dWpFdDdPY0FIQnRGQ3hFWkJsTHFDdXphYXcwUUovOWMy?=
 =?utf-8?B?S0t1eFRsMzF3NGZIT05xSTM0cU91U2R3WndFVk1hZ0dpS1d3dXNhZHExbkY5?=
 =?utf-8?B?MHIrenFlOUY4SXBRcFgrKzArZVVVK3V6alByUkxQZk1GZG9SMldjRTg2TFRz?=
 =?utf-8?B?UGNIVVNvNGJYVGpGTlE1OGdoNHM1ZFNValNPTVFNK2lwdUZBSUFsRlB3ZzJ6?=
 =?utf-8?B?WWwwcTBMdHRpTHlSbS9mRTVkbG9aUXFGRkZ3b1EvajZmSWtyUlk2NnQ0WlVL?=
 =?utf-8?B?ODZNMEJVckpsR1dhY1VjaXNSalgxNlFFaFBjdHVCUk1IN0NXWi9PYThIc09l?=
 =?utf-8?B?dUVOU0p6K2xqZm5NVnptTU1WMUw3MGEzUnFWYzV3YjdVT0hCdFNrb0hGL082?=
 =?utf-8?B?dnYzdUlOT0w5ajk1YjRGZTA0VURXOTBJaDZ0RVlSdWtpNjFyTE1BcWRnanRG?=
 =?utf-8?B?MTBYRkpBUzQ1cmhEWk5MZ0dXYmdnSFRzUkp6alo5WlBZbGZabE1CdGx3Tzkz?=
 =?utf-8?B?MnMwKzkwMXVSNWRvcHdMSE1XNVdhaS9pN3ZVdkE3SUNrbFhIeFlRR3QwVHpK?=
 =?utf-8?B?SE04dEd2U0Fpc0tHZTdWMXkrR0tXcSt3VTRvTTh0dnBqWmg5RjhVZk9abXh6?=
 =?utf-8?B?ZHlqQlVvNHB0bFJDYVFsUVNPWnlQakVlMzVYY0l0Z1JJcW5sWE02eGMyaVY3?=
 =?utf-8?B?L0RsMDduNzdZQWFHWnp0R1dZY0FaWXNlaTJKRGVkMDZXVmhNMWFBTGc4b2I4?=
 =?utf-8?B?cjBHWjdKc0w0RzU5aXlmSTg4OXBYeFgzYWxkc2x6aWlGSW9sT1kzcUJnN0Z1?=
 =?utf-8?B?NGNKT1l2ZWJlbFp0V0NRZVh5TVlWRE0yMUJxNnNEZVh0UlZSVWhRMnliaElX?=
 =?utf-8?B?NU5jZjZXS3ZtNTVFQWtHKzg3Y3ZkaEF4S0svOXFZV3MyM3pBbDJUZEd3UVBp?=
 =?utf-8?B?L3R3OVBXclhUZzdjRHFvMWM1cmIxZDUxbUJhWFNhMzRyQmx4Mk12VTVXalRH?=
 =?utf-8?B?aXJrVnZGclRzcjc0eXRxYVdVVDNoVGlTSjV3cllSbW81a1N4YjNuTDR3NXB2?=
 =?utf-8?B?ZEo4T0Q0RkNlbFVxcWhIQ0E4SHlRSDl3emlNNGg2a05uN1cycHVNT1dwdm1N?=
 =?utf-8?B?dHVQTThzY0JUMEpaYmtRRVExNmFsUTlhUGpZTXlaQkpSTGNyZGNhd3c3OEJo?=
 =?utf-8?B?bUhkalVUcGZaTGZiWjFWMEZpSy9Db0tGOVhkVzVJUXNzQWovR2RHY1JJejNI?=
 =?utf-8?B?TEFSUVpXNlBmQmlqYUZQTGlPRnJHQmtldmJjanpCWjM4TEN0M2wzV0pxMC9G?=
 =?utf-8?B?NUU3VlFrcUFqRGZ2OHFBZHdGbzZ5L3phWkVkbHdQazhVZ3Q5NnYyMThZUTVk?=
 =?utf-8?B?b29tMExmQ2t5N21CVldiS2lCWHZSQS8vRlRDNjlhdzA2cml6NEw1ODJCci8v?=
 =?utf-8?B?M1pYUzNWUm1VbytOQm5WcnRSQ2hZYnZxeUNTM0hSWHJjVWpVQWVQQ2M0OWR1?=
 =?utf-8?Q?HNVyPxjTcXF+QtQpN++jd4Sua?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 847ec8b8-978f-469c-2e10-08dcb85657f1
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 09:33:36.5032 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kCtGrsfn7cPFGfxl7jFFNzek8Ea89LnUrCSxYqfbRpdqsBhBm1u/no/HmUZR+5vgmIr94FV5yNW/cmB3yau99A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5309
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



On 09-08-2024 11:45, Raag Jadav wrote:
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
> v2:
> - Add mutex protection
> - Handle overflow
> - Add ABI documentation
> - Aesthetic adjustments (Riana)
> 
> v3:
> - Declare rotations as "long" and drop redundant casting
> - Change date and version in ABI documentation
> - Add commenter name in changelog (Riana)
> 
> v4:
> - Fix wakeref leak
> - Drop switch case and simplify hwm_fan_xx() (Andi)
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   .../ABI/testing/sysfs-driver-intel-i915-hwmon |  8 ++
>   drivers/gpu/drm/i915/gt/intel_gt_regs.h       |  2 +
>   drivers/gpu/drm/i915/i915_hwmon.c             | 81 +++++++++++++++++++
>   3 files changed, 91 insertions(+)
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
Why November?
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
> index 49db3e09826c..bafa5a11ed0f 100644
> --- a/drivers/gpu/drm/i915/i915_hwmon.c
> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> @@ -36,6 +36,7 @@ struct hwm_reg {
>   	i915_reg_t pkg_rapl_limit;
>   	i915_reg_t energy_status_all;
>   	i915_reg_t energy_status_tile;
> +	i915_reg_t fan_speed;
>   };
>   
>   struct hwm_energy_info {
> @@ -43,11 +44,17 @@ struct hwm_energy_info {
>   	long accum_energy;			/* Accumulated energy for energy1_input */
>   };
>   
> +struct hwm_fan_info {
> +	u32 reg_val_prev;
> +	u32 time_prev;
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
> @@ -276,6 +283,7 @@ static const struct hwmon_channel_info * const hwm_info[] = {
>   	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
>   	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT),
>   	HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT),
> +	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
>   	NULL
>   };
>   
> @@ -613,6 +621,63 @@ hwm_curr_write(struct hwm_drvdata *ddat, u32 attr, long val)
>   	}
>   }
>   
> +static umode_t
> +hwm_fan_is_visible(const struct hwm_drvdata *ddat, u32 attr)
> +{
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +
> +	return attr == hwmon_fan_input &&
> +	       i915_mmio_reg_valid(hwmon->rg.fan_speed) ? 0444 : 0;
> +}
> +
> +static int
> +hwm_fan_read(struct hwm_drvdata *ddat, u32 attr, long *val)
> +{
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +	struct hwm_fan_info *fi = &ddat->fi;
> +	u32 reg_val, pulses, time, time_now;
> +	intel_wakeref_t wakeref;
> +	long rotations;
> +	int ret = 0;
> +
> +	if (attr != hwmon_fan_input)
> +		return -EOPNOTSUPP;
Using a switch case in rev3 is more logical here. It will also simplify 
adding more fan attributes in the future. This is why switch cases are 
used in other parts of the file.

Regards,
Badal
> +
> +	wakeref = intel_runtime_pm_get(ddat->uncore->rpm);
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	reg_val = intel_uncore_read(ddat->uncore, hwmon->rg.fan_speed);
> +	time_now = jiffies_to_msecs(jiffies);
> +
> +	/* Handle overflow */
> +	if (reg_val >= fi->reg_val_prev)
> +		pulses = reg_val - fi->reg_val_prev;
> +	else
> +		pulses = UINT_MAX - fi->reg_val_prev + reg_val;
> +
> +	/*
> +	 * HW register value is accumulated count of pulses from
> +	 * PWM fan with the scale of 2 pulses per rotation.
> +	 */
> +	rotations = pulses >> 1;
> +	time = time_now - fi->time_prev;
> +
> +	if (unlikely(!time)) {
> +		ret = -EAGAIN;
> +		goto exit;
> +	}
> +
> +	/* Convert to minutes for calculating RPM */
> +	*val = DIV_ROUND_UP(rotations * (60 * MSEC_PER_SEC), time);
> +
> +	fi->reg_val_prev = reg_val;
> +	fi->time_prev = time_now;
> +exit:
> +	mutex_unlock(&hwmon->hwmon_lock);
> +	intel_runtime_pm_put(ddat->uncore->rpm, wakeref);
> +	return ret;
> +}
> +
>   static umode_t
>   hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   	       u32 attr, int channel)
> @@ -628,6 +693,8 @@ hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   		return hwm_energy_is_visible(ddat, attr);
>   	case hwmon_curr:
>   		return hwm_curr_is_visible(ddat, attr);
> +	case hwmon_fan:
> +		return hwm_fan_is_visible(ddat, attr);
>   	default:
>   		return 0;
>   	}
> @@ -648,6 +715,8 @@ hwm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   		return hwm_energy_read(ddat, attr, val);
>   	case hwmon_curr:
>   		return hwm_curr_read(ddat, attr, val);
> +	case hwmon_fan:
> +		return hwm_fan_read(ddat, attr, val);
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> @@ -739,12 +808,14 @@ hwm_get_preregistration_info(struct drm_i915_private *i915)
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
> @@ -755,6 +826,16 @@ hwm_get_preregistration_info(struct drm_i915_private *i915)
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
> +			ddat->fi.time_prev = jiffies_to_msecs(jiffies);
> +		}
>   	}
>   
>   	hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
