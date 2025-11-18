Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3742C69F5D
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 15:29:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F9A510E198;
	Tue, 18 Nov 2025 14:29:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="u0jgcqKe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010055.outbound.protection.outlook.com
 [40.93.198.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D64610E198;
 Tue, 18 Nov 2025 14:29:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QsC8b72k2WvNvGvRWlkV+Jsek6pqJfmOcwyMLHkaCM7VOZgEeOMhXS7OFQ1C452gIiT+7mteGdwnuQk+cpEXr5Ok01lVyRXk0apB4/bkLetLRU1zkIA6U1ck8UO2715dNZGSBua7I5cX9Sx5X6y1PiDFCJb6KKPiIsHuG/rGErOOsEGWGQOcYzt3KxkFxD4aETrfq0ylapqTbZ7C/QnkPAeom5vCATElfn4THAsrdGadYmSJmKiqIvQdGnf1Uujrtj9X7Im/ERq40vH7Mzd+ZBZL0Jt9AjRQQkRtNZeF3nmInm/VLm84rGGSuS3WYGAXpDujJ1jysecr4xslRcPc2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rGHQVJHoh0CK+KqXKMaVOPz6Zbb8GBplr9/GeVNEJwQ=;
 b=AJ3D3qilO1VTFYOiDAch3Z2S5OVsHZ7LFoWHMBFhPOT6mnP7Zm/u0QKFClEwoPkZClzmT7AjvrkT0N4J0MhYiMwJdGH4b1bR9zgvxG9cJfs9QZfSMgbuVI9B96S1pouA/2ZLtMPQ+UAb3ajok4KUUvakeA747Ak6NhDOqt0i7wFyaPESD1Gpm2jS9PYHJlhKNdYnn/0EvbIrhGMgzXKz6rtxdKQIBko4Rmb1NCc9F/32cYWidcUUWHi/5mXLzfmtQroDkI2aiIuNaI1nYWcV/gIwEzZ9x/V873TSTQ49BH7XKNKEChEt2QZ9fzfNsCt7m1PqN63Iq3EMp3QpUg2DKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rGHQVJHoh0CK+KqXKMaVOPz6Zbb8GBplr9/GeVNEJwQ=;
 b=u0jgcqKe0CaMyBr8Jx666ZGk2CO23ZqZGYHbdfOAPpjuV9TTqnf7PjP5bVMX7qU/rcAXKbRIUtBFCRHYFyWkFV2ogZj86IDufOI83vySAOFkaGJcCHZ/nm7ogNG7D9BmaEMN6nxsnUbC561bvNQaEHCC8VC64teAtC+MHZfbGNA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB5981.namprd12.prod.outlook.com (2603:10b6:8:7c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 14:28:55 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 14:28:54 +0000
Message-ID: <35d7ab6c-bd4d-4267-8ae1-2637d6c0f1ff@amd.com>
Date: Tue, 18 Nov 2025 15:28:49 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/18] dma-buf: protected fence ops by RCU v3
To: Tvrtko Ursulin <tursulin@ursulin.net>, phasta@mailbox.org,
 alexdeucher@gmail.com, simona.vetter@ffwll.ch, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org
References: <20251113145332.16805-1-christian.koenig@amd.com>
 <20251113145332.16805-3-christian.koenig@amd.com>
 <ef0f9459-6733-4e0a-9c06-c36c02e5a93c@ursulin.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ef0f9459-6733-4e0a-9c06-c36c02e5a93c@ursulin.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0185.namprd03.prod.outlook.com
 (2603:10b6:408:f9::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB5981:EE_
X-MS-Office365-Filtering-Correlation-Id: a0e54f02-d936-455c-f1a0-08de26aecd36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NjEyYmlnYjY2YkhpemtjMXNzQUZGRWNqL1I3cXBHUmtDTFZEY1o1VFZOdjY5?=
 =?utf-8?B?RmZhK0cyZjFVNDlYQmNmQ3VZazlpQi8rTWxabHA4WnVlZng4QVhXazdRalEr?=
 =?utf-8?B?c3U4Q082U3BZT0IzVUxhQk1TLzdwRUg2a2hzc1EwNmd5RGkvUmQyMVNrT1JR?=
 =?utf-8?B?UUNGb2Jpa0F6aTFFRU03bUd0YkQ3MzhJRDUxTWZhUFB3MDlnWWtlRDBHUVdk?=
 =?utf-8?B?N3l1c0J4WlhXRXc2ZlVLbTE1RjRyWlVIYThKVFg4VGJ2cUpBTytoUnZLTnR6?=
 =?utf-8?B?aVV4SzUyZGh2QkxKQjVDTnZRdVpkK3YxbU5BL3Ywci9TNmZNR21TRFhtTWd2?=
 =?utf-8?B?MjY3TXg4SnhiTHNjSC96eVluVHJqMi96dmF0SU1HSCtVemlQdkF6MFhoOGhG?=
 =?utf-8?B?MUVFb3VSRkpkNURZaW9iLzgvRlE1TzA1UVFuTDRwNWRhVDUxUWlQQis2cTBM?=
 =?utf-8?B?a1F6Z255NmVaeCthMmFMblIwN3JUeXV1QmNocjVYUHZhMHd5dkdLTGN1L3hI?=
 =?utf-8?B?eGlldng5ZVpsUkkwZWVobDY1YXYwY2pZcmhSS21vWVZvelpNektxTitVU0JE?=
 =?utf-8?B?TWx1R3J4bGFJT2h2SitzUWNXU2labW1sc0dHaWFqZW1Sd2U4YmhXazRMckVw?=
 =?utf-8?B?Z2pjWmJKN1JkMUdDSWgrNS9qdTZzVHZqMHdXd081TkZtT21LSGcrczhrTFFy?=
 =?utf-8?B?a3NXdGd5a2JoWlJkWEIwbjROL2NZSGUzckJEN1BXd1pHdFE1Y1U4Qk5GZWdE?=
 =?utf-8?B?a2hwbVc0T2RqV21HSHd5UUxBSk8zSUIyUFVwaURPd3FHSGYva3ZoR1pXYnU5?=
 =?utf-8?B?RkVnazNYV2hMMlowM1JWdXU1dm9TN2tqcWl2ZEs1M01jWXFCR1kvMEhaS3JT?=
 =?utf-8?B?cW41azBsMWU0YjdBc0Y0Qzd4Wk9BRjRjVVN6dDh2ZTEyenVMbndwNHAzQW5V?=
 =?utf-8?B?WE9VM3VRV29aNDRLTy92Uy96bklObFJBQ2w5c1NyR1NjUElyZmNJS3V4ZHNm?=
 =?utf-8?B?UWhYRUpReUtuaTM0STMwNEk0N1p3NFNzcnZBS2x1UzNsbi9IQnFoRjUycUdV?=
 =?utf-8?B?Q2k2UFVLUWNDZStENXhLU2ZQTHhoVGR1eVBEdjBQdXh6a0JIUGNYMDhzeVhP?=
 =?utf-8?B?RnBPR2R3MnB2Y2VTK2tMZE9mUmJuUTNpNHFSdGdNQnM5ZmhPUURueWViWEE2?=
 =?utf-8?B?Zm5BRHU4NkNDNHNxNzEvcS9LQmhKNUx6UnA3dGFGY1BWYnVvVHUySE53N0RP?=
 =?utf-8?B?aHp6U2VQanVzcmtyOHg1OGxWVHdIYWNuYzNxV2ZiWUx4SFJ5RVMrZ1QxdVZx?=
 =?utf-8?B?elhVZnY3eEhLdnM3L3p0S2Zvd0I0VUhDUGo0L1VUeThMU0V3MG91NTA1QmhF?=
 =?utf-8?B?ZFFkOXZkNi8wckpQcDZ3REEvOW9xZ1oyR2FDK0tDendxc2xoQ2IvUEhteEdk?=
 =?utf-8?B?QjcvZXhIRFQrdW1zOVNPeXRneWMvT01Ta3FrOHNoZXIyVEx4TmZaemRFZmli?=
 =?utf-8?B?cktvR2NnM1B6TFZHdzRIMGxacFl3QmhQWDNHS3NZajNKMjkrNlE2WDVrUGJl?=
 =?utf-8?B?TGtBclZ1cEp3cXE3MFZNOFkyL2YrZzc3WFVDNk5LVFFPRkkrUWFGaWlTeFp4?=
 =?utf-8?B?UmRzVkthRVo1MkRMWmJDN3BVMXZKYUJrVmJXc3hCUVgrcndnTDNla2xtVnVh?=
 =?utf-8?B?bXhOSWtxSDRJNnNrZitpdXBodUJ3djRpQ2VjdmZZR3JhRWF2a2g1cG1kdDIy?=
 =?utf-8?B?blNkMVZrLy9TZ2NPQ3IrMllYdWFNQlF1aXFtRk14WFNmYzU0NS9tVlpldkJM?=
 =?utf-8?B?UUphZXorVjFVSDVuUzQ2OGJXQ2lvRURhbDJ1QXNHajk0SDZsNWlINndwM2w3?=
 =?utf-8?B?T0FPQVMxUkRoK2pWRnFOc0ZlaWdaK2syMnRHYmZVUDVUVFNIazloa1V2Zk9B?=
 =?utf-8?Q?1soOMMJY78yv4ThtI0iqxRWVDKzkNY5i?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDJ1djZnaCt2SFZkVk96NDJtRWNzSEFGamlZMFZiV0k0ZFlnbG5kRzEyeHkx?=
 =?utf-8?B?Z2NhZmtRYWt0eTVOaVh2dWRZUGhDUGJyUTFiN3RyWkZPQitLM2dNYVhUMHJh?=
 =?utf-8?B?NktySXY2TkorVTE3RGsrZGdjdkpncFVoRkZ5a0h2b0lwVVh1ZFF5N3ZGamFa?=
 =?utf-8?B?VjV4Wm5rd01XRElqSjNMRHpTaVpCbnc2dEpWZkVBeGk3d1dCMFlUZnkydFVN?=
 =?utf-8?B?MEd6ZTU4OHpQY1E4Mmd0SHUyMk4wdjJMOEhuVG9PbVc5amM3bEJmam94MTJn?=
 =?utf-8?B?a043UkRKZ2hnTVkvOE45RkhTZjA1SFNkdFQ4eWhiSXdpVUpOTXBiRzVWQTNH?=
 =?utf-8?B?Z25wanYzUUc4alB6M3Zab0NHenNadFdNKy8rL1lseU1nbzAvSlVyTWQ2by9B?=
 =?utf-8?B?dURQRjlEQ3MvdlJwanNVaHZ5aUwvS2xuNnVDenFKZExvY2E2K1pzMmI0eWQ5?=
 =?utf-8?B?TGpqY0hITGlOTUNMaHVqUXRac2FJeHhreHkzamZ0ZFg3N1BZZEFrL0hvdFIy?=
 =?utf-8?B?NXdLQXkrOFdlTWFVUXNKYVU2WG1zVG9obkJST0NGTEtsZlBZVDd2c29QYk9C?=
 =?utf-8?B?R2FRbTVXR0N1NHVMaWxoYzRWbytiWk1kYmE4T2ZteUFRMFhrNzJYT1YzbVZk?=
 =?utf-8?B?RWtyRnlZek9IRTRLMUNhQTRrUXJIOTFINk9LQ3krM2VJZTRvbGlBWG12eDlP?=
 =?utf-8?B?RmZiVTBzc01MV2wyako5TG16LzhtcDM4czR0a1ZURjV6d21vWTQwVHp2cC9R?=
 =?utf-8?B?UCtLTVNhc2RKL2swWVNXM20xUm9vZkNhbzNqMGRjeEhpTkNQV2hTd09OSW1n?=
 =?utf-8?B?bnFaWU9laGdIajdWTUgvNk5yWkJyZkJVeG5ucHc4N1FtZFJTNGMzc1NlWnoz?=
 =?utf-8?B?aDNGK2dBM3dHQ2RxSXliM0xKbURETVBvK2R0UjBpOW1qeWpoR2FCd2s5K3NN?=
 =?utf-8?B?RnEzckNKQ3A0cWNuZW5NVUZXRUlLN1pMQnpObk9lQ0xLaTNPNkhZeE9HZ05P?=
 =?utf-8?B?YkdnSHhaZHdocXRacGtqRVpObTJpNG95clg2OXZxZTY5d2dkQ0hMNHVQYWZx?=
 =?utf-8?B?MmdpMHBXQlhuRHJzWUJ4QTFHZDJkK2FXYVJjZ0d3elpaTlgyNXRyM0lFWnMw?=
 =?utf-8?B?aWRvQWpnTXowVm0raWFHNGIrTUdHV2dzNHZVcEh0RFFqeElIL3hKN0s3TFpZ?=
 =?utf-8?B?VER2SVNNTlJYeVpOdlYzWkNPeFRCZmpCVUFoWEc3NkJ4WFNxQ1dOcGJhRUcx?=
 =?utf-8?B?V1F4eE8yK2VWQUxtMUo4ZjIyY0xSRkVBdzRRQXFNZmxjdjhFVzdwb1Jic1NF?=
 =?utf-8?B?K0VJbzFudUVXcnNFU2NaczdsOHFRb3hGYnFCVmM3UFA0bVFJZThobkp1ekpt?=
 =?utf-8?B?WU1kaWJkWmhnUWpCZDNJYmJTYUdYSWlIaldBK1FIUnFNY2YzdkJQVjFDVXhi?=
 =?utf-8?B?T2VkMTRpZ1E5bEZKSzlKMnQrU0NPVmVKUnl0RUorMzljTm1JbDNIQml0aEls?=
 =?utf-8?B?S3BYOW5maGxydjY1dzM4ZEJlTnBjWDMwUzNlcVJROVY5dW5rZURtdUc1a085?=
 =?utf-8?B?akdVWEhQR0dhcFVjZTRQUkwvYW9HSW5QbWtFQXRPR2dQeGF0bE8ybEM5aThq?=
 =?utf-8?B?VUNMUEtPM3llMnpqQnVUVUhBU2hsTm4yNklnS0NqR250ZmRQNnRUTDB1ZUIr?=
 =?utf-8?B?bUNGZUZmWk9pM0ZHSll0c2d5OEhMeS9HMVd2eEhtMFMwSzEvYkdvUkJPa3Nq?=
 =?utf-8?B?T1lDM3hIWmZDaFlLcG1zZWlCTnUyWlBwc1JWVnVtdnJUTk1iVnZiaFp1VmlJ?=
 =?utf-8?B?dE8yanFraGhrRy9vMVMraksvOFNPUEJVUFdRUHZ4LzBJcWo0d1ZBaWdraC9D?=
 =?utf-8?B?dXBkaGgxamtPZkZld0JWVFN3YXpyTEtCbEpSbXRFUXFWb2F3ZmhZVmdSbDlO?=
 =?utf-8?B?ODZNTkx1V3FDRmxlMmc3dkF5dldlWUFieEtqZkpFVnRKWmJXT0RoaWo2alU3?=
 =?utf-8?B?Rzh1QitkZXVFQmpUT3JDMzZpT1QrNFRZUys4Zjl3cWl3Z3B3SXNYaHFEdzZu?=
 =?utf-8?B?SFQ0NDZBeklkbi9NUG0yZzV2QVpnZ2Z0MklOS3k5dlVMNU16ZWhuNndqMWtC?=
 =?utf-8?Q?mc+I=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0e54f02-d936-455c-f1a0-08de26aecd36
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 14:28:54.6383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KRQPFF/vPP12WMmcqeC6qvSgQWZ2tmJkNaxtcoKVHnVE+n41swBiNgBJaF2w008z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5981
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

On 11/14/25 11:50, Tvrtko Ursulin wrote:
>> @@ -569,12 +577,12 @@ void dma_fence_release(struct kref *kref)
>>           spin_unlock_irqrestore(fence->lock, flags);
>>       }
>>   -    rcu_read_unlock();
>> -
>> -    if (fence->ops->release)
>> -        fence->ops->release(fence);
>> +    ops = rcu_dereference(fence->ops);
>> +    if (ops->release)
>> +        ops->release(fence);
>>       else
>>           dma_fence_free(fence);
>> +    rcu_read_unlock();
> 
> Risk being a spin lock in the release callback will trigger a warning on PREEMPT_RT. But at least the current code base does not have anything like that AFAICS so I guess it is okay.

I don't think that this is a problem. When PREEMPT_RT is enabled both RCU and spinlocks become preemptible.

So as far as I know it is perfectly valid to grab a spinlock under an rcu read side critical section.

>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>> index 64639e104110..77f07735f556 100644
>> --- a/include/linux/dma-fence.h
>> +++ b/include/linux/dma-fence.h
>> @@ -66,7 +66,7 @@ struct seq_file;
>>    */
>>   struct dma_fence {
>>       spinlock_t *lock;
>> -    const struct dma_fence_ops *ops;
>> +    const struct dma_fence_ops __rcu *ops;
>>       /*
>>        * We clear the callback list on kref_put so that by the time we
>>        * release the fence it is unused. No one should be adding to the
>> @@ -218,6 +218,10 @@ struct dma_fence_ops {
>>        * timed out. Can also return other error values on custom implementations,
>>        * which should be treated as if the fence is signaled. For example a hardware
>>        * lockup could be reported like that.
>> +     *
>> +     * Implementing this callback prevents the BO from detaching after
> 
> s/BO/fence/
> 
>> +     * signaling and so it is mandatory for the module providing the
>> +     * dma_fence_ops to stay loaded as long as the dma_fence exists.
>>        */
>>       signed long (*wait)(struct dma_fence *fence,
>>                   bool intr, signed long timeout);
>> @@ -229,6 +233,13 @@ struct dma_fence_ops {
>>        * Can be called from irq context.  This callback is optional. If it is
>>        * NULL, then dma_fence_free() is instead called as the default
>>        * implementation.
>> +     *
>> +     * Implementing this callback prevents the BO from detaching after
> 
> Ditto.

Both fixed, thanks.

> 
>> +     * signaling and so it is mandatory for the module providing the
>> +     * dma_fence_ops to stay loaded as long as the dma_fence exists.
>> +     *
>> +     * If the callback is implemented the memory backing the dma_fence
>> +     * object must be freed RCU safe.
>>        */
>>       void (*release)(struct dma_fence *fence);
>>   @@ -418,13 +429,19 @@ const char __rcu *dma_fence_timeline_name(struct dma_fence *fence);
>>   static inline bool
>>   dma_fence_is_signaled_locked(struct dma_fence *fence)
>>   {
>> +    const struct dma_fence_ops *ops;
>> +
>>       if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>>           return true;
>>   -    if (fence->ops->signaled && fence->ops->signaled(fence)) {
>> +    rcu_read_lock();
>> +    ops = rcu_dereference(fence->ops);
>> +    if (ops->signaled && ops->signaled(fence)) {
>> +        rcu_read_unlock();
>>           dma_fence_signal_locked(fence);
>>           return true;
>>       }
>> +    rcu_read_unlock();
>>         return false;
>>   }
>> @@ -448,13 +465,19 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
>>   static inline bool
>>   dma_fence_is_signaled(struct dma_fence *fence)
>>   {
>> +    const struct dma_fence_ops *ops;
>> +
>>       if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>>           return true;
>>   -    if (fence->ops->signaled && fence->ops->signaled(fence)) {
>> +    rcu_read_lock();
>> +    ops = rcu_dereference(fence->ops);
>> +    if (ops->signaled && ops->signaled(fence)) {
>> +        rcu_read_unlock();
> 
> With the unlocked version two threads could race and one could make the fence->lock go away just around here, before the dma_fence_signal below will take it. It seems it is only safe to rcu_read_unlock before signaling if using the embedded fence (later in the series). Can you think of a downside to holding the rcu read lock to after signaling? that would make it safe I think.

Well it's good to talk about it but I think that it is not necessary to protect the lock in this particular case.

See the RCU protection is only for the fence->ops pointer, but the lock can be taken way after the fence is already signaled.

That's why I came up with the patch to move the lock into the fence in the first place.

Regards,
Christian.

> 
> Regards,
> 
> Tvrtko
> 
>>           dma_fence_signal(fence);
>>           return true;
>>       }
>> +    rcu_read_unlock();
>>         return false;
>>   }
> 

