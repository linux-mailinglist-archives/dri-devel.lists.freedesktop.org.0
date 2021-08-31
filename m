Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DE33FC8DD
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 15:53:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDD5489815;
	Tue, 31 Aug 2021 13:53:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2041.outbound.protection.outlook.com [40.107.237.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2966589533;
 Tue, 31 Aug 2021 13:53:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TIpmyKSIc//yHel4oNx7LaDDeq0kYWmGk0YhKtEjRYI6MSdQy5N8bhxUKUdJbUdRvemSMV0xOnm9dEmDraC9x9Nw1+IgWGzSQw2isNfWN+SIzX7O0Y9r9nqxQWoIlfZLOKtyWVK4+i8AXqtYMsvYt/3izxLQOR/iszdoLQV8svt3GQeaHAIkC8fPFEzxhpH9QdgxMl9cn7CzZbvcpbK4CHFHDoWEk4nuU4H01OD2+XHrsxwoyyN+IZc0KrWVjqZoMJUrDJidf91BZS8+iPhCIYQxg5jwTvHnkBVG10EJBwfMLEzB2aZEbjSkwbXa61ybPeI11QY5+UvXrO7HuYPCxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=gPnvN3ORm78/VvGYzCKGHejghFtV/naMgvF26RhKqH0=;
 b=dbRxmh01rytpsoXrl8xfyZ/uU1RNINrNsTBJ4tXmAEA7/J9qa7fIRk6SU8xI0J2H7CyK51PaVwuX9wxTZfVDNto+YLv+EansnZcBCsvPIwNZBPNFeihzUjsCuu5OMk0+9mI3LpTzWTupQLiKYFUCs4zxNexcYg4VwUnLExMMy6nO8s53FhnqG1JJlHjKp4ObUa32sdzCduolTLoCRcwXcfegWUReQ26bdYPfzD3YGi0+45Dp0Lfz5eoawAuZScf65yLX3McJftPRJCJY61eV4P4Zwz3q7R+Xd+had3cnEJsNSBWe8PNUR/oQ52Coh5XNHRKKxJMzjIwDeQdqZGeTvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gPnvN3ORm78/VvGYzCKGHejghFtV/naMgvF26RhKqH0=;
 b=IfMiPEJ5tu1kd0g7ntKRG3jCR9Bro2eUAq2MJaXzwtD4Lowu6w/IM8Qu4lB7G0ljBfOtI2ahJA5jn88WbpNjjfsEM93x6vVvdrP86DOpxFTfQ76uHPbJKBjarAfbzhC9X2cijkVbni4QGvoEQuzIGpHiuMWncbRufl7hHqTqNzo=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN1PR12MB2352.namprd12.prod.outlook.com (2603:10b6:802:25::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Tue, 31 Aug
 2021 13:53:39 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::c4ac:2505:5bd8:295d]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::c4ac:2505:5bd8:295d%6]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 13:53:39 +0000
Subject: Re: [PATCH 2/2] drm/sched: serialize job_timeout and scheduler
To: Monk Liu <Monk.Liu@amd.com>, amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jingwen chen <jingwen.chen@amd.com>
References: <1630406139-19621-1-git-send-email-Monk.Liu@amd.com>
 <1630406139-19621-2-git-send-email-Monk.Liu@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <29be989b-c2a5-69b3-f0b8-2df52f50047f@amd.com>
Date: Tue, 31 Aug 2021 09:53:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <1630406139-19621-2-git-send-email-Monk.Liu@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0150.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::29) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:b95:7ef3:48be:2d7e]
 (2607:fea8:3edf:49b0:b95:7ef3:48be:2d7e) by
 YT1PR01CA0150.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17 via Frontend Transport; Tue, 31 Aug 2021 13:53:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23ef9a6a-6cf8-403e-da40-08d96c86bc3f
X-MS-TrafficTypeDiagnostic: SN1PR12MB2352:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB23522F87A5000661ECFC0798EACC9@SN1PR12MB2352.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1BUi6pcWuNe8Q9nppQBAInZpQaEZaoS/vMEWTmEHeThO6NdRmLEFf2xZYBITmHJV3h/zqaOdkRXDLLm202azwWBb/dzdHZJqXyMlxX6bQdDolDhAcZxKFuf1Y2ffWTr8zzJHH5fXc+28+9mjUBxJHrF8I6YT2g64evZEuZ3SQyqBsvdV/iSI3AlUtDjRvVEEMda56MXDSXN1SRbTsEVYwnDquhTI0H5UkI1T9RFtdy4+7Ck2DhxtPLDz7Gb8X6ud2B0cALXWtfrNIEoX/TbT8vNvTrxxJyBa75/1kCqjov7kmZ6tv2uMFHCSfBrHG/wf/wd7p/tqOscRS0d8DUr1xSppKxxh8syO4mP//AtxaUQB7Vsd/HZyiAaf9Aw/j6m5Ucosg2c9h5VJcPm/MjAxH8mVLSbmY+Fc3TO2u4z+pKDbcAh99LvDKY8XA2SNYo1KYtBvQm9Vak0YYM/fFPzsc9NDxBq3JG4nzs5cw6L35ddY7NSP6lt2ILmtNhUjxf6msZvySjBotBGAMTZEjJnsL1IppUWYCkzOd7nxYCuUD3FHQOqbW6Wso35nSyA3Amj+fi/BBponw9mZzAGdHcblMjwk4v1i5yJyXH0jMuuYcJelTx/nA/UO2Tol4lKtpK+gXh+hOPVBLj4FDAD+wriF68SNhfVP4wchQnJoKHsprJJEsksfufMO1OUjY8duxFpqToSIDIJfWgbMIrmVGW67P7G5FdWS54ybQ2AvLuYx3+jwFoiMIKTDT9CQ+neTll8sUs/RX4DxU7jhUdztoBuCGrvDoyDvoOJFrbYIn93d9aMIzIUoBhQkSEW4g8vdjW9D
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(366004)(376002)(346002)(186003)(53546011)(966005)(36756003)(66556008)(66476007)(4326008)(38100700002)(8676002)(8936002)(66946007)(44832011)(478600001)(2906002)(6486002)(450100002)(5660300002)(83380400001)(31696002)(2616005)(86362001)(31686004)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTJFNGtSOVMzQkxOc2JqOHZ0cFF1SzFLV3l6R0xCa0dTVHdvSUlUaWFMRXpV?=
 =?utf-8?B?K2EzTXlzc0FsLzZqRUFVdDVyeVVvU3ZZcVU0dHVNbzkzUVlCTzB2eXZYZk1u?=
 =?utf-8?B?S1FYV0l0b1R1blJoa2NuU1k1YmtZeFI1R2lsZUYyMkQxQjN6VXg1YlFmRDZT?=
 =?utf-8?B?TkJzcnp4czBGb0tZN29Tc3QrNkxVYmY5TnpyTTJGeko0bVEzcnJaMTRodWMy?=
 =?utf-8?B?RnpYMEl1U0w0ZGg0b2o4N2pMdzZoKy81ME93aXhwNGNReGtHL3EzMGRkM0x1?=
 =?utf-8?B?ZGY4NFpHSklCcmRNam0rOUllZ2o4MWJZVlp3THlhQWkrbi9VMDVlTi8yYzlS?=
 =?utf-8?B?cTRlOVVMMk9YZnhmcFR1b0Z6NGd4RVRZOUx6SEVicEV3dUFxUEpFMGtSUThu?=
 =?utf-8?B?aW5QdTBwYnFCL3NaYWNSWHYwYnBtbUZuUUZlRlhkekJJbXFWd2FzRld5cUNU?=
 =?utf-8?B?NmREalBEMGF3eG9oeU8yLzRJam90aHYyeG1ZcWE4U2xqR3N0NHJWZXpCUDlp?=
 =?utf-8?B?M3pVdUVBM0toOUxsVHZPYThRNHdUdERrTUVEdktjMjBqQ2NwTytwNEZaeDNh?=
 =?utf-8?B?YWhPU1d5Q2g4TVRnTGNaZ0p5VHREK21qdHhHR1IwTm5pSkxKZHlTU0R1NVNK?=
 =?utf-8?B?YVZMN1hNWTc3YmQxTXFBUC9LcFNiRUlZNDN4Zm5kRjFJbzdiT0E0cWI4ckxr?=
 =?utf-8?B?Z3JXRGhDNVlNUWdZdkNiMVFIV0pNQTZwelZHMG5rVnZ6bWV4VnVMdldOdUU3?=
 =?utf-8?B?S05uMktwQkNidVpIZUhlcmE5by9qSWpWeWtmY1VhRng1bWo4T1lHK3dXdEw0?=
 =?utf-8?B?Z1Z6ajZGTWs5ZU1va25YY3ZIaXRSMkE5NkV5ZElhN3VLZ2dYTVZXVTJ2NXdL?=
 =?utf-8?B?bE53YUtKZXFQdFh6WW9vUFRiOFdwZVUzYTg1cUtySGxERUFoR3ZMZVpaa1B5?=
 =?utf-8?B?VzFjcDFHQmlWQk1DclMyUUlORnRCYmtNbysxSE0yV09EZ1pSbURKUzdXMG40?=
 =?utf-8?B?cUM2VFhyd2VqNjM0Nk5NKzBXQlpZcVhGZGVWV2xKM1pldWhKaHdRVDUzY3RD?=
 =?utf-8?B?UG1iNXhSNWg2NTM5cUk2V09xU01wK0VSdUZUTUduNm1nL3JUMHh2eXBQczdl?=
 =?utf-8?B?YUpIdmFrUFpFMUhOOUhnZngvdHFwdkRYZ2puR1BlUUtZTHZhekJoOUN0MjZn?=
 =?utf-8?B?RkJJSnp3ZFBEb0xXMGVPM1cvZllsU1RaNDdXQ3hKc24zbGRZNkJyNnJ2WUJH?=
 =?utf-8?B?dnJFU2xlM0tBU1NtNXA1YzJENDBzQWFFMS9UYW13ajlUMUtUUFdXejhpeXB3?=
 =?utf-8?B?TjcyNFZZZXZiWmdRMmhJY0hXMWxjWitRR1djZHVNYnJqOWcvSy9qMHJ3NzBN?=
 =?utf-8?B?NHkwTEIxbW1JdVpXaEVySThPTlhHbW9wMXNTaEhGN2c2QklsdmZBS2NwU3hw?=
 =?utf-8?B?enFTUmh5bFZjcVpIQkxibWxlRGpUTVhBdEVBNk1TNTlZYVRIN0NlczFYUVo4?=
 =?utf-8?B?WE5PV1ozMWdRSUVFeWRkYjFnZTdtZHZySmdRRld1U21iaVYvQllnNGY1TkJJ?=
 =?utf-8?B?VE9idTAvYXc2S2doUWNuVThpU2s5OHQ3VEZGbHRTUkR0THRSTmNYK1dIa2Qy?=
 =?utf-8?B?c3RXS3RSREtLV0IrTGxlTlh5cFZIT1FRZVNnK1FaeGQ5YnNQNS83bndhNUN5?=
 =?utf-8?B?N0dKbTg1Z25qcy9oalQ1WXlCS1ZPY0xSUW5BLy85bU1lZ3VUcUFDbWo0eUto?=
 =?utf-8?B?a0ZLUkJQQ3JPK2tQRDNiVkFrTTZKbkVYSVhnY0ZvRG9Kd3dBK3pWOHl1dDNV?=
 =?utf-8?B?VnF2cTdjS3EvTlcvU1hyZEozM2lmRjNoTHZBb0kyNVhEREFMMjZ5NURQNkUx?=
 =?utf-8?Q?KUrdb50CzYhE+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23ef9a6a-6cf8-403e-da40-08d96c86bc3f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 13:53:39.1503 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 49scZUPV/IDBJHQDp64dmTMscB/kKSqD7y89b0H0L87ei+6ZNlWZ7tj1ieis5+upXCq7REtV8uwg0qOpEu3QuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2352
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

It's says patch [2/2] but i can't find patch 1

On 2021-08-31 6:35 a.m., Monk Liu wrote:
> tested-by: jingwen chen <jingwen.chen@amd.com>
> Signed-off-by: Monk Liu <Monk.Liu@amd.com>
> Signed-off-by: jingwen chen <jingwen.chen@amd.com>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 24 ++++--------------------
>   1 file changed, 4 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index ecf8140..894fdb24 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -319,19 +319,17 @@ static void drm_sched_job_timedout(struct work_struct *work)
>   	sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
>   
>   	/* Protects against concurrent deletion in drm_sched_get_cleanup_job */
> +	if (!__kthread_should_park(sched->thread))
> +		kthread_park(sched->thread);
> +


As mentioned before, without serializing against other TDR handlers from 
other
schedulers you just race here against them, e.g. you parked it now but 
another
one in progress will unpark it as part of calling  drm_sched_start for 
other rings[1]
Unless I am missing something since I haven't found patch [1/2]

[1] - 
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c#L5041

Andrey


>   	spin_lock(&sched->job_list_lock);
>   	job = list_first_entry_or_null(&sched->pending_list,
>   				       struct drm_sched_job, list);
>   
>   	if (job) {
> -		/*
> -		 * Remove the bad job so it cannot be freed by concurrent
> -		 * drm_sched_cleanup_jobs. It will be reinserted back after sched->thread
> -		 * is parked at which point it's safe.
> -		 */
> -		list_del_init(&job->list);
>   		spin_unlock(&sched->job_list_lock);
>   
> +		/* vendor's timeout_job should call drm_sched_start() */
>   		status = job->sched->ops->timedout_job(job);
>   
>   		/*
> @@ -393,20 +391,6 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>   	kthread_park(sched->thread);
>   
>   	/*
> -	 * Reinsert back the bad job here - now it's safe as
> -	 * drm_sched_get_cleanup_job cannot race against us and release the
> -	 * bad job at this point - we parked (waited for) any in progress
> -	 * (earlier) cleanups and drm_sched_get_cleanup_job will not be called
> -	 * now until the scheduler thread is unparked.
> -	 */
> -	if (bad && bad->sched == sched)
> -		/*
> -		 * Add at the head of the queue to reflect it was the earliest
> -		 * job extracted.
> -		 */
> -		list_add(&bad->list, &sched->pending_list);
> -
> -	/*
>   	 * Iterate the job list from later to  earlier one and either deactive
>   	 * their HW callbacks or remove them from pending list if they already
>   	 * signaled.
