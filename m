Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B06DCB9309
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 16:50:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D35310E8CF;
	Fri, 12 Dec 2025 15:50:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yMV2TxFj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010057.outbound.protection.outlook.com [52.101.201.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABC4110E8CF
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 15:50:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w/DNg3qw3erx8PHgePv1FeWdczEO3BXuSI/xycEXUsySF88SxOsdu77XpCIcf5gNaHT9Ckb6ymK77QtjcoWuYXNkhdaFm4Ta8pe+m8NwJy42TA9VyD/RTE0Xsaw0Uoc/8Ke/WbaQdZFmMg/em8VkcvxaNt6LwHlIUqXma2wNIqvDOxT6n/hsJfXoQefiUghq22ehgfpkCnY2mfCo+ynO6qvU12qDvBotAIqhy6pU2UDQbU0udBnRwazom8qBwvoZXf1gm64PjiHAnAe5t1omUpOAayPTq47DJQAa+KfxEPCwTZ65s+EEz5mtTA2cz33RpUnYqP6iMCvqxtBuGl/exQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9JUNAD1Rv5wvgkrbi6bBy8Bm44zKbMiIyjDjJkrBZjo=;
 b=uwQbvgj75/seKXxlEh2/cDXH2/VftBU/VzmFWBPYdQ6IlCHW3GxYXQuq+kRUx6TiJkDJ8VqOuLxl7A1kM98zgiCjYq5yuMwvNY9zEXpzOBCrd52LodjsSiiOVWLuyCu5wxNO1EHOvNxNsvFHuhNZTIL2LQjLtCEtMWDoGaz1rmWGS1PmMx+DGnfp3xxeBOoVIa3j8+w2Zroo0alCAQ4dukdqGg5mb1qL1t8X/7pF4MrbVfhGo9TMTGZsguepUrp9vey+s8sK6mf82xIX7mAcy4ZWDA8uPY2EhWF2VKqNMj+A14aXJl4fW/QTiQtyNRdKHdF9pBjwA36IyeQqqRZPPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9JUNAD1Rv5wvgkrbi6bBy8Bm44zKbMiIyjDjJkrBZjo=;
 b=yMV2TxFj1MEyDpzVLXVI0eRufWzGjtcfBQbj7XoARuxUnF9fPjVMdAuF0sh7qLNIzWEgx954Ee+NN6kyz/GhRUUbrCllsyjzdlaz6NEdrOcsC3ekUA+2fvDiAVjpJyVuhk53MTiIHf3bI6KGo9WacBFLdvuRqc/qIP6VYrBaINs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB8043.namprd12.prod.outlook.com (2603:10b6:8:14d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 15:50:48 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 15:50:48 +0000
Message-ID: <587fb06e-cfac-4603-b074-a9b382ecea31@amd.com>
Date: Fri, 12 Dec 2025 16:50:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/19] drm/sched: use inline locks for the drm-sched-fence
To: Tvrtko Ursulin <tursulin@ursulin.net>, phasta@mailbox.org,
 matthew.brost@intel.com, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20251211122407.1709-1-christian.koenig@amd.com>
 <20251211122407.1709-10-christian.koenig@amd.com>
 <9ef8686f-820f-41e9-985e-40411b4b9bd3@ursulin.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <9ef8686f-820f-41e9-985e-40411b4b9bd3@ursulin.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR04CA0003.namprd04.prod.outlook.com
 (2603:10b6:408:ee::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB8043:EE_
X-MS-Office365-Filtering-Correlation-Id: c40c7016-ff21-4b77-1b1d-08de3996380b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SUp5R1VWYkxURzdEMmZFRUpGTGljYTdxVWhuR0VsZnVDQnR3UVJNTUVta1lM?=
 =?utf-8?B?eHZXd2lMNk9VQUE3a3RkMGRLK1RuamZlUTRJYklhbUQyTHBUT3lWb1hmL2ky?=
 =?utf-8?B?QWlhbU1iQmZ0eStrcUNUYjJaRjNOOXJGWDRWQit5VFBqYzhnMEFDRHBhLzlq?=
 =?utf-8?B?L1d5cnV3VGxuNnFmYmswWnowcllRdWZSa1VXRzlPdTI3aVpCZlB4UzB5MWN5?=
 =?utf-8?B?U3BkQ3kxNFc1UU1FZ0p0ZlFvNXh5WjRUeFBOSGRsV0JxUHVLbU94bWpGR3Nm?=
 =?utf-8?B?MWR5aWJEcENjU1AzQWJrTzJCSml5N2pJbDFvZ1NFQW1hZzVxRjJUZ0E1bnJi?=
 =?utf-8?B?NWkxOWNsMEcyVllxVWsvOVRBcFlLSEk0YnJFSTZVcXdOL0hXN0VhY0QyMUU3?=
 =?utf-8?B?Um9kakVMdFJ1cERDcGFhNmhYRmxUSW9vT1BNeXRpZ3h5QldQbGpGNitaQ2xy?=
 =?utf-8?B?Nys1OUczRWVHbGxMcTZLaXc4YUNVYjN3NW8wMFFKa1loTFBEMEF1WW0vbExU?=
 =?utf-8?B?U2MrOEl3dUZCaWtuMEtXNnVCa29rQmxVdW9zbFMydHFXcmhDRW91OVlad0xm?=
 =?utf-8?B?UTM2NzZIYnNpNElCL3BGOXFnR0hYRHRtQ2V0RzBlWWN1ZGlzM0Njd0EzUXdr?=
 =?utf-8?B?TDMrb2cxN0RiSlRWUy91N3dRSWxSRUh2Y1k1anJlOFBzQktmWGFIaTc1KytF?=
 =?utf-8?B?dTEzVW5IbVNSZDNzUk5DaExIdXFNT1IzaHpzc3JGSzE3bWFpdlpQSS9EOTdQ?=
 =?utf-8?B?QjBXMHMweFFJdlZZbDVObktsYlNFTStCNkUwNnFwK2pYOWRITGZxUlBQVU9D?=
 =?utf-8?B?b0ljL0N0emtlTjFkalhicWxMQnlKQ2JUS3JSLzQ1NXdUU1pNbFViQWpQdWRt?=
 =?utf-8?B?cDYvc1JlVHIrUDBERTd5TllOMERvR3IrWWU2ZFZCb1lVcDhYTEhQR3JTemJR?=
 =?utf-8?B?ZHhHRGptM3Iyc0k1MkR2eG93bUpSZ2Rqc3UyMVhFcmRSSzRJamZRL1VHYUps?=
 =?utf-8?B?NlBxL3BGVXlId29aSS95THJXL2dDWXUvLzdqUEJGTDg1VmRMNnd6YjFkQ2c2?=
 =?utf-8?B?SDVnNGhjbjByNW0vTEZxKzhtQTdRRmxlMkptSFpDVU42a1dkSDFhVFI1amRl?=
 =?utf-8?B?RnRXci85a0hYTWtvR2VOdGNhMkVqeFlHVXcrVytpYUR3cFZNckhPTUlDUWU3?=
 =?utf-8?B?TFBPLzM5M2d0aG9CZUtVQTdaNHNtamNqZ2tEaVdST3JERE1GamhLUHN0THJK?=
 =?utf-8?B?Zjg4c2NueC96dUpFcmlxU0RjYlF0cFBQV3VCaWp1RndYcUgyWFZKZkMvZ0tt?=
 =?utf-8?B?Q1pYRTV1ZENBRXN3WE1SZXFqd3V2VXRRWXQ2WEYrQngvTEdIQVdOVjZWQUhX?=
 =?utf-8?B?WkVWS01IeTV3RGM4RzdMeTlXSVI2RUp4R0ZEcDluRWFqSDZzUXp1NzBXWUZD?=
 =?utf-8?B?UEVpaHJNWFdmRFhPN2p2dlBWNEx6U0V0SjBLamhJV0xac2M5dmdLU1VzNU9X?=
 =?utf-8?B?VklpR082a1hNYWErb29qaWw5c3paUE5YQmlxY0lDSmM0VWhYNFVNSUVQWXZU?=
 =?utf-8?B?SHBWRnlEWVY5OHdYRTR6TUd5QmJvSmhmeit4cHRWVVpBbktXOFV4R3ZHSk02?=
 =?utf-8?B?bk9jckdVTUhmTW5vMjVNQmI0ajFpMjRpenltUmNSMWRrdER3WmZqOC9KZ25v?=
 =?utf-8?B?TjVPcWZNbnFlRHUvZXJXTFJrTEM0bW9EampHNjZxUWpyM0ppM3VsWHBCbU5N?=
 =?utf-8?B?MzdBakppOXFWOXRvREFOY0ZMRUY5eE80amFoS0ZCWVZpdys0YnhsS1NBZ0JO?=
 =?utf-8?B?MmhPOWRueWVyWWJNZGFlM24rdm81RjBGZnorOElPRjV1RVBicUVZSGJMNHd3?=
 =?utf-8?B?eEs0TGExeU5aVEtwbE1SRG41SERWY2hkSmw2Wm0wMmhPc0FDeU1hWWFEOFB5?=
 =?utf-8?Q?nnDEKlZq2SCdCCeO75r24r6TgjNbHOD7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjlDUEJlSVZlWEhIZEpCL1djQ3VWZmRJSTkrRkFXZXJtYklDVGZ4UHZza2ZO?=
 =?utf-8?B?am5lZFcvSlNFeTdYYVl0M1NUTjBCVjZpQTRpZzRONkZTTm9LOUNkcjViN3NW?=
 =?utf-8?B?YkE5K2l1QTU1RCtja2FFLzZYZXVzQmhKVyswLzZVWnhjZm0xNTV3U1VBRXJl?=
 =?utf-8?B?RTF4UlF0NmRDTVdWMDJtUk96SEQ4Q0txTW1UNDlUa2dtMlRhSkhGeUhicUk1?=
 =?utf-8?B?SEZRRzVuQ0NxdkxabG5OcDRQNUFUN3ZzSld2cjROZlhpWnVDSWgvR3YyNlZx?=
 =?utf-8?B?eHhUQmRuYzk0MlAvMnEwVWluT0dZc3ZKY2xaRVpWRjk3bUg3NmtSWE9LWHBw?=
 =?utf-8?B?UzBxbmp5LzZnK2dMazBEQWJBWHhEaFBSbzBYNWorSHdKcm1kK1J6Zk5nUHRz?=
 =?utf-8?B?emcvZmN6c1liYnd5WjFTdStpSGVvd2xXaHc3R2NLOG5SVE90VldVR00rMXZC?=
 =?utf-8?B?c0tuelR1eElxaWQySndkdTgvRjJ4OEJmb1EzNlUyNy90VkZzZERMQXkyWXIz?=
 =?utf-8?B?aEpmNFFiSVlubHhlQ0lEc3A2VEd3SmN2MURHTkY4NjZIOHJBbUMvM3U0WFQ5?=
 =?utf-8?B?bFcyTGNvekVwaGlza1pUR3hTVVVoSlR4c05POUJxWjh0YXp5enU5RkU0aE5m?=
 =?utf-8?B?dENyVnZNcW52NDNidGxodDFWcTJ5MUROTmdhZHAxVTUzNjUvSC8zRm4xekJ3?=
 =?utf-8?B?azZIMnFhT3hnWGNsNWZ1bG12NTJmZW5Gd1VFRTYyWDZVNmVONDN6Nk5sMUhn?=
 =?utf-8?B?TjJJUDVGUVZENDJjVk0vay9VbzNhRjIrVGI1NGpJOVBoN2M2S0xzZ2lwS1pw?=
 =?utf-8?B?Q25TOU9jbzlqcmo3U3BwMUVzdHlFcXgrSEhNREJmdUUzdVhUZkpXcTREVzZS?=
 =?utf-8?B?V2U0bUt4eXZ4ZWYrYlFLQXdQdXdWc0Z2VSt4em1nMGQrZHV6dW40Tm5kTnlH?=
 =?utf-8?B?MHl3MkFYVWx0ak1UbTNvV2wwMUI2bHBXMVNqa3RXKzV6NXl5UG1YL0UvUVgx?=
 =?utf-8?B?VXNHb09uTGMwOHdWUTZEcHVXTkVnaGIrMmpIc0RpUDN1Qi9DK2k0WmJMdUxN?=
 =?utf-8?B?eW9rMGlHVitKM2NLOEpjUXNZMEdESjJOcEFZdHhWWk4xclZVazNVejZzRzVF?=
 =?utf-8?B?c1pQOHd6SldSNytzd3pEMDI5UVZuem9OTzBzYVJQTUxsOHNCYTdxVTdHSU5h?=
 =?utf-8?B?RDhPcTRrczBLYjZRSnlTY0pCNU5RWW5IS3lhTHZnSC9ESXpJdG1jN2JKaXpz?=
 =?utf-8?B?UVBkb2x1eXR1Y0svWEtReU1aTEhxN3JvT0dJU2NMdGhUTzduSlRCaHZlbkdv?=
 =?utf-8?B?a3ZsMERsTDIzL0dYWFFMVm03Sk9aeXpyN2xIVk51RDFhdU1udkdBUDYyaU1O?=
 =?utf-8?B?YjNWcm00UFh0VXVtblpPUHR0VXJnMDFYZWsrbGtXNXA1MU9QTHNZVVBMQ29z?=
 =?utf-8?B?NkliOTl4MmpXUGM2UEROOXJGQU83RmR3UzRueU1KSHVlM0hXTGw4SkNuU1Qr?=
 =?utf-8?B?VzIzaC9Cb3hMeDFoODREWllqbEppSlE3NUhTaHlmYzNxcDhQK3lKN00vMEJE?=
 =?utf-8?B?cExTOUdBb0RPUTJUcCs4WXIrSnhGcERhS21kQVc3YUhiNEZ6KzJ6MkVOb2Fq?=
 =?utf-8?B?KzloM0U2SU9pem51dnRzWElKR1E3TXVGOVJKSWNLcE5qTHJKUkRzTzVieDdZ?=
 =?utf-8?B?ZkpaWW16RGpBV1o2Rlh3VTB4YzFCY0M0aWxhTGNXMFhCUU16MDZWaG9iU2hk?=
 =?utf-8?B?c1JDd0xQQmo1YjJGRFJEZFY5bm5IQTdHWGNJVHlkamc3aGs1dElVY2hMeHhU?=
 =?utf-8?B?K2lSQnRYK1Qydm56YUticE1TSGZabVBVSzE5VUdoWUlRY2ZxUERFNmdsNzJo?=
 =?utf-8?B?VHFYWnJ3YUU3ekI2UWNzTG5GbEtsNldKb2pFQVdVeisxcVA2dXdtYTZRMG96?=
 =?utf-8?B?dDluSEp2cllUU2ludE1XTjdGYTZPVW15WUYxczRFOUs3cmtxOE54SW1KY2c1?=
 =?utf-8?B?blRleUttTUlYZzRvaXFCanFJSnRiTFJMa2k1MVBWaDJhSzgwT2Y2OWlnejls?=
 =?utf-8?B?NENHL2t4L0ZKRStDT2lrZGVoM0V2dzROUWgyQktzQ2piRDdhZXptZy94RFJ1?=
 =?utf-8?Q?uuq9Iu370+aN23NkGyF3LADEM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c40c7016-ff21-4b77-1b1d-08de3996380b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 15:50:48.4419 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VoUePfGfVCc7wHEtWrEU/z8bobovF1ZDyJ0tX7Cgde/pQD16wTz0gZhkEPXYtntc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8043
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

On 12/11/25 16:13, Tvrtko Ursulin wrote:
> 
> On 11/12/2025 13:16, Christian König wrote:
>> Using the inline lock is now the recommended way for dma_fence implementations.
>>
>> So use this approach for the scheduler fences as well just in case if
>> anybody uses this as blueprint for its own implementation.
>>
>> Also saves about 4 bytes for the external spinlock.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/scheduler/sched_fence.c | 7 +++----
>>   include/drm/gpu_scheduler.h             | 4 ----
>>   2 files changed, 3 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
>> index 08ccbde8b2f5..47471b9e43f9 100644
>> --- a/drivers/gpu/drm/scheduler/sched_fence.c
>> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
>> @@ -161,7 +161,7 @@ static void drm_sched_fence_set_deadline_finished(struct dma_fence *f,
>>       /* If we already have an earlier deadline, keep it: */
>>       if (test_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags) &&
>>           ktime_before(fence->deadline, deadline)) {
>> -        spin_unlock_irqrestore(&fence->lock, flags);
>> +        dma_fence_unlock_irqrestore(f, flags);
> 
> Rebase error I guess. Pull into the locking helpers patch.

No that is actually completely intentional here.

Previously we had a separate lock which protected both the DMA-fences as well as the deadline state.

Now we turn that upside down by dropping the separate lock and protecting the deadline state with the dma_fence lock instead.

Regards,
Christian.

> 
> Regards,
> 
> Tvrtko
> 
>>           return;
>>       }
>>   @@ -217,7 +217,6 @@ struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
>>         fence->owner = owner;
>>       fence->drm_client_id = drm_client_id;
>> -    spin_lock_init(&fence->lock);
>>         return fence;
>>   }
>> @@ -230,9 +229,9 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
>>       fence->sched = entity->rq->sched;
>>       seq = atomic_inc_return(&entity->fence_seq);
>>       dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
>> -               &fence->lock, entity->fence_context, seq);
>> +               NULL, entity->fence_context, seq);
>>       dma_fence_init(&fence->finished, &drm_sched_fence_ops_finished,
>> -               &fence->lock, entity->fence_context + 1, seq);
>> +               NULL, entity->fence_context + 1, seq);
>>   }
>>     module_init(drm_sched_fence_slab_init);
>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>> index fb88301b3c45..b77f24a783e3 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -297,10 +297,6 @@ struct drm_sched_fence {
>>            * belongs to.
>>            */
>>       struct drm_gpu_scheduler    *sched;
>> -        /**
>> -         * @lock: the lock used by the scheduled and the finished fences.
>> -         */
>> -    spinlock_t            lock;
>>           /**
>>            * @owner: job owner for debugging
>>            */
> 

