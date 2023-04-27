Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C725D6F07E2
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 17:06:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7081310E098;
	Thu, 27 Apr 2023 15:06:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::615])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BFE110E098
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 15:06:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nxWghHjOfuRwJ1uosK7qvSL83r3utoy/KZ7VTUh5MnoA3zqhwYaUo5qhDmTYf5/Geq5u7oTK4dGcYV76DKthDxuc+13dJsqgKBGXGjLxGEO/5Ql1e2cqyTTW6MCDDwCGJF8YpGPN1Ztr4fOEatW7wupdnmOD40lxupntt09csc+CbVDtLTROMZN0q6qvmEHAXcBJOK7ymx0Gi5uClQxX/V+uVxzJOljQpxJIxxRlDKOMZ3FJ/SPmMiU5SOgbov3w8XJqAv9JUqkRMMd+dV052mCS8oirel85noRbAfreWn0Ap3LXDa/XCLFVK+pd3Jm3pFPGCvgZW9NNzOvrg1ADZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDLsKGJ3VZvwWlMRFxjNTE4AGZycCLS7SgexY5CyhYo=;
 b=l+buLJTbiMmh4KoHwkej2WEL0qfoMSDOOz569eY27VCzosXEmBKLugo4nbgc/6Wz8vd0v9u0U1TeCIfU2IiXRKw7JRsSb/4Arwy7j3m3dfmXmH32OLs51aIyrAUoa/OZqXkgcf6DDBh2GOaFC3a3hTOsFuZMSUOcg9Bs7yPD7AwMUoDViffFLm4ZqzZRl2LY8vgPin/BdAAOIImW85pvCFo/RoNHbEj7L/FeOiqbzJlTP9aoEWMZhSgu/ms/RrqRk5g82f0KpM3m4oiN2JowhyY9ihK0FZo2f4Yn7MbN1q5hIHNN1oA754Ld46DEieVm0BIk6J6e0/l4ROsedsI97w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDLsKGJ3VZvwWlMRFxjNTE4AGZycCLS7SgexY5CyhYo=;
 b=r66BAkTkh63crhN0UDncNohMTDWob3FG0DWoXAm7SmVrZkUwk4zMu8J/ij3yJrNbXleqQ2nM+yjC5qDNTliDlTe+srMkwz1hfOhP8FKTPVB1Hrd9KBk3RO1tUBGFMNYkVxe8y4ER30DLuJ7v8ul9kPT5brd5nNbdagMRWRKPYLk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 SJ2PR12MB8847.namprd12.prod.outlook.com (2603:10b6:a03:546::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22; Thu, 27 Apr
 2023 15:05:57 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8299:158a:c296:de80]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8299:158a:c296:de80%6]) with mapi id 15.20.6340.020; Thu, 27 Apr 2023
 15:05:57 +0000
Message-ID: <2dc5b5ad-09f7-e36f-98eb-8ccb252dc9a2@amd.com>
Date: Thu, 27 Apr 2023 11:05:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] drm/scheduler: mark jobs without fence as canceled
Content-Language: en-CA
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20230427122726.1290170-1-christian.koenig@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <20230427122726.1290170-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0136.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d5::20) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|SJ2PR12MB8847:EE_
X-MS-Office365-Filtering-Correlation-Id: 433fb723-630e-49d8-1e5f-08db4730e74d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2Znif/5TNjHJAERMwsDAs1in+cgmRh9jXpUD5ovx7mPhURdIW5yoBnV+IyTYkUP6gpP9RGiHr4VNdeP6o4T/ZYwCOAh9UEZI5qHwYbM+u0uMkrCTHPs0Quv6KUA7KN3XZVcmMoVB+1lPyCZ+N0SEt1nWKXuHo3crIA5DPjcJviiAJPhIPsQe1+jg7rczWLX/cv9Kdqt4n4+1waZpOhylsMBEYymPHNViGlvdCZbm0x249+cmdZfDm3NhS2A6EVQ7Rw+qJEGuoOwg2F+jO/UOnDl4ataKoeDZj8nNbOJvtV/TBNykFZmwHlx3d3kWgXdWI+6luYDal1HiMC+xNenWqse3tsFWh8f5lfknRCWRh9L7xXX5y7OALdISW2lNYAgqNkTYxDMyfIPp4/N1/h61atstNtqY8wQ+ARIObQCswUKnKPng8vOqV/70FN+lKYRLmCSBLmIie7qgtRLxB7EV0iL862GnjENzrz3ZS8iekcQgl4CqopCVl1+H2s4iWVCZq+B6sIu5jdVU0LdNQurnaJxROM2TTGmT3IPTNduCYkC/jdSNZXoDZq9J5Gei5v692GIvSbHR4M2f+S11k+91r6qpHgEiRyugJWuPjrs3Grtg69YwwRl4xl+VKY/oO0r7R0O8GPcI3HxjM/h/Mu/MijwmmyjacQsA+U5dD7h0qFBnlBQw2fIkZ2HxJm0jpKKYlFGsblIsv5MPWIBOq4J52w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(136003)(376002)(346002)(396003)(366004)(451199021)(66574015)(31696002)(86362001)(2906002)(36756003)(4744005)(31686004)(53546011)(6486002)(83380400001)(186003)(2616005)(44832011)(6512007)(6506007)(26005)(66476007)(4326008)(66556008)(66946007)(478600001)(316002)(5660300002)(38100700002)(41300700001)(8676002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUR4bHhuM3UvQmp3MC9RVDBuRCt2VTlWYUhLRjc1OUNiVWk0ZTN0YzNXS004?=
 =?utf-8?B?ZjI3U2RLSE1HaVNhc2JMM0VYeGt0emMvbm1qbHZIcXhzdnBqRlZ6VllLK3cv?=
 =?utf-8?B?cnRGSnloY1hZNUlaSm5vU1NGSjI1UFN5T3cwUkpRK1YzS1ZvMFhzcU1Ha1pS?=
 =?utf-8?B?RGdFbXVvNnIwNWxtQ255U2dhQktlekZuTHk5TWRtQkZlSVowOTU5V2t1NHpT?=
 =?utf-8?B?MFNxS0JNdmMzbFF6UEt4Q08zZmNacHFkYkE5emgwbDJzbkIyMTdCMFRRRXQ0?=
 =?utf-8?B?M1MvdnJjRThLUENtOFNXU3lhU2ZMbEttd1dvcC9uNHY4VnZvdmIzNkFEVW43?=
 =?utf-8?B?cVdCaFZaOHhEOEloRjFrOGVaU1hFcUQyZVJnbHRoN3lnYks2ajA1SGJ0VUxq?=
 =?utf-8?B?dmIzQ1VyNld2L1AwTnVnL3JFaUhFN2xqT3R1Qk15MDN3aHBXcWpKWGx3QnJ6?=
 =?utf-8?B?dTNFK05XTklEL3dXQkdSdE9heTJ2V3NLTlVNNmVSQm1lZlZ6UmhYSXNYWnpy?=
 =?utf-8?B?blllQlZmUkV6b203M0Z1YVp5bVFjdXFOUWpoZ3hvVm1QNHFaYkR4MS8vZ0Z4?=
 =?utf-8?B?ZWIxM2dUV1IxS3BaaWM2djhSM0tZS09xd2FXRWNvc3kxMFN6M3F0aTQ2N0xH?=
 =?utf-8?B?cEFJRDYwTGVtdDNNUlJTQ3dwdDVJU0Y5UzMwbm1qZTdsd3k1R3V6TXNRUHhY?=
 =?utf-8?B?TXY1czA2Z2hUaHZVTkx6UDB0cWhQbFNDQmhrN1JKWE9VbWhNdHM4cmpwVWtw?=
 =?utf-8?B?TU9xYktPcE9pWTBsZG92dGhPQXZSZWh3eGtuOFptRGUxRjBNNHl5OUdxUk9S?=
 =?utf-8?B?YXVFRXZGNzd5Y3EyZkJvdGIyZ1V6N0ZFL3ZFSEtEZ1ZxZzg4aGlJVWFtSnF0?=
 =?utf-8?B?V1Z1aUdGN0VaM3lYMjRxZHRKZkMxZTBtVjMrQnBsTzkxQUR3Qy8rSWdNSExy?=
 =?utf-8?B?OXoxb2IrNlNNZjdNbm9FYmNlN3ZVUkxmV3g4SWR3UGhlcEVSQlN2ajdIZjgy?=
 =?utf-8?B?a0dpTjdPaUY5YStkU1RoQm8zdGNkYUlsb29oekI3bm1zZFFiWEJyeG1EcGFs?=
 =?utf-8?B?Q3p3WGpKU1lHWXJ5MEduSkNWdGYvakFCdUZkeXJEVjZnTzVnV3cxdWZaT2Qx?=
 =?utf-8?B?S0xWei8wYjgzblVDMmNjT1FSdmZXLzZxaG5jMFk0NnBBRzAwS2ZLUFMveUNF?=
 =?utf-8?B?aVY1WlJNRHd2bThCVlNTZkZYLy9IRFc3TkZmZjQ0QlVxbUJ3dkJqSHdzNlZB?=
 =?utf-8?B?TkQ5bnpDbnN3UmVSQ2hsWU4wZG4wbFRtTWhMU0FJSHBEd2N4dndzS2ZkL05I?=
 =?utf-8?B?TE1wdldVd3QwelNCTmFuSWxZbGZzSmlPMi9wUUF2TWVwZUZnczZjUEpCNVEw?=
 =?utf-8?B?RmUwZ2lqMTRCaEJnaFRleityREdIdUI1c1BVMzZiWlVyeElMTFlGNThja3Ry?=
 =?utf-8?B?THJGb0YydGZEUnRrOG5HWjRLcW5BczhId3lXY2VRclc5UEpuTmxSVTlwc2wy?=
 =?utf-8?B?QWNyYjdLNnd1bHZDUnVIcFZJaHJHN0tGZndLNVZqNjlCRDA0akVYa2dqNXFm?=
 =?utf-8?B?ajNxNEJ5TFlXMjZGNG5UZW5MU2NxOXVZRXcxSndSUXRqVHk3S2R0S1IwZ1E1?=
 =?utf-8?B?NUs1Qk5EaGp5VWVYQ2k1UHdnQTMrVUpKSnlJSElSc0tLdEJ1YnhjWXZDa1VG?=
 =?utf-8?B?REhpR3R6cmtONi9kaTJtY3hIRnRaYmx2RGsya3oyY3E2cVFjRXBLSHJETmdw?=
 =?utf-8?B?ZkZMZ1VBZmtQTFA0ZkhLclQzNEszUml5elpaQSs3ejRyU1Jvd1V0SHkva3Bh?=
 =?utf-8?B?UUZqOW50OFlOVjNqTzdWcjdxdkp4T3ZvQVJ2R0xKamdOWVRlMkw3NnQvVlBq?=
 =?utf-8?B?S21NMnI4dGFGVitkdWdOYWV2WU1OT3ZVZlBuSmM1MmxRcWN3cDFYMk5ZY09o?=
 =?utf-8?B?RlBIUGNGZHk0OTVIRHI5L1VsajBwaWwyZ3kxZDFkWEpWOEpYekg1YnZ0bkZY?=
 =?utf-8?B?bXY5Y0lLM3lXSTZhdEFhYkRzcktIUys2cEl1S2JuUGQzdndWZ1NmemVFSHRZ?=
 =?utf-8?B?aEdKek5wMllNbnl1alArcEhSS2FXUEJHZGVwZStjanNURjZIOEtuR2Fkc1ZM?=
 =?utf-8?Q?3HiODwS8I3I5djt44aFO4s/6+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 433fb723-630e-49d8-1e5f-08db4730e74d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2023 15:05:56.9785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s/Gb9+H7J3vIFU7NIfLL7l8B56a29/TVosbn928XzQtSDQMAN/G1ovicYCxIDB0h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8847
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

Patch is,
Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>

Regards,
Luben

On 2023-04-27 08:27, Christian König wrote:
> When no hw fence is provided for a job that means that the job didn't executed.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 7849e2d7780e..b09cdacfd062 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -542,7 +542,7 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
>  				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
>  					  r);
>  		} else
> -			drm_sched_job_done(s_job, 0);
> +			drm_sched_job_done(s_job, -ECANCELED);
>  	}
>  
>  	if (full_recovery) {

