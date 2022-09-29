Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D525E5EF81C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 16:58:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B070910EAB1;
	Thu, 29 Sep 2022 14:58:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2043.outbound.protection.outlook.com [40.107.244.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56B0010EAAC
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 14:58:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y8KFm7V5Rp84QzUP/LhP+WwMyIRKoEYCg5N3l3aejJvaiD1MRPHpvhU3WJV7V1bZ2sgvsyTbD+aO9lak/9sqZRkQy6+l9AQV+6tmUKJ9vq2pdfCb4JxzDABy06LleEdZkuNsQ+TRfDGSqyi6uF0R++VGbtjgGMnnbPaN/EMBXR+h3DljSibTZYq6GX4q7MD4qPTgAvzG2QrqTVqyruYNzO0vx3a3PiHnXHFbACwoKfxKLCemApKU30uTIJNhuKkpEyxEgyFmuZQ+OjUD2fWiKY3FWZ6H/cVlkguYnCqSM/pvvBk+iEBqtQnbBO4W/bD8PCzGgWDcrQLr53Hmy6ibWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tJ52oMGAmOHgrY4VHT9nigUT7XRVXTwaV1ALlUtw6uM=;
 b=jt9mzkhsXZm1XrF+JNTZohc9j1Wfv1x4AFhNG3q0iSOz3lS2EeeUynZK8ulPGIzNRzPg99DheJvpcNU0C7cDSiHFf8xcmfk/EHBNa7rDK8wyo/aKQViu9GVEmQnBciEsPdYo90vXmWpMJJsCn3agVtDQFNxO6KVemdGxIPYbzr9rO1G87c+2rvaUKeRXt37tI9JgrCLI0MXEgkt5kWJzr0nDL3ZYN4A12OFUcOW0/zwDps/PbGHVxwyYtJzCtSoLOkOEXr9y4+7Zuesh0++i/7Vto3gWqheT3odOOxZiL4dVGJtKovdze/UaKPabqXuGyr0wHNd8woku1UWbIHlnyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJ52oMGAmOHgrY4VHT9nigUT7XRVXTwaV1ALlUtw6uM=;
 b=vsI3mmWEdH8JRpGCudQGlZMb+Yg+etZoAlDPJA94kCh1nSmA/NbLYB9pFE3whIMOdxwQU1wlgp6xxF7Hx4MeyWKjFY7ni/MYJ6ErPRtvtYZABPAcRWc/IHfD9EGmfhrygIs+fj3tznDKkeb0SksXA8Je/x6wVKHS20jq66N63SI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS7PR12MB6191.namprd12.prod.outlook.com (2603:10b6:8:98::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.22; Thu, 29 Sep
 2022 14:58:02 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::805b:58b6:1f27:d644]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::805b:58b6:1f27:d644%6]) with mapi id 15.20.5676.015; Thu, 29 Sep 2022
 14:58:02 +0000
Message-ID: <5beff5e2-8589-28cf-40b4-9e6b9e45b307@amd.com>
Date: Thu, 29 Sep 2022 16:57:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 5/6] drm/sched: Use parent fence instead of finished
Content-Language: en-US
To: Steven Price <steven.price@arm.com>, Arvind Yadav <Arvind.Yadav@amd.com>, 
 andrey.grodzovsky@amd.com, shashank.sharma@amd.com,
 amaranath.somalapuram@amd.com, Arunpravin.PaneerSelvam@amd.com,
 sumit.semwal@linaro.org, gustavo@padovan.org, airlied@linux.ie,
 daniel@ffwll.ch, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
References: <20220914164321.2156-1-Arvind.Yadav@amd.com>
 <20220914164321.2156-6-Arvind.Yadav@amd.com>
 <e613a225-dabf-7e87-2624-a3244df8a877@arm.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <e613a225-dabf-7e87-2624-a3244df8a877@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0150.eurprd06.prod.outlook.com
 (2603:10a6:20b:467::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS7PR12MB6191:EE_
X-MS-Office365-Filtering-Correlation-Id: 4152e2aa-1101-408a-4c8f-08daa22b017c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cDx0UoRr4FAaSBEprZgX+I+wv9amEvIs9pPxNB2yZRzxx7gU7lbGcpJDcvJhJjtVoIaNRaPNN+Ug9NyzL8xyGpvEXj77joaMCufsNdPE54LSX/VUG9qUGId2KDKX8CE6qTOAjSWZLx/v95udoXYpRVvO+7oVC25nXN0FXtXPnhTrM0xQLtI/uuVth7Mr+ox+7ZrlDArT6+YeptoqWduM7z52m3hFtKppMC1w/h0oYSrN1fqytkfphr2nF3wSVJPbGeayPtjo96FFNxqM2uXt4XWt9G+g5ck0pvC8FpbuKOsd79nQ46jrYCg2hUPeJTnYQC2TZ/QO87wL7DnLmquULFlRpx4dnp7Y30NPdQ23keOyoBYwA1JmQDJgcLAw3xTrketdEIzI0vFgyNSBtMdVNDWyN2HtWA8O+HEe0nP4tc1QD5TjTNHt5IJehIijoavnUtO+y//TljwrGQmummLrIlmsqZ/ZMIJIMHorwzUbYPGiWFNIuE1PlkomyhcIzfF/q8GnBtU+Q7Jrth7bRWv7dx4qyTA+rcW2EpK5UJz2TxlEK+jlE+AG28oHcfw4rGoDl9griCWBiU0vHcbCuP1MXeWYqDdTBoD03Z/Xyrvezh5/joowt9nJzQx05Mwsg2kpd8vuoiPZM/7APtnOwgNqSdInCjd7VrvnPslfiMKOxs/lmrKUGBLhbqueI6/p4LMss4dnAGnkSkxaGXbGpcQxg63KBjZkktGFiD89EJeSSYBuZBJ8lbnZxZNK8w7JmHSf2UvsmxPo1+mfgM5swuUHrEecal1Mp9Q3+TR5knSyrixdShzpPQjn0h6Cxdpn44du
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(346002)(376002)(39860400002)(136003)(396003)(451199015)(6666004)(6506007)(6512007)(6486002)(53546011)(31686004)(36756003)(31696002)(66946007)(66556008)(110136005)(921005)(41300700001)(8676002)(66476007)(38100700002)(86362001)(5660300002)(186003)(2616005)(8936002)(83380400001)(316002)(2906002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkNBYWdDZFJSSGhualRwcDdTTzJxdDVPNlRzUEFmTDh4Qkt0QmM2QTAvR0pX?=
 =?utf-8?B?UVp3L1RzRDY4blM2eXg5Z3V5UGY5dGtpMFI2VWV0QVNkTHZkZ1lrOWVmWWsw?=
 =?utf-8?B?R1RkZlZ2OXNNdk1CL0pIZGsxR0Z0RXlrTU9sZ1MxTWIzWStqOEdpOUNJb2ZQ?=
 =?utf-8?B?WWo5cmpBNmpNRmthVGE2akZadTducXRITEpMU3pCRWJZeGxlYlhVSWt4UUFO?=
 =?utf-8?B?YnBLTmR3N05LQnJpSXRxZUZLR2V1WUIzdmgyZmllM1BUZnNEeTZwR0FKSXIy?=
 =?utf-8?B?Y09oNmNBSkJRZTROVjZsUDVQcW9nVFVoVHAyajRHUFFxR3V0ajUveVlGdzlC?=
 =?utf-8?B?dm82ZUdmYjJYRk45QU1OZGQzY25Neng5LzMzY2ljcndoYm52UFpzSjRLYTlz?=
 =?utf-8?B?Z0tFcGJSN2M1MUtwZ3RRaVBxSUtQVE9FdjMrcU9vemswSnorenF0S3hWLzFQ?=
 =?utf-8?B?WWtDcVM5MGJGc21MZUZyNERmU2dUSXIxSGd5eW1KT1dIWFBjVDlqYmZjbVNU?=
 =?utf-8?B?NS82VWVhVVhMRU9ydkxxU0tseTNlM2Rmekp4bXdkWmFmWWZUQUJsVlFMOWFD?=
 =?utf-8?B?d1gwcjd1bUV2RGhJRlBHMVpCVFJzUDZCNlhaTUxGSXp1c2FHNjJjc3lBdDlN?=
 =?utf-8?B?SmNrcUpPc0g1ZFg0dVh6V1JxSzRIcWFLUHdyT0t3ZitkbmZJeU96M04zTEM2?=
 =?utf-8?B?ejRNSGFnVlJQTTZrSWgzeUlyc3RrN3dYWm5SdDVPWWFmaFJUK2c0Wll5ZWNZ?=
 =?utf-8?B?VjhDMm1jOTI2bWtIYkVQRjBTUXRrWS82REtXQ3M0TjZIYktPVjNGZ2QwRjNp?=
 =?utf-8?B?VE1XeU5uKzM3cnRQd2hQT2JFL21MWDFmQk56Y2JxRWZrTXkza0pFMk9CeFBI?=
 =?utf-8?B?b0cySWx4RDlvVyt6dVoyb3hoeXpnU28yRlY3TzZ1QWZlZjd5dElQeURvTDBS?=
 =?utf-8?B?R1BDVDZUcGtwallFTXg4ZUk4bnQvSEJpOW5Ic1hwNXE2clRQSUNiMmNpbzlv?=
 =?utf-8?B?WUFyL0tXT1RoeWt5dWJZcGljOEZHS1RjNE4xTm4ybVRVaDJiTXVGclNHaVp5?=
 =?utf-8?B?RW1LWi93blVKWDJmbjdiU3QyNkU4YjUzdGxnWDlrL3lnSzMwSW92R0RFaTl6?=
 =?utf-8?B?d2NocFg2K1lnZHEzRGFKcndXYS9SUHZ5SmQ3YUNOVlRRQXFXd2RMeVd3ZVlO?=
 =?utf-8?B?V3JxMmw1Q2hueGRGeW4ySXdIMkwrcnFrL0FEaWdoU2MxTVBrK2VCMXFyQUFD?=
 =?utf-8?B?UXdtcWdsSjlLTmVVL1VwdDFHTG41eHRKcnlxcHhpRzZaajBBTVF4bldyT01Y?=
 =?utf-8?B?R2JTZW1jcTE1RmZndUZ5Mno3YmdybXdLWlVKVE1HMlN1a2crUkRGc2NuRGpD?=
 =?utf-8?B?K1BLVVhNT1Q1dHhXOW5Qa3ZMc2FTOWdrY0NFYkFsK1Q1TVUzUzYzMXpWeVBl?=
 =?utf-8?B?YUl1cEttT2RONDFmUm9UNGhOTUpVYWEwR1FCa3VwTlNKMmJNb1JxVVBRRG9a?=
 =?utf-8?B?Q1diZHltaHBycWlOeXpDUXVnSjAwOC8vWVNteDhSSFZnU2VCejZ5RlIya2ht?=
 =?utf-8?B?NHpxWHdxR2ROSWg2TGhudW5QYXN0QUN5NTJjWE4zL0FIUUxoSHhzazBYV1Y3?=
 =?utf-8?B?UzN5dmRkclJXZGtXRWR4N3p5TzQ3cU5pMzZJa0NSSVV5YzJrOUdENFpyWktx?=
 =?utf-8?B?a1dvTldKR1NDamtSNS9rcDlxVHZmemNOVDZSNVdQNStzazhzeGpFL2lrN2hs?=
 =?utf-8?B?Vm8yZ0ZqWjJxeWhBSXFHVWExM3pmMmFHVDRmZGJDSjhjQ3FIU1VZRGtKcFho?=
 =?utf-8?B?RWVDZmhSSFluVzNWcWExcHlXSHVFQkNkQUNXdCs1b3VWYjBTKysrRTgrNGp6?=
 =?utf-8?B?Z0IxQ1pEaXB3WmlkOWlMcTcxMmZuZEtKdDVYSm9TVUZzMEFYaUtaVTdOZ1FV?=
 =?utf-8?B?Qi9VRm9SSWlXaVRjYzJsOEpvcm9nZ3lqTUxON2kwVUV2aHZIZmROU1RveGlP?=
 =?utf-8?B?NFVJaFkvc01SZlY0WU1TbkwzeTl6MThZY3psZEg2aXhZamlnRWpCOUxqZFBx?=
 =?utf-8?B?Qm5OakJCYXc1clMvNU9odjBEczdSNThURFlFREd6c1ZUcktyTXNMQk1Db0hQ?=
 =?utf-8?B?dm1sQ2MzNWxJMkRUNEhOUnBuclF2ZjhZczRjQllFOGJVSmJYb3JJK3FwN2ti?=
 =?utf-8?Q?OAmL7wLR4NeenO9HDSBOWtghzsPjhOnAO0BDaZwTPIgi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4152e2aa-1101-408a-4c8f-08daa22b017c
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 14:58:02.0750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TV57kVsLlkReHKhnMevbY9XJkhcBf4CDyimib0eLta7ySbBwUKtPNCardQDTCIRq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6191
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

Am 29.09.22 um 16:53 schrieb Steven Price:
> On 14/09/2022 17:43, Arvind Yadav wrote:
>> Using the parent fence instead of the finished fence
>> to get the job status. This change is to avoid GPU
>> scheduler timeout error which can cause GPU reset.
> I'm able to reproduce crashes on Panfrost and I believe this commit is
> the cause. Specifically it's possible for job->s_fence->parent to be NULL.
>
> The underlying issue seems to involve drm_sched_resubmit_jobs_ext() - if
> the run_jobs() callback returns an error it will set s_fence->parent to
> NULL after signalling s_fence->finished:
>
>> 		fence = sched->ops->run_job(s_job);
>> 		i++;
>>
>> 		if (IS_ERR_OR_NULL(fence)) {
>> 			if (IS_ERR(fence))
>> 				dma_fence_set_error(&s_fence->finished, PTR_ERR(fence));
>>
>> 			s_job->s_fence->parent = NULL;
> I don't understand the reasoning behind this change, but it doesn't seem
> right to be using the parent fence when we have code which can be
> setting that pointer to NULL.
>
> Since I don't understand the reasoning my only suggestion is to revert
> this patch (and potentially the dependent patch "dma-buf: Check status
> of enable-signaling bit on debug"?).
>
> Can anyone suggest a better fix?

Well, first of all please absolutely don't use 
drm_sched_resubmit_jobs_ext()!

It was an extremely bad idea in amdgpu to approach GPU by re-submitting 
jobs and it was an even worse idea to push this into the scheduler.

The design of dma_fence is that you submit that once and *only* once and 
then get a result for this submission. If re-submission is desirable it 
should be done in userspace or at least higher levels.

Apart from that, yes a NULL check is missing here but that should be 
trivial to fix.

Thanks,
Christian.

>
> Thanks,
>
> Steve
>
>> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
>> Reviewed-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>> ---
>>
>> changes in v1,v2 - Enable signaling for finished fence in sche_main()
>> is removed
>>
>> ---
>>   drivers/gpu/drm/scheduler/sched_main.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>> index e0ab14e0fb6b..2ac28ad11432 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -829,7 +829,7 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
>>   	job = list_first_entry_or_null(&sched->pending_list,
>>   				       struct drm_sched_job, list);
>>   
>> -	if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
>> +	if (job && dma_fence_is_signaled(job->s_fence->parent)) {
>>   		/* remove job from pending_list */
>>   		list_del_init(&job->list);
>>   
>> @@ -841,7 +841,7 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
>>   
>>   		if (next) {
>>   			next->s_fence->scheduled.timestamp =
>> -				job->s_fence->finished.timestamp;
>> +				job->s_fence->parent->timestamp;
>>   			/* start TO timer for next job */
>>   			drm_sched_start_timeout(sched);
>>   		}

