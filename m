Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 067A069A809
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 10:22:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A2C10EF2D;
	Fri, 17 Feb 2023 09:22:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20621.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::621])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2AFF10EF2D
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 09:22:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FAVdFU+IMk60GQZBhXNjxmF0kSJaT7SdPF/cr/WNFPmA2kff7DoTGWpCkvYhfjTGyeuU/Efp9aUXlWRsQJ4HAi2sY7wEoBKYVckh5w9xxc3nn1vViqUvMOzKyz0xgk1M817C7P9ZaV9Uk/f+pzQ1Z+4lpNywCL1hEOzFo5/tIRNdszv6BwxY+y5NsfwUX04hGNBnc05GWQ0VbmOCEn4c7qLETjMF33DqRBFdSGi5W0t6xwFQP2k+Xy0cgoGwyjSaXA5sTfriBC9xvZ4y8rYcdYfHgBcshpxL9Ur7xNrd4ZoFxWi1vZDHYpCYIJtXVyEwEp6f1nje6GSXJko2tWoP+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dHSzYADJ7ZADuIj72lrwrEwnhaX4L+MibPXOYVFLhk8=;
 b=Bkc/hn7ULNVOI6X+D3+kHO9P5oCyDDoR3aitqz5911bYVV1HMHqPmIhyzhunYo7G9VTgJNlwLgCYFyZclbOm1Y5GdG5hLNvZ53EwNSYdfOG1LmqrRml5oCTfvdl/ZlS5UVB6Qwki0so6ugznzkKz9rNBxq+9iG77VMU7Q0fOyQaUBKcJpoE+27YjmsUqVR+mhJOejmOjkgESmHjcTZ5Gqqx/xIvbigRjx3q1SlJ0mHFxVY8xIardS53hmUlPac/tYUi8n8/wVaH/ScR8wMYNaVZ7IzGLV0i9hVYXzbeO62IC69ZEJm09kTnxpH+Qjl4bfaBs6d+Hoyp9HKpbeAc2WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dHSzYADJ7ZADuIj72lrwrEwnhaX4L+MibPXOYVFLhk8=;
 b=ie9A4u0UvxY6XYHcuU/mYsDz+9s5y4uSqjbY/tooP6+3KaLGiHGeB5xfvIQLZSaLr9hXKaTai9nW8U+guazwO98erliLx16UXxvjwVA7CeGYCj7kVhg3v4XGInOjGqaOguWuY4fWm4nv9RgA/cxFF/KnIDwqdXnK8FufvdUMuc0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BY5PR12MB4196.namprd12.prod.outlook.com (2603:10b6:a03:205::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.12; Fri, 17 Feb
 2023 09:22:30 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 09:22:29 +0000
Message-ID: <4904cea7-3440-1e52-f5ea-71b9069506a6@amd.com>
Date: Fri, 17 Feb 2023 10:22:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/3] drm/debugfs: remove dev->debugfs_list and
 debugfs_mutex
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>
References: <20230209081838.45273-1-christian.koenig@amd.com>
 <20230209081838.45273-4-christian.koenig@amd.com>
 <Y+4UdBzk6RkQzcsI@phenom.ffwll.local>
 <f555bda0-80b6-c0bc-566f-0ef49c96da0a@amd.com> <87sff5zhgs.fsf@intel.com>
 <694091b5-dca0-fff5-3dd5-548bfa8733fc@amd.com> <87ilg1zgf2.fsf@intel.com>
 <Y+6JyNNkLdDnxaer@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <Y+6JyNNkLdDnxaer@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BY5PR12MB4196:EE_
X-MS-Office365-Filtering-Correlation-Id: fa87bd2d-e817-45c0-1d68-08db10c87e1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xT4LJC6bYwFQ4EcR5lVWhUqTAdfIORhjGWxxIPocEmharCtTRZpuDiQIKWZ6Y9xNZzkm/MDINCVakIqtOn9I3+3fnVgwXJsNN0/ZsSc8NEYwi4tcKOR6Is2uTw59pD0OeftZT5LO5IquPnNEIuPFtXfM0U6NpGoCo4qsjqQxP/DIZCA/z8cHVbDY8/HzHcwuiMrNchaZluGUEg6HgKzjfRBNnUIUw7bychdNrCt/yXqGZk7jRSlY6kIR5rdEx6yWAZnC6k2rsNOsD4/ihUouRHQVukoKmHFbhmPGTXo7Yp8/ZdS9S1BY3+5/kzo4KWsgaDwb9KySP7YLfKJadUQejRTZbWjIesu5LLBHIiHo9XtKqR20n/yHB3q6uQLzCTrMtMfbYvuNJEdD061nlq0j0kYpmiQeY2Y8Ehvisf1hsJ4W9dqocMxrI4GRshThBX//L3+gmFGj0TUcgHHKcch7lWNXWuRVC4OlK3Pxe298xrDvEbj5AtjJgznN/0XwyJ6zPIL9dnoPHw6kLDAmfJH1cmmz70fwUiuIo4EVOS2mT9GKBRa6AsKld0yMb5LiEhMYXdV3sIdt7gbZVTtLOuExMHTiZniE/9S2Iu4klE8EOkWlgoRph3q8p5R7jnhPAwrJJ+NUCCB1uC9INRoP7VvceUtXCWScKPG1ioE23IsFTKdQsliwhZe/E20WPjKSjN5fNmaLEq817fWxKgXY66kTCp9SCInC1qLYroyqln5rIl8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(396003)(366004)(39860400002)(376002)(346002)(451199018)(110136005)(5660300002)(6486002)(31696002)(2906002)(6512007)(86362001)(6666004)(36756003)(6506007)(186003)(478600001)(2616005)(8676002)(41300700001)(4326008)(31686004)(66476007)(66556008)(83380400001)(66946007)(38100700002)(316002)(66574015)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TW1Fa05zTzhTeXgrdlhKN0VQMThiREc2QkpxUEo3ZnA4RytkMTRRVXNPL0ov?=
 =?utf-8?B?T1J1TFgyNEVMcGlDbGphRzdOL3NOZTdNWXF0K0hWODF3NE52YW9kVUhlYTc1?=
 =?utf-8?B?WUJkYlc2d2xET3Y2UHNGTTJoTGJNVVhmMkRBTkNMY3FPSzg2Y3RmNENyYUVH?=
 =?utf-8?B?bVFGZEJadkozTjdtVTBzRFZOVWYzQk5QcjViQ3hMUFlHOGxyY1kvOHZtNFFp?=
 =?utf-8?B?b3QvZ0pVZFFnRE5iOTRSdWI2OEc1RTZLQ1Q1YTlpVEV0Q3dyUk9rbitMdFFL?=
 =?utf-8?B?V2hwajMvNDI2VFJIY0ZFQUZwUmVpc2hiNisyWGpIbXFSb3prNmRtMzYzOG84?=
 =?utf-8?B?MnZ2NXRyaHlqTmpYWmxjQ0MzY2pHZ1hOcmZBRVkzN0llWUxUUlM0TFRLZDE1?=
 =?utf-8?B?b1lCYzlJZW5SaXFsdlNIQW91WVRGanFMMlBGQzVieXc1L0w0WGoySG0rUWdT?=
 =?utf-8?B?TC9zbU8rVkVyNi84YVlRbm5RQmNzbE5wS0VJR3Z0OGFCOWE2N0hmSUpnYTdp?=
 =?utf-8?B?UUZBZ2xwWTJZdWFxa1pRVHc4RTJxN3ROWHprcitEMUt3NVZWN0IvY0d6aGVm?=
 =?utf-8?B?dEVTK1c5dksweVozRmVFeUd3N2dwekZUQWp1RlZnUTVzMnZ1NENmcFJJaDNz?=
 =?utf-8?B?YTZkUTlSOHd4TXBGY3UwSFZaejVsQXVnVEplY0NmS3lrditHemNoRlRrTm15?=
 =?utf-8?B?MCtrR0VkVXMwM0lOYmtzb0pITHNvQ2FlWWJIRUEyQnpVRXk5djRBUzkraWFQ?=
 =?utf-8?B?ZVVlOWNEcWNGekpHUHM2OVRHdHRCUncwZXlCVHEwZ0FqNDVrQlpLc2NwQVVR?=
 =?utf-8?B?b2NqaXhReEsrVlcwb2kvNTRRZ0hiSGZXQ3RUMXZQZkxFS1I3VHpWOTZpdGFh?=
 =?utf-8?B?U1djUVNmZ21hdHpvT0t4NmMwQXpLWXRyZTlGRVZmVXFGcm5WMzh3MDZoVXBm?=
 =?utf-8?B?dzBqQW1WRC9sOWcxT0M0TEoyc0FPUzQ5b3JyM3hHdngzL0dla2xiRHZUdGdl?=
 =?utf-8?B?aHMxMVpQamhyS0w3aG1OZC9TTjQ4cnprTzZEWDJEcEFMazRsNmdWdC9UKzNN?=
 =?utf-8?B?S21OZkJTbnhRYWdsaVNTenk4MUJVMXdvR0ZqLzN5cjY2YzVsalVVTFdnSDhu?=
 =?utf-8?B?VTRvSHA2YjJGZGtMb0lzNGp1YngzeS9HVy9OOEYxekkxdzFvZ1VHTHR4MTRz?=
 =?utf-8?B?anJDZjdrUWo4UTgyWmpyaG4rM0hMQ2d4SDF6NlhlZnFYOUJTL2ZSSkpHU0NZ?=
 =?utf-8?B?MHFMeVBmbEJsVUN0TzBzMDBHYUVqdTh2Q0phWWliZUtFS1pvU1ovV2lkZndS?=
 =?utf-8?B?QVhvRzBjWEQ5T21NY3VJeGFFMmwvTTVVVzI4dmxjNVR6TDhQaWREQVVmalN3?=
 =?utf-8?B?YzM4QjlteDQ3aU5jdnhROUw5NVQ0R0RCSWhnMUsvaFJmb2xVb21CbUVhVkdo?=
 =?utf-8?B?NlBqUHpPbzhndWtUR2VQNFdvaFpoQUhKcnhPeXRXUlBjcFdaWXI1dVFxS3ZK?=
 =?utf-8?B?RVE2V0NTWGFOdFhuY0ZleEQ2NVozTWd3eXhSZVpmYXVrckUwdHZvUFZDMHdp?=
 =?utf-8?B?clA3b3g2MGVPd1ZzUVRmU3gyRWFPc1p6OEEyMkM0WEZCVnc0clZ4aXl3TE81?=
 =?utf-8?B?SGY2cElMaWNnUGVKK3NKKzdkY0N6TCtTS3laSTF5a2RMQnRnY2ZodGpkU2dD?=
 =?utf-8?B?S1FWZXpjSWphOVR6bDlIRFhLUGk3TEhJZHcvVVYzZVVFa2p1VjlKNzZqRzhr?=
 =?utf-8?B?NWVQalJDazFpTlRzaGFvWDlWL1ZTbUZHUDdYYkFUYTNoM0FGeW43cWdEVUsw?=
 =?utf-8?B?Z1pCRnd3WHVXcXNUSmxWRzFLdU1CQ2YyU3BCYm4yQUd3NDFsV3ZhQTkrSkpj?=
 =?utf-8?B?WUU5dWxPYXFiTk1pYmZ1SlRKRWt5cmNDcjNtaS83dS90bGpXZEtLckE0cCtT?=
 =?utf-8?B?Z3UvRnZoZW12QjMwOUJkN1Z5UnEzWmQ5Rjh2SEVMYkZpR21aTDEySmJiL1Vt?=
 =?utf-8?B?WGdna0JHQjN5dUFFVXlLdVY3bjFuRGJQU0hpblB6REUvclZzNm44TlRBMjQ4?=
 =?utf-8?B?Z1R3UEdoZnUzNlMyOHlsMS9yVHBCY01oOTBOVUpuYys1Nk9iSGRXNGVBZU5I?=
 =?utf-8?B?OHFlLzlDSGdYb0xmR21wS09HVlhEQ0VKOXhxTExzNml6cWxHVDJCVkh0ODNC?=
 =?utf-8?Q?54ZnslAYj5h3A72kztKQLAH3Jykd5YM1MsFCE9KCrsat?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa87bd2d-e817-45c0-1d68-08db10c87e1c
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 09:22:29.9269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GODxBsbQA1Lnqwn9D+FUE9gusuZJacfuaKFsVGd1BIZHahGs7fv3HqG3xWmWypn+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4196
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

Am 16.02.23 um 20:54 schrieb Daniel Vetter:
> On Thu, Feb 16, 2023 at 07:08:49PM +0200, Jani Nikula wrote:
>> On Thu, 16 Feb 2023, Christian König <christian.koenig@amd.com> wrote:
>>> Am 16.02.23 um 17:46 schrieb Jani Nikula:
>>>> On Thu, 16 Feb 2023, Christian König <christian.koenig@amd.com> wrote:
>>>>> Am 16.02.23 um 12:33 schrieb Daniel Vetter:
>>>>>> On Thu, Feb 09, 2023 at 09:18:38AM +0100, Christian König wrote:
>>>>>>> The mutex was completely pointless in the first place since any
>>>>>>> parallel adding of files to this list would result in random
>>>>>>> behavior since the list is filled and consumed multiple times.
>>>>>>>
>>>>>>> Completely drop that approach and just create the files directly.
>>>>>>>
>>>>>>> This also re-adds the debugfs files to the render node directory and
>>>>>>> removes drm_debugfs_late_register().
>>>>>>>
>>>>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>>>>> ---
>>>>>>>     drivers/gpu/drm/drm_debugfs.c     | 32 +++++++------------------------
>>>>>>>     drivers/gpu/drm/drm_drv.c         |  3 ---
>>>>>>>     drivers/gpu/drm/drm_internal.h    |  5 -----
>>>>>>>     drivers/gpu/drm/drm_mode_config.c |  2 --
>>>>>>>     include/drm/drm_device.h          | 15 ---------------
>>>>>>>     5 files changed, 7 insertions(+), 50 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
>>>>>>> index 558e3a7271a5..a40288e67264 100644
>>>>>>> --- a/drivers/gpu/drm/drm_debugfs.c
>>>>>>> +++ b/drivers/gpu/drm/drm_debugfs.c
>>>>>>> @@ -246,31 +246,9 @@ void drm_debugfs_dev_register(struct drm_device *dev)
>>>>>>>     void drm_debugfs_minor_register(struct drm_minor *minor)
>>>>>>>     {
>>>>>>>     	struct drm_device *dev = minor->dev;
>>>>>>> -	struct drm_debugfs_entry *entry, *tmp;
>>>>>>>     
>>>>>>>     	if (dev->driver->debugfs_init)
>>>>>>>     		dev->driver->debugfs_init(minor);
>>>>>>> -
>>>>>>> -	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
>>>>>>> -		debugfs_create_file(entry->file.name, 0444,
>>>>>>> -				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
>>>>>>> -		list_del(&entry->list);
>>>>>>> -	}
>>>>>>> -}
>>>>>>> -
>>>>>>> -void drm_debugfs_late_register(struct drm_device *dev)
>>>>>>> -{
>>>>>>> -	struct drm_minor *minor = dev->primary;
>>>>>>> -	struct drm_debugfs_entry *entry, *tmp;
>>>>>>> -
>>>>>>> -	if (!minor)
>>>>>>> -		return;
>>>>>>> -
>>>>>>> -	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
>>>>>>> -		debugfs_create_file(entry->file.name, 0444,
>>>>>>> -				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
>>>>>>> -		list_del(&entry->list);
>>>>>>> -	}
>>>>>>>     }
>>>>>>>     
>>>>>>>     int drm_debugfs_remove_files(const struct drm_info_list *files, int count,
>>>>>>> @@ -343,9 +321,13 @@ void drm_debugfs_add_file(struct drm_device *dev, const char *name,
>>>>>>>     	entry->file.data = data;
>>>>>>>     	entry->dev = dev;
>>>>>>>     
>>>>>>> -	mutex_lock(&dev->debugfs_mutex);
>>>>>>> -	list_add(&entry->list, &dev->debugfs_list);
>>>>>>> -	mutex_unlock(&dev->debugfs_mutex);
>>>>>>> +	debugfs_create_file(name, 0444, dev->primary->debugfs_root, entry,
>>>>>>> +			    &drm_debugfs_entry_fops);
>>>>>>> +
>>>>>>> +	/* TODO: This should probably only be a symlink */
>>>>>>> +	if (dev->render)
>>>>>>> +		debugfs_create_file(name, 0444, dev->render->debugfs_root,
>>>>>>> +				    entry, &drm_debugfs_entry_fops);
>>>>>> Nope. You are fundamentally missing the point of all this, which is:
>>>>>>
>>>>>> - drivers create debugfs files whenever they want to, as long as it's
>>>>>>      _before_ drm_dev_register is called.
>>>>>>
>>>>>> - drm_dev_register will set them all up.
>>>>>>
>>>>>> This is necessary because otherwise you have the potential for some nice
>>>>>> oops and stuff when userspace tries to access these files before the
>>>>>> driver is ready.
>>>>>>
>>>>>> Note that with sysfs all this infrastructure already exists, which is why
>>>>>> you can create sysfs files whenever you feel like, and things wont go
>>>>>> boom.
>>>>> Well Yeah I've considered that, I just don't think it's a good idea for
>>>>> debugfs.
>>>>>
>>>>> debugfs is meant to be a helper for debugging things and that especially
>>>>> includes the time between drm_dev_init() and drm_dev_register() because
>>>>> that's where we probe the hardware and try to get it working.
>>>>>
>>>>> Not having the debugfs files which allows for things like hardware
>>>>> register access and reading internal state during that is a really and I
>>>>> mean REALLY bad idea. This is essentially what we have those files for.
>>>> So you mean you want to have early debugfs so you can have some script
>>>> hammering the debugfs to get info out between init and register during
>>>> probe?
>>> Well not hammering. What we usually do in bringup is to set firmware
>>> timeout to infinity and the driver then sits and waits for the hw.
>>>
>>> The tool used to access registers then goes directly through the PCI bar
>>> at the moment, but that's essentially a bad idea for registers which you
>>> grab a lock for to access (like index/data).
>>>
>>>> I just think registering debugfs before everything is ready is a recipe
>>>> for disaster. All of the debugfs needs to check all the conditions that
>>>> they need across all of the probe stages. It'll be difficult to get it
>>>> right. And you'll get cargo culted checks copy pasted all over the
>>>> place.
>>> Yeah, but it's debugfs. That is not supposed to work under all conditions.
>>>
>>> Just try to read amdgpu_regs on a not existing register index. This will
>>> just hang or reboot your box immediately on APUs.
>> I'm firmly in the camp that debugfs does not need to work under all
>> conditions, but that it must fail gracefully instead of crashing.
> Yeah I mean once we talk bring-up, you can just hand-roll the necessary
> bring debugfs things that you need to work before the driver is ready to
> do anything.
>
> But bring-up debugfs fun is rather special, same way pre-silicon support
> tends to be rather special. Shipping that in distros does not sound like a
> good idea at all to me.

Yeah, that's indeed a really good point.

I can't remember how often I had to note that module parameters would 
also be used by end users.

How about if the create the debugfs directory with a "." as name prefix 
first and then rename it as soon as the device is registered? 
Alternatively we could clear the i_mode of the directory.

If a power user or engineer wants to debug startup problems stuff it 
should be trivial to work around that from userspace, and if people do 
such things they should also know the potential consequences.

Christian.



> -Daniel
>
>>
>> BR,
>> Jani.
>>
>>

