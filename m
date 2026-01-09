Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F07BD0C263
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 21:15:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33B1C10E946;
	Fri,  9 Jan 2026 20:15:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ADwrk51p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010070.outbound.protection.outlook.com
 [40.93.198.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76CBC10E945;
 Fri,  9 Jan 2026 20:15:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bXla5m6sAfAd9CGOJ481uz5NefanjDlCzwCkFPsNcKC/qJsnW1kLw1TnDrNzls7xC8H4ZdbzNVwAv8whnCnDmbNF7PFofDBWJNiQl71N0bX2wL2zbbuCylEboZLqPvFg9mdea4zOMdxhhJy0fJ/i6drFEe9KsVLmjqCsCpV7KxnlxvkS+MENylhns+SQiwHYlRDXjoIzu52pUN8Hyt7XhBTaI33nWCcA50Sg+SFR/QZzZ5AxTE4UKKXVsBbiIccx+zQhQQIiy2q6xJP5wZqB7jI5fWESqFJTCgGBUXmz8yW6ALR1SdeWZShjvCnaGJ9PlFzRwDbodHniHholwdtIXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4j1IasKNduDsp0BX4CNZcgqjAGISS9CoBCDSAjQBeI=;
 b=T+MslHbofn8iSWzu0ThwARlVtSz1SLsaCOILjxlf5X5feYppG1tm/2D6h2EEthsadjZY8fStSnMG1ZGimI/rvgtMbKgGvWG40wT71KWzFGB1zyrkdh1ejHmGO1bBEY0+XeBkJz/juRxcCEcSxwrvE3yhk5vbxuBy9lo4iz0IKqOz1QNpVL8m/3iEW3bQA333bjaxBv/d3EzkhRzaQ+4qRWn4Yk+zKESPYwY4ykvW1hDIbq4Vmjekylb+1HZwIETFQ4T6HvitZIB3yzjEu8NeYb2L/DPKer7xUI3yfSVKTFKHiPFyTLwZ65xfPUw8XLBV5W41I8AqcWizJ6DBZDXBGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4j1IasKNduDsp0BX4CNZcgqjAGISS9CoBCDSAjQBeI=;
 b=ADwrk51p3Vgezo8sxV+4BLWaiR2n1stb92bAU7NNsO9jNBc7OFTMReOhGVHjpTie9Jwnv4V0uAI8q/Tu74BzfAdCwz2ktQiClen8hIAPLCAZbbPfzZc4jvHYTzT96WLHREthj/9ohhaLQl5+719YeDHdglCG+0iIkCsNem7TsUO+Mc4l1Oa5ggBAs/5K71Djqbmy/gpPmrER4Hh6eaXN/F4A9jR2J26Cij2DCKRoErVdIoW31qP2KjMeZ0RPomDFLHvEcls00JrJX86snW80YscBL365xEKjTYHd+IQ/pRkT7aYJhpq6tXnEI0lyF1pQ6/TLRNgOSMxoPTMTTr6svg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.4; Fri, 9 Jan 2026 20:15:20 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.9499.002; Fri, 9 Jan 2026
 20:15:20 +0000
From: Zi Yan <ziy@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: =?utf-8?q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Balbir Singh <balbirs@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, David Hildenbrand <david@kernel.org>,
 Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/7] mm: Split device-private and coherent folios
 before freeing
Date: Fri, 09 Jan 2026 15:15:15 -0500
X-Mailer: MailMate (2.0r6290)
Message-ID: <B8B15539-F97A-4D6B-BF58-FC75397C429F@nvidia.com>
In-Reply-To: <aWFe9S2DGwfD2smO@lstrano-desk.jf.intel.com>
References: <20260109085605.443316-1-francois.dugast@intel.com>
 <20260109085605.443316-4-francois.dugast@intel.com>
 <d1d80b81-678d-4d28-9ac2-95cb74824e73@redhat.com>
 <DF5A6B81-7811-4654-855F-8EAB76CCCE51@nvidia.com>
 <aWFIW6XCKXPpIinv@lstrano-desk.jf.intel.com>
 <D9ED5F01-E758-4A89-87F2-ABFF5197231D@nvidia.com>
 <aWFSGc7MIUqVsilw@lstrano-desk.jf.intel.com>
 <12A9DCBB-0B59-4D63-9BA8-9F99570AFA80@nvidia.com>
 <aWFe9S2DGwfD2smO@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ2PR07CA0013.namprd07.prod.outlook.com
 (2603:10b6:a03:505::15) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DM3PR12MB9416:EE_
X-MS-Office365-Filtering-Correlation-Id: e5352e50-763e-4fd6-2656-08de4fbbcff5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dVFPclQ4amFGUFpHYnAycG9PSXVjdjYxMlVSc0dSS3J4clkyNE1OTzJiNGpq?=
 =?utf-8?B?SkovTXI4dEpyd2lzbXNtRFNqL2kyYm9JVkxSc3JCM2tFeHdiMUZ1aDdyTWtk?=
 =?utf-8?B?YVBIdTRoWTgvVzhEeWFvT2dDL3lkTDlsc1J6M284SjBJZmJ0d1puck82bGhJ?=
 =?utf-8?B?OFUxdGJhK3BqY2preGpReEhYYUh6Z0h6UWMvOVNBMTBIRTBCdURSM21pQnJH?=
 =?utf-8?B?L3daUEFvQ0tGSEJ6b3laZG1Kc28yRFNBbjZBOG1MM0d1Y0ZhcjFCQTE3USs2?=
 =?utf-8?B?WTNkQ3ZXY1gvblJTakp4UlVxNFM3d2dwODRSRWovTEZ3OEJ0YXc1QzdhYzU4?=
 =?utf-8?B?M21Xenc5WGxjYzljcFVSMVpVVlF3cG9SK1U1OVA0VU5Zc1ZTaHVoc1BLWWRm?=
 =?utf-8?B?YURNNFVXek9nTGI3TUYrZGNaaDJlRWVqY3VJbDNsWExITmhIaXVVQnBVMDlj?=
 =?utf-8?B?bVI0cFoybTEzR3NrdTNkZFRnMUQ5dExodnF5VkxNaUQ4THJIdlJlV2FPRnBw?=
 =?utf-8?B?aHhFeUE2MElJZWI2aHBYV0Q4TTZSQjNlbGFSRWJRRjdobDNocmlyUFZKbUlv?=
 =?utf-8?B?UGZtckRsajk5TGpwMk9LTlF3SG5zWkk4ekJFSDM3eU83aUZGOTlVUllTUGll?=
 =?utf-8?B?c0F0UzFQbktOWlRFR3VXc2tjaW5EN1l5ZzNYOVJzNnZWMUJ0aTNNU25FMyt3?=
 =?utf-8?B?Z2E5UTRNQmpGWUtRQTJnQzZhN3NZWTJsNzZvZFVmTkVXbHdlKzZHWTF5M3FW?=
 =?utf-8?B?c041cXI4WXR5U0hQc3ljOGdYZ1FwUkIzK3lmdWxMV3NKMkNHQXFUSUtNNkgx?=
 =?utf-8?B?bW1SMnpJcTRwUVI3MmdUT2Z5R3BsSkcreUdITVJ6eFZqeE8wRVFkK0VCcGJH?=
 =?utf-8?B?SHdzaGdxenNSUVg4UzZkaFVlNDZ3OUNoOElmU0JzMUpGSG9sK2ViZnlKaHpV?=
 =?utf-8?B?dWQ1dzc3clRxRHd0OXdWY0JoamYwT0NHZUJtdlVsTkxMaWRYTTgvQmRMak1X?=
 =?utf-8?B?Y2srTXJSOTBtNjNtM3VlTkxhYnE1MTZRbXVWK1FJb3k4Z0Y3VjA1clAyalZF?=
 =?utf-8?B?LzE3a1diMzM4UkVzSHcxR1hkYktYOWdSalRoUVFxYWxKZUZTNVl3UDFqU215?=
 =?utf-8?B?M2oxK0VOWHloNjIzWExTZ1NEUlVxa3BuQjl3d2ZZYml3WjN2OXRDaW1YbkZa?=
 =?utf-8?B?aG5CRVAyeFNMNENUZEt2VDBWUDNXMFQ1dElyZVp0Ni9nMGFTVjZhWWY4N2Yz?=
 =?utf-8?B?VnBqQzMzbkIvZ1ZmN0x2cDQ5eVVheWgvamh2N29iT3FoS1p0dURHWVFBdSty?=
 =?utf-8?B?YWF6NnRPMGNia290dXdMRzM3MFpGemludlM2VjEvQVVKTVFFelM3aDhwSDFP?=
 =?utf-8?B?MWVJMllzbmp3ejJTSWV2ckxRaElxZHlZbE9sV1pxR3oraW5LTktNRHRYTXVR?=
 =?utf-8?B?QW42UE8rU2ZUN1ptQXZ5QWRmWGk2b25xWjFJSlZJMUdoTjdjNUswMEJ1UklW?=
 =?utf-8?B?N3JqM0xNQU01TFIwTkJ2c29zNm5rNnNaNjR3OHhLZUtCNTRTZFlPTzk3eDJs?=
 =?utf-8?B?cnE0QXlTZVZEa0tNODZTRVZVWXhUZXJrVFpkWnVRdG9RYTBGMUwwejNIdUMy?=
 =?utf-8?B?VG9lZlRFRzN3VzhCdzA3TzJwc1VYYTFvbnZ6Q1pRR1N2M3E4SnM1U2FzYkJm?=
 =?utf-8?B?M0FGdXdrd2dmWFRQcjhQbUZXenNsUEZTYW9WTzlUL3h4SXp4TVMwVjZCcXJt?=
 =?utf-8?B?M3R5Rld5WGhkc216bDBNQ3RUSUhzTGU3V05RYU9ZY01BYVlsOEdrSExlZXVp?=
 =?utf-8?B?S2thcDd5RVdwMVIvZlpZV3ArVmZiWXZpQ0oyS1p2U3lVUjBKeVhTUUMyLzFX?=
 =?utf-8?B?cEVMNHA3S3p5dG9HNHEzQ0lrWDU0cVNDTkFXblRuS2JDNnhQTm9wVnFVQXdD?=
 =?utf-8?Q?Bk6oH56PPHPKeuUxogb+yZEtdVCXYBaH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9473.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0pCWU0rb0J6WFk0VHk2MkFHTUlaS2t2bERiUTRYSE9Sa3FQeVpFUVArbmZ4?=
 =?utf-8?B?b3F1ZmJCOTdsUXg1UzZYZm9rdDJDTzl4ZjhHR0E2L1lTSHNBdHplcHZlSXVx?=
 =?utf-8?B?S3RabUgvSXNGL0ZGYjloTUMzYVhvMmozckxRSis4RDNjUzZlVmxOY2tUdFg3?=
 =?utf-8?B?aFpMODBCbFhqK1F3a2tMaHBSMVVkZUk2cm1IeVBNU2YwQU42Y0xRVFowSkEz?=
 =?utf-8?B?enBFOEpqT1lOK1BYK0tZSVZRQVJZQ2RpYmVvSGhYbFVHZGV6dSt6bG94WDRQ?=
 =?utf-8?B?RjExcmh6MXVzWGhmWTVCaHJtV0hZc1FLSUFsZEVVWThKandLM2ZQR2VXZHJL?=
 =?utf-8?B?RHlicUN6TUhJM2FiQUJOYUJUNXp0N2tyWmVYSEFUWmcwU0E2Q1FVaTRmSXAy?=
 =?utf-8?B?b1I0cm1KM0VHc0RVSHZNS0dGcWRXZ3dGWWlaMjFjNFA3c1ZVS0w2eHZYSjJJ?=
 =?utf-8?B?Y0tGb3JrR0NMNTVGMDUyc2NjeDJVYUF2a0tvMDFEa0dYSGkxR1Vqa1MrWHFY?=
 =?utf-8?B?ZVhkNjh1aGdsWUIyamhVRG9vS0JGcURqZWxNZlpzMnRmUVRKMUNZU2U4VHFZ?=
 =?utf-8?B?cDZZNmxrMEdna1gxVGF1T0FtcVJZTWo2dW9qUHQxaHptS005Q1E4M0U2UUhi?=
 =?utf-8?B?UVpmQWZaZE93ZU1hbWUyQnVOaVV4S21xa3U1SGNCVUNQRnY3c1lGalNmc1FR?=
 =?utf-8?B?MnhBTDZ2L1kxRVIxMTczb3lKL094MFJrSE90L3pEdU9kMm1vSU1jOE1nN3dK?=
 =?utf-8?B?TXNXWFdPTHBRRWJuQ3pha0V5bVFmczZIaFVjaVV5L1d6dU1qR09aeHBWbGhQ?=
 =?utf-8?B?RkNMajU2U2tkQ21RUzY4UHMreGVsSy9iZ3dKMkJXSHRkeVNLOVUzU1dpdUZp?=
 =?utf-8?B?TlhYUTJOT1E4RmtUMHlmbWM5bjVtVnlLQ0Q2L2VFTExSL3R2MHloR2dRZExv?=
 =?utf-8?B?bG1tWXBjNllvRkthQWdnbzhLelluQUZGOVp4UEhYZ3dIK01TMTZuVm9zL3NI?=
 =?utf-8?B?TE5hK3JUSWN4UEZ2M1hhV2xDSVFLTzN6Zm1OUmNtc1dFQ0JqMUw4cU5ySlo0?=
 =?utf-8?B?WDZKMG5QZXZHYmdpMjBjdDB0akJPQ2RHdXhUd3NIanAwS0ZXOUt1MEZ0L0Uz?=
 =?utf-8?B?QXQ5UlhMdkhqK3lSeDNhYWliRVV0aE5UNFNqdEkyNlZJZVg2YzJxRjNNUzNM?=
 =?utf-8?B?Vi9TYlQ2di9sWkpkOGZDMG83R25ySHdQdHFXR2V3NlUrR1hWcVV3elRBSDg2?=
 =?utf-8?B?TFByWWdZQlBTQk5DNU9zTGk4Z1Y3elZ6ejNFU1ZsTFAxR1lZRGI3YzNzdW5O?=
 =?utf-8?B?QzNkdzE1b093Z2ZOT2lPTWcxR1RRblVabWdQKzZLVTFlQVpDdjZySjd4cDlo?=
 =?utf-8?B?dytHWHMwMmh6cjVOT1R1cW5PVlNzamsrQ1BQQXFETTJDcFdqUUkxV0wweVM0?=
 =?utf-8?B?TU1VcEVvM2RoTjZ3VWZLU1puUmR3dzgydDFUZ0Y0Tmx1S1BGZVJ3YTZtaGd6?=
 =?utf-8?B?dldwN3g2U2ZXaXVmK05wbSsvVFVlUTRYUlVubUVDN2lQSDhSNWZhRzREQXNz?=
 =?utf-8?B?aEo5Ti9kMmdwRGcvNzZvUjJHY2NGdzA2aGtNR1RQdmFxRW01TGpJUndjYnZY?=
 =?utf-8?B?YlZhTzJUbUtoTGtNNS85WERqMDRialYvVmVTMm92MUVPRzliUW90eHVNdlcx?=
 =?utf-8?B?TzZHcVViOGlLNUs0Q2FhMHUvNEREc2hZUGo1VDlaT0VuWTQ3dVprWWZiUHdK?=
 =?utf-8?B?ekdQOExKNW5VREhzVnRFNE1ZMlNkQVZBcFYza1N6bm4zd1hNR25Ed3d1bmNF?=
 =?utf-8?B?SEIwdkozTzZERE80eFkzSXpZd2wvS3dwVUlNYjNGek0wbWdOUzBlTXhHc3pJ?=
 =?utf-8?B?U0pNUWZ6OXo1MTVhOU5rbE1LeVRtUm1Ta2R4aDNoV3BaMkl6cTMybnlwakRQ?=
 =?utf-8?B?TXhUU1dRR0h3c2dLNXhoWm05Z2N4Q0YvN2NRR1NIVXBrclo1RUxKRUliRnhR?=
 =?utf-8?B?RGxuSjhPMy84RXZqanl0UzYrUk41RllsSm1nR3RkT0Y0TVBXM2pOS1F6MXB3?=
 =?utf-8?B?ejRKbEYxVnl4aEx5WnNTSUhMNUZjZ0dVbVRQM1FqZjR2YW91VzNkNHQ0UkFq?=
 =?utf-8?B?TUJ4d2NhVERkZkVJdGdWZEl6c0FTd2dFSUFaalBneENVZ2pTQTBlN0pCekgv?=
 =?utf-8?B?L3NPTVFIRnVkWnp2RjA5TGdZNmgweEZUR05INjJDaEp4WVQ3MDluTWg0MkFa?=
 =?utf-8?B?eVFTQVhuVTkwR2Z5MmZ1N0QyVEVHVCt4Wi9zZTZkQ0RobVFmRkMxYmtOOEFM?=
 =?utf-8?B?NGw0dmw1WVNSOFErQmhPb3liY1ZTOGdEQVg2d0hzeEhPL0ZMOUVVUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5352e50-763e-4fd6-2656-08de4fbbcff5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 20:15:20.1010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: db0ngft63O0Qtyn9LgN7bjvJuLmqOSgJeGOOqFVj/BN1JHpQTQIrCPCNlbe+AqEA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9416
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

On 9 Jan 2026, at 15:03, Matthew Brost wrote:

> On Fri, Jan 09, 2026 at 02:23:49PM -0500, Zi Yan wrote:
>> On 9 Jan 2026, at 14:08, Matthew Brost wrote:
>>
>>> On Fri, Jan 09, 2026 at 01:53:33PM -0500, Zi Yan wrote:
>>>> On 9 Jan 2026, at 13:26, Matthew Brost wrote:
>>>>
>>>>> On Fri, Jan 09, 2026 at 12:28:22PM -0500, Zi Yan wrote:
>>>>>> On 9 Jan 2026, at 6:09, Mika Penttilä wrote:
>>>>>>
>>>>>>> Hi,
>>>>>>>
>>>>>>> On 1/9/26 10:54, Francois Dugast wrote:
>>>>>>>
>>>>>>>> From: Matthew Brost <matthew.brost@intel.com>
>>>>>>>>
>>>>>>>> Split device-private and coherent folios into individual pages before
>>>>>>>> freeing so that any order folio can be formed upon the next use of the
>>>>>>>> pages.
>>>>>>>>
>>>>>>>> Cc: Balbir Singh <balbirs@nvidia.com>
>>>>>>>> Cc: Alistair Popple <apopple@nvidia.com>
>>>>>>>> Cc: Zi Yan <ziy@nvidia.com>
>>>>>>>> Cc: David Hildenbrand <david@kernel.org>
>>>>>>>> Cc: Oscar Salvador <osalvador@suse.de>
>>>>>>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>>>>>>> Cc: linux-mm@kvack.org
>>>>>>>> Cc: linux-cxl@vger.kernel.org
>>>>>>>> Cc: linux-kernel@vger.kernel.org
>>>>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>>>>> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>>>>>>>> ---
>>>>>>>>  mm/memremap.c | 2 ++
>>>>>>>>  1 file changed, 2 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/mm/memremap.c b/mm/memremap.c
>>>>>>>> index 63c6ab4fdf08..7289cdd6862f 100644
>>>>>>>> --- a/mm/memremap.c
>>>>>>>> +++ b/mm/memremap.c
>>>>>>>> @@ -453,6 +453,8 @@ void free_zone_device_folio(struct folio *folio)
>>>>>>>>  	case MEMORY_DEVICE_COHERENT:
>>>>>>>>  		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->folio_free))
>>>>>>>>  			break;
>>>>>>>> +
>>>>>>>> +		folio_split_unref(folio);
>>>>>>>>  		pgmap->ops->folio_free(folio);
>>>>>>>>  		percpu_ref_put_many(&folio->pgmap->ref, nr);
>>>>>>>>  		break;
>>>>>>>
>>>>>>> This breaks folio_free implementations like nouveau_dmem_folio_free
>>>>>>> which checks the folio order and act upon that.
>>>>>>> Maybe add an order parameter to folio_free or let the driver handle the split?
>>>>>
>>>>> 'let the driver handle the split?' - I had consisder this as an option.
>>>>>
>>>>>>
>>>>>> Passing an order parameter might be better to avoid exposing core MM internals
>>>>>> by asking drivers to undo compound pages.
>>>>>>
>>>>>
>>>>> It looks like Nouveau tracks free folios and free pages—something Xe’s
>>>>> device memory allocator (DRM Buddy) cannot do. I guess this answers my
>>>>> earlier question of how Nouveau avoids hitting the same bug as Xe / GPU
>>>>> SVM with respect to reusing folios. It appears Nouveau prefers not to
>>>>> split the folio, so I’m leaning toward moving this call into the
>>>>> driver’s folio_free function.
>>>>
>>>> No, that creates asymmetric page handling and is error prone.
>>>>
>>>
>>> I agree it is asymmetric and symmetric is likely better.
>>>
>>>> In addition, looking at nouveau’s implementation in
>>>> nouveau_dmem_page_alloc_locked(), it gets a folio from drm->dmem->free_folios,
>>>> which is never split, and passes it to zone_device_folio_init(). This
>>>> is wrong, since if the folio is large, it will go through prep_compound_page()
>>>> again. The bug has not manifested because there is only order-9 large folios.
>>>> Once mTHP support is added, how is nouveau going to allocate a order-4 folio
>>>> from a free order-9 folio? Maintain a per-order free folio list and
>>>> reimplement a buddy allocator? Nevertheless, nouveau’s implementation
>>>
>>> The way Nouveau handles memory allocations here looks wrong to me—it
>>> should probably use DRM Buddy and convert a block buddy to pages rather
>>> than tracking a free folio list and free page list. But this is not my
>>> driver.
>>>
>>>> is wrong by calling prep_compound_page() on a folio (already compound page).
>>>>
>>>
>>> I don’t disagree that this implementation is questionable.
>>>
>>> So what’s the suggestion here—add folio order to folio_free just to
>>> accommodate Nouveau’s rather odd memory allocation algorithm? That
>>> doesn’t seem right to me either.
>>
>> Splitting the folio in free_zone_device_folio() and passing folio order
>> to folio_free() make sense to me, since after the split, the folio passed
>
> If this is concensous / direction - I can do this but a tree wide
> change.
>
> I do have another question for everyone here - do we think this spliting
> implementation should be considered a Fixes so this can go into 6.19?

IMHO, this should be a fix, since it is wrong to call prep_compound_page()
on a large folio. IIUC this seems to only affect nouveau now, I will let
them to decide.

>
>> to folio_free() contains no order information, but just the used-to-be
>> head page and the remaining 511 pages are free. How does Intel Xe driver
>> handle it without knowing folio order?
>>
>
> It’s a bit convoluted, but folio/page->zone_device_data points to a
> reference-counted object in GPU SVM. When the object’s reference count
> drops to zero, we callback into the driver layer to release the memory.
> In Xe, this is a TTM BO that resolves to a DRM Buddy allocation, which
> is then released. If it’s not clear, our original allocation size
> determines the granularity at which we free the backing store.
>
>> Do we really need the order info in ->folio_free() if the folio is split
>> in free_zone_device_folio()? free_zone_device_folio() should just call
>> ->folio_free() 2^order times to free individual page.
>>
>
> No. If it’s a higher-order folio—let’s say a 2MB folio—we have one
> reference to our GPU SVM object, so we can free the backing in a single
> ->folio_free call.
>
> Now, if that folio gets split at some point into 4KB pages, then we’d
> have 512 references to this object set up in the ->folio_split calls.
> We’d then expect 512 ->folio_free() calls. Same case here: if, for
> whatever reason, we can’t create a 2MB device page during a 2MB
> migration and need to create 512 4KB pages so we'd have 512 references
> to our GPU SVM object.

Thank you for the explanation. Adding folio order to ->folio_free() makes
sense to me now.

Best Regards,
Yan, Zi
