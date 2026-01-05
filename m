Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23697CF5486
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 20:00:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9E2710E425;
	Mon,  5 Jan 2026 19:00:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IjMpDDIY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012047.outbound.protection.outlook.com [52.101.48.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E1810E415;
 Mon,  5 Jan 2026 19:00:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KojETgJHsmzXk8C2tPVmyueSc+Bp+EO7yi7PyrMhbWYpBcNkoUJKrftopqZeahKrg8+d+HRIVN4CJU7f4oDMBsBFmeIV/h8DphSUI/VwEuS5fa5oEr5UPQGW80C4VcWxxrHoxcg9f2TK5JMbdPYDnE+wzFYg3dum9jHKlsMlLAZlVYhqDkyxk1q3H9LRihu253NKVrk8GhGQIyT0LuoQP02gSRr2qZsQArUfDUXOTvPE93V28C+AZlpj6zkSzHENBdLVcWB9nuRRLgNGgUNgaaNBnhDjZROuPiRqP0GrDqeMy3H8Wm3VUUqcAlCSQ/SEdewlmqQtcGgQNdrSlFeYyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kpvg0sli5wsog0xuUOoDPd9c/e76jG94FiJ/aMUbxOw=;
 b=nUWRWtj0rZwRKnfsIVxkPgeD0PTysjE0x9O3Sdxj1K29eqEvdsTwERugbSmnnL+uQeKapYISidbzeb7TIYZBYfWGPoFyQ7oDE5o7p36NHFAmGLMud6yxF/ihGN5BEEiWaptTQc/eVPHa13u8ZDVtmB9AShFqi5VFgSBBIWx/4J6cOQNdX/qFSlhfZFgPKAENqAIPV8RjnjfPUbJ0rZ6zS5zKvEhPQ8mBMplUYkHeEDeCLvl2O7g0A7bxLKikbc5kRhzz65dFWHIIo7kbukN4She4I5s1Jw9uI3s2crwNQEzPCzoSPcRY3WuOsGdjLqk3AZpCWlkUdsM4xqsj1yMMhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kpvg0sli5wsog0xuUOoDPd9c/e76jG94FiJ/aMUbxOw=;
 b=IjMpDDIYUArCda7PDt2tQFcHH2ild59jz9RByd8lr9pCG786Tji1St0zkHtqBMRHw5CmP5VtkNEac7X6p5ztZUMXX1vd3EjkofnHvmQCZt7QZDEj2s2eYY4vVvr5q7lfGeQgVZT9V0oZmJyR8BR7BOzlPCi5ZBmtWqYMKBYvyHM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BY5PR12MB4052.namprd12.prod.outlook.com (2603:10b6:a03:209::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 18:59:59 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%7]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 18:59:58 +0000
Message-ID: <c124806a-1cd5-4628-96c3-70e941de747e@amd.com>
Date: Mon, 5 Jan 2026 13:59:55 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdkfd: fix a memory leak in
 device_queue_manager_init()
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260104131532.3978895-1-lihaoxiang@isrc.iscas.ac.cn>
Content-Language: en-US
From: "Kuehling, Felix" <felix.kuehling@amd.com>
In-Reply-To: <20260104131532.3978895-1-lihaoxiang@isrc.iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBP288CA0010.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:6a::29) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|BY5PR12MB4052:EE_
X-MS-Office365-Filtering-Correlation-Id: 68044787-ce96-4209-5944-08de4c8c9f10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eWRBeUd1YTlOaHlyT25YSCtMbUNzZlVLZDdNVGlNNG82MGY4b3Bsc0FweWY0?=
 =?utf-8?B?RnBVVStETXRRbmFOd3liOE56SmZqL3BDVzJsNE13U1RMK1hUVUlKWkt2RXM3?=
 =?utf-8?B?VzE0MnlrM2xDanBod2NTM0JJZVg2TkhJM3lpaWVFZW5KUHpVc0xjMXBWVWhK?=
 =?utf-8?B?SS9QVDdvMmxsdjJRZFRMdmFQUnI3Z2NJbnBxTGpyaG05MmVzeFduZ2NuUFZp?=
 =?utf-8?B?ZEhpQXE2MnEzWHBZYXFMaEFvZEJ4K0hHaS9ZNWEwVENIZm9BZFNmRlBqRDJQ?=
 =?utf-8?B?NS9hWmRudmh0TXF5Rmw3bzUyMktydGc2ZDJ5TmNuUmRqY2Z3VmVHODhndTNy?=
 =?utf-8?B?bUoxWkpLdlJlNXJlNjdaQmltdVhZWFFtL3RhOVhwZlAwblJzSitJUTVDa2Vk?=
 =?utf-8?B?SndEemhXWHVDNXJDKzM4eUFESGVTNlZSRnB2amU1THpCL29CT3I0L3dEaWtn?=
 =?utf-8?B?ZDltQ1NwdWovOG1paHB4U0JaQXhaSkdKeGUxMk04NTlrWDBkK1h3SGtvTjJF?=
 =?utf-8?B?a3g0QWQ3b1hmMUlaVzNYb0tKdHZlVWRrWkN1S3owcVMrUU5udTBTVHZHUEIv?=
 =?utf-8?B?OFJzUVdvb2xRMDA4N0lJb0I2bS9kQXVPZVlpaEhQdmZCZ0pGOHU5dy9pTmd2?=
 =?utf-8?B?Tzk1OE56MGY4Vk8zS1R5L1RReSsxYVpXWW1yZFd1K2gwUUhZVFJQVnFnRldH?=
 =?utf-8?B?RnhIZExDSDhSelZ4NzdxeXZSaUdHQ3ArcndEZllSQVNzRU1iaHA2Rlc1SlpC?=
 =?utf-8?B?R1cwNDZVZkhxc2tSWW9Zc3NMU1FUYnRZaENzWFZMNjVpSmxwdi9wQXdJdk56?=
 =?utf-8?B?OTZtNkhqMnU3WldhYjRCRlZNbHBSZjR6T1JaK2ROWkNaTy9jcnhsYmRBSlM5?=
 =?utf-8?B?RXQyTUVwQjY3YVF1YVhnNEVoZ1d0MTBOR3NqSG5NMkZNVzZPTzUyUG84ZEpz?=
 =?utf-8?B?MUh2cE1kM3JqbFAvWFpWRE9VWUhkY3lnRVQvbGtraTFFanFsZHIrNkVJMWo4?=
 =?utf-8?B?R01OMUdoU2hxMnNlR1hPZVpHa2JzTFVvNjg1MU1ucmJna2U3K2tiK3dqRnRE?=
 =?utf-8?B?MHNMV0RaREFCUm1acStJR1pHZ2dZZ3JUWWhGakd4TE9Gdi9uTWFrUnZZUjU0?=
 =?utf-8?B?c1R5czdER2FNdEYwNFlDRGtFalFyakZyMWtwVzhya203Z3F4eFJXOThKbGNo?=
 =?utf-8?B?Y0xWeU0rZzdGbWcwVmJrNzNvZUtTbmtWdXNyNGhudDFrVGNVTFdld0dNSWdU?=
 =?utf-8?B?R2xIMHE0d05JV1UvaWh4ZkxEbUJteW12SE9obGZsNk1nVi8vQXNPZDZhb1Bx?=
 =?utf-8?B?MmlkMW5QUDBoYUJXM0dPYm9WYk5GYWR2K1pOSDZ1L1Uxa0ZvR212MFJFRERa?=
 =?utf-8?B?L3NKSVFHazdlb3J6TWppeGxMTUUrTVVzUTFqdnkwRHJmUDRZYVlOSVJyeWwy?=
 =?utf-8?B?akY3Qnl5L1FPQXBoR2wwNXU1aHIzc0RiblFGTkRoKzJlZzM2b2d6T2d2N09k?=
 =?utf-8?B?N0NxSnB1bEhRelFEckFqYXhwckRRUW1yUEU3bDZBN0hDbm5INTVhMFh3SEZQ?=
 =?utf-8?B?WHM0M3JyNW9oUkF3eEVYN3ZKKzRPVDlQTFNmbUFERlIvdkJVOXR6a1JIMU5o?=
 =?utf-8?B?dm1WMGZ3WHZQZnh2YmtNV1ZCRmNGUVdXMEdGeTByU3dSTTN4ODNxU093OXJ6?=
 =?utf-8?B?aTBZMGVRaXYxOEdPVVRLMTBKc0hZNTFQdlBncU9iOTdIVGlzUnVoRFhoWUFR?=
 =?utf-8?B?NG5JU2tPZ1NYZkxLUkVZZE5QTmNwL3QramIyZmN5UDVya3dmS3BkekU2eHp2?=
 =?utf-8?B?THhYQlhxb2RBMUpiYm9YekYxRUlZekhyTXFGUUpJQ0s3V2tNQ2hXZFNDb3VC?=
 =?utf-8?B?UGxseDZYcWZhZmU4YVBNMFRmYXkxWGdoNThIL1pwa3RFWWgvaUROaFdpRFNL?=
 =?utf-8?Q?JvZuynJSD08Ggx9lgX+5pLAaYyRX17+L?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXljbERQYUFUTnRlQnJubTBnM01IOVR2V21nSHVHQmlRQXlzMjBDUGEwMVda?=
 =?utf-8?B?WnFLSDhVdmdNcnRodFg1TnBqZHl0TTFQZVJEVVZDM1ZLVVZmc2ljV0lxd0o4?=
 =?utf-8?B?aVhpSTE1NnpqN3lpMndEMjM2b1FZdEFZMXZRMGU1WFlYVmVyQTZWaWJ4WWl4?=
 =?utf-8?B?R1h3RmVIRWpLYStZcU1QRlV0SUJ6NUJtYnFoSkVrb2NsNjBNc2JndjZNWTVI?=
 =?utf-8?B?SHkyU3FrSXgwcytpSGFuR3BmTm1iSlRxOU52djlzNS9JT2tRNW9TRWFXZlRV?=
 =?utf-8?B?TVNhNGlFYjlwMjlINDJUS2NXQmNZYXQxcXVsajgvK0Y1eHVwdW5OMTg5eTFk?=
 =?utf-8?B?OWV6akRmdkhVU2lXWWlTMmxqMFVqY3FPc1VTTW1zQlkzUWtTQ1FVRFNGUjRk?=
 =?utf-8?B?ZlBoNkRiS25DL1MrenAvREtGR2orcmVyNitsUERsZ29FcHA0WVpnb1h0cXpq?=
 =?utf-8?B?SFpaOThUczgxUHhSUHBiUzNid1FqeVBLWDArTEtYNjRUdml3NFhmRkpGK2xW?=
 =?utf-8?B?dkRUeHl5S01Ya1RlWlRHQlo2SnNzcDFxVUxFUWVSbkpaaFpxdTFXZTVibDMr?=
 =?utf-8?B?aFVkYWpNekNrTVRDbXlSdVplbWZuVlhFYTh6eldyaUk3eUpSZC9lb2szV1Z4?=
 =?utf-8?B?ZVQxSlpsTUZYTmtKcEo5L0hLWE1GWmZPRWkwdUp1S2N6dzdQdyt1MjdNMUM3?=
 =?utf-8?B?SktraS92OFZLZUtjMlJGQmtRKzJCUXh6MEJZWmtuNEppZ1U0NG4wN09qbkFo?=
 =?utf-8?B?QkN2cGFZdUY3VVJoMDhxN1pBaUV0Tnl0dmYvUHI3SytaRG0zNUdVOTVFclJK?=
 =?utf-8?B?MElOTkVzcnovYVAwd3lra0Y5MWdyQVNHUm1hVUxaMlpVeEpRTzgwQ1c4NXhM?=
 =?utf-8?B?c24vUFVHc2c0SDh5Y3hlbHJQZFc0T0dNSURYdTRiV2NjSWtGYzVtU3drM0tL?=
 =?utf-8?B?MVJSTnhMSFptbmpDVzhEZklMbTBEUndYTSs0MnJ6bGZBQjdIM3NyN0hxU25O?=
 =?utf-8?B?UGtEZFgyckIvTTdPc2RQeTErbGVRbjZUMEpiK2pQMWZrcWU5NC9WUHNrakEy?=
 =?utf-8?B?aFM5Tyt1bVRFQ3J3c0taVldUNmhiRDlWYzg4N2tMa3g5b241dElMelo2U2ZB?=
 =?utf-8?B?OUEwODltbmtpa0I3eWtMNTRIeWpKMm1ERXFSejRjMld5TlRwK2dTa3pYL1c4?=
 =?utf-8?B?SFdjNGdQVUwxQ2pVdlZzM3ZodVFpaDNTNVQ3S0NiU280YkdmQndFSjRKVzRv?=
 =?utf-8?B?bXFYODJwcWJFUytITUo0NURabFIyNVVReklXb2svMTJmUEJKSHZCZU9wZU0y?=
 =?utf-8?B?bXMwOHNaakNKTk5hQXdydVN3RmZDQlZVT2VFdlRRVXcwY1NwNjNUMmJRcVdC?=
 =?utf-8?B?UWNHaTRLMXUvQWc2MTFmOEtQdEs1YnQycnd0dnpZTnpOR25EWCthM1dDeGFW?=
 =?utf-8?B?czd3VHpIUFlISGphaTkyeHVhT1ZhTUVXVU5DWVFSSUU0UllGVjdjWkhvYm9K?=
 =?utf-8?B?TmN1cjAxTG1SdVY2UE1ITExwWkJJRWVmT1ZxZEtIOEtyalhmdEhFYzdvZFBD?=
 =?utf-8?B?cTVZY1FibFFFN0hVK2g3ZlBBTU1OUjNFTVFmbFkzSDk4cHVLeGFLVXU3eXdC?=
 =?utf-8?B?bHIrVXFUQ09HMHMwN1VkY3FtblNJbXc4azJIbWRqbGhRMEtuQm9LYlJQNHFD?=
 =?utf-8?B?LzZIejh0NmE2TEhWcDVTUjFvK3NFTUNrZlpzdmZJeHhGKytUTjRYeXRkc0FB?=
 =?utf-8?B?dlFJZ0NkdFova3Q1aEVJOFZnU0RCK2lBUHRHQXRWdldQZ00wbHpUVFBacmxV?=
 =?utf-8?B?N3NWNzNVZFU1QWhIRUw1VFZUdTBPNEdreDJDWmtMcFUwVDN6OFNuVytEdk9o?=
 =?utf-8?B?YU84M2RyTkNPZGx6VDAvLzN1UkRDWFZkVDdlQWliaGpmditMbnhDV012eXUv?=
 =?utf-8?B?aTJBRVlmSEFhWWhUclBFaFVnTkxJV0VKL201ZjBHRGE3WExkOTVSMVBsSGNU?=
 =?utf-8?B?dU45WHE4eWRSUWpCb3p3T0M0bXJVekVzMURteFh4VEZNU3h3TTl2YUhWRE9T?=
 =?utf-8?B?QlFaY0RaL0l0R0RUR0dwc0xnbVQ3dGJyOWtOR281VkZrVUpkRHl1UmV6ZW9E?=
 =?utf-8?B?NmQrZGNPOGczS3dFcXh1bTYyaHVQUndwRjZPS0FxSnExUjZHQzdFeFVyelpn?=
 =?utf-8?B?TTNBeHlDRkYyTkdhZTRhTTJYL2M1L09GVDRkY0hLVjhHamNwQXcrQW1MSkZ5?=
 =?utf-8?B?R2JVa0pYYVZBODJpd3dTaWNXbWk5VElSbS94VnlPQ2lxbStzMjFRckxzdnY3?=
 =?utf-8?B?SVA2clU3UzRWNlZYeU5CaVRSNXcwTC84eDBCUVE2aUlwZ0JIZ3hmQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68044787-ce96-4209-5944-08de4c8c9f10
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 18:59:58.3412 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BybSL1lPJv09e06LTDCeyLH6MFMav3OUFUOVW62uK8yBo6ST6hUEZhnu6LtQUEDb2CwEB1Xcbz+efNyqOnvkWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4052
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

On 2026-01-04 08:15, Haoxiang Li wrote:
> If dqm->ops.initialize() fails, add deallocate_hiq_sdma_mqd()
> to release the memory allocated by allocate_hiq_sdma_mqd().
>
> Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> index d7a2e7178ea9..58a8d90c1533 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> @@ -3042,6 +3042,9 @@ struct device_queue_manager *device_queue_manager_init(struct kfd_node *dev)
>   		return dqm;
>   	}
>   
> +	if (!dev->kfd->shared_resources.enable_mes)
> +		deallocate_hiq_sdma_mqd(dev, &dqm->hiq_sdma_mqd);
> +

I thing the idea is right. But see the report from the kernel test 
robot. Either move deallocate_hiq_sdma_mqd up or add a forward declaration.

With that fixed, the patch is

Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>

If you send an updated patch, I'll apply it to amd-staging-drm-next.

Thanks,
   Felix


>   out_free:
>   	kfree(dqm);
>   	return NULL;
