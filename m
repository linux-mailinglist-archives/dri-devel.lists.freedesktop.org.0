Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E462BD929D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 13:59:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB46A10E5B8;
	Tue, 14 Oct 2025 11:59:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Xl0PpEZz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011013.outbound.protection.outlook.com [52.101.52.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 246FF10E5BF
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 11:59:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EDW4a/SQw7qv4waj8CNg91fN/5hT4Z+ODfOUVfStNv8Ek48zobOZLJhtWZiGDWxA1Q7Do24I9KWfWgr9qwprTRkU3vgLAHusqsCzuGP+hzUNR9gMtkOh/5KKQIntw05QGY+xBdiq2sk8gmFzxbKmjdFk/J3EpG6rf7N19MMxCgNhQMJXoqGpjM1vtZiYHr77DWqMZwFsciempx38ZqxUT8Vg6qXL3U8WK1rwqAkR0a35gUk5A9lLbHnej9Qf+LBFADMuWNa8EbaM2y3Gtc2haoUrDpMF4jLOdWiYmOH0jrLvRJtRZRh2d34Eb5X9P4xeWfRaJSluSkomy3cYOnKMqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IHR6M5XcQP1dJREB8H0ND1tPvBGceICJFd5Qf4uQylU=;
 b=FXA0jJzwP+hxZPMgKAuy068nzMufAJ2HudQb3DK3bbd8U/5g30s7Qdejz/SNIO80p9w1S2LtMmTR5spFxc4F5NHn8pTN7cFB2X45bzai8fqnCC7TG/5QnXVnkKYvWACU6OectdmBdFdTKLVj/g+tTzBfyZVIRbDC5nebyDDci31IlkO9ky1ph9vfGxDie7uJe5NEEB6mNKflm2ZejehzqRSGPsFnlySuB4K15DubZUskTAsb7J5YXT/B/SwXc3LJfsTqe04HEx/mGMkOz0XioV6DUQ1zlusLdrPtsfMHVwSRKZ+oXSO79nvK0p+EB8rfrtw4IaZFuEHS/qyWuCmwFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IHR6M5XcQP1dJREB8H0ND1tPvBGceICJFd5Qf4uQylU=;
 b=Xl0PpEZzmC6ydVX7Zdf7BIfnIYqoOT1Gr9uONAHdEJ216TfRIbChpUrQtEY/uijISurPdV8AGeiwvzw3tjQgiLd0lE6lsp86hjTC2lA1DwJ1w7/38t6pSlI0dv+La/768IlgO9gho49g+cGDSgZZJnBn/H6LLQl4MQe8vacXGAk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB9075.namprd12.prod.outlook.com (2603:10b6:510:2f0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Tue, 14 Oct
 2025 11:59:12 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 11:59:12 +0000
Message-ID: <87953097-a105-4775-88a5-9b3a676ff139@amd.com>
Date: Tue, 14 Oct 2025 13:59:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] driver: dma-buf: use alloc_pages_bulk_list for
 order-0 allocation
To: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Matthew Wilcox <willy@infradead.org>,
 Mel Gorman <mgorman@techsingularity.net>, Vlastimil Babka <vbabka@suse.cz>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Zhaoyang Huang <huangzhaoyang@gmail.com>, steve.kang@unisoc.com
References: <20251014083230.1181072-1-zhaoyang.huang@unisoc.com>
 <20251014083230.1181072-3-zhaoyang.huang@unisoc.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251014083230.1181072-3-zhaoyang.huang@unisoc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0440.namprd03.prod.outlook.com
 (2603:10b6:408:113::25) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB9075:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dd8c641-c58c-42f3-7421-08de0b19173d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nk1sMzdZV3pyekp4MmIwOWpzUzNkQ200bWd5S0F1RVUrZXpWSlo2ZHNkejB4?=
 =?utf-8?B?V1grSEs2UTRRQXlTdnRUcUlaZHZyWDM2dTJuME1hTkR3YVYzVjdkV3ZjdSsw?=
 =?utf-8?B?aVRlaFZyZkhCQ0ZhZ1lTR0VNK1JpSUdabmF2YUJrQm5DVWdVK1UwWWxpSVdk?=
 =?utf-8?B?eW91bVdPdURRZFdMOEdPdG5mMmsrUTZVc1NackpYY2RCSVRIeEdDaWJwNEFw?=
 =?utf-8?B?Wmx0Q2VpaW55ejdBZVFUU0RUUVdNMVBOQ0RmUHk1WWl4djl0WnEzM0REYzU3?=
 =?utf-8?B?ZEVjOWlLM3J1QWRBTTNuRk55QWlYMU10WXJvMm9lUkF0Q1JLUXNESkNaYy9M?=
 =?utf-8?B?VnNDamNldE54cXhZOUx2cTRsbEswZWtyUGxCYmcrZHFGWCtGMjZMWlpsblRM?=
 =?utf-8?B?UmVwZHlDajdiVmpydWVQSTZ6anpVK3lFb1V0djJDc2dac1FZdWU0aWVkT0RG?=
 =?utf-8?B?aHBFdEhiYndsSHhaNFhPelFpV0NuYkdrbEVwdlpPU3JFc1grZVFmeTRNSHVB?=
 =?utf-8?B?RGFTTFF0N3JpWUVkaUpNR0JBN3p3R05Kb01nREJ6ZGY2aTc0alIxWEFBRUVS?=
 =?utf-8?B?TXVyTVpwUVp2cE41cUtSY056UUdZZTZZc2FmS3VhS2ZtVVpLMUoraUszQlJD?=
 =?utf-8?B?MXJHTjR3WVp2V3RpZllWc05pd2VIQ2s3MXhLSFZ3enk3cjZpdG9XRjE3YVhw?=
 =?utf-8?B?Yk1TWk81RjlrY2E0b1pEcGVjMUlnZ1FZOWwyUFNvaE5pWFJjYmRUUmYxWjc5?=
 =?utf-8?B?TTgyTzcxOUc3U2tPa2NvT0RlZEt3TWs5ZHEzREhmeUJHUExnRkR3dGhFWjNk?=
 =?utf-8?B?QzFtbTI0L29BRG1aNVN1SVMvOG8vcyt6WVVHMGNLTzFwU1NpcVRMS3NOOHVP?=
 =?utf-8?B?NjB0QVhJN212blcvTjhKSkNkeU55MXMwS0pKc0lrVzVtNy9uSitna2hsTzlL?=
 =?utf-8?B?OU43ckF4RUFQdUZoVEp2MHJwNHM0RHdWaS9BZThPUUFHUWJEL1RmSXJ5a3RP?=
 =?utf-8?B?SGhlY0dpc2d1RjRTUVdCSlJKaWRFSHJ0eHpkNHBndGZSb2xLcDFvMFpiRy9U?=
 =?utf-8?B?TWJ2NWZhd0YxZTZZMHZtbnpmYjJwQnZiRDJVdGp6Y1E4bG9HQU5peml5NHNU?=
 =?utf-8?B?Wll0MVEzcS90ZlduMWtDK1ovV0FnaGl6dzMzSmxldVprblZJbjhiQ0lVRysr?=
 =?utf-8?B?cmVKZmNCcVZkSys1RE92b3NBUWczRytFazNEalBoWEFLeG5VMyt2UEhQcnZL?=
 =?utf-8?B?cE12RmpMWkNkVUNkY0N0blFSYWNxTUl6aVlKYVVpQWh6SDZQTmdEOTQrMzc5?=
 =?utf-8?B?OFpYb3ZVYmNCU1c0eHluVHZKMlpIdDQ0VXlGQktCY0l6Q2RzMm1NeTJrNEdG?=
 =?utf-8?B?Y2ZxNHN2V3k1MklrNy81djlmK0k4dXVaUFFycEpaL0hiV3kxdUNuNE5zVlds?=
 =?utf-8?B?dkgwd3RFa3UxWmxlYXZlUUIycGJ4Ujl1OWpYcWJXNHNqOHBhOUtKN0lWdmFm?=
 =?utf-8?B?WVJrMmtOalR4blM1SW4wZjdDdVFUeG5UN1RYeGo4anlibjI5OHUrWjF3RGpD?=
 =?utf-8?B?cHNtbmUra21vOHVFT1dUalhKSm1KNXlLbkJIdjQwbFlxcHd1ZFlsd3R1Vk5J?=
 =?utf-8?B?U1lSRzRQWmFabnpaRFJkdDhuNnpiRDgwbkdvMCs0aDN2TUwzUmpCWTJ2YnFY?=
 =?utf-8?B?aE1XUzQvcXo0eC9nNEpKQmxOYlNOTk1YVVFKa2ZaelFldHdJUTBXTW14dk9R?=
 =?utf-8?B?MGtxTUVLVjhYNyt4VnFrcVk3VDh6UWNSd0xXNUcwN0pPUnNGbXVGczRLZ1dL?=
 =?utf-8?B?SUJwS1Z2clMxWitCZU9mS0hreTBuUXdsMk5ZNFovSFRrUS8wSk9ZMnhuMjVT?=
 =?utf-8?B?NTFpNXJsSmFCWnREUzNaZ092eGtaWSswWTVhVGZuSXdrZ1FZQmNXbXhaVVll?=
 =?utf-8?B?Ukw2VStFdXlTTlNqK054bWlFNEx0dDF0M1RvYzN3M3J2RlBza1BqODFWMDln?=
 =?utf-8?Q?59+vfenn+MDf1d4nW6nprStC62wUKM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1BqbTFsdWUxdTI0VlNqc3Nub0tnamRsR1JYNXRJZDNkck9hRTZ1Z1pXTWZv?=
 =?utf-8?B?MVdSUTNWQUhNOEFYdmtjNithcFo5Zlp3Q2RMSW1tdFNZSkFCRHFRNXhyTWU5?=
 =?utf-8?B?TEtMRC9HT3pTdktpMmtackpXZEl5VDBHZzJXZ0hpRldQSEwxKzgrWWpmK3px?=
 =?utf-8?B?S3VGKzhNY2xJdFVkSTJZWXBVOFEwYkg5akcwV3VGdld6NW1VcnFaTXBtUHZM?=
 =?utf-8?B?ZEp0Z21NZkttdm9zajZCdWdmVzdNOS9aek1aTjFqNlh1bHlyZkdYaEsxYlRr?=
 =?utf-8?B?UGJaeVZmMmpsTDlnNE9yZ3RHbFA5RG1LQjA2ZWhPNjFDQk4rbnhpcXJ2TWFO?=
 =?utf-8?B?d1VYVjBublFkbVd5WFV5WXpxUmRpNHlGRkVpZ0dRQnhVMW5KYjVMQndHTUxI?=
 =?utf-8?B?QjFKbS8zWjEwT1lrU1dHQXRzaXlaNTZIdXRucTBYMVAwbFZmUUtDaGJGeUlh?=
 =?utf-8?B?bEd3YUs4c2xSdWhuT2w2S0hmRWxwVlFRdnRkUVl0QUp3OStsQTRMZ204Nlor?=
 =?utf-8?B?bnFSd1hHVHQ0UGI0ZEp6bFRxdDE3R0E2OVArTUNzVlN3UWorOFRYSmIySjB4?=
 =?utf-8?B?elU1VmtRK01PV0tQam9rcUVXa2JETlpiNFRLVHU3VGsrdkV3ejFWdkMrb2tS?=
 =?utf-8?B?bkN1MVcybzJGanZtV3pqY3djZlR3Z1hoMmVrMmp6SU5CMVRERDRQZ29NQ1hR?=
 =?utf-8?B?Y3lrWm1RZER4L0lKS1M0RWlUNXFmdFA2ZU9qRzNZOHQ5YmtYYUZ2NEVMaFUr?=
 =?utf-8?B?TEdUL0IrdVhWQnV1MUZDZ0plSS9ZUEQzZ1J1WFFFc213M2dhT2s5Y2tiVFZL?=
 =?utf-8?B?WFIzbStJZHk3emJXVkdyTnByamxnT0JRM2dnRlV2c0phQUYvYWh0VTNwcFBX?=
 =?utf-8?B?Smo4M2hJTWpqTWdCUUQvV2ZrbWtQNWN5eEpoTEJtdFJHMmk4M1NGUU96cU1j?=
 =?utf-8?B?UjdibkFEaGJ6T0NlV1pDU0FvODZrcFQ2cmRBSVdJM2JkeExEM1lQL0tzeTNC?=
 =?utf-8?B?VTBaT2VFMCtBc0I0KzJLckJTOWdKTUpzUklwdDFlNGlDeEtxMk9NWEZwT3Vs?=
 =?utf-8?B?VzJIdGFKSzVWYmlOanBwTW5jNDFFVzFydjMwcXlYV3BjcGFMUCtZUFR4bnBo?=
 =?utf-8?B?WXA3ZndRRFBIUFRWYlRvWHA4VW1aK25qa0NqSk9uOWY3K1RtM25OV0RpSjJK?=
 =?utf-8?B?cVRtYW9qYmE5bjh0Tzl5a002SDRHdnBZV3MxSVVLQVNMQmowKzR1NytuVWZj?=
 =?utf-8?B?R0FpR3BFa3F3TmlSY3IvV3JPQUxsWnQ2RlgvVFpubGpwTWVJdG5rVHhDQ2dN?=
 =?utf-8?B?WmNFNVZVcnc0a2FxQzBtQlBxcmhIVGJaWjEwZGU4UTIxVjlqUEtUTnNPUnd4?=
 =?utf-8?B?QjJkR2c4SExoZ3pKbEY1WlBLbUl1dEFISGZBYzFWdTBMOHBLbmFZUEwyNHcx?=
 =?utf-8?B?a1JIYTBzTy84NWIvbDFibHFuaU90aktYSE4zSFVwalV6WUQreWs1Qm1yT0Fa?=
 =?utf-8?B?azdLTlU2TXhDKys3QlFLV1Uxd1JYSjJic0c3M1lIbDNYRVVZR2VDWWJoeXVD?=
 =?utf-8?B?TXBjZG9QZnhwUzAydFNZRU9DeXpPRHNLTC9oTzlFUHBUdUQ4REJUSk01ZmZq?=
 =?utf-8?B?VXlsQ2M5TFRtcFJLb0NKUTBqTVh0K0lxd1RWMHhDbjMwOVdVRmdDRHZIR1hm?=
 =?utf-8?B?Rkd2ZzljOXFOSVdTMlNiSFNIeFJ4MmJZM0ZoS0ZLVkFZMGthU0JXUzhkTmR4?=
 =?utf-8?B?YVlQWDhjTUNHNVRWN1JOckYwcVA4QzBwRUhUbzRPT3diekZ2VXRDVHZFQWd0?=
 =?utf-8?B?Y3QyUDdteGtLOVE1Yk13N1d0SW5Oa2g5SEhYNFhld2xVR0Z0OThmWmtMRWhY?=
 =?utf-8?B?ZU8zcTlnZGRCN1c3Q2VwYVRldWZZbGZqWXlaRU85UCt0bS90Y0pTQzFZSk9I?=
 =?utf-8?B?ekg0SlNDSXdjRkNpYUhoSi9uQU9jTFRSa0pjZmE4S0pjSUVnZzJ3Q1c5YlBE?=
 =?utf-8?B?MG9vdU1Pa3V3eVdrT3dBWlp5STVrZ0dpWXlBUUg3SVY5WDJiTEZveGY3ZmJp?=
 =?utf-8?B?STQrVzIwbkxRZnlVNmFMbnk1RVlLQTBsUzRYQXYySVYwRzBESk02NjVLUStE?=
 =?utf-8?Q?3sr3BBYZTWOH7DfQvfWsnWZKT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dd8c641-c58c-42f3-7421-08de0b19173d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 11:59:12.6756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b7zpqaazeptUJ8E/pp0OYpXw3GSAyvD0xpcM65JfXAOyubpT9EEfhSAM/DX4et2g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9075
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

On 14.10.25 10:32, zhaoyang.huang wrote:
> From: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> 
> The size of once dma-buf allocation could be dozens MB or much more
> which introduce a loop of allocating several thousands of order-0 pages.
> Furthermore, the concurrent allocation could have dma-buf allocation enter
> direct-reclaim during the loop. This commit would like to eliminate the
> above two affections by introducing alloc_pages_bulk_list in dma-buf's
> order-0 allocation. This patch is proved to be conditionally helpful
> in 18MB allocation as decreasing the time from 24604us to 6555us and no
> harm when bulk allocation can't be done(fallback to single page
> allocation)

Well that sounds like an absolutely horrible idea.

See the handling of allocating only from specific order is *exactly* there to avoid the behavior of bulk allocation.

What you seem to do with this patch here is to add on top of the behavior to avoid allocating large chunks from the buddy the behavior to allocate large chunks from the buddy because that is faster.

So this change here doesn't looks like it will fly very high. Please explain what you're actually trying to do, just optimize allocation time?

Regards,
Christian.

> Signed-off-by: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> ---
>  drivers/dma-buf/heaps/system_heap.c | 36 +++++++++++++++++++----------
>  1 file changed, 24 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
> index bbe7881f1360..71b028c63bd8 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -300,8 +300,8 @@ static const struct dma_buf_ops system_heap_buf_ops = {
>  	.release = system_heap_dma_buf_release,
>  };
>  
> -static struct page *alloc_largest_available(unsigned long size,
> -					    unsigned int max_order)
> +static void alloc_largest_available(unsigned long size,
> +		    unsigned int max_order, unsigned int *num_pages, struct list_head *list)
>  {
>  	struct page *page;
>  	int i;
> @@ -312,12 +312,19 @@ static struct page *alloc_largest_available(unsigned long size,
>  		if (max_order < orders[i])
>  			continue;
>  
> -		page = alloc_pages(order_flags[i], orders[i]);
> -		if (!page)
> +		if (orders[i]) {
> +			page = alloc_pages(order_flags[i], orders[i]);
> +			if (page) {
> +				list_add(&page->lru, list);
> +				*num_pages = 1;
> +			}
> +		} else
> +			*num_pages = alloc_pages_bulk_list(LOW_ORDER_GFP, size / PAGE_SIZE, list);
> +
> +		if (list_empty(list))
>  			continue;
> -		return page;
> +		return;
>  	}
> -	return NULL;
>  }
>  
>  static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
> @@ -335,6 +342,8 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
>  	struct list_head pages;
>  	struct page *page, *tmp_page;
>  	int i, ret = -ENOMEM;
> +	unsigned int num_pages;
> +	LIST_HEAD(head);
>  
>  	buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
>  	if (!buffer)
> @@ -348,6 +357,8 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
>  	INIT_LIST_HEAD(&pages);
>  	i = 0;
>  	while (size_remaining > 0) {
> +		num_pages = 0;
> +		INIT_LIST_HEAD(&head);
>  		/*
>  		 * Avoid trying to allocate memory if the process
>  		 * has been killed by SIGKILL
> @@ -357,14 +368,15 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
>  			goto free_buffer;
>  		}
>  
> -		page = alloc_largest_available(size_remaining, max_order);
> -		if (!page)
> +		alloc_largest_available(size_remaining, max_order, &num_pages, &head);
> +		if (!num_pages)
>  			goto free_buffer;
>  
> -		list_add_tail(&page->lru, &pages);
> -		size_remaining -= page_size(page);
> -		max_order = compound_order(page);
> -		i++;
> +		list_splice_tail(&head, &pages);
> +		max_order = folio_order(lru_to_folio(&head));
> +		size_remaining -= PAGE_SIZE * (num_pages << max_order);
> +		i += num_pages;
> +
>  	}
>  
>  	table = &buffer->sg_table;

