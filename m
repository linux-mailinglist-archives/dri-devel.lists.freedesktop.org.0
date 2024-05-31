Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4778D5A09
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 07:52:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05C171124ED;
	Fri, 31 May 2024 05:52:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UZLS+Z9v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BA2E112374;
 Fri, 31 May 2024 05:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717134749; x=1748670749;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=U7SopHHjkQnPu4SLfokRf9Bg/bPmEY5bhHiZSxCSFio=;
 b=UZLS+Z9vztOUgM9drPgFmxiNYHgWuYDXhCuS2WyDZl578ViQymFA1WR1
 YwGcwKdrgABja8c5a2cX2m02timOYzPPgs1UWN0mROjBNa29h3OaL+adS
 NN4RhH/8vnt+KwUgQ8hM9y2AfRbkQAVuS+nlt/k6Rh8toJLw6l5Y0PwTR
 ke44tDLkiWj+C7YMvHS2leGV/jdBklR9WmQyVjOa26V9CeF0l6/MfSFCG
 IzrwWBTaIdQJRRpHVeIPzJk985Owv0RpBMt/mocmFRk0Vd8KkGmzEGjR7
 Dr+vzz8t6b1hxzqlWr9sP1NeFAAdJI/uutqoBIynqaQi7o/HgnR7eGxcq g==;
X-CSE-ConnectionGUID: DPccErfrQJGfG0STWggQlw==
X-CSE-MsgGUID: MY99cHO3QEaXZQ6oDnvm2w==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="16611312"
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; d="scan'208";a="16611312"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 22:52:28 -0700
X-CSE-ConnectionGUID: dMb5z4oUQLuoApq4YuHuMA==
X-CSE-MsgGUID: /RUbLZTKQFiiszrfhPkL3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; d="scan'208";a="36092877"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 May 2024 22:52:28 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 30 May 2024 22:52:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 30 May 2024 22:52:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 30 May 2024 22:52:27 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 30 May 2024 22:52:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TigGCNPUruJlZnLEM+1oQLqopEocoGOuIFVt3MkgOWoWzWw0k03Y7jZ2dtIsRgD2zyvDy4CKfAmr995cnP/lRJr66P0bxw19++ik/1Cm2UV57VRonnd8ypZo+4gt5qQ7vUEmf2QEAzN8ne8TSUzDxmSGltgRwOF3nwRhPgIU+uRARnSbekUEKSqDZx2jlVbP9htelqT7uF4JMAN6Mcpn+/2wlaCAchaqpD2GeOMcm8EQFFfr7rtczH97nNs8qTdrn+1sU1i+4F4yUvz4zU/m7HqJYe65CSnpF1o7SyXZCAJ4PLfryxE1v+9q+/jxLwSIoDpfeTAiQsr2reXUJsyJOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0GgpdbGwfZ36l/nQk+cCmb/WvP81IhT9dKDEY+X8rQ=;
 b=I9Dh+oq3TtUmMNEKTGUS3Ijdzrm5Z6tgZ4gm/hyrzDjnr5YessPkrt0DZl3zqa8Ta6bWcDoK209lE1fUqwlbZxa5rDwwt3s32FMbJBFCKAo1BQRylUMNOYLtI7syMjIQE+jgQR8xROrulQKSarpKJJRWn5bd1Tn1AqoW71vSi432+5ftJz+APkAPLY/AxtIJauV3/qUY/OjzOVGpW5kcOfNRTSwvRtS0lxcn1smEeOEV79vIKyH6vPojY1+fJVKr5ekZWc73k+NgefnUmdePHahpPgeenbNg4iugsOgUJq+qWvT09sW+a1kmpjkXymtA6hvYoyoGHldXKDNSnz+Q1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CH3PR11MB7321.namprd11.prod.outlook.com (2603:10b6:610:150::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.19; Fri, 31 May
 2024 05:52:20 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%6]) with mapi id 15.20.7633.021; Fri, 31 May 2024
 05:52:20 +0000
Message-ID: <20f213b9-a740-4731-bd29-bf757d238891@intel.com>
Date: Fri, 31 May 2024 11:22:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 8/8] drm/i915/display: Compute vrr vsync params
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <jani.nikula@intel.com>
References: <20240530060408.67027-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240530060408.67027-9-mitulkumar.ajitkumar.golani@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240530060408.67027-9-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0174.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::12) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CH3PR11MB7321:EE_
X-MS-Office365-Filtering-Correlation-Id: 673fc00e-70b9-4826-f42a-08dc8135d61d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OGI2cWlWbDdTdmxOZ010SEFGTXlMRWh4R1hncDQvT0VrRXQ3OGkzYy9DeFJq?=
 =?utf-8?B?bXcybkJ5YStSUzVwSFlGSk12TjVXdDlLa3dVcGgxZ1dwRWszUHBFaFRvRURT?=
 =?utf-8?B?WHRNbVFVdHZET2VvdSs0dGNlay9SWXo1NFVCOFVWbnhOTzRURjd6VStUbkRw?=
 =?utf-8?B?aGxzcWU0a3Jpbm5aSDBPZFlnN213TTFJOGtpTHdoRDZZNEZhUnJxQ2R0NC80?=
 =?utf-8?B?SmdkRWRRaVgwb2doQXRNeTV5Z1dLcjIvWmpKakVBaFZZVjRFdWNkS3ZTY3ll?=
 =?utf-8?B?bkhVVk1TZTVOTTl2WEoxbERiTkdNNHQ5dHVQUkp4QnRFcElRVGV6WFFmdDVu?=
 =?utf-8?B?MzB6T0pIM3ZPYzdOVlNSSWxXVyt1M1JzVkV4d21MQzRleXZNTGpPSWdBS3Fv?=
 =?utf-8?B?c0JSL3k3aWM0TGEwL3AxaVdYZk9uNjEyNzlTQXVYUUJGN0NveHN6S2tsZUVC?=
 =?utf-8?B?cW1TM3piWUZJelZwYWxqd2xqY1ZvOFdQNURxdEJHcTh4VS9ndk83ZkFNRFNL?=
 =?utf-8?B?TkhXRllpOFdmL2pxaUlqTk02RU9SSlZLajIwaGNwNjEycVluako3eU9oR0VU?=
 =?utf-8?B?MjdQRHdGZ2E0NkVnZVY5cFh2ZmsrSGFVYTRZVUZqU2RJTjZ6RFZmTGlHeUxz?=
 =?utf-8?B?cE5ub0FiM003L1Z4d0ZvSnBqVW1RWU1PVWY0M095UUxKb3RrUkJ3QjJDaXU3?=
 =?utf-8?B?M1c1aWtYMEFlTG1mbkhzOTN0M3kwNFE0V0VuVXdmVTB5QVVrQXRxNWhUaHhD?=
 =?utf-8?B?VjlnU0tSSXo0eHVuUlByR1RSd2NRSXdJRDR0blFSOVIyd2lCWWZaNXhQMFNX?=
 =?utf-8?B?TjY1Vy9UdDhnZkdyaXlNL2I4STJOWlFyVkhHRU1uMG9mMmh1b3FYTk5VejhZ?=
 =?utf-8?B?QzlMb2tmcEw1ZHpZRDFLME1lM3YvWE1qaFNwVXRObEdRYVNPUE5FY3JNWFMy?=
 =?utf-8?B?Z1NkcVliZWpSMHN3aU9XNlA0K2pxWDBHQUlJTzJLK1A4N1FzZUpXRE00bWdk?=
 =?utf-8?B?MDdZeVl2aUdBdUpLdEVDLzlUS1l0dml0YTlyOFNBd2IwbG1uQ3J1cDhFakpm?=
 =?utf-8?B?MXRvd1pSeGFCM1o1YVQ0Vll4cUthMGd2eStMK1gwSlFaeGNRVUR6NCtLRWhL?=
 =?utf-8?B?UTNBc0FIUHRMaFBxZUJBaEcxbTU1dHUvYjBWaDJLMWxQazF6N0RCc2d6KzNw?=
 =?utf-8?B?ZlF3Y21vb2grQXFuSEtnU3lHZWdHM3ZWaWxuVXhLa2djbEJrYzZXQlBYYmR4?=
 =?utf-8?B?T0xUNzhaRUJqdXlPQk56V2lESkREMTdlVWtDNlk0NlBFWGl5d0d2WDdRalYy?=
 =?utf-8?B?cXYvYTFNMVNrOXVqMnZVZythcFB4NEhZakVEUnNRU2UwL0lGcTQ1L2M1R1pM?=
 =?utf-8?B?NTkycUJaYk9neUdhQ0dsSEdiSW0vSjhpVWRqajVIU1F4NmNhU0dXTWNsNWVR?=
 =?utf-8?B?bWxIRWQ4L0xjMGxIQ0pFanVNLzVKdkprVnlwWDlYZVREMCs0QnVwYjFrT2lW?=
 =?utf-8?B?anVDYjEvc0YzMEM0VDB3TmIrQkJxclRKbnNZRWxOYkZsdHc2QzRiV1RUTjBI?=
 =?utf-8?B?YVI5ajZNb1IvM0hpRUpDQk0yY2lJY2F2MzkycFNoZC9FOTVIZElya0lTSmR1?=
 =?utf-8?B?S3RCVXdxemtjY1M1VEpEL2VxUTFtR1gxRVJVK0ZDYXJ6OHd3Nk5xcHE2NmEy?=
 =?utf-8?B?VGhpSzNzKzR0NmM4SjkrRUFweHhRNUJIRVU2VW9LZG1KNFA5L2VhRDR3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTBaWjhOS05hRmt4UnpzV2hpazVPYkM0QTU0dkVDWHJ0ckFSdDVIYmhuclVG?=
 =?utf-8?B?a0Z3bGFYbHR4cjdzRHlQYmY4bng2Vy9vRFpsb0xsN2FGRWNUSUFtVXhWYTc3?=
 =?utf-8?B?N2V6ZE1PMFYwMTlMZUZmYkVSaXNPMFFETDZxWk55MkEzQS8rMHBWVmEyZ0Q2?=
 =?utf-8?B?d1BxbUJCS2ZxdWJsTFJCYWJQUVZzbVllQjRCQlBuMGtsMUhjckRXL01ITUI0?=
 =?utf-8?B?M3JnVXdBR2lYdXJxVTdQRjMxdE53ODdJTGY3NURkZ0tIaS80NUZmVE5rUFZr?=
 =?utf-8?B?Y283dkN3Y2pwNnRNU0NCclFIRkZGaHFGYVQyL296TXl3bEllTXBBdzBSemQx?=
 =?utf-8?B?NWcvQjVsazgzL053RmpTZzN3c2N3d1pCb3RLcUUrYW0rQktPOFJSckJiMHpF?=
 =?utf-8?B?dk05dU5Tb0RtVTlQazRBeEhHUzNBMmt0cEp0aS9DSG5pQU13aDBTcVlqTGVM?=
 =?utf-8?B?QW0xeUZqdjlRZDV5QzkveVBKUGhuOUNRV2Y2dnpZYzlTUEF2SXFWM0V5bllS?=
 =?utf-8?B?Z0dpSldJRmVCZmFRdE1Icyt6NjRVS1JzeFUwR3RmSCtYcVMwa0ZYQWd2VVpI?=
 =?utf-8?B?bklZVHNnVlU4MmZIMjhNYnoxbldSNWM3bTBScmN2VWVEYkNWemFCZzhFekp3?=
 =?utf-8?B?VVE2ZW1KMFYwRnl0N2hYUDZTRmY0bjA5YXJ1cTA2NWMzOEU2eDhpSldDWFRW?=
 =?utf-8?B?cTFVMHhKQ0VqdHJWWExuY2JMNDdGS0d5OXBYUSsvZHJLUjVsZXBHNkdrRzF1?=
 =?utf-8?B?QzE2dkpJRE91WGZqUUoyVlNnc1ZSUE1aa0Zrb1QyVTdJaDFZWlZDRGhKTEJi?=
 =?utf-8?B?Zi85ZmVNNWNHbHRoUElYeUgxaWNLeWwvV2tlMStjN2xlWi9oU2NBQjdiOHVu?=
 =?utf-8?B?MjlZQWZiNlJDTTNxUnozSEtteU8rTy9WMUlSVk9TUTBnRnd3Z1pTNGhIait6?=
 =?utf-8?B?bjByYThqL1dEeHJJUXZLUzd6LzE2YTc0RndvYk9Db2Y2UFQvK1hvSy9XRWtq?=
 =?utf-8?B?WkZyWGU1T1RTOG14MWFEaXRCT0ZZSmRlMDBjbjVFSi9yZkpDVzMvSGw0aWEx?=
 =?utf-8?B?SEloTWU1ZXgvQzV6TUpiQU51eG1kMWxUanorVkhDbEhZV0lyRllLSmRvWFM0?=
 =?utf-8?B?TTJNbjRiNlJ0TndSbm1maVA3cUNzWHd0YkE4RVdUNjJTYUlMTnZ3U05vek1I?=
 =?utf-8?B?QmJwdFY1cm9nM3FDRTBWYlVWclVkRC95RzdYNGpqcGdYOFlXenQvYkd3MlpV?=
 =?utf-8?B?TkNsZ3U1Smk5eENzNFFOV0svVXEzLzZsdmk5M29Kck8wMFhLZkZmWHNrNUE1?=
 =?utf-8?B?M3l5TmxxUnJKd1FPM3dyMUdzNlllN1QzR1MyU2wzS1R0cHRKSExaUlg5T1Fi?=
 =?utf-8?B?L25xYjgrQ2NuSkI2L2hwV3dsV05NaVdaaUdxUlhZRVdHaHVuOTJnRktobE5v?=
 =?utf-8?B?T0c4dEY1UWFTYVJOcTlmWG5DMjRUTlg4YUVoQUh0UGpZNWQ3TXZ6UGl3V2hz?=
 =?utf-8?B?SVFWbWFQNFVIcEZIc1NsK1BzeVlWb0ZQSDFxWjU4Z0tveWY2czFLeU9SbGwy?=
 =?utf-8?B?dFZpWks5Mkh5eEVRSUlBS01OZFU0MmNvRUllME1ta3p0MVgxczFrV212YzRy?=
 =?utf-8?B?K0ZxT0JOSFdZUTNxZE1ndXJMNG1TS2puRHpXRWROUTZWbERhK1RJRGxSeXF3?=
 =?utf-8?B?L2JaMWJVKy90QTdPNGwwSks4YXprbGxZT3lmYTNid3hSM1FJSjRtSFV2UHI1?=
 =?utf-8?B?NlBWaFo2OEFEL1ZnMDBrWUUwSDRtUnlqVWFPZXhXVFFtblZMN3h3WkdMbEZw?=
 =?utf-8?B?WHFGb2ZRL0Y0THBRMDBUMm5IYVliWE5vdzQ3T2I1ajZ5MDZjRE01Nm1CbXZY?=
 =?utf-8?B?eDFWYmdzZ0NGRVFKNElVek05RkNKdXN2NFJrSlZIbzFlNnVCS2NibVFLV291?=
 =?utf-8?B?VGlyclQraU1yQ2N0bmpOZ2k1ei9LWE51b3R4c3E5dG9LUFQxVWdzZnlDNjM0?=
 =?utf-8?B?b0xmaEtqRVVOc3dHb25JOVd5aTlrMjU0cURWY21GT0VJVkFrNUw1WXh3Qmlv?=
 =?utf-8?B?eDM2VmZ0RWJpZjhqS2FaemlIY3RhRVlzUHpQdU1odk9GOXdiZG1peG93ZjFG?=
 =?utf-8?B?RFQxRktsYkhCNmFTbjMxdThrSW0rWlpNMVhmb1dEdWpjZllIUVRQZElVbi9y?=
 =?utf-8?B?YVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 673fc00e-70b9-4826-f42a-08dc8135d61d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 05:52:20.6809 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yg21eZzJfmDbcP+JcycTEi5n99UUT6Ox37kwCNPrX6B8lDn6QXv2DIHBxczrX5k7Yt6zVAWq1M69QHTSMMgAzgICznJCHBgCVlxHaHFGNMY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7321
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


On 5/30/2024 11:34 AM, Mitul Golani wrote:
> Compute vrr vsync params in case of FAVT as well instead of
> only to AVT mode of operation.
>
> --v2:
> - Remove redundant computation for vrr_vsync_start
> and vrr_vsync_end(Ankit).
>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_vrr.c | 17 +++++++++--------
>   1 file changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> index 1e4e2d8a0927..2090a12b38aa 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -217,14 +217,6 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
>   	if (crtc_state->uapi.vrr_enabled) {
>   		crtc_state->vrr.enable = true;
>   		crtc_state->mode_flags |= I915_MODE_FLAG_VRR;
> -		if (intel_dp_as_sdp_supported(intel_dp)) {
> -			crtc_state->vrr.vsync_start =
> -				(crtc_state->hw.adjusted_mode.crtc_vtotal -
> -					crtc_state->hw.adjusted_mode.vsync_start);
> -			crtc_state->vrr.vsync_end =
> -				(crtc_state->hw.adjusted_mode.crtc_vtotal -
> -					crtc_state->hw.adjusted_mode.vsync_end);
> -		}
>   	} else if (is_cmrr_frac_required(crtc_state) && is_edp) {
>   		crtc_state->vrr.enable = true;
>   		crtc_state->cmrr.enable = true;
> @@ -234,6 +226,15 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
>   		crtc_state->mode_flags |= I915_MODE_FLAG_VRR;
>   	}
>   
> +	if (intel_dp_as_sdp_supported(intel_dp)) {

Need to add check for vrr.enable as we set this only when vrr.enable is set.

Otherwise looks good to me.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


Regards,

Ankit

> +		crtc_state->vrr.vsync_start =
> +			(crtc_state->hw.adjusted_mode.crtc_vtotal -
> +			 crtc_state->hw.adjusted_mode.vsync_start);
> +		crtc_state->vrr.vsync_end =
> +			(crtc_state->hw.adjusted_mode.crtc_vtotal -
> +			 crtc_state->hw.adjusted_mode.vsync_end);
> +	}
> +
>   	/*
>   	 * For XE_LPD+, we use guardband and pipeline override
>   	 * is deprecated.
