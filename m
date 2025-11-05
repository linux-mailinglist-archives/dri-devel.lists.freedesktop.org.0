Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADE6C385B0
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 00:27:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB7710E7CA;
	Wed,  5 Nov 2025 23:27:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BxHZ0dF8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013000.outbound.protection.outlook.com
 [40.107.201.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0B4A10E7CA;
 Wed,  5 Nov 2025 23:27:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bgW5bFV7//DisOqVIc1l5Pj85aGXplpUkO2bo+SdG1w5TPSMZL1AKpBwdy+1FU1hw2zURtLjAAMT0aeI/EW9wy1mZxaHC8CiMyjDQNzfrME/8HrFa2OP7zkvy2MmqPai+GIEVixgL0kAck807r2YESZH3DrhEAWIEk2iZCANB15+uHDwuY8jnxlfFDHPmCEA2w4Aj7sR98+g7l15B7+k1VQxKZ+qyzGL1nTqRt8IZwUVK1gAy2dorw/RX7KUuc9H/m8ByVpwrx1uGjg+JskwLOXhCZNdaf0eptqXGpNVFBX393iTrcTuOfg2ugl86dS8JoYn9hrMUfg3OI1bFim9yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Sd+hjhcwe+mT+4ieC7uERyXJvS4Gne3WlGvakfk84g=;
 b=mT9OaQDNe1XVIZ43dRmhzN/X1dqNF+TepLoLYg6m4iLDe1lDzxkbc7E0OEqpaMD8MRoQJL82rfP1Dg4mpTJF3yaqmSZH9iYUzxOAMCiqMjyubHNLT/5o5pJrJ+ZydPfmsG/ls7c7bLVwIs0Ht1sOajUmcatQgbXQ2fcENeXPBttKHJNHv+ppkf9XjJwOpRhgv9aGDHajDeyvlXn4SqeJPOYcmaVwJ93Y/vLC9swThM43gaV55+Vwy1tWpelI6o9njDraiYbthOJV3EEJW79cJQgXJvOG+wV8v9i1X53IO+fsbGsORPjBk4E4LDlJ084hEO1yTT7xjggsK+/Or5KWwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Sd+hjhcwe+mT+4ieC7uERyXJvS4Gne3WlGvakfk84g=;
 b=BxHZ0dF89pZIaiKFmKfZtSoTPTZLjOkXRpFjGDkAkMp7EqaBw8GprtVRDwKazym2nJ5kPIaHN3Qa8cm+s5pEDagWyRUW+QDglyql/vxrXKcUsfRT3F/xcntFbtQh6NwikHlRydpDgtTddbKvXgSLvrHxieiLUtp3BVUe7k3zirk5sAU8Jmw9tuTwn1BjuUAx2sR1JPRybJ2z5qpQJrA//V2vUARcjw6ejDm/isEIFnmkW7cZXGjSPNwHlTtGgW+pjwh1UEvBCP7u35f194EvbjrqTfYmzmwEKV3F+tG41vm7deQ3CND3mIWkqjlEAkqK2kxu/JbKPW6Ua3bWU3MWTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by BL3PR12MB6402.namprd12.prod.outlook.com (2603:10b6:208:3b2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Wed, 5 Nov
 2025 23:27:11 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9298.006; Wed, 5 Nov 2025
 23:27:10 +0000
Message-ID: <7d1f0b6b-976e-4b89-b780-1393608092d6@nvidia.com>
Date: Wed, 5 Nov 2025 15:27:04 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/12] nova-core: sequencer: Add register opcodes
To: Timur Tabi <ttabi@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>
Cc: "dakr@kernel.org" <dakr@kernel.org>, "lossin@kernel.org"
 <lossin@kernel.org>, "ojeda@kernel.org" <ojeda@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "tmgross@umich.edu"
 <tmgross@umich.edu>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "gary@garyguo.net" <gary@garyguo.net>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>,
 Alistair Popple <apopple@nvidia.com>
References: <20251102235920.3784592-1-joelagnelf@nvidia.com>
 <20251102235920.3784592-9-joelagnelf@nvidia.com>
 <d6c9c7f2-098e-4b55-b754-4287b698fc1c@nvidia.com>
 <0FF9536C-8740-42C3-8EF1-5C8CD5520E49@nvidia.com>
 <93c758298250d2be9262256a698c243343b64ebc.camel@nvidia.com>
 <3c625930-348a-4c96-a63a-6a3e98e59734@nvidia.com>
 <acc56fbb56c3f40119e5a6abf9f13093d7f4c7e7.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <acc56fbb56c3f40119e5a6abf9f13093d7f4c7e7.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0102.namprd03.prod.outlook.com
 (2603:10b6:a03:333::17) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|BL3PR12MB6402:EE_
X-MS-Office365-Filtering-Correlation-Id: e96b2675-9142-4687-11aa-08de1cc2d7ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a04wdWZCWFdISmtnd1J1SXBFSklKK1A5aVlwSEVKU3A5bFM5YjRJWnoxcEVP?=
 =?utf-8?B?SnYzVURhdFd5ckhPUklNaDVaOGhGdGx6RHJuQUNhRkVZU2xJWGRsMU82Q3lU?=
 =?utf-8?B?WmY1MkJ2S2JRdEhzalQvYWNiWHZsRDlnVERzOW1sVllxNEM3WUEvUnFUVVUy?=
 =?utf-8?B?SVNuNWRpSUpTRFF0dDI0YlVpaEcwb0NLVFZGQ0NQaHlLRFFvUk4wOGp5UUsv?=
 =?utf-8?B?VU9DcUIrTE9tOGJDYzU5ZTZodnFLSVhJVzRPNUhzVXZTaGxzcXJUT0pZRnZE?=
 =?utf-8?B?L05VR1dnVUpYcVgxZXZwWWRnd0NOUTI4MytadC9OWnIzMDV3YTVENStycS9v?=
 =?utf-8?B?bFVPUldMd0FNU25zOXNtOEJYY0UzT2pLOUpDbGZmcEVJRmJ2cy9yRjJXZjdN?=
 =?utf-8?B?VG5ScDB0dithblVoZkZsQkx0d1FtRk1pdU14N0c4STB5dDdMUmIwT0FMTExV?=
 =?utf-8?B?NnhOWWhnMEZiUGpVWC8xUTB0UkRWUDcyRkZERzJKVU9sWnVHSGtGeVdxY25l?=
 =?utf-8?B?SVRpQUZkRlJQUWhaeEg5dnl5R0JaakdvcE54eC9WR3BUU2VNQlJRaTc5TnRP?=
 =?utf-8?B?dTVid2o2WmpUZndwdGxWWFN6M2hrQTkyeWpCWEJYY09qVEFHcUU5VFBnN0lZ?=
 =?utf-8?B?NDlSb0M0SDNGMG44OHdCZ1QxTlVpZ1FLdkR5aUc3ZjUxWWQ4WS9mT0wvME9j?=
 =?utf-8?B?aTRoT2xBWk9vMXB4dUJkMFNVY2pQMWZNK1haNEI4blowVnkxNVJudytoSUpp?=
 =?utf-8?B?d0hla3NFWkczcVMzeUZ3cjQwZk1DYjJUcXNpY3lTSmZoN1BEWlA0UnNoUlFH?=
 =?utf-8?B?aitKSmNIUDFOL0JoU29QS1J0MWhBVjZwRW90Y0lUaXZ4RG94VDRaNlZ3N0Vs?=
 =?utf-8?B?eGw2TlZvK09QRHA0UmxqYWI0Vy90Q3BmQi85bkJWSUx6ZnB4cmQ0Z2ExeVdl?=
 =?utf-8?B?M3kwYTN1clNzSFBmcUFQVG5wZFFmc2ZTL3lwcWFQaFVSVnZoS2pXYnNZU0FI?=
 =?utf-8?B?eVpteExQVDUyeDRZTjI5Nkp5Y0NrbDZES3ZlSTdTTjU3SkdNczZRT1FyWW1s?=
 =?utf-8?B?WXN2ZzB2d292M3FqR0MybDF1YU5kUjVHNUVXOGhONHFuaExJM0FlRUxmRWRi?=
 =?utf-8?B?ckF6MUx2cUdoWnpRcnQyZFlCRUtRWm5HUUFIdFVjS1IwV0JUQUdxR3U4Y09C?=
 =?utf-8?B?aDhrVDdQWHJ5NlRneGRpWGtiTkJNdjBBM1hJWVA2bXpZaDkyNVZqOWRZT1Ju?=
 =?utf-8?B?TXRuSFcxaHB6RWhGN3gzZDNqYVVyM3BlL1B2cDJwTVkvVE9aaThvUnRIRmxJ?=
 =?utf-8?B?U2VsMUNQT2Q2M05qU29NRkZkMXlPQ1V5QU45Q1BBeG40eHNFMThGNWVQNjZJ?=
 =?utf-8?B?S0lodWQrNTZnZUgyT1pvU0wvdWJwTHV2TjhLeGNDeVQ0WnQ2OUh0b2NNMWdN?=
 =?utf-8?B?SEh6Ym12bjNld0h3Q3lVVXAvUXYzSlFjK2owQ0F5em5uMWtjZldsTmsyMm9O?=
 =?utf-8?B?VFZJMlpTbzdTK1lueHVJTnZEbENuaVp1SnBZQzRDK2ppTWJRaGlyQjNMNEkz?=
 =?utf-8?B?Ny9acU9QTjZEMFo0THdMcEhqUWUxRXRGc2hER1RkVlptUlhRSXlJWlRSdzlt?=
 =?utf-8?B?YkdneU8xazZyR3UzVFBsYWs4c3VOaCtKNndjVzFNMkxGMjRjUHZlM1psZUNj?=
 =?utf-8?B?RVRNM2NIUDdvTVNNNzdFWDhCRlNpZE5TSGN1aXBDMHBmNHdPek1LOHpCRVJV?=
 =?utf-8?B?c0x6anUvVi84UWJuWE1oWFdta3RGM3JVWkdzNERwZGMxRGRsUzV5T0U3Q0Yy?=
 =?utf-8?B?MDEwREhRSldQOU56c3NQR2czbFMxdU1oTTNXWjlZcmpoR2JPQlhSWmVzYWIy?=
 =?utf-8?B?aUFvSU0vYmFFeGliWWIzL3RtRTgraEs3aVRWTWRFMnhzaXBRRHN5cFlHMDFp?=
 =?utf-8?Q?nzvk6jJd2c02YQHqcx68rhSvkT2hl3R2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vk52SlJlSGRDakNJbUNYZlN1VDVTclFMa0MwRFJoZlQxaXU0YjQzUlJDRng0?=
 =?utf-8?B?eWtkRDJUWU85ckFYUjRzdG9zWFhHQ0RsV0RBWC9GUUtCeUtLYW9BT0tNRjRY?=
 =?utf-8?B?VzhTdEFhT0VYQjJnaS9xUjlKZDBqUW56RmpWdVBQN0ZuQXcvbDlzeEFmYUJP?=
 =?utf-8?B?ZEl5UVBxbVR6QVBrYjBmTkdmQlhYV041TU96Y1BHZEptSDliZk5oQloza0h3?=
 =?utf-8?B?Q3pka21iQVF4VlNFallSRmFSalZIR3ZZZGNQc3BmampDaEdyYVlLZFJtR253?=
 =?utf-8?B?T3FOSEMwRlVLWUJjS2VpYWNmUVhaVkYyMDM2NW5YYmZkR0F6bmNOUXZIblVv?=
 =?utf-8?B?Y0VFK045Zm9hakFiNGNkV3hmd1hLdlZiZUd3aFAyY1c1WEVlYmlUZGVQaUMr?=
 =?utf-8?B?OURRUEMwZmQ0Mi9qRllOR0pTTy9xZ294dFZwWkNodTEwb3hydDhaRm5YMlFh?=
 =?utf-8?B?MWZScmJ0UVVrY3NSM3l4M2hIamNQSWtvc1RHUTFlWkY4bXZCVXJQWEc4ZGww?=
 =?utf-8?B?VjNDUkxUeUR3QlExM0pSZDE2QU51b3Q4cUxvM2FHbS9mN1FaMHVQQXhSR1Fk?=
 =?utf-8?B?cHpXVTRzdFdXUGVPQ0s5RHJaL3BUbjVKeWdRRzkrSFl2ZG1GSVVVQlM4TEl1?=
 =?utf-8?B?V3pMbFlmaVJvdWRtOWhkUWpJWk8yajQ0T1hseDFGNERBNkxUNGY5eU1XY0c2?=
 =?utf-8?B?eVJGMmYwdTVtSU1Kd1BXWWpMS2JWOVVpNW9mbjN4NWE3eFBhSmhoV085RUJG?=
 =?utf-8?B?MGFqWVdYNnQ2dDVZSDFxdEhld0dHY3NSR3FkQmJPR20xYzlINHovRnRvTXBX?=
 =?utf-8?B?UzZmR0l4eXlXL3JOY1kxQUpxcStRU1B3YXMzTWZLTDF1aGdXWStZaWlTSGZq?=
 =?utf-8?B?YjBGaU14UHFyU2dTalA0MWFxNERWQ0JsVWhaYVl2SmNickNUMnlKeHIvN05k?=
 =?utf-8?B?aGNJYVlRMk4vam1wK3VFVFVzQnBhckE0Ylc2N3NaZXgzOFhrcHVpYXlPbFQ0?=
 =?utf-8?B?aGl2S2wvSk9BeXlhWW1YY255V1FHa1RaTXU3aUJDSjVBc0xwN0ZpYWZnbGtN?=
 =?utf-8?B?M0taamtQd0k1THlDb2IyczcvTkNneDZRVmhuSW5jZ2FneU96cGFVejJ6T1lR?=
 =?utf-8?B?bFNPbGI2Zy9CdE1KSnUyeWI4eHlmeml6RGRuREdqYUFuK0dubUhYc0hlV0hv?=
 =?utf-8?B?VnpnblFOck5OaUZOMVdFaE96WXQvdjFCdW1ON2FOdlY2c2ZMSTdFMEI3aWk0?=
 =?utf-8?B?TkVxTTY1dm9DdDZHNktQUmZ6TlJKN3hSNjJwUkJzb0xEVUcwMG1sZnNUSGVI?=
 =?utf-8?B?R29kQ2RSZWxxNXluNmR1R09GK2NxMHlZRlFwb1A4UXpTWVgweHlDYWlCeWMw?=
 =?utf-8?B?d0tqb0lRNUtOKzd6WXZXdjNibnVSNHhGWDZSdHFWU1Jhd0tndStmSTUzalNh?=
 =?utf-8?B?MjJIc0xuNXc2czdia0YySTJ2SzVPRTBocjRzbTZpemt4NHpBaE1md0RNVkZY?=
 =?utf-8?B?TjNrSFdCcExFMC9iUzFMa1lqM3lzakJrWHhndEQ4OHV3SGVIYjRjY2hoeXBB?=
 =?utf-8?B?UFNNVm1DbE9hZnFhbzZhRE5CRW9wdGRQSmtibFpLZ2VnTEFWN2FqRlpRbm5F?=
 =?utf-8?B?cXJ3VjEwVVFpWG1EbEJ2TzlGZ3JENFkwUWxQOTR0aUFGR0RhN3J3eTQ1c21X?=
 =?utf-8?B?UDlLMWZKYkx2YVV0eDJtckg2cjJWTElSL3dvbWpTSDdXTUFObkcveWk4TFpF?=
 =?utf-8?B?WmJYLzJNTnV2OHJQQ2owUmo5MlpDN0d5VE9rZ1phQnBNeFlDWElwVWJxSkhz?=
 =?utf-8?B?d0tRTzhnSkMyMXF4RTA0T2pnUUJsQU9XUGxyQ3JEbEFURUdFK2pIRUs2VUM5?=
 =?utf-8?B?NFVpanl0S1pSaXpob3dtdWNkNUJSZzJlL1ZSOFM2Nk8zZmJvUFUrTGRJbnpC?=
 =?utf-8?B?VWVPOUxtT3VLb2FRYkdFS0xENDcvQ3UvM2l3VGo1SnkxaWRuRmtRUEJZdTdw?=
 =?utf-8?B?WE9nMHZKTFpjUWxGS2VPRk9jWXB0ejJDRmpqbWpyeXozcWxBMWtQbXFuZzZD?=
 =?utf-8?B?L2Jha0xrQ3BFNUZiellha0xLRTh1UzU3OXJiV21rKyswdjh2dmIwakZkWlZl?=
 =?utf-8?Q?bld8NqpF/4JIG90NNY/wQdXd2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e96b2675-9142-4687-11aa-08de1cc2d7ee
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 23:27:10.6782 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S/dFtaWKFbbnZbYI8grf8aS/Z3l4N4j19eT5YI0EGpPs9ali6bXfEtvIk8iv9p4bjCzKWuKQ83gTop6e32X/uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6402
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

On 11/5/25 3:19 PM, Timur Tabi wrote:
> On Wed, 2025-11-05 at 13:55 -0800, John Hubbard wrote:
>>> #define nvdev_trace(d,f,a...) nvdev_printk((d), TRACE,   info, f, ##a)
>>> #define nvdev_spam(d,f,a...)  nvdev_printk((d),  SPAM,    dbg, f, ##a)
>>
>> ...and those are unusable, unfortunately. I've tried.
> 
> This works great for me:
> 
> modprobe nouveau dyndbg="+p" modeset=1 debug="gsp=spam" config=NvGspRm=1
> 
> I get all sequencer messages when I boot with these options.

And so do I. What I meant by "unusable" is that there are so many
messages that they never really catch up (I'm throttling things
due to my use of console=ttyS0,115200: serial connection, haha).


> 
>> ftrace/bpftrace, maybe those are the real way to "trace"...or something
>> other than this.
> 
> You could say the same thing about most dev_dbg() statements.

Not for Nova, not so far. I'm trying to hold the line, so that our
dev_dbg() output is merely "almost excessive". I'm actually quite
pleased with things so far, and this last comment is merely a
tweak in order to keep things on track.

> 
> I agree that dev_dbg for sequencer commands is excessive, and that implementing new debug levels
> just to get sequencer prints is also excessive.  But Nouveau implement nvkm_trace for a reason.  And
> we all know that because of ? in Rust, NovaCore does a terrible job at telling us where an error
> actually occurred.  So there is a lot of room for improvement.

There is room to improve, but I don't think that Nouveau's logging
approach is exactly, precisely the way to go.

Let's keep thinking about it, longer term.

thanks,
-- 
John Hubbard

