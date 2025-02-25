Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83391A437CD
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 09:39:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D0B10E5B4;
	Tue, 25 Feb 2025 08:39:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mLT4KR54";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB66310E5B4;
 Tue, 25 Feb 2025 08:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740472773; x=1772008773;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=gVymfFz0B7I3Txzo8ReMr8M+mtmpHMaGjtC3FsLsFHQ=;
 b=mLT4KR54ghdaIeUkHSZOGypzHsTe2sDzQDmIyNd0Zp6HB0A+Uhq9xudx
 b1h1hy0+mTyGMo1f6nmkkckhOr3Pf/VcoBrmX1elkgVfRe+rCEo8aDVhA
 Em8Tm1cWR06affXXTYaxhWWHfFJzVK/GtB7wrRKiDlCrWyNsytkFE0EHO
 XTuUK9+CUMvGDDwGH4ftbt9CZMMCeTqqafdeMDgqvEuKHJlqQVhCJNrwP
 ympwQiWspbvgS/1rFVjLlMq0fJk2icela42YXyQDIrHxfx4UfpLm4EvV0
 FVNP8AljFxn5WBKXuHpY2PacBS7kYHf1VIozo2efqYAE5ax1G5TGvGFjF g==;
X-CSE-ConnectionGUID: BGA6LQbeSdSFsTqqvF2jZA==
X-CSE-MsgGUID: aqF32jkGQv2kp5Glm78ibg==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="28857542"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="28857542"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 00:39:23 -0800
X-CSE-ConnectionGUID: DtXqgtfRQGGVwgnpFHMCew==
X-CSE-MsgGUID: Qe5kOel0TtWPLtTwcmhgqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="116946093"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Feb 2025 00:39:23 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 25 Feb 2025 00:39:22 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 25 Feb 2025 00:39:22 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Feb 2025 00:39:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O+0DUnNUNfDB6IQWJ1tubVHeukqhHL0FyEflEyke04F31F7INigYv79k3WS6RVqJ8gd7vvjl9onwLbrKQVpRRoDVYwA9Unlu5OuLWGK3n/IIBTfC+4UxK0znRTjDd22pMTBSWohb04kJ/YQwZtZKC/g3DQXkYThbv6hKwjMASOjyYtWc7VRsFCVXl3sSulLMTckr8/OqYdz+8j1V2ephF26Jmjq4p3beDZg8r84AZRcQdSJfMHpyTOFWB1FynOkL5qmiVtlX1V5twY+j3uBNeQBW8z2WFCiQeRsNEsSk8V4P5jz46IXSuFeyX6ACMyCXrfx9tseLEbp6JVBd2ingCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U9zpTiKEoP328TQNhRQa8/5orER2Tp5Bs0xH594SfSM=;
 b=Caq4lLyiwYELuj4UIhBRS4H0uGdFlHWMYKoiFxK6YhGbeNKwUmozXNEstosQj4ztLvide/GkBN4lTRTYus8o3gC8ij7zpLuULcWfw5Wxz1Q6jAJ8CdArAvELXiiYbm16HZYaAnG2bPpolN54Cuc9VFHbI4LB36OOZUNqszR/+F/eYYR85eamf+Rdgb0goapZb9+NCu7d+4Bph3ReYPYqpJCieNlGi5IjD7BQEoJ/Zqe7yB7zQEp/oUZYSKa0aP/0RekawGwr6Keq4rEu4/JWDX15fSqFFX93YymeQbrsvtsl6t5D64QTu36VgzI4PEglNvaOW/YTXzUp6op7s+CkZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by BY1PR11MB8005.namprd11.prod.outlook.com (2603:10b6:a03:523::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Tue, 25 Feb
 2025 08:39:19 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 08:39:19 +0000
Message-ID: <cbdecafc-ee72-4fd9-bcc6-d57209def008@intel.com>
Date: Tue, 25 Feb 2025 14:09:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] drm/i915/display: Enable the second scaler
To: Nemesa Garg <nemesa.garg@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20250219115359.2320992-1-nemesa.garg@intel.com>
 <20250219115359.2320992-4-nemesa.garg@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250219115359.2320992-4-nemesa.garg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1P287CA0003.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::16) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|BY1PR11MB8005:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e910cfe-3772-4f1e-041b-08dd5577e559
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VDhPNFhEbWlWbEJPVGRDUkpDd21aT1J4TmVhR1JrOWVEeWc2TGZsTEhjNXB3?=
 =?utf-8?B?N21jV1BwKzBxM1hMQkV2TzVzSVI2eC91UjdsWHFCbnhtMWRYZndyOG5SWTJ6?=
 =?utf-8?B?azBpYVptUjJOaGcwZ1FybHpjWExWYTY2NXNwZGRRcXpEeWNuaW1QQ3RQZUd5?=
 =?utf-8?B?QXBqbE5haFlRdjI0M2FpaXJxMUJPeW1ScjcvbUhLUjVTQ0tpNWR6REZxUHVh?=
 =?utf-8?B?T2pOdXJLWXRmS2RidTljQi9KSitmV0h0dFhUa1YvcDJHMXJqRVBzMWNlamZD?=
 =?utf-8?B?K0pyaDhaM09YNVhRc212L1dSVjJvSHU5dCtzSjhKU09KZUZhYTZjaXE3eGNz?=
 =?utf-8?B?dTVzS0JhaklLK3JRNE1Wc0MvSGJleStNak9EUE5ONXJoRHJTOFF2aWhycFhu?=
 =?utf-8?B?aUIxeTV0cFp3Z1VlMjRneUpCcU5LM0w3aDNMVkVHOVJLMnVJWStVNGR0ZTlV?=
 =?utf-8?B?UVBzMUh5MEl5MnRRWEcwVWUvUm1CNFBEdGh4eldiQXFlWVd6SHlsWmVHY1RE?=
 =?utf-8?B?TXBEU3dJQXhyQlZZZjFxZm56NlNTTCt0RXNJMGI1aVZNYUNiUjJoS3BTc3NZ?=
 =?utf-8?B?WGlvdGZvam45MjNGUnVIVVB6MmhFdEwzUEYwVVVvdGdhZVdWYmZTRm5NQ0E0?=
 =?utf-8?B?QUZqWExGa1ZNenExR1lWTVR2dHZtTXk4eHNpS1RaaDhkcmo1VCt3MWhHcjZw?=
 =?utf-8?B?dHFjd3pROWRnUjlnbHcyOW0wSmROelNkU0NvUVQzcGIzWm5URkM4WjJYSjVy?=
 =?utf-8?B?eVhzMkwwaUFnRXh3dmlQaStyVk9BQW5hUkY2Zk1rNFEvc21NT21KU1RtQUtW?=
 =?utf-8?B?eUxUcWY0SUdDb2t6OUlSVVdLQk84NWxKVEMycENNeGNmK01UaExFZ2lON2w2?=
 =?utf-8?B?YkFhU2NPbWJLWUdlVTV3QlM5TElPVlRPcllpaUR6Wk0xUmVjeGJ2SkNzRXgv?=
 =?utf-8?B?blgxZ3hLaXFsTU5mM0xWQlZZYm9oY3R5U2NLMFplRCtVbysrQjN0UXBpcXo3?=
 =?utf-8?B?Y0Y2NFA2VUJJS2pwT2RSM2JUY2VaMkZqMmYrb1ZxR3BmOW5CU3lyRkVqaE9Z?=
 =?utf-8?B?bkZPQVNsdGZsUlpFNHBLaDlrejlJd3p2d2ZJenRsNHVYc0N2cklaL29uUkFo?=
 =?utf-8?B?Zi9TMHRvR01CZlNHQTVtclU1YldsVXkxYjFETllmMGZTVlhocXh3N1J3eC9a?=
 =?utf-8?B?ZUVzTml5SUU0K2xrM3oxRmxLbHJadUMybVpZZFRPTjRpdncrTEIweXBKTnJP?=
 =?utf-8?B?dWxYcTNuT1lYaDA2aWtqTTc0cUE4VzllYktBSW8vWExEd2tLc0pKRW5IWDEv?=
 =?utf-8?B?UjNVMWRGbG84OE9ydDZMQVRtRHV5RzI3RTMzaGFDZXVwNTVyQzIzWk55MXRl?=
 =?utf-8?B?OUJZaVRnRko5QkNVWVZzSGJNUVh4ZnBmRG1iL2pBRDYvWCtyaGR6TGZLRUls?=
 =?utf-8?B?WFJ6TCt4Vyt3MzJWRWlOckRRRDJ1c3YybXJKUmpKWUU2dW1XYmt2NTYwY1U0?=
 =?utf-8?B?RWM2R1g3UVhPOUlGSGo0a1JTcHk2a1k2dXRVQ0dQQWxEZis3T2tHZTlZcnhG?=
 =?utf-8?B?aGNLRnUvOXRaR1Jnbk1uNVYwZjYzMGV0UWYvZmx5TEVQMEZvVVRGUVZnT2tl?=
 =?utf-8?B?UU1sRWd0cVk2OXB6bzhPZ1NySTNqRDBmMXFjT1k3dGFIeitYVWJRNndqMHps?=
 =?utf-8?B?TFFnVU9ydWVKbW96RkxEdnpuWWxyYXl6QlpBL3pURXpVaDRGZDNCY2dtTHdJ?=
 =?utf-8?B?UWExVGovcmJVOFo0Rk03Z0ZqakNxRXdicmh1TElGTXF1RTVpSXJtZjFUS1Rz?=
 =?utf-8?B?MnlkMlFvMFBTODhiNmYwYWluYU9FbnF6Rk1VNC8ySTlUU21UaXQ0c0tBSEVQ?=
 =?utf-8?Q?4N23exZ3ENm05?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bExIOUlyR1pKMjIyNmUyNlpwNWgrdWpyalR1MHhXRXVjd1h0bkUyNkdyRTRR?=
 =?utf-8?B?NGx3N2laZk02eURYR0JqckJoOHpkTUpkQWR4SlhtYzFPejljTHJhVDZjQlJZ?=
 =?utf-8?B?NTJTemo4MVVCMmtmclAwQS9HaHlLYnRQazU3ZEtTWEtWK3BWMXdZdGEybVgv?=
 =?utf-8?B?K085d0tNZSswVnM3MFVaNXpybnhIRDRDMG5jS3hXR1VWSC9MLy9YZWpYemh5?=
 =?utf-8?B?bjZjaTdSVU9qYlV5dEpYNEpoVjFGa3dONmNWUHU2WEY1NHlpMU1TdUg3cXRT?=
 =?utf-8?B?UHUvMWF4cWFPajFjVEozZjd1MTlidXZyaDVrTWo2QjhtYXFsVkw1VGlrZlYw?=
 =?utf-8?B?VEJYd0NDT3JseW1pc0s1cE9wQ2lCdkdzSFJLdVlEdmpIRUlzT3BPYlVPT0ZN?=
 =?utf-8?B?b2Z0VXZHUmI2Mzd4RlBPdGxtQmNkVlphUWVISUtVRFEvenBORjg0VzJST3pN?=
 =?utf-8?B?SEVOOEhoN2RtZmk4dW9zL3FJaGkxd3kwb0ZZYkFONTJheUIvWis5a1hhU2x4?=
 =?utf-8?B?N0ZXUXhrSXovN3BUcWw4bDZzaGVOZ2xtd05oWDVZMGZ3TndiM0NSWUJwNmhS?=
 =?utf-8?B?cmEzNGtsNUovNjRRcjNRaUtLUmxkNjJUd1pHYXlIbDFwd1B3clMwRkVlbUo2?=
 =?utf-8?B?QjJmNlQyc0pIWWJITGJySW1CUGpnWHZVaEZ2VjhGY2NrTjBTb21FWlc1eTJ6?=
 =?utf-8?B?VjJmVzJRMG1TR3FjN1ZuaTc0ZnAxcW1RMlB1SS9QUmd4NnUwOWZwV3QyNHpj?=
 =?utf-8?B?NFFUWlc5dlJqWm5kbmcvQUNNV3pldXZ5ZzllTG14K1plZnpLT3g4RXhZZTZF?=
 =?utf-8?B?SEdkaEhTOWY3bGNtTHZjZDQ2RzNOTFdUNGdZeG5HdDBPdEVKTlN0YlREZDJX?=
 =?utf-8?B?YStpaU9aSU1EZGtUOGdhTFVReW15YmxpMXZYRjJ3VDhjNnp4WFdIbWhHYmxt?=
 =?utf-8?B?N3BpR1dPNUw1ZnJXZ1YzT0d4a1Y0ZVo1dkdHa3pPWk9wVXB0K0h5NXNYZU5i?=
 =?utf-8?B?UnZjYktDSVllNDRSeHFxTE1VNThGdGhSczZwMEVpQlpKTE9RRENRUTZtdE1a?=
 =?utf-8?B?dkx0Ylo1dVB6L25Mbm1TNm9IVi9kODYyZUFLaS8zMzdaa3FpdjRFYUY3WVhJ?=
 =?utf-8?B?a0tSbXNzcjhTU1JiZzBKY3R3Y1RmcXRuQUgvNnJGVGlGV1pXc0p5bFlHYWU2?=
 =?utf-8?B?ZkdSQTZRSjY3bmFUaVlXSjBHbUVpWDRZb24yWVRKbWFVdDJnUTlLOHdKUG5r?=
 =?utf-8?B?eDVveXFTYmJOZmpidE9BRGlnbTMzYzRnendrMTUxbHYwWGRxbDFBbkRBTUNQ?=
 =?utf-8?B?OTFDbnpFTjJSbklKZ3locUQxVW1BcjB1elZJZzE2am1qZDVBK0kzOElnczVw?=
 =?utf-8?B?WThIUzlZR3ExL25Sckw5VWFuMjVaMXdtZ0dKeVZObEZJajI4TGpzaG9qMVBw?=
 =?utf-8?B?eXRpMkdYNUNsQUVkTW5nZFo4MDlsOTVMa0pQei9saTMvUnVFT0o5VTUwUHpo?=
 =?utf-8?B?eUMrMFpma1JCNVR5MndZSE5mUXBjN1E5L0dBK1huUU9mY3BGa3ByZExoaHgv?=
 =?utf-8?B?dDl4dmN6UUJmUm83eWVvdnVUYVdUSXBCdFhRb0RZN0FENVM0Q2ZDZ3gzVTQz?=
 =?utf-8?B?MmhzaGs3b0g3SHFKR1hqUjZ0dTVTaGF3N0J2ODcxOTJ2cXBkRWRNaU8xTklz?=
 =?utf-8?B?amFkaU4wTHlkS3l2NXVxcmZjVk5qVGZEOE5HK1dlUWhWSXFNNHhJSzFLcklo?=
 =?utf-8?B?aVVtU2FGUFVVNTVPMmFWUVFvcFNWUVNKcGozUXVnQ3NlT3NldjVQRUFFb0pr?=
 =?utf-8?B?cnBaSmI3dmIwRFhlSGdyZHc0bGM4am9SaUFQQ3U5VGFxSys4dEc3dVV6d0FO?=
 =?utf-8?B?YmZsWmtlVTNDNUJQUE16c1FleEUreVVnemEybTVTcW1KeFg3R1l5b0QvWi9T?=
 =?utf-8?B?UGl4UDcxTkgwS0hGbXdDTHpCMHA5VS9wc0tab2JNbmNxZHVEeTRNeGRNTG9k?=
 =?utf-8?B?aFVuaGxacVBMazRGcHFFS1luQ21aVHFVaW9YSTRReTlsSFluYzFvRDlWaHVw?=
 =?utf-8?B?L2pZYVFHTGdGZXJlT21KMDVidmFRcmZsam9LazAvRkdVTHZmLzdRcy9XN0pH?=
 =?utf-8?B?Z2M4dm01LzAwczRvbW84TGNlUTNnU01BeHJaK3RZVVJZcHhCd24yWTFMUzQw?=
 =?utf-8?B?L2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e910cfe-3772-4f1e-041b-08dd5577e559
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 08:39:19.5304 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U5+71entMETHfKTCv3/N0CYboAJYvEGw46rvt/xlNyiwb8nLpyT8EX1ENxBCsi3x76x5NQqq5Dyp4sjfJRnzJv5UxRulJ1yY6uUV4xwxbv0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8005
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


On 2/19/2025 5:23 PM, Nemesa Garg wrote:
> Write the scaler registers for sharpness.
>
> v1: Rename the title of patch [Ankit]
>
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_casf.c |  2 +
>   drivers/gpu/drm/i915/display/skl_scaler.c | 45 +++++++++++++++++++++++
>   drivers/gpu/drm/i915/display/skl_scaler.h |  1 +
>   3 files changed, 48 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
> index 1526bebae1b6..989219e698c6 100644
> --- a/drivers/gpu/drm/i915/display/intel_casf.c
> +++ b/drivers/gpu/drm/i915/display/intel_casf.c
> @@ -109,6 +109,8 @@ static void intel_casf_write_coeff(struct intel_crtc_state *crtc_state)
>   void intel_casf_enable(struct intel_crtc_state *crtc_state)
>   {
>   	intel_casf_write_coeff(crtc_state);
> +
> +	skl_scaler_setup_casf(crtc_state);
>   }
>   
>   static void convert_sharpness_coef_binary(struct scaler_filter_coeff *coeff,
> diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
> index 3d24fa773094..9c6259ed971c 100644
> --- a/drivers/gpu/drm/i915/display/skl_scaler.c
> +++ b/drivers/gpu/drm/i915/display/skl_scaler.c
> @@ -132,6 +132,13 @@ static void skl_scaler_max_dst_size(struct intel_crtc *crtc,
>   	}
>   }
>   
> +#define SCALER_FILTER_SELECT \
> +	(PS_FILTER_PROGRAMMED | \
> +	PS_Y_VERT_FILTER_SELECT(1) | \
> +	PS_Y_HORZ_FILTER_SELECT(0) | \
> +	PS_UV_VERT_FILTER_SELECT(1) | \
> +	PS_UV_HORZ_FILTER_SELECT(0))
> +

Perhaps CASF_SCALER_FILTER_SELECT?


>   static int
>   skl_update_scaler(struct intel_crtc_state *crtc_state, bool force_detach,
>   		  unsigned int scaler_user, int *scaler_id,
> @@ -717,6 +724,44 @@ static void skl_scaler_setup_filter(struct intel_display *display, enum pipe pip
>   	}
>   }
>   
> +void skl_scaler_setup_casf(struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
> +	struct intel_display *display = to_intel_display(crtc);
> +	struct drm_display_mode *adjusted_mode =
> +	&crtc_state->hw.adjusted_mode;
> +	struct intel_crtc_scaler_state *scaler_state =
> +		&crtc_state->scaler_state;
> +	struct drm_rect src, dest;
> +	int id, width, height;
> +	int x, y;
Can be initialized here to 0.
> +	enum pipe pipe = crtc->pipe;
> +	u32 ps_ctrl;
> +
> +	width = adjusted_mode->crtc_hdisplay;
> +	height = adjusted_mode->crtc_vdisplay;
> +
> +	x = y = 0;
> +	drm_rect_init(&dest, x, y, width, height);
> +
> +	width = drm_rect_width(&dest);
> +	height = drm_rect_height(&dest);
> +	id = scaler_state->scaler_id;
> +
> +	drm_rect_init(&src, 0, 0,
> +		      drm_rect_width(&crtc_state->pipe_src) << 16,
> +		      drm_rect_height(&crtc_state->pipe_src) << 16);
> +
> +	ps_ctrl = PS_SCALER_EN | PS_BINDING_PIPE | scaler_state->scalers[id].mode |
> +		  SCALER_FILTER_SELECT;
> +
> +	intel_de_write_fw(display, SKL_PS_CTRL(pipe, id), ps_ctrl);
> +	intel_de_write_fw(display, SKL_PS_WIN_POS(pipe, id),
> +			  PS_WIN_XPOS(x) | PS_WIN_YPOS(y));
> +	intel_de_write_fw(display, SKL_PS_WIN_SZ(pipe, id),
> +			  PS_WIN_XSIZE(width) | PS_WIN_YSIZE(height));

I think we need to add  trace_intel_pipe_scaler_update_arm(crtc, id, x, 
y, width, height);


Regards,

Ankit


> +}
> +
>   void skl_pfit_enable(const struct intel_crtc_state *crtc_state)
>   {
>   	struct intel_display *display = to_intel_display(crtc_state);
> diff --git a/drivers/gpu/drm/i915/display/skl_scaler.h b/drivers/gpu/drm/i915/display/skl_scaler.h
> index 4d2e2dbb1666..e1fe6a2d6c32 100644
> --- a/drivers/gpu/drm/i915/display/skl_scaler.h
> +++ b/drivers/gpu/drm/i915/display/skl_scaler.h
> @@ -28,5 +28,6 @@ void skl_detach_scalers(const struct intel_crtc_state *crtc_state);
>   void skl_scaler_disable(const struct intel_crtc_state *old_crtc_state);
>   
>   void skl_scaler_get_config(struct intel_crtc_state *crtc_state);
> +void skl_scaler_setup_casf(struct intel_crtc_state *crtc_state);
>   
>   #endif
