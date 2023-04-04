Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26ABC6D625D
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 15:10:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19E4410E68C;
	Tue,  4 Apr 2023 13:10:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2050.outbound.protection.outlook.com [40.107.223.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17A0310E684;
 Tue,  4 Apr 2023 13:10:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fU5nzeZVCVAP7qdeMwEJqlpI4Szhvqfy3IzhznpqHrKco/Zgf6UBBbqf1N8N6m5oZENBN96v154E5eqk2/Q/LDq2GRH72jsycXsUVWSY16/2wJ2omMHMGvaRT+ar5x85Mx2JVQehgGLLNSIkIxOY+Zg+u02fld/WLUKkUq3g10bTItRm2fMEJWimY3Z6aLvAy14nVdc4Qr0quum7auWk9eqsKAsSi/6N0ZqtZJehrftLNL/CA2cKMk187ucQVQ4sqBgufIK3Np3g58EjyQzaPtKyeLPlXwKLGpywRhDKDvbeJvDVVN0w1GO9mmzBwjG1MFFrHU1Agh+boTlZ0gNuAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=It9veax6SVwshQijZhqRAeZ9fvNLMQlFby57lFuVvvo=;
 b=dkM5fpsuRDRjO6G3XLkPDOKvJ4oPF5n6hJl0JJ9BUxnYUjdslZr1GMMEjFt8rbzC9YDQQDDUx9mpRHXnFBpnEtGFo77Zsca1tpezLujhUaOUqIf/qZnvsqGliCtl2pRwC7Znz//j8LEk3aPcDY4mmh6yjcvfDf1jePAfbC5Xejujg7nasRa9rQn86OnG4zAJj1xFMOdM12b/9Ewu7mBQJ4nmcjxKtI3I1GZdyhFiWIC6H1h5IQ4Pveq1dwNK+N5jbWCVT8qJx9VrYBIgFrpc4SbAsEpbg4VhwfEAXzjSq3fsbpy5UpsnIXUDbLAH2XeNyCzK8NEWYFGNA9oCxyx0bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=It9veax6SVwshQijZhqRAeZ9fvNLMQlFby57lFuVvvo=;
 b=KvWPnQ70JYsIUvz1IyrMyrHAXaTwJ+T+LLDTbT8+TlVKZ4EXIuuFmFuD683skzAukEXlfdaDiufOlG6uxmMZ4cS9quuDQV9QypqIaMUH7tH3M4Wtb9v0uuzZT3/ufl2xodwLGlR9V4eH+BQFvhW46IPy5gjlw6Ar+xO8Y0TbueE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS0PR12MB8320.namprd12.prod.outlook.com (2603:10b6:8:f8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 13:10:29 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae%5]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 13:10:29 +0000
Message-ID: <5b2e6a78-b743-028c-f54d-af38c130164a@amd.com>
Date: Tue, 4 Apr 2023 15:10:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH 08/10] dma-buf/dma-fence: Introduce long-running
 completion fences
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <20230404002211.3611376-9-matthew.brost@intel.com>
 <e5eb5ab0-8e51-389c-34ae-7c6004f4b1ba@amd.com>
 <f7b3b70b-c798-b09e-210c-f84eaafd3251@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <f7b3b70b-c798-b09e-210c-f84eaafd3251@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM8P189CA0018.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::23) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS0PR12MB8320:EE_
X-MS-Office365-Filtering-Correlation-Id: e18f27c3-1a2d-44d5-60c2-08db350df695
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +2T46QaKF0XKBDy/FSKIhsg1CRjIzDHsQAm3/0jFJ517oR36WMPv9DyEUQ5ImAZGWWQ57kn2foDAYU2NfBcz4wq2Ii6QwmsyzJfpYkIwauvj/jl+lUXQR3Poo81yGYdpSlsCEr3/v7yFQoxVRwXyKPnuTL+zL+fobSOwLvXwAyfXGh98GxNAgn27bOfUF55xyioLnHrUkpVS2mCl6KBQRyN3y8MEHp1DBmZ8F1ETkAEEquwvduGQLYOPiJGesfqLDBzhr7k/e/orW4C1qYIvbOh9rJ/qSxR8Al7W1iNPVRQiMjszX3hGLFB1wDwlW6oejwC3pRg90hKuxL68rDVzXk4GHl2ZRXSyHT3A+snhGK7Zv8j/fWBujwmQXnOnxuSrQQSC+q1drAqd+s7wUz2HMc0HXpoNjqyz+3HUM6Gsl+NGhe3lA2id0dByS7+RF8rsAv1+ondg/2JrrmureOI5NElWrsZN6ypIUwdpzj5lR/fe97buE+SSKrfq1HKO7KW+XwD6iCZZlQRmV9hcgK/DCmL9VAyDVQQf8TdwyGdiMPdoSPbD2I5yRN4f2lQCjnsi08LmW0uY29whFMRcjHlyfZmBdvdpOUz0YM0SphajikdJ75kFaJtUdQ7svIYjiOaprdFpgWtVOYqRFROR06t0TQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(451199021)(86362001)(31696002)(36756003)(2906002)(31686004)(2616005)(966005)(6486002)(186003)(53546011)(66574015)(83380400001)(6512007)(6506007)(26005)(6666004)(8676002)(66946007)(66556008)(66476007)(478600001)(4326008)(7416002)(38100700002)(5660300002)(41300700001)(110136005)(316002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmQ1Zmw3TWE2a1B0QThWZllWM05VSkdXdGVEaC9CMTZyZ0JLd1BFUlVJdy84?=
 =?utf-8?B?cXg3RnJESzJtNWpkV3lzREU3d01iWUY5N0MxS2Vrbm5mZkw3Wk9PVElxcFRp?=
 =?utf-8?B?bklZZXRiV3l4ejVrckt4RmlaMGVUV1RrL1Vhb2V5bnlJWWNSUHpzZ3J3dytx?=
 =?utf-8?B?MmJsQkZzUWRlc3VDYVh3OGgyV292akhnb3ZDV201emlyMitFeFpOWGpDb0dD?=
 =?utf-8?B?MjM3eHRQelY5MS9RRWJ1TFdPeXl2TVJXNy91dWp5VytNWW9TaFB3QmR6dmZ2?=
 =?utf-8?B?WElzczE0cU1jMXdQSVoyallYTkxONFgzSGFVOGpXSmlxUGh2cGZzVmNObThN?=
 =?utf-8?B?b04vWXAvZjJyMk1nR2gxTk8vZUdhd0ttSTJoRDV3R2ZXR1FrOTVDTnF4Ty9Q?=
 =?utf-8?B?MmxmZUE0OVpLVi8xSkVSNmFUOWhqSEF4dEtPMElUR3JQRlJkcjRYUVlOQ3cy?=
 =?utf-8?B?b2ZHWjQ4WVJKcEhWS29GL0dsblAxOTR4VWZqVUNpREZPUncyUVF4aG0yWkhm?=
 =?utf-8?B?RWNhWEh5dTUxMFliWmUwTkozSHZrWmZWdXpCYkRrM0VITjRvNEU4SmJiTzZa?=
 =?utf-8?B?aHZHVmdWN0drNVBHdE5aRHpwMFNSdU1MZTdzTlR2YWgwa0NWTHFubGZocm9U?=
 =?utf-8?B?S3NuaFNQd3V2WFhwZjFuQlgzTUowemxLVmRKVWc2Q1RKUVhDMWNzclZ5NDkv?=
 =?utf-8?B?aUp3RGJCYVp5Z0U5N2RseEwvU2M5bHZReWIyNGd1NWFLYlZDcmtyVWpNMnJW?=
 =?utf-8?B?WW1YMXpGU0JLdWVRNU9LTWt5bTdmNVZxSFF2OHdWVStaTnI0TnZJc2RvM1RQ?=
 =?utf-8?B?b3RDQTVkMVIxVDhtNnRBVkI5KzFIK2VBaURnTXVMd3gvMW51K0hKWFFsUXBX?=
 =?utf-8?B?NlhialJLdVpmYkc3ZUkvZnMvK1NJZEY5OUJ0UFBpMllSWVN6TnF6QlRxV2J4?=
 =?utf-8?B?NE1iMG9JYVBoWmZMY2VuVG9wemRnelJxNG0vM0JId3hWbTQ4WFZ5T0NwSlZS?=
 =?utf-8?B?TDZFVjF5WGVYZ2NUVmRobDUxWUFWN3Z1Y25FVXpmSnVUM3FPRG5QQWpSK1h6?=
 =?utf-8?B?aHFLclU3eWFrMVFKajJSNDduVFJiUy9yRVMzK2tRQTd2U2RyOEd4U2didkRx?=
 =?utf-8?B?R1B2VVZtK0liVStWZlVyOVFhZHdRMW5HSW1Dc3hoSmhqRWZ0TUxyc04xNFM0?=
 =?utf-8?B?VEhyY1BEd2JuWWo0U2pjQzN3VmdqdnE0bXZadUlyTGpLRDRuVWZuVjdnZFFs?=
 =?utf-8?B?cEp5MHBsaTl5WlJvM09zU3VoWFhRc0I4OHN2aTJ4bE5rWjJ1L0VmcEoxT01B?=
 =?utf-8?B?aXNWMUJONXR5WGNNMUhnYTgxclRYeEliZjNLYW9QeFJJaDdFYUNQUUdJbkN1?=
 =?utf-8?B?Rm54L3VqV3d6dWppci9oNEpGQUo4K3ZmcXpjSkUyVGNBV1JyOGV1Ty9hcEF4?=
 =?utf-8?B?NkZnY0lyc09PM2NmRHoxY0Q3TlEvL0I0bElVNWprMW1iVjYwOGZZL05janB4?=
 =?utf-8?B?NkM0T1dlQUlaYy9SUEFibkZrV0s3NFV2STA2aGJHendTbWJlZzgyNFU0UlJn?=
 =?utf-8?B?cFc2MGtGZU9hYTdUdEtWcjR0eURDMmNJWG1vekJhTElhQUJ6RTRMTnlQTDdY?=
 =?utf-8?B?U05mNnZUNmx6WE11VVZWZXVXWDBLbmp3RmV4MklCd1pnZ1loRG5zYjNHVXJT?=
 =?utf-8?B?Z2cwRktBWlRSNkdtL3AvWnp2Tmx2TUZBTC96K3FEVDI1b0pJUDRJQXhOemI5?=
 =?utf-8?B?cmdTV2NNektoZE96NW5NZDdGQndiSCswaWZJY2Npdkx6Y0FsSWRsRFRaYlBw?=
 =?utf-8?B?bUE0QnZ3aWova3dOUG5DKytFQXlkbXRUOGlUWmFVaTcralBVOHhJSDUzV1I3?=
 =?utf-8?B?cWpoQi82UmUvMStsZytYeWgrSEdqVzV6V3lsMXBOOEowL2xLVWZnVk1JK2lU?=
 =?utf-8?B?T2FkT09WOENaTU96WUdQUGR3amVuaEZOamxvUmdKMjJOb0xtcmZKc0hPekVW?=
 =?utf-8?B?ejBsN0pQL1NaMURsS296NTlTdVVxVG44VzE5YTVBYWpRczdDZkVUcnVQVHc4?=
 =?utf-8?B?YWlRYVlMME9CRVVHdDljUGxicXl4NVVlMVh3MlMvOVgvYnZFMjVaK0VPS3py?=
 =?utf-8?Q?b1/4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e18f27c3-1a2d-44d5-60c2-08db350df695
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 13:10:29.3306 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hrpus9dbTTHa6qCCUc/cm9fMeJkGiqf8fnh0AZoOSHbEZ2AhZ/OYo78iKnmEyV/N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8320
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
Cc: robdclark@chromium.org, airlied@linux.ie, lina@asahilina.net,
 boris.brezillon@collabora.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 04.04.23 um 14:54 schrieb Thomas Hellström:
> Hi, Christian,
>
> On 4/4/23 11:09, Christian König wrote:
>> Am 04.04.23 um 02:22 schrieb Matthew Brost:
>>> From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>
>>> For long-running workloads, drivers either need to open-code completion
>>> waits, invent their own synchronization primitives or internally use
>>> dma-fences that do not obey the cross-driver dma-fence protocol, but
>>> without any lockdep annotation all these approaches are error prone.
>>>
>>> So since for example the drm scheduler uses dma-fences it is 
>>> desirable for
>>> a driver to be able to use it for throttling and error handling also 
>>> with
>>> internal dma-fences tha do not obey the cros-driver dma-fence protocol.
>>>
>>> Introduce long-running completion fences in form of dma-fences, and add
>>> lockdep annotation for them. In particular:
>>>
>>> * Do not allow waiting under any memory management locks.
>>> * Do not allow to attach them to a dma-resv object.
>>> * Introduce a new interface for adding callbacks making the helper 
>>> adding
>>>    a callback sign off on that it is aware that the dma-fence may not
>>>    complete anytime soon. Typically this will be the scheduler chaining
>>>    a new long-running fence on another one.
>>
>> Well that's pretty much what I tried before: 
>> https://lwn.net/Articles/893704/
>>
>> And the reasons why it was rejected haven't changed.
>>
>> Regards,
>> Christian.
>>
> Yes, TBH this was mostly to get discussion going how we'd best tackle 
> this problem while being able to reuse the scheduler for long-running 
> workloads.
>
> I couldn't see any clear decision on your series, though, but one main 
> difference I see is that this is intended for driver-internal use 
> only. (I'm counting using the drm_scheduler as a helper for 
> driver-private use). This is by no means a way to try tackle the 
> indefinite fence problem.

Well this was just my latest try to tackle this, but essentially the 
problems are the same as with your approach: When we express such 
operations as dma_fence there is always the change that we leak that 
somewhere.

My approach of adding a flag noting that this operation is dangerous and 
can't be synced with something memory management depends on tried to 
contain this as much as possible, but Daniel still pretty clearly 
rejected it (for good reasons I think).

>
> We could ofc invent a completely different data-type that abstracts 
> the synchronization the scheduler needs in the long-running case, or 
> each driver could hack something up, like sleeping in the 
> prepare_job() or run_job() callback for throttling, but those waits 
> should still be annotated in one way or annotated one way or another 
> (and probably in a similar way across drivers) to make sure we don't 
> do anything bad.
>
>  So any suggestions as to what would be the better solution here would 
> be appreciated.

Mhm, do we really the the GPU scheduler for that?

I mean in the 1 to 1 case  you basically just need a component which 
collects the dependencies as dma_fence and if all of them are fulfilled 
schedules a work item.

As long as the work item itself doesn't produce a dma_fence it can then 
still just wait for other none dma_fence dependencies.

Then the work function could submit the work and wait for the result.

The work item would then pretty much represent what you want, you can 
wait for it to finish and pass it along as long running dependency.

Maybe give it a funky name and wrap it up in a structure, but that's 
basically it.

Regards,
Christian.

>
> Thanks,
>
> Thomas
>
>
>
>
>

