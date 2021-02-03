Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED48E30DEB8
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 16:54:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BE336EB28;
	Wed,  3 Feb 2021 15:54:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2068.outbound.protection.outlook.com [40.107.92.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 446246EB28
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 15:54:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VgTgahbqfORfQoTOuMr8ogHqNNsekizZrMlu/tO+ZePTFhB1dQnVPyl3bgPCqadszmBWWmXlF++x+NZc1veeM7W7BuN3aGu7yDCivE560YpMBtkj2BZ0x3U4RFQMMECgrLwJt/orSH+kHroNLh3WkPrXYFr9O8+3Bl7m2F2Z2+1jVYrXGOlN/lsnZ1EmYE/T3/juNcxrwksEkZeCfqxkKWihPhw0sT0YProXO6BstLdreHWLNUPlMXQTZYfiTF29/3Tu8ku4DfNOJh0Y3g8aqOqQ2MtxKBbjnHhQo47aYxDkxYPle576fVJ6NCHwjwFrf4KoVZ9u89nQUwdPK+4jXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iMnsFKH1xKQ/ur/3FBQZu7LCDsvAF2s3+GvO0b6u1/8=;
 b=d/VHC7KWELe+74lKZv6K8RNBbaaA5WKS3IVXlSPERzEcjHJRqudCrPMDgcETQEzEH0rEXRVpV8HvmwAZShk1FBprBvEJd8V7/mrMqZGZajvm1DBTpG+1YS516oeiL/0YnFMAWPPmWApL9N9XJb9+SVWOhoHqCzfuvVTD0c3w3sse0d3OJB9MLMzeDedMXFYZhAteUwa3GbcnZoJ64mwGGu6zQ7T8dHBY0+3ZpuhIQzcQW1oSubacEGsnRm2UiG64mNi6anUgq9OM4oxUQ7rH/ZjiIbltUsCugWNaHZOlfkyd1yxDxBT0BufUd4xOmhmyQwAzqKkwFl42QstInjlAxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iMnsFKH1xKQ/ur/3FBQZu7LCDsvAF2s3+GvO0b6u1/8=;
 b=GOtSpGkMQHxLnbLJ+t1Kh+3Ddfq92jve4VcjTcic3looq0Tr5fFcLuZZ9VhzTEPpxHXgIf0rNJ1BJgkKssM3hOLYLfvdWUDiXaaLvDgyNfBKiam//YpI07q1DzlqMUlvoR5BwE089atp06V/31UGQwJEAslqNZMuf5qQSA390U8=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2451.namprd12.prod.outlook.com (2603:10b6:207:4e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.22; Wed, 3 Feb
 2021 15:54:03 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3805.024; Wed, 3 Feb 2021
 15:54:03 +0000
Subject: Re: [PATCH] drm/v3d: Fix incorrect return type to timedout_job
To: Luben Tuikov <luben.tuikov@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
References: <20210129155439.10128-1-patrik.r.jakobsson@gmail.com>
 <YBp8yGQuP4spzWNJ@phenom.ffwll.local>
 <5f9bc29a-b035-3ebf-47eb-9d7c6452889d@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <6e9ae600-e13e-04a2-cc48-cce776e91b6b@amd.com>
Date: Wed, 3 Feb 2021 16:53:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <5f9bc29a-b035-3ebf-47eb-9d7c6452889d@amd.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR10CA0039.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::19) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR10CA0039.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17 via Frontend
 Transport; Wed, 3 Feb 2021 15:54:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4f388730-7d9b-4b5d-c24e-08d8c85bedd0
X-MS-TrafficTypeDiagnostic: BL0PR12MB2451:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB24519F7B80F943E049B1A5F983B49@BL0PR12MB2451.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: smqvw4AuTew5YUniLQji1wqGRdiQNf+HnLDRqwEsCBLZDp0iuuzDQjAwJBLJ7PbeGEBDYN5a5Sz7AGmnPLmyFkW/ppxM5LGNblk/RYncfOaE+Fz1WnRxzdhA+9JokAz1OqZ4GBPUi8AlVJyoMoNDMLjjhsK9WTc/oHJQG2yjg9J+Y0JIuFboOmZEIwtREazdxzckO2/7x1YxTh4emXb+vurSJFLZXHFcdrdpWRDpwHp1EKaN0RWimVHeUad+OZPjMkzgtMEPIxBsb1J4oSwa1g1wB2uEpt6x8quL8Zz55Kcexs7PfDPPDrFPv7nccyy9rfmALwTSxtr8UsMybaWaROpYA9lgLrSYRIK0yHWInbBRlZE/Ixobu256zCz88v8xu3xweI2Rk1vHmHXSoPU0Lx8M1iG3knWUQWcqdOc3IXgKklmPosG241IP1MvJvPQj2obFqLaqHQUVzGZ4Cj0GVCYtTu8C/smAj/r5JVVg4+hsM3TsVpcB4q3wyM0pGQLcwsA6GkUsRHoHUuw0vwRaSkFqzb2V87kb4BvuOfLppChyQl5tR6OsQ5obuktZKfrKaH+O1Gd9rLX7jmmVy3XVrL51VVMDwAtdgbCqG1y6vQk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(39860400002)(376002)(136003)(6486002)(8676002)(66476007)(66556008)(110136005)(8936002)(2906002)(5660300002)(83380400001)(66946007)(52116002)(478600001)(53546011)(86362001)(186003)(316002)(31696002)(16526019)(6666004)(31686004)(2616005)(36756003)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Z09RNmRHUjBya0lNZjZCRGVVRGprKytiTEFBRHkvRkRzbVhRaFU0eENUSFpB?=
 =?utf-8?B?UG1Ob3laTVhyTVVxN0VTTjRrcklkdXZsY0tSdjFsdmUvRUVETWlHa3NpWjBs?=
 =?utf-8?B?eTQyM3NDanpHa3JOZHFxOWp5blg4ZVJIT3NFQzdNVjVnTFFPc05nQTZKTmJo?=
 =?utf-8?B?Y2RwaEFXNnRVbG9QZ1J4RXJHWWhwVkFXL3FyamJ4akxzNy9aOTJtUmJGVmti?=
 =?utf-8?B?dmlzcWlkTUtUem5sMDgzUGtSWjkvWmF4eTFWSFJ2bXFqSTkvcW5IQTNiRzVz?=
 =?utf-8?B?R0x6NzlVdHVaL0VHSzRBU1FtbVZGcFNaaG9zcWg3a0czdlBJRDNYS1ZqK25P?=
 =?utf-8?B?WGE3dUhNbXJ3VXhoWlJqRkV5NzUyVjRaSzhNQXBQVGwwV3l2dlB6cWJZT2pS?=
 =?utf-8?B?ekMzNWlERWVrYjBZcllrQ3R0ci9seVR2N0RGOGVhRW5qY0pxY2tYN1FBbUd2?=
 =?utf-8?B?NmM4TDg2RW1kWk5Ia1Y2WjZCNENzK2FrRGpOTDlOZVlmclk2c0VNeHhzSEx1?=
 =?utf-8?B?aEtYblgrWkxBTTZ2VlMwS1ZlaDRPQ0JaQ2htRlVMTVliaU9nSldmQ0RTd3Rq?=
 =?utf-8?B?V3o1M0pEcnBXYTR4TWF5NXo1S1BKU2Jza05qSEtocGYzbU95VjZQNW05V2hR?=
 =?utf-8?B?ZXoxSjF5Q1FRZjVYamhqb0hKanFWWDEwcWZpM3kvbER3b1I1VGM5N1JZY201?=
 =?utf-8?B?L2phQ0JOR0FUTWR0K1NrbVppOEdqNjZNYnJzVkszb1NrU0hrOFh5M1Z5STdS?=
 =?utf-8?B?d0ZuU3pUbVJMczFyaVgrdU9nc2txb3N5UVBqUHlZWmtySENyczBQbVNOK1c4?=
 =?utf-8?B?MEVmMTJVd0JOVy9mTCtzQlBCUnRJV2ZQS3psVytINktiU0N5bTZINXoxTEdm?=
 =?utf-8?B?UllENko5U1RNWDFab2pDNzFqWWlCSlBLbXdhSzJDdnR2NVJxSXExbyttelQx?=
 =?utf-8?B?TllUdXg5Mi9VaDdqSWpwc1J3S1RIUzVkYXRtNzFKZXZmY1YxTmFpTk5nb29O?=
 =?utf-8?B?OStDV2tYUHVYbmZqc3NBKytCYXNvcEwwQnpYVWF1SEFuR1oxK0lTRUJJWjdv?=
 =?utf-8?B?c3p1TnBBU1lHTUI1RnpnZ0tjNHV3UmVORzhUYlNKeU5KY3B4czM0am1tNldD?=
 =?utf-8?B?SWRZNW1acjJXQmxtbThMM1F2dVN2d20vQ2dKY0E3YStBK0hhdFpHR09ySjJq?=
 =?utf-8?B?cm1GRWZtTU5Xc1BOM3pITStLVlkwdCttY0RyUWt5eDgxc0JYZTZ6NHZqTk4v?=
 =?utf-8?B?bDA4OEhGYTU2cklFZ3RmbUJtRklRK05QbTQ2SjFia3plS1FPS0RaYWRNbXlP?=
 =?utf-8?B?YnJCZWlOTW8wV3d4RElQczFMYWVwYVZxMmhhSDJqVXNmZEk1NEpXN2R6NG9H?=
 =?utf-8?B?VU1iN0FTSWp4c2lYZHVlQk15bkFsS2hicGwzaE4xckJYNy8weDBjN2lTMHZJ?=
 =?utf-8?B?dkhtdzdNckloSWttbmxQRTlGSUdCR0NpZ3lUUDNBVjlIckNoRGh2ZngyNkw4?=
 =?utf-8?B?YzBsanRFZ2lDOGRZODdlYXEwY3hOVzlIRXg3bU85dXZldHFpK3BZTlg3S3FS?=
 =?utf-8?B?U2UwQkNTN3BTR1RqZzJuMTFtUWsvZStDQWo3cU5NMGF0Um0wcFVYMUZtb1lS?=
 =?utf-8?B?MVNUaysyQVdtUFVKWElIOGVJMGpaeTFSZlBKSWF3bzhLVU5TUzY3eFcxM2kv?=
 =?utf-8?B?WTE0S21LMnhYQ1JiWVBYblpNNGtGSVhNbnAyM1A5V0svSW9MMmlEaTVLenpy?=
 =?utf-8?B?Q2g4NXpUN2w4T1dJaytFdHRvUG9BeSs0RGg5aUNvRlN2TGtNUVpLV095K1g5?=
 =?utf-8?B?eTlwOHlDOHVBR1dDcWhFQkFidUtucFBybXpIaWROZlBKLzVIUndLcEdCeHVn?=
 =?utf-8?Q?pxcIva+EfKr+8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f388730-7d9b-4b5d-c24e-08d8c85bedd0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2021 15:54:03.2484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pZSpxBi2T9CcFFw6Lx9PdBspyY0kULqd9NW4DGAH5QCentt1sWExoSI/ATKTHdsz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2451
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
Cc: dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 03.02.21 um 16:51 schrieb Luben Tuikov:
> On 2021-02-03 5:36 a.m., Daniel Vetter wrote:
>> On Fri, Jan 29, 2021 at 04:54:39PM +0100, Patrik Jakobsson wrote:
>>> The commit a6a1f036c74e ("drm/scheduler: Job timeout handler returns
>>> status (v3)") incorrectly uses "enum drm_task_status" for v3d and causes
>>> a build failure. "enum drm_task_status" got changed into "enum
>>> drm_gpu_sched_status" in v3 of the patch but the change for v3d got
>>> lost.
>>>
>>> Fixes: ("drm/scheduler: Job timeout handler returns status (v3)")
>>> Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
>> I think I r-b'ed such a patch already, but maybe not yet merged.
> I think Christian did that patch already on Monday.

Yes, this is already inside drm-misc-next. Just needs to bubble up into 
linux-next etc...

Regards,
Christian.

>
> Regards,
> Luben
>
>
>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>> ---
>>>   drivers/gpu/drm/v3d/v3d_sched.c | 12 ++++++------
>>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
>>> index ef2338a294ca..ceb33f8e4379 100644
>>> --- a/drivers/gpu/drm/v3d/v3d_sched.c
>>> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
>>> @@ -259,7 +259,7 @@ v3d_cache_clean_job_run(struct drm_sched_job *sched_job)
>>>   	return NULL;
>>>   }
>>>   
>>> -static enum drm_gpu_sched_status
>>> +static enum drm_gpu_sched_stat
>>>   v3d_gpu_reset_for_timeout(struct v3d_dev *v3d, struct drm_sched_job *sched_job)
>>>   {
>>>   	enum v3d_queue q;
>>> @@ -294,7 +294,7 @@ v3d_gpu_reset_for_timeout(struct v3d_dev *v3d, struct drm_sched_job *sched_job)
>>>    * could fail if the GPU got in an infinite loop in the CL, but that
>>>    * is pretty unlikely outside of an i-g-t testcase.
>>>    */
>>> -static enum drm_task_status
>>> +static enum drm_gpu_sched_stat
>>>   v3d_cl_job_timedout(struct drm_sched_job *sched_job, enum v3d_queue q,
>>>   		    u32 *timedout_ctca, u32 *timedout_ctra)
>>>   {
>>> @@ -312,7 +312,7 @@ v3d_cl_job_timedout(struct drm_sched_job *sched_job, enum v3d_queue q,
>>>   	return v3d_gpu_reset_for_timeout(v3d, sched_job);
>>>   }
>>>   
>>> -static enum drm_task_status
>>> +static enum drm_gpu_sched_stat
>>>   v3d_bin_job_timedout(struct drm_sched_job *sched_job)
>>>   {
>>>   	struct v3d_bin_job *job = to_bin_job(sched_job);
>>> @@ -321,7 +321,7 @@ v3d_bin_job_timedout(struct drm_sched_job *sched_job)
>>>   				   &job->timedout_ctca, &job->timedout_ctra);
>>>   }
>>>   
>>> -static enum drm_task_status
>>> +static enum drm_gpu_sched_stat
>>>   v3d_render_job_timedout(struct drm_sched_job *sched_job)
>>>   {
>>>   	struct v3d_render_job *job = to_render_job(sched_job);
>>> @@ -330,7 +330,7 @@ v3d_render_job_timedout(struct drm_sched_job *sched_job)
>>>   				   &job->timedout_ctca, &job->timedout_ctra);
>>>   }
>>>   
>>> -static enum drm_task_status
>>> +static enum drm_gpu_sched_stat
>>>   v3d_generic_job_timedout(struct drm_sched_job *sched_job)
>>>   {
>>>   	struct v3d_job *job = to_v3d_job(sched_job);
>>> @@ -338,7 +338,7 @@ v3d_generic_job_timedout(struct drm_sched_job *sched_job)
>>>   	return v3d_gpu_reset_for_timeout(job->v3d, sched_job);
>>>   }
>>>   
>>> -static enum drm_task_status
>>> +static enum drm_gpu_sched_stat
>>>   v3d_csd_job_timedout(struct drm_sched_job *sched_job)
>>>   {
>>>   	struct v3d_csd_job *job = to_csd_job(sched_job);
>>> -- 
>>> 2.30.0
>>>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
