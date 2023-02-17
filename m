Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF7F69B368
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 20:55:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D841B10E44C;
	Fri, 17 Feb 2023 19:55:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2058.outbound.protection.outlook.com [40.107.223.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2665210E44C
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 19:55:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OqU1dCHDbbSQckR8sTXiC5dPKUdIy66MIsniwRWUS8fx+bKo+qELb/QWC3sOcDlfGAUJlFEFXL0hliO/5MsVQjDTo/PQ7u1N7xBS2UmIp2aASiYpNUhkqNZhZFLaxwP90bKx5u0qexR3xmHSSYJHf4WSvyfUciiMUkd6uI5NJtvoQilvRhl0kbN5PXsqjPs8SkPDer7ZWH2ld/o5XLmcchVYvE60CTaa9i/NLEDLa0t1wbfa+NQg0eyrmrQyCj3wtecuOhwl8O1EkkgYmtvjoOH+/nZLw5zoo6iAvya0ZmLVTQGeMz40XmqkIfhFhLCRIN7T5e+KxcjShcHNvKOT+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uoDK3+6W4Y0PRDw8SODDWeWU8Pv49IwO7tRx6varEhY=;
 b=YB23vqf5Bu+bOGpGchsCnroiRI3ebu3e1SplSldnYBS+Q4LMIp7RzKcrJdJcL+3A+mWEvCbbRu6fRA6gKH5ACKnGIBulRfz+/WX/MAi2Q6mRyUfcC7VMAZCV+qyKz+CQfdCxsFY+C2jGZVAguozXQXLMsJeTT+Tp0+wysfhsFIaXUhxa3uJloJS+S43Tb+SwtOTtufvENLXm48n7pmIXQBaAbKxQtqUNwNbZCkCNYoo8/2SnzLvaKOqU67S4tKwUrQMQjfQYo6jwnWt32tjjMRhIzpHu26dNlaw9CH+w+UKLqC/6p1Y+5Gyf5MfSDjH27pDdwJsgVWvdT2MPG7fWkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uoDK3+6W4Y0PRDw8SODDWeWU8Pv49IwO7tRx6varEhY=;
 b=xLcIKdGti0f/jloM5dzZc6A5o+pXUv2hi9IzTyFe1ndY7P1f+cXPJT2k0RkfV/JJ+weE2yedaUAyPcKDMhsskE8osRoEwMBglqTyLhl8dumliDThA9cPVni3OLrK0jrh7n7nKhA8U5xU1Ai+b7UMTRD6FgB1qNQ02GG5+OhyeVw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ0PR12MB6808.namprd12.prod.outlook.com (2603:10b6:a03:47a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.17; Fri, 17 Feb
 2023 19:55:19 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 19:55:19 +0000
Message-ID: <fa2d5f75-ec3b-f99c-5ac0-0dcda82d6abd@amd.com>
Date: Fri, 17 Feb 2023 20:55:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/3] drm/debugfs: remove dev->debugfs_list and
 debugfs_mutex
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
References: <20230209081838.45273-1-christian.koenig@amd.com>
 <20230209081838.45273-4-christian.koenig@amd.com>
 <Y+4UdBzk6RkQzcsI@phenom.ffwll.local>
 <f555bda0-80b6-c0bc-566f-0ef49c96da0a@amd.com> <87sff5zhgs.fsf@intel.com>
 <694091b5-dca0-fff5-3dd5-548bfa8733fc@amd.com> <87ilg1zgf2.fsf@intel.com>
 <Y+6JyNNkLdDnxaer@phenom.ffwll.local>
 <4904cea7-3440-1e52-f5ea-71b9069506a6@amd.com>
 <20230217100118.GB2862577@linux.intel.com>
 <Y+/XtJu750cftFuY@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <Y+/XtJu750cftFuY@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ0PR12MB6808:EE_
X-MS-Office365-Filtering-Correlation-Id: edf14603-4062-4a3c-08f5-08db1120e5a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vThCtM6T8+embkhowW6cDx7Ajztot6M82MMsaXiKkQFw3g4mDcv2bZw/tXox/YjwBInLRDg/Qvx9VNfIGxcGKEagPwONlHXtCMqbqJR0FXSQWbaOX99r/1q8duvPy/iPaLZL0731Zvs+Jn/A9AD76eNSZKLyudVuT2iIthFF+wsqBNx+NY9x95qqqwNotDJkPIbV/j6w/NtCO5VedoOfq0poxOtW1WxR1FNqk3Got64xWwgr8RRkqsrxpv5duZywaHG7Yb9m0Swycd5GOPe9phSIMornmoYct3era/xAG3sIm6ODOPlxj79B6kItkC0wDH1a09snmqfrPbadxnNLmz2Gz8Uxkz5Py3nJtDKoXS34OCyrwoCI341puM1TVPrsNh6xtlP6rruGT3hNoAWkVK+XQpnnOtJEyRBR4H8KYfreXztX/3OpWIX+5kkITaJOFQ20AkoMVBj7nA7lAfsiv5X370JQ3gPUHmz4S6Sadeg84HRE+HN2iKHFD2R1GxlM+doDnjsXwFApYzsG/6z04JwCWsAfaWTS4pZ74eRhhUZB6VGpMOeq6wM5wB44n6XpzI8KXl9qfb+8k0i5hB6zh4DgjcHr/wTiqmR4ytK4UO6wtucGu4Mh5qZq44YexPrB0gM5iuaRHWt1bRJWjrezVydbeBKtFDWPhLrsNLR4KC7dbLxSP590Fp1Sv9yn0j7TEKGHuaHXvdNtaU5pcB8c0UkDu7uSEhj0MwKZOoIEn6I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(366004)(396003)(346002)(39860400002)(451199018)(186003)(41300700001)(66556008)(8676002)(66476007)(66946007)(83380400001)(316002)(8936002)(7416002)(4326008)(5660300002)(6666004)(2616005)(478600001)(66574015)(6486002)(6506007)(6512007)(110136005)(36756003)(2906002)(31696002)(86362001)(38100700002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzhCVlZKci9PVUN0azhDYlYvekZyQWhBNHB1QjRqbUpCVTRrTWxwZVMySW5n?=
 =?utf-8?B?VkJCK3BWcHNhQzVjL1l6NVNIejcvU2hab3ZpU1lzRGlKMlZaRlQ0dHV5OEg0?=
 =?utf-8?B?aGVLbWdmTk1BNFUwVDFoMW14YTVBckFWakdTVmo1NzR1bGNBR2hwMk5wbHA5?=
 =?utf-8?B?SFA0V3dZaEppL1E2TWMrdGJNYnRLcXZRajhpeHA2ampiYWg2bnNIMnlyejJY?=
 =?utf-8?B?dVNvT1hoK3U2UFFLb1BCWjdvbHZIQ2tiSnMyVFBRMVFCaUp6VWRqcVFodjZL?=
 =?utf-8?B?RTNROGJHSytvL2FCM3VXOGc4dmpoY093eHh2L0xScTByS2tZd0h0L1FkbERx?=
 =?utf-8?B?eEhnQmtoSU5qK3kvckI0ZndUcjQwYmVDdHBUVUxkOXNHUTNWeVJXSTFaUHVH?=
 =?utf-8?B?ZmtvNTRySkxsa0MvRE1TZmFnakg1LzNuN1Q4SkhTYnN2MWtUWlhxbXlQb1E2?=
 =?utf-8?B?cXJsZXNMb1FUWFAzVlhaZGlOQ1pyc3ZjZ1ZPRHh1Q0NOcGZ6WjZVMVZydUkv?=
 =?utf-8?B?RjBIUkZvTTFNWXViZmwvL1RxL3luM1UvbEgzZlRmMFBteklZci9oZ21ianVH?=
 =?utf-8?B?eFc5RUpacTZwczFYdW9Kc2YwVlh3Rks2eDVuYXArWDg3cHRSMFRjc2lBb3ln?=
 =?utf-8?B?K2lxNWxrSTV5cVFrbGVLelFpeHR2YVRFeUdYa3BKVTRsNldNbVVIQmRoMmds?=
 =?utf-8?B?cVZXMlorL1doa2VXWUpOVmIydWloTVMyZGRzdCs4MkR6VmtHR2xubC9PRnhY?=
 =?utf-8?B?alVycUhsMVVkTnRhUEw5amMzVTc0T01MMHhicFIvTGN4OU4wb0p4ZG1RZHZI?=
 =?utf-8?B?T21Hell0TU9YOGhQTml4RHlJT1lxdzliNUJZYUsyaGV4STJBSmk2WFNTdVQv?=
 =?utf-8?B?blYvL0hSbUxVS0hSZXAwcEc0M29sUGw5Z21tV0RaMWVBS2g4UzRrZmRsT3V1?=
 =?utf-8?B?NlB5RXpBcGNsNXNFcGhnR1hqMTY3OENKNGZLZ2FGL0pJYzhWa1JDaUFKMTZh?=
 =?utf-8?B?U3U3MDd1a00yQ2NlVnRFaDlVOFBodTcxZVhEVDlPcnNzL2E5eHZKMy9YNndu?=
 =?utf-8?B?ZDV2a1BscnI2REx0M0NsdlY5blQyQUtnOUNxWUQ1L0dDNklVTUlQSC9SZWdO?=
 =?utf-8?B?bTVhQ29HUDN6ekVsWG5pU0xMenlldk9lVktQdzM5TEZTZ3J6QUlEWnlPdjVJ?=
 =?utf-8?B?Nk85aGRUR3FiZHhYZFZveUcyektFT2wwWGhwWlNZOTd3MlFOL0kxUFQ5SkRB?=
 =?utf-8?B?aHRJZW9qY3ZNMnNoL2lWK09zcnhOM1g4djQ4TENoTk9LaEVITjF1cFpkZi92?=
 =?utf-8?B?Y2hRS2pxQXhUS1Y0Q2lzdkRnUDdvRzNUQUN2RFJIelhTalRjNUZGTk9OUWRS?=
 =?utf-8?B?aVlyaTFVTElTRWRBSmZRVFpyYXNnYWJXVVd6ZS9PU0plNUh0NVNMdEhmRkJM?=
 =?utf-8?B?VjVSbzBqQUZBSTZ5RkNvWW9tQk9OVmpmeGFnTDFKc0hMbDFyTzFYVmppL2t0?=
 =?utf-8?B?R3BHaEgra0N0YUdjSU1tUU9hUS8xb1ZiaDlQNnViOVoyQzBjL1Y1L3RjVjZ2?=
 =?utf-8?B?WUFhVkZ2TGdnRm1ZRnBzekcyQXhKZjdkWU9Jd2dzb2JzZmlHemhwdFhBcUFx?=
 =?utf-8?B?U2ZEakk1bWgvaEM2enZ0RUN5K3JENGN6SWI2Zzh1ZlZHaHN5QkU1MWkwckFs?=
 =?utf-8?B?WWVsUHB6cWFvRTVwVTRDUnVEcGpER2l1Tmc4Uzc2ZGFJRVRXcmVncncrSGZM?=
 =?utf-8?B?UmcxbEE2SVpoTTZEMElQT1dLeW5COWN6S2NoZ0xtZFhuZWxMbUNOUTBWek5F?=
 =?utf-8?B?cFBBb1puaTJMQWJjOS9IKy9TQmNiUkd1VU1YR0VaR01NcnNYeHNTeEFmUzFU?=
 =?utf-8?B?cUYxZm15MWlxOE5LeGRwTWYyaWV2QWRrcFVKeUVsWEtMbEtHa1V6WnF6MzB4?=
 =?utf-8?B?cm1CaVVUWE0yRFl6TTQxKzdhUWFQUVc3M042bkszRDZsdkhuOXEyYzlONEJh?=
 =?utf-8?B?WUNzVVpCV242WUhyZDJ6dG11VTIxa3lvZVd4RG9EYWwwNTBxdkVpNmlYMGtr?=
 =?utf-8?B?RkVsM09VTEJCS3crVG0xNGxOSVAxSER3dTNzNFFqQXduNnkxbUh4UGhZeHpt?=
 =?utf-8?B?V1RjZzJRTDdybFVqVVFDVHM2R3BBTDRVVDYySWpYejFYMDZHQzJ5cExnL1VD?=
 =?utf-8?Q?Mue/d/GqgwRhXeSRgh0L5bPfjYzSINpslfHOQhD1OacR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edf14603-4062-4a3c-08f5-08db1120e5a9
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 19:55:19.4149 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fzesGpZ/eObicrrtR8C842SdmkA0dc6KflNjIt6HOo82gKFHQ/7WPsXtJEFakww7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6808
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
 mwen@igalia.com, mairacanal@riseup.net, wambui.karugax@gmail.com,
 maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.02.23 um 20:38 schrieb Daniel Vetter:
> On Fri, Feb 17, 2023 at 11:01:18AM +0100, Stanislaw Gruszka wrote:
>> On Fri, Feb 17, 2023 at 10:22:25AM +0100, Christian König wrote:
>>> Am 16.02.23 um 20:54 schrieb Daniel Vetter:
>>>> On Thu, Feb 16, 2023 at 07:08:49PM +0200, Jani Nikula wrote:
>>>>> On Thu, 16 Feb 2023, Christian König <christian.koenig@amd.com> wrote:
>>>>>> Am 16.02.23 um 17:46 schrieb Jani Nikula:
>>>>>>> On Thu, 16 Feb 2023, Christian König <christian.koenig@amd.com> wrote:
>>>>>>>> Am 16.02.23 um 12:33 schrieb Daniel Vetter:
>>>>>>>>> On Thu, Feb 09, 2023 at 09:18:38AM +0100, Christian König wrote:
>>>>>>>>>> The mutex was completely pointless in the first place since any
>>>>>>>>>> parallel adding of files to this list would result in random
>>>>>>>>>> behavior since the list is filled and consumed multiple times.
>>>>>>>>>>
>>>>>>>>>> Completely drop that approach and just create the files directly.
>>>>>>>>>>
>>>>>>>>>> This also re-adds the debugfs files to the render node directory and
>>>>>>>>>> removes drm_debugfs_late_register().
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>>>>>>>> ---
>>>>>>>>>>      drivers/gpu/drm/drm_debugfs.c     | 32 +++++++------------------------
>>>>>>>>>>      drivers/gpu/drm/drm_drv.c         |  3 ---
>>>>>>>>>>      drivers/gpu/drm/drm_internal.h    |  5 -----
>>>>>>>>>>      drivers/gpu/drm/drm_mode_config.c |  2 --
>>>>>>>>>>      include/drm/drm_device.h          | 15 ---------------
>>>>>>>>>>      5 files changed, 7 insertions(+), 50 deletions(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
>>>>>>>>>> index 558e3a7271a5..a40288e67264 100644
>>>>>>>>>> --- a/drivers/gpu/drm/drm_debugfs.c
>>>>>>>>>> +++ b/drivers/gpu/drm/drm_debugfs.c
>>>>>>>>>> @@ -246,31 +246,9 @@ void drm_debugfs_dev_register(struct drm_device *dev)
>>>>>>>>>>      void drm_debugfs_minor_register(struct drm_minor *minor)
>>>>>>>>>>      {
>>>>>>>>>>      	struct drm_device *dev = minor->dev;
>>>>>>>>>> -	struct drm_debugfs_entry *entry, *tmp;
>>>>>>>>>>      	if (dev->driver->debugfs_init)
>>>>>>>>>>      		dev->driver->debugfs_init(minor);
>>>>>>>>>> -
>>>>>>>>>> -	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
>>>>>>>>>> -		debugfs_create_file(entry->file.name, 0444,
>>>>>>>>>> -				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
>>>>>>>>>> -		list_del(&entry->list);
>>>>>>>>>> -	}
>>>>>>>>>> -}
>>>>>>>>>> -
>>>>>>>>>> -void drm_debugfs_late_register(struct drm_device *dev)
>>>>>>>>>> -{
>>>>>>>>>> -	struct drm_minor *minor = dev->primary;
>>>>>>>>>> -	struct drm_debugfs_entry *entry, *tmp;
>>>>>>>>>> -
>>>>>>>>>> -	if (!minor)
>>>>>>>>>> -		return;
>>>>>>>>>> -
>>>>>>>>>> -	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
>>>>>>>>>> -		debugfs_create_file(entry->file.name, 0444,
>>>>>>>>>> -				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
>>>>>>>>>> -		list_del(&entry->list);
>>>>>>>>>> -	}
>>>>>>>>>>      }
>>>>>>>>>>      int drm_debugfs_remove_files(const struct drm_info_list *files, int count,
>>>>>>>>>> @@ -343,9 +321,13 @@ void drm_debugfs_add_file(struct drm_device *dev, const char *name,
>>>>>>>>>>      	entry->file.data = data;
>>>>>>>>>>      	entry->dev = dev;
>>>>>>>>>> -	mutex_lock(&dev->debugfs_mutex);
>>>>>>>>>> -	list_add(&entry->list, &dev->debugfs_list);
>>>>>>>>>> -	mutex_unlock(&dev->debugfs_mutex);
>>>>>>>>>> +	debugfs_create_file(name, 0444, dev->primary->debugfs_root, entry,
>>>>>>>>>> +			    &drm_debugfs_entry_fops);
>>>>>>>>>> +
>>>>>>>>>> +	/* TODO: This should probably only be a symlink */
>>>>>>>>>> +	if (dev->render)
>>>>>>>>>> +		debugfs_create_file(name, 0444, dev->render->debugfs_root,
>>>>>>>>>> +				    entry, &drm_debugfs_entry_fops);
>>>>>>>>> Nope. You are fundamentally missing the point of all this, which is:
>>>>>>>>>
>>>>>>>>> - drivers create debugfs files whenever they want to, as long as it's
>>>>>>>>>       _before_ drm_dev_register is called.
>>>>>>>>>
>>>>>>>>> - drm_dev_register will set them all up.
>>>>>>>>>
>>>>>>>>> This is necessary because otherwise you have the potential for some nice
>>>>>>>>> oops and stuff when userspace tries to access these files before the
>>>>>>>>> driver is ready.
>>>>>>>>>
>>>>>>>>> Note that with sysfs all this infrastructure already exists, which is why
>>>>>>>>> you can create sysfs files whenever you feel like, and things wont go
>>>>>>>>> boom.
>>>>>>>> Well Yeah I've considered that, I just don't think it's a good idea for
>>>>>>>> debugfs.
>>>>>>>>
>>>>>>>> debugfs is meant to be a helper for debugging things and that especially
>>>>>>>> includes the time between drm_dev_init() and drm_dev_register() because
>>>>>>>> that's where we probe the hardware and try to get it working.
>>>>>>>>
>>>>>>>> Not having the debugfs files which allows for things like hardware
>>>>>>>> register access and reading internal state during that is a really and I
>>>>>>>> mean REALLY bad idea. This is essentially what we have those files for.
>>>>>>> So you mean you want to have early debugfs so you can have some script
>>>>>>> hammering the debugfs to get info out between init and register during
>>>>>>> probe?
>>>>>> Well not hammering. What we usually do in bringup is to set firmware
>>>>>> timeout to infinity and the driver then sits and waits for the hw.
>>>>>>
>>>>>> The tool used to access registers then goes directly through the PCI bar
>>>>>> at the moment, but that's essentially a bad idea for registers which you
>>>>>> grab a lock for to access (like index/data).
>>>>>>
>>>>>>> I just think registering debugfs before everything is ready is a recipe
>>>>>>> for disaster. All of the debugfs needs to check all the conditions that
>>>>>>> they need across all of the probe stages. It'll be difficult to get it
>>>>>>> right. And you'll get cargo culted checks copy pasted all over the
>>>>>>> place.
>>>>>> Yeah, but it's debugfs. That is not supposed to work under all conditions.
>>>>>>
>>>>>> Just try to read amdgpu_regs on a not existing register index. This will
>>>>>> just hang or reboot your box immediately on APUs.
>>>>> I'm firmly in the camp that debugfs does not need to work under all
>>>>> conditions, but that it must fail gracefully instead of crashing.
>>>> Yeah I mean once we talk bring-up, you can just hand-roll the necessary
>>>> bring debugfs things that you need to work before the driver is ready to
>>>> do anything.
>>>>
>>>> But bring-up debugfs fun is rather special, same way pre-silicon support
>>>> tends to be rather special. Shipping that in distros does not sound like a
>>>> good idea at all to me.
>>> Yeah, that's indeed a really good point.
>>>
>>> I can't remember how often I had to note that module parameters would also
>>> be used by end users.
>>>
>>> How about if the create the debugfs directory with a "." as name prefix
>>> first and then rename it as soon as the device is registered?
>> Good idea. Or the dir could have this drm_dev->unique name and be created
>> during alloc, and link in minor created during registration. That would
>> mean minor link is safe to use and unique potentially dangerous before
>> registration.
>>
>>> Alternatively
>>> we could clear the i_mode of the directory.
>> I checked that yesterday and this does not prevent to access the file
>> for root user. Perhaps there is other smart way for blocking
>> root access in vfs just by modifying some inode field, but just
>> 'chmod 0000 file' does not prevent that.
>>
>>> If a power user or engineer wants to debug startup problems stuff it should
>>> be trivial to work around that from userspace, and if people do such things
>>> they should also know the potential consequences.
>> Fully agree.
> So what about a drm module option instead (that taints the kernel as usual
> for these), which:
> - registers the debugfs dir right away
> - registers any debugfs files as soon as they get populated, instead of
>    postponing until drm_dev_register

Yeah, works for me as well.

> It would only neatly work with the add_file stuff, but I guess drivers
> could still hand-roll this if needed.
>
> I think funny games with trying to hide the files while not hiding them is
> not a great idea, and explicit "I'm debugging stuff, please stand back"
> knob sounds much better to me.

Well the challenge is that we have to consider the whole spectrum of end 
users for this. This reaches from the grandmother which just tries every 
possible random knob to get her printer working again over the script 
kiddie all the wait to the power users and engineers.

Some option to give an experience level to module parameters would be 
rather helpful.

Christian.

> -Daniel
>
>> Regards
>> Stanislaw
>>

