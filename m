Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5880CB3F9D7
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 11:10:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E1FA10E31D;
	Tue,  2 Sep 2025 09:10:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="izIS8sFq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AA8E10E31D;
 Tue,  2 Sep 2025 09:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756804235; x=1788340235;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=WwQVQHHv3og+d9kXbo9B4+B/dhS1dR8Rk1Nh+9B3yGI=;
 b=izIS8sFqtTtobr7E7tU7pUR/rWNbMy6FaGteOHL9Kc5NXgIeBDUPnFXI
 pa4rDkM4gWDfn4sfTmDd1I+MOfifOa5T8jv5bfQwL90rkxBIYWDvJAwQP
 oea/5iBaiiJ2cAVrp7mHbqxoqo6yn+uy81hS4OQ/QQaPamcu0NpmHlNGj
 y+dmQnaPnc911jiXuBwk3WEc7YlnJ2odeqGGKJQm9oPBaq6I5J6vX8c0H
 38UB5XqKUiexwX96Teu680AmkyBKTQEv5X88e+6Iwgi7iYCTYBCSeDexB
 XVZQpss/TH22oPPHzbVPh+yaoymqgVNKwsH5AkJvjYA9NZQPq2QlI3sWD g==;
X-CSE-ConnectionGUID: AIRiUqlrTlWu5dgjukELxQ==
X-CSE-MsgGUID: QIv1HPVVQxWPDiK4nhvZpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="59005317"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="59005317"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 02:10:35 -0700
X-CSE-ConnectionGUID: NIhuMTbQQ6WkfNt+jFYGFA==
X-CSE-MsgGUID: pLOER2isR2umjo6qO8nJ9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="171667740"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 02:10:35 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 02:10:33 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 2 Sep 2025 02:10:33 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.75)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 02:10:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hVgREn7ZWa5tPRpXmTLUOSolDGhlOJQPfgcjj2j6cRyHGpm4ZIIVh6K7Wpv8bmphJ8n1050HQ4NfsT0H95gGbeZ/aFDuH6KKTD4oKdClw4NUEomGY7LXA9wo9YI04lC169PsemFU4SY5tj7SLA2dBoMtd2QIJS1hCk9z2KMeTlU/V5477pmuoVqdENeCa4ggHA7WQG0F9x2A7ob4aTQ1/ab7cl+mYV9AmKGGpDYV1nVMMOdIB3bSeXvG2lrWBeu7x2MzHFRyVd9UzZF71XDNJBk1151lBxL7+oO8S78gIneHmBAurlLMfnUed6//fjmiklDhHOODtl+Cfi+GnVs01Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CpatTF62e6PgYlI/81knp2Sbo33iCfXHfKvAFoxlKtw=;
 b=EgEDw5xgNk0WI9G5Uu2OL1/BmzW5MiyWbMkOSOuRTsTdQlO/Y0uO2tv5XR0gTlTLwZpaE300WHBeNM+7pVJ/NwOehRyvkeAofCfIT0Eb1LAxA2oyt2q93BrWYtmyXmysC71YQ+mzzb40QCkxeKmE4MkqiIfcCsajvDLlOQjnsve/WUUh/C8rQxpG4Yma2Jy6CmYUXtC2KB/NWDV6y3vPSnYkFuher9tYsr++8kTj4a+jq1xbupx3PRfddURTlMFa8AuICGVUh0fqc9hB919Jn+FGMBmZxMd7mr4PBaN585QYoTkaH4LQPI6bUlkazdjO5HxrtSURy0c47agQiPL9wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by DS7PR11MB9475.namprd11.prod.outlook.com (2603:10b6:8:26b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 09:10:26 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 09:10:26 +0000
Date: Tue, 2 Sep 2025 11:10:18 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v5 1/8] drm/gpusvm: fix hmm_pfn_to_map_order() usage
Message-ID: <aLa0ejSifS16yA31@fdugast-desk>
References: <20250818152152.67815-10-matthew.auld@intel.com>
 <20250818152152.67815-11-matthew.auld@intel.com>
 <aKNlPkAEXJ9/j1Hy@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aKNlPkAEXJ9/j1Hy@lstrano-desk.jf.intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: WA2P291CA0044.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::20) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|DS7PR11MB9475:EE_
X-MS-Office365-Filtering-Correlation-Id: 1685771f-2356-4831-5544-08ddea008e1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aTlZbWZvQ2RwbW1STHJjMDFqUVFmSDZyRlplaStlOHIwRWFoQzEveXVIV3M3?=
 =?utf-8?B?bmtFenlRZHN1K3QrYVA0b0d2MDZoOUtIWWR0aEcrRThBaWk3MVA2MEVwQkEw?=
 =?utf-8?B?VHZBZHBXWkpUOFlqMzBNSDc0cnAyUTQ4dXFvYzYybGNjYmxYMEtQaWdleWRI?=
 =?utf-8?B?NkFRSC9nVm4xbndOdmxvcjRJakdzWTVSOWFhOTdjU2FiQy9Hd3hTSVN4ZUlW?=
 =?utf-8?B?d1dWMU1kaGNHY0FiSDJoV0dNckY0cHdReG9BRUkweTZNWi80R2FSZTJBMkx3?=
 =?utf-8?B?VjJ3QytNWmhYTGloS3J6RE5yRy9tZU9KZXVXM0N3cWlPMCtjaHhWZzFXdVBP?=
 =?utf-8?B?Q0JlVkdVdXIxM0toa2hOVW1WcGN6LzVOYXNkWStOWHhFUmhNYTZMdGFKdmNZ?=
 =?utf-8?B?STA4WEtId1BqVisvMEJRTmErQkVLQU5UTm1ZVFhqWGU3cGNVSEZ5a2c2aVFD?=
 =?utf-8?B?ZEpoa1V5WXVqNGYzZ0t6VmtDYjlYNWc1QlhteHRlUG41Zlc0cHFIdk8vb3FL?=
 =?utf-8?B?SGdoYkJIdHpxaXo2Z25nNFh1SnM1eHN2ZkcrZWtVRzYvU3hkeDAxYU5lN1o0?=
 =?utf-8?B?OEcwM21CaXFXRW5zcGVKMlVPOStxS3p1aWtVSXVRL3JaNjBZdjlEdDRiVUht?=
 =?utf-8?B?ZytvcFAwYUsrcEVRWEtQeityamZJN2IvK2tqb3NIMkpqRmd6Mk5YaXQycFVi?=
 =?utf-8?B?MHRRYnpvS2t1R3ZRRjhSbHJsVXdjZE5RaGVOMThtMGVkWnRxUE9JRjBJdnJQ?=
 =?utf-8?B?QjhYS0M5ZzFaeUh0dHBYUU95NWZsMWVkWmlrYTI4SjY3bGhmL3BuOUpUcmRr?=
 =?utf-8?B?KzNocHMxM1F4eVdvVHpSVjA1STlVU3RoaTg1YlNqQ0ZkTFNJOVdzWGh0Q1JL?=
 =?utf-8?B?NExza2YvT0JlaE10YSt3c2JySjBBWm5OWDJVNkIrWnc1SUJMNUNCdlZMSlU3?=
 =?utf-8?B?ZlN6L0x4T2dsOXNmdzRXSEhnNHN4NithdEcyQktLdjV5cFVjYmtmNURNR3FE?=
 =?utf-8?B?RzVaSEcyaXFUWGU3aG91RWhtell0WXlSWGN5ejVXVDV5U2RiREh4VkJuV0ox?=
 =?utf-8?B?bVVYa0RuOHlOL0FnRlA0b3BPK1FweGNBNEFCQ1F4R3N0eE1naEh4NDdZTWNH?=
 =?utf-8?B?MlgwUjkreXJrb3UvajlQa2kxZ2ZQQ0pRNVdhdmhGeUpGU09MVUQ5aVQxSk12?=
 =?utf-8?B?U05pVWV0SXNSR2M2UWQyWnk2R2ZoeEpLczlscm5nMlRrY21kYUlsbjNyMzZ2?=
 =?utf-8?B?NWY0bjNveDQxcVRYVzFyUkFTYlV6RFgyWnJ4bkZ2UE5sS3EvWnYrTVh0OU5Y?=
 =?utf-8?B?Sk14cFJwV2dyajRRUzY2OGxmMnBZNDRqdmhmKzRwRzBUemFPeWdIODZMbnBV?=
 =?utf-8?B?WDh5YmRZcG1mNmw3NlFOYThKZEZJVHNHb05ZYk1obFVBMEp6UzJuMFIzSlAx?=
 =?utf-8?B?Sk1RaXNnSHMybVg2bGtpa0pDZWhwdDVOTXlMa1YxVExKK2kyQVRrd1doSHJF?=
 =?utf-8?B?YzhENmt6amtGbmlVamZlM2NSSVhFa3ZZaHIybFkvaW0wR3lQNlVJMVZCa05M?=
 =?utf-8?B?U1BxZFExenVUTFF4OUZlRmErSHZ2WktxZXBPQmpxQWFMWW1qVEhhWnVGRjBt?=
 =?utf-8?B?OFFoVjAxbXVXS3FPc2FQay9qaEVIS0tBTXpZYnRZZXo2cmtYaEJNaDEyMWZn?=
 =?utf-8?B?eUNQekF5ZS9qY1ZMcll6NHJ3TXRwTGdGQ3NyaDVxL2krc05WQWJ3WHdwOXhF?=
 =?utf-8?B?b2pmSmNyaGdNTmc5d2RNWUx6aXJaVmIrM0t6OHpHVUtWWkxUKzVpbnFJUjZH?=
 =?utf-8?B?eTg3blFwUWc1cVM4UnlLek5iWXBHRklybWR4L09WYUl5Nys1M3d1Q08vcURD?=
 =?utf-8?B?bVFLUkpBbFlxd29jVjdUN2pTaHJnTzFUeXI1aTNmME03d0VPUzM0VlFjQ3Br?=
 =?utf-8?Q?hyQOMkWI940=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3ZIbCtBZDVrK0EzNnpWbHVRYUxOZDRNTnpKc0pjaTBFcXVRTHZXTElZNlNK?=
 =?utf-8?B?dkk3ek8zQk03VnZWL2g0UnB0aDd2UTM1NzhRR29JZUk2amxEUzdLakFVUmFU?=
 =?utf-8?B?ZDNFMExkWDRKNWtCVlM2aU13V2dPZTd1ZlVuTFRmckV3aDQwMXViL3I4NDQ2?=
 =?utf-8?B?anI3TkgycGZINVR1L0wzWkU3Vk9aTFVLR3ZXTXJnb2tWeU1MTTZvVDBHNVpK?=
 =?utf-8?B?QS8vbk9GQVRPRml1RGdzT3R0bFNFNTRnQzJPZDhIMVIxYWdVY1N1djRZV1JH?=
 =?utf-8?B?V0g1Qmo1SDlnNzVOc2JXZDgxM1NnZlpFTU1qMkR1TUw5U0k5NUU4Ry9hTzNS?=
 =?utf-8?B?OHhacjRjMVVlVHkvcG84WUl5eGtMSHN6c09SOXMvb3pFY0lKck5jb0FkMnlm?=
 =?utf-8?B?SFpSY1ZqaGcrb3ZUNEFLVm9tTlVHWGVsY2VvUnVqWStjc0tvTm1MODJnSndm?=
 =?utf-8?B?Yk1LdWJjT0NRZSs3U2dQQ0ozbVcvcCtQeTFaU0huWm40RkpXazlHVWNCY0pW?=
 =?utf-8?B?cGhIOTVES2lyM09vb29xZGIzWXg2bURYWjRZUjBKbVZjd2VaWVNQTzhRR0s1?=
 =?utf-8?B?OTBxbjZPMStlNWp5YlQ4Zy9SMnlVVXlVVzBDUlZUQnZaRUxPNXRVWDkvNGdD?=
 =?utf-8?B?cGtOajFSNHVyTnhXL3lmT1VhdklxU3BvUU0zaUs0WXN4NG56N3VDUDRXc0xW?=
 =?utf-8?B?bDc4WWlFWm8wY0dFRUJqRnN4Uko4VWNWS2VnaXBzc2RTR1gweW5Bek5kWHZp?=
 =?utf-8?B?VnlBZTFtRkhZU2lwNHAvNG9WSXBrNGhGQmd4ZXJLU3lsMUhBbk1HYkVmaHpS?=
 =?utf-8?B?aCtRNTNJTlYyN203aUZVTkhvZ3VLTzlTVTNHclRqNUxjVkhhOEdHWFhvRld0?=
 =?utf-8?B?VFBnZ2hmRWFwY3JKUkd2RUh6YWk3ZGZnbFZTTUsrVHd4YXh4TzhiWjJrUFQ0?=
 =?utf-8?B?NVVXWCtJT0M5U01yR2E0djFOSjd3dnpsdmRpQXNZUmRHMEZSVHJicVB4K0xq?=
 =?utf-8?B?TUFTMC9kcDc2V25mUjhmLzZWOEFhZWFwNFJ1OXBWRXlybDVGdkhqWnQyd2lI?=
 =?utf-8?B?ZXJtWHVNQzF3MkR3cDlPQXNjdkJJMTJyckloRUVCVm11VzJkaFliZkhmQjNy?=
 =?utf-8?B?dlc2ZjVZa0hlN2hPTjlibi94VHd4L0hKRkxiNnFvS1doUVdlbW9IUEtnRGhU?=
 =?utf-8?B?Wi9BdHR4U29ZdG8waVAyUmljbkpuRGFCVTErZTlkVEdCZXM2a0k2bVhvSmp5?=
 =?utf-8?B?cldNMFFsUEN3Rk45eERqSFZ4bFVGTm5uMHlTcHV0dlV5Q3J0emFXMjZNUk9m?=
 =?utf-8?B?SGJZdmphcnNqbFF2Q3Z0ZjRIZURxQXFlUjlRSHJJV0lhVWhOY0gxMGhTbzJn?=
 =?utf-8?B?VWl1MkVtVFBIQ1pWK0t3U1A1NmIxRmIzbXBiSTF4Y1lxd3dveEoyWVdSMnZr?=
 =?utf-8?B?YzJmZm56aktlczJVNmZkOEdINDZheUloUyt6bDFHTWE5ZHdsS0UzWGRmNTJy?=
 =?utf-8?B?ZDl0a1BwWDBQWGhwbHJVZithR3N1NU5MMTlOZWVWZkNNMFVRVG9MV0FKWmQw?=
 =?utf-8?B?MmdUUkFGTysxUEFXU25jcjdIS0tSZm1iZHdJbThvdzBUT1BQMkFCSUJjOWVZ?=
 =?utf-8?B?WWp1TDlsbGJUd3VwR3ZBcm96TTFCOW92VmJyQ3NUVGZDdThFZnU4eGF2cnJK?=
 =?utf-8?B?SGlXeW5Ya2U5bzRwY09RbWRQaWVNTVkyVXJpVUEwS1hOb3NNRTB2MGxQZ2l5?=
 =?utf-8?B?a2IyVTZaMk1UVllhZnRvQnBURUJGYUJRblRsU3JVTlhvM1psaGNPbnVwZitr?=
 =?utf-8?B?T01ISGZ5Ym5lM1BoOVM0ejBGdEl5L0lSL0xydndEL3hPeFN6eWFSVWRpL0c0?=
 =?utf-8?B?bTJaVXBLWXExcjZsYkJmSitwT0pLK3ZCcUdRVFIwdTYyb0k1ZHJ6Vnlsc0R3?=
 =?utf-8?B?dXBHYXZxWStaak9TR1NUdWx0dWVBVUJXeHJ2UUZiUkJLS3pFOGg5aGViVzBH?=
 =?utf-8?B?REpPSWZpaDNEb3paSWt3d2RHM0xyQ1JsR1dsbjNYd1Z1dkorNEkreTUwcXU4?=
 =?utf-8?B?NXFrbFVVRm0xQ1VLbXEwTXdXc3ZjdGNpQTdEc1JsWGI5VkVKWVBEMDJ3SHBK?=
 =?utf-8?B?SEZSZzdBR3pleWo3MzFZcGFkVlJQRUdQSTV1eitsZ3dTbXl2dTNDa3gzMHow?=
 =?utf-8?B?anc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1685771f-2356-4831-5544-08ddea008e1f
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 09:10:26.4896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dNCYvYmiQ6Khsj/bHceJ32FR4z0j8586PDGx2cnRJJGackoe5481ahBOEcxuOY3CGpUCkIIwofd+gnmjKoTyxbZ4v5ssfWBBr+fZh7IJacs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB9475
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

On Mon, Aug 18, 2025 at 10:39:10AM -0700, Matthew Brost wrote:
> On Mon, Aug 18, 2025 at 04:21:54PM +0100, Matthew Auld wrote:
> > Handle the case where the hmm range partially covers a huge page (like
> > 2M), otherwise we can potentially end up doing something nasty like
> > mapping memory which is outside the range, and maybe not even mapped by
> > the mm. Fix is based on the xe userptr code, which in a future patch
> > will directly use gpusvm, so needs alignment here.
> > 
> > v2:
> >   - Add kernel-doc (Matt B)
> >   - s/fls/ilog2/ (Thomas)
> > 
> > Reported-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > ---
> >  drivers/gpu/drm/drm_gpusvm.c | 33 +++++++++++++++++++++++++++++++--
> >  1 file changed, 31 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> > index 661306da6b2d..50a36e7b71e2 100644
> > --- a/drivers/gpu/drm/drm_gpusvm.c
> > +++ b/drivers/gpu/drm/drm_gpusvm.c
> > @@ -708,6 +708,35 @@ drm_gpusvm_range_alloc(struct drm_gpusvm *gpusvm,
> >  	return range;
> >  }
> >  
> > +/**
> > + * drm_gpusvm_hmm_pfn_to_order() - Get the largest CPU mapping order.
> > + * @hmm_pfn: The current hmm_pfn.
> > + * @hmm_pfn_index: Index of the @hmm_pfn within the pfn array.
> > + * @npages: Number of pages within the pfn array i.e the hmm range size.
> > + *
> > + * To allow skipping PFNs with the same flags (like when they belong to
> > + * the same huge PTE) when looping over the pfn array, take a given a hmm_pfn,
> > + * and return the largest order that will fit inside the CPU PTE, but also
> > + * crucially accounting for the original hmm range boundaries.
> > + *
> > + * Return: The largest order that will safely fit within the size of the hmm_pfn
> > + * CPU PTE.
> > + */
> > +static unsigned int drm_gpusvm_hmm_pfn_to_order(unsigned long hmm_pfn,
> > +						unsigned long hmm_pfn_index,
> > +						unsigned long npages)
> > +{
> > +	unsigned long size;
> > +
> > +	size = 1UL << hmm_pfn_to_map_order(hmm_pfn);
> > +	size -= (hmm_pfn & ~HMM_PFN_FLAGS) & (size - 1);
> > +	hmm_pfn_index += size;
> > +	if (hmm_pfn_index > npages)
> > +		size -= (hmm_pfn_index - npages);
> 
> Hmm, okay. On the core MM side, we’ve discussed updating HMM to populate
> PFNs only at order granularity. If that lands, this code could break in
> some odd cases. That argues for leaving HMM as-is for now. For the
> moment, this code works, but we should keep an eye on HMM—or
> future-proof it by populating all potentially absent entries.
>

For reference, this is the patch which mentions possibly only sparsely
populating HMM PFNs in the future:

https://git.kernel.org/pub/scm/linux/kernel/git/akpm/25-new.git/tree/patches/mm-hmm-populate-pfns-from-pmd-swap-entry.patch

Francois
 
> Matt 
> 
> > +
> > +	return ilog2(size);
> > +}
> > +
> >  /**
> >   * drm_gpusvm_check_pages() - Check pages
> >   * @gpusvm: Pointer to the GPU SVM structure
> > @@ -766,7 +795,7 @@ static bool drm_gpusvm_check_pages(struct drm_gpusvm *gpusvm,
> >  			err = -EFAULT;
> >  			goto err_free;
> >  		}
> > -		i += 0x1 << hmm_pfn_to_map_order(pfns[i]);
> > +		i += 0x1 << drm_gpusvm_hmm_pfn_to_order(pfns[i], i, npages);
> >  	}
> >  
> >  err_free:
> > @@ -1342,7 +1371,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
> >  	for (i = 0, j = 0; i < npages; ++j) {
> >  		struct page *page = hmm_pfn_to_page(pfns[i]);
> >  
> > -		order = hmm_pfn_to_map_order(pfns[i]);
> > +		order = drm_gpusvm_hmm_pfn_to_order(pfns[i], i, npages);
> >  		if (is_device_private_page(page) ||
> >  		    is_device_coherent_page(page)) {
> >  			if (zdd != page->zone_device_data && i > 0) {
> > -- 
> > 2.50.1
> > 
