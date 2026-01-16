Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 469E8D307E1
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 12:37:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7829F10E86E;
	Fri, 16 Jan 2026 11:37:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fMd4w77D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011012.outbound.protection.outlook.com [52.101.52.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5ACF10E1FA;
 Fri, 16 Jan 2026 11:37:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=csK9Oe3FT1/80XOR8Wz2HowRfF/X17hZM6opDm2UN2cC8ilMOlj4hdVIGR+2RZs+3lZgwDJB2+sVr8g8F6FNPNik1EK/0ZLFhuw1u79SIbY9Fddbd9ry1B8npHqszN75xkJZi3UCPvolR3D2ouTRUthlgXAf0so4ARuFAu/lNolMjLj0O4F8zD+TmAbTAAHFUSeDsERudlLy9mXjhPafXCRqlYq/eZaAn3BPePL5F4QxfT6XgqN8j6r+LhG6nEwvHdiWxqHYsr0VOTmaC03SFMmFCCSh91KLjjxyrQnMCb7z2XxcABBGkYM5qJi+EI1wzPAoVUcKayAJ0PJX+jRcFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eEyDPhMpkPGhLzC51UVjTvEhnbbulELjYrc9OKCAfsc=;
 b=CqXh7s3f5rz7R4TMRHzXUYI8IM9MB2r5pJr3eXYngtRvwymAwgi4ExhPd5ZpyM+i8gPFNoTYvN0mLVHCrdjZMqBqF2zxArm/lsq+jczem4bdZ6wPUK/PsS4UABr3qOGcNrnAv32ASaJuWzPFQXXoGllDQM82kLlRsqeZniioBu1MndzFd5AJ5I5w+g+k4jVnYQLcPP4fESS+1GtUhdUzmzY/Wl3TpQ1/RFUDbUwVASSoEhIggwypH8apwqEwlFtWVrMBG/Mn28T4IJYKBTxz4yUSmPmwIGfFJ+VZ+QbLB7zZ2xbTESJZlNHzw608Ao9kFxRjFE960Pk3IWkfBwHeJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eEyDPhMpkPGhLzC51UVjTvEhnbbulELjYrc9OKCAfsc=;
 b=fMd4w77DsoHGMIGV5O0GqZzMGt3lVeCVOOyaCCUIvxKGlKCiN6rXtlMNvCA/C/00e0rXVR+gu7tBAJeiQwYQHDHc/PVbfbdjSCVqOsL6+Eks0ME5yN+JSefRnhFOWMUfEDYav6IxiypqJNWppxjrc0M5hVFhWV187rUuiT1Vgq5EU/Dvf+5yfq9UIyFF+VUhF16bEIQ4+6Co8aba5CYfYXZttO0+Hne6SH3jVTHPWjK3A0vJvks1jzy7vQAMCzKT/Cfoq4k6lHtfoi3qu4qMJdtmNNuQwLdo5yXPHSQSIj4jgY0fsm/kDNvIKlRyupBs76pwCDSBuvI4K/Z+NqA3oA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by SJ0PR12MB7008.namprd12.prod.outlook.com (2603:10b6:a03:486::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 11:37:20 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::2920:e6d9:4461:e2b4]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::2920:e6d9:4461:e2b4%5]) with mapi id 15.20.9499.005; Fri, 16 Jan 2026
 11:37:20 +0000
Message-ID: <32ad0dee-0604-411b-b99a-b1bfd8ba89ed@nvidia.com>
Date: Fri, 16 Jan 2026 22:37:15 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] drm/pagemap: Correct cpages calculation for
 migrate_vma_setup
To: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>, 
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Zi Yan <ziy@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-mm@kvack.org
References: <20260116111325.1736137-1-francois.dugast@intel.com>
 <20260116111325.1736137-5-francois.dugast@intel.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <20260116111325.1736137-5-francois.dugast@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0003.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::16) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|SJ0PR12MB7008:EE_
X-MS-Office365-Filtering-Correlation-Id: 942e9eda-ea44-49e9-feaf-08de54f39bea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TGMvZWJ4R0h5MEJ1bUhkbDVoN3hBUlpnZE1MZk4yVWFUVVJLYXNpa3c4ZUxl?=
 =?utf-8?B?MmVFc0REQVlPbldzYXNlbHBGYU1uYlhkUjUxWWl5ME9yQU0wMlFBTnZGSEpY?=
 =?utf-8?B?NVoxalhqMnNkMC95VWFmeWFGOUJtMDA2VjdFcm1MeWphTXpjcDZvbHUrT3pZ?=
 =?utf-8?B?TzNHRS9ZVGpDcE9JcWNyenBodnN1eXhtanl3NTlOdllva1VFcjVOTXlVRnM5?=
 =?utf-8?B?SHFhUGptYlNGa25MUnlTZkpYQ3MxczZwVmJDSHhzZ253Mzkvd2l0bGdVMlZC?=
 =?utf-8?B?eUYxaGhjY2NpeGtTTGYrd25nUkxvaUI1Zk1hWGFrSUV0TkFGbDBScTBzSFVl?=
 =?utf-8?B?Q3dzckVKeDhBZGsrdjFJV1FqRFVadWhCdjI2RTZxTWpZUzkzVy9mSXJuVFhL?=
 =?utf-8?B?TllEUlQ1Y2xwZEQ0bGo3TFFPUXA0VXpvOXByd2JCQzlxK1h3WFRxY3pNUFpy?=
 =?utf-8?B?Z0RmUWJaU3d4eTFjc0g0dVBtbUdOYk95czFaMm40MjNYcFFJeVRsd2RXa0pt?=
 =?utf-8?B?VjA3QjZ2MHdMemtjT3FrN2JOamhYamJkcVJXZ2FXRUNOLzFYU2M3VHIwMTdV?=
 =?utf-8?B?dTE5STNiYlRPWmhnWmdST0FCRFhsdUFMd3RHMHVaa05od2xPQjFhOFNHWm5h?=
 =?utf-8?B?Qk1XRy95MTJYTHh4aGs3ZW9XTFNJVjRPUmR0UVEzS1JmejRpUDFvblRlMmhR?=
 =?utf-8?B?UTQ4cEN1R3FjZ25STlMyZmp3WFVuS2Q0VVg3OEJJanAvOWJHUkNNU3FuYmZo?=
 =?utf-8?B?SU5CMjV3NmwwWHJuc1NtYVBSZ0JxTnc1QURzRExyZy85ZHRkTmM1a3RJa2hM?=
 =?utf-8?B?c01EMUwybG5kYzIybjF1eUJiYlNHcVpwcStIWFlxWjd2NEdDdmZRbnh4Tllu?=
 =?utf-8?B?VzI1WTZLcWFxTkpFUGdhUVZrRGpiYnRFdlpETHdGTE53VWtWNDN1NWpsemRM?=
 =?utf-8?B?RlNZa2oxMmNMWTR1ak5yVnMvdllTWFUzRXNEU1ZOam43WTlENXBORmFZeC9z?=
 =?utf-8?B?ZEJqZUFadVRLeitXSWt4MStHSUhUTUdPOHMxOEJZellKOXpYMkllQ0RsZFJW?=
 =?utf-8?B?VVo1ZG5LeGFUdkNxd1JoeFpGMm1SdjZnc0dIbUQ0R3UyRTIrZDNFRDYzdFhn?=
 =?utf-8?B?b3RMZkM3R0dST3NXYTVTUFFnR2JqelBCRUoyY093b1dBcVhsN2htT1JTN25L?=
 =?utf-8?B?RU5SbENpVFdIVU5nMGQwcXpXNFdOUDlWRWlPRVhZYlFFWENhZFNDNlBqQWVl?=
 =?utf-8?B?NlNLbDlWeXhtTkhwMjVWNDZ0QVcxMzA5V3MvNDIvUTZ0ZVM5elFLN1d6amtp?=
 =?utf-8?B?S210SHNKUHplMkNwWnVOMGp1eXpwcjV3UVQ3OHFSQnlxdXpYSzBsWUQ1V2N1?=
 =?utf-8?B?M1RWcXR2bzRTSmFoVUpqdnRPMG9kc05kVTBEekJWRmw0dE4rTmM2QTBKaTdF?=
 =?utf-8?B?Z2ttUzk5b29ObHl0Y2Z6N0lvK041M0E2YlJLZ0hISzA3SFBZNGVLbnlaMlFQ?=
 =?utf-8?B?Z3M4U01tRHhTQjlESWxrNmM5MWwzUTJ3WHF2cWFPRHhwOVExdml4YTV0OHNN?=
 =?utf-8?B?YlQ1eEVXdGtFMURraEFaWG5sUXVSWnZ3R0I5R1BtcThNM0lDaEQ2SmcvVzl6?=
 =?utf-8?B?ejdibkZKZEhNTFQyN0J3VmFNQ3pZZzl6cXlmUnJ6eEpTdWVJaXpabGpKRitw?=
 =?utf-8?B?MDRBN3ZEWk1ROFNLZU1LY1BqOTZ0ZXJkSnArRE9PQ0prVGgzcjNKdjFLcFNr?=
 =?utf-8?B?am14TWVKSzU1bGFDd2luRyswdzZzUVFSZHJVa0dXckpRWjVxblRxczNGTzBL?=
 =?utf-8?B?MUkyY1k4OXQvL3FVZThnaXgreXduTG1xOTVoK3EvUXpEeXZ6ZzlUYnJycGkr?=
 =?utf-8?B?Ni9Zb2FaZDJEa3ZlVG5ON2xza0pLbUFYY1g2T3o4TkpiUVgya3hLYklVSURC?=
 =?utf-8?B?NFM0eS96RExqL2dPT2ZvWTYzeVZKejB3TmJhQUFrSG4ybVhCek5ZMHBiZkJS?=
 =?utf-8?B?NTdWTTZ4YkNkL0NxbHFxNStkQlhEWG5GRnU4L2lZdHJwcE5YY2UzSnFycEg1?=
 =?utf-8?B?YWxCK01qWEs3a1RTTFJ6UFJoLzZKTnBmVmlVd0p5aVdhMWdCdEliR09pUlQ0?=
 =?utf-8?Q?C3/o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(366016)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHZxalllcm1YVTNOdmJScnYzVEJjdThlYkhlMy91cWdlcmcyb3d1dklhYlhP?=
 =?utf-8?B?dkh0TmE1dkNjV0dsc3gxeG1XbENJdU9YVEN4a21JNXR2dWY3YWJkVWRLa3ZE?=
 =?utf-8?B?Y2FueHB6akJUem9iTmpueHZTMmRNSkRIQ0hJQVVOVVNYb0hyRmpqU0tWMVh4?=
 =?utf-8?B?MGFKank4dmVNdVhXbXlTTW0rcEVsbW5FVUdzMFptYkM1Mk1xanh3eHpLQXJR?=
 =?utf-8?B?R1lOMTlMQVRhKzl0M3ZpUVF0TjdxQUI4amxPeGhrM3M0WkVQYzRxZzFqcThp?=
 =?utf-8?B?WWNkcDJsQ2djM2tXMnRvejErNVBGT2UwYkErL044WUVWYXlHM2hQRFVGV2tP?=
 =?utf-8?B?ZWJaSm5tSmRpR0ZhS2VrOS9Fd1VtNDdEOVVyWG91eHVnaXhhRUx4T2w2Ukla?=
 =?utf-8?B?OUZ0bFFkY3B2QndoRW5RclRKbUorTTZYVDNkUXdFMEhkRGl2WjdxRlp5OWdu?=
 =?utf-8?B?bkRSTjAwbWdIc1VSUm9KV25SeE9QbE1OZGhxOGl0cnhPZ3k1ODVVb1ZlbFVM?=
 =?utf-8?B?eGtudExHODhibU9ha3d1N3JuUXN6TVJIKzRSWXBkNjNJcUJNQ05MVThPdHYv?=
 =?utf-8?B?WlVyN2ZodkVjc0FJbEpoOGlKbUFIOW5ZbllqUnE1UDVxcTlWYU5CVnMvNlB1?=
 =?utf-8?B?ZTBTRWVFSVpSY0t4eTNoc2pjRXQ4UmR4MUlySjZ1MytDd0lKQXk4N3VGTng4?=
 =?utf-8?B?Ni96WERFUENndExHcm5oZWxreTV3UkZYNi9HbXY3TnF0NjloWXhFaVlmMDI0?=
 =?utf-8?B?allwc3J6TEZxb2tpVm1SOFJySFdVZEI5TTdxVTdFK053eDQzTE5IcldFams1?=
 =?utf-8?B?OXU2MHh0UHp1dHFoODhTcDlTaHRleFJVNmV0c2ZjYkhZVUFrbVN1YTRJMnly?=
 =?utf-8?B?WXJOdHhEVTdxY2NFbG1raFFsMVZXeWVZSzZha3packxxbE5XUnNQUXJ3b2xh?=
 =?utf-8?B?cldPcGJwV2xFOUROSGJxSzhpa3VvTVI3L25VRnpaZEpxYXNMc1kyOHVFNXZi?=
 =?utf-8?B?NHJoWmZhZGVGZHQzYlBVR2RuaDM0KzJMNWNDS1hMRjBxVDZEaUFXU3JJeXhT?=
 =?utf-8?B?MFhhbDdsVWZsc0F6RUZGbVVoV2pRc3JUdXRBanNrWENJT25vM1diSnFtSmxn?=
 =?utf-8?B?T0VqcFdUd0QrZHpidlRnekxlVEFUQUtYMnFxSUhNTit1WmdZK1QwRmhuUDV6?=
 =?utf-8?B?YUtPbmtaTnJiQ2dzYTl5UjYwYnNFYWx1MXFVVGVCd29maXhsb3g0VUlBOFpW?=
 =?utf-8?B?NWJCMFBTT2M2Vk1aYjN0QzNxdURFUk5QY1pSM1pmaFJvUnZ3V0pnKzNpUitU?=
 =?utf-8?B?MGlvbHZQZFNic1VldkREdEFzZjN0TGhERzI1ZnJRYnk5Ym1lVWFoOWNQVDcw?=
 =?utf-8?B?bXp5VFd5V1I2emJQRGZpWWFBN3RTOWFGYkRxc2d0N1lTb0p1anhrQ1ZqUkM1?=
 =?utf-8?B?QlFUODhvakEzZGd5M1hrUFpMUlVuQi9Kd2ttcm0yU2ZpbmpEZWVDNXU3Mzhp?=
 =?utf-8?B?S2VjdWdaWmpFMi9rbEhJWHRQUCsxZStnaWY0L1RLaEZ0dU5SQmJzUVRVWUNC?=
 =?utf-8?B?M0lXZXZIK2o5UW1XcjNBVG8wOUc5SnFWT0ZnN09JMkdiU0JVMW55eksyc09N?=
 =?utf-8?B?ci9vdENUN05OKzh5a3E5YUFUR1pGZnhyNEM0ZU9acmVFZGZ4cC91R3RDUVRj?=
 =?utf-8?B?YlVwWjQxdEpIUnhtWVhBemYrU0NCNWp0cWVGMEM3aFlhRHgreXlrSEN6QU91?=
 =?utf-8?B?b3RleDk3b2hBM2lwTHVJYjBqSXFuNTBlQ2NSRFloSUY1anJrZTVZVS9ONVlQ?=
 =?utf-8?B?NzI3ZUpVZjRQRmJoY2hsN25qSHlPZUVQczhuT2JLL3VrZHMrSEpuTTBhNGZv?=
 =?utf-8?B?aElTT2t3S1BYYlVBbFkzVmdxbkdjeGR5Z1NFdzI2SkZUYjZ4QUp4c09yNjdE?=
 =?utf-8?B?ZUQ2dUZkTGRLTkYvWTRtTU1OWG5VZkY3ejB0ZUNXRTUyWG1KelNLYTl3TnRI?=
 =?utf-8?B?ZjhMYTN2V1c1TnpFUEI4bjFWSm9ySGlXbUpSWW1rdWlTZUI3VzdpN25FUVcy?=
 =?utf-8?B?bDhqdHV5LzlWT0lueXdTRlZrTGZEdDhCU09uN293cVUxWnJFZk56TVRnTFYz?=
 =?utf-8?B?b1k1NDgyY2xuRk1DVDNMQ2hXY2pXdGdjajdzWnFGZmNrUE16cTZJbG9jZWtF?=
 =?utf-8?B?dFhNSVkzMThaNzF3QmowTGJOcnc1SUp2bk95d0QxVDZWWFhQMUZ4TXdsUkZw?=
 =?utf-8?B?MnhwWTdZUUxOV0p2WlpuL3g5WmVmd2Nma3I3aFhQVDQ2RUVVTDFHY0oybktV?=
 =?utf-8?B?TDM2UURUZkViMUVFak9TeHFDU3VOWVFJSndIcHBZMUhNWkgxWVArOThkYjRh?=
 =?utf-8?Q?FBvhIL8ZQ94Vl2xm85X8w9vQXaD6TKz4j+WnoLvKFCxbc?=
X-MS-Exchange-AntiSpam-MessageData-1: XH40XQXVwh0RCA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 942e9eda-ea44-49e9-feaf-08de54f39bea
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 11:37:20.4439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R7ta1i4HHDlf6pFiKmIBMtArkMAyEGCgahrPkMqZINqPyeRNzRdHblJuNEra6x5ywmQNk6/WOdapy+ArRFesQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7008
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

On 1/16/26 22:10, Francois Dugast wrote:
> From: Matthew Brost <matthew.brost@intel.com>
> 
> cpages returned from migrate_vma_setup represents the total number of
> individual pages found, not the number of 4K pages. The math in
> drm_pagemap_migrate_to_devmem for npages is based on the number of 4K
> pages, so cpages != npages can fail even if the entire memory range is
> found in migrate_vma_setup (e.g., when a single 2M page is found).
> Add drm_pagemap_cpages, which converts cpages to the number of 4K pages
> found.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: Balbir Singh <balbirs@nvidia.com>
> Cc: linux-mm@kvack.org
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/drm_pagemap.c | 38 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index 61c6ca59df81..801da343f0a6 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -452,6 +452,41 @@ static int drm_pagemap_migrate_range(struct drm_pagemap_devmem *devmem,
>  	return ret;
>  }
>  
> +/**
> + * drm_pagemap_cpages() - Count collected pages
> + * @migrate_pfn: Array of migrate_pfn entries to account
> + * @npages: Number of entries in @migrate_pfn
> + *
> + * Compute the total number of minimum-sized pages represented by the
> + * collected entries in @migrate_pfn. The total is derived from the
> + * order encoded in each entry.
> + *
> + * Return: Total number of minimum-sized pages.
> + */
> +static int drm_pagemap_cpages(unsigned long *migrate_pfn, unsigned long npages)
> +{
> +	unsigned long i, cpages = 0;
> +
> +	for (i = 0; i < npages;) {
> +		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
> +		struct folio *folio;
> +		unsigned int order = 0;
> +
> +		if (page) {
> +			folio = page_folio(page);
> +			order = folio_order(folio);
> +			cpages += NR_PAGES(order);
> +		} else if (migrate_pfn[i] & MIGRATE_PFN_COMPOUND) {
> +			order = HPAGE_PMD_ORDER;
> +			cpages += NR_PAGES(order);
> +		}
> +
> +		i += NR_PAGES(order);
> +	}
> +
> +	return cpages;
> +}
> +
>  /**
>   * drm_pagemap_migrate_to_devmem() - Migrate a struct mm_struct range to device memory
>   * @devmem_allocation: The device memory allocation to migrate to.
> @@ -564,7 +599,8 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  		goto err_free;
>  	}
>  
> -	if (migrate.cpages != npages) {
> +	if (migrate.cpages != npages &&
> +	    drm_pagemap_cpages(migrate.src, npages) != npages) {
>  		/*
>  		 * Some pages to migrate. But we want to migrate all or
>  		 * nothing. Raced or unknown device pages.

I thought I did for the previous revision, but

Reviewed-by: Balbir Singh <balbirs@nvidia.com>
