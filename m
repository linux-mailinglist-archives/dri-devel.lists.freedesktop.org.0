Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A4EAFC7F5
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 12:10:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7A9310E5C9;
	Tue,  8 Jul 2025 10:10:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jldtxVfw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061.outbound.protection.outlook.com [40.107.244.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE6110E1AA;
 Tue,  8 Jul 2025 10:10:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bdt5r23N7t5Pwa8VUAxs86vPyf8o09BFekPrEASqz9v4kI9lfNigRgMet3qBP/q1x/5jo6GS4how5qKgrrrqWnxusY0pm4+v4+DELwMmq5xRjXO/GqcVJApsKBNCB9f5nnU762ngJYsq2VYHm9Tk6zEm3f8R8Xz/ukX1w1wrI2TuTQkkfmt0gMYdJKlq82Qiw616tyurnxbcnP3Mm99ZI2pNP+SNjaBnP7YpVLNcpGkMy0fAtZJUSYV3Rhttw/rFzM/4onA24nqFgqNmsP0Qs30gsHLhbaAETQyGjlS7KlCU50GgyB7vJIFl84fOCKWyANHuP4IWhulga0uwYHnVGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FxBBZx235BHT8zfX8dgCx8SbmkM9qlmn+fnVwtjmnCw=;
 b=PeKssieh1wpGT4XVuU43FMm7UMD91A97SyiSKd3lu6FxLwO8mq+7gS32t2bEaTP2qd+vNIozEIIzXrgQmgEQCwK8YGag/X++/yMdoY2Fpw614CcDTACZ5xGRijYi4UNWy7uPjBR636lI1IF+bv/FXV5GGoOTF/jmTOxs2srAY4zfY1Um4anJDTSgMrSPiLhOCzHsHIgHOSM5ohp5xV1KZWmqAoImyNseadjLIe6HDEZh7ymx/Xu16M88yIqqROqaSd9nlmhPYeXOz4N9lsePT9gEJ0rZP9/hHWxIccXcwOqmt95tMPGgqgnM4ID6xg7XrNM+VMRkLSY3kPWmwNAQGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FxBBZx235BHT8zfX8dgCx8SbmkM9qlmn+fnVwtjmnCw=;
 b=jldtxVfwJApkZQnCc9CnGgXWrXLzA5RjHqKHb6sNzvHI9ukzAlHps7aXBqD1QxZodhEBfpr+7sTIQB/vC6LpALk6RXaRzZE20+fw63/Kkc2E5rPPMvWJR7R0xSs/uSBs4xlyBxNKQ6I9uyp0ZlIgSeXrj3S08A4AKuftyqwnJLA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by DM4PR12MB7552.namprd12.prod.outlook.com (2603:10b6:8:10c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Tue, 8 Jul
 2025 10:10:03 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062%4]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 10:10:03 +0000
Message-ID: <7a96d06d-54a9-42b4-84c7-0c262104ea5b@amd.com>
Date: Tue, 8 Jul 2025 12:09:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: Take a breath during dma-fence-chain subtests
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Nitin Gote <nitin.r.gote@intel.com>, intel-gfx@lists.freedesktop.org,
 chris.p.wilson@intel.com, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250226155534.1099538-1-nitin.r.gote@intel.com>
 <2191571.OBFZWjSADL@jkrzyszt-mobl2.ger.corp.intel.com>
 <5f24f0e1-7d61-4a1a-bfea-b17fa7af4be1@amd.com>
 <2153999.KlZ2vcFHjT@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <2153999.KlZ2vcFHjT@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0148.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::6) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|DM4PR12MB7552:EE_
X-MS-Office365-Filtering-Correlation-Id: b4a0e1d2-dfe8-4a51-2ad1-08ddbe079aee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QkE2VCtHMW5UL00zUzUvRmxmb3lTS01Oei9TUGNLMUZVV0JZbmhLSGdSNkxa?=
 =?utf-8?B?NUlESG1XcjhZbU5PK0lNa0E5UWprQ3RqaS9jVUF0UHVJVFBOdW5ZWDdlZzd0?=
 =?utf-8?B?NWdsWkxjZ0tzWVFkSUhGdldydjlnbjJCUVNsZ2xxOXVadWRSc2JaODBLYVNl?=
 =?utf-8?B?L2FGUFR0bUI3RDlkSFphNW5Ra3paUmhJbG9vcGRYNVBRS09zd28yVFJGQXlM?=
 =?utf-8?B?OVppM1lLdHlvTjcrREpTcWVVR1NFNC8rSHhjU28waW1aRUJKOEc4OVZ2UTVF?=
 =?utf-8?B?QUF4dTYxeEQ4Y2NzYUxBVVo4THQzVk5sOWRPbDJqSzJYTzZSU1FJVGtlcWE4?=
 =?utf-8?B?eWkxckRIYzRPVlAxS28yWlBCVVhnZnRBV3ZxYUNwMlhuWHIvV1ZCRitlTHVF?=
 =?utf-8?B?ckJBWXY5aS9jSTNSUmVIM2VEUGxJdGczNkw2U3dOcWlObkg1M1hjd0tkdURl?=
 =?utf-8?B?b05YSXkzYWozbEFGOWhkTGtFYzVBZWN4MmtxM1RvQjBxSkk5ZGNkRS9IZWxa?=
 =?utf-8?B?SjkyVUZhWjhOUGJieHhsL0J3N0NDbWdYdFE2NlNVcFpZd1Nnd0dHZ0J1aEJF?=
 =?utf-8?B?REwrRjk0ai83bm9HREF2SCtrdDI2dnViRHg5bkdySUhCd2VZbDlJMTlkUXlw?=
 =?utf-8?B?dG14aGZTY2tDOGROZkJSUDA3dXpHM1V6dWVVaXpGSS9JR2VoSEpweXJCMGxW?=
 =?utf-8?B?ejVpdVE1N0xsREVJT0pSeEtvNnRCa05wa3FPbUtXN0JHenVXZ3ZibEJ6djZM?=
 =?utf-8?B?WlpaNk45c2hBNWo1RkxXQkpJNE8yT2p4Lzhwc2NFTUZySlcvZ2lHNVBhZFhC?=
 =?utf-8?B?VWlQdjB4Z25Obi82R2NrZTQ0SE5tZ1UwWk1iMGd0YklhVDVoc3FHR0hPdW1F?=
 =?utf-8?B?MWltOFdQR3J1Wlc0OUREQnJPdDdXZk9scFI3MnorMEQ4akR2SC9aQnYrUm56?=
 =?utf-8?B?dlJiUVJHelRtbzB0UUhtK28wZlQxSS9WRU9RUXFxYy9pam1ETGNqWjdSYmVJ?=
 =?utf-8?B?M24zUlFwMTlXU0tnS0psenM3M2h1YVFySTg4ejUvMVlXYUhhWml6dE54T2RG?=
 =?utf-8?B?c3I2bnVmZEJIZjVvVGtnK3d4a2VuSWU4SWVCR21QZ0MxaWFsQjc0TVI3UGJq?=
 =?utf-8?B?K2M5K2VCQUxKbFZXTklvb0Y0UHhVeTBncXRMMFpybm90ZlhWRWdpUG1rRWlu?=
 =?utf-8?B?R0x5R3pYNnNVNlREWGxuQ0dpOHA4cS84TEU2MCtwWkxlVC9zNE9mQ1ZlT2RX?=
 =?utf-8?B?aWdZSmRYUmFoOFozU1VzMmlQTDZGZjdCTTJDWnVQWHlvK1Q5eUx0MVAvU09j?=
 =?utf-8?B?MnRxeW0rVDF1OXZMTmtWVFRRUzRKWnZ1dHdmNFo5bzZlU0VqTXhCai8vQjNB?=
 =?utf-8?B?WTM2WnVIZkJMMDVFbDVTVWE4SGJXNnl1d3FtN0JhdUhrWmpTQkc0aW43Uis5?=
 =?utf-8?B?cVE2ZWRzNjRjTzdHd0EwU3BEOTFaMWlaMHZHMHJ4R1BMN2oxa2FvYmxJdUtp?=
 =?utf-8?B?Q0RzMXR5OTN3R092N0toRmZDY2d5Vlg4SnN3QUIyY0VtVlZWZWN2VlpKRlhi?=
 =?utf-8?B?YTQ5L1BLS2Y5SzVwaFhDcUYxZVR6ZkVkREh5UGN5ZTRsVGJZNng0eDg5REJZ?=
 =?utf-8?B?V3ZZa1JYMEVyWUh4RHFtK1ZHaUxkRSsyL09GY2NqdWp1NUpId0lHWFhLUlll?=
 =?utf-8?B?YVlTYUs2ZkJLNUpTUUZYclh6Y2R0YUF6d1NoeGlJQW81Nmhsb0VrZzYwbEVv?=
 =?utf-8?B?cHlwZkNFZ3JCQTFYS0lheFg1ZUkxRWgzVk4vdzRuK0pENWEzSXkzZExlZnZT?=
 =?utf-8?B?TnJMSGFLNWpGTnU1SEh1dGtvT1ZPNWIyeHZxM0FQYXJXWll3K2lVNGh1OTEw?=
 =?utf-8?B?T00yek1sbHU3SGwySFlhQkp3TUZiVFBHdXlyanNOUDdCTkpyR3hlZ05oRlM4?=
 =?utf-8?Q?8x51r/NCpGU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TndQMTFxeFpKT1N3Qjc0Q1IzQVRqMFc2Q1dsb3ZKYUwzMjJxK1YzYkE4eVli?=
 =?utf-8?B?aWdraG1YVWdWWUwwTEgvOGpIcVp1R0hQZGtoYXhJNFVzbEhyVUhGSk5nNzZN?=
 =?utf-8?B?dUFHNFNnUHlyWWd1SW05NStkRTljODd4clQ1Q0JIWVRBKzdNQkhjSHJtSldQ?=
 =?utf-8?B?aHRlVkIxY0VwYkpPdU5TVG1PaHpsN0ZndGdBSUcxekVBNWxvcnQxQlNhZkZt?=
 =?utf-8?B?NG5UcGZpbkNNWWd5VnNvK3VYalk2MzFxRnBOZ3lGR1ZxUDBlYmtuRUkycm1v?=
 =?utf-8?B?cmxXVnNBOHdhRDZKVXZnQkx4UGFQandtaU9tQUdSdlg2K2FIUU15MXRtYUQz?=
 =?utf-8?B?SXdQa3pJNVZwSzVJTXJKcFVLb1BRTXFhSjBHWndnQkl6dWV6S1VNZVJBNEVh?=
 =?utf-8?B?VUdDSysybkNwbWRXYnVLekhhZTFIRHg3c05zVnFpSHIwQ3YvV1lpbnNMMlhy?=
 =?utf-8?B?cDJqS1BLWk5VbEh5eWRZNzVaNGN6OFd3Y3VBYjhPMjF4dklFZmtxU01WdlhQ?=
 =?utf-8?B?Yjl3NXVYM0NCZ0VPa0ZvdC8vaWtQbWlmNE9JSkxyYjZPaERMRXR3bzhqd0hm?=
 =?utf-8?B?bXNpRVRyYUtBSzJQODUycGVsd01JaVQ3MUgzWE1LT2xaRTQwdFYvSGgzTENn?=
 =?utf-8?B?Q0t3OEhHRTNidWZjNW12TlNhVmxDQVhPa1ZZZ2FhZDFsSTBtSEJ3WmM5NDJI?=
 =?utf-8?B?RERZeW5pTU0xaFRCNG5peVVQMG54cU5NOXdrWXdIS1E0dGdSMCtTeFA5VHZz?=
 =?utf-8?B?dUdPbGVveGdNQUFVYThzQlNxRWxwZnl0UU83TXpURFZIZDEwMTNadlJlUys3?=
 =?utf-8?B?NE5zbi9ZalpMM0FoWjVBRTNWdm1FcmNlOHRMZ0syUFRuK21CaER2Z1pjMjl1?=
 =?utf-8?B?RUdrZU1aWWhNRDFxT2RyMWg4QjRJNGZ3eVhJa3M1SDlXNjZGMjVDQ1E2N3o4?=
 =?utf-8?B?N2lTbmxkVy9MY1ZzbU5TTHo4MUd3WFdsYUt2NG1tVHV4NVlEU1B4a0d0K01H?=
 =?utf-8?B?RkcxM24vWFd0RjJLbzQ5dUN2UlNQTjlScUFmMDROdHZlUjR3dHJMS1JJRlFO?=
 =?utf-8?B?ZE0vempCa1ptNS9GaFpJeHU1dElCTTUwN3ZVRU9HOHVYc29XZlBKY2lhcFJF?=
 =?utf-8?B?R0lvZkwwQVFPYmJlbUx3YVlGS3lxSHlEeldmL0RHTjJZQTVGYm9rRXo1Zksw?=
 =?utf-8?B?a0tJU2RqYUMxdmEyMWUwRGJucmlTNmx0N0tHZE5OUDh4MHZUK3REcEd5emhk?=
 =?utf-8?B?eGJaa2xkempWUHBWQTdyNkY1ZXBlVU5ub08rb1hNSngrWG96ZW9waWNsOFUz?=
 =?utf-8?B?M1U2Y1lZK0lKZElYSTlqZ2x0cVJzMzF4eUUzYzQ1MlFNY0ROTFloWGdaYlBS?=
 =?utf-8?B?cGdBTDVZU1BZdkRmcUtNVWJSdnlHODltUXR3amI2cm5yQVJEOSsxWFhTUnZq?=
 =?utf-8?B?YUQyQ2dRSGpxWlJWaEZ1ZkxOWTM2cXZXU3RMbENYbklrRHVyMStYd1NxK3Nr?=
 =?utf-8?B?Uk5lVjFyOWZKMXo2NkFqd1RDRSt4eWZNQmR3eXQ1WGNsWFQ0WU1YRS9YaEZO?=
 =?utf-8?B?NE5rQUVBeDdBaXpTb2lVT2VwQjRSTHhuU09EcE5IRE9pSVNoYmN1NUx1WEll?=
 =?utf-8?B?RlliNFZQOHJ5WThsU0dDNkdsdzVLbm5VQXhtZEpyMTZwRnpXSTRIc0g0YzVS?=
 =?utf-8?B?a0tlY0g4UnRTSkFxN094Qmtld2R5WU04OW9kbFc5c0N6R0xnR0lBTzkwK1Vk?=
 =?utf-8?B?TFBOV0k4eGxXQVlhTE92dXpWdHdtSi9iRjhUdGx0RmtJYXZhTUZucW4yVVVO?=
 =?utf-8?B?YVJuODJFVTZ1NmpLVlRjMkdZWVBEd1doSVRkNEJsMXhBWks3Um1CR2d1SElT?=
 =?utf-8?B?U3loZ2tOelRIOS9KYlpTc0JxMVl4cHZrZ1RETTFVRUJjS1JkRzk4THdKSDJk?=
 =?utf-8?B?VFM1b3dHdVN2elgvdWVEdmRFRFJwREdab1dYL0lxU1djWG42YWwyVVdNakdT?=
 =?utf-8?B?cjdLeThMekFGcVBpbUErV1F0NE5OYXFCWDNCQVB2SDh1TmY5VzZvcHBmUE50?=
 =?utf-8?B?MjVlbkc1Q1EwK0pwNEpMeTJCUHdRckx0U3cvaWk0VC9LZHBqNHBsWTUzVFRW?=
 =?utf-8?Q?MPlpKxPspWbgcejT0Wk9vc0Z9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4a0e1d2-dfe8-4a51-2ad1-08ddbe079aee
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 10:10:03.2450 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R/vxkFtdPYjy+Lt9E/FsntSCrInrZmpKn/3rAzwEUfMjNEDuzEJdx6tyRO5/YLcp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7552
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

On 08.07.25 10:56, Janusz Krzysztofik wrote:
>>
>> There is no reason to test enabling signaling each of the element in a loop. So there should be something like 4096 calls to the dma_fence_chain_cb function each jumping to the next unsignaled fence and re-installing the callback.
> 
> So how building a chain should look like in real use cases?  When a user 
> builds a chained link of her fence with another fence then may she enable 
> signaling on the new chain link?  If that other fence occurs a chain link then 
> who should take care of disabling signaling on it so signaling is enabled only 
> on the last link of the chain, not leading to a situation similar to what we 
> have now in the test case?  IOW, what's a correct use pattern of 
> dma_fence_chain?  I can't find that documented anywhere, neither in inline 
> docs nor in commit descriptions.

The dma_fence_chain container is basically a single linked list which allows to "chain" together multiple dma_fence objects.

The use cases is to keep only a single fence even when multiple asynchronous operations have been started.

So you usually keep only the most recently created dma_fence_chain and eventually ask that one to signal when you need to wait for all fences inside the container.

The tricky part is that since the chain can get very long the implementation can't use recursion or otherwise we would potentially overflow the kernel stack. And that needs to be tested and made sure we don't accidentally break the implementation somehow.

Keeping all elements of a dma_fence_chain in an array and asking all of them to signal individually makes no sense, for this use case we have the dma_fence_array in the first place.

Regards,
Christian.

> 
> Thanks,
> Janusz
