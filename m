Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C563BB20836
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 13:51:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54ADF10E2E1;
	Mon, 11 Aug 2025 11:51:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="juOzpDoS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061.outbound.protection.outlook.com [40.107.236.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 399CE10E3C9;
 Mon, 11 Aug 2025 11:51:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z9P4JoPi/WoWmiYaXt7FC+l+sKtK2CDuhTrHRLPf4usY5A83VACZE5IGYs/C5yy6eAYPYkoiMpJOaMhnGH2/7hPHI7cNTa7bEMkcVakUmjHT/6WTn2SfIF7YBT4niQNGdmIg/7TMnHiB6WKjeQ/EZsDv8/G/RaBHsu034r5i8dqMKaqo8lVSYpLWKR0dvjx1hjw7mjMbf+4FCiK/5P7/xqfiT9lNyAfVq6l4TfQf8puMBxjPPSnb3v+AAo4dw/M1s2tg8e/l8uHv7HSu5xATwAd9f55xWiLLnrn5S3Pb0TZERT1xg/dqwGHDkAJVWJT/glaWOnJ9jqyGkw57HJ5z4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VpWnXWeeepUPvls5mtX5QiEElz4mP0kVB75hJk8jsMw=;
 b=dVDsTsVfhcVeb7EkZoYgq/IsgTRzzYtLq2ToXbAFu67WIyReGLiB8dmEzsj7DXKd3RkB7+Ck/twgG8BhlvDR94gqZZW24CieQoZCUOPA39wm4PjEatjm6XLOTJGp3iFYXOcGYZ24lCsFiimvXUOYGCD1TygqAQcxBsk2S0ZdSCjG54RFronFcfNJEambER/OkqQwjVKTdEig6iySyYghDRamswugbPE6RGt9giIPVS6vbZmfNNdNZS1gAAdCbM2V71womHi+MK3ezywB2Wiy2uGyME5MiQ03u2EoUxEgEFa8SpMDx5dDXrfUoR47SJr3S9YybRXGmTrkjTL/lMZ63w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VpWnXWeeepUPvls5mtX5QiEElz4mP0kVB75hJk8jsMw=;
 b=juOzpDoSvVTe2Ti9SpEx90ug5vwRse3c6T7+9j4nHMd2vJ4AK7zYCJDSUTQc0G2QvzcSCFk44gYetGQRIr2rfKcIdBTSLm3lLh4R4sFDeqIIvdrJR0H5vr5rK7KZew0ftYemPC+WuYAjOhdyepCfFxzs5K3MxfTEL4IcRcV9tFY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB7748.namprd12.prod.outlook.com (2603:10b6:8:130::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 11:51:17 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 11:51:17 +0000
Message-ID: <76b287bf-9698-4df2-ac20-70b178a3a7c1@amd.com>
Date: Mon, 11 Aug 2025 13:51:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: WIP limit the TTM pool to 32bit CPUs
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: airlied@gmail.com, matthew.brost@intel.com
References: <20250806132838.1831-1-christian.koenig@amd.com>
 <3ff97e0ee433817c0c071c264d3a28622d717dfa.camel@linux.intel.com>
 <d6830af2-52aa-4ca6-85c5-2a4635ce6c7d@amd.com>
 <be9d451d511f8bc4652d835a2c28fa823aaf05f1.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <be9d451d511f8bc4652d835a2c28fa823aaf05f1.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR0102CA0014.prod.exchangelabs.com
 (2603:10b6:207:18::27) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB7748:EE_
X-MS-Office365-Filtering-Correlation-Id: 20ae9019-97fb-4ce0-b7f1-08ddd8cd6191
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NE5jcnlEZzRtdktKQnJEKy8wZEsrMjNsSXRaSVNkRGFtQ042K2ZsQW5jbGlH?=
 =?utf-8?B?eVNxbVYydmo2Unp5RnhFQ2dTMlJZWnZIMHNBSEh2dWtQOVpHSEQ0cmd0cDln?=
 =?utf-8?B?ZXUzR3grcmhsRk5EVjNHb3ByOW1NYURrYWg0UmJMSSs1ZFV5VXJ0YkVJVGJu?=
 =?utf-8?B?ZTV5bjFrQ1o3UlVsajI5U1N2bjR3T05vQ253VDYzTlJWZ05pTFhMWXBrQWFL?=
 =?utf-8?B?SHQ3QVhLa1dkWDVpUWxZNGdXYkhKdDBsdkJPVVBGQ0dPZG9zYm5GMHJkdkcv?=
 =?utf-8?B?U0dCNFBhaEp3L0JVK2hDUnQxVzlYanhVTG9kVFlTWEdGL1ZiM1Bmd0lmMk45?=
 =?utf-8?B?OHRnckRGckthdXdGZFBXVkd5T3FtRys1Zk54Qk9Na1o2MEQvWndnQ2pDUGFm?=
 =?utf-8?B?eFZIa2NxRUxhZFJPcHZTQlVaNzd3RExnRXIwT0RQWk8yY3ZZUXovaTJJNnhX?=
 =?utf-8?B?bHMrZUZraWlWeVllSEpjSTBPaTlzaDFHaFZRRXFCNGlJcjZBemNVb29LeDJv?=
 =?utf-8?B?VWd6M2xPTm1pTS81R3M0VGlCUDJVRGFQaHY2cFFaVitiMndwQnFKOTJqN3c3?=
 =?utf-8?B?cjJSUm5VK01OYWNmellIYXFiZFFOK2dnaisyZ0pMZzZiK0RqejVQOWJCb1RP?=
 =?utf-8?B?TWlmdXlnb0RDN0UzY1NvaUovS2tIYmVPd0FvSENqOTh5NUEwSGNjdGZ3ajBu?=
 =?utf-8?B?cHVHV3pta2JOejg3blNCeENGVnh4RnA5b0M5WnRjZ2p4bTRWUFZhNDRpOGlu?=
 =?utf-8?B?bjVoRTFvODd2eTRTRy9WQ09rQVZpcjRsYURGb3ZYZjBmanBvWk1FMENSQmVJ?=
 =?utf-8?B?dUtGUVMzUC9Md1hEb1JBbzRuSHpnV0dnTTVrODVFZGpiMkxjRVkrWm1hZWQ2?=
 =?utf-8?B?NEx4UTJLUU9qcUFaMnZ0b29VMFE3QmVESmRTNVgya2FyOGVLMk9GVG5ZczIw?=
 =?utf-8?B?ZFZycm9vZ2srZ3pRSjhrdXZnWUFsV3BFQ2hrR3RpMGxOL2JLclQ2VytRSEdI?=
 =?utf-8?B?Q2Y1TlhLYlFhMy8wSWZOUElDanJHcEhmb0RNL3hrc28vR3JtSWpFMjBDQ0RL?=
 =?utf-8?B?Z2Y0SWpCc1YwMHVCQ3hCQklqby9rOWVDbUxqSzBDM2xreDlYRHhiZW56M0Jo?=
 =?utf-8?B?YjBTaTVSOFg1NDc2c2hMQXMveEdJb3hzQU1DLzZRNTUwYnBrWGZDM0MwbDJN?=
 =?utf-8?B?YlBqVTAxcVU5Y0JlNk5zbUFUK29nM3g0dWlEK2FxcEpwVHphS1RuRWNUTHZB?=
 =?utf-8?B?QjFRWnNFclNYUVJvN3dSaG9QMml6Y2NHWWR1blNNRTZNMVJtcjlCZ2NjMFdF?=
 =?utf-8?B?cnNhTzJ4dUE1WEFZeFZ5U25ReUJ5ZUpEOGlibnRLSk1tU3FWOU4zSVRkMDBN?=
 =?utf-8?B?ZEtpRUQvRGZlOE9JQVA4WXRGMnI3anNybUZWK0JISUYzMjRra1JYbzZzdzc4?=
 =?utf-8?B?Rk1BM0pCT3JHYkYxRGdYRnlMcE41OWtYL0FTaThVWVI5VDg2akUwd0tKUmd3?=
 =?utf-8?B?TDdqQTRobDNLaTNJMjFEc3R0REVGTEc3UWN4R3JKWG5nbDNyUkxTQVlWRnFB?=
 =?utf-8?B?cmVhdkRHeDEyMW0wbWpudk5HeVZIRm4xemZvK05tWW44VEdkQTZVVWhnZno2?=
 =?utf-8?B?bGc0SHpkTGh4M0xISS8vZHNLOXRqS3N5UngzOExXdWdSSHN3T0NmM2ppaHBD?=
 =?utf-8?B?Q1craWJjRnRxT0NSRGNGWm5oMXNnbzd5WnpWOElhRzVhODVKRmZ2anJDbjRw?=
 =?utf-8?B?WWZEUCtJT2xpa0QyQ1pnNlJzOG9PZ2xBTzU2U3dJclhZL0t0cjJRYlliYzlB?=
 =?utf-8?B?UGE1TVAwR3NNL3loMkxtaEdaQ0NtUGx5LzJHMWRoWVA0UGZ3VzREYkJiSVZN?=
 =?utf-8?B?THJrVFBqY0RMNzJxRFo4Z0Rkc2tsNFpGTUdDdFVLQmRQbm9IeWhYSVpFSHdE?=
 =?utf-8?Q?vr5ecxrqQOs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDh4Sm01dmtycDB1TXlEUGlFY3hqOWp6YkR6eUJFVGQ0Y1dXMko1NnFnN3Ru?=
 =?utf-8?B?R0JEU0FFWEdEK3ZsN2dLQVVkbVhmL2hoYVBwZ0p5NklCdXZtMElubmZPT1Zi?=
 =?utf-8?B?bVZEemJVOE5oUlRKbXJBcTBlblE3VU5ZL1krZTJ1K0hrenhWa2QrWEI2cU5w?=
 =?utf-8?B?S2NIamxRSEZEVDY4YWFpTW85cnduQlhKbVU1M3ZIdE5nWm1OdEUrRzd3R1Ey?=
 =?utf-8?B?MytvSDJKNmpmRWpyZ0lPT2Y1WlljanpnSU4xaXNMNnF6Z0tPRGMrQTNnbmNS?=
 =?utf-8?B?cDhYSnlWazJ1bmtteGNOeHp0NkFCSjRaaVBMNnBCVUlCK2hEbE94N0JMTDRr?=
 =?utf-8?B?N1pXNllWNE5zRjBtdFFHcGpqb2E2aTFwZjd3c1dJajdYanZUMFgxY0VoNjcr?=
 =?utf-8?B?L1ZBbEdQcis5RVZZVXNGRm5peUk4N0graTliQTVFRVp0Z1krazJNYnFuRDBx?=
 =?utf-8?B?MGZqZG1zY2ZxOE9TN0dhMTdySm9Eb3lCS1A5dHQyWWdZWXV4a244ZHY5dHNY?=
 =?utf-8?B?dUp1UDhPTmhlUFBQYXZ1QThseHQrMFFqQXgvMElqNWk3OGplWkF1UEdSNGtw?=
 =?utf-8?B?ZGswTGRQRWl6cUdvNEE0NmhYdm5pRFFMNnVpZ3M4TjFua2k0QVpxOWVUaW5T?=
 =?utf-8?B?RlBHV3E4LzVkUkZOTDRDV3hkMDNXMUM4WDBUNmtDTHMxVVJYbExOMzF4Z1lK?=
 =?utf-8?B?cG5PYlZYUDlyREtkRFdmcDVpMWNBTkhVOWdsNUVYR0sxV3J4eFAwMm1zZmFK?=
 =?utf-8?B?aTVia05NL3NEdUM3SFJHVWkwZzBheWFOQWtMUDZqdWdLZ0lMWGhqaXpSOTRn?=
 =?utf-8?B?Z0F1VTd0aFh0c2ZVcm00dEN6NEF0aDNwcnAwSEZwaWJZazlVdFNzRmhCQ215?=
 =?utf-8?B?ZXorNm56QStvRkpIUStYYllpTHZZejJ5RnBzdHlac2RiaEM3WkZkUnhrL2Nq?=
 =?utf-8?B?emQ5VnpQcUROVm1xR2RLeG5mQnEyVEs3TXRRZUpWOVVmQmF4YW81Z2ZFRzA5?=
 =?utf-8?B?ZU5pZ0dGK2JudnBRYnlUejRxT2RMbURJdTN5UmdKWVBibk1WNjU0RTRhcmpm?=
 =?utf-8?B?RithdDllRFFzSHl1VnVMa2krVnJmb0lEKzJtcmVWOXY0ZDhJN2w3ZFJmVVJr?=
 =?utf-8?B?OFBHRFRQLzNORHUrMFg0SllxNEYxWUJCWnY4U0d5NkpDNjFXQ2x3Q3BmZm1r?=
 =?utf-8?B?NnF5WEhhVS9sK1pQYk0wWTdwdEg0RjFpWHdwNjZGRXZFdllkMWFDWTdXbzFz?=
 =?utf-8?B?cmx3eEI2anB6M0VyRk1EUU5QNmdpZE93cDkxUExEZFlLYlVVblhycUovQ05I?=
 =?utf-8?B?eGhEOXdnMFl4WkV4dG54TU52ZzJiSFlpbnl3MHA0VVU5NUo2b0RpSnpsK1Vl?=
 =?utf-8?B?RW45YXE1aWpLdUhJVTI3MWQ3ckRYOXZIbnpGU1MyWDlBVlNLVEw2VXJ6RVA5?=
 =?utf-8?B?SUxQNE1URTFlZnF3ZTFDanRKcWJmajJqdElURzZVYmwvb0R0USswNzJyMDBn?=
 =?utf-8?B?SmcweDdjbS9sV1g4bktiRXpOTVZibkFKNE5wTk92bzMrdkorQy9uL3BVMFhk?=
 =?utf-8?B?OVUwSmNadm02a0RrSGFXTnVuOTNkTWNmZmJhMExrOEJVOEpqdFN2dXJnTGdM?=
 =?utf-8?B?Sk9scms2b3Vrc0xPVTIrZ3JUa3dtOEhZcDN0aEU3VlA0MW41MFFaNmJ1clJF?=
 =?utf-8?B?ZTVIUjhLbW92QnhqcmQwTUhkRXRJUWloMjlqa005c2J4MGNPYklqTjd2aklx?=
 =?utf-8?B?dUYwWVk1ZlVZLzRLMmZXWTVqZXBKYitBWmdtMjJiZUdmdDh0WnJoSmZqTWwz?=
 =?utf-8?B?dS9EU0Z6SFpqZXd5YWhTOUhyWlRDcWcrcTFMOGJMODdmOWpYZFVFd0crTHMz?=
 =?utf-8?B?T0ZneU95MWVlSDZaSFgzNUkyemhIWlhQVllTam5GaDY3MFV2SUpwd3ZUWXA3?=
 =?utf-8?B?djNhYVJBRTVhc216L3VVNmJRbnFVellYK3U5eXVQLzJSTTBRS05qOWJhbm5q?=
 =?utf-8?B?c1l5QlUzazhlT2ZSemtPbXJjZ2pJcXlYTVgzSlNnMzdMK3d6VmNhKzFnRlA4?=
 =?utf-8?B?b0kvcHBseHJEc1M2V01uN3hlK1ZRQnlsTnF3YjFRL3N3MERITTVkcFV1bHJw?=
 =?utf-8?Q?nBoJ36FJmftGZgIE+xvruWZxD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20ae9019-97fb-4ce0-b7f1-08ddd8cd6191
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 11:51:17.4912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UlkSqr+C6JpveVJa1orsx4bS7zzQ1wr84DSazCqaE2525uxwjrWPKohY+bLB84B9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7748
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

On 07.08.25 18:47, Thomas Hellström wrote:
>> Well it's surprising that even modern CPU do stuff like that. That
>> could explain some of the problems we had with uncached mappings on
>> ARM and RISC-V.
> 
> Yeah. I agree. Need to double-check with HW people whether that is gone
> with Panther Lake. Don't have a confirmation yet on that.

Going to ask around AMD internally as well.

> If it wasn't for the writeback of speculative prefetches we could've
> settled for only have TTM map the user-space mappings without changing
> the kernel map, just like the i915 driver does for older GPUS.

We should probably come up with a CPU whitelist or blacklist where that is actually needed.

>>> Second, IIRC vm_insert_pfn_prot() on X86 will override the given
>>> caching mode with the last caching mode set for the kernel linear
>>> map,
>>> so if you try to set up a write-combined GPU mapping without a
>>> previous
>>> call to set_pages_xxxxx it will actually end up cached. see
>>> track_pfn_insert().
>>
>> That is exactly the same incorrect assumption I made as well.
>>
>> It's not the linear mapping where that comes from but a separate page
>> attribute table, see /sys/kernel/debug/x86/pat_memtype_list.
>>
>> Question is why the heck should we do this? I mean we keep an extra
>> rb tree around to overwrite something the driver knows in the first
>> place?
>>
>> That is basically just tons of extra overhead for nothing as far as I
>> can see.
> 
> IIRC it was PAT people enforcing the x86 documentation that aliased
> mappings with conflicting caching attributes were not allowed. But it
> has proven to work at least on those CPUs not suffering from the clean
> cache-line writeback mentioned above.

Makes sense. With the PAT handling even accessing things through /dev/mem gives you the right caching.

Do you have a list of Intel CPUs where it works?

> FWIW If I understand the code correctly, i915 bypasses this by setting
> up user-space mappings not by vm_insert_pfn_prot() but using
> apply_to_page_range(), mapping the whole bo.

Yeah, that's probably not something we can do. Even filling in 2MiB of address space at a time caused performance problems for TTM.

We should probably just drop overriding the attributes in vmf_insert_pfn_prot().

Regards,
Christian.

> 
> /Thomas
> 
> 
>>
>> Thanks for taking a look,
>> Christian.
>>
>>>
>>> /Thomas
>>>
>>>
>>>> ---
>>>>  drivers/gpu/drm/ttm/ttm_pool.c | 16 +++++++++++-----
>>>>  1 file changed, 11 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c
>>>> b/drivers/gpu/drm/ttm/ttm_pool.c
>>>> index baf27c70a419..7487eac29398 100644
>>>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>>>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>>>> @@ -38,7 +38,7 @@
>>>>  #include <linux/highmem.h>
>>>>  #include <linux/sched/mm.h>
>>>>  
>>>> -#ifdef CONFIG_X86
>>>> +#ifdef CONFIG_X86_32
>>>>  #include <asm/set_memory.h>
>>>>  #endif
>>>>  
>>>> @@ -46,6 +46,7 @@
>>>>  #include <drm/ttm/ttm_pool.h>
>>>>  #include <drm/ttm/ttm_tt.h>
>>>>  #include <drm/ttm/ttm_bo.h>
>>>> +#include <drm/drm_cache.h>
>>>>  
>>>>  #include "ttm_module.h"
>>>>  
>>>> @@ -192,7 +193,7 @@ static void ttm_pool_free_page(struct
>>>> ttm_pool
>>>> *pool, enum ttm_caching caching,
>>>>  	struct ttm_pool_dma *dma;
>>>>  	void *vaddr;
>>>>  
>>>> -#ifdef CONFIG_X86
>>>> +#ifdef CONFIG_X86_32
>>>>  	/* We don't care that set_pages_wb is inefficient here.
>>>> This
>>>> is only
>>>>  	 * used when we have to shrink and CPU overhead is
>>>> irrelevant then.
>>>>  	 */
>>>> @@ -218,7 +219,7 @@ static void ttm_pool_free_page(struct
>>>> ttm_pool
>>>> *pool, enum ttm_caching caching,
>>>>  /* Apply any cpu-caching deferred during page allocation */
>>>>  static int ttm_pool_apply_caching(struct ttm_pool_alloc_state
>>>> *alloc)
>>>>  {
>>>> -#ifdef CONFIG_X86
>>>> +#ifdef CONFIG_X86_32
>>>>  	unsigned int num_pages = alloc->pages - alloc-
>>>>> caching_divide;
>>>>  
>>>>  	if (!num_pages)
>>>> @@ -232,6 +233,11 @@ static int ttm_pool_apply_caching(struct
>>>> ttm_pool_alloc_state *alloc)
>>>>  	case ttm_uncached:
>>>>  		return set_pages_array_uc(alloc->caching_divide,
>>>> num_pages);
>>>>  	}
>>>> +
>>>> +#elif defined(CONFIG_X86_64)
>>>> +	unsigned int num_pages = alloc->pages - alloc-
>>>>> caching_divide;
>>>> +
>>>> +	drm_clflush_pages(alloc->caching_divide, num_pages);
>>>>  #endif
>>>>  	alloc->caching_divide = alloc->pages;
>>>>  	return 0;
>>>> @@ -342,7 +348,7 @@ static struct ttm_pool_type
>>>> *ttm_pool_select_type(struct ttm_pool *pool,
>>>>  	if (pool->use_dma_alloc)
>>>>  		return &pool->caching[caching].orders[order];
>>>>  
>>>> -#ifdef CONFIG_X86
>>>> +#ifdef CONFIG_X86_32
>>>>  	switch (caching) {
>>>>  	case ttm_write_combined:
>>>>  		if (pool->nid != NUMA_NO_NODE)
>>>> @@ -980,7 +986,7 @@ long ttm_pool_backup(struct ttm_pool *pool,
>>>> struct ttm_tt *tt,
>>>>  	    pool->use_dma_alloc || ttm_tt_is_backed_up(tt))
>>>>  		return -EBUSY;
>>>>  
>>>> -#ifdef CONFIG_X86
>>>> +#ifdef CONFIG_X86_32
>>>>  	/* Anything returned to the system needs to be cached.
>>>> */
>>>>  	if (tt->caching != ttm_cached)
>>>>  		set_pages_array_wb(tt->pages, tt->num_pages);
>>>
>>
> 

