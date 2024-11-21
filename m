Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F479D524B
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 19:05:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63EC510EA16;
	Thu, 21 Nov 2024 18:05:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XUhwzJn6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3774910EA16
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 18:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732212313; x=1763748313;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=2RDgQPRxwNU3CGbg+31kGLmfMhqUigakfJQdP/A8zU4=;
 b=XUhwzJn6Go4vhfjJNC8B74NsaWJZzUGjNxDuuZ7u9Yd0ys/f78oAYZPi
 Sii97PEKBYoUOBZ8iGTLOzXnDdVIxsgLCE4YuQtaGiuPorYHqkmFR4GEk
 rC9N4NuaEkoW/OnlY1geZSXq3SB5E8pxfhQOzBTJd+4qPtf4lV08JzS3j
 ikK3eyMe9zFPiicIrC/l1SBiKEUkHRthqXy3PmETJ8prlF5MkzIecRwwy
 TV8pwbAYaHjuosruzLNb7T+zAsJRlARxPMOPSzaPzy6byPA0nKEKfDzhO
 /g/Qu74gUOXV9LNXz4eZrguFH6fzP8ATvvQbrJApjHebO+GZFQIH43Cyn w==;
X-CSE-ConnectionGUID: jCiVWsfxQxeWCtaWlWe9gA==
X-CSE-MsgGUID: ZI+2c3QaSmePj1Ao5Tw4Rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32199447"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="32199447"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 10:05:12 -0800
X-CSE-ConnectionGUID: FpiSVDKbT02+VySp4De6Cg==
X-CSE-MsgGUID: i3QKo6CqRT+qatTdrgDHvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="90709731"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 10:05:11 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 10:05:11 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 10:05:11 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 10:05:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q7BaIGQ6Rbm0d5beEtgxhNiuUkFt/2Wvg3s6FEZZyq0fXFBGmheeaAn4du5nkxNnz1Au/oQo87n1lb/MwK+CnmdyIhqX9Ga8mzRqqI7eDTk2r+CKndAFFOuUN0aFuo77CbDUyb0cshJvkk0NmhvEtfzKpADDxWpQwhD93CduEfPDAfEaZaKnWKvZkVu+LRLY0Ju3CnXaw64wkIZKSbLEymhdTBcITAiAjm5F0XMLKelQP9iMuQ0hZ455zVAG9RqFSBl9Mlo6tNLsxfNdE1MTGsvvIHhFOKYkc8X/M/KALLBTfYX1M6vvSKFNSDWagf1+8HiBiIJeLE5OJErmGilK8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XN/BHMNONaBlj1ymk5AMtcwS7QenS7FGSVGkkCEtveY=;
 b=kqbhG50m1A6qink0vuFL9vx8YMqBfsu72cr2q9qXzsTdsbaRo1DLMTwv2pj5wIMzS+Tc+7p3FIC4c2A8ngYStKNeyUSnkscRupQgW3XRKbt+kGgHaO7f49iSbf8mmIw+HTMzDo2DQFiuB8V85G6vpDf64UrFzIwbtVG0EK9eEzLRVDeQdEgOxbI4jV6vPZQFQok97uLa8m5x5hTzkZruDSFb8GhwW800P1QigHCE0Zah4+0u9aVsjyU8rvNTw3Ts5zAnBjgWAP3JzatRjBYeQaCVfLMl7Moe9alwXnvV7ExcD6/2cBN5x+KJP4YYnJkeOnmJ0qTi+QGF5tXiz/Zrxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV3PR11MB8459.namprd11.prod.outlook.com (2603:10b6:408:1b0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Thu, 21 Nov
 2024 18:04:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8158.023; Thu, 21 Nov 2024
 18:04:58 +0000
Date: Thu, 21 Nov 2024 10:05:34 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Philipp Stanner <pstanner@redhat.com>
CC: Danilo Krummrich <dakr@kernel.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <ltuikov89@gmail.com>
Subject: Re: [PATCH 1/2] drm/sched: add WARN_ON and BUG_ON to drm_sched_fini
Message-ID: <Zz92bqXBCZ0Ccrz6@lstrano-desk.jf.intel.com>
References: <8a0e7e0b0d2ef05954240434759ca79f25328b73.camel@redhat.com>
 <e2231195-8fed-4b25-8852-589794665e70@gmail.com>
 <2f0b15d47576f25b65927de6c039a6d9839dbb81.camel@redhat.com>
 <cef7c754-df50-409b-a7ee-4c184afafa5c@gmail.com>
 <ZvKgAbiydG8Y9Z3F@phenom.ffwll.local>
 <a2ef4cdfeb31ad95de9311274de73a51cdc54a97.camel@redhat.com>
 <64c478a7-0afb-4b9b-8a7a-6e204a79cc20@gmail.com>
 <Zw0xHB_UNOvRq0L7@pollux>
 <6b656a2e199d1fa1d33684572a93e327cba0ae83.camel@redhat.com>
 <a936d96485fbd8401439a0939abb15f140ed5018.camel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a936d96485fbd8401439a0939abb15f140ed5018.camel@redhat.com>
X-ClientProxiedBy: MW4PR03CA0258.namprd03.prod.outlook.com
 (2603:10b6:303:b4::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV3PR11MB8459:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c8718a0-ffe0-4d65-8e14-08dd0a5702e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TkpKWnVIamR4cFdESWxJK0VqNWJWd05jNDhibGsvN2FsdXY0ZDAxSGFFZWhj?=
 =?utf-8?B?QUwyZTUyaUpDRkJySjh1WitZSEdiUWZ3WGVPanRoYWpCQzg2cWVUdFgzbTR0?=
 =?utf-8?B?ZDlkVldRcXdoeFFVWGFpL0hXRjdid05kY2xQWXVuY2dFNytTU0t6R2g3bGRi?=
 =?utf-8?B?ejN3WFBEcUZIQitzalRad0hZM01KdXVUdVM0NlhmSnZUNHA5YmErQXJ5WFhH?=
 =?utf-8?B?M0ZoMmFDdUFzaTV6VUpVcDdkM2wyT3VFREtBYTFjdG1KOW5Ea3c3NXZRSEQv?=
 =?utf-8?B?R0dDQzBGdzJ5V0tNMlJ3N2hOemZtQ3pHRlVtQ3BQM0hBYVVrY0xGSzJ2ZWJZ?=
 =?utf-8?B?eG0vZTIzc0owdEtBb3VaVTRiQkc1L05WYzNSTmhMQ1ZLa0l6ZytQWFo1aWFO?=
 =?utf-8?B?d2I2L2IwQnRtd0IzVG02RVZlY3dhZVI3VTRYVW1mT2lFbzFLSlhJVElNMzBQ?=
 =?utf-8?B?MERtdEkrMUJESWVPUXpWR3EvSHlxWDF0UERPc0htT3dZVzJGd0t0ZFYxZkEw?=
 =?utf-8?B?QUtEVVEzODk3WHRkYTJuS1F1Z0VMdjRDSTd2N1NYbmJRSElHY052RkpPdFJu?=
 =?utf-8?B?SndSblAraGNacXNhckI4V01JNVVVNnJLM2ZXUTg0RFM1RnVkcDZnQzRjQVEy?=
 =?utf-8?B?MlM5NFlmOHFMalkzYVhSYmJGZ2xuakhZbStXMGFiV2ZOQ1RJVllndlNyWStU?=
 =?utf-8?B?NnRxR0gzVmdxcUt2NmwrY2NBV05vbVNUVnJkUVhuUGhVdE9uWEl4Q29XN3hU?=
 =?utf-8?B?dlFlVlpMNm9NRFRwdjJ0cWo0REQvOXZEeXdxc1haYk9uV3gzbGUzMFNVZ0Q5?=
 =?utf-8?B?YWZOY09wK0hobnBlZmN0R3JGKzZIL09MM1BNTWVRM0plWXVETHdwZUU4YmJu?=
 =?utf-8?B?RkFRNlEvd3Uwakt3NmZLQjZWVjdOd3VOYUsyaEhjdUFjYTc4TUFZVlJEL2Ez?=
 =?utf-8?B?K08wN041NXR4d0dKWmlHSy83cE82Qlp1K2E0TjJSeTRlVWJJQ0xZeVRkVWIv?=
 =?utf-8?B?Qkp1dUVEdTkvWmQyclA5cEs0NFNyZGZqM1p2U1Z1NktuNDNaTy8yZXZQYTF3?=
 =?utf-8?B?RXBYQzRpQWI5WXRyYUNHcDlkck1Icm9CYVBFODdxSEFObzNuNGllU3c5ZFZI?=
 =?utf-8?B?QVhpNEhUcjNUbTIyb3hFVExoV0U5dUNaRnB6VEZZOFlmazJSTHVhZHVuT1o4?=
 =?utf-8?B?QnBLOFYxakJpbk5pcVgxRUdNSmlUa3k3dXdYUVFwQk9tcGFXdVErVnZRZjZV?=
 =?utf-8?B?WGJlV3RjcnNvWXo2MEdSMS8wSHMwZEM3T3hteGFLWkduamlUaGtFcSs1SGl2?=
 =?utf-8?B?dVd6WTd6a0JFamk1UXlkV1dtd0RuMktIeTNMSHJDem1wTS9Lck9lcmdTYVVD?=
 =?utf-8?B?R3l6S1BWbStzY0s3Zjl4YjBtVlB0aW1VVy9nZHVOU1I2c0FDZnNKRFNHWlNq?=
 =?utf-8?B?eDlBcC93SlROeUNuR0VabUY3NUhCYk5rbkp6TE5yZ3hmdnhwMlNCbGhRMm8w?=
 =?utf-8?B?cGxFcFM2OFYzWWJLZDNvQ2ZYTlc3ZGhJYXZBcGRvaGxFVjUreWRVSzZqTE1n?=
 =?utf-8?B?RkQwR1kwRGZUeE4xYXRXWDQ1N2RGVEtzNnlOMkZFQThlQUZJbXd0VUVXOVJX?=
 =?utf-8?B?dThSbzFmTmNsOHc0dXNlUE55aFR5SHpMQ1hLcGpqaDEya2lMTFpSb0Y1Nkkz?=
 =?utf-8?B?ajVXaGpxeFNLZ3BhRWc4VWZENmdaa05YMHVwdjN2UzI0RTBnVTRNY0V3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWlTU293UzQ0SnBGT0V6eHNjVlN6Q1RqdjNEeWlOZW5yTXBqNENDdXBVMXFU?=
 =?utf-8?B?bVJOTFhsSjNSYnp1c3FXTHh1ZGNHYzhvODZqVnVIK2k0R3BxUmRNK2Jnb2hF?=
 =?utf-8?B?YTNVSUhPTlRLM2w4cW9CeHZJa0VzN1Fvbm9YQUt6dXVQWkdTb09ld1RCT1E1?=
 =?utf-8?B?eUQwMy8wRS9vMndVcFRDYlpxalVYb3R1WHJYVG84ZG1qWEpTMW5qdXA3TkNE?=
 =?utf-8?B?TmF0Z3IwL3ZNUFExbzFjSTFCNk9UWk5BZGtEQk5DYTM3d2QwYmxHWndVQy9y?=
 =?utf-8?B?b0ovVTE0N01FRVEyV3krNGFvd1NCSUFCa0dCZGszYVpHTGZ6cU5ralNFVjBT?=
 =?utf-8?B?UkxlUSttcFJJZndWUzY3bTFIMHRwTUhQYXVMbE9IRUJXSzNYRitDUzZXQ2ho?=
 =?utf-8?B?VXN6L0gySlFQd1ZicU5kSUpoWEhuZndnQXJuZFAybHZUaFNGU2o0VkRmMjR2?=
 =?utf-8?B?Qm5Yb05aWmZQMncwV1ozcWV3ZEF4bGMrVUNISDlRNHoxMkRwUGpjTVFCdExy?=
 =?utf-8?B?dDY2b3FvbytSeVlNOXpReDB2bWhYaHhkcFBXY2hVL0ovNEZRV2hEWWd5VGdL?=
 =?utf-8?B?WDlsTHdORnNKTjFkVU1ldWdMeGgxTGNLSFJoeDIrNDJFZ1d6MW9GSDM1V0V0?=
 =?utf-8?B?dTROakhMZk1vbU4wWEdKbldmd0tuSGFpblNMeTlZb1p0dGJOMHJFa2xQdUpw?=
 =?utf-8?B?S3czYXBHUWJoRExnRmJqSEdBK2x2T0lsUEJCUnR0ckxHcXlaL1RGMXR4OWpn?=
 =?utf-8?B?SHNHRTI0eE1NMTZraXlJaTJ2WTBocDdGM0JSYnFxR1BMM01vK1l4dFRMNW01?=
 =?utf-8?B?NlBEeExRLzhORHV4dDkrckNJTWlJRXg4cExkZVA0cTFUd0QxdFk3OVBqaHRG?=
 =?utf-8?B?ZFVvZEEyTnNRa0JFclQzb3o2cWprS1UyYy95UTBkY1dnOGVWWllKOXZIVnhj?=
 =?utf-8?B?S1BuQy9hNXZDUms0bVl5Kzk5aUFnK2J1ei80REk5aDRCckdkeXV0VktTelNV?=
 =?utf-8?B?MjZ6THA2WnNPODFRdmg4MS9qV2R2ZlVTQ3NBN1MxUTJHNGU1K1Z2b0tUemhh?=
 =?utf-8?B?b1g4cW41eW1kWkhBbXBTSEgydkZ5d0RNK0lhMDdBSFRybzhLaVZNOVBaVGh1?=
 =?utf-8?B?Z0RqM0tPalREVXNHajFLMVJkWFNWb0N5bmJhYkNybHFIdytDTExqTEpFNlBo?=
 =?utf-8?B?eS84RCtycEVBR1BMOGI5YkZja1NCbU11Z1oxcGE5cGtCTFJEcUEyY0hvOVNt?=
 =?utf-8?B?UW9OQzR5Q3JIWXllOGFpRHAzeFFVKzlnK2w1MlJzTldqL3czZnluVGlhbzNv?=
 =?utf-8?B?RDYvSzE0dzNkV05BL1VTUlZJVm5lMXZvdVBTZXlVNjE2M012RW53eVlPM3RB?=
 =?utf-8?B?TlI3K2JtOWVGMUFwditsQ2FDR3hFM0h2cDhNdEN3cG54SzhyNVEwSnZUQWFh?=
 =?utf-8?B?TkhaTTJLTy9tTGpkbWJJYTRDZFVmY1c1SkRrYXdiRk82d0Mxb3N3dC9LdkYz?=
 =?utf-8?B?WlV0Yktod24xblFVckNMQlN1eCtMQm9RRFBRK05YbE1BeXJWRmIzOVo1YVd6?=
 =?utf-8?B?RWttYS9zUjNNU2o2TUllQitDNHB4TUZUUXh6Q0M2d3NjWVNGT3BSeXY3U3RV?=
 =?utf-8?B?MlRBcElsbWFzdGFZRkRyUHBvM1hJUGxONlROby9WRk5POUw2Rnd1OUlZTnBs?=
 =?utf-8?B?Vi9WZ0RFL3ovUnpnYjlSV1I3WkRia3pSbU1kSTRPQVFvUjdXa1hLRGhVVnEv?=
 =?utf-8?B?UUJOUUhudnY2Y0RhM3loenJHNUJvREhWdFVvUWk0L0FUWkNHU3BhWkRHNm9R?=
 =?utf-8?B?N1ZUZUxtcVIzNVkzekd3UGozMnhjSUJKZmhWdmlKR1BmYXZuSklVR0YxeWhn?=
 =?utf-8?B?dUoybWZ5V3RpYXlHd0ZWaGo0L1FBaFRpZEN2LzdZR2ZTdEFBQWhhbUJEQnZL?=
 =?utf-8?B?Y1BEeUZyak9uNnI5N1d1eWVzUTZsMXV0WXpQaFhiMUJqby9YTDR2Z3YrVDAx?=
 =?utf-8?B?c0J5TzJVdDh5bkZKd2xqek1nSUw2UEp0emF5NGpMQytWa3dZQzZSREgrdHdu?=
 =?utf-8?B?Q29NYlM3SVlEODhyaFU3VE4xVGc3ZDZOV21nVVE0bldaSVhJSys1M0FGaUJL?=
 =?utf-8?B?eGZqUFE3T254TnNoSlI3RkNVRWtsZ0piM3FGNXlBdGRrclI2TVJxODFpdVlp?=
 =?utf-8?B?SWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c8718a0-ffe0-4d65-8e14-08dd0a5702e7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 18:04:58.5389 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mE8CZdCAAQpzAb93LKg8qh1vAccPyhYt28xl25fERSt2g27kF+Uvf2o2R34/UnGr5AbRLEh7iIYG6YNlxigRoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8459
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

On Tue, Oct 29, 2024 at 08:22:22AM +0100, Philipp Stanner wrote:
> Christian, Sima?
> 
> Matthew? (+CC)
> 

Sorry catching up here. Internally in Xe we ref count the scheduler as
the scheduler is embedded into our user queue structure (xe_exec_queue).
Jobs ref the queue once they are armed. Upon queue killing we set TDR to
zero which will flush out all jobs / signal all the job's fences. Once
the ref count of queue is zero we do hardware / firmware teardown of the
queue and then finally call drm_sched_fini before freeing the queues
memory (and thus the scheduler).

This flow seems to work pretty well but largely bypasses the scheduler
functions to implement this. Not sure if this flow could be normalized
at all but I would expect usage models of a 1 to 1 relationship between
queue and scheduler to something similar to Xe's flow. Maybe we could
write this done as design guideline so other drivers don't have to
figure this out - this took me a bit to land on this.

With that, in general I agree with Christian's patch here complaining
about pending jobs if drm_sched_fini is called.

> Opinions on the below?
> 
> tl;dr:
> I still think it's a good thing to detectably block in
> drm_sched_fini(), or at the very least drm_sched_flush(), because then

See above. I don't think drm_sched_fini should block rather just
complain this patch does which says 'go fix your driver'.

Matt

> you'll find out that the driver is broken and can repair it.
> 
> P.
> 
> 
> On Fri, 2024-10-18 at 14:07 +0200, Philipp Stanner wrote:
> > On Mon, 2024-10-14 at 16:56 +0200, Danilo Krummrich wrote:
> > > On Fri, Sep 27, 2024 at 11:04:48AM +0200, Christian König wrote:
> > > > Am 25.09.24 um 16:53 schrieb Philipp Stanner:
> > > > > On Tue, 2024-09-24 at 13:18 +0200, Simona Vetter wrote:
> > > > > > On Mon, Sep 23, 2024 at 05:24:10PM +0200, Christian König
> > > > > > wrote:
> > > > > > > Am 20.09.24 um 15:26 schrieb Philipp Stanner:
> > > > > > > > On Fri, 2024-09-20 at 12:33 +0200, Christian König wrote:
> > > > > > > > > Am 20.09.24 um 10:57 schrieb Philipp Stanner:
> > > > > > > > > > On Wed, 2024-09-18 at 15:39 +0200, Christian König
> > > > > > > > > > wrote:
> > > > > > > > > > > Tearing down the scheduler with jobs still on the
> > > > > > > > > > > pending
> > > > > > > > > > > list
> > > > > > > > > > > can
> > > > > > > > > > > lead to use after free issues. Add a warning if
> > > > > > > > > > > drivers try
> > > > > > > > > > > to
> > > > > > > > > > > destroy a scheduler which still has work pushed to
> > > > > > > > > > > the HW.
> > > > > > > > > > Did you have time yet to look into my proposed
> > > > > > > > > > waitque-
> > > > > > > > > > solution?
> > > > > > > > > I don't remember seeing anything. What have I missed?
> > > > > > > > https://lore.kernel.org/all/20240903094446.29797-2-pstanner@redhat.com/
> > > > > > > Mhm, I didn't got that in my inbox for some reason.
> > > > > > > 
> > > > > > > Interesting approach, I'm just not sure if we can or should
> > > > > > > wait in
> > > > > > > drm_sched_fini().
> > > > > We do agree that jobs still pending when drm_sched_fini()
> > > > > starts
> > > > > is
> > > > > always a bug, right?
> > > > 
> > > > Correct, the question is how to avoid that.
> > > > 
> > > > > If so, what are the disadvantages of waiting in
> > > > > drm_sched_fini()?
> > > > > We
> > > > > could block buggy drivers as I see it. Which wouldn't be good,
> > > > > but
> > > > > could then be fixed on drivers' site.
> > > > 
> > > > Sima explained that pretty well: Don't block in fops->close, do
> > > > that in
> > > > fops->flush instead.
> > > 
> > > I agree that we shouldn't block in close(), but this effectively
> > > means that we
> > > need to reference count the scheduler, right?
> > > 
> > > Otherwise, if we allow to just skip / interrupt the teardown, we
> > > can
> > > still leak
> > > memory.
> > 
> > Having thought about it, I agree with Danilo. Having something that
> > shall wait on green light, but can be interrupted, is no guarantee
> > and
> > therefore not a feasible solution.
> > 
> > To break down the solution space, these seem to be our options:
> >    1. We have something (either drm_sched_fini() or a helper, e.g.,
> >       drm_sched_flush()) that definitely blocks until the pending
> > list
> >       has become empty.
> >    2. We have jobs reference-count the scheduler, so the latter can
> >       outlive the driver and will be freed some time later.
> > 
> > Can anyone think of a third solution?
> > 
> > 
> > Solution #1 has the problem of obviously blocking unconditionally if
> > the driver didn't make sure that all fences will be signaled within
> > reasonable time. In my opinion, this would actually be an advantage,
> > because it will be *very* noticable and force users to repair their
> > driver. The driver *has* to guarantee that all fences will be
> > signaled.
> > If the driver has to do fishy things, having the blocking outsourced
> > to
> > the helper drm_sched_flush() would allow them to circumvent that.
> > 
> > Solution #2 has the problem of backend_ops.free_job() potentially
> > using
> > driver-data after the driver is gone, causing UAF. So with this
> > solutions all drivers would have to be aware of the issue and handle
> > it
> > through one of DRMs primitives dedicated to such problems.
> > 
> > 
> > Currently, all drivers either work around the problem internally or
> > simply ignore it, it seems.
> > 
> > So I'd argue that both solutions are an improvement over the existing
> > situation. My preference would be #1.
> > 
> > 
> > Opinions?
> > 
> > P.
> > 
> > > 
> > > > 
> > > > One issue this solves is that when you send a SIGTERM the tear
> > > > down
> > > > handling
> > > > first flushes all the FDs and then closes them.
> > > > 
> > > > So if flushing the FDs blocks because the process initiated
> > > > sending
> > > > a
> > > > terabyte of data over a 300bps line (for example) you can still
> > > > throw a
> > > > SIGKILL and abort that as well.
> > > > 
> > > > If you would block in fops-close() that SIGKILL won't have any
> > > > effect any
> > > > more because by the time close() is called the process is gone
> > > > and
> > > > signals
> > > > are already blocked.
> > > > 
> > > > And yes when I learned about that issue I was also buffed that
> > > > handling like
> > > > this in the UNIX design is nearly 50 years old and still applies
> > > > to
> > > > today.
> > > > > > > Probably better to make that a separate function, something
> > > > > > > like
> > > > > > > drm_sched_flush() or similar.
> > > > > We could do that. Such a function could then be called by
> > > > > drivers
> > > > > which
> > > > > are not sure whether all jobs are done before they start
> > > > > tearing
> > > > > down.
> > > > 
> > > > Yes exactly that's the idea. And give that flush function a
> > > > return
> > > > code so
> > > > that it can return -EINTR.
> > > > 
> > > > > > Yeah I don't think we should smash this into drm_sched_fini
> > > > > > unconditionally. I think conceptually there's about three
> > > > > > cases:
> > > > > > 
> > > > > > - Ringbuffer schedules. Probably want everything as-is,
> > > > > > because
> > > > > >    drm_sched_fini is called long after all the entities are
> > > > > > gone in
> > > > > >    drm_device cleanup.
> > > > > > 
> > > > > > - fw scheduler hardware with preemption support. There we
> > > > > > probably
> > > > > > want to
> > > > > >    nuke the context by setting the tdr timeout to zero (or
> > > > > > maybe just
> > > > > > as
> > > > > >    long as context preemption takes to be efficient), and
> > > > > > relying on
> > > > > > the
> > > > > >    normal gpu reset flow to handle things.
> > > > > > drm_sched_entity_flush
> > > > > > kinda
> > > > > >    does this, except not really and it's a lot more focused
> > > > > > on
> > > > > > the
> > > > > >    ringbuffer context. So maybe we want a new
> > > > > > drm_sched_entity_kill.
> > > > > > 
> > > > > >    For this case calling drm_sched_fini() after the 1:1
> > > > > > entity
> > > > > > is gone
> > > > > >    should not find any linger jobs, it would actually be a
> > > > > > bug
> > > > > > somewhere if
> > > > > >    there's a job lingering. Maybe a sanity check that there's
> > > > > > not just
> > > > > > no
> > > > > >    jobs lingering, but also no entity left would be good
> > > > > > here?
> > > > > The check for lingering ones is in Christian's patch here IISC.
> > > > > At which position would you imagine the check for the entity
> > > > > being
> > > > > performed?
> > > > > 
> > > > > > - fw scheduler without preemption support. There we kinda
> > > > > > need
> > > > > > the
> > > > > >    drm_sched_flush, except blocking in fops->close is not
> > > > > > great. So
> > > > > > instead
> > > > > >    I think the following is better:
> > > > > >    1. drm_sched_entity_stopped, which only stops new
> > > > > > submissions (for
> > > > > >    paranoia) but doesn't tear down the entity
> > > > > Who would call that function?
> > > > > Drivers using it voluntarily could just as well stop accepting
> > > > > new jobs
> > > > > from userspace to their entities, couldn't they?
> > > > > 
> > > > > >    2. drm_dev_get
> > > > > >    3. launch a worker which does a) drm_sched_flush (or
> > > > > >    drm_sched_entity_flush or whatever we call it) b)
> > > > > > drm_sched_entity_fini
> > > > > >    + drm_sched_fini c) drm_dev_put
> > > > > > 
> > > > > >    Note that semantically this implements the refcount in the
> > > > > > other
> > > > > > path
> > > > > >    from Phillip:
> > > > > > 
> > > > > > https://lore.kernel.org/all/20240903094531.29893-2-pstanner@redhat.com/
> > > > > >    Except it doesn't impose refcount on everyone else who
> > > > > > doesn't need
> > > > > > it,
> > > > > >    and it doesn't even impose refcounting on drivers that do
> > > > > > need it
> > > > > >    because we use drm_sched_flush and a worker to achieve the
> > > > > > same.
> > > > > I indeed wasn't happy with the refcount approach for that
> > > > > reason,
> > > > > agreed.
> > > > > 
> > > > > > Essentially helper functions for the common use-cases instead
> > > > > > of
> > > > > > trying to
> > > > > > solve them all by putting drm_sched_flush as a potentially
> > > > > > very
> > > > > > blocking
> > > > > > function into drm_sched_fini.
> > > > > I'm still not able to see why it blocking would be undesired –
> > > > > as
> > > > > far
> > > > > as I can see, it is only invoked on driver teardown, so not
> > > > > during
> > > > > active operation. Teardown doesn't happen that often, and it
> > > > > can
> > > > > (if
> > > > > implemented correctly) only block until the driver's code has
> > > > > signaled
> > > > > the last fences. If that doesn't happen, the block would reveal
> > > > > a
> > > > > bug.
> > > > > 
> > > > > But don't get me wrong: I don't want to *push* this solution. I
> > > > > just
> > > > > want to understand when it could become a problem.
> > > > > 
> > > > > 
> > > > > Wouldn't an explicitly blocking, separate function like
> > > > > drm_sched_flush() or drm_sched_fini_flush() be a small, doable
> > > > > step
> > > > > towards the right direction?
> > > > 
> > > > I think that this is the right thing to do, yes.
> > > > 
> > > > > > > > > > > When there are still entities with jobs the
> > > > > > > > > > > situation
> > > > > > > > > > > is
> > > > > > > > > > > even
> > > > > > > > > > > worse
> > > > > > > > > > > since the dma_fences for those jobs can never
> > > > > > > > > > > signal
> > > > > > > > > > > we can
> > > > > > > > > > > just
> > > > > > > > > > > choose between potentially locking up core memory
> > > > > > > > > > > management and
> > > > > > > > > > > random memory corruption. When drivers really mess
> > > > > > > > > > > it
> > > > > > > > > > > up
> > > > > > > > > > > that
> > > > > > > > > > > well
> > > > > > > > > > > let them run into a BUG_ON().
> > > > > > > > > > > 
> > > > > > > > > > > Signed-off-by: Christian
> > > > > > > > > > > König<christian.koenig@amd.com>
> > > > > > > > > > > ---
> > > > > > > > > > >     drivers/gpu/drm/scheduler/sched_main.c | 19
> > > > > > > > > > > ++++++++++++++++++-
> > > > > > > > > > >     1 file changed, 18 insertions(+), 1 deletion(-)
> > > > > > > > > > > 
> > > > > > > > > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > > > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > > > > index f093616fe53c..8a46fab5cdc8 100644
> > > > > > > > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > > > > @@ -1333,17 +1333,34 @@ void drm_sched_fini(struct
> > > > > > > > > > > drm_gpu_scheduler
> > > > > > > > > > > *sched)
> > > > > > > > > > I agree with Sima that it should first be documented
> > > > > > > > > > in
> > > > > > > > > > the
> > > > > > > > > > function's
> > > > > > > > > > docstring what the user is expected to have done
> > > > > > > > > > before
> > > > > > > > > > calling the
> > > > > > > > > > function.
> > > > > > > > > Good point, going to update the documentation as well.
> > > > > > > > Cool thing, thx.
> > > > > > > > Would be great if everything (not totally trivial)
> > > > > > > > necessary to
> > > > > > > > be done
> > > > > > > > before _fini() is mentioned.
> > > > > > > > 
> > > > > > > > One could also think about providing a hint at how the
> > > > > > > > driver can
> > > > > > > > do
> > > > > > > > that. AFAICS the only way for the driver to ensure that
> > > > > > > > is
> > > > > > > > to
> > > > > > > > maintain
> > > > > > > > its own, separate list of submitted jobs.
> > > > > > > Even with a duplicated pending list it's actually currently
> > > > > > > impossible to do
> > > > > > > this fully cleanly.
> > > > > > > 
> > > > > > > The problem is that the dma_fence object gives no guarantee
> > > > > > > when
> > > > > > > callbacks
> > > > > > > are processed, e.g. they can be both processed from
> > > > > > > interrupt
> > > > > > > context as
> > > > > > > well as from a CPU which called dma_fence_is_signaled().
> > > > > > > 
> > > > > > > So when a driver (or drm_sched_fini) waits for the last
> > > > > > > submitted
> > > > > > > fence it
> > > > > > > actually can be that the drm_sched object still needs to do
> > > > > > > some
> > > > > > > processing.
> > > > > > > See the hack in amdgpu_vm_tlb_seq() for more background on
> > > > > > > the
> > > > > > > problem.
> > > > > Oh dear ^^'
> > > > > We better work towards fixing that centrally
> > > > > 
> > > > > Thanks,
> > > > > P.
> > > > > 
> > > > > 
> > > > > > So I thought this should be fairly easy because of the sched
> > > > > > hw/public
> > > > > > fence split: If we wait for both all jobs to finish and for
> > > > > > all
> > > > > > the
> > > > > > sched
> > > > > > work/tdr work to finish, and we make sure there's no entity
> > > > > > existing
> > > > > > that's not yet stopped we should catch them all?
> > > > 
> > > > Unfortunately not.
> > > > 
> > > > Even when you do a dma_fence_wait() on the last submission it can
> > > > still be
> > > > that another CPU is executing the callbacks to wake up the
> > > > scheduler work
> > > > item and cleanup the job.
> > > > 
> > > > That's one of the reasons why I think the design of keeping the
> > > > job
> > > > alive is
> > > > so extremely awkward. The dma_fence as representation of the hw
> > > > submission
> > > > has a much better defined state machine and lifetime.
> > > > 
> > > > Regards,
> > > > Christian.
> > > > 
> > > > > >   Or at least I think
> > > > > > it's
> > > > > > a bug if any other code even tries to touch the hw fence.
> > > > > > 
> > > > > > If you have any other driver code which relies on the rcu
> > > > > > freeing
> > > > > > then I
> > > > > > think that's just a separate concern and we can ignore that
> > > > > > here
> > > > > > since the
> > > > > > fences themselves will till get rcu-delay freed even if
> > > > > > drm_sched_fini has
> > > > > > finished.
> > > > > > -Sima
> > > > > > 
> > > > > > > Regards,
> > > > > > > Christian.
> > > > > > > 
> > > > > > > > P.
> > > > > > > > 
> > > > > > > > > Thanks,
> > > > > > > > > Christian.
> > > > > > > > > 
> > > > > > > > > > P.
> > > > > > > > > > 
> > > > > > > > > > >      drm_sched_wqueue_stop(sched);
> > > > > > > > > > > + /*
> > > > > > > > > > > + * Tearing down the scheduler wile there are still
> > > > > > > > > > > unprocessed jobs can
> > > > > > > > > > > + * lead to use after free issues in the scheduler
> > > > > > > > > > > fence.
> > > > > > > > > > > + */
> > > > > > > > > > > + WARN_ON(!list_empty(&sched->pending_list));
> > > > > > > > > > > +
> > > > > > > > > > >      for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched-
> > > > > > > > > > > > num_rqs;
> > > > > > > > > > > i++)
> > > > > > > > > > > {
> > > > > > > > > > >      struct drm_sched_rq *rq = sched-
> > > > > > > > > > > > sched_rq[i];
> > > > > > > > > > >      spin_lock(&rq->lock);
> > > > > > > > > > > - list_for_each_entry(s_entity, &rq-
> > > > > > > > > > > > entities,
> > > > > > > > > > > list)
> > > > > > > > > > > + list_for_each_entry(s_entity, &rq-
> > > > > > > > > > > > entities,
> > > > > > > > > > > list) {
> > > > > > > > > > > + /*
> > > > > > > > > > > + * The justification for this
> > > > > > > > > > > BUG_ON()
> > > > > > > > > > > is
> > > > > > > > > > > that tearing
> > > > > > > > > > > + * down the scheduler while jobs
> > > > > > > > > > > are
> > > > > > > > > > > pending
> > > > > > > > > > > leaves
> > > > > > > > > > > + * dma_fences unsignaled. Since we
> > > > > > > > > > > have
> > > > > > > > > > > dependencies
> > > > > > > > > > > + * from the core memory management
> > > > > > > > > > > to
> > > > > > > > > > > eventually signal
> > > > > > > > > > > + * dma_fences this can trivially
> > > > > > > > > > > lead to
> > > > > > > > > > > a
> > > > > > > > > > > system wide
> > > > > > > > > > > + * stop because of a locked up
> > > > > > > > > > > memory
> > > > > > > > > > > management.
> > > > > > > > > > > + */
> > > > > > > > > > > + BUG_ON(spsc_queue_count(&s_entity-
> > > > > > > > > > > > job_queue));
> > > > > > > > > > > +
> > > > > > > > > > >      /*
> > > > > > > > > > >      * Prevents reinsertion and marks
> > > > > > > > > > > job_queue
> > > > > > > > > > > as idle,
> > > > > > > > > > >      * it will removed from rq in
> > > > > > > > > > > drm_sched_entity_fini
> > > > > > > > > > >      * eventually
> > > > > > > > > > >      */
> > > > > > > > > > >      s_entity->stopped = true;
> > > > > > > > > > > + }
> > > > > > > > > > >      spin_unlock(&rq->lock);
> > > > > > > > > > >      kfree(sched->sched_rq[i]);
> > > > > > > > > > >      }
> > > 
> > 
> 
