Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7B08FFB2F
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 07:08:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD3510E20D;
	Fri,  7 Jun 2024 05:08:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QR40ten0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BDD310E1C3;
 Fri,  7 Jun 2024 05:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717736892; x=1749272892;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oMW+cO8fSr/Kt+ZfdwqdtdoVtqN7cD8KrJfhnNcIo70=;
 b=QR40ten0/25yTNliCJYMz5681cAFRn5p91Yvp8Ygl6z5WbUApDffpbGe
 bLQNHjZLaDRtaHySX01Fy3WSetl9wVdYpYJS2Fo08m/ygJOXZGifYL1x8
 3h/EO8EjBW4Ruy9w/7nPlb/ksZNguJyPG/MUopIvOUm0ptdmhlab1kG1D
 /vrqg40jZkhV5jQFKM4lRupBpZH0tINYP125n3Gvz0+ZMgg1QOXXn0CXP
 /nF0jA0WGkqWgNVCrSNlGYisWLeR4lv4aFHOk/y18b0Z/pFFfF0ffhPAF
 BVd0cW3MjluuoXLXpLVznXMzHaJSvTTdJKddVOH13511lPQyOxsJxx9pb A==;
X-CSE-ConnectionGUID: DZG31hptRBCg92Y6Npzzww==
X-CSE-MsgGUID: 0BYNS0c3SVy05IsfAvUWIQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14598346"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="14598346"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 22:08:11 -0700
X-CSE-ConnectionGUID: YTCtEfJbQOqmmX+lgXsG4A==
X-CSE-MsgGUID: GScV3LmGRYOGu5QqHlbOkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="38640661"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Jun 2024 22:08:10 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 22:08:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 22:08:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 6 Jun 2024 22:08:09 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 6 Jun 2024 22:08:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LGCYGXpecoI9yNpAjdIKhXF1MkrT7VKYWGr/hoI0OmUoyDDf6lo9Vx88ZxdqI2JanOn2o00r54qU1twIzL2o/iwBkuk7cxZrA7F8enliLr+72UIQibb7L0n/SjQP9kf5rRzQtEhEAhuNalQCuM0Aa/jZgnKSoelQZBfNvdfX6SgQtdscVH8W5AsV0vaib7NR+uwyHQfZNR1weezZ61rHmmnrBo3HgU0v3boZaj+nJjUqceUj58+vG90g8Om1e+o1qIcUN5fXa/r4vhTHXJPNkytRtiVGxZ1yA4kKJ1lOJwdxdlMnW6uu7BuSpVDNqDgwHXA+UYsdB570KUgCJlF+BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=53OWSjOKHNq5RWVhNVYcUrzedOFokvssM+n1Dk5G8TU=;
 b=LSb1ZxrTUMYBBGRtSetT5mbdHxXdtyJ09UjXtaVdatCM1d0VYPv8XNmbNqXq4mzzI+SRpAcQA0EsbXbYyj9oY6eCSCDrzIKGUsZorUY20V7+8cHvg3l4Ms7GVf/KCZtjPqiUi1Sxw49O3mGvI7wxdfhQ2HoqKU7JYMfjh0unHA9WGZS/t2+t/mk+Trb8gMaFuITGDnEZYL0+S7F1329a2UQ5OnxGonWw2J2CYBiKuDf4aKOQms3AmcHpY3Zz6RK/6V8rfZ/8/b1vxyIdc/2KWx1TWlbSL0VRCgoaZ42SNZe2eiuQVFCcJHone3z6ygtVYmCVhS4AvYlmLLhN6KKDlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by MW4PR11MB5869.namprd11.prod.outlook.com (2603:10b6:303:168::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Fri, 7 Jun
 2024 05:08:07 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%6]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 05:08:07 +0000
Message-ID: <7df45e0b-b8eb-4d07-a71e-b873d780da41@intel.com>
Date: Fri, 7 Jun 2024 10:38:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 1/9] gpu/drm/i915: Update indentation for VRR
 registers and bits
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>
References: <20240605170111.494784-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240605170111.494784-2-mitulkumar.ajitkumar.golani@intel.com>
 <1f2382b2-2a55-40e9-9fed-1da5702b91cd@intel.com>
Content-Language: en-US
In-Reply-To: <1f2382b2-2a55-40e9-9fed-1da5702b91cd@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0015.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::7) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|MW4PR11MB5869:EE_
X-MS-Office365-Filtering-Correlation-Id: 751e1fee-fbc8-4879-f678-08dc86afd18e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a2p6L0JGbHRycWJLVjcvUjVzMzlEM2VxMWJTZFVhQWM4UEg0VEtlS2p3a21u?=
 =?utf-8?B?NE83Nm9jOHFIWkVtYWFxZkgyaDc2M1ZzUnB0cVpHblA3MTducWdLR3VkOTZT?=
 =?utf-8?B?VENHQThKVXN0TVVjVzg5c01tUVRzY1N5YUNQODBaek5INjRQVitaV1hGMGF5?=
 =?utf-8?B?eTNWM1ZtTVlHZWt5T1lXM2VBam0zSG1GY3BwOE9EaSthYjFNRkZOQ1R4aEJR?=
 =?utf-8?B?YmUrN0Y1a21CQjduSGJ6SlF2S3krZllLK0kvWmR0dFExYnZkdlFCYy9RNWF2?=
 =?utf-8?B?d2JBUjNlZy9WMEtwZjl4cXBIVWZENWJGd011ZEtUU0JmWE5GMEluMHRQVi9V?=
 =?utf-8?B?K1V6RUFZc2JqZEhVSjd4SzFiL0ZlZTliV1Rsb0twSXZWZi9qZEdXZVBDc1Jo?=
 =?utf-8?B?aEtBa2J6Z0tkZk1mSmYrMGxOWEJqYmE0cGM2YXJNeXpQWUJJN3hlM3BuWVpr?=
 =?utf-8?B?dlpXQjJDd21Oam9zTmlFUmx6UUdnTFJjUFhDTHREWDJkeFNyTWJvNnpJQ1Nr?=
 =?utf-8?B?end4QSs2K0NObWo2aVpiY04vNG82OHlmK0hzUFd1TXJDV0d6TjgzSFo4cVpY?=
 =?utf-8?B?QWE4V3FjQWsvYnZ4dnBhK0RqM0pMVFBZMXF4bnFpRXBYSVhkdnRHSFM0M2o0?=
 =?utf-8?B?VDFXOVB3WUVZcFdXc1JnQ1Npb2ZhQUhxRmg0bFZXRkQzSTNjZndDYndEWHhi?=
 =?utf-8?B?dGFkQnF0M0p3dHE2d1lPanA4MldNdURLWFV1TUNCNUdmd3hhaTdkT1k3TGp4?=
 =?utf-8?B?Z3NZZkNBemRqSE5TeEVlRDAxajRvWDFRL1E2TTlCcmsyaWdXNW5zYzBzOGkx?=
 =?utf-8?B?TVN2UldXZGdEc2FGRXgvSWEwdkRsSlEzQXorMlZqL3BJRU5zUi9pd2Z0em1Y?=
 =?utf-8?B?NUxxUXNMNGo1cW1ObFR3c0JDSEkybTlHYWdIaU03MWVSQVlmemhjUmMzNXha?=
 =?utf-8?B?SGRTOXNYZHhYYlVDRFZCOHArbkwzcVZ6aE5SUGE0ZnpoWSt2UVFJTWFVS0Jp?=
 =?utf-8?B?cER0eU1SaWlkeXByM1RYVnZ0L1BLUmRyS3VoOG5CaTJGRkFSRDlVNDJyUnAz?=
 =?utf-8?B?aERLOUpnVU5oVmJKdVMvQ3ZvYlo0dEs0YlJUQmVJanloTWNrS0h5SlREUGNM?=
 =?utf-8?B?aStCNnplMnFrdk5LRldGYzYxa29EN2l5REZLV21rRFVHSUxJelFaTkpXTkwx?=
 =?utf-8?B?MjhGaUUyYjQvSW8yaXo5MlVZRklaN0p6NVhlNmpiclFmOHprTmdrZGFtOVpp?=
 =?utf-8?B?MkFKZFIrQ0Q3dHF4L1R3U1BmVGlncFF1bW9CUWxxazNaSzR4OHQ5ajlWbVlr?=
 =?utf-8?B?cS9xWm14aTNNaGUxWG1Pa3o5Y3NxQUcvSG8xU1RkKzBWdTR3VnVEVFZrd1Vh?=
 =?utf-8?B?eVdIVjNXYlRoZEQzS2JNWnpEWXBsSzVhaDJhYXJ5Vks4ZDJJaXRZOUhDeE9B?=
 =?utf-8?B?Wk12Z3kvL2NkSkl1NjhnK3ZCMzQrbGFFWEoyR083VUpEakRtTEZoUVhXWnpw?=
 =?utf-8?B?d1MyZWFyMUk0NEZ1ZzNObnQ1RFdWdklFNGpJZXRaTFg4aFNXVHA1Z1F1NDFi?=
 =?utf-8?B?LytyMGRBTTV6MGNZM3BRK2VMQlVBb01lbFpwTXJyR2xPSXV5YWo4ZG9qL21n?=
 =?utf-8?B?RVdUNXVrQ0N1WEJXMUlJVGlLdWxicjl5bFVveks0ME5mQ1pOQ2s3Z2hLODZZ?=
 =?utf-8?B?ZG9jamxqaWVaZVVqUVNEY0traTM5eHkrZllaYUtvWC8vcTJKNVJhRmV1ckVy?=
 =?utf-8?Q?dXkTajcVS0tqAUPJD8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUFMNDc4V1lkUkhkV2MvVDRwdWQrMHdCN0F2Yk9nNVV2cGwyVmlkT2NDSHFu?=
 =?utf-8?B?cnVjajFBZlBvaHJ0V2lZdHd3SFFwQWsyOTdPVXNFNGdOelNoSTloRlRCZmJC?=
 =?utf-8?B?QWxFQXNkSXRXdmI2clJkTHY5WGhOd2JJVWFFVkNsQlZhRXZoZG5oc3htVHZ2?=
 =?utf-8?B?NVpZVldnUVB2VjUwMGJUQnRBWlVGeWlzVnlPVVE0YXBrWEswb2VPMWhYRVNG?=
 =?utf-8?B?ZkQ3RWRrZ25MNjRBNkdLMVBIa0FQOFZGUHdxcmJNVUZZRDRXbSs3cm5jWVFk?=
 =?utf-8?B?Uk1TNXAyMTNocVVyTUtCcTFLN3NpNGxaWTkrMHY1RlNQOWFyUWZpNmovVEJs?=
 =?utf-8?B?L1p3dzhqZlN1RzNuQzF4cDAwNExINmhoRmVGNHA5Mi9peEU3TUM4VjZpdEhz?=
 =?utf-8?B?VEVKYzhRdFVBeWUvV0FsSWNzSG0xMkgxYzJFY3pQZC9TZEpFYU1HTlJJZU1r?=
 =?utf-8?B?aXAvOFRQQU52dTRDdjU4eGVrQjlGSEVCZkgxWFlrQ2Z2dXFhZXgvSXo1NlFs?=
 =?utf-8?B?Rm9NNzFOKzA5Y3gyNXphYmxTS1BPeFBEOHhPQjJPWEYvcW5aUjd3Y05nWW5O?=
 =?utf-8?B?eDEyM2xVTEZnVTJNU3V6MW1ja0dXZS9JSVEyTzRSV0g1V1h3ZHU5aE9MaGE2?=
 =?utf-8?B?ekloN0dBUkRXdldiSC9DR2RwdHFBRHc1amZvRlFnTW5oaCs4NmdpSVZsd3Zt?=
 =?utf-8?B?NlJsWXVHdzRsMTZJc3I2a1pzM1BzYzFnb2hqN3RoMXdURHp1ZHp4OVo3a2hK?=
 =?utf-8?B?STl0UGk4bmpWZ3NzdU5memsyYzNldmFWdklpWUZsSm9WanNkL2xUWXdQcjBz?=
 =?utf-8?B?QWlZMHRXK2x3SG5ueWRNVE1QMXBUc0l5R0RLWHVVaFBkNms0REY1aVROakt6?=
 =?utf-8?B?MEVsc3FFRGdjYXhad3N6VjZFMXdaTWd1dDlYUjdjOG5ZR1M3RkUvaWdKa1hS?=
 =?utf-8?B?bGovbi84V0tlSUJFeDRhc3QvMlVaSkZwWksvWGdhdWI5YW85Q0ljODN5UDFV?=
 =?utf-8?B?UzV5MFFxdUxHVkw2WHBuc0M3ZkJPNTFRSEpseUxzSGxwODh3UzZoelBiSmVX?=
 =?utf-8?B?SW0yZlhOQ0FHZS9kOEJxc2V2Q0J6b3NEd3plWHRVWGZ2MlMyRWpIU2RtbFpz?=
 =?utf-8?B?M2hNdjliVTJSRlJ6bVNEQmhxNXdsdFladk9FT0FKOTB4WkhNM2ZWVjczMDdp?=
 =?utf-8?B?NnhoZWRrTkVoSUV3cVcydTdXR3RzV05XTmg5M25TQ1JHWXc1YXhNZFIwYlkw?=
 =?utf-8?B?QWx3WWRTMFpZNkVPVW5ldGhSVDhjUGFUd0hlSUhwZi9NZ0RTTE0zbTJERUln?=
 =?utf-8?B?TGQwbmVhOU5LUEc3VHU1blBpSjl2ZjBxOStNTWg1WHJkVmxvSDZDYXA3eE5Y?=
 =?utf-8?B?V2tLdDBQNVpueFk4MFZ5N1dQYW8vVTFGR2lINDB5cGI5WXBHT01LQXZSUTdM?=
 =?utf-8?B?NDBVODl1dnZ2bXdJeFJ3bUNQRUgyUTd6UldkUjVjOGNvZDVHWTBnclFCYnYz?=
 =?utf-8?B?ZSs0NEtPMG9TdHZCTHRrdHFSZWJ2cWJwNURPMzB1aitpNDlXYW1SNWtMM2ZL?=
 =?utf-8?B?amF0U2IvaHc5U2MrU0NLcVZ3ZEFWSTI2SHFjL29qRDlDK1pBVCsveWpPMTMv?=
 =?utf-8?B?RU9EN3I3KzVTcjR0emtzMDc1T1VPbnpvYVFwem9hU2lGRXQ3bTJ3SXp0UmZH?=
 =?utf-8?B?Z2VmeHRyR211RVV2WTJhcW9pT0M3LzhuTjhqdmRxYTJEekhLL2haWUIvRVpY?=
 =?utf-8?B?SWxmblVEZ29Ia0FWSXV0Y1ZBS2Z4KzVCaWJlUHdoOUhEWjdScWN1QWNRK2hC?=
 =?utf-8?B?ak80cnlGRXFTODFITHVtRytEK1RaYk53TzJybVIxaWNhNzBxUFkrTlg3Y01Y?=
 =?utf-8?B?d0xrNVFvbVBBVlhoTERDQ0RtdU9iR2p4RjZMdWRvVER1N0pPTE9KTzYraWV4?=
 =?utf-8?B?a2VFV2Y5dWltdDhaSmtzQjNzbUVseGhZdFYzZnF1UmJyK3VSazlGc0dGaDhL?=
 =?utf-8?B?dmJaUVBYcGF0T21NbnlrRGZJMU0xQUdHTW1YeUdCcTA5dEVHMnBhMWtPNXlv?=
 =?utf-8?B?cXJhYlFOd1RCSFp5L3lIN1BXa05NTVNJNWd6ak1LUkt0UERwV3lYb2E1R2w5?=
 =?utf-8?B?SGgzNmlINWJzajVPaFhyWXk3dGQxeGJWSDdVNktGYVp6ZXpGMDh3S2ZocFpK?=
 =?utf-8?B?eXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 751e1fee-fbc8-4879-f678-08dc86afd18e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 05:08:07.4498 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EShr/UkGxe+pg7ZzIQGJ2iTdOpP41/K5H6dMST2422+y57M7nhkcFf90JUAbdN0qtMePbDnoa1CIIRQC29nwBDFebdr+dWyev67fhTK1lsc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5869
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


On 6/7/2024 8:59 AM, Nautiyal, Ankit K wrote:
>
> On 6/5/2024 10:31 PM, Mitul Golani wrote:
>> Update the indentation for the VRR register definition and
>> its bits, and fix checkpatch issues to ensure smooth movement
>> of registers and bits.
>>
>> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
>
> LGTM
>
> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Having look at the next patch, I fee there are still few things that can 
be fixed in VRR regs since we are moving these into a new file.

IMHO, it would be great if we can make the changes so that the new file 
adheres to the formatting mentioned in i915_reg.h

Regards,

Ankit


>
>
>> ---
>>   drivers/gpu/drm/i915/i915_reg.h | 9 +++++----
>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_reg.h 
>> b/drivers/gpu/drm/i915/i915_reg.h
>> index 0569a23b83b2..6b39211b5469 100644
>> --- a/drivers/gpu/drm/i915/i915_reg.h
>> +++ b/drivers/gpu/drm/i915/i915_reg.h
>> @@ -1152,7 +1152,7 @@
>>   #define _TRANS_VRR_CTL_B        0x61420
>>   #define _TRANS_VRR_CTL_C        0x62420
>>   #define _TRANS_VRR_CTL_D        0x63420
>> -#define TRANS_VRR_CTL(dev_priv, trans) _MMIO_TRANS2(dev_priv, trans, 
>> _TRANS_VRR_CTL_A)
>> +#define TRANS_VRR_CTL(dev_priv, trans) _MMIO_TRANS2(dev_priv, trans, 
>> _TRANS_VRR_CTL_A)
>>   #define   VRR_CTL_VRR_ENABLE            REG_BIT(31)
>>   #define   VRR_CTL_IGN_MAX_SHIFT            REG_BIT(30)
>>   #define   VRR_CTL_FLIP_LINE_EN            REG_BIT(29)
>> @@ -1160,7 +1160,8 @@
>>   #define   VRR_CTL_PIPELINE_FULL(x) 
>> REG_FIELD_PREP(VRR_CTL_PIPELINE_FULL_MASK, (x))
>>   #define   VRR_CTL_PIPELINE_FULL_OVERRIDE    REG_BIT(0)
>>   #define      XELPD_VRR_CTL_VRR_GUARDBAND_MASK REG_GENMASK(15, 0)
>> -#define      XELPD_VRR_CTL_VRR_GUARDBAND(x) 
>> REG_FIELD_PREP(XELPD_VRR_CTL_VRR_GUARDBAND_MASK, (x))
>> +#define      XELPD_VRR_CTL_VRR_GUARDBAND(x) 
>> REG_FIELD_PREP(XELPD_VRR_CTL_VRR_GUARDBAND_MASK, \
>> +                                (x))
>>     #define _TRANS_VRR_VMAX_A        0x60424
>>   #define _TRANS_VRR_VMAX_B        0x61424
>> @@ -1190,7 +1191,7 @@
>>   #define _TRANS_VRR_STATUS_B        0x6142C
>>   #define _TRANS_VRR_STATUS_C        0x6242C
>>   #define _TRANS_VRR_STATUS_D        0x6342C
>> -#define TRANS_VRR_STATUS(dev_priv, trans) _MMIO_TRANS2(dev_priv, 
>> trans, _TRANS_VRR_STATUS_A)
>> +#define TRANS_VRR_STATUS(dev_priv, trans) _MMIO_TRANS2(dev_priv, 
>> trans, _TRANS_VRR_STATUS_A)
>>   #define   VRR_STATUS_VMAX_REACHED    REG_BIT(31)
>>   #define   VRR_STATUS_NOFLIP_TILL_BNDR    REG_BIT(30)
>>   #define   VRR_STATUS_FLIP_BEF_BNDR    REG_BIT(29)
>> @@ -1241,7 +1242,7 @@
>>   #define   TRANS_PUSH_SEND        REG_BIT(30)
>>     #define _TRANS_VRR_VSYNC_A        0x60078
>> -#define TRANS_VRR_VSYNC(dev_priv, trans) _MMIO_TRANS2(dev_priv, 
>> trans, _TRANS_VRR_VSYNC_A)
>> +#define TRANS_VRR_VSYNC(dev_priv, trans) _MMIO_TRANS2(dev_priv, 
>> trans, _TRANS_VRR_VSYNC_A)
>>   #define VRR_VSYNC_END_MASK        REG_GENMASK(28, 16)
>>   #define VRR_VSYNC_END(vsync_end) REG_FIELD_PREP(VRR_VSYNC_END_MASK, 
>> (vsync_end))
>>   #define VRR_VSYNC_START_MASK        REG_GENMASK(12, 0)
