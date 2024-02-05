Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C129C84959B
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 09:45:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E93910F2F2;
	Mon,  5 Feb 2024 08:45:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="aBHtQbhU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2053.outbound.protection.outlook.com [40.107.243.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7819C10F2F2;
 Mon,  5 Feb 2024 08:45:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oIWEegPCZMGjvS6MbGo31cbbsVyyEb/lt1wgs7wybwCFptA4LG0LcYLlPAniGxuOtFIJpPFTk3wA4dLn1cX1FAubya8tOLh7gZ4Od7AtOdPtNWyk7Jm0BJaC9lk1nB1H8nUD2OR7A6eSKlJ5VBlsnCG/jnENRsyMm/vD0pW5xD5deHUyzTkhtlKQMRyx7uB7gMIsyjsNrk2aPdqXAulJN7nZmVt7U8ph9nrX/OGQ3Zg2yhF9hZ0F/N3bDg548UfozFNvWQCkaIWMK4/AQRYNmTZBl6R+ase4AIkw0q+b/JRnntLmkC9aNsj8xB+mzp3+finkQBVrelHMVpqixONd+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p5fiiknEPqUMxIBH7KwkKmbFvLUyh9JvVUJH2omUKgU=;
 b=Pj9f5wwrSTTPw45SahH7Xn6NXGpv3fbI6/WdYkucJMXdlovT+wYaWeYICx9xfZ96N3hpIY/9djFBX2Kdo2gzLODD3gQhQN3PQwn6fy7KWqTY7ct4epdijpinH2j/E89Q0nzA/4fVCt/s3rl0XoTaN+hQFw+6phi6lkH+ETI8/tVlhyiOlw6MyRQxTl9g5zTlygVi+2lmnH/bVfcx9RtXgXClvAzuTdpw5JSzDIblFCcxYreypJESK2j9h3dYIenGspoBwCxrg6K8VwD5ZPNqk+V6oAXT+rb55ugyVFQSsn4EAuIyzmUlfGKrDgpiQtdOzVDDlxFV1XSmpyCDU6R65Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p5fiiknEPqUMxIBH7KwkKmbFvLUyh9JvVUJH2omUKgU=;
 b=aBHtQbhUpO9XOFUmWnwPMrxIYSwMZb4Td8Ti3w6tOjnFPEGuC7wJHHx8B5A5kgQCnp0uxh0v3eIB69OnPkTGArPEZ4L34MJHXWbrQ0bEQL3CLKPahCocs5ClzEi2JsIXyi3krrZh9Hf7tvZRb4VYa4E4q70dDXfPLQprGg+jhrY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM6PR12MB4121.namprd12.prod.outlook.com (2603:10b6:5:220::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.16; Mon, 5 Feb
 2024 08:45:02 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7270.016; Mon, 5 Feb 2024
 08:45:01 +0000
Message-ID: <c5a7ae52-98e2-4edf-a539-71e4166fe3a4@amd.com>
Date: Mon, 5 Feb 2024 09:44:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Re-queue run job worker when
 drm_sched_entity_pop_job() returns NULL
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, airlied@gmail.com, ltuikov89@gmail.com
References: <20240130030413.2031009-1-matthew.brost@intel.com>
 <e7707834-9298-4392-a7ec-f4e5f382fa02@amd.com> <Zb1ll0rXlbaAaxKP@intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <Zb1ll0rXlbaAaxKP@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0056.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM6PR12MB4121:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ecc0dd1-9de0-48d7-62ae-08dc2626bddb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jmI+d97Lnak3YKtE84HLdeLTw3bnFQFJRDLNhAN0wKwedDqJSZoPjHu6QH44ky873MQsYMtj+yDVldQAAyxW9loYr7xWW7jtHllgkv8qQzX2mWGaOew0wcGM/D837zQ/f44hYpFi8+prXrQaP/YTbpAHotnj6FU2qLkt7IZbaFf2uWwZBTnuoPyIb12+AfnKtFz+JVTzwLichhU8NTxkvGxcrA1twWDB/t64w/gQUKsTuYCVyMUJXkjRazx1jBlRJ6pSv66Ei+YfH/wq5olmFia9LmatdoPUDXPWmvsdNZvlglS5ZzB2RyXBHyeZB0S2injDTb1v6ZnTeB4NCBTwiRy72Lbrh3TVUaqSiLEK/0n8scpUJsk3BqrwiQaLJ/x6D1U/3MIA9DLvWROgMDOSGHBl0fOqqRLQ+U/WOjU8gSLiNeavMgKjyl1WCZ8ipIHwZrewku3xwe/bOZej4hq157kk7nGY8uIvjj4u+xmHWCcqJrouLF6UsNJys6QZG/qVL79zvWF0jHmUwjmFk+NxBgvdP/MCbuXWBf6eeg39sqUT0+oTRvjO/8w8PDZkN5ja3Y6eJjTo4vdmIqQE6P8qhCO/fdmc/LGnVKBe8fjB4UwZSeZH1ffEaZZiXbobo8nJD9V3kgDPFMjG/x8THzv3lQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(346002)(396003)(39860400002)(136003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(41300700001)(31686004)(478600001)(6512007)(6486002)(86362001)(31696002)(36756003)(66574015)(2616005)(83380400001)(26005)(2906002)(316002)(66946007)(66476007)(6506007)(5660300002)(66556008)(6666004)(8936002)(38100700002)(4326008)(8676002)(6916009)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlFKRjVQVjBQaGs2YzZpZ0lxNDErUWtON3hvTENyTVU3Y0tSTTJSMGpGajAr?=
 =?utf-8?B?N1NNc2hLSXdhVkp6K2diRG5rUEI3a2ozRjVUZUhmTk8yeUs0NXNnYStkckl0?=
 =?utf-8?B?UVZFQTFubnlUZkVqS2pHdkViY0VENjZvQnpqTzBlMUVKWnJqMmlyMGZOeGdF?=
 =?utf-8?B?RlhCLzlJTzB0cXRiN1VwZ2p0RDAzRzZkOEliOEpkV1lRY3JvSXQ0bW5HNFFD?=
 =?utf-8?B?dExWQ1dJTWpZV3RHZDlqYnQ2dWtNbzBzNXFkTkRpaDBwaGVYclVxSUNEQ0px?=
 =?utf-8?B?RTRDd21TZ0RQT3Nyei9PM1dqZDVSUXZ1QUFON0ZUV2hKTUdnMEhodGt0QUlU?=
 =?utf-8?B?KzZlUDlHK01sWEo4UVBLMllRcVJhakhaUmxRZmpacjBJc1FNTnc5Qk1jTlha?=
 =?utf-8?B?VVcxVUdWeVg4WlQwbDJZT0hUNzI5Nm0vRHhTc051L3dRNkVOZ3pWTThKUWo5?=
 =?utf-8?B?NUlrY01HZWZTWTRPTnpvR1RCOU94ck5ZU3FMZ09RQm5kN200RjVHOUpmeGMr?=
 =?utf-8?B?L2pFdEw2WFNGTUxXNkg2ejNXVVlEb3lkeTU3eWRsZ2NLYWRYWlRvK1cxaHhp?=
 =?utf-8?B?SCtxYXd2TnUrYjU5SG5tZWlGQmlHdHF6TGtpbzZ5VG1jbm13Kzc0RHkyakFz?=
 =?utf-8?B?aEYwOWoybFl5TG5HRzRucGZJM2dVQnlJK0xQR0JFcFlLYWlzb0pobGoyOGhs?=
 =?utf-8?B?RmEwaVpIZE4wZ3hiRnVkem9hVkwyd2h4cnNla3dvRUkrTTJOa3N0WkNDTXJN?=
 =?utf-8?B?V0NPVkxYL1V4eUQ0emcyVkJZU0VFb0NORnVwRXp2YXhWeU1UWW05WFI1L0w4?=
 =?utf-8?B?citLME1mL1JaVHd1NThueWNia1M4SnJUQ0dlamtqQ0tNN0JaWE9POU9jTmRS?=
 =?utf-8?B?c3VsTVVEZ0VQOVNuZTBpc051dGIwTG1CZEpXK3hYa0Fraks4WEdlQmlUMzBQ?=
 =?utf-8?B?VVVqTFlSbCtvM3pGRnA5OUQ0c2ZUV1VaWUJtWFNTVURRdVd0U1RCRDY1YUM3?=
 =?utf-8?B?SHh1ZlpYRTRTWmpOdVhpby91U3hMMUlUUVdPem4reFcwOHVlMmNyZDNXQW5N?=
 =?utf-8?B?NVFJUXBKVTU4MS9hZEkwUjVMMUl2SDZRUGQrbXRlQlBPKzNPOE1yUmlDV1Ay?=
 =?utf-8?B?WXk3RHlrTXdMdVc3WGZVOWpoZ1NkVy83YTRETXYxUEV4dVpxUDViN0RXNEN5?=
 =?utf-8?B?eTZya0hPQlgyWnUwMU5wZzQvRDA4Wll3MlNnZ1ZNOGhqZCsyc0NDUktETmQz?=
 =?utf-8?B?bDY4a0RKN1MwNEpaVWpqclhMd0d6dFRiMWpURHdHSXJLRmNIS1JhNlRLRDhS?=
 =?utf-8?B?TmRQZEdtK2kxUzcyVXJ0c25iQ2dCNUtUalBiYm1rZThWOVliTlp4Ym92V2Y0?=
 =?utf-8?B?WGhJazVhYkxXQUMvRmJJQUZ4TlRnZGpyTGNVNWpYM3dOc3BIKzZndXpzOGVT?=
 =?utf-8?B?MW82cjRCVWFqRTU4eUU2eVJQVmJ4c2RIZ1BwYkMvaE1UQlRYRlFuWDlLbGpJ?=
 =?utf-8?B?RnlWWEpHVTZ5OGJqQ1NtOHNHaEZOTTRFK0tYOUwzaGNNVjdOK1FOay9Ca09J?=
 =?utf-8?B?cU9UWVhkZWYwaEwzUS9vSE1CbjhnQitwMmlhMnU2ZmNXcFdLbXk5clhEMzNj?=
 =?utf-8?B?d0s4SW9XcWlnNzdhb211SVVFcGc5MDVOZlozVUdpR0N0VksvQlZGWVk1YjI1?=
 =?utf-8?B?cmR4cDRqMGRibTk3aVBLSEo3cnlZSXlCNkJ0eXRsV0lXUkhKbTNSSVhvbVlX?=
 =?utf-8?B?MnJCWTkzMjFwWGtjNkl3aVB4enB4SEpQR2taWFloZWFPcHBTZ3RZbFpSeFhz?=
 =?utf-8?B?bUwrSUUzMGtmYWJVRlJFdlIrNzN3T1I4aFo3cWhjVkt6cGNhVHFZUzF0VVFN?=
 =?utf-8?B?R1NUVUFacG1RZW9EQW4vSXBRWjg0S002MEtpNEN3ZVFpemRUZXlpLytNeGMv?=
 =?utf-8?B?bXNqZFZUcTV0V1RsMUVTUkY4cTZaRnFaNEZJUUFLVC9nakV0bk1nd2NYM0Jv?=
 =?utf-8?B?Nk5uYi9JZWJ2eGp0bWZsTU02VFAwVldsSlZHTXl1bkptTlBaR2ZkV2o1U0R3?=
 =?utf-8?B?MURBR0wvTFR4Yk0wOXJiNDh3Rm1iMEtPdWNFOGVHYzdPS3o3QVVuVVJwbWky?=
 =?utf-8?Q?LMBs=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ecc0dd1-9de0-48d7-62ae-08dc2626bddb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2024 08:45:01.8313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dJqZyc0TJg0y75mpobnqV0CoZYZlX0ZEgX7wNFpSRdzxGln1WVh1U7XqDCaC+bUk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4121
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

Am 02.02.24 um 22:58 schrieb Rodrigo Vivi:
> On Tue, Jan 30, 2024 at 08:05:29AM +0100, Christian König wrote:
>> Am 30.01.24 um 04:04 schrieb Matthew Brost:
>>> Rather then loop over entities until one with a ready job is found,
>>> re-queue the run job worker when drm_sched_entity_pop_job() returns NULL.
>>>
>>> Fixes: 6dbd9004a55 ("drm/sched: Drain all entities in DRM sched run job worker")
> First of all there's a small typo in this Fixes tag that needs to be fixed.
> The correct one is:
>
> Fixes: 66dbd9004a55 ("drm/sched: Drain all entities in DRM sched run job worker")
>
> But I couldn't apply this right now in any of our drm-tip trees because it
> is not clear where this is coming from originally.
>
> likely amd tree?!

No, this comes from Matthews work on the DRM scheduler.

Matthews patches were most likely merged through drm-misc.

Regards,
Christian.

>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
> Christian, if this came from the amd, could you please apply it there and
> propagate through your fixes flow?
>
> Thanks,
> Rodrigo.
>
>>> ---
>>>    drivers/gpu/drm/scheduler/sched_main.c | 15 +++++++++------
>>>    1 file changed, 9 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 8acbef7ae53d..7e90c9f95611 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -1178,21 +1178,24 @@ static void drm_sched_run_job_work(struct work_struct *w)
>>>    	struct drm_sched_entity *entity;
>>>    	struct dma_fence *fence;
>>>    	struct drm_sched_fence *s_fence;
>>> -	struct drm_sched_job *sched_job = NULL;
>>> +	struct drm_sched_job *sched_job;
>>>    	int r;
>>>    	if (READ_ONCE(sched->pause_submit))
>>>    		return;
>>>    	/* Find entity with a ready job */
>>> -	while (!sched_job && (entity = drm_sched_select_entity(sched))) {
>>> -		sched_job = drm_sched_entity_pop_job(entity);
>>> -		if (!sched_job)
>>> -			complete_all(&entity->entity_idle);
>>> -	}
>>> +	entity = drm_sched_select_entity(sched);
>>>    	if (!entity)
>>>    		return;	/* No more work */
>>> +	sched_job = drm_sched_entity_pop_job(entity);
>>> +	if (!sched_job) {
>>> +		complete_all(&entity->entity_idle);
>>> +		drm_sched_run_job_queue(sched);
>>> +		return;
>>> +	}
>>> +
>>>    	s_fence = sched_job->s_fence;
>>>    	atomic_add(sched_job->credits, &sched->credit_count);

