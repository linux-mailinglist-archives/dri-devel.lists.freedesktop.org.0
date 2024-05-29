Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C3D8D3270
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 11:00:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C06D611356D;
	Wed, 29 May 2024 09:00:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EtnSnUyL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9641135B6
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 09:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716973240; x=1748509240;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=X2YJpWZCcjZXeRY5a3kXTww9fnKt+CSOSvKWn1yjMco=;
 b=EtnSnUyLA47fpmPqjk/f2zND4NCwgaCIJi8P5wcztCIpZWfLyHdWqNFc
 ZmYZ2Vw6b6Z1F8BvGUhK29fxg0f0tfQ1UF0VddXr4yHgrIR+4YbBCfGIp
 9QSSBoNt2wemc7XCfKn4FF5d4W+rT8e8CXODpI+ek+wZ2zqEiP1mkUoxV
 dUG41XhIRqqtxQI9UF3fUnB+ZjCau1P0JPvYS3yPjPssxvUMY9OxKaOaY
 34zpeG6vC41LIYtgUxd75E33LSVk4YYpBO94kqCd2rLc+fVeBLe+zW8a5
 SNULYssh0xsNWR1y/JmmvwjWSzMJoRPGy2PDXU7ucNxEEDbl/vI7LNs5O g==;
X-CSE-ConnectionGUID: IIlB0hL2SGO9jHgsXGv7kA==
X-CSE-MsgGUID: pKAoh36zR/K1PWukNI+yvw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="38750919"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="38750919"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 02:00:39 -0700
X-CSE-ConnectionGUID: L8x1kHWpRDq3RajMGD6kHQ==
X-CSE-MsgGUID: FFvOnSAUSfKWAPrL8PXIaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="35982404"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 May 2024 02:00:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 02:00:38 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 02:00:38 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 29 May 2024 02:00:38 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 29 May 2024 02:00:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HnItq7QhiPS+zchI0JOE4z9hr5G9GYdGkrG5otz6JpmaAOlCOyPKGQeiPiEmgsO7vk0SAJgPeC0M+JYVeq2jCt61E58lVgZ5VylB1lCSlpwqMEXca+Yu23bCDjFDsWLjZKC4UNwuAfV1vov0GQAZ0OaRvlnAAra6oT6oZtf//hVOX0IYYTzaOA4VxyMqldG5K4ri23FLz6VDqIgpx29whn/lleYH/Bo1HApnjB5uupAEKu9PlQ5Maj/s4WQNpGP2ZeYiM0b6KT5XI/FWaGbWhXSfgjwJ1YdzSlyFNk9pLVPJ0boVHtVP8nWJexNhpQRe8vaQH9vvikguT7S3hdUjhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cw6aE67SLampuU+XgWLo2DCERoiHSCJKSRA8cEWDtuY=;
 b=cL5yYp6tzaB3hI26/rM2VZ6qPoCcrBBM3fKojmiJfVLtSGtlVeju2lmzACwWQwd+WjMWugVYZtv6SWBf5V0/uGV/jQtBeF1wU+0dS6OO0Q8Qn8X8f4PnfMSxnRDeuy2v9ZtvntcYaaFwneOiZ4JlDLarTFZ5ZOIRuJruxy0z0SqBzxzfTm4MW5wOz7IgnCIQfiWZz6XDcVCC+VeApv0c3kx0pnGCsbMw9wjIWn6XuqYHohIQqStxa5ySwydHmWI0STk3kCPMp4Ltnl4nY4+Yj2DsFWDm71pRmfHTELAvCERBB8josqd1g/q5plPzpfX68BoUZzgsWOSRsnBxV0HWpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by DS0PR11MB7832.namprd11.prod.outlook.com (2603:10b6:8:f5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.17; Wed, 29 May
 2024 09:00:36 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::d244:15cd:1060:941a]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::d244:15cd:1060:941a%7]) with mapi id 15.20.7611.030; Wed, 29 May 2024
 09:00:36 +0000
Message-ID: <eedb1df0-e745-4b48-9261-faa0ff320ee9@intel.com>
Date: Wed, 29 May 2024 17:04:28 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/20] iommu: Add iommu_paging_domain_alloc() interface
To: Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>, "Will
 Deacon" <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Jason
 Gunthorpe" <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>
CC: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "Kalle
 Valo" <kvalo@kernel.org>, Bjorn Andersson <andersson@kernel.org>, "Mathieu
 Poirier" <mathieu.poirier@linaro.org>, Alex Williamson
 <alex.williamson@redhat.com>, <mst@redhat.com>, Jason Wang
 <jasowang@redhat.com>, Thierry Reding <thierry.reding@gmail.com>, "Jonathan
 Hunter" <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 <iommu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20240529053250.91284-1-baolu.lu@linux.intel.com>
 <20240529053250.91284-6-baolu.lu@linux.intel.com>
Content-Language: en-US
From: Yi Liu <yi.l.liu@intel.com>
In-Reply-To: <20240529053250.91284-6-baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0059.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::19) To DS0PR11MB7529.namprd11.prod.outlook.com
 (2603:10b6:8:141::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7529:EE_|DS0PR11MB7832:EE_
X-MS-Office365-Filtering-Correlation-Id: f41e92a0-ddd1-4074-8819-08dc7fbdcdfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|7416005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TjdtL0tUTUFZUEduakhvaFpldmNiWTdhcTErMG43aEg0UEhhTG1ZU2V0V25p?=
 =?utf-8?B?QlUwbG1YYk0xMGhUSGhoNHovRWplUlZhVXdGaTZ2TFRyQ1VFZkJmMGsyMTky?=
 =?utf-8?B?TUlHT2xRaDl1WlMreW5Bc25VOXFCN0tjWkpIRVM5NTFtaytlSEZTZTlYeUgv?=
 =?utf-8?B?cm9OekF1WHg3RmpQNXgzaXBpd28rZ0p0OGVsUFNjYnRqdkpjVGVuM0k3YmJj?=
 =?utf-8?B?ZitGcndRb0NNeVYwSllqdURKNjBzVWlTdzJZWEh3Z2hXSXErNXhRMWdpRWhz?=
 =?utf-8?B?eE9oUk5BcEh5RmsvUnNjQjR6bHZIYkd5L2o2RDQxWWlGb3NsMnBKV2luMWRv?=
 =?utf-8?B?K1JuMHNqZVhwTFRlRHE0TDhwUXBoMWZSNVJkRitXclh5OWd1OGQrbm1ORCtj?=
 =?utf-8?B?WnF1VVJrZmxTdG9ndzFxRGsvelk3NEhuaDFKcGRlcHY0emZ1TFd3MDdWcThm?=
 =?utf-8?B?NElRaVM3MUhSNEJlM0dBT0d0VC9BYmRpNTlXVHF5ZzhpcWQ4ZDF4K3FRTUF3?=
 =?utf-8?B?Q0FEMGFRK0F2RXhPRHZkc1VTc0tEQ05LQVR6eS80VmE3eVA0SGJrQi84WTk5?=
 =?utf-8?B?Z2tHdmFQWUdCa3dQSDlKcGNQUStxV2R4SXROT0pHTXNTRUg4dHVFSU9mTzg1?=
 =?utf-8?B?NlVIaGFVTVNIdVU0UzlGY1hvT3ltQjdSbW5MRWtrMUkvRE1ZOEFXa3orVXRW?=
 =?utf-8?B?UFdSQWhGbWM5V01YdndlRllqTEZaVnRBRGE1VDMrcEx5RXVRNmg0dGhCUHJk?=
 =?utf-8?B?cm8zTm9PYmQyRUJ4c0VkTStNTytyTERKN0s0dTMyMGtGVkR3dVF6VDY1Q1Jl?=
 =?utf-8?B?NEdwYTVMTUg0RXB6ME5jRGdReUo1NjBtektMKzNHSG50RXFyQys2WGdRaHVL?=
 =?utf-8?B?R3M4ak85ZU1nSUU5L0RKU0lsUU5mM2c2OWtOVUZkYTdZNFdsenI1UmFnb3RC?=
 =?utf-8?B?L001dTNkRjlkTUFSODArYzZHYTVnZFNlSDBwZFA5MTFzNzNWRlduZndwM2ZE?=
 =?utf-8?B?Z0ZZUEFIUk5SZ0Z0MTk3Z2ZwUnhjT1NLd0JMdno0LzNmY09STURsMlF6WDhG?=
 =?utf-8?B?TEJyWmc5NU1KKzkzK1lRSkhuaS8vMTAySnZybzVId0d6Q3BoV0Jtay9NVFdR?=
 =?utf-8?B?TTZOcm1nSzdPaG10NDBNaUJGZHVlSUUwZGdiQzU1dGFuRWVkdDQ4a3dVdmEz?=
 =?utf-8?B?WGNuOFZrRGFmbS9YSUVtRVBuUGVmd2dwM0lTYVlYRXV0TnJEdnl0dmUzSW9G?=
 =?utf-8?B?d3ZKU2dnU3lBQzcxaDB0YmxVZUI4blZjMEI0dFc3dEpDbWVLYzBBNDFIZzh4?=
 =?utf-8?B?UGlLNWcvZVBBTnpWV0VuN2F6SGFlVGY2MkRmZGZwcTEyZWlGeFk5aWlDRkxo?=
 =?utf-8?B?RzBrT21tKzRrYVBRTzM3NmFzYnVPdjIycFo0ZVFsczlGcE1OV2thbFFpeW9q?=
 =?utf-8?B?dEhsNytFRU4rd3Z3UWh3cytNK0xLVlJxTFFjZEJZakhWZ0FERWJHdDBDVURt?=
 =?utf-8?B?YU9EQ2RsOHZCdDNNd0NQUzhtbWlYR3EydTdMZmxWa2crNzZQNzFwRzdjNnpl?=
 =?utf-8?B?bUxUck9tZXY0WXhhVmdvNzJoMmtHUmMxRHNVb0sybVFzc2JEQVlWMXd1S0xP?=
 =?utf-8?B?RXFKeEdSdUMxOG9ObTFvNFRPL05sSjgyQmV5cmRMeTZWVXpnaHJ1SjlBdVV0?=
 =?utf-8?B?bi9ieVRBZ1RyUVY5dVgvZkcwU2VIWWdJZkoxeFIxSythVGtaYXpMK0JnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(7416005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVg3M0p0akd1Tnl3SzRJQUhqRm9BMVNuai9sRjR6NUZtVW9oZ1V3Qk1kU3NP?=
 =?utf-8?B?NVlJd25idkFnQ0pzYml0SDlHVVVOaUI2dUM5SGx1d25aeTRLbkJ2cksyand0?=
 =?utf-8?B?N3RtWjk1OXpHWDNDK0RWREtQa1JOZCs3WEhWMkVxZUlkU21UeTNhNHlmWjhO?=
 =?utf-8?B?TjFBQ2s2OHl5UlBFU1EwMldZL0hUQ1h1MVV1V3dzVmdWZ1dPbUtZbC8rakxl?=
 =?utf-8?B?VlBJMHBoMjV3WTQ4V2FabUlkeS9rNUdWS3dMZHZMZTQrOThKdldzRHMzUE9w?=
 =?utf-8?B?NTIvK2FwWTY1c2Nod3VrTXRDVlFUSGdPU29ZVHF2WnByN3RGMi9ZUjF2cGFY?=
 =?utf-8?B?M3hOM1phR09yVHdZKzFFQXo0NXJwV0Yvc2lzZGxDYTFBS1llSkhIZCtSOUZq?=
 =?utf-8?B?M0R5ZitLS0FhWk50UUNHZFIrdWtwQldhT2F2bUszMThvNkZCczlWRFZEOWNZ?=
 =?utf-8?B?OEJEOFVqU3hPSXJ6ZzRBWFV3Q2YyZHlFVTI0OWNyWklhcjFrZ0Frci8zWWZR?=
 =?utf-8?B?M1RFUzhJYmh0eTRwMExSdXZzc3JGMGNneEY1YzhWZFdkTlhsSUNDUGVuZXJm?=
 =?utf-8?B?N3NwZDdqYitmMmJBTmM0d0tjZ1ZabWtxRkpQc0w2S2FsV0EyMTMzdVNZeHVp?=
 =?utf-8?B?UmhrZGo0bExWR050S2traER3bU1sVDRJRmEwN0NMc0JMOUVSQjJQU2x1QXlz?=
 =?utf-8?B?bDBtVW00MERqOTlrY1dwUzE2S1ZMNjFNWXVEOUo0U1NOZHdVL25pTm9PSkpp?=
 =?utf-8?B?L2NzZWVtbW1QbUU3ZEU3aFVzUlhmclZCcCtLd3BCR0xBY3JiNHFET2pMc1VP?=
 =?utf-8?B?NGdnM0w5b3ZEbjFaeXMzelhPQUxFc08rcWcyOWc3NmVxbFM5dVdZbkkwc2o3?=
 =?utf-8?B?Y3hEZWQrQ1JNZWtrc0Q2YTZ1T3ZTZjZ3MHF1NlRxbjRxTThWaTFobGkzcHRN?=
 =?utf-8?B?bk9XbTFVK0FlamNJdDg5ZkNwUFlzeU9TYzJUaklETkkvUWFsVHZBaVIzVU4r?=
 =?utf-8?B?eVVWSW9WSThqenQwOFRyZkxZRHlpRkZ1QkM2NGJyRVJwczVFK3BBQWdGMEQv?=
 =?utf-8?B?OXpMT2RFTDl4OTFoSWNZODdMcjF4YjNkVFZ0Z0lFOW5YcVJuUjIyUkFVb09I?=
 =?utf-8?B?TzF0SFNTd0VUTmhvNTlyYVBnWE1Xdmx4QmZnWThGZXhyeHNxSS9OQWV4eHRD?=
 =?utf-8?B?cTdleUlCUkdGcHc1Ykt5YUx4cFI3ZEoxWXVlSTVLSnY3SXpMWGpjTysrSzM5?=
 =?utf-8?B?bTY2bFA2S1ZqbjYyZnRGc1A3di9VRWxRQkVRQW94MDZFMXgya2dUdjF4Ny92?=
 =?utf-8?B?ZWgrT2NIcU1jOXJCTTV5UTk5S2dzOVJOMVF0YTI5QWJ1b2VjL0FINi9DS1Ax?=
 =?utf-8?B?aWwxK1JvREsyOXdKV3Z6cGtrUEVYcFZiYncrM0phcENsVXhjWVB5THF0aHdT?=
 =?utf-8?B?b09wTDJRQVROdFZGQ1lFcW1BQTZhVDZSWHM0cVBhSzhMZjA5N3BNUGcyUjYy?=
 =?utf-8?B?WGNCblF4a0lMUTlwbFNZeVpaN1dCQzhhY1RHamVzZk5ETkpWUkc1Smg1SFhk?=
 =?utf-8?B?ZVRXRXZoWk1RWGJHd0R0NFdoMXg0YURwNzdjckF4Vnk0RVNCVmxKZk54MmVC?=
 =?utf-8?B?NC93bFdFZWpqN3QxMldqbzRNMTR2S2tGS1pzeDJUeEtFUGd2UmpQZllnVzFq?=
 =?utf-8?B?cmFnUzZuUnNrei8zTExxenVzUjIrbDA1aDc3V1hCMHk4S1pxdjRVcnlQVnkr?=
 =?utf-8?B?WUlUdGs3dG1QZmlTN1NKS2Z2T1VYNDVFYmx3SFpCaHh6VkVGeUN1dUY3enBI?=
 =?utf-8?B?OHBnSVY2Nkd5dG1tQU5pd3Q0WG9iSWZBSGtIQXlYYW1LMW9GaEdGTVZDRC9o?=
 =?utf-8?B?YWRLeEVmeTk2OHg4VWJOVVNNbHpQdXdOL1l1OUY3K3ZiOWtKMXpsdzlBenRa?=
 =?utf-8?B?aE1JMXg1cU94aFNrcWZGTENrcm1zZzd0bTd2aUNOY2dOWGVLOWoxWE5YTTZt?=
 =?utf-8?B?Qng2ZkdRa3RMZlYyY0xJUGI1OU1zVlQ5N3FoM2pTRnRwdU5YTEpNUFhJbUhX?=
 =?utf-8?B?aE5iNmJtZ2FYTmpsYWh1VHd5KzFMbTZhNzdvWnRzU3A0TU5iREdUL0JYTUtI?=
 =?utf-8?Q?3Le6h49ko5vVt7uDBFvV23kEb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f41e92a0-ddd1-4074-8819-08dc7fbdcdfe
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 09:00:36.2251 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EHk+RUewDMYAiTILFKBdl4oOc2MvepzGdL2QKD8FvpH/zq1huFOkeMtiR4AvTXpfDjzG/AB6RSq6ZKUlzGlzHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7832
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

On 2024/5/29 13:32, Lu Baolu wrote:
> Commit <17de3f5fdd35> ("iommu: Retire bus ops") removes iommu ops from
> bus. The iommu subsystem no longer relies on bus for operations. So the
> bus parameter in iommu_domain_alloc() is no longer relevant.
> 
> Add a new interface named iommu_paging_domain_alloc(), which explicitly
> indicates the allocation of a paging domain for DMA managed by a kernel
> driver. The new interface takes a device pointer as its parameter, that
> better aligns with the current iommu subsystem.

you may want to move this patch before patch 03/04.

> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>   include/linux/iommu.h |  6 ++++++
>   drivers/iommu/iommu.c | 20 ++++++++++++++++++++
>   2 files changed, 26 insertions(+)
> 
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 6648b2415474..16401de7802d 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -781,6 +781,7 @@ extern bool device_iommu_capable(struct device *dev, enum iommu_cap cap);
>   extern bool iommu_group_has_isolated_msi(struct iommu_group *group);
>   extern struct iommu_domain *iommu_domain_alloc(const struct bus_type *bus);
>   struct iommu_domain *iommu_user_domain_alloc(struct device *dev, u32 flags);
> +struct iommu_domain *iommu_paging_domain_alloc(struct device *dev);
>   extern void iommu_domain_free(struct iommu_domain *domain);
>   extern int iommu_attach_device(struct iommu_domain *domain,
>   			       struct device *dev);
> @@ -1092,6 +1093,11 @@ static inline struct iommu_domain *iommu_user_domain_alloc(struct device *dev, u
>   	return ERR_PTR(-ENODEV);
>   }
>   
> +static inline struct iommu_domain *iommu_paging_domain_alloc(struct device *dev)
> +{
> +	return ERR_PTR(-ENODEV);
> +}
> +
>   static inline void iommu_domain_free(struct iommu_domain *domain)
>   {
>   }
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index f1416892ef8e..7df4a021b040 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -2016,6 +2016,10 @@ static int __iommu_domain_alloc_dev(struct device *dev, void *data)
>   	return 0;
>   }
>   
> +/*
> + * The iommu ops in bus has been retired. Do not use this interface in
> + * new drivers.
> + */
>   struct iommu_domain *iommu_domain_alloc(const struct bus_type *bus)
>   {
>   	const struct iommu_ops *ops = NULL;
> @@ -2074,6 +2078,22 @@ struct iommu_domain *iommu_user_domain_alloc(struct device *dev, u32 flags)
>   }
>   EXPORT_SYMBOL_GPL(iommu_user_domain_alloc);
>   
> +/**
> + * iommu_paging_domain_alloc() - Allocate a paging domain
> + * @dev: device for which the domain is allocated
> + *
> + * Allocate a paging domain which will be managed by a kernel driver. Return
> + * allocated domain if successful, or a ERR pointer for failure.
> + */
> +struct iommu_domain *iommu_paging_domain_alloc(struct device *dev)
> +{
> +	if (!dev_has_iommu(dev))
> +		return ERR_PTR(-ENODEV);
> +
> +	return __iommu_domain_alloc(dev_iommu_ops(dev), dev, IOMMU_DOMAIN_UNMANAGED);
> +}
> +EXPORT_SYMBOL_GPL(iommu_paging_domain_alloc);
> +
>   void iommu_domain_free(struct iommu_domain *domain)
>   {
>   	if (domain->type == IOMMU_DOMAIN_SVA)

-- 
Regards,
Yi Liu
