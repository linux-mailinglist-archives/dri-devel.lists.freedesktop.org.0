Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9832BC35A43
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 13:26:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E2210E74D;
	Wed,  5 Nov 2025 12:26:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MdegY6dd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C55A10E748;
 Wed,  5 Nov 2025 12:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762345594; x=1793881594;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6ouS8XWSKOEczfKhD9GLtn4686LUfomjD7ciw6xdsAI=;
 b=MdegY6dd37EuSmVANOsE0iXncqkJuBLWmGv0FEb8qzpQDdL4TyvrTIWN
 3DhDpeuBIwb/BSTlZ6yljMoOnvBiWmZw3la8nOYSCpummScvP7fn/Pj+v
 fP9NOCKV5XM9UMfYjXkHVpOM9Syoe15iLCm1PS94fAB2BkOmZ4qGfEdyL
 pLJMcleQLQN8AIvvrJlg5my5a6Z4nxV4wVp36XPZlIW+nxBwQer0k8eI4
 vEtRt1Gj9L4he1ooIvjlgt2Zl+rB8JXHJ6/dfaTl837Y7NvLmmw2/qAnK
 ujkxK6HZxIrSC8M8wEi7idrNLhuW/AvaCW2sp7sbriWh+nmUxB6DSFIz/ A==;
X-CSE-ConnectionGUID: F45MO1WsTRC4KjKNOZlw/Q==
X-CSE-MsgGUID: 1WX/GWK0SomY40WLm6OAow==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="87086535"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="87086535"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 04:26:34 -0800
X-CSE-ConnectionGUID: QSSAVNI5T4mGjTcAtJEaLA==
X-CSE-MsgGUID: jrFy8//dRYG9Ow+dhSecfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="224690121"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 04:26:33 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 04:26:32 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 04:26:32 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.40) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 04:26:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w9W7hzVetc9luwj7lCiJWe14zX7rQ6Sm22qLCCLcVzkpABeQh4Z7AZBl6xM3lYO1OWIF21RBL+aegEjaJnVRd1MqYEtpyHjiJ2lfRR0doDg/UqznpYWIMx9ATtJvkVFQmuCpyeHCeB9e9RSmj8ReIJHWqXzkHITxhEg3/B7XxGrSXYKYXczHO5O2tpuFR/6bMqv7/mk3Rxh07s8EGqi53m+58jtXntrUSavlbUHwOsPKS7oTsKIjgMOBjISPm4tW2lHW4pLDqE3HDMS30fzoJhoMdIzCg8UDnY72ZgBY7wuI8D3y127Nm6tGKGf8HFn2XkJtTU+5LpW+o1P/Nos1yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4/fJWluOHrEA7VOwBcI5xHUQINSj8TtfPvddHMZsTm0=;
 b=qJnGobTRo0qqOnkBsIm3ie9fp/QDGAiNs6L/hmGDFSteWaglmnKzK9G7OLEWtxbHQqtamk2uGSg2kyMx/I0VlpauEm2mWEJKslaKdScGys3GwfPtRezNbGRdk3JDYvxmd2THr3pCYna1dHq9k0FsYgbcoYuHVeD+PiVNuLIxiEYIDWoiYL2fui12CRogt+Cbu5rOOiYVxt+NtMglSc/Ht3O2XxTuRtN7cwXTCoRgZJS16lMd8Kxcm2v70Cv6VG5mjY6xiXbUK8XM47najZbKZbU19TORZdEOHssR7v5yEOoVyXhXwxINb646J0mpvnFAtWL4lhNOqEiDm809Jc8FKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Wed, 5 Nov
 2025 12:26:28 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.9275.013; Wed, 5 Nov 2025
 12:26:27 +0000
Message-ID: <f4faba6a-5d82-4122-926b-9815691d7624@intel.com>
Date: Wed, 5 Nov 2025 17:56:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v5 20/24] drm/i915/color: Program Pre-CSC registers
Content-Language: en-GB
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>, "Shankar, Uma"
 <uma.shankar@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "pekka.paalanen@collabora.com" <pekka.paalanen@collabora.com>,
 "contact@emersion.fr" <contact@emersion.fr>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "mwen@igalia.com" <mwen@igalia.com>,
 "jadahl@redhat.com" <jadahl@redhat.com>, "sebastian.wick@redhat.com"
 <sebastian.wick@redhat.com>, "shashank.sharma@amd.com"
 <shashank.sharma@amd.com>, "Sharma, Swati2" <swati2.sharma@intel.com>,
 "alex.hung@amd.com" <alex.hung@amd.com>
References: <20250702091936.3004854-1-uma.shankar@intel.com>
 <20250702091936.3004854-21-uma.shankar@intel.com>
 <DM3PPF208195D8D2E06D5B5CC7BD5DFCC87E3F0A@DM3PPF208195D8D.namprd11.prod.outlook.com>
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <DM3PPF208195D8D2E06D5B5CC7BD5DFCC87E3F0A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0113.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::6) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|SN7PR11MB8282:EE_
X-MS-Office365-Filtering-Correlation-Id: 50c2a5f7-2ff9-40e3-2618-08de1c668aaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QTgvOUtQaVNZRXBWNlR6cERhNWhnbGFMZkc4bkFnY3MzcS84RlVhT09TMGRL?=
 =?utf-8?B?QjljZkdjd0JDVDZsMUxUemFBSjJ0NCtpbW5LTURFQ0g3NmlZWTNFLzVSNTFs?=
 =?utf-8?B?cnpEWW05ZENHMUdkendMSEl3MnRkQTdHU0l2Y3hLT0JvR1JNaVNmSExsekp4?=
 =?utf-8?B?VWRFTExWUjBuZWxFbDA5Rm1mdzFpa3RvWVpGQ0VnM2xhMUZBcmIrRHBvU2Ur?=
 =?utf-8?B?VnNtWWZLMkJOYUFxUGNyNFVXY3Bnb2IzUStxWXA3NGg3aHp6OGNaTklrY1Mw?=
 =?utf-8?B?ekhqZTZNeC9jc0Z6WTA1VGdtNzNPS2ZONlNBakJVdnB5ZDJleXhrRmlQenE5?=
 =?utf-8?B?OGRROHpDRFJaSjFNeHNxZzlhbjM5VTI4SlYwdklzQkI0T05QVFI5azhjdC9N?=
 =?utf-8?B?QzU3WlFWYVJ4TTBWSmlYWnpKdGdKejhQNkxDbHhkdkk5MjJEamNjZEJmOTVV?=
 =?utf-8?B?Z0o3Q0FjaWU5WTErZmI0RGlGdUdraSs0NkZodktJNFA3N0pObzVmVm1la3RN?=
 =?utf-8?B?WWVXMVRGTXFLcmJZMWhiblFsZGlzS1BFQ0lEMndkTkxBRnllV1l6SnFTV285?=
 =?utf-8?B?bTFuYS9mcER3TkkrVHlYcitwaGJScmg0VElZeTluWVdKODNWbVA4RlIrYlht?=
 =?utf-8?B?ckZJbW5JZGExRTVhVVJpcTFwcTV2dmFWVEl5dGFNSDlUTVdiT3A2djBEUWFk?=
 =?utf-8?B?VHpRNk5kanJnZUxMQVd4ZmEwM2F2YVNvK3I1dzQ2bFlLOVkxc214L1JDMk9H?=
 =?utf-8?B?SS9ZdndPMlRqY3hvc2Jld2VZQlVFTnQ2VExMRk9IQzFCUVBaTzRyZ2czNkk5?=
 =?utf-8?B?WEYvMWwvOSthUkwwbHNYcHEvQXp6YmQxRVc3S29IVkJBVG81WVE0ajhlWHVv?=
 =?utf-8?B?TEN6U3JMcGdsRFJkRS9BUm1xeFgwbFFWVGV2eStpcFV2SlR5K0FJN3kvWGxP?=
 =?utf-8?B?UWpBS2VDMmFpVlFZaFVSMGZ3Qmhpa2dOQ0ZOdWpVV3BJcjBaei9nOVkxWDlj?=
 =?utf-8?B?S25xVWlLY0VNRlpyemtMR3Q2Vy81bjc3bGgwSWpnck4vSjJRK2p3ZDROWkNP?=
 =?utf-8?B?Y1BaZ2VpcWNIb3A1eFY5alhTR2lHb2toVi81b2tEU3FLOUdtSHhpWHpzSFhK?=
 =?utf-8?B?UUQ0eFpBelhtbUdDNnN3TUlRU3h5QlFzMHNUc0VST2REOXlGbVVXdnRHUDlh?=
 =?utf-8?B?aWZxbGhkTm5WODFmLzErYkVsTE40c0szcnpVUnV6V1g4a1dHODlYQTdDSjV2?=
 =?utf-8?B?TXV3aHFKajl1UWVYRVQrc1ZwNStSRnR6Y3BVTFhWckNjeWRSMGdoVFZCMkQv?=
 =?utf-8?B?OGVPdWJqRDFmcXArZng4R2xuVVZtaDk0ZTFpVFZJa2hud0dyQTVrWmZBY21L?=
 =?utf-8?B?YzBTZG9wS056blVmQWZWbWhVdFVMb09tcE4wWkFxaHJRbmY5Wjc1cDZQbGRV?=
 =?utf-8?B?ZEVkVjNIVk1BN1hnSFljQjYvanovSkdQSm5CakVzK3lETFhHZ1UvSzdIRUJh?=
 =?utf-8?B?OWNVdm1FbkVMOU1MM2w1aUIzZFZSRFphUGVNYXY2RVVWTUJ4OXFqOFo2N0Zq?=
 =?utf-8?B?NFJ5K052bmxBTVpGOVlpS2xYU3NiQkFhcDY1bGhaWUlyVDA2ZWhYV0x3N05P?=
 =?utf-8?B?M1htcFZCQ2htTU1hTTd5MkIzMXJLbXA5alM3L1A2Q1EzdjA1NTJMblZLYXE0?=
 =?utf-8?B?VXgreU1kS0NIVVp3ak1nRDlwK3EvMTBZbExmWVRKQStYQWRjOHhkNmJUeHJl?=
 =?utf-8?B?VG9EbitZMmtCVXFpVndtYjN6WThpQVpYZXFIRDhucy9MVTV5Y0huVTFpd21M?=
 =?utf-8?B?THd1MEtEck0xRkYzZytGdzdKNzVCOW5DV1VZRXVYOEw1eEE2QjZTQVVHRFpY?=
 =?utf-8?B?Q2hFZ1pYNDNxcUY5RnN2NHVIYzdZbDhqbXV0UWFlN0J0MklhMVFNMGRmZFFj?=
 =?utf-8?Q?NtuZtT6OOWywWQxdqU2JcWh86fvZV0ad?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmR0cE40cHp4MnN1QXI1TjZNUVJJT1RpY1BxRVJVODAwUGYzd3FoOGJEZ0ZW?=
 =?utf-8?B?M095NmlLNkpPZXR2ekZkTmNtOHBwUGVhU201MEl2MmJYVjRvWnRJT1hsL2Fz?=
 =?utf-8?B?YW9GKzYyUkxCN3FwYlZHejVxbHFaOEIxZXNMNjNKbExGVCsxM3JxT3o2RWJZ?=
 =?utf-8?B?dFRvVVhRWWZqTUR0RGtValQ3Z3RZT0VIUkpKVE0wV1dvVnZoY3lYWjNxMmg3?=
 =?utf-8?B?MzlOQ2pXUGtOdG4xSS85WU40SXpiM0ZoR1h1dmJqZ1dHb0N5ci9DZHBxbnB3?=
 =?utf-8?B?SnBNR0ZpUTRQaGIwVkpveVRTMkI2TzFvVE9lb09xL1oweXRWQldrMTg4TlVR?=
 =?utf-8?B?K3Mra0hjOExyZ09LMnJkM3cvNmc5MUo5dDZoMkVQckFEY2h4Y0ZUMWQrcVFL?=
 =?utf-8?B?Zk5McXJTaFg3MGJsQzM0VEFqOWFOVW4yYVl3R0FNQm9taU5ucVhvcXpiUElT?=
 =?utf-8?B?czBINmwzckxiMUFZdmJ3UW5mZExubzRoSUExUjBQa24vYXhUZE9iTVFTbitJ?=
 =?utf-8?B?eDVhNnlYdHlZTnRBUUl1N0tONmJmV3JKUHhPVzV3dUZPVU8xZEdpS3NSU2hT?=
 =?utf-8?B?c01wdkJIVWdLOGpTRlo0V2pZWC9WSzhRdGV1amRXK0RzOVZjZFRFYmJvUUk1?=
 =?utf-8?B?Mk9meit2NncrbnRZUkplNWxmdjM0MHJkaVZhQzFyalBBNDFFZ04rYWtBbVRp?=
 =?utf-8?B?S0FNRzMzb3RoRGZIUTVJYmdmSXpiR3Bvb3QxVnlKdFhIYXlkS0JWa3ZndUxJ?=
 =?utf-8?B?MWpWYXZhd3BqQnFqUVplZ3VMMFZFTzk4bDVqVlpJWXM5RHBqc2xGRVRqQUhG?=
 =?utf-8?B?cGRiTWFEU3NIVi9XOEtpeE9Zd0kwd251VlJNNjBzV1kyb3ZaWEN2MisvQXhL?=
 =?utf-8?B?aWk1cUVmSFcwdkRyUExpcTdQNnk4YlZTdG05U3puSFNvcGpJUnlkcHFtODUr?=
 =?utf-8?B?QlBXWFVzcmppTWZCcklFdTlZTER2emFRbVJpTFBueG1iMGRsSFZhRDJjdnhH?=
 =?utf-8?B?bkpIUlNxZnlheGFYOEdTaGJ3aVkveGdiVGdwTGpnY0trOGRxd1prTk1SdEdB?=
 =?utf-8?B?VEdtc3JzYnpxTkZ5L2t1NFpnL3haM1l2V0xCbkdqMksxd1hOU2srMkJYZzRN?=
 =?utf-8?B?UmJCcG5mcW54NWx3L2hSeFpJNjJ4WVQ3bDBDU1ZVWWdhK3N1K3cxUzF4dWxJ?=
 =?utf-8?B?Um1HUjAzOHBIRDM2VzJ2MVJIYnJVeG9pT3RtZnJjZHNSL0NvR1VLYjdDN3Bv?=
 =?utf-8?B?Uk5tNFFKR1dLZk1vNG8rS1FMSHJvb0V2TlBPcGFGT2FPZWZhQ2xpc0Zjbk40?=
 =?utf-8?B?Q1ZDWkRFbU8rTG5sSmhaL2dqcSswYWlCdXFRMExITFZEZVFOSzBhSmxXRndm?=
 =?utf-8?B?dnROUG1UakFLOXdlM09SVkQ0c3l5Z2k1SnVBaGt4Z2xWeEJ1clR6ckxuL0Zm?=
 =?utf-8?B?amRWVUZBUnNZck9oSXZTbG5JZTJmeTVyVlM5STlwSm5QZy8yMWlwQTl0U2dF?=
 =?utf-8?B?U0QzTDNzKzJrUjkzaFQ4VkxKVngxTzBubEVRNFIyMklTT1pXcmJpZEczN2xO?=
 =?utf-8?B?SFQ3UUtmUytjd2hsQXJ5UVYvNzJlWUE4Tys5NDI4YnlsTVhoWTFSZDNlMjJB?=
 =?utf-8?B?bE5yRGRwZG5uaERUWjJyRm40aDJhVmRMMjlrQTRNUEJjdzRWT1VDeDVyVWZu?=
 =?utf-8?B?emtkOUxFdmt6ZWE1eTdDTDlHTGk5T3dERW1xUnIvZ2JRdko2RUVuSFdzMjda?=
 =?utf-8?B?WHplY2pRdEhUTWk1bGJTOFVEUFBTdVFva29McGgvdmE1WkM4UXV6UnNIcW1T?=
 =?utf-8?B?UmRVVEpCbGhMRFlXWWhRaE4wQ2puZmpBallwUlprSjZnUStNZ2VRUkJ1K0Nn?=
 =?utf-8?B?MFkvUFdMWWhaVkh0bEpDOFpjUkt6TEFzUXVMd25kaUFZckZkUytCWGRmSkRm?=
 =?utf-8?B?RVhiYkZQRmZPWW83UjFFbGFvZXhTU3RPZjc5Tkd1a0c0L2pjYVFRU3BNVHNS?=
 =?utf-8?B?dEh6b0t2WVZ6Nk5tKzNyWldVTlgwNjBMRDR0RE05YnlUQUVRSTVFRVhNeDJr?=
 =?utf-8?B?ODh2dEwrNHllT0hWUFFHMFNEMjMxd2RtK2hkZ3dhSlExQkR1VjZnTklQUzU4?=
 =?utf-8?B?VlRBL1BtRlEyMy8rRG1oZUNvSlJpNXNUajRwL2ovQ3Z1UUlrVzF1anVZakRS?=
 =?utf-8?Q?hutv8VMIyLIqBJzeBMc+Bvs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50c2a5f7-2ff9-40e3-2618-08de1c668aaa
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 12:26:27.2861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UTia/C8HYdy2zcXhY5/vO78pfhBi4Re33Yy2ya4WZjyX42YjjqgMsl0sTG7P8szJlzuiCpWvCax0KwrJbMhDksFa+KJ2zLXMrFJlK6Yl5iY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8282
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



On 10/23/2025 11:58 AM, Kandpal, Suraj wrote:
>> Subject: [v5 20/24] drm/i915/color: Program Pre-CSC registers
>>
>> From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>>
>> Add callback for programming Pre-CSC LUT for TGL and beyond
> 
> Do you mean ADL and beyond.
> Also "Add callback to program ....."

Thanks for pointing it out. We actually intended it from TGL+.
I will make the changes to reflect that.

==
Chaitanya

> 
> Regards,
> Suraj Kandpal
> 
>>
>> v2: Add DSB support
>> v3: Add support for single segment 1D LUT color op
>>
>> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
>> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_color.c | 104 +++++++++++++++++++++
>>   1 file changed, 104 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_color.c
>> b/drivers/gpu/drm/i915/display/intel_color.c
>> index c7378af8fbdf..75981fe232bf 100644
>> --- a/drivers/gpu/drm/i915/display/intel_color.c
>> +++ b/drivers/gpu/drm/i915/display/intel_color.c
>> @@ -3945,6 +3945,109 @@ xelpd_load_plane_csc_matrix(struct intel_dsb
>> *dsb,
>>   			   ctm_to_twos_complement(input[11], 0, 12));  }
>>
>> +static void
>> +xelpd_program_plane_pre_csc_lut(struct intel_dsb *dsb,
>> +				const struct intel_plane_state *plane_state) {
>> +	struct intel_display *display = to_intel_display(plane_state);
>> +	const struct drm_plane_state *state = &plane_state->uapi;
>> +	enum pipe pipe = to_intel_plane(state->plane)->pipe;
>> +	enum plane_id plane = to_intel_plane(state->plane)->id;
>> +	const struct drm_color_lut_32 *pre_csc_lut = plane_state-
>>> hw.degamma_lut->data;
>> +	u32 i, lut_size;
>> +	bool is_single_seg = drm_color_lut_32_size(plane_state-
>>> hw.degamma_lut) == 128 ?
>> +			     true : false;
>> +
>> +	if (icl_is_hdr_plane(display, plane)) {
>> +		lut_size = 128;
>> +
>> +		intel_de_write_dsb(display, dsb,
>> +				   PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe,
>> plane, 0),
>> +				   PLANE_PAL_PREC_AUTO_INCREMENT);
>> +
>> +		if (pre_csc_lut) {
>> +			for (i = 0; i < lut_size; i++) {
>> +				u32 lut_val = is_single_seg ?
>> +
>> drm_color_lut_32_extract(pre_csc_lut[i].green, 24) :
>> +					  (pre_csc_lut[i].green & 0xffffff);
>> +
>> +				intel_de_write_dsb(display, dsb,
>> +
>> PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
>> +						   lut_val);
>> +			}
>> +
>> +			/* Program the max register to clamp values > 1.0. */
>> +			/* ToDo: Restrict to 0x7ffffff*/
>> +			do {
>> +				intel_de_write_dsb(display, dsb,
>> +
>> PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
>> +						   is_single_seg ? (1 << 24) :
>> +						   pre_csc_lut[i].green);
>> +			} while (i++ > 130);
>> +		} else {
>> +			for (i = 0; i < lut_size; i++) {
>> +				u32 v = (i * ((1 << 24) - 1)) / (lut_size - 1);
>> +
>> +				intel_de_write_dsb(display, dsb,
>> +
>> PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0), v);
>> +			}
>> +
>> +			do {
>> +				intel_de_write_dsb(display, dsb,
>> +
>> PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
>> +						   1 << 24);
>> +			} while (i++ < 130);
>> +		}
>> +
>> +		intel_de_write_dsb(display, dsb,
>> PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe, plane, 0), 0);
>> +	} else {
>> +		lut_size = 32;
>> +
>> +		/*
>> +		 * First 3 planes are HDR, so reduce by 3 to get to the right
>> +		 * SDR plane offset
>> +		 */
>> +		plane = plane - 3;
>> +
>> +		intel_de_write_dsb(display, dsb,
>> PLANE_PRE_CSC_GAMC_INDEX(pipe, plane, 0),
>> +				   PLANE_PAL_PREC_AUTO_INCREMENT);
>> +
>> +		if (pre_csc_lut) {
>> +			for (i = 0; i < lut_size; i++)
>> +				intel_de_write_dsb(display, dsb,
>> +
>> PLANE_PRE_CSC_GAMC_DATA(pipe, plane, 0),
>> +						   pre_csc_lut[i].green);
>> +			/* Program the max register to clamp values > 1.0. */
>> +			while (i < 35)
>> +				intel_de_write_dsb(display, dsb,
>> +
>> PLANE_PRE_CSC_GAMC_DATA(pipe, plane, 0),
>> +						   pre_csc_lut[i++].green);
>> +		} else {
>> +			for (i = 0; i < lut_size; i++) {
>> +				u32 v = (i * ((1 << 16) - 1)) / (lut_size - 1);
>> +
>> +				intel_de_write_dsb(display, dsb,
>> +
>> PLANE_PRE_CSC_GAMC_DATA(pipe, plane, 0), v);
>> +			}
>> +
>> +			do {
>> +				intel_de_write_dsb(display, dsb,
>> +
>> PLANE_PRE_CSC_GAMC_DATA(pipe, plane, 0),
>> +						   1 << 16);
>> +			} while (i++ < 34);
>> +		}
>> +
>> +		intel_de_write_dsb(display, dsb,
>> PLANE_PRE_CSC_GAMC_INDEX(pipe, plane, 0), 0);
>> +	}
>> +}
>> +
>> +static void
>> +xelpd_plane_load_luts(struct intel_dsb *dsb, const struct
>> +intel_plane_state *plane_state) {
>> +	if (plane_state->hw.degamma_lut)
>> +		xelpd_program_plane_pre_csc_lut(dsb, plane_state); }
>> +
>>   static const struct intel_color_funcs chv_color_funcs = {
>>   	.color_check = chv_color_check,
>>   	.color_commit_arm = i9xx_color_commit_arm, @@ -4004,6 +4107,7
>> @@ static const struct intel_color_funcs xelpd_color_funcs = {
>>   	.read_csc = icl_read_csc,
>>   	.get_config = skl_get_config,
>>   	.load_plane_csc_matrix = xelpd_load_plane_csc_matrix,
>> +	.load_plane_luts = xelpd_plane_load_luts,
>>   };
>>
>>   static const struct intel_color_funcs icl_color_funcs = {
>> --
>> 2.42.0
> 

