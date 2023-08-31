Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C136678F3A9
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 21:52:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A66210E6D8;
	Thu, 31 Aug 2023 19:52:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from outbound.mail.protection.outlook.com
 (mail-mw2nam12on2043.outbound.protection.outlook.com [40.107.244.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C50C310E6D8;
 Thu, 31 Aug 2023 19:52:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aSot0sa2A9PbfCow6uGvhd2CI1fGN+AkEcK9iCI9o7pAjVUQJ6aNbwsstDVSA4F9xJW+p8xBMculfHdequnjRdIDSc35g33AaQG4Sq6SBG+zW5+OdD7qRuPKRO8lEPUK8OduMTTYX5U9LVPLNd08lr5N/DzB/IhSDNp/V7dEtSohmOdg3l1xhHOittCHPZ9AMEvrGkKP13zMDAHOtdTBiB0MV86TiLA5U4V985nefqoNwdzEOo+uQWbnzOEzZkcP9996ZxWoAI9+KU7/R5sz9Dcxer0ig5tPvRD91mU/9odXMwO86dpmbAFxp8FD/9dvDpsn9wM4NcRmG8rN6i5Ywg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WgJMti/n8LPKaI2JQ1y7zKwqF8VYZ8VkpdlLs6iKhoo=;
 b=VV5rdGGg6EODkoFg0OXjX7EKmXDbjUdHc5drRyf5JPuQLyNT6RaRXrhfLhhXXWR/HFEPkKqNiwwZSr3m7pZTT9WRBPFxh0xZsBKANMAtX2XPSWgpjq7Ws1XF1Qn/S3nkSmtlpHzXi5MigOc7/z+cVKWxkkgvXANs+jCgh52Je+gNTVAS29RKvz9q3XhcLbczYi2Q+krQn7Zw25duP6pNKaevhuw7D5Il0U64lsB2KUgLQpy/hk2ZhWAVvpQSmZY/576YnwlMimuKdRkDmS8drWJKiyggKwM+syPhsYOPQr6sjCm6cyuxr/odDl9qs5xLxmxMD163TxHxIIuoOmJLDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WgJMti/n8LPKaI2JQ1y7zKwqF8VYZ8VkpdlLs6iKhoo=;
 b=GPfUyMJGFk7Y28GBfTNOOAL3zPieoxb7bF+OzfdnBXZDxJ8hExwR1KVZBtcsHvaskSZTfo8KtwZsDDhe8MUbE6XVd99SH1WFZjlAxCchHqOKwdA74ZmbZ42rOGFnuG/8f53CDLj5NrU9fZaIlddUR7sd9wA7tafAQtSGWBgVuNA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 CY5PR12MB6274.namprd12.prod.outlook.com (2603:10b6:930:21::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.35; Thu, 31 Aug 2023 19:52:23 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87%3]) with mapi id 15.20.6745.022; Thu, 31 Aug 2023
 19:52:23 +0000
Message-ID: <256c3dad-e84f-4a9f-9785-7742648777f7@amd.com>
Date: Thu, 31 Aug 2023 15:52:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.2.0
Subject: Re: [RFC PATCH 07/10] drm/sched: Add helper to set TDR timeout
Content-Language: en-CA, en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <20230404002211.3611376-8-matthew.brost@intel.com>
 <4b35059a-4a98-13e3-29f7-83d309b721e5@amd.com>
 <ZMcJuvz/z38snXjr@DUT025-TGLU.fm.intel.com>
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
In-Reply-To: <ZMcJuvz/z38snXjr@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0028.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::41) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|CY5PR12MB6274:EE_
X-MS-Office365-Filtering-Correlation-Id: e6c16e78-f7c3-4d4d-fcbc-08dbaa5bcb35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0iJ2f7ded6Dq5+a3ztC9VmYpBlEDuh3IQg7kwDSooWw3KbpJTjHrFwflFw5DZ0IK/TLIFT7oRRjxyd5osqxa29oMSw5peMWgXcCV5I/cJe3E4SqmntinKaWBxJhn6JElXMPluVD20/X+tSKmmA7GrPfBm4ZbnjfcWeD3stY/ZuonMYISwX/MRh3WWhONAGtpXnRMhDwp8UJ0072HmVjsPmc5LVQo9+No35ez2bPIRK7zedMmAW2JJ62NB+kC9z9IWaJqkFasNAqQBRuO8hIuun+nEzALlgyZz2yEbcieWqX6f8szDdHJIOdAAu5GuUWJeT5sSX2BWPJv5qB5TKmxjqM9EIzEetonzIprNdjpFNTW0zrcGUEF0CTnV/nRpIMeSe/Of2mkudTpibg/eqc9CUaPXfisuKFNO+gl4V1xbEfjgjnzBpHdPMdF9Qeq79nZWyNzAIiyoIvYjxcYIauU5xs5xt6yTGMAUG2umVA/UbmTvLoiy/aPCh0UiXAe1/D1o2T88Ga4oUxNosilWCVNIhVB2aRCpuDhDG4pzgzoFjbuLuSDYjhTMQII/0WfbaVKsGIC7lbOKIISMFRxbwY1LTaJbaqIdYjhopFH54s+DVdCCgtZIhg1duZNiGyzO/7CPHafpY22YNFHSOnz3SrjaQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(136003)(366004)(376002)(396003)(451199024)(1800799009)(186009)(31686004)(6506007)(6512007)(6486002)(6666004)(36756003)(38100700002)(31696002)(86362001)(2616005)(2906002)(26005)(53546011)(83380400001)(478600001)(66946007)(8676002)(66556008)(8936002)(4326008)(5660300002)(316002)(41300700001)(44832011)(66476007)(6916009)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWw0OUFLWDRwL3N6bFk4OUtlU3hsY0VpQWRhdjhjdGxmelRFNWQ2TE1XUm5t?=
 =?utf-8?B?RGRWQml1SFpZdEVUUmwxV01Ya2w4eitTQ1BOZUxTU01EUW1xeHZZaVRwcXBW?=
 =?utf-8?B?WkhNWG1pZ2dSUGgxbDBlWnZDWVByN2EyTWVEQ2tGRzk2aXJZOFpySFo0VElG?=
 =?utf-8?B?d0ZNK1pCeHhvSDVJSXBYMUt2V2JlNzhpNnpxc3V3b0JHK0VLK0d6Umtwclh6?=
 =?utf-8?B?b1BVSGVWYXo0ZVRzb3N2MzVlMFVRUzJoOVpBSHIrRmptR1RxdVFGeUd0Q3Rk?=
 =?utf-8?B?cnplQ2pMNGpEazIzbkdRQmFsczkxb3NuN25vQWsyYS9ickprc0wyaGdRa0RS?=
 =?utf-8?B?cG1MWEJsSDI0czFrSTRIWEljQnJ5Qy9FbXlZRnh5VWtFdXAyL2EvcldGNUVB?=
 =?utf-8?B?QlBqUW9tWmJlUTFJcExmdVAzNVNJdEU4aXR3dTRSWlpoOU04cHZDUVNNc2ow?=
 =?utf-8?B?dGc1VHRJNUNqblEyY1lPdTB6d25rVVpWaDJsdWVjMmh2L3Nnd3JCUlVZdEJY?=
 =?utf-8?B?R1RhdmhtWHo2VXdhcGUwQjc3cDVJSzY1cVlQWEl0Lzl6T3VBNHBQbkhKWTBw?=
 =?utf-8?B?MEE4ZGFHV3NGUEt3UjdIc0JrbFFsVjVMZnYwdWV4TVNFRnRrQ0EvKzkzRHp0?=
 =?utf-8?B?K0NLNy9rdC9uNFZwa2ZKSW50QmdUbFROZkJIKytDaW1QMzhnVjhiUTM2QjZH?=
 =?utf-8?B?bklMcnJSRS9MU0psUHorUEl4dGxTS1VYb0xVckVseHVGYkVQS2c2Uy91RDVB?=
 =?utf-8?B?c09yejAvQ3dsNnVyNE44R0tlRW9LLzd5WGxIbEZFbzZTa0t2Z1ZxRGdTSFVY?=
 =?utf-8?B?bTlQNy9GWUUxSzFoeVpPb3F2MW0yM2kzNU1YbWwxWnZwRjNIYWhNSXpjbFFI?=
 =?utf-8?B?UXdGZ3h5aitIK08ycWtaaWNoc2E5Wm9tRzFINmdGUzJuTE5hV1kwa2k4ZWtI?=
 =?utf-8?B?b2phTlFBRDhURTFzWHRNcUQ5L0hwRUwvN2ExV3dlOENsaWVxbFloOWE1WVRC?=
 =?utf-8?B?N3p0WmVJSDd0Q2JpM215c1ZRNGpMTkFUYnhoZ0tieWNjVG5CQnZueWltYkNN?=
 =?utf-8?B?MjB0eDdQQURHenVHUTZsK2xpcnp0RkRUSkozSjFoSE5HSkN0RGVMTDRXQTlR?=
 =?utf-8?B?MjdtSysyNUp1MWsrOW9rSjcxVWx2SjE2WDFFN3ZwRytxbkwrb2UwV0s3V3Z2?=
 =?utf-8?B?M1ZscldldnBWSzAzSTdEVEFoaGVWWTFIZjlzakYxY2xoYUZEaE0zcUJLSFVY?=
 =?utf-8?B?ZUNSbG13Z0lnQ3huQzJ1a0g3VkN0My9IT1R2UGhYZCtZK015M1VUOWEycm45?=
 =?utf-8?B?RXJjZHlzQm1OWWRtVVdDMEwxeTRSR2VpcmJ4TU8wQXhvclpyQ2UzM0JrM1dD?=
 =?utf-8?B?b2NYeVRwYnVBRVdCeGJTenpXOUJxS3NZcjBjdHg3TWVKS0JnaUVrVEwxYWlW?=
 =?utf-8?B?dHJnaU9yVzYzVlgzenhEZDBRWDJ4dlE4ZXV4d1hHZ2R2NVIyNlRhOVV4S3A1?=
 =?utf-8?B?NllISmpvVS9Rb01VK21IVDNaeG1PSnd0cHNlOVY4MzRNWjdGUlMrMUxFeDVY?=
 =?utf-8?B?cStKUXNnYkZyaWZrYXNPR0JFL0xFRjdNVXM2Ri9aK1o4L1ZTUmRRbHJmcFVG?=
 =?utf-8?B?VmZlVjNYSWVDNmFZYUlaVkhUMUttSUxNYzJXUkRkU0Q1eWdoLzNjV2dxSFZR?=
 =?utf-8?B?eVNZTXp0ckl0eG5XVFB4TEN0aDVrVjgvalR3aVBpa0dtYzZhSHpMZzRTVUpl?=
 =?utf-8?B?VUZUUFZKeG8zMVZJSGlqVkgrTVJjZHpkWEp3OWlMcE4yclZHNGhuUjhMb2hL?=
 =?utf-8?B?MEFtSWI2b2lPMHVmVi9uaTVHUkZXWGZMUHpaYXJ3dFJGbWJycGlqTEd6empX?=
 =?utf-8?B?SlJVdklTT1BrU0JMdDJkemV2c3lCYmppbHlndWF5MUJzY3pIaS9ON0dGeTJS?=
 =?utf-8?B?MFNDMnRQL2tvamNCVDUvODgwNmtsR0o3TmhsTDh0dVh4MkJOWm42ZytRMDZn?=
 =?utf-8?B?WGFaZGsrWUpaMTNUZmY5L3RES3F4dko0cmJLNCs1Wml2c1pwQ0hoSE1uOVhK?=
 =?utf-8?B?QmxRTklHMmdiVFBURHlqT1ZsZ1BaaWFDWERjRXVid0h2aWtKUnoxUkVvYjFa?=
 =?utf-8?Q?pU4I9ku7twsEVlweg+UecxWxQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6c16e78-f7c3-4d4d-fcbc-08dbaa5bcb35
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 19:52:23.2568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 003drOSG0bjQ7v4qnQhPPFxny9Zqwq56MXvuDEFvXLtVBDVpPj3TCi9YPhU0Qmm+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6274
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
 lina@asahilina.net, dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 boris.brezillon@collabora.com, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-07-30 21:09, Matthew Brost wrote:
> On Thu, May 04, 2023 at 01:28:12AM -0400, Luben Tuikov wrote:
>> On 2023-04-03 20:22, Matthew Brost wrote:
>>> Add helper to set TDR timeout and restart the TDR with new timeout
>>> value. This will be used in XE, new Intel GPU driver, to trigger the TDR
>>> to cleanup drm_sched_entity that encounter errors.
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>  drivers/gpu/drm/scheduler/sched_main.c | 18 ++++++++++++++++++
>>>  include/drm/gpu_scheduler.h            |  1 +
>>>  2 files changed, 19 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 4eac02d212c1..d61880315d8d 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -370,6 +370,24 @@ static void drm_sched_start_timeout(struct drm_gpu_scheduler *sched)
>>>  		queue_delayed_work(sched->timeout_wq, &sched->work_tdr, sched->timeout);
>>>  }
>>>  
>>> +/**
>>> + * drm_sched_set_timeout - set timeout for reset worker
>>> + *
>>> + * @sched: scheduler instance to set and (re)-start the worker for
>>> + * @timeout: timeout period
>>> + *
>>> + * Set and (re)-start the timeout for the given scheduler.
>>> + */
>>> +void drm_sched_set_timeout(struct drm_gpu_scheduler *sched, long timeout)
>>> +{
>>> +	spin_lock(&sched->job_list_lock);
>>> +	sched->timeout = timeout;
>>> +	cancel_delayed_work(&sched->work_tdr);
>>
>> I see that the comment says "(re-)start"(sic). Is the rest of the logic
>> stable in that we don't need to use _sync() version, and/or at least
>> inspect the return value of the one currently used?
>>
> 
> Sorry for the delayed response, just reviving this series now and seeing
> this comment.
> 
> We don't care if the TDR is currently executing (at least in Xe which
> makes use of this function), that is totally fine we only care to change
> the future timeout values. I believe we actually call this from the TDR
> in Xe to set the timeout value to zero so using a sync version would
> deadlock. We do this as a mechanism to kill the drm_gpu_scheduler and
> immediately timeout all remaining jobs. We also call this in a few other
> places too with a value of zero for the same reason (kill the
> drm_gpu_scheduler).

(Catching up chronologically after vacation...)

Okay, that's fine, but this shows a need for an interface/logic to simply
kill the DRM gpu scheduler. So perhaps we need to provide that kind
of functionality, as opposed to gaming the scheduler--setting the timeout to 0
to kill the scheduler. Perhaps that would be simpler...?
-- 
Regards,
Luben

> 
> Matt
> 
>> Regards,
>> Luben
>>
>>> +	drm_sched_start_timeout(sched);
>>> +	spin_unlock(&sched->job_list_lock);
>>> +}
>>> +EXPORT_SYMBOL(drm_sched_set_timeout);
>>> +
>>>  /**
>>>   * drm_sched_fault - immediately start timeout handler
>>>   *
>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>> index 18172ae63ab7..6258e324bd7c 100644
>>> --- a/include/drm/gpu_scheduler.h
>>> +++ b/include/drm/gpu_scheduler.h
>>> @@ -593,6 +593,7 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>>>  				    struct drm_gpu_scheduler **sched_list,
>>>                                     unsigned int num_sched_list);
>>>  
>>> +void drm_sched_set_timeout(struct drm_gpu_scheduler *sched, long timeout);
>>>  void drm_sched_job_cleanup(struct drm_sched_job *job);
>>>  void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
>>>  void drm_sched_add_msg(struct drm_gpu_scheduler *sched,
>>

