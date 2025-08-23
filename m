Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C2DB326ED
	for <lists+dri-devel@lfdr.de>; Sat, 23 Aug 2025 07:37:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C7FD10E19A;
	Sat, 23 Aug 2025 05:37:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L2joX1sF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BD2E10E199;
 Sat, 23 Aug 2025 05:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755927430; x=1787463430;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+XOlsvQaG/VaHhmweZISBYJLN9UlXSBHNM8hYbAm0JQ=;
 b=L2joX1sFdYbyDZ17NPIln1aZ7gPuKhqqshOnCd3bGCY4nwUdW+W2Fj1s
 4cBIhrKPPXMANXj6+7LrnakseNrxiOsXv4/94ICjG/A0kdRAesVcwJVHb
 Eh29RDt23IQ+7eZyzxbfE6fRsmGPugCueAHyScr3SSC2F7gjbWr2LvGAS
 Jafn2PRedMstkGG89iBRLH2Ggg3QOeQXtS6/9NrVhg+pP35IP/TIZjFlg
 gaxbeolBvpUOZ9G7XUlUoV4Pf5EuJLLytUFkN+daY6V3xhsZPUGevf3r+
 h0svkST0yTEZId0YjcXOO0NUzoFdJ8HeuXdP/7OgoKHdxsbm43jlQnnrk Q==;
X-CSE-ConnectionGUID: OlmNcB9+Q6yabN9OEoN/Ng==
X-CSE-MsgGUID: caZv0bJtTDSujy0WHyemaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="61871247"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61871247"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 22:37:09 -0700
X-CSE-ConnectionGUID: p735nQsRQGOwnrwaal5i6g==
X-CSE-MsgGUID: Ms5zOcr8Rg6O/2NwasEoFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="206041794"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 22:37:08 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 22:37:09 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 22 Aug 2025 22:37:09 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.75)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 22:37:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e8i45dMLmHNgrkQVboZ3e6Odi0tYjocrBMaB/h+TPjqmrM//bBYDycW6UEJgIxyOkpPl3Xoi6MXqCFBFHRIPji5bbKzwmuNgeetMC/bkGecrgYhil47BHTF3pOp8ETg2O0P1ER9MTEWr8+oN5AEeyWPdf+ckokchr+j3SHg6LhB8pHCx4Gm+jZW6iyTDoAAnQl2wVjoEasAhuvGiyZN8q9FZgl0pQbDse+ksoR+s9aRuLA6WNRyQkuG5YCLY+3sdRJPZ+AJIboQTcL8jpqv2QMON4tK03+6b8EVrvOza0gpyJjDZSSf2RjyOp0d4QDCV+TJq7CtT8fR8xLU9qFinIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p9TFzgH95sDlL2tPwlWP3FmjQ7h786BtOXuuKi7KOHw=;
 b=RV6uxh+Tq+sa1/cXgZNSxL7XX8kXc52T+9+v8m+r6TnMh5gqfcJn3NMNhrERUomb4D6zA0rXyXgNpL2qqNwsi86w0P78UcXmOx9tBGad2hRdREgboQrrwYqDnamCbuFtYpY25Y8abP14zSQBCA1GABHw0oJrt/Hlt+umm0Ox2p8VVz9DIpaixmwfNTmsdMF/PBgRfg0EBft2EWJeHkYAMfowYMdoI75x3E/GzV7cFXE11ngjUic1FKqDIhmnAXFO/0HTNQc8rk5ECh+jOHVR9M/UJIOZdj0k/cnTOzUT/oM6oCkU4A1P0sjpZ5XxvjRzUuLySJjiDxHqjQmbF4t2YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by PH8PR11MB6708.namprd11.prod.outlook.com (2603:10b6:510:1c7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Sat, 23 Aug
 2025 05:37:06 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%4]) with mapi id 15.20.9052.017; Sat, 23 Aug 2025
 05:37:06 +0000
Message-ID: <12e88f43-98eb-43aa-931c-edac88d650aa@intel.com>
Date: Sat, 23 Aug 2025 11:07:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] drm: Define user readable error codes for atomic
 ioctl
To: Jani Nikula <jani.nikula@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
CC: Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, <naveen1.kumar@intel.com>, 
 <xaver.hugl@kde.org>, <uma.shankar@intel.com>, <harry.wentland@amd.com>
References: <20250822-atomic-v3-0-13a0e8f2c581@intel.com>
 <20250822-atomic-v3-1-13a0e8f2c581@intel.com>
 <8f24c0051cab99aa5f399dc3b6eb6dd2fb1e8b6c@intel.com>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <8f24c0051cab99aa5f399dc3b6eb6dd2fb1e8b6c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0028.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::6) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|PH8PR11MB6708:EE_
X-MS-Office365-Filtering-Correlation-Id: 16df134e-2618-49a1-3160-08dde20718a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UFYrQXlYR0FkM3RnTjN4Zmg4dThUVVAydFlvMFNnVG9GTUhSenQ0UytvaDAz?=
 =?utf-8?B?dnNGeVVNRkYxL0NDUUFhOHZIWnNldHJZRDFMRDNHL3pnblg4aTBCTkFUT2xn?=
 =?utf-8?B?dDhLMTJkT3NGOVNNLy8rV0FiaE8xQk1KUHdIdlB2TCtUZ24wdWFPTG9KZmhO?=
 =?utf-8?B?Zm5NTGdObENiV3I0T2YrTHo4U1pOdVJqOXFCSDZYaUFmb0I2MzV2Umdzd0lm?=
 =?utf-8?B?OXBaejhGYzN5OTg0RWR4RXFWZHdMKyt5NmdzZ0prVFZkOElXdUV1RElldnpX?=
 =?utf-8?B?dUh4dmVUK2JpQ0hqd2FjSk9OczlibXUwZGs5Q0UzQVc0dEE3MnNqZDA1QjBG?=
 =?utf-8?B?dVlxVDd5MnZxdGluT01xMmlRYnU4RjVFb3QzQjI3QkJrTWRySi9DOFE3MU41?=
 =?utf-8?B?S0xHa1JwTFRiNFpGblIwNHR2WGZ0RElUYjYyZGtBd0d6QzMxWW1HakFNVFU3?=
 =?utf-8?B?OFAxQmEzV3J1WXI0TkVWb3Z4eFJBZ04wR0cxSEJiNXI1Z2ZOblRpR0J4UXJp?=
 =?utf-8?B?dFJISHRYZzMxWk54NTdGeFpMWHlWZFltakVxeFFEV3k1bm1sbmNsQ3ZDRlVE?=
 =?utf-8?B?M2tpamRDV3E4MUErVTYvVUFjaUhEN0lwZjdqMGFsNjFJb0Nzc0EzTjJWMFlu?=
 =?utf-8?B?YnZ3TjNkL0FtQmNkK0cyekFqM0lPQVY0b1B2Y2tzSkx3MEU4VitKRWNPZGR5?=
 =?utf-8?B?TllnSERvRWJON1pIVm1xRm5MMW9oaEJ5MlNHcWx0Ym9DWVZpTGkwbzlqRUo0?=
 =?utf-8?B?cVVZNHFvc1hjQ0oyYk9vbWpjMCtlazNiUEs5aUl2aGV2N0ExYlFKWDFXVlN6?=
 =?utf-8?B?dWNXYWRmeXpGSFZTLzNmaG5ZYVNMcFVCM0RzRGtsZEcvSUlKQ0Y2ZkFleCtW?=
 =?utf-8?B?Z1p1dlJ5TE9mTkRZM3lFRkVuZi82YUlCYk45Yzc3a2w1SWxCOEFneTNXVTN2?=
 =?utf-8?B?cjdOL1RjMy9vK1AvNVNEQ0llMjROY2VYUzBwMjZOSWVxdlQ1VWY3U0VHM04v?=
 =?utf-8?B?Q1JlcHE1RnJTb1hvSCtnVmwrUHFINnB5dnVkb2JDdnVrVUVEQXVTQUF3T1hh?=
 =?utf-8?B?YllXNFRXZXRSdzloMXZtamlsVXZnRVEzdnlRbkQ1MnJGZEIyb3lseE1TaG1R?=
 =?utf-8?B?ZXpqL2hqSjBOUmVFbnR4a1p4eXA4RTRGRkFOSzlUNEJ3NXhwcStZWlBIMi9M?=
 =?utf-8?B?MlFhazg4d0llL3VObUVsR1FySkxDYlo0TFg2QkxHZDJVcWdabUxPOVVKWnpt?=
 =?utf-8?B?SWdHdHNvaUF4aXlaL09GOVJWQUpEWUNVSUo2QWlQc0hmcmRFUDNuQVRpTnhs?=
 =?utf-8?B?Y21ETHlOaFBYV1JrVVJIZFBISTMrRGZYcld0d0hjOXRBQjdNYkdtZE9oUXZM?=
 =?utf-8?B?cWQwT0E5QXg3VWV5endCMlUybDkzM1F3YnhMMnIyNW01YXFuUk1BN2RZc1R4?=
 =?utf-8?B?MHUvWU15ZTNqVHRUZUlYMityUVlMUUNaa3lXOFg0UURTQlFiZ0l4bUdKeG9P?=
 =?utf-8?B?ZlhXQ1FOVDNmdXdaMHFxZ3pwZTdpejI2cXBBRndNN09OTW43VmlvQTkwZkdq?=
 =?utf-8?B?QWlFVUdUNk0zTm1mTTVMQXNUaHRIbXg5azJsVmVZYWtJTEFJV0d4SmFaaEcv?=
 =?utf-8?B?ajJiOGdQd2hxdzRUeVZZazNKMDlhKzFWTWlDSVlzUUZVdk5pUjR2WTdHdWp6?=
 =?utf-8?B?bzBHVENocHZPR2F3MWYxVEpCT05mOElOM09KaVFEY2dkbTJtQXVvLzQwVGxL?=
 =?utf-8?B?Z3R1UFc3MzgvWEdOYzZDdFcxTGdYd1U0L3RtWnU0ZDRGeTBXMzRXOGp4cjBW?=
 =?utf-8?Q?E6wYd5I5rqCg80t1ubC10/Uy19SKyszNsK/Ac=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zll5Q0FsakpIZjRDQjJiSFVDSVc4eTdVNVY0OW41VjJPbUYyNmxENHlVUGtZ?=
 =?utf-8?B?VGpGSzYyZHlqYUlYRTRxMEJNbWJaY050RHNUVTV2elFHU0VKbjEvZG5YclBU?=
 =?utf-8?B?aFA1VzFJblRIV1pyblZma24yTGt5QkhQa3FWYnYyZFFSTEdrL1RIWm9obUQ4?=
 =?utf-8?B?Qk0wdmt2ZUZIblRMbzhEdUcvVmwxQzRDOG83Y054MmJhY1FrMVpacW56dlIx?=
 =?utf-8?B?a2VOTkttb0taSElOR2FaMnVsZ3RXaDRkZ0JEaHpZdlZVaWFGNlJaWmFrWHcw?=
 =?utf-8?B?TzFUeklEc04vbWwzR2p0TFVvTHVPWVpqa3FxZ0sraTBOaGxDWE1jUG9HMHM2?=
 =?utf-8?B?enQ3cTAveFdvNnRoT0k2ckVReVNBV3doTmVjMWRhUzE2ejdKZGJJQzBmWXJG?=
 =?utf-8?B?bzJoMy9FNlN2WHpVRnRyQWdhUGpwR284dmpUTU04SG5ZY2x6V2doNk9jV3dD?=
 =?utf-8?B?V0Q1VER2YlRSLzdSUkZoNG4vR211R1JxQnB6M3lHL2J0NzZXaU1aOGs4elIx?=
 =?utf-8?B?Q0JBcEgzbkpEOFltRWUyY1JiZThLMWNTM0llazlXM2hpWjh6Z0Uva2ROcjRj?=
 =?utf-8?B?bkxpMG5VaVJBem9Nd09raldJejVZZVplZCtQcmRIWnpIVExoSjNFczErNjNN?=
 =?utf-8?B?dlo4MzRpZkMvYUFvL1ZrSEljOEZZcHRUU0dnYUlEZU5Ia0czV3NSUUZxQUNS?=
 =?utf-8?B?U1UzVlVtUWkwQ3VYUUJmY3dzTXBad0oyY1l3VTF3QkY3VUZ0OGNsWlZqWkhW?=
 =?utf-8?B?alpxYzZtMjZnZ2xIQWcxQUtrWlE2VkFjd2dmNDd4SnYzU0FDRFlsRlRKM3di?=
 =?utf-8?B?dnlXSnN3VHhXdEoxNTNWcVp2Z3BBZXhlOU12dE40ams2RCtZUGhVeTVWSWs1?=
 =?utf-8?B?SlhkNjlwWkRTMVcvK3UvSEpSTU1BeFc3R3B3Q0twTUNhQnVrSzRiU1hUU1dN?=
 =?utf-8?B?RzdDT1F2SVoyQlpVcjdhdWRjeXE2UWU2VjFmVVZtbzhGQ2tMemN5aGhzY3FZ?=
 =?utf-8?B?bElJc1ZqRmErTTZ1NlZFMVgwTXFYem5wNUhnSlZiWFR2a1BNWDZrNlpTOVdZ?=
 =?utf-8?B?NUVMbDV5UjV6eklkNldUemphOEZNNUJCQlRIdGROZWRNTHZCNVk5dmxsS1B3?=
 =?utf-8?B?TzJ0MWw4Ulhzc3V4OE1TUHdGMkd2UDA5MEoyaXppRDBkYWlrUDJVWjlEQllW?=
 =?utf-8?B?bFlmd0t5WU5SaWhLRDQzdFo5Q2lWTFZXUmJMR1VuNXp5emJWUnIra0NLVjZl?=
 =?utf-8?B?TTJCMHpsSzZZc0VzTy9Yb0FZVFRJcUdWVlVnUVVleEUzYkZaUTlzd1dOaStH?=
 =?utf-8?B?TmVDS1VRV1ppbUhlZ3pDYk1pWkczMXBsVmFmK0NvU2IzMjVwQmRvck81aFgw?=
 =?utf-8?B?cXU2WHUrL2pRczdhNWdmYnhTamEyZUR5TSt6THJkN3k3ckV0ZG1US1lPVmRm?=
 =?utf-8?B?TWVGbVU0MFRGRmtCMXRhbnpHUlNuVHhwK3hlRUUzdXRRZU1LTStWekk4KzBQ?=
 =?utf-8?B?Wm5ETHFpT3Fza2xqUnN4dUR2NHJiUm02dzdpVUFhdG9uZUkxWThWY2tiN3Iv?=
 =?utf-8?B?SStjQytnZVJmWnlnaUF6OU12djN2dVhoY2h2NkZCMXMrRXVneEF0UG5KS0sw?=
 =?utf-8?B?bkthYzA4NGFFZjg5UlFEejlCcmJCY0J4QnBHVSsyOGJ6bWRKMDE0d0JLcG4x?=
 =?utf-8?B?M1NwMm04ZE1TTk9vd1hzcUY0RnN1RlVxYkFHS29BVjc5bXJUOU1weW0xa0x0?=
 =?utf-8?B?TWIreVd0U0U4cHMvRkczcTVZckg5bGtya1BoNVhuKzVWY0VaYnBxc3JMQXo1?=
 =?utf-8?B?a2FlTDFlR2NzOGFSanpzaHFYQW96cTd0S0Y3S0N2czNlZ1FLUWZwcWlxZW00?=
 =?utf-8?B?N05JOFp4MXN6d21MU0ZKWVU0UUNXSGpiS1ZTSFZ1UE51MUMwV2o5ejJHUTEv?=
 =?utf-8?B?RXp6YkQ3NC9ib1BoS3hyMzUvZllKVmluT0pEUG1Td21tRS9WQlBWMUdnUDRT?=
 =?utf-8?B?b0pxeXJyWHYvZThubUcwZ1JKZ3FlZ2pWSHI2RGZCZ3hCd3VCNVNsNElWWWlU?=
 =?utf-8?B?RkxEYVd2dDBEZFJqOU50Z1RqczJpZzJ4S3lLWENrWm1YMW0vMHdvblRIQ0la?=
 =?utf-8?Q?V23msbHjpduVWapClT0lrsh8P?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 16df134e-2618-49a1-3160-08dde20718a9
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2025 05:37:06.6956 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Il/4kMFdYCqLHpfi89p+KYpM00Wda/3pzVzMmbdh6SbsjqyBz8EAR09CapPbhVAznjft2Yhe4N9OB1GEWELiSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6708
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

On 22-08-2025 16:07, Jani Nikula wrote:
> On Fri, 22 Aug 2025, Arun R Murthy <arun.r.murthy@intel.com> wrote:
>> There can be multiple reasons for a failure in atomic_ioctl. Most often
>> in these error conditions -EINVAL is returned. User/Compositor would
>> have to blindly take a call on failure of this ioctl so as to use
>> ALLOW_MODESET or any. It would be good if user/compositor gets a
>> readable error code on failure so they can take proper corrections in
>> the next commit.
>> The struct drm_mode_atomic is being passed by the user/compositor which
>> holds the properties for modeset/flip. Reusing the same struct for
>> returning the error code in case of failure can save by creating a new
>> uapi/interface for returning the error code.
>> The element 'reserved' in the struct drm_mode_atomic is used for
>> returning the user readable error code. This points to the struct
>> drm_mode_atomic_err_code. Failure reasons have been initialized in
>> DRM_MODE_ATOMIC_FAILURE_REASON.
> At the moment, I'm not (yet) convinced any of this will work, even as a
> concept.
km_flip test in IGT has been run and is working fine with these patch 
series. Also
the existing kms_atomic test with atomic_invalid_test has been modified to
test this error code(https://patchwork.freedesktop.org/series/153330/)

Am I missing anything over here?

> Even so, I'll comment on some of the choices in the series.
>
>> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
>> ---
>>   include/uapi/drm/drm_mode.h | 42 ++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 42 insertions(+)
>>
>> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
>> index a122bea2559387576150236e3a88f99c24ad3138..f0986a3fe9a7d61e57e9a9a5ec01a604343f6930 100644
>> --- a/include/uapi/drm/drm_mode.h
>> +++ b/include/uapi/drm/drm_mode.h
>> @@ -45,6 +45,7 @@ extern "C" {
>>   #define DRM_CONNECTOR_NAME_LEN	32
>>   #define DRM_DISPLAY_MODE_LEN	32
>>   #define DRM_PROP_NAME_LEN	32
>> +#define DRM_MODE_ATOMIC_FAILURE_STRING_LEN	64
>>   
>>   #define DRM_MODE_TYPE_BUILTIN	(1<<0) /* deprecated */
>>   #define DRM_MODE_TYPE_CLOCK_C	((1<<1) | DRM_MODE_TYPE_BUILTIN) /* deprecated */
>> @@ -1157,6 +1158,47 @@ struct drm_mode_destroy_dumb {
>>   		DRM_MODE_ATOMIC_NONBLOCK |\
>>   		DRM_MODE_ATOMIC_ALLOW_MODESET)
>>   
>> +#define DRM_MODE_ATOMIC_FAILURE_REASON \
>> +	FAILURE_REASON(DRM_MODE_ATOMIC_CAP_NOT_ENABLED, "DRM_ATOMIC capability not enabled") \
> Please don't add macros that expect other macros in the context. They
> become very confusing. Just pass in the other macro to use. See MACRO__
> in include/drm/intel/pciids.h for an example.
Here we are mapping an error_code defined as enum with a corresponding 
string
using the X macros.

Anyway will have a look at the macro in include/drm/intel/pciids.h


>> +	FAILURE_REASON(DRM_MODE_ATOMIC_INVALID_FLAG, "invalid flag") \
>> +	FAILURE_REASON(DRM_MODE_ATOMIC_PAGE_FLIP_ASYNC, "Legacy DRM_MODE_PAGE_FLIP_ASYNC not to be used in atomic ioctl") \
>> +	FAILURE_REASON(DRM_MODE_ATOMIC_FLIP_EVENT_WITH_CHECKONLY, "requesting page-flip event with TEST_ONLY") \
>> +	FAILURE_REASON(DRM_MODE_ATOMIC_CRTC_NEED_FULL_MODESET, "Need full modeset on this crtc") \
>> +	FAILURE_REASON(DRM_MODE_ATOMIC_NEED_FULL_MODESET, "Need full modeset on all the connected crtc's") \
>> +	FAILURE_REASON(DRM_MODE_ATOMIC_ASYNC_NOT_SUP_PLANE, "Async flip not supported on this plane") \
>> +	FAILURE_REASON(DRM_MODE_ATOMIC_ASYNC_MODIFIER_NOT_SUPPORTED, "Modifier not supported on this plane with async flip") \
>> +	FAILURE_REASON(DRM_MODE_ATOMIC_ASYNC_PROP_CHANGED, "No property change allowed when async flip is enabled")
>> +
>> +#define FAILURE_REASON(flag, reason) flag,
>> +typedef enum {
>> +	DRM_MODE_ATOMIC_FAILURE_REASON
>> +} drm_mode_atomic_failure_flag;
>> +#undef FAILURE_REASON
> This is a uapi header. Do we really want all of that macro trickery here
> in the first place? What's wrong with just a plain enum? (Or macros.)
This is defined as enum. We have two separate list one for enum and other
for error message(string) but  upon user adding a new element/error_code 
in the
enum, there can be a possibility of missing adding the error string. So 
have linked
enum with the corresponding error message/string so both are at a single 
place
and upon adding new entry will be easy for the user.
>> +
>> +#define FAILURE_REASON(flag, reason) #reason,
>> +extern const char *drm_mode_atomic_failure_string[];
>> +#undef FAILURE_REASON
> Data is not an interface. Don't expose arrays like this. Who is even
> going to know what its size is? Again, uapi header, where does it point,
> what address space is it?
>
Sorry missed adding documentation for this. Will add in my next series.
>> +
>> +/**
>> + * drm_mode_atomic_err_code - struct to store the error code
>> + *
>> + * pointer to this struct will be stored in reserved variable of
>> + * struct drm_mode_atomic to report the failure cause to the user.
>> + *
>> + * @failure_flags: error codes defined in drm_atomic_failure.failure_flag
> Flags? As in a mask of multiple things? Is 64 going to be enough for
> everyone, all conditions in all drivers?
Should be more that sufficient, this is an enum.
> OTOH, what's the promise wrt multiple reasons? Practically all drivers
> bail out at the sight of first issue, and it's usually pretty much
> meaningless to continue to figure out *other* reasons after that.
>
> And this brings us to one of my main concerns on making this fly:
>
> You bail out on the first thing, but you can't expect all drivers to
> check stuff in the same order. It's not practical. So different drivers
> will likely return different reasons for virtually the same
> condition. So how is userspace going to handle that?
Most of the error check is in the drm-core and these are common across 
the drivers.
Upon drivers sending driver specific error code, the compositor may not 
be able to
handle the error code. But in cases required compositor changes can be 
added so
as to handle them. In general the generic error conditions that are met 
by compositor
and for which compositor can take corrective measurements are listed 
down first.
>> + * @failure_string_ptr: pointer to user readable error message drm_mode_failure.failure_string
> Is the string part of uapi, and can never change? Doesn't sound
> great. What's wrong with just a plain enum?
enum is sufficient enough and this string is added so that this error 
message

can be printed out in the compositor logs for the user.

Thanks and Regards,
Arun R Murthy
-------------------

>> + * @failure_obj_ptr: pointer to the drm_object that caused error
>> + * @reserved: reserved for future use
>> + * @count_objs: count of drm_objects if multiple drm_objects caused error
>> + */
>> +struct drm_mode_atomic_err_code {
>> +	__u64 failure_flags;
>> +	__u64 failure_objs_ptr;
>> +	__u64 reserved;
>> +	__u32 count_objs;
>> +	char failure_string[DRM_MODE_ATOMIC_FAILURE_STRING_LEN];
>> +};
>> +
>>   struct drm_mode_atomic {
>>   	__u32 flags;
>>   	__u32 count_objs;
