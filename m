Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D30A692E3AC
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 11:43:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9788C10E9F1;
	Thu, 11 Jul 2024 09:43:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jWmKNfM8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC92A10E9EF;
 Thu, 11 Jul 2024 09:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720691009; x=1752227009;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vO2gvhCGBQM2i1+IQ4wiIZ0WT6c/6Y2NNj+ixbpJZ5Q=;
 b=jWmKNfM8mgqBc04KxWDRDVaLCA5/E7DU8h87d7VGzcx/lxE3fYdzJrCM
 iv006o2fcLAVYufXRyZNi+XYsTYGeiaAXhR1KX6Oi4OfSN7hIiWqvwVgw
 eCgk5F9Z3f1nm1/AQ/Gp2h+1VoKcwGk2R8d7Zuumwqk3kjqXdVwF5daFR
 FT5+e+xcxc29CFZJdhuBQCpTkotVxVGVWNIWZH0JmoL1ezqTCl89P/fS3
 3v1FIZre8qGzJSwH3SKH3NpILLnyey9lsUd3MGULatyJDCQzwNwVK48nh
 RssHDzsZ5opHxaoaz2IssOipie5ciDwoZ3NZIhRx4oWDRAn5n7TT/Dd1h g==;
X-CSE-ConnectionGUID: vxw1YLNVT9O2oIZ9PfXCNw==
X-CSE-MsgGUID: Zw0hMbXESEWXPWCBmg/NPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="21875526"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="21875526"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 02:43:29 -0700
X-CSE-ConnectionGUID: d3suYLhhSnO5RHfg8rrsEw==
X-CSE-MsgGUID: rrOvorsfS++edqNapBGbUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="48496493"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 02:43:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 02:43:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 02:43:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 02:43:27 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 02:43:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dk4YtrjdhokE2nRkiF6ZbYqhi4zzBTum/TXXVQ5+4bXpmRPWwv6RpTqGgZ4TfxcHnEGEFFk3bRiABRuG/OURh4pleNjwAxb5TVNacKoP+ue+wCAHEsg5GHB6kaifuIUsQHKqdJE3Et+Zso5VL0rln3X3OS9kTR9mo8tDE+fuMq/c4VSfNjdhlsUEJycGpXNIOE2GEfQMXBM+u8QAGgTHhWGWOFGPkE+bnEjpihsV9228qYcKaQnbcK8/6Jx/UZUfC9Get7zQMOPJ6qZqfyHhi4Kdq13MIHOxbz8VPUw14jwdtcVBBg94aqykNP0STfQI3MmSeyuSo1RcI5mfHrpXbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jHfT5+4r8AHRyQVRbeG88Z2mxB3c43Nzdm+JuNlI63w=;
 b=s3oLwrV8Wlx9aTEONE7cb0BrgH6WJf3+U95Ju4ozspyGkjNOuALxWzSXt+Vrtzx/+oNmq02iDWYZ+iJa2BMc1/Do6kqnTc8DgiuZkbEIWbagWv0n71On/G7+VTq1SH38aAW+HiI+rqimbQNh/8eliHP8WYHKArxNU6o6G5UaFdiJXVI6XjVCZ6bf42SLYzTHQzkNevU70djK1a4l9mz93//cLIpKNC21rp2Du9lqqDgqsz0+DyFEfqhpJHZKmCoC3j5lcJP8u/3JFXX/0pNtcIyud8DvQQ4NxymLp1MuxoO23H6YgmHYe+sUd87w8V7L20shz663tc1k4GXeBvDIyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by IA0PR11MB7934.namprd11.prod.outlook.com (2603:10b6:208:40d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Thu, 11 Jul
 2024 09:43:24 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%6]) with mapi id 15.20.7762.016; Thu, 11 Jul 2024
 09:43:24 +0000
Message-ID: <fb32686f-854c-491e-9669-e9c61ceffd05@intel.com>
Date: Thu, 11 Jul 2024 15:13:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] drm/dp: Add helper to dump an LTTPR PHY descriptor
To: Imre Deak <imre.deak@intel.com>, <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
References: <20240708190029.271247-1-imre.deak@intel.com>
 <20240708190029.271247-6-imre.deak@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240708190029.271247-6-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0007.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::18) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|IA0PR11MB7934:EE_
X-MS-Office365-Filtering-Correlation-Id: 233947eb-0e46-4891-75db-08dca18de885
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MUF1cXh6TXNEcmR2Zk52RnlrNVBwV2Y2Kzl4VzNlcmN0WlJJSnowajE5ZEtW?=
 =?utf-8?B?N1BMeFpVUy93VldBOW9FRndiUC9qUFdkUldaVkhRd200a0U1TjRjODhXM0NK?=
 =?utf-8?B?KzVucEt2N2lMajhDSTJoNkhSeittTmRTYklEcG9FNm1xdTZnMFlOV1h3cXEr?=
 =?utf-8?B?Q0JWenZRdmdnU2l1a3BOcS9IbHlJVC9jQU1kUDVuOU5idVlUTGxBcTFhbFhC?=
 =?utf-8?B?OEhYQ1pERlFCTFBocG5TSUFqRnBITUVkdGxrakZNUkhtQW5SMCtpbXFGcFNN?=
 =?utf-8?B?QkUxRDFsYnZpaTFNUFU3OGtKZ1NxbExVZWtWSFpjTjVpeDlUZmVFZ3drNTdI?=
 =?utf-8?B?RDhpTzJYc29PUzBBTE1zQ3ZiYm1yeUdYYytLdkJKOEtzV1pkMVQza0ZUMmFy?=
 =?utf-8?B?YzRrQkNhQjR6ZGwwa0piOXBKYnMvc1VacmJ0UUZxdXQ2UnhscEJvU1RRMG41?=
 =?utf-8?B?b1RCV21jVE81RUdEQ3A4OHJiTktGOFNheXN3amkxR3RDeG5WbTdKV3ZNQXpq?=
 =?utf-8?B?R2NWMFpXZmdsWm1lSUd3VXVhT3dGQlR1Z2c2OTgwdDdXTUxqSitTMWF6cENL?=
 =?utf-8?B?eTZDb1NwOHRCbkw0V2pLMk0wUmlHOTVMUEx2TWxEYmJJaGpEZTFNMUVQaWoy?=
 =?utf-8?B?WFpNQ2JQMkZjai8rL1hvWDlWRzRkV3A5MmtJM2U0eG1NNG9aT1N1cHdFNCtY?=
 =?utf-8?B?TDh1S0lkSWNFWWtmdmR6T1hob0tyQm5POU9VY21oK1pYSzc4N05PemttWitF?=
 =?utf-8?B?OTRWSkM5YU9WVVIyMlorUGdnbzJudHlFOXRWR1pzZ1lBeFQ2Rm5ZdnBvK3N4?=
 =?utf-8?B?a2ZkcHZmbHFYUTIvZklSVjVLTWFGYWM5VXExWkYrU1BZR0ZHQXNuL2dvRlY5?=
 =?utf-8?B?MXc1b0ZGckZ6WGt1MW9TRlJNSVBERWVaa1Bna00rdEUzU05vUEhMVXZqV1pn?=
 =?utf-8?B?ZGlYRk1tVzBLYk82cS92V0E2dGVGWTRsVE1kdGZJbXRMYmh5d2k1RzFGc0lV?=
 =?utf-8?B?bzQvVlNHbEMrZlBNSFhLalRGZ1B4ZnVNdFpRU3hRZjFiZTBJTkQ1SndpMGlw?=
 =?utf-8?B?a3F5WXVDRW93TU1WSGpxWVFUWld2NldlTENud243RXBjOENLUkdNRThzUWUx?=
 =?utf-8?B?em9RSFBjYkdSZW5RbFlvR2U4c0FFMkdrWHg0bW5FNURYYWNNSSt6MWl3bFlo?=
 =?utf-8?B?TzgzNGZubTRXZ1Z3cm1nS1VlWitGcjRwL2V2Ui9KbUVyVzNhaWQ0aE8wNkND?=
 =?utf-8?B?bVpEdk5nYWZqcWRiM0xzT3U0dWlDaVhFNm9RTno0ZXFsbkpxeDFjRzZ6RjQx?=
 =?utf-8?B?Y0JmVVdTNTlXbXJSZTE3QzlZdHZ6MXVDL1lZNy9DUEExNUx2dXIwRy81YnNW?=
 =?utf-8?B?bDBmRGdsUHQzcXdHanVJWTlsUlVZYitIMWNpZE5iOGlOY0NJdDl6UHpEVU55?=
 =?utf-8?B?MHR1MjYxbWVlUGtDN0FWWjhYeDVSWE9aSVZRQWplMGFIQ1BLUXcrY2UzMlJC?=
 =?utf-8?B?ZWlSUnZoZ0xEaFZtWGtMK3JrclhYaDFiSlJVYk1zTWlGeS90Y2tWYmV1cStN?=
 =?utf-8?B?RlkwSHkyZXdOSm9ZYXBqUEo2SXBxY3FpTTJVZ3VIdVRSWlBMWkc1WHhFM2ZG?=
 =?utf-8?B?SHIyYklPZ2lqNnh5aDV6QkIwUG1FZkZxSVhyMGROZWhFdHBSRHFkWm90V2hr?=
 =?utf-8?B?eDBGVHdueHUzaC9aUlA4Q2xBdC9ldVVmMVFEVUdERUhUUEpsRlBDazF2WU1R?=
 =?utf-8?Q?yznKyiQY+wMtbj3u3w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2tneVBna1AwV1VSNFhLMjRxQkp5cmtPYlJ5U3NRSnFsV0thZDdFVm1ic0tr?=
 =?utf-8?B?ZnFIa0trRUlRTU9TRURpQng4eDViUVVrL1BrcURSM2VQcWVES1pFdWp5MGEz?=
 =?utf-8?B?RGpnOVg1VWxnS3RPY2p4WVVmVWFFS0lXeU91Y3JINVZCSnFqTWtVU0lhWXhJ?=
 =?utf-8?B?VjN6bytaTm9rRFdyMnF1SC9CTEFZczNMY3lGazRVS2s2UGxkTCtuVlFURDBy?=
 =?utf-8?B?M21yeXdCbitkUTE5OU5UeGhYRjRFeDlTbnFaeDNkeGJGUS9sQmV6ZjdSY0w0?=
 =?utf-8?B?UG96WjZBY0ZrT0xBS1VQdWEycHRRdC9oNGo5V0JqMGNMdFdYNjIwMlBTWjB0?=
 =?utf-8?B?dHJBdGhBQUFuNEpsclRVUmdzVjJJSnYzbTA1ZEdoT05qWVRsM3BhZmZxaDdM?=
 =?utf-8?B?aGp0N3I1ZGI1SklqSllsdmU4QlN5TEpBWW80VThWTmVyNDlhUk1uNHVoNFRn?=
 =?utf-8?B?cyttMFFtZWlCckh6ZHg1R0dsSFJWYlF0bXgrOUtrbEYyYk83OWx1UnNCNDVS?=
 =?utf-8?B?aVpHZmcwMTVKWUh6OSsweXdpa2tzendvZFJsT0FZSkhiVXZZRVQ5Y3J5TWZB?=
 =?utf-8?B?K0ovbHI1SVhwOU5tUTJic3pVYXJtR0d2R1k5Yys0amorZ0N6T1BzN0EyQktZ?=
 =?utf-8?B?TGRjZGovaVJsejFuRENJSEhSWHhDNElwM2h1dXI0WU5LMWdhazdqaVVtZmRt?=
 =?utf-8?B?RzUxNldpQXQrSUlFTGZLbW9CYWlVMFlITTg2RmhSazZ4b0pNSGRBQ2tpRThx?=
 =?utf-8?B?MmpweGtWTGFHcjVuMGROZ0E2OEo0aFNhLzduZ25aWkJzdEt0dGlUMmtpbVhN?=
 =?utf-8?B?bVM5Z1hXRnRUQndNZFgxTlkreXFWeHBpdXFCWWlhdE1QekxlY1ZRdUF1TXBn?=
 =?utf-8?B?MVo5TSsycWtML3BsdG1MSnFnQnUwQjN2ZUJHank4c09xV0hiT0pRYjJ1dlhH?=
 =?utf-8?B?ZkpDOEJkTHRuU0hMYW9DbDJ6Ui9tc1M0dldieGlPNHVzTDdRMHRQbm5NVldN?=
 =?utf-8?B?b0dkTE5wOUJmVUlVa05jdElMVm9hRy8va2wwUXpmMTd0OW5kSGU1QktBM0o4?=
 =?utf-8?B?d1JVTDlZNkpEN3ZDays0S1d2UDd2LysxYmZPWEF3anRZM0tvWFQ0MVFGYVpQ?=
 =?utf-8?B?R3FBVnRGcnFTL3FDYVZuUi8wb1VScC9sK3lFL1dBcFM1VGx5OHltamxieHVP?=
 =?utf-8?B?UVI0WTFQVnJPRFpiczVwaG0yazFzSitra2pJamtYTDNQeDlidFZHN25WNTJr?=
 =?utf-8?B?Y0gvR3FseGdjVTN2OFpBUWdMajJnVEFySkVHc1EzV2F5Q1ZYTVVTb1hNU0Ns?=
 =?utf-8?B?bGdIenhMVjBCZVhLUXQ5MW5yVlNZUmJ4VzU0NDcza0hjdGovNGhEeko3WGdv?=
 =?utf-8?B?dDFxZ3d2RFB2TXhaeWRmTmJ0YnBaRkxtem1NN3dBQkdaWE1YZ1h4STg2SVJr?=
 =?utf-8?B?WEV5T25lZzZRdmRyTytRS2I1OXlOM2tCZk5aNHFDTVliN0NsOVVJWTFVMm9l?=
 =?utf-8?B?SmE1SUNwQVBlZ240UWRyeXlIRmIrendoNGFKNGRSVEowUzBrOTJpaDZEa3Bv?=
 =?utf-8?B?RFU0aWc4WHhOSVdnckF6Q085YkRXZllqdUxzVFdEWFpQYVBpN1o5VnZMSWU5?=
 =?utf-8?B?Vmtha2t3QXR6YzZpWXN5a2FMSlc0VFp4MGxRRTdybGMxQ0ZTWFJWemt4ZGxo?=
 =?utf-8?B?UWdLbVJIUER1SlkySGhHS09ra3ZpaFhpTlduRGdZYy9GU0RaQ1JCQWFhK1lG?=
 =?utf-8?B?VWNUMnVhTkgwWGk0YktXNlBTNFRGUXZnbTBpMFYzUkVFTzZCVzRFcEJEK0Zq?=
 =?utf-8?B?TW5JTmxEcks4bG0zWWVaWHNNYUd3bHJvcHdrcnhnVjVOSy8ydDNQcU5pR1dX?=
 =?utf-8?B?UnhCV3RzSkw3d1VkN3d5bnV6azM1Vmo5NzBXL2JnOWRiTUFJZm1janduQlVs?=
 =?utf-8?B?SUFlWVBZVlNac0ttMjBOQ0s0Q2doTHhSYnRsenJkYUhwd1h6d2xBV2pNWDIx?=
 =?utf-8?B?dG9TS1BQNG5UTm1hb2RoWGZsTFA0ZXZZQjdlM2kyQkRMeEd0VENFRjh6eUYv?=
 =?utf-8?B?K2FKdVMwLytYNXh3S1Uwd2JkTGNpT3E4aE04clFXQ1F5L0NYTzZVbHdCQjlW?=
 =?utf-8?B?ampvMng2V1NaNkRuU29FbUhHa3VRdjIxODg5dVRwZVhzZTU2eGdlNndsanZW?=
 =?utf-8?B?K0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 233947eb-0e46-4891-75db-08dca18de885
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 09:43:24.3971 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ApvcCE4T6JpvE/5fCy/+308dH/KcIcQzwcm1h/tdzuMza47ww+Q23YoLaO0TytoIAI0gAvd1VJuMj44z8Uvqx0C+7hx/lOXfFAgcoXV94PA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7934
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

LGTM

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

On 7/9/2024 12:30 AM, Imre Deak wrote:
> Add a helper to dump the DPCD descriptor for an LTTPR PHY. This is based
> on [1] and [2] moving the helper to DRM core as suggested by Ville.
>
> [1] https://lore.kernel.org/all/20240703155937.1674856-5-imre.deak@intel.com
> [2] https://lore.kernel.org/all/20240703155937.1674856-6-imre.deak@intel.com
>
> Cc: dri-devel@lists.freedesktop.org
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>   drivers/gpu/drm/display/drm_dp_helper.c | 66 +++++++++++++++++++++----
>   include/drm/display/drm_dp.h            |  4 ++
>   include/drm/display/drm_dp_helper.h     |  2 +
>   3 files changed, 62 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index d4c34f3641400..6ee51003de3ce 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -2328,6 +2328,31 @@ drm_dp_get_quirks(const struct drm_dp_dpcd_ident *ident, bool is_branch)
>   #undef DEVICE_ID_ANY
>   #undef DEVICE_ID
>   
> +static int drm_dp_read_ident(struct drm_dp_aux *aux, unsigned int offset,
> +			     struct drm_dp_dpcd_ident *ident)
> +{
> +	int ret;
> +
> +	ret = drm_dp_dpcd_read(aux, offset, ident, sizeof(*ident));
> +
> +	return ret < 0 ? ret : 0;
> +}
> +
> +static void drm_dp_dump_desc(struct drm_dp_aux *aux,
> +			     const char *device_name, const struct drm_dp_desc *desc)
> +{
> +	const struct drm_dp_dpcd_ident *ident = &desc->ident;
> +
> +	drm_dbg_kms(aux->drm_dev,
> +		    "%s: %s: OUI %*phD dev-ID %*pE HW-rev %d.%d SW-rev %d.%d quirks 0x%04x\n",
> +		    aux->name, device_name,
> +		    (int)sizeof(ident->oui), ident->oui,
> +		    (int)strnlen(ident->device_id, sizeof(ident->device_id)), ident->device_id,
> +		    ident->hw_rev >> 4, ident->hw_rev & 0xf,
> +		    ident->sw_major_rev, ident->sw_minor_rev,
> +		    desc->quirks);
> +}
> +
>   /**
>    * drm_dp_read_desc - read sink/branch descriptor from DPCD
>    * @aux: DisplayPort AUX channel
> @@ -2344,27 +2369,48 @@ int drm_dp_read_desc(struct drm_dp_aux *aux, struct drm_dp_desc *desc,
>   {
>   	struct drm_dp_dpcd_ident *ident = &desc->ident;
>   	unsigned int offset = is_branch ? DP_BRANCH_OUI : DP_SINK_OUI;
> -	int ret, dev_id_len;
> +	int ret;
>   
> -	ret = drm_dp_dpcd_read(aux, offset, ident, sizeof(*ident));
> +	ret = drm_dp_read_ident(aux, offset, ident);
>   	if (ret < 0)
>   		return ret;
>   
>   	desc->quirks = drm_dp_get_quirks(ident, is_branch);
>   
> -	dev_id_len = strnlen(ident->device_id, sizeof(ident->device_id));
> -
> -	drm_dbg_kms(aux->drm_dev,
> -		    "%s: DP %s: OUI %*phD dev-ID %*pE HW-rev %d.%d SW-rev %d.%d quirks 0x%04x\n",
> -		    aux->name, is_branch ? "branch" : "sink",
> -		    (int)sizeof(ident->oui), ident->oui, dev_id_len,
> -		    ident->device_id, ident->hw_rev >> 4, ident->hw_rev & 0xf,
> -		    ident->sw_major_rev, ident->sw_minor_rev, desc->quirks);
> +	drm_dp_dump_desc(aux, is_branch ? "DP branch" : "DP sink", desc);
>   
>   	return 0;
>   }
>   EXPORT_SYMBOL(drm_dp_read_desc);
>   
> +/**
> + * drm_dp_dump_lttpr_desc - read and dump the DPCD descriptor for an LTTPR PHY
> + * @aux: DisplayPort AUX channel
> + * @dp_phy: LTTPR PHY instance
> + *
> + * Read the DPCD LTTPR PHY descriptor for @dp_phy and print a debug message
> + * with its details to dmesg.
> + *
> + * Returns 0 on success or a negative error code on failure.
> + */
> +int drm_dp_dump_lttpr_desc(struct drm_dp_aux *aux, enum drm_dp_phy dp_phy)
> +{
> +	struct drm_dp_desc desc = {};
> +	int ret;
> +
> +	if (drm_WARN_ON(aux->drm_dev, dp_phy < DP_PHY_LTTPR1 || dp_phy > DP_MAX_LTTPR_COUNT))
> +		return -EINVAL;
> +
> +	ret = drm_dp_read_ident(aux, DP_OUI_PHY_REPEATER(dp_phy), &desc.ident);
> +	if (ret < 0)
> +		return ret;
> +
> +	drm_dp_dump_desc(aux, drm_dp_phy_name(dp_phy), &desc);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_dp_dump_lttpr_desc);
> +
>   /**
>    * drm_dp_dsc_sink_bpp_incr() - Get bits per pixel increment
>    * @dsc_dpcd: DSC capabilities from DPCD
> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> index 173548c6473a9..a6f8b098c56f1 100644
> --- a/include/drm/display/drm_dp.h
> +++ b/include/drm/display/drm_dp.h
> @@ -1543,6 +1543,10 @@ enum drm_dp_phy {
>   #define DP_SYMBOL_ERROR_COUNT_LANE2_PHY_REPEATER1	    0xf0039 /* 1.3 */
>   #define DP_SYMBOL_ERROR_COUNT_LANE3_PHY_REPEATER1	    0xf003b /* 1.3 */
>   
> +#define DP_OUI_PHY_REPEATER1				    0xf003d /* 1.3 */
> +#define DP_OUI_PHY_REPEATER(dp_phy) \
> +	DP_LTTPR_REG(dp_phy, DP_OUI_PHY_REPEATER1)
> +
>   #define __DP_FEC1_BASE					    0xf0290 /* 1.4 */
>   #define __DP_FEC2_BASE					    0xf0298 /* 1.4 */
>   #define DP_FEC_BASE(dp_phy) \
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index ea03e1dd26ba7..bbb1cdc4fc68d 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -657,6 +657,8 @@ struct drm_dp_desc {
>   int drm_dp_read_desc(struct drm_dp_aux *aux, struct drm_dp_desc *desc,
>   		     bool is_branch);
>   
> +int drm_dp_dump_lttpr_desc(struct drm_dp_aux *aux, enum drm_dp_phy dp_phy);
> +
>   /**
>    * enum drm_dp_quirk - Display Port sink/branch device specific quirks
>    *
