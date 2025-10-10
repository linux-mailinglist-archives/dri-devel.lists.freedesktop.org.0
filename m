Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F45BBCEA02
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 23:40:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A643210EC89;
	Fri, 10 Oct 2025 21:40:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="i36p5G9j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012058.outbound.protection.outlook.com [52.101.43.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A758010EC87;
 Fri, 10 Oct 2025 21:40:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XJExEGLnArGrwoJ0+xDDv8DdZV3/QuQPZTAJJLhiZucUz0wpJ5tkhVnYToVhmnDBDAQ7VR0sQvdqUC/en4PjGvtzVvY3pRAyHAadL289biyh/Jj3aeQ5+ekLqxdY5N5IAW9gGvfWfCbBcbbTnKvf41W8tl79LYa8E1wjasogjvCBVlxTD2HodpW+67YfiaeWQ65Sfnx1kBAlNp5Zu5Bwhe4s3HChjL8dT9q2rhQ38OW6tHSTMrPE1GQ+n3JMmLYU3AxF1BYHy41LvrziHZXqSXLl8NfmsZMiq0pFi4354VyvH2XeYnPoCPSO7MEZKaCbF2AjYpcb1spzsAiAdLWxlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AaoUjcA4tz+4KAHTTGXWdk9Qn7nacsAeGeUY5rYYsxU=;
 b=p8E6BKRrH3kYKxr/hAfkMUGq4wrTvtQ2qJ3Sz1ZLb7VGu8t4bmbnGt/4duBdKgcpJquIoRF8A+qW3g31HWhG1AJR+EqBUE2lOSigs8zBFtqGJYhj8bNH8SxR264xtifJu+uUqDcak1j7wC6da1+ZJSGQcxHWziCNri9YXUtbgXTren33sPaFCw/mAsjGPgjBPFXxLvUEf8PFz76P0PIqTzQW4ib0xZCSN90LqYbEea6uibuTmNba8iUaXjvZ7yRoRhOjv1ov3B08NlgbNbS1lHr4qkdrzG46B+sqDqGdVYHyIky4pOVQC22CTS+SwSwAgKIxJxXk7uPyczmxnA6a3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AaoUjcA4tz+4KAHTTGXWdk9Qn7nacsAeGeUY5rYYsxU=;
 b=i36p5G9jUY7nTGYZnSgd3w4otalve4J/PVlJONNFqw3rC2cPDvqZnQ7DsK6LUsR+g82IzOAoqO5F8sRRf/VTi7F7fNApsZ08J41VTUPCTLUf8OHX27RHlBCRaqynClPaE5rgFQkUedXa3bm1xbma9PsqvBUgGi9jhOQyUrXkBdI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by IA4PR12MB9788.namprd12.prod.outlook.com (2603:10b6:208:5d5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 21:40:46 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%6]) with mapi id 15.20.9203.007; Fri, 10 Oct 2025
 21:40:46 +0000
Message-ID: <43ddf3e4-d328-41ec-a8aa-f1b185645a31@amd.com>
Date: Fri, 10 Oct 2025 17:40:44 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: use atomic functions with memory barriers for
 vm fault info
To: Gui-Dong Han <hanguidong02@gmail.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, baijiaju1990@gmail.com, stable@vger.kernel.org
References: <20251008034327.2475547-1-hanguidong02@gmail.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20251008034327.2475547-1-hanguidong02@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0385.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:108::24) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|IA4PR12MB9788:EE_
X-MS-Office365-Filtering-Correlation-Id: 887ddb1a-374d-423d-61d3-08de0845abcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SDg5UHZCNkFJU3ovYVdURVVTd2dwbkJKRU85VDZiWnlrUlRlSmpUMXdyKzl6?=
 =?utf-8?B?MHFnWWk3bVB2SUk1QURZL1dtd2JvS2ExYlF4Q1k5L0dRMlBGdmVDSnVYMENu?=
 =?utf-8?B?cHkxL1VteWJUMVlmbzlVQTV2bFFHcW5aMzhwL1ViU01RRG9ua3hmWDVCUVEz?=
 =?utf-8?B?V3dEbEUwWmNNY1FYNHpVN2prUnNxN05hYmVtdGhXejdRZ0ROMXJoNlplcmo5?=
 =?utf-8?B?THZJc0FrVlBaUFhEenV0dlFJR3h0M3NKREFTdXRnSnUzUGI5eTVISWZsTWE5?=
 =?utf-8?B?UDN1bVRaRmVrMDJLcWtoVGV6Qk94QlgxRVNBNytHTkdvODJhMUV4Y2tzN2R0?=
 =?utf-8?B?V05ySnlvWlExcWVpenJWNW5Uc0R1K3YxQWdLTmN1Z040RklNWE5MZ01BNnNF?=
 =?utf-8?B?SWp2RGZTdis3VytNRzJ6L05USnA2SlBRbDk5Uk12cWx3WkR2enJRdzUxZEJF?=
 =?utf-8?B?WFJlODRScUFwQXdtUnA4ZGNXTHFUbkk4cGh4czBLN291N1dmcFNaSEd1YThL?=
 =?utf-8?B?N3lFUkZxeFhlMzVEdmtCSnU2WkJOZXRoYjRLYkN4c25PVlpKNXhqMmxtTjdJ?=
 =?utf-8?B?a0Z6cmE4WHVJWHQ3WEVMcGxRSC9xb1NMR3hEZFp4RHUwK1R2NXBuckNzdGpV?=
 =?utf-8?B?Y2VjVGw1TTNZZUN2YVZST0dvK3Y0L2VNNHpkNGF0dkthbEllT00rTWFjMnU0?=
 =?utf-8?B?OThWVlhJMHZzSWNZbkc4cjdjaWpnWDhuR2gzcyszVng2UWdxUmt1eUY5elVz?=
 =?utf-8?B?TnlhdEhyQ1NGYi80U1BVZGhxdjRGUW1qSGdqbEJzSzZwRU9yN2wyem1uWmFS?=
 =?utf-8?B?VkFGNC84ZTdPS0NHK3cwc1B2OXJpWExmU0V4cU50U05LNDhuUjJOS0MxVCtD?=
 =?utf-8?B?UUtLMjZiWTFHaE84MCtsUEhUdUt0UlhpaFk2Q1U2RHd1WFJBd1lZUHlkZUZs?=
 =?utf-8?B?MXdubS8rMVBpVi9ubnl3V1I0SENmY1dVbDBFSUJOUHRRakVsMkJQemtiUlgw?=
 =?utf-8?B?K3U0UFdzc04wR3JhMjUxdElnaDJ0NHN3cjU5ZlFkUytlZ2Y1OTlYakRTU2oy?=
 =?utf-8?B?b2dZWEtML28zMFU2WDk5eWJFRXR5a2txTWJzMFYzZG9WbzlpQ3p3dW9ZQ2tH?=
 =?utf-8?B?NVYzYng4NUZQQ3hGK0dhblNOc1N4emlNS0lwZC9hMFlqcGpuaWRHb0ZDemxz?=
 =?utf-8?B?UGpVTzM4c2MzaTJsZXl6bFRVK1NmMUV4dXJhQnh5SFg3SlhQRHNlRzdYRERB?=
 =?utf-8?B?SWhqdHQzenZ6Smw0Q0FETTZ6M2RFMFhsVmVBd1pxNWExbmlzZGh0VStxNWd0?=
 =?utf-8?B?dlBnYUc3UkI4UFl1ZVNoN1hpb21EQmlSbUxaS2JmYXEwbU5jNDQ5VTJkN0p5?=
 =?utf-8?B?RzQ3YWVnK0tRWEJqQVJjUUcvVVplS1EvWjBEVWUwRGRBL3loazIyaU96SzFC?=
 =?utf-8?B?WWhKb2RPSXVxT2E4NjRybVpkUEM0dS8vYTJUcnFDdndzYlFWekRQbEZPNXhZ?=
 =?utf-8?B?a2p1OHozY3lpankrR1lTUkt4eWk2TUlMVTNwdjhiZGY2QjVzR3BoOXR0elpm?=
 =?utf-8?B?Mm9td1N4cTdTaS9aOS9saDNwVm1HYkhNOGdrNnA4a3B1aURudnJjQUlRUVlw?=
 =?utf-8?B?ZmdsVUFpa0I1YmpubDY5Q2lybTEyRDE2VEV1WkNyeWFCOXI1TWFxbHJNTlkx?=
 =?utf-8?B?Rlg5bXJRZTZsUVNla2U2c2ZXWGppR2UxNkhXeDhXOGdmTUh1T2hCVUJpeWRs?=
 =?utf-8?B?QzRocEtjV1RCOGlKU1FkczJiQnBwZHR0ZTE1ODE5U0VsZkdzTElrSFh3N1dR?=
 =?utf-8?B?aklFSk5KM1dtQ1FESHpuWUVucjcrNXoyN2g5cDJ3T0FJbVhOQUtLVFkyUGdl?=
 =?utf-8?B?NmRhTGFsNmdpZHh1eVl5STN3b0g0KzgzbzFHRDBLTmdhQmN4TU9WTy93TmhS?=
 =?utf-8?Q?yahMbzrM9N7PxYDa2FNpI0i7FD4v08sw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnhONmtNZUMwakFWNTI4eGNHK0NybzYwUEdOdG8rcmIyWGxuMUFVYXdGK0Rz?=
 =?utf-8?B?WXJKaXplbHprZWhIRHN4ZGE5YTkvZzl0c1NncGtlbjFwZVhDK3hCMzg1eGJJ?=
 =?utf-8?B?VTRGam4vY3Nvdy83Z2ZDRzJRVDNibHplN0F2cnZTZndhTEVDb2JkUHhhbjlP?=
 =?utf-8?B?ZTY1aWNFb1RwZ3laUVdkdytLOTJTSlFQVnlKdHd6UWFTb0dCWUIwaGRzNDVN?=
 =?utf-8?B?Ulhsa0hyUE1lNjh4bDA3dXdsT3RJOGtjTk05M09za0dxbmwzVkpYMTVYVDIw?=
 =?utf-8?B?ZkJqMllDekFKd1gzSFpTQ0hWeFQ5RnVhVkNxUldxZy9pRVU3M0ZJNXF2anRY?=
 =?utf-8?B?WGFUNmgxdW5aYVNxanY0cEtQek05NTl1L2swSFRUSlQwVkZDWnE3ZjN3cEdU?=
 =?utf-8?B?MG1yc3U0dExIb0Voa2VvQkxGcDBzQUx2MitCRmFTdDQwMnBBNzhPZHpReW9t?=
 =?utf-8?B?YVVFazh5NkZvaEZKMjZWZmNHWkxOdkxaQ0s2TmtuSFV3ZDBiU1VUeUlxcXcy?=
 =?utf-8?B?QjN2QVVTMi9VSzY4eHJ0dnZXa3hCcGF1T0JlMFQwTVFwYmRzZTFZM3l0Mm9F?=
 =?utf-8?B?U25xNURjRlg0VnF2TzN1em56MElwUzdLeXJFeVlTODFXb3EyNldPbmswTDdh?=
 =?utf-8?B?bnVkUTlPb3o1aEJpN3VRTmNFcWE3ZzZlK2czakhIVUFYK1dCTDNPUUF5b1FE?=
 =?utf-8?B?M0F0dlgrYVdhUzFMcXFZQ3FEaTdtS1BtcjZRSCtRUEFmcStGV3M1TjlYRUhu?=
 =?utf-8?B?aEtqRlBOL2p2VVpkZzYxY0FjRmN1R001WU5yWEZzdzN1ZGNIZlhqUXJWVkdS?=
 =?utf-8?B?dGIyYW5wSFEwWVV6b1ZKUjJiVS8renlpZzVBWnUzNC95d2N3N2tsZ0JmRkRy?=
 =?utf-8?B?QkZ1eFRuZDFwQ3VqQ3l3bHNHMGdpcm8xYWhIZngvWWR4V0E2cGNzTTVBbWFy?=
 =?utf-8?B?QXhKRm9OeEVjaVY1ZU9aejJ6bWo2WGp6NkpJZUFBa040a0RGbG0zZmJwaDdl?=
 =?utf-8?B?Mk02SUM1SHo0bnZwU3VOYnZBbHRFNHBNdEtwQ0VpWUZRVFFORWlnRGJYMGVw?=
 =?utf-8?B?bmYweEZhSWZUVnFNTWMrNmFqdER4WkR6bU94MGNHV0dnd2pHMEs4d3I1V2VH?=
 =?utf-8?B?eVlkckxDNVNja0Y0RmpIRExZZE96WWpNNkJCZW10R1BqUEZiaHcyN2ZvMFNu?=
 =?utf-8?B?RUFObzlPSlZFOXNxSWpyRDg2TFhIbitLN1podzNwVE5RL0h3WTVzOHo0NVU1?=
 =?utf-8?B?VmhUbWhXNHUwL0FacTdpNlpZVEhsS2tKRmpCd3FMZDFNQ0EwVHBUMXQ1L2Js?=
 =?utf-8?B?RmxIMFR3U2t2STRHanZaTStaalFCSE4zSHIxbHVYWUtZZU1YZGphY2daOWVS?=
 =?utf-8?B?K0lSZERGeEl3SjJrMldQSUlIWVlleFFCNThlQ1BKZXNUZThZNVkxaUxBaGd0?=
 =?utf-8?B?ZmFwU3FwdjZVaUE1WUV4QWdaMzJZN0hoa3p3SksvL0Y1YWI3eUFQQnEvOHNx?=
 =?utf-8?B?N002WjExRnFqYWc1dE5GWDFjc3lMbVYvdHVWUGRXZ3lYY01xNXZlMW9mTGZa?=
 =?utf-8?B?ZW5pZXBPR0RsTGVLekpyb25GdEl6a2xMYkVoL2EyRjlKVzJoWnJvYzcxbTlL?=
 =?utf-8?B?Wk1GNUg5V2FVK3FKTzV3Ykw0c1dSTVQza1JtU3czRXNYdTFnb1NNT0tZQVhZ?=
 =?utf-8?B?bmh3NkFNdmdDQ3pWaURVN24zMENNUWxRUGk5RWxLSElXL25rZXFWbGZiSC92?=
 =?utf-8?B?Rll4NkV6dDlVdER2aE9oalBjS20rQndyVmJCZVc0dE9CVnBBOFp4YVhzMmNP?=
 =?utf-8?B?akg5cXRUVTB6dkwzSFR3ckZuTGxPT3JKYndKczFlSDFBRU1Ya29XNW0rc05D?=
 =?utf-8?B?WlJ5bEd6QmdHdk5zbElBZ0VSdVdBaEJlZEE0OVZQbjJRWmFqOHZta2k1Z0p1?=
 =?utf-8?B?QjkyNjFkbUJUK3hMVTVnQVhNNjV5QmIvTWI5UWRKK1N6ODdDTXNJOUY0NC9M?=
 =?utf-8?B?V2pGN3FkdFBBKzRHWGx3N1VXYWk0dXZHTlBURlVoVXVTR1E0amJtMjhHMUtm?=
 =?utf-8?B?aitDL21UTmFBdWg5Qjk0bEFxSFJ5N0ZvaUpKRU51b3l6bnZ4TWdDSDlidnRa?=
 =?utf-8?Q?G60mrjOHKL0U73PmxLpfuTK1V?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 887ddb1a-374d-423d-61d3-08de0845abcd
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 21:40:46.4158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 00ZGSVUrNh/K+EBFV/KuIu5AM6M40GD7BUoOdal6nh+yAjikxUQmnRphPURowH3Ll0NlRiRdnSL9yMLAC+dBZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9788
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

On 2025-10-07 23:43, Gui-Dong Han wrote:
> The atomic variable vm_fault_info_updated is used to synchronize access to
> adev->gmc.vm_fault_info between the interrupt handler and
> get_vm_fault_info().
>
> The default atomic functions like atomic_set() and atomic_read() do not
> provide memory barriers. This allows for CPU instruction reordering,
> meaning the memory accesses to vm_fault_info and the vm_fault_info_updated
> flag are not guaranteed to occur in the intended order. This creates a
> race condition that can lead to inconsistent or stale data being used.
>
> The previous implementation, which used an explicit mb(), was incomplete
> and inefficient. It failed to account for all potential CPU reorderings,
> such as the access of vm_fault_info being reordered before the atomic_read
> of the flag. This approach is also more verbose and less performant than
> using the proper atomic functions with acquire/release semantics.
>
> Fix this by switching to atomic_set_release() and atomic_read_acquire().
> These functions provide the necessary acquire and release semantics,
> which act as memory barriers to ensure the correct order of operations.
> It is also more efficient and idiomatic than using explicit full memory
> barriers.
>
> Fixes: b97dfa27ef3a ("drm/amdgpu: save vm fault information for amdkfd")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>

Thank you! The patch looks good to me. I'm applying it to 
amd-staging-drm-next.

Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>


> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 5 ++---
>   drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c            | 7 +++----
>   drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c            | 7 +++----
>   3 files changed, 8 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index b16cce7c22c3..ac09bbe51634 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -2325,10 +2325,9 @@ void amdgpu_amdkfd_gpuvm_unmap_gtt_bo_from_kernel(struct kgd_mem *mem)
>   int amdgpu_amdkfd_gpuvm_get_vm_fault_info(struct amdgpu_device *adev,
>   					  struct kfd_vm_fault_info *mem)
>   {
> -	if (atomic_read(&adev->gmc.vm_fault_info_updated) == 1) {
> +	if (atomic_read_acquire(&adev->gmc.vm_fault_info_updated) == 1) {
>   		*mem = *adev->gmc.vm_fault_info;
> -		mb(); /* make sure read happened */
> -		atomic_set(&adev->gmc.vm_fault_info_updated, 0);
> +		atomic_set_release(&adev->gmc.vm_fault_info_updated, 0);
>   	}
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
> index a8d5795084fc..cf30d3332050 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
> @@ -1066,7 +1066,7 @@ static int gmc_v7_0_sw_init(struct amdgpu_ip_block *ip_block)
>   					GFP_KERNEL);
>   	if (!adev->gmc.vm_fault_info)
>   		return -ENOMEM;
> -	atomic_set(&adev->gmc.vm_fault_info_updated, 0);
> +	atomic_set_release(&adev->gmc.vm_fault_info_updated, 0);
>   
>   	return 0;
>   }
> @@ -1288,7 +1288,7 @@ static int gmc_v7_0_process_interrupt(struct amdgpu_device *adev,
>   	vmid = REG_GET_FIELD(status, VM_CONTEXT1_PROTECTION_FAULT_STATUS,
>   			     VMID);
>   	if (amdgpu_amdkfd_is_kfd_vmid(adev, vmid)
> -		&& !atomic_read(&adev->gmc.vm_fault_info_updated)) {
> +		&& !atomic_read_acquire(&adev->gmc.vm_fault_info_updated)) {
>   		struct kfd_vm_fault_info *info = adev->gmc.vm_fault_info;
>   		u32 protections = REG_GET_FIELD(status,
>   					VM_CONTEXT1_PROTECTION_FAULT_STATUS,
> @@ -1304,8 +1304,7 @@ static int gmc_v7_0_process_interrupt(struct amdgpu_device *adev,
>   		info->prot_read = protections & 0x8 ? true : false;
>   		info->prot_write = protections & 0x10 ? true : false;
>   		info->prot_exec = protections & 0x20 ? true : false;
> -		mb();
> -		atomic_set(&adev->gmc.vm_fault_info_updated, 1);
> +		atomic_set_release(&adev->gmc.vm_fault_info_updated, 1);
>   	}
>   
>   	return 0;
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> index b45fa0cea9d2..0d4c93ff6f74 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> @@ -1179,7 +1179,7 @@ static int gmc_v8_0_sw_init(struct amdgpu_ip_block *ip_block)
>   					GFP_KERNEL);
>   	if (!adev->gmc.vm_fault_info)
>   		return -ENOMEM;
> -	atomic_set(&adev->gmc.vm_fault_info_updated, 0);
> +	atomic_set_release(&adev->gmc.vm_fault_info_updated, 0);
>   
>   	return 0;
>   }
> @@ -1474,7 +1474,7 @@ static int gmc_v8_0_process_interrupt(struct amdgpu_device *adev,
>   	vmid = REG_GET_FIELD(status, VM_CONTEXT1_PROTECTION_FAULT_STATUS,
>   			     VMID);
>   	if (amdgpu_amdkfd_is_kfd_vmid(adev, vmid)
> -		&& !atomic_read(&adev->gmc.vm_fault_info_updated)) {
> +		&& !atomic_read_acquire(&adev->gmc.vm_fault_info_updated)) {
>   		struct kfd_vm_fault_info *info = adev->gmc.vm_fault_info;
>   		u32 protections = REG_GET_FIELD(status,
>   					VM_CONTEXT1_PROTECTION_FAULT_STATUS,
> @@ -1490,8 +1490,7 @@ static int gmc_v8_0_process_interrupt(struct amdgpu_device *adev,
>   		info->prot_read = protections & 0x8 ? true : false;
>   		info->prot_write = protections & 0x10 ? true : false;
>   		info->prot_exec = protections & 0x20 ? true : false;
> -		mb();
> -		atomic_set(&adev->gmc.vm_fault_info_updated, 1);
> +		atomic_set_release(&adev->gmc.vm_fault_info_updated, 1);
>   	}
>   
>   	return 0;
