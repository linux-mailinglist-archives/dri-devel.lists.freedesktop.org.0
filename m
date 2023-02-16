Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB26C69995F
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 17:01:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99FF710E349;
	Thu, 16 Feb 2023 16:01:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::607])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC7A10E349
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 16:01:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sg722PoS0rFhnD6zrXIKp5iTrdQnqfdpVjIIpNPLQYW9DLcfJzMLUmRt7LpjoSMN2AeDe/bFo5ESCwAKFxUPXvDbj6Q7WmlCoYO8N5jgMqGeulVW66Etk8Dj/zvy/eF2YoOafcH9AAf4tMfflxtFgs2D+TPuQfA3C+4blHTtj7FYHTtsR/lOHMus/Xm2AxEFzVMAs+HPT/9vqUw9MHb33foPShODhLJrnyNThlFvS86ge9RmI90YHEqxCR2rDar8dEpvryn6ApnQLUQN2PcibVJxuRTN+nHtmulWuCuqzo8DQePBBenZFqSEbDBneGd72y6nBJL7ZiLrGyPmGwY78g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GDZi4pBIHf/UCCZ5Ntenpv+QelQRtn7JEHjTzjtymWo=;
 b=oO6gEC/wFZ9D62VkCe9vm+4LMTuP0d/j0Nr1aVREaCT22Dk6ocC3Zv/68sMiAaUPNK/XlqmVSa7XkrnuXGtBS69/L948cDdt+RzXbwWTreIbmQKeNj8vCGlCc1cz8OyYQ/8hBbT8d4exQjkb7FTWohTKBm+wzjXYyXg9M2cMydoLVSOcIltBJpqlOOe1JB0iFUeGxEeUc6QKtSIysVUe0xjj4fXhzAOZkM/ZYCYGx4FIFIHYTyQnjVbazpknc854Rg+tu5kDnJsyi5Zj9oG0lXKkhb0f4uEyPv6YM5o04EUdHcdukFvSL58Ir5qQ3QbBqVuSUxTesHJ915QrKjm9Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GDZi4pBIHf/UCCZ5Ntenpv+QelQRtn7JEHjTzjtymWo=;
 b=bB+1gJhH4P3VEo2zCkuSjUGkj2TuL1vJjlUna0OQRFSfluRacPkMBqd3DQ3Pybf0CnA6eXqtJ4okxt19nxQM5hURhFWBFHfq/jEf7pU5E1oug/qmHB1vN0kRYNXLbvggnJtp9byQOxjchlYSdLj4cH/rRsIqdmp9G3ceOb2DSUw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ2PR12MB8010.namprd12.prod.outlook.com (2603:10b6:a03:4c7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Thu, 16 Feb
 2023 16:01:06 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6111.013; Thu, 16 Feb 2023
 16:01:05 +0000
Message-ID: <f555bda0-80b6-c0bc-566f-0ef49c96da0a@amd.com>
Date: Thu, 16 Feb 2023 17:00:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/3] drm/debugfs: remove dev->debugfs_list and
 debugfs_mutex
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20230209081838.45273-1-christian.koenig@amd.com>
 <20230209081838.45273-4-christian.koenig@amd.com>
 <Y+4UdBzk6RkQzcsI@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <Y+4UdBzk6RkQzcsI@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ2PR12MB8010:EE_
X-MS-Office365-Filtering-Correlation-Id: 64869d20-e4c8-4989-5b67-08db1037026c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0YNMC7WOzI5QmKEekTf14IemQ/bB7gAp4WE6RYYyrysR2FH+ZwLD+FU1jmyioJRhyvsIaRusksnJICetFmq3rzcoiGGMRE1E008U1ugb7ag5r3ux9IofteTpRJAMkrPVP8bw9sWtB0fhMvOUjJuRPXLE6CdPAPDFmhTi+Mk/lTNRR+gpZ4LUoOD+xgNxFz2NdUOf7Ol65Wg282Pn0MJ0YWK/3wuwYGl3lP6RevrBe9y3aziavxVh5Ou8aWU8JfG4t7vl0mTgT/UBANDMDXzL/EEaBsSAlXi92BtKHe4oCOwt+k5U9ZUW05gqoEJ6NzZP0YZRgPuotHXRyf1cWfwhwGTYVyA95nM3zSpzgDEnKHaBBG1+lESqx7tFwAHREBYqizanJks8vRjFc0x2TRYhwGPp0axBQFcI+jV5HJqjpeE6l4JGH5dSs5LZ1VoH/hvO527ZmvAPQvQG4/gY1o1CPRBSbNafhA3XhbZkyzNbaZqcbS4ZLlSEgOKJPQ+OhOiMAu4WAWanNsnzQz8wg2kVvjW6plfEeyqSo603zZnDIKh8omHXH5byKb/WI7udcYWNItFLCLX0IfTz86I6FrI6NmRt4hCznjykwBqZ2KdBueypsuQCW50Q9QfAPmZuUx7s4runjg41F8V8l7660ALx9a2D3a+MmnXSqMLkqgSZ9Wo5PqFE9LFFwu7XHA7jH2OqTcwPMxwkuqQdtARL+kaP6DILI7UmckTOTT+1JZj2YXM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(346002)(396003)(136003)(366004)(376002)(451199018)(66476007)(31686004)(31696002)(6666004)(478600001)(316002)(66556008)(86362001)(2616005)(6512007)(6486002)(2906002)(66946007)(5660300002)(41300700001)(6916009)(4326008)(8676002)(36756003)(6506007)(186003)(66574015)(38100700002)(8936002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUpRaEUwSzBobW80cjZWem1XcHNFbEhsRGk0Z1p6MHNsenlVcVVibEsrUWlq?=
 =?utf-8?B?TE9hZHF0Zjk0Q3dsdjRmdEpOQjNsY3pKcUgxRGVmYnJkY0RyREkxQmNiY0l3?=
 =?utf-8?B?M2k2V2dHNU82SG1HVDVpWnovR1BRdVd2MDVkcDBuc0JYTmdWS3ZKR2N6STJt?=
 =?utf-8?B?UG1EcVFTcFdFWEN4U2NHK3dKK2pjS2tmOU9TVVAxbDJOcjBhcy8wV3h2S2ZO?=
 =?utf-8?B?cVFrQ3VzRGhpRk9VREk2V3VSNks0YTNjRlRiU1RYMHd2UUZ1UnZmaUw3MzZy?=
 =?utf-8?B?UThSOEVmQmJwMVpLYzlPeWR6WVhyeE5VMVg2Y1JLSDJWMmlWc01Vc0ZEUVZr?=
 =?utf-8?B?NHdjLysvaUg3Mi9oS1pZODFIYWdqcU1JUWlBeEhqN05wOWhMc0RyWldTNFpI?=
 =?utf-8?B?MCtxUDlQVHVmS2xkSlNHdUdVT1Y2dzNJSDAyaUY4a1RmajRUK1Q5dFRvYm1T?=
 =?utf-8?B?a1J4V296dmFWYTljRUk5dGZacXhYcEFHMmROdU52c0M5TU55TVF6RFhzNVN2?=
 =?utf-8?B?TnJGbFAxWWdaV09JSGp3Z1pnbTZabjBiZVBhNndoR09qRjZockpjSkRLcVB5?=
 =?utf-8?B?aXR6UkplR09zMitYRU1acDkwVHYrN2xGRnIySTJxWElxZTlXRkVuUE9Ed1JD?=
 =?utf-8?B?MWhLU3FTRHNLNEcvcVJzaWduRWYwR2NwUXdreFErU29xK205djJOMmFVVVFp?=
 =?utf-8?B?SFlzWFNBQ283MkIxUUZNcG5KS2F3MG02Wmw1ME1DK1AyZEJaeFdrcnBpNjdF?=
 =?utf-8?B?S281MlNsSXM1K1VteGN5UmRoeXBlanBtcFg1QnNQYlc5L0RnWkFVT1dqSHJh?=
 =?utf-8?B?cVdBUlFOU09qV1FLUERyUVdnZW1ySTFSUUFvaDgvbHVYUWZZREJGb1IyWUdZ?=
 =?utf-8?B?dXFQc1pPWFdmdWx2Q3ZRbkYvQ002RzI4M01jQTRNbXN5MDdUbSt1SlY0ZlJY?=
 =?utf-8?B?OWlUcnA2bG02TXl4bmxTSzRjejVUcUEwZjUrOWZITmM4ZXlPVGk3dWV1dFZY?=
 =?utf-8?B?TWlIenQ4dnRFQmZYMDJlL3pQSXNJTk1vdGZqaU1peHVwM1JyNUpKWHZ5c2pp?=
 =?utf-8?B?S2NQb0J2dVhQWHM0c1Z5bHZUaVVFR05PdnI2UCtmRUpodlFFOVRLRm5FRy9n?=
 =?utf-8?B?eG5SWFd3U09NbVV0UG10R1hrMXdUQmpXWWhXN2tPb3puRCtpRmZCMmNSNzh2?=
 =?utf-8?B?WVVQK0UzM0F0TWtnRDFzOFFkOGRRN0NRVnhxcjRNS285TTN1N0VSSFp0cEs4?=
 =?utf-8?B?MGxIYktINzJrelk2ZHp0L1p1ZFFyMUhtV0dUdHRxM3hpWjhJSnJQNkJZbnUw?=
 =?utf-8?B?WFRnT3VMOXN1di9iaEROY3NjSWQvSWRjenFwNSs4TlhSaU9OU2loVHFSSldi?=
 =?utf-8?B?MDhnbkdKQXorWDYra3ExRk8rVHJXTERJallCa1RVNFYzSHVWQjhheGMwZUc0?=
 =?utf-8?B?UVU5OGU3UVZNT0RnZWZPWUwwK2J6TjV2NWxOOW5KNUFzVkUwanhhUTdTU2wx?=
 =?utf-8?B?UzNBS0xTWFhmdVFFcmM1VkxqZ2trNEM2NXhvK2JoMWdpZjFZREtNamMyTTJT?=
 =?utf-8?B?STQ4NU5oNmtoN1NyS1d5QmdJYkdLRVNuTkR1b0I3eFJJYkRCU05mWnBjQlFU?=
 =?utf-8?B?UHFVamxxNVFFODEzTU5WWDZ3bEFFQVliL2kxemNJRkRQQUFWYXpNaTErUXlF?=
 =?utf-8?B?UUFKVjl0SXpFYU1KN1o3ZGhHVnNqc3VlY21Ra0dKb2hHc09qbk1sTldkVzJq?=
 =?utf-8?B?RTBYdXFIVTMyekI2UFNwVyszQjYxMXVUcFVudEo5NUdldzViSFFvc1RPbzB1?=
 =?utf-8?B?NlJIaVZGZnBmNFhITHZpOUwzb0dDL1dPUHh4MHF1SXhNYm14TTBPd0ZGUkhY?=
 =?utf-8?B?WUsyam1qeTZCa1RUOGd0dkJkME8vU2diWVVsUTZFelJwNmhzZXpYanh1Z21z?=
 =?utf-8?B?bjViMG1SL3J6bVhoWlBzS0NNaWVobTZsNnZBMW56THN6OE02UzhWR2V0SHlk?=
 =?utf-8?B?N1poZHZ1dGNpQmFOZFdHeWwwNjc5M1JKM2ZvWkNVdjZmQW1nZmt3aTFRaFJS?=
 =?utf-8?B?VDE2cGEyOGY0RHREQlU2ZWEyYjVVMXVQQ0V0OHN6aXY1YTk3eGpqZ0QrYnls?=
 =?utf-8?B?eXY4bVJIZGlWRHVwTSt3dG84RStrR0hLRWxMTzY1dzhYdWZmc1gzYXpoOFFK?=
 =?utf-8?Q?q0kdbnPqsHHb/u6c028rYvrpCkp0+6Bz1dk+SP8siiMZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64869d20-e4c8-4989-5b67-08db1037026c
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 16:01:05.4208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 64kDAkgGPh0JNlz3QAXF3/bELlerBkHS7CJF1nAHrwRnFMYzYCxLm9ufqVAzKh3K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8010
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
Cc: daniel.vetter@ffwll.ch, mcanal@igalia.com, dri-devel@lists.freedesktop.org,
 mwen@igalia.com, mairacanal@riseup.net, maxime@cerno.tech,
 wambui.karugax@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.02.23 um 12:33 schrieb Daniel Vetter:
> On Thu, Feb 09, 2023 at 09:18:38AM +0100, Christian König wrote:
>> The mutex was completely pointless in the first place since any
>> parallel adding of files to this list would result in random
>> behavior since the list is filled and consumed multiple times.
>>
>> Completely drop that approach and just create the files directly.
>>
>> This also re-adds the debugfs files to the render node directory and
>> removes drm_debugfs_late_register().
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/drm_debugfs.c     | 32 +++++++------------------------
>>   drivers/gpu/drm/drm_drv.c         |  3 ---
>>   drivers/gpu/drm/drm_internal.h    |  5 -----
>>   drivers/gpu/drm/drm_mode_config.c |  2 --
>>   include/drm/drm_device.h          | 15 ---------------
>>   5 files changed, 7 insertions(+), 50 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
>> index 558e3a7271a5..a40288e67264 100644
>> --- a/drivers/gpu/drm/drm_debugfs.c
>> +++ b/drivers/gpu/drm/drm_debugfs.c
>> @@ -246,31 +246,9 @@ void drm_debugfs_dev_register(struct drm_device *dev)
>>   void drm_debugfs_minor_register(struct drm_minor *minor)
>>   {
>>   	struct drm_device *dev = minor->dev;
>> -	struct drm_debugfs_entry *entry, *tmp;
>>   
>>   	if (dev->driver->debugfs_init)
>>   		dev->driver->debugfs_init(minor);
>> -
>> -	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
>> -		debugfs_create_file(entry->file.name, 0444,
>> -				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
>> -		list_del(&entry->list);
>> -	}
>> -}
>> -
>> -void drm_debugfs_late_register(struct drm_device *dev)
>> -{
>> -	struct drm_minor *minor = dev->primary;
>> -	struct drm_debugfs_entry *entry, *tmp;
>> -
>> -	if (!minor)
>> -		return;
>> -
>> -	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
>> -		debugfs_create_file(entry->file.name, 0444,
>> -				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
>> -		list_del(&entry->list);
>> -	}
>>   }
>>   
>>   int drm_debugfs_remove_files(const struct drm_info_list *files, int count,
>> @@ -343,9 +321,13 @@ void drm_debugfs_add_file(struct drm_device *dev, const char *name,
>>   	entry->file.data = data;
>>   	entry->dev = dev;
>>   
>> -	mutex_lock(&dev->debugfs_mutex);
>> -	list_add(&entry->list, &dev->debugfs_list);
>> -	mutex_unlock(&dev->debugfs_mutex);
>> +	debugfs_create_file(name, 0444, dev->primary->debugfs_root, entry,
>> +			    &drm_debugfs_entry_fops);
>> +
>> +	/* TODO: This should probably only be a symlink */
>> +	if (dev->render)
>> +		debugfs_create_file(name, 0444, dev->render->debugfs_root,
>> +				    entry, &drm_debugfs_entry_fops);
> Nope. You are fundamentally missing the point of all this, which is:
>
> - drivers create debugfs files whenever they want to, as long as it's
>    _before_ drm_dev_register is called.
>
> - drm_dev_register will set them all up.
>
> This is necessary because otherwise you have the potential for some nice
> oops and stuff when userspace tries to access these files before the
> driver is ready.
>
> Note that with sysfs all this infrastructure already exists, which is why
> you can create sysfs files whenever you feel like, and things wont go
> boom.

Well Yeah I've considered that, I just don't think it's a good idea for 
debugfs.

debugfs is meant to be a helper for debugging things and that especially 
includes the time between drm_dev_init() and drm_dev_register() because 
that's where we probe the hardware and try to get it working.

Not having the debugfs files which allows for things like hardware 
register access and reading internal state during that is a really and I 
mean REALLY bad idea. This is essentially what we have those files for.

> So yeah we need the list.
>
> This also means that we really should not create the debugfs directories
> _before_ drm_dev_register is called. That's just fundamentally not how
> device interface setup should work:
>
> 1. you allocate stucts and stuff
> 2. you fully init everything
> 3. you register interfaces so they become userspace visible

How about we create the debugfs directory early and only delay the files 
registered through this drm_debugfs interface until registration time?

This way drivers can still decide if they want the files available 
immediately or only after registration.

What drivers currently do is like radeon setting an accel_working flag 
and registering anyway even if halve the hardware doesn't work.

Regards,
Christian.

> -Daniel
>
>>   }
>>   EXPORT_SYMBOL(drm_debugfs_add_file);
>>   
>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>> index 2cbe028e548c..e7b88b65866c 100644
>> --- a/drivers/gpu/drm/drm_drv.c
>> +++ b/drivers/gpu/drm/drm_drv.c
>> @@ -597,7 +597,6 @@ static void drm_dev_init_release(struct drm_device *dev, void *res)
>>   	mutex_destroy(&dev->clientlist_mutex);
>>   	mutex_destroy(&dev->filelist_mutex);
>>   	mutex_destroy(&dev->struct_mutex);
>> -	mutex_destroy(&dev->debugfs_mutex);
>>   	drm_legacy_destroy_members(dev);
>>   }
>>   
>> @@ -638,14 +637,12 @@ static int drm_dev_init(struct drm_device *dev,
>>   	INIT_LIST_HEAD(&dev->filelist_internal);
>>   	INIT_LIST_HEAD(&dev->clientlist);
>>   	INIT_LIST_HEAD(&dev->vblank_event_list);
>> -	INIT_LIST_HEAD(&dev->debugfs_list);
>>   
>>   	spin_lock_init(&dev->event_lock);
>>   	mutex_init(&dev->struct_mutex);
>>   	mutex_init(&dev->filelist_mutex);
>>   	mutex_init(&dev->clientlist_mutex);
>>   	mutex_init(&dev->master_mutex);
>> -	mutex_init(&dev->debugfs_mutex);
>>   
>>   	ret = drmm_add_action_or_reset(dev, drm_dev_init_release, NULL);
>>   	if (ret)
>> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
>> index 5ff7bf88f162..e215d00ba65c 100644
>> --- a/drivers/gpu/drm/drm_internal.h
>> +++ b/drivers/gpu/drm/drm_internal.h
>> @@ -188,7 +188,6 @@ int drm_debugfs_init(struct drm_minor *minor, int minor_id,
>>   void drm_debugfs_dev_register(struct drm_device *dev);
>>   void drm_debugfs_minor_register(struct drm_minor *minor);
>>   void drm_debugfs_cleanup(struct drm_minor *minor);
>> -void drm_debugfs_late_register(struct drm_device *dev);
>>   void drm_debugfs_connector_add(struct drm_connector *connector);
>>   void drm_debugfs_connector_remove(struct drm_connector *connector);
>>   void drm_debugfs_crtc_add(struct drm_crtc *crtc);
>> @@ -205,10 +204,6 @@ static inline void drm_debugfs_cleanup(struct drm_minor *minor)
>>   {
>>   }
>>   
>> -static inline void drm_debugfs_late_register(struct drm_device *dev)
>> -{
>> -}
>> -
>>   static inline void drm_debugfs_connector_add(struct drm_connector *connector)
>>   {
>>   }
>> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
>> index 87eb591fe9b5..8525ef851540 100644
>> --- a/drivers/gpu/drm/drm_mode_config.c
>> +++ b/drivers/gpu/drm/drm_mode_config.c
>> @@ -54,8 +54,6 @@ int drm_modeset_register_all(struct drm_device *dev)
>>   	if (ret)
>>   		goto err_connector;
>>   
>> -	drm_debugfs_late_register(dev);
>> -
>>   	return 0;
>>   
>>   err_connector:
>> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
>> index 7cf4afae2e79..900ad7478dd8 100644
>> --- a/include/drm/drm_device.h
>> +++ b/include/drm/drm_device.h
>> @@ -311,21 +311,6 @@ struct drm_device {
>>   	 */
>>   	struct drm_fb_helper *fb_helper;
>>   
>> -	/**
>> -	 * @debugfs_mutex:
>> -	 *
>> -	 * Protects &debugfs_list access.
>> -	 */
>> -	struct mutex debugfs_mutex;
>> -
>> -	/**
>> -	 * @debugfs_list:
>> -	 *
>> -	 * List of debugfs files to be created by the DRM device. The files
>> -	 * must be added during drm_dev_register().
>> -	 */
>> -	struct list_head debugfs_list;
>> -
>>   	/* Everything below here is for legacy driver, never use! */
>>   	/* private: */
>>   #if IS_ENABLED(CONFIG_DRM_LEGACY)
>> -- 
>> 2.34.1
>>

