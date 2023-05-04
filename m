Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F05BE6F6456
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 07:23:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 671CE10E383;
	Thu,  4 May 2023 05:23:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2049.outbound.protection.outlook.com [40.107.93.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93CF810E383;
 Thu,  4 May 2023 05:23:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JnsaHFWgZ44osiO2vs/qGYcP8kOAzdeock+NgLP5xj3t8FWOLxhYYUNMuEGsawiBvvEHJXfqZ4rKQwxOgNAfRXymg88uDHFixO7eOfD5Y12DcvLo2kAC1oevR9UWXrH0VsQMFI3vkTQBCOPlBkiG6wiahWYm07b1Ce/5RoJsP9UL6zzBeEXRvw2kb90L2D7CJhsvkN5+qH+FBl8M5rcFYwcWpxE8mqA1hcieNq+3ReVztqjIIXcDOCFQZaMTJp204dy5rNENc/cv78UBgMLvq20mOzn+Ijq1NmRPYJbLOJnjxS0CyLA0UzXlLt+ZIceFWaqTIiXiZX+EAYpTcJIuzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UdWlyvllQPkIkdlfZrT+3Frx2C1e3oG2BqWi0eqhW5U=;
 b=i/mrJy5ELzDvMfqPtBWOiLZyq1jaRN8eWLNMpYk4YbU50/Q2A9KHOeLs1zmhkYM+YUZPfKeRqDRfPqvxBDmnisObRS+cANuVYecuAmh7sjqh1fMKfx2OzeRi0l6TIgmsCKWkx4d/WuvaTXt32cSe7BYd7x7qzSOSSz6Dzg2yzBzLhcq/4N9CrYgGCTC4PeZwkl3BhunUOhEl5N3P9OxvEXbkd7J+PadhI8ufno5ZG9kuvRnE0xs61IdUYuJ6Dks0/c4RMRJ2BWEIrhmovh4FlxEaJ491uvzGB2szKi3jtpFeuHOPSoyzO4JSaOp3nwA4P9l6b7LXRzsOkuhmVJwv2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UdWlyvllQPkIkdlfZrT+3Frx2C1e3oG2BqWi0eqhW5U=;
 b=Bh50iybnuUxpASwvCztV3gFmA3AcBDRh72hCacOfiRw79ynVDecne84Jq11mrx+3cID7qN91a7p/sbIyReVxBvpzKbpQuQ5ynq8og3wKskPMnubf4/bVrMzrit6A43CrYJkXQMjb1Wn/GO/CuAjvuzChaaUCl9zG8Ek3TG0KWQA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 DM6PR12MB4139.namprd12.prod.outlook.com (2603:10b6:5:214::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.26; Thu, 4 May 2023 05:23:08 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8299:158a:c296:de80]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8299:158a:c296:de80%6]) with mapi id 15.20.6363.022; Thu, 4 May 2023
 05:23:08 +0000
Message-ID: <de3c70a2-1831-be00-0df3-4b8d6c593373@amd.com>
Date: Thu, 4 May 2023 01:23:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-CA, en-US
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <20230404002211.3611376-7-matthew.brost@intel.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [RFC PATCH 06/10] drm/sched: Submit job before starting TDR
In-Reply-To: <20230404002211.3611376-7-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0019.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::33) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|DM6PR12MB4139:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b878cbe-8f53-4f25-1f20-08db4c5fa53e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /hLYfvKg+uSvcD/Vx6dC1B9FU/lnNeGYFXOcxfZ4SGAI6GXiLieVXRzN+1Yicsb9dEvanDvU5OajQfkCjiNcnvf9V2OQX/8bAC9MEguutgEHxuSCVdvPo695cJuNKlCawA9TPdBtdGqlQbw3N5nFGtgumPbRBnJhSyFqur0msOkpw3aaMdqNU5xNKrpQdetswUEOjYEa7b9Te6Ih1MrAiK7ergHbcliv9yDcYqT4wGWSwWesCid/mcIQRZxKRbA5y01k7Zjiu9r6wzTyRu3VIH1nfhF1/wj/TaXURUkW6E6DqlX0U+KnbY5e8eSUNJnrmOWEW3HufnNOiKuH9ulhePooWLBeweWfSnmHzq8vhp6e5rvz3AYtXwsjSluoLVvqxdKTYOmDoUl842xGHdDLAgOFIoKOF4kLHMk1cDKgDCn/PnnPxKa/9f8tdeNQzb5YcljdkC3WjVUMTXXfk6zEtE2Lm9SIFipEBPiWu+hYGf2kUjr4u3j+IRsE1dd9ZFtkI88BZx1lEO8BxmrO9cmN7v8RuixWvKqXsOQxvlSOCarKTPRaFAIiq0By5JNzT+GFEvOSwTTfHoPsAs6DwWlneYuG1SFaqY1oYLJ/V6Nu9qIBwf82z88zPP/0FEt0pC4stxODhvclVyFdnYAHyvoNww==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(366004)(136003)(346002)(396003)(451199021)(31696002)(86362001)(6666004)(41300700001)(6486002)(478600001)(36756003)(66476007)(66556008)(66946007)(4326008)(316002)(44832011)(5660300002)(2616005)(31686004)(83380400001)(6506007)(6512007)(26005)(53546011)(2906002)(186003)(8676002)(8936002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkhITDUyQWx0bkJxbDhQQjdvWUJVdmpuV2tCQTgrYzJTN3hkcFBkOFp2cGxr?=
 =?utf-8?B?OWZxMVFIeEphSmhPb2JLTmFrVVBlcUZkZS90dE5halp2K25uUGdBRFBpOWRz?=
 =?utf-8?B?ZnhvNmVWR093bTBOL2dLMVdwaW5TaDBBd2VmTkVYZ1dhNjBRTW41MGxwZlVa?=
 =?utf-8?B?SG9rRHhrNXh6TktIWTJLTUg3eldrcC9KYVo4bjBJUTg5T1o2bU83QkZ5RDJS?=
 =?utf-8?B?VDNIYm1oOXhZVy9yQzVSOTdrTzhDQWFDeWloVkZQS2lNc2xPZjEvRWt4Sk5j?=
 =?utf-8?B?OUd4RXNQQTRFcjRsVlE2enBxaXNXK0dKRFMzM0dabXNod1ZmOXVtYklrd0FG?=
 =?utf-8?B?dGRQTkx2bTRiWW9Pc2d1dHdPVjB1V3FBeUkxalltZEdUSnVrcUpkZ2h6ZEZC?=
 =?utf-8?B?MldPYkVOS2Zacnd2MVRiMnlVMnU3dnk4MVdDNTJ5K082OW90WTNNRVcwMUJS?=
 =?utf-8?B?Y3BBaFJNOCtvMmRLMGM4eER6SERLRlIzWWgwaXdLdmhQdzNveGNJWTRmOVJX?=
 =?utf-8?B?dXJvOE0yTHFnRHZ4VEFJY0ZBUDd2MmpmR0YzRWx6bkJtd3o3S0pFRFBPNDZ3?=
 =?utf-8?B?cXBvcllnUGNCNGFIeHFvL1NYNG1qQWRTdlRrYkV2NCtoSWF5MzQ0dlViTEli?=
 =?utf-8?B?SjVMekdtN01wUzl5ZFZrR094Qm5GRTRWM3RkazZQdm90LzdnWDlqLzlqZENz?=
 =?utf-8?B?Ym5HclBtckdOcWdmSzAxOXdZYnhGRXFZRjJ2TkFYc2xZWk45Q1dCcTlxL3J2?=
 =?utf-8?B?WXIxZC9mU3FTMUMzZ08vcFZHTGxRRHVYWVMvQUhWL3JTalNLamlacEtPMXEw?=
 =?utf-8?B?cldZeUZTRE9aUlF4VDEvTVRGczVkeHBOVitWcy9BRllrbU5TRkdSUjlPRFhF?=
 =?utf-8?B?Z1pLc3Z4SGQxeHU1WWpCejJ4cm1uN2JIK3pUcjdFdFJjYWZ3Y2xueUh1aTZM?=
 =?utf-8?B?TFlFK0hrOHNTcmYzMDlVeXRxRWtXVWQxbm80SmluNS9kbUI4a003UUpMcndN?=
 =?utf-8?B?VE44cFg1Ny9peVZmUWFQaGJMWjN1QTBNRUxxRUNPM3hjeXdyek9Va09QZkxN?=
 =?utf-8?B?blhZR0ZJdmRqZEYxZGJUSjZISlFQTzV1dFNUSTRaZUJ1OEJLbmU5eEkweHBJ?=
 =?utf-8?B?WUU1eHBqenB6T3NtNjJVU082blpzK01uS3lXdytiNlNJeCtwMFRSbzNOSDVE?=
 =?utf-8?B?VzJJNFAwQnBrQlU1RWpPTENzdVpNQld0dWVFaTNLU2JyekVIeWZuYklyV25h?=
 =?utf-8?B?NVFFanJ3UVZyYlVSbUx3SDk2ay8rdFBJd1lRaHFDRVRTSjN3anEzNWl1WkNJ?=
 =?utf-8?B?aW03RVpwZ01DMWxYejVrRGo4TWZDbDhLTGthdXZydHpXR1hzUnpMa0VFZ0F1?=
 =?utf-8?B?REFHMkhxb1l2MlBOYWV0R1F1U1pveTUzZnl5TFExcHlHemZ0cXNIYU9Fc0cw?=
 =?utf-8?B?eTZkSGFxbTZEWXQxbHEwNG1kQTh5YnJJU1dGTkxxeFl0WUhhVnFqbUtoalAr?=
 =?utf-8?B?cmhXU3MwWTNoR1NyMDhSWjZUR3lrbm12OHZpYlFZa3Z2SWMwandjMXhSaXdp?=
 =?utf-8?B?MDY0UWdIV0FHbC9Ebmc4YXdBTU5JaTVJdm9VbUQ0bHRpRUFobkhMT3Y3bGpt?=
 =?utf-8?B?T2l5MDZJNWk5VWl3dnBJVWpWaHFnbDdCdzlzZE05SUVRbGRzdmRrRUEwUE5F?=
 =?utf-8?B?VGRnbjF5bE9tOVJYS0lmVmUrUHc0K3c0Y0pMTVJ2enZldXJSaGhCSWQzNDBs?=
 =?utf-8?B?cjZyNlpmZXE5OU5MS1lpRE4yRG8xUU1rZXk4ZUpUWEY3eHZheEREamN2ZThu?=
 =?utf-8?B?bUd2eC9JN0IvSEFQMFg5VFhxMU0vMjM5ZXBUUmtZdFNQbzVGelRzNFZSckdj?=
 =?utf-8?B?MVVBZDNHN2ExS0sraUtaZVFUWE91OVFaQThoTDk1VW9UZUtJM1Jhd0tTOTJn?=
 =?utf-8?B?cmFTNGIxWENHakJ0UEloRmpBRHJYQTVsSFduOWo0YnpXWG5mbVNsWHgrK21T?=
 =?utf-8?B?WkU3bGQrb2lsenQwMG1DSE1Vam1jWDhYVStydG5xTzZwUW5KNUovWmttMkZE?=
 =?utf-8?B?L1JrajludjFNTTQvT2xvbXhIRVNraU1XQkpOcCtEb2pjQUtSQXNhTXlnZkJn?=
 =?utf-8?Q?Oqy9oEl6S16a0T3iF4KOo7t9g?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b878cbe-8f53-4f25-1f20-08db4c5fa53e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 05:23:08.3712 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LyH3cxHmVkthiBUHcT7muxg+K91JMGLdfQlvjJge5BmX9Ca35hFMX+n9a/GE6Zt2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4139
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com, airlied@linux.ie,
 lina@asahilina.net, boris.brezillon@collabora.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-04-03 20:22, Matthew Brost wrote:
> If the TDR is set to a value, it can fire before a job is submitted in
> drm_sched_main. The job should be always be submitted before the TDR
> fires, fix this ordering.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 6ae710017024..4eac02d212c1 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1150,10 +1150,10 @@ static void drm_sched_main(struct work_struct *w)
>  		s_fence = sched_job->s_fence;
>  
>  		atomic_inc(&sched->hw_rq_count);
> -		drm_sched_job_begin(sched_job);
>  
>  		trace_drm_run_job(sched_job, entity);
>  		fence = sched->ops->run_job(sched_job);
> +		drm_sched_job_begin(sched_job);
>  		complete_all(&entity->entity_idle);
>  		drm_sched_fence_scheduled(s_fence);
>  

Not sure if this is correct. In drm_sched_job_begin() we add the job to the "pending_list"
(meaning it is pending execution in the hardware) and we also start a timeout timer. Both
of those should be started before the job is given to the hardware.

If the timeout is set to too small a value, then that should probably be fixed instead.

Regards,
Luben
