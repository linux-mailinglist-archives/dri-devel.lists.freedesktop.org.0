Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D85FA0765E
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 14:00:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 769DA10E36C;
	Thu,  9 Jan 2025 12:59:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gMoSmCf0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2046.outbound.protection.outlook.com [40.107.102.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD47410E36C
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 12:59:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lzfp5lDuWEeA6U3hJTXcZKtlVpGfVV279K+TJ6IB5VQ1w9PlitEXCPHiCqnvAk819C37j8+r/u6Um2/KPlwtMfsqvPk1EOLEYZk3vESJK57JNXiYZ52pOq66pniYGyrlINCr5z4QuQi4gWQY5dy+tTXHUuUnTRAHwr6BO2RDX0pzuCB+b7WljOO6UqHy4RkdVXMBbpHlov250xCalL0aDhYk2fIaB35kBD/b1b43AxSSDv9MhvKuGLydy7jZgloSeRNRLxcSEDqgFiACpFHjUwCoIYunfqy6qcf6Awrwsj46f40YMDLa9GObqTtM+r7wI2jb/kpaphx8LfbYGXsBPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xNJcbXdEhfUhKUqdL0kkwahhnkK9RNEsB4q44fL7b5I=;
 b=TCNxblrgnOgK3ji7Vy5UHWL2k5o/BQqx0fjprmZ9ufIvfpjZeGLRFt23HT/LlpTG/bdyoPsIj0mQwsZATe1joALcbKuTY0x4FsepojyaJCKeHd3WBDnRJ6zJP3lqrg4Msiw/34uWM8nggzOV33cCE+vRdxeWrP0nagKpZ4HE8dle/WL1KrUXi+BN2PQs45q5iaG5hrE2nDd2MMHBcE8dZPih7iRp4d47NydtxI2LforE+S5/fgBMTHEZD/pUsCFX2qq8UgWKZGwknOQWxu1i9AKao+Xp3S8/EpPrIKIs3Hg0vxl9aKaHmSnHdcg/Ky45+BgZIHicEtgGEOrFYaP+8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xNJcbXdEhfUhKUqdL0kkwahhnkK9RNEsB4q44fL7b5I=;
 b=gMoSmCf0gnmkv9+yad5Qed7KLxkEyzYhEs+Dt/B6sTdVaFWBtjKgFmp3cBlFyupQVVKQCOjwmxa6WcWaXjKT5Wi9d6egrVIdDVzIGxaLcnU5quNt/uOLDu4wEVS+c3/FygRGI57x2gaVj2GXHPmZqL4ZXHxt/aaguD/KTpvdFEM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB9122.namprd12.prod.outlook.com (2603:10b6:610:196::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Thu, 9 Jan
 2025 12:59:39 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8335.010; Thu, 9 Jan 2025
 12:59:39 +0000
Message-ID: <e2dea565-96a0-4d83-81db-0d38ba180292@amd.com>
Date: Thu, 9 Jan 2025 13:59:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 10/18] drm/sched: Implement RR via FIFO
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
References: <20250108183528.41007-1-tvrtko.ursulin@igalia.com>
 <20250108183528.41007-11-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250108183528.41007-11-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0097.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB9122:EE_
X-MS-Office365-Filtering-Correlation-Id: e715d61d-0a0d-4628-2476-08dd30ad7a50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K2xuV091MjNjUWdvODVaMjJMa3luV3VCTjI4M0dDQmYxYnV0VlhYZktQYjNT?=
 =?utf-8?B?TDRXamtINTZZQXpBSktwRFo2QUxpNTBWQ3JVYm03RmJRS0JCdG9hbTNkR3gv?=
 =?utf-8?B?blk2SGk5aTV2Q3RmdWJLcEl4YStFNFl2M0dxL0EydUFOcGUxMmNneTN4OXE0?=
 =?utf-8?B?cjhVM1VLK2NWWmppWlJrcjNCd2pLajRWaWI1SmxZTE1Qa0lMc2g3YXE4YjJr?=
 =?utf-8?B?eGNyK2VvQVdha3NhWnpjWUpvcTRTRjlaNVhJTXZNUWZFWnh4bVdJV0VsQm1X?=
 =?utf-8?B?dDFJK0N5bzBmMTlDWXVKZFY4UTJLRk1PTmpWdWhKMVdUbU1uVnhRQkEwVU9V?=
 =?utf-8?B?RkZlZXFaS0svSUdRWUlncDI0b0Zha2NLK1NweStTMlJvZHNpUHMzd1lWOG4x?=
 =?utf-8?B?b3dBczJ3dk5tVlhWM0haOG96dHhwZkZUNnBJdFc2YVFaK1grRk9VaDBwcHFN?=
 =?utf-8?B?ai9WWlpJMlBGc2hHZW5HYitiL3JiUnFhTkRpdUx4R0pwYzcrU1Fsa3JpUExx?=
 =?utf-8?B?OGo3K2NEWVoweTFUT2JuMUMyMTY0VFlmUldmRkN2ZzM0VXNtZ1IrbjJ1bE14?=
 =?utf-8?B?VDdETGJqZnVVcWhVamtYdzhvM3pZWms5NUFBeWZvQ0oyMG9JZEcxSW9pekxI?=
 =?utf-8?B?UkFpRmxoYXEzTWJ6QUtKTWZLSlRMTjdTbm9VeWdKRHlTVDlaVnNSYXl0QzAr?=
 =?utf-8?B?bDBpbDBVa0lmVDFQbUZwNUgrYlRoWnA0VkljRkhRTUk0MklFUHo0b2RGREFN?=
 =?utf-8?B?T2YrTFRtTHF0WDJEN0F1YTFUdXZNMjhDSFlxN2l0SHFVcTdaTS9rRjhWNkta?=
 =?utf-8?B?bGtiMm83K0taQkgzN2dtelIwRXN5VTcwWWIyNi80UUx5ZklYUjZVV1NBMzV1?=
 =?utf-8?B?YnNiaERPcnB4L1J0SHJqQ3hXZFBBakxJV0g2Z1Q2MTRrOTZCMlN6MDBUZlB2?=
 =?utf-8?B?STZwa3NTN2NwUitUYWFWcmNSWjRzWWRFaDlpNE1qdXRURWwvOFpQTVJXNDlQ?=
 =?utf-8?B?ZnRCbEFNSEZvTnV0NVI1L3pjV0ZQUWZXT2JpNFhpMldWZUd5NjVFY0FrRWJM?=
 =?utf-8?B?TDJJRVA1SXVBZm5vYkdUSVIzQnFmYTVzdzlTN3lwYVdINEJsUXJMTTE3cDdL?=
 =?utf-8?B?Qldza0JyR1VhZitkQW1ZMHlNeGRlZWFzN2pacnBrQlFPUVNWNU0zSjFqSEk1?=
 =?utf-8?B?RkRDSWs5N21LclNiRGxKNFR3RHJiSHU1S3Q5UXo2aHFzS1ZVYmFXZ1JoN09O?=
 =?utf-8?B?YUhUcVMraUF2clc0emNCMFArMTY2blprOUVjUmlpZFR5K3JBMXlVM2ZUcEFm?=
 =?utf-8?B?bTRnaWM2N0FjdnRvU0dIZkM2a1hLUEZEL1owbk1lMDhTRVhva3l4UU9VZkpk?=
 =?utf-8?B?T0drQXBpK1d0aittODV5cVVPZUdML0wvWUE0VTRlSVE3bzYyUTJrLzcyMnBP?=
 =?utf-8?B?Rk5Pc0h1bDdybTJTZkdFTmhRanpQQUQ0d1MxVkhnOC9yWUd0UTI5T0FzdjZo?=
 =?utf-8?B?UW9qTCtlQzFlQ29LMGFzNDhoL2pRRGFScTRYV3NvTFFCUmlDQWdzZVJHVExu?=
 =?utf-8?B?OXp6Ny9YMi9IejJodUtpRU9LQVBOa0ZRV01FM1JXck9yM0FjMFBwdk92Tm82?=
 =?utf-8?B?NS9jOWJJS0xRV09ZdkZYSUFmR2lQZVNRWTBGV09oMlRrZG1JbG50dmxOYlJD?=
 =?utf-8?B?d29aSXVBREREblIyS1hwTkFoZ01JQ0xnRVpoZFRPOWFkV1VsZ0xVWCtHWmdk?=
 =?utf-8?B?UUg4c2pPUmI4REZ6SkV0Szg3MmhKbFZWd0ZCS3UvZUVKNEpwUmRxWWhpWXlS?=
 =?utf-8?B?TEk4UGJPN2tDMnJodnVyMFJTWkFpRVhYRXVvQUZpZkdXaXp1MkNwVVNnYVJu?=
 =?utf-8?Q?a0pB+RX7YAEdA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUZudEt1TVREL3J2YkltS3NxM2NMS0RzMzIzYnFYYnZUSlI3RUp2ZEtseGFl?=
 =?utf-8?B?UEZ1VFFrMG9oS1F4TVF2emplam5WRkR6bE9yWklpVmM2eTFZUnRWSU51NFVJ?=
 =?utf-8?B?bVFGMUgwcDlJOG9HUTNPV2J3WjJiL2tzSVUvZldzbTlDZEdUa0c2b1hrcFNi?=
 =?utf-8?B?cGlNeWJZWXNwSU0wSUIxdUphR1ZWVkVnWlVUWm9MMmtkcUtDV0hkQjJEUWk5?=
 =?utf-8?B?bm9hYWcybkpwYTJ3VGRXZnZZZjd4Y2VxM040STdUQ1BQcTMrcytNOTZBc0d2?=
 =?utf-8?B?ckNsTVVHS25yQ2NQWG44TVZLQzlETnVsbHRVQ1BONjFydTBBN1NEL1lEOW9h?=
 =?utf-8?B?VjZtZ0RhSkJBbHFQQmQwMk5tdmRYR2srSHYzSVdsS0xndmoxVjRCSU83NUZs?=
 =?utf-8?B?U2VLVFBqelVjbXBWREtwSGlrdGlpamkyc3RzNXhVb0c2YzVpSjZwSW5kSzdB?=
 =?utf-8?B?SE5PWmNlOC9FelFjaS84OU5EWmdFUlZ6bzNWY2kxbndoRnBjWmE2OWRGaWpI?=
 =?utf-8?B?all0SUN0bFhXdEFJSkRKL1pIUURUQmIrZ0cydFhyWk1ySVR0cFA2Z1U0VHpw?=
 =?utf-8?B?K0tHSVhGTmxFblpIZlEwWUNWQU95UVhKb1V1UTB4T2lEd3BEQ2pMTDJaSDky?=
 =?utf-8?B?T1ZLbWxUZmdRZ0N0dHA5RWNJclhTYWQrTGtxQ2xobmRRTDRBUXJubjBWNDRO?=
 =?utf-8?B?NS9mVkNsQnJCenVyMjJNaUs3cnhuQjRtVGVrc0MvanM0dFg4bklxZE5CeDR4?=
 =?utf-8?B?Q25DU3NuM1VOMkNxV1pPVHR1RFVFMXFXcXJwMTU4TngzMXFENVZTRW50QkhC?=
 =?utf-8?B?aXNTME5XbGtBME9FS29kL3E4bUZGNENuQnQ1M294eEVvcHIvN2ZqU1N4N0dh?=
 =?utf-8?B?Q1dad0dDSXlZN3M1YkRCT3laY0hqUkZUN2gySU8vVkQxTzFZWUN2KzB3eEhY?=
 =?utf-8?B?Q1JDYnhHZlZNNVV2RlA4NXZEQkxOSzZMcFVvTG1DK0xkTzZ1RUVaYXl5WFRu?=
 =?utf-8?B?Qi9rcXpiZHU2aUh3aXFvZmVGbnY5aDVTU3ozQ0ZpRnB4VlZzSHpiZEw1WC9y?=
 =?utf-8?B?d1gyOW9DNDh3VDVDcGwxZlh2MTVWdWphdmx0K3A5aFFlSkZxTmEweUc5dEZn?=
 =?utf-8?B?NmhwYXVJam4ramFnNitqVXgzU1pUSDNuWm1hOXhoN21JNVBtODMrUTJrbEJG?=
 =?utf-8?B?MVE0ZmQxMEZycG5McnRCYVhaV2QyM0wrSzhzZlFEeDBaTnhXSXBWUS9YVWlp?=
 =?utf-8?B?ZHZRTnlDU3crVzJPZDcvbGxVblJFQVVZN3k0Z1A0WkRmbXp1Q05hT0xGQUh1?=
 =?utf-8?B?T2ROYmc0dkEzOFRLNnJEMlB0dTJoRVhwRGQrV1NXMFpwR3ZOT01DdU03RGFl?=
 =?utf-8?B?Sm1LTkRVUXptUEQ2SVNTZlVzWGpmNHpWdTR0cFJuUnB0ZEtXSTkvM0lRZjBo?=
 =?utf-8?B?dm51MmZCQ04rYzQ2M0xFRTNjVFE1VXhjK05zS1hZeFFPSFkzU3VkTm5TRG0v?=
 =?utf-8?B?UTErQjV4QTl4Tyt4Vks1dHhDb0s4K1U1em1jQUk0WVlaRnVQWFQzeE53dmoy?=
 =?utf-8?B?aW9yc2FoLzUxQ25DcENtU3pPKzQrc3RZbXJTYmZIa3JIa2tuQU85RjJFWDF1?=
 =?utf-8?B?alh3UDI2TUdVR2J6am9kZ3MyWmdndUQ1cjZIQ2szSVZLbFlXY05EK2d1ZzBs?=
 =?utf-8?B?Rm1aQkIwUVpCQVpBTVpzUm94cFNEN1FYL1RXZzhDYzR3c01MbDFIZUIzRkpN?=
 =?utf-8?B?TlpBVnlXbmVGUmxmYU1FMmFBRkxwMTZSU0xCVGZ5VE1OL0IrTGE1TmZDQU15?=
 =?utf-8?B?ckRIa0pvam9uT05HSU4zNzJDdTZRT2RDR09BOTdSSitLVkpWVXV3RDN0OUNU?=
 =?utf-8?B?MjBPOWQzVHlDOEUrclh3alpPUHpnZXlSM2ZtUW8za0FlOHpWc2Z2bGtnV3pz?=
 =?utf-8?B?QlRoR0hqc2NJN3ByMnFTMi9tNUNRZk9yZ2U5LzJMODlwUkdlOEhQcVRXUGFQ?=
 =?utf-8?B?RU5NT2gwbU1HVG9sNG5vdzd0cGZINXJDT1NjUmxDUkFuWVlWNWhiK1h0TXJn?=
 =?utf-8?B?RE9pTlVNYUF5dzMvSUJLQTRScnRxMUQ1dVFJbW52eStwb0JPcGszOHFEMHRm?=
 =?utf-8?Q?qXbBTaB5eyj0CBJI3fCs7mnJZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e715d61d-0a0d-4628-2476-08dd30ad7a50
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 12:59:39.7114 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ed3MitoK+Zk6VDJJPDNiby7IGsmKbtddfbnmQo5bdNy7JKo4zD97ceOSjqrI7X5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9122
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

Am 08.01.25 um 19:35 schrieb Tvrtko Ursulin:
> Round-robin being the non-default policy and unclear how much it is used,
> we can notice that it can be implemented using the FIFO data structures if
> we only invent a fake submit timestamp which is monotonically increasing
> inside drm_sched_rq instances.
>
> So instead of remembering which was the last entity the scheduler worker
> picked, we can bump the picked one to the bottom of the tree, achieving
> the same round-robin behaviour.
>
> Advantage is that we can consolidate to a single code path and remove a
> bunch of code. Downside is round-robin mode now needs to lock on the job
> pop path but that should not be visible.

Oh that's a really nice one. One comment at the end of the patch.

>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <pstanner@redhat.com>
> ---
>   drivers/gpu/drm/scheduler/sched_entity.c | 50 ++++++++------
>   drivers/gpu/drm/scheduler/sched_main.c   | 84 ++----------------------
>   include/drm/gpu_scheduler.h              |  5 +-
>   3 files changed, 39 insertions(+), 100 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 8e910586979e..2b1bc4d00b57 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -473,9 +473,20 @@ drm_sched_job_dependency(struct drm_sched_job *job,
>   	return NULL;
>   }
>   
> +static ktime_t
> +drm_sched_rq_get_rr_deadline(struct drm_sched_rq *rq)
> +{
> +	lockdep_assert_held(&rq->lock);
> +
> +	rq->rr_deadline = ktime_add_ns(rq->rr_deadline, 1);
> +
> +	return rq->rr_deadline;
> +}
> +
>   struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>   {
> -	struct drm_sched_job *sched_job;
> +	struct drm_sched_job *sched_job, *next_job;
> +	struct drm_sched_rq *rq;
>   
>   	sched_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
>   	if (!sched_job)
> @@ -510,23 +521,24 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>   	 * Update the entity's location in the min heap according to
>   	 * the timestamp of the next job, if any.
>   	 */
> -	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO) {
> -		struct drm_sched_job *next;
> -		struct drm_sched_rq *rq;
> +	spin_lock(&entity->lock);
> +	rq = entity->rq;
> +	spin_lock(&rq->lock);
> +	next_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
> +	if (next_job) {
> +		ktime_t ts;
>   
> -		spin_lock(&entity->lock);
> -		rq = entity->rq;
> -		spin_lock(&rq->lock);
> -		next = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
> -		if (next) {
> -			drm_sched_rq_update_fifo_locked(entity, rq,
> -							next->submit_ts);
> -		} else {
> -			drm_sched_rq_remove_fifo_locked(entity, rq);
> -		}
> -		spin_unlock(&rq->lock);
> -		spin_unlock(&entity->lock);
> +		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> +			ts = next_job->submit_ts;
> +		else
> +			ts = drm_sched_rq_get_rr_deadline(rq);
> +
> +		drm_sched_rq_update_fifo_locked(entity, rq, ts);
> +	} else {
> +		drm_sched_rq_remove_fifo_locked(entity, rq);
>   	}
> +	spin_unlock(&rq->lock);
> +	spin_unlock(&entity->lock);
>   
>   	/* Jobs and entities might have different lifecycles. Since we're
>   	 * removing the job from the entities queue, set the jobs entity pointer
> @@ -624,9 +636,9 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>   
>   		spin_lock(&rq->lock);
>   		drm_sched_rq_add_entity(rq, entity);
> -
> -		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> -			drm_sched_rq_update_fifo_locked(entity, rq, submit_ts);
> +		if (drm_sched_policy == DRM_SCHED_POLICY_RR)
> +			submit_ts = drm_sched_rq_get_rr_deadline(rq);
> +		drm_sched_rq_update_fifo_locked(entity, rq, submit_ts);
>   
>   		spin_unlock(&rq->lock);
>   		spin_unlock(&entity->lock);
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index bcfc2abe349a..31cab7bb5428 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -189,7 +189,6 @@ static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
>   	spin_lock_init(&rq->lock);
>   	INIT_LIST_HEAD(&rq->entities);
>   	rq->rb_tree_root = RB_ROOT_CACHED;
> -	rq->current_entity = NULL;
>   	rq->sched = sched;
>   }
>   
> @@ -235,82 +234,13 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>   	atomic_dec(rq->sched->score);
>   	list_del_init(&entity->list);
>   
> -	if (rq->current_entity == entity)
> -		rq->current_entity = NULL;
> -
> -	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> -		drm_sched_rq_remove_fifo_locked(entity, rq);
> +	drm_sched_rq_remove_fifo_locked(entity, rq);
>   
>   	spin_unlock(&rq->lock);
>   }
>   
>   /**
> - * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
> - *
> - * @sched: the gpu scheduler
> - * @rq: scheduler run queue to check.
> - *
> - * Try to find the next ready entity.
> - *
> - * Return an entity if one is found; return an error-pointer (!NULL) if an
> - * entity was ready, but the scheduler had insufficient credits to accommodate
> - * its job; return NULL, if no ready entity was found.
> - */
> -static struct drm_sched_entity *
> -drm_sched_rq_select_entity_rr(struct drm_gpu_scheduler *sched,
> -			      struct drm_sched_rq *rq)
> -{
> -	struct drm_sched_entity *entity;
> -
> -	spin_lock(&rq->lock);
> -
> -	entity = rq->current_entity;
> -	if (entity) {
> -		list_for_each_entry_continue(entity, &rq->entities, list) {
> -			if (drm_sched_entity_is_ready(entity)) {
> -				/* If we can't queue yet, preserve the current
> -				 * entity in terms of fairness.
> -				 */
> -				if (!drm_sched_can_queue(sched, entity)) {
> -					spin_unlock(&rq->lock);
> -					return ERR_PTR(-ENOSPC);
> -				}
> -
> -				rq->current_entity = entity;
> -				reinit_completion(&entity->entity_idle);
> -				spin_unlock(&rq->lock);
> -				return entity;
> -			}
> -		}
> -	}
> -
> -	list_for_each_entry(entity, &rq->entities, list) {
> -		if (drm_sched_entity_is_ready(entity)) {
> -			/* If we can't queue yet, preserve the current entity in
> -			 * terms of fairness.
> -			 */
> -			if (!drm_sched_can_queue(sched, entity)) {
> -				spin_unlock(&rq->lock);
> -				return ERR_PTR(-ENOSPC);
> -			}
> -
> -			rq->current_entity = entity;
> -			reinit_completion(&entity->entity_idle);
> -			spin_unlock(&rq->lock);
> -			return entity;
> -		}
> -
> -		if (entity == rq->current_entity)
> -			break;
> -	}
> -
> -	spin_unlock(&rq->lock);
> -
> -	return NULL;
> -}
> -
> -/**
> - * drm_sched_rq_select_entity_fifo - Select an entity which provides a job to run
> + * drm_sched_rq_select_entity - Select an entity which provides a job to run
>    *
>    * @sched: the gpu scheduler
>    * @rq: scheduler run queue to check.
> @@ -322,8 +252,8 @@ drm_sched_rq_select_entity_rr(struct drm_gpu_scheduler *sched,
>    * its job; return NULL, if no ready entity was found.
>    */
>   static struct drm_sched_entity *
> -drm_sched_rq_select_entity_fifo(struct drm_gpu_scheduler *sched,
> -				struct drm_sched_rq *rq)
> +drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
> +			   struct drm_sched_rq *rq)
>   {
>   	struct drm_sched_entity *entity = NULL;
>   	struct rb_node *rb;
> @@ -1055,15 +985,13 @@ void drm_sched_wakeup(struct drm_gpu_scheduler *sched)
>   static struct drm_sched_entity *
>   drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>   {
> -	struct drm_sched_entity *entity;
> +	struct drm_sched_entity *entity = NULL;
>   	int i;
>   
>   	/* Start with the highest priority.
>   	 */
>   	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
> -		entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
> -			drm_sched_rq_select_entity_fifo(sched, sched->sched_rq[i]) :
> -			drm_sched_rq_select_entity_rr(sched, sched->sched_rq[i]);
> +		entity = drm_sched_rq_select_entity(sched, sched->sched_rq[i]);
>   		if (entity)
>   			break;
>   	}
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 005db1e35fad..a0164de08f5b 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -245,8 +245,7 @@ struct drm_sched_entity {
>    * struct drm_sched_rq - queue of entities to be scheduled.
>    *
>    * @sched: the scheduler to which this rq belongs to.
> - * @lock: protects @entities, @rb_tree_root and @current_entity.
> - * @current_entity: the entity which is to be scheduled.
> + * @lock: protects @entities, @rb_tree_root and @rr_deadline.
>    * @entities: list of the entities to be scheduled.
>    * @rb_tree_root: root of time based priority queue of entities for FIFO scheduling
>    *
> @@ -259,7 +258,7 @@ struct drm_sched_rq {
>   
>   	spinlock_t			lock;
>   	/* Following members are protected by the @lock: */
> -	struct drm_sched_entity		*current_entity;
> +	ktime_t				rr_deadline;
>   	struct list_head		entities;

If I'm not completely mistaken you can now also nuke this entities list 
if you haven't already removed all users.

Regards,
Christian.

>   	struct rb_root_cached		rb_tree_root;
>   };

