Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8C060B91E
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 22:04:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2C0910E068;
	Mon, 24 Oct 2022 20:03:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49C3B10E068
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 20:03:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K1rfWaiQCEyh3qDlpkauenZF/kM3JtinOhJioog6IUrDoDerFAtpye7j3fj9I4nx06tf3Qv8B5lSldUfFcsa71FH8ngz3rsvpvZEqf3wYUuct9pT7euuKUOUtF4yENETuUX9J4tgHZXIgbzidTuwMPiS594kQGN3jOOSRsKGHTQAhdVjN6KccIEUI4xKKFfMIJWZHmu0RGtzPm2uzp+xVY2T8m7DxWPIcGAfx70E7FgiE3DuBk/9Mdh3op1aXPcNVau569M4MpqNlDKf//7ieJb9sgP++kGb8DJBWPpIdCylA4xWjd4o7aTb/A/wR5ElOvdnDRgwDmTmFG0vSlCWXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fzezkIs0ZeTr3pzPyda8joNw4wPjFPH/47uRD8AIsCI=;
 b=jiBG8vrAmAYGxIhs88hMLVlVGhLvC7aTLC2j4ZMmiBNHOZipUACPz4lYQzedm2mHggJTNB7Bhw/MKkhCZu+uiYWapCFQh/NyGjS8yujRNHvWfldYTpjYkl32/lBeXQ+UN3cqaIBpEfVCAbWwKjL/BnvAFbYYkydUmjbBULSvxNNoX4n85yyPkDW06mJ4owmYQHotH95NpgajK2hvx+nG1gMtVNW1wfYsdLuU0rKS7RoUxaw6GAqO82MJZBeitOtl+jsOeTvyXMILZrhZabrScZ23tqXstrXb/xYprpTIKys9UChez1Ac8a7UFGTL8Ow5pTJ76jJYqgg1mDYRU5qGSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fzezkIs0ZeTr3pzPyda8joNw4wPjFPH/47uRD8AIsCI=;
 b=G46UFAL/BPX7X7LMSjiG6G6oXOivZNtWOw4QWIF/4UCjFkb3xEUa5DpbTD0/fHhf7D7XisKyXWGtO4J5UZ0Cc2iKsuGtGq+je8++3v9PnGVadj2F8DwYGqaS52d2r+l4IfBfVyH1LBHnz/Ot5RCxrvzQatyD+66EozyIMl3mdlY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 CH2PR12MB4940.namprd12.prod.outlook.com (2603:10b6:610:65::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.27; Mon, 24 Oct 2022 20:03:51 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425%7]) with mapi id 15.20.5746.026; Mon, 24 Oct 2022
 20:03:51 +0000
Message-ID: <b869a105-94b9-037a-6a84-f0876e952693@amd.com>
Date: Mon, 24 Oct 2022 16:03:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [RFC PATCH] drm/scheduler: Set the FIFO schedulig policy as the
 default
Content-Language: en-CA
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
References: <20221022010945.95560-1-luben.tuikov@amd.com>
 <cc300dfb-93dd-9bdf-540a-07a3891d863e@amd.com>
 <66d383ed-dbb1-ce8b-5eaa-2600982aa6e6@amd.com>
 <09b24703-91e9-502a-4136-d7db193f69c3@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <09b24703-91e9-502a-4136-d7db193f69c3@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0145.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::14) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|CH2PR12MB4940:EE_
X-MS-Office365-Filtering-Correlation-Id: 7420ddab-eec8-4b15-85fa-08dab5fadec5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ro6eE9jhAtC2Qzh2UMJmBCp/5ye3L/q7iKmu+cZXcsAfYbNv3nDsgeTupxGLQ1btYRBACozsx9PryrGIpphHbOO/vqiglMvLaN5Dguqmv67Xam4sf63msrvfKFyzlvUgjtvYMdriVkO2+9WSkplSFAbjs7csCwO9eeiubFWVnCpoCP3nkEnEPM27lLCWGClL7UxV/dzzJv2bPQKNvmKAaYnwjbeXLm51sv8gSH4bhIcCfhmFLVux8+OCBarGedvYezwMfytwu/o/x2vWLb9/YtD+Lj4i6jQs6rgYM9RW+XLGfHkLST/bgd+zmYJi7SABK/LdTn9ibJ2Au98/dvN1xtu1rxNtIXQVdw5C6nzHBosZWCVD/nk7OX6/iRaVuwMiRUmaAbgh/bg2a+ug2h62C7iIWdjBO868d5N5/tQQFbYdJYssYGG+ovUjynUZMXHXukHTH7Z4fcNqVZ2NhMzzpJrcyanUhOmzpYx864VCKeumd0Q8RyKkmbFNGINu44QhbxCRsuJXegkz+6IvYsVUZGOP63bWvrNlXXs7e4B9x33c8ZGUD56YqqXldQAsb98wYO9TmfYQghzvcaEZYBrdCRmWrouvdIY7q1fFyHKjgy40tLWu8e2BK4xNeBk6XRXNXYeQSbBxumAY+CZjQ+b82AuR0GcJ3RPW4Pgu71g0dde+LCpX1kbCKfxPc3Qz1eu4QNZjDAJs6T+qcivSIi0XsrgzI4z5mCPPumlGjZQ1z6mrzszrmyUbHK2ge4/H7lRHuRY77mB2H0GluY/uyuD2FEvXflJLHWZeDYMztQzeiME=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(346002)(136003)(366004)(396003)(451199015)(4001150100001)(36756003)(44832011)(2906002)(5660300002)(8936002)(8676002)(4326008)(110136005)(66556008)(41300700001)(66946007)(31696002)(86362001)(66476007)(316002)(6506007)(26005)(6512007)(53546011)(83380400001)(66574015)(2616005)(186003)(38100700002)(6666004)(6486002)(478600001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ME1GdnA1bDFDaEl6bFJ3VnRadml4KzlUdThQZnZnWjdic2pGNzR1SCtMbVFI?=
 =?utf-8?B?VFRVbTJwWVhUeFVuQXdCdGI5V2lzeU0ybXVJQUNZaVRpbnlXTW1vNFpOSUdN?=
 =?utf-8?B?eDAvZEFsVkxTMysreFlXTk9oazdkZERLRUZMY0kyWlI1TGtRZUdnczlLZGlH?=
 =?utf-8?B?YUJ2TThhNWExZnFvYmlGMC82VWhxSzl3QWFrVzRSNFp1MDVmRGxHUXR6aW1j?=
 =?utf-8?B?Q2E3STZRRG8yem9WSGRTT09hRlVFVkowbE85WXRpRWVuVW0xMlhHYmRZc1Ey?=
 =?utf-8?B?Z1pVWVduWS9RVU4wamw3YjNTK2xjNDB6bmVxUVkzNFFkWEhmTWhldWJxU1Bu?=
 =?utf-8?B?c1llMFU3OXk0NWh4VEhJRmhBQncyVTB6OUQvb2dncFBvUGk5dXdFMDl6RzF4?=
 =?utf-8?B?UUFRK1c1L1VmdXBwTWh5bUFDUmtUbm9FQWRTMVBvLzRtbUlnQi9hV3pHM3k0?=
 =?utf-8?B?RkJyTWpMT3B0RHNXWksxemdsQkk5NEFMUW9HT0liaUhVNnFPVlBuK1pFZlNt?=
 =?utf-8?B?VHcrTGM1Nys4bGNCcUdVa2k0QUl3YVRzb2RBdmh5OU1DUTd6MXVzU0lZMzBC?=
 =?utf-8?B?Rko4aVRydldId2tUZGNUTFlvQ1lZUGptM0djamViMkh3aE9PSjdYdEpIZ0Fw?=
 =?utf-8?B?UyswWW5MTTNrdmQ5NlM5Q1hTQ1RpM3V6TXVudU1BQnFOcXNjZkdCQUNPNW5h?=
 =?utf-8?B?Y01ObVlNdVpuTTJzNHgxY0FyZ3VIOGs2N1l5RENkRVN5M3UyZDRpbVc5dXFG?=
 =?utf-8?B?T1NKVERrVGJ0Y3p1bEtVcW42Tk1wblhNZ081SVpOcysyNlhkNmFLUGl5NVdp?=
 =?utf-8?B?WE12S0dXMFduK01JMG5IbHYxbyttblJzLzA3WTIxTmthNzJjblhXSHlFM2pM?=
 =?utf-8?B?Tll5Z2dTekJHR2ZHZ2hrZmh4ZWV6MXN6Qmphd1I3UGxXaFVGbXVJOWlwaktJ?=
 =?utf-8?B?Sk9SQTV3SEpjMnNZRmoyd0grcE1rQ2RiQ3AyN0pENFM0cTV4TFQycGZlZUZn?=
 =?utf-8?B?MzNBUlRoUGxrdnJTRjE3WTUwdVRvWWNLRTcxeEIrWVVpYVQ0SVBrN1lQRGMw?=
 =?utf-8?B?MG55aEgvaitYWWZrSHFqQzRYcXM2VC8rR3VmTjZ3QlZLY29LcXQxbC9lYms1?=
 =?utf-8?B?eDZ0azg1TkxSblVuczEwbDd5VU5JRmwvd0Eza0V3Y1JzTFVQK29CQitaNTF0?=
 =?utf-8?B?bnNtVk8xUmhGTysvdzdENXNJakEyT3Z2NE10a29qdkF6cnh6ZEYraFgvV1Nv?=
 =?utf-8?B?cjVRYXBRRjJBN2NEcUV2V0hkQm1zbDRKR0JHTFg3ZDc3VFZIeG9YWEExOTQ5?=
 =?utf-8?B?eEF1U29UNXJrOEY2Z05KdUttNHA5M0dIQXd5Wm5NV1J0djZzeEIvRmNLdDZS?=
 =?utf-8?B?a0NtY1luaHNCTjc1YW1UN0hGZXNHWkhSdldaeHB4Q3pMT29yNE8xSm5WWnpH?=
 =?utf-8?B?cVc1NTBFbzlIUHdzQmFZeXJmakVTOGdKNDdVSzNFdlNYOEx2bUM3L2d3b0dm?=
 =?utf-8?B?ZEtNQTIrQ2hvTDZodm92T244Y3JVYzJTRlg5STJtSXR3cm1halkyaFNScG1K?=
 =?utf-8?B?OWJML24wM21EbGFIbDIyT3U1dk05eWZQalN6NDdja2Uwbm1PeGpISU55Y290?=
 =?utf-8?B?alA5dkJldkt3OGFpVFdsb0prU29ydkk3ejlLekZEZFR3VURjWVFHb0tkbFUz?=
 =?utf-8?B?dVRlRGFSdnVJVzFCS09kT3VKOGlpclF2S3M5OWNBbHE5Z0RtZ1ovTnA4eEx3?=
 =?utf-8?B?ZjVEOXRNd0NOTjFYOUU0bzcyNHhuOFBXazNpTzhWZnBnTE9vbWZSZ2czaUVW?=
 =?utf-8?B?QlJLVmRTb0pjNFNxSnFCcTAyVGl4NWtqaGR4Um1rZHNJV0FJam5SVjJsdlo0?=
 =?utf-8?B?eDJpd0VaZ3dyOGpFV1l6RS9vTElVSVRCRWxTb1JRekd1R1pzdnBuenN4UEh0?=
 =?utf-8?B?cDMrZjJGNDE1UGZsSWw0Q1Y0NGdxdmpnYjFzQ01aMWx3dGtlR2E3cGFpTDls?=
 =?utf-8?B?RVRycFIyLzlCbXgxYlZOTnBBSUs5QmFMaW5aL0NReFFjSjdwalRpenB5NVBq?=
 =?utf-8?B?Ryt5R0t3NjU2cFN3aStHeisxd2lwbFkvOENLbzBpTytEc090RjR0cnNPOURD?=
 =?utf-8?Q?0dQEw9qo02TqqRZ6ebn1xWL0b?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7420ddab-eec8-4b15-85fa-08dab5fadec5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 20:03:51.1847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aQOrPWYnxg6K4Qyzx1NWNPgJE6OoiuEphmCNi9a2dCzw9V6tRpJVYdbqBVVs+NRl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4940
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

Yeah, it was just spelling typos. I'll add your RB to it and repost.
I cannot push to drm-misc-next, but hope someone will pick it up.

Regards,
Luben

On 2022-10-24 14:42, Christian König wrote:
> I've seen that one, but couldn't figure out what was actually changed 
> between the two.
> 
> If you just fixed a typo feel free to add my R-B to this one as well.
> 
> Christian.
> 
> Am 24.10.22 um 19:25 schrieb Luben Tuikov:
>> Hi Christian,
>>
>> Can you add an R-B to V1 of this patch, as the v1 is what I'd like pushed.
>> I sent it right after this one.
>>
>> Regards,
>> Luben
>>
>> On 2022-10-24 06:42, Christian König wrote:
>>> Am 22.10.22 um 03:09 schrieb Luben Tuikov:
>>>> The currently default Round-Robin GPU scheduling can result in starvation
>>>> of entities which have a large number of jobs, over entities which have
>>>> a very small number of jobs (single digit).
>>>>
>>>> This can be illustrated in the following diagram, where jobs are
>>>> alphabetized to show their chronological order of arrival, where job A is
>>>> the oldest, B is the second oldest, and so on, to J, the most recent job to
>>>> arrive.
>>>>
>>>>       ---> entities
>>>> j | H-F-----A--E--I--
>>>> o | --G-----B-----J--
>>>> b | --------C--------
>>>> s\/ --------D--------
>>>>
>>>> WLOG, asuming all jobs are "ready", then a R-R scheduling will execute them
>>>> in the following order (a slice off of the top of the entities' list),
>>>>
>>>> H, F, A, E, I, G, B, J, C, D.
>>>>
>>>> However, to mitigate job starvation, we'd rather execute C and D before E,
>>>> and so on, given, of course, that they're all ready to be executed.
>>>>
>>>> So, if all jobs are ready at this instant, the order of execution for this
>>>> and the next 9 instances of picking the next job to execute, should really
>>>> be,
>>>>
>>>> A, B, C, D, E, F, G, H, I, J,
>>>>
>>>> which is their chronological order. The only reason for this order to be
>>>> broken, is if an older job is not yet ready, but a younger job is ready, at
>>>> an instant of picking a new job to execute. For instance if job C wasn't
>>>> ready at time 2, but job D was ready, then we'd pick job D, like this:
>>>>
>>>> 0 +1 +2  ...
>>>> A, B, D, ...
>>>>
>>>> And from then on, C would be preferred before all other jobs, if it is ready
>>>> at the time when a new job for execution is picked. So, if C became ready
>>>> two steps later, the execution order would look like this:
>>>>
>>>> ......0 +1 +2  ...
>>>> A, B, D, E, C, F, G, H, I, J
>>>>
>>>> This is what the FIFO GPU scheduling algorithm achieves. It uses a
>>>> Red-Black tree to keep jobs sorted in chronological order, where picking
>>>> the oldest job is O(1) (we use the "cached" structure), and balancing the
>>>> tree is O(log n). IOW, it picks the *oldest ready* job to execute now.
>>>>
>>>> The implemntation is already in the kernel, and this commit only changes
>>>> the default GPU scheduling algorithm to use.
>>>>
>>>> This was tested and achieves about 1% faster performance over the Round
>>>> Robin algorithm.
>>>>
>>>> Cc: Christian König <christian.koenig@amd.com>
>>>> Cc: Alex Deucher <Alexander.Deucher@amd.com>
>>>> Cc: Direct Rendering Infrastructure - Development <dri-devel@lists.freedesktop.org>
>>>> Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>>
>>>> ---
>>>>    drivers/gpu/drm/scheduler/sched_main.c | 4 ++--
>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>> index 2fab218d708279..d0ff9e11cb69fa 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>> @@ -62,13 +62,13 @@
>>>>    #define to_drm_sched_job(sched_job)		\
>>>>    		container_of((sched_job), struct drm_sched_job, queue_node)
>>>>    
>>>> -int drm_sched_policy = DRM_SCHED_POLICY_RR;
>>>> +int drm_sched_policy = DRM_SCHED_POLICY_FIFO;
>>>>    
>>>>    /**
>>>>     * DOC: sched_policy (int)
>>>>     * Used to override default entities scheduling policy in a run queue.
>>>>     */
>>>> -MODULE_PARM_DESC(sched_policy, "Specify schedule policy for entities on a runqueue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin (default), " __stringify(DRM_SCHED_POLICY_FIFO) " = use FIFO.");
>>>> +MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO (default).");
>>>>    module_param_named(sched_policy, drm_sched_policy, int, 0444);
>>>>    
>>>>    static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
>>>>
>>>> base-commit: 16d2a3f2ad1d2b95bf9122c910c63b0efe74179d
> 

