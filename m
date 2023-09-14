Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCA679F84A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 04:38:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1008B10E4EC;
	Thu, 14 Sep 2023 02:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C1410E4EC;
 Thu, 14 Sep 2023 02:38:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jCZqFvyNvJQLEuYsVLuBSXJkPZnyEt5snNN1puEs1A2kUkeQlttRB7xOHxf0I5paRnCmRN2ol8c2pA+QhkzIm+ENTV4JxwEJbhZwd3A3bpGIuPv5rRcSIc3cvQvYjjXFVVRAg7TWvZkk9fSWP2LQyJsSCJ1wGzP3Bb3IpsZ3FSXO8Mj0bsPBIRWTQX+jIYwybxf02YoIVf4nAkcDJ8Cb9jlWrqLCasAmY2QEls6PXYfam2y0+qrgOfbEsveQPuL962t3mUWUEgHRbDkrmXlObGb8Qp6BtNrFOvKJK8v7BDANWXtM/1u+66xzql163fATlg7qToff1BWQbrbR5C/MiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XrJlZ2zeZV4WFJcrYSx/dCmB60jWps3yJvDyCmvK7oA=;
 b=cKFA8XzcgAC6sHoAogoacV0UWLRHdsxpN1a+zJSMhRVda/hDEQsaXLGMvEZS2uHYBmHrfTk36qZPlZ/T+nSC/mqMf3Zp+MbSWBY8zpMM43qsiMc17ijbelknl7alyfU63jOpkViQUVib5AZnqHxDWx0+pY5RvgPF9flOEUYhmIvrhT6GhKv0parMePGHEOHf4WFGTWvKdNk8NijJ2H/Os+aXCD/3IdQ4diCMBuoks4btsrlmc0fGBP9eFHaSzt8PJq94T/IP5p+rG3qqW2MSCv74FLrTcJUb75UgRV+wEI7PXL88xkplbn7pNdFQLyCSBXCxDGeAkHaFN0PrV7vLPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XrJlZ2zeZV4WFJcrYSx/dCmB60jWps3yJvDyCmvK7oA=;
 b=ZHUb4oEIl50zO1Hnq3JnxRIG4MeSb/ONO3ND9P5UhZzH31ATXW6Zo10KLkxfecC/5bJhQaL+swp9jtvUVpg1yUpLLg0Rs8y2gAQqdLwSyfg2lFvn12b0brHuIW9ZthO1ZfHQoRtVZPlfOYchNWPIv+13QU5U7bJ/GXgs6SWUIGk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 IA0PR12MB7579.namprd12.prod.outlook.com (2603:10b6:208:43c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Thu, 14 Sep
 2023 02:38:27 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87%3]) with mapi id 15.20.6768.029; Thu, 14 Sep 2023
 02:38:27 +0000
Message-ID: <93a1dd2d-72e3-42b1-914f-d325b104580b@amd.com>
Date: Wed, 13 Sep 2023 22:38:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.2.2
Subject: Re: [PATCH v3 10/13] drm/sched: Add helper to set TDR timeout
Content-Language: en-CA, en-US
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20230912021615.2086698-1-matthew.brost@intel.com>
 <20230912021615.2086698-11-matthew.brost@intel.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Autocrypt: addr=luben.tuikov@amd.com; keydata=
 xjMEY1i6jxYJKwYBBAHaRw8BAQdAhfD+Cc+P5t/fiF08Vw25EMLiwUuxULYRiDQAP6H50MTN
 I0x1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+wpkEExYKAEEWIQQyyR05VSHw
 x45E/SoppxulNG8HhgUCY1i6jwIbAwUJCWYBgAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIX
 gAAKCRAppxulNG8Hhk53AP4k4UY5xfcje0c5OF1k22pNv8tErxtVpgKKZgvfetA4xwD+OoAh
 vesLIYumBDxP0BoLiLN84udxdT15HwPFUGiDmwDOOARjWLqPEgorBgEEAZdVAQUBAQdAzSxY
 a2EtvvIwd09NckBLSTarSLNDkUthmqPnwolwiDYDAQgHwn4EGBYKACYWIQQyyR05VSHwx45E
 /SoppxulNG8HhgUCY1i6jwIbDAUJCWYBgAAKCRAppxulNG8HhnBLAP4yjSGpK6PE1mapKhrq
 8bSl9reo+F6EqdhE8X2TTHPycAEAt8EkTEstSiaOpM66gneU7r+xxzOYULo1b1XjXayGvwM=
In-Reply-To: <20230912021615.2086698-11-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YTBP288CA0019.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::32) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|IA0PR12MB7579:EE_
X-MS-Office365-Filtering-Correlation-Id: 95094a9e-57b6-41be-1076-08dbb4cbacd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mn4QYLauAZOP2WrEP5MAczHo3HbYmkQ9j/Ag3Fyf8mYpzZ2TY4oFLax16YAThIujtkZGfKLk9SwrBgSaAhT2nP88kMOTYoHe0qFZv2FWWFu6mMC8gKti+/Ws0qK2x/EpkDRwlTFXv/31Fr+bjC2PO8ZQUwQR0/fTXHRUzCokCmzT2CmBB7kRrIH4LBqYO14Ru54ZlkUVcXzuobwn6dr32PrZzJYQny2VDAdrBVm5Ubz9K7AzScsO0xiPamAg/aAmTqCcUzuIBezueF8Q60pLgpr9NQtKlPEyWvGSE2O0hhwS7dUnXWR1UE2X3wI72KGbmpVRB8SCKZkthwGh1kLdpXGu5O1lKPCPnm45zUix/HP3vUGSWDyYZqn+pFkdGCsESuB5jg3M194GLwJJE/cBpobzJezfc2RWIZinOINrs+q7TriyybTVPPPBolM1qQlgFjFSdSG1C6lpsylPumh0fntSEWcGY6Fp7z6fddJprYoJ27xeJr6ILBBE377hoykFXBCZbt+7VpI9m74+CSsTjkT6Gz4MQiKlPn14qbnq68cRcFmcmNXwJhjVUYlPGec4A8XysmgKlQRqS+xSxa+VBbdM2kz0PejTCKcWJVF8YQ9gZ2jX1+N33CDdKELVUHw/p+p7y+9MkNzcVIS9eKkU9g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(376002)(136003)(39860400002)(366004)(1800799009)(451199024)(186009)(66556008)(66476007)(8936002)(4326008)(8676002)(2616005)(38100700002)(66946007)(53546011)(41300700001)(6512007)(316002)(26005)(6506007)(83380400001)(5660300002)(6486002)(6666004)(478600001)(44832011)(31686004)(7416002)(2906002)(86362001)(31696002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UW1sT2pwSDhocTVIS2RoQitDOEYxYlp1VlkwWTVYQmNMdGlrSGdhUHFRaFZT?=
 =?utf-8?B?OHd5OCs2NkRrRFhxMG9VbDFiRmYrVm1IMExnUWpSNG9LRXNyNW01OERWU3I1?=
 =?utf-8?B?V0EyRlp1bGtaSitGL3daaEpCeGpPOXFWQTdSY0JBOFhEMjBid3c0djR6TkJi?=
 =?utf-8?B?djQyZzNZQUZSb3hNN0QwNFFTaHBMd1FjMW5MVTFoMzZnVE5WMTV1MlhQOXlK?=
 =?utf-8?B?Q1ZrdGNmZXFnRU1yT0VCYy9lbk1pdzEvTC9JUDljMkVFTE1PeDRzRkU4NTRK?=
 =?utf-8?B?WWg5QXlyMmZMWlBwYWQ1QVZQSDV0ZXdzYnZ2WlhzdVl3YlZKRXhnc09iZC9M?=
 =?utf-8?B?ZHBTYW9uZEtlZFpCY1gzVkpxSVRuNDd4S2g2VldyUmlJVGk5NGNUMFpaQmpV?=
 =?utf-8?B?Y2RFUEdpL0pnOFRVdDBFbWgybnNDc0VUUi91QWsxU0xiTEliQjJmUk1QbXJG?=
 =?utf-8?B?ZE1mTFA2TTZta2pnQVZ1WC9ET0lVNnpzc2hPaTN3Z3BwZE40RzZhTFRqcWM5?=
 =?utf-8?B?cDJOejF4YThiY2NBNmVPNUtEMUZSTmI2MmhXUzJraXNHOHRFNVFqelZ3VzBy?=
 =?utf-8?B?V1J4SDZaMDhHRGlWYVNLQWhTd01xSGY1eEJwb2cyTkI0OG41ME5IeWl0QXJ2?=
 =?utf-8?B?SjZLRUdXTU4wVExxenFvc29FUkpjeDdxMFhsYTE4QkVHekVQR2hMSmNnUVZL?=
 =?utf-8?B?eER6d3pNY2VBK1I5bkplNUVyTDVMRGlIREZmR05LTDJ3ZHNmcmdycGRUc0lS?=
 =?utf-8?B?RWV3ODErZjRJMnB4UGQrZ013bHg2OXdzSnBKWFZoU0RZZm1mYzFTQ1lVYlZm?=
 =?utf-8?B?bzZ5MnlBcnRvY1MrU25ibnE1cE5JdVV0cGR0RXlESUxJMlBTbTRFK01KVWkx?=
 =?utf-8?B?QzV3cVUrdjF2WTdvL0QxNzNoM0ZxbHUxMGhjTWt5MGlyZktMVElTa1BZbk5U?=
 =?utf-8?B?a2hSMzRwZnJOK2I2WGhCT3FweGhuUnZjNWEyMGFRUGx4YS9KckVwaW1IQVJP?=
 =?utf-8?B?L1o0WEEwK3hjMzZ2S1c1S1ZsV1NvWllGT2RKRE5wN3hXYXBhL1lkclh3NjRZ?=
 =?utf-8?B?K0VNWGQ0dEs0SEJLRC9qdEUrYzBoa0ljNlovYldUTWd0TW5iYXc5VmhFZlpI?=
 =?utf-8?B?TFRDS0MvQWdqVmxiZlhZOTlKQzRVUkZ1djhvNlZzNFc4VzF1TnNqQVVwVUZC?=
 =?utf-8?B?K0ZiREpGcG4xaVVsYjFONktyNlN3ZTBHQTd6c2xXMG54QmZOQk5HS2FhR0R6?=
 =?utf-8?B?UGZmWGxuNEE0WlErS3kyY09hWWdXWmxwWVRHbkRkZ2Z6Uml6RVZuTlNHRS8y?=
 =?utf-8?B?RWtoZW9WVkxlbnZuMmFrWThzNnVwZm1SQVRkNmZ1ZUVVUXJVMDJWTjlheEsz?=
 =?utf-8?B?V3hXcDkvQzcxUU5aU3IxZTJhRVdib0VJUGY1VDhNVS9Zd3Qrc05POE9PRVM0?=
 =?utf-8?B?d0k5eXVPelpXdStrMEdJSG5JSFVzVHdiTUFQcjdCUy8rWDg5RndFbk9EZ3ZM?=
 =?utf-8?B?OERrMEg0UEE0RW9PYjFoRDRyT3kvTnRkWWEveDNJKzcxUGYxNWNIbCtYZ1BW?=
 =?utf-8?B?MThYV0FOMGZhNkhZUEdad2RwSnFPSjRiYnFtVkp1L1Z0QU5kbFRhazZwUXRs?=
 =?utf-8?B?OUxjN0l3dURPUE52cUxraHAyQ0FadVVzN0J4VGRUejlXVUFLSU5FK3JoNXQx?=
 =?utf-8?B?OGdGNXEvVVJmdFdwYlBxODJXQTdMbUM2OFNjYkw5TUZ2NC84UlF1WlNNWldx?=
 =?utf-8?B?MG5sUmxmYnF4RmtrbUFndllWSjVOMk5FdWMvZ2JEalJLSUlIdWlQdTdLOGtP?=
 =?utf-8?B?OEJCUHpQenpuOGdWYzF1RVN6cmg3QUY0b0M4NWdNSHpMcXVvb1VrZVB2ekR6?=
 =?utf-8?B?VnBUbjF5cXFxcGNKdGFaQzRocGw4UFRRMVV4cEdSS2wyZ2JheDZJQmE3b2hD?=
 =?utf-8?B?NFBWRkJrenBkLy90TzZ5YzRCRU0wekR2eUNTZEluSTZndFBtYXg4VjJpVjBD?=
 =?utf-8?B?dFN6VE1KYkJCU1dLSkhXVSsxblBCcTJRcEhFekN3SWEzVmFjd09Jek9IRzNQ?=
 =?utf-8?B?dGpEeFNwUFZBM0FnRFNCaWxTd3NEeC84ZGpDSUludkdsOTVibFBPOFp0cmVM?=
 =?utf-8?Q?C78Yw0sI3SN2eXOG2xb7C9r4T?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95094a9e-57b6-41be-1076-08dbb4cbacd3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 02:38:27.5087 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kCAKWKJDY27l+HdYxlTNp2z9bfvoQbPeZ2Tws8bwuVUivN72NQrPLntH7VH3d2is
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7579
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, mcanal@igalia.com,
 Liviu.Dudau@arm.com, boris.brezillon@collabora.com, donald.robson@imgtec.com,
 lina@asahilina.net, christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-09-11 22:16, Matthew Brost wrote:
> Add helper to set TDR timeout and restart the TDR with new timeout
> value. This will be used in XE, new Intel GPU driver, to trigger the TDR
> to cleanup drm_sched_entity that encounter errors.

Do you just want to trigger the cleanup or do you really want to
modify the timeout and requeue TDR delayed work (to be triggered
later at a different time)?

If the former, then might as well just add a function to queue that
right away. If the latter, then this would do, albeit with a few
notes as mentioned below.

> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 18 ++++++++++++++++++
>  include/drm/gpu_scheduler.h            |  1 +
>  2 files changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 9dbfab7be2c6..689fb6686e01 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -426,6 +426,24 @@ static void drm_sched_start_timeout_unlocked(struct drm_gpu_scheduler *sched)
>  	spin_unlock(&sched->job_list_lock);
>  }
>  
> +/**
> + * drm_sched_set_timeout - set timeout for reset worker
> + *
> + * @sched: scheduler instance to set and (re)-start the worker for
> + * @timeout: timeout period
> + *
> + * Set and (re)-start the timeout for the given scheduler.
> + */
> +void drm_sched_set_timeout(struct drm_gpu_scheduler *sched, long timeout)
> +{

Well, I'd perhaps call this "drm_sched_set_tdr_timeout()", or something
to that effect, as "drm_sched_set_timeout()" isn't clear that it is indeed
a cleanup timeout. However, it's totally up to you. :-)

It appears that "long timeout" is the new job timeout, so it is possible
that a stuck job might be given old timeout + new timeout recovery time,
after this function is called.

> +	spin_lock(&sched->job_list_lock);
> +	sched->timeout = timeout;
> +	cancel_delayed_work(&sched->work_tdr);
> +	drm_sched_start_timeout(sched);
> +	spin_unlock(&sched->job_list_lock);
> +}
> +EXPORT_SYMBOL(drm_sched_set_timeout);

Well, drm_sched_start_timeout() (which also has a name lacking description, perhaps
it should be "drm_sched_start_tdr_timeout()" or "...start_cleanup_timeout()"), anyway,
so that function compares to MAX_SCHEDULE_TIMEOUT and pending list not being empty
before it requeues delayed TDR work item. So, while a remote possibility, this new
function may have the unintended consequence of canceling TDR, and never restarting it.
I see it grabs the lock, however. Maybe wrap it in "if (sched->timeout != MAX_SCHEDULE_TIMEOUT)"?
How about using mod_delayed_work()?
-- 
Regards,
Luben

> +
>  /**
>   * drm_sched_fault - immediately start timeout handler
>   *
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 5d753ecb5d71..b7b818cd81b6 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -596,6 +596,7 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>  				    struct drm_gpu_scheduler **sched_list,
>                                     unsigned int num_sched_list);
>  
> +void drm_sched_set_timeout(struct drm_gpu_scheduler *sched, long timeout);
>  void drm_sched_job_cleanup(struct drm_sched_job *job);
>  void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched);
>  void drm_sched_add_msg(struct drm_gpu_scheduler *sched,

