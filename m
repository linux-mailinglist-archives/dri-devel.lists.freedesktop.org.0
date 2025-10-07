Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 519D8BC1F50
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 17:40:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 702EE10E1BE;
	Tue,  7 Oct 2025 15:40:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wgZAg/8D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010045.outbound.protection.outlook.com [52.101.61.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E78110E1BE;
 Tue,  7 Oct 2025 15:40:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aJ8uw3LBb66vemdjOtfz2FwMufsJz978901Ku+cF6fIjyuf97Go2XVaZjHGa4R3znZp5KS6x5HuwWho6oQZrDmk2MgsdNxeabuU1GKJpIlm+Idhse3b+eS526Oud1nxHfyVtLCLqd+u3o1i17lpGlIeDgVDAR7snSlijfTuNOCvd+Jp7TVyuFKv3bdsavSd28/mq1gT1GjPzJPlB8o5xyZkWFD1rsB/SOYlZFAkVx3jHedVUIqHcPyx4a8Pxzp0s0gP2gb8XqL4eBgBTwlKdeH0Z8xE0DIcdLJMmxg3e2Rk8VgJ5zlz/6FMCdQNTtk2DHAdnx31wysdHr3FNqLC7Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aHA3cYXqvLF9W3k4WCU2lvyMQDM+nrVN3PcuEsEZBRk=;
 b=cDuDUSAlLMsWV/1TAR1Y7dNYKs2nkl9t9r72xFgEEZXvBwYmMl8zkxnl0vltsOcaTG2jtN5b9l2Cic/BjFAVXF15F8K/9NZHokLcD3YV8GT6lblQ7bQykJS0SOIDO32jumXMHpI6IfrO15Cn/Wa7xfiDYmHcf8y3lR4iZ5sNmpvhC7YKw4KH2vFfc6RF8PvL2/ugC2N2gx9IxbmNBqKtSp57DyUj//OKP01U9flcWSpiYUrqR8Ndod5GsME0oe+5vKPRLybABTVNOdORmB6eABnJB1CpMO5ZHFTrwTHjIsf7dZvuHVAZe/2z0G/8zYVjiJH9Rx0PNENR13trW9k2DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aHA3cYXqvLF9W3k4WCU2lvyMQDM+nrVN3PcuEsEZBRk=;
 b=wgZAg/8Dg0R8YWkP+YzVZZFjRWcuENgMMXyNNK/7Utce6C/ckeFbohL1gARr90aHbAyZgZzaHmKz3+VYGgYQog0W+XS5ypbddIFbvDUF+Mr2nCXM2WRpOWQrgaS/NJSESmQftKhm73l2clMf+XWK29o6m/LSSm0uQv+4rwfhWl0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB8296.namprd12.prod.outlook.com (2603:10b6:8:f7::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.20; Tue, 7 Oct 2025 15:40:32 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 15:40:31 +0000
Message-ID: <091ded65-cfac-4215-a6aa-a8d7c0fe05af@amd.com>
Date: Tue, 7 Oct 2025 17:40:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3] tests/syncobj_timeline: Exercise signaling of
 awaited points
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20251007152315.3403250-2-janusz.krzysztofik@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251007152315.3403250-2-janusz.krzysztofik@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0127.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB8296:EE_
X-MS-Office365-Filtering-Correlation-Id: 98d8103c-7b04-419b-87a2-08de05b7d90c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NVRuVVdCNkRYR2hhNkVmbnRjUXJLL3NERDNrQWRCNWFYWnRBVHNDUDF1MFdV?=
 =?utf-8?B?NGY3SUMyMzhvYko3Z1RrMXAyUjd2S0oraFp5T3VvcWkrdk1WNzFqQ2dXTTlD?=
 =?utf-8?B?WTNRUDYwamMxT2tWK1YrNCsrMkUrcnN4UDg3VzNKeGZkM1RidlhZM0ZMcWc0?=
 =?utf-8?B?bHFOMmtrTERNNWZ1SkoydTA2cVBvNnhIYVFPMlFwcVdlelZoUUpyUWFhTkFk?=
 =?utf-8?B?c2p0enRSaGVEUkVBQUNEK2xXejVWalRHQmlvcHg4eDl6NDZYaExkN2FrUSt4?=
 =?utf-8?B?OG80TGdKUHNFN2Fuck9NQ2RUaFQrWGxjeWxiZmNvc3M4U1J1SGFxRDQyTTlv?=
 =?utf-8?B?RlpzZzRMTzhySm52WDUrcTVFQkIzTElXU0puWjF1NjZ5Ull2TldtM21UZmRH?=
 =?utf-8?B?ZWFqUGt1NUlSZGxqR0laR3VHaFhiM281SndoUVByQXp4SzJZWnN0MnZmaG94?=
 =?utf-8?B?YnhBeDFNNzJhLzJoZjR3U1VLaUZtTm4yYXkwQWZrbUNOMStRSGl2b1dscWli?=
 =?utf-8?B?QlBmV2pQZmhvN3N5RE54Tlo0N05pdENLTmRKTE9oZStXRThpaTFhZFVVTld0?=
 =?utf-8?B?MkN0MDNWNURKUXpBbmlJeEN0eVNVaVQ2MzJicS9MWTBBdjA4MElYbGozWHNi?=
 =?utf-8?B?SmN5TWhRcWlBczdVaGcwTnV3ckZvNkVYdVRDSndPUXpXVTFaT3l1V1VzTjJN?=
 =?utf-8?B?THliOXJ4OHUxYVNKRDd0eXgzRGZJaW9zY1ZGSXNTdC9MSGxjLzJFRVdKb001?=
 =?utf-8?B?TnRlZ2dqRkhDMGh5bVg1cTVuOUZSU2RwVUFvRHowc09HY2ZseFhVa20wNnBN?=
 =?utf-8?B?SFhTZlF2eCsyTThwVlU1b21aemZjc05sR1Q4RUVJZFFScGpYZS9EVDJhSExM?=
 =?utf-8?B?eUZzanRlZG5DVGNJWk4vQWlNcG1oK3pEWHczRFBaU1JQdUFMRUZYVGJoVkJa?=
 =?utf-8?B?Yk1FTTdCVFRhYVNSRjFFcWlmOVNOU3Z1VjNBbEN4ZTM4L3VacWZsYzFHd05K?=
 =?utf-8?B?TzlRUzU0Q2J2MjkwOEJRQXcvalVhbkQ1REtxRWQ3NnBRSHRCcDJ2eWdoL09E?=
 =?utf-8?B?dG5jdWo2eHdSQStTdEM4QnFmV1Q1TVVyQWVOZW44RlBrV2VqYmxSK3doSkd2?=
 =?utf-8?B?NUlVeEh3TlYxNlZuSnB3WFI2NUZmdVdXcUNFeG5yQmp4Z01BZ0habUNKaDdZ?=
 =?utf-8?B?bHJpaW9EUGkxNThJSTJTTHJucWpDVWE1VXpLcGVudmJZTkxQZFlTWWM2cldn?=
 =?utf-8?B?dXJaRFNPRkM1L1VSZEVlRS9yR3NmQnlaRFBnS0FaL21ycmMwYlBzcW1rbHFr?=
 =?utf-8?B?K0NjcUdRbXlFQjFsOEZvWTVIY0tWR1JSMENKdGhzZTlsMXg4ancrVEF6bmZv?=
 =?utf-8?B?elEvbzR6alorUTE3SUh5WkpMNElKTERuUnV5blYwdEE5TWNjODNHbTZtYmpr?=
 =?utf-8?B?dmJxOFdFQ3BON1ZBZm9uKzBSWE8zR0E5aXVRUElNRkdiM214VnZhczBOcEVU?=
 =?utf-8?B?bm1FenJRSUI0V21RdjdLZTAxS3RHM2Q3MmdjdmxpZmptVVNOWGVYckIxOWE4?=
 =?utf-8?B?OXB4T1pSNm5wK3hVUHgxVW1tNlA2ai9MTVQvVHFDVFg2ZXNucExBWnYrNEtR?=
 =?utf-8?B?MjkzRGwrR2FiSS83QTArTlZUTjBRQmFTaVRiYlNkY3haOXdyRkx1ZVNid2gx?=
 =?utf-8?B?QXl0ZkVCZHFndi91ZWR1bkFBRldacDdGdVBLYXNUM01vYllkSGJGcVkzcFZn?=
 =?utf-8?B?dldIc2xibWQ3VndTMXlEVW1TN0k4NDd2ZFBsZTBpVGlSQ0hzQ1hOa1RZcDVK?=
 =?utf-8?B?L2szeTg5NFN4SjAyWnZkTmFjMVY3SXJ0TzlRMS9Fc2w0KzlHSHVnRDRsSk9t?=
 =?utf-8?B?dzhZRW1jQ1o1SmxzMWt4VUdxUEJQanZONTZtK2ZrOFYwa0I0WmpLT21qcEJs?=
 =?utf-8?B?eWlNZk1mY0V2TkpEWWRoNERMTTMxenZaRVl4Mm9hRG9aUkRvbXhnaHRYQTJr?=
 =?utf-8?B?S0RPUVIreFNRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dllnc082d1VpS2pZbVRsbEtqdS9JUkpOd0pDK0taZzBNTThCbzF2dmZyYnFJ?=
 =?utf-8?B?endJcStNTFNjMU5TQnVmaFl2R0JTZXp1RElNMlMybTVFbjhHVFVQcVVQSG1S?=
 =?utf-8?B?dWFRa3dKZlA3a2RMMm56Z2NZQnJMVmJkbG9HWHJvaXhRL09yMmZaVUtvV0RQ?=
 =?utf-8?B?MlNoSlBGR1drd0NwR3B6RGVMY3VnUWs1ZnRaWFMyS3c5OWtMOTZVSmwwcWpJ?=
 =?utf-8?B?MmEwRTkrV21NcUNpbGJCdVY1WG4vaW56bmJ4WVFPbzJma0c1V21OVk8vZzI3?=
 =?utf-8?B?TytVdThMTVBSM2FzREh5UHk0MWRwa3pxc3E2OVhEUG83d0ZqamUveUozMWRl?=
 =?utf-8?B?U1hxckxsUmZCZGdUZmRkT1lrbUlwcldoeXBpenUwejhqdXIvOXArdjNDR3NY?=
 =?utf-8?B?ZytWTnd0MlNnVnFTRVN3Q2tETytubUExOFlobTRjbDhoS2RQVlBaQlBpQ3VB?=
 =?utf-8?B?NWg4KzNtd3pCNFZTem1rWkpwL2grZ3NMcitRcmg1RnFPbFE1OGE0WlRPQmR0?=
 =?utf-8?B?VTVTMk9Zb244a3k0TFpGRG5zRHZhWElCaENRTGQ3cmJTN3hpbXhHMTZGV0lD?=
 =?utf-8?B?NVBjcUdXRFFBck9MYkd2dGNlQW1kak82SjV0UE9vSTJnem5GVzJ6cWVERnZa?=
 =?utf-8?B?clU2MEtNcFgyYUh0NjVpd043QUE5WXRDR2NieGg3d0FXUzl4b1I1ZTEvdit0?=
 =?utf-8?B?MmRnQkluT3pUWnBTVFluVXVHSWYzckRoQklsYWlqNENxL0pRREtTK3QvMmJY?=
 =?utf-8?B?b2lOWXVodzVkdnVxS2tialJUNHFhOFFJaGhpbUI5SzF6R2VpOW5OMWp0ZmEv?=
 =?utf-8?B?d3J6aWNyME04d0JpNFdGaGZFRldLM0o2eTZJd2JGaS8zcWFKNDlnY3N4RmFP?=
 =?utf-8?B?RDlobUdBcXF6SHIzTW0wK3hmdEgwbmpyUWpJMjl6Qk9EVnVQQkpsSEk3cE4x?=
 =?utf-8?B?ZWR4QTdTakY1dE82cDc3a0V0NlRvaW9YTVZRbnFnZEVRSzlGZ1krNkFrVm8x?=
 =?utf-8?B?d29XNTBTd3RROThsdzd1WWFBL0YvUXcyclhkMUllcUo4WlI3ZGptanBqUTI2?=
 =?utf-8?B?Snc1aGhyUFZPZkhFdGIyc1FobmJtWXdGeDYxOWdvRDBQdUY0ZUNhUFdSeGRE?=
 =?utf-8?B?T3VSdHVrdTVSOHFXNzJ3cDU4cnNQaDZzWmtVYjNMeGowb25EdFV5L1NwcVdy?=
 =?utf-8?B?dUUvM2VpRFl1c0tnemp1VXJFa2ordkhuVzFiVDhHMWdVTThINEVhWEhPcyth?=
 =?utf-8?B?NU5QSHd4enk4YTJpbVBrd2JmeHBTQW1vZm84Q0ZwbENUUVhlOXFqTHBhdTVX?=
 =?utf-8?B?VkZWRlRacDNxeERSYWRkLzRZNURPazZKSFNxVlNGckd3YVZkN2lKSFQrSWdR?=
 =?utf-8?B?Vmh6ZUltTWR2c0hZeDgyNC9IRmNSTWRpYWZOb3luSUt3VVVTNzYwVzZWM0J1?=
 =?utf-8?B?cTJoSTFoYXUySVF1QWw3eDJCTnprdHlxSFNSb09ybTY2VC8zYitOSmJzVzVp?=
 =?utf-8?B?VWpLazBOeGtDREUvVTNMK2JKbjU3N1g2TUt6U0tnOGg3Mjc5R2E4YVRrN1pZ?=
 =?utf-8?B?NGFRdndiMDVCSEJkR3V3TTlhSno1VEZtRDhDNTNHcXNKclg2N04rbCtJL012?=
 =?utf-8?B?U2crN3Z4aGtlZ2JJVlJOY1c3TFAyVWk4cHlpODJYZHIvbnNEMG1GckQwQ3Vi?=
 =?utf-8?B?RkRBelhnWTU5QnM2Q29lUEwvcTFpYmQ4cVdSazd5L0gxNVg0Z1ZUOTdnZkQ0?=
 =?utf-8?B?MkpKL29aMDlXSW5UemNwd25tYlhTUlJlNVZoUVZnSGdsR3RrSDFERS84VUQ3?=
 =?utf-8?B?YitkY1dzU2tsMkdxbnJWcm1uem8rT3dXY3p0UjRVejA4QlVPczhqLzk2NEhK?=
 =?utf-8?B?TmorQzRCdlNiVEN1YWh5RUx0T0FSRlVkeXEwL1ZLQXlEdXB5M3BCMDc2UFh5?=
 =?utf-8?B?OXpHTXlwOUxEWWtWNkllTEV3bml6OHhWdjZGZi81YVNiZEFBbVdUb28rZWFL?=
 =?utf-8?B?TmZ3WVB0K1YzTm80UGw1SDd1M2lpT1ZpOWkzbFRLcTJKaFdUMzhVMFV6Nkxz?=
 =?utf-8?B?R3ZZeDJ6bHpUU1hYK1FNaXlNY3ZwakwzZFJqMnQ1YUQ0K0trbDFhLzIzc2lH?=
 =?utf-8?Q?vpQzExA+slh2G1oZ0jSfhgkDX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98d8103c-7b04-419b-87a2-08de05b7d90c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 15:40:31.3550 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sKFJrTz/lTCws8L8J9BE419AF6rxVPrPx7+Xec09Mgtf6BlLqC/ffP/3WVou4hK3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8296
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

On 07.10.25 17:14, Janusz Krzysztofik wrote:
> CI reports kernel soft lockups when running a wait_backward test case of
> igt@dmabuf@all-tests@dma_fence_chain selftest on less powerful machines.
> A kernel fix has been developed that has proven to resolve the issue, but
> it hasn't been accepted upstream, with a recommendation for dropping that
> test case as a "nonsense"[1].
> 
> Before we decide to take that path, try to implement the problematic test
> case in user space as an IGT subtest.  Since no kernel uAPIs have been
> found that allow strict reimplementation of exact algorithm of the
> problematic test case, where every link of a dma-fence chain is signaled
> one by one from a loop running in kernel space, provide two approximate
> variants, one that signals each fence with an individual system call, and
> one that depends on vgem fences being signaled automatically on their
> consecutive expiry under presumably the same schedule as they were
> created.

VGEM is not much better than sw_sync. You would need to reproduce the issue an real HW to actually have some issue here.

Signaling fences in reverse is just a completely unrealistic use case.

Regards,
Christian.

> 
> For more comprehensive testing, also implement the _forward and _random
> scenarios from the original selftest, as well as simplified variants that
> don't enable signaling on each link of the dma-fence chain.
> 
> v3: Skip if CPU is not powerful enough for setting up all timeline points
>     before vgem fences start to expire,
>   - also skip if CPU is not powerful enough to signal all vgem fences
>     before they start to expire automatically when signaling manually,
>   - fail autoexpire variants if vgem fences don't start to expire in 10s,
>   - wait virtually infinitely for last timeline point being signaled, let
>     igt_runner unlikely kill the test and report timeout if per test
>     timeout expires first.
> v2: Fix incorrectly calculated backward ordering of syncobj points,
>   - replace problematic sw_sync timeline points with vgem object fences,
>   - drop wait-all subtest variants, those add no value over enable-all,
>   - to simplify the code, enable signaling of each point, if requested,
>     right after it is added to the syncobj timeline.
> 
> [1] https://lore.kernel.org/dri-devel/20250814094824.217142-6-janusz.krzysztofik@linux.intel.com/
> 
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> ---
>  tests/syncobj_timeline.c | 287 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 287 insertions(+)
> 
> diff --git a/tests/syncobj_timeline.c b/tests/syncobj_timeline.c
> index a77896ec1d..7c17c2eacd 100644
> --- a/tests/syncobj_timeline.c
> +++ b/tests/syncobj_timeline.c
> @@ -27,9 +27,14 @@
>  #include <unistd.h>
>  #include <time.h>
>  #include <sys/ioctl.h>
> +#include <sys/param.h>
>  #include <pthread.h>
>  #include <signal.h>
> +
> +#include "dmabuf_sync_file.h"
>  #include "drm.h"
> +#include "igt_vgem.h"
> +
>  /**
>   * TEST: syncobj timeline
>   * Description: Tests for the drm timeline sync object API
> @@ -427,6 +432,42 @@
>   *
>   * SUBTEST: wait-zero-handles
>   * Description: Verifies that waiting on an empty list of syncobj handles is accepted
> + *
> + * SUBTEST: stress-wait-last-signal-forward
> + * Description: Signals each fence of a large timeline while another thread is waiting on that timeline
> + *
> + * SUBTEST: stress-wait-last-signal-backward
> + * Description: Signals each fence of a large timeline in reverse order while another thread is waiting on that timeline
> + *
> + * SUBTEST: stress-wait-last-signal-random
> + * Description: Signals each fence of a large timeline in random order while another thread is waiting on that timeline
> + *
> + * SUBTEST: stress-wait-last-signal-all-forward
> + * Description: Signals all fences of a large timeline while another thread is waiting on that timeline
> + *
> + * SUBTEST: stress-wait-last-signal-all-backward
> + * Description: Signals all fences of a large reverse ordered timeline while another thread is waiting on that timeline
> + *
> + * SUBTEST: stress-wait-last-signal-all-random
> + * Description: Signals all fences of a large randomly ordered timeline while another thread is waiting on that timeline
> + *
> + * SUBTEST: stress-enable-all-signal-forward
> + * Description: Signals each fence of a large timeline with signaling enabled on each point while another thread is waiting on that timeline
> + *
> + * SUBTEST: stress-enable-all-signal-backward
> + * Description: Signals each fence of a large timeline in reversed order with signaling enabled on each point while another thread is waiting on that timeline
> + *
> + * SUBTEST: stress-enable-all-signal-random
> + * Description: Signals each fence of a large timeline in random order with signaling enabled on each point while another thread is waiting on that timeline
> + *
> + * SUBTEST: stress-enable-all-signal-all-forward
> + * Description: Signals all fences of a large timeline with signaling enabled on each point while another thread is waiting on that timeline
> + *
> + * SUBTEST: stress-enable-all-signal-all-backward
> + * Description: Signals all fences of a large reversed ordered timeline with signaling enabled on each point while another thread is waiting on that timeline
> + *
> + * SUBTEST: stress-enable-all-signal-all-random
> + * Description: Signals all fences of a large randomly ordered timeline with signaling enabled on each point while another thread is waiting on that timeline
>   */
>  
>  IGT_TEST_DESCRIPTION("Tests for the drm timeline sync object API");
> @@ -1675,6 +1716,236 @@ test_32bits_limit(int fd)
>  	close(timeline);
>  }
>  
> +#define STRESS_FLAGS_ENABLE_ALL		(0x1 << 0)
> +#define STRESS_FLAGS_SIGNAL_ALL		(STRESS_FLAGS_ENABLE_ALL << 1)
> +#define STRESS_FLAGS_SIGNAL_BACKWARD	(STRESS_FLAGS_SIGNAL_ALL << 1)
> +#define STRESS_FLAGS_SIGNAL_RANDOM	(STRESS_FLAGS_SIGNAL_BACKWARD << 1)
> +
> +const char *stress_descriptions[] = {
> +	/* stress-wait-last-signal-forward */
> +	[0] =
> +		"Signals each fence of a large timeline while another thread is waiting on that timeline",
> +	/* stress-wait-last-signal-backward */
> +	[STRESS_FLAGS_SIGNAL_BACKWARD] =
> +		"Signals each fence of a large timeline in reverse order while another thread is waiting on that timeline",
> +	/* stress-wait-last-signal-random */
> +	[STRESS_FLAGS_SIGNAL_RANDOM] =
> +		"Signals each fence of a large timeline in random order while another thread is waiting on that timeline",
> +	/* stress-wait-last-signal-all-forward */
> +	[STRESS_FLAGS_SIGNAL_ALL] =
> +		"Signals all fences of a large timeline while another thread is waiting on that timeline",
> +	/* stress-wait-last-signal-all-backward */
> +	[STRESS_FLAGS_SIGNAL_ALL | STRESS_FLAGS_SIGNAL_BACKWARD] =
> +		"Signals all fences of a large reverse ordered timeline while another thread is waiting on that timeline",
> +	/* stress-wait-last-signal-all-random */
> +	[STRESS_FLAGS_SIGNAL_ALL | STRESS_FLAGS_SIGNAL_RANDOM] =
> +		"Signals all fences of a large randomly ordered timeline while another thread is waiting on that timeline",
> +	/* stress-enable-all-signal-forward */
> +	[STRESS_FLAGS_ENABLE_ALL] =
> +		"Signals each fence of a large timeline with signaling enabled on each point while another thread is waiting on that timeline",
> +	/* stress-enable-all-signal-backward */
> +	[STRESS_FLAGS_ENABLE_ALL | STRESS_FLAGS_SIGNAL_BACKWARD] =
> +		"Signals each fence of a large timeline in reversed order with signaling enabled on each point while another thread is waiting on that timeline",
> +	/* stress-enable-all-signal-random */
> +	[STRESS_FLAGS_ENABLE_ALL | STRESS_FLAGS_SIGNAL_RANDOM] =
> +		"Signals each fence of a large timeline in random order with signaling enabled on each point while another thread is waiting on that timeline",
> +	/* stress-enable-all-signal-all-forward */
> +	[STRESS_FLAGS_ENABLE_ALL | STRESS_FLAGS_SIGNAL_ALL] =
> +		"Signals all fences of a large timeline with signaling enabled on each point while another thread is waiting on that timeline",
> +	/* stress-enable-all-signal-all-backward */
> +	[STRESS_FLAGS_ENABLE_ALL | STRESS_FLAGS_SIGNAL_ALL | STRESS_FLAGS_SIGNAL_BACKWARD] =
> +		"Signals all fences of a large reversed ordered timeline with signaling enabled on each point while another thread is waiting on that timeline",
> +	/* stress-enable-all-signal-all-random */
> +	[STRESS_FLAGS_ENABLE_ALL | STRESS_FLAGS_SIGNAL_ALL | STRESS_FLAGS_SIGNAL_RANDOM] =
> +		"Signals all fences of a large randomly ordered timeline with signaling enabled on each point while another thread is waiting on that timeline",
> +};
> +
> +#define TL_LENGTH 4096
> +
> +struct stress_timeline {
> +	int fd;
> +	int vgem;
> +	int dmabuf;
> +	int sync_file;
> +	uint32_t syncobj;
> +	uint32_t tmp_syncobj;
> +	struct vgem_bo *vgem_bos;
> +	uint32_t *vgem_fences;
> +	uint64_t *order;
> +	uint64_t length;
> +	unsigned int flags;
> +};
> +
> +static void stress_init(int fd, struct stress_timeline **timeline, unsigned int flags)
> +{
> +	struct stress_timeline *tl;
> +	int i, err = -ETIME;
> +	uint64_t point;
> +
> +	tl = calloc(TL_LENGTH, sizeof(*tl));
> +	igt_assert(tl);
> +	*timeline = tl;
> +
> +	tl->fd = fd;
> +	tl->length = TL_LENGTH;
> +	tl->flags = flags;
> +	tl->dmabuf = -1;
> +	tl->sync_file = -1;
> +
> +	tl->vgem = drm_open_driver(DRIVER_VGEM);
> +	tl->syncobj = syncobj_create(fd, 0);
> +
> +	tl->vgem_bos = calloc(tl->length, sizeof(*tl->vgem_bos));
> +	igt_assert(tl->vgem_bos);
> +	for (i = 0; i < tl->length; i++) {
> +		tl->vgem_bos[i].width = 1;
> +		tl->vgem_bos[i].height = 1;
> +		tl->vgem_bos[i].bpp = 4;
> +	}
> +
> +	tl->vgem_fences = calloc(tl->length, sizeof(*tl->vgem_fences));
> +	igt_assert(tl->vgem_fences);
> +
> +	tl->order = calloc(tl->length, sizeof(*tl->order));
> +	igt_assert(tl->order);
> +	for (i = 0; i < tl->length; i++)
> +		tl->order[i] = flags & STRESS_FLAGS_SIGNAL_BACKWARD ? tl->length - 1 - i : i;
> +	if (flags & STRESS_FLAGS_SIGNAL_RANDOM)
> +		igt_permute_array(tl->order, tl->length, igt_exchange_int64);
> +
> +	for (i = 0; i < tl->length; i++) {
> +		vgem_create(tl->vgem, &tl->vgem_bos[i]);
> +		tl->vgem_fences[i] = vgem_fence_attach(tl->vgem, &tl->vgem_bos[i], 0);
> +	}
> +
> +	for (point = 1; point <= tl->length; point++) {
> +		bool busy;
> +
> +		i = tl->order[point - 1];
> +		tl->dmabuf = prime_handle_to_fd(tl->vgem, tl->vgem_bos[i].handle);
> +		igt_assert_fd(tl->dmabuf);
> +
> +		tl->sync_file = dmabuf_export_sync_file(tl->dmabuf, DMA_BUF_SYNC_RW);
> +		igt_assert_fd(tl->sync_file);
> +		close(tl->dmabuf);
> +		tl->dmabuf = -1;
> +
> +		busy = sync_file_busy(tl->sync_file);
> +		if (busy) {
> +			tl->tmp_syncobj = syncobj_create(fd, 0);
> +			syncobj_import_sync_file(fd, tl->tmp_syncobj, tl->sync_file);
> +		}
> +		close(tl->sync_file);
> +		tl->sync_file = -1;
> +		if (igt_debug_on(!busy)) {
> +			err = 0;
> +			break;
> +		}
> +
> +		syncobj_binary_to_timeline(fd, tl->syncobj, point, tl->tmp_syncobj);
> +		syncobj_destroy(fd, tl->tmp_syncobj);
> +		tl->tmp_syncobj = 0;
> +
> +		if (flags & STRESS_FLAGS_ENABLE_ALL) {
> +			err = syncobj_timeline_wait_err(tl->fd, &tl->syncobj, &point,
> +							1, 0, 0);
> +			if (igt_debug_on(err != -ETIME))
> +				break;
> +		}
> +	}
> +
> +	igt_require_f(err == -ETIME,
> +		      "CPU power sufficient for setting up still %ld timeline points before vgem fences start to expire\n",
> +		      tl->length - point + 1);
> +}
> +
> +static void test_stress_enable_wait_signal(int fd, struct stress_timeline **timeline,
> +					   unsigned int flags)
> +{
> +	struct stress_timeline *tl;
> +	int64_t dt;
> +
> +	stress_init(fd, timeline, flags);
> +	tl = *timeline;
> +
> +	if (flags & STRESS_FLAGS_SIGNAL_ALL) {
> +		/* store current time in case vgem fences already started to expire */
> +		dt = -gettime_ns();
> +
> +		/* wait for expiry of the first vgem fence */
> +		tl->dmabuf = prime_handle_to_fd(tl->vgem, tl->vgem_bos[0].handle);
> +		igt_assert_fd(tl->dmabuf);
> +
> +		tl->sync_file = dmabuf_export_sync_file(tl->dmabuf, DMA_BUF_SYNC_RW);
> +		igt_assert_fd(tl->sync_file);
> +
> +		igt_set_timeout(11, "vgem fence should expire automatically in 10 seconds but it hasn't");
> +		while (sync_file_busy(tl->sync_file))
> +			dt = -gettime_ns();
> +		igt_reset_timeout();
> +	} else {
> +		int i;
> +
> +		dt = -gettime_ns();
> +		for (i = 0; i < tl->length; i++) {
> +			igt_require_f(!__vgem_fence_signal(tl->vgem, tl->vgem_fences[i]),
> +				      "CPU power sufficient for manually signaling still %ld vgem fences before they start to expire automatically\n",
> +				      tl->length - i);
> +		}
> +	}
> +	/* wait for the last point of the timeline being signaled */
> +	igt_assert_eq(syncobj_timeline_wait_err(tl->fd, &tl->syncobj, &tl->length, 1,
> +						MAX(600 * NSECS_PER_SEC - dt, gettime_ns()), 0), 0);
> +	dt += gettime_ns();
> +
> +	igt_info("%s: %ld signals in %ld ns\n", __func__, tl->length, dt);
> +}
> +
> +static void stress_cleanup(struct stress_timeline *timeline)
> +{
> +	int i;
> +
> +	if (!timeline)
> +		return;
> +
> +	if (timeline->order)
> +		free(timeline->order);
> +
> +	if (timeline->sync_file >= 0)
> +		igt_warn_on(close(timeline->sync_file));
> +
> +	if (timeline->dmabuf >= 0)
> +		igt_warn_on(close(timeline->dmabuf));
> +
> +	if (timeline->vgem_fences) {
> +		for (i = 0; i < timeline->length; i++)
> +			if (timeline->vgem_fences[i])
> +				igt_ignore_warn(__vgem_fence_signal(timeline->vgem,
> +								    timeline->vgem_fences[i]));
> +
> +		free(timeline->vgem_fences);
> +	}
> +
> +	if (timeline->vgem_bos) {
> +		for (i = 0; i < timeline->length; i++)
> +			if (timeline->vgem_bos[i].handle)
> +				gem_close(timeline->vgem, timeline->vgem_bos[i].handle);
> +
> +		free(timeline->vgem_bos);
> +	}
> +
> +	if (timeline->vgem >= 0)
> +		igt_warn_on(close(timeline->vgem));
> +
> +	if (timeline->tmp_syncobj)
> +		syncobj_destroy(timeline->fd, timeline->tmp_syncobj);
> +
> +	if (timeline->syncobj)
> +		syncobj_destroy(timeline->fd, timeline->syncobj);
> +
> +	free(timeline);
> +}
> +
>  static bool
>  has_syncobj_timeline_wait(int fd)
>  {
> @@ -1934,6 +2205,22 @@ igt_main
>  	igt_subtest("32bits-limit")
>  		test_32bits_limit(fd);
>  
> +	for (unsigned int flags = 0;
> +	     flags < (STRESS_FLAGS_SIGNAL_BACKWARD | STRESS_FLAGS_SIGNAL_RANDOM); flags++) {
> +		struct stress_timeline *timeline = NULL;
> +
> +		igt_describe(stress_descriptions[flags]);
> +		igt_subtest_f("stress-%s-signal%s-%s",
> +			      (flags & STRESS_FLAGS_ENABLE_ALL) ? "enable-all" : "wait-last",
> +			      (flags & STRESS_FLAGS_SIGNAL_ALL) ? "-all" : "",
> +			      (flags & STRESS_FLAGS_SIGNAL_RANDOM) ? "random" :
> +			      (flags & STRESS_FLAGS_SIGNAL_BACKWARD) ? "backward" : "forward")
> +			test_stress_enable_wait_signal(fd, &timeline, flags);
> +
> +		igt_fixture
> +			stress_cleanup(READ_ONCE(timeline));
> +	}
> +
>  	igt_fixture {
>  		drm_close_driver(fd);
>  	}

