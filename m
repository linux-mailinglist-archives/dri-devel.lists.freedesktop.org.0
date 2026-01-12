Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F3CD1062B
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 03:51:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F222410E251;
	Mon, 12 Jan 2026 02:51:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fuoPGLou";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF6EB10E075;
 Mon, 12 Jan 2026 02:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768186262; x=1799722262;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=x80EyLeBfThpIfTyAyiv/Igps8eksxg19HqDG70OtaE=;
 b=fuoPGLouEuRjVoYUulSMAk6zAssLi4EcePsAxkVf+oqcAPECiH2Q+37X
 g2weu3YbMEYIlCDJYRbgh85ORpjwYxzTuWaWR6gVzA+2h4YG5cR6ErOWB
 d8wxjm/VSHPgpY6iB4wQVz2UFWafnON+cGxZU/GZcY6N3+KToav50my5z
 JEfjVgYa/2XuwBFnzsv+JldpGON96UdyacqmTJklLn7vLVDOFdGhH+Toj
 affqnlEEFg1S3qPEWS67N3VJTbtlLTjlU/MIUhM+DUCTwXJ71/S2vM2So
 qE7nEBNQ2O7Nr7Cb0FTgKqeIT6QhGvgeIOoX9/Z2Z1A4KEkTe8/rV+tKg g==;
X-CSE-ConnectionGUID: LPfE5iuRTmqB3R7JS6Hl3w==
X-CSE-MsgGUID: /u30OdktQ6OQ6iNG14ZNfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="80565511"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="80565511"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2026 18:51:02 -0800
X-CSE-ConnectionGUID: 0B8L6gwhRH6pV0tFQkAYAQ==
X-CSE-MsgGUID: y4h6M136Rf2tDWwaDtBPcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="203777686"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2026 18:51:01 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 11 Jan 2026 18:51:00 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 11 Jan 2026 18:51:00 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.15) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 11 Jan 2026 18:51:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nVgEB9DtMIPYtr1wUFJR92q5D/qEt3EBZ/Ae/VuIL3ZsgdTKFNoZtPNyYg3jUK1n2yB5gDGtFFGBQKe2XtBSGk2Vtpkh2IgSKCftZY068FppWMbBYhm7aKdeI1ujYpXgspL5saN676I/PexDo94E6247BtF8WnQ4cjwspcGciaQHiSJaAFntktjZGz9zxM4dJSg2/wyXfcJdxJmNPjXyHJmkpPYnpQrTiaVdVfIYRcl3ncCbIaXZp/gOBSYnI2Jyy5poqI6bWbe8l0cEITvVuZCApSvDdssy/tST8SQLkcw+dPpEg1SWmMJSuRpSqUXkX3noIE+vLkGXuFT/vthLBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5zLeDDOnZ4un6QyvwesR+UctjSJvTsgKKaDpRQdRQ9g=;
 b=mz1X9avVvxguTvFHI5/rWciZytEmJ3Eyw4gPxjVcoIIxXjyZYzGz8ibOPFQ8nMpla9f7dZefQPIrbh/lMkyNPpx6dhgoIRbmTQjsAZUZibrn5Lj1ERIYrAyEFS6kEh12rsSoA/L3+R+Urp20UlyHL+RCrqlKTkMr6kotWsQ6i3EFtdmyoBjit3eJGicO2Bez3be8K+SrZ2z8hrPLNrqN5qGONLCTIFNGladeVqusgqeyXN58a4xaRLHBD3JgHKPcxQQpv33EDfNFaLa0IA70nBAmquR3V4mi8wdP+Z4QpTu3JcfkEvgLl6CQbOZ4COB8Q3SDpSDyUce9T5HY3AYMgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7210.namprd11.prod.outlook.com (2603:10b6:208:440::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 02:50:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Mon, 12 Jan 2026
 02:50:58 +0000
Date: Sun, 11 Jan 2026 18:50:56 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Balbir Singh <balbirs@nvidia.com>
CC: Francois Dugast <francois.dugast@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, Zi Yan
 <ziy@nvidia.com>, David Hildenbrand <david@kernel.org>, Oscar Salvador
 <osalvador@suse.de>, Andrew Morton <akpm@linux-foundation.org>, "Lorenzo
 Stoakes" <lorenzo.stoakes@oracle.com>, "Liam R . Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko
 <mhocko@suse.com>, Alistair Popple <apopple@nvidia.com>,
 <linux-mm@kvack.org>, <linux-cxl@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/7] mm/zone_device: Add
 free_zone_device_folio_prepare() helper
Message-ID: <aWRhkJFF6OwZii/M@lstrano-desk.jf.intel.com>
References: <20260111205820.830410-1-francois.dugast@intel.com>
 <20260111205820.830410-3-francois.dugast@intel.com>
 <706ba3a6-5be2-46d7-9e7d-d613f2e061cc@nvidia.com>
 <aWRLeoUJAYAWbLD3@lstrano-desk.jf.intel.com>
 <dd60d292-a267-4ccd-842a-36525b707bde@nvidia.com>
 <aWReUk5uDf4hw/Q4@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aWReUk5uDf4hw/Q4@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BY5PR20CA0002.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7210:EE_
X-MS-Office365-Filtering-Correlation-Id: cc983760-99c9-42e4-e724-08de51856a1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cjJRTTVhQnhzVDZPNU5lVWdzdXlYYUF3N1RtZ2xmVHQzZGd2dDFOcEdFSzB0?=
 =?utf-8?B?TXdrN3k2MWxOZWJGZ2Q3QWkxejkxWjZ3elRHMWgxV1ZIYjlVQ3NXSGZMVVJR?=
 =?utf-8?B?NTNzKzlRYURnM05sU21lMkFsZDlVYlZtMkdKZ3h3RE53S05EZWx4NUozOUM1?=
 =?utf-8?B?cFdHaXltQzlPUStoamZYSFU5c2NiUndmTk1tUGVKSmVwWmlINS9qaHlZMGlW?=
 =?utf-8?B?S3c0NUpyaCszbXRvbHkyZjBrVG1jQ3IrTWlIOU1qcC9kYWtpMmJqeC9HaXBK?=
 =?utf-8?B?MlZ2YXgxL1J3U0RhU25UajB2MUJLYnFtQVl6ZVI2UTVYOERQdWVNeTlPL20w?=
 =?utf-8?B?a2NONFFqZ3hkZW1HWlpia2h2YTFBbzU1TjNrRWwvajNHV1BPNmVSRnRHTStl?=
 =?utf-8?B?RU91anM3NmVMTGRLdmF1dG1yekIvSDBNck0yaVZLRE90RkwvVUtvSFFPRXZJ?=
 =?utf-8?B?Yk1QRTVVdVlmR3BXNFJqTFQ5Znl1KzB0RzlEc1cySzZQeUNzRFFmcTFPTzNQ?=
 =?utf-8?B?WnNwWThMenhQcmFzZXhVWEFBZi9zdFdmM2NFT3pUKy9OUVhoaEVaaDYvY0xk?=
 =?utf-8?B?QlRkN3RORTZXOE41bE5rc1B6eGdQV3dRamxUckhXMkk4bUJXSnNxT1dvT1Jn?=
 =?utf-8?B?VTJ1WVo5RnNiLzhpaU0wZXZjRWVxek5xMkNIMnNPcDhQanRPNklCc2NObUNu?=
 =?utf-8?B?ZnkwT01ObDRLcmVpSTd0M1BxL3F1WVBMRkEzb2FNc2dRT2tqcTJyNURYSGRQ?=
 =?utf-8?B?bStnOFcwUkxTU0xPNjdkWHhnd0RLNFNEbFZEVHNJRzkySWx0VU1xdGFRekdQ?=
 =?utf-8?B?NWNCWHdZL3gvT1h3YVk5SFpwZ3dNVEorNENwTmxPekFTU1NEajFRT2ZzaTNj?=
 =?utf-8?B?N2FMOFJtdmZsR3ZML2JsVGRzUHk3VDUzVStIbTF4YXBvaERRRm8wOEtTTWVT?=
 =?utf-8?B?cE1GNjZ1VThPaDNzR2M2S1VyVmlaSWZtSGtDR2RsajNKbUZZaEFtSTBHR2lP?=
 =?utf-8?B?VjcrVU5kNDNTLzF6eUVmMTVBMkNudG5EZTBhSzd3dmhGTjdickhmZ1IzWmZt?=
 =?utf-8?B?S0dIMWxVdG1DUi9TbVNucENQU0llTGxlM2pCT2pFd2RpNjlqcUl4QjFIOUlo?=
 =?utf-8?B?Z1FvdnZGV2N0V2IzRFZSTSt6YTBLaytzWTNoa0xpZzV2QW81aDVIaG1kbjNm?=
 =?utf-8?B?Y3piSkJGWWZmcHJ6d2ZoU0NCcXNieFpxUXBWTTJFV2lPcmhTbURFN2dsKytE?=
 =?utf-8?B?dURSYXJvSGd3NG9pbkR5NWV4bDc0UnZuY3VqY2xSU0tYbVlyRFNPTTZ6amFp?=
 =?utf-8?B?NEs5VVNGbXUxTFhCSkJFYXkwd2xGN2lXNVRTREZYZkI5NXNtbTA4YmY1Mk9q?=
 =?utf-8?B?UUp6WHdGdmNGWUVPd3NXV09XNUJTMldaTkt0YUZRSWVPZENTUmxkV2pYT281?=
 =?utf-8?B?QVlRUFI3N3l1SVFqcUI3MHhaeFVIQ1pQcnI3dTVsQkN4UmgzemNJZ3BjTDdl?=
 =?utf-8?B?M3kvODZvL2JsbG9sYzFDWUpRaUxvN0FGcUE3V2wxRXBodVlpZkRFcTJsd3c2?=
 =?utf-8?B?eEwwclFjRjQrTGRMY20yWVU0NURDS2FoOE5Cc2tBQm91UVNHR1ZRT29Rendp?=
 =?utf-8?B?d2daMktmQVdvd1lqMEdGNnFxcXpsSUluck5CSWdtSEhaQXFFbkNJZEx4TDFv?=
 =?utf-8?B?cGUyaE9wTWw2V3RxNG1Xd0dSMTBidGxzL1RmSWoxWkJEZXV4ZnlpTmJqemZG?=
 =?utf-8?B?S2lVdmNlenppZXFTU2dJVjF0YzlFYW1CdmVKbDVxK3VZaXBqampsQ2NVclFJ?=
 =?utf-8?B?NDhjNVBBUUdha29adDExaFNBZTJIdkFsM2hGKzVzaEdWa01mTGk1YWIyR0hT?=
 =?utf-8?B?LzYvVWx1V0RTL1U5Qk5EVk9NUkp0RFBmaDhBYkJNOEdDOHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3g3bGloY3BNUTdidWpyNWsvaExnM0tiTFBuQlA2RnlwVkliZEljcXcyeXlK?=
 =?utf-8?B?eGxsNjlEeDNCNE43WmhkaHBJSXhwQW5oVCtBaHlVN3BrVVU3cHJyT0xGRGtF?=
 =?utf-8?B?NVhObm1JaFFSTGg1RXVlK1JPSjNOeVRBN3RkeUh2YVNxSXRiaVRnbCs4Qnpo?=
 =?utf-8?B?UXJGTmFxMWp5bEhlREpFblQ4bmRYekpOcnFXSEoyUlRzS2NTUEUrRkxOL1Ji?=
 =?utf-8?B?bGQ1dVM2d0J0S1VYOWRtcjMyWkZ3WTZGbGxpU2NkU3pxUStVZlg4WkNtQ3M2?=
 =?utf-8?B?Wlg1L0ovWm9WRkR6a0pheGkyUlBYb01DQ0RheVFVTlhsU2lXUVVJb3ZscTVt?=
 =?utf-8?B?dzdiVkFPcjVWT3c0Ym5sS25SU05PcWZsV3BNeWJweEgzbFk5OGVzc0VaNHVv?=
 =?utf-8?B?U3VWSXNuK2N1N3FCQ1dSTW94Y3UvYWhsVFdoL0NkVm9uOHA1NERJWDM1enlX?=
 =?utf-8?B?bEl5MlY5Y0VFVW5zTzhuVmh3bzRweERiQVMxL0RSNWJsdysrSkVhTUZESTRS?=
 =?utf-8?B?YWdTOUdpY3IwU1pGTXN1bHBEaVJaUWgvVE8wOWNXcjZBVmpoc29RUHBvd2NE?=
 =?utf-8?B?SnJlcnRtdDZwZEdjak53aFk0ZWpVS0FkcVRCZzdqOG1Nb2FFQnFNQTFkK0s4?=
 =?utf-8?B?aUVVYUZjN0lwUEd1UjRBR1d1aHZRQzlrVFdPUHYydy9qcXgwdlYxQnBIMVZk?=
 =?utf-8?B?TzBVUHpyV0RGY09DZUlzc1pTdVFnR01tc2pVeWhhMGhYMEpaRWZKUDdPSHVl?=
 =?utf-8?B?eTh0VWI0ZUdDbzRsSFUrQ3JBREFtRHA3cEsxcDE3bFZPdkswYmg1citxWnA3?=
 =?utf-8?B?cjNxRnFRQ0h5Vmk5V3VVNXdJUzZ3MGFTcGdFYWZocW5jU3NndkxrNXRXYzFl?=
 =?utf-8?B?WWZGaENMdHhYS0FjVWJMN1I3VzA1OUFRVHF6NWxqTnRvb2hKSFFXRjlGK2k2?=
 =?utf-8?B?M1cvZisvcjdvQ0RyMGgxajR3SThLaUhiWS8rM2ZQc1RlT2M2aXlOUVFYaUEw?=
 =?utf-8?B?aEdvRFc0VFk3QlEzc0JObXNYRU4raFhmRGZTdHh3MFZnTWt5R0RaMmFSTWNT?=
 =?utf-8?B?YTdVbFNtUWlYRjFEcVBta1psaVJXTVJtbFFmalpaOEtJWU9zclBRQm51OERL?=
 =?utf-8?B?bnFZU2UrSldzL2M1N1pNdy9rbDhOM0FmU2lSZjZMYmtMZ041Szh6YjdwNGhW?=
 =?utf-8?B?c2NzMk10TjB6RjVSUTlpOXFsZHNaOFV3UEZQeFl1Q1B2ZFBwZ2l0WmJtSnJv?=
 =?utf-8?B?RjFpVmU4UmdLN2Y5Y1psSkh2bEZUc3c5S2xRMXhWQzFPTjJmRi92N1NOZHln?=
 =?utf-8?B?bE1pNllxbTVQWFQybm1xTkgxbmorSTJ3V2h3TGl5MEVNMDhSU3EvdjVoRGtZ?=
 =?utf-8?B?Q3hPTWtWZC9DN1o5WXFuUUNEZTRIa1Nsa25CNHZzL1JQNitYMDhDWEhpQ0lm?=
 =?utf-8?B?UUs1TzNudXR4WGRTYUd6QytldXc3bFJ1VEJCMDBmcU1qQkxyTlFiRDZDNGpE?=
 =?utf-8?B?UjZ6Q1UxV3pXcG5MVDBKRytsL2EvMHpVS203NmtIbHd6NFJGTnd3WTk1VmdC?=
 =?utf-8?B?ZmE1QWc2ZXBvSUM4ZzZUa0RwNzlDZG5pc1RGZVVvVWEvelRmS3lTTnNicjFF?=
 =?utf-8?B?QjNicHN0OUZGZTAxN2RuRGU1Y0FnQnFBZFBxYktCSm1sWTA4UThjdUMreHBC?=
 =?utf-8?B?YlZFaC9TbHFaOHNKdWo5WDdhSDVtRVFrNGRBQUsrNm9NOTlFWkVlVS8rZ1NR?=
 =?utf-8?B?SnMzRmlJZFBlbVUrL3psSE1GNlJGZ3NnNjlNRHh3UjA1akN1aHNOREM0a3Q0?=
 =?utf-8?B?ZlVkeTBTNkJYTkVBNTdZaWRjMCtzYXBkWXZwUmVjZXE5Qi9Bc3VmR0NUK1M0?=
 =?utf-8?B?NjJDQ2FKZm5sTWFUUnBuWkVqMUxDNzZCRUtoOHJmL3UyTkFJTTduQmc5VW1q?=
 =?utf-8?B?OExJTSs5V1hVODZQWkZYb3dxK3Y1RkJ6REsxbWIxaHNqS3B5NTZvUXNteTZr?=
 =?utf-8?B?TUg5RUZZTDRHSGNNVnRSRUlEZTlBSnVyRVhNZHhhSnUxWVU4bzZ0K29aWkV3?=
 =?utf-8?B?Q05hSVQxWkRqbGtEZlJ3N1VtQWFpbklRWlUreFN3Ky95czJrK0lsSVhFUE1F?=
 =?utf-8?B?aTljb2NCU0EwQmgxMGNPRHNsa1FiZk9seHY4R2lMMmFRSC9Tbldrblc4Zjlh?=
 =?utf-8?B?SVdzRHJIMXA3YTVPZmVBZ2UxSU5rNW5uOFZSRWltVXVnWUtBd2xYTDZ1UFJ6?=
 =?utf-8?B?eG5odEozNzk5R293ZzN2VTFjTFBwRFFHSWVjU0hNN0JrT3Z1N3J3TldCZjZW?=
 =?utf-8?B?c01YdktKUUpObmp5OHp6UjVKM2pCSThHZ2lMeitOUVVaQ2dBOTFjclAzRVl6?=
 =?utf-8?Q?A/LWgz6YojvNiYcg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc983760-99c9-42e4-e724-08de51856a1b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 02:50:58.7024 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o2dBToPybOXRZj3cu7wrvnABaOE/lZnBODXisSrof0cM7w3TX5WNTyejTWCVVQE35v0cNByTsiCtWH6Bc4r1fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7210
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

On Sun, Jan 11, 2026 at 06:37:06PM -0800, Matthew Brost wrote:
> On Mon, Jan 12, 2026 at 01:15:12PM +1100, Balbir Singh wrote:
> > On 1/12/26 11:16, Matthew Brost wrote:
> > > On Mon, Jan 12, 2026 at 11:44:15AM +1100, Balbir Singh wrote:
> > >> On 1/12/26 06:55, Francois Dugast wrote:
> > >>> From: Matthew Brost <matthew.brost@intel.com>
> > >>>
> > >>> Add free_zone_device_folio_prepare(), a helper that restores large
> > >>> ZONE_DEVICE folios to a sane, initial state before freeing them.
> > >>>
> > >>> Compound ZONE_DEVICE folios overwrite per-page state (e.g. pgmap and
> > >>> compound metadata). Before returning such pages to the device pgmap
> > >>> allocator, each constituent page must be reset to a standalone
> > >>> ZONE_DEVICE folio with a valid pgmap and no compound state.
> > >>>
> > >>> Use this helper prior to folio_free() for device-private and
> > >>> device-coherent folios to ensure consistent device page state for
> > >>> subsequent allocations.
> > >>>
> > >>> Fixes: d245f9b4ab80 ("mm/zone_device: support large zone device private folios")
> > >>> Cc: Zi Yan <ziy@nvidia.com>
> > >>> Cc: David Hildenbrand <david@kernel.org>
> > >>> Cc: Oscar Salvador <osalvador@suse.de>
> > >>> Cc: Andrew Morton <akpm@linux-foundation.org>
> > >>> Cc: Balbir Singh <balbirs@nvidia.com>
> > >>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > >>> Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
> > >>> Cc: Vlastimil Babka <vbabka@suse.cz>
> > >>> Cc: Mike Rapoport <rppt@kernel.org>
> > >>> Cc: Suren Baghdasaryan <surenb@google.com>
> > >>> Cc: Michal Hocko <mhocko@suse.com>
> > >>> Cc: Alistair Popple <apopple@nvidia.com>
> > >>> Cc: linux-mm@kvack.org
> > >>> Cc: linux-cxl@vger.kernel.org
> > >>> Cc: linux-kernel@vger.kernel.org
> > >>> Suggested-by: Alistair Popple <apopple@nvidia.com>
> > >>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > >>> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > >>> ---
> > >>>  include/linux/memremap.h |  1 +
> > >>>  mm/memremap.c            | 55 ++++++++++++++++++++++++++++++++++++++++
> > >>>  2 files changed, 56 insertions(+)
> > >>>
> > >>> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> > >>> index 97fcffeb1c1e..88e1d4707296 100644
> > >>> --- a/include/linux/memremap.h
> > >>> +++ b/include/linux/memremap.h
> > >>> @@ -230,6 +230,7 @@ static inline bool is_fsdax_page(const struct page *page)
> > >>>  
> > >>>  #ifdef CONFIG_ZONE_DEVICE
> > >>>  void zone_device_page_init(struct page *page, unsigned int order);
> > >>> +void free_zone_device_folio_prepare(struct folio *folio);
> > >>>  void *memremap_pages(struct dev_pagemap *pgmap, int nid);
> > >>>  void memunmap_pages(struct dev_pagemap *pgmap);
> > >>>  void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
> > >>> diff --git a/mm/memremap.c b/mm/memremap.c
> > >>> index 39dc4bd190d0..375a61e18858 100644
> > >>> --- a/mm/memremap.c
> > >>> +++ b/mm/memremap.c
> > >>> @@ -413,6 +413,60 @@ struct dev_pagemap *get_dev_pagemap(unsigned long pfn)
> > >>>  }
> > >>>  EXPORT_SYMBOL_GPL(get_dev_pagemap);
> > >>>  
> > >>> +/**
> > >>> + * free_zone_device_folio_prepare() - Prepare a ZONE_DEVICE folio for freeing.
> > >>> + * @folio: ZONE_DEVICE folio to prepare for release.
> > >>> + *
> > >>> + * ZONE_DEVICE pages/folios (e.g., device-private memory or fsdax-backed pages)
> > >>> + * can be compound. When freeing a compound ZONE_DEVICE folio, the tail pages
> > >>> + * must be restored to a sane ZONE_DEVICE state before they are released.
> > >>> + *
> > >>> + * This helper:
> > >>> + *   - Clears @folio->mapping and, for compound folios, clears each page's
> > >>> + *     compound-head state (ClearPageHead()/clear_compound_head()).
> > >>> + *   - Resets the compound order metadata (folio_reset_order()) and then
> > >>> + *     initializes each constituent page as a standalone ZONE_DEVICE folio:
> > >>> + *       * clears ->mapping
> > >>> + *       * restores ->pgmap (prep_compound_page() overwrites it)
> > >>> + *       * clears ->share (only relevant for fsdax; unused for device-private)
> > >>> + *
> > >>> + * If @folio is order-0, only the mapping is cleared and no further work is
> > >>> + * required.
> > >>> + */
> > >>> +void free_zone_device_folio_prepare(struct folio *folio)
> > >>> +{
> > >>> +	struct dev_pagemap *pgmap = page_pgmap(&folio->page);
> > >>> +	int order, i;
> > >>> +
> > >>> +	VM_WARN_ON_FOLIO(!folio_is_zone_device(folio), folio);
> > >>> +
> > >>> +	folio->mapping = NULL;
> > >>> +	order = folio_order(folio);
> > >>> +	if (!order)
> > >>> +		return;
> > >>> +
> > >>> +	folio_reset_order(folio);
> > >>> +
> > >>> +	for (i = 0; i < (1UL << order); i++) {
> > >>> +		struct page *page = folio_page(folio, i);
> > >>> +		struct folio *new_folio = (struct folio *)page;
> > >>> +
> > >>> +		ClearPageHead(page);
> > >>> +		clear_compound_head(page);
> > >>> +
> > >>> +		new_folio->mapping = NULL;
> > >>> +		/*
> > >>> +		 * Reset pgmap which was over-written by
> > >>> +		 * prep_compound_page().
> > >>> +		 */
> > >>> +		new_folio->pgmap = pgmap;
> > >>> +		new_folio->share = 0;	/* fsdax only, unused for device private */
> > >>> +		VM_WARN_ON_FOLIO(folio_ref_count(new_folio), new_folio);
> > >>> +		VM_WARN_ON_FOLIO(!folio_is_zone_device(new_folio), new_folio);
> > >>
> > >> Does calling the free_folio() callback on new_folio solve the issue you are facing, or is
> > >> that PMD_ORDER more frees than we'd like?
> > >>
> > > 
> > > No, calling free_folio() more often doesn’t solve anything—in fact, that
> > > would make my implementation explode. I explained this in detail here [1]
> > > to Zi.
> > > 
> > > To recap [1], my memory allocator has no visibility into individual
> > > pages or folios; it is DRM Buddy layered on top of TTM BO. This design
> > > allows VRAM to be allocated or evicted for both traditional GPU
> > > allocations (GEMs) and SVM allocations.
> > > 
> > 
> > I assume it is still backed by pages that are ref counted? I suspect you'd
> 
> Yes.
> 

Let me clarify this a bit. We don’t track individual pages in our
refcounting; instead, we maintain a reference count for the original
allocation (i.e., there are no partial frees of the original
allocation). This refcounting is handled in GPU SVM (DRM common), and
when the allocation’s refcount reaches zero, GPU SVM calls into the
driver to indicate that the memory can be released. In Xe, the backing
memory is a TTM BO (think of this as an eviction hook), which is layered
on top of DRM Buddy (which actually controls VRAM allocation and can
determine device pages from this layer).

I suspect AMD, when using GPU SVM (they have indicated this is the
plan), will also use TTM BO here. Nova, assuming they eventually adopt
SVM and use GPU SVM, will likely implement something very similar to TTM
in Rust, but with DRM Buddy also controlling the actual allocation (they
have already written bindings for DRM buddy).

Matt

> > need to convert one reference count to PMD_ORDER reference counts to make
> > this change work, or are the references not at page granularity? 
> > 
> > I followed the code through drm_zdd_pagemap_put() and zdd->refcount seemed
> > like a per folio refcount
> > 
> 
> The refcount is incremented by 1 for each call to
> folio_set_zone_device_data. If we have a 2MB device folio backing a
> 2MB allocation, the refcount is 1. If we have 512 4KB device pages
> backing a 2MB allocation, the refcount is 512. The refcount matches the
> number of folio_free calls we expect to receive for the size of the
> backing allocation. Right now, in Xe, we allocate either 4k, 64k or 2M
> but thia all configurable via a table driver side (Xe) in GPU SVM (drm
> common layer).
> 
> Matt
> 
> > > Now, to recap the actual issue: if device folios are not split upon free
> > > and are later reallocated with a different order in
> > > zone_device_page_init, the implementation breaks. This problem is not
> > > specific to Xe—Nouveau happens to always allocate at the same order, so
> > > it works by coincidence. Reallocating at a different order is valid
> > > behavior and must be supported.
> > > 
> > 
> > Agreed
> > 
> > > Matt
> > > 
> > > [1] https://patchwork.freedesktop.org/patch/697710/?series=159119&rev=3#comment_1282413
> > > 
> > >>> +	}
> > >>> +}
> > >>> +EXPORT_SYMBOL_GPL(free_zone_device_folio_prepare);
> > >>> +
> > >>>  void free_zone_device_folio(struct folio *folio)
> > >>>  {
> > >>>  	struct dev_pagemap *pgmap = folio->pgmap;
> > >>> @@ -454,6 +508,7 @@ void free_zone_device_folio(struct folio *folio)
> > >>>  	case MEMORY_DEVICE_COHERENT:
> > >>>  		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->folio_free))
> > >>>  			break;
> > >>> +		free_zone_device_folio_prepare(folio);
> > >>>  		pgmap->ops->folio_free(folio, order);
> > >>>  		percpu_ref_put_many(&folio->pgmap->ref, nr);
> > >>>  		break;
> > >>
> > >> Balbir
> > 
