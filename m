Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A274A54CA3
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 14:51:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D42210E984;
	Thu,  6 Mar 2025 13:51:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YK+h/n4O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC3D510E984
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 13:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741269108; x=1772805108;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cxFM1d+OtjY53VQOCWP1lZCxH1pJkBwj2k0viwmDd7g=;
 b=YK+h/n4OUp/lgeBH3zSKekG4rPfKrYGW4k6AQy52ZB4OOxOGpv6l1Xyi
 XaWrHTwlj2nkpLRWxN9H3XD7teZtTAcZv5O4X6Gn5j15+QgaANr0G68Te
 XisByvSlChWNBier/i8NOVF95HY9Fzuu5VFzVLgsF2YbbIVuxyP0bZEGF
 3Xa29PFI7mFXCOJtN3SK7yZvez7QtA2RNRiRKo9qOZfxyt8yolEtFkq6x
 1Rtt1+YRe3qEIbjOt5wpcjt2S4JAwgQdrAq4m90HWwIlsy/d8kVLnWrtq
 JOUhuYRk7ZYMv+eMHTEGBjmaXuo9Hsal7U29O2FyeMOXx4FuvJSD1qaRd w==;
X-CSE-ConnectionGUID: WjPLtT2TSLKCIOagYZ7TlA==
X-CSE-MsgGUID: xYHGej0mRqKPv+mPYaqiHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="67649304"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="67649304"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 05:51:47 -0800
X-CSE-ConnectionGUID: S/D6VpMtSyWytkGKf2E0lQ==
X-CSE-MsgGUID: 2Zn9iO2nQUKNshrYeMbxUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="119529759"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 05:51:48 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Thu, 6 Mar 2025 05:51:46 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Mar 2025 05:51:46 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Mar 2025 05:51:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OimzETVbnxs2DnbzxoTdBjrhq0RpbfulrucWTBhoQp/hA3M5b/A/8injM71Y5KIStNfQAHleXfq3SQV8v0JdK4wqbP1yTCHCPHg8ulhDdLrm5puU3IuMIO3m1migqvH4JbIkDDUBXZHaNDqMhuPyc84tXKldgbzVU1M/wnGq0Xu3lkjXepyjgTli4krTXD3GnORQxcLr9Mk2GdhBKmy2HuH4TLy7tvCgHHzJ8G/b/+iPaA12fl36y+1arAq2ZnVf+eocHK2TErrYE0Y8AVitFklFGcZ2eWp4QShBFQ553gVh4y0NIcgjDAyKraKQYBcDbtpaJMELO9IYZJkl71vOpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tPi8k7yuZ7bIZbZrvzIAHhM6EuCtMP+g5DTrYKFJHdc=;
 b=Jh18CtEHMEOvsBqZN4e4Hq14F0FW7RV77JuXfmXlk/uRt2qQUQrZ+FQjGj49BCTvextUeh1q/HBScFWeNfJLzoUSpOXNWLFwWe8zPa9suyiCvEU1TERIAGjqTXUaEms6rpyuaW0BkHW2IrKg1OJ3CTCsLBXe6P/+wLWnNphL9MsEvuub3iR1nyJQumUjguqt9JIGaWLYEc06Kg/CCeRVrRM7OumNCYPog6VgUi2yUapeKhsfOTy1yiaHCoUrEXJco24EzAQiSVdUxrjjj+P5SV6JtcavjI6+faOpPRNrx2bNRHeMli2gwgm2z2BFO3g4iPG2j+PDbnuNuxFpU7RiMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 CH3PR11MB7372.namprd11.prod.outlook.com (2603:10b6:610:145::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Thu, 6 Mar
 2025 13:51:30 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::6c31:ab8a:d70:2555]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::6c31:ab8a:d70:2555%4]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 13:51:30 +0000
Message-ID: <f543ec81-1092-4700-b695-c4126f122444@intel.com>
Date: Thu, 6 Mar 2025 15:51:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] MAINTAINERS: Change habanalabs maintainer
To: Jani Nikula <jani.nikula@linux.intel.com>, Ofir Bitton
 <obitton@habana.ai>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "sfr@canb.auug.org.au"
 <sfr@canb.auug.org.au>
CC: "jgg@nvidia.com" <jgg@nvidia.com>, <koby.elbaz@intel.com>,
 <konstantin.sinyuk@intel.com>
References: <20240729121718.540489-1-obitton@habana.ai>
 <20240729121718.540489-2-obitton@habana.ai>
 <dc139f06-3f5a-4216-93c2-1e8b3b9c27ba@intel.com> <87cyevy9k0.fsf@intel.com>
Content-Language: en-US
From: "Avizrat, Yaron" <yaron.avizrat@intel.com>
In-Reply-To: <87cyevy9k0.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0023.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::12) To DM4PR11MB5549.namprd11.prod.outlook.com
 (2603:10b6:5:388::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5549:EE_|CH3PR11MB7372:EE_
X-MS-Office365-Filtering-Correlation-Id: ffcae2bc-b223-4d4e-c406-08dd5cb5ff3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3o3TFhObm41SG1qYkxNdkxQbDNYK05XVUxPT00rZXNvU3R6dFFDNGNqc2VH?=
 =?utf-8?B?Y3pNT3UzSVJPTGxuNjBrSHJYNnlvdzlYYm1FSGZvbDMxTFh0UVFNSWNEdkdM?=
 =?utf-8?B?LzJGOUVPNUo0T1I1VW5JcGZrdm4xUG4yWDBKNEZLRHJ5dURNMHFKMzJYSk1j?=
 =?utf-8?B?aUlvQUFPWnJkeW03WFlhWDVvWVlJbkxDeEZJeTIyM0o0NUZmOFplVU1CVld0?=
 =?utf-8?B?K216ckhrdmdLTVVNdC9qM1RpOHpRMlMwSUMva1MxRlBpTlc3UFdvbVVEUnhp?=
 =?utf-8?B?b205elRQYXRZNmlZdENmWmYwVGRkRmwyMTJZSDNQR01zYTQ4VzFiSzh5Njln?=
 =?utf-8?B?bVdrQ1ZDWGlOU0JwNTZhQVlsM2k0S0k5Y2k3SVFJWWFpMkV4MGJ6WmlzSUUz?=
 =?utf-8?B?ajY2UDNaL0JzdGViNlBqVzRXTWlWR01MU3pDNHI1dUZKbFJYMllUT21UVHpK?=
 =?utf-8?B?ZktnSklSN2xiUHJheThtTmh1YWV6L1RWSjNMbElGWTdlL3R2M0NzQi9RTWxn?=
 =?utf-8?B?VWNZbjJ5L240V3QzOHFRZ0ZFYUF1bHFBWTVIRHNDaWtJZ2duRGpibSsyckwy?=
 =?utf-8?B?cGVBRmVleUNrZFhlM0FVZG1qSGxXcHdMdk40d2wxeVY5UjZ1cGZmVmQ4bW1K?=
 =?utf-8?B?ZVdBMjBuS0hQaEVwRVJWMHNhcVBiLzB1RnN5T3BtZ0xucEt0YWVMMnhLaFNM?=
 =?utf-8?B?VlN0UElkcVpGV2JxczFrcWxqUFVXdXUrREYxY0dkcGZ3blE2elg4bU40WFhB?=
 =?utf-8?B?d1BhY3R2SERadHZJWWwxQmdFOXd1dTVzTkNqcVNZNDhaY2tlcmliWWdVd0pj?=
 =?utf-8?B?T2JUZjRkcmxmYmYxQ1NGL3kyakhwQXVZd2g3cFBxcUlkczFqVFBWeTI4NGZl?=
 =?utf-8?B?UUVvc05GZTdpV3k1R1k4b2YvRUVaNlBvbGtELyt3a0FkKzhLS04zdHdzYWEy?=
 =?utf-8?B?VlpIdXlGbnlWcXpTRlMwS0FTRE9TQUNWY3pTNDBUczBIeGo4RGlQMVQ3T2xL?=
 =?utf-8?B?cmFyQ2lGZkR4c0ErRmlpazVxQnl0blQ5cHFYK0hZQ1JiQWxvQnZVT1BzbTlB?=
 =?utf-8?B?N1FLT2VRZkRvZ3Z4Nk9nbzVaQ1RIRWRKdmZJUkUzWGhUN01sZU0xM3RzYWln?=
 =?utf-8?B?NDRVc0dzUFJlbkpKWmE0Y1N2bmNmOWgzdlh4S1orNk5Ub0tRQThSTFNpZm94?=
 =?utf-8?B?UFFRQ2ltWGZaUU5ZVHZyVmdyelhLemVmb3lyK3U5cWZhS3VFaXRBQlRrbzlX?=
 =?utf-8?B?VEFZLzV3bHJ4czgzQm8wejJLME93QU5GSloyN3RLbnUyUjdwSGxKV0txU3lH?=
 =?utf-8?B?bXovRXNLVHc5UlVPTG95aTZlQ0Q0S2ZidW1tNmZPRm1IbzBkOVR4a1E0SFYw?=
 =?utf-8?B?TjlnaEMxSHN6ZkxlWXFoSzRYWEJOY1M2NWRONm5nWXBlbnJQL0c4UFB0OTgx?=
 =?utf-8?B?d3hsYzR5NVNoMEhWNk53OGtCMjhYcmpHME1VbVgyTnpsSVRTQit3NkVxK2pn?=
 =?utf-8?B?cE9RWlFaM0VQQWQwUTZOUnRxT2J5TDNNeDlEeFlRZWpGUE0wV0VSS3JaTGZr?=
 =?utf-8?B?ZnFpanljRjAxVEJYems0RldiNUlucVZuUGdHN2hLTFErNzgvRWdoRlRFSzFG?=
 =?utf-8?B?QWNvNWsvYitOQm52T0pEb01xT3RDMVRaYjd5VVdFNm1PRjZsQi9MVkp5MUJp?=
 =?utf-8?B?eVdqUnk1V1o4SWRrai9DVitiWUQxazJSM0RLOGtJWFlPY1pUc3ZXbDFSVm9H?=
 =?utf-8?B?NFM3OFppMVF3TDBXZ0x5eVpUeVNoeDNlQ0JCRElBemVHZENqaUtpVldwSFJv?=
 =?utf-8?B?TjRQMnFxUEZ3N0dMZnpJV3lKRStWSmhWTWhFK2lMNzA1NG5taFg3VXJGYXRj?=
 =?utf-8?Q?EPk2/vS5KgO/E?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VE52U0xud1kvUDMvbllmQmZpWDV2VURqRjh0MUpKbkNyVngzUi9BTUZ5L0ZL?=
 =?utf-8?B?amF2SGNTNEpIVlgrUzM1c3Fvc0hkNkVyUVM5Z2tBUUpOK1dSbWZMN0IzNDZz?=
 =?utf-8?B?MjhtMXBncytibWN5QUFtTCt0L013T1dpQkErNHkwVHZPYWxaQVVPL1VIQXBF?=
 =?utf-8?B?cnZKK0l0aHErSHF4NmIzNngxSUVLQ0ZqRHB3ckRpMnNEOVZ0aTVrMTkyK3dm?=
 =?utf-8?B?OWhXa2Z1SUdyM2NWSmZRM3hQaXZCODZSMVFIUC9TczFVWkxaQWR1NWdTZTBH?=
 =?utf-8?B?RlFTVVB6cHlONmk4THVJSVUrUW8zbHFyc2NId2M4aUxiWHRQSi91bVB1RFh1?=
 =?utf-8?B?ZFR0MExDMVNvRmViZzdpbm1ZMEpJekgzWFRPdmtaaGxxYXY1eUVMQUVHZEQ3?=
 =?utf-8?B?eGZpcEdrb3NSc1V4S2ZCNmVleEZxTTF0RjRrSjBJdEt0Tkx5M1E1TUxTVGFI?=
 =?utf-8?B?N29nRlYyYU8zRkZKWjRhOHdCNkdJZ1ByeTUyZ3loSXpKVi9mekY4dWtUNUlz?=
 =?utf-8?B?cnlaSTRPT0RkbHM1ci9aQUlKdzdZOVNwTTIwTVR2V0ZuV2M3K2IyUXZmOW5H?=
 =?utf-8?B?Q1p6OG1aeHZCaHA3MGhrOTJKV2FocDJVVUYrNDJRV3J0ZkRmbS9vU0NzWi9I?=
 =?utf-8?B?Sk1PNEpzVTJ0VFFDRHZUUHdScmJ6TUxVYmdyWVFxOUxLRUg0UlhJQnpEUTEy?=
 =?utf-8?B?YUhWWEd4MkxRMmVsWk5GR1ltMXRvRUxWREpvQk82dFM3MTFrcUpWN2c5WC81?=
 =?utf-8?B?MEVIUzVBbUVFTW0vMkNPNjRPUWluVkRqUWJ5M1BQYy9CakdUMERteHR4VE82?=
 =?utf-8?B?M29TZGQybysyYnEvbDBNa0drTnlSZzhWVXlIYnQrbDBoUmxXSEV3cHVBT1Fo?=
 =?utf-8?B?KzkyYnR1WEhrU2lXZHQ3NFpWNXNxWnEraHArZVdPcEVGVVhQRWJlRnMwSzZP?=
 =?utf-8?B?K2w0ZVdzdGdFTXRGYnB0bTBXeGRuWVV3cVV2NXg3RnBHcEtRVUhCYlUvNXBt?=
 =?utf-8?B?VVY0a0t2MVBFWlorbWFHT2w1RmZYeFp3QVRZVmgzbnUxS01HTWNaNENVRDNk?=
 =?utf-8?B?Q2cwSlAvTEVNWm9UVnllSGpzbWMxRm9LcWY2UFczWGNWcjVlRGtzUzJtUUh1?=
 =?utf-8?B?aXRnY29vZEpXUTVLRUs1eFFOWjR4dnpuRlFldzFDREQwTzlJTWlzeE1lQjd2?=
 =?utf-8?B?ZFRLRHl1NkNiTnNTSDZ1WGtzQ04vM00vb1NSRXBHN082MU5IdnRXWVM1UjRh?=
 =?utf-8?B?d21Pb21ESWxWMEJ3cXFJLzJJM0pXaHQ0ZEVRUSt4WGtUbWdDenFETEFLZHN0?=
 =?utf-8?B?K1VJOTBUNENvdnkrTnJEUVRxL05CTUdicFlQOWIvMFhHNklrNkZzY0NhU2Nn?=
 =?utf-8?B?NExFZ1BGZnp4dHhkUmsxTXErdUl2SXNGem41VVRrSU9rbFpqamVmVHMvdFpI?=
 =?utf-8?B?Y051N2xiVkJhbXV2dXpLMTBsRklaaFRubTRmdlJSWG1aTjRSRDZ6QzJiWG9X?=
 =?utf-8?B?dzRpQWU2Zi9rcGh5bS9taHNrcFZNSU55dnFXY2ZZWnZMQ280eTRnYXU4Rm5N?=
 =?utf-8?B?aGpXdXczcHFGd01VdUI0M0QzRmZmM2h2UGw2cFN3d2tTcTZ2dm1CaVFtOHRi?=
 =?utf-8?B?b2k0MFRVcXVjYzMwWDQybnlGUS9yV3dXQzM0YTIrS1d6aDcySEdBQ1Y3emRi?=
 =?utf-8?B?dExVeHp6UmkzRVNZZVg5ZGg2di94Y3VlRGUycndYT0kwSnpHNHh2L2Z6L0Rq?=
 =?utf-8?B?VTFaWlIwczl2S0loWTFvQWJmZjNhRVMybTFkVURFV3BHekZ4cUJqZUVwa0Vk?=
 =?utf-8?B?WUY0Yzl5MzBDNEo3K2g4N21oMkU5azhCaUkxK3BYQ3A2S1BwdWV3MkNRYWJ1?=
 =?utf-8?B?RE9rRGRDSW9udWk5Y0VKM2FlTjg0OXI4R3czMkRhZzNnWGRweFZ4RmFYUW9p?=
 =?utf-8?B?ektLdy9La2ZqcmtwMFNnT3hNbTZURXUra1lyYS8vcGVRS3pnZVVnR2ladDVP?=
 =?utf-8?B?WFRMdmRXUHZhU1JKUjI4dkhOdU5kNVV4Rm5ZT3YvTE9wOEhSUnZRY1V0VnB1?=
 =?utf-8?B?WGNTTDdpYjBYTHFIVGorYnBPa2ZjUm9IWmFHcURtRTlMSW1ZUy83VzlsTStC?=
 =?utf-8?B?R3NaSmN5UzdPQktwMTZ4b1NHRnQyNXJkd0dHSHRBeHBVaCtyRFlrVkpSVTVl?=
 =?utf-8?B?cWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ffcae2bc-b223-4d4e-c406-08dd5cb5ff3c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 13:51:30.0664 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D7hDdJtn+AOFFLdfT0mic7XqoZdqmTxbWs4U/c6vuWfhFMopNtW63nQ0ZiZnkfftCV1qSAjBAS7eAOnbKc1rvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7372
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


On 05/03/2025 13:57, Jani Nikula wrote:
> On Wed, 05 Mar 2025, "Avizrat, Yaron" <yaron.avizrat@intel.com> wrote:
>> On 29/07/2024 15:17, Ofir Bitton wrote:
>>> I will be leaving Intel soon, Yaron Avizrat will take the role
>>> of habanalabs driver maintainer.
>>>
>>> Signed-off-by: Ofir Bitton <obitton@habana.ai>
>>> ---
>>>  MAINTAINERS | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index ed2d2dbcec81..a4b36590061e 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -9599,7 +9599,7 @@ S:	Maintained
>>>  F:	block/partitions/efi.*
>>>  
>>>  HABANALABS PCI DRIVER
>>> -M:	Ofir Bitton <obitton@habana.ai>
>>> +M:	Yaron Avizrat <yaron.avizrat@intel.com>
>>>  L:	dri-devel@lists.freedesktop.org
>>>  S:	Supported
>>>  C:	irc://irc.oftc.net/dri-devel
>> Acked-by: Yaron Avizrat <yaron.avizrat@intel.com>
>>
>> Apologies for the long silence — it’s been a challenging period with
>> the Habanalabs-Intel merger, but we're back and ready to continue
>> contributing.
>>
>> We'll be moving forward with our roadmap — upstreaming the latest
>> HabanaLabs driver, including recent changes and full support for the
>> entire GaudiX series.
>>
>> To support this effort, Koby Elbaz and Konstantin Sinyuk will join me
>> as co-maintainers on a regular basis.
> Should they be added as maintainers in the MAINTAINERS entry too?
>
> Are you going to pick this up and apply to the Habanalabs repo, and send
> a pull request with it? Or how do you propose to proceed?
>
>
> BR,
> Jani.
>

Yes, in a later patch, they would be added as maintainers in the MAINTAINERS entry too.
Regarding your second question, we should start with merging Ofir's initial patch.
Any additional/upcoming changes will be initially merged into the official HabanaLabs repo as you mentioned above.

Regards,
Yaron





