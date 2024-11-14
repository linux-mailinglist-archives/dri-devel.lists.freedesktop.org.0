Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0729C8551
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 09:54:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D36F810E7B4;
	Thu, 14 Nov 2024 08:53:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FQIbcH4G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2050.outbound.protection.outlook.com [40.107.220.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAAE010E7B4
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 08:53:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NrKKqjSsyZwK/KI1yvdgGSmHz9FEgOWEcMhgAGW7YtmIh1cTnB5/qFpYwCPwWXHQbOugBsnKJfv5AgN7TwvjTTFAoFHXVYU76KfTO9NLquP9erP7MtM+pCz5lWhhacc1M9+Xk1k6tC21/UIrb9MVVu9bCnqJFu7o+xBZ26Eobd91A+bLd1tZw9zLgUwKO2ZNG9GXrTB+iSqnVSy8eJXaC4QBhNCGU/IIhrLx8zorb5iiMyys0MR5fk+uODHbFnOHmx4sM7VO5WHSDKYWjVQNcG012ncxB+49NiIt2FeZvDGthKAhz/UBpW68A598K047FNmveUMH97pf5/ydbH5tYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B82zZ1aCcz03jwV9rncDkcLg5tLAvClOLj43oQBI1HU=;
 b=uGRCpU613/rg/xiUHtuyci9n3XipOVxhIz6vhkN3jHJb/1ck0eLW7Pm6bmTvtk5bMW6j9hSYTEbC0uv4Ufu2vkDq8MrRk9bkdpdcSQN3ecaHh9gsXNOwDT+CgPsqD9BzZWYZAhVBWqlztrY6moNCTM6Dq1k3x6xO6yhUgY9AXEDTdKjcb+VKjx7ttQ0lRLA2JdHcYDl105Sk6ncEvjb3XjHxX/c0NsDYepePVgDEhxCGX33iGzryiRl910ZejaslyNtd3i8xMo4G3eWOAw9hN36skkANhG7V2flXb2Zj7VEWLce+OE7G2tlr6t0Zx2Md1vTbQuqUq66H8J4AYlbyog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B82zZ1aCcz03jwV9rncDkcLg5tLAvClOLj43oQBI1HU=;
 b=FQIbcH4GVX2zkPfzdaAiRqikHCtgOOG6bUUjVTrjBZhZxBhSvrdu2dkXes4CKQ2up7Dh9ZYWAfovNfSx95c8NUrW5R/b8PJcwkUPTCJOog5OEDyfY40Zk/SgPsZhJU2yNgqP1LDB5eSovEGTzd0fK9RhXvbgXujSe5eKX60u6b0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB7151.namprd12.prod.outlook.com (2603:10b6:806:2b1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Thu, 14 Nov
 2024 08:53:56 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8137.027; Thu, 14 Nov 2024
 08:53:56 +0000
Message-ID: <9dbdbf44-3f50-4ccc-807b-0e7010e04cbb@amd.com>
Date: Thu, 14 Nov 2024 09:53:49 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dma-fence: Add a single fence fast path for fence
 merging
To: Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Friedrich Vock <friedrich.vock@gmx.de>
References: <20241113171947.57446-1-tursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241113171947.57446-1-tursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0095.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB7151:EE_
X-MS-Office365-Filtering-Correlation-Id: cbc6ebee-9801-4014-f6d8-08dd0489df40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NURBeHdXVm1qQm11aE1YSy8rcHRHaHpwUVg3QmtUL1hTSU9ZNVhaOFdpRU4z?=
 =?utf-8?B?TUVUWklpU1Nvci9KWHljN0RNWnhOMFU1Q1JjNHdFT0dIdkhaSk1md1h6ZVJF?=
 =?utf-8?B?WW5wWGsvY3FUUTVveXNDak1PSEU5d0p4RS84WjRFcGVVUWZQK1c3Zk9Rc2lG?=
 =?utf-8?B?S0RMdlpURVduTFBOeDdldHFkbHFKUWRpL2F0enV2YjlMbVhFRkhhNVpIU0ZZ?=
 =?utf-8?B?NFVON21yV0RIdEtkYXllUTVFWm5PdXlzQ0ViMHZNTHBiQkFWck02eGw4d2dO?=
 =?utf-8?B?SE44My9YdmJuN3VZV2lIdHhTWldMVWFIWXg0WnI3N2hadGZkRlRySml0bXcr?=
 =?utf-8?B?SGMrdTJieXpkRVE0RWxHUzhTYkhpZjVqK0YrT0pjSklQdUdZNXM3WXUyVkFK?=
 =?utf-8?B?Z1NKK2gyaHBEdWtsZEdJa2ZoVnNHdlRXZ2NjYWVNSTYvRjV0TzcrWTNQNnFP?=
 =?utf-8?B?MCtGTVpSRmxjcWJoNlg0NkU2WlV0dW42cHQyY1Q0eWhrT2tiVm91Y1QwMzFB?=
 =?utf-8?B?bjBqdzFTUTlQaC9QQmc1WnQ0d2lXc0J0Y1VBb3VwdWNkRlFjZmxvSUU2ZVUv?=
 =?utf-8?B?ekhHM243OVptS1MxSUtncU1Mck1TVTVXdFpSVnRsRnFFNTVZVGVnclhhZEtJ?=
 =?utf-8?B?NU5GNUljMm5CbFhZMVVub0JucnRxWFduN1ozaU15YjNNR1RGbVl4SUJMT0c4?=
 =?utf-8?B?YWZ5aEhyUDZjQU00UDAweFhmYm1HMFJqNEdoQ0tSUUJ0amVLRFlLTGo3QjFC?=
 =?utf-8?B?Y1ltcGlha2xwSTJxOUhoSzNHU1R4d0o5aFlISlJ0TWlBZGlDWTVXWW5KZnAx?=
 =?utf-8?B?Wlc0b1dMTDRJZWxxMFhzRHF1VEYvVExiRFNkdHQ5aElWWGZHNzE3ajhqZUNU?=
 =?utf-8?B?YldwTllnWmJiSU5RM2xVY3ZJNFlWWC9NTkR0L0ZNRlgzZ0tEWEZBa1llTHZZ?=
 =?utf-8?B?ZEtmMk9XcUd0b0Y1NjdoQmlJcVZ6ZjE1YVF6RHQrUEdocjlheVI2NE1vQlNi?=
 =?utf-8?B?cXVMMVlYL2x1TElFSmVZVGZMelFhTFAyTm9vY2l1VGlORStSSTRST3U1OS9v?=
 =?utf-8?B?ZVMwVnV2bXUxOUlhMFN2SzNwV09xcEIrRElrSE1BWWxKTXRDMm40N3luZnJY?=
 =?utf-8?B?UWU3MzBXa3FJMlNENFJhYTBNSXgrdzZkcHpyZzQ3ckZVWjhPWkRrZmtlbUVs?=
 =?utf-8?B?allCYi9wUzdOTVhyZWhGYU5sWFZRVi90OXZoV3RDbG5adWJyc0ZmZkVzNksv?=
 =?utf-8?B?Q3JjaTVRSHNPWHJYSkF6K2d3MlllUWVQWUd3K0JDbXpyN1FSYlRWL0lDa0NT?=
 =?utf-8?B?WWswZ04zUmFSSWNoa1U1bGM2RmNxbTZ0OGlmTDRGSC9rK1VlWE5Bc0RINHR5?=
 =?utf-8?B?QWVuUDVaYk82MVBPYXFvSXllYXQxdEt6ejV6REZla3JHWUx4S3ljVzdtd3JJ?=
 =?utf-8?B?R2QxWCtSUVFiYVFwVDFLNm5pekowM3o5SHkzTTZ2NVR0MHk0elBTZTJHUzdl?=
 =?utf-8?B?UHNPZitNdzZsR0xRU0xDRVRhZjVrajg1TmRHTS9rRG5XbmtuRUFUbkRNb2R4?=
 =?utf-8?B?NE9qS2VpTUM3OE9JR1FaclZ1c1hYSFBULzkxNWF0K20xWGN3ODlXMGphV0Vu?=
 =?utf-8?B?Q3ovTmJjQWFuMHlqUDFXSXpuVWp3T2o4VGVWcGxTa1JVcXZkUGR2UFF5bjlC?=
 =?utf-8?B?Z1IxTXNFN0twelpnUUYzeElNMmYxOWJuc2o1N043QUJEV2lJaUYwRlNnZnFS?=
 =?utf-8?Q?Nkn2wxKiTG+Uurrmgz9/Jf7/9VPLGpdCndZzjbd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2ZYY0Vqa2g0ekxKYVNkby8wUXZHSVRFTzNuNTBaT3VuVUI5ZldUcG1yNEln?=
 =?utf-8?B?WXpNeWhjcTlFOVJpU3FvZ3ZRR3U4b2JvRzRPeWxHU1l4Qmt5WGR5NzBIaWxB?=
 =?utf-8?B?bnhTZUhHemoyRGtsS0dOTm8zQXo1dlZPZzB3bllwdlFKSXg5VFR5YXBSc0ZP?=
 =?utf-8?B?RHRwS1g2NFFRYXBkOVhXcG5KZnBlc1YwRXF2cG9zbFI0bTdpdG5jQTNiQkhL?=
 =?utf-8?B?bnF0ejJpU0RwMmt4VDFUSGhzWTUvOUpTMndCZFBmdHdoYUFpZllnWTRKVUgr?=
 =?utf-8?B?L2JjNTNjWjVzZWNQSDdTd2RrUVp6YVhYdlM0bXcrRUNvaFZ3dmRDWnFBSUpS?=
 =?utf-8?B?dXpRSTdWUG5iK2VSSGNPdzFYZStscEh2SU1aRkp1dU1EcU8ycExpNlJ5OU9o?=
 =?utf-8?B?VWhnLzdJRkNkMGlTZFNsSXlmYUVXYm9RaVdVOXd4OHRCVE5ibkFSTVBFSzJk?=
 =?utf-8?B?WGROd0hZRWlTQTRYZGFwd2k2c2xVSk1ZbkhwUmdaQ09oOGlWTkNiVW5Bb3Nv?=
 =?utf-8?B?ek5lU1drOHFlZVI2cy9saElJb3QxVWwzZ0hjb0xHVFFDaitTK1RhVkRFRnVS?=
 =?utf-8?B?NEFIekNQcUJPZldHWDB3dXJRSnNUSWdMcHBnOUZleFkvazBySFEwTDFSWVI4?=
 =?utf-8?B?WllTRE01cUZRT2NHTms4YTA1ek90bkZrRTlKbkpZemkxWWNpU3RURCs3VVpZ?=
 =?utf-8?B?Y2t3VXRxVHhkQjdhbHZzblJ1ZUlCV0RraVVlTDJhdll1dXBkbVlSZE53Y2g2?=
 =?utf-8?B?R3MxdVBVTnU3WHMyK2N3UGMwOUJIR0NSUVpMRnVhY093SVV4NndDdE9qeG5i?=
 =?utf-8?B?Umo2R051WFNKdHIvYy85M0RTdGg3R0Z3aEsyMS81eklobHMrRVgrNFZCZWpu?=
 =?utf-8?B?a014WUdyby9rTWU3K2JHbVRkN09WcWN5Mkkvem9XVExscmt4eWpic0t3ZVlS?=
 =?utf-8?B?RWZOaDZFcUQ2MjJUMkpFdWRKNkdzZXU0NTZLZVc2cDBwc2gxemluMndTemNG?=
 =?utf-8?B?ZGFxZ2UzM0JVMGc0cEd6OUF0WHV0NzhFTGp0ZHNsV3p6WmN5U25IbVJBSWtQ?=
 =?utf-8?B?RFluaHp5UUpQaFg2SjFRdG1kT1h3aE80am5sTW91L0F3c3BNSVlGOURpL1FG?=
 =?utf-8?B?aWdxekZHSXhtV3QwWmdkc29xR09SakFQeFJIVG5rN2RweXNSTFRHZG82eWZJ?=
 =?utf-8?B?a0VmNzg3L1NvVG0ySERndEUzOTBqVUpOaXdrYi9KNnAwQkRVcDg0TDRiWHJi?=
 =?utf-8?B?RC9tUzRFMW9udkxJUXpUaTZEbzdIalg0bWpwQ2FUdzFPU0JZaWRzQUcvd0hz?=
 =?utf-8?B?S0MyeDNjcVZwbkt2WFFETURrRWZQNE4yWkVGZWU4M2JjUzhxdE05dDdCbDl0?=
 =?utf-8?B?aklkdG8rVzQzbWVDbDc0Tk81TU9mMGFSTVNMdzFOejF2WloyU0t4UDdlKzNV?=
 =?utf-8?B?SHVrbVl6MlppZllJWWtqcjZ5M090UTRlU0owaDFxMlA0WjJqMlY3d0M0YlNi?=
 =?utf-8?B?Mm5IY1M5MUsxbytHNHJ5M0RDZUkrY0xMMzZjNFd6R2JWdXR4NEc2cmsyZnQ3?=
 =?utf-8?B?VFRXdndHUTBSNmFyTjRDZGxTNDVQNDI3eVRxZ0lJalU2V0VsamhHZEYrZlF4?=
 =?utf-8?B?L21SQ3JOcEdmVDNBK1lkSTd3Wit0TUpUeUFDWUZxbm0yNUZVWldLY2NDekFn?=
 =?utf-8?B?dWVJRFhJVjMxa2NqUE5lc096enhiQVEraXlRQ0xoSmRmZmlZTTQ4RWEweERx?=
 =?utf-8?B?bGRzSGx1M3IxVjI0Tkw1VVQvdkNjaTN3ZWM5cXJvbll5ZnFzUENOUE5KK1Ex?=
 =?utf-8?B?NXRTQ1Z4clRRVTk0NXU4eHMvMGR1L0IyNEhQVDVhbFo3aEVlUWRPczJmaFdq?=
 =?utf-8?B?Z3JFd01DSHlxa2ZxSFRTTlYvU3JIaXZpWlUvQTl0R3pIZmF4TnFscTZyZjNT?=
 =?utf-8?B?Y1dhVS9Zb2RPbiszUzNteXlVWko5TXJJWHJ3Q0hzTFUrWXVQRFJ1d1NTZDdL?=
 =?utf-8?B?WjNnaStZMWtncWZvVGs4bWtQRW5KdWV1Wm8wNk5qUDJLZ3dTTlBRTkMrS1B4?=
 =?utf-8?B?cWE0SmxsWGVWTENSODFiU2RsdFpLSG9CY3IwUFN3S1p5VHZZNk9BWGtlWUJC?=
 =?utf-8?Q?DL2+y/1O/n4rexj6SzMlJtK+q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbc6ebee-9801-4014-f6d8-08dd0489df40
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 08:53:55.9982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x+wYH70f7Y3t76Ps30X0nV3K3/wHsGLmKm9c9H7IAOXtqc/Po+6H6GyS6QF5fkt8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7151
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

Am 13.11.24 um 18:19 schrieb Tvrtko Ursulin:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>
> Testing some workloads in two different scenarios, such as games running
> under Gamescope on a Steam Deck, or vkcube under a Plasma desktop, shows
> that in a significant portion of calls the dma_fence_unwrap_merge helper
> is called with just a single unsignalled fence.
>
> Therefore it is worthile to add a fast path for that case and so bypass
> the memory allocation and insertion sort attempts.

You should probably re-order the patches since we need to backport the 
second as bug fix while the first is just an improvement.

There is also a bug in this patch which needs to be fixed.

> Tested scenarios:
>
> 1) Hogwarts Legacy under Gamescope
>
> 450 calls per second to __dma_fence_unwrap_merge.
>
> Percentages per number of fences buckets, before and after checking for
> signalled status, sorting and flattening:
>
>     N       Before      After
>     0       0.85%
>     1      69.80%        ->   The new fast path.
>    2-9     29.36%        9%   (Ie. 91% of this bucket flattened to 1 fence)
>   10-19
>   20-40
>    50+
>
> 2) Cyberpunk 2077 under Gamescope
>
> 1050 calls per second.
>
>     N       Before      After
>     0       0.71%
>     1      52.53%        ->    The new fast path.
>    2-9     44.38%      50.60%  (Ie. half resolved to a single fence)
>   10-19     2.34%
>   20-40     0.06%
>    50+
>
> 3) vkcube under Plasma
>
> 90 calls per second.
>
>     N       Before      After
>     0
>     1
>    2-9      100%         0%   (Ie. all resolved to a single fence)
>   10-19
>   20-40
>    50+
>
> In the case of vkcube all invocations in the 2-9 bucket were actually
> just two input fences.

Nice to have some numbers at hand.

>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Friedrich Vock <friedrich.vock@gmx.de>
> ---
>   drivers/dma-buf/dma-fence-unwrap.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
> index 628af51c81af..75c3e37fd617 100644
> --- a/drivers/dma-buf/dma-fence-unwrap.c
> +++ b/drivers/dma-buf/dma-fence-unwrap.c
> @@ -64,8 +64,8 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
>   					   struct dma_fence **fences,
>   					   struct dma_fence_unwrap *iter)
>   {
> +	struct dma_fence *tmp, *signaled, **array;

I would name that unsignaled instead.

>   	struct dma_fence_array *result;
> -	struct dma_fence *tmp, **array;
>   	ktime_t timestamp;
>   	unsigned int i;
>   	size_t count;
> @@ -75,6 +75,7 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
>   	for (i = 0; i < num_fences; ++i) {
>   		dma_fence_unwrap_for_each(tmp, &iter[i], fences[i]) {
>   			if (!dma_fence_is_signaled(tmp)) {
> +				signaled = tmp;

You need to grab a reference to tmp here if you want to keep it.

It's perfectly possible that tmp is garbage collected as soon as you go 
to the next iteration or leave the loop.

Regards,
Christian.

>   				++count;
>   			} else {
>   				ktime_t t = dma_fence_timestamp(tmp);
> @@ -88,9 +89,14 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
>   	/*
>   	 * If we couldn't find a pending fence just return a private signaled
>   	 * fence with the timestamp of the last signaled one.
> +	 *
> +	 * Or if there was a single unsignaled fence left we can return it
> +	 * directly and early since that is a major path on many workloads.
>   	 */
>   	if (count == 0)
>   		return dma_fence_allocate_private_stub(timestamp);
> +	else if (count == 1)
> +		return dma_fence_get(signaled);
>   
>   	array = kmalloc_array(count, sizeof(*array), GFP_KERNEL);
>   	if (!array)

