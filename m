Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A265EC6D58F
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 09:14:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CC1D10E5A5;
	Wed, 19 Nov 2025 08:14:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T0YAQXf7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 788B210E5A2;
 Wed, 19 Nov 2025 08:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763540084; x=1795076084;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Q9+QMpkHOgK4ARZze+RYfJSM+NvyfkLu1ZrJ/n7pVPo=;
 b=T0YAQXf7fiQpfEbFssAZdK+sZlEXbFHtx9Cn6RMuljACOpSKxeg9EpPW
 XLnFKYKkpBzFHPdsei9y4wcRIBtY8OK2JPcw6TjQUmNCBZrimgh0vJ4QZ
 7jm6EcDg5FkxgmF7UwvzPfkxq1XAazzwPOzlAyoVHldMl3o8qKXdYHgBL
 s6qZ+4nP9NOrV6ftsLMszI5d10gSebZG6D9ieQ3kXT12YhxQVu0XJYXEu
 9w3WgsKeFKfDl37sb5JCBrEa7P/HDpq22ulBL0k3LcyK1ROkO6n+/Hvef
 wyy0PsQTfNpypSBCRcgioZPc1o0ASUpJLRRz2X8VZ54tsJ2O3nkDdngH8 w==;
X-CSE-ConnectionGUID: Jyix5rj9QKSSpkmrhuPqgw==
X-CSE-MsgGUID: lLgksxLFSkimrKjrKIEUHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="82964749"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="82964749"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 00:14:43 -0800
X-CSE-ConnectionGUID: Pi/vg0QZQh6MyRoYBaWV4g==
X-CSE-MsgGUID: oAlPdDq2Tk6WiUpcGosaIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="191018293"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 00:14:43 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 00:14:42 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 19 Nov 2025 00:14:42 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.33) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 00:14:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=goirwPdpLGW/kTQlTAh9OkenHlxGziONtR4Rt17nUI/qO/tBjMVaa+8rvV3NL2K+c1rdXEo8eZXyuty7xa/5tzGv/Q0a11LXAr8diJBrW+RMJ0nAcdhGA2CauVb0+zmA4fdcQFbU80nXhoURPydhVCpqeXRxHc9785oA+zp8HQw8IoshnTIZkcxt6J+/8hvfWTbRafS0OWkR/tOQvER5LDclrw64wzjmRbYLxXhA4UrNzHWhMw3y4FuZ/sLuvv2ylPd1AHbwWoIogI9SdSUG8kZzFt4XeZNy7QM+AxGtDIVvA8M9p3EwuQzy2YKx+FbHWbGtSS6lWn9IVxsXouQ8rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Thkt/3aLTatlDRGFK6Rps0NoT1WcwgBKAwBgBY4v1f4=;
 b=MFWwnYYv3f7iXc/zqwtBLybP6+YYZPq94gqT7cWIk9xy3TK8sRDgx6fCgMinLgh9qN3Vesmte3aDHcL4rNV6WYLCdxqU03xJs46FHHyJZlXnvYmw3e8U/sb0rU+iBtvw7tNtWKiIwGYoZjI7qLacvwitn3Sxbx/74KBWqwPgo0TGYtxPbvra+pzDjDpVCuQeA2F94sm0Ky7mGsdxQKLVGL14NBzGBIBl1nSxxXuKYu4sqaWaqge4+Qhec1/7DEEtsOC0Jza1xn/DdrRMPoGYgo+1JUar2e6MAAx1Uf2i06BQ/RioY5Nm9uNluKVmSvRd+/AxF6M9Y4Wt0Xn3S+fmog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by PH7PR11MB6331.namprd11.prod.outlook.com (2603:10b6:510:1fd::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Wed, 19 Nov
 2025 08:14:34 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 08:14:34 +0000
Message-ID: <c32ad774-fcf8-4ec1-b95e-381acb034f03@intel.com>
Date: Wed, 19 Nov 2025 13:44:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v6 12/16] drm/i915/color: Program Pre-CSC registers
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
 "alex.hung@amd.com" <alex.hung@amd.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
References: <20251105123413.2671075-1-uma.shankar@intel.com>
 <20251105123413.2671075-13-uma.shankar@intel.com>
 <DM3PPF208195D8D2C6942F90EA6AEDEF719E3D6A@DM3PPF208195D8D.namprd11.prod.outlook.com>
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <DM3PPF208195D8D2C6942F90EA6AEDEF719E3D6A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0134.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::11) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|PH7PR11MB6331:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d912599-6c2f-446b-1e0c-08de2743ac55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1BQM0hSbkhQdVBrYWc0RzJYOW5aNElhWi83RU1DUitlYk16MXpsRjIxVE45?=
 =?utf-8?B?SDdvaGp2VXRoYzNJZUYyQjFDczZ6MkZsUHRwWldoMWdNSVUwakJ3RVo2MjB1?=
 =?utf-8?B?UVpobjBQLytzbjRGN2ZMaWVoSDNDdHdZRVBIOEdEYklWWndvWDljK0FEWFdn?=
 =?utf-8?B?SmJZdXhCK1ZVdXR6QTQ3QUlldVhnUnFHRXRiYVRQMUxtcVFIZU9CR0JTd0Ni?=
 =?utf-8?B?ZDEvTzcyQlArT3Q3UVdCQjJLTllKQndyTWpKSGdDQmZpdDZLQzR1a2dlaHc1?=
 =?utf-8?B?YkRtVkp0dTNCcSszQmpuY0pTT2RvMkhBMEw5LzVsUVdWaG1YY0dPcTh1Tysy?=
 =?utf-8?B?aXVuaHJyYnpqa1NOdmlzTHRvNEtnZHk3Q0N0VnZKNFNkMCtHbXQ2VmdaSEcv?=
 =?utf-8?B?aW14L096S3JSM00vQ1hvMHlRU043dWh0ZzliZGt4MVU1UzhRMmo0TmRtVmkv?=
 =?utf-8?B?L1ZjZW1NaExTT1FQa3hxY1oyMm1MNm50MGJWZXpldi9lNGhjYVhuOEI1U2ty?=
 =?utf-8?B?QnNEYjRUeCttMnoyZE1vRVRtMTUyOFB0QUxnSjhhRm5kSEt4ZCtKdHRwU0xq?=
 =?utf-8?B?S0FvSUkrSXFUeUNoSFk0RjZOeXljL0FxUUk1T09GTEJKN3FPTG5iQm5zbkw3?=
 =?utf-8?B?UHJOalBwR1VCZktaakRGZldlQWRQN1VPKzJOazVUbnVSL1R3c3Q5NHJhZkVK?=
 =?utf-8?B?Sys4MFc0UWhKRU93ckRRbmxCemhMOWFtZUthV1FvT0ZUYnVVelN6QmI0VkVo?=
 =?utf-8?B?UCtFMkZkekxPSDBpdzNrQ28zdk1VRlRLQUlRL0JXU1UrMkpNVFRaRytxbnRU?=
 =?utf-8?B?czMyeGQ3OEQzaU4zZ1BhcWFNVWdlVHUraEN0L2xZOXBLOG1nbUJhVGVrQ1pT?=
 =?utf-8?B?bDFOQzg4b0RORmR3Q2wxL3BIWUN2OXQwVHJSZ1NjRVozckgwc1BpdjlWV1Fp?=
 =?utf-8?B?NjBISUY1TUFzMVlTdlZZMlN4QXY3b000TlhNNHM4QnRhWjAzYjJHcVZwbjBv?=
 =?utf-8?B?SjJzTHJHNHF6MnBST0ZQWmZPLzFVWTRkRHhFci9hLzVBNnl4TWpCUXkrL0Zl?=
 =?utf-8?B?Wnh0TFRyVDQ3ZHlYQklta09pN2FXTG8zWjdBUTR4NmZWZGNhcGRsa21Fa0dy?=
 =?utf-8?B?VXh6Z3JXaXFoQUtHNk5qdXphZTQrVE42c3lpcEQrZU5COFRya0xJYXhIdXhS?=
 =?utf-8?B?MzlFNGlxOHBHcWp0Ujl4ZlBxaktVZlJ3QlUwTk1PNk1xK1BZc3RmNVZKaG1P?=
 =?utf-8?B?RGlIZTJQZjNRNHZCYkNxbkM2dlZnaGxZQTNzUDY5YlAvbjhJUHcvS3J6SENt?=
 =?utf-8?B?Yy85VFBTVmhlSHZieXYrRFkxa0YxeVRGUVl5L043QnFxNlVINHdoZlhCL1NG?=
 =?utf-8?B?d0t4VWRNZlcreWFLOWpKekRPMDhteFdHRDVmNzlobFdYVGZkdjdteGdhMzZm?=
 =?utf-8?B?QkJzcGdVOHRBcWN2bEt4MG5rNWxUWXY2YjZ0RGprOW5HYytvM1VYWTc0U2V0?=
 =?utf-8?B?MFNwT1IybDZUV3lzOEtPSjh1bXd4MWM2YjZYL1cwa3NSY2F2RURSS3IxaUFm?=
 =?utf-8?B?MWVKSm9xWmwxODY4VmZNV3VGRmtPVTkxVWdGSnF3WU9PKzh6MjFvVHJ3ai9w?=
 =?utf-8?B?b0RDQ1NyRW9hSVBVeUVjRk9WYnFVQjA0ZERNcWRSL3B1di85dVpkL1FzZ0E1?=
 =?utf-8?B?SGNDbEFnNUJrOVc3L2M0RW9JdmhHd1RMTi8xR3BTWmJiNjhyZThrZDVHRDdJ?=
 =?utf-8?B?RHE2UFdUbmNFMzF6SlAzaC8yZzJUb0Z0WXJCakowZkJBVWRXUGU2V0hXdGxr?=
 =?utf-8?B?WGVCdDNneGZ2RFE5TCtGaUFiUFE3SmNKeWlscWNucHYzVVhiUU5rWktpWElw?=
 =?utf-8?B?SVJlbjlNUWcxZE5ZdWlxVTRWMytjYmFxUFdHK1V5Z3FycXBMSDBwWmxVdVc1?=
 =?utf-8?Q?xssyzVpY65jBx+2wBWWzWFrEyaoWaoyN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlovM3dkemprMnlsVCtpMlMzLzVVYmFuaHo3ck15YXF4dkh5c3pRT0g5cjUy?=
 =?utf-8?B?TE4wN1dPRkNTYlM3ZUdpNFpqZ0RhNytjdDBiZExTQVNiWTUwaExRS0s2eFkr?=
 =?utf-8?B?SjhRVjR1V2o2aDFGbVpId1RPS0V0QW5IbnVTRmFlTEtWSU9hOE9iR2tTakkw?=
 =?utf-8?B?UkNySnBVWUVpYUxMeXk1NXlmemJiTUJyc3R1ZHUxd0lLUHYveVlZWWlQeUFu?=
 =?utf-8?B?dzE2NHkxcUVwdWVIS3Frem0ydEd1Tm5WazNhd3gxVVFwd3JWN2hBMHVhVHJw?=
 =?utf-8?B?MUFRUlU4Q2VaQ3o2QTAvNXBBMkRodHRzZE1iVHdYdnAxdnprV0cyKzUxY09Z?=
 =?utf-8?B?WE4zSGphSndFM1EzL29abWtJaGJWZVliVnBaZzNqNHpadlNoc2pLc2ltNUNt?=
 =?utf-8?B?Q0pXWExBdmsvWmdyR3hGdytEbDRxSENWYnVHUExocVo2YXhYYmVITDlaSjlj?=
 =?utf-8?B?OG1meFZSY25aUWZQMy8xdjVTcDA4V1NKa05nMmhrdHpBaG9YSk1ObDl4YkZk?=
 =?utf-8?B?bTVFMitSTDN1NVVPRnNXeVNsdHY1cExGVUJzbVR1bHpKZlpRZ3lJcFBJaHMy?=
 =?utf-8?B?SkJaRGRjSWpRSjV5ZEhJd0pIMTFvdTgydm1oWk5ROUMzUDltdktubGxFeG5C?=
 =?utf-8?B?U010STJnYWpWMXFIU08ydURXWDNqVEpYTU9RVk9KUmNjNjhLYmJBUTYwZENE?=
 =?utf-8?B?aHBneG9ldVgzTGNCNmgrT25MQjFvb085YnNlMTdCVVNCS2dVcVlaWHJUS1dz?=
 =?utf-8?B?NDBaVGxzMDdFbjZqdUp1OFNzc2prNS9GVVI1UFdyOVc1cWRjOFdSUDhyanpn?=
 =?utf-8?B?cGlYdWVCUGZVdVN3bUlFRFVkV2NTb3EzVy9hbmhsSEw0ZUlWSXZtTGtuQnZ3?=
 =?utf-8?B?Ry91VVFlc2U5dWNGbXRLVDFDM1JrZ2tVQi9oM09UcU9EcU9jSzAyQkpQU0Jr?=
 =?utf-8?B?YUhYVXp3T2IrN3Z5TEw0ZnI1U3dxcm02Yk9mSkVMNnZpMWhwOERMbkVSVjl1?=
 =?utf-8?B?M3Eza3BXN044NG5tTUlNTHh5VFBuM0ZPOU1XTElBdEZpaHVYZHZBN0d5dlRp?=
 =?utf-8?B?Z1hYY3JwWjBkR01YakR0bjhrc2paajJsZksrKzkwRzZGRVB5bUlzaUJhSk5q?=
 =?utf-8?B?MDZsQXQzbEFtWjZlZFIrNlduZzRTbVdIRnlxMENBK0Y2cit6S0FUQ2dXTjNh?=
 =?utf-8?B?ZkFoVnY0VC9zUU04UjM4NGUxVGpQYThNWDA0NzI5MWEwMEtiL1UyUWI3SWJL?=
 =?utf-8?B?a0FFbjJDc1dVRks2NW9vY1RZYWQzeUswMUEvVXd6UGplNElxWlNONXlQcVVL?=
 =?utf-8?B?THhVV2s1Mml4aE1Sc01ENlI2eUFwNFNzME9valROWk90cjcrSzRsb1RqNDgw?=
 =?utf-8?B?UGpQeFBzVjJXWHdRZlFpOWdtSlVBZGRTUXFYc1grTFFBQUx4SmdOQlc2ay93?=
 =?utf-8?B?SG5GZU5rd3hja3VtOWtWS0hwdU0reFJwN1N1Y2JKWXplVmJOVnF0TTVJSE5O?=
 =?utf-8?B?di9sRncxNXQ1ZFVTcEo2TlZPb2lYMDlJZ3hXMjB4aFlDeHdSM0RHSXU0WURn?=
 =?utf-8?B?TFVDVjlaRHNWblVPK1E0aHA1cEVPLzZSdDF6L3h3YmRvamRDSk1kVVZLNk1M?=
 =?utf-8?B?SXlKeW0rZlNIQ2NqVkoxWmppNjN6TGlrN2FDemxzdEtaM1RKbUZPd2QvS0V2?=
 =?utf-8?B?REh5bTUxQWN0UjhJUit5YUVsdUNRTjBXQjZKV1FhM1JmOXdvOGY4VWdVejBK?=
 =?utf-8?B?eVJtT0VRckpPazZXcU5Ca1IxMFVZNWlQQ2pDaHErM0RFc09HQ3R4RER4YTgy?=
 =?utf-8?B?dzJDOE1jR1NtWDZFZDYzQU5JelR2TFVHQkpSK0tlVGNKanNnQURTNFpBWDNS?=
 =?utf-8?B?K0xKV2F1U3l2dkRQMW1wVkFZSmt2RnlTYk1saGwvZUlxakRsTVE5WHpjZk5z?=
 =?utf-8?B?UjVPVVV6ZUZNVmsvTjNCUk03VE5saWttdHlvTnl0MDk5R2IvUG0xb1lGSndo?=
 =?utf-8?B?UzUzQy9lNmRUWElNS0ZSNkFCUVJRbmsyeVF4UnZvQnhrRTlyV3lVb1Rac0E4?=
 =?utf-8?B?MVEra1lqenpkbkp2V0Y0MEhzc3U2VjQzK1kwM1MxSUpZZmlhN09YRU1PM1pa?=
 =?utf-8?B?UmoxTlZjK0pYZ3dMMUJSRnkvOEFqZUxFSFJwYmViZmRFck1FVGZSblN4bDZu?=
 =?utf-8?Q?LFpgChNVP6/9Qy4qfF0Un8U=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d912599-6c2f-446b-1e0c-08de2743ac55
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 08:14:34.3767 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZJkx1R2RLhVJ9oR7Zx1+iUzeicnQzOCm++uyAjNCtFXxkiBV3ZoFDn9VGPXncgDflkSHPVX0rplbn6nfPowbwzvMY7td4NsLq9LwzOCcgLQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6331
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



On 11/18/2025 2:33 PM, Kandpal, Suraj wrote:
> Bspec link here,
> also if you can provide it as a reply so that I can verify the sequence for these writes
> 
> Regards,
> Suraj Kandpal

I am not aware of any special sequence that is followed for programming 
these registers other than the normal behavior of double buffer registers.

As to what to write into them, you can check the spec entries already 
mentioned in the patch that adds them.

BSpec: 50411, 50412, 50413, 50414



==
Chaitanya


