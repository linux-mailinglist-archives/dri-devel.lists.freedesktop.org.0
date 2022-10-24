Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D3D60B5DB
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 20:42:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A2E910E3A4;
	Mon, 24 Oct 2022 18:42:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2087.outbound.protection.outlook.com [40.107.212.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F98910E3A4
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 18:42:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gfmp9VIc48vYCR40Wb3NPkBfPMO36Q/jqLTWyJraSOfXM3dHDFXMacBid7VnUtbzZKV64kVEfZWIi2AfCNwKI1+wzA6CxLuLpMoBVolzhoTg/dJHxoBMxGv0PUY9Skz3/hrPqneIdo7oHS8nB4kQCgDJGIc2x4E7PiCQ3pS/gfNZaGSy16ZFbO1ntKau89tNTghfzJ54REjC5h57V9/Nd3ogj3gc/lsJDdyoropzjwt2MqhCO1JFqfTDZybZeLgHdCUaZPIRNHe2ytx/wIeSR1YwWeNtD4Y7HaXiPV7NrD96j5hogBchslABG6GbDMGTJRWlm8BRtwjp/6Jrw9cOng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZmceL8N9Qdo8F3087DWfPtsthcYXHAk2XOz3DbAcmME=;
 b=I5FZtoSDnUOLelC/pd0SeHMhXlcmd6YCp0bKC33TZm/y0FP1Q9Xf6/OE8GGgxhdjoMA0aoawNza0hd912x3PjChycX33t96B2SVLztOj0UTQFf674J+FZhffrfcZE5eH82Plld5+kTQ3fcEYV8s5ymQPiCL1VJN26peacbyTV8I5roplKeqrnJbctghnxHoxuEUFvKTI0gRLvMc3zJ55FVvjKeM+gLpjAKYKqHN2in9k4VxBIw3xOpB3sVpjre8oz4HDnc556/fd5MmfJ+jr0AGM8+xKIXg3eG/HE8e3hgpZ+9fv1aLDHkbyKLXTZ5UMK8DWMW5/gjnDF1WNKlEWPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZmceL8N9Qdo8F3087DWfPtsthcYXHAk2XOz3DbAcmME=;
 b=bA7zkBqel4pEx24vTXYbOGoT/1AWuaWmi6sgxD3ip6Glu7nXIIx+Q6M4vHGIOt/G1yFo24jbhWvjynDto/SHrFqEXEhTY6Po9+oiDRsdnBcMNN/U6IbSljTNhBGUb+xW5xdSFW1waBqAp1Q3scyfWuSWC3sFl9tRCcOrkKraeN4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS7PR12MB5792.namprd12.prod.outlook.com (2603:10b6:8:77::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Mon, 24 Oct
 2022 18:42:22 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a350:f29a:f287:7279]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a350:f29a:f287:7279%4]) with mapi id 15.20.5746.023; Mon, 24 Oct 2022
 18:42:22 +0000
Message-ID: <09b24703-91e9-502a-4136-d7db193f69c3@amd.com>
Date: Mon, 24 Oct 2022 20:42:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH] drm/scheduler: Set the FIFO schedulig policy as the
 default
Content-Language: en-US
To: Luben Tuikov <luben.tuikov@amd.com>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
References: <20221022010945.95560-1-luben.tuikov@amd.com>
 <cc300dfb-93dd-9bdf-540a-07a3891d863e@amd.com>
 <66d383ed-dbb1-ce8b-5eaa-2600982aa6e6@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <66d383ed-dbb1-ce8b-5eaa-2600982aa6e6@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0081.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::7) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS7PR12MB5792:EE_
X-MS-Office365-Filtering-Correlation-Id: fa3ff919-890f-4b5c-596d-08dab5ef7c86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tTQ6ozrLXoD7KZk0hHXISARXqo6qtPJK8gt+OVnnw8HEGYGFlWzT57O24+zoAX8vbD5nnCDJyf0NfF71n0ewe3jCDTMC5qhAXq9fq53yePVVkRvGpkZuPTGsvIjNA105WyCbzOusi8k2dgzypCwBoamkNX/OP6ZKOXCTPCCSSMVrFWGN3dsZsPbJ7eW6lwyU7cP4ASrSJfk0PLLPCKis8/YKtJOQgOM0VGGjEZkFD5q10FJymxgqyZ5X6MAZdDzn/qbKLcU0hNpeWtW+N2ofvEK0oPFg2dPGbVielO2ARABimtHnJjqtG7bS7eW9yKFQISPHPdsemtOF0UBbW11k+/iTlhc40wI7bKUjvXMzXd1T8ajAC8rFiv5Kdct3KwVdNdVaMmNWZG5xWjNcId6sfrEvfI2OVnCHtz0Uiw+75gQAYfRY9y87utWGd6tEny4AonExDBflMiWTgPZJ9wvm7mCWpQQF8Z6qol/S0wi0YThdkPSxiq5wqpz5wlzCipkrtB7aHarqh/F1GjBZwbFj8bPBFVFWwX1ulh1QIZTVwEb9DQE4oSX0O1rYzzLiBS9OOjXY9LQhkpU1cBe1bDK735kQlVz47PsLQbFbR6Cy/x4AGdhgKE7B0ai1D+sqFIhoJdRNyCKK3NzC++S3ORPH8YHWhmHfHZ/IscQi3Uos5S8s6S1ASW9/kcFA11Ff3FHwB76Jbl+k7ytYyf23/FASq/2C4tWsf9JHLj1Q+tgxJnT3OvZ6WXtNSRpcjeNAUvWxO/mqw5476O78LeJEqikIJ8FvyIa4pQv9AwHorvPzSx8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(366004)(396003)(39860400002)(376002)(451199015)(2616005)(5660300002)(66574015)(83380400001)(186003)(38100700002)(31696002)(2906002)(86362001)(4001150100001)(41300700001)(8936002)(478600001)(6506007)(6666004)(6512007)(66556008)(53546011)(8676002)(4326008)(66946007)(316002)(66476007)(110136005)(36756003)(31686004)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEg4OFFxR3JuRU1kNWFUa2dWWnNqSEVGQVJ6TFBHYTFxbW8wdUZmWVlLeHVa?=
 =?utf-8?B?bXhXaFlZS0MzcCsvNGF3QVM1ZHNJSTRqaWRJZ0s2T0VHYm5ydnBBbHZ3NFJi?=
 =?utf-8?B?WFdBMG9rd1FqUml5VTZXbDdXZGUwTnhUSjB6WHZ4dDRkR0RBdXZQdXBOYXp3?=
 =?utf-8?B?cU50bEZmUWQ4Q3hsTGlGQlJDNFNwM0hyT01RVGYrR3QwR0RDUG9kTWRYd3dM?=
 =?utf-8?B?RVZGa0ZzZFVUZFpQTnJ0djR0Zmd2K1k2UW5aSHBkNXlGRm5DVGVpaVJCYzMy?=
 =?utf-8?B?TjgzbCtXUHU2Y1RjVjJHRzlxZkJXb1Bsa1kvaHJBUjJKU2VEbE1abG9SVklS?=
 =?utf-8?B?Z3Q0RTFuR3NRclloYzFmdlNkVEgvUE9aeEFWYm55SExuV0tpZWZRZzJQM1Vp?=
 =?utf-8?B?T2VnQlZ3M1gxcWkxT1gxVUVFcWNuQ0h4ZHMyVkNoNDNIa2NNRzc1aWVBMlI2?=
 =?utf-8?B?Qk1lUVpXKzE4bmtFQ1Q1RmRTZ21EWVZtZHhKNGZoOWpUaENmNXlNQ1M0cm03?=
 =?utf-8?B?SEdvTDlDTHlmNmVuTWZKMDRvcjF2UUVzenczT1hhb2FBbTJCczhsZnRzZGJF?=
 =?utf-8?B?SXBqa21FU3hsaTNaNFRvcEtncXBuR1JjcXg2aUdnM1V5dFZLekczeTNMbEtu?=
 =?utf-8?B?bUtzZjlIOGtBdDVydjBzL1NXKzRJYWpFcENwQzhYdVhWMkQ2MVNDV0l5UnJG?=
 =?utf-8?B?S3pZenk0eFpORC9KVUF2Vjd0TDBxUmNNVWxwME5CUnRQbkdiYXdZZWNLVlVm?=
 =?utf-8?B?cXpLVG9RSG1QVmIrQWhHN29Gd2JmVVJveVVUQndDeUJDajJhdVY0WHZLMC9D?=
 =?utf-8?B?aVlkenZhVXdnYXVZRFR6WDVUWUphekkyRmdTejlmUWxEa3JBbjd6Sk40d3du?=
 =?utf-8?B?M0VYekFLTGczK2t6eE9yV0w5anl0Snl6dmZ3K2lsVjFCOEFRWVQyRFNIQlZ1?=
 =?utf-8?B?NTZHdEszay8rUDkvb3QyRVJHY1JvQ2xDcUtNc2JZbVYwZEc3eWF0TEFXMThm?=
 =?utf-8?B?MFI3bTRGdG1zdTNPLzc4c0lTbEJseDJkYjkyS0E2M3lnY1JGL3FWZFBDQWFP?=
 =?utf-8?B?eHRFQzV1QlgrdTdhc1hENWhUNEZoUDNrN1VXTDBxdHQ1RmdlRldqZWFFMWgx?=
 =?utf-8?B?Wnlud0RLOTBMNG5UT0NCQnlVbGxTY1BOTnJoWFBlUzRIVnFjeVVLS2NCMkhF?=
 =?utf-8?B?MVZjTDBuWnBEVU1DWU4ray9aSndkdEE1QTdPMTR3ZTN2MjY3cE5uL0FFS1hB?=
 =?utf-8?B?U2dTaHNJeGIzNXRveEttRnRUMTJFaXFVVks0UTFVVlMvSk5yZ2R5RkhrRHVQ?=
 =?utf-8?B?WTNEc0Fib255NFdNNk95cjZzNjM4WmNMKzR6U2ZGZ3dEdENueXhQVGdaNEVW?=
 =?utf-8?B?QXB2QTgxZnJlU3Y5ZFhuK1phOW5tQjF3eHNmdElTNGJhNjNjWUdFaGYzL0sx?=
 =?utf-8?B?ZFo4RTZVVlo1dWxaQVdIbWpyTkpScFpES1lmU3BlaGVvU29mZFl6d3c5UE81?=
 =?utf-8?B?aTk4bVVHaGxoRUprTXowZ3oxdm1IRTR3cEtHNjE3cStRV0RQVG11RjRtRHhQ?=
 =?utf-8?B?NGdUOS9FZFhGSUxab0NUWkhDVndYQkxBYnZRY2I5bEo0RGh0b1FOaFdKd0tl?=
 =?utf-8?B?ZWVoTlpzcjB1Z0hyRUNlMHp4TVJQbnRlNElGUzhXOFFobkt2K202NUNVYkFG?=
 =?utf-8?B?YlZ4cUpEdzNYYVBtRmxCNzRrR3BkamRyU1ZHZXNPNDNKa1AwTDVLOVcyTks4?=
 =?utf-8?B?NU9RQWR2VkZTNFF4Q2FYWGVZRk9ReDlNSlE2bFpBajgrcnkxZWZXQ2VVY1lL?=
 =?utf-8?B?cTEzMFVsNFRNWFArRWRUSlFHMjlId1NGTDhQOS9XeUE0YnRNMEk3WXZBYWJE?=
 =?utf-8?B?OFFOcmpTZzBRamtJY0lKeUYzSWxNNk51eU1mYkwzSEFVNkxnQkF0eU9MTXlZ?=
 =?utf-8?B?KzFrR00yNjJNbjhFL2JoQy9tZXpVbUlnWHlLYmtUaUJ0bHhDUTR5Y1g5bnJH?=
 =?utf-8?B?eWdoVDNXeUMvR05pQ0c3aGNFQVBnazdUZmIva3pPdmR3VCtSYzBXa2l5bUtV?=
 =?utf-8?B?Z0c3SU1kOG45bkdpRUdxOVhTMDJha0NyMjlIRDVxVWEvbzhCUDNWbmhOdzV0?=
 =?utf-8?B?Q3ZTL3VtUXN2djNWclhqa0lBUGl2eWE4WTUrcm9jVGNOTi9Kd0EwWk4wbm5X?=
 =?utf-8?Q?XUZtLXe0KOB7tKEiz/Duqjpech3IlocAhLM4sZG6jNVD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa3ff919-890f-4b5c-596d-08dab5ef7c86
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 18:42:21.9368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gzqEtmu5I2c2eCFjFQWISolditfMBk9bxNXdFnbReqaBGAGTD1uiqbdaI1KjicPB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5792
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
Cc: Alex Deucher <Alexander.Deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I've seen that one, but couldn't figure out what was actually changed 
between the two.

If you just fixed a typo feel free to add my R-B to this one as well.

Christian.

Am 24.10.22 um 19:25 schrieb Luben Tuikov:
> Hi Christian,
>
> Can you add an R-B to V1 of this patch, as the v1 is what I'd like pushed.
> I sent it right after this one.
>
> Regards,
> Luben
>
> On 2022-10-24 06:42, Christian König wrote:
>> Am 22.10.22 um 03:09 schrieb Luben Tuikov:
>>> The currently default Round-Robin GPU scheduling can result in starvation
>>> of entities which have a large number of jobs, over entities which have
>>> a very small number of jobs (single digit).
>>>
>>> This can be illustrated in the following diagram, where jobs are
>>> alphabetized to show their chronological order of arrival, where job A is
>>> the oldest, B is the second oldest, and so on, to J, the most recent job to
>>> arrive.
>>>
>>>       ---> entities
>>> j | H-F-----A--E--I--
>>> o | --G-----B-----J--
>>> b | --------C--------
>>> s\/ --------D--------
>>>
>>> WLOG, asuming all jobs are "ready", then a R-R scheduling will execute them
>>> in the following order (a slice off of the top of the entities' list),
>>>
>>> H, F, A, E, I, G, B, J, C, D.
>>>
>>> However, to mitigate job starvation, we'd rather execute C and D before E,
>>> and so on, given, of course, that they're all ready to be executed.
>>>
>>> So, if all jobs are ready at this instant, the order of execution for this
>>> and the next 9 instances of picking the next job to execute, should really
>>> be,
>>>
>>> A, B, C, D, E, F, G, H, I, J,
>>>
>>> which is their chronological order. The only reason for this order to be
>>> broken, is if an older job is not yet ready, but a younger job is ready, at
>>> an instant of picking a new job to execute. For instance if job C wasn't
>>> ready at time 2, but job D was ready, then we'd pick job D, like this:
>>>
>>> 0 +1 +2  ...
>>> A, B, D, ...
>>>
>>> And from then on, C would be preferred before all other jobs, if it is ready
>>> at the time when a new job for execution is picked. So, if C became ready
>>> two steps later, the execution order would look like this:
>>>
>>> ......0 +1 +2  ...
>>> A, B, D, E, C, F, G, H, I, J
>>>
>>> This is what the FIFO GPU scheduling algorithm achieves. It uses a
>>> Red-Black tree to keep jobs sorted in chronological order, where picking
>>> the oldest job is O(1) (we use the "cached" structure), and balancing the
>>> tree is O(log n). IOW, it picks the *oldest ready* job to execute now.
>>>
>>> The implemntation is already in the kernel, and this commit only changes
>>> the default GPU scheduling algorithm to use.
>>>
>>> This was tested and achieves about 1% faster performance over the Round
>>> Robin algorithm.
>>>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Alex Deucher <Alexander.Deucher@amd.com>
>>> Cc: Direct Rendering Infrastructure - Development <dri-devel@lists.freedesktop.org>
>>> Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>
>>> ---
>>>    drivers/gpu/drm/scheduler/sched_main.c | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 2fab218d708279..d0ff9e11cb69fa 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -62,13 +62,13 @@
>>>    #define to_drm_sched_job(sched_job)		\
>>>    		container_of((sched_job), struct drm_sched_job, queue_node)
>>>    
>>> -int drm_sched_policy = DRM_SCHED_POLICY_RR;
>>> +int drm_sched_policy = DRM_SCHED_POLICY_FIFO;
>>>    
>>>    /**
>>>     * DOC: sched_policy (int)
>>>     * Used to override default entities scheduling policy in a run queue.
>>>     */
>>> -MODULE_PARM_DESC(sched_policy, "Specify schedule policy for entities on a runqueue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin (default), " __stringify(DRM_SCHED_POLICY_FIFO) " = use FIFO.");
>>> +MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO (default).");
>>>    module_param_named(sched_policy, drm_sched_policy, int, 0444);
>>>    
>>>    static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
>>>
>>> base-commit: 16d2a3f2ad1d2b95bf9122c910c63b0efe74179d

