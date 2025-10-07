Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5F0BC0E22
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 11:44:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 256B810E175;
	Tue,  7 Oct 2025 09:44:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FqiDH/zR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA0B10E175;
 Tue,  7 Oct 2025 09:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759830254; x=1791366254;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=KvARXrsFlB3tO+2HQLFw1J0GFGgL6UnZPfEZzcQbiOU=;
 b=FqiDH/zRRXjpQyFs4RBG7sg/yd5OiJ7xogXeppW2E0hQTneGdtbUQA8y
 tesBPXtWDdXht2i3EGxW2/90pmaznew7fx0KEEv+6ZVXPmoS/0dmg2lby
 DCfZ1CwDhvkfcoozJdpbwt0HN3zXPQnDcdvCA77lMzW27xf9Jbv0Yc9Q9
 BilM3ui4f4m1NP897miIUJLHwQBCX7THYQZIOuf+0bTUEu6OqNSsScG/W
 zZik/GPo7AOw9d1Ju3yXP6rOtMISYTfILwBRAxjjMrLxH1DvRkvjoLdYp
 hutFf1R9KEruJ/qT3G0DrsTmvpkOyPSTS2Iw98xPnfzUvUF66PU8RjTIX Q==;
X-CSE-ConnectionGUID: /Pj2lJYnQpCUcfHMrLHVgw==
X-CSE-MsgGUID: dpHtUwGRQMOebvVdrc7NUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="61896284"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="61896284"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 02:44:14 -0700
X-CSE-ConnectionGUID: 4rZAjyKDT7ueaYG3Aau7Bg==
X-CSE-MsgGUID: g9IyG6m/TZefXMLABqJ1fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="180904656"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 02:44:13 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 02:44:13 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 7 Oct 2025 02:44:13 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.42) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 02:44:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R28mmDom7KRaAoBJGfW7bsu19Sjap2aq/HMsEa83VMvRA7BHtPh6OQN203ifY5NoCyH0SRdRXD2jRl6rHNN2hoRp+1ifg8Lu4pnHWi4TCnN6b3ta1sYXQfugLIzlTN9SDHGpsP8zk/ZouJbrjAUl3xLIu1SjQ+kqjuXkty24wdBsies9VlfrXVTEckW+c0ZhiRcLljbFJM0UDpYaDy9L3SbPGBh8f98SqVr2xOWZSuzZsHzov9Fm9nZptfwvgJUoP3WlfifsDsyTJgD2XLTeXfwhV8kvPgPfXzSAfY2Xyh5o7EtMu++Rw09nmP58QKF0BWV8V9zXhAqtCUWeBna5EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QYxLxa/DZidVUE3UN/U5L11f8sRa7gZ6pi9oesxbF9k=;
 b=k5u01ZHJkThSy0tbW7RMsBZAWTwxmQtqYzM2SmaYgkjHI3aIoKd6VV5Sqq6vuxExJfYP3znhQ7QF8cd/+lE1HwP5f6KGl/z5SMppNkG2iogWKgZ2ZhZWK+9uCb5yS4MvUmqeY+Q4U6ha8pxwEP/hwPzxkbC/HIJvTHn1OBSgcnJYXHAJWe1v/XDhSdMwb31GMvUvr7GjC4RYBDpO9bhnR8czSg/ZFn/1OxAZn4A8ev/6tDytsHrdgXU9A7nWn9DSqG1y9Jlr+LXghODXwdFPGpxZFrRA3j836DACbNVbSg1bbhmRbFZGeoWMWb/OhONuVjDuoRwp2xM+T7+eeN2NXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB5768.namprd11.prod.outlook.com (2603:10b6:510:131::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Tue, 7 Oct
 2025 09:44:05 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 09:44:05 +0000
Date: Tue, 7 Oct 2025 02:44:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <alexdeucher@gmail.com>, <dakr@kernel.org>, <pstanner@redhat.com>, "Philipp
 Stanner" <phasta@kernel.org>
Subject: Re: [RFC PATCH 1/4] drm/sched: Add pending job list iterator
Message-ID: <aOTg47xjxt6cFnIF@lstrano-desk.jf.intel.com>
References: <20251002051604.1865322-1-matthew.brost@intel.com>
 <20251002051604.1865322-2-matthew.brost@intel.com>
 <be806a5e-75c9-45da-962f-2c1db75b4a07@amd.com>
 <aOTKvgqYFk8kw6Tm@lstrano-desk.jf.intel.com>
 <aOTPMlBMHK/c5KBh@lstrano-desk.jf.intel.com>
 <43628878-d414-459c-acad-fe7bf1afa332@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <43628878-d414-459c-acad-fe7bf1afa332@amd.com>
X-ClientProxiedBy: SJ0PR05CA0114.namprd05.prod.outlook.com
 (2603:10b6:a03:334::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB5768:EE_
X-MS-Office365-Filtering-Correlation-Id: 48010f4c-f021-436e-47ad-08de05860e0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZlVaamFsRnFWNXNHN21WN093MDVOUUZsZmdhRmI0YXFPOENwbDAzTTllMk9W?=
 =?utf-8?B?L2krRmdia2VWVVdJWGJ6QmdXazZ3cm1UVDAxMUN2RnNVSVdUTXdxYWVHblM4?=
 =?utf-8?B?MTBhdk5tWHJWby9KRmwxWUVjVGhRVjQ2eDlzdUFTZkJoUDREYjVwQlRSZjZB?=
 =?utf-8?B?OEt3dTFjTTljQjNycDd5aHViWWswYjYvWTZ3dWRYbnB4Nm9mcHNhYnNDZ2w0?=
 =?utf-8?B?OVVGRUlqRE1VY3N0N3VyNzFUTCs2UTZOS21mNW5IWWY4R3VjQzhtaGxrU3Rj?=
 =?utf-8?B?UHNxSWFxVVg2Ny9rcG5WYkRVSUVTMVlWVEZkSFZ5Q25UUXVuWHdTbUNKUE9T?=
 =?utf-8?B?VHJEOXZhMUh1M1B0cXN5SFpqcmViY2NjYUxnQzN4VFh5KzNGb24wSUZ6Z1ly?=
 =?utf-8?B?M0ZvektTc2VBZkhMcjJ1MlZDc3Fsa3lSa2pMUTkvZFkxeGg1YkRreXN4a29C?=
 =?utf-8?B?WHFoUzdoeTZkQmdWcmRQYjFUUUlOS2xSeUNsVzNuTENqd3RJZGEyL0VkbjBI?=
 =?utf-8?B?SytocDlybjlHS0hsNlFtNXpNTTUycG5JdnFNUUM5VkIvUlVpdE54NTBSc0x6?=
 =?utf-8?B?aHBBbmRhRlBtWWEyR25ZOFZKd0pwdUNHT2NjQUlGaGZ3NEE3eFZ1ZTA5ZFNW?=
 =?utf-8?B?eUNRbFEreUovTWl4YUJKOFFZby9BYkIwWTRLbzJhTE1RZFBmNkl0MDhVMHFE?=
 =?utf-8?B?RzRRVmQyUzdVeHdiZzdGRVJNTVNxeEVaaHY0azJ0Q3ZIdHg4eFJ0bGh0dHlW?=
 =?utf-8?B?dEJxQTUrbUJVRFluY2NlUm1lWFpiY1JaWGhSc1FlSEUyTm9keGpQNE5OT3A2?=
 =?utf-8?B?WEsrZlRTWkNiWkhiSVd3VHpZU2VKclNCTDhXbkNFWG03eXdjQkJHanYxL0Rl?=
 =?utf-8?B?L2htTUpxdm1QYTIrTXdXS08wNmYzWHBNVjJWMXNvSG1rVDZ3K2NqNmd0UitF?=
 =?utf-8?B?aDZqSlNuem9JQWVJdmlyVDlFSEIxcFNSSDJCdThxL3EvbmlLbkhoMTY0QjJF?=
 =?utf-8?B?bUFVekcrWm5QYzVCZFJ2V2phNmtCRnZlL3JKMDFjWWpDa0EvSmtyUnkrL05V?=
 =?utf-8?B?dHlUbURXbHF3bHcyL0RGTDZyL3VIWml2RzdJU3M3UkJtdld3S0xiTzF1T214?=
 =?utf-8?B?MG9McnZlRzRTK0JGUFROZDUzVVFwTzkzUGFFKzlNMENrOE9VcjZzYmVoWmNa?=
 =?utf-8?B?d2ptaElabXpLYVU4bWRuSzJrdFNoeVN2T2JUSFdJZlFSZVFTU1lzbFRSOGJY?=
 =?utf-8?B?eGxqZm93MDVueFdHa3hFaTl6UHFKNmZGd0JHTXUzWisrL0ttQkQxbXJDaHEy?=
 =?utf-8?B?NDVSZVFKWmhSRVlBZVh0eWk2TDQ4Z3pYZ3FqeFJLZjdYNURUa1ZOSDRDVUdr?=
 =?utf-8?B?Mk9yYkc2TTNTUTJqbjJnUjE5ZGpxZnl6ZzNNZFZ2UkhNM0wrZFVPRWViTGZt?=
 =?utf-8?B?Ujg1T2Q3ZUJTOVRjUDNOdFhCTVFsTXZpdVU1S1p2M2E1WlVNY013bVJ5Z1hJ?=
 =?utf-8?B?RjA1N0s5RkZSZXd2ckNBbGdMamo0eUd1NFNsZ2dzdTZJVTJlVWZqTWtFQ25r?=
 =?utf-8?B?Z0xraFBrRVBOQ0JZcm5Ub3dKQllJMDNEQUEvc1g5WWRXd3dKeHhNUHduSDVO?=
 =?utf-8?B?cEVldXpqNDZxRGNqQ1ZsQnlQaWtTTHhsV3BSaC9ZN3R5d0JCbVNtQzd1Wkwx?=
 =?utf-8?B?dkRtVm9FTFp5KzZYQWFaN1UxYkt3S3hwNGpiTEd4V1BxOEk2cWkxWDdQTnBZ?=
 =?utf-8?B?eDBKSG51ZWZHLzBwY01DVkhXcU9SUTVpRWVKaVFFWWJFb2VQMk1IanhJcWxF?=
 =?utf-8?B?NEhQMDJPbGN0ZCtNMUVjTlNzeGxFUDhWdXlDa2lKeW42VDB4RzBCRnkwS1Fx?=
 =?utf-8?B?SmM0OHFyZEVGNnpkaXBQcHRxUnZ0T1pKSmZwUjIyN0lGdjFNUmlCMTREdHZ4?=
 =?utf-8?Q?2VALwb/vUz6ukiffS9E6nxzP7DVxxKX2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3o3ZTB5YytINWM2TFgyV3E4UWp2RG9za1JJT0gzalNXeFllQ2IyUitiUWFq?=
 =?utf-8?B?emYrSkIwZys4V2JGZkQ5WkNHQkhid25YS3dNYzUvWHI5YkpPMUYzamtBc3Zs?=
 =?utf-8?B?TVhXWjZveEdSQm53UjV1WFNrY0dyZmZnblBKb0l1U0c3UmR2dTFTeDk0bHIw?=
 =?utf-8?B?bEJDNlBQVkZxNXYzakU5Z1dMQ0F3b0VvQ0pIMWhja0ZSTFdDYXZHT1BWSDJS?=
 =?utf-8?B?Z1BJejBsK0xQbmFsSmFSQkNlUDk3M2RTVzhZczFJV3FtWFUyem9KREZ1c2JB?=
 =?utf-8?B?a1hDOGxxSmUyd2dIWTZRdnNQdC9DbW5MeWVVeCsvaXByMXh4dUZTcGprVnpT?=
 =?utf-8?B?NWp0dW5iTXZsNHZncktXU3ZySFluZEQzdUdZSDQ5ZUp2RlBVVmw1ZjBrSzRB?=
 =?utf-8?B?YzF3SzhIRUh4SS9kMHY3SEoxQ2pLL3MvSDlXMk42S1duSDNwb2VwQ1U4ankr?=
 =?utf-8?B?V0syUmdmRWdKcDRRdlIwY296aTdJZW85TVpsaFhEcmxJWUNrOTNLc2RSSkFa?=
 =?utf-8?B?NHh6WFlXcittbVlub3RTcklrNkROMXBYOXpvWkNQQkMrMHYwcW92dW5XUEhS?=
 =?utf-8?B?WTVhczZucVRhQTBMVEY1YjFqa052YkpzbUJrU0pPNFpWR01DdXFRYW1vS3Rj?=
 =?utf-8?B?ZEFrb2pOTmozaHpHeHNOK29nUkFrak45UGZ6bXQ1Mkhma0puaDdzZHZJYnRj?=
 =?utf-8?B?SDZnYnJ3VVVzeHlLUDhYWDN4ZGFRdTZhSDZBMHRVMEF6YzFLbjZzR0EyOG5K?=
 =?utf-8?B?NmFWdy9YMWpuQmU4bDRZdzVpRTVzd2I2bnZhLzhaVC90Ym9xdnhjRWlJblFS?=
 =?utf-8?B?Z1c1S0QyZlAyWkYySTEzNHFoNlFYNWIrRTk5cVZOdmhZMmNBcVBVUWFubXEx?=
 =?utf-8?B?NGp2T0FVU2tuOUV3Q0pnTDlMTHlpZk9xZ0UzTkloUWpDV2NhL0xxaS9UU1lT?=
 =?utf-8?B?VVFFUm9DVXY0L0JSc2ZnaitmN1BPQ3dtalhEemdobCtXTmNMdk9lUzZHQTJW?=
 =?utf-8?B?eXJNeXFuSkQvclZ5UG5ZUnBsVWFzeXlFSGtNNENxbnljWHNnV2VyRGExbGl3?=
 =?utf-8?B?MC9QS2Q5V1prbUhJQ0F4KzFXbXE0MG55S1lMRElwdDRMMzZmRWhwSEkwTUFT?=
 =?utf-8?B?b0dQSnNlNkZKdU44NS9reFp3Y3kxY3lUeU5BWTBvSmZQTFpKWllwcklkU3Js?=
 =?utf-8?B?blUxWWJkdlpObDZLZ3BKSExKa0E5azhmRE1aQ1BjSzlBK0E3WTRoczNoWUdU?=
 =?utf-8?B?bC9WMGdNQzBrOGZNOTZRdHBOamhIVC9ZWUhPbm8zNjRzV0ZsZnlQNzhCaEhQ?=
 =?utf-8?B?bGVLNlZ2RWRpUUhORmlyNFNHamphd0xBTHVZM1RDOXB2ejZjUnQ0MVR0bFFV?=
 =?utf-8?B?K3BPYVVKMVIxQi9nOHhlWWtvdEN1NUhLNmJXa0hyVXJDWmtXWm55TkhaWDdt?=
 =?utf-8?B?Yzl2V25oR1FSSGI3UFBpMytxVGxhVk9MazZXTTVqb2ZnakxrSERWcDJiMEp2?=
 =?utf-8?B?ZUhTQ1lDKzNNd0tsYTM3QW96ekhrR0pPQ0xSZXA4Ykd6amhKNEx4am5wRldj?=
 =?utf-8?B?YWhObEU0NlRHSjZ2NnBvMWMrdVFPSkNZMVVncWw3TW1pR2RjQ0lxMkpNbmJM?=
 =?utf-8?B?RDVmb0RPdW9TTkx6ekpOcGt0blZKOUd2WmNzSmZlNzZOYnN5WnFoTlh1UVVn?=
 =?utf-8?B?MVR0cWlxNlV4aWFPdzZSVkZWd1JVRTZ0TVZDcUYxdlY2NVRwTHhuZjJiQXM2?=
 =?utf-8?B?NGU1RitzV051dVlrSHUzOUZjYnZRTWptU2lKRWZsM1ZRU2JHbU9vWU1qVFpY?=
 =?utf-8?B?b1J6dmlBV2J4bjRvN2ppREpTZkR6cUpZcTdTcHorSDg4cmRJZTlMZk1UZTJk?=
 =?utf-8?B?NVN4TktXQ3VmVjBoY0hGMFdQSUpod3ZWMWhyQ0ozVVZoaTducVhCeW92WmRX?=
 =?utf-8?B?TndWNzNVelBGRVp4cSs5Q0tyaHNUelRRalFaYkdxbzQyMTZHSGgzMjFjbjRn?=
 =?utf-8?B?QTEycTBiR2x4TjBhT1lmcHFwd2MrK0JaWm9MWG9UUHMyQ0FudjcrVDVOUkUv?=
 =?utf-8?B?VnVqZGVWQ0YrcTVrSGhiZjVsREEyMldmck1RWXJUdXcrZXRrL01KVXF5VUxZ?=
 =?utf-8?B?OHNveTkzcldORWg4YjhTUGp1d1cvRkkvdUxJZ0lsZXU0WTFueXZObHc0NHdR?=
 =?utf-8?B?Rmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48010f4c-f021-436e-47ad-08de05860e0e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 09:44:05.4395 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CqtzGAFXm3CjGu87dHGa3wnaR7YDFMdeTfoIrz5mcJem5Vu09CfrLJNJaJpB1duIoreic/gQEVZnPcxm+WnOBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5768
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

On Tue, Oct 07, 2025 at 10:44:00AM +0200, Christian König wrote:
> On 07.10.25 10:28, Matthew Brost wrote:
> > On Tue, Oct 07, 2025 at 01:09:34AM -0700, Matthew Brost wrote:
> >> On Tue, Oct 07, 2025 at 09:28:56AM +0200, Christian König wrote:
> >>> On 02.10.25 07:16, Matthew Brost wrote:
> >>>> Stop open coding pending job list in drivers. Add pending job list
> >>>> iterator which safely walks DRM scheduler list either locklessly
> >>>> asserting DRM scheduler is stopped or takes pending job list lock.
> >>>
> >>> Taking the job list lock and walking the pending list while the scheduler is not stopped is most likely a NO-GO.
> > 
> > Oops, I misread your statement—it's late here.
> > 
> > The use case for walking the scheduler with acquiring the job list lock
> > and without being stopped is in debugfs for Xe, where it prints out
> > pending job information. That seems valid. There are couple of other
> > upstream cases where this is done but likely not needed.
> 
> Yeah, I thought it would be something like that.
> 
> > I checked and found that AMD acquires job_list_lock and walks the
> > pending list in two cases within amdgpu_debugfs.c. PVR also acquires the
> > lock in imagination/pvr_queue.c.
> > 
> > If this is really controversial, we don’t strictly need this in Xe and
> > can remove it. But of course, AMD GPU and PVR would need to be fixed as
> > well.
> 
> I think for debugging it is valid, but we should then have two different iterators.
> 
> One for debugging which can only be used when CONFIG_DEBUG/DEBUGFS is enabled.
> 
> And a different one for the functional side, e.g. iterating while the scheduler is stopped.
> 

Honestly I'd just lean towards dropping the debug version then. It is
basically useless information in Xe as the number of pending jobs can
dervived from the ring's seqnos which is also printed.

Matt

> Christian.
> 
> > 
> > Matt
> > 
> >>>
> >>
> >> I agree. But this patch doesn’t do that — it actually does the opposite.
> >>
> >> It ensures that if you need to walk the scheduler list locklessly, the
> >> scheduler is stopped at both the beginning and end of the iterator, or
> >> it correctly takes the pending list lock.
> >>
> >> So, what’s the issue? Or is there just some confusion about what this
> >> patch is actually doing?
> >>
> >>> As far as I understand it that is exactly what Philip rejected as looking into scheduler internals during the discussion on XDC.
> >>>
> >>
> >> I thought we agreed on having a well-defined iterator for walking the
> >> pending list, ensuring correct usage, rather than having drivers walk
> >> the pending list themselves. From my understanding, this is exactly what
> >> we agreed upon.
> >>
> >>> So why is that actually needed? For debugging or something functional?
> >>>
> >>
> >> Drivers inevitably need to walk the pending list during recovery flows
> >> (such as resets, resubmissions, VF migration, etc.). This ensures that a
> >> driver knows what it’s doing when it does so, and avoids directly
> >> touching scheduler internals. Instead, it should just call
> >> drm_sched_for_each_pending_job.
> >>
> >> This has actually been helpful in Xe already — when I was working on
> >> scheduler backend changes, it helped catch cases where I accidentally
> >> flipped the stopped flag while walking the job list. Without this, it
> >> could have randomly blown up later if a perfectly timed race condition
> >> occured (e.g., free_job fired).
> >>
> >> Matt
> >>
> >>> Regards,
> >>> Christian.
> >>>
> >>>>
> >>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> >>>> ---
> >>>>  include/drm/gpu_scheduler.h | 64 +++++++++++++++++++++++++++++++++++++
> >>>>  1 file changed, 64 insertions(+)
> >>>>
> >>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> >>>> index fb88301b3c45..a2dcabab8284 100644
> >>>> --- a/include/drm/gpu_scheduler.h
> >>>> +++ b/include/drm/gpu_scheduler.h
> >>>> @@ -698,4 +698,68 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
> >>>>  				   struct drm_gpu_scheduler **sched_list,
> >>>>  				   unsigned int num_sched_list);
> >>>>  
> >>>> +/* Inlines */
> >>>> +
> >>>> +/**
> >>>> + * struct drm_sched_iter_pending_job - DRM scheduler pending job iterator state
> >>>> + * @sched: DRM scheduler associated with pending job iterator
> >>>> + * @stopped: DRM scheduler stopped state associated with pending job iterator
> >>>> + */
> >>>> +struct drm_sched_iter_pending_job {
> >>>> +	struct drm_gpu_scheduler *sched;
> >>>> +	bool stopped;
> >>>> +};
> >>>> +
> >>>> +/* Drivers should never call this directly */
> >>>> +static inline struct drm_sched_iter_pending_job
> >>>> +__drm_sched_iter_pending_job_begin(struct drm_gpu_scheduler *sched, bool stopped)
> >>>> +{
> >>>> +	struct drm_sched_iter_pending_job iter = {
> >>>> +		.sched = sched,
> >>>> +		.stopped = stopped,
> >>>> +	};
> >>>> +
> >>>> +	if (stopped)
> >>>> +		WARN_ON(!READ_ONCE(sched->pause_submit));
> >>>> +	else
> >>>> +		spin_lock(&sched->job_list_lock);
> >>>> +
> >>>> +	return iter;
> >>>> +}
> >>>> +
> >>>> +/* Drivers should never call this directly */
> >>>> +static inline void
> >>>> +__drm_sched_iter_pending_job_end(const struct drm_sched_iter_pending_job iter)
> >>>> +{
> >>>> +	if (iter.stopped)
> >>>> +		WARN_ON(!READ_ONCE(iter.sched->pause_submit));
> >>>> +	else
> >>>> +		spin_unlock(&iter.sched->job_list_lock);
> >>>> +}
> >>>> +
> >>>> +DEFINE_CLASS(drm_sched_iter_pending_job, struct drm_sched_iter_pending_job,
> >>>> +	     __drm_sched_iter_pending_job_end(_T);,
> >>>> +	     __drm_sched_iter_pending_job_begin(__sched, __stopped),
> >>>> +	     struct drm_gpu_scheduler * __sched, bool __stopped);
> >>>> +static inline void
> >>>> +*class_drm_sched_iter_pending_job_lock_ptr(class_drm_sched_iter_pending_job_t *_T)
> >>>> +{return _T; }
> >>>> +#define class_drm_sched_iter_pending_job_is_conditional false
> >>>> +
> >>>> +/**
> >>>> + * drm_sched_for_each_pending_job() - Iterator for each pending job in scheduler
> >>>> + * @__job: Current pending job being iterated over
> >>>> + * @__sched: DRM scheduler to iterate over pending jobs
> >>>> + * @__entity: DRM scheduler entity to filter jobs, NULL indicates no filter
> >>>> + * @__stopped: DRM scheduler stopped state
> >>>> + *
> >>>> + * Iterator for each pending job in scheduler, filtering on an entity, and
> >>>> + * enforcing locking rules (either scheduler fully stoppped or correctly takes
> >>>> + * job_list_lock).
> >>>> + */
> >>>> +#define drm_sched_for_each_pending_job(__job, __sched, __entitiy, __stopped)	\
> >>>> +	scoped_guard(drm_sched_iter_pending_job, __sched, __stopped)		\
> >>>> +	list_for_each_entry(__job, &(__sched)->pending_list, list)		\
> >>>> +	for_each_if(!__entitiy || (__job)->entity == (__entitiy))
> >>>> +
> >>>>  #endif
> >>>
> 
