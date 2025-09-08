Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7A2B4819D
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 02:05:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD32E10E31F;
	Mon,  8 Sep 2025 00:05:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fb6JkZlK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2055.outbound.protection.outlook.com [40.107.236.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA6A910E328
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 00:05:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G6zYM/IANgB7GW4OPZKixPPjtxZVTbB9jm8PjBfrxuGVHL8VGxv2nRBfthfiJq+4B4S3z5N3MnzRdVnfRlOPLBQOwGeLuXKQXBikS+Ionz9HWE0mTQWx4vGR4usz/C1ykOf3h1hjGurfL7HJhF68ECodovjTA+9WtERkT6rkPvfHhRdcfRLR5K/dwk9s9l5yPjCMCb3d29MwABx5c/jaiWUFgxEwPpZomvcPzJjJUiavb6C0BNB8U1fK3kyYGmhaT35F89xSRjiwdrXY+q0tWuS/0AEYNQcgWzNoK2RwNPpaiAq4c0M1cxrlRmyewpZZqgVtBgOg+X2ny7keUrMjQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kpj0DgtzxR5aJn4cHUzjRxXQ+GZQuw6pBgp0jLjQikM=;
 b=chu5YH8FoSPcKnyfaMdSNNGhTuTpLZM6W6oHY33fAfHbMs3752yE/bmY1SN9gItNdKrI1uqWRSkWV9Wid68GMZdZX/M0OO7zyQaEZXYcovFtaEOreUl20Hdop0HdrQBEECSM2HMxJutBw2poQosAzUSApFvf7oAa8EehuPtMEjp62UBQrKt+OVVjLcGiwojDaP76sJC4U3z3bDVDcoABKKl64bC4gdWz7tnCaotEMIGc3VqmedzL9/65XasUh3OQPXQj1K5xe/wNjG6e0koMz0ZqECrXb6+ZfOnIvBmma3VL8w8yilYzK7GIvBngjKVMKIKzwgG6PBARa8/M17tZ7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kpj0DgtzxR5aJn4cHUzjRxXQ+GZQuw6pBgp0jLjQikM=;
 b=fb6JkZlKZcq5T0RKM3Y4mUopzFVP3MqDo1E0dVLPiXYfdyEFqOrvppkwwtYjxk7C/tLokpZyJ1WhakfueKJU+5RuGjH19isapu9oS689sm7JM9xw9XdXeljm12alIDAPsYCYKDSPVR2wsRcp3ZGx/co12AjXgw9YmffvNP8IXUrF+rbAP/bWbrs6Tomk0XWpxtFEKx3O1IEQ5XIzKpfSgJ8lvQcRYbuX3T0TExqq/Tn80RpGh4n17+7ZHibawYnxNa+Os/hSRDjhiJS94Go9bRhMgIW/6aBHjoEV9yuLQvfMjI8hLTILwuo/PLE2OxemfsS+ApvLu3eI931hrW9GKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by DS7PR12MB5887.namprd12.prod.outlook.com (2603:10b6:8:7a::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.19; Mon, 8 Sep 2025 00:05:42 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 00:05:42 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: damon@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Balbir Singh <balbirs@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?q?Mika=20Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [v5 12/15] selftests/mm/hmm-tests: new tests for zone device THP
 migration
Date: Mon,  8 Sep 2025 10:04:45 +1000
Message-ID: <20250908000448.180088-13-balbirs@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250908000448.180088-1-balbirs@nvidia.com>
References: <20250908000448.180088-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR21CA0014.namprd21.prod.outlook.com
 (2603:10b6:a03:114::24) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|DS7PR12MB5887:EE_
X-MS-Office365-Filtering-Correlation-Id: a52fbb00-e251-4069-1e8d-08ddee6b7384
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1h3RXpTMVVTdmlydHFKY2FzaUN2eVRwcjlEanFPblYwRU15UTNUdENEa0lr?=
 =?utf-8?B?RFJoaHVNcTUrN3JkSjBHY1dtZ1ZLa2V6eHBnMG5TZVZqNWVjaXVHL09EWUdR?=
 =?utf-8?B?akViKzlYK3B5SllHVHpkaFZ5emxDVzRTT3I4bmNLTERmTnpRS1hRN0tHNjNV?=
 =?utf-8?B?SElmZFNYbW5mL1NYZmNIRmNNVjRsYlcyaThBVUI4eWdENlVwaWRINGJIMzFH?=
 =?utf-8?B?TUlWbWZVQUQ1bTVuLzZUQ0F5WWZSbk11Uk9lTHBmK0JSNkpKUnVmKzN3dHRt?=
 =?utf-8?B?STQyYjVXQnhyNlpQckdrZldkK1ZNSVZ4K2JUSVBlMWVNc1NmWEhkRDNrMUV4?=
 =?utf-8?B?R0tINUtQaE1WWVpXYWlHQWxMUzd5N0JmdHR6dUx6S0tqa3ZPZisxYXh1R1No?=
 =?utf-8?B?cFVxRUVVcUMrd2FyTVl4cGJjRThERHc2N0pJUmlvNmwvSE9MQkgySTlJNnAz?=
 =?utf-8?B?TmUwbnFXck5oRFZ4Wi9OVWozdERjaTJzcE9lWlRhdG5zVDljUnBnaU5JdlRU?=
 =?utf-8?B?ZU1ENkhjdFlrWUs1U3R0aVNjVnR1TFNLRUpyNGZGQ2J4TnV6MTZPS3ZLMSsv?=
 =?utf-8?B?Qks5VmdRRExZaEpMU0E4SmVKL05RWVlFbmFZUWtIaFBVbU9qZEFWRHNLTS9H?=
 =?utf-8?B?Zmk2NjJEbzI0MjE3MHI2ekRueFNJN1JBNHd5dWhMUEdZWXBSVzBqOUg0djdp?=
 =?utf-8?B?MHpDRUZNZWl4dTRyVHdiUUVZd3ZxK3hJbVdXejIyU1pQRjMxUkhiNEF5S0Nl?=
 =?utf-8?B?alJRUi9XYTJtN3VCRHRoVHVpRldYMVZRdlJIbTdUVGZaVWZhNGpYMG11YUhG?=
 =?utf-8?B?aExreE1RV2xHWmFjRnBFTmd0Qjg4d21iYXdIR3VGNkdVazdBY0FLdkJ2Z1Ba?=
 =?utf-8?B?OFYveGpPbU92Mytpelp6TGZMZU43MHlRamgrN2l1dTBSMXcrR0txYVJJZmJK?=
 =?utf-8?B?NVlCeGVjVzRZR01PdHdSdytGdDBEVHIvdnRmTytCdUdXL0I3cnpYMjRGVUxS?=
 =?utf-8?B?V2lUK3VUVUpTRnM1WnZkYm5sMmt0MXF5Q2k1dE9FVlQrd1UvYUdSd3JnZFF2?=
 =?utf-8?B?MW5mL1J4UkNyNXNrUVVKSzZWWlJ1YjFrVm5NdGlNQ3Vzby91OWd4NVhPcVFF?=
 =?utf-8?B?QWMzeUFMeUI5aTBtMTFZZVptRnFOUnppMXFyVGdPYTloQU1ldzY2UWhYWjhU?=
 =?utf-8?B?UVJGUmF3L2RyZms2enhFTlQwOTBSUVZ1SWc1Z2FPdituWHpLV1E1bjZBY0R3?=
 =?utf-8?B?RTJTejNEL3dCaDFjZytQN29FYVdWQTUvVUhTejE5T2h3TFVLNk9iNlZXYnlP?=
 =?utf-8?B?OERQcm9wbk4wLzJtamV5Sll0b3ZpUGUrOFMwM0drZTBodEg4MkYzL0duVWxR?=
 =?utf-8?B?TmRDUXk4eFJVU1J4UXl6WjIvNE54QUZhT09tdzhXWE1mMW9RbGRUMVExeVhw?=
 =?utf-8?B?UU9VY3BkbStoeVlOcDVFTTI1cnlMdFgwcVdMd0cwWmJpNzY4ckIrRWFGcE1J?=
 =?utf-8?B?TUI5Ulc0WlhtMmd5ZCsvdnlvRTg3T1pTYW5aOEhLU1ZxclNzcXdBWE8xbDUx?=
 =?utf-8?B?ZmVjM2lhUWZNV092M0x1dktTL2hDdnJRRERBa2FpcnR1SHBvc1pLY0dKTVJO?=
 =?utf-8?B?VkMvOVVtaktHTGY1eEE4ZytGd1lYdUlPZnZQVmlrSTY2azdVZFdHQ1d4Sm0v?=
 =?utf-8?B?SVFTc0NYYUFCdGRFODZVYVFIYlJEeTh5b0dobEN2bzdBNk1qVWVaWEV2RnF5?=
 =?utf-8?B?R3Y2SGtHQ1drcHhKQURCRHVUTHQrMFQreGFtNDZPS01zSHRkWkRxSHQ0WTd4?=
 =?utf-8?B?THl2OTdOWnB6aWljaVV3NHVUTFUrYjQraUgwdE53dzlKL3lZZkZqcVAyWEVT?=
 =?utf-8?B?S0VQME1SRGEwK1h6REppaTVCaHJnT1pDYWxOYnZLeEpwdUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUgxcmFVcXhlNzV6Z3JqMXQ2bXVERFl0VVBaQWE1UkdsVGNydk43ZlQzb1c3?=
 =?utf-8?B?bHIwaHA3bXVjWU9FcUdaYUNTNnhxSFRwdjlWK0t0WW0zUS80QjByLzh1dVlY?=
 =?utf-8?B?aGRpdnoranEyTXZnZ2JlRGYxMGVsRmpKTzF3aEVTVFJqbm1JVG5lM2NMTU8x?=
 =?utf-8?B?RHNLTndGcllwOGNXaS81TGt5U2Z4UlZ4QzduTGk2NlVhZ2UrYTh6RkFvVGxy?=
 =?utf-8?B?ZTNZbk1RakZWbGw4Y0hIYXVoaytEdGF6bXRtaHA2M0F1amJKM09ZazllZnQ2?=
 =?utf-8?B?cmJvUGVNQ0o2bVhpWmVTcXl4cUxlVnRrL3JXUSsrcWhtVnFqdDcyRHZ5UW1k?=
 =?utf-8?B?Z3VZK3dlVEFVdWxFNHVFQkhUQW81Yys3em9vaEJjcHNRTHJiR05OaElJQ2VL?=
 =?utf-8?B?Qk80bjBUQmF2bW52WTdWTWNLRkJwRklnTlNJc2w3ZzVMcnVuYTc2MFZ6Tkk1?=
 =?utf-8?B?YnV5V1M1b3RpaW04VlR5Y0RTV0FjRXlwOE9xckwvT0d3UHBoWTBYK2tPM0Qr?=
 =?utf-8?B?RlF1bmc3T2VocGk5R1dkeFZYbkdTbzZSTXdWVGUyWDZWVDVaaSsyQzZzRFdV?=
 =?utf-8?B?TmNQSTNEb2pmWDkxbXduTGpMUjNIcDRFbTVMUmxLb3FJLzZ6d3lKY0hFR0U5?=
 =?utf-8?B?RG83YXN2NDA4Y2xsTTV4VndmN25RZUFuMVlTK2dyN3JVdVFSOG5JMmV0dXo1?=
 =?utf-8?B?N2UrclJEdzJlZHdtRFBVbkJRcU9JTkVQMGl5Z0Jyb2pwZkRnd01sUkV3akdi?=
 =?utf-8?B?V0RGd2Vma1gydmErM0FPM28wZlVFZDRtWGNDNmRUWDJLZWRUWUc2NHJ6eUUx?=
 =?utf-8?B?ZlhYNWx5UGRlUDI2dWRRUURDWTVjOFRETUhCVFdTM0JTZGJVcUhVR1dISVdU?=
 =?utf-8?B?QnlxTm5OTTNRZUJvNmFpWUZ1NnFzYjlHV0EyaENNNDhKV05VU1ZOK0lJeXp2?=
 =?utf-8?B?cExQcjBsVmtPajB0MGg1NzdoekVUNFNpMDRQTDQ0dHZ1L0NVdlBibzAyQWtT?=
 =?utf-8?B?QVRZdVN4QzJ2Z1V3OUhoLzRDVHZqSm9XL1Vkai9OZ0tIcHJ4Nmx0czRlZllq?=
 =?utf-8?B?c1M4K0Iya3pBVlpjaU1rYXNFRk5RdlliQ0VLK2VBMTlrNnNVUDR6SWR5aFVU?=
 =?utf-8?B?dnRKUG4xSHZkc1JPOFJwSDA5ZEpNMXVhOENMVFRubFEvU1d1VSt4R210R3Z6?=
 =?utf-8?B?bTJUZ3pnc2QyNWo2cU1XanlpekJLR3NPQ0x6cUZTTHp4cVpzTlJzQkx6R0RZ?=
 =?utf-8?B?VHQ5WkhuR2pmYVVnMkFiUXhZZzYvenVQdlh0bWttUUp4RHlBQW52d1NGNmdj?=
 =?utf-8?B?Sm1UWHR6VkUyTUhWQUhISHJtY0lTdGJUelk5MDBxTlBSZFFMemswN01qN0FF?=
 =?utf-8?B?N044VjhqOTNBMGVJbkdTZlRMNVpabjRUY0xqZ21mWkZ3ZEtsZm4zQ1NrSk1y?=
 =?utf-8?B?TXZIZ0JiazNQRWJPaUIra1RveVZrS2pyWGc2ZUZPcmt6R3k4eDc0bmRzZmZz?=
 =?utf-8?B?ditEZUxBRUtNaExoV2xnbHMyYWpiNEN2OUZlcEhlZnUwY3paVHIrOXZWTklq?=
 =?utf-8?B?Y2lBRUkzdng5QWxxSUFvbUo4QkpBck1CQmcvMFpEbS9CTGs1Y0Y1TERHeldE?=
 =?utf-8?B?amR4QjRHRUxOOHcxWElEMGIrSTRTdG42bEhhdXlPM1J4bmhrLzdBVm12UUhF?=
 =?utf-8?B?NDFSSnBkQy9JcTU3aFYvc0VuUGt6b1RLTlhHTDJaR05jM1NXZUtTSUFLTStB?=
 =?utf-8?B?NVlRajRBYTFYRHp1NUxlcnNYaXZUQ0JKZUZGS0lRRkdHWUU2cCsvNnk5M1Nu?=
 =?utf-8?B?OUU4RmU2b2YvUitkS0VLRVk1aFREMFlPUHcxb3JTeVFSaWpVakZkSFFBMTM0?=
 =?utf-8?B?Sld4ZEs4QkdWb09lTDhXL2NzaFBuRWpWSjZkTkx3SXJXak53enNaN2pEaGw1?=
 =?utf-8?B?eG1LTTlxL05ZNENLbGNFZmoyNVdoMjhHVFprdEpFaVdGR0U5ektXN0tUV2tK?=
 =?utf-8?B?S0V5UHJZTVdIaUxJSHc5bnc0Y3I4eFFSSysxcDZlWkZ2dVB0QlR1eW1lY0VI?=
 =?utf-8?B?NWV6dmhzSHdkRHJxR3huV1VFS1pmSEFJZVdaS2NWNUFHK1c0dmxmS1dFajhr?=
 =?utf-8?Q?s3sHsAhFDWQFxhT/btQQyySW0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a52fbb00-e251-4069-1e8d-08ddee6b7384
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 00:05:42.6140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oy8rM0L6Cgmj7IvXgsm4cdgBHdZrXFxTIeJkp7zzIHYRDapnmMU+IxGVO1oercQ6V3h2DNCTHxqY70s/zjW0wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5887
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

Add new tests for migrating anon THP pages, including anon_huge,
anon_huge_zero and error cases involving forced splitting of pages
during migration.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Rakie Kim <rakie.kim@sk.com>
Cc: Byungchul Park <byungchul@sk.com>
Cc: Gregory Price <gourry@gourry.net>
Cc: Ying Huang <ying.huang@linux.alibaba.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Nico Pache <npache@redhat.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Dev Jain <dev.jain@arm.com>
Cc: Barry Song <baohua@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Ralph Campbell <rcampbell@nvidia.com>
Cc: Mika Penttilä <mpenttil@redhat.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
 tools/testing/selftests/mm/hmm-tests.c | 410 +++++++++++++++++++++++++
 1 file changed, 410 insertions(+)

diff --git a/tools/testing/selftests/mm/hmm-tests.c b/tools/testing/selftests/mm/hmm-tests.c
index 141bf63cbe05..da3322a1282c 100644
--- a/tools/testing/selftests/mm/hmm-tests.c
+++ b/tools/testing/selftests/mm/hmm-tests.c
@@ -2056,4 +2056,414 @@ TEST_F(hmm, hmm_cow_in_device)
 
 	hmm_buffer_free(buffer);
 }
+
+/*
+ * Migrate private anonymous huge empty page.
+ */
+TEST_F(hmm, migrate_anon_huge_empty)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	void *old_ptr;
+	void *map;
+	int *ptr;
+	int ret;
+
+	size = TWOMEG;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = 2 * size;
+	buffer->mirror = malloc(size);
+	ASSERT_NE(buffer->mirror, NULL);
+	memset(buffer->mirror, 0xFF, size);
+
+	buffer->ptr = mmap(NULL, 2 * size,
+			   PROT_READ,
+			   MAP_PRIVATE | MAP_ANONYMOUS,
+			   buffer->fd, 0);
+	ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+	npages = size >> self->page_shift;
+	map = (void *)ALIGN((uintptr_t)buffer->ptr, size);
+	ret = madvise(map, size, MADV_HUGEPAGE);
+	ASSERT_EQ(ret, 0);
+	old_ptr = buffer->ptr;
+	buffer->ptr = map;
+
+	/* Migrate memory to device. */
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], 0);
+
+	buffer->ptr = old_ptr;
+	hmm_buffer_free(buffer);
+}
+
+/*
+ * Migrate private anonymous huge zero page.
+ */
+TEST_F(hmm, migrate_anon_huge_zero)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	void *old_ptr;
+	void *map;
+	int *ptr;
+	int ret;
+	int val;
+
+	size = TWOMEG;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = 2 * size;
+	buffer->mirror = malloc(size);
+	ASSERT_NE(buffer->mirror, NULL);
+	memset(buffer->mirror, 0xFF, size);
+
+	buffer->ptr = mmap(NULL, 2 * size,
+			   PROT_READ,
+			   MAP_PRIVATE | MAP_ANONYMOUS,
+			   buffer->fd, 0);
+	ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+	npages = size >> self->page_shift;
+	map = (void *)ALIGN((uintptr_t)buffer->ptr, size);
+	ret = madvise(map, size, MADV_HUGEPAGE);
+	ASSERT_EQ(ret, 0);
+	old_ptr = buffer->ptr;
+	buffer->ptr = map;
+
+	/* Initialize a read-only zero huge page. */
+	val = *(int *)buffer->ptr;
+	ASSERT_EQ(val, 0);
+
+	/* Migrate memory to device. */
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], 0);
+
+	/* Fault pages back to system memory and check them. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i) {
+		ASSERT_EQ(ptr[i], 0);
+		/* If it asserts once, it probably will 500,000 times */
+		if (ptr[i] != 0)
+			break;
+	}
+
+	buffer->ptr = old_ptr;
+	hmm_buffer_free(buffer);
+}
+
+/*
+ * Migrate private anonymous huge page and free.
+ */
+TEST_F(hmm, migrate_anon_huge_free)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	void *old_ptr;
+	void *map;
+	int *ptr;
+	int ret;
+
+	size = TWOMEG;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = 2 * size;
+	buffer->mirror = malloc(size);
+	ASSERT_NE(buffer->mirror, NULL);
+	memset(buffer->mirror, 0xFF, size);
+
+	buffer->ptr = mmap(NULL, 2 * size,
+			   PROT_READ | PROT_WRITE,
+			   MAP_PRIVATE | MAP_ANONYMOUS,
+			   buffer->fd, 0);
+	ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+	npages = size >> self->page_shift;
+	map = (void *)ALIGN((uintptr_t)buffer->ptr, size);
+	ret = madvise(map, size, MADV_HUGEPAGE);
+	ASSERT_EQ(ret, 0);
+	old_ptr = buffer->ptr;
+	buffer->ptr = map;
+
+	/* Initialize buffer in system memory. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ptr[i] = i;
+
+	/* Migrate memory to device. */
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	/* Try freeing it. */
+	ret = madvise(map, size, MADV_FREE);
+	ASSERT_EQ(ret, 0);
+
+	buffer->ptr = old_ptr;
+	hmm_buffer_free(buffer);
+}
+
+/*
+ * Migrate private anonymous huge page and fault back to sysmem.
+ */
+TEST_F(hmm, migrate_anon_huge_fault)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	void *old_ptr;
+	void *map;
+	int *ptr;
+	int ret;
+
+	size = TWOMEG;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = 2 * size;
+	buffer->mirror = malloc(size);
+	ASSERT_NE(buffer->mirror, NULL);
+	memset(buffer->mirror, 0xFF, size);
+
+	buffer->ptr = mmap(NULL, 2 * size,
+			   PROT_READ | PROT_WRITE,
+			   MAP_PRIVATE | MAP_ANONYMOUS,
+			   buffer->fd, 0);
+	ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+	npages = size >> self->page_shift;
+	map = (void *)ALIGN((uintptr_t)buffer->ptr, size);
+	ret = madvise(map, size, MADV_HUGEPAGE);
+	ASSERT_EQ(ret, 0);
+	old_ptr = buffer->ptr;
+	buffer->ptr = map;
+
+	/* Initialize buffer in system memory. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ptr[i] = i;
+
+	/* Migrate memory to device. */
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	/* Fault pages back to system memory and check them. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	buffer->ptr = old_ptr;
+	hmm_buffer_free(buffer);
+}
+
+/*
+ * Migrate private anonymous huge page with allocation errors.
+ */
+TEST_F(hmm, migrate_anon_huge_err)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	void *old_ptr;
+	void *map;
+	int *ptr;
+	int ret;
+
+	size = TWOMEG;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = 2 * size;
+	buffer->mirror = malloc(2 * size);
+	ASSERT_NE(buffer->mirror, NULL);
+	memset(buffer->mirror, 0xFF, 2 * size);
+
+	old_ptr = mmap(NULL, 2 * size, PROT_READ | PROT_WRITE,
+			MAP_PRIVATE | MAP_ANONYMOUS, buffer->fd, 0);
+	ASSERT_NE(old_ptr, MAP_FAILED);
+
+	npages = size >> self->page_shift;
+	map = (void *)ALIGN((uintptr_t)old_ptr, size);
+	ret = madvise(map, size, MADV_HUGEPAGE);
+	ASSERT_EQ(ret, 0);
+	buffer->ptr = map;
+
+	/* Initialize buffer in system memory. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ptr[i] = i;
+
+	/* Migrate memory to device but force a THP allocation error. */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_FLAGS, buffer,
+			      HMM_DMIRROR_FLAG_FAIL_ALLOC);
+	ASSERT_EQ(ret, 0);
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i) {
+		ASSERT_EQ(ptr[i], i);
+		if (ptr[i] != i)
+			break;
+	}
+
+	/* Try faulting back a single (PAGE_SIZE) page. */
+	ptr = buffer->ptr;
+	ASSERT_EQ(ptr[2048], 2048);
+
+	/* unmap and remap the region to reset things. */
+	ret = munmap(old_ptr, 2 * size);
+	ASSERT_EQ(ret, 0);
+	old_ptr = mmap(NULL, 2 * size, PROT_READ | PROT_WRITE,
+			MAP_PRIVATE | MAP_ANONYMOUS, buffer->fd, 0);
+	ASSERT_NE(old_ptr, MAP_FAILED);
+	map = (void *)ALIGN((uintptr_t)old_ptr, size);
+	ret = madvise(map, size, MADV_HUGEPAGE);
+	ASSERT_EQ(ret, 0);
+	buffer->ptr = map;
+
+	/* Initialize buffer in system memory. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ptr[i] = i;
+
+	/* Migrate THP to device. */
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/*
+	 * Force an allocation error when faulting back a THP resident in the
+	 * device.
+	 */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_FLAGS, buffer,
+			      HMM_DMIRROR_FLAG_FAIL_ALLOC);
+	ASSERT_EQ(ret, 0);
+
+	ret = hmm_migrate_dev_to_sys(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ptr = buffer->ptr;
+	ASSERT_EQ(ptr[2048], 2048);
+
+	buffer->ptr = old_ptr;
+	hmm_buffer_free(buffer);
+}
+
+/*
+ * Migrate private anonymous huge zero page with allocation errors.
+ */
+TEST_F(hmm, migrate_anon_huge_zero_err)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	void *old_ptr;
+	void *map;
+	int *ptr;
+	int ret;
+
+	size = TWOMEG;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = 2 * size;
+	buffer->mirror = malloc(2 * size);
+	ASSERT_NE(buffer->mirror, NULL);
+	memset(buffer->mirror, 0xFF, 2 * size);
+
+	old_ptr = mmap(NULL, 2 * size, PROT_READ,
+			MAP_PRIVATE | MAP_ANONYMOUS, buffer->fd, 0);
+	ASSERT_NE(old_ptr, MAP_FAILED);
+
+	npages = size >> self->page_shift;
+	map = (void *)ALIGN((uintptr_t)old_ptr, size);
+	ret = madvise(map, size, MADV_HUGEPAGE);
+	ASSERT_EQ(ret, 0);
+	buffer->ptr = map;
+
+	/* Migrate memory to device but force a THP allocation error. */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_FLAGS, buffer,
+			      HMM_DMIRROR_FLAG_FAIL_ALLOC);
+	ASSERT_EQ(ret, 0);
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], 0);
+
+	/* Try faulting back a single (PAGE_SIZE) page. */
+	ptr = buffer->ptr;
+	ASSERT_EQ(ptr[2048], 0);
+
+	/* unmap and remap the region to reset things. */
+	ret = munmap(old_ptr, 2 * size);
+	ASSERT_EQ(ret, 0);
+	old_ptr = mmap(NULL, 2 * size, PROT_READ,
+			MAP_PRIVATE | MAP_ANONYMOUS, buffer->fd, 0);
+	ASSERT_NE(old_ptr, MAP_FAILED);
+	map = (void *)ALIGN((uintptr_t)old_ptr, size);
+	ret = madvise(map, size, MADV_HUGEPAGE);
+	ASSERT_EQ(ret, 0);
+	buffer->ptr = map;
+
+	/* Initialize buffer in system memory (zero THP page). */
+	ret = ptr[0];
+	ASSERT_EQ(ret, 0);
+
+	/* Migrate memory to device but force a THP allocation error. */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_FLAGS, buffer,
+			      HMM_DMIRROR_FLAG_FAIL_ALLOC);
+	ASSERT_EQ(ret, 0);
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Fault the device memory back and check it. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], 0);
+
+	buffer->ptr = old_ptr;
+	hmm_buffer_free(buffer);
+}
 TEST_HARNESS_MAIN
-- 
2.50.1

