Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD733905DD
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 17:50:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9BBC6EA6E;
	Tue, 25 May 2021 15:50:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2078.outbound.protection.outlook.com [40.107.94.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E572A6EA6E
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 15:50:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mgMBT96LFtL/4g7edxyewmYCT4EMtGCrbqgAxSq75fx8kdbS9bon7COkKYds0F2Q8GFIfJaA1j8cZvz3lFOQoKgy9RbOn5fW0E10k3yqZ1qxhrl+LbPnIZ18W3/z/9wAtcFKDlDzLzQpqIgYdtjMpnbogZFtfxkrhhmFbdne6PjvTyLJLp5eX2CEL/P6Rw+QZ5At8JdFtjrd6VXMxBGTkbed3v4GTkumKzdMkwlpn8eWlkVZD7neIs7IcYi0DixRNHuyiD24qlimUj//QcwUvAscKzuiti09uBe46WQrFGEoaT3qZ1cf1YDZkZ7/m6PkVsOeLvSPnk7VxVMsZlbrBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZvhTT8RSLQWDP24VK37yYZI/S674GoKZiBtJjeX1Huk=;
 b=ZlbHhdghK0nUXdrl3TX9SmaDGAYBw7VFOkKCCag2VQp83xs8qEYHFYuqOjRHfmAxt+P11amJG46ijOkc8XwPcDYnlN7OqkCU5kGI9jjCN0p+PoyT9Y/Qtzaw8n5jlA7tBzY3QgcJeYc74AV85CLPMnNq70Tje6OSuK/WMFC8mWwxCsRpf1eV7bMVFrt83ogvI4XVSrPzmhvezS8W4YMmWfxTcGkYW4fFFqjN0LyIqGxW+AJmNZ3niaVjmTIiP7wEAiam8QEX9gAUuA2YLKCEZZAEQlKfj2UavWGedmLrWvO29Yw/aGKa4C+4Hwbcny/Sm+nbQDsPcznvoreFK2KkwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZvhTT8RSLQWDP24VK37yYZI/S674GoKZiBtJjeX1Huk=;
 b=MOew8Z/7D2hepM8EIoh/P8Kkyjaw4OGeuS/jwcThMfDZhUXgY8JF+3JiwzRn3Ek74vos2WzJqmD5xcnC0HIfnFXWzcw4MRztOjrFffYRAATmdIWc+7MzamekFaXcUTUIeSDLVjocy+dneXnR1wK4YEtKWdHnw0jv320aQyfKI0o=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4405.namprd12.prod.outlook.com (2603:10b6:208:26d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Tue, 25 May
 2021 15:50:06 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4150.027; Tue, 25 May 2021
 15:50:06 +0000
Subject: Re: [PATCH 2/4] dma-buf: add dma_resv_get_singleton_rcu (v4)
To: Daniel Vetter <daniel@ffwll.ch>, Jason Ekstrand <jason@jlekstrand.net>
References: <20210520190007.534046-1-jason@jlekstrand.net>
 <20210520190007.534046-3-jason@jlekstrand.net>
 <YKfyestsJvKeS4k9@phenom.ffwll.local>
 <CAOFGe94YLYDUwLE4_S_vBnJqLm6RKV8eOBcPw8pz3b7EVOFFjg@mail.gmail.com>
 <YKzvw3iQxiiI8964@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d1cd308b-02ad-fb32-c891-a2dd39e15814@amd.com>
Date: Tue, 25 May 2021 17:50:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <YKzvw3iQxiiI8964@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:d67f:bd9a:6dbf:33b1]
X-ClientProxiedBy: AM3PR05CA0139.eurprd05.prod.outlook.com
 (2603:10a6:207:3::17) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:d67f:bd9a:6dbf:33b1]
 (2a02:908:1252:fb60:d67f:bd9a:6dbf:33b1) by
 AM3PR05CA0139.eurprd05.prod.outlook.com (2603:10a6:207:3::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Tue, 25 May 2021 15:50:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 710f6a0d-8b9a-4547-32e4-08d91f94c46b
X-MS-TrafficTypeDiagnostic: MN2PR12MB4405:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4405F8DE90255C7042730A5783259@MN2PR12MB4405.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8sdNtyW2Y4vrKlUVSrAZiGxuxhcPgXi4DZjOwOvKxJJOEPUJpgNKCSnDnbyTjHQNwoCAz4PN1Vd2BxVN6d2R/FAJf3tkLrRtsYBF+/5+REREaYZhh7hrmqE3WDsYW21ZJ+ldeNevndZQMlYOrfISDysM7MY2C68iVrMo9jrqDPO5QG1vnhvHHDCWFUQiHP9w6bLghxJ6iM+nfPqIqCtt0vbi8JV+NOEJ3pqTktBBE6EIcCuoHBfeCY6o15WoMxmlAfV3woTtOdej/WYi6ef/MeVb7pbRWOTUXjVOODgGMLkRZ7lw+X3hfwlg8bbwfBAQ4Z8bNarc5EVWDtViGSQUn0BXYJViMH+kqg7ZFecV8LFCAb+5SvcRfMUzVab8shABesOuhanYC6GYLUPsVOsNyQqtJLnoZnih9e6O+Vr/igmVrbC6EyB7d1uz74h59NuevzWFQNORbT2zplJvuSkTkdyIagILUzaNB20FGZsHcFMamddGFYnUtXdsopEcwqYtIDnvP/MOfy5XnKuvOr1UMHBRNJ+BxIMrQU0ARJBU5JUKId1Z7p9ss6dH4rkTLvIAafU+u3SfQ4+kocSH2ZUPsyc6RfDdwCCUJLNHKz9vxNZQf1JzSC5x37qg/Qtjli+BiofxKGuvvpyx4gTF1dY8b2novaHIojc0W/7EuU0aZPV0QM69mcjHRurQStBdfdwqAhU8QXYvGsS4VNW3jDXZpVzSq1z5wwbM88my4hUP6OhfWoB94vto3GR1kC3BcEe9EexQs11AijLxnRzVYKf98Xca4iC0nKckQk2xicFDedDA2zfmEcKojaMn1bwYvAss
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39850400004)(136003)(376002)(366004)(478600001)(45080400002)(66574015)(8676002)(5660300002)(53546011)(4326008)(2616005)(6666004)(2906002)(8936002)(83380400001)(66476007)(66556008)(52116002)(66946007)(16526019)(186003)(110136005)(31696002)(31686004)(6486002)(36756003)(86362001)(38100700002)(966005)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZWpWODBxT0NJd2FGL1RyaDB6Ny9iZFFnRTMzYVRoNzNxMmVqYlNmdlBHaVJr?=
 =?utf-8?B?YXd4dmRtcGZTb2NVMXN6c0dka0hFa0hrZTh6SEVjQzBiZmM3emJwUW9DSDZK?=
 =?utf-8?B?eFp5bkJMdTZNVzkvOHp6Sko5NEYxSVdZY2hmWmlraDN3RlcrdVZ3NHBGa29s?=
 =?utf-8?B?WmZ1b0hwWEdidnBlRXQ4Z01ubmdhOHlmeFhtYitMQ0Z3L0dqT3JsMUxOUFJM?=
 =?utf-8?B?VXhyZFJ1NVZXNXZkd1Eva3lrd2FJZUtaRzdFMUR1ajdTYjNVZDJMWmpTOHFn?=
 =?utf-8?B?VDVld08xaDg3Z2dNMXVVYnpITXorMm5XVEZCQjZZczRDRE5XRVFGS3BWRVRs?=
 =?utf-8?B?QU5yNDdIOVQ5bmp3TG9WL3FVWTlzQ05kVVVXTFJ4eW4raFJvdUgyYVhmMmVG?=
 =?utf-8?B?c0FLYWYzM1hMUm93aDJybWd1WnJEZ3dlMFE0TEFzbVBmNHhoby9CbVZFTUMr?=
 =?utf-8?B?L1lWbDZNaWRwZXBuRExsaWVXV0t3STdxTG5PYzNkaEJUM1pDSUpxOVQ2UEFP?=
 =?utf-8?B?TU9MWmQyelQzTGNWbUpyZDV4S2VkYlhrTFRTdmpVODEvN3hVSDR2VjlDaHdk?=
 =?utf-8?B?aVNQY1BpUVhTendvR1RUbWZDdTVkK1orMlJKNHEwT1pUMmR1MGZvMnRWZGpC?=
 =?utf-8?B?VXFzSUd6eHYyY0puVXloZzl5ay9ocURRTGFzWFp3NG5ndzV2NkhUc28rRjl0?=
 =?utf-8?B?eVlTaFNEZVF4ZEthMzBkN29nd285TmROcXlDZWo2Q0hsVlBnMXB5VHlpYXZV?=
 =?utf-8?B?anRJM0xsbGUzSWxubDhCS0E2SlRUQTFlSXBHampKbEJHQ0RUMW81ZWdxZ2pW?=
 =?utf-8?B?djdrUUdDTXoxVFhkQ2ZWYXVNc0YwZytjOWVzS0dDc1BQRkFQMGt0WFQvYUV4?=
 =?utf-8?B?eFYreVo0dXphZ0x2ZXV3bXEwNkNtL1RGRlJBMU80SUJ3ajJTWnJVaDJZYlBn?=
 =?utf-8?B?eXppU2NKS244VHlzSStYVGx2c2dYMEVpWmhGNVAweXBCYlZRZHloaXlVTTVq?=
 =?utf-8?B?R0QrNDY4Q241VmtOa1FjUWhEYmtiSENWb2xIMllRU3ZVNUpFTHkrNDdMWTR0?=
 =?utf-8?B?M3UyZ0d3WnhXQXJvN2gway9MOHJTSjcxU084T1V3b29kL3M2MDhIU05VeXBT?=
 =?utf-8?B?M2RodklDRGswRDZ4MjJmbmlhL1NxUlRuei8xQ0NEMmJ6OEZ6NjliMUdUMlpV?=
 =?utf-8?B?dWVwNzZJeVdjMlIrOWRJQnVaV2VpOTBxaHpSUzJiaExYOHpBY2txT1dwZjZh?=
 =?utf-8?B?bXJUN1F2M2l2TFVTQmdldkZHR3VMbEFwZXE3a1lWYXl1bzFucFhYZkYzU21J?=
 =?utf-8?B?ZkxUb3lYRVNNWWZtbmpIRU1OaU8wQnduUmRwMjJ2YzlETFoxYi9SelBQUnVM?=
 =?utf-8?B?YVNuZmFxL3RSOFRBWUkyamd0OTZGdjg3elhMM3FhblE3SkptTTdFcmZINDJl?=
 =?utf-8?B?UmU4M3I3ZmNBcGVNYzVPQlFObTN3ak9PREVpeUFwTkkvaVBlcWh2enlodlVk?=
 =?utf-8?B?Q1BrVUM0cmQwN2J1V3FYZWd5WStYSnJud2VYaEwrZFRkam51UjJzRHl5VDUw?=
 =?utf-8?B?N3RrVjVBT0p5cWFlK3JHS0wzQ24vMmZDNkdRcVJOcFJZL2RkVEJhRGFWQlJE?=
 =?utf-8?B?cjFob2ZYU2h1aE4rbUlJT0FXVTNpVWdSV2FBLzJSd0J2dDFyNWxvSnV1c2Jy?=
 =?utf-8?B?QWdLelFudzlsdC84cmJOUGM0MGs3YjAwVFRYeDdIeTVSdFBQUXBmV1FLTDlI?=
 =?utf-8?B?VzE1aDJPQ3NRY3JXQXlTSTJZN2FpOG15bjdGYXdyc2NwT1VjemhrdnNDTUgy?=
 =?utf-8?B?TWRHWndhL0VYVVJaNkljNlVHRXRFYWxKWitybjd2b01QN1hGMUZMNjgvV01l?=
 =?utf-8?Q?KecyfAHw33R9N?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 710f6a0d-8b9a-4547-32e4-08d91f94c46b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2021 15:50:06.2885 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gSDz9LU8Ae/jMHIEtdfiN91IhSfOQ5b8YQbrmom6EicGq99AwcsuBIsDeKSvhOsZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4405
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 25.05.21 um 14:38 schrieb Daniel Vetter:
> On Mon, May 24, 2021 at 03:04:35PM -0500, Jason Ekstrand wrote:
>> On Fri, May 21, 2021 at 12:48 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>>> On Thu, May 20, 2021 at 02:00:05PM -0500, Jason Ekstrand wrote:
>>>> Add a helper function to get a single fence representing
>>>> all fences in a dma_resv object.
>>>>
>>>> This fence is either the only one in the object or all not
>>>> signaled fences of the object in a flatted out dma_fence_array.
>>>>
>>>> v2 (Jason Ekstrand):
>>>>   - Take reference of fences both for creating the dma_fence_array and in
>>>>     the case where we return one fence.
>>>>   - Handle the case where dma_resv_get_list() returns NULL
>>>>
>>>> v3 (Jason Ekstrand):
>>>>   - Add an _rcu suffix because it is read-only
>>>>   - Rewrite to use dma_resv_get_fences_rcu so it's RCU-safe
>>>>   - Add an EXPORT_SYMBOL_GPL declaration
>>>>   - Re-author the patch to Jason since very little is left of Christian
>>>>     König's original patch
>>>>   - Remove the extra fence argument
>>>>
>>>> v4 (Jason Ekstrand):
>>>>   - Restore the extra fence argument
>>>>
>>>> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
>>>>
>>>> get_singleton
>>> Spurious thing here.
>> Fixed.
>>
>>>> ---
>>>>   drivers/dma-buf/dma-resv.c | 122 +++++++++++++++++++++++++++++++++++++
>>>>   include/linux/dma-resv.h   |   3 +
>>>>   2 files changed, 125 insertions(+)
>>>>
>>>> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
>>>> index 6ddbeb5dfbf65..25995fc15c370 100644
>>>> --- a/drivers/dma-buf/dma-resv.c
>>>> +++ b/drivers/dma-buf/dma-resv.c
>>>> @@ -33,6 +33,8 @@
>>>>    */
>>>>
>>>>   #include <linux/dma-resv.h>
>>>> +#include <linux/dma-fence-chain.h>
>>>> +#include <linux/dma-fence-array.h>
>>>>   #include <linux/export.h>
>>>>   #include <linux/mm.h>
>>>>   #include <linux/sched/mm.h>
>>>> @@ -49,6 +51,19 @@
>>>>    * write-side updates.
>>>>    */
>>>>
>>>> +/**
>>>> + * dma_fence_deep_dive_for_each - deep dive into the fence containers
>>>> + * @fence: resulting fence
>>>> + * @chain: variable for a dma_fence_chain
>>>> + * @index: index into a dma_fence_array
>>>> + * @head: starting point
>>>> + *
>>>> + * Helper to deep dive into the fence containers for flattening them.
>>>> + */
>>>> +#define dma_fence_deep_dive_for_each(fence, chain, index, head)      \
>>>> +     dma_fence_chain_for_each(chain, head)                   \
>>>> +             dma_fence_array_for_each(fence, index, chain)
>>> Since this is is just internal helper in the .c file we generally don't
>>> document it. Maybe small comment if you feel it's worth it.
>> Sure, I can write LESS documentation. :-P
>>
>>>> +
>>>>   DEFINE_WD_CLASS(reservation_ww_class);
>>>>   EXPORT_SYMBOL(reservation_ww_class);
>>>>
>>>> @@ -517,6 +532,113 @@ int dma_resv_get_fences_rcu(struct dma_resv *obj,
>>>>   }
>>>>   EXPORT_SYMBOL_GPL(dma_resv_get_fences_rcu);
>>>>
>>>> +/**
>>>> + * dma_resv_get_singleton - get a single fence for the dma_resv object
>>> Name doesn't match here.
>> Fixed.
>>
>>>> + * @obj: the reservation object
>>>> + * @extra: extra fence to add to the resulting array
>>>> + * @result: resulting dma_fence
>>>> + *
>>>> + * Get a single fence representing all unsignaled fences in the dma_resv object
>>>> + * plus the given extra fence. If we got only one fence return a new
>>>> + * reference to that, otherwise return a dma_fence_array object.
>>>> + *
>>>> + * RETURNS
>>>> + * Returns -NOMEM if allocations fail, zero otherwise.
>>> Kernel often encodes this in ERR_PTR so that you don't have to pass a
>>> pointer to store the result. Would feel more kerenl-y I think that way. So
>>> no result parameter, and on alloc failure you'd return
>> Done.
>>
>>>          return ERR_PTR(-ENOMEM);
>>>
>>>> + */
>>>> +int dma_resv_get_singleton_rcu(struct dma_resv *obj, struct dma_fence *extra,
>>> tbh the _rcu here is confusing. I think _unlocked is the better suffix,
>>> maybe we should rename dma_resv_get_fences_rcu too for consistency. The
>>> rcu-ness of the lookup isn't leaked to callers at all, so no point giving
>>> them a panic.
>> I can make that change.  I'll also include a patch in the next re-send
>> that renames all the _rcu helpers to _unlocked for consistency.
> Maybe double-check with Christian König whether he's on board with this
> bikeshed, but the current _rcu postfix we have in some dma_resv functions
> really confuses me.

Well I would say yes please :)

The _rcu postfix was something I was always wondering about as well.

Christian.

> -Daniel
>
>> --Jason
>>
>>>> +                            struct dma_fence **result)
>>>> +{
>>>> +     struct dma_fence **resv_fences, *fence, *chain, **fences;
>>>> +     struct dma_fence_array *array;
>>>> +     unsigned int num_resv_fences, num_fences;
>>>> +     unsigned int ret, i, j;
>>>> +
>>>> +     ret = dma_resv_get_fences_rcu(obj, NULL, &num_resv_fences, &resv_fences);
>>>> +     if (ret)
>>>> +             return ret;
>>>> +
>>>> +     num_fences = 0;
>>>> +     *result = NULL;
>>>> +
>>>> +     if (num_resv_fences == 0 && !extra)
>>>> +             return 0;
>>>> +
>>>> +     for (i = 0; i < num_resv_fences; ++i) {
>>>> +             dma_fence_deep_dive_for_each(fence, chain, j, resv_fences[i]) {
>>>> +                     if (dma_fence_is_signaled(fence))
>>>> +                             continue;
>>>> +
>>>> +                     *result = fence;
>>>> +                     ++num_fences;
>>>> +             }
>>>> +     }
>>>> +
>>>> +     if (extra) {
>>>> +             dma_fence_deep_dive_for_each(fence, chain, j, extra) {
>>>> +                     if (dma_fence_is_signaled(fence))
>>>> +                             continue;
>>>> +
>>>> +                     *result = fence;
>>>> +                     ++num_fences;
>>>> +             }
>>>> +     }
>>>> +
>>>> +     if (num_fences <= 1) {
>>>> +             *result = dma_fence_get(*result);
>>>> +             goto put_resv_fences;
>>>> +     }
>>>> +
>>>> +     fences = kmalloc_array(num_fences, sizeof(struct dma_fence*),
>>>> +                            GFP_KERNEL);
>>>> +     if (!fences) {
>>>> +             *result = NULL;
>>>> +             ret = -ENOMEM;
>>>> +             goto put_resv_fences;
>>>> +     }
>>>> +
>>>> +     num_fences = 0;
>>>> +     for (i = 0; i < num_resv_fences; ++i) {
>>>> +             dma_fence_deep_dive_for_each(fence, chain, j, resv_fences[i]) {
>>>> +                     if (!dma_fence_is_signaled(fence))
>>>> +                             fences[num_fences++] = dma_fence_get(fence);
>>>> +             }
>>>> +     }
>>>> +
>>>> +     if (extra) {
>>>> +             dma_fence_deep_dive_for_each(fence, chain, j, extra) {
>>>> +                     if (dma_fence_is_signaled(fence))
>>>> +                             fences[num_fences++] = dma_fence_get(fence);
>>>> +             }
>>>> +     }
>>>> +
>>>> +     if (num_fences <= 1) {
>>>> +             *result = num_fences ? fences[0] : NULL;
>>>> +             kfree(fences);
>>>> +             goto put_resv_fences;
>>>> +     }
>>>> +
>>>> +     array = dma_fence_array_create(num_fences, fences,
>>>> +                                    dma_fence_context_alloc(1),
>>>> +                                    1, false);
>>>> +     if (array) {
>>>> +             *result = &array->base;
>>>> +     } else {
>>>> +             *result = NULL;
>>>> +             while (num_fences--)
>>>> +                     dma_fence_put(fences[num_fences]);
>>>> +             kfree(fences);
>>>> +             ret = -ENOMEM;
>>>> +     }
>>>> +
>>>> +put_resv_fences:
>>>> +     while (num_resv_fences--)
>>>> +             dma_fence_put(resv_fences[num_resv_fences]);
>>>> +     kfree(resv_fences);
>>>> +
>>>> +     return ret;
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(dma_resv_get_singleton_rcu);
>>> With the nits addressed:
>>>
>>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>
>>>> +
>>>>   /**
>>>>    * dma_resv_wait_timeout_rcu - Wait on reservation's objects
>>>>    * shared and/or exclusive fences.
>>>> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
>>>> index d44a77e8a7e34..d49ca263e78b4 100644
>>>> --- a/include/linux/dma-resv.h
>>>> +++ b/include/linux/dma-resv.h
>>>> @@ -285,6 +285,9 @@ int dma_resv_get_fences_rcu(struct dma_resv *obj,
>>>>
>>>>   int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
>>>>
>>>> +int dma_resv_get_singleton_rcu(struct dma_resv *obj, struct dma_fence *extra,
>>>> +                            struct dma_fence **result);
>>>> +
>>>>   long dma_resv_wait_timeout_rcu(struct dma_resv *obj, bool wait_all, bool intr,
>>>>                               unsigned long timeout);
>>>>
>>>> --
>>>> 2.31.1
>>>>
>>> --
>>> Daniel Vetter
>>> Software Engineer, Intel Corporation
>>> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C4bfa8c05efd842e47f3b08d91f7a0121%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637575431134167291%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=8y%2BHz5GldUZK6Ey%2FuZUQUMg%2BObKticrSVX2gx3NBDOw%3D&amp;reserved=0

