Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7597A9150
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 05:35:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 866FF10E09C;
	Thu, 21 Sep 2023 03:35:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2073.outbound.protection.outlook.com [40.107.94.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB9D810E09C;
 Thu, 21 Sep 2023 03:35:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dyV6ABluH4xj/t+NwthM5daa8mhgj8K7zrB9Giqz/Q6S/8gwY3/QbIY46erNY+vwssrMk4xPCaQcluYp8HsoUmJWMolxxxad6y9nP8yPyGxeC8qBviJNt0STdYYmbYAoAxvswL0j8w6ThgUU1r+fPXZrXAWqM6xMm9wCMKYERzQnGKWSw4CitN4ly3UHnq3p9ShE+zsS0+qh3KAfhzp7nUNDcXmBRICQ1eeSvdxx3v75r0JZSCQqsuxgA7Uwmf7uFCr/U35hXvFIJCPmfTEYZTE2b9WmV/CGgZF1i9ITvLBzdJtV2geilIkxNYDZAfqoOXglfFp0ZjHwmSAL4zJWag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oKBJ3niwam672G35sEyMCwK6JFLtAzLsWr3yc4qy2+Q=;
 b=E3hfovsgir42bkW6/c395sMU3Two4RnwuT+zL3OGMHinNv1zeXoHzK5o7z68ElFAWrO2K1bOC+/2QzZQ1T8auAlHQEqIAndoh2twznAXi7tau0HT6xQOOx6ltsUon6bI9qRDL1rxMFlVKsi2kiPBMvKVfxQ4jSeDdP00LerQ7yltfOlQBw6UAQE3xUv9Xe1fzX0iL6a1oudB/M/nA9lLtXelbsiIny0f+Oy2PLE/wMP8qkcy5JTbfoh/LvGkKtAd9SYTB3p7Pz5EmH8GEZe9DWbOTJ+CNcpeFNReXwNFmsu/0uQWZxE8KT3nXUNEzxlrbPRwqYx9UB7UqPTumuwPQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oKBJ3niwam672G35sEyMCwK6JFLtAzLsWr3yc4qy2+Q=;
 b=ekFZteHNaSTctwq2+Cu6+M5KWxFqDKD3+D3WB54sQXQ5VoIZXXAPEdtp/VuDmfEa3hvsaFFVyVIf9FaxyMEXs3kZuWUxI3oAaSJ4RdkdTgw1e1wh1IJp6X4NOPMsYndhivX7hDTiAJ4o7KJdIQOFFar0BDUML0RG1rhQx7jmDgQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 DS0PR12MB7946.namprd12.prod.outlook.com (2603:10b6:8:151::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.23; Thu, 21 Sep 2023 03:35:17 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87%3]) with mapi id 15.20.6768.029; Thu, 21 Sep 2023
 03:35:17 +0000
Message-ID: <8e5eab14-9e55-42c9-b6ea-02fcc591266d@amd.com>
Date: Wed, 20 Sep 2023 23:35:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.2.2
Subject: Re: [PATCH v3 09/13] drm/sched: Submit job before starting TDR
Content-Language: en-CA, en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20230912021615.2086698-1-matthew.brost@intel.com>
 <20230912021615.2086698-10-matthew.brost@intel.com>
 <ed3aca10-8a9f-4698-92f4-21558fa6cfe3@amd.com>
 <ZQNHZm4HPeyPBPMQ@DUT025-TGLU.fm.intel.com>
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
In-Reply-To: <ZQNHZm4HPeyPBPMQ@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0112.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::15) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|DS0PR12MB7946:EE_
X-MS-Office365-Filtering-Correlation-Id: cec3169f-64a6-4de6-5b04-08dbba53c615
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /OV8EWlau0f2fRYk9jnEM8+vp96vNbeLm1j7bEVaV/+W+9697gGXouLjkFBQ7hAK8xB+87R5OtowErxzBxtSzQ7UG8djKH6nlwxJIbz4N2BqwImHyaTvghQku26i2cMOkH/Bl781rqoBdIlk5QMElT/GEglBaQpiGCgRK7vCoQS+69QJiLI382TphTmXRyyV+k+ThevmIV9VUvmWrwXcnTxSljJTSCT5Fqn1f2C1QzvZYPfJQdD0wg2RccLVn8dIwghTEFszyYs+WAb+F3TvnZlhggIBNJj1R/X3KRHmdPnfElN6ldYpgH8d2/l5l2x6ZQB8wjWfez0uOdtZVN9qUMOsBf1mdbV+c/0o8p7cD6IJM36shTjj6oQ6G4VS6QkcbZEyb8Me3zQD2448gh3H1M5IA5OmmnuJvMnisF9lkvFzHrkIkjnFaVRPCyrIyFe6eF6xFCX3ThpYRD+wrjHgsayWHm78Kbeup2WRRQJJia700R4XohaiWCXLG6oXZuD7/41N7DAtBZMK5O1v+yKgsNRRBNSWdiikMnSJAtMASb5dwZUwUs4R0AyC6E8eS8vXN21Ldw4PSy111Ivg8Zq+7INPprHjTbTqMoP24l+MGK0qR6722Y3kP+e/1u0aZcfnPkqUqTvCa5P0iAtu2MP8Nw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(376002)(346002)(136003)(396003)(451199024)(186009)(1800799009)(36756003)(86362001)(38100700002)(31696002)(31686004)(478600001)(2906002)(53546011)(6506007)(5660300002)(66476007)(44832011)(6666004)(66946007)(66556008)(8676002)(6486002)(8936002)(6512007)(83380400001)(41300700001)(316002)(4326008)(7416002)(6916009)(26005)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXpZS1IyZ29GWURYY2Zkc2w0VTBzdlpSN0pOaXhGL1hGUFRqQWdkdWpUcDZh?=
 =?utf-8?B?TEhzZHNXSHZQbU9iRGJHeTlWLy9qb0dydGI5dnByZmIrRzdTWXpLaG9LOXFJ?=
 =?utf-8?B?M1RMZnc0ZHV2ZjN4T1FwUHFoK3RYZTlSZmFlU1dzalRLK1czellMQzFWcEpn?=
 =?utf-8?B?eThUTUV0UktQRVFySTlzZWhocjlGVzg4V0tvcDZoUmY1a2FvdjRYejc5alZz?=
 =?utf-8?B?amVxREx5Y09zbnpHSFFxSVlyWlVyc3ZlTVBmRDlqaWMwWHlIRGFyUG5aM2JV?=
 =?utf-8?B?c2tSZ0J2R1ZTRkJNaWZEWmw0eWkxQzB0ZkhEL1k5VWwyMUUvK0I4c2QwNjRu?=
 =?utf-8?B?Y21SQXF5YkZ6UGt2TUQyNVVlSzQ3alF6U2cyYmxwMDFCNnZUS3cvRy9obXRV?=
 =?utf-8?B?NVlmT242TWdmd0FhRXJVeVlDaEdyWEU1Z0JRVmdOdTlXK0lFTHdpUmxaNnEz?=
 =?utf-8?B?bDZ1WWRjRXlNVlRQb3hvQnB3Qkd2RkhtcGlWeEl3Sk1iK1FTSm91N2VpQ1hK?=
 =?utf-8?B?Z0VFUjZ0MHRXS3NraFNkQ1E5NUltUVF6OHlIYitlZDllNlVKNHJJNlBLUUFk?=
 =?utf-8?B?OGx1M212SGlCVGs4d2Z2QTFnMkZUS0V0Nk5Zb05TOERXbU9xbUVoUVVsS085?=
 =?utf-8?B?NkJpYTBWdVhtNU1mVWI2NnBtOEc0eFRwMTFFRjFGaWlZME1jOEFxb3FDWHRR?=
 =?utf-8?B?ZU1oVFpKcUZJLzFmSnNXbzBOMjZEKzJqSzJLS0ZDU0YzTVh0c1NmS29DMHBv?=
 =?utf-8?B?T0Mwd2hHbHBnR3VyTnRwdmk5OHB2UVhpOU9ScGQrRXVhQUdXeTQ5K2U0d09s?=
 =?utf-8?B?S3V5VUpLVVFKZm0yMmZJS3lHVTlDcFVEOVBWckx0S0N2cjUvbDI0cHhqVGtY?=
 =?utf-8?B?eGVrNnovcVhsTUJ4aFFvc0NndEVlcW5wd3ZTTTZGeC80NGdHek1kRnJnbXMy?=
 =?utf-8?B?WUpKV1FvUWdFbWlXRndVY25iMFdacWEyS3NUcWN0WDhjNDcvWDNEV3FBb3lE?=
 =?utf-8?B?S0RDSjA2Y0tQRURLaXovS1c0M2JTNGQwWWQxSlZqNDR1bUhrelRUQVlvRXBZ?=
 =?utf-8?B?Q2VibDRiQUNVejNMd0MrWnhXOXZrVzlBU2oyQ1NwWjF2aG1rZ1hETzRaOXkz?=
 =?utf-8?B?OEtUQlZ2M0FONFVhdjJzMWZBRXRtdWFVQVBmOXlXdXpxbjdZVDhJZEJJNUJv?=
 =?utf-8?B?VnhrRWlqdHMyMnRYeElXTkxLcUdTdDMzQWZUZWR6am5EaFQyQ042azJIMTZo?=
 =?utf-8?B?L1hCWXV6a2ovK0FsdHhONkIrNmwvTXFxWHM1K3pJclhXT1pFbjFXR1ZPREo0?=
 =?utf-8?B?dzVOUkYyOFU4M09ONDNIZ0Q3RzQ4RXd4R1FoR3dKa0RvOWNZRUI5WnRwekdR?=
 =?utf-8?B?c1puN1g4TWpvbFB3NGEvbTBLRkcrZW83NkZmRWhERkNqNFg4eDA1OWNPWENt?=
 =?utf-8?B?aENZT2crVDJOcTltZXE0WXVIMk5BNDJZdWViYkJpeU1jN0RiQ2tPSmprQ1Z3?=
 =?utf-8?B?LzBCSURORUhVN2w0RHVBT3JWZkZXT0RhOFI2MzAxeW9JZVQrWEc3MnVRVU05?=
 =?utf-8?B?UVhSWU1DVDNUYjkxZ0xzMXV5ZjA5U2dJcWZFU3RpNUtIYUpUMTdteDRYY0hK?=
 =?utf-8?B?c1R1MVpkZXBsQTQvZGs2Mzl6bFZxVnZGT3p1a1Z4WENwYldFdTdiMG1qR241?=
 =?utf-8?B?aGxoanp1WE15Vlk1bjZ0QnhBYjZNYUY5VFcwZE1LWDVhTTQ4ejZTTWwvRTJD?=
 =?utf-8?B?S2FIN3RVVkIvUVE1cE9uSDhOdVRtaDlpNm1MVUQyU3JNaVhzUmFjWVJIcHY1?=
 =?utf-8?B?cElkdjBHczdjQ0R3ajFBbC9QQldJL2lxUERaaVpLWUlEc3ZCaURzTDlPSHR5?=
 =?utf-8?B?YmxhZ3E3cytReGwzQWVvYkEzRFFjSzIxVkxnbE5qSFBuS2FqR3ZPY3JhUjAx?=
 =?utf-8?B?ZEFPOGU0LzJ4MFlVbkhCRk1naUhyT2prOXdyeTZucEpqUnJad1hCSTYrMnlV?=
 =?utf-8?B?NDFpL1JaVnNkZ3NYVkRHd1lHbUUzL0hoVnJmV0lQZ3E0dFlra1ZxeS9DRWxo?=
 =?utf-8?B?dEVJYnF6bHlOR2hJT3ZSUUNMSXNGZHlKM3FydnlRalZxK01NY0laYlJZNzBz?=
 =?utf-8?Q?uPF63rUSDJUndh0SZGMcJJef1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cec3169f-64a6-4de6-5b04-08dbba53c615
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 03:35:17.7803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lJ3Q3kTkWfh4b2k4wGK2uurQx3eZFLnYnMdt9wpwDg58BvE/ChGhExQvRZDm2s2P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7946
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
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, lina@asahilina.net,
 mcanal@igalia.com, Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, boris.brezillon@collabora.com,
 donald.robson@imgtec.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-09-14 13:48, Matthew Brost wrote:
> On Wed, Sep 13, 2023 at 10:56:10PM -0400, Luben Tuikov wrote:
>> On 2023-09-11 22:16, Matthew Brost wrote:
>>> If the TDR is set to a value, it can fire before a job is submitted in
>>> drm_sched_main. The job should be always be submitted before the TDR
>>> fires, fix this ordering.
>>>
>>> v2:
>>>   - Add to pending list before run_job, start TDR after (Luben, Boris)
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>  drivers/gpu/drm/scheduler/sched_main.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>> index c627d3e6494a..9dbfab7be2c6 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -498,7 +498,6 @@ static void drm_sched_job_begin(struct drm_sched_job *s_job)
>>>  
>>>  	spin_lock(&sched->job_list_lock);
>>>  	list_add_tail(&s_job->list, &sched->pending_list);
>>> -	drm_sched_start_timeout(sched);
>>>  	spin_unlock(&sched->job_list_lock);
>>>  }
>>>  
>>> @@ -1234,6 +1233,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
>>>  		fence = sched->ops->run_job(sched_job);
>>>  		complete_all(&entity->entity_idle);
>>>  		drm_sched_fence_scheduled(s_fence, fence);
>>> +		drm_sched_start_timeout_unlocked(sched);
>>>  
>>>  		if (!IS_ERR_OR_NULL(fence)) {
>>>  			/* Drop for original kref_init of the fence */
>>
>> So, sched->ops->run_job(), is a "job inflection point" from the point of view of
>> the DRM scheduler. After that call, DRM has relinquished control of the job to the
>> firmware/hardware.
>>
>> Putting the job in the pending list, before submitting it to down to the firmware/hardware,
>> goes along with starting a timeout timer for the job. The timeout always includes
>> time for the firmware/hardware to get it prepped, as well as time for the actual
>> execution of the job (task). Thus, we want to do this:
>> 	1. Put the job in pending list. "Pending list" means "pends in hardware".
>> 	2. Start a timeout timer for the job.
>> 	3. Start executing the job/task. This usually involves giving it to firmware/hardware,
>> 	   i.e. ownership of the job/task changes to another domain. In our case this is accomplished
>> 	   by calling sched->ops->run_job().
>> Perhaps move drm_sched_start_timeout() closer to sched->ops->run_job() from above and/or increase
>> the timeout value?
> 
> I disagree. It is clear race if the timeout starts before run_job() that
> the TDR can fire before run_job() is called. The entire point of this

Then that would mean that 1) the timeout time is too short, and/or 2) the firmware/hardware
took a really long time to complete the job (from the point of view of the scheduler TDR).

> patch is to seal this race by starting the TDR after run_job() is
> called.

Once you call run_job() you're no longer in control of the job and things can
happen, like this job being returned/cancelled due to reasons out of the scheduler's
control. If you started the timeout _after_ submitting the job to the hardware,
you may be racing with what the hardware might want to do to the job as described
in the previous sentence.

The timeout timer should start before we give away the job to the hardware.
This is not that dissimilar to sending a network packet out the interface.

If you need a longer timeout time, then we can do that, but starting the timeout
after giving away the job to the hardware is a no-go.

-- 
Regards,
Luben

