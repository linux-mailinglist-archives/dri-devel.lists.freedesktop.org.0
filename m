Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CCB3FCA8C
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 17:06:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 807366E0CD;
	Tue, 31 Aug 2021 15:06:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2067.outbound.protection.outlook.com [40.107.93.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F46D897AC;
 Tue, 31 Aug 2021 15:06:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d/ophbtxPMyGfgCv+J/DCEw5dAa2IyOcrpSmJkChZrpqFkV4aC5PbAw1sOP7u9nSbkx+X4kxb/rKhMQ5QNbEdzVnmrBKk/S1bsVvG2m6EFCkePdEntxzR9shsTv3naq/JIIh6FvYatK4IbV/flOkNdfHv76qObzBin9RTIMhs9KdrVyaKOD5xQZox+Q9NCvPx7+TDR/OYko97gP6XMvkknGR1RCzW7OvtKCt/8huc6nJPH/SRVhzfmyrJ6CjbusjkKOmI3iEFANZ7ASe71FfUrp0m/Ov1tyK8/FGEoZ0y2ErKT78qegUx7yKmb90OwXP8YONCJKC8RpJ5m+Barn5MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t2KqLb4UUbXJaHTRJluP76KU4nQO3SkPztGaL6+kukQ=;
 b=YexSyWLqpxCl1ISCZjWJb9gP2HjyGTOtTydDKutaOq6w5j1M+NNSAt3BHllTpROVdU46xkMCP83BdJ0iMmeYW4xgN5BGjK+47iQBKmKPTx4SIao56ebpVRxitgDqnMQXxCGQqrD5QBsqlUPfrVw36U67oeCuJIlLN37JHuwqitmGULuZGBRlqzDDmN6fLggpgci1mDHJMG2CrTwqIcgSHLF+nnZpLXKGLkWkyX29/M4SEE78RZzaEFJPGa272BOcx61Q2CFUyx73HdCtYH9y29TTRbTtYK2by0yAs4RYgDYt5iodWVE+uM81pwCg7GRjfiqIdHLo5EVhHsng6NqDiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t2KqLb4UUbXJaHTRJluP76KU4nQO3SkPztGaL6+kukQ=;
 b=OLvgJWwuGVVP15DK5AvgqYdhmcclnuMAtcZt/xl2dqyPpAWWQyKlwO6iw1A1oxJnBy/rDr/8A1PojqZ3ccU52EIFrGKLsWnSGFu/UPunuFqpnIoL0nBbcfmKHYMcwj3fDrQoVnyxNynAOrT+EFzYg1TE4CqiYl7Mnx3Z2YzH3Lc=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB3957.namprd12.prod.outlook.com (2603:10b6:610:2c::17)
 by CH2PR12MB3749.namprd12.prod.outlook.com (2603:10b6:610:2a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Tue, 31 Aug
 2021 15:06:48 +0000
Received: from CH2PR12MB3957.namprd12.prod.outlook.com
 ([fe80::3c17:fc0e:bf93:70df]) by CH2PR12MB3957.namprd12.prod.outlook.com
 ([fe80::3c17:fc0e:bf93:70df%6]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 15:06:48 +0000
Message-ID: <02a82c3a-4cda-aa6e-3151-84d223297778@amd.com>
Date: Tue, 31 Aug 2021 11:06:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.3
Subject: Re: [PATCH 2/2] drm/sched: serialize job_timeout and scheduler
Content-Language: en-CA
To: Daniel Vetter <daniel@ffwll.ch>, Monk Liu <Monk.Liu@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jingwen chen <jingwen.chen@amd.com>
References: <1630406139-19621-1-git-send-email-Monk.Liu@amd.com>
 <1630406139-19621-2-git-send-email-Monk.Liu@amd.com>
 <YS4nlkpjeitiwFy1@phenom.ffwll.local>
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <YS4nlkpjeitiwFy1@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0011.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::30) To CH2PR12MB3957.namprd12.prod.outlook.com
 (2603:10b6:610:2c::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.254.46.5] (165.204.84.11) by
 YT3PR01CA0011.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:86::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17 via Frontend Transport; Tue, 31 Aug 2021 15:06:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1606b859-3322-461b-a121-08d96c90f492
X-MS-TrafficTypeDiagnostic: CH2PR12MB3749:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CH2PR12MB3749BC205DF81545795B8E2499CC9@CH2PR12MB3749.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QLAI9Q/oDwe/vlNyQTy9zIX9dzvpMnUnV5l2EgCWXptTR4MHh2m1Uv8uvGg1ESoQh18DOaMnEUhoftbt5rUFKXK0Ryu5M/bbCTIZysaHV42Xl/4TEF00u36w7OiYB/xCYE8Si6wa7WozRktwst/+xSTP9h2hb5VKsTbh/vEAOsDGL3gW5LkjNTPU0TVgqXUl+KxoWTVPNa9LA23hnv57vkWx8uEIJejry4NLFb8+fFSoNTNA4uj21GMBsm/UFQGoNDFUJt3QCbdwxz6L0EpDnsqEIMef7lFcUzAJIT6Vvenxbk+H9xubfgfT56SaXzCGuhg+MijhAQLFQOg2YF6W3AGWWht1OIldKMldq4JZ6nPDQoqD1FE+znlYo54sxv+GopMlA9EtwccLSoNhNMwV2Dhjw06CsAnOCSWlhOREtI5A++nXTjHpaTxH53OC6YNJ9X43lcXZf64znG1AkeXoCn23H8FQA1vq+7/Q1eTo3ljqGBFl8BKiJAvRHQg/1bkmoW/IPOba4tpVOj+ZssYrcME40aVjRctOJt35CVCONdSn6NArtPqLPEkLWaZQRTYX1g3FdTsry9FvaASNX47ww/AkN3TEBU5rSHW9vMbmYB1551riHIdWgRz838OItASwbSO0s+C9IZOr41PktaZlnMVyZAnIoTCi5iUWuTrIZOMCDaT6DNM7AvKXKdw9DGlKV6/Uc88/SWczt79By3sqnLSmPRqNYNb2c07nNXotk4I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3957.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(38100700002)(66556008)(66476007)(31686004)(31696002)(2906002)(16576012)(83380400001)(110136005)(66946007)(316002)(5660300002)(4326008)(8936002)(8676002)(53546011)(26005)(86362001)(44832011)(6486002)(2616005)(36756003)(186003)(6636002)(956004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEQxOTUyQWtQeTRxdmtsdXM1S0lMakhHbDZvTGl0K04yMVlVcng0dm9VRHph?=
 =?utf-8?B?Y0JjNHlkSlFuR0FBeVY0QWdiQWxFTjNNY0k0cUx1Q0lVYTJMZ3FSVDRScFZj?=
 =?utf-8?B?MUQxaHZmRFZlcjZoWXlrTkEwemJoaVEvcTl1bnRUdDZmWW55aGdJSldKYTl3?=
 =?utf-8?B?N090N1AwMGkrb0YwYlhYYWNZQUFJNm5RK1dHd0lxbko5L0ZoR0VYd1ZYWTNv?=
 =?utf-8?B?OWZVRGVMNmFjSERURFAxakNJQlA3MkJ3RzJIQWpna3cvQnRPcVRRMkg5clM4?=
 =?utf-8?B?YkdiMHY1dmFWcStVMEtGWVhLRFM3eCtOVUtUYnAzb0lvRTNXMXA2clZhdHBU?=
 =?utf-8?B?cmxSMFFGQXRseXI1NWJDSWhpV3N3b2Z0bDhMZzRzZkhMWUc1d1BaQ0p5ZjJE?=
 =?utf-8?B?c1JmRytFZjRKK2hnVTloNno1SFl1UDQyU2EyaHBwMFdGZUxCZ2tVK0czTEtV?=
 =?utf-8?B?SFVSMHFsbE1hR1FKaEMwaFFobjhSSnF5bXZ4YmY1OGk4QmIzbGZHM3o4M0dX?=
 =?utf-8?B?ekJlZSs0SnlDNTVnRElPYjFqU25jTGFucTZOektpTVRqdnJNN3l5ZFZyWWVh?=
 =?utf-8?B?eFhOMWtjajMycHh5SGQycmFHSy9VSmtZRFRzWmxyRk9SMDU5d0FxazNZSmJu?=
 =?utf-8?B?Z0hKTkxDWFVPVlJCLzhaSVZaUCtCb2M0cHpEVExYUDJsampsQWxXSkJ3MkxU?=
 =?utf-8?B?ZkNRemVMSCthdytCaEpnWUVqQk44RWxSdmJ2Ty8vNkV4cElTKyttNDRqY0sx?=
 =?utf-8?B?Q3RwNnIzaEJhS2dLUWxyZU5JbkV6Y2xMQjQxVEZPczVTQnlyMG51cjVqK3No?=
 =?utf-8?B?bXF1RWhyQ29WQWR2RUgrdWdpdmFVRlJyN29MRGNiaG5zeC9xc3J4RWQ5dnov?=
 =?utf-8?B?M0ROUjJsRWFGNUZiKzZFQVgxamhUT2N3UVVJa3RHSWxIdUZIT2c5SnRwNklx?=
 =?utf-8?B?T29GTkJrZnZia2MrZ3RkWkxEcHVFU29HRUF5aEZ4Yy9iNzdRZlZMam1iZDZS?=
 =?utf-8?B?T043Mkd3Yy92U04yTzlOMy9HeDcwOVFYS2htbnRYK25JazY1UHN3ekFTaEVC?=
 =?utf-8?B?d0ZuQ3lQMGxjcHlXRkNGcTFwMXdDZElrbmFpeVNoeDFoVFcxdURvRzVJNlNZ?=
 =?utf-8?B?c3VRQStySkQzMENDckRGZ2N5Y1NFaUJkYWcvWHJhWXg0OXBFRVErV2NsOUpB?=
 =?utf-8?B?cEE5alVJN2taTDdWSFI1RHl5Wmd3RUoxc2Q4NWRPSURTT2dENjd5VnFyT1RK?=
 =?utf-8?B?a3NQeHRTbWVMcUNIak91aGUxank5VEJocCt2RCtmUTVMNTV0QXc3ZmZYVWdu?=
 =?utf-8?B?RjRlQldMbEIxQy9PSHFTY2lBd0E3N0dKUEZhUDh1USsxYUNYMWdCQVBpeTJh?=
 =?utf-8?B?dGtmSk5NM3ZvaFh1S0M0Y0NvVWxaZk1TaWZnQnl2VEZ1dTNweXJ0TUFpT2Ns?=
 =?utf-8?B?ZXR6OUZQMzMwLzJZcGNxbEMrSndmbkZyUkthTFR6NXQzcGIrL3hYRVlyY3lI?=
 =?utf-8?B?bVNlZVhIYnF5eUQzdTdyY3VkL1FFZ3ZsS090b1J1NHJTMWVWTFh4eGlLdmRZ?=
 =?utf-8?B?M3VKUXZ6S2o0RjhKZEh6bmg3Q2ducXgzMDhnTksxR2Vmc3ZNeHN6Z3QrUFdn?=
 =?utf-8?B?M3ZKWFdsS1hhTEtzeXlueGJPMWFrMjJVSkIvd1k5cDZ1M0s2OFd5dThlUGYv?=
 =?utf-8?B?OVFnRmoyaW1VMlQ1Q3N3QjlVczNWT3RudnhHMzlZSFpMbDREVEhZd3BTaFR2?=
 =?utf-8?Q?kPXm71cevL9WrQ22Laz72B2fYB4ZeflUJgQcu5V?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1606b859-3322-461b-a121-08d96c90f492
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3957.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 15:06:48.6664 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wls8fKS71OsACWZmZQeqmatvLp/VAz25t5fto1XKXEurdt86IiBDGI2HSwHx6ZFq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3749
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

On 2021-08-31 08:59, Daniel Vetter wrote:
> Can we please have some actual commit message here, with detailed
> explanation of the race/bug/whatever, how you fix it and why this is the
> best option?

I agree with Daniel--a narrative form of a commit message is so much easier
for humans to digest. The "[what]"/"[why]"/"[how]" and "issue"/"fix" format is
somewhat dry and uninformative, and leaves much to be desired.

Regards,
Luben

>
> On Tue, Aug 31, 2021 at 06:35:39PM +0800, Monk Liu wrote:
>> tested-by: jingwen chen <jingwen.chen@amd.com>
>> Signed-off-by: Monk Liu <Monk.Liu@amd.com>
>> Signed-off-by: jingwen chen <jingwen.chen@amd.com>
>> ---
>>  drivers/gpu/drm/scheduler/sched_main.c | 24 ++++--------------------
>>  1 file changed, 4 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>> index ecf8140..894fdb24 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -319,19 +319,17 @@ static void drm_sched_job_timedout(struct work_struct *work)
>>  	sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
>>  
>>  	/* Protects against concurrent deletion in drm_sched_get_cleanup_job */
>> +	if (!__kthread_should_park(sched->thread))
> This is a __ function, i.e. considered internal, and it's lockless atomic,
> i.e. unordered. And you're not explaining why this works.
>
> Iow it's probably buggy, and an just unconditionally parking the kthread
> is probably the right thing to do. If it's not the right thing to do,
> there's a bug here for sure.
> -Daniel
>
>> +		kthread_park(sched->thread);
>> +
>>  	spin_lock(&sched->job_list_lock);
>>  	job = list_first_entry_or_null(&sched->pending_list,
>>  				       struct drm_sched_job, list);
>>  
>>  	if (job) {
>> -		/*
>> -		 * Remove the bad job so it cannot be freed by concurrent
>> -		 * drm_sched_cleanup_jobs. It will be reinserted back after sched->thread
>> -		 * is parked at which point it's safe.
>> -		 */
>> -		list_del_init(&job->list);
>>  		spin_unlock(&sched->job_list_lock);
>>  
>> +		/* vendor's timeout_job should call drm_sched_start() */
>>  		status = job->sched->ops->timedout_job(job);
>>  
>>  		/*
>> @@ -393,20 +391,6 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>>  	kthread_park(sched->thread);
>>  
>>  	/*
>> -	 * Reinsert back the bad job here - now it's safe as
>> -	 * drm_sched_get_cleanup_job cannot race against us and release the
>> -	 * bad job at this point - we parked (waited for) any in progress
>> -	 * (earlier) cleanups and drm_sched_get_cleanup_job will not be called
>> -	 * now until the scheduler thread is unparked.
>> -	 */
>> -	if (bad && bad->sched == sched)
>> -		/*
>> -		 * Add at the head of the queue to reflect it was the earliest
>> -		 * job extracted.
>> -		 */
>> -		list_add(&bad->list, &sched->pending_list);
>> -
>> -	/*
>>  	 * Iterate the job list from later to  earlier one and either deactive
>>  	 * their HW callbacks or remove them from pending list if they already
>>  	 * signaled.
>> -- 
>> 2.7.4
>>

