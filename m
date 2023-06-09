Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F079D729AB5
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 14:53:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DC5D10E69C;
	Fri,  9 Jun 2023 12:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2078.outbound.protection.outlook.com [40.107.93.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC7310E69C
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 12:52:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nVWFohNuw6gdRfsttM1OYvT5igwZuSK/WGQKvPUWUwV1wU/kcpFRCpk8KBFA3WE3ugCn1WFgC2R+6pmRQNLOsLQ8yje3PUFPcLCXkIaFjK89pbTgq7iHaDDCYJewTvzViUgGe8DkGITX/fZvQU2/iltxUg9ALjBWobH4ow5LCJghZnxKSirSeox/INAHHn1tRUbhdkH9hswmkqGmXOWDFWQYG82oDyt+Vsdse+zrU9gUQbwl0ymggAKJcKPKNfRw1eac+MTtgystdPryqfQwpVTR+W7iF8qsIqiCwb73CrE3vlzFup82AvsXpDOqDARqPetXwmTNfs/dKeQoXaCY8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wDZ+63pMkh5hBXWUX8u+LYzZbQG5AUjeVlYnPgsMHiw=;
 b=iWRcAiNjAeMl0plGYH9JCNB4sax/YnX6/aTprXp4t00OVXN5pKeWec5t0ZAk1woRdR5wS1CcOvFu3y0+89aaq5OceXTvcfdG04hAwYAKAKUV6+TX4PF4UQQV3+nZerR+5LiaVlW9Bjc/FdcjZ6iad8rzPfgXhzjlNJyQXmfeSM6qHvrHjqGFMmWRlJT8FXP1b80Ot1+h0LCs+4bRmFWWRRhLvlkHxiVlY9T48rrZsdpzCy4rLBYaReepgG37Tx6AtqwkIFFfMrMkoVPyXS38tEdPIClyodituua6UC5zjhzpvgJzWip6jOXyqxdnQh/oLqs3bFxlK6M1Sizd5C/Caw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wDZ+63pMkh5hBXWUX8u+LYzZbQG5AUjeVlYnPgsMHiw=;
 b=pt2855pBcnYlomZv8YJ3GBWX61RlvJNDAEUIK0z5wGTDe2koKYqT+cGk2emwIE42Y3sFA20gox1ZE+HhBb8cwIyX62cYQ1tYAKD3vtm85sDAKnT10ARb3Hg0FcQu/0TXZ43TQAxjV1tO0nMGkpjrSOBp+wu65OuMso4h4n1NTBw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS0PR12MB8504.namprd12.prod.outlook.com (2603:10b6:8:155::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19; Fri, 9 Jun
 2023 12:52:56 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::6729:a735:9814:97ea]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::6729:a735:9814:97ea%6]) with mapi id 15.20.6455.039; Fri, 9 Jun 2023
 12:52:56 +0000
Message-ID: <12232c7b-fe68-81b2-49bf-fbd7a4351552@amd.com>
Date: Fri, 9 Jun 2023 14:52:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] dma-fence: Bypass signaling annotation from
 dma_fence_is_signaled
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20230608143059.1038115-1-tvrtko.ursulin@linux.intel.com>
 <b8f0ea1e-4ab3-8ff1-5e69-4e723adf8c2a@amd.com>
 <9bbc64c9-d4af-9183-f002-01225ae8f74b@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <9bbc64c9-d4af-9183-f002-01225ae8f74b@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0076.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::6) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS0PR12MB8504:EE_
X-MS-Office365-Filtering-Correlation-Id: 26282b25-d1f1-4fa8-72d8-08db68e87274
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +6lprDVCS6Pmd/6BMttgHXbzzP8nO2OetJhyyn7RTLRYFOTD9oz0TqWNQtXcqEoQi4D8b2kVY89zBwGQunklfYAwzq2ch/cp85t4Q0ndh88DisL0RdEwZzffieQRaCBS5tmvzty0Pi8WPNEj8rgjfGgljZ4ombnWl+X3XjlTIPrmi4d5/DIaZXtC2bTp03YHRaz/LtzN0LD+GH1IqXKih8kw1ClvMVAlTyt2CinDcOuJ2fmyj8Jy+hTKE0CETEAE4yOjTnFIQWF9aWEjrujftd96L2zveKzKZ1aDFg2KOMr9d4+dDiLIdkE3utmegJVANP9OkD47UV17WFuwkpa7F4AA0KWxvDRwgWOW63N4lUYtb15eSfZLSSC9qDRECwPB8VYx1/Gb7WBXrIvAg55PIeeDAo5iNn8Bibb1utuA3W7PlHisUglYravtw6AgQGjtmq9vY7JkDEPOOCZEm1h1SVs9LkDOHiFEzQbYivFMmmBy1XV3wkRhBta73grnhl0ZYqMjC2PagDb8fMSTq6agCHFEKDDN6GLuVQsBJdt7VYzdTawpCZmx8bzCUQIRm9g5UuzFxAM8K0CpxIuv4h5b68R6/jBjggyGpnLlE+Bd1V6DGch8mCezu8LbldzHKUphWifr0B8o5rkhBGPFDiM5tg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(396003)(39860400002)(366004)(136003)(451199021)(478600001)(4326008)(66556008)(66476007)(36756003)(66946007)(38100700002)(54906003)(8676002)(8936002)(31696002)(86362001)(5660300002)(2906002)(41300700001)(316002)(83380400001)(2616005)(66574015)(53546011)(6506007)(6512007)(186003)(31686004)(6486002)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGpJRnVLQUswbFhRWWg4VVFmeDVWWEFhYVR1V2p5aVk0aG9NMVFzdnFZK0xW?=
 =?utf-8?B?YktTSTBkZEVud0FGVk9LZzVXK29GNGJiVTQ2SVF6QUFNQW91MlhjVHhuS0Fu?=
 =?utf-8?B?SXpLa3Q1U29mZlJ4b2FSWmNyZTdrMEo2a0hya09RTHBURXBaN2puSlU0NTFo?=
 =?utf-8?B?alJTQ0MyeXRpa2wyVWpQczd2TlpWQm4rZTdLeTZNR3FrRTFPTmxqN082eG91?=
 =?utf-8?B?S2NCZ3hRNE9vODBrMExtcjVVcUFFVkR5T0ZRK2FMSXpvd3d3WFI2N2s4czJF?=
 =?utf-8?B?VHAwNHJRbUF6REVKU1lRYzRBakxuRUo2QWZ3ZUVFNHdycHEreWxiR2YvUis5?=
 =?utf-8?B?WFJBRTlEL1J0Z3d1S0NjVzZHMGN3VTQ3QWROdUh6YVJNREFkbHZQc1EvNVVT?=
 =?utf-8?B?ZjQ3am9temVaM3Jqc3lMRUNnbkt3eDNFMXV4QjZ2YmJOaElYSkxEeXFXU2cz?=
 =?utf-8?B?QVJPdExUaUcwaTdOZXFhUDFGZnVDeit5N240L04yb2RQRlJMSFNmSGRHNEZV?=
 =?utf-8?B?bjFLcXdkb09wb0FkenVBVnN1UlRlZXlIZmZWbW5DRXFCUUJMSXpQTEl4L2NO?=
 =?utf-8?B?M3JTUzN0T3ZUTlEvVGtDckN4MDFiMVh1YnJTQ3dNR0poZ2pWanEwNFFXK1k2?=
 =?utf-8?B?R0F3VXZiR1d1S0FyU3htVTV0MUU4N0Rua0JIMzNodStNOHdWeTlLYjRDcWFk?=
 =?utf-8?B?UUZlUFA1V2NmVmVBZEUwSmlxOXUzNHlLSGY1NVdzbVZNd3hlNWR5ZjAvZnFW?=
 =?utf-8?B?N1U3NSttcGZpSkVjUkw4MWxPRFhTT1U2Uk9tWXJCMVJDRTg1RURweGRDaEVo?=
 =?utf-8?B?bmdjOGJTRXBLRGdQcERmZjlYWmc1Y1ovMTRMbzFnb2NUcHZwQkkxaVNSellO?=
 =?utf-8?B?TzNlQkVNczdhUzhFamtNVUt1cXd2Unh5SmdpMW03VHdkNjFUeThMUEp3T01J?=
 =?utf-8?B?MDNuL1IrdzdiSFZTY1pmQk5SeTVwR3ZHbmhTMHBVazVyN1VzNzg2OGFJNjFV?=
 =?utf-8?B?dTZiTmg4b0Z3Nk5nWWMyY2JMblZFTU0rcVJuK3dRMHVzcGtKYzI5enA2emhV?=
 =?utf-8?B?MnNSc0w5R1Z4cktGdWs1L3kxOXZ6WW81Z3hTdTR0T29kMHk3amNTUGxxNDg1?=
 =?utf-8?B?OWhQMDRqQXBYRnFQNENsazV4ais2YWRCMC9kZXlRZDBRLzRGMDRYM0hZMHh6?=
 =?utf-8?B?LytyM05wWkVXT2QvNXYybFhrL3NCZTNkUVoyVjIwN2RoMVN4bzBOY010OFJJ?=
 =?utf-8?B?M2ZTR3pOZCtwNWlVZTl5dW9ndUhZTUlVVTRCSkxUeVBSeVhldk5PeWd3Ui9y?=
 =?utf-8?B?VlRrb0JnT1E1Wml0RUdsSFVlV0tvQkhnVEpNM2YzZk5hUVVPK003OFpWbHB6?=
 =?utf-8?B?L3IxOHdDN3prRVVnblJQZDJqTkdyd3gxWm5sTVRnTnlXUXc0WFFSdTVxVlhN?=
 =?utf-8?B?ZGFaSk8ya3IxaXJRVnpOdjZCdEZ6U2YzWmxXVHgyaWFEaEdVLytQMHpDSTRy?=
 =?utf-8?B?c0tkcjhtTHdkU0xGZzJUR29qNi94VTExdkdkZHhSc2RBc2Q3YkVnMUpJWU14?=
 =?utf-8?B?a3FnR1BZTW9lZGFVSWVPR0haU05yVkZUZ3hmSHIwYi9SeEp6cXQydnhZUXJj?=
 =?utf-8?B?OFQwb3llMnArb1R4ZVdtVkpqTjVyNlloYTFkaDdjNG5BbmJRWUhyd2RFY0pL?=
 =?utf-8?B?MHRSUXk1NWMwdk8xa1V0M1JMbTlHWHFHMDBDMG54aUZSbWpMMmdDTWM2V0pG?=
 =?utf-8?B?bFozdFUwK1BFYnJneWVzTVkwT2RRYlJJSFFBNkdCZE1WWVhSSUVldkg3UUN1?=
 =?utf-8?B?VnY2Q0djK3MrcWs4ZUlrZHhPVEJSMUhaazl4RFJiZ1BmS2NmaVh2cmdtSWVJ?=
 =?utf-8?B?YUR3bTJjYzhOSmRFQXZQSTBHNUpmZVdTTzZoa1JLZStWcWMwOFpQQW9wWXhW?=
 =?utf-8?B?enBwcnUrdFk1cXloYVNlN0s0MXFPVXQ2N2hzd0FNcVdVMWZMaDVLT3BJejN3?=
 =?utf-8?B?RFNNbGtFK2Y2eDAxRktRTzdUUXV6cFJHajhkNnBSQ0hhdHpGY2Z4a0ZyWUpB?=
 =?utf-8?B?dzRVU05DTm15azlvTEs5U0NLL3dqbGY3Z0dWUHJIY3VvWE4vK3pVdjR0akY4?=
 =?utf-8?B?d2pOcTZicUl5RVdGNUovSnlKaEorYWprU3hTM0ZWa1VMVndlMmY4WmtxNWk3?=
 =?utf-8?Q?2mh6TEglBvOXc9g2wIdgssl07O2YBaPVdEnY7ZeCGS1z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26282b25-d1f1-4fa8-72d8-08db68e87274
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 12:52:56.6872 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A6YWvHWFTULnFsGN6aU7GkV/7brDv0VseYsyHMJ7l09Ls+CeHzLjcAHjhmbeUw23
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8504
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 09.06.23 um 14:09 schrieb Tvrtko Ursulin:
>
> On 09/06/2023 07:32, Christian König wrote:
>> Am 08.06.23 um 16:30 schrieb Tvrtko Ursulin:
>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>
>>> For dma_fence_is_signaled signaling critical path annotations are an
>>> annoying cause of false positives when using dma_fence_is_signaled and
>>> indirectly higher level helpers such as dma_resv_test_signaled etc.
>>>
>>> Drop the critical path annotation since the "is signaled" API does not
>>> guarantee to ever change the signaled status anyway.
>>>
>>> We do that by adding a low level _dma_fence_signal helper and use it 
>>> from
>>> dma_fence_is_signaled.
>>
>> I have been considering dropping the signaling from the 
>> dma_fence_is_signaled() function altogether.
>>
>> Doing this together with the spin locking we have in the dma_fence is 
>> just utterly nonsense since the purpose of the external spinlock is 
>> to keep the signaling in order while this here defeats that.
>>
>> The quick check is ok I think, but signaling the dma_fence and 
>> issuing the callbacks should always come from the interrupt handler.
>
> What do you think is broken with regards to ordering with the current 
> code? The unlocked fast check?

Well it's not broken, the complexity just doesn't make sense.

The dma_fence->lock is a pointer to a spinlock_t instead of a spinlock_t 
itself. That was done to make sure that all dma_fence objects from a 
single context (or in other words hardware device) signal in the order 
of their sequence number, e.g. 1 first, then 2, then 3 etc...

But when somebody uses the dma_fence_is_signaled() function it's 
perfectly possible that this races with an interrupt handler which wants 
to signal fences on another CPU.

In other words we get:
CPU A:
dma_fence_is_signaled(fence with seqno=3)
fence->ops->signaled() returns true
dma_fence_signal()
spin_lock_irqsave(fence->lock)
signal seqno=3
...

CPU B:
device_driver_interrupt_handler()
spin_lock_irqsave(driver->lock) <- busy waits for CPU A to complete
signal seqno=1
signal seqno=2
seqno=3 is already signaled.
signal seqno=4
...

Either fence->lock should not be a pointer or we should not signal the 
fence from dma_fence_is_signaled().

I strongly think that later should be the way to go.

Regards,
Christian.

>
> Regards,
>
> Tvrtko
>
>>
>> Christian.
>>
>>>
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>>> ---
>>>   drivers/dma-buf/dma-fence.c | 26 ++++++++++++++++++++------
>>>   include/linux/dma-fence.h   |  3 ++-
>>>   2 files changed, 22 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>>> index f177c56269bb..ace1415f0566 100644
>>> --- a/drivers/dma-buf/dma-fence.c
>>> +++ b/drivers/dma-buf/dma-fence.c
>>> @@ -444,6 +444,25 @@ int dma_fence_signal_locked(struct dma_fence 
>>> *fence)
>>>   }
>>>   EXPORT_SYMBOL(dma_fence_signal_locked);
>>> +/**
>>> + * __dma_fence_signal - signal completion of a fence bypassing 
>>> critical section annotation
>>> + * @fence: the fence to signal
>>> + *
>>> + * This low-level helper should not be used by code external to 
>>> dma-fence.h|c!
>>> + */
>>> +int _dma_fence_signal(struct dma_fence *fence)
>>> +{
>>> +    unsigned long flags;
>>> +    int ret;
>>> +
>>> +    spin_lock_irqsave(fence->lock, flags);
>>> +    ret = dma_fence_signal_timestamp_locked(fence, ktime_get());
>>> +    spin_unlock_irqrestore(fence->lock, flags);
>>> +
>>> +    return ret;
>>> +}
>>> +EXPORT_SYMBOL(_dma_fence_signal);
>>> +
>>>   /**
>>>    * dma_fence_signal - signal completion of a fence
>>>    * @fence: the fence to signal
>>> @@ -459,7 +478,6 @@ EXPORT_SYMBOL(dma_fence_signal_locked);
>>>    */
>>>   int dma_fence_signal(struct dma_fence *fence)
>>>   {
>>> -    unsigned long flags;
>>>       int ret;
>>>       bool tmp;
>>> @@ -467,11 +485,7 @@ int dma_fence_signal(struct dma_fence *fence)
>>>           return -EINVAL;
>>>       tmp = dma_fence_begin_signalling();
>>> -
>>> -    spin_lock_irqsave(fence->lock, flags);
>>> -    ret = dma_fence_signal_timestamp_locked(fence, ktime_get());
>>> -    spin_unlock_irqrestore(fence->lock, flags);
>>> -
>>> +    ret = _dma_fence_signal(fence);
>>>       dma_fence_end_signalling(tmp);
>>>       return ret;
>>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>>> index d54b595a0fe0..d94768ad70e4 100644
>>> --- a/include/linux/dma-fence.h
>>> +++ b/include/linux/dma-fence.h
>>> @@ -387,6 +387,7 @@ static inline void dma_fence_end_signalling(bool 
>>> cookie) {}
>>>   static inline void __dma_fence_might_wait(void) {}
>>>   #endif
>>> +int _dma_fence_signal(struct dma_fence *fence);
>>>   int dma_fence_signal(struct dma_fence *fence);
>>>   int dma_fence_signal_locked(struct dma_fence *fence);
>>>   int dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t 
>>> timestamp);
>>> @@ -452,7 +453,7 @@ dma_fence_is_signaled(struct dma_fence *fence)
>>>           return true;
>>>       if (fence->ops->signaled && fence->ops->signaled(fence)) {
>>> -        dma_fence_signal(fence);
>>> +        _dma_fence_signal(fence);
>>>           return true;
>>>       }
>>

