Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E98699AA1
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 17:56:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD4F10E339;
	Thu, 16 Feb 2023 16:56:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2050.outbound.protection.outlook.com [40.107.244.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7203410EE1F
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 16:56:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lbZgAq/e04DLelr1pXln4bJSzYanBNnSWWziChJUOShEYKEgjPG4EUTd8LByDLtZl1g2fJeuhbqLmLt3iYTS02dhHhRaERkJyptB0EyKHocTINvief8/eKBILbIpFmm2MRpfBtulqC/RbRadDv+vMuwQ15dy7fmZZYEQc1j3b/31HmdOPiL0Chm8JdqIqf/O1Nb2BkxCrh/d5kMhs3MQ4Wr7D7c09va3d1wAvGlXPe7fnZWYrA8KZZY8iyIQwDXMW5zKdO74TYE3i8T3JpHKs3G35YB+1XiwnNE6KItu7EICpHCUxuzd52khp0nV7VDd7sSRAC0D2JsfHkfvVnm6Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7wUV05usYJ8K9EEYN10z0MNhQbdaJ+d4xlJb8olLMgA=;
 b=DZbuRv1thf9hGS7+WSyLuPgYEo8hMEgkoa6+YQ907NkTw2B8ti1+XeeZTSIvuR8CwM23niel7Pbu17uOT8AoOGikbD29qQwo3wSWIhj/4hz1Hob0p0o8zr/FtRqURiyWdUlpGJr7OH0XnYNIq/rJfnI5NpSQ8U6SiL1NjRIDVizVJ6n3uBhEtAHdLNo+ObFIxOqpCjglmzD0JsVcuOwoDPbZ4g4O5pusrqSx6HxFbP/wMYMufnqMhKHQgBtv2sK0G2PtsAwlaSt4cCkbvRSjJVv+yNPSrbX7/MSnUTnyXZNyIeeKy52qRUhQsl7ATYukTOoqRQv+MmPG1+IyUC0jZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7wUV05usYJ8K9EEYN10z0MNhQbdaJ+d4xlJb8olLMgA=;
 b=eS0LAhwhbqt1noRQ5YXb6v3GIVY90ND9dSpFwaG8Uq0plJNYuCw4SKo5waWO7fcvxAGl19eD1ooIBZHl534+DmlVBUhhLlW/iudtE1tK6QhC0ykY2bgFa3dnAQ1+MStKZGUxYgwgwLVZUvEtwHHrqntNrThhZypxMA+Nfh2pcgU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB6469.namprd12.prod.outlook.com (2603:10b6:8:b6::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.26; Thu, 16 Feb 2023 16:56:13 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6111.013; Thu, 16 Feb 2023
 16:56:12 +0000
Message-ID: <694091b5-dca0-fff5-3dd5-548bfa8733fc@amd.com>
Date: Thu, 16 Feb 2023 17:56:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/3] drm/debugfs: remove dev->debugfs_list and
 debugfs_mutex
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230209081838.45273-1-christian.koenig@amd.com>
 <20230209081838.45273-4-christian.koenig@amd.com>
 <Y+4UdBzk6RkQzcsI@phenom.ffwll.local>
 <f555bda0-80b6-c0bc-566f-0ef49c96da0a@amd.com> <87sff5zhgs.fsf@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <87sff5zhgs.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0149.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::10) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM4PR12MB6469:EE_
X-MS-Office365-Filtering-Correlation-Id: 75e85805-5e93-4987-61dc-08db103eb52b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rvx3/FJf6rXn7omfNbX9j08CGlwyCCCbjKSJf+eyvHrgDmoXbef9Z+PKn8WpEfmtw17vU+vrbsG5mMNNJTfQ4G7EBmzc2ArJqW/2XIrXvJqJmfPAnwmHfbiNU5W2Hb+3iAGfLp6usOwnRjVcu/03GCugeCVlViYuT8Fc/fFIAwhRwlBDLm3QbY4cKZRvkZdpV79D9yGbz3EA2EXkrZPosUogbRTte9F15t2VzBDxFTlUefTndFWwjX7eyT/AuDqh7tcYRmGFIeuZyBBFHTQ7tMwnu49opBRAoDtBKxB6pNwbxkj1I6/kM+bLV62ohZ/6HyjJdmSH2l01LG7Z6Koj82LKhO+OvzcmaQzNlU4f44qVxleWPBDq4qR1v+d3KV6opl56DgyBula2y4UyMueqtTHlofOQhddt+TpzrbqFcBCSAYJNWrO8kAGqwIwyPbu4R5Fgmh59UWMY4kcNZ44JX4xqaE9jaKgTrRMzo+/aII9vXh7MW/di5EkCPmdxEGLzTISyeQSbhLZpHY7EWrAcaihQumN6VPzSd4HdGwkqPsZrudmyI0WcdKJugiFeepFmeYOmCzyGB1n4Cgy5JqCN59tyWA9whpKfB8xnDNJtElsSIqcfRLQSmBH69i1F+WYoPwZF7di4dk+9F/EHqp1j4mUIVW82PKgukrThxHMgvdT9bN63bc+NByHo8TZP3MUOxRDaqGpR90mbNNjL1byI8TjPHrblf5C3Bcy/U+OQeEc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(346002)(366004)(136003)(39860400002)(396003)(451199018)(110136005)(36756003)(31696002)(66574015)(186003)(86362001)(2906002)(6512007)(6666004)(316002)(2616005)(31686004)(83380400001)(6486002)(478600001)(6506007)(38100700002)(41300700001)(4326008)(8936002)(5660300002)(66946007)(66476007)(66556008)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkpVb01MQXZ2ZEhxWHdKc1U3TVlpcHFTTHNYT29UOVVuZEg3VE5QL3Q5TFhL?=
 =?utf-8?B?b05qVnVmaE1GM3hzVDlVTHBMajlLeWJPbFYzRmxFYklrN1dSWm9uT1g4U0F3?=
 =?utf-8?B?TVJiaVlTbGZUWWFhaVZKVDhzbnJPUUpvWHJDSGs4RktiNUJBTUlmVDB6amJ5?=
 =?utf-8?B?a01ZeDlNRktIbXpYQTVZMFpicTZFbXpNU3Q2ZU5ob0dUbFcrdW56NjZ6WU55?=
 =?utf-8?B?blozSExoei9ycFBwcUZiOHB6ZDNMK0ZBdlI4T1AwZmJFRG5FS2o2bDJpR0Ny?=
 =?utf-8?B?WWM2cXdiRGxzU2FCcVpPVXo0Qk5mMUlzcStKeDl1T2xNcVI0amxQeDd3aUZX?=
 =?utf-8?B?SG1SVXVGUnBmVnNXRGZRcHZXK2lQU2QzNmMxSUpqUWFZbThrbU1xb2FyS21k?=
 =?utf-8?B?VUNDWFVmNThBMzd5QkJlcks3Zms4UTNaWHBhallWQmhXVnI0U0JpQVhKUGc5?=
 =?utf-8?B?SHUzc2xkekVnaHFuakE1WE5QNDd4Rk5ycGR2TnJRaThxYm1vYjFiZE1PaW1T?=
 =?utf-8?B?VUQ4c1ZHK0VCNEdYMlU5KzhPUGxwS2NkOGNONURTWlNab3BrTEJpc25ERG9Q?=
 =?utf-8?B?a1RubllxRDNZSVJQWDVJK3o4VU9UNlRuVTM4NmVXTXVUVGZYWGI0dkNQMFRn?=
 =?utf-8?B?eTlQcFFYK0NVc011NXZ6aXBWbFR0Z3VaeTBKZ1c4MjJadVNrOUgxb2VjM0ti?=
 =?utf-8?B?TDlpWDY4L2pFWGJuQ2JYU3lPSkQ4a3hqT1Rua3B0alNFK3ZBQXpSRUdJYTJp?=
 =?utf-8?B?QW5GNTdSVXVRcHJPMHM3RXMzdE9QendHR0FuN2RPODlMeGh2UEVVN3NBREUz?=
 =?utf-8?B?bHVsUEIrUWRFa3Q2SEY4UHV3TW9iS2N4aG1FeDVyMlJXdVhpeE9jcGM3ZHp3?=
 =?utf-8?B?cm1oTFduWUhTOUhPQUdjVzRRWmZRYUJ1WUZtbjNwb2c5MW5haHFSMFJKdHdN?=
 =?utf-8?B?cndrcUZYQmxQd1h5ZlYvemtGTGhWNDFVU1NhekFxaDlSQml3ek16Sk9FQVgx?=
 =?utf-8?B?V3h2S3RPMGllWkJsTU1oWjYyc0FST01CdTA0ZlROb3VGeTFMT2dwaURVck1i?=
 =?utf-8?B?c21jVnpEQnJ4RkdnSFAwWjFHalVKdm15RGNRK2FkYnBLeGJ1V2VpNjJ5cEIv?=
 =?utf-8?B?SGFKSmdCUnBtTWMxRFRiT0xkZzBzamNma1o1MkRMSElZc3Rod0NiSWdObFYv?=
 =?utf-8?B?N2R2VzVEYmxDSGN0aTF3RmtZNGQxTjkwN0xJWmlXVm5QSFpnSzJKOVk1aDda?=
 =?utf-8?B?Z2hsNVphYTdOa3ZKZGtTbEdralRUNlBCUGJpVVc2cVVwTG5yVzhlWUhFZzY1?=
 =?utf-8?B?VWd3cDNQc3hMSzRVWldaR0xMOWVSaEtlcW8xZWxuZEhmTFBrczVKYlNUNThp?=
 =?utf-8?B?VWdsL0s2bStHcGVhcGtUbmtMVUYyUmdqRmFNVS91N0NFZUczRjM5c091YUVY?=
 =?utf-8?B?NHI4WUpDSkM2eGw0cTBROFQwNGU4azBUKzlaRkJEUXJiamE4NFpEdXdheis2?=
 =?utf-8?B?ZDJySUhZRnJSdXBmVVpsOUtMR3kwL3U0Y3Y5ZWxhblNndFp4aWNRbnlEMjNH?=
 =?utf-8?B?U2E5aEFmNzJ5Tk9GTUlmRUQ0bUp5bUttV1hkNzlNelorRTlJdDhtMmNnNHZx?=
 =?utf-8?B?ZHhPWXk3ZlJoQU4rcUZRTGhJR1dFbWZONzJDTXhMck5SS1pxQU5lZ0ZQbHA3?=
 =?utf-8?B?dlgzbVNmMlNWVnhJZjVKQ2ZCY2RqL2ZPVlpXVmlDQlNnbkdDZDdNbTExdVk3?=
 =?utf-8?B?Y1BmSW9LTHJuVXhhS1NSS3UyYnJtQlk0MTllMVdXWCtaS0hFNkVCREtNVEhU?=
 =?utf-8?B?Ymthcjk2YWNxMEgrTmx2WC9JbHVlMzNWZUZ6ZSt0MTI4SlNHa3FlUWVpempw?=
 =?utf-8?B?UXhRMDdiMWpKdzJHRWJndmdDSzhnNmpWMlJIeGowL2t4WFM5SDFnK2lJOVNk?=
 =?utf-8?B?V21PTGxtQkpQTmV1MXVUVEFDRnlncnZhNmp1QjVRclM2dXhTTk40ejVvU0dC?=
 =?utf-8?B?QVRmN3V0NUI1RVNmRmZ6ek15ZE1HUHhuaVM5ejJ1YVJ3ejI4SGZxb2xFejFn?=
 =?utf-8?B?QzJ0MWx5U1IzQWoxa240WVJ3MTBGZWJXU2JjWUVjekQrZ0QwRHNpbUowSFFI?=
 =?utf-8?B?WHpIQXplbWdVVWxmMHp3TkpaTUQwZ2hGbVZadEcyb0dMMFB5MWpaMG52aGQ1?=
 =?utf-8?Q?UD9eFJSJedPznHGYmIKGMxDjdwWzQDe61gtq+scfqQjH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75e85805-5e93-4987-61dc-08db103eb52b
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 16:56:11.8624 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CL/nbpNiiSAOXQ28b782goTps/rxUKhWwkY+KjJQ/ROiFiQb+ibQqu8NaX95v+J2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6469
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

Am 16.02.23 um 17:46 schrieb Jani Nikula:
> On Thu, 16 Feb 2023, Christian König <christian.koenig@amd.com> wrote:
>> Am 16.02.23 um 12:33 schrieb Daniel Vetter:
>>> On Thu, Feb 09, 2023 at 09:18:38AM +0100, Christian König wrote:
>>>> The mutex was completely pointless in the first place since any
>>>> parallel adding of files to this list would result in random
>>>> behavior since the list is filled and consumed multiple times.
>>>>
>>>> Completely drop that approach and just create the files directly.
>>>>
>>>> This also re-adds the debugfs files to the render node directory and
>>>> removes drm_debugfs_late_register().
>>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> ---
>>>>    drivers/gpu/drm/drm_debugfs.c     | 32 +++++++------------------------
>>>>    drivers/gpu/drm/drm_drv.c         |  3 ---
>>>>    drivers/gpu/drm/drm_internal.h    |  5 -----
>>>>    drivers/gpu/drm/drm_mode_config.c |  2 --
>>>>    include/drm/drm_device.h          | 15 ---------------
>>>>    5 files changed, 7 insertions(+), 50 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
>>>> index 558e3a7271a5..a40288e67264 100644
>>>> --- a/drivers/gpu/drm/drm_debugfs.c
>>>> +++ b/drivers/gpu/drm/drm_debugfs.c
>>>> @@ -246,31 +246,9 @@ void drm_debugfs_dev_register(struct drm_device *dev)
>>>>    void drm_debugfs_minor_register(struct drm_minor *minor)
>>>>    {
>>>>    	struct drm_device *dev = minor->dev;
>>>> -	struct drm_debugfs_entry *entry, *tmp;
>>>>    
>>>>    	if (dev->driver->debugfs_init)
>>>>    		dev->driver->debugfs_init(minor);
>>>> -
>>>> -	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
>>>> -		debugfs_create_file(entry->file.name, 0444,
>>>> -				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
>>>> -		list_del(&entry->list);
>>>> -	}
>>>> -}
>>>> -
>>>> -void drm_debugfs_late_register(struct drm_device *dev)
>>>> -{
>>>> -	struct drm_minor *minor = dev->primary;
>>>> -	struct drm_debugfs_entry *entry, *tmp;
>>>> -
>>>> -	if (!minor)
>>>> -		return;
>>>> -
>>>> -	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
>>>> -		debugfs_create_file(entry->file.name, 0444,
>>>> -				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
>>>> -		list_del(&entry->list);
>>>> -	}
>>>>    }
>>>>    
>>>>    int drm_debugfs_remove_files(const struct drm_info_list *files, int count,
>>>> @@ -343,9 +321,13 @@ void drm_debugfs_add_file(struct drm_device *dev, const char *name,
>>>>    	entry->file.data = data;
>>>>    	entry->dev = dev;
>>>>    
>>>> -	mutex_lock(&dev->debugfs_mutex);
>>>> -	list_add(&entry->list, &dev->debugfs_list);
>>>> -	mutex_unlock(&dev->debugfs_mutex);
>>>> +	debugfs_create_file(name, 0444, dev->primary->debugfs_root, entry,
>>>> +			    &drm_debugfs_entry_fops);
>>>> +
>>>> +	/* TODO: This should probably only be a symlink */
>>>> +	if (dev->render)
>>>> +		debugfs_create_file(name, 0444, dev->render->debugfs_root,
>>>> +				    entry, &drm_debugfs_entry_fops);
>>> Nope. You are fundamentally missing the point of all this, which is:
>>>
>>> - drivers create debugfs files whenever they want to, as long as it's
>>>     _before_ drm_dev_register is called.
>>>
>>> - drm_dev_register will set them all up.
>>>
>>> This is necessary because otherwise you have the potential for some nice
>>> oops and stuff when userspace tries to access these files before the
>>> driver is ready.
>>>
>>> Note that with sysfs all this infrastructure already exists, which is why
>>> you can create sysfs files whenever you feel like, and things wont go
>>> boom.
>> Well Yeah I've considered that, I just don't think it's a good idea for
>> debugfs.
>>
>> debugfs is meant to be a helper for debugging things and that especially
>> includes the time between drm_dev_init() and drm_dev_register() because
>> that's where we probe the hardware and try to get it working.
>>
>> Not having the debugfs files which allows for things like hardware
>> register access and reading internal state during that is a really and I
>> mean REALLY bad idea. This is essentially what we have those files for.
> So you mean you want to have early debugfs so you can have some script
> hammering the debugfs to get info out between init and register during
> probe?

Well not hammering. What we usually do in bringup is to set firmware 
timeout to infinity and the driver then sits and waits for the hw.

The tool used to access registers then goes directly through the PCI bar 
at the moment, but that's essentially a bad idea for registers which you 
grab a lock for to access (like index/data).

>
> I just think registering debugfs before everything is ready is a recipe
> for disaster. All of the debugfs needs to check all the conditions that
> they need across all of the probe stages. It'll be difficult to get it
> right. And you'll get cargo culted checks copy pasted all over the
> place.

Yeah, but it's debugfs. That is not supposed to work under all conditions.

Just try to read amdgpu_regs on a not existing register index. This will 
just hang or reboot your box immediately on APUs.

Regards,
Christian.

>
>
> BR,
> Jani.
>
>
>>> So yeah we need the list.
>>>
>>> This also means that we really should not create the debugfs directories
>>> _before_ drm_dev_register is called. That's just fundamentally not how
>>> device interface setup should work:
>>>
>>> 1. you allocate stucts and stuff
>>> 2. you fully init everything
>>> 3. you register interfaces so they become userspace visible
>> How about we create the debugfs directory early and only delay the files
>> registered through this drm_debugfs interface until registration time?
>>
>> This way drivers can still decide if they want the files available
>> immediately or only after registration.
>>
>> What drivers currently do is like radeon setting an accel_working flag
>> and registering anyway even if halve the hardware doesn't work.
>>
>> Regards,
>> Christian.
>>
>>> -Daniel
>>>
>>>>    }
>>>>    EXPORT_SYMBOL(drm_debugfs_add_file);
>>>>    
>>>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>>>> index 2cbe028e548c..e7b88b65866c 100644
>>>> --- a/drivers/gpu/drm/drm_drv.c
>>>> +++ b/drivers/gpu/drm/drm_drv.c
>>>> @@ -597,7 +597,6 @@ static void drm_dev_init_release(struct drm_device *dev, void *res)
>>>>    	mutex_destroy(&dev->clientlist_mutex);
>>>>    	mutex_destroy(&dev->filelist_mutex);
>>>>    	mutex_destroy(&dev->struct_mutex);
>>>> -	mutex_destroy(&dev->debugfs_mutex);
>>>>    	drm_legacy_destroy_members(dev);
>>>>    }
>>>>    
>>>> @@ -638,14 +637,12 @@ static int drm_dev_init(struct drm_device *dev,
>>>>    	INIT_LIST_HEAD(&dev->filelist_internal);
>>>>    	INIT_LIST_HEAD(&dev->clientlist);
>>>>    	INIT_LIST_HEAD(&dev->vblank_event_list);
>>>> -	INIT_LIST_HEAD(&dev->debugfs_list);
>>>>    
>>>>    	spin_lock_init(&dev->event_lock);
>>>>    	mutex_init(&dev->struct_mutex);
>>>>    	mutex_init(&dev->filelist_mutex);
>>>>    	mutex_init(&dev->clientlist_mutex);
>>>>    	mutex_init(&dev->master_mutex);
>>>> -	mutex_init(&dev->debugfs_mutex);
>>>>    
>>>>    	ret = drmm_add_action_or_reset(dev, drm_dev_init_release, NULL);
>>>>    	if (ret)
>>>> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
>>>> index 5ff7bf88f162..e215d00ba65c 100644
>>>> --- a/drivers/gpu/drm/drm_internal.h
>>>> +++ b/drivers/gpu/drm/drm_internal.h
>>>> @@ -188,7 +188,6 @@ int drm_debugfs_init(struct drm_minor *minor, int minor_id,
>>>>    void drm_debugfs_dev_register(struct drm_device *dev);
>>>>    void drm_debugfs_minor_register(struct drm_minor *minor);
>>>>    void drm_debugfs_cleanup(struct drm_minor *minor);
>>>> -void drm_debugfs_late_register(struct drm_device *dev);
>>>>    void drm_debugfs_connector_add(struct drm_connector *connector);
>>>>    void drm_debugfs_connector_remove(struct drm_connector *connector);
>>>>    void drm_debugfs_crtc_add(struct drm_crtc *crtc);
>>>> @@ -205,10 +204,6 @@ static inline void drm_debugfs_cleanup(struct drm_minor *minor)
>>>>    {
>>>>    }
>>>>    
>>>> -static inline void drm_debugfs_late_register(struct drm_device *dev)
>>>> -{
>>>> -}
>>>> -
>>>>    static inline void drm_debugfs_connector_add(struct drm_connector *connector)
>>>>    {
>>>>    }
>>>> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
>>>> index 87eb591fe9b5..8525ef851540 100644
>>>> --- a/drivers/gpu/drm/drm_mode_config.c
>>>> +++ b/drivers/gpu/drm/drm_mode_config.c
>>>> @@ -54,8 +54,6 @@ int drm_modeset_register_all(struct drm_device *dev)
>>>>    	if (ret)
>>>>    		goto err_connector;
>>>>    
>>>> -	drm_debugfs_late_register(dev);
>>>> -
>>>>    	return 0;
>>>>    
>>>>    err_connector:
>>>> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
>>>> index 7cf4afae2e79..900ad7478dd8 100644
>>>> --- a/include/drm/drm_device.h
>>>> +++ b/include/drm/drm_device.h
>>>> @@ -311,21 +311,6 @@ struct drm_device {
>>>>    	 */
>>>>    	struct drm_fb_helper *fb_helper;
>>>>    
>>>> -	/**
>>>> -	 * @debugfs_mutex:
>>>> -	 *
>>>> -	 * Protects &debugfs_list access.
>>>> -	 */
>>>> -	struct mutex debugfs_mutex;
>>>> -
>>>> -	/**
>>>> -	 * @debugfs_list:
>>>> -	 *
>>>> -	 * List of debugfs files to be created by the DRM device. The files
>>>> -	 * must be added during drm_dev_register().
>>>> -	 */
>>>> -	struct list_head debugfs_list;
>>>> -
>>>>    	/* Everything below here is for legacy driver, never use! */
>>>>    	/* private: */
>>>>    #if IS_ENABLED(CONFIG_DRM_LEGACY)
>>>> -- 
>>>> 2.34.1
>>>>

