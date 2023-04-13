Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0A56E0B70
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 12:34:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 552A410EAB6;
	Thu, 13 Apr 2023 10:34:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2083.outbound.protection.outlook.com [40.107.244.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1F2310E1E4;
 Thu, 13 Apr 2023 10:34:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mLHwXpVP9nuss24i07N2cQuwtlk3C9KtEz6uYtWv4AhUuu+/gJcwKSMrfzGLFvxF7zHS3cKxWOVo0HUhz7jT11N3+6sLtAJyldJHbJTcsX29Z2jHsWllHCXqnqdFpRf4s9yOsfgreCL8J3YlyIvcUrQlXP7O4+gqeUhrYO0EXwqNkIdjUIo+spZWPqByc5YvgIqkC9S4fwlSE6nVSD4H+6NhY2meeXU3ZCVWnwCKdE+uoI9jz5BRQx4ZeRRY4UWGFxftKE00jSTsWMBVH389dfdOCbbv/fj1+W07tVoDamYPZJl9D06s3WfxTfqr+TMPpCKsLL3eL+8ouB87MCUAqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6IoYGwPqzFOU96283GTtRQtQIDuEGHYZA0fb6UrpAR4=;
 b=NLPtSHyYbnCpIJRw2Q93l+nptwxGgfqur0HswgY+2csKjHEhAvoU0W1FFZwyhUNjujkJuIxLtvSsqs0SRxExqLi2LduWJbNv0+jGcMbnzFzU5aXO1JhspnDhKPC8VEF30oVtMf8ahvztiwO7CLPkML9ibRNzrREiuVIy3I+L3ppN3ANKqzB1TpRydxAbH/3qUJR+kmcd0lIJJqjLn6kX3OZHTKueTkZV1vEySbG2XPeKvtsvCmFd7wvP5XR3XAI5KYOH9xEEcgTjLDQyThmNEF98Zs3Fv6Q7eC1ncDleK/BzjcvZ66Ll+EXA2GLP2T4I+E4wQP7pW1BE1yrLPYC0Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6IoYGwPqzFOU96283GTtRQtQIDuEGHYZA0fb6UrpAR4=;
 b=HanK2eD1GloyO5Rz0g5m82ekecGXfSJAWdQ/2SccZJF1UDSdaFfBypQrCmDZ7X7jLqTbKmKLU9IR5mw9KKviYK/ga3ajHL/js4c3mPWfTgCIIW0/t7q9ZyMFWR99ti7/taS/JHg+ru6VcpKpIQxMboc4xncqOT0a9pUvhY9Xjog=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by SJ0PR12MB8113.namprd12.prod.outlook.com (2603:10b6:a03:4e0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 10:34:28 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::e208:1fec:a14e:eadb]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::e208:1fec:a14e:eadb%4]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 10:34:28 +0000
Message-ID: <d862a882-4ecf-dde2-7b41-557f1230ea0e@amd.com>
Date: Thu, 13 Apr 2023 12:34:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 1/6] drm: Add common fdinfo helper
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Christopher Healy <healych@amazon.com>,
 Emil Velikov <emil.l.velikov@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20230412224311.23511-1-robdclark@gmail.com>
 <20230412224311.23511-2-robdclark@gmail.com>
 <ce87917c-6cf1-b1e7-4782-61a7e47aa92d@amd.com>
 <ZDfBZIuiAuMhuULd@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZDfBZIuiAuMhuULd@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM3PR03CA0066.eurprd03.prod.outlook.com
 (2603:10a6:207:5::24) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3589:EE_|SJ0PR12MB8113:EE_
X-MS-Office365-Filtering-Correlation-Id: 4019378f-1124-4ff9-5f29-08db3c0aa899
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zROIpo8rDj30rV4kg3DaYSMIoT0MbwtIGEUdwfOz25wrtnuUkM1UTKXJnoLkIqsxNJv71ws+GjygQv3P+/y7o3KS5qRI2jZkDApvKUOr6ZuMdVF//esYms2YeqCc2oFnzH26RuiwuuqSvCv/pwXhF/e0ESVQYZxRssexZkNOOi7D7V8WvLtUXUYmqc+znQp88eKOuM2dehdkIGJj3vjqs4rwtXbywFdeUv3DoOv/xyqA2N74M6MX/bBNaVVhh8gTHBhubw5/qljwj57QbfRloWOG9LQedESgO0sgOJ0tcDfy6sQfd4FieWU1WwPPvjeIk1EKSGRGgptKWUSMN/tTh4vUslDc0j+7HWn4QK2HVSzZ6g5rUvytGh6TF5e1VmmJOSqwq9s+2OMDj/6B0Bk3JFa7xAIFDWTF9liFlhzuzNHC1jNbsvTG27y6oPqwjqpKBa8U2w8hkzdNJWYDLoFpXepIDF16UK7O3FHaI7cEp669M0fes8ULxUSWMe7a3mR88UE00TCAOryUpm+IQEAxM5C/0nDiEJSSIyf7HT6x4FO3BuWfyjjpAIXjndQ8PhnsMNOoxeBFeFmlS7V9Mj8FqsCexBb4Suk8iFShfPy3r3K3+KgRLKpqdN4RvnbTlS2A1EPwzhW8GVmM/KXvP9h4bJDGPE2cUA8U3npdd6oCJO8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(136003)(396003)(376002)(39860400002)(346002)(451199021)(316002)(38100700002)(66556008)(66946007)(66476007)(2616005)(5660300002)(41300700001)(66574015)(6666004)(31686004)(36756003)(86362001)(6486002)(31696002)(6512007)(6506007)(26005)(186003)(2906002)(83380400001)(7416002)(8676002)(8936002)(478600001)(921005)(110136005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFpCK05hdzRwRTJWdFFFNERXdlpad05SendFK01PVm5Bd0t3R2xEQmxFSUxU?=
 =?utf-8?B?VndSMHFPZ2dsS1lhTDliWW92UGJsZHVkYTJTNmk4dWZQL2VRL3g2bklpRVhC?=
 =?utf-8?B?a1d6TEJMNWhwcm8yN0xmK0NqRU4vajdiZHRFMjhBZzRnMkl4K3ZJS0NkVXRG?=
 =?utf-8?B?OVJyYnMzbnl4dXVHL2lXRTROZG5rV1JDeWF4NWlvazJ2bGJuY3FJbzJ3V3FV?=
 =?utf-8?B?dENnTldtN2h4UjU1cjAwY21MWU4wR0pVWTZhSzRnZHo5aHpYaXVyanB6Y1M1?=
 =?utf-8?B?NUVKVEJKdDB3dW9USG5ka3JSSFZCRkZYeXhwSmdrU0FibGtHWFpvSS93ZnU5?=
 =?utf-8?B?QnNGWEJQbEsrcjRVWUtvS2Q4NUl1RC9MTzc0VTVDamxoVFVUMEI5eHRiVFhj?=
 =?utf-8?B?NDBtSTZPVGpLWDFuRUZveFdqQXN5aElyTWsrTkZaQ2FmeE9RSkV3Um1Wdlp2?=
 =?utf-8?B?U3NXTzRFVHBuT0lwR2lIaHFYUkZHQ2szcGVxNlRZTUV0Y3Y3cVdKeHAzMEd1?=
 =?utf-8?B?b2hZaS9yclZmNC9YenMzK2paOWFXYWo3ZHI0TlQ3c0krSHFBUTZXbUdHb1Jh?=
 =?utf-8?B?YkZqSFdJZng2ZHpqb2JGU3VHc1g5RGFyejRZaUZsWW9JaDZ3Vk14K0F3amwy?=
 =?utf-8?B?bEdoV3NEWUVBZWVIdGk2Zk1mV0pIeTYvS3EvL2t0LzVFZjBud0NrcG1BeVhi?=
 =?utf-8?B?V1VGOWpZN1JzYmVPZFAzRFhURFlpQ3pLZTl5angyMGt3cmFrNlVVMDlVazEw?=
 =?utf-8?B?cUlLMzgzckVRZjY2ckVucFF2b2xjSEhWNUhVMUxKNFJEUkF5RWo5Q0tJS3Q1?=
 =?utf-8?B?NStqZmJIaDV3WXVjMzgyWnY1ckMxUW92eTRxTjlPU0swOG5iT0VnOUJ1QWhQ?=
 =?utf-8?B?L3JnV0plRS9CK3VuS0xYL0ZOTjFzdENtcllBZjI4UHNoeTVuUkVSMXVnTE9K?=
 =?utf-8?B?Y3dIeXcwMi9KcXVZK01FVVNiL2FpUjRraWpDbUhTWVpXTEZ1dk4wZ3M5cUVX?=
 =?utf-8?B?RGk3Mm53UU9iRFNKNzR5bXpUY0d0Z2VTcGxwZTRQR0U0emFIUXVUb2R3R1o4?=
 =?utf-8?B?TmVNbHBHdFk3YTNSUVNoMDNRb3o3SVpXekNteXgycVhVRFp5dHE2ZEFwa0x4?=
 =?utf-8?B?aENyeGlDRVo2TENQeFdPaS8zRGtpWUJjK25SMXZtRzd0aXREQ3VmYUlDODRL?=
 =?utf-8?B?NkVXazdEd3lrdUxUVWkxQzJwY1dKS1V4bzRzY0JBOE9rTXZXWkZvcDQ3VjQ4?=
 =?utf-8?B?eW13aGZ4eDlubUF4eTBIQjJwZjEreFpON2d2eHpveXpIdEd1azVwUWs2TmJy?=
 =?utf-8?B?Q2VFRVlRMU1ZN2M1Y2NHV1VlK3dWUlBzWS85OHFzSmpQQzJReHRIREx0Smti?=
 =?utf-8?B?SUdlZFRUdndWTEFGcWVkNk9iQjNhTi9DQ3FsNWxBUnZ0SXBpbXduMjFRRm1P?=
 =?utf-8?B?ZzRKRFMxcFRlcitsT3hVUGQxM2dpalVxMUpieVlRK0xLTnpJanFJZzRTWWR6?=
 =?utf-8?B?VGtjVW5ENDl2S0JxVjFsTUdNdjRvVU04Rit5WEIrNWlyYm5HTVl3clZLbWpM?=
 =?utf-8?B?d2ExQWNReXA3ZHpqTUpFcWxSVzBvWXZvZGwrTG1KWXNodzhlNTZCK1ppWkM2?=
 =?utf-8?B?RkJFU1VLMGZaaWI3cStyRFNFQWN0MFZhN2w0bnNuNkk1bWZhZUhvcjdiT3lS?=
 =?utf-8?B?dEpGZDhDYjlKRnByOG9jc0wzdHVtTkhubXE5VU0rbE5kWUZGYW9yL0RlWmNn?=
 =?utf-8?B?RVhoeHpxaWJGTTNBa0w3RXZ1cVNzUG44YTRlSS94U1dJQ2YzMWVIWFJubXBn?=
 =?utf-8?B?NktycjhNTGw0Qk9rVjA3dnJub2ZNR2NxT1FyR3Y1aEJxSlF1WTh2aU8wVnhM?=
 =?utf-8?B?OTZ3eFZUd2Y0VkxWMjh2STF4TVprYXdoVVpIelB4WVlUSDh1dFEvQ3NlaDVa?=
 =?utf-8?B?QUd4TGtkMGVzNUJHa0JxQi93S0VGTFh5bk8zY3puUHdHSnc2UTJpTmsxSUdy?=
 =?utf-8?B?WjM0UHE2cjIzOGNhTGVvcVBxMjdlSEFsNFc2UEFJb0hUVlZpRWFTQWRDSWJ4?=
 =?utf-8?B?ZVgwM0YwdkMrYmZVaTlKSHpReWVaaWZPUllxYlNJYmlESjJML3pqSkRqc1hB?=
 =?utf-8?Q?heMk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4019378f-1124-4ff9-5f29-08db3c0aa899
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 10:34:28.2592 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v2WbGx87gR4DUWC6rJ1nih+ETWupX/mZ5yfseTnkwGv+oyYOI6NlQVBvK45tKfaQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8113
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

Am 13.04.23 um 10:46 schrieb Daniel Vetter:
> On Thu, Apr 13, 2023 at 10:07:11AM +0200, Christian König wrote:
>> Am 13.04.23 um 00:42 schrieb Rob Clark:
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> Handle a bit of the boiler-plate in a single case, and make it easier to
>>> add some core tracked stats.
>>>
>>> v2: Update drm-usage-stats.rst, 64b client-id, rename drm_show_fdinfo
>>>
>>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>> ---
>>>    Documentation/gpu/drm-usage-stats.rst | 10 +++++++-
>>>    drivers/gpu/drm/drm_file.c            | 35 +++++++++++++++++++++++++++
>>>    include/drm/drm_drv.h                 |  7 ++++++
>>>    include/drm/drm_file.h                |  4 +++
>>>    4 files changed, 55 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
>>> index b46327356e80..2ab32c40e93c 100644
>>> --- a/Documentation/gpu/drm-usage-stats.rst
>>> +++ b/Documentation/gpu/drm-usage-stats.rst
>>> @@ -126,7 +126,15 @@ percentage utilization of the engine, whereas drm-engine-<str> only reflects
>>>    time active without considering what frequency the engine is operating as a
>>>    percentage of it's maximum frequency.
>>> +Implementation Details
>>> +======================
>>> +
>>> +Drivers should use drm_show_fdinfo() in their `struct file_operations`, and
>>> +implement &drm_driver.show_fdinfo if they wish to provide any stats which
>>> +are not provided by drm_show_fdinfo().  But even driver specific stats should
>>> +be documented above and where possible, aligned with other drivers.
>> I'm really wondering if it wouldn't be less mid-layering if we let the
>> drivers call the drm function to print the common values instead of the
>> other way around?
> The idea is that we plug this into DRM_GEM_FOPS and then everyone gets it
> by default. So it's a bit a tradeoff between midlayering and having
> inconsistent uapi between drivers. And there's generic tools that parse
> this, so consistency across drivers is good.
>
> My gut feeling was that after a bit of experimenting with lots of
> different drivers for fdinfo stuff it's time to push for a bit more
> standardization and less fragmentation.

Yeah, that's indeed a trade of.

>
> We can of course later on course-correct and shuffle things around again,
> e.g. by pushing more things into the gem_bo_fops->status hook (ttm and
> other memory manager libs could implement a decent one by default), or
> moving more into the drm_driver->show_fdinfo callback again.
>
> If you look at kms we also shuffle things back&forth between core (for
> more consistency) and drivers (for more flexibility where needed).
>
> The important part here imo is that we start with some scaffolding to be
> able to do this. Like another thing that I think we want is some
> drm_fdinfo_print functions that make sure the formatting is guaranteed
> consistents and we don't trip up parsers (like some drivers use " \t" as
> separator instead of just "\t", I guess by accident).

That's indeed a bit ugly and should probably be fixed on a higher level 
in the fs code.

Something like fdinfo_print(seq, name, format, value);

>
>> Apart from thatquestion the patch looks good to me.
> Ack? Or want the above recorded in the commit message, I think it'd make
> sense to put it there.

Well if Rob mentions this trade of in the commit message or even better 
code document feel free to add my rb to the patch.

Christian.

> -Daniel
>
>> Christian.
>>
>>> +
>>>    Driver specific implementations
>>> -===============================
>>> +-------------------------------
>>>    :ref:`i915-usage-stats`
>>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>>> index a51ff8cee049..6d5bdd684ae2 100644
>>> --- a/drivers/gpu/drm/drm_file.c
>>> +++ b/drivers/gpu/drm/drm_file.c
>>> @@ -148,6 +148,7 @@ bool drm_dev_needs_global_mutex(struct drm_device *dev)
>>>     */
>>>    struct drm_file *drm_file_alloc(struct drm_minor *minor)
>>>    {
>>> +	static atomic64_t ident = ATOMIC_INIT(0);
>>>    	struct drm_device *dev = minor->dev;
>>>    	struct drm_file *file;
>>>    	int ret;
>>> @@ -156,6 +157,8 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
>>>    	if (!file)
>>>    		return ERR_PTR(-ENOMEM);
>>> +	/* Get a unique identifier for fdinfo: */
>>> +	file->client_id = atomic64_inc_return(&ident);
>>>    	file->pid = get_pid(task_pid(current));
>>>    	file->minor = minor;
>>> @@ -868,6 +871,38 @@ void drm_send_event(struct drm_device *dev, struct drm_pending_event *e)
>>>    }
>>>    EXPORT_SYMBOL(drm_send_event);
>>> +/**
>>> + * drm_show_fdinfo - helper for drm file fops
>>> + * @seq_file: output stream
>>> + * @f: the device file instance
>>> + *
>>> + * Helper to implement fdinfo, for userspace to query usage stats, etc, of a
>>> + * process using the GPU.  See also &drm_driver.show_fdinfo.
>>> + *
>>> + * For text output format description please see Documentation/gpu/drm-usage-stats.rst
>>> + */
>>> +void drm_show_fdinfo(struct seq_file *m, struct file *f)
>>> +{
>>> +	struct drm_file *file = f->private_data;
>>> +	struct drm_device *dev = file->minor->dev;
>>> +	struct drm_printer p = drm_seq_file_printer(m);
>>> +
>>> +	drm_printf(&p, "drm-driver:\t%s\n", dev->driver->name);
>>> +	drm_printf(&p, "drm-client-id:\t%llu\n", file->client_id);
>>> +
>>> +	if (dev_is_pci(dev->dev)) {
>>> +		struct pci_dev *pdev = to_pci_dev(dev->dev);
>>> +
>>> +		drm_printf(&p, "drm-pdev:\t%04x:%02x:%02x.%d\n",
>>> +			   pci_domain_nr(pdev->bus), pdev->bus->number,
>>> +			   PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
>>> +	}
>>> +
>>> +	if (dev->driver->show_fdinfo)
>>> +		dev->driver->show_fdinfo(&p, file);
>>> +}
>>> +EXPORT_SYMBOL(drm_show_fdinfo);
>>> +
>>>    /**
>>>     * mock_drm_getfile - Create a new struct file for the drm device
>>>     * @minor: drm minor to wrap (e.g. #drm_device.primary)
>>> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
>>> index 5b86bb7603e7..5edf2a13733b 100644
>>> --- a/include/drm/drm_drv.h
>>> +++ b/include/drm/drm_drv.h
>>> @@ -401,6 +401,13 @@ struct drm_driver {
>>>    			       struct drm_device *dev, uint32_t handle,
>>>    			       uint64_t *offset);
>>> +	/**
>>> +	 * @show_fdinfo:
>>> +	 *
>>> +	 * Print device specific fdinfo.  See Documentation/gpu/drm-usage-stats.rst.
>>> +	 */
>>> +	void (*show_fdinfo)(struct drm_printer *p, struct drm_file *f);
>>> +
>>>    	/** @major: driver major number */
>>>    	int major;
>>>    	/** @minor: driver minor number */
>>> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
>>> index 0d1f853092ab..6de6d0e9c634 100644
>>> --- a/include/drm/drm_file.h
>>> +++ b/include/drm/drm_file.h
>>> @@ -258,6 +258,9 @@ struct drm_file {
>>>    	/** @pid: Process that opened this file. */
>>>    	struct pid *pid;
>>> +	/** @client_id: A unique id for fdinfo */
>>> +	u64 client_id;
>>> +
>>>    	/** @magic: Authentication magic, see @authenticated. */
>>>    	drm_magic_t magic;
>>> @@ -437,6 +440,7 @@ void drm_send_event(struct drm_device *dev, struct drm_pending_event *e);
>>>    void drm_send_event_timestamp_locked(struct drm_device *dev,
>>>    				     struct drm_pending_event *e,
>>>    				     ktime_t timestamp);
>>> +void drm_show_fdinfo(struct seq_file *m, struct file *f);
>>>    struct file *mock_drm_getfile(struct drm_minor *minor, unsigned int flags);

