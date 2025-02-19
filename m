Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF78CA3B01C
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 04:40:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28DD610E1E1;
	Wed, 19 Feb 2025 03:40:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gG0/SeJr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45FAE10E1B5;
 Wed, 19 Feb 2025 03:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739936437; x=1771472437;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=k9SUk8tvlAMCBsMQzU9JVakOKb1uwTYOGyLJ2Yf+AAU=;
 b=gG0/SeJrvPXTUhY3Zyx1Gr8z5lwGuLgMbYxWtS3oHBWW6WeN2kNBTWtZ
 mkIa/ahcUp5OnBDbt6/n09EHo/KZrfz1Ko9g/cDBl57V3VjvWBH6aeugG
 Mm2rFgf1KIw5cGlaLoiyxUxVAeVjVaKpKiiwF2gvEIpvhxWlQix9iVpn5
 cTmqiwkrlseIKDVQcWclQK/MX/wv2QIKEmkbH+PiGbKsaHEgVn1eFHHOJ
 lA11UL15olps6nakkh8ObfwFvKc0buYdAmThpCNZ8mwTigSAnzNECfFQj
 QIP+qn0h6aA5WueloQ7k6Amqzh0K0LGRxh3xPTDxa0OeHmdEo5GMUr46Y A==;
X-CSE-ConnectionGUID: XzDKaudgQfCE8pQILLBRPg==
X-CSE-MsgGUID: q2tq94whQuCUkWiopymHcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="63134652"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="63134652"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 19:40:37 -0800
X-CSE-ConnectionGUID: y9l+grpyRjCT/A4nCZm+tw==
X-CSE-MsgGUID: HxY29F+oQHSiAZWHXXMbyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118724409"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 19:40:35 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 18 Feb 2025 19:40:35 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 18 Feb 2025 19:40:35 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 18 Feb 2025 19:40:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LBSr7zKS5S3gWYvqMp+1JO2yctPhECMhiEEiN/AYmPtasF1nFR/vJ0LSEPigta/YpDyCpWdXrmUDCRX0Rpg7KV6YzKkz78fGMXtP48G3yWwCJLBJvJLHyjJ+hGVPTQ90CxTi4ZdNw3INJ42AizeQPHoup9FMuhHlj6TUisi/y/yGIgn81eOmZKW8atdixVE+u2YOu6x9aDDdCVPKOE6Rn06PW09of1/L4jwoAC+YtOVXX0mYHfyEtrCL/TspGr2tkioUPBcGavAKOumgsLXJIebcMpFG3Un+lu7ONByd9ib1tSGIi7X8MlsJ6chVCkNXPihv52IqXrQUxZ8wgMHJig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FQbqz0PEHW5IPsOQWWKw55/5oWGSZ9fs/CzPm0lqhTw=;
 b=JO4VfMjV6DQ/asatgi0/Jl1FyiyyqrvT4TJ3nDggHKESBLuAFjyi1wH4jO2Zt1D7/7zi2OYuVWtTy0/Mwns6VlrNzH7mRkjEcf/xMVHSkxWPBKaW2md8/zMG0ntpWh9p2bFLNFKyBTq8okJfggS4pel8cTV/TvuMKOeFPyVfRRULA29e+JHaqpLPuWUxwP4gFYzxWMaemkZeDe7cPwDNE9/8AHU6SaCvSGZhvaK1/cbt0V9wd7ZdefcTIEZ8tl+9f34v+jRgE33VCTUSlmqt3IsTk8O2UNjJ/CPbKaF1uzRBSsHRhFLQEs4oFOpgdXvYuQaisA75AvGWCHZaHtGqAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SN7PR11MB8262.namprd11.prod.outlook.com (2603:10b6:806:26e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Wed, 19 Feb
 2025 03:40:32 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8466.013; Wed, 19 Feb 2025
 03:40:32 +0000
Message-ID: <a73ae99c-d5b5-4ed7-b3e3-1efd61832f75@intel.com>
Date: Wed, 19 Feb 2025 09:10:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 27/32] drm/xe: Add SVM VRAM migration
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <apopple@nvidia.com>, <airlied@gmail.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
References: <20250213021112.1228481-1-matthew.brost@intel.com>
 <20250213021112.1228481-28-matthew.brost@intel.com>
 <ee155ea0-e7ef-4a5e-b409-d08b62762e5c@intel.com>
 <Z7UBiYFn3oq9dhXN@lstrano-desk.jf.intel.com>
 <91cb5b9b-84cc-4651-8d28-973650eb7c69@intel.com>
 <Z7VKgVlwmVOz4wKP@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <Z7VKgVlwmVOz4wKP@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0004.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::14) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SN7PR11MB8262:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e8c92c9-d0e3-4442-5c1a-08dd5097299e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cm5DT3FjVkdsL241enBhWVdKdnIrT2tXUENaTGNvZ0FTRHNsdWtoclFPVzh1?=
 =?utf-8?B?UU1WNHNVR0F1TnRXeCtiTE1Pd29IME1la2ZkenVFZ0FaTWkxRGNIVW8rdklQ?=
 =?utf-8?B?cmt4dUpvbndKWUNLbndxWk9uVzNzZGJUT2xjcjNnUWg5T1ZKZTRYQUxDSjlX?=
 =?utf-8?B?Q051S01oc2d6dVNZUGVURnNKQm1LNGFwZkxlRjZRbzN0bkhsWmZzRlAraUor?=
 =?utf-8?B?dDJrUG9McWo2MzB3RUpRR0x6eUEyNTdhNnFDT252YWJWQVUwUTk3YlNVTlVG?=
 =?utf-8?B?OStrSGRObUsyNEdDakI4NFN0TlFwZExvMStUWndPekgycGsvU2pJeXdleG8r?=
 =?utf-8?B?NGRqdFBQS29RbDhoVFQrM0gxYlRUUStpVGpPMUpObGlqeUJhTEgvTzFhWjg2?=
 =?utf-8?B?VFBIQmxMVlFQOGhMcm5Yaldjdk1JOUdoMmlPOGd6QXMrQVZkVjFoWVZTQ2Vx?=
 =?utf-8?B?ZWlPZTI2QzdIeUFzMjRCWEorc20vUVd2aVV3MGZ1ZDZYd0hLSVFpNkd0Q2FR?=
 =?utf-8?B?dUxkOFRaSUpYLzRvQXd3WnEyOFdPR04raDJrV1hqVkEreFVNTEc5M1BKcTZ0?=
 =?utf-8?B?dUFPSzlXQ3JMWXNvcFhDQTA3VkhnMGEzUGd4dzVaV0JYWFhOQ3BaYURmYklF?=
 =?utf-8?B?OEkyN3E0N3BFV3YrZkQwQ1lzUGhLQXhad1ZsUVFVVG5rSjl6ZEVxRnRFWkp5?=
 =?utf-8?B?emU0ZUFoNnlnaXZ3M0Z3V0hCOUZVSWFLVDgvdmk1eC9uc1NCSTFWTElOUUF1?=
 =?utf-8?B?WXlaclJ2RTJrcU9aYStGWkU5QnlpZndXbkNSSTJHUklNMkI1amNVK0dTYks2?=
 =?utf-8?B?N25CeXZwUTE3Sk1TZm5WNXozcGpZQXJxc3dPc1VXdjNwYW1weWdMTW9kK2dm?=
 =?utf-8?B?M2N4K0kzNldudk1GVFdBb2RWYmlrR0Q0ZG9sVERldytCdDFvbDF5M0FLU2N2?=
 =?utf-8?B?azh3MnhtT09JVHZnQVdob25Eb0VndVBCVEFONTVFTkw0RzMyTm5tMmR3eUlx?=
 =?utf-8?B?dCs0WEpTZXF3c1kvcnVHVk0rUjdwK3c5NTlIZTF3YkRJTFc0TFlrcDB4S25X?=
 =?utf-8?B?aDFBSHB4eEp4UXdHblFCK0krTFl0K1NQY2Y5Si9pcnFIVHdwczRkSWhYRGgz?=
 =?utf-8?B?cWZ6di9CVXdSMmwyNXZ0ZHUrTTlvOG1jdW9ZOUpzS04wd1hBTUVTaVJENGZK?=
 =?utf-8?B?UTlOQmdBSm02VnlTcEZTeStuYmpJYkJLYzdKVmFBd0hzNFRhUkJKTWw5ZGRw?=
 =?utf-8?B?UmdOUjcrYkU1UHdxeGlXUTFkcEtEREU3TGwzaERTWEwxczhPdTV5dmFKWlgx?=
 =?utf-8?B?RGs0NWdJazB5aWFKWkpKWXl3ckRaWjdOekR2OTArZnBoYkt0TTE3STBUdExr?=
 =?utf-8?B?RHU1V1hqZVU0VkNuYVJwVzEyMjcrMkhwcVpmS3g0eE0wSy9wY2tkYk8rWWZV?=
 =?utf-8?B?WFZDNXBBWGpNR0svdS82UmhrU0JVY2lPdDdPNWRGTURweGVRTURuY05jTHR0?=
 =?utf-8?B?NXFCN2Q2Wlk5b1J2bWN5M1BBOVArc2M3MDRrZUlkc2Q5S3dFeE1qV3lGaXpV?=
 =?utf-8?B?eXQyZkgvbmk3bktMTEo1K1RBTUJTa0Z4cTFBR21sM09uZndzMm56WUQ3NzNB?=
 =?utf-8?B?SjVwRWNlQ1B0OCtvYXd6VWVONDJzNUEzWERnVDJjamtEaGp1YjduUDEzaDI1?=
 =?utf-8?B?cWhwbERGcXBteHRvS2tRUEtWS2xLRldLSDZMU2dFQ09Ga1JkWlJkc0FXU0Ix?=
 =?utf-8?B?NjIrTjRwT09VVEd4QTltcFBWZVdObmYveWNMZ3Jnakc1Yk92N1RTYnlOL0w3?=
 =?utf-8?B?aTlldzNXSEdreTZyVUdBZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djF2VndHY05iazdtUjk1cGN6UkVPTHQ3Y284MG1KQ29MUm9rUkJqeTZwR3FH?=
 =?utf-8?B?MXowV1V0OEd4MHVONHpETGxzRnpNTC85VkQwZFYzQll1STdWbHBZK2Y1Tm5Z?=
 =?utf-8?B?Zko1eVkwSUliaitsTkFIWjU2V20zaXkvRHdBNnJOSTI1aGpRa1B2ZTVYQXU2?=
 =?utf-8?B?VjdodGc5UXBnUlNVM1NFeURXZGxLcDB2MDUrcU5EVXlGZlFTdGFGbThPY2p1?=
 =?utf-8?B?b0dXTm0yb1V0YjB1UjVLUmp6V0dOR0RITi83bkIvUE9tS0UreEFoRWs4MEJ6?=
 =?utf-8?B?SG5ZenZoWlpWVUY1eTliQlBBSC9DZHMySlVQUUVWUlNPeEU0Mk5vREhmaDBU?=
 =?utf-8?B?cnR1Wk0wQmdabE9hZGI1bVdJRGJSd3hLZ1Q0MXUwZCs1Zkw1aHBvQWNNcXJZ?=
 =?utf-8?B?RVhmaVdkd3dqYjhTOUowY1lMREY2MUZ1RjRFYThud2M4ZGxOT0RhUE80UWdj?=
 =?utf-8?B?ZW10TXV6bG0yQWNCM0xYa0NYQklJMUUvSmpnUHNaTXhEU0xaZllVVTlJZ1Uz?=
 =?utf-8?B?RTRiSDdPazFhYjcydHRLelpKTUowVlFrb2tOMG50TWY0SEVGcjVBeDBTMU9O?=
 =?utf-8?B?QnJ1TVJQcEZ0ZStXNVArTU00T2F6VnVxTTdWdkVqSXFhWWlFcUFOSzZ2Nk9q?=
 =?utf-8?B?K1RDb1I2bUFJcEJONDlLQ0lSZStnVUVuNllmVmtKdktES25WQktra0FhQW1I?=
 =?utf-8?B?QjNuK1AvbEN4bkF3Z3FZWnk3KzdVVmd5ekRxQURVVHVVMkovaVAvd3NYRkNR?=
 =?utf-8?B?RzFSVDExRC9qQmM2VVRmVkc2K1dhZEwzYW43SWVHRXA2TzZkdFcxclpYNDlo?=
 =?utf-8?B?MkNjclFBVFdJRFp2QVNRNmttMVJYdHp4dXd0SGRqZ3N4dm9Mc2ozeHMxMzJO?=
 =?utf-8?B?MW1nWnZ4QUlUM2FoT2hhd2tOcmZXMFNranBGajFMcWt2ajUvcXFNYlhVT0w5?=
 =?utf-8?B?SFdyTXR0YTU1SnRMaHhJMUxNaGJJV1l2TVZwNmYwL1VQQ1BKMW5nR0NVbG1B?=
 =?utf-8?B?TkZjc1l1aC8wU3Y5Wng1OTVzd0J1Ry9Wa2IyVWNjanNZWGNVYVAxaHdFMm9S?=
 =?utf-8?B?bUM2MC8vL0Iza0xXYTJWRks0a2k1UDBCVnN5STI3Q3YrRmV2RkU1L1VyL1A0?=
 =?utf-8?B?RW1wQXAzbExhdGlHaE03bDJObGl0Vm9BRWthM0NLYVZka3puODlyYUk0Qk95?=
 =?utf-8?B?RVZCQmFETS9tbFI2cGhaamp2TUNzajFMUTl5cFRRYmlabG96TzJqSng5NDZD?=
 =?utf-8?B?eE9NbHBhQytBMWFBSXBSdElHTURIL0hRVE9WVzFVZHBvSy9HT05mSVBoWE5x?=
 =?utf-8?B?SWY3eFFxcWgxdTAvN1B0SXBIQ2dXcXpPN3NaenBUbWhYd3ZLMGFmNCt1Umov?=
 =?utf-8?B?eHlJeWlYMmswUko2TE9QT1ZzZVNFTy9jcjdMSzU1VXRTbGxObk9ZUEYxdjdT?=
 =?utf-8?B?QXUwUG9QdnFNREdPNGpJUllpaHZUSmZXcEdSTmlQdEIyY09sT1dackQvNDVC?=
 =?utf-8?B?VThpN0dTYW5tQ0puQzFJQjNWamU1Qk90ZzhmNXpLQks3dEJVcll6QWR0M1gv?=
 =?utf-8?B?NlpsSXU1SFZZZER3eGVWbVpBQ09McjhoWHdjelFpazRFWGljaGtQQ2J3YStG?=
 =?utf-8?B?Rkp0WWpZZE1lbjVwS1A2ZGJlZWNjTVdXaDRzbklsVmV5TVlGUXEvRXZJa1c5?=
 =?utf-8?B?eVk1ODRwQVBFYUhaZWVxUmxheWhnb0NmU3I2anlYK2F5TjdraVNLb3JHVExy?=
 =?utf-8?B?NE12SFF2c0JRSTAwdmV5OVdzM0xkVmZERWEzelF2S3dKZ1oybmc1aGZIelhI?=
 =?utf-8?B?YVEwbkFTQW53UXBUcWYwNWQxdEl5VHZ5bGZrVjltTFQ3bHNaWnNtY1pNMGVm?=
 =?utf-8?B?M1J3cC9JNUo4MUY3SVM5dG9GMVNEeHMzYnBFcE5qeXg5QktzVVdsYXJpaCsv?=
 =?utf-8?B?ZWQxbCtzc3A0YWhNaiswN3VxNkdTaFhyNGszUFgrV3hUQlV2WWxCdnpwanNR?=
 =?utf-8?B?MWRiVmxLVWtjMWU2alordWE1c2taM25wRnJ0OFUwYndjSVpoR0xDcjNmWlhZ?=
 =?utf-8?B?K0Uxb0VMbkp4NittejVFbDVodXQ3K2tJck5WMEx0MjdjZ0tZSDBGVi9PalNX?=
 =?utf-8?B?czJwQURHckRsa2pyek4weENUbU53WitNQTBic2VIb3hEVSttazFBYzE1V3FB?=
 =?utf-8?Q?GwX7imQKr+gobxiuGK4qIsk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e8c92c9-d0e3-4442-5c1a-08dd5097299e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 03:40:32.7986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WfntbxFzPBrCWETBM0tDuxxm7CoEzcrnIoal1zGboVUalSwskabTti++7TrBE9aVbhLHr5vq+pOLkU7tTqKZMJFx8ln/FA1d+AERIMNye10=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8262
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



On 19-02-2025 08:35, Matthew Brost wrote:
> On Wed, Feb 19, 2025 at 08:29:53AM +0530, Ghimiray, Himal Prasad wrote:
>>
>>
>> On 19-02-2025 03:24, Matthew Brost wrote:
>>> On Thu, Feb 13, 2025 at 11:58:27PM +0530, Ghimiray, Himal Prasad wrote:
>>>>
>>>>
>>>> On 13-02-2025 07:41, Matthew Brost wrote:
>>>>> Migration is implemented with range granularity, with VRAM backing being
>>>>> a VM private TTM BO (i.e., shares dma-resv with VM). The lifetime of the
>>>>> TTM BO is limited to when the SVM range is in VRAM (i.e., when a VRAM
>>>>> SVM range is migrated to SRAM, the TTM BO is destroyed).
>>>>>
>>>>> The design choice for using TTM BO for VRAM backing store, as opposed to
>>>>> direct buddy allocation, is as follows:
>>>>>
>>>>> - DRM buddy allocations are not at page granularity, offering no
>>>>>      advantage over a BO.
>>>>> - Unified eviction is required (SVM VRAM and TTM BOs need to be able to
>>>>>      evict each other).
>>>>> - For exhaustive eviction [1], SVM VRAM allocations will almost certainly
>>>>>      require a dma-resv.
>>>>> - Likely allocation size is 2M which makes of size of BO (872)
>>>>>      acceptable per allocation (872 / 2M == .0004158).
>>>>>
>>>>> With this, using TTM BO for VRAM backing store seems to be an obvious
>>>>> choice as it allows leveraging of the TTM eviction code.
>>>>>
>>>>> Current migration policy is migrate any SVM range greater than or equal
>>>>> to 64k once.
>>>>>
>>>>> [1] https://patchwork.freedesktop.org/series/133643/
>>>>>
>>>>> v2:
>>>>>     - Rebase on latest GPU SVM
>>>>>     - Retry page fault on get pages returning mixed allocation
>>>>>     - Use drm_gpusvm_devmem
>>>>> v3:
>>>>>     - Use new BO flags
>>>>>     - New range structure (Thomas)
>>>>>     - Hide migration behind Kconfig
>>>>>     - Kernel doc (Thomas)
>>>>>     - Use check_pages_threshold
>>>>> v4:
>>>>>     - Don't evict partial unmaps in garbage collector (Thomas)
>>>>>     - Use %pe to print errors (Thomas)
>>>>>     - Use %p to print pointers (Thomas)
>>>>> v5:
>>>>>     - Use range size helper (Thomas)
>>>>>     - Make BO external (Thomas)
>>>>>     - Set tile to NULL for BO creation (Thomas)
>>>>>     - Drop BO mirror flag (Thomas)
>>>>>     - Hold BO dma-resv lock across migration (Auld, Thomas)
>>>>>
>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>> ---
>>>>>     drivers/gpu/drm/xe/xe_svm.c | 111 ++++++++++++++++++++++++++++++++++--
>>>>>     drivers/gpu/drm/xe/xe_svm.h |   5 ++
>>>>>     2 files changed, 112 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
>>>>> index 0a78a838508c..2e1e0f31c1a8 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_svm.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>>>>> @@ -32,6 +32,11 @@ static unsigned long xe_svm_range_end(struct xe_svm_range *range)
>>>>>     	return drm_gpusvm_range_end(&range->base);
>>>>>     }
>>>>> +static unsigned long xe_svm_range_size(struct xe_svm_range *range)
>>>>> +{
>>>>> +	return drm_gpusvm_range_size(&range->base);
>>>>> +}
>>>>> +
>>>>>     static void *xe_svm_devm_owner(struct xe_device *xe)
>>>>>     {
>>>>>     	return xe;
>>>>> @@ -512,7 +517,6 @@ static int xe_svm_populate_devmem_pfn(struct drm_gpusvm_devmem *devmem_allocatio
>>>>>     	return 0;
>>>>>     }
>>>>> -__maybe_unused
>>>>>     static const struct drm_gpusvm_devmem_ops gpusvm_devmem_ops = {
>>>>>     	.devmem_release = xe_svm_devmem_release,
>>>>>     	.populate_devmem_pfn = xe_svm_populate_devmem_pfn,
>>>>> @@ -592,6 +596,71 @@ static bool xe_svm_range_is_valid(struct xe_svm_range *range,
>>>>>     	return (range->tile_present & ~range->tile_invalidated) & BIT(tile->id);
>>>>>     }
>>>>> +static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
>>>>> +{
>>>>> +	return &tile->mem.vram;
>>>>> +}
>>>>> +
>>>>> +static struct xe_bo *xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
>>>>> +				       struct xe_svm_range *range,
>>>>> +				       const struct drm_gpusvm_ctx *ctx)
>>>>> +{
>>>>> +	struct mm_struct *mm = vm->svm.gpusvm.mm;
>>>>> +	struct xe_vram_region *vr = tile_to_vr(tile);
>>>>> +	struct drm_buddy_block *block;
>>>>> +	struct list_head *blocks;
>>>>> +	struct xe_bo *bo;
>>>>> +	ktime_t end = 0;
>>>>> +	int err;
>>>>> +
>>>>> +	if (!mmget_not_zero(mm))
>>>>> +		return ERR_PTR(-EFAULT);
>>>>> +	mmap_read_lock(mm);
>>>>> +
>>>>> +retry:
>>>>> +	bo = xe_bo_create_locked(tile_to_xe(tile), NULL, NULL,
>>>>> +				 xe_svm_range_size(range),
>>>>> +				 ttm_bo_type_device,
>>>>> +				 XE_BO_FLAG_VRAM_IF_DGFX(tile));
>>>>> +	if (IS_ERR(bo)) {
>>>>> +		err = PTR_ERR(bo);
>>>>> +		if (xe_vm_validate_should_retry(NULL, err, &end))
>>>>> +			goto retry;
>>>>> +		goto unlock;
>>>>> +	}
>>>>> +
>>>>> +	drm_gpusvm_devmem_init(&bo->devmem_allocation,
>>>>> +			       vm->xe->drm.dev, mm,
>>>>> +			       &gpusvm_devmem_ops,
>>>>> +			       &tile->mem.vram.dpagemap,
>>>>> +			       xe_svm_range_size(range));
>>>>> +
>>>>> +	blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
>>>>> +	list_for_each_entry(block, blocks, link)
>>>>> +		block->private = vr;
>>>>> +
>>>>> +	/*
>>>>> +	 * Take ref because as soon as drm_gpusvm_migrate_to_devmem succeeds the
>>>>> +	 * creation ref can be dropped upon CPU fault or unmap.
>>>>> +	 */
>>>>> +	xe_bo_get(bo);
>>>>> +
>>>>> +	err = drm_gpusvm_migrate_to_devmem(&vm->svm.gpusvm, &range->base,
>>>>> +					   &bo->devmem_allocation, ctx);
>>>>> +	xe_bo_unlock(bo);
>>>>> +	if (err) {
>>>>> +		xe_bo_put(bo);	/* Local ref */
>>>>> +		xe_bo_put(bo);	/* Creation ref */
>>>>> +		bo = ERR_PTR(err);
>>>>> +	}
>>>>> +
>>>>> +unlock:
>>>>> +	mmap_read_unlock(mm);
>>>>> +	mmput(mm);
>>>>> +
>>>>> +	return bo;
>>>>> +}
>>>>> +
>>>>>     /**
>>>>>      * xe_svm_handle_pagefault() - SVM handle page fault
>>>>>      * @vm: The VM.
>>>>> @@ -600,7 +669,8 @@ static bool xe_svm_range_is_valid(struct xe_svm_range *range,
>>>>>      * @fault_addr: The GPU fault address.
>>>>>      * @atomic: The fault atomic access bit.
>>>>>      *
>>>>> - * Create GPU bindings for a SVM page fault.
>>>>> + * Create GPU bindings for a SVM page fault. Optionally migrate to device
>>>>> + * memory.
>>>>>      *
>>>>>      * Return: 0 on success, negative error code on error.
>>>>>      */
>>>>> @@ -608,11 +678,18 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>>>>>     			    struct xe_tile *tile, u64 fault_addr,
>>>>>     			    bool atomic)
>>>>>     {
>>>>> -	struct drm_gpusvm_ctx ctx = { .read_only = xe_vma_read_only(vma), };
>>>>> +	struct drm_gpusvm_ctx ctx = {
>>>>> +		.read_only = xe_vma_read_only(vma),
>>>>> +		.devmem_possible = IS_DGFX(vm->xe) &&
>>>>> +			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
>>>>> +		.check_pages_threshold = IS_DGFX(vm->xe) &&
>>>>> +			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
>>>>> +	};
>>>>>     	struct xe_svm_range *range;
>>>>>     	struct drm_gpusvm_range *r;
>>>>>     	struct drm_exec exec;
>>>>>     	struct dma_fence *fence;
>>>>> +	struct xe_bo *bo = NULL;
>>>>>     	ktime_t end = 0;
>>>>>     	int err;
>>>>> @@ -620,6 +697,9 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>>>>>     	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
>>>>>     retry:
>>>>> +	xe_bo_put(bo);
>>>>> +	bo = NULL;
>>>>> +
>>>>>     	/* Always process UNMAPs first so view SVM ranges is current */
>>>>>     	err = xe_svm_garbage_collector(vm);
>>>>>     	if (err)
>>>>> @@ -635,9 +715,31 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>>>>>     	if (xe_svm_range_is_valid(range, tile))
>>>>>     		return 0;
>>>>> +	/* XXX: Add migration policy, for now migrate range once */
>>>>> +	if (!range->migrated && range->base.flags.migrate_devmem &&
>>>>> +	    xe_svm_range_size(range) >= SZ_64K) {
>>>>> +		range->migrated = true;
>>>>
>>>>
>>>> shouldn't this be set to true, only once xe_svm_alloc_vram is successfull ?
>>>> In case of bo alloc failure retry wont enter here.
>>>>
>>>
>>> No. The point of this is try to migrate once to avoid a live lock case
>>> of concurrent CPU and GPU access. Once we have migration policy, I'd
>>> suspect memory marked as prefered VRAM only try once too. If memory is
>>> marked as VRAM only we'd retry to a limit and if reached kill the app.
>>> We can work of those details when that code lands. Until then, trying
>>> once seems reasonable.
>>
>> I understand what we are trying to achieve here, and it functions well.
>> However, my only concern is member name "migrated" gives the impression that
>> it will be set to true only if the range has been successfully migrated to
>> VRAM.
>>
> 
> s/migrated/skip_migrate ?

sounds good to me.

> 
>>>
>>> Matt
>>>
>>>>> +
>>>>> +		bo = xe_svm_alloc_vram(vm, tile, range, &ctx);
>>>>> +		if (IS_ERR(bo)) {
>>>>> +			drm_info(&vm->xe->drm,
>>>>> +				 "VRAM allocation failed, falling back to retrying, asid=%u, errno %pe\n",
>>>>> +				 vm->usm.asid, bo);
>>
>> This log is also misleading, we dont retry vram allocation in case of first
>> failure.
>>
> 
> How about...
> 
> "VRAM allocation failed, falling back to retrying fault,"

Yup.

> 
> Matt
> 
>>>>> +			bo = NULL;
>>>>> +			goto retry;
>>>>> +		}
>>>>> +	}
>>>>> +
>>>>>     	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, &ctx);
>>>>> -	if (err == -EFAULT || err == -EPERM)	/* Corner where CPU mappings have changed */
>>>>> +	/* Corner where CPU mappings have changed */
>>>>> +	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {
>>>>> +		if (err == -EOPNOTSUPP)
>>>>> +			drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
>>>>> +		drm_info(&vm->xe->drm,
>>>>> +			 "Get pages failed, falling back to retrying, asid=%u, gpusvm=%p, errno %pe\n",
>>>>> +			 vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
>>>>>     		goto retry;
>>>>> +	}
>>>>>     	if (err)
>>>>>     		goto err_out;
>>>>> @@ -668,6 +770,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>>>>>     	dma_fence_put(fence);
>>>>>     err_out:
>>>>> +	xe_bo_put(bo);
>>>>>     	return err;
>>>>>     }
>>>>> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
>>>>> index 0fa525d34987..984a61651d9e 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_svm.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_svm.h
>>>>> @@ -35,6 +35,11 @@ struct xe_svm_range {
>>>>>     	 * range. Protected by GPU SVM notifier lock.
>>>>>     	 */
>>>>>     	u8 tile_invalidated;
>>>>> +	/**
>>>>> +	 * @migrated: Range has been migrated to device memory, protected by
>>>>> +	 * GPU fault handler locking.
>>
>> The range is not necessarily migrated to device memory if migrated is true.
>>
>>>>> +	 */
>>>>> +	u8 migrated	:1;
>>>>>     };
>>>>>     int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr);
>>>>
>>

