Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C77D0C5BF
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 22:43:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 637E810E94C;
	Fri,  9 Jan 2026 21:43:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WlBzdJ9u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010021.outbound.protection.outlook.com [52.101.56.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8650210E948;
 Fri,  9 Jan 2026 21:43:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YG9pJGT3+INMhvJJTPoUHV5dlOE3Vfc5Cmh9G/YDm4eLyje8u0PQHVD8fu7ZTHxCG48BsPLANeiE2Of8HmIvvWib01CtyksRyHG59XDdsrOG4l8KzkMM8Y/AhIgSfpfWMqnJoNoR3fZBMqazpB+woUBPpzhbfbSoNrF7bSt7u6fMmzyvXyRaCUmc9nJtgPfGN2v0vsShRPgipYpEdqgca3IuIIvKh4X8TzffRphnPRkUSQ/JEmAFOA24rsXEwi5READJKo7XvUl07YwKLNnR7iEcFkqh7ZjN95xzLDH5zBXFCJXP1hyAZrBBWO2lB6FSClUM94gw+HYoMTeYcdCWjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T9Fo+EgxJvnCNh3oGrACGrYEN0fiOHFOF+Rr9IUjSZ0=;
 b=yeoyyqfVt8R41tuQXRSnnpbzSFiGi72oY8dE2ERIfJrtgm0EXK1W7c79Ws3jZ8wqtb49sG1yb8JywS9ILEipTWlLe3Xmw6J7zRQK02vja37QHce5+tT9/Uw3H8qOhW4+8UL9tOhZT0rMji2MSPW8Tkbd3D7E2ngPvOVBBzBUEn9oKQ7DdGrkFx9st+Vt3aE+CJ+x7XF+oWx/AqiDEHDl6bc6zbvGog7PcIHAPaSiCdHPZLp2s3Tcy3xaDjayvPmzEgP4YHYHLoGwYUaJC2e5rGLH+3qQAz3Ur3+rdsik0WgDgkGQNAalHN00j7ZOK5Qbvrj3dzwA/j2DjzYeWccSPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T9Fo+EgxJvnCNh3oGrACGrYEN0fiOHFOF+Rr9IUjSZ0=;
 b=WlBzdJ9urLFryTdti2ZgfsdwAUdhrIooXH6F0IhzgLLuQTp7vF2HpAQOBdwnE30bQC5uoYW7bzjENWVETsaHZWVoPtBeuERv/SbkhZ1thofyH5eGyG7WO/qNhLf4YbxFVxoL4bu8Q+Z+X9kJyRxDif6YIgVX92aKFwXFYnw3iS7okPWAzzUOsy3qECHwDYlkriJwTlYrURtTAAkBdNwcCVd1s3xa8wj2yKtSuAk/KW/+UEdBqtmYWvZznFZkkUFCM1PbkpORFejDgqGPE/8x3CzNGBD4jehTnYPpY3q/tFLr5LIVoY+YBih1Kq2C2SJmZxC/u4gao7HjPOEgU7c19A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SJ0PR12MB8113.namprd12.prod.outlook.com (2603:10b6:a03:4e0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 21:43:17 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.9499.002; Fri, 9 Jan 2026
 21:43:17 +0000
From: Zi Yan <ziy@nvidia.com>
To: Balbir Singh <balbirs@nvidia.com>
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?utf-8?q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alistair Popple <apopple@nvidia.com>,
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/7] mm: Split device-private and coherent folios
 before freeing
Date: Fri, 09 Jan 2026 16:43:12 -0500
X-Mailer: MailMate (2.0r6290)
Message-ID: <18E78790-4996-4151-821B-8A1D784A3F7D@nvidia.com>
In-Reply-To: <4485ba83-a8c7-478f-953f-78d66e84d730@nvidia.com>
References: <20260109085605.443316-1-francois.dugast@intel.com>
 <20260109085605.443316-4-francois.dugast@intel.com>
 <d1d80b81-678d-4d28-9ac2-95cb74824e73@redhat.com>
 <DF5A6B81-7811-4654-855F-8EAB76CCCE51@nvidia.com>
 <aWFIW6XCKXPpIinv@lstrano-desk.jf.intel.com>
 <D9ED5F01-E758-4A89-87F2-ABFF5197231D@nvidia.com>
 <aWFSGc7MIUqVsilw@lstrano-desk.jf.intel.com>
 <12A9DCBB-0B59-4D63-9BA8-9F99570AFA80@nvidia.com>
 <aWFe9S2DGwfD2smO@lstrano-desk.jf.intel.com>
 <B8B15539-F97A-4D6B-BF58-FC75397C429F@nvidia.com>
 <4485ba83-a8c7-478f-953f-78d66e84d730@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0159.namprd05.prod.outlook.com
 (2603:10b6:a03:339::14) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SJ0PR12MB8113:EE_
X-MS-Office365-Filtering-Correlation-Id: c14243de-2021-47b7-bbc5-08de4fc81921
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T1FxU3BDc1k1MlVnbXp2K1JKTzYvR0pPclJrY05lamgzUXoyZkwwSllHdHZV?=
 =?utf-8?B?SkJJOE1SSUx4MjNEdzdkUnFTWlBaK281V2RmMjJIUXA1YjEvdEwvRFBqK1pT?=
 =?utf-8?B?RlhuS0JJb1J6dzFpMGE4a0NHQi9FV09BU093S05hVlZEVjE5K3YxeE9GZXE3?=
 =?utf-8?B?UTNvKzhCbVVuNzFWU3VmSEFsNHdmVUZXejFwdXdJMnFmWXRRdWpQV1h6T29R?=
 =?utf-8?B?K0xsamxVbFNlRUpudGQyOEVheGlPVWZUeERhN0JJVWFCOFBFK0FqWUxyWkY2?=
 =?utf-8?B?VjNDMG4rdER3bTFJZXlweERKcmN4am5lV1YvY1RUbVpBUUNkRTlHdU5YcjU4?=
 =?utf-8?B?ZWFrdXdXR1ZpRWhZR3ZVYlBRMzhXT1ZPSXlRYm5YclphempERmdTblVON2ZI?=
 =?utf-8?B?UkJTZDE3TmtNU2ZyWTRrRUlpWEs5YmVaSzlaaGVjYW1Pd1dNdkUvQWZwOXZ6?=
 =?utf-8?B?Um5kVktJeXVvT25tK1A4YXNWek05bXFsM0l1SVlaWHVXV3dBNEFJMkxuTWxT?=
 =?utf-8?B?MGpKc2wyaE1GMWVMY1RCakdRLzdCT1pZYXVKUGRBTm9LOWV3WHFQTFlHdmNq?=
 =?utf-8?B?VzNadW14QkpuVEtPV2g5TFMxSm1wUDMra1QxbVZCMlFxcTdkeFVhd3JBWVY2?=
 =?utf-8?B?T1R2RFRtWUZBdVVpYXlHOTNyL1llUWFQcXhoeDhhdWhPbncwUHEwbkpsYjF2?=
 =?utf-8?B?aWZ6N1RxV0hZWlFvOENkU3MxRG1ZSDA0WmlhVzJla3dGWjFWbDJvbGZEMVZC?=
 =?utf-8?B?Z1NVTllFcWF1YXdzNXJxZ2NkejVzU0V5ZW95b05Dek5OTURxWlBWbWFBdmR2?=
 =?utf-8?B?S21kWjkzRXZOMkNnSDluQ2RKYjlrTStIZ2F3Nk9wcFAwMk1TKzVxL3lCL08z?=
 =?utf-8?B?eGJXdi9QUVZ1Y0pkT2tadVYwK0dIS2lTVnMrc0JsZHFiR3AwV2FScGZMaHpY?=
 =?utf-8?B?UFl4eXFhRlVndFFLN3lIN01zcDJWdDVZMlltT2lubC9EZ3RiQlNZdHJ3UWho?=
 =?utf-8?B?WW1qTE1iajNxNWRlYnRBL1Y2b2RiNytqZmdOd1BNRjFjTjhoY29td2YzWTlj?=
 =?utf-8?B?eEdDK0lJL1lkODJ1ODNXTUdqNWk1d1VCbE9SdjRZRGJKbXRsOWxxT1VJMmtE?=
 =?utf-8?B?U3hsdkx1THpBelhhVmZudVJybElFbUlBMHd6N0FFYlNyeU1WbkxrZGl5eWxk?=
 =?utf-8?B?a0xPcjA1OHA2ZStkRHhFRU9wNkltWlhubGhwUDlvV0tkRmFlTHZsbWZ5MWZq?=
 =?utf-8?B?R3hhK0JaVDZxSkdEbXpNOEFyREpQcnk0a1ptcEtPZncvMmlDVEtZaTg0OWI2?=
 =?utf-8?B?UHdCcVBoOWl6dXlITmlHN1Flb1d4dUorN2dob2g1cysxL0VGZHVab0ZBc3FE?=
 =?utf-8?B?czViSElzVFZyZmNQeVdzVStvblU5SzlmemNzWitSQnZrSkhLQ1I5M095RXpL?=
 =?utf-8?B?TTFSUnhWcjNVaTNUSytDdGtTT1FmWVFLWHRqWDlSSERidXYzOFVnNTd4V0NC?=
 =?utf-8?B?bDQzdmNTUGdrSkhrdzNOdXBRUElHanRRR0ttS1kyeDB1M0FjcE5sUFhqbWcw?=
 =?utf-8?B?d2RlWTZsblJlRzZOclVQT21QSUNJcEpDYmdMN3RXUnNCNzRHRHdLUkRTNWRX?=
 =?utf-8?B?RXF3azQ2Rm1ZdGZnYWJSOGpEeEZ5RFNhRkdDQkFXY2ZvQm9yVTJpVEJhSTly?=
 =?utf-8?B?TnRLOTNKdWxKYzNNSXQ2NUxhbUdpK21PSzZxc1N5eENyeStyL1lpcGo4aEla?=
 =?utf-8?B?N25qRy9aV3ZTaThNVldoZS9VZU16SHRKSW5VTmo2MENnZ1V2Rndka3RwTG92?=
 =?utf-8?B?SS85QlJzR0Q3ZFV6WU1GNG1RcXNRUmdxTzlUOHYydkYzSDBrR0MvcElGUlJT?=
 =?utf-8?B?azNRM2ovQk96L08vNUtKQXRINmlxN29WOU15YzRySEs2MEZBNG45TTExZ2Vl?=
 =?utf-8?Q?EQ0BdcwI3kQL/G0eA0Ti/4uBpBQsnwFZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9473.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RG5QcUl0emJGZzU2NXlTRHdRVDFNM2ZFTzRZcGlSZStnT3M2TDBrQjh2c2lN?=
 =?utf-8?B?WmlhY0tDRVFCZFJ1NmlhOFBWUGFCY1FLSXh0d2VnNnE5czhCVkdrUXN6K205?=
 =?utf-8?B?aml2UWkrcGV0bldtQVJxei9oWUFkTk84QkFYUFArcWdQNFdzQUxYUG9YdnBq?=
 =?utf-8?B?WTkyMnpjcHZXb3dPQmpoSWx0dkh5STB4RTRDQ3EwQW1lYVRMSjFPcHhGck5N?=
 =?utf-8?B?Ly8vNlNoaWhBWTdLb0hBYXhDc1Z5VVRPcE1lQnVCSWRkNlFsVjFjVjZPNTNH?=
 =?utf-8?B?QWtxeDdMWGFqZGRQUDBqMmxPb0MxeEJtTENlREdlQWZiT1Z4bnl0dUlwMkUv?=
 =?utf-8?B?UU5wb01tbk1GdVpsVVJucm1xdmg2UFNkS2hON0pBcHhRUlpmMzduYmhPaEhu?=
 =?utf-8?B?akFaRXhxOUMyQm9xWk9YUkZEKzVtOW1GWHZIYlh5WFJGNVFFS1d2M0QwUXhY?=
 =?utf-8?B?UmE3WWF6b000RUlPVEd6cGJqdDc3VlU0eDdFYVhtRWhCL3pXK0ltL3lUcDAy?=
 =?utf-8?B?c3FGUXVXUHNKY1hzVStGb0VDNHh5eUZrbURTTXErL0h4aTFxTEVFbTZ6RElY?=
 =?utf-8?B?VUlOc3RWU0xNT3VuNVlYVkU5Y3MwWTJaYnVVZkZOKy90YVh5eExLbEowQnZZ?=
 =?utf-8?B?Z20wbmg3bzFPNkhNWnYwSkdtczB4cFB2ZHBOU2Z5bUc4Y3BUVFhGR0d3R2d2?=
 =?utf-8?B?SlkwVU8xR3VhZVJucHNxQzdvd0NsZndkZkNHWSs5NGpJMUNHT1F3dkNZdW1o?=
 =?utf-8?B?ZWU2Y1VnNFpBNXhYNnNtN3A2MlIyaDlWcHNlaHhrMUhOWWk0dURWZE52ejZU?=
 =?utf-8?B?RG1yaWtaL1hNdklvcDdRMUFCRktzSVZ5eFhueGVXMjZwYzVwdWtGcjU5ajFw?=
 =?utf-8?B?ekpqMEE1UXNiTnRNU0RwV1pCSVlUNEpqZ3RTVm5pK1BUM1RPWG1XNE9sY0o5?=
 =?utf-8?B?ZnF0T2xvd0FtZGo2Sk84YlQ1MlRDb2ZNQ1cxb04rNkp4bFRYTkQ0VGdUQkN2?=
 =?utf-8?B?Z0NYUEFIalVDdnhGQ3FveVdNSVFJcmN1Q0dYR1VZWE93V21tQWhWMUU4V2pj?=
 =?utf-8?B?Nm1SQyt3S3pmcTQ5TFhUc05OR0VsaVpHL1lvcnAyS3FDQ2dnY2hzM3JTc09K?=
 =?utf-8?B?R3QxSC9nU3lNanlFZGVBSEJXc2VLcWxBdVlnUGdXeEdNNlIwbEVhd2o1SUJM?=
 =?utf-8?B?cW50cUpZeWRBOWlHV29KS2hVSHgxZXZleXNjVnMraE9FS1hDUUtINUN6ZldB?=
 =?utf-8?B?WHVBUXVVNzlRRFE0ak1yNXRGK21KNkZ4S09FQlpDQVI2dEprSjJydTU4cm5D?=
 =?utf-8?B?b2RycFVjdTlBNC8rSFVUSjM0NUdpZ3V4aGdSMmg1Nzl5RGFlZlJBVDVwN1Fs?=
 =?utf-8?B?ODJEN2hwcHBRd0EyaFFYZVJMYUEvcWFpS2ZyY0RoSGRZdTVFdStHdUxZNkx6?=
 =?utf-8?B?TUFqc0Q3Y0tDcndWcm45QkM4N0U0Vzl5UjY1SHFVS3lKaFE4ekhjNmh3dnFy?=
 =?utf-8?B?YnNvYXRIaVV2NnFaU0lTZnVUeFl4RVVXRXU1VEEzanNPNTFDSEJLY1hrY0w2?=
 =?utf-8?B?Yk5lbmIzM2QyczMyRG1MWk5FOUtpaGtHUVQvNWdJVStGSXRmTmdybll0VmpB?=
 =?utf-8?B?aDJXVnJmYlY4RjJlUHJ2WVpLV3dEUjM4RUYwWjhRVms0RnpybjNsYXNtVUVW?=
 =?utf-8?B?azF6RHR0Sml0ZDlYcmphZFh0aFlUZzV4MGtBeVBoNDJiSGp3WTdadFl4MFAx?=
 =?utf-8?B?blI4c3RiQ28wM2JDcENheDRvbDhNUVVWYWdnb1JtbFJheUY2YlRUejI4YnR3?=
 =?utf-8?B?a2ErSmlkdGQwbEZMeEt4S2FmTkl6cE5NRXFUT1p5dTgyRTdIdTQvUEEyQ0Jz?=
 =?utf-8?B?N1VjVDNDdHhIdEM0OTFuR3RlOThRdFpzcEppZ3AyQk1OQjY4UXR4a0FlekQ2?=
 =?utf-8?B?emRUOU1lWHFrVjA0QTBlS04yZ2NyWjduN2lCTnZyN25OTWwrTi90K1l0UHZ4?=
 =?utf-8?B?SktiUjRsRlRUODJqclltQmcrUjBZN1dhMzVWcWk1cXBibVo4R0FTUTErdXFH?=
 =?utf-8?B?SnVYSG9lWGd2ODhjWmFodmZSMWJtSHppZ2RhdHY2aEJEL0VqaFZzejNvODRs?=
 =?utf-8?B?djhlTlpYYk5oQ3FWTHVuOElZS0FMRFB3Rmx0UW5wazZjWjNvR0VUcDZBMGRi?=
 =?utf-8?B?TFNJZ1VIYkNNWmc2TjhkZGYvTlErbS9IKzBGaFA1M3dKSnlicHgwNGFxMHZU?=
 =?utf-8?B?QlBjTTJpbmJxY1BZa1JaZi9HMXhVZENZNUVFcHlySjZKYjFIOGt3T0xhbjN0?=
 =?utf-8?B?czlrRWNKeXZtRThGUmJmMzFzTWNjSXNaenhXQUo2ckh4R1lqWm9SQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c14243de-2021-47b7-bbc5-08de4fc81921
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 21:43:16.8185 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T8z9/ZJlgMJjVUHILnHw9GNhZeDPyQHZHPAYyeGn4j7F9N2eI8fvumvd+EakcPla
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8113
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

On 9 Jan 2026, at 16:34, Balbir Singh wrote:

> On 1/10/26 06:15, Zi Yan wrote:
>> On 9 Jan 2026, at 15:03, Matthew Brost wrote:
>>
>>> On Fri, Jan 09, 2026 at 02:23:49PM -0500, Zi Yan wrote:
>>>> On 9 Jan 2026, at 14:08, Matthew Brost wrote:
>>>>
>>>>> On Fri, Jan 09, 2026 at 01:53:33PM -0500, Zi Yan wrote:
>>>>>> On 9 Jan 2026, at 13:26, Matthew Brost wrote:
>>>>>>
>>>>>>> On Fri, Jan 09, 2026 at 12:28:22PM -0500, Zi Yan wrote:
>>>>>>>> On 9 Jan 2026, at 6:09, Mika Penttilä wrote:
>>>>>>>>
>>>>>>>>> Hi,
>>>>>>>>>
>>>>>>>>> On 1/9/26 10:54, Francois Dugast wrote:
>>>>>>>>>
>>>>>>>>>> From: Matthew Brost <matthew.brost@intel.com>
>>>>>>>>>>
>>>>>>>>>> Split device-private and coherent folios into individual pages before
>>>>>>>>>> freeing so that any order folio can be formed upon the next use of the
>>>>>>>>>> pages.
>>>>>>>>>>
>>>>>>>>>> Cc: Balbir Singh <balbirs@nvidia.com>
>>>>>>>>>> Cc: Alistair Popple <apopple@nvidia.com>
>>>>>>>>>> Cc: Zi Yan <ziy@nvidia.com>
>>>>>>>>>> Cc: David Hildenbrand <david@kernel.org>
>>>>>>>>>> Cc: Oscar Salvador <osalvador@suse.de>
>>>>>>>>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>>>>>>>>> Cc: linux-mm@kvack.org
>>>>>>>>>> Cc: linux-cxl@vger.kernel.org
>>>>>>>>>> Cc: linux-kernel@vger.kernel.org
>>>>>>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>>>>>>> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>>>>>>>>>> ---
>>>>>>>>>>  mm/memremap.c | 2 ++
>>>>>>>>>>  1 file changed, 2 insertions(+)
>>>>>>>>>>
>>>>>>>>>> diff --git a/mm/memremap.c b/mm/memremap.c
>>>>>>>>>> index 63c6ab4fdf08..7289cdd6862f 100644
>>>>>>>>>> --- a/mm/memremap.c
>>>>>>>>>> +++ b/mm/memremap.c
>>>>>>>>>> @@ -453,6 +453,8 @@ void free_zone_device_folio(struct folio *folio)
>>>>>>>>>>  	case MEMORY_DEVICE_COHERENT:
>>>>>>>>>>  		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->folio_free))
>>>>>>>>>>  			break;
>>>>>>>>>> +
>>>>>>>>>> +		folio_split_unref(folio);
>>>>>>>>>>  		pgmap->ops->folio_free(folio);
>>>>>>>>>>  		percpu_ref_put_many(&folio->pgmap->ref, nr);
>>>>>>>>>>  		break;
>>>>>>>>>
>>>>>>>>> This breaks folio_free implementations like nouveau_dmem_folio_free
>>>>>>>>> which checks the folio order and act upon that.
>>>>>>>>> Maybe add an order parameter to folio_free or let the driver handle the split?
>>>>>>>
>>>>>>> 'let the driver handle the split?' - I had consisder this as an option.
>>>>>>>
>>>>>>>>
>>>>>>>> Passing an order parameter might be better to avoid exposing core MM internals
>>>>>>>> by asking drivers to undo compound pages.
>>>>>>>>
>>>>>>>
>>>>>>> It looks like Nouveau tracks free folios and free pages—something Xe’s
>>>>>>> device memory allocator (DRM Buddy) cannot do. I guess this answers my
>>>>>>> earlier question of how Nouveau avoids hitting the same bug as Xe / GPU
>>>>>>> SVM with respect to reusing folios. It appears Nouveau prefers not to
>>>>>>> split the folio, so I’m leaning toward moving this call into the
>>>>>>> driver’s folio_free function.
>>>>>>
>>>>>> No, that creates asymmetric page handling and is error prone.
>>>>>>
>>>>>
>>>>> I agree it is asymmetric and symmetric is likely better.
>>>>>
>>>>>> In addition, looking at nouveau’s implementation in
>>>>>> nouveau_dmem_page_alloc_locked(), it gets a folio from drm->dmem->free_folios,
>>>>>> which is never split, and passes it to zone_device_folio_init(). This
>>>>>> is wrong, since if the folio is large, it will go through prep_compound_page()
>>>>>> again. The bug has not manifested because there is only order-9 large folios.
>>>>>> Once mTHP support is added, how is nouveau going to allocate a order-4 folio
>>>>>> from a free order-9 folio? Maintain a per-order free folio list and
>>>>>> reimplement a buddy allocator? Nevertheless, nouveau’s implementation
>>>>>
>>>>> The way Nouveau handles memory allocations here looks wrong to me—it
>>>>> should probably use DRM Buddy and convert a block buddy to pages rather
>>>>> than tracking a free folio list and free page list. But this is not my
>>>>> driver.
>>>>>
>>>>>> is wrong by calling prep_compound_page() on a folio (already compound page).
>>>>>>
>>>>>
>>>>> I don’t disagree that this implementation is questionable.
>>>>>
>>>>> So what’s the suggestion here—add folio order to folio_free just to
>>>>> accommodate Nouveau’s rather odd memory allocation algorithm? That
>>>>> doesn’t seem right to me either.
>>>>
>>>> Splitting the folio in free_zone_device_folio() and passing folio order
>>>> to folio_free() make sense to me, since after the split, the folio passed
>>>
>>> If this is concensous / direction - I can do this but a tree wide
>>> change.
>>>
>>> I do have another question for everyone here - do we think this spliting
>>> implementation should be considered a Fixes so this can go into 6.19?
>>
>> IMHO, this should be a fix, since it is wrong to call prep_compound_page()
>> on a large folio. IIUC this seems to only affect nouveau now, I will let
>> them to decide.
>>
>
> Agreed, free_zone_device_folio() needs to split the folio on put.
>
>
>>>
>>>> to folio_free() contains no order information, but just the used-to-be
>>>> head page and the remaining 511 pages are free. How does Intel Xe driver
>>>> handle it without knowing folio order?
>>>>
>>>
>>> It’s a bit convoluted, but folio/page->zone_device_data points to a
>>> reference-counted object in GPU SVM. When the object’s reference count
>>> drops to zero, we callback into the driver layer to release the memory.
>>> In Xe, this is a TTM BO that resolves to a DRM Buddy allocation, which
>>> is then released. If it’s not clear, our original allocation size
>>> determines the granularity at which we free the backing store.
>>>
>>>> Do we really need the order info in ->folio_free() if the folio is split
>>>> in free_zone_device_folio()? free_zone_device_folio() should just call
>>>> ->folio_free() 2^order times to free individual page.
>>>>
>>>
>>> No. If it’s a higher-order folio—let’s say a 2MB folio—we have one
>>> reference to our GPU SVM object, so we can free the backing in a single
>>> ->folio_free call.
>>>
>>> Now, if that folio gets split at some point into 4KB pages, then we’d
>>> have 512 references to this object set up in the ->folio_split calls.
>>> We’d then expect 512 ->folio_free() calls. Same case here: if, for
>>> whatever reason, we can’t create a 2MB device page during a 2MB
>>> migration and need to create 512 4KB pages so we'd have 512 references
>>> to our GPU SVM object.
>>
>
> I still don't follow why the folio_order does not capture the order of the folio.
> If the folio is split, we should now have 512 split folios for THP

folio_order() should return 0 after the folio is split.

In terms of the number of after-split folios, it is 512 for current code base
since THP is only 2MB in zone devices, but not future proof if mTHP support
is added. It also causes confusion in core MM, where folio can have
all kinds of orders.


Best Regards,
Yan, Zi
