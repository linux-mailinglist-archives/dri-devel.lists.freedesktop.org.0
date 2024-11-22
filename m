Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DA39D626C
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 17:39:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 934B810E307;
	Fri, 22 Nov 2024 16:39:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y1GiLj5v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C527D10E307
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 16:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732293552; x=1763829552;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Of0CV4tToROlpYj/7pfLl/fRLBiGL2uxbO9imzMp7Y0=;
 b=Y1GiLj5vhML2K5bT3UWh02y4Vuq9W7RYfcWHhe3M5hxMNlFNoHOb9W1u
 Kd4uwo084TH2y8aHGYywFXgglfe1jzZSHGcQSeah3qHSNCUfql853hMl3
 h3dXR6hkCsWz4l1vuuoq4NvoA3rIyozG83FoijjQokBhZlGk/fScCXG6K
 pgIeT0xsk8VZKRqHNF4LP88Bi+sceZTcvUE8zsCPLvRJP+ou3p5twaxUf
 kkdgAoUSwqLZqYpaTt3eXRTxj+fo4qJRzg56PwhKpZfYb7iJgmarvpGRH
 HDHbVfrpFkgr0D1KuiDZYMO6NiJrZmwtHcFxbpgNs4B93OGHiMw0GPBH2 g==;
X-CSE-ConnectionGUID: Bo/R6RbTQZ2trmLJa//Hjg==
X-CSE-MsgGUID: YaxdOCZcSGq0/m8S1qN+qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="57855659"
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; d="scan'208";a="57855659"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 08:39:12 -0800
X-CSE-ConnectionGUID: fldETgtdQK6FsCcUiPJtxg==
X-CSE-MsgGUID: tCCqu03DQKGSyONW1JfxEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; d="scan'208";a="94712648"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Nov 2024 08:39:12 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 22 Nov 2024 08:39:11 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 22 Nov 2024 08:39:11 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 22 Nov 2024 08:39:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u9w+/VRTezah3gI6zv6zhbGW3GwdC//RpF/jihSOtrzFe8meEjYGcuOgo4H2p+GLq2px7GtBmqnbxozEAi8+3mjsnaTH8iX7cOWju/wYOCHqwf/MxitlIcQt3gSX+6pcXYtEivkLyo5WqGcDrHP+k9U8Q0vYDE5kPE+8qklRhYqcDy6yWOX4jkbI5EgXe5prumujStTVhCyDaHM7LxFvI24kC35+kNOgU0tXanBQjRzsjAW2XyVs0hSv7fLtDWhiBQnnq9a1Ieak5HgsU7jyFRL0J22iL4oImVD1RdX77B+kHdZqmK0eUJt5mD7BZOFipix64PGHGs3bg2e7H4huHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LS52sbDT7D6AZGnk0LNEH+vEWssTADuQg6WOLdE8VAY=;
 b=Nvv4TIXOs1JJIY19frkU1QeIGMX0t0iRQqVhBAMxu8+8NHKZgz3y1/+ODBhB6G9kFy/9XXJq6pfk78MwbD+ZmslcX35/OfuxRER1KGZGXJpn6AkoFarQTMpWLYGIovHJWXwKg41O8JSeem+uoGukEQjdWtWMpjOIK9/6jHc6MORUfCu2LbI2csSxI6dFjOcIuoHB/MWj9JthyWEXOKhWA2cIfjMpCLz7I743rK97mjyM7gHXVo1FThmJTVcNyEgi//5tT9O4NTAGwUk4ySRklMoIst9Rzd/y48TJY3a5uPTrwnqXQpOU+BVZErTcBl1ocg1f8VmL/q1qgiQXQt9NpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB4851.namprd11.prod.outlook.com (2603:10b6:303:9b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.27; Fri, 22 Nov
 2024 16:39:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8158.024; Fri, 22 Nov 2024
 16:39:08 +0000
Date: Fri, 22 Nov 2024 08:39:44 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Philipp Stanner <pstanner@redhat.com>
CC: Danilo Krummrich <dakr@kernel.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <ltuikov89@gmail.com>
Subject: Re: [PATCH 1/2] drm/sched: add WARN_ON and BUG_ON to drm_sched_fini
Message-ID: <Z0Cz0AsVvjCW9uAM@lstrano-desk.jf.intel.com>
References: <2f0b15d47576f25b65927de6c039a6d9839dbb81.camel@redhat.com>
 <cef7c754-df50-409b-a7ee-4c184afafa5c@gmail.com>
 <ZvKgAbiydG8Y9Z3F@phenom.ffwll.local>
 <a2ef4cdfeb31ad95de9311274de73a51cdc54a97.camel@redhat.com>
 <64c478a7-0afb-4b9b-8a7a-6e204a79cc20@gmail.com>
 <Zw0xHB_UNOvRq0L7@pollux>
 <6b656a2e199d1fa1d33684572a93e327cba0ae83.camel@redhat.com>
 <a936d96485fbd8401439a0939abb15f140ed5018.camel@redhat.com>
 <Zz92bqXBCZ0Ccrz6@lstrano-desk.jf.intel.com>
 <1004fc81aff1de302582caa873a52e6e39b33215.camel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1004fc81aff1de302582caa873a52e6e39b33215.camel@redhat.com>
X-ClientProxiedBy: MW4PR02CA0013.namprd02.prod.outlook.com
 (2603:10b6:303:16d::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB4851:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c22112b-39b4-4782-d26a-08dd0b142fc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MnN6QXFKdlh1M3ZiV3NManAwYWU0S2NyS1hlNnFVVk9aeVBqckJ6RjN5d3U5?=
 =?utf-8?B?K1hjN1RpZnZ2NXI1MTcvOTNnVDRkbEZ5UHg4QXkrSWhPNytNdHEzV2pNNVdU?=
 =?utf-8?B?L3dGWkhrd0s5enVUcmdseEYvYTJwVmUwdFB5N3d0cVV4SlN1a09NeFRsY2RS?=
 =?utf-8?B?REhQMG81UDFyZVdyek5LaEhlVTdhK0doZjFQMFBoV1ArYm5ndHZRMUhzY1c0?=
 =?utf-8?B?VEN6Q1lPbEQwY0pKWVBNVUJ5QVN4cDRJUG82eTBwV0h4WW1wVXd3dVlMaFpL?=
 =?utf-8?B?RzMvQURYaFNCY295K3VnUXh6RmFjRnV6WGxwaTM1MGc4b0k4S21hUDNqVnJs?=
 =?utf-8?B?MUlsTHoxMnlYd3pLRWR2YkFKb2xBZGUrMTN2Zm0xK0UxbnlXOEZET2dqV2Ix?=
 =?utf-8?B?bFZlK0xvYWFzbmRUWFJhVkFwOThjT09weVlCeDJ6bWZTcjBvblRjNkl5MFlK?=
 =?utf-8?B?MmxvR1lJYnNKQjdSbEJCYTdaUFVHd29jaWxkdzQrVnJhWGxPUkltbE8vT2pB?=
 =?utf-8?B?T0kvckNrZ1hKSU5tMUtYQ25pVjNvZ0VRbzI0M0Y0N3lPa3hxbHYrVjl6dE83?=
 =?utf-8?B?YnJSMW9pVGg3S0ptR0Jia3JnbURUZnpsR0lvcjE5Z0JrNnQ2b0J1TkdYbkZQ?=
 =?utf-8?B?NlBtN0FlZm5KNnh6WC9jUC9uZXJvT2ZxeC9WQW5BUG9RalNhSTJEckdMWlZj?=
 =?utf-8?B?bDlrODdWUmkzSUpqUEpvSDNpUVFkQXZDU0xoYnhZSk1weW1SQVZraERLZ2ta?=
 =?utf-8?B?ZlloNWpFbGVsMVRReG1yRG1MRzdZSE5NbTlSNjVMaG4zU2ladmFFWmNFczFr?=
 =?utf-8?B?Z1c0b2tMY09Fak5FUE9MWkxEanI2bTl5c1YrNHN4aHp2dEJIWVUwVVNaS2JP?=
 =?utf-8?B?VmVMQ0I4OVdBU3BXSnZtQ2xtOE1VRGNPUzJPM2dwSVk0enVkeUpYQWk4ZzJa?=
 =?utf-8?B?d3g4MnNYbDVaYi9yK2ZKQXo1RzkzMXhpOXRiR1VLL3NCM21DQ24vd1RjYmhp?=
 =?utf-8?B?d3hRVis5SHZPd0lhajNGRFd0NWE3S2lIYVpmdzNjWE4wL0pvZThSM09rV3Nz?=
 =?utf-8?B?RXZqcGNEaEYzSzRmdHpOSjlJNjcyVTRnMXQxT3dNT3VYWDJCZzZ5U25DdlFY?=
 =?utf-8?B?VFlCOGwwTnJ3Smh1SnUvbWZzTVVaekhJdTZjZHcwTy82V05hTFJndVR2TzRm?=
 =?utf-8?B?dzR3aGdrNWE2d2YxN3hqeXNEclQ4WGQzVDl6UEhvdmxFOUdrb2xFdWMxbUFh?=
 =?utf-8?B?QmhBWkhrUTRXRFA2UDJxaDlnVFlkcWVMRmx0dE51djdtMWUrUC9rYWVRQWtY?=
 =?utf-8?B?ZWdXaGl6UFBQRkI1UzlRSllYdVRCdTlSM3ZEWDdrQmhwRnZWK2IySnBWVDFh?=
 =?utf-8?B?MEtkUGlSQkFyQktKSmxqYms4MW5xVW5aWmNBQVlaZUFYZWp2c1JMM0xmNDBw?=
 =?utf-8?B?WkpXa1hJUGpOd3FlSlRvenN4N2lVdkxKYnVUdk05WUhCcUh3NW9hc0VIV1RH?=
 =?utf-8?B?T1VSUW42TWNHTXgwVlNFWmM4dEM5bTdtSE9SeWZ2aFZGcGp5czRnejNCZEJs?=
 =?utf-8?B?dXc4c0lwQ215VDVzcTRMbTVBZDRUKzV5VWJvelNlVVdDR0Y2Q3U1cThoYVhG?=
 =?utf-8?B?NE9ja1YzOE94R1pzY3VlajBVeUhBM1h6dkkxMU02RmU2akVNL2NDUTZWdTNl?=
 =?utf-8?B?cHdmT1NtR2xtVnhnMGZtL25DRFQxMmRFMThrTENuZDBBNm9HU0lVQVZnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K25Dekd1ZFY2NVprVGpwdVY5WE5UUTU3U0FuSjVjMmRHTHJmWXhqNVJRWVVo?=
 =?utf-8?B?dnVkRG5Wd3hwQ2VoKzl3VWtDbXB5dXBIK0VDalY2Njk4OUxHM3pvR09rSUlV?=
 =?utf-8?B?YlJ5b1NvQ2plZ2hPeW5nTUpyR242dTd6b0w3V2I5blVhMlZvWll0cENEWGNO?=
 =?utf-8?B?ektJZUNMVU5lYmNaVkpFenA2NTBKQlpSUFVVTWQyUDNHbUMydVZIc2tyRkxM?=
 =?utf-8?B?WlA2dWlKT1ZYQks5empGMEFUN0FYb1Q1TUFtakNyNFlhNFlXcTYyMDFWZWJr?=
 =?utf-8?B?MFowQ25PSUE4Vno0a2pGamJTQ21iTDhVT2FmbE5TcXA1cE9RTjU3RTRhV1R1?=
 =?utf-8?B?SDFGdG1qdFFvYUhNTzdkaDRZYnVyQnA2S3VKcEhReFdwWnErTWREd3praUY1?=
 =?utf-8?B?enF0MUlXb3ppSmh2UzBYR2J0Z1FDcU1iOU50QWVzZml4ZXhUbjIxNXpCejJ3?=
 =?utf-8?B?N2ErNjBqKzd3TlI3ZER5dzdncEhSWUVNSnI0a0VxVXFQSkJkbGVVNXMvMVMw?=
 =?utf-8?B?NUpCdkxqT0s4ZTZUMEV4VEZQTHpCMWcwbW1pQjUzNEVoZmk2WEtVVFF2aitv?=
 =?utf-8?B?djEvMGt4alIxOWxnRmdGenBrUlVtVkRQMjM5ZDJ3TlhqRlFJV3BYSFJWa1Fu?=
 =?utf-8?B?dDV1TmptV2ZjTnRnZHZVTmpTTzh0cXk2MTIzRi9Pb1JTVWE4MFdXM3RvRzBK?=
 =?utf-8?B?bFQ2ZWxYbm5uTjJVcjRyUGpyZVlYbWM1S3lybDBOVXk2VVFncHc5cXRuMjMv?=
 =?utf-8?B?cHBiY1ZEa1pNdndoNm9JM3lybTluR011ZUJoZXMxdXlQajV2SXZtNTdUQkdD?=
 =?utf-8?B?SERsSU92RVMxRDhMNlM4ckJXbCt6cGQ5Tiswbmg5eWRKdnNoMWV6VDYzc2Fa?=
 =?utf-8?B?aG9xVWl5S1BFb3hXd0dmSktUVnRib3BTTHhxUTVFTEVFdVVRSDlBWEVHdjln?=
 =?utf-8?B?MVJTTHRvV3RkSWhrV3NqNlNVOXkxYkVnY3daemxpOFBqQ1lXelFEc28rUS9r?=
 =?utf-8?B?eW5GZk5lS2ZCMVJQd0lNYUVaS1NVUXZlbWdpY1lOR29SaWZ5MXRzU0tRVEtV?=
 =?utf-8?B?eFRWNHhKVmM3ekNCaS9wcE5QL3RrMUc1MW9oV2drREM5ZDl5ZWNrS2hQWTBD?=
 =?utf-8?B?NkRwdFBvcFlMZ1RkRUhDbVJxdU5DNGZKeFRHQmNZZ2VCU0hVMlpqZ2x4WUNq?=
 =?utf-8?B?L0M5VFB4QmszN3paZ0R4Yk4rV1pzOHlPNHpZcUNKRndEZjdpclh1elJqVENK?=
 =?utf-8?B?MXN2V3NRUURrYk1wdUFYMDRMTTBoSXJpdVVIWEs0aEJvU1RTb1VhOHFVRXlz?=
 =?utf-8?B?OXhxQ0paUTd1UVBhdVMwTXZtclQrZ1ZVUE1vZVAyMVdmZVRKenRSSnp2QUJs?=
 =?utf-8?B?SGNHN2dvYTREZ1lob0pBc1R1NWVuQkJ4cTZ1ekptOHBvWUlVZUgwTUwrNDNv?=
 =?utf-8?B?aE1sRTdiMjdmUFlFOWhnSHFvc3haWTFtUVhsbkRnZGkySTRQK1F0Q0I0SXVL?=
 =?utf-8?B?M3ZGdEdCRDI0UkRhNWRCakhndjc3UERKaGxaclFMbjJnVjc1RUdqT2o5a0RW?=
 =?utf-8?B?VlluYWpMbFVKRFB0NVRZTm0va2MyTjZTNUpoVFhSTEFOc2J1cjZBZkNwakUz?=
 =?utf-8?B?Mnk3azdVaTZCSlFPb3RrelZ3MGtMU2ZkbEZmdUs4NzBheXFQcHlZaDFIRnRQ?=
 =?utf-8?B?Zi93bHBWS1NGQ3llQ3I4NzJBZ3ZudFJpT0JXemlHb284bVlRQkZ0eVF2VENJ?=
 =?utf-8?B?OFVscDdGSXlWa1pTTEY0T0h5NVI3Zm9ieTVWaHZpdGZiUC9PMjIxekxwcW5B?=
 =?utf-8?B?L3M5RGF5dGRWTXlBQjBvaWZmd0R6QXNwemZIZzl5UFB2eVZZaE5iWWZxMVdI?=
 =?utf-8?B?Y0VaUHoycVFZeGgxRmJJZmd3a3JBS2pkUmgzdGhYUHgyc2FJcUhhOWlRTEo2?=
 =?utf-8?B?c2ROOXc5V0didHVUa092NGUwenhnTmN4UHBzVXR2VjFXQjVFS2dYMEIvQjhX?=
 =?utf-8?B?VVFOVXBFRnl4RUZQY2xoMG5NS3VYYTg1L21iS05IMk80VUNPUkdkNmlmaFRW?=
 =?utf-8?B?NTZ5TU55ZWJuU0IyeEppYTdzTlFSNUFWSFE0YVY1TXQ0enhpRDlrVmRhMENC?=
 =?utf-8?B?Z3dHY01Hc2xZdFArRlo1anVYSk0zNGtUVVVQb1VsN2wvMUllV0JpK2hMUnVy?=
 =?utf-8?B?QUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c22112b-39b4-4782-d26a-08dd0b142fc7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 16:39:08.7596 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ayK1pVP2oLhFRdUy6BWbNPo6pj0cSHOMR8dg79ObUT8udYBa5UaCRPAw4l8BxfTFjbxM5S3rfhOYzj5ZTP5wyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4851
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

On Fri, Nov 22, 2024 at 05:24:03PM +0100, Philipp Stanner wrote:
> On Thu, 2024-11-21 at 10:05 -0800, Matthew Brost wrote:
> > On Tue, Oct 29, 2024 at 08:22:22AM +0100, Philipp Stanner wrote:
> > > Christian, Sima?
> > > 
> > > Matthew? (+CC)
> > > 
> > 
> > Sorry catching up here. Internally in Xe we ref count the scheduler
> > as
> > the scheduler is embedded into our user queue structure
> > (xe_exec_queue).
> > Jobs ref the queue once they are armed. Upon queue killing we set TDR
> > to
> > zero which will flush out all jobs / signal all the job's fences.
> > Once
> > the ref count of queue is zero we do hardware / firmware teardown of
> > the
> > queue and then finally call drm_sched_fini before freeing the queues
> > memory (and thus the scheduler).
> > 
> > This flow seems to work pretty well but largely bypasses the
> > scheduler
> > functions to implement this. Not sure if this flow could be
> > normalized
> > at all but I would expect usage models of a 1 to 1 relationship
> > between
> > queue and scheduler to something similar to Xe's flow.
> 
> One of the solution I proposed basically does the same: jobs added to
> gpu_scheduler.pending_list refcount the scheduler.
> 
> If we'd go for that solution I assume the separate refcounting could be
> removed from Xe. For exmaple.
> 

That should work. We likely need a vfunc for when the refcount goes to
zero which could either free the scheduler or initiate hw / hw teardown
process. In Xe the queue and scheduler actually lives for a while after
the refcount is zero due to several ping / pongs with the fw. Also long
as we can still support that, moving the refcount from our queues to the
scheduler seems reasonable. Ofc we need buy in from the other scheduler
use cases too.

> 
> >  Maybe we could
> > write this done as design guideline so other drivers don't have to
> > figure this out - this took me a bit to land on this.
> 
> I already improved the documentation a while ago [1], but didn't detail
> how drivers are supposed to solve this. The reason is that I don't want
> to encourage more separate solutions while we're working on solving it
> centrally.

Let me read this and add comments there if needed.

Matt

> 
> > With that, in general I agree with Christian's patch here complaining
> > about pending jobs if drm_sched_fini is called.
> 
> Yes, firing a WARN_ON there is also fine from my POV.
> 
> P.
> 
> 
> [1] https://lore.kernel.org/dri-devel/20241105143137.71893-2-pstanner@redhat.com/
> 
> 
> > 
> > > Opinions on the below?
> > > 
> > > tl;dr:
> > > I still think it's a good thing to detectably block in
> > > drm_sched_fini(), or at the very least drm_sched_flush(), because
> > > then
> > 
> > See above. I don't think drm_sched_fini should block rather just
> > complain this patch does which says 'go fix your driver'.
> > 
> > Matt
> > 
> > > you'll find out that the driver is broken and can repair it.
> > > 
> > > P.
> > > 
> > > 
> > > On Fri, 2024-10-18 at 14:07 +0200, Philipp Stanner wrote:
> > > > On Mon, 2024-10-14 at 16:56 +0200, Danilo Krummrich wrote:
> > > > > On Fri, Sep 27, 2024 at 11:04:48AM +0200, Christian König
> > > > > wrote:
> > > > > > Am 25.09.24 um 16:53 schrieb Philipp Stanner:
> > > > > > > On Tue, 2024-09-24 at 13:18 +0200, Simona Vetter wrote:
> > > > > > > > On Mon, Sep 23, 2024 at 05:24:10PM +0200, Christian König
> > > > > > > > wrote:
> > > > > > > > > Am 20.09.24 um 15:26 schrieb Philipp Stanner:
> > > > > > > > > > On Fri, 2024-09-20 at 12:33 +0200, Christian König
> > > > > > > > > > wrote:
> > > > > > > > > > > Am 20.09.24 um 10:57 schrieb Philipp Stanner:
> > > > > > > > > > > > On Wed, 2024-09-18 at 15:39 +0200, Christian
> > > > > > > > > > > > König
> > > > > > > > > > > > wrote:
> > > > > > > > > > > > > Tearing down the scheduler with jobs still on
> > > > > > > > > > > > > the
> > > > > > > > > > > > > pending
> > > > > > > > > > > > > list
> > > > > > > > > > > > > can
> > > > > > > > > > > > > lead to use after free issues. Add a warning if
> > > > > > > > > > > > > drivers try
> > > > > > > > > > > > > to
> > > > > > > > > > > > > destroy a scheduler which still has work pushed
> > > > > > > > > > > > > to
> > > > > > > > > > > > > the HW.
> > > > > > > > > > > > Did you have time yet to look into my proposed
> > > > > > > > > > > > waitque-
> > > > > > > > > > > > solution?
> > > > > > > > > > > I don't remember seeing anything. What have I
> > > > > > > > > > > missed?
> > > > > > > > > > https://lore.kernel.org/all/20240903094446.29797-2-pstanner@redhat.com/
> > > > > > > > > Mhm, I didn't got that in my inbox for some reason.
> > > > > > > > > 
> > > > > > > > > Interesting approach, I'm just not sure if we can or
> > > > > > > > > should
> > > > > > > > > wait in
> > > > > > > > > drm_sched_fini().
> > > > > > > We do agree that jobs still pending when drm_sched_fini()
> > > > > > > starts
> > > > > > > is
> > > > > > > always a bug, right?
> > > > > > 
> > > > > > Correct, the question is how to avoid that.
> > > > > > 
> > > > > > > If so, what are the disadvantages of waiting in
> > > > > > > drm_sched_fini()?
> > > > > > > We
> > > > > > > could block buggy drivers as I see it. Which wouldn't be
> > > > > > > good,
> > > > > > > but
> > > > > > > could then be fixed on drivers' site.
> > > > > > 
> > > > > > Sima explained that pretty well: Don't block in fops->close,
> > > > > > do
> > > > > > that in
> > > > > > fops->flush instead.
> > > > > 
> > > > > I agree that we shouldn't block in close(), but this
> > > > > effectively
> > > > > means that we
> > > > > need to reference count the scheduler, right?
> > > > > 
> > > > > Otherwise, if we allow to just skip / interrupt the teardown,
> > > > > we
> > > > > can
> > > > > still leak
> > > > > memory.
> > > > 
> > > > Having thought about it, I agree with Danilo. Having something
> > > > that
> > > > shall wait on green light, but can be interrupted, is no
> > > > guarantee
> > > > and
> > > > therefore not a feasible solution.
> > > > 
> > > > To break down the solution space, these seem to be our options:
> > > >    1. We have something (either drm_sched_fini() or a helper,
> > > > e.g.,
> > > >       drm_sched_flush()) that definitely blocks until the pending
> > > > list
> > > >       has become empty.
> > > >    2. We have jobs reference-count the scheduler, so the latter
> > > > can
> > > >       outlive the driver and will be freed some time later.
> > > > 
> > > > Can anyone think of a third solution?
> > > > 
> > > > 
> > > > Solution #1 has the problem of obviously blocking unconditionally
> > > > if
> > > > the driver didn't make sure that all fences will be signaled
> > > > within
> > > > reasonable time. In my opinion, this would actually be an
> > > > advantage,
> > > > because it will be *very* noticable and force users to repair
> > > > their
> > > > driver. The driver *has* to guarantee that all fences will be
> > > > signaled.
> > > > If the driver has to do fishy things, having the blocking
> > > > outsourced
> > > > to
> > > > the helper drm_sched_flush() would allow them to circumvent that.
> > > > 
> > > > Solution #2 has the problem of backend_ops.free_job() potentially
> > > > using
> > > > driver-data after the driver is gone, causing UAF. So with this
> > > > solutions all drivers would have to be aware of the issue and
> > > > handle
> > > > it
> > > > through one of DRMs primitives dedicated to such problems.
> > > > 
> > > > 
> > > > Currently, all drivers either work around the problem internally
> > > > or
> > > > simply ignore it, it seems.
> > > > 
> > > > So I'd argue that both solutions are an improvement over the
> > > > existing
> > > > situation. My preference would be #1.
> > > > 
> > > > 
> > > > Opinions?
> > > > 
> > > > P.
> > > > 
> > > > > 
> > > > > > 
> > > > > > One issue this solves is that when you send a SIGTERM the
> > > > > > tear
> > > > > > down
> > > > > > handling
> > > > > > first flushes all the FDs and then closes them.
> > > > > > 
> > > > > > So if flushing the FDs blocks because the process initiated
> > > > > > sending
> > > > > > a
> > > > > > terabyte of data over a 300bps line (for example) you can
> > > > > > still
> > > > > > throw a
> > > > > > SIGKILL and abort that as well.
> > > > > > 
> > > > > > If you would block in fops-close() that SIGKILL won't have
> > > > > > any
> > > > > > effect any
> > > > > > more because by the time close() is called the process is
> > > > > > gone
> > > > > > and
> > > > > > signals
> > > > > > are already blocked.
> > > > > > 
> > > > > > And yes when I learned about that issue I was also buffed
> > > > > > that
> > > > > > handling like
> > > > > > this in the UNIX design is nearly 50 years old and still
> > > > > > applies
> > > > > > to
> > > > > > today.
> > > > > > > > > Probably better to make that a separate function,
> > > > > > > > > something
> > > > > > > > > like
> > > > > > > > > drm_sched_flush() or similar.
> > > > > > > We could do that. Such a function could then be called by
> > > > > > > drivers
> > > > > > > which
> > > > > > > are not sure whether all jobs are done before they start
> > > > > > > tearing
> > > > > > > down.
> > > > > > 
> > > > > > Yes exactly that's the idea. And give that flush function a
> > > > > > return
> > > > > > code so
> > > > > > that it can return -EINTR.
> > > > > > 
> > > > > > > > Yeah I don't think we should smash this into
> > > > > > > > drm_sched_fini
> > > > > > > > unconditionally. I think conceptually there's about three
> > > > > > > > cases:
> > > > > > > > 
> > > > > > > > - Ringbuffer schedules. Probably want everything as-is,
> > > > > > > > because
> > > > > > > >    drm_sched_fini is called long after all the entities
> > > > > > > > are
> > > > > > > > gone in
> > > > > > > >    drm_device cleanup.
> > > > > > > > 
> > > > > > > > - fw scheduler hardware with preemption support. There we
> > > > > > > > probably
> > > > > > > > want to
> > > > > > > >    nuke the context by setting the tdr timeout to zero
> > > > > > > > (or
> > > > > > > > maybe just
> > > > > > > > as
> > > > > > > >    long as context preemption takes to be efficient), and
> > > > > > > > relying on
> > > > > > > > the
> > > > > > > >    normal gpu reset flow to handle things.
> > > > > > > > drm_sched_entity_flush
> > > > > > > > kinda
> > > > > > > >    does this, except not really and it's a lot more
> > > > > > > > focused
> > > > > > > > on
> > > > > > > > the
> > > > > > > >    ringbuffer context. So maybe we want a new
> > > > > > > > drm_sched_entity_kill.
> > > > > > > > 
> > > > > > > >    For this case calling drm_sched_fini() after the 1:1
> > > > > > > > entity
> > > > > > > > is gone
> > > > > > > >    should not find any linger jobs, it would actually be
> > > > > > > > a
> > > > > > > > bug
> > > > > > > > somewhere if
> > > > > > > >    there's a job lingering. Maybe a sanity check that
> > > > > > > > there's
> > > > > > > > not just
> > > > > > > > no
> > > > > > > >    jobs lingering, but also no entity left would be good
> > > > > > > > here?
> > > > > > > The check for lingering ones is in Christian's patch here
> > > > > > > IISC.
> > > > > > > At which position would you imagine the check for the
> > > > > > > entity
> > > > > > > being
> > > > > > > performed?
> > > > > > > 
> > > > > > > > - fw scheduler without preemption support. There we kinda
> > > > > > > > need
> > > > > > > > the
> > > > > > > >    drm_sched_flush, except blocking in fops->close is not
> > > > > > > > great. So
> > > > > > > > instead
> > > > > > > >    I think the following is better:
> > > > > > > >    1. drm_sched_entity_stopped, which only stops new
> > > > > > > > submissions (for
> > > > > > > >    paranoia) but doesn't tear down the entity
> > > > > > > Who would call that function?
> > > > > > > Drivers using it voluntarily could just as well stop
> > > > > > > accepting
> > > > > > > new jobs
> > > > > > > from userspace to their entities, couldn't they?
> > > > > > > 
> > > > > > > >    2. drm_dev_get
> > > > > > > >    3. launch a worker which does a) drm_sched_flush (or
> > > > > > > >    drm_sched_entity_flush or whatever we call it) b)
> > > > > > > > drm_sched_entity_fini
> > > > > > > >    + drm_sched_fini c) drm_dev_put
> > > > > > > > 
> > > > > > > >    Note that semantically this implements the refcount in
> > > > > > > > the
> > > > > > > > other
> > > > > > > > path
> > > > > > > >    from Phillip:
> > > > > > > > 
> > > > > > > > https://lore.kernel.org/all/20240903094531.29893-2-pstanner@redhat.com/
> > > > > > > >    Except it doesn't impose refcount on everyone else who
> > > > > > > > doesn't need
> > > > > > > > it,
> > > > > > > >    and it doesn't even impose refcounting on drivers that
> > > > > > > > do
> > > > > > > > need it
> > > > > > > >    because we use drm_sched_flush and a worker to achieve
> > > > > > > > the
> > > > > > > > same.
> > > > > > > I indeed wasn't happy with the refcount approach for that
> > > > > > > reason,
> > > > > > > agreed.
> > > > > > > 
> > > > > > > > Essentially helper functions for the common use-cases
> > > > > > > > instead
> > > > > > > > of
> > > > > > > > trying to
> > > > > > > > solve them all by putting drm_sched_flush as a
> > > > > > > > potentially
> > > > > > > > very
> > > > > > > > blocking
> > > > > > > > function into drm_sched_fini.
> > > > > > > I'm still not able to see why it blocking would be
> > > > > > > undesired –
> > > > > > > as
> > > > > > > far
> > > > > > > as I can see, it is only invoked on driver teardown, so not
> > > > > > > during
> > > > > > > active operation. Teardown doesn't happen that often, and
> > > > > > > it
> > > > > > > can
> > > > > > > (if
> > > > > > > implemented correctly) only block until the driver's code
> > > > > > > has
> > > > > > > signaled
> > > > > > > the last fences. If that doesn't happen, the block would
> > > > > > > reveal
> > > > > > > a
> > > > > > > bug.
> > > > > > > 
> > > > > > > But don't get me wrong: I don't want to *push* this
> > > > > > > solution. I
> > > > > > > just
> > > > > > > want to understand when it could become a problem.
> > > > > > > 
> > > > > > > 
> > > > > > > Wouldn't an explicitly blocking, separate function like
> > > > > > > drm_sched_flush() or drm_sched_fini_flush() be a small,
> > > > > > > doable
> > > > > > > step
> > > > > > > towards the right direction?
> > > > > > 
> > > > > > I think that this is the right thing to do, yes.
> > > > > > 
> > > > > > > > > > > > > When there are still entities with jobs the
> > > > > > > > > > > > > situation
> > > > > > > > > > > > > is
> > > > > > > > > > > > > even
> > > > > > > > > > > > > worse
> > > > > > > > > > > > > since the dma_fences for those jobs can never
> > > > > > > > > > > > > signal
> > > > > > > > > > > > > we can
> > > > > > > > > > > > > just
> > > > > > > > > > > > > choose between potentially locking up core
> > > > > > > > > > > > > memory
> > > > > > > > > > > > > management and
> > > > > > > > > > > > > random memory corruption. When drivers really
> > > > > > > > > > > > > mess
> > > > > > > > > > > > > it
> > > > > > > > > > > > > up
> > > > > > > > > > > > > that
> > > > > > > > > > > > > well
> > > > > > > > > > > > > let them run into a BUG_ON().
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Signed-off-by: Christian
> > > > > > > > > > > > > König<christian.koenig@amd.com>
> > > > > > > > > > > > > ---
> > > > > > > > > > > > >     drivers/gpu/drm/scheduler/sched_main.c | 19
> > > > > > > > > > > > > ++++++++++++++++++-
> > > > > > > > > > > > >     1 file changed, 18 insertions(+), 1
> > > > > > > > > > > > > deletion(-)
> > > > > > > > > > > > > 
> > > > > > > > > > > > > diff --git
> > > > > > > > > > > > > a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > > > > > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > > > > > > index f093616fe53c..8a46fab5cdc8 100644
> > > > > > > > > > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > > > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > > > > > > @@ -1333,17 +1333,34 @@ void
> > > > > > > > > > > > > drm_sched_fini(struct
> > > > > > > > > > > > > drm_gpu_scheduler
> > > > > > > > > > > > > *sched)
> > > > > > > > > > > > I agree with Sima that it should first be
> > > > > > > > > > > > documented
> > > > > > > > > > > > in
> > > > > > > > > > > > the
> > > > > > > > > > > > function's
> > > > > > > > > > > > docstring what the user is expected to have done
> > > > > > > > > > > > before
> > > > > > > > > > > > calling the
> > > > > > > > > > > > function.
> > > > > > > > > > > Good point, going to update the documentation as
> > > > > > > > > > > well.
> > > > > > > > > > Cool thing, thx.
> > > > > > > > > > Would be great if everything (not totally trivial)
> > > > > > > > > > necessary to
> > > > > > > > > > be done
> > > > > > > > > > before _fini() is mentioned.
> > > > > > > > > > 
> > > > > > > > > > One could also think about providing a hint at how
> > > > > > > > > > the
> > > > > > > > > > driver can
> > > > > > > > > > do
> > > > > > > > > > that. AFAICS the only way for the driver to ensure
> > > > > > > > > > that
> > > > > > > > > > is
> > > > > > > > > > to
> > > > > > > > > > maintain
> > > > > > > > > > its own, separate list of submitted jobs.
> > > > > > > > > Even with a duplicated pending list it's actually
> > > > > > > > > currently
> > > > > > > > > impossible to do
> > > > > > > > > this fully cleanly.
> > > > > > > > > 
> > > > > > > > > The problem is that the dma_fence object gives no
> > > > > > > > > guarantee
> > > > > > > > > when
> > > > > > > > > callbacks
> > > > > > > > > are processed, e.g. they can be both processed from
> > > > > > > > > interrupt
> > > > > > > > > context as
> > > > > > > > > well as from a CPU which called
> > > > > > > > > dma_fence_is_signaled().
> > > > > > > > > 
> > > > > > > > > So when a driver (or drm_sched_fini) waits for the last
> > > > > > > > > submitted
> > > > > > > > > fence it
> > > > > > > > > actually can be that the drm_sched object still needs
> > > > > > > > > to do
> > > > > > > > > some
> > > > > > > > > processing.
> > > > > > > > > See the hack in amdgpu_vm_tlb_seq() for more background
> > > > > > > > > on
> > > > > > > > > the
> > > > > > > > > problem.
> > > > > > > Oh dear ^^'
> > > > > > > We better work towards fixing that centrally
> > > > > > > 
> > > > > > > Thanks,
> > > > > > > P.
> > > > > > > 
> > > > > > > 
> > > > > > > > So I thought this should be fairly easy because of the
> > > > > > > > sched
> > > > > > > > hw/public
> > > > > > > > fence split: If we wait for both all jobs to finish and
> > > > > > > > for
> > > > > > > > all
> > > > > > > > the
> > > > > > > > sched
> > > > > > > > work/tdr work to finish, and we make sure there's no
> > > > > > > > entity
> > > > > > > > existing
> > > > > > > > that's not yet stopped we should catch them all?
> > > > > > 
> > > > > > Unfortunately not.
> > > > > > 
> > > > > > Even when you do a dma_fence_wait() on the last submission it
> > > > > > can
> > > > > > still be
> > > > > > that another CPU is executing the callbacks to wake up the
> > > > > > scheduler work
> > > > > > item and cleanup the job.
> > > > > > 
> > > > > > That's one of the reasons why I think the design of keeping
> > > > > > the
> > > > > > job
> > > > > > alive is
> > > > > > so extremely awkward. The dma_fence as representation of the
> > > > > > hw
> > > > > > submission
> > > > > > has a much better defined state machine and lifetime.
> > > > > > 
> > > > > > Regards,
> > > > > > Christian.
> > > > > > 
> > > > > > > >   Or at least I think
> > > > > > > > it's
> > > > > > > > a bug if any other code even tries to touch the hw fence.
> > > > > > > > 
> > > > > > > > If you have any other driver code which relies on the rcu
> > > > > > > > freeing
> > > > > > > > then I
> > > > > > > > think that's just a separate concern and we can ignore
> > > > > > > > that
> > > > > > > > here
> > > > > > > > since the
> > > > > > > > fences themselves will till get rcu-delay freed even if
> > > > > > > > drm_sched_fini has
> > > > > > > > finished.
> > > > > > > > -Sima
> > > > > > > > 
> > > > > > > > > Regards,
> > > > > > > > > Christian.
> > > > > > > > > 
> > > > > > > > > > P.
> > > > > > > > > > 
> > > > > > > > > > > Thanks,
> > > > > > > > > > > Christian.
> > > > > > > > > > > 
> > > > > > > > > > > > P.
> > > > > > > > > > > > 
> > > > > > > > > > > > >      drm_sched_wqueue_stop(sched);
> > > > > > > > > > > > > + /*
> > > > > > > > > > > > > + * Tearing down the scheduler wile there are
> > > > > > > > > > > > > still
> > > > > > > > > > > > > unprocessed jobs can
> > > > > > > > > > > > > + * lead to use after free issues in the
> > > > > > > > > > > > > scheduler
> > > > > > > > > > > > > fence.
> > > > > > > > > > > > > + */
> > > > > > > > > > > > > + WARN_ON(!list_empty(&sched->pending_list));
> > > > > > > > > > > > > +
> > > > > > > > > > > > >      for (i = DRM_SCHED_PRIORITY_KERNEL; i <
> > > > > > > > > > > > > sched-
> > > > > > > > > > > > > > num_rqs;
> > > > > > > > > > > > > i++)
> > > > > > > > > > > > > {
> > > > > > > > > > > > >      struct drm_sched_rq *rq = sched-
> > > > > > > > > > > > > > sched_rq[i];
> > > > > > > > > > > > >      spin_lock(&rq->lock);
> > > > > > > > > > > > > - list_for_each_entry(s_entity, &rq-
> > > > > > > > > > > > > > entities,
> > > > > > > > > > > > > list)
> > > > > > > > > > > > > + list_for_each_entry(s_entity, &rq-
> > > > > > > > > > > > > > entities,
> > > > > > > > > > > > > list) {
> > > > > > > > > > > > > + /*
> > > > > > > > > > > > > + * The justification for this
> > > > > > > > > > > > > BUG_ON()
> > > > > > > > > > > > > is
> > > > > > > > > > > > > that tearing
> > > > > > > > > > > > > + * down the scheduler while jobs
> > > > > > > > > > > > > are
> > > > > > > > > > > > > pending
> > > > > > > > > > > > > leaves
> > > > > > > > > > > > > + * dma_fences unsignaled. Since we
> > > > > > > > > > > > > have
> > > > > > > > > > > > > dependencies
> > > > > > > > > > > > > + * from the core memory management
> > > > > > > > > > > > > to
> > > > > > > > > > > > > eventually signal
> > > > > > > > > > > > > + * dma_fences this can trivially
> > > > > > > > > > > > > lead to
> > > > > > > > > > > > > a
> > > > > > > > > > > > > system wide
> > > > > > > > > > > > > + * stop because of a locked up
> > > > > > > > > > > > > memory
> > > > > > > > > > > > > management.
> > > > > > > > > > > > > + */
> > > > > > > > > > > > > + BUG_ON(spsc_queue_count(&s_entity-
> > > > > > > > > > > > > > job_queue));
> > > > > > > > > > > > > +
> > > > > > > > > > > > >      /*
> > > > > > > > > > > > >      * Prevents reinsertion and marks
> > > > > > > > > > > > > job_queue
> > > > > > > > > > > > > as idle,
> > > > > > > > > > > > >      * it will removed from rq in
> > > > > > > > > > > > > drm_sched_entity_fini
> > > > > > > > > > > > >      * eventually
> > > > > > > > > > > > >      */
> > > > > > > > > > > > >      s_entity->stopped = true;
> > > > > > > > > > > > > + }
> > > > > > > > > > > > >      spin_unlock(&rq->lock);
> > > > > > > > > > > > >      kfree(sched->sched_rq[i]);
> > > > > > > > > > > > >      }
> > > > > 
> > > > 
> > > 
> > 
> 
