Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6BC7B9A2F
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 05:18:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A52610E173;
	Thu,  5 Oct 2023 03:18:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1931510E070;
 Thu,  5 Oct 2023 03:18:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iv/XdxZJ10tG3CPz3H+7wBKVdJV4MPXbpeFJJp8YWr+EbgKFmIEzttao5SaLFUk/g5esGWOWcMMU/GF1npDCJPgrxO/v6x1JobXly8ZwghS4f4GXDMIEr7iIHZFHU8VMne7GoAHn56+z2n9Usa8aHF4/FUX0EwUFinX8DrHN9jIZ6PgP/bKk3MAsNOzyAWOQpNY/kmUPtqVufCbZ3ckdI4xszkQj6eShaOiDOA4bPcQd1BhPJgDTVuzZFGtH6/eD6VkurN7aNJilpZhrNYKX6phg5DnJE6b0jILwfG4OLuCv5tfHw/1WPx8OJRO1oi9JPH6M9ZfB0mUmdbpsJR38WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1KeCtRVObSKCLtKr4Ra8VO01Av+okcZy0IS73ECIkr8=;
 b=Lot4aJrr87Dw4wNsfepxWr2u2PHENVXbyVoqG9PEI/XZVlFrRIqfOGyVqvpiOaeQZ2cuIHfegDoRKfIpbJzkmHN8j5lEwoinMopkFGSNCkDW3P/gybCmivcJt3ENZ+VIaXQm5TkdwvI5AmOCCaevkLnDIN+n1q3pKQf95Mn1Nycjuju1Lvx4ybeOFK4ve0UFdD9/iaVSSOwXzeQTSEWmFPtHR8eV6MDRf30On1Foy9tH6VI8RHFfN+ygOB1MWcKFeLmS8gti05nUQ74GXTtgVp2MrLC7b2skGvfLI3RxA2hBbZ3x18WeAuGF3rKqb7QFs0STgWvp+l447KPidtu87A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1KeCtRVObSKCLtKr4Ra8VO01Av+okcZy0IS73ECIkr8=;
 b=hM2IsI5NK5Oqfa9OvSpjYzUvmXBbQXuJwFlpcQwbro6WETr7LP4wqBrb2xKGu9bAWici8JeVhjAgjTWvN8Fjvyn5yXvWrugGOEeZQG04C92Z6jJhZy1uN9rOAw6qaSyVSo7Tzbflga9PXTzgd1oFpi7FKpy5yzEMB5dwYEjmuMo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 PH7PR12MB7965.namprd12.prod.outlook.com (2603:10b6:510:270::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.35; Thu, 5 Oct 2023 03:18:49 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87%3]) with mapi id 15.20.6768.029; Thu, 5 Oct 2023
 03:18:49 +0000
Message-ID: <f3510bf6-a6d2-4404-8e57-5df9fa20bc67@amd.com>
Date: Wed, 4 Oct 2023 23:18:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.3.1
Subject: Re: [PATCH v4 07/10] drm/sched: Start submission before TDR in
 drm_sched_start
To: Matthew Brost <matthew.brost@intel.com>
References: <20230919050155.2647172-1-matthew.brost@intel.com>
 <20230919050155.2647172-8-matthew.brost@intel.com>
 <24bc965f-61fb-4b92-9afa-360ca85a53af@amd.com>
 <352c6ddd-86f3-41bd-b0c7-cfe3e0cdc04e@amd.com>
 <ZR4pW6XaNdjkokr7@DUT025-TGLU.fm.intel.com>
Content-Language: en-CA, en-US
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
In-Reply-To: <ZR4pW6XaNdjkokr7@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQXPR0101CA0039.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:14::16) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|PH7PR12MB7965:EE_
X-MS-Office365-Filtering-Correlation-Id: d600a11f-3d26-4028-3fd9-08dbc551ca9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HJ6BIGrpVou6PdpNwdtw8z7GTB+Gw7XEg5S9eDxYvAgoAUVDFyxQW8RVyMJ9kJcUtpe1R1ukGxs+lMhrar81swhNQREib5/NMU/SdUYcMibVpLKA79BgaGRy55oogTU2Lms1EkPC+H8NVkc7F34SUj07zsh8eo4qrrITanpVdXf7jHJhWcWDpSlrrP8a6+t2qq057i31sPRl5TNsNbRawdOq1GPFUFkP0p88r5Yj4opI4gVZF4ITbAZeGG9DGb5pQ8KVEvoKGuLGm9VfizPGU+zUA/yKLz1BGZOd13MMvthToFGSTIFlS5+ntGjjQgaoBbLeDs9bhNia7/gjkDlpU2VCgfCOqwlJMHkYfsHB+1wyrz38kOH4NYImgnx0cAlxX2pBl1XTgJQuwsMJ/nyWbLrHX/B0He/KNgyWLvhm+qRaJ6j10NPrxgZgIwi62u9ze71GVjWJjD6BN/7ZIGVRX5TYCTZQWbnYQ8Dn3CjXWHJ5KFJ5Stw42fCOW0ZaW8p5fzUIfGeAsPbLyGYwqERlHzOa6aNks8ezRA2Pjw7yjVdYMfzAkPoohrR/KtjS+YCx3hYGUPdfs+gYIjtiZ2om0Fb1/RMaqfsMFL+eWYnQA1c/1huXgX53rE9Ig17tO4xPilX57i8vKnwXWufIMXHf+Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(376002)(346002)(396003)(39860400002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(6512007)(6666004)(53546011)(6506007)(6486002)(31696002)(86362001)(38100700002)(36756003)(26005)(2616005)(2906002)(83380400001)(31686004)(8936002)(316002)(44832011)(6916009)(7416002)(66556008)(66946007)(66476007)(41300700001)(8676002)(478600001)(5660300002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFBNTTVJelJyKzE2dWZJdXNUeVZQZkIzdEozN1hmMnV5RnJlK3llZEdDcDFs?=
 =?utf-8?B?SDQwVVA2eGo4N3pCQjRnbXRzTzUwRGd1K21GMEk2eHI1SWg1dmJZKzJ4NFJx?=
 =?utf-8?B?S0htMEdDTWREeVM0N2VPeHB5cWEwYXR4a1JDU2E2TWFBRU05OUxpdHFlQ2VT?=
 =?utf-8?B?anBHSHp3T0Q4UjZoWHFSbmtWSkllUkxOenZZZjgwbGtqQzNqTnk3SDBHOFVm?=
 =?utf-8?B?QW1WanRDaXdGUlFlVTNyRy9aNS8yR203aFVJbWIyV3VpVjE2alQ2a0RtYnB5?=
 =?utf-8?B?Uy9xUFpMS29IZkpZRWJNTjRQYXBjZTUrdmpkdkVVYzVGRW9KYUJNSXZSNGZ0?=
 =?utf-8?B?emZtQzEycGZmT0MzbE92VnBYWmEyVmprVUpDT2QwaERlTTNuVDVpZTNNRjY3?=
 =?utf-8?B?MUV6N21zVFVOWWpZZytVaS94OSt3cHRDT2VpOHRpcU1oMDF4K3V1SE1LS2NB?=
 =?utf-8?B?YzFQV3hFWS8vdVVHRHJ1U0VnUTUrNkg0SzVLa1AwWVVTaG9NNFFGcVJ1TXdy?=
 =?utf-8?B?dFhPNTFFVHExVzRSVXNZSHkwaXFMcVRIb2VBTDhmM01BVG12NzJnbXc4a2gy?=
 =?utf-8?B?UHYraWtmS3lPOG1NSUMrYlNOSk03ZlpuN243MEw0SnhKYzdWU0FKVnlvd3pZ?=
 =?utf-8?B?NkFUNzFnSDlQVzBuK1ZCWDlKZkVHMUxpem0rQUlMTHJaYVVMSE5KV0ZTOXVV?=
 =?utf-8?B?MGZjb250a1Jhc0w0cWFYZk9Kb2VUbHhNMTFiaFNKSE9TMy9zMmsvc3JYYVRP?=
 =?utf-8?B?eHFtOFFEVndVc1pvall4MTlCSk54dldYOWdtRXVOazZ4N0xMTVBGVTJTQlpB?=
 =?utf-8?B?TFA3eUZvb0g0M1pJcmpoelVNaXNVTnM5cGNhVkZQVjQ4enZ4MGR6dEhJOTBo?=
 =?utf-8?B?dTRCeFY1NTlWRGVIaXBXYXNLRlc1K2tVRFZnT0VkQ2xNV1RKa1podS9WaDZo?=
 =?utf-8?B?SFRCT3VHcnU3YTNlUmdKYW5kekZJbElKdzBMM25UTVBad3o4aGEvVXR3bTN2?=
 =?utf-8?B?NnBVMTdweGxrVlhKWG5hcGZMcHZtYVlOWkVPZ2NGdW1rQjZyclU1ZjFSN2ND?=
 =?utf-8?B?cEc2NTVvVHVEWGoxNnNsdDhGSWdPSlhmTERMdlpXQ3BlVnFLV3psL252Q2dn?=
 =?utf-8?B?Z05uMUtqRCtWM0pwb0hqUGQwUVN2dVIwaDU1cEVTZHRWc01KcHpJeWRRQWFi?=
 =?utf-8?B?ODVWUHM0Q1JIRDh0TmcxTThTK1dPaDhQWTg5N05lTElQTmJHY2dCcnBRNGdr?=
 =?utf-8?B?c3J3MytXY0Z6SyszM3l2REpKWXhheldGbWVMMGk1OWZ2ZTFRbG1QWERYQnEr?=
 =?utf-8?B?aGNkNGYyNTBpek1Jdkd1eGF2WVR3dDVGRVcxMVJMQStuckRjMlJNYVg1QXBR?=
 =?utf-8?B?THdZVC9sZUxMRjhIZW9EdmUxNnhRZHlZaC9TNUJFalVTNVgzcnBvbzcxZkJ3?=
 =?utf-8?B?cEh4NjVOVHFZMjY5NEorc0J1QnFvd1Q2Y3VGYS9Nem9CZnNRVTV6d3dDNUNm?=
 =?utf-8?B?US8veEl0SzJYOWlXNXVOQTlDdEJZeDlscXRZV3FpSlVkeDdRWFV6dk44Z1Nq?=
 =?utf-8?B?ZXN5V0lVNTBXQkphSURFZE41dmc2RGo2MmFpWHhvb3JvMjQydlFQY2VwUlQ1?=
 =?utf-8?B?YVpTSjJqclFNd01PYlN3b210R2ozNnVLRDYxVzFTSG1PaHloak5GVG5yMnhu?=
 =?utf-8?B?eUhHTWRRNXgwaW01SmJOaERYcDdTemVDL21qOUl1KzR3K3NPZ1RkVVUzSGVO?=
 =?utf-8?B?dHc1dUkzM0QwWEphVjc5SGxUN1FPemZxc1JGT2c3WXI1a2EzTy8vZEJXbmpP?=
 =?utf-8?B?WWZiRTB1RW5FVmRsTllxSXdqT1NDVUVrR29BbU1TTHUxbVJBZjRpOENJMDcx?=
 =?utf-8?B?MEw3QzhWN1NZNVcwZGowa2R6b1UxbitOcnAzOWFRaHRzM3FjbnczWEcrNG9t?=
 =?utf-8?B?ZFlidzQvdTFNQmIrZGZweExwUWZ3aERaYmNjdUl6SG9HbWZvNXVSdHd6VUZi?=
 =?utf-8?B?eVIyQUs1TWQ2N0ZPTk41SmtESmtOOHRYOW9mWjFnTHV3SmxUaTRpRkQzUFVM?=
 =?utf-8?B?RE5LQmpEVU9pQ0MwUVpCTDJkSUVEY1B6VjBkaUcwdjZHZVVKTFFsN05wOGZs?=
 =?utf-8?Q?ftGAzG+v+ulu7Hariks/K7cYp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d600a11f-3d26-4028-3fd9-08dbc551ca9d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 03:18:48.7485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z/iv6LP3BCqmtN5yW48b1W2CQ2rhqHdEvUgGrq+w8ShENW7tmU4sJCIkWYuJjo3c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7965
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
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, Liviu.Dudau@arm.com,
 mcanal@igalia.com, dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 boris.brezillon@collabora.com, dakr@redhat.com, donald.robson@imgtec.com,
 lina@asahilina.net, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-10-04 23:11, Matthew Brost wrote:
> On Sat, Sep 30, 2023 at 03:48:07PM -0400, Luben Tuikov wrote:
>> On 2023-09-29 17:53, Luben Tuikov wrote:
>>> Hi,
>>>
>>> On 2023-09-19 01:01, Matthew Brost wrote:
>>>> If the TDR is set to a very small value it can fire before the
>>>> submission is started in the function drm_sched_start. The submission is
>>>> expected to running when the TDR fires, fix this ordering so this
>>>> expectation is always met.
>>>>
>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>> ---
>>>>  drivers/gpu/drm/scheduler/sched_main.c | 4 ++--
>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>> index 09ef07b9e9d5..a5cc9b6c2faa 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>> @@ -684,10 +684,10 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
>>>>  			drm_sched_job_done(s_job, -ECANCELED);
>>>>  	}
>>>>  
>>>> +	drm_sched_submit_start(sched);
>>>> +
>>>>  	if (full_recovery)
>>>>  		drm_sched_start_timeout_unlocked(sched);
>>>> -
>>>> -	drm_sched_submit_start(sched);
>>>>  }
>>>>  EXPORT_SYMBOL(drm_sched_start);
>>>
>>> No.
>>>
> 
> I don't think we will ever agree on this but I pulled out this patch and
> the next in Xe. It seems to work without these changes, I believe
> understand why and think it should actually work without this change. If
> for some reason it didn't work, I know how I can work around this in the
> Xe submission backend.
> 
> With this, I will drop these in the next rev.
> 
> But more on why I disagree below...
> 
>>> A timeout timer should be started before we submit anything down to the hardware.
>>> See Message-ID: <ed3aca10-8a9f-4698-92f4-21558fa6cfe3@amd.com>,
>>> and Message-ID: <8e5eab14-9e55-42c9-b6ea-02fcc591266d@amd.com>.
>>>
>>> You shouldn't start TDR at an arbitrarily late time after job
>>> submission to the hardware. To close this, the timer is started
>>> before jobs are submitted to the hardware.
>>>
>>> One possibility is to increase the timeout timer value.
> 
> No matter what the timeout value is there will always be a race of TDR
> firing before run_job() is called.

It's not a "race".

In all software and firmware I've seen, a timeout timer is started _before_
a command is submitted to firmware or hardware, respectively.

> 
>>
>> If we went with this general change as we see here and in the subsequent patch--starting
>> the TDR _after_ submitting jobs for execution to the hardware--this is what generally happens,
>> 1. submit one or many jobs for execution;
>> 2. one or many jobs may execute, complete, hang, etc.;
>> 3. at some arbitrary time in the future, start TDR.
>> Which means that the timeout doesn't necessarily track the time allotted for a job to finish
>> executing in the hardware. It ends up larger than intended.
> 
> Yes, conversely it can be smaller the way it is coded now. Kinda just a
> matter of opinion on which one to prefer.

It should be large enough to contain the command/task/job making it to the hardware.
We want to make sure there's no runaway job, _for_ the amount of time allotted
to each job.
-- 
Regards,
Luben

