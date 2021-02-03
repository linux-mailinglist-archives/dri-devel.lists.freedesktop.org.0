Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E4230DEAD
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 16:51:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 646226EB1B;
	Wed,  3 Feb 2021 15:51:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2056.outbound.protection.outlook.com [40.107.243.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E756EB1B
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 15:51:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=naw/ILm4Wk7dAVZLu1Sse7M26QAytcFliXlIn3Sg8s7xim3DlXUgE/hf3S6PVD/jWkaLZu09r+yNAhkoTbqLkS0CIB8ZfB+huuk445ykOEmgU1NRPdUTpX5PJ5KThCfTzjfJuHiJbCuN3UhcysHeVQ/rh3PFH7/AdeSVgn3mEDh2Hr3WgIqcv+oT+R5tdNG/ktoTSGzg6u5tfZ9jTUGLqDZAlrp7/dSHb5iCZNbtkTv0jNcwkqAHSXn1bw1YBcHaNMS7IYCRt4F35WgQkyWgzb0yDpfoO6FbnppvQfrFQxj4WW2oV7t4dgwSXqWp8JcFp0GAD7ju3bv2WJTLLnMxzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KD8euaiWKlUHbrHIFVSPX0H3OXP1kSHNloKe+OsCWoA=;
 b=SWp3rsOY0NrB0MNZsKt1Q9L9Pn7qRQU2Kc80bi4ABeyIxqlVwpKQnyN6+xundNNec1l6kz85/6Me+VQza8a+i9mQgdTMTG1d8wslbeeD9BBTNGOdrpPg4ynBbEqGWZY488e9V4RwmPaus/zcgmmeH5VzNP7XmGw06FYia+iVNKh/XmPSava0Ioi00ocTtihjBVkEyQ5+K41RCeZnqX6he0b5L0bAyLpzdJ1DKMH9iPEv2IYjV7YM1QHGFRqXnQwf4/9K0Yq6ElbwnSKMvmYW7z/XSTprPKVoKOsGbyFmOj3ukbSu9s0/zY0RELhSWmgumw2IcCh/W/ane56EpjFC3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KD8euaiWKlUHbrHIFVSPX0H3OXP1kSHNloKe+OsCWoA=;
 b=H1PvadCcaKiJSX496qJ9w1iAg/Yg842wXhtwxqJ7mqsQwy73KWySqQIy+Smn7V/3JOnV11ulhO3F2vEvLxKS9DE+Bn2SoJnUXgPT/K7Kqn90SMh/gHFiK0dCU0rLFlIqGsRWopT08Cs+fRCETaZyCTVthnIbs2LAamdZ0RtAWnc=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM5PR12MB2359.namprd12.prod.outlook.com (2603:10b6:4:b4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Wed, 3 Feb
 2021 15:51:34 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::60b7:6bfc:44a0:269d]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::60b7:6bfc:44a0:269d%6]) with mapi id 15.20.3825.017; Wed, 3 Feb 2021
 15:51:34 +0000
Subject: Re: [PATCH] drm/v3d: Fix incorrect return type to timedout_job
To: Daniel Vetter <daniel@ffwll.ch>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
References: <20210129155439.10128-1-patrik.r.jakobsson@gmail.com>
 <YBp8yGQuP4spzWNJ@phenom.ffwll.local>
From: Luben Tuikov <luben.tuikov@amd.com>
Message-ID: <5f9bc29a-b035-3ebf-47eb-9d7c6452889d@amd.com>
Date: Wed, 3 Feb 2021 10:51:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <YBp8yGQuP4spzWNJ@phenom.ffwll.local>
Content-Language: en-CA
X-Originating-IP: [165.204.84.11]
X-ClientProxiedBy: YT1PR01CA0056.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::25) To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (165.204.84.11) by
 YT1PR01CA0056.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.17 via Frontend Transport; Wed, 3 Feb 2021 15:51:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f5a76228-4843-47cf-3f63-08d8c85b94d0
X-MS-TrafficTypeDiagnostic: DM5PR12MB2359:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB23591080B64E468D6E15B4BB99B49@DM5PR12MB2359.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IUkNPdNhjADKXAKqDkm/XIP7qjlR67B6NPwid7awfyHCbuCuzCpCn7PWnAZUxmEJ/kFxQdltkYXLv3JLwCicATVeAC7v9Jb2qrgUQy5R2SFJbNXl4gUwkgbH1yOJxs5avxhstxfjTkyGU9rN+O1uk6ZiHEwJu9dNQZ/u76hmh9pMw1fbxs9m7FAMw1rSFa+CG+kE/BFgAilbhRql9uWlZzXykpdTOCpCvTKPeeJ5e+yfVwx6Wmv+WR3UfoKWYHCfLK0OJ9i6/9ER/6SGbdhXNgpgMLxWJB7gtFMJhbqzrLgRHXlZI5FYpsYBe99fnDQqBG35cvyhzUHGLE8TGNbY+gGu1/HCq01WXWogRRDHt45pvUP2cmIfiGdugytcOKT+NJ+K79PhS1IP6FkYyV+PU09yF7v9u4WT3FFadTgOGUoaVqbdNM8NzWv0mGRADodeuGLSy36S3KQUq8rmeNUrzyqA/hXxGvE3R45ipMFRt2F60qG88v4a3e5mB2LzZVAAS3meky2rZvgLTlWH6fzb4iY4LYBcJubmA/Om7h5q72ZcBR6/43CNKjpm4pAxLhxXG7F17h0c03sRU388GU+ybthkWQrPG5bm1a17RvhW3O4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(396003)(366004)(39860400002)(31696002)(86362001)(6512007)(83380400001)(44832011)(16526019)(5660300002)(52116002)(110136005)(8676002)(6506007)(66556008)(26005)(66946007)(4326008)(66476007)(956004)(186003)(8936002)(53546011)(2906002)(6486002)(2616005)(316002)(36756003)(31686004)(6636002)(6666004)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?L2lmVGNUUTl5ckU1V2tqMlA1S2g5dzhJOVZmR2ltcW5qbVErSTNrQVAwcmJx?=
 =?utf-8?B?U3NWamlwZGxleGlxQjdjcDYzZDgrSU9HakI2cWtNREhXblZ4d3BIa0ZuaTZk?=
 =?utf-8?B?bllvUVJJK085Tlg2RHQrWkh6Z0d3SjhpWWo0dVBlZU0ydUxVMzFGMFhZUU93?=
 =?utf-8?B?T0I0Y21TSlJlUzAyUG52d21wTTdCQ2JneFRIaUkvV3ZtUWpqZnNuYlplNk9F?=
 =?utf-8?B?Q0hOLzdTZVN0OEVtWG8wUndyZ2JKMGROc0F4bmhiZVg5UEtDcUdidEU1OCtI?=
 =?utf-8?B?MHBEakxiL2Q4ZDhMVDZGRnY2VHcyZ0owOTdhcDFrVG1idVNxbDRRNENFRlJO?=
 =?utf-8?B?NkpEYnZ2bnlpVzZLd3RGSkVSL2I2RUZCdU81ZldzR3ZtcjA3QWFDT1pzS1Fk?=
 =?utf-8?B?aklqd0NmdDhTU3Q5VkplaGE4Wi9CRnExVDNaUWdDMndHdFdBb3FKRU5vSjZO?=
 =?utf-8?B?Q1pDU2l1ai94eWpNWmFGa3NRSGFaNEF1a0dzeVNGTEcwUkpHY0lSK1A4WVRS?=
 =?utf-8?B?bGJNb0oyMFZvTGVLdE5vaGRqOElDajA5WFB2cjRZTDM5TFhVRFZwaWY4dW11?=
 =?utf-8?B?L0oxOXlpd0JiZkpKMnloK3hSOVhCVHNvdUR0ZVFJczJiS0RCcTdDU29WaUlp?=
 =?utf-8?B?VXdKOVVuYjVlUzNRL2x6VzM1L0RySFhmSGpxRW9FdTI5K01VNGNkVGYrYXRE?=
 =?utf-8?B?UEtZZE5pT1BGM3hKUWd2UFVwa0VHU003V0JlT3hHeW1xQmFBTEgzaDRwUFV5?=
 =?utf-8?B?YkJoZzdiMG51dlZOU1VTTTlycTJXTTMxQUtaTFAza2hEdE10OGNIRWJrZTdD?=
 =?utf-8?B?U1RQblpGRnNtYkpIZFV4Q0QrekxMQ0FoS1lLL1RNYnZWdU1xbDA0eEdpOFRo?=
 =?utf-8?B?NGs5czhiMHlqR3JoTGFWNlU2eHlXV0RtK3FmZVJqbTdQRm5sZkoySjdPWjRH?=
 =?utf-8?B?bEhjNDh1dHRzL1ZNMFBoQzZUMHBVNU5BMm8xK3czcVV4OEw3K0lMSUErajg5?=
 =?utf-8?B?Q3h3bWhETHRGclBLT0c0bmdteUpZS2NVeUErdms5K1BvNDNWV0xYWWo1UkdO?=
 =?utf-8?B?V2ZLcmdOano0Vno3aW0zZGhMbjl4aFQ4MTdsYzgwL3ZmMmE3OTY4NzNSNFZH?=
 =?utf-8?B?RVlod1FieGtqUmFzZWJVcXlUMFBsLzVrcnFoYmticXUzZy9aVjd2UHljQ25q?=
 =?utf-8?B?Vk1MY3JLdUMrTHp2QXduVTlJUHNEM2t1NHlxcklUcEViQlZrcXpJN2NYN1dk?=
 =?utf-8?B?TmRuaTR5NU1xUk9ieFRVcVlwNkVFczh6QUliL0NWNUhMTWhtWUVhWU5HYmtR?=
 =?utf-8?B?cmR2QjA0SGR0RkZVRTViZTk4Zk90c3BUOWdrang4OUNRcTJqYzdoaUQ5dmFx?=
 =?utf-8?B?NjFuWUszK1BiVWRTc0NLLzlua3FmZDB1OG16SlZ0UHNtVDh3UlRyL3RqREda?=
 =?utf-8?Q?ASkxMA8a?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5a76228-4843-47cf-3f63-08d8c85b94d0
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2021 15:51:34.0018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HW/4Q9cdbJzCHRsyHnT4p6VyVWz0xSwU36rfrvdGD8ypULCdxCIzfnipjdXnx9Od
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2359
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-02-03 5:36 a.m., Daniel Vetter wrote:
> On Fri, Jan 29, 2021 at 04:54:39PM +0100, Patrik Jakobsson wrote:
>> The commit a6a1f036c74e ("drm/scheduler: Job timeout handler returns
>> status (v3)") incorrectly uses "enum drm_task_status" for v3d and causes
>> a build failure. "enum drm_task_status" got changed into "enum
>> drm_gpu_sched_status" in v3 of the patch but the change for v3d got
>> lost.
>>
>> Fixes: ("drm/scheduler: Job timeout handler returns status (v3)")
>> Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> 
> I think I r-b'ed such a patch already, but maybe not yet merged.

I think Christian did that patch already on Monday.

Regards,
Luben


> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>> ---
>>  drivers/gpu/drm/v3d/v3d_sched.c | 12 ++++++------
>>  1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
>> index ef2338a294ca..ceb33f8e4379 100644
>> --- a/drivers/gpu/drm/v3d/v3d_sched.c
>> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
>> @@ -259,7 +259,7 @@ v3d_cache_clean_job_run(struct drm_sched_job *sched_job)
>>  	return NULL;
>>  }
>>  
>> -static enum drm_gpu_sched_status
>> +static enum drm_gpu_sched_stat
>>  v3d_gpu_reset_for_timeout(struct v3d_dev *v3d, struct drm_sched_job *sched_job)
>>  {
>>  	enum v3d_queue q;
>> @@ -294,7 +294,7 @@ v3d_gpu_reset_for_timeout(struct v3d_dev *v3d, struct drm_sched_job *sched_job)
>>   * could fail if the GPU got in an infinite loop in the CL, but that
>>   * is pretty unlikely outside of an i-g-t testcase.
>>   */
>> -static enum drm_task_status
>> +static enum drm_gpu_sched_stat
>>  v3d_cl_job_timedout(struct drm_sched_job *sched_job, enum v3d_queue q,
>>  		    u32 *timedout_ctca, u32 *timedout_ctra)
>>  {
>> @@ -312,7 +312,7 @@ v3d_cl_job_timedout(struct drm_sched_job *sched_job, enum v3d_queue q,
>>  	return v3d_gpu_reset_for_timeout(v3d, sched_job);
>>  }
>>  
>> -static enum drm_task_status
>> +static enum drm_gpu_sched_stat
>>  v3d_bin_job_timedout(struct drm_sched_job *sched_job)
>>  {
>>  	struct v3d_bin_job *job = to_bin_job(sched_job);
>> @@ -321,7 +321,7 @@ v3d_bin_job_timedout(struct drm_sched_job *sched_job)
>>  				   &job->timedout_ctca, &job->timedout_ctra);
>>  }
>>  
>> -static enum drm_task_status
>> +static enum drm_gpu_sched_stat
>>  v3d_render_job_timedout(struct drm_sched_job *sched_job)
>>  {
>>  	struct v3d_render_job *job = to_render_job(sched_job);
>> @@ -330,7 +330,7 @@ v3d_render_job_timedout(struct drm_sched_job *sched_job)
>>  				   &job->timedout_ctca, &job->timedout_ctra);
>>  }
>>  
>> -static enum drm_task_status
>> +static enum drm_gpu_sched_stat
>>  v3d_generic_job_timedout(struct drm_sched_job *sched_job)
>>  {
>>  	struct v3d_job *job = to_v3d_job(sched_job);
>> @@ -338,7 +338,7 @@ v3d_generic_job_timedout(struct drm_sched_job *sched_job)
>>  	return v3d_gpu_reset_for_timeout(job->v3d, sched_job);
>>  }
>>  
>> -static enum drm_task_status
>> +static enum drm_gpu_sched_stat
>>  v3d_csd_job_timedout(struct drm_sched_job *sched_job)
>>  {
>>  	struct v3d_csd_job *job = to_csd_job(sched_job);
>> -- 
>> 2.30.0
>>
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
