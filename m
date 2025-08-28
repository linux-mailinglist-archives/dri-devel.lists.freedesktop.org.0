Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C239B3AE4B
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 01:14:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3E2110EAFC;
	Thu, 28 Aug 2025 23:14:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UClJR555";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80E3E10EAFC
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 23:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756422886; x=1787958886;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3UpUKAtKTzwHuvPO6qNFR0a0p15PZJxko/BSs6AGnnE=;
 b=UClJR555j46ORkChFaUdgPcVwzX2cgnh/LF5DN/zB5UWdPmGjgiewTL1
 BpOzL8ZvmHaURDuPRsKtQ0odLaFz9Gnnv7BwxZVF9R1fZq2ZO1mR5VydY
 GnUczxhx36gFe8s+rj8KjKMaaBlJ39AXSCVCSLwAgwPGXj5nUcuMqLI8y
 PtO/U7tXkbHQokq3dMJAdKdZj7XtOw4WWUe99mus7mFAjVMwaio8iRmdt
 g15GLShZSjbKstQalG3ZSDdRhtbLX63/17cRPbrz6X/OrPhBgid5T+K/e
 b4II1125ahXpkD6jFyQXaRka1krdyuLuNabl3ngbl7byywW7yHvHsNcdM A==;
X-CSE-ConnectionGUID: PQHtOQiyRFWC7Ynp6rXR6w==
X-CSE-MsgGUID: 7P+NKhFzSCqgXnIjGxYIWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="81299127"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="81299127"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 16:14:46 -0700
X-CSE-ConnectionGUID: rn37v4APR6yNJHhK17KpJA==
X-CSE-MsgGUID: 54LcGYBRSPaiJUk77xcgJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="193900500"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 16:14:44 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 16:14:43 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 16:14:43 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.84)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 16:14:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JauiEn+WtaJPd4ZcwiquQ1dpnGzaMTEMhI95yV7HtozwZBt5PDNZAUeh6DbIeG+o4IBN8QX4+QIAIpotQt2oprWCAabG4E6YXfE4ruz9B5gTrbAomaFs2YBl2g05WsqUYVFVHyTgnQw83nboax3FQCuK1/tUOlag0uE1bz3qCj+pe9uDfSiZaeNmlZNaIEnmUayrdLvdA+JvN07Qnlm01tBWyI4+2lcHtuj1VEbBfQKOl6RmqhSKwYN9TZ5e3ySONuZzWZAxlA05LGNeGnlE00mk5VW7+EALYWx3AQ3j5QrpbzVeQ12SWNojm4UEtGclBx8g2dFYUBvXF/BEhllyGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=365INYs4xbrxJuQJhzFRIXsYuSjC9JXjiapa/a8z6Ts=;
 b=asX9EYBKKClHdftHYpLfOhzpWtQghSdEz9eO8rMHclFMUTuub52562nZvLvud3SIwp5QFRIYNbdLRL56aey8tgIUWw4j98rimSAwb5nliJuuv6vQiobYQvTYzcMC7M9NnGUDFh+orou62YoyAuUGNvBE/wx5M5BJcIKYcRv1w3nuHvUle+JVOyzAtkLEHyvr1a2Nha4EceD37T12+zv2Ki3QTYStYkrNQO3A0vV+K1nliQlGMztNiqjJpIxI0Sh4TjWyEAByX/mR8U0c40uNP0DIalfnyjHMmOYkrPI5gApfL/M1LI+7XvdTJ5as4xx+CGADEvTzzD030Ttuv82ihQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SJ5PPF4990C6B9D.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::826) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.18; Thu, 28 Aug
 2025 23:14:36 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9052.019; Thu, 28 Aug 2025
 23:14:36 +0000
Date: Thu, 28 Aug 2025 16:14:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Balbir Singh <balbirs@nvidia.com>
CC: Mika =?iso-8859-1?Q?Penttil=E4?= <mpenttil@redhat.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>, Joshua Hahn
 <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park
 <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, "Oscar
 Salvador" <osalvador@suse.de>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>, Ryan Roberts
 <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song
 <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>, Danilo Krummrich
 <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>, Francois Dugast
 <francois.dugast@intel.com>
Subject: Re: [v3 03/11] mm/migrate_device: THP migration of zone device pages
Message-ID: <aLDi16JRf2VRWVI+@lstrano-desk.jf.intel.com>
References: <20250812024036.690064-1-balbirs@nvidia.com>
 <20250812024036.690064-4-balbirs@nvidia.com>
 <81ca37d5-b1ff-46de-8dcc-b222af350c77@redhat.com>
 <9207451b-ebd1-46d5-b277-2adf3028f361@nvidia.com>
 <23a3e9b9-ad35-4469-884d-279aac0868de@redhat.com>
 <a8732499-161b-47f3-a936-580a43c6f323@nvidia.com>
 <aJ55c8yrcAN6upp9@lstrano-desk.jf.intel.com>
 <e43b3eff-6d9e-4e6e-a0a2-9537e669aa82@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e43b3eff-6d9e-4e6e-a0a2-9537e669aa82@nvidia.com>
X-ClientProxiedBy: SJ0PR03CA0149.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::34) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SJ5PPF4990C6B9D:EE_
X-MS-Office365-Filtering-Correlation-Id: 322db1c0-a582-4d43-9462-08dde688a7f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VytSZlJZdWQ0THJ0VEM3K3F0UmhDenp6R0xDQjVBYWIvQklZL1ZpcTUzRC9B?=
 =?utf-8?B?WXY0UUg0Qmc4QlZzVys4OWU1Z05Ja3lkbngyTDdTcUc2amhMVStvWVJMbUVD?=
 =?utf-8?B?RXNrVU9KekJ4MGVvOW5oSkZjQTJDYWF0SnpzbEhkNHZpVVVleG5RWDRJRGoz?=
 =?utf-8?B?akhqdGlTL1doQ3pReEp3U2RRMXRYZkNiZURacHdEMysxRHFnb1VNSE9mSEww?=
 =?utf-8?B?T2prTDZVVWQyM1JtbzRyajZod0pObkRyQnY1NXNXYUpaTkN0S0l3c2RVK3da?=
 =?utf-8?B?UjhMRkFOUTdXYW10clF2SzhaYTZyOUFwNjFCSzg2dUVIdG5sR1RyWVliL093?=
 =?utf-8?B?SXBmeWFpT2NWdXVYQnlQZTBZbXF0Qm0wMHRBYXVXRDJXclNPZ0RkV3RPb3pM?=
 =?utf-8?B?Rmo2WmxmbnZtWnVJNnVieUVRZ091d212NngxRm9RdEhnZU11cUVuQ2NZMFc1?=
 =?utf-8?B?OUlvQkRiTDJTOW5rbzR3SEpoRE9QNkpUdENGbWZCVTNJS0tZeUlaNjY1M0xp?=
 =?utf-8?B?c3ZGSDNGbW90L04vSkx6TFJ4YUFhenhTTzNhQ1VKSjhnSFRaSW1XdkxsOFRH?=
 =?utf-8?B?d0xDQlpGeEg0WFpnN0ZxRlJqRTVLRzJxek56UEY0dktGZmczN1R1SzNOR3Ri?=
 =?utf-8?B?QVNPVVgxVzhNSHNmN2FEWVBPT0FzUEI4cU40ejhTcloycTJQdkh5UDc4WVpU?=
 =?utf-8?B?WStqdFh1bnRVZVBOMW5ndnBlZXhlanh4Q2tDQXIzQzZjUlZuV1ZjVTB4TVgr?=
 =?utf-8?B?dTJJZU8yNHZJbWx2UWJoaG51WXdBbGNYODNGUUovRVJ0SFlGQTdyb0FLWU84?=
 =?utf-8?B?UmczU3BnNjk0VS9KZ1pSWW1VRVFXMkF4SDVyK2dwR0ZpbVRReWJSVTlBUXdm?=
 =?utf-8?B?Z3NQV1o4aHJST3hHTGw1VEJsb0lJdWJVQnA4Y29teThCWkpnQktGL1VSc2p4?=
 =?utf-8?B?YVd2Yjh3TlBGQ05wdVFTQmNmZUxOQzFXVnJSZmVXYVVvVmh2dnprM3Qyc2l5?=
 =?utf-8?B?U0RnV2Z6d3RBcXozN1dWVGJJMGdITWVLL3Jna3hkOWhncGtzaTZPTG9LNkVD?=
 =?utf-8?B?QktzZjQwRFZscmhEVVQxdjZxcTE2T01rdXA1aUpCYVBnU0RYb3pEWENnRXlJ?=
 =?utf-8?B?SEN4VTVxY0pzcnAxTnJyVDVMYi9PZno3cldsbDFub2pwd2JsTzUwNGVMUVZt?=
 =?utf-8?B?bzVNVlpKcjV3Sy80WVFDQjhBWjVjOXoyTG5FTUV2TGZpZ29KaDc4eXJ1SVZs?=
 =?utf-8?B?NjNwUDNBdVB6d1pwV1AvU0JWWkJQaDZueU92T004UUxxWUtBVjNqVkNKZDJB?=
 =?utf-8?B?NkZONVQyWGQ1ektvM0psamd2RFRzNjZlYWhMcWZlVlpCU1JYdGFGQ0JLVzQ0?=
 =?utf-8?B?ejNtbjAzU0xZSVIyc3ZnME40NXo1ZjVNK2prZmVNY1VtbzAyeFdFVGZkSUZL?=
 =?utf-8?B?VU9RYlNOWU51U0RBZnJhYkRNeTJ5aXh6Q2RRZVBsWmJhR1I5SXhuL0pkQVFw?=
 =?utf-8?B?dVlKSE5MaHo5YmQ2L2g5MmptclJPekZKeFVGdlB3TkZaa3NOREY2dHNNV0pN?=
 =?utf-8?B?L1UweTNVOUYxVnpCZDZuT2IvOUZLc1dwZzJicDlCMzhKZWR3RE9vRUpsVVBN?=
 =?utf-8?B?MVlsOVlqMm9ROE83ZWk2VDNXdm4wVE53NWUrekFaMHhSY3VZeWYzZDZkZEF6?=
 =?utf-8?B?Q1hDbTZRdnA4eDRyTGZBb0QwWHptanpQY2VoUktXM01PQTNVQTB1emU1Z05n?=
 =?utf-8?B?QzJpSldJc2E1UGpvVjFSVXZhenl0RkR0aGVjaFJCblBQK1RZdjhwUDNnREZi?=
 =?utf-8?B?bWtXVU5RT1hpbXhCQXRQMlpYUWRyWWtpRGtISlVJMEg5R2QrT2o2dVhLb0M4?=
 =?utf-8?B?eTJGSVdSU2h6dDJ4Y3lwRW5tNmtQSGxjRmdsYkd5Y3BGSGt4RVkyNlNUR1pz?=
 =?utf-8?Q?NryLpqAm1yo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnhDUE9PY2RuNVBVbEZveTJnL3lnbkJkcWZKa2hLVXNZNERjSXlFUXREclN0?=
 =?utf-8?B?K2d2aDEzVS82Y2cyMGh4VXdkdWh5c05IMnJhRjVZdkNyZnowMVRUY0ZvcDBi?=
 =?utf-8?B?SDBkL2lZUjREUGFhcmp2aVpLVUxEc2lvNmlSZHlZSHZUbXBsbWtpVWtJeExF?=
 =?utf-8?B?OWErVnBHbmNlRmVRRU5iZ202MW1MODZJQUVyMUkrcFBIcUVpa2NIdVhqSWRP?=
 =?utf-8?B?N0RGTzJzaCtQMDVPMWR6NFJUc3FGNVI5NE5vMCs2WWU3YnBnZmpqRmFOREI1?=
 =?utf-8?B?Z0xUSVFJbTR3Uk1jbVlkTnEybTdvV3hZWDdOQnFjem9DTmwwOE04dm1UdHJG?=
 =?utf-8?B?dzllRjAwNDRFdVZzMnJ3ajVTSE5haS9JTVYrRG1xd2VSOFdJWVUzQ3V0MVo3?=
 =?utf-8?B?bitwKzhQOUxZRngxTEUyc2dKR1grd3N0UXpXMEhpV1NDMDlWRTVDRUZPN3Fw?=
 =?utf-8?B?UUN3Ym4wYzV2ckR5cENSSzhIQmpqQ1dHQnl0aE82cEY5NnRKUjdqdjZPcExK?=
 =?utf-8?B?SFZQdzNtYlUrZTJoL3Q2aytxd0wrcjRRMEVjWXg3VTM4TUpVZnpOMEJMWEx4?=
 =?utf-8?B?VWtCRklWaitnN2I4dXVMdlJ5ZXBGaHpMSnFENE1KRmVaZ2NRTklBSU4rR0tI?=
 =?utf-8?B?ZzgzVi83a1I0T3h6WlQreVBIbU1OSUJFS2tkTktXZUc4SkdoblUzaUJsWGVO?=
 =?utf-8?B?dzlnTWlPdlVNeGx1aDZ4Qmcxd3pkeGYrMy9QbHJYZVBwVURGMDJ6SkxjRXp5?=
 =?utf-8?B?N1h3aDVtL01wR0NxWmhzRzVUalM3U1dteitmOEo4ZStrMGlZRWVla1pKanpJ?=
 =?utf-8?B?KzlRQlZRN2FGbjZ1WkFzb2ROd1NjUEYyWGRUL0tDTytpSWp2OXlzd1hMelA3?=
 =?utf-8?B?UGM2UFZBZms1L3ZmVkNXa1ljZjBPUEt6M3MzWEpNWCt0WVBqT1BkZ0pBc0Vx?=
 =?utf-8?B?V1VJMmI4MFpzbUNSQjBxamlYZW82b3BMY0RvaG52bmRYZ3RVdUxweVpUNkNz?=
 =?utf-8?B?Y2Nzb3Z0YmZ5RU5XbGMzakJHLytzM2lLMjFZRWZmUUk0aGRtV2xBeHNCRjNK?=
 =?utf-8?B?bFI3OGQzeWRVelkxZUt6ZWNWbHZLS0JRWEU5cnlBWCt2cElRTWh1bnpzeDEv?=
 =?utf-8?B?WisrUWhKSmlRRVorMjVvWllyZ0xpOXBqdDhCMVdseWhGeEdPR3E1MlE2MlVi?=
 =?utf-8?B?cnFWa1QxbWIrQ3hLOVN6cEtBQkZGS1R4b3h6TFM5b1hwRk05TWJqVWxocko3?=
 =?utf-8?B?YUxRT0c2cXVQOFhyMEliVmJ5Y0VkdEJvZGRBWXlHZXA4N1VsQjlYcEtTRmtR?=
 =?utf-8?B?RVdqK3VGVHhmd1VyQy9zRlJqVU11bXlSNVVQM00xS3VycGhITVdjaENuT05S?=
 =?utf-8?B?NW9CRGl5NjZTZWtta3AvZytCblFFUkw1cGxhcjhyZUhjdWQySmR3RG9qMkhF?=
 =?utf-8?B?a2wwa1lFRnB5Nlg3Mjdwcm04UTErUk93c1diNzl3MHd4eTE2bCt2ZnQ0aEhn?=
 =?utf-8?B?MEVBekVONjMrQXJNZUtuMkF1dWdMcW9BMnhzRnBmVzFEbE5YRGF4dGZqR3or?=
 =?utf-8?B?WUVRTUx5eUxHNnE1ZXB6MHNWSEkySEtSbHkrOVh0emVFWnI1TXE0NDgxcWo4?=
 =?utf-8?B?cVdyZFpZMDF2NDFjYmNiOHIvZ3Zvcmkyc0kyTTE4eWNvdTAzeXFaUHNDUlYw?=
 =?utf-8?B?YW9LNjlNK25vOU1YZXA0QzF4OHVkS1FBQ2hoSFFBV2FmVE04dFpoaXVQTVhV?=
 =?utf-8?B?VlhLZkpEOTduSmhvRWRNemg2UHJDaU9YSTJCVlh3VFdCNUlCV3JuYTQ1a3VE?=
 =?utf-8?B?QUh2RjQvd0xrY2psc2h2VUdkdGhqMWpDSHZITDFtNldCTW10d0FyVWs0Wnd3?=
 =?utf-8?B?eVhHcmV0RHdGS3B6MFV4WUhybUJJUndKRFdLWHpxOTZhMUtPaFdnK0k0Qy9q?=
 =?utf-8?B?N2d5VjQvVlF0V2Z3YWphRmQ3czY2cXU4VDNoV3d2M2R0eTFJYTBaUWVweGJI?=
 =?utf-8?B?Z21DQ1lyVXRnbDlnc3RqM25QQ2pFOVNNaGtFWS9Nem1zOCtTWTZ4YU1TSEZh?=
 =?utf-8?B?NWEwWHlrbUc0NThxVHJOQUZVOGVDbTlKcGFXaEg3ZXNaeWhCakU5VVF1WDBP?=
 =?utf-8?B?bzE3c1grUFhJQVplb3pyTHNNNEhGVDFaVHFDZlJPeUlid0JQS2dab0YyMkky?=
 =?utf-8?B?K0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 322db1c0-a582-4d43-9462-08dde688a7f5
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 23:14:36.6005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6GqLFtxtqz3gNrz49wA+Pv47An4rHZk96rDSNt3UecZuVsBFI0I2EjV5JH00my+yJwUz7Tb0BlH2D+rYbiWzRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF4990C6B9D
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

On Thu, Aug 21, 2025 at 08:24:00PM +1000, Balbir Singh wrote:
> On 8/15/25 10:04, Matthew Brost wrote:
> > On Fri, Aug 15, 2025 at 08:51:21AM +1000, Balbir Singh wrote:
> >> On 8/13/25 10:07, Mika Penttilä wrote:
> >>>
> >>> On 8/13/25 02:36, Balbir Singh wrote:
> >>>
> >>>> On 8/12/25 15:35, Mika Penttilä wrote:
> >>>>> Hi,
> >>>>>
> >>>>> On 8/12/25 05:40, Balbir Singh wrote:
> ...
> 
> >> I've not run into this with my testing, let me try with more mTHP sizes enabled. I'll wait on Matthew
> >> to post his test case or any results, issues seen
> >>
> > 
> > I’ve hit this. In the code I shared privately, I split THPs in the
> > page-collection path. You omitted that in v2 and v3; I believe you’ll
> > need those changes. The code I'm referring to had the below comment.
> > 
> >  416         /*
> >  417          * XXX: No clean way to support higher-order folios that don't match PMD
> >  418          * boundaries for now — split them instead. Once mTHP support lands, add
> >  419          * proper support for this case.
> >  420          *
> >  421          * The test, which exposed this as problematic, remapped (memremap) a
> >  422          * large folio to an unaligned address, resulting in the folio being
> >  423          * found in the middle of the PTEs. The requested number of pages was
> >  424          * less than the folio size. Likely to be handled gracefully by upper
> >  425          * layers eventually, but not yet.
> >  426          */
> > 
> > I triggered it by doing some odd mremap operations, which caused the CPU
> > page-fault handler to spin indefinitely iirc. In that case, a large device
> > folio had been moved into the middle of a PMD.
> > 
> > Upstream could see the same problem if the device fault handler enforces
> > a must-migrate-to-device policy and mremap moves a large CPU folio into
> > the middle of a PMD.
> > 
> > I’m in the middle of other work; when I circle back, I’ll try to create
> > a selftest to reproduce this. My current test is a fairly convoluted IGT
> > with a bunch of threads doing remap nonsense, but I’ll try to distill it
> > into a concise selftest.
> > 
> 
> I ran into this while doing some testing as well, I fixed it in a manner similar
> to split_folio() for partial unmaps. I will consolidate the folio splits into
> a single helper and post it with v4.
> 

I created a selftest for this one. I'm going to send these over along +
the fixes I've applied in v3. Please include my selftests in the v4.

Matt 

> 
> Balbir Singh
