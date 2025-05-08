Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 991D4AAF73A
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 11:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B5C110E386;
	Thu,  8 May 2025 09:54:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wHKqIymu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2055.outbound.protection.outlook.com [40.107.223.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A84010E386;
 Thu,  8 May 2025 09:54:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WcLfwLjGrEi/KZmDvmJlbBrrRPiv+ZtdN5njnGWOOF0aE+5X3qgkVCGquid1t3zmcKH6rSac3m+y8N3Grj6f+sSnVgu867x+UmhwIVWzawlGdL4RbZ0k/J6N6jOQtHSpELg8tWVTGeE118H9JJJGMyVbBehjs2l/Ygfup2eB4npQLy5Vw/TKw7oxinZpWMFW1+drg3Xr4lQhVjS508D+Z2ALPqTSGiJYtgOnbMveROvkDXdFI0M/KBUrA1NtPAf0rHZuNRsUu3cyzBrDOwToW/RNyK1YQBmAtH6w7XPzKAY/MWtVhHTVXQnfJrjhrAN6KcdpufhMX0Js/nzqBWeR+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=92mBRqvlhpeuo23ArHea1zS4X3ctykjhk9WZoqzLELA=;
 b=fY6Zqd8/1IYSIeRXUS8UG/M1GQOGX+GRZ2bzB6ZbEa40Rxsg6dk1dE/vkjNqrPeSC1lUoR15Yhfsb8gatfCnMFzIBhZwEpN+Z+f06rwUpmJ3xwKZx3yHGEmi3FvZSDdZgcvWUogtw9v+pNS4ClYEm2xD5/wJvp1vVdPszZ5Ble4ScZpec/xb0/ucIt3xFwQpA9R/pX7f0pg74Gra1Fu97wxLH9jOFVgnfXU2G3vm3bFl+UXq6q6h0Lyd80CWgchD9Y1FBOX/RkEmR11qLErLBfapBXu4et/5FqnX87jNi1Fb5T4asjT8vaOzQ76aLWVPy+9ujIiDJyqva8vGc+63fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=92mBRqvlhpeuo23ArHea1zS4X3ctykjhk9WZoqzLELA=;
 b=wHKqIymu3vH7PWHRJril6rxssuvNpW8TDcpzN12n0xJcMHBOus6yicb5RWo8aMKREIdhhLOaB7oHIs/XuLNbkDRHnzDrExOPXDKfSHn2+B0TRc46dATmSDhQnAezg35hkN8XRlJRveHW34eqwVfxVekk/x6m2z4GQeJgcVhYCV4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN0PR12MB6174.namprd12.prod.outlook.com (2603:10b6:208:3c5::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Thu, 8 May
 2025 09:54:16 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8678.028; Thu, 8 May 2025
 09:54:16 +0000
Message-ID: <45afaa00-e627-4a8c-b25e-2f74357c3430@amd.com>
Date: Thu, 8 May 2025 11:54:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/nouveau: Check dma_fence in canonical way
To: phasta@kernel.org, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20250424130254.42046-2-phasta@kernel.org>
 <20250424130254.42046-6-phasta@kernel.org>
 <9793bfc7-5309-4e19-a0e4-5e298720aa9e@amd.com>
 <3b64a3e0659dbfa2c5f819f40f9f0624309d24ed.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <3b64a3e0659dbfa2c5f819f40f9f0624309d24ed.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0105.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN0PR12MB6174:EE_
X-MS-Office365-Filtering-Correlation-Id: 262386e1-fe35-443a-b2cf-08dd8e164b2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TVhZTjgrNVBzMU44M2VaUW5HT3hBditPUEs5V2R6SlFuUnVkSGNTWnhpTTdT?=
 =?utf-8?B?dGRneFMrcCtnTEh3MXFEclFqUXUrRk5FR1I0Qlcyc1N4R1VDRUxsWHl4bzNT?=
 =?utf-8?B?NnpHRis0OVhlbkFlSkUzcHNSSVIzOGRmeEVseDNmM1ZBUThhM1h2bHVadkVt?=
 =?utf-8?B?aHk0OGxJOTdKV014a2ZJaGtmU0dCWEZzS2lqYS9MUGxEbktGNnpaL2h4U1pV?=
 =?utf-8?B?eW00UXdaWlFpK3hUaG43WnNTSzVWN0JWSUV5SDBEUytuTnRvZ0ZLV29FbER2?=
 =?utf-8?B?dSszNXg2RzBaWFJMcW03NG9hdk00RDNNbDJYTHBQcE9mQy9Ea2JBNDVidDR1?=
 =?utf-8?B?MUk1SmhrUEMzM0RoTUZUc2JVT0pLdzlaZlRuanNGTlFGczZ6clgzU09LQzk0?=
 =?utf-8?B?cnVKRGNnVFNiVXE3a1BNSGF2dWkyQ3d0U3NqdVcya1hEQnpFS3hIV3kySVli?=
 =?utf-8?B?T2VUbjIwb0dSdjJoT2dWUGk5Y2l4c08zRVFDYTBKMFZzSXpoN3d1QnVlZHcy?=
 =?utf-8?B?ZlZQTngrRmRYNks2MEtvRDVzaVBuUTBNa1YxN09DUVJLZUZZeHVEaU1wdzdj?=
 =?utf-8?B?enZZVlorajEySXBldE1laHZ0MEFGM1UyN3EvUEFsS2grd0hHSVJ5ZWhxaitO?=
 =?utf-8?B?ZlFGeXBiT3BteHluT3VJaW9seDN0aTVzNFlweDB4YjB0QU03NHovMElwcjcy?=
 =?utf-8?B?ZzBQUWoyMGdoNFdMMWlUZGpsVTR6OEcyL0ZPMENEd2hTYnVLWkFBZktuemlE?=
 =?utf-8?B?bXZnZm13OVpJdElHTFY5WUlDTWxrQ0N4T0VyT0dPQUlJVXFqYnFPcXZGeFVm?=
 =?utf-8?B?OTBWM3BuZlVjakFaWk1DN2FqMUtxZ05pbE1qdmpQaVJiNmdKWXVkYllmRXNu?=
 =?utf-8?B?TGF1Mzl6cGUvM01NSkp6c2EzWXdyaXVNZFB2TWhZMUI1ODcvQnQySDdLTDdr?=
 =?utf-8?B?RXJXRGV1T3NXYk9SYnNmdVFlS3VWZWNJUVd5TDUwbUtKQXJDb0IyYUpXYnNZ?=
 =?utf-8?B?UHBieTdUVlZVMWN4dk03YXY5eGd6Z1lwTVF3aWtWMnFmZHl4STJ6SmpqMFI4?=
 =?utf-8?B?a3dxMHZvNzR5U2d4TUk0WTc0STE2S2o4NU92L3JUS25uT3ZxMU9VcGFTRG1G?=
 =?utf-8?B?dVlHcHVNK1Ntb2pWY0JBaGZIRlpyNmxyaitRTDVyd3d0WFpndm1jV0oxWFQv?=
 =?utf-8?B?SDNVU2hvVi82elVzN2pnT3dzNUdGUndhZnJWUGFvQUpOUlIzYWVUNk0yMjly?=
 =?utf-8?B?dDhrZUlrOVZodlF4eHJPb3Bpd0xpOFNVTkxKcW1NQ3NxNkdxWjFNT09TcGlj?=
 =?utf-8?B?T0Z2TWh4TVVEQ3JUVE9DN01OS2xRMHMveUQwMkxha2hPZ3RJUHVEQkR0ZVA1?=
 =?utf-8?B?cVE1ZXptbnRGSkMwOEgrMUxuQ1J5cXMzT1hLUW53cHpxSUlNamtCSlFYYkpX?=
 =?utf-8?B?TnRISTJGZ1ZDRkhuTHI3OS9tMUFWR293aVNjUnJuSGNDSldRdENEL25oZW5v?=
 =?utf-8?B?UHZPc0dBYWRCTk1ObzVxM0RwUjBkQ1I5Zk5lRGZ2Q0tzUGRld1M5RUxPYjVn?=
 =?utf-8?B?VUY5UjBDMUQyNVRtMjdyR2ZMNDFiekpRc0tRTHZ4MGtkUnRXUWh2TWZuMTJh?=
 =?utf-8?B?N0RsVlFzWDhFeDRXSmV4aFdpeDgrd3NMdythSGhUb1oxZThveGppUnVpNzVi?=
 =?utf-8?B?NmFUUzhhOUJuRGVHOHJhYUk1ZGo2QkJLblJYZTNxeXIyYW45bkxSWlZteXlT?=
 =?utf-8?B?U3orYzBISlp2ZzBQekEySExBcjR6R290UklLZU5POWVoMUdVTkMvRjJaTUFx?=
 =?utf-8?B?Sk9zVlREclIwSHM1Y0RLWVF0K2FmM0tTYS9UMlpEL2FTV2oyZFRodmNBWG5D?=
 =?utf-8?B?Q2gzQzVTSStFakhrU0NlNTVCWFgwbHJpS04vamg0UkhwMGJvdU9ZT3U1TWU4?=
 =?utf-8?Q?9tRrdWedwlg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEZpcW00bERsSldMNklQa3pIRzZGeUtsVmpka0hVaEM1UklxUlgzckhHR3RF?=
 =?utf-8?B?TGJFeHJmRmFkdkFJcFZSZkZIZkhrTnQ3N1p5d01YV0gwdDNMa1BzckdrdUpY?=
 =?utf-8?B?Mm1HTUJieGRXU1k5eDN2WkRQZWIzNVp1Y0xadDhHdUwzSnhpVUowWlM5ZVZR?=
 =?utf-8?B?UGtPNzFMV2FUcU9YTHJ3MTJuRFN3dTBvNU44M0pFREVLK2pQNCt0UUdXNElS?=
 =?utf-8?B?cFpaMHYwWkQweDg2bkxweDFmRXNZVG1aTGNDMVRyUFBCKzZaZnhlaS9DZWMx?=
 =?utf-8?B?cUZIaDE0UXIzT3pPdllpaE8vOEl6ekZjTWFEbU1jalVLOUVBV2RNRzJVUko1?=
 =?utf-8?B?Umh2U1BQcjZuM1VtSzJVMUJ0aGJkcnZhaXMzV0hmUTVUcWRsNmsvaTlzN0E4?=
 =?utf-8?B?ZHE4YUhraXVGMHRXdFBXR2w2UEtUZFE0RTRyWGQwdzRrM1FnVnkxT2dtNCsv?=
 =?utf-8?B?aEtKQzI5bURSbGtmNXZWWDdQYUFVVmtPaEYxTUZrQTNaSnRhbTREQVVrUHU4?=
 =?utf-8?B?TkQzRHZtaGd1cE5BeWxhMjlWOERxcE5MMmZLVk5uV29KVGFlN0JuNFN0azN5?=
 =?utf-8?B?RytqR2NmMXpnNkJWNG0xbHl5cU5KUlp1em4ycjdoeGV0QVdtM2dlVWxuaEdt?=
 =?utf-8?B?NWtteWtRWEhpTUx5Vm50RVhreURzTnhrWXdPQmpZdFVINy8zK0FZNUxnZFJT?=
 =?utf-8?B?THM1REtoSDdaTWhzQ0c5WXZNUnF1SjZxejJIYkZNY3dPbjdzS2NyRlJaaWFR?=
 =?utf-8?B?UlF2UWo0YVljRkptVkpJbXo4clBDUXg0RzNlTUJFS3MxWXQvTVF6RE5TYUlq?=
 =?utf-8?B?REFmSWZwNG4xZFF0eFBFSVh0WWtUYjJxVzVkbFFTY1JRaUdSdHJSc0RRVVY4?=
 =?utf-8?B?TXBKMFJBMSs0TXFzVDBaUy9UUzZLTWdMaGJYWmtKQ05udmhLWUpTUjhQT0Fa?=
 =?utf-8?B?MjhmcS9lMXU0bCtSVklsYllSaTNuOUtySGRPQlNTSFJpTlRUbEVzV01PL3Qy?=
 =?utf-8?B?dSt5dUlLYUJqUnJEL2tKaW43ZWJjWDliWFFHQ0xaM3c5N1BwTzNnYlNFSGZt?=
 =?utf-8?B?eUQ1UlZLL0JjWFF2M3gyQmswWUdaMTFCeEQ5dGRrSlU3aUtRUGU4RTBodGcr?=
 =?utf-8?B?aVQvdmgxUmZRRHJ3bitVMDBxYVZadytTS2hCcDZZRUVhWGtIek5DU2IwM3A5?=
 =?utf-8?B?TldYcmF2bDBwQkszaHV4WGJtOWw1VW5ucTJ3ZE5ZQk9IRGpzMlRabDZSSHpP?=
 =?utf-8?B?bkhlZ3R3M0orUm9ZemFRZCttNXY4WWtDOTZsdnRkT3Z4WVFsVk4zRVovRWFX?=
 =?utf-8?B?T09GRVRJSEEyMDg0ekpxbHdMTE1iRENqNTZuMzdLV2pBQURsUG9DdHBzT3lk?=
 =?utf-8?B?VzJxVGs4T0tvdTJZdHp3akxGNTNCa3dtUkJtSFJKYmZYYTNNREV5a0pSS0Fq?=
 =?utf-8?B?eWk4b0l4Q0hSV1d4L25JZjMwNFVJcmkwM05UQ2xVeGJIVHREelpGSnpOVDJo?=
 =?utf-8?B?dzhWYVlOTXYvS2dqaG9ONlc4emJiOWF5WDFES2c2dUtoWU1rK2RPMnNlUWZv?=
 =?utf-8?B?MVplTjZWVmpBOW1uY1kxSmY5SVlhbmV3aGpINTlCQUJXWE9ZblBZa1psTmM0?=
 =?utf-8?B?TFFBN2N3RStMdWpxQlFQNXhEaTFqTGpPU015aUQwR2NSRzE1ZVdBblYvc1NO?=
 =?utf-8?B?bDZ3dXZuOU13KysvaTUyMjArVmxNeEptY2VNK3ZkeVlhSTZPajM4Q3R0Q2Jj?=
 =?utf-8?B?VVNSNFZZcFAxcnZCY1gyem9yNk44Mmh2YkJmTitVL0h6UlpZZHFMNThvZGZ0?=
 =?utf-8?B?LzZMRlhuSXF5VFZ3clIvUklVRzByZExXZlJoZUFtcjQ3Q0tudTRRTzd3RmEr?=
 =?utf-8?B?TGRwZ3hNSkc1aGhDT0E1aWZPRmMyMkVna2ZYc3R2OEx1NU1GU29kYzYyZEY2?=
 =?utf-8?B?Nmc5eGVGeFByQUpKclhBY0U5TnA2TWNxN0xFUTJHSXBCNFYrZVZwS1NQeHRv?=
 =?utf-8?B?YkpRODlmVWJPRHo0cExKYWlUdlFnODU4dDlsMHlPemdRbEczcXNMY1lpSm9J?=
 =?utf-8?B?SjhtWWlKK2d0UCtZdFNPc0hTQWNjdlIxWmo3VUNUNVQvTUJSMW1KY1VqSE9y?=
 =?utf-8?Q?e2nLh9X4qEYmKfa3+Coqme5o3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 262386e1-fe35-443a-b2cf-08dd8e164b2d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 09:54:16.0606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QVOzpAyExZLylU7p7xv/hm5IS+2qA8xpeIzKWOgpUSIIJpUcxrrFwXpbqHiME0/m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6174
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

On 5/8/25 11:13, Philipp Stanner wrote:
> On Mon, 2025-04-28 at 16:45 +0200, Christian König wrote:
>> On 4/24/25 15:02, Philipp Stanner wrote:
>>> In nouveau_fence_done(), a fence is checked for being signaled by
>>> manually evaluating the base fence's bits. This can be done in a
>>> canonical manner through dma_fence_is_signaled().
>>>
>>> Replace the bit-check with dma_fence_is_signaled().
>>>
>>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
>>
>>
>> I think the bit check was used here as fast path optimization because
>> we later call dma_fence_is_signaled() anyway.
> 
> That fast path optimization effectively saves one JMP instruction to
> the function.


What I meant was that we might completely drop that optimization. It looks like overkill and potentially hides bugs.

Regards,
Christian.

> 
> I'm increasingly of the opinion that we shall work towards all DRM
> users only ever using infrastructure through officially documented API
> functions, without touching internal data structures.
> 
>> Feel free to add my acked-by, but honestly what nouveau does here
>> looks rather suspicious to me.
> 
> :)
> 
> 
> P.
> 
>>
>> Regards,
>> Christian.
>>
>>> ---
>>>  drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c
>>> b/drivers/gpu/drm/nouveau/nouveau_fence.c
>>> index fb9811938c82..d5654e26d5bc 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
>>> @@ -253,7 +253,7 @@ nouveau_fence_done(struct nouveau_fence *fence)
>>>  	struct nouveau_channel *chan;
>>>  	unsigned long flags;
>>>  
>>> -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence-
>>>> base.flags))
>>> +	if (dma_fence_is_signaled(&fence->base))
>>>  		return true;
>>>  
>>>  	spin_lock_irqsave(&fctx->lock, flags);
>>
> 

