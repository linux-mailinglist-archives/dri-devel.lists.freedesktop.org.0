Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56329C0C2BB
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 08:41:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 393AA10E028;
	Mon, 27 Oct 2025 07:41:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cPrbPUzb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013061.outbound.protection.outlook.com
 [40.107.201.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F5E110E2DA
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 07:41:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YGJOHbrq8tTwyGwtSEOV+bZnqu+947JOhQT1nWEyVCJbTYK2jQXqLAmgsuxsn4hyJ7bDh61NLx71VBXqfrwz4pHAJVKSknWijfl+f4jHhg2yH+ayjenMZQy70neWmLh+jp/PuRd3uvTbvWRZ2fexDWdLfx4Ww6cixcDm/+Il8U0Lmeqde5rbP1yX5e/7EqgGZTzfNIziJxsecPUjFLvUJHiNkvACLQiL80qs/bWbiG/X8K6tNobb3/bhA2DwFC5hnoxTQ54Gk2mubBIfR+VqHOwJekqhdPUM20kIJrCyypyCOGA8gaSSuhvHmaWTVl792S9HkrYCkKQpxtJJTwUvfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qbgsrjunrc1uN/Ez/FcFpDbxwvyBQkSMJM/WPzeoe0U=;
 b=wbsJqnvgpClATNegTcCb1fY+xZqMBqNyd7cVXk3sovPZfouP5ptzz1x/U2qsguLs5+oYBx3YLtWpor71ZzXShv/51owtQa7sdubmadO6EFY1QSO2x8DUU2/bAaot26RhiuZFcrgDh63XKVkINn1v6xf1UcS1LnuBmraAsu+9dVvtRk1nS5XzaKf0xuiWB2ToDVjB8CB89whu3fcaOS3TofPLPrVFUIGfg2Sd7M41oL2MLjfre2/exLnvkBfqqnUcwSZh/iKJUBaCCvsgjNeoJJvlkPmoGCKSZL4SY+2FbedjA5bH/jpvlj7mJ5FVfTBf7gDQWPdvJhu/Yle3rULH1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qbgsrjunrc1uN/Ez/FcFpDbxwvyBQkSMJM/WPzeoe0U=;
 b=cPrbPUzbWgWAgB4A7A8h1pGzWnAPu5092FkfYMrbMTiGWOo3o+buUuI7DyK1hq009qsD2TOUbcTah0l2MmMDCRNV4xwGX3/TzipAFMaSoVrJfThwJTNd62wmiZmO6JrA/Cd/Y3jYjeAWDfvLL4F13hlgzUWwt59Vq7km0dPUiJU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by DM4PR12MB8474.namprd12.prod.outlook.com (2603:10b6:8:181::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 07:41:49 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 07:41:49 +0000
Message-ID: <b66c5faa-1664-424d-9b32-c5e0729f3976@amd.com>
Date: Mon, 27 Oct 2025 08:41:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] dma-fence: Remove 64-bit flag
To: Matthew Brost <matthew.brost@intel.com>, phasta@kernel.org
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>, tursulin@ursulin.net,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20251017093146.169996-2-phasta@kernel.org>
 <aPK04r1E7IbAZ9QY@lstrano-desk.jf.intel.com>
 <7b53f502aa0eaee4ffe4350621ddbcbfaafcad06.camel@mailbox.org>
 <aPYabivOBSJ1UChg@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aPYabivOBSJ1UChg@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0532.namprd03.prod.outlook.com
 (2603:10b6:408:131::27) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|DM4PR12MB8474:EE_
X-MS-Office365-Filtering-Correlation-Id: 3265d3e3-723f-41fc-92d3-08de152c4986
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bXpkTzZxOWJ3QXdmdEs0RVBQM0ZaVmt2MjNIN0pGY0E2N09TS3pmbUxZWFBN?=
 =?utf-8?B?b21iNGRyQnRLcTdmQ0RvMkVvS2tuTjBXb1hVR012cFpCT1U3MFdWSmJsU2px?=
 =?utf-8?B?aUFpUzJ5dFg4RWUwdGJFZFRuVXk5cThsM0ErVmFkWklrdHhTSHFqTlBSaGFz?=
 =?utf-8?B?SXNyR0hSU2paOE5aYWhtbzJFNm8ySlc4WUtBbUlWVWRmUjQzanIvWnlnSzlU?=
 =?utf-8?B?SVBVaEpxZDhMNS9iNTNrMFpWZklNOUsyOWFwa2M0T3dvUmRjWGhWYWdmbHpK?=
 =?utf-8?B?elFzN2pTelVZcEVGbTNqQUsweEI3MklsT3FucCt3VW1DYlVxRFFDQWZUNEYx?=
 =?utf-8?B?UXZ3TW40emtCZXJ2c003VFI5NlAwRWRkenBiSm5EUnB1RHJsTlRPT29ZUHkw?=
 =?utf-8?B?MSs2SlVxNWJvaW1wcUtDRFpZV1pyNFQ4Z3NmeVhXT3Z4WnpEVWtrZndtL2ZU?=
 =?utf-8?B?a0hzT2Jmb2gyUkdCOHVFTnBORjdJYU5DOFVqdFVGbUp1Q0dXV3k0Tzh1MlVT?=
 =?utf-8?B?MlAvWFNwOXNFOTVJalBKQ3hhMEoyMVZPSVZPbWxNM1lzZHA1NzFISVp2NTZo?=
 =?utf-8?B?Z1BqRTZWbmo0bEdPQU90SEJ1VHR0b3lLSlNvSk1vRDVCZ2xCNWhId3k3blRL?=
 =?utf-8?B?cDZabDZDbWhiMHhjb2k1NTI2MVB5TGtGK2lBcnAwQUgrVzczM0g1Z0R1Y2dl?=
 =?utf-8?B?VXIvNUFGaXZDTlBDQW1jQVBSb05McTJJYmsyUXREeVRXbEtTT0xZdjgxOEVK?=
 =?utf-8?B?Q2F2ekJ5K05kdnRuQ0YzU0gzeSt6RzlpUnFsekl5TnFsczZPcmgydG90Wnh4?=
 =?utf-8?B?TStJbm5JeHhwV2k3a25xRmlVTFY0ZkdtY3RFR3RXZzNPK3NhRnFzdnd3bWlk?=
 =?utf-8?B?S0lXWWRSWXBXY0I4b2Y3Sno4NS9zTU9TSWlYS1hiSGFWdjU1ZmFkZ2JVSThM?=
 =?utf-8?B?ZldjTG1VYWJ1NmZPcWVCcExRTkdYWm5WVkcvZ1lTU2crazNscC9UaHkwUytk?=
 =?utf-8?B?RFNJWUMwUFg0VFZJcXRmQWJRS0xtTGRERDB2SXJHOUdlZ1ZhV1locU1xOHBM?=
 =?utf-8?B?UUxQeDVYdmFUZkkrT2dSZkpBZktsdnE2RW1IM3lTNXVWSDlCV1ZzYXdZSUpB?=
 =?utf-8?B?bWVMTG5xODRkakRpZTFQK0dXOHRJaVdyem9KWjNXT0VjTkd6OGlmK004M3l2?=
 =?utf-8?B?UmNzYTdYejhhc2xGTkZtMnBUY3JDY3hKc2JIL1hKeHNMQ05RQ24wQ2JkOWhv?=
 =?utf-8?B?L09WNWswWk9yL1NQZVJiK00wc1FDa2tkbzJudW9zdDZpUVI0TStKOE9Odk9H?=
 =?utf-8?B?eHIyY0ZvSUQyQ1pLUjhvM1RJdlBNZU9uOG1nWmRJWUloNG9SZTRPdFRPNWpv?=
 =?utf-8?B?Snh2VW5iZVFYUFB6ZWgwV2ZLUTRIMGdXKzVmRVE4Q0xLc3FGRWlpWEdyT2pY?=
 =?utf-8?B?V1RkQTFLZXZaSUVMcTdCNVR2ZGNqZDllRXpYeWlWa1ZaTno0R0hJSWVaR3V2?=
 =?utf-8?B?UW9uUENaZGF4WFdIR3NqUDFiRXRMV080VnAwdHpFTDEwTXkzQS9NWHZveFRW?=
 =?utf-8?B?emNFV2EvQUU3TGxPVGRPYXRiT2dNSzZQdytnNVJnL3R2TWpreTUxL0hqRlFy?=
 =?utf-8?B?dU1hck9kMXJtY25CZDZzRzhHemxibVJSSHBxaVNWTS93QnByVGhUYmwwWXlC?=
 =?utf-8?B?M0xmNTNNZlNUcHgweWtEbFc1UTlJMDg0TEYzL1lRd2hjelVScW80YTlVMnEv?=
 =?utf-8?B?NHJlVnU4SXg0UlFVcWpNSEZoRzcxZFpWVXZDRGpzcXVOeWFSd0paWnNReVR5?=
 =?utf-8?B?SENXazE4dFdXWTJWbWpHTmE0ZExVS1p6TlkwOEpjaGh0Y04zU1RDODQ2ZVRD?=
 =?utf-8?B?em9sOUdxTXlCTktMZnFlNHJCelNTRmluRWxCSmxvTDExb2c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2tLOStqcEpLdDZ0eUkwaER5VjQvN1JpTmdRYnA0R2RVTHNXVEZ6SHJmaHdy?=
 =?utf-8?B?eDBSb1hRY3hjTUFwakREUlRkQmR5ZThJRnE2K08rdDhGQm13MUg3NnVzZFFi?=
 =?utf-8?B?L0YrZHRyMHVtWkxRSk9vbVpGZnRKSlJuM1RjZ1dTMmhBK3o0Z3duU3pNZVZu?=
 =?utf-8?B?VnVRSFFnQks2em05eDE0c2xUcGsrbVNZNnhOSXlNS0dvL2VuS215NUJjSnFF?=
 =?utf-8?B?NlRiZ2ZOQlk2UlY5LzJTSGQ4eXcyUklxSGNtTWxlcWIyaFhXdUU4VFdaOEUr?=
 =?utf-8?B?Zi9MRmpsenZFSjFFV2lqVnBQRER5OUpDZnZKNGgvUDlPMHpZVUd3eG1Bazdm?=
 =?utf-8?B?NThLeEp0UUhTNnBxSERtc05oUmh0UmZDb2JPWkVQRWxFT3hNamZ1NkxxcTA3?=
 =?utf-8?B?UFlJK0JnR1NaU0srd0RFT1VTWVJYUmxjNklsdXNZYmZJdHRJMVd0WTlaYlU4?=
 =?utf-8?B?b3FRcVRRY09IN25OSGtPT2VreW1XRWQrMlgrei9nS09WNnZod1d0RW1LUzJz?=
 =?utf-8?B?RTliUkZWazdLNk5oVXVOLy9XTSsvOXUvRlJ1eVZIL2JsSTJVZmVPVkV4MGt3?=
 =?utf-8?B?VnhOOGRzVENpQkd3UjdWR2piY2hmUFM3aVU0Q09NT3dOMDhTakNGdDMvQVdZ?=
 =?utf-8?B?d1ZyRlVnb0gwRUJpWU95bVVyQStFOWtMMjVCUmU3cndMWm5sanRnRVBCcG9J?=
 =?utf-8?B?TUVTWGFLalJnNGVnTkFkU2dBai9DVzQxRU1RbHA5TnhTVEl5alF5L3ByMWEv?=
 =?utf-8?B?M1EzMnpWSWQvdmdmS3hRZjREa0g2OW9hZjlqSzU2SmtpTWJub0xReW9mb2h5?=
 =?utf-8?B?a2lTUFdIYzFqcG5IWW1RNnpmRlU3dFQxdTVaTE83NkRNS3RJNGtoVERuY1cz?=
 =?utf-8?B?N21PTWF6aUF3bXBvOVVscWJ5MHJNeUtnWlNmYlprb0hVVzJTVWpyMDdCQVVy?=
 =?utf-8?B?Q0R3Yi9hNVdXYWdxejR1aEpqckw5cGdyVS9VMUo0TlZ0WXpyVDN5L1dOR2Y1?=
 =?utf-8?B?VWtTczFjdkIycE52U1ZrL0RLbFpHd0VncDRIdTJ1UzdCNmE5MFFIZW9idUZC?=
 =?utf-8?B?ZzZ6VC9VMklxVExZZ3Mzd0IrRklZN2kreUZDeXBqa3hFRzlFN1RPZ3Y2UXov?=
 =?utf-8?B?WDBCQXVueEFtNjd6elZid0x6UmJqeStnSm0vQkZIa3pNYkMyeHAzZkJVck5I?=
 =?utf-8?B?MEh6RWtncDBSekFMUlU1cUtqQ25QeXo1MldxQUpDOGNGeDQ0Q08yL05EcGRI?=
 =?utf-8?B?bCs5V1FpNkUyY1FINk4rMnMrK0dCSlU0ODFuNEFUUmhFczR3a0Z3WUFRTmxm?=
 =?utf-8?B?dXdIOTRVN2poVWVNMG5rSGNKa1JEM3NvcURObnV2N1R1RStkUDNMTEtxUjlL?=
 =?utf-8?B?VE1VUENhVlRoV3pHTHlaS1FMOWFqeWhmeTBrTHpmZ1Vqc3F3TmpBWkpYMGJH?=
 =?utf-8?B?cU51ZjdsL0xpNVgrejdISUd2V2l6dnNqS3FsSTNaS25DRlYyYXN6R3FFN2Z1?=
 =?utf-8?B?eG05Vk1ZUjYrTVp6LytOcnZLM1hpSHZVUlNITWZYb0MrWWNUY0hkaFlseFY3?=
 =?utf-8?B?K0x2L3ZtYndoQWs3NTVUam4wcXQzMks4ZUw1Yml5RFRRRkREdG1XeDBYbWJw?=
 =?utf-8?B?RlU1STRNRWRhUEs1UzZ6YVNlcWUrZElKL3pQSnBzYVVMTUYwcWJHSE5MZEdr?=
 =?utf-8?B?c1RtaXVjZWZPK3ZzYUNjSTVsb3I0aVFwc3kvTHdGYTdMNzNhZVNuNSt3R0Q4?=
 =?utf-8?B?TUZnRGVNc1IzNWRhUzFESVlJaFErL01VOXFCYzMxeHJKdU9rRUdnUVVRZk5a?=
 =?utf-8?B?N1lkS09CUWRacVRXRm9ESGpLSmxiZ0EyVU1Ya3NHWkRDL213RnRxckZ2MEZ2?=
 =?utf-8?B?VTVTSkJEZld2N2VIdmNwUks4YWQxVGtQVFc0R2pVc24xaG52YndxNG5rKzFj?=
 =?utf-8?B?RSs5Yk9pcU5kY3M4V3dCU2RmL0FRaHRZYjI1ZWRJaHRtektMU3RDdE1VOUZL?=
 =?utf-8?B?SWZ3bFhjZjFtazd0dk14Z3d4clpNOEQ2eTVGbjZqMmgvMUsrNnIwdGFmN2Vw?=
 =?utf-8?B?VzAzQ2pvYSsyR1ZRSTV2MUhONFpNY0hILzNoOUp0WjlHUkF2bUtzL2plRlBy?=
 =?utf-8?Q?3Rb+PLI/sZDSGVpyg0Oo2lxxm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3265d3e3-723f-41fc-92d3-08de152c4986
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 07:41:49.1517 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e2oA/vJpEYBgkH5Rqa48FVyF8opQkBL1D75/ilHhouua5rrSD9dkxJ6BmfBfbB8J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8474
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

On 10/20/25 13:18, Matthew Brost wrote:
> On Mon, Oct 20, 2025 at 10:16:23AM +0200, Philipp Stanner wrote:
>> On Fri, 2025-10-17 at 14:28 -0700, Matthew Brost wrote:
>>> On Fri, Oct 17, 2025 at 11:31:47AM +0200, Philipp Stanner wrote:
>>>> It seems that DMA_FENCE_FLAG_SEQNO64_BIT has no real effects anymore,
>>>> since seqno is a u64 everywhere.
>>>>
>>>> Remove the unneeded flag.
>>>>
>>>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
>>>> ---
>>>> Seems to me that this flag doesn't really do anything anymore?
>>>>
>>>> I *suspect* that it could be that some drivers pass a u32 to
>>>> dma_fence_init()? I guess they could be ported, couldn't they.
>>>>
>>>
>>> Xe uses 32-bit hardware fence sequence numbers—see [1] and [2]. We could
>>> switch to 64-bit hardware fence sequence numbers, but that would require
>>> changes on the driver side. If you sent this to our CI, I’m fairly
>>> certain we’d see a bunch of failures. I suspect this would also break
>>> several other drivers.
>>
>> What exactly breaks? Help me out here; if you pass a u32 for a u64,
> 
> Seqno wraps.
> 
>> doesn't the C standard guarantee that the higher, unused 32 bits will
>> be 0?
> 
> 	return (int)(lower_32_bits(f1) - lower_32_bits(f2)) > 0;
> 
> Look at the above logic.
> 
> f1 = 0x0;
> f2 = 0xffffffff; /* -1 */
> 
> The above statement will correctly return true.
> 
> Compared to the below statement which returns false.
> 
> 	return f1 > f2;
> 
> We test seqno wraps in Xe by setting our initial seqno to -127, again if
> you send this patch to our CI any test which sends more than 127 job on
> queue will likely fail.

Yeah, exactly that's why this flag is needed for quite a lot of things.

Question is what is missing in the documentation to make that clear?

Regards,
Christian.

> 
> Matt
> 
>>
>> Because the only thing the flag still does is do this lower_32 check in
>> fence_is_later.
>>
>> P.
>>
>>>
>>> As I mentioned, all Xe-supported platforms could be updated since their
>>> rings support 64-bit store instructions. However, I suspect that very
>>> old i915 platforms don’t support such instructions in the ring. I agree
>>> this is a legacy issue, and we should probably use 64-bit sequence
>>> numbers in Xe. But again, platforms and drivers that are decades old
>>> might break as a result.
>>>
>>> Matt
>>>
>>> [1] https://elixir.bootlin.com/linux/v6.17.1/source/drivers/gpu/drm/xe/xe_hw_fence.c#L264
>>> [2] https://elixir.bootlin.com/linux/v6.17.1/source/drivers/gpu/drm/xe/xe_hw_fence_types.h#L51
>>>
>>>> P.
>>>> ---
>>>>  drivers/dma-buf/dma-fence.c |  3 +--
>>>>  include/linux/dma-fence.h   | 10 +---------
>>>>  2 files changed, 2 insertions(+), 11 deletions(-)
>>>>
>>>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>>>> index 3f78c56b58dc..24794c027813 100644
>>>> --- a/drivers/dma-buf/dma-fence.c
>>>> +++ b/drivers/dma-buf/dma-fence.c
>>>> @@ -1078,8 +1078,7 @@ void
>>>>  dma_fence_init64(struct dma_fence *fence, const struct dma_fence_ops *ops,
>>>>  		 spinlock_t *lock, u64 context, u64 seqno)
>>>>  {
>>>> -	__dma_fence_init(fence, ops, lock, context, seqno,
>>>> -			 BIT(DMA_FENCE_FLAG_SEQNO64_BIT));
>>>> +	__dma_fence_init(fence, ops, lock, context, seqno, 0);
>>>>  }
>>>>  EXPORT_SYMBOL(dma_fence_init64);
>>>>  
>>>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>>>> index 64639e104110..4eca2db28625 100644
>>>> --- a/include/linux/dma-fence.h
>>>> +++ b/include/linux/dma-fence.h
>>>> @@ -98,7 +98,6 @@ struct dma_fence {
>>>>  };
>>>>  
>>>>  enum dma_fence_flag_bits {
>>>> -	DMA_FENCE_FLAG_SEQNO64_BIT,
>>>>  	DMA_FENCE_FLAG_SIGNALED_BIT,
>>>>  	DMA_FENCE_FLAG_TIMESTAMP_BIT,
>>>>  	DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
>>>> @@ -470,14 +469,7 @@ dma_fence_is_signaled(struct dma_fence *fence)
>>>>   */
>>>>  static inline bool __dma_fence_is_later(struct dma_fence *fence, u64 f1, u64 f2)
>>>>  {
>>>> -	/* This is for backward compatibility with drivers which can only handle
>>>> -	 * 32bit sequence numbers. Use a 64bit compare when the driver says to
>>>> -	 * do so.
>>>> -	 */
>>>> -	if (test_bit(DMA_FENCE_FLAG_SEQNO64_BIT, &fence->flags))
>>>> -		return f1 > f2;
>>>> -
>>>> -	return (int)(lower_32_bits(f1) - lower_32_bits(f2)) > 0;
>>>> +	return f1 > f2;
>>>>  }
>>>>  
>>>>  /**
>>>> -- 
>>>> 2.49.0
>>>>
>>

