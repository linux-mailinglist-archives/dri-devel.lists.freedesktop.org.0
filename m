Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9327EADCC0E
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 14:55:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 333F910E65C;
	Tue, 17 Jun 2025 12:55:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q4WMGl48";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17EC910E629;
 Tue, 17 Jun 2025 12:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750164952; x=1781700952;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=syMoNi7lVAakgzLNzBOvxLzPY36JbjNSnC1hgNGowYY=;
 b=Q4WMGl48xZ7pj9iU52tp5w/LmIkfnMXym/igGLqMPXptSJFbhC+Fv8KJ
 0KFwGPXUNr5bkw9FGk15Rr32AE+oPWDUB6mHMuYjqrBeNYsJtDALKPCML
 zOpwxEc3c9oqe9jq8Zonnxd2aFUcQ6WKw0Cw4PvB7C9ChISiF4JJCcWzX
 o1TsRc/4TZc3OHn8Axn/iaP6h2VHmHmh/L8xUyMlnJ7ATm9rMM0qh6j27
 MoKxsLJxIHi91rRjPmqy7dPzIA2bH4H1SpmO2ZAlH+F2Yj+VbnKA2mmPx
 B/vASRBQiMLcBB5i/x/AbYrSBA3N6OdEWHu5IAxZVXHp+F7wz9n8jA+xk Q==;
X-CSE-ConnectionGUID: uofLDyr6SLy3b8F3MPnkbw==
X-CSE-MsgGUID: THEsluHnR+Oa5dzMIksuqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="56150735"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="56150735"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 05:55:50 -0700
X-CSE-ConnectionGUID: u+Yyb/99TdOFefR/PQ5Jcg==
X-CSE-MsgGUID: opFW8G3uTr2T1/M3Kdn69w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="148624622"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 05:55:49 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 05:55:48 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 17 Jun 2025 05:55:48 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.45)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 05:55:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RNhbX77dDcDrfhJ2X54pBkUjsEoD1AGMq3yee5W/LKuskg5wJqg06JkVflJ1kiIGpWDkxLSmMwvOrTxfK2RlJ9Qgk1J2HLwqzZah1L8q2fTYfalB2twkbHEjXK5xDt8ylor10j63GlkwbOJDW2RQFFOJc7Yvq+SFn32rzW+QvpErIoBsCVQ5A74AHcREqvMgCm4v0YvLJS/RlNQioQWH0gXIz7UHWwgS8yLUiiRx8W0VNU7ELaiLvazbvaspcQaZPCWC9KaI7fgGJujTlGhbFUvo19D/f5FJ9AP7pAonfS0CwN4PPwR3qN5DGGBD27FPC3QnHECzUPVQVdys8KukRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+lgyok5tW/SE5sHaIsiUkRp/s/SIt5ouhy4wRCIjgco=;
 b=wzbQaDzIpLkPPVzeXXZBtPzoq9jwp/opRMj0XI7JR9NdtuJVwESTpkTt4zQxnnm2KaketgMuBkDuLZ848FgplRKRpBv48ogi7OWy+JjyJ7J5c2JHiPl1pkUw4uOEVRsU0PiZj+5ldyxVj/3WaGNIxeJ+du1VsJuzmda+kIY3amcwJoW6ejbGDJmhGobSy/zTXZt62wryRTeSO+QwM/j+QqmUuGd1QCW7RE7qfbjp2J17KWWess2rJBbGzTVF2ZUuiN+aNWXY9hZS7UThlipoawUngcMI1s356RYQ4Jvf7irVJ9DyzBH/tADhCERXcqY6Ov2LYDMKBpXqXTlbQMhIkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by SN7PR11MB7665.namprd11.prod.outlook.com
 (2603:10b6:806:340::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Tue, 17 Jun
 2025 12:55:45 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed%6]) with mapi id 15.20.8835.018; Tue, 17 Jun 2025
 12:55:45 +0000
Message-ID: <93e663cf-01e7-4241-89ea-3bdda3d19437@intel.com>
Date: Tue, 17 Jun 2025 18:25:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] drm/gpusvm, drm/pagemap: Move migration
 functionality to drm_pagemap
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>,
 <dri-devel@lists.freedesktop.org>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, =?UTF-8?Q?Felix_K=C3=BChling?=
 <felix.kuehling@amd.com>, Philip Yang <philip.yang@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 <dakr@kernel.org>, "Mrozek, Michal" <michal.mrozek@intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>
References: <20250613140219.87479-1-thomas.hellstrom@linux.intel.com>
 <20250613140219.87479-2-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250613140219.87479-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0014.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::21) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|SN7PR11MB7665:EE_
X-MS-Office365-Filtering-Correlation-Id: 43d256c5-4507-4503-86ab-08ddad9e4602
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b2lCT1QvZ3Y5OW9QTS9rb1hxaEo3V2tJdnh4cjJEVlRQMGg2eC9zdlgyWmxp?=
 =?utf-8?B?c3M0L25qdzhZei9Hb3RVQUdhTVU0Ly9FUXpMWWk5M3pRMEhxNnBFVWNsbHlS?=
 =?utf-8?B?NEdwdzBGUmFoS0VQaHVpUWNleVVNNjJpUFl0VjdSN0hPeGJkbnVIZDJkT0pQ?=
 =?utf-8?B?YmlCTDBQUTdWTDVRLzFrai96WkdkdFEyeVE3azAvc2ErVkUwUWg3U2xBZC9M?=
 =?utf-8?B?dTNxQ3hKQ2VCbWpwenJnWm9hbWVVL25OYWRra0tGcUh2R24wNU0zQW9Qek8r?=
 =?utf-8?B?c3hFM0VIVGVQRHFWRnkyUmVWS0ZqUUIxVTBsb0RxL1dMRHIwUHpHRUJvSVNZ?=
 =?utf-8?B?dXlCZEo0QWhjUzFmUE1NUmZFZ3FOS3NaVTJIazdMVjJJeWpXVFI1K29xdDJL?=
 =?utf-8?B?OHo0NEhVTXZWTnZoWTdYK2FKcWtNY3BUZnRVd0dRZXRVMmZYV0dMUmhvTEV3?=
 =?utf-8?B?SEdIdzNQdDBJeklwOWtNN0JBcEtwR2o4WkVOUjI4NlIzSXA4M0FhZ1NUZHky?=
 =?utf-8?B?Mi9MVFoxNlp3OGZsaTZFOXJZZHpjTHlEZ3Rsa2FiWCtPOWZRUnRtRTJ6amV5?=
 =?utf-8?B?cHZUZmJidUptZ0dDYSttZDQvTmlIUS96ZlM4akJkeUZhUmxITmFMS2VHV3hl?=
 =?utf-8?B?WnVqQmJMN2tLYmI1OEZZSnN5OXpBQW9CRFIvbTQ4SXZZMy8zTHViNFVZbjE1?=
 =?utf-8?B?bis1Q0xrNm1JYWtlTm5NbG9lUDA1a3VwejNrK2RWTTQ1RklhZ1dsMzBzRnlE?=
 =?utf-8?B?QXF2bGNDdUQvQ1I2Q0tkZDQxMXZsOUpNWkROQ2o3K0xMaVdJdVlQaEMzOEdW?=
 =?utf-8?B?KzE0SnFQZktkUjZoaFdEeWRRa3BhRXFUdDBlUkx5bzg1Tys1RGtJRG5FOS9Z?=
 =?utf-8?B?MzVkL09mKzJ0MGpwRm1zcVBNNlhLMlNFK05YcE5YKzNDeEhTb1psQnA4bEMw?=
 =?utf-8?B?SlB4Q2duUHZXdlhSdXMwWDNIaWtHeFA1dWcreUlBWVZZZk91QkVwUjhtenJ3?=
 =?utf-8?B?c28xRTJGM1JxWU1PKzl6T0lrc0E3NnEvUkdDaklxZjQ4bzNOU0FmUHNuVUZO?=
 =?utf-8?B?SHBMdFN6U21WcHplcU03d0ZGQVlzNnpna2IxRDU0MFh3U2tUVWRxbW93YlVo?=
 =?utf-8?B?VFB3OFhjbGR1VkJxMUc3QUpkNFdpaEpRYmRDME56cTEvTVV1S3I0aVN4akwy?=
 =?utf-8?B?aThuamtuR3RpbFh3cloxL0IzdkV1ZHpIQk5mejJJcXRlN2tzeXVuTnRkZmMw?=
 =?utf-8?B?Nm51RG9YeFRWVTIyNjVTNmc2L0Y1R1hiSC9DdWFoVVJMNTlER2pNR3BWTVFK?=
 =?utf-8?B?TTVzSWxQVG12WDNNSDg2WldLRmp3UDNUd0ozL0M4MUVWYzY3TzVPYlJkOGVn?=
 =?utf-8?B?T00ybHZHVFBhVlNTcEl2TE9qZlhnTG5KeW45TjY2cENjVG1jWFI2R0N2MVJq?=
 =?utf-8?B?dTNyUVZmSENlVVVGNUoxUGUwY0pPZmFOKzNnbzhJcmVwSWwyVjdZV3RMV1Nv?=
 =?utf-8?B?ek15dDd3VFdOSldYWkJITmVIQWQ1SlltWm9WL0tSd1JWRG16Y0liTTdyZE9E?=
 =?utf-8?B?endOaDFkTWpsZWxZdmEra0trUGc1ZHFTY3RPb0dLSVIvOVhyOEoxZ2hKNXFi?=
 =?utf-8?B?R1lWc3IzVGkzaGttcktoL1Yvb0ZIVVZUb2pmTGZ0UE04eG9pcWhhRXBOUzVX?=
 =?utf-8?B?TzJKSzlFS3RQRVltTjJCUitFMEFqc1pxS1RKcktMQTJYZ1RkNUdhNXZyanNi?=
 =?utf-8?B?UVp0Y3VWRjJMVWUvRWl0OXpFcEZHcmY1TGJUUjJESmZiQ1J0Rk5JVnE1VVdB?=
 =?utf-8?B?VTdlK3EzUnpqSWRBRE80RUJzZSsrN0szS0VrNkFmTjZoOEVkU01XUm95aUVv?=
 =?utf-8?B?S1Fhdnovdm1WZXcrRit0QktJcENuYUxZOVBYQmFuT3hvdktUTTNlWklGMVVB?=
 =?utf-8?Q?3QLyubvE0MA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTBzbFBJQWh1SGZtZXZJZkIyRDIvRnVDRzVvMTJOQTBrbThqUzFqLzlLckdx?=
 =?utf-8?B?dFhWbDRtRHhpbHNSR1IwR05KRStNN2FBeWlOck9xZGVQVkNsUS94b3FxRmFn?=
 =?utf-8?B?QU1mZjFhZm42TkZBeWZJVkQ1Ukt5am14eGVuWFlOMVlLUFdheSs4MU8yczFJ?=
 =?utf-8?B?NzZaOVJCeC9DYXhGd1lSdFNtbVZmYVJIcnYvODRzTWVYa0VBTTNsdU1RUXlQ?=
 =?utf-8?B?WkpnQkdJM1RGVk5VeDB4L3FTTDNvZGdyTEhLeER2cUg4d2Y2U3kyaXVVOW5i?=
 =?utf-8?B?ZG00MGZ5ZTUxMHVidjNMOVFvdkZXQklxbXE2cFBGelE1NUdHZExkTkM3WDQ1?=
 =?utf-8?B?dVNrMC91L3V4bHh1MmlDdE5Ec3pBdnFqV0VkWW9kS0MzUmc0eGlFd0phRTdL?=
 =?utf-8?B?QnorWWU0UzdiSkZucmtJVHZ1RVphNnphdUxkaGFWR3dMdFZOL3hScmlTQmcr?=
 =?utf-8?B?OE03Y2lVMS9sTjVMZmxZYVJZZ21CbHgvUmRXY0JoQ25XS3Q4ZzU1V0FiZjZR?=
 =?utf-8?B?aCtjeDdzUVJ2dHZIcHdMamI1aUIrOUoxemQ0MTlTZEtOUVg0NHdMclY2c0N5?=
 =?utf-8?B?eHViOUxpZjFRbnpKdTVSYkpwMCtrZ3o2QkFTWDRDUHFWSzhxSjh3dGxla1Zw?=
 =?utf-8?B?U1pqMjR0c1pDUkRWdzVjUWdFWm1mSDgvc2tGU1N6N2gzWkNmV01RZ3g4dG9p?=
 =?utf-8?B?RjFHbmFIMzBzTmdhOHdyaUE0cTROZjNROHJYb3p3QXZlQUZiakhVWHNLQUl4?=
 =?utf-8?B?djhVTVUvbDAyMmZDaTNnUVBoR3FVQklSd3hvQ0hvUU96UGN0clhoZHg1RXNO?=
 =?utf-8?B?bmxOS1kzSnNmZG5vTERrTUNpMGVGVkFJbU84aG42dFJLSVpLRzJaZVdwb1Jq?=
 =?utf-8?B?RDBxVlBzN3libGg3QTh5eE1JVWZKejM3RUpWK1JCSEplZWt1a1FQaisxWDk3?=
 =?utf-8?B?Y3NGVEZ2UGRYK25KaWMyNkphUE0wNVhadk01QmlLVkJZL08xWkpQOUlGNUQx?=
 =?utf-8?B?cjdQenMyK0dTRlk2ckhwUmNqZ1lCaHNHcjV0ajIrKzVCdyt6MUdQUHFKQitv?=
 =?utf-8?B?NVBKc3ZmalN2ejU4VS9DcFFoN2NkSllXTEUzQ015RHhJU3pMR3JXdFhqQXhO?=
 =?utf-8?B?aGR3c1FIZm5jRGdkVStjOFhPeG9lQnFka3k4QjhKTDFmQi9ZS1J5WkZFVUhJ?=
 =?utf-8?B?S1h5d2NLZ2tiVlYwQ002MzJGQlZEV2ZBRnlUTGpVSk5NWHZoc2xQNCtuVjE3?=
 =?utf-8?B?YkxYSFoyTXFtckpqQjBKeXZodXdrZitmL1ZDUDcwYWtPOTZidmZRaTNCOFVR?=
 =?utf-8?B?aFFXaVAwdDJiQU1rTU9HZHpjUTlXYWlDbmIrczN0QnRPbTRWYTN1Y21vdkpZ?=
 =?utf-8?B?M3liM2xwampocWMzYXo0bjhhUi9pcXcxWVpoMnhGNmRUZllrV2JDQnVveWNZ?=
 =?utf-8?B?MmZDeHN0aE13QTNxamhkdm1GSWR5WmdxeTN2bXVsU0RLZDNURElKNkxpS2Zl?=
 =?utf-8?B?TnlDN1RCS3VabFl5QkFkZjAyTkJmeHkwRGlyYk1LOWpKcXFaTFNvbTl6Wm1u?=
 =?utf-8?B?Sk1lV3JRaXRpVHp6TGdTaWQ5eTNEWDhxNW9qcHBiZ2VUUzRMdzdUMUtrcjZY?=
 =?utf-8?B?ak5sZkZ6MzZVcHdFNHBPYlZqd1phYURTUURuR1YxeE8zUUIrMkQ4YXI1aXNu?=
 =?utf-8?B?YVpCNHVYYzdPaXpGZG9LQVFxdUZPeVNlN24rY2RRNjhYK2ZUR2ZxMnpla2Ew?=
 =?utf-8?B?eWRrZkZYZFJtQnNLdHphaTV1bGViUFN3LzdQZXRGYjZ5bjZOQllkYjlZb05S?=
 =?utf-8?B?eTkvZDB5bTRnMktWL3BSZXFQUFMzNXpLUWg4UFpVSnhybk5CMUpXeWxHckFZ?=
 =?utf-8?B?Q0kwSDU3TkUzbS8xdDJwbXFLMlBBV093WktHUlByekdCL3prelNxZHNFb1Fz?=
 =?utf-8?B?c3RhY3RhMkJzNlFLM1lGci9KcHhWV2hXTjY5NjNCZDJpeHBQdXhZK0NyYVZp?=
 =?utf-8?B?OXU1TGdrWG9oSXc1V2FpUEtPS1NOZ082Y1hiWnlMZS8vdWFLQzU3SGdHc3Iv?=
 =?utf-8?B?UmdUZC9FNU14Wk1vRkRFUXRiVGNIT0lTaWpWc0dJNTUydWpENm1OaGhSZUZw?=
 =?utf-8?B?VkJ2RU4vQi9VUGNqMmNmWENmcjBrQmtNdnJXMDNPeEE0N3AzaEUzRnRUTzY3?=
 =?utf-8?Q?sa6cJjZkCpmFjc4lMMWi1mM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 43d256c5-4507-4503-86ab-08ddad9e4602
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 12:55:45.3339 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1MOGihCyuWo0B7iDmHGZSbxnE4JjuykLl33Ez3ZBX0+S0GAvR1ly8gx/wuLCEPMR8e3KLfdecINA/huQKVocJKifLm0G5aRwKNsvHqt/z4o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7665
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



On 13-06-2025 19:32, Thomas Hellström wrote:
> From: Matthew Brost <matthew.brost@intel.com>
> 
> The migration functionality and track-keeping of per-pagemap VRAM
> mapped to the CPU mm is not per GPU_vm, but rather per pagemap.
> This is also reflected by the functions not needing the drm_gpusvm
> structures. So move to drm_pagemap.
> 
> With this, drm_gpusvm shouldn't really access the page zone-device-data
> since its meaning is internal to drm_pagemap. Currently it's used to
> reject mapping ranges backed by multiple drm_pagemap allocations.
> For now, make the zone-device-data a void pointer.
> 
> Alter the interface of drm_gpusvm_migrate_to_devmem() to ensure we don't
> pass a gpusvm pointer.
> 
> Rename CONFIG_DRM_XE_DEVMEM_MIRROR to CONFIG_DRM_XE_PAGEMAP.
> 
> Matt is listed as author of this commit since he wrote most of the code,
> and it makes sense to retain his git authorship.
> Thomas mostly moved the code around.

> 
> v3:
> - Kerneldoc fixes (CI)
> - Don't update documentation about how the drm_pagemap
>    migration should be interpreted until upcoming
>    patches where the functionality is implemented.
>    (Matt Brost)
> 
> Co-developed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   Documentation/gpu/rfc/gpusvm.rst     |  12 +-
>   drivers/gpu/drm/Makefile             |   6 +-
>   drivers/gpu/drm/drm_gpusvm.c         | 759 +-------------------------
>   drivers/gpu/drm/drm_pagemap.c        | 788 +++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/Kconfig           |  10 +-
>   drivers/gpu/drm/xe/xe_bo_types.h     |   2 +-
>   drivers/gpu/drm/xe/xe_device_types.h |   2 +-
>   drivers/gpu/drm/xe/xe_svm.c          |  47 +-
>   include/drm/drm_gpusvm.h             |  96 ----
>   include/drm/drm_pagemap.h            | 101 ++++
>   10 files changed, 950 insertions(+), 873 deletions(-)
>   create mode 100644 drivers/gpu/drm/drm_pagemap.c
> 
> diff --git a/Documentation/gpu/rfc/gpusvm.rst b/Documentation/gpu/rfc/gpusvm.rst
> index bcf66a8137a6..469db1372f16 100644
> --- a/Documentation/gpu/rfc/gpusvm.rst
> +++ b/Documentation/gpu/rfc/gpusvm.rst
> @@ -73,15 +73,21 @@ Overview of baseline design
>   .. kernel-doc:: drivers/gpu/drm/drm_gpusvm.c
>      :doc: Locking
>   
> -.. kernel-doc:: drivers/gpu/drm/drm_gpusvm.c
> -   :doc: Migration
> -
>   .. kernel-doc:: drivers/gpu/drm/drm_gpusvm.c
>      :doc: Partial Unmapping of Ranges
>   
>   .. kernel-doc:: drivers/gpu/drm/drm_gpusvm.c
>      :doc: Examples
>   
> +Overview of drm_pagemap design
> +==============================
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_pagemap.c
> +   :doc: Overview
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_pagemap.c
> +   :doc: Migration
> +
>   Possible future design features
>   ===============================
>   
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 5050ac32bba2..4dafbdc8f86a 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -104,7 +104,11 @@ obj-$(CONFIG_DRM_PANEL_BACKLIGHT_QUIRKS) += drm_panel_backlight_quirks.o
>   #
>   obj-$(CONFIG_DRM_EXEC) += drm_exec.o
>   obj-$(CONFIG_DRM_GPUVM) += drm_gpuvm.o
> -obj-$(CONFIG_DRM_GPUSVM) += drm_gpusvm.o
> +
> +drm_gpusvm_helper-y := \
> +	drm_gpusvm.o\
> +	drm_pagemap.o
> +obj-$(CONFIG_DRM_GPUSVM) += drm_gpusvm_helper.o
>   
>   obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
>   
> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> index 7ff81aa0a1ca..ef81381609de 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -8,10 +8,9 @@
>   
>   #include <linux/dma-mapping.h>
>   #include <linux/hmm.h>
> +#include <linux/hugetlb_inline.h>
>   #include <linux/memremap.h>
> -#include <linux/migrate.h>
>   #include <linux/mm_types.h>
> -#include <linux/pagemap.h>
>   #include <linux/slab.h>
>   
>   #include <drm/drm_device.h>
> @@ -107,21 +106,6 @@
>    * to add annotations to GPU SVM.
>    */
>   
> -/**
> - * DOC: Migration
> - *
> - * The migration support is quite simple, allowing migration between RAM and
> - * device memory at the range granularity. For example, GPU SVM currently does
> - * not support mixing RAM and device memory pages within a range. This means
> - * that upon GPU fault, the entire range can be migrated to device memory, and
> - * upon CPU fault, the entire range is migrated to RAM. Mixed RAM and device
> - * memory storage within a range could be added in the future if required.
> - *
> - * The reasoning for only supporting range granularity is as follows: it
> - * simplifies the implementation, and range sizes are driver-defined and should
> - * be relatively small.
> - */
> -
>   /**
>    * DOC: Partial Unmapping of Ranges
>    *
> @@ -193,10 +177,9 @@
>    *		if (driver_migration_policy(range)) {
>    *			mmap_read_lock(mm);
>    *			devmem = driver_alloc_devmem();
> - *			err = drm_gpusvm_migrate_to_devmem(gpusvm, range,
> - *							   devmem_allocation,
> - *							   &ctx);
> - *			mmap_read_unlock(mm);
> + *			err = drm_pagemap_migrate_to_devmem(devmem, gpusvm->mm, gpuva_start,
> + *                                                          gpuva_end, driver_pgmap_owner());



fix doc passing timeslice as parameter.

> + *                      mmap_read_unlock(mm);
>    *			if (err)	// CPU mappings may have changed
>    *				goto retry;
>    *		}
> @@ -288,97 +271,6 @@ npages_in_range(unsigned long start, unsigned long end)
>   	return (end - start) >> PAGE_SHIFT;
>   }
>   
> -/**
> - * struct drm_gpusvm_zdd - GPU SVM zone device data
> - *
> - * @refcount: Reference count for the zdd
> - * @devmem_allocation: device memory allocation
> - * @device_private_page_owner: Device private pages owner
> - *
> - * This structure serves as a generic wrapper installed in
> - * page->zone_device_data. It provides infrastructure for looking up a device
> - * memory allocation upon CPU page fault and asynchronously releasing device
> - * memory once the CPU has no page references. Asynchronous release is useful
> - * because CPU page references can be dropped in IRQ contexts, while releasing
> - * device memory likely requires sleeping locks.
> - */
> -struct drm_gpusvm_zdd {
> -	struct kref refcount;
> -	struct drm_gpusvm_devmem *devmem_allocation;
> -	void *device_private_page_owner;
> -};
> -
> -/**
> - * drm_gpusvm_zdd_alloc() - Allocate a zdd structure.
> - * @device_private_page_owner: Device private pages owner
> - *
> - * This function allocates and initializes a new zdd structure. It sets up the
> - * reference count and initializes the destroy work.
> - *
> - * Return: Pointer to the allocated zdd on success, ERR_PTR() on failure.
> - */
> -static struct drm_gpusvm_zdd *
> -drm_gpusvm_zdd_alloc(void *device_private_page_owner)
> -{
> -	struct drm_gpusvm_zdd *zdd;
> -
> -	zdd = kmalloc(sizeof(*zdd), GFP_KERNEL);
> -	if (!zdd)
> -		return NULL;
> -
> -	kref_init(&zdd->refcount);
> -	zdd->devmem_allocation = NULL;
> -	zdd->device_private_page_owner = device_private_page_owner;
> -
> -	return zdd;
> -}
> -
> -/**
> - * drm_gpusvm_zdd_get() - Get a reference to a zdd structure.
> - * @zdd: Pointer to the zdd structure.
> - *
> - * This function increments the reference count of the provided zdd structure.
> - *
> - * Return: Pointer to the zdd structure.
> - */
> -static struct drm_gpusvm_zdd *drm_gpusvm_zdd_get(struct drm_gpusvm_zdd *zdd)
> -{
> -	kref_get(&zdd->refcount);
> -	return zdd;
> -}
> -
> -/**
> - * drm_gpusvm_zdd_destroy() - Destroy a zdd structure.
> - * @ref: Pointer to the reference count structure.
> - *
> - * This function queues the destroy_work of the zdd for asynchronous destruction.
> - */
> -static void drm_gpusvm_zdd_destroy(struct kref *ref)
> -{
> -	struct drm_gpusvm_zdd *zdd =
> -		container_of(ref, struct drm_gpusvm_zdd, refcount);
> -	struct drm_gpusvm_devmem *devmem = zdd->devmem_allocation;
> -
> -	if (devmem) {
> -		complete_all(&devmem->detached);
> -		if (devmem->ops->devmem_release)
> -			devmem->ops->devmem_release(devmem);
> -	}
> -	kfree(zdd);
> -}
> -
> -/**
> - * drm_gpusvm_zdd_put() - Put a zdd reference.
> - * @zdd: Pointer to the zdd structure.
> - *
> - * This function decrements the reference count of the provided zdd structure
> - * and schedules its destruction if the count drops to zero.
> - */
> -static void drm_gpusvm_zdd_put(struct drm_gpusvm_zdd *zdd)
> -{
> -	kref_put(&zdd->refcount, drm_gpusvm_zdd_destroy);
> -}
> -
>   /**
>    * drm_gpusvm_range_find() - Find GPU SVM range from GPU SVM notifier
>    * @notifier: Pointer to the GPU SVM notifier structure.
> @@ -945,7 +837,7 @@ drm_gpusvm_range_chunk_size(struct drm_gpusvm *gpusvm,
>   		 * process-many-malloc' fails. In the failure case, each process
>   		 * mallocs 16k but the CPU VMA is ~128k which results in 64k SVM
>   		 * ranges. When migrating the SVM ranges, some processes fail in
> -		 * drm_gpusvm_migrate_to_devmem with 'migrate.cpages != npages'
> +		 * drm_pagemap_migrate_to_devmem with 'migrate.cpages != npages'
>   		 * and then upon drm_gpusvm_range_get_pages device pages from
>   		 * other processes are collected + faulted in which creates all
>   		 * sorts of problems. Unsure exactly how this happening, also
> @@ -1363,7 +1255,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>   		.dev_private_owner = gpusvm->device_private_page_owner,
>   	};
>   	struct mm_struct *mm = gpusvm->mm;
> -	struct drm_gpusvm_zdd *zdd;
> +	void *zdd;
>   	unsigned long timeout =
>   		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
>   	unsigned long i, j;
> @@ -1465,7 +1357,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>   				}
>   
>   				pagemap = page_pgmap(page);
> -				dpagemap = zdd->devmem_allocation->dpagemap;
> +				dpagemap = drm_pagemap_page_to_dpagemap(page);
>   				if (drm_WARN_ON(gpusvm->drm, !dpagemap)) {
>   					/*
>   					 * Raced. This is not supposed to happen
> @@ -1489,7 +1381,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>   		} else {
>   			dma_addr_t addr;
>   
> -			if (is_zone_device_page(page) || zdd) {
> +			if (is_zone_device_page(page) || pagemap) {
>   				err = -EOPNOTSUPP;
>   				goto err_unmap;
>   			}
> @@ -1517,7 +1409,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>   		flags.has_dma_mapping = true;
>   	}
>   
> -	if (zdd) {
> +	if (pagemap) {
>   		flags.has_devmem_pages = true;
>   		range->dpagemap = dpagemap;
>   	}
> @@ -1545,6 +1437,7 @@ EXPORT_SYMBOL_GPL(drm_gpusvm_range_get_pages);
>   
>   /**
>    * drm_gpusvm_range_unmap_pages() - Unmap pages associated with a GPU SVM range
> + * drm_gpusvm_range_evict() - Evict GPU SVM range
>    * @gpusvm: Pointer to the GPU SVM structure
>    * @range: Pointer to the GPU SVM range structure
>    * @ctx: GPU SVM context
> @@ -1575,562 +1468,11 @@ void drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
>   EXPORT_SYMBOL_GPL(drm_gpusvm_range_unmap_pages);
>   
>   /**
> - * drm_gpusvm_migration_unlock_put_page() - Put a migration page
> - * @page: Pointer to the page to put
> - *
> - * This function unlocks and puts a page.
> - */
> -static void drm_gpusvm_migration_unlock_put_page(struct page *page)
> -{
> -	unlock_page(page);
> -	put_page(page);
> -}
> -
> -/**
> - * drm_gpusvm_migration_unlock_put_pages() - Put migration pages
> - * @npages: Number of pages
> - * @migrate_pfn: Array of migrate page frame numbers
> - *
> - * This function unlocks and puts an array of pages.
> - */
> -static void drm_gpusvm_migration_unlock_put_pages(unsigned long npages,
> -						  unsigned long *migrate_pfn)
> -{
> -	unsigned long i;
> -
> -	for (i = 0; i < npages; ++i) {
> -		struct page *page;
> -
> -		if (!migrate_pfn[i])
> -			continue;
> -
> -		page = migrate_pfn_to_page(migrate_pfn[i]);
> -		drm_gpusvm_migration_unlock_put_page(page);
> -		migrate_pfn[i] = 0;
> -	}
> -}
> -
> -/**
> - * drm_gpusvm_get_devmem_page() - Get a reference to a device memory page
> - * @page: Pointer to the page
> - * @zdd: Pointer to the GPU SVM zone device data
> - *
> - * This function associates the given page with the specified GPU SVM zone
> - * device data and initializes it for zone device usage.
> - */
> -static void drm_gpusvm_get_devmem_page(struct page *page,
> -				       struct drm_gpusvm_zdd *zdd)
> -{
> -	page->zone_device_data = drm_gpusvm_zdd_get(zdd);
> -	zone_device_page_init(page);
> -}
> -
> -/**
> - * drm_gpusvm_migrate_map_pages() - Map migration pages for GPU SVM migration
> - * @dev: The device for which the pages are being mapped
> - * @dma_addr: Array to store DMA addresses corresponding to mapped pages
> - * @migrate_pfn: Array of migrate page frame numbers to map
> - * @npages: Number of pages to map
> - * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> - *
> - * This function maps pages of memory for migration usage in GPU SVM. It
> - * iterates over each page frame number provided in @migrate_pfn, maps the
> - * corresponding page, and stores the DMA address in the provided @dma_addr
> - * array.
> - *
> - * Return: 0 on success, -EFAULT if an error occurs during mapping.
> - */
> -static int drm_gpusvm_migrate_map_pages(struct device *dev,
> -					dma_addr_t *dma_addr,
> -					unsigned long *migrate_pfn,
> -					unsigned long npages,
> -					enum dma_data_direction dir)
> -{
> -	unsigned long i;
> -
> -	for (i = 0; i < npages; ++i) {
> -		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
> -
> -		if (!page)
> -			continue;
> -
> -		if (WARN_ON_ONCE(is_zone_device_page(page)))
> -			return -EFAULT;
> -
> -		dma_addr[i] = dma_map_page(dev, page, 0, PAGE_SIZE, dir);
> -		if (dma_mapping_error(dev, dma_addr[i]))
> -			return -EFAULT;
> -	}
> -
> -	return 0;
> -}
> -
> -/**
> - * drm_gpusvm_migrate_unmap_pages() - Unmap pages previously mapped for GPU SVM migration
> - * @dev: The device for which the pages were mapped
> - * @dma_addr: Array of DMA addresses corresponding to mapped pages
> - * @npages: Number of pages to unmap
> - * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> - *
> - * This function unmaps previously mapped pages of memory for GPU Shared Virtual
> - * Memory (SVM). It iterates over each DMA address provided in @dma_addr, checks
> - * if it's valid and not already unmapped, and unmaps the corresponding page.
> - */
> -static void drm_gpusvm_migrate_unmap_pages(struct device *dev,
> -					   dma_addr_t *dma_addr,
> -					   unsigned long npages,
> -					   enum dma_data_direction dir)
> -{
> -	unsigned long i;
> -
> -	for (i = 0; i < npages; ++i) {
> -		if (!dma_addr[i] || dma_mapping_error(dev, dma_addr[i]))
> -			continue;
> -
> -		dma_unmap_page(dev, dma_addr[i], PAGE_SIZE, dir);
> -	}
> -}
> -
> -/**
> - * drm_gpusvm_migrate_to_devmem() - Migrate GPU SVM range to device memory
> + * drm_gpusvm_range_evict() - Evict GPU SVM range
>    * @gpusvm: Pointer to the GPU SVM structure
> - * @range: Pointer to the GPU SVM range structure
> - * @devmem_allocation: Pointer to the device memory allocation. The caller
> - *                     should hold a reference to the device memory allocation,
> - *                     which should be dropped via ops->devmem_release or upon
> - *                     the failure of this function.
> - * @ctx: GPU SVM context
> - *
> - * This function migrates the specified GPU SVM range to device memory. It
> - * performs the necessary setup and invokes the driver-specific operations for
> - * migration to device memory. Upon successful return, @devmem_allocation can
> - * safely reference @range until ops->devmem_release is called which only upon
> - * successful return. Expected to be called while holding the mmap lock in read
> - * mode.
> - *
> - * Return: 0 on success, negative error code on failure.
> - */
> -int drm_gpusvm_migrate_to_devmem(struct drm_gpusvm *gpusvm,
> -				 struct drm_gpusvm_range *range,
> -				 struct drm_gpusvm_devmem *devmem_allocation,
> -				 const struct drm_gpusvm_ctx *ctx)
> -{
> -	const struct drm_gpusvm_devmem_ops *ops = devmem_allocation->ops;
> -	unsigned long start = drm_gpusvm_range_start(range),
> -		      end = drm_gpusvm_range_end(range);
> -	struct migrate_vma migrate = {
> -		.start		= start,
> -		.end		= end,
> -		.pgmap_owner	= gpusvm->device_private_page_owner,
> -		.flags		= MIGRATE_VMA_SELECT_SYSTEM,
> -	};
> -	struct mm_struct *mm = gpusvm->mm;
> -	unsigned long i, npages = npages_in_range(start, end);
> -	struct vm_area_struct *vas;
> -	struct drm_gpusvm_zdd *zdd = NULL;
> -	struct page **pages;
> -	dma_addr_t *dma_addr;
> -	void *buf;
> -	int err;
> -
> -	mmap_assert_locked(gpusvm->mm);
> -
> -	if (!range->flags.migrate_devmem)
> -		return -EINVAL;
> -
> -	if (!ops->populate_devmem_pfn || !ops->copy_to_devmem ||
> -	    !ops->copy_to_ram)
> -		return -EOPNOTSUPP;
> -
> -	vas = vma_lookup(mm, start);
> -	if (!vas) {
> -		err = -ENOENT;
> -		goto err_out;
> -	}
> -
> -	if (end > vas->vm_end || start < vas->vm_start) {
> -		err = -EINVAL;
> -		goto err_out;
> -	}
> -
> -	if (!vma_is_anonymous(vas)) {
> -		err = -EBUSY;
> -		goto err_out;
> -	}
> -
> -	buf = kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*dma_addr) +
> -		       sizeof(*pages), GFP_KERNEL);
> -	if (!buf) {
> -		err = -ENOMEM;
> -		goto err_out;
> -	}
> -	dma_addr = buf + (2 * sizeof(*migrate.src) * npages);
> -	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr)) * npages;
> -
> -	zdd = drm_gpusvm_zdd_alloc(gpusvm->device_private_page_owner);
> -	if (!zdd) {
> -		err = -ENOMEM;
> -		goto err_free;
> -	}
> -
> -	migrate.vma = vas;
> -	migrate.src = buf;
> -	migrate.dst = migrate.src + npages;
> -
> -	err = migrate_vma_setup(&migrate);
> -	if (err)
> -		goto err_free;
> -
> -	if (!migrate.cpages) {
> -		err = -EFAULT;
> -		goto err_free;
> -	}
> -
> -	if (migrate.cpages != npages) {
> -		err = -EBUSY;
> -		goto err_finalize;
> -	}
> -
> -	err = ops->populate_devmem_pfn(devmem_allocation, npages, migrate.dst);
> -	if (err)
> -		goto err_finalize;
> -
> -	err = drm_gpusvm_migrate_map_pages(devmem_allocation->dev, dma_addr,
> -					   migrate.src, npages, DMA_TO_DEVICE);
> -	if (err)
> -		goto err_finalize;
> -
> -	for (i = 0; i < npages; ++i) {
> -		struct page *page = pfn_to_page(migrate.dst[i]);
> -
> -		pages[i] = page;
> -		migrate.dst[i] = migrate_pfn(migrate.dst[i]);
> -		drm_gpusvm_get_devmem_page(page, zdd);
> -	}
> -
> -	err = ops->copy_to_devmem(pages, dma_addr, npages);
> -	if (err)
> -		goto err_finalize;
> -
> -	/* Upon success bind devmem allocation to range and zdd */
> -	devmem_allocation->timeslice_expiration = get_jiffies_64() +
> -		msecs_to_jiffies(ctx->timeslice_ms);
> -	zdd->devmem_allocation = devmem_allocation;	/* Owns ref */
> -
> -err_finalize:
> -	if (err)
> -		drm_gpusvm_migration_unlock_put_pages(npages, migrate.dst);
> -	migrate_vma_pages(&migrate);
> -	migrate_vma_finalize(&migrate);
> -	drm_gpusvm_migrate_unmap_pages(devmem_allocation->dev, dma_addr, npages,
> -				       DMA_TO_DEVICE);
> -err_free:
> -	if (zdd)
> -		drm_gpusvm_zdd_put(zdd);
> -	kvfree(buf);
> -err_out:
> -	return err;
> -}
> -EXPORT_SYMBOL_GPL(drm_gpusvm_migrate_to_devmem);
> -
> -/**
> - * drm_gpusvm_migrate_populate_ram_pfn() - Populate RAM PFNs for a VM area
> - * @vas: Pointer to the VM area structure, can be NULL
> - * @fault_page: Fault page
> - * @npages: Number of pages to populate
> - * @mpages: Number of pages to migrate
> - * @src_mpfn: Source array of migrate PFNs
> - * @mpfn: Array of migrate PFNs to populate
> - * @addr: Start address for PFN allocation
> - *
> - * This function populates the RAM migrate page frame numbers (PFNs) for the
> - * specified VM area structure. It allocates and locks pages in the VM area for
> - * RAM usage. If vas is non-NULL use alloc_page_vma for allocation, if NULL use
> - * alloc_page for allocation.
> - *
> - * Return: 0 on success, negative error code on failure.
> - */
> -static int drm_gpusvm_migrate_populate_ram_pfn(struct vm_area_struct *vas,
> -					       struct page *fault_page,
> -					       unsigned long npages,
> -					       unsigned long *mpages,
> -					       unsigned long *src_mpfn,
> -					       unsigned long *mpfn,
> -					       unsigned long addr)
> -{
> -	unsigned long i;
> -
> -	for (i = 0; i < npages; ++i, addr += PAGE_SIZE) {
> -		struct page *page, *src_page;
> -
> -		if (!(src_mpfn[i] & MIGRATE_PFN_MIGRATE))
> -			continue;
> -
> -		src_page = migrate_pfn_to_page(src_mpfn[i]);
> -		if (!src_page)
> -			continue;
> -
> -		if (fault_page) {
> -			if (src_page->zone_device_data !=
> -			    fault_page->zone_device_data)
> -				continue;
> -		}
> -
> -		if (vas)
> -			page = alloc_page_vma(GFP_HIGHUSER, vas, addr);
> -		else
> -			page = alloc_page(GFP_HIGHUSER);
> -
> -		if (!page)
> -			goto free_pages;
> -
> -		mpfn[i] = migrate_pfn(page_to_pfn(page));
> -	}
> -
> -	for (i = 0; i < npages; ++i) {
> -		struct page *page = migrate_pfn_to_page(mpfn[i]);
> -
> -		if (!page)
> -			continue;
> -
> -		WARN_ON_ONCE(!trylock_page(page));
> -		++*mpages;
> -	}
> -
> -	return 0;
> -
> -free_pages:
> -	for (i = 0; i < npages; ++i) {
> -		struct page *page = migrate_pfn_to_page(mpfn[i]);
> -
> -		if (!page)
> -			continue;
> -
> -		put_page(page);
> -		mpfn[i] = 0;
> -	}
> -	return -ENOMEM;
> -}
> -
> -/**
> - * drm_gpusvm_evict_to_ram() - Evict GPU SVM range to RAM
> - * @devmem_allocation: Pointer to the device memory allocation
> - *
> - * Similar to __drm_gpusvm_migrate_to_ram but does not require mmap lock and
> - * migration done via migrate_device_* functions.
> - *
> - * Return: 0 on success, negative error code on failure.
> - */
> -int drm_gpusvm_evict_to_ram(struct drm_gpusvm_devmem *devmem_allocation)
> -{
> -	const struct drm_gpusvm_devmem_ops *ops = devmem_allocation->ops;
> -	unsigned long npages, mpages = 0;
> -	struct page **pages;
> -	unsigned long *src, *dst;
> -	dma_addr_t *dma_addr;
> -	void *buf;
> -	int i, err = 0;
> -	unsigned int retry_count = 2;
> -
> -	npages = devmem_allocation->size >> PAGE_SHIFT;
> -
> -retry:
> -	if (!mmget_not_zero(devmem_allocation->mm))
> -		return -EFAULT;
> -
> -	buf = kvcalloc(npages, 2 * sizeof(*src) + sizeof(*dma_addr) +
> -		       sizeof(*pages), GFP_KERNEL);
> -	if (!buf) {
> -		err = -ENOMEM;
> -		goto err_out;
> -	}
> -	src = buf;
> -	dst = buf + (sizeof(*src) * npages);
> -	dma_addr = buf + (2 * sizeof(*src) * npages);
> -	pages = buf + (2 * sizeof(*src) + sizeof(*dma_addr)) * npages;
> -
> -	err = ops->populate_devmem_pfn(devmem_allocation, npages, src);
> -	if (err)
> -		goto err_free;
> -
> -	err = migrate_device_pfns(src, npages);
> -	if (err)
> -		goto err_free;
> -
> -	err = drm_gpusvm_migrate_populate_ram_pfn(NULL, NULL, npages, &mpages,
> -						  src, dst, 0);
> -	if (err || !mpages)
> -		goto err_finalize;
> -
> -	err = drm_gpusvm_migrate_map_pages(devmem_allocation->dev, dma_addr,
> -					   dst, npages, DMA_FROM_DEVICE);
> -	if (err)
> -		goto err_finalize;
> -
> -	for (i = 0; i < npages; ++i)
> -		pages[i] = migrate_pfn_to_page(src[i]);
> -
> -	err = ops->copy_to_ram(pages, dma_addr, npages);
> -	if (err)
> -		goto err_finalize;
> -
> -err_finalize:
> -	if (err)
> -		drm_gpusvm_migration_unlock_put_pages(npages, dst);
> -	migrate_device_pages(src, dst, npages);
> -	migrate_device_finalize(src, dst, npages);
> -	drm_gpusvm_migrate_unmap_pages(devmem_allocation->dev, dma_addr, npages,
> -				       DMA_FROM_DEVICE);
> -err_free:
> -	kvfree(buf);
> -err_out:
> -	mmput_async(devmem_allocation->mm);
> -
> -	if (completion_done(&devmem_allocation->detached))
> -		return 0;
> -
> -	if (retry_count--) {
> -		cond_resched();
> -		goto retry;
> -	}
> -
> -	return err ?: -EBUSY;
> -}
> -EXPORT_SYMBOL_GPL(drm_gpusvm_evict_to_ram);
> -
> -/**
> - * __drm_gpusvm_migrate_to_ram() - Migrate GPU SVM range to RAM (internal)
> - * @vas: Pointer to the VM area structure
> - * @device_private_page_owner: Device private pages owner
> - * @page: Pointer to the page for fault handling (can be NULL)
> - * @fault_addr: Fault address
> - * @size: Size of migration
> - *
> - * This internal function performs the migration of the specified GPU SVM range
> - * to RAM. It sets up the migration, populates + dma maps RAM PFNs, and
> - * invokes the driver-specific operations for migration to RAM.
> - *
> - * Return: 0 on success, negative error code on failure.
> - */
> -static int __drm_gpusvm_migrate_to_ram(struct vm_area_struct *vas,
> -				       void *device_private_page_owner,
> -				       struct page *page,
> -				       unsigned long fault_addr,
> -				       unsigned long size)
> -{
> -	struct migrate_vma migrate = {
> -		.vma		= vas,
> -		.pgmap_owner	= device_private_page_owner,
> -		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE |
> -			MIGRATE_VMA_SELECT_DEVICE_COHERENT,
> -		.fault_page	= page,
> -	};
> -	struct drm_gpusvm_zdd *zdd;
> -	const struct drm_gpusvm_devmem_ops *ops;
> -	struct device *dev = NULL;
> -	unsigned long npages, mpages = 0;
> -	struct page **pages;
> -	dma_addr_t *dma_addr;
> -	unsigned long start, end;
> -	void *buf;
> -	int i, err = 0;
> -
> -	if (page) {
> -		zdd = page->zone_device_data;
> -		if (time_before64(get_jiffies_64(),
> -				  zdd->devmem_allocation->timeslice_expiration))
> -			return 0;
> -	}
> -
> -	start = ALIGN_DOWN(fault_addr, size);
> -	end = ALIGN(fault_addr + 1, size);
> -
> -	/* Corner where VMA area struct has been partially unmapped */
> -	if (start < vas->vm_start)
> -		start = vas->vm_start;
> -	if (end > vas->vm_end)
> -		end = vas->vm_end;
> -
> -	migrate.start = start;
> -	migrate.end = end;
> -	npages = npages_in_range(start, end);
> -
> -	buf = kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*dma_addr) +
> -		       sizeof(*pages), GFP_KERNEL);
> -	if (!buf) {
> -		err = -ENOMEM;
> -		goto err_out;
> -	}
> -	dma_addr = buf + (2 * sizeof(*migrate.src) * npages);
> -	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr)) * npages;
> -
> -	migrate.vma = vas;
> -	migrate.src = buf;
> -	migrate.dst = migrate.src + npages;
> -
> -	err = migrate_vma_setup(&migrate);
> -	if (err)
> -		goto err_free;
> -
> -	/* Raced with another CPU fault, nothing to do */
> -	if (!migrate.cpages)
> -		goto err_free;
> -
> -	if (!page) {
> -		for (i = 0; i < npages; ++i) {
> -			if (!(migrate.src[i] & MIGRATE_PFN_MIGRATE))
> -				continue;
> -
> -			page = migrate_pfn_to_page(migrate.src[i]);
> -			break;
> -		}
> -
> -		if (!page)
> -			goto err_finalize;
> -	}
> -	zdd = page->zone_device_data;
> -	ops = zdd->devmem_allocation->ops;
> -	dev = zdd->devmem_allocation->dev;
> -
> -	err = drm_gpusvm_migrate_populate_ram_pfn(vas, page, npages, &mpages,
> -						  migrate.src, migrate.dst,
> -						  start);
> -	if (err)
> -		goto err_finalize;
> -
> -	err = drm_gpusvm_migrate_map_pages(dev, dma_addr, migrate.dst, npages,
> -					   DMA_FROM_DEVICE);
> -	if (err)
> -		goto err_finalize;
> -
> -	for (i = 0; i < npages; ++i)
> -		pages[i] = migrate_pfn_to_page(migrate.src[i]);
> -
> -	err = ops->copy_to_ram(pages, dma_addr, npages);
> -	if (err)
> -		goto err_finalize;
> -
> -err_finalize:
> -	if (err)
> -		drm_gpusvm_migration_unlock_put_pages(npages, migrate.dst);
> -	migrate_vma_pages(&migrate);
> -	migrate_vma_finalize(&migrate);
> -	if (dev)
> -		drm_gpusvm_migrate_unmap_pages(dev, dma_addr, npages,
> -					       DMA_FROM_DEVICE);
> -err_free:
> -	kvfree(buf);
> -err_out:
> -
> -	return err;
> -}
> -
> -/**
> - * drm_gpusvm_range_evict - Evict GPU SVM range
>    * @range: Pointer to the GPU SVM range to be removed
>    *
> - * This function evicts the specified GPU SVM range. This function will not
> - * evict coherent pages.
> + * This function evicts the specified GPU SVM range.
>    *
>    * Return: 0 on success, a negative error code on failure.
>    */
> @@ -2182,60 +1524,6 @@ int drm_gpusvm_range_evict(struct drm_gpusvm *gpusvm,
>   }
>   EXPORT_SYMBOL_GPL(drm_gpusvm_range_evict);
>   
> -/**
> - * drm_gpusvm_page_free() - Put GPU SVM zone device data associated with a page
> - * @page: Pointer to the page
> - *
> - * This function is a callback used to put the GPU SVM zone device data
> - * associated with a page when it is being released.
> - */
> -static void drm_gpusvm_page_free(struct page *page)
> -{
> -	drm_gpusvm_zdd_put(page->zone_device_data);
> -}
> -
> -/**
> - * drm_gpusvm_migrate_to_ram() - Migrate GPU SVM range to RAM (page fault handler)
> - * @vmf: Pointer to the fault information structure
> - *
> - * This function is a page fault handler used to migrate a GPU SVM range to RAM.
> - * It retrieves the GPU SVM range information from the faulting page and invokes
> - * the internal migration function to migrate the range back to RAM.
> - *
> - * Return: VM_FAULT_SIGBUS on failure, 0 on success.
> - */
> -static vm_fault_t drm_gpusvm_migrate_to_ram(struct vm_fault *vmf)
> -{
> -	struct drm_gpusvm_zdd *zdd = vmf->page->zone_device_data;
> -	int err;
> -
> -	err = __drm_gpusvm_migrate_to_ram(vmf->vma,
> -					  zdd->device_private_page_owner,
> -					  vmf->page, vmf->address,
> -					  zdd->devmem_allocation->size);
> -
> -	return err ? VM_FAULT_SIGBUS : 0;
> -}
> -
> -/*
> - * drm_gpusvm_pagemap_ops - Device page map operations for GPU SVM
> - */
> -static const struct dev_pagemap_ops drm_gpusvm_pagemap_ops = {
> -	.page_free = drm_gpusvm_page_free,
> -	.migrate_to_ram = drm_gpusvm_migrate_to_ram,
> -};
> -
> -/**
> - * drm_gpusvm_pagemap_ops_get() - Retrieve GPU SVM device page map operations
> - *
> - * Return: Pointer to the GPU SVM device page map operations structure.
> - */
> -const struct dev_pagemap_ops *drm_gpusvm_pagemap_ops_get(void)
> -{
> -	return &drm_gpusvm_pagemap_ops;
> -}
> -EXPORT_SYMBOL_GPL(drm_gpusvm_pagemap_ops_get);
> -
>   /**
>    * drm_gpusvm_has_mapping() - Check if GPU SVM has mapping for the given address range
>    * @gpusvm: Pointer to the GPU SVM structure.
> @@ -2280,28 +1568,5 @@ void drm_gpusvm_range_set_unmapped(struct drm_gpusvm_range *range,
>   }
>   EXPORT_SYMBOL_GPL(drm_gpusvm_range_set_unmapped);
>   
> -/**
> - * drm_gpusvm_devmem_init() - Initialize a GPU SVM device memory allocation
> - *
> - * @dev: Pointer to the device structure which device memory allocation belongs to
> - * @mm: Pointer to the mm_struct for the address space
> - * @ops: Pointer to the operations structure for GPU SVM device memory
> - * @dpagemap: The struct drm_pagemap we're allocating from.
> - * @size: Size of device memory allocation
> - */
> -void drm_gpusvm_devmem_init(struct drm_gpusvm_devmem *devmem_allocation,
> -			    struct device *dev, struct mm_struct *mm,
> -			    const struct drm_gpusvm_devmem_ops *ops,
> -			    struct drm_pagemap *dpagemap, size_t size)
> -{
> -	init_completion(&devmem_allocation->detached);
> -	devmem_allocation->dev = dev;
> -	devmem_allocation->mm = mm;
> -	devmem_allocation->ops = ops;
> -	devmem_allocation->dpagemap = dpagemap;
> -	devmem_allocation->size = size;
> -}
> -EXPORT_SYMBOL_GPL(drm_gpusvm_devmem_init);
> -
>   MODULE_DESCRIPTION("DRM GPUSVM");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> new file mode 100644
> index 000000000000..b7a0e6d15aff
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -0,0 +1,788 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Copyright © 2024-2025 Intel Corporation
> + */
> +
> +#include <linux/dma-mapping.h>
> +#include <linux/migrate.h>
> +#include <linux/pagemap.h>
> +#include <drm/drm_pagemap.h>
> +
> +/**
> + * DOC: Overview
> + *
> + * The DRM pagemap layer is intended to augment the dev_pagemap functionality by
> + * providing a way to populate a struct mm_struct virtual range with device
> + * private pages and to provide helpers to abstract device memory allocations,
> + * to migrate memory back and forth between device memory and system RAM and
> + * to handle access (and in the future migration) between devices implementing
> + * a fast interconnect that is not necessarily visible to the rest of the
> + * system.
> + *
> + * Typically the DRM pagemap receives requests from one or more DRM GPU SVM
> + * instances to populate struct mm_struct virtual ranges with memory.
> + */
> +
> +/**
> + * DOC: Migration
> + *
> + * The migration support is quite simple, allowing migration between RAM and
> + * device memory at the range granularity. For example, GPU SVM currently does
> + * not support mixing RAM and device memory pages within a range. This means
> + * that upon GPU fault, the entire range can be migrated to device memory, and
> + * upon CPU fault, the entire range is migrated to RAM. Mixed RAM and device
> + * memory storage within a range could be added in the future if required.
> + *
> + * The reasoning for only supporting range granularity is as follows: it
> + * simplifies the implementation, and range sizes are driver-defined and should
> + * be relatively small.
> + *
> + *
> + * Key DRM pagemap components:
> + *
> + * - Device Memory Allocations:
> + *      Embedded structure containing enough information for the drm_pagemap to
> + *      migrate to / from device memory.
> + *
> + * - Device Memory Operations:
> + *      Define the interface for driver-specific device memory operations
> + *      release memory, populate pfns, and copy to / from device memory.
> + */
> +
> +/**
> + * struct drm_pagemap_zdd - GPU SVM zone device data
> + *
> + * @refcount: Reference count for the zdd
> + * @devmem_allocation: device memory allocation
> + * @device_private_page_owner: Device private pages owner
> + *
> + * This structure serves as a generic wrapper installed in
> + * page->zone_device_data. It provides infrastructure for looking up a device
> + * memory allocation upon CPU page fault and asynchronously releasing device
> + * memory once the CPU has no page references. Asynchronous release is useful
> + * because CPU page references can be dropped in IRQ contexts, while releasing
> + * device memory likely requires sleeping locks.
> + */
> +struct drm_pagemap_zdd {
> +	struct kref refcount;
> +	struct drm_pagemap_devmem *devmem_allocation;
> +	void *device_private_page_owner;
> +};
> +
> +/**
> + * drm_pagemap_zdd_alloc() - Allocate a zdd structure.
> + * @device_private_page_owner: Device private pages owner
> + *
> + * This function allocates and initializes a new zdd structure. It sets up the
> + * reference count and initializes the destroy work.
> + *
> + * Return: Pointer to the allocated zdd on success, ERR_PTR() on failure.
> + */
> +static struct drm_pagemap_zdd *
> +drm_pagemap_zdd_alloc(void *device_private_page_owner)
> +{
> +	struct drm_pagemap_zdd *zdd;
> +
> +	zdd = kmalloc(sizeof(*zdd), GFP_KERNEL);
> +	if (!zdd)
> +		return NULL;
> +
> +	kref_init(&zdd->refcount);
> +	zdd->devmem_allocation = NULL;
> +	zdd->device_private_page_owner = device_private_page_owner;
> +
> +	return zdd;
> +}
> +
> +/**
> + * drm_pagemap_zdd_get() - Get a reference to a zdd structure.
> + * @zdd: Pointer to the zdd structure.
> + *
> + * This function increments the reference count of the provided zdd structure.
> + *
> + * Return: Pointer to the zdd structure.
> + */
> +static struct drm_pagemap_zdd *drm_pagemap_zdd_get(struct drm_pagemap_zdd *zdd)
> +{
> +	kref_get(&zdd->refcount);
> +	return zdd;
> +}
> +
> +/**
> + * drm_pagemap_zdd_destroy() - Destroy a zdd structure.
> + * @ref: Pointer to the reference count structure.
> + *
> + * This function queues the destroy_work of the zdd for asynchronous destruction.
> + */
> +static void drm_pagemap_zdd_destroy(struct kref *ref)
> +{
> +	struct drm_pagemap_zdd *zdd =
> +		container_of(ref, struct drm_pagemap_zdd, refcount);
> +	struct drm_pagemap_devmem *devmem = zdd->devmem_allocation;
> +
> +	if (devmem) {
> +		complete_all(&devmem->detached);
> +		if (devmem->ops->devmem_release)
> +			devmem->ops->devmem_release(devmem);
> +	}
> +	kfree(zdd);
> +}
> +
> +/**
> + * drm_pagemap_zdd_put() - Put a zdd reference.
> + * @zdd: Pointer to the zdd structure.
> + *
> + * This function decrements the reference count of the provided zdd structure
> + * and schedules its destruction if the count drops to zero.
> + */
> +static void drm_pagemap_zdd_put(struct drm_pagemap_zdd *zdd)
> +{
> +	kref_put(&zdd->refcount, drm_pagemap_zdd_destroy);
> +}
> +
> +/**
> + * drm_pagemap_migration_unlock_put_page() - Put a migration page
> + * @page: Pointer to the page to put
> + *
> + * This function unlocks and puts a page.
> + */
> +static void drm_pagemap_migration_unlock_put_page(struct page *page)
> +{
> +	unlock_page(page);
> +	put_page(page);
> +}
> +
> +/**
> + * drm_pagemap_migration_unlock_put_pages() - Put migration pages
> + * @npages: Number of pages
> + * @migrate_pfn: Array of migrate page frame numbers
> + *
> + * This function unlocks and puts an array of pages.
> + */
> +static void drm_pagemap_migration_unlock_put_pages(unsigned long npages,
> +						   unsigned long *migrate_pfn)
> +{
> +	unsigned long i;
> +
> +	for (i = 0; i < npages; ++i) {
> +		struct page *page;
> +
> +		if (!migrate_pfn[i])
> +			continue;
> +
> +		page = migrate_pfn_to_page(migrate_pfn[i]);
> +		drm_pagemap_migration_unlock_put_page(page);
> +		migrate_pfn[i] = 0;
> +	}
> +}
> +
> +/**
> + * drm_pagemap_get_devmem_page() - Get a reference to a device memory page
> + * @page: Pointer to the page
> + * @zdd: Pointer to the GPU SVM zone device data
> + *
> + * This function associates the given page with the specified GPU SVM zone
> + * device data and initializes it for zone device usage.
> + */
> +static void drm_pagemap_get_devmem_page(struct page *page,
> +					struct drm_pagemap_zdd *zdd)
> +{
> +	page->zone_device_data = drm_pagemap_zdd_get(zdd);
> +	zone_device_page_init(page);
> +}
> +
> +/**
> + * drm_pagemap_migrate_map_pages() - Map migration pages for GPU SVM migration
> + * @dev: The device for which the pages are being mapped
> + * @dma_addr: Array to store DMA addresses corresponding to mapped pages
> + * @migrate_pfn: Array of migrate page frame numbers to map
> + * @npages: Number of pages to map
> + * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> + *
> + * This function maps pages of memory for migration usage in GPU SVM. It
> + * iterates over each page frame number provided in @migrate_pfn, maps the
> + * corresponding page, and stores the DMA address in the provided @dma_addr
> + * array.
> + *
> + * Returns: 0 on success, -EFAULT if an error occurs during mapping.
> + */
> +static int drm_pagemap_migrate_map_pages(struct device *dev,
> +					 dma_addr_t *dma_addr,
> +					 unsigned long *migrate_pfn,
> +					 unsigned long npages,
> +					 enum dma_data_direction dir)
> +{
> +	unsigned long i;
> +
> +	for (i = 0; i < npages; ++i) {
> +		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
> +
> +		if (!page)
> +			continue;
> +
> +		if (WARN_ON_ONCE(is_zone_device_page(page)))
> +			return -EFAULT;
> +
> +		dma_addr[i] = dma_map_page(dev, page, 0, PAGE_SIZE, dir);
> +		if (dma_mapping_error(dev, dma_addr[i]))
> +			return -EFAULT;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * drm_pagemap_migrate_unmap_pages() - Unmap pages previously mapped for GPU SVM migration
> + * @dev: The device for which the pages were mapped
> + * @dma_addr: Array of DMA addresses corresponding to mapped pages
> + * @npages: Number of pages to unmap
> + * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> + *
> + * This function unmaps previously mapped pages of memory for GPU Shared Virtual
> + * Memory (SVM). It iterates over each DMA address provided in @dma_addr, checks
> + * if it's valid and not already unmapped, and unmaps the corresponding page.
> + */
> +static void drm_pagemap_migrate_unmap_pages(struct device *dev,
> +					    dma_addr_t *dma_addr,
> +					    unsigned long npages,
> +					    enum dma_data_direction dir)
> +{
> +	unsigned long i;
> +
> +	for (i = 0; i < npages; ++i) {
> +		if (!dma_addr[i] || dma_mapping_error(dev, dma_addr[i]))
> +			continue;
> +
> +		dma_unmap_page(dev, dma_addr[i], PAGE_SIZE, dir);
> +	}
> +}
> +
> +static unsigned long
> +npages_in_range(unsigned long start, unsigned long end)
> +{
> +	return (end - start) >> PAGE_SHIFT;
> +}
> +
> +/**
> + * drm_pagemap_migrate_to_devmem() - Migrate a struct mm_struct range to device memory
> + * @devmem_allocation: The device memory allocation to migrate to.
> + * The caller should hold a reference to the device memory allocation,
> + * and the reference is consumed by this function unless it returns with
> + * an error.
> + * @mm: Pointer to the struct mm_struct.
> + * @start: Start of the virtual address range to migrate.
> + * @end: End of the virtual address range to migrate.
> + * @timeslice_ms: The time requested for the migrated pages to
> + * be present in the cpu memory map before migrated back.

Shouldn't this be present in gpu or cpu memory map ? We are using this 
to ensure pagefault can be handled effectively by ensuring pages remain 
in vram here for prescribed time too.

> + * @pgmap_owner: Not used currently, since only system memory is considered.
> + *
> + * This function migrates the specified virtual address range to device memory.
> + * It performs the necessary setup and invokes the driver-specific operations for
> + * migration to device memory. Expected to be called while holding the mmap lock in
> + * at least read mode.
> + *
> + * Return: %0 on success, negative error code on failure.

s/%0/0

> + */
> +int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
> +				  struct mm_struct *mm,
> +				  unsigned long start, unsigned long end,
> +				  unsigned long timeslice_ms,
> +				  void *pgmap_owner)
> +{
> +	const struct drm_pagemap_devmem_ops *ops = devmem_allocation->ops;
> +	struct migrate_vma migrate = {
> +		.start		= start,
> +		.end		= end,
> +		.pgmap_owner	= pgmap_owner,
> +		.flags		= MIGRATE_VMA_SELECT_SYSTEM,
> +	};
> +	unsigned long i, npages = npages_in_range(start, end);
> +	struct vm_area_struct *vas;
> +	struct drm_pagemap_zdd *zdd = NULL;
> +	struct page **pages;
> +	dma_addr_t *dma_addr;
> +	void *buf;
> +	int err;
> +
> +	mmap_assert_locked(mm);
> +
> +	if (!ops->populate_devmem_pfn || !ops->copy_to_devmem ||
> +	    !ops->copy_to_ram)
> +		return -EOPNOTSUPP;
> +
> +	vas = vma_lookup(mm, start);
> +	if (!vas) {
> +		err = -ENOENT;
> +		goto err_out;
> +	}
> +
> +	if (end > vas->vm_end || start < vas->vm_start) {
> +		err = -EINVAL;
> +		goto err_out;
> +	}
> +
> +	if (!vma_is_anonymous(vas)) {
> +		err = -EBUSY;
> +		goto err_out;
> +	}
> +
> +	buf = kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*dma_addr) +
> +		       sizeof(*pages), GFP_KERNEL);
> +	if (!buf) {
> +		err = -ENOMEM;
> +		goto err_out;
> +	}
> +	dma_addr = buf + (2 * sizeof(*migrate.src) * npages);
> +	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr)) * npages;
> +
> +	zdd = drm_pagemap_zdd_alloc(pgmap_owner);
> +	if (!zdd) {
> +		err = -ENOMEM;
> +		goto err_free;
> +	}
> +
> +	migrate.vma = vas;
> +	migrate.src = buf;
> +	migrate.dst = migrate.src + npages;
> +
> +	err = migrate_vma_setup(&migrate);
> +	if (err)
> +		goto err_free;
> +
> +	if (!migrate.cpages) {
> +		err = -EFAULT;
> +		goto err_free;
> +	}
> +
> +	if (migrate.cpages != npages) {
> +		err = -EBUSY;
> +		goto err_finalize;
> +	}
> +
> +	err = ops->populate_devmem_pfn(devmem_allocation, npages, migrate.dst);
> +	if (err)
> +		goto err_finalize;
> +
> +	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev, dma_addr,
> +					    migrate.src, npages, DMA_TO_DEVICE);
> +	if (err)
> +		goto err_finalize;
> +
> +	for (i = 0; i < npages; ++i) {
> +		struct page *page = pfn_to_page(migrate.dst[i]);
> +
> +		pages[i] = page;
> +		migrate.dst[i] = migrate_pfn(migrate.dst[i]);
> +		drm_pagemap_get_devmem_page(page, zdd);
> +	}
> +
> +	err = ops->copy_to_devmem(pages, dma_addr, npages);
> +	if (err)
> +		goto err_finalize;
> +
> +	/* Upon success bind devmem allocation to range and zdd */
> +	devmem_allocation->timeslice_expiration = get_jiffies_64() +
> +		msecs_to_jiffies(timeslice_ms);
> +	zdd->devmem_allocation = devmem_allocation;	/* Owns ref */
> +
> +err_finalize:
> +	if (err)
> +		drm_pagemap_migration_unlock_put_pages(npages, migrate.dst);
> +	migrate_vma_pages(&migrate);
> +	migrate_vma_finalize(&migrate);
> +	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, dma_addr, npages,
> +					DMA_TO_DEVICE);
> +err_free:
> +	if (zdd)
> +		drm_pagemap_zdd_put(zdd);
> +	kvfree(buf);
> +err_out:
> +	return err;
> +}
> +EXPORT_SYMBOL_GPL(drm_pagemap_migrate_to_devmem);
> +
> +/**
> + * drm_pagemap_migrate_populate_ram_pfn() - Populate RAM PFNs for a VM area
> + * @vas: Pointer to the VM area structure, can be NULL
> + * @fault_page: Fault page
> + * @npages: Number of pages to populate
> + * @mpages: Number of pages to migrate
> + * @src_mpfn: Source array of migrate PFNs
> + * @mpfn: Array of migrate PFNs to populate
> + * @addr: Start address for PFN allocation
> + *
> + * This function populates the RAM migrate page frame numbers (PFNs) for the
> + * specified VM area structure. It allocates and locks pages in the VM area for
> + * RAM usage. If vas is non-NULL use alloc_page_vma for allocation, if NULL use
> + * alloc_page for allocation.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
> +						struct page *fault_page,
> +						unsigned long npages,
> +						unsigned long *mpages,
> +						unsigned long *src_mpfn,
> +						unsigned long *mpfn,
> +						unsigned long addr)
> +{
> +	unsigned long i;
> +
> +	for (i = 0; i < npages; ++i, addr += PAGE_SIZE) {
> +		struct page *page, *src_page;
> +
> +		if (!(src_mpfn[i] & MIGRATE_PFN_MIGRATE))
> +			continue;
> +
> +		src_page = migrate_pfn_to_page(src_mpfn[i]);
> +		if (!src_page)
> +			continue;
> +
> +		if (fault_page) {
> +			if (src_page->zone_device_data !=
> +			    fault_page->zone_device_data)
> +				continue;
> +		}
> +
> +		if (vas)
> +			page = alloc_page_vma(GFP_HIGHUSER, vas, addr);
> +		else
> +			page = alloc_page(GFP_HIGHUSER);
> +
> +		if (!page)
> +			goto free_pages;
> +
> +		mpfn[i] = migrate_pfn(page_to_pfn(page));
> +	}
> +
> +	for (i = 0; i < npages; ++i) {
> +		struct page *page = migrate_pfn_to_page(mpfn[i]);
> +
> +		if (!page)
> +			continue;
> +
> +		WARN_ON_ONCE(!trylock_page(page));
> +		++*mpages;
> +	}
> +
> +	return 0;
> +
> +free_pages:
> +	for (i = 0; i < npages; ++i) {
> +		struct page *page = migrate_pfn_to_page(mpfn[i]);
> +
> +		if (!page)
> +			continue;
> +
> +		put_page(page);
> +		mpfn[i] = 0;
> +	}
> +	return -ENOMEM;
> +}
> +
> +/**
> + * drm_pagemap_evict_to_ram() - Evict GPU SVM range to RAM
> + * @devmem_allocation: Pointer to the device memory allocation
> + *
> + * Similar to __drm_pagemap_migrate_to_ram but does not require mmap lock and
> + * migration done via migrate_device_* functions.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
> +{
> +	const struct drm_pagemap_devmem_ops *ops = devmem_allocation->ops;
> +	unsigned long npages, mpages = 0;
> +	struct page **pages;
> +	unsigned long *src, *dst;
> +	dma_addr_t *dma_addr;
> +	void *buf;
> +	int i, err = 0;
> +	unsigned int retry_count = 2;
> +
> +	npages = devmem_allocation->size >> PAGE_SHIFT;
> +
> +retry:
> +	if (!mmget_not_zero(devmem_allocation->mm))
> +		return -EFAULT;
> +
> +	buf = kvcalloc(npages, 2 * sizeof(*src) + sizeof(*dma_addr) +
> +		       sizeof(*pages), GFP_KERNEL);
> +	if (!buf) {
> +		err = -ENOMEM;
> +		goto err_out;
> +	}
> +	src = buf;
> +	dst = buf + (sizeof(*src) * npages);
> +	dma_addr = buf + (2 * sizeof(*src) * npages);
> +	pages = buf + (2 * sizeof(*src) + sizeof(*dma_addr)) * npages;
> +
> +	err = ops->populate_devmem_pfn(devmem_allocation, npages, src);
> +	if (err)
> +		goto err_free;
> +
> +	err = migrate_device_pfns(src, npages);
> +	if (err)
> +		goto err_free;
> +
> +	err = drm_pagemap_migrate_populate_ram_pfn(NULL, NULL, npages, &mpages,
> +						   src, dst, 0);
> +	if (err || !mpages)
> +		goto err_finalize;
> +
> +	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev, dma_addr,
> +					    dst, npages, DMA_FROM_DEVICE);
> +	if (err)
> +		goto err_finalize;
> +
> +	for (i = 0; i < npages; ++i)
> +		pages[i] = migrate_pfn_to_page(src[i]);
> +
> +	err = ops->copy_to_ram(pages, dma_addr, npages);
> +	if (err)
> +		goto err_finalize;
> +
> +err_finalize:
> +	if (err)
> +		drm_pagemap_migration_unlock_put_pages(npages, dst);
> +	migrate_device_pages(src, dst, npages);
> +	migrate_device_finalize(src, dst, npages);
> +	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, dma_addr, npages,
> +					DMA_FROM_DEVICE);
> +err_free:
> +	kvfree(buf);
> +err_out:
> +	mmput_async(devmem_allocation->mm);
> +
> +	if (completion_done(&devmem_allocation->detached))
> +		return 0;
> +
> +	if (retry_count--) {
> +		cond_resched();
> +		goto retry;
> +	}
> +
> +	return err ?: -EBUSY;
> +}
> +EXPORT_SYMBOL_GPL(drm_pagemap_evict_to_ram);
> +
> +/**
> + * __drm_pagemap_migrate_to_ram() - Migrate GPU SVM range to RAM (internal)
> + * @vas: Pointer to the VM area structure
> + * @device_private_page_owner: Device private pages owner
> + * @page: Pointer to the page for fault handling (can be NULL)
> + * @fault_addr: Fault address
> + * @size: Size of migration
> + *
> + * This internal function performs the migration of the specified GPU SVM range
> + * to RAM. It sets up the migration, populates + dma maps RAM PFNs, and
> + * invokes the driver-specific operations for migration to RAM.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
> +					void *device_private_page_owner,
> +					struct page *page,
> +					unsigned long fault_addr,
> +					unsigned long size)
> +{
> +	struct migrate_vma migrate = {
> +		.vma		= vas,
> +		.pgmap_owner	= device_private_page_owner,
> +		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE |
> +		MIGRATE_VMA_SELECT_DEVICE_COHERENT,
> +		.fault_page	= page,
> +	};
> +	struct drm_pagemap_zdd *zdd;
> +	const struct drm_pagemap_devmem_ops *ops;
> +	struct device *dev = NULL;
> +	unsigned long npages, mpages = 0;
> +	struct page **pages;
> +	dma_addr_t *dma_addr;
> +	unsigned long start, end;
> +	void *buf;
> +	int i, err = 0;
> +
> +	if (page) {
> +		zdd = page->zone_device_data;
> +		if (time_before64(get_jiffies_64(),
> +				  zdd->devmem_allocation->timeslice_expiration))
> +			return 0;
> +	}
> +
> +	start = ALIGN_DOWN(fault_addr, size);
> +	end = ALIGN(fault_addr + 1, size);
> +
> +	/* Corner where VMA area struct has been partially unmapped */
> +	if (start < vas->vm_start)
> +		start = vas->vm_start;
> +	if (end > vas->vm_end)
> +		end = vas->vm_end;
> +
> +	migrate.start = start;
> +	migrate.end = end;
> +	npages = npages_in_range(start, end);
> +
> +	buf = kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*dma_addr) +
> +		       sizeof(*pages), GFP_KERNEL);
> +	if (!buf) {
> +		err = -ENOMEM;
> +		goto err_out;
> +	}
> +	dma_addr = buf + (2 * sizeof(*migrate.src) * npages);
> +	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr)) * npages;
> +
> +	migrate.vma = vas;
> +	migrate.src = buf;
> +	migrate.dst = migrate.src + npages;
> +
> +	err = migrate_vma_setup(&migrate);
> +	if (err)
> +		goto err_free;
> +
> +	/* Raced with another CPU fault, nothing to do */
> +	if (!migrate.cpages)
> +		goto err_free;
> +
> +	if (!page) {
> +		for (i = 0; i < npages; ++i) {
> +			if (!(migrate.src[i] & MIGRATE_PFN_MIGRATE))
> +				continue;
> +
> +			page = migrate_pfn_to_page(migrate.src[i]);
> +			break;
> +		}
> +
> +		if (!page)
> +			goto err_finalize;
> +	}
> +	zdd = page->zone_device_data;
> +	ops = zdd->devmem_allocation->ops;
> +	dev = zdd->devmem_allocation->dev;
> +
> +	err = drm_pagemap_migrate_populate_ram_pfn(vas, page, npages, &mpages,
> +						   migrate.src, migrate.dst,
> +						   start);
> +	if (err)
> +		goto err_finalize;
> +
> +	err = drm_pagemap_migrate_map_pages(dev, dma_addr, migrate.dst, npages,
> +					    DMA_FROM_DEVICE);
> +	if (err)
> +		goto err_finalize;
> +
> +	for (i = 0; i < npages; ++i)
> +		pages[i] = migrate_pfn_to_page(migrate.src[i]);
> +
> +	err = ops->copy_to_ram(pages, dma_addr, npages);
> +	if (err)
> +		goto err_finalize;
> +
> +err_finalize:
> +	if (err)
> +		drm_pagemap_migration_unlock_put_pages(npages, migrate.dst);
> +	migrate_vma_pages(&migrate);
> +	migrate_vma_finalize(&migrate);
> +	if (dev)
> +		drm_pagemap_migrate_unmap_pages(dev, dma_addr, npages,
> +						DMA_FROM_DEVICE);
> +err_free:
> +	kvfree(buf);
> +err_out:
> +
> +	return err;
> +}
> +
> +/**
> + * drm_pagemap_page_free() - Put GPU SVM zone device data associated with a page
> + * @page: Pointer to the page
> + *
> + * This function is a callback used to put the GPU SVM zone device data
> + * associated with a page when it is being released.
> + */
> +static void drm_pagemap_page_free(struct page *page)
> +{
> +	drm_pagemap_zdd_put(page->zone_device_data);
> +}
> +
> +/**
> + * drm_pagemap_migrate_to_ram() - Migrate a virtual range to RAM (page fault handler)
> + * @vmf: Pointer to the fault information structure
> + *
> + * This function is a page fault handler used to migrate a virtual range
> + * to ram. The device memory allocation in which the device page is found is
> + * migrated in its entirety.
> + *
> + * Returns:
> + * VM_FAULT_SIGBUS on failure, 0 on success.
> + */
> +static vm_fault_t drm_pagemap_migrate_to_ram(struct vm_fault *vmf)
> +{
> +	struct drm_pagemap_zdd *zdd = vmf->page->zone_device_data;
> +	int err;
> +
> +	err = __drm_pagemap_migrate_to_ram(vmf->vma,
> +					   zdd->device_private_page_owner,
> +					   vmf->page, vmf->address,
> +					   zdd->devmem_allocation->size);
> +
> +	return err ? VM_FAULT_SIGBUS : 0;
> +}
> +
> +static const struct dev_pagemap_ops drm_pagemap_pagemap_ops = {
> +	.page_free = drm_pagemap_page_free,
> +	.migrate_to_ram = drm_pagemap_migrate_to_ram,
> +};
> +
> +/**
> + * drm_pagemap_pagemap_ops_get() - Retrieve GPU SVM device page map operations
> + *
> + * Returns:
> + * Pointer to the GPU SVM device page map operations structure.
> + */
> +const struct dev_pagemap_ops *drm_pagemap_pagemap_ops_get(void)
> +{
> +	return &drm_pagemap_pagemap_ops;
> +}
> +EXPORT_SYMBOL_GPL(drm_pagemap_pagemap_ops_get);
> +
> +/**
> + * drm_pagemap_devmem_init() - Initialize a drm_pagemap device memory allocation
> + *
> + * @devmem_allocation: The struct drm_pagemap_devmem to initialize.
> + * @dev: Pointer to the device structure which device memory allocation belongs to
> + * @mm: Pointer to the mm_struct for the address space
> + * @ops: Pointer to the operations structure for GPU SVM device memory
> + * @dpagemap: The struct drm_pagemap we're allocating from.
> + * @size: Size of device memory allocation
> + */
> +void drm_pagemap_devmem_init(struct drm_pagemap_devmem *devmem_allocation,
> +			     struct device *dev, struct mm_struct *mm,
> +			     const struct drm_pagemap_devmem_ops *ops,
> +			     struct drm_pagemap *dpagemap, size_t size)
> +{
> +	init_completion(&devmem_allocation->detached);
> +	devmem_allocation->dev = dev;
> +	devmem_allocation->mm = mm;
> +	devmem_allocation->ops = ops;
> +	devmem_allocation->dpagemap = dpagemap;
> +	devmem_allocation->size = size;
> +}
> +EXPORT_SYMBOL_GPL(drm_pagemap_devmem_init);
> +
> +/**
> + * drm_pagemap_page_to_dpagemap() - Return a pointer the drm_pagemap of a page
> + * @page: The struct page.
> + *
> + * Return: A pointer to the struct drm_pagemap of a device private page that
> + * was populated from the struct drm_pagemap. If the page was *not* populated
> + * from a struct drm_pagemap, the result is undefined and the function call
> + * may result in dereferencing and invalid address.
> + */
> +struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page *page)
> +{
> +	struct drm_pagemap_zdd *zdd = page->zone_device_data;
> +
> +	return zdd->devmem_allocation->dpagemap;
> +}
> +EXPORT_SYMBOL_GPL(drm_pagemap_page_to_dpagemap);
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index c57f1da0791d..b5eab4d29211 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -86,14 +86,16 @@ config DRM_XE_GPUSVM
>   
>   	  If in doubut say "Y".
>   
> -config DRM_XE_DEVMEM_MIRROR
> -	bool "Enable device memory mirror"
> +config DRM_XE_PAGEMAP
> +	bool "Enable device memory pool for SVM"
>   	depends on DRM_XE_GPUSVM
>   	select GET_FREE_REGION
>   	default y
>   	help
> -	  Disable this option only if you want to compile out without device
> -	  memory mirror. Will reduce KMD memory footprint when disabled.
> +	  Disable this option only if you don't want to expose local device
> +	  memory for SVM. Will reduce KMD memory footprint when disabled.
> +
> +	  If in doubut say "Y".
>   
>   config DRM_XE_FORCE_PROBE
>   	string "Force probe xe for selected Intel hardware IDs"
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index eb5e83c5f233..e0efaf23d051 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -86,7 +86,7 @@ struct xe_bo {
>   	u16 cpu_caching;
>   
>   	/** @devmem_allocation: SVM device memory allocation */
> -	struct drm_gpusvm_devmem devmem_allocation;
> +	struct drm_pagemap_devmem devmem_allocation;
>   
>   	/** @vram_userfault_link: Link into @mem_access.vram_userfault.list */
>   		struct list_head vram_userfault_link;
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index ac27389ccb8b..4a907231c0fc 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -105,7 +105,7 @@ struct xe_vram_region {
>   	void __iomem *mapping;
>   	/** @ttm: VRAM TTM manager */
>   	struct xe_ttm_vram_mgr ttm;
> -#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
> +#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
>   	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
>   	struct dev_pagemap pagemap;
>   	/**
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 83c63fd7b481..51b01a11a0cf 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -329,7 +329,7 @@ static void xe_svm_garbage_collector_work_func(struct work_struct *w)
>   	up_write(&vm->lock);
>   }
>   
> -#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
> +#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
>   
>   static struct xe_vram_region *page_to_vr(struct page *page)
>   {
> @@ -517,12 +517,12 @@ static int xe_svm_copy_to_ram(struct page **pages, dma_addr_t *dma_addr,
>   	return xe_svm_copy(pages, dma_addr, npages, XE_SVM_COPY_TO_SRAM);
>   }
>   
> -static struct xe_bo *to_xe_bo(struct drm_gpusvm_devmem *devmem_allocation)
> +static struct xe_bo *to_xe_bo(struct drm_pagemap_devmem *devmem_allocation)
>   {
>   	return container_of(devmem_allocation, struct xe_bo, devmem_allocation);
>   }
>   
> -static void xe_svm_devmem_release(struct drm_gpusvm_devmem *devmem_allocation)
> +static void xe_svm_devmem_release(struct drm_pagemap_devmem *devmem_allocation)
>   {
>   	struct xe_bo *bo = to_xe_bo(devmem_allocation);
>   
> @@ -539,7 +539,7 @@ static struct drm_buddy *tile_to_buddy(struct xe_tile *tile)
>   	return &tile->mem.vram.ttm.mm;
>   }
>   
> -static int xe_svm_populate_devmem_pfn(struct drm_gpusvm_devmem *devmem_allocation,
> +static int xe_svm_populate_devmem_pfn(struct drm_pagemap_devmem *devmem_allocation,
>   				      unsigned long npages, unsigned long *pfn)
>   {
>   	struct xe_bo *bo = to_xe_bo(devmem_allocation);
> @@ -562,7 +562,7 @@ static int xe_svm_populate_devmem_pfn(struct drm_gpusvm_devmem *devmem_allocatio
>   	return 0;
>   }
>   
> -static const struct drm_gpusvm_devmem_ops gpusvm_devmem_ops = {
> +static const struct drm_pagemap_devmem_ops dpagemap_devmem_ops = {
>   	.devmem_release = xe_svm_devmem_release,
>   	.populate_devmem_pfn = xe_svm_populate_devmem_pfn,
>   	.copy_to_devmem = xe_svm_copy_to_devmem,
> @@ -714,7 +714,7 @@ u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 start, u64 end, struct xe_vma *v
>   					 min(end, xe_vma_end(vma)));
>   }
>   
> -#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
> +#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
>   static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
>   {
>   	return &tile->mem.vram;
> @@ -742,6 +742,9 @@ int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
>   	ktime_t end = 0;
>   	int err;
>   
> +	if (!range->base.flags.migrate_devmem)
> +		return -EINVAL;
> +
>   	range_debug(range, "ALLOCATE VRAM");
>   
>   	if (!mmget_not_zero(mm))
> @@ -761,19 +764,23 @@ int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
>   		goto unlock;
>   	}
>   
> -	drm_gpusvm_devmem_init(&bo->devmem_allocation,
> -			       vm->xe->drm.dev, mm,
> -			       &gpusvm_devmem_ops,
> -			       &tile->mem.vram.dpagemap,
> -			       xe_svm_range_size(range));
> +	drm_pagemap_devmem_init(&bo->devmem_allocation,
> +				vm->xe->drm.dev, mm,
> +				&dpagemap_devmem_ops,
> +				&tile->mem.vram.dpagemap,
> +				xe_svm_range_size(range));
>   
>   	blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
>   	list_for_each_entry(block, blocks, link)
>   		block->private = vr;
>   
>   	xe_bo_get(bo);
> -	err = drm_gpusvm_migrate_to_devmem(&vm->svm.gpusvm, &range->base,
> -					   &bo->devmem_allocation, ctx);
> +	err = drm_pagemap_migrate_to_devmem(&bo->devmem_allocation,
> +					    mm,
> +					    xe_svm_range_start(range),
> +					    xe_svm_range_end(range),
> +					    ctx->timeslice_ms,
> +					    xe_svm_devm_owner(vm->xe));
>   	if (err)
>   		xe_svm_devmem_release(&bo->devmem_allocation);
>   
> @@ -848,13 +855,13 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>   	struct drm_gpusvm_ctx ctx = {
>   		.read_only = xe_vma_read_only(vma),
>   		.devmem_possible = IS_DGFX(vm->xe) &&
> -			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> +			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
>   		.check_pages_threshold = IS_DGFX(vm->xe) &&
> -			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
> +			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ? SZ_64K : 0,
>   		.devmem_only = atomic && IS_DGFX(vm->xe) &&
> -			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> +			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
>   		.timeslice_ms = atomic && IS_DGFX(vm->xe) &&
> -			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ?
> +			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ?
>   			vm->xe->atomic_svm_timeslice_ms : 0,
>   	};
>   	struct xe_svm_range *range;
> @@ -992,7 +999,7 @@ bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)
>    */
>   int xe_svm_bo_evict(struct xe_bo *bo)
>   {
> -	return drm_gpusvm_evict_to_ram(&bo->devmem_allocation);
> +	return drm_pagemap_evict_to_ram(&bo->devmem_allocation);
>   }
>   
>   /**
> @@ -1045,7 +1052,7 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
>   	return err;
>   }
>   
> -#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
> +#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
>   
>   static struct drm_pagemap_device_addr
>   xe_drm_pagemap_device_map(struct drm_pagemap *dpagemap,
> @@ -1102,7 +1109,7 @@ int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
>   	vr->pagemap.range.start = res->start;
>   	vr->pagemap.range.end = res->end;
>   	vr->pagemap.nr_range = 1;
> -	vr->pagemap.ops = drm_gpusvm_pagemap_ops_get();
> +	vr->pagemap.ops = drm_pagemap_pagemap_ops_get();
>   	vr->pagemap.owner = xe_svm_devm_owner(xe);
>   	addr = devm_memremap_pages(dev, &vr->pagemap);
>   
> diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
> index 6a5156476bf4..4aedc5423aff 100644
> --- a/include/drm/drm_gpusvm.h
> +++ b/include/drm/drm_gpusvm.h
> @@ -16,91 +16,9 @@ struct drm_gpusvm;
>   struct drm_gpusvm_notifier;
>   struct drm_gpusvm_ops;
>   struct drm_gpusvm_range;
> -struct drm_gpusvm_devmem;
>   struct drm_pagemap;
>   struct drm_pagemap_device_addr;
>   
> -/**
> - * struct drm_gpusvm_devmem_ops - Operations structure for GPU SVM device memory
> - *
> - * This structure defines the operations for GPU Shared Virtual Memory (SVM)
> - * device memory. These operations are provided by the GPU driver to manage device memory
> - * allocations and perform operations such as migration between device memory and system
> - * RAM.
> - */
> -struct drm_gpusvm_devmem_ops {
> -	/**
> -	 * @devmem_release: Release device memory allocation (optional)
> -	 * @devmem_allocation: device memory allocation
> -	 *
> -	 * Release device memory allocation and drop a reference to device
> -	 * memory allocation.
> -	 */
> -	void (*devmem_release)(struct drm_gpusvm_devmem *devmem_allocation);
> -
> -	/**
> -	 * @populate_devmem_pfn: Populate device memory PFN (required for migration)
> -	 * @devmem_allocation: device memory allocation
> -	 * @npages: Number of pages to populate
> -	 * @pfn: Array of page frame numbers to populate
> -	 *
> -	 * Populate device memory page frame numbers (PFN).
> -	 *
> -	 * Return: 0 on success, a negative error code on failure.
> -	 */
> -	int (*populate_devmem_pfn)(struct drm_gpusvm_devmem *devmem_allocation,
> -				   unsigned long npages, unsigned long *pfn);
> -
> -	/**
> -	 * @copy_to_devmem: Copy to device memory (required for migration)
> -	 * @pages: Pointer to array of device memory pages (destination)
> -	 * @dma_addr: Pointer to array of DMA addresses (source)
> -	 * @npages: Number of pages to copy
> -	 *
> -	 * Copy pages to device memory.
> -	 *
> -	 * Return: 0 on success, a negative error code on failure.
> -	 */
> -	int (*copy_to_devmem)(struct page **pages,
> -			      dma_addr_t *dma_addr,
> -			      unsigned long npages);
> -
> -	/**
> -	 * @copy_to_ram: Copy to system RAM (required for migration)
> -	 * @pages: Pointer to array of device memory pages (source)
> -	 * @dma_addr: Pointer to array of DMA addresses (destination)
> -	 * @npages: Number of pages to copy
> -	 *
> -	 * Copy pages to system RAM.
> -	 *
> -	 * Return: 0 on success, a negative error code on failure.
> -	 */
> -	int (*copy_to_ram)(struct page **pages,
> -			   dma_addr_t *dma_addr,
> -			   unsigned long npages);
> -};
> -
> -/**
> - * struct drm_gpusvm_devmem - Structure representing a GPU SVM device memory allocation
> - *
> - * @dev: Pointer to the device structure which device memory allocation belongs to
> - * @mm: Pointer to the mm_struct for the address space
> - * @detached: device memory allocations is detached from device pages
> - * @ops: Pointer to the operations structure for GPU SVM device memory
> - * @dpagemap: The struct drm_pagemap of the pages this allocation belongs to.
> - * @size: Size of device memory allocation
> - * @timeslice_expiration: Timeslice expiration in jiffies
> - */
> -struct drm_gpusvm_devmem {
> -	struct device *dev;
> -	struct mm_struct *mm;
> -	struct completion detached;
> -	const struct drm_gpusvm_devmem_ops *ops;
> -	struct drm_pagemap *dpagemap;
> -	size_t size;
> -	u64 timeslice_expiration;
> -};
> -
>   /**
>    * struct drm_gpusvm_ops - Operations structure for GPU SVM
>    *
> @@ -361,15 +279,6 @@ void drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
>   				  struct drm_gpusvm_range *range,
>   				  const struct drm_gpusvm_ctx *ctx);
>   
> -int drm_gpusvm_migrate_to_devmem(struct drm_gpusvm *gpusvm,
> -				 struct drm_gpusvm_range *range,
> -				 struct drm_gpusvm_devmem *devmem_allocation,
> -				 const struct drm_gpusvm_ctx *ctx);
> -
> -int drm_gpusvm_evict_to_ram(struct drm_gpusvm_devmem *devmem_allocation);
> -
> -const struct dev_pagemap_ops *drm_gpusvm_pagemap_ops_get(void);
> -
>   bool drm_gpusvm_has_mapping(struct drm_gpusvm *gpusvm, unsigned long start,
>   			    unsigned long end);
>   
> @@ -380,11 +289,6 @@ drm_gpusvm_range_find(struct drm_gpusvm_notifier *notifier, unsigned long start,
>   void drm_gpusvm_range_set_unmapped(struct drm_gpusvm_range *range,
>   				   const struct mmu_notifier_range *mmu_range);
>   
> -void drm_gpusvm_devmem_init(struct drm_gpusvm_devmem *devmem_allocation,
> -			    struct device *dev, struct mm_struct *mm,
> -			    const struct drm_gpusvm_devmem_ops *ops,
> -			    struct drm_pagemap *dpagemap, size_t size);
> -
>   #ifdef CONFIG_LOCKDEP
>   /**
>    * drm_gpusvm_driver_set_lock() - Set the lock protecting accesses to GPU SVM
> diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
> index 202c157ff4d7..dabc9c365df4 100644
> --- a/include/drm/drm_pagemap.h
> +++ b/include/drm/drm_pagemap.h
> @@ -7,6 +7,7 @@
>   #include <linux/types.h>
>   
>   struct drm_pagemap;
> +struct drm_pagemap_zdd;
>   struct device;
>   
>   /**
> @@ -104,4 +105,104 @@ struct drm_pagemap {
>   	struct device *dev;
>   };
>   
> +struct drm_pagemap_devmem;
> +
> +/**
> + * struct drm_pagemap_devmem_ops - Operations structure for GPU SVM device memory
> + *
> + * This structure defines the operations for GPU Shared Virtual Memory (SVM)
> + * device memory. These operations are provided by the GPU driver to manage device memory
> + * allocations and perform operations such as migration between device memory and system
> + * RAM.
> + */
> +struct drm_pagemap_devmem_ops {
> +	/**
> +	 * @devmem_release: Release device memory allocation (optional)
> +	 * @devmem_allocation: device memory allocation
> +	 *
> +	 * Release device memory allocation and drop a reference to device
> +	 * memory allocation.
> +	 */
> +	void (*devmem_release)(struct drm_pagemap_devmem *devmem_allocation);
> +
> +	/**
> +	 * @populate_devmem_pfn: Populate device memory PFN (required for migration)
> +	 * @devmem_allocation: device memory allocation
> +	 * @npages: Number of pages to populate
> +	 * @pfn: Array of page frame numbers to populate
> +	 *
> +	 * Populate device memory page frame numbers (PFN).
> +	 *
> +	 * Return: 0 on success, a negative error code on failure.
> +	 */
> +	int (*populate_devmem_pfn)(struct drm_pagemap_devmem *devmem_allocation,
> +				   unsigned long npages, unsigned long *pfn);
> +
> +	/**
> +	 * @copy_to_devmem: Copy to device memory (required for migration)
> +	 * @pages: Pointer to array of device memory pages (destination)
> +	 * @dma_addr: Pointer to array of DMA addresses (source)
> +	 * @npages: Number of pages to copy
> +	 *
> +	 * Copy pages to device memory.
> +	 *
> +	 * Return: 0 on success, a negative error code on failure.
> +	 */
> +	int (*copy_to_devmem)(struct page **pages,
> +			      dma_addr_t *dma_addr,
> +			      unsigned long npages);
> +
> +	/**
> +	 * @copy_to_ram: Copy to system RAM (required for migration)
> +	 * @pages: Pointer to array of device memory pages (source)
> +	 * @dma_addr: Pointer to array of DMA addresses (destination)
> +	 * @npages: Number of pages to copy
> +	 *
> +	 * Copy pages to system RAM.
> +	 *
> +	 * Return: 0 on success, a negative error code on failure.
> +	 */
> +	int (*copy_to_ram)(struct page **pages,
> +			   dma_addr_t *dma_addr,
> +			   unsigned long npages);
> +};
> +
> +/**
> + * struct drm_pagemap_devmem - Structure representing a GPU SVM device memory allocation
> + *
> + * @dev: Pointer to the device structure which device memory allocation belongs to
> + * @mm: Pointer to the mm_struct for the address space
> + * @detached: device memory allocations is detached from device pages
> + * @ops: Pointer to the operations structure for GPU SVM device memory
> + * @dpagemap: The struct drm_pagemap of the pages this allocation belongs to.
> + * @size: Size of device memory allocation
> + * @timeslice_expiration: Timeslice expiration in jiffies
> + */
> +struct drm_pagemap_devmem {
> +	struct device *dev;
> +	struct mm_struct *mm;
> +	struct completion detached;
> +	const struct drm_pagemap_devmem_ops *ops;
> +	struct drm_pagemap *dpagemap;
> +	size_t size;
> +	u64 timeslice_expiration;
> +};
> +
> +int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
> +				  struct mm_struct *mm,
> +				  unsigned long start, unsigned long end,
> +				  unsigned long timeslice_ms,
> +				  void *pgmap_owner);
> +
> +int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation);
> +
> +const struct dev_pagemap_ops *drm_pagemap_pagemap_ops_get(void);
> +
> +struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page *page);
> +
> +void drm_pagemap_devmem_init(struct drm_pagemap_devmem *devmem_allocation,
> +			     struct device *dev, struct mm_struct *mm,
> +			     const struct drm_pagemap_devmem_ops *ops,
> +			     struct drm_pagemap *dpagemap, size_t size);
> +
>   #endif

